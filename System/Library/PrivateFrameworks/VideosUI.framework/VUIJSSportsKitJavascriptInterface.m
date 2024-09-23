@implementation VUIJSSportsKitJavascriptInterface

- (VUIJSSportsKitJavascriptInterface)initWithContext:(id)a3
{
  return (VUIJSSportsKitJavascriptInterface *)SportsKitJavascriptInterface.init(context:)((uint64_t)a3);
}

- (JSContext)context
{
  return (JSContext *)sub_1D9C3EFFC();
}

- (id)checkActivityExistsFor:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  VUIJSSportsKitJavascriptInterface *v7;
  Swift::String v8;
  Class isa;

  v4 = sub_1DA143E80();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  isa = SportsKitJavascriptInterface.checkActivityExists(for:)(v8).super.isa;

  swift_bridgeObjectRelease();
  return isa;
}

- (void)registerWithRequest:(id)a3 successHandler:(id)a4 errorHandler:(id)a5
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  VUIJSSportsKitJavascriptInterface *v12;

  v7 = _Block_copy(a4);
  v8 = _Block_copy(a5);
  v9 = sub_1DA143C7C();
  v10 = OUTLINED_FUNCTION_48();
  *(_QWORD *)(v10 + 16) = v7;
  v11 = OUTLINED_FUNCTION_48();
  *(_QWORD *)(v11 + 16) = v8;
  v12 = self;
  SportsKitJavascriptInterface.register(request:successHandler:errorHandler:)(v9, (uint64_t)sub_1D9C40170, v10, (void (*)(void))sub_1D9C333A0, v11);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (VUIJSSportsKitJavascriptInterface)init
{
  SportsKitJavascriptInterface.init()();
}

- (void).cxx_destruct
{

}

@end
