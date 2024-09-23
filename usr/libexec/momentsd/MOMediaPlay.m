@implementation MOMediaPlay

- (MOMediaPlay)initWithTitle:(id)a3 album:(id)a4 bundleId:(id)a5 productId:(id)a6 genre:(id)a7 mediaType:(id)a8 artist:(id)a9 sumTimePlayed:(id)a10 repetitions:(int)a11 mediaPlaySessions:(id)a12 firstPartyTimePlayedRatio:(id)a13
{
  id v19;
  id v20;
  id v21;
  id v22;
  id os_log;
  NSObject *v24;
  void *v25;
  MOMediaPlay *v26;
  MOMediaPlay *v27;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  objc_super v39;

  v38 = a3;
  v37 = a4;
  v31 = a5;
  v36 = a5;
  v35 = a6;
  v34 = a7;
  v32 = a8;
  v33 = a8;
  v19 = a9;
  v20 = a10;
  v21 = a12;
  v22 = a13;
  if (!v21)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[MOMediaPlay initWithTitle:album:bundleId:productId:genre:mediaType:artist:sumTimePlayed:repetitions:mediaPlaySessions:firstPartyTimePlayedRatio:].cold.1(v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOMediaPlay.m"), 20, CFSTR("Invalid parameter not satisfying: mediaPlaySessions != nil (in %s:%d)"), "-[MOMediaPlay initWithTitle:album:bundleId:productId:genre:mediaType:artist:sumTimePlayed:repetitions:mediaPlaySessions:firstPartyTimePlayedRatio:]", 20);

  }
  v39.receiver = self;
  v39.super_class = (Class)MOMediaPlay;
  v26 = -[MOMediaPlay init](&v39, "init");
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_title, a3);
    objc_storeStrong((id *)&v27->_album, a4);
    objc_storeStrong((id *)&v27->_bundleId, v31);
    objc_storeStrong((id *)&v27->_productId, a6);
    objc_storeStrong((id *)&v27->_genre, a7);
    objc_storeStrong((id *)&v27->_mediaType, v32);
    objc_storeStrong((id *)&v27->_artist, a9);
    objc_storeStrong((id *)&v27->_sumTimePlayed, a10);
    v27->_repetitions = a11;
    objc_storeStrong((id *)&v27->_mediaPlaySessions, a12);
    objc_storeStrong((id *)&v27->_firstPartyTimePlayedRatio, a13);
  }

  return v27;
}

+ (id)mediaPlayWithTitle:(id)a3 album:(id)a4 bundleId:(id)a5 productId:(id)a6 genre:(id)a7 mediaType:(id)a8 artist:(id)a9 sumTimePlayed:(id)a10 repetitions:(int)a11 mediaPlaySessions:(id)a12 firstPartyTimePlayedRatio:(id)a13
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v30;
  id v32;

  v19 = a13;
  v20 = a12;
  v21 = a10;
  v22 = a9;
  v23 = a8;
  v24 = a7;
  v25 = a6;
  v26 = a5;
  v27 = a4;
  v28 = a3;
  LODWORD(v30) = a11;
  v32 = objc_msgSend(objc_alloc((Class)a1), "initWithTitle:album:bundleId:productId:genre:mediaType:artist:sumTimePlayed:repetitions:mediaPlaySessions:firstPartyTimePlayedRatio:", v28, v27, v26, v25, v24, v23, v22, v21, v30, v20, v19);

  return v32;
}

- (id)copyWithReplacementTitle:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v9;

  v4 = a3;
  v6 = objc_alloc((Class)objc_opt_class(self, v5));
  LODWORD(v9) = self->_repetitions;
  v7 = objc_msgSend(v6, "initWithTitle:album:bundleId:productId:genre:mediaType:artist:sumTimePlayed:repetitions:mediaPlaySessions:firstPartyTimePlayedRatio:", v4, self->_album, self->_bundleId, self->_productId, self->_genre, self->_mediaType, self->_artist, self->_sumTimePlayed, v9, self->_mediaPlaySessions, self->_firstPartyTimePlayedRatio);

  return v7;
}

- (id)copyWithReplacementAlbum:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v9;

  v4 = a3;
  v6 = objc_alloc((Class)objc_opt_class(self, v5));
  LODWORD(v9) = self->_repetitions;
  v7 = objc_msgSend(v6, "initWithTitle:album:bundleId:productId:genre:mediaType:artist:sumTimePlayed:repetitions:mediaPlaySessions:firstPartyTimePlayedRatio:", self->_title, v4, self->_bundleId, self->_productId, self->_genre, self->_mediaType, self->_artist, self->_sumTimePlayed, v9, self->_mediaPlaySessions, self->_firstPartyTimePlayedRatio);

  return v7;
}

