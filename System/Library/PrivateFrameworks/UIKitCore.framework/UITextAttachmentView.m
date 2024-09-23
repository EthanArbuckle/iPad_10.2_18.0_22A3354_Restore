@implementation UITextAttachmentView

- (UITextAttachmentView)initWithContentView:(id)a3
{
  id v4;
  UITextAttachmentView *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  objc_msgSend(v4, "frame");
  v8.receiver = self;
  v8.super_class = (Class)UITextAttachmentView;
  v5 = -[UIView initWithFrame:](&v8, sel_initWithFrame_, 0.0, 0.0);
  if (v5)
  {
    objc_msgSend(v4, "setAutoresizingMask:", 18);
    -[UIView addSubview:](v5, "addSubview:", v4);
    +[UIColor clearColor](UIColor, "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v6);

  }
  return v5;
}

- (UITextAttachmentView)initWithTextAttachment:(id)a3 image:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _UIAnimatedAttachmentView *v11;
  int v12;
  _UITextAttachmentPlaceholderView *v13;
  UITextAttachmentView *v14;
  UITextAttachmentView *v15;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0CEC3F8];
  objc_msgSend(v6, "fileType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_typeWithIdentifier:allowUndeclared:", v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v10, "conformsToType:", *MEMORY[0x1E0CEC4F8]) & 1) != 0
    || objc_msgSend(v10, "conformsToType:", *MEMORY[0x1E0CEC580]))
  {
    if (v7)
    {
      v11 = -[_UIAnimatedAttachmentView initWithAttachment:]([_UIAnimatedAttachmentView alloc], "initWithAttachment:", v6);
      goto LABEL_8;
    }
  }
  else
  {
    v12 = objc_msgSend(v10, "conformsToType:", *MEMORY[0x1E0CEC520]);
    if (v7 && v12)
    {
      v11 = -[UIImageView initWithImage:]([_UITextAttachmentImageView alloc], "initWithImage:", v7);
LABEL_8:
      v13 = (_UITextAttachmentPlaceholderView *)v11;
      if (v11)
        goto LABEL_10;
    }
  }
  v13 = -[UIImageView initWithImage:]([_UITextAttachmentPlaceholderView alloc], "initWithImage:", v7);
LABEL_10:
  v14 = -[UITextAttachmentView initWithContentView:](self, "initWithContentView:", v13);
  v15 = v14;
  if (v14)
    -[UITextAttachmentView setAttachment:](v14, "setAttachment:", v6);

  return v15;
}

- (id)contentView
{
  void *v2;
  void *v3;

  -[UIView subviews](self, "subviews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGSize)cellSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[UITextAttachmentView attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGPoint)cellBaselineOffset
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[UITextAttachmentView attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)drawWithFrame:(CGRect)a3 inView:(id)a4 characterIndex:(unint64_t)a5
{
  -[UITextAttachmentView drawWithFrame:inView:characterIndex:layoutManager:](self, "drawWithFrame:inView:characterIndex:layoutManager:", a4, a5, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)drawWithFrame:(CGRect)a3 inView:(id)a4 characterIndex:(unint64_t)a5 layoutManager:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD *v21;
  CGContext *v22;
  _QWORD *ContextStack;
  CGContext *v24;
  CGFloat v25;
  CGFloat v26;
  CGImage *v27;
  void *v28;
  id v29;
  CGRect v30;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v29 = a4;
  v13 = a6;
  if (pthread_main_np() == 1)
  {
    -[UIView setFrame:](self, "setFrame:", x, y, width, height);
    if (v29 && v13)
    {
      objc_msgSend(v13, "temporaryAttributesAtCharacterIndex:effectiveRange:", a5, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:", CFSTR("NSViewTextAttachmentCellHelper"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        -[UITextAttachmentView attachment](self, "attachment");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[_UITextAttachmentViewHelper helperForAttachment:](_UITextAttachmentViewHelper, "helperForAttachment:", v16);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v15, CFSTR("NSViewTextAttachmentCellHelper"), 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addTemporaryAttributes:forCharacterRange:", v17, a5, 1);

      }
      -[UIView superview](self, "superview");
      v18 = (id)objc_claimAutoreleasedReturnValue();

      if (v18 != v29)
      {
        -[UIView removeFromSuperview](self, "removeFromSuperview");
        objc_msgSend(v29, "addSubview:", self);
      }

    }
    else
    {
      ContextStack = GetContextStack(0);
      if (*(int *)ContextStack < 1)
        v24 = 0;
      else
        v24 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
      CGContextSaveGState(v24);
      CGContextTranslateCTM(v24, x, y);
      -[UIView layer](self, "layer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "renderInContext:", v24);

      CGContextRestoreGState(v24);
    }
  }
  else
  {
    -[UITextAttachmentView attachment](self, "attachment");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "image");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = GetContextStack(0);
      if (*(int *)v21 < 1)
        v22 = 0;
      else
        v22 = (CGContext *)v21[3 * (*(_DWORD *)v21 - 1) + 1];
      CGContextSaveGState(v22);
      CGContextTranslateCTM(v22, x, y + height);
      v25 = *MEMORY[0x1E0C9D538];
      v26 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      CGContextScaleCTM(v22, 1.0, -1.0);
      v27 = (CGImage *)objc_msgSend(objc_retainAutorelease(v20), "CGImage");
      v30.origin.x = v25;
      v30.origin.y = v26;
      v30.size.width = width;
      v30.size.height = height;
      CGContextDrawImage(v22, v30, v27);
      CGContextRestoreGState(v22);
    }

  }
}

- (CGRect)cellFrameForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6
{
  double y;
  double x;
  double height;
  double width;
  double v11;
  double v12;
  id v14;
  void *v15;
  double v16;
  double v17;
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
  CGRect result;

  y = a5.y;
  x = a5.x;
  height = a4.size.height;
  width = a4.size.width;
  v11 = a4.origin.y;
  v12 = a4.origin.x;
  v14 = a3;
  -[UITextAttachmentView attachment](self, "attachment");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "attachmentBoundsForTextContainer:proposedLineFragment:glyphPosition:characterIndex:", v14, a6, v12, v11, width, height, x, y);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v24 = v17;
  v25 = v19;
  v26 = v21;
  v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (NSTextAttachment)attachment
{
  return (NSTextAttachment *)objc_loadWeakRetained((id *)&self->_attachment);
}

- (void)setAttachment:(id)a3
{
  objc_storeWeak((id *)&self->_attachment, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_attachment);
}

@end
