@implementation BridgedProxyContainer

- (TFCallbackRegistration)callback
{
  return (TFCallbackRegistration *)(id)sub_190AB5588();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (TFRegistrationContainer)privateContainer
{
  return (TFRegistrationContainer *)(id)sub_190AB9834();
}

- (TFRegistrationContainer)publicContainer
{
  return (TFRegistrationContainer *)(id)sub_190ABCA30();
}

- (void)setPublicContainer:(id)a3
{
  _TtC13TeaFoundation21BridgedProxyContainer *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_190B3A888((uint64_t)a3);

}

- (void)setPrivateContainer:(id)a3
{
  _TtC13TeaFoundation21BridgedProxyContainer *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_190B3A8E0((uint64_t)a3);

}

- (void)setCallback:(id)a3
{
  _TtC13TeaFoundation21BridgedProxyContainer *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_190B3A938((uint64_t)a3);

}

- (_TtC13TeaFoundation21BridgedProxyContainer)init
{
  sub_190B3A944();
}

@end
