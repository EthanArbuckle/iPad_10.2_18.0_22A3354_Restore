@implementation JSVerticalStackViewController

- (_TtC16MusicApplication29JSVerticalStackViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BC9B8();
}

- (UIViewController)childViewControllerForStatusBarStyle
{
  return (UIViewController *)objc_autoreleaseReturnValue((id)(*(uint64_t (**)(void))((char *)&stru_388.offset
                                                                                  + (swift_isaMask & (uint64_t)self->super.super.super.super.isa)))());
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for JSVerticalStackViewController(0);
  v4 = v7.receiver;
  -[VerticalStackViewController viewWillAppear:](&v7, "viewWillAppear:", v3);
  sub_1B568C((char)objc_msgSend(v4, "_isInPopoverPresentation", v7.receiver, v7.super_class));
  v5 = (void *)(*(uint64_t (**)(void))((char *)&stru_388.offset + (swift_isaMask & *v4)))();
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "beginAppearanceTransition:animated:", 1, v3);

  }
  sub_1BAEEC();
  sub_1BB258();

}

- (void)viewDidAppear:(BOOL)a3
{
  sub_1B42E8(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidAppear_);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  _QWORD *v4;
  id v5;
  _QWORD *v6;
  _QWORD *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for JSVerticalStackViewController(0);
  v4 = v8.receiver;
  v5 = -[VerticalStackViewController viewWillDisappear:](&v8, "viewWillDisappear:", v3);
  v6 = (_QWORD *)(*(uint64_t (**)(id))((char *)&stru_388.offset + (swift_isaMask & *v4)))(v5);
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "beginAppearanceTransition:animated:", 0, v3, v8.receiver, v8.super_class);

    v4 = v7;
  }

}

- (void)viewDidDisappear:(BOOL)a3
{
  sub_1B42E8(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidDisappear_);
}

- (void)viewDidLayoutSubviews
{
  _TtC16MusicApplication29JSVerticalStackViewController *v2;

  v2 = self;
  sub_1B4380();

}

- (void)viewDidLoad
{
  _TtC16MusicApplication29JSVerticalStackViewController *v2;

  v2 = self;
  sub_1B472C();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for JSVerticalStackViewController(0);
  v4 = a3;
  v5 = v6.receiver;
  -[JSVerticalStackViewController traitCollectionDidChange:](&v6, "traitCollectionDidChange:", v4);
  sub_1BAEEC();

}

- (void)viewSafeAreaInsetsDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for JSVerticalStackViewController(0);
  v2 = v3.receiver;
  -[JSVerticalStackViewController viewSafeAreaInsetsDidChange](&v3, "viewSafeAreaInsetsDidChange");
  sub_1BAEEC();

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC16MusicApplication29JSVerticalStackViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1B5424(v4);

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  uint64_t v8;
  double x;
  double y;
  id v11;
  _TtC16MusicApplication29JSVerticalStackViewController *v12;
  CGFloat v13;
  CGFloat v14;
  id v15;

  v8 = (*(uint64_t (**)(__n128, __n128))((char *)&stru_388.offset
                                                 + (swift_isaMask & (uint64_t)self->super.super.super.super.isa)))((__n128)a4, *(__n128 *)&a4.y);
  if (v8)
  {
    x = a5->x;
    y = a5->y;
    v15 = (id)v8;
    v11 = a3;
    v12 = self;
    sub_7D9BE4(x, y);
    a5->x = v13;
    a5->y = v14;

  }
}

- (UIColor)viewBackgroundColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for JSVerticalStackViewController(0);
  return -[JSVerticalStackViewController viewBackgroundColor](&v3, "viewBackgroundColor");
}

- (void)setViewBackgroundColor:(id)a3
{
  objc_class *v5;
  id v6;
  _TtC16MusicApplication29JSVerticalStackViewController *v7;
  UIColor *v8;
  objc_super v9;
  objc_super v10;

  v5 = (objc_class *)type metadata accessor for JSVerticalStackViewController(0);
  v10.receiver = self;
  v10.super_class = v5;
  v6 = a3;
  v7 = self;
  v8 = -[JSVerticalStackViewController viewBackgroundColor](&v10, "viewBackgroundColor");
  v9.receiver = v7;
  v9.super_class = v5;
  -[JSVerticalStackViewController setViewBackgroundColor:](&v9, "setViewBackgroundColor:", v6);
  sub_1B68C8((uint64_t)v8);

}

- (void).cxx_destruct
{
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication29JSVerticalStackViewController_customJSPageDetailsProvider), *(_QWORD *)&self->super.delegate[OBJC_IVAR____TtC16MusicApplication29JSVerticalStackViewController_customJSPageDetailsProvider]);
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication29JSVerticalStackViewController____lazy_storage___impressionsTracker));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29JSVerticalStackViewController_pageHeaderContentViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29JSVerticalStackViewController_inlineBubbleTipViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29JSVerticalStackViewController_promotionalParallaxViewController));
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication29JSVerticalStackViewController_metricsPageProperties, &qword_14B1FF0);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29JSVerticalStackViewController_bottomStackItemBackgroundColor));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication29JSVerticalStackViewController_childViewModelKinds));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication29JSVerticalStackViewController_childViewModelKindsStackItemPreparationCompletionHandlers));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication29JSVerticalStackViewController_pendingStackItemUpdateRequests));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29JSVerticalStackViewController_headerItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29JSVerticalStackViewController_inlineBubbleTipRequest));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication29JSVerticalStackViewController_inlineBubbleTipSubscription));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication29JSVerticalStackViewController_viewModelKindToViewController));
}

@end
