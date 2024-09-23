@implementation UIFontPickerViewControllerConfiguration

- (BOOL)_matchesLanguageList:(id)a3
{
  uint64_t v4;
  UIFontPickerViewControllerConfiguration *v5;
  char v6;

  if (a3)
    v4 = sub_186507654();
  else
    v4 = 0;
  v5 = self;
  v6 = sub_18569D578(v4);

  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (id)_serializedPredicate
{
  UIFontPickerViewControllerConfiguration *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;

  v2 = self;
  v3 = sub_18569D878();
  v5 = v4;

  if (v5 >> 60 == 15)
  {
    v6 = 0;
  }
  else
  {
    v6 = (void *)sub_186506B44();
    sub_1855B0EFC(v3, v5);
  }
  return v6;
}

- (void)_setPredicateFromData:(id)a3
{
  void *v3;
  UIFontPickerViewControllerConfiguration *v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  UIFontPickerViewControllerConfiguration *v8;

  v3 = a3;
  if (a3)
  {
    v4 = self;
    v5 = v3;
    v3 = (void *)sub_186506B50();
    v7 = v6;

  }
  else
  {
    v8 = self;
    v7 = 0xF000000000000000;
  }
  sub_18569DA88((uint64_t)v3, v7);
  sub_1855B0EFC((uint64_t)v3, v7);

}

- (id)copyWithZone:(_NSZone *)a3
{
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

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setIncludeFaces:", -[UIFontPickerViewControllerConfiguration includeFaces](self, "includeFaces"));
  objc_msgSend(v5, "setDisplayUsingSystemFont:", -[UIFontPickerViewControllerConfiguration displayUsingSystemFont](self, "displayUsingSystemFont"));
  objc_msgSend(v5, "setFilteredTraits:", -[UIFontPickerViewControllerConfiguration filteredTraits](self, "filteredTraits"));
  -[UIFontPickerViewControllerConfiguration filteredLanguagesPredicate](self, "filteredLanguagesPredicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setFilteredLanguagesPredicate:", v7);

  -[UIFontPickerViewControllerConfiguration _allowedLanguages](self, "_allowedLanguages");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "set_allowedLanguages:", v9);

  -[UIFontPickerViewControllerConfiguration _swiftPredicate](self, "_swiftPredicate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "set_swiftPredicate:", v11);

  objc_msgSend(v5, "_setHideSearchBar:", -[UIFontPickerViewControllerConfiguration _hideSearchBar](self, "_hideSearchBar"));
  -[UIFontPickerViewControllerConfiguration _tintColor](self, "_tintColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
  objc_msgSend(v5, "_setTintColor:", v13);

  objc_msgSend(v5, "set_includeDefaultFont:", -[UIFontPickerViewControllerConfiguration _includeDefaultFont](self, "_includeDefaultFont"));
  -[UIFontPickerViewControllerConfiguration _filterFamilyName](self, "_filterFamilyName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "set_filterFamilyName:", v14);

  objc_msgSend(v5, "set_showsSectionIndexBar:", -[UIFontPickerViewControllerConfiguration _showsSectionIndexBar](self, "_showsSectionIndexBar"));
  -[UIFontPickerViewControllerConfiguration _clientFontContextEndpoint](self, "_clientFontContextEndpoint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "set_clientFontContextEndpoint:", v15);

  -[UIFontPickerViewControllerConfiguration _clientRecentFonts](self, "_clientRecentFonts");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setClientRecentFonts:", v16);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  UIFontPickerViewControllerConfiguration *v7;
  UIFontPickerViewControllerConfiguration *v8;
  _BOOL4 v9;
  _BOOL4 v10;
  UIFontDescriptorSymbolicTraits v11;
  void *v12;
  int v13;
  char v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  void *v70;
  void *v71;

  v7 = (UIFontPickerViewControllerConfiguration *)a3;
  if (v7 == self)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;
      v9 = -[UIFontPickerViewControllerConfiguration includeFaces](self, "includeFaces");
      if (v9 != -[UIFontPickerViewControllerConfiguration includeFaces](v8, "includeFaces")
        || (v10 = -[UIFontPickerViewControllerConfiguration displayUsingSystemFont](self, "displayUsingSystemFont"),
            v10 != -[UIFontPickerViewControllerConfiguration displayUsingSystemFont](v8, "displayUsingSystemFont"))
        || (v11 = -[UIFontPickerViewControllerConfiguration filteredTraits](self, "filteredTraits"),
            v11 != -[UIFontPickerViewControllerConfiguration filteredTraits](v8, "filteredTraits")))
      {
        v14 = 0;
LABEL_13:

        goto LABEL_14;
      }
      -[UIFontPickerViewControllerConfiguration filteredLanguagesPredicate](self, "filteredLanguagesPredicate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12
        || (-[UIFontPickerViewControllerConfiguration filteredLanguagesPredicate](v8, "filteredLanguagesPredicate"),
            (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[UIFontPickerViewControllerConfiguration filteredLanguagesPredicate](self, "filteredLanguagesPredicate");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIFontPickerViewControllerConfiguration filteredLanguagesPredicate](v8, "filteredLanguagesPredicate");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v4))
        {
          v14 = 0;
LABEL_54:

LABEL_55:
          if (!v12)

          goto LABEL_13;
        }
        v13 = 1;
      }
      else
      {
        v13 = 0;
      }
      -[UIFontPickerViewControllerConfiguration _allowedLanguages](self, "_allowedLanguages");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16
        || (-[UIFontPickerViewControllerConfiguration _allowedLanguages](v8, "_allowedLanguages"),
            (v66 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[UIFontPickerViewControllerConfiguration _allowedLanguages](self, "_allowedLanguages");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIFontPickerViewControllerConfiguration _allowedLanguages](v8, "_allowedLanguages");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v17, "isEqualToArray:"))
        {
          v14 = 0;
          goto LABEL_50;
        }
        v65 = v17;
        v69 = 1;
      }
      else
      {
        v66 = 0;
        v69 = 0;
      }
      -[UIFontPickerViewControllerConfiguration _swiftPredicate](self, "_swiftPredicate");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v70)
      {
        -[UIFontPickerViewControllerConfiguration _swiftPredicate](v8, "_swiftPredicate");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v62)
        {
          LODWORD(v63) = v13;
          v24 = v5;
          v62 = 0;
          v64 = 0;
LABEL_34:
          v25 = -[UIFontPickerViewControllerConfiguration _hideSearchBar](self, "_hideSearchBar");
          if (v25 != -[UIFontPickerViewControllerConfiguration _hideSearchBar](v8, "_hideSearchBar"))
          {
            v14 = 0;
            v5 = v24;
            goto LABEL_44;
          }
          -[UIFontPickerViewControllerConfiguration _tintColor](self, "_tintColor");
          v5 = v24;
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          if (v68
            || (-[UIFontPickerViewControllerConfiguration _tintColor](v8, "_tintColor"),
                (v58 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            -[UIFontPickerViewControllerConfiguration _tintColor](self, "_tintColor");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIFontPickerViewControllerConfiguration _tintColor](v8, "_tintColor");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v26, "isEqual:", v27) & 1) == 0)
            {

              if (v68)
              else

              v14 = 0;
LABEL_44:
              v13 = (int)v63;
              if ((v64 & 1) == 0)
              {
LABEL_46:
                if (!v70)

                if (!v69)
                {
LABEL_51:
                  if (!v16)

                  if (!v13)
                    goto LABEL_55;
                  goto LABEL_54;
                }
                v17 = v65;
LABEL_50:

                goto LABEL_51;
              }
LABEL_45:

              goto LABEL_46;
            }
            v56 = v27;
            v57 = v26;
            v24 = v5;
            v59 = 1;
          }
          else
          {
            v58 = 0;
            v59 = 0;
          }
          v28 = -[UIFontPickerViewControllerConfiguration _includeDefaultFont](self, "_includeDefaultFont");
          if (v28 != -[UIFontPickerViewControllerConfiguration _includeDefaultFont](v8, "_includeDefaultFont"))
          {
            v14 = 0;
            v5 = v24;
            v13 = (int)v63;
            goto LABEL_80;
          }
          -[UIFontPickerViewControllerConfiguration _filterFamilyName](self, "_filterFamilyName");
          v5 = v24;
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          if (v55
            || (-[UIFontPickerViewControllerConfiguration _filterFamilyName](v8, "_filterFamilyName"),
                (v53 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            -[UIFontPickerViewControllerConfiguration _filterFamilyName](self, "_filterFamilyName");
            v29 = objc_claimAutoreleasedReturnValue();
            v13 = (int)v63;
            if (!v29)
            {
              v14 = 0;
              goto LABEL_100;
            }
            v54 = (void *)v29;
            -[UIFontPickerViewControllerConfiguration _filterFamilyName](v8, "_filterFamilyName");
            v30 = objc_claimAutoreleasedReturnValue();
            if (v30)
            {
              v52 = (void *)v30;
              -[UIFontPickerViewControllerConfiguration _filterFamilyName](self, "_filterFamilyName");
              v31 = objc_claimAutoreleasedReturnValue();
              -[UIFontPickerViewControllerConfiguration _filterFamilyName](v8, "_filterFamilyName");
              v32 = objc_claimAutoreleasedReturnValue();
              v51 = (void *)v31;
              v33 = (void *)v31;
              v34 = (void *)v32;
              if ((objc_msgSend(v33, "isEqualToString:", v32) & 1) != 0)
              {
                v48 = v34;
                v50 = v5;
                v49 = 1;
                goto LABEL_72;
              }

            }
            if (v55)

            else
            v14 = 0;
LABEL_80:
            if ((v59 & 1) == 0)
              goto LABEL_82;
            goto LABEL_81;
          }
          v50 = v24;
          v53 = 0;
          v49 = 0;
          v13 = (int)v63;
LABEL_72:
          v35 = -[UIFontPickerViewControllerConfiguration _showsSectionIndexBar](self, "_showsSectionIndexBar");
          if (v35 != -[UIFontPickerViewControllerConfiguration _showsSectionIndexBar](v8, "_showsSectionIndexBar"))
          {
            v14 = 0;
            goto LABEL_98;
          }
          -[UIFontPickerViewControllerConfiguration _clientFontContextEndpoint](self, "_clientFontContextEndpoint");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (v36
            || (-[UIFontPickerViewControllerConfiguration _clientFontContextEndpoint](v8, "_clientFontContextEndpoint"),
                (v45 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            -[UIFontPickerViewControllerConfiguration _clientFontContextEndpoint](self, "_clientFontContextEndpoint");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIFontPickerViewControllerConfiguration _clientFontContextEndpoint](v8, "_clientFontContextEndpoint");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v37, "isEqual:") & 1) == 0)
            {
              v14 = 0;
              goto LABEL_90;
            }
            v47 = v36;
            v46 = 1;
            -[UIFontPickerViewControllerConfiguration _clientRecentFonts](self, "_clientRecentFonts", v37);
          }
          else
          {
            v47 = 0;
            v45 = 0;
            v46 = 0;
            -[UIFontPickerViewControllerConfiguration _clientRecentFonts](self, "_clientRecentFonts", v43);
          }
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIFontPickerViewControllerConfiguration _clientRecentFonts](v8, "_clientRecentFonts");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v39, "isEqual:", v40);

          if (!v46)
          {
            if (v47)
              v41 = v47;
            else
              v41 = v45;

LABEL_98:
            v5 = v50;
            if ((v49 & 1) == 0)
              goto LABEL_100;
            goto LABEL_99;
          }
          v36 = v47;
          v37 = v44;
