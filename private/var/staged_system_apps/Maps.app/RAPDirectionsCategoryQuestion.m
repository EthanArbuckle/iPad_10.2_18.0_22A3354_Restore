@implementation RAPDirectionsCategoryQuestion

- (RAPDirectionsCategoryQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 directions:(id)a5
{
  id v8;
  id v9;
  RAPDirectionsCategoryQuestion *v10;
  RAPDirectionsCategoryQuestion *v11;
  objc_super v13;

  v8 = a4;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)RAPDirectionsCategoryQuestion;
  v10 = -[RAPQuestion initWithReport:parentQuestion:](&v13, "initWithReport:parentQuestion:", a3, v8);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_selectedValue, a5);
    objc_msgSend(v8, "addObserver:changeHandler:", v11, &stru_1011BF8A0);
  }

  return v11;
}

+ (id)localizedHeaderText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Issue with [Report a Problem prompt]"), CFSTR("localized string not found"), 0));

  return v3;
}

- (int)analyticTarget
{
  return 1100;
}

- (int64_t)questionCategory
{
  return 5;
}

- (void)resetBadRouteSuggestionsQuestion
{
  RAPMenuItem *betterRouteAvailableMenuItem;

  betterRouteAvailableMenuItem = self->_betterRouteAvailableMenuItem;
  self->_betterRouteAvailableMenuItem = 0;

}

- (id)mainMenuQuestionCategories
{
  NSArray *mainMenuQuestionCategories;

  mainMenuQuestionCategories = self->super._mainMenuQuestionCategories;
  if (!mainMenuQuestionCategories)
  {
    self->super._mainMenuQuestionCategories = (NSArray *)&off_101273A88;
    mainMenuQuestionCategories = self->super._mainMenuQuestionCategories;
  }
  return mainMenuQuestionCategories;
}

- (BOOL)canDisplayMenuItemForQuestionCategory:(int64_t)a3
{
  RAPUserDirectionRequest *selectedValue;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  selectedValue = self->_selectedValue;
  if (selectedValue)
  {
    switch(a3)
    {
      case 4:
        LOBYTE(selectedValue) = -[RAPUserDirectionRequest requestedTransportType](selectedValue, "requestedTransportType") != 1;
        return (char)selectedValue;
      case 3:
        LODWORD(selectedValue) = sub_1003DE840((uint64_t)selectedValue);
        if (!(_DWORD)selectedValue)
          return (char)selectedValue;
        break;
      case 2:
        LOBYTE(selectedValue) = -[RAPDirectionsCategoryQuestion shouldShowBetterRouteAvailable](self, "shouldShowBetterRouteAvailable");
        return (char)selectedValue;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsCategoryQuestion mainMenuQuestionCategories](self, "mainMenuQuestionCategories"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    v8 = objc_msgSend(v6, "containsObject:", v7);

    LOBYTE(selectedValue) = v8;
  }
  return (char)selectedValue;
}

- (BOOL)shouldShowBetterRouteAvailable
{
  RAPDirectionsCategoryQuestion *v2;
  void *v3;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion _context](self, "_context"));
  LOBYTE(v2) = +[RAPBadRouteSuggestionsQuestion _canDisplayForContext:selection:](RAPBadRouteSuggestionsQuestion, "_canDisplayForContext:selection:", v3, v2->_selectedValue);

  return (char)v2;
}

- (RAPMenuItem)betterRouteAvailableMenuItem
{
  RAPMenuItem *betterRouteAvailableMenuItem;
  RAPMenuItem *v4;
  RAPMenuItem *v5;

  betterRouteAvailableMenuItem = self->_betterRouteAvailableMenuItem;
  if (!betterRouteAvailableMenuItem)
  {
    v4 = (RAPMenuItem *)objc_claimAutoreleasedReturnValue(-[RAPMenuQuestion menuItemWithFollowUpQuestionCategory:](self, "menuItemWithFollowUpQuestionCategory:", 2));
    v5 = self->_betterRouteAvailableMenuItem;
    self->_betterRouteAvailableMenuItem = v4;

    betterRouteAvailableMenuItem = self->_betterRouteAvailableMenuItem;
  }
  return betterRouteAvailableMenuItem;
}

- (id)followUpQuestionForCategory:(int64_t)a3
{
  RAPProblemNotListedQuestion *v3;
  RAPProblemNotListedQuestion *v5;
  void *v6;
  void *v7;
  void *v8;
  __objc2_class *v9;
  id v10;
  RAPDirectionInstructionsIncorrectQuestion *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  CLLocationDegrees v16;
  CLLocationDegrees v17;
  CLLocationCoordinate2D v18;
  RAPArrivalEntryPointIncorrectQuestion *v19;
  RAPDirectionInstructionsIncorrectQuestion *v20;

  v3 = 0;
  switch(a3)
  {
    case 1:
      v5 = [RAPProblemNotListedQuestion alloc];
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion report](self, "report"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Other [Report an Issue subcategory]"), CFSTR("localized string not found"), 0));
      v3 = -[RAPProblemNotListedQuestion initWithReport:parentQuestion:localizedTitle:](v5, "initWithReport:parentQuestion:localizedTitle:", v6, self, v8);

      goto LABEL_10;
    case 2:
      v9 = RAPBadRouteSuggestionsQuestion;
      goto LABEL_5;
    case 3:
      v9 = RAPArrivalTimeIncorrectQuestion;
LABEL_5:
      v10 = [v9 alloc];
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion report](self, "report"));
      v11 = (RAPDirectionInstructionsIncorrectQuestion *)objc_msgSend(v10, "initWithReport:parentQuestion:", v6, self);
      goto LABEL_12;
    case 4:
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion parentQuestion](self, "parentQuestion"));
      v13 = objc_opt_class(RAPDirectionsWhichOneQuestion);
      if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
        v14 = v12;
      else
        v14 = 0;
      v15 = v14;

      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "routeFromRecording"));
      objc_msgSend(v6, "pointAt:", objc_msgSend(v6, "pointCount") - 1);
      v18 = CLLocationCoordinate2DMake(v16, v17);
      v19 = [RAPArrivalEntryPointIncorrectQuestion alloc];
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion report](self, "report"));
      v3 = -[RAPArrivalEntryPointIncorrectQuestion initWithReport:parentQuestion:arrivalPoint:](v19, "initWithReport:parentQuestion:arrivalPoint:", v7, self, v18.latitude, v18.longitude);
LABEL_10:

      goto LABEL_13;
    case 6:
      v20 = [RAPDirectionInstructionsIncorrectQuestion alloc];
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion report](self, "report"));
      v11 = -[RAPDirectionInstructionsIncorrectQuestion initWithReport:parentQuestion:direction:](v20, "initWithReport:parentQuestion:direction:", v6, self, self->_selectedValue);
LABEL_12:
      v3 = (RAPProblemNotListedQuestion *)v11;
LABEL_13:

      break;
    default:
      return v3;
  }
  return v3;
}

- (RAPUserDirectionRequest)selectedValue
{
  return self->_selectedValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_betterRouteAvailableMenuItem, 0);
  objc_storeStrong((id *)&self->_selectedValue, 0);
}

@end
