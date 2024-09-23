@implementation PersonalizedItemAutocompleteFilter

- (PersonalizedItemAutocompleteFilter)init
{
  PersonalizedItemAutocompleteFilter *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *lock;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PersonalizedItemAutocompleteFilter;
  v2 = -[PersonalizedItemAutocompleteFilter init](&v8, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("PersonalizedItemAutocompleteFilter", v4);
    lock = v2->_lock;
    v2->_lock = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)dealloc
{
  PersonalizedItemManager *inputItems;
  objc_super v4;

  inputItems = self->_inputItems;
  if (inputItems)
    -[PersonalizedItemManager removeObserver:](inputItems, "removeObserver:", self);
  v4.receiver = self;
  v4.super_class = (Class)PersonalizedItemAutocompleteFilter;
  -[PersonalizedItemAutocompleteFilter dealloc](&v4, "dealloc");
}

- (void)setSearchString:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_searchString != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_searchString, a3);
    -[PersonalizedItemAutocompleteFilter _invalidateResults](self, "_invalidateResults");
    v5 = v6;
  }

}

- (void)setInputItems:(id)a3
{
  PersonalizedItemManager *v5;
  PersonalizedItemManager **p_inputItems;
  PersonalizedItemManager *inputItems;
  NSObject *lock;
  void **v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  PersonalizedItemAutocompleteFilter *v13;
  PersonalizedItemManager *v14;

  v5 = (PersonalizedItemManager *)a3;
  p_inputItems = &self->_inputItems;
  inputItems = self->_inputItems;
  if (inputItems != v5)
  {
    if (inputItems)
      -[PersonalizedItemManager removeObserver:](inputItems, "removeObserver:", self);
    objc_storeStrong((id *)&self->_inputItems, a3);
    if (*p_inputItems)
      -[PersonalizedItemManager addObserver:](*p_inputItems, "addObserver:", self);
    lock = self->_lock;
    v9 = _NSConcreteStackBlock;
    v10 = 3221225472;
    v11 = sub_100992868;
    v12 = &unk_1011AC8B0;
    v13 = self;
    v14 = v5;
    dispatch_async(lock, &v9);
    -[PersonalizedItemAutocompleteFilter _invalidateResults](self, "_invalidateResults", v9, v10, v11, v12, v13);

  }
}

- (void)setHasItemsWhenSearchStringIsEmpty:(BOOL)a3
{
  if (self->_hasItemsWhenSearchStringIsEmpty != a3)
  {
    self->_hasItemsWhenSearchStringIsEmpty = a3;
    -[PersonalizedItemAutocompleteFilter _invalidateResults](self, "_invalidateResults");
  }
}

- (void)_invalidateResults
{
  NSObject *lock;
  _QWORD block[5];

  lock = self->_lock;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100992924;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async(lock, block);
}

- (id)allItems
{
  id v3;
  NSObject *v4;
  NSObject *lock;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint8_t buf[4];
  id v19;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_100992B08;
  v16 = sub_100992B18;
  v17 = 0;
  v3 = sub_10043222C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "PersonalizedItemAutocompleteFilter - collecting results", buf, 2u);
  }

  lock = self->_lock;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100992B20;
  v11[3] = &unk_1011AD318;
  v11[4] = self;
  v11[5] = &v12;
  dispatch_sync(lock, v11);
  v6 = sub_10043222C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = objc_msgSend((id)v13[5], "count");
    *(_DWORD *)buf = 134217984;
    v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "PersonalizedItemAutocompleteFilter - collected %lu results", buf, 0xCu);
  }

  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (BOOL)itemIsAllowed:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = (+[AddressBookManager addressBookAllowed](AddressBookManager, "addressBookAllowed")
     || objc_msgSend(v3, "sourceType") != (id)4
     && objc_msgSend(v3, "sourceType") != (id)3
     && objc_msgSend(v3, "sourceType") != (id)6
     && objc_msgSend(v3, "sourceType") != (id)8
     && objc_msgSend(v3, "sourceType") != (id)13
     && objc_msgSend(v3, "sourceType") != (id)14
     && objc_msgSend(v3, "sourceType") != (id)31)
    && (objc_msgSend(v3, "sourceType") != (id)9 || objc_msgSend(v3, "sourceSubtype") != (id)36);

  return v4;
}

- (void)personalizedItemManager:(id)a3 didChangeItems:(id)a4 itemGroups:(id)a5
{
  id v6;
  NSObject *lock;
  id v8;
  void **v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  PersonalizedItemAutocompleteFilter *v13;
  id v14;

  v6 = a4;
  lock = self->_lock;
  v9 = _NSConcreteStackBlock;
  v10 = 3221225472;
  v11 = sub_100993184;
  v12 = &unk_1011AC8B0;
  v13 = self;
  v14 = v6;
  v8 = v6;
  dispatch_async(lock, &v9);
  -[PersonalizedItemAutocompleteFilter _invalidateResults](self, "_invalidateResults", v9, v10, v11, v12, v13);

}

- (PersonalizedItemManager)inputItems
{
  return self->_inputItems;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (BOOL)hasItemsWhenSearchStringIsEmpty
{
  return self->_hasItemsWhenSearchStringIsEmpty;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_inputItems, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_matchingItems, 0);
  objc_storeStrong((id *)&self->_personalizedItems, 0);
}

@end
