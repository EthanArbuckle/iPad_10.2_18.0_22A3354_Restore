@implementation UGCSuggestionViewProvider

- (UGCSuggestionViewProvider)initWithMapItem:(id)a3
{
  id v5;
  UGCSuggestionViewProvider *v6;
  UGCSuggestionViewProvider *v7;
  uint64_t v8;
  MUPlaceCallToActionAppearance *submissionStatus;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UGCSuggestionViewProvider;
  v6 = -[UGCSuggestionViewProvider init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mapItem, a3);
    v8 = objc_claimAutoreleasedReturnValue(+[MUPlaceCallToActionAppearance userRecommendedLoadingAppearance](MUPlaceCallToActionAppearance, "userRecommendedLoadingAppearance"));
    submissionStatus = v7->_submissionStatus;
    v7->_submissionStatus = (MUPlaceCallToActionAppearance *)v8;

  }
  return v7;
}

- (void)setSubmissionStatus:(id)a3
{
  MUPlaceCallToActionAppearance *v5;
  MUPlaceCallToActionAppearance *v6;
  unsigned __int8 v7;
  MUPlaceCallToActionAppearance *v8;

  v5 = (MUPlaceCallToActionAppearance *)a3;
  v6 = v5;
  if (self->_submissionStatus != v5)
  {
    v8 = v5;
    v7 = -[MUPlaceCallToActionAppearance isEqual:](v5, "isEqual:");
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_submissionStatus, a3);
      -[UGCSuggestionViewProvider _reevaluateSuggestion](self, "_reevaluateSuggestion");
      v6 = v8;
    }
  }

}

- (void)_unloadSuggestionView
{
  UGCSuggestionView *suggestionView;

  suggestionView = self->_suggestionView;
  self->_suggestionView = 0;

}

- (void)_loadSuggestionViewIfNeeded
{
  NSDate *visitEndDate;
  UGCSuggestionView *v4;
  UGCSuggestionView *suggestionView;
  UGCSuggestionViewModel *v6;

  if (!self->_suggestionView && self->_contentType)
  {
    v6 = objc_alloc_init(UGCSuggestionViewModel);
    -[UGCSuggestionViewModel setContentType:](v6, "setContentType:", self->_contentType);
    visitEndDate = self->_visitEndDate;
    if (!visitEndDate)
      visitEndDate = self->_visitStartDate;
    -[UGCSuggestionViewModel setVisitDate:](v6, "setVisitDate:", visitEndDate);
    v4 = -[UGCSuggestionView initWithFrame:]([UGCSuggestionView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    suggestionView = self->_suggestionView;
    self->_suggestionView = v4;

    -[UGCSuggestionView setViewModel:](self->_suggestionView, "setViewModel:", v6);
    -[UGCSuggestionView setDelegate:](self->_suggestionView, "setDelegate:", self);

  }
}

- (UIView)suggestionView
{
  -[UGCSuggestionViewProvider _loadSuggestionViewIfNeeded](self, "_loadSuggestionViewIfNeeded");
  return (UIView *)self->_suggestionView;
}

- (MUARPSuggestionViewModel)suggestionViewModelForWebPlacecard
{
  void *v3;
  id v4;
  __CFString *v5;
  id v6;
  id v7;
  __CFString *v8;
  void *v9;
  void *v10;
  id v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  _BOOL8 v26;
  void *v27;

  -[UGCSuggestionViewProvider _loadSuggestionViewIfNeeded](self, "_loadSuggestionViewIfNeeded");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UGCSuggestionView viewModel](self->_suggestionView, "viewModel"));
  v4 = objc_msgSend(v3, "contentType");

  v5 = &stru_1011EB268;
  v6 = v4;
  v7 = 0;
  v8 = &stru_1011EB268;
  switch((unint64_t)v6)
  {
    case 0uLL:
      goto LABEL_12;
    case 1uLL:
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("[UGC Web Placecard] Add Your Photos to Maps"), CFSTR("localized string not found"), 0));

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v11 = v10;
      v12 = CFSTR("[UGC Web Placecard] You took photos here");
      goto LABEL_9;
    case 2uLL:
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("[UGC Web Placecard] Rate This Place"), CFSTR("localized string not found"), 0));

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v11 = v10;
      v12 = CFSTR("[UGC Web Placecard] In your Favorites");
      goto LABEL_9;
    case 3uLL:
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("[UGC Web Placecard] Rate This Place"), CFSTR("localized string not found"), 0));

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v11 = v10;
      v12 = CFSTR("[UGC Web Placecard] It’s pinned.");
      goto LABEL_9;
    case 4uLL:
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[UGCSuggestionView viewModel](self->_suggestionView, "viewModel"));
      v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "visitDate"));

      if (v7)
      {
        v11 = objc_alloc_init((Class)NSRelativeDateTimeFormatter);
        objc_msgSend(v11, "setDateTimeStyle:", 1);
        objc_msgSend(v11, "setUnitsStyle:", 0);
        objc_msgSend(v11, "setFormattingContext:", 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[UGCSuggestionView viewModel](self->_suggestionView, "viewModel"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "visitDate"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForDate:relativeToDate:", v17, v18));

        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("[UGC Web Placecard] Rate This Place"), CFSTR("localized string not found"), 0));

        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("[UGC Web Placecard] Visited"), CFSTR("localized string not found"), 0));
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v22, v19));

