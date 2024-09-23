@implementation WBLocalTabAttributes

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBLocalTabAttributes)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  double v12;
  double v13;
  int v14;
  char v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  char v22;
  char v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned int v33;
  uint64_t v34;
  WBLocalTabAttributes *v36;
  _QWORD v37[2];
  _QWORD v38[4];

  v38[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v34 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("version"));
  v33 = objc_msgSend(v3, "decodeBoolForKey:", *MEMORY[0x24BE83340]);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BE83308]);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BE83348]);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDBCF20];
  v38[0] = objc_opt_class();
  v38[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v31);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v29, *MEMORY[0x24BE832D0]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BE832D8]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BE832E8]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v27, "unsignedIntegerValue");
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BE83358]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v3, "decodeBoolForKey:", *MEMORY[0x24BE832F0]);
  v22 = objc_msgSend(v3, "decodeBoolForKey:", *MEMORY[0x24BE83300]);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BE83320]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BE83318]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "decodeBoolForKey:", *MEMORY[0x24BE832F8]);
  v7 = (void *)MEMORY[0x24BDBCF20];
  v37[0] = objc_opt_class();
  v37[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v9, *MEMORY[0x24BE83328]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v3, "decodeBoolForKey:", *MEMORY[0x24BE832E0]);
  objc_msgSend(v3, "decodeDoubleForKey:", *MEMORY[0x24BE83330]);
  v13 = v12;
  v14 = objc_msgSend(v3, "decodeIntForKey:", *MEMORY[0x24BE83338]);
  v15 = objc_msgSend(v3, "decodeBoolForKey:", *MEMORY[0x24BE83310]);
  LOBYTE(v4) = objc_msgSend(v3, "decodeBoolForKey:", *MEMORY[0x24BE83350]);

  BYTE1(v20) = (_BYTE)v4;
  LOBYTE(v20) = v15;
  HIDWORD(v19) = v14;
  LOBYTE(v19) = v11;
  LOBYTE(v18) = v6;
  BYTE1(v17) = v22;
  LOBYTE(v17) = v23;
  v36 = -[WBLocalTabAttributes initWithVersion:safeToLoadWebPage:lastVisitTime:sessionStateData:ancestorTabUUIDs:dateClosed:tabIndex:windowUUID:disposable:pinned:pinnedPageURL:pinnedPageTitle:muted:queuedNavigation:displayingStandaloneImage:readerViewTopScrollOffset:readingListBookmarkID:openedFromLink:showingReader:](self, "initWithVersion:safeToLoadWebPage:lastVisitTime:sessionStateData:ancestorTabUUIDs:dateClosed:tabIndex:windowUUID:disposable:pinned:pinnedPageURL:pinnedPageTitle:muted:queuedNavigation:displayingStandaloneImage:readerViewTopScrollOffset:readingListBookmarkID:openedFromLink:showingReader:", v34, v33, v32, v30, v28, v26, v13, v25, v24, v17, v21, v5, v18, v10, v19,
          v20);

  return v36;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", 1, CFSTR("version"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isSafeToLoadWebPage, *MEMORY[0x24BE83340]);
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastVisitTime, *MEMORY[0x24BE83308]);
  objc_msgSend(v5, "encodeObject:forKey:", self->_sessionStateData, *MEMORY[0x24BE83348]);
  objc_msgSend(v5, "encodeObject:forKey:", self->_ancestorTabUUIDs, *MEMORY[0x24BE832D0]);
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateClosed, *MEMORY[0x24BE832D8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_tabIndex);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, *MEMORY[0x24BE832E8]);

  objc_msgSend(v5, "encodeObject:forKey:", self->_windowUUID, *MEMORY[0x24BE83358]);
  objc_msgSend(v5, "encodeBool:forKey:", self->_isDisposable, *MEMORY[0x24BE832F0]);
  objc_msgSend(v5, "encodeBool:forKey:", self->_isPinned, *MEMORY[0x24BE83300]);
  objc_msgSend(v5, "encodeObject:forKey:", self->_pinnedPageURL, *MEMORY[0x24BE83320]);
  objc_msgSend(v5, "encodeObject:forKey:", self->_pinnedPageTitle, *MEMORY[0x24BE83318]);
  objc_msgSend(v5, "encodeBool:forKey:", self->_isMuted, *MEMORY[0x24BE832F8]);
  objc_msgSend(v5, "encodeObject:forKey:", self->_queuedNavigation, *MEMORY[0x24BE83328]);
  objc_msgSend(v5, "encodeBool:forKey:", self->_displayingStandaloneImage, *MEMORY[0x24BE832E0]);
  objc_msgSend(v5, "encodeDouble:forKey:", *MEMORY[0x24BE83330], self->_readerViewTopScrollOffset);
  objc_msgSend(v5, "encodeInt:forKey:", self->_readingListBookmarkID, *MEMORY[0x24BE83338]);
  objc_msgSend(v5, "encodeBool:forKey:", self->_openedFromLink, *MEMORY[0x24BE83310]);
  objc_msgSend(v5, "encodeBool:forKey:", self->_showingReader, *MEMORY[0x24BE83350]);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_BYTE *)(v4 + 11) = self->_isSafeToLoadWebPage;
  objc_storeStrong((id *)(v4 + 32), self->_lastVisitTime);
  objc_storeStrong((id *)(v4 + 40), self->_sessionStateData);
  objc_storeStrong((id *)(v4 + 48), self->_ancestorTabUUIDs);
  objc_storeStrong((id *)(v4 + 56), self->_dateClosed);
  *(_QWORD *)(v4 + 88) = self->_tabIndex;
  objc_storeStrong((id *)(v4 + 96), self->_windowUUID);
  *(_BYTE *)(v4 + 12) = self->_isDisposable;
  *(_BYTE *)(v4 + 13) = self->_isPinned;
  objc_storeStrong((id *)(v4 + 64), self->_pinnedPageURL);
  objc_storeStrong((id *)(v4 + 72), self->_pinnedPageTitle);
  *(_BYTE *)(v4 + 14) = self->_isMuted;
  objc_storeStrong((id *)(v4 + 80), self->_queuedNavigation);
  *(_BYTE *)(v4 + 8) = self->_displayingStandaloneImage;
  *(double *)(v4 + 24) = self->_readerViewTopScrollOffset;
  *(_DWORD *)(v4 + 16) = self->_readingListBookmarkID;
  *(_BYTE *)(v4 + 9) = self->_openedFromLink;
  *(_BYTE *)(v4 + 10) = self->_showingReader;
  return (id)v4;
}

