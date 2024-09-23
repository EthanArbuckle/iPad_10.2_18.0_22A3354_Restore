@implementation _BSUIRenderModelBooksUIComponent

- (_BSUIRenderModelBooksUIComponent)initWithRawComponentModel:(id)a3 identifier:(id)a4
{
  id v7;
  id v8;
  _BSUIRenderModelBooksUIComponent *v9;
  _BSUIRenderModelBooksUIComponent *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_BSUIRenderModelBooksUIComponent;
  v9 = -[_BSUIRenderModelBooksUIComponent init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rawComponentModel, a3);
    objc_storeStrong((id *)&v10->_identifier, a4);
  }

  return v10;
}

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

  v4 = a3;
  v6 = objc_opt_class(_BSUIRenderModelBooksUIComponent, v5);
  v7 = BUDynamicCast(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  LOBYTE(self) = TUIRenderModelIsEqualToRenderModel(self, v8);
  return (char)self;
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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUIRenderModelBooksUIComponent identifier](self, "identifier"));
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

- (NSDictionary)rawComponentModel
{
  return self->_rawComponentModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawComponentModel, 0);
  objc_storeStrong((id *)&self->_animationGroups, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
