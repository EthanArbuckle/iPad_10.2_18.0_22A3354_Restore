@implementation SearchUIFirstTimeExperienceViewController

- (SearchUIFirstTimeExperienceViewController)initWithStyle:(unint64_t)a3 supportedDomains:(unint64_t)a4 explanationText:(id)a5 learnMoreText:(id)a6 continueButtonTitle:(id)a7
{
  return -[SearchUIFirstTimeExperienceViewController initWithSupportedDomains:explanationText:learnMoreText:continueButtonTitle:](self, "initWithSupportedDomains:explanationText:learnMoreText:continueButtonTitle:", a4, a5, a6, a7);
}

- (SearchUIFirstTimeExperienceViewController)initWithSupportedDomains:(unint64_t)a3 explanationText:(id)a4 learnMoreText:(id)a5 continueButtonTitle:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  SearchUIFirstTimeExperienceViewController *v17;
  _QWORD v19[7];

  v19[6] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v19[0] = CFSTR("web");
  v19[1] = CFSTR("itunes");
  v19[2] = CFSTR("app_store");
  v19[3] = CFSTR("movies");
  v19[4] = CFSTR("restaurants");
  v19[5] = CFSTR("maps");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_opt_new();
  if (objc_msgSend(v13, "count"))
  {
    v15 = 0;
    do
    {
      if (((1 << v15) & a3) != 0)
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v16);

      }
      ++v15;
    }
    while (v15 < objc_msgSend(v13, "count"));
  }
  v17 = -[SearchUIFirstTimeExperienceViewController initWithDomains:explanationText:learnMoreText:continueButtonTitle:](self, "initWithDomains:explanationText:learnMoreText:continueButtonTitle:", v14, v10, v11, v12);

  return v17;
}

- (SearchUIFirstTimeExperienceViewController)initWithDomains:(id)a3 explanationText:(id)a4 learnMoreText:(id)a5 continueButtonTitle:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SearchUIFirstTimeExperienceViewController *v14;
  SearchUIFirstTimeExperienceViewController *v15;
  void *v16;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SearchUIFirstTimeExperienceViewController;
  v14 = -[SearchUIFirstTimeExperienceViewController init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    -[SearchUIFirstTimeExperienceViewController setSupportedDomains:](v14, "setSupportedDomains:", v10);
    -[SearchUIFirstTimeExperienceViewController setExplanationText:](v15, "setExplanationText:", v11);
    objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR(" "));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIFirstTimeExperienceViewController setLearnMoreText:](v15, "setLearnMoreText:", v16);

    -[SearchUIFirstTimeExperienceViewController setContinueButtonTitle:](v15, "setContinueButtonTitle:", v13);
    -[SearchUIFirstTimeExperienceViewController makeViews](v15, "makeViews");
  }

  return v15;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SearchUIFirstTimeExperienceViewController;
  -[SearchUIFirstTimeExperienceViewController traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, a3);
  -[SearchUIFirstTimeExperienceViewController updateTraitsIfNeeded](self, "updateTraitsIfNeeded");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__SearchUIFirstTimeExperienceViewController_traitCollectionDidChange___block_invoke;
  v8[3] = &unk_1EA1F62F0;
  v8[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v8);
  v4 = (void *)MEMORY[0x1E0DBD910];
  -[SearchUIFirstTimeExperienceViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bestAppearanceForView:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIFirstTimeExperienceViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enableAppearanceForContainer:", v7);

}

void __70__SearchUIFirstTimeExperienceViewController_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "makeViews");
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

}

