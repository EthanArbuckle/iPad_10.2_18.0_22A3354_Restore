@implementation RAPSearchResultCategoryQuestion

- (RAPSearchResultCategoryQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 search:(id)a5
{
  id v8;
  id v9;
  RAPSearchResultCategoryQuestion *v10;
  RAPSearchResultCategoryQuestion *v11;
  objc_super v13;

  v8 = a4;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)RAPSearchResultCategoryQuestion;
  v10 = -[RAPQuestion initWithReport:parentQuestion:](&v13, "initWithReport:parentQuestion:", a3, v8);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_selectedValue, a5);
    objc_msgSend(v8, "addObserver:changeHandler:", v11, &stru_1011AFA60);
  }

  return v11;
}

+ (id)localizedHeaderText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Search issue [Report a Problem prompt]"), CFSTR("localized string not found"), 0));

  return v3;
}

- (int)analyticTarget
{
  return 1128;
}

- (int)userAction
{
  return 10120;
}

- (int64_t)questionCategory
{
  return 10;
}

- (void)resetCachedMenuItems
{
  -[RAPMenuQuestion removeMenuItemForFollowUpQuestionCategory:](self, "removeMenuItemForFollowUpQuestionCategory:", 10);
  -[RAPMenuQuestion removeMenuItemForFollowUpQuestionCategory:](self, "removeMenuItemForFollowUpQuestionCategory:", 9);
  -[RAPMenuQuestion resetMenu](self, "resetMenu");
}

- (id)mainMenuQuestionCategories
{
  NSArray *mainMenuQuestionCategories;

  mainMenuQuestionCategories = self->super._mainMenuQuestionCategories;
  if (!mainMenuQuestionCategories)
  {
    self->super._mainMenuQuestionCategories = (NSArray *)&off_101273020;
    mainMenuQuestionCategories = self->super._mainMenuQuestionCategories;
  }
  return mainMenuQuestionCategories;
}

- (BOOL)canDisplayMenuItemForQuestionCategory:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  unsigned __int8 v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion parentQuestion](self, "parentQuestion"));
  v6 = objc_opt_class(RAPSearchWhichOneQuestion);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectedValue"));
  if (v9)
  {
    if (a3 == 9)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectedValue"));
      v14 = objc_msgSend(v13, "searchResultsCount");

      v12 = v14 == (id)1;
    }
    else if (a3 == 10)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectedValue"));
      v11 = objc_msgSend(v10, "searchResultsCount");

      v12 = v11 != 0;
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[RAPSearchResultCategoryQuestion mainMenuQuestionCategories](self, "mainMenuQuestionCategories"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
      v12 = objc_msgSend(v15, "containsObject:", v16);

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)followUpQuestionForCategory:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  RAPSearchResultIncorrectQuestion *v8;
  void *v9;
  void *v10;
  RAPProblemNotListedQuestion *v11;
  RAPProblemNotListedQuestion *v12;
  void *v13;
  void *v14;
  RAPPlaceClosureQuestion *v15;

  switch(a3)
  {
    case 1:
      v12 = [RAPProblemNotListedQuestion alloc];
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion report](self, "report"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Other [Report an Issue subcategory]"), CFSTR("localized string not found"), 0));
      v11 = -[RAPProblemNotListedQuestion initWithReport:parentQuestion:localizedTitle:](v12, "initWithReport:parentQuestion:localizedTitle:", v9, self, v14);

      break;
    case 9:
      v15 = [RAPPlaceClosureQuestion alloc];
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion report](self, "report"));
      v11 = -[RAPQuestion initWithReport:parentQuestion:](v15, "initWithReport:parentQuestion:", v9, self);
      break;
    case 10:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion parentQuestion](self, "parentQuestion"));
      v5 = objc_opt_class(RAPSearchWhichOneQuestion);
      if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
        v6 = v4;
      else
        v6 = 0;
      v7 = v6;

      v8 = [RAPSearchResultIncorrectQuestion alloc];
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion report](self, "report"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectedValue"));

      v11 = -[RAPSearchResultIncorrectQuestion initWithReport:parentQuestion:searchResultsCount:](v8, "initWithReport:parentQuestion:searchResultsCount:", v9, self, objc_msgSend(v10, "searchResultsCount"));
      break;
    default:
      v11 = 0;
      return v11;
  }

  return v11;
}

- (id)selectedPlace
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  SearchResult *v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion parentQuestion](self, "parentQuestion"));
  v3 = objc_opt_class(RAPSearchWhichOneQuestion);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
    v4 = v2;
  else
    v4 = 0;
  v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectedValue"));
  v7 = objc_opt_class(HistoryRAPUserSearch);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "geoMapItemForSearchResultAtIndex:", 0));
  v11 = -[SearchResult initWithGEOMapItem:]([SearchResult alloc], "initWithGEOMapItem:", v10);

  return v11;
}

- (RAPUserSearch)selectedValue
{
  return self->_selectedValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedValue, 0);
}

@end
