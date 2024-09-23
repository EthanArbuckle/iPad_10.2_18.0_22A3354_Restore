@implementation MapsRightImageButton

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double MaxX;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;
  CGRect v18;
  CGRect v19;
  CGRect result;

  v17.receiver = self;
  v17.super_class = (Class)MapsRightImageButton;
  -[MapsRightImageButton titleRectForContentRect:](&v17, "titleRectForContentRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[MapsRightImageButton bounds](self, "bounds");
  MaxX = CGRectGetMaxX(v18);
  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.width = v9;
  v19.size.height = v11;
  v13 = MaxX - CGRectGetMaxX(v19);
  v14 = v7;
  v15 = v9;
  v16 = v11;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double MaxX;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;
  CGRect v18;
  CGRect v19;
  CGRect result;

  v17.receiver = self;
  v17.super_class = (Class)MapsRightImageButton;
  -[MapsRightImageButton imageRectForContentRect:](&v17, "imageRectForContentRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[MapsRightImageButton bounds](self, "bounds");
  MaxX = CGRectGetMaxX(v18);
  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.width = v9;
  v19.size.height = v11;
  v13 = MaxX - CGRectGetMaxX(v19);
  v14 = v7;
  v15 = v9;
  v16 = v11;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

@end
