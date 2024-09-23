@implementation SFSearchResult(PRSRankingItemAdditions)

- (float)PRSRankingItemAdditions_albumStarRating
{
  void *v2;
  int v3;
  float v4;
  void *v5;
  void *v6;
  double v7;

  objc_msgSend(a1, "sectionBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.parsec.itunes.album"));

  v4 = -1.0;
  if (v3)
  {
    getDetailedRowCardSectionDescriptionRichText(a1, 0, 2uLL);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "starRating");
      v4 = v7;
    }

  }
  return v4;
}

- (float)PRSRankingItemAdditions_appNumReviews
{
  void *v2;
  int v3;
  float NumReviews;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "sectionBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.parsec.itunes.iosSoftware"));

  NumReviews = -1.0;
  if (v3)
  {
    getDetailedRowCardSectionFootnoteRichText(a1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "formattedTextPieces");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "count"))
      {
        objc_msgSend(v6, "objectAtIndex:", 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v7, "text");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          NumReviews = getNumReviews(v8);

        }
      }

    }
  }
  return NumReviews;
}

- (float)PRSRankingItemAdditions_epubBookNumReviews
{
  void *v2;
  int v3;
  float NumReviewsInParens;
  void *v5;
  void *v6;

  objc_msgSend(a1, "sectionBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.parsec.itunes.epubBook"));

  NumReviewsInParens = -1.0;
  if (v3)
  {
    getDetailedRowCardSectionDescriptionFormattedText(a1, 0, 4uLL, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      NumReviewsInParens = getNumReviewsInParens(v5);

  }
  return NumReviewsInParens;
}

- (float)PRSRankingItemAdditions_profileNumFollowers
{
  void *v2;
  int v3;
  float NumReviews;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  objc_msgSend(a1, "sectionBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.parsec.profiles.profile"));

  NumReviews = -1.0;
  if (v3)
  {
    getDetailedRowCardSection(a1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "footnote");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = (void *)v7;
        objc_msgSend(v6, "footnote");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v6, "footnote");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "text");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            if (objc_msgSend(v12, "length"))
            {
              objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v12, "rangeOfCharacterFromSet:", v13);

              if (v14 != 0x7FFFFFFFFFFFFFFFLL)
              {
                objc_msgSend(v12, "substringToIndex:", v14);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                NumReviews = getNumReviews(v15);

              }
            }
          }

        }
      }
    }

  }
  return NumReviews;
}

- (float)PRSRankingItemAdditions_webVideoNumViews
{
  void *v2;
  int v3;
  float NumReviews;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "sectionBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.parsec.web_video"));

  NumReviews = -1.0;
  if (v3)
  {
    getDetailedRowCardSectionDescriptionRichTextText(a1, 0, 1uLL);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && objc_msgSend(v5, "length"))
    {
      getSecondNumberStr(v6, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7 && objc_msgSend(v7, "length"))
        NumReviews = getNumReviews(v8);

    }
  }
  return NumReviews;
}

- (float)PRSRankingItemAdditions_appStarRating
{
  void *v2;
  int v3;
  float v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;

  objc_msgSend(a1, "sectionBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.parsec.itunes.iosSoftware"));

  v4 = -1.0;
  if (v3)
  {
    getDetailedRowCardSection(a1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "footnote");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v6, "footnote");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "starRating");
          v4 = v9;
        }

      }
    }

  }
  return v4;
}

- (float)PRSRankingItemAdditions_epubBookStarRating
{
  void *v2;
  int v3;
  float v4;
  void *v5;
  void *v6;
  double v7;

  objc_msgSend(a1, "sectionBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.parsec.itunes.epubBook"));

  v4 = -1.0;
  if (v3)
  {
    getDetailedRowCardSectionDescriptionRichText(a1, 0, 4uLL);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "starRating");
      v4 = v7;
    }

  }
  return v4;
}

- (float)PRSRankingItemAdditions_podcastStarRating
{
  void *v2;
  int v3;
  float v4;
  void *v5;
  void *v6;
  double v7;

  objc_msgSend(a1, "sectionBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.parsec.itunes.podcast"));

  v4 = -1.0;
  if (v3)
  {
    getDetailedRowCardSectionDescriptionRichText(a1, 0, 3uLL);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "starRating");
      v4 = v7;
    }

  }
  return v4;
}