LABEL_10:
LABEL_11:
        v24 = objc_alloc((Class)MUARPSuggestionViewModel);
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[UGCSuggestionView viewModel](self->_suggestionView, "viewModel"));
        v26 = (char *)objc_msgSend(v25, "contentType") - 2 < (char *)4;
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[UGCSuggestionView viewModel](self->_suggestionView, "viewModel"));
        v7 = objc_msgSend(v24, "initWithTitle:subtitle:isRatingSuggestion:isPhotoSuggestion:", v8, v5, v26, objc_msgSend(v27, "contentType") == (id)1);

      }
      else
      {
        v8 = &stru_1011EB268;
      }
LABEL_12:

      return (MUARPSuggestionViewModel *)v7;
    case 5uLL:
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("[UGC Web Placecard] Rate This Place"), CFSTR("localized string not found"), 0));

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v11 = v10;
      v12 = CFSTR("[UGC Web Placecard] You’re nearby");
LABEL_9:
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", v12, CFSTR("localized string not found"), 0));
      goto LABEL_10;
    default:
      v8 = &stru_1011EB268;
      goto LABEL_11;
  }
}

- (void)_reevaluateSuggestion
{
  int64_t v3;
  id v4;
  NSObject *v5;
  MKMapItem *v6;
  NSObject *v7;
  id v8;
  MKMapItem *mapItem;
  int v10;
  _QWORD v11[2];

  if (!-[UGCSuggestionViewProvider _canAddPhotos](self, "_canAddPhotos")
    && !-[UGCSuggestionViewProvider _canRate](self, "_canRate"))
  {
    v8 = sub_10043310C();
    v7 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      mapItem = self->_mapItem;
      v10 = 138412290;
      v11[0] = mapItem;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Skipping generation of placecard suggestion for map item: %@", (uint8_t *)&v10, 0xCu);
    }
    goto LABEL_9;
  }
  -[UGCSuggestionViewProvider _checkForVisitAndPhotosIfNeeded](self, "_checkForVisitAndPhotosIfNeeded");
  v3 = -[UGCSuggestionViewProvider _bestContentType](self, "_bestContentType");
  v4 = sub_10043310C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = self->_mapItem;
    v10 = 67109378;
    LODWORD(v11[0]) = v3;
    WORD2(v11[0]) = 2112;
    *(_QWORD *)((char *)v11 + 6) = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Determined best placecard suggestion as %d for map item: %@", (uint8_t *)&v10, 0x12u);
  }

  if (v3 != self->_contentType)
  {
    -[UGCSuggestionViewProvider _unloadSuggestionView](self, "_unloadSuggestionView");
    self->_contentType = v3;
    -[UGCSuggestionViewProvider _loadSuggestionViewIfNeeded](self, "_loadSuggestionViewIfNeeded");
    v7 = objc_claimAutoreleasedReturnValue(-[UGCSuggestionViewProvider delegate](self, "delegate"));
    -[NSObject suggestionViewProviderDidUpdateView:](v7, "suggestionViewProviderDidUpdateView:", self);
LABEL_9:

  }
}

