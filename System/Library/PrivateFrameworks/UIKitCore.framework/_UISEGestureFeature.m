@implementation _UISEGestureFeature

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)incorporateSample:(const _UISEGestureFeatureSample *)a3
{
  if (!self->_state)
    -[_UISEGestureFeature _incorporateSample:](self, "_incorporateSample:", a3);
}

- (void)_setState:(unint64_t)a3
{
  id WeakRetained;

  if (a3)
  {
    if (!self->_state)
    {
      self->_state = a3;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "featureDidChangeState:", self);

    }
  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)debugDictionary
{
  objc_class *v3;
  void *v4;
  unint64_t v5;
  __CFString *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_UISEGestureFeature state](self, "state");
  if (v5 > 2)
    v6 = 0;
  else
    v6 = off_1E16C8E48[v5];
  v9[0] = CFSTR("class");
  v9[1] = CFSTR("state");
  v10[0] = v4;
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (_UISEGestureFeatureDelegate)delegate
{
  return (_UISEGestureFeatureDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

@end
