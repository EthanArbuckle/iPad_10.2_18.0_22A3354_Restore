@implementation SBFWebClipUtilities

+ (id)sanitizeWebClipsIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint8_t v14[16];

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = _CFCopySystemVersionDictionaryValue();
  v5 = (void *)v4;
  v6 = CFSTR("Invalid Build Version");
  if (v4)
    v6 = (__CFString *)v4;
  v7 = v6;

  objc_msgSend(v3, "objectForKey:", CFSTR("SBFWebClipUtilitiesLastSanitizedBuildVersionUserDefaultsKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", v7);

  if (v9)
  {
    SBLogWebClip();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_18AB69000, v10, OS_LOG_TYPE_DEFAULT, "Webclips already sanitized for this build; skipping...",
        v14,
        2u);
    }

    v11 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEAC08], "webClips");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "sanitizeWebClips:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("SBFWebClipUtilitiesLastSanitizedBuildVersionUserDefaultsKey"));
  }

  return v11;
}

+ (id)sanitizeWebClips:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(a1, "sanitizeWebClip:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "error");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "result");
        if (v12)
          v14 = 1;
        else
          v14 = v13 == 0;
        if (v14)
        {
          if (!v7)
          {
            objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v7, "setObject:forKey:", v11, v10);
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)sanitizeWebClip:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  CGDataProvider *v10;
  CGImageSource *v11;
  double v12;
  double v13;
  const __CFDictionary *v14;
  CFDictionaryRef v15;
  double v16;
  double v17;
  void *v18;
  float v19;
  void *v20;
  float v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  SBFWebClipSanitationReport *v25;
  SBFWebClipSanitationReport *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  CGImage *ThumbnailAtIndex;
  const __CFURL *v45;
  CGImageDestination *v46;
  BOOL v47;
  NSObject *v48;
  NSObject *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD v57[2];
  _QWORD v58[2];
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;
  _QWORD v66[2];
  CGSize v67;
  CGSize v68;
  CGSize v69;

  v66[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3 || (objc_msgSend(v3, "pageURL"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, !v5))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.springboard.webClipUtilitiesErrorDomain"), 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = [SBFWebClipSanitationReport alloc];
    v27 = v4;
    v28 = 0;
    v29 = v8;
LABEL_15:
    v25 = -[SBFWebClipSanitationReport initWithWebClip:result:error:](v26, "initWithWebClip:result:error:", v27, v28, v29);
    goto LABEL_16;
  }
  SBLogWebClip();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v60 = v7;
    _os_log_impl(&dword_18AB69000, v6, OS_LOG_TYPE_DEFAULT, "Sanitizing webclip '%@'", buf, 0xCu);

  }
  objc_msgSend(v4, "iconImagePath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "length"))
  {
    v26 = [SBFWebClipSanitationReport alloc];
    v27 = v4;
    v28 = 1;
    v29 = 0;
    goto LABEL_15;
  }
  v9 = objc_retainAutorelease(v8);
  v10 = CGDataProviderCreateWithFilename((const char *)objc_msgSend(v9, "fileSystemRepresentation"));
  v11 = CGImageSourceCreateWithDataProvider(v10, 0);
  v13 = *MEMORY[0x1E0C9D820];
  v12 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v65 = *MEMORY[0x1E0CBD240];
  v66[0] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, &v65, 1);
  v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v15 = CGImageSourceCopyPropertiesAtIndex(v11, 0, v14);

  v16 = v12;
  v17 = v13;
  if (v15)
  {
    -[__CFDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD048]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "floatValue");
    v17 = v19;

    -[__CFDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD040]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "floatValue");
    v16 = v21;

    CFRelease(v15);
  }
  SBLogWebClip();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v13 == v17 && v12 == v16)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      +[SBFWebClipUtilities sanitizeWebClip:].cold.1(v4);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.springboard.webClipUtilitiesErrorDomain"), 1, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[SBFWebClipSanitationReport initWithWebClip:result:error:]([SBFWebClipSanitationReport alloc], "initWithWebClip:result:error:", v4, 0, v24);

    if (!v11)
      goto LABEL_48;
  }
  else
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "identifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v67.width = v17;
      v67.height = v16;
      NSStringFromCGSize(v67);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v60 = v31;
      v61 = 2112;
      v62 = v32;
      _os_log_impl(&dword_18AB69000, v23, OS_LOG_TYPE_INFO, "Webclip '%@' is of size %@; checking if sanitization is needed...",
        buf,
        0x16u);

    }
    if (v17 > 400.0 || v16 > 400.0)
    {
      SBLogWebClip();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "identifier");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v68.width = v17;
        v68.height = v16;
        NSStringFromCGSize(v68);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v69.width = 400.0;
        v69.height = 400.0;
        NSStringFromCGSize(v69);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v60 = v38;
        v61 = 2112;
        v62 = v39;
        v63 = 2112;
        v64 = v40;
        _os_log_impl(&dword_18AB69000, v37, OS_LOG_TYPE_INFO, "Webclip '%@' needs to be sanitized; resizing icon from %@ -> %@",
          buf,
          0x20u);

      }
      v41 = (void *)MEMORY[0x18D773FD4]();
      v42 = *MEMORY[0x1E0CBD2A0];
      v57[0] = *MEMORY[0x1E0CBD178];
      v57[1] = v42;
      v58[0] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 400.0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v58[1] = v43;
      ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v11, 0, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v57, 2));

      if (ThumbnailAtIndex)
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v9);
        v45 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
        v46 = CGImageDestinationCreateWithURL(v45, (CFStringRef)objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier"), 1uLL, 0);

        CGImageDestinationAddImage(v46, ThumbnailAtIndex, 0);
        v47 = CGImageDestinationFinalize(v46);
        SBLogWebClip();
        v48 = objc_claimAutoreleasedReturnValue();
        v49 = v48;
        if (v47)
        {
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v4, "identifier");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v60 = v50;
            _os_log_impl(&dword_18AB69000, v49, OS_LOG_TYPE_DEFAULT, "Sanitized webclip '%@'", buf, 0xCu);

          }
          v25 = -[SBFWebClipSanitationReport initWithWebClip:result:error:]([SBFWebClipSanitationReport alloc], "initWithWebClip:result:error:", v4, 2, 0);
        }
        else
        {
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            +[SBFWebClipUtilities sanitizeWebClip:].cold.3(v4);

          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.springboard.webClipUtilitiesErrorDomain"), 2, 0);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = -[SBFWebClipSanitationReport initWithWebClip:result:error:]([SBFWebClipSanitationReport alloc], "initWithWebClip:result:error:", v4, 0, v53);

        }
        if (v46)
          CFRelease(v46);
        CFRelease(ThumbnailAtIndex);
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = *MEMORY[0x1E0CB2AD8];
        v56 = *MEMORY[0x1E0CB2AE0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "setAttributes:ofItemAtPath:error:", v54, v9, 0);

      }
      else
      {
        SBLogWebClip();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          +[SBFWebClipUtilities sanitizeWebClip:].cold.2(v4);

        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.springboard.webClipUtilitiesErrorDomain"), 2, 0);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = -[SBFWebClipSanitationReport initWithWebClip:result:error:]([SBFWebClipSanitationReport alloc], "initWithWebClip:result:error:", v4, 0, v52);
      }

      objc_autoreleasePoolPop(v41);
      if (!v11)
        goto LABEL_48;
    }
    else
    {
      if (objc_msgSend(v4, "sb_markIconImageFileProtectionTypeAsNone"))
      {
        SBLogWebClip();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v4, "identifier");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v60 = v34;
          _os_log_impl(&dword_18AB69000, v33, OS_LOG_TYPE_DEFAULT, "Sanitized webclip '%@' needed File Protection Class repair", buf, 0xCu);

        }
      }
      SBLogWebClip();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "identifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v60 = v36;
        _os_log_impl(&dword_18AB69000, v35, OS_LOG_TYPE_DEFAULT, "Sanitized webclip '%@' didn't need sanitizing", buf, 0xCu);

      }
      v25 = -[SBFWebClipSanitationReport initWithWebClip:result:error:]([SBFWebClipSanitationReport alloc], "initWithWebClip:result:error:", v4, 1, 0);
      if (!v11)
        goto LABEL_48;
    }
  }
  CFRelease(v11);
LABEL_48:
  if (v10)
    CFRelease(v10);
LABEL_16:

  return v25;
}

+ (void)sanitizeWebClip:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_18AB69000, v2, v3, "Webclip '%@' cannot be resized; Icon is of size 0,0; Bailing.",
    v4,
    v5,
    v6,
    v7,
    2u);

  OUTLINED_FUNCTION_3_2();
}

+ (void)sanitizeWebClip:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_18AB69000, v2, v3, "Webclip '%@' cannot be resized; Failed to create CGImageSource; Bailing.",
    v4,
    v5,
    v6,
    v7,
    2u);

  OUTLINED_FUNCTION_3_2();
}

+ (void)sanitizeWebClip:(void *)a1 .cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_18AB69000, v2, v3, "Webclip '%@' icon cannot be resized.", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3_2();
}

@end
