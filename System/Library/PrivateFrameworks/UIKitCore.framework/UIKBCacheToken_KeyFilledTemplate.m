@implementation UIKBCacheToken_KeyFilledTemplate

+ (id)tokenTemplateFilledForKey:(id)a3 style:(int)a4 size:(CGSize)a5
{
  CGFloat height;
  CGFloat width;
  id v8;
  id v9;
  uint64_t v10;
  _QWORD *v11;

  height = a5.height;
  width = a5.width;
  v8 = a3;
  v9 = objc_alloc((Class)objc_opt_class());
  if ((a4 & 0xFFFFFFFE) == 0x6A)
    v10 = 129;
  else
    v10 = 1;
  v11 = (_QWORD *)objc_msgSend(v9, "_initWithKey:style:displayInsets:", v8, v10, 0.0, 0.0, 0.0, 0.0);

  objc_msgSend(v11, "setEmptyFields:", 1);
  *((CGFloat *)v11 + 12) = width;
  *((CGFloat *)v11 + 13) = height;
  return v11;
}

- (id)_stringWithAdditionalValues:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__UIKBCacheToken_KeyFilledTemplate__stringWithAdditionalValues___block_invoke;
  v8[3] = &unk_1E16CD8D0;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[UIKBCacheToken stringForConstruction:](self, "stringForConstruction:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
