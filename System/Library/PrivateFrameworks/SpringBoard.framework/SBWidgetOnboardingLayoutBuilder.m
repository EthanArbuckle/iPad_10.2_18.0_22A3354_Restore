@implementation SBWidgetOnboardingLayoutBuilder

- (SBWidgetOnboardingLayoutBuilder)initWithPinnedWidgets:(id)a3 suggestionWidgets:(id)a4
{
  id v6;
  id v7;
  SBWidgetOnboardingLayoutBuilder *v8;
  uint64_t v9;
  NSArray *pinnedWidgets;
  uint64_t v11;
  NSArray *suggestionWidgets;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBWidgetOnboardingLayoutBuilder;
  v8 = -[SBWidgetOnboardingLayoutBuilder init](&v14, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    pinnedWidgets = v8->_pinnedWidgets;
    v8->_pinnedWidgets = (NSArray *)v9;

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v7);
    v11 = objc_claimAutoreleasedReturnValue();
    suggestionWidgets = v8->_suggestionWidgets;
    v8->_suggestionWidgets = (NSArray *)v11;

  }
  return v8;
}

- (id)defaultSmallClockWidgetIcon
{
  void *v2;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA678]), "initWithWidgetExtensionIdentifiers:widgetKinds:widgetContainerBundleIdentifiers:", &unk_1E91CEFF8, &unk_1E91CF010, &unk_1E91CF028);
  objc_msgSend(v2, "setGridSizeClass:", *MEMORY[0x1E0DAA7A0]);
  return v2;
}

- (id)defaultSmallNotesWidgetIcon
{
  void *v2;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA678]), "initWithWidgetExtensionIdentifiers:widgetKinds:widgetContainerBundleIdentifiers:", &unk_1E91CF040, &unk_1E91CF058, &unk_1E91CF070);
  objc_msgSend(v2, "setGridSizeClass:", *MEMORY[0x1E0DAA7A0]);
  return v2;
}

- (id)defaultCalendarWidgetIcon:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0DAA768])
    v3 = CFSTR("com.apple.CalendarWidget.CalendarListWidget");
  else
    v3 = CFSTR("com.apple.CalendarWidget.CalendarUpNextWidget");
  if (*MEMORY[0x1E0DAA758])
    v4 = CFSTR("com.apple.CalendarWidget.CalendarUpNextWidget");
  else
    v4 = v3;
  v5 = (objc_class *)MEMORY[0x1E0DAA678];
  v6 = a3;
  v7 = [v5 alloc];
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithWidgetExtensionIdentifiers:widgetKinds:widgetContainerBundleIdentifiers:", &unk_1E91CF088, v8, &unk_1E91CF0A0);

  objc_msgSend(v9, "setGridSizeClass:", v6);
  return v9;
}

- (id)defaultSmallCalendarWidgetIcon
{
  return -[SBWidgetOnboardingLayoutBuilder defaultCalendarWidgetIcon:](self, "defaultCalendarWidgetIcon:", *MEMORY[0x1E0DAA7A0]);
}

- (id)defaultMediumCalendarWidgetIcon
{
  return -[SBWidgetOnboardingLayoutBuilder defaultCalendarWidgetIcon:](self, "defaultCalendarWidgetIcon:", *MEMORY[0x1E0DAA770]);
}

- (id)defaultFirstSuggestionWidgetIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBWidgetOnboardingLayoutBuilder suggestionWidgets](self, "suggestionWidgets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setGridSizeClass:", v4);
  return v6;
}

- (id)defaultMediumFirstSuggestionWidgetIcon
{
  return -[SBWidgetOnboardingLayoutBuilder defaultFirstSuggestionWidgetIcon:](self, "defaultFirstSuggestionWidgetIcon:", *MEMORY[0x1E0DAA770]);
}

- (id)defaultLargeFirstSuggestionWidgetIcon
{
  return -[SBWidgetOnboardingLayoutBuilder defaultFirstSuggestionWidgetIcon:](self, "defaultFirstSuggestionWidgetIcon:", *MEMORY[0x1E0DAA768]);
}

- (id)defaultSecondSuggestionWidgetIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBWidgetOnboardingLayoutBuilder suggestionWidgets](self, "suggestionWidgets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setGridSizeClass:", v4);
  return v6;
}

- (id)defaultMediumSecondSuggestionWidgetIcon
{
  return -[SBWidgetOnboardingLayoutBuilder defaultSecondSuggestionWidgetIcon:](self, "defaultSecondSuggestionWidgetIcon:", *MEMORY[0x1E0DAA770]);
}

- (id)defaultLargeSecondSuggestionWidgetIcon
{
  return -[SBWidgetOnboardingLayoutBuilder defaultSecondSuggestionWidgetIcon:](self, "defaultSecondSuggestionWidgetIcon:", *MEMORY[0x1E0DAA768]);
}

- (BOOL)isClockWidget:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[SBWidgetOnboardingLayoutBuilder defaultSmallClockWidgetIcon](self, "defaultSmallClockWidgetIcon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "activeWidget");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "extensionBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqual:", v8);

  return v9;
}

- (BOOL)isCalendarWidget:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[SBWidgetOnboardingLayoutBuilder defaultSmallCalendarWidgetIcon](self, "defaultSmallCalendarWidgetIcon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "activeWidget");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "extensionBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqual:", v8);

  return v9;
}

- (BOOL)isCalendarWidgetIcon:(id)a3
{
  void *v4;

  objc_msgSend(a3, "activeWidget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[SBWidgetOnboardingLayoutBuilder isCalendarWidget:](self, "isCalendarWidget:", v4);

  return (char)self;
}

- (BOOL)isFirstSuggestionActiveWidgetIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  -[SBWidgetOnboardingLayoutBuilder suggestionWidgets](self, "suggestionWidgets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "activeWidget");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "extensionBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeWidget");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "extensionBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqual:", v10);

  return v11;
}

- (BOOL)isSecondSuggestionActiveWidgetIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  -[SBWidgetOnboardingLayoutBuilder suggestionWidgets](self, "suggestionWidgets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "activeWidget");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "extensionBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeWidget");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "extensionBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqual:", v10);

  return v11;
}

- (id)deduplicateInsidePinnedWidgets
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  id obj;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[SBWidgetOnboardingLayoutBuilder pinnedWidgets](self, "pinnedWidgets");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v23)
  {
    v21 = *(_QWORD *)v31;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v31 != v21)
          objc_enumerationMutation(obj);
        v24 = v3;
        v4 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v3);
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v25 = v22;
        v5 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v5)
        {
          v6 = v5;
          v7 = *(_QWORD *)v27;
          while (2)
          {
            v8 = 0;
            do
            {
              if (*(_QWORD *)v27 != v7)
                objc_enumerationMutation(v25);
              v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v8);
              objc_msgSend(v4, "activeWidget");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "extensionBundleIdentifier");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "activeWidget");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "extensionBundleIdentifier");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v11, "isEqual:", v13);

              if (v14)
              {
                objc_msgSend(v4, "widgets");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                v16 = objc_msgSend(v15, "count");
                objc_msgSend(v9, "widgets");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v17, "count");

                if (v16 > v18)
                  objc_msgSend(v25, "replaceObjectAtIndex:withObject:", objc_msgSend(v25, "indexOfObject:", v9), v4);

                goto LABEL_18;
              }
              ++v8;
            }
            while (v6 != v8);
            v6 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            if (v6)
              continue;
            break;
          }
        }

        objc_msgSend(v25, "addObject:", v4);
LABEL_18:
        v3 = v24 + 1;
      }
      while (v24 + 1 != v23);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v23);
  }

  return v22;
}

