@implementation CMDrawableStyle

- (void)addPositionProperties:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)CMDrawableStyle;
  -[CMStyle appendPropertyForName:stringWithColons:](&v9, sel_appendPropertyForName_stringWithColons_, 0x24F3D4B58, CFSTR(":absolute;"));
  v8.receiver = self;
  v8.super_class = (Class)CMDrawableStyle;
  -[CMStyle appendPositionInfoFromRect:](&v8, sel_appendPositionInfoFromRect_, x, y, width, height);
}

- (void)addPositionUsingOffsets:(CGRect)a3
{
  double y;
  double x;
  objc_super v6;
  objc_super v7;
  objc_super v8;
  objc_super v9;

  y = a3.origin.y;
  x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)CMDrawableStyle;
  -[CMStyle appendSizeInfoFromRect:](&v9, sel_appendSizeInfoFromRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8.receiver = self;
  v8.super_class = (Class)CMDrawableStyle;
  -[CMStyle appendPropertyForName:length:unit:](&v8, sel_appendPropertyForName_length_unit_, 0x24F3D5678, 1, x);
  v7.receiver = self;
  v7.super_class = (Class)CMDrawableStyle;
  -[CMStyle appendPropertyForName:length:unit:](&v7, sel_appendPropertyForName_length_unit_, 0x24F3D5698, 1, y);
  v6.receiver = self;
  v6.super_class = (Class)CMDrawableStyle;
  -[CMStyle appendPropertyForName:stringWithColons:](&v6, sel_appendPropertyForName_stringWithColons_, 0x24F3D4B58, CFSTR(":absolute;"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mDrawable, 0);
}

@end
