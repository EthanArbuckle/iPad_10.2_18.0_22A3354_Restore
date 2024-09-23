@implementation _REUIControllerTrainingContext

- (id)elementsOrdered:(unint64_t)a3 relativeToElement:(id)a4
{
  _REUIControllerTrainingContextDelegate **p_delegate;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "elementsOrdered:relativeToElement:", a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = v8;
  else
    v9 = (void *)MEMORY[0x24BDBD1A8];
  v10 = v9;

  return v10;
}

- (BOOL)elementIsAvailable:(id)a3
{
  _REUIControllerTrainingContextDelegate **p_delegate;
  id v4;
  id WeakRetained;
  char v6;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v6 = objc_msgSend(WeakRetained, "elementIsAvailable:", v4);

  return v6;
}

- (id)interactionTypeForElement:(id)a3
{
  _REUIControllerTrainingContextDelegate **p_delegate;
  id v4;
  id WeakRetained;
  void *v6;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "interactionTypeForElement:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)maximumNegativeDwellTime
{
  return self->_maximumNegativeDwellTime;
}

- (void)setMaximumNegativeDwellTime:(double)a3
{
  self->_maximumNegativeDwellTime = a3;
}

- (double)minimumPositiveDwellTime
{
  return self->_minimumPositiveDwellTime;
}

- (void)setMinimumPositiveDwellTime:(double)a3
{
  self->_minimumPositiveDwellTime = a3;
}

- (unint64_t)onScreenElementCount
{
  return self->_onScreenElementCount;
}

- (void)setOnScreenElementCount:(unint64_t)a3
{
  self->_onScreenElementCount = a3;
}

- (_REUIControllerTrainingContextDelegate)delegate
{
  return (_REUIControllerTrainingContextDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
