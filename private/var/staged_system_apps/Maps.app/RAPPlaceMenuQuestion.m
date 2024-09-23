@implementation RAPPlaceMenuQuestion

- (RAPPlaceMenuQuestion)initWithReport:(id)a3 reportedPlace:(id)a4
{
  return -[RAPPlaceMenuQuestion initWithReport:parentQuestion:reportedPlace:](self, "initWithReport:parentQuestion:reportedPlace:", a3, 0, a4);
}

- (RAPPlaceMenuQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 reportedPlace:(id)a5
{
  id v9;
  RAPPlaceMenuQuestion *v10;
  RAPPlaceMenuQuestion *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)RAPPlaceMenuQuestion;
  v10 = -[RAPQuestion initWithReport:parentQuestion:](&v13, "initWithReport:parentQuestion:", a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_reportedPlace, a5);

  return v11;
}

- (int)analyticTarget
{
  return 1138;
}

- (id)mainMenuItems
{
  NSArray *mainMenuItems;
  id v4;
  NSArray *v5;
  NSArray *v6;

  mainMenuItems = self->super._mainMenuItems;
  if (!mainMenuItems)
  {
    v4 = objc_alloc_init((Class)NSMutableArray);
    v5 = (NSArray *)objc_msgSend(v4, "copy");
    v6 = self->super._mainMenuItems;
    self->super._mainMenuItems = v5;

    mainMenuItems = self->super._mainMenuItems;
  }
  return mainMenuItems;
}

- (id)_alternateMapViewContext
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMenuQuestion selectedMenuItem](self, "selectedMenuItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_alternateMapViewContext"));

  return v3;
}

- (BOOL)shouldLoadClaimThisBusiness
{
  return 1;
}

- (void)_fillSubmissionParameters:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commonContext"));

  if (!v5)
  {
    v6 = objc_alloc_init((Class)GEORPFeedbackCommonContext);
    objc_msgSend(v4, "setCommonContext:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commonContext"));
  objc_msgSend(v7, "addUserPath:", 1);

  v8.receiver = self;
  v8.super_class = (Class)RAPPlaceMenuQuestion;
  -[RAPMenuQuestion _fillSubmissionParameters:](&v8, "_fillSubmissionParameters:", v4);

}

- (int64_t)snippetStyle
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlaceMenuQuestion reportedPlace](self, "reportedPlace"));

  return v2 != 0;
}

- (MKMapItem)snippetMapItem
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlaceMenuQuestion reportedPlace](self, "reportedPlace"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mapItem"));

  return (MKMapItem *)v3;
}

- (id)followUpQuestionForCategory:(int64_t)a3
{
  __objc2_class *v4;
  id v5;
  void *v6;
  id v7;

  if (a3 == 1)
  {
    v4 = RAPProblemNotListedQuestion;
  }
  else
  {
    if (a3 != 9)
    {
      v7 = 0;
      return v7;
    }
    v4 = RAPPlaceClosureQuestion;
  }
  v5 = [v4 alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion report](self, "report"));
  v7 = objc_msgSend(v5, "initWithReport:parentQuestion:", v6, self);

  return v7;
}

- (RAPPlace)reportedPlace
{
  return self->_reportedPlace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportedPlace, 0);
}

@end
