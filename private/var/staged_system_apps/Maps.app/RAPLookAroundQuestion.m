@implementation RAPLookAroundQuestion

- (RAPLookAroundQuestion)initWithReport:(id)a3 parentQuestion:(id)a4
{
  RAPLookAroundQuestion *v4;
  RAPLookAroundQuestion *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  UIImage *thumbnailImage;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)RAPLookAroundQuestion;
  v4 = -[RAPQuestion initWithReport:parentQuestion:](&v12, "initWithReport:parentQuestion:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion _context](v4, "_context"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "reportedLookAroundContext"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lookAroundSnapshotImageData"));
    v9 = objc_claimAutoreleasedReturnValue(+[UIImage imageWithData:](UIImage, "imageWithData:", v8));
    thumbnailImage = v5->_thumbnailImage;
    v5->_thumbnailImage = (UIImage *)v9;

    v5->_labelsEnabled = objc_msgSend(v7, "lookAroundLabelsEnabled");
    -[RAPLookAroundQuestion _initCorrectableFields](v5, "_initCorrectableFields");

  }
  return v5;
}

- (void)_initCorrectableFields
{
  id v3;
  RAPPlaceCorrectableString *v4;
  RAPPlaceCorrectableString *v5;
  RAPPlaceCorrectableString *emailAddressCorrectableString;
  uint64_t v7;
  RAPCommentQuestion *v8;
  void *v9;
  RAPCommentQuestion *v10;
  RAPCommentQuestion *commentQuestion;
  RAPPlaceCorrectableAddress *v12;
  RAPPlaceCorrectableAddress *addressCorrectableString;
  id v14;

  v3 = sub_1003DDA94();
  v14 = (id)objc_claimAutoreleasedReturnValue(v3);
  v4 = [RAPPlaceCorrectableString alloc];
  v5 = -[RAPPlaceCorrectableString initWithKind:originalValue:](v4, "initWithKind:originalValue:", qword_1014A5BC8, &stru_1011EB268);
  emailAddressCorrectableString = self->_emailAddressCorrectableString;
  self->_emailAddressCorrectableString = v5;

  -[RAPPlaceCorrectableString setValue:](self->_emailAddressCorrectableString, "setValue:", v14);
  -[RAPPlaceCorrectableString addObserver:changeHandler:](self->_emailAddressCorrectableString, "addObserver:changeHandler:", self, &stru_1011B1508);
  if (self->_selectedQuestionType == 4)
    v7 = 5;
  else
    v7 = 2;
  v8 = [RAPCommentQuestion alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion report](self, "report"));
  v10 = -[RAPCommentQuestion initWithReport:parentQuestion:title:placeholderText:emphasis:](v8, "initWithReport:parentQuestion:title:placeholderText:emphasis:", v9, self, &stru_1011EB268, &stru_1011EB268, v7);
  commentQuestion = self->_commentQuestion;
  self->_commentQuestion = v10;

  -[RAPCommentQuestion setPhotoType:](self->_commentQuestion, "setPhotoType:", 5);
  -[RAPQuestion addObserver:changeHandler:](self->_commentQuestion, "addObserver:changeHandler:", self, &stru_1011B1548);
  v12 = (RAPPlaceCorrectableAddress *)objc_claimAutoreleasedReturnValue(+[RAPPlaceCorrectableAddress emptyCorrectableAddress](RAPPlaceCorrectableAddress, "emptyCorrectableAddress"));
  addressCorrectableString = self->_addressCorrectableString;
  self->_addressCorrectableString = v12;

  -[RAPPlaceCorrectableAddress addObserver:changeHandler:](self->_addressCorrectableString, "addObserver:changeHandler:", self, &stru_1011B1588);
}

- (id)localizedTitle
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = v4;
  if (v3 == (id)5)
    v6 = CFSTR("Report an Issue with Look Around [LookAround RAP]");
  else
    v6 = CFSTR("Report an Issue");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, CFSTR("localized string not found"), 0));

  return v7;
}

- (id)localizedDescription
{
  __CFString *v2;
  void *v3;
  void *v4;
  const __CFString *v5;

  v2 = &stru_1011EB268;
  switch(self->_selectedQuestionType)
  {
    case 0uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Image Quality Description [LookAround RAP]");
      goto LABEL_7;
    case 1uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Street Labels Description [LookAround RAP]");
      goto LABEL_7;
    case 2uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Store Labels Description [LookAround RAP]");
      goto LABEL_7;
    case 4uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Remove Imagery Description [LookAround RAP]");
      goto LABEL_7;
    case 6uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Something Else Description [LookAround RAP]");
LABEL_7:
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, CFSTR("localized string not found"), 0));

      break;
    default:
      return v2;
  }
  return v2;
}

