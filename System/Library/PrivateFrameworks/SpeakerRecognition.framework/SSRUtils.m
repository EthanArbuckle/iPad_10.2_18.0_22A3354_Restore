@implementation SSRUtils

+ (id)stringForInvocationStyle:(unint64_t)a3
{
  if (a3 < 3)
    return off_24CC85600[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown InvocationStyle: %lu"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)stringForCSSpIdType:(unint64_t)a3
{
  if (a3 - 1 < 5)
    return off_24CC85618[a3 - 1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown CSSpIdType: %lu"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (unint64_t)explicitSpIdTypeForSpId:(unint64_t)a3
{
  if (a3 - 3 < 2)
    return 4;
  else
    return 5;
}

+ (unint64_t)spIdTypeForString:(id)a3
{
  id v3;
  unint64_t v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("td")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ti")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("tdti")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("tdtiexplicit")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("tdexplicit")) & 1) != 0)
  {
    v4 = 5;
  }
  else
  {
    v5 = *MEMORY[0x24BE28360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315394;
      v8 = "+[SSRUtils spIdTypeForString:]";
      v9 = 2112;
      v10 = v3;
      _os_log_impl(&dword_2117D4000, v5, OS_LOG_TYPE_DEFAULT, "%s Unknown CSSpIdType string: %@", (uint8_t *)&v7, 0x16u);
    }
    v4 = 0;
  }

  return v4;
}

+ (id)stringForSpeakerRecognizerType:(unint64_t)a3
{
  __CFString *v3;

  if (a3 == 2)
    return CFSTR("SAT");
  if (a3 == 1)
  {
    v3 = CFSTR("PSR");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown SpeakerRecognizerType: %lu"), a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (id)stringForVoiceProfileRetrainerType:(unint64_t)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("SAT");
  if (a3 == 2)
  {
    v3 = CFSTR("PSR");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown VoiceProfileRetrainerType: %lu"), a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (id)satConfigFileNameForCSSpIdType:(unint64_t)a3
{
  int v4;
  __CFString *v5;
  int v6;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a3 == 5)
  {
    v6 = CSIsCommunalDevice();
    v5 = CFSTR("config_sr_sat.txt");
    if (v6)
      v5 = CFSTR("config_td_spid.txt");
    return v5;
  }
  if (a3 == 1)
  {
    v4 = CSIsCommunalDevice();
    v5 = CFSTR("config.txt");
    if (v4)
      v5 = 0;
    return v5;
  }
  v8 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
  {
    v9 = 136315394;
    v10 = "+[SSRUtils satConfigFileNameForCSSpIdType:]";
    v11 = 2048;
    v12 = a3;
    _os_log_error_impl(&dword_2117D4000, v8, OS_LOG_TYPE_ERROR, "%s ERR: Unknown CSSpIdType: %lu", (uint8_t *)&v9, 0x16u);
  }
  return 0;
}

+ (id)psrConfigFileNameForCSSpIdType:(unint64_t)a3
{
  int v4;
  __CFString *v5;
  const __CFString *v6;
  id result;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  switch(a3)
  {
    case 1uLL:
    case 5uLL:
      v4 = CSIsCommunalDevice();
      v5 = CFSTR("config_sr_sat.txt");
      v6 = CFSTR("config_td_spid.txt");
      goto LABEL_4;
    case 3uLL:
    case 4uLL:
      v4 = CSIsCommunalDevice();
      v5 = CFSTR("config_sr_sat.txt");
      v6 = CFSTR("config_tdti_spid.txt");
LABEL_4:
      if (v4)
        v5 = (__CFString *)v6;
      result = v5;
      break;
    default:
      v8 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        v9 = 136315394;
        v10 = "+[SSRUtils psrConfigFileNameForCSSpIdType:]";
        v11 = 2048;
        v12 = a3;
        _os_log_error_impl(&dword_2117D4000, v8, OS_LOG_TYPE_ERROR, "%s ERR: Unknown CSSpIdType: %lu", (uint8_t *)&v9, 0x16u);
      }
      result = 0;
      break;
  }
  return result;
}

+ (id)satConfigFileNameForCSSpIdType:(unint64_t)a3 forModelType:(unint64_t)a4 forAssetType:(unint64_t)a5
{
  int v7;
  unint64_t v8;
  id result;
  __CFString *v10;
  NSObject *v11;
  const char *v12;
  int v13;
  const char *v14;
  __int16 v15;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = CSIsCommunalDevice();
  v8 = a3 - 1;
  if (v7)
  {
    if (v8 >= 5)
    {
      v11 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        v13 = 136315394;
        v14 = "+[SSRUtils satConfigFileNameForCSSpIdType:forModelType:forAssetType:]";
        v15 = 2048;
        v16 = a3;
        v12 = "%s ERR: Unknown CSSpIdType: %lu";
LABEL_13:
        _os_log_error_impl(&dword_2117D4000, v11, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v13, 0x16u);
      }
      return 0;
    }
    else
    {
      return off_24CC85640[v8];
    }
  }
  else
  {
    switch(a3)
    {
      case 1uLL:
      case 3uLL:
      case 4uLL:
      case 5uLL:
        v10 = CFSTR("config.txt");
        if (a4 == 1)
          v10 = CFSTR("config_sr_sat.txt");
        result = v10;
        break;
      default:
        v11 = *MEMORY[0x24BE284B8];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
          return 0;
        v13 = 136315394;
        v14 = "+[SSRUtils satConfigFileNameForCSSpIdType:forModelType:forAssetType:]";
        v15 = 2048;
        v16 = a3;
        v12 = "%s Unknown CSSpIdType: %lu";
        goto LABEL_13;
    }
  }
  return result;
}

+ (id)spIdVoiceProfileImportRootDir
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLsForDirectory:inDomains:", 9, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("spid-imported"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)createDirectoryIfDoesNotExist:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  BOOL v7;
  int v8;
  os_log_t *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  id v17;
  char v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v18 = 0;
  if (v3)
  {
    v6 = objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v3, &v18);
    if (v6)
      v7 = v18 == 0;
    else
      v7 = 1;
    if (v7)
    {
      if (v18)
        v8 = 0;
      else
        v8 = v6;
      v9 = (os_log_t *)MEMORY[0x24BE28360];
      if (v8 == 1)
      {
        v10 = *MEMORY[0x24BE28360];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v20 = "+[SSRUtils createDirectoryIfDoesNotExist:]";
          v21 = 2112;
          v22 = v3;
          _os_log_impl(&dword_2117D4000, v10, OS_LOG_TYPE_DEFAULT, "%s Direntry with same name exists, this will be removed: %@", buf, 0x16u);
        }
        objc_msgSend(v5, "removeItemAtPath:error:", v3, 0);
      }
      v11 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "+[SSRUtils createDirectoryIfDoesNotExist:]";
        v21 = 2112;
        v22 = v3;
        _os_log_impl(&dword_2117D4000, v11, OS_LOG_TYPE_DEFAULT, "%s Creating Directory : %@", buf, 0x16u);
      }
      v17 = 0;
      objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v17);
      v12 = v17;
      if (v12)
      {
        v13 = *v9;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = v13;
          objc_msgSend(v12, "localizedDescription");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v20 = "+[SSRUtils createDirectoryIfDoesNotExist:]";
          v21 = 2112;
          v22 = v15;
          _os_log_impl(&dword_2117D4000, v14, OS_LOG_TYPE_DEFAULT, "%s Creating Directory failed : %@", buf, 0x16u);

        }
      }

    }
  }
  else
  {
    v16 = *MEMORY[0x24BE28360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "+[SSRUtils createDirectoryIfDoesNotExist:]";
      _os_log_impl(&dword_2117D4000, v16, OS_LOG_TYPE_DEFAULT, "%s path is nil - Bailing out", buf, 0xCu);
    }
  }

}

+ (id)ssrAudioLogsDir
{
  void *v2;
  void *v3;

  NSHomeDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Library/Logs/CrashReporter/ssr"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)ssrAudioLogsCountWithinPrivacyLimit
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  BOOL v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  +[SSRUtils ssrAudioLogsDir](SSRUtils, "ssrAudioLogsDir");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v3, "contentsOfDirectoryAtPath:error:", v2, &v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v14;

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("self ENDSWITH '.wav'"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "filteredArrayUsingPredicate:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "count");
    v9 = v8 < 0x65;
    if (v8 >= 0x65)
    {
      v10 = (void *)*MEMORY[0x24BE28360];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
      {
        v11 = v10;
        v12 = objc_msgSend(v7, "count");
        *(_DWORD *)buf = 136315650;
        v16 = "+[SSRUtils ssrAudioLogsCountWithinPrivacyLimit]";
        v17 = 2048;
        v18 = v12;
        v19 = 1024;
        v20 = 100;
        _os_log_impl(&dword_2117D4000, v11, OS_LOG_TYPE_DEFAULT, "%s Exceeded privacy limit for grading utterances : %ld (%d)", buf, 0x1Cu);

      }
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (void)cleanupOrphanedVoiceIdGradingFiles
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  uint8_t v28[128];
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  _QWORD v35[4];

  v35[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "ssrAudioLogsDir");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = *MEMORY[0x24BDBCCD0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v3, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v4, v5, 0, &v27);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v27;

  if (v7)
  {
    v8 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v30 = "+[SSRUtils cleanupOrphanedVoiceIdGradingFiles]";
      v31 = 2114;
      v32 = v2;
      v33 = 2114;
      v34 = v7;
      _os_log_error_impl(&dword_2117D4000, v8, OS_LOG_TYPE_ERROR, "%s ERR: reading contents of gradingDir: %{public}@ with error %{public}@", buf, 0x20u);
    }
  }
  else
  {
    v21 = v3;
    v22 = v2;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v20 = v6;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v15, "absoluteString");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "lastPathComponent");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stringByDeletingPathExtension");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
            objc_msgSend(v9, "removeObjectForKey:", v18);
          else
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v18);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v12);
    }

    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_4401);
    v3 = v21;
    v2 = v22;
    v6 = v20;
  }

}

