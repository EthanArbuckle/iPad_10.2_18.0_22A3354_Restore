@implementation PSPhotoUtils

void __40___PSPhotoUtils_prewarmPhotosFrameworks__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants mobileCoreDuetBundleId](_PSConstants, "mobileCoreDuetBundleId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "isEqual:", v2);

  if (v3)
    objc_msgSend(MEMORY[0x1E0D81590], "runBlockWhenDeviceIsClassCUnlocked:", &__block_literal_global_132);
}

void __40___PSPhotoUtils_prewarmPhotosFrameworks__block_invoke_2()
{
  NSObject *v0;

  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "_PSPhotoUtils prewarm", 9);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v0, &__block_literal_global_135_0);

}

void __40___PSPhotoUtils_prewarmPhotosFrameworks__block_invoke_3()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v0 = (void *)getPHPhotoLibraryClass_softClass;
  v9 = getPHPhotoLibraryClass_softClass;
  if (!getPHPhotoLibraryClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getPHPhotoLibraryClass_block_invoke;
    v5[3] = &unk_1E43FEA00;
    v5[4] = &v6;
    __getPHPhotoLibraryClass_block_invoke((uint64_t)v5);
    v0 = (void *)v7[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v6, 8);
  objc_msgSend(v1, "sharedPhotoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "isCloudPhotoLibraryEnabled");
  v3 = (void *)objc_msgSend(objc_alloc((Class)getPFSceneTaxonomyClass()), "initWithLatestTaxonomy");
  v4 = (id)objc_msgSend(v3, "digest");

}

@end
