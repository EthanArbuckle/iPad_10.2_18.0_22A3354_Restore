@implementation SSREnrollmentDataManager

+ (void)saveRawUtteranceAndMetadata:(id)a3 to:(id)a4 isExplicitEnrollment:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  os_log_t *v10;
  NSObject *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  NSObject *v19;
  int v20;
  const char *v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v5 = a5;
  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (os_log_t *)MEMORY[0x24BE284B8];
  v11 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v12 = CFSTR("implicit");
    if (v5)
      v12 = CFSTR("explicit");
    v20 = 136315394;
    v21 = "+[SSREnrollmentDataManager saveRawUtteranceAndMetadata:to:isExplicitEnrollment:]";
    v22 = 2114;
    v23 = v12;
    _os_log_impl(&dword_2117D4000, v11, OS_LOG_TYPE_DEFAULT, "%s Saving utterance and meta as %{public}@ training.", (uint8_t *)&v20, 0x16u);
  }
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "stringByAppendingString:", CFSTR(".wav"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByAppendingString:", CFSTR(".json"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingPathComponent:", v15);
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingPathComponent:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "writeToFile:atomically:", v17, 1) & 1) != 0)
  {
    objc_msgSend(a1, "saveMetadata:isExplicitEnrollment:", v18, v5);
  }
  else
  {
    v19 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 136315394;
      v21 = "+[SSREnrollmentDataManager saveRawUtteranceAndMetadata:to:isExplicitEnrollment:]";
      v22 = 2114;
      v23 = v17;
      _os_log_impl(&dword_2117D4000, v19, OS_LOG_TYPE_DEFAULT, "%s Failed to write utterance into %{public}@", (uint8_t *)&v20, 0x16u);
    }
  }

}

+ (BOOL)saveUtteranceAndMetadata:(id)a3 atDirectory:(id)a4 isExplicitEnrollment:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unsigned int v16;
  NSObject *v17;
  unint64_t v18;
  const __CFString *v19;
  char v20;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  const __CFString *v30;
  uint64_t v31;

  v5 = a5;
  v31 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "stringByAppendingString:", CFSTR(".wav"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingString:", CFSTR(".json"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v7, "length");
  v16 = objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleByteDepth");
  v17 = *MEMORY[0x24BE284B8];
  v18 = v15 / v16;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v19 = CFSTR("implicit");
    *(_DWORD *)buf = 136315906;
    v24 = "+[SSREnrollmentDataManager saveUtteranceAndMetadata:atDirectory:isExplicitEnrollment:]";
    if (v5)
      v19 = CFSTR("explicit");
    v25 = 2114;
    v26 = v10;
    v27 = 2114;
    v28 = v8;
    v29 = 2114;
    v30 = v19;
    _os_log_impl(&dword_2117D4000, v17, OS_LOG_TYPE_DEFAULT, "%s Saving %{public}@ at %{public}@ as %{public}@ training.", buf, 0x2Au);
  }
  if (objc_msgSend(a1, "saveUtterance:utteranceAudioPath:numSamplesToWrite:isExplicitEnrollment:", v7, v13, v18, v5))v20 = objc_msgSend(a1, "saveMetadata:isExplicitEnrollment:", v14, v5);
  else
    v20 = 0;

  return v20;
}

+ (BOOL)saveUtterance:(id)a3 utteranceAudioPath:(id)a4 numSamplesToWrite:(unint64_t)a5 isExplicitEnrollment:(BOOL)a6
{
  id v8;
  id v9;
  os_log_t *v10;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  BOOL v16;
  os_log_t v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  os_log_t v21;
  uint64_t v23;
  _BYTE v24[40];
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  unint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (os_log_t *)MEMORY[0x24BE284B8];
  v11 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "+[SSREnrollmentDataManager saveUtterance:utteranceAudioPath:numSamplesToWrite:isExplicitEnrollment:]";
    v27 = 2050;
    v28 = a5;
    _os_log_impl(&dword_2117D4000, v11, OS_LOG_TYPE_DEFAULT, "%s numSamplesToWrite %{public}lu", buf, 0x16u);
  }
  v12 = v8;
  v13 = objc_alloc(MEMORY[0x24BE28470]);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE28410], "lpcmInt16ASBD");
  objc_msgSend(MEMORY[0x24BE28410], "lpcmInt16ASBD");
  v15 = (void *)objc_msgSend(v13, "initWithURL:inputFormat:outputFormat:", v14, v24, &v23);

  if (!v15)
  {
    v17 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "+[SSREnrollmentDataManager saveUtterance:utteranceAudioPath:numSamplesToWrite:isExplicitEnrollment:]";
      v18 = "%s Failed to get CSAudioFileWriter:";
      v19 = v17;
      v20 = 12;
LABEL_14:
      _os_log_error_impl(&dword_2117D4000, v19, OS_LOG_TYPE_ERROR, v18, buf, v20);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  if ((objc_msgSend(v15, "addSamples:numSamples:", objc_msgSend(objc_retainAutorelease(v12), "bytes"), a5) & 1) == 0)
  {
    v21 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "+[SSREnrollmentDataManager saveUtterance:utteranceAudioPath:numSamplesToWrite:isExplicitEnrollment:]";
      v27 = 2114;
      v28 = (unint64_t)v15;
      v18 = "%s Failed to addSamples to CSAudioFileWriter: %{public}@";
LABEL_13:
      v19 = v21;
      v20 = 22;
      goto LABEL_14;
    }
LABEL_15:
    v16 = 0;
    goto LABEL_16;
  }
  if ((objc_msgSend(v15, "endAudio") & 1) == 0)
  {
    v21 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "+[SSREnrollmentDataManager saveUtterance:utteranceAudioPath:numSamplesToWrite:isExplicitEnrollment:]";
      v27 = 2114;
      v28 = (unint64_t)v15;
      v18 = "%s Failed to endAudio on CSAudioFileWriter: %{public}@";
      goto LABEL_13;
    }
    goto LABEL_15;
  }
  v16 = 1;
