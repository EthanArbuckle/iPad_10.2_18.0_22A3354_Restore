@implementation ICLearnMoreTagsViewController

- (UITextView)whyTagsExampleBodyTextView
{
  return (UITextView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR___ICLearnMoreTagsViewController_whyTagsExampleBodyTextView);
}

- (void)setWhyTagsExampleBodyTextView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR___ICLearnMoreTagsViewController_whyTagsExampleBodyTextView, a3);
}

- (UITextView)usingTagsAndFoldersTogetherBodyTextView
{
  return (UITextView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR___ICLearnMoreTagsViewController_usingTagsAndFoldersTogetherBodyTextView);
}

- (void)setUsingTagsAndFoldersTogetherBodyTextView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR___ICLearnMoreTagsViewController_usingTagsAndFoldersTogetherBodyTextView, a3);
}

- (UITextView)addingTagsBodyTextView
{
  return (UITextView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR___ICLearnMoreTagsViewController_addingTagsBodyTextView);
}

- (void)setAddingTagsBodyTextView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR___ICLearnMoreTagsViewController_addingTagsBodyTextView, a3);
}

- (UITextView)tagBrowserBodyTextView
{
  return (UITextView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR___ICLearnMoreTagsViewController_tagBrowserBodyTextView);
}

- (void)setTagBrowserBodyTextView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR___ICLearnMoreTagsViewController_tagBrowserBodyTextView, a3);
}

- (UITextView)tagBrowser2BodyTextView
{
  return (UITextView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR___ICLearnMoreTagsViewController_tagBrowser2BodyTextView);
}

- (void)setTagBrowser2BodyTextView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR___ICLearnMoreTagsViewController_tagBrowser2BodyTextView, a3);
}

- (UITextView)smartFoldersBodyTextView
{
  return (UITextView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR___ICLearnMoreTagsViewController_smartFoldersBodyTextView);
}

- (void)setSmartFoldersBodyTextView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR___ICLearnMoreTagsViewController_smartFoldersBodyTextView, a3);
}

- (ICLearnMoreTagsViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (ICLearnMoreTagsViewController *)sub_1001D0450(v5, v7, a4);
}

- (ICLearnMoreTagsViewController)initWithCoder:(id)a3
{
  return (ICLearnMoreTagsViewController *)sub_1001D05E4(a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR___ICLearnMoreTagsViewController_whyTagsExampleBodyTextView);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR___ICLearnMoreTagsViewController_usingTagsAndFoldersTogetherBodyTextView);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR___ICLearnMoreTagsViewController_addingTagsBodyTextView);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR___ICLearnMoreTagsViewController_tagBrowserBodyTextView);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR___ICLearnMoreTagsViewController_tagBrowser2BodyTextView);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR___ICLearnMoreTagsViewController_smartFoldersBodyTextView);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.scrollView[OBJC_IVAR___ICLearnMoreTagsViewController_learnMoreEllipsisPlaceholder]);
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  ICLearnMoreTagsViewController *v14;
  uint64_t v16;

  v9 = type metadata accessor for URL(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = a3;
  v14 = self;
  LOBYTE(self) = sub_1001D08E8(v13);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return self & 1;
}

@end
