@implementation UIKBCacheToken_KeyMask

+ (id)tokenForKey:(id)a3 style:(id)a4 displayInsets:(UIEdgeInsets)a5
{
  double right;
  double bottom;
  double left;
  double top;
  uint64_t v9;
  id v10;
  _BYTE *v11;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  v9 = *(_QWORD *)&a4;
  v10 = a3;
  v11 = (_BYTE *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithKey:style:displayInsets:", v10, v9, top, left, bottom, right);

  v11[136] = 1;
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
  v8[2] = __54__UIKBCacheToken_KeyMask__stringWithAdditionalValues___block_invoke;
  v8[3] = &unk_1E16CD8D0;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[UIKBCacheToken stringForConstruction:](self, "stringForConstruction:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
