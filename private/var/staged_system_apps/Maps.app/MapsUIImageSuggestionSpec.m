@implementation MapsUIImageSuggestionSpec

- (MapsUIImageSuggestionSpec)initWithSuggestion:(id)a3
{
  id v4;
  MapsUIImageSuggestionSpec *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  NSString *originBundleID;
  uint64_t Log;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSString *v25;
  id v27;
  objc_super v28;
  uint8_t buf[4];
  void *v30;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)MapsUIImageSuggestionSpec;
  v5 = -[MapsUIImageSuggestionSpec init](&v28, "init");
  if (v5)
  {
    -[MapsUIImageSuggestionSpec setSuggestionType:](v5, "setSuggestionType:", objc_msgSend(v4, "type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "styleAttributes"));
    -[MapsUIImageSuggestionSpec setSuggestionAttributes:](v5, "setSuggestionAttributes:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "MKMapItem"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_styleAttributes"));
    -[MapsUIImageSuggestionSpec setMapItemAttributes:](v5, "setMapItemAttributes:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringForKey:", CFSTR("MapsSuggestionsOriginBundleIDKey")));
    -[MapsUIImageSuggestionSpec setOriginBundleID:](v5, "setOriginBundleID:", v9);

    v10 = v4;
    if (objc_msgSend(v10, "type") != (id)11)
      goto LABEL_4;
    if ((objc_msgSend(v10, "BOOLeanForKey:is:", CFSTR("MapsSuggestionsHasEnoughChargeKey"), 1) & 1) == 0)
      v11 = objc_msgSend(v10, "BOOLeanForKey:is:", CFSTR("MapsSuggestionsIsResumingAnEVRoute"), 1);
    else
LABEL_4:
      v11 = 0;

    -[MapsUIImageSuggestionSpec setShowEVChargingIcon:](v5, "setShowEVChargingIcon:", v11);
    v12 = v10;
    v13 = objc_msgSend(v12, "type") == (id)20
        ? objc_msgSend(v12, "BOOLeanForKey:is:", CFSTR("MapsSuggestionsVehicleSetupWithGenericIconKey"), 1)
        : 0;

    -[MapsUIImageSuggestionSpec setShowOnboardingMultipleVehiclesIcon:](v5, "setShowOnboardingMultipleVehiclesIcon:", v13);
    -[MapsUIImageSuggestionSpec setIsDashboardWidget:](v5, "setIsDashboardWidget:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uniqueIdentifier"));
    -[MapsUIImageSuggestionSpec setUniqueIdentifier:](v5, "setUniqueIdentifier:", v14);

    if (*(_QWORD *)&v5->_inverted == 24)
    {
      if ((objc_msgSend(v12, "containsKey:", CFSTR("MapsSuggestionsContactAsDataKey")) & 1) != 0)
      {
        v15 = objc_opt_class(CNContact);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dataForKey:", CFSTR("MapsSuggestionsContactAsDataKey")));
        v27 = 0;
        v17 = objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", v15, v16, &v27));
        v18 = v27;
        originBundleID = v5->_originBundleID;
        v5->_originBundleID = (NSString *)v17;

        Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "MapsUIImageSuggestionSpec");
        v21 = objc_claimAutoreleasedReturnValue(Log);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedDescription"));
          *(_DWORD *)buf = 138412290;
          v30 = v22;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Error unarchiving contact from entry: %@", buf, 0xCu);

        }
      }
      else
      {
        v18 = 0;
      }
      if (!v5->_originBundleID)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringForKey:", CFSTR("MapsSuggestionsContactLikelyAppleIDKey")));
        v24 = objc_claimAutoreleasedReturnValue(+[CNContact contactWithDisplayName:emailOrPhoneNumber:](CNContact, "contactWithDisplayName:emailOrPhoneNumber:", 0, v23));
        v25 = v5->_originBundleID;
        v5->_originBundleID = (NSString *)v24;

      }
    }
  }

  return v5;
}

