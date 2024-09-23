@implementation TUIRenderModelView

- (unint64_t)kind
{
  return 4;
}

- (TUIRenderModelView)initWithReuseIdentifier:(id)a3 identifier:(id)a4 submodel:(id)a5
{
  id v8;
  id v9;
  id v10;
  TUIRenderModelView *v11;
  NSString *v12;
  NSString *reuseIdentifier;
  TUIIdentifier *v14;
  TUIIdentifier *identifier;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TUIRenderModelView;
  v11 = -[TUIRenderModelView init](&v17, "init");
  if (v11)
  {
    v12 = (NSString *)objc_msgSend(v8, "copy");
    reuseIdentifier = v11->_reuseIdentifier;
    v11->_reuseIdentifier = v12;

    objc_storeStrong((id *)&v11->_submodel, a5);
    v14 = (TUIIdentifier *)objc_msgSend(v9, "copyWithZone:", 0);
    identifier = v11->_identifier;
    v11->_identifier = v14;

  }
  return v11;
}

- (TUIRenderModelView)initWithReuseIdentifier:(id)a3 identifier:(id)a4 submodel:(id)a5 style:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  TUIRenderModelView *v14;
  NSString *v15;
  NSString *reuseIdentifier;
  TUIIdentifier *v17;
  TUIIdentifier *identifier;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)TUIRenderModelView;
  v14 = -[TUIRenderModelView init](&v20, "init");
  if (v14)
  {
    v15 = (NSString *)objc_msgSend(v10, "copy");
    reuseIdentifier = v14->_reuseIdentifier;
    v14->_reuseIdentifier = v15;

    objc_storeStrong((id *)&v14->_submodel, a5);
    objc_storeStrong((id *)&v14->_style, a6);
    v17 = (TUIIdentifier *)objc_msgSend(v11, "copyWithZone:", 0);
    identifier = v14->_identifier;
    v14->_identifier = v17;

  }
  return v14;
}

- (CGSize)size
{
  TUIRenderModel *submodel;
  double width;
  double height;
  CGSize result;

  submodel = self->_submodel;
  if (submodel)
  {
    -[TUIRenderModel size](submodel, "size");
  }
  else
  {
    width = self->_size.width;
    height = self->_size.height;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  if (self->_submodel)
    -[TUIRenderModel setSize:](self->_submodel, "setSize:", a3.width, a3.height);
  else
    self->_size = a3;
}

- (void)prepare
{
  -[TUIRenderModel prepare](self->_submodel, "prepare");
}

- (void)teardown
{
  -[TUIRenderModel teardown](self->_submodel, "teardown");
}

- (void)appendResourcesToCollector:(id)a3 transform:(CGAffineTransform *)a4
{
  TUIRenderModel *submodel;
  __int128 v5;
  _OWORD v6[3];

  submodel = self->_submodel;
  v5 = *(_OWORD *)&a4->c;
  v6[0] = *(_OWORD *)&a4->a;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&a4->tx;
  -[TUIRenderModel appendResourcesToCollector:transform:](submodel, "appendResourcesToCollector:transform:", a3, v6);
}

- (void)appendReferencesToCollector:(id)a3 transform:(CGAffineTransform *)a4 query:(id)a5 liveTransformResolver:(id)a6
{
  TUIRenderModel *submodel;
  __int128 v7;
  _OWORD v8[3];

  submodel = self->_submodel;
  v7 = *(_OWORD *)&a4->c;
  v8[0] = *(_OWORD *)&a4->a;
  v8[1] = v7;
  v8[2] = *(_OWORD *)&a4->tx;
  -[TUIRenderModel appendReferencesToCollector:transform:query:liveTransformResolver:](submodel, "appendReferencesToCollector:transform:query:liveTransformResolver:", a3, v8, a5, a6);
}

- (NSArray)debugContainedSubmodels
{
  void *v2;
  TUIRenderModel *submodel;

  if (self->_submodel)
  {
    submodel = self->_submodel;
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &submodel, 1));
  }
  else
  {
    v2 = &__NSArray0__struct;
  }
  return (NSArray *)v2;
}

- (id)copyForInitialAppearanceWithFlags:(unint64_t)a3
{
  id v5;
  NSString *reuseIdentifier;
  TUIIdentifier *identifier;
  id v8;
  id v9;

  v5 = objc_alloc((Class)objc_opt_class(self, a2));
  reuseIdentifier = self->_reuseIdentifier;
  identifier = self->_identifier;
  v8 = -[TUIRenderModel copyForInitialAppearanceWithFlags:](self->_submodel, "copyForInitialAppearanceWithFlags:", a3);
  v9 = objc_msgSend(v5, "initWithReuseIdentifier:identifier:submodel:style:", reuseIdentifier, identifier, v8, self->_style);

  TUIRenderModelCopyProperties(v9, self);
  return v9;
}

- (id)copyForFinalAppearanceWithFlags:(unint64_t)a3
{
  id v5;
  NSString *reuseIdentifier;
  TUIIdentifier *identifier;
  id v8;
  id v9;

  v5 = objc_alloc((Class)objc_opt_class(self, a2));
  reuseIdentifier = self->_reuseIdentifier;
  identifier = self->_identifier;
  v8 = -[TUIRenderModel copyForFinalAppearanceWithFlags:](self->_submodel, "copyForFinalAppearanceWithFlags:", a3);
  v9 = objc_msgSend(v5, "initWithReuseIdentifier:identifier:submodel:style:", reuseIdentifier, identifier, v8, self->_style);

  TUIRenderModelCopyProperties(v9, self);
  return v9;
}

