@implementation PLPhotoEditExportProperties

+ (id)exportPropertiesWithImageWidth:(unint64_t)a3 imageHeight:(unint64_t)a4 exifOrientation:(int64_t)a5
{
  return (id)objc_msgSend(a1, "exportPropertiesWithImageWidth:imageHeight:exifOrientation:duration:", a3, a4, a5, 0.0);
}

+ (id)exportPropertiesWithImageWidth:(unint64_t)a3 imageHeight:(unint64_t)a4 exifOrientation:(int64_t)a5 duration:(double)a6
{
  double *v10;

  v10 = (double *)objc_alloc_init((Class)a1);
  *((_QWORD *)v10 + 1) = a5;
  *((_QWORD *)v10 + 3) = a3;
  *((_QWORD *)v10 + 4) = a4;
  v10[2] = a6;
  return v10;
}

- (int64_t)baseEXIFOrientation
{
  return self->_baseEXIFOrientation;
}

- (double)baseDuration
{
  return self->_baseDuration;
}

- (unint64_t)imageWidth
{
  return self->_imageWidth;
}

- (unint64_t)imageHeight
{
  return self->_imageHeight;
}

@end
