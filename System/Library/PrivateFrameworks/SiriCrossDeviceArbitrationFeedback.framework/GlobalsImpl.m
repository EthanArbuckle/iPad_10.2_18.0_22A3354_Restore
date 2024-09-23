@implementation GlobalsImpl

- (double)historyLengthSeconds
{
  return sub_24626F8C0();
}

- (void)setHistoryLengthSeconds:(double)a3
{
  sub_24626F920(a3);
}

+ (_TtC34SiriCrossDeviceArbitrationFeedback11GlobalsImpl)shared
{
  return (_TtC34SiriCrossDeviceArbitrationFeedback11GlobalsImpl *)static GlobalsImpl.shared.getter();
}

- (BOOL)isInternalInstall
{
  _TtC34SiriCrossDeviceArbitrationFeedback11GlobalsImpl *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_24626FA7C();

  return v3 & 1;
}

- (NSString)localDeviceAssistantIdentifier
{
  uint64_t v2;
  void *v3;

  sub_24626FB00();
  if (v2)
  {
    v3 = (void *)sub_2462AEF48();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setLocalDeviceAssistantIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC34SiriCrossDeviceArbitrationFeedback11GlobalsImpl *v7;

  if (a3)
  {
    v4 = sub_2462AEF54();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  sub_24626FBBC(v4, v6);

}

- (_TtC34SiriCrossDeviceArbitrationFeedback11GlobalsImpl)init
{
  return (_TtC34SiriCrossDeviceArbitrationFeedback11GlobalsImpl *)GlobalsImpl.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
