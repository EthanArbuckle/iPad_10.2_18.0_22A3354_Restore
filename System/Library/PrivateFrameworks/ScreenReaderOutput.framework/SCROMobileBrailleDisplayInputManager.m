@implementation SCROMobileBrailleDisplayInputManager

+ (SCROMobileBrailleDisplayInputManager)sharedManager
{
  if (sharedManager_onceToken_0 != -1)
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_7);
  return (SCROMobileBrailleDisplayInputManager *)(id)_sharedManager_0;
}

void __53__SCROMobileBrailleDisplayInputManager_sharedManager__block_invoke()
{
  SCROMobileBrailleDisplayInputManager *v0;
  void *v1;

  v0 = objc_alloc_init(SCROMobileBrailleDisplayInputManager);
  v1 = (void *)_sharedManager_0;
  _sharedManager_0 = (uint64_t)v0;

}

- (id)_bundle
{
  NSBundle *bundle;
  void *v4;
  void *v5;
  NSBundle *v6;
  NSBundle *v7;

  bundle = self->_bundle;
  if (!bundle)
  {
    v4 = (void *)MEMORY[0x24BDD1488];
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleForClass:", v5);
    v6 = (NSBundle *)objc_claimAutoreleasedReturnValue();
    v7 = self->_bundle;
    self->_bundle = v6;

    bundle = self->_bundle;
  }
  return bundle;
}

- (SCROMobileBrailleDisplayInputManager)init
{
  SCROMobileBrailleDisplayInputManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *displayInfoDict;
  id v5;
  int v6;
  unsigned int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSSet *brailleKeys;
  uint64_t v12;
  NSLock *contentLock;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SCROMobileBrailleDisplayInputManager;
  v2 = -[SCROMobileBrailleDisplayInputManager init](&v15, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    displayInfoDict = v2->_displayInfoDict;
    v2->_displayInfoDict = v3;

    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v6 = 0;
    v7 = 65538;
    do
    {
      v7 = v6 | v7 & 0xFFFF00FF;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v9);

      v6 += 256;
    }
    while (v6 != 3584);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v5);
    brailleKeys = v2->_brailleKeys;
    v2->_brailleKeys = (NSSet *)v10;

    v12 = objc_opt_new();
    contentLock = v2->_contentLock;
    v2->_contentLock = (NSLock *)v12;

  }
  return v2;
}

