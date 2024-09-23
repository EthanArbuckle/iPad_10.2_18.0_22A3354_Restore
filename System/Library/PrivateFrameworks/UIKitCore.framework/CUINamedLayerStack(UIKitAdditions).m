@implementation CUINamedLayerStack(UIKitAdditions)

- (id)flattenedUIImageWithAsset:()UIKitAdditions configuration:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id *v10;
  _UIImageCGImageContent *v11;
  uint64_t v12;
  _UIImageCGImageContent *v13;
  void *v14;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "layers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "UIImageWithAsset:configuration:flippedHorizontally:optionalVectorImage:", v7, v6, 0, 0);
  v10 = (id *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = [_UIImageCGImageContent alloc];
    v12 = objc_msgSend(a1, "flattenedImage");
    objc_msgSend(v10[2], "scale");
    v13 = -[_UIImageCGImageContent initWithCGImage:scale:](v11, "initWithCGImage:scale:", v12);
    objc_msgSend(v10, "_swizzleContent:", v13);

    objc_msgSend(v10, "imageAsset");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_setLayerStack:", a1);

  }
  return v10;
}

- (id)configuration
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "layers");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
