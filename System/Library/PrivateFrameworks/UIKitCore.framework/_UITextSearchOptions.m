@implementation _UITextSearchOptions

+ (id)defaultSearchOptions
{
  _UITextSearchOptions *v2;

  v2 = objc_alloc_init(_UITextSearchOptions);
  -[_UITextSearchOptions setWordMatchMethod:](v2, "setWordMatchMethod:", 0);
  -[_UITextSearchOptions setStringCompareOptions:](v2, "setStringCompareOptions:", 1);
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
    if (v6 == -[_UITextSearchOptions stringCompareOptions](self, "stringCompareOptions"))
    {
      v7 = objc_msgSend(v5, "wordMatchMethod");
      v8 = v7 == -[_UITextSearchOptions wordMatchMethod](self, "wordMatchMethod");
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

- (unint64_t)stringCompareOptions
{
  return self->_stringCompareOptions;
}

- (void)setStringCompareOptions:(unint64_t)a3
{
  self->_stringCompareOptions = a3;
}

- (int64_t)wordMatchMethod
{
  return self->_wordMatchMethod;
}

- (void)setWordMatchMethod:(int64_t)a3
{
  self->_wordMatchMethod = a3;
}

@end
