@implementation SSTopHitNominationManager

+ (float)getTopHitThreshold:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  float v6;
  float v7;

  v3 = a3;
  objc_msgSend((id)thresholds, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend((id)thresholds, "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    v7 = v6;

  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

+ (void)setTopHitShouldBe:(id)a3
{
  objc_msgSend(a3, "setTopHit:", 1);
}

+ (void)setTopHitMustBe:(id)a3
{
  objc_msgSend(a3, "setTopHit:", 2);
}

+ (void)clearTopHit:(id)a3
{
  objc_msgSend(a3, "setTopHit:", 0);
}

+ (BOOL)isTopHit:(id)a3
{
  return objc_msgSend(a3, "topHit") != 0;
}

+ (void)setTopHitCandidate:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "rankingItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v5, "rankingItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIsLocalTopHitCandidate:", 1);

  }
}

+ (void)clearTopHitCandidate:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "rankingItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v5, "rankingItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIsLocalTopHitCandidate:", 0);

  }
}

+ (BOOL)isTopHitCandidate:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "rankingItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "rankingItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend(v5, "isLocalTopHitCandidate");

  }
  return (char)v4;
}

+ (BOOL)passLikelihoodForTopHitCandidate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  float v9;
  BOOL v10;

  v4 = a3;
  objc_msgSend(v4, "rankingItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "rankingItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "likelihood");
    v8 = v7;
    objc_msgSend(a1, "getTopHitThreshold:", CFSTR("LOCAL_TOPHIT_CANDIDATE_LIKELIHOOD_THRESHOLD"));
    v10 = v8 > v9;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (void)nominateTopHitCandidate:(id)a3
{
  void *v4;
  void *v5;
  float v6;
  float v7;
  void *v8;
  double v9;
  id v10;

  v10 = a3;
  if ((objc_msgSend(a1, "_bundleExcludedForTopHit:") & 1) == 0)
  {
    objc_msgSend(v10, "rankingItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(a1, "clearTopHitCandidate:", v10);
      if ((objc_msgSend(a1, "_recentEngagementOvertakeCheck:", v10) & 1) != 0
        || objc_msgSend(a1, "_isLikelihoodSpecialCase:", v10))
      {
        goto LABEL_5;
      }
      if (objc_msgSend(a1, "_likelihoodCheck:", v10)
        && objc_msgSend(a1, "_topicalityCheck:", v10)
        && objc_msgSend(a1, "_freshnessCheck:", v10)
        && objc_msgSend(a1, "_hideUnderShowMoreCheck:", v10))
      {
        if (+[SSQueryIntentManager isServerResult:](SSQueryIntentManager, "isServerResult:", v10))
        {
          if (!objc_msgSend(a1, "_nominateServerTopHitCandidate:", v10))
            goto LABEL_6;
          goto LABEL_5;
        }
        if (objc_msgSend(a1, "_spellCorrectedAppPass:", v10)
          && objc_msgSend(a1, "_minimumKeywordMatch:", v10)
          && objc_msgSend(a1, "_safariCheck:", v10)
          && (!objc_msgSend(a1, "_needImportantPropertyMatch:", v10)
           || objc_msgSend(a1, "_imporantPropertyMatch:", v10))
          && objc_msgSend(a1, "_stricterFreshnessTopicalityEngagementCheck:", v10))
        {
          if (objc_msgSend(a1, "_needQUIntentCheck:", v10))
          {
            objc_msgSend(v10, "sectionBundleIdentifier");
            v5 = (void *)objc_claimAutoreleasedReturnValue();
            +[SSTopHitNominationManager _likelihoodThresholdForBundle:](SSTopHitNominationManager, "_likelihoodThresholdForBundle:", v5);
            v7 = v6;
            objc_msgSend(v10, "rankingItem");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v8, "matchedQUIntent"))
            {
              if (!objc_msgSend(a1, "_imporantPropertyMatch:", v10)
                || (objc_msgSend(v8, "likelihood"), v9 <= v7))
              {
LABEL_28:

                goto LABEL_6;
              }
            }
            else if (objc_msgSend(v8, "quIntentAvailable")
                   && !objc_msgSend(a1, "_keywordMatchCheck:", v10))
            {
              goto LABEL_28;
            }

          }
LABEL_5:
          objc_msgSend(a1, "setTopHitCandidate:", v10);
        }
      }
    }
  }