LABEL_90:

          if (!v36)
          v5 = v50;
          if (!v49)
          {
LABEL_100:
            v42 = v55;
            if (!v55)
            {

              v42 = 0;
            }

            if (!v59)
            {
LABEL_82:
              v38 = v68;
              if (!v68)
              {

                v38 = 0;
              }

              if (!v64)
                goto LABEL_46;
              goto LABEL_45;
            }
LABEL_81:

            goto LABEL_82;
          }
LABEL_99:

          goto LABEL_100;
        }
      }
      v67 = v12;
      v18 = v4;
      v19 = v16;
      v20 = v3;
      v21 = v13;
      -[UIFontPickerViewControllerConfiguration _serializedPredicate](self, "_serializedPredicate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIFontPickerViewControllerConfiguration _serializedPredicate](v8, "_serializedPredicate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v22, "isEqualToData:", v23) & 1) != 0)
      {
        v60 = v22;
        v61 = v23;
        LODWORD(v63) = v21;
        v24 = v5;
        v64 = 1;
        v3 = v20;
        v16 = v19;
        v4 = v18;
        v12 = v67;
        goto LABEL_34;
      }

      if (v70)
      {

        v14 = 0;
        v13 = v21;
        if ((v69 & 1) != 0)
        {
          v17 = v65;
LABEL_31:
          v3 = v20;
          v16 = v19;
          v4 = v18;
          v12 = v67;
          goto LABEL_50;
        }
      }
      else
      {

        v14 = 0;
        v17 = v65;
        v13 = v21;
        if ((v69 & 1) != 0)
          goto LABEL_31;
      }
      v3 = v20;
      v16 = v19;
      v4 = v18;
      v12 = v67;
      goto LABEL_51;
    }
    v14 = 0;
  }
