@implementation SSBookDownload

- (SSBookDownload)initWithDownloadStatus:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  SSBookDownload *v8;
  uint64_t v9;
  SSBookDownloadStatus *downloadStatus;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *downloadQueue;
  int v15;
  int v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  objc_super v29;
  int v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "downloadID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberFromHexDigits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "longLongValue");

  v29.receiver = self;
  v29.super_class = (Class)SSBookDownload;
  v8 = -[SSEntity _initWithPersistentIdentifier:](&v29, sel__initWithPersistentIdentifier_, v7);
  if (v8)
  {
    v9 = objc_msgSend(v4, "copy");
    downloadStatus = v8->_downloadStatus;
    v8->_downloadStatus = (SSBookDownloadStatus *)v9;

    v11 = SSVBookAssetDaemonFramework();
    v12 = SSVWeakLinkedClassForString(CFSTR("BLDownloadQueue"), v11);
    if (v12)
    {
      objc_msgSend(v12, "sharedInstance");
      v13 = objc_claimAutoreleasedReturnValue();
      downloadQueue = v8->_downloadQueue;
      v8->_downloadQueue = (SSBookDownloadQueue *)v13;
LABEL_15:

      goto LABEL_16;
    }
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    downloadQueue = (void *)objc_claimAutoreleasedReturnValue();
    if (!downloadQueue)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      downloadQueue = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15 = objc_msgSend(downloadQueue, "shouldLog");
    if (objc_msgSend(downloadQueue, "shouldLogToDisk"))
      v16 = v15 | 2;
    else
      v16 = v15;
    objc_msgSend(downloadQueue, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      v16 &= 2u;
    if (v16)
    {
      v18 = (void *)objc_opt_class();
      v30 = 138543362;
      v31 = v18;
      v19 = v18;
      LODWORD(v28) = 12;
      v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20)
        goto LABEL_15;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v20, 4, &v30, v28);
      v17 = objc_claimAutoreleasedReturnValue();
      free(v20);
      SSFileLog(downloadQueue, CFSTR("%@"), v21, v22, v23, v24, v25, v26, (uint64_t)v17);
    }

    goto LABEL_15;
  }
LABEL_16:

  return v8;
}

- (int64_t)persistentIdentifier
{
  return -[SSBookDownloadStatus persistentIdentifier](self->_downloadStatus, "persistentIdentifier");
}

- (NSString)downloadID
{
  return (NSString *)-[SSBookDownloadStatus downloadID](self->_downloadStatus, "downloadID");
}

- (BOOL)isCancelable
{
  return -[SSBookDownloadStatus downloadPhase](self->_downloadStatus, "downloadPhase") != 4
      && -[SSBookDownloadStatus downloadPhase](self->_downloadStatus, "downloadPhase") != 5;
}

- (id)downloadPhaseIdentifier
{
  NSString *downloadPhaseIdentifierOverride;
  __CFString **v3;

  downloadPhaseIdentifierOverride = self->_downloadPhaseIdentifierOverride;
  if (!downloadPhaseIdentifierOverride)
  {
    switch(-[SSBookDownloadStatus downloadPhase](self->_downloadStatus, "downloadPhase"))
    {
      case 0:
        v3 = SSDownloadPhasePreflight;
        goto LABEL_13;
      case 1:
        v3 = SSDownloadPhaseWaiting;
        goto LABEL_13;
      case 2:
        v3 = SSDownloadPhaseDownloading;
        goto LABEL_13;
      case 3:
        v3 = SSDownloadPhasePaused;
        goto LABEL_13;
      case 4:
        v3 = SSDownloadPhaseCanceled;
        goto LABEL_13;
      case 5:
        v3 = &SSDownloadPhaseFailed;
        goto LABEL_13;
      case 6:
        v3 = SSDownloadPhaseProcessing;
        goto LABEL_13;
      case 7:
        v3 = SSDownloadPhaseInstalling;
        goto LABEL_13;
      case 8:
        v3 = SSDownloadPhaseFinished;
LABEL_13:
        downloadPhaseIdentifierOverride = (NSString *)*v3;
        return downloadPhaseIdentifierOverride;
      default:
        return 0;
    }
  }
  return downloadPhaseIdentifierOverride;
}

