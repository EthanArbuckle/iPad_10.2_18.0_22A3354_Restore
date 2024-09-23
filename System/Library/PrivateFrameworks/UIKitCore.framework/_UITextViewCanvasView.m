@implementation _UITextViewCanvasView

- (_NSRange)_extendedGlyphRangeForRange:(_NSRange)a3 maxGlyphIndex:(unint64_t)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v7;
  void *v8;
  void *v9;
  NSRange v10;
  void *v11;
  NSRange v12;
  NSRange v13;
  NSUInteger v14;
  void *v15;
  NSRange v16;
  unint64_t v17;
  NSUInteger v18;
  NSUInteger v19;
  NSRange v20;
  NSRange v21;
  NSRange v22;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  -[_UITextCanvasView context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (location)
  {
    v20.location = 0;
    v20.length = 0;
    objc_msgSend(v8, "lineFragmentRectForGlyphAtIndex:effectiveRange:", location, &v20);
    v21.location = location;
    v21.length = length;
    v10 = NSUnionRange(v21, v20);
    location = v10.location;
    length = v10.length;
    if (v10.location)
    {
      objc_msgSend(v8, "lineFragmentRectForGlyphAtIndex:effectiveRange:", v10.location - 1, &v20);
      objc_msgSend(v8, "textContainerForGlyphAtIndex:effectiveRange:", v20.location, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11 == v9)
      {
        v12 = NSUnionRange(v10, v20);
        location = v12.location;
        length = v12.length;
      }
    }
  }
  if (length)
  {
    if (location + length < a4)
    {
      v20 = (NSRange)0;
      objc_msgSend(v8, "lineFragmentRectForGlyphAtIndex:effectiveRange:", location + length - 1, &v20);
      v22.location = location;
      v22.length = length;
      v13 = NSUnionRange(v22, v20);
      location = v13.location;
      length = v13.length;
      v14 = v13.location + v13.length;
      if (v13.location + v13.length < a4)
      {
        objc_msgSend(v8, "lineFragmentRectForGlyphAtIndex:effectiveRange:", v14, &v20);
        objc_msgSend(v8, "textContainerForGlyphAtIndex:effectiveRange:", v14, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15 == v9)
        {
          v16 = NSUnionRange(v13, v20);
          location = v16.location;
          length = v16.length;
        }
      }
    }
  }
  if (location + length <= a4)
    v17 = length;
  else
    v17 = a4 - location;

  v18 = location;
  v19 = v17;
  result.length = v19;
  result.location = v18;
  return result;
}

- (void)drawTextInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  _UITextViewCanvasView *v21;
  _QWORD *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  _QWORD v27[4];
  uint64_t v28;
  uint64_t v29;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UITextCanvasView context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "layoutManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textContainer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_ensureLayoutCompleteForRect:", x, y, width, height);
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x3010000000;
    v28 = 0;
    v29 = 0;
    v27[3] = &unk_18685B0AF;
    objc_msgSend(v9, "textContainerOrigin");
    v28 = v12;
    v29 = v13;
    objc_msgSend(v10, "textStorage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __40___UITextViewCanvasView_drawTextInRect___block_invoke;
    v17[3] = &unk_1E16E5F38;
    v23 = x;
    v24 = y;
    v25 = width;
    v26 = height;
    v22 = v27;
    v15 = v10;
    v18 = v15;
    v16 = v11;
    v19 = v16;
    v20 = v9;
    v21 = self;
    objc_msgSend(v14, "coordinateReading:", v17);

    _Block_object_dispose(v27, 8);
  }

}

@end
