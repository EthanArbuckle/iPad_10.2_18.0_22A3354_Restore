@implementation CALayer(AnchorPoint)

- (uint64_t)setAnchorPointWithoutChangingPosition:()AnchorPoint
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  double v23;
  CATransform3D v25;
  CGAffineTransform v26;
  CATransform3D v27;
  CGAffineTransform v28;

  objc_msgSend(a1, "bounds");
  v7 = a2 * v6;
  objc_msgSend(a1, "bounds");
  v9 = a3 * v8;
  objc_msgSend(a1, "bounds");
  v11 = v10;
  objc_msgSend(a1, "anchorPoint");
  v13 = v11 * v12;
  objc_msgSend(a1, "bounds");
  v15 = v14;
  objc_msgSend(a1, "anchorPoint");
  v17 = v15 * v16;
  objc_msgSend(a1, "transform");
  CATransform3DGetAffineTransform(&v28, &v27);
  v18 = v28.tx + v9 * v28.c + v28.a * v7;
  v19 = v28.ty + v9 * v28.d + v28.b * v7;
  objc_msgSend(a1, "transform");
  CATransform3DGetAffineTransform(&v26, &v25);
  v20 = v26.tx + v17 * v26.c + v26.a * v13;
  v21 = v26.ty + v17 * v26.d + v26.b * v13;
  objc_msgSend(a1, "position");
  objc_msgSend(a1, "setPosition:", v18 + v22 - v20, v19 + v23 - v21);
  return objc_msgSend(a1, "setAnchorPoint:", a2, a3);
}

@end
