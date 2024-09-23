@implementation APPBLogSysEventRequest

+ (id)options
{
  if (qword_100269638 != -1)
    dispatch_once(&qword_100269638, &stru_1002141D8);
  return (id)qword_100269630;
}

- (BOOL)hasMetaData
{
  return self->_metaData != 0;
}

- (int)eventType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_eventType;
  else
    return 1;
}

- (void)setEventType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_eventType = a3;
}

- (void)setHasEventType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEventType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)eventTypeAsString:(int)a3
{
  __CFString *v3;
  id result;

  if (a3 <= 299)
  {
    v3 = CFSTR("BannerClicked");
    switch(a3)
    {
      case 1:
        return v3;
      case 2:
        v3 = CFSTR("iTunesLaunched");
        return v3;
      case 3:
      case 37:
      case 39:
      case 40:
      case 41:
        goto LABEL_52;
      case 4:
        return CFSTR("ExternalLink");
      case 5:
        return CFSTR("AdSheetOpened");
      case 6:
        return CFSTR("AdSheetLoaded");
      case 7:
        return CFSTR("AdSheetClosedWithXButton");
      case 8:
        return CFSTR("AdSheetClosedWithHomeButton");
      case 9:
        return CFSTR("AppPreventedAdAction");
      case 10:
        return CFSTR("AppCancelledAdAction");
      case 11:
        return CFSTR("AppPause");
      case 12:
        return CFSTR("AppResume");
      case 13:
        return CFSTR("AdRedirectOK");
      case 14:
        return CFSTR("AdRedirectCancel");
      case 15:
        return CFSTR("AdBuyOK");
      case 16:
        return CFSTR("AdBuyCancel");
      case 17:
        return CFSTR("WallpaperSetOK");
      case 18:
        return CFSTR("WallpaperSetCancel");
      case 19:
        return CFSTR("CalendarEventCreateOK");
      case 20:
        return CFSTR("CalendarEventCreateCancel");
      case 21:
        return CFSTR("EmailSendOK");
      case 22:
        return CFSTR("EmailSendCancel");
      case 23:
        return CFSTR("SMSSendOK");
      case 24:
        return CFSTR("SMSSendCancel");
      case 25:
        return CFSTR("AdSheetCallOK");
      case 26:
        return CFSTR("AdSheetCallCancel");
      case 27:
        return CFSTR("AdInterstitialDidAppear");
      case 28:
        return CFSTR("AdInterstitialDidDisappear");
      case 29:
        return CFSTR("AdInterstitialWasDismissed");
      case 30:
        return CFSTR("AdInterstitialWasRemovedFromView");
      case 31:
        return CFSTR("AdContactsEntryCreated");
      case 32:
        return CFSTR("AdContactsEntryCanceled");
      case 33:
        return CFSTR("AdIBooksPDFAdded");
      case 34:
        return CFSTR("AdIBooksPDFCanceled");
      case 35:
        return CFSTR("AdCameraPictureCaptured");
      case 36:
        return CFSTR("AdCameraPictureCanceled");
      case 38:
        return CFSTR("AdSheetClosedWithClientBackgrounded");
      case 42:
        return CFSTR("AdSheetClosedWithAutoDismiss");
      default:
        if (a3 == 200)
        {
          result = CFSTR("RingtoneDownloadOK");
        }
        else
        {
          if (a3 != 201)
            goto LABEL_52;
          result = CFSTR("RingtoneDownloadCancel");
        }
        break;
    }
    return result;
  }
  if (a3 > 700)
  {
    if (a3 <= 899)
    {
      switch(a3)
      {
        case 701:
          return CFSTR("ReminderCreateCancel");
        case 800:
          return CFSTR("PreRollSkip");
        case 801:
          return CFSTR("CreativeUnloadedWithInvalidSize");
      }
      goto LABEL_52;
    }
    switch(a3)
    {
      case 900:
        result = CFSTR("PrivacyAdMarkWasTapped");
        break;
      case 901:
        result = CFSTR("PrivacyAdTransparencyDidAppear");
        break;
      case 902:
        result = CFSTR("PrivacyAdTransparencyDidRenderTransparency");
        break;
      case 903:
        result = CFSTR("PrivacyAdTransparencyDidDisappear");
        break;
      case 904:
        result = CFSTR("PrivacyAdTransparencyDidLinkOut");
        break;
      case 905:
        result = CFSTR("AdCreativeDidUnload");
        break;
      case 906:
        result = CFSTR("TapGestureTimerDidExpireBeforePrimaryActionWasInvoked");
        break;
      case 907:
        result = CFSTR("NavigationActionBlockedDueToAccidentalTap");
        break;
      case 908:
        result = CFSTR("CarouselFinished");
        break;
      case 909:
        result = CFSTR("TimeSpent");
        break;
      default:
        goto LABEL_52;
    }
  }
  else
  {
    if (a3 > 499)
    {
      if (a3 <= 599)
      {
        switch(a3)
        {
          case 500:
            result = CFSTR("SaveImageToPhotosOK");
            break;
          case 501:
            result = CFSTR("SaveImageToPhotosCancel");
            break;
          case 502:
            result = CFSTR("SaveVideoToPhotosOK");
            break;
          case 503:
            result = CFSTR("SaveVideoToPhotosCancel");
            break;
          default:
            goto LABEL_52;
        }
        return result;
      }
      if (a3 <= 601)
      {
        if (a3 == 600)
          return CFSTR("AdSheetClosedByPrivilegedAd");
        else
          return CFSTR("AdSheetClosedWithPrimaryURLFailure");
      }
      if (a3 == 602)
        return CFSTR("AdSheetClosedWithProductPageLoadFailure");
      if (a3 == 700)
        return CFSTR("ReminderCreateOK");
LABEL_52:
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
      return v3;
    }
    switch(a3)
    {
      case 400:
        result = CFSTR("VisibleContentsCaptureOK");
        break;
      case 401:
        result = CFSTR("VisibleContentsCaptureCancel");
        break;
      case 402:
        result = CFSTR("VisibleContentsSaveToPhotosOK");
        break;
      case 403:
        result = CFSTR("VisibleContentsSaveToPhotosCancel");
        break;
      default:
        if (a3 == 300)
        {
          result = CFSTR("InAdWebViewOpened");
        }
        else
        {
          if (a3 != 301)
            goto LABEL_52;
          result = CFSTR("InAdWebViewClosed");
        }
        break;
    }
  }
  return result;
}