- (id)copyWithReplacementBundleId:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v9;

  v4 = a3;
  v6 = objc_alloc((Class)objc_opt_class(self, v5));
  LODWORD(v9) = self->_repetitions;
  v7 = objc_msgSend(v6, "initWithTitle:album:bundleId:productId:genre:mediaType:artist:sumTimePlayed:repetitions:mediaPlaySessions:firstPartyTimePlayedRatio:", self->_title, self->_album, v4, self->_productId, self->_genre, self->_mediaType, self->_artist, self->_sumTimePlayed, v9, self->_mediaPlaySessions, self->_firstPartyTimePlayedRatio);

  return v7;
}

- (id)copyWithReplacementProductId:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v9;

  v4 = a3;
  v6 = objc_alloc((Class)objc_opt_class(self, v5));
  LODWORD(v9) = self->_repetitions;
  v7 = objc_msgSend(v6, "initWithTitle:album:bundleId:productId:genre:mediaType:artist:sumTimePlayed:repetitions:mediaPlaySessions:firstPartyTimePlayedRatio:", self->_title, self->_album, self->_bundleId, v4, self->_genre, self->_mediaType, self->_artist, self->_sumTimePlayed, v9, self->_mediaPlaySessions, self->_firstPartyTimePlayedRatio);

  return v7;
}

- (id)copyWithReplacementGenre:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v9;

  v4 = a3;
  v6 = objc_alloc((Class)objc_opt_class(self, v5));
  LODWORD(v9) = self->_repetitions;
  v7 = objc_msgSend(v6, "initWithTitle:album:bundleId:productId:genre:mediaType:artist:sumTimePlayed:repetitions:mediaPlaySessions:firstPartyTimePlayedRatio:", self->_title, self->_album, self->_bundleId, self->_productId, v4, self->_mediaType, self->_artist, self->_sumTimePlayed, v9, self->_mediaPlaySessions, self->_firstPartyTimePlayedRatio);

  return v7;
}

- (id)copyWithReplacementMediaType:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v9;

  v4 = a3;
  v6 = objc_alloc((Class)objc_opt_class(self, v5));
  LODWORD(v9) = self->_repetitions;
  v7 = objc_msgSend(v6, "initWithTitle:album:bundleId:productId:genre:mediaType:artist:sumTimePlayed:repetitions:mediaPlaySessions:firstPartyTimePlayedRatio:", self->_title, self->_album, self->_bundleId, self->_productId, self->_genre, v4, self->_artist, self->_sumTimePlayed, v9, self->_mediaPlaySessions, self->_firstPartyTimePlayedRatio);

  return v7;
}

- (id)copyWithReplacementArtist:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v9;

  v4 = a3;
  v6 = objc_alloc((Class)objc_opt_class(self, v5));
  LODWORD(v9) = self->_repetitions;
  v7 = objc_msgSend(v6, "initWithTitle:album:bundleId:productId:genre:mediaType:artist:sumTimePlayed:repetitions:mediaPlaySessions:firstPartyTimePlayedRatio:", self->_title, self->_album, self->_bundleId, self->_productId, self->_genre, self->_mediaType, v4, self->_sumTimePlayed, v9, self->_mediaPlaySessions, self->_firstPartyTimePlayedRatio);

  return v7;
}

- (id)copyWithReplacementSumTimePlayed:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v9;

  v4 = a3;
  v6 = objc_alloc((Class)objc_opt_class(self, v5));
  LODWORD(v9) = self->_repetitions;
  v7 = objc_msgSend(v6, "initWithTitle:album:bundleId:productId:genre:mediaType:artist:sumTimePlayed:repetitions:mediaPlaySessions:firstPartyTimePlayedRatio:", self->_title, self->_album, self->_bundleId, self->_productId, self->_genre, self->_mediaType, self->_artist, v4, v9, self->_mediaPlaySessions, self->_firstPartyTimePlayedRatio);

  return v7;
}

- (id)copyWithReplacementRepetitions:(int)a3
{
  uint64_t v4;

  LODWORD(v4) = a3;
  return objc_msgSend(objc_alloc((Class)objc_opt_class(self, a2)), "initWithTitle:album:bundleId:productId:genre:mediaType:artist:sumTimePlayed:repetitions:mediaPlaySessions:firstPartyTimePlayedRatio:", self->_title, self->_album, self->_bundleId, self->_productId, self->_genre, self->_mediaType, self->_artist, self->_sumTimePlayed, v4, self->_mediaPlaySessions, self->_firstPartyTimePlayedRatio);
}

