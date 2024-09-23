@implementation SKUIResourceImageSetRegisterWithBundleAlwaysTemplate

void __SKUIResourceImageSetRegisterWithBundleAlwaysTemplate_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  SKUIExternalResourceImage *v7;

  v5 = a3;
  v6 = a2;
  v7 = objc_alloc_init(SKUIExternalResourceImage);
  -[SKUIExternalResourceImage setImageName:](v7, "setImageName:", v5);

  -[SKUIExternalResourceImage setBundle:](v7, "setBundle:", *(_QWORD *)(a1 + 32));
  -[SKUIExternalResourceImage setAlwaysTemplate:](v7, "setAlwaysTemplate:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend((id)__ExternalResources, "setObject:forKey:", v7, v6);

}

@end
