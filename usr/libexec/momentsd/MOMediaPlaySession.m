@implementation MOMediaPlaySession

- (MOMediaPlaySession)initWithTitle:(id)a3 album:(id)a4 bundleId:(id)a5 productId:(id)a6 genre:(id)a7 mediaType:(id)a8 artist:(id)a9 startDate:(id)a10 endDate:(id)a11 duration:(unsigned int)a12 isRemote:(BOOL)a13 deviceSource:(id)a14 bgColor:(id)a15
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id os_log;
  NSObject *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  MOMediaPlaySession *v34;
  MOMediaPlaySession *v35;
  id obj;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v48;
  id v49;
  id v50;
  id v51;
  objc_super v52;

  obj = a3;
  v50 = a3;
  v39 = a4;
  v49 = a4;
  v40 = a5;
  v21 = a5;
  v41 = a6;
  v22 = a6;
  v42 = a7;
  v23 = a7;
  v44 = a8;
  v24 = a8;
  v43 = a9;
  v51 = a9;
  v45 = a10;
  v25 = a10;
  v46 = a11;
  v26 = a11;
  v38 = a14;
  v48 = a14;
  v27 = a15;
  if (v25)
  {
    if (v26)
      goto LABEL_10;
    goto LABEL_7;
  }
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  v29 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    -[MOMediaPlaySession initWithTitle:album:bundleId:productId:genre:mediaType:artist:startDate:endDate:duration:isRemote:deviceSource:bgColor:].cold.2();

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOMediaPlaySession.m"), 33, CFSTR("Invalid parameter not satisfying: startDate != nil (in %s:%d)"), "-[MOMediaPlaySession initWithTitle:album:bundleId:productId:genre:mediaType:artist:startDate:endDate:duration:isRemote:deviceSource:bgColor:]", 33, obj, a14, a4, v40, v41, v42, a9, v44, a10,
    a11);

  if (!v26)
  {
LABEL_7:
    v31 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      -[MOMediaPlaySession initWithTitle:album:bundleId:productId:genre:mediaType:artist:startDate:endDate:duration:isRemote:deviceSource:bgColor:].cold.1();

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOMediaPlaySession.m"), 34, CFSTR("Invalid parameter not satisfying: endDate != nil (in %s:%d)"), "-[MOMediaPlaySession initWithTitle:album:bundleId:productId:genre:mediaType:artist:startDate:endDate:duration:isRemote:deviceSource:bgColor:]", 34);

  }
LABEL_10:
  v52.receiver = self;
  v52.super_class = (Class)MOMediaPlaySession;
  v34 = -[MOMediaPlaySession init](&v52, "init");
  v35 = v34;
  if (v34)
  {
    objc_storeStrong((id *)&v34->_title, obj);
    objc_storeStrong((id *)&v35->_album, v39);
    objc_storeStrong((id *)&v35->_bundleId, v40);
    objc_storeStrong((id *)&v35->_productId, v41);
    objc_storeStrong((id *)&v35->_genre, v42);
    objc_storeStrong((id *)&v35->_mediaType, v44);
    objc_storeStrong((id *)&v35->_artist, v43);
    objc_storeStrong((id *)&v35->_startDate, v45);
    objc_storeStrong((id *)&v35->_endDate, v46);
    v35->_duration = a12;
    v35->_isRemote = a13;
    objc_storeStrong((id *)&v35->_deviceSource, v38);
    objc_storeStrong((id *)&v35->_bgColor, a15);
  }

  return v35;
}

