@implementation PersonalizedItemManager

- (PersonalizedItemManager)init
{
  PersonalizedItemManager *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *lock;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  uint64_t v11;
  NSMutableArray *itemSources;
  uint64_t v13;
  NSHashTable *observers;
  PersonalizedItemClientRankingFunction *clientRankingFunction;
  uint64_t v16;
  PersonalizedItemPriorityFunction *priorityFunction;
  uint64_t v18;
  NSMutableArray *itemCompletions;
  uint64_t v20;
  NSMutableArray *itemGroupCompletions;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)PersonalizedItemManager;
  v2 = -[PersonalizedItemManager init](&v23, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("PersonalizedItemManager.lock", v4);
    lock = v2->_lock;
    v2->_lock = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create("PersonalizedItemManager.calculationQueue", v8);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;

    v11 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    itemSources = v2->_itemSources;
    v2->_itemSources = (NSMutableArray *)v11;

    v13 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v13;

    clientRankingFunction = v2->_clientRankingFunction;
    v2->_clientRankingFunction = 0;

    v16 = objc_claimAutoreleasedReturnValue(+[PersonalizedItemPriorityFunction defaultPriorityFunctionForCompoundItemResolution](PersonalizedItemPriorityFunction, "defaultPriorityFunctionForCompoundItemResolution"));
    priorityFunction = v2->_priorityFunction;
    v2->_priorityFunction = (PersonalizedItemPriorityFunction *)v16;

    v18 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    itemCompletions = v2->_itemCompletions;
    v2->_itemCompletions = (NSMutableArray *)v18;

    v20 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    itemGroupCompletions = v2->_itemGroupCompletions;
    v2->_itemGroupCompletions = (NSMutableArray *)v20;

  }
  return v2;
}

- (void)setClientRankingFunction:(id)a3
{
  id v4;
  NSObject *lock;
  id v6;
  _QWORD block[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  lock = self->_lock;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1006982E4;
  block[3] = &unk_1011B31D8;
  block[4] = self;
  v6 = v4;
  v8 = v6;
  v9 = &v10;
  dispatch_sync(lock, block);
  if (*((_BYTE *)v11 + 24))
    -[PersonalizedItemManager _setNeedsRecalculation](self, "_setNeedsRecalculation");

  _Block_object_dispose(&v10, 8);
}

- (PersonalizedItemClientRankingFunction)_clientRankingFunction
{
  NSObject *lock;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1006983DC;
  v10 = sub_1006983EC;
  v11 = 0;
  lock = self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1006983F4;
  v5[3] = &unk_1011ADF48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PersonalizedItemClientRankingFunction *)v3;
}

- (void)setPriorityFunction:(id)a3
{
  id v4;
  NSObject *lock;
  id v6;
  _QWORD block[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  if (!v4)
    v4 = (id)objc_claimAutoreleasedReturnValue(+[PersonalizedItemPriorityFunction defaultPriorityFunctionForCompoundItemResolution](PersonalizedItemPriorityFunction, "defaultPriorityFunctionForCompoundItemResolution"));
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  lock = self->_lock;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1006984F4;
  block[3] = &unk_1011B31D8;
  block[4] = self;
  v6 = v4;
  v8 = v6;
  v9 = &v10;
  dispatch_sync(lock, block);
  if (*((_BYTE *)v11 + 24))
    -[PersonalizedItemManager _setNeedsRecalculation](self, "_setNeedsRecalculation");

  _Block_object_dispose(&v10, 8);
}

- (PersonalizedItemPriorityFunction)_priorityFunction
{
  NSObject *lock;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1006983DC;
  v10 = sub_1006983EC;
  v11 = 0;
  lock = self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1006985EC;
  v5[3] = &unk_1011ADF48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PersonalizedItemPriorityFunction *)v3;
}

- (void)addItemSource:(id)a3
{
  id v4;
  void *v5;
  NSObject *lock;
  _QWORD block[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    lock = self->_lock;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1006986E0;
    block[3] = &unk_1011B3B68;
    v9 = &v10;
    block[4] = self;
    v8 = v4;
    dispatch_sync(lock, block);
    if (!*((_BYTE *)v11 + 24))
      -[PersonalizedItemManager _setNeedsRecalculation](self, "_setNeedsRecalculation");

    _Block_object_dispose(&v10, 8);
  }

}

