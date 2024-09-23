@implementation _TUIElementNavigationBarItemBuilder

- (void)addAttributedString:(id)a3 forRole:(id)a4
{
  id v6;
  void *v7;
  objc_class *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = v6;
  if (v6 && !objc_msgSend(v6, "isEqualToString:", CFSTR("title")))
  {
    if (!objc_msgSend(v7, "isEqualToString:", CFSTR("placeholder")))
      goto LABEL_5;
    v8 = (objc_class *)objc_msgSend(v11, "copy");
    v9 = 80;
  }
  else
  {
    v8 = (objc_class *)objc_msgSend(v11, "copy");
    v9 = 64;
  }
  v10 = *(Class *)((char *)&self->super.super.super.isa + v9);
  *(Class *)((char *)&self->super.super.super.isa + v9) = v8;

LABEL_5:
}

- (void)addImageModel:(id)a3 forRole:(id)a4
{
  id v6;
  void *v7;
  UIImage *v8;
  UIImage *image;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = v6;
  if (!v6 || objc_msgSend(v6, "isEqualToString:", CFSTR("image")))
  {
    v8 = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "image"));
    image = self->_image;
    self->_image = v8;

  }
}

- (void)addMenuContainer:(id)a3
{
  objc_storeStrong((id *)&self->_menuContainer, a3);
}

- (NSArray)hostingIdentifiers
{
  return self->_hostingIdentifiers;
}

- (void)setHostingIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_hostingIdentifiers, a3);
}

- (NSArray)hostingProperities
{
  return self->_hostingProperities;
}

- (void)setHostingProperities:(id)a3
{
  objc_storeStrong((id *)&self->_hostingProperities, a3);
}

- (NSAttributedString)attributedTitle
{
  return self->_attributedTitle;
}

- (void)setAttributedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (NSAttributedString)placeholderText
{
  return self->_placeholderText;
}

- (void)setPlaceholderText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (TUIMenuContainer)menuContainer
{
  return self->_menuContainer;
}

- (BOOL)menuIsPrimary
{
  return self->_menuIsPrimary;
}

- (void)setMenuIsPrimary:(BOOL)a3
{
  self->_menuIsPrimary = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuContainer, 0);
  objc_storeStrong((id *)&self->_placeholderText, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_attributedTitle, 0);
  objc_storeStrong((id *)&self->_hostingProperities, 0);
  objc_storeStrong((id *)&self->_hostingIdentifiers, 0);
}

@end
