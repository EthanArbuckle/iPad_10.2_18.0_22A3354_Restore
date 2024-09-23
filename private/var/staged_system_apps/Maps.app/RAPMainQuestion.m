@implementation RAPMainQuestion

- (void)updateCategoriesFromLayoutManager:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  NSArray *mainMenuItems;
  void *v8;
  NSArray *v9;
  NSArray *homeWorkMenuItems;
  void *v11;
  NSArray *v12;
  NSArray *incidentMenuItems;
  void *v14;
  void *v15;
  RAPMenuItem *v16;
  RAPMenuItem *otherIssueMenuItem;
  id v18;
  void *v19;
  NSArray *v20;
  NSArray *menuItems;
  RAPMenuItem *v22;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "correctionLayoutItems"));
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue(-[RAPMainQuestion _questionsFromLayoutItems:](self, "_questionsFromLayoutItems:", v5));
  mainMenuItems = self->super._mainMenuItems;
  self->super._mainMenuItems = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "addPlaceLayoutItems"));
  v9 = (NSArray *)objc_claimAutoreleasedReturnValue(-[RAPMainQuestion _questionsFromLayoutItems:](self, "_questionsFromLayoutItems:", v8));
  homeWorkMenuItems = self->_homeWorkMenuItems;
  self->_homeWorkMenuItems = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "incidentLayoutItems"));
  v12 = (NSArray *)objc_claimAutoreleasedReturnValue(-[RAPMainQuestion _incidentQuestionsFromLayoutItems:](self, "_incidentQuestionsFromLayoutItems:", v11));
  incidentMenuItems = self->_incidentMenuItems;
  self->_incidentMenuItems = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "otherLayoutItems"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMainQuestion _questionsFromLayoutItems:](self, "_questionsFromLayoutItems:", v14));
  v16 = (RAPMenuItem *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstObject"));
  otherIssueMenuItem = self->_otherIssueMenuItem;
  self->_otherIssueMenuItem = v16;

  v18 = objc_alloc_init((Class)NSMutableArray);
  if (-[NSArray count](self->super._mainMenuItems, "count"))
    objc_msgSend(v18, "addObject:", self->super._mainMenuItems);
  if (-[NSArray count](self->_incidentMenuItems, "count"))
    objc_msgSend(v18, "addObject:", self->_incidentMenuItems);
  if (-[NSArray count](self->_homeWorkMenuItems, "count"))
    objc_msgSend(v18, "addObject:", self->_homeWorkMenuItems);
  if (self->_otherIssueMenuItem)
  {
    v22 = self->_otherIssueMenuItem;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
    objc_msgSend(v18, "addObject:", v19);

  }
  v20 = (NSArray *)objc_msgSend(v18, "copy");
  menuItems = self->super._menuItems;
  self->super._menuItems = v20;

}

- (id)_incidentQuestionsFromLayoutItems:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  RAPIncidentsQuestion *v12;
  void *v13;
  RAPIncidentsQuestion *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableArray);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v10);
        v12 = [RAPIncidentsQuestion alloc];
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion report](self, "report", (_QWORD)v17));
        v14 = -[RAPIncidentsQuestion initWithReport:parentQuestion:incidentLayoutItem:](v12, "initWithReport:parentQuestion:incidentLayoutItem:", v13, self, v11);

        objc_msgSend(v5, "addObjectIfNotNil:", v14);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  v15 = objc_msgSend(v5, "copy");
  return v15;
}

- (id)_questionsFromLayoutItems:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableArray);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fieldType", (_QWORD)v17));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMenuQuestion menuItemWithFollowUpQuestionCategory:](self, "menuItemWithFollowUpQuestionCategory:", objc_msgSend(v12, "integerValue")));

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "displayText"));
        objc_msgSend(v13, "setLocalizedServerControlledDescription:", v14);

        objc_msgSend(v5, "addObjectIfNotNil:", v13);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  v15 = objc_msgSend(v5, "copy");
  return v15;
}

- (id)mainMenuQuestionCategories
{
  NSArray *mainMenuQuestionCategories;

  mainMenuQuestionCategories = self->super._mainMenuQuestionCategories;
  if (!mainMenuQuestionCategories)
  {
    self->super._mainMenuQuestionCategories = (NSArray *)&off_101273110;
    mainMenuQuestionCategories = self->super._mainMenuQuestionCategories;
  }
  return mainMenuQuestionCategories;
}

- (int)analyticTarget
{
  return 603;
}

