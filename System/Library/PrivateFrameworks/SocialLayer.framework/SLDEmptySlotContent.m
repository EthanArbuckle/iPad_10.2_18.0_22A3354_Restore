@implementation SLDEmptySlotContent

- (SLDEmptySlotContent)initWithStyle:(id)a3 forRemote:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  SLDEmptySlotContent *v8;
  SLDEmptySlotContent *v9;
  objc_super v11;

  v4 = a4;
  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SLDEmptySlotContent;
  v8 = -[SLDEmptySlotContent init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_style, a3);
    -[SLDEmptySlotContent setIsRemote:](v9, "setIsRemote:", v4);
  }

  return v9;
}

- (unsigned)contentScale
{
  return 1;
}

- (BOOL)shouldReplaceExistingContent
{
  return 0;
}

- (id)image
{
  return 0;
}

- (UISSlotStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
  objc_storeStrong((id *)&self->_style, a3);
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (BOOL)isRemote
{
  return self->_isRemote;
}

- (void)setIsRemote:(BOOL)a3
{
  self->_isRemote = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
}

@end
