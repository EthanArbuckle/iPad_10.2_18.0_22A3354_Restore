@implementation VUIMediaEntityAssetControllerState

- (VUIMediaEntityAssetControllerState)init
{
  VUIMediaEntityAssetControllerState *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIMediaEntityAssetControllerState;
  result = -[VUIMediaEntityAssetControllerState init](&v3, sel_init);
  if (result)
  {
    result->_status = 0;
    result->_downloadProgress = -1.0;
  }
  return result;
}

- (BOOL)isDownloadInProgress
{
  return -[VUIMediaEntityAssetControllerState status](self, "status") - 1 < 3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  VUIMediaEntityAssetControllerState *v4;

  v4 = objc_alloc_init(VUIMediaEntityAssetControllerState);
  v4->_status = self->_status;
  v4->_downloadProgress = self->_downloadProgress;
  v4->_bytesDownloaded = self->_bytesDownloaded;
  v4->_bytesToDownload = self->_bytesToDownload;
  v4->_supportsCancellation = self->_supportsCancellation;
  v4->_supportsPausing = self->_supportsPausing;
  v4->_renewsOfflineKeysAutomatically = self->_renewsOfflineKeysAutomatically;
  objc_storeStrong((id *)&v4->_downloadExpirationDate, self->_downloadExpirationDate);
  objc_storeStrong((id *)&v4->_availabilityEndDate, self->_availabilityEndDate);
  v4->_allowsCellular = self->_allowsCellular;
  v4->_downloadFailedDueToError = self->_downloadFailedDueToError;
  return v4;
}

- (unint64_t)hash
{
  unint64_t v3;
  double v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _BOOL4 v8;
  uint64_t v9;
  unint64_t v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;

  v3 = -[VUIMediaEntityAssetControllerState status](self, "status");
  -[VUIMediaEntityAssetControllerState downloadProgress](self, "downloadProgress");
  v5 = (unint64_t)(v4 * 100.0);
  v6 = -[VUIMediaEntityAssetControllerState bytesToDownload](self, "bytesToDownload");
  v7 = v3 ^ (4 * v6) ^ (2 * v5) ^ (8 * -[VUIMediaEntityAssetControllerState bytesDownloaded](self, "bytesDownloaded"));
  -[VUIMediaEntityAssetControllerState supportsCancellation](self, "supportsCancellation");
  -[VUIMediaEntityAssetControllerState supportsPausing](self, "supportsPausing");
  -[VUIMediaEntityAssetControllerState renewsOfflineKeysAutomatically](self, "renewsOfflineKeysAutomatically");
  v8 = -[VUIMediaEntityAssetControllerState allowsCellular](self, "allowsCellular");
  v9 = 128;
  if (!v8)
    v9 = 0;
  v10 = v9 & v7;
  v11 = -[VUIMediaEntityAssetControllerState downloadFailedDueToError](self, "downloadFailedDueToError");
  v12 = 256;
  if (!v11)
    v12 = 0;
  v13 = v10 | v12;
  -[VUIMediaEntityAssetControllerState downloadExpirationDate](self, "downloadExpirationDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash");

  -[VUIMediaEntityAssetControllerState availabilityEndDate](self, "availabilityEndDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15 ^ objc_msgSend(v16, "hash") ^ v13;

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  VUIMediaEntityAssetControllerState *v4;
  VUIMediaEntityAssetControllerState *v5;
  VUIMediaEntityAssetControllerState *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  double v12;
  double v13;
  double v14;
  unint64_t v15;
  unint64_t v16;
  _BOOL4 v17;
  _BOOL4 v18;
  _BOOL4 v19;
  _BOOL4 v20;
  _BOOL4 v21;
  _BOOL4 v23;

  v4 = (VUIMediaEntityAssetControllerState *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v21) = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    -[VUIMediaEntityAssetControllerState downloadExpirationDate](self, "downloadExpirationDate");
    v7 = objc_claimAutoreleasedReturnValue();
    -[VUIMediaEntityAssetControllerState downloadExpirationDate](v6, "downloadExpirationDate");
    v8 = objc_claimAutoreleasedReturnValue();
    -[VUIMediaEntityAssetControllerState availabilityEndDate](self, "availabilityEndDate");
    v9 = objc_claimAutoreleasedReturnValue();
    -[VUIMediaEntityAssetControllerState availabilityEndDate](v6, "availabilityEndDate");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = -[VUIMediaEntityAssetControllerState status](self, "status");
    if (v11 != -[VUIMediaEntityAssetControllerState status](v6, "status"))
      goto LABEL_12;
    -[VUIMediaEntityAssetControllerState downloadProgress](self, "downloadProgress");
    v13 = v12;
    -[VUIMediaEntityAssetControllerState downloadProgress](v6, "downloadProgress");
    if (v13 != v14)
      goto LABEL_12;
    v15 = -[VUIMediaEntityAssetControllerState bytesToDownload](self, "bytesToDownload");
    if (v15 != -[VUIMediaEntityAssetControllerState bytesToDownload](v6, "bytesToDownload"))
      goto LABEL_12;
    v16 = -[VUIMediaEntityAssetControllerState bytesDownloaded](self, "bytesDownloaded");
    if (v16 != -[VUIMediaEntityAssetControllerState bytesDownloaded](v6, "bytesDownloaded"))
      goto LABEL_12;
    v17 = -[VUIMediaEntityAssetControllerState supportsCancellation](self, "supportsCancellation");
    if (v17 != -[VUIMediaEntityAssetControllerState supportsCancellation](v6, "supportsCancellation"))
      goto LABEL_12;
    v18 = -[VUIMediaEntityAssetControllerState supportsPausing](self, "supportsPausing");
    if (v18 != -[VUIMediaEntityAssetControllerState supportsPausing](v6, "supportsPausing"))
      goto LABEL_12;
    v19 = -[VUIMediaEntityAssetControllerState renewsOfflineKeysAutomatically](self, "renewsOfflineKeysAutomatically");
    if (v19 != -[VUIMediaEntityAssetControllerState renewsOfflineKeysAutomatically](v6, "renewsOfflineKeysAutomatically"))goto LABEL_12;
    v20 = -[VUIMediaEntityAssetControllerState allowsCellular](self, "allowsCellular");
    if (v20 != -[VUIMediaEntityAssetControllerState allowsCellular](v6, "allowsCellular")
      || v7 | v8 && !objc_msgSend((id)v7, "isEqualToDate:", v8))
    {
      goto LABEL_12;
    }
    if (!(v9 | v10) || objc_msgSend((id)v9, "isEqualToDate:", v10))
    {
      v23 = -[VUIMediaEntityAssetControllerState downloadFailedDueToError](self, "downloadFailedDueToError");
      v21 = v23 ^ -[VUIMediaEntityAssetControllerState downloadFailedDueToError](v6, "downloadFailedDueToError") ^ 1;
    }
    else
    {
LABEL_12:
      LOBYTE(v21) = 0;
    }

  }
  else
  {
    LOBYTE(v21) = 0;
  }

  return v21;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  objc_super v47;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v47.receiver = self;
  v47.super_class = (Class)VUIMediaEntityAssetControllerState;
  -[VUIMediaEntityAssetControllerState description](&v47, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = -[VUIMediaEntityAssetControllerState status](self, "status");
  if (v6 > 4)
    v7 = 0;
  else
    v7 = off_1E9F9B170[v6];
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("status"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[VUIMediaEntityAssetControllerState downloadProgress](self, "downloadProgress");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("downloadProgress"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v12);

  v13 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VUIMediaEntityAssetControllerState bytesToDownload](self, "bytesToDownload"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("bytesToDownload"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v15);

  v16 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VUIMediaEntityAssetControllerState bytesDownloaded](self, "bytesDownloaded"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("bytesDownloaded"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v18);

  v19 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntityAssetControllerState isDownloadInProgress](self, "isDownloadInProgress");
  VUIBoolLogString();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("isDownloadInProgress"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v21);

  v22 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntityAssetControllerState supportsCancellation](self, "supportsCancellation");
  VUIBoolLogString();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("supportsCancellation"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v24);

  v25 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntityAssetControllerState supportsPausing](self, "supportsPausing");
  VUIBoolLogString();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("supportsPausing"), v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v27);

  v28 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntityAssetControllerState renewsOfflineKeysAutomatically](self, "renewsOfflineKeysAutomatically");
  VUIBoolLogString();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("renewsOfflineKeysAutomatically"), v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v30);

  v31 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntityAssetControllerState allowsCellular](self, "allowsCellular");
  VUIBoolLogString();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("allowsCellular"), v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v33);

  v34 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntityAssetControllerState downloadExpirationDate](self, "downloadExpirationDate");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("downloadExpirationDate"), v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v36);

  v37 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntityAssetControllerState availabilityEndDate](self, "availabilityEndDate");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("availabilityEndDate"), v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v39);

  v40 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntityAssetControllerState downloadFailedDueToError](self, "downloadFailedDueToError");
  VUIBoolLogString();
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("downloadFailedDueToError"), v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v42);

  v43 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "stringWithFormat:", CFSTR("<%@>"), v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  return v45;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (double)downloadProgress
{
  return self->_downloadProgress;
}