+ (id)spidAudioTrainUtterancesDir
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x24BDBCF48];
  NSTemporaryDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("VoiceProfileCache"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSRUtils createDirectoryIfDoesNotExist:](SSRUtils, "createDirectoryIfDoesNotExist:", v6);

  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (void)streamAudioFromFileUrl:(id)a3 audioStreamBasicDescriptor:(AudioStreamBasicDescription *)a4 samplesPerStreamChunk:(unint64_t)a5 audioDataAvailableHandler:(id)a6
{
  const __CFURL *v9;
  _QWORD *v10;
  UInt32 v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void (*v17)(_QWORD *, AudioBufferList *, uint64_t, void *);
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void (*v22)(_QWORD *, AudioBufferList *, uint64_t, void *);
  uint64_t i;
  uint64_t v24;
  void (*v25)(_QWORD *, AudioBufferList *, _QWORD, _QWORD);
  void (*v26)(_QWORD *, AudioBufferList *, uint64_t, _QWORD);
  UInt32 ioNumberFrames;
  AudioBufferList v28;
  ExtAudioFileRef outExtAudioFile;
  AudioFileID outAudioFile;
  AudioBufferList ioData;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v9 = (const __CFURL *)a3;
  v10 = a6;
  v11 = a4->mBitsPerChannel * a5 * a4->mChannelsPerFrame;
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", a4->mBitsPerChannel * a5 * a4->mChannelsPerFrame);
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  outAudioFile = 0;
  *(_QWORD *)&ioData.mNumberBuffers = 1;
  ioData.mBuffers[0].mNumberChannels = 1;
  ioData.mBuffers[0].mDataByteSize = v11;
  ioData.mBuffers[0].mData = (void *)objc_msgSend(v12, "mutableBytes");
  outExtAudioFile = 0;
  if (AudioFileOpenURL(v9, kAudioFileReadPermission, 0, &outAudioFile))
  {
    NSLog(CFSTR("AudioFileOpenURL Failed : %@"), v9);
    v13 = (void *)MEMORY[0x24BDD1540];
    v34 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("AudioFileOpenURL failed: %@"), v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("EARTests"), 1001, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void (*)(_QWORD *, AudioBufferList *, uint64_t, void *))v10[2];
    v28 = ioData;
    v17(v10, &v28, 1, v16);

  }
  else if (ExtAudioFileWrapAudioFileID(outAudioFile, 0, &outExtAudioFile))
  {
    NSLog(CFSTR("ExtAudioFileWrapAudioFileID failed: %@"), v9);
    v18 = (void *)MEMORY[0x24BDD1540];
    v32 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ExtAudioFileWrapAudioFileID failed: %@"), v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("EARTests"), 1002, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    AudioFileClose(outAudioFile);
    v22 = (void (*)(_QWORD *, AudioBufferList *, uint64_t, void *))v10[2];
    v28 = ioData;
    v22(v10, &v28, 1, v21);

  }
  else
  {
    ExtAudioFileSetProperty(outExtAudioFile, 0x63666D74u, 0x28u, a4);
    for (i = 0; ; i += ioData.mBuffers[0].mDataByteSize)
    {
      ioNumberFrames = a5;
      v24 = ExtAudioFileRead(outExtAudioFile, &ioNumberFrames, &ioData);
      if ((_DWORD)v24)
      {
        NSLog(CFSTR("Error reading audio-file: %d"), v24);
        goto LABEL_11;
      }
      if (!ioNumberFrames)
        break;
      v25 = (void (*)(_QWORD *, AudioBufferList *, _QWORD, _QWORD))v10[2];
      v28 = ioData;
      v25(v10, &v28, 0, 0);
    }
    NSLog(CFSTR("EOF. Num bytes read: %lu"), i);
LABEL_11:
    v26 = (void (*)(_QWORD *, AudioBufferList *, uint64_t, _QWORD))v10[2];
    v28 = ioData;
    v26(v10, &v28, 1, 0);
    ExtAudioFileDispose(outExtAudioFile);
    AudioFileClose(outAudioFile);
  }

}

+ (BOOL)isSpeakerRecognitionSupportedInLocale:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[SSRAssetManager sharedManager](SSRAssetManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "installedAssetOfType:forLanguage:", 3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSRUtils satConfigFileNameForCSSpIdType:forModelType:forAssetType:](SSRUtils, "satConfigFileNameForCSSpIdType:forModelType:forAssetType:", 3, 1, objc_msgSend(v5, "assetProvider"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resourcePath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v6, "fileExistsAtPath:", v9);
  if ((v10 & 1) == 0)
  {
    v11 = *MEMORY[0x24BE28360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315394;
      v14 = "+[SSRUtils isSpeakerRecognitionSupportedInLocale:]";
      v15 = 2114;
      v16 = v3;
      _os_log_impl(&dword_2117D4000, v11, OS_LOG_TYPE_DEFAULT, "%s VoiceId not supported in language %{public}@", (uint8_t *)&v13, 0x16u);
    }
  }

  return v10;
}

+ (id)readJsonFileAtPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  NSObject *v9;
  uint32_t v10;
  void *v11;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  char v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v20 = 0;
  if (v3)
  {
    if (objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v3, &v20))
    {
      if (v20)
      {
        v6 = *MEMORY[0x24BE28360];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v22 = "+[SSRUtils readJsonFileAtPath:]";
          v23 = 2112;
          v24 = v3;
          v7 = "%s ERR: %@ is a directory";
LABEL_10:
          v9 = v6;
          v10 = 22;
          goto LABEL_11;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v3);
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)v13;
          v19 = 0;
          objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v13, 0, &v19);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v19;
          v16 = v15;
          if (v11 && !v15)
          {

            goto LABEL_13;
          }
          v18 = *MEMORY[0x24BE28360];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            v22 = "+[SSRUtils readJsonFileAtPath:]";
            v23 = 2112;
            v24 = v3;
            v25 = 2112;
            v26 = v16;
            _os_log_impl(&dword_2117D4000, v18, OS_LOG_TYPE_DEFAULT, "%s ERR: Could not read existing %@ file: err: %@", buf, 0x20u);
          }

        }
        else
        {
          v17 = *MEMORY[0x24BE284B8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v22 = "+[SSRUtils readJsonFileAtPath:]";
            v23 = 2112;
            v24 = v3;
            _os_log_error_impl(&dword_2117D4000, v17, OS_LOG_TYPE_ERROR, "%s Unable to read data from file: %@", buf, 0x16u);
          }
        }
      }
    }
    else
    {
      v6 = *MEMORY[0x24BE28360];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v22 = "+[SSRUtils readJsonFileAtPath:]";
        v23 = 2112;
        v24 = v3;
        v7 = "%s ERR: file do not exist - %@";
        goto LABEL_10;
      }
    }
  }
  else
  {
    v8 = *MEMORY[0x24BE28360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "+[SSRUtils readJsonFileAtPath:]";
      v7 = "%s ERR: filePath passed as nil - Bailing out";
      v9 = v8;
      v10 = 12;
LABEL_11:
      _os_log_impl(&dword_2117D4000, v9, OS_LOG_TYPE_DEFAULT, v7, buf, v10);
    }
  }
  v11 = 0;
LABEL_13:

  return v11;
}

+ (unint64_t)getVoiceProfileProductCategoryFromVersionFilePath:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;

  +[SSRUtils readJsonFileAtPath:](SSRUtils, "readJsonFileAtPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("VoiceProfileCategoryType"));
    v5 = objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("VoiceProfileCategoryType"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (int)objc_msgSend(v6, "intValue");

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)getVoiceProfileIdentityFromVersionFilePath:(id)a3
{
  void *v3;
  void *v4;

  +[SSRUtils readJsonFileAtPath:](SSRUtils, "readJsonFileAtPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("VoiceProfileIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)deviceCategoryStringRepresentationForCategoryType:(unint64_t)a3
{
  if (a3 - 1 > 4)
    return CFSTR("kCSDeviceCategory_Unknown");
  else
    return off_24CC85668[a3 - 1];
}

+ (unint64_t)deviceCategoryForDeviceProductType:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (deviceCategoryForDeviceProductType__onceToken == -1)
  {
    if (!v3)
      goto LABEL_16;
  }
  else
  {
    dispatch_once(&deviceCategoryForDeviceProductType__onceToken, &__block_literal_global_155);
    if (!v4)
      goto LABEL_16;
  }
  if ((objc_msgSend((id)deviceCategoryForDeviceProductType__nonAopDeviceSet, "containsObject:", v4) & 1) == 0
    && (objc_msgSend(v4, "containsString:", CFSTR("iPod")) & 1) == 0)
  {
    if ((objc_msgSend(v4, "containsString:", CFSTR("Mac")) & 1) != 0)
    {
      v5 = 3;
      goto LABEL_17;
    }
    if ((objc_msgSend(v4, "containsString:", CFSTR("iPad")) & 1) != 0
      || (objc_msgSend(v4, "containsString:", CFSTR("iPhone")) & 1) != 0)
    {
      v5 = 2;
      goto LABEL_17;
    }
    if ((objc_msgSend(v4, "containsString:", CFSTR("Accessory")) & 1) != 0
      || (objc_msgSend(v4, "containsString:", CFSTR("AppleTV")) & 1) != 0)
    {
      v5 = 4;
      goto LABEL_17;
    }
    v6 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315394;
      v9 = "+[SSRUtils deviceCategoryForDeviceProductType:]";
      v10 = 2112;
      v11 = v4;
      _os_log_impl(&dword_2117D4000, v6, OS_LOG_TYPE_DEFAULT, "%s Unknown Device category for deviceProduceType: %@", (uint8_t *)&v8, 0x16u);
    }
LABEL_16:
    v5 = 0;
    goto LABEL_17;
  }
  v5 = 1;
LABEL_17:

  return v5;
}