- (id)copyWithReplacementMediaPlaySessions:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v9;

  v4 = a3;
  v6 = objc_alloc((Class)objc_opt_class(self, v5));
  LODWORD(v9) = self->_repetitions;
  v7 = objc_msgSend(v6, "initWithTitle:album:bundleId:productId:genre:mediaType:artist:sumTimePlayed:repetitions:mediaPlaySessions:firstPartyTimePlayedRatio:", self->_title, self->_album, self->_bundleId, self->_productId, self->_genre, self->_mediaType, self->_artist, self->_sumTimePlayed, v9, v4, self->_firstPartyTimePlayedRatio);

  return v7;
}

- (BOOL)isEqualToMediaPlay:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSString *title;
  void *v10;
  unsigned int v11;
  int v12;
  void *v13;
  int v14;
  NSString *album;
  void *v16;
  unsigned int v17;
  int v18;
  void *v19;
  int v20;
  NSString *bundleId;
  void *v22;
  unsigned int v23;
  int v24;
  void *v25;
  int v26;
  NSString *productId;
  void *v28;
  unsigned int v29;
  int v30;
  void *v31;
  int v32;
  NSString *genre;
  void *v34;
  unsigned int v35;
  int v36;
  void *v37;
  int v38;
  NSString *mediaType;
  void *v40;
  unsigned int v41;
  int v42;
  void *v43;
  int v44;
  NSString *artist;
  void *v46;
  unsigned int v47;
  int v48;
  void *v49;
  int v50;
  NSNumber *sumTimePlayed;
  void *v52;
  unsigned int v53;
  int repetitions;
  int v55;
  void *v56;
  int v57;
  NSArray *mediaPlaySessions;
  void *v59;
  unsigned __int8 v60;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_30;
  v6 = self->_title != 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_30;
  title = self->_title;
  if (title)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
    v11 = -[NSString isEqual:](title, "isEqual:", v10);

    if (!v11)
      goto LABEL_30;
  }
  v12 = self->_album != 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "album"));
  v14 = v13 == 0;

  if (v12 == v14)
    goto LABEL_30;
  album = self->_album;
  if (album)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "album"));
    v17 = -[NSString isEqual:](album, "isEqual:", v16);

    if (!v17)
      goto LABEL_30;
  }
  v18 = self->_bundleId != 0;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleId"));
  v20 = v19 == 0;

  if (v18 == v20)
    goto LABEL_30;
  bundleId = self->_bundleId;
  if (bundleId)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleId"));
    v23 = -[NSString isEqual:](bundleId, "isEqual:", v22);

    if (!v23)
      goto LABEL_30;
  }
  v24 = self->_productId != 0;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "productId"));
  v26 = v25 == 0;

  if (v24 == v26)
    goto LABEL_30;
  productId = self->_productId;
  if (productId)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "productId"));
    v29 = -[NSString isEqual:](productId, "isEqual:", v28);

    if (!v29)
      goto LABEL_30;
  }
  v30 = self->_genre != 0;
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "genre"));
  v32 = v31 == 0;

  if (v30 == v32)
    goto LABEL_30;
  genre = self->_genre;
  if (genre)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "genre"));
    v35 = -[NSString isEqual:](genre, "isEqual:", v34);

    if (!v35)
      goto LABEL_30;
  }
  v36 = self->_mediaType != 0;
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mediaType"));
  v38 = v37 == 0;

  if (v36 == v38)
    goto LABEL_30;
  mediaType = self->_mediaType;
  if (mediaType)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mediaType"));
    v41 = -[NSString isEqual:](mediaType, "isEqual:", v40);

    if (!v41)
      goto LABEL_30;
  }
  v42 = self->_artist != 0;
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "artist"));
  v44 = v43 == 0;

  if (v42 == v44)
    goto LABEL_30;
  artist = self->_artist;
  if (artist)
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "artist"));
    v47 = -[NSString isEqual:](artist, "isEqual:", v46);

    if (!v47)
      goto LABEL_30;
  }
  v48 = self->_sumTimePlayed != 0;
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sumTimePlayed"));
  v50 = v49 == 0;

  if (v48 == v50)
    goto LABEL_30;
  sumTimePlayed = self->_sumTimePlayed;
  if (sumTimePlayed)
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sumTimePlayed"));
    v53 = -[NSNumber isEqual:](sumTimePlayed, "isEqual:", v52);

    if (!v53)
      goto LABEL_30;
  }
  repetitions = self->_repetitions;
  if (repetitions != objc_msgSend(v5, "repetitions")
    || (v55 = self->_mediaPlaySessions != 0,
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mediaPlaySessions")),
        v57 = v56 == 0,
        v56,
        v55 == v57))
  {
LABEL_30:
    v60 = 0;
  }
  else
  {
    mediaPlaySessions = self->_mediaPlaySessions;
    if (mediaPlaySessions)
    {
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mediaPlaySessions"));
      v60 = -[NSArray isEqual:](mediaPlaySessions, "isEqual:", v59);

    }
    else
    {
      v60 = 1;
    }
  }

  return v60;
}

