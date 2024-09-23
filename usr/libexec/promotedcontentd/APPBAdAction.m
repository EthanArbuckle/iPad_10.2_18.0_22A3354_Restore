@implementation APPBAdAction

- (id)actionAsString:(int)a3
{
  void *v3;

  if (a3 < 0xE && ((0x3D07u >> a3) & 1) != 0)
    v3 = *(&off_100214EA0 + a3);
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  return v3;
}

- (int)StringAsAction:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Web")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Storyboard")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("iTunesStore")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WebView")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("App")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MRAID")) & 1) != 0)
  {
    v4 = 12;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("WebVideo")))
  {
    v4 = 13;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasActionURL
{
  return self->_actionURL != 0;
}

- (BOOL)hasActionWebArchiveURL
{
  return self->_actionWebArchiveURL != 0;
}

- (void)clearParameters
{
  -[NSMutableArray removeAllObjects](self->_parameters, "removeAllObjects");
}

- (void)addParameters:(id)a3
{
  id v4;
  NSMutableArray *parameters;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  parameters = self->_parameters;
  v8 = v4;
  if (!parameters)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_parameters;
    self->_parameters = v6;

    v4 = v8;
    parameters = self->_parameters;
  }
  -[NSMutableArray addObject:](parameters, "addObject:", v4);

}

- (unint64_t)parametersCount
{
  return (unint64_t)-[NSMutableArray count](self->_parameters, "count");
}

- (id)parametersAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_parameters, "objectAtIndex:", a3);
}

+ (Class)parametersType
{
  return (Class)objc_opt_class(APPBParameter, a2);
}

- (int)transitionType
{
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    return self->_transitionType;
  else
    return 1;
}

- (void)setTransitionType:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_transitionType = a3;
}

- (void)setHasTransitionType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasTransitionType
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)transitionTypeAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("Slide");
  if (a3 == 2)
    v3 = CFSTR("Fade");
  else
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  return v3;
}

- (int)StringAsTransitionType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Slide")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("Fade")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (void)setSuppressesPermissionToExitDialog:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_suppressesPermissionToExitDialog = a3;
}

- (void)setHasSuppressesPermissionToExitDialog:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasSuppressesPermissionToExitDialog
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (BOOL)hasTitleForExitDialog
{
  return self->_titleForExitDialog != 0;
}

- (BOOL)hasMessageForExitDialog
{
  return self->_messageForExitDialog != 0;
}

- (BOOL)hasCancelLabelForExitDialog
{
  return self->_cancelLabelForExitDialog != 0;
}

- (BOOL)hasContinueLabelForExitDialog
{
  return self->_continueLabelForExitDialog != 0;
}

- (void)setConfirmedClickTimeInterval:(float)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_confirmedClickTimeInterval = a3;
}

- (void)setHasConfirmedClickTimeInterval:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasConfirmedClickTimeInterval
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setLoadNewImpressionOnActionComplete:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_loadNewImpressionOnActionComplete = a3;
}

- (void)setHasLoadNewImpressionOnActionComplete:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasLoadNewImpressionOnActionComplete
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setBackgroundColor:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_backgroundColor = a3;
}

- (void)setHasBackgroundColor:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasBackgroundColor
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setScrolling:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_scrolling = a3;
}

- (void)setHasScrolling:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasScrolling
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)clearStoryboardSizes
{
  -[NSMutableArray removeAllObjects](self->_storyboardSizes, "removeAllObjects");
}

- (void)addStoryboardSizes:(id)a3
{
  id v4;
  NSMutableArray *storyboardSizes;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  storyboardSizes = self->_storyboardSizes;
  v8 = v4;
  if (!storyboardSizes)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_storyboardSizes;
    self->_storyboardSizes = v6;

    v4 = v8;
    storyboardSizes = self->_storyboardSizes;
  }
  -[NSMutableArray addObject:](storyboardSizes, "addObject:", v4);

}

- (unint64_t)storyboardSizesCount
{
  return (unint64_t)-[NSMutableArray count](self->_storyboardSizes, "count");
}

- (id)storyboardSizesAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_storyboardSizes, "objectAtIndex:", a3);
}

+ (Class)storyboardSizesType
{
  return (Class)objc_opt_class(APPBAdSize, a2);
}

- (void)setLetterboxStoryboardColor:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_letterboxStoryboardColor = a3;
}

- (void)setHasLetterboxStoryboardColor:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasLetterboxStoryboardColor
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (int)storyboardPresentationOrientations
{
  if ((*(_WORD *)&self->_has & 0x40) != 0)
    return self->_storyboardPresentationOrientations;
  else
    return 0;
}

- (void)setStoryboardPresentationOrientations:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_storyboardPresentationOrientations = a3;
}

- (void)setHasStoryboardPresentationOrientations:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasStoryboardPresentationOrientations
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)storyboardPresentationOrientationsAsString:(int)a3
{
  if (a3 >= 3)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_100214F10 + a3);
}

- (int)StringAsStoryboardPresentationOrientations:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Portrait")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Landscape")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Any")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)storyboardSupportedOrientations
{
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    return self->_storyboardSupportedOrientations;
  else
    return 0;
}

- (void)setStoryboardSupportedOrientations:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_storyboardSupportedOrientations = a3;
}

- (void)setHasStoryboardSupportedOrientations:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasStoryboardSupportedOrientations
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)storyboardSupportedOrientationsAsString:(int)a3
{
  if (a3 >= 3)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_100214F10 + a3);
}

- (int)StringAsStoryboardSupportedOrientations:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Portrait")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Landscape")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Any")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setAllowSelfDismissal:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_allowSelfDismissal = a3;
}

- (void)setHasAllowSelfDismissal:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasAllowSelfDismissal
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (double)autoDismissInterval
{
  if ((*(_WORD *)&self->_has & 2) != 0)
    return self->_autoDismissInterval;
  else
    return 600.0;
}

- (void)setAutoDismissInterval:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_autoDismissInterval = a3;
}

- (void)setHasAutoDismissInterval:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAutoDismissInterval
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)clearAllowedExternalDomains
{
  -[NSMutableArray removeAllObjects](self->_allowedExternalDomains, "removeAllObjects");
}

- (void)addAllowedExternalDomains:(id)a3
{
  id v4;
  NSMutableArray *allowedExternalDomains;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  allowedExternalDomains = self->_allowedExternalDomains;
  v8 = v4;
  if (!allowedExternalDomains)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_allowedExternalDomains;
    self->_allowedExternalDomains = v6;

    v4 = v8;
    allowedExternalDomains = self->_allowedExternalDomains;
  }
  -[NSMutableArray addObject:](allowedExternalDomains, "addObject:", v4);

}

- (unint64_t)allowedExternalDomainsCount
{
  return (unint64_t)-[NSMutableArray count](self->_allowedExternalDomains, "count");
}

- (id)allowedExternalDomainsAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_allowedExternalDomains, "objectAtIndex:", a3);
}

+ (Class)allowedExternalDomainsType
{
  return (Class)objc_opt_class(NSString, a2);
}

- (void)setAdManagesPurchaseFlow:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_adManagesPurchaseFlow = a3;
}

- (void)setHasAdManagesPurchaseFlow:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasAdManagesPurchaseFlow
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (BOOL)hasTitleForPurchaseDialog
{
  return self->_titleForPurchaseDialog != 0;
}

- (BOOL)hasMessageForPurchaseDialog
{
  return self->_messageForPurchaseDialog != 0;
}

- (BOOL)hasCancelButtonForPurchaseDialog
{
  return self->_cancelButtonForPurchaseDialog != 0;
}

- (BOOL)hasOkButtonForPurchaseDialog
{
  return self->_okButtonForPurchaseDialog != 0;
}

- (void)setAdamIdentifier:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_adamIdentifier = a3;
}

- (void)setHasAdamIdentifier:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAdamIdentifier
{
  return *(_WORD *)&self->_has & 1;
}

- (int)appStoreViewTemplate
{
  if ((*(_WORD *)&self->_has & 4) != 0)
    return self->_appStoreViewTemplate;
  else
    return 4780;
}

- (void)setAppStoreViewTemplate:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_appStoreViewTemplate = a3;
}

