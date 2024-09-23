@implementation VUIMediaEntityImageLoadParamsFactory

+ (id)imageLoadParamsWithMediaEntity:(id)a3 imageType:(unint64_t)a4
{
  id v5;
  void *v6;

  v5 = a3;
  if ((objc_msgSend(v5, "conformsToProtocol:", &unk_1F0291B00) & 1) != 0
    || (objc_msgSend(v5, "conformsToProtocol:", &unk_1F02BB098) & 1) != 0
    || objc_msgSend(v5, "conformsToProtocol:", &unk_1F031D810))
  {
    objc_msgSend(v5, "imageLoadParamsWithImageType:", a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
