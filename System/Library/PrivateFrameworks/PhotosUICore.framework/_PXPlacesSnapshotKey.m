@implementation _PXPlacesSnapshotKey

- (_PXPlacesSnapshotKey)initWithImageSize:(CGSize)a3 userInterfaceStyle:(int64_t)a4
{
  CGFloat height;
  CGFloat width;
  _PXPlacesSnapshotKey *result;
  objc_super v8;

  height = a3.height;
  width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)_PXPlacesSnapshotKey;
  result = -[_PXPlacesSnapshotKey init](&v8, sel_init);
  if (result)
  {
    result->__imageSize.width = width;
    result->__imageSize.height = height;
    result->__userInterfaceStyle = a4;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _PXPlacesSnapshotKey *v4;
  double v5;
  double v6;

  v4 = [_PXPlacesSnapshotKey alloc];
  -[_PXPlacesSnapshotKey _imageSize](self, "_imageSize");
  return -[_PXPlacesSnapshotKey initWithImageSize:userInterfaceStyle:](v4, "initWithImageSize:userInterfaceStyle:", -[_PXPlacesSnapshotKey _userInterfaceStyle](self, "_userInterfaceStyle"), v5, v6);
}

- (BOOL)isEqual:(id)a3
{
  _PXPlacesSnapshotKey *v4;
  _PXPlacesSnapshotKey *v5;
  uint64_t v6;
  BOOL v7;

  v4 = (_PXPlacesSnapshotKey *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[_PXPlacesSnapshotKey _imageSize](self, "_imageSize");
      -[_PXPlacesSnapshotKey _imageSize](v5, "_imageSize");
      if (PXSizeApproximatelyEqualToSize())
      {
        v6 = -[_PXPlacesSnapshotKey _userInterfaceStyle](v5, "_userInterfaceStyle");
        v7 = v6 == -[_PXPlacesSnapshotKey _userInterfaceStyle](self, "_userInterfaceStyle");
      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  -[_PXPlacesSnapshotKey _imageSize](self, "_imageSize");
  return -[_PXPlacesSnapshotKey _userInterfaceStyle](self, "_userInterfaceStyle") ^ (16 * v3) ^ (v4 << 14);
}

- (CGSize)_imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->__imageSize.width;
  height = self->__imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int64_t)_userInterfaceStyle
{
  return self->__userInterfaceStyle;
}

@end