- (int64_t)_bestContentType
{
  if (-[UGCSuggestionViewProvider _isLoadingSubmission](self, "_isLoadingSubmission")
    || -[UGCSuggestionViewProvider _hasSubmission](self, "_hasSubmission")
    || -[UGCSuggestionViewProvider _isCheckingForVisitAndPhotos](self, "_isCheckingForVisitAndPhotos"))
  {
    return 0;
  }
  if (-[UGCSuggestionViewProvider _canAddPhotos](self, "_canAddPhotos")
    && -[UGCSuggestionViewProvider _hasNearbyPhotos](self, "_hasNearbyPhotos"))
  {
    return 1;
  }
  if (!-[UGCSuggestionViewProvider _canRate](self, "_canRate"))
    return 0;
  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    if (-[UGCSuggestionViewProvider _isPinned](self, "_isPinned"))
      return 3;
  }
  else if (-[UGCSuggestionViewProvider _isFavorite](self, "_isFavorite"))
  {
    return 2;
  }
  if (-[UGCSuggestionViewProvider _hasVisited](self, "_hasVisited"))
    return 4;
  if (!-[UGCSuggestionViewProvider _isNearbyLocation](self, "_isNearbyLocation"))
    return 0;
  else
    return 5;
}

- (void)_checkForVisitAndPhotosIfNeeded
{
  id v3;
  NSObject *v4;
  MKMapItem *mapItem;
  _QWORD *v6;
  MKMapItem *v7;
  unsigned __int8 v8;
  unint64_t UInteger;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  MKMapItem *v15;
  _QWORD v16[4];
  MKMapItem *v17;
  id v18;
  unsigned __int8 v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  MKMapItem *v23;

  if (!self->_isCheckingForVisitAndPhotos && !self->_didCheckForVisitAndPhotos)
  {
    v3 = sub_10043310C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      mapItem = self->_mapItem;
      *(_DWORD *)buf = 138412290;
      v23 = mapItem;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Checking for visit and photos at map item: %@", buf, 0xCu);
    }

    self->_isCheckingForVisitAndPhotos = 1;
    objc_initWeak((id *)buf, self);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100423934;
    v20[3] = &unk_1011B5DF8;
    objc_copyWeak(&v21, (id *)buf);
    v6 = objc_retainBlock(v20);
    v7 = self->_mapItem;
    v8 = -[UGCSuggestionViewProvider _canAddPhotos](self, "_canAddPhotos");
    UInteger = GEOConfigGetUInteger(MapsConfig_UGCNearbyVisitThresholdInMeters, off_1014B3748);
    v10 = sub_100B3A5D4();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "oneUser"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _geoMapItem](v7, "_geoMapItem"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100423A48;
    v16[3] = &unk_1011B5E48;
    v14 = v6;
    v18 = v14;
    v19 = v8;
    v15 = v7;
    v17 = v15;
    objc_msgSend(v12, "mostRecentVisitWithinDistance:ofMapItem:handler:", v13, v16, (double)UInteger);

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_setVisitStartDate:(id)a3 visitEndDate:(id)a4 hasNearbyPhotos:(BOOL)a5
{
  _BOOL4 v5;
  unint64_t v9;
  unint64_t v10;
  id v11;
  NSObject *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  MKMapItem *mapItem;
  int v18;
  __CFString *v19;
  __int16 v20;
  __CFString *v21;
  __int16 v22;
  MKMapItem *v23;

  v5 = a5;
  v9 = (unint64_t)a3;
  v10 = (unint64_t)a4;
  if (self->_isCheckingForVisitAndPhotos && !self->_didCheckForVisitAndPhotos)
  {
    v11 = sub_10043310C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      if (v9 | v10)
        v13 = CFSTR("YES");
      else
        v13 = CFSTR("NO");
      v14 = v13;
      if (v5)
        v15 = CFSTR("YES");
      else
        v15 = CFSTR("NO");
      v16 = v15;
      mapItem = self->_mapItem;
      v18 = 138412802;
      v19 = v14;
      v20 = 2112;
      v21 = v16;
      v22 = 2112;
      v23 = mapItem;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Completed placecard suggestion analysis: has visit (%@), has nearby photos (%@), map item: %@", (uint8_t *)&v18, 0x20u);

    }
    *(_WORD *)&self->_isCheckingForVisitAndPhotos = 256;
    objc_storeStrong((id *)&self->_visitStartDate, a3);
    objc_storeStrong((id *)&self->_visitEndDate, a4);
    self->_hasNearbyPhotos = v5;
    -[UGCSuggestionViewProvider _reevaluateSuggestion](self, "_reevaluateSuggestion");
  }

}

- (BOOL)_isLoadingSubmission
{
  return -[MUPlaceCallToActionAppearance type](self->_submissionStatus, "type") == (id)5;
}