- (WBLocalTabAttributes)initWithLastVisitTime:(id)a3 sessionStateData:(id)a4 ancestorTabUUIDs:(id)a5 displayingStandaloneImage:(BOOL)a6 readerViewTopScrollOffset:(double)a7 readingListBookmarkID:(int)a8 openedFromLink:(BOOL)a9 showingReader:(BOOL)a10 queuedNavigation:(id)a11
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  BYTE1(v15) = a10;
  LOBYTE(v15) = a9;
  HIDWORD(v14) = a8;
  LOBYTE(v14) = a6;
  LOBYTE(v13) = 0;
  LOWORD(v12) = 0;
  return -[WBLocalTabAttributes initWithVersion:safeToLoadWebPage:lastVisitTime:sessionStateData:ancestorTabUUIDs:dateClosed:tabIndex:windowUUID:disposable:pinned:pinnedPageURL:pinnedPageTitle:muted:queuedNavigation:displayingStandaloneImage:readerViewTopScrollOffset:readingListBookmarkID:openedFromLink:showingReader:](self, "initWithVersion:safeToLoadWebPage:lastVisitTime:sessionStateData:ancestorTabUUIDs:dateClosed:tabIndex:windowUUID:disposable:pinned:pinnedPageURL:pinnedPageTitle:muted:queuedNavigation:displayingStandaloneImage:readerViewTopScrollOffset:readingListBookmarkID:openedFromLink:showingReader:", 1, 0, a3, a4, a5, 0, a7, 0, 0, v12, 0, 0, v13, a11, v14,
           v15);
}

