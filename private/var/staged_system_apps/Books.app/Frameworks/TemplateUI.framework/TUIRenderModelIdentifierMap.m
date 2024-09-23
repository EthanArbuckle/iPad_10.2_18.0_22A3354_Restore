@implementation TUIRenderModelIdentifierMap

- (TUIRenderModelIdentifierMap)init
{
  TUIRenderModelIdentifierMap *v2;
  _TUIRenderModelIdentifierMap *v3;
  _TUIRenderModelIdentifierMap *view;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUIRenderModelIdentifierMap;
  v2 = -[TUIRenderModelIdentifierMap init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(_TUIRenderModelIdentifierMap);
    view = v2->_view;
    v2->_view = v3;

  }
  return v2;
}

- (TUIRenderModelIdentifierMap)initWithView:(id)a3
{
  id v5;
  TUIRenderModelIdentifierMap *v6;
  TUIRenderModelIdentifierMap *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIRenderModelIdentifierMap;
  v6 = -[TUIRenderModelIdentifierMap init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_view, a3);

  return v7;
}

- (id)mapViewModels:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[_TUIRenderModelIdentifierMap mapRenderModels:](self->_view, "mapRenderModels:", a3));
}

- (unint64_t)viewIndexForIdentifier:(id)a3
{
  return -[_TUIRenderModelIdentifierMap indexForIdentifier:](self->_view, "indexForIdentifier:", a3);
}

- (id)collectInterestWithInvalidationQueue:(id)a3
{
  id v4;
  NSMutableArray *v5;
  TUIRenderModelIdentifierInterest *v6;

  v4 = a3;
  v5 = objc_opt_new(NSMutableArray);
  -[_TUIRenderModelIdentifierMap _appendInterests:](self->_view, "_appendInterests:", v5);
  v6 = -[TUIRenderModelIdentifierInterest initWithQueue:interests:]([TUIRenderModelIdentifierInterest alloc], "initWithQueue:interests:", v4, v5);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
}

@end
