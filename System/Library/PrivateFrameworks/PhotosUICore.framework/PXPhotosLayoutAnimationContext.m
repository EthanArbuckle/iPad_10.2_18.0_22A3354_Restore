@implementation PXPhotosLayoutAnimationContext

- (id)copyWithZone:(_NSZone *)a3
{
  PXPhotosLayoutAnimationContext *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc_init(PXPhotosLayoutAnimationContext);
  -[PXPhotosLayoutAnimationContext fromState](self, "fromState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[PXPhotosLayoutAnimationContext setFromState:](v4, "setFromState:", v6);

  -[PXPhotosLayoutAnimationContext toState](self, "toState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[PXPhotosLayoutAnimationContext setToState:](v4, "setToState:", v8);

  return v4;
}

- (PXPhotosLayoutState)fromState
{
  return self->_fromState;
}

- (void)setFromState:(id)a3
{
  objc_storeStrong((id *)&self->_fromState, a3);
}

- (PXPhotosLayoutState)toState
{
  return self->_toState;
}

- (void)setToState:(id)a3
{
  objc_storeStrong((id *)&self->_toState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toState, 0);
  objc_storeStrong((id *)&self->_fromState, 0);
}

@end
