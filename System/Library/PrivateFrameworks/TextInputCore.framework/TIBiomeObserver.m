@implementation TIBiomeObserver

- (void)sessionDidEnd:(id)a3 aligned:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "endTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "endTime");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "compare:", v7);

    if (v8 == 1)
    {
      BiomeLibrary();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "Text");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "InputSession");
      v11 = objc_claimAutoreleasedReturnValue();

      v12 = objc_alloc(MEMORY[0x1E0CB3588]);
      objc_msgSend(v4, "startTime");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "endTime");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v12, "initWithStartDate:endDate:", v13, v14);

      v16 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v15, "duration");
      objc_msgSend(v16, "numberWithDouble:");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_alloc(MEMORY[0x1E0D02330]);
      objc_msgSend(v4, "startTime");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "applicationID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sessionId");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "UUIDString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v18, "initWithDuration:timestamp:bundleID:sessionInput:sessionID:", v17, v19, v20, 1, v22);

      -[NSObject source](v11, "source");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "sendEvent:", v23);

    }
    else
    {
      IXADefaultLogFacility();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        goto LABEL_9;
      v25 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v4, "startTime");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "endTime");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stringWithFormat:", CFSTR("%s Session startTime:%@ is later than endTime:%@"), "-[TIBiomeObserver sessionDidEnd:aligned:]", v17, v23);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v27 = v15;
      _os_log_error_impl(&dword_1DA6F2000, v11, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

  }
  else
  {
    IXADefaultLogFacility();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Session has nil endTime"), "-[TIBiomeObserver sessionDidEnd:aligned:]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v27 = v15;
    _os_log_error_impl(&dword_1DA6F2000, v11, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }

LABEL_9:
}

@end
