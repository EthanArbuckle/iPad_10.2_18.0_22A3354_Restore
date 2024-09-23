@implementation UIImagePNGRepresentation

void __UIImagePNGRepresentation_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0CBD008];
  v6[0] = &unk_1E1A96678;
  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = a2;
  objc_msgSend(v2, "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0CBD028]);

  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E1A96690, *MEMORY[0x1E0CBCFF8]);
}

@end
