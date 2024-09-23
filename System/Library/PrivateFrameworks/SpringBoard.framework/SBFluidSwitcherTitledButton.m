@implementation SBFluidSwitcherTitledButton

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *title;
  void *v6;
  id v7;

  v7 = a3;
  if ((BSEqualStrings() & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v7, "copy");
    title = self->_title;
    self->_title = v4;

    _SBFluidSwitcherTitledButtonContentImageWithTitle(self->_title);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFluidSwitcherButton setImage:](self, "setImage:", v6);

  }
}

- (CGSize)sizeThatFits:(CGSize)a3
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
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  CGSize result;
  CGRect v18;
  CGRect v19;

  -[SBFluidSwitcherButton image](self, "image", a3.width, a3.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alignmentRectInsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "size");
  v18.size.width = v12 - (v7 + v11);
  v18.size.height = v13 - (v5 + v9);
  v18.origin.x = v7 + 0.0;
  v18.origin.y = v5 + 0.0;
  v19 = CGRectIntegral(v18);
  v14 = CGRectGetWidth(v19) + 13.0 + 13.0;

  v15 = 26.0;
  v16 = v14;
  result.height = v15;
  result.width = v16;
  return result;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
}

@end