- (BOOL)isEqualToMediaPlaySession:(id)a3
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
  NSDate *startDate;
  void *v52;
  unsigned int v53;
  int v54;
  void *v55;
  int v56;
  NSDate *endDate;
  void *v58;
  unsigned __int8 v59;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_29;
  v6 = self->_title != 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_29;
  title = self->_title;
  if (title)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
    v11 = -[NSString isEqual:](title, "isEqual:", v10);

    if (!v11)
      goto LABEL_29;
  }
  v12 = self->_album != 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "album"));
  v14 = v13 == 0;

  if (v12 == v14)
    goto LABEL_29;
  album = self->_album;
  if (album)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "album"));
    v17 = -[NSString isEqual:](album, "isEqual:", v16);

    if (!v17)
      goto LABEL_29;
  }
  v18 = self->_bundleId != 0;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleId"));
  v20 = v19 == 0;

  if (v18 == v20)
    goto LABEL_29;
  bundleId = self->_bundleId;
  if (bundleId)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleId"));
    v23 = -[NSString isEqual:](bundleId, "isEqual:", v22);

    if (!v23)
      goto LABEL_29;
  }
  v24 = self->_productId != 0;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "productId"));
  v26 = v25 == 0;

  if (v24 == v26)
    goto LABEL_29;
  productId = self->_productId;
  if (productId)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "productId"));
    v29 = -[NSString isEqual:](productId, "isEqual:", v28);

    if (!v29)
      goto LABEL_29;
  }
  v30 = self->_genre != 0;
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "genre"));
  v32 = v31 == 0;

  if (v30 == v32)
    goto LABEL_29;
  genre = self->_genre;
  if (genre)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "genre"));
    v35 = -[NSString isEqual:](genre, "isEqual:", v34);

    if (!v35)
      goto LABEL_29;
  }
  v36 = self->_mediaType != 0;
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mediaType"));
  v38 = v37 == 0;

  if (v36 == v38)
    goto LABEL_29;
  mediaType = self->_mediaType;
  if (mediaType)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mediaType"));
    v41 = -[NSString isEqual:](mediaType, "isEqual:", v40);

    if (!v41)
      goto LABEL_29;
  }
  v42 = self->_artist != 0;
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "artist"));
  v44 = v43 == 0;

  if (v42 == v44)
    goto LABEL_29;
  artist = self->_artist;
  if (artist)
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "artist"));
    v47 = -[NSString isEqual:](artist, "isEqual:", v46);

    if (!v47)
      goto LABEL_29;
  }
  v48 = self->_startDate != 0;
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startDate"));
  v50 = v49 == 0;

  if (v48 == v50)
    goto LABEL_29;
  startDate = self->_startDate;
  if (startDate)
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startDate"));
    v53 = -[NSDate isEqual:](startDate, "isEqual:", v52);

    if (!v53)
      goto LABEL_29;
  }
  v54 = self->_endDate != 0;
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "endDate"));
  v56 = v55 == 0;

  if (v54 == v56)
  {
LABEL_29:
    v59 = 0;
  }
  else
  {
    endDate = self->_endDate;
    if (endDate)
    {
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "endDate"));
      v59 = -[NSDate isEqual:](endDate, "isEqual:", v58);

    }
    else
    {
      v59 = 1;
    }
  }

  return v59;
}

