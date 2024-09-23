@implementation TVRCMediaInfo

+ (id)mediaInfoWithDictionary:(id)a3
{
  id v4;
  id v5;
  id v6;
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
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("content"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
    v6 = v4;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("roles"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("roles"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("id"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentifier:", v8);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("title"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v9);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKind:", objc_msgSend(a1, "kindForMediaType:", v10));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("description"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExtendedDescription:", v11);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("genres"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("name"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  objc_msgSend(v5, "setGenre:", v14);
  objc_msgSend(a1, "imageTemplateFromDict:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImageURLTemplate:", v15);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rating"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("displayName"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  objc_msgSend(v5, "setRatingDescription:", v17);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("duration"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDuration:", v18);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("showTitle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowTitle:", v19);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("seasonNumber"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSeasonNumber:", v20);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("episodeNumber"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEpisodeNumber:", v21);

  __41__TVRCMediaInfo_mediaInfoWithDictionary___block_invoke(v22, v6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProductURL:", v23);

  __41__TVRCMediaInfo_mediaInfoWithDictionary___block_invoke(v24, v6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowURL:", v25);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("showId"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowIdentifier:", v26);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isAppleOriginal"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsAppleOriginal:", objc_msgSend(v27, "BOOLValue"));

  v28 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v29 = v7;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v42 != v32)
          objc_enumerationMutation(v29);
        +[TVRCMediaInfoRole roleWithDictionary:](TVRCMediaInfoRole, "roleWithDictionary:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i), (_QWORD)v41);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addObject:", v34);

      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v31);
  }

  objc_msgSend(v5, "setRoles:", v28);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("releaseDate"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v35, "doubleValue"), v36 > 0.0))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", v36 / 1000.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v37 = 0;
  }

  objc_msgSend(v5, "setReleaseDate:", v37);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rottenTomatoesReviews"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    +[TVRCRottenTomatoesReview rottenTomatoesReviewWithDictionary:](TVRCRottenTomatoesReview, "rottenTomatoesReviewWithDictionary:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v39 = 0;
  }

  objc_msgSend(v5, "setRottenTomatoesReview:", v39);
  return v5;
}

id __41__TVRCMediaInfo_mediaInfoWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "objectForKeyedSubscript:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
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

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[TVRCMediaInfo identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v5);

  -[TVRCMediaInfo title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v6);

  objc_msgSend(v4, "setKind:", -[TVRCMediaInfo kind](self, "kind"));
  -[TVRCMediaInfo extendedDescription](self, "extendedDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExtendedDescription:", v7);

  -[TVRCMediaInfo genre](self, "genre");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGenre:", v8);

  -[TVRCMediaInfo imageURLTemplate](self, "imageURLTemplate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImageURLTemplate:", v9);

  -[TVRCMediaInfo ratingDescription](self, "ratingDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRatingDescription:", v10);

  -[TVRCMediaInfo duration](self, "duration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDuration:", v11);

  -[TVRCMediaInfo showTitle](self, "showTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowTitle:", v12);

  -[TVRCMediaInfo seasonNumber](self, "seasonNumber");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSeasonNumber:", v13);

  -[TVRCMediaInfo episodeNumber](self, "episodeNumber");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEpisodeNumber:", v14);

  -[TVRCMediaInfo productURL](self, "productURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProductURL:", v15);

  -[TVRCMediaInfo showURL](self, "showURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowURL:", v16);

  -[TVRCMediaInfo showIdentifier](self, "showIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowIdentifier:", v17);

  objc_msgSend(v4, "setIsAppleOriginal:", -[TVRCMediaInfo isAppleOriginal](self, "isAppleOriginal"));
  -[TVRCMediaInfo roles](self, "roles");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRoles:", v18);

  -[TVRCMediaInfo releaseDate](self, "releaseDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReleaseDate:", v19);

  -[TVRCMediaInfo rottenTomatoesReview](self, "rottenTomatoesReview");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "copy");
  objc_msgSend(v4, "setRottenTomatoesReview:", v21);

  return v4;
}

