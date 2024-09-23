@implementation SXGalleryComponent

+ (id)typeString
{
  return CFSTR("gallery");
}

+ (id)valueClassBlockForPropertyWithName:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("items")) & 1) != 0)
  {
    v5 = &__block_literal_global_74;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SXGalleryComponent;
    objc_msgSendSuper2(&v7, sel_valueClassBlockForPropertyWithName_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

uint64_t __57__SXGalleryComponent_valueClassBlockForPropertyWithName___block_invoke()
{
  return objc_opt_class();
}

- (unint64_t)traits
{
  return 8;
}

@end
