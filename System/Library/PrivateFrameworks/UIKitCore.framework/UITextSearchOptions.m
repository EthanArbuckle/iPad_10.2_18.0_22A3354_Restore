@implementation UITextSearchOptions

+ (id)defaultSearchOptions
{
  UITextSearchOptions *v2;

  v2 = objc_alloc_init(UITextSearchOptions);
  -[UITextSearchOptions setWordMatchMethod:](v2, "setWordMatchMethod:", 0);
  -[UITextSearchOptions setStringCompareOptions:](v2, "setStringCompareOptions:", 129);
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "stringCompareOptions");
    if (v6 == -[UITextSearchOptions stringCompareOptions](self, "stringCompareOptions"))
    {
      v7 = objc_msgSend(v5, "wordMatchMethod");
      v8 = v7 == -[UITextSearchOptions wordMatchMethod](self, "wordMatchMethod");
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSStringCompareOptions)stringCompareOptions
{
  return self->_stringCompareOptions;
}

- (void)setStringCompareOptions:(unint64_t)a3
{
  self->_stringCompareOptions = a3;
}

- (UITextSearchMatchMethod)wordMatchMethod
{
  return self->_wordMatchMethod;
}

- (void)setWordMatchMethod:(int64_t)a3
{
  self->_wordMatchMethod = a3;
}

@end
