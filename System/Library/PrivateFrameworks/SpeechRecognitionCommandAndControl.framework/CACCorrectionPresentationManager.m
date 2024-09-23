@implementation CACCorrectionPresentationManager

- (void)_showCorrectionsForElement:(id)a3 fromString:(id)a4 withAlternatives:(id)a5 withEmojis:(id)a6 portraitUpRect:(CGRect)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  _QWORD v28[5];

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __117__CACCorrectionPresentationManager__showCorrectionsForElement_fromString_withAlternatives_withEmojis_portraitUpRect___block_invoke;
  v28[3] = &unk_24F2ABD68;
  v28[4] = self;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __117__CACCorrectionPresentationManager__showCorrectionsForElement_fromString_withAlternatives_withEmojis_portraitUpRect___block_invoke_2;
  v20[3] = &unk_24F2AD5E0;
  v21 = v14;
  v22 = v15;
  v23 = v16;
  v24 = x;
  v25 = y;
  v26 = width;
  v27 = height;
  v17 = v16;
  v18 = v15;
  v19 = v14;
  -[CACSimpleContentViewManager showViewControllerWithCreationHandler:updateHandler:](self, "showViewControllerWithCreationHandler:updateHandler:", v28, v20);

}

id __117__CACCorrectionPresentationManager__showCorrectionsForElement_fromString_withAlternatives_withEmojis_portraitUpRect___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setDelegate:", *(_QWORD *)(a1 + 32));
  return v2;
}

void __117__CACCorrectionPresentationManager__showCorrectionsForElement_fromString_withAlternatives_withEmojis_portraitUpRect___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setText:", v3);
  objc_msgSend(v4, "setAlternatives:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setEmojis:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "setPortraitUpSourceRect:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));

}