- (NSString)localizedDetailsNavigationTitle
{
  void *v3;
  id v4;
  unint64_t selectedQuestionType;
  __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  selectedQuestionType = self->_selectedQuestionType;
  v6 = &stru_1011EB268;
  if (v4 == (id)5)
  {
    switch(selectedQuestionType)
    {
      case 0uLL:
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v8 = v7;
        v9 = CFSTR("Image Quality Should Be Better [LookAround RAP]");
        goto LABEL_15;
      case 1uLL:
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v8 = v7;
        v9 = CFSTR("Incorrect Street Labels [LookAround RAP]");
        goto LABEL_15;
      case 2uLL:
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v8 = v7;
        v9 = CFSTR("Incorrect Store Labels [LookAround RAP]");
        goto LABEL_15;
      case 4uLL:
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v8 = v7;
        v9 = CFSTR("Blur Personal Information [LookAround RAP]");
        goto LABEL_15;
      case 5uLL:
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v8 = v7;
        v9 = CFSTR("Remove Imagery of My Home [LookAround RAP]");
        goto LABEL_15;
      case 6uLL:
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v8 = v7;
        v9 = CFSTR("Something Else Needs Fixing [LookAround RAP]");
        goto LABEL_15;
      default:
        return (NSString *)v6;
    }
  }
  else
  {
    switch(selectedQuestionType)
    {
      case 0uLL:
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v8 = v7;
        v9 = CFSTR("Image Quality [LookAround RAP]");
        goto LABEL_15;
      case 1uLL:
      case 2uLL:
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v8 = v7;
        v9 = CFSTR("Incorrect Labels [LookAround RAP]");
        goto LABEL_15;
      case 4uLL:
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v8 = v7;
        v9 = CFSTR("Blur Information [LookAround RAP]");
        goto LABEL_15;
      case 5uLL:
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v8 = v7;
        v9 = CFSTR("Remove Imagery [LookAround RAP]");
        goto LABEL_15;
      case 6uLL:
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v8 = v7;
        v9 = CFSTR("Something Else [LookAround RAP]");
LABEL_15:
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v9, CFSTR("localized string not found"), 0));

        break;
      default:
        return (NSString *)v6;
    }
  }
  return (NSString *)v6;
}

- (NSString)localizedPrivacyNavigationTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("[RAP LookAround] Privacy Concerns"), CFSTR("localized string not found"), 0));

  return (NSString *)v3;
}

- (void)setSelectedQuestionType:(unint64_t)a3
{
  if (self->_selectedQuestionType != a3)
    self->_selectedQuestionType = a3;
  -[RAPLookAroundQuestion _clearFields](self, "_clearFields");
  -[RAPLookAroundQuestion _resolveCompleteness](self, "_resolveCompleteness");
}

- (BOOL)isAnonymous
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RAPLookAroundQuestion;
  v3 = -[RAPQuestion isAnonymous](&v5, "isAnonymous");
  if (v3)
    LOBYTE(v3) = self->_selectedQuestionType != 5;
  return v3;
}

- (void)_clearFields
{
  id v3;

  -[RAPPlaceCorrectableAddress removeObserver:](self->_addressCorrectableString, "removeObserver:", self);
  -[RAPPlaceCorrectableString removeObserver:](self->_emailAddressCorrectableString, "removeObserver:", self);
  -[RAPQuestion removeObserver:](self->_commentQuestion, "removeObserver:", self);
  -[RAPLookAroundQuestion _initCorrectableFields](self, "_initCorrectableFields");
  -[RAPQuestion _setComplete:](self, "_setComplete:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue(-[RAPQuestion report](self, "report"));
  objc_msgSend(v3, "_questionDidChange:", self);

}

- (NSArray)initialItems
{
  RAPLookAroundCategoryItem *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  RAPLookAroundCategoryItem *v7;
  void *v8;
  RAPLookAroundCategoryItem *v9;
  void *v10;
  RAPLookAroundCategoryItem *v12;

  v3 = -[RAPLookAroundCategoryItem initWithType:]([RAPLookAroundCategoryItem alloc], "initWithType:", 0);
  v12 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));

  if (self->_labelsEnabled)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundQuestion _labelItems](self, "_labelItems"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5));

    v4 = (void *)v6;
  }
  v7 = -[RAPLookAroundCategoryItem initWithType:]([RAPLookAroundCategoryItem alloc], "initWithType:", 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "arrayByAddingObject:", v7));

  v9 = -[RAPLookAroundCategoryItem initWithType:]([RAPLookAroundCategoryItem alloc], "initWithType:", 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "arrayByAddingObject:", v9));

  return (NSArray *)v10;
}

