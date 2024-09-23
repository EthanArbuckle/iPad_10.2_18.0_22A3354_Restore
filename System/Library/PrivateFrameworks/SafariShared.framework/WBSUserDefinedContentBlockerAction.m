@implementation WBSUserDefinedContentBlockerAction

- (WBSUserDefinedContentBlockerAction)initWithSelector:(id)a3 type:(id)a4
{
  id v7;
  id v8;
  WBSUserDefinedContentBlockerAction *v9;
  WBSUserDefinedContentBlockerAction *v10;
  WBSUserDefinedContentBlockerAction *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WBSUserDefinedContentBlockerAction;
  v9 = -[WBSUserDefinedContentBlockerAction init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_databaseID = 0;
    v9->_crossSiteContentID = 0;
    objc_storeStrong((id *)&v9->_selector, a3);
    objc_storeStrong((id *)&v10->_typeString, a4);
    v11 = v10;
  }

  return v10;
}

- (WBSUserDefinedContentBlockerAction)initWithDatabaseID:(int64_t)a3 selector:(id)a4 type:(id)a5 crossSiteContentID:(int64_t)a6 extraAttributesData:(id)a7
{
  id v12;
  WBSUserDefinedContentBlockerAction *v13;
  WBSUserDefinedContentBlockerAction *v14;
  WBSUserDefinedContentBlockerAction *v15;

  v12 = a7;
  v13 = -[WBSUserDefinedContentBlockerAction initWithSelector:type:](self, "initWithSelector:type:", a4, a5);
  v14 = v13;
  if (v13)
  {
    v13->_databaseID = a3;
    v13->_crossSiteContentID = a6;
    -[WBSUserDefinedContentBlockerAction _readExtraAttributesWithData:](v13, "_readExtraAttributesWithData:", v12);
    v15 = v14;
  }

  return v14;
}

- (void)_readExtraAttributesWithData:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSString *v16;
  NSString *searchableText;
  NSString *v18;
  NSString *renderTreeText;
  NSString *v20;
  NSString *screenReaderText;
  NSString *v22;
  NSString *imageAnalysisText;
  void *v24;
  void *v25;
  double v26;
  CGFloat v27;
  void *v28;
  double v29;
  CGFloat v30;
  void *v31;
  double v32;
  CGFloat v33;
  void *v34;
  CGFloat v35;
  NSSet *v36;
  NSSet *mediaAndLinkURLs;
  NSArray *v38;
  NSArray *allSelectorsIncludingShadowHosts;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  void *v45;
  double v46;
  void *v47;
  double v48;
  void *v49;
  double v50;
  void *v51;
  double v52;
  void *v53;
  id v54;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0CB3710];
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = a3;
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    objc_msgSend(v5, "setWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0;
    objc_msgSend(v4, "unarchivedObjectOfClasses:fromData:error:", v12, v6, &v54);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v54;
    if (v14
      && (v15 = WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker(),
          os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)))
    {
      -[WBSUserDefinedContentBlockerAction _readExtraAttributesWithData:].cold.1(v15, v14);
      if (v13)
      {
LABEL_5:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v13, "safari_stringForKey:", CFSTR("searchableText"));
          v16 = (NSString *)objc_claimAutoreleasedReturnValue();
          searchableText = self->_searchableText;
          self->_searchableText = v16;

          objc_msgSend(v13, "safari_stringForKey:", CFSTR("renderTreeText"));
          v18 = (NSString *)objc_claimAutoreleasedReturnValue();
          renderTreeText = self->_renderTreeText;
          self->_renderTreeText = v18;

          objc_msgSend(v13, "safari_stringForKey:", CFSTR("screenReaderText"));
          v20 = (NSString *)objc_claimAutoreleasedReturnValue();
          screenReaderText = self->_screenReaderText;
          self->_screenReaderText = v20;

          objc_msgSend(v13, "safari_stringForKey:", CFSTR("imageAnalysisText"));
          v22 = (NSString *)objc_claimAutoreleasedReturnValue();
          imageAnalysisText = self->_imageAnalysisText;
          self->_imageAnalysisText = v22;

          objc_msgSend(v13, "safari_arrayForKey:", CFSTR("bounds"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v24, "count") == 4)
          {
            objc_msgSend(v24, "safari_numberAtIndex:", 0);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "doubleValue");
            v27 = v26;
            objc_msgSend(v24, "safari_numberAtIndex:", 1);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "doubleValue");
            v30 = v29;
            objc_msgSend(v24, "safari_numberAtIndex:", 2);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "doubleValue");
            v33 = v32;
            objc_msgSend(v24, "safari_numberAtIndex:", 3);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "doubleValue");
            self->_bounds.origin.x = v27;
            self->_bounds.origin.y = v30;
            self->_bounds.size.width = v33;
            self->_bounds.size.height = v35;

          }
          objc_msgSend(v13, "safari_setForKey:", CFSTR("mediaAndLinkURLs"));
          v36 = (NSSet *)objc_claimAutoreleasedReturnValue();
          mediaAndLinkURLs = self->_mediaAndLinkURLs;
          self->_mediaAndLinkURLs = v36;

          objc_msgSend(v13, "safari_arrayForKey:", CFSTR("allSelectorsIncludingShadowHosts"));
          v38 = (NSArray *)objc_claimAutoreleasedReturnValue();
          allSelectorsIncludingShadowHosts = self->_allSelectorsIncludingShadowHosts;
          self->_allSelectorsIncludingShadowHosts = v38;

          objc_msgSend(v13, "safari_numberForKey:", CFSTR("edgeAnchors"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          self->_edgeAnchors = objc_msgSend(v40, "integerValue");

          objc_msgSend(v13, "safari_arrayForKey:", CFSTR("edgeInsets"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v41;
          if (v41)
          {
            if (objc_msgSend(v41, "count") == 4)
            {
              objc_msgSend(v42, "safari_numberAtIndex:", 0);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "doubleValue");
              self->_edgeInsets.left = v44;

              objc_msgSend(v42, "safari_numberAtIndex:", 1);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "doubleValue");
              self->_edgeInsets.top = v46;

              objc_msgSend(v42, "safari_numberAtIndex:", 2);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "doubleValue");
              self->_edgeInsets.right = v48;

              objc_msgSend(v42, "safari_numberAtIndex:", 3);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "doubleValue");
              self->_edgeInsets.bottom = v50;

            }
          }
          objc_msgSend(v13, "safari_numberForKey:", CFSTR("viewZoomFactor"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "doubleValue");
          self->_viewZoomScale = v52;

          objc_msgSend(v13, "safari_numberForKey:", CFSTR("positionType"));
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          self->_positionType = (int)objc_msgSend(v53, "intValue");

        }
      }
    }
    else if (v13)
    {
      goto LABEL_5;
    }

  }
}

