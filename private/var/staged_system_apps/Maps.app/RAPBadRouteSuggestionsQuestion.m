@implementation RAPBadRouteSuggestionsQuestion

- (NSString)localizedTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Better Route Available [Report a Problem category]"), CFSTR("localized string not found"), 0));

  return (NSString *)v3;
}

- (int64_t)questionCategory
{
  return 2;
}

- (int)userAction
{
  return 10102;
}

- (RAPBadRouteSuggestionsQuestion)initWithReport:(id)a3 parentQuestion:(id)a4
{
  RAPBadRouteSuggestionsQuestion *v4;
  uint64_t v5;
  NSSet *selectedRouteSuggestions;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RAPBadRouteSuggestionsQuestion;
  v4 = -[RAPQuestion initWithReport:parentQuestion:](&v8, "initWithReport:parentQuestion:", a3, a4);
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    selectedRouteSuggestions = v4->_selectedRouteSuggestions;
    v4->_selectedRouteSuggestions = (NSSet *)v5;

  }
  return v4;
}

+ (BOOL)_canDisplayForContext:(id)a3 selection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  BOOL v11;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "displayedDirectionsPlan"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayedRouteSuggestions"));
  if (objc_msgSend(v8, "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "directionsHistory"));
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
    v11 = v10 == v6;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSArray)selectableRouteSuggestions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion report](self, "report"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_context"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "displayedDirectionsPlan"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayedRouteSuggestions"));

  return (NSArray *)v5;
}

- (BOOL)_areAllSuggestionsSelectableInSet:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPBadRouteSuggestionsQuestion selectableRouteSuggestions](self, "selectableRouteSuggestions", (_QWORD)v13));
        LODWORD(v9) = objc_msgSend(v10, "containsObject:", v9);

        if (!(_DWORD)v9)
        {
          v11 = 0;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 1;
LABEL_11:

  return v11;
}

- (void)setSelectedRouteSuggestions:(id)a3
{
  NSSet *v4;
  NSSet *selectedRouteSuggestions;

  if (self->_selectedRouteSuggestions != a3)
  {
    v4 = (NSSet *)objc_msgSend(a3, "copy");
    selectedRouteSuggestions = self->_selectedRouteSuggestions;
    self->_selectedRouteSuggestions = v4;

    -[RAPQuestion _didChange](self, "_didChange");
  }
}

- (BOOL)noGoodRoutesShown
{
  return self->_selectedRouteSuggestions == 0;
}

- (void)setNoGoodRoutesShown:(BOOL)a3
{
  NSSet *selectedRouteSuggestions;
  NSSet *v5;

  selectedRouteSuggestions = self->_selectedRouteSuggestions;
  if (a3)
  {
    v5 = 0;
  }
  else
  {
    if (selectedRouteSuggestions)
      return;
    v5 = (NSSet *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    selectedRouteSuggestions = self->_selectedRouteSuggestions;
  }
  self->_selectedRouteSuggestions = v5;

  -[RAPQuestion _didChange](self, "_didChange");
}

- (BOOL)_routeSuggestionsCanBeSubmitted
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPBadRouteSuggestionsQuestion selectedRouteSuggestions](self, "selectedRouteSuggestions"));
  if (objc_msgSend(v3, "count"))
    v4 = 1;
  else
    v4 = -[RAPBadRouteSuggestionsQuestion noGoodRoutesShown](self, "noGoodRoutesShown");

  return v4;
}

