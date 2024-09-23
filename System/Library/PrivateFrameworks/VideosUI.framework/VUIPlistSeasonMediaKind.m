@implementation VUIPlistSeasonMediaKind

void __VUIPlistSeasonMediaKind_block_invoke()
{
  VUIMediaEntityKind *v0;
  objc_class *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v0 = [VUIMediaEntityKind alloc];
  v1 = (objc_class *)objc_opt_class();
  NSStringFromClass(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[VUIMediaEntityKind initWithMediaEntityClassName:](v0, "initWithMediaEntityClassName:", v2);
  v4 = (void *)VUIPlistSeasonMediaKind_entityKind;
  VUIPlistSeasonMediaKind_entityKind = v3;

  VUIMediaCollectionPropertyDescriptors();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)VUIPlistSeasonMediaKind_entityKind;
  objc_msgSend(v7, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPropertyDescriptors:", v6);

}

@end
