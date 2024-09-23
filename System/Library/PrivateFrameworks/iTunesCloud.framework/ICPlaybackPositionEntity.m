@implementation ICPlaybackPositionEntity

+ (id)ubiquitousIdentifierWithUniqueStoreID:(int64_t)a3
{
  return +[ICPlaybackPositionEntity keyValueStoreItemIdentifierForUniqueStoreID:itemTitle:albumName:itemArtistName:feedURL:feedGUID:](ICPlaybackPositionEntity, "keyValueStoreItemIdentifierForUniqueStoreID:itemTitle:albumName:itemArtistName:feedURL:feedGUID:", a3, 0, 0, 0, 0, 0);
}

+ (id)keyValueStoreItemIdentifierForUniqueStoreID:(int64_t)a3 itemTitle:(id)a4 albumName:(id)a5 itemArtistName:(id)a6 feedURL:(id)a7 feedGUID:(id)a8
{
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  id v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  const __CFString *v27;
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
  __CFString *v47;
  void *v48;
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[3];
  _QWORD v52[2];
  _QWORD v53[4];
  _QWORD v54[6];

  v54[4] = *MEMORY[0x1E0C80C00];
  v13 = (__CFString *)a4;
  v14 = (__CFString *)a5;
  v15 = (__CFString *)a6;
  v16 = a7;
  v17 = (__CFString *)a8;
  v18 = v17;
  if (!a3 || v16 || v17)
  {
    getML3TrackPropertyTitle();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v20;
    v47 = v13;
    if (v13)
      v21 = v13;
    else
      v21 = &stru_1E4391778;
    v54[0] = v21;
    getML3TrackPropertyAlbum();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v53[1] = v22;
    if (v14)
      v23 = v14;
    else
      v23 = &stru_1E4391778;
    v54[1] = v23;
    getML3TrackPropertyArtist();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v53[2] = v24;
    if (v15)
      v25 = v15;
    else
      v25 = &stru_1E4391778;
    v54[2] = v25;
    getML3TrackPropertyPodcastExternalGUID();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v53[3] = v26;
    if (v18)
      v27 = v18;
    else
      v27 = &stru_1E4391778;
    v54[3] = v27;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v28, "mutableCopy");

    if (v16)
    {
      getML3TrackPropertyFeedURL();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v16, v30);

    }
    getML3TrackPropertyFeedURL();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v31;
    getML3TrackPropertyPodcastExternalGUID();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v52[1] = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    ICPlaybackPositionEntityIdentifierForProperties(v33, v29);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      getML3TrackPropertyTitle();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v51[0] = v34;
      getML3TrackPropertyArtist();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v51[1] = v35;
      getML3TrackPropertyAlbum();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v51[2] = v36;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 3);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      ICPlaybackPositionEntityIdentifierForProperties(v37, v29);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
        getML3TrackPropertyTitle();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v50[0] = v38;
        getML3TrackPropertyAlbum();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v50[1] = v39;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        ICPlaybackPositionEntityIdentifierForProperties(v40, v29);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19)
        {
          getML3TrackPropertyTitle();
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v49[0] = v41;
          getML3TrackPropertyArtist();
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v49[1] = v42;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          ICPlaybackPositionEntityIdentifierForProperties(v43, v29);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v19)
          {
            getML3TrackPropertyTitle();
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = v44;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            ICPlaybackPositionEntityIdentifierForProperties(v45, v29);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

          }
        }
      }
    }

    v13 = v47;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

- (ICPlaybackPositionEntity)initWithDomain:(id)a3 playbackPositionKey:(id)a4 persistentIdentifier:(id)a5
{
  id v9;
  id v10;
  ICPlaybackPositionEntity *v11;
  ICPlaybackPositionEntity *v12;

  v9 = a4;
  v10 = a5;
  v11 = -[ICPlaybackPositionEntity initWithDomain:](self, "initWithDomain:", a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_playbackPositionKey, a4);
    objc_storeStrong((id *)&v12->_itemPersistentIdentifier, a5);
  }

  return v12;
}

