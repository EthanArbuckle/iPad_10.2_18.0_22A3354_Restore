@implementation StringDrawingInfo

+ (id)stringDrawingInfoWithString:(id)a3 color:(id)a4 font:(id)a5 size:(CGSize)a6
{
  double height;
  double width;
  id v10;
  id v11;
  id v12;
  StringDrawingInfo *v13;

  height = a6.height;
  width = a6.width;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc_init(StringDrawingInfo);
  -[StringDrawingInfo setString:](v13, "setString:", v12);

  -[StringDrawingInfo setColor:](v13, "setColor:", v11);
  -[StringDrawingInfo setFont:](v13, "setFont:", v10);

  -[StringDrawingInfo setSize:](v13, "setSize:", width, height);
  return v13;
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
  objc_storeStrong((id *)&self->_string, a3);
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->_font, a3);
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end
