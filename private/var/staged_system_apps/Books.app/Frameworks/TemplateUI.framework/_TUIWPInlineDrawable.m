@implementation _TUIWPInlineDrawable

- (_TUIWPInlineDrawable)initWithContext:(id)a3 box:(id)a4 baselineOffset:(double)a5
{
  id v9;
  _TUIWPInlineDrawable *v10;
  _TUIWPInlineDrawable *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_TUIWPInlineDrawable;
  v10 = -[_TUIWPInlineDrawable initWithContext:](&v13, "initWithContext:", a3);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_box, a4);
    v11->_baselineOffset = a5;
  }

  return v11;
}

- (TUIBox)box
{
  return self->_box;
}

- (double)baselineOffset
{
  return self->_baselineOffset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_box, 0);
}

@end
