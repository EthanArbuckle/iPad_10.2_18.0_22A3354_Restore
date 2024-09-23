@implementation THWGalleryItem

- (THWGalleryItem)initWithContext:(id)a3 imageData:(id)a4 thumbnailData:(id)a5 captionStorage:(id)a6 cropRect:(CGRect)a7 accessibilityDescriptions:(id)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  THWGalleryItem *v17;
  THWPStorage *v18;
  id v19;
  id v20;
  objc_super v22;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v22.receiver = self;
  v22.super_class = (Class)THWGalleryItem;
  v17 = -[THWGalleryItem init](&v22, "init");
  if (v17)
  {
    v18 = (THWPStorage *)a6;
    v17->_captionStorage = v18;
    -[THWPStorage setPreventHighlighting:](v18, "setPreventHighlighting:", 1);
    v17->_cropRect.origin.x = x;
    v17->_cropRect.origin.y = y;
    v17->_cropRect.size.width = width;
    v17->_cropRect.size.height = height;
    v17->_accessibilityDescriptions = (NSDictionary *)a8;
    v19 = objc_msgSend(objc_alloc((Class)TSDMediaStyle), "initWithContext:name:overridePropertyMap:isVariation:", a3, 0, 0, 0);
    v17->_imageInfo = -[THImageInfo initWithContext:geometry:style:imageData:originalImageData:]([THImageInfo alloc], "initWithContext:geometry:style:imageData:originalImageData:", a3, 0, v19, a4, 0);
    v20 = objc_msgSend(objc_alloc((Class)TSDMaskInfo), "initWithContext:geometry:pathSource:", a3, 0, +[TSDScalarPathSource rectangleWithNaturalSize:](TSDScalarPathSource, "rectangleWithNaturalSize:", 100.0, 100.0));
    -[THImageInfo setMaskInfo:](v17->_imageInfo, "setMaskInfo:", v20);

    if (a5)
      v17->_thumbnailImageData = (TSPData *)a5;

  }
  return v17;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWGalleryItem;
  -[THWGalleryItem dealloc](&v3, "dealloc");
}

- (BOOL)isOpaque
{
  return -[THImageInfo isOpaque](self->_imageInfo, "isOpaque");
}

- (id)childEnumerator
{
  id v3;
  void *v4;

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  v4 = v3;
  if (self->_captionStorage)
    objc_msgSend(v3, "addObject:");
  return objc_msgSend(v4, "objectEnumerator");
}

- (THImageInfo)imageInfo
{
  return self->_imageInfo;
}

- (TSPData)thumbnailImageData
{
  return self->_thumbnailImageData;
}

- (THWPStorage)captionStorage
{
  return self->_captionStorage;
}

- (CGRect)cropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cropRect.origin.x;
  y = self->_cropRect.origin.y;
  width = self->_cropRect.size.width;
  height = self->_cropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSDictionary)accessibilityDescriptions
{
  return self->_accessibilityDescriptions;
}

@end
