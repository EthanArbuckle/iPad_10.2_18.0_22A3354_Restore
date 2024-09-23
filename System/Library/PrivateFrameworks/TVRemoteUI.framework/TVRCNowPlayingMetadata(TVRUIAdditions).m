@implementation TVRCNowPlayingMetadata(TVRUIAdditions)

- (BOOL)tvrui_isTVEpisode
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a1, "episodeNumber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "seasonNumber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(a1, "episodeTitle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "length") != 0;

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)tvrui_localizedTitleWithFormatString:()TVRUIAdditions
{
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (objc_msgSend(a1, "tvrui_isTVEpisode"))
  {
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("%@"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v5, "count") < 4)
      v6 = CFSTR("S%@, E%@ • %@");
    else
      v6 = (__CFString *)v4;

    v8 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(a1, "seasonNumber");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "episodeNumber");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "episodeTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", v6, v9, v10, v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (__CFString)tvrui_secondaryTitle
{
  __CFString *v2;

  if (objc_msgSend(a1, "tvrui_isTVEpisode"))
  {
    objc_msgSend(a1, "title");
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = &stru_24DE30718;
  }
  return v2;
}

- (id)metadataMergedFromTVRCMediaInfo:()TVRUIAdditions
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
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

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "copy");
  v6 = objc_msgSend(v4, "kind");
  objc_msgSend(v4, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != 1)
  {
    if (!v7)
      goto LABEL_9;
    objc_msgSend(v4, "title");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (v7)
  {
    objc_msgSend(v4, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEpisodeTitle:", v8);

  }
  objc_msgSend(v4, "showTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v4, "showTitle");
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v11 = (void *)v10;
    objc_msgSend(v5, "setTitle:", v10);

  }
LABEL_9:
  objc_msgSend(v4, "genre");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v4, "genre");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setGenre:", v13);

  }
  objc_msgSend(v5, "duration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend(v4, "duration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      goto LABEL_15;
    objc_msgSend(v4, "duration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDuration:", v14);
  }

LABEL_15:
  objc_msgSend(v5, "showID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend(v4, "showIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
      goto LABEL_19;
    objc_msgSend(v4, "showIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setShowID:", v16);
  }

LABEL_19:
  objc_msgSend(v5, "seasonNumber");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    objc_msgSend(v4, "seasonNumber");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
      goto LABEL_23;
    objc_msgSend(v4, "seasonNumber");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSeasonNumber:", v18);
  }

LABEL_23:
  objc_msgSend(v5, "episodeNumber");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    objc_msgSend(v4, "episodeNumber");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
      goto LABEL_27;
    objc_msgSend(v4, "episodeNumber");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEpisodeNumber:", v20);
  }

LABEL_27:
  objc_msgSend(v5, "ratingDescription");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    objc_msgSend(v4, "ratingDescription");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
      goto LABEL_31;
    objc_msgSend(v4, "ratingDescription");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRatingDescription:", v22);
  }

LABEL_31:
  objc_msgSend(v5, "extendedDescription");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v24)
  {
    objc_msgSend(v4, "extendedDescription");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
      goto LABEL_35;
    objc_msgSend(v4, "extendedDescription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExtendedDescription:", v24);
  }

LABEL_35:
  objc_msgSend(v5, "productPageURL");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v26)
  {
    objc_msgSend(v4, "productURL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v27)
      goto LABEL_39;
    objc_msgSend(v4, "productURL");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setProductPageURL:", v26);
  }

LABEL_39:
  objc_msgSend(v5, "showProductPageURL");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v28)
  {
    objc_msgSend(v4, "showURL");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v29)
      goto LABEL_43;
    objc_msgSend(v4, "showURL");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setShowProductPageURL:", v28);
  }

LABEL_43:
  objc_msgSend(v5, "releaseDate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v30)
  {
    objc_msgSend(v4, "releaseDate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v31)
      goto LABEL_47;
    objc_msgSend(v4, "releaseDate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setReleaseDate:", v30);
  }

LABEL_47:
  objc_msgSend(v5, "rottenTomatoesReview");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
LABEL_50:

    goto LABEL_51;
  }
  objc_msgSend(v4, "rottenTomatoesReview");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    objc_msgSend(v4, "rottenTomatoesReview");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v32, "copy");
    objc_msgSend(v5, "setRottenTomatoesReview:", v34);

    goto LABEL_50;
  }
LABEL_51:
  objc_msgSend(v5, "setIsAppleOriginal:", objc_msgSend(v4, "isAppleOriginal"));
  objc_msgSend(v5, "setKind:", objc_msgSend(a1, "_nowPlayingKindForMediaInfoKind:", objc_msgSend(v4, "kind")));
  objc_msgSend(v4, "imageURLTemplate");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImageURLTemplate:", v35);

  return v5;
}

- (uint64_t)_nowPlayingKindForMediaInfoKind:()TVRUIAdditions
{
  if ((unint64_t)(a3 - 1) > 4)
    return 0;
  else
    return qword_21B0F77C0[a3 - 1];
}

@end
