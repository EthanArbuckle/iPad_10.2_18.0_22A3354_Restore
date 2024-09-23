@implementation BCInsetsFittingButton

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  CGSize result;

  v12.receiver = self;
  v12.super_class = (Class)BCInsetsFittingButton;
  -[BCInsetsFittingButton intrinsicContentSize](&v12, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;
  v7 = fabs(v5);
  if (fabs(v3) >= 2.22044605e-16 && v7 >= 2.22044605e-16)
  {
    -[BCInsetsFittingButton bk_extraWidthNeeded](self, "bk_extraWidthNeeded", 2.22044605e-16, v7);
    v4 = v4 + v9;
  }
  v10 = v4;
  v11 = v6;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGSize result;

  v13.receiver = self;
  v13.super_class = (Class)BCInsetsFittingButton;
  -[BCInsetsFittingButton sizeThatFits:](&v13, "sizeThatFits:", a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  v8 = fabs(v6);
  if (fabs(v4) >= 2.22044605e-16 && v8 >= 2.22044605e-16)
  {
    -[BCInsetsFittingButton bk_extraWidthNeeded](self, "bk_extraWidthNeeded", 2.22044605e-16, v8);
    v5 = v5 + v10;
  }
  v11 = v5;
  v12 = v7;
  result.height = v12;
  result.width = v11;
  return result;
}

- (double)bk_extraWidthNeeded
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCInsetsFittingButton currentImage](self, "currentImage"));

  if (v3)
  {
    -[BCInsetsFittingButton imageEdgeInsets](self, "imageEdgeInsets");
    v6 = v4 + v5 + 0.0;
  }
  else
  {
    v6 = 0.0;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCInsetsFittingButton currentTitle](self, "currentTitle"));
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    -[BCInsetsFittingButton titleEdgeInsets](self, "titleEdgeInsets");
    v6 = v6 + v9 + v10;
  }
  if (fabs(v6) >= 2.22044605e-16)
  {
    -[BCInsetsFittingButton contentEdgeInsets](self, "contentEdgeInsets");
    return v6 + v11 + v12;
  }
  return v6;
}

@end
