@implementation SSRVoiceProfileMetadataManager

+ (void)saveVoiceTriggeRePromptMetadata:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDD1500]);
    objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLocale:", v5);

    objc_msgSend(v4, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("TRUE"), CFSTR("RePrompt_Finished"));
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringFromDate:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("RePrompt_Date"));

    v15 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v6, 1, &v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v15;
    if (v10)
    {
      v11 = (void *)*MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        v12 = v11;
        objc_msgSend(v10, "localizedDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v17 = "+[SSRVoiceProfileMetadataManager saveVoiceTriggeRePromptMetadata:]";
        v18 = 2114;
        v19 = v13;
        _os_log_error_impl(&dword_2117D4000, v12, OS_LOG_TYPE_ERROR, "%s ::: Error creating json RePrompt Metadata: %{public}@", buf, 0x16u);

      }
    }
    else
    {
      objc_msgSend(v9, "writeToFile:atomically:", v3, 0);
    }

  }
  else
  {
    v14 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "+[SSRVoiceProfileMetadataManager saveVoiceTriggeRePromptMetadata:]";
      _os_log_error_impl(&dword_2117D4000, v14, OS_LOG_TYPE_ERROR, "%s ERR: path is nil - Bailing out", buf, 0xCu);
    }
  }

}

+ (id)readVoiceTriggerRePromptMetadata:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v13 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v4, 0, &v13);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v13;
    if (v6)
    {
      v7 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v15 = "+[SSRVoiceProfileMetadataManager readVoiceTriggerRePromptMetadata:]";
        v16 = 2114;
        v17 = v3;
        v18 = 2114;
        v19 = v6;
        _os_log_error_impl(&dword_2117D4000, v7, OS_LOG_TYPE_ERROR, "%s Json-Err reading metaVersionDict: %{public}@: err: %{public}@", buf, 0x20u);
      }
      v8 = 0;
    }
    else
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("RePrompt_Date"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v10 = *MEMORY[0x24BE284B8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v15 = "+[SSRVoiceProfileMetadataManager readVoiceTriggerRePromptMetadata:]";
          v16 = 2112;
          v17 = v8;
          _os_log_debug_impl(&dword_2117D4000, v10, OS_LOG_TYPE_DEBUG, "%s RePrompted on %@", buf, 0x16u);
        }
        v11 = v8;
      }

    }
  }
  else
  {
    v9 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "+[SSRVoiceProfileMetadataManager readVoiceTriggerRePromptMetadata:]";
      v16 = 2114;
      v17 = v3;
      _os_log_error_impl(&dword_2117D4000, v9, OS_LOG_TYPE_ERROR, "%s ERR: Unexpected. metaVersionFileData is empty while the file exists at: %{public}@", buf, 0x16u);
    }
    v8 = 0;
  }

  return v8;
}

+ (void)saveUtteranceMetadataForUtterance:(id)a3 enrollmentType:(id)a4 isHandheldEnrollment:(BOOL)a5 triggerSource:(id)a6 audioInput:(id)a7 otherBiometricResult:(unint64_t)a8 containsPayload:(BOOL)a9
{
  _BOOL4 v12;
  id v15;
  __CFString *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  int v28;
  const char *v29;
  uint64_t v30;

  v12 = a5;
  v30 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = (__CFString *)a4;
  v17 = a6;
  v18 = a7;
  if (v15)
  {
    v19 = (void *)MEMORY[0x24BDBCED8];
    objc_msgSend(a1, "_getBaseMetaDictionaryForUtterancePath:", v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryWithDictionary:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      v22 = v16;
    else
      v22 = CFSTR("explicit");
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, CFSTR("trainingType"));
    if (v12)
      v23 = CFSTR("near-field");
    else
      v23 = CFSTR("far-field");
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v23, CFSTR("handheld"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a8);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v24, CFSTR("otherSourceProfileMatch"));

    objc_msgSend(v21, "setObject:forKeyedSubscript:", v17, CFSTR("triggerSource"));
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v18, CFSTR("audioInputSource"));
    objc_msgSend(MEMORY[0x24BE28488], "timeStampWithSaltGrain");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v25, CFSTR("grainedDate"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a9);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v26, CFSTR("containsPayload"));

    objc_msgSend(a1, "_writeMetaDict:forUtterancePath:", v21, v15);
  }
  else
  {
    v27 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      v28 = 136315138;
      v29 = "+[SSRVoiceProfileMetadataManager saveUtteranceMetadataForUtterance:enrollmentType:isHandheldEnrollment:trigg"
            "erSource:audioInput:otherBiometricResult:containsPayload:]";
      _os_log_error_impl(&dword_2117D4000, v27, OS_LOG_TYPE_ERROR, "%s ERR: uttPath is nil -  Bailing out", (uint8_t *)&v28, 0xCu);
    }
  }

}

