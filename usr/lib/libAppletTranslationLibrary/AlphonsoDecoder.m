@implementation AlphonsoDecoder

+ (id)getInstance
{
  if (getInstance_onceToken_1 != -1)
    dispatch_once(&getInstance_onceToken_1, &__block_literal_global_3);
  return (id)getInstance___instance;
}

void __30__AlphonsoDecoder_getInstance__block_invoke()
{
  AlphonsoDecoder *v0;
  void *v1;

  v0 = objc_alloc_init(AlphonsoDecoder);
  v1 = (void *)getInstance___instance;
  getInstance___instance = (uint64_t)v0;

}

- (id)GetAppletProperties:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7
{
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = CFSTR("Supported");
  v9[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1, a6, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  +[AlphonsoSwiftDecoder getInstance](_TtC24AppletTranslationLibrary20AlphonsoSwiftDecoder, "getInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "getAppletStateAndHistory:withApplet:withPackage:withModule:withError:", v14, v13, v12, v11, a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (*a7 || !objc_msgSend(v16, "count"))
    v17 = 0;
  else
    v17 = v16;

  return v17;
}

- (id)parseHCIEvent:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withTransceiver:(id)a7 withError:(id *)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;

  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  +[AlphonsoSwiftDecoder getInstance](_TtC24AppletTranslationLibrary20AlphonsoSwiftDecoder, "getInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "parseHCIEvent:withApplet:withPackage:withModule:withTransceiver:withError:", v17, v16, v15, v14, v13, a8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (*a8 || !objc_msgSend(v19, "count"))
    v20 = 0;
  else
    v20 = v19;

  return v20;
}

- (id)processEndOfTransaction:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
{
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t v17;
  void *v18;
  uint8_t v20[8];
  _QWORD v21[2];
  _QWORD v22[2];
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  ATLLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_1C3511000, v8, OS_LOG_TYPE_ERROR, "AlphonsoDecoder doesn't expect processEndOfTransaction", v20, 2u);
  }

  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("AlphonsoDecoder doesn't expect processEndOfTransaction"));
  v10 = (void *)v9;
  if (a7)
  {
    v11 = *a7;
    v12 = (void *)MEMORY[0x1E0CB35C8];
    if (*a7)
    {
      v13 = *MEMORY[0x1E0CB3388];
      v21[0] = *MEMORY[0x1E0CB2D50];
      v21[1] = v13;
      v22[0] = v9;
      v22[1] = v11;
      v14 = (void *)MEMORY[0x1E0C99D80];
      v15 = v22;
      v16 = v21;
      v17 = 2;
    }
    else
    {
      v23 = *MEMORY[0x1E0CB2D50];
      v24[0] = v9;
      v14 = (void *)MEMORY[0x1E0C99D80];
      v15 = v24;
      v16 = &v23;
      v17 = 1;
    }
    objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("ATL"), 7, v18);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

@end
