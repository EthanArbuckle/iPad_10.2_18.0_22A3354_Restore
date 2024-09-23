@implementation PKDashboardTextActionItem

+ (id)identifier
{
  return CFSTR("textAction");
}

+ (id)colorForSemanticColor:(int64_t)a3 hasTintColor:(BOOL *)a4
{
  void *v5;
  BOOL v6;

  switch(a3)
  {
    case 1:
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    case 2:
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    case 3:
      objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    case 4:
      objc_msgSend(MEMORY[0x1E0DC3658], "quaternaryLabelColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    case 5:
      objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    case 6:
      objc_msgSend(MEMORY[0x1E0DC3658], "placeholderTextColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    case 7:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemFillColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    case 8:
      objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemFillColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    case 9:
      objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    case 10:
      objc_msgSend(MEMORY[0x1E0DC3658], "quaternarySystemFillColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    case 11:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    case 12:
      objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    case 13:
      objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemGroupedBackgroundColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    case 14:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    case 15:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    case 16:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemIndigoColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    case 17:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    case 18:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemPinkColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    case 19:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemPurpleColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    case 20:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    case 21:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemTealColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    case 22:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    case 23:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:
      v6 = 0;
      break;
    case 24:
      v5 = 0;
      v6 = 1;
      break;
    default:
      v6 = 0;
      v5 = 0;
      break;
  }
  if (v5)
    v6 = 1;
  *a4 = v6;
  return v5;
}

+ (id)imageForPassFieldImage:(id)a3 hasTintColor:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "symbolName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (objc_msgSend(v6, "allowInternalSymbols"))
        objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", v7);
      else
        objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        goto LABEL_10;
    }
    else
    {
      objc_msgSend(v6, "image");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(MEMORY[0x1E0DC3870], "imageWithPKImage:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }

      if (v10)
      {
LABEL_10:
        if (v7 || a4)
        {
          objc_msgSend(v10, "imageWithRenderingMode:", 2);
          v11 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = v10;
        }
        v8 = v11;
        goto LABEL_18;
      }
    }
    v8 = 0;
LABEL_18:

    goto LABEL_19;
  }
  v8 = 0;
LABEL_19:

  return v8;
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (int64_t)actionStyle
{
  return self->_actionStyle;
}

- (void)setActionStyle:(int64_t)a3
{
  self->_actionStyle = a3;
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (void)setLayoutStyle:(int64_t)a3
{
  self->_layoutStyle = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (UIImage)titleImage
{
  return self->_titleImage;
}

- (void)setTitleImage:(id)a3
{
  objc_storeStrong((id *)&self->_titleImage, a3);
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (void)setTitleColor:(id)a3
{
  objc_storeStrong((id *)&self->_titleColor, a3);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (UIImage)subtitleImage
{
  return self->_subtitleImage;
}

- (void)setSubtitleImage:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleImage, a3);
}

- (UIColor)subtitleColor
{
  return self->_subtitleColor;
}

- (void)setSubtitleColor:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleColor, a3);
}

- (UIImage)accessoryImage
{
  return self->_accessoryImage;
}

- (void)setAccessoryImage:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryImage, a3);
}

- (UIColor)accessoryColor
{
  return self->_accessoryColor;
}

- (void)setAccessoryColor:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryColor, a3);
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_accessoryColor, 0);
  objc_storeStrong((id *)&self->_accessoryImage, 0);
  objc_storeStrong((id *)&self->_subtitleColor, 0);
  objc_storeStrong((id *)&self->_subtitleImage, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_titleImage, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_icon, 0);
}

@end
