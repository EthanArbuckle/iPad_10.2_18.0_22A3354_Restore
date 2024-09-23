@implementation RPCSingleQuery

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("RPCSingleQuery"));
}

- (id)getQueryRequest:(id *)a3
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPCSingleQuery request](self, "request"));

  if (v5)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[RPCSingleQuery request](self, "request"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyGPBMessage parseFromData:error:](QueryRequest, "parseFromData:error:", v6, a3));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDatabase, -133, CFSTR("No query request saved for RPC")));
    v6 = v7;
    if (a3 && v7)
    {
      v6 = objc_retainAutorelease(v7);
      v5 = 0;
      *a3 = v6;
    }
  }

  return v5;
}

- (id)getQueryResponse:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPCSingleQuery response](self, "response"));

  if (!v5)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorDatabase, -341, CFSTR("No query response saved for RPC")));
    v10 = v12;
    if (a3 && v12)
    {
      v10 = objc_retainAutorelease(v12);
      v5 = 0;
      *a3 = v10;
    }
    goto LABEL_12;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPCSingleQuery response](self, "response"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyGPBMessage parseFromData:error:](QueryResponse, "parseFromData:error:", v6, a3));

  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPCSingleQuery serverHint](self, "serverHint"));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPCSingleQuery serverHint](self, "serverHint"));
      objc_msgSend(v5, "setMetadataValue:key:", v8, kTransparencyResponseMetadataKeyServerHint);

    }
    if (-[RPCSingleQuery usedReversePush](self, "usedReversePush"))
      objc_msgSend(v5, "setMetadataValue:key:", CFSTR("YES"), CFSTR("APS"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RPCSingleQuery responseTime](self, "responseTime"));

    if (v9)
    {
      v10 = (id)objc_claimAutoreleasedReturnValue(-[RPCSingleQuery responseTime](self, "responseTime"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "kt_dateToString"));
      objc_msgSend(v5, "setMetadataValue:key:", v11, CFSTR("ResponseTime"));

LABEL_12:
    }
  }
  return v5;
}

@end