- (void)setHasAppStoreViewTemplate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAppStoreViewTemplate
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)appStoreViewTemplateAsString:(int)a3
{
  if ((a3 - 4780) >= 0xB)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_100214F28 + a3 - 4780);
}

- (int)StringAsAppStoreViewTemplate:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Text")) & 1) != 0)
  {
    v4 = 4780;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IPhonePortraitVideoImageImage")) & 1) != 0)
  {
    v4 = 4781;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IPhonePortraitImageImageImage")) & 1) != 0)
  {
    v4 = 4782;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IPhoneLandscapeVideo")) & 1) != 0)
  {
    v4 = 4783;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IPhoneLandscapeImage")) & 1) != 0)
  {
    v4 = 4784;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IPadImage")) & 1) != 0)
  {
    v4 = 4785;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IPadVideo")) & 1) != 0)
  {
    v4 = 4786;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PortraitMaterial")) & 1) != 0)
  {
    v4 = 4787;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LandscapeMaterial")) & 1) != 0)
  {
    v4 = 4788;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PortraitGrid")) & 1) != 0)
  {
    v4 = 4789;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LandscapeGrid")))
  {
    v4 = 4790;
  }
  else
  {
    v4 = 4780;
  }

  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBAdAction;
  v3 = -[APPBAdAction description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdAction dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *identifier;
  uint64_t action;
  void *v7;
  NSString *actionURL;
  NSString *actionWebArchiveURL;
  double v10;
  id v11;
  NSMutableArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  __int16 has;
  int transitionType;
  __CFString *v20;
  void *v21;
  NSString *titleForExitDialog;
  NSString *messageForExitDialog;
  NSString *cancelLabelForExitDialog;
  NSString *continueLabelForExitDialog;
  __int16 v26;
  void *v27;
  id v28;
  NSMutableArray *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *j;
  void *v34;
  __int16 v35;
  void *v36;
  NSMutableArray *allowedExternalDomains;
  void *v38;
  NSString *titleForPurchaseDialog;
  NSString *messageForPurchaseDialog;
  NSString *cancelButtonForPurchaseDialog;
  NSString *okButtonForPurchaseDialog;
  __int16 v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t storyboardPresentationOrientations;
  void *v52;
  id v53;
  uint64_t storyboardSupportedOrientations;
  void *v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  action = self->_action;
  if (action < 0xE && ((0x3D07u >> action) & 1) != 0)
    v7 = *(&off_100214EA0 + action);
  else
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_action));
  objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("action"));

  actionURL = self->_actionURL;
  if (actionURL)
    objc_msgSend(v4, "setObject:forKey:", actionURL, CFSTR("actionURL"));
  actionWebArchiveURL = self->_actionWebArchiveURL;
  if (actionWebArchiveURL)
    objc_msgSend(v4, "setObject:forKey:", actionWebArchiveURL, CFSTR("actionWebArchiveURL"));
  if (-[NSMutableArray count](self->_parameters, "count"))
  {
    v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_parameters, "count"));
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v12 = self->_parameters;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v63 != v15)
            objc_enumerationMutation(v12);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation"));
          objc_msgSend(v11, "addObject:", v17);

        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
      }
      while (v14);
    }

    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("parameters"));
  }
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    transitionType = self->_transitionType;
    if (transitionType == 1)
    {
      v20 = CFSTR("Slide");
    }
    else if (transitionType == 2)
    {
      v20 = CFSTR("Fade");
    }
    else
    {
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_transitionType));
    }
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("transitionType"));

    has = (__int16)self->_has;
  }
  if ((has & 0x2000) != 0)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_suppressesPermissionToExitDialog));
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("suppressesPermissionToExitDialog"));

  }
  titleForExitDialog = self->_titleForExitDialog;
  if (titleForExitDialog)
    objc_msgSend(v4, "setObject:forKey:", titleForExitDialog, CFSTR("titleForExitDialog"));
  messageForExitDialog = self->_messageForExitDialog;
  if (messageForExitDialog)
    objc_msgSend(v4, "setObject:forKey:", messageForExitDialog, CFSTR("messageForExitDialog"));
  cancelLabelForExitDialog = self->_cancelLabelForExitDialog;
  if (cancelLabelForExitDialog)
    objc_msgSend(v4, "setObject:forKey:", cancelLabelForExitDialog, CFSTR("cancelLabelForExitDialog"));
  continueLabelForExitDialog = self->_continueLabelForExitDialog;
  if (continueLabelForExitDialog)
    objc_msgSend(v4, "setObject:forKey:", continueLabelForExitDialog, CFSTR("continueLabelForExitDialog"));
  v26 = (__int16)self->_has;
  if ((v26 & 0x10) != 0)
  {
    *(float *)&v10 = self->_confirmedClickTimeInterval;
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v10));
    objc_msgSend(v4, "setObject:forKey:", v47, CFSTR("confirmedClickTimeInterval"));

    v26 = (__int16)self->_has;
    if ((v26 & 0x800) == 0)
    {
LABEL_39:
      if ((v26 & 8) == 0)
        goto LABEL_40;
      goto LABEL_76;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_39;
  }
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_loadNewImpressionOnActionComplete));
  objc_msgSend(v4, "setObject:forKey:", v48, CFSTR("loadNewImpressionOnActionComplete"));

  v26 = (__int16)self->_has;
  if ((v26 & 8) == 0)
  {
LABEL_40:
    if ((v26 & 0x1000) == 0)
      goto LABEL_42;
    goto LABEL_41;
  }
LABEL_76:
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_backgroundColor));
  objc_msgSend(v4, "setObject:forKey:", v49, CFSTR("backgroundColor"));

  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_41:
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_scrolling));
    objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("scrolling"));

  }
LABEL_42:
  if (-[NSMutableArray count](self->_storyboardSizes, "count"))
  {
    v28 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_storyboardSizes, "count"));
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v29 = self->_storyboardSizes;
    v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v59;
      do
      {
        for (j = 0; j != v31; j = (char *)j + 1)
        {
          if (*(_QWORD *)v59 != v32)
            objc_enumerationMutation(v29);
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)j), "dictionaryRepresentation"));
          objc_msgSend(v28, "addObject:", v34);

        }
        v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
      }
      while (v31);
    }

    objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("storyboardSizes"));
  }
  v35 = (__int16)self->_has;
  if ((v35 & 0x20) != 0)
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_letterboxStoryboardColor));
    objc_msgSend(v4, "setObject:forKey:", v50, CFSTR("letterboxStoryboardColor"));

    v35 = (__int16)self->_has;
    if ((v35 & 0x40) == 0)
    {
LABEL_53:
      if ((v35 & 0x80) == 0)
        goto LABEL_54;
      goto LABEL_86;
    }
  }
  else if ((v35 & 0x40) == 0)
  {
    goto LABEL_53;
  }
  storyboardPresentationOrientations = self->_storyboardPresentationOrientations;
  if (storyboardPresentationOrientations >= 3)
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_storyboardPresentationOrientations));
  else
    v52 = *(&off_100214F10 + storyboardPresentationOrientations);
  objc_msgSend(v4, "setObject:forKey:", v52, CFSTR("storyboardPresentationOrientations"));

  v35 = (__int16)self->_has;
  if ((v35 & 0x80) == 0)
  {
LABEL_54:
    if ((v35 & 0x400) == 0)
      goto LABEL_55;
    goto LABEL_90;
  }
LABEL_86:
  storyboardSupportedOrientations = self->_storyboardSupportedOrientations;
  if (storyboardSupportedOrientations >= 3)
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_storyboardSupportedOrientations));
  else
    v56 = *(&off_100214F10 + storyboardSupportedOrientations);
  objc_msgSend(v4, "setObject:forKey:", v56, CFSTR("storyboardSupportedOrientations"));

  v35 = (__int16)self->_has;
  if ((v35 & 0x400) == 0)
  {
LABEL_55:
    if ((v35 & 2) == 0)
      goto LABEL_57;
    goto LABEL_56;
  }
LABEL_90:
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_allowSelfDismissal));
  objc_msgSend(v4, "setObject:forKey:", v57, CFSTR("allowSelfDismissal"));

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_56:
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_autoDismissInterval));
    objc_msgSend(v4, "setObject:forKey:", v36, CFSTR("autoDismissInterval"));

  }
