@implementation TextFirstLineCharacterRangeFinder

- (TextFirstLineCharacterRangeFinder)init
{
  TextFirstLineCharacterRangeFinder *v2;
  NSLayoutManager *v3;
  NSLayoutManager *layoutManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TextFirstLineCharacterRangeFinder;
  v2 = -[TextFirstLineCharacterRangeFinder init](&v6, "init");
  if (v2)
  {
    v3 = (NSLayoutManager *)objc_alloc_init((Class)NSLayoutManager);
    layoutManager = v2->_layoutManager;
    v2->_layoutManager = v3;

  }
  return v2;
}

- (void)setTextSize:(CGSize)a3
{
  NSAttributedString *cachedAttributedString;
  NSArray *cachedRanges;
  NSTextContainer *textContainer;
  NSTextContainer *v8;
  NSTextContainer *v9;

  if (self->_textSize.width != a3.width || self->_textSize.height != a3.height)
  {
    self->_textSize = a3;
    cachedAttributedString = self->_cachedAttributedString;
    self->_cachedAttributedString = 0;

    cachedRanges = self->_cachedRanges;
    self->_cachedRanges = 0;

    textContainer = self->_textContainer;
    if (textContainer)
    {
      -[NSTextContainer setSize:](textContainer, "setSize:", self->_textSize.width, self->_textSize.height);
    }
    else
    {
      v8 = (NSTextContainer *)objc_msgSend(objc_alloc((Class)NSTextContainer), "initWithSize:", self->_textSize.width, self->_textSize.height);
      v9 = self->_textContainer;
      self->_textContainer = v8;

      -[NSTextContainer setLineFragmentPadding:](self->_textContainer, "setLineFragmentPadding:", 0.0);
      -[NSLayoutManager addTextContainer:](self->_layoutManager, "addTextContainer:", self->_textContainer);
    }
  }
}

- (id)lineRangesForText:(id)a3
{
  id v5;
  NSTextStorage *textStorage;
  NSTextStorage *v7;
  NSTextStorage *v8;
  id v9;
  NSUInteger v10;
  NSMutableArray *v11;
  NSUInteger v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  NSArray *cachedRanges;
  NSArray *v19;
  uint64_t v21;
  uint64_t v22;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_cachedAttributedString) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_cachedAttributedString, a3);
    textStorage = self->_textStorage;
    if (textStorage)
    {
      if (self->_cachedAttributedString)
        -[NSTextStorage setAttributedString:](textStorage, "setAttributedString:");
    }
    else
    {
      v7 = (NSTextStorage *)objc_msgSend(objc_alloc((Class)NSTextStorage), "initWithAttributedString:", self->_cachedAttributedString);
      v8 = self->_textStorage;
      self->_textStorage = v7;

      -[NSTextStorage addLayoutManager:](self->_textStorage, "addLayoutManager:", self->_layoutManager);
    }
    v9 = objc_msgSend(v5, "length");
    v10 = -[NSLayoutManager numberOfGlyphs](self->_layoutManager, "numberOfGlyphs");
    v11 = objc_opt_new(NSMutableArray);
    v21 = 0;
    v22 = 0;
    if (v10)
    {
      v12 = 0;
      do
      {
        -[NSLayoutManager lineFragmentRectForGlyphAtIndex:effectiveRange:](self->_layoutManager, "lineFragmentRectForGlyphAtIndex:effectiveRange:", v12, &v21);
        v12 = v22 + v21;
        v13 = -[NSLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self->_layoutManager, "characterRangeForGlyphRange:actualGlyphRange:");
        v15 = -[TextFirstLineCharacterRangeFinder _assertRange:isIncludedInRange:](self, "_assertRange:isIncludedInRange:", v13, v14, 0, v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithRange:](NSValue, "valueWithRange:", v15, v16));
        -[NSMutableArray addObject:](v11, "addObject:", v17);

      }
      while (v12 < v10);
    }
    cachedRanges = self->_cachedRanges;
    self->_cachedRanges = &v11->super;

  }
  v19 = self->_cachedRanges;

  return v19;
}

- (_NSRange)_assertRange:(_NSRange)a3 isIncludedInRange:(_NSRange)a4
{
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  if (a3.location <= a4.location)
    location = a4.location;
  else
    location = a3.location;
  if (location + a3.length <= a4.location + a4.length)
    length = a3.length;
  else
    length = a4.location + a4.length - location;
  result.length = length;
  result.location = location;
  return result;
}

- (_NSRange)firstLineCharacterRangeInText:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TextFirstLineCharacterRangeFinder lineRangesForText:](self, "lineRangesForText:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
  v5 = objc_msgSend(v4, "rangeValue");
  v7 = v6;

  v8 = (NSUInteger)v5;
  v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

- (_NSRange)lastLineCharacterRangeInText:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TextFirstLineCharacterRangeFinder lineRangesForText:](self, "lineRangesForText:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastObject"));
  v5 = objc_msgSend(v4, "rangeValue");
  v7 = v6;

  v8 = (NSUInteger)v5;
  v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

- (CGSize)textSize
{
  double width;
  double height;
  CGSize result;

  width = self->_textSize.width;
  height = self->_textSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textContainer, 0);
  objc_storeStrong((id *)&self->_layoutManager, 0);
  objc_storeStrong((id *)&self->_textStorage, 0);
  objc_storeStrong((id *)&self->_cachedRanges, 0);
  objc_storeStrong((id *)&self->_cachedAttributedString, 0);
}

@end
