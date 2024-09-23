@implementation SDAppleIDURLResponse

- (SDAppleIDURLResponse)initWithHTTPUTLResponse:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  SDAppleIDURLResponse *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v16;
  id v17;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SDAppleIDURLResponse;
  v8 = -[SDAppleIDURLResponse init](&v18, "init");
  if (v8)
  {
    v8->_statusCode = (int64_t)objc_msgSend(v6, "statusCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "MIMEType"));
    v10 = objc_msgSend(v9, "hasPrefix:", CFSTR("application/json"));

    if (v10)
    {
      v17 = 0;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v7, 0, &v17));
      v13 = v17;
      if (v11)
      {
        v14 = objc_opt_class(NSDictionary, v12);
        if ((objc_opt_isKindOfClass(v11, v14) & 1) != 0)
        {
          objc_storeStrong((id *)&v8->_responseInfo, v11);
        }
        else if (dword_1007B2078 <= 60
               && (dword_1007B2078 != -1 || _LogCategory_Initialize(&dword_1007B2078, 60)))
        {
          LogPrintF(&dword_1007B2078, "-[SDAppleIDURLResponse initWithHTTPUTLResponse:data:]", 60, "### JSON object not a dictionary\n");
        }
      }
      else
      {
        if (dword_1007B2078 <= 60
          && (dword_1007B2078 != -1 || _LogCategory_Initialize(&dword_1007B2078, 60)))
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedDescription"));
          LogPrintF(&dword_1007B2078, "-[SDAppleIDURLResponse initWithHTTPUTLResponse:data:]", 60, "### JSON -> Data failed with error %@\n", v16);

        }
        v11 = 0;
      }
    }
    else
    {
      v11 = 0;
      v13 = 0;
    }

  }
  return v8;
}

- (NSDictionary)responseInfo
{
  return self->_responseInfo;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseInfo, 0);
}

@end
