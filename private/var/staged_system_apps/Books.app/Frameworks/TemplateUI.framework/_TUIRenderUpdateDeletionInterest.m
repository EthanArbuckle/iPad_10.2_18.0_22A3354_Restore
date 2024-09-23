@implementation _TUIRenderUpdateDeletionInterest

- (_TUIRenderUpdateDeletionInterest)initWithModels:(id)a3 tracker:(id)a4
{
  id v6;
  id v7;
  _TUIRenderUpdateDeletionInterest *v8;
  NSArray *v9;
  NSArray *models;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_TUIRenderUpdateDeletionInterest;
  v8 = -[_TUIRenderUpdateDeletionInterest init](&v12, "init");
  if (v8)
  {
    v9 = (NSArray *)objc_msgSend(v6, "copy");
    models = v8->_models;
    v8->_models = v9;

    objc_storeStrong((id *)&v8->_tracker, a4);
    -[TUIRenderUpdateArrayTracker incrementInterestInDeletedModels:](v8->_tracker, "incrementInterestInDeletedModels:", v8->_models);
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[TUIRenderUpdateArrayTracker decrementInterestInDeletedModels:](self->_tracker, "decrementInterestInDeletedModels:", self->_models);
  v3.receiver = self;
  v3.super_class = (Class)_TUIRenderUpdateDeletionInterest;
  -[_TUIRenderUpdateDeletionInterest dealloc](&v3, "dealloc");
}

- (NSArray)models
{
  return self->_models;
}

- (TUIRenderUpdateArrayTracker)tracker
{
  return self->_tracker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_models, 0);
}

@end