+ (BOOL)isCurrentDeviceCompatibleWithNewerVoiceProfileAt:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  NSObject *v14;
  unint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v21;
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BE28488];
  v4 = a3;
  objc_msgSend(v3, "deviceProductType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("enrollment_version.json"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v10 = *MEMORY[0x24BE284B8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v21 = 136315394;
    v22 = "+[SSRUtils isCurrentDeviceCompatibleWithNewerVoiceProfileAt:]";
    v23 = 2114;
    v24 = 0;
    v11 = "%s ERR: Unknown device. returning false: %{public}@";
    v12 = v10;
    v13 = 22;
LABEL_9:
    _os_log_error_impl(&dword_2117D4000, v12, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v21, v13);
    goto LABEL_12;
  }
  if (!v6)
  {
    v14 = *MEMORY[0x24BE284B8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v21 = 136315138;
    v22 = "+[SSRUtils isCurrentDeviceCompatibleWithNewerVoiceProfileAt:]";
    v11 = "%s ERR: satLanguagePath is nil. returning false";
    v12 = v14;
    v13 = 12;
    goto LABEL_9;
  }
  v7 = +[SSRUtils deviceCategoryForDeviceProductType:](SSRUtils, "deviceCategoryForDeviceProductType:", v5);
  v8 = +[SSRUtils getVoiceProfileProductCategoryFromVersionFilePath:](SSRUtils, "getVoiceProfileProductCategoryFromVersionFilePath:", v6);
  if (v7 != v8)
  {
    v15 = v8;
    v16 = (void *)*MEMORY[0x24BE284B8];
    v9 = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    v17 = v16;
    +[SSRUtils deviceCategoryStringRepresentationForCategoryType:](SSRUtils, "deviceCategoryStringRepresentationForCategoryType:", v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[SSRUtils deviceCategoryStringRepresentationForCategoryType:](SSRUtils, "deviceCategoryStringRepresentationForCategoryType:", v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 136315650;
    v22 = "+[SSRUtils isCurrentDeviceCompatibleWithNewerVoiceProfileAt:]";
    v23 = 2112;
    v24 = v18;
    v25 = 2112;
    v26 = v19;
    _os_log_impl(&dword_2117D4000, v17, OS_LOG_TYPE_DEFAULT, "%s Voice Profile Mismatch - CurrentDeviceCategory %@ VoiceProfileCategory %@", (uint8_t *)&v21, 0x20u);

LABEL_12:
    v9 = 0;
    goto LABEL_13;
  }
  v9 = 1;
LABEL_13:

  return v9;
}

+ (BOOL)isCurrentDeviceCompatibleWithVoiceProfileAt:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  int v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  unint64_t v35;
  NSObject *v36;
  NSObject *v37;
  unint64_t v38;
  void *v39;
  void *v40;
  _BOOL4 v41;
  const char *v42;
  NSObject *v44;
  uint64_t v45;
  unint64_t v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id obj;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  id v60;
  char v61;
  uint8_t buf[4];
  const char *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  void *v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BE28488], "deviceProductType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = +[SSRUtils deviceCategoryForDeviceProductType:](SSRUtils, "deviceCategoryForDeviceProductType:", v4);
    v61 = 0;
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("audio"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v7, &v61))
      v8 = v61 == 0;
    else
      v8 = 1;
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v7);
      v12 = objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        v19 = *MEMORY[0x24BE284B8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v63 = "+[SSRUtils isCurrentDeviceCompatibleWithVoiceProfileAt:]";
          v64 = 2114;
          v65 = v7;
          _os_log_error_impl(&dword_2117D4000, v19, OS_LOG_TYPE_ERROR, "%s Malformed audio-dir URL for string <%{public}@>:url", buf, 0x16u);
        }
        goto LABEL_19;
      }
      v13 = (void *)v12;
      v60 = 0;
      objc_msgSend(v6, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v12, MEMORY[0x24BDBD1A8], 0, &v60);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v60;
      if (v15)
      {
        v16 = v15;
        v17 = *MEMORY[0x24BE284B8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v63 = "+[SSRUtils isCurrentDeviceCompatibleWithVoiceProfileAt:]";
          v64 = 2114;
          v65 = v16;
          _os_log_error_impl(&dword_2117D4000, v17, OS_LOG_TYPE_ERROR, "%s ERR: reading contents of audioDir: %{public}@", buf, 0x16u);
        }
        LOBYTE(v10) = 0;
        v18 = 1;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("pathExtension='json'"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "filteredArrayUsingPredicate:");
        v10 = objc_claimAutoreleasedReturnValue();
        v52 = (void *)v10;
        if (objc_msgSend((id)v10, "count"))
        {
          v48 = v14;
          v49 = v13;
          v50 = v7;
          v51 = v6;
          v58 = 0u;
          v59 = 0u;
          v56 = 0u;
          v57 = 0u;
          obj = (id)v10;
          v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v72, 16);
          if (v20)
          {
            v21 = v20;
            v46 = v5;
            v47 = v3;
            v16 = 0;
            v22 = *(_QWORD *)v57;
            v10 = MEMORY[0x24BE284B8];
            while (2)
            {
              for (i = 0; i != v21; ++i)
              {
                if (*(_QWORD *)v57 != v22)
                  objc_enumerationMutation(obj);
                v24 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
                objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v24);
                v25 = objc_claimAutoreleasedReturnValue();
                if (v25)
                {
                  v26 = (void *)v25;
                  v55 = v16;
                  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v25, 0, &v55);
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  v28 = v55;

                  if (v28)
                  {
                    v29 = *(NSObject **)v10;
                    if (os_log_type_enabled(*(os_log_t *)v10, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136315394;
                      v63 = "+[SSRUtils isCurrentDeviceCompatibleWithVoiceProfileAt:]";
                      v64 = 2114;
                      v65 = v24;
                      _os_log_impl(&dword_2117D4000, v29, OS_LOG_TYPE_DEFAULT, "%s Error reading metaDict at path: %{public}@", buf, 0x16u);
                    }

                    v16 = v28;
                  }
                  else
                  {
                    objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("productType"));
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    v32 = *(NSObject **)v10;
                    if (os_log_type_enabled(*(os_log_t *)v10, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136315394;
                      v63 = "+[SSRUtils isCurrentDeviceCompatibleWithVoiceProfileAt:]";
                      v64 = 2114;
                      v65 = v31;
                      _os_log_impl(&dword_2117D4000, v32, OS_LOG_TYPE_DEFAULT, "%s metaProductType: %{public}@", buf, 0x16u);
                    }
                    if (v31)
                    {
                      v35 = +[SSRUtils deviceCategoryForDeviceProductType:](SSRUtils, "deviceCategoryForDeviceProductType:", v31);
                      v36 = *(NSObject **)v10;
                      if (os_log_type_enabled(*(os_log_t *)v10, OS_LOG_TYPE_DEFAULT))
                      {
                        v37 = v36;
                        v38 = v46;
                        +[SSRUtils deviceCategoryStringRepresentationForCategoryType:](SSRUtils, "deviceCategoryStringRepresentationForCategoryType:", v46);
                        v39 = (void *)objc_claimAutoreleasedReturnValue();
                        +[SSRUtils deviceCategoryStringRepresentationForCategoryType:](SSRUtils, "deviceCategoryStringRepresentationForCategoryType:", v35);
                        v40 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 136316162;
                        v63 = "+[SSRUtils isCurrentDeviceCompatibleWithVoiceProfileAt:]";
                        v64 = 2114;
                        v65 = v4;
                        v66 = 2114;
                        v67 = (uint64_t)v39;
                        v68 = 2114;
                        v69 = v31;
                        v70 = 2114;
                        v71 = v40;
                        _os_log_impl(&dword_2117D4000, v37, OS_LOG_TYPE_DEFAULT, "%s vtprofile: currDevice=[%{public}@:%{public}@] ; vpDirDevice=[%{public}@:%{public}@]",
                          buf,
                          0x34u);

                        v36 = *(NSObject **)v10;
                      }
                      else
                      {
                        v38 = v46;
                      }
                      v41 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
                      LOBYTE(v10) = v38 == v35;
                      if (v38 == v35)
                      {
                        v3 = v47;
                        if (v41)
                        {
                          *(_DWORD *)buf = 136315138;
                          v63 = "+[SSRUtils isCurrentDeviceCompatibleWithVoiceProfileAt:]";
                          v42 = "%s VoiceProfile MATCH";
                          goto LABEL_54;
                        }
                      }
                      else
                      {
                        v3 = v47;
                        if (v41)
                        {
                          *(_DWORD *)buf = 136315138;
                          v63 = "+[SSRUtils isCurrentDeviceCompatibleWithVoiceProfileAt:]";
                          v42 = "%s VoiceProfile MIS-MATCH";
LABEL_54:
                          _os_log_impl(&dword_2117D4000, v36, OS_LOG_TYPE_DEFAULT, v42, buf, 0xCu);
                        }
                      }

                      v16 = 0;
                      v18 = 1;
                      goto LABEL_56;
                    }
                    v33 = *(NSObject **)v10;
                    if (os_log_type_enabled(*(os_log_t *)v10, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136315138;
                      v63 = "+[SSRUtils isCurrentDeviceCompatibleWithVoiceProfileAt:]";
                      _os_log_impl(&dword_2117D4000, v33, OS_LOG_TYPE_DEFAULT, "%s Could not find productType in VT-Meta file, trying next one", buf, 0xCu);
                    }

                    v16 = 0;
                  }
                }
                else
                {
                  v30 = *(NSObject **)v10;
                  if (os_log_type_enabled(*(os_log_t *)v10, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315394;
                    v63 = "+[SSRUtils isCurrentDeviceCompatibleWithVoiceProfileAt:]";
                    v64 = 2114;
                    v65 = v24;
                    _os_log_impl(&dword_2117D4000, v30, OS_LOG_TYPE_DEFAULT, "%s Unexpected: empty JSON data for file: %{public}@", buf, 0x16u);
                  }
                }
              }
              v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v72, 16);
              if (v21)
                continue;
              break;
            }
            v18 = 0;
            v3 = v47;
          }
          else
          {
            v16 = 0;
            v18 = 0;
          }
LABEL_56:

          v7 = v50;
          v6 = v51;
          v14 = v48;
          v13 = v49;
        }
        else
        {
          v34 = (void *)*MEMORY[0x24BE284B8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
          {
            v44 = v34;
            v45 = objc_msgSend((id)v10, "count");
            *(_DWORD *)buf = 136315650;
            v63 = "+[SSRUtils isCurrentDeviceCompatibleWithVoiceProfileAt:]";
            v64 = 2114;
            v65 = v13;
            v66 = 2050;
            v67 = v45;
            _os_log_error_impl(&dword_2117D4000, v44, OS_LOG_TYPE_ERROR, "%s No jsonFiles found in %{public}@: jsonFiles.count=%{public}lu", buf, 0x20u);

          }
          v16 = 0;
          LOBYTE(v10) = 0;
          v18 = 1;
        }

      }
      if (v18)
        goto LABEL_59;
    }
    v9 = *MEMORY[0x24BE284B8];
    LOBYTE(v10) = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
