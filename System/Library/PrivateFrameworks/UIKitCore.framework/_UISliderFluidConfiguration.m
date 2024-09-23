@implementation _UISliderFluidConfiguration

- (_UISliderFluidConfiguration)init
{
  _UISliderFluidConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UISliderFluidConfiguration;
  result = -[_UISliderFluidConfiguration init](&v3, sel_init);
  if (result)
    *(_OWORD *)&result->_expansionFactor = xmmword_18667AC00;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;
  id WeakRetained;
  id v7;
  id v8;
  id v9;
  id v10;

  v5 = (id *)objc_alloc_init((Class)objc_opt_class());
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_storeWeak(v5 + 2, WeakRetained);

  v5[3] = *(id *)&self->_expansionFactor;
  v5[4] = *(id *)&self->_stretchLimit;
  objc_storeStrong(v5 + 5, self->_minimumValueView);
  objc_storeStrong(v5 + 6, self->_maximumValueView);
  v7 = -[UIVisualEffect copyWithZone:](self->_minimumTrackEffect, "copyWithZone:", a3);
  v8 = v5[7];
  v5[7] = v7;

  v9 = -[UIVisualEffect copyWithZone:](self->_maximumTrackEffect, "copyWithZone:", a3);
  v10 = v5[8];
  v5[8] = v9;

  *((_BYTE *)v5 + 8) = self->_disableAllSliderVisuals;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _UISliderFluidConfiguration *v4;
  _UISliderFluidConfiguration *v5;
  id WeakRetained;
  id v7;
  BOOL v8;
  objc_super v10;

  v4 = (_UISliderFluidConfiguration *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)_UISliderFluidConfiguration;
    if (-[_UISliderFluidConfiguration isEqual:](&v10, sel_isEqual_, v4))
    {
      v5 = v4;
      WeakRetained = objc_loadWeakRetained((id *)&v5->_delegate);
      v7 = objc_loadWeakRetained((id *)&self->_delegate);
      v8 = WeakRetained == v7
        && v5->_expansionFactor == self->_expansionFactor
        && v5->_stretchLimit == self->_stretchLimit
        && v5->_minimumValueView == self->_minimumValueView
        && v5->_maximumValueView == self->_maximumValueView
        && -[UIVisualEffect isEqual:](v5->_minimumTrackEffect, "isEqual:", self->_minimumTrackEffect)
        && -[UIVisualEffect isEqual:](v5->_maximumTrackEffect, "isEqual:", self->_maximumTrackEffect)
        && v5->_disableAllSliderVisuals == self->_disableAllSliderVisuals;

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (void)_setMinimumTrackBlurEffect:(id)a3
{
  UIVisualEffect *v5;
  UIVisualEffect **p_maximumTrackEffect;
  UIVisualEffect *maximumTrackEffect;
  UIVisualEffect *v8;

  v5 = (UIVisualEffect *)a3;
  maximumTrackEffect = self->_maximumTrackEffect;
  p_maximumTrackEffect = &self->_maximumTrackEffect;
  if (maximumTrackEffect != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_maximumTrackEffect, a3);
    v5 = v8;
  }

}

- (UIBlurEffect)minimumTrackBlurEffect
{
  UIVisualEffect *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self->_maximumTrackEffect;
  else
    v3 = 0;
  return (UIBlurEffect *)v3;
}

- (void)_setMaximumTrackBlurEffect:(id)a3
{
  UIVisualEffect *v5;
  UIVisualEffect **p_minimumTrackEffect;
  UIVisualEffect *minimumTrackEffect;
  UIVisualEffect *v8;

  v5 = (UIVisualEffect *)a3;
  minimumTrackEffect = self->_minimumTrackEffect;
  p_minimumTrackEffect = &self->_minimumTrackEffect;
  if (minimumTrackEffect != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_minimumTrackEffect, a3);
    v5 = v8;
  }

}

- (UIBlurEffect)maximumTrackBlurEffect
{
  UIVisualEffect *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self->_minimumTrackEffect;
  else
    v3 = 0;
  return (UIBlurEffect *)v3;
}

- (_UISliderFluidInteractionDelegate)delegate
{
  return (_UISliderFluidInteractionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)expansionFactor
{
  return self->_expansionFactor;
}

- (void)setExpansionFactor:(double)a3
{
  self->_expansionFactor = a3;
}

- (double)stretchLimit
{
  return self->_stretchLimit;
}

- (void)setStretchLimit:(double)a3
{
  self->_stretchLimit = a3;
}

- (UIView)minimumValueView
{
  return self->_minimumValueView;
}

- (void)setMinimumValueView:(id)a3
{
  objc_storeStrong((id *)&self->_minimumValueView, a3);
}

- (UIView)maximumValueView
{
  return self->_maximumValueView;
}

- (void)setMaximumValueView:(id)a3
{
  objc_storeStrong((id *)&self->_maximumValueView, a3);
}

- (UIVisualEffect)minimumTrackEffect
{
  return self->_minimumTrackEffect;
}

- (void)setMinimumTrackEffect:(id)a3
{
  objc_storeStrong((id *)&self->_minimumTrackEffect, a3);
}

- (UIVisualEffect)maximumTrackEffect
{
  return self->_maximumTrackEffect;
}

- (void)setMaximumTrackEffect:(id)a3
{
  objc_storeStrong((id *)&self->_maximumTrackEffect, a3);
}

- (BOOL)disableAllSliderVisuals
{
  return self->_disableAllSliderVisuals;
}

- (void)setDisableAllSliderVisuals:(BOOL)a3
{
  self->_disableAllSliderVisuals = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumTrackEffect, 0);
  objc_storeStrong((id *)&self->_minimumTrackEffect, 0);
  objc_storeStrong((id *)&self->_maximumValueView, 0);
  objc_storeStrong((id *)&self->_minimumValueView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
