@implementation TTRIVibrantTemplateImageView

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView_imageView), "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView)initWithCoder:(id)a3
{
  return (_TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView *)sub_100014E1C(a3);
}

- (_TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView)initWithEffect:(id)a3
{
  id v3;
  _TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView *result;

  v3 = a3;
  result = (_TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView *)_swift_stdlib_reportUnimplementedInitializer("RemindersIntentsUIExtension.TTRIVibrantTemplateImageView", 56, "init(effect:)", 13, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView_image));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC27RemindersIntentsUIExtension28TTRIVibrantTemplateImageView_imageView));
}

@end