LABEL_59:

      goto LABEL_60;
    }
    *(_DWORD *)buf = 136315394;
    v63 = "+[SSRUtils isCurrentDeviceCompatibleWithVoiceProfileAt:]";
    v64 = 2114;
    v65 = v4;
    _os_log_impl(&dword_2117D4000, v9, OS_LOG_TYPE_DEFAULT, "%s No compatible VT profile found for CurrDevice: %{public}@", buf, 0x16u);
LABEL_19:
    LOBYTE(v10) = 0;
    goto LABEL_59;
  }
  v11 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v63 = "+[SSRUtils isCurrentDeviceCompatibleWithVoiceProfileAt:]";
    v64 = 2114;
    v65 = 0;
    _os_log_error_impl(&dword_2117D4000, v11, OS_LOG_TYPE_ERROR, "%s ERR: Unknown device. returning false: %{public}@", buf, 0x16u);
  }
  LOBYTE(v10) = 0;
LABEL_60:

  return v10 & 1;
}

+ (id)getImplicitUtteranceCacheDirectory
{
  void *v2;
  void *v3;
  void *v4;

  +[SSRVoiceProfileManager sharedInstance](SSRVoiceProfileManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "baseDir");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Caches/VoiceTrigger/ImplicitUtterences"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (int64_t)getNumberOfAudioFilesInDirectory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  int64_t v8;
  _QWORD v10[5];
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v4, "contentsOfDirectoryAtPath:error:", v3, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;

  if (v6)
  {
    v7 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v17 = "+[SSRUtils getNumberOfAudioFilesInDirectory:]";
      v18 = 2114;
      v19 = v3;
      v20 = 2114;
      v21 = v6;
      _os_log_error_impl(&dword_2117D4000, v7, OS_LOG_TYPE_ERROR, "%s ERR: fetching contents of %{public}@ failed with error %{public}@", buf, 0x20u);
    }
  }
  else
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __45__SSRUtils_getNumberOfAudioFilesInDirectory___block_invoke;
    v10[3] = &unk_24CC85480;
    v10[4] = &v12;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);
  }
  v8 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v8;
}

+ (void)dumpFilesInDirectory:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  os_log_t *v12;
  uint64_t i;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  NSObject *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (!v3)
  {
    v16 = *MEMORY[0x24BE284B8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_DWORD *)buf = 136315138;
    v26 = "+[SSRUtils dumpFilesInDirectory:]";
    v17 = "%s ERR: Directory is nil - Bailing out";
    v18 = v16;
    v19 = 12;
LABEL_18:
    _os_log_error_impl(&dword_2117D4000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if ((v5 & 1) == 0)
  {
    v20 = *MEMORY[0x24BE284B8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_DWORD *)buf = 136315394;
    v26 = "+[SSRUtils dumpFilesInDirectory:]";
    v27 = 2114;
    v28 = v3;
    v17 = "%s ERR: %{public}@ doesnt exist - Bailing out";
    v18 = v20;
    v19 = 22;
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enumeratorAtPath:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    v12 = (os_log_t *)MEMORY[0x24BE284B8];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v14 = *v12;
        if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
        {
          v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          *(_DWORD *)buf = 136315650;
          v26 = "+[SSRUtils dumpFilesInDirectory:]";
          v27 = 2114;
          v28 = v3;
          v29 = 2114;
          v30 = v15;
          _os_log_impl(&dword_2117D4000, v14, OS_LOG_TYPE_DEFAULT, "%s Dump content of %{public}@ - %{public}@", buf, 0x20u);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    }
    while (v10);
  }

LABEL_16:
}

+ (id)getContentsOfDirectory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = *MEMORY[0x24BDBCCD0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v4, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v3, v5, 0, &v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v15;

  if (v7)
  {
    v8 = *MEMORY[0x24BE284B8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      goto LABEL_3;
    *(_DWORD *)buf = 136315650;
    v17 = "+[SSRUtils getContentsOfDirectory:]";
    v18 = 2112;
    v19 = v3;
    v20 = 2112;
    v21 = v7;
    v12 = "%s Error reading directory at %@: err: %@";
    v13 = v8;
    v14 = 32;
LABEL_10:
    _os_log_error_impl(&dword_2117D4000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
    goto LABEL_3;
  }
  if (objc_msgSend(v6, "count"))
  {
    v9 = v6;
    goto LABEL_6;
  }
  v11 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "+[SSRUtils getContentsOfDirectory:]";
    v18 = 2112;
    v19 = v3;
    v12 = "%s %@ is empty";
    v13 = v11;
    v14 = 22;
    goto LABEL_10;
  }
LABEL_3:
  v9 = 0;
LABEL_6:

  return v9;
}

+ (void)getHomeUserIdForVoiceProfile:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  os_log_t *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *, void *);
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  void *v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__4362;
  v37 = __Block_byref_object_dispose__4363;
  v38 = 0;
  v7 = objc_alloc_init(MEMORY[0x24BE28408]);
  v8 = objc_alloc_init(MEMORY[0x24BE09230]);
  v9 = (os_log_t *)MEMORY[0x24BE284B8];
  v10 = (id)*MEMORY[0x24BE284B8];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "siriProfileId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v42 = "+[SSRUtils getHomeUserIdForVoiceProfile:withCompletion:]";
    v43 = 2114;
    v44 = v11;
    _os_log_impl(&dword_2117D4000, v10, OS_LOG_TYPE_DEFAULT, "%s Fetching homeUserId for siriProfileId %{public}@", buf, 0x16u);

  }
  objc_msgSend(v7, "enter");
  objc_msgSend(v5, "siriProfileId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = MEMORY[0x24BDAC760];
  v25 = 3221225472;
  v26 = __56__SSRUtils_getHomeUserIdForVoiceProfile_withCompletion___block_invoke;
  v27 = &unk_24CC854A8;
  v13 = v8;
  v28 = v13;
  v32 = &v33;
  v14 = v5;
  v29 = v14;
  v15 = v7;
  v30 = v15;
  v16 = v6;
  v31 = v16;
  objc_msgSend(v13, "getHomeUserIdForSharedUserId:completion:", v12, &v24);

  if (objc_msgSend(v15, "waitWithTimeout:", dispatch_time(0, 100000000)))
  {
    v17 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v14, "siriProfileId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("homeUserId query for siriProfileId %@ timedout !"), v18, v24, v25, v26, v27, v28, v29, v30);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x24BDD1540];
    v39 = *MEMORY[0x24BDD0FC8];
    v40 = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 749, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v42 = "+[SSRUtils getHomeUserIdForVoiceProfile:withCompletion:]";
      v43 = 2112;
      v44 = v19;
      _os_log_error_impl(&dword_2117D4000, v23, OS_LOG_TYPE_ERROR, "%s ERR: %@", buf, 0x16u);
      if (!v16)
        goto LABEL_7;
    }
    else if (!v16)
    {
LABEL_7:

      goto LABEL_8;
    }
    (*((void (**)(id, uint64_t, void *))v16 + 2))(v16, v34[5], v22);
    goto LABEL_7;
  }
LABEL_8:

  _Block_object_dispose(&v33, 8);
}

+ (id)getVoiceProfilesForSiriProfileId:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  char v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[SSRVoiceProfileStore sharedInstance](SSRVoiceProfileStore, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userVoiceProfilesForAppDomain:", CFSTR("com.apple.siri"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if ((CSIsIOS() & 1) != 0)
  {
    if (!v3)
    {
LABEL_6:
      v8 = v5;
      goto LABEL_20;
    }
  }
  else
  {
    v7 = CSIsOSX();
    if (!v3 && (v7 & 1) != 0)
      goto LABEL_6;
  }
  v18 = v4;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v14, "siriProfileId");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", v3);

        if (v16)
          objc_msgSend(v6, "addObject:", v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v6, "count"))
    v8 = (id)objc_msgSend(v6, "copy");
  else
    v8 = 0;
  v4 = v18;
