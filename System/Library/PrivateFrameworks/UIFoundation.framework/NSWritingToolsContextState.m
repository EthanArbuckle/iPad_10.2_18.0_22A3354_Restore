@implementation NSWritingToolsContextState

+ (_NSRange)contextRangeForString:(id)a3 proposedRange:(_NSRange)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  _NSRange result;

  v5 = objc_msgSend(a3, "paragraphRangeForRange:", a4.location, a4.length);
  v7 = v6;
  v8 = objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  if (v5)
  {
    v9 = (void *)v8;
    v10 = v5 + v7++;
    --v5;
    while (objc_msgSend(v9, "characterIsMember:", objc_msgSend(a3, "characterAtIndex:", v5)))
    {
      ++v7;
      if (--v5 == -1)
      {
        v5 = 0;
        goto LABEL_7;
      }
    }
  }
  v10 = v7;
LABEL_7:
  v11 = objc_msgSend(a3, "paragraphRangeForRange:", v5, v10);
  result.length = v12;
  result.location = v11;
  return result;
}

- (NSWritingToolsContextState)init
{
  -[NSWritingToolsContextState doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (NSWritingToolsContextState)initWithContextString:(id)a3 contextLocation:(unint64_t)a4 proposedRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  NSWritingToolsContextState *v10;
  unint64_t v11;
  objc_super v13;

  length = a5.length;
  location = a5.location;
  v13.receiver = self;
  v13.super_class = (Class)NSWritingToolsContextState;
  v10 = -[NSWritingToolsContextState init](&v13, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(a3, "length");
    -[NSWritingToolsContextState setContextString:](v10, "setContextString:", a3);
    -[NSWritingToolsContextState setContextRange:](v10, "setContextRange:", a4, v11);
    -[NSWritingToolsContextState setProposedRange:](v10, "setProposedRange:", location, length);
    if (location > v11 || location + length > v11)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("NSWritingToolsContextState.m"), 55, CFSTR("proposedRange is not a subset of the contextRange."));
  }
  return v10;
}

- (NSWritingToolsContextState)initWithDocumentString:(id)a3 proposedRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;
  uint64_t v9;

  length = a4.length;
  location = a4.location;
  v8 = objc_msgSend((id)objc_opt_class(), "contextRangeForString:proposedRange:", objc_msgSend(a3, "string"), a4.location, a4.length);
  return -[NSWritingToolsContextState initWithContextString:contextLocation:proposedRange:](self, "initWithContextString:contextLocation:proposedRange:", objc_msgSend(a3, "attributedSubstringFromRange:", v8, v9), v8, location - v8, length);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSWritingToolsContextState;
  -[NSWritingToolsContextState dealloc](&v3, sel_dealloc);
}

- (NSAttributedString)contextString
{
  return self->_contextString;
}

- (void)setContextString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (_NSRange)contextRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_contextRange.length;
  location = self->_contextRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setContextRange:(_NSRange)a3
{
  self->_contextRange = a3;
}

- (_NSRange)proposedRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_proposedRange.length;
  location = self->_proposedRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setProposedRange:(_NSRange)a3
{
  self->_proposedRange = a3;
}

@end