- (void)makeViews
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  _BOOL4 v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  int v33;
  int v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  double v46;
  unint64_t v47;
  uint64_t v48;
  void *v49;
  _BOOL4 v50;
  SearchUIFirstTimeExperienceViewController *v51;
  void *v52;
  void *v53;
  BOOL v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  id v59;
  double v60;
  void *v61;
  id v62;
  id v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  id v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  double v84;
  double v85;
  double v86;
  double v87;
  void *v88;
  id v89;
  void *v90;
  id v91;
  void *v92;
  id v93;
  void *v94;
  double v95;
  id v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  id v105;
  void *v106;
  id v107;
  unint64_t v108;
  char v109;
  int v110;
  SearchUIFirstTimeExperienceViewController *v111;
  void *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  uint64_t v118;
  id obj;
  id obja;
  id v121;
  void *v122;
  int v123;
  void *v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  uint64_t v133;
  void *v134;
  uint64_t v135;
  void *v136;
  uint8_t buf[4];
  uint64_t v138;
  _QWORD v139[3];
  _BYTE v140[128];
  _QWORD v141[13];
  _QWORD v142[13];
  _BYTE v143[128];
  uint64_t v144;
  CGRect v145;

  v144 = *MEMORY[0x1E0C80C00];
  v129 = 0u;
  v130 = 0u;
  v131 = 0u;
  v132 = 0u;
  -[SearchUIFirstTimeExperienceViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v129, v143, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v130;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v130 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v129 + 1) + 8 * i), "removeFromSuperview");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v129, v143, 16);
    }
    while (v6);
  }

  v9 = (void *)MEMORY[0x1E0DBD910];
  -[SearchUIFirstTimeExperienceViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bestAppearanceForView:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v141[0] = CFSTR("web");
  v141[1] = CFSTR("itunes");
  v142[0] = CFSTR("safari");
  v142[1] = CFSTR("music");
  v141[2] = CFSTR("app_store");
  v141[3] = CFSTR("movies");
  v142[2] = CFSTR("appstore");
  v142[3] = CFSTR("film");
  v141[4] = CFSTR("restaurants");
  v141[5] = CFSTR("maps");
  v142[4] = CFSTR("fork.knife");
  v142[5] = CFSTR("mappin");
  v141[6] = CFSTR("media");
  v141[7] = CFSTR("pets");
  v142[6] = CFSTR("music");
  v142[7] = CFSTR("pawprint");
  v141[8] = CFSTR("books");
  v141[9] = CFSTR("art");
  v142[8] = CFSTR("book");
  v142[9] = CFSTR("photo");
  v141[10] = CFSTR("nature");
  v141[11] = CFSTR("landmarks");
  v142[10] = CFSTR("leaf");
  v142[11] = CFSTR("map");
  v141[12] = CFSTR("translation");
  v142[12] = CFSTR("translate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v142, v141, 13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = +[SearchUIUtilities isIpad](SearchUIUtilities, "isIpad");
  -[SearchUIFirstTimeExperienceViewController traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "horizontalSizeClass") == 1 && v13;

  if (objc_msgSend(v11, "style") == 3)
  {
    objc_msgSend(v11, "platterColor");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v11, "style") == 2)
      objc_msgSend(v11, "quaternaryColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v117 = (void *)v16;
  v17 = (void *)MEMORY[0x1E0DC1350];
  v108 = __PAIR64__(v13, v15);
  if (!v13 || v15)
  {
    v18 = *MEMORY[0x1E0DC4AE8];
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", *MEMORY[0x1E0DC4918]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "preferredFontForTextStyle:compatibleWithTraitCollection:", v18, v19);
    v116 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 48.0);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", v108);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = 0u;
  v126 = 0u;
  v127 = 0u;
  v128 = 0u;
  v111 = self;
  -[SearchUIFirstTimeExperienceViewController supportedDomains](self, "supportedDomains");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v125, v140, 16);
  v114 = v12;
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v126;
    v112 = v11;
    v113 = *(_QWORD *)v126;
    do
    {
      v23 = 0;
      v118 = v21;
      do
      {
        if (*(_QWORD *)v126 != v22)
          objc_enumerationMutation(obj);
        v24 = *(_QWORD *)(*((_QWORD *)&v125 + 1) + 8 * v23);
        objc_msgSend(v12, "objectForKeyedSubscript:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", v25);
          v26 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:variant:", v25, 0x40000000);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:variant:", v25, 1073741826);
          v28 = objc_claimAutoreleasedReturnValue();
          v29 = (void *)v28;
          if (v27)
            v30 = v27;
          else
            v30 = v26;
          if (v28)
            v30 = (void *)v28;
          v31 = v30;
          if (v31)
          {
            v32 = v31;
            if (v29)
              v33 = 1;
            else
              v33 = objc_msgSend(v25, "isEqualToString:", CFSTR("safari"));
            if (v27)
              v34 = 1;
            else
              v34 = v33;
            v123 = v33;
            if (objc_msgSend(v11, "style") == 3 && (v33 & 1) != 0)
            {
              objc_msgSend(v11, "primaryColor");
              v35 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(v11, "secondaryColor");
              v35 = objc_claimAutoreleasedReturnValue();
            }
            v36 = (void *)v35;
            v37 = v117;
            if (!v34)
              v37 = (void *)v35;
            v38 = (void *)MEMORY[0x1E0DC3888];
            v139[0] = v35;
            v139[1] = v37;
            v139[2] = v37;
            v39 = (void *)MEMORY[0x1E0C99D20];
            v121 = v37;
            objc_msgSend(v39, "arrayWithObjects:count:", v139, 3);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "_configurationWithHierarchicalColors:", v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "imageWithSymbolConfiguration:", v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBD970]), "initWithImage:", v42);
            objc_msgSend(v43, "setIsTemplate:", 1);
            v44 = (void *)objc_opt_new();

            objc_msgSend(v44, "setTlkImage:", v43);
            objc_msgSend(v44, "setSymbolFont:", v116);
            if (v123)
              v45 = 3;
            else
              v45 = 1;
            objc_msgSend(v44, "setSymbolScale:", v45);
            LODWORD(v46) = 1148846080;
            objc_msgSend(v44, "setContentHuggingPriority:forAxis:", 0, v46);
            objc_msgSend(v115, "addObject:", v44);
            objc_msgSend(v44, "tlk_updateForAppearance:", v112);

            v11 = v112;
            v22 = v113;
            v12 = v114;
            v21 = v118;
          }

        }
        else
        {
          SearchUIGeneralLog();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v138 = v24;
            _os_log_error_impl(&dword_1DAD39000, v26, OS_LOG_TYPE_ERROR, "Unsupported FTE domain name: %@", buf, 0xCu);
          }
        }

        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v125, v140, 16);
    }
    while (v21);
  }

  v47 = objc_msgSend(v115, "count");
  if (v47 >= 6)
    v48 = 6;
  else
    v48 = v47;
  objc_msgSend(v115, "subarrayWithRange:", 0, v48);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA8]), "initWithArrangedSubviews:", v124);
  objc_msgSend(v49, "setDistribution:", 0);
  if ((v110 & 1) != 0)
  {
    v50 = 0;
    v51 = v111;
  }
  else
  {
    v51 = v111;
    -[SearchUIFirstTimeExperienceViewController view](v111, "view");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "tlks_screen");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "_referenceBounds");
    v50 = CGRectGetWidth(v145) <= 320.0;

  }
  if ((v109 & 1) != 0 || !+[SearchUIUtilities isWideScreen](SearchUIUtilities, "isWideScreen") || v50)
  {
    v54 = !v50;
    v55 = 3.0;
    v56 = 2.0;
  }
  else
  {
    v54 = v110 == 0;
    v55 = 7.0;
    v56 = 9.0;
  }
  if (!v54)
    v55 = v56;
  objc_msgSend(v49, "setSpacing:", v55);
  -[SearchUIFirstTimeExperienceViewController view](v51, "view");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "addSubview:", v49);

  -[SearchUIFirstTimeExperienceViewController view](v51, "view");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = +[SearchUIAutoLayout alignView:toView:withAttribute:](SearchUIAutoLayout, "alignView:toView:withAttribute:", v49, v58, 9);

  if (+[SearchUIUtilities isWideScreen](SearchUIUtilities, "isWideScreen"))
    v60 = 38.0;
  else
    v60 = 21.0;
  -[SearchUIFirstTimeExperienceViewController view](v51, "view");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = +[SearchUIAutoLayout baselineAlignBottomView:toTopView:spacing:](SearchUIAutoLayout, "baselineAlignBottomView:toTopView:spacing:", v49, v61, v60);

  v63 = objc_alloc(MEMORY[0x1E0CB3778]);
  -[SearchUIFirstTimeExperienceViewController explanationText](v51, "explanationText");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = (void *)objc_msgSend(v63, "initWithString:", v64);

  v66 = objc_alloc(MEMORY[0x1E0CB3498]);
  -[SearchUIFirstTimeExperienceViewController learnMoreText](v51, "learnMoreText");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = *MEMORY[0x1E0DC1160];
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", &stru_1EA1FB118);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v136 = v68;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v136, &v135, 1);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend(v66, "initWithString:attributes:", v67, v69);

  obja = (id)v70;
  objc_msgSend(v65, "appendAttributedString:", v70);
  if (objc_msgSend(v11, "style") == 2)
  {
    objc_msgSend(MEMORY[0x1E0DBD910], "appearanceWithStyle:", 0);
    v71 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v71 = v11;
  }
  v72 = v71;
  if (objc_msgSend(v71, "isVibrant"))
    v73 = 2;
  else
    v73 = 1;
  v74 = (void *)objc_opt_new();
  v122 = v65;
  objc_msgSend(v74, "setAttributedText:", v65);
  objc_msgSend(v74, "setDelegate:", v51);
  objc_msgSend(v11, "primaryColor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setTextColor:", v75);

  v133 = *MEMORY[0x1E0DC1140];
  objc_msgSend(v72, "buttonColorForProminence:", v73);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = v76;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v134, &v133, 1);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setLinkTextAttributes:", v77);

  v78 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4A88], 0x8000, 0);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "fontWithDescriptor:size:", v79, 0.0);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setFont:", v80);

  objc_msgSend(v74, "textContainer");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "setLineFragmentPadding:", 0.0);

  objc_msgSend(v74, "_setInteractiveTextSelectionDisabled:", 1);
  objc_msgSend(v74, "setScrollEnabled:", 0);
  objc_msgSend(v74, "setBackgroundColor:", 0);
  objc_msgSend(v74, "setTextAlignment:", 1);
  objc_msgSend(v74, "setEditable:", 0);
  objc_msgSend(v11, "enableAppearanceForView:", v74);
  -[SearchUIFirstTimeExperienceViewController view](v51, "view");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "addSubview:", v74);

  +[SearchUISymbolImage uiImageWithSymbolName:font:scale:](SearchUISymbolImage, "uiImageWithSymbolName:font:scale:", CFSTR("safari"), v116, 3);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "size");
  v85 = v84;

  objc_msgSend(v49, "spacing");
  v87 = v86 * 5.0 + v85 * 6.0;
  -[SearchUIFirstTimeExperienceViewController view](v51, "view");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = +[SearchUIAutoLayout alignView:toView:withAttribute:](SearchUIAutoLayout, "alignView:toView:withAttribute:", v74, v88, 9);

  -[SearchUIFirstTimeExperienceViewController view](v51, "view");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = +[SearchUIAutoLayout alignLeadingView:toTrailingView:spacing:minimum:](SearchUIAutoLayout, "alignLeadingView:toTrailingView:spacing:minimum:", v90, v74, 1, 16.0);

  -[SearchUIFirstTimeExperienceViewController view](v51, "view");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = +[SearchUIAutoLayout alignLeadingView:toTrailingView:spacing:minimum:](SearchUIAutoLayout, "alignLeadingView:toTrailingView:spacing:minimum:", v74, v92, 1, 16.0);

  +[SearchUIAutoLayout setWidth:forView:](SearchUIAutoLayout, "setWidth:forView:", v74, v87);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v95) = 1148829696;
  objc_msgSend(v94, "setPriority:", v95);
  v96 = +[SearchUIAutoLayout baselineAlignBottomView:toTopView:dynamicSpacing:](SearchUIAutoLayout, "baselineAlignBottomView:toTopView:dynamicSpacing:", v74, v49, 34.0);
  objc_msgSend(MEMORY[0x1E0DC3520], "grayButtonConfiguration");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIFirstTimeExperienceViewController continueButtonTitle](v51, "continueButtonTitle");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "setTitle:", v98);

  objc_msgSend(v97, "setCornerStyle:", 4);
  objc_msgSend(v97, "setBaseBackgroundColor:", v117);
  v99 = (void *)objc_opt_new();
  objc_msgSend(v99, "setRole:", 1);
  objc_msgSend(v99, "setConfiguration:", v97);
  v100 = v72;
  if (objc_msgSend(v11, "style") == 3)
  {
    objc_msgSend(v11, "primaryColor");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "setTintColor:", v101);

  }
  else
  {
    objc_msgSend(v99, "setTintColor:", 0);
  }
  objc_msgSend(v11, "enableAppearanceForView:", v99);
  objc_msgSend(v99, "addTarget:action:forControlEvents:", v51, sel_continueButtonPressed, 64);
  -[SearchUIFirstTimeExperienceViewController view](v51, "view");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "addSubview:", v99);

  -[SearchUIFirstTimeExperienceViewController view](v51, "view");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = +[SearchUIAutoLayout alignView:toView:withAttribute:](SearchUIAutoLayout, "alignView:toView:withAttribute:", v99, v103, 9);

  v105 = +[SearchUIAutoLayout alignView:attribute:toView:attribute:constant:](SearchUIAutoLayout, "alignView:attribute:toView:attribute:constant:", v99, 3, v74, 4, 30.0);
  -[SearchUIFirstTimeExperienceViewController view](v51, "view");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = +[SearchUIAutoLayout baselineAlignBottomView:toTopView:spacing:minimum:](SearchUIAutoLayout, "baselineAlignBottomView:toTopView:spacing:minimum:", v106, v99, 1, v60);

}