- (BOOL)isEqual:(id)a3
{
  MOMediaPlay *v4;
  uint64_t v5;
  MOMediaPlay *v6;
  uint64_t v7;
  BOOL v8;

  v4 = (MOMediaPlay *)a3;
  v6 = v4;
  if (v4 == self)
  {
    v8 = 1;
  }
  else if (v4 && (v7 = objc_opt_class(self, v5), (objc_opt_isKindOfClass(v6, v7) & 1) != 0))
  {
    v8 = -[MOMediaPlay isEqualToMediaPlay:](self, "isEqualToMediaPlay:", v6);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  char *v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  _BYTE *v10;
  uint64_t v11;

  v3 = -[NSString hash](self->_title, "hash");
  v4 = (char *)-[NSString hash](self->_album, "hash") + 32 * v3 - v3;
  v5 = (_BYTE *)-[NSString hash](self->_bundleId, "hash") - v4 + 32 * (_QWORD)v4;
  v6 = -[NSString hash](self->_productId, "hash") + 32 * v5 - v5;
  v7 = -[NSString hash](self->_genre, "hash") + 32 * v6 - v6;
  v8 = -[NSString hash](self->_mediaType, "hash") + 32 * v7 - v7;
  v9 = -[NSString hash](self->_artist, "hash") + 32 * v8 - v8;
  v10 = -[NSNumber hash](self->_sumTimePlayed, "hash");
  v11 = self->_repetitions - (_QWORD)&v10[32 * v9 - v9] + 32 * (_QWORD)&v10[32 * v9 - v9];
  return (unint64_t)-[NSArray hash](self->_mediaPlaySessions, "hash") + 32 * v11 - v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MOMediaPlay)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  uint64_t v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  MOMediaPlay *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  objc_class *v27;
  NSString *v28;
  uint64_t v29;
  objc_class *v30;
  NSString *v31;
  id v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  objc_class *v38;
  NSString *v39;
  uint64_t v40;
  objc_class *v41;
  NSString *v42;
  id v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  objc_class *v49;
  NSString *v50;
  uint64_t v51;
  objc_class *v52;
  NSString *v53;
  id v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  objc_class *v60;
  NSString *v61;
  uint64_t v62;
  objc_class *v63;
  NSString *v64;
  id v65;
  void *v66;
  void *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  objc_class *v72;
  NSString *v73;
  uint64_t v74;
  uint64_t v75;
  objc_class *v76;
  NSString *v77;
  id v78;
  void *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  objc_class *v86;
  NSString *v87;
  uint64_t v88;
  objc_class *v89;
  NSString *v90;
  id v91;
  void *v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  objc_class *v100;
  NSString *v101;
  uint64_t v102;
  objc_class *v103;
  NSString *v104;
  void *v105;
  id v106;
  void *v107;
  id v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  id v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  id v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  objc_class *v122;
  NSString *v123;
  uint64_t v124;
  objc_class *v125;
  NSString *v126;
  id v127;
  void *v128;
  id v129;
  void *v130;
  void *v131;
  objc_class *v132;
  NSString *v133;
  uint64_t v134;
  objc_class *v135;
  NSString *v136;
  void *v137;
  id v138;
  id v139;
  uint64_t v140;
  id v141;
  void *v142;
  uint64_t v143;
  void *v144;
  id v145;
  id v146;
  void *v147;
  id v148;
  unsigned int v149;
  void *v150;
  void *v151;
  id v152;
  uint64_t v153;
  void *v154;
  uint64_t v155;
  MOMediaPlay *v156;
  NSErrorUserInfoKey v157;
  id v158;
  NSErrorUserInfoKey v159;
  id v160;
  NSErrorUserInfoKey v161;
  const __CFString *v162;
  NSErrorUserInfoKey v163;
  const __CFString *v164;
  NSErrorUserInfoKey v165;
  id v166;
  NSErrorUserInfoKey v167;
  id v168;
  NSErrorUserInfoKey v169;
  id v170;
  NSErrorUserInfoKey v171;
  id v172;
  NSErrorUserInfoKey v173;
  id v174;
  NSErrorUserInfoKey v175;
  id v176;
  NSErrorUserInfoKey v177;
  id v178;
  NSErrorUserInfoKey v179;
  id v180;

  v4 = a3;
  v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v5), CFSTR("title"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v8)
  {
    v9 = objc_opt_class(NSString, v7);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
    {
      v11 = (objc_class *)objc_opt_class(NSString, v10);
      v12 = NSStringFromClass(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v15 = (objc_class *)objc_opt_class(v8, v14);
      v16 = NSStringFromClass(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v18 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Unarchived unexpected class for MOMediaPlay key \"title\" (expected %@, decoded %@)"), v13, v17, 0);
      v179 = NSLocalizedDescriptionKey;
      v180 = v18;
      v19 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v180, &v179, 1));
      v20 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("MOMediaPlayOCNTErrorDomain"), 3, v19);
      objc_msgSend(v4, "failWithError:", v20);
      v21 = 0;