- (id)migratedOneSmallWidget:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void **v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBWidgetOnboardingLayoutBuilder defaultSmallClockWidgetIcon](self, "defaultSmallClockWidgetIcon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWidgetOnboardingLayoutBuilder defaultSmallCalendarWidgetIcon](self, "defaultSmallCalendarWidgetIcon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWidgetOnboardingLayoutBuilder defaultMediumFirstSuggestionWidgetIcon](self, "defaultMediumFirstSuggestionWidgetIcon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWidgetOnboardingLayoutBuilder defaultMediumSecondSuggestionWidgetIcon](self, "defaultMediumSecondSuggestionWidgetIcon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBWidgetOnboardingLayoutBuilder isCalendarWidgetIcon:](self, "isCalendarWidgetIcon:", v4)
    || -[SBWidgetOnboardingLayoutBuilder isFirstSuggestionActiveWidgetIcon:](self, "isFirstSuggestionActiveWidgetIcon:", v4)|| -[SBWidgetOnboardingLayoutBuilder isSecondSuggestionActiveWidgetIcon:](self, "isSecondSuggestionActiveWidgetIcon:", v4))
  {
    v16[0] = v5;
    v9 = (void **)v16;
    v10 = v6;
    v11 = v7;
    v12 = v8;
  }
  else
  {
    objc_msgSend(v6, "setGridSizeClass:", *MEMORY[0x1E0DAA770]);
    v15 = v5;
    v9 = &v15;
    v10 = v4;
    v11 = v6;
    v12 = v7;
  }
  v9[1] = v10;
  v9[2] = v11;
  v9[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)migratedOneMediumWidget:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void **v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBWidgetOnboardingLayoutBuilder defaultSmallClockWidgetIcon](self, "defaultSmallClockWidgetIcon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWidgetOnboardingLayoutBuilder defaultSmallCalendarWidgetIcon](self, "defaultSmallCalendarWidgetIcon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWidgetOnboardingLayoutBuilder defaultMediumFirstSuggestionWidgetIcon](self, "defaultMediumFirstSuggestionWidgetIcon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWidgetOnboardingLayoutBuilder defaultMediumSecondSuggestionWidgetIcon](self, "defaultMediumSecondSuggestionWidgetIcon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBWidgetOnboardingLayoutBuilder isCalendarWidgetIcon:](self, "isCalendarWidgetIcon:", v4))
  {
    objc_msgSend(v7, "setGridSizeClass:", *MEMORY[0x1E0DAA7A0]);
    v17[0] = v5;
    v9 = (void **)v17;
    v10 = v7;
    v11 = v4;
  }
  else
  {
    if (!-[SBWidgetOnboardingLayoutBuilder isFirstSuggestionActiveWidgetIcon:](self, "isFirstSuggestionActiveWidgetIcon:", v4)&& !-[SBWidgetOnboardingLayoutBuilder isSecondSuggestionActiveWidgetIcon:](self, "isSecondSuggestionActiveWidgetIcon:", v4))
    {
      v15 = v5;
      v9 = &v15;
      v10 = v6;
      v11 = v4;
      v12 = v7;
      goto LABEL_7;
    }
    v16 = v5;
    v9 = &v16;
    v10 = v6;
    v11 = v7;
  }
  v12 = v8;
LABEL_7:
  v9[1] = v10;
  v9[2] = v11;
  v9[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)migratedOneLargeWidget:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void **v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBWidgetOnboardingLayoutBuilder defaultSmallClockWidgetIcon](self, "defaultSmallClockWidgetIcon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWidgetOnboardingLayoutBuilder defaultSmallCalendarWidgetIcon](self, "defaultSmallCalendarWidgetIcon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWidgetOnboardingLayoutBuilder defaultMediumFirstSuggestionWidgetIcon](self, "defaultMediumFirstSuggestionWidgetIcon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWidgetOnboardingLayoutBuilder defaultMediumSecondSuggestionWidgetIcon](self, "defaultMediumSecondSuggestionWidgetIcon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBWidgetOnboardingLayoutBuilder isCalendarWidgetIcon:](self, "isCalendarWidgetIcon:", v4))
  {
    objc_msgSend(v7, "setGridSizeClass:", *MEMORY[0x1E0DAA7A0]);
    v17[0] = v5;
    v9 = (void **)v17;
    v10 = v7;
LABEL_5:
    v11 = v8;
    goto LABEL_10;
  }
  if (-[SBWidgetOnboardingLayoutBuilder isFirstSuggestionActiveWidgetIcon:](self, "isFirstSuggestionActiveWidgetIcon:", v4))
  {
    v16 = v5;
    v9 = &v16;
    v10 = v6;
    goto LABEL_5;
  }
  if (-[SBWidgetOnboardingLayoutBuilder isSecondSuggestionActiveWidgetIcon:](self, "isSecondSuggestionActiveWidgetIcon:", v4))
  {
    v15 = v5;
    v9 = &v15;
  }
  else
  {
    v14 = v5;
    v9 = &v14;
  }
  v10 = v6;
  v11 = v7;