- (BOOL)isEqual:(id)a3
{
  MOMediaPlaySession *v4;
  uint64_t v5;
  MOMediaPlaySession *v6;
  uint64_t v7;
  BOOL v8;

  v4 = (MOMediaPlaySession *)a3;
  v6 = v4;
  if (v4 == self)
  {
    v8 = 1;
  }
  else if (v4 && (v7 = objc_opt_class(self, v5), (objc_opt_isKindOfClass(v6, v7) & 1) != 0))
  {
    v8 = -[MOMediaPlaySession isEqualToMediaPlaySession:](self, "isEqualToMediaPlaySession:", v6);
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
  int64_t v10;

  v3 = -[NSString hash](self->_title, "hash");
  v4 = (char *)-[NSString hash](self->_album, "hash") + 32 * v3 - v3;
  v5 = (_BYTE *)-[NSString hash](self->_bundleId, "hash") - v4 + 32 * (_QWORD)v4;
  v6 = -[NSString hash](self->_productId, "hash") + 32 * v5 - v5;
  v7 = -[NSString hash](self->_genre, "hash") + 32 * v6 - v6;
  v8 = -[NSString hash](self->_mediaType, "hash") + 32 * v7 - v7;
  v9 = -[NSString hash](self->_artist, "hash") + 32 * v8 - v8;
  v10 = (int64_t)-[NSDate hash](self->_startDate, "hash") + 32 * v9 - v9;
  return (unint64_t)-[NSDate hash](self->_endDate, "hash") + 32 * v10 - v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MOMediaPlaySession)initWithCoder:(id)a3
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
  MOMediaPlaySession *v21;
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
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  objc_class *v50;
  NSString *v51;
  uint64_t v52;
  objc_class *v53;
  NSString *v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  objc_class *v62;
  NSString *v63;
  uint64_t v64;
  objc_class *v65;
  NSString *v66;
  id v67;
  void *v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  objc_class *v73;
  NSString *v74;
  uint64_t v75;
  uint64_t v76;
  objc_class *v77;
  NSString *v78;
  id v79;
  void *v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  objc_class *v87;
  NSString *v88;
  uint64_t v89;
  uint64_t v90;
  objc_class *v91;
  NSString *v92;
  id v93;
  void *v95;
  id v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t isKindOfClass;
  uint64_t v101;
  objc_class *v102;
  void *v103;
  uint64_t v104;
  NSString *v105;
  uint64_t v106;
  uint64_t v107;
  objc_class *v108;
  NSString *v109;
  void *v110;
  id v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  id v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  objc_class *v119;
  NSString *v120;
  uint64_t v121;
  objc_class *v122;
  NSString *v123;
  void *v124;
  id v125;
  objc_class *v126;
  NSString *v127;
  uint64_t v128;
  uint64_t v129;
  objc_class *v130;
  NSString *v131;
  void *v132;
  id v133;
  void *v134;
  void *v135;
  id v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  objc_class *v140;
  NSString *v141;
  uint64_t v142;
  objc_class *v143;
  NSString *v144;
  void *v145;
  id v146;
  void *v147;
  uint64_t v148;
  id v149;
  unsigned __int8 v150;
  id v151;
  void *v152;
  unsigned int v153;
  id v154;
  void *v155;
  uint64_t v156;
  MOMediaPlaySession *v157;
  uint64_t v158;
  id v159;
  NSErrorUserInfoKey v160;
  id v161;
  NSErrorUserInfoKey v162;
  id v163;
  NSErrorUserInfoKey v164;
  const __CFString *v165;
  NSErrorUserInfoKey v166;
  id v167;
  NSErrorUserInfoKey v168;
  id v169;
  NSErrorUserInfoKey v170;
  id v171;
  NSErrorUserInfoKey v172;
  id v173;
  NSErrorUserInfoKey v174;
  id v175;
  NSErrorUserInfoKey v176;
  id v177;
  NSErrorUserInfoKey v178;
  id v179;
  NSErrorUserInfoKey v180;
  id v181;
  NSErrorUserInfoKey v182;
  id v183;

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
      v18 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Unarchived unexpected class for MOMediaPlaySession key \"title\" (expected %@, decoded %@)"), v13, v17, 0);
      v182 = NSLocalizedDescriptionKey;
      v183 = v18;
      v19 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v183, &v182, 1));
      v20 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("MOMediaPlaySessionOCNTErrorDomain"), 3, v19);
      objc_msgSend(v4, "failWithError:", v20);
LABEL_4:
      v21 = 0;
LABEL_43:

      goto LABEL_44;
    }
LABEL_7:
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
        v19 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Unarchived unexpected class for MOMediaPlaySession key \"album\" (expected %@, decoded %@)"), v17, v18, 0);
        v180 = NSLocalizedDescriptionKey;
        v181 = v19;
        v20 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v181, &v180, 1));
        v32 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("MOMediaPlaySessionOCNTErrorDomain"), 3, v20);
        objc_msgSend(v4, "failWithError:", v32);
        v21 = 0;
LABEL_42:

        goto LABEL_43;
      }
    }
    else
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));

      if (v33)
      {
        v21 = 0;
LABEL_47:

        goto LABEL_48;
      }
    }
    v34 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v26), CFSTR("bundleId"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v34);
    if (v17)
    {
      v36 = objc_opt_class(NSString, v35);
      if ((objc_opt_isKindOfClass(v17, v36) & 1) == 0)
      {
        v38 = (objc_class *)objc_opt_class(NSString, v37);
        v39 = NSStringFromClass(v38);
        v18 = (id)objc_claimAutoreleasedReturnValue(v39);
        v41 = (objc_class *)objc_opt_class(v17, v40);
        v42 = NSStringFromClass(v41);
        v19 = (id)objc_claimAutoreleasedReturnValue(v42);
        v20 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Unarchived unexpected class for MOMediaPlaySession key \"bundleId\" (expected %@, decoded %@)"), v18, v19, 0);
        v178 = NSLocalizedDescriptionKey;
        v179 = v20;
        v32 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v179, &v178, 1));
        v43 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("MOMediaPlaySessionOCNTErrorDomain"), 3, v32);
        objc_msgSend(v4, "failWithError:", v43);
        v44 = v43;
        v21 = 0;
