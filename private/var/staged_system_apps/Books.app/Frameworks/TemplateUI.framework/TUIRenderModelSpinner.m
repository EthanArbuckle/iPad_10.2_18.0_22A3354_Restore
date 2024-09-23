@implementation TUIRenderModelSpinner

- (unint64_t)kind
{
  return 4;
}

- (TUIRenderModel)submodel
{
  return 0;
}

- (NSArray)debugContainedSubmodels
{
  return (NSArray *)&__NSArray0__struct;
}

- (TUIRenderModelSpinner)initWithReuseIdentifier:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  TUIRenderModelSpinner *v8;
  NSString *v9;
  NSString *reuseIdentifier;
  TUIIdentifier *v11;
  TUIIdentifier *identifier;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TUIRenderModelSpinner;
  v8 = -[TUIRenderModelSpinner init](&v14, "init");
  if (v8)
  {
    v9 = (NSString *)objc_msgSend(v6, "copy");
    reuseIdentifier = v8->_reuseIdentifier;
    v8->_reuseIdentifier = v9;

    v11 = (TUIIdentifier *)objc_msgSend(v7, "copyWithZone:", 0);
    identifier = v8->_identifier;
    v8->_identifier = v11;

  }
  return v8;
}

- (BOOL)isEqualToRenderModel:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  v5 = objc_opt_class(TUIRenderModelSpinner);
  v6 = TUIDynamicCast(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (TUIRenderModelIsEqualToRenderModel(self, v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelSpinner reuseIdentifier](self, "reuseIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "reuseIdentifier"));
    v10 = v8 == v9 || objc_msgSend(v8, "isEqualToString:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)handlesAlphaForInitialAppearance
{
  return 0;
}

- (BOOL)handlesAlphaForFinalAppearance
{
  return 0;
}

- (id)computeContainerUpdateCurrent:(id)a3 from:(id)a4 tracker:(id)a5 flags:(unint64_t)a6
{
  return 0;
}

- (id)newToContainerPlusDeletesWithUpdate:(id)a3 interests:(id)a4
{
  id v5;

  v5 = objc_msgSend(objc_alloc((Class)objc_opt_class(self)), "initWithReuseIdentifier:identifier:", self->_reuseIdentifier, self->_identifier);
  TUIRenderModelCopyProperties(v5, self);
  return v5;
}

- (id)newCurrentContainerPlusInsertsWithCurrent:(id)a3 update:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = objc_msgSend(objc_alloc((Class)objc_opt_class(self)), "initWithReuseIdentifier:identifier:", self->_reuseIdentifier, self->_identifier);
  TUIRenderModelCopyProperties(v6, v5);

  return v6;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelSpinner identifier](self, "identifier"));
  v3 = TUIIdentifierHash(v2);

  return (unint64_t)v3;
}

- (NSString)description
{
  id v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[2];

  v3 = objc_alloc((Class)NSMutableString);
  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p"), v6, self);

  -[TUIRenderModelSpinner size](self, "size");
  v12[0] = v8;
  v12[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v12, "{CGSize=dd}"));
  objc_msgSend(v7, "appendFormat:", CFSTR(" size=%@"), v10);

  objc_msgSend(v7, "appendFormat:", CFSTR(" identifier=%@"), self->_identifier);
  objc_msgSend(v7, "appendFormat:", CFSTR(" reuseIdentifier=%@"), self->_reuseIdentifier);
  objc_msgSend(v7, "appendFormat:", CFSTR(">"));
  return (NSString *)v7;
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

- (NSString)reuseIdentifier
{
  return self->_reuseIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reuseIdentifier, 0);
  objc_storeStrong((id *)&self->_animationGroups, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
