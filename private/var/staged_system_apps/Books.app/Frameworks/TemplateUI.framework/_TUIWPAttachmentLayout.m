@implementation _TUIWPAttachmentLayout

- (_TUIWPAttachmentLayout)initWithLayout:(id)a3 baselineOffset:(double)a4 intrinsic:(BOOL)a5 charIndex:(unint64_t)a6
{
  _BOOL4 v7;
  id v11;
  _TUIWPAttachmentLayout *v12;
  _TUIWPAttachmentLayout *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  id v19;
  objc_super v21[3];
  objc_super v22;

  v7 = a5;
  v11 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_TUIWPAttachmentLayout;
  v12 = -[_TUIWPAttachmentLayout initWithInfo:](&v22, "initWithInfo:", 0);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_layout, a3);
    v13->_baselineOffset = a4;
    v13->_charIndex = a6;
    if (v7)
      objc_msgSend(v11, "validatedIntrinsicSize");
    else
      objc_msgSend(v11, "computedNaturalSize");
    v16 = v14;
    v17 = v15;
    v18 = objc_alloc((Class)TSDLayoutGeometry);
    if (v11)
      objc_msgSend(v11, "computedTransform");
    else
      memset(v21, 0, sizeof(v21));
    v19 = objc_msgSend(v18, "initWithSize:transform:", v21, v16, v17);
    -[_TUIWPAttachmentLayout setGeometry:](v13, "setGeometry:", v19);

  }
  return v13;
}

- (double)inlineVerticalOffset
{
  double v3;
  double v4;
  double v5;

  -[TUILayout computedNaturalSize](self->_layout, "computedNaturalSize");
  v4 = v3;
  -[TUILayout computedHeightAbovePivot](self->_layout, "computedHeightAbovePivot");
  return v4 - v5 - self->_baselineOffset;
}

- (TUILayout)layout
{
  return self->_layout;
}

- (unint64_t)charIndex
{
  return self->_charIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
}

@end