LABEL_14:

  return v14;
}

+ (BOOL)supportsSecureCoding
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
  id v10;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[UIFontPickerViewControllerConfiguration includeFaces](self, "includeFaces"), CFSTR("IncludesFaces"));
  objc_msgSend(v4, "encodeBool:forKey:", -[UIFontPickerViewControllerConfiguration displayUsingSystemFont](self, "displayUsingSystemFont"), CFSTR("DisplaySystemFont"));
  objc_msgSend(v4, "encodeInt32:forKey:", -[UIFontPickerViewControllerConfiguration filteredTraits](self, "filteredTraits"), CFSTR("FilteredTraits"));
  -[UIFontPickerViewControllerConfiguration _allowedLanguages](self, "_allowedLanguages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("AllowedLanguages"));

  -[UIFontPickerViewControllerConfiguration _serializedPredicate](self, "_serializedPredicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("SerializedPredicate"));

  objc_msgSend(v4, "encodeBool:forKey:", -[UIFontPickerViewControllerConfiguration _hideSearchBar](self, "_hideSearchBar"), CFSTR("HideSearchBar"));
  -[UIFontPickerViewControllerConfiguration _tintColor](self, "_tintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("TintColor"));

  objc_msgSend(v4, "encodeBool:forKey:", -[UIFontPickerViewControllerConfiguration _includeDefaultFont](self, "_includeDefaultFont"), CFSTR("IncludesDefaultFont"));
  -[UIFontPickerViewControllerConfiguration _filterFamilyName](self, "_filterFamilyName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("FilterFamilyNameCodingKey"));

  objc_msgSend(v4, "encodeBool:forKey:", -[UIFontPickerViewControllerConfiguration _showsSectionIndexBar](self, "_showsSectionIndexBar"), CFSTR("ShowsSectionIndexBarCodingKey"));
  -[UIFontPickerViewControllerConfiguration _clientFontContextEndpoint](self, "_clientFontContextEndpoint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("ClientFontContextEndpointCodingKey"));

  -[UIFontPickerViewControllerConfiguration _clientRecentFonts](self, "_clientRecentFonts");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("ClientRecentFontsCodingKey"));

}

- (UIFontPickerViewControllerConfiguration)initWithCoder:(id)a3
{
  id v4;
  UIFontPickerViewControllerConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UIFontPickerViewControllerConfiguration;
  v5 = -[UIFontPickerViewControllerConfiguration init](&v14, sel_init);
  if (v5)
  {
    -[UIFontPickerViewControllerConfiguration setIncludeFaces:](v5, "setIncludeFaces:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IncludesFaces")));
    -[UIFontPickerViewControllerConfiguration setDisplayUsingSystemFont:](v5, "setDisplayUsingSystemFont:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DisplaySystemFont")));
    -[UIFontPickerViewControllerConfiguration setFilteredTraits:](v5, "setFilteredTraits:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("FilteredTraits")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AllowedLanguages"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIFontPickerViewControllerConfiguration set_allowedLanguages:](v5, "set_allowedLanguages:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SerializedPredicate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIFontPickerViewControllerConfiguration _setPredicateFromData:](v5, "_setPredicateFromData:", v7);

    -[UIFontPickerViewControllerConfiguration _setHideSearchBar:](v5, "_setHideSearchBar:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HideSearchBar")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TintColor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIFontPickerViewControllerConfiguration _setTintColor:](v5, "_setTintColor:", v8);

    -[UIFontPickerViewControllerConfiguration set_includeDefaultFont:](v5, "set_includeDefaultFont:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IncludesDefaultFont")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FilterFamilyNameCodingKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIFontPickerViewControllerConfiguration set_filterFamilyName:](v5, "set_filterFamilyName:", v9);

    -[UIFontPickerViewControllerConfiguration set_showsSectionIndexBar:](v5, "set_showsSectionIndexBar:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ShowsSectionIndexBarCodingKey")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ClientFontContextEndpointCodingKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIFontPickerViewControllerConfiguration set_clientFontContextEndpoint:](v5, "set_clientFontContextEndpoint:", v10);

    if (qword_1ECD7F4E8 != -1)
      dispatch_once(&qword_1ECD7F4E8, &__block_literal_global_404);
    v11 = (id)_MergedGlobals_1168;
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("ClientRecentFontsCodingKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIFontPickerViewControllerConfiguration _setClientRecentFonts:](v5, "_setClientRecentFonts:", v12);

  }
  return v5;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[UIFontPickerViewControllerConfiguration includeFaces](self, "includeFaces"), CFSTR("IncludesFaces"));
  objc_msgSend(v4, "encodeBool:forKey:", -[UIFontPickerViewControllerConfiguration displayUsingSystemFont](self, "displayUsingSystemFont"), CFSTR("DisplaySystemFont"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[UIFontPickerViewControllerConfiguration filteredTraits](self, "filteredTraits"), CFSTR("FilteredTraits"));
  -[UIFontPickerViewControllerConfiguration _allowedLanguages](self, "_allowedLanguages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeCollection:forKey:", v5, CFSTR("AllowedLanguages"));

  -[UIFontPickerViewControllerConfiguration _serializedPredicate](self, "_serializedPredicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("SerializedPredicate"));

  objc_msgSend(v4, "encodeBool:forKey:", -[UIFontPickerViewControllerConfiguration _hideSearchBar](self, "_hideSearchBar"), CFSTR("HideSearchBar"));
  -[UIFontPickerViewControllerConfiguration _tintColor](self, "_tintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("TintColor"));

  objc_msgSend(v4, "encodeBool:forKey:", -[UIFontPickerViewControllerConfiguration _includeDefaultFont](self, "_includeDefaultFont"), CFSTR("IncludesDefaultFont"));
  -[UIFontPickerViewControllerConfiguration _filterFamilyName](self, "_filterFamilyName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("FilterFamilyNameCodingKey"));

  objc_msgSend(v4, "encodeBool:forKey:", -[UIFontPickerViewControllerConfiguration _showsSectionIndexBar](self, "_showsSectionIndexBar"), CFSTR("ShowsSectionIndexBarCodingKey"));
  -[UIFontPickerViewControllerConfiguration _clientFontContextEndpoint](self, "_clientFontContextEndpoint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("ClientFontContextEndpointCodingKey"));

  -[UIFontPickerViewControllerConfiguration _clientRecentFonts](self, "_clientRecentFonts");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeCollection:forKey:", v10, CFSTR("ClientRecentFontsCodingKey"));

}

- (UIFontPickerViewControllerConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4;
  UIFontPickerViewControllerConfiguration *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UIFontPickerViewControllerConfiguration;
  v5 = -[UIFontPickerViewControllerConfiguration init](&v15, sel_init);
  if (v5)
  {
    -[UIFontPickerViewControllerConfiguration setIncludeFaces:](v5, "setIncludeFaces:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IncludesFaces")));
    -[UIFontPickerViewControllerConfiguration setDisplayUsingSystemFont:](v5, "setDisplayUsingSystemFont:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DisplaySystemFont")));
    -[UIFontPickerViewControllerConfiguration setFilteredTraits:](v5, "setFilteredTraits:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("FilteredTraits")));
    v6 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v6, objc_opt_class(), CFSTR("AllowedLanguages"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIFontPickerViewControllerConfiguration set_allowedLanguages:](v5, "set_allowedLanguages:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SerializedPredicate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIFontPickerViewControllerConfiguration _setPredicateFromData:](v5, "_setPredicateFromData:", v8);

    -[UIFontPickerViewControllerConfiguration _setHideSearchBar:](v5, "_setHideSearchBar:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HideSearchBar")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TintColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIFontPickerViewControllerConfiguration _setTintColor:](v5, "_setTintColor:", v9);

    -[UIFontPickerViewControllerConfiguration set_includeDefaultFont:](v5, "set_includeDefaultFont:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IncludesDefaultFont")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FilterFamilyNameCodingKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIFontPickerViewControllerConfiguration set_filterFamilyName:](v5, "set_filterFamilyName:", v10);

    -[UIFontPickerViewControllerConfiguration set_showsSectionIndexBar:](v5, "set_showsSectionIndexBar:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ShowsSectionIndexBarCodingKey")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ClientFontContextEndpointCodingKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIFontPickerViewControllerConfiguration set_clientFontContextEndpoint:](v5, "set_clientFontContextEndpoint:", v11);

    v12 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v12, objc_opt_class(), CFSTR("ClientRecentFontsCodingKey"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIFontPickerViewControllerConfiguration _setClientRecentFonts:](v5, "_setClientRecentFonts:", v13);

  }
  return v5;
}

