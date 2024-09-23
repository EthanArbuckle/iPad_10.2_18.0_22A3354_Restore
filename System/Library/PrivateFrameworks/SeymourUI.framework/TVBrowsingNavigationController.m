@implementation TVBrowsingNavigationController

- (_TtC9SeymourUI30TVBrowsingNavigationController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC9SeymourUI30TVBrowsingNavigationController *result;

  v5 = OBJC_IVAR____TtC9SeymourUI30TVBrowsingNavigationController_purchaseCoordinator;
  v6 = objc_allocWithZone((Class)type metadata accessor for MarketingPurchaseCoordinator());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC9SeymourUI30TVBrowsingNavigationController *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC9SeymourUI30TVBrowsingNavigationController *v2;

  v2 = self;
  sub_22B73E338();

}

- (_TtC9SeymourUI30TVBrowsingNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  _TtC9SeymourUI30TVBrowsingNavigationController *result;

  result = (_TtC9SeymourUI30TVBrowsingNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI30TVBrowsingNavigationController)initWithRootViewController:(id)a3
{
  id v3;
  _TtC9SeymourUI30TVBrowsingNavigationController *result;

  v3 = a3;
  result = (_TtC9SeymourUI30TVBrowsingNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI30TVBrowsingNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI30TVBrowsingNavigationController *result;

  v4 = a4;
  result = (_TtC9SeymourUI30TVBrowsingNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVBrowsingNavigationController_purchaseCoordinator));
  swift_unknownObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVBrowsingNavigationController_placeholderViewController));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI30TVBrowsingNavigationController_engagementPresentationCoordinator);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVBrowsingNavigationController_purchaseHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVBrowsingNavigationController_pictureInPicturePresenter));
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
}

@end