- (BOOL)_isRecursivelyComplete
{
  void *v3;
  BOOL v4;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPBadRouteSuggestionsQuestion commentQuestion](self, "commentQuestion"));
  if (objc_msgSend(v3, "_isRecursivelyComplete"))
  {
    v6.receiver = self;
    v6.super_class = (Class)RAPBadRouteSuggestionsQuestion;
    v4 = -[RAPQuestion _isRecursivelyComplete](&v6, "_isRecursivelyComplete");
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isComplete
{
  return -[RAPBadRouteSuggestionsQuestion _routeSuggestionsCanBeSubmitted](self, "_routeSuggestionsCanBeSubmitted");
}

- (BOOL)shouldShowCommentQuestion
{
  return -[RAPBadRouteSuggestionsQuestion _routeSuggestionsCanBeSubmitted](self, "_routeSuggestionsCanBeSubmitted");
}

- (RAPCommentQuestion)commentQuestion
{
  RAPCommentQuestion *commentQuestion;
  RAPCommentQuestion *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  RAPCommentQuestion *v11;
  RAPCommentQuestion *v12;

  commentQuestion = self->_commentQuestion;
  if (!commentQuestion)
  {
    v4 = [RAPCommentQuestion alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion report](self, "report"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[RAPCommentQuestion _localizedInformationTitle](RAPCommentQuestion, "_localizedInformationTitle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Tell us more about the better route"), CFSTR("localized string not found"), 0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Take a photo to help Apple verify the better route."), CFSTR("localized string not found"), 0));
    v11 = -[RAPCommentQuestion initWithReport:parentQuestion:title:placeholderText:emphasis:localizedPhotosPickerExplanation:](v4, "initWithReport:parentQuestion:title:placeholderText:emphasis:localizedPhotosPickerExplanation:", v5, self, v6, v8, 0, v10);
    v12 = self->_commentQuestion;
    self->_commentQuestion = v11;

    commentQuestion = self->_commentQuestion;
  }
  return commentQuestion;
}

- (void)_fillSubmissionParameters:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  RAPBadRouteSuggestionsQuestion *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id obj;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];

  v4 = a3;
  objc_msgSend(v4, "setType:", 8);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commonContext"));

  if (!v5)
  {
    v6 = objc_alloc_init((Class)GEORPFeedbackCommonContext);
    objc_msgSend(v4, "setCommonContext:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commonContext"));
  objc_msgSend(v7, "addUserPath:", 44);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion report](self, "report"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion report](self, "report"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_context"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "displayedDirectionsPlan"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "recording"));
  objc_msgSend(v4, "addDirectionsContextWithReport:recording:", v8, v12);

  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));
  if (!v13)
  {
    v13 = objc_alloc_init((Class)GEORPFeedbackDetails);
    objc_msgSend(v4, "setDetails:", v13);
  }
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "directionsFeedback"));
  if (!v14)
  {
    v14 = objc_alloc_init((Class)GEORPDirectionsFeedback);
    objc_msgSend(v13, "setDirectionsFeedback:", v14);
  }
  v35 = v13;
  v36 = v4;
  objc_msgSend(v14, "setCorrectionType:", 4);
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "directionsContext"));
  if (!v15)
  {
    v15 = objc_alloc_init((Class)GEORPDirectionsFeedbackContext);
    objc_msgSend(v14, "setDirectionsContext:", v15);
  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[RAPBadRouteSuggestionsQuestion selectedRouteSuggestions](self, "selectedRouteSuggestions", v15));
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(_QWORD *)v41 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
        v38 = 0;
        v39 = 0;
        v21 = self;
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion report](self, "report"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "_context"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "displayedDirectionsPlan"));
        v25 = objc_msgSend(v24, "getRoutesIndex:directionsResponseIndex:forRouteSuggestion:", &v38, &v39, v20);

        if (v25)
        {
          v26 = objc_alloc_init((Class)GEORPSuggestedRouteIndex);
          objc_msgSend(v26, "setDirectionsResponseIndex:", v39);
          objc_msgSend(v26, "setDirectionsResponseSuggestedRoutesIndex:", v38);
          v27 = objc_opt_class(GEOComposedRoute);
          if ((objc_opt_isKindOfClass(v20, v27) & 1) != 0)
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "rideSelections"));
            objc_msgSend(v26, "setRideSelections:", v28);

          }
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "directionsCorrections"));

          if (!v29)
          {
            v30 = objc_alloc_init((Class)GEORPDirectionsCorrections);
            objc_msgSend(v14, "setDirectionsCorrections:", v30);

          }
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "directionsCorrections"));
          objc_msgSend(v31, "addProblematicRouteIndex:", v26);

        }
        self = v21;
      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v17);
  }

  if (-[RAPBadRouteSuggestionsQuestion noGoodRoutesShown](self, "noGoodRoutesShown"))
  {
    v32 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "directionsCorrections"));
    if (!v32)
    {
      v32 = objc_alloc_init((Class)GEORPDirectionsCorrections);
      objc_msgSend(v14, "setDirectionsCorrections:", v32);
    }
    objc_msgSend(v32, "setNoGoodRoutesShown:", 1);

  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[RAPBadRouteSuggestionsQuestion commentQuestion](self, "commentQuestion"));
  objc_msgSend(v33, "_fillSubmissionParameters:", v36);

}

- (NSString)localizedSelectableRoutesPrompt
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Route [Report a Problem]"), CFSTR("localized string not found"), 0));

  return (NSString *)v3;
}

- (NSSet)selectedRouteSuggestions
{
  return self->_selectedRouteSuggestions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commentQuestion, 0);
  objc_storeStrong((id *)&self->_selectedRouteSuggestions, 0);
}

@end
