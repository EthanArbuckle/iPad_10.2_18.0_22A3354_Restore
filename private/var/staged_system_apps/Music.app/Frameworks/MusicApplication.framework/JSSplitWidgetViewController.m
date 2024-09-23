@implementation JSSplitWidgetViewController

- (_TtC16MusicApplication27JSSplitWidgetViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s16MusicApplication27JSSplitWidgetViewControllerC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)viewDidLoad
{
  _TtC16MusicApplication27JSSplitWidgetViewController *v2;

  v2 = self;
  JSSplitWidgetViewController.viewDidLoad()();

}

- (void)viewDidLayoutSubviews
{
  _TtC16MusicApplication27JSSplitWidgetViewController *v2;

  v2 = self;
  JSSplitWidgetViewController.viewDidLayoutSubviews()();

}

- (void)music_viewInheritedLayoutInsetsDidChange
{
  id v2;
  id v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = v5.receiver;
  -[JSSplitWidgetViewController music_viewInheritedLayoutInsetsDidChange](&v5, "music_viewInheritedLayoutInsetsDidChange");
  sub_20CA68();
  v3 = objc_msgSend(v2, "view", v5.receiver, v5.super_class);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "setNeedsLayout");

  }
  else
  {
    __break(1u);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication27JSSplitWidgetViewController *v6;
  _TtC16MusicApplication27JSSplitWidgetViewController *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  JSSplitWidgetViewController.traitCollectionDidChange(_:)(v8);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC16MusicApplication27JSSplitWidgetViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  JSSplitWidgetViewController.viewWillTransition(to:with:)(a4, width, height);
  swift_unknownObjectRelease(a4);

}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  objc_super v4;
  CGSize result;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  -[JSSplitWidgetViewController preferredContentSize](&v4, "preferredContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height;
  double width;
  objc_class *ObjectType;
  _TtC16MusicApplication27JSSplitWidgetViewController *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  objc_super v13;

  height = a3.height;
  width = a3.width;
  ObjectType = (objc_class *)swift_getObjectType();
  v13.receiver = self;
  v13.super_class = ObjectType;
  v7 = self;
  -[JSSplitWidgetViewController preferredContentSize](&v13, "preferredContentSize");
  v9 = v8;
  v11 = v10;
  v12.receiver = v7;
  v12.super_class = ObjectType;
  -[JSSplitWidgetViewController setPreferredContentSize:](&v12, "setPreferredContentSize:", width, height);
  sub_20DD3C(v9, v11);

}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[JSSplitWidgetViewController viewWillAppear:](&v5, "viewWillAppear:", v3);
  sub_20DF98(v3);

}

- (void)viewDidAppear:(BOOL)a3
{
  sub_20E26C(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidAppear_, 129);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[JSSplitWidgetViewController viewWillDisappear:](&v5, "viewWillDisappear:", v3);
  sub_20DF98(v3 | 0x40);

}

- (void)viewDidDisappear:(BOOL)a3
{
  sub_20E26C(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidDisappear_, 128);
}

- (_TtC16MusicApplication27JSSplitWidgetViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MusicApplication27JSSplitWidgetViewController *result;

  v4 = a4;
  result = (_TtC16MusicApplication27JSSplitWidgetViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.JSSplitWidgetViewController", 44, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27JSSplitWidgetViewController_splitWidgetViewModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27JSSplitWidgetViewController____lazy_storage___containerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27JSSplitWidgetViewController_leftContentViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27JSSplitWidgetViewController_rightContentViewController));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication27JSSplitWidgetViewController_contentSizeObserverMap));
}

@end