LABEL_6:

}

+ (BOOL)_nominateServerTopHitCandidate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  float v6;
  float v7;
  double v8;
  BOOL v9;

  v3 = a3;
  objc_msgSend(v3, "sectionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rankingItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[SSTopHitNominationManager _likelihoodThresholdForBundle:](SSTopHitNominationManager, "_likelihoodThresholdForBundle:", v4);
  v7 = v6;
  v9 = 1;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.parsec.dictionary")))
  {
    objc_msgSend(v5, "likelihood");
    if (v8 <= v7)
      v9 = 0;
  }

  return v9;
}

+ (void)finalizeTopHitSection:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(a3, "results", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setUsesTopHitDisplay:", 1);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

+ (void)finalizeTopHitsInSections:(id)a3 withTopHitSection:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v12, "bundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqual:", CFSTR("com.apple.spotlight.tophits"));

        if (v14)
          objc_msgSend(a1, "finalizeTopHitSection:", v12);
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }
  objc_msgSend(a1, "finalizeTopHitSection:", v7);

}

+ (id)postProcessSectionsBasedOnTopHitSection:(id)a3 withTopHitSection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  float v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7
    && (objc_msgSend(v7, "results"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "count"),
        v9,
        v10))
  {
    objc_msgSend(v8, "results");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "sectionBundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.MobileAddressBook"));

    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = v12;
        objc_msgSend(v15, "rankingItem");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v15, "rankingItem");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "topicalityScore");
          if (v18 >= 0.96)
          {
            objc_msgSend(v17, "engagementScore");
            v20 = v19;
            objc_msgSend(a1, "getTopHitThreshold:", CFSTR("HIGH_ENGAGEMENT_THRESHOLD"));
            if (v20 >= v21)
            {
              objc_msgSend(v17, "recentSimilarIntentEngagementDates");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v22, "count");

              if (v23)
              {
                objc_msgSend(a1, "_dropSection:targetSection:reasonString:", v6, CFSTR("com.apple.parsec.web_images"), CFSTR("Highly Engaged Contact Top Hit"));
                v24 = objc_claimAutoreleasedReturnValue();

                v6 = (id)v24;
              }
            }
          }

        }
      }
    }
    v25 = v6;

  }
  else
  {
    v25 = v6;
  }

  return v25;
}

+ (id)_dropSection:(id)a3 targetSection:(id)a4 reasonString:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  char v19;
  NSObject *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  v12 = v10;
  if (v11)
  {
    v13 = v11;
    v14 = 0;
    v15 = *(_QWORD *)v23;
LABEL_3:
    v16 = 0;
    v17 = v14 + v13;
    while (1)
    {
      if (*(_QWORD *)v23 != v15)
        objc_enumerationMutation(v10);
      objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v16), "bundleIdentifier", (_QWORD)v22);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqual:", v8);

      if ((v19 & 1) != 0)
        break;
      if (v13 == ++v16)
      {
        v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        v14 = v17;
        if (v13)
          goto LABEL_3;
        v12 = v10;
        goto LABEL_14;
      }
    }

    if (v14 + v16 < 0)
      goto LABEL_15;
    SSGeneralLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v27 = v8;
      v28 = 2112;
      v29 = v9;
      _os_log_impl(&dword_1B86C5000, v20, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] postProcessSectionsBasedOnTopHitSection Rule: dropping %@ due to %@.", buf, 0x16u);
    }

    v12 = (void *)objc_msgSend(v10, "mutableCopy");
    objc_msgSend(v12, "removeObjectAtIndex:", v14 + v16);
  }
LABEL_14:

  v10 = v12;
LABEL_15:

  return v10;
}

+ (BOOL)_bundleExcludedForTopHit:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "sectionBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (_bundleExcludedForTopHit__onceToken != -1)
    dispatch_once(&_bundleExcludedForTopHit__onceToken, &__block_literal_global_40);
  v4 = objc_msgSend((id)_bundleExcludedForTopHit___bundlesExcluded, "containsObject:", v3);

  return v4;
}

