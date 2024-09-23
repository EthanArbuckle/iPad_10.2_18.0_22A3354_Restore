@implementation THNotesDetailTableViewCellHighlightView

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THNotesDetailTableViewCellHighlightView;
  -[THNotesDetailTableViewCellHighlightView dealloc](&v3, "dealloc");
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  int *v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  CGSize result;

  v9.receiver = self;
  v9.super_class = (Class)THNotesDetailTableViewCellHighlightView;
  -[THNotesDetailTableViewCellHighlightView intrinsicContentSize](&v9, "intrinsicContentSize");
  v4 = v3;
  if (self->mEditing)
    v5 = &OBJC_IVAR___THNotesDetailTableViewCellHighlightView_mEditingHighlightLayer;
  else
    v5 = &OBJC_IVAR___THNotesDetailTableViewCellHighlightView_mHighlightLayer;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v5), "bounds");
  v7 = v6;
  v8 = v4;
  result.height = v7;
  result.width = v8;
  return result;
}

- (void)populateWithHighlgihtLayer:(id)a3 editingHighlightLayer:(id)a4
{
  self->mHighlightLayer = (CALayer *)a3;
  objc_msgSend(-[THNotesDetailTableViewCellHighlightView layer](self, "layer"), "addSublayer:", self->mHighlightLayer);
  self->mEditingHighlightLayer = (CALayer *)a4;
  objc_msgSend(-[THNotesDetailTableViewCellHighlightView layer](self, "layer"), "addSublayer:", self->mEditingHighlightLayer);
  -[THNotesDetailTableViewCellHighlightView p_updateLayersAnimated:](self, "p_updateLayersAnimated:", 0);
  -[THNotesDetailTableViewCellHighlightView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  if (self->mEditing != a3)
  {
    self->mEditing = a3;
    -[THNotesDetailTableViewCellHighlightView p_updateLayersAnimated:](self, "p_updateLayersAnimated:", a4);
    -[THNotesDetailTableViewCellHighlightView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)p_updateLayersAnimated:(BOOL)a3
{
  double v3;
  CABasicAnimation *v5;
  double v6;
  double v7;
  CABasicAnimation *v8;
  double v9;
  double v10;
  CABasicAnimation *v11;
  CABasicAnimation *v12;
  double v13;

  if (a3)
  {
    v5 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity"));
    LODWORD(v6) = 0;
    -[CABasicAnimation setFromValue:](v5, "setFromValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6));
    LODWORD(v7) = 1.0;
    -[CABasicAnimation setToValue:](v5, "setToValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v7));
    -[CABasicAnimation setDuration:](v5, "setDuration:", 0.25);
    v8 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity"));
    LODWORD(v9) = 1.0;
    -[CABasicAnimation setFromValue:](v8, "setFromValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v9));
    LODWORD(v10) = 0;
    -[CABasicAnimation setToValue:](v8, "setToValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v10));
    -[CABasicAnimation setDuration:](v8, "setDuration:", 0.25);
    if (self->mEditing)
      v11 = v8;
    else
      v11 = v5;
    -[CALayer addAnimation:forKey:](self->mHighlightLayer, "addAnimation:forKey:", v11, CFSTR("opacity"));
    if (self->mEditing)
      v12 = v5;
    else
      v12 = v8;
    -[CALayer addAnimation:forKey:](self->mEditingHighlightLayer, "addAnimation:forKey:", v12, CFSTR("opacity"));
  }
  if (self->mEditing)
    *(float *)&v3 = 0.0;
  else
    *(float *)&v3 = 1.0;
  -[CALayer setOpacity:](self->mHighlightLayer, "setOpacity:", v3);
  if (self->mEditing)
    *(float *)&v13 = 1.0;
  else
    *(float *)&v13 = 0.0;
  -[CALayer setOpacity:](self->mEditingHighlightLayer, "setOpacity:", v13);
}

@end
