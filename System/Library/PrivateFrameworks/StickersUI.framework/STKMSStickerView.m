@implementation STKMSStickerView

- (STKMSStickerView)init
{
  STKMSStickerView *v2;
  STKMSStickerView *v3;
  void *v4;
  uint64_t v5;
  UILongPressGestureRecognizer *longPressGestureRecognizer;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STKMSStickerView;
  v2 = -[STKMSStickerView init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    -[STKMSStickerView setClipsToBounds:](v2, "setClipsToBounds:", 0);
    -[STKMSStickerView layer](v3, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMasksToBounds:", 0);

    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD740]), "initWithTarget:action:", v3, sel_handleLongPress_);
    longPressGestureRecognizer = v3->_longPressGestureRecognizer;
    v3->_longPressGestureRecognizer = (UILongPressGestureRecognizer *)v5;

    -[UILongPressGestureRecognizer setDelegate:](v3->_longPressGestureRecognizer, "setDelegate:", v3);
    -[STKMSStickerView addGestureRecognizer:](v3, "addGestureRecognizer:", v3->_longPressGestureRecognizer);
  }
  return v3;
}

- (void)startAnimatingWithOffset:(double)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[MSStickerView setAnimationOffset:](self, "setAnimationOffset:", a3);
  -[MSStickerView startAnimating](self, "startAnimating");
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v6 = a4;
  v7 = a3;
  -[STKMSStickerView delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleWillDrag:", self);

  v11.receiver = self;
  v11.super_class = (Class)STKMSStickerView;
  -[MSStickerView dragInteraction:itemsForBeginningSession:](&v11, sel_dragInteraction_itemsForBeginningSession_, v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)handleTap:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  objc_super v10;
  objc_super v11;

  v4 = a3;
  -[STKMSStickerView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[STKMSStickerView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "canHandleTap");

    if (v7)
    {
      -[STKMSStickerView delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleWillTap:", self);

      v11.receiver = self;
      v11.super_class = (Class)STKMSStickerView;
      -[MSStickerView handleTap:](&v11, sel_handleTap_, v4);
      -[STKMSStickerView delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleTap:recognizer:", self, v4);

    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)STKMSStickerView;
    -[MSStickerView handleTap:](&v10, sel_handleTap_, v4);
  }

}

- (void)handleLongPress:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[STKMSStickerView delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleLongPress:recognizer:", self, v4);

}

- (void)_prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STKMSStickerView;
  -[MSStickerView _prepareForReuse](&v3, sel__prepareForReuse);
  -[MSStickerView setImageData:](self, "setImageData:", 0);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (STKMSStickerViewDelegate)delegate
{
  return (STKMSStickerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
}

@end
