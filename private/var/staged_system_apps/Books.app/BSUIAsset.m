@implementation BSUIAsset

- (BSUIAsset)initWithLibraryAsset:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  void *v65;
  id v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  void *v71;
  id v72;
  void *v73;
  id v74;
  void *v75;
  id v76;
  void *v77;
  id v78;
  void *v79;
  id v80;
  void *v81;
  id v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  id v89;
  void *v90;
  id v91;
  void *v92;
  id v93;
  void *v94;
  id v95;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  id v100;
  void *v101;
  id v102;
  void *v103;
  void *v104;
  id v105;
  uint64_t v106;
  void *v107;
  void *v108;
  void *v109;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  id v113;
  void *v114;
  id v115;
  void *v116;
  uint64_t v117;
  void *v118;
  id v119;
  void *v120;
  id v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  id v126;
  void *v127;
  id v128;
  void *v129;
  id v130;
  void *v131;
  id v132;
  void *v133;
  id v134;
  void *v135;
  id v136;
  void *v137;
  BSUIAsset *v138;

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableDictionary);
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayAuthor"));
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v9 = v8;

  objc_msgSend(v5, "setObject:forKey:", v9, BSUIAssetKeyAuthor);
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
  v11 = v10;
  if (v10)
    v12 = v10;
  else
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v13 = v12;

  objc_msgSend(v5, "setObject:forKey:", v13, BSUIAssetKeyTitle);
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sortTitle"));
  v15 = v14;
  if (v14)
    v16 = v14;
  else
    v16 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v17 = v16;

  objc_msgSend(v5, "setObject:forKey:", v17, BSUIAssetKeySortTitle);
  v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "isExplicit"));
  v19 = v18;
  if (v18)
    v20 = v18;
  else
    v20 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v21 = v20;

  objc_msgSend(v5, "setObject:forKey:", v21, BSUIAssetKeyIsExplicit);
  v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "storeID"));
  v23 = v22;
  if (v22)
    v24 = v22;
  else
    v24 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v25 = v24;

  objc_msgSend(v5, "setObject:forKey:", v25, BSUIAssetKeyStoreID);
  v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "readingProgress"));
  v27 = v26;
  if (v26)
    v28 = v26;
  else
    v28 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v29 = v28;

  objc_msgSend(v5, "setObject:forKey:", v29, BSUIAssetKeyReadingProgress);
  v30 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", objc_msgSend(v4, "contentType")));
  v31 = v30;
  if (v30)
    v32 = v30;
  else
    v32 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v33 = v32;

  objc_msgSend(v5, "setObject:forKey:", v33, BSUIAssetKeyContentType);
  v34 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "isFinished")));
  v35 = v34;
  if (v34)
    v36 = v34;
  else
    v36 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v37 = v36;

  objc_msgSend(v5, "setObject:forKey:", v37, BSUIAssetKeyIsFinished);
  v38 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "isNew")));
  v39 = v38;
  if (v38)
    v40 = v38;
  else
    v40 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v41 = v40;

  objc_msgSend(v5, "setObject:forKey:", v41, BSUIAssetKeyIsNew);
  v42 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "isSample")));
  v43 = v42;
  if (v42)
    v44 = v42;
  else
    v44 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v45 = v44;

  objc_msgSend(v5, "setObject:forKey:", v45, BSUIAssetKeyIsSample);
  v46 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "isNonLocalSample")));
  v47 = v46;
  if (v46)
    v48 = v46;
  else
    v48 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v49 = v48;

  objc_msgSend(v5, "setObject:forKey:", v49, BSUIAssetKeyIsNonLocalSample);
  v50 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "isInSamples")));
  v51 = v50;
  if (v50)
    v52 = v50;
  else
    v52 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v53 = v52;

  objc_msgSend(v5, "setObject:forKey:", v53, BSUIAssetKeyIsInSamples);
  v54 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "isInSamples")));
  v55 = v54;
  if (v54)
    v56 = v54;
  else
    v56 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v57 = v56;

  objc_msgSend(v5, "setObject:forKey:", v57, BSUIAssetKeyIsMemberOfSamplesCollection);
  v58 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "isLocal")));
  v59 = v58;
  if (v58)
    v60 = v58;
  else
    v60 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v61 = v60;

  objc_msgSend(v5, "setObject:forKey:", v61, BSUIAssetKeyIsLocal);
  v62 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "isSupplementalContent")));
  v63 = v62;
  if (v62)
    v64 = v62;
  else
    v64 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v65 = v64;

  objc_msgSend(v5, "setObject:forKey:", v65, BSUIAssetKeyIsSupplementalContent);
  v66 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "seriesID"));
  v67 = v66;
  if (v66)
    v68 = v66;
  else
    v68 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v69 = v68;

  objc_msgSend(v5, "setObject:forKey:", v69, BSUIAssetKeySeriesID);
  v70 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastEngagedDate"));
  v71 = v70;
  if (v70)
    v72 = v70;
  else
    v72 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v73 = v72;

  objc_msgSend(v5, "setObject:forKey:", v73, BSUIAssetKeyLastEngagedDate);
  v74 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastOpenDate"));
  v75 = v74;
  if (v74)
    v76 = v74;
  else
    v76 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v77 = v76;

  objc_msgSend(v5, "setObject:forKey:", v77, BSUIAssetKeyLastOpenDate);
  v78 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pageProgressionDirection"));
  v79 = v78;
  if (v78)
    v80 = v78;
  else
    v80 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v81 = v80;

  objc_msgSend(v5, "setObject:forKey:", v81, BSUIAssetKeyPageProgressionDirection);
  v82 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateFinished"));
  v83 = v82;
  if (v82)
    v84 = v82;
  else
    v84 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v85 = v84;

  objc_msgSend(v5, "setObject:forKey:", v85, BSUIAssetKeyDateFinished);
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hasRACSupport"));
  v87 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v86, "BOOLValue")));
  v88 = v87;
  if (v87)
    v89 = v87;
  else
    v89 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v90 = v89;

  objc_msgSend(v5, "setObject:forKey:", v90, BSUIAssetKeyHasRACSupport);
  v91 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cloudAssetType"));
  v92 = v91;
  if (v91)
    v93 = v91;
  else
    v93 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v94 = v93;

  objc_msgSend(v5, "setObject:forKey:", v94, BSUIAssetKeyCloudAssetType);
  v95 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "purchaseDate"));
  v96 = v95;
  if (v95)
    v97 = v95;
  else
    v97 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v98 = v97;

  objc_msgSend(v5, "setObject:forKey:", v98, BSUIAssetKeyPurchasedDate);
  if (objc_msgSend(v4, "contentType") == 5)
  {
    v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "seriesBooks"));
    v100 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v99, "count")));
    v101 = v100;
    v102 = v100
         ? v100
         : (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v103 = v102;

    objc_msgSend(v5, "setObject:forKey:", v103, BSUIAssetKeySeriesItemCount);
    v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "seriesBooks"));
    v105 = objc_msgSend(v104, "count");

    if (v105)
    {
      v106 = objc_opt_class(BKLibraryAsset);
      v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "seriesBooks"));
      v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "allObjects"));
      v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "objectAtIndexedSubscript:", 0));
      v110 = BUDynamicCast(v106, v109);
      v111 = (void *)objc_claimAutoreleasedReturnValue(v110);

      if (objc_msgSend(v111, "isAudiobook"))
        v112 = 2;
      else
        v112 = 1;
      v113 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", v112));
      v114 = v113;
      if (v113)
        v115 = v113;
      else
        v115 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      v116 = v115;

      objc_msgSend(v5, "setObject:forKey:", v116, BSUIAssetKeySeriesContentType);
    }
  }
  v117 = BKLibraryAssetIdentifierFromAsset(v4);
  v118 = (void *)objc_claimAutoreleasedReturnValue(v117);
  v119 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "permanentOrTemporaryAssetID"));
  v120 = v119;
  if (v119)
    v121 = v119;
  else
    v121 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v122 = v121;

  objc_msgSend(v5, "setObject:forKey:", v122, BSUIAssetKeyAssetID);
  if ((objc_msgSend(v4, "isStore") & 1) == 0
    && (objc_msgSend(v4, "isManagedBook") & 1) == 0)
  {
    v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
    if (objc_msgSend(v123, "length"))
    {
      v124 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v123));
      v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "standardizedURL"));

      v126 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "absoluteString"));
      v127 = v126;
      if (v126)
        v128 = v126;
      else
        v128 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      v129 = v128;

      objc_msgSend(v5, "setObject:forKey:", v129, BSUIAssetKeyFileURL);
    }
    v130 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v4, "fileSize")));
    v131 = v130;
    if (v130)
      v132 = v130;
    else
      v132 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v133 = v132;

    objc_msgSend(v5, "setObject:forKey:", v133, BSUIAssetKeyFileSize);
  }
  v134 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "coverURL"));
  v135 = v134;
  if (v134)
    v136 = v134;
  else
    v136 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v137 = v136;

  objc_msgSend(v5, "setObject:forKey:", v137, BSUIAssetKeyCoverURL);
  v138 = -[BSUIAsset initWithDictionary:](self, "initWithDictionary:", v5);

  return v138;
}

+ (id)propertiesNeededFromBKLibraryAsset
{
  _QWORD v3[19];

  v3[0] = CFSTR("sortAuthor");
  v3[1] = CFSTR("title");
  v3[2] = CFSTR("sortTitle");
  v3[3] = CFSTR("assetID");
  v3[4] = CFSTR("isExplicit");
  v3[5] = CFSTR("storeID");
  v3[6] = CFSTR("bookHighWaterMarkProgress");
  v3[7] = CFSTR("contentType");
  v3[8] = CFSTR("isFinished");
  v3[9] = CFSTR("isNew");
  v3[10] = CFSTR("isSample");
  v3[11] = CFSTR("isSupplementalContent");
  v3[12] = CFSTR("state");
  v3[13] = CFSTR("seriesID");
  v3[14] = CFSTR("lastEngagedDate");
  v3[15] = CFSTR("lastOpenDate");
  v3[16] = CFSTR("fileSize");
  v3[17] = CFSTR("path");
  v3[18] = CFSTR("pageProgressionDirection");
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 19));
}

@end