- (void)setDownloadProgress:(double)a3
{
  self->_downloadProgress = a3;
}

- (BOOL)supportsCancellation
{
  return self->_supportsCancellation;
}

- (void)setSupportsCancellation:(BOOL)a3
{
  self->_supportsCancellation = a3;
}

- (BOOL)supportsPausing
{
  return self->_supportsPausing;
}

- (void)setSupportsPausing:(BOOL)a3
{
  self->_supportsPausing = a3;
}

- (BOOL)renewsOfflineKeysAutomatically
{
  return self->_renewsOfflineKeysAutomatically;
}

- (void)setRenewsOfflineKeysAutomatically:(BOOL)a3
{
  self->_renewsOfflineKeysAutomatically = a3;
}

- (NSDate)downloadExpirationDate
{
  return self->_downloadExpirationDate;
}

- (void)setDownloadExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_downloadExpirationDate, a3);
}

- (NSDate)availabilityEndDate
{
  return self->_availabilityEndDate;
}

- (void)setAvailabilityEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_availabilityEndDate, a3);
}

- (BOOL)performsKeyFetchOnly
{
  return self->_performsKeyFetchOnly;
}

- (void)setPerformsKeyFetchOnly:(BOOL)a3
{
  self->_performsKeyFetchOnly = a3;
}

- (BOOL)allowsCellular
{
  return self->_allowsCellular;
}

- (void)setAllowsCellular:(BOOL)a3
{
  self->_allowsCellular = a3;
}

- (BOOL)downloadFailedDueToError
{
  return self->_downloadFailedDueToError;
}

- (void)setDownloadFailedDueToError:(BOOL)a3
{
  self->_downloadFailedDueToError = a3;
}

- (unint64_t)bytesToDownload
{
  return self->_bytesToDownload;
}

- (void)setBytesToDownload:(unint64_t)a3
{
  self->_bytesToDownload = a3;
}

- (unint64_t)bytesDownloaded
{
  return self->_bytesDownloaded;
}

- (void)setBytesDownloaded:(unint64_t)a3
{
  self->_bytesDownloaded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availabilityEndDate, 0);
  objc_storeStrong((id *)&self->_downloadExpirationDate, 0);
}

@end
