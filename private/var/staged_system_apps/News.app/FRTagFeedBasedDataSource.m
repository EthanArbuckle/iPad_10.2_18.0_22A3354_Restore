@implementation FRTagFeedBasedDataSource

- (FRTagFeedBasedDataSource)initWithFeldsparContext:(id)a3
{
  return -[FRTagFeedBasedDataSource initWithFeldsparContext:tags:delegate:](self, "initWithFeldsparContext:tags:delegate:", a3, 0, 0);
}

- (FRTagFeedBasedDataSource)initWithFeldsparContext:(id)a3 tags:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  FRTagFeedBasedDataSource *v11;
  FRTagFeedBasedDataSource *v12;
  FRTagFeedBasedDataSource *v13;
  void *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10008144C();
  v16.receiver = self;
  v16.super_class = (Class)FRTagFeedBasedDataSource;
  v11 = -[FRFeedBasedDataSource initWithFeldsparContext:](&v16, "initWithFeldsparContext:", v8);
  v12 = v11;
  if (v11)
  {
    if (v8)
    {
      -[FRFeedBasedDataSource setDelegate:](v11, "setDelegate:", v10);
      -[FRTagFeedBasedDataSource setTagResults:](v12, "setTagResults:", v9);
      v13 = (FRTagFeedBasedDataSource *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cloudContext"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagFeedBasedDataSource subscriptionController](v13, "subscriptionController"));
      objc_msgSend(v14, "addObserver:", v12);

    }
    else
    {
      v13 = v11;
      v12 = 0;
    }

  }
  return v12;
}

- (id)_filteredTagsForTags:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource feldsparContext](self, "feldsparContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cloudContext"));

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100062DB8;
  v10[3] = &unk_1000DDC70;
  v11 = v6;
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", v10));

  return v8;
}

- (void)setTagResults:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource tagResults](self, "tagResults"));

  if (v5 != v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource tagResults](self, "tagResults"));
    objc_msgSend(v6, "removeObserver:", self);

    v13.receiver = self;
    v13.super_class = (Class)FRTagFeedBasedDataSource;
    -[FRFeedBasedDataSource setTagResults:](&v13, "setTagResults:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "array"));
    v8 = objc_msgSend(v7, "copy");
    -[FRFeedBasedDataSource setKnownTags:](self, "setKnownTags:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource knownTags](self, "knownTags"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagFeedBasedDataSource _filteredTagsForTags:](self, "_filteredTagsForTags:", v9));
    -[FRFeedBasedDataSource setFilteredTags:](self, "setFilteredTags:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource tagResults](self, "tagResults"));
    objc_msgSend(v11, "addObserver:", self);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource delegate](self, "delegate"));
    objc_msgSend(v12, "feedDataSourceDidReloadData:", self);

  }
}

- (int64_t)_numberOfSections
{
  return 1;
}

- (id)feedAtIndexPath:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  v5 = objc_msgSend(v4, "row");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource knownTags](self, "knownTags"));
  v7 = objc_msgSend(v6, "count");

  if (v5 >= v7)
  {
    v13 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource feldsparContext](self, "feldsparContext"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cloudContext"));

    v10 = objc_alloc((Class)FCSingleTagFeedDescriptor);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource knownTags](self, "knownTags"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v4, "row")));
    v13 = objc_msgSend(v10, "initWithContext:tag:feedConfiguration:", v9, v12, 0);

  }
  return v13;
}

- (id)feedsInSection:(int64_t)a3
{
  return -[FRFeedBasedDataSource filteredTags](self, "filteredTags", a3);
}

- (void)results:(id)a3 didFetchObjectsInRange:(_NSRange)a4
{
  void *length;
  void *v5;
  id v7;
  id v8;
  _QWORD *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16[3];
  id location;

  length = (void *)a4.length;
  v5 = (void *)a4.location;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource tagResults](self, "tagResults"));

  if (v8 == v7)
  {
    objc_initWeak(&location, self);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100063198;
    v14[3] = &unk_1000DDC98;
    objc_copyWeak(v16, &location);
    v15 = v7;
    v16[1] = v5;
    v16[2] = length;
    v9 = objc_retainBlock(v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource delegate](self, "delegate"));
    v11 = objc_opt_respondsToSelector(v10, "feedDataSource:wantsToPerformUpdate:");

    if ((v11 & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource delegate](self, "delegate"));
      objc_msgSend(v12, "feedDataSource:wantsToPerformUpdate:", self, v9);

    }
    else
    {
      v13 = (id)((uint64_t (*)(_QWORD *))v9[2])(v9);
    }

    objc_destroyWeak(v16);
    objc_destroyWeak(&location);
  }

}

