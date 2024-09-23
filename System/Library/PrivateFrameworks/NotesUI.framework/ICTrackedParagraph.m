@implementation ICTrackedParagraph

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSRange v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[ICTrackedParagraph paragraph](self, "paragraph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8.location = -[ICTrackedParagraph characterRange](self, "characterRange");
  NSStringFromRange(v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<ICTrackedParagraph %p %@ %@>"), self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (ICTTParagraphStyle)paragraph
{
  return self->_paragraph;
}

- (void)setParagraph:(id)a3
{
  objc_storeStrong((id *)&self->_paragraph, a3);
}

- (_NSRange)characterRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_characterRange.length;
  location = self->_characterRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setCharacterRange:(_NSRange)a3
{
  self->_characterRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paragraph, 0);
}

@end
