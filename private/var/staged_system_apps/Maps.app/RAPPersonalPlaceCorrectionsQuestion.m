@implementation RAPPersonalPlaceCorrectionsQuestion

- (RAPPersonalPlaceCorrectionsQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 shortcut:(id)a5
{
  id v8;
  id v9;
  id v10;
  RAPPersonalPlaceCorrectionsQuestion *v11;
  RAPPersonalPlaceCorrectionsQuestion *v12;
  id *p_shortcut;
  CLLocationDegrees *p_latitude;
  void *v15;
  double v16;
  CLLocationDegrees v17;
  void *v18;
  CLLocationDegrees v19;
  CLLocationCoordinate2D v20;
  CLLocationCoordinate2D v21;
  RAPCommentQuestion *v22;
  RAPCommentQuestion *commentQuestion;
  RAPCommentQuestion *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)RAPPersonalPlaceCorrectionsQuestion;
  v11 = -[RAPQuestion initWithReport:parentQuestion:](&v29, "initWithReport:parentQuestion:", v8, v9);
  v12 = v11;
  if (v11)
  {
    p_shortcut = (id *)&v11->_shortcut;
    objc_storeStrong((id *)&v11->_shortcut, a5);
    p_latitude = &v12->_correctedCoordinate.latitude;
    if (*p_shortcut)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_shortcut, "geoMapItem"));
      objc_msgSend(v15, "coordinate");
      v17 = v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_shortcut, "geoMapItem"));
      objc_msgSend(v18, "coordinate");
      v20 = CLLocationCoordinate2DMake(v17, v19);
      *p_latitude = v20.latitude;
      v12->_correctedCoordinate.longitude = v20.longitude;

      v12->_originalCoordinate = CLLocationCoordinate2DMake(v12->_correctedCoordinate.latitude, v12->_correctedCoordinate.longitude);
    }
    else
    {
      v21 = *(CLLocationCoordinate2D *)MKCoordinateInvalid;
      *(_OWORD *)p_latitude = *(_OWORD *)MKCoordinateInvalid;
      v12->_originalCoordinate = v21;
    }
    v22 = -[RAPCommentQuestion initWithReport:parentQuestion:]([RAPCommentQuestion alloc], "initWithReport:parentQuestion:", v8, v9);
    commentQuestion = v12->_commentQuestion;
    v12->_commentQuestion = v22;

    -[RAPCommentQuestion setEmphasis:](v12->_commentQuestion, "setEmphasis:", 5);
    v24 = v12->_commentQuestion;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[RAPCommentQuestion _localizedOptionalInformationTitle](RAPCommentQuestion, "_localizedOptionalInformationTitle"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("[RAP] Tell us more about this correction"), CFSTR("localized string not found"), 0));
    -[RAPCommentQuestion _setCommentsTitle:placeholderText:](v24, "_setCommentsTitle:placeholderText:", v25, v27);

  }
  return v12;
}

