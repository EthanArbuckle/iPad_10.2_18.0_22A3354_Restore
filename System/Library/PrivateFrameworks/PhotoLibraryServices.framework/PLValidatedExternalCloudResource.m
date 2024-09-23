@implementation PLValidatedExternalCloudResource

- (PLValidatedExternalCloudResource)initWithCloudResource:(id)a3
{
  id v4;
  PLValidatedExternalCloudResource *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PLValidatedExternalCloudResource;
  v5 = -[PLValidatedExternalResource init](&v12, sel_init);
  if (v5)
  {
    -[PLValidatedExternalCloudResource setCloudLocalState:](v5, "setCloudLocalState:", objc_msgSend(v4, "cloudLocalState"));
    objc_msgSend(v4, "dateCreated");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLValidatedExternalCloudResource setMasterDateCreated:](v5, "setMasterDateCreated:", v6);

    objc_msgSend(v4, "lastOnDemandDownloadDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLValidatedExternalCloudResource setLastOnDemandDownloadDate:](v5, "setLastOnDemandDownloadDate:", v7);

    objc_msgSend(v4, "lastPrefetchDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLValidatedExternalCloudResource setLastPrefetchDate:](v5, "setLastPrefetchDate:", v8);

    -[PLValidatedExternalCloudResource setPrefetchCount:](v5, "setPrefetchCount:", objc_msgSend(v4, "prefetchCount"));
    objc_msgSend(v4, "prunedAt");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLValidatedExternalCloudResource setPrunedAt:](v5, "setPrunedAt:", v9);

    -[PLValidatedExternalCloudResource setSourceCplType:](v5, "setSourceCplType:", (int)objc_msgSend(v4, "sourceType"));
    objc_msgSend(v4, "fingerprint");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLValidatedExternalCloudResource setFingerprint:](v5, "setFingerprint:", v10);

  }
  return v5;
}

- (PLValidatedExternalCloudResource)initWithInternalResource:(id)a3
{
  id v4;
  PLValidatedExternalCloudResource *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLValidatedExternalCloudResource;
  v5 = -[PLValidatedExternalResource init](&v13, sel_init);
  if (v5)
  {
    -[PLValidatedExternalCloudResource setCloudLocalState:](v5, "setCloudLocalState:", objc_msgSend(v4, "cloudLocalState"));
    objc_msgSend(v4, "cloudMasterDateCreated");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLValidatedExternalCloudResource setMasterDateCreated:](v5, "setMasterDateCreated:", v6);

    objc_msgSend(v4, "cloudLastOnDemandDownloadDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLValidatedExternalCloudResource setLastOnDemandDownloadDate:](v5, "setLastOnDemandDownloadDate:", v7);

    objc_msgSend(v4, "cloudLastPrefetchDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLValidatedExternalCloudResource setLastPrefetchDate:](v5, "setLastPrefetchDate:", v8);

    -[PLValidatedExternalCloudResource setPrefetchCount:](v5, "setPrefetchCount:", objc_msgSend(v4, "cloudPrefetchCount"));
    objc_msgSend(v4, "cloudPrunedAt");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLValidatedExternalCloudResource setPrunedAt:](v5, "setPrunedAt:", v9);

    -[PLValidatedExternalCloudResource setSourceCplType:](v5, "setSourceCplType:", (int)objc_msgSend(v4, "cloudSourceType"));
    objc_msgSend(v4, "fingerprint");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLValidatedExternalCloudResource setFingerprint:](v5, "setFingerprint:", v10);

    objc_msgSend(v4, "stableHash");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLValidatedExternalCloudResource setStableHash:](v5, "setStableHash:", v11);

  }
  return v5;
}

- (BOOL)isEqualToValidatedExternalResource:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  id v8;
  int v9;
  unint64_t v10;
  unint64_t v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PLValidatedExternalCloudResource;
  if (-[PLValidatedExternalResource isEqualToValidatedExternalResource:](&v12, sel_isEqualToValidatedExternalResource_, v4)&& (v5 = objc_opt_class(), v5 == objc_opt_class()))
  {
    v8 = v4;
    v9 = -[PLValidatedExternalCloudResource cloudLocalState](self, "cloudLocalState");
    if (v9 == objc_msgSend(v8, "cloudLocalState")
      && (v10 = -[PLValidatedExternalCloudResource cplType](self, "cplType"), v10 == objc_msgSend(v8, "cplType")))
    {
      v11 = -[PLValidatedExternalCloudResource sourceCplType](self, "sourceCplType");
      v6 = v11 == objc_msgSend(v8, "sourceCplType");
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)cplType
{
  return self->_cplType;
}

- (void)setCplType:(unint64_t)a3
{
  self->_cplType = a3;
}

- (unint64_t)sourceCplType
{
  return self->_sourceCplType;
}

- (void)setSourceCplType:(unint64_t)a3
{
  self->_sourceCplType = a3;
}

- (signed)remoteAvailability
{
  return self->_remoteAvailability;
}

- (void)setRemoteAvailability:(signed __int16)a3
{
  self->_remoteAvailability = a3;
}

- (signed)cloudLocalState
{
  return self->_cloudLocalState;
}

- (void)setCloudLocalState:(signed __int16)a3
{
  self->_cloudLocalState = a3;
}

- (NSDate)masterDateCreated
{
  return self->_masterDateCreated;
}

- (void)setMasterDateCreated:(id)a3
{
  objc_storeStrong((id *)&self->_masterDateCreated, a3);
}

- (NSDate)lastOnDemandDownloadDate
{
  return self->_lastOnDemandDownloadDate;
}

- (void)setLastOnDemandDownloadDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastOnDemandDownloadDate, a3);
}

- (NSDate)lastPrefetchDate
{
  return self->_lastPrefetchDate;
}

- (void)setLastPrefetchDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastPrefetchDate, a3);
}

- (signed)prefetchCount
{
  return self->_prefetchCount;
}

- (void)setPrefetchCount:(signed __int16)a3
{
  self->_prefetchCount = a3;
}

- (NSDate)prunedAt
{
  return self->_prunedAt;
}

- (void)setPrunedAt:(id)a3
{
  objc_storeStrong((id *)&self->_prunedAt, a3);
}

- (NSString)fingerprint
{
  return self->_fingerprint;
}

- (void)setFingerprint:(id)a3
{
  objc_storeStrong((id *)&self->_fingerprint, a3);
}

- (NSString)stableHash
{
  return self->_stableHash;
}

- (void)setStableHash:(id)a3
{
  objc_storeStrong((id *)&self->_stableHash, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stableHash, 0);
  objc_storeStrong((id *)&self->_fingerprint, 0);
  objc_storeStrong((id *)&self->_prunedAt, 0);
  objc_storeStrong((id *)&self->_lastPrefetchDate, 0);
  objc_storeStrong((id *)&self->_lastOnDemandDownloadDate, 0);
  objc_storeStrong((id *)&self->_masterDateCreated, 0);
}

@end
