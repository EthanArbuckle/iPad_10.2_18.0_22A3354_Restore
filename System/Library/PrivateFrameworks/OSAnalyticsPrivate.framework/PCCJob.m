@implementation PCCJob

- (NSString)nextFilepath
{
  return (NSString *)-[OSALog filepath](self->_package, "filepath");
}

- (id)result
{
  return self->_errObj;
}

- (PCCJob)initWithID:(id)a3 forTarget:(id)a4 options:(id)a5
{
  id v9;
  id v10;
  id v11;
  PCCJob *v12;
  PCCJob *v13;
  uint64_t v14;
  NSDate *lastTouch;
  NSString *type;
  void *v17;
  uint64_t v18;
  void *event;
  uint64_t v20;
  NSString *v21;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)PCCJob;
  v12 = -[PCCJob init](&v23, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_jid, a3);
    objc_storeStrong((id *)&v13->_target, a4);
    objc_storeStrong((id *)&v13->_options, a5);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = objc_claimAutoreleasedReturnValue();
    lastTouch = v13->_lastTouch;
    v13->_lastTouch = (NSDate *)v14;

    type = v13->_type;
    v13->_type = (NSString *)CFSTR("xfer-file");

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("event"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("event"));
      v18 = objc_claimAutoreleasedReturnValue();
      event = v13->_event;
      v13->_event = (NSString *)v18;
    }
    else
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("jobEvent"));
      event = (void *)objc_claimAutoreleasedReturnValue();
      if (event)
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("jobEvent"));
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = v13->_event;
        v13->_event = (NSString *)v20;
      }
      else
      {
        v21 = v13->_event;
        v13->_event = (NSString *)CFSTR("<unknown>");
      }

    }
  }

  return v13;
}

- (id)description
{
  void *v2;
  NSString *jid;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  jid = self->_jid;
  -[OSALog filepath](self->_package, "filepath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("single %@ %@"), jid, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PCCJob)initWithID:(id)a3 forTarget:(id)a4 options:(id)a5 forFile:(id)a6
{
  id v10;
  id v11;
  PCCJob *v12;
  void *v13;
  int v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *errObj;
  uint64_t v27;
  NSError *v28;
  void *v29;
  uint64_t v30;
  uint8_t v32[8];
  uint64_t v33;
  const __CFString *v34;
  uint64_t v35;
  const __CFString *v36;
  _QWORD v37[3];
  _QWORD v38[4];

  v38[3] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  v12 = -[PCCJob initWithID:forTarget:options:](self, "initWithID:forTarget:options:", a3, a4, v10);
  if (v12)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("<preserve>"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "BOOLValue");

    v14 = OSAIsRSDDisplay();
    v15 = -[NSString isEqualToString:](v12->_jid, "isEqualToString:", CFSTR("<unsolicited>"));
    objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "pathSubmission");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "hasPrefix:", v17))
    {

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringByDeletingLastPathComponent");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isWhitelisted:forDomain:", v19, CFSTR("transfer_paths"));

      if (!v20)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v32 = 0;
          _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "path non-accessible, abandoning job", v32, 2u);
        }
        v29 = (void *)MEMORY[0x1E0CB35C8];
        v33 = *MEMORY[0x1E0CB2D50];
        v34 = CFSTR("Path non-accessible");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("ProxyJobErrorDomain"), 3, v24);
        v30 = objc_claimAutoreleasedReturnValue();
        errObj = v12->_errObj;
        v12->_errObj = (NSError *)v30;
        goto LABEL_12;
      }
    }
    v37[0] = CFSTR("<preserve>");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14 ^ 1u);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v21;
    v37[1] = CFSTR("<exempt>");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", !v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v22;
    v37[2] = CFSTR("<cleanup>");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v38[2] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[PCCJob packageLog:forRouting:info:options:](v12, "packageLog:forRouting:info:options:", v11, CFSTR("<sync>"), &unk_1E9552500, v24);
    if (v12->_package)
    {
LABEL_13:

      goto LABEL_14;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v32 = 0;
      _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "specific file not available, abandoning job", v32, 2u);
    }
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v35 = *MEMORY[0x1E0CB2D50];
    v36 = CFSTR("File unavailable");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    errObj = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("ProxyJobErrorDomain"), 2, errObj);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v12->_errObj;
    v12->_errObj = (NSError *)v27;

LABEL_12:
    goto LABEL_13;
  }
LABEL_14:

  return v12;
}

- (void)packageLog:(id)a3 forRouting:(id)a4 info:(id)a5 options:(id)a6
{
  id v10;
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  OSALog *v17;
  OSALog *package;
  OSALog *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSString *jid;
  NSString *event;
  void *v36;
  NSDictionary *v37;
  NSDictionary *metadata;
  NSDate *v39;
  NSDate *lastTouch;
  _QWORD v41[8];
  _QWORD v42[9];

  v42[8] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = (objc_class *)MEMORY[0x1E0D64EC8];
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = [v11 alloc];
  objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (OSALog *)objc_msgSend(v15, "initWithPath:forRouting:usingConfig:options:error:", v14, v13, v16, v12, 0);

  package = self->_package;
  self->_package = v17;

  v19 = self->_package;
  if (v19)
  {
    -[OSALog closeFileStream](v19, "closeFileStream");
    -[OSALog filepath](self->_package, "filepath");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "pathSubmission");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v20, "hasPrefix:", v22);

    if (v23)
    {
      -[OSALog filepath](self->_package, "filepath");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "pathSubmission");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringByReplacingOccurrencesOfString:withString:", v26, &stru_1E954D0B0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringByDeletingLastPathComponent");
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v28 = &stru_1E954D0B0;
    }
    objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "crashReporterKey");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v41[0] = CFSTR("name");
    -[OSALog filepath](self->_package, "filepath");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "lastPathComponent");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v32;
    v42[1] = v30;
    v41[1] = CFSTR("proxied_dev");
    v41[2] = CFSTR("subdir");
    v42[2] = v28;
    v42[3] = v10;
    v41[3] = CFSTR("status");
    v41[4] = CFSTR("device_class");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", MGGetSInt32Answer());
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    event = self->_event;
    jid = self->_jid;
    v42[4] = v33;
    v42[5] = jid;
    v41[5] = CFSTR("jobId");
    v41[6] = CFSTR("jobEvent");
    v42[6] = event;
    v41[7] = CFSTR("jobType");
    -[PCCJob type](self, "type");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v42[7] = v36;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 8);
    v37 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    metadata = self->_metadata;
    self->_metadata = v37;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v39 = (NSDate *)objc_claimAutoreleasedReturnValue();
    lastTouch = self->_lastTouch;
    self->_lastTouch = v39;

  }
}

- (void)registerResult:(BOOL)a3 error:(id)a4
{
  _BOOL4 v5;
  id v7;
  OSALog *package;
  int v9;
  id v10;
  uint64_t v11;

  v5 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (v5)
  {
    -[OSALog retire:](self->_package, "retire:", "transferred");
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "finished transferring log successfully", (uint8_t *)&v9, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_1D3A90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "file send failure, abandoning job: %@", (uint8_t *)&v9, 0xCu);
    }
    objc_storeStrong((id *)&self->_errObj, a4);
  }
  package = self->_package;
  self->_package = 0;

}

- (NSString)jid
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)target
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (NSDate)lastTouch
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)event
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastTouch, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_jid, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_errObj, 0);
  objc_storeStrong((id *)&self->_package, 0);
}

@end
