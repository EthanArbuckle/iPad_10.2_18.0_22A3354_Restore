@implementation SBInvalidateContinuousExposeIdentifiersEventResponse

- (SBInvalidateContinuousExposeIdentifiersEventResponse)initWithTransitioningFromAppLayout:(id)a3 transitioningToAppLayout:(id)a4 animated:(BOOL)a5
{
  id v9;
  id v10;
  SBInvalidateContinuousExposeIdentifiersEventResponse *v11;
  SBInvalidateContinuousExposeIdentifiersEventResponse *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBInvalidateContinuousExposeIdentifiersEventResponse;
  v11 = -[SBChainableModifierEventResponse init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_transitioningFromAppLayout, a3);
    objc_storeStrong((id *)&v12->_transitioningToAppLayout, a4);
    v12->_animated = a5;
  }

  return v12;
}

- (int64_t)type
{
  return 34;
}

- (SBAppLayout)transitioningFromAppLayout
{
  return self->_transitioningFromAppLayout;
}

- (SBAppLayout)transitioningToAppLayout
{
  return self->_transitioningToAppLayout;
}

- (BOOL)animated
{
  return self->_animated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitioningToAppLayout, 0);
  objc_storeStrong((id *)&self->_transitioningFromAppLayout, 0);
}

@end