- (void)configureWithDriverConfiguration:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  void *v43;
  void *v44;
  SCROMobileBrailleDisplayInputManagerCacheObject *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id obj;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  uint64_t v61;
  SCROMobileBrailleDisplayInputManager *v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v58 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v60 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v59 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[NSLock lock](self->_contentLock, "lock");
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v62 = self;
  v5 = self->_displayInfoDict;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v69;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v69 != v8)
          objc_enumerationMutation(v5);
        -[NSMutableDictionary objectForKey:](v62->_displayInfoDict, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * i));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "driverIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "modelIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v10, "bundle");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            objc_msgSend(v58, "setObject:forKey:", v13, v11);

        }
        if (v12)
        {
          objc_msgSend(v10, "commandDictionary");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            objc_msgSend(v59, "setObject:forKey:", v14, v12);
          objc_msgSend(v10, "orderedIdentifiers");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
            objc_msgSend(v60, "setObject:forKey:", v15, v12);

        }
      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
    }
    while (v7);
  }

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = v4;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v65;
    v49 = *(_QWORD *)v65;
    do
    {
      v19 = 0;
      v50 = v17;
      do
      {
        if (*(_QWORD *)v65 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v19);
        objc_msgSend(v20, "objectForKey:", kSCROBrailleDisplayToken[0]);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          v63 = v21;
          objc_msgSend(v20, "objectForKey:", kSCROBrailleDisplayBrailleInputMode[0]);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = objc_msgSend(v22, "integerValue");

          objc_msgSend(v20, "objectForKey:", kSCROBrailleDisplayDriverIdentifier[0]);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v23, "length"))
          {
            v55 = v20;
            objc_msgSend(v20, "objectForKey:", kSCROBrailleDisplayModelIdentifier[0]);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v24, "length"))
            {
              v53 = v23;
              objc_msgSend(v58, "objectForKey:", v23);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v25)
              {
                objc_msgSend(MEMORY[0x24BDD1488], "brailleDriverBundleWithIdentifier:", v53);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                if (v25)
                  objc_msgSend(v58, "setObject:forKey:", v25, v53);
              }
              objc_msgSend(v59, "objectForKey:", v24);
              v26 = (id)objc_claimAutoreleasedReturnValue();
              if (!v26)
              {
                v26 = objc_alloc_init(MEMORY[0x24BDBCED8]);
                objc_msgSend(v59, "setObject:forKey:", v26, v24);
              }
              v51 = v19;
              objc_msgSend(v60, "objectForKey:", v24);
              v27 = (id)objc_claimAutoreleasedReturnValue();
              v28 = v61;
              if (!v27)
              {
                v27 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
                objc_msgSend(v60, "setObject:forKey:", v27, v24);
              }
              -[SCROMobileBrailleDisplayInputManager _commandsFromBrailleInputMode:](v62, "_commandsFromBrailleInputMode:", v61);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v56 = v24;
              v57 = v25;
              v29 = v26;
              v30 = v27;
              v31 = v30;
              if (v29 && v30)
              {
                v48 = v24;
                objc_msgSend(v29, "removeAllObjects");
                objc_msgSend(v31, "removeAllObjects");
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-mobile"), v56);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "pathForResource:ofType:", v32, CFSTR("plist"));
                v33 = objc_claimAutoreleasedReturnValue();

                if (!v33
                  || (v34 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithContentsOfFile:", v33)) == 0)
                {
                  objc_msgSend(v57, "pathForResource:ofType:", v56, CFSTR("plist"));
                  v35 = objc_claimAutoreleasedReturnValue();
                  if (!v35
                    || (v36 = (void *)v35,
                        v34 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithContentsOfFile:", v35),
                        v36,
                        !v34))
                  {
                    v34 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
                  }
                }
                v47 = (void *)v33;
                objc_msgSend(v34, "addObjectsFromArray:", v54);
                v74 = 0u;
                v75 = 0u;
                v72 = 0u;
                v73 = 0u;
                v37 = v34;
                v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
                if (v38)
                {
                  v39 = v38;
                  v40 = *(_QWORD *)v73;
                  do
                  {
                    for (j = 0; j != v39; ++j)
                    {
                      if (*(_QWORD *)v73 != v40)
                        objc_enumerationMutation(v37);
                      v42 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * j);
                      objc_msgSend(v42, "objectForKey:", CFSTR("SCRBrailleInputIdentifier"));
                      v43 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v43)
                      {
                        objc_msgSend(v42, "objectForKey:", CFSTR("SCRCommand"));
                        v44 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v44)
                          objc_msgSend(v29, "setObject:forKey:", v44, v43);
                        objc_msgSend(v31, "addObject:", v43);

                      }
                    }
                    v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
                  }
                  while (v39);
                }

                v24 = v48;
                v28 = v61;
              }

              v45 = objc_alloc_init(SCROMobileBrailleDisplayInputManagerCacheObject);
              -[SCROMobileBrailleDisplayInputManagerCacheObject setDriverIdentifier:](v45, "setDriverIdentifier:", v53);
              -[SCROMobileBrailleDisplayInputManagerCacheObject setModelIdentifier:](v45, "setModelIdentifier:", v56);
              -[SCROMobileBrailleDisplayInputManagerCacheObject setCommandDictionary:](v45, "setCommandDictionary:", v29);
              -[SCROMobileBrailleDisplayInputManagerCacheObject setBundle:](v45, "setBundle:", v57);
              -[SCROMobileBrailleDisplayInputManagerCacheObject setBrailleInputMode:](v45, "setBrailleInputMode:", v28);
              objc_msgSend(v55, "objectForKeyedSubscript:", kSCROBrailleDisplayBrailleProductName[0]);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              -[SCROMobileBrailleDisplayInputManagerCacheObject setProductName:](v45, "setProductName:", v46);

              -[NSMutableDictionary setObject:forKey:](v62->_displayInfoDict, "setObject:forKey:", v45, v63);
              v23 = v53;

              v18 = v49;
              v17 = v50;
              v19 = v51;
            }

          }
          v21 = v63;
        }

        ++v19;
      }
      while (v19 != v17);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
    }
    while (v17);
  }

  -[NSLock unlock](v62->_contentLock, "unlock");
}