- (id)extraAttributesData
{
  void *v3;
  void *v4;
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
  NSSet *mediaAndLinkURLs;
  void *v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  id v26;
  _QWORD v27[4];
  _QWORD v28[2];
  _QWORD v29[5];

  v29[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_searchableText, CFSTR("searchableText"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_renderTreeText, CFSTR("renderTreeText"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_screenReaderText, CFSTR("screenReaderText"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_imageAnalysisText, CFSTR("imageAnalysisText"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_bounds.origin.x);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_bounds.origin.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_bounds.size.width);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_bounds.size.height);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("bounds"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_bounds.size.width);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_bounds.size.height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("webViewSize"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_allSelectorsIncludingShadowHosts, CFSTR("allSelectorsIncludingShadowHosts"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_edgeAnchors);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("edgeAnchors"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_edgeInsets.left);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v13;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_edgeInsets.top);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_edgeInsets.right);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v15;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_edgeInsets.bottom);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("edgeInsets"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_viewZoomScale);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("viewZoomFactor"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_positionType);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("positionType"));

  mediaAndLinkURLs = self->_mediaAndLinkURLs;
  if (mediaAndLinkURLs)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", mediaAndLinkURLs, CFSTR("mediaAndLinkURLs"));
  if (objc_msgSend(v3, "count"))
  {
    v26 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v26);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v26;
    if (v22)
    {
      v23 = WBS_LOG_CHANNEL_PREFIXUserDefinedContentBlocker();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[WBSUserDefinedContentBlockerAction extraAttributesData].cold.1((uint64_t)v22, v23, v24);
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (BOOL)isEquivalentToAction:(id)a3
{
  WBSUserDefinedContentBlockerAction *v4;
  WBSUserDefinedContentBlockerAction *v5;
  NSString *selector;
  void *v7;
  NSString *typeString;
  void *v9;
  char v10;

  v4 = (WBSUserDefinedContentBlockerAction *)a3;
  v5 = v4;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    selector = self->_selector;
    -[WBSUserDefinedContentBlockerAction selector](v4, "selector");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](selector, "isEqualToString:", v7))
    {
      typeString = self->_typeString;
      -[WBSUserDefinedContentBlockerAction typeString](v5, "typeString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[NSString isEqualToString:](typeString, "isEqualToString:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

- (NSArray)selectorsForStyleSheetRules
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_allSelectorsIncludingShadowHosts, "count"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = self->_allSelectorsIncludingShadowHosts;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v9, "count") == 1)
        {
          v18 = 0u;
          v19 = 0u;
          v16 = 0u;
          v17 = 0u;
          objc_msgSend(v9, "lastObject", 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v17;
            do
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v17 != v13)
                  objc_enumerationMutation(v10);
                objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j));
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
            }
            while (v12);
          }

        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p {%@} sel=%@ renderTreeText=%@ imageAnalysisText=%@ searchableText=%@ screenReaderText=%@>"), objc_opt_class(), self, self->_typeString, self->_selector, self->_renderTreeText, self->_imageAnalysisText, self->_searchableText, self->_screenReaderText);
}