void __54__SSTopHitNominationManager__bundleExcludedForTopHit___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("com.apple.searchd.syndicatedLinks");
  v4[1] = CFSTR("com.apple.searchd.syndicatedPhotos");
  v4[2] = CFSTR("com.apple.searchd.syndicatedPhotos.MobileSMS");
  v4[3] = CFSTR("com.apple.searchd.syndicatedPhotos.mobilenotes");
  v4[4] = CFSTR("com.apple.searchd.syndicatedPhotos.mobileslideshow");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_bundleExcludedForTopHit___bundlesExcluded;
  _bundleExcludedForTopHit___bundlesExcluded = v2;

}

+ (float)_likelihoodThresholdForBundle:(id)a3
{
  id v4;
  void *v5;
  float v6;
  float v7;
  float v8;

  v4 = a3;
  if (_likelihoodThresholdForBundle__onceToken != -1)
    dispatch_once(&_likelihoodThresholdForBundle__onceToken, &__block_literal_global_98_0);
  objc_msgSend((id)_likelihoodThresholdForBundle___bundleThresholds, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6;
  if (v6 == 0.0)
  {
    objc_msgSend(a1, "getTopHitThreshold:", CFSTR("LOCAL_TOPHIT_CANDIDATE_LIKELIHOOD_THRESHOLD"));
    v7 = v8;
  }

  return v7;
}

void __59__SSTopHitNominationManager__likelihoodThresholdForBundle___block_invoke(double a1)
{
  void *v1;
  double v2;
  void *v3;
  double v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("com.apple.mobilemail");
  LODWORD(a1) = 1059481190;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v1;
  v8[1] = CFSTR("com.apple.MobileSMS");
  LODWORD(v2) = 1060320051;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  v8[2] = CFSTR("com.apple.parsec.dictionary");
  LODWORD(v4) = 1051931443;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)_likelihoodThresholdForBundle___bundleThresholds;
  _likelihoodThresholdForBundle___bundleThresholds = v6;

}

+ (BOOL)_needQUIntentCheck:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  char v7;

  v3 = _needQUIntentCheck__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_needQUIntentCheck__onceToken, &__block_literal_global_101_0);
  v5 = (void *)_needQUIntentCheck___quBundlesToCheck;
  objc_msgSend(v4, "sectionBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "containsObject:", v6);
  return v7;
}

void __48__SSTopHitNominationManager__needQUIntentCheck___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[10];

  v4[9] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("com.apple.mobileslideshow");
  v4[1] = CFSTR("com.apple.mobilenotes");
  v4[2] = CFSTR("com.apple.DocumentsApp");
  v4[3] = CFSTR("com.apple.mobilemail");
  v4[4] = CFSTR("com.apple.MobileSMS");
  v4[5] = CFSTR("com.apple.mobilecal");
  v4[6] = CFSTR("com.apple.reminders");
  v4[7] = CFSTR("com.apple.mobilesafari");
  v4[8] = CFSTR("com.apple.spotlight.events");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 9);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_needQUIntentCheck___quBundlesToCheck;
  _needQUIntentCheck___quBundlesToCheck = v2;

}

+ (BOOL)_needImportantPropertyMatch:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = a3;
  objc_msgSend(v3, "rankingItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "rankingItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "bundleIDType");

    v4 = (void *)((v6 >> 5) & 1);
  }

  return (char)v4;
}

+ (BOOL)_spellCorrectedAppPass:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "rankingItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "rankingItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "spellCorrectedApp");

    if (v6)
    {
      objc_msgSend(v3, "rankingItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v4) = objc_msgSend(v7, "exactMatchedLaunchString");

    }
    else
    {
      LOBYTE(v4) = 1;
    }
  }

  return (char)v4;
}

+ (BOOL)_settingsCheck:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  int v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "rankingItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "rankingItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "bundleIDType") & 0x10) != 0)
    {
      objc_msgSend(v3, "rankingItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "settingsPreferencePriority");

      if (v8 < 3)
      {
        v6 = 1;
        goto LABEL_9;
      }
      objc_msgSend(v3, "rankingItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recentSimilarIntentEngagementDates");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v9, "count") != 0;

    }
    else
    {
      v6 = 1;
    }

  }
  else
  {
    v6 = 0;
  }