+ (id)localizedHeaderText
{
  id v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___RAPMainQuestion;
  v2 = objc_msgSendSuper2(&v4, "localizedHeaderText");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (BOOL)shouldShowIcons
{
  return 1;
}

- (BOOL)shouldShowSubtitles
{
  return 1;
}

- (id)menuItems
{
  NSArray *menuItems;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  NSArray *v11;
  NSArray *allMenuItems;
  void *v14;

  menuItems = self->super._menuItems;
  if (!menuItems)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 3));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMenuQuestion mainMenuItems](self, "mainMenuItems"));
    objc_msgSend(v4, "addObject:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMainQuestion homeWorkMenuItems](self, "homeWorkMenuItems"));
    if (objc_msgSend(v6, "count"))
      objc_msgSend(v4, "addObject:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMainQuestion incidentMenuItems](self, "incidentMenuItems"));
    if (objc_msgSend(v7, "count"))
      objc_msgSend(v4, "addObject:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMainQuestion otherIssueMenuItem](self, "otherIssueMenuItem"));
    v14 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
    objc_msgSend(v4, "addObject:", v9);

    v10 = (NSArray *)objc_msgSend(v4, "copy");
    v11 = self->super._menuItems;
    self->super._menuItems = v10;

    allMenuItems = self->super._allMenuItems;
    self->super._allMenuItems = 0;

    menuItems = self->super._menuItems;
  }
  return menuItems;
}

- (NSArray)homeWorkMenuItems
{
  NSArray *homeWorkMenuItems;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSArray *v17;
  NSArray *v18;

  homeWorkMenuItems = self->_homeWorkMenuItems;
  if (!homeWorkMenuItems)
  {
    v4 = objc_alloc_init((Class)NSMutableArray);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion _context](self, "_context"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "homeShortcuts"));
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMenuQuestion menuItemWithFollowUpQuestionCategory:](self, "menuItemWithFollowUpQuestionCategory:", 16));
      objc_msgSend(v4, "addObjectIfNotNil:", v8);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion _context](self, "_context"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "workShortcuts"));
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMenuQuestion menuItemWithFollowUpQuestionCategory:](self, "menuItemWithFollowUpQuestionCategory:", 17));
      objc_msgSend(v4, "addObjectIfNotNil:", v12);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion _context](self, "_context"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "schoolShortcuts"));
    v15 = objc_msgSend(v14, "count");

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMenuQuestion menuItemWithFollowUpQuestionCategory:](self, "menuItemWithFollowUpQuestionCategory:", 18));
      objc_msgSend(v4, "addObjectIfNotNil:", v16);

    }
    v17 = (NSArray *)objc_msgSend(v4, "copy");
    v18 = self->_homeWorkMenuItems;
    self->_homeWorkMenuItems = v17;

    homeWorkMenuItems = self->_homeWorkMenuItems;
  }
  return homeWorkMenuItems;
}

- (NSArray)incidentMenuItems
{
  return self->_incidentMenuItems;
}

- (RAPMenuItem)otherIssueMenuItem
{
  RAPMenuItem *otherIssueMenuItem;
  RAPMenuItem *v4;
  RAPMenuItem *v5;

  otherIssueMenuItem = self->_otherIssueMenuItem;
  if (!otherIssueMenuItem)
  {
    v4 = (RAPMenuItem *)objc_claimAutoreleasedReturnValue(-[RAPMenuQuestion menuItemWithFollowUpQuestionCategory:](self, "menuItemWithFollowUpQuestionCategory:", 1));
    v5 = self->_otherIssueMenuItem;
    self->_otherIssueMenuItem = v4;

    otherIssueMenuItem = self->_otherIssueMenuItem;
  }
  return otherIssueMenuItem;
}

- (void)resetMenu
{
  NSArray *homeWorkMenuItems;
  RAPMenuItem *otherIssueMenuItem;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RAPMainQuestion;
  -[RAPMenuQuestion resetMenu](&v5, "resetMenu");
  homeWorkMenuItems = self->_homeWorkMenuItems;
  self->_homeWorkMenuItems = 0;

  otherIssueMenuItem = self->_otherIssueMenuItem;
  self->_otherIssueMenuItem = 0;

  -[RAPQuestion _didChange](self, "_didChange");
}

- (BOOL)canDisplayMenuItemForQuestionCategory:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion report](self, "report"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_context"));

  if (a3 == 7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion _context](self, "_context"));
    v9 = +[RAPDirectionsWhichOneQuestion _canDisplayForContext:transportMode:](RAPDirectionsWhichOneQuestion, "_canDisplayForContext:transportMode:", v8, 0xFFFFFFFLL);
  }
  else if (a3 == 12)
  {
    if (!sub_1003DE4B8(v7))
    {
      v9 = 0;
      goto LABEL_8;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchesHistory"));
    v9 = objc_msgSend(v8, "count") != 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMainQuestion mainMenuQuestionCategories](self, "mainMenuQuestionCategories"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    v9 = objc_msgSend(v8, "containsObject:", v10);

  }
LABEL_8:

  return v9;
}