- (void)continueButtonPressed
{
  id v2;

  -[SearchUIFirstTimeExperienceViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstTimeExperienceContinueButtonPressed");

}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  if (!a6)
    -[SearchUIFirstTimeExperienceViewController showPrivacyView](self, "showPrivacyView", a3, a4, a5.location, a5.length);
  return a6 == 0;
}

- (void)showPrivacyView
{
  uint64_t v3;
  void *v4;
  void *v5;
  SearchUIPrivacyDetailsViewController *v6;

  v6 = objc_alloc_init(SearchUIPrivacyDetailsViewController);
  if ((-[SearchUIFirstTimeExperienceViewController _isInPopoverPresentation](self, "_isInPopoverPresentation") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    -[SearchUIFirstTimeExperienceViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[SearchUIFirstTimeExperienceViewController delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "firstTimeExperienceIsInPopoverPresentation"))
        v3 = 0;
      else
        v3 = 2;

    }
    else
    {
      v3 = 2;
    }

  }
  -[SearchUIPrivacyDetailsViewController setModalPresentationStyle:](v6, "setModalPresentationStyle:", v3);
  -[SearchUIFirstTimeExperienceViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (SearchUIFirstTimeExperienceDelegate)delegate
{
  return (SearchUIFirstTimeExperienceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)supportedDomains
{
  return self->_supportedDomains;
}

- (void)setSupportedDomains:(id)a3
{
  objc_storeStrong((id *)&self->_supportedDomains, a3);
}

- (NSString)explanationText
{
  return self->_explanationText;
}

- (void)setExplanationText:(id)a3
{
  objc_storeStrong((id *)&self->_explanationText, a3);
}

- (NSString)learnMoreText
{
  return self->_learnMoreText;
}

- (void)setLearnMoreText:(id)a3
{
  objc_storeStrong((id *)&self->_learnMoreText, a3);
}

- (NSString)continueButtonTitle
{
  return self->_continueButtonTitle;
}

- (void)setContinueButtonTitle:(id)a3
{
  objc_storeStrong((id *)&self->_continueButtonTitle, a3);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_continueButtonTitle, 0);
  objc_storeStrong((id *)&self->_learnMoreText, 0);
  objc_storeStrong((id *)&self->_explanationText, 0);
  objc_storeStrong((id *)&self->_supportedDomains, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
