@implementation IPAAdjustmentSerialization

+ (void)initialize
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[12];
  _QWORD v18[12];
  _QWORD v19[3];
  _QWORD v20[5];

  v20[3] = *MEMORY[0x1E0C80C00];
  if (!s_legacySerializerMap)
  {
    v2 = (void *)objc_opt_new();
    v19[0] = CFSTR("com.apple.photo");
    v17[0] = CFSTR("0.2");
    v17[1] = CFSTR("0.2.OSX");
    v18[0] = v2;
    v18[1] = v2;
    v17[2] = CFSTR("0.2.iOS");
    v17[3] = CFSTR("1.0.OSX");
    v18[2] = v2;
    v18[3] = v2;
    v17[4] = CFSTR("1.0.iOS");
    v17[5] = CFSTR("1");
    v18[4] = v2;
    v18[5] = v2;
    v17[6] = CFSTR("1.0");
    v17[7] = CFSTR("1.1");
    v18[6] = v2;
    v18[7] = v2;
    v17[8] = CFSTR("1.2");
    v17[9] = CFSTR("1.3");
    v18[8] = v2;
    v18[9] = v2;
    v17[10] = CFSTR("1.4");
    v17[11] = CFSTR("1.5");
    v18[10] = v2;
    v18[11] = v2;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 12);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v3;
    v19[1] = CFSTR("com.apple.video");
    v15[0] = CFSTR("0.1");
    v4 = (void *)objc_opt_new();
    v15[1] = CFSTR("1.0");
    v16[0] = v4;
    v5 = (void *)objc_opt_new();
    v16[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v6;
    v19[2] = CFSTR("com.apple.video.slomo");
    v12 = CFSTR("1.1");
    v7 = (void *)objc_opt_new();
    v13 = CFSTR("1.0");
    v14[0] = v7;
    v8 = (void *)objc_opt_new();
    v14[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v12, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3, v12, v13, v14[0]);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)s_legacySerializerMap;
    s_legacySerializerMap = v10;

  }
}

+ (id)serializerMap
{
  return (id)s_legacySerializerMap;
}

@end
