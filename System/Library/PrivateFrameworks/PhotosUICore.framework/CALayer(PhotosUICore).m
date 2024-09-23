@implementation CALayer(PhotosUICore)

- (uint64_t)px_setAnchorPoint:()PhotosUICore
{
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v22;
  double v23;
  CGRect v24;
  CGRect v25;

  objc_msgSend(a1, "anchorPoint");
  v22 = v6;
  v23 = v7;
  objc_msgSend(a1, "setAnchorPoint:", a2, a3);
  objc_msgSend(a1, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(a1, "position");
  v17 = v16;
  v19 = v18;
  v24.origin.x = v9;
  v24.origin.y = v11;
  v24.size.width = v13;
  v24.size.height = v15;
  v20 = v17 + CGRectGetWidth(v24) * (a2 - v22);
  v25.origin.x = v9;
  v25.origin.y = v11;
  v25.size.width = v13;
  v25.size.height = v15;
  return objc_msgSend(a1, "setPosition:", v20, v19 + CGRectGetHeight(v25) * (a3 - v23));
}

@end
