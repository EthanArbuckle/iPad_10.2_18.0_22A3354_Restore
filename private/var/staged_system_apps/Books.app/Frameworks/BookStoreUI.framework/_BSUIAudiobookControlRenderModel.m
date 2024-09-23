@implementation _BSUIAudiobookControlRenderModel

- (unint64_t)kind
{
  return 10;
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v4 = a3;
  v6 = objc_opt_class(_BSUIAudiobookControlRenderModel, v5);
  v7 = TUIDynamicCast(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (TUIRenderModelIsEqualToRenderModel(self, v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUIAudiobookControlRenderModel dynamicAudiobookProgress](self, "dynamicAudiobookProgress"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dynamicAudiobookProgress"));
    v11 = v9 == v10;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)handlesAlphaForInitialAppearance
{
  return 0;
}

- (BOOL)handlesAlphaForFinalAppearance
{
  return 0;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUIAudiobookControlRenderModel identifier](self, "identifier"));
  v3 = TUIIdentifierHash();

  return v3;
}

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (TUIAnimationGroupCollection)animationGroups
{
  return self->_animationGroups;
}

- (void)setAnimationGroups:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BSUIDynamicAudiobookProgress)dynamicAudiobookProgress
{
  return self->_dynamicAudiobookProgress;
}

- (void)setDynamicAudiobookProgress:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicAudiobookProgress, a3);
}

- (TUIDynamicProviding)dynamicState
{
  return self->_dynamicState;
}

- (void)setDynamicState:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicState, 0);
  objc_storeStrong((id *)&self->_dynamicAudiobookProgress, 0);
  objc_storeStrong((id *)&self->_animationGroups, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
