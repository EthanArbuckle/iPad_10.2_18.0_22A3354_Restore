@implementation PresentPhotoThumbnailGalleryAction

- (PresentPhotoThumbnailGalleryAction)initWithMapItem:(id)a3 albumIndex:(unint64_t)a4
{
  id v7;
  PresentPhotoThumbnailGalleryAction *v8;
  PresentPhotoThumbnailGalleryAction *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PresentPhotoThumbnailGalleryAction;
  v8 = -[PresentPhotoThumbnailGalleryAction init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_mapItem, a3);
    v9->_albumIndex = a4;
  }

  return v9;
}

- (BOOL)isCompatibleWithRestorationTask
{
  return 0;
}

- (int)analyticsLaunchActionType
{
  return 21;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (unint64_t)albumIndex
{
  return self->_albumIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end
