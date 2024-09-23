@implementation _SBIconProgressFractionTransition

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
  double v5;
  double v6;
  double targetFraction;
  id v8;

  v5 = a4 * 0.3;
  v8 = a3;
  objc_msgSend(v8, "displayedFraction");
  targetFraction = v5 + v6;
  if (self->_targetFraction < targetFraction)
    targetFraction = self->_targetFraction;
  -[_SBIconProgressFractionTransition _updateView:forDisplayedFraction:](self, "_updateView:forDisplayedFraction:", v8, targetFraction);

}

- (void)completeTransitionAndUpdateView:(id)a3
{
  -[_SBIconProgressFractionTransition _updateView:forDisplayedFraction:](self, "_updateView:forDisplayedFraction:", a3, self->_targetFraction);
}

- (void)_updateView:(id)a3 forDisplayedFraction:(double)a4
{
  id v5;

  v5 = a3;
  objc_msgSend(v5, "setDisplayedFraction:", a4);
  objc_msgSend(v5, "circleBoundingRect");
  objc_msgSend(v5, "setNeedsDisplayInRect:");

}

- (BOOL)isCompleteWithView:(id)a3
{
  objc_msgSend(a3, "displayedFraction");
  return BSFloatEqualToFloat();
}

@end
