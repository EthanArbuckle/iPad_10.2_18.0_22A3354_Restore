@implementation UIKBCacheToken_KeyTemplate

+ (id)tokenTemplateForKey:(id)a3 name:(id)a4 style:(int)a5 size:(CGSize)a6
{
  CGFloat height;
  CGFloat width;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  _QWORD *v14;

  height = a6.height;
  width = a6.width;
  v10 = a4;
  v11 = a3;
  v12 = objc_alloc((Class)objc_opt_class());
  if ((a5 & 0xFFFFFFFE) == 0x6A)
    v13 = 129;
  else
    v13 = 1;
  v14 = (_QWORD *)objc_msgSend(v12, "_initWithKey:style:displayInsets:", v11, v13, 0.0, 0.0, 0.0, 0.0);

  objc_msgSend(v14, "setName:", v10);
  objc_msgSend(v14, "setEmptyFields:", 4);
  *((CGFloat *)v14 + 12) = width;
  *((CGFloat *)v14 + 13) = height;
  return v14;
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
  v8[2] = __58__UIKBCacheToken_KeyTemplate__stringWithAdditionalValues___block_invoke;
  v8[3] = &unk_1E16CD8D0;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[UIKBCacheToken stringForConstruction:](self, "stringForConstruction:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