- (float)PRSRankingItemAdditions_movieReviewRating
{
  void *v2;
  int v3;
  float ReviewRating;
  void *v5;
  void *v6;

  objc_msgSend(a1, "sectionBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.parsec.ondemandmovies.movie"));

  ReviewRating = -1.0;
  if (v3)
  {
    getDetailedRowCardSectionDescriptionFormattedText(a1, 0, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      ReviewRating = getReviewRating(v5);

  }
  return ReviewRating;
}

- (float)PRSRankingItemAdditions_movieStarRating
{
  float result;

  objc_msgSend(a1, "PRSRankingItemAdditions_movieReviewRating");
  if (result != -1.0)
    return result * 5.0;
  return result;
}

- (float)PRSRankingItemAdditions_albumNumYearsAgo:()PRSRankingItemAdditions
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  float NumYearsAgo;

  objc_msgSend(a1, "sectionBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.parsec.itunes.album"));

  if (v3)
  {
    getDetailedRowCardSectionDescriptionRichTextText(a1, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4 && objc_msgSend(v4, "length"))
    {
      getSuffixYearStr(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6 && objc_msgSend(v6, "length"))
      {
        v8 = objc_msgSend(v7, "integerValue");

        if (v8 != -1)
        {
          NumYearsAgo = getNumYearsAgo(v8);
LABEL_11:

          return NumYearsAgo;
        }
      }
      else
      {

      }
    }
    NumYearsAgo = 2147500000.0;
    goto LABEL_11;
  }
  return 2147500000.0;
}

- (float)PRSRankingItemAdditions_songNumYearsAgo:()PRSRankingItemAdditions
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  float NumYearsAgo;

  objc_msgSend(a1, "sectionBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.parsec.itunes.song"));

  if (v3)
  {
    getDetailedRowCardSectionDescriptionRichTextText(a1, 0, 1uLL);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4 && objc_msgSend(v4, "length"))
    {
      getSuffixYearStr(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6 && objc_msgSend(v6, "length"))
      {
        v8 = objc_msgSend(v7, "integerValue");

        if (v8 != -1)
        {
          NumYearsAgo = getNumYearsAgo(v8);
LABEL_11:

          return NumYearsAgo;
        }
      }
      else
      {

      }
    }
    NumYearsAgo = 2147500000.0;
    goto LABEL_11;
  }
  return 2147500000.0;
}

- (float)PRSRankingItemAdditions_tvshowNumYearsAgo:()PRSRankingItemAdditions
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  float NumYearsAgo;

  objc_msgSend(a1, "sectionBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.parsec.tv.tvShow"));

  if (v3)
  {
    getDetailedRowCardSectionDescriptionRichTextText(a1, 0, 1uLL);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4
      || (getDetailedRowCardSectionDescriptionRichTextText(a1, 0, 0),
          (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      if (objc_msgSend(v4, "length"))
      {
        getSuffixYearStr(v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        if (v5 && objc_msgSend(v5, "length"))
        {
          v7 = objc_msgSend(v6, "integerValue");

          if (v7 != -1)
          {
            NumYearsAgo = getNumYearsAgo(v7);
LABEL_12:

            return NumYearsAgo;
          }
        }
        else
        {

        }
      }
    }
    NumYearsAgo = 2147500000.0;
    goto LABEL_12;
  }
  return 2147500000.0;
}

- (float)PRSRankingItemAdditions_movieNumYearsAgo:()PRSRankingItemAdditions
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  float NumYearsAgo;

  objc_msgSend(a1, "sectionBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.parsec.ondemandmovies.movie"));

  if (v3)
  {
    getDetailedRowCardSectionDescriptionRichTextText(a1, 0, 1uLL);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4 && objc_msgSend(v4, "length"))
    {
      getSecondNumberStr(v5, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6 && objc_msgSend(v6, "length"))
      {
        v8 = objc_msgSend(v7, "integerValue");

        if (v8 != -1)
        {
          NumYearsAgo = getNumYearsAgo(v8);
LABEL_11:

          return NumYearsAgo;
        }
      }
      else
      {

      }
    }
    NumYearsAgo = 2147500000.0;
    goto LABEL_11;
  }
  return 2147500000.0;
}

- (float)PRSRankingItemAdditions_epubBookNumYearsAgo:()PRSRankingItemAdditions
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  float NumYearsAgo;

  objc_msgSend(a1, "sectionBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.parsec.itunes.epubBook"));

  if (!v3)
    return 2147500000.0;
  getDetailedRowCardSectionDescriptionRichTextText(a1, 0, 2uLL);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length") && (v6 = objc_msgSend(v5, "integerValue"), v6 != -1))
    NumYearsAgo = getNumYearsAgo(v6);
  else
    NumYearsAgo = 2147500000.0;

  return NumYearsAgo;
}

