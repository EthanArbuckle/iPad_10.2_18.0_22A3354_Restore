@implementation VoicesRotorNewVoiceBridge

+ (id)makeVoicesRotorSelectLanguage
{
  id v2;
  id v3;
  void *v4;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  char v9;

  sub_24888D1F8((uint64_t)&v8);
  v6 = v8;
  LOBYTE(v7) = v9;
  v2 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_257796340));
  v3 = (id)sub_2488BCC1C();
  v4 = (void *)sub_2488BD774();
  objc_msgSend(v3, sel_setTitle_, v4, v6, v7);

  return v3;
}

- (VoicesRotorNewVoiceBridge)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VoicesRotorNewVoiceBridge();
  return -[VoicesRotorNewVoiceBridge init](&v3, sel_init);
}

@end
