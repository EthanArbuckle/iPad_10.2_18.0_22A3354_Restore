@implementation _TVRoundButtonContent

- (CGRect)_frameForImageView:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double MidX;
  double MidY;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  _BOOL4 v27;
  _BOOL4 v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGRect v35;
  CGRect v36;
  CGRect result;

  v4 = a3;
  -[_TVRoundButtonContent bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "bounds");
  v14 = v13;
  v16 = v15;
  v35.origin.x = v6;
  v35.origin.y = v8;
  v35.size.width = v10;
  v35.size.height = v12;
  MidX = CGRectGetMidX(v35);
  v36.origin.x = v6;
  v36.origin.y = v8;
  v36.size.width = v10;
  v36.size.height = v12;
  MidY = CGRectGetMidY(v36);
  objc_msgSend(v4, "tv_margin");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;

  v27 = v24 == 0.0;
  v28 = v26 == 0.0;
  v29 = v22 + v26;
  v30 = v20 + v24;
  if (v27 && v28)
    v30 = 0.0;
  v31 = v16 - v30;
  if (v27 && v28)
    v29 = 0.0;
  v32 = v14 - v29;
  v33 = MidX - v14 * 0.5 + v22;
  v34 = MidY - v16 * 0.5 + v20;
  result.size.height = v31;
  result.size.width = v32;
  result.origin.y = v34;
  result.origin.x = v33;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_TVRoundButtonContent;
  -[TVButtonContent layoutSubviews](&v5, sel_layoutSubviews);
  -[TVButtonContent imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVButtonContent imageView](self, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVRoundButtonContent _frameForImageView:](self, "_frameForImageView:", v4);
  objc_msgSend(v3, "setFrame:");

}

@end