- (BOOL)_hasSubmission
{
  return -[MUPlaceCallToActionAppearance type](self->_submissionStatus, "type") == (id)4;
}

- (BOOL)_canAddPhotos
{
  return +[MKPOIEnrichmentAvailibility shouldShowPhotosCallToActionForMapItem:](MKPOIEnrichmentAvailibility, "shouldShowPhotosCallToActionForMapItem:", self->_mapItem);
}

- (BOOL)_canRate
{
  return +[MKPOIEnrichmentAvailibility shouldShowRatingsCallToActionForMapItem:](MKPOIEnrichmentAvailibility, "shouldShowRatingsCallToActionForMapItem:", self->_mapItem);
}

- (BOOL)_isCheckingForVisitAndPhotos
{
  return self->_isCheckingForVisitAndPhotos;
}

- (BOOL)_hasNearbyPhotos
{
  return self->_hasNearbyPhotos;
}

- (BOOL)_isPinned
{
  UGCSuggestionViewProvider *v2;
  void *v3;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UGCSuggestionViewProvider delegate](self, "delegate"));
  LOBYTE(v2) = objc_msgSend(v3, "suggestionViewProviderIsPlacePinned:", v2);

  return (char)v2;
}

- (BOOL)_isFavorite
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ShortcutManager sharedManager](ShortcutManager, "sharedManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "meCard"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_maps_shortcutIncludingHiddenForMapItem:", self->_mapItem));
  LOBYTE(self) = v5 != 0;

  return (char)self;
}

- (BOOL)_hasVisited
{
  return self->_visitStartDate || self->_visitEndDate != 0;
}

- (BOOL)_isNearbyLocation
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  BOOL v7;
  id v8;
  double v9;
  double v10;
  id v11;
  double Double;
  double v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  if (objc_msgSend(v3, "isAuthorizedForPreciseLocation"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastLocation"));
    if (v4)
    {
      -[MKMapItem _coordinate](self->_mapItem, "_coordinate");
      v7 = 0;
      if (v6 >= -180.0 && v6 <= 180.0 && v5 >= -90.0 && v5 <= 90.0)
      {
        v8 = objc_alloc((Class)CLLocation);
        -[MKMapItem _coordinate](self->_mapItem, "_coordinate");
        v10 = v9;
        -[MKMapItem _coordinate](self->_mapItem, "_coordinate");
        v11 = objc_msgSend(v8, "initWithLatitude:longitude:", v10);
        Double = GEOConfigGetDouble(MapsConfig_ARPMaxDistanceForNearbyRatingSuggestion, off_1014B3A88);
        objc_msgSend(v4, "distanceFromLocation:", v11);
        v7 = v13 < Double;

      }
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_didTapSuggestionViewWithOverallState:(int64_t)a3
{
  int64_t contentType;
  id v6;

  contentType = self->_contentType;
  if ((unint64_t)(contentType - 2) >= 4)
  {
    if (contentType != 1)
      return;
    v6 = (id)objc_claimAutoreleasedReturnValue(-[UGCSuggestionViewProvider delegate](self, "delegate", a3));
    objc_msgSend(v6, "suggestionViewProviderDidSelectAddPhotos:", self);
  }
  else
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[UGCSuggestionViewProvider delegate](self, "delegate"));
    objc_msgSend(v6, "suggestionViewProviderDidSelectRateThisPlace:overallState:", self, a3);
  }

}

- (void)didTapSuggestionView:(id)a3
{
  -[UGCSuggestionViewProvider _didTapSuggestionViewWithOverallState:](self, "_didTapSuggestionViewWithOverallState:", 0);
}

- (void)suggestionViewDidTapLike:(id)a3
{
  -[UGCSuggestionViewProvider _didTapSuggestionViewWithOverallState:](self, "_didTapSuggestionViewWithOverallState:", 2);
}

- (void)suggestionViewDidTapDislike:(id)a3
{
  -[UGCSuggestionViewProvider _didTapSuggestionViewWithOverallState:](self, "_didTapSuggestionViewWithOverallState:", 1);
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (MUPlaceCallToActionAppearance)submissionStatus
{
  return self->_submissionStatus;
}

- (UGCSuggestionViewProviderDelegate)delegate
{
  return (UGCSuggestionViewProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_submissionStatus, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_suggestionView, 0);
  objc_storeStrong((id *)&self->_visitEndDate, 0);
  objc_storeStrong((id *)&self->_visitStartDate, 0);
}

@end
