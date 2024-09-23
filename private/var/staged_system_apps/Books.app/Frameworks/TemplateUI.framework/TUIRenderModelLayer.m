@implementation TUIRenderModelLayer

- (unint64_t)kind
{
  return 3;
}

- (TUIRenderModelLayer)initWithSubmodels:(id)a3 config:(id)a4 erasableInsets:(UIEdgeInsets)a5
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  id v11;
  id v12;
  TUIRenderModelLayer *v13;
  TUIRenderModelLayer *v14;
  NSArray *v15;
  NSArray *submodels;
  objc_super v18;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  v11 = a3;
  v12 = a4;
  v18.receiver = self;
  v18.super_class = (Class)TUIRenderModelLayer;
  v13 = -[TUIRenderModelLayer init](&v18, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_config, a4);
    v14->_eraseableInsets.top = top;
    v14->_eraseableInsets.left = left;
    v14->_eraseableInsets.bottom = bottom;
    v14->_eraseableInsets.right = right;
    v14->_size = CGSizeZero;
    v15 = (NSArray *)objc_msgSend(v11, "copy");
    submodels = v14->_submodels;
    v14->_submodels = v15;

  }
  return v14;
}

- (NSArray)debugContainedSubmodels
{
  if (self->_submodels)
    return self->_submodels;
  else
    return (NSArray *)&__NSArray0__struct;
}

- (void)appendResourcesToCollector:(id)a3 transform:(CGAffineTransform *)a4
{
  id v6;
  TUIRenderModelLayerConfiguring *config;
  __int128 v8;
  NSArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v6 = a3;
  config = self->_config;
  v8 = *(_OWORD *)&a4->c;
  v20 = *(_OWORD *)&a4->a;
  v21 = v8;
  v22 = *(_OWORD *)&a4->tx;
  -[TUIRenderModelLayerConfiguring appendResourcesToCollector:transform:](config, "appendResourcesToCollector:transform:", v6, &v20);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = self->_submodels;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v13);
        v15 = *(_OWORD *)&a4->c;
        v20 = *(_OWORD *)&a4->a;
        v21 = v15;
        v22 = *(_OWORD *)&a4->tx;
        objc_msgSend(v14, "appendResourcesToCollector:transform:", v6, &v20, (_QWORD)v16);
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
    }
    while (v11);
  }

}

- (BOOL)isEqualToRenderModel:(id)a3
{
  TUIRenderModelLayer *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  TUIRenderModelLayer *v8;
  BOOL v9;
  TUIRenderModelLayer *v10;
  NSArray *submodels;
  TUIRenderModelLayerConfiguring *config;

  v4 = (TUIRenderModelLayer *)a3;
  if (v4)
  {
    v5 = objc_opt_class(self);
    if (v5 == objc_opt_class(v4))
    {
      v8 = v4;
    }
    else
    {
      v6 = objc_opt_class(TUIRenderModelLayer);
      v7 = TUIDynamicCast(v6, v4);
      v8 = (TUIRenderModelLayer *)objc_claimAutoreleasedReturnValue(v7);
    }
    v10 = v8;
    v9 = 1;
    if (self != v4)
    {
      if (!TUIRenderModelIsEqualToRenderModel(self, v8)
        || (submodels = self->_submodels, submodels != v10->_submodels)
        && !-[NSArray isEqual:](submodels, "isEqual:")
        || (config = self->_config, config != v10->_config)
        && !-[TUIRenderModelLayerConfiguring isEqualToConfig:](config, "isEqualToConfig:"))
      {
        v9 = 0;
      }
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelLayer identifier](self, "identifier"));
  v3 = TUIIdentifierHash(v2);

  return (unint64_t)v3;
}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p submodels=%@ config=%@>"), v5, self, self->_submodels, self->_config));

  return (NSString *)v6;
}

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (TUIRenderModelLayerConfiguring)config
{
  return self->_config;
}

- (NSArray)submodels
{
  return self->_submodels;
}

- (UIEdgeInsets)eraseableInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_eraseableInsets.top;
  left = self->_eraseableInsets.left;
  bottom = self->_eraseableInsets.bottom;
  right = self->_eraseableInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_animationGroups, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_submodels, 0);
  objc_storeStrong(&self->_renderBlock, 0);
}

@end
