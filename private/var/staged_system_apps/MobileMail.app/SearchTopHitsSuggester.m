@implementation SearchTopHitsSuggester

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001D31C8;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005AA548 != -1)
    dispatch_once(&qword_1005AA548, block);
  return (OS_os_log *)(id)qword_1005AA540;
}

- (SearchTopHitsSuggester)initWithMessageRepository:(id)a3 bundleID:(id)a4
{
  id v7;
  id v8;
  SearchTopHitsSuggester *v9;
  SearchTopHitsSuggester *v10;
  NSString *v11;
  NSString *bundleID;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SearchTopHitsSuggester;
  v9 = -[SearchTopHitsSuggester init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_messageRepository, a3);
    v11 = (NSString *)objc_msgSend(v8, "copy");
    bundleID = v10->_bundleID;
    v10->_bundleID = v11;

  }
  return v10;
}

- (BOOL)shouldQueryForAsYouType
{
  return 1;
}

- (NSString)logIdentifier
{
  return (NSString *)CFSTR("TopHits");
}

- (NSArray)categories
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v2 = objc_alloc_init((Class)NSMutableArray);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MUISearchSuggestionCategory topHitsCategory](MUISearchSuggestionCategory, "topHitsCategory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MUISearchSuggestionCategory contactCategory](MUISearchSuggestionCategory, "contactCategory", v3));
  v9[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MUISearchSuggestionCategory genericCategory](MUISearchSuggestionCategory, "genericCategory"));
  v9[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 3));
  objc_msgSend(v2, "addObjectsFromArray:", v6);

  if (_os_feature_enabled_impl("Mail", "InstantAnswers"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MUISearchSuggestionCategory instantAnswersCategory](MUISearchSuggestionCategory, "instantAnswersCategory"));
    objc_msgSend(v2, "addObject:", v7);

  }
  return (NSArray *)v2;
}

- (id)generateSuggestionsUsingPhraseManager:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id *v8;
  id *v9;

  v6 = a3;
  v7 = a4;
  v8 = sub_1001D3510((id *)[_SearchTopHitsSuggesterQuery alloc], v6, v7, self);
  v9 = v8;
  if (v8)
    objc_msgSend(v8[5], "start");

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_messageRepository, 0);
}

@end
