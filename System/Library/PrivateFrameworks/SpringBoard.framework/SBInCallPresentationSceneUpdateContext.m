@implementation SBInCallPresentationSceneUpdateContext

- (SBInCallPresentationSceneUpdateContext)initWithReferenceFrame:(CGRect)a3 analyticsSource:(id)a4 transitionRequestBuilderBlock:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  id v12;
  SBInCallPresentationSceneUpdateContext *v13;
  SBInCallPresentationSceneUpdateContext *v14;
  uint64_t v15;
  NSString *analyticsSource;
  uint64_t v17;
  id transitionRequestBuilderBlock;
  objc_super v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SBInCallPresentationSceneUpdateContext;
  v13 = -[SBInCallPresentationSceneUpdateContext init](&v20, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_referenceFrame.origin.x = x;
    v13->_referenceFrame.origin.y = y;
    v13->_referenceFrame.size.width = width;
    v13->_referenceFrame.size.height = height;
    v15 = objc_msgSend(v11, "copy");
    analyticsSource = v14->_analyticsSource;
    v14->_analyticsSource = (NSString *)v15;

    v17 = objc_msgSend(v12, "copy");
    transitionRequestBuilderBlock = v14->_transitionRequestBuilderBlock;
    v14->_transitionRequestBuilderBlock = (id)v17;

    v14->_executionTarget = 0;
  }

  return v14;
}

- (NSString)analyticsSource
{
  return self->_analyticsSource;
}

- (void)setAnalyticsSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (CGRect)referenceFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_referenceFrame.origin.x;
  y = self->_referenceFrame.origin.y;
  width = self->_referenceFrame.size.width;
  height = self->_referenceFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setReferenceFrame:(CGRect)a3
{
  self->_referenceFrame = a3;
}

- (int64_t)executionTarget
{
  return self->_executionTarget;
}

- (void)setExecutionTarget:(int64_t)a3
{
  self->_executionTarget = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)postSceneUpdateHandler
{
  return self->_postSceneUpdateHandler;
}

- (void)setPostSceneUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)transitionRequestBuilderBlock
{
  return self->_transitionRequestBuilderBlock;
}

- (void)setTransitionRequestBuilderBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)validatorHandler
{
  return self->_validatorHandler;
}

- (void)setValidatorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_validatorHandler, 0);
  objc_storeStrong(&self->_transitionRequestBuilderBlock, 0);
  objc_storeStrong(&self->_postSceneUpdateHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_analyticsSource, 0);
}

@end