- (id)computeContainerUpdateCurrent:(id)a3 from:(id)a4 tracker:(id)a5 flags:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  NSString *reuseIdentifier;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unsigned int v20;
  TUIRenderModel *submodel;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  reuseIdentifier = self->_reuseIdentifier;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "reuseIdentifier"));
  if (-[NSString isEqualToString:](reuseIdentifier, "isEqualToString:", v14))
  {
    v16 = objc_opt_class(self->_submodel, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "submodel"));
    if (v16 == objc_opt_class(v17, v18))
    {
      v20 = -[TUIRenderModel conformsToProtocol:](self->_submodel, "conformsToProtocol:", &OBJC_PROTOCOL___TUIRenderModelContaining);

      if (!v20)
      {
        v19 = 0;
        goto LABEL_9;
      }
      submodel = self->_submodel;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "submodel"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "submodel"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModel computeContainerUpdateCurrent:from:tracker:flags:](submodel, "computeContainerUpdateCurrent:from:tracker:flags:", v14, v17, v12, a6));
    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

LABEL_9:
  return v19;
}

- (id)newToContainerPlusDeletesWithUpdate:(id)a3 interests:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = -[TUIRenderModel newToContainerPlusDeletesWithUpdate:interests:](self->_submodel, "newToContainerPlusDeletesWithUpdate:interests:", a3, a4);
  v7 = objc_msgSend(objc_alloc((Class)objc_opt_class(self, v6)), "initWithReuseIdentifier:identifier:submodel:style:", self->_reuseIdentifier, self->_identifier, v5, self->_style);
  TUIRenderModelCopyProperties(v7, self);

  return v7;
}

- (id)newCurrentContainerPlusInsertsWithCurrent:(id)a3 update:(id)a4
{
  TUIRenderModel *submodel;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;

  submodel = self->_submodel;
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "submodel"));
  v10 = -[TUIRenderModel newCurrentContainerPlusInsertsWithCurrent:update:](submodel, "newCurrentContainerPlusInsertsWithCurrent:update:", v9, v7);

  v12 = objc_msgSend(objc_alloc((Class)objc_opt_class(self, v11)), "initWithReuseIdentifier:identifier:submodel:style:", self->_reuseIdentifier, self->_identifier, v10, self->_style);
  TUIRenderModelCopyProperties(v12, v8);

  return v12;
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  void *v15;
  TUIRenderStyling *style;
  TUIRenderStyling *v17;
  TUIRenderModel *submodel;
  TUIRenderModel *v19;
  TUIRenderModel *v20;
  void *v21;

  v5 = a3;
  if (v5)
  {
    v6 = objc_opt_class(self, v4);
    if (v6 == objc_opt_class(v5, v7))
    {
      v11 = v5;
    }
    else
    {
      v9 = objc_opt_class(TUIRenderModelView, v8);
      v10 = TUIDynamicCast(v9, v5);
      v11 = (id)objc_claimAutoreleasedReturnValue(v10);
    }
    v13 = v11;
    if (TUIRenderModelIsEqualToRenderModel(self, v11))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelView reuseIdentifier](self, "reuseIdentifier"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "reuseIdentifier"));
      if (v14 == v15 || objc_msgSend(v14, "isEqualToString:", v15))
      {
        style = self->_style;
        v17 = (TUIRenderStyling *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "style"));
        if (style == v17)
        {
          submodel = self->_submodel;
          v19 = (TUIRenderModel *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "submodel"));
          if (submodel == v19)
          {
            v12 = 1;
          }
          else
          {
            v20 = self->_submodel;
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "submodel"));
            v12 = -[TUIRenderModel isEqualToRenderModel:](v20, "isEqualToRenderModel:", v21);

          }
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
  return -[TUIRenderModel handlesAlphaForInitialAppearance](self->_submodel, "handlesAlphaForInitialAppearance");
}

- (BOOL)handlesAlphaForFinalAppearance
{
  return -[TUIRenderModel handlesAlphaForFinalAppearance](self->_submodel, "handlesAlphaForFinalAppearance");
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelView identifier](self, "identifier"));
  v3 = TUIIdentifierHash(v2);

  return (unint64_t)v3;
}

- (NSString)description
{
  id v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v14[2];

  v3 = objc_alloc((Class)NSMutableString);
  v5 = (objc_class *)objc_opt_class(self, v4);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p"), v7, self);

  -[TUIRenderModelView size](self, "size");
  v14[0] = v9;
  v14[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v14, "{CGSize=dd}"));
  objc_msgSend(v8, "appendFormat:", CFSTR(" size=%@"), v11);

  objc_msgSend(v8, "appendFormat:", CFSTR(" identifier=%@"), self->_identifier);
  objc_msgSend(v8, "appendFormat:", CFSTR(" reuseIdentifier=%@"), self->_reuseIdentifier);
  objc_msgSend(v8, "appendFormat:", CFSTR(" submodel=%@"), self->_submodel);
  objc_msgSend(v8, "appendFormat:", CFSTR(">"));
  v12 = objc_msgSend(v8, "copy");

  return (NSString *)v12;
}

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (TUIRenderModel)submodel
{
  return self->_submodel;
}

- (TUIAnimationGroupCollection)animationGroups
{
  return self->_animationGroups;
}

- (void)setAnimationGroups:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)reuseIdentifier
{
  return self->_reuseIdentifier;
}

- (TUIRenderStyling)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_reuseIdentifier, 0);
  objc_storeStrong((id *)&self->_animationGroups, 0);
  objc_storeStrong((id *)&self->_submodel, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