LABEL_9:

  return v6;
}

+ (BOOL)_safariCheck:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  float v13;
  float v14;
  void *v16;
  void *v17;
  double v18;
  double v19;
  float v20;
  double v21;
  void *v22;
  float v23;
  double v24;
  void *v25;
  double v26;
  float v27;
  float v28;
  void *v29;
  void *v30;
  float v31;
  float v32;
  float v33;
  void *v34;
  uint64_t v35;

  v4 = a3;
  objc_msgSend(v4, "rankingItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_9;
  objc_msgSend(v4, "rankingItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "bundleIDType");

  if (v7 < 0)
  {
    objc_msgSend(v4, "resultBundleId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.safari.userTypedURL")))
    {
      objc_msgSend(v4, "rankingItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "topicalityScore");
      if (v11 >= 0.99)
      {
        objc_msgSend(v4, "rankingItem");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "keywordMatchScore");
        v24 = v23;

        if (v24 >= 0.99)
          goto LABEL_3;
LABEL_8:
        objc_msgSend(v4, "rankingItem");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "keywordMatchScore");
        v14 = v13;

        if (v14 < 2.2204e-16)
        {
LABEL_9:
          v8 = 0;
          goto LABEL_10;
        }
        objc_msgSend(v4, "rankingItem");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v16, "wasEngagedInSpotlight") & 1) != 0)
        {
          objc_msgSend(v4, "rankingItem");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "engagementScore");
          v19 = v18;
          objc_msgSend(a1, "getTopHitThreshold:", CFSTR("MIN_ENGAGEMENT_THRESHOLD"));
          v21 = v20;

          if (v19 >= v21)
            goto LABEL_3;
        }
        else
        {

        }
        objc_msgSend(v4, "rankingItem");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "mostRecentUseInMinutes");
        v27 = v26;

        if (v27 > 0.0)
        {
          objc_msgSend(a1, "getTopHitThreshold:", CFSTR("IN_APP_USAGE_RECENCY_DAYS"));
          if ((float)(v28 * 1440.0) >= v27)
          {
            objc_msgSend(v4, "rankingItem");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[PRSRankingItem importantPropertiesPrefixMatched]((uint64_t)v29))
            {
              v8 = 1;
LABEL_24:

              goto LABEL_10;
            }
            objc_msgSend(v4, "rankingItem");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = -[PRSRankingItem importantPropertiesWordMatched]((uint64_t)v34);

            if (v35)
              goto LABEL_3;
          }
        }
        objc_msgSend(v4, "contentType");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v29, "isEqualToString:", CFSTR("com.apple.safari.bookmark")))
        {
          objc_msgSend(v4, "rankingItem");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "keywordMatchScore");
          v32 = v31;
          objc_msgSend(a1, "getTopHitThreshold:", CFSTR("SAFARI_BOOKMARK_KEYWORDMATCH_THRESHOLD"));
          v8 = v32 >= v33;

        }
        else
        {
          v8 = 0;
        }
        goto LABEL_24;
      }

    }
    goto LABEL_8;
  }
LABEL_3:
  v8 = 1;
LABEL_10:

  return v8;
}

+ (BOOL)_minimumKeywordMatch:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int16 v10;
  void *v11;
  float v12;

  v3 = a3;
  objc_msgSend(v3, "rankingItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "rankingItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "bundleIDType") & 0x100000) == 0)
    {
      objc_msgSend(v3, "rankingItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "bundleIDType") & 0x80) == 0)
      {
        objc_msgSend(v3, "rankingItem");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v7, "bundleIDType") & 2) == 0)
        {
          objc_msgSend(v3, "rankingItem");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v8, "bundleIDType") & 0x20) == 0)
          {
            objc_msgSend(v3, "rankingItem");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = objc_msgSend(v9, "bundleIDType");

            if ((v10 & 0x800) == 0)
            {
              LOBYTE(v4) = 1;
              goto LABEL_13;
            }
LABEL_12:
            objc_msgSend(v3, "rankingItem");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "keywordMatchScore");
            LOBYTE(v4) = v12 > 0.0;

            goto LABEL_13;
          }

        }
      }

    }
    goto LABEL_12;
  }