LABEL_41:

        goto LABEL_42;
      }
    }
    else
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));

      if (v45)
      {
        v21 = 0;
LABEL_46:

        goto LABEL_47;
      }
    }
    v46 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v37), CFSTR("productId"));
    v18 = (id)objc_claimAutoreleasedReturnValue(v46);
    if (v18)
    {
      v48 = objc_opt_class(NSString, v47);
      if ((objc_opt_isKindOfClass(v18, v48) & 1) == 0)
      {
        v50 = (objc_class *)objc_opt_class(NSString, v49);
        v51 = NSStringFromClass(v50);
        v19 = (id)objc_claimAutoreleasedReturnValue(v51);
        v53 = (objc_class *)objc_opt_class(v18, v52);
        v54 = NSStringFromClass(v53);
        v20 = (id)objc_claimAutoreleasedReturnValue(v54);
        v32 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Unarchived unexpected class for MOMediaPlaySession key \"productId\" (expected %@, decoded %@)"), v19, v20, 0);
        v176 = NSLocalizedDescriptionKey;
        v177 = v32;
        v159 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v177, &v176, 1));
        v55 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("MOMediaPlaySessionOCNTErrorDomain"), 3, v159);
        objc_msgSend(v4, "failWithError:", v55);
        v56 = v55;
        v21 = 0;
LABEL_39:

LABEL_40:
        v44 = v159;
        goto LABEL_41;
      }
    }
    else
    {
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));

      if (v57)
      {
        v21 = 0;
LABEL_45:

        goto LABEL_46;
      }
    }
    v58 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v49), CFSTR("genre"));
    v19 = (id)objc_claimAutoreleasedReturnValue(v58);
    if (v19)
    {
      v60 = objc_opt_class(NSString, v59);
      if ((objc_opt_isKindOfClass(v19, v60) & 1) == 0)
      {
        v157 = self;
        v62 = (objc_class *)objc_opt_class(NSString, v61);
        v63 = NSStringFromClass(v62);
        v20 = (id)objc_claimAutoreleasedReturnValue(v63);
        v65 = (objc_class *)objc_opt_class(v19, v64);
        v66 = NSStringFromClass(v65);
        v32 = (id)objc_claimAutoreleasedReturnValue(v66);
        v174 = NSLocalizedDescriptionKey;
        v175 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Unarchived unexpected class for MOMediaPlaySession key \"genre\" (expected %@, decoded %@)"), v20, v32, 0);
        v159 = v175;
        v158 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v175, &v174, 1));
        v67 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("MOMediaPlaySessionOCNTErrorDomain"), 3, v158);
        objc_msgSend(v4, "failWithError:", v67);
        v21 = 0;
LABEL_37:

LABEL_38:
        self = v157;
        v56 = (void *)v158;
        goto LABEL_39;
      }
    }
    else
    {
      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));

      if (v68)
      {
        v21 = 0;
LABEL_44:

        goto LABEL_45;
      }
    }
    v69 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v61), CFSTR("mediaType"));
    v20 = (id)objc_claimAutoreleasedReturnValue(v69);
    if (v20)
    {
      v71 = objc_opt_class(NSString, v70);
      if ((objc_opt_isKindOfClass(v20, v71) & 1) == 0)
      {
        v157 = self;
        v73 = (objc_class *)objc_opt_class(NSString, v72);
        v74 = NSStringFromClass(v73);
        v75 = objc_claimAutoreleasedReturnValue(v74);
        v77 = (objc_class *)objc_opt_class(v20, v76);
        v78 = NSStringFromClass(v77);
        v32 = (id)v75;
        v159 = (id)objc_claimAutoreleasedReturnValue(v78);
        v172 = NSLocalizedDescriptionKey;
        v173 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Unarchived unexpected class for MOMediaPlaySession key \"mediaType\" (expected %@, decoded %@)"), v75, v159, 0);
        v158 = (uint64_t)v173;
        v156 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v173, &v172, 1));
        v79 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("MOMediaPlaySessionOCNTErrorDomain"), 3, v156);
        objc_msgSend(v4, "failWithError:", v79);
