@implementation TPSSharedTipViewController

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for TPSSharedTipViewController();
  v4 = v11.receiver;
  -[TPSTipsViewController viewWillAppear:](&v11, "viewWillAppear:", v3);
  v5 = objc_msgSend(v4, "tips", v11.receiver, v11.super_class);
  if (v5)
  {
    v6 = v5;
    v7 = sub_100031C64();
    v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v6, v7);

    if ((unint64_t)v8 >> 62)
    {
      if (v8 < 0)
        v10 = v8;
      else
        v10 = v8 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v8);
      v9 = _CocoaArrayWrapper.endIndex.getter(v10);
      swift_bridgeObjectRelease(v8);
    }
    else
    {
      v9 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease(v8);
    if (!v9)
      objc_msgSend(v4, "showInlineGenericErrorMessage");

  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  void (*v5)(char *);
  uint64_t v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TPSSharedTipViewController();
  v4 = (char *)v7.receiver;
  -[TPSTipsViewController viewDidDisappear:](&v7, "viewDidDisappear:", v3);
  v5 = *(void (**)(char *))&v4[OBJC_IVAR____TtC4Tips26TPSSharedTipViewController_onDismissed];
  if (v5)
  {
    v6 = *(_QWORD *)&v4[OBJC_IVAR____TtC4Tips26TPSSharedTipViewController_onDismissed + 8];
    swift_retain(v6);
    v5(v4);
    sub_100005500((uint64_t)v5, v6);
  }

}

- (void)doneTapped:(id)a3
{
  _TtC4Tips26TPSSharedTipViewController *v5;
  uint64_t v6;
  uint64_t v7;
  _TtC4Tips26TPSSharedTipViewController *v8;
  __int128 v9;
  __int128 v10;

  if (a3)
  {
    v5 = self;
    v7 = swift_unknownObjectRetain(a3, v6);
    _bridgeAnyObjectToAny(_:)(&v9, v7);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    v9 = 0u;
    v10 = 0u;
    v8 = self;
  }
  -[TPSSharedTipViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0, v9, v10);

  sub_100033D80((uint64_t)&v9);
}

- (_TtC4Tips26TPSSharedTipViewController)initWithAppController:(id)a3
{
  return (_TtC4Tips26TPSSharedTipViewController *)sub_100035040((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithAppController_);
}

- (_TtC4Tips26TPSSharedTipViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  NSString v10;
  _QWORD *v11;
  id v12;
  _TtC4Tips26TPSSharedTipViewController *v13;
  objc_super v15;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    v8 = (Class *)((char *)&self->super.super.super.super.super.super.isa
                 + OBJC_IVAR____TtC4Tips26TPSSharedTipViewController_onDismissed);
    *v8 = 0;
    v8[1] = 0;
    v9 = a4;
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v11 = (Class *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC4Tips26TPSSharedTipViewController_onDismissed);
    *v11 = 0;
    v11[1] = 0;
    v12 = a4;
    v10 = 0;
  }
  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for TPSSharedTipViewController();
  v13 = -[TPSViewController initWithNibName:bundle:](&v15, "initWithNibName:bundle:", v10, a4);

  return v13;
}

- (_TtC4Tips26TPSSharedTipViewController)initWithCoder:(id)a3
{
  return (_TtC4Tips26TPSSharedTipViewController *)sub_100035040((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (void).cxx_destruct
{
  sub_100005500(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC4Tips26TPSSharedTipViewController_onDismissed), *(uint64_t *)((char *)&self->super.super.super._messageLabelTitle+ OBJC_IVAR____TtC4Tips26TPSSharedTipViewController_onDismissed));
}

@end