LABEL_20:

  return v8;
}

+ (id)getVoiceProfileForSiriProfileId:(id)a3 forLanguageCode:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  char v16;
  id v17;
  NSObject *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  +[SSRVoiceProfileStore sharedInstance](SSRVoiceProfileStore, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userVoiceProfilesForAppDomain:forLocale:", CFSTR("com.apple.siri"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5 && ((CSIsIOS() & 1) != 0 || CSIsOSX()) && objc_msgSend(v8, "count"))
  {
    if ((unint64_t)objc_msgSend(v8, "count") >= 2)
    {
      v19 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v27 = "+[SSRUtils getVoiceProfileForSiriProfileId:forLanguageCode:]";
        _os_log_error_impl(&dword_2117D4000, v19, OS_LOG_TYPE_ERROR, "%s ERR: Seeing more than one voice profiles for Siri App Domain", buf, 0xCu);
      }
    }
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = v6;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          if (v5)
          {
            v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
            objc_msgSend(v14, "siriProfileId");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqualToString:", v5);

            if ((v16 & 1) != 0)
            {
              v17 = v14;

              goto LABEL_13;
            }
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v11)
          continue;
        break;
      }
    }

    v17 = 0;
LABEL_13:
    v6 = v20;
  }

  return v17;
}

+ (void)logSpeakerRecognitionGradingMetadataAtFilepath:(id)a3 withScoreInfo:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (v6)
    {
      v17 = 0;
      objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v6, 1, &v17);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v17;
      if (v9)
      {
        v10 = *MEMORY[0x24BE28360];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
        {
LABEL_16:

          goto LABEL_17;
        }
        *(_DWORD *)buf = 136315394;
        v19 = "+[SSRUtils logSpeakerRecognitionGradingMetadataAtFilepath:withScoreInfo:]";
        v20 = 2112;
        v21 = v9;
        v11 = "%s Error creating uttMetaJsonData: %@";
        v12 = v10;
        v13 = 22;
      }
      else
      {
        if (v8)
        {
          objc_msgSend(v8, "writeToFile:atomically:", v5, 0);
          goto LABEL_16;
        }
        v16 = *MEMORY[0x24BE28360];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
          goto LABEL_16;
        *(_DWORD *)buf = 136315138;
        v19 = "+[SSRUtils logSpeakerRecognitionGradingMetadataAtFilepath:withScoreInfo:]";
        v11 = "%s Failed to create UttMeta...";
        v12 = v16;
        v13 = 12;
      }
      _os_log_impl(&dword_2117D4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      goto LABEL_16;
    }
    v14 = *MEMORY[0x24BE28360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "+[SSRUtils logSpeakerRecognitionGradingMetadataAtFilepath:withScoreInfo:]";
      v15 = "%s scoreCard is nil!";
      goto LABEL_11;
    }
  }
  else
  {
    v14 = *MEMORY[0x24BE28360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28360], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "+[SSRUtils logSpeakerRecognitionGradingMetadataAtFilepath:withScoreInfo:]";
      v15 = "%s uttMetaPath is nil!";
LABEL_11:
      _os_log_impl(&dword_2117D4000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 0xCu);
    }
  }
LABEL_17:

}

+ (void)segmentVoiceTriggerFromAudioFile:(id)a3 withVTEventInfo:(id)a4 withStorePayloadPortion:(BOOL)a5 withCompletion:(id)a6
{
  _BOOL4 v7;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  float v35;
  NSObject *v36;
  void *v37;
  void *v38;
  float v39;
  uint64_t *v40;
  void *v41;
  uint64_t v42;
  float v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  _BYTE *v57;
  _QWORD *v58;
  _QWORD *v59;
  _QWORD *v60;
  _QWORD *v61;
  _QWORD *v62;
  _QWORD *v63;
  _QWORD *v64;
  uint64_t *v65;
  _BYTE v66[40];
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  _QWORD v71[4];
  _QWORD v72[4];
  _QWORD v73[4];
  _QWORD v74[4];
  _QWORD v75[4];
  _QWORD v76[4];
  _QWORD v77[4];
  _BYTE v78[40];
  _BYTE v79[40];
  _BYTE v80[40];
  _BYTE v81[40];
  uint8_t buf[4];
  const char *v83;
  __int16 v84;
  uint64_t v85;
  __int16 v86;
  double v87;
  _BYTE v88[24];
  uint64_t v89;
  uint64_t v90;
  id v91;
  uint64_t v92;
  _QWORD v93[4];

  v7 = a5;
  v93[1] = *MEMORY[0x24BDAC8D0];
  v49 = a3;
  v47 = a4;
  v9 = a6;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingString:", CFSTR(".wav"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAppendingString:", CFSTR(".wav"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v49, "URLByDeletingLastPathComponent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "path");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "stringByAppendingPathComponent:", v48);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = objc_alloc(MEMORY[0x24BE28470]);
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE28410], "lpcmInt16ASBD");
    objc_msgSend(MEMORY[0x24BE28410], "lpcmInt16ASBD");
    v19 = objc_msgSend(v17, "initWithURL:inputFormat:outputFormat:", v18, v81, v80);

    if (v7)
    {
      objc_msgSend(v15, "stringByAppendingPathComponent:", v46);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      v21 = objc_alloc(MEMORY[0x24BE28470]);
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE28410], "lpcmInt16ASBD");
      objc_msgSend(MEMORY[0x24BE28410], "lpcmInt16ASBD");
      v23 = objc_msgSend(v21, "initWithURL:inputFormat:outputFormat:", v22, v79, v78);

    }
    else
    {
      v23 = 0;
      v20 = 0;
    }
    if (v19 | v23)
    {
      *(_QWORD *)v88 = 0;
      *(_QWORD *)&v88[8] = v88;
      *(_QWORD *)&v88[16] = 0x2020000000;
      v89 = 0xFFFFFFFFLL;
      v77[0] = 0;
      v77[1] = v77;
      v77[2] = 0x2020000000;
      v77[3] = 0xFFFFFFFFLL;
      v76[0] = 0;
      v76[1] = v76;
      v76[2] = 0x2020000000;
      v76[3] = 0xFFFFFFFFLL;
      v75[0] = 0;
      v75[1] = v75;
      v75[2] = 0x2020000000;
      v75[3] = 0;
      v74[0] = 0;
      v74[1] = v74;
      v74[2] = 0x2020000000;
      v74[3] = 0;
      v73[0] = 0;
      v73[1] = v73;
      v73[2] = 0x2020000000;
      v73[3] = 0;
      v72[0] = 0;
      v72[1] = v72;
      v72[2] = 0x2020000000;
      v72[3] = 0;
      v71[0] = 0;
      v71[1] = v71;
      v71[2] = 0x2020000000;
      v71[3] = 0;
      v67 = 0;
      v68 = &v67;
      v69 = 0x2020000000;
      v70 = 0;
      v28 = *MEMORY[0x24BE285B0];
      objc_msgSend(v47, "objectForKeyedSubscript:", *MEMORY[0x24BE285B0]);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        objc_msgSend(v47, "objectForKeyedSubscript:", v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "integerValue");
        v68[3] = v31;

        v32 = (id)*MEMORY[0x24BE284B8];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          v44 = v68[3];
          objc_msgSend(v47, "objectForKeyedSubscript:", v28);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "integerValue");
          objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleRate");
          *(_DWORD *)buf = 136315650;
          v83 = "+[SSRUtils segmentVoiceTriggerFromAudioFile:withVTEventInfo:withStorePayloadPortion:withCompletion:]";
          v84 = 2048;
          v85 = v44;
          v86 = 2048;
          v87 = (float)((float)v34 / v35);
          _os_log_impl(&dword_2117D4000, v32, OS_LOG_TYPE_DEFAULT, "%s Setting payloadstartSample %lu for trigger duration of %fsecs", buf, 0x20u);

        }
      }
      else
      {
        objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleRate");
        v40 = v68;
        v68[3] = vcvtd_n_u64_f64(v39, 2uLL);
        v32 = (id)*MEMORY[0x24BE284B8];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v45 = v40[3];
          objc_msgSend(v47, "objectForKeyedSubscript:", v28);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "integerValue");
          objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleRate");
          *(_DWORD *)buf = 136315650;
          v83 = "+[SSRUtils segmentVoiceTriggerFromAudioFile:withVTEventInfo:withStorePayloadPortion:withCompletion:]";
          v84 = 2048;
          v85 = v45;
          v86 = 2048;
          v87 = (float)((float)v42 / v43);
          _os_log_error_impl(&dword_2117D4000, v32, OS_LOG_TYPE_ERROR, "%s ERR: Setting max payloadstartSample %lu for trigger duration of %fsecs", buf, 0x20u);

        }
      }

      objc_msgSend(MEMORY[0x24BE28410], "lpcmInt16ASBD");
      v50[0] = MEMORY[0x24BDAC760];
      v50[1] = 3221225472;
      v50[2] = __100__SSRUtils_segmentVoiceTriggerFromAudioFile_withVTEventInfo_withStorePayloadPortion_withCompletion___block_invoke;
      v50[3] = &unk_24CC854D0;
      v51 = v49;
      v56 = v9;
      v52 = v16;
      v20 = v20;
      v53 = v20;
      v57 = v88;
      v58 = v74;
      v59 = v77;
      v60 = v73;
      v61 = v76;
      v62 = v72;
      v63 = v75;
      v64 = v71;
      v26 = (id)v19;
      v54 = v26;
      v27 = (id)v23;
      v55 = v27;
      v65 = &v67;
      +[SSRUtils streamAudioFromFileUrl:audioStreamBasicDescriptor:samplesPerStreamChunk:audioDataAvailableHandler:](SSRUtils, "streamAudioFromFileUrl:audioStreamBasicDescriptor:samplesPerStreamChunk:audioDataAvailableHandler:", v51, v66, 640, v50);

      _Block_object_dispose(&v67, 8);
      _Block_object_dispose(v71, 8);
      _Block_object_dispose(v72, 8);
      _Block_object_dispose(v73, 8);
      _Block_object_dispose(v74, 8);
      _Block_object_dispose(v75, 8);
      _Block_object_dispose(v76, 8);
      _Block_object_dispose(v77, 8);
      _Block_object_dispose(v88, 8);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERR: Failed initializing loggers at %@ and %@"), v16, v20);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      v36 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v88 = 136315394;
        *(_QWORD *)&v88[4] = "+[SSRUtils segmentVoiceTriggerFromAudioFile:withVTEventInfo:withStorePayloadPortion:withCompletion:]";
        *(_WORD *)&v88[12] = 2114;
        *(_QWORD *)&v88[14] = v26;
        _os_log_error_impl(&dword_2117D4000, v36, OS_LOG_TYPE_ERROR, "%s %{public}@", v88, 0x16u);
        if (!v9)
          goto LABEL_19;
      }
      else if (!v9)
      {
LABEL_19:

        goto LABEL_20;
      }
      v37 = (void *)MEMORY[0x24BDD1540];
      v90 = *MEMORY[0x24BDD0FC8];
      v91 = v26;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v91, &v90, 1);
      v27 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 744, v27);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *, _QWORD, _QWORD))v9 + 2))(v9, v38, 0, 0);

    }