LABEL_42:

      goto LABEL_43;
    }
LABEL_6:
    v23 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v10), CFSTR("album"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v23);
    if (v13)
    {
      v25 = objc_opt_class(NSString, v24);
      if ((objc_opt_isKindOfClass(v13, v25) & 1) == 0)
      {
        v27 = (objc_class *)objc_opt_class(NSString, v26);
        v28 = NSStringFromClass(v27);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v28);
        v30 = (objc_class *)objc_opt_class(v13, v29);
        v31 = NSStringFromClass(v30);
        v18 = (id)objc_claimAutoreleasedReturnValue(v31);
        v19 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Unarchived unexpected class for MOMediaPlay key \"album\" (expected %@, decoded %@)"), v17, v18, 0);
        v177 = NSLocalizedDescriptionKey;
        v178 = v19;
        v20 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v178, &v177, 1));
        v32 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("MOMediaPlayOCNTErrorDomain"), 3, v20);
        objc_msgSend(v4, "failWithError:", v32);
        v21 = 0;
LABEL_41:

        goto LABEL_42;
      }
    }
    else
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));

      if (v33)
      {
        v21 = 0;
LABEL_46:

        goto LABEL_47;
      }
    }
    v34 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v26), CFSTR("bundleId"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v34);
    if (v17)
    {
      v36 = objc_opt_class(NSString, v35);
      if ((objc_opt_isKindOfClass(v17, v36) & 1) == 0)
      {
        v156 = self;
        v38 = (objc_class *)objc_opt_class(NSString, v37);
        v39 = NSStringFromClass(v38);
        v18 = (id)objc_claimAutoreleasedReturnValue(v39);
        v41 = (objc_class *)objc_opt_class(v17, v40);
        v42 = NSStringFromClass(v41);
        v19 = (id)objc_claimAutoreleasedReturnValue(v42);
        v20 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Unarchived unexpected class for MOMediaPlay key \"bundleId\" (expected %@, decoded %@)"), v18, v19, 0);
        v175 = NSLocalizedDescriptionKey;
        v176 = v20;
        v32 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v176, &v175, 1));
        v43 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("MOMediaPlayOCNTErrorDomain"), 3, v32);
        objc_msgSend(v4, "failWithError:", v43);
        v21 = 0;
LABEL_39:

LABEL_40:
        self = v156;
        goto LABEL_41;
      }
    }
    else
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));

      if (v44)
      {
        v21 = 0;
LABEL_45:

        goto LABEL_46;
      }
    }
    v45 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v37), CFSTR("productId"));
    v18 = (id)objc_claimAutoreleasedReturnValue(v45);
    if (v18)
    {
      v47 = objc_opt_class(NSString, v46);
      if ((objc_opt_isKindOfClass(v18, v47) & 1) == 0)
      {
        v156 = self;
        v49 = (objc_class *)objc_opt_class(NSString, v48);
        v50 = NSStringFromClass(v49);
        v19 = (id)objc_claimAutoreleasedReturnValue(v50);
        v52 = (objc_class *)objc_opt_class(v18, v51);
        v53 = NSStringFromClass(v52);
        v20 = (id)objc_claimAutoreleasedReturnValue(v53);
        v32 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Unarchived unexpected class for MOMediaPlay key \"productId\" (expected %@, decoded %@)"), v19, v20, 0);
        v173 = NSLocalizedDescriptionKey;
        v174 = v32;
        v155 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v174, &v173, 1));
        v54 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("MOMediaPlayOCNTErrorDomain"), 3, v155);
        objc_msgSend(v4, "failWithError:", v54);
        v21 = 0;
LABEL_37:

LABEL_38:
        v43 = (id)v155;
        goto LABEL_39;
      }
    }
    else
    {
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));

      if (v55)
      {
        v21 = 0;
LABEL_44:

        goto LABEL_45;
      }
    }
    v156 = self;
    v56 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v48), CFSTR("genre"));
    v19 = (id)objc_claimAutoreleasedReturnValue(v56);
    if (v19)
    {
      v58 = objc_opt_class(NSString, v57);
      if ((objc_opt_isKindOfClass(v19, v58) & 1) == 0)
      {
        v60 = (objc_class *)objc_opt_class(NSString, v59);
        v61 = NSStringFromClass(v60);
        v20 = (id)objc_claimAutoreleasedReturnValue(v61);
        v63 = (objc_class *)objc_opt_class(v19, v62);
        v64 = NSStringFromClass(v63);
        v32 = (id)objc_claimAutoreleasedReturnValue(v64);
        v171 = NSLocalizedDescriptionKey;
        v172 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Unarchived unexpected class for MOMediaPlay key \"genre\" (expected %@, decoded %@)"), v20, v32, 0);
        v155 = (uint64_t)v172;
        v54 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v172, &v171, 1));
        v65 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("MOMediaPlayOCNTErrorDomain"), 3, v54);
        objc_msgSend(v4, "failWithError:", v65);
        v66 = v65;