- (void)removeItemSource:(id)a3
{
  id v4;
  NSObject *lock;
  id v6;
  _QWORD block[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  lock = self->_lock;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10069881C;
  block[3] = &unk_1011B3B68;
  v9 = &v10;
  block[4] = self;
  v6 = v4;
  v8 = v6;
  dispatch_sync(lock, block);
  if (*((_BYTE *)v11 + 24))
    -[PersonalizedItemManager _setNeedsRecalculation](self, "_setNeedsRecalculation");

  _Block_object_dispose(&v10, 8);
}

- (void)setItemSources:(id)a3
{
  id v4;
  id v5;
  NSObject *lock;
  id v7;
  _QWORD block[4];
  id v9;
  PersonalizedItemManager *v10;

  v4 = &__NSArray0__struct;
  if (a3)
    v4 = a3;
  v5 = v4;
  lock = self->_lock;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100698910;
  block[3] = &unk_1011AC8B0;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_sync(lock, block);
  -[PersonalizedItemManager _setNeedsRecalculation](self, "_setNeedsRecalculation");

}

- (void)setUpdatesPaused:(BOOL)a3
{
  NSObject *lock;
  _QWORD block[6];
  BOOL v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  lock = self->_lock;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100698EA8;
  block[3] = &unk_1011BFDB8;
  v6 = a3;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(lock, block);
  if (*((_BYTE *)v8 + 24))
    -[PersonalizedItemManager _recalculateIfNeeded](self, "_recalculateIfNeeded");
  _Block_object_dispose(&v7, 8);
}

- (void)_setNeedsRecalculation
{
  NSObject *lock;
  _QWORD block[5];

  lock = self->_lock;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100699000;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_sync(lock, block);
  -[PersonalizedItemManager _recalculateIfNeeded](self, "_recalculateIfNeeded");
}

- (void)_recalculateIfNeeded
{
  NSObject *lock;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *queue;
  _QWORD v10[7];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD block[8];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _QWORD v26[3];
  int v27;
  _BYTE v28[128];

  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v27 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_1006983DC;
  v24 = sub_1006983EC;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  lock = self->_lock;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1006992C8;
  block[3] = &unk_1011BFDE0;
  block[4] = self;
  block[5] = &v16;
  block[6] = v26;
  block[7] = &v20;
  dispatch_sync(lock, block);
  if (*((_BYTE *)v17 + 24))
  {
    v4 = (void *)v21[5];
    if (v4)
    {
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      v5 = v4;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v28, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v12;
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v12 != v7)
              objc_enumerationMutation(v5);
            objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8), "personalizedItemManagerWillChangeItems:", self);
            v8 = (char *)v8 + 1;
          }
          while (v6 != v8);
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v28, 16);
        }
        while (v6);
      }

    }
    queue = self->_queue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100699428;
    v10[3] = &unk_1011B8078;
    v10[4] = self;
    v10[5] = v26;
    v10[6] = &v20;
    dispatch_async(queue, v10);
  }
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(v26, 8);
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *lock;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  lock = self->_lock;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100699AFC;
  block[3] = &unk_1011AC8B0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(lock, block);

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *lock;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  lock = self->_lock;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100699B84;
  block[3] = &unk_1011AC8B0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(lock, block);

}

