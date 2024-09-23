@implementation PXRightAlignedButton

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  objc_super v27;
  CGRect v28;
  CGRect v29;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PXRightAlignedButton currentImage](self, "currentImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "size");
    v11 = v10;
    objc_msgSend(v9, "size");
    v13 = v12 / v11;
    v28.origin.x = x;
    v28.origin.y = y;
    v28.size.width = width;
    v28.size.height = height;
    v14 = CGRectGetHeight(v28);
    v15 = v14;
    if (v11 >= v14)
      v11 = v14;
    v16 = v13 * v11;
    v29.origin.x = x;
    v29.origin.y = y;
    v29.size.width = width;
    v29.size.height = height;
    v17 = CGRectGetMaxX(v29) - v16;
    v18 = (v15 - v11) * 0.5;
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)PXRightAlignedButton;
    -[PXRightAlignedButton imageRectForContentRect:](&v27, sel_imageRectForContentRect_, x, y, width, height);
    v17 = v19;
    v18 = v20;
    v16 = v21;
    v11 = v22;
  }

  v23 = v17;
  v24 = v18;
  v25 = v16;
  v26 = v11;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

@end
