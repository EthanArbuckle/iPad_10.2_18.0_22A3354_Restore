@implementation VUIMPShowMediaCollectionKind

void __VUIMPShowMediaCollectionKind_block_invoke()
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
  void *v12;
  id v13;

  v0 = [VUIMediaEntityKind alloc];
  v1 = (objc_class *)objc_opt_class();
  NSStringFromClass(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[VUIMediaEntityKind initWithMediaEntityClassName:](v0, "initWithMediaEntityClassName:", v2);
  v4 = (void *)VUIMPShowMediaCollectionKind_entityKind;
  VUIMPShowMediaCollectionKind_entityKind = v3;

  VUIMediaCollectionPropertyDescriptors();
  v13 = (id)objc_claimAutoreleasedReturnValue();
  VUIUpdateMPMediaCollectionPropertyDescriptors(v13);
  objc_msgSend(v13, "objectForKey:", CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CC1DA0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSourcePropertyNames:", v6);

  objc_msgSend(v13, "objectForKey:", CFSTR("title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CC1F48]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSourcePropertyNames:", v8);

  objc_msgSend(v7, "setSortAsName:", 0);
  objc_msgSend(v13, "objectForKey:", CFSTR("seasonCount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMPSeasonMediaCollectionIdentifier requiredMPPropertyNames](VUIMPSeasonMediaCollectionIdentifier, "requiredMPPropertyNames");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSourcePropertyNames:", v10);

  objc_msgSend(v9, "setRetrievesSourcePropertiesAtFetch:", 1);
  v11 = (void *)VUIMPShowMediaCollectionKind_entityKind;
  objc_msgSend(v13, "allValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPropertyDescriptors:", v12);

}

@end
