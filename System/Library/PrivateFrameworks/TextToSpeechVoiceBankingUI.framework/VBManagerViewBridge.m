@implementation VBManagerViewBridge

+ (id)makeVBManagerViewControllerWithAuthenticationCallback:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = _Block_copy(a3);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  v5 = _s26TextToSpeechVoiceBankingUI19VBManagerViewBridgeC04makegH10Controller22authenticationCallbackSo06UIViewK0Cy10Foundation4UUIDV_SStc_tFZ_0((uint64_t)sub_2488362DC, v4);
  swift_release();
  return v5;
}

- (VBManagerViewBridge)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VBManagerViewBridge();
  return -[VBManagerViewBridge init](&v3, sel_init);
}

@end
