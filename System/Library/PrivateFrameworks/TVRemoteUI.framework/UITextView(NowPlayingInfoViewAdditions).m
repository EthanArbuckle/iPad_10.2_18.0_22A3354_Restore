@implementation UITextView(NowPlayingInfoViewAdditions)

- (double)infoview_computedHeight
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  void *v11;
  double v12;
  CGFloat v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect v21;

  objc_msgSend(a1, "textContainerInset");
  v3 = v2;
  v5 = v4;
  objc_msgSend(a1, "contentInset");
  v7 = v6;
  v9 = v8;
  objc_msgSend(a1, "frame");
  v10 = CGRectGetWidth(v21) - v3 - v5;
  objc_msgSend(a1, "textContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lineFragmentPadding");
  v13 = v10 + v12 * -2.0 - v7 - v9;

  objc_msgSend(a1, "attributedText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "boundingRectWithSize:options:context:", 3, 0, v13, 1.79769313e308);
  v16 = v15;

  objc_msgSend(a1, "textContainerInset");
  v18 = v16 + v17;
  objc_msgSend(a1, "textContainerInset");
  return ceil(v18 + v19);
}

@end
