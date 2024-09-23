@implementation VUIJSSportsJavascriptInterface

- (VUIJSSportsJavascriptInterface)initWithContext:(id)a3
{
  VUIJSSportsJavascriptInterface *result;

  SportsJavascriptInterface.init(context:)((uint64_t)a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (JSContext)context
{
  return (JSContext *)sub_1D9F1B910();
}

- (NSString)storefrontId
{
  VUIJSSportsJavascriptInterface *v2;
  void *v3;

  v2 = self;
  sub_1D9F1B9AC();

  v3 = (void *)sub_1DA143E50();
  swift_bridgeObjectRelease();
  return (NSString *)OUTLINED_FUNCTION_15_14(v3);
}

- (id)checkActivityExistsFor:(id)a3
{
  return sub_1D9F1C9C8();
}

- (void)registerWithRequest:(id)a3 successHandler:(id)a4 errorHandler:(id)a5
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  VUIJSSportsJavascriptInterface *v12;

  v7 = _Block_copy(a4);
  v8 = _Block_copy(a5);
  v9 = sub_1DA143C7C();
  v10 = OUTLINED_FUNCTION_48();
  *(_QWORD *)(v10 + 16) = v7;
  v11 = OUTLINED_FUNCTION_48();
  *(_QWORD *)(v11 + 16) = v8;
  v12 = self;
  SportsJavascriptInterface.register(request:successHandler:errorHandler:)(v9, (uint64_t)sub_1D9C40170, v10, (void (*)(void))sub_1D9C333A0, v11);

  OUTLINED_FUNCTION_23();
  swift_release();
  swift_release();
}

- (id)getTierTypeWithLeagueId:(id)a3
{
  return sub_1D9F1C9C8();
}

- (id)isPlayByPlayEnabledWithLeagueId:(id)a3
{
  return sub_1D9F1C9C8();
}

- (id)isSportsFeatureEnabledWithLeagueId:(id)a3 featureName:(id)a4
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  Swift::String v12;
  Swift::String v13;
  Class isa;

  v5 = OUTLINED_FUNCTION_9_157();
  v7 = v6;
  v8 = sub_1DA143E80();
  v10 = v9;
  v11 = v4;
  v12._countAndFlagsBits = v5;
  v12._object = v7;
  v13._countAndFlagsBits = v8;
  v13._object = v10;
  isa = SportsJavascriptInterface.isSportsFeatureEnabled(leagueId:featureName:)(v12, v13).super.isa;

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_74();
  return isa;
}

- (VUIJSSportsJavascriptInterface)init
{
  SportsJavascriptInterface.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___VUIJSSportsJavascriptInterface_tierManagerClientType;
  v4 = OUTLINED_FUNCTION_12_138();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
