@implementation TUIRenderUpdateCollection

- (TUIRenderUpdateCollection)initWithFrom:(id)a3 to:(id)a4 viewState:(id)a5 updates:(id)a6 changes:(id)a7 layoutQueue:(id)a8 flags:(unint64_t)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  TUIRenderUpdateCollection *v21;
  TUIRenderUpdateCollection *v22;
  TUIFeedViewState *v23;
  TUIFeedViewState *viewState;
  id v26;
  objc_super v27;

  v26 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v27.receiver = self;
  v27.super_class = (Class)TUIRenderUpdateCollection;
  v21 = -[TUIRenderUpdateCollection init](&v27, "init");
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_from, a3);
    objc_storeStrong((id *)&v22->_to, a4);
    v23 = (TUIFeedViewState *)objc_msgSend(v17, "copy");
    viewState = v22->_viewState;
    v22->_viewState = v23;

    objc_storeStrong((id *)&v22->_changes, a7);
    v22->_flags = a9;
    if (v22->_from != v22->_to)
      -[TUIRenderUpdateCollection _computeWithUpdates:layoutQueue:](v22, "_computeWithUpdates:layoutQueue:", v18, v20);
  }

  return v22;
}

- (id)_computeFromPlusInsertsWithFrom:(id)a3 to:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  char *v14;
  void *v15;
  char *v16;
  char *v17;
  id v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v5 = a3;
  v20 = a4;
  v6 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithArray:", v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v5));
  objc_msgSend(v6, "minusSet:", v7);

  v8 = objc_msgSend(v5, "mutableCopy");
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v20;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v9);
        v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v6, "containsObject:", v13) & 1) != 0)
        {
          v14 = (char *)objc_msgSend(v9, "indexOfObject:", v13);
          if (v14)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v14 - 1));
            v16 = (char *)objc_msgSend(v8, "indexOfObject:", v15);

            v17 = v16 + 1;
          }
          else
          {
            v17 = 0;
          }
          objc_msgSend(v8, "insertObject:atIndex:", v13, v17);
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  v18 = objc_msgSend(v8, "copy");
  return v18;
}

- (id)_computeUpdatedWithFrom:(id)a3 to:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithArray:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v5));
  objc_msgSend(v7, "intersectSet:", v8);

  v9 = objc_msgSend(v7, "copy");
  return v9;
}

