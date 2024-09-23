@implementation CRLiOSFeatureHintController

- (_TtC8Freeform27CRLiOSFeatureHintController)initWithCoder:(id)a3
{
  id v4;
  _TtC8Freeform27CRLiOSFeatureHintController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform27CRLiOSFeatureHintController_kVerticalMargin) = (Class)0x4028000000000000;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform27CRLiOSFeatureHintController_kLeadingMargin) = (Class)0x4030000000000000;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform27CRLiOSFeatureHintController_kTrailingMargin) = (Class)0x4028000000000000;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform27CRLiOSFeatureHintController_kTextToButtonSpacing) = (Class)0x4028000000000000;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform27CRLiOSFeatureHintController_kCloseButtonHitRegionWidth) = (Class)0x4046000000000000;
  v4 = a3;

  result = (_TtC8Freeform27CRLiOSFeatureHintController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100FAD6F0, "Freeform/CRLiOSFeatureHintController.swift", 42, 2, 30, 0);
  __break(1u);
  return result;
}

- (void)loadView
{
  _TtC8Freeform27CRLiOSFeatureHintController *v2;

  v2 = self;
  sub_1008F4F94();

}

- (void)viewDidLoad
{
  _TtC8Freeform27CRLiOSFeatureHintController *v2;

  v2 = self;
  sub_1008F5190();

}

- (void)updatePreferredContentSize
{
  _TtC8Freeform27CRLiOSFeatureHintController *v2;

  v2 = self;
  sub_1008F56D4();

}

- (void)triggerClose
{
  -[CRLiOSFeatureHintController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (_TtC8Freeform27CRLiOSFeatureHintController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8Freeform27CRLiOSFeatureHintController *result;

  v4 = a4;
  result = (_TtC8Freeform27CRLiOSFeatureHintController *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLiOSFeatureHintController", 36, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform27CRLiOSFeatureHintController_textHolder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform27CRLiOSFeatureHintController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform27CRLiOSFeatureHintController_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform27CRLiOSFeatureHintController_closeButton));
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

@end
