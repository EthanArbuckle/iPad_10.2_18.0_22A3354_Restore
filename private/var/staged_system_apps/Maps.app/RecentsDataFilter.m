@implementation RecentsDataFilter

- (RecentsDataFilter)initWithSearchMode:(unsigned int)a3 filterPredicate:(id)a4
{
  id v7;
  RecentsDataFilter *v8;
  RecentsDataFilter *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)RecentsDataFilter;
  v8 = -[RecentsDataFilter init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_searchMode = a3;
    objc_storeStrong((id *)&v8->_filterPredicate, a4);
  }

  return v9;
}

- (RecentsDataFilter)initWithSearchMode:(unsigned int)a3
{
  return -[RecentsDataFilter initWithSearchMode:filterPredicate:](self, "initWithSearchMode:filterPredicate:", *(_QWORD *)&a3, 0);
}

- (RecentsDataFilter)initWithFilterPredicate:(id)a3
{
  return -[RecentsDataFilter initWithSearchMode:filterPredicate:](self, "initWithSearchMode:filterPredicate:", 1, a3);
}

- (RecentsDataFilter)init
{
  return -[RecentsDataFilter initWithSearchMode:](self, "initWithSearchMode:", 1);
}

- (id)filteredRecents:(id)a3 excludingDuplicatesOfEntries:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *j;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD *v48;
  id v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  id v56;
  NSObject *v57;
  id v58;
  NSObject *v59;
  id v60;
  id v62;
  id v63;
  void *v64;
  void *v65;
  id obj;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  _QWORD *v73;
  _QWORD v74[4];
  _QWORD *v75;
  uint8_t *v76;
  _QWORD v77[5];
  id v78;
  id v79;
  id v80;
  id v81;
  uint64_t *v82;
  uint8_t *v83;
  _QWORD v84[4];
  id v85;
  uint64_t *v86;
  uint8_t v87[8];
  uint8_t *v88;
  uint64_t v89;
  uint64_t (*v90)(uint64_t, uint64_t);
  void (*v91)(uint64_t);
  id v92;
  uint64_t v93;
  uint64_t *v94;
  uint64_t v95;
  char v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _QWORD v101[4];
  id v102;
  id v103;
  id v104;
  id v105;
  _QWORD *v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _QWORD v111[5];
  uint8_t buf[8];
  uint8_t *v113;
  uint64_t v114;
  uint64_t (*v115)(uint64_t, uint64_t);
  void (*v116)(uint64_t);
  id v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  _QWORD v122[4];
  id v123;
  uint8_t v124[4];
  void *v125;
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];

  v5 = a3;
  v63 = a4;
  v6 = sub_100432EDC();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Filter", ", buf, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RecentsDataFilter filterPredicate](self, "filterPredicate"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RecentsDataFilter filterPredicate](self, "filterPredicate"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "filteredArrayUsingPredicate:", v9));

    v11 = (void *)v10;
  }
  else
  {
    v11 = v5;
  }
  v64 = v11;
  if (!objc_msgSend(v11, "count"))
  {
    v60 = &__NSArray0__struct;
    goto LABEL_58;
  }
  v12 = objc_alloc_init((Class)NSMutableDictionary);
  v122[0] = _NSConcreteStackBlock;
  v122[1] = 3221225472;
  v122[2] = sub_10030E8B0;
  v122[3] = &unk_1011B1380;
  v62 = v12;
  v123 = v62;
  v73 = objc_retainBlock(v122);
  v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v120 = 0u;
  v121 = 0u;
  v118 = 0u;
  v119 = 0u;
  v13 = v63;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v118, v128, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v119;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v119 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * (_QWORD)i);
        v18 = objc_opt_class(MapsSuggestionsEntry);
        if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "MKMapItem"));
        }
        else
        {
          v20 = objc_opt_class(SearchResult);
          if ((objc_opt_isKindOfClass(v17, v20) & 1) == 0)
            continue;
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mapItem"));
        }
        v21 = v19;
        if (v19)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "_geoMapItem"));
          v23 = ((uint64_t (*)(_QWORD *, void *))v73[2])(v73, v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

          objc_msgSend(v69, "addObject:", v24);
        }
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v118, v128, 16);
    }
    while (v14);
  }

  v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v64, "count")));
  *(_QWORD *)buf = 0;
  v113 = buf;
  v114 = 0x3032000000;
  v115 = sub_10030E94C;
  v116 = sub_10030E95C;
  v117 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v111[0] = _NSConcreteStackBlock;
  v111[1] = 3221225472;
  v111[2] = sub_10030E964;
  v111[3] = &unk_1011B13A8;
  v111[4] = buf;
  v25 = objc_retainBlock(v111);
  v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  v26 = v64;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v107, v127, 16);
  if (!v27)
    goto LABEL_32;
  v28 = *(_QWORD *)v108;
  do
  {
    for (j = 0; j != v27; j = (char *)j + 1)
    {
      if (*(_QWORD *)v108 != v28)
        objc_enumerationMutation(v26);
      v30 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * (_QWORD)j);
      v31 = ((uint64_t (*)(_QWORD *, void *))v25[2])(v25, v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
      v33 = v32;
      if (v32)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "historyEntry"));
        v101[0] = _NSConcreteStackBlock;
        v101[1] = 3221225472;
        v101[2] = sub_10030EA60;
        v101[3] = &unk_1011B1410;
        v106 = v73;
        v102 = v72;
        v103 = v70;
        v104 = v33;
        v105 = v71;
        objc_msgSend(v34, "ifSearch:ifRoute:ifPlaceDisplay:ifTransitLineItem:", &stru_1011B13C8, &stru_1011B13E8, v101, &stru_1011B1430);

        v35 = v106;
      }
      else
      {
        v36 = objc_opt_class(SearchResult);
        if ((objc_opt_isKindOfClass(v30, v36) & 1) == 0)
          goto LABEL_30;
        v35 = v30;
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "mapItem"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "_geoMapItem"));
        v39 = ((uint64_t (*)(_QWORD *, void *))v73[2])(v73, v38);
        v40 = (void *)objc_claimAutoreleasedReturnValue(v39);

        objc_msgSend(v72, "addObject:", v40);
      }