- (int64_t)databaseID
{
  return self->_databaseID;
}

- (NSString)selector
{
  return self->_selector;
}

- (void)setSelector:(id)a3
{
  objc_storeStrong((id *)&self->_selector, a3);
}

- (NSString)typeString
{
  return self->_typeString;
}

- (void)setTypeString:(id)a3
{
  objc_storeStrong((id *)&self->_typeString, a3);
}

- (int64_t)crossSiteContentID
{
  return self->_crossSiteContentID;
}

- (WBSUserDefinedContentBlockerCrossSiteContent)crossSiteContentCandidate
{
  return self->_crossSiteContentCandidate;
}

- (void)setCrossSiteContentCandidate:(id)a3
{
  objc_storeStrong((id *)&self->_crossSiteContentCandidate, a3);
}

- (NSString)renderTreeText
{
  return self->_renderTreeText;
}

- (void)setRenderTreeText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)imageAnalysisText
{
  return self->_imageAnalysisText;
}

- (void)setImageAnalysisText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)searchableText
{
  return self->_searchableText;
}

- (void)setSearchableText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)screenReaderText
{
  return self->_screenReaderText;
}

- (void)setScreenReaderText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)allSelectorsIncludingShadowHosts
{
  return self->_allSelectorsIncludingShadowHosts;
}

- (void)setAllSelectorsIncludingShadowHosts:(id)a3
{
  objc_storeStrong((id *)&self->_allSelectorsIncludingShadowHosts, a3);
}

- (NSSet)mediaAndLinkURLs
{
  return self->_mediaAndLinkURLs;
}

- (void)setMediaAndLinkURLs:(id)a3
{
  objc_storeStrong((id *)&self->_mediaAndLinkURLs, a3);
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (int64_t)positionType
{
  return self->_positionType;
}

- (void)setPositionType:(int64_t)a3
{
  self->_positionType = a3;
}

- (unint64_t)edgeAnchors
{
  return self->_edgeAnchors;
}

- (void)setEdgeAnchors:(unint64_t)a3
{
  self->_edgeAnchors = a3;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)edgeInsets
{
  double left;
  double top;
  double right;
  double bottom;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  left = self->_edgeInsets.left;
  top = self->_edgeInsets.top;
  right = self->_edgeInsets.right;
  bottom = self->_edgeInsets.bottom;
  result.var3 = bottom;
  result.var2 = right;
  result.var1 = top;
  result.var0 = left;
  return result;
}

- (void)setEdgeInsets:(id)a3
{
  self->_edgeInsets = ($25007BB52CABD522289DA066AE13E06A)a3;
}

- (double)viewZoomScale
{
  return self->_viewZoomScale;
}

- (void)setViewZoomScale:(double)a3
{
  self->_viewZoomScale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaAndLinkURLs, 0);
  objc_storeStrong((id *)&self->_allSelectorsIncludingShadowHosts, 0);
  objc_storeStrong((id *)&self->_screenReaderText, 0);
  objc_storeStrong((id *)&self->_searchableText, 0);
  objc_storeStrong((id *)&self->_imageAnalysisText, 0);
  objc_storeStrong((id *)&self->_renderTreeText, 0);
  objc_storeStrong((id *)&self->_crossSiteContentCandidate, 0);
  objc_storeStrong((id *)&self->_typeString, 0);
  objc_storeStrong((id *)&self->_selector, 0);
}

- (void)_readExtraAttributesWithData:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543362;
  v7 = v4;
  OUTLINED_FUNCTION_0(&dword_1A3D90000, v3, v5, "Failed to unarchive extra data from database: %{public}@", (uint8_t *)&v6);

}

- (void)extraAttributesData
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_1A3D90000, a2, a3, "Error when archiving extra attributes: %@", (uint8_t *)&v3);
}

@end
