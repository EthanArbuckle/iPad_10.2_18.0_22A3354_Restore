@implementation SBSceneSnapshotRequestContext

- (SBSceneSnapshotReferenceFrameProviding)sceneDisplayReferenceFrameProvider
{
  return self->_sceneDisplayReferenceFrameProvider;
}

- (void)setSceneDisplayReferenceFrameProvider:(id)a3
{
  objc_storeStrong((id *)&self->_sceneDisplayReferenceFrameProvider, a3);
}

- (unint64_t)sceneDisplayWindowManagementStyle
{
  return self->_sceneDisplayWindowManagementStyle;
}

- (void)setSceneDisplayWindowManagementStyle:(unint64_t)a3
{
  self->_sceneDisplayWindowManagementStyle = a3;
}

- (SBLayoutStateTransitionContext)sceneDisplayLayoutStateTransitionContext
{
  return self->_sceneDisplayLayoutStateTransitionContext;
}

- (void)setSceneDisplayLayoutStateTransitionContext:(id)a3
{
  objc_storeStrong((id *)&self->_sceneDisplayLayoutStateTransitionContext, a3);
}

- (SBSceneSnapshotReferenceFrameProviding)embeddedDisplayReferenceFrameProvider
{
  return self->_embeddedDisplayReferenceFrameProvider;
}

- (void)setEmbeddedDisplayReferenceFrameProvider:(id)a3
{
  objc_storeStrong((id *)&self->_embeddedDisplayReferenceFrameProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embeddedDisplayReferenceFrameProvider, 0);
  objc_storeStrong((id *)&self->_sceneDisplayLayoutStateTransitionContext, 0);
  objc_storeStrong((id *)&self->_sceneDisplayReferenceFrameProvider, 0);
}

@end
