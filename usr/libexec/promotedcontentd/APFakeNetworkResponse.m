@implementation APFakeNetworkResponse

- (BOOL)loadConfig:(id)a3
{
  id v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  v5 = CFSTR("debug-http-status");
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("debug-http-status")));
  if (v6
    || (v5 = CFSTR("debug-communication-code"),
        (v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("debug-communication-code")))) != 0))
  {
    v7 = (void *)v6;
    -[APFakeNetworkResponse setHeaderName:](self, "setHeaderName:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringValue"));
    -[APFakeNetworkResponse setHeaderValue:](self, "setHeaderValue:", v8);

    v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)addFakeResponseHeadersToHeaders:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  if (!v4)
    goto LABEL_6;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APFakeNetworkResponse headerName](self, "headerName"));
  if (!objc_msgSend(v5, "length"))
  {

    goto LABEL_6;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APFakeNetworkResponse headerValue](self, "headerValue"));
  v7 = objc_msgSend(v6, "length");

  if (!v7)
  {
LABEL_6:
    v11 = v4;
    goto LABEL_7;
  }
  v8 = objc_msgSend(v4, "mutableCopy");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[APFakeNetworkResponse headerValue](self, "headerValue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[APFakeNetworkResponse headerName](self, "headerName"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v10);

  v11 = objc_msgSend(v8, "copy");
LABEL_7:

  return v11;
}

- (NSString)headerName
{
  return self->_headerName;
}

- (void)setHeaderName:(id)a3
{
  objc_storeStrong((id *)&self->_headerName, a3);
}

- (NSString)headerValue
{
  return self->_headerValue;
}

- (void)setHeaderValue:(id)a3
{
  objc_storeStrong((id *)&self->_headerValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerValue, 0);
  objc_storeStrong((id *)&self->_headerName, 0);
}

@end