LABEL_57:
  allowedExternalDomains = self->_allowedExternalDomains;
  if (allowedExternalDomains)
    objc_msgSend(v4, "setObject:forKey:", allowedExternalDomains, CFSTR("allowedExternalDomains"));
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_adManagesPurchaseFlow));
    objc_msgSend(v4, "setObject:forKey:", v38, CFSTR("adManagesPurchaseFlow"));

  }
  titleForPurchaseDialog = self->_titleForPurchaseDialog;
  if (titleForPurchaseDialog)
    objc_msgSend(v4, "setObject:forKey:", titleForPurchaseDialog, CFSTR("titleForPurchaseDialog"));
  messageForPurchaseDialog = self->_messageForPurchaseDialog;
  if (messageForPurchaseDialog)
    objc_msgSend(v4, "setObject:forKey:", messageForPurchaseDialog, CFSTR("messageForPurchaseDialog"));
  cancelButtonForPurchaseDialog = self->_cancelButtonForPurchaseDialog;
  if (cancelButtonForPurchaseDialog)
    objc_msgSend(v4, "setObject:forKey:", cancelButtonForPurchaseDialog, CFSTR("cancelButtonForPurchaseDialog"));
  okButtonForPurchaseDialog = self->_okButtonForPurchaseDialog;
  if (okButtonForPurchaseDialog)
    objc_msgSend(v4, "setObject:forKey:", okButtonForPurchaseDialog, CFSTR("okButtonForPurchaseDialog"));
  v43 = (__int16)self->_has;
  if ((v43 & 1) != 0)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_adamIdentifier));
    objc_msgSend(v4, "setObject:forKey:", v44, CFSTR("adamIdentifier"));

    v43 = (__int16)self->_has;
  }
  if ((v43 & 4) != 0)
  {
    v45 = self->_appStoreViewTemplate - 4780;
    if (v45 >= 0xB)
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_appStoreViewTemplate));
    else
      v46 = *(&off_100214F28 + v45);
    objc_msgSend(v4, "setObject:forKey:", v46, CFSTR("appStoreViewTemplate"));

  }
  v53 = v4;

  return v53;
}

- (BOOL)readFrom:(id)a3
{
  return APPBAdActionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSString *identifier;
  void *v6;
  NSString *actionURL;
  NSString *actionWebArchiveURL;
  NSMutableArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  __int16 has;
  NSString *titleForExitDialog;
  NSString *messageForExitDialog;
  NSString *cancelLabelForExitDialog;
  NSString *continueLabelForExitDialog;
  __int16 v19;
  NSMutableArray *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *j;
  __int16 v25;
  NSMutableArray *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *k;
  NSString *titleForPurchaseDialog;
  NSString *messageForPurchaseDialog;
  NSString *cancelButtonForPurchaseDialog;
  NSString *okButtonForPurchaseDialog;
  __int16 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];

  v4 = a3;
  identifier = self->_identifier;
  if (!identifier)
    sub_10017BBA4();
  v6 = v4;
  PBDataWriterWriteStringField(v4, identifier, 1);
  PBDataWriterWriteInt32Field(v6, self->_action, 10);
  actionURL = self->_actionURL;
  if (actionURL)
    PBDataWriterWriteStringField(v6, actionURL, 11);
  actionWebArchiveURL = self->_actionWebArchiveURL;
  if (actionWebArchiveURL)
    PBDataWriterWriteStringField(v6, actionWebArchiveURL, 12);
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v9 = self->_parameters;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v45 != v12)
          objc_enumerationMutation(v9);
        PBDataWriterWriteSubmessage(v6, *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i), 25);
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    }
    while (v11);
  }

  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    PBDataWriterWriteInt32Field(v6, self->_transitionType, 100);
    has = (__int16)self->_has;
  }
  if ((has & 0x2000) != 0)
    PBDataWriterWriteBOOLField(v6, self->_suppressesPermissionToExitDialog, 101);
  titleForExitDialog = self->_titleForExitDialog;
  if (titleForExitDialog)
    PBDataWriterWriteStringField(v6, titleForExitDialog, 102);
  messageForExitDialog = self->_messageForExitDialog;
  if (messageForExitDialog)
    PBDataWriterWriteStringField(v6, messageForExitDialog, 103);
  cancelLabelForExitDialog = self->_cancelLabelForExitDialog;
  if (cancelLabelForExitDialog)
    PBDataWriterWriteStringField(v6, cancelLabelForExitDialog, 104);
  continueLabelForExitDialog = self->_continueLabelForExitDialog;
  if (continueLabelForExitDialog)
    PBDataWriterWriteStringField(v6, continueLabelForExitDialog, 105);
  v19 = (__int16)self->_has;
  if ((v19 & 0x10) != 0)
  {
    PBDataWriterWriteFloatField(v6, 110, self->_confirmedClickTimeInterval);
    v19 = (__int16)self->_has;
    if ((v19 & 0x800) == 0)
    {
LABEL_27:
      if ((v19 & 8) == 0)
        goto LABEL_28;
      goto LABEL_67;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_27;
  }
  PBDataWriterWriteBOOLField(v6, self->_loadNewImpressionOnActionComplete, 120);
  v19 = (__int16)self->_has;
  if ((v19 & 8) == 0)
  {
LABEL_28:
    if ((v19 & 0x1000) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_67:
  PBDataWriterWriteFixed32Field(v6, self->_backgroundColor, 200);
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
LABEL_29:
    PBDataWriterWriteBOOLField(v6, self->_scrolling, 201);
LABEL_30:
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v20 = self->_storyboardSizes;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v41;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(_QWORD *)v41 != v23)
          objc_enumerationMutation(v20);
        PBDataWriterWriteSubmessage(v6, *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)j), 202);
      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    }
    while (v22);
  }

  v25 = (__int16)self->_has;
  if ((v25 & 0x20) != 0)
  {
    PBDataWriterWriteFixed32Field(v6, self->_letterboxStoryboardColor, 203);
    v25 = (__int16)self->_has;
    if ((v25 & 0x40) == 0)
    {
LABEL_39:
      if ((v25 & 0x80) == 0)
        goto LABEL_40;
      goto LABEL_71;
    }
  }
  else if ((v25 & 0x40) == 0)
  {
    goto LABEL_39;
  }
  PBDataWriterWriteInt32Field(v6, self->_storyboardPresentationOrientations, 204);
  v25 = (__int16)self->_has;
  if ((v25 & 0x80) == 0)
  {
LABEL_40:
    if ((v25 & 0x400) == 0)
      goto LABEL_41;
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteInt32Field(v6, self->_storyboardSupportedOrientations, 205);
  v25 = (__int16)self->_has;
  if ((v25 & 0x400) == 0)
  {
LABEL_41:
    if ((v25 & 2) == 0)
      goto LABEL_43;
    goto LABEL_42;
  }
LABEL_72:
  PBDataWriterWriteBOOLField(v6, self->_allowSelfDismissal, 210);
  if ((*(_WORD *)&self->_has & 2) != 0)
LABEL_42:
    PBDataWriterWriteDoubleField(v6, 211, self->_autoDismissInterval);
LABEL_43:
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v26 = self->_allowedExternalDomains;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v37;
    do
    {
      for (k = 0; k != v28; k = (char *)k + 1)
      {
        if (*(_QWORD *)v37 != v29)
          objc_enumerationMutation(v26);
        PBDataWriterWriteStringField(v6, *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)k), 220);
      }
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
    }
    while (v28);
  }

  if ((*(_WORD *)&self->_has & 0x200) != 0)
    PBDataWriterWriteBOOLField(v6, self->_adManagesPurchaseFlow, 250);
  titleForPurchaseDialog = self->_titleForPurchaseDialog;
  if (titleForPurchaseDialog)
    PBDataWriterWriteStringField(v6, titleForPurchaseDialog, 251);
  messageForPurchaseDialog = self->_messageForPurchaseDialog;
  if (messageForPurchaseDialog)
    PBDataWriterWriteStringField(v6, messageForPurchaseDialog, 252);
  cancelButtonForPurchaseDialog = self->_cancelButtonForPurchaseDialog;
  if (cancelButtonForPurchaseDialog)
    PBDataWriterWriteStringField(v6, cancelButtonForPurchaseDialog, 253);
  okButtonForPurchaseDialog = self->_okButtonForPurchaseDialog;
  if (okButtonForPurchaseDialog)
    PBDataWriterWriteStringField(v6, okButtonForPurchaseDialog, 254);
  v35 = (__int16)self->_has;
  if ((v35 & 1) != 0)
  {
    PBDataWriterWriteFixed64Field(v6, self->_adamIdentifier, 300);
    v35 = (__int16)self->_has;
  }
  if ((v35 & 4) != 0)
    PBDataWriterWriteInt32Field(v6, self->_appStoreViewTemplate, 301);

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  __int16 has;
  _DWORD *v9;
  __int16 v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t j;
  void *v14;
  __int16 v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t k;
  void *v19;
  _QWORD *v20;
  __int16 v21;
  id v22;

  v22 = a3;
  objc_msgSend(v22, "setIdentifier:", self->_identifier);
  *((_DWORD *)v22 + 6) = self->_action;
  if (self->_actionURL)
    objc_msgSend(v22, "setActionURL:");
  if (self->_actionWebArchiveURL)
    objc_msgSend(v22, "setActionWebArchiveURL:");
  if (-[APPBAdAction parametersCount](self, "parametersCount"))
  {
    objc_msgSend(v22, "clearParameters");
    v4 = -[APPBAdAction parametersCount](self, "parametersCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdAction parametersAtIndex:](self, "parametersAtIndex:", i));
        objc_msgSend(v22, "addParameters:", v7);

      }
    }
  }
  has = (__int16)self->_has;
  v9 = v22;
  if ((has & 0x100) != 0)
  {
    *((_DWORD *)v22 + 46) = self->_transitionType;
    *((_WORD *)v22 + 98) |= 0x100u;
    has = (__int16)self->_has;
  }
  if ((has & 0x2000) != 0)
  {
    *((_BYTE *)v22 + 192) = self->_suppressesPermissionToExitDialog;
    *((_WORD *)v22 + 98) |= 0x2000u;
  }
  if (self->_titleForExitDialog)
  {
    objc_msgSend(v22, "setTitleForExitDialog:");
    v9 = v22;
  }
  if (self->_messageForExitDialog)
  {
    objc_msgSend(v22, "setMessageForExitDialog:");
    v9 = v22;
  }
  if (self->_cancelLabelForExitDialog)
  {
    objc_msgSend(v22, "setCancelLabelForExitDialog:");
    v9 = v22;
  }
  if (self->_continueLabelForExitDialog)
  {
    objc_msgSend(v22, "setContinueLabelForExitDialog:");
    v9 = v22;
  }
  v10 = (__int16)self->_has;
  if ((v10 & 0x10) != 0)
  {
    v9[20] = LODWORD(self->_confirmedClickTimeInterval);
    *((_WORD *)v9 + 98) |= 0x10u;
    v10 = (__int16)self->_has;
    if ((v10 & 0x800) == 0)
    {
LABEL_23:
      if ((v10 & 8) == 0)
        goto LABEL_24;
LABEL_57:
      v9[15] = self->_backgroundColor;
      *((_WORD *)v9 + 98) |= 8u;
      if ((*(_WORD *)&self->_has & 0x1000) == 0)
        goto LABEL_26;
      goto LABEL_25;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_23;
  }
  *((_BYTE *)v9 + 190) = self->_loadNewImpressionOnActionComplete;
  *((_WORD *)v9 + 98) |= 0x800u;
  v10 = (__int16)self->_has;
  if ((v10 & 8) != 0)
    goto LABEL_57;
LABEL_24:
  if ((v10 & 0x1000) != 0)
  {
LABEL_25:
    *((_BYTE *)v9 + 191) = self->_scrolling;
    *((_WORD *)v9 + 98) |= 0x1000u;
  }
LABEL_26:
  if (-[APPBAdAction storyboardSizesCount](self, "storyboardSizesCount"))
  {
    objc_msgSend(v22, "clearStoryboardSizes");
    v11 = -[APPBAdAction storyboardSizesCount](self, "storyboardSizesCount");
    if (v11)
    {
      v12 = v11;
      for (j = 0; j != v12; ++j)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdAction storyboardSizesAtIndex:](self, "storyboardSizesAtIndex:", j));
        objc_msgSend(v22, "addStoryboardSizes:", v14);

      }
    }
  }
  v15 = (__int16)self->_has;
  if ((v15 & 0x20) != 0)
  {
    *((_DWORD *)v22 + 26) = self->_letterboxStoryboardColor;
    *((_WORD *)v22 + 98) |= 0x20u;
    v15 = (__int16)self->_has;
    if ((v15 & 0x40) == 0)
    {
LABEL_32:
      if ((v15 & 0x80) == 0)
        goto LABEL_33;
      goto LABEL_61;
    }
  }
  else if ((v15 & 0x40) == 0)
  {
    goto LABEL_32;
  }
  *((_DWORD *)v22 + 36) = self->_storyboardPresentationOrientations;
  *((_WORD *)v22 + 98) |= 0x40u;
  v15 = (__int16)self->_has;
  if ((v15 & 0x80) == 0)
  {
LABEL_33:
    if ((v15 & 0x400) == 0)
      goto LABEL_34;
LABEL_62:
    *((_BYTE *)v22 + 189) = self->_allowSelfDismissal;
    *((_WORD *)v22 + 98) |= 0x400u;
    if ((*(_WORD *)&self->_has & 2) == 0)
      goto LABEL_36;
    goto LABEL_35;
  }
