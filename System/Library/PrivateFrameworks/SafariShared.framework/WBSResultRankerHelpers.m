@implementation WBSResultRankerHelpers

+ (BOOL)hostAreEqual:(id)a3 forSecondURLString:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "host");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "host");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqualToString:", v9);

  return v10;
}

+ (id)simplifiedURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "safari_stringByRemovingTopLevelDomainFromHost");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_stringByRemovingWwwDotPrefix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (int64_t)numberOfWords:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF != ''"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  return v8;
}

+ (double)topSitesScoreAndVisitCountScoreFactor:(id)a3 forTopSiteScore:(float)a4 forVisitCountScore:(int64_t)a5
{
  id v7;
  float v8;
  float v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v7 = a3;
  if (a5 == -1)
  {
    v9 = 1.0;
  }
  else
  {
    +[WBSHistoryVisit weightedVisitCountFromScore:](WBSHistoryVisit, "weightedVisitCountFromScore:", a5);
    v9 = tanhf(v8 + 1.1755e-38);
  }
  if (a4 != -1.0)
    v9 = v9 * tanhf(a4 + 1.1755e-38);
  objc_msgSend(v7, "normalizedTopSitesScoreAndVisitCountMultiplier");
  v11 = v10;
  objc_msgSend(v7, "normalizedTopSitesScoreAndVisitCountMultiplier");
  v13 = 1.0 / (v9 * v11 + 1.0) + 1.0 - 1.0 / (v12 + 1.0);

  return v13;
}

+ (BOOL)allowMatch:(id)a3 forMatch:(id)a4 forQueryString:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  int v12;
  double v13;
  double v14;
  int v15;
  int v16;
  uint64_t v17;
  double v18;
  double v19;
  float v20;
  uint64_t v21;
  void *v22;
  void *v23;
  unint64_t v24;
  double v25;
  BOOL v26;
  BOOL v27;
  void *v28;
  unint64_t v29;
  double v30;
  uint64_t v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v10, "length");
  v12 = objc_msgSend(v9, "containsBookmark");
  if (v12)
    v13 = (double)v11 * 1.5;
  else
    v13 = (double)v11;
  if (v12)
    v14 = 0.75;
  else
    v14 = 1.0;
  objc_msgSend(v9, "topSitesScore");
  v16 = v15;
  v17 = objc_msgSend(v9, "visitCountScore");
  LODWORD(v18) = v16;
  objc_msgSend(a1, "topSitesScoreAndVisitCountScoreFactor:forTopSiteScore:forVisitCountScore:", v8, v17, v18);
  v20 = v19;
  switch(objc_msgSend(v9, "matchLocation"))
  {
    case 2:
      objc_msgSend(v9, "originalURLString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "simplifiedURL:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "length");

      if (v13 >= (double)objc_msgSend(v8, "characterThresholdForAnywhereInTitleOrURL"))
        goto LABEL_15;
      objc_msgSend(v8, "percentageThresholdForAnywhereInURL");
      v26 = (v13 + 1.0) / (double)v24 < v14 * v25;
      goto LABEL_20;
    case 3:
      objc_msgSend(v9, "title");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "length");

      if (v13 >= (double)objc_msgSend(v8, "characterThresholdForAnywhereInTitleOrURL"))
        goto LABEL_15;
      objc_msgSend(v8, "percentageThresholdForAnywhereInTitle");
      if ((v13 + 1.0) / (double)v29 >= v14 * v30)
        goto LABEL_15;
      v31 = objc_msgSend(a1, "numberOfWords:", v10);
      v26 = v31 < objc_msgSend(v8, "matchingWordsInTitleThreshold");
      goto LABEL_20;
    case 4:
    case 6:
      v21 = objc_msgSend(v8, "characterThresholdForStartOfTitleWord");
      goto LABEL_19;
    case 5:
      v21 = objc_msgSend(v8, "characterThresholdForStartOfURLPathComponent");
      goto LABEL_19;
    case 7:
      v21 = objc_msgSend(v8, "characterThresholdForStartOfTitle");
      goto LABEL_19;
    case 8:
    case 10:
LABEL_15:
      v27 = 1;
      break;
    case 9:
      v21 = objc_msgSend(v8, "characterThresholdForStartOfURL");
LABEL_19:
      v26 = v13 < floorf(v20 * (float)v21);
LABEL_20:
      v27 = !v26;
      break;
    default:
      v27 = 0;
      break;
  }

  return v27;
}

@end
