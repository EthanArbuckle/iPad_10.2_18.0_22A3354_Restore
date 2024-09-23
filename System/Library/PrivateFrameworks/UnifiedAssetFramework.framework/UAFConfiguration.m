@implementation UAFConfiguration

+ (BOOL)isValidValue:(id)a3 key:(id)a4 kind:(Class)a5 required:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v8;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  char isKindOfClass;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void **v23;
  uint64_t *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void **v29;
  uint64_t *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  id v36;
  void *v37;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  Class v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  id v48;
  uint64_t v49;
  void *v50;
  _QWORD v51[2];
  _QWORD v52[2];
  uint64_t v53;
  void *v54;
  _QWORD v55[2];
  _QWORD v56[3];

  v8 = a6;
  v56[2] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  if (v8)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      if (a7)
      {
        v26 = (void *)MEMORY[0x24BDD1540];
        if (*a7)
        {
          v55[0] = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Required key %@ has no value"), v12);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v55[1] = *MEMORY[0x24BDD1398];
          v56[0] = v27;
          v56[1] = *a7;
          v28 = (void *)MEMORY[0x24BDBCE70];
          v29 = (void **)v56;
          v30 = v55;
          v31 = 2;
        }
        else
        {
          v53 = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Required key %@ has no value"), v12);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = v27;
          v28 = (void *)MEMORY[0x24BDBCE70];
          v29 = &v54;
          v30 = &v53;
          v31 = 1;
        }
        objc_msgSend(v28, "dictionaryWithObjects:forKeys:count:", v29, v30, v31);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v37);
        *a7 = (id)objc_claimAutoreleasedReturnValue();

      }
      UAFGetLogCategory((id *)&UAFLogContextConfiguration);
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v40 = "+[UAFConfiguration isValidValue:key:kind:required:error:]";
        v41 = 2112;
        v42 = v12;
        _os_log_impl(&dword_229282000, v34, OS_LOG_TYPE_DEFAULT, "%s Required key %@ has no value", buf, 0x16u);
      }
      goto LABEL_20;
    }
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      if (a7)
      {
        v18 = (void *)MEMORY[0x24BDD1540];
        if (*a7)
        {
          v51[0] = *MEMORY[0x24BDD0FC8];
          v19 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v11, "objectForKeyedSubscript:", v12);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringWithFormat:", CFSTR("Key %@ is not expected kind \"%@\": %@ vs %@"), v12, a5, v20, objc_opt_class());
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v51[1] = *MEMORY[0x24BDD1398];
          v52[0] = v21;
          v52[1] = *a7;
          v22 = (void *)MEMORY[0x24BDBCE70];
          v23 = (void **)v52;
          v24 = v51;
          v25 = 2;
        }
        else
        {
          v49 = *MEMORY[0x24BDD0FC8];
          v32 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v11, "objectForKeyedSubscript:", v12);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "stringWithFormat:", CFSTR("Key %@ is not expected kind \"%@\": %@ vs %@"), v12, a5, v20, objc_opt_class());
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = v21;
          v22 = (void *)MEMORY[0x24BDBCE70];
          v23 = &v50;
          v24 = &v49;
          v25 = 1;
        }
        objc_msgSend(v22, "dictionaryWithObjects:forKeys:count:", v23, v24, v25);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v33);
        *a7 = (id)objc_claimAutoreleasedReturnValue();

      }
      UAFGetLogCategory((id *)&UAFLogContextConfiguration);
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", v12);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136316162;
        v40 = "+[UAFConfiguration isValidValue:key:kind:required:error:]";
        v41 = 2112;
        v42 = v12;
        v43 = 2112;
        v44 = a5;
        v45 = 2112;
        v46 = v35;
        v47 = 2112;
        v48 = (id)objc_opt_class();
        v36 = v48;
        _os_log_impl(&dword_229282000, v34, OS_LOG_TYPE_DEFAULT, "%s Key %@ is not expected kind \"%@\": %@ vs %@", buf, 0x34u);

      }