- (NSArray)allItems
{
  NSObject *lock;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1006983DC;
  v10 = sub_1006983EC;
  v11 = 0;
  lock = self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100699C44;
  v5[3] = &unk_1011ADF48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (NSArray)itemGroups
{
  NSObject *lock;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1006983DC;
  v10 = sub_1006983EC;
  v11 = 0;
  lock = self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100699D6C;
  v5[3] = &unk_1011ADF48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (NSArray)previousItems
{
  NSObject *lock;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1006983DC;
  v10 = sub_1006983EC;
  v11 = 0;
  lock = self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100699E94;
  v5[3] = &unk_1011ADF48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (NSArray)previousItemGroups
{
  NSObject *lock;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1006983DC;
  v10 = sub_1006983EC;
  v11 = 0;
  lock = self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100699FBC;
  v5[3] = &unk_1011ADF48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)fetchAllItems:(id)a3
{
  id v4;
  NSObject *lock;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  lock = self->_lock;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10069A0AC;
  block[3] = &unk_1011AE240;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(lock, block);

}

- (void)fetchItemsGroups:(id)a3
{
  id v4;
  NSObject *lock;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  lock = self->_lock;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10069A214;
  block[3] = &unk_1011AE240;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(lock, block);

}

- (BOOL)updateInProgress
{
  NSObject *lock;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10069A390;
  v5[3] = &unk_1011ADF48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lock, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_gatherItemsWithShouldCancel:(id)a3 completion:(id)a4
{
  unsigned int (**v6)(void);
  NSObject *lock;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  PersonalizedItemManager *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t Log;
  NSObject *v19;
  os_signpost_id_t v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  id v25;
  NSObject *v26;
  id v27;
  void *v28;
  void *v29;
  __CFString *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  NSObject *v36;
  _BOOL4 v37;
  id v38;
  void *v39;
  objc_class *v40;
  NSString *v41;
  void *v42;
  void *v43;
  void *v44;
  __CFString *v45;
  id v46;
  void *v47;
  objc_class *v48;
  NSString *v49;
  void *v50;
  void *v51;
  void *v52;
  __CFString *v53;
  id v54;
  id v55;
  id v56;
  uint64_t v57;
  void *i;
  uint64_t v59;
  void *v60;
  _BOOL4 v61;
  id v62;
  id v63;
  void *v64;
  void *v65;
  id v66;
  NSObject *v67;
  id v68;
  void *v69;
  objc_class *v70;
  NSString *v71;
  void *v72;
  void *v73;
  void *v74;
  __CFString *v75;
  id v76;
  void *v77;
  BOOL v78;
  id v79;
  id v80;
  void *v81;
  id v82;
  uint64_t v83;
  void *j;
  id v85;
  id v86;
  id v87;
  uint64_t v88;
  void *k;
  uint64_t v90;
  void *v91;
  _BOOL4 v92;
  id v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  id v98;
  uint64_t v99;
  void *n;
  void *v101;
  void *v102;
  void *v103;
  PersonalizedCompoundItem *v104;
  id v105;
  NSObject *v106;
  id v107;
  NSObject *v108;
  PersonalizedCompoundItemGroup *v109;
  id v110;
  NSObject *v111;
  id v112;
  NSObject *v113;
  id v114;
  NSObject *v115;
  uint64_t v116;
  _QWORD *v117;
  uint64_t v118;
  id v119;
  id v120;
  uint64_t v121;
  void *v122;
  id obj;
  id v124;
  unsigned int (**v125)(void);
  void *v126;
  uint64_t v127;
  void *v128;
  uint64_t v129;
  id v130;
  id v131;
  void *v132;
  uint64_t v133;
  void *m;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  _QWORD v167[4];
  NSObject *v168;
  os_signpost_id_t v169;
  _QWORD block[6];
  uint64_t v171;
  uint64_t *v172;
  uint64_t v173;
  uint64_t (*v174)(uint64_t, uint64_t);
  void (*v175)(uint64_t);
  id v176;
  PersonalizedCompoundItemGroup *v177;
  _BYTE v178[128];
  _BYTE v179[128];
  _BYTE v180[128];
  _BYTE v181[128];
  _BYTE v182[128];
  _BYTE v183[128];
  uint8_t v184[128];
  uint8_t buf[4];
  id v186;
  __int16 v187;
  id v188;
  _BYTE v189[128];

  v6 = (unsigned int (**)(void))a3;
  v119 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v171 = 0;
  v172 = &v171;
  v173 = 0x3032000000;
  v174 = sub_1006983DC;
  v175 = sub_1006983EC;
  v176 = 0;
  lock = self->_lock;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10069B63C;
  block[3] = &unk_1011ADF48;
  block[5] = &v171;
  block[4] = self;
  dispatch_sync(lock, block);
  v125 = v6;
  LODWORD(v6) = ((uint64_t (*)(unsigned int (**)(void)))v6[2])(v6);
  v8 = sub_100698DB0();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if ((_DWORD)v6)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Cancelling gather items before starting", buf, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v119 + 2))(v119, 0, 0);
    goto LABEL_155;
  }
  if (v10)
  {
    v11 = self;
    v12 = (objc_class *)objc_opt_class(v11);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if ((objc_opt_respondsToSelector(v11, "accessibilityIdentifier") & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedItemManager performSelector:](v11, "performSelector:", "accessibilityIdentifier"));
      v16 = v15;
      if (v15 && (objc_msgSend(v15, "isEqualToString:", v14) & 1) == 0)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v14, v11, v16));

        goto LABEL_11;
      }

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v14, v11));
LABEL_11:

    *(_DWORD *)buf = 138412290;
    v186 = v17;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@ Starting to gather items...", buf, 0xCu);

  }
  Log = GEOFindOrCreateLog(objc_msgSend(CFSTR("com.apple.Maps"), "UTF8String"), "PersonalizedItemManager");
  v19 = objc_claimAutoreleasedReturnValue(Log);
  v20 = os_signpost_id_generate(v19);
  v21 = v19;
  v22 = v21;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "GatherItems", ", buf, 2u);
  }

  v167[0] = _NSConcreteStackBlock;
  v167[1] = 3221225472;
  v167[2] = sub_10069B674;
  v167[3] = &unk_1011AD518;
  v115 = v22;
  v168 = v115;
  v169 = v20;
  v117 = objc_retainBlock(v167);
  v23 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)v172[5], "sortedArrayUsingComparator:", &stru_1011BFE98));
  v24 = (void *)v172[5];
  v172[5] = v23;

  v25 = sub_100698DB0();
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    v27 = (id)v172[5];
    v28 = v27;
    if (v27)
    {
      if (objc_msgSend(v27, "count"))
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "componentsJoinedByString:", CFSTR(", ")));
        v30 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> [%@]"), v28, v29));

      }
      else
      {
        v30 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v28));
      }
    }
    else
    {
      v30 = CFSTR("<nil>");
    }

    *(_DWORD *)buf = 138412290;
    v186 = v30;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "- Sorted sources: %@", buf, 0xCu);

  }
  v132 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v165 = 0u;
  v166 = 0u;
  v163 = 0u;
  v164 = 0u;
  obj = (id)v172[5];
  v114 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v163, v189, 16);
  if (v114)
  {
    v116 = *(_QWORD *)v164;
LABEL_24:
    v118 = 0;
LABEL_25:
    if (*(_QWORD *)v164 != v116)
      objc_enumerationMutation(obj);
    v122 = *(void **)(*((_QWORD *)&v163 + 1) + 8 * v118);
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "allItems"));
    v33 = objc_msgSend(v32, "copy");

    v34 = objc_msgSend(v33, "count");
    v35 = sub_100698DB0();
    v36 = objc_claimAutoreleasedReturnValue(v35);
    v37 = os_log_type_enabled(v36, OS_LOG_TYPE_INFO);
    if (v34)
    {
      if (!v37)
        goto LABEL_48;
      v38 = v122;
      v39 = v38;
      if (!v38)
      {
        v45 = CFSTR("<nil>");
        goto LABEL_45;
      }
      v40 = (objc_class *)objc_opt_class(v38);
      v41 = NSStringFromClass(v40);
      v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
      if ((objc_opt_respondsToSelector(v39, "accessibilityIdentifier") & 1) != 0)
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "performSelector:", "accessibilityIdentifier"));
        v44 = v43;
        if (v43 && (objc_msgSend(v43, "isEqualToString:", v42) & 1) == 0)
        {
          v45 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v42, v39, v44));

          goto LABEL_35;
        }

      }
      v45 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v42, v39));
