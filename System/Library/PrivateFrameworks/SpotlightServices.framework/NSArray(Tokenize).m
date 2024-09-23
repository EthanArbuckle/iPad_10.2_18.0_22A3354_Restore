@implementation NSArray(Tokenize)

- (id)tokenizedStringArray:()Tokenize
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __42__NSArray_Tokenize__tokenizedStringArray___block_invoke;
  v11[3] = &unk_1E6E452C8;
  v6 = v5;
  v12 = v6;
  v13 = v4;
  v7 = v4;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v11);
  v8 = v13;
  v9 = v6;

  return v9;
}

@end