- (NSArray)initialItemsMinusPrivacy
{
  RAPLookAroundCategoryItem *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  RAPLookAroundCategoryItem *v7;
  void *v8;
  RAPLookAroundCategoryItem *v10;

  v3 = -[RAPLookAroundCategoryItem initWithType:]([RAPLookAroundCategoryItem alloc], "initWithType:", 0);
  v10 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));

  if (self->_labelsEnabled)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundQuestion _labelItems](self, "_labelItems"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5));

    v4 = (void *)v6;
  }
  v7 = -[RAPLookAroundCategoryItem initWithType:]([RAPLookAroundCategoryItem alloc], "initWithType:", 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "arrayByAddingObject:", v7));

  return (NSArray *)v8;
}

- (id)_labelItems
{
  RAPLookAroundCategoryItem *v2;
  RAPLookAroundCategoryItem *v3;
  id v4;
  id v5;

  v2 = -[RAPLookAroundCategoryItem initWithType:]([RAPLookAroundCategoryItem alloc], "initWithType:", 1);
  v3 = -[RAPLookAroundCategoryItem initWithType:]([RAPLookAroundCategoryItem alloc], "initWithType:", 2);
  v4 = objc_alloc_init((Class)NSMutableArray);
  if ((GEOConfigGetBOOL(MapsConfig_MuninRAPHideStoreLabels, off_1014B3458) & 1) == 0)
    objc_msgSend(v4, "addObject:", v3);
  if ((GEOConfigGetBOOL(MapsConfig_MuninRAPHideStreetLabels, off_1014B3448) & 1) == 0)
    objc_msgSend(v4, "addObject:", v2);
  v5 = objc_msgSend(v4, "copy");

  return v5;
}

- (NSArray)privacyItems
{
  void *v2;
  void *v3;
  unsigned int v4;
  RAPLookAroundCategoryItem *v5;
  RAPLookAroundCategoryItem *v6;
  void *v7;
  RAPLookAroundCategoryItem *v8;
  _QWORD v10[2];
  RAPLookAroundCategoryItem *v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "countryCode"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("KR"));

  v5 = -[RAPLookAroundCategoryItem initWithType:]([RAPLookAroundCategoryItem alloc], "initWithType:", 4);
  v6 = v5;
  if (v4)
  {
    v11 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  }
  else
  {
    v8 = -[RAPLookAroundCategoryItem initWithType:]([RAPLookAroundCategoryItem alloc], "initWithType:", 5, v5);
    v10[1] = v8;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2));

  }
  return (NSArray *)v7;
}

- (void)_resolveCompleteness
{
  _BOOL8 v3;
  unint64_t selectedQuestionType;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  _BOOL4 v9;

  v3 = 0;
  selectedQuestionType = self->_selectedQuestionType;
  if (selectedQuestionType <= 6)
  {
    if (((1 << selectedQuestionType) & 0x57) != 0)
    {
      v3 = -[RAPQuestion isComplete](self->_commentQuestion, "isComplete", 0);
    }
    else if (selectedQuestionType == 5)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlaceCorrectableString value](self->_emailAddressCorrectableString, "value", 0));
      v6 = sub_10030FEE8(v5);

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlaceCorrectableAddress freeformAddress](self->_addressCorrectableString, "freeformAddress"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "value"));
      v9 = sub_10030FEE8(v8);

      v3 = v6 & v9;
    }
  }
  -[RAPQuestion _setComplete:](self, "_setComplete:", v3);
}