- (BOOL)isEqualToMediaInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  int v43;
  unint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  void *v65;
  void *v66;
  int v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  int v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  int v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  int v82;
  void *v83;
  void *v84;
  int v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  int v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  int v95;
  int v96;
  void *v97;
  void *v98;
  int v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  int v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  char v109;

  v4 = a3;
  if (!v4)
    goto LABEL_43;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_43;
  -[TVRCMediaInfo extendedDescription](self, "extendedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extendedDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (v5 == 0) ^ (v6 == 0);

  if ((v7 & 1) != 0)
    goto LABEL_43;
  -[TVRCMediaInfo genre](self, "genre");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "genre");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (v8 == 0) ^ (v9 == 0);

  if ((v10 & 1) != 0)
    goto LABEL_43;
  -[TVRCMediaInfo imageURLTemplate](self, "imageURLTemplate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageURLTemplate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (v11 == 0) ^ (v12 == 0);

  if ((v13 & 1) != 0)
    goto LABEL_43;
  -[TVRCMediaInfo ratingDescription](self, "ratingDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ratingDescription");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (v14 == 0) ^ (v15 == 0);

  if ((v16 & 1) != 0)
    goto LABEL_43;
  -[TVRCMediaInfo showTitle](self, "showTitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "showTitle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (v17 == 0) ^ (v18 == 0);

  if ((v19 & 1) != 0)
    goto LABEL_43;
  -[TVRCMediaInfo seasonNumber](self, "seasonNumber");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "seasonNumber");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (v20 == 0) ^ (v21 == 0);

  if ((v22 & 1) != 0)
    goto LABEL_43;
  -[TVRCMediaInfo episodeNumber](self, "episodeNumber");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "episodeNumber");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (v23 == 0) ^ (v24 == 0);

  if ((v25 & 1) != 0)
    goto LABEL_43;
  -[TVRCMediaInfo showURL](self, "showURL");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "showURL");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (v26 == 0) ^ (v27 == 0);

  if ((v28 & 1) != 0)
    goto LABEL_43;
  -[TVRCMediaInfo showIdentifier](self, "showIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "showIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (v29 == 0) ^ (v30 == 0);

  if ((v31 & 1) != 0)
    goto LABEL_43;
  -[TVRCMediaInfo releaseDate](self, "releaseDate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "releaseDate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (v32 == 0) ^ (v33 == 0);

  if ((v34 & 1) != 0)
    goto LABEL_43;
  -[TVRCMediaInfo rottenTomatoesReview](self, "rottenTomatoesReview");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rottenTomatoesReview");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (v35 == 0) ^ (v36 == 0);

  if ((v37 & 1) != 0)
    goto LABEL_43;
  -[TVRCMediaInfo identifier](self, "identifier");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v38, "isEqualToString:", v39);

  if (!v40)
    goto LABEL_43;
  -[TVRCMediaInfo title](self, "title");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v41, "isEqualToString:", v42);

  if (!v43)
    goto LABEL_43;
  v44 = -[TVRCMediaInfo kind](self, "kind");
  if (v44 != objc_msgSend(v4, "kind"))
    goto LABEL_43;
  -[TVRCMediaInfo extendedDescription](self, "extendedDescription");
  v45 = objc_claimAutoreleasedReturnValue();
  if (v45)
  {
    v46 = (void *)v45;
    -[TVRCMediaInfo extendedDescription](self, "extendedDescription");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "extendedDescription");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v47, "isEqualToString:", v48);

    if (!v49)
      goto LABEL_43;
  }
  -[TVRCMediaInfo genre](self, "genre");
  v50 = objc_claimAutoreleasedReturnValue();
  if (v50)
  {
    v51 = (void *)v50;
    -[TVRCMediaInfo genre](self, "genre");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "genre");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v52, "isEqualToString:", v53);

    if (!v54)
      goto LABEL_43;
  }
  -[TVRCMediaInfo imageURLTemplate](self, "imageURLTemplate");
  v55 = objc_claimAutoreleasedReturnValue();
  if (v55)
  {
    v56 = (void *)v55;
    -[TVRCMediaInfo imageURLTemplate](self, "imageURLTemplate");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageURLTemplate");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v57, "isEqual:", v58);

    if (!v59)
      goto LABEL_43;
  }
  -[TVRCMediaInfo ratingDescription](self, "ratingDescription");
  v60 = objc_claimAutoreleasedReturnValue();
  if (v60)
  {
    v61 = (void *)v60;
    -[TVRCMediaInfo ratingDescription](self, "ratingDescription");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ratingDescription");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v62, "isEqualToString:", v63);

    if (!v64)
      goto LABEL_43;
  }
  -[TVRCMediaInfo duration](self, "duration");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "duration");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v65, "isEqualToNumber:", v66);

  if (!v67)
    goto LABEL_43;
  -[TVRCMediaInfo showTitle](self, "showTitle");
  v68 = objc_claimAutoreleasedReturnValue();
  if (v68)
  {
    v69 = (void *)v68;
    -[TVRCMediaInfo showTitle](self, "showTitle");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "showTitle");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v70, "isEqualToString:", v71);

    if (!v72)
      goto LABEL_43;
  }
  -[TVRCMediaInfo seasonNumber](self, "seasonNumber");
  v73 = objc_claimAutoreleasedReturnValue();
  if (v73)
  {
    v74 = (void *)v73;
    -[TVRCMediaInfo seasonNumber](self, "seasonNumber");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "seasonNumber");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend(v75, "isEqualToNumber:", v76);

    if (!v77)
      goto LABEL_43;
  }
  -[TVRCMediaInfo episodeNumber](self, "episodeNumber");
  v78 = objc_claimAutoreleasedReturnValue();
  if (v78)
  {
    v79 = (void *)v78;
    -[TVRCMediaInfo episodeNumber](self, "episodeNumber");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "episodeNumber");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v80, "isEqualToNumber:", v81);

    if (!v82)
      goto LABEL_43;
  }
  -[TVRCMediaInfo productURL](self, "productURL");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "productURL");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = objc_msgSend(v83, "isEqual:", v84);

  if (!v85)
    goto LABEL_43;
  -[TVRCMediaInfo showURL](self, "showURL");
  v86 = objc_claimAutoreleasedReturnValue();
  if (v86)
  {
    v87 = (void *)v86;
    -[TVRCMediaInfo showURL](self, "showURL");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "showURL");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = objc_msgSend(v88, "isEqual:", v89);

    if (!v90)
      goto LABEL_43;
  }
  -[TVRCMediaInfo showIdentifier](self, "showIdentifier");
  v91 = objc_claimAutoreleasedReturnValue();
  if (v91)
  {
    v92 = (void *)v91;
    -[TVRCMediaInfo showIdentifier](self, "showIdentifier");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "showIdentifier");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = objc_msgSend(v93, "isEqualToString:", v94);

    if (!v95)
      goto LABEL_43;
  }
  v96 = -[TVRCMediaInfo isAppleOriginal](self, "isAppleOriginal");
  if (v96 != objc_msgSend(v4, "isAppleOriginal"))
    goto LABEL_43;
  -[TVRCMediaInfo roles](self, "roles");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "roles");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = objc_msgSend(v97, "isEqualToArray:", v98);

  if (!v99)
    goto LABEL_43;
  -[TVRCMediaInfo releaseDate](self, "releaseDate");
  v100 = objc_claimAutoreleasedReturnValue();
  if (!v100)
    goto LABEL_41;
  v101 = (void *)v100;
  -[TVRCMediaInfo releaseDate](self, "releaseDate");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "releaseDate");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = objc_msgSend(v102, "isEqualToDate:", v103);

  if (!v104)
  {
LABEL_43:
    v109 = 0;
  }
  else
  {
LABEL_41:
    -[TVRCMediaInfo rottenTomatoesReview](self, "rottenTomatoesReview");
    v105 = objc_claimAutoreleasedReturnValue();
    if (v105)
    {
      v106 = (void *)v105;
      -[TVRCMediaInfo rottenTomatoesReview](self, "rottenTomatoesReview");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "rottenTomatoesReview");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v109 = objc_msgSend(v107, "isEqualToRottenTomatoesReview:", v108);

    }
    else
    {
      v109 = 1;
    }
  }

  return v109;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TVRCMediaInfo)initWithCoder:(id)a3
{
  id v4;
  TVRCMediaInfo *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *title;
  uint64_t v10;
  NSString *extendedDescription;
  uint64_t v12;
  NSString *genre;
  uint64_t v14;
  NSString *imageURLTemplate;
  uint64_t v16;
  NSString *ratingDescription;
  uint64_t v18;
  NSNumber *duration;
  uint64_t v20;
  NSString *showTitle;
  uint64_t v22;
  NSNumber *seasonNumber;
  uint64_t v24;
  NSNumber *episodeNumber;
  uint64_t v26;
  NSURL *productURL;
  uint64_t v28;
  NSURL *showURL;
  uint64_t v30;
  NSString *showIdentifier;
  uint64_t v32;
  NSArray *roles;
  uint64_t v34;
  NSDate *releaseDate;
  uint64_t v36;
  TVRCRottenTomatoesReview *rottenTomatoesReview;
  objc_super v39;

  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)TVRCMediaInfo;
  v5 = -[TVRCMediaInfo init](&v39, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    v5->_kind = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kind"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extendedDescription"));
    v10 = objc_claimAutoreleasedReturnValue();
    extendedDescription = v5->_extendedDescription;
    v5->_extendedDescription = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("genre"));
    v12 = objc_claimAutoreleasedReturnValue();
    genre = v5->_genre;
    v5->_genre = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageURLTemplate"));
    v14 = objc_claimAutoreleasedReturnValue();
    imageURLTemplate = v5->_imageURLTemplate;
    v5->_imageURLTemplate = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ratingDescription"));
    v16 = objc_claimAutoreleasedReturnValue();
    ratingDescription = v5->_ratingDescription;
    v5->_ratingDescription = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("duration"));
    v18 = objc_claimAutoreleasedReturnValue();
    duration = v5->_duration;
    v5->_duration = (NSNumber *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("showTitle"));
    v20 = objc_claimAutoreleasedReturnValue();
    showTitle = v5->_showTitle;
    v5->_showTitle = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("seasonNumber"));
    v22 = objc_claimAutoreleasedReturnValue();
    seasonNumber = v5->_seasonNumber;
    v5->_seasonNumber = (NSNumber *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("episodeNumber"));
    v24 = objc_claimAutoreleasedReturnValue();
    episodeNumber = v5->_episodeNumber;
    v5->_episodeNumber = (NSNumber *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productURL"));
    v26 = objc_claimAutoreleasedReturnValue();
    productURL = v5->_productURL;
    v5->_productURL = (NSURL *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("showURL"));
    v28 = objc_claimAutoreleasedReturnValue();
    showURL = v5->_showURL;
    v5->_showURL = (NSURL *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("showIdentifier"));
    v30 = objc_claimAutoreleasedReturnValue();
    showIdentifier = v5->_showIdentifier;
    v5->_showIdentifier = (NSString *)v30;

    v5->_isAppleOriginal = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAppleOriginal"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("roles"));
    v32 = objc_claimAutoreleasedReturnValue();
    roles = v5->_roles;
    v5->_roles = (NSArray *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("releaseDate"));
    v34 = objc_claimAutoreleasedReturnValue();
    releaseDate = v5->_releaseDate;
    v5->_releaseDate = (NSDate *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rottenTomatoesReview"));
    v36 = objc_claimAutoreleasedReturnValue();
    rottenTomatoesReview = v5->_rottenTomatoesReview;
    v5->_rottenTomatoesReview = (TVRCRottenTomatoesReview *)v36;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_kind, CFSTR("kind"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_extendedDescription, CFSTR("extendedDescription"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_genre, CFSTR("genre"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_imageURLTemplate, CFSTR("imageURLTemplate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ratingDescription, CFSTR("ratingDescription"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_duration, CFSTR("duration"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_showTitle, CFSTR("showTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_seasonNumber, CFSTR("seasonNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_episodeNumber, CFSTR("episodeNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_productURL, CFSTR("productURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_showURL, CFSTR("showURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_showIdentifier, CFSTR("showIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isAppleOriginal, CFSTR("isAppleOriginal"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_roles, CFSTR("roles"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_releaseDate, CFSTR("releaseDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rottenTomatoesReview, CFSTR("rottenTomatoesReview"));

}

+ (unint64_t)kindForMediaType:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Episode")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Movie")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Show")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SportingEvent")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)imageTemplateFromDict:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("images"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && (v14 = 0u,
        v15 = 0u,
        v12 = 0u,
        v13 = 0u,
        (v4 = objc_msgSend(&unk_24DCF9380, "countByEnumeratingWithState:objects:count:", &v12, v16, 16)) != 0))
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(&unk_24DCF9380);
        objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v10 = v8;
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("url"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_13;
        }
      }
      v5 = objc_msgSend(&unk_24DCF9380, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v9 = 0;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v9 = 0;
  }
LABEL_13:

  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (unint64_t)kind
{
  return self->_kind;
}

- (void)setKind:(unint64_t)a3
{
  self->_kind = a3;
}

- (NSString)extendedDescription
{
  return self->_extendedDescription;
}

- (void)setExtendedDescription:(id)a3
{
  objc_storeStrong((id *)&self->_extendedDescription, a3);
}

- (NSString)genre
{
  return self->_genre;
}

- (void)setGenre:(id)a3
{
  objc_storeStrong((id *)&self->_genre, a3);
}

- (NSString)imageURLTemplate
{
  return self->_imageURLTemplate;
}

- (void)setImageURLTemplate:(id)a3
{
  objc_storeStrong((id *)&self->_imageURLTemplate, a3);
}

- (NSString)ratingDescription
{
  return self->_ratingDescription;
}

- (void)setRatingDescription:(id)a3
{
  objc_storeStrong((id *)&self->_ratingDescription, a3);
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
  objc_storeStrong((id *)&self->_duration, a3);
}

- (NSString)showTitle
{
  return self->_showTitle;
}

- (void)setShowTitle:(id)a3
{
  objc_storeStrong((id *)&self->_showTitle, a3);
}

- (NSNumber)seasonNumber
{
  return self->_seasonNumber;
}

- (void)setSeasonNumber:(id)a3
{
  objc_storeStrong((id *)&self->_seasonNumber, a3);
}

- (NSNumber)episodeNumber
{
  return self->_episodeNumber;
}

- (void)setEpisodeNumber:(id)a3
{
  objc_storeStrong((id *)&self->_episodeNumber, a3);
}

- (NSURL)productURL
{
  return self->_productURL;
}

- (void)setProductURL:(id)a3
{
  objc_storeStrong((id *)&self->_productURL, a3);
}

- (NSURL)showURL
{
  return self->_showURL;
}

- (void)setShowURL:(id)a3
{
  objc_storeStrong((id *)&self->_showURL, a3);
}

- (NSString)showIdentifier
{
  return self->_showIdentifier;
}

- (void)setShowIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_showIdentifier, a3);
}

- (BOOL)isAppleOriginal
{
  return self->_isAppleOriginal;
}

- (void)setIsAppleOriginal:(BOOL)a3
{
  self->_isAppleOriginal = a3;
}

- (NSArray)roles
{
  return self->_roles;
}

- (void)setRoles:(id)a3
{
  objc_storeStrong((id *)&self->_roles, a3);
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (void)setReleaseDate:(id)a3
{
  objc_storeStrong((id *)&self->_releaseDate, a3);
}

- (TVRCRottenTomatoesReview)rottenTomatoesReview
{
  return self->_rottenTomatoesReview;
}

- (void)setRottenTomatoesReview:(id)a3
{
  objc_storeStrong((id *)&self->_rottenTomatoesReview, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rottenTomatoesReview, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_roles, 0);
  objc_storeStrong((id *)&self->_showIdentifier, 0);
  objc_storeStrong((id *)&self->_showURL, 0);
  objc_storeStrong((id *)&self->_productURL, 0);
  objc_storeStrong((id *)&self->_episodeNumber, 0);
  objc_storeStrong((id *)&self->_seasonNumber, 0);
  objc_storeStrong((id *)&self->_showTitle, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_ratingDescription, 0);
  objc_storeStrong((id *)&self->_imageURLTemplate, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_extendedDescription, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