LABEL_35:

LABEL_45:
      *(_DWORD *)buf = 138412546;
      v186 = v45;
      v187 = 2112;
      v188 = v33;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "- %@: all items = %@", buf, 0x16u);

      goto LABEL_48;
    }
    if (!v37)
      goto LABEL_48;
    v46 = v122;
    v47 = v46;
    if (!v46)
    {
      v53 = CFSTR("<nil>");
      goto LABEL_47;
    }
    v48 = (objc_class *)objc_opt_class(v46);
    v49 = NSStringFromClass(v48);
    v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
    if ((objc_opt_respondsToSelector(v47, "accessibilityIdentifier") & 1) != 0)
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "performSelector:", "accessibilityIdentifier"));
      v52 = v51;
      if (v51 && (objc_msgSend(v51, "isEqualToString:", v50) & 1) == 0)
      {
        v53 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v50, v47, v52));

        goto LABEL_43;
      }

    }
    v53 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v50, v47));
LABEL_43:

LABEL_47:
    *(_DWORD *)buf = 138412290;
    v186 = v53;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "- %@: no items", buf, 0xCu);

LABEL_48:
    v161 = 0u;
    v162 = 0u;
    v159 = 0u;
    v160 = 0u;
    v124 = v33;
    v120 = objc_msgSend(v124, "countByEnumeratingWithState:objects:count:", &v159, v184, 16);
    if (!v120)
      goto LABEL_117;
    v121 = *(_QWORD *)v160;