- (void)_fillSubmissionParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *j;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *k;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  unint64_t selectedQuestionType;
  id v44;
  void *v45;
  void *v46;
  _BOOL4 v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _BOOL4 v52;
  void *v53;
  void *v54;
  void *v55;
  RAPPhoto *v56;
  void *v57;
  void *v58;
  void *v59;
  RAPPhoto *v60;
  RAPPhotoWithMetadata *v61;
  void *v62;
  RAPLookAroundQuestion *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));

  if (!v5)
  {
    v6 = (void *)objc_opt_new(GEORPFeedbackDetails);
    objc_msgSend(v4, "setDetails:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "groundViewFeedback"));

  if (!v8)
  {
    v9 = (void *)objc_opt_new(GEORPGroundViewFeedback);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));
    objc_msgSend(v10, "setGroundViewFeedback:", v9);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "groundViewFeedback"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "groundViewContext"));

  if (!v13)
  {
    v13 = (void *)objc_opt_new(GEORPGroundViewFeedbackContext);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "groundViewFeedback"));
    objc_msgSend(v15, "setGroundViewContext:", v13);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion _context](self, "_context"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "reportedLookAroundContext"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "reportedMuninViewState"));
  objc_msgSend(v13, "setViewState:", v18);

  objc_msgSend(v13, "setMetadataTileBuildId:", objc_msgSend(v17, "muninMetadataTileBuildId"));
  objc_msgSend(v13, "setImdataId:", objc_msgSend(v17, "muninImageDataId"));
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "reportedVisibleMUIDs"));
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v73;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(_QWORD *)v73 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(v13, "addVisiblePlaceMuid:", objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)i), "unsignedLongLongValue"));
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
    }
    while (v21);
  }

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "reportedMuninImageResources"));
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v69;
    do
    {
      for (j = 0; j != v26; j = (char *)j + 1)
      {
        if (*(_QWORD *)v69 != v27)
          objc_enumerationMutation(v24);
        objc_msgSend(v13, "addOnscreenImageResource:", *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)j));
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
    }
    while (v26);
  }
  v63 = self;

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "reportedMuninRoadLabels"));
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v65;
    do
    {
      for (k = 0; k != v31; k = (char *)k + 1)
      {
        if (*(_QWORD *)v65 != v32)
          objc_enumerationMutation(v29);
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)k), "featureHandles"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "firstObject"));
        v36 = sub_10043CD54(v35);
        v37 = (void *)objc_claimAutoreleasedReturnValue(v36);

        if (v37)
          objc_msgSend(v13, "addVisibleFeatureHandle:", v37);

      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
    }
    while (v31);
  }

  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "groundViewFeedback"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "groundViewCorrections"));

  if (!v40)
  {
    v40 = (void *)objc_opt_new(GEORPGroundViewCorrections);
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "groundViewFeedback"));
    objc_msgSend(v42, "setGroundViewCorrections:", v40);

  }
  selectedQuestionType = v63->_selectedQuestionType;
  if (selectedQuestionType <= 6 && ((0x77u >> selectedQuestionType) & 1) != 0)
  {
    objc_msgSend(v40, "setCorrectionType:", dword_100E350CC[selectedQuestionType]);
    selectedQuestionType = v63->_selectedQuestionType;
  }
  if (selectedQuestionType != 5)
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundQuestion commentQuestion](v63, "commentQuestion"));
    objc_msgSend(v53, "_fillSubmissionParameters:", v4);
    goto LABEL_41;
  }
  v44 = objc_alloc_init((Class)GEORPFeedbackAddressFields);
  objc_msgSend(v40, "setAddressToCensor:", v44);

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlaceCorrectableAddress freeformAddress](v63->_addressCorrectableString, "freeformAddress"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "value"));
  v47 = sub_10030FEE8(v46);

  if (v47)
  {
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlaceCorrectableAddress freeformAddress](v63->_addressCorrectableString, "freeformAddress"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "value"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "addressToCensor"));
    objc_msgSend(v50, "setAddressBasic:", v49);

  }
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlaceCorrectableString value](v63->_emailAddressCorrectableString, "value"));
  v52 = sub_10030FEE8(v51);

  if (v52)
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlaceCorrectableString value](v63->_emailAddressCorrectableString, "value"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion report](v63, "report"));
    objc_msgSend(v54, "setPreferredEmailAddress:", v53);

LABEL_41:
  }
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lookAroundSnapshotImageData"));

  if (v55)
  {
    v56 = [RAPPhoto alloc];
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lookAroundSnapshotImageData"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithData:](UIImage, "imageWithData:", v57));
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v60 = -[RAPPhoto initWithPhoto:date:location:](v56, "initWithPhoto:date:location:", v58, v59, 0);

    v61 = -[RAPPhotoWithMetadata initWithRAPPhoto:photoType:]([RAPPhotoWithMetadata alloc], "initWithRAPPhoto:photoType:", v60, 5);
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion report](v63, "report"));
    objc_msgSend(v62, "addPhotoWithMetadata:", v61);

  }
}

- (int)analyticTarget
{
  unint64_t selectedQuestionType;

  selectedQuestionType = self->_selectedQuestionType;
  if (selectedQuestionType > 6)
    return 0;
  else
    return dword_100E350E8[selectedQuestionType];
}

- (RAPPlaceCorrectableString)emailAddressCorrectableString
{
  return self->_emailAddressCorrectableString;
}

- (RAPPlaceCorrectableAddress)addressCorrectableString
{
  return self->_addressCorrectableString;
}

- (RAPCommentQuestion)commentQuestion
{
  return self->_commentQuestion;
}

- (unint64_t)selectedQuestionType
{
  return self->_selectedQuestionType;
}

- (UIImage)thumbnailImage
{
  return self->_thumbnailImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailImage, 0);
  objc_storeStrong((id *)&self->_commentQuestion, 0);
  objc_storeStrong((id *)&self->_addressCorrectableString, 0);
  objc_storeStrong((id *)&self->_emailAddressCorrectableString, 0);
}

@end
