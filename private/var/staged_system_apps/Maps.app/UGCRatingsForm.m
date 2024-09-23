@implementation UGCRatingsForm

+ (id)addRatingFormWithPlaceQuestionnaire:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  UGCRatingsForm *v7;
  void *v8;
  UGCRatingsForm *v9;

  v3 = a3;
  if (objc_msgSend(v3, "canCollectRatings"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UGCRatingCategory overallRatingCategoryWithInitialState:](UGCRatingCategory, "overallRatingCategoryWithInitialState:", 0));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ratingCategories"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UGCRatingCategory ratingCategoryListForQuestionnaireCategories:](UGCRatingCategory, "ratingCategoryListForQuestionnaireCategories:", v5));

    v7 = [UGCRatingsForm alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "version"));
    v9 = -[UGCRatingsForm initWithActionType:overallCategory:categoryList:versionNumber:](v7, "initWithActionType:overallCategory:categoryList:versionNumber:", 0, v4, v6, v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)editRatingFormWithPlaceQuestionnaire:(id)a3 existingScorecard:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  UGCRatingsForm *v9;
  void *v10;
  UGCRatingsForm *v11;

  v6 = a4;
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UGCRatingCategory overallRatingCategoryFromScorecard:](UGCRatingCategory, "overallRatingCategoryFromScorecard:", v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UGCRatingCategory ratingCategoryListForScorecard:](UGCRatingCategory, "ratingCategoryListForScorecard:", v6));
    v9 = [UGCRatingsForm alloc];
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "version"));
    v11 = -[UGCRatingsForm initWithActionType:overallCategory:categoryList:versionNumber:](v9, "initWithActionType:overallCategory:categoryList:versionNumber:", 1, v7, v8, v10);

  }
  else
  {
    v11 = (UGCRatingsForm *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "addRatingFormWithPlaceQuestionnaire:", a3));
  }

  return v11;
}

+ (id)emptyRatingForm
{
  void *v2;
  UGCRatingsForm *v3;
  void *v4;
  UGCRatingsForm *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UGCRatingCategory overallRatingCategoryWithInitialState:](UGCRatingCategory, "overallRatingCategoryWithInitialState:", 0));
  v3 = [UGCRatingsForm alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  v5 = -[UGCRatingsForm initWithActionType:overallCategory:categoryList:versionNumber:](v3, "initWithActionType:overallCategory:categoryList:versionNumber:", 0, v2, v4, &stru_1011EB268);

  return v5;
}

- (UGCRatingsForm)initWithActionType:(int64_t)a3 overallCategory:(id)a4 categoryList:(id)a5 versionNumber:(id)a6
{
  id v11;
  id v12;
  id v13;
  UGCRatingsForm *v14;
  UGCRatingsForm *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)UGCRatingsForm;
  v14 = -[UGCForm init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    v14->_actionType = a3;
    objc_storeStrong((id *)&v14->_overallCategory, a4);
    objc_storeStrong((id *)&v15->_categoryList, a5);
    objc_storeStrong((id *)&v15->_questionnaireVersion, a6);
    -[UGCRatingsForm _startObservingRatingCategories](v15, "_startObservingRatingCategories");
  }

  return v15;
}

- (void)_startObservingRatingCategories
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UGCRatingsForm allRatingCategories](self, "allRatingCategories", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "addObserver:", self);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (NSArray)allRatingCategories
{
  id v3;
  id v4;

  v3 = objc_alloc_init((Class)NSMutableArray);
  objc_msgSend(v3, "addObject:", self->_overallCategory);
  objc_msgSend(v3, "addObjectsFromArray:", self->_categoryList);
  v4 = objc_msgSend(v3, "copy");

  return (NSArray *)v4;
}

- (id)categoryForKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCRatingsForm allRatingCategories](self, "allRatingCategories", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "key"));
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)isComplete
{
  int64_t v3;

  if (!-[UGCRatingsForm passesMinimumRequirementsToBeSubmittable](self, "passesMinimumRequirementsToBeSubmittable"))
    return 0;
  v3 = -[UGCRatingsForm actionType](self, "actionType");
  if (v3 == 2)
    return -[UGCRatingsForm _isCompleteForDelete](self, "_isCompleteForDelete");
  if (v3 != 1)
  {
    if (!v3)
      return -[UGCRatingsForm _isCompleteForAdd](self, "_isCompleteForAdd");
    return 0;
  }
  return -[UGCRatingsForm _isCompleteForEdit](self, "_isCompleteForEdit");
}

- (BOOL)_isCompleteForDelete
{
  _BOOL4 v3;

  v3 = -[UGCRatingsForm isEdited](self, "isEdited");
  if (v3)
    LOBYTE(v3) = -[UGCRatingsForm isEmpty](self, "isEmpty");
  return v3;
}