LABEL_10:
  v9[1] = v10;
  v9[2] = v11;
  v9[3] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)migratedTwoSmallWidgets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void **v12;
  _BOOL4 v13;
  _BOOL4 v14;
  uint64_t v15;
  void *v16;
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
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBWidgetOnboardingLayoutBuilder defaultSmallClockWidgetIcon](self, "defaultSmallClockWidgetIcon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWidgetOnboardingLayoutBuilder defaultSmallCalendarWidgetIcon](self, "defaultSmallCalendarWidgetIcon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWidgetOnboardingLayoutBuilder defaultMediumFirstSuggestionWidgetIcon](self, "defaultMediumFirstSuggestionWidgetIcon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWidgetOnboardingLayoutBuilder defaultMediumSecondSuggestionWidgetIcon](self, "defaultMediumSecondSuggestionWidgetIcon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBWidgetOnboardingLayoutBuilder isCalendarWidgetIcon:](self, "isCalendarWidgetIcon:", v9))
  {
    if (-[SBWidgetOnboardingLayoutBuilder isFirstSuggestionActiveWidgetIcon:](self, "isFirstSuggestionActiveWidgetIcon:", v10)|| -[SBWidgetOnboardingLayoutBuilder isSecondSuggestionActiveWidgetIcon:](self, "isSecondSuggestionActiveWidgetIcon:", v10))
    {
      v59 = v5;
      v60 = v6;
      v61 = v7;
      v62 = v8;
      v11 = (void *)MEMORY[0x1E0C99D20];
      v12 = &v59;
    }
    else
    {
      objc_msgSend(v6, "setGridSizeClass:", *MEMORY[0x1E0DAA770]);
      v55 = v5;
      v56 = v10;
      v57 = v6;
      v58 = v7;
      v11 = (void *)MEMORY[0x1E0C99D20];
      v12 = &v55;
    }
    goto LABEL_30;
  }
  v13 = -[SBWidgetOnboardingLayoutBuilder isCalendarWidgetIcon:](self, "isCalendarWidgetIcon:", v10);
  v14 = -[SBWidgetOnboardingLayoutBuilder isFirstSuggestionActiveWidgetIcon:](self, "isFirstSuggestionActiveWidgetIcon:", v9);
  if (v13)
  {
    if (v14
      || -[SBWidgetOnboardingLayoutBuilder isSecondSuggestionActiveWidgetIcon:](self, "isSecondSuggestionActiveWidgetIcon:", v9))
    {
      v51 = v5;
      v52 = v6;
      v53 = v7;
      v54 = v8;
      v11 = (void *)MEMORY[0x1E0C99D20];
      v12 = &v51;
    }
    else
    {
      objc_msgSend(v6, "setGridSizeClass:", *MEMORY[0x1E0DAA770]);
      v47 = v5;
      v48 = v9;
      v49 = v6;
      v50 = v7;
      v11 = (void *)MEMORY[0x1E0C99D20];
      v12 = &v47;
    }
    goto LABEL_30;
  }
  if (v14
    && !-[SBWidgetOnboardingLayoutBuilder isSecondSuggestionActiveWidgetIcon:](self, "isSecondSuggestionActiveWidgetIcon:", v10))
  {
    objc_msgSend(v6, "setGridSizeClass:", *MEMORY[0x1E0DAA770]);
    v43 = v5;
    v44 = v10;
    v45 = v6;
    v46 = v7;
    v11 = (void *)MEMORY[0x1E0C99D20];
    v12 = &v43;
    goto LABEL_30;
  }
  if (-[SBWidgetOnboardingLayoutBuilder isFirstSuggestionActiveWidgetIcon:](self, "isFirstSuggestionActiveWidgetIcon:", v10)&& !-[SBWidgetOnboardingLayoutBuilder isSecondSuggestionActiveWidgetIcon:](self, "isSecondSuggestionActiveWidgetIcon:", v9))
  {
    objc_msgSend(v6, "setGridSizeClass:", *MEMORY[0x1E0DAA770]);
    v39 = v5;
    v40 = v9;
    v41 = v6;
    v42 = v7;
    v11 = (void *)MEMORY[0x1E0C99D20];
    v12 = &v39;
    goto LABEL_30;
  }
  if (-[SBWidgetOnboardingLayoutBuilder isSecondSuggestionActiveWidgetIcon:](self, "isSecondSuggestionActiveWidgetIcon:", v9)&& !-[SBWidgetOnboardingLayoutBuilder isFirstSuggestionActiveWidgetIcon:](self, "isFirstSuggestionActiveWidgetIcon:", v10))
  {
    objc_msgSend(v6, "setGridSizeClass:", *MEMORY[0x1E0DAA770]);
    v35 = v5;
    v36 = v10;
    v37 = v6;
    v38 = v8;
    v11 = (void *)MEMORY[0x1E0C99D20];
    v12 = &v35;
    goto LABEL_30;
  }
  if (-[SBWidgetOnboardingLayoutBuilder isSecondSuggestionActiveWidgetIcon:](self, "isSecondSuggestionActiveWidgetIcon:", v10)&& !-[SBWidgetOnboardingLayoutBuilder isFirstSuggestionActiveWidgetIcon:](self, "isFirstSuggestionActiveWidgetIcon:", v9))
  {
    objc_msgSend(v6, "setGridSizeClass:", *MEMORY[0x1E0DAA770]);
    v31 = v5;
    v32 = v9;
    v33 = v6;
    v34 = v8;
    v11 = (void *)MEMORY[0x1E0C99D20];
    v12 = &v31;
    goto LABEL_30;
  }
  if (-[SBWidgetOnboardingLayoutBuilder isFirstSuggestionActiveWidgetIcon:](self, "isFirstSuggestionActiveWidgetIcon:", v9)&& -[SBWidgetOnboardingLayoutBuilder isSecondSuggestionActiveWidgetIcon:](self, "isSecondSuggestionActiveWidgetIcon:", v10))
  {
    v27 = v5;
    v28 = v6;
    v29 = v7;
    v30 = v8;
    v11 = (void *)MEMORY[0x1E0C99D20];
    v12 = &v27;
LABEL_30:
    v15 = 4;
    goto LABEL_31;
  }
  if (-[SBWidgetOnboardingLayoutBuilder isFirstSuggestionActiveWidgetIcon:](self, "isFirstSuggestionActiveWidgetIcon:", v10)&& -[SBWidgetOnboardingLayoutBuilder isSecondSuggestionActiveWidgetIcon:](self, "isSecondSuggestionActiveWidgetIcon:", v9))
  {
    v23 = v5;
    v24 = v6;
    v25 = v8;
    v26 = v7;
    v11 = (void *)MEMORY[0x1E0C99D20];
    v12 = &v23;
    goto LABEL_30;
  }
  v18 = v5;
  v19 = v6;
  v20 = v9;
  v21 = v10;
  v22 = v7;
  v11 = (void *)MEMORY[0x1E0C99D20];
  v12 = &v18;
  v15 = 5;
