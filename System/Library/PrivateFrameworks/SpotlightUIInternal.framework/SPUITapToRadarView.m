@implementation SPUITapToRadarView

+ (BOOL)shouldDisplayTapToRadar
{
  if (shouldDisplayTapToRadar_onceToken != -1)
    dispatch_once(&shouldDisplayTapToRadar_onceToken, &__block_literal_global_5);
  return shouldDisplayTapToRadar_shouldDisplayTapToRadar;
}

void __45__SPUITapToRadarView_shouldDisplayTapToRadar__block_invoke()
{
  id v0;

  objc_msgSend(CFSTR("com.apple.spotlightui"), "cStringUsingEncoding:", 1);
  if ((os_variant_has_internal_diagnostics() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v0 = (id)objc_claimAutoreleasedReturnValue();
    shouldDisplayTapToRadar_shouldDisplayTapToRadar = objc_msgSend(v0, "BOOLForKey:", *MEMORY[0x24BE84AF0]) ^ 1;

  }
  else
  {
    shouldDisplayTapToRadar_shouldDisplayTapToRadar = 0;
  }
}

- (SPUITapToRadarView)initWithTarget:(id)a3 action:(SEL)a4
{
  id v6;
  SPUITapToRadarView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SPUITapToRadarView;
  v7 = -[SPUITapToRadarView init](&v14, sel_init);
  if (v7)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "setProminence:", 2);
    objc_msgSend(v8, "setTitle:", CFSTR("Tap-to-Radar"));
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v9);

    objc_msgSend(v8, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAdjustsFontForContentSizeCategory:", 1);

    objc_msgSend(v8, "setMinimumLayoutSize:", 44.0, 44.0);
    -[SPUITapToRadarView setLayoutMargins:](v7, "setLayoutMargins:", 16.0, 0.0, 16.0, 0.0);
    -[SPUITapToRadarView setLayoutMarginsRelativeArrangement:](v7, "setLayoutMarginsRelativeArrangement:", 1);
    -[NUIContainerBoxView setHorizontalAlignment:](v7, "setHorizontalAlignment:", 3);
    objc_msgSend(v8, "addTarget:action:", v6, a4);
    v15[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUITapToRadarView setArrangedSubviews:](v7, "setArrangedSubviews:", v11);

    -[SPUITapToRadarView updateImage](v7, "updateImage");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v7, sel_updateImage, *MEMORY[0x24BEBE088], 0);

  }
  return v7;
}

- (void)updateImage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[SPUITapToRadarView arrangedSubviews](self, "arrangedSubviews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v3 = (void *)MEMORY[0x24BE85280];
  objc_msgSend(v6, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uiImageWithSymbolName:font:scale:", CFSTR("ant.fill"), v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:forState:", v5, 0);

}

+ (void)openTapToRadarWithQuery:(id)a3 sections:(id)a4 rankingDebugLog:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  id v29;
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
  uint64_t v41;
  void *v42;
  const __CFString *v43;
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
  void *v60;
  void *v61;
  void *v62;
  __CFString *v63;
  id obj;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _QWORD v73[5];
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v63 = (__CFString *)a5;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<Build>"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "operatingSystemVersionString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v60 = v11;
  if (v11)
  {
    v12 = objc_msgSend(v11, "rangeOfString:", CFSTR("(Build "));
    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v11, "substringFromIndex:", v12 + v13);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "rangeOfString:", CFSTR(")"));
      if (v15 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v14, "substringToIndex:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = v16;
        v9 = v14;
      }

    }
  }
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v9;
  objc_msgSend(v17, "appendFormat:", CFSTR("Build: %@\n\n"), v9);
  v61 = v7;
  objc_msgSend(v17, "appendFormat:", CFSTR("Query: %@\n\n"), v7);
  objc_msgSend(v17, "appendString:", CFSTR("Results:\n"));
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  obj = v8;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v70 != v20)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
        v65 = 0u;
        v66 = 0u;
        v67 = 0u;
        v68 = 0u;
        objc_msgSend(v22, "results");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v66;
          do
          {
            for (j = 0; j != v25; ++j)
            {
              if (*(_QWORD *)v66 != v26)
                objc_enumerationMutation(v23);
              objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * j), "debugDescription");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "appendString:", v28);

              objc_msgSend(v17, "appendString:", CFSTR("\n"));
            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
          }
          while (v25);
        }

      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
    }
    while (v19);
  }

  v29 = objc_alloc_init(MEMORY[0x24BDD1808]);
  objc_msgSend(v29, "setScheme:", CFSTR("tap-to-radar"));
  v58 = v29;
  objc_msgSend(v29, "setHost:", CFSTR("new"));
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 8);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "generateComponentQueryItems");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObjectsFromArray:", v31);

  SSExtensionIdentifiersForSections();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)MEMORY[0x24BDD1838];
  v57 = v32;
  objc_msgSend(v32, "componentsJoinedByString:", CFSTR(","));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "queryItemWithName:value:", CFSTR("ExtensionIdentifiers"), v56);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v73[0] = v55;
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("Classification"), CFSTR("Other Bug"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v73[1] = v34;
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("Reproducibility"), CFSTR("I Didn't Try"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v73[2] = v35;
  v36 = (void *)MEMORY[0x24BDD1838];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: "), v62);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "queryItemWithName:value:", CFSTR("Title"), v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v73[3] = v38;
  v39 = (void *)MEMORY[0x24BDD1838];
  v40 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BEB0838], "internalReleaseAgreementText");
  v41 = objc_claimAutoreleasedReturnValue();
  v42 = (void *)v41;
  v43 = &stru_24F9D6A70;
  if (v63)
    v43 = v63;
  objc_msgSend(v40, "stringWithFormat:", CFSTR("Summary: \n\n\n*** Note: Debug info contains the titles of items in the UI. Please review for confidential information.  %@ ***\n\n===  DEBUG INFO  ===\n\n%@\n\n%@"), v41, v17, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "queryItemWithName:value:", CFSTR("Description"), v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v73[4] = v45;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v73, 5);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObjectsFromArray:", v46);

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEB0838], "filePathForCapturedScreenshot");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (v48)
    objc_msgSend(v47, "addObject:", v48);
  objc_msgSend(v47, "componentsJoinedByString:", CFSTR(","));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("Attachments"), v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObject:", v50);

  objc_msgSend(v58, "setQueryItems:", v30);
  v51 = (void *)MEMORY[0x24BE85288];
  v52 = (void *)MEMORY[0x24BE84F38];
  objc_msgSend(v58, "URL");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "punchoutWithURL:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "openPunchout:", v54);

}

+ (id)generateComponentQueryItems
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("ComponentName"), CFSTR("Spotlight (New Bugs)"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("ComponentVersion"), CFSTR("iOS"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("ComponentID"), CFSTR("312963"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
