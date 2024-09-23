@implementation RAPDirectionsWhichOneQuestion

- (NSString)localizedTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Navigation [Report a Problem category]"), CFSTR("localized string not found"), 0));

  return (NSString *)v3;
}

+ (id)localizedTransitTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("bad directions [Report a Problem category]"), CFSTR("localized string not found"), 0));

  return v3;
}

- (NSString)localizedDescription
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Navigation description [Report an Issue category]"), CFSTR("localized string not found"), 0));

  return (NSString *)v3;
}

- (UIImage)image
{
  return +[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("recentroute"));
}

- (RAPDirectionsWhichOneQuestion)initWithReport:(id)a3 parentQuestion:(id)a4
{
  return -[RAPDirectionsWhichOneQuestion initWithReport:parentQuestion:transportType:selectableRequests:](self, "initWithReport:parentQuestion:transportType:selectableRequests:", a3, a4, 0xFFFFFFFLL, 0);
}

- (RAPDirectionsWhichOneQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 transportType:(unint64_t)a5
{
  return -[RAPDirectionsWhichOneQuestion initWithReport:parentQuestion:transportType:selectableRequests:](self, "initWithReport:parentQuestion:transportType:selectableRequests:", a3, a4, a5, 0);
}

- (RAPDirectionsWhichOneQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 transportType:(unint64_t)a5 selectableRequests:(id)a6
{
  id v10;
  id v11;
  RAPDirectionsWhichOneQuestion *v12;
  RAPDirectionsWhichOneQuestion *v13;
  objc_super v15;

  v10 = a4;
  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)RAPDirectionsWhichOneQuestion;
  v12 = -[RAPQuestion initWithReport:parentQuestion:](&v15, "initWithReport:parentQuestion:", a3, v10);
  v13 = v12;
  if (v12)
  {
    v12->_isInitialQuestion = v10 == 0;
    v12->_transportType = a5;
    objc_storeStrong((id *)&v12->_selectableDirectionsRequests, a6);
  }

  return v13;
}

- (RAPDirectionsWhichOneQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 selectableDirectionRequests:(id)a5
{
  return -[RAPDirectionsWhichOneQuestion initWithReport:parentQuestion:transportType:selectableRequests:](self, "initWithReport:parentQuestion:transportType:selectableRequests:", a3, a4, 0xFFFFFFFLL, a5);
}

- (int64_t)questionCategory
{
  return 7;
}

- (int)analyticTarget
{
  return 1100;
}

+ (BOOL)_canDisplayForContext:(id)a3 transportMode:(unint64_t)a4
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  unint64_t v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "directionsHistory", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recording"));
        if (v11)
        {
          v12 = (void *)v11;
          v13 = objc_msgSend(v10, "requestedTransportType");
          v14 = v13 > 5 ? 1 : qword_100E39C60[v13];
          v15 = v14 & a4;

          if (v15)
          {
            v16 = 1;
            goto LABEL_15;
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v7)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_15:

  return v16;
}

- (NSString)localizedSelectDirectionsRequestPrompt
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Route [Report a Problem prompt]"), CFSTR("localized string not found"), 0));

  return (NSString *)v3;
}

- (NSArray)selectableDirectionsRequests
{
  NSArray *selectableDirectionsRequests;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t transportType;
  unsigned int v15;
  uint64_t v16;
  NSArray *v17;
  NSArray *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  selectableDirectionsRequests = self->_selectableDirectionsRequests;
  if (!selectableDirectionsRequests)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion report](self, "report"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_context"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "directionsHistory"));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "recording"));

        if (v13)
        {
          transportType = self->_transportType;
          v15 = objc_msgSend(v12, "requestedTransportType");
          v16 = v15 > 5 ? 1 : qword_100E39C60[v15];
          if ((v16 & transportType) != 0)
            objc_msgSend(v6, "addObject:", v12);
          if ((unint64_t)objc_msgSend(v6, "count") > 0xE)
            break;
        }
        if (v9 == (id)++v11)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          if (v9)
            goto LABEL_4;
          break;
        }
      }
    }

    v17 = (NSArray *)objc_msgSend(v6, "copy");
    v18 = self->_selectableDirectionsRequests;
    self->_selectableDirectionsRequests = v17;

    selectableDirectionsRequests = self->_selectableDirectionsRequests;
  }
  return selectableDirectionsRequests;
}

- (void)setSelectedValue:(id)a3
{
  RAPUserDirectionRequest *v5;
  RAPDirectionsCategoryQuestion *followUpQuestion;
  GEOComposedRoute *route;
  RAPUserDirectionRequest *v8;

  v5 = (RAPUserDirectionRequest *)a3;
  if (self->_selectedValue != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_selectedValue, a3);
    followUpQuestion = self->_followUpQuestion;
    self->_followUpQuestion = 0;

    route = self->_route;
    self->_route = 0;

    -[RAPQuestion _didChange](self, "_didChange");
    v5 = v8;
  }

}