LABEL_31:
  objc_msgSend(v11, "arrayWithObjects:count:", v12, v15, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32,
    v33,
    v34,
    v35,
    v36,
    v37,
    v38,
    v39,
    v40,
    v41,
    v42,
    v43,
    v44,
    v45,
    v46,
    v47,
    v48,
    v49,
    v50,
    v51,
    v52,
    v53,
    v54,
    v55,
    v56,
    v57,
    v58,
    v59,
    v60,
    v61,
    v62,
    v63);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)migratedTwoMediumWidgets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void **v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  _BOOL4 v16;
  _BOOL4 v17;
  _BOOL4 v18;
  void *v19;
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
  _QWORD v33[5];

  v33[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBWidgetOnboardingLayoutBuilder defaultSmallClockWidgetIcon](self, "defaultSmallClockWidgetIcon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWidgetOnboardingLayoutBuilder defaultSmallCalendarWidgetIcon](self, "defaultSmallCalendarWidgetIcon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWidgetOnboardingLayoutBuilder defaultMediumFirstSuggestionWidgetIcon](self, "defaultMediumFirstSuggestionWidgetIcon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWidgetOnboardingLayoutBuilder defaultMediumSecondSuggestionWidgetIcon](self, "defaultMediumSecondSuggestionWidgetIcon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[SBWidgetOnboardingLayoutBuilder isCalendarWidgetIcon:](self, "isCalendarWidgetIcon:", v9))
  {
    v15 = -[SBWidgetOnboardingLayoutBuilder isCalendarWidgetIcon:](self, "isCalendarWidgetIcon:", v10);
    v16 = -[SBWidgetOnboardingLayoutBuilder isFirstSuggestionActiveWidgetIcon:](self, "isFirstSuggestionActiveWidgetIcon:", v9);
    if (v15)
    {
      if (v16)
      {
        objc_msgSend(v8, "setGridSizeClass:", *MEMORY[0x1E0DAA7A0]);
        objc_msgSend(v6, "setGridSizeClass:", *MEMORY[0x1E0DAA770]);
        v30 = v5;
        v11 = &v30;
        v12 = v8;
LABEL_28:
        v13 = v7;
LABEL_39:
        v14 = v10;
        goto LABEL_40;
      }
      v18 = -[SBWidgetOnboardingLayoutBuilder isSecondSuggestionActiveWidgetIcon:](self, "isSecondSuggestionActiveWidgetIcon:", v9);
      objc_msgSend(v7, "setGridSizeClass:", *MEMORY[0x1E0DAA7A0]);
      objc_msgSend(v6, "setGridSizeClass:", *MEMORY[0x1E0DAA770]);
      if (!v18)
      {
        v28 = v5;
        v11 = &v28;
LABEL_30:
        v12 = v7;
LABEL_31:
        v13 = v9;
        goto LABEL_39;
      }
      v29 = v5;
      v11 = &v29;
      v12 = v7;
    }
    else
    {
      if (v16
        && !-[SBWidgetOnboardingLayoutBuilder isSecondSuggestionActiveWidgetIcon:](self, "isSecondSuggestionActiveWidgetIcon:", v10))
      {
        v27 = v5;
        v11 = &v27;
        v12 = v6;
        goto LABEL_28;
      }
      if (-[SBWidgetOnboardingLayoutBuilder isFirstSuggestionActiveWidgetIcon:](self, "isFirstSuggestionActiveWidgetIcon:", v10)&& !-[SBWidgetOnboardingLayoutBuilder isSecondSuggestionActiveWidgetIcon:](self, "isSecondSuggestionActiveWidgetIcon:", v9))
      {
        v26 = v5;
        v11 = &v26;
        v12 = v6;
        goto LABEL_4;
      }
      if (!-[SBWidgetOnboardingLayoutBuilder isSecondSuggestionActiveWidgetIcon:](self, "isSecondSuggestionActiveWidgetIcon:", v9)|| -[SBWidgetOnboardingLayoutBuilder isFirstSuggestionActiveWidgetIcon:](self, "isFirstSuggestionActiveWidgetIcon:", v10))
      {
        if (-[SBWidgetOnboardingLayoutBuilder isSecondSuggestionActiveWidgetIcon:](self, "isSecondSuggestionActiveWidgetIcon:", v10)&& !-[SBWidgetOnboardingLayoutBuilder isFirstSuggestionActiveWidgetIcon:](self, "isFirstSuggestionActiveWidgetIcon:", v9))
        {
          v24 = v5;
          v11 = &v24;
          v12 = v6;
          goto LABEL_11;
        }
        if (-[SBWidgetOnboardingLayoutBuilder isFirstSuggestionActiveWidgetIcon:](self, "isFirstSuggestionActiveWidgetIcon:", v9)&& -[SBWidgetOnboardingLayoutBuilder isSecondSuggestionActiveWidgetIcon:](self, "isSecondSuggestionActiveWidgetIcon:", v10))
        {
          v23 = v5;
          v11 = &v23;
          v12 = v6;
          v13 = v7;
          goto LABEL_12;
        }
        if (-[SBWidgetOnboardingLayoutBuilder isFirstSuggestionActiveWidgetIcon:](self, "isFirstSuggestionActiveWidgetIcon:", v10)&& -[SBWidgetOnboardingLayoutBuilder isSecondSuggestionActiveWidgetIcon:](self, "isSecondSuggestionActiveWidgetIcon:", v9))
        {
          v22 = v5;
          v11 = &v22;
          v12 = v6;
          v13 = v8;
          goto LABEL_5;
        }
        v21 = v5;
        v11 = &v21;
        v12 = v6;
        goto LABEL_31;
      }
      v25 = v5;
      v11 = &v25;
      v12 = v6;
    }
    v13 = v8;
    goto LABEL_39;
  }
  if (!-[SBWidgetOnboardingLayoutBuilder isFirstSuggestionActiveWidgetIcon:](self, "isFirstSuggestionActiveWidgetIcon:", v10))
  {
    v17 = -[SBWidgetOnboardingLayoutBuilder isSecondSuggestionActiveWidgetIcon:](self, "isSecondSuggestionActiveWidgetIcon:", v10);
    objc_msgSend(v7, "setGridSizeClass:", *MEMORY[0x1E0DAA7A0]);
    objc_msgSend(v6, "setGridSizeClass:", *MEMORY[0x1E0DAA770]);
    if (v17)
    {
      v32 = v5;
      v11 = &v32;
      v12 = v7;
LABEL_11:
      v13 = v9;
LABEL_12:
      v14 = v8;
      goto LABEL_40;
    }
    v31 = v5;
    v11 = &v31;
    goto LABEL_30;
  }
  objc_msgSend(v8, "setGridSizeClass:", *MEMORY[0x1E0DAA7A0]);
  objc_msgSend(v6, "setGridSizeClass:", *MEMORY[0x1E0DAA770]);
  v33[0] = v5;
  v11 = (void **)v33;
  v12 = v8;
LABEL_4:
  v13 = v9;
LABEL_5:
  v14 = v7;