- (CLLocationCoordinate2D)currentCoordinate
{
  CLLocationCoordinate2D *p_correctedCoordinate;
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  p_correctedCoordinate = &self->_correctedCoordinate;
  if (CLLocationCoordinate2DIsValid(self->_correctedCoordinate))
  {
    latitude = p_correctedCoordinate->latitude;
    longitude = p_correctedCoordinate->longitude;
  }
  else
  {
    -[RAPPersonalPlaceCorrectionsQuestion originalCoordinate](self, "originalCoordinate");
  }
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void)_fillSubmissionParameters:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
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
  void *v31;
  void *v32;
  unint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commonContext"));

  if (!v5)
  {
    v6 = objc_alloc_init((Class)GEORPFeedbackCommonContext);
    objc_msgSend(v4, "setCommonContext:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion parentQuestion](self, "parentQuestion"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commonContext"));
    objc_msgSend(v8, "addUserPath:", 48);

  }
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v9 = self->_userPaths;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v49;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v49 != v12)
          objc_enumerationMutation(v9);
        v14 = objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)v13), "integerValue", (_QWORD)v48);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commonContext"));
        objc_msgSend(v15, "addUserPath:", v14);

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v11);
  }

  -[NSMutableArray removeAllObjects](self->_userPaths, "removeAllObjects");
  objc_msgSend(v4, "setType:", 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));

  if (!v16)
  {
    v17 = objc_alloc_init((Class)GEORPFeedbackDetails);
    objc_msgSend(v4, "setDetails:", v17);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details", (_QWORD)v48));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "addressPointFeedback"));

  if (!v19)
  {
    v20 = objc_alloc_init((Class)GEORPAddressFeedback);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));
    objc_msgSend(v21, "setAddressPointFeedback:", v20);

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsShortcut geoMapItem](self->_shortcut, "geoMapItem"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "_placeData"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "addressPointFeedback"));
  objc_msgSend(v25, "setPlace:", v23);

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "addressPointFeedback"));
  objc_msgSend(v27, "setType:", 2);

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "addressPointFeedback"));
  v30 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "personalizedMaps"));

  if (!v30)
  {
    v30 = objc_alloc_init((Class)GEORPPersonalizedMapsContext);
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "addressPointFeedback"));
    objc_msgSend(v32, "setPersonalizedMaps:", v30);

  }
  objc_msgSend(v30, "setAddressType:", 9);
  v33 = (unint64_t)-[MapsSuggestionsShortcut type](self->_shortcut, "type");
  if (v33 > 6)
    v34 = 0;
  else
    v34 = dword_100E3EEC8[v33];
  objc_msgSend(v30, "setPlaceType:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "addressPointFeedback"));
  v37 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "address"));

  if (!v37)
  {
    v37 = objc_alloc_init((Class)GEORPAddressCorrections);
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "addressPointFeedback"));
    objc_msgSend(v39, "setAddress:", v37);

  }
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "addressFields"));

  if (!v40)
  {
    v41 = objc_alloc_init((Class)GEORPFeedbackAddressFields);
    objc_msgSend(v37, "setAddressFields:", v41);

  }
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPersonalPlaceCorrectionsQuestion _geoCoordinateFromUserCorrections](self, "_geoCoordinateFromUserCorrections"));
  objc_msgSend(v37, "setCoordinate:", v42);

  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "addressPointFeedback"));
  objc_msgSend(v44, "setAddress:", v37);

  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commonContext"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "searchCommon"));

  if (!v46)
  {
    v46 = (void *)objc_opt_new(GEORPSearchCommonContext);
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commonContext"));
    objc_msgSend(v47, "setSearchCommon:", v46);

  }
  -[RAPCommentQuestion _fillSubmissionParameters:](self->_commentQuestion, "_fillSubmissionParameters:", v4);

}

- (id)_geoCoordinateFromUserCorrections
{
  id v3;
  double v4;
  double v5;
  id v6;
  id v7;
  double v8;
  double v9;
  id v10;
  CLLocationCoordinate2D v12;

  v3 = objc_alloc_init((Class)GEORPCorrectedCoordinate);
  -[RAPPersonalPlaceCorrectionsQuestion originalCoordinate](self, "originalCoordinate");
  v6 = objc_msgSend(objc_alloc((Class)GEOLatLng), "initWithLatitude:longitude:", v4, v5);
  objc_msgSend(v3, "setOriginalCoordinate:", v6);

  -[RAPPersonalPlaceCorrectionsQuestion correctedCoordinate](self, "correctedCoordinate");
  if (CLLocationCoordinate2DIsValid(v12))
  {
    v7 = objc_alloc((Class)GEOLatLng);
    -[RAPPersonalPlaceCorrectionsQuestion correctedCoordinate](self, "correctedCoordinate");
    v9 = v8;
    -[RAPPersonalPlaceCorrectionsQuestion correctedCoordinate](self, "correctedCoordinate");
    v10 = objc_msgSend(v7, "initWithLatitude:longitude:", v9);
    objc_msgSend(v3, "setCorrectedCoordinate:", v10);

  }
  return v3;
}