- (GEOComposedRoute)routeFromRecording
{
  if (self->_selectedValue)
    return self->_route;
  else
    return (GEOComposedRoute *)0;
}

- (BOOL)isComplete
{
  return self->_selectedValue != 0;
}

- (BOOL)_isRecursivelyComplete
{
  _BOOL4 v3;
  objc_super v5;

  v3 = -[RAPMenuQuestion _isRecursivelyComplete](self->_followUpQuestion, "_isRecursivelyComplete");
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)RAPDirectionsWhichOneQuestion;
    LOBYTE(v3) = -[RAPQuestion _isRecursivelyComplete](&v5, "_isRecursivelyComplete");
  }
  return v3;
}

- (RAPDirectionsCategoryQuestion)followUpQuestion
{
  RAPDirectionsCategoryQuestion *followUpQuestion;
  RAPDirectionsCategoryQuestion *v4;
  void *v5;
  RAPDirectionsCategoryQuestion *v6;
  RAPDirectionsCategoryQuestion *v7;

  followUpQuestion = self->_followUpQuestion;
  if (!followUpQuestion)
  {
    v4 = [RAPDirectionsCategoryQuestion alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion report](self, "report"));
    v6 = -[RAPDirectionsCategoryQuestion initWithReport:parentQuestion:directions:](v4, "initWithReport:parentQuestion:directions:", v5, self, self->_selectedValue);
    v7 = self->_followUpQuestion;
    self->_followUpQuestion = v6;

    followUpQuestion = self->_followUpQuestion;
  }
  return followUpQuestion;
}

- (id)_alternateAuxiliaryControlsRecording
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsWhichOneQuestion selectedValue](self, "selectedValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "recording"));

  return v3;
}

- (void)_fillSubmissionParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v30 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "commonContext"));
  if (!v4)
  {
    v4 = objc_alloc_init((Class)GEORPFeedbackCommonContext);
    objc_msgSend(v30, "setCommonContext:", v4);
  }
  if (self->_isInitialQuestion)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion _context](self, "_context"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "displayedDirectionsPlan"));

    if (v6)
      objc_msgSend(v4, "addUserPath:", 55);
  }
  objc_msgSend(v4, "addUserPath:", 14);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "details"));

  if (!v7)
  {
    v8 = objc_alloc_init((Class)GEORPFeedbackDetails);
    objc_msgSend(v30, "setDetails:", v8);

  }
  if (-[RAPDirectionsWhichOneQuestion _followupQuestionsAreDirectionsRelated](self, "_followupQuestionsAreDirectionsRelated"))
  {
    objc_msgSend(v30, "setType:", 8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion report](self, "report"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsWhichOneQuestion selectedValue](self, "selectedValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recording"));
    objc_msgSend(v30, "addDirectionsContextWithReport:recording:", v9, v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "details"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "directionsFeedback"));

    if (!v13)
    {
      v14 = objc_alloc_init((Class)GEORPDirectionsFeedback);
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "details"));
      objc_msgSend(v15, "setDirectionsFeedback:", v14);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "details"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "directionsFeedback"));
    objc_msgSend(v17, "setCorrectionType:", 3);

  }
  else
  {
    v18 = objc_alloc_init((Class)GEORPTransitPoiFeedback);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "details"));
    objc_msgSend(v19, "setTransitPoiFeedback:", v18);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsWhichOneQuestion selectedValue](self, "selectedValue"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "recording"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "directionsRequests"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "details"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "transitPoiFeedback"));
    objc_msgSend(v24, "setDirectionsRequests:", v22);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[RAPDirectionsWhichOneQuestion selectedValue](self, "selectedValue"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "recording"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "directionsResponses"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "details"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "transitPoiFeedback"));
    objc_msgSend(v29, "setDirectionsResponses:", v27);

    objc_msgSend(v30, "setType:", 3);
  }
  -[RAPMenuQuestion _fillSubmissionParameters:](self->_followUpQuestion, "_fillSubmissionParameters:", v30);

}

- (BOOL)_followupQuestionsAreDirectionsRelated
{
  void *v2;
  char *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMenuQuestion selectedMenuItem](self->_followUpQuestion, "selectedMenuItem"));
  v3 = (char *)objc_msgSend(v2, "questionCategory");

  return (unint64_t)(v3 - 1) < 7;
}

- (int)userAction
{
  return 10117;
}

- (RAPUserDirectionRequest)selectedValue
{
  return self->_selectedValue;
}

- (NSString)localizedServerControlledDescription
{
  return self->_localizedServerControlledDescription;
}

- (void)setLocalizedServerControlledDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedServerControlledDescription, 0);
  objc_storeStrong((id *)&self->_selectedValue, 0);
  objc_storeStrong((id *)&self->_selectableDirectionsRequests, 0);
  objc_storeStrong((id *)&self->_followUpQuestion, 0);
  objc_storeStrong((id *)&self->_route, 0);
}

@end
