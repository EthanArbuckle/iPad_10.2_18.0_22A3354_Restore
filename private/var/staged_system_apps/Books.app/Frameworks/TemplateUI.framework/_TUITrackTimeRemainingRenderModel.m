@implementation _TUITrackTimeRemainingRenderModel

- (unint64_t)kind
{
  return 10;
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;

  v4 = a3;
  v5 = objc_opt_class(_TUITrackTimeRemainingRenderModel);
  v6 = TUIDynamicCast(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (TUIRenderModelIsEqualToRenderModel(self, v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[_TUITrackTimeRemainingRenderModel style](self, "style"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "style"));
    if (v8 == v9 || objc_msgSend(v8, "isEqual:", v9))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[_TUITrackTimeRemainingRenderModel dynamicProgress](self, "dynamicProgress"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dynamicProgress"));
      v12 = v10 == v11;

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
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
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_TUITrackTimeRemainingRenderModel identifier](self, "identifier"));
  v3 = TUIIdentifierHash(v2);

  return (unint64_t)v3;
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

- (TUIDynamicProgress)dynamicProgress
{
  return self->_dynamicProgress;
}

- (void)setDynamicProgress:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicProgress, a3);
}

- (TUITextContentStyler)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
  objc_storeStrong((id *)&self->_style, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_dynamicProgress, 0);
  objc_storeStrong((id *)&self->_animationGroups, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
