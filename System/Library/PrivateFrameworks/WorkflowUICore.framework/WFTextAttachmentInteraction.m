@implementation WFTextAttachmentInteraction

- (void)didMoveToView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id obj;

  v4 = a3;
  -[WFTextAttachmentInteraction view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTextAttachmentInteraction tapGestureRecognizer](self, "tapGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeGestureRecognizer:", v6);

  objc_storeWeak((id *)&self->_view, v4);
  obj = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel_handleTextTap_);
  objc_msgSend(obj, "setDelegate:", self);
  objc_msgSend(v4, "addGestureRecognizer:", obj);

  objc_storeWeak((id *)&self->_tapGestureRecognizer, obj);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[WFTextAttachmentInteraction view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTextAttachmentInteraction tapGestureRecognizer](self, "tapGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeGestureRecognizer:", v4);

  v5.receiver = self;
  v5.super_class = (Class)WFTextAttachmentInteraction;
  -[WFTextAttachmentInteraction dealloc](&v5, sel_dealloc);
}

- (id)layoutManager
{
  void *v2;
  void *v3;

  -[WFTextAttachmentInteraction textContainer](self, "textContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)textStorage
{
  void *v2;
  void *v3;

  -[WFTextAttachmentInteraction layoutManager](self, "layoutManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)attachmentAtPoint:(CGPoint)a3 characterRange:(_NSRange *)a4
{
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  NSUInteger v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  CGPoint v33;
  CGRect v34;

  y = a3.y;
  x = a3.x;
  -[WFTextAttachmentInteraction textContainerInset](self, "textContainerInset");
  v9 = y - v8;
  -[WFTextAttachmentInteraction textContainerInset](self, "textContainerInset");
  v11 = x - v10;
  -[WFTextAttachmentInteraction layoutManager](self, "layoutManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTextAttachmentInteraction textContainer](self, "textContainer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "characterIndexForPoint:inTextContainer:fractionOfDistanceBetweenInsertionPoints:", v13, 0, v11, v9);

  -[WFTextAttachmentInteraction layoutManager](self, "layoutManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTextAttachmentInteraction textContainer](self, "textContainer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "glyphIndexForPoint:inTextContainer:", v16, v11, v9);

  -[WFTextAttachmentInteraction textStorage](self, "textStorage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "length");

  v20 = 0;
  if (v14 < v19)
  {
    -[WFTextAttachmentInteraction textStorage](self, "textStorage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "attribute:atIndex:effectiveRange:", *MEMORY[0x24BEBB318], v14, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
      goto LABEL_6;
    -[WFTextAttachmentInteraction layoutManager](self, "layoutManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTextAttachmentInteraction textContainer](self, "textContainer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "boundingRectForGlyphRange:inTextContainer:", v17, 1, v23);
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;

    v34.origin.x = v25;
    v34.origin.y = v27;
    v34.size.width = v29;
    v34.size.height = v31;
    v33.x = v11;
    v33.y = v9;
    if (CGRectContainsPoint(v34, v33))
    {
      if (a4)
      {
        a4->location = v14;
        a4->length = 1;
      }
    }
    else
    {
LABEL_6:

      v20 = 0;
    }
  }
  return v20;
}

- (void)handleTextTap:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 3)
  {
    v12 = 0;
    v13 = 0;
    -[WFTextAttachmentInteraction view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationInView:", v5);
    v7 = v6;
    v9 = v8;

    -[WFTextAttachmentInteraction attachmentAtPoint:characterRange:](self, "attachmentAtPoint:characterRange:", &v12, v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[WFTextAttachmentInteraction delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "textAttachmentInteraction:didTapTextAttachment:inCharacterRange:", self, v10, v12, v13);

    }
  }

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v15;
  uint64_t v16;

  v15 = 0;
  v16 = 0;
  v5 = a4;
  -[WFTextAttachmentInteraction view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v6);
  v8 = v7;
  v10 = v9;

  -[WFTextAttachmentInteraction attachmentAtPoint:characterRange:](self, "attachmentAtPoint:characterRange:", &v15, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[WFTextAttachmentInteraction delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = objc_msgSend(v12, "textAttachmentInteraction:shouldRecognizeTapOnTextAttachment:inCharacterRange:", self, v11, v15, v16);
    else
      v13 = 1;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  BOOL v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  -[WFTextAttachmentInteraction tapGestureRecognizer](self, "tapGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    -[WFTextAttachmentInteraction view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "locationInView:", v10);
    v12 = v11;
    v14 = v13;

    -[WFTextAttachmentInteraction attachmentAtPoint:characterRange:](self, "attachmentAtPoint:characterRange:", 0, v12, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v15 != 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (WFTextAttachmentInteractionDelegate)delegate
{
  return (WFTextAttachmentInteractionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSTextContainer)textContainer
{
  return self->_textContainer;
}

- (void)setTextContainer:(id)a3
{
  objc_storeStrong((id *)&self->_textContainer, a3);
}

- (UIEdgeInsets)textContainerInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_textContainerInset.top;
  left = self->_textContainerInset.left;
  bottom = self->_textContainerInset.bottom;
  right = self->_textContainerInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setTextContainerInset:(UIEdgeInsets)a3
{
  self->_textContainerInset = a3;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return (UITapGestureRecognizer *)objc_loadWeakRetained((id *)&self->_tapGestureRecognizer);
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeWeak((id *)&self->_tapGestureRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tapGestureRecognizer);
  objc_storeStrong((id *)&self->_textContainer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_view);
}

@end
