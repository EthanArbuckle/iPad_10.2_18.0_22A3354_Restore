@implementation UIZoomTransitionOptions

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[UIZoomTransitionOptions interactiveDismissShouldBegin](self, "interactiveDismissShouldBegin");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteractiveDismissShouldBegin:", v5);

  -[UIZoomTransitionOptions alignmentRectProvider](self, "alignmentRectProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlignmentRectProvider:", v6);

  -[UIZoomTransitionOptions dimmingColor](self, "dimmingColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDimmingColor:", v7);

  -[UIZoomTransitionOptions dimmingVisualEffect](self, "dimmingVisualEffect");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDimmingVisualEffect:", v8);

  return v4;
}

- (id)interactiveDismissShouldBegin
{
  return self->_interactiveDismissShouldBegin;
}

- (void)setInteractiveDismissShouldBegin:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)alignmentRectProvider
{
  return self->_alignmentRectProvider;
}

- (void)setAlignmentRectProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (UIColor)dimmingColor
{
  return self->_dimmingColor;
}

- (void)setDimmingColor:(id)a3
{
  objc_storeStrong((id *)&self->_dimmingColor, a3);
}

- (UIBlurEffect)dimmingVisualEffect
{
  return self->_dimmingVisualEffect;
}

- (void)setDimmingVisualEffect:(id)a3
{
  objc_storeStrong((id *)&self->_dimmingVisualEffect, a3);
}

- (BOOL)_popPreemptsPushInSwiftUIEnabled
{
  return self->__popPreemptsPushInSwiftUIEnabled;
}

- (void)set_popPreemptsPushInSwiftUIEnabled:(BOOL)a3
{
  self->__popPreemptsPushInSwiftUIEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimmingVisualEffect, 0);
  objc_storeStrong((id *)&self->_dimmingColor, 0);
  objc_storeStrong(&self->_alignmentRectProvider, 0);
  objc_storeStrong(&self->_interactiveDismissShouldBegin, 0);
}

@end