- (id)commandDictionaryForDisplayWithToken:(int)a3
{
  void *v5;
  NSMutableDictionary *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[NSLock lock](self->_contentLock, "lock");
  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = self->_displayInfoDict;
  objc_msgSend(v5, "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "commandDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v8, "modelIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCROMobileBrailleDisplayInputManager userDefaultsForModelIdentifier:](self, "userDefaultsForModelIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValuesForKeysWithDictionary:", v12);

  -[NSLock unlock](self->_contentLock, "unlock");
  -[SCROMobileBrailleDisplayInputManager _updatedCommandDictionaryForCommandDictionary:](self, "_updatedCommandDictionaryForCommandDictionary:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)driverIdentifierForDisplayWithToken:(int)a3
{
  void *v5;
  NSMutableDictionary *v6;
  void *v7;
  void *v8;
  void *v9;

  -[NSLock lock](self->_contentLock, "lock");
  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = self->_displayInfoDict;
  objc_msgSend(v5, "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "driverIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock unlock](self->_contentLock, "unlock");

  return v9;
}

- (id)modelIdentifierForDisplayWithToken:(int)a3
{
  void *v5;
  NSMutableDictionary *v6;
  void *v7;
  void *v8;
  void *v9;

  -[NSLock lock](self->_contentLock, "lock");
  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = self->_displayInfoDict;
  objc_msgSend(v5, "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "modelIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock unlock](self->_contentLock, "unlock");

  return v9;
}

- (id)_commandForHidUsage:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  unsigned __int16 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = _commandForHidUsage__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_commandForHidUsage__onceToken, &__block_literal_global_72);
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "integerValue");
  if ((v6 & 0xF) == 6)
    v7 = v6 >> 4;
  else
    v7 = 0;
  v8 = (void *)_commandForHidUsage__hidCommandToCommandMap;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __60__SCROMobileBrailleDisplayInputManager__commandForHidUsage___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[70];
  _QWORD v3[71];

  v3[70] = *MEMORY[0x24BDAC8D0];
  v2[0] = &unk_24CC30EB0;
  v2[1] = &unk_24CC30EC8;
  v3[0] = CFSTR("VOTEventCommandBrailleNextInputTable");
  v3[1] = CFSTR("VOTEventCommandBrailleNextOutputTable");
  v2[2] = &unk_24CC30EE0;
  v2[3] = &unk_24CC30EF8;
  v3[2] = CFSTR("VOTEventCommandBraillePanLeft");
  v3[3] = CFSTR("VOTEventCommandBraillePanRight");
  v2[4] = &unk_24CC30F10;
  v2[5] = &unk_24CC30F28;
  v3[4] = CFSTR("VOTEventCommandBraillePanLeft");
  v3[5] = CFSTR("VOTEventCommandBraillePanRight");
  v2[6] = &unk_24CC30F40;
  v2[7] = &unk_24CC30F58;
  v3[6] = CFSTR("VOTEventCommandDelete");
  v3[7] = CFSTR("VOTEventCommandReturn");
  v2[8] = &unk_24CC30F70;
  v2[9] = &unk_24CC30F88;
  v3[8] = CFSTR("VOTEventCommandEscape");
  v3[9] = CFSTR("VOTEventCommandMoveToStatusBar");
  v2[10] = &unk_24CC30FA0;
  v2[11] = &unk_24CC30FB8;
  v3[10] = CFSTR("VOTEventCommandFirstElement");
  v3[11] = CFSTR("VOTEventCommandLastElement");
  v2[12] = &unk_24CC30FD0;
  v2[13] = &unk_24CC30FE8;
  v3[12] = CFSTR("VOTEventCommandPreviousElement");
  v3[13] = CFSTR("VOTEventCommandNextElement");
  v2[14] = &unk_24CC31000;
  v2[15] = &unk_24CC31018;
  v3[14] = CFSTR("VOTEventCommandReadFromTop");
  v3[15] = CFSTR("VOTEventCommandReadAll");
  v2[16] = &unk_24CC31030;
  v2[17] = &unk_24CC31048;
  v3[16] = CFSTR("VOTEventCommandScrollLeftPage");
  v3[17] = CFSTR("VOTEventCommandScrollRightPage");
  v2[18] = &unk_24CC31060;
  v2[19] = &unk_24CC31078;
  v3[18] = CFSTR("VOTEventCommandScrollUpPage");
  v3[19] = CFSTR("VOTEventCommandScrollDownPage");
  v2[20] = &unk_24CC31090;
  v2[21] = &unk_24CC310A8;
  v3[20] = CFSTR("VOTEventCommandSearchRotorRight");
  v3[21] = CFSTR("VOTEventCommandSearchRotorLeft");
  v2[22] = &unk_24CC310C0;
  v2[23] = &unk_24CC310D8;
  v3[22] = CFSTR("VOTEventCommandSearchRotorUp");
  v3[23] = CFSTR("VOTEventCommandSearchRotorDown");
  v2[24] = &unk_24CC310F0;
  v2[25] = &unk_24CC31108;
  v3[24] = CFSTR("VOTEventCommandSimpleTap");
  v3[25] = CFSTR("VOTEventCommandToggleSpeaking");
  v2[26] = &unk_24CC31120;
  v2[27] = &unk_24CC31138;
  v3[26] = CFSTR("VOTEventCommandStartStopToggle");
  v3[27] = CFSTR("VOTEventCommandHomeButtonPress");
  v2[28] = &unk_24CC31150;
  v2[29] = &unk_24CC31168;
  v3[28] = CFSTR("VOTEventCommandBottomEdgeSingleSwipe");
  v3[29] = CFSTR("VOTEventCommandMoveToStatusBar");
  v2[30] = &unk_24CC31180;
  v2[31] = &unk_24CC31198;
  v3[30] = CFSTR("VOTEventCommandNextHeading");
  v3[31] = CFSTR("VOTEventCommandPreviousHeading");
  v2[32] = &unk_24CC311B0;
  v2[33] = &unk_24CC311C8;
  v3[32] = CFSTR("VOTEventCommandNextGraphic");
  v3[33] = CFSTR("VOTEventCommandPreviousGraphic");
  v2[34] = &unk_24CC311E0;
  v2[35] = &unk_24CC311F8;
  v3[34] = CFSTR("VOTEventCommandNextTable");
  v3[35] = CFSTR("VOTEventCommandPreviousTable");
  v2[36] = &unk_24CC31210;
  v2[37] = &unk_24CC31228;
  v3[36] = CFSTR("VOTEventCommandNextList");
  v3[37] = CFSTR("VOTEventCommandPreviousList");
  v2[38] = &unk_24CC31240;
  v2[39] = &unk_24CC31258;
  v3[38] = CFSTR("VOTEventCommandNextControl");
  v3[39] = CFSTR("VOTEventCommandPreviousControl");
  v2[40] = &unk_24CC31270;
  v2[41] = &unk_24CC31288;
  v3[40] = CFSTR("VOTEventCommandNextBlockquote");
  v3[41] = CFSTR("VOTEventCommandPreviousBlockquote");
  v2[42] = &unk_24CC312A0;
  v2[43] = &unk_24CC312B8;
  v3[42] = CFSTR("VOTEventCommandNextSameBlockquote");
  v3[43] = CFSTR("VOTEventCommandPreviousSameBlockquote");
  v2[44] = &unk_24CC312D0;
  v2[45] = &unk_24CC312E8;
  v3[44] = CFSTR("VOTEventCommandNextLink");
  v3[45] = CFSTR("VOTEventCommandPreviousLink");
  v2[46] = &unk_24CC31300;
  v2[47] = &unk_24CC31318;
  v3[46] = CFSTR("VOTEventCommandNextVisitedLink");
  v3[47] = CFSTR("VOTEventCommandPreviousVisitedLink");
  v2[48] = &unk_24CC31330;
  v2[49] = &unk_24CC31348;
  v3[48] = CFSTR("VOTEventCommandNextSameHeading");
  v3[49] = CFSTR("VOTEventCommandPreviousSameHeading");
  v2[50] = &unk_24CC31360;
  v2[51] = &unk_24CC31378;
  v3[50] = CFSTR("VOTEventCommandNextBoldText");
  v3[51] = CFSTR("VOTEventCommandPreviousBoldText");
  v2[52] = &unk_24CC31390;
  v2[53] = &unk_24CC313A8;
  v3[52] = CFSTR("VOTEventCommandNextItalicText");
  v3[53] = CFSTR("VOTEventCommandPreviousItalicText");
  v2[54] = &unk_24CC313C0;
  v2[55] = &unk_24CC313D8;
  v3[54] = CFSTR("VOTEventCommandNextUnderlineText");
  v3[55] = CFSTR("VOTEventCommandPreviousUnderlineText");
  v2[56] = &unk_24CC313F0;
  v2[57] = &unk_24CC31408;
  v3[56] = CFSTR("VOTEventCommandNextMisspelledWord");
  v3[57] = CFSTR("VOTEventCommandPreviousMisspelledWord");
  v2[58] = &unk_24CC31420;
  v2[59] = &unk_24CC31438;
  v3[58] = CFSTR("VOTEventCommandNextPlainText");
  v3[59] = CFSTR("VOTEventCommandPreviousPlainText");
  v2[60] = &unk_24CC31450;
  v2[61] = &unk_24CC31468;
  v3[60] = CFSTR("VOTEventCommandNextColorChange");
  v3[61] = CFSTR("VOTEventCommandPreviousColorChange");
  v2[62] = &unk_24CC31480;
  v2[63] = &unk_24CC31498;
  v3[62] = CFSTR("VOTEventCommandNextFontChange");
  v3[63] = CFSTR("VOTEventCommandPreviousFontChange");
  v2[64] = &unk_24CC314B0;
  v3[64] = CFSTR("VOTEventCommandNextStyleChange");
  v2[65] = &unk_24CC314C8;
  v3[65] = CFSTR("VOTEventCommandPreviousStyleChange");
  v2[66] = &unk_24CC314E0;
  v3[66] = CFSTR("VOTEventCommandNextSameElement");
  v2[67] = &unk_24CC314F8;
  v3[67] = CFSTR("VOTEventCommandPreviousSameElement");
  v2[68] = &unk_24CC31510;
  v3[68] = CFSTR("VOTEventCommandNextDifferentElement");
  v2[69] = &unk_24CC31528;
  v3[69] = CFSTR("VOTEventCommandPreviousDifferentElement");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 70);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_commandForHidUsage__hidCommandToCommandMap;
  _commandForHidUsage__hidCommandToCommandMap = v0;

}

