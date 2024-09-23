@implementation WBSLogWithDifferentialPrivacy

void __WBSLogWithDifferentialPrivacy_block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  {
    v3 = (id)stringRecorderForKey(NSString *)::recorders;
  }
  else
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    stringRecorderForKey(NSString *)::recorders = (uint64_t)v3;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D328]), "initWithKey:", v2);
    objc_msgSend((id)stringRecorderForKey(NSString *)::recorders, "setObject:forKeyedSubscript:", v4, v2);
  }

  v6[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "record:", v5);

}

@end
