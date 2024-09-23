@implementation PresentPhotoThumbnailGalleryActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v11 = a3;
  v5 = a4;
  v6 = objc_opt_class(PresentPhotoThumbnailGalleryAction);
  if ((objc_opt_isKindOfClass(v11, v6) & 1) != 0)
  {
    v7 = v11;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "coordinator"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapItem"));
    v10 = objc_msgSend(v7, "albumIndex");

    objc_msgSend(v8, "viewControllerShowPhotoThumbnailGalleryWithMapItem:albumIndex:", v9, v10);
  }

}

@end
