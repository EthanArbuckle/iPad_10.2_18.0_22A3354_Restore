@implementation PGGraphLanguageNodeCollection

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

+ (id)nodesWithLocaleIdentifiers:(id)a3 inGraph:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  +[PGGraphLanguageNode filterWithLocaleIdentifiers:](PGGraphLanguageNode, "filterWithLocaleIdentifiers:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSSet)locales
{
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__PGGraphLanguageNodeCollection_locales__block_invoke;
  v6[3] = &unk_1E8432EF0;
  v4 = v3;
  v7 = v4;
  -[MANodeCollection enumerateNodesUsingBlock:](self, "enumerateNodesUsingBlock:", v6);

  return (NSSet *)v4;
}

void __40__PGGraphLanguageNodeCollection_locales__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(a2, "localeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localeWithLocaleIdentifier:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
    v5 = v6;
  }

}

@end
