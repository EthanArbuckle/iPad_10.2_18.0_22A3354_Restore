@implementation BKUbiquityAsset

+ (void)populateAsset:(id)a3 withMetadata:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  id v74;

  v74 = a3;
  v5 = a4;
  if (v74 && objc_msgSend(v5, "count"))
  {
    v6 = objc_opt_class(NSString);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", BCMetadataXattrTitle));
    v8 = BUDynamicCast(v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    objc_msgSend(v74, "setTitle:", v9);

    v10 = objc_opt_class(NSString);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", BCMetadataXattrSortTitle));
    v12 = BUDynamicCast(v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    objc_msgSend(v74, "setSortTitle:", v13);

    v14 = objc_opt_class(NSString);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", BCMetadataXattrAuthor));
    v16 = BUDynamicCast(v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    objc_msgSend(v74, "setAuthor:", v17);

    v18 = objc_opt_class(NSString);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", BCMetadataXattrSortAuthor));
    v20 = BUDynamicCast(v18, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    objc_msgSend(v74, "setSortAuthor:", v21);

    v22 = objc_opt_class(NSString);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", BCMetadataXattrGenre));
    v24 = BUDynamicCast(v22, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    objc_msgSend(v74, "setGenre:", v25);

    v26 = objc_opt_class(NSString);
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", BCMetadataXattrComments));
    v28 = BUDynamicCast(v26, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    objc_msgSend(v74, "setComments:", v29);

    v30 = objc_opt_class(NSString);
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", BCMetadataXattrBookDescription));
    v32 = BUDynamicCast(v30, v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    objc_msgSend(v74, "setBookDescription:", v33);

    v34 = objc_opt_class(NSString);
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", BCMetadataXattrYear));
    v36 = BUDynamicCast(v34, v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    objc_msgSend(v74, "setYear:", v37);

    v38 = objc_opt_class(NSString);
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", BCMetadataXattrExplicit));
    v40 = BUDynamicCast(v38, v39);
    v41 = (void *)objc_claimAutoreleasedReturnValue(v40);

    if (objc_msgSend(v41, "length"))
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v41, "BOOLValue")));
      objc_msgSend(v74, "setIsExplicit:", v42);

    }
    v43 = objc_opt_class(NSString);
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", BCMetadataXattrLastOpened));
    v45 = BUDynamicCast(v43, v44);
    v46 = (void *)objc_claimAutoreleasedReturnValue(v45);

    if (objc_msgSend(v46, "length"))
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[BCUbiquityMetadataHelper metadataDateFromString:](BCUbiquityMetadataHelper, "metadataDateFromString:", v46));
      objc_msgSend(v74, "setLastOpenDate:", v47);

    }
    v48 = objc_opt_class(NSString);
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", BCMetadataXattrFirstOpened));
    v50 = BUDynamicCast(v48, v49);
    v51 = (void *)objc_claimAutoreleasedReturnValue(v50);

    if (objc_msgSend(v51, "length"))
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[BCUbiquityMetadataHelper metadataDateFromString:](BCUbiquityMetadataHelper, "metadataDateFromString:", v51));
      objc_msgSend(v74, "setPurchaseDate:", v52);

    }
    v53 = objc_opt_class(NSString);
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", BCMetadataXattrRating));
    v55 = BUDynamicCast(v53, v54);
    v56 = (void *)objc_claimAutoreleasedReturnValue(v55);

    if (v56)
      objc_msgSend(v74, "setRating:", objc_msgSend(v56, "integerValue"));
    v57 = objc_opt_class(NSString);
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", BCMetadataXattrGeneration));
    v59 = BUDynamicCast(v57, v58);
    v60 = (void *)objc_claimAutoreleasedReturnValue(v59);

    if (objc_msgSend(v60, "length"))
      objc_msgSend(v74, "setGeneration:", objc_msgSend(v60, "longLongValue"));
    v61 = objc_opt_class(NSString);
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", BCMetadataXattrIsSupplementalContent));
    v63 = BUDynamicCast(v61, v62);
    v64 = (void *)objc_claimAutoreleasedReturnValue(v63);

    if (objc_msgSend(v64, "length"))
      objc_msgSend(v74, "setSupplementalContent:", objc_msgSend(v64, "BOOLValue"));
    v65 = objc_opt_class(NSString);
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", BCMetadataXattrStoreID));
    v67 = BUDynamicCast(v65, v66);
    v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
    objc_msgSend(v74, "setStoreID:", v68);

    v69 = objc_opt_class(NSString);
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", BCMetadataXattrStorePlaylistID));
    v71 = BUDynamicCast(v69, v70);
    v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
    objc_msgSend(v74, "setStorePlaylistID:", v72);

    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "storeID"));
    objc_msgSend(v74, "setTemporaryAssetID:", v73);

  }
}

