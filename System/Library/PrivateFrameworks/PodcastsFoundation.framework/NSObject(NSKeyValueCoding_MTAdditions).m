@implementation NSObject(NSKeyValueCoding_MTAdditions)

- (id)mt_dictionaryWithValuesForKeyPaths:()NSKeyValueCoding_MTAdditions
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__NSObject_NSKeyValueCoding_MTAdditions__mt_dictionaryWithValuesForKeyPaths___block_invoke;
  v7[3] = &unk_1E54D12B8;
  v7[4] = a1;
  v3 = a3;
  objc_msgSend(v3, "mt_compactMap:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