- (MapsUIImageSuggestionSpec)initWithFavorite:(id)a3
{
  id v4;
  MapsUIImageSuggestionSpec *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MapsUIImageSuggestionSpec;
  v5 = -[MapsUIImageSuggestionSpec init](&v11, "init");
  if (v5)
  {
    -[MapsUIImageSuggestionSpec setSuggestionType:](v5, "setSuggestionType:", objc_msgSend(v4, "entryType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "styleAttributes"));
    -[MapsUIImageSuggestionSpec setSuggestionAttributes:](v5, "setSuggestionAttributes:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "geoMapItem"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_styleAttributes"));
    -[MapsUIImageSuggestionSpec setMapItemAttributes:](v5, "setMapItemAttributes:", v8);

    -[MapsUIImageSuggestionSpec setIsDashboardWidget:](v5, "setIsDashboardWidget:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueIdentifier"));
    -[MapsUIImageSuggestionSpec setUniqueIdentifier:](v5, "setUniqueIdentifier:", v9);

  }
  return v5;
}

- (BOOL)useSearchImageFallback
{
  return 0;
}

- (id)imageForScale:(double)a3 isCarPlay:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  _BOOL8 v10;
  unsigned __int8 v11;
  unsigned __int8 v12;
  unsigned __int8 v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  uint64_t v18;
  int64_t v19;

  v19 = -[MapsUIImageSuggestionSpec suggestionType](self, "suggestionType", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIImageSuggestionSpec suggestionAttributes](self, "suggestionAttributes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIImageSuggestionSpec mapItemAttributes](self, "mapItemAttributes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIImageSuggestionSpec originBundleID](self, "originBundleID"));
  v9 = -[MapsUIImageSuggestionSpec showEVChargingIcon](self, "showEVChargingIcon");
  v10 = -[MapsUIImageSuggestionSpec showOnboardingMultipleVehiclesIcon](self, "showOnboardingMultipleVehiclesIcon");
  v11 = -[MapsUIImageSuggestionSpec inverted](self, "inverted");
  v12 = -[MapsUIImageSuggestionSpec isDashboardWidget](self, "isDashboardWidget");
  v13 = -[MapsUIImageSpec nightMode](self, "nightMode");
  v14 = -[MapsUIImageSpec isRTL](self, "isRTL");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIImageSuggestionSpec contact](self, "contact"));
  BYTE3(v18) = v14;
  BYTE2(v18) = v13;
  BYTE1(v18) = v12;
  LOBYTE(v18) = v11;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSuggestionsEntry iconForSuggestionType:suggestionAttributes:mapItemAttributes:originBundleID:screenScale:showEVChargingIcon:showOnboardingMultipleVehiclesIcon:inverted:isDashboardWidget:nightMode:isRTL:contact:](MapsSuggestionsEntry, "iconForSuggestionType:suggestionAttributes:mapItemAttributes:originBundleID:screenScale:showEVChargingIcon:showOnboardingMultipleVehiclesIcon:inverted:isDashboardWidget:nightMode:isRTL:contact:", v19, v6, v7, v8, v9, v10, a3, v18, v15));

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MapsUIImageSuggestionSpec *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = objc_opt_new(MapsUIImageSuggestionSpec);
  -[MapsUIImageSuggestionSpec setSuggestionType:](v4, "setSuggestionType:", -[MapsUIImageSuggestionSpec suggestionType](self, "suggestionType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIImageSuggestionSpec suggestionAttributes](self, "suggestionAttributes"));
  -[MapsUIImageSuggestionSpec setSuggestionAttributes:](v4, "setSuggestionAttributes:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIImageSuggestionSpec mapItemAttributes](self, "mapItemAttributes"));
  -[MapsUIImageSuggestionSpec setMapItemAttributes:](v4, "setMapItemAttributes:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIImageSuggestionSpec originBundleID](self, "originBundleID"));
  -[MapsUIImageSuggestionSpec setOriginBundleID:](v4, "setOriginBundleID:", v7);

  -[MapsUIImageSuggestionSpec setShowEVChargingIcon:](v4, "setShowEVChargingIcon:", -[MapsUIImageSuggestionSpec showEVChargingIcon](self, "showEVChargingIcon"));
  -[MapsUIImageSuggestionSpec setShowOnboardingMultipleVehiclesIcon:](v4, "setShowOnboardingMultipleVehiclesIcon:", -[MapsUIImageSuggestionSpec showOnboardingMultipleVehiclesIcon](self, "showOnboardingMultipleVehiclesIcon"));
  -[MapsUIImageSuggestionSpec setInverted:](v4, "setInverted:", -[MapsUIImageSuggestionSpec inverted](self, "inverted"));
  -[MapsUIImageSuggestionSpec setIsDashboardWidget:](v4, "setIsDashboardWidget:", -[MapsUIImageSuggestionSpec isDashboardWidget](self, "isDashboardWidget"));
  -[MapsUIImageSpec setNightMode:](v4, "setNightMode:", -[MapsUIImageSpec nightMode](self, "nightMode"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIImageSuggestionSpec uniqueIdentifier](self, "uniqueIdentifier"));
  -[MapsUIImageSuggestionSpec setUniqueIdentifier:](v4, "setUniqueIdentifier:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIImageSuggestionSpec contact](self, "contact"));
  -[MapsUIImageSuggestionSpec setContact:](v4, "setContact:", v9);

  return v4;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[MapsUIImageSuggestionSpec suggestionType](self, "suggestionType")));
  v4 = (unint64_t)objc_msgSend(v3, "hash");
  if (-[MapsUIImageSuggestionSpec inverted](self, "inverted"))
    v5 = 2248;
  else
    v5 = 0;
  if (-[MapsUIImageSuggestionSpec isDashboardWidget](self, "isDashboardWidget"))
    v6 = 4496;
  else
    v6 = 0;
  v7 = v5 ^ v6;
  if (-[MapsUIImageSpec nightMode](self, "nightMode"))
    v8 = 4496;
  else
    v8 = 0;
  v9 = v7 ^ v8 ^ v4;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  MapsUIImageSuggestionSpec *v4;
  MapsUIImageSuggestionSpec *v5;
  uint64_t v6;
  MapsUIImageSuggestionSpec *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  BOOL v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v4 = (MapsUIImageSuggestionSpec *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v25 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = v5;
    v8 = -[MapsUIImageSuggestionSpec suggestionType](self, "suggestionType");
    if (v8 == (id)-[MapsUIImageSuggestionSpec suggestionType](v7, "suggestionType"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIImageSuggestionSpec uniqueIdentifier](self, "uniqueIdentifier"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIImageSuggestionSpec uniqueIdentifier](v7, "uniqueIdentifier"));
      if (objc_msgSend(v9, "isEqualToString:", v10))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIImageSuggestionSpec suggestionAttributes](self, "suggestionAttributes"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIImageSuggestionSpec suggestionAttributes](v7, "suggestionAttributes"));
        if (v11 == v12 || objc_msgSend(v11, "isEqual:", v12))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIImageSuggestionSpec mapItemAttributes](self, "mapItemAttributes"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIImageSuggestionSpec mapItemAttributes](v7, "mapItemAttributes"));
          if (v13 == v14 || objc_msgSend(v13, "isEqual:", v14))
          {
            v30 = v13;
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIImageSuggestionSpec originBundleID](self, "originBundleID"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIImageSuggestionSpec originBundleID](v7, "originBundleID"));
            if (v15 == v16 || (v17 = v16, v18 = objc_msgSend(v15, "isEqual:", v16), v16 = v17, v18))
            {
              v19 = v16;
              v20 = -[MapsUIImageSuggestionSpec showEVChargingIcon](self, "showEVChargingIcon", v15);
              if (v20 == -[MapsUIImageSuggestionSpec showEVChargingIcon](v7, "showEVChargingIcon")
                && (v21 = -[MapsUIImageSuggestionSpec showOnboardingMultipleVehiclesIcon](self, "showOnboardingMultipleVehiclesIcon"), v21 == -[MapsUIImageSuggestionSpec showOnboardingMultipleVehiclesIcon](v7, "showOnboardingMultipleVehiclesIcon"))&& (v22 = -[MapsUIImageSuggestionSpec inverted](self, "inverted"), v22 == -[MapsUIImageSuggestionSpec inverted](v7, "inverted"))&& (v23 = -[MapsUIImageSuggestionSpec isDashboardWidget](self, "isDashboardWidget"), v23 == -[MapsUIImageSuggestionSpec isDashboardWidget](v7, "isDashboardWidget"))&& (v24 = -[MapsUIImageSpec nightMode](self, "nightMode"), v24 == -[MapsUIImageSpec nightMode](v7, "nightMode")))
              {
                v27 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIImageSuggestionSpec contact](self, "contact"));
                v28 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIImageSuggestionSpec contact](v7, "contact"));
                v25 = v27 == v28;

              }
              else
              {
                v25 = 0;
              }
              v15 = v29;
              v16 = v19;
            }
            else
            {
              v25 = 0;
            }
            v13 = v30;

          }
          else
          {
            v25 = 0;
          }

        }
        else
        {
          v25 = 0;
        }

      }
      else
      {
        v25 = 0;
      }

    }
    else
    {
      v25 = 0;
    }

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  const __CFString *v14;
  void *v15;
  int64_t v17;
  uint64_t v18;

  v18 = objc_opt_class(self);
  v17 = -[MapsUIImageSuggestionSpec suggestionType](self, "suggestionType");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIImageSuggestionSpec suggestionAttributes](self, "suggestionAttributes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIImageSuggestionSpec mapItemAttributes](self, "mapItemAttributes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsUIImageSuggestionSpec originBundleID](self, "originBundleID"));
  if (-[MapsUIImageSuggestionSpec showEVChargingIcon](self, "showEVChargingIcon"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  v7 = v6;
  if (-[MapsUIImageSuggestionSpec showOnboardingMultipleVehiclesIcon](self, "showOnboardingMultipleVehiclesIcon"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v9 = v8;
  if (-[MapsUIImageSuggestionSpec inverted](self, "inverted"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  v11 = v10;
  if (-[MapsUIImageSuggestionSpec isDashboardWidget](self, "isDashboardWidget"))
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  v13 = v12;
  if (-[MapsUIImageSpec nightMode](self, "nightMode"))
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p; suggestionType = %d, suggestionAttributes = %@, mapItemAttributes = %@; originBundleID = %@, showEVChargingIcon = %@, showOnboardingMultipleVehiclesIcon = %@, inverted = %@, isDashboardWidget = %@; nightMode = %@>"),
                    v18,
                    self,
                    v17,
                    v3,
                    v4,
                    v5,
                    v7,
                    v9,
                    v11,
                    v13,
                    v14));

  return v15;
}

- (BOOL)inverted
{
  return *(&self->super._isRTL + 1);
}

- (void)setInverted:(BOOL)a3
{
  *(&self->super._isRTL + 1) = a3;
}

- (BOOL)isDashboardWidget
{
  return *(&self->super._isRTL + 2);
}

- (void)setIsDashboardWidget:(BOOL)a3
{
  *(&self->super._isRTL + 2) = a3;
}

- (int64_t)suggestionType
{
  return *(_QWORD *)&self->_inverted;
}

- (void)setSuggestionType:(int64_t)a3
{
  *(_QWORD *)&self->_inverted = a3;
}

- (GEOFeatureStyleAttributes)suggestionAttributes
{
  return (GEOFeatureStyleAttributes *)self->_suggestionType;
}

- (void)setSuggestionAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (GEOFeatureStyleAttributes)mapItemAttributes
{
  return self->_suggestionAttributes;
}

- (void)setMapItemAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)originBundleID
{
  return (NSString *)self->_mapItemAttributes;
}

- (void)setOriginBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)showEVChargingIcon
{
  return *(&self->super._isRTL + 3);
}

- (void)setShowEVChargingIcon:(BOOL)a3
{
  *(&self->super._isRTL + 3) = a3;
}

- (BOOL)showOnboardingMultipleVehiclesIcon
{
  return *(&self->super._isRTL + 4);
}

- (void)setShowOnboardingMultipleVehiclesIcon:(BOOL)a3
{
  *(&self->super._isRTL + 4) = a3;
}

- (CNContact)contact
{
  return (CNContact *)self->_originBundleID;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_originBundleID, a3);
}

- (NSString)uniqueIdentifier
{
  return (NSString *)&self->_contact->super.isa;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_originBundleID, 0);
  objc_storeStrong((id *)&self->_mapItemAttributes, 0);
  objc_storeStrong((id *)&self->_suggestionAttributes, 0);
  objc_storeStrong((id *)&self->_suggestionType, 0);
}

@end