LABEL_50:
    v127 = 0;
    while (1)
    {
      if (*(_QWORD *)v160 != v121)
        objc_enumerationMutation(v124);
      v128 = *(void **)(*((_QWORD *)&v159 + 1) + 8 * v127);
      if (v125[2]())
      {
        v112 = sub_100698DB0();
        v113 = objc_claimAutoreleasedReturnValue(v112);
        if (os_log_type_enabled(v113, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_INFO, "- Cancelling gather items partway", buf, 2u);
        }

        ((void (*)(void))v117[2])();
        (*((void (**)(id, _QWORD, _QWORD))v119 + 2))(v119, 0, 0);

        goto LABEL_154;
      }
      v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "keys"));
      if (objc_msgSend(v122, "sourceType") == (id)1)
      {
        v54 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](NSMutableSet, "setWithObject:", v128));
        objc_msgSend(v132, "addObject:", v54);
        v157 = 0u;
        v158 = 0u;
        v155 = 0u;
        v156 = 0u;
        v55 = v126;
        v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v155, v183, 16);
        if (v56)
        {
          v57 = *(_QWORD *)v156;
          do
          {
            for (i = 0; i != v56; i = (char *)i + 1)
            {
              if (*(_QWORD *)v156 != v57)
                objc_enumerationMutation(v55);
              v59 = *(_QWORD *)(*((_QWORD *)&v155 + 1) + 8 * (_QWORD)i);
              v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", v59));
              v61 = v60 == 0;

              if (v61)
                objc_msgSend(v31, "setObject:forKeyedSubscript:", v54, v59);
            }
            v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v155, v183, 16);
          }
          while (v56);
        }
        goto LABEL_115;
      }
      v153 = 0u;
      v154 = 0u;
      v151 = 0u;
      v152 = 0u;
      v130 = v126;
      v62 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v151, v182, 16);
      if (!v62)
      {

        goto LABEL_104;
      }
      v63 = 0;
      v133 = *(_QWORD *)v152;
      do
      {
        v64 = 0;
        do
        {
          if (*(_QWORD *)v152 != v133)
            objc_enumerationMutation(v130);
          v65 = *(void **)(*((_QWORD *)&v151 + 1) + 8 * (_QWORD)v64);
          v66 = sub_100698DB0();
          v67 = objc_claimAutoreleasedReturnValue(v66);
          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
          {
            v68 = v128;
            v69 = v68;
            if (v128)
            {
              v70 = (objc_class *)objc_opt_class(v68);
              v71 = NSStringFromClass(v70);
              v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
              if ((objc_opt_respondsToSelector(v69, "accessibilityIdentifier") & 1) == 0)
                goto LABEL_76;
              v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "performSelector:", "accessibilityIdentifier"));
              v74 = v73;
              if (v73 && (objc_msgSend(v73, "isEqualToString:", v72) & 1) == 0)
              {
                v75 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v72, v69, v74));

              }
              else
              {

LABEL_76:
                v75 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v72, v69));
              }

            }
            else
            {
              v75 = CFSTR("<nil>");
            }

            *(_DWORD *)buf = 138412546;
            v186 = v75;
            v187 = 2112;
            v188 = v65;
            _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "PersonalizedItem: %@ is mapped to : %@", buf, 0x16u);

          }
          v76 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", v65));
          v77 = v76;
          if (v76)
            v78 = v76 == v63;
          else
            v78 = 1;
          if (!v78)
          {
            if (v63)
            {
              objc_msgSend(v63, "unionSet:", v76);
              v79 = objc_msgSend(v132, "indexOfObject:", v77);
              v80 = objc_msgSend(v132, "indexOfObject:", v63);
              if (v80 >= v79)
              {
                objc_msgSend(v132, "removeObjectAtIndex:", v80);
                objc_msgSend(v132, "setObject:atIndexedSubscript:", v63, v79);
              }
              else
              {
                objc_msgSend(v132, "removeObjectAtIndex:", v79);
              }
              objc_msgSend(v31, "setObject:forKeyedSubscript:", v63, v65);
              v149 = 0u;
              v150 = 0u;
              v147 = 0u;
              v148 = 0u;
              v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "allKeysForObject:", v77));
              v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v147, v181, 16);
              if (v82)
              {
                v83 = *(_QWORD *)v148;
                do
                {
                  for (j = 0; j != v82; j = (char *)j + 1)
                  {
                    if (*(_QWORD *)v148 != v83)
                      objc_enumerationMutation(v81);
                    objc_msgSend(v31, "setObject:forKeyedSubscript:", v63, *(_QWORD *)(*((_QWORD *)&v147 + 1) + 8 * (_QWORD)j));
                  }
                  v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v147, v181, 16);
                }
                while (v82);
              }

            }
            else
            {
              v63 = v76;
            }
          }

          v64 = (char *)v64 + 1;
        }
        while (v64 != v62);
        v85 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v151, v182, 16);
        v62 = v85;
      }
      while (v85);

      if (v63)
      {
        v54 = v63;
        objc_msgSend(v54, "addObject:", v128);
        v55 = v54;
        goto LABEL_105;
      }