LABEL_16:

  return v16;
}

+ (BOOL)saveMetadata:(id)a3 isExplicitEnrollment:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  char v14;
  NSObject *v15;
  int v17;
  const char *v18;
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR(".json"), CFSTR(".wav"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BDBCED8];
    objc_msgSend(a1, "_getBaseMetaDictionaryForUtterancePath:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryWithDictionary:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      v12 = CFSTR("explicit");
    else
      v12 = CFSTR("implicit");
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("trainingType"));
    objc_msgSend(MEMORY[0x24BE28488], "timeStampWithSaltGrain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("grainedDate"));

    v14 = objc_msgSend(a1, "writeMetaDict:atMetaPath:", v11, v7);
  }
  else
  {
    v15 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      v17 = 136315138;
      v18 = "+[SSREnrollmentDataManager saveMetadata:isExplicitEnrollment:]";
      _os_log_error_impl(&dword_2117D4000, v15, OS_LOG_TYPE_ERROR, "%s ERR: called with nil metaPath", (uint8_t *)&v17, 0xCu);
    }
    v14 = 0;
  }

  return v14;
}

+ (id)_getBaseMetaDictionaryForUtterancePath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v9[3];
  _QWORD v10[3];
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE28488], "deviceProductType", CFSTR("productType"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v4;
    v9[1] = CFSTR("productVersion");
    objc_msgSend(MEMORY[0x24BE28488], "deviceProductVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2] = CFSTR("utteranceWav");
    v10[1] = v5;
    v10[2] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "+[SSREnrollmentDataManager _getBaseMetaDictionaryForUtterancePath:]";
      _os_log_error_impl(&dword_2117D4000, v7, OS_LOG_TYPE_ERROR, "%s ERR: called with nil uttPath", buf, 0xCu);
    }
    v6 = (void *)MEMORY[0x24BDBD1B8];
  }

  return v6;
}

+ (BOOL)writeMetaDict:(id)a3 atMetaPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  char v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  NSObject *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (!v6)
  {
    v10 = *MEMORY[0x24BE284B8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
LABEL_8:
      v9 = 0;
      goto LABEL_13;
    }
    *(_DWORD *)buf = 136315138;
    v18 = "+[SSREnrollmentDataManager writeMetaDict:atMetaPath:]";
    v11 = "%s ERR: called with nil metaPath";
LABEL_15:
    _os_log_error_impl(&dword_2117D4000, v10, OS_LOG_TYPE_ERROR, v11, buf, 0xCu);
    goto LABEL_8;
  }
  if (!v5)
  {
    v10 = *MEMORY[0x24BE284B8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    *(_DWORD *)buf = 136315138;
    v18 = "+[SSREnrollmentDataManager writeMetaDict:atMetaPath:]";
    v11 = "%s ERR: called with nil uttMeta";
    goto LABEL_15;
  }
  v16 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v5, 3, &v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v16;
  if (v7)
  {
    v9 = objc_msgSend(v7, "writeToFile:atomically:", v6, 1);
  }
  else
  {
    v12 = (void *)*MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      v14 = v12;
      objc_msgSend(v8, "localizedDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v18 = "+[SSREnrollmentDataManager writeMetaDict:atMetaPath:]";
      v19 = 2114;
      v20 = v15;
      _os_log_error_impl(&dword_2117D4000, v14, OS_LOG_TYPE_ERROR, "%s Cannot create json file : %{public}@", buf, 0x16u);

    }
    v9 = 0;
  }

LABEL_13:
  return v9;
}

@end
