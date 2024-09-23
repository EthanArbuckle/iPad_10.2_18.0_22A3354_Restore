@implementation WFParameterValuePickerTableViewCellConfiguration

- (id)makeContentView
{
  return -[WFParameterValuePickerTableViewCellContentView initWithConfiguration:]([WFParameterValuePickerTableViewCellContentView alloc], "initWithConfiguration:", self);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id WeakRetained;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    v5 = -[NSString copy](self->_text, "copy");
    v6 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v5;

    v7 = -[NSString copy](self->_secondaryText, "copy");
    v8 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v7;

    objc_storeStrong((id *)(v4 + 32), self->_textColor);
    objc_storeStrong((id *)(v4 + 40), self->_secondaryTextColor);
    *(_BYTE *)(v4 + 8) = self->_containedInState;
    *(_BYTE *)(v4 + 9) = self->_usesToggleForSelection;
    objc_storeStrong((id *)(v4 + 48), self->_textFont);
    objc_storeStrong((id *)(v4 + 56), self->_secondaryTextFont);
    objc_storeStrong((id *)(v4 + 64), self->_image);
    objc_storeStrong((id *)(v4 + 72), self->_icon);
    *(double *)(v4 + 80) = self->_cornerRadius;
    *(_BYTE *)(v4 + 10) = self->_forceImageScaling;
    WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
    objc_storeWeak((id *)(v4 + 88), WeakRetained);

  }
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  WFParameterValuePickerTableViewCellConfiguration *v4;
  WFParameterValuePickerTableViewCellConfiguration *v5;
  WFParameterValuePickerTableViewCellConfiguration *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  BOOL v19;
  double v21;
  double v22;
  double v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;

  v4 = (WFParameterValuePickerTableViewCellConfiguration *)a3;
  v5 = v4;
  if (self == v4)
  {
    v19 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[WFParameterValuePickerTableViewCellConfiguration text](self, "text");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFParameterValuePickerTableViewCellConfiguration text](v6, "text");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqualToString:", v8))
      {
        -[WFParameterValuePickerTableViewCellConfiguration secondaryText](self, "secondaryText");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFParameterValuePickerTableViewCellConfiguration secondaryText](v6, "secondaryText");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isEqualToString:", v10))
        {
          -[WFParameterValuePickerTableViewCellConfiguration textColor](self, "textColor");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFParameterValuePickerTableViewCellConfiguration textColor](v6, "textColor");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "isEqual:", v12))
          {
            -[WFParameterValuePickerTableViewCellConfiguration secondaryTextColor](self, "secondaryTextColor");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFParameterValuePickerTableViewCellConfiguration secondaryTextColor](v6, "secondaryTextColor");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = v13;
            if (objc_msgSend(v13, "isEqual:", v36))
            {
              -[WFParameterValuePickerTableViewCellConfiguration textFont](self, "textFont");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              -[WFParameterValuePickerTableViewCellConfiguration textFont](v6, "textFont");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = v14;
              if (objc_msgSend(v14, "isEqual:", v34))
              {
                -[WFParameterValuePickerTableViewCellConfiguration secondaryTextFont](self, "secondaryTextFont");
                v15 = objc_claimAutoreleasedReturnValue();
                -[WFParameterValuePickerTableViewCellConfiguration secondaryTextFont](v6, "secondaryTextFont");
                v16 = objc_claimAutoreleasedReturnValue();
                v33 = (void *)v15;
                v17 = (void *)v15;
                v18 = (void *)v16;
                if (objc_msgSend(v17, "isEqual:", v16)
                  && (v30 = -[WFParameterValuePickerTableViewCellConfiguration isContainedInState](self, "isContainedInState"), v30 == -[WFParameterValuePickerTableViewCellConfiguration isContainedInState](v6, "isContainedInState"))&& (v31 = -[WFParameterValuePickerTableViewCellConfiguration usesToggleForSelection](self, "usesToggleForSelection"), v31 == -[WFParameterValuePickerTableViewCellConfiguration usesToggleForSelection](v6, "usesToggleForSelection")))
                {
                  -[WFParameterValuePickerTableViewCellConfiguration image](self, "image");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  -[WFParameterValuePickerTableViewCellConfiguration image](v6, "image");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v32, "isEqual:"))
                  {
                    -[WFParameterValuePickerTableViewCellConfiguration icon](self, "icon");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    -[WFParameterValuePickerTableViewCellConfiguration icon](v6, "icon");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v28, "isEqual:")
                      && (-[WFParameterValuePickerTableViewCellConfiguration cornerRadius](self, "cornerRadius"),
                          v22 = v21,
                          -[WFParameterValuePickerTableViewCellConfiguration cornerRadius](v6, "cornerRadius"),
                          v22 == v23)
                      && (v25 = -[WFParameterValuePickerTableViewCellConfiguration forceImageScaling](self, "forceImageScaling"), v25 == -[WFParameterValuePickerTableViewCellConfiguration forceImageScaling](v6, "forceImageScaling")))
                    {
                      -[WFParameterValuePickerTableViewCellConfiguration parentViewController](self, "parentViewController");
                      v26 = (void *)objc_claimAutoreleasedReturnValue();
                      -[WFParameterValuePickerTableViewCellConfiguration parentViewController](v6, "parentViewController");
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      v19 = v26 == v24;

                    }
                    else
                    {
                      v19 = 0;
                    }

                  }
                  else
                  {
                    v19 = 0;
                  }

                }
                else
                {
                  v19 = 0;
                }

              }
              else
              {
                v19 = 0;
              }

            }
            else
            {
              v19 = 0;
            }

          }
          else
          {
            v19 = 0;
          }

        }
        else
        {
          v19 = 0;
        }

      }
      else
      {
        v19 = 0;
      }

    }
    else
    {
      v19 = 0;
    }

  }
  return v19;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  double v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  void *v26;
  void *v27;
  void *v28;

  -[WFParameterValuePickerTableViewCellConfiguration text](self, "text");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v28, "hash");
  -[WFParameterValuePickerTableViewCellConfiguration secondaryText](self, "secondaryText");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v27, "hash") ^ v3;
  -[WFParameterValuePickerTableViewCellConfiguration textColor](self, "textColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v26, "hash");
  -[WFParameterValuePickerTableViewCellConfiguration secondaryTextColor](self, "secondaryTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4 ^ v5 ^ objc_msgSend(v6, "hash");
  -[WFParameterValuePickerTableViewCellConfiguration textFont](self, "textFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  -[WFParameterValuePickerTableViewCellConfiguration secondaryTextFont](self, "secondaryTextFont");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");
  if (-[WFParameterValuePickerTableViewCellConfiguration isContainedInState](self, "isContainedInState"))
    v12 = 3133065982;
  else
    v12 = 3405691582;
  v13 = v7 ^ v11 ^ v12;
  if (-[WFParameterValuePickerTableViewCellConfiguration usesToggleForSelection](self, "usesToggleForSelection"))
    v14 = 3405691582;
  else
    v14 = 3133065982;
  -[WFParameterValuePickerTableViewCellConfiguration image](self, "image");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14 ^ objc_msgSend(v15, "hash");
  -[WFParameterValuePickerTableViewCellConfiguration icon](self, "icon");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v13 ^ v16 ^ objc_msgSend(v17, "hash");
  -[WFParameterValuePickerTableViewCellConfiguration cornerRadius](self, "cornerRadius");
  v20 = (unint64_t)v19;
  if (-[WFParameterValuePickerTableViewCellConfiguration forceImageScaling](self, "forceImageScaling"))
    v21 = 3405691582;
  else
    v21 = 3133065982;
  v22 = v18 ^ v21;
  -[WFParameterValuePickerTableViewCellConfiguration parentViewController](self, "parentViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v22 ^ objc_msgSend(v23, "hash") ^ v20;

  return v24;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)secondaryText
{
  return self->_secondaryText;
}

- (void)setSecondaryText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (UIColor)secondaryTextColor
{
  return self->_secondaryTextColor;
}

- (void)setSecondaryTextColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isContainedInState
{
  return self->_containedInState;
}

- (void)setContainedInState:(BOOL)a3
{
  self->_containedInState = a3;
}

- (BOOL)usesToggleForSelection
{
  return self->_usesToggleForSelection;
}

- (void)setUsesToggleForSelection:(BOOL)a3
{
  self->_usesToggleForSelection = a3;
}

- (UIFont)textFont
{
  return self->_textFont;
}

- (void)setTextFont:(id)a3
{
  objc_storeStrong((id *)&self->_textFont, a3);
}

- (UIFont)secondaryTextFont
{
  return self->_secondaryTextFont;
}

- (void)setSecondaryTextFont:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryTextFont, a3);
}

- (WFImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (WFIcon)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (BOOL)forceImageScaling
{
  return self->_forceImageScaling;
}

- (void)setForceImageScaling:(BOOL)a3
{
  self->_forceImageScaling = a3;
}

- (BOOL)usesInsetGroupedTableStyle
{
  return self->_usesInsetGroupedTableStyle;
}

- (void)setUsesInsetGroupedTableStyle:(BOOL)a3
{
  self->_usesInsetGroupedTableStyle = a3;
}

- (BOOL)disablesSeparatorIconInset
{
  return self->_disablesSeparatorIconInset;
}

- (void)setDisablesSeparatorIconInset:(BOOL)a3
{
  self->_disablesSeparatorIconInset = a3;
}

- (UIViewController)parentViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_parentViewController);
}

- (void)setParentViewController:(id)a3
{
  objc_storeWeak((id *)&self->_parentViewController, a3);
}

- (WFParameterValuePickerTableViewCellDelegate)delegate
{
  return (WFParameterValuePickerTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_parentViewController);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_secondaryTextFont, 0);
  objc_storeStrong((id *)&self->_textFont, 0);
  objc_storeStrong((id *)&self->_secondaryTextColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
