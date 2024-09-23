@implementation LyonDecoder

+ (id)getInstance
{
  if (getInstance_onceToken_3 != -1)
    dispatch_once(&getInstance_onceToken_3, &__block_literal_global_6);
  return (id)getInstance_inst_2;
}

void __26__LyonDecoder_getInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)getInstance_inst_2;
  getInstance_inst_2 = v0;

}

- (LyonDecoder)init
{
  LyonDecoder *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)LyonDecoder;
  v2 = -[LyonDecoder init](&v4, sel_init);
  if (v2)
    +[AppletTranslator registerForCleanup:]((uint64_t)AppletTranslator, v2);
  return v2;
}

- (int64_t)state
{
  void *v2;
  int64_t v3;

  +[LyonSwiftDecoder getInstance](_TtC24AppletTranslationLibrary16LyonSwiftDecoder, "getInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "stateNumber");

  return v3;
}

- (id)GetAppletProperties:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;

  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  +[LyonSwiftDecoder getInstance](_TtC24AppletTranslationLibrary16LyonSwiftDecoder, "getInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "GetAppletProperties:withPackage:withModule:withTransceiver:withError:", v14, v13, v12, v11, a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;

  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  +[LyonSwiftDecoder getInstance](_TtC24AppletTranslationLibrary16LyonSwiftDecoder, "getInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "getAppletStateAndHistory:withApplet:withPackage:withModule:withError:", v14, v13, v12, v11, a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
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
  +[LyonSwiftDecoder getInstance](_TtC24AppletTranslationLibrary16LyonSwiftDecoder, "getInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "parseHCIEvent:withApplet:withPackage:withModule:withTransceiver:withError:", v17, v16, v15, v14, v13, a8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (*a8 || objc_msgSend(v19, "count"))
    v20 = v19;
  else
    v20 = 0;

  return v20;
}

- (id)processEndOfTransaction:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;

  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  +[LyonSwiftDecoder getInstance](_TtC24AppletTranslationLibrary16LyonSwiftDecoder, "getInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "processEndOfTransaction:withApplet:withPackage:withModule:withError:", v14, v13, v12, v11, a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (BOOL)supportsStepUp:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("A000000909ACCE5501"));
}

- (void)cleanup
{
  id v2;

  +[LyonSwiftDecoder getInstance](_TtC24AppletTranslationLibrary16LyonSwiftDecoder, "getInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cleanup");

}

@end