LABEL_34:
        v21 = 0;
LABEL_35:

LABEL_36:
        v67 = (id)v156;
        goto LABEL_37;
      }
    }
    else
    {
      v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));

      if (v80)
        goto LABEL_4;
    }
    v81 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v72), CFSTR("artist"));
    v82 = objc_claimAutoreleasedReturnValue(v81);
    v155 = (void *)v82;
    if (v82)
    {
      v84 = v82;
      v85 = objc_opt_class(NSString, v83);
      if ((objc_opt_isKindOfClass(v84, v85) & 1) == 0)
      {
        v157 = self;
        v87 = (objc_class *)objc_opt_class(NSString, v86);
        v88 = NSStringFromClass(v87);
        v89 = objc_claimAutoreleasedReturnValue(v88);
        v91 = (objc_class *)objc_opt_class(v155, v90);
        v92 = NSStringFromClass(v91);
        v158 = objc_claimAutoreleasedReturnValue(v92);
        v32 = v155;
        v159 = (id)v89;
        v170 = NSLocalizedDescriptionKey;
        v171 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Unarchived unexpected class for MOMediaPlaySession key \"artist\" (expected %@, decoded %@)"), v89, v158, 0);
        v156 = (uint64_t)v171;
        v79 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v171, &v170, 1));
        v93 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("MOMediaPlaySessionOCNTErrorDomain"), 3, v79);
        objc_msgSend(v4, "failWithError:", v93);

        goto LABEL_34;
      }
    }
    else
    {
      v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));

      if (v95)
      {
        v21 = 0;
        v32 = 0;
        goto LABEL_42;
      }
    }
    v96 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate, v86), CFSTR("startDate"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(v96);
    if (!v44)
    {
      v21 = 0;
      v32 = v155;
      goto LABEL_41;
    }
    v159 = v44;
    v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));

    if (v97)
    {
      v21 = 0;
      v32 = v155;
      goto LABEL_40;
    }
    v99 = objc_opt_class(NSDate, v98);
    isKindOfClass = objc_opt_isKindOfClass(v159, v99);
    v102 = (objc_class *)objc_opt_class(NSDate, v101);
    if ((isKindOfClass & 1) == 0)
    {
      v157 = self;
      v105 = NSStringFromClass(v102);
      v106 = objc_claimAutoreleasedReturnValue(v105);
      v108 = (objc_class *)objc_opt_class(v159, v107);
      v109 = NSStringFromClass(v108);
      v156 = objc_claimAutoreleasedReturnValue(v109);
      v158 = v106;
      v79 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Unarchived unexpected class for MOMediaPlaySession key \"startDate\" (expected %@, decoded %@)"), v106, v156, 0);
      v168 = NSLocalizedDescriptionKey;
      v169 = v79;
      v110 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v169, &v168, 1));
      v111 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("MOMediaPlaySessionOCNTErrorDomain"), 3, v110);
      objc_msgSend(v4, "failWithError:", v111);