LABEL_40:
  v11[1] = v12;
  v11[2] = v13;
  v11[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)migratedSmallAndMediumWidget:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void **v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[6];

  v27[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBWidgetOnboardingLayoutBuilder defaultSmallClockWidgetIcon](self, "defaultSmallClockWidgetIcon");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWidgetOnboardingLayoutBuilder defaultSmallCalendarWidgetIcon](self, "defaultSmallCalendarWidgetIcon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWidgetOnboardingLayoutBuilder defaultMediumFirstSuggestionWidgetIcon](self, "defaultMediumFirstSuggestionWidgetIcon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWidgetOnboardingLayoutBuilder defaultMediumSecondSuggestionWidgetIcon](self, "defaultMediumSecondSuggestionWidgetIcon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "gridSizeClass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = *MEMORY[0x1E0DAA7A0];
  if (v9 == (void *)*MEMORY[0x1E0DAA7A0])
  {

  }
  else
  {
    objc_msgSend(v4, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "gridSizeClass");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", v11);

    if (!v14)
    {
      objc_msgSend(v4, "objectAtIndex:", 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "firstObject");
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  objc_msgSend(v4, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", 1);
  v16 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v17 = (void *)v16;
  if (!-[SBWidgetOnboardingLayoutBuilder isCalendarWidgetIcon:](self, "isCalendarWidgetIcon:", v15))
  {
    if (!-[SBWidgetOnboardingLayoutBuilder isCalendarWidgetIcon:](self, "isCalendarWidgetIcon:", v17))
    {
      objc_msgSend(v5, "setGridSizeClass:", *MEMORY[0x1E0DAA770]);
      v23 = v22;
      v18 = &v23;
      v19 = v5;
      goto LABEL_17;
    }
    if (-[SBWidgetOnboardingLayoutBuilder isFirstSuggestionActiveWidgetIcon:](self, "isFirstSuggestionActiveWidgetIcon:", v15))
    {
      v25 = v22;
      v18 = &v25;
      goto LABEL_12;
    }
    v24 = v22;
    v18 = &v24;
LABEL_16:
    v19 = v6;
    goto LABEL_17;
  }
  if (!-[SBWidgetOnboardingLayoutBuilder isFirstSuggestionActiveWidgetIcon:](self, "isFirstSuggestionActiveWidgetIcon:", v17))
  {
    v26 = v22;
    v18 = &v26;
    goto LABEL_16;
  }
  v27[0] = v22;
  v18 = (void **)v27;
LABEL_12:
  v19 = v7;
LABEL_17:
  v18[1] = v15;
  v18[2] = v17;
  v18[3] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)migratedThreeWidgets:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  BOOL v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  NSObject *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  _QWORD *v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  SBWidgetOnboardingLayoutBuilder *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint8_t buf[8];
  _QWORD v55[6];
  _QWORD v56[5];
  _QWORD v57[5];
  _QWORD v58[5];
  _QWORD v59[5];
  _QWORD v60[5];
  _QWORD v61[5];
  _QWORD v62[5];
  _QWORD v63[4];
  _QWORD v64[5];
  _QWORD v65[5];
  _QWORD v66[5];
  _QWORD v67[4];
  _QWORD v68[5];
  _QWORD v69[5];
  _QWORD v70[4];
  _QWORD v71[4];
  _QWORD v72[4];
  _QWORD v73[4];
  _QWORD v74[5];
  _QWORD v75[5];
  _QWORD v76[7];

  v76[5] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SBWidgetOnboardingLayoutBuilder defaultSmallClockWidgetIcon](self, "defaultSmallClockWidgetIcon");
  v7 = objc_claimAutoreleasedReturnValue();
  -[SBWidgetOnboardingLayoutBuilder defaultSmallCalendarWidgetIcon](self, "defaultSmallCalendarWidgetIcon");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWidgetOnboardingLayoutBuilder defaultMediumFirstSuggestionWidgetIcon](self, "defaultMediumFirstSuggestionWidgetIcon");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWidgetOnboardingLayoutBuilder defaultMediumSecondSuggestionWidgetIcon](self, "defaultMediumSecondSuggestionWidgetIcon");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "gridSizeClass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)*MEMORY[0x1E0DAA770];
  v49 = (void *)*MEMORY[0x1E0DAA770];
  v53 = (void *)v7;
  if (v9 != (void *)*MEMORY[0x1E0DAA770])
  {
    objc_msgSend(v6, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "gridSizeClass");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "isEqualToString:", v10))
    {

LABEL_11:
      objc_msgSend(v6, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndex:", 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndex:", 2);
      v20 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
  }
  objc_msgSend(v6, "objectAtIndex:", 2, self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "gridSizeClass");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0DAA7A0];
  v14 = v6;
  if (v12 == (void *)*MEMORY[0x1E0DAA7A0])
  {
    v17 = 1;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndex:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "gridSizeClass");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", v13);

  }
  v10 = v49;
  if (v9 == v49)
  {

    v6 = v14;
    self = v48;
    if (!v17)
      goto LABEL_11;
  }
  else
  {

    v6 = v14;
    self = v48;
    if ((v17 & 1) == 0)
      goto LABEL_11;
  }
  objc_msgSend(v6, "objectAtIndex:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v20 = objc_claimAutoreleasedReturnValue();
LABEL_12:
  v21 = (void *)v20;
  v22 = -[SBWidgetOnboardingLayoutBuilder isCalendarWidgetIcon:](self, "isCalendarWidgetIcon:", v18)
     || -[SBWidgetOnboardingLayoutBuilder isCalendarWidgetIcon:](self, "isCalendarWidgetIcon:", v19)
     || -[SBWidgetOnboardingLayoutBuilder isCalendarWidgetIcon:](self, "isCalendarWidgetIcon:", v21);
  objc_msgSend(v21, "gridSizeClass");
  v23 = objc_claimAutoreleasedReturnValue();
  if ((void *)v23 == v10)
  {

  }
  else
  {
    v24 = (void *)v23;
    objc_msgSend(v21, "gridSizeClass");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isEqualToString:", v10);

    if (!v26)
    {
      SBLogWidgetDiscoverability();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v27, OS_LOG_TYPE_DEFAULT, "Builder logic small, small, small widgets", buf, 2u);
      }
      v28 = v6;

      v30 = v51;
      v29 = v52;
      v31 = v50;
      if (-[SBWidgetOnboardingLayoutBuilder isCalendarWidgetIcon:](self, "isCalendarWidgetIcon:", v19))
      {
        v32 = v18;
        v18 = v19;
      }
      else
      {
        v38 = -[SBWidgetOnboardingLayoutBuilder isCalendarWidgetIcon:](self, "isCalendarWidgetIcon:", v21);
        if (v38)
          v39 = v18;
        else
          v39 = v21;
        if (v38)
          v18 = v21;
        v21 = v39;
        v32 = v19;
      }
      if (-[SBWidgetOnboardingLayoutBuilder isCalendarWidgetIcon:](self, "isCalendarWidgetIcon:", v18))
      {
        if (-[SBWidgetOnboardingLayoutBuilder isFirstSuggestionActiveWidgetIcon:](self, "isFirstSuggestionActiveWidgetIcon:", v32)&& !-[SBWidgetOnboardingLayoutBuilder isSecondSuggestionActiveWidgetIcon:](self, "isSecondSuggestionActiveWidgetIcon:", v21)|| -[SBWidgetOnboardingLayoutBuilder isFirstSuggestionActiveWidgetIcon:](self, "isFirstSuggestionActiveWidgetIcon:", v21)&& !-[SBWidgetOnboardingLayoutBuilder isSecondSuggestionActiveWidgetIcon:](self, "isSecondSuggestionActiveWidgetIcon:", v32))
        {
          objc_msgSend(v50, "setGridSizeClass:", *MEMORY[0x1E0DAA7A0]);
          v65[0] = v53;
          v65[1] = v18;
          v65[2] = v32;
          v65[3] = v21;
          v65[4] = v50;
          v40 = (void *)MEMORY[0x1E0C99D20];
          v41 = v65;
        }
        else if ((-[SBWidgetOnboardingLayoutBuilder isFirstSuggestionActiveWidgetIcon:](self, "isFirstSuggestionActiveWidgetIcon:", v32)|| !-[SBWidgetOnboardingLayoutBuilder isSecondSuggestionActiveWidgetIcon:](self, "isSecondSuggestionActiveWidgetIcon:", v21))&& (-[SBWidgetOnboardingLayoutBuilder isFirstSuggestionActiveWidgetIcon:](self, "isFirstSuggestionActiveWidgetIcon:", v21)|| !-[SBWidgetOnboardingLayoutBuilder isSecondSuggestionActiveWidgetIcon:](self, "isSecondSuggestionActiveWidgetIcon:", v32)))
        {
          if (-[SBWidgetOnboardingLayoutBuilder isFirstSuggestionActiveWidgetIcon:](self, "isFirstSuggestionActiveWidgetIcon:", v32)&& -[SBWidgetOnboardingLayoutBuilder isSecondSuggestionActiveWidgetIcon:](self, "isSecondSuggestionActiveWidgetIcon:", v21)|| -[SBWidgetOnboardingLayoutBuilder isFirstSuggestionActiveWidgetIcon:](self, "isFirstSuggestionActiveWidgetIcon:", v21)&& -[SBWidgetOnboardingLayoutBuilder isSecondSuggestionActiveWidgetIcon:](self, "isSecondSuggestionActiveWidgetIcon:", v32))
          {
            v63[0] = v53;
            v63[1] = v18;
            v63[2] = v51;
            v63[3] = v50;
            v40 = (void *)MEMORY[0x1E0C99D20];
            v41 = v63;
            v43 = 4;
LABEL_92:
            objc_msgSend(v40, "arrayWithObjects:count:", v41, v43);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v32;
            v6 = v28;
            goto LABEL_93;
          }
          v62[0] = v53;
          v62[1] = v18;
          v62[2] = v32;
          v62[3] = v21;
          v62[4] = v51;
          v40 = (void *)MEMORY[0x1E0C99D20];
          v41 = v62;
        }
        else
        {
          objc_msgSend(v51, "setGridSizeClass:", *MEMORY[0x1E0DAA7A0]);
          v64[0] = v53;
          v64[1] = v18;
          v64[2] = v32;
          v64[3] = v21;
          v64[4] = v51;
          v40 = (void *)MEMORY[0x1E0C99D20];
          v41 = v64;
        }
      }
      else if (-[SBWidgetOnboardingLayoutBuilder isFirstSuggestionActiveWidgetIcon:](self, "isFirstSuggestionActiveWidgetIcon:", v18))
      {
        v61[0] = v53;
        v61[1] = v52;
        v61[2] = v32;
        v61[3] = v21;
        v61[4] = v51;
        v40 = (void *)MEMORY[0x1E0C99D20];
        v41 = v61;
      }
      else if (-[SBWidgetOnboardingLayoutBuilder isSecondSuggestionActiveWidgetIcon:](self, "isSecondSuggestionActiveWidgetIcon:", v18))
      {
        v60[0] = v53;
        v60[1] = v52;
        v60[2] = v32;
        v60[3] = v21;
        v60[4] = v50;
        v40 = (void *)MEMORY[0x1E0C99D20];
        v41 = v60;
      }
      else if (-[SBWidgetOnboardingLayoutBuilder isFirstSuggestionActiveWidgetIcon:](self, "isFirstSuggestionActiveWidgetIcon:", v32))
      {
        v59[0] = v53;
        v59[1] = v52;
        v59[2] = v18;
        v59[3] = v21;
        v59[4] = v51;
        v40 = (void *)MEMORY[0x1E0C99D20];
        v41 = v59;
      }
      else if (-[SBWidgetOnboardingLayoutBuilder isSecondSuggestionActiveWidgetIcon:](self, "isSecondSuggestionActiveWidgetIcon:", v32))
      {
        v58[0] = v53;
        v58[1] = v52;
        v58[2] = v18;
        v58[3] = v21;
        v58[4] = v50;
        v40 = (void *)MEMORY[0x1E0C99D20];
        v41 = v58;
      }
      else if (-[SBWidgetOnboardingLayoutBuilder isFirstSuggestionActiveWidgetIcon:](self, "isFirstSuggestionActiveWidgetIcon:", v21))
      {
        v57[0] = v53;
        v57[1] = v52;
        v57[2] = v18;
        v57[3] = v32;
        v57[4] = v51;
        v40 = (void *)MEMORY[0x1E0C99D20];
        v41 = v57;
      }
      else
      {
        if (!-[SBWidgetOnboardingLayoutBuilder isSecondSuggestionActiveWidgetIcon:](self, "isSecondSuggestionActiveWidgetIcon:", v21))
        {
          objc_msgSend(v51, "setGridSizeClass:", *MEMORY[0x1E0DAA7A0]);
          v55[0] = v53;
          v55[1] = v52;
          v55[2] = v18;
          v55[3] = v32;
          v55[4] = v21;
          v55[5] = v51;
          v40 = (void *)MEMORY[0x1E0C99D20];
          v41 = v55;
          v43 = 6;
          goto LABEL_92;
        }
        v56[0] = v53;
        v56[1] = v52;
        v56[2] = v18;
        v56[3] = v32;
        v56[4] = v50;
        v40 = (void *)MEMORY[0x1E0C99D20];
        v41 = v56;
      }
      v43 = 5;
      goto LABEL_92;
    }
  }
  SBLogWidgetDiscoverability();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v33, OS_LOG_TYPE_DEFAULT, "Builder logic small, small, medium widgets", buf, 2u);
  }

  if (!v22)
  {
    v29 = v52;
    v76[0] = v53;
    v76[1] = v52;
    v76[2] = v18;
    v76[3] = v19;
    v76[4] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 5);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v50;
    v30 = v51;
    goto LABEL_93;
  }
  if (!-[SBWidgetOnboardingLayoutBuilder isCalendarWidgetIcon:](self, "isCalendarWidgetIcon:", v18))
  {
    v31 = v50;
    v30 = v51;
    if (-[SBWidgetOnboardingLayoutBuilder isCalendarWidgetIcon:](self, "isCalendarWidgetIcon:", v19))
    {
      v29 = v52;
      if (-[SBWidgetOnboardingLayoutBuilder isFirstSuggestionActiveWidgetIcon:](self, "isFirstSuggestionActiveWidgetIcon:", v18))
      {
        v72[0] = v53;
        v72[1] = v19;
        v72[2] = v51;
        v72[3] = v21;
        v36 = (void *)MEMORY[0x1E0C99D20];
        v37 = v72;
      }
      else if (-[SBWidgetOnboardingLayoutBuilder isSecondSuggestionActiveWidgetIcon:](self, "isSecondSuggestionActiveWidgetIcon:", v18))
      {
        v71[0] = v53;
        v71[1] = v19;
        v71[2] = v50;
        v71[3] = v21;
        v36 = (void *)MEMORY[0x1E0C99D20];
        v37 = v71;
      }
      else
      {
        objc_msgSend(v52, "setGridSizeClass:", v49);
        v70[0] = v53;
        v70[1] = v18;
        v70[2] = v52;
        v70[3] = v21;
        v36 = (void *)MEMORY[0x1E0C99D20];
        v37 = v70;
      }
    }
    else
    {
      v29 = v52;
      if (!-[SBWidgetOnboardingLayoutBuilder isCalendarWidgetIcon:](self, "isCalendarWidgetIcon:", v21))
      {
        v35 = 0;
        goto LABEL_93;
      }
      if (-[SBWidgetOnboardingLayoutBuilder isFirstSuggestionActiveWidgetIcon:](self, "isFirstSuggestionActiveWidgetIcon:", v18)&& !-[SBWidgetOnboardingLayoutBuilder isSecondSuggestionActiveWidgetIcon:](self, "isSecondSuggestionActiveWidgetIcon:", v19))
      {
        v45 = *MEMORY[0x1E0DAA7A0];
        objc_msgSend(v51, "setGridSizeClass:", *MEMORY[0x1E0DAA7A0]);
        objc_msgSend(v50, "setGridSizeClass:", v45);
        v69[0] = v53;
        v69[1] = v51;
        v69[2] = v21;
        v69[3] = v19;
        v69[4] = v50;
        v36 = (void *)MEMORY[0x1E0C99D20];
        v37 = v69;
        goto LABEL_87;
      }
      if (-[SBWidgetOnboardingLayoutBuilder isFirstSuggestionActiveWidgetIcon:](self, "isFirstSuggestionActiveWidgetIcon:", v19)&& !-[SBWidgetOnboardingLayoutBuilder isSecondSuggestionActiveWidgetIcon:](self, "isSecondSuggestionActiveWidgetIcon:", v18))
      {
        v46 = *MEMORY[0x1E0DAA7A0];
        objc_msgSend(v51, "setGridSizeClass:", *MEMORY[0x1E0DAA7A0]);
        objc_msgSend(v50, "setGridSizeClass:", v46);
        v68[0] = v53;
        v68[1] = v18;
        v68[2] = v21;
        v68[3] = v51;
        v68[4] = v50;
        v36 = (void *)MEMORY[0x1E0C99D20];
        v37 = v68;
        goto LABEL_87;
      }
      if ((!-[SBWidgetOnboardingLayoutBuilder isFirstSuggestionActiveWidgetIcon:](self, "isFirstSuggestionActiveWidgetIcon:", v18)|| !-[SBWidgetOnboardingLayoutBuilder isSecondSuggestionActiveWidgetIcon:](self, "isSecondSuggestionActiveWidgetIcon:", v19))&& (!-[SBWidgetOnboardingLayoutBuilder isFirstSuggestionActiveWidgetIcon:](self, "isFirstSuggestionActiveWidgetIcon:", v19)|| !-[SBWidgetOnboardingLayoutBuilder isSecondSuggestionActiveWidgetIcon:](self, "isSecondSuggestionActiveWidgetIcon:", v18)))
      {
        objc_msgSend(v51, "setGridSizeClass:", *MEMORY[0x1E0DAA7A0]);
        v66[0] = v53;
        v66[1] = v51;
        v66[2] = v18;
        v66[3] = v19;
        v66[4] = v21;
        v36 = (void *)MEMORY[0x1E0C99D20];
        v37 = v66;
        goto LABEL_87;
      }
      objc_msgSend(v51, "setGridSizeClass:", *MEMORY[0x1E0DAA7A0]);
      v67[0] = v53;
      v67[1] = v51;
      v67[2] = v21;
      v67[3] = v50;
      v36 = (void *)MEMORY[0x1E0C99D20];
      v37 = v67;
    }
LABEL_79:
    v44 = 4;
LABEL_88:
    objc_msgSend(v36, "arrayWithObjects:count:", v37, v44);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_93;
  }
  v31 = v50;
  v30 = v51;
  if (!-[SBWidgetOnboardingLayoutBuilder isFirstSuggestionActiveWidgetIcon:](self, "isFirstSuggestionActiveWidgetIcon:", v19))
  {
    v29 = v52;
    if (-[SBWidgetOnboardingLayoutBuilder isSecondSuggestionActiveWidgetIcon:](self, "isSecondSuggestionActiveWidgetIcon:", v19))
    {
      v42 = *MEMORY[0x1E0DAA7A0];
      objc_msgSend(v51, "setGridSizeClass:", *MEMORY[0x1E0DAA7A0]);
      objc_msgSend(v50, "setGridSizeClass:", v42);
      v74[0] = v53;
      v74[1] = v18;
      v74[2] = v50;
      v74[3] = v51;
      v74[4] = v21;
      v36 = (void *)MEMORY[0x1E0C99D20];
      v37 = v74;
LABEL_87:
      v44 = 5;
      goto LABEL_88;
    }
    objc_msgSend(v52, "setGridSizeClass:", v49);
    v73[0] = v53;
    v73[1] = v19;
    v73[2] = v52;
    v73[3] = v21;
    v36 = (void *)MEMORY[0x1E0C99D20];
    v37 = v73;
    goto LABEL_79;
  }
  v34 = *MEMORY[0x1E0DAA7A0];
  objc_msgSend(v51, "setGridSizeClass:", *MEMORY[0x1E0DAA7A0]);
  objc_msgSend(v50, "setGridSizeClass:", v34);
  v75[0] = v53;
  v75[1] = v18;
  v75[2] = v51;
  v75[3] = v50;
  v75[4] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 5);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v52;