- (double)percentComplete
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  void *v7;
  SSBookDownloadStatus *downloadStatus;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  uint64_t v23;
  int v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  objc_msgSend(v3, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    v5 &= 2u;
  if (!v5)
    goto LABEL_11;
  v7 = (void *)objc_opt_class();
  downloadStatus = self->_downloadStatus;
  v9 = v7;
  -[SSBookDownloadStatus percentComplete](downloadStatus, "percentComplete");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v24 = 138543618;
  v25 = v7;
  v26 = 2048;
  v27 = v11;
  LODWORD(v23) = 22;
  v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v12, 4, &v24, v23);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v12);
    SSFileLog(v3, CFSTR("%@"), v13, v14, v15, v16, v17, v18, (uint64_t)v6);
LABEL_11:

  }
  -[SSBookDownloadStatus percentComplete](self->_downloadStatus, "percentComplete");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "doubleValue");
  v21 = v20;

  return v21;
}

- (void)pause
{
  SSBookDownloadQueue *downloadQueue;
  id v3;

  downloadQueue = self->_downloadQueue;
  -[SSBookDownload downloadID](self, "downloadID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SSBookDownloadQueue pauseDownloadWithID:withCompletion:](downloadQueue, "pauseDownloadWithID:withCompletion:", v3, 0);

}

- (void)resume
{
  SSBookDownloadQueue *downloadQueue;
  id v3;

  downloadQueue = self->_downloadQueue;
  -[SSBookDownload downloadID](self, "downloadID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SSBookDownloadQueue resumeDownloadWithID:withCompletion:](downloadQueue, "resumeDownloadWithID:withCompletion:", v3, 0);

}

- (id)valueForProperty:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("7")))
  {
    -[SSBookDownloadStatus storeID](self->_downloadStatus, "storeID");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("Q")))
  {
    -[SSBookDownloadStatus downloadID](self->_downloadStatus, "downloadID");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("V")))
    {
      v6 = (void *)MEMORY[0x1E0CB37E8];
      v7 = -[SSBookDownloadStatus isRestore](self->_downloadStatus, "isRestore");
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("M")))
    {
      v6 = (void *)MEMORY[0x1E0CB37E8];
      v7 = -[SSBookDownloadStatus isPurchase](self->_downloadStatus, "isPurchase");
    }
    else
    {
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("c")) & 1) != 0)
      {
        v8 = CFSTR("com.apple.bookassetd");
        goto LABEL_11;
      }
      if (objc_msgSend(v4, "isEqualToString:", CFSTR("1")))
      {
        v5 = CFSTR("ebook");
        goto LABEL_10;
      }
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("11")) & 1) != 0)
        goto LABEL_17;
      if (objc_msgSend(v4, "isEqualToString:", CFSTR("d")))
      {
        -[SSBookDownloadStatus artistName](self->_downloadStatus, "artistName");
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
      if (objc_msgSend(v4, "isEqualToString:", CFSTR("i")))
      {
        -[SSBookDownloadStatus genre](self->_downloadStatus, "genre");
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
      if (objc_msgSend(v4, "isEqualToString:", CFSTR("2")))
      {
        -[SSBookDownloadStatus title](self->_downloadStatus, "title");
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
      if (objc_msgSend(v4, "isEqualToString:", CFSTR("8")))
      {
        -[SSBookDownloadStatus purchaseDate](self->_downloadStatus, "purchaseDate");
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
      if (!objc_msgSend(v4, "isEqualToString:", CFSTR("t")))
      {
LABEL_17:
        v8 = 0;
        goto LABEL_11;
      }
      v6 = (void *)MEMORY[0x1E0CB37E8];
      v7 = -[SSBookDownloadStatus isSample](self->_downloadStatus, "isSample");
    }
    objc_msgSend(v6, "numberWithBool:", v7);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
LABEL_10:
  v8 = v5;
LABEL_11:

  return v8;
}

- (int64_t)bytesDownloaded
{
  void *v2;
  int64_t v3;

  -[SSBookDownloadStatus transferBytesWritten](self->_downloadStatus, "transferBytesWritten");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "longLongValue");

  return v3;
}

- (int64_t)bytesTotal
{
  void *v2;
  int64_t v3;

  -[SSBookDownloadStatus transferBytesExpected](self->_downloadStatus, "transferBytesExpected");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "longLongValue");

  return v3;
}