+ (id)newAssetFromMetadata:(id)a3 url:(id)a4 downloaded:(BOOL)a5 downloading:(BOOL)a6 filesize:(int64_t)a7 dataSourceIdentifier:(id)a8 insertionDate:(id)a9 updateDate:(id)a10
{
  _BOOL4 v13;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  BKUbiquityAsset *v22;
  void *v23;
  uint64_t v24;
  _BOOL4 v26;

  v13 = a5;
  v16 = a3;
  v17 = a4;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  if (!v19)
  {
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/datasources/BKUbiquityAsset.m", 156, "+[BKUbiquityAsset newAssetFromMetadata:url:downloaded:downloading:filesize:dataSourceIdentifier:insertionDate:updateDate:]", "insertionDate", 0);
    if (v16)
      goto LABEL_3;
LABEL_15:
    v22 = 0;
    goto LABEL_16;
  }
  if (!v16)
    goto LABEL_15;
LABEL_3:
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", BCMetadataXattrAssetID));
  if (objc_msgSend(v21, "length"))
  {
    v26 = v13;
    v22 = objc_opt_new(BKUbiquityAsset);
    -[BKUbiquityAsset setAssetID:](v22, "setAssetID:", v21);
    -[BKUbiquityAsset setGeneration:](v22, "setGeneration:", 0x7FFFFFFFFFFFFFFFLL);
    objc_msgSend(a1, "populateAsset:withMetadata:", v22, v16);
    -[BKUbiquityAsset setUrl:](v22, "setUrl:", v17);
    -[BKUbiquityAsset setFileSize:](v22, "setFileSize:", a7);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "path"));
    -[BKUbiquityAsset setContentType:](v22, "setContentType:", +[BKUbiquityAsset p_assetContentTypeFromFileName:](BKUbiquityAsset, "p_assetContentTypeFromFileName:", v23));

    if (a6)
    {
      -[BKUbiquityAsset setState:](v22, "setState:", 2);
    }
    else
    {
      if (v26)
        v24 = 1;
      else
        v24 = 3;
      -[BKUbiquityAsset setState:](v22, "setState:", v24);
      if (v26)
        -[BKUbiquityAsset setAssetIsHidden:](v22, "setAssetIsHidden:", &__kCFBooleanFalse);
    }
    -[BKUbiquityAsset setDataSourceInsertionDate:](v22, "setDataSourceInsertionDate:", v19);
    -[BKUbiquityAsset setPurchaseDate:](v22, "setPurchaseDate:", v19);
    -[BKUbiquityAsset setUpdateDate:](v22, "setUpdateDate:", v20);
    -[BKUbiquityAsset setDataSourceIdentifier:](v22, "setDataSourceIdentifier:", v18);
  }
  else
  {
    v22 = 0;
  }

LABEL_16:
  return v22;
}

