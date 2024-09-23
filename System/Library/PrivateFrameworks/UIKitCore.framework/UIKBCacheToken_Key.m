@implementation UIKBCacheToken_Key

- ($5C396DA91E87D63640AC871340DC94CC)styling
{
  return ($5C396DA91E87D63640AC871340DC94CC)*(_QWORD *)&self->_style.styling;
}

- (id)stringForRenderFlags:(int64_t)a3 lightKeyboard:(BOOL)a4
{
  _QWORD v5[6];
  BOOL v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__UIKBCacheToken_Key_stringForRenderFlags_lightKeyboard___block_invoke;
  v5[3] = &unk_1E16CD8A8;
  v6 = a4;
  v5[4] = self;
  v5[5] = a3;
  -[UIKBCacheToken_Key _stringWithAdditionalValues:](self, "_stringWithAdditionalValues:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)annotateWithInt:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKBCacheToken_Key annotateWithString:](self, "annotateWithString:", v4);

}

- (void)annotateWithString:(id)a3
{
  id v4;
  NSString *annotationString;
  NSString *v6;
  NSString *v7;
  id v8;

  v4 = a3;
  annotationString = self->_annotationString;
  v8 = v4;
  if (annotationString)
  {
    -[NSString stringByAppendingString:](annotationString, "stringByAppendingString:", v4);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (NSString *)v4;
  }
  v7 = self->_annotationString;
  self->_annotationString = v6;

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
  v8[2] = __50__UIKBCacheToken_Key__stringWithAdditionalValues___block_invoke;
  v8[3] = &unk_1E16CD8D0;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[UIKBCacheToken stringForConstruction:](self, "stringForConstruction:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)tokenForKey:(id)a3 style:(id)a4
{
  uint64_t v4;
  id v5;
  void *v6;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithKey:style:displayInsets:", v5, v4, 0.0, 0.0, 0.0, 0.0);

  return v6;
}

- (id)_initWithKey:(id)a3 style:(id)a4 displayInsets:(UIEdgeInsets)a5
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  uint64_t v9;
  id v11;
  void *v12;
  UIKBCacheToken_Key *v13;
  uint64_t v14;
  NSString *cacheDisplayString;
  uint64_t v16;
  NSString *cacheSecondaryDisplayString;
  CGFloat v18;
  CGFloat v19;
  objc_super v21;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  v9 = *(_QWORD *)&a4;
  v11 = a3;
  objc_msgSend(v11, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)UIKBCacheToken_Key;
  v13 = -[UIKBCacheToken initWithName:](&v21, sel_initWithName_, v12);

  if (v13)
  {
    *(_QWORD *)&v13->_style.styling = v9;
    v13->_style.intValue = v9 & 0xFFFFFFBF;
    objc_msgSend(v11, "cacheDisplayString");
    v14 = objc_claimAutoreleasedReturnValue();
    cacheDisplayString = v13->_cacheDisplayString;
    v13->_cacheDisplayString = (NSString *)v14;

    objc_msgSend(v11, "cacheSecondaryDisplayString");
    v16 = objc_claimAutoreleasedReturnValue();
    cacheSecondaryDisplayString = v13->_cacheSecondaryDisplayString;
    v13->_cacheSecondaryDisplayString = (NSString *)v16;

    v13->_displayTypeHint = objc_msgSend(v11, "displayTypeHint");
    v13->_displayRowHint = objc_msgSend(v11, "displayRowHint");
    objc_msgSend(v11, "paddedFrame");
    v13->_size.width = v18;
    v13->_size.height = v19;
    v13->_state = objc_msgSend(v11, "state");
    v13->_clipCorners = objc_msgSend(v11, "clipCorners");
    v13->_groupNeighbors = objc_msgSend(v11, "groupNeighbor");
    v13->_displayInsets.top = top;
    v13->_displayInsets.left = left;
    v13->_displayInsets.bottom = bottom;
    v13->_displayInsets.right = right;
  }

  return v13;
}

- (void)annotateWithBool:(BOOL)a3
{
  const __CFString *v3;

  if (a3)
    v3 = CFSTR("1");
  else
    v3 = CFSTR("0");
  -[UIKBCacheToken_Key annotateWithString:](self, "annotateWithString:", v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotationString, 0);
  objc_storeStrong((id *)&self->_cacheSecondaryDisplayString, 0);
  objc_storeStrong((id *)&self->_cacheDisplayString, 0);
}

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

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (int)rowHint
{
  return self->_displayRowHint;
}

- (void)setRowHint:(int)a3
{
  self->_displayRowHint = a3;
}

- (int)displayHint
{
  return self->_displayTypeHint;
}

- (void)setDisplayHint:(int)a3
{
  self->_displayTypeHint = a3;
}

- (void)setStyling:(id)a3
{
  *(_QWORD *)&self->_style.styling = *(_QWORD *)&a3;
}

- (BOOL)hasKey
{
  return -[UIKBCacheToken emptyFields](self, "emptyFields") < 2;
}

- (void)resetAnnotations
{
  NSString *annotationString;

  annotationString = self->_annotationString;
  self->_annotationString = 0;

}

- (id)string
{
  return -[UIKBCacheToken_Key _stringWithAdditionalValues:](self, "_stringWithAdditionalValues:", 0);
}

@end