- (WBLocalTabAttributes)initWithVersion:(int64_t)a3 safeToLoadWebPage:(BOOL)a4 lastVisitTime:(id)a5 sessionStateData:(id)a6 ancestorTabUUIDs:(id)a7 dateClosed:(id)a8 tabIndex:(unint64_t)a9 windowUUID:(id)a10 disposable:(BOOL)a11 pinned:(BOOL)a12 pinnedPageURL:(id)a13 pinnedPageTitle:(id)a14 muted:(BOOL)a15 queuedNavigation:(id)a16 displayingStandaloneImage:(BOOL)a17 readerViewTopScrollOffset:(double)a18 readingListBookmarkID:(int)a19 openedFromLink:(BOOL)a20 showingReader:(BOOL)a21
{
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  WBLocalTabAttributes *v33;
  WBLocalTabAttributes *v34;
  uint64_t v35;
  NSData *sessionStateData;
  uint64_t v37;
  NSArray *ancestorTabUUIDs;
  uint64_t v39;
  NSString *windowUUID;
  uint64_t v41;
  NSString *pinnedPageTitle;
  uint64_t v43;
  NSDictionary *queuedNavigation;
  WBLocalTabAttributes *v45;
  id v49;
  id v50;
  objc_super v51;

  v50 = a5;
  v27 = a6;
  v28 = a7;
  v29 = a8;
  v30 = a10;
  v49 = a13;
  v31 = a14;
  v32 = a16;
  v51.receiver = self;
  v51.super_class = (Class)WBLocalTabAttributes;
  v33 = -[WBLocalTabAttributes init](&v51, sel_init);
  v34 = v33;
  if (v33)
  {
    v33->_isSafeToLoadWebPage = a4;
    objc_storeStrong((id *)&v33->_lastVisitTime, a5);
    v35 = objc_msgSend(v27, "copy");
    sessionStateData = v34->_sessionStateData;
    v34->_sessionStateData = (NSData *)v35;

    v37 = objc_msgSend(v28, "copy");
    ancestorTabUUIDs = v34->_ancestorTabUUIDs;
    v34->_ancestorTabUUIDs = (NSArray *)v37;

    objc_storeStrong((id *)&v34->_dateClosed, a8);
    v34->_tabIndex = a9;
    v39 = objc_msgSend(v30, "copy");
    windowUUID = v34->_windowUUID;
    v34->_windowUUID = (NSString *)v39;

    v34->_isDisposable = a11;
    v34->_isPinned = a12;
    objc_storeStrong((id *)&v34->_pinnedPageURL, a13);
    v41 = objc_msgSend(v31, "copy");
    pinnedPageTitle = v34->_pinnedPageTitle;
    v34->_pinnedPageTitle = (NSString *)v41;

    v34->_isMuted = a15;
    v43 = objc_msgSend(v32, "copy");
    queuedNavigation = v34->_queuedNavigation;
    v34->_queuedNavigation = (NSDictionary *)v43;

    v34->_displayingStandaloneImage = a17;
    v34->_readerViewTopScrollOffset = a18;
    v34->_readingListBookmarkID = a19;
    v34->_openedFromLink = a20;
    v34->_showingReader = a21;
    if (!a3)
      v34->_isSafeToLoadWebPage = 1;
    v45 = v34;
  }

  return v34;
}

