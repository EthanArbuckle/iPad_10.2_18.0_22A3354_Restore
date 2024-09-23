@implementation NSArray(TextInputAdditions)

- (id)_surfaceStringWithin:()TextInputAdditions
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(a1, "subarrayWithRange:", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__NSArray_TextInputAdditions___surfaceStringWithin___block_invoke;
  v12[3] = &unk_1EA100980;
  v13 = v7;
  v9 = v7;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);

  v10 = (void *)objc_msgSend(v9, "copy");
  return v10;
}

- (id)_readingStringWithin:()TextInputAdditions
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(a1, "subarrayWithRange:", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__NSArray_TextInputAdditions___readingStringWithin___block_invoke;
  v12[3] = &unk_1EA100980;
  v13 = v7;
  v9 = v7;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);

  v10 = (void *)objc_msgSend(v9, "copy");
  return v10;
}

@end
