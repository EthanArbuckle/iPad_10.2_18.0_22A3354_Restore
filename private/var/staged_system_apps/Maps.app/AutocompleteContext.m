@implementation AutocompleteContext

- (AutocompleteContext)init
{
  -[AutocompleteContext doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (AutocompleteContext)initWithQueryString:(id)a3
{
  id v5;
  AutocompleteContext *v6;
  AutocompleteContext *v7;
  NSString *v8;
  id v9;
  const char *v10;
  dispatch_queue_attr_t v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *lock;
  uint64_t v15;
  NSMapTable *matchInfos;
  AutocompleteQueryString *v17;
  AutocompleteQueryString *query;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)AutocompleteContext;
  v6 = -[AutocompleteContext init](&v20, "init");
  v7 = v6;
  if (v6)
  {
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %p"), objc_opt_class(v6), v6);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v8));
    v10 = (const char *)objc_msgSend(v9, "UTF8String");
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = dispatch_queue_create(v10, v12);
    lock = v7->_lock;
    v7->_lock = (OS_dispatch_queue *)v13;

    v15 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
    matchInfos = v7->_matchInfos;
    v7->_matchInfos = (NSMapTable *)v15;

    objc_storeStrong((id *)&v7->_queryString, a3);
    v17 = -[AutocompleteQueryString initWithQuery:]([AutocompleteQueryString alloc], "initWithQuery:", v5);
    query = v7->_query;
    v7->_query = v17;

    v7->_isCJK = objc_msgSend(v5, "_navigation_isCJK");
  }

  return v7;
}

- (id)matchInfoForObject:(id)a3
{
  id v4;
  void *v5;
  NSObject *lock;
  void *v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v5 = v4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_10067EEEC;
  v17 = sub_10067EEFC;
  v18 = 0;
  if (v4)
  {
    lock = self->_lock;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10067EF04;
    block[3] = &unk_1011B3B68;
    v12 = &v13;
    block[4] = self;
    v11 = v4;
    dispatch_sync(lock, block);

    v7 = (void *)v14[5];
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (void)setMatchInfo:(id)a3 forObject:(id)a4
{
  id v6;
  NSObject *lock;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v8 = a3;
  v6 = a4;
  if (v8 && v6)
  {
    lock = self->_lock;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10067EFF8;
    block[3] = &unk_1011AD238;
    block[4] = self;
    v10 = v6;
    v11 = v8;
    dispatch_sync(lock, block);

  }
}

- (void)autocompleteMatchInfoDidUpdate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[AutocompleteContext delegate](self, "delegate"));
  objc_msgSend(v5, "autocompleteContext:didUpdateMatchInfo:", self, v4);

}

- (NSString)queryString
{
  return self->_queryString;
}

- (AutocompleteQueryString)query
{
  return self->_query;
}

- (BOOL)isCJK
{
  return self->_isCJK;
}

- (AutocompleteContextDelegate)delegate
{
  return (AutocompleteContextDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_queryString, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_matchInfos, 0);
}

@end