LABEL_61:
  *((_DWORD *)v22 + 40) = self->_storyboardSupportedOrientations;
  *((_WORD *)v22 + 98) |= 0x80u;
  v15 = (__int16)self->_has;
  if ((v15 & 0x400) != 0)
    goto LABEL_62;
LABEL_34:
  if ((v15 & 2) != 0)
  {
LABEL_35:
    *((_QWORD *)v22 + 2) = *(_QWORD *)&self->_autoDismissInterval;
    *((_WORD *)v22 + 98) |= 2u;
  }
LABEL_36:
  if (-[APPBAdAction allowedExternalDomainsCount](self, "allowedExternalDomainsCount"))
  {
    objc_msgSend(v22, "clearAllowedExternalDomains");
    v16 = -[APPBAdAction allowedExternalDomainsCount](self, "allowedExternalDomainsCount");
    if (v16)
    {
      v17 = v16;
      for (k = 0; k != v17; ++k)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdAction allowedExternalDomainsAtIndex:](self, "allowedExternalDomainsAtIndex:", k));
        objc_msgSend(v22, "addAllowedExternalDomains:", v19);

      }
    }
  }
  v20 = v22;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    *((_BYTE *)v22 + 188) = self->_adManagesPurchaseFlow;
    *((_WORD *)v22 + 98) |= 0x200u;
  }
  if (self->_titleForPurchaseDialog)
  {
    objc_msgSend(v22, "setTitleForPurchaseDialog:");
    v20 = v22;
  }
  if (self->_messageForPurchaseDialog)
  {
    objc_msgSend(v22, "setMessageForPurchaseDialog:");
    v20 = v22;
  }
  if (self->_cancelButtonForPurchaseDialog)
  {
    objc_msgSend(v22, "setCancelButtonForPurchaseDialog:");
    v20 = v22;
  }
  if (self->_okButtonForPurchaseDialog)
  {
    objc_msgSend(v22, "setOkButtonForPurchaseDialog:");
    v20 = v22;
  }
  v21 = (__int16)self->_has;
  if ((v21 & 1) != 0)
  {
    v20[1] = self->_adamIdentifier;
    *((_WORD *)v20 + 98) |= 1u;
    v21 = (__int16)self->_has;
  }
  if ((v21 & 4) != 0)
  {
    *((_DWORD *)v20 + 14) = self->_appStoreViewTemplate;
    *((_WORD *)v20 + 98) |= 4u;
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
  NSMutableArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  id v17;
  __int16 has;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  __int16 v27;
  NSMutableArray *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *j;
  id v33;
  __int16 v34;
  NSMutableArray *v35;
  id v36;
  id v37;
  uint64_t v38;
  void *k;
  id v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  __int16 v49;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = (void *)v5[12];
  v5[12] = v6;

  *((_DWORD *)v5 + 6) = self->_action;
  v8 = -[NSString copyWithZone:](self->_actionURL, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  v10 = -[NSString copyWithZone:](self->_actionWebArchiveURL, "copyWithZone:", a3);
  v11 = (void *)v5[5];
  v5[5] = v10;

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v12 = self->_parameters;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v60 != v15)
          objc_enumerationMutation(v12);
        v17 = objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)i), "copyWithZone:", a3);
        objc_msgSend(v5, "addParameters:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
    }
    while (v14);
  }

  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *((_DWORD *)v5 + 46) = self->_transitionType;
    *((_WORD *)v5 + 98) |= 0x100u;
    has = (__int16)self->_has;
  }
  if ((has & 0x2000) != 0)
  {
    *((_BYTE *)v5 + 192) = self->_suppressesPermissionToExitDialog;
    *((_WORD *)v5 + 98) |= 0x2000u;
  }
  v19 = -[NSString copyWithZone:](self->_titleForExitDialog, "copyWithZone:", a3);
  v20 = (void *)v5[21];
  v5[21] = v19;

  v21 = -[NSString copyWithZone:](self->_messageForExitDialog, "copyWithZone:", a3);
  v22 = (void *)v5[14];
  v5[14] = v21;

  v23 = -[NSString copyWithZone:](self->_cancelLabelForExitDialog, "copyWithZone:", a3);
  v24 = (void *)v5[9];
  v5[9] = v23;

  v25 = -[NSString copyWithZone:](self->_continueLabelForExitDialog, "copyWithZone:", a3);
  v26 = (void *)v5[11];
  v5[11] = v25;

  v27 = (__int16)self->_has;
  if ((v27 & 0x10) != 0)
  {
    *((_DWORD *)v5 + 20) = LODWORD(self->_confirmedClickTimeInterval);
    *((_WORD *)v5 + 98) |= 0x10u;
    v27 = (__int16)self->_has;
    if ((v27 & 0x800) == 0)
    {
LABEL_14:
      if ((v27 & 8) == 0)
        goto LABEL_15;
      goto LABEL_46;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_14;
  }
  *((_BYTE *)v5 + 190) = self->_loadNewImpressionOnActionComplete;
  *((_WORD *)v5 + 98) |= 0x800u;
  v27 = (__int16)self->_has;
  if ((v27 & 8) == 0)
  {
LABEL_15:
    if ((v27 & 0x1000) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_46:
  *((_DWORD *)v5 + 15) = self->_backgroundColor;
  *((_WORD *)v5 + 98) |= 8u;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_16:
    *((_BYTE *)v5 + 191) = self->_scrolling;
    *((_WORD *)v5 + 98) |= 0x1000u;
  }
LABEL_17:
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v28 = self->_storyboardSizes;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v56;
    do
    {
      for (j = 0; j != v30; j = (char *)j + 1)
      {
        if (*(_QWORD *)v56 != v31)
          objc_enumerationMutation(v28);
        v33 = objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)j), "copyWithZone:", a3);
        objc_msgSend(v5, "addStoryboardSizes:", v33);

      }
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
    }
    while (v30);
  }

  v34 = (__int16)self->_has;
  if ((v34 & 0x20) != 0)
  {
    *((_DWORD *)v5 + 26) = self->_letterboxStoryboardColor;
    *((_WORD *)v5 + 98) |= 0x20u;
    v34 = (__int16)self->_has;
    if ((v34 & 0x40) == 0)
    {
LABEL_26:
      if ((v34 & 0x80) == 0)
        goto LABEL_27;
      goto LABEL_50;
    }
  }
  else if ((v34 & 0x40) == 0)
  {
    goto LABEL_26;
  }
  *((_DWORD *)v5 + 36) = self->_storyboardPresentationOrientations;
  *((_WORD *)v5 + 98) |= 0x40u;
  v34 = (__int16)self->_has;
  if ((v34 & 0x80) == 0)
  {
LABEL_27:
    if ((v34 & 0x400) == 0)
      goto LABEL_28;
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)v5 + 40) = self->_storyboardSupportedOrientations;
  *((_WORD *)v5 + 98) |= 0x80u;
  v34 = (__int16)self->_has;
  if ((v34 & 0x400) == 0)
  {
LABEL_28:
    if ((v34 & 2) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_51:
  *((_BYTE *)v5 + 189) = self->_allowSelfDismissal;
  *((_WORD *)v5 + 98) |= 0x400u;
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_29:
    v5[2] = *(_QWORD *)&self->_autoDismissInterval;
    *((_WORD *)v5 + 98) |= 2u;
  }
LABEL_30:
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v35 = self->_allowedExternalDomains;
  v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v52;
    do
    {
      for (k = 0; k != v37; k = (char *)k + 1)
      {
        if (*(_QWORD *)v52 != v38)
          objc_enumerationMutation(v35);
        v40 = objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)k), "copyWithZone:", a3, (_QWORD)v51);
        objc_msgSend(v5, "addAllowedExternalDomains:", v40);

      }
      v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
    }
    while (v37);
  }

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    *((_BYTE *)v5 + 188) = self->_adManagesPurchaseFlow;
    *((_WORD *)v5 + 98) |= 0x200u;
  }
  v41 = -[NSString copyWithZone:](self->_titleForPurchaseDialog, "copyWithZone:", a3, (_QWORD)v51);
  v42 = (void *)v5[22];
  v5[22] = v41;

  v43 = -[NSString copyWithZone:](self->_messageForPurchaseDialog, "copyWithZone:", a3);
  v44 = (void *)v5[15];
  v5[15] = v43;

  v45 = -[NSString copyWithZone:](self->_cancelButtonForPurchaseDialog, "copyWithZone:", a3);
  v46 = (void *)v5[8];
  v5[8] = v45;

  v47 = -[NSString copyWithZone:](self->_okButtonForPurchaseDialog, "copyWithZone:", a3);
  v48 = (void *)v5[16];
  v5[16] = v47;

  v49 = (__int16)self->_has;
  if ((v49 & 1) != 0)
  {
    v5[1] = self->_adamIdentifier;
    *((_WORD *)v5 + 98) |= 1u;
    v49 = (__int16)self->_has;
  }
  if ((v49 & 4) != 0)
  {
    *((_DWORD *)v5 + 14) = self->_appStoreViewTemplate;
    *((_WORD *)v5 + 98) |= 4u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  NSString *actionURL;
  NSString *actionWebArchiveURL;
  NSMutableArray *parameters;
  NSString *titleForExitDialog;
  NSString *messageForExitDialog;
  NSString *cancelLabelForExitDialog;
  NSString *continueLabelForExitDialog;
  __int16 has;
  __int16 v14;
  NSMutableArray *storyboardSizes;
  __int16 v16;
  NSMutableArray *allowedExternalDomains;
  NSString *titleForPurchaseDialog;
  NSString *messageForPurchaseDialog;
  NSString *cancelButtonForPurchaseDialog;
  NSString *okButtonForPurchaseDialog;
  __int16 v22;
  __int16 v23;
  BOOL v24;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_118;
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_118;
  }
  if (self->_action != *((_DWORD *)v4 + 6))
    goto LABEL_118;
  actionURL = self->_actionURL;
  if ((unint64_t)actionURL | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](actionURL, "isEqual:"))
      goto LABEL_118;
  }
  actionWebArchiveURL = self->_actionWebArchiveURL;
  if ((unint64_t)actionWebArchiveURL | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](actionWebArchiveURL, "isEqual:"))
      goto LABEL_118;
  }
  parameters = self->_parameters;
  if ((unint64_t)parameters | *((_QWORD *)v4 + 17))
  {
    if (!-[NSMutableArray isEqual:](parameters, "isEqual:"))
      goto LABEL_118;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 98) & 0x100) == 0 || self->_transitionType != *((_DWORD *)v4 + 46))
      goto LABEL_118;
  }
  else if ((*((_WORD *)v4 + 98) & 0x100) != 0)
  {
    goto LABEL_118;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 98) & 0x2000) == 0)
      goto LABEL_118;
    if (self->_suppressesPermissionToExitDialog)
    {
      if (!*((_BYTE *)v4 + 192))
        goto LABEL_118;
    }
    else if (*((_BYTE *)v4 + 192))
    {
      goto LABEL_118;
    }
  }
  else if ((*((_WORD *)v4 + 98) & 0x2000) != 0)
  {
    goto LABEL_118;
  }
  titleForExitDialog = self->_titleForExitDialog;
  if ((unint64_t)titleForExitDialog | *((_QWORD *)v4 + 21)
    && !-[NSString isEqual:](titleForExitDialog, "isEqual:"))
  {
    goto LABEL_118;
  }
  messageForExitDialog = self->_messageForExitDialog;
  if ((unint64_t)messageForExitDialog | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](messageForExitDialog, "isEqual:"))
      goto LABEL_118;
  }
  cancelLabelForExitDialog = self->_cancelLabelForExitDialog;
  if ((unint64_t)cancelLabelForExitDialog | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](cancelLabelForExitDialog, "isEqual:"))
      goto LABEL_118;
  }
  continueLabelForExitDialog = self->_continueLabelForExitDialog;
  if ((unint64_t)continueLabelForExitDialog | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](continueLabelForExitDialog, "isEqual:"))
      goto LABEL_118;
  }
  has = (__int16)self->_has;
  v14 = *((_WORD *)v4 + 98);
  if ((has & 0x10) != 0)
  {
    if ((v14 & 0x10) == 0 || self->_confirmedClickTimeInterval != *((float *)v4 + 20))
      goto LABEL_118;
  }
  else if ((v14 & 0x10) != 0)
  {
    goto LABEL_118;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 98) & 0x800) == 0)
      goto LABEL_118;
    if (self->_loadNewImpressionOnActionComplete)
    {
      if (!*((_BYTE *)v4 + 190))
        goto LABEL_118;
    }
    else if (*((_BYTE *)v4 + 190))
    {
      goto LABEL_118;
    }
  }
  else if ((*((_WORD *)v4 + 98) & 0x800) != 0)
  {
    goto LABEL_118;
  }
  if ((has & 8) != 0)
  {
    if ((v14 & 8) == 0 || self->_backgroundColor != *((_DWORD *)v4 + 15))
      goto LABEL_118;
  }
  else if ((v14 & 8) != 0)
  {
    goto LABEL_118;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 98) & 0x1000) == 0)
      goto LABEL_118;
    if (self->_scrolling)
    {
      if (!*((_BYTE *)v4 + 191))
        goto LABEL_118;
    }
    else if (*((_BYTE *)v4 + 191))
    {
      goto LABEL_118;
    }
  }
  else if ((*((_WORD *)v4 + 98) & 0x1000) != 0)
  {
    goto LABEL_118;
  }
  storyboardSizes = self->_storyboardSizes;
  if ((unint64_t)storyboardSizes | *((_QWORD *)v4 + 19))
  {
    if (!-[NSMutableArray isEqual:](storyboardSizes, "isEqual:"))
      goto LABEL_118;
    has = (__int16)self->_has;
  }
  v16 = *((_WORD *)v4 + 98);
  if ((has & 0x20) != 0)
  {
    if ((v16 & 0x20) == 0 || self->_letterboxStoryboardColor != *((_DWORD *)v4 + 26))
      goto LABEL_118;
  }
  else if ((v16 & 0x20) != 0)
  {
    goto LABEL_118;
  }
  if ((has & 0x40) != 0)
  {
    if ((v16 & 0x40) == 0 || self->_storyboardPresentationOrientations != *((_DWORD *)v4 + 36))
      goto LABEL_118;
  }
  else if ((v16 & 0x40) != 0)
  {
    goto LABEL_118;
  }
  if ((has & 0x80) != 0)
  {
    if ((v16 & 0x80) == 0 || self->_storyboardSupportedOrientations != *((_DWORD *)v4 + 40))
      goto LABEL_118;
  }
  else if ((v16 & 0x80) != 0)
  {
    goto LABEL_118;
  }
  if ((has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 98) & 0x400) == 0)
      goto LABEL_118;
    if (self->_allowSelfDismissal)
    {
      if (!*((_BYTE *)v4 + 189))
        goto LABEL_118;
    }
    else if (*((_BYTE *)v4 + 189))
    {
      goto LABEL_118;
    }
  }
  else if ((*((_WORD *)v4 + 98) & 0x400) != 0)
  {
    goto LABEL_118;
  }
  if ((has & 2) != 0)
  {
    if ((v16 & 2) == 0 || self->_autoDismissInterval != *((double *)v4 + 2))
      goto LABEL_118;
  }
  else if ((v16 & 2) != 0)
  {
    goto LABEL_118;
  }
  allowedExternalDomains = self->_allowedExternalDomains;
  if ((unint64_t)allowedExternalDomains | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](allowedExternalDomains, "isEqual:"))
      goto LABEL_118;
    has = (__int16)self->_has;
  }
  if ((has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 98) & 0x200) != 0)
    {
      if (self->_adManagesPurchaseFlow)
      {
        if (!*((_BYTE *)v4 + 188))
          goto LABEL_118;
        goto LABEL_100;
      }
      if (!*((_BYTE *)v4 + 188))
        goto LABEL_100;
    }
