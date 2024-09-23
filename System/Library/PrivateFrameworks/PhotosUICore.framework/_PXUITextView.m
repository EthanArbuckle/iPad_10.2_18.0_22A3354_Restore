@implementation _PXUITextView

- (_PXUITextView)initWithFrame:(CGRect)a3
{
  _PXUITextView *v3;
  uint64_t v4;
  UITapGestureRecognizer *tapGestureRecognizer;
  uint64_t v6;
  NSMutableArray *keyCommands;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_PXUITextView;
  v3 = -[_PXUITextView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v3, sel__handleTapGesture_);
    tapGestureRecognizer = v3->_tapGestureRecognizer;
    v3->_tapGestureRecognizer = (UITapGestureRecognizer *)v4;

    -[UITapGestureRecognizer setDelegate:](v3->_tapGestureRecognizer, "setDelegate:", v3);
    -[_PXUITextView addGestureRecognizer:](v3, "addGestureRecognizer:", v3->_tapGestureRecognizer);
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
    keyCommands = v3->_keyCommands;
    v3->_keyCommands = (NSMutableArray *)v6;

    v8 = objc_alloc_init(MEMORY[0x1E0CD1210]);
    objc_msgSend(v8, "setDelegate:", v3);
    -[_PXUITextView addInteraction:](v3, "addInteraction:", v8);

  }
  return v3;
}

- (void)setEditable:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_PXUITextView;
  -[_PXUITextView setEditable:](&v8, sel_setEditable_);
  if (v3)
  {
    -[_PXUITextView tapGestureRecognizer](self, "tapGestureRecognizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = 0;
  }
  else
  {
    -[_PXUITextView setScrollEnabled:](self, "setScrollEnabled:", 0);
    -[_PXUITextView tapGestureRecognizer](self, "tapGestureRecognizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = 1;
  }
  objc_msgSend(v5, "setEnabled:", v7);

}

- (void)addKeyCommand:(id)a3
{
  -[NSMutableArray addObject:](self->_keyCommands, "addObject:", a3);
}

- (BOOL)_scribbleInteraction:(id)a3 focusWillTransformElement:(id)a4
{
  return 1;
}

- (BOOL)_scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4
{
  -[_PXUITextView setEditable:](self, "setEditable:", 1, a4.x, a4.y);
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id v5;
  unsigned __int8 v6;
  void *v7;
  objc_super v9;
  uint64_t v10;

  v4 = a3;
  -[_PXUITextView tapGestureRecognizer](self, "tapGestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v10 = 0x7FFFFFFFFFFFFFFFLL;
    -[_PXUITextView _linkTappedByGesture:charIndexAtPoint:](self, "_linkTappedByGesture:charIndexAtPoint:", v4, &v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v7 == 0;
    if (!v7 && v10 != 0x7FFFFFFFFFFFFFFFLL)
      -[_PXUITextView setSelectedRange:](self, "setSelectedRange:", v10, 0);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_PXUITextView;
    v6 = -[_PXUITextView gestureRecognizerShouldBegin:](&v9, sel_gestureRecognizerShouldBegin_, v4);

  }
  return v6;
}

- (id)keyCommands
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_PXUITextView;
  -[_PXUITextView keyCommands](&v7, sel_keyCommands);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", self->_keyCommands);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (BOOL)becomeFirstResponder
{
  objc_super v4;

  -[_PXUITextView setEditable:](self, "setEditable:", 1);
  v4.receiver = self;
  v4.super_class = (Class)_PXUITextView;
  return -[_PXUITextView becomeFirstResponder](&v4, sel_becomeFirstResponder);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  uint64_t v5;
  objc_super v6;

  if (sel_copy_ == a3)
  {
    -[_PXUITextView selectedRange](self, "selectedRange");
    return v5 != 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_PXUITextView;
    return -[_PXUITextView canPerformAction:withSender:](&v6, sel_canPerformAction_withSender_);
  }
}

- (void)_handleTapGesture:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  -[_PXUITextView tapGestureRecognizer](self, "tapGestureRecognizer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v6)
  {
    v5 = objc_msgSend(v6, "state");

    if (v5 == 3)
      -[_PXUITextView becomeFirstResponder](self, "becomeFirstResponder");
  }
  else
  {

  }
}

- (id)_linkTappedByGesture:(id)a3 charIndexAtPoint:(unint64_t *)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v15;

  v6 = a3;
  -[_PXUITextView text](self, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "length");

  if (!v8)
    goto LABEL_13;
  v15 = 0x7FFFFFFFFFFFFFFFLL;
  if (!objc_msgSend(v6, "numberOfTouches"))
    goto LABEL_6;
  objc_msgSend(v6, "locationOfTouch:inView:", 0, self);
  -[_PXUITextView _distanceFromContentToGivenPoint:charIndexAtPoint:](self, "_distanceFromContentToGivenPoint:charIndexAtPoint:", &v15);
  if ((void *)v15 == v8)
  {
    if (v9 < 8.0)
    {
      -[_PXUITextView textStorage](self, "textStorage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = *MEMORY[0x1E0DC1160];
      v13 = v15 - 1;
LABEL_10:
      objc_msgSend(v10, "attribute:atIndex:effectiveRange:", v12, v13, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_11;
    }
LABEL_6:
    v8 = 0;
    goto LABEL_11;
  }
  v8 = 0;
  if (v15 != 0x7FFFFFFFFFFFFFFFLL && v9 < 28.0)
  {
    -[_PXUITextView textStorage](self, "textStorage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = *MEMORY[0x1E0DC1160];
    v13 = v15;
    goto LABEL_10;
  }
LABEL_11:
  if (a4)
    *a4 = v15;
LABEL_13:

  return v8;
}

- (double)_distanceFromContentToGivenPoint:(CGPoint)a3 charIndexAtPoint:(unint64_t *)a4
{
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;

  if (a4)
    *a4 = 0x7FFFFFFFFFFFFFFFLL;
  -[_PXUITextView closestPositionToPoint:](self, "closestPositionToPoint:", a3.x, a3.y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[_PXUITextView beginningOfDocument](self, "beginningOfDocument");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[_PXUITextView offsetFromPosition:toPosition:](self, "offsetFromPosition:toPosition:", v7, v6);

    -[_PXUITextView layoutManager](self, "layoutManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "glyphIndexForCharacterAtIndex:", v8);
    -[_PXUITextView textContainer](self, "textContainer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "boundingRectForGlyphRange:inTextContainer:", v10, 0, v11);

    -[_PXUITextView textContainer](self, "textContainer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textContainerOrigin");

    UIDistanceBetweenPointAndRect();
    v14 = v13;
    if (a4)
      *a4 = v8;

  }
  else
  {
    v14 = 1.79769313e308;
  }

  return v14;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_keyCommands, 0);
}

@end
