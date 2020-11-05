#!/bin/bash
## https://duo.com/docs/authapi#api-details
## Ported to bash by: Giedrius Tuminauskas <giedrius@tuminauskas.lt>
## All requests must have "Authorization" and "Date" headers.
## Component	Example
## ----------------------------------------------------------------------------
## date			RFC 2822. Tue, 21 Aug 2012 17:29:18 -0000
## method		POST
## host			api-xxxxxxxx.duosecurity.com
## path			/accounts/v1/account/list
## params		realname=First%20Last&username=root

API_SUB="api-xxxxxxxx"
API_DOM="duosecurity.com"
API="$API_SUB.$API_DOM"
IKEY="DIWJ8X6AEYOR5OMC6TQ1"
SKEY="Zh5eGmUq9zpfQnyUIu5OL9iWoMMv5ZNmk3zLJ4Ep"
#DATE="$(date -R)"
DATE="Tue, 21 Aug 2012 17:29:18 -0000"
URLPATH="/accounts/v1/account/list"
METHOD="POST"
PARAMS="realname=First%20Last&username=root"

NL=$'\n'
MESSAGE="$DATE${NL}$METHOD${NL}$API${NL}$URLPATH${NL}$PARAMS"
HMAC=$(printf "%s" "$MESSAGE" | openssl sha1 -hmac "$SKEY" | cut -d" " -f 2)
AUTH=$(echo -n "$IKEY:$HMAC" | base64 -w0)

echo "curl --request $METHOD \
	-H \"Content-Type: application/x-www-form-urlencoded\" \
	-H \"Date: $DATE\" \
	-H \"Authorization: Basic $AUTH\" \
	https://$API$URLPATH"
