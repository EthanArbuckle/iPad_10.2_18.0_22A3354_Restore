@implementation _UIViewControllerAnimatedTransitionHandoffData

- (_UIViewControllerAnimatedTransitionHandoffData)initWithFromViewControllerHandoffData:(id)a3 toViewControllerHandoffData:(id)a4 progressValue:(id)a5 isPush:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  _UIViewControllerAnimatedTransitionHandoffData *v14;
  _UIViewControllerAnimatedTransitionHandoffData *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_UIViewControllerAnimatedTransitionHandoffData;
  v14 = -[_UIViewControllerAnimatedTransitionHandoffData init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_fromViewControllerHandoffData, a3);
    objc_storeStrong((id *)&v15->_toViewControllerHandoffData, a4);
    objc_storeStrong((id *)&v15->_progressValue, a5);
    v15->_isPush = a6;
  }

  return v15;
}

- (id)handoffDataForViewController:(id)a3
{
  id v4;
  _UIViewControllerAnimatedTransitionViewControllerHandoffData **p_fromViewControllerHandoffData;
  id v6;
  _UIViewControllerAnimatedTransitionViewControllerHandoffData **p_toViewControllerHandoffData;
  _UIViewControllerAnimatedTransitionViewControllerHandoffData *toViewControllerHandoffData;
  id v9;
  _UIViewControllerAnimatedTransitionViewControllerHandoffData *v10;

  v4 = a3;
  p_fromViewControllerHandoffData = &self->_fromViewControllerHandoffData;
  -[_UIViewControllerAnimatedTransitionViewControllerHandoffData viewController](self->_fromViewControllerHandoffData, "viewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
    goto LABEL_5;
  toViewControllerHandoffData = self->_toViewControllerHandoffData;
  p_toViewControllerHandoffData = &self->_toViewControllerHandoffData;
  -[_UIViewControllerAnimatedTransitionViewControllerHandoffData viewController](toViewControllerHandoffData, "viewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v4)
  {
    p_fromViewControllerHandoffData = p_toViewControllerHandoffData;
LABEL_5:
    v10 = *p_fromViewControllerHandoffData;
    goto LABEL_6;
  }
  v10 = 0;
LABEL_6:

  return v10;
}

- (_UIViewControllerAnimatedTransitionViewControllerHandoffData)fromViewControllerHandoffData
{
  return self->_fromViewControllerHandoffData;
}

- (_UIViewControllerAnimatedTransitionViewControllerHandoffData)toViewControllerHandoffData
{
  return self->_toViewControllerHandoffData;
}

- (UIViewFloatAnimatableProperty)progressValue
{
  return self->_progressValue;
}

- (BOOL)isPush
{
  return self->_isPush;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressValue, 0);
  objc_storeStrong((id *)&self->_toViewControllerHandoffData, 0);
  objc_storeStrong((id *)&self->_fromViewControllerHandoffData, 0);
}

@end
