@implementation LSPropertyList

uint64_t __63__LSPropertyList_PBFAdditions__pbf_staticDescriptorIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedCompare:");
}

uint64_t __63__LSPropertyList_PBFAdditions__pbf_staticDescriptorIdentifiers__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("sort_relative_index"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "indexOfObject:", v5));
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("sort_relative_index"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "indexOfObject:", v6));
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;

  v17 = objc_msgSend(v11, "compare:", v16);
  return v17;
}

@end
