@implementation PGGraphUpdateJetsamIndicator

- (PGGraphUpdateJetsamIndicator)initWithPhotoLibrary:(id)a3
{
  void *v4;
  PGGraphUpdateJetsamIndicator *v5;

  objc_msgSend(a3, "pg_urlForGraphApplicationData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PGGraphUpdateJetsamIndicator initWithIndicatorDirectoryURL:](self, "initWithIndicatorDirectoryURL:", v4);

  return v5;
}

- (PGGraphUpdateJetsamIndicator)initWithIndicatorDirectoryURL:(id)a3
{
  id v4;
  PGGraphUpdateJetsamIndicator *v5;
  uint64_t v6;
  NSURL *indicatorURL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphUpdateJetsamIndicator;
  v5 = -[PGGraphUpdateJetsamIndicator init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("updatejetsam.plist"));
    v6 = objc_claimAutoreleasedReturnValue();
    indicatorURL = v5->_indicatorURL;
    v5->_indicatorURL = (NSURL *)v6;

    v5->_maxRetryCount = 1;
  }

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)PGGraphUpdateJetsamIndicator;
  -[PGGraphUpdateJetsamIndicator description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PGGraphUpdateJetsamIndicator retryCount](self, "retryCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PGGraphUpdateJetsamIndicator maxRetryCount](self, "maxRetryCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PGGraphUpdateJetsamIndicator indicatorExists](self, "indicatorExists"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphUpdateJetsamIndicator indicatorURL](self, "indicatorURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - retryCount: %@ (maxRetryCount: %@), indicatorExists: %@, indicator URL: %@"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)updateDidCauseJetsam
{
  int64_t v3;

  -[PGGraphUpdateJetsamIndicator _readIndicator](self, "_readIndicator");
  v3 = -[PGGraphUpdateJetsamIndicator retryCount](self, "retryCount");
  return v3 >= -[PGGraphUpdateJetsamIndicator maxRetryCount](self, "maxRetryCount")
      && -[PGGraphUpdateJetsamIndicator indicatorExists](self, "indicatorExists");
}

- (void)markUpdate
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  -[PGGraphUpdateJetsamIndicator setRetryCount:](self, "setRetryCount:", -[PGGraphUpdateJetsamIndicator retryCount](self, "retryCount") + 1);
  v15 = CFSTR("retryCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PGGraphUpdateJetsamIndicator retryCount](self, "retryCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v4, 200, 0, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  v7 = v6;
  if (v5)
  {
    -[PGGraphUpdateJetsamIndicator indicatorURL](self, "indicatorURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v7;
    v9 = objc_msgSend(v5, "writeToURL:options:error:", v8, 1073741825, &v11);
    v10 = v11;

    if ((v9 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v10;
      _os_log_fault_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "JetsamIndicator - failed to write indicator to disk with error: %@", buf, 0xCu);
    }
    -[PGGraphUpdateJetsamIndicator setIndicatorExists:](self, "setIndicatorExists:", 1);
  }
  else
  {
    v10 = v6;
  }

}

- (void)clear
{
  -[PGGraphUpdateJetsamIndicator _removeIndicator](self, "_removeIndicator");
  -[PGGraphUpdateJetsamIndicator setRetryCount:](self, "setRetryCount:", 0);
}

- (void)_readIndicator
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = (void *)MEMORY[0x1E0C99D50];
  -[PGGraphUpdateJetsamIndicator indicatorURL](self, "indicatorURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataWithContentsOfURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v11 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v5, 0, 0, &v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = v6 != 0;
    if (v6)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("retryCount"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "integerValue");

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v8 = 0;
    v10 = 0;
  }
  -[PGGraphUpdateJetsamIndicator setRetryCount:](self, "setRetryCount:", v10);
  -[PGGraphUpdateJetsamIndicator setIndicatorExists:](self, "setIndicatorExists:", v8);

}

- (void)_removeIndicator
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  char v7;
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[PGGraphUpdateJetsamIndicator indicatorURL](self, "indicatorURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

  if (v6)
  {
    v9 = 0;
    v7 = objc_msgSend(v4, "removeItemAtURL:error:", v3, &v9);
    v8 = v9;
    if ((v7 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v8;
      _os_log_fault_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "JetsamIndicator - removing indicator file from disk failed with error: %@", buf, 0xCu);
    }
    -[PGGraphUpdateJetsamIndicator setIndicatorExists:](self, "setIndicatorExists:", 0);

  }
  else if (-[PGGraphUpdateJetsamIndicator indicatorExists](self, "indicatorExists")
         && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "JetsamIndicator - no indicator file but JetsamIndicator instance believes indicator exists", buf, 2u);
  }

}

- (NSURL)indicatorURL
{
  return self->_indicatorURL;
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(int64_t)a3
{
  self->_retryCount = a3;
}

- (BOOL)indicatorExists
{
  return self->_indicatorExists;
}

- (void)setIndicatorExists:(BOOL)a3
{
  self->_indicatorExists = a3;
}

- (int64_t)maxRetryCount
{
  return self->_maxRetryCount;
}

- (void)setMaxRetryCount:(int64_t)a3
{
  self->_maxRetryCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indicatorURL, 0);
}

@end
