@implementation LoadingIndicatorController

+ (id)sharedController
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)qword_1014D3B80;
  if (!qword_1014D3B80)
  {
    v4 = objc_alloc_init((Class)a1);
    v5 = (void *)qword_1014D3B80;
    qword_1014D3B80 = (uint64_t)v4;

    v3 = (void *)qword_1014D3B80;
  }
  return v3;
}

+ (void)setAsSharedInstanceClass
{
  id v3;
  void *v4;

  if ((id)objc_opt_class(qword_1014D3B80) != a1)
  {
    v3 = objc_alloc_init((Class)a1);
    v4 = (void *)qword_1014D3B80;
    qword_1014D3B80 = (uint64_t)v3;

  }
}

- (id)_allLoadingTokens
{
  return -[NSHashTable allObjects](self->_loadingTokens, "allObjects");
}

- (void)setSuppressed:(BOOL)a3
{
  if (self->_suppressed != a3)
  {
    self->_suppressed = a3;
    -[LoadingIndicatorController _updateLoadingIndicator](self, "_updateLoadingIndicator");
  }
}

- (void)_updateLoadingIndicator
{
  _BOOL4 v3;

  if (-[LoadingIndicatorController _isLoading](self, "_isLoading"))
    v3 = !self->_suppressed;
  else
    v3 = 0;
  if (self->_showing != v3)
  {
    self->_showing = v3;
    -[LoadingIndicatorController showingDidChange](self, "showingDidChange");
  }
}

- (BOOL)_isLoading
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_loadingTokens, "allObjects"));
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)beginShowingLoadingIndicator
{
  LoadingToken *v3;
  NSHashTable *loadingTokens;
  NSHashTable *v5;
  NSHashTable *v6;
  _QWORD v8[5];
  _QWORD block[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10099414C;
    v8[3] = &unk_1011AC860;
    v8[4] = self;
    v3 = -[LoadingToken initWithInvalidationBlock:]([LoadingToken alloc], "initWithInvalidationBlock:", v8);
    loadingTokens = self->_loadingTokens;
    if (!loadingTokens)
    {
      v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
      v6 = self->_loadingTokens;
      self->_loadingTokens = v5;

      loadingTokens = self->_loadingTokens;
    }
    -[NSHashTable addObject:](loadingTokens, "addObject:", v3);
    -[LoadingIndicatorController _updateLoadingIndicator](self, "_updateLoadingIndicator");
  }
  else
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = sub_1009940FC;
    v14 = sub_10099410C;
    v15 = 0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100994114;
    block[3] = &unk_1011ADF48;
    block[4] = self;
    block[5] = &v10;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
    v3 = (LoadingToken *)(id)v11[5];
    _Block_object_dispose(&v10, 8);

  }
  return v3;
}

- (void)_didInvalidateLoadingToken
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 2000000000);
  if (!self->_updateScheduled)
  {
    self->_updateScheduled = 1;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1009941D8;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (BOOL)isShowing
{
  return self->_showing;
}

- (BOOL)isSuppressed
{
  return self->_suppressed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingTokens, 0);
}

@end
