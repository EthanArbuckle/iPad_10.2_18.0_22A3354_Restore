@implementation DOCServiceViewController

- (DOCConfiguration)configuration
{
  return (DOCConfiguration *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                     + OBJC_IVAR____TtC5Files24DOCServiceViewController_configuration));
}

- (void)setConfiguration:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files24DOCServiceViewController_configuration);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files24DOCServiceViewController_configuration) = (Class)a3;
  v3 = a3;

}

- (BOOL)isBrowserViewController
{
  return *((_BYTE *)&self->super.super.super.isa
         + OBJC_IVAR____TtC5Files24DOCServiceViewController_isBrowserViewController);
}

- (void)setIsBrowserViewController:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files24DOCServiceViewController_isBrowserViewController) = a3;
}

- (BOOL)shouldOverrideWindowAppearance
{
  return *((_BYTE *)&self->super.super.super.isa
         + OBJC_IVAR____TtC5Files24DOCServiceViewController_shouldOverrideWindowAppearance);
}

- (void)setShouldOverrideWindowAppearance:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC5Files24DOCServiceViewController_shouldOverrideWindowAppearance) = a3;
}

- (_TtC5Files24DOCServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC5Files24DOCServiceViewController *)sub_100240290(v5, v7, a4);
}

- (_TtC5Files24DOCServiceViewController)initWithCoder:(id)a3
{
  return (_TtC5Files24DOCServiceViewController *)sub_100240434(a3);
}

- (void)loadView
{
  uint64_t v3;
  id v4;
  _TtC5Files24DOCServiceViewController *v5;
  id v6;

  v3 = type metadata accessor for DOCServiceView();
  v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v3));
  v5 = self;
  v6 = objc_msgSend(v4, "init");
  -[DOCServiceViewController setView:](v5, "setView:", v6);

}

- (void)viewDidLoad
{
  id v2;
  id v3;
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCServiceViewController();
  v2 = v6.receiver;
  -[DOCServiceViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = objc_msgSend(v2, "view", v6.receiver, v6.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, "layer");

    objc_msgSend(v5, "setHitTestsAsOpaque:", 1);
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v7;
  _TtC5Files24DOCServiceViewController *v8;
  _TtC5Files24DOCServiceViewController *v9;
  _TtC5Files24DOCServiceViewController *v10;
  id v11;
  objc_super v12;

  v4 = a4;
  if (a3)
  {
    if ((*((_BYTE *)&self->super.super.super.isa
          + OBJC_IVAR____TtC5Files24DOCServiceViewController_shouldOverrideWindowAppearance) & 1) != 0)
    {
      v7 = *(uint64_t *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC5Files24DOCServiceViewController_lastAppearance);
      v8 = self;
      objc_msgSend(a3, "setAppearance:", v7);
    }
    else
    {
      v10 = self;
      v11 = a3;
    }
  }
  else
  {
    v9 = self;
  }
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for DOCServiceViewController();
  -[DOCServiceViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v12, "viewDidMoveToWindow:shouldAppearOrDisappear:", a3, v4);

}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCServiceViewController();
  swift_unknownObjectRetain(a3);
  v4 = v5.receiver;
  -[DOCServiceViewController preferredContentSizeDidChangeForChildContentContainer:](&v5, "preferredContentSizeDidChangeForChildContentContainer:", a3);
  objc_msgSend(a3, "preferredContentSize", v5.receiver, v5.super_class);
  objc_msgSend(v4, "setPreferredContentSize:");
  swift_unknownObjectRelease(a3);

}

- (UIViewController)childViewControllerForScreenEdgesDeferringSystemGestures
{
  return (UIViewController *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC5Files24DOCServiceViewController_currentViewController, a2);
}