- (BOOL)isEphemeral
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BKUbiquityAsset)initWithCoder:(id)a3
{
  id v4;
  BKUbiquityAsset *v5;
  id v6;
  void *v7;
  NSString *v8;
  NSString *assetID;
  id v10;
  void *v11;
  NSString *v12;
  NSString *temporaryAssetID;
  id v14;
  void *v15;
  NSString *v16;
  NSString *author;
  id v18;
  void *v19;
  NSString *v20;
  NSString *title;
  id v22;
  void *v23;
  NSURL *v24;
  NSURL *url;
  id v26;
  void *v27;
  NSString *v28;
  NSString *genre;
  id v30;
  void *v31;
  NSDate *v32;
  NSDate *dataSourceInsertionDate;
  id v34;
  void *v35;
  NSDate *v36;
  NSDate *updateDate;
  uint64_t v38;
  NSDate *purchaseDate;
  id v40;
  void *v41;
  NSString *v42;
  NSString *dataSourceIdentifier;
  uint64_t v44;
  id v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  id v50;
  void *v51;
  NSString *v52;
  NSString *storeID;
  id v54;
  void *v55;
  NSString *v56;
  NSString *storePlaylistID;
  objc_super v59;

  v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)BKUbiquityAsset;
  v5 = -[BKUbiquityAsset init](&v59, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("assetID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (NSString *)objc_msgSend(v7, "copy");
    assetID = v5->_assetID;
    v5->_assetID = v8;

    v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("temporaryAssetID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (NSString *)objc_msgSend(v11, "copy");
    temporaryAssetID = v5->_temporaryAssetID;
    v5->_temporaryAssetID = v12;

    v14 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("author"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (NSString *)objc_msgSend(v15, "copy");
    author = v5->_author;
    v5->_author = v16;

    v18 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("title"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (NSString *)objc_msgSend(v19, "copy");
    title = v5->_title;
    v5->_title = v20;

    v22 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSURL), CFSTR("URL"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v24 = (NSURL *)objc_msgSend(v23, "copy");
    url = v5->_url;
    v5->_url = v24;

    v5->_fileSize = (int64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("fileSize"));
    v26 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("genre"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v28 = (NSString *)objc_msgSend(v27, "copy");
    genre = v5->_genre;
    v5->_genre = v28;

    v5->_contentType = (unsigned __int16)objc_msgSend(v4, "decodeIntForKey:", CFSTR("contentType"));
    v5->_state = (unsigned __int16)objc_msgSend(v4, "decodeIntForKey:", CFSTR("state"));
    v30 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate), CFSTR("insertionDate"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v32 = (NSDate *)objc_msgSend(v31, "copy");
    dataSourceInsertionDate = v5->_dataSourceInsertionDate;
    v5->_dataSourceInsertionDate = v32;

    v34 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate), CFSTR("updateDate"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    v36 = (NSDate *)objc_msgSend(v35, "copy");
    updateDate = v5->_updateDate;
    v5->_updateDate = v36;

    v38 = objc_claimAutoreleasedReturnValue(-[BKUbiquityAsset dataSourceInsertionDate](v5, "dataSourceInsertionDate"));
    purchaseDate = v5->_purchaseDate;
    v5->_purchaseDate = (NSDate *)v38;

    v40 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("dataSourceIdentifier"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
    v42 = (NSString *)objc_msgSend(v41, "copy");
    dataSourceIdentifier = v5->_dataSourceIdentifier;
    v5->_dataSourceIdentifier = v42;

    v44 = objc_opt_class(NSNumber);
    v45 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("generation"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
    v47 = BUDynamicCast(v44, v46);
    v48 = (void *)objc_claimAutoreleasedReturnValue(v47);

    if (v48)
      v49 = (uint64_t)objc_msgSend(v48, "longLongValue");
    else
      v49 = 0x7FFFFFFFFFFFFFFFLL;
    v5->_generation = v49;
    v5->_supplementalContent = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supplementalContent"));
    v50 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("storeID"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
    v52 = (NSString *)objc_msgSend(v51, "copy");
    storeID = v5->_storeID;
    v5->_storeID = v52;

    v54 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("storePlaylistID"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
    v56 = (NSString *)objc_msgSend(v55, "copy");
    storePlaylistID = v5->_storePlaylistID;
    v5->_storePlaylistID = v56;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
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
  id v16;

  v16 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquityAsset assetID](self, "assetID"));
  objc_msgSend(v16, "encodeObject:forKey:", v4, CFSTR("assetID"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquityAsset temporaryAssetID](self, "temporaryAssetID"));
  objc_msgSend(v16, "encodeObject:forKey:", v5, CFSTR("temporaryAssetID"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquityAsset author](self, "author"));
  objc_msgSend(v16, "encodeObject:forKey:", v6, CFSTR("author"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquityAsset title](self, "title"));
  objc_msgSend(v16, "encodeObject:forKey:", v7, CFSTR("title"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquityAsset url](self, "url"));
  objc_msgSend(v16, "encodeObject:forKey:", v8, CFSTR("URL"));

  objc_msgSend(v16, "encodeInt64:forKey:", -[BKUbiquityAsset fileSize](self, "fileSize"), CFSTR("fileSize"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquityAsset genre](self, "genre"));
  objc_msgSend(v16, "encodeObject:forKey:", v9, CFSTR("genre"));

  objc_msgSend(v16, "encodeInt:forKey:", -[BKUbiquityAsset contentType](self, "contentType"), CFSTR("contentType"));
  objc_msgSend(v16, "encodeInt:forKey:", -[BKUbiquityAsset state](self, "state"), CFSTR("state"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquityAsset dataSourceInsertionDate](self, "dataSourceInsertionDate"));
  objc_msgSend(v16, "encodeObject:forKey:", v10, CFSTR("insertionDate"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquityAsset updateDate](self, "updateDate"));
  objc_msgSend(v16, "encodeObject:forKey:", v11, CFSTR("updateDate"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquityAsset dataSourceIdentifier](self, "dataSourceIdentifier"));
  objc_msgSend(v16, "encodeObject:forKey:", v12, CFSTR("dataSourceIdentifier"));

  if (-[BKUbiquityAsset generation](self, "generation") != 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", -[BKUbiquityAsset generation](self, "generation")));
    objc_msgSend(v16, "encodeObject:forKey:", v13, CFSTR("generation"));

  }
  objc_msgSend(v16, "encodeBool:forKey:", -[BKUbiquityAsset isSupplementalContent](self, "isSupplementalContent"), CFSTR("supplementalContent"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquityAsset storeID](self, "storeID"));
  objc_msgSend(v16, "encodeObject:forKey:", v14, CFSTR("storeID"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquityAsset storePlaylistID](self, "storePlaylistID"));
  objc_msgSend(v16, "encodeObject:forKey:", v15, CFSTR("storePlaylistID"));

}

- (BOOL)isSameAsAsset:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  unsigned __int8 v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  NSString *v12;
  NSString *temporaryAssetID;
  unsigned __int8 v14;
  NSString *v15;
  NSString *author;
  void *v17;
  NSString *v18;
  void *v19;
  NSString *v20;
  uint64_t v21;
  uint64_t v22;
  NSString *v23;
  void *v25;
  NSString *v26;
  void *v27;
  NSString *storeID;
  NSString *v29;
  void *v30;
  NSDate *dataSourceInsertionDate;
  NSDate *v32;
  void *v33;
  void *v34;
  NSString *genre;
  void *v36;
  NSString *title;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "assetID"));
  v7 = objc_msgSend(v6, "isEqualToString:", self->_assetID);

  if ((v7 & 1) == 0)
  {
    v9 = BKLibraryDataSourceUbiquityLog(v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1006A0A40(v10);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "assetID"));
  if (objc_msgSend(v11, "isEqualToString:", self->_assetID))
  {
    v12 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "temporaryAssetID"));
    temporaryAssetID = self->_temporaryAssetID;
    if (v12 != temporaryAssetID)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "temporaryAssetID"));
      if (!objc_msgSend(v3, "isEqualToString:", self->_temporaryAssetID))
      {
        v14 = 0;
        goto LABEL_48;
      }
    }
    v15 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "author"));
    author = self->_author;
    if (v15 != author)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "author"));
      if (!objc_msgSend(v17, "isEqualToString:", self->_author))
      {
        v14 = 0;
LABEL_46:

LABEL_47:
        if (v12 == temporaryAssetID)
        {
LABEL_49:

          goto LABEL_50;
        }
LABEL_48:

        goto LABEL_49;
      }
      v36 = v17;
    }
    v18 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
    title = self->_title;
    if (v18 != title)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
      if (!objc_msgSend(v19, "isEqualToString:", self->_title))
      {
        v14 = 0;
LABEL_44:

LABEL_45:
        v17 = v36;
        if (v15 == author)
          goto LABEL_47;
        goto LABEL_46;
      }
      v34 = v19;
    }
    v20 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "genre"));
    genre = self->_genre;
    if (v20 != genre)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "genre"));
      if (!objc_msgSend(v33, "isEqualToString:", self->_genre))
      {
        v14 = 0;
LABEL_42:

LABEL_43:
        v19 = v34;
        if (v18 == title)
          goto LABEL_45;
        goto LABEL_44;
      }
    }
    if ((unsigned __int16)self->_contentType != (unsigned __int16)objc_msgSend(v5, "contentType")
      || (unsigned __int16)self->_state != (unsigned __int16)objc_msgSend(v5, "state"))
    {
      v14 = 0;
      goto LABEL_41;
    }
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataSourceInsertionDate"));
    dataSourceInsertionDate = self->_dataSourceInsertionDate;
    v32 = (NSDate *)v21;
    if ((NSDate *)v21 != dataSourceInsertionDate)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataSourceInsertionDate"));
      if (!objc_msgSend(v30, "isEqual:", self->_dataSourceInsertionDate))
      {
        v14 = 0;
        goto LABEL_39;
      }
    }
    if (self->_supplementalContent != objc_msgSend(v5, "isSupplementalContent"))
    {
      v14 = 0;
      goto LABEL_38;
    }
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storeID"));
    storeID = self->_storeID;
    v29 = (NSString *)v22;
    if ((NSString *)v22 == storeID
      || (v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storeID")),
          objc_msgSend(v27, "isEqualToString:", self->_storeID)))
    {
      v23 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storePlaylistID"));
      if (v23 == self->_storePlaylistID)
      {

        v14 = 1;
      }
      else
      {
        v26 = v23;
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storePlaylistID"));
        v14 = objc_msgSend(v25, "isEqualToString:", self->_storePlaylistID);

      }
      if (v29 == storeID)
      {

LABEL_38:
        if (v32 == dataSourceInsertionDate)
        {

LABEL_41:
          if (v20 == genre)
            goto LABEL_43;
          goto LABEL_42;
        }
LABEL_39:

        goto LABEL_41;
      }
    }
    else
    {
      v14 = 0;
    }

    goto LABEL_38;
  }
  v14 = 0;