+ (NSPredicate)filterPredicateForFilteredLanguages:(NSArray *)filteredLanguages
{
  NSArray *v3;
  void *v4;

  v3 = filteredLanguages;
  if (-[NSArray count](v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY %@ IN SELF"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSPredicate *)v4;
}

- (void)setFilteredLanguagesPredicate:(NSPredicate *)filteredLanguagesPredicate
{
  void *v5;
  void *v6;
  void *v7;
  NSPredicate *v8;

  v8 = filteredLanguagesPredicate;
  objc_storeStrong((id *)&self->_filteredLanguagesPredicate, filteredLanguagesPredicate);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "supportedLanguages");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "filteredArrayUsingPredicate:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIFontPickerViewControllerConfiguration set_allowedLanguages:](self, "set_allowedLanguages:", v7);

  }
  else
  {
    -[UIFontPickerViewControllerConfiguration set_allowedLanguages:](self, "set_allowedLanguages:", 0);
  }

}

- (NSString)debugDescription
{
  return (NSString *)-[UIFontPickerViewControllerConfiguration debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", &stru_1E16EDF20);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[UIFontPickerViewControllerConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", self->_includeFaces, CFSTR("includeFaces"));
  v5 = (id)objc_msgSend(v3, "appendBool:withName:", self->_displayUsingSystemFont, CFSTR("displayUsingSystemFont"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[UIFontPickerViewControllerConfiguration descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[UIFontPickerViewControllerConfiguration descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  UIFontPickerViewControllerConfiguration *v13;

  v4 = (void *)MEMORY[0x1E0D01748];
  v5 = a3;
  objc_msgSend(v4, "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActiveMultilinePrefix:", v5);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81__UIFontPickerViewControllerConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke;
  v11[3] = &unk_1E16B1B50;
  v7 = v6;
  v12 = v7;
  v13 = self;
  v8 = (id)objc_msgSend(v7, "modifyBody:", v11);
  v9 = v7;

  return v9;
}

void __81__UIFontPickerViewControllerConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "activeMultilinePrefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __81__UIFontPickerViewControllerConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E16B1B50;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v2, "appendBodySectionWithName:multilinePrefix:block:", 0, v3, v6);

}

void __81__UIFontPickerViewControllerConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("includeFaces"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 9), CFSTR("displayUsingSystemFont"));
  v4 = *(void **)(a1 + 32);
  _UIFontDescriptorDescriptionForSymbolicTraits(*(_DWORD *)(*(_QWORD *)(a1 + 40) + 16));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v5, CFSTR("filteredTraits"));

  v6 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v6, "description");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendString:withName:", v8, CFSTR("filteredLanguagesPredicate"));

  }
}