LABEL_18:

    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERR: Audio path is nil - Bailing out"));
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v24 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v88 = 136315394;
    *(_QWORD *)&v88[4] = "+[SSRUtils segmentVoiceTriggerFromAudioFile:withVTEventInfo:withStorePayloadPortion:withCompletion:]";
    *(_WORD *)&v88[12] = 2114;
    *(_QWORD *)&v88[14] = v20;
    _os_log_error_impl(&dword_2117D4000, v24, OS_LOG_TYPE_ERROR, "%s %{public}@", v88, 0x16u);
    if (!v9)
      goto LABEL_20;
    goto LABEL_6;
  }
  if (v9)
  {
LABEL_6:
    v25 = (void *)MEMORY[0x24BDD1540];
    v92 = *MEMORY[0x24BDD0FC8];
    v93[0] = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v93, &v92, 1);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 715, v26);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id, _QWORD, _QWORD))v9 + 2))(v9, v27, 0, 0);
    goto LABEL_18;
  }
LABEL_20:

}

+ (id)getEnrollmentUtterancesFromDirectory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "getExplicitEnrollmentUtterancesFromDirectory:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "getImplicitEnrollmentUtterancesFromDirectory:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      v10 = 136315138;
      v11 = "+[SSRUtils getEnrollmentUtterancesFromDirectory:]";
      _os_log_error_impl(&dword_2117D4000, v8, OS_LOG_TYPE_ERROR, "%s satAudioDirectory is nil - Bailing out", (uint8_t *)&v10, 0xCu);
    }
    v7 = 0;
  }

  return v7;
}

+ (id)getExplicitEnrollmentUtterancesFromDirectory:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _QWORD v28[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "_getUtterancesFromDirectory:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__4362;
  v33 = __Block_byref_object_dispose__4363;
  v34 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if ((CSIsCommunalDevice() & 1) != 0)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__4362;
    v26 = __Block_byref_object_dispose__4363;
    v27 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__4362;
    v20 = __Block_byref_object_dispose__4363;
    v21 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v6 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __57__SSRUtils_getExplicitEnrollmentUtterancesFromDirectory___block_invoke_2;
    v15[3] = &unk_24CC85560;
    v15[4] = &v22;
    v15[5] = &v16;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v15);
    objc_msgSend((id)v30[5], "addObjectsFromArray:", v17[5]);
    if (objc_msgSend((id)v23[5], "count") && (unint64_t)objc_msgSend((id)v30[5], "count") <= 4)
    {
      v7 = (id)*MEMORY[0x24BE284B8];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = objc_msgSend((id)v23[5], "count");
        *(_DWORD *)buf = 136315394;
        v36 = "+[SSRUtils getExplicitEnrollmentUtterancesFromDirectory:]";
        v37 = 1026;
        v38 = v8;
        _os_log_impl(&dword_2117D4000, v7, OS_LOG_TYPE_DEFAULT, "%s Found %{public}d ambiguous explicit utterances", buf, 0x12u);
      }

      objc_msgSend((id)v23[5], "sortedArrayUsingComparator:", &__block_literal_global_265);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v6;
      v14[1] = 3221225472;
      v14[2] = __57__SSRUtils_getExplicitEnrollmentUtterancesFromDirectory___block_invoke_2_266;
      v14[3] = &unk_24CC85538;
      v14[4] = &v29;
      objc_msgSend(v9, "enumerateObjectsUsingBlock:", v14);

    }
    _Block_object_dispose(&v16, 8);

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_257);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filteredArrayUsingPredicate:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __57__SSRUtils_getExplicitEnrollmentUtterancesFromDirectory___block_invoke_261;
    v28[3] = &unk_24CC85538;
    v28[4] = &v29;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v28);

  }
  v12 = (id)v30[5];
  _Block_object_dispose(&v29, 8);

  return v12;
}

+ (id)getExplicitMarkedEnrollmentUtterancesFromDirectory:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "_getUtterancesFromDirectory:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_267);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filteredArrayUsingPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)getEnrollmentUtterancesCountFromDirectory:(id)a3 withCountBlock:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, uint64_t);
  void *v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, uint64_t))a4;
  objc_msgSend(a1, "_getUtterancesFromDirectory:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __69__SSRUtils_getEnrollmentUtterancesCountFromDirectory_withCountBlock___block_invoke;
  v9[3] = &unk_24CC85560;
  v9[4] = &v10;
  v9[5] = &v14;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v9);
  if (v7)
    v7[2](v7, v15[3], v11[3]);
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

}

+ (id)getImplicitEnrollmentUtterancesFromDirectory:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "_getUtterancesFromDirectory:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_268);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filteredArrayUsingPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_270);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_getUtterancesFromDirectory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = *MEMORY[0x24BDBCCD0];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    objc_msgSend(v4, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v3, v5, 0, &v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v13;

    if (v7)
    {
      v8 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v15 = "+[SSRUtils _getUtterancesFromDirectory:]";
        v16 = 2114;
        v17 = v3;
        v18 = 2114;
        v19 = v7;
        _os_log_error_impl(&dword_2117D4000, v8, OS_LOG_TYPE_ERROR, "%s ERR: Fetching contents of %{public}@ failed with error - %{public}@", buf, 0x20u);
      }
    }
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("self.absoluteString ENDSWITH '.wav'"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "filteredArrayUsingPredicate:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "+[SSRUtils _getUtterancesFromDirectory:]";
      _os_log_error_impl(&dword_2117D4000, v11, OS_LOG_TYPE_ERROR, "%s satAudioDirectory is nil - Bailing out", buf, 0xCu);
    }
    v10 = 0;
  }

  return v10;
}

+ (id)removeItemAtPath:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  id v11;
  char v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v12 = 0;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v3, &v12);

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v7 = objc_msgSend(v6, "removeItemAtPath:error:", v3, &v11);
    v8 = v11;

    if ((v7 & 1) == 0)
    {
      v9 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v14 = "+[SSRUtils removeItemAtPath:]";
        v15 = 2114;
        v16 = v3;
        v17 = 2114;
        v18 = v8;
        _os_log_error_impl(&dword_2117D4000, v9, OS_LOG_TYPE_ERROR, "%s ERR: Failed to delete %{public}@ with error %{public}@", buf, 0x20u);
      }
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)moveContentsOfSrcDirectory:(id)a3 toDestDirectory:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v32;
  id obj;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  uint8_t v41[128];
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = 0x24BDD1000uLL;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  objc_msgSend(v8, "contentsOfDirectoryAtPath:error:", v5, &v40);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v40;

  if (v10)
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v10, "localizedDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("Failed to get contents of %@ with error %@"), v5, v12);
    obj = (id)objc_claimAutoreleasedReturnValue();

    v13 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v43 = "+[SSRUtils moveContentsOfSrcDirectory:toDestDirectory:]";
      v44 = 2114;
      v45 = obj;
      _os_log_error_impl(&dword_2117D4000, v13, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
    }
    v14 = v10;
    v15 = v14;
  }
  else
  {
    +[SSRUtils createDirectoryIfDoesNotExist:](SSRUtils, "createDirectoryIfDoesNotExist:", v6);
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = v9;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v16)
    {
      v17 = v16;
      v34 = v6;
      v32 = v9;
      v14 = 0;
      v18 = *(_QWORD *)v37;
      do
      {
        v19 = 0;
        v20 = v14;
        do
        {
          if (*(_QWORD *)v37 != v18)
            objc_enumerationMutation(obj);
          v21 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v19);
          v22 = v5;
          objc_msgSend(v5, "stringByAppendingPathComponent:", v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "stringByAppendingPathComponent:", v21);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v7;
          objc_msgSend(*(id *)(v7 + 1408), "defaultManager");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v20;
          objc_msgSend(v26, "moveItemAtPath:toPath:error:", v23, v24, &v35);
          v14 = v35;

          if (v14)
          {
            v27 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v14, "localizedDescription");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "stringWithFormat:", CFSTR("Failed to move %@ to %@ with error %@"), v23, v24, v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            v30 = *MEMORY[0x24BE284B8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v43 = "+[SSRUtils moveContentsOfSrcDirectory:toDestDirectory:]";
              v44 = 2114;
              v45 = v29;
              _os_log_error_impl(&dword_2117D4000, v30, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
            }

          }
          ++v19;
          v20 = v14;
          v7 = v25;
          v5 = v22;
        }
        while (v17 != v19);
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v17);
      v15 = 0;
      v9 = v32;
      v6 = v34;
    }
    else
    {
      v14 = 0;
      v15 = 0;
    }
  }

  return v15;
}