+ (id)_getBaseMetaDictionaryForUtterancePath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v10[4];
  _QWORD v11[4];
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE28488], "deviceProductType", CFSTR("productType"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v4;
    v10[1] = CFSTR("productVersion");
    objc_msgSend(MEMORY[0x24BE28488], "deviceProductVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v5;
    v10[2] = CFSTR("buildVersion");
    objc_msgSend(MEMORY[0x24BE28488], "deviceBuildVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[3] = CFSTR("utteranceWav");
    v11[2] = v6;
    v11[3] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "+[SSRVoiceProfileMetadataManager _getBaseMetaDictionaryForUtterancePath:]";
      _os_log_error_impl(&dword_2117D4000, v8, OS_LOG_TYPE_ERROR, "%s ERR: uttPath is nil - Bailing out", buf, 0xCu);
    }
    v7 = (void *)MEMORY[0x24BDBD1B8];
  }

  return v7;
}

+ (void)_writeMetaDict:(id)a3 forUtterancePath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    if (v5)
    {
      v14 = 0;
      objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v5, 1, &v14);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v14;
      if (v8)
      {
        v9 = (void *)*MEMORY[0x24BE284B8];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
        {
LABEL_13:

          goto LABEL_14;
        }
        v10 = v9;
        objc_msgSend(v8, "localizedDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v16 = "+[SSRVoiceProfileMetadataManager _writeMetaDict:forUtterancePath:]";
        v17 = 2114;
        v18 = v11;
        _os_log_error_impl(&dword_2117D4000, v10, OS_LOG_TYPE_ERROR, "%s ::: Error creating json Metadata: %{public}@", buf, 0x16u);

      }
      else
      {
        objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR(".wav"), CFSTR(".json"));
        v10 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "writeToFile:atomically:", v10, 0);
      }

      goto LABEL_13;
    }
    v12 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "+[SSRVoiceProfileMetadataManager _writeMetaDict:forUtterancePath:]";
      v13 = "%s ERR: uttMeta is nil - Bailing out";
      goto LABEL_10;
    }
  }
  else
  {
    v12 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "+[SSRVoiceProfileMetadataManager _writeMetaDict:forUtterancePath:]";
      v13 = "%s ERR: uttPath is nil - Bailing out";
LABEL_10:
      _os_log_error_impl(&dword_2117D4000, v12, OS_LOG_TYPE_ERROR, v13, buf, 0xCu);
    }
  }
LABEL_14:

}

+ (BOOL)isUtteranceImplicitlyTrained:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  char v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x24BDBCE50];
    objc_msgSend(v3, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataWithContentsOfFile:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v17 = 0;
      objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v7, 0, &v17);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v17;
      if (v9)
      {
        v10 = *MEMORY[0x24BE284B8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v19 = "+[SSRVoiceProfileMetadataManager isUtteranceImplicitlyTrained:]";
          v20 = 2114;
          v21 = v4;
          v22 = 2114;
          v23 = v9;
          _os_log_error_impl(&dword_2117D4000, v10, OS_LOG_TYPE_ERROR, "%s ERR: read metafile %{public}@ failed with %{public}@ - defaulting to NO", buf, 0x20u);
        }
        v11 = 0;
      }
      else
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("trainingType"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
          v11 = objc_msgSend(v14, "isEqualToString:", CFSTR("implicit"));
        else
          v11 = 0;

      }
    }
    else
    {
      v13 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "+[SSRVoiceProfileMetadataManager isUtteranceImplicitlyTrained:]";
        v20 = 2114;
        v21 = v4;
        _os_log_error_impl(&dword_2117D4000, v13, OS_LOG_TYPE_ERROR, "%s ERR: metaData is nil, defaulting to NO for %{public}@", buf, 0x16u);
      }
      v11 = 0;
    }

  }
  else
  {
    v12 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "+[SSRVoiceProfileMetadataManager isUtteranceImplicitlyTrained:]";
      _os_log_error_impl(&dword_2117D4000, v12, OS_LOG_TYPE_ERROR, "%s ERR: uttMetaURL is nil, defaulting to NO", buf, 0xCu);
    }
    v11 = 0;
  }

  return v11;
}