- (float)PRSRankingItemAdditions_anyTophitMustBe
{
  int v1;
  float result;

  v1 = objc_msgSend(a1, "topHit");
  result = 0.0;
  if (v1 == 2)
    return 1.0;
  return result;
}

- (float)PRSRankingItemAdditions_anyTophitNo
{
  int v1;
  float result;

  v1 = objc_msgSend(a1, "topHit");
  result = 0.0;
  if (!v1)
    return 1.0;
  return result;
}

- (float)PRSRankingItemAdditions_webVideoNumYearsAgo:()PRSRankingItemAdditions
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  float NumYearsAgo;

  objc_msgSend(a1, "sectionBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.parsec.web_video"));

  if (v3)
  {
    getDetailedRowCardSectionDescriptionRichTextText(a1, 0, 1uLL);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4 && objc_msgSend(v4, "length"))
    {
      getPrefixYearStr(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6 && objc_msgSend(v6, "length"))
      {
        v8 = objc_msgSend(v7, "integerValue");

        if (v8 != -1)
        {
          NumYearsAgo = getNumYearsAgo(v8);
LABEL_11:

          return NumYearsAgo;
        }
      }
      else
      {

      }
    }
    NumYearsAgo = 2147500000.0;
    goto LABEL_11;
  }
  return 2147500000.0;
}