LABEL_13:

  return (char)v4;
}

+ (BOOL)_keywordMatchCheck:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  float v9;
  BOOL v10;

  v4 = a3;
  objc_msgSend(v4, "rankingItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "rankingItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "keywordMatchScore");
    v8 = v7;
    objc_msgSend(a1, "getTopHitThreshold:", CFSTR("LOCAL_TOPHIT_CANDIDATE_KEYWORDMATCH_THRESHOLD"));
    v10 = v8 >= v9;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)_imporantPropertyMatch:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "rankingItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "rankingItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PRSRankingItem importantPropertiesPrefixMatched]((uint64_t)v5))
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend(v3, "rankingItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[PRSRankingItem importantPropertiesWordMatched]((uint64_t)v7) != 0;

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)_isLikelihoodSpecialCase:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  float v9;
  BOOL v10;

  v4 = a3;
  objc_msgSend(v4, "rankingItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "rankingItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "likelihood");
    v8 = v7;
    objc_msgSend(a1, "getTopHitThreshold:", CFSTR("LOCAL_TOPHIT_CANDIDATE_LIKELIHOOD_SPECIAL_CASE_THRESHOLD"));
    v10 = v8 >= v9;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)_likelihoodCheck:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  float v9;
  BOOL v10;

  v4 = a3;
  objc_msgSend(v4, "rankingItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "rankingItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "likelihood");
    v8 = v7;
    objc_msgSend(a1, "getTopHitThreshold:", CFSTR("LOCAL_TOPHIT_CANDIDATE_LIKELIHOOD_THRESHOLD"));
    v10 = v8 >= v9;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)_topicalityCheck:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;

  v3 = a3;
  objc_msgSend(v3, "rankingItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "rankingItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "finalTopicality");
    LOBYTE(v4) = v6 > 0.0;

  }
  return (char)v4;
}

+ (BOOL)_freshnessCheck:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;
  void *v9;
  double v10;
  double v11;
  float v12;

  v4 = a3;
  objc_msgSend(v4, "rankingItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "rankingItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "bundleIDType");

    if ((v7 & 8) != 0)
    {
      objc_msgSend(v4, "rankingItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "freshnessScore");
      v11 = v10;
      objc_msgSend(a1, "getTopHitThreshold:", CFSTR("TOPHIT_FRESHNESS_THRESHOLD"));
      v8 = v11 >= v12;

    }
    else
    {
      v8 = 1;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)_hideUnderShowMoreCheck:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "rankingItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "rankingItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "bundleIDType");

    if ((v6 & 8) != 0)
    {
      objc_msgSend(v3, "rankingItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v4) = objc_msgSend(v7, "shouldHideUnderShowMore") ^ 1;

    }
    else
    {
      LOBYTE(v4) = 1;
    }
  }

  return (char)v4;
}

+ (BOOL)_recentEngagementOvertakeCheck:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "rankingItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "rankingItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recentSimilarIntentEngagementDates");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = (unint64_t)objc_msgSend(v6, "count") > 1;

  }
  return (char)v4;
}