- (BOOL)_isCompleteForAdd
{
  return !-[UGCRatingsForm isEmpty](self, "isEmpty");
}

- (BOOL)_isCompleteForEdit
{
  _BOOL4 v3;

  v3 = -[UGCRatingsForm isEdited](self, "isEdited");
  if (v3)
    LOBYTE(v3) = -[UGCRatingsForm _isCompleteForAdd](self, "_isCompleteForAdd");
  return v3;
}

- (BOOL)passesMinimumRequirementsToBeSubmittable
{
  if (-[UGCRatingsForm isEmpty](self, "isEmpty"))
    return 1;
  else
    return -[UGCRatingsForm _isCompleteForAdd](self, "_isCompleteForAdd");
}

- (void)fillSubmissionFields:(id)a3
{
  id v4;
  int64_t v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "poiEnrichment"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "scorecardUpdate"));
  if (!v4)
  {
    v4 = objc_alloc_init((Class)GEORPScorecardUpdate);
    objc_msgSend(v6, "setScorecardUpdate:", v4);
  }
  v5 = -[UGCRatingsForm actionType](self, "actionType");
  switch(v5)
  {
    case 2:
      -[UGCRatingsForm _fillScorecardUpdateWithDeleteType:](self, "_fillScorecardUpdateWithDeleteType:", v4);
      break;
    case 1:
      -[UGCRatingsForm _fillScorecardUpdateWithEditType:](self, "_fillScorecardUpdateWithEditType:", v4);
      break;
    case 0:
      -[UGCRatingsForm _fillScorecardUpdateWithAddType:](self, "_fillScorecardUpdateWithAddType:", v4);
      break;
  }

}

- (void)_fillInScorecard:(id)a3 hasBeenEdited:(BOOL *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  int v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v6 = a3;
  objc_msgSend(v6, "setVersion:", self->_questionnaireVersion);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UGCRatingsForm allRatingCategories](self, "allRatingCategories", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v13, "ratingType") == (id)1)
        {
          if (objc_msgSend(v13, "currentState"))
            objc_msgSend(v6, "setRecommended:", objc_msgSend(v13, "currentState") == (id)2);
        }
        else
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "geoCategoryRating"));
          objc_msgSend(v6, "addCategoryRatings:", v14);

        }
        v10 |= objc_msgSend(v13, "isEdited");
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  *a4 = v10 & 1;
}

- (void)_fillScorecardUpdateWithDeleteType:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setAction:", 2);
  objc_msgSend(v3, "setScorecard:", 0);

}

- (void)_fillScorecardUpdateWithEditType:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  char v8;

  v4 = a3;
  v5 = objc_alloc_init((Class)GEORPScorecard);
  objc_msgSend(v4, "setScorecard:", v5);

  v8 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scorecard"));
  -[UGCRatingsForm _fillInScorecard:hasBeenEdited:](self, "_fillInScorecard:hasBeenEdited:", v6, &v8);

  if (v8)
    v7 = 1;
  else
    v7 = 3;
  objc_msgSend(v4, "setAction:", v7);

}

- (void)_fillScorecardUpdateWithAddType:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char v7;

  v4 = a3;
  v5 = objc_alloc_init((Class)GEORPScorecard);
  objc_msgSend(v4, "setScorecard:", v5);

  v7 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scorecard"));
  -[UGCRatingsForm _fillInScorecard:hasBeenEdited:](self, "_fillInScorecard:hasBeenEdited:", v6, &v7);

  if (!v7)
    objc_msgSend(v4, "setScorecard:", 0);
  objc_msgSend(v4, "setAction:", 1);

}

- (BOOL)isEmpty
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UGCRatingsForm allRatingCategories](self, "allRatingCategories", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "currentState"))
        {
          v7 = 0;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_11:

  return v7;
}

- (BOOL)isEdited
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UGCRatingsForm allRatingCategories](self, "allRatingCategories", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)i), "isEdited") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (int64_t)actionType
{
  if (-[UGCRatingsForm isEmpty](self, "isEmpty"))
    return 2;
  else
    return self->_actionType;
}

- (id)parentSubmissionIdentifier
{
  return self->_parentSubmissionIdentifier;
}

- (void)setParentSubmissionIdentifier:(id)a3
{
  self->_parentSubmissionIdentifier = (NSString *)a3;
}

- (UGCRatingCategory)overallCategory
{
  return self->_overallCategory;
}

- (NSArray)categoryList
{
  return self->_categoryList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryList, 0);
  objc_storeStrong((id *)&self->_overallCategory, 0);
  objc_storeStrong((id *)&self->_questionnaireVersion, 0);
}

@end