+ (BOOL)encryptFileAt:(id)a3 andSaveTo:(id)a4 error:(id *)a5
{
  return 0;
}

+ (id)combineScoreFromPSR:(id)a3 fromSAT:(id)a4 withCombinedWt:(float)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  os_log_t *v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  float v27;
  float v28;
  void *v29;
  float v30;
  float v31;
  double v32;
  void *v33;
  NSObject *v34;
  void *v35;
  id v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v10 = v9;
  if (v7 && !v8)
  {
    objc_msgSend(v9, "addEntriesFromDictionary:", v7);
    v11 = CFSTR("spIdKnownUserPSRScores");
    v12 = v7;
LABEL_7:
    objc_msgSend(v12, "objectForKeyedSubscript:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("spIdKnownUserScores"));

    goto LABEL_8;
  }
  if (!v7 && v8)
  {
    objc_msgSend(v9, "addEntriesFromDictionary:", v8);
    v11 = CFSTR("spIdKnownUserSATScores");
    v12 = v8;
    goto LABEL_7;
  }
  if (v7 && v8)
  {
    objc_msgSend(v9, "addEntriesFromDictionary:", v8);
    v37 = v10;
    objc_msgSend(v10, "addEntriesFromDictionary:", v7);
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("spIdKnownUserPSRScores"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v8;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("spIdKnownUserSATScores"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v18 = v15;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v39;
      v22 = (os_log_t *)MEMORY[0x24BE284B8];
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v39 != v21)
            objc_enumerationMutation(v18);
          v24 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v16, "objectForKeyedSubscript:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            objc_msgSend(v16, "objectForKeyedSubscript:", v24);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "floatValue");
            v28 = v27;

            objc_msgSend(v18, "objectForKeyedSubscript:", v24);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "floatValue");
            v31 = v30;

            *(float *)&v32 = (float)(v31 * a5) + (float)((float)(1.0 - a5) * v28);
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setObject:forKey:", v33, v24);

          }
          else
          {
            v34 = *v22;
            if (os_log_type_enabled(*v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              v43 = "+[SSRUtils combineScoreFromPSR:fromSAT:withCombinedWt:]";
              v44 = 2114;
              v45 = v24;
              v46 = 2114;
              v47 = v16;
              _os_log_error_impl(&dword_2117D4000, v34, OS_LOG_TYPE_ERROR, "%s ERR: Scores for profileId %{public}@ not present in %{public}@ - Skipping", buf, 0x20u);
            }
          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
      }
      while (v20);
    }

    v35 = (void *)objc_msgSend(v17, "copy");
    v10 = v37;
    objc_msgSend(v37, "setObject:forKeyedSubscript:", v35, CFSTR("spIdKnownUserScores"));

    v8 = v36;
  }
LABEL_8:

  return v10;
}

+ (BOOL)isMphVTUIKeywordDetectorSupportedPlatform
{
  if ((CSIsIOS() & 1) != 0)
    return 1;
  else
    return CSIsAppleSiliconMac();
}

+ (id)timeStampString
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  objc_msgSend(v2, "setDateFormat:", CFSTR("yyyyMMdd-HH:mm:ss"));
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __57__SSRUtils_getImplicitEnrollmentUtterancesFromDirectory___block_invoke_269(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v4 = a2;
  v5 = a3;
  +[SSRVoiceProfileMetadataManager recordedTimeStampOfFile:](SSRVoiceProfileMetadataManager, "recordedTimeStampOfFile:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSRVoiceProfileMetadataManager recordedTimeStampOfFile:](SSRVoiceProfileMetadataManager, "recordedTimeStampOfFile:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9)
  {
    if (v6)
      v10 = v7 == 0;
    else
      v10 = 0;
    if (v10)
    {
      v14 = 1;
    }
    else
    {
      if (v6)
        v11 = 1;
      else
        v11 = v7 == 0;
      if (v11)
      {
        objc_msgSend(v4, "absoluteString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "absoluteString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "compare:options:", v13, 1);

      }
      else
      {
        v14 = -1;
      }
    }
  }
  else
  {
    v14 = objc_msgSend(v6, "compare:", v7);
  }

  return v14;
}

uint64_t __57__SSRUtils_getImplicitEnrollmentUtterancesFromDirectory___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "URLByDeletingPathExtension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathExtension:", CFSTR("json"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

  if ((v6 & 1) == 0)
  {
    v8 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      v10 = 136315394;
      v11 = "+[SSRUtils getImplicitEnrollmentUtterancesFromDirectory:]_block_invoke";
      v12 = 2114;
      v13 = v3;
      _os_log_error_impl(&dword_2117D4000, v8, OS_LOG_TYPE_ERROR, "%s metaVersionFile %{public}@ doesnt exist - Skipping", (uint8_t *)&v10, 0x16u);
    }
    goto LABEL_6;
  }
  if (!+[SSRVoiceProfileMetadataManager isUtteranceImplicitlyTrained:](SSRVoiceProfileMetadataManager, "isUtteranceImplicitlyTrained:", v3))
  {
LABEL_6:
    v7 = 0;
    goto LABEL_7;
  }
  v7 = 1;
LABEL_7:

  return v7;
}

void __69__SSRUtils_getEnrollmentUtterancesCountFromDirectory_withCountBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  id v5;

  +[SSRVoiceProfileMetadataManager getUtteranceEnrollmentType:](SSRVoiceProfileMetadataManager, "getUtteranceEnrollmentType:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "isEqualToString:", CFSTR("implicit"));
  v4 = 40;
  if (v3)
    v4 = 32;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + v4) + 8) + 24);

}

uint64_t __63__SSRUtils_getExplicitMarkedEnrollmentUtterancesFromDirectory___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "URLByDeletingPathExtension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathExtension:", CFSTR("json"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[SSRVoiceProfileMetadataManager getUtteranceEnrollmentType:](SSRVoiceProfileMetadataManager, "getUtteranceEnrollmentType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

  if ((v7 & 1) == 0)
  {
    v9 = (void *)*MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      objc_msgSend(v3, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 136315394;
      v14 = "+[SSRUtils getExplicitMarkedEnrollmentUtterancesFromDirectory:]_block_invoke";
      v15 = 2114;
      v16 = v11;
      _os_log_impl(&dword_2117D4000, v10, OS_LOG_TYPE_DEFAULT, "%s metaVersionFile %{public}@ doesnt exist - Skipping", (uint8_t *)&v13, 0x16u);

    }
    goto LABEL_6;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("explicit")) & 1) == 0)
  {
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  v8 = 1;
LABEL_7:

  return v8;
}

void __57__SSRUtils_getExplicitEnrollmentUtterancesFromDirectory___block_invoke_261(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  +[SSRVoiceProfileMetadataManager getUtteranceEnrollmentType:](SSRVoiceProfileMetadataManager, "getUtteranceEnrollmentType:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "isEqualToString:", CFSTR("explicit")) & 1) != 0)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "insertObject:atIndex:", v5, 0);
  else
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v5);

}

void __57__SSRUtils_getExplicitEnrollmentUtterancesFromDirectory___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  +[SSRVoiceProfileMetadataManager getUtteranceEnrollmentType:](SSRVoiceProfileMetadataManager, "getUtteranceEnrollmentType:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    v5 = a1 + 32;
    goto LABEL_5;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("explicit")))
  {
    v5 = a1 + 40;
LABEL_5:
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 40), "addObject:", v6);
  }

}

void __57__SSRUtils_getExplicitEnrollmentUtterancesFromDirectory___block_invoke_2_266(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;

  v7 = a2;
  if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "count") > 4)
  {
    v6 = v7;
    if (a4)
      *a4 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v7);
    v6 = v7;
  }

}

uint64_t __57__SSRUtils_getExplicitEnrollmentUtterancesFromDirectory___block_invoke_263(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v4 = a2;
  v5 = a3;
  +[SSRVoiceProfileMetadataManager recordedTimeStampFromFileName:](SSRVoiceProfileMetadataManager, "recordedTimeStampFromFileName:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSRVoiceProfileMetadataManager recordedTimeStampFromFileName:](SSRVoiceProfileMetadataManager, "recordedTimeStampFromFileName:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9)
  {
    if (v6)
      v10 = v7 == 0;
    else
      v10 = 0;
    if (v10)
    {
      v14 = -1;
    }
    else
    {
      if (v6)
        v11 = 1;
      else
        v11 = v7 == 0;
      if (v11)
      {
        objc_msgSend(v4, "absoluteString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "absoluteString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "compare:options:", v13, 1);

      }
      else
      {
        v14 = 1;
      }
    }
  }
  else
  {
    v14 = objc_msgSend(v6, "compare:", v7);
  }

  return v14;
}

uint64_t __57__SSRUtils_getExplicitEnrollmentUtterancesFromDirectory___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "URLByDeletingPathExtension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathExtension:", CFSTR("json"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

  if ((v6 & 1) != 0)
  {
    v7 = +[SSRVoiceProfileMetadataManager isUtteranceImplicitlyTrained:](SSRVoiceProfileMetadataManager, "isUtteranceImplicitlyTrained:", v3) ^ 1;
  }
  else
  {
    v8 = (void *)*MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      objc_msgSend(v3, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136315394;
      v13 = "+[SSRUtils getExplicitEnrollmentUtterancesFromDirectory:]_block_invoke";
      v14 = 2114;
      v15 = v10;
      _os_log_impl(&dword_2117D4000, v9, OS_LOG_TYPE_DEFAULT, "%s metaVersionFile %{public}@ doesnt exist", (uint8_t *)&v12, 0x16u);

    }
    v7 = 1;
  }

  return v7;
}

