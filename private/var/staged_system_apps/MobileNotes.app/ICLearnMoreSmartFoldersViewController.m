@implementation ICLearnMoreSmartFoldersViewController

- (UITextView)whySmartFoldersExampleBodyTextView
{
  return (UITextView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR___ICLearnMoreSmartFoldersViewController_whySmartFoldersExampleBodyTextView);
}

- (void)setWhySmartFoldersExampleBodyTextView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR___ICLearnMoreSmartFoldersViewController_whySmartFoldersExampleBodyTextView, a3);
}

- (UITextView)smartFoldersExampleBodyTextView
{
  return (UITextView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR___ICLearnMoreSmartFoldersViewController_smartFoldersExampleBodyTextView);
}

- (void)setSmartFoldersExampleBodyTextView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR___ICLearnMoreSmartFoldersViewController_smartFoldersExampleBodyTextView, a3);
}

- (UITextView)makeSmartFoldersBodyTextView
{
  return (UITextView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR___ICLearnMoreSmartFoldersViewController_makeSmartFoldersBodyTextView);
}

- (void)setMakeSmartFoldersBodyTextView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR___ICLearnMoreSmartFoldersViewController_makeSmartFoldersBodyTextView, a3);
}

- (UITextView)filteringTagsSummaryBodyTextView
{
  return (UITextView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR___ICLearnMoreSmartFoldersViewController_filteringTagsSummaryBodyTextView);
}

- (void)setFilteringTagsSummaryBodyTextView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR___ICLearnMoreSmartFoldersViewController_filteringTagsSummaryBodyTextView, a3);
}

- (UITextView)filteringTagsExampleBodyTextView
{
  return (UITextView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR___ICLearnMoreSmartFoldersViewController_filteringTagsExampleBodyTextView);
}

- (void)setFilteringTagsExampleBodyTextView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR___ICLearnMoreSmartFoldersViewController_filteringTagsExampleBodyTextView, a3);
}

- (UITextView)howToSmartFoldersBodyTextView
{
  return (UITextView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR___ICLearnMoreSmartFoldersViewController_howToSmartFoldersBodyTextView);
}

- (void)setHowToSmartFoldersBodyTextView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR___ICLearnMoreSmartFoldersViewController_howToSmartFoldersBodyTextView, a3);
}

- (_TtC11MobileNotes32LearnMoreSmartFoldersFiltersView)filtersView
{
  return (_TtC11MobileNotes32LearnMoreSmartFoldersFiltersView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR___ICLearnMoreSmartFoldersViewController_filtersView);
}

- (void)setFiltersView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR___ICLearnMoreSmartFoldersViewController_filtersView, a3);
}

- (void)viewDidLayoutSubviews
{
  char *v2;
  uint64_t Strong;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self);
  v2 = (char *)v5.receiver;
  -[ICLearnMoreSmartFoldersViewController viewDidLayoutSubviews](&v5, "viewDidLayoutSubviews");
  Strong = swift_unknownObjectWeakLoadStrong(&v2[OBJC_IVAR___ICLearnMoreSmartFoldersViewController_filtersView]);
  if (Strong)
  {
    v4 = (void *)Strong;
    sub_1003DFC7C();

  }
  else
  {
    __break(1u);
  }
}

- (void)updateFiltersView
{
  ICLearnMoreSmartFoldersViewController *v3;
  id Strong;

  Strong = (id)swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR___ICLearnMoreSmartFoldersViewController_filtersView);
  if (Strong)
  {
    v3 = self;
    sub_1003DFC7C();

  }
  else
  {
    __break(1u);
  }
}

- (ICLearnMoreSmartFoldersViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (ICLearnMoreSmartFoldersViewController *)sub_100148530(v5, v7, a4);
}

- (ICLearnMoreSmartFoldersViewController)initWithCoder:(id)a3
{
  return (ICLearnMoreSmartFoldersViewController *)sub_1001486FC(a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR___ICLearnMoreSmartFoldersViewController_whySmartFoldersExampleBodyTextView);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR___ICLearnMoreSmartFoldersViewController_smartFoldersExampleBodyTextView);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR___ICLearnMoreSmartFoldersViewController_makeSmartFoldersBodyTextView);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR___ICLearnMoreSmartFoldersViewController_filteringTagsSummaryBodyTextView);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR___ICLearnMoreSmartFoldersViewController_filteringTagsExampleBodyTextView);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR___ICLearnMoreSmartFoldersViewController_howToSmartFoldersBodyTextView);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR___ICLearnMoreSmartFoldersViewController_filtersView);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.scrollView[OBJC_IVAR___ICLearnMoreSmartFoldersViewController_howToPlaceholder]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.scrollView[OBJC_IVAR___ICLearnMoreSmartFoldersViewController_learnMoreTagsPlaceholder]);
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  ICLearnMoreSmartFoldersViewController *v14;
  uint64_t v16;

  v9 = type metadata accessor for URL(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = a3;
  v14 = self;
  LOBYTE(self) = sub_100148A80(v13);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return self & 1;
}

@end