LABEL_35:
        v21 = 0;
LABEL_36:

        goto LABEL_37;
      }
    }
    else
    {
      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));

      if (v67)
      {
        v21 = 0;
LABEL_43:

        goto LABEL_44;
      }
    }
    v68 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v59), CFSTR("mediaType"));
    v20 = (id)objc_claimAutoreleasedReturnValue(v68);
    if (v20)
    {
      v70 = objc_opt_class(NSString, v69);
      if ((objc_opt_isKindOfClass(v20, v70) & 1) == 0)
      {
        v72 = (objc_class *)objc_opt_class(NSString, v71);
        v73 = NSStringFromClass(v72);
        v74 = objc_claimAutoreleasedReturnValue(v73);
        v76 = (objc_class *)objc_opt_class(v20, v75);
        v77 = NSStringFromClass(v76);
        v32 = (id)v74;
        v155 = objc_claimAutoreleasedReturnValue(v77);
        v54 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Unarchived unexpected class for MOMediaPlay key \"mediaType\" (expected %@, decoded %@)"), v74, v155, 0);
        v169 = NSLocalizedDescriptionKey;
        v170 = v54;
        v152 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v170, &v169, 1));
        v78 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("MOMediaPlayOCNTErrorDomain"), 3, v152);
        objc_msgSend(v4, "failWithError:", v78);

LABEL_34:
        v66 = v152;
        goto LABEL_35;
      }
    }
    else
    {
      v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));

      if (v79)
      {
        v21 = 0;
        goto LABEL_42;
      }
    }
    v80 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v71), CFSTR("artist"));
    v81 = objc_claimAutoreleasedReturnValue(v80);
    v151 = (void *)v81;
    if (v81)
    {
      v83 = v81;
      v84 = objc_opt_class(NSString, v82);
      if ((objc_opt_isKindOfClass(v83, v84) & 1) == 0)
      {
        v86 = (objc_class *)objc_opt_class(NSString, v85);
        v87 = NSStringFromClass(v86);
        v155 = objc_claimAutoreleasedReturnValue(v87);
        v89 = (objc_class *)objc_opt_class(v151, v88);
        v90 = NSStringFromClass(v89);
        v54 = (id)objc_claimAutoreleasedReturnValue(v90);
        v32 = v151;
        v152 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Unarchived unexpected class for MOMediaPlay key \"artist\" (expected %@, decoded %@)"), v155, v54, 0);
        v167 = NSLocalizedDescriptionKey;
        v168 = v152;
        v147 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v168, &v167, 1));
        v91 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("MOMediaPlayOCNTErrorDomain"), 3, v147);
        objc_msgSend(v4, "failWithError:", v91);

        goto LABEL_34;
      }
    }
    else
    {
      v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));

      if (v93)
      {
        v21 = 0;
        v32 = 0;
        goto LABEL_40;
      }
    }
    v94 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v85), CFSTR("sumTimePlayed"));
    v95 = objc_claimAutoreleasedReturnValue(v94);
    v155 = v95;
    if (v95)
    {
      v97 = v95;
      v98 = objc_opt_class(NSNumber, v96);
      if ((objc_opt_isKindOfClass(v97, v98) & 1) == 0)
      {
        v100 = (objc_class *)objc_opt_class(NSNumber, v99);
        v101 = NSStringFromClass(v100);
        v54 = (id)objc_claimAutoreleasedReturnValue(v101);
        v103 = (objc_class *)objc_opt_class(v155, v102);
        v104 = NSStringFromClass(v103);
        v153 = objc_claimAutoreleasedReturnValue(v104);
        v148 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Unarchived unexpected class for MOMediaPlay key \"sumTimePlayed\" (expected %@, decoded %@)"), v54, v153, 0);
        v165 = NSLocalizedDescriptionKey;
        v166 = v148;
        v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v166, &v165, 1));
        v106 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("MOMediaPlayOCNTErrorDomain"), 3, v105);
        objc_msgSend(v4, "failWithError:", v106);

LABEL_65:
        v66 = (void *)v153;