LABEL_20:

      v17 = 0;
      goto LABEL_21;
    }
  }
  v17 = 1;
LABEL_21:

  return v17;
}

+ (BOOL)isValid:(id)a3 fileType:(id)a4 fileVersions:(id)a5 error:(id *)a6
{
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  char v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void **v24;
  uint64_t *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void **v32;
  uint64_t *v33;
  uint64_t v34;
  BOOL v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  void *v50;
  _QWORD v51[2];
  _QWORD v52[2];
  uint8_t v53[128];
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  const __CFString *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  NSObject *v61;
  uint64_t v62;
  void *v63;
  _QWORD v64[2];
  _QWORD v65[5];

  v65[2] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("FileType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[NSObject isEqualToString:](v10, "isEqualToString:", v12);

  if ((v13 & 1) != 0)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("FileVersion"));
    v14 = objc_claimAutoreleasedReturnValue();
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v15 = v11;
    v16 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v46;
      while (2)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v46 != v18)
            objc_enumerationMutation(v15);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "isEqualToString:", v14) & 1) != 0)
          {
            v35 = 1;
            goto LABEL_27;
          }
        }
        v17 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
        if (v17)
          continue;
        break;
      }
    }

    if (a6)
    {
      v44 = (void *)MEMORY[0x24BDD1540];
      if (*a6)
      {
        v51[0] = *MEMORY[0x24BDD0FC8];
        v20 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("FileVersion"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringWithFormat:", CFSTR("%@ value \"%@\" is not one of \"%@\"), CFSTR("FileVersion"), v21, v15);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v51[1] = *MEMORY[0x24BDD1398];
        v52[0] = v22;
        v52[1] = *a6;
        v23 = (void *)MEMORY[0x24BDBCE70];
        v24 = (void **)v52;
        v25 = v51;
        v26 = 2;
      }
      else
      {
        v49 = *MEMORY[0x24BDD0FC8];
        v39 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("FileVersion"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "stringWithFormat:", CFSTR("%@ value \"%@\" is not one of \"%@\"), CFSTR("FileVersion"), v21, v15);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v22;
        v23 = (void *)MEMORY[0x24BDBCE70];
        v24 = &v50;
        v25 = &v49;
        v26 = 1;
      }
      objc_msgSend(v23, "dictionaryWithObjects:forKeys:count:", v24, v25, v26);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v40);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    UAFGetLogCategory((id *)&UAFLogContextConfiguration);
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("FileVersion"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v55 = "+[UAFConfiguration isValid:fileType:fileVersions:error:]";
      v56 = 2112;
      v57 = CFSTR("FileVersion");
      v58 = 2112;
      v59 = v42;
      v60 = 2112;
      v61 = v15;
      _os_log_impl(&dword_229282000, v41, OS_LOG_TYPE_DEFAULT, "%s %@ value \"%@\" is not one of \"%@\", buf, 0x2Au);

    }
    v35 = 0;
    v15 = v41;
LABEL_27:

  }
  else
  {
    if (a6)
    {
      v27 = (void *)MEMORY[0x24BDD1540];
      if (*a6)
      {
        v64[0] = *MEMORY[0x24BDD0FC8];
        v28 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("FileType"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "stringWithFormat:", CFSTR("%@ value \"%@\" is not \"%@\"), CFSTR("FileType"), v29, v10);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v64[1] = *MEMORY[0x24BDD1398];
        v65[0] = v30;
        v65[1] = *a6;
        v31 = (void *)MEMORY[0x24BDBCE70];
        v32 = (void **)v65;
        v33 = v64;
        v34 = 2;
      }
      else
      {
        v62 = *MEMORY[0x24BDD0FC8];
        v36 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("FileType"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "stringWithFormat:", CFSTR("%@ value \"%@\" is not \"%@\"), CFSTR("FileType"), v29, v10);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = v30;
        v31 = (void *)MEMORY[0x24BDBCE70];
        v32 = &v63;
        v33 = &v62;
        v34 = 1;
      }
      objc_msgSend(v31, "dictionaryWithObjects:forKeys:count:", v32, v33, v34);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v37);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    UAFGetLogCategory((id *)&UAFLogContextConfiguration);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("FileType"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v55 = "+[UAFConfiguration isValid:fileType:fileVersions:error:]";
      v56 = 2112;
      v57 = CFSTR("FileType");
      v58 = 2112;
      v59 = v38;
      v60 = 2112;
      v61 = v10;
      _os_log_impl(&dword_229282000, v14, OS_LOG_TYPE_DEFAULT, "%s %@ value \"%@\" is not \"%@\", buf, 0x2Au);

    }
    v35 = 0;
  }

  return v35;
}

+ (BOOL)trialFeatureEnabled:(id)a3
{
  id v3;
  NSObject *v4;
  BOOL v5;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siri.asr.hammer"))
     || objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siri.understanding"))
     || objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siri.understanding.nl.overrides"))
     || objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siri.tts"))
     || objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siri.dialog"))
     || objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siri.findmy")))
    && (_os_feature_enabled_impl() & 1) != 0)
  {
    UAFGetLogCategory((id *)&UAFLogContextConfiguration);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v7 = 136315394;
      v8 = "+[UAFConfiguration trialFeatureEnabled:]";
      v9 = 2112;
      v10 = v3;
      _os_log_debug_impl(&dword_229282000, v4, OS_LOG_TYPE_DEBUG, "%s Trial Feature disabled for %@", (uint8_t *)&v7, 0x16u);
    }
    v5 = 0;
  }
  else
  {
    UAFGetLogCategory((id *)&UAFLogContextConfiguration);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v7 = 136315394;
      v8 = "+[UAFConfiguration trialFeatureEnabled:]";
      v9 = 2112;
      v10 = v3;
      _os_log_debug_impl(&dword_229282000, v4, OS_LOG_TYPE_DEBUG, "%s Trial Feature enabled for %@", (uint8_t *)&v7, 0x16u);
    }
    v5 = 1;
  }

  return v5;
}

+ (BOOL)autoAssetFeatureEnabled:(id)a3
{
  id v3;
  NSObject *v4;
  BOOL v5;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siri.dialog"))
    || objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siri.asr.hammer"))
    || objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siri.findmy"))
    || objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siri.understanding"))
    || objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siri.understanding.nl.overrides")))
  {
    if ((_os_feature_enabled_impl() & 1) != 0)
    {
LABEL_7:
      UAFGetLogCategory((id *)&UAFLogContextConfiguration);
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        v7 = 136315394;
        v8 = "+[UAFConfiguration autoAssetFeatureEnabled:]";
        v9 = 2112;
        v10 = v3;
        _os_log_debug_impl(&dword_229282000, v4, OS_LOG_TYPE_DEBUG, "%s Auto Asset Feature enabled for %@", (uint8_t *)&v7, 0x16u);
      }
      v5 = 1;
      goto LABEL_15;
    }
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siri.tts"))
         && _os_feature_enabled_impl())
  {
    goto LABEL_7;
  }
  UAFGetLogCategory((id *)&UAFLogContextConfiguration);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v7 = 136315394;
    v8 = "+[UAFConfiguration autoAssetFeatureEnabled:]";
    v9 = 2112;
    v10 = v3;
    _os_log_debug_impl(&dword_229282000, v4, OS_LOG_TYPE_DEBUG, "%s Auto Asset Feature disabled for %@", (uint8_t *)&v7, 0x16u);
  }
  v5 = 0;
LABEL_15:

  return v5;
}

+ (BOOL)assetRootSupported
{
  return _os_feature_enabled_impl();
}

@end