LABEL_93:

  return v35;
}

- (id)migratedFourWidgets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  _BOOL4 v13;
  _BOOL4 v14;
  void **v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[8];

  v27[6] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBWidgetOnboardingLayoutBuilder defaultSmallClockWidgetIcon](self, "defaultSmallClockWidgetIcon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWidgetOnboardingLayoutBuilder defaultSmallCalendarWidgetIcon](self, "defaultSmallCalendarWidgetIcon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWidgetOnboardingLayoutBuilder defaultMediumFirstSuggestionWidgetIcon](self, "defaultMediumFirstSuggestionWidgetIcon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWidgetOnboardingLayoutBuilder defaultMediumSecondSuggestionWidgetIcon](self, "defaultMediumSecondSuggestionWidgetIcon");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBWidgetOnboardingLayoutBuilder isCalendarWidgetIcon:](self, "isCalendarWidgetIcon:", v8)
    || -[SBWidgetOnboardingLayoutBuilder isCalendarWidgetIcon:](self, "isCalendarWidgetIcon:", v9)
    || -[SBWidgetOnboardingLayoutBuilder isCalendarWidgetIcon:](self, "isCalendarWidgetIcon:", v10))
  {
    v12 = 0;
  }
  else
  {
    v12 = !-[SBWidgetOnboardingLayoutBuilder isCalendarWidgetIcon:](self, "isCalendarWidgetIcon:", v11);
  }
  v13 = -[SBWidgetOnboardingLayoutBuilder isFirstSuggestionActiveWidgetIcon:](self, "isFirstSuggestionActiveWidgetIcon:", v8)|| -[SBWidgetOnboardingLayoutBuilder isFirstSuggestionActiveWidgetIcon:](self, "isFirstSuggestionActiveWidgetIcon:", v9)|| -[SBWidgetOnboardingLayoutBuilder isFirstSuggestionActiveWidgetIcon:](self, "isFirstSuggestionActiveWidgetIcon:", v10)|| -[SBWidgetOnboardingLayoutBuilder isFirstSuggestionActiveWidgetIcon:](self, "isFirstSuggestionActiveWidgetIcon:", v11);
  v14 = -[SBWidgetOnboardingLayoutBuilder isSecondSuggestionActiveWidgetIcon:](self, "isSecondSuggestionActiveWidgetIcon:", v8)|| -[SBWidgetOnboardingLayoutBuilder isSecondSuggestionActiveWidgetIcon:](self, "isSecondSuggestionActiveWidgetIcon:", v9)|| -[SBWidgetOnboardingLayoutBuilder isSecondSuggestionActiveWidgetIcon:](self, "isSecondSuggestionActiveWidgetIcon:", v10)|| -[SBWidgetOnboardingLayoutBuilder isSecondSuggestionActiveWidgetIcon:](self, "isSecondSuggestionActiveWidgetIcon:", v11);
  if (((v12 | v13) & 1) != 0)
  {
    if (((v12 | v14) & 1) == 0)
    {
      v21 = v24;
      objc_msgSend(v24, "setGridSizeClass:", *MEMORY[0x1E0DAA7A0]);
      v15 = &v26;
      v16 = v8;
      v26 = v5;
      v17 = v9;
      v18 = v10;
      v19 = v11;
      v20 = v24;
      goto LABEL_19;
    }
    v15 = &v25;
    v16 = v6;
    v25 = v5;
    v17 = v8;
    v18 = v9;
    v19 = v10;
    v20 = v11;
  }
  else
  {
    objc_msgSend(v7, "setGridSizeClass:", *MEMORY[0x1E0DAA7A0]);
    v15 = (void **)v27;
    v16 = v8;
    v27[0] = v5;
    v17 = v9;
    v18 = v10;
    v19 = v11;
    v20 = v7;
  }
  v21 = v24;