LABEL_118:
    v24 = 0;
    goto LABEL_119;
  }
  if ((*((_WORD *)v4 + 98) & 0x200) != 0)
    goto LABEL_118;
LABEL_100:
  titleForPurchaseDialog = self->_titleForPurchaseDialog;
  if ((unint64_t)titleForPurchaseDialog | *((_QWORD *)v4 + 22)
    && !-[NSString isEqual:](titleForPurchaseDialog, "isEqual:"))
  {
    goto LABEL_118;
  }
  messageForPurchaseDialog = self->_messageForPurchaseDialog;
  if ((unint64_t)messageForPurchaseDialog | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](messageForPurchaseDialog, "isEqual:"))
      goto LABEL_118;
  }
  cancelButtonForPurchaseDialog = self->_cancelButtonForPurchaseDialog;
  if ((unint64_t)cancelButtonForPurchaseDialog | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](cancelButtonForPurchaseDialog, "isEqual:"))
      goto LABEL_118;
  }
  okButtonForPurchaseDialog = self->_okButtonForPurchaseDialog;
  if ((unint64_t)okButtonForPurchaseDialog | *((_QWORD *)v4 + 16))
  {
    if (!-[NSString isEqual:](okButtonForPurchaseDialog, "isEqual:"))
      goto LABEL_118;
  }
  v22 = (__int16)self->_has;
  v23 = *((_WORD *)v4 + 98);
  if ((v22 & 1) != 0)
  {
    if ((v23 & 1) == 0 || self->_adamIdentifier != *((_QWORD *)v4 + 1))
      goto LABEL_118;
  }
  else if ((v23 & 1) != 0)
  {
    goto LABEL_118;
  }
  if ((v22 & 4) != 0)
  {
    if ((v23 & 4) == 0 || self->_appStoreViewTemplate != *((_DWORD *)v4 + 14))
      goto LABEL_118;
    v24 = 1;
  }
  else
  {
    v24 = (v23 & 4) == 0;
  }
