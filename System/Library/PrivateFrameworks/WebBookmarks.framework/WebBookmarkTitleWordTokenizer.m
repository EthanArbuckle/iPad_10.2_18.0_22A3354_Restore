@implementation WebBookmarkTitleWordTokenizer

- (_NSRange)advanceToNextToken
{
  NSUInteger length;
  unint64_t stringLength;
  unint64_t startOfUnclassifiedRangeBeforeNextToken;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  unint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  _NSRange result;

  length = 0;
  if (self->_rangeOfNextToken.location >= self->_stringLength)
    stringLength = self->_stringLength;
  else
    stringLength = self->_rangeOfNextToken.location;
  startOfUnclassifiedRangeBeforeNextToken = self->_startOfUnclassifiedRangeBeforeNextToken;
  while (startOfUnclassifiedRangeBeforeNextToken < stringLength)
  {
    v6 = -[NSString characterAtIndex:](self->_string, "characterAtIndex:", startOfUnclassifiedRangeBeforeNextToken);
    if ((v6 & 0xFC00) == 0xD800 && self->_startOfUnclassifiedRangeBeforeNextToken + 1 < stringLength)
    {
      v7 = -[NSString characterAtIndex:](self->_string, "characterAtIndex:");
      if ((v7 & 0xFC00) == 0xDC00)
        v6 = (v7 + ((_DWORD)v6 << 10) - 56613888);
      else
        v6 = v6;
      if ((v7 & 0xFC00) == 0xDC00)
        v8 = 2;
      else
        v8 = 1;
    }
    else
    {
      v8 = 1;
    }
    if (cjkIdeographCharacterSet_once != -1)
      dispatch_once(&cjkIdeographCharacterSet_once, &__block_literal_global_12);
    v9 = objc_msgSend((id)cjkIdeographCharacterSet_cjkIdeographCharacterSet, "longCharacterIsMember:", v6);
    v10 = self->_startOfUnclassifiedRangeBeforeNextToken;
    if (v9)
      length = v8;
    startOfUnclassifiedRangeBeforeNextToken = v10 + v8;
    self->_startOfUnclassifiedRangeBeforeNextToken = v10 + v8;
    if (v9 && v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      startOfUnclassifiedRangeBeforeNextToken = v10;
      goto LABEL_25;
    }
  }
  if (startOfUnclassifiedRangeBeforeNextToken == self->_rangeOfNextToken.location)
  {
    length = self->_rangeOfNextToken.length;
    self->_rangeOfNextToken.location = -[TIWordTokenizer advanceToNextToken](self->_wordTokenizer, "advanceToNextToken");
    self->_rangeOfNextToken.length = v11;
    self->_startOfUnclassifiedRangeBeforeNextToken = length + startOfUnclassifiedRangeBeforeNextToken;
  }
  else
  {
    startOfUnclassifiedRangeBeforeNextToken = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_25:
  v12 = startOfUnclassifiedRangeBeforeNextToken;
  v13 = length;
  result.length = v13;
  result.location = v12;
  return result;
}

- (void)setString:(id)a3
{
  NSString *v4;
  NSString *v5;
  NSString *string;
  NSUInteger stringLength;
  NSUInteger v8;
  NSString *v9;

  v4 = (NSString *)a3;
  v9 = v4;
  if (self->_string == v4)
  {
    stringLength = self->_stringLength;
  }
  else
  {
    v5 = (NSString *)-[NSString copy](v4, "copy");
    string = self->_string;
    self->_string = v5;

    stringLength = -[NSString length](self->_string, "length");
    self->_stringLength = stringLength;
  }
  -[TIWordTokenizer setString:withSearchRange:](self->_wordTokenizer, "setString:withSearchRange:", v9, 0, stringLength);
  self->_rangeOfNextToken.location = -[TIWordTokenizer advanceToNextToken](self->_wordTokenizer, "advanceToNextToken");
  self->_rangeOfNextToken.length = v8;
  self->_startOfUnclassifiedRangeBeforeNextToken = 0;

}

+ (void)initialize
{
  objc_opt_class();
}

- (WebBookmarkTitleWordTokenizer)init
{
  WebBookmarkTitleWordTokenizer *v2;
  void *v3;
  objc_class *v4;
  TIWordTokenizer *v5;
  TIWordTokenizer *wordTokenizer;
  WebBookmarkTitleWordTokenizer *v7;
  objc_super v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v9.receiver = self;
  v9.super_class = (Class)WebBookmarkTitleWordTokenizer;
  v2 = -[WebBookmarkTitleWordTokenizer init](&v9, sel_init);
  if (v2)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2050000000;
    v3 = (void *)getTIWordTokenizerClass_softClass;
    v14 = getTIWordTokenizerClass_softClass;
    if (!getTIWordTokenizerClass_softClass)
    {
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __getTIWordTokenizerClass_block_invoke;
      v10[3] = &unk_24CB32F78;
      v10[4] = &v11;
      __getTIWordTokenizerClass_block_invoke((uint64_t)v10);
      v3 = (void *)v12[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v11, 8);
    v5 = (TIWordTokenizer *)objc_alloc_init(v4);
    wordTokenizer = v2->_wordTokenizer;
    v2->_wordTokenizer = v5;

    v7 = v2;
  }

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wordTokenizer, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end
