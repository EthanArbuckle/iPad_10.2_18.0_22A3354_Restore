@implementation TTRIRemindersListImageAttachmentsHiddenByAlphaImageView

- (BOOL)isHidden
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[TTRIRemindersListImageAttachmentsHiddenByAlphaImageView isHidden](&v3, sel_isHidden);
}

- (void)setHidden:(BOOL)a3
{
  double v3;

  v3 = 1.0;
  if (a3)
    v3 = 0.0;
  -[TTRIRemindersListImageAttachmentsHiddenByAlphaImageView setAlpha:](self, sel_setAlpha_, v3);
}

- (_TtC15RemindersUICore55TTRIRemindersListImageAttachmentsHiddenByAlphaImageView)initWithImage:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[TTRIRemindersListImageAttachmentsHiddenByAlphaImageView initWithImage:](&v5, sel_initWithImage_, a3);
}

- (_TtC15RemindersUICore55TTRIRemindersListImageAttachmentsHiddenByAlphaImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return -[TTRIRemindersListImageAttachmentsHiddenByAlphaImageView initWithImage:highlightedImage:](&v7, sel_initWithImage_highlightedImage_, a3, a4);
}

@end
