@implementation TUIIdentifierMap

- (TUIIdentifierMap)init
{
  void *v3;
  TUIIdentifierMap *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v4 = -[TUIIdentifierMap initWithUUID:](self, "initWithUUID:", v3);

  return v4;
}

- (TUIIdentifierMap)initWithUUID:(id)a3
{
  id v5;
  TUIIdentifierMap *v6;
  TUIIdentifierMap *v7;
  TUIRenderModelIdentifierMap *v8;
  TUIRenderModelIdentifierMap *renderModelIdentifierMap;
  TUIIdentifier *loadingIdentifier;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TUIIdentifierMap;
  v6 = -[TUIIdentifierMap init](&v12, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_UUID, a3);
    v8 = objc_opt_new(TUIRenderModelIdentifierMap);
    renderModelIdentifierMap = v7->_renderModelIdentifierMap;
    v7->_renderModelIdentifierMap = v8;

    loadingIdentifier = v7->_loadingIdentifier;
    v7->_loadingIdentifier = (TUIIdentifier *)&off_253AC0;

  }
  return v7;
}

- (id)identifierWithNode:(id)a3 baseIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v5 = a4;
  if (TUIElementNodeNotNil(a3.var0))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", (2 * a3.var0) | 1));
    v7 = v6;
    if (v5)
      v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tui_identifierByAppendingIndex:", objc_msgSend(v6, "unsignedIntegerValue")));
    else
      v8 = v6;
    v9 = v8;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)describeForDebuggingIdentifierIndex:(unint64_t)a3 package:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;

  if ((a3 & 1) != 0)
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "debugLocationForNode:", (a3 >> 1), v4, v5));
  else
    v6 = CFSTR("Other:Loading");
  return v6;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (TUIRenderModelIdentifierMap)renderModelIdentifierMap
{
  return self->_renderModelIdentifierMap;
}

- (TUIIdentifier)loadingIdentifier
{
  return self->_loadingIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderModelIdentifierMap, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_loadingIdentifier, 0);
}

@end
