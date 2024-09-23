@implementation _UITextInputStringTokenizerSubrange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_basePosition, 0);
  objc_storeStrong((id *)&self->_substring, 0);
}

- (_NSRange)relevantRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_relevantRange.length;
  location = self->_relevantRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRelevantRange:(_NSRange)a3
{
  self->_relevantRange = a3;
}

- (void)setIndexOfBase:(int64_t)a3
{
  self->_indexOfBase = a3;
}

+ (id)subrangeWithSubstring:(id)a3 basePosition:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  void *v9;
  id v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init((Class)a1);
  v9 = (void *)v8[1];
  v8[1] = v6;
  v10 = v6;

  v11 = (void *)v8[2];
  v8[2] = v7;

  *((_OWORD *)v8 + 2) = xmmword_186679030;
  return v8;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; basePosition = %@>"),
               objc_opt_class(),
               self,
               self->_basePosition);
}

- (NSString)substring
{
  return self->_substring;
}

- (UITextPosition)basePosition
{
  return self->_basePosition;
}

- (int64_t)indexOfBase
{
  return self->_indexOfBase;
}

@end
