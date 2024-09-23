@implementation MCDLibraryMenuTableViewCell

- (MCDLibraryMenuTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MCDLibraryMenuTableViewCell *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MCDLibraryMenuTableViewCell;
  v4 = -[_MCDReusableCell initWithStyle:reuseIdentifier:](&v14, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 15.0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryMenuTableViewCell textLabel](v4, "textLabel"));
    objc_msgSend(v6, "setFont:", v5);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _labelColor](UIColor, "_labelColor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryMenuTableViewCell textLabel](v4, "textLabel"));
    objc_msgSend(v8, "setTextColor:", v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryMenuTableViewCell textLabel](v4, "textLabel"));
    objc_msgSend(v10, "setHighlightedTextColor:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 6, 16.0));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryMenuTableViewCell imageView](v4, "imageView"));
    objc_msgSend(v12, "setPreferredSymbolConfiguration:", v11);

  }
  return v4;
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  void *v6;
  int v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MCDLibraryMenuTableViewCell;
  -[_MCDReusableCell setHighlighted:animated:](&v9, "setHighlighted:animated:", a3, a4);
  if (a3 || -[MCDLibraryMenuTableViewCell isSelected](self, "isSelected"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusSecondaryColor](UIColor, "_carSystemFocusSecondaryColor"));
    v7 = 1;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryMenuTableViewCell imageView](self, "imageView"));
  objc_msgSend(v8, "setTintColor:", v6);

  if (v7)
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  unsigned int v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCDLibraryMenuTableViewCell;
  -[_MCDReusableCell setSelected:animated:](&v9, "setSelected:animated:", a3, a4);
  v6 = -[MCDLibraryMenuTableViewCell isHighlighted](self, "isHighlighted") | v4;
  if (v6 == 1)
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusSecondaryColor](UIColor, "_carSystemFocusSecondaryColor"));
  else
    v7 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryMenuTableViewCell imageView](self, "imageView"));
  objc_msgSend(v8, "setTintColor:", v7);

  if (v6)
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double y;
  double Height;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double MinX;
  double v46;
  double v47;
  objc_super v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  v48.receiver = self;
  v48.super_class = (Class)MCDLibraryMenuTableViewCell;
  -[MCDLibraryMenuTableViewCell layoutSubviews](&v48, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryMenuTableViewCell contentView](self, "contentView"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v46 = v5 + 10.0;
  v47 = v9 + -10.0;
  y = CGRectZero.origin.y;
  v49.origin.x = v5 + 10.0;
  v49.origin.y = v7;
  v49.size.width = v9 + -10.0;
  v49.size.height = v11;
  MinX = CGRectGetMinX(v49);
  v50.origin.x = v5 + 10.0;
  v50.origin.y = v7;
  v50.size.width = v9 + -10.0;
  v50.size.height = v11;
  Height = CGRectGetHeight(v50);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryMenuTableViewCell imageView](self, "imageView"));
  objc_msgSend(v14, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  v16 = v15;
  v18 = v17;

  v19 = UIRectCenteredRect(CGRectZero.origin.x, y, v16, v18, MinX, y, 24.0, Height);
  v20 = CPUIRectByApplyingUserInterfaceLayoutDirectionInRect(v19);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryMenuTableViewCell imageView](self, "imageView"));
  objc_msgSend(v27, "setFrame:", v20, v22, v24, v26);

  v51.size.width = 24.0;
  v51.origin.x = MinX;
  v51.origin.y = y;
  v51.size.height = Height;
  v28 = v46 + CGRectGetWidth(v51) + 8.0;
  v52.size.width = 24.0;
  v52.origin.x = MinX;
  v52.origin.y = y;
  v52.size.height = Height;
  v29 = v47 - (CGRectGetWidth(v52) + 8.0);
  v53.origin.x = v28;
  v53.origin.y = v7;
  v53.size.width = v29;
  v53.size.height = v11;
  v30 = CGRectGetMinX(v53);
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryMenuTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v31, "sizeThatFits:", v29, v11);
  v33 = v32;
  v35 = v34;

  v36 = UIRectCenteredYInRect(v30, y, v33, v35, v28, v7, v29, v11);
  v37 = CPUIRectByApplyingUserInterfaceLayoutDirectionInRect(v36);
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[MCDLibraryMenuTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v44, "setFrame:", v37, v39, v41, v43);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolDebugBoundingBox, 0);
}

@end
