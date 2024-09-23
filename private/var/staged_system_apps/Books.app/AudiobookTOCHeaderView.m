@implementation AudiobookTOCHeaderView

- (_TtC5Books22AudiobookTOCHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC5Books22AudiobookTOCHeaderView *)sub_1003C67F4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5Books22AudiobookTOCHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1003C9168();
}

- (void)layoutSubviews
{
  _TtC5Books22AudiobookTOCHeaderView *v2;

  v2 = self;
  sub_1003C7E50();

}

- (void)_traitCollectionDidChangeWithSender:(id)a3 previousTraitCollection:(id)a4
{
  id v7;
  _TtC5Books22AudiobookTOCHeaderView *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];

  swift_unknownObjectRetain(a3);
  v7 = a4;
  v8 = self;
  _bridgeAnyObjectToAny(_:)(a3);
  swift_unknownObjectRelease(a3);
  v9 = *(Class *)((char *)&v8->super.super.super.isa + OBJC_IVAR____TtC5Books22AudiobookTOCHeaderView_titleLabel);
  if (qword_1009CE2C8 != -1)
    swift_once(&qword_1009CE2C8, sub_1003C5A1C);
  objc_msgSend(v9, "setFont:", qword_1009DFA90);
  v10 = *(Class *)((char *)&v8->super.super.super.isa + OBJC_IVAR____TtC5Books22AudiobookTOCHeaderView_authorLabel);
  if (qword_1009CE2D0 != -1)
    swift_once(&qword_1009CE2D0, sub_1003C5A30);
  objc_msgSend(v10, "setFont:", qword_1009DFA98);

  _s5Books15CurrentPageViewVwxx_0(v11);
}

- (void)didDismiss
{
  uint64_t Strong;
  void *v4;
  _TtC5Books22AudiobookTOCHeaderView *v5;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC5Books22AudiobookTOCHeaderView_delegate);
  if (Strong)
  {
    v4 = (void *)Strong;
    v5 = self;
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

    swift_unknownObjectRelease(v4);
  }
}

- (void)didSelectSupplementalContent
{
  _TtC5Books22AudiobookTOCHeaderView *v2;

  v2 = self;
  sub_1003C83BC();

}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (NSArray)accessibilityElements
{
  _TtC5Books22AudiobookTOCHeaderView *v2;
  uint64_t v3;
  uint64_t v4;
  NSArray v5;

  v2 = self;
  sub_1003C8A10();
  v4 = v3;

  if (v4)
  {
    v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5.super.isa = 0;
  }
  return (NSArray *)v5.super.isa;
}

- (void).cxx_destruct
{
  sub_1001FE9A0((uint64_t)self + OBJC_IVAR____TtC5Books22AudiobookTOCHeaderView_delegate);

  swift_bridgeObjectRelease(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC5Books22AudiobookTOCHeaderView_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC5Books22AudiobookTOCHeaderView_author]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC5Books22AudiobookTOCHeaderView_timeRemaining]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books22AudiobookTOCHeaderView____lazy_storage___effectView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books22AudiobookTOCHeaderView_titleGradientLayer));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books22AudiobookTOCHeaderView_authorGradientLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books22AudiobookTOCHeaderView_timeRemainingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books22AudiobookTOCHeaderView_coverImageView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books22AudiobookTOCHeaderView_dismissButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books22AudiobookTOCHeaderView_supplementalContentButton));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC5Books22AudiobookTOCHeaderView_supplementaryContentHiddenConstraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC5Books22AudiobookTOCHeaderView_supplementaryContentVisibleConstraints));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books22AudiobookTOCHeaderView_cachedGroupedLabelsAXElement));
}

@end