- (WBLocalTabAttributes)initWithDictionaryRepresentation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  int v13;
  char v14;
  char v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  unsigned int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  WBLocalTabAttributes *v35;

  v3 = a3;
  objc_msgSend(v3, "safari_arrayContainingObjectsOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BE832D0]);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_stringForKey:", *MEMORY[0x24BE83358]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v3, "safari_stringForKey:", *MEMORY[0x24BE83320]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLWithString:", v5);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "safari_numberForKey:", CFSTR("version"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v32, "integerValue");
  v24 = objc_msgSend(v3, "safari_BOOLForKey:", *MEMORY[0x24BE83340]);
  objc_msgSend(v3, "safari_dateForKey:", *MEMORY[0x24BE83308]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_dataForKey:", *MEMORY[0x24BE83348]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_dateForKey:", *MEMORY[0x24BE832D8]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_numberForKey:", *MEMORY[0x24BE832E8]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v27, "unsignedIntegerValue");
  v22 = objc_msgSend(v3, "safari_BOOLForKey:", *MEMORY[0x24BE832F0]);
  v21 = objc_msgSend(v3, "safari_BOOLForKey:", *MEMORY[0x24BE83300]);
  objc_msgSend(v3, "safari_stringForKey:", *MEMORY[0x24BE83318]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "safari_BOOLForKey:", *MEMORY[0x24BE832F8]);
  objc_msgSend(v3, "safari_dictionaryForKey:", *MEMORY[0x24BE83328]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v3, "safari_BOOLForKey:", *MEMORY[0x24BE832E0]);
  objc_msgSend(v3, "safari_numberForKey:", *MEMORY[0x24BE83330]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;
  objc_msgSend(v3, "safari_numberForKey:", *MEMORY[0x24BE83338]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "intValue");
  v14 = objc_msgSend(v3, "safari_BOOLForKey:", *MEMORY[0x24BE83310]);
  v15 = objc_msgSend(v3, "safari_BOOLForKey:", *MEMORY[0x24BE83350]);

  BYTE1(v20) = v15;
  LOBYTE(v20) = v14;
  HIDWORD(v19) = v13;
  LOBYTE(v19) = (_BYTE)v5;
  LOBYTE(v18) = v7;
  BYTE1(v17) = v21;
  LOBYTE(v17) = v22;
  v35 = -[WBLocalTabAttributes initWithVersion:safeToLoadWebPage:lastVisitTime:sessionStateData:ancestorTabUUIDs:dateClosed:tabIndex:windowUUID:disposable:pinned:pinnedPageURL:pinnedPageTitle:muted:queuedNavigation:displayingStandaloneImage:readerViewTopScrollOffset:readingListBookmarkID:openedFromLink:showingReader:](self, "initWithVersion:safeToLoadWebPage:lastVisitTime:sessionStateData:ancestorTabUUIDs:dateClosed:tabIndex:windowUUID:disposable:pinned:pinnedPageURL:pinnedPageTitle:muted:queuedNavigation:displayingStandaloneImage:readerViewTopScrollOffset:readingListBookmarkID:openedFromLink:showingReader:", v29, v24, v28, v26, v33, v25, v11, v23, v31, v17, v30, v6, v18, v8, v19,
          v20);

  return v35;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSDate *lastVisitTime;
  void *v6;
  NSString *windowUUID;
  void *v8;
  void *v9;
  NSURL *pinnedPageURL;
  void *v11;
  NSString *pinnedPageTitle;
  void *v13;
  NSDictionary *queuedNavigation;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_24CB4B368, CFSTR("version"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isSafeToLoadWebPage);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x24BE83340]);

  lastVisitTime = self->_lastVisitTime;
  if (lastVisitTime)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", lastVisitTime, *MEMORY[0x24BE83308]);
  if (-[NSData length](self->_sessionStateData, "length"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_sessionStateData, *MEMORY[0x24BE83348]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_ancestorTabUUIDs, *MEMORY[0x24BE832D0]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_dateClosed, *MEMORY[0x24BE832D8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_tabIndex);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BE832E8]);

  windowUUID = self->_windowUUID;
  if (windowUUID)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", windowUUID, *MEMORY[0x24BE83358]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isDisposable);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BE832F0]);

  if (self->_isPinned)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BE83300]);

  }
  pinnedPageURL = self->_pinnedPageURL;
  if (pinnedPageURL)
  {
    -[NSURL safari_originalDataAsString](pinnedPageURL, "safari_originalDataAsString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BE83320]);

  }
  pinnedPageTitle = self->_pinnedPageTitle;
  if (pinnedPageTitle)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", pinnedPageTitle, *MEMORY[0x24BE83318]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isMuted);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BE832F8]);

  queuedNavigation = self->_queuedNavigation;
  if (queuedNavigation)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", queuedNavigation, *MEMORY[0x24BE83328]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_displayingStandaloneImage);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BE832E0]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_readerViewTopScrollOffset);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BE83330]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_readingListBookmarkID);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, *MEMORY[0x24BE83338]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_openedFromLink);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, *MEMORY[0x24BE83310]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_showingReader);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BE83350]);

  return (NSDictionary *)v3;
}

