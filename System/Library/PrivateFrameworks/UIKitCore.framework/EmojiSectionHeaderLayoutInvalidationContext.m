@implementation EmojiSectionHeaderLayoutInvalidationContext

- (void)dealloc
{
  __CFDictionary *headerWidthDict;
  objc_super v4;

  headerWidthDict = self->_headerWidthDict;
  if (headerWidthDict)
    CFRelease(headerWidthDict);
  v4.receiver = self;
  v4.super_class = (Class)EmojiSectionHeaderLayoutInvalidationContext;
  -[EmojiSectionHeaderLayoutInvalidationContext dealloc](&v4, sel_dealloc);
}

- (double)preferredWidthForHeaderInSection:(int64_t)a3
{
  __CFDictionary *headerWidthDict;
  double v5;

  headerWidthDict = self->_headerWidthDict;
  v5 = 0.0;
  if (headerWidthDict && CFDictionaryContainsKey(headerWidthDict, (const void *)a3))
    return (double)(uint64_t)CFDictionaryGetValue(self->_headerWidthDict, (const void *)a3);
  return v5;
}

- (NSIndexSet)invalidatedSections
{
  return &self->_invalidatedSections->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidatedSections, 0);
}

@end
