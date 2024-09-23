@implementation LegacyPersonBannerModelProxy

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  void *v7;
  uint64_t (*v8)();
  char *v9;
  uint64_t v10;
  uint64_t ObjectType;
  void (*v12)(id, uint64_t, uint64_t);
  id v13;
  _TtC12PhotosUICore28LegacyPersonBannerModelProxy *v14;

  v7 = _Block_copy(a5);
  if (v7)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v7;
    v8 = sub_1A6F94C7C;
  }
  else
  {
    v8 = 0;
  }
  v9 = (char *)self + OBJC_IVAR____TtC12PhotosUICore28LegacyPersonBannerModelProxy_model;
  swift_unknownObjectUnownedLoadStrong();
  v10 = *((_QWORD *)v9 + 1);
  ObjectType = swift_getObjectType();
  v12 = *(void (**)(id, uint64_t, uint64_t))(v10 + 16);
  v13 = a3;
  v14 = self;
  v12(a3, ObjectType, v10);
  swift_unknownObjectRelease();
  if (v7)
  {
    v8();
    sub_1A6855D80((uint64_t)v8);
  }

}

- (void)dismissViewController:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t (*v7)(uint64_t);
  id v8;
  _TtC12PhotosUICore28LegacyPersonBannerModelProxy *v9;

  v7 = (uint64_t (*)(uint64_t))_Block_copy(a5);
  if (v7)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v7;
    v7 = (uint64_t (*)(uint64_t))sub_1A6C77528;
  }
  v8 = a3;
  v9 = self;
  sub_1A6F94A14(v8, v7);
  sub_1A6855D80((uint64_t)v7);

}

- (UIViewController)presentingViewController
{
  return (UIViewController *)0;
}

- (BOOL)canPushViewController
{
  return 0;
}

- (BOOL)canPresentPopovers
{
  return 0;
}

- (BOOL)pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL result;

  result = sub_1A7AE4AFC();
  __break(1u);
  return result;
}

- (BOOL)popToViewController:(id)a3 animated:(BOOL)a4
{
  BOOL result;

  result = sub_1A7AE4AFC();
  __break(1u);
  return result;
}

- (id)presentAlertWithConfigurationHandler:(id)a3
{
  id result;

  _Block_copy(a3);
  result = (id)sub_1A7AE4AFC();
  __break(1u);
  return result;
}

- (void)dismissAlertWithToken:(id)a3 completionHandler:(id)a4
{
  _Block_copy(a4);
  sub_1A7AE4AFC();
  __break(1u);
}

- (_TtC12PhotosUICore28LegacyPersonBannerModelProxy)init
{
  _TtC12PhotosUICore28LegacyPersonBannerModelProxy *result;

  result = (_TtC12PhotosUICore28LegacyPersonBannerModelProxy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A6A6FE84((uint64_t)self + OBJC_IVAR____TtC12PhotosUICore28LegacyPersonBannerModelProxy_model);
}

@end