- (id)localAttributesWithLastVisitTime:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;

  v4 = a3;
  v5 = (_QWORD *)-[WBLocalTabAttributes copy](self, "copy");
  v6 = (void *)v5[4];
  v5[4] = v4;

  return v5;
}

- (id)localAttributesWithLastVisitTime:(id)a3 queuedNavigation:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  v8 = (_QWORD *)-[WBLocalTabAttributes copy](self, "copy");
  v9 = (void *)v8[4];
  v8[4] = v6;
  v10 = v6;

  v11 = objc_msgSend(v7, "copy");
  v12 = (void *)v8[10];
  v8[10] = v11;

  return v8;
}

- (BOOL)isDisplayingStandaloneImage
{
  return self->_displayingStandaloneImage;
}

- (double)readerViewTopScrollOffset
{
  return self->_readerViewTopScrollOffset;
}

- (int)readingListBookmarkID
{
  return self->_readingListBookmarkID;
}

- (BOOL)wasOpenedFromLink
{
  return self->_openedFromLink;
}

- (BOOL)isShowingReader
{
  return self->_showingReader;
}

- (BOOL)isSafeToLoadWebPage
{
  return self->_isSafeToLoadWebPage;
}

- (NSDate)lastVisitTime
{
  return self->_lastVisitTime;
}

- (NSData)sessionStateData
{
  return self->_sessionStateData;
}

- (void)setSessionStateData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)ancestorTabUUIDs
{
  return self->_ancestorTabUUIDs;
}

- (NSDate)dateClosed
{
  return self->_dateClosed;
}

- (BOOL)isDisposable
{
  return self->_isDisposable;
}

- (BOOL)isPinned
{
  return self->_isPinned;
}

- (NSURL)pinnedPageURL
{
  return self->_pinnedPageURL;
}

- (NSString)pinnedPageTitle
{
  return self->_pinnedPageTitle;
}

- (BOOL)isMuted
{
  return self->_isMuted;
}

- (NSDictionary)queuedNavigation
{
  return self->_queuedNavigation;
}

- (unint64_t)tabIndex
{
  return self->_tabIndex;
}

- (NSString)windowUUID
{
  return self->_windowUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowUUID, 0);
  objc_storeStrong((id *)&self->_queuedNavigation, 0);
  objc_storeStrong((id *)&self->_pinnedPageTitle, 0);
  objc_storeStrong((id *)&self->_pinnedPageURL, 0);
  objc_storeStrong((id *)&self->_dateClosed, 0);
  objc_storeStrong((id *)&self->_ancestorTabUUIDs, 0);
  objc_storeStrong((id *)&self->_sessionStateData, 0);
  objc_storeStrong((id *)&self->_lastVisitTime, 0);
}

@end
