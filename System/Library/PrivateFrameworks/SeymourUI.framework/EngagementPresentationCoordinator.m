@implementation EngagementPresentationCoordinator

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI33EngagementPresentationCoordinator_engagementClient);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI33EngagementPresentationCoordinator_messageCoordinator);
  swift_release();
  sub_22B108B84((uint64_t)self + OBJC_IVAR____TtC9SeymourUI33EngagementPresentationCoordinator_engagementBannerRuleInfo);
  swift_unknownObjectRelease();
}

- (BOOL)allowsModalMessageDisplay
{
  _TtC9SeymourUI33EngagementPresentationCoordinator *v2;
  char v3;

  v2 = self;
  v3 = EngagementPresentationCoordinator.allowsModalMessageDisplay.getter();

  return v3 & 1;
}

- (id)contextPropertyWithName:(id)a3
{
  _TtC9SeymourUI33EngagementPresentationCoordinator *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  __n128 v8;
  uint64_t v9;
  char *v10;
  void *v11;
  __int128 v13;
  uint64_t v14;

  sub_22BA8067C();
  v4 = self;
  EngagementPresentationCoordinator.contextProperty(withName:)(&v13);

  swift_bridgeObjectRelease();
  v5 = v14;
  if (!v14)
    return 0;
  v6 = __swift_project_boxed_opaque_existential_1(&v13, v14);
  v7 = *(_QWORD *)(v5 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, __n128))(v7 + 16))(v10, v8);
  v11 = (void *)sub_22BA81720();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v13);
  return v11;
}

- (id)viewControllerForModalPresentation
{
  _TtC9SeymourUI33EngagementPresentationCoordinator *v2;
  UIViewController_optional *v3;
  void *v4;
  void *v5;

  v2 = self;
  EngagementPresentationCoordinator.viewControllerForModalPresentation()(v3);
  v5 = v4;

  return v5;
}

- (_TtC9SeymourUI33EngagementPresentationCoordinator)init
{
  _TtC9SeymourUI33EngagementPresentationCoordinator *result;

  result = (_TtC9SeymourUI33EngagementPresentationCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