LABEL_50:

  return v14;
}

- (BOOL)isUpdatedFromAsset:(id)a3
{
  id v4;
  NSDate *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  if (objc_msgSend(v4, "fileSize") == (id)self->_fileSize)
  {
    v5 = (NSDate *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "updateDate"));
    if (v5 == self->_updateDate)
    {
      v7 = objc_msgSend(v4, "generation") != (id)self->_generation;
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "updateDate"));
      if (objc_msgSend(v6, "isEqualToDate:", self->_updateDate))
        v7 = objc_msgSend(v4, "generation") != (id)self->_generation;
      else
        v7 = 1;

    }
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (BOOL)isDifferentPath:(id)a3
{
  id v4;
  NSURL *v5;
  void *v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = (NSURL *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "url"));
  if (v5 == self->_url)
  {
    v8 = 0;
LABEL_6:

    goto LABEL_7;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "url"));
  v7 = objc_msgSend(v6, "isEqual:", self->_url);

  if ((v7 & 1) == 0)
  {
    v5 = (NSURL *)objc_claimAutoreleasedReturnValue(-[BKUbiquityAsset url](self, "url"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL lastPathComponent](v5, "lastPathComponent"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "url"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastPathComponent"));
    v8 = objc_msgSend(v9, "isEqualToString:", v11);

    goto LABEL_6;
  }
  v8 = 0;
LABEL_7:

  return v8;
}

- (BOOL)isDifferentFilename:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquityAsset url](self, "url"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "url"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
  v9 = objc_msgSend(v6, "isEqualToString:", v8) ^ 1;

  return v9;
}