LABEL_119:

  return v24;
}

- (unint64_t)hash
{
  NSUInteger v3;
  __int16 has;
  unint64_t v5;
  float confirmedClickTimeInterval;
  float v7;
  float v8;
  float v9;
  __int16 v10;
  uint64_t v11;
  double autoDismissInterval;
  double v13;
  long double v14;
  double v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  NSUInteger v19;
  NSUInteger v20;
  NSUInteger v21;
  NSUInteger v22;
  __int16 v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  NSUInteger v36;
  NSUInteger v37;
  NSUInteger v38;
  NSUInteger v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  NSUInteger v43;
  NSUInteger v44;
  uint64_t action;
  NSUInteger v46;

  v3 = -[NSString hash](self->_identifier, "hash");
  action = self->_action;
  v46 = v3;
  v44 = -[NSString hash](self->_actionURL, "hash");
  v43 = -[NSString hash](self->_actionWebArchiveURL, "hash");
  v42 = (unint64_t)-[NSMutableArray hash](self->_parameters, "hash");
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    v41 = 2654435761 * self->_transitionType;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
      goto LABEL_3;
  }
  else
  {
    v41 = 0;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
    {
LABEL_3:
      v40 = 2654435761 * self->_suppressesPermissionToExitDialog;
      goto LABEL_6;
    }
  }
  v40 = 0;
