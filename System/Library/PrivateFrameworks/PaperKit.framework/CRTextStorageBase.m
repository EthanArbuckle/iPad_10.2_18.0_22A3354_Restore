@implementation CRTextStorageBase

- (id)mutableAttributedString
{
  return 0;
}

- (id)string
{
  void *v2;
  void *v3;

  -[CRTextStorageBase mutableAttributedString](self, "mutableAttributedString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)length
{
  void *v2;
  unint64_t v3;

  -[CRTextStorageBase mutableAttributedString](self, "mutableAttributedString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  return v3;
}

- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  void *v6;
  void *v7;

  -[CRTextStorageBase mutableAttributedString](self, "mutableAttributedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributesAtIndex:effectiveRange:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)attributesAtIndex:(unint64_t)a3 longestEffectiveRange:(_NSRange *)a4 inRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  void *v9;
  void *v10;

  length = a5.length;
  location = a5.location;
  -[CRTextStorageBase mutableAttributedString](self, "mutableAttributedString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "attributesAtIndex:longestEffectiveRange:inRange:", a3, a4, location, length);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)attribute:(id)a3 atIndex:(unint64_t)a4 effectiveRange:(_NSRange *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  -[CRTextStorageBase mutableAttributedString](self, "mutableAttributedString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "attribute:atIndex:effectiveRange:", v8, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)attribute:(id)a3 atIndex:(unint64_t)a4 longestEffectiveRange:(_NSRange *)a5 inRange:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  void *v12;
  void *v13;

  length = a6.length;
  location = a6.location;
  v11 = a3;
  -[CRTextStorageBase mutableAttributedString](self, "mutableAttributedString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "attribute:atIndex:longestEffectiveRange:inRange:", v11, a4, a5, location, length);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)_shouldSetOriginalFontAttribute
{
  return 1;
}

@end
