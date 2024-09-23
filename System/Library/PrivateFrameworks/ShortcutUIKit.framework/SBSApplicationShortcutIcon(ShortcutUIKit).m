@implementation SBSApplicationShortcutIcon(ShortcutUIKit)

- (id)scui_iconImageWithAssetProvider:()ShortcutUIKit
{
  void *v1;

  objc_msgSend(a1, "_scui_iconImageWithAssetProvider:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v1)
  {
    objc_msgSend((id)objc_opt_class(), "_scui_defaultImage");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

+ (id)_scui_defaultImage
{
  if (_scui_defaultImage_onceToken != -1)
    dispatch_once(&_scui_defaultImage_onceToken, &__block_literal_global);
  return (id)_scui_defaultImage___defaultImage;
}

- (uint64_t)_scui_iconImageWithAssetProvider:()ShortcutUIKit
{
  return 0;
}

@end