LABEL_66:
        v21 = 0;
        v32 = v151;
        goto LABEL_36;
      }
    }
    else
    {
      v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));

      if (v107)
        goto LABEL_61;
    }
    v149 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("repetitions"));
    if (v149)
      goto LABEL_55;
    v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));

    if (!v130)
    {
      if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("repetitions")) & 1) == 0)
      {
        v163 = NSLocalizedDescriptionKey;
        v164 = CFSTR("Missing serialized value for MOMediaPlay.repetitions");
        v54 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v164, &v163, 1));
        v139 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("MOMediaPlayOCNTErrorDomain"), 1, v54);
        objc_msgSend(v4, "failWithError:", v139);
        v66 = v139;
        goto LABEL_66;
      }
LABEL_55:
      v108 = objc_alloc((Class)NSSet);
      v110 = objc_opt_class(NSArray, v109);
      v112 = objc_msgSend(v108, "initWithObjects:", v110, objc_opt_class(MOMediaPlaySession, v111), 0);
      v54 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v112, CFSTR("mediaPlaySessions")));

      if (!v54)
      {
        v145 = 0;
        v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));

        v32 = v151;
        if (v131)
        {
          v21 = 0;
          v54 = 0;
          goto LABEL_37;
        }
        v161 = NSLocalizedDescriptionKey;
        v162 = CFSTR("Retrieved nil serialized value for nonnull MOMediaPlay.mediaPlaySessions");
        v140 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v162, &v161, 1));
        v141 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("MOMediaPlayOCNTErrorDomain"), 2, v140);
        objc_msgSend(v4, "failWithError:", v141);

        v66 = (void *)v140;
        goto LABEL_70;
      }
      v114 = objc_opt_class(NSArray, v113);
      if ((objc_opt_isKindOfClass(v54, v114) & 1) == 0)
      {
        v132 = (objc_class *)objc_opt_class(NSArray, v115);
        v133 = NSStringFromClass(v132);
        v153 = objc_claimAutoreleasedReturnValue(v133);
        v135 = (objc_class *)objc_opt_class(v54, v134);
        v136 = NSStringFromClass(v135);
        v148 = (id)objc_claimAutoreleasedReturnValue(v136);
        v146 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Unarchived unexpected class for MOMediaPlay key \"mediaPlaySessions\" (expected %@, decoded %@)"), v153, v148, 0);
        v159 = NSLocalizedDescriptionKey;
        v160 = v146;
        v137 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v160, &v159, 1));
        v138 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("MOMediaPlayOCNTErrorDomain"), 3, v137);
        objc_msgSend(v4, "failWithError:", v138);

        goto LABEL_65;
      }
      v145 = v54;
      v116 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v115), CFSTR("firstPartyTimePlayedRatio"));
      v117 = objc_claimAutoreleasedReturnValue(v116);
      v154 = (void *)v117;
      if (v117)
      {
        v119 = v117;
        v120 = objc_opt_class(NSNumber, v118);
        if ((objc_opt_isKindOfClass(v119, v120) & 1) == 0)
        {
          v122 = (objc_class *)objc_opt_class(NSNumber, v121);
          v123 = NSStringFromClass(v122);
          v144 = (void *)objc_claimAutoreleasedReturnValue(v123);
          v125 = (objc_class *)objc_opt_class(v154, v124);
          v126 = NSStringFromClass(v125);
          v150 = (void *)objc_claimAutoreleasedReturnValue(v126);
          v127 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Unarchived unexpected class for MOMediaPlay key \"firstPartyTimePlayedRatio\" (expected %@, decoded %@)"), v144, v150, 0);
          v157 = NSLocalizedDescriptionKey;
          v158 = v127;
          v128 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v158, &v157, 1));
          v129 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("MOMediaPlayOCNTErrorDomain"), 3, v128);
          objc_msgSend(v4, "failWithError:", v129);

          v32 = v151;
          v66 = v154;
LABEL_70:
          v21 = 0;
          v54 = v145;
          goto LABEL_36;
        }
      }
      else
      {
        v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));

        if (v142)
        {
          v21 = 0;
          v32 = v151;
LABEL_74:
          v66 = v154;
          goto LABEL_36;
        }
      }
      v32 = v151;
      LODWORD(v143) = v149;
      v21 = -[MOMediaPlay initWithTitle:album:bundleId:productId:genre:mediaType:artist:sumTimePlayed:repetitions:mediaPlaySessions:firstPartyTimePlayedRatio:](v156, "initWithTitle:album:bundleId:productId:genre:mediaType:artist:sumTimePlayed:repetitions:mediaPlaySessions:firstPartyTimePlayedRatio:", v8, v13, v17, v18, v19, v20, v151, v155, v143, v54, v154);
      v156 = v21;
      goto LABEL_74;
    }
LABEL_61:
    v21 = 0;
    v32 = v151;
    goto LABEL_38;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));

  if (!v22)
    goto LABEL_6;
  v21 = 0;
