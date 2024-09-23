@implementation PXStoryConcreteViewChromeTitleSpec

- (PXStoryConcreteViewChromeTitleSpec)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryViewLayoutSpec.m"), 792, CFSTR("%s is not available as initializer"), "-[PXStoryConcreteViewChromeTitleSpec init]");

  abort();
}

- (PXStoryConcreteViewChromeTitleSpec)initWithNumberOfTitleLines:(int64_t)a3 numberOfSubtitleLines:(int64_t)a4 configuration:(id)a5
{
  id v8;
  PXStoryConcreteViewChromeTitleSpec *v9;
  PXStoryConcreteViewChromeTitleSpec *v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  objc_super v16;

  v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PXStoryConcreteViewChromeTitleSpec;
  v9 = -[PXStoryConcreteViewChromeTitleSpec init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_numberOfTitleLines = a3;
    v9->_numberOfSubtitleLines = a4;
    v9->_textAlignment = objc_msgSend(v8, "textAlignment");
    objc_msgSend(v8, "margins");
    v10->_margins.top = v11;
    v10->_margins.left = v12;
    v10->_margins.bottom = v13;
    v10->_margins.right = v14;
    v10->_hidden = objc_msgSend(v8, "hidden");
  }

  return v10;
}

- (int64_t)numberOfTitleLines
{
  return self->_numberOfTitleLines;
}

- (int64_t)numberOfSubtitleLines
{
  return self->_numberOfSubtitleLines;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (UIEdgeInsets)margins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_margins.top;
  left = self->_margins.left;
  bottom = self->_margins.bottom;
  right = self->_margins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)hidden
{
  return self->_hidden;
}

@end
