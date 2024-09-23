@implementation RAPCommentQuestion

+ (id)_localizedInformationTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Information"), CFSTR("localized string not found"), 0));

  return v3;
}

+ (id)_localizedMoreInformationTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("More Information"), CFSTR("localized string not found"), 0));

  return v3;
}

+ (id)_localizedOptionalInformationTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Optional Information"), CFSTR("localized string not found"), 0));

  return v3;
}

- (NSString)localizedPhotosPickerLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Details [Report a Problem photos]"), CFSTR("localized string not found"), 0));

  return (NSString *)v3;
}

- (NSString)localizedPhotosPickerExplanation
{
  NSString *localizedPhotosPickerExplanation;
  void *v4;
  NSString *v5;
  NSString *v6;

  localizedPhotosPickerExplanation = self->_localizedPhotosPickerExplanation;
  if (!localizedPhotosPickerExplanation)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Submit a Photo [Report an Issue photos]"), CFSTR("localized string not found"), 0));
    v6 = self->_localizedPhotosPickerExplanation;
    self->_localizedPhotosPickerExplanation = v5;

    localizedPhotosPickerExplanation = self->_localizedPhotosPickerExplanation;
  }
  return localizedPhotosPickerExplanation;
}

- (RAPCommentQuestion)initWithReport:(id)a3 parentQuestion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  RAPCommentQuestion *v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Comments"), CFSTR("localized string not found"), 0));
  v10 = -[RAPCommentQuestion initWithReport:parentQuestion:title:placeholderText:emphasis:](self, "initWithReport:parentQuestion:title:placeholderText:emphasis:", v7, v6, v9, 0, 0);

  return v10;
}

- (RAPCommentQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 title:(id)a5 placeholderText:(id)a6 emphasis:(int64_t)a7 localizedPhotosPickerExplanation:(id)a8
{
  id v14;
  RAPCommentQuestion *v15;
  NSString *v16;
  NSString *localizedPhotosPickerExplanation;

  v14 = a8;
  v15 = -[RAPCommentQuestion initWithReport:parentQuestion:title:placeholderText:emphasis:](self, "initWithReport:parentQuestion:title:placeholderText:emphasis:", a3, a4, a5, a6, a7);
  if (v15)
  {
    v16 = (NSString *)objc_msgSend(v14, "copy");
    localizedPhotosPickerExplanation = v15->_localizedPhotosPickerExplanation;
    v15->_localizedPhotosPickerExplanation = v16;

  }
  return v15;
}

- (RAPCommentQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 title:(id)a5 placeholderText:(id)a6 emphasis:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  RAPCommentQuestion *v16;
  NSString *v17;
  NSString *commentsTitle;
  NSString *v19;
  NSString *commentsPlaceholderText;
  RAPPlaceCorrectableString *v21;
  RAPPlaceCorrectableString *v22;
  RAPPlaceCorrectableString *correctableEmail;
  id v24;
  void *v25;
  RAPPlaceCorrectableString *v26;
  void **v28;
  uint64_t v29;
  void (*v30)(uint64_t);
  void *v31;
  id v32;
  id location;
  objc_super v34;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v34.receiver = self;
  v34.super_class = (Class)RAPCommentQuestion;
  v16 = -[RAPQuestion initWithReport:parentQuestion:](&v34, "initWithReport:parentQuestion:", v12, v13);
  if (v16)
  {
    v17 = (NSString *)objc_msgSend(v14, "copy");
    commentsTitle = v16->_commentsTitle;
    v16->_commentsTitle = v17;

    v19 = (NSString *)objc_msgSend(v15, "copy");
    commentsPlaceholderText = v16->_commentsPlaceholderText;
    v16->_commentsPlaceholderText = v19;

    v16->_emphasis = a7;
    v16->_photoType = 1;
    v16->_shouldShowEmail = 0;
    v21 = [RAPPlaceCorrectableString alloc];
    v22 = -[RAPPlaceCorrectableString initWithKind:originalValue:](v21, "initWithKind:originalValue:", qword_1014A5BC8, &stru_1011EB268);
    correctableEmail = v16->_correctableEmail;
    v16->_correctableEmail = v22;

    v24 = sub_1003DDA94();
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    -[RAPPlaceCorrectableString setValue:](v16->_correctableEmail, "setValue:", v25);

    objc_initWeak(&location, v16);
    v26 = v16->_correctableEmail;
    v28 = _NSConcreteStackBlock;
    v29 = 3221225472;
    v30 = sub_10060F714;
    v31 = &unk_1011BE178;
    objc_copyWeak(&v32, &location);
    -[RAPPlaceCorrectableString addObserver:changeHandler:](v26, "addObserver:changeHandler:", v16, &v28);
    if (v16->_emphasis == 5)
      -[RAPQuestion _setComplete:allowInvokingDidChange:](v16, "_setComplete:allowInvokingDidChange:", 1, 0, v28, v29, v30, v31);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }

  return v16;
}

- (void)_setCommentsTitle:(id)a3 placeholderText:(id)a4
{
  NSString *v6;
  NSString *commentsTitle;
  id v8;

  v8 = a4;
  v6 = (NSString *)objc_msgSend(a3, "copy");
  commentsTitle = self->_commentsTitle;
  self->_commentsTitle = v6;

  -[RAPCommentQuestion _setPlaceholderText:](self, "_setPlaceholderText:", v8);
}

- (void)_setPlaceholderText:(id)a3
{
  NSString *v4;
  NSString *commentsPlaceholderText;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  commentsPlaceholderText = self->_commentsPlaceholderText;
  self->_commentsPlaceholderText = v4;

  -[RAPQuestion _didChange](self, "_didChange");
}

- (void)_setLocalizedPhotosPickerExplanation:(id)a3
{
  NSString *v4;
  NSString *localizedPhotosPickerExplanation;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  localizedPhotosPickerExplanation = self->_localizedPhotosPickerExplanation;
  self->_localizedPhotosPickerExplanation = v4;

  -[RAPQuestion _didChange](self, "_didChange");
}

+ (unint64_t)maximumCommentLength
{
  return 1000;
}

- (unint64_t)maximumNumberOfPhotos
{
  return 3;
}

- (unint64_t)remainingCharacters
{
  unint64_t v3;

  v3 = +[RAPCommentQuestion maximumCommentLength](RAPCommentQuestion, "maximumCommentLength");
  return v3 - -[NSString _rap_charactersCount](self->_comment, "_rap_charactersCount");
}

+ (id)validatedComment:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "_rap_charactersCount");
  if (v4 > (id)+[RAPCommentQuestion maximumCommentLength](RAPCommentQuestion, "maximumCommentLength"))
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_rap_substringWithNumberOfCharacters:", +[RAPCommentQuestion maximumCommentLength](RAPCommentQuestion, "maximumCommentLength")));

    v3 = (id)v5;
  }
  return v3;
}

