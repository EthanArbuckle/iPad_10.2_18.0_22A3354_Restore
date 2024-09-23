@implementation ScrollSearchByNameTest

- (BOOL)prepareForTestWithOptions:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void ***v8;
  void **v10;
  uint64_t v11;
  id (*v12)(uint64_t);
  void *v13;
  ScrollSearchByNameTest *v14;
  id v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ScrollSearchByNameTest;
  v5 = -[ContactsTest prepareForTestWithOptions:](&v16, "prepareForTestWithOptions:", v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("animate")));
    -[ScrollSearchByNameTest setAnimate:](self, "setAnimate:", objc_msgSend(v6, "BOOLValue"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("searchQuery")));
    -[ScrollSearchByNameTest setQueryString:](self, "setQueryString:", v7);

    -[ScrollSearchByNameTest setCurrentQueryIndex:](self, "setCurrentQueryIndex:", 0);
    v10 = _NSConcreteStackBlock;
    v11 = 3221225472;
    v12 = sub_10000E12C;
    v13 = &unk_10001C538;
    v14 = self;
    v15 = v4;
    v8 = objc_retainBlock(&v10);
    -[ContactsTest showContactListWithCompletionBlock:](self, "showContactListWithCompletionBlock:", v8, v10, v11, v12, v13, v14);

  }
  return v5;
}

- (void)startSearchQueryWithOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsTest contactNavigationController](self, "contactNavigationController", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contactListViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ScrollSearchByNameTest queryString](self, "queryString"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000E1E4;
  v7[3] = &unk_10001C488;
  v7[4] = self;
  objc_msgSend(v5, "searchForString:animated:completionBlock:", v6, -[ScrollSearchByNameTest animate](self, "animate"), v7);

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

- (NSString)queryString
{
  return self->_queryString;
}

- (void)setQueryString:(id)a3
{
  objc_storeStrong((id *)&self->_queryString, a3);
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
  objc_storeStrong((id *)&self->_queryString, 0);
  objc_storeStrong((id *)&self->_extraResults, 0);
}

@end
