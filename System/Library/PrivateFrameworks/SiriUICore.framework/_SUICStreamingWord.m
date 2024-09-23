@implementation _SUICStreamingWord

- (_SUICStreamingWord)init
{
  _SUICStreamingWord *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)_SUICStreamingWord;
  v2 = -[_SUICStreamingWord init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setName:", CFSTR("blurFilter"));
    objc_msgSend(v4, "setValue:forKeyPath:", &unk_1E4A63130, *MEMORY[0x1E0CD2D90]);
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setFilters:", v5);

    -[_SUICStreamingWord setWordLayer:](v2, "setWordLayer:", v3);
  }
  return v2;
}

- (_SUICStreamingWord)previous
{
  return self->_previous;
}

- (void)setPrevious:(id)a3
{
  objc_storeStrong((id *)&self->_previous, a3);
}

- (int64_t)insertType
{
  return self->_insertType;
}

- (void)setInsertType:(int64_t)a3
{
  self->_insertType = a3;
}

- (_NSRange)textRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_textRange.length;
  location = self->_textRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setTextRange:(_NSRange)a3
{
  self->_textRange = a3;
}

- (NSArray)emojiRangesInText
{
  return self->_emojiRangesInText;
}

- (void)setEmojiRangesInText:(id)a3
{
  objc_storeStrong((id *)&self->_emojiRangesInText, a3);
}

- (double)glyphLocationInWordX
{
  return self->_glyphLocationInWordX;
}

- (void)setGlyphLocationInWordX:(double)a3
{
  self->_glyphLocationInWordX = a3;
}

- (CALayer)wordLayer
{
  return self->_wordLayer;
}

- (void)setWordLayer:(id)a3
{
  objc_storeStrong((id *)&self->_wordLayer, a3);
}

- (UIImage)beginImage
{
  return self->_beginImage;
}

- (void)setBeginImage:(id)a3
{
  objc_storeStrong((id *)&self->_beginImage, a3);
}

- (UIImage)endImage
{
  return self->_endImage;
}

- (void)setEndImage:(id)a3
{
  objc_storeStrong((id *)&self->_endImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endImage, 0);
  objc_storeStrong((id *)&self->_beginImage, 0);
  objc_storeStrong((id *)&self->_wordLayer, 0);
  objc_storeStrong((id *)&self->_emojiRangesInText, 0);
  objc_storeStrong((id *)&self->_previous, 0);
}

@end
