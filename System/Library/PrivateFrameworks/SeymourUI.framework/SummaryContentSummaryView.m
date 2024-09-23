@implementation SummaryContentSummaryView

- (_TtC9SeymourUI25SummaryContentSummaryView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI25SummaryContentSummaryView *)sub_22B305FC4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)updateConstraints
{
  _TtC9SeymourUI25SummaryContentSummaryView *v2;

  v2 = self;
  sub_22B307120();

}

- (CGSize)intrinsicContentSize
{
  _TtC9SeymourUI25SummaryContentSummaryView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = sub_22B3072F0();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)bookmarkButtonTapped
{
  sub_22B307500((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC9SeymourUI25SummaryContentSummaryView_onBookmarkTapped);
}

- (void)shareButtonTapped
{
  sub_22B307500((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC9SeymourUI25SummaryContentSummaryView_onShareButtonTapped);
}

- (_TtC9SeymourUI25SummaryContentSummaryView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B307E78();
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  id v4;
  objc_super v5;
  CGRect v6;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SummaryContentSummaryView();
  v2 = (char *)v5.receiver;
  -[SummaryContentSummaryView layoutSubviews](&v5, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC9SeymourUI25SummaryContentSummaryView_bookmarkButton];
  v4 = objc_msgSend(v3, sel_layer, v5.receiver, v5.super_class);
  objc_msgSend(v3, sel_bounds);
  objc_msgSend(v4, sel_setCornerRadius_, CGRectGetHeight(v6) * 0.5);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC9SeymourUI25SummaryContentSummaryView *v6;

  v5 = a3;
  v6 = self;
  sub_22B307780(a3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25SummaryContentSummaryView_thumbnailView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25SummaryContentSummaryView_bookmarkButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25SummaryContentSummaryView_shareButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25SummaryContentSummaryView_labels));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25SummaryContentSummaryView_layoutGuide));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25SummaryContentSummaryView_labelsBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25SummaryContentSummaryView_bookmarkButtonBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25SummaryContentSummaryView_thumbnailWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25SummaryContentSummaryView_thumbnailHeightConstraint));
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI25SummaryContentSummaryView_onBookmarkTapped));
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI25SummaryContentSummaryView_onShareButtonTapped));
}

@end
