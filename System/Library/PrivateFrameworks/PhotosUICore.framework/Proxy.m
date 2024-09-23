@implementation Proxy

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  void *Strong;
  id v8;
  id v9;
  _TtC12PhotosUICoreP33_CFFABA0BC19E421BDCF99D67E91D18945Proxy *v10;

  Strong = (void *)swift_unknownObjectUnownedLoadStrong();
  v8 = a3;
  v9 = a4;
  v10 = self;
  LOBYTE(a3) = sub_1A70A61E8(v8, v9);

  return a3 & 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  void *Strong;
  id v6;
  _TtC12PhotosUICoreP33_CFFABA0BC19E421BDCF99D67E91D18945Proxy *v7;

  Strong = (void *)swift_unknownObjectUnownedLoadStrong();
  v6 = a3;
  v7 = self;
  LOBYTE(self) = sub_1A70A6420(v6);

  return self & 1;
}

- (id)animationControllerForDismissedController:(id)a3
{
  void *Strong;
  id v6;
  _TtC12PhotosUICoreP33_CFFABA0BC19E421BDCF99D67E91D18945Proxy *v7;
  void *v8;

  Strong = (void *)swift_unknownObjectUnownedLoadStrong();
  v6 = a3;
  v7 = self;
  v8 = (void *)sub_1A70A6AF8();

  return v8;
}

- (id)interactionControllerForDismissal:(id)a3
{
  void *Strong;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t ObjectType;
  uint64_t (*v10)(uint64_t, uint64_t);
  _TtC12PhotosUICoreP33_CFFABA0BC19E421BDCF99D67E91D18945Proxy *v11;
  void *v12;

  Strong = (void *)swift_unknownObjectUnownedLoadStrong();
  swift_getObjectType();
  v6 = swift_conformsToProtocol2();
  if (v6)
    v7 = v6;
  else
    v7 = 0;
  if (v6)
    v8 = a3;
  else
    v8 = 0;
  if (v8)
  {
    ObjectType = swift_getObjectType();
    v10 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
    swift_unknownObjectRetain();
    v11 = self;
    v12 = (void *)v10(ObjectType, v7);

  }
  else
  {
    swift_unknownObjectRetain();

    v12 = 0;
  }
  swift_unknownObjectRelease();
  return v12;
}

- (_TtC12PhotosUICoreP33_CFFABA0BC19E421BDCF99D67E91D18945Proxy)init
{
  _TtC12PhotosUICoreP33_CFFABA0BC19E421BDCF99D67E91D18945Proxy *result;

  result = (_TtC12PhotosUICoreP33_CFFABA0BC19E421BDCF99D67E91D18945Proxy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectUnownedDestroy();
}

@end
