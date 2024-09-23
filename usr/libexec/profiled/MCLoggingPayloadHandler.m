@implementation MCLoggingPayloadHandler

- (BOOL)_installAndReturnError:(id *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "loggingPayload"));
  LOBYTE(a3) = MCOSLogInstallProfilePayload(v5, a3);

  return (char)a3;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  BOOL v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v17;

  v17 = 0;
  v8 = -[MCLoggingPayloadHandler _installAndReturnError:](self, "_installAndReturnError:", &v17, a4, a5);
  v9 = v17;
  if (!v8)
  {
    v10 = MCInstallationErrorDomain;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "friendlyName"));
    v13 = MCErrorArray(CFSTR("ERROR_PAYLOAD_FAILED_P_ID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v10, 4001, v14, v9, MCErrorTypeFatal, v12, 0));

    if (a6)
      *a6 = objc_retainAutorelease(v15);

  }
  return v8;
}

- (void)_remove
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "loggingPayload"));
  MCOSLogRemoveProfilePayload(v2, 0);

}

- (void)remove
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v4 = objc_msgSend(v3, "isSetAside");

  if ((v4 & 1) == 0)
    -[MCLoggingPayloadHandler _remove](self, "_remove");
}

- (void)unsetAside
{
  -[MCLoggingPayloadHandler _installAndReturnError:](self, "_installAndReturnError:", 0);
}

@end
