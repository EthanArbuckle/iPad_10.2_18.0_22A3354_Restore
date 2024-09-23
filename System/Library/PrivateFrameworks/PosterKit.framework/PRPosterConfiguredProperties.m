@implementation PRPosterConfiguredProperties

- (PRPosterHomeScreenConfiguration)homeScreenConfiguration
{
  return self->_homeScreenConfiguration;
}

- (BOOL)isEqual:(id)a3
{
  PRPosterConfiguredProperties *v4;
  BOOL v5;

  v4 = (PRPosterConfiguredProperties *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PRPosterConfiguredProperties isEqualToConfiguredProperties:](self, "isEqualToConfiguredProperties:", v4);
  }

  return v5;
}

+ (id)configuredPropertiesSanitizedForPassingToExtension:(id)a3
{
  id v3;
  PRPosterConfiguredProperties *v4;
  void *v5;
  void *v6;
  PRPosterConfiguredProperties *v7;

  v3 = a3;
  v4 = [PRPosterConfiguredProperties alloc];
  objc_msgSend(v3, "titleStyleConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorVariationsConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PRPosterConfiguredProperties initWithTitleStyleConfiguration:focusConfiguration:complicationLayout:renderingConfiguration:homeScreenConfiguration:colorVariationsConfiguration:quickActionsConfiguration:ambientConfiguration:ambientWidgetLayout:suggestionMetadata:otherMetadata:](v4, "initWithTitleStyleConfiguration:focusConfiguration:complicationLayout:renderingConfiguration:homeScreenConfiguration:colorVariationsConfiguration:quickActionsConfiguration:ambientConfiguration:ambientWidgetLayout:suggestionMetadata:otherMetadata:", v5, 0, 0, 0, 0, v6, 0, 0, 0, 0, 0);
  return v7;
}

+ (id)defaultConfiguredPropertiesForRole:(id)a3
{
  id v3;
  void *v4;
  PRPosterTitleStyleConfiguration *v5;
  void *v6;
  PRPosterTitleStyleConfiguration *v7;
  PRPosterConfiguredProperties *v8;
  PRPosterConfiguredProperties *v9;
  PRPosterAmbientConfiguration *v10;
  uint64_t v12;

  v3 = a3;
  if (objc_msgSend(v3, "isEqual:", CFSTR("PRPosterRoleLockScreen")))
  {
    +[PRPosterTimeFontConfiguration defaultConfiguration](PRPosterTimeFontConfiguration, "defaultConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = [PRPosterTitleStyleConfiguration alloc];
    +[PRPosterTitleStyleConfiguration defaultTitleColor](PRPosterTitleStyleConfiguration, "defaultTitleColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PRPosterTitleStyleConfiguration defaultContentsLuminance](PRPosterTitleStyleConfiguration, "defaultContentsLuminance");
    LOBYTE(v12) = 1;
    v7 = -[PRPosterTitleStyleConfiguration initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleColor:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:](v5, "initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleColor:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", v4, 0, 0, v6, 0, 0, v12, 0);

    v8 = -[PRPosterConfiguredProperties initWithTitleStyleConfiguration:focusConfiguration:complicationLayout:renderingConfiguration:homeScreenConfiguration:colorVariationsConfiguration:quickActionsConfiguration:suggestionMetadata:otherMetadata:]([PRPosterConfiguredProperties alloc], "initWithTitleStyleConfiguration:focusConfiguration:complicationLayout:renderingConfiguration:homeScreenConfiguration:colorVariationsConfiguration:quickActionsConfiguration:suggestionMetadata:otherMetadata:", v7, 0, 0, 0, 0, 0, 0, 0, 0);
  }
  else if (objc_msgSend(v3, "isEqual:", CFSTR("PRPosterRoleAmbient")))
  {
    v9 = [PRPosterConfiguredProperties alloc];
    v10 = -[PRPosterAmbientConfiguration initWithSupportedDataLayout:]([PRPosterAmbientConfiguration alloc], "initWithSupportedDataLayout:", 0);
    v8 = -[PRPosterConfiguredProperties initWithAmbientConfiguration:widgetLayout:otherMetadata:](v9, "initWithAmbientConfiguration:widgetLayout:otherMetadata:", v10, 0, 0);

  }
  else
  {
    v8 = (PRPosterConfiguredProperties *)objc_opt_new();
  }

  return v8;
}

- (PRPosterConfiguredProperties)initWithTitleStyleConfiguration:(id)a3 focusConfiguration:(id)a4 complicationLayout:(id)a5 renderingConfiguration:(id)a6 homeScreenConfiguration:(id)a7 colorVariationsConfiguration:(id)a8 quickActionsConfiguration:(id)a9 ambientConfiguration:(id)a10 ambientWidgetLayout:(id)a11 suggestionMetadata:(id)a12 otherMetadata:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  PRPosterConfiguredProperties *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v40;
  id v41;
  id v42;
  objc_super v43;

  v18 = a3;
  v19 = a4;
  v42 = a5;
  v41 = a6;
  v40 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  v24 = a12;
  v25 = a13;
  v43.receiver = self;
  v43.super_class = (Class)PRPosterConfiguredProperties;
  v26 = -[PRPosterConfiguredProperties init](&v43, sel_init);
  if (v26)
  {
    v27 = (void *)objc_msgSend(v18, "copy");
    -[PRPosterConfiguredProperties setTitleStyleConfiguration:](v26, "setTitleStyleConfiguration:", v27);

    v28 = (void *)objc_msgSend(v19, "copy");
    -[PRPosterConfiguredProperties setFocusConfiguration:](v26, "setFocusConfiguration:", v28);

    v29 = (void *)objc_msgSend(v42, "copy");
    -[PRPosterConfiguredProperties setComplicationLayout:](v26, "setComplicationLayout:", v29);

    v30 = (void *)objc_msgSend(v41, "copy");
    -[PRPosterConfiguredProperties setRenderingConfiguration:](v26, "setRenderingConfiguration:", v30);

    v31 = (void *)objc_msgSend(v40, "copy");
    -[PRPosterConfiguredProperties setHomeScreenConfiguration:](v26, "setHomeScreenConfiguration:", v31);

    v32 = (void *)objc_msgSend(v20, "copy");
    -[PRPosterConfiguredProperties setColorVariationsConfiguration:](v26, "setColorVariationsConfiguration:", v32);

    v33 = (void *)objc_msgSend(v21, "copy");
    -[PRPosterConfiguredProperties setQuickActionsConfiguration:](v26, "setQuickActionsConfiguration:", v33);

    v34 = (void *)objc_msgSend(v22, "copy");
    -[PRPosterConfiguredProperties setAmbientConfiguration:](v26, "setAmbientConfiguration:", v34);

    v35 = (void *)objc_msgSend(v23, "copy");
    -[PRPosterConfiguredProperties setAmbientWidgetLayout:](v26, "setAmbientWidgetLayout:", v35);

    v36 = (void *)objc_msgSend(v24, "copy");
    -[PRPosterConfiguredProperties setSuggestionMetadata:](v26, "setSuggestionMetadata:", v36);

    v37 = (void *)objc_msgSend(v25, "copy");
    -[PRPosterConfiguredProperties setOtherMetadata:](v26, "setOtherMetadata:", v37);

  }
  return v26;
}

- (PRPosterConfiguredProperties)initWithTitleStyleConfiguration:(id)a3 focusConfiguration:(id)a4 complicationLayout:(id)a5 renderingConfiguration:(id)a6 homeScreenConfiguration:(id)a7 colorVariationsConfiguration:(id)a8 quickActionsConfiguration:(id)a9 suggestionMetadata:(id)a10 otherMetadata:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  PRPosterConfiguredProperties *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v36;
  objc_super v37;

  v36 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  v37.receiver = self;
  v37.super_class = (Class)PRPosterConfiguredProperties;
  v25 = -[PRPosterConfiguredProperties init](&v37, sel_init);
  if (v25)
  {
    v26 = (void *)objc_msgSend(v36, "copy");
    -[PRPosterConfiguredProperties setTitleStyleConfiguration:](v25, "setTitleStyleConfiguration:", v26);

    v27 = (void *)objc_msgSend(v17, "copy");
    -[PRPosterConfiguredProperties setFocusConfiguration:](v25, "setFocusConfiguration:", v27);

    v28 = (void *)objc_msgSend(v18, "copy");
    -[PRPosterConfiguredProperties setComplicationLayout:](v25, "setComplicationLayout:", v28);

    v29 = (void *)objc_msgSend(v19, "copy");
    -[PRPosterConfiguredProperties setRenderingConfiguration:](v25, "setRenderingConfiguration:", v29);

    v30 = (void *)objc_msgSend(v20, "copy");
    -[PRPosterConfiguredProperties setHomeScreenConfiguration:](v25, "setHomeScreenConfiguration:", v30);

    v31 = (void *)objc_msgSend(v21, "copy");
    -[PRPosterConfiguredProperties setColorVariationsConfiguration:](v25, "setColorVariationsConfiguration:", v31);

    v32 = (void *)objc_msgSend(v22, "copy");
    -[PRPosterConfiguredProperties setQuickActionsConfiguration:](v25, "setQuickActionsConfiguration:", v32);

    v33 = (void *)objc_msgSend(v23, "copy");
    -[PRPosterConfiguredProperties setSuggestionMetadata:](v25, "setSuggestionMetadata:", v33);

    v34 = (void *)objc_msgSend(v24, "copy");
    -[PRPosterConfiguredProperties setOtherMetadata:](v25, "setOtherMetadata:", v34);

  }
  return v25;
}

- (PRPosterConfiguredProperties)initWithAmbientConfiguration:(id)a3 widgetLayout:(id)a4 otherMetadata:(id)a5
{
  id v8;
  id v9;
  id v10;
  PRPosterConfiguredProperties *v11;
  PRPosterConfiguredProperties *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PRPosterConfiguredProperties;
  v11 = -[PRPosterConfiguredProperties init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[PRPosterConfiguredProperties setAmbientConfiguration:](v11, "setAmbientConfiguration:", v8);
    -[PRPosterConfiguredProperties setAmbientWidgetLayout:](v12, "setAmbientWidgetLayout:", v9);
    -[PRPosterConfiguredProperties setOtherMetadata:](v12, "setOtherMetadata:", v10);
  }

  return v12;
}

- (PRPosterConfiguredProperties)init
{
  return -[PRPosterConfiguredProperties initWithTitleStyleConfiguration:focusConfiguration:complicationLayout:renderingConfiguration:homeScreenConfiguration:colorVariationsConfiguration:quickActionsConfiguration:ambientConfiguration:ambientWidgetLayout:suggestionMetadata:otherMetadata:](self, "initWithTitleStyleConfiguration:focusConfiguration:complicationLayout:renderingConfiguration:homeScreenConfiguration:colorVariationsConfiguration:quickActionsConfiguration:ambientConfiguration:ambientWidgetLayout:suggestionMetadata:otherMetadata:", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
}

- (PRPosterConfiguredProperties)initWithCoder:(id)a3
{
  id v3;
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
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  PRPosterConfiguredProperties *v26;
  void *v27;
  void *v28;

  v3 = a3;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v4, CFSTR("titleStyleConfiguration"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v5, CFSTR("focusConfiguration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v7, CFSTR("complicationLayout"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v8, CFSTR("renderingConfiguration"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v10, CFSTR("homeScreenConfiguration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v12, CFSTR("colorVariationsConfiguration"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v13, CFSTR("quickActionsConfiguration"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v15, CFSTR("ambientConfiguration"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v17, CFSTR("suggestionMetadata"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v19, CFSTR("otherMetadata"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v21, CFSTR("ambientWidgetLayout"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = -[PRPosterConfiguredProperties initWithTitleStyleConfiguration:focusConfiguration:complicationLayout:renderingConfiguration:homeScreenConfiguration:colorVariationsConfiguration:quickActionsConfiguration:ambientConfiguration:ambientWidgetLayout:suggestionMetadata:otherMetadata:](self, "initWithTitleStyleConfiguration:focusConfiguration:complicationLayout:renderingConfiguration:homeScreenConfiguration:colorVariationsConfiguration:quickActionsConfiguration:ambientConfiguration:ambientWidgetLayout:suggestionMetadata:otherMetadata:", v28, v6, v27, v9, v11, v24, v14, v16, v22, v18, v20);
  return v26;
}

- (BOOL)_isImmutable
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
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
  id v15;

  v4 = a3;
  -[PRPosterConfiguredProperties titleStyleConfiguration](self, "titleStyleConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("titleStyleConfiguration"));

  -[PRPosterConfiguredProperties focusConfiguration](self, "focusConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("focusConfiguration"));

  -[PRPosterConfiguredProperties complicationLayout](self, "complicationLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("complicationLayout"));

  -[PRPosterConfiguredProperties renderingConfiguration](self, "renderingConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("renderingConfiguration"));

  -[PRPosterConfiguredProperties homeScreenConfiguration](self, "homeScreenConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("homeScreenConfiguration"));

  -[PRPosterConfiguredProperties colorVariationsConfiguration](self, "colorVariationsConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("colorVariationsConfiguration"));

  -[PRPosterConfiguredProperties quickActionsConfiguration](self, "quickActionsConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("quickActionsConfiguration"));

  -[PRPosterConfiguredProperties ambientConfiguration](self, "ambientConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("ambientConfiguration"));

  -[PRPosterConfiguredProperties ambientWidgetLayout](self, "ambientWidgetLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("ambientWidgetLayout"));

  -[PRPosterConfiguredProperties suggestionMetadata](self, "suggestionMetadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("suggestionMetadata"));

  -[PRPosterConfiguredProperties otherMetadata](self, "otherMetadata");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("otherMetadata"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PRPosterConfiguredProperties *v13;
  void *v15;
  PRPosterConfiguredProperties *v16;
  void *v17;

  v16 = [PRPosterConfiguredProperties alloc];
  -[PRPosterConfiguredProperties titleStyleConfiguration](self, "titleStyleConfiguration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterConfiguredProperties focusConfiguration](self, "focusConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterConfiguredProperties complicationLayout](self, "complicationLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterConfiguredProperties renderingConfiguration](self, "renderingConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterConfiguredProperties homeScreenConfiguration](self, "homeScreenConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterConfiguredProperties colorVariationsConfiguration](self, "colorVariationsConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterConfiguredProperties quickActionsConfiguration](self, "quickActionsConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterConfiguredProperties ambientConfiguration](self, "ambientConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterConfiguredProperties ambientWidgetLayout](self, "ambientWidgetLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterConfiguredProperties suggestionMetadata](self, "suggestionMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterConfiguredProperties otherMetadata](self, "otherMetadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PRPosterConfiguredProperties initWithTitleStyleConfiguration:focusConfiguration:complicationLayout:renderingConfiguration:homeScreenConfiguration:colorVariationsConfiguration:quickActionsConfiguration:ambientConfiguration:ambientWidgetLayout:suggestionMetadata:otherMetadata:](v16, "initWithTitleStyleConfiguration:focusConfiguration:complicationLayout:renderingConfiguration:homeScreenConfiguration:colorVariationsConfiguration:quickActionsConfiguration:ambientConfiguration:ambientWidgetLayout:suggestionMetadata:otherMetadata:", v17, v15, v4, v5, v6, v7, v8, v9, v10, v11, v12);

  return v13;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PRPosterMutableConfiguredProperties *v13;
  void *v15;
  PRPosterMutableConfiguredProperties *v16;
  void *v17;

  v16 = [PRPosterMutableConfiguredProperties alloc];
  -[PRPosterConfiguredProperties titleStyleConfiguration](self, "titleStyleConfiguration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterConfiguredProperties focusConfiguration](self, "focusConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterConfiguredProperties complicationLayout](self, "complicationLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterConfiguredProperties renderingConfiguration](self, "renderingConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterConfiguredProperties homeScreenConfiguration](self, "homeScreenConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterConfiguredProperties colorVariationsConfiguration](self, "colorVariationsConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterConfiguredProperties quickActionsConfiguration](self, "quickActionsConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterConfiguredProperties ambientConfiguration](self, "ambientConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterConfiguredProperties ambientWidgetLayout](self, "ambientWidgetLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterConfiguredProperties suggestionMetadata](self, "suggestionMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterConfiguredProperties otherMetadata](self, "otherMetadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PRPosterConfiguredProperties initWithTitleStyleConfiguration:focusConfiguration:complicationLayout:renderingConfiguration:homeScreenConfiguration:colorVariationsConfiguration:quickActionsConfiguration:ambientConfiguration:ambientWidgetLayout:suggestionMetadata:otherMetadata:](v16, "initWithTitleStyleConfiguration:focusConfiguration:complicationLayout:renderingConfiguration:homeScreenConfiguration:colorVariationsConfiguration:quickActionsConfiguration:ambientConfiguration:ambientWidgetLayout:suggestionMetadata:otherMetadata:", v17, v15, v4, v5, v6, v7, v8, v9, v10, v11, v12);

  return v13;
}

- (BOOL)isEqualToConfiguredProperties:(id)a3
{
  return -[PRPosterConfiguredProperties isEqualToConfiguredProperties:comparingPropertiesAffectingSnapshotsOnly:](self, "isEqualToConfiguredProperties:comparingPropertiesAffectingSnapshotsOnly:", a3, 0);
}

- (BOOL)isEqualToConfiguredProperties:(id)a3 comparingPropertiesAffectingSnapshotsOnly:(BOOL)a4
{
  PRPosterConfiguredProperties *v6;
  PRPosterConfiguredProperties *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  int v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;

  v6 = (PRPosterConfiguredProperties *)a3;
  v7 = v6;
  if (v6 == self)
  {
    v17 = 1;
  }
  else
  {
    if (v6)
    {
      -[PRPosterConfiguredProperties titleStyleConfiguration](self, "titleStyleConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterConfiguredProperties titleStyleConfiguration](v7, "titleStyleConfiguration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!BSEqualObjects())
      {
        v17 = 0;
LABEL_36:

        goto LABEL_37;
      }
      -[PRPosterConfiguredProperties renderingConfiguration](self, "renderingConfiguration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterConfiguredProperties renderingConfiguration](v7, "renderingConfiguration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!BSEqualObjects())
      {
        v17 = 0;
LABEL_35:

        goto LABEL_36;
      }
      -[PRPosterConfiguredProperties colorVariationsConfiguration](self, "colorVariationsConfiguration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterConfiguredProperties colorVariationsConfiguration](v7, "colorVariationsConfiguration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!BSEqualObjects())
      {
        v17 = 0;
LABEL_34:

        goto LABEL_35;
      }
      -[PRPosterConfiguredProperties complicationLayout](self, "complicationLayout");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterConfiguredProperties complicationLayout](v7, "complicationLayout");
      v41 = v14;
      v40 = objc_claimAutoreleasedReturnValue();
      if (!BSEqualObjects())
      {
        v17 = 0;
        v18 = (void *)v40;
LABEL_33:

        goto LABEL_34;
      }
      -[PRPosterConfiguredProperties homeScreenConfiguration](self, "homeScreenConfiguration");
      v15 = objc_claimAutoreleasedReturnValue();
      -[PRPosterConfiguredProperties homeScreenConfiguration](v7, "homeScreenConfiguration");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (void *)v15;
      if (!BSEqualObjects())
      {
        v17 = 0;
LABEL_32:
        v14 = v41;
        v18 = (void *)v40;

        goto LABEL_33;
      }
      -[PRPosterConfiguredProperties quickActionsConfiguration](self, "quickActionsConfiguration");
      v16 = objc_claimAutoreleasedReturnValue();
      -[PRPosterConfiguredProperties quickActionsConfiguration](v7, "quickActionsConfiguration");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)v16;
      if (BSEqualObjects())
      {
        if (a4)
        {
LABEL_10:
          v17 = 1;
LABEL_31:

          goto LABEL_32;
        }
        -[PRPosterConfiguredProperties focusConfiguration](self, "focusConfiguration");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[PRPosterConfiguredProperties focusConfiguration](v7, "focusConfiguration");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ((BSEqualObjects() & 1) != 0)
        {
          v34 = v20;
          v35 = v19;
          -[PRPosterConfiguredProperties suggestionMetadata](self, "suggestionMetadata");
          v21 = objc_claimAutoreleasedReturnValue();
          -[PRPosterConfiguredProperties suggestionMetadata](v7, "suggestionMetadata");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = (void *)v21;
          if (BSEqualObjects())
          {
            -[PRPosterConfiguredProperties otherMetadata](self, "otherMetadata");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[PRPosterConfiguredProperties otherMetadata](v7, "otherMetadata");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            if (BSEqualObjects())
            {
              v30 = v23;
              -[PRPosterConfiguredProperties ambientConfiguration](self, "ambientConfiguration");
              v24 = objc_claimAutoreleasedReturnValue();
              -[PRPosterConfiguredProperties ambientConfiguration](v7, "ambientConfiguration");
              v31 = (void *)v24;
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              if (BSEqualObjects())
              {
                -[PRPosterConfiguredProperties ambientWidgetLayout](self, "ambientWidgetLayout");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                -[PRPosterConfiguredProperties ambientWidgetLayout](v7, "ambientWidgetLayout");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = BSEqualObjects() ^ 1;

              }
              else
              {
                v26 = 1;
              }

              v23 = v30;
            }
            else
            {
              v26 = 1;
            }

          }
          else
          {
            v26 = 1;
          }

          if (!v26)
            goto LABEL_10;
        }
        else
        {

        }
      }
      v17 = 0;
      goto LABEL_31;
    }
    v17 = 0;
  }
LABEL_37:

  return v17;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  unint64_t v26;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterConfiguredProperties titleStyleConfiguration](self, "titleStyleConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  -[PRPosterConfiguredProperties focusConfiguration](self, "focusConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:", v6);

  -[PRPosterConfiguredProperties complicationLayout](self, "complicationLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:", v8);

  -[PRPosterConfiguredProperties renderingConfiguration](self, "renderingConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendObject:", v10);

  -[PRPosterConfiguredProperties homeScreenConfiguration](self, "homeScreenConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v3, "appendObject:", v12);

  -[PRPosterConfiguredProperties colorVariationsConfiguration](self, "colorVariationsConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v3, "appendObject:", v14);

  -[PRPosterConfiguredProperties quickActionsConfiguration](self, "quickActionsConfiguration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v3, "appendObject:", v16);

  -[PRPosterConfiguredProperties ambientConfiguration](self, "ambientConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v3, "appendObject:", v18);

  -[PRPosterConfiguredProperties ambientWidgetLayout](self, "ambientWidgetLayout");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (id)objc_msgSend(v3, "appendObject:", v20);

  -[PRPosterConfiguredProperties suggestionMetadata](self, "suggestionMetadata");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (id)objc_msgSend(v3, "appendObject:", v22);

  -[PRPosterConfiguredProperties otherMetadata](self, "otherMetadata");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (id)objc_msgSend(v3, "appendObject:", v24);

  v26 = objc_msgSend(v3, "hash");
  return v26;
}

- (NSString)description
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  PRPosterConfiguredProperties *v11;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x1E0D01750]);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __43__PRPosterConfiguredProperties_description__block_invoke;
  v10 = &unk_1E2183900;
  v11 = self;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

uint64_t __43__PRPosterConfiguredProperties_description__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendDescriptionToFormatter:", *(_QWORD *)(a1 + 40));
}

- (id)persistenceIdentifierWithComplications:(BOOL)a3
{
  void *v3;
  _BOOL4 v4;
  NSString *persistenceIdentifierWithComplications;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  void *v56;
  _BYTE v57[128];
  uint64_t v58;

  v4 = a3;
  v58 = *MEMORY[0x1E0C80C00];
  if (-[PRPosterConfiguredProperties _isImmutable](self, "_isImmutable"))
  {
    if (v4)
    {
      persistenceIdentifierWithComplications = self->_persistenceIdentifierWithComplications;
      if (persistenceIdentifierWithComplications)
        return persistenceIdentifierWithComplications;
    }
    else
    {
      persistenceIdentifierWithComplications = self->_persistenceIdentifierWithoutComplications;
      if (persistenceIdentifierWithComplications)
        return persistenceIdentifierWithComplications;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterConfiguredProperties titleStyleConfiguration](self, "titleStyleConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "titleColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10
    || (objc_msgSend(v9, "isUserConfigured") & 1) == 0
    && (+[PRPosterTitleStyleConfiguration defaultTitleColor](PRPosterTitleStyleConfiguration, "defaultTitleColor"), (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v11);

  }
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  objc_msgSend(v9, "timeFontConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uniqueIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    +[PRPosterTimeFontConfiguration defaultConfiguration](PRPosterTimeFontConfiguration, "defaultConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v56 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {

  }
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v51 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(v8, "addObject:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
    }
    while (v17);
  }

  if (v4)
  {
    -[PRPosterConfiguredProperties complicationLayout](self, "complicationLayout");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "inlineComplication");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      -[PRPosterConfiguredProperties complicationLayout](self, "complicationLayout");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "inlineComplication");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      PersistentIdentifierForPRSWidget(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v24);

    }
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    -[PRPosterConfiguredProperties complicationLayout](self, "complicationLayout");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "complications");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v47;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v47 != v29)
            objc_enumerationMutation(v26);
          PersistentIdentifierForPRSWidget(*(void **)(*((_QWORD *)&v46 + 1) + 8 * j));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v31);

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
      }
      while (v28);
    }

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    -[PRPosterConfiguredProperties complicationLayout](self, "complicationLayout", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "sidebarComplications");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v43;
      do
      {
        for (k = 0; k != v35; ++k)
        {
          if (*(_QWORD *)v43 != v36)
            objc_enumerationMutation(v33);
          PersistentIdentifierForPRSWidget(*(void **)(*((_QWORD *)&v42 + 1) + 8 * k));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v38);

        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
      }
      while (v35);
    }

  }
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR("_"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "pf_sha256Hash");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PRPosterConfiguredProperties _isImmutable](self, "_isImmutable"))
  {
    v41 = 16;
    if (v4)
      v41 = 8;
    objc_storeStrong((id *)((char *)&self->super.isa + v41), v40);
  }

  return v40;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (PRPosterConfiguredProperties)initWithBSXPCCoder:(id)a3
{
  id v3;
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
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  PRPosterConfiguredProperties *v26;
  void *v27;
  void *v28;

  v3 = a3;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v4, CFSTR("titleStyleConfiguration"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v5, CFSTR("focusConfiguration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v7, CFSTR("complicationLayout"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v8, CFSTR("renderingConfiguration"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v10, CFSTR("homeScreenConfiguration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v12, CFSTR("colorVariationsConfiguration"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v13, CFSTR("quickActionsConfiguration"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v15, CFSTR("ambientConfiguration"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v17, CFSTR("suggestionMetadata"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v19, CFSTR("otherMetadata"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v21, CFSTR("ambientWidgetLayout"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = -[PRPosterConfiguredProperties initWithTitleStyleConfiguration:focusConfiguration:complicationLayout:renderingConfiguration:homeScreenConfiguration:colorVariationsConfiguration:quickActionsConfiguration:ambientConfiguration:ambientWidgetLayout:suggestionMetadata:otherMetadata:](self, "initWithTitleStyleConfiguration:focusConfiguration:complicationLayout:renderingConfiguration:homeScreenConfiguration:colorVariationsConfiguration:quickActionsConfiguration:ambientConfiguration:ambientWidgetLayout:suggestionMetadata:otherMetadata:", v28, v6, v27, v9, v11, v24, v14, v16, v22, v18, v20);
  return v26;
}

- (void)encodeWithBSXPCCoder:(id)a3
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
  id v15;

  v4 = a3;
  -[PRPosterConfiguredProperties titleStyleConfiguration](self, "titleStyleConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("titleStyleConfiguration"));

  -[PRPosterConfiguredProperties focusConfiguration](self, "focusConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("focusConfiguration"));

  -[PRPosterConfiguredProperties complicationLayout](self, "complicationLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("complicationLayout"));

  -[PRPosterConfiguredProperties renderingConfiguration](self, "renderingConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("renderingConfiguration"));

  -[PRPosterConfiguredProperties homeScreenConfiguration](self, "homeScreenConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("homeScreenConfiguration"));

  -[PRPosterConfiguredProperties colorVariationsConfiguration](self, "colorVariationsConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("colorVariationsConfiguration"));

  -[PRPosterConfiguredProperties quickActionsConfiguration](self, "quickActionsConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("quickActionsConfiguration"));

  -[PRPosterConfiguredProperties ambientConfiguration](self, "ambientConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("ambientConfiguration"));

  -[PRPosterConfiguredProperties ambientWidgetLayout](self, "ambientWidgetLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("ambientWidgetLayout"));

  -[PRPosterConfiguredProperties suggestionMetadata](self, "suggestionMetadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("suggestionMetadata"));

  -[PRPosterConfiguredProperties otherMetadata](self, "otherMetadata");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("otherMetadata"));

}

- (void)appendDescriptionToFormatter:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v26;

  v26 = a3;
  -[PRPosterConfiguredProperties titleStyleConfiguration](self, "titleStyleConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v26, "appendObject:withName:", v4, CFSTR("titleStyleConfiguration"));

  -[PRPosterConfiguredProperties focusConfiguration](self, "focusConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v26, "appendObject:withName:", v6, CFSTR("focusConfiguration"));

  -[PRPosterConfiguredProperties complicationLayout](self, "complicationLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v26, "appendObject:withName:", v8, CFSTR("complicationLayout"));

  -[PRPosterConfiguredProperties renderingConfiguration](self, "renderingConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v26, "appendObject:withName:", v10, CFSTR("renderingConfiguration"));

  -[PRPosterConfiguredProperties homeScreenConfiguration](self, "homeScreenConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v26, "appendObject:withName:", v12, CFSTR("homeScreenConfiguration"));

  -[PRPosterConfiguredProperties colorVariationsConfiguration](self, "colorVariationsConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v26, "appendObject:withName:", v14, CFSTR("colorVariationsConfiguration"));

  -[PRPosterConfiguredProperties quickActionsConfiguration](self, "quickActionsConfiguration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v26, "appendObject:withName:", v16, CFSTR("quickActionsConfiguration"));

  -[PRPosterConfiguredProperties ambientConfiguration](self, "ambientConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v26, "appendObject:withName:", v18, CFSTR("ambientConfiguration"));

  -[PRPosterConfiguredProperties suggestionMetadata](self, "suggestionMetadata");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (id)objc_msgSend(v26, "appendObject:withName:", v20, CFSTR("suggestionMetadata"));

  -[PRPosterConfiguredProperties otherMetadata](self, "otherMetadata");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (id)objc_msgSend(v26, "appendObject:withName:", v22, CFSTR("otherMetadata"));

  -[PRPosterConfiguredProperties ambientWidgetLayout](self, "ambientWidgetLayout");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (id)objc_msgSend(v26, "appendObject:withName:", v24, CFSTR("ambientWidgetLayout"));

}

- (PRPosterTitleStyleConfiguration)titleStyleConfiguration
{
  return self->_titleStyleConfiguration;
}

- (void)setTitleStyleConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (PRPosterFocusConfiguration)focusConfiguration
{
  return self->_focusConfiguration;
}

- (void)setFocusConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (PRPosterComplicationLayout)complicationLayout
{
  return self->_complicationLayout;
}

- (void)setComplicationLayout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (PRPosterRenderingConfiguration)renderingConfiguration
{
  return self->_renderingConfiguration;
}

- (void)setRenderingConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setHomeScreenConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (PRPosterColorVariationsConfiguration)colorVariationsConfiguration
{
  return self->_colorVariationsConfiguration;
}

- (void)setColorVariationsConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (PRPosterQuickActionsConfiguration)quickActionsConfiguration
{
  return self->_quickActionsConfiguration;
}

- (void)setQuickActionsConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (PRPosterSuggestionMetadata)suggestionMetadata
{
  return self->_suggestionMetadata;
}

- (void)setSuggestionMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (PRPosterMetadata)otherMetadata
{
  return self->_otherMetadata;
}

- (void)setOtherMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (PRPosterAmbientConfiguration)ambientConfiguration
{
  return self->_ambientConfiguration;
}

- (void)setAmbientConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (PRPosterAmbientWidgetLayout)ambientWidgetLayout
{
  return self->_ambientWidgetLayout;
}

- (void)setAmbientWidgetLayout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ambientWidgetLayout, 0);
  objc_storeStrong((id *)&self->_ambientConfiguration, 0);
  objc_storeStrong((id *)&self->_otherMetadata, 0);
  objc_storeStrong((id *)&self->_suggestionMetadata, 0);
  objc_storeStrong((id *)&self->_quickActionsConfiguration, 0);
  objc_storeStrong((id *)&self->_colorVariationsConfiguration, 0);
  objc_storeStrong((id *)&self->_homeScreenConfiguration, 0);
  objc_storeStrong((id *)&self->_renderingConfiguration, 0);
  objc_storeStrong((id *)&self->_complicationLayout, 0);
  objc_storeStrong((id *)&self->_focusConfiguration, 0);
  objc_storeStrong((id *)&self->_titleStyleConfiguration, 0);
  objc_storeStrong((id *)&self->_persistenceIdentifierWithoutComplications, 0);
  objc_storeStrong((id *)&self->_persistenceIdentifierWithComplications, 0);
}

@end