- (void)_computeSectionUpdates:(void *)a3 from:(id)a4 to:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  id v15;
  unint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char *v24;
  char *v25;
  char *v26;
  __int128 v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *j;
  uint64_t v33;
  unint64_t v34;
  _QWORD *v35;
  char *v36;
  _QWORD *v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  char *v42;
  char *v43;
  char *v44;
  __int128 v45;
  id v46;
  id v47;
  id v48;
  id obj;
  id v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];

  v7 = a4;
  v48 = a5;
  v51 = v7;
  v47 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithArray:", v7);
  v50 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithArray:", v48);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v48));
  objc_msgSend(v47, "minusSet:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v7));
  objc_msgSend(v50, "minusSet:", v9);

  v46 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithArray:", v48);
  objc_msgSend(v46, "minusSet:", v50);
  v10 = objc_msgSend(v7, "mutableCopy");
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v47;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v57 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)i);
        v15 = objc_msgSend(v51, "indexOfObject:", v14);
        objc_msgSend(v10, "removeObject:", v14);
        v17 = (_QWORD *)*((_QWORD *)a3 + 1);
        v16 = *((_QWORD *)a3 + 2);
        if ((unint64_t)v17 >= v16)
        {
          v19 = *(_QWORD **)a3;
          v20 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v17 - *(_QWORD *)a3) >> 3);
          v21 = v20 + 1;
          if (v20 + 1 > 0xAAAAAAAAAAAAAAALL)
            sub_6F9C();
          v22 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v16 - (_QWORD)v19) >> 3);
          if (2 * v22 > v21)
            v21 = 2 * v22;
          if (v22 >= 0x555555555555555)
            v23 = 0xAAAAAAAAAAAAAAALL;
          else
            v23 = v21;
          if (v23)
          {
            v24 = (char *)sub_14C10((uint64_t)a3 + 16, v23);
            v19 = *(_QWORD **)a3;
            v17 = (_QWORD *)*((_QWORD *)a3 + 1);
          }
          else
          {
            v24 = 0;
          }
          v25 = &v24[24 * v20];
          *(_QWORD *)v25 = 1;
          *((_QWORD *)v25 + 1) = v15;
          *((_QWORD *)v25 + 2) = 0x7FFFFFFFFFFFFFFFLL;
          v26 = v25;
          if (v17 != v19)
          {
            do
            {
              v27 = *(_OWORD *)(v17 - 3);
              *((_QWORD *)v26 - 1) = *(v17 - 1);
              *(_OWORD *)(v26 - 24) = v27;
              v26 -= 24;
              v17 -= 3;
            }
            while (v17 != v19);
            v19 = *(_QWORD **)a3;
          }
          v18 = v25 + 24;
          *(_QWORD *)a3 = v26;
          *((_QWORD *)a3 + 1) = v25 + 24;
          *((_QWORD *)a3 + 2) = &v24[24 * v23];
          if (v19)
            operator delete(v19);
        }
        else
        {
          *v17 = 1;
          v17[1] = v15;
          v18 = v17 + 3;
          v17[2] = 0x7FFFFFFFFFFFFFFFLL;
        }
        *((_QWORD *)a3 + 1) = v18;
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    }
    while (v11);
  }

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v28 = v48;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
  if (v29)
  {
    v30 = 0;
    v31 = *(_QWORD *)v53;
    do
    {
      for (j = 0; j != v29; j = (char *)j + 1)
      {
        if (*(_QWORD *)v53 != v31)
          objc_enumerationMutation(v28);
        v33 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)j);
        if (objc_msgSend(v50, "containsObject:", v33))
        {
          v35 = (_QWORD *)*((_QWORD *)a3 + 1);
          v34 = *((_QWORD *)a3 + 2);
          if ((unint64_t)v35 >= v34)
          {
            v37 = *(_QWORD **)a3;
            v38 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v35 - *(_QWORD *)a3) >> 3);
            v39 = v38 + 1;
            if (v38 + 1 > 0xAAAAAAAAAAAAAAALL)
              sub_6F9C();
            v40 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v34 - (_QWORD)v37) >> 3);
            if (2 * v40 > v39)
              v39 = 2 * v40;
            if (v40 >= 0x555555555555555)
              v41 = 0xAAAAAAAAAAAAAAALL;
            else
              v41 = v39;
            if (v41)
            {
              v42 = (char *)sub_14C10((uint64_t)a3 + 16, v41);
              v37 = *(_QWORD **)a3;
              v35 = (_QWORD *)*((_QWORD *)a3 + 1);
            }
            else
            {
              v42 = 0;
            }
            v43 = &v42[24 * v38];
            *(_OWORD *)v43 = xmmword_22F370;
            *((_QWORD *)v43 + 2) = v30;
            v44 = v43;
            if (v35 != v37)
            {
              do
              {
                v45 = *(_OWORD *)(v35 - 3);
                *((_QWORD *)v44 - 1) = *(v35 - 1);
                *(_OWORD *)(v44 - 24) = v45;
                v44 -= 24;
                v35 -= 3;
              }
              while (v35 != v37);
              v37 = *(_QWORD **)a3;
            }
            v36 = v43 + 24;
            *(_QWORD *)a3 = v44;
            *((_QWORD *)a3 + 1) = v43 + 24;
            *((_QWORD *)a3 + 2) = &v42[24 * v41];
            if (v37)
              operator delete(v37);
          }
          else
          {
            *(_OWORD *)v35 = xmmword_22F370;
            v35[2] = v30;
            v36 = (char *)(v35 + 3);
          }
          *((_QWORD *)a3 + 1) = v36;
          objc_msgSend(v10, "insertObject:atIndex:", v33, v30);
        }
        ++v30;
      }
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    }
    while (v29);
  }

}

