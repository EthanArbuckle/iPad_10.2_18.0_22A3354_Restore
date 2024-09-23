@implementation WFISImagesForIconAndDescriptorNames

uint64_t __WFISImagesForIconAndDescriptorNames_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "imageForDescriptor:", a2);
}

id __WFISImagesForIconAndDescriptorNames_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v2 = a2;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v3 = (void *)getISImageDescriptorClass_softClass;
  v11 = getISImageDescriptorClass_softClass;
  if (!getISImageDescriptorClass_softClass)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __getISImageDescriptorClass_block_invoke;
    v7[3] = &unk_1E5FC8858;
    v7[4] = &v8;
    __getISImageDescriptorClass_block_invoke((uint64_t)v7);
    v3 = (void *)v9[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v8, 8);
  objc_msgSend(v4, "imageDescriptorNamed:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