LABEL_104:
      v55 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](NSMutableSet, "setWithObject:", v128));
      objc_msgSend(v132, "addObject:", v55);
      v54 = 0;
LABEL_105:
      v145 = 0u;
      v146 = 0u;
      v143 = 0u;
      v144 = 0u;
      v86 = v130;
      v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v143, v180, 16);
      if (v87)
      {
        v88 = *(_QWORD *)v144;
        do
        {
          for (k = 0; k != v87; k = (char *)k + 1)
          {
            if (*(_QWORD *)v144 != v88)
              objc_enumerationMutation(v86);
            v90 = *(_QWORD *)(*((_QWORD *)&v143 + 1) + 8 * (_QWORD)k);
            v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", v90));
            v92 = v91 == 0;

            if (v92)
              objc_msgSend(v31, "setObject:forKeyedSubscript:", v55, v90);
          }
          v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v143, v180, 16);
        }
        while (v87);
      }

LABEL_115:
      if ((id)++v127 == v120)
      {
        v120 = objc_msgSend(v124, "countByEnumeratingWithState:objects:count:", &v159, v184, 16);
        if (v120)
          goto LABEL_50;
LABEL_117:

        if ((id)++v118 == v114)
        {
          v93 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v163, v189, 16);
          v114 = v93;
          if (!v93)
            break;
          goto LABEL_24;
        }
        goto LABEL_25;
      }
    }
  }

  obj = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v141 = 0u;
  v142 = 0u;
  v139 = 0u;
  v140 = 0u;
  v124 = v132;
  v131 = objc_msgSend(v124, "countByEnumeratingWithState:objects:count:", &v139, v179, 16);
  if (v131)
  {
    v129 = *(_QWORD *)v140;
    while (2)
    {
      for (m = 0; m != v131; m = (char *)m + 1)
      {
        if (*(_QWORD *)v140 != v129)
          objc_enumerationMutation(v124);
        v94 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * (_QWORD)m);
        if (v125[2]())
        {
          v110 = sub_100698DB0();
          v111 = objc_claimAutoreleasedReturnValue(v110);
          if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_INFO, "- Cancelling gather items partway", buf, 2u);
          }

          ((void (*)(void))v117[2])();
          (*((void (**)(id, _QWORD, _QWORD))v119 + 2))(v119, 0, 0);
          goto LABEL_154;
        }
        v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        v137 = 0u;
        v138 = 0u;
        v135 = 0u;
        v136 = 0u;
        v97 = v94;
        v98 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v135, v178, 16);
        if (v98)
        {
          v99 = *(_QWORD *)v136;
          do
          {
            for (n = 0; n != v98; n = (char *)n + 1)
            {
              if (*(_QWORD *)v136 != v99)
                objc_enumerationMutation(v97);
              v101 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * (_QWORD)n);
              if ((objc_opt_respondsToSelector(v101, "eventDate") & 1) != 0
                && (v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "eventDate"))) != 0)
              {
                objc_msgSend(v96, "addObject:", v101);
              }
              else
              {
                objc_msgSend(v95, "addObject:", v101);
                v102 = 0;
              }

            }
            v98 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v135, v178, 16);
          }
          while (v98);
        }

        objc_msgSend(v96, "sortUsingComparator:", &stru_1011BFED8);
        v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "firstObject"));
        if (v103)
          objc_msgSend(v95, "addObject:", v103);
        v104 = -[PersonalizedCompoundItem initWithItems:]([PersonalizedCompoundItem alloc], "initWithItems:", v95);
        v105 = sub_100698DB0();
        v106 = objc_claimAutoreleasedReturnValue(v105);
        if (os_log_type_enabled(v106, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v186 = v104;
          _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_INFO, "- - Create compound item: %@", buf, 0xCu);
        }

        objc_msgSend(obj, "addObject:", v104);
      }
      v131 = objc_msgSend(v124, "countByEnumeratingWithState:objects:count:", &v139, v179, 16);
      if (v131)
        continue;
      break;
    }
  }

  v107 = sub_100698DB0();
  v108 = objc_claimAutoreleasedReturnValue(v107);
  if (os_log_type_enabled(v108, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v186 = obj;
    _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_INFO, "- Finalized compound items: %@", buf, 0xCu);
  }

  v109 = -[PersonalizedCompoundItemGroup initWithItems:]([PersonalizedCompoundItemGroup alloc], "initWithItems:", obj);
  v177 = v109;
  v124 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v177, 1));

  ((void (*)(void))v117[2])();
  (*((void (**)(id, id, id))v119 + 2))(v119, obj, v124);