LABEL_60:
      v21 = 0;
      v32 = v155;
      goto LABEL_35;
    }
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v102, CFSTR("endDate")));
    if (!v56)
    {
      v21 = 0;
      v32 = v155;
      goto LABEL_39;
    }
    v158 = (uint64_t)v56;
    v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));

    if (v103)
    {
      v21 = 0;
      v32 = v155;
      v56 = (void *)v158;
      goto LABEL_39;
    }
    v157 = self;
    v112 = objc_opt_class(NSDate, v104);
    if ((objc_opt_isKindOfClass(v158, v112) & 1) != 0)
    {
      v153 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("duration"));
      v150 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isRemote"));
      if ((v150 & 1) == 0)
      {
        v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));

        if (v134)
        {
          v21 = 0;
          v32 = v155;
          goto LABEL_38;
        }
        if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("isRemote")) & 1) == 0)
        {
          v164 = NSLocalizedDescriptionKey;
          v165 = CFSTR("Missing serialized value for MOMediaPlay.isRemote");
          v156 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v165, &v164, 1));
          v79 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("MOMediaPlayOCNTErrorDomain"), 1, v156);
          objc_msgSend(v4, "failWithError:", v79);
          goto LABEL_60;
        }
      }
      v115 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v114), CFSTR("deviceSource"));
      v156 = objc_claimAutoreleasedReturnValue(v115);
      if (v156)
      {
        v117 = objc_opt_class(NSString, v116);
        if ((objc_opt_isKindOfClass(v156, v117) & 1) == 0)
        {
          v119 = (objc_class *)objc_opt_class(NSString, v118);
          v120 = NSStringFromClass(v119);
          v79 = (id)objc_claimAutoreleasedReturnValue(v120);
          v122 = (objc_class *)objc_opt_class(v156, v121);
          v123 = NSStringFromClass(v122);
          v154 = (id)objc_claimAutoreleasedReturnValue(v123);
          v151 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Unarchived unexpected class for MOMediaPlay key \"deviceSource\" (expected %@, decoded %@)"), v79, v154, 0);
          v162 = NSLocalizedDescriptionKey;
          v163 = v151;
          v124 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v163, &v162, 1));
          v125 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("MOMediaPlayOCNTErrorDomain"), 3, v124);
          objc_msgSend(v4, "failWithError:", v125);

LABEL_76:
          goto LABEL_60;
        }
      }
      else
      {
        v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));

        if (v135)
        {
          v21 = 0;
          v32 = v155;
          goto LABEL_36;
        }
      }
      v136 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v118), CFSTR("bkColor"));
      v79 = (id)objc_claimAutoreleasedReturnValue(v136);
      if (v79)
      {
        v138 = objc_opt_class(NSString, v137);
        if ((objc_opt_isKindOfClass(v79, v138) & 1) == 0)
        {
          v140 = (objc_class *)objc_opt_class(NSString, v139);
          v141 = NSStringFromClass(v140);
          v154 = (id)objc_claimAutoreleasedReturnValue(v141);
          v143 = (objc_class *)objc_opt_class(v79, v142);
          v144 = NSStringFromClass(v143);
          v152 = (void *)objc_claimAutoreleasedReturnValue(v144);
          v149 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Unarchived unexpected class for MOMediaPlay key \"bkColor\" (expected %@, decoded %@)"), v154, v152, 0);
          v160 = NSLocalizedDescriptionKey;
          v161 = v149;
          v145 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v161, &v160, 1));
          v146 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("MOMediaPlayOCNTErrorDomain"), 3, v145);
          objc_msgSend(v4, "failWithError:", v146);

          goto LABEL_76;
        }
      }
      else
      {
        v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));

        if (v147)
          goto LABEL_60;
      }
      v32 = v155;
      BYTE4(v148) = v150;
      LODWORD(v148) = v153;
      v21 = -[MOMediaPlaySession initWithTitle:album:bundleId:productId:genre:mediaType:artist:startDate:endDate:duration:isRemote:deviceSource:bgColor:](v157, "initWithTitle:album:bundleId:productId:genre:mediaType:artist:startDate:endDate:duration:isRemote:deviceSource:bgColor:", v8, v13, v17, v18, v19, v20, v155, v159, v158, v148, v156, v79);
      v157 = v21;
      goto LABEL_35;
    }
    v126 = (objc_class *)objc_opt_class(NSDate, v113);
    v127 = NSStringFromClass(v126);
    v128 = objc_claimAutoreleasedReturnValue(v127);
    v130 = (objc_class *)objc_opt_class(v158, v129);
    v131 = NSStringFromClass(v130);
    v79 = (id)objc_claimAutoreleasedReturnValue(v131);
    v156 = v128;
    v154 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Unarchived unexpected class for MOMediaPlaySession key \"endDate\" (expected %@, decoded %@)"), v128, v79, 0);
    v166 = NSLocalizedDescriptionKey;
    v167 = v154;
    v132 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v167, &v166, 1));
    v133 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("MOMediaPlaySessionOCNTErrorDomain"), 3, v132);
    objc_msgSend(v4, "failWithError:", v133);

    goto LABEL_76;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "error"));

  if (!v22)
    goto LABEL_7;
  v21 = 0;
LABEL_48:

  return v21;
}