void __100__SSRUtils_segmentVoiceTriggerFromAudioFile_withVTEventInfo_withStorePayloadPortion_withCompletion___block_invoke(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  id v7;
  os_log_t *v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  double v44;
  float v45;
  void *v46;
  unsigned int v47;
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD v59[2];

  v59[1] = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  if (v7)
  {
    v8 = (os_log_t *)MEMORY[0x24BE284B8];
    v9 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v49 = "+[SSRUtils segmentVoiceTriggerFromAudioFile:withVTEventInfo:withStorePayloadPortion:withCompletion:]_block_invoke";
      v50 = 2112;
      v51 = v10;
      _os_log_impl(&dword_2117D4000, v9, OS_LOG_TYPE_DEFAULT, "%s Failed to read file: %@", buf, 0x16u);
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERR: Failed to read file: %@"), *(_QWORD *)(a1 + 32));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v49 = "+[SSRUtils segmentVoiceTriggerFromAudioFile:withVTEventInfo:withStorePayloadPortion:withCompletion:]_block_invoke";
      v50 = 2112;
      v51 = v11;
      _os_log_error_impl(&dword_2117D4000, v12, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
    }
    if (*(_QWORD *)(a1 + 72))
    {
      +[SSRUtils removeItemAtPath:](SSRUtils, "removeItemAtPath:", *(_QWORD *)(a1 + 40));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        v14 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
        {
          v15 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 136315394;
          v49 = "+[SSRUtils segmentVoiceTriggerFromAudioFile:withVTEventInfo:withStorePayloadPortion:withCompletion:]_block_invoke";
          v50 = 2114;
          v51 = v15;
          _os_log_impl(&dword_2117D4000, v14, OS_LOG_TYPE_DEFAULT, "%s Deleted file %{public}@", buf, 0x16u);
        }
      }
      +[SSRUtils removeItemAtPath:](SSRUtils, "removeItemAtPath:", *(_QWORD *)(a1 + 48));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        v17 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
        {
          v18 = *(void **)(a1 + 48);
          *(_DWORD *)buf = 136315394;
          v49 = "+[SSRUtils segmentVoiceTriggerFromAudioFile:withVTEventInfo:withStorePayloadPortion:withCompletion:]_block_invoke";
          v50 = 2114;
          v51 = v18;
          _os_log_impl(&dword_2117D4000, v17, OS_LOG_TYPE_DEFAULT, "%s Deleted file %{public}@", buf, 0x16u);
        }
      }
      v19 = *(_QWORD *)(a1 + 72);
      v20 = (void *)MEMORY[0x24BDD1540];
      v58 = *MEMORY[0x24BDD0FC8];
      v59[0] = v11;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v59, &v58, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 716, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD, _QWORD))(v19 + 16))(v19, v22, 0, 0);

    }
    goto LABEL_32;
  }
  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", *(_QWORD *)(a2 + 16), *(unsigned int *)(a2 + 12));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v11, "length");
    objc_msgSend(MEMORY[0x24BE28410], "lpcmInt16ASBD");
    v41 = v40 / v47;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) += v41;
    if (*(_QWORD *)(a1 + 56))
    {
      v42 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
      v43 = *(_QWORD *)(v42 + 24);
      if (v43 < *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 24))
      {
        *(_QWORD *)(v42 + 24) = v43 + v41;
        objc_msgSend(*(id *)(a1 + 56), "addSamples:numSamples:", objc_msgSend(objc_retainAutorelease(v11), "bytes"), v41);
      }
    }
    if (*(_QWORD *)(a1 + 64)
      && (v44 = (double)*(unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24),
          objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleRate"),
          v45 * 4.0 > v44))
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24) += v41;
      v46 = *(void **)(a1 + 64);
      v11 = objc_retainAutorelease(v11);
      objc_msgSend(v46, "addSamples:numSamples:", objc_msgSend(v11, "bytes"), v41);
    }
    else
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 24) += v41;
    }
    goto LABEL_32;
  }
  v23 = (float)*(unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
  objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleRate");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = (unint64_t)(float)((float)(v23 / v24) * 1000.0);
  v25 = (float)*(unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24);
  objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleRate");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = (unint64_t)(float)((float)(v25 / v26) * 1000.0);
  v27 = (float)*(unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24);
  objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleRate");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = (unint64_t)(float)((float)(v27 / v28) * 1000.0);
  v29 = (float)*(unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 24);
  objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleRate");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24) = (unint64_t)(float)((float)(v29 / v30) * 1000.0);
  v31 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v32 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    v33 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
    v34 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24);
    v35 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24);
    *(_DWORD *)buf = 136316162;
    v49 = "+[SSRUtils segmentVoiceTriggerFromAudioFile:withVTEventInfo:withStorePayloadPortion:withCompletion:]_block_invoke";
    v50 = 2048;
    v51 = v32;
    v52 = 2048;
    v53 = v33;
    v54 = 2048;
    v55 = v34;
    v56 = 2048;
    v57 = v35;
    _os_log_impl(&dword_2117D4000, v31, OS_LOG_TYPE_DEFAULT, "%s EOF: utteranceLength: %lums, tdlength: %lums tdtiLength: %lums tdtiDiscardedLength: %lums", buf, 0x34u);
  }
  v36 = *(void **)(a1 + 56);
  if (v36)
    objc_msgSend(v36, "endAudio");
  v37 = *(void **)(a1 + 64);
  if (v37)
    objc_msgSend(v37, "endAudio");
  v38 = *(_QWORD *)(a1 + 72);
  if (v38)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", *(_QWORD *)(a1 + 40));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, id, void *))(v38 + 16))(v38, 0, v11, v39);

    }
    else
    {
      (*(void (**)(uint64_t, _QWORD, id, _QWORD))(v38 + 16))(v38, 0, v11, 0);
    }
LABEL_32:

  }
}

void __56__SSRUtils_getHomeUserIdForVoiceProfile_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  v8 = *(id *)(a1 + 32);
  if (v7)
  {
    v9 = (void *)*MEMORY[0x24BE284B8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v10 = *(void **)(a1 + 40);
    v11 = v9;
    objc_msgSend(v10, "siriProfileId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 136315651;
    v18 = "+[SSRUtils getHomeUserIdForVoiceProfile:withCompletion:]_block_invoke";
    v19 = 2114;
    v20 = v12;
    v21 = 2113;
    v22 = v7;
    _os_log_error_impl(&dword_2117D4000, v11, OS_LOG_TYPE_ERROR, "%s ERR: Home User Id erred %{public}@ for Siri Profile Id %{private}@", (uint8_t *)&v17, 0x20u);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
    v13 = (void *)*MEMORY[0x24BE284B8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v14 = *(void **)(a1 + 40);
    v11 = v13;
    objc_msgSend(v14, "siriProfileId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v17 = 136315650;
    v18 = "+[SSRUtils getHomeUserIdForVoiceProfile:withCompletion:]_block_invoke";
    v19 = 2114;
    v20 = v12;
    v21 = 2114;
    v22 = v15;
    _os_log_impl(&dword_2117D4000, v11, OS_LOG_TYPE_DEFAULT, "%s siriProfileId %{public}@ maps to homeUserId %{public}@", (uint8_t *)&v17, 0x20u);
  }

LABEL_7:
  objc_msgSend(*(id *)(a1 + 48), "leave");
  v16 = *(_QWORD *)(a1 + 56);
  if (v16)
    (*(void (**)(uint64_t, _QWORD, id))(v16 + 16))(v16, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v7);

}

void __45__SSRUtils_getNumberOfAudioFilesInDirectory___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;

  objc_msgSend(a2, "pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("wav"));

  if (v4)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

void __47__SSRUtils_deviceCategoryForDeviceProductType___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("iPad3,4"), CFSTR("iPad3,5"), CFSTR("iPad3,6"), CFSTR("iPad4,1"), CFSTR("iPad4,2"), CFSTR("iPad4,3"), CFSTR("iPad4,4"), CFSTR("iPad4,5"), CFSTR("iPad4,6"), CFSTR("iPad4,7"), CFSTR("iPad4,8"), CFSTR("iPad4,9"), CFSTR("iPad5,1"), CFSTR("iPad5,2"), CFSTR("iPad5,3"), CFSTR("iPad5,4"), CFSTR("iPad6,7"),
    CFSTR("iPad6,8"),
    CFSTR("iPad6,11"),
    CFSTR("iPad6,12"),
    CFSTR("iPhone5,1"),
    CFSTR("iPhone5,2"),
    CFSTR("iPhone5,3"),
    CFSTR("iPhone5,4"),
    CFSTR("iPhone6,1"),
    CFSTR("iPhone6,2"),
    CFSTR("iPhone7,1"),
    CFSTR("iPhone7,2"),
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)deviceCategoryForDeviceProductType__nonAopDeviceSet;
  deviceCategoryForDeviceProductType__nonAopDeviceSet = v0;

}

void __46__SSRUtils_cleanupOrphanedVoiceIdGradingFiles__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "+[SSRUtils cleanupOrphanedVoiceIdGradingFiles]_block_invoke";
    v9 = 2114;
    v10 = v3;
    _os_log_impl(&dword_2117D4000, v4, OS_LOG_TYPE_INFO, "%s Deleting orphaned grading file %{public}@", (uint8_t *)&v7, 0x16u);
  }
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[SSRUtils removeItemAtPath:](SSRUtils, "removeItemAtPath:", v5);

}

@end