- (void)setComment:(id)a3
{
  unint64_t v4;
  id v5;
  NSString *v6;
  NSString *comment;
  _BOOL8 v8;
  id v9;

  if (self->_comment != a3)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(+[RAPCommentQuestion validatedComment:](RAPCommentQuestion, "validatedComment:"));
    v4 = -[NSString _rap_charactersCount](self->_comment, "_rap_charactersCount");
    v5 = objc_msgSend(v9, "_rap_charactersCount");
    v6 = (NSString *)objc_msgSend(v9, "copy");
    comment = self->_comment;
    self->_comment = v6;

    v8 = -[RAPCommentQuestion _isNowComplete](self, "_isNowComplete");
    if ((id)v4 == v5)
    {
      -[RAPQuestion _setComplete:allowInvokingDidChange:](self, "_setComplete:allowInvokingDidChange:", v8, 1);
    }
    else
    {
      -[RAPQuestion _setComplete:allowInvokingDidChange:](self, "_setComplete:allowInvokingDidChange:", v8, 0);
      -[RAPQuestion _didChange](self, "_didChange");
    }

  }
}

- (void)addPhoto:(id)a3
{
  id v4;
  id v5;
  NSArray *v6;
  NSArray *photos;
  id v8;
  NSArray *v9;
  NSArray *v10;
  id v11;

  if (self->_photos)
  {
    v4 = a3;
    v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", self->_photos);
    objc_msgSend(v5, "addObject:", v4);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v5));
    photos = self->_photos;
    self->_photos = v6;

  }
  else
  {
    v11 = a3;
    v8 = a3;
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
    v10 = self->_photos;
    self->_photos = v9;

  }
  -[RAPQuestion _setComplete:allowInvokingDidChange:](self, "_setComplete:allowInvokingDidChange:", -[RAPCommentQuestion _isNowComplete](self, "_isNowComplete", v11), 0);
  -[RAPQuestion _didChange](self, "_didChange");
}

- (void)removePhotoAtIndex:(unint64_t)a3
{
  NSArray *photos;
  id v6;
  NSArray *v7;
  NSArray *v8;

  photos = self->_photos;
  if (photos && -[NSArray count](photos, "count") > a3)
  {
    v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", self->_photos);
    objc_msgSend(v6, "removeObjectAtIndex:", a3);
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v6));
    v8 = self->_photos;
    self->_photos = v7;

  }
  -[RAPQuestion _setComplete:allowInvokingDidChange:](self, "_setComplete:allowInvokingDidChange:", -[RAPCommentQuestion _isNowComplete](self, "_isNowComplete", a3), 0);
  -[RAPQuestion _didChange](self, "_didChange");
}

- (BOOL)removePhotoForIdentifier:(id)a3
{
  id v4;
  NSArray *v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  void *v12;
  unsigned __int8 v13;
  NSUInteger v14;
  RAPCommentQuestion *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v16 = self;
  v5 = self->_photos;
  v6 = (char *)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v18;
    while (2)
    {
      v10 = 0;
      v11 = &v8[(_QWORD)v7];
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v5);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v10), "identifier"));
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if ((v13 & 1) != 0)
        {
          v11 = &v10[(_QWORD)v8];
          goto LABEL_12;
        }
        ++v10;
      }
      while (v7 != v10);
      v7 = (char *)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v8 = v11;
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v11 = 0;
  }