- (void)_computeWithUpdates:(id)a3 layoutQueue:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *j;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  TUIRenderUpdateSection *v43;
  NSMutableArray *v44;
  unsigned __int8 v45;
  unsigned __int8 v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  TUIRenderUpdateSection *v53;
  TUIRenderUpdateSection *v54;
  _TUIRenderUpdateCollectionSectionChanges *v55;
  _TUIRenderUpdateCollectionSectionChanges *sectionChangesFrom2To;
  TUIRenderModelCollection *v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  void *v72;
  unint64_t v73;
  void *v74;
  void *v75;
  TUIRenderModelCollection *v76;
  _TUIRenderUpdateCollectionSectionChanges *v77;
  _TUIRenderUpdateCollectionSectionChanges *sectionChangesFrom2FromPlusInserts;
  TUIRenderModelCollection *v79;
  void *v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  void *v93;
  void *v94;
  void *v95;
  unint64_t v96;
  void *v97;
  void *v98;
  TUIRenderModelCollection *v99;
  _TUIRenderUpdateCollectionSectionChanges *v100;
  _TUIRenderUpdateCollectionSectionChanges *sectionChangesFromPlusInserts2To;
  _TUIRenderUpdateCollectionSectionChanges *v102;
  _TUIRenderUpdateCollectionSectionChanges *v103;
  void *v104;
  id v105;
  void *v106;
  id v107;
  id v108;
  id v109;
  NSMutableArray *v110;
  NSMutableArray *v111;
  NSMutableArray *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  id obj;
  id v117;
  NSMutableArray *v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _BYTE v127[128];
  _BYTE v128[128];

  v109 = a3;
  v105 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelCollection sections](self->_from, "sections"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForKey:", CFSTR("UUID")));
  v8 = (void *)v7;
  if (v7)
    v9 = (void *)v7;
  else
    v9 = &__NSArray0__struct;
  v117 = v9;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelCollection sections](self->_to, "sections"));
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForKey:", CFSTR("UUID")));
  v12 = (void *)v11;
  if (v11)
    v13 = (void *)v11;
  else
    v13 = &__NSArray0__struct;
  v14 = v13;

  v115 = v14;
  v106 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderUpdateCollection _computeFromPlusInsertsWithFrom:to:](self, "_computeFromPlusInsertsWithFrom:to:", v117, v14));
  -[TUIRenderUpdateCollection _computeSectionUpdates:from:to:](self, "_computeSectionUpdates:from:to:", &self->_sectionUpdatesFrom2To, v117, v14);
  -[TUIRenderUpdateCollection _computeSectionUpdates:from:to:](self, "_computeSectionUpdates:from:to:", &self->_sectionUpdatesFrom2FromPlusInserts, v117, v106);
  -[TUIRenderUpdateCollection _computeSectionUpdates:from:to:](self, "_computeSectionUpdates:from:to:", &self->_sectionUpdatesFromPlusInserts2To, v106, v14);
  self->_hasChangesToApply = self->_sectionUpdatesFrom2To.__end_ != self->_sectionUpdatesFrom2To.__begin_;
  self->_hasInvalidationsToApply = 0;
  v118 = objc_opt_new(NSMutableArray);
  v125 = 0u;
  v126 = 0u;
  v123 = 0u;
  v124 = 0u;
  obj = v106;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v123, v128, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v124;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v124 != v16)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v123 + 1) + 8 * (_QWORD)i);
        v19 = objc_msgSend(v117, "indexOfObject:", v18);
        if (v19 == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          v20 = objc_msgSend(v115, "indexOfObject:", v18);
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelCollection sections](self->_to, "sections"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", v20));
          v23 = objc_msgSend(v22, "copyForInitialAppearanceWithFlags:", 0);

        }
        else
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelCollection sections](self->_from, "sections"));
          v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", v19));
        }

        v24 = -[NSMutableArray count](v118, "count");
        objc_msgSend(v23, "offset");
        v26 = v25;
        v28 = v27;
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "UUID"));
        v30 = objc_msgSend(v23, "copyWithSection:offset:uuid:", v24, v29, v26, v28);

        -[NSMutableArray addObject:](v118, "addObject:", v30);
      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v123, v128, 16);
    }
    while (v15);
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelCollection sections](self->_to, "sections"));
  v107 = objc_msgSend(v31, "mutableCopy");

  v121 = 0u;
  v122 = 0u;
  v119 = 0u;
  v120 = 0u;
  v104 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderUpdateCollection _computeUpdatedWithFrom:to:](self, "_computeUpdatedWithFrom:to:", obj, v115));
  v108 = objc_msgSend(v104, "copy");
  v32 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v119, v127, 16);
  if (v32)
  {
    v111 = 0;
    v112 = 0;
    v110 = 0;
    v113 = *(_QWORD *)v120;
    do
    {
      for (j = 0; j != v32; j = (char *)j + 1)
      {
        if (*(_QWORD *)v120 != v113)
          objc_enumerationMutation(v108);
        v34 = *(_QWORD *)(*((_QWORD *)&v119 + 1) + 8 * (_QWORD)j);
        v35 = objc_msgSend(v117, "indexOfObject:", v34);
        v36 = objc_msgSend(v115, "indexOfObject:", v34);
        v37 = objc_msgSend(obj, "indexOfObject:", v34);
        if (v35 == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          v38 = 0;
        }
        else
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelCollection sections](self->_from, "sections"));
          v38 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectAtIndexedSubscript:", v35));

        }
        if (v37 == (id)0x7FFFFFFFFFFFFFFFLL)
          v40 = 0;
        else
          v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v118, "objectAtIndexedSubscript:", v37));
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelCollection sections](self->_to, "sections"));
        v42 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectAtIndexedSubscript:", v36));

        if (v38 != v42)
        {
          if (v38 && v42)
          {
            v43 = -[TUIRenderUpdateSection initWithFrom:to:]([TUIRenderUpdateSection alloc], "initWithFrom:to:", v38, v42);
            v44 = v110;
            if (!v110)
              v44 = objc_opt_new(NSMutableArray);
            v110 = v44;
            -[NSMutableArray addObject:](v44, "addObject:", v43);
            if (self->_hasChangesToApply)
              v45 = 1;
            else
              v45 = -[TUIRenderUpdateSection hasChangesToApply](v43, "hasChangesToApply");
            self->_hasChangesToApply = v45;
            if (self->_hasInvalidationsToApply)
              v46 = 1;
            else
              v46 = -[TUIRenderUpdateSection hasInvalidationsToApply](v43, "hasInvalidationsToApply");
            self->_hasInvalidationsToApply = v46;

          }
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "UUID"));
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "objectForKeyedSubscript:", v47));
          v49 = objc_msgSend(v48, "newCurrentContainerPlusInserted");
          v50 = v49;
          if (v49)
            v51 = v49;
          else
            v51 = v40;
          v52 = v51;

          v40 = v52;
          if (v52 != v38 && v52)
            -[NSMutableArray replaceObjectAtIndex:withObject:](v118, "replaceObjectAtIndex:withObject:", objc_msgSend(v52, "section"), v52);
          if (v52 && v38 && v52 != v38)
          {
            if (!v112)
              v112 = objc_opt_new(NSMutableArray);
            v53 = -[TUIRenderUpdateSection initWithFrom:to:]([TUIRenderUpdateSection alloc], "initWithFrom:to:", v38, v52);
            -[NSMutableArray addObject:](v112, "addObject:", v53);

          }
          if (v42 && v52 != v42 && v52)
          {
            if (!v111)
              v111 = objc_opt_new(NSMutableArray);
            v54 = -[TUIRenderUpdateSection initWithFrom:to:]([TUIRenderUpdateSection alloc], "initWithFrom:to:", v52, v42);
            -[NSMutableArray addObject:](v111, "addObject:", v54);

          }
        }

      }
      v32 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v119, v127, 16);
    }
    while (v32);
  }
  else
  {
    v111 = 0;
    v112 = 0;
    v110 = 0;
  }

  v55 = -[_TUIRenderUpdateCollectionSectionChanges initWithSectionUpdates:model:]([_TUIRenderUpdateCollectionSectionChanges alloc], "initWithSectionUpdates:model:", v110, self->_to);
  sectionChangesFrom2To = self->_sectionChangesFrom2To;
  self->_sectionChangesFrom2To = v55;

  if (-[NSMutableArray count](v112, "count")
    || self->_sectionUpdatesFrom2FromPlusInserts.__end_ != self->_sectionUpdatesFrom2FromPlusInserts.__begin_)
  {
    v57 = [TUIRenderModelCollection alloc];
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelCollection content](self->_from, "content"));
    -[TUIRenderModelCollection size](self->_from, "size");
    v60 = v59;
    v62 = v61;
    -[TUIRenderModelCollection insets](self->_from, "insets");
    v64 = v63;
    v66 = v65;
    v68 = v67;
    v70 = v69;
    v114 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelCollection visibleBoundsObservers](self->_from, "visibleBoundsObservers"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelCollection info](self->_from, "info"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelCollection anchorSet](self->_from, "anchorSet"));
    v73 = -[TUIRenderModelCollection layoutDirection](self->_to, "layoutDirection");
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelCollection matchingSectionUUID](self->_to, "matchingSectionUUID"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelCollection matchingSectionUID](self->_to, "matchingSectionUID"));
    v76 = -[TUIRenderModelCollection initWithContent:sections:size:insets:visibleBoundsObservers:info:anchorSet:layoutDirection:matchingUUID:matchingUID:](v57, "initWithContent:sections:size:insets:visibleBoundsObservers:info:anchorSet:layoutDirection:matchingUUID:matchingUID:", v58, v118, v114, v71, v72, v73, v60, v62, v64, v66, v68, v70, v74, v75);

    v77 = -[_TUIRenderUpdateCollectionSectionChanges initWithSectionUpdates:model:]([_TUIRenderUpdateCollectionSectionChanges alloc], "initWithSectionUpdates:model:", v112, v76);
    sectionChangesFrom2FromPlusInserts = self->_sectionChangesFrom2FromPlusInserts;
    self->_sectionChangesFrom2FromPlusInserts = v77;

  }
  v79 = [TUIRenderModelCollection alloc];
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelCollection content](self->_to, "content"));
  -[TUIRenderModelCollection size](self->_to, "size");
  v82 = v81;
  v84 = v83;
  -[TUIRenderModelCollection insets](self->_to, "insets");
  v86 = v85;
  v88 = v87;
  v90 = v89;
  v92 = v91;
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelCollection visibleBoundsObservers](self->_to, "visibleBoundsObservers"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelCollection info](self->_to, "info"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelCollection anchorSet](self->_to, "anchorSet"));
  v96 = -[TUIRenderModelCollection layoutDirection](self->_to, "layoutDirection");
  v97 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelCollection matchingSectionUUID](self->_to, "matchingSectionUUID"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelCollection matchingSectionUID](self->_to, "matchingSectionUID"));
  v99 = -[TUIRenderModelCollection initWithContent:sections:size:insets:visibleBoundsObservers:info:anchorSet:layoutDirection:matchingUUID:matchingUID:](v79, "initWithContent:sections:size:insets:visibleBoundsObservers:info:anchorSet:layoutDirection:matchingUUID:matchingUID:", v80, v107, v93, v94, v95, v96, v82, v84, v86, v88, v90, v92, v97, v98);

  v100 = -[_TUIRenderUpdateCollectionSectionChanges initWithSectionUpdates:model:]([_TUIRenderUpdateCollectionSectionChanges alloc], "initWithSectionUpdates:model:", v111, v99);
  sectionChangesFromPlusInserts2To = self->_sectionChangesFromPlusInserts2To;
  self->_sectionChangesFromPlusInserts2To = v100;

  v102 = -[_TUIRenderUpdateCollectionSectionChanges initWithSectionUpdates:model:]([_TUIRenderUpdateCollectionSectionChanges alloc], "initWithSectionUpdates:model:", v110, self->_to);
  v103 = self->_sectionChangesFrom2To;
  self->_sectionChangesFrom2To = v102;

}