- (ICPlaybackPositionEntity)initWithDomain:(id)a3
{
  id v5;
  ICPlaybackPositionEntity *v6;
  ICPlaybackPositionEntity *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICPlaybackPositionEntity;
  v6 = -[ICPlaybackPositionEntity init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_playbackPositionDomain, a3);

  return v7;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<ICPlaybackPositionEntity %p domain=%@ playbackPositionID=%@ itemPID=%@ libraryUID=%@ bookmarkTime=%@ bookmarkTimestamp=%@ playCount=%@ hasBeenPlayed=%@>"), self, self->_playbackPositionDomain, self->_playbackPositionKey, self->_itemPersistentIdentifier, self->_libraryIdentifier, self->_bookmarkTime, self->_bookmarkTimestamp, self->_userPlayCount, self->_hasBeenPlayed);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *playbackPositionDomain;
  void *v6;
  NSString *playbackPositionKey;
  void *v8;
  NSString *libraryIdentifier;
  void *v10;
  NSNumber *itemPersistentIdentifier;
  void *v12;
  NSNumber *bookmarkTimestamp;
  void *v14;
  NSNumber *bookmarkTime;
  void *v16;
  NSNumber *userPlayCount;
  void *v18;
  NSNumber *hasBeenPlayed;
  void *v20;
  char v21;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    playbackPositionDomain = self->_playbackPositionDomain;
    objc_msgSend(v4, "playbackPositionDomain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqual:](playbackPositionDomain, "isEqual:", v6))
    {
      playbackPositionKey = self->_playbackPositionKey;
      objc_msgSend(v4, "playbackPositionKey");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqualToString:](playbackPositionKey, "isEqualToString:", v8))
      {
        libraryIdentifier = self->_libraryIdentifier;
        objc_msgSend(v4, "libraryIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSString isEqualToString:](libraryIdentifier, "isEqualToString:", v10))
        {
          itemPersistentIdentifier = self->_itemPersistentIdentifier;
          objc_msgSend(v4, "itemPersistentIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[NSNumber isEqual:](itemPersistentIdentifier, "isEqual:", v12))
          {
            bookmarkTimestamp = self->_bookmarkTimestamp;
            objc_msgSend(v4, "bookmarkTimestamp");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[NSNumber isEqual:](bookmarkTimestamp, "isEqual:", v14))
            {
              bookmarkTime = self->_bookmarkTime;
              objc_msgSend(v4, "bookmarkTime");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (-[NSNumber isEqual:](bookmarkTime, "isEqual:", v16))
              {
                userPlayCount = self->_userPlayCount;
                objc_msgSend(v4, "userPlayCount");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                if (-[NSNumber isEqual:](userPlayCount, "isEqual:", v18))
                {
                  hasBeenPlayed = self->_hasBeenPlayed;
                  objc_msgSend(v4, "hasBeenPlayed");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  v21 = -[NSNumber isEqual:](hasBeenPlayed, "isEqual:", v20);

                }
                else
                {
                  v21 = 0;
                }

              }
              else
              {
                v21 = 0;
              }

            }
            else
            {
              v21 = 0;
            }

          }
          else
          {
            v21 = 0;
          }

        }
        else
        {
          v21 = 0;
        }

      }
      else
      {
        v21 = 0;
      }

    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_class *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSString *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSString *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSString *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSNumber *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSNumber *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSNumber *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSNumber *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  NSNumber *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t data;

  v3 = MSVHasherSharedSeed();
  v5 = v4;
  v6 = v3 ^ 0x736F6D6570736575;
  v7 = v4 ^ 0x646F72616E646F6DLL;
  v8 = v3 ^ 0x6C7967656E657261;
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  v12 = v5 ^ 0x7465646279746573 ^ v11;
  v13 = (v6 + v7) ^ __ROR8__(v7, 51);
  v14 = v8 + v12;
  v15 = (v8 + v12) ^ __ROR8__(v12, 48);
  v16 = v15 + __ROR8__(v6 + v7, 32);
  v127 = __ROR8__(v14 + v13, 32);
  v136 = v16 ^ __ROR8__(v15, 43);
  v17 = v16 ^ v11;
  v118 = (v14 + v13) ^ __ROR8__(v13, 47);

  v18 = self->_playbackPositionDomain;
  v19 = -[NSString hash](v18, "hash");
  v20 = (v17 + v118) ^ __ROR8__(v118, 51);
  v21 = v127 + (v136 ^ v19);
  v22 = __ROR8__(v136 ^ v19, 48);
  v23 = (v21 ^ v22) + __ROR8__(v17 + v118, 32);
  v24 = v23 ^ __ROR8__(v21 ^ v22, 43);
  v25 = v21 + v20;
  v128 = __ROR8__(v25, 32);
  v137 = v24;
  v110 = v23 ^ v19;
  v119 = v25 ^ __ROR8__(v20, 47);

  v26 = self->_playbackPositionKey;
  data = -[NSString hash](v26, "hash");
  v27 = (v110 + v119) ^ __ROR8__(v119, 51);
  v28 = v128 + (v137 ^ data);
  v29 = __ROR8__(v137 ^ data, 48);
  v30 = (v28 ^ v29) + __ROR8__(v110 + v119, 32);
  v31 = v30 ^ __ROR8__(v28 ^ v29, 43);
  v32 = v28 + v27;
  v129 = __ROR8__(v32, 32);
  v138 = v31;
  v111 = v30 ^ data;
  v120 = v32 ^ __ROR8__(v27, 47);

  v33 = self->_libraryIdentifier;
  v34 = -[NSString hash](v33, "hash");
  v35 = (v111 + v120) ^ __ROR8__(v120, 51);
  v36 = v129 + (v138 ^ v34);
  v37 = __ROR8__(v138 ^ v34, 48);
  v38 = (v36 ^ v37) + __ROR8__(v111 + v120, 32);
  v39 = v38 ^ __ROR8__(v36 ^ v37, 43);
  v40 = v36 + v35;
  v130 = __ROR8__(v40, 32);
  v139 = v39;
  v112 = v38 ^ v34;
  v121 = v40 ^ __ROR8__(v35, 47);

  v41 = self->_itemPersistentIdentifier;
  v42 = -[NSNumber hash](v41, "hash");
  v43 = (v112 + v121) ^ __ROR8__(v121, 51);
  v44 = v130 + (v139 ^ v42);
  v45 = __ROR8__(v139 ^ v42, 48);
  v46 = (v44 ^ v45) + __ROR8__(v112 + v121, 32);
  v47 = v46 ^ __ROR8__(v44 ^ v45, 43);
  v48 = v44 + v43;
  v131 = __ROR8__(v48, 32);
  v140 = v47;
  v113 = v46 ^ v42;
  v122 = v48 ^ __ROR8__(v43, 47);

  v49 = self->_bookmarkTimestamp;
  v50 = -[NSNumber hash](v49, "hash");
  v51 = (v113 + v122) ^ __ROR8__(v122, 51);
  v52 = v131 + (v140 ^ v50);
  v53 = __ROR8__(v140 ^ v50, 48);
  v54 = (v52 ^ v53) + __ROR8__(v113 + v122, 32);
  v55 = v54 ^ __ROR8__(v52 ^ v53, 43);
  v56 = v52 + v51;
  v132 = __ROR8__(v56, 32);
  v141 = v55;
  v114 = v54 ^ v50;
  v123 = v56 ^ __ROR8__(v51, 47);

  v57 = self->_bookmarkTime;
  v58 = -[NSNumber hash](v57, "hash");
  v59 = (v114 + v123) ^ __ROR8__(v123, 51);
  v60 = v132 + (v141 ^ v58);
  v61 = __ROR8__(v141 ^ v58, 48);
  v62 = (v60 ^ v61) + __ROR8__(v114 + v123, 32);
  v63 = v62 ^ __ROR8__(v60 ^ v61, 43);
  v64 = v60 + v59;
  v133 = __ROR8__(v64, 32);
  v142 = v63;
  v115 = v62 ^ v58;
  v124 = v64 ^ __ROR8__(v59, 47);

  v65 = self->_userPlayCount;
  v66 = -[NSNumber hash](v65, "hash");
  v67 = (v115 + v124) ^ __ROR8__(v124, 51);
  v68 = v133 + (v142 ^ v66);
  v69 = __ROR8__(v142 ^ v66, 48);
  v70 = (v68 ^ v69) + __ROR8__(v115 + v124, 32);
  v71 = v70 ^ __ROR8__(v68 ^ v69, 43);
  v72 = v68 + v67;
  v134 = __ROR8__(v72, 32);
  v143 = v71;
  v116 = v70 ^ v66;
  v125 = v72 ^ __ROR8__(v67, 47);

  v73 = self->_hasBeenPlayed;
  v74 = -[NSNumber hash](v73, "hash");
  v75 = (v116 + v125) ^ __ROR8__(v125, 51);
  v76 = v134 + (v143 ^ v74);
  v77 = __ROR8__(v143 ^ v74, 48);
  v78 = (v76 ^ v77) + __ROR8__(v116 + v125, 32);
  v79 = v78 ^ __ROR8__(v76 ^ v77, 43);
  v80 = v76 + v75;
  v135 = __ROR8__(v80, 32);
  v144 = v79;
  v117 = v78 ^ v74;
  v126 = v80 ^ __ROR8__(v75, 47);

  v81 = (v117 + v126) ^ __ROR8__(v126, 51);
  v82 = v135 + (v144 ^ 0x4800000000000000);
  v83 = __ROR8__(v144 ^ 0x4800000000000000, 48);
  v84 = (v82 ^ v83) + __ROR8__(v117 + v126, 32);
  v85 = v84 ^ __ROR8__(v82 ^ v83, 43);
  v86 = v82 + v81;
  v87 = v86 ^ __ROR8__(v81, 47);
  v88 = (v84 ^ 0x4800000000000000) + v87;
  v89 = v88 ^ __ROR8__(v87, 51);
  v90 = (__ROR8__(v86, 32) ^ 0xFFLL) + v85;
  v91 = __ROR8__(v85, 48);
  v92 = __ROR8__(v88, 32) + (v90 ^ v91);
  v93 = v92 ^ __ROR8__(v90 ^ v91, 43);
  v94 = v89 + v90;
  v95 = v94 ^ __ROR8__(v89, 47);
  v96 = v95 + v92;
  v97 = v96 ^ __ROR8__(v95, 51);
  v98 = __ROR8__(v94, 32) + v93;
  v99 = __ROR8__(v93, 48);
  v100 = __ROR8__(v96, 32) + (v98 ^ v99);
  v101 = v100 ^ __ROR8__(v98 ^ v99, 43);
  v102 = v97 + v98;
  v103 = v102 ^ __ROR8__(v97, 47);
  v104 = v103 + v100;
  v105 = v104 ^ __ROR8__(v103, 51);
  v106 = __ROR8__(v102, 32) + v101;
  v107 = __ROR8__(v101, 48);
  v108 = __ROR8__(v104, 32) + (v106 ^ v107);
  return (v105 + v106) ^ __ROR8__(v105, 47) ^ v108 ^ __ROR8__(v105 + v106, 32) ^ v108 ^ __ROR8__(v106 ^ v107, 43);
}

- (void)encodeWithCoder:(id)a3
{
  NSString *playbackPositionDomain;
  id v5;

  playbackPositionDomain = self->_playbackPositionDomain;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", playbackPositionDomain, CFSTR("domain"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_playbackPositionKey, CFSTR("key"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_libraryIdentifier, CFSTR("libraryUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemPersistentIdentifier, CFSTR("itemPersistenIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bookmarkTimestamp, CFSTR("bookmarkTimestamp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bookmarkTime, CFSTR("bookmarkTime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userPlayCount, CFSTR("playCount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_hasBeenPlayed, CFSTR("hasBeenPlayed"));

}

- (ICPlaybackPositionEntity)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ICPlaybackPositionEntity *v6;
  uint64_t v7;
  NSString *playbackPositionKey;
  uint64_t v9;
  NSString *libraryIdentifier;
  uint64_t v11;
  NSNumber *itemPersistentIdentifier;
  uint64_t v13;
  NSNumber *bookmarkTimestamp;
  uint64_t v15;
  NSNumber *bookmarkTime;
  uint64_t v17;
  NSNumber *userPlayCount;
  uint64_t v19;
  NSNumber *hasBeenPlayed;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("domain"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ICPlaybackPositionEntity initWithDomain:](self, "initWithDomain:", v5);
  if (v6)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("key"));
    v7 = objc_claimAutoreleasedReturnValue();
    playbackPositionKey = v6->_playbackPositionKey;
    v6->_playbackPositionKey = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("libraryUID"));
    v9 = objc_claimAutoreleasedReturnValue();
    libraryIdentifier = v6->_libraryIdentifier;
    v6->_libraryIdentifier = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itemPersistenIdentifier"));
    v11 = objc_claimAutoreleasedReturnValue();
    itemPersistentIdentifier = v6->_itemPersistentIdentifier;
    v6->_itemPersistentIdentifier = (NSNumber *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bookmarkTimestamp"));
    v13 = objc_claimAutoreleasedReturnValue();
    bookmarkTimestamp = v6->_bookmarkTimestamp;
    v6->_bookmarkTimestamp = (NSNumber *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bookmarkTime"));
    v15 = objc_claimAutoreleasedReturnValue();
    bookmarkTime = v6->_bookmarkTime;
    v6->_bookmarkTime = (NSNumber *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("playCount"));
    v17 = objc_claimAutoreleasedReturnValue();
    userPlayCount = v6->_userPlayCount;
    v6->_userPlayCount = (NSNumber *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hasBeenPlayed"));
    v19 = objc_claimAutoreleasedReturnValue();
    hasBeenPlayed = v6->_hasBeenPlayed;
    v6->_hasBeenPlayed = (NSNumber *)v19;

  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithDomain:", self->_playbackPositionDomain);
  objc_msgSend(v4, "setPlaybackPositionKey:", self->_playbackPositionKey);
  objc_msgSend(v4, "setLibraryIdentifier:", self->_libraryIdentifier);
  objc_msgSend(v4, "setItemPersistentIdentifier:", self->_itemPersistentIdentifier);
  objc_msgSend(v4, "setBookmarkTimestamp:", self->_bookmarkTimestamp);
  objc_msgSend(v4, "setBookmarkTime:", self->_bookmarkTime);
  objc_msgSend(v4, "setUserPlayCount:", self->_userPlayCount);
  objc_msgSend(v4, "setHasBeenPlayed:", self->_hasBeenPlayed);
  return v4;
}

- (NSString)playbackPositionDomain
{
  return self->_playbackPositionDomain;
}

- (NSString)playbackPositionKey
{
  return self->_playbackPositionKey;
}

- (void)setPlaybackPositionKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)libraryIdentifier
{
  return self->_libraryIdentifier;
}

- (void)setLibraryIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)itemPersistentIdentifier
{
  return self->_itemPersistentIdentifier;
}

