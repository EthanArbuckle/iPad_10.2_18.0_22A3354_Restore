@implementation UISMutableSlotStyle

- (void)setAccessibilityButtonShapes:(unint64_t)a3
{
  self->super._fields.all = self->super._fields.all & 0xFFFFFFFE | a3 & 1;
}

- (void)setAccessibilityContrast:(unint64_t)a3
{
  self->super._fields.all = self->super._fields.all & 0xFFFFFFFD | (2 * (a3 & 1));
}

- (void)setDisplayRange:(unint64_t)a3
{
  self->super._fields.all = self->super._fields.all & 0xFFFFFFF3 | (4 * (a3 & 3));
}

- (void)setDisplayScale:(unsigned __int8)a3
{
  self->super._fields.all = self->super._fields.all & 0xFFFFFF8F | (16 * (a3 & 7));
}

- (void)setLayoutDirection:(unint64_t)a3
{
  self->super._fields.all = self->super._fields.all & 0xFFFFFF7F | ((a3 & 1) << 7);
}

- (void)setLegibilityWeight:(unint64_t)a3
{
  self->super._fields.all = self->super._fields.all & 0xFFFFFEFF | ((a3 & 1) << 8);
}

- (void)setLocalization:(id)a3
{
  NSString *v4;
  NSString *localization;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  localization = self->super._localization;
  self->super._localization = v4;

}

- (void)setPreferredContentSizeCategory:(unint64_t)a3
{
  self->super._fields.all = self->super._fields.all & 0xFFFFE1FF | ((a3 & 0xF) << 9);
}

- (void)setTintColor:(CGColor *)a3
{
  CGColor *tintColor;

  tintColor = self->super._tintColor;
  self->super._tintColor = CGColorRetain(a3);
  CGColorRelease(tintColor);
}

- (void)setUserInterfaceIdiom:(unint64_t)a3
{
  self->super._fields.all = self->super._fields.all & 0xFFFF1FFF | ((a3 & 7) << 13);
}

- (void)setUserInterfaceStyle:(unint64_t)a3
{
  self->super._fields.all = self->super._fields.all & 0xFFFEFFFF | ((a3 & 1) << 16);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[UISSlotStyle initWithStyle:]([UISSlotStyle alloc], "initWithStyle:", self);
}

@end