- (void)showCorrectionsForElement:(id)a3 nBestStrings:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  char v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t j;
  void *v52;
  void *v53;
  void *v54;
  char v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t k;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  char v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  CACCorrectionPresentationManager *v79;
  void *v80;
  int v81;
  uint64_t v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  CACCorrectionPresentationManager *v92;
  id v93;
  void *v94;
  id obj;
  void *v96;
  void *v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  uint64_t v113;

  v113 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[CACCorrectionPresentationManager setElement:](self, "setElement:", v6);
  if (showCorrectionsForElement_nBestStrings__textCheckerInialize != -1)
    dispatch_once(&showCorrectionsForElement_nBestStrings__textCheckerInialize, &__block_literal_global_48);
  v8 = objc_msgSend(v6, "selectedTextRange");
  objc_msgSend(v6, "rectForRange:", v8, v9);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(v6, "cacTextSelectionCACTextMarkerRange");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cacStringForCACTextMarkerRange:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_opt_new();
  if (objc_msgSend(v19, "length"))
  {
    v94 = v7;
    v22 = objc_msgSend(v19, "characterAtIndex:", 0);
    if (objc_msgSend(v19, "length") == 1
      && ((v22 - 32) < 0x5F || (v22 - 8216) <= 5 && ((1 << (v22 - 24)) & 0x33) != 0))
    {
      objc_msgSend(MEMORY[0x24BDD14A8], "alphanumericCharacterSet");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "characterIsMember:", v22);

      if ((v24 & 1) != 0)
      {
        if ((v22 - 48) > 9)
        {
          v79 = self;
          objc_msgSend(v19, "uppercaseString");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v19;
          v81 = objc_msgSend(v19, "isEqualToString:", v80);

          v82 = 65;
          do
          {
            while (v81)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%c"), v82);
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "addObject:", v83);

              v82 = (v82 + 1);
              if ((_DWORD)v82 == 91)
              {
                objc_msgSend(v19, "lowercaseString");
                v85 = objc_claimAutoreleasedReturnValue();
                goto LABEL_67;
              }
            }
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%c"), (v82 + 32));
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObject:", v84);

            v82 = (v82 + 1);
          }
          while ((_DWORD)v82 != 91);
          objc_msgSend(v19, "uppercaseString");
          v85 = objc_claimAutoreleasedReturnValue();
LABEL_67:
          v86 = (void *)v85;
          objc_msgSend(v21, "addObject:", v85);

          v87 = 0;
          self = v79;
          do
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), v87);
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObject:", v88);

            v87 = (v87 + 1);
          }
          while ((_DWORD)v87 != 10);
        }
        else
        {
          v25 = v19;
          v26 = 0;
          do
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObject:", v27);

            v26 = (v26 + 1);
          }
          while ((_DWORD)v26 != 10);
          v28 = 65;
          do
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%c"), v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObject:", v29);

            v28 = (v28 + 1);
          }
          while ((_DWORD)v28 != 91);
        }
      }
      else
      {
        v25 = v19;
        v71 = 33;
        do
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%c"), v71);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v72);

          v71 = (v71 + 1);
        }
        while ((_DWORD)v71 != 48);
        v73 = 58;
        do
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%c"), v73);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v74);

          v73 = (v73 + 1);
        }
        while ((_DWORD)v73 != 65);
        v75 = 91;
        do
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%c"), v75);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v76);

          v75 = (v75 + 1);
        }
        while ((_DWORD)v75 != 97);
        v77 = 123;
        do
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%c"), v77);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v78);

          v77 = (v77 + 1);
        }
        while ((_DWORD)v77 != 127);
        objc_msgSend(v21, "addObject:", CFSTR("“"));
        objc_msgSend(v21, "addObject:", CFSTR("”"));
        objc_msgSend(v21, "addObject:", CFSTR("‘"));
        objc_msgSend(v21, "addObject:", CFSTR("’"));
      }
      v7 = v94;
    }
    else
    {
      v92 = self;
      +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "leadingTextForCurrentSelection");
      v97 = (void *)objc_claimAutoreleasedReturnValue();

      +[CACSpeechSystem speechSystem](CACSpeechSystem, "speechSystem");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "recognitionLocaleIdentifier");
      v32 = objc_claimAutoreleasedReturnValue();

      +[CACCorrectionUtilities emojiSuggestionsForString:](CACCorrectionUtilities, "emojiSuggestionsForString:", v19);
      v90 = (void *)objc_claimAutoreleasedReturnValue();

      v96 = (void *)v32;
      +[CACCorrectionUtilities alternativesForString:languageIdentifier:](CACCorrectionUtilities, "alternativesForString:languageIdentifier:", v19, v32);
      v33 = objc_claimAutoreleasedReturnValue();
      +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v32) = objc_msgSend(v34, "dictationRecognizerMode");

      v93 = v6;
      v91 = v19;
      v89 = (void *)v33;
      if ((v32 - 4) > 0xFFFFFFFD)
      {
        v36 = 0;
      }
      else
      {
        +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "doesCurrentLanguageSupportInterWordSpaces");

      }
      +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "bestLocaleIdentifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "vocabularyEntriesForLocaleIdentifier:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      v41 = (void *)objc_opt_new();
      v106 = 0u;
      v107 = 0u;
      v108 = 0u;
      v109 = 0u;
      obj = v40;
      v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v112, 16);
      if (v42)
      {
        v43 = v42;
        v44 = *(_QWORD *)v107;
        do
        {
          for (i = 0; i != v43; ++i)
          {
            if (*(_QWORD *)v107 != v44)
              objc_enumerationMutation(obj);
            objc_msgSend(*(id *)(*((_QWORD *)&v106 + 1) + 8 * i), "objectForKey:", CFSTR("Text"));
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "addObject:", v46);

          }
          v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v112, 16);
        }
        while (v43);
      }

      v104 = 0u;
      v105 = 0u;
      v102 = 0u;
      v103 = 0u;
      v47 = v94;
      v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v102, v111, 16);
      if (v48)
      {
        v49 = v48;
        v50 = *(_QWORD *)v103;
        do
        {
          for (j = 0; j != v49; ++j)
          {
            if (*(_QWORD *)v103 != v50)
              objc_enumerationMutation(v47);
            v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * j));
            if (v36)
            {
              v53 = (void *)objc_msgSend(v41, "copy");
              objc_msgSend(v52, "adjustCapsAndSpacingUsingLeadingText:localeIdentifier:vocabularyEntries:spellingGuessesBlock:", v97, v96, v53, &__block_literal_global_203_1);

            }
            objc_msgSend(v52, "string");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = objc_msgSend(v21, "containsObject:", v54);

            if ((v55 & 1) == 0)
            {
              objc_msgSend(v52, "string");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "addObject:", v56);

            }
          }
          v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v102, v111, 16);
        }
        while (v49);
      }

      v100 = 0u;
      v101 = 0u;
      v98 = 0u;
      v99 = 0u;
      v57 = v89;
      v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v98, v110, 16);
      if (v58)
      {
        v59 = v58;
        v60 = *(_QWORD *)v99;
        do
        {
          for (k = 0; k != v59; ++k)
          {
            if (*(_QWORD *)v99 != v60)
              objc_enumerationMutation(v57);
            v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * k));
            if (v36)
            {
              v63 = (void *)objc_msgSend(v41, "copy");
              objc_msgSend(v62, "adjustCapsAndSpacingUsingLeadingText:localeIdentifier:vocabularyEntries:spellingGuessesBlock:", v97, v96, v63, &__block_literal_global_204_2);

            }
            objc_msgSend(v62, "stringByReplacingNewLinesWithSymbols");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = (void *)objc_msgSend(v64, "mutableCopy");

            objc_msgSend(v65, "string");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = objc_msgSend(v21, "containsObject:", v66);

            if ((v67 & 1) == 0)
            {
              objc_msgSend(v65, "string");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "addObject:", v68);

            }
          }
          v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v98, v110, 16);
        }
        while (v59);
      }

      if ((unint64_t)objc_msgSend(v21, "count") >= 0x10)
        objc_msgSend(v21, "removeObjectsInRange:", 15, objc_msgSend(v21, "count") - 15);
      v69 = v90;
      v6 = v93;
      v7 = v94;
      v25 = v91;
      if ((unint64_t)objc_msgSend(v90, "count") >= 0xD)
      {
        objc_msgSend(v90, "subarrayWithRange:", 0, 12);
        v70 = objc_claimAutoreleasedReturnValue();

        v69 = (void *)v70;
      }

      v20 = v69;
      self = v92;
    }
    objc_msgSend(v25, "stringByReplacingNewLinesWithSymbols");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[CACCorrectionPresentationManager _showCorrectionsForElement:fromString:withAlternatives:withEmojis:portraitUpRect:](self, "_showCorrectionsForElement:fromString:withAlternatives:withEmojis:portraitUpRect:", v6, v19, v21, v20, v11, v13, v15, v17);
  }

}