LABEL_12:

  v14 = -[NSArray count](v16->_photos, "count");
  if ((unint64_t)v11 < v14)
    -[RAPCommentQuestion removePhotoAtIndex:](v16, "removePhotoAtIndex:", v11);

  return (unint64_t)v11 < v14;
}

- (void)removeAllPhotos
{
  NSArray *photos;

  photos = self->_photos;
  self->_photos = (NSArray *)&__NSArray0__struct;

}

- (id)photoAtIndex:(unint64_t)a3
{
  void *v5;

  if (-[NSArray count](self->_photos, "count") <= a3)
    v5 = 0;
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_photos, "objectAtIndexedSubscript:", a3));
  return v5;
}

- (void)setPhotos:(id)a3
{
  NSArray *v4;
  NSArray *photos;

  if (self->_photos != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    photos = self->_photos;
    self->_photos = v4;

    -[RAPQuestion _setComplete:](self, "_setComplete:", -[RAPCommentQuestion _isNowComplete](self, "_isNowComplete"));
  }
}

- (BOOL)canAddPhoto
{
  unint64_t v3;

  v3 = -[NSArray count](self->_photos, "count");
  return v3 < -[RAPCommentQuestion maximumNumberOfPhotos](self, "maximumNumberOfPhotos");
}

- (BOOL)_isNowComplete
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  BOOL v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;

  if (-[RAPCommentQuestion shouldShowEmail](self, "shouldShowEmail"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlaceCorrectableString value](self->_correctableEmail, "value"));
    v4 = objc_msgSend(v3, "length");

    if (!v4)
      return 0;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCommentQuestion comment](self, "comment"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6));
  v8 = (unint64_t)objc_msgSend(v7, "length");
  v9 = v8 != 0;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCommentQuestion photos](self, "photos"));
  v11 = (unint64_t)objc_msgSend(v10, "count");

  v12 = -[RAPCommentQuestion emphasis](self, "emphasis");
  if (v12 < 2)
    return (v8 | v11) != 0;
  if (v12 == 4)
    return v11 != 0;
  if (v12 == 5)
    return 1;
  return v9;
}

- (void)_fillSubmissionParameters:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "commonCorrections"));

  if (!v4)
  {
    v5 = objc_alloc_init((Class)GEORPFeedbackCommonCorrections);
    objc_msgSend(v13, "setCommonCorrections:", v5);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCommentQuestion comment](self, "comment"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "commonCorrections"));
  objc_msgSend(v7, "setComments:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "commonContext"));
  if (!v8)
  {
    v9 = objc_alloc_init((Class)GEORPFeedbackCommonContext);
    objc_msgSend(v13, "setCommonContext:", v9);

  }
  if (-[RAPCommentQuestion shouldShowEmail](self, "shouldShowEmail"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlaceCorrectableString value](self->_correctableEmail, "value"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion report](self, "report"));
    objc_msgSend(v11, "setPreferredEmailAddress:", v10);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "commonContext"));
  objc_msgSend(v12, "addUserPath:", 10);

}

- (void)_prepareForSubmission
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  RAPPhotoWithMetadata *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];

  v14.receiver = self;
  v14.super_class = (Class)RAPCommentQuestion;
  -[RAPQuestion _prepareForSubmission](&v14, "_prepareForSubmission");
  if ((id)-[RAPCommentQuestion emphasis](self, "emphasis") != (id)3)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCommentQuestion photos](self, "photos", 0));
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          v8 = -[RAPPhotoWithMetadata initWithRAPPhoto:photoType:]([RAPPhotoWithMetadata alloc], "initWithRAPPhoto:photoType:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v7), self->_photoType);
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion report](self, "report"));
          objc_msgSend(v9, "addPhotoWithMetadata:", v8);

          v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
      }
      while (v5);
    }

  }
}

- (NSString)commentsTitle
{
  return self->_commentsTitle;
}

- (NSString)commentsPlaceholderText
{
  return self->_commentsPlaceholderText;
}

- (int64_t)emphasis
{
  return self->_emphasis;
}

- (void)setEmphasis:(int64_t)a3
{
  self->_emphasis = a3;
}

- (NSString)comment
{
  return self->_comment;
}

- (NSArray)photos
{
  return self->_photos;
}

- (int64_t)photoType
{
  return self->_photoType;
}

- (void)setPhotoType:(int64_t)a3
{
  self->_photoType = a3;
}

- (BOOL)shouldShowEmail
{
  return self->_shouldShowEmail;
}

- (void)setShouldShowEmail:(BOOL)a3
{
  self->_shouldShowEmail = a3;
}

- (RAPPlaceCorrectableString)correctableEmail
{
  return self->_correctableEmail;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correctableEmail, 0);
  objc_storeStrong((id *)&self->_photos, 0);
  objc_storeStrong((id *)&self->_comment, 0);
  objc_storeStrong((id *)&self->_localizedPhotosPickerExplanation, 0);
  objc_storeStrong((id *)&self->_commentsPlaceholderText, 0);
  objc_storeStrong((id *)&self->_commentsTitle, 0);
}

@end