- (void)setSupplementalContent:(BOOL)a3 playlistID:(id)a4 storeID:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;

  v6 = a3;
  v9 = a4;
  v8 = a5;
  -[BKUbiquityAsset setSupplementalContent:](self, "setSupplementalContent:", v6);
  if (v9)
    -[BKUbiquityAsset setStorePlaylistID:](self, "setStorePlaylistID:", v9);
  if (v8)
  {
    -[BKUbiquityAsset setStoreID:](self, "setStoreID:", v8);
    -[BKUbiquityAsset setTemporaryAssetID:](self, "setTemporaryAssetID:", v8);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  BKUbiquityAsset *v4;
  void *v5;
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

  v4 = objc_opt_new(BKUbiquityAsset);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquityAsset assetID](self, "assetID"));
    v6 = objc_msgSend(v5, "copy");
    -[BKUbiquityAsset setAssetID:](v4, "setAssetID:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquityAsset temporaryAssetID](self, "temporaryAssetID"));
    v8 = objc_msgSend(v7, "copy");
    -[BKUbiquityAsset setTemporaryAssetID:](v4, "setTemporaryAssetID:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquityAsset author](self, "author"));
    v10 = objc_msgSend(v9, "copy");
    -[BKUbiquityAsset setAuthor:](v4, "setAuthor:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquityAsset title](self, "title"));
    v12 = objc_msgSend(v11, "copy");
    -[BKUbiquityAsset setTitle:](v4, "setTitle:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquityAsset url](self, "url"));
    v14 = objc_msgSend(v13, "copy");
    -[BKUbiquityAsset setUrl:](v4, "setUrl:", v14);

    -[BKUbiquityAsset setFileSize:](v4, "setFileSize:", -[BKUbiquityAsset fileSize](self, "fileSize"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquityAsset genre](self, "genre"));
    v16 = objc_msgSend(v15, "copy");
    -[BKUbiquityAsset setGenre:](v4, "setGenre:", v16);

    -[BKUbiquityAsset setContentType:](v4, "setContentType:", -[BKUbiquityAsset contentType](self, "contentType"));
    -[BKUbiquityAsset setState:](v4, "setState:", -[BKUbiquityAsset state](self, "state"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquityAsset dataSourceInsertionDate](self, "dataSourceInsertionDate"));
    v18 = objc_msgSend(v17, "copy");
    -[BKUbiquityAsset setDataSourceInsertionDate:](v4, "setDataSourceInsertionDate:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquityAsset purchaseDate](self, "purchaseDate"));
    v20 = objc_msgSend(v19, "copy");
    -[BKUbiquityAsset setPurchaseDate:](v4, "setPurchaseDate:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquityAsset updateDate](self, "updateDate"));
    v22 = objc_msgSend(v21, "copy");
    -[BKUbiquityAsset setUpdateDate:](v4, "setUpdateDate:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquityAsset dataSourceIdentifier](self, "dataSourceIdentifier"));
    v24 = objc_msgSend(v23, "copy");
    -[BKUbiquityAsset setDataSourceIdentifier:](v4, "setDataSourceIdentifier:", v24);

    -[BKUbiquityAsset setGeneration:](v4, "setGeneration:", -[BKUbiquityAsset generation](self, "generation"));
    -[BKUbiquityAsset setSupplementalContent:](v4, "setSupplementalContent:", -[BKUbiquityAsset isSupplementalContent](self, "isSupplementalContent"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquityAsset storeID](self, "storeID"));
    v26 = objc_msgSend(v25, "copy");
    -[BKUbiquityAsset setStoreID:](v4, "setStoreID:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquityAsset storePlaylistID](self, "storePlaylistID"));
    v28 = objc_msgSend(v27, "copy");
    -[BKUbiquityAsset setStorePlaylistID:](v4, "setStorePlaylistID:", v28);

  }
  return v4;
}

+ (signed)p_assetContentTypeFromFileName:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  signed __int16 v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathExtension"));
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("icloud")))
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByDeletingPathExtension"));

    v3 = (id)v5;
  }
  v6 = (unsigned __int16)+[BKAssetUtilities contentTypeForPath:](BKAssetUtilities, "contentTypeForPath:", v3);

  return v6;
}

- (NSString)description
{
  return (NSString *)+[BKAssetUtilities descriptionForAsset:](BKAssetUtilities, "descriptionForAsset:", self);
}

- (NSString)accountID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAccountID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)assetID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAssetID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)storeID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setStoreID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)storePlaylistID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setStorePlaylistID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)temporaryAssetID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTemporaryAssetID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)author
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAuthor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSString)sortAuthor
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSortAuthor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSString)sortTitle
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSortTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 96, 1);
}

