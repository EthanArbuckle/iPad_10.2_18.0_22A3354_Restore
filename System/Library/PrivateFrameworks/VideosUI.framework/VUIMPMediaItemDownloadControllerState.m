@implementation VUIMPMediaItemDownloadControllerState

- (VUIMPMediaItemDownloadControllerState)init
{
  VUIMPMediaItemDownloadControllerState *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIMPMediaItemDownloadControllerState;
  result = -[VUIMPMediaItemDownloadControllerState init](&v3, sel_init);
  if (result)
  {
    result->_status = 3;
    result->_downloadProgress = -1.0;
  }
  return result;
}

- (BOOL)isDownloadInProgress
{
  return -[VUIMPMediaItemDownloadControllerState status](self, "status") < 3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  VUIMPMediaItemDownloadControllerState *v4;

  v4 = objc_alloc_init(VUIMPMediaItemDownloadControllerState);
  v4->_status = self->_status;
  v4->_downloadProgress = self->_downloadProgress;
  v4->_bytesDownloaded = self->_bytesDownloaded;
  v4->_bytesToDownload = self->_bytesToDownload;
  v4->_downloadSucceeded = self->_downloadSucceeded;
  objc_storeStrong((id *)&v4->_error, self->_error);
  return v4;
}

- (unint64_t)hash
{
  unint64_t v3;
  double v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  v3 = -[VUIMPMediaItemDownloadControllerState status](self, "status");
  -[VUIMPMediaItemDownloadControllerState downloadProgress](self, "downloadProgress");
  v5 = (unint64_t)(v4 * 100.0);
  v6 = -[VUIMPMediaItemDownloadControllerState bytesToDownload](self, "bytesToDownload");
  v7 = -[VUIMPMediaItemDownloadControllerState bytesDownloaded](self, "bytesDownloaded");
  if (-[VUIMPMediaItemDownloadControllerState downloadSucceeded](self, "downloadSucceeded"))
    v8 = 16;
  else
    v8 = 0;
  -[VUIMPMediaItemDownloadControllerState error](self, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v3 ^ (4 * v6) ^ (2 * v5) ^ (8 * v7) ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  VUIMPMediaItemDownloadControllerState *v4;
  VUIMPMediaItemDownloadControllerState *v5;
  VUIMPMediaItemDownloadControllerState *v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  unint64_t v11;
  unint64_t v12;
  _BOOL4 v13;
  BOOL v14;
  void *v16;
  void *v17;

  v4 = (VUIMPMediaItemDownloadControllerState *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v14 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = -[VUIMPMediaItemDownloadControllerState status](self, "status");
    if (v7 == -[VUIMPMediaItemDownloadControllerState status](v6, "status")
      && (-[VUIMPMediaItemDownloadControllerState downloadProgress](self, "downloadProgress"),
          v9 = v8,
          -[VUIMPMediaItemDownloadControllerState downloadProgress](v6, "downloadProgress"),
          v9 == v10)
      && (v11 = -[VUIMPMediaItemDownloadControllerState bytesToDownload](self, "bytesToDownload"),
          v11 == -[VUIMPMediaItemDownloadControllerState bytesToDownload](v6, "bytesToDownload"))
      && (v12 = -[VUIMPMediaItemDownloadControllerState bytesDownloaded](self, "bytesDownloaded"),
          v12 == -[VUIMPMediaItemDownloadControllerState bytesDownloaded](v6, "bytesDownloaded"))
      && (v13 = -[VUIMPMediaItemDownloadControllerState downloadSucceeded](self, "downloadSucceeded"),
          v13 == -[VUIMPMediaItemDownloadControllerState downloadSucceeded](v6, "downloadSucceeded")))
    {
      -[VUIMPMediaItemDownloadControllerState error](self, "error");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIMPMediaItemDownloadControllerState error](v6, "error");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v16 == v17;

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
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
  objc_super v32;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v32.receiver = self;
  v32.super_class = (Class)VUIMPMediaItemDownloadControllerState;
  -[VUIMPMediaItemDownloadControllerState description](&v32, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = -[VUIMPMediaItemDownloadControllerState status](self, "status");
  if (v6 > 3)
    v7 = 0;
  else
    v7 = off_1E9FA3E08[v6];
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("status"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[VUIMPMediaItemDownloadControllerState downloadProgress](self, "downloadProgress");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("downloadProgress"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v12);

  v13 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VUIMPMediaItemDownloadControllerState bytesToDownload](self, "bytesToDownload"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("bytesToDownload"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v15);

  v16 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VUIMPMediaItemDownloadControllerState bytesDownloaded](self, "bytesDownloaded"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("bytesDownloaded"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v18);

  v19 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMPMediaItemDownloadControllerState isDownloadInProgress](self, "isDownloadInProgress");
  VUIBoolLogString();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("isDownloadInProgress"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v21);

  v22 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMPMediaItemDownloadControllerState downloadSucceeded](self, "downloadSucceeded");
  VUIBoolLogString();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("downloadSucceeded"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v24);

  v25 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMPMediaItemDownloadControllerState error](self, "error");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("error"), v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v27);

  v28 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stringWithFormat:", CFSTR("<%@>"), v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
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

- (void)setDownloadInProgress:(BOOL)a3
{
  self->_downloadInProgress = a3;
}

- (BOOL)downloadSucceeded
{
  return self->_downloadSucceeded;
}

- (void)setDownloadSucceeded:(BOOL)a3
{
  self->_downloadSucceeded = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
