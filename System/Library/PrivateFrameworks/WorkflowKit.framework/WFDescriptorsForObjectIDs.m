@implementation WFDescriptorsForObjectIDs

id __WFDescriptorsForObjectIDs_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;

  v3 = a2;
  objc_msgSend(v3, "entity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = WFDatabaseObjectTypeForEntityName(v5);

  if (v6 <= 0xA && ((0x6FFu >> v6) & 1) != 0)
  {
    v8 = off_1E7AF2FC8[v6];
    objc_msgSend(*(id *)(a1 + 32), "objectWithID:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valueForKey:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7AA8]), "initWithIdentifier:objectType:", v10, v6);
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