- (id)followUpQuestionForCategory:(int64_t)a3
{
  RAPPersonalPlaceCorrectionsWhichOneQuestion *v3;
  RAPPersonalPlaceCorrectionsWhichOneQuestion *v5;
  void *v6;
  RAPPersonalPlaceCorrectionsWhichOneQuestion *v7;
  void *v8;
  RAPMainQuestion *v9;
  uint64_t v10;
  RAPPersonalPlaceCorrectionsWhichOneQuestion *v11;
  RAPPersonalPlaceCorrectionsWhichOneQuestion *v12;
  RAPPersonalPlaceCorrectionsWhichOneQuestion *v13;
  __objc2_class *v14;
  id v15;

  v3 = 0;
  switch(a3)
  {
    case 1:
      v14 = RAPProblemNotListedQuestion;
      goto LABEL_10;
    case 7:
      v14 = RAPDirectionsWhichOneQuestion;
      goto LABEL_10;
    case 8:
      v14 = RAPLabelCorrectionsQuestion;
      goto LABEL_10;
    case 12:
      v14 = RAPSearchWhichOneQuestion;
LABEL_10:
      v15 = [v14 alloc];
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion report](self, "report"));
      v13 = (RAPPersonalPlaceCorrectionsWhichOneQuestion *)objc_msgSend(v15, "initWithReport:parentQuestion:", v6, self);
      goto LABEL_11;
    case 13:
    case 16:
      v5 = [RAPPersonalPlaceCorrectionsWhichOneQuestion alloc];
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion report](self, "report"));
      v7 = v5;
      v8 = v6;
      v9 = self;
      v10 = 2;
      goto LABEL_5;
    case 14:
    case 17:
      v11 = [RAPPersonalPlaceCorrectionsWhichOneQuestion alloc];
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion report](self, "report"));
      v7 = v11;
      v8 = v6;
      v9 = self;
      v10 = 3;
      goto LABEL_5;
    case 15:
    case 18:
      v12 = [RAPPersonalPlaceCorrectionsWhichOneQuestion alloc];
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion report](self, "report"));
      v7 = v12;
      v8 = v6;
      v9 = self;
      v10 = 5;
LABEL_5:
      v13 = -[RAPPersonalPlaceCorrectionsWhichOneQuestion initWithReport:parentQuestion:shortcutType:](v7, "initWithReport:parentQuestion:shortcutType:", v8, v9, v10);
LABEL_11:
      v3 = v13;

      break;
    default:
      return v3;
  }
  return v3;
}

- (void)_fillSubmissionParameters:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion parentQuestion](self, "parentQuestion"));
  objc_msgSend(v4, "_fillSubmissionParameters:", v15);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "commonContext"));
  if (!v5)
  {
    v6 = objc_alloc_init((Class)GEORPFeedbackCommonContext);
    objc_msgSend(v15, "setCommonContext:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion _context](self, "_context"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayedDirectionsPlan"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "commonContext"));
    v10 = v9;
    v11 = 17;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion _context](self, "_context"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentDirections"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "commonContext"));
    v10 = v9;
    if (v13)
      v11 = 16;
    else
      v11 = 2;
  }
  objc_msgSend(v9, "addUserPath:", v11);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMenuQuestion selectedMenuItem](self, "selectedMenuItem"));
  objc_msgSend(v14, "_fillSubmissionParameters:", v15);

}

- (id)_alternateMapViewContext
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMenuQuestion selectedMenuItem](self, "selectedMenuItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_alternateMapViewContext"));

  return v3;
}

- (void)setHomeWorkMenuItems:(id)a3
{
  objc_storeStrong((id *)&self->_homeWorkMenuItems, a3);
}

- (void)setIncidentMenuItems:(id)a3
{
  objc_storeStrong((id *)&self->_incidentMenuItems, a3);
}

- (void)setOtherIssueMenuItem:(id)a3
{
  objc_storeStrong((id *)&self->_otherIssueMenuItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherIssueMenuItem, 0);
  objc_storeStrong((id *)&self->_incidentMenuItems, 0);
  objc_storeStrong((id *)&self->_homeWorkMenuItems, 0);
  objc_storeStrong((id *)&self->_homeWorkCategories, 0);
}

@end
