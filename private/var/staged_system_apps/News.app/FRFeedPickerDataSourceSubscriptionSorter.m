@implementation FRFeedPickerDataSourceSubscriptionSorter

+ (void)initialize
{
  void *v2;
  void *v3;
  const __CFString *v4;
  void *v5;

  if ((id)objc_opt_class(FRFeedPickerDataSourceSubscriptionSorter, a2) == a1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v4 = CFSTR("FRFeedPickerDataSourceOpenedLookup");
    v5 = &__NSDictionary0__struct;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v5, &v4, 1));
    objc_msgSend(v2, "registerDefaults:", v3);

  }
}

- (FRFeedPickerDataSourceSubscriptionSorter)init
{
  FRFeedPickerDataSourceSubscriptionSorter *v3;
  FRFeedPickerDataSourceSubscriptionSorter *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  BOOL v22;
  NSMutableDictionary *tagOpenedDate;
  FRFeedPickerDataSourceSubscriptionSorter *v25;
  NSMutableDictionary *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];

  +[NSThread isMainThread](NSThread, "isMainThread");
  v31.receiver = self;
  v31.super_class = (Class)FRFeedPickerDataSourceSubscriptionSorter;
  v3 = -[FRFeedPickerDataSourceSubscriptionSorter init](&v31, "init");
  v4 = v3;
  if (v3)
  {
    v25 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dictionaryForKey:", CFSTR("FRFeedPickerDataSourceOpenedLookup")));

    v26 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v8)
    {
      v10 = v8;
      v11 = *(_QWORD *)v28;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v28 != v11)
            objc_enumerationMutation(v7);
          v13 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v12);
          v14 = objc_opt_class(NSString, v9);
          v15 = FCDynamicCast(v14, v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
          v18 = objc_opt_class(NSDate, v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v13));
          v20 = FCDynamicCast(v18, v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

          if (v16)
            v22 = v21 == 0;
          else
            v22 = 1;
          if (!v22)
            -[NSMutableDictionary setObject:forKeyedSubscript:](v26, "setObject:forKeyedSubscript:", v21, v16);

          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v10);
    }

    v4 = v25;
    tagOpenedDate = v25->_tagOpenedDate;
    v25->_tagOpenedDate = v26;

  }
  return v4;
}

- (id)comparatorForSubscriptions
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001FBE4;
  v3[3] = &unk_1000D99E0;
  v3[4] = self;
  return objc_retainBlock(v3);
}

- (id)sortSubscriptionsAlphabetically:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[NSThread isMainThread](NSThread, "isMainThread");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerDataSourceSubscriptionSorter comparatorForSubscriptions](self, "comparatorForSubscriptions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sortedArrayWithOptions:usingComparator:", 1, v5));

  return v6;
}

- (id)trimTheArticle:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "rangeOfString:options:", CFSTR("the "), 9) == (id)0x7FFFFFFFFFFFFFFFLL)
    v5 = v3;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringFromIndex:", v4));
  v6 = v5;

  return v6;
}

- (id)sortSubscriptionsByRecency:(id)a3 sortedPopularTagIDs:(id)a4
{
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100020070;
  v8[3] = &unk_1000D9A08;
  v8[4] = self;
  v9 = a4;
  v5 = v9;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "sortedArrayUsingComparator:", v8));

  return v6;
}

- (void)recordSubscriptionAsRecentlyOpened:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v4 = a3;
  +[NSThread isMainThread](NSThread, "isMainThread");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerDataSourceSubscriptionSorter tagOpenedDate](self, "tagOpenedDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedPickerDataSourceSubscriptionSorter tagOpenedDate](self, "tagOpenedDate"));
  v9 = objc_msgSend(v8, "copy");
  objc_msgSend(v10, "setObject:forKey:", v9, CFSTR("FRFeedPickerDataSourceOpenedLookup"));

}

- (NSMutableDictionary)tagOpenedDate
{
  return self->_tagOpenedDate;
}

- (void)setTagOpenedDate:(id)a3
{
  objc_storeStrong((id *)&self->_tagOpenedDate, a3);
}

- (NSArray)fallbackSortOrder
{
  return self->_fallbackSortOrder;
}

- (void)setFallbackSortOrder:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackSortOrder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackSortOrder, 0);
  objc_storeStrong((id *)&self->_tagOpenedDate, 0);
}

@end