- (void)resultsDidFinish:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource tableViews](self, "tableViews", a3, 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "reloadData");
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)subscriptionController:(id)a3 didAddTags:(id)a4 changeTags:(id)a5 moveTags:(id)a6 removeTags:(id)a7 subscriptionType:(unint64_t)a8
{
  id v11;
  id v12;
  NSMutableArray *v13;
  NSMutableArray *v14;
  void *v15;
  id v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *i;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  void *j;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  void *k;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *m;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  void *n;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  id v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  void *ii;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  id v80;
  NSMutableArray *v81;
  NSMutableArray *v82;
  NSMutableArray *obj;
  uint64_t v84;
  uint64_t v85;
  id v86;
  id v87;
  FRTagFeedBasedDataSource *v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];

  v11 = a4;
  v12 = a7;
  if (!a8)
  {
    v13 = objc_opt_new(NSMutableArray);
    v14 = objc_opt_new(NSMutableArray);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource knownTags](self, "knownTags"));
    v16 = objc_msgSend(v15, "count");

    if (v16)
    {
      v17 = 0;
      do
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource knownTags](self, "knownTags"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndexedSubscript:", v17));

        if (objc_msgSend(v11, "containsObject:", v19))
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v17, 0));
          -[NSMutableArray addObject:](v13, "addObject:", v20);

        }
        if (objc_msgSend(v12, "containsObject:", v19))
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v17, 0));
          -[NSMutableArray addObject:](v14, "addObject:", v21);

        }
        ++v17;
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource knownTags](self, "knownTags"));
        v23 = objc_msgSend(v22, "count");

      }
      while (v17 < (unint64_t)v23);
    }
    v80 = v11;
    v81 = v14;
    v111 = 0u;
    v112 = 0u;
    v109 = 0u;
    v110 = 0u;
    obj = v13;
    v86 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v109, v118, 16);
    v88 = self;
    if (v86)
    {
      v84 = *(_QWORD *)v110;
      do
      {
        for (i = 0; i != v86; i = (char *)i + 1)
        {
          if (*(_QWORD *)v110 != v84)
            objc_enumerationMutation(obj);
          v25 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * (_QWORD)i);
          v105 = 0u;
          v106 = 0u;
          v107 = 0u;
          v108 = 0u;
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource collectionViews](self, "collectionViews"));
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v105, v117, 16);
          if (v27)
          {
            v29 = v27;
            v30 = *(_QWORD *)v106;
            do
            {
              for (j = 0; j != v29; j = (char *)j + 1)
              {
                if (*(_QWORD *)v106 != v30)
                  objc_enumerationMutation(v26);
                v32 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * (_QWORD)j);
                v33 = objc_opt_class(FRFeedPickerCardCollectionViewBaseCell, v28);
                v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "cellForItemAtIndexPath:", v25));
                v35 = FCDynamicCast(v33, v34);
                v36 = (void *)objc_claimAutoreleasedReturnValue(v35);

                v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "actionButton"));
                objc_msgSend(v37, "setSubscriptionState:animated:completion:", 2, 1, 0);

              }
              v29 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v105, v117, 16);
            }
            while (v29);
          }

          v38 = objc_msgSend(v25, "row");
          self = v88;
          if (v38 >= (id)-[FRFeedBasedDataSource tableViewDataOffset](v88, "tableViewDataOffset"))
          {
            v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (_BYTE *)objc_msgSend(v25, "row")- (_BYTE *)-[FRFeedBasedDataSource tableViewDataOffset](v88, "tableViewDataOffset"), objc_msgSend(v25, "section")));
            v101 = 0u;
            v102 = 0u;
            v103 = 0u;
            v104 = 0u;
            v40 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource tableViews](v88, "tableViews"));
            v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v101, v116, 16);
            if (v41)
            {
              v43 = v41;
              v44 = *(_QWORD *)v102;
              do
              {
                for (k = 0; k != v43; k = (char *)k + 1)
                {
                  if (*(_QWORD *)v102 != v44)
                    objc_enumerationMutation(v40);
                  v46 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * (_QWORD)k);
                  v47 = objc_opt_class(FRTagSearchResultTableViewCell, v42);
                  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "cellForRowAtIndexPath:", v39));
                  v49 = FCDynamicCast(v47, v48);
                  v50 = (void *)objc_claimAutoreleasedReturnValue(v49);

                  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "subscriptionButton"));
                  objc_msgSend(v51, "setSubscriptionState:animated:completion:", 2, 1, 0);

                }
                v43 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v101, v116, 16);
              }
              while (v43);
            }

            self = v88;
          }
        }
        v86 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v109, v118, 16);
      }
      while (v86);
    }

    v99 = 0u;
    v100 = 0u;
    v97 = 0u;
    v98 = 0u;
    v82 = v81;
    v87 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v82, "countByEnumeratingWithState:objects:count:", &v97, v115, 16);
    if (v87)
    {
      v85 = *(_QWORD *)v98;
      do
      {
        for (m = 0; m != v87; m = (char *)m + 1)
        {
          if (*(_QWORD *)v98 != v85)
            objc_enumerationMutation(v82);
          v53 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * (_QWORD)m);
          v93 = 0u;
          v94 = 0u;
          v95 = 0u;
          v96 = 0u;
          v54 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource collectionViews](self, "collectionViews"));
          v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v93, v114, 16);
          if (v55)
          {
            v57 = v55;
            v58 = *(_QWORD *)v94;
            do
            {
              for (n = 0; n != v57; n = (char *)n + 1)
              {
                if (*(_QWORD *)v94 != v58)
                  objc_enumerationMutation(v54);
                v60 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * (_QWORD)n);
                v61 = objc_opt_class(FRFeedPickerCardCollectionViewBaseCell, v56);
                v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "cellForItemAtIndexPath:", v53));
                v63 = FCDynamicCast(v61, v62);
                v64 = (void *)objc_claimAutoreleasedReturnValue(v63);

                v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "actionButton"));
                objc_msgSend(v65, "setSubscriptionState:animated:completion:", 1, 1, 0);

              }
              v57 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v93, v114, 16);
            }
            while (v57);
          }

          v66 = objc_msgSend(v53, "row");
          self = v88;
          if (v66 >= (id)-[FRFeedBasedDataSource tableViewDataOffset](v88, "tableViewDataOffset"))
          {
            v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (_BYTE *)objc_msgSend(v53, "row")- (_BYTE *)-[FRFeedBasedDataSource tableViewDataOffset](v88, "tableViewDataOffset"), objc_msgSend(v53, "section")));
            v89 = 0u;
            v90 = 0u;
            v91 = 0u;
            v92 = 0u;
            v68 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource tableViews](v88, "tableViews"));
            v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v89, v113, 16);
            if (v69)
            {
              v71 = v69;
              v72 = *(_QWORD *)v90;
              do
              {
                for (ii = 0; ii != v71; ii = (char *)ii + 1)
                {
                  if (*(_QWORD *)v90 != v72)
                    objc_enumerationMutation(v68);
                  v74 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * (_QWORD)ii);
                  v75 = objc_opt_class(FRTagSearchResultTableViewCell, v70);
                  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "cellForRowAtIndexPath:", v67));
                  v77 = FCDynamicCast(v75, v76);
                  v78 = (void *)objc_claimAutoreleasedReturnValue(v77);

                  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "subscriptionButton"));
                  objc_msgSend(v79, "setSubscriptionState:animated:completion:", 1, 1, 0);

                }
                v71 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v89, v113, 16);
              }
              while (v71);
            }

            self = v88;
          }
        }
        v87 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v82, "countByEnumeratingWithState:objects:count:", &v97, v115, 16);
      }
      while (v87);
    }

    v11 = v80;
  }

}

@end
