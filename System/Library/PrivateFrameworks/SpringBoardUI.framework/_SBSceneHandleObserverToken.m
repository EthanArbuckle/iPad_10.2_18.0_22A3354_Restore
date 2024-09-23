@implementation _SBSceneHandleObserverToken

- (_SBSceneHandleObserverToken)initWithOwner:(id)a3
{
  id v4;
  _SBSceneHandleObserverToken *v5;
  _SBSceneHandleObserverToken *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_SBSceneHandleObserverToken;
  v5 = -[_SBSceneHandleObserverToken init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_owner, v4);

  return v6;
}

- (NSMutableDictionary)owner
{
  return (NSMutableDictionary *)objc_loadWeakRetained((id *)&self->_owner);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_owner);
}

@end
