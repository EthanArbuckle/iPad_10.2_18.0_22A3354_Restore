@implementation _SBPIPInteractionControllerTransitionInfo

- (SBWindowScene)targetWindowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_targetWindowScene);
}

- (void)setTargetWindowScene:(id)a3
{
  objc_storeWeak((id *)&self->_targetWindowScene, a3);
}

- (unint64_t)layoutCorner
{
  return self->_layoutCorner;
}

- (void)setLayoutCorner:(unint64_t)a3
{
  self->_layoutCorner = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_targetWindowScene);
}

@end
