@implementation TVRCNowPlayingMetadata

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCNowPlayingMetadata canonicalID](self, "canonicalID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCNowPlayingMetadata title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: canonicalID=%@; title=%@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqualToNowPlayingMetadata:(id)a3
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
  char v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  char v46;
  void *v47;
  void *v48;
  char v49;
  void *v50;
  void *v51;
  char v52;
  void *v53;
  void *v54;
  char v55;
  void *v56;
  void *v57;
  char v58;
  void *v59;
  void *v60;
  char v61;
  void *v62;
  void *v63;
  char v64;
  void *v65;
  void *v66;
  char v67;
  void *v68;
  void *v69;
  char v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  int v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  int v80;
  uint64_t v81;
  void *v82;
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
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  int v100;
  uint64_t v101;
  void *v102;
  void *v103;
  void *v104;
  int v105;
  uint64_t v106;
  void *v107;
  void *v108;
  void *v109;
  int v110;
  uint64_t v111;
  void *v112;
  void *v113;
  void *v114;
  int v115;
  uint64_t v116;
  void *v117;
  void *v118;
  void *v119;
  int v120;
  uint64_t v121;
  void *v122;
  void *v123;
  void *v124;
  int v125;
  uint64_t v126;
  void *v127;
  void *v128;
  void *v129;
  int v130;
  void *v131;
  void *v132;
  void *v133;
  int v134;
  uint64_t v135;
  void *v136;
  void *v137;
  void *v138;
  int v139;
  uint64_t v140;
  void *v141;
  void *v142;
  void *v143;
  int v144;
  uint64_t v145;
  void *v146;
  void *v147;
  void *v148;
  int v149;
  uint64_t v150;
  void *v151;
  void *v152;
  void *v153;
  int v154;
  uint64_t v155;
  void *v156;
  void *v157;
  void *v158;
  int v159;
  uint64_t v160;
  void *v161;
  void *v162;
  void *v163;
  int v164;
  uint64_t v165;
  void *v166;
  void *v167;
  void *v168;
  int v169;
  uint64_t v170;
  void *v171;
  void *v172;
  void *v173;
  int v174;
  unint64_t v175;
  int v176;
  uint64_t v177;
  void *v178;
  void *v179;
  void *v180;
  int v181;
  uint64_t v182;
  void *v183;
  void *v184;
  void *v185;
  char v186;

  v4 = a3;
  if (!v4)
    goto LABEL_73;
  -[TVRCNowPlayingMetadata canonicalID](self, "canonicalID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "canonicalID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (v5 == 0) ^ (v6 == 0);

  if ((v7 & 1) != 0)
    goto LABEL_73;
  -[TVRCNowPlayingMetadata title](self, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (v8 == 0) ^ (v9 == 0);

  if ((v10 & 1) != 0)
    goto LABEL_73;
  -[TVRCNowPlayingMetadata genre](self, "genre");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "genre");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (v11 == 0) ^ (v12 == 0);

  if ((v13 & 1) != 0)
    goto LABEL_73;
  -[TVRCNowPlayingMetadata episodeTitle](self, "episodeTitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "episodeTitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (v14 == 0) ^ (v15 == 0);

  if ((v16 & 1) != 0)
    goto LABEL_73;
  -[TVRCNowPlayingMetadata duration](self, "duration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "duration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (v17 == 0) ^ (v18 == 0);

  if ((v19 & 1) != 0)
    goto LABEL_73;
  -[TVRCNowPlayingMetadata showID](self, "showID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "showID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (v20 == 0) ^ (v21 == 0);

  if ((v22 & 1) != 0)
    goto LABEL_73;
  -[TVRCNowPlayingMetadata seasonNumber](self, "seasonNumber");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "seasonNumber");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (v23 == 0) ^ (v24 == 0);

  if ((v25 & 1) != 0)
    goto LABEL_73;
  -[TVRCNowPlayingMetadata episodeNumber](self, "episodeNumber");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "episodeNumber");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (v26 == 0) ^ (v27 == 0);

  if ((v28 & 1) != 0)
    goto LABEL_73;
  -[TVRCNowPlayingMetadata ratingDescription](self, "ratingDescription");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ratingDescription");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (v29 == 0) ^ (v30 == 0);

  if ((v31 & 1) != 0)
    goto LABEL_73;
  -[TVRCNowPlayingMetadata extendedDescription](self, "extendedDescription");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extendedDescription");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (v32 == 0) ^ (v33 == 0);

  if ((v34 & 1) != 0)
    goto LABEL_73;
  -[TVRCNowPlayingMetadata iTunesStoreIdentifier](self, "iTunesStoreIdentifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iTunesStoreIdentifier");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (v35 == 0) ^ (v36 == 0);

  if ((v37 & 1) != 0)
    goto LABEL_73;
  -[TVRCNowPlayingMetadata productPageURL](self, "productPageURL");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "productPageURL");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (v38 == 0) ^ (v39 == 0);

  if ((v40 & 1) != 0)
    goto LABEL_73;
  -[TVRCNowPlayingMetadata showProductPageURL](self, "showProductPageURL");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "showProductPageURL");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (v41 == 0) ^ (v42 == 0);

  if ((v43 & 1) != 0)
    goto LABEL_73;
  -[TVRCNowPlayingMetadata mainContentStartTime](self, "mainContentStartTime");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mainContentStartTime");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (v44 == 0) ^ (v45 == 0);

  if ((v46 & 1) != 0)
    goto LABEL_73;
  -[TVRCNowPlayingMetadata programID](self, "programID");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "programID");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (v47 == 0) ^ (v48 == 0);

  if ((v49 & 1) != 0)
    goto LABEL_73;
  -[TVRCNowPlayingMetadata timeOffset](self, "timeOffset");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeOffset");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (v50 == 0) ^ (v51 == 0);

  if ((v52 & 1) != 0)
    goto LABEL_73;
  -[TVRCNowPlayingMetadata audioLanguage](self, "audioLanguage");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioLanguage");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = (v53 == 0) ^ (v54 == 0);

  if ((v55 & 1) != 0)
    goto LABEL_73;
  -[TVRCNowPlayingMetadata timestamp](self, "timestamp");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timestamp");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = (v56 == 0) ^ (v57 == 0);

  if ((v58 & 1) != 0)
    goto LABEL_73;
  -[TVRCNowPlayingMetadata currentlyPlayingSongID](self, "currentlyPlayingSongID");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentlyPlayingSongID");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = (v59 == 0) ^ (v60 == 0);

  if ((v61 & 1) != 0)
    goto LABEL_73;
  -[TVRCNowPlayingMetadata bundleID](self, "bundleID");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleID");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = (v62 == 0) ^ (v63 == 0);

  if ((v64 & 1) != 0)
    goto LABEL_73;
  -[TVRCNowPlayingMetadata releaseDate](self, "releaseDate");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "releaseDate");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = (v65 == 0) ^ (v66 == 0);

  if ((v67 & 1) != 0)
    goto LABEL_73;
  -[TVRCNowPlayingMetadata rottenTomatoesReview](self, "rottenTomatoesReview");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rottenTomatoesReview");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = (v68 == 0) ^ (v69 == 0);

  if ((v70 & 1) != 0)
    goto LABEL_73;
  -[TVRCNowPlayingMetadata canonicalID](self, "canonicalID");
  v71 = objc_claimAutoreleasedReturnValue();
  if (v71)
  {
    v72 = (void *)v71;
    -[TVRCNowPlayingMetadata canonicalID](self, "canonicalID");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "canonicalID");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = objc_msgSend(v73, "isEqualToString:", v74);

    if (!v75)
      goto LABEL_73;
  }
  -[TVRCNowPlayingMetadata title](self, "title");
  v76 = objc_claimAutoreleasedReturnValue();
  if (v76)
  {
    v77 = (void *)v76;
    -[TVRCNowPlayingMetadata title](self, "title");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = objc_msgSend(v78, "isEqualToString:", v79);

    if (!v80)
      goto LABEL_73;
  }
  -[TVRCNowPlayingMetadata genre](self, "genre");
  v81 = objc_claimAutoreleasedReturnValue();
  if (v81)
  {
    v82 = (void *)v81;
    -[TVRCNowPlayingMetadata genre](self, "genre");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "genre");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = objc_msgSend(v83, "isEqualToString:", v84);

    if (!v85)
      goto LABEL_73;
  }
  -[TVRCNowPlayingMetadata episodeTitle](self, "episodeTitle");
  v86 = objc_claimAutoreleasedReturnValue();
  if (v86)
  {
    v87 = (void *)v86;
    -[TVRCNowPlayingMetadata episodeTitle](self, "episodeTitle");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "episodeTitle");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = objc_msgSend(v88, "isEqualToString:", v89);

    if (!v90)
      goto LABEL_73;
  }
  -[TVRCNowPlayingMetadata showID](self, "showID");
  v91 = objc_claimAutoreleasedReturnValue();
  if (v91)
  {
    v92 = (void *)v91;
    -[TVRCNowPlayingMetadata showID](self, "showID");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "showID");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = objc_msgSend(v93, "isEqualToString:", v94);

    if (!v95)
      goto LABEL_73;
  }
  -[TVRCNowPlayingMetadata duration](self, "duration");
  v96 = objc_claimAutoreleasedReturnValue();
  if (v96)
  {
    v97 = (void *)v96;
    -[TVRCNowPlayingMetadata duration](self, "duration");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "duration");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = objc_msgSend(v98, "isEqualToNumber:", v99);

    if (!v100)
      goto LABEL_73;
  }
  -[TVRCNowPlayingMetadata seasonNumber](self, "seasonNumber");
  v101 = objc_claimAutoreleasedReturnValue();
  if (v101)
  {
    v102 = (void *)v101;
    -[TVRCNowPlayingMetadata seasonNumber](self, "seasonNumber");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "seasonNumber");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = objc_msgSend(v103, "isEqualToNumber:", v104);

    if (!v105)
      goto LABEL_73;
  }
  -[TVRCNowPlayingMetadata episodeNumber](self, "episodeNumber");
  v106 = objc_claimAutoreleasedReturnValue();
  if (v106)
  {
    v107 = (void *)v106;
    -[TVRCNowPlayingMetadata episodeNumber](self, "episodeNumber");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "episodeNumber");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = objc_msgSend(v108, "isEqualToNumber:", v109);

    if (!v110)
      goto LABEL_73;
  }
  -[TVRCNowPlayingMetadata ratingDescription](self, "ratingDescription");
  v111 = objc_claimAutoreleasedReturnValue();
  if (v111)
  {
    v112 = (void *)v111;
    -[TVRCNowPlayingMetadata ratingDescription](self, "ratingDescription");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ratingDescription");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = objc_msgSend(v113, "isEqualToString:", v114);

    if (!v115)
      goto LABEL_73;
  }
  -[TVRCNowPlayingMetadata extendedDescription](self, "extendedDescription");
  v116 = objc_claimAutoreleasedReturnValue();
  if (v116)
  {
    v117 = (void *)v116;
    -[TVRCNowPlayingMetadata extendedDescription](self, "extendedDescription");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "extendedDescription");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v120 = objc_msgSend(v118, "isEqualToString:", v119);

    if (!v120)
      goto LABEL_73;
  }
  -[TVRCNowPlayingMetadata iTunesStoreIdentifier](self, "iTunesStoreIdentifier");
  v121 = objc_claimAutoreleasedReturnValue();
  if (v121)
  {
    v122 = (void *)v121;
    -[TVRCNowPlayingMetadata iTunesStoreIdentifier](self, "iTunesStoreIdentifier");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "iTunesStoreIdentifier");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    v125 = objc_msgSend(v123, "isEqualToString:", v124);

    if (!v125)
      goto LABEL_73;
  }
  -[TVRCNowPlayingMetadata productPageURL](self, "productPageURL");
  v126 = objc_claimAutoreleasedReturnValue();
  if (v126)
  {
    v127 = (void *)v126;
    -[TVRCNowPlayingMetadata productPageURL](self, "productPageURL");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "productPageURL");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v130 = objc_msgSend(v128, "isEqual:", v129);

    if (!v130)
      goto LABEL_73;
  }
  -[TVRCNowPlayingMetadata showProductPageURL](self, "showProductPageURL");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  if (v131)
  {

  }
  else
  {
    -[TVRCNowPlayingMetadata showProductPageURL](self, "showProductPageURL");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "showProductPageURL");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    v134 = objc_msgSend(v132, "isEqual:", v133);

    if (!v134)
    {
LABEL_73:
      v186 = 0;
      goto LABEL_74;
    }
  }
  -[TVRCNowPlayingMetadata mainContentStartTime](self, "mainContentStartTime");
  v135 = objc_claimAutoreleasedReturnValue();
  if (v135)
  {
    v136 = (void *)v135;
    -[TVRCNowPlayingMetadata mainContentStartTime](self, "mainContentStartTime");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mainContentStartTime");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v139 = objc_msgSend(v137, "isEqual:", v138);

    if (!v139)
      goto LABEL_73;
  }
  -[TVRCNowPlayingMetadata programID](self, "programID");
  v140 = objc_claimAutoreleasedReturnValue();
  if (v140)
  {
    v141 = (void *)v140;
    -[TVRCNowPlayingMetadata programID](self, "programID");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "programID");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    v144 = objc_msgSend(v142, "isEqualToString:", v143);

    if (!v144)
      goto LABEL_73;
  }
  -[TVRCNowPlayingMetadata timeOffset](self, "timeOffset");
  v145 = objc_claimAutoreleasedReturnValue();
  if (v145)
  {
    v146 = (void *)v145;
    -[TVRCNowPlayingMetadata timeOffset](self, "timeOffset");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeOffset");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    v149 = objc_msgSend(v147, "isEqualToNumber:", v148);

    if (!v149)
      goto LABEL_73;
  }
  -[TVRCNowPlayingMetadata audioLanguage](self, "audioLanguage");
  v150 = objc_claimAutoreleasedReturnValue();
  if (v150)
  {
    v151 = (void *)v150;
    -[TVRCNowPlayingMetadata audioLanguage](self, "audioLanguage");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioLanguage");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    v154 = objc_msgSend(v152, "isEqualToString:", v153);

    if (!v154)
      goto LABEL_73;
  }
  -[TVRCNowPlayingMetadata timestamp](self, "timestamp");
  v155 = objc_claimAutoreleasedReturnValue();
  if (v155)
  {
    v156 = (void *)v155;
    -[TVRCNowPlayingMetadata timestamp](self, "timestamp");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timestamp");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    v159 = objc_msgSend(v157, "isEqual:", v158);

    if (!v159)
      goto LABEL_73;
  }
  -[TVRCNowPlayingMetadata currentlyPlayingSongID](self, "currentlyPlayingSongID");
  v160 = objc_claimAutoreleasedReturnValue();
  if (v160)
  {
    v161 = (void *)v160;
    -[TVRCNowPlayingMetadata currentlyPlayingSongID](self, "currentlyPlayingSongID");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentlyPlayingSongID");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    v164 = objc_msgSend(v162, "isEqualToString:", v163);

    if (!v164)
      goto LABEL_73;
  }
  -[TVRCNowPlayingMetadata bundleID](self, "bundleID");
  v165 = objc_claimAutoreleasedReturnValue();
  if (v165)
  {
    v166 = (void *)v165;
    -[TVRCNowPlayingMetadata bundleID](self, "bundleID");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleID");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    v169 = objc_msgSend(v167, "isEqualToString:", v168);

    if (!v169)
      goto LABEL_73;
  }
  -[TVRCNowPlayingMetadata releaseDate](self, "releaseDate");
  v170 = objc_claimAutoreleasedReturnValue();
  if (v170)
  {
    v171 = (void *)v170;
    -[TVRCNowPlayingMetadata releaseDate](self, "releaseDate");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "releaseDate");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    v174 = objc_msgSend(v172, "isEqualToDate:", v173);

    if (!v174)
      goto LABEL_73;
  }
  v175 = -[TVRCNowPlayingMetadata kind](self, "kind");
  if (v175 != objc_msgSend(v4, "kind"))
    goto LABEL_73;
  v176 = -[TVRCNowPlayingMetadata isAppleOriginal](self, "isAppleOriginal");
  if (v176 != objc_msgSend(v4, "isAppleOriginal"))
    goto LABEL_73;
  -[TVRCNowPlayingMetadata rottenTomatoesReview](self, "rottenTomatoesReview");
  v177 = objc_claimAutoreleasedReturnValue();
  if (v177)
  {
    v178 = (void *)v177;
    -[TVRCNowPlayingMetadata rottenTomatoesReview](self, "rottenTomatoesReview");
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rottenTomatoesReview");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    v181 = objc_msgSend(v179, "isEqualToRottenTomatoesReview:", v180);

    if (!v181)
      goto LABEL_73;
  }
  -[TVRCNowPlayingMetadata imageURLTemplate](self, "imageURLTemplate");
  v182 = objc_claimAutoreleasedReturnValue();
  if (v182)
  {
    v183 = (void *)v182;
    -[TVRCNowPlayingMetadata imageURLTemplate](self, "imageURLTemplate");
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageURLTemplate");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    v186 = objc_msgSend(v184, "isEqualToString:", v185);

  }
  else
  {
    v186 = 1;
  }
