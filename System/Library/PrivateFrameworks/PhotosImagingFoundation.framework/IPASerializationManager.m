@implementation IPASerializationManager

+ (void)initialize
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  if (!s_serializerMap)
  {
    v2 = (id)objc_opt_new();
    v3 = (void *)objc_opt_new();
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, CFSTR("0.2"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, CFSTR("0.2.OSX"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, CFSTR("0.2.iOS"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, CFSTR("1.0.OSX"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, CFSTR("1.0.iOS"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, CFSTR("1"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, CFSTR("1.0"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, CFSTR("1.1"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, CFSTR("1.2"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, CFSTR("1.3"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, CFSTR("1.4"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, CFSTR("1.5"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, CFSTR("1.5.1"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, CFSTR("1.6"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, CFSTR("1.7"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, CFSTR("1.8"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, CFSTR("1.9"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, CFSTR("1.9.1"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, CFSTR("1.10"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, CFSTR("1.11"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, CFSTR("1.12"));
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v5;
    v14[0] = CFSTR("com.apple.photo");
    v14[1] = CFSTR("com.apple.video");
    v12[0] = CFSTR("0.1");
    v12[1] = CFSTR("1.0");
    v13[0] = v2;
    v13[1] = v2;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v6;
    v14[2] = CFSTR("com.apple.video.slomo");
    v10[0] = CFSTR("1.1");
    v10[1] = CFSTR("1.0");
    v11[0] = v3;
    v11[1] = v2;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)s_serializerMap;
    s_serializerMap = v8;

  }
}

+ (id)serializerMap
{
  return (id)s_serializerMap;
}

+ (id)_serializerForFormat:(id)a3 formatVersion:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  __CFString *v27;
  uint64_t v28;
  uint64_t v30;

  v8 = a3;
  v9 = a4;
  v16 = v9;
  if (v8 && v9)
  {
    objc_msgSend(a1, "serializerMap");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "objectForKeyedSubscript:", v16);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v26 = 0;
    }
    else
    {
      IPAAdjustmentError(1007, CFSTR("no mapping to format:%@ formatVersion:%@"), v19, v20, v21, v22, v23, v24, (uint64_t)v8);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (!a5)
      goto LABEL_16;
LABEL_14:
    if (v26)
      *a5 = objc_retainAutorelease(v26);
    goto LABEL_16;
  }
  if (v8)
  {
    v27 = CFSTR("formatVersion is nil");
    v28 = 1005;
  }
  else if (v9)
  {
    v27 = CFSTR("format is nil");
    v28 = 1004;
  }
  else
  {
    v27 = CFSTR("format and formatVersion are nil");
    v28 = 1006;
  }
  IPAAdjustmentError(v28, v27, v10, v11, v12, v13, v14, v15, v30);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  if (a5)
    goto LABEL_14;
LABEL_16:

  return v25;
}

+ (char)adjustmentTypeForFormat:(id)a3 formatVersion:(id)a4
{
  unint64_t v6;
  unint64_t v7;
  char v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  NSObject *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = (unint64_t)a3;
  v7 = (unint64_t)a4;
  if (v6 | v7)
  {
    if (objc_msgSend((id)v6, "isEqualToString:", CFSTR("com.apple.photo"))
      && (objc_msgSend((id)v7, "lowercaseString"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("0.1.ios")),
          v9,
          v10))
    {
      IPAAdjustmentGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v8 = 2;
        _os_log_impl(&dword_1D4CAA000, v11, OS_LOG_TYPE_ERROR, "[IPASerializationManager] treating adjustments as opaque. formatVersion: 0.1.ios", buf, 2u);
      }
      else
      {
        v8 = 2;
      }
    }
    else
    {
      v15 = 0;
      objc_msgSend(a1, "_serializerForFormat:formatVersion:error:", v6, v7, &v15);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v15;
      if (v12)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v8 = 3;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v8 = 4;
          else
            v8 = 0;
        }
      }
      else
      {
        IPAAdjustmentGetLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v17 = v11;
          _os_log_impl(&dword_1D4CAA000, v13, OS_LOG_TYPE_ERROR, "[IPASerializationManager] treating adjustments as opaque. %@", buf, 0xCu);
        }

        v8 = 2;
      }

    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

+ (id)formatForAdjustmentStack:(id)a3
{
  id v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  __CFString *v10;
  __CFString *v11;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = 0;
      goto LABEL_11;
    }
    objc_msgSend(v3, "adjustments");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count") == 1)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("SloMo"));

      if ((v9 & 1) != 0)
      {
        v4 = CFSTR("com.apple.video.slomo");
        v10 = CFSTR("com.apple.video.slomo");

LABEL_10:
        goto LABEL_11;
      }

    }
    v4 = CFSTR("com.apple.video");
    v11 = CFSTR("com.apple.video");
    goto LABEL_10;
  }
  v4 = CFSTR("com.apple.photo");
  v5 = CFSTR("com.apple.photo");
LABEL_11:

  return v4;
}

+ (id)serializeWithCurrentDefaultFormat:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "serializeWithCurrentDefaultFormat:format:formatVersion:error:", a3, 0, 0, a4);
}

+ (id)serializeWithCurrentDefaultFormat:(id)a3 format:(id *)a4 formatVersion:(id *)a5 error:(id *)a6
{
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v25;

  v9 = a3;
  if (!v9)
  {
    v21 = 0;
    v20 = 0;
LABEL_11:
    v10 = 0;
    v18 = 0;
    goto LABEL_12;
  }
  +[IPASerializationManager formatForAdjustmentStack:](IPASerializationManager, "formatForAdjustmentStack:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minimumVersionForFormat:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v11;
  if (v10)
    v19 = v11 == 0;
  else
    v19 = 1;
  if (v19)
  {
    IPAAdjustmentError(1006, CFSTR("both format:%@ and formatVersion:%@ must be non-nil to serialize adjustments:%@"), v12, v13, v14, v15, v16, v17, (uint64_t)v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    goto LABEL_12;
  }
  v25 = 0;
  +[IPASerializationManager serialize:format:formatVersion:error:](IPASerializationManager, "serialize:format:formatVersion:error:", v9, v10, v11, &v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v25;
  v20 = v22;
  if (!v21)
  {

    goto LABEL_11;
  }
LABEL_12:
  if (a4)
    *a4 = objc_retainAutorelease(v10);
  if (a5)
    *a5 = objc_retainAutorelease(v18);
  if (a6)
    *a6 = objc_retainAutorelease(v20);
  v23 = v21;

  return v23;
}

+ (id)serialize:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  objc_msgSend(v6, "adjustmentStack");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "format");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "formatVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "serialize:format:formatVersion:error:", v7, v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)serialize:(id)a3 format:(id)a4 formatVersion:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  const __CFString *v18;
  uint64_t v19;
  __CFString *v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v22 = 0;
  objc_msgSend(a1, "_serializerForFormat:formatVersion:error:", v11, v12, &v22);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (__CFString *)v22;
  if (!v13)
  {
    v16 = 0;
    if (!a6)
      goto LABEL_15;
    goto LABEL_13;
  }
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a6)
      goto LABEL_15;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v11, CFSTR("format"));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v12, CFSTR("formatVersion"));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v10, CFSTR("stack"));
  v21 = v14;
  objc_msgSend(v13, "dataFromAdjustmentStack:error:", v10, &v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v21;

  if (!v16)
  {
    if (v17)
      v18 = v17;
    else
      v18 = CFSTR("nil");
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, CFSTR("serializeError"));
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IPAAdjustmentErrorDomain"), 1003, v15);
    v19 = objc_claimAutoreleasedReturnValue();

    v17 = (__CFString *)v19;
  }

  v14 = v17;
  if (a6)
  {
LABEL_13:
    if (v14)
      *a6 = objc_retainAutorelease(v14);
  }
LABEL_15:

  return v16;
}

+ (id)deserialize:(id)a3 originator:(id)a4 format:(id)a5 formatVersion:(id)a6 error:(id *)a7
{
  id v12;
  __CFString *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  const __CFString *v25;
  uint64_t v26;
  void *v28;
  SEL v29;
  id v30;
  id *v31;
  id *v32;
  __CFString *v33;
  id v34;

  v12 = a3;
  v13 = (__CFString *)a4;
  v14 = a5;
  v15 = a6;
  if (!v14)
  {
    _PFAssertFailHandler();
    goto LABEL_22;
  }
  v16 = v15;
  if (!v15)
  {
LABEL_22:
    v28 = (void *)_PFAssertFailHandler();
    return +[IPASerializationManager debug_serializeEnvelope:error:](v28, v29, v30, v31);
  }
  v34 = 0;
  objc_msgSend(a1, "_serializerForFormat:formatVersion:error:", v14, v15, &v34);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (__CFString *)v34;
  if (v17)
  {
    if (v12)
    {
      v32 = a7;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NSData %p with %lu bytes"), v12, objc_msgSend(v12, "length"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, CFSTR("data"));

      if (v13)
        v21 = v13;
      else
        v21 = CFSTR("nil");
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, CFSTR("originator"));
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v14, CFSTR("format"));
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v16, CFSTR("formatVersion"));
      objc_msgSend(v19, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("serializer"));
      v33 = v18;
      objc_msgSend(v17, "adjustmentStackFromData:error:", v12, &v33);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v33;

      if (v22)
      {
        v24 = (void *)objc_opt_new();
        objc_msgSend(v24, "setOriginator:", v13);
        objc_msgSend(v24, "setFormat:", v14);
        objc_msgSend(v24, "setFormatVersion:", v16);
        objc_msgSend(v24, "setAdjustmentStack:", v22);
      }
      else
      {
        if (v23)
          v25 = v23;
        else
          v25 = CFSTR("nil");
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v25, CFSTR("deserializeError"));
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IPAAdjustmentErrorDomain"), 1001, v19);
        v26 = objc_claimAutoreleasedReturnValue();

        v24 = 0;
        v23 = (__CFString *)v26;
      }

      v18 = v23;
      a7 = v32;
    }
    else
    {
      v24 = (void *)objc_opt_new();
      objc_msgSend(v24, "setOriginator:", v13);
      objc_msgSend(v24, "setFormat:", v14);
      objc_msgSend(v24, "setFormatVersion:", v16);
      objc_msgSend(v24, "setAdjustmentStack:", 0);
    }
  }
  else
  {
    v24 = 0;
  }
  if (a7)
  {
    if (v18)
      *a7 = objc_retainAutorelease(v18);
  }

  return v24;
}

+ (id)debug_serializeEnvelope:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  objc_msgSend(a1, "serialize:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v6, "format");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D75398]);

    objc_msgSend(v6, "formatVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D753A8]);

    objc_msgSend(v6, "originator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D75390]);

    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D75388]);
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (char)debug_adjustmentTypeFromEnvelopeDictionary:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *MEMORY[0x1E0D75398];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D753A8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a1) = objc_msgSend(a1, "adjustmentTypeForFormat:formatVersion:", v6, v7);
  return (char)a1;
}

+ (id)debug_deserializeEnvelopeDictionary:(id)a3 error:(id *)a4
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
  uint64_t v18;

  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D75398]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D753A8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D75390]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D75388]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    +[IPASerializationManager deserialize:originator:format:formatVersion:error:](IPASerializationManager, "deserialize:originator:format:formatVersion:error:", v15, v8, v6, v7, a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a4)
  {
    IPAAdjustmentError(1001, CFSTR("failed to get data out of archive"), v9, v10, v11, v12, v13, v14, v18);
    v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

@end
