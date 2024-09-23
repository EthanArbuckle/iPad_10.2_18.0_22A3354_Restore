@implementation IPAVideoAdjustmentStackSerializer_v10

- (id)dataFromVideoAdjustmentStack:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id *v24;
  __CFString *v25;
  void *v26;
  id v27;
  void *v28;
  void *v30;
  void *v32;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  CMTime time2;
  CMTime v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  CMTime time1;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v32 = (void *)objc_opt_new();
  v34 = v4;
  v35 = (void *)objc_opt_new();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend(v4, "adjustments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v6)
  {
    v7 = v6;
    v8 = "-[IPAVideoAdjustmentStackSerializer_v10 dataFromVideoAdjustmentStack:error:]";
    v9 = "/Library/Caches/com.apple.xbs/Sources/Photos/lib/photosimagingfoundation/source/adjustments/serialization/seria"
         "lizers/video/IPAVideoAdjustmentStackSerializer_v10.m";
    v10 = *(_QWORD *)v41;
    do
    {
      v11 = 0;
      v36 = v7;
      do
      {
        if (*(_QWORD *)v41 != v10)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v11);
        objc_msgSend(v12, "identifier", v30);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v12, "version");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v14)
          {
            objc_msgSend(v14, "archivalRepresentation");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v16)
            {
              v17 = v10;
              v18 = v5;
              v19 = v9;
              v20 = v8;
              objc_msgSend(v12, "settings");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (v21)
              {
                v22 = (void *)objc_opt_new();
                objc_msgSend(v22, "setObject:forKeyedSubscript:", v13, CFSTR("identifier"));
                objc_msgSend(v22, "setObject:forKeyedSubscript:", v16, CFSTR("formatVersion"));
                objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, CFSTR("settings"));
                objc_msgSend(v35, "addObject:", v22);

              }
              else
              {
                v30 = v12;
                _PFAssertContinueHandler();
              }

              v8 = v20;
              v9 = v19;
              v5 = v18;
              v10 = v17;
              v7 = v36;
            }
            else
            {
              v30 = v15;
              _PFAssertContinueHandler();
            }

          }
          else
          {
            v30 = v12;
            _PFAssertContinueHandler();
          }

        }
        else
        {
          v30 = v12;
          _PFAssertContinueHandler();
        }

        ++v11;
      }
      while (v7 != v11);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v7);
  }

  objc_msgSend(v32, "setObject:forKeyedSubscript:", v35, CFSTR("adjustments"));
  memset(&v39, 0, sizeof(v39));
  if (v34
    && (objc_msgSend(v34, "naturalDuration"), (v39.flags & 0x1D) == 1)
    && (time1 = v39, time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68], CMTimeCompare(&time1, &time2) > 0))
  {
    time1 = v39;
    v23 = CMTimeCopyAsDictionary(&time1, 0);
    v24 = a4;
    if (v23)
      objc_msgSend(v32, "setObject:forKeyedSubscript:", v23, CFSTR("naturalDuration"));
  }
  else
  {
    IPAAdjustmentGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = a4;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      time1 = v39;
      v25 = (__CFString *)CMTimeCopyDescription((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &time1);
      LODWORD(time1.value) = 138412290;
      *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)v25;
      _os_log_impl(&dword_1D4CAA000, v23, OS_LOG_TYPE_DEBUG, "invalid natural duration %@ on persist", (uint8_t *)&time1, 0xCu);

    }
  }

  v37 = 0;
  -[IPAVideoAdjustmentStackSerializer_v10 dataFromArchive:error:](self, "dataFromArchive:error:", v32, &v37);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v37;
  v28 = v27;
  if (v24 && v27)
    *v24 = objc_retainAutorelease(v27);

  return v26;
}

