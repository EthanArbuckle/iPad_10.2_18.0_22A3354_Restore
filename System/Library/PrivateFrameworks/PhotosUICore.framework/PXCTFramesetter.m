@implementation PXCTFramesetter

- (id)frameWithRect:(CGRect)a3 maximumLineCount:(unint64_t)a4 allowTruncation:(BOOL)a5
{
  _BOOL8 v5;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  __CTFramesetter *v12;
  const CGPath *v13;
  const __CTFrame *Frame;
  void *v15;
  void *v16;
  const __CFDictionary *v17;
  CGFloat v18;
  const CGPath *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  PXCTFrame *v23;
  int v25;
  CGFloat v26;
  __int16 v27;
  CGFloat v28;
  uint64_t v29;
  _QWORD v30[2];
  CFRange v31;
  CFRange v32;
  CFRange v33;
  CGSize v34;
  CGRect v35;
  CGRect v36;

  v5 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v30[1] = *MEMORY[0x1E0C80C00];
  -[PXCTFramesetter prepare](self, "prepare");
  v12 = -[PXCTFramesetter framesetter](self, "framesetter");
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  v13 = CGPathCreateWithRect(v35, 0);
  v31.location = 0;
  v31.length = 0;
  Frame = CTFramesetterCreateFrame(v12, v31, v13, 0);
  CFRelease(v13);
  if (!Frame)
    goto LABEL_12;
  CTFrameGetLines(Frame);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "count"))
  {
    CFRelease(Frame);
    v29 = *MEMORY[0x1E0CA8560];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v17 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    v34.height = 1.79769313e308;
    v32.location = 0;
    v32.length = 0;
    v34.width = width;
    v18 = CTFramesetterSuggestFrameSizeWithConstraints(v12, v32, v17, v34, 0).height;
    v36.origin.x = x;
    v36.origin.y = y;
    v36.size.width = width;
    v36.size.height = v18;
    v19 = CGPathCreateWithRect(v36, 0);
    PLUIGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v25 = 134218240;
      v26 = height;
      v27 = 2048;
      v28 = v18;
      _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_DEBUG, "avoid text being clipped in PXCTFramesetter by recalculating maxHeight from %f to %f", (uint8_t *)&v25, 0x16u);
    }

    v33.location = 0;
    v33.length = 0;
    Frame = CTFramesetterCreateFrame(v12, v33, v19, 0);
    CFRelease(v19);
    CTFrameGetLines(Frame);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v21, "count"))
    {
      PLUIGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25) = 0;
        _os_log_impl(&dword_1A6789000, v22, OS_LOG_TYPE_DEFAULT, "text clipped completely during layout", (uint8_t *)&v25, 2u);
      }

    }
    if (Frame)
      goto LABEL_11;
LABEL_12:
    v23 = 0;
    return v23;
  }

LABEL_11:
  v23 = -[PXCTFrame initWithFrame:maximumLineCount:allowTruncation:framesetter:]([PXCTFrame alloc], "initWithFrame:maximumLineCount:allowTruncation:framesetter:", Frame, a4, v5, self);
  CFRelease(Frame);
  -[PXCTFrame prepare](v23, "prepare");
  return v23;
}

- (void)prepare
{
  const __CFAttributedString *v3;
  NSShadow *v4;
  uint64_t v5;
  NSObject *v6;
  NSShadow *shadow;
  uint8_t v8[16];
  uint64_t v9;
  uint64_t v10;

  if (!self->_prepared)
  {
    self->_prepared = 1;
    -[PXCTFramesetter attributedString](self, "attributedString");
    v3 = (const __CFAttributedString *)objc_claimAutoreleasedReturnValue();
    self->_framesetter = CTFramesetterCreateWithAttributedString(v3);
    if (-[__CFAttributedString length](v3, "length"))
    {
      v9 = 0;
      v10 = 0;
      -[__CFAttributedString attribute:atIndex:effectiveRange:](v3, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1198], 0, &v9);
      v4 = (NSShadow *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        if (v9 || (v5 = v10, v5 != -[__CFAttributedString length](v3, "length")))
        {
          PLUIGetLog();
          v6 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v8 = 0;
            _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "Currently only supporting NSShadowAttributeName spanning the whole string", v8, 2u);
          }

          v4 = 0;
        }
      }
      shadow = self->_shadow;
      self->_shadow = v4;

    }
  }
}

- (__CTFramesetter)framesetter
{
  return self->_framesetter;
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (NSShadow)shadow
{
  return self->_shadow;
}

- (CGContext)context
{
  return self->_context;
}

- (PXCTFramesetter)initWithAttributedString:(id)a3 context:(CGContext *)a4
{
  id v6;
  PXCTFramesetter *v7;
  uint64_t v8;
  NSAttributedString *attributedString;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXCTFramesetter;
  v7 = -[PXCTFramesetter init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    attributedString = v7->_attributedString;
    v7->_attributedString = (NSAttributedString *)v8;

    v7->_context = a4;
  }

  return v7;
}

- (void)dealloc
{
  __CTFramesetter *framesetter;
  objc_super v4;

  framesetter = self->_framesetter;
  if (framesetter)
    CFRelease(framesetter);
  v4.receiver = self;
  v4.super_class = (Class)PXCTFramesetter;
  -[PXCTFramesetter dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadow, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
}

- (PXCTFramesetter)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreText+PhotosUICore.m"), 23, CFSTR("%s is not available as initializer"), "-[PXCTFramesetter init]");

  abort();
}

@end
