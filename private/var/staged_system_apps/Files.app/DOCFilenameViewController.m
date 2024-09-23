@implementation DOCFilenameViewController

- (_TtC5Files15DOCFilenameView)filenameView
{
  return (_TtC5Files15DOCFilenameView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                + OBJC_IVAR____TtC5Files25DOCFilenameViewController_filenameView));
}

- (FPItem)item
{
  return (FPItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC5Files25DOCFilenameViewController_item));
}

- (_TtC5Files25DOCFilenameViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC5Files25DOCFilenameViewController *result;

  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC5Files25DOCFilenameViewController_keyboardWasOnScreenInViewWillAppear) = 2;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files25DOCFilenameViewController_dismissing) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files25DOCFilenameViewController_visibilityState) = 0;
  v4 = a3;

  result = (_TtC5Files25DOCFilenameViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010050DA60, "Files/DOCFilenameViewController.swift", 37, 2, 706, 0);
  __break(1u);
  return result;
}

- (BOOL)presentFromViewController:(id)a3 animated:(BOOL)a4
{
  id v6;
  _TtC5Files25DOCFilenameViewController *v7;

  v6 = a3;
  v7 = self;
  sub_100285448(v6, a4);

  return 1;
}

- (void)loadView
{
  void *v3;
  id v4;
  _TtC5Files25DOCFilenameViewController *v5;
  char *v6;

  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files25DOCFilenameViewController_filenameView);
  v4 = objc_allocWithZone((Class)type metadata accessor for DOCSafeAreaView());
  v5 = self;
  v6 = sub_100280B34(v3);
  -[DOCFilenameViewController setView:](v5, "setView:", v6);

}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for DOCFilenameViewController();
  -[DOCFilenameViewController viewDidLoad](&v2, "viewDidLoad");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  void *v5;
  unsigned __int8 v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for DOCFilenameViewController();
  v4 = v7.receiver;
  -[DOCFilenameViewController viewWillAppear:](&v7, "viewWillAppear:", v3);
  v5 = (void *)objc_opt_self(UIKeyboard);
  v6 = objc_msgSend(v5, "isOnScreen", v7.receiver, v7.super_class);
  v4[OBJC_IVAR____TtC5Files25DOCFilenameViewController_keyboardWasOnScreenInViewWillAppear] = v6;
  sub_100284488(v4[OBJC_IVAR____TtC5Files25DOCFilenameViewController_contentMustBeSelected]);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCFilenameViewController();
  v4 = v5.receiver;
  -[DOCFilenameViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
  v4[OBJC_IVAR____TtC5Files25DOCFilenameViewController_keyboardWasOnScreenInViewWillAppear] = 2;
  v4[OBJC_IVAR____TtC5Files25DOCFilenameViewController_dismissing] = 0;
  sub_100284D94();

}

- (void)cancelViewController
{
  _TtC5Files25DOCFilenameViewController *v2;

  v2 = self;
  sub_1002858C0();

}

- (NSArray)keyCommands
{
  void *v3;
  _TtC5Files25DOCFilenameViewController *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  Class isa;

  v3 = (void *)objc_opt_self(DOCKeyCommandController);
  v4 = self;
  v5 = objc_msgSend(v3, "dismissingKeyCommandsWithAction:", "cancelViewController");
  v6 = sub_10004F2F0(0, &qword_1006445C0, UIKeyCommand_ptr);
  v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v5, v6);

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v7);
  return (NSArray *)isa;
}

- (void)editingDidEnd:(id)a3
{
  sub_1002862AC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(__n128))sub_100285A90);
}

- (void)editingDidChange:(id)a3
{
  sub_1002862AC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(__n128))sub_100286134);
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  objc_super v8;

  v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DOCFilenameViewController();
  v6 = v8.receiver;
  v7 = a3;
  -[DOCFilenameViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v8, "viewDidMoveToWindow:shouldAppearOrDisappear:", v7, v4);
  if (v7)
  {
    sub_100286390();

  }
}

- (void)effectiveAppearanceDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DOCFilenameViewController();
  v4 = a3;
  v5 = v9.receiver;
  -[DOCFilenameViewController effectiveAppearanceDidChange:](&v9, "effectiveAppearanceDidChange:", v4);
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    v6 = objc_msgSend(v5, "viewIfLoaded", v9.receiver, v9.super_class);
    if (v6)
    {
      v7 = v6;
      v8 = objc_msgSend(v4, "backgroundColor");
      objc_msgSend(v7, "setBackgroundColor:", v8);

      v4 = v7;
      v5 = v8;
    }
  }

}

- (_TtC5Files25DOCFilenameViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC5Files25DOCFilenameViewController *result;

  v4 = a4;
  result = (_TtC5Files25DOCFilenameViewController *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCFilenameViewController", 31, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files25DOCFilenameViewController_filenameView));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC5Files25DOCFilenameViewController_transitionProxy));

}

@end