LABEL_74:

  return v186;
}

- (BOOL)isMissingCriticalMetadata
{
  void *v2;
  BOOL v3;

  -[TVRCNowPlayingMetadata extendedDescription](self, "extendedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") == 0;

  return v3;
}

- (BOOL)isPlayingOnTVApp
{
  void *v2;
  char v3;

  -[TVRCNowPlayingMetadata bundleID](self, "bundleID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.TVWatchList"));

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TVRCNowPlayingMetadata *v4;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v4 = objc_alloc_init(TVRCNowPlayingMetadata);
  -[TVRCNowPlayingMetadata canonicalID](self, "canonicalID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCNowPlayingMetadata setCanonicalID:](v4, "setCanonicalID:", v5);

  -[TVRCNowPlayingMetadata title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCNowPlayingMetadata setTitle:](v4, "setTitle:", v6);

  -[TVRCNowPlayingMetadata genre](self, "genre");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCNowPlayingMetadata setGenre:](v4, "setGenre:", v7);

  -[TVRCNowPlayingMetadata episodeTitle](self, "episodeTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCNowPlayingMetadata setEpisodeTitle:](v4, "setEpisodeTitle:", v8);

  -[TVRCNowPlayingMetadata duration](self, "duration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCNowPlayingMetadata setDuration:](v4, "setDuration:", v9);

  -[TVRCNowPlayingMetadata showID](self, "showID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCNowPlayingMetadata setShowID:](v4, "setShowID:", v10);

  -[TVRCNowPlayingMetadata seasonNumber](self, "seasonNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCNowPlayingMetadata setSeasonNumber:](v4, "setSeasonNumber:", v11);

  -[TVRCNowPlayingMetadata episodeNumber](self, "episodeNumber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCNowPlayingMetadata setEpisodeNumber:](v4, "setEpisodeNumber:", v12);

  -[TVRCNowPlayingMetadata ratingDescription](self, "ratingDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCNowPlayingMetadata setRatingDescription:](v4, "setRatingDescription:", v13);

  -[TVRCNowPlayingMetadata extendedDescription](self, "extendedDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCNowPlayingMetadata setExtendedDescription:](v4, "setExtendedDescription:", v14);

  -[TVRCNowPlayingMetadata iTunesStoreIdentifier](self, "iTunesStoreIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCNowPlayingMetadata setITunesStoreIdentifier:](v4, "setITunesStoreIdentifier:", v15);

  -[TVRCNowPlayingMetadata productPageURL](self, "productPageURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCNowPlayingMetadata setProductPageURL:](v4, "setProductPageURL:", v16);

  -[TVRCNowPlayingMetadata showProductPageURL](self, "showProductPageURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCNowPlayingMetadata setShowProductPageURL:](v4, "setShowProductPageURL:", v17);

  -[TVRCNowPlayingMetadata mainContentStartTime](self, "mainContentStartTime");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCNowPlayingMetadata setMainContentStartTime:](v4, "setMainContentStartTime:", v18);

  -[TVRCNowPlayingMetadata programID](self, "programID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCNowPlayingMetadata setProgramID:](v4, "setProgramID:", v19);

  -[TVRCNowPlayingMetadata timeOffset](self, "timeOffset");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCNowPlayingMetadata setTimeOffset:](v4, "setTimeOffset:", v20);

  -[TVRCNowPlayingMetadata audioLanguage](self, "audioLanguage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCNowPlayingMetadata setAudioLanguage:](v4, "setAudioLanguage:", v21);

  -[TVRCNowPlayingMetadata timestamp](self, "timestamp");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCNowPlayingMetadata setTimestamp:](v4, "setTimestamp:", v22);

  -[TVRCNowPlayingMetadata currentlyPlayingSongID](self, "currentlyPlayingSongID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCNowPlayingMetadata setCurrentlyPlayingSongID:](v4, "setCurrentlyPlayingSongID:", v23);

  -[TVRCNowPlayingMetadata bundleID](self, "bundleID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCNowPlayingMetadata setBundleID:](v4, "setBundleID:", v24);

  -[TVRCNowPlayingMetadata releaseDate](self, "releaseDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCNowPlayingMetadata setReleaseDate:](v4, "setReleaseDate:", v25);

  -[TVRCNowPlayingMetadata setIsAppleOriginal:](v4, "setIsAppleOriginal:", -[TVRCNowPlayingMetadata isAppleOriginal](self, "isAppleOriginal"));
  -[TVRCNowPlayingMetadata setKind:](v4, "setKind:", -[TVRCNowPlayingMetadata kind](self, "kind"));
  -[TVRCNowPlayingMetadata rottenTomatoesReview](self, "rottenTomatoesReview");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v26, "copy");
  -[TVRCNowPlayingMetadata setRottenTomatoesReview:](v4, "setRottenTomatoesReview:", v27);

  -[TVRCNowPlayingMetadata imageURLTemplate](self, "imageURLTemplate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCNowPlayingMetadata setImageURLTemplate:](v4, "setImageURLTemplate:", v28);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TVRCNowPlayingMetadata)initWithCoder:(id)a3
{
  id v4;
  TVRCNowPlayingMetadata *v5;
  uint64_t v6;
  NSString *canonicalID;
  uint64_t v8;
  NSString *title;
  uint64_t v10;
  NSString *genre;
  uint64_t v12;
  NSString *episodeTitle;
  uint64_t v14;
  NSNumber *duration;
  uint64_t v16;
  NSString *showID;
  uint64_t v18;
  NSNumber *seasonNumber;
  uint64_t v20;
  NSNumber *episodeNumber;
  uint64_t v22;
  NSString *ratingDescription;
  uint64_t v24;
  NSString *extendedDescription;
  uint64_t v26;
  NSString *iTunesStoreIdentifier;
  uint64_t v28;
  NSURL *productPageURL;
  uint64_t v30;
  NSURL *showProductPageURL;
  uint64_t v32;
  NSNumber *mainContentStartTime;
  uint64_t v34;
  NSString *programID;
  uint64_t v36;
  NSNumber *timeOffset;
  uint64_t v38;
  NSString *audioLanguage;
  uint64_t v40;
  NSNumber *timestamp;
  uint64_t v42;
  NSString *currentlyPlayingSongID;
  uint64_t v44;
  NSString *bundleID;
  uint64_t v46;
  NSDate *releaseDate;
  uint64_t v48;
  TVRCRottenTomatoesReview *rottenTomatoesReview;
  uint64_t v50;
  NSString *imageURLTemplate;
  objc_super v53;

  v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)TVRCNowPlayingMetadata;
  v5 = -[TVRCNowPlayingMetadata init](&v53, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("canonicalID"));
    v6 = objc_claimAutoreleasedReturnValue();
    canonicalID = v5->_canonicalID;
    v5->_canonicalID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("genre"));
    v10 = objc_claimAutoreleasedReturnValue();
    genre = v5->_genre;
    v5->_genre = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("episodeTitle"));
    v12 = objc_claimAutoreleasedReturnValue();
    episodeTitle = v5->_episodeTitle;
    v5->_episodeTitle = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("duration"));
    v14 = objc_claimAutoreleasedReturnValue();
    duration = v5->_duration;
    v5->_duration = (NSNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("showID"));
    v16 = objc_claimAutoreleasedReturnValue();
    showID = v5->_showID;
    v5->_showID = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("seasonNumber"));
    v18 = objc_claimAutoreleasedReturnValue();
    seasonNumber = v5->_seasonNumber;
    v5->_seasonNumber = (NSNumber *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("episodeNumber"));
    v20 = objc_claimAutoreleasedReturnValue();
    episodeNumber = v5->_episodeNumber;
    v5->_episodeNumber = (NSNumber *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ratingDescription"));
    v22 = objc_claimAutoreleasedReturnValue();
    ratingDescription = v5->_ratingDescription;
    v5->_ratingDescription = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extendedDescription"));
    v24 = objc_claimAutoreleasedReturnValue();
    extendedDescription = v5->_extendedDescription;
    v5->_extendedDescription = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iTunesStoreIdentifier"));
    v26 = objc_claimAutoreleasedReturnValue();
    iTunesStoreIdentifier = v5->_iTunesStoreIdentifier;
    v5->_iTunesStoreIdentifier = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productPageURL"));
    v28 = objc_claimAutoreleasedReturnValue();
    productPageURL = v5->_productPageURL;
    v5->_productPageURL = (NSURL *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("showProductPageURL"));
    v30 = objc_claimAutoreleasedReturnValue();
    showProductPageURL = v5->_showProductPageURL;
    v5->_showProductPageURL = (NSURL *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mainContentStartTime"));
    v32 = objc_claimAutoreleasedReturnValue();
    mainContentStartTime = v5->_mainContentStartTime;
    v5->_mainContentStartTime = (NSNumber *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("programID"));
    v34 = objc_claimAutoreleasedReturnValue();
    programID = v5->_programID;
    v5->_programID = (NSString *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeOffset"));
    v36 = objc_claimAutoreleasedReturnValue();
    timeOffset = v5->_timeOffset;
    v5->_timeOffset = (NSNumber *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("audioLanguage"));
    v38 = objc_claimAutoreleasedReturnValue();
    audioLanguage = v5->_audioLanguage;
    v5->_audioLanguage = (NSString *)v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
    v40 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSNumber *)v40;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentlyPlayingSongID"));
    v42 = objc_claimAutoreleasedReturnValue();
    currentlyPlayingSongID = v5->_currentlyPlayingSongID;
    v5->_currentlyPlayingSongID = (NSString *)v42;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
    v44 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v44;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("releaseDate"));
    v46 = objc_claimAutoreleasedReturnValue();
    releaseDate = v5->_releaseDate;
    v5->_releaseDate = (NSDate *)v46;

    v5->_isAppleOriginal = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAppleOriginal"));
    v5->_kind = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("kind"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rottenTomatoesReview"));
    v48 = objc_claimAutoreleasedReturnValue();
    rottenTomatoesReview = v5->_rottenTomatoesReview;
    v5->_rottenTomatoesReview = (TVRCRottenTomatoesReview *)v48;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageURLTemplate"));
    v50 = objc_claimAutoreleasedReturnValue();
    imageURLTemplate = v5->_imageURLTemplate;
    v5->_imageURLTemplate = (NSString *)v50;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *canonicalID;
  id v5;

  canonicalID = self->_canonicalID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", canonicalID, CFSTR("canonicalID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_genre, CFSTR("genre"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_episodeTitle, CFSTR("episodeTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_duration, CFSTR("duration"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_showID, CFSTR("showID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_seasonNumber, CFSTR("seasonNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_episodeNumber, CFSTR("episodeNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ratingDescription, CFSTR("ratingDescription"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_extendedDescription, CFSTR("extendedDescription"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iTunesStoreIdentifier, CFSTR("iTunesStoreIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_productPageURL, CFSTR("productPageURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_showProductPageURL, CFSTR("showProductPageURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mainContentStartTime, CFSTR("mainContentStartTime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_programID, CFSTR("programID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timeOffset, CFSTR("timeOffset"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_audioLanguage, CFSTR("audioLanguage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timestamp, CFSTR("timestamp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentlyPlayingSongID, CFSTR("currentlyPlayingSongID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleID, CFSTR("bundleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_releaseDate, CFSTR("releaseDate"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isAppleOriginal, CFSTR("isAppleOriginal"));
  objc_msgSend(v5, "encodeInt:forKey:", LODWORD(self->_kind), CFSTR("kind"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rottenTomatoesReview, CFSTR("rottenTomatoesReview"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_imageURLTemplate, CFSTR("imageURLTemplate"));

}

+ (id)metadataFromContentItem:(id)a3
{
  id v4;
  TVRCNowPlayingMetadata *v5;
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
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v41;
  id v42;
  id obj;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    v5 = 0;
    goto LABEL_57;
  }
  v5 = objc_alloc_init(TVRCNowPlayingMetadata);
  objc_msgSend(v4, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v6, "duration");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCNowPlayingMetadata setDuration:](v5, "setDuration:", v8);

  objc_msgSend(v6, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCNowPlayingMetadata setTitle:](v5, "setTitle:", v9);

  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v6, "iTunesStoreIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCNowPlayingMetadata setITunesStoreIdentifier:](v5, "setITunesStoreIdentifier:", v12);

  objc_msgSend(a1, "currentAudioLanguageOptionFromContentItem:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCNowPlayingMetadata setAudioLanguage:](v5, "setAudioLanguage:", v13);

  v14 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "metadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "elapsedTimeTimestamp");
  objc_msgSend(v14, "numberWithDouble:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCNowPlayingMetadata setTimestamp:](v5, "setTimestamp:", v16);

  v17 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "metadata");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "elapsedTime");
  objc_msgSend(v17, "numberWithDouble:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCNowPlayingMetadata setTimeOffset:](v5, "setTimeOffset:", v19);

  objc_msgSend(v4, "metadata");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "nowPlayingInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("TVRAdditionalMetadata"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
    goto LABEL_55;
  v41 = v6;
  v42 = v4;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  objc_msgSend(v22, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (!v23)
    goto LABEL_54;
  v24 = v23;
  v25 = *(_QWORD *)v45;
  do
  {
    v26 = 0;
    do
    {
      if (*(_QWORD *)v45 != v25)
        objc_enumerationMutation(obj);
      v27 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v26);
      objc_msgSend(v22, "objectForKeyedSubscript:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v29 = v28;
      else
        v29 = 0;
      v30 = v29;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v31 = v28;
      else
        v31 = 0;
      v32 = v31;
      if (!objc_msgSend(v27, "isEqual:", CFSTR("avkt/com.apple.avkit.iTunesStoreIdentifier")))
      {
        v33 = objc_msgSend(v27, "isEqual:", CFSTR("avkt/com.apple.avkit.seasonNumber"));
        if ((_DWORD)v33)
        {
          __50__TVRCNowPlayingMetadata_metadataFromContentItem___block_invoke(v33, v30, v32);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[TVRCNowPlayingMetadata setSeasonNumber:](v5, "setSeasonNumber:", v34);
        }
        else
        {
          v35 = objc_msgSend(v27, "isEqual:", CFSTR("avkt/com.apple.avkit.episodeNumber"));
          if (!(_DWORD)v35)
          {
            if (objc_msgSend(v27, "isEqual:", CFSTR("mdta/com.apple.hls.episode-title")))
            {
              if (v30)
                -[TVRCNowPlayingMetadata setEpisodeTitle:](v5, "setEpisodeTitle:", v30);
            }
            else if (objc_msgSend(v27, "isEqual:", CFSTR("mdta/com.apple.hls.description")))
            {
              if (v30)
              {
                -[TVRCNowPlayingMetadata extendedDescription](v5, "extendedDescription");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v37 = objc_msgSend(v36, "length");

                if (!v37)
                  -[TVRCNowPlayingMetadata setExtendedDescription:](v5, "setExtendedDescription:", v30);
              }
            }
            else if (objc_msgSend(v27, "isEqual:", CFSTR("mdta/com.apple.hls.genre")))
            {
              if (v30)
                -[TVRCNowPlayingMetadata setGenre:](v5, "setGenre:", v30);
            }
            else if (objc_msgSend(v27, "isEqual:", CFSTR("mdta/com.apple.hls.rating-display-name")))
            {
              if (v30)
                -[TVRCNowPlayingMetadata setRatingDescription:](v5, "setRatingDescription:", v30);
            }
            else if (objc_msgSend(v27, "isEqual:", CFSTR("avkt/TVRMainContentStartTime")))
            {
              if (v32)
                -[TVRCNowPlayingMetadata setMainContentStartTime:](v5, "setMainContentStartTime:", v32);
            }
            else if (objc_msgSend(v27, "isEqual:", CFSTR("avkt/TVRProgramID")))
            {
              if (v30)
                -[TVRCNowPlayingMetadata setProgramID:](v5, "setProgramID:", v30);
            }
            else if (objc_msgSend(v27, "isEqual:", CFSTR("avkt/TVRTimeOffset")))
            {
              if (v32)
                -[TVRCNowPlayingMetadata setTimeOffset:](v5, "setTimeOffset:", v32);
            }
            else if (objc_msgSend(v27, "isEqual:", CFSTR("avkt/TVRCurrentlyPlayingSongID")))
            {
              if (v30)
              {
                -[TVRCNowPlayingMetadata setCurrentlyPlayingSongID:](v5, "setCurrentlyPlayingSongID:", v30);
              }
              else if (v32)
              {
                objc_msgSend(v32, "stringValue");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                -[TVRCNowPlayingMetadata setCurrentlyPlayingSongID:](v5, "setCurrentlyPlayingSongID:", v38);

              }
            }
            goto LABEL_24;
          }
          __50__TVRCNowPlayingMetadata_metadataFromContentItem___block_invoke(v35, v30, v32);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[TVRCNowPlayingMetadata setEpisodeNumber:](v5, "setEpisodeNumber:", v34);
        }
LABEL_23:

        goto LABEL_24;
      }
      if (v30)
      {
        -[TVRCNowPlayingMetadata setITunesStoreIdentifier:](v5, "setITunesStoreIdentifier:", v30);
        goto LABEL_24;
      }
      if (v32)
      {
        objc_msgSend(v32, "stringValue");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVRCNowPlayingMetadata setITunesStoreIdentifier:](v5, "setITunesStoreIdentifier:", v34);
        goto LABEL_23;
      }
LABEL_24:

      ++v26;
    }
    while (v24 != v26);
    v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    v24 = v39;
  }
  while (v39);
LABEL_54:

  v6 = v41;
  v4 = v42;
LABEL_55:

LABEL_57:
  return v5;
}

id __50__TVRCNowPlayingMetadata_metadataFromContentItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    if (!v4)
    {
      v8 = 0;
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "integerValue"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
LABEL_6:

  return v8;
}

+ (id)currentAudioLanguageOptionFromContentItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(v3, "currentLanguageOptions", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
          if (!objc_msgSend(v9, "type"))
          {
            objc_msgSend(v9, "languageTag");
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_12;
          }
        }
        v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)canonicalID
{
  return self->_canonicalID;
}

- (void)setCanonicalID:(id)a3
{
  objc_storeStrong((id *)&self->_canonicalID, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)genre
{
  return self->_genre;
}

- (void)setGenre:(id)a3
{
  objc_storeStrong((id *)&self->_genre, a3);
}

- (NSString)episodeTitle
{
  return self->_episodeTitle;
}

- (void)setEpisodeTitle:(id)a3
{
  objc_storeStrong((id *)&self->_episodeTitle, a3);
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
  objc_storeStrong((id *)&self->_duration, a3);
}

- (NSString)showID
{
  return self->_showID;
}

- (void)setShowID:(id)a3
{
  objc_storeStrong((id *)&self->_showID, a3);
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

- (NSString)ratingDescription
{
  return self->_ratingDescription;
}

- (void)setRatingDescription:(id)a3
{
  objc_storeStrong((id *)&self->_ratingDescription, a3);
}

- (NSString)extendedDescription
{
  return self->_extendedDescription;
}

- (void)setExtendedDescription:(id)a3
{
  objc_storeStrong((id *)&self->_extendedDescription, a3);
}

- (NSString)iTunesStoreIdentifier
{
  return self->_iTunesStoreIdentifier;
}

- (void)setITunesStoreIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_iTunesStoreIdentifier, a3);
}

- (NSURL)productPageURL
{
  return self->_productPageURL;
}

- (void)setProductPageURL:(id)a3
{
  objc_storeStrong((id *)&self->_productPageURL, a3);
}

- (NSURL)showProductPageURL
{
  return self->_showProductPageURL;
}

- (void)setShowProductPageURL:(id)a3
{
  objc_storeStrong((id *)&self->_showProductPageURL, a3);
}

- (NSNumber)mainContentStartTime
{
  return self->_mainContentStartTime;
}

- (void)setMainContentStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_mainContentStartTime, a3);
}

- (NSString)programID
{
  return self->_programID;
}

- (void)setProgramID:(id)a3
{
  objc_storeStrong((id *)&self->_programID, a3);
}

- (NSNumber)timeOffset
{
  return self->_timeOffset;
}

- (void)setTimeOffset:(id)a3
{
  objc_storeStrong((id *)&self->_timeOffset, a3);
}

- (NSString)audioLanguage
{
  return self->_audioLanguage;
}

- (void)setAudioLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_audioLanguage, a3);
}

- (NSNumber)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (NSString)currentlyPlayingSongID
{
  return self->_currentlyPlayingSongID;
}

- (void)setCurrentlyPlayingSongID:(id)a3
{
  objc_storeStrong((id *)&self->_currentlyPlayingSongID, a3);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (void)setReleaseDate:(id)a3
{
  objc_storeStrong((id *)&self->_releaseDate, a3);
}

- (BOOL)isAppleOriginal
{
  return self->_isAppleOriginal;
}

- (void)setIsAppleOriginal:(BOOL)a3
{
  self->_isAppleOriginal = a3;
}

- (unint64_t)kind
{
  return self->_kind;
}

- (void)setKind:(unint64_t)a3
{
  self->_kind = a3;
}

- (TVRCRottenTomatoesReview)rottenTomatoesReview
{
  return self->_rottenTomatoesReview;
}

- (void)setRottenTomatoesReview:(id)a3
{
  objc_storeStrong((id *)&self->_rottenTomatoesReview, a3);
}

- (NSString)imageURLTemplate
{
  return self->_imageURLTemplate;
}

- (void)setImageURLTemplate:(id)a3
{
  objc_storeStrong((id *)&self->_imageURLTemplate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageURLTemplate, 0);
  objc_storeStrong((id *)&self->_rottenTomatoesReview, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_currentlyPlayingSongID, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_audioLanguage, 0);
  objc_storeStrong((id *)&self->_timeOffset, 0);
  objc_storeStrong((id *)&self->_programID, 0);
  objc_storeStrong((id *)&self->_mainContentStartTime, 0);
  objc_storeStrong((id *)&self->_showProductPageURL, 0);
  objc_storeStrong((id *)&self->_productPageURL, 0);
  objc_storeStrong((id *)&self->_iTunesStoreIdentifier, 0);
  objc_storeStrong((id *)&self->_extendedDescription, 0);
  objc_storeStrong((id *)&self->_ratingDescription, 0);
  objc_storeStrong((id *)&self->_episodeNumber, 0);
  objc_storeStrong((id *)&self->_seasonNumber, 0);
  objc_storeStrong((id *)&self->_showID, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_episodeTitle, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_canonicalID, 0);
}

@end
