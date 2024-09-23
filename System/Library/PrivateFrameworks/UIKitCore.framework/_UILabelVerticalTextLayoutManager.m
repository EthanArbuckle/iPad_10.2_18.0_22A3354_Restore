@implementation _UILabelVerticalTextLayoutManager

- (_UILabelVerticalTextLayoutManager)initWithConfiguration:(id)a3
{
  double *v4;
  _UILabelVerticalTextLayoutManager *v5;
  NSTextLayoutManager *v6;
  NSTextLayoutManager *layoutManager;
  _UIVerticalTextContainer *v8;
  NSTextContainer *textContainer;
  double v10;
  NSTextContentStorage *v11;
  NSTextContentStorage *contentStorage;
  objc_super v14;

  v4 = (double *)a3;
  v14.receiver = self;
  v14.super_class = (Class)_UILabelVerticalTextLayoutManager;
  v5 = -[_UILabelVerticalTextLayoutManager init](&v14, sel_init);
  if (v5)
  {
    v6 = (NSTextLayoutManager *)objc_alloc_init((Class)off_1E1679D58);
    layoutManager = v5->_layoutManager;
    v5->_layoutManager = v6;

    v8 = objc_alloc_init(_UIVerticalTextContainer);
    textContainer = v5->_textContainer;
    v5->_textContainer = &v8->super;

    -[NSTextContainer setLineBreakMode:](v5->_textContainer, "setLineBreakMode:", 4);
    -[NSTextContainer setMaximumNumberOfLines:](v5->_textContainer, "setMaximumNumberOfLines:", objc_msgSend(v4, "numberOfLines"));
    v10 = 0.0;
    -[NSTextContainer setLineFragmentPadding:](v5->_textContainer, "setLineFragmentPadding:", 0.0);
    if (v4)
      v10 = v4[19];
    v5->_scale = v10;
    -[NSTextLayoutManager setTextContainer:](v5->_layoutManager, "setTextContainer:", v5->_textContainer);
    v11 = (NSTextContentStorage *)objc_alloc_init((Class)off_1E1679D40);
    contentStorage = v5->_contentStorage;
    v5->_contentStorage = v11;

    -[NSTextLayoutManager replaceTextContentManager:](v5->_layoutManager, "replaceTextContentManager:", v5->_contentStorage);
  }

  return v5;
}

- (CGRect)_boundingRectWithString:(id)a3 size:(CGSize)a4 options:(int64_t)a5 context:(id)a6
{
  double height;
  double width;
  double v9;
  double v10;
  NSTextLayoutManager *layoutManager;
  void *v13;
  NSTextLayoutManager *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double scale;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect result;

  height = a4.height;
  width = a4.width;
  -[NSTextContentStorage setAttributedString:](self->_contentStorage, "setAttributedString:", a3, a5, a6);
  -[NSTextContainer size](self->_textContainer, "size");
  if (v10 != width || v9 != height)
  {
    -[NSTextContainer setSize:](self->_textContainer, "setSize:", width, height);
    layoutManager = self->_layoutManager;
    -[NSTextLayoutManager documentRange](layoutManager, "documentRange");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSTextLayoutManager invalidateLayoutForRange:](layoutManager, "invalidateLayoutForRange:", v13);

  }
  v14 = self->_layoutManager;
  -[NSTextLayoutManager documentRange](v14, "documentRange");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSTextLayoutManager ensureLayoutForRange:](v14, "ensureLayoutForRange:", v15);

  -[NSTextLayoutManager usageBoundsForTextContainer](self->_layoutManager, "usageBoundsForTextContainer");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  scale = self->_scale;
  UICeilToScale(v23, scale);
  v25 = v24;
  UICeilToScale(v21, scale);
  v27 = v26;
  v28 = v17;
  v29 = v19;
  v30 = v25;
  result.size.height = v30;
  result.size.width = v27;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (CGRect)boundingRectWithString:(id)a3 size:(CGSize)a4 options:(int64_t)a5 attributes:(id)a6 context:(id)a7
{
  double height;
  double width;
  objc_class *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect result;

  height = a4.height;
  width = a4.width;
  v13 = (objc_class *)MEMORY[0x1E0CB3498];
  v14 = a7;
  v15 = a6;
  v16 = a3;
  v17 = (void *)objc_msgSend([v13 alloc], "initWithString:attributes:", v16, v15);

  -[_UILabelVerticalTextLayoutManager _boundingRectWithString:size:options:context:](self, "_boundingRectWithString:size:options:context:", v17, a5, v14, width, height);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  v26 = v19;
  v27 = v21;
  v28 = v23;
  v29 = v25;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (void)_drawWithAttributedString:(id)a3 rect:(CGRect)a4 options:(int64_t)a5 context:(id)a6
{
  CGFloat width;
  _QWORD *ContextStack;
  CGContext *v9;
  NSTextLayoutManager *layoutManager;
  id v11;
  _QWORD v12[5];

  width = a4.size.width;
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v9 = 0;
  else
    v9 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  CGContextTranslateCTM(v9, width, 0.0);
  CGContextRotateCTM(v9, 1.57079633);
  layoutManager = self->_layoutManager;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __84___UILabelVerticalTextLayoutManager__drawWithAttributedString_rect_options_context___block_invoke;
  v12[3] = &__block_descriptor_40_e30_B16__0__NSTextLayoutFragment_8l;
  v12[4] = v9;
  v11 = -[NSTextLayoutManager enumerateTextLayoutFragmentsFromLocation:options:usingBlock:](layoutManager, "enumerateTextLayoutFragmentsFromLocation:options:usingBlock:", 0, 0, v12);
}

- (void)drawWithString:(id)a3 rect:(CGRect)a4 options:(int64_t)a5 attributes:(id)a6 context:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  objc_class *v15;
  id v16;
  id v17;
  id v18;
  id v19;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v15 = (objc_class *)MEMORY[0x1E0CB3498];
  v16 = a7;
  v17 = a6;
  v18 = a3;
  v19 = (id)objc_msgSend([v15 alloc], "initWithString:attributes:", v18, v17);

  -[_UILabelVerticalTextLayoutManager _drawWithAttributedString:rect:options:context:](self, "_drawWithAttributedString:rect:options:context:", v19, a5, v16, x, y, width, height);
}

- (int64_t)lineBreakMode
{
  return self->_lineBreakMode;
}

- (void)setLineBreakMode:(int64_t)a3
{
  self->_lineBreakMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentStorage, 0);
  objc_storeStrong((id *)&self->_textContainer, 0);
  objc_storeStrong((id *)&self->_layoutManager, 0);
}

@end