- (void)setUrl:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSString)genre
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setGenre:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSString)dataSourceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setDataSourceIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (BOOL)isSample
{
  return self->_sample;
}

- (void)setSample:(BOOL)a3
{
  self->_sample = a3;
}

- (BOOL)isProof
{
  return self->_proof;
}

- (void)setProof:(BOOL)a3
{
  self->_proof = a3;
}

- (BOOL)isCompressed
{
  return self->_compressed;
}

- (void)setCompressed:(BOOL)a3
{
  self->_compressed = a3;
}

- (BOOL)isLocked
{
  return self->_locked;
}

- (void)setLocked:(BOOL)a3
{
  self->_locked = a3;
}

- (BOOL)isSupplementalContent
{
  return self->_supplementalContent;
}

- (void)setSupplementalContent:(BOOL)a3
{
  self->_supplementalContent = a3;
}

- (int64_t)generation
{
  return self->_generation;
}

- (void)setGeneration:(int64_t)a3
{
  self->_generation = a3;
}

- (int64_t)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(int64_t)a3
{
  self->_fileSize = a3;
}

- (signed)contentType
{
  return self->_contentType;
}

- (void)setContentType:(signed __int16)a3
{
  self->_contentType = a3;
}

- (signed)state
{
  return self->_state;
}

