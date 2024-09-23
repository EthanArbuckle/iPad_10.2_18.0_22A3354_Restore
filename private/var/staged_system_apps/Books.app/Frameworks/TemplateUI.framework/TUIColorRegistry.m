@implementation TUIColorRegistry

- (TUIColorRegistry)init
{
  TUIColorRegistry *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *colors;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
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
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  objc_super v75;

  v75.receiver = self;
  v75.super_class = (Class)TUIColorRegistry;
  v2 = -[TUIColorRegistry init](&v75, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableDictionary);
    colors = v2->_colors;
    v2->_colors = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v5, CFSTR("system-red"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v6, CFSTR("system-green"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v7, CFSTR("system-blue"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemOrangeColor](UIColor, "systemOrangeColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v8, CFSTR("system-orange"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemPinkColor](UIColor, "systemPinkColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v9, CFSTR("system-pink"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemPurpleColor](UIColor, "systemPurpleColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v10, CFSTR("system-purple"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemMintColor](UIColor, "systemMintColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v11, CFSTR("system-mint"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemCyanColor](UIColor, "systemCyanColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v12, CFSTR("system-cyan"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v13, CFSTR("system-gray"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBrownColor](UIColor, "systemBrownColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v14, CFSTR("system-brown"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemTealColor](UIColor, "systemTealColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v15, CFSTR("system-teal"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemIndigoColor](UIColor, "systemIndigoColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v16, CFSTR("system-indigo"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemYellowColor](UIColor, "systemYellowColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v17, CFSTR("system-yellow"));

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemMidGrayColor](UIColor, "systemMidGrayColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v18, CFSTR("system-mid-gray"));

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v19, CFSTR("system-white"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemExtraLightGrayColor](UIColor, "systemExtraLightGrayColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v20, CFSTR("system-extra-light-gray"));

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemLightGrayColor](UIColor, "systemLightGrayColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v21, CFSTR("system-light-gray"));

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemLightMidGrayColor](UIColor, "systemLightMidGrayColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v22, CFSTR("system-light-mid-gray"));

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlackColor](UIColor, "systemBlackColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v23, CFSTR("system-black"));

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemDarkRedColor](UIColor, "systemDarkRedColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v24, CFSTR("system-dark-red"));

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemDarkGreenColor](UIColor, "systemDarkGreenColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v25, CFSTR("system-dark-green"));

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemDarkBlueColor](UIColor, "systemDarkBlueColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v26, CFSTR("system-dark-blue"));

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemDarkOrangeColor](UIColor, "systemDarkOrangeColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v27, CFSTR("system-dark-orange"));

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemDarkYellowColor](UIColor, "systemDarkYellowColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v28, CFSTR("system-dark-yellow"));

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemDarkTealColor](UIColor, "systemDarkTealColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v29, CFSTR("system-dark-teal"));

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemDarkPinkColor](UIColor, "systemDarkPinkColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v30, CFSTR("system-dark-pink"));

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemDarkPurpleColor](UIColor, "systemDarkPurpleColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v31, CFSTR("system-dark-purple"));

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemDarkExtraLightGrayColor](UIColor, "systemDarkExtraLightGrayColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v32, CFSTR("system-dark-extra-light-gray"));

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemDarkLightGrayColor](UIColor, "systemDarkLightGrayColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v33, CFSTR("system-dark-light-gray"));

    v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemDarkLightMidGrayColor](UIColor, "systemDarkLightMidGrayColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v34, CFSTR("system-dark-light-mid-gray"));

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemDarkMidGrayColor](UIColor, "systemDarkMidGrayColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v35, CFSTR("system-dark-mid-gray"));

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemDarkGrayColor](UIColor, "systemDarkGrayColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v36, CFSTR("system-dark-gray"));

    v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGray2Color](UIColor, "systemGray2Color"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v37, CFSTR("system-gray-2"));

    v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGray3Color](UIColor, "systemGray3Color"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v38, CFSTR("system-gray-3"));

    v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGray4Color](UIColor, "systemGray4Color"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v39, CFSTR("system-gray-4"));

    v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGray5Color](UIColor, "systemGray5Color"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v40, CFSTR("system-gray-5"));

    v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGray6Color](UIColor, "systemGray6Color"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v41, CFSTR("system-gray-6"));

    v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor externalSystemTealColor](UIColor, "externalSystemTealColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v42, CFSTR("external-system-teal"));

    v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor externalSystemRedColor](UIColor, "externalSystemRedColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v43, CFSTR("external-system-red"));

    v44 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor externalSystemGreenColor](UIColor, "externalSystemGreenColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v44, CFSTR("external-system-green"));

    v45 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemExtraLightGrayTintColor](UIColor, "systemExtraLightGrayTintColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v45, CFSTR("system-extra-light-gray-tint"));

    v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemLightGrayTintColor](UIColor, "systemLightGrayTintColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v46, CFSTR("system-light-gray-tint"));

    v47 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemLightMidGrayTintColor](UIColor, "systemLightMidGrayTintColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v47, CFSTR("system-light-mid-gray-tint"));

    v48 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayTintColor](UIColor, "systemGrayTintColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v48, CFSTR("system-gray-tint"));

    v49 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemMidGrayTintColor](UIColor, "systemMidGrayTintColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v49, CFSTR("system-mid-gray-tint"));

    v50 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemDarkExtraLightGrayTintColor](UIColor, "systemDarkExtraLightGrayTintColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v50, CFSTR("system-dark-extra-light-gray-tint"));

    v51 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemDarkLightGrayTintColor](UIColor, "systemDarkLightGrayTintColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v51, CFSTR("system-dark-light-gray-tint"));

    v52 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemDarkLightMidGrayTintColor](UIColor, "systemDarkLightMidGrayTintColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v52, CFSTR("system-dark-light-mid-gray-tint"));

    v53 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemDarkMidGrayTintColor](UIColor, "systemDarkMidGrayTintColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v53, CFSTR("system-dark-mid-gray-tint"));

    v54 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemDarkGrayTintColor](UIColor, "systemDarkGrayTintColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v54, CFSTR("system-dark-gray-tint"));

    v55 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v55, CFSTR("label"));

    v56 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v56, CFSTR("secondary-label"));

    v57 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v57, CFSTR("tertiary-label"));

    v58 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor quaternaryLabelColor](UIColor, "quaternaryLabelColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v58, CFSTR("quaternary-label"));

    v59 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor linkColor](UIColor, "linkColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v59, CFSTR("link"));

    v60 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor placeholderTextColor](UIColor, "placeholderTextColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v60, CFSTR("placeholder-text"));

    v61 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor separatorColor](UIColor, "separatorColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v61, CFSTR("separator"));

    v62 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor opaqueSeparatorColor](UIColor, "opaqueSeparatorColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v62, CFSTR("opaque-separator"));

    v63 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v63, CFSTR("system-background"));

    v64 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v64, CFSTR("secondary-system-background"));

    v65 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiarySystemBackgroundColor](UIColor, "tertiarySystemBackgroundColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v65, CFSTR("tertiary-system-background"));

    v66 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGroupedBackgroundColor](UIColor, "systemGroupedBackgroundColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v66, CFSTR("system-grouped-background"));

    v67 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemGroupedBackgroundColor](UIColor, "secondarySystemGroupedBackgroundColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v67, CFSTR("secondary-system-grouped-background"));

    v68 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiarySystemGroupedBackgroundColor](UIColor, "tertiarySystemGroupedBackgroundColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v68, CFSTR("tertiary-system-grouped-background"));

    v69 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemFillColor](UIColor, "systemFillColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v69, CFSTR("system-fill"));

    v70 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemFillColor](UIColor, "secondarySystemFillColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v70, CFSTR("secondary-system-fill"));

    v71 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v71, CFSTR("tertiary-system-fill"));

    v72 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor quaternarySystemFillColor](UIColor, "quaternarySystemFillColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v72, CFSTR("quaternary-system-fill"));

    v73 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tintColor](UIColor, "tintColor"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_colors, "setObject:forKeyedSubscript:", v73, CFSTR("accent"));

  }
  return v2;
}

- (id)colorWithName:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:](self->_colors, "objectForKeyedSubscript:", a3);
}

- (void)registerColor:(id)a3 withName:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_colors, "setObject:forKeyedSubscript:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colors, 0);
}

@end
