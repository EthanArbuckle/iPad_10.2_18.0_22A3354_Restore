@implementation UIBarButtonItem(PXDefaultBarButtonItems)

+ (id)px_localizedSelectBarButtonItem
{
  id v1;
  void *v2;
  void *v3;

  v1 = [a1 alloc];
  PXLocalizedStringFromTable(CFSTR("PXPhotosDetailsBarSelectButton"), CFSTR("PhotosUICore"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v1, "initWithTitle:style:target:action:", v2, 0, 0, 0);

  return v3;
}

+ (id)px_localizedSelectAllBarButtonItem
{
  id v1;
  void *v2;
  void *v3;

  v1 = [a1 alloc];
  PXLocalizedStringFromTable(CFSTR("PXPhotosBarsSelectAll"), CFSTR("PhotosUICore"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v1, "initWithTitle:style:target:action:", v2, 0, 0, 0);

  return v3;
}

+ (id)px_localizedDeselectAllBarButtonItem
{
  id v1;
  void *v2;
  void *v3;

  v1 = [a1 alloc];
  PXLocalizedStringFromTable(CFSTR("PXPhotosBarsDeselectAll"), CFSTR("PhotosUICore"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v1, "initWithTitle:style:target:action:", v2, 0, 0, 0);

  return v3;
}

+ (id)px_localizedAddBarButtonItem
{
  id v1;
  void *v2;
  void *v3;

  v1 = [a1 alloc];
  PXLocalizedStringFromTable(CFSTR("PXAddButtonTitle"), CFSTR("PhotosUICore"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v1, "initWithTitle:style:target:action:", v2, 0, 0, 0);

  return v3;
}

@end