- (void)setState:(signed __int16)a3
{
  self->_state = a3;
}

- (NSNumber)isExplicit
{
  return (NSNumber *)objc_getProperty(self, a2, 136, 1);
}

- (void)setIsExplicit:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSDate)dataSourceInsertionDate
{
  return (NSDate *)objc_getProperty(self, a2, 144, 1);
}

- (void)setDataSourceInsertionDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSDate)releaseDate
{
  return (NSDate *)objc_getProperty(self, a2, 152, 1);
}

- (void)setReleaseDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSDate)purchaseDate
{
  return (NSDate *)objc_getProperty(self, a2, 160, 1);
}

- (void)setPurchaseDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSDate)expectedDate
{
  return (NSDate *)objc_getProperty(self, a2, 168, 1);
}

- (void)setExpectedDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSDate)lastOpenDate
{
  return (NSDate *)objc_getProperty(self, a2, 176, 1);
}

- (void)setLastOpenDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (BOOL)shouldDisableOptimizeSpeed
{
  return self->_shouldDisableOptimizeSpeed;
}

- (void)setShouldDisableOptimizeSpeed:(BOOL)a3
{
  self->_shouldDisableOptimizeSpeed = a3;
}

- (BOOL)shouldDisableTouchEmulation
{
  return self->_shouldDisableTouchEmulation;
}