- (void)updateAppearance:(id)a3 completionBlock:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  _TtC5Files24DOCServiceViewController *v12;
  id v13;
  _QWORD v14[5];
  uint64_t v15;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_1005D4698, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_1001F6B10;
  }
  else
  {
    v7 = 0;
  }
  v8 = swift_allocObject(&unk_1005D4648, 49, 7);
  *(_QWORD *)(v8 + 16) = self;
  *(_QWORD *)(v8 + 24) = a3;
  *(_QWORD *)(v8 + 32) = v6;
  *(_QWORD *)(v8 + 40) = v7;
  *(_BYTE *)(v8 + 48) = 0;
  v14[4] = sub_1002411F4;
  v15 = v8;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 1107296256;
  v14[2] = sub_10004A82C;
  v14[3] = &unk_1005D4660;
  v9 = _Block_copy(v14);
  v10 = v15;
  v11 = a3;
  v12 = self;
  v13 = v11;
  sub_10008BA00((uint64_t)v6, v7);
  swift_release(v10);
  DOCRunInMainThread(v9);
  _Block_release(v9);
  sub_100087534((uint64_t)v6, v7);

}

- (void)updateAppearance:(id)a3 shouldFlushCA:(BOOL)a4 completionBlock:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  _TtC5Files24DOCServiceViewController *v14;
  id v15;
  _QWORD v16[5];
  uint64_t v17;

  v8 = _Block_copy(a5);
  if (v8)
  {
    v9 = swift_allocObject(&unk_1005D45D0, 24, 7);
    *(_QWORD *)(v9 + 16) = v8;
    v8 = sub_1000E62C0;
  }
  else
  {
    v9 = 0;
  }
  v10 = swift_allocObject(&unk_1005D4580, 49, 7);
  *(_QWORD *)(v10 + 16) = self;
  *(_QWORD *)(v10 + 24) = a3;
  *(_QWORD *)(v10 + 32) = v8;
  *(_QWORD *)(v10 + 40) = v9;
  *(_BYTE *)(v10 + 48) = a4;
  v16[4] = sub_1002411F4;
  v17 = v10;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 1107296256;
  v16[2] = sub_10004A82C;
  v16[3] = &unk_1005D4598;
  v11 = _Block_copy(v16);
  v12 = v17;
  v13 = a3;
  v14 = self;
  v15 = v13;
  sub_10008BA00((uint64_t)v8, v9);
  swift_release(v12);
  DOCRunInMainThread(v11);
  _Block_release(v11);
  sub_100087534((uint64_t)v8, v9);

}

- (void)updateEditingTo:(BOOL)a3 animated:(BOOL)a4
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _TtC5Files24DOCServiceViewController *v10;
  _QWORD v11[5];
  uint64_t v12;

  v7 = swift_allocObject(&unk_1005D4530, 26, 7);
  *(_QWORD *)(v7 + 16) = self;
  *(_BYTE *)(v7 + 24) = a3;
  *(_BYTE *)(v7 + 25) = a4;
  v11[4] = sub_1002411EC;
  v12 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_10004A82C;
  v11[3] = &unk_1005D4548;
  v8 = _Block_copy(v11);
  v9 = v12;
  v10 = self;
  swift_release(v9);
  DOCRunInMainThread(v8);
  _Block_release(v8);

}

- (NSArray)preferredFocusEnvironments
{
  uint64_t Strong;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC5Files24DOCServiceViewController *v8;
  NSArray *v9;
  uint64_t v10;
  Class isa;
  uint64_t v13;
  objc_super v14;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC5Files24DOCServiceViewController_currentViewController);
  if (Strong)
  {
    v4 = Strong;
    v5 = sub_10006922C((uint64_t *)&unk_1006441A0);
    v6 = swift_allocObject(v5, 40, 7);
    *(_OWORD *)(v6 + 16) = xmmword_1004D9B40;
    *(_QWORD *)(v6 + 32) = v4;
    v13 = v6;
    specialized Array._endMutation()(v6);
    v7 = v13;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)type metadata accessor for DOCServiceViewController();
    v8 = self;
    v9 = -[DOCServiceViewController preferredFocusEnvironments](&v14, "preferredFocusEnvironments");
    v10 = sub_10006922C((uint64_t *)&unk_100648EE0);
    v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v9, v10);

  }
  sub_10006922C((uint64_t *)&unk_100648EE0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v7);
  return (NSArray *)isa;
}

- (void)embedViewController:(id)a3
{
  id v4;
  _TtC5Files24DOCServiceViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100240F38(v4);

}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC5Files24DOCServiceViewController_currentViewController);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC5Files24DOCServiceViewController_currentServiceContext);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files24DOCServiceViewController_configuration));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files24DOCServiceViewController_lastAppearance));
}

@end