LABEL_6:
  v39 = -[NSString hash](self->_titleForExitDialog, "hash");
  v38 = -[NSString hash](self->_messageForExitDialog, "hash");
  v37 = -[NSString hash](self->_cancelLabelForExitDialog, "hash");
  v36 = -[NSString hash](self->_continueLabelForExitDialog, "hash");
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    confirmedClickTimeInterval = self->_confirmedClickTimeInterval;
    v7 = -confirmedClickTimeInterval;
    if (confirmedClickTimeInterval >= 0.0)
      v7 = self->_confirmedClickTimeInterval;
    v8 = floorf(v7 + 0.5);
    v9 = (float)(v7 - v8) * 1.8447e19;
    v5 = 2654435761u * (unint64_t)fmodf(v8, 1.8447e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabsf(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  if ((has & 0x800) != 0)
  {
    v34 = 2654435761 * self->_loadNewImpressionOnActionComplete;
    if ((has & 8) != 0)
      goto LABEL_16;
  }
  else
  {
    v34 = 0;
    if ((has & 8) != 0)
    {
LABEL_16:
      v33 = 2654435761 * self->_backgroundColor;
      goto LABEL_19;
    }
  }
  v33 = 0;
LABEL_19:
  v35 = v5;
  if ((has & 0x1000) != 0)
    v32 = 2654435761 * self->_scrolling;
  else
    v32 = 0;
  v31 = (unint64_t)-[NSMutableArray hash](self->_storyboardSizes, "hash");
  v10 = (__int16)self->_has;
  if ((v10 & 0x20) != 0)
  {
    v30 = 2654435761 * self->_letterboxStoryboardColor;
    if ((v10 & 0x40) != 0)
    {
LABEL_24:
      v29 = 2654435761 * self->_storyboardPresentationOrientations;
      if ((v10 & 0x80) != 0)
        goto LABEL_25;
      goto LABEL_33;
    }
  }
  else
  {
    v30 = 0;
    if ((v10 & 0x40) != 0)
      goto LABEL_24;
  }
  v29 = 0;
  if ((v10 & 0x80) != 0)
  {
LABEL_25:
    v27 = 2654435761 * self->_storyboardSupportedOrientations;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_26;
LABEL_34:
    v11 = 0;
    if ((v10 & 2) != 0)
      goto LABEL_27;
LABEL_35:
    v16 = 0;
    goto LABEL_38;
  }
LABEL_33:
  v27 = 0;
  if ((*(_WORD *)&self->_has & 0x400) == 0)
    goto LABEL_34;
LABEL_26:
  v11 = 2654435761 * self->_allowSelfDismissal;
  if ((v10 & 2) == 0)
    goto LABEL_35;
LABEL_27:
  autoDismissInterval = self->_autoDismissInterval;
  v13 = -autoDismissInterval;
  if (autoDismissInterval >= 0.0)
    v13 = self->_autoDismissInterval;
  v14 = floor(v13 + 0.5);
  v15 = (v13 - v14) * 1.84467441e19;
  v16 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
  if (v15 >= 0.0)
  {
    if (v15 > 0.0)
      v16 += (unint64_t)v15;
  }
  else
  {
    v16 -= (unint64_t)fabs(v15);
  }
LABEL_38:
  v17 = (unint64_t)-[NSMutableArray hash](self->_allowedExternalDomains, "hash", v27);
  if ((*(_WORD *)&self->_has & 0x200) != 0)
    v18 = 2654435761 * self->_adManagesPurchaseFlow;
  else
    v18 = 0;
  v19 = -[NSString hash](self->_titleForPurchaseDialog, "hash");
  v20 = -[NSString hash](self->_messageForPurchaseDialog, "hash");
  v21 = -[NSString hash](self->_cancelButtonForPurchaseDialog, "hash");
  v22 = -[NSString hash](self->_okButtonForPurchaseDialog, "hash");
  v23 = (__int16)self->_has;
  if ((v23 & 1) != 0)
  {
    v24 = 2654435761u * self->_adamIdentifier;
    if ((v23 & 4) != 0)
      goto LABEL_43;
LABEL_45:
    v25 = 0;
    return (2654435761 * action) ^ v46 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v11 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v24 ^ v25;
  }
  v24 = 0;
  if ((v23 & 4) == 0)
    goto LABEL_45;
LABEL_43:
  v25 = 2654435761 * self->_appStoreViewTemplate;
  return (2654435761 * action) ^ v46 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v11 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v24 ^ v25;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  __int16 v10;
  __int16 v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  __int16 v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *k;
  __int16 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];

  v4 = a3;
  if (*((_QWORD *)v4 + 12))
    -[APPBAdAction setIdentifier:](self, "setIdentifier:");
  self->_action = *((_DWORD *)v4 + 6);
  if (*((_QWORD *)v4 + 4))
    -[APPBAdAction setActionURL:](self, "setActionURL:");
  if (*((_QWORD *)v4 + 5))
    -[APPBAdAction setActionWebArchiveURL:](self, "setActionWebArchiveURL:");
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v5 = *((id *)v4 + 17);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v8)
          objc_enumerationMutation(v5);
        -[APPBAdAction addParameters:](self, "addParameters:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v7);
  }

  v10 = *((_WORD *)v4 + 98);
  if ((v10 & 0x100) != 0)
  {
    self->_transitionType = *((_DWORD *)v4 + 46);
    *(_WORD *)&self->_has |= 0x100u;
    v10 = *((_WORD *)v4 + 98);
  }
  if ((v10 & 0x2000) != 0)
  {
    self->_suppressesPermissionToExitDialog = *((_BYTE *)v4 + 192);
    *(_WORD *)&self->_has |= 0x2000u;
  }
  if (*((_QWORD *)v4 + 21))
    -[APPBAdAction setTitleForExitDialog:](self, "setTitleForExitDialog:");
  if (*((_QWORD *)v4 + 14))
    -[APPBAdAction setMessageForExitDialog:](self, "setMessageForExitDialog:");
  if (*((_QWORD *)v4 + 9))
    -[APPBAdAction setCancelLabelForExitDialog:](self, "setCancelLabelForExitDialog:");
  if (*((_QWORD *)v4 + 11))
    -[APPBAdAction setContinueLabelForExitDialog:](self, "setContinueLabelForExitDialog:");
  v11 = *((_WORD *)v4 + 98);
  if ((v11 & 0x10) != 0)
  {
    self->_confirmedClickTimeInterval = *((float *)v4 + 20);
    *(_WORD *)&self->_has |= 0x10u;
    v11 = *((_WORD *)v4 + 98);
    if ((v11 & 0x800) == 0)
    {
LABEL_28:
      if ((v11 & 8) == 0)
        goto LABEL_29;
      goto LABEL_68;
    }
  }
  else if ((*((_WORD *)v4 + 98) & 0x800) == 0)
  {
    goto LABEL_28;
  }
  self->_loadNewImpressionOnActionComplete = *((_BYTE *)v4 + 190);
  *(_WORD *)&self->_has |= 0x800u;
  v11 = *((_WORD *)v4 + 98);
  if ((v11 & 8) == 0)
  {
LABEL_29:
    if ((v11 & 0x1000) == 0)
      goto LABEL_31;
    goto LABEL_30;
  }
LABEL_68:
  self->_backgroundColor = *((_DWORD *)v4 + 15);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)v4 + 98) & 0x1000) != 0)
  {
LABEL_30:
    self->_scrolling = *((_BYTE *)v4 + 191);
    *(_WORD *)&self->_has |= 0x1000u;
  }
