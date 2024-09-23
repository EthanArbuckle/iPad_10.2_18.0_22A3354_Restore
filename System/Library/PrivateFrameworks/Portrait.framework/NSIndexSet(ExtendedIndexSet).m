@implementation NSIndexSet(ExtendedIndexSet)

- (id)allNumbers
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__NSIndexSet_ExtendedIndexSet__allNumbers__block_invoke;
  v6[3] = &unk_1E822A460;
  v7 = v2;
  v3 = v2;
  objc_msgSend(a1, "enumerateIndexesUsingBlock:", v6);
  objc_msgSend(v3, "sortUsingSelector:", sel_compare_);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

@end
