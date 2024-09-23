@implementation UISpringLoadedInteractionContextImpl

- (CGPoint)locationInView:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  v4 = a3;
  -[UISpringLoadedInteractionContextImpl currentRecognizer](self, "currentRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v4);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (UIDropSession)dropSession
{
  void *v2;
  void *v3;

  -[UISpringLoadedInteractionContextImpl currentRecognizer](self, "currentRecognizer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dropSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIDropSession *)v3;
}

- (id)targetItem
{
  return self->targetItem;
}

- (void)setTargetItem:(id)a3
{
  objc_storeStrong(&self->targetItem, a3);
}

- (UIView)targetView
{
  return self->targetView;
}

- (void)setTargetView:(id)a3
{
  objc_storeStrong((id *)&self->targetView, a3);
}

- (UIView)overrideTargetView
{
  return self->overrideTargetView;
}

- (void)setOverrideTargetView:(id)a3
{
  objc_storeStrong((id *)&self->overrideTargetView, a3);
}

- (id)overrideTargetItem
{
  return self->overrideTargetItem;
}

- (void)setOverrideTargetItem:(id)a3
{
  objc_storeStrong(&self->overrideTargetItem, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (UISpringLoadedGestureRecognizer)currentRecognizer
{
  return (UISpringLoadedGestureRecognizer *)objc_loadWeakRetained((id *)&self->_currentRecognizer);
}

- (void)setCurrentRecognizer:(id)a3
{
  objc_storeWeak((id *)&self->_currentRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_currentRecognizer);
  objc_storeStrong(&self->overrideTargetItem, 0);
  objc_storeStrong((id *)&self->overrideTargetView, 0);
  objc_storeStrong((id *)&self->targetView, 0);
  objc_storeStrong(&self->targetItem, 0);
}

@end
