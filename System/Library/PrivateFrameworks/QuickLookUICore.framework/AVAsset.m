@implementation AVAsset

void __64__AVAsset__QLUtilities__assetIsAutoloopMedia_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  v2 = (void *)MEMORY[0x1E0C8B220];
  objc_msgSend(*(id *)(a1 + 32), "metadataForFormat:", *MEMORY[0x1E0C8A910]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadataItemsFromArray:withKey:keySpace:", v3, CFSTR("LOOP"), *MEMORY[0x1E0C8A9F0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    v8 = 0;
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v8, 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "isEqualToData:", v7);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