- (BOOL)isAdjustedCoordinateBeyondThreshold
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
  double v8;
  double v9;
  double v10;
  CLLocationCoordinate2D v12;
  CLLocationCoordinate2D v13;
  CLLocationCoordinate2D v14;

  -[RAPPersonalPlaceCorrectionsQuestion originalCoordinate](self, "originalCoordinate");
  v4 = v3;
  v6 = v5;
  -[RAPPersonalPlaceCorrectionsQuestion correctedCoordinate](self, "correctedCoordinate");
  if (CLLocationCoordinate2DIsValid(v12) && (v13.latitude = v4, v13.longitude = v6, CLLocationCoordinate2DIsValid(v13)))
  {
    v7 = -[RAPPersonalPlaceCorrectionsQuestion correctedCoordinate](self, "correctedCoordinate");
    v10 = GEOCalculateDistance(v7, v8, v9, v4, v6);
    return v10 >= GEOConfigGetDouble(MapsConfig_ThresholdForSubmittingHomeWorkRAPInMeters, off_1014B3418);
  }
  else
  {
    -[RAPPersonalPlaceCorrectionsQuestion correctedCoordinate](self, "correctedCoordinate");
    return CLLocationCoordinate2DIsValid(v14);
  }
}

- (void)setCorrectedCoordinate:(CLLocationCoordinate2D)a3
{
  if (vabdd_f64(a3.latitude, self->_correctedCoordinate.latitude) >= 0.00000000999999994
    || vabdd_f64(a3.longitude, self->_correctedCoordinate.longitude) >= 0.00000000999999994)
  {
    self->_correctedCoordinate = a3;
    -[RAPQuestion _didChange](self, "_didChange");
  }
}

- (void)rapCompleted:(BOOL)a3 privacyShown:(BOOL)a4 analyticsEvent:(id)a5
{
  uint64_t v5;
  uint64_t v6;

  if (a3)
    v5 = 10112;
  else
    v5 = 10113;
  if (a4)
    v6 = 1313;
  else
    v6 = 1305;
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", v5, v6, a5);
}

- (void)submitRAPWithWillSubmitBlock:(id)a3 didSubmitBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion report](self, "report"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100B31E5C;
  v15[3] = &unk_1011DF478;
  v15[4] = self;
  v12 = v7;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100B31F4C;
  v13[3] = &unk_1011BD028;
  v14 = v6;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100B31F60;
  v11[3] = &unk_1011E3A28;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "submitWithPrivacyRequestHandler:willStartSubmitting:didFinishSubmitting:", v15, v13, v11);

}

- (BOOL)isComplete
{
  return -[RAPPersonalPlaceCorrectionsQuestion isAdjustedCoordinateBeyondThreshold](self, "isAdjustedCoordinateBeyondThreshold");
}

- (void)addUserPathItem:(int)a3
{
  uint64_t v3;
  NSMutableArray *userPaths;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  userPaths = self->_userPaths;
  if (!userPaths)
  {
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v7 = self->_userPaths;
    self->_userPaths = v6;

    userPaths = self->_userPaths;
  }
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3));
  -[NSMutableArray addObject:](userPaths, "addObject:", v8);

}

- (int)userAction
{
  return 13001;
}

- (int64_t)questionCategory
{
  int64_t v2;

  v2 = -[RAPPersonalPlaceCorrectionsQuestion shortcutType](self, "shortcutType");
  if ((unint64_t)(v2 - 2) > 3)
    return 0;
  else
    return qword_100E3EEE8[v2 - 2];
}

- (NSString)localizedTitle
{
  id v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  __CFString *v6;

  v2 = -[MapsSuggestionsShortcut type](self->_shortcut, "type");
  if (v2 == (id)5)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("School Details");
  }
  else if (v2 == (id)3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("Work Details");
  }
  else
  {
    if (v2 != (id)2)
    {
      v6 = &stru_1011EB268;
      return (NSString *)v6;
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("Home Details");
  }
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, CFSTR("localized string not found"), 0));

  return (NSString *)v6;
}

- (int64_t)shortcutType
{
  return self->_shortcutType;
}

- (void)setShortcutType:(int64_t)a3
{
  self->_shortcutType = a3;
}

- (MapsSuggestionsShortcut)shortcut
{
  return self->_shortcut;
}

- (RAPCommentQuestion)commentQuestion
{
  return self->_commentQuestion;
}

- (CLLocationCoordinate2D)originalCoordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_originalCoordinate.latitude;
  longitude = self->_originalCoordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (CLLocationCoordinate2D)correctedCoordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_correctedCoordinate.latitude;
  longitude = self->_correctedCoordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commentQuestion, 0);
  objc_storeStrong((id *)&self->_shortcut, 0);
  objc_storeStrong((id *)&self->_userPaths, 0);
}

@end