- (double)estimatedSecondsRemaining
{
  void *v2;
  double v3;
  double v4;

  -[SSBookDownloadStatus estimatedTimeRemaining](self->_downloadStatus, "estimatedTimeRemaining");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (id)metadata
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  objc_msgSend(v3, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    v5 &= 2u;
  if (!v5)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v16 = 138543362;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 12;
  v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, &v16, v15);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v7);
    SSFileLog(v3, CFSTR("%@"), v8, v9, v10, v11, v12, v13, (uint64_t)v6);
LABEL_11:

  }
  return 0;
}

- (id)networkConstraints
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  objc_msgSend(v3, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    v5 &= 2u;
  if (!v5)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v16 = 138543362;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 12;
  v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, &v16, v15);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v7);
    SSFileLog(v3, CFSTR("%@"), v8, v9, v10, v11, v12, v13, (uint64_t)v6);
LABEL_11:

  }
  return 0;
}

- (void)setMetadata:(id)a3
{
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    v6 &= 2u;
  if (!v6)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v16 = 138543362;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 12;
  v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v16, v15);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v8);
    SSFileLog(v4, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v7);
LABEL_11:

  }
}

- (void)setNetworkConstraints:(id)a3
{
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    v6 &= 2u;
  if (!v6)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v16 = 138543362;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 12;
  v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v16, v15);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v8);
    SSFileLog(v4, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v7);
LABEL_11:

  }
}

- (void)setStatus:(id)a3
{
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    v6 &= 2u;
  if (!v6)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v16 = 138543362;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 12;
  v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v16, v15);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v8);
    SSFileLog(v4, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v7);
LABEL_11:

  }
}

- (id)status
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  objc_msgSend(v3, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    v5 &= 2u;
  if (!v5)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v16 = 138543362;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 12;
  v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, &v16, v15);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v7);
    SSFileLog(v3, CFSTR("%@"), v8, v9, v10, v11, v12, v13, (uint64_t)v6);
LABEL_11:

  }
  return 0;
}

- (id)assetsForType:(id)a3
{
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    v6 &= 2u;
  if (!v6)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v17 = 138543362;
  v18 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = 12;
  v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v17, v16);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v8);
    SSFileLog(v4, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v7);
LABEL_11:

  }
  return 0;
}

- (BOOL)addAsset:(id)a3 forType:(id)a4
{
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = objc_msgSend(v5, "shouldLog");
  if (objc_msgSend(v5, "shouldLogToDisk"))
    v7 = v6 | 2;
  else
    v7 = v6;
  objc_msgSend(v5, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    v7 &= 2u;
  if (!v7)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v18 = 138543362;
  v19 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = 12;
  v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v9, 4, &v18, v17);
    v8 = objc_claimAutoreleasedReturnValue();
    free(v9);
    SSFileLog(v5, CFSTR("%@"), v10, v11, v12, v13, v14, v15, (uint64_t)v8);
LABEL_11:

  }
  return 0;
}

- (id)backgroundNetworkingJobGroupName
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  objc_msgSend(v3, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    v5 &= 2u;
  if (!v5)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v16 = 138543362;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 12;
  v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, &v16, v15);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v7);
    SSFileLog(v3, CFSTR("%@"), v8, v9, v10, v11, v12, v13, (uint64_t)v6);
LABEL_11:

  }
  return 0;
}

- (id)downloadPolicy
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  objc_msgSend(v3, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    v5 &= 2u;
  if (!v5)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v16 = 138543362;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 12;
  v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, &v16, v15);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v7);
    SSFileLog(v3, CFSTR("%@"), v8, v9, v10, v11, v12, v13, (uint64_t)v6);
LABEL_11:

  }
  return 0;
}

- (int64_t)downloadSizeLimit
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  objc_msgSend(v3, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    v5 &= 2u;
  if (!v5)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v16 = 138543362;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 12;
  v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, &v16, v15);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v7);
    SSFileLog(v3, CFSTR("%@"), v8, v9, v10, v11, v12, v13, (uint64_t)v6);
LABEL_11:

  }
  return 0;
}

