@implementation TTRILearnMoreCSLViewController

- (_TtC9Reminders30TTRILearnMoreCSLViewController)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  return (_TtC9Reminders30TTRILearnMoreCSLViewController *)sub_100233CE0(v3, v4);
}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
  v2 = v3.receiver;
  -[TTRILearnMoreCSLViewController viewDidLoad](&v3, "viewDidLoad");
  sub_100233F24();

}

- (UIStackView)smartListStackView
{
  return (UIStackView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC9Reminders30TTRILearnMoreCSLViewController_smartListStackView);
}

- (void)setSmartListStackView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC9Reminders30TTRILearnMoreCSLViewController_smartListStackView, a3);
}

- (UITextView)whySmartListsTextView
{
  return (UITextView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC9Reminders30TTRILearnMoreCSLViewController_whySmartListsTextView);
}

- (void)setWhySmartListsTextView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC9Reminders30TTRILearnMoreCSLViewController_whySmartListsTextView, a3);
}

- (UITextView)whySmartListsExampleBodyTextView
{
  return (UITextView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC9Reminders30TTRILearnMoreCSLViewController_whySmartListsExampleBodyTextView);
}

- (void)setWhySmartListsExampleBodyTextView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC9Reminders30TTRILearnMoreCSLViewController_whySmartListsExampleBodyTextView, a3);
}

- (UITextView)makeSmartListBodyTextView
{
  return (UITextView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC9Reminders30TTRILearnMoreCSLViewController_makeSmartListBodyTextView);
}

- (void)setMakeSmartListBodyTextView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC9Reminders30TTRILearnMoreCSLViewController_makeSmartListBodyTextView, a3);
}

- (UITextView)filteringTagsTextView
{
  return (UITextView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC9Reminders30TTRILearnMoreCSLViewController_filteringTagsTextView);
}

- (void)setFilteringTagsTextView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC9Reminders30TTRILearnMoreCSLViewController_filteringTagsTextView, a3);
}

- (UITextView)filteringTagsExampleBodyTextView
{
  return (UITextView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC9Reminders30TTRILearnMoreCSLViewController_filteringTagsExampleBodyTextView);
}

- (void)setFilteringTagsExampleBodyTextView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC9Reminders30TTRILearnMoreCSLViewController_filteringTagsExampleBodyTextView, a3);
}

- (UITextView)addRemindersTextView
{
  return (UITextView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC9Reminders30TTRILearnMoreCSLViewController_addRemindersTextView);
}

- (void)setAddRemindersTextView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC9Reminders30TTRILearnMoreCSLViewController_addRemindersTextView, a3);
}

- (UITextView)howToSmartListBodyTextView
{
  return (UITextView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC9Reminders30TTRILearnMoreCSLViewController_howToSmartListBodyTextView);
}

- (void)setHowToSmartListBodyTextView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC9Reminders30TTRILearnMoreCSLViewController_howToSmartListBodyTextView, a3);
}

- (UIImageView)filterImageView
{
  return (UIImageView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC9Reminders30TTRILearnMoreCSLViewController_filterImageView);
}

- (void)setFilterImageView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC9Reminders30TTRILearnMoreCSLViewController_filterImageView, a3);
}

- (void)didTapDoneButton:(id)a3
{
  _TtC9Reminders30TTRILearnMoreCSLViewController *v5;
  _TtC9Reminders30TTRILearnMoreCSLViewController *v6;
  _OWORD v7[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v7);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v7, 0, sizeof(v7));
    v6 = self;
  }
  sub_1000DE728();

  sub_10002CAA0((uint64_t)v7);
}

- (_TtC9Reminders30TTRILearnMoreCSLViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9Reminders30TTRILearnMoreCSLViewController *result;

  v4 = a4;
  result = (_TtC9Reminders30TTRILearnMoreCSLViewController *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRILearnMoreCSLViewController", 40, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC9Reminders30TTRILearnMoreCSLViewController_smartListStackView);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC9Reminders30TTRILearnMoreCSLViewController_whySmartListsTextView);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC9Reminders30TTRILearnMoreCSLViewController_whySmartListsExampleBodyTextView);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC9Reminders30TTRILearnMoreCSLViewController_makeSmartListBodyTextView);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC9Reminders30TTRILearnMoreCSLViewController_filteringTagsTextView);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC9Reminders30TTRILearnMoreCSLViewController_filteringTagsExampleBodyTextView);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC9Reminders30TTRILearnMoreCSLViewController_addRemindersTextView);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC9Reminders30TTRILearnMoreCSLViewController_howToSmartListBodyTextView);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC9Reminders30TTRILearnMoreCSLViewController_filterImageView);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC9Reminders30TTRILearnMoreCSLViewController_presenter));
  v3 = *(_QWORD *)&self->filteringTagsExampleBodyTextView[OBJC_IVAR____TtC9Reminders30TTRILearnMoreCSLViewController_cslHelpAnchor];
  v4 = *(_QWORD *)&self->addRemindersTextView[OBJC_IVAR____TtC9Reminders30TTRILearnMoreCSLViewController_cslHelpAnchor];
  v5 = *(_QWORD *)&self->howToSmartListBodyTextView[OBJC_IVAR____TtC9Reminders30TTRILearnMoreCSLViewController_cslHelpAnchor];
  v6 = *(_QWORD *)&self->filterImageView[OBJC_IVAR____TtC9Reminders30TTRILearnMoreCSLViewController_cslHelpAnchor];
  sub_1001CCDC0(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC9Reminders30TTRILearnMoreCSLViewController_cslHelpAnchor), *(_QWORD *)&self->smartListStackView[OBJC_IVAR____TtC9Reminders30TTRILearnMoreCSLViewController_cslHelpAnchor], *(_QWORD *)&self->whySmartListsTextView[OBJC_IVAR____TtC9Reminders30TTRILearnMoreCSLViewController_cslHelpAnchor], *(_QWORD *)&self->whySmartListsExampleBodyTextView[OBJC_IVAR____TtC9Reminders30TTRILearnMoreCSLViewController_cslHelpAnchor], *(_QWORD *)&self->makeSmartListBodyTextView[OBJC_IVAR____TtC9Reminders30TTRILearnMoreCSLViewController_cslHelpAnchor], *(_QWORD *)&self->filteringTagsTextView[OBJC_IVAR____TtC9Reminders30TTRILearnMoreCSLViewController_cslHelpAnchor]);
  sub_100179CA0(v3, v4, v5, v6);
  swift_bridgeObjectRelease(*(_QWORD *)&self->smartListStackView[OBJC_IVAR____TtC9Reminders30TTRILearnMoreCSLViewController_learnMoreEllipsisPlaceholder]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->smartListStackView[OBJC_IVAR____TtC9Reminders30TTRILearnMoreCSLViewController_howToPlaceholder]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->smartListStackView[OBJC_IVAR____TtC9Reminders30TTRILearnMoreCSLViewController_learnMoreTagsPlaceholder]);
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC9Reminders30TTRILearnMoreCSLViewController *v13;
  uint64_t v15;

  v8 = type metadata accessor for URL(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = a3;
  v13 = self;
  LOBYTE(self) = sub_100235088(v12);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return self & 1;
}

@end
