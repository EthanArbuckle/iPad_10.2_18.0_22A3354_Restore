@implementation UIBarItem

- (NSInteger)tag
{
  return self->_tag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_largeContentSizeImage, 0);
}

- (UIBarItem)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIBarItem;
  return -[UIBarItem init](&v3, sel_init);
}

- (void)setTag:(NSInteger)tag
{
  self->_tag = tag;
}

- (UIBarItem)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  UIBarItem *v5;
  void *v6;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  objc_super v13;

  v4 = coder;
  v13.receiver = self;
  v13.super_class = (Class)UIBarItem;
  v5 = -[UIBarItem init](&v13, sel_init);
  if (v5)
  {
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", 0x1E172F620);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_setAssociatedObject(v5, &_UIAppearanceCustomizedSelectorsAssociationKey, v6, (void *)1);
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("_UIBarItemLargeContentSizeImageCodingKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_storeStrong((id *)&v5->_largeContentSizeImage, v7);
    -[NSCoder decodeUIEdgeInsetsForKey:](v4, "decodeUIEdgeInsetsForKey:", CFSTR("_UIBarItemLargeContentSizeImageInsetsCodingKey"));
    v5->_largeContentSizeImageInsets.top = v8;
    v5->_largeContentSizeImageInsets.left = v9;
    v5->_largeContentSizeImageInsets.bottom = v10;
    v5->_largeContentSizeImageInsets.right = v11;

  }
  return v5;
}

+ (id)appearanceWhenContainedInInstancesOfClasses:(id)a3
{
  void *v4;
  void *v5;

  _UIInternalContainerClassArrayForContainerClassArray(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_appearanceWhenContainedIn:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_appearanceWhenContainedIn:(id)a3
{
  return +[_UIBarItemAppearance _appearanceForClass:withContainerList:](_UIBarItemAppearance, "_appearanceForClass:withContainerList:", a1, a3);
}

+ (id)appearance
{
  return +[_UIBarItemAppearance _appearanceForClass:withContainerList:](_UIBarItemAppearance, "_appearanceForClass:withContainerList:", a1, 0);
}

+ (id)_appearanceBlindViewClasses
{
  return 0;
}

+ (id)appearanceWhenContainedIn:(Class)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v8;

  if (!a3
    || (_UIInternalContainerClassesForContainerClasses(a3, &v8, 0), (v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
  objc_msgSend(a1, "_appearanceWhenContainedIn:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)appearanceForTraitCollection:(id)a3
{
  return 0;
}

+ (id)appearanceForTraitCollection:(id)a3 whenContainedInInstancesOfClasses:(id)a4
{
  return 0;
}

+ (id)appearanceForTraitCollection:(id)a3 whenContainedIn:(Class)a4
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  UIImage *largeContentSizeImage;
  id v6;

  v6 = a3;
  if (self->_shouldArchiveUIAppearanceTags)
  {
    objc_getAssociatedObject(self, &_UIAppearanceCustomizedSelectorsAssociationKey);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(v6, "encodeObject:forKey:", v4, 0x1E172F620);

  }
  largeContentSizeImage = self->_largeContentSizeImage;
  if (largeContentSizeImage)
    objc_msgSend(v6, "encodeObject:forKey:", largeContentSizeImage, CFSTR("_UIBarItemLargeContentSizeImageCodingKey"));
  if (self->_largeContentSizeImageInsets.top != 0.0
    || self->_largeContentSizeImageInsets.bottom != 0.0
    || self->_largeContentSizeImageInsets.left != 0.0
    || self->_largeContentSizeImageInsets.right != 0.0)
  {
    objc_msgSend(v6, "encodeUIEdgeInsets:forKey:", CFSTR("_UIBarItemLargeContentSizeImageInsetsCodingKey"));
  }

}

- (NSDictionary)titleTextAttributesForState:(UIControlState)state
{
  return 0;
}

- (BOOL)selected
{
  return 0;
}

- (BOOL)hasTitle
{
  return 0;
}

- (BOOL)hasImage
{
  return 0;
}

- (id)_attributedTitleForState:(unint64_t)a3 withDefaultAttributes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v6 = a4;
  if (-[UIBarItem hasTitle](self, "hasTitle"))
  {
    v7 = v6;
    -[UIBarItem titleTextAttributesForState:](self, "titleTextAttributesForState:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      v9 = (void *)objc_msgSend(v7, "mutableCopy");
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __60__UIBarItem__attributedTitleForState_withDefaultAttributes___block_invoke;
      v16[3] = &unk_1E16B5BD8;
      v10 = v9;
      v17 = v10;
      objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v16);
      v11 = v10;

      v7 = v11;
    }
    v12 = objc_alloc(MEMORY[0x1E0CB3498]);
    -[UIBarItem resolvedTitle](self, "resolvedTitle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithString:attributes:", v13, v7);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __60__UIBarItem__attributedTitleForState_withDefaultAttributes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a3, a2);
}

- (BOOL)_hasCustomizableInstanceAppearanceModifications
{
  return self->_hasCustomizableInstanceAppearanceModifications;
}

- (void)_setHasCustomizableInstanceAppearanceModifications:(BOOL)a3
{
  self->_hasCustomizableInstanceAppearanceModifications = a3;
}

- (BOOL)_shouldArchiveUIAppearanceTags
{
  return self->_shouldArchiveUIAppearanceTags;
}

- (void)_setShouldArchiveUIAppearanceTags:(BOOL)a3
{
  self->_shouldArchiveUIAppearanceTags = a3;
}

- (UIImage)largeContentSizeImage
{
  return self->_largeContentSizeImage;
}

- (void)setLargeContentSizeImage:(UIImage *)largeContentSizeImage
{
  objc_storeStrong((id *)&self->_largeContentSizeImage, largeContentSizeImage);
}

- (UIEdgeInsets)largeContentSizeImageInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_largeContentSizeImageInsets.top;
  left = self->_largeContentSizeImageInsets.left;
  bottom = self->_largeContentSizeImageInsets.bottom;
  right = self->_largeContentSizeImageInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setLargeContentSizeImageInsets:(UIEdgeInsets)largeContentSizeImageInsets
{
  self->_largeContentSizeImageInsets = largeContentSizeImageInsets;
}

@end