LABEL_30:
    }
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v107, v127, 16);
  }
  while (v27);
LABEL_32:

  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  obj = v26;
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v126, 16);
  if (!v41)
    goto LABEL_54;
  v68 = *(_QWORD *)v98;
  while (2)
  {
    v42 = 0;
    while (2)
    {
      if (*(_QWORD *)v98 != v68)
        objc_enumerationMutation(obj);
      v43 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * v42);
      v93 = 0;
      v94 = &v93;
      v95 = 0x2020000000;
      v96 = 1;
      *(_QWORD *)v87 = 0;
      v88 = v87;
      v89 = 0x3032000000;
      v90 = sub_10030E94C;
      v91 = sub_10030E95C;
      v92 = 0;
      v44 = ((uint64_t (*)(_QWORD *, void *))v25[2])(v25, v43);
      v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
      v46 = v45;
      if (v45)
      {
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "historyEntry"));
        v84[0] = _NSConcreteStackBlock;
        v84[1] = 3221225472;
        v84[2] = sub_10030EB20;
        v84[3] = &unk_1011B1458;
        v86 = &v93;
        v85 = v71;
        v77[0] = _NSConcreteStackBlock;
        v77[1] = 3221225472;
        v77[2] = sub_10030EB78;
        v77[3] = &unk_1011B1480;
        v77[4] = self;
        v82 = &v93;
        v83 = v87;
        v48 = v73;
        v81 = v48;
        v78 = v72;
        v79 = v70;
        v80 = v46;
        v74[0] = _NSConcreteStackBlock;
        v74[1] = 3221225472;
        v74[2] = sub_10030ECF8;
        v74[3] = &unk_1011B14A8;
        v76 = v87;
        v75 = v48;
        objc_msgSend(v47, "ifSearch:ifRoute:ifPlaceDisplay:ifTransitLineItem:", v84, v77, v74, &stru_1011B14C8);

        v49 = v85;
        goto LABEL_41;
      }
      v50 = objc_opt_class(SearchResult);
      if ((objc_opt_isKindOfClass(v43, v50) & 1) != 0)
      {
        v49 = v43;
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "mapItem"));
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "_geoMapItem"));
        v53 = ((uint64_t (*)(_QWORD *, void *))v73[2])(v73, v52);
        v54 = objc_claimAutoreleasedReturnValue(v53);
        v55 = (void *)*((_QWORD *)v88 + 5);
        *((_QWORD *)v88 + 5) = v54;

LABEL_41:
      }
      if (!*((_BYTE *)v94 + 24))
        goto LABEL_49;
      if (!*((_QWORD *)v88 + 5))
        goto LABEL_47;
      if (objc_msgSend(v69, "containsObject:"))
      {
        *((_BYTE *)v94 + 24) = 0;
        goto LABEL_49;
      }
      if (*((_BYTE *)v94 + 24))
      {
LABEL_47:
        objc_msgSend(v65, "addObject:", v43);
        if (*((_QWORD *)v88 + 5))
          objc_msgSend(v69, "addObject:");
      }
      else
      {
LABEL_49:
        v56 = sub_100432EDC();
        v57 = objc_claimAutoreleasedReturnValue(v56);
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v124 = 138412290;
          v125 = v43;
          _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEBUG, "RDFilter discard %@", v124, 0xCu);
        }

      }
      _Block_object_dispose(v87, 8);

      _Block_object_dispose(&v93, 8);
      if (v41 != (id)++v42)
        continue;
      break;
    }
    v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v126, 16);
    if (v41)
      continue;
    break;
  }
LABEL_54:

  v58 = sub_100432EDC();
  v59 = objc_claimAutoreleasedReturnValue(v58);
  if (os_signpost_enabled(v59))
  {
    *(_WORD *)v87 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v59, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Filter", ", v87, 2u);
  }

  v60 = objc_msgSend(v65, "copy");
  _Block_object_dispose(buf, 8);

LABEL_58:
  return v60;
}

- (NSPredicate)filterPredicate
{
  return self->_filterPredicate;
}

- (unsigned)searchMode
{
  return self->_searchMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterPredicate, 0);
}

@end