- (void)_applyUpdates:(const void *)a3 toFeedView:(id)a4
{
  uint64_t *i;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a4;
  for (i = *(uint64_t **)a3; i != *((uint64_t **)a3 + 1); i += 3)
  {
    v6 = *i;
    if (*i == 2)
    {
      objc_msgSend(v8, "moveSection:toSection:", i[1], i[2]);
    }
    else
    {
      if (v6 == 1)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", i[1]));
        objc_msgSend(v8, "deleteSections:", v7);
        goto LABEL_8;
      }
      if (!v6)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", i[2]));
        objc_msgSend(v8, "insertSections:", v7);
LABEL_8:

      }
    }
  }

}

- (void)applyToFeedView:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  TUIRenderUpdateCollection *v10;
  id v11;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_6D0CC;
  v8[3] = &unk_23F358;
  v9 = a3;
  v10 = self;
  v11 = a4;
  v6 = v11;
  v7 = v9;
  objc_msgSend(v7, "applyUpdateCollection:updates:", self, v8);

}

- (TUIRenderModelCollection)from
{
  return self->_from;
}

- (TUIRenderModelCollection)to
{
  return self->_to;
}

- (TUIFeedViewState)viewState
{
  return self->_viewState;
}

- (BOOL)hasChangesToApply
{
  return self->_hasChangesToApply;
}