LABEL_19:
  v15[1] = v16;
  v15[2] = v17;
  v15[3] = v18;
  v15[4] = v19;
  v15[5] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)migratedDefaultWidgets:(BOOL)a3
{
  _BOOL4 v3;
  SBWidgetOnboardingLayoutBuilder *v4;
  NSArray *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSArray *v13;
  SBWidgetOnboardingLayoutBuilder *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  int v29;
  SBWidgetOnboardingLayoutBuilder *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  const char *v37;
  const char *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  int v44;
  NSObject *v45;
  NSObject *v46;
  uint64_t v47;
  NSObject *v48;
  NSObject *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  SBWidgetOnboardingLayoutBuilder *v59;
  void *v60;
  NSObject *v61;
  void *v63;
  id obj;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t buf[8];
  _BYTE v70[128];
  _QWORD v71[4];
  _QWORD v72[7];

  v3 = a3;
  v4 = self;
  v72[5] = *MEMORY[0x1E0C80C00];
  v5 = self->_pinnedWidgets;
  if (v3)
  {
    -[SBWidgetOnboardingLayoutBuilder defaultSmallClockWidgetIcon](v4, "defaultSmallClockWidgetIcon", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    -[SBWidgetOnboardingLayoutBuilder defaultSmallNotesWidgetIcon](v4, "defaultSmallNotesWidgetIcon");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBWidgetOnboardingLayoutBuilder defaultMediumCalendarWidgetIcon](v4, "defaultMediumCalendarWidgetIcon");
    v8 = objc_claimAutoreleasedReturnValue();
    -[SBWidgetOnboardingLayoutBuilder defaultLargeFirstSuggestionWidgetIcon](v4, "defaultLargeFirstSuggestionWidgetIcon");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBWidgetOnboardingLayoutBuilder defaultLargeSecondSuggestionWidgetIcon](v4, "defaultLargeSecondSuggestionWidgetIcon");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = v6;
    v72[1] = v7;
    v72[2] = v9;
    v72[3] = v10;
    v72[4] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogWidgetDiscoverability();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "Builder logic 0", buf, 2u);
    }

