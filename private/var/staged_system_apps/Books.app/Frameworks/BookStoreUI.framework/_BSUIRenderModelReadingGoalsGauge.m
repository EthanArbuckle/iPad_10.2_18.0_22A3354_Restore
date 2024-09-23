@implementation _BSUIRenderModelReadingGoalsGauge

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
  unsigned __int8 v11;

  v4 = a3;
  v6 = objc_opt_class(_BSUIRenderModelReadingGoalsGauge, v5);
  v7 = BUDynamicCast(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (TUIRenderModelIsEqualToRenderModel(self, v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUIRenderModelReadingGoalsGauge metrics](self, "metrics"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "metrics"));
    v11 = objc_msgSend(v9, "isEqual:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)handlesAlphaForFinalAppearance
{
  return 0;
}

- (BOOL)handlesAlphaForInitialAppearance
{
  return 0;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUIRenderModelReadingGoalsGauge identifier](self, "identifier"));
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

- (BSUIReadingGoalsGaugeMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_animationGroups, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