- (BOOL)includeFaces
{
  return self->_includeFaces;
}

- (void)setIncludeFaces:(BOOL)includeFaces
{
  self->_includeFaces = includeFaces;
}

- (BOOL)displayUsingSystemFont
{
  return self->_displayUsingSystemFont;
}

- (void)setDisplayUsingSystemFont:(BOOL)displayUsingSystemFont
{
  self->_displayUsingSystemFont = displayUsingSystemFont;
}

- (UIFontDescriptorSymbolicTraits)filteredTraits
{
  return self->_filteredTraits;
}

- (void)setFilteredTraits:(UIFontDescriptorSymbolicTraits)filteredTraits
{
  self->_filteredTraits = filteredTraits;
}

- (NSPredicate)filteredLanguagesPredicate
{
  return self->_filteredLanguagesPredicate;
}

- (NSArray)_allowedLanguages
{
  return self->__allowedLanguages;
}

- (void)set_allowedLanguages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)_swiftPredicate
{
  return self->__swiftPredicate;
}

- (void)set_swiftPredicate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)_hideSearchBar
{
  return self->__hideSearchBar;
}

- (void)_setHideSearchBar:(BOOL)a3
{
  self->__hideSearchBar = a3;
}

- (UIColor)_tintColor
{
  return self->__tintColor;
}

