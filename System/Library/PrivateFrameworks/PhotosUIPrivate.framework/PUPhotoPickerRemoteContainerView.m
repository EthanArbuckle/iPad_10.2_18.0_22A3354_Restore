@implementation PUPhotoPickerRemoteContainerView

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  objc_super v13;
  CGRect v14;
  CGRect v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PUPhotoPickerRemoteContainerView frame](self, "frame");
  v8 = v14.origin.x;
  v9 = v14.origin.y;
  v10 = v14.size.width;
  v11 = v14.size.height;
  if (CGRectIsEmpty(v14)
    || (v15.origin.x = x, v15.origin.y = y, v15.size.width = width, v15.size.height = height, !CGRectIsEmpty(v15)))
  {
    -[PUPhotoPickerRemoteContainerView setFrame:](&v12, sel_setFrame_, x, y, width, height, self, PUPhotoPickerRemoteContainerView, v13.receiver, v13.super_class);
  }
  else
  {
    -[PUPhotoPickerRemoteContainerView setFrame:](&v13, sel_setFrame_, v8, v9, v10, v11, v12.receiver, v12.super_class, self, PUPhotoPickerRemoteContainerView);
  }
}

@end
