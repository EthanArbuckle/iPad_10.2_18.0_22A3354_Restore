@implementation VerticalStackViewController

- (_TtC16MusicApplication27VerticalStackViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_AFA6D4();
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  unsigned __int8 v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for VerticalStackViewController();
  v4 = v6.receiver;
  -[VerticalStackViewController viewWillAppear:](&v6, "viewWillAppear:", v3);
  v5 = v4[OBJC_IVAR____TtC16MusicApplication27VerticalStackViewController_appearanceState];
  v4[OBJC_IVAR____TtC16MusicApplication27VerticalStackViewController_appearanceState] = v3;
  sub_AF4FBC(v5);
  sub_AF2B60();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  _QWORD *v4;
  unsigned __int8 v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for VerticalStackViewController();
  v4 = v6.receiver;
  -[VerticalStackViewController viewDidAppear:](&v6, "viewDidAppear:", v3);
  v5 = *((_BYTE *)v4 + OBJC_IVAR____TtC16MusicApplication27VerticalStackViewController_appearanceState);
  *((_BYTE *)v4 + OBJC_IVAR____TtC16MusicApplication27VerticalStackViewController_appearanceState) = -127;
  sub_AF4FBC(v5);
  (*(void (**)(uint64_t))&stru_158.segname[(swift_isaMask & *v4) + 8])(1);
  sub_AF2E04();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  unsigned __int8 v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for VerticalStackViewController();
  v4 = v6.receiver;
  -[VerticalStackViewController viewWillDisappear:](&v6, "viewWillDisappear:", v3);
  v5 = v4[OBJC_IVAR____TtC16MusicApplication27VerticalStackViewController_appearanceState];
  v4[OBJC_IVAR____TtC16MusicApplication27VerticalStackViewController_appearanceState] = v3 | 0x40;
  sub_AF4FBC(v5);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC16MusicApplication27VerticalStackViewController *v4;

  v4 = self;
  sub_AF4E14(a3);

}

- (id)contentScrollView
{
  _TtC16MusicApplication27VerticalStackViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_AEFB4C();

  return v3;
}

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  _TtC16MusicApplication27VerticalStackViewController *v3;
  id v4;

  v3 = self;
  v4 = sub_AEFB4C();

  return v4;
}

- (CGRect)scrollViewVisibleBounds
{
  _TtC16MusicApplication27VerticalStackViewController *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  v2 = self;
  v3 = sub_AEFB4C();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)viewDidLoad
{
  _TtC16MusicApplication27VerticalStackViewController *v2;

  v2 = self;
  sub_AF5C9C();

}

- (void)viewDidLayoutSubviews
{
  _TtC16MusicApplication27VerticalStackViewController *v2;

  v2 = self;
  sub_AF6088();

}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _TtC16MusicApplication27VerticalStackViewController *v6;

  v6 = self;
  sub_AF6188(a3, a4);

}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  _TtC16MusicApplication27VerticalStackViewController *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_AF651C((uint64_t)a3);
  swift_unknownObjectRelease(a3);

}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double height;
  double width;
  _TtC16MusicApplication27VerticalStackViewController *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a4.height;
  width = a4.width;
  objc_opt_self(UIViewController);
  if (swift_dynamicCastObjCClass(a3))
  {
    swift_unknownObjectRetain_n(a3, 2);
    v8 = self;
    v9 = sub_AEF9F0();
    width = sub_AF7300(0.0, 0.0, width, height, (uint64_t)v9, 0x10000);
    height = v10;

    swift_unknownObjectRelease_n(a3, 2);
  }
  v11 = width;
  v12 = height;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC16MusicApplication27VerticalStackViewController *v5;

  v4 = a3;
  v5 = self;
  sub_AFA58C();

}

- (void)scrollViewDidChangeAdjustedContentInset:(id)a3
{
  id v4;
  _TtC16MusicApplication27VerticalStackViewController *v5;

  v4 = a3;
  v5 = self;
  sub_AFA634();

}

- (_TtC16MusicApplication27VerticalStackViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MusicApplication27VerticalStackViewController *result;

  v4 = a4;
  result = (_TtC16MusicApplication27VerticalStackViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.VerticalStackViewController", 44, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_64880((uint64_t)self + OBJC_IVAR____TtC16MusicApplication27VerticalStackViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27VerticalStackViewController____lazy_storage___scrollView));
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

@end