+ (BOOL)_stricterFreshnessTopicalityEngagementCheck:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __int16 v7;
  void *v8;
  void *v9;
  BOOL v10;
  double v11;
  double v12;
  float v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  double v18;
  double v19;
  float v20;
  double v21;
  double v22;
  double v23;
  float v24;
  void *v25;
  double v26;
  double v27;
  float v28;
  BOOL v29;
  double v30;
  double v31;
  float v32;
  float v33;
  float v34;
  float v35;

  v4 = a3;
  objc_msgSend(v4, "rankingItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "rankingItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "bundleIDType");

    objc_msgSend(v4, "rankingItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if ((v7 & 0x800) == 0)
    {
      if ((objc_msgSend(v8, "bundleIDType") & 0x100000) == 0)
      {
        v10 = 1;
LABEL_23:

        goto LABEL_24;
      }
      objc_msgSend(v4, "rankingItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v14, "quIntentAvailable") & 1) == 0)
      {

LABEL_16:
        objc_msgSend(v4, "rankingItem");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "freshnessScore");
        v31 = v30;
        objc_msgSend(a1, "getTopHitThreshold:", CFSTR("TOPHIT_FRESHNESS_THRESHOLD_MAIL"));
        if (v31 < v32)
          goto LABEL_17;
        objc_msgSend(v4, "rankingItem");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "keywordMatchScore");
        v34 = v33;
        objc_msgSend(a1, "getTopHitThreshold:", CFSTR("LOCAL_TOPHIT_CANDIDATE_KEYWORDMATCH_THRESHOLD_MAIL"));
        v29 = v34 < v35;
        goto LABEL_19;
      }
      objc_msgSend(v4, "rankingItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "matchedQUIntent");

      if ((v16 & 1) == 0)
        goto LABEL_16;
      goto LABEL_14;
    }
    objc_msgSend(v8, "topicalityScore");
    v12 = v11;
    objc_msgSend(a1, "getTopHitThreshold:", CFSTR("FILES_IN_TOPHIT_TOPICALITY_THRESHOLD"));
    if (v12 >= v13)
    {
      objc_msgSend(v4, "rankingItem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "freshnessScore");
      v19 = v18;
      objc_msgSend(a1, "getTopHitThreshold:", CFSTR("TOPHIT_FRESHNESS_THRESHOLD"));
      v21 = v20;

      if (v19 >= v21)
      {
LABEL_14:
        v10 = 1;
        goto LABEL_24;
      }
    }
    else
    {

    }
    objc_msgSend(v4, "rankingItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "engagementScore");
    v23 = v22;
    objc_msgSend(a1, "getTopHitThreshold:", CFSTR("FILTER_FILES_IN_TOPHIT_ENGAGEMENT_THRESHOLD"));
    if (v23 < v24)
    {
LABEL_17:
      v10 = 0;
      goto LABEL_23;
    }
    objc_msgSend(v4, "rankingItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "topicalityScore");
    v27 = v26;
    objc_msgSend(a1, "getTopHitThreshold:", CFSTR("FILES_IN_TOPHIT_TOPICALITY_WITH_ENGAGEMENT_THRESHOLD"));
    v29 = v27 < v28;
LABEL_19:
    v10 = !v29;

    goto LABEL_23;
  }
  v10 = 0;
LABEL_24:

  return v10;
}

+ (void)topHitCandidacyThresholdingForAppSection:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  BOOL v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  unint64_t v50;
  void *v51;
  void *v52;
  NSObject *v53;
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
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  BOOL v78;
  void *v79;
  void *v80;
  char v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  uint8_t buf[8];
  void *v91;
  __int16 v92;
  void *v93;
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.application"))
    || (unint64_t)objc_msgSend(v5, "resultsCount") < 2)
  {
    goto LABEL_10;
  }
  objc_msgSend(v5, "resultSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rankingItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "isLocalTopHitCandidate"))
    goto LABEL_9;
  objc_msgSend(v5, "resultSet");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "objectAtIndexedSubscript:", 1);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "rankingItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "isLocalTopHitCandidate"))
  {

LABEL_9:
    goto LABEL_10;
  }
  objc_msgSend(v5, "resultSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "rankingItem");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "freshnessScore");
  v13 = v12;
  if (v12 < 0.96)
  {
    v79 = v11;
    v80 = v10;
    v81 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v5, "resultSet");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "objectAtIndexedSubscript:", 1);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "rankingItem");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "topicalityScore");
  if (v14 < 0.6)
  {
    v79 = v11;
    v80 = v10;
    v81 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v5, "resultSet");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "objectAtIndexedSubscript:", 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "rankingItem");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "freshnessScore");
  if (v29 >= 0.9999)
  {
LABEL_27:

    v26 = 0;
    goto LABEL_28;
  }
  v74 = v28;
  v68 = v27;
  objc_msgSend(v5, "resultSet");
  v81 = 1;
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "objectAtIndexedSubscript:", 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "rankingItem");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "topicalityScore");
  if (v32 >= 0.9)
  {

    v27 = v68;
    v28 = v74;
    goto LABEL_27;
  }
  v64 = v31;
  v65 = v30;
  v79 = v11;
  v80 = v10;
  v3 = v68;