LABEL_31:
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v12 = *((id *)v4 + 19);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(v12);
        -[APPBAdAction addStoryboardSizes:](self, "addStoryboardSizes:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)j));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    }
    while (v14);
  }

  v17 = *((_WORD *)v4 + 98);
  if ((v17 & 0x20) != 0)
  {
    self->_letterboxStoryboardColor = *((_DWORD *)v4 + 26);
    *(_WORD *)&self->_has |= 0x20u;
    v17 = *((_WORD *)v4 + 98);
    if ((v17 & 0x40) == 0)
    {
LABEL_40:
      if ((v17 & 0x80) == 0)
        goto LABEL_41;
      goto LABEL_72;
    }
  }
  else if ((v17 & 0x40) == 0)
  {
    goto LABEL_40;
  }
  self->_storyboardPresentationOrientations = *((_DWORD *)v4 + 36);
  *(_WORD *)&self->_has |= 0x40u;
  v17 = *((_WORD *)v4 + 98);
  if ((v17 & 0x80) == 0)
  {
LABEL_41:
    if ((v17 & 0x400) == 0)
      goto LABEL_42;
    goto LABEL_73;
  }
LABEL_72:
  self->_storyboardSupportedOrientations = *((_DWORD *)v4 + 40);
  *(_WORD *)&self->_has |= 0x80u;
  v17 = *((_WORD *)v4 + 98);
  if ((v17 & 0x400) == 0)
  {
LABEL_42:
    if ((v17 & 2) == 0)
      goto LABEL_44;
    goto LABEL_43;
  }
LABEL_73:
  self->_allowSelfDismissal = *((_BYTE *)v4 + 189);
  *(_WORD *)&self->_has |= 0x400u;
  if ((*((_WORD *)v4 + 98) & 2) != 0)
  {
LABEL_43:
    self->_autoDismissInterval = *((double *)v4 + 2);
    *(_WORD *)&self->_has |= 2u;
  }
LABEL_44:
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v18 = *((id *)v4 + 6);
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v25;
    do
    {
      for (k = 0; k != v20; k = (char *)k + 1)
      {
        if (*(_QWORD *)v25 != v21)
          objc_enumerationMutation(v18);
        -[APPBAdAction addAllowedExternalDomains:](self, "addAllowedExternalDomains:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)k), (_QWORD)v24);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    }
    while (v20);
  }

  if ((*((_WORD *)v4 + 98) & 0x200) != 0)
  {
    self->_adManagesPurchaseFlow = *((_BYTE *)v4 + 188);
    *(_WORD *)&self->_has |= 0x200u;
  }
  if (*((_QWORD *)v4 + 22))
    -[APPBAdAction setTitleForPurchaseDialog:](self, "setTitleForPurchaseDialog:");
  if (*((_QWORD *)v4 + 15))
    -[APPBAdAction setMessageForPurchaseDialog:](self, "setMessageForPurchaseDialog:");
  if (*((_QWORD *)v4 + 8))
    -[APPBAdAction setCancelButtonForPurchaseDialog:](self, "setCancelButtonForPurchaseDialog:");
  if (*((_QWORD *)v4 + 16))
    -[APPBAdAction setOkButtonForPurchaseDialog:](self, "setOkButtonForPurchaseDialog:");
  v23 = *((_WORD *)v4 + 98);
  if ((v23 & 1) != 0)
  {
    self->_adamIdentifier = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    v23 = *((_WORD *)v4 + 98);
  }
  if ((v23 & 4) != 0)
  {
    self->_appStoreViewTemplate = *((_DWORD *)v4 + 14);
    *(_WORD *)&self->_has |= 4u;
  }

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (int)action
{
  return self->_action;
}

- (void)setAction:(int)a3
{
  self->_action = a3;
}

- (NSString)actionURL
{
  return self->_actionURL;
}

- (void)setActionURL:(id)a3
{
  objc_storeStrong((id *)&self->_actionURL, a3);
}

- (NSString)actionWebArchiveURL
{
  return self->_actionWebArchiveURL;
}

- (void)setActionWebArchiveURL:(id)a3
{
  objc_storeStrong((id *)&self->_actionWebArchiveURL, a3);
}

- (NSMutableArray)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_storeStrong((id *)&self->_parameters, a3);
}

- (BOOL)suppressesPermissionToExitDialog
{
  return self->_suppressesPermissionToExitDialog;
}

- (NSString)titleForExitDialog
{
  return self->_titleForExitDialog;
}

- (void)setTitleForExitDialog:(id)a3
{
  objc_storeStrong((id *)&self->_titleForExitDialog, a3);
}

- (NSString)messageForExitDialog
{
  return self->_messageForExitDialog;
}

- (void)setMessageForExitDialog:(id)a3
{
  objc_storeStrong((id *)&self->_messageForExitDialog, a3);
}

- (NSString)cancelLabelForExitDialog
{
  return self->_cancelLabelForExitDialog;
}

- (void)setCancelLabelForExitDialog:(id)a3
{
  objc_storeStrong((id *)&self->_cancelLabelForExitDialog, a3);
}

- (NSString)continueLabelForExitDialog
{
  return self->_continueLabelForExitDialog;
}

- (void)setContinueLabelForExitDialog:(id)a3
{
  objc_storeStrong((id *)&self->_continueLabelForExitDialog, a3);
}

- (float)confirmedClickTimeInterval
{
  return self->_confirmedClickTimeInterval;
}

- (BOOL)loadNewImpressionOnActionComplete
{
  return self->_loadNewImpressionOnActionComplete;
}

- (unsigned)backgroundColor
{
  return self->_backgroundColor;
}

- (BOOL)scrolling
{
  return self->_scrolling;
}

- (NSMutableArray)storyboardSizes
{
  return self->_storyboardSizes;
}

- (void)setStoryboardSizes:(id)a3
{
  objc_storeStrong((id *)&self->_storyboardSizes, a3);
}

- (unsigned)letterboxStoryboardColor
{
  return self->_letterboxStoryboardColor;
}

- (BOOL)allowSelfDismissal
{
  return self->_allowSelfDismissal;
}

- (NSMutableArray)allowedExternalDomains
{
  return self->_allowedExternalDomains;
}

- (void)setAllowedExternalDomains:(id)a3
{
  objc_storeStrong((id *)&self->_allowedExternalDomains, a3);
}

- (BOOL)adManagesPurchaseFlow
{
  return self->_adManagesPurchaseFlow;
}

- (NSString)titleForPurchaseDialog
{
  return self->_titleForPurchaseDialog;
}

- (void)setTitleForPurchaseDialog:(id)a3
{
  objc_storeStrong((id *)&self->_titleForPurchaseDialog, a3);
}

- (NSString)messageForPurchaseDialog
{
  return self->_messageForPurchaseDialog;
}

- (void)setMessageForPurchaseDialog:(id)a3
{
  objc_storeStrong((id *)&self->_messageForPurchaseDialog, a3);
}

- (NSString)cancelButtonForPurchaseDialog
{
  return self->_cancelButtonForPurchaseDialog;
}

- (void)setCancelButtonForPurchaseDialog:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButtonForPurchaseDialog, a3);
}

- (NSString)okButtonForPurchaseDialog
{
  return self->_okButtonForPurchaseDialog;
}

- (void)setOkButtonForPurchaseDialog:(id)a3
{
  objc_storeStrong((id *)&self->_okButtonForPurchaseDialog, a3);
}

- (unint64_t)adamIdentifier
{
  return self->_adamIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleForPurchaseDialog, 0);
  objc_storeStrong((id *)&self->_titleForExitDialog, 0);
  objc_storeStrong((id *)&self->_storyboardSizes, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_okButtonForPurchaseDialog, 0);
  objc_storeStrong((id *)&self->_messageForPurchaseDialog, 0);
  objc_storeStrong((id *)&self->_messageForExitDialog, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_continueLabelForExitDialog, 0);
  objc_storeStrong((id *)&self->_cancelLabelForExitDialog, 0);
  objc_storeStrong((id *)&self->_cancelButtonForPurchaseDialog, 0);
  objc_storeStrong((id *)&self->_allowedExternalDomains, 0);
  objc_storeStrong((id *)&self->_actionWebArchiveURL, 0);
  objc_storeStrong((id *)&self->_actionURL, 0);
}

@end