+ (BOOL)isValidThirdParty:(id)a3 bundleCategory:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v12;
  unsigned __int8 v13;

  v6 = a3;
  v7 = a4;
  if (!v6 || (objc_msgSend(v6, "hasPrefix:", CFSTR("com.apple.")) & 1) != 0)
    goto LABEL_3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "describeCategory:", 6011));
  if (objc_msgSend(v7, "isEqualToString:", v9))
    goto LABEL_7;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "describeCategory:", 6009));
  if (objc_msgSend(v7, "isEqualToString:", v10))
  {

LABEL_7:
LABEL_8:
    v8 = 1;
    goto LABEL_9;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "describeCategory:", 6016));
  v13 = objc_msgSend(v7, "isEqualToString:", v12);

  if ((v13 & 1) != 0)
    goto LABEL_8;
LABEL_3:
  v8 = 0;
LABEL_9:

  return v8;
}

+ (BOOL)isValidThirdPartyEvent:(id)a3 bundleCategory:(id)a4 mediaTypeString:(id)a5 playTime:(double)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  void *v18;
  unsigned __int8 v19;
  BOOL v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10 || (objc_msgSend(v10, "hasPrefix:", CFSTR("com.apple.")) & 1) != 0)
    goto LABEL_19;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "describeCategory:", 6011));
  v14 = objc_msgSend(v11, "isEqualToString:", v13);
  if (a6 < 90.0 || (v14 & 1) == 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "describeCategory:", 6009));
    v16 = objc_msgSend(v11, "isEqualToString:", v15);
    if ((v16 & 1) != 0)
    {
      if (a6 < 600.0 || !v12)
        goto LABEL_18;
    }
    else
    {
      a1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "describeCategory:", 6016));
      v17 = objc_msgSend(v11, "isEqualToString:", a1);
      if (!v12 || a6 < 600.0 || (v17 & 1) == 0)
      {

LABEL_18:
        goto LABEL_19;
      }
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lowercaseString"));
    v19 = objc_msgSend(v18, "containsString:", CFSTR("podcast"));

    if ((v16 & 1) == 0)
    if ((v19 & 1) != 0)
      goto LABEL_16;
LABEL_19:
    v20 = 0;
    goto LABEL_20;
  }

LABEL_16:
  v20 = 1;
LABEL_20:

  return v20;
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
  NSDate *startDate;
  NSDate *endDate;
  uint64_t duration;
  NSString *deviceSource;
  id v16;

  v4 = a3;
  title = self->_title;
  v16 = v4;
  if (title)
  {
    objc_msgSend(v4, "encodeObject:forKey:", title, CFSTR("title"));
    v4 = v16;
  }
  album = self->_album;
  if (album)
  {
    objc_msgSend(v16, "encodeObject:forKey:", album, CFSTR("album"));
    v4 = v16;
  }
  bundleId = self->_bundleId;
  if (bundleId)
  {
    objc_msgSend(v16, "encodeObject:forKey:", bundleId, CFSTR("bundleId"));
    v4 = v16;
  }
  productId = self->_productId;
  if (productId)
  {
    objc_msgSend(v16, "encodeObject:forKey:", productId, CFSTR("productId"));
    v4 = v16;
  }
  genre = self->_genre;
  if (genre)
  {
    objc_msgSend(v16, "encodeObject:forKey:", genre, CFSTR("genre"));
    v4 = v16;
  }
  mediaType = self->_mediaType;
  if (mediaType)
  {
    objc_msgSend(v16, "encodeObject:forKey:", mediaType, CFSTR("mediaType"));
    v4 = v16;
  }
  artist = self->_artist;
  if (artist)
  {
    objc_msgSend(v16, "encodeObject:forKey:", artist, CFSTR("artist"));
    v4 = v16;
  }
  startDate = self->_startDate;
  if (startDate)
  {
    objc_msgSend(v16, "encodeObject:forKey:", startDate, CFSTR("startDate"));
    v4 = v16;
  }
  endDate = self->_endDate;
  if (endDate)
  {
    objc_msgSend(v16, "encodeObject:forKey:", endDate, CFSTR("endDate"));
    v4 = v16;
  }
  duration = self->_duration;
  if ((_DWORD)duration)
  {
    objc_msgSend(v16, "encodeInt32:forKey:", duration, CFSTR("duration"));
    v4 = v16;
  }
  objc_msgSend(v4, "encodeBool:forKey:", self->_isRemote, CFSTR("isRemote"));
  deviceSource = self->_deviceSource;
  if (deviceSource)
    objc_msgSend(v16, "encodeObject:forKey:", deviceSource, CFSTR("deviceSource"));
  if (self->_bgColor)
    objc_msgSend(v16, "encodeObject:forKey:", self->_deviceSource, CFSTR("bkColor"));

}