- (BOOL)hasInvalidationsToApply
{
  return self->_hasInvalidationsToApply;
}

- (unint64_t)applyPhase
{
  return self->_applyPhase;
}

- (TUIRenderUpdateChanges)changes
{
  return self->_changes;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (TUIRenderModelCollection)fromWithInserts
{
  return self->_fromWithInserts;
}

- (void)setFromWithInserts:(id)a3
{
  objc_storeStrong((id *)&self->_fromWithInserts, a3);
}

- (TUIRenderModelCollection)toWithDeletes
{
  return self->_toWithDeletes;
}

- (void)setToWithDeletes:(id)a3
{
  objc_storeStrong((id *)&self->_toWithDeletes, a3);
}

- (_TUIRenderUpdateCollectionSectionChanges)sectionChangesFrom2To
{
  return self->_sectionChangesFrom2To;
}

- (_TUIRenderUpdateCollectionSectionChanges)sectionChangesFrom2FromPlusInserts
{
  return self->_sectionChangesFrom2FromPlusInserts;
}

- (_TUIRenderUpdateCollectionSectionChanges)sectionChangesFromPlusInserts2To
{
  return self->_sectionChangesFromPlusInserts2To;
}

- (void).cxx_destruct
{
  _Update *begin;
  _Update *v4;
  _Update *v5;

  objc_storeStrong((id *)&self->_sectionChangesFromPlusInserts2To, 0);
  objc_storeStrong((id *)&self->_sectionChangesFrom2FromPlusInserts, 0);
  objc_storeStrong((id *)&self->_sectionChangesFrom2To, 0);
  objc_storeStrong((id *)&self->_toWithDeletes, 0);
  objc_storeStrong((id *)&self->_fromWithInserts, 0);
  objc_storeStrong((id *)&self->_changes, 0);
  objc_storeStrong((id *)&self->_viewState, 0);
  objc_storeStrong((id *)&self->_to, 0);
  objc_storeStrong((id *)&self->_from, 0);
  begin = self->_sectionUpdatesFromPlusInserts2To.__begin_;
  if (begin)
  {
    self->_sectionUpdatesFromPlusInserts2To.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_sectionUpdatesFrom2FromPlusInserts.__begin_;
  if (v4)
  {
    self->_sectionUpdatesFrom2FromPlusInserts.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->_sectionUpdatesFrom2To.__begin_;
  if (v5)
  {
    self->_sectionUpdatesFrom2To.__end_ = v5;
    operator delete(v5);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 9) = 0;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
