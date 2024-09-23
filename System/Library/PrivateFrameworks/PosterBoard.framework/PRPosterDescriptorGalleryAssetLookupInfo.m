@implementation PRPosterDescriptorGalleryAssetLookupInfo

id __94__PRPosterDescriptorGalleryAssetLookupInfo_Project__pbf_imageFromBundle_displayContext_error___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id obj;

  objc_msgSend(MEMORY[0x1E0DC3E88], "pbf_traitCollectionForDisplayContext:", a1[4]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_assetManagerCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", a1[6]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0DC4020]);
    v6 = a1[6];
    v7 = objc_msgSend(v2, "userInterfaceIdiom");
    v8 = *(_QWORD *)(a1[8] + 8);
    obj = *(id *)(v8 + 40);
    v4 = (void *)objc_msgSend(v5, "initWithURL:idiom:error:", v6, v7, &obj);
    objc_storeStrong((id *)(v8 + 40), obj);
    objc_msgSend(v3, "setObject:forKey:", v4, a1[6]);
  }
  objc_msgSend(v4, "imageNamed:withTrait:", a1[7], v2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