- (int)StringAsEventType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BannerClicked")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("iTunesLaunched")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ExternalLink")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AdSheetOpened")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AdSheetLoaded")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AdSheetClosedWithXButton")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AdSheetClosedWithHomeButton")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AppPreventedAdAction")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AppCancelledAdAction")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AppPause")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AppResume")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AdRedirectOK")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AdRedirectCancel")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AdBuyOK")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AdBuyCancel")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WallpaperSetOK")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WallpaperSetCancel")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CalendarEventCreateOK")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CalendarEventCreateCancel")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EmailSendOK")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EmailSendCancel")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SMSSendOK")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SMSSendCancel")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AdSheetCallOK")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AdSheetCallCancel")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AdInterstitialDidAppear")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AdInterstitialDidDisappear")) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AdInterstitialWasDismissed")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AdInterstitialWasRemovedFromView")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AdContactsEntryCreated")) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AdContactsEntryCanceled")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AdIBooksPDFAdded")) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AdIBooksPDFCanceled")) & 1) != 0)
  {
    v4 = 34;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AdCameraPictureCaptured")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AdCameraPictureCanceled")) & 1) != 0)
  {
    v4 = 36;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AdSheetClosedWithClientBackgrounded")) & 1) != 0)
  {
    v4 = 38;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AdSheetClosedWithAutoDismiss")) & 1) != 0)
  {
    v4 = 42;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RingtoneDownloadOK")) & 1) != 0)
  {
    v4 = 200;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RingtoneDownloadCancel")) & 1) != 0)
  {
    v4 = 201;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("InAdWebViewOpened")) & 1) != 0)
  {
    v4 = 300;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("InAdWebViewClosed")) & 1) != 0)
  {
    v4 = 301;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VisibleContentsCaptureOK")) & 1) != 0)
  {
    v4 = 400;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VisibleContentsCaptureCancel")) & 1) != 0)
  {
    v4 = 401;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VisibleContentsSaveToPhotosOK")) & 1) != 0)
  {
    v4 = 402;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VisibleContentsSaveToPhotosCancel")) & 1) != 0)
  {
    v4 = 403;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SaveImageToPhotosOK")) & 1) != 0)
  {
    v4 = 500;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SaveImageToPhotosCancel")) & 1) != 0)
  {
    v4 = 501;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SaveVideoToPhotosOK")) & 1) != 0)
  {
    v4 = 502;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SaveVideoToPhotosCancel")) & 1) != 0)
  {
    v4 = 503;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AdSheetClosedByPrivilegedAd")) & 1) != 0)
  {
    v4 = 600;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AdSheetClosedWithPrimaryURLFailure")) & 1) != 0)
  {
    v4 = 601;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AdSheetClosedWithProductPageLoadFailure")) & 1) != 0)
  {
    v4 = 602;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ReminderCreateOK")) & 1) != 0)
  {
    v4 = 700;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ReminderCreateCancel")) & 1) != 0)
  {
    v4 = 701;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PreRollSkip")) & 1) != 0)
  {
    v4 = 800;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CreativeUnloadedWithInvalidSize")) & 1) != 0)
  {
    v4 = 801;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PrivacyAdMarkWasTapped")) & 1) != 0)
  {
    v4 = 900;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PrivacyAdTransparencyDidAppear")) & 1) != 0)
  {
    v4 = 901;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PrivacyAdTransparencyDidRenderTransparency")) & 1) != 0)
  {
    v4 = 902;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PrivacyAdTransparencyDidDisappear")) & 1) != 0)
  {
    v4 = 903;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PrivacyAdTransparencyDidLinkOut")) & 1) != 0)
  {
    v4 = 904;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AdCreativeDidUnload")) & 1) != 0)
  {
    v4 = 905;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TapGestureTimerDidExpireBeforePrimaryActionWasInvoked")) & 1) != 0)
  {
    v4 = 906;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NavigationActionBlockedDueToAccidentalTap")) & 1) != 0)
  {
    v4 = 907;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CarouselFinished")) & 1) != 0)
  {
    v4 = 908;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TimeSpent")))
  {
    v4 = 909;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)hasClickLocation
{
  return self->_clickLocation != 0;
}

- (void)setActionableDuration:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_actionableDuration = a3;
}

- (void)setHasActionableDuration:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasActionableDuration
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasBannerCustomMetadata
{
  return self->_bannerCustomMetadata != 0;
}

- (void)setRequestCount:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_requestCount = a3;
}

- (void)setHasRequestCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRequestCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBLogSysEventRequest;
  v3 = -[APPBLogSysEventRequest description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBLogSysEventRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  APPBLogMetaData *metaData;
  void *v6;
  int eventType;
  __CFString *v8;
  APPBClickLocation *clickLocation;
  void *v10;
  void *v11;
  NSString *bannerCustomMetadata;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  metaData = self->_metaData;
  if (metaData)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[APPBLogMetaData dictionaryRepresentation](metaData, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("metaData"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    eventType = self->_eventType;
    if (eventType <= 299)
    {
      v8 = CFSTR("BannerClicked");
      switch(eventType)
      {
        case 1:
          goto LABEL_90;
        case 2:
          v8 = CFSTR("iTunesLaunched");
          goto LABEL_90;
        case 3:
        case 37:
        case 39:
        case 40:
        case 41:
          goto LABEL_53;
        case 4:
          v8 = CFSTR("ExternalLink");
          goto LABEL_90;
        case 5:
          v8 = CFSTR("AdSheetOpened");
          goto LABEL_90;
        case 6:
          v8 = CFSTR("AdSheetLoaded");
          goto LABEL_90;
        case 7:
          v8 = CFSTR("AdSheetClosedWithXButton");
          goto LABEL_90;
        case 8:
          v8 = CFSTR("AdSheetClosedWithHomeButton");
          goto LABEL_90;
        case 9:
          v8 = CFSTR("AppPreventedAdAction");
          goto LABEL_90;
        case 10:
          v8 = CFSTR("AppCancelledAdAction");
          goto LABEL_90;
        case 11:
          v8 = CFSTR("AppPause");
          goto LABEL_90;
        case 12:
          v8 = CFSTR("AppResume");
          goto LABEL_90;
        case 13:
          v8 = CFSTR("AdRedirectOK");
          goto LABEL_90;
        case 14:
          v8 = CFSTR("AdRedirectCancel");
          goto LABEL_90;
        case 15:
          v8 = CFSTR("AdBuyOK");
          goto LABEL_90;
        case 16:
          v8 = CFSTR("AdBuyCancel");
          goto LABEL_90;
        case 17:
          v8 = CFSTR("WallpaperSetOK");
          goto LABEL_90;
        case 18:
          v8 = CFSTR("WallpaperSetCancel");
          goto LABEL_90;
        case 19:
          v8 = CFSTR("CalendarEventCreateOK");
          goto LABEL_90;
        case 20:
          v8 = CFSTR("CalendarEventCreateCancel");
          goto LABEL_90;
        case 21:
          v8 = CFSTR("EmailSendOK");
          goto LABEL_90;
        case 22:
          v8 = CFSTR("EmailSendCancel");
          goto LABEL_90;
        case 23:
          v8 = CFSTR("SMSSendOK");
          goto LABEL_90;
        case 24:
          v8 = CFSTR("SMSSendCancel");
          goto LABEL_90;
        case 25:
          v8 = CFSTR("AdSheetCallOK");
          goto LABEL_90;
        case 26:
          v8 = CFSTR("AdSheetCallCancel");
          goto LABEL_90;
        case 27:
          v8 = CFSTR("AdInterstitialDidAppear");
          goto LABEL_90;
        case 28:
          v8 = CFSTR("AdInterstitialDidDisappear");
          goto LABEL_90;
        case 29:
          v8 = CFSTR("AdInterstitialWasDismissed");
          goto LABEL_90;
        case 30:
          v8 = CFSTR("AdInterstitialWasRemovedFromView");
          goto LABEL_90;
        case 31:
          v8 = CFSTR("AdContactsEntryCreated");
          goto LABEL_90;
        case 32:
          v8 = CFSTR("AdContactsEntryCanceled");
          goto LABEL_90;
        case 33:
          v8 = CFSTR("AdIBooksPDFAdded");
          goto LABEL_90;
        case 34:
          v8 = CFSTR("AdIBooksPDFCanceled");
          goto LABEL_90;
        case 35:
          v8 = CFSTR("AdCameraPictureCaptured");
          goto LABEL_90;
        case 36:
          v8 = CFSTR("AdCameraPictureCanceled");
          goto LABEL_90;
        case 38:
          v8 = CFSTR("AdSheetClosedWithClientBackgrounded");
          goto LABEL_90;
        case 42:
          v8 = CFSTR("AdSheetClosedWithAutoDismiss");
          goto LABEL_90;
        default:
          if (eventType == 200)
          {
            v8 = CFSTR("RingtoneDownloadOK");
          }
          else
          {
            if (eventType != 201)
              goto LABEL_53;
            v8 = CFSTR("RingtoneDownloadCancel");
          }
          break;
      }
      goto LABEL_90;
    }
    if (eventType > 700)
    {
      if (eventType > 899)
      {
        switch(eventType)
        {
          case 900:
            v8 = CFSTR("PrivacyAdMarkWasTapped");
            break;
          case 901:
            v8 = CFSTR("PrivacyAdTransparencyDidAppear");
            break;
          case 902:
            v8 = CFSTR("PrivacyAdTransparencyDidRenderTransparency");
            break;
          case 903:
            v8 = CFSTR("PrivacyAdTransparencyDidDisappear");
            break;
          case 904:
            v8 = CFSTR("PrivacyAdTransparencyDidLinkOut");
            break;
          case 905:
            v8 = CFSTR("AdCreativeDidUnload");
            break;
          case 906:
            v8 = CFSTR("TapGestureTimerDidExpireBeforePrimaryActionWasInvoked");
            break;
          case 907:
            v8 = CFSTR("NavigationActionBlockedDueToAccidentalTap");
            break;
          case 908:
            v8 = CFSTR("CarouselFinished");
            break;
          case 909:
            v8 = CFSTR("TimeSpent");
            break;
          default:
            goto LABEL_53;
        }
        goto LABEL_90;
      }
      switch(eventType)
      {
        case 701:
          v8 = CFSTR("ReminderCreateCancel");
          goto LABEL_90;
        case 800:
          v8 = CFSTR("PreRollSkip");
          goto LABEL_90;
        case 801:
          v8 = CFSTR("CreativeUnloadedWithInvalidSize");
LABEL_90:
          objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("eventType"));

          goto LABEL_91;
      }
    }
    else
    {
      if (eventType <= 499)
      {
        switch(eventType)
        {
          case 400:
            v8 = CFSTR("VisibleContentsCaptureOK");
            break;
          case 401:
            v8 = CFSTR("VisibleContentsCaptureCancel");
            break;
          case 402:
            v8 = CFSTR("VisibleContentsSaveToPhotosOK");
            break;
          case 403:
            v8 = CFSTR("VisibleContentsSaveToPhotosCancel");
            break;
          default:
            if (eventType == 300)
            {
              v8 = CFSTR("InAdWebViewOpened");
            }
            else
            {
              if (eventType != 301)
                goto LABEL_53;
              v8 = CFSTR("InAdWebViewClosed");
            }
            break;
        }
        goto LABEL_90;
      }
      if (eventType <= 599)
      {
        switch(eventType)
        {
          case 500:
            v8 = CFSTR("SaveImageToPhotosOK");
            break;
          case 501:
            v8 = CFSTR("SaveImageToPhotosCancel");
            break;
          case 502:
            v8 = CFSTR("SaveVideoToPhotosOK");
            break;
          case 503:
            v8 = CFSTR("SaveVideoToPhotosCancel");
            break;
          default:
            goto LABEL_53;
        }
        goto LABEL_90;
      }
      if (eventType <= 601)
      {
        if (eventType == 600)
          v8 = CFSTR("AdSheetClosedByPrivilegedAd");
        else
          v8 = CFSTR("AdSheetClosedWithPrimaryURLFailure");
        goto LABEL_90;
      }
      if (eventType == 602)
      {
        v8 = CFSTR("AdSheetClosedWithProductPageLoadFailure");
        goto LABEL_90;
      }
      if (eventType == 700)
      {
        v8 = CFSTR("ReminderCreateOK");
        goto LABEL_90;
      }
    }
LABEL_53:
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_eventType));
    goto LABEL_90;
  }
LABEL_91:
  clickLocation = self->_clickLocation;
  if (clickLocation)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[APPBClickLocation dictionaryRepresentation](clickLocation, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("clickLocation"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(float *)&v4 = self->_actionableDuration;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4));
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("actionableDuration"));

  }
  bannerCustomMetadata = self->_bannerCustomMetadata;
  if (bannerCustomMetadata)
    objc_msgSend(v3, "setObject:forKey:", bannerCustomMetadata, CFSTR("bannerCustomMetadata"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_requestCount));
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("requestCount"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return APPBLogSysEventRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  APPBLogMetaData *metaData;
  APPBClickLocation *clickLocation;
  NSString *bannerCustomMetadata;
  id v8;

  v4 = a3;
  metaData = self->_metaData;
  v8 = v4;
  if (metaData)
  {
    PBDataWriterWriteSubmessage(v4, metaData, 1);
    v4 = v8;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field(v8, self->_eventType, 2);
    v4 = v8;
  }
  clickLocation = self->_clickLocation;
  if (clickLocation)
  {
    PBDataWriterWriteSubmessage(v8, clickLocation, 3);
    v4 = v8;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteFloatField(v8, 4, self->_actionableDuration);
    v4 = v8;
  }
  bannerCustomMetadata = self->_bannerCustomMetadata;
  if (bannerCustomMetadata)
  {
    PBDataWriterWriteStringField(v8, bannerCustomMetadata, 5);
    v4 = v8;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt32Field(v8, self->_requestCount, 6);
    v4 = v8;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_metaData)
  {
    objc_msgSend(v4, "setMetaData:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_eventType;
    *((_BYTE *)v4 + 52) |= 2u;
  }
  if (self->_clickLocation)
  {
    objc_msgSend(v5, "setClickLocation:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 2) = LODWORD(self->_actionableDuration);
    *((_BYTE *)v4 + 52) |= 1u;
  }
  if (self->_bannerCustomMetadata)
  {
    objc_msgSend(v5, "setBannerCustomMetadata:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v4 + 12) = self->_requestCount;
    *((_BYTE *)v4 + 52) |= 4u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[APPBLogMetaData copyWithZone:](self->_metaData, "copyWithZone:", a3);
  v7 = (void *)v5[5];
  v5[5] = v6;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v5 + 8) = self->_eventType;
    *((_BYTE *)v5 + 52) |= 2u;
  }
  v8 = -[APPBClickLocation copyWithZone:](self->_clickLocation, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v5 + 2) = LODWORD(self->_actionableDuration);
    *((_BYTE *)v5 + 52) |= 1u;
  }
  v10 = -[NSString copyWithZone:](self->_bannerCustomMetadata, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v5 + 12) = self->_requestCount;
    *((_BYTE *)v5 + 52) |= 4u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  APPBLogMetaData *metaData;
  char has;
  APPBClickLocation *clickLocation;
  NSString *bannerCustomMetadata;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_24;
  metaData = self->_metaData;
  if ((unint64_t)metaData | *((_QWORD *)v4 + 5))
  {
    if (!-[APPBLogMetaData isEqual:](metaData, "isEqual:"))
      goto LABEL_24;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) == 0 || self->_eventType != *((_DWORD *)v4 + 8))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 52) & 2) != 0)
  {
    goto LABEL_24;
  }
  clickLocation = self->_clickLocation;
  if ((unint64_t)clickLocation | *((_QWORD *)v4 + 3))
  {
    if (!-[APPBClickLocation isEqual:](clickLocation, "isEqual:"))
      goto LABEL_24;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_actionableDuration != *((float *)v4 + 2))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    goto LABEL_24;
  }
  bannerCustomMetadata = self->_bannerCustomMetadata;
  if ((unint64_t)bannerCustomMetadata | *((_QWORD *)v4 + 2))
  {
    if (-[NSString isEqual:](bannerCustomMetadata, "isEqual:"))
    {
      has = (char)self->_has;
      goto LABEL_20;
    }
LABEL_24:
    v9 = 0;
    goto LABEL_25;
  }
LABEL_20:
  v9 = (*((_BYTE *)v4 + 52) & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 4) == 0 || self->_requestCount != *((_DWORD *)v4 + 12))
      goto LABEL_24;
    v9 = 1;
  }
LABEL_25:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  float actionableDuration;
  float v8;
  float v9;
  float v10;
  NSUInteger v11;
  uint64_t v12;

  v3 = -[APPBLogMetaData hash](self->_metaData, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v4 = 2654435761 * self->_eventType;
  else
    v4 = 0;
  v5 = -[APPBClickLocation hash](self->_clickLocation, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    actionableDuration = self->_actionableDuration;
    v8 = -actionableDuration;
    if (actionableDuration >= 0.0)
      v8 = self->_actionableDuration;
    v9 = floorf(v8 + 0.5);
    v10 = (float)(v8 - v9) * 1.8447e19;
    v6 = 2654435761u * (unint64_t)fmodf(v9, 1.8447e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v6 += (unint64_t)v10;
    }
    else
    {
      v6 -= (unint64_t)fabsf(v10);
    }
  }
  else
  {
    v6 = 0;
  }
  v11 = -[NSString hash](self->_bannerCustomMetadata, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v12 = 2654435761 * self->_requestCount;
  else
    v12 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  APPBLogMetaData *metaData;
  uint64_t v6;
  APPBClickLocation *clickLocation;
  uint64_t v8;
  id v9;

  v4 = a3;
  metaData = self->_metaData;
  v6 = *((_QWORD *)v4 + 5);
  v9 = v4;
  if (metaData)
  {
    if (!v6)
      goto LABEL_7;
    -[APPBLogMetaData mergeFrom:](metaData, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[APPBLogSysEventRequest setMetaData:](self, "setMetaData:");
  }
  v4 = v9;
LABEL_7:
  if ((*((_BYTE *)v4 + 52) & 2) != 0)
  {
    self->_eventType = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 2u;
  }
  clickLocation = self->_clickLocation;
  v8 = *((_QWORD *)v4 + 3);
  if (clickLocation)
  {
    if (!v8)
      goto LABEL_15;
    -[APPBClickLocation mergeFrom:](clickLocation, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_15;
    -[APPBLogSysEventRequest setClickLocation:](self, "setClickLocation:");
  }
  v4 = v9;
LABEL_15:
  if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    self->_actionableDuration = *((float *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[APPBLogSysEventRequest setBannerCustomMetadata:](self, "setBannerCustomMetadata:");
    v4 = v9;
  }
  if ((*((_BYTE *)v4 + 52) & 4) != 0)
  {
    self->_requestCount = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 4u;
  }

}

- (APPBLogMetaData)metaData
{
  return self->_metaData;
}

- (void)setMetaData:(id)a3
{
  objc_storeStrong((id *)&self->_metaData, a3);
}

- (APPBClickLocation)clickLocation
{
  return self->_clickLocation;
}

- (void)setClickLocation:(id)a3
{
  objc_storeStrong((id *)&self->_clickLocation, a3);
}

- (float)actionableDuration
{
  return self->_actionableDuration;
}

- (NSString)bannerCustomMetadata
{
  return self->_bannerCustomMetadata;
}

- (void)setBannerCustomMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_bannerCustomMetadata, a3);
}

- (int)requestCount
{
  return self->_requestCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_clickLocation, 0);
  objc_storeStrong((id *)&self->_bannerCustomMetadata, 0);
}

@end