LABEL_154:

LABEL_155:
  _Block_object_dispose(&v171, 8);

}

- (id)itemsMatchingSearchableString:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("SELF LIKE[cdl] %@"), v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedItemManager _itemsFilteredBySearchableString:predicate:](self, "_itemsFilteredBySearchableString:predicate:", v4, v5));

  return v6;
}

- (id)itemsContainingSearchableString:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("SELF contains[cdl] %@"), v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedItemManager _itemsFilteredBySearchableString:predicate:](self, "_itemsFilteredBySearchableString:predicate:", v4, v5));

  return v6;
}

- (id)_itemsFilteredBySearchableString:(id)a3 predicate:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PersonalizedItemManager allItems](self, "allItems", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "searchableStrings"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "filteredArrayUsingPredicate:", v5));
        if (objc_msgSend(v14, "count"))
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mapItem"));

          if (v15)
            objc_msgSend(v6, "addObject:", v12);
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  v16 = objc_msgSend(v6, "copy");
  return v16;
}

- (NSArray)itemSources
{
  return &self->_itemSources->super;
}

- (BOOL)updatesPaused
{
  return self->_updatesPaused;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priorityFunction, 0);
  objc_storeStrong((id *)&self->_clientRankingFunction, 0);
  objc_storeStrong((id *)&self->_itemGroupCompletions, 0);
  objc_storeStrong((id *)&self->_itemCompletions, 0);
  objc_storeStrong((id *)&self->_itemGroups, 0);
  objc_storeStrong((id *)&self->_allItems, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_itemSources, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
