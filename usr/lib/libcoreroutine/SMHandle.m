@implementation SMHandle

void __58__SMHandle_RTCoreDataTransformable__createWithSMHandleMO___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "secondaryHandles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "array");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = (void *)MEMORY[0x1E0C9AA60];
  if (v3)
    v5 = (void *)v3;
  v6 = v5;

  v7 = objc_alloc(MEMORY[0x1E0D8B960]);
  objc_msgSend(*(id *)(a1 + 32), "primaryHandle");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "initWithPrimaryHandle:secondaryHandles:", v11, v6);

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

@end