void __75__CACCorrectionPresentationManager_showCorrectionsForElement_nBestStrings___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)showCorrectionsForElement_nBestStrings__sChecker;
  showCorrectionsForElement_nBestStrings__sChecker = v0;

}

uint64_t __75__CACCorrectionPresentationManager_showCorrectionsForElement_nBestStrings___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend((id)showCorrectionsForElement_nBestStrings__sChecker, "guessesForWordRange:inString:language:", a2, a3, a4, a5);
}

uint64_t __75__CACCorrectionPresentationManager_showCorrectionsForElement_nBestStrings___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend((id)showCorrectionsForElement_nBestStrings__sChecker, "guessesForWordRange:inString:language:", a2, a3, a4, a5);
}

- (void)hideIfNeededForElements:(id)a3
{
  id v4;
  CACCorrectionPresentationManager *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[CACCorrectionPresentationManager element](v5, "element");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CACCorrectionPresentationManager element](v5, "element");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "containsObject:", v7) & 1) == 0)
    {
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __60__CACCorrectionPresentationManager_hideIfNeededForElements___block_invoke;
      v8[3] = &unk_24F2AA860;
      v8[4] = v5;
      -[CACSimpleContentViewManager hideAnimated:completion:](v5, "hideAnimated:completion:", 0, v8);
    }

  }
  objc_sync_exit(v5);

}

uint64_t __60__CACCorrectionPresentationManager_hideIfNeededForElements___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setElement:", 0);
}

- (id)currentlyDisplayedCorrections
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACSimpleContentViewManager viewController](self, "viewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "alternatives");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      objc_msgSend(v5, "alternatives");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObjectsFromArray:", v8);

    }
    objc_msgSend(v5, "emojis");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      objc_msgSend(v5, "emojis");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObjectsFromArray:", v11);

    }
  }

  return v3;
}

- (void)correctionsPresentationViewController:(id)a3 didSelectItemWithText:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[CACEmojiManager sharedManager](CACEmojiManager, "sharedManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "willInsertStringPotentiallyContainingEmojis:", v7);

      -[CACCorrectionPresentationManager element](self, "element");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "insertText:asUndoableAction:", v7, 1);

      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __96__CACCorrectionPresentationManager_correctionsPresentationViewController_didSelectItemWithText___block_invoke;
      v10[3] = &unk_24F2AA860;
      v10[4] = self;
      -[CACSimpleContentViewManager hideAnimated:completion:](self, "hideAnimated:completion:", 1, v10);
    }
  }

}

uint64_t __96__CACCorrectionPresentationManager_correctionsPresentationViewController_didSelectItemWithText___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setElement:", 0);
}

- (void)dismissCorrectionsPresentationViewController:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __81__CACCorrectionPresentationManager_dismissCorrectionsPresentationViewController___block_invoke;
  v3[3] = &unk_24F2AA860;
  v3[4] = self;
  -[CACSimpleContentViewManager hideAnimated:completion:](self, "hideAnimated:completion:", 1, v3);
}

uint64_t __81__CACCorrectionPresentationManager_dismissCorrectionsPresentationViewController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setElement:", 0);
}

- (BOOL)isOverlay
{
  return 0;
}

+ (int64_t)remoteViewType
{
  return 4;
}

+ (int)axNotification
{
  return 2029;
}

- (void)handleAXNotificationData:(void *)a3
{
  void *v4;
  NSObject *v5;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[CACCorrectionPresentationManager element](self, "element");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject insertText:asUndoableAction:](v5, "insertText:asUndoableAction:", v4, 1);
  }
  else
  {
    CACLogAccessibility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CACCorrectionPresentationManager handleAXNotificationData:].cold.1((uint64_t)v4, v5);
  }

}

- (AXElement)element
{
  return self->_element;
}

- (void)setElement:(id)a3
{
  objc_storeStrong((id *)&self->_element, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_element, 0);
}

- (void)handleAXNotificationData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138477827;
  v3 = a1;
  _os_log_error_impl(&dword_229A40000, a2, OS_LOG_TYPE_ERROR, "Unexpected data from corrections: %{private}@", (uint8_t *)&v2, 0xCu);
}

@end