LABEL_5:
LABEL_6:

    goto LABEL_52;
  }
  v13 = v5;
  if (-[NSArray count](v5, "count", v5) != 1)
  {
    if (-[NSArray count](v13, "count") != 2)
    {
      if (-[NSArray count](v13, "count") == 3)
      {
        -[SBWidgetOnboardingLayoutBuilder migratedThreeWidgets:](v4, "migratedThreeWidgets:", v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        SBLogWidgetDiscoverability();
        v6 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          goto LABEL_52;
        *(_WORD *)buf = 0;
        v38 = "Builder logic three widgets";
      }
      else
      {
        if (-[NSArray count](v13, "count") != 4)
        {
          -[SBWidgetOnboardingLayoutBuilder defaultSmallClockWidgetIcon](v4, "defaultSmallClockWidgetIcon");
          v6 = objc_claimAutoreleasedReturnValue();
          -[SBWidgetOnboardingLayoutBuilder defaultSmallCalendarWidgetIcon](v4, "defaultSmallCalendarWidgetIcon");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBWidgetOnboardingLayoutBuilder defaultMediumFirstSuggestionWidgetIcon](v4, "defaultMediumFirstSuggestionWidgetIcon");
          v8 = objc_claimAutoreleasedReturnValue();
          -[SBWidgetOnboardingLayoutBuilder defaultMediumSecondSuggestionWidgetIcon](v4, "defaultMediumSecondSuggestionWidgetIcon");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v71[0] = v6;
          v71[1] = v7;
          v71[2] = v8;
          v71[3] = v9;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 4);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          SBLogWidgetDiscoverability();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D0540000, v45, OS_LOG_TYPE_DEFAULT, "Builder logic other", buf, 2u);
          }

          goto LABEL_5;
        }
        -[SBWidgetOnboardingLayoutBuilder migratedFourWidgets:](v4, "migratedFourWidgets:", v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        SBLogWidgetDiscoverability();
        v6 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          goto LABEL_52;
        *(_WORD *)buf = 0;
        v38 = "Builder logic four widgets";
      }
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, v38, buf, 2u);
      goto LABEL_52;
    }
    v30 = v4;
    -[NSArray firstObject](v13, "firstObject");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndex:](v13, "objectAtIndex:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject gridSizeClass](v6, "gridSizeClass");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "gridSizeClass");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v31 == (void *)v32)
    {

    }
    else
    {
      v33 = (void *)v32;
      -[NSObject gridSizeClass](v6, "gridSizeClass");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "gridSizeClass");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqualToString:", v35);

      if (!v36)
      {
        v4 = v30;
        -[SBWidgetOnboardingLayoutBuilder migratedSmallAndMediumWidget:](v30, "migratedSmallAndMediumWidget:", v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        SBLogWidgetDiscoverability();
        v8 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          goto LABEL_6;
        *(_WORD *)buf = 0;
        v37 = "Builder logic one small, one medium";
LABEL_39:
        _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, v37, buf, 2u);
        goto LABEL_6;
      }
    }
    -[NSObject gridSizeClass](v6, "gridSizeClass");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v40;
    v42 = *MEMORY[0x1E0DAA7A0];
    if (v40 == (void *)*MEMORY[0x1E0DAA7A0])
    {

    }
    else
    {
      -[NSObject gridSizeClass](v6, "gridSizeClass");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "isEqualToString:", v42);

      if (!v44)
      {
        v4 = v30;
        -[SBWidgetOnboardingLayoutBuilder migratedTwoMediumWidgets:](v30, "migratedTwoMediumWidgets:", v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        SBLogWidgetDiscoverability();
        v8 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          goto LABEL_6;
        *(_WORD *)buf = 0;
        v37 = "Builder logic two mediums";
        goto LABEL_39;
      }
    }
    v4 = v30;
    -[SBWidgetOnboardingLayoutBuilder migratedTwoSmallWidgets:](v30, "migratedTwoSmallWidgets:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogWidgetDiscoverability();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_6;
    *(_WORD *)buf = 0;
    v37 = "Builder logic two smalls";
    goto LABEL_39;
  }
  v14 = v4;
  -[NSArray firstObject](v13, "firstObject");
  v6 = objc_claimAutoreleasedReturnValue();
  -[NSObject gridSizeClass](v6, "gridSizeClass");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  v17 = *MEMORY[0x1E0DAA768];
  if (v15 == (void *)*MEMORY[0x1E0DAA768])
  {

  }
  else
  {
    -[NSObject gridSizeClass](v6, "gridSizeClass");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", v17);

    if (!v19)
    {
      -[NSObject gridSizeClass](v6, "gridSizeClass");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      v22 = *MEMORY[0x1E0DAA770];
      if (v20 == (void *)*MEMORY[0x1E0DAA770])
      {

      }
      else
      {
        -[NSObject gridSizeClass](v6, "gridSizeClass");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isEqualToString:", v22);

        if (!v24)
        {
          -[NSObject gridSizeClass](v6, "gridSizeClass");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v25;
          v27 = *MEMORY[0x1E0DAA7A0];
          if (v25 == (void *)*MEMORY[0x1E0DAA7A0])
          {

          }
          else
          {
            -[NSObject gridSizeClass](v6, "gridSizeClass");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "isEqualToString:", v27);

            if (!v29)
            {
              v11 = 0;
              v4 = v14;
              goto LABEL_52;
            }
          }
          SBLogWidgetDiscoverability();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D0540000, v48, OS_LOG_TYPE_DEFAULT, "Builder logic one small", buf, 2u);
          }

          v4 = v14;
          -[SBWidgetOnboardingLayoutBuilder migratedOneSmallWidget:](v14, "migratedOneSmallWidget:", v6);
          v47 = objc_claimAutoreleasedReturnValue();
          goto LABEL_51;
        }
      }
      SBLogWidgetDiscoverability();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v46, OS_LOG_TYPE_DEFAULT, "Builder logic one medium", buf, 2u);
      }

      v4 = v14;
      -[SBWidgetOnboardingLayoutBuilder migratedOneMediumWidget:](v14, "migratedOneMediumWidget:", v6);
      v47 = objc_claimAutoreleasedReturnValue();
LABEL_51:
      v11 = (void *)v47;
      goto LABEL_52;
    }
  }
  v4 = v14;
  -[SBWidgetOnboardingLayoutBuilder migratedOneLargeWidget:](v14, "migratedOneLargeWidget:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogWidgetDiscoverability();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v39, OS_LOG_TYPE_DEFAULT, "Builder logic one large", buf, 2u);
  }

LABEL_52:
  SBLogWidgetDiscoverability();
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v49, OS_LOG_TYPE_DEFAULT, "Builder logic CalendarWidgetMigrator starting...", buf, 2u);
  }

  v50 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  obj = v11;
  v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
  if (v51)
  {
    v52 = v51;
    v53 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v52; ++i)
      {
        if (*(_QWORD *)v66 != v53)
          objc_enumerationMutation(obj);
        v55 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
        objc_msgSend(v55, "activeWidget");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "kind");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v57, "isEqualToString:", CFSTR("com.apple.CalendarWidget.CalendarWidget")))
        {
          objc_msgSend(v55, "gridSizeClass");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = v4;
          -[SBWidgetOnboardingLayoutBuilder defaultCalendarWidgetIcon:](v4, "defaultCalendarWidgetIcon:", v58);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "addObject:", v60);

          SBLogWidgetDiscoverability();
          v61 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D0540000, v61, OS_LOG_TYPE_DEFAULT, "Builder logic: Upgrading calendar widget", buf, 2u);
          }

          v4 = v59;
        }
        else
        {
          objc_msgSend(v50, "addObject:", v55);
        }

      }
      v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
    }
    while (v52);
  }

  return v50;
}

- (NSArray)pinnedWidgets
{
  return self->_pinnedWidgets;
}

- (NSArray)suggestionWidgets
{
  return self->_suggestionWidgets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionWidgets, 0);
  objc_storeStrong((id *)&self->_pinnedWidgets, 0);
}

@end
