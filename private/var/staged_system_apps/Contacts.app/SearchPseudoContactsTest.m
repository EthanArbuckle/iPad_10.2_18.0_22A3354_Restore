@implementation SearchPseudoContactsTest

- (BOOL)prepareForTestWithOptions:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  _QWORD v12[5];
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SearchPseudoContactsTest;
  v5 = -[ContactsTest prepareForTestWithOptions:](&v13, "prepareForTestWithOptions:", v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[SearchPseudoContactsTest setExtraResults:](self, "setExtraResults:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("animate")));
    -[SearchPseudoContactsTest setAnimate:](self, "setAnimate:", objc_msgSend(v7, "BOOLValue"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("searchQueries")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("%")));
    -[SearchPseudoContactsTest setAllSearchQueries:](self, "setAllSearchQueries:", v9);
    -[SearchPseudoContactsTest setCurrentQueryIndex:](self, "setCurrentQueryIndex:", 0);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100006A78;
    v12[3] = &unk_10001C488;
    v12[4] = self;
    v10 = objc_retainBlock(v12);
    -[ContactsTest showContactListWithCompletionBlock:](self, "showContactListWithCompletionBlock:", v10);

  }
  return v5;
}

- (void)startSearchQuery
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPseudoContactsTest allSearchQueries](self, "allSearchQueries"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndex:", -[SearchPseudoContactsTest currentQueryIndex](self, "currentQueryIndex")));

  -[SearchPseudoContactsTest setLastSearchBeginTime:](self, "setLastSearchBeginTime:", CFAbsoluteTimeGetCurrent());
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsTest contactNavigationController](self, "contactNavigationController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contactListViewController"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100006B78;
  v7[3] = &unk_10001C488;
  v7[4] = self;
  objc_msgSend(v6, "searchForString:animated:completionBlock:", v4, -[SearchPseudoContactsTest animate](self, "animate"), v7);

}

- (NSMutableDictionary)extraResults
{
  return self->_extraResults;
}

- (void)setExtraResults:(id)a3
{
  objc_storeStrong((id *)&self->_extraResults, a3);
}

- (unint64_t)currentDirectoryIndex
{
  return self->_currentDirectoryIndex;
}

- (void)setCurrentDirectoryIndex:(unint64_t)a3
{
  self->_currentDirectoryIndex = a3;
}

- (BOOL)animate
{
  return self->_animate;
}

- (void)setAnimate:(BOOL)a3
{
  self->_animate = a3;
}

- (NSArray)allSearchQueries
{
  return self->_allSearchQueries;
}

- (void)setAllSearchQueries:(id)a3
{
  objc_storeStrong((id *)&self->_allSearchQueries, a3);
}

- (unint64_t)currentQueryIndex
{
  return self->_currentQueryIndex;
}

- (void)setCurrentQueryIndex:(unint64_t)a3
{
  self->_currentQueryIndex = a3;
}

- (double)lastSearchBeginTime
{
  return self->_lastSearchBeginTime;
}

- (void)setLastSearchBeginTime:(double)a3
{
  self->_lastSearchBeginTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allSearchQueries, 0);
  objc_storeStrong((id *)&self->_extraResults, 0);
}

@end
