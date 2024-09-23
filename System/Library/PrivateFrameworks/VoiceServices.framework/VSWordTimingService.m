@implementation VSWordTimingService

- (id)timingInfosFrom:(id)a3 withText:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  VSSpeechWordTimingInfo *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v31;
  id obj;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v5;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("word_timings"));
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v33 = *(_QWORD *)v35;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v35 != v33)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v7, "lastObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "allKeys");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "firstObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = objc_msgSend(v6, "rangeOfString:options:range:", v15, 0, v10, objc_msgSend(v6, "length") - v10);
        if (v16 == 0x7FFFFFFFFFFFFFFFLL)
        {
          VSGetLogDefault();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v39 = v15;
            v40 = 2112;
            v41 = v6;
            _os_log_error_impl(&dword_1DE15E000, v29, OS_LOG_TYPE_ERROR, "Unable to locate word '%@' in '%@'", buf, 0x16u);
          }

          v28 = 0;
          v25 = obj;
          v27 = obj;
          goto LABEL_17;
        }
        v18 = v16;
        v19 = v17;
        if (v10 < v16)
          objc_msgSend(v13, "setTextRange:", objc_msgSend(v13, "textRange"), v16 - objc_msgSend(v13, "textRange"));
        objc_msgSend(v12, "allValues");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "firstObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "doubleValue");
        v23 = v22;

        v24 = objc_alloc_init(VSSpeechWordTimingInfo);
        -[VSSpeechWordTimingInfo setTextRange:](v24, "setTextRange:", v18, v19);
        -[VSSpeechWordTimingInfo setStartTime:](v24, "setStartTime:", v23);
        objc_msgSend(v7, "addObject:", v24);
        v10 = v18 + v19;

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      if (v9)
        continue;
      break;
    }
  }
  v25 = obj;

  objc_msgSend(v7, "lastObject");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v26)
    objc_msgSend(v26, "setTextRange:", objc_msgSend(v26, "textRange"), objc_msgSend(v6, "length") - objc_msgSend(v26, "textRange"));
  v28 = v7;
LABEL_17:

  return v28;
}

- (id)timingPlistForLanguage:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathForResource:ofType:inDirectory:", v4, CFSTR("plist"), CFSTR("TTSWordTimings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)estimatedTTSWordTimingForText:(id)a3 withLanguage:(id)a4 voiceName:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[VSWordTimingService timingPlistForLanguage:](self, "timingPlistForLanguage:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = v9;
    if (!v11
      || (objc_msgSend(v10, "objectForKeyedSubscript:", v11),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v12,
          !v12))
    {
      objc_msgSend(v10, "allKeys");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v14 = objc_claimAutoreleasedReturnValue();

      v11 = (id)v14;
    }
    objc_msgSend(v10, "objectForKeyedSubscript:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      -[VSWordTimingService timingInfosFrom:withText:](self, "timingInfosFrom:withText:", v16, v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        VSGetLogDefault();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v20 = 138412546;
          v21 = v11;
          v22 = 2112;
          v23 = v8;
          _os_log_impl(&dword_1DE15E000, v18, OS_LOG_TYPE_DEFAULT, "Found prepared word timing info for voice '%@', text: '%@'", (uint8_t *)&v20, 0x16u);
        }

      }
    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (NSDictionary)wordTimings
{
  return self->_wordTimings;
}

- (void)setWordTimings:(id)a3
{
  objc_storeStrong((id *)&self->_wordTimings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wordTimings, 0);
}

@end