- (id)dataFromArchive:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;

  +[IPAAdjustmentStackSerializer dataFromJSON:error:](IPAAdjustmentStackSerializer, "dataFromJSON:error:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[IPAAdjustmentStackSerializer compressData:error:](IPAAdjustmentStackSerializer, "compressData:error:", v5, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)videoAdjustmentFromArchive:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("version"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("formatVersion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("settings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) || !objc_msgSend(v6, "length"))
  {
    v31 = objc_opt_class();
    IPAAdjustmentError(1001, CFSTR("bad input: identifier missing or wrong type: %@, expected NSString"), v17, v18, v19, v20, v21, v22, v31);
    goto LABEL_12;
  }
  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v32 = objc_opt_class();
    IPAAdjustmentError(1001, CFSTR("bad input: settings missing or wrong type: %@, expected NSDictionary"), v25, v26, v27, v28, v29, v30, v32);
LABEL_12:
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    if (!a4)
      goto LABEL_15;
    goto LABEL_13;
  }
  if (v7)
  {
    +[IPAAdjustmentVersion versionFromArchivalRepresentation:](IPAAdjustmentVersion, "versionFromArchivalRepresentation:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = 0;
    }
    else
    {
      IPAAdjustmentError(1001, CFSTR("bad input: invalid formatVersion %@"), v9, v10, v11, v12, v13, v14, (uint64_t)v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v16 = 0;
    v15 = 0;
  }
  v23 = (void *)objc_opt_new();
  objc_msgSend(v23, "setIdentifier:", v6);
  objc_msgSend(v23, "setVersion:", v15);
  objc_msgSend(v23, "setSettings:", v8);

  if (a4)
  {
LABEL_13:
    if (v16)
      *a4 = objc_retainAutorelease(v16);
  }
LABEL_15:

  return v23;
}

- (id)videoAdjustmentStackFromData:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const __CFDictionary *v27;
  const __CFDictionary *v28;
  void *v30;
  void *v31;
  CMTime v32;
  CMTime v33;
  CMTime v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v41 = 0;
  +[IPAAdjustmentStackSerializer decompressData:error:](IPAAdjustmentStackSerializer, "decompressData:error:", a3, &v41);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v41;
  if (v5)
  {
    v40 = v6;
    +[IPAAdjustmentStackSerializer JSONFromData:error:](IPAAdjustmentStackSerializer, "JSONFromData:error:", v5, &v40);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v40;

    v6 = v8;
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("adjustments"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = objc_msgSend(v9, "count");
      if (v10)
      {
        v30 = v7;
        v31 = v5;
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v12 = v9;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v37;
LABEL_9:
          v16 = 0;
          while (1)
          {
            if (*(_QWORD *)v37 != v15)
              objc_enumerationMutation(v12);
            v17 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v16);
            v35 = v6;
            -[IPAVideoAdjustmentStackSerializer_v10 videoAdjustmentFromArchive:error:](self, "videoAdjustmentFromArchive:error:", v17, &v35);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v35;

            if (v18)
              objc_msgSend(v11, "addObject:", v18);

            if (v19)
              break;
            v6 = 0;
            if (v14 == ++v16)
            {
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
              v6 = 0;
              v19 = 0;
              if (v14)
                goto LABEL_9;
              break;
            }
          }
        }
        else
        {
          v19 = v6;
        }

        v7 = v30;
        v5 = v31;
        if (v11)
          goto LABEL_23;
      }
      else
      {
        v19 = v6;
      }
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:
      v26 = (void *)objc_opt_new();
      objc_msgSend(v26, "setAdjustments:", v11);
      v6 = v11;
      goto LABEL_24;
    }
  }
  objc_opt_class();
  IPAAdjustmentError(1001, CFSTR("bad input: archived '%@' missing or wrong type: %@"), v20, v21, v22, v23, v24, v25, (uint64_t)CFSTR("adjustments"));
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v26 = 0;
LABEL_24:

  v34 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("naturalDuration"));
  v27 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    memset(&v33, 0, sizeof(v33));
    CMTimeMakeFromDictionary(&v33, v27);
    if ((v33.flags & 1) != 0)
      v34 = v33;
  }
  v32 = v34;
  objc_msgSend(v26, "setNaturalDuration:", &v32);

  return v26;
}

- (id)archiveFromData:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;

  +[IPAAdjustmentStackSerializer decompressData:error:](IPAAdjustmentStackSerializer, "decompressData:error:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[IPAAdjustmentStackSerializer JSONFromData:error:](IPAAdjustmentStackSerializer, "JSONFromData:error:", v5, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