- (void)_setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->__tintColor, a3);
}

- (BOOL)_includeDefaultFont
{
  return self->__includeDefaultFont;
}

- (void)set_includeDefaultFont:(BOOL)a3
{
  self->__includeDefaultFont = a3;
}

- (NSString)_filterFamilyName
{
  return self->__filterFamilyName;
}

- (void)set_filterFamilyName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)_showsSectionIndexBar
{
  return self->__showsSectionIndexBar;
}

- (void)set_showsSectionIndexBar:(BOOL)a3
{
  self->__showsSectionIndexBar = a3;
}

- (NSXPCListenerEndpoint)_clientFontContextEndpoint
{
  return self->__clientFontContextEndpoint;
}

- (void)set_clientFontContextEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->__clientFontContextEndpoint, a3);
}

- (NSArray)_clientRecentFonts
{
  return self->__clientRecentFonts;
}

- (void)_setClientRecentFonts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__clientRecentFonts, 0);
  objc_storeStrong((id *)&self->__clientFontContextEndpoint, 0);
  objc_storeStrong((id *)&self->__filterFamilyName, 0);
  objc_storeStrong((id *)&self->__tintColor, 0);
  objc_storeStrong(&self->__swiftPredicate, 0);
  objc_storeStrong((id *)&self->__allowedLanguages, 0);
  objc_storeStrong((id *)&self->_filteredLanguagesPredicate, 0);
}

@end
