@implementation MCAppleServicesPayloadHandler

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  return -[MCAppleServicesPayloadHandler _installOutError:](self, "_installOutError:", a6, a4, a5);
}

- (void)remove
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v4 = objc_msgSend(v3, "isSetAside");

  if ((v4 & 1) == 0)
    -[MCAppleServicesPayloadHandler _remove](self, "_remove");
}

- (void)unsetAside
{
  -[MCAppleServicesPayloadHandler _installOutError:](self, "_installOutError:", 0);
}

- (BOOL)_installOutError:(id *)a3
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hashDictionaries"));
  LOBYTE(a3) = -[MCAppleServicesPayloadHandler setAdditions:outError:](self, "setAdditions:outError:", v6, a3);

  return (char)a3;
}

- (void)_remove
{
  -[MCAppleServicesPayloadHandler setAdditions:outError:](self, "setAdditions:outError:", 0, 0);
}

- (id)applicationID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "profile"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUID"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataUsingEncoding:", 4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dataUsingEncoding:", 4));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "base64EncodedStringWithOptions:", 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "base64EncodedStringWithOptions:", 0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.configurationprofiles.%@.%@"), v10, v11));

  return v12;
}

- (BOOL)setAdditions:(id)a3 outError:(id *)a4
{
  id v5;

  v5 = a3;
  LOBYTE(self) = SecTrustStoreSetTransparentConnectionPins(-[MCAppleServicesPayloadHandler applicationID](self, "applicationID"), v5, 0);

  return (char)self;
}

@end
