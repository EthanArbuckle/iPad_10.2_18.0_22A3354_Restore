@implementation TVRCNowPlayingMetadata(NowPlayingInfoViewAdditions)

- (id)infoview_formattedInfo
{
  id v2;
  id v3;
  void (**v4)(void *, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD aBlock[4];
  id v12;

  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__TVRCNowPlayingMetadata_NowPlayingInfoViewAdditions__infoview_formattedInfo__block_invoke;
  aBlock[3] = &unk_24DE2C490;
  v3 = v2;
  v12 = v3;
  v4 = (void (**)(void *, void *))_Block_copy(aBlock);
  objc_msgSend(a1, "genre");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v5);

  objc_msgSend(a1, "infoview_formattedReleaseDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v6);

  objc_msgSend(a1, "infoview_formattedDuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v7);

  if (+[TVRUIFeatures includeRTReviewInInfoPanel](TVRUIFeatures, "includeRTReviewInInfoPanel"))
  {
    objc_msgSend(a1, "infoview_RTReviewPercentage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v8);

  }
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" • "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)infoview_formattedDuration
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;

  objc_msgSend(a1, "duration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2
    && (objc_msgSend(a1, "duration"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "doubleValue"),
        v5 = v4,
        v3,
        v5 > 0.0))
  {
    +[TVRUIDateUtilities localizedPlaybackTimeForInterval:](TVRUIDateUtilities, "localizedPlaybackTimeForInterval:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)infoview_formattedReleaseDate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "releaseDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if (objc_msgSend(a1, "kind") == 2)
    {
      if (infoview_formattedReleaseDate_onceToken != -1)
        dispatch_once(&infoview_formattedReleaseDate_onceToken, &__block_literal_global_169);
      objc_msgSend((id)infoview_formattedReleaseDate_formatter, "stringFromDate:", v2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "components:fromDate:", 4, v2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = objc_msgSend(v5, "year");
      if (v6)
      {
        v7 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringWithFormat:", CFSTR("%@"), v8);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v3 = 0;
      }

    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)infoview_RTReviewPercentage
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "rottenTomatoesReview");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "percentage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "integerValue") < 1)
    {
      v4 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%%"), v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
