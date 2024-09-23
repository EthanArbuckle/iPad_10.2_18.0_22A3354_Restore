@implementation NSArray(SBSystemApertureAdditions)

- (id)dictionaryDescription
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v2 = objc_alloc(MEMORY[0x1E0D017C8]);
  objc_msgSend(MEMORY[0x1E0D017F0], "sortByInsertionOrder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithKeyOrderingStrategy:", v3);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__NSArray_SBSystemApertureAdditions__dictionaryDescription__block_invoke;
  v7[3] = &unk_1E8EBB9B8;
  v5 = v4;
  v8 = v5;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v7);

  return v5;
}

@end
