@implementation TTRILearnMoreTagsViewController

- (_TtC9Reminders31TTRILearnMoreTagsViewController)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  return (_TtC9Reminders31TTRILearnMoreTagsViewController *)sub_100059960(v3, v4);
}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
  v2 = v3.receiver;
  -[TTRILearnMoreTagsViewController viewDidLoad](&v3, "viewDidLoad");
  sub_100059B70();

}

- (UIScrollView)tagsView
{
  return (UIScrollView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC9Reminders31TTRILearnMoreTagsViewController_tagsView);
}

- (void)setTagsView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC9Reminders31TTRILearnMoreTagsViewController_tagsView, a3);
}

- (UIStackView)tagsStackView
{
  return (UIStackView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC9Reminders31TTRILearnMoreTagsViewController_tagsStackView);
}

- (void)setTagsStackView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC9Reminders31TTRILearnMoreTagsViewController_tagsStackView, a3);
}

- (UITextView)whyTagsExampleBodyTextView
{
  return (UITextView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC9Reminders31TTRILearnMoreTagsViewController_whyTagsExampleBodyTextView);
}

- (void)setWhyTagsExampleBodyTextView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC9Reminders31TTRILearnMoreTagsViewController_whyTagsExampleBodyTextView, a3);
}

- (UITextView)usingTagsAndListsTogetherBodyTextView
{
  return (UITextView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC9Reminders31TTRILearnMoreTagsViewController_usingTagsAndListsTogetherBodyTextView);
}

- (void)setUsingTagsAndListsTogetherBodyTextView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC9Reminders31TTRILearnMoreTagsViewController_usingTagsAndListsTogetherBodyTextView, a3);
}

- (UITextView)smartListsBodyTextView
{
  return (UITextView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC9Reminders31TTRILearnMoreTagsViewController_smartListsBodyTextView);
}

- (void)setSmartListsBodyTextView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC9Reminders31TTRILearnMoreTagsViewController_smartListsBodyTextView, a3);
}

- (UITextView)tagsSummaryTextView
{
  return (UITextView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC9Reminders31TTRILearnMoreTagsViewController_tagsSummaryTextView);
}

- (void)setTagsSummaryTextView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC9Reminders31TTRILearnMoreTagsViewController_tagsSummaryTextView, a3);
}

- (UITextView)tagsCreatingTextView
{
  return (UITextView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC9Reminders31TTRILearnMoreTagsViewController_tagsCreatingTextView);
}

- (void)setTagsCreatingTextView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC9Reminders31TTRILearnMoreTagsViewController_tagsCreatingTextView, a3);
}

- (UITextView)tagsAddingTextView
{
  return (UITextView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC9Reminders31TTRILearnMoreTagsViewController_tagsAddingTextView);
}

- (void)setTagsAddingTextView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC9Reminders31TTRILearnMoreTagsViewController_tagsAddingTextView, a3);
}

- (UITextView)tagsBrowserTextView
{
  return (UITextView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC9Reminders31TTRILearnMoreTagsViewController_tagsBrowserTextView);
}

- (void)setTagsBrowserTextView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC9Reminders31TTRILearnMoreTagsViewController_tagsBrowserTextView, a3);
}

- (UITextView)tagsTapTextView
{
  return (UITextView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC9Reminders31TTRILearnMoreTagsViewController_tagsTapTextView);
}

- (void)setTagsTapTextView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC9Reminders31TTRILearnMoreTagsViewController_tagsTapTextView, a3);
}

- (void)didTapDoneButton:(id)a3
{
  _TtC9Reminders31TTRILearnMoreTagsViewController *v5;
  _TtC9Reminders31TTRILearnMoreTagsViewController *v6;
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

- (_TtC9Reminders31TTRILearnMoreTagsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9Reminders31TTRILearnMoreTagsViewController *result;

  v4 = a4;
  result = (_TtC9Reminders31TTRILearnMoreTagsViewController *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRILearnMoreTagsViewController", 41, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC9Reminders31TTRILearnMoreTagsViewController_tagsView);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC9Reminders31TTRILearnMoreTagsViewController_tagsStackView);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC9Reminders31TTRILearnMoreTagsViewController_whyTagsExampleBodyTextView);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC9Reminders31TTRILearnMoreTagsViewController_usingTagsAndListsTogetherBodyTextView);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC9Reminders31TTRILearnMoreTagsViewController_smartListsBodyTextView);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC9Reminders31TTRILearnMoreTagsViewController_tagsSummaryTextView);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC9Reminders31TTRILearnMoreTagsViewController_tagsCreatingTextView);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC9Reminders31TTRILearnMoreTagsViewController_tagsAddingTextView);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC9Reminders31TTRILearnMoreTagsViewController_tagsBrowserTextView);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC9Reminders31TTRILearnMoreTagsViewController_tagsTapTextView);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC9Reminders31TTRILearnMoreTagsViewController_presenter));
  swift_bridgeObjectRelease(*(_QWORD *)&self->tagsView[OBJC_IVAR____TtC9Reminders31TTRILearnMoreTagsViewController_learnMoreEllipsisPlaceholder]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->tagsView[OBJC_IVAR____TtC9Reminders31TTRILearnMoreTagsViewController_howToPlaceholder]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->tagsView[OBJC_IVAR____TtC9Reminders31TTRILearnMoreTagsViewController_learnMoreTagsPlaceholder]);
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC9Reminders31TTRILearnMoreTagsViewController *v13;
  uint64_t v15;

  v8 = type metadata accessor for URL(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = a3;
  v13 = self;
  LOBYTE(self) = sub_10005AA74(v12);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return self & 1;
}

@end
