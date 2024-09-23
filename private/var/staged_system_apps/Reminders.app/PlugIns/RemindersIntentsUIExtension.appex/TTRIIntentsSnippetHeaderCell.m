@implementation TTRIIntentsSnippetHeaderCell

- (NSLayoutConstraint)topConstraint
{
  return (NSLayoutConstraint *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                       + OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIIntentsSnippetHeaderCell_topConstraint));
}

- (void)setTopConstraint:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIIntentsSnippetHeaderCell_topConstraint);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIIntentsSnippetHeaderCell_topConstraint) = (Class)a3;
  v3 = a3;

}

- (UILabel)headingLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIIntentsSnippetHeaderCell_headingLabel));
}

- (void)setHeadingLabel:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIIntentsSnippetHeaderCell_headingLabel);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIIntentsSnippetHeaderCell_headingLabel) = (Class)a3;
  v3 = a3;

}

- (void)prepareForReuse
{
  char *v2;
  char *v3;
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self);
  v2 = (char *)v5.receiver;
  -[TTRIIntentsSnippetHeaderCell prepareForReuse](&v5, "prepareForReuse");
  v3 = &v2[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIIntentsSnippetHeaderCell_viewModel];
  v4 = *(_QWORD *)&v2[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIIntentsSnippetHeaderCell_viewModel + 8];
  *(_QWORD *)v3 = 0;
  *((_QWORD *)v3 + 1) = 0;
  swift_bridgeObjectRelease(v4);
  sub_100017920();

}

- (_TtC27RemindersIntentsUIExtension28TTRIIntentsSnippetHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC27RemindersIntentsUIExtension28TTRIIntentsSnippetHeaderCell *)sub_100017B04(a3, (uint64_t)a4, v6);
}

- (_TtC27RemindersIntentsUIExtension28TTRIIntentsSnippetHeaderCell)initWithCoder:(id)a3
{
  return (_TtC27RemindersIntentsUIExtension28TTRIIntentsSnippetHeaderCell *)sub_100017C14(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->viewModel[OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIIntentsSnippetHeaderCell_viewModel]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIIntentsSnippetHeaderCell_topConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIIntentsSnippetHeaderCell_headingLabel));
}

@end
