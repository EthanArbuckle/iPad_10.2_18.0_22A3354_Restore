@implementation PUIFontPickerItem

- (PUIFontPickerItem)initWithFont:(id)a3 systemItem:(BOOL)a4
{
  id v7;
  PUIFontPickerItem *v8;
  PUIFontPickerItem *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUIFontPickerItem;
  v8 = -[PUIFontPickerItem init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_font, a3);
    v9->_systemItem = a4;
  }

  return v9;
}

- (PUIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->_font, a3);
}

- (BOOL)isSystemItem
{
  return self->_systemItem;
}

- (void)setSystemItem:(BOOL)a3
{
  self->_systemItem = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);
}

@end
