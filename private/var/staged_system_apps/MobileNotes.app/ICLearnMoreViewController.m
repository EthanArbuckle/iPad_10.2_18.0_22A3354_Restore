@implementation ICLearnMoreViewController

- (UIScrollView)scrollView
{
  return (UIScrollView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR___ICLearnMoreViewController_scrollView);
}

- (void)setScrollView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR___ICLearnMoreViewController_scrollView, a3);
}

- (NSArray)headerLabels
{
  return (NSArray *)sub_1003E3300((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICLearnMoreViewController_headerLabels, &qword_1005DCF80, UILabel_ptr);
}

- (void)setHeaderLabels:(id)a3
{
  sub_1003E337C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &qword_1005DCF80, UILabel_ptr, &OBJC_IVAR___ICLearnMoreViewController_headerLabels);
}

- (NSArray)textViews
{
  return (NSArray *)sub_1003E3300((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICLearnMoreViewController_textViews, (unint64_t *)&qword_1005D07A0, UITextView_ptr);
}

- (void)setTextViews:(id)a3
{
  sub_1003E337C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (unint64_t *)&qword_1005D07A0, UITextView_ptr, &OBJC_IVAR___ICLearnMoreViewController_textViews);
}

- (void)viewDidLoad
{
  _QWORD *v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for LearnMoreViewController();
  v2 = v4.receiver;
  v3 = -[ICLearnMoreViewController viewDidLoad](&v4, "viewDidLoad");
  (*(void (**)(id))((swift_isaMask & *v2) + 0xD8))(v3);
  sub_1003E27D4();
  sub_1003E2F60();
  sub_1003E2D7C();
  sub_1003E2B8C();

}

+ (void)showHelpWithPresentingViewController:(id)a3
{
  id v4;

  swift_getObjCClassMetadata(a1);
  v4 = a3;
  sub_1003E26A0(v4);

}

- (void)didTapDoneButton:(id)a3
{
  ICLearnMoreViewController *v5;
  uint64_t v6;
  uint64_t v7;
  ICLearnMoreViewController *v8;
  __int128 v9;
  __int128 v10;

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(&v9, v6);
    swift_unknownObjectRelease(a3, v7);
  }
  else
  {
    v9 = 0u;
    v10 = 0u;
    v8 = self;
  }
  -[ICLearnMoreViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0, v9, v10);

  sub_1000160C8((uint64_t)&v9);
}

- (ICLearnMoreViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (ICLearnMoreViewController *)sub_1003E39C8(v5, v7, a4);
}

- (ICLearnMoreViewController)initWithCoder:(id)a3
{
  return (ICLearnMoreViewController *)sub_1003E3B80(a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR___ICLearnMoreViewController_scrollView);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___ICLearnMoreViewController_headerLabels));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR___ICLearnMoreViewController_textViews));

}

@end