- (id)_updatedCommandForCommand:(id)a3
{
  id v3;
  __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VOTEventCommandBrailleNextInputMode")) & 1) != 0)
  {
    v4 = CFSTR("VOTEventCommandBrailleNextInputTable");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VOTEventCommandBrailleNextOutputMode")) & 1) != 0)
  {
    v4 = CFSTR("VOTEventCommandBrailleNextOutputTable");
  }
  else
  {
    v4 = (__CFString *)v3;
  }

  return v4;
}

- (id)_updatedCommandDictionaryForCommandDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v11, (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SCROMobileBrailleDisplayInputManager _updatedCommandForCommand:](self, "_updatedCommandForCommand:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)commandForBrailleKey:(id)a3
{
  id v4;
  NSMutableDictionary *displayInfoDict;
  uint64_t v6;
  void *v7;
  NSMutableDictionary *v8;
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

  v4 = a3;
  -[NSLock lock](self->_contentLock, "lock");
  displayInfoDict = self->_displayInfoDict;
  v6 = (int)objc_msgSend(v4, "displayToken");
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = displayInfoDict;
  objc_msgSend(v7, "numberWithInteger:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "modelIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "commandDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");

  -[NSLock unlock](self->_contentLock, "unlock");
  -[SCROMobileBrailleDisplayInputManager userDefaultsForModelIdentifier:](self, "userDefaultsForModelIdentifier:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[SCROMobileBrailleDisplayInputManager _updatedCommandForCommand:](self, "_updatedCommandForCommand:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      -[SCROMobileBrailleDisplayInputManager _commandForHidUsage:](self, "_commandForHidUsage:", v4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[SCROMobileBrailleDisplayInputManager _updatedCommandForCommand:](self, "_updatedCommandForCommand:", v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v17;
}

- (void)setCommand:(id)a3 forBrailleKey:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "identifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "displayToken");

  -[SCROMobileBrailleDisplayInputManager setCommand:forInputIdentifier:forDisplayWithToken:](self, "setCommand:forInputIdentifier:forDisplayWithToken:", v7, v9, v8);
}

- (id)buttonNamesForInputIdentifier:(id)a3 forDisplayWithToken:(int)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int v29;
  int v30;
  const __CFString *v31;
  void *v32;
  uint64_t v33;
  char v34;
  __CFString *v35;
  int v36;
  void *v37;
  uint64_t v38;
  id v39;
  _BOOL8 v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  id obj;
  void *v48;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t v55[128];
  uint8_t buf[4];
  id v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[SCROMobileBrailleDisplayInputManager _bundle](self, "_bundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "hasPrefix:", CFSTR("unassigned")))
  {
    v8 = (void *)MEMORY[0x24BDBCE30];
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("unassigned"), &stru_24CC1DB88, CFSTR("Client"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayWithObject:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NSLock lock](self->_contentLock, "lock");
    v11 = (void *)MEMORY[0x24BDD16E0];
    v12 = self->_displayInfoDict;
    objc_msgSend(v11, "numberWithInteger:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](v12, "objectForKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "bundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "driverIdentifier");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "modelIdentifier");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v14;
    objc_msgSend(v14, "productName");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSLock unlock](self->_contentLock, "unlock");
    _SCROD_LOG();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v57 = v6;
      v58 = 2112;
      v59 = v49;
      v60 = 2112;
      v61 = v45;
      _os_log_impl(&dword_2115BB000, v16, OS_LOG_TYPE_DEFAULT, "Button name %@ for %@ %@", buf, 0x20u);
    }

    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("."));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v6;
    v50 = v7;
    if (objc_msgSend(v17, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    v43 = v15;
    objc_msgSend(v15, "localizedInfoDictionary");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    obj = v17;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v52 != v20)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          if (-[NSSet containsObject:](self->_brailleKeys, "containsObject:", v22))
          {
            objc_msgSend(CFSTR("braille.key"), "stringByAppendingPathExtension:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "localizedStringForKey:value:table:", v23, &stru_24CC1DB88, CFSTR("Client"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v23 = 0;
            v24 = 0;
          }
          if (!objc_msgSend(v24, "length"))
          {
            objc_msgSend(v49, "stringByAppendingPathExtension:", v22);
            v25 = objc_claimAutoreleasedReturnValue();

            if (v25)
            {
              objc_msgSend(v48, "objectForKey:", v25);
              v26 = objc_claimAutoreleasedReturnValue();

              v23 = (void *)v25;
              v24 = (void *)v26;
            }
            else
            {
              v23 = 0;
            }
          }
          if (!objc_msgSend(v24, "length"))
          {
            objc_msgSend(v46, "stringByAppendingPathExtension:", v22);
            v27 = objc_claimAutoreleasedReturnValue();

            if (v27)
            {
              objc_msgSend(v48, "objectForKey:", v27);
              v28 = objc_claimAutoreleasedReturnValue();

              v23 = (void *)v27;
              v24 = (void *)v28;
            }
            else
            {
              v23 = 0;
            }
          }
          if (!objc_msgSend(v24, "length"))
          {
            v29 = objc_msgSend(v22, "integerValue");
            v30 = (v29 >> 17) & 3;
            if (v30)
            {
              if (v30 == 3)
              {
                v31 = CFSTR("HID.joystick.key");
              }
              else if (v30 == 2)
              {
                v31 = CFSTR("HID.rocker.key");
              }
              else
              {
                v31 = CFSTR("HID.button.key");
              }
              objc_msgSend(v50, "localizedStringForKey:value:table:", v31, &stru_24CC1DB88, CFSTR("Client"));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = (v29 & 0xFF000000) != 0;
              SCRCFormattedString();
              v33 = objc_claimAutoreleasedReturnValue();

              v24 = (void *)v33;
            }
          }
          if (!objc_msgSend(v24, "length", v41))
          {
            if (objc_msgSend(v49, "isEqualToString:", CFSTR("com.apple.generic.hid.mobile")))
            {
              v34 = objc_msgSend(v45, "hasPrefix:", CFSTR("Brailliant BI"));
              v35 = CFSTR("com.apple.scrod.braille.driver.humanware.brailliant.BI");
              if ((v34 & 1) != 0
                || (v36 = objc_msgSend(v45, "hasPrefix:", CFSTR("NLS eReader Humanware")),
                    v35 = CFSTR("com.apple.scrod.braille.driver.nls.ereader"),
                    v36))
              {
                -[__CFString stringByAppendingPathExtension:](v35, "stringByAppendingPathExtension:", v22);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "objectForKey:", v37);
                v38 = objc_claimAutoreleasedReturnValue();

                v24 = (void *)v38;
              }
            }
          }
          if (!objc_msgSend(v24, "length"))
          {
            v39 = v22;

            v24 = v39;
          }
          objc_msgSend(v10, "addObject:", v24);

        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
      }
      while (v19);
    }

    v6 = v44;
    v7 = v50;
  }

  return v10;
}

- (void)setCommand:(id)a3 forInputIdentifier:(id)a4 forDisplayWithToken:(int)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = *(_QWORD *)&a5;
  v12 = a3;
  v8 = a4;
  -[SCROMobileBrailleDisplayInputManager modelIdentifierForDisplayWithToken:](self, "modelIdentifierForDisplayWithToken:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCROMobileBrailleDisplayInputManager userDefaultsForModelIdentifier:](self, "userDefaultsForModelIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  if (v12)
    objc_msgSend(v11, "setObject:forKey:", v12, v8);
  else
    objc_msgSend(v11, "removeObjectForKey:", v8);

  -[SCROMobileBrailleDisplayInputManager setUserDefaults:forModelIdentifier:](self, "setUserDefaults:forModelIdentifier:", v11, v9);
}

- (void)removeAllUserAssignedCommandsForDisplayWithToken:(int)a3
{
  id v4;

  -[SCROMobileBrailleDisplayInputManager modelIdentifierForDisplayWithToken:](self, "modelIdentifierForDisplayWithToken:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SCROMobileBrailleDisplayInputManager setUserDefaults:forModelIdentifier:](self, "setUserDefaults:forModelIdentifier:", MEMORY[0x24BDBD1B8], v4);

}

- (unint64_t)userAssignedCommandCountForDisplayWithToken:(int)a3
{
  void *v4;
  void *v5;
  unint64_t v6;

  -[SCROMobileBrailleDisplayInputManager modelIdentifierForDisplayWithToken:](self, "modelIdentifierForDisplayWithToken:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCROMobileBrailleDisplayInputManager userDefaultsForModelIdentifier:](self, "userDefaultsForModelIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (id)_sixDotCommands
{
  NSArray *sixDotCommands;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;

  sixDotCommands = self->_sixDotCommands;
  if (!sixDotCommands)
  {
    -[SCROMobileBrailleDisplayInputManager _bundle](self, "_bundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathForResource:ofType:", CFSTR("6dot.mobile.commands"), CFSTR("plist"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithContentsOfFile:", v5);
      v7 = self->_sixDotCommands;
      self->_sixDotCommands = v6;

    }
    sixDotCommands = self->_sixDotCommands;
  }
  return sixDotCommands;
}

- (id)_eightDotCommands
{
  NSArray *eightDotCommands;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;

  eightDotCommands = self->_eightDotCommands;
  if (!eightDotCommands)
  {
    -[SCROMobileBrailleDisplayInputManager _bundle](self, "_bundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathForResource:ofType:", CFSTR("8dot.mobile.commands"), CFSTR("plist"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithContentsOfFile:", v5);
      v7 = self->_eightDotCommands;
      self->_eightDotCommands = v6;

    }
    eightDotCommands = self->_eightDotCommands;
  }
  return eightDotCommands;
}

- (id)_commandsFromBrailleInputMode:(int)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  if (a3 == 2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCROMobileBrailleDisplayInputManager _sixDotCommands](self, "_sixDotCommands");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v6);

    -[SCROMobileBrailleDisplayInputManager _eightDotCommands](self, "_eightDotCommands");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 != 1)
    {
      v4 = 0;
      return v4;
    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCROMobileBrailleDisplayInputManager _sixDotCommands](self, "_sixDotCommands");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v5;
  objc_msgSend(v4, "addObjectsFromArray:", v5);

  return v4;
}

- (unint64_t)countForDisplayWithToken:(int)a3
{
  void *v5;
  NSMutableDictionary *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;

  -[NSLock lock](self->_contentLock, "lock");
  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = self->_displayInfoDict;
  objc_msgSend(v5, "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "orderedIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  -[NSLock unlock](self->_contentLock, "unlock");
  return v10;
}

- (id)inputIdentifierAtIndex:(unint64_t)a3 forDisplayWithToken:(int)a4
{
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[NSLock lock](self->_contentLock, "lock");
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = self->_displayInfoDict;
  objc_msgSend(v7, "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "orderedIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count") <= a3)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(v11, "objectAtIndex:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[NSLock unlock](self->_contentLock, "unlock");

  return v12;
}

- (id)commandAtIndex:(unint64_t)a3 forDisplayWithToken:(int)a4
{
  uint64_t v4;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = *(_QWORD *)&a4;
  -[NSLock lock](self->_contentLock, "lock");
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = self->_displayInfoDict;
  objc_msgSend(v7, "numberWithInteger:", (int)v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "commandDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCROMobileBrailleDisplayInputManager inputIdentifierAtIndex:forDisplayWithToken:](self, "inputIdentifierAtIndex:forDisplayWithToken:", a3, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSLock unlock](self->_contentLock, "unlock");
  -[SCROMobileBrailleDisplayInputManager _updatedCommandForCommand:](self, "_updatedCommandForCommand:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)buttonNamesAtIndex:(unint64_t)a3 forDisplayWithToken:(int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;

  v4 = *(_QWORD *)&a4;
  -[SCROMobileBrailleDisplayInputManager inputIdentifierAtIndex:forDisplayWithToken:](self, "inputIdentifierAtIndex:forDisplayWithToken:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCROMobileBrailleDisplayInputManager buttonNamesForInputIdentifier:forDisplayWithToken:](self, "buttonNamesForInputIdentifier:forDisplayWithToken:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (__CFString)defaultsKeyForModelIdentifier:(id)a3
{
  return (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("BrailleCommands-%@"), a3);
}

- (id)userDefaultsForModelIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)CFPreferencesCopyAppValue(-[SCROMobileBrailleDisplayInputManager defaultsKeyForModelIdentifier:](self, "defaultsKeyForModelIdentifier:", a3), CFSTR("com.apple.VoiceOverTouch"));
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x24BDBD1B8];
  v5 = v3;

  return v5;
}

- (void)setUserDefaults:(id)a3 forModelIdentifier:(id)a4
{
  id value;

  value = a3;
  CFPreferencesSetAppValue(-[SCROMobileBrailleDisplayInputManager defaultsKeyForModelIdentifier:](self, "defaultsKeyForModelIdentifier:", a4), value, CFSTR("com.apple.VoiceOverTouch"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentLock, 0);
  objc_storeStrong((id *)&self->_eightDotCommands, 0);
  objc_storeStrong((id *)&self->_sixDotCommands, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_brailleKeys, 0);
  objc_storeStrong((id *)&self->_displayInfoDict, 0);
}

@end