- (id)redactedTitle
{
  return +[MOMediaPlaySession redactString:](MOMediaPlaySession, "redactString:", self->_title);
}

- (id)redactedAlbum
{
  return +[MOMediaPlaySession redactString:](MOMediaPlaySession, "redactString:", self->_album);
}

- (id)redactedArtist
{
  return +[MOMediaPlaySession redactString:](MOMediaPlaySession, "redactString:", self->_artist);
}

+ (id)redactString:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    v5 = (unint64_t)objc_msgSend(v4, "length");
    if (v5 >> 1 >= 5)
      v6 = 5;
    else
      v6 = v5 >> 1;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringToIndex:", v6));
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%lu"), v7, objc_msgSend(v4, "hash")));

  }
  else
  {
    v8 = v4;
  }

  return v8;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v4 = objc_alloc_init((Class)NSDateFormatter);
  objc_msgSend(v4, "setCalendar:", v3);
  objc_msgSend(v4, "setDateFormat:", CFSTR("YYYY-MM-dd HH:mm:ss"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringFromDate:", self->_startDate));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringFromDate:", self->_endDate));
  v7 = objc_alloc((Class)NSString);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaPlaySession redactedTitle](self, "redactedTitle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOMediaPlaySession redactedAlbum](self, "redactedAlbum"));
  v10 = objc_msgSend(v7, "initWithFormat:", CFSTR("<MOMediaPlaySession | title:%@ album:%@ mediaType:%@ bundleId:%@ startDate:%@ endDate:%@ isRemote:%d deviceSource:%@>"), v8, v9, self->_mediaType, self->_bundleId, v5, v6, self->_isRemote, self->_deviceSource);

  return v10;
}

+ (id)getMOPlaySessionMediaType:(id)a3 bundleId:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _UNKNOWN **v9;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6 && !objc_msgSend(v6, "hasPrefix:", CFSTR("com.apple.")))
  {
    v9 = &off_1002D82D0;
  }
  else if (v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lowercaseString"));
    if ((objc_msgSend(v8, "containsString:", CFSTR("music")) & 1) != 0)
    {
      v9 = &off_1002D8300;
    }
    else if ((objc_msgSend(v8, "containsString:", CFSTR("podcast")) & 1) != 0)
    {
      v9 = &off_1002D8318;
    }
    else if (objc_msgSend(v8, "containsString:", CFSTR("video")))
    {
      v9 = &off_1002D8330;
    }
    else
    {
      v9 = &off_1002D8348;
    }

  }
  else
  {
    v9 = &off_1002D82E8;
  }

  return v9;
}

+ (id)describeCategory:(int)a3
{
  if ((a3 - 6000) >= 0x16)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unknown (%lu)"), a3));
  else
    return *(&off_1002AED50 + a3 - 6000);
}

+ (BOOL)isFirstPartyApp:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_1002DC608));
  v5 = v4;
  v6 = v3 && (objc_msgSend(v4, "containsObject:", v3) & 1) != 0;

  return v6;
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

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (unsigned)duration
{
  return self->_duration;
}

- (BOOL)isRemote
{
  return self->_isRemote;
}

- (NSString)deviceSource
{
  return self->_deviceSource;
}

- (NSString)bgColor
{
  return self->_bgColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bgColor, 0);
  objc_storeStrong((id *)&self->_deviceSource, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_mediaType, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_productId, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)initWithTitle:album:bundleId:productId:genre:mediaType:artist:startDate:endDate:duration:isRemote:deviceSource:bgColor:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: endDate != nil (in %s:%d)", v2, v3, v4, v5, v6);
}

- (void)initWithTitle:album:bundleId:productId:genre:mediaType:artist:startDate:endDate:duration:isRemote:deviceSource:bgColor:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: startDate != nil (in %s:%d)", v2, v3, v4, v5, v6);
}

@end