- (BOOL)isBackgroundNetworkingUserInitiated
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  objc_msgSend(v3, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    v5 &= 2u;
  if (!v5)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v16 = 138543362;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 12;
  v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, &v16, v15);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v7);
    SSFileLog(v3, CFSTR("%@"), v8, v9, v10, v11, v12, v13, (uint64_t)v6);
LABEL_11:

  }
  return 0;
}

- (BOOL)isEligibleForRestore:(id *)a3
{
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    v6 &= 2u;
  if (!v6)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v17 = 138543362;
  v18 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = 12;
  v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v17, v16);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v8);
    SSFileLog(v4, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v7);
LABEL_11:

  }
  return 0;
}

- (void)prioritizeAboveDownload:(id)a3 completionBlock:(id)a4
{
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = objc_msgSend(v5, "shouldLog");
  if (objc_msgSend(v5, "shouldLogToDisk"))
    v7 = v6 | 2;
  else
    v7 = v6;
  objc_msgSend(v5, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    v7 &= 2u;
  if (!v7)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v17 = 138543362;
  v18 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = 12;
  v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v9, 4, &v17, v16);
    v8 = objc_claimAutoreleasedReturnValue();
    free(v9);
    SSFileLog(v5, CFSTR("%@"), v10, v11, v12, v13, v14, v15, (uint64_t)v8);
LABEL_11:

  }
}

- (BOOL)removeAsset:(id)a3
{
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    v6 &= 2u;
  if (!v6)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v17 = 138543362;
  v18 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = 12;
  v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v17, v16);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v8);
    SSFileLog(v4, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v7);
LABEL_11:

  }
  return 0;
}

- (void)restart
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  objc_msgSend(v3, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    v5 &= 2u;
  if (!v5)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v15 = 138543362;
  v16 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = 12;
  v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, &v15, v14);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v7);
    SSFileLog(v3, CFSTR("%@"), v8, v9, v10, v11, v12, v13, (uint64_t)v6);
LABEL_11:

  }
}

- (void)setBackgroundNetworkingJobGroupName:(id)a3
{
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    v6 &= 2u;
  if (!v6)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v16 = 138543362;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 12;
  v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v16, v15);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v8);
    SSFileLog(v4, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v7);
LABEL_11:

  }
}

- (void)setBackgroundNetworkingUserInitiated:(BOOL)a3
{
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    v6 &= 2u;
  if (!v6)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v16 = 138543362;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 12;
  v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v16, v15);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v8);
    SSFileLog(v4, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v7);
LABEL_11:

  }
}

- (void)setDownloadHandler:(id)a3 completionBlock:(id)a4
{
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = objc_msgSend(v5, "shouldLog");
  if (objc_msgSend(v5, "shouldLogToDisk"))
    v7 = v6 | 2;
  else
    v7 = v6;
  objc_msgSend(v5, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    v7 &= 2u;
  if (!v7)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v17 = 138543362;
  v18 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = 12;
  v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v9, 4, &v17, v16);
    v8 = objc_claimAutoreleasedReturnValue();
    free(v9);
    SSFileLog(v5, CFSTR("%@"), v10, v11, v12, v13, v14, v15, (uint64_t)v8);
LABEL_11:

  }
}

- (void)setDownloadPolicy:(id)a3
{
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    v6 &= 2u;
  if (!v6)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v16 = 138543362;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 12;
  v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v16, v15);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v8);
    SSFileLog(v4, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v7);
LABEL_11:

  }
}

- (void)setValuesWithStoreDownloadMetadata:(id)a3
{
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    v6 &= 2u;
  if (!v6)
    goto LABEL_11;
  NSStringFromSelector(a2);
  v16 = 138543362;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = 12;
  v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v16, v15);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v8);
    SSFileLog(v4, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v7);
LABEL_11:

  }
}

- (NSString)downloadPhaseIdentifierOverride
{
  return self->_downloadPhaseIdentifierOverride;
}

- (void)setDownloadPhaseIdentifierOverride:(id)a3
{
  objc_storeStrong((id *)&self->_downloadPhaseIdentifierOverride, a3);
}

- (SSBookDownloadStatus)downloadStatus
{
  return self->_downloadStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadStatus, 0);
  objc_storeStrong((id *)&self->_downloadPhaseIdentifierOverride, 0);
  objc_storeStrong((id *)&self->_downloadQueue, 0);
}

@end
