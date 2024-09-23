@implementation UGCPhotoThumbnailBadgeView

- (_TtC4Maps26UGCPhotoThumbnailBadgeView)initWithFrame:(CGRect)a3
{
  return (_TtC4Maps26UGCPhotoThumbnailBadgeView *)sub_10020F248(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC4Maps26UGCPhotoThumbnailBadgeView)initWithCoder:(id)a3
{
  id v4;
  _TtC4Maps26UGCPhotoThumbnailBadgeView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Maps26UGCPhotoThumbnailBadgeView_attributedText) = 0;
  v4 = a3;

  result = (_TtC4Maps26UGCPhotoThumbnailBadgeView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100E41970, "Maps/UGCPhotoThumbnailBadgeView.swift", 37, 2, 26, 0);
  __break(1u);
  return result;
}

- (NSAttributedString)attributedText
{
  return (NSAttributedString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                       + OBJC_IVAR____TtC4Maps26UGCPhotoThumbnailBadgeView_attributedText));
}

- (void)setAttributedText:(id)a3
{
  uint64_t v4;
  void *v5;
  _TtC4Maps26UGCPhotoThumbnailBadgeView *v6;
  id v7;

  v4 = OBJC_IVAR____TtC4Maps26UGCPhotoThumbnailBadgeView_attributedText;
  v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Maps26UGCPhotoThumbnailBadgeView_attributedText);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC4Maps26UGCPhotoThumbnailBadgeView_attributedText) = (Class)a3;
  v7 = a3;
  v6 = self;

  objc_msgSend(*(id *)((char *)&v6->super.super.super.isa + OBJC_IVAR____TtC4Maps26UGCPhotoThumbnailBadgeView_label), "setAttributedText:", *(Class *)((char *)&self->super.super.super.isa + v4));
}

+ (UIFont)attributionFont
{
  return (UIFont *)objc_msgSend((id)objc_opt_self(UIFont), "preferredFontForTextStyle:", UIFontTextStyleCaption2);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Maps26UGCPhotoThumbnailBadgeView_attributedText));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Maps26UGCPhotoThumbnailBadgeView_labelVibrantView));

}

@end
