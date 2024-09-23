@implementation ImageForItem

uint64_t __ImageForItem_block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", objc_msgSend(*(id *)(a1 + 32), "thumbnail"));
}

id __ImageForItem_block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v2 = dyld_program_sdk_at_least();
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    NewRepresentationFromPhotoAsset(v3, 2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "defaultRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "size");
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7
      || (v4 = objc_retainAutorelease(v7),
          !objc_msgSend(v5, "getBytes:fromOffset:length:error:", objc_msgSend(v4, "mutableBytes"), 0, v6, 0)))
    {

      v4 = 0;
    }

  }
  return v4;
}

id __ImageForItem_block_invoke_3(uint64_t a1)
{
  return RepresentationFromPhotoAssetURL(*(void **)(a1 + 32), 1);
}

id __ImageForItem_block_invoke_4(uint64_t a1)
{
  return RepresentationFromPhotoAssetURL(*(void **)(a1 + 32), 2);
}

@end
