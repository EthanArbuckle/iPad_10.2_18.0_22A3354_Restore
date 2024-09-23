@implementation TUIRenderModelImage

- (unint64_t)kind
{
  return 2;
}

- (TUIRenderModelImage)initWithSubmodels:(id)a3
{
  id v4;
  TUIRenderModelImage *v5;
  NSArray *v6;
  NSArray *submodels;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIRenderModelImage;
  v5 = -[TUIRenderModelImage init](&v9, "init");
  if (v5)
  {
    v6 = (NSArray *)objc_msgSend(v4, "copy");
    submodels = v5->_submodels;
    v5->_submodels = v6;

    v5->_size = CGSizeZero;
  }

  return v5;
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  BOOL v21;
  BOOL v22;
  BOOL v24;
  void *v25;
  void *v26;

  v4 = a3;
  v6 = objc_opt_class(TUIRenderModelImage, v5);
  v7 = TUIDynamicCast(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (!TUIRenderModelIsEqualToRenderModel(self, v8))
    goto LABEL_12;
  -[TUIRenderModelImage eraseableInsets](self, "eraseableInsets");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v8, "eraseableInsets");
  v21 = v12 == v20 && v10 == v17;
  v22 = v21 && v16 == v19;
  if (v22 && v14 == v18)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelImage image](self, "image"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "image"));
    v24 = v25 == v26 || objc_msgSend(v25, "isEqual:", v26);

  }
  else
  {
LABEL_12:
    v24 = 0;
  }

  return v24;
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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelImage identifier](self, "identifier"));
  v3 = TUIIdentifierHash(v2);

  return (unint64_t)v3;
}

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
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

- (void)setEraseableInsets:(UIEdgeInsets)a3
{
  self->_eraseableInsets = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_animationGroups, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_submodels, 0);
}

@end
