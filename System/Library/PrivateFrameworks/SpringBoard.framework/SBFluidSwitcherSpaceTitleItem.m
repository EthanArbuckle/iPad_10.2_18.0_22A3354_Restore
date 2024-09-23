@implementation SBFluidSwitcherSpaceTitleItem

- (BOOL)isEqual:(id)a3
{
  SBFluidSwitcherSpaceTitleItem *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;

  v4 = (SBFluidSwitcherSpaceTitleItem *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    SBSafeCast(v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "displayItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (BSEqualObjects())
      {
        objc_msgSend(v7, "image");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (BSEqualObjects())
        {
          objc_msgSend(v7, "titleText");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (BSEqualStrings())
          {
            -[SBFluidSwitcherSpaceTitleItem subtitleText](v4, "subtitleText");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (BSEqualStrings())
            {
              -[SBFluidSwitcherSpaceTitleItem titleTextColor](v4, "titleTextColor");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = BSEqualObjects()
                 && objc_msgSend(v7, "subtitleInterfaceStyle") == self->_subtitleInterfaceStyle
                 && self->_showsMultiWindowIndicator == objc_msgSend(v7, "showsMultiWindowIndicator");

            }
            else
            {
              v13 = 0;
            }

          }
          else
          {
            v13 = 0;
          }

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  return v13;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (UIColor)titleTextColor
{
  return self->_titleTextColor;
}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (int64_t)subtitleInterfaceStyle
{
  return self->_subtitleInterfaceStyle;
}

- (BOOL)showsMultiWindowIndicator
{
  return self->_showsMultiWindowIndicator;
}

- (UIImage)image
{
  return self->_image;
}

- (SBDisplayItem)displayItem
{
  return self->_displayItem;
}

- (void)setTitleTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_titleTextColor, a3);
}

- (void)setTitleText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setSubtitleText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setSubtitleInterfaceStyle:(int64_t)a3
{
  self->_subtitleInterfaceStyle = a3;
}

- (void)setShowsMultiWindowIndicator:(BOOL)a3
{
  self->_showsMultiWindowIndicator = a3;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (SBFluidSwitcherSpaceTitleItem)initWithDisplayItem:(id)a3
{
  id v6;
  SBFluidSwitcherSpaceTitleItem *v7;
  void *v9;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBFluidSwitcherSpaceTitleItem;
  v7 = -[SBFluidSwitcherSpaceTitleItem init](&v10, sel_init);
  if (v7)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("SBFluidSwitcherSpaceTitleItem.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayItem"));

    }
    objc_storeStrong((id *)&v7->_displayItem, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleTextColor, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_displayItem, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithDisplayItem:", self->_displayItem);
  if (v4)
  {
    v5 = -[UIImage copy](self->_image, "copy");
    v6 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v5;

    v7 = -[NSString copy](self->_subtitleText, "copy");
    v8 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = v7;

    v9 = -[NSString copy](self->_titleText, "copy");
    v10 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v9;

    v11 = -[UIColor copy](self->_titleTextColor, "copy");
    v12 = *(void **)(v4 + 48);
    *(_QWORD *)(v4 + 48) = v11;

    *(_QWORD *)(v4 + 56) = self->_subtitleInterfaceStyle;
    *(_BYTE *)(v4 + 8) = self->_showsMultiWindowIndicator;
  }
  return (id)v4;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  NSUInteger v5;
  unint64_t v6;

  v3 = -[SBDisplayItem hash](self->_displayItem, "hash");
  v4 = -[UIImage hash](self->_image, "hash") + v3;
  v5 = -[NSString hash](self->_titleText, "hash");
  v6 = v4 + v5 + -[NSString hash](self->_subtitleText, "hash");
  return self->_showsMultiWindowIndicator
       + -[UIColor hash](self->_titleTextColor, "hash")
       + self->_subtitleInterfaceStyle
       + v6
       + 67;
}

@end
