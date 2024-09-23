@implementation VUIPlaybackTabInfo

- (VUIPlaybackTabInfo)initWithDictionary:(id)a3
{
  id v4;
  VUIPlaybackTabInfo *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  VUIPlaybackTabDetails *v14;
  VUIPlaybackTabDetails *multiviewTabInfo;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  int v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  VUIPlaybackTabDetails *v27;
  const __CFString *v28;
  NSString *focusedTabIdOnFirstDisplay;
  uint64_t v30;
  NSArray *tabDetails;
  void *v33;
  id obj;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  objc_super v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)VUIPlaybackTabInfo;
  v5 = -[VUIPlaybackTabInfo init](&v40, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "vui_stringForKey:", CFSTR("canonicalId"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (__CFString *)v6;
    else
      v8 = &stru_1E9FF3598;
    objc_storeStrong((id *)&v5->_canonicalId, v8);

    objc_msgSend(v4, "vui_stringForKey:", CFSTR("adamId"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (__CFString *)v9;
    else
      v11 = &stru_1E9FF3598;
    objc_storeStrong((id *)&v5->_adamId, v11);

    objc_msgSend(v4, "vui_dictionaryForKey:", CFSTR("multiView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12 && objc_msgSend(v12, "vui_BOOLForKey:defaultValue:", CFSTR("isMultiViewAllowed"), 0))
    {
      v14 = -[VUIPlaybackTabDetails initWithDictionary:]([VUIPlaybackTabDetails alloc], "initWithDictionary:", v13);
      multiviewTabInfo = v5->_multiviewTabInfo;
      v5->_multiviewTabInfo = v14;

    }
    objc_msgSend(v4, "vui_arrayForKey:", CFSTR("tabs"), v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isInfoTabAllowed = 0;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = v16;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v37 != v19)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          v22 = objc_msgSend(v21, "vui_BOOLForKey:defaultValue:", CFSTR("isMarkerShelf"), 0);
          v23 = 0;
          if (_os_feature_enabled_impl())
          {
            objc_msgSend(v21, "vui_stringForKey:", CFSTR("tabId"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v24, "isEqualToString:", CFSTR("uts.marker.Spotlight"));

          }
          if (!v22)
            goto LABEL_22;
          objc_msgSend(v21, "vui_stringForKey:", CFSTR("markerType"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("Info"));

          if (v26)
          {
            v5->_isInfoTabAllowed = 1;
            continue;
          }
          if (v23)
          {
LABEL_22:
            v27 = -[VUIPlaybackTabDetails initWithDictionary:]([VUIPlaybackTabDetails alloc], "initWithDictionary:", v21);
            objc_msgSend(v35, "addObject:", v27);
            if (-[VUIPlaybackTabDetails isSelected](v27, "isSelected") && !v5->_focusedTabIdOnFirstDisplay)
            {
              -[VUIPlaybackTabDetails tabId](v27, "tabId");
              v28 = (const __CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v28 = CFSTR("uts.marker.Spotlight");
              if (!v23)
                goto LABEL_28;
            }
            focusedTabIdOnFirstDisplay = v5->_focusedTabIdOnFirstDisplay;
            v5->_focusedTabIdOnFirstDisplay = &v28->isa;

LABEL_28:
            continue;
          }
        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v18);
    }
    v30 = objc_msgSend(v35, "copy");
    tabDetails = v5->_tabDetails;
    v5->_tabDetails = (NSArray *)v30;

  }
  return v5;
}

- (void)insertTabDetails:(id)a3 atIndex:(unint64_t)a4
{
  NSArray *tabDetails;
  id v7;
  NSArray *v8;
  NSArray *v9;
  id v10;

  tabDetails = self->_tabDetails;
  v7 = a3;
  v10 = (id)-[NSArray mutableCopy](tabDetails, "mutableCopy");
  objc_msgSend(v10, "insertObject:atIndex:", v7, a4);

  v8 = (NSArray *)objc_msgSend(v10, "copy");
  v9 = self->_tabDetails;
  self->_tabDetails = v8;

}

- (id)copyWithZone:(_NSZone *)a3
{
  VUIPlaybackTabInfo *v4;
  uint64_t v5;
  NSString *canonicalId;
  uint64_t v7;
  NSString *adamId;
  uint64_t v9;
  VUIPlaybackTabDetails *multiviewTabInfo;
  uint64_t v11;
  NSArray *tabDetails;

  v4 = objc_alloc_init(VUIPlaybackTabInfo);
  v5 = -[NSString copy](self->_canonicalId, "copy");
  canonicalId = v4->_canonicalId;
  v4->_canonicalId = (NSString *)v5;

  v7 = -[NSString copy](self->_adamId, "copy");
  adamId = v4->_adamId;
  v4->_adamId = (NSString *)v7;

  v4->_isInfoTabAllowed = self->_isInfoTabAllowed;
  objc_storeStrong((id *)&v4->_focusedTabIdOnFirstDisplay, self->_focusedTabIdOnFirstDisplay);
  v9 = -[VUIPlaybackTabDetails copy](self->_multiviewTabInfo, "copy");
  multiviewTabInfo = v4->_multiviewTabInfo;
  v4->_multiviewTabInfo = (VUIPlaybackTabDetails *)v9;

  v11 = -[NSArray copy](self->_tabDetails, "copy");
  tabDetails = v4->_tabDetails;
  v4->_tabDetails = (NSArray *)v11;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  VUIPlaybackTabInfo *v4;
  VUIPlaybackTabInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v4 = (VUIPlaybackTabInfo *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[VUIPlaybackTabInfo canonicalId](self, "canonicalId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIPlaybackTabInfo canonicalId](v5, "canonicalId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToString:", v7))
      {
        -[VUIPlaybackTabInfo adamId](self, "adamId");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIPlaybackTabInfo adamId](v5, "adamId");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqualToString:", v9)
          && (v10 = -[VUIPlaybackTabInfo isInfoTabAllowed](self, "isInfoTabAllowed"),
              v10 == -[VUIPlaybackTabInfo isInfoTabAllowed](v5, "isInfoTabAllowed")))
        {
          -[VUIPlaybackTabInfo multiviewTabInfo](self, "multiviewTabInfo");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[VUIPlaybackTabInfo multiviewTabInfo](v5, "multiviewTabInfo");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "isEqual:", v13))
          {
            -[VUIPlaybackTabInfo tabDetails](self, "tabDetails");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[VUIPlaybackTabInfo tabDetails](v5, "tabDetails");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v16, "isEqualToArray:", v14);

          }
          else
          {
            v11 = 0;
          }

        }
        else
        {
          v11 = 0;
        }

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (NSString)canonicalId
{
  return self->_canonicalId;
}

- (void)setCanonicalId:(id)a3
{
  objc_storeStrong((id *)&self->_canonicalId, a3);
}

- (NSString)adamId
{
  return self->_adamId;
}

- (void)setAdamId:(id)a3
{
  objc_storeStrong((id *)&self->_adamId, a3);
}

- (BOOL)isInfoTabAllowed
{
  return self->_isInfoTabAllowed;
}

- (VUIPlaybackTabDetails)multiviewTabInfo
{
  return self->_multiviewTabInfo;
}

- (NSArray)tabDetails
{
  return self->_tabDetails;
}

- (NSString)focusedTabIdOnFirstDisplay
{
  return self->_focusedTabIdOnFirstDisplay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusedTabIdOnFirstDisplay, 0);
  objc_storeStrong((id *)&self->_tabDetails, 0);
  objc_storeStrong((id *)&self->_multiviewTabInfo, 0);
  objc_storeStrong((id *)&self->_adamId, 0);
  objc_storeStrong((id *)&self->_canonicalId, 0);
}

@end
