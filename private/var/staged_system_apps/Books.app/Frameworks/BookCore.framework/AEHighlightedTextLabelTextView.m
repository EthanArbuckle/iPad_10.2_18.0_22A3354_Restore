@implementation AEHighlightedTextLabelTextView

- (AEHighlightedTextLabelTextView)initWithFrame:(CGRect)a3
{
  AEHighlightedTextLabelTextView *v3;
  AEHighlightedTextLabelTextView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AEHighlightedTextLabelTextView;
  v3 = -[AEHighlightedTextLabelTextView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[AEHighlightedTextLabelTextView setContentMode:](v3, "setContentMode:", 3);
  return v4;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = objc_msgSend((id)objc_opt_class(self), "areAnimationsEnabled");
  objc_msgSend((id)objc_opt_class(self), "setAnimationsEnabled:", 0);
  v9.receiver = self;
  v9.super_class = (Class)AEHighlightedTextLabelTextView;
  -[AEHighlightedTextLabelTextView setFrame:](&v9, "setFrame:", x, y, width, height);
  objc_msgSend((id)objc_opt_class(self), "setAnimationsEnabled:", v8);
}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id WeakRetained;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)AEHighlightedTextLabelTextView;
  -[AEHighlightedTextLabelTextView drawRect:](&v9, "drawRect:");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "drawLabelInRect:", x, y, width, height);

}

- (AEHighlightedTextLabelTextViewDelegate)delegate
{
  return (AEHighlightedTextLabelTextViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