- (void)setItemPersistentIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)bookmarkTimestamp
{
  return self->_bookmarkTimestamp;
}

- (void)setBookmarkTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)bookmarkTime
{
  return self->_bookmarkTime;
}

- (void)setBookmarkTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)userPlayCount
{
  return self->_userPlayCount;
}

- (void)setUserPlayCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)hasBeenPlayed
{
  return self->_hasBeenPlayed;
}

- (void)setHasBeenPlayed:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hasBeenPlayed, 0);
  objc_storeStrong((id *)&self->_userPlayCount, 0);
  objc_storeStrong((id *)&self->_bookmarkTime, 0);
  objc_storeStrong((id *)&self->_bookmarkTimestamp, 0);
  objc_storeStrong((id *)&self->_itemPersistentIdentifier, 0);
  objc_storeStrong((id *)&self->_libraryIdentifier, 0);
  objc_storeStrong((id *)&self->_playbackPositionKey, 0);
  objc_storeStrong((id *)&self->_playbackPositionDomain, 0);
}

+ (id)ubiquitousIdentifierWithItemTitle:(id)a3 albumName:(id)a4 itemArtistName:(id)a5
{
  return +[ICPlaybackPositionEntity keyValueStoreItemIdentifierForUniqueStoreID:itemTitle:albumName:itemArtistName:feedURL:feedGUID:](ICPlaybackPositionEntity, "keyValueStoreItemIdentifierForUniqueStoreID:itemTitle:albumName:itemArtistName:feedURL:feedGUID:", 0, a3, a4, a5, 0, 0);
}

+ (id)ubiquitousIdentifierWithPodcastFeedURL:(id)a3 feedGUID:(id)a4
{
  return +[ICPlaybackPositionEntity keyValueStoreItemIdentifierForUniqueStoreID:itemTitle:albumName:itemArtistName:feedURL:feedGUID:](ICPlaybackPositionEntity, "keyValueStoreItemIdentifierForUniqueStoreID:itemTitle:albumName:itemArtistName:feedURL:feedGUID:", 0, 0, 0, 0, a3, a4);
}

+ (id)ubiquitousIdentifierWithiTunesUFeedURL:(id)a3 feedGUID:(id)a4
{
  return +[ICPlaybackPositionEntity keyValueStoreItemIdentifierForUniqueStoreID:itemTitle:albumName:itemArtistName:feedURL:feedGUID:](ICPlaybackPositionEntity, "keyValueStoreItemIdentifierForUniqueStoreID:itemTitle:albumName:itemArtistName:feedURL:feedGUID:", 0, 0, 0, 0, a3, a4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