+ (id)getUtteranceEnrollmentType:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "URLByDeletingPathExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLByAppendingPathExtension:", CFSTR("json"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x24BDBCE50];
    objc_msgSend(v6, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dataWithContentsOfFile:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v15 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v23 = "+[SSRVoiceProfileMetadataManager getUtteranceEnrollmentType:]";
        v24 = 2114;
        v25 = v4;
        _os_log_impl(&dword_2117D4000, v15, OS_LOG_TYPE_DEFAULT, "%s metaData is nil for %{public}@ - Bailing out", buf, 0x16u);
      }
      v14 = 0;
      goto LABEL_21;
    }
    v21 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v9, 0, &v21);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v21;
    if (v11)
    {
      v12 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v23 = "+[SSRVoiceProfileMetadataManager getUtteranceEnrollmentType:]";
        v24 = 2114;
        v25 = v4;
        v26 = 2114;
        v27 = v11;
        _os_log_error_impl(&dword_2117D4000, v12, OS_LOG_TYPE_ERROR, "%s ERR: read metafile %{public}@ failed with %{public}@ - Bailing out", buf, 0x20u);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("trainingType"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v16;
        if (v16)
          v17 = v16;

        goto LABEL_20;
      }
      v18 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v23 = "+[SSRVoiceProfileMetadataManager getUtteranceEnrollmentType:]";
        v24 = 2114;
        v25 = v4;
        v26 = 2114;
        v27 = v10;
        _os_log_error_impl(&dword_2117D4000, v18, OS_LOG_TYPE_ERROR, "%s ERR: metaDict from file %{public}@ isnt a dictionary - %{public}@", buf, 0x20u);
      }
      objc_msgSend(MEMORY[0x24BE28400], "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "submitVoiceIdIssueReport:", *MEMORY[0x24BE28508]);

    }
    v14 = 0;
LABEL_20:

LABEL_21:
    goto LABEL_22;
  }
  v13 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "+[SSRVoiceProfileMetadataManager getUtteranceEnrollmentType:]";
    _os_log_error_impl(&dword_2117D4000, v13, OS_LOG_TYPE_ERROR, "%s ERR: uttMetaURL is nil - Bailing out", buf, 0xCu);
  }
  v14 = 0;
LABEL_22:

  return v14;
}

+ (id)recordedTimeStampOfFile:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByDeletingPathExtension");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "stringByAppendingPathExtension:", CFSTR("json"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v7, "fileExistsAtPath:", v6);

  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v19 = 0;
      objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v8, 0, &v19);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v19;
      if (v10)
      {
        v11 = *MEMORY[0x24BE284B8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v21 = "+[SSRVoiceProfileMetadataManager recordedTimeStampOfFile:]";
          v22 = 2114;
          v23 = v3;
          v24 = 2114;
          v25 = v10;
          _os_log_error_impl(&dword_2117D4000, v11, OS_LOG_TYPE_ERROR, "%s Json-Err reading metaVersionFile: %{public}@: err: %{public}@", buf, 0x20u);
        }
        v12 = 0;
      }
      else
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("grainedDate"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = objc_alloc_init(MEMORY[0x24BDD1500]);
          objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setLocale:", v17);

          objc_msgSend(v16, "setDateFormat:", CFSTR("yyyyMMdd"));
          objc_msgSend(v16, "dateFromString:", v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v12 = 0;
        }

      }
    }
    else
    {
      v14 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v21 = "+[SSRVoiceProfileMetadataManager recordedTimeStampOfFile:]";
        v22 = 2114;
        v23 = v6;
        _os_log_error_impl(&dword_2117D4000, v14, OS_LOG_TYPE_ERROR, "%s ERR: Unexpected. metaVersionFileData is empty while the file exists at: %{public}@", buf, 0x16u);
      }
      v12 = 0;
    }

  }
  else
  {
    v13 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "+[SSRVoiceProfileMetadataManager recordedTimeStampOfFile:]";
      v22 = 2114;
      v23 = v6;
      _os_log_error_impl(&dword_2117D4000, v13, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@ is not present", buf, 0x16u);
    }
    v12 = 0;
  }

  return v12;
}

+ (id)recordedTimeStampFromFileName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "lastPathComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByDeletingPathExtension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_alloc_init(MEMORY[0x24BDD1500]);
    objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLocale:", v8);

    objc_msgSend(v7, "setDateFormat:", CFSTR("yyyyMMdd-HHmmss"));
    objc_msgSend(v7, "dateFromString:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      v12 = 136315138;
      v13 = "+[SSRVoiceProfileMetadataManager recordedTimeStampFromFileName:]";
      _os_log_error_impl(&dword_2117D4000, v10, OS_LOG_TYPE_ERROR, "%s ERR: filePath is nil!", (uint8_t *)&v12, 0xCu);
    }
    v9 = 0;
  }

  return v9;
}

@end
