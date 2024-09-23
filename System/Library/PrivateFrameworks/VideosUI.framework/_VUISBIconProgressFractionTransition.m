@implementation _VUISBIconProgressFractionTransition

+ (id)newTransitionToFraction:(double)a3
{
  id v4;

  v4 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "updateToFraction:", a3);
  return v4;
}

- (void)updateToFraction:(double)a3
{
  self->_targetFraction = a3;
}

- (void)updateView:(id)a3 withElapsedTime:(double)a4
{
  double v6;
  double v7;
  double targetFraction;

  v6 = a4 * 0.3;
  objc_msgSend(a3, "displayedFraction");
  targetFraction = v6 + v7;
  if (self->_targetFraction < targetFraction)
    targetFraction = self->_targetFraction;
  -[_VUISBIconProgressFractionTransition _updateView:forDisplayedFraction:](self, "_updateView:forDisplayedFraction:", a3, targetFraction);
}

- (void)completeTransitionAndUpdateView:(id)a3
{
  -[_VUISBIconProgressFractionTransition _updateView:forDisplayedFraction:](self, "_updateView:forDisplayedFraction:", a3, self->_targetFraction);
}

- (void)_updateView:(id)a3 forDisplayedFraction:(double)a4
{
  objc_msgSend(a3, "setDisplayedFraction:", a4);
  objc_msgSend(a3, "circleBoundingRect");
  objc_msgSend(a3, "setNeedsDisplayInRect:");
}

- (BOOL)isCompleteWithView:(id)a3
{
  double v4;

  objc_msgSend(a3, "displayedFraction");
  return vabdd_f64(v4, self->_targetFraction) < 2.22044605e-16;
}

@end
