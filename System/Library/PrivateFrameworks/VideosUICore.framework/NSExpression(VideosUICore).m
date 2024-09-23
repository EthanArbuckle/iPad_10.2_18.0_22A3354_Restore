@implementation NSExpression(VideosUICore)

- (BOOL)vui_isKeyPathBitTestExpression
{
  void *v2;
  _BOOL8 v3;

  if (objc_msgSend(a1, "expressionType") != 19)
    return 0;
  objc_msgSend(a1, "expressionBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == (void *)__keyPathBitTestExpressionBlock;

  return v3;
}

+ (id)vui_keyPathBitTestExpressionWithKeyPath:()VideosUICore value:
{
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v5 = vui_keyPathBitTestExpressionWithKeyPath_value____onceToken;
  v6 = a4;
  v7 = a3;
  if (v5 != -1)
    dispatch_once(&vui_keyPathBitTestExpressionWithKeyPath_value____onceToken, &__block_literal_global_14);
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB35D0];
  v11 = __keyPathBitTestExpressionBlock;
  v15[0] = v8;
  v15[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "expressionForBlock:arguments:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
