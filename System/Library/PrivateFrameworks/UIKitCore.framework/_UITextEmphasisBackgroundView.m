@implementation _UITextEmphasisBackgroundView

- (_UITextEmphasisBackgroundView)initWithTextView:(id)a3
{
  id v4;
  _UITextEmphasisBackgroundView *v5;
  _UITextEmphasisBackgroundView *v6;
  objc_super v8;

  v4 = a3;
  objc_msgSend(v4, "bounds");
  v8.receiver = self;
  v8.super_class = (Class)_UITextEmphasisBackgroundView;
  v5 = -[UIView initWithFrame:](&v8, sel_initWithFrame_);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_textView, v4);
    -[UIView setUserInteractionEnabled:](v6, "setUserInteractionEnabled:", 0);
    -[UIView setClipsToBounds:](v6, "setClipsToBounds:", 1);
    -[UIView setAutoresizingMask:](v6, "setAutoresizingMask:", 18);
    -[UIView setOpaque:](v6, "setOpaque:", 0);
  }

  return v6;
}

- (BOOL)shouldBeArchived
{
  return 0;
}

- (void)drawRect:(CGRect)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  objc_msgSend(WeakRetained, "drawTextHighlightBackgroundForTextRange:origin:", self->_textRange, self->_origin.x, self->_origin.y);

}

- (NSTextRange)textRange
{
  return (NSTextRange *)objc_getProperty(self, a2, 424, 1);
}

- (void)setTextRange:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 424);
}

- (CGPoint)origin
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_origin, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setOrigin:(CGPoint)a3
{
  CGPoint v3;

  v3 = a3;
  objc_copyStruct(&self->_origin, &v3, 16, 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textRange, 0);
  objc_destroyWeak((id *)&self->_textView);
}

@end
