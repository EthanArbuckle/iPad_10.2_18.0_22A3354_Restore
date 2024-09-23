@implementation TTRWorkflowViewController

- (_TtC12PhotosUICore25TTRWorkflowViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  _TtC12PhotosUICore25TTRWorkflowViewController *result;

  v5 = OBJC_IVAR____TtC12PhotosUICore25TTRWorkflowViewController_actionCache;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)sub_1A6A4C52C(MEMORY[0x1E0DEE9D8]);
  v6 = a3;

  result = (_TtC12PhotosUICore25TTRWorkflowViewController *)sub_1A7AE4AFC();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  id v2;
  id v3;
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TTRWorkflowViewController();
  v2 = v6.receiver;
  -[TTRWorkflowViewController viewDidLoad](&v6, sel_viewDidLoad);
  objc_msgSend(v2, sel_setNavigationBarHidden_animated_, 1, 0, v6.receiver, v6.super_class);
  v3 = objc_msgSend(v2, sel_interactivePopGestureRecognizer);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_setDelegate_, v2);

  }
  v5 = objc_msgSend(v2, sel_interactivePopGestureRecognizer);
  objc_msgSend(v5, sel_setEnabled_, 1);

}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  id v5;
  _TtC12PhotosUICore25TTRWorkflowViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1A6A4C6C8((uint64_t)v5);

}

- (id)popViewControllerAnimated:(BOOL)a3
{
  _TtC12PhotosUICore25TTRWorkflowViewController *v3;
  id v4;

  v3 = self;
  v4 = sub_1A6A4C7CC();

  return v4;
}

- (void)handleCachedControl:(id)a3
{
  id v4;
  _TtC12PhotosUICore25TTRWorkflowViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1A6A4628C(v4);

}

- (_TtC12PhotosUICore25TTRWorkflowViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  _TtC12PhotosUICore25TTRWorkflowViewController *result;

  result = (_TtC12PhotosUICore25TTRWorkflowViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC12PhotosUICore25TTRWorkflowViewController)initWithRootViewController:(id)a3
{
  id v3;
  _TtC12PhotosUICore25TTRWorkflowViewController *result;

  v3 = a3;
  result = (_TtC12PhotosUICore25TTRWorkflowViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC12PhotosUICore25TTRWorkflowViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  sub_1A6A4A3C4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4);
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  _TtC12PhotosUICore25TTRWorkflowViewController *v5;
  id v6;
  unint64_t v7;
  uint64_t v8;

  v4 = a3;
  v5 = self;
  v6 = -[TTRWorkflowViewController viewControllers](v5, sel_viewControllers);
  sub_1A6856488(0, (unint64_t *)&qword_1EE8C6400);
  v7 = sub_1A7AE3A10();

  if (v7 >> 62)
  {
    _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0();
    v8 = sub_1A7AE4B44();

    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);

  }
  swift_bridgeObjectRelease();
  return v8 > 1;
}

@end