LABEL_13:
  objc_msgSend(v5, "resultSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "rankingItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "topicalityScore");
  if (v18 >= 1.0)
  {

    v78 = 0;
    v25 = v74;
    if ((v81 & 1) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
  v72 = v15;
  objc_msgSend(v5, "resultSet");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "objectAtIndexedSubscript:", 0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "rankingItem");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "likelihood");
  if (v19 <= 0.65)
  {
    v78 = 0;
    v25 = v74;
  }
  else
  {
    objc_msgSend(v5, "resultSet");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "objectAtIndexedSubscript:", 0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "rankingItem");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "likelihood");
    v21 = v20;
    objc_msgSend(v5, "resultSet");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "objectAtIndexedSubscript:", 1);
    v67 = v3;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "rankingItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "likelihood");
    v78 = v21 - v24 > 0.25;

    v25 = v74;
    v3 = v67;

  }
  if ((v81 & 1) != 0)
  {
LABEL_17:

  }
LABEL_18:
  v11 = v79;
  v10 = v80;
  v26 = v78;
  if (v13 >= 0.96)
  {
LABEL_28:

  }
  if (!v26)
    goto LABEL_11;
  objc_msgSend(v5, "resultSet");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "rankingItem");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  SSCompactRankingAttrsGetValue((int8x8_t *)objc_msgSend(v35, "attributes"), 0x77uLL);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "BOOLValue"))
  {
    *(_QWORD *)buf = 0;
    objc_msgSend(v5, "resultSet");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectAtIndexedSubscript:", 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "rankingItem");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    SSCompactRankingAttrsGetFloat(objc_msgSend(v38, "attributes"), 0x113uLL, &buf[4]);

    objc_msgSend(v5, "resultSet");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "objectAtIndexedSubscript:", 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "rankingItem");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    SSCompactRankingAttrsGetFloat(objc_msgSend(v41, "attributes"), 0x113uLL, buf);

    if (*(float *)&buf[4] > 10.0 && *(float *)buf < 5.0)
      goto LABEL_40;
    if (*(float *)buf > 0.0 && (float)(*(float *)&buf[4] / *(float *)buf) > 3.0)
      goto LABEL_40;
  }
  objc_msgSend(v5, "resultSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rankingItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "topicalityScore");
  if (v42 >= 0.6)
    goto LABEL_9;
  objc_msgSend(v5, "resultSet");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "objectAtIndexedSubscript:", 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "rankingItem");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "engagementScore");
  if (v46 < 0.6)
  {

    goto LABEL_40;
  }
  objc_msgSend(v5, "resultSet");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "objectAtIndexedSubscript:", 1);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "rankingItem");
  v89 = v6;
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "recentSimilarIntentEngagementDates");
  v83 = v43;
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = objc_msgSend(v49, "count");

  v6 = v89;
  if (v87)
  {
LABEL_10:

    goto LABEL_11;
  }
LABEL_40:

  if ((unint64_t)objc_msgSend(v5, "resultsCount") >= 2)
  {
    v50 = 1;
    do
    {
      objc_msgSend(v5, "resultSet");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "objectAtIndexedSubscript:", v50);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "clearTopHitCandidate:", v52);

      SSGeneralLog();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "resultSet");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "objectAtIndexedSubscript:", v50);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "identifier");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "resultSet");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "objectAtIndexedSubscript:", 0);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "identifier");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)&buf[4] = 138412546;
        v91 = v56;
        v92 = 2112;
        v93 = v59;
        _os_log_impl(&dword_1B86C5000, v53, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] <Engagement_Debug> Rule: app %@ TH candidacy thresholded in favor of app %@ with shortcuts.", &buf[4], 0x16u);

      }
      ++v50;
    }
    while (v50 < objc_msgSend(v5, "resultsCount"));
  }
LABEL_11:

}

+ (void)_setImportantPropertiesPrefixMatched:(id)a3 value:(unint64_t)a4
{
  -[PRSRankingItem setImportantPropertiesPrefixMatched:]((uint64_t)a3, a4);
}

+ (void)_setImportantPropertiesWordMatched:(id)a3 value:(unint64_t)a4
{
  -[PRSRankingItem setImportantPropertiesWordMatched:]((uint64_t)a3, a4);
}

@end