LABEL_47:

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *title;
  NSString *album;
  NSString *bundleId;
  NSString *productId;
  NSString *genre;
  NSString *mediaType;
  NSString *artist;
  NSNumber *sumTimePlayed;
  NSArray *mediaPlaySessions;
  NSNumber *firstPartyTimePlayedRatio;
  id v15;

  v4 = a3;
  title = self->_title;
  v15 = v4;
  if (title)
  {
    objc_msgSend(v4, "encodeObject:forKey:", title, CFSTR("title"));
    v4 = v15;
  }
  album = self->_album;
  if (album)
  {
    objc_msgSend(v15, "encodeObject:forKey:", album, CFSTR("album"));
    v4 = v15;
  }
  bundleId = self->_bundleId;
  if (bundleId)
  {
    objc_msgSend(v15, "encodeObject:forKey:", bundleId, CFSTR("bundleId"));
    v4 = v15;
  }
  productId = self->_productId;
  if (productId)
  {
    objc_msgSend(v15, "encodeObject:forKey:", productId, CFSTR("productId"));
    v4 = v15;
  }
  genre = self->_genre;
  if (genre)
  {
    objc_msgSend(v15, "encodeObject:forKey:", genre, CFSTR("genre"));
    v4 = v15;
  }
  mediaType = self->_mediaType;
  if (mediaType)
  {
    objc_msgSend(v15, "encodeObject:forKey:", mediaType, CFSTR("mediaType"));
    v4 = v15;
  }
  artist = self->_artist;
  if (artist)
  {
    objc_msgSend(v15, "encodeObject:forKey:", artist, CFSTR("artist"));
    v4 = v15;
  }
  sumTimePlayed = self->_sumTimePlayed;
  if (sumTimePlayed)
  {
    objc_msgSend(v15, "encodeObject:forKey:", sumTimePlayed, CFSTR("sumTimePlayed"));
    v4 = v15;
  }
  objc_msgSend(v4, "encodeInt64:forKey:", self->_repetitions, CFSTR("repetitions"));
  mediaPlaySessions = self->_mediaPlaySessions;
  if (mediaPlaySessions)
    objc_msgSend(v15, "encodeObject:forKey:", mediaPlaySessions, CFSTR("mediaPlaySessions"));
  firstPartyTimePlayedRatio = self->_firstPartyTimePlayedRatio;
  if (firstPartyTimePlayedRatio)
    objc_msgSend(v15, "encodeObject:forKey:", firstPartyTimePlayedRatio, CFSTR("firstPartyTimePlayedRatio"));

}

- (id)description
{
  id v3;
  NSString *artist;
  NSNumber *sumTimePlayed;
  void *v6;
  id v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v3 = objc_alloc((Class)NSString);
  v10 = *(_OWORD *)&self->_bundleId;
  v11 = *(_OWORD *)&self->_title;
  v9 = *(_OWORD *)&self->_genre;
  artist = self->_artist;
  sumTimePlayed = self->_sumTimePlayed;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_repetitions));
  v7 = objc_msgSend(v3, "initWithFormat:", CFSTR("<MOMediaPlay | title:%@ album:%@ bundleId:%@ productId:%@ genre:%@ mediaType:%@ artist:%@ sumTimePlayed:%@ repetitions:%@ mediaPlaySessions:%@>"), v11, v10, v9, artist, sumTimePlayed, v6, self->_mediaPlaySessions);

  return v7;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)album
{
  return self->_album;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)productId
{
  return self->_productId;
}

- (NSString)genre
{
  return self->_genre;
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (NSString)artist
{
  return self->_artist;
}

- (NSNumber)sumTimePlayed
{
  return self->_sumTimePlayed;
}

- (int)repetitions
{
  return self->_repetitions;
}

- (NSArray)mediaPlaySessions
{
  return self->_mediaPlaySessions;
}

- (NSNumber)firstPartyTimePlayedRatio
{
  return self->_firstPartyTimePlayedRatio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstPartyTimePlayedRatio, 0);
  objc_storeStrong((id *)&self->_mediaPlaySessions, 0);
  objc_storeStrong((id *)&self->_sumTimePlayed, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_mediaType, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_productId, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)initWithTitle:(os_log_t)log album:bundleId:productId:genre:mediaType:artist:sumTimePlayed:repetitions:mediaPlaySessions:firstPartyTimePlayedRatio:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;

  v1 = 136315394;
  v2 = "-[MOMediaPlay initWithTitle:album:bundleId:productId:genre:mediaType:artist:sumTimePlayed:repetitions:mediaPlaySe"
       "ssions:firstPartyTimePlayedRatio:]";
  v3 = 1024;
  v4 = 20;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mediaPlaySessions != nil (in %s:%d)", (uint8_t *)&v1, 0x12u);
}

@end