- (id)PRSRankingItemAdditions_title
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  objc_msgSend(a1, "sectionBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.parsec.itunes.album")) & 1) != 0)
    goto LABEL_20;
  objc_msgSend(a1, "sectionBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.parsec.itunes.artist")) & 1) == 0)
  {
    objc_msgSend(a1, "sectionBundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.parsec.itunes.iosSoftware")) & 1) != 0)
    {
LABEL_18:

      goto LABEL_19;
    }
    objc_msgSend(a1, "sectionBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.parsec.bing")) & 1) != 0)
    {
LABEL_17:

      goto LABEL_18;
    }
    objc_msgSend(a1, "sectionBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.parsec.itunes.epubBook")) & 1) != 0)
    {
LABEL_16:

      goto LABEL_17;
    }
    objc_msgSend(a1, "sectionBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.parsec.flights")) & 1) != 0)
    {
LABEL_15:

      goto LABEL_16;
    }
    objc_msgSend(a1, "sectionBundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.parsec.news")) & 1) != 0)
    {
LABEL_14:

      goto LABEL_15;
    }
    objc_msgSend(a1, "sectionBundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.parsec.ondemandmovies.movie")) & 1) != 0)
    {
LABEL_13:

      goto LABEL_14;
    }
    objc_msgSend(a1, "sectionBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.parsec.itunes.podcast")) & 1) != 0)
    {
LABEL_12:

      goto LABEL_13;
    }
    v34 = v10;
    objc_msgSend(a1, "sectionBundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.parsec.profiles.profile")) & 1) != 0)
    {

      v10 = v34;
      goto LABEL_12;
    }
    v33 = v11;
    objc_msgSend(a1, "sectionBundleIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v32, "isEqualToString:", CFSTR("com.apple.parsec.itunes.song")) & 1) != 0)
    {
      v15 = 1;
    }
    else
    {
      objc_msgSend(a1, "sectionBundleIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v31, "isEqualToString:", CFSTR("com.apple.parsec.stocks")) & 1) != 0)
      {
        v15 = 1;
      }
      else
      {
        objc_msgSend(a1, "sectionBundleIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v30, "isEqualToString:", CFSTR("com.apple.parsec.tv.tvEpisode")) & 1) != 0)
        {
          v15 = 1;
        }
        else
        {
          objc_msgSend(a1, "sectionBundleIdentifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v29, "isEqualToString:", CFSTR("com.apple.parsec.tv.tvShow")) & 1) != 0)
          {
            v15 = 1;
          }
          else
          {
            objc_msgSend(a1, "sectionBundleIdentifier");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v28, "isEqualToString:", CFSTR("com.apple.parsec.hashtags.tweet")) & 1) != 0)
            {
              v15 = 1;
            }
            else
            {
              objc_msgSend(a1, "sectionBundleIdentifier");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v27, "isEqualToString:", CFSTR("com.apple.parsec.web_index")) & 1) != 0)
              {
                v15 = 1;
              }
              else
              {
                objc_msgSend(a1, "sectionBundleIdentifier");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.parsec.web_video"));

              }
            }

          }
        }

      }
    }

    if ((v15 & 1) != 0)
      goto LABEL_21;
    objc_msgSend(a1, "sectionBundleIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.parsec.kg"));

    if (v17)
    {
LABEL_44:
      getRichTitleCardSectionTitle(a1);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    objc_msgSend(a1, "sectionBundleIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("com.apple.parsec.maps"));

    if (v19)
    {
      getResultTitle(a1);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    objc_msgSend(a1, "sectionBundleIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.parsec.sports"));

    if (v21)
    {
      getCardSection(a1, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        getScoreboardCardSectionTitle(a1, 0);
        v23 = objc_claimAutoreleasedReturnValue();
LABEL_57:
        v13 = (void *)v23;
        goto LABEL_58;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v13 = 0;
        goto LABEL_58;
      }
    }
    else
    {
      objc_msgSend(a1, "sectionBundleIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("com.apple.parsec.wiki"));

      if (v25)
      {
        getDetailedRowCardSectionTitle(a1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          return v13;
        goto LABEL_44;
      }
      getCardSection(a1, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v13 = 0;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_58:

        return v13;
      }
    }
    getDetailedRowCardSectionTitle(a1);
    v23 = objc_claimAutoreleasedReturnValue();
    goto LABEL_57;
  }
LABEL_19:

LABEL_20:
LABEL_21:
  getDetailedRowCardSectionTitle(a1);
  v12 = objc_claimAutoreleasedReturnValue();
LABEL_22:
  v13 = (void *)v12;
  return v13;
}

- (id)PRSRankingItemAdditions_description
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  int v25;

  objc_msgSend(a1, "sectionBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.parsec.itunes.epubBook"));

  if (v3)
    goto LABEL_2;
  objc_msgSend(a1, "sectionBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.parsec.kg"));

  if (v6)
  {
LABEL_4:
    getDescriptionCardSectionDescription(a1, 1uLL);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  objc_msgSend(a1, "sectionBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.parsec.news"));

  if (v8)
  {
    getDetailedRowCardSectionDescription(a1, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  objc_msgSend(a1, "sectionBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.parsec.profiles.profile")))
  {

LABEL_10:
    getDetailedRowCardSectionDescriptionFormattedText(a1, 0, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  objc_msgSend(a1, "sectionBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.parsec.stocks"));

  if (v11)
    goto LABEL_10;
  objc_msgSend(a1, "sectionBundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.parsec.itunes.album")) & 1) != 0)
    goto LABEL_15;
  objc_msgSend(a1, "sectionBundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.parsec.itunes.song")))
  {
    objc_msgSend(a1, "sectionBundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.parsec.web_video"));

    if ((v16 & 1) != 0)
      goto LABEL_2;
    objc_msgSend(a1, "sectionBundleIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.parsec.web_index")))
    {

    }
    else
    {
      objc_msgSend(a1, "sectionBundleIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("com.apple.parsec.bing"));

      if (!v19)
      {
        objc_msgSend(a1, "sectionBundleIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.parsec.hashtags.tweet"));

        if (v21)
          goto LABEL_23;
        objc_msgSend(a1, "sectionBundleIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("com.apple.parsec.wiki"));

        if (v23)
        {
          getDetailedRowCardSectionDescriptionFormattedText(a1, 0, 0, 0);
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          if (v4)
            return v4;
          goto LABEL_4;
        }
        objc_msgSend(a1, "sectionBundleIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("com.apple.parsec.ondemandmovies.movie"));

        if ((v25 & 1) != 0)
        {
          v4 = 0;
          return v4;
        }
      }
    }
    getDetailedRowCardSectionDescriptionMultipleFormattedTexts(a1, 0, 1uLL, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      return v4;
LABEL_23:
    getDetailedRowCardSectionDescriptionMultipleFormattedTexts(a1, 0, 0, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return v4;
  }

LABEL_15:
LABEL_2:
  getDetailedRowCardSectionDescriptionRichTextText(a1, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (id)PRSRankingItemAdditions_url
{
  void *v2;
  void *v3;
  void *v4;
  void *v6;
  char v7;

  objc_msgSend(a1, "sectionBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.parsec.web_index")) & 1) != 0)
    goto LABEL_4;
  objc_msgSend(a1, "sectionBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.parsec.bing")))
  {

LABEL_4:
    goto LABEL_5;
  }
  objc_msgSend(a1, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasPrefix:", CFSTR("wi:http"));

  if ((v7 & 1) == 0)
  {
    v4 = 0;
    return v4;
  }
LABEL_5:
  getDetailedRowCardSectionFootnoteText(a1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

@end
