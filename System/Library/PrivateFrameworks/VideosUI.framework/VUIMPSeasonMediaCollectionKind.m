@implementation VUIMPSeasonMediaCollectionKind

void __VUIMPSeasonMediaCollectionKind_block_invoke()
{
  VUIMediaEntityKind *v0;
  objc_class *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v0 = [VUIMediaEntityKind alloc];
  v1 = (objc_class *)objc_opt_class();
  NSStringFromClass(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[VUIMediaEntityKind initWithMediaEntityClassName:](v0, "initWithMediaEntityClassName:", v2);
  v4 = (void *)VUIMPSeasonMediaCollectionKind_entityKind;
  VUIMPSeasonMediaCollectionKind_entityKind = v3;

  VUIMediaCollectionPropertyDescriptors();
  v12 = (id)objc_claimAutoreleasedReturnValue();
  VUIUpdateMPMediaCollectionPropertyDescriptors(v12);
  objc_msgSend(v12, "objectForKey:", CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  VUIUpdateMPSeasonMediaCollectionIdentifierPropertyDescriptor(v5);
  objc_msgSend(v12, "objectForKey:", CFSTR("title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CC1F38]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSourcePropertyNames:", v7);

  objc_msgSend(v6, "setSortAsName:", 0);
  objc_msgSend(v12, "objectForKey:", CFSTR("storeID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CC1FA8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSourcePropertyNames:", v9);

  objc_msgSend(v8, "setSourceSupportsFiltering:", 1);
  v10 = (void *)VUIMPSeasonMediaCollectionKind_entityKind;
  objc_msgSend(v12, "allValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPropertyDescriptors:", v11);

}

@end
