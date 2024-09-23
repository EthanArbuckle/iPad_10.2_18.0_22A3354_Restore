@implementation UnifiedMessages.InlineBubbleTip

- (_TtCE16MusicApplicationO9MusicCore15UnifiedMessages15InlineBubbleTip)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtCE16MusicApplicationO9MusicCore15UnifiedMessages15InlineBubbleTip *result;

  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtCE16MusicApplicationO9MusicCore15UnifiedMessages15InlineBubbleTip_handleUserDismissed);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtCE16MusicApplicationO9MusicCore15UnifiedMessages15InlineBubbleTip *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0x100000000000002ALL, 0x80000000011023D0, "MusicApplication/UnifiedMessagesInlineBubbleTip.swift", 53, 2, 28, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtCE16MusicApplicationO9MusicCore15UnifiedMessages15InlineBubbleTip *v2;

  v2 = self;
  sub_B99984();

}

- (void)viewDidLayoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[UnifiedMessages.InlineBubbleTip viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  sub_B99B24();

}

- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4
{
  id v6;
  id v7;
  _TtCE16MusicApplicationO9MusicCore15UnifiedMessages15InlineBubbleTip *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_B9A2B8(v7);

}

- (void)messageViewController:(id)a3 didFailWithError:(id)a4
{
  id v6;
  _TtCE16MusicApplicationO9MusicCore15UnifiedMessages15InlineBubbleTip *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_B9AA10((uint64_t)a4);

}

- (_TtCE16MusicApplicationO9MusicCore15UnifiedMessages15InlineBubbleTip)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtCE16MusicApplicationO9MusicCore15UnifiedMessages15InlineBubbleTip *result;

  v4 = a4;
  result = (_TtCE16MusicApplicationO9MusicCore15UnifiedMessages15InlineBubbleTip *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.InlineBubbleTip", 32, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCE16MusicApplicationO9MusicCore15UnifiedMessages15InlineBubbleTip_inlineBubbleTipViewController));
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtCE16MusicApplicationO9MusicCore15UnifiedMessages15InlineBubbleTip_handleUserDismissed), *(_QWORD *)&self->inlineBubbleTipViewController[OBJC_IVAR____TtCE16MusicApplicationO9MusicCore15UnifiedMessages15InlineBubbleTip_handleUserDismissed]);
}

@end