- (void)setShouldDisableTouchEmulation:(BOOL)a3
{
  self->_shouldDisableTouchEmulation = a3;
}

- (signed)desktopSupportLevel
{
  return self->_desktopSupportLevel;
}

- (void)setDesktopSupportLevel:(signed __int16)a3
{
  self->_desktopSupportLevel = a3;
}

- (NSString)scrollDirection
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (void)setScrollDirection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSString)pageProgressionDirection
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setPageProgressionDirection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (int64_t)pageCount
{
  return self->_pageCount;
}

- (void)setPageCount:(int64_t)a3
{
  self->_pageCount = a3;
}

- (int64_t)rating
{
  return self->_rating;
}

- (void)setRating:(int64_t)a3
{
  self->_rating = a3;
}

- (NSDate)updateDate
{
  return (NSDate *)objc_getProperty(self, a2, 216, 1);
}

- (void)setUpdateDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (NSNumber)versionNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 224, 1);
}

- (void)setVersionNumber:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (NSString)versionNumberHumanReadable
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setVersionNumberHumanReadable:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (NSString)bookDescription
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setBookDescription:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (NSString)comments
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (void)setComments:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (NSString)kind
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (void)setKind:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (NSString)year
{
  return (NSString *)objc_getProperty(self, a2, 264, 1);
}

- (void)setYear:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (NSString)grouping
{
  return (NSString *)objc_getProperty(self, a2, 272, 1);
}

- (void)setGrouping:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (BOOL)computedRating
{
  return self->_computedRating;
}

- (void)setComputedRating:(BOOL)a3
{
  self->_computedRating = a3;
}

- (int64_t)metadataMigrationVersion
{
  return self->_metadataMigrationVersion;
}

- (void)setMetadataMigrationVersion:(int64_t)a3
{
  self->_metadataMigrationVersion = a3;
}

- (BOOL)isDevelopment
{
  return self->_development;
}

- (void)setDevelopment:(BOOL)a3
{
  self->_development = a3;
}

- (NSNumber)assetIsHidden
{
  return (NSNumber *)objc_getProperty(self, a2, 288, 1);
}

- (void)setAssetIsHidden:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 288);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetIsHidden, 0);
  objc_storeStrong((id *)&self->_grouping, 0);
  objc_storeStrong((id *)&self->_year, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_comments, 0);
  objc_storeStrong((id *)&self->_bookDescription, 0);
  objc_storeStrong((id *)&self->_versionNumberHumanReadable, 0);
  objc_storeStrong((id *)&self->_versionNumber, 0);
  objc_storeStrong((id *)&self->_updateDate, 0);
  objc_storeStrong((id *)&self->_pageProgressionDirection, 0);
  objc_storeStrong((id *)&self->_scrollDirection, 0);
  objc_storeStrong((id *)&self->_lastOpenDate, 0);
  objc_storeStrong((id *)&self->_expectedDate, 0);
  objc_storeStrong((id *)&self->_purchaseDate, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_dataSourceInsertionDate, 0);
  objc_storeStrong((id *)&self->_isExplicit, 0);
  objc_storeStrong((id *)&self->_dataSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_sortTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_sortAuthor, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_temporaryAssetID, 0);
  objc_storeStrong((id *)&self->_storePlaylistID, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
}

@end
