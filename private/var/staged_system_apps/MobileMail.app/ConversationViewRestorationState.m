@implementation ConversationViewRestorationState

+ (id)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100088880;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005A9B00 != -1)
    dispatch_once(&qword_1005A9B00, block);
  return (id)qword_1005A9AF8;
}

+ (OS_os_log)signpostLog
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100088964;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005A9B10 != -1)
    dispatch_once(&qword_1005A9B10, block);
  return (OS_os_log *)(id)qword_1005A9B08;
}

- (unint64_t)signpostID
{
  id v3;
  NSObject *v4;
  os_signpost_id_t v5;

  v3 = objc_msgSend((id)objc_opt_class(self), "signpostLog");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = os_signpost_id_make_with_pointer(v4, self);

  return v5;
}

+ (id)stateWithBuilder:(id)a3
{
  void (**v4)(id, id);
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = (void (**)(id, id))a3;
  v5 = objc_alloc_init((Class)a1);
  v4[2](v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "referenceMessageListItem"));
  if (v6)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "referenceMessageList"));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "disabledMarkAsReadMessageItemIDs"));
      v9 = v8;
      if (!v8)
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
      objc_msgSend(v5, "setDisabledMarkAsReadMessageItemIDs:", v9);
      if (!v8)

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "expansionTrackerState"));
      v11 = v10;
      if (!v10)
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
      objc_msgSend(v5, "setExpansionTrackerState:", v11);
      if (!v10)

      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "expandedContentItemIDs"));
      v13 = v12;
      if (!v12)
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
      objc_msgSend(v5, "setExpandedContentItemIDs:", v13);
      if (!v12)

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "scrolledItemID"));
      if (v14)
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "scrolledItemOffset"));
      else
        v15 = 0;
      objc_msgSend(v5, "setScrolledItemOffset:", v15);
      if (v14)

      v7 = v5;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)loadFromDictionary:(id)a3 daemonInterface:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "messageRepository"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "loadFromDictionary:usingRepository:", v6, v7));

  return v8;
}

+ (id)loadFromDictionary:(id)a3 usingRepository:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD *v11;
  uint64_t v12;
  NSSet *v13;
  void *v14;
  uint64_t v15;
  NSSet *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  ConversationViewRestorationState *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSSet *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  NSSet *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  NSSet *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  NSSet *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  NSSet *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  NSObject *v59;
  uint64_t v60;
  NSObject *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  unsigned int v66;
  void *v67;
  id v68;
  _QWORD v69[4];
  id v70;
  __int128 *p_buf;
  uint8_t v72[4];
  void *v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  unsigned int v77;
  __int16 v78;
  _BOOL4 v79;
  __int16 v80;
  _BOOL4 v81;
  __int16 v82;
  _BOOL4 v83;
  __int128 buf;
  uint64_t v85;
  uint64_t (*v86)(uint64_t, uint64_t);
  void (*v87)(uint64_t);
  id v88;

  v5 = a3;
  v68 = a4;
  v6 = objc_claimAutoreleasedReturnValue(+[ConversationViewRestorationState log](ConversationViewRestorationState, "log"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Beginning load of state from dictionary: %@", (uint8_t *)&buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ConversationViewStateVersion")));
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "integerValue");
    if ((uint64_t)v9 > 0)
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v85 = 0x3032000000;
      v86 = sub_10008960C;
      v87 = sub_10008961C;
      v88 = 0;
      v69[0] = _NSConcreteStackBlock;
      v69[1] = 3221225472;
      v69[2] = sub_100089624;
      v69[3] = &unk_10051C380;
      v10 = v5;
      v70 = v10;
      p_buf = &buf;
      v11 = objc_retainBlock(v69);
      v12 = objc_opt_class(EMMessageCollectionItemID);
      v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, objc_opt_class(EMThreadCollectionItemID), 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = ((uint64_t (*)(_QWORD *, const __CFString *, void *))v11[2])(v11, CFSTR("ConversationViewStateReferenceItemID"), v14);
      v67 = (void *)objc_claimAutoreleasedReturnValue(v15);

      if (v67)
      {
        v16 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(EMQuery), 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        v18 = ((uint64_t (*)(_QWORD *, const __CFString *, void *))v11[2])(v11, CFSTR("ConversationViewStateMessageListQuery"), v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

        if (v19)
        {
          if ((objc_msgSend(v19, "isValid") & 1) != 0)
          {
            v20 = objc_alloc_init(ConversationViewRestorationState);
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ConversationViewStateShowAsConversation")));
            v66 = objc_msgSend(v21, "BOOLValue");

            -[ConversationViewRestorationState setShowAsConversation:](v20, "setShowAsConversation:", v66);
            v22 = objc_opt_class(NSDictionary);
            v23 = objc_opt_class(NSNumber);
            v24 = objc_opt_class(EMMessageCollectionItemID);
            v25 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v22, v23, v24, objc_opt_class(EMThreadCollectionItemID), 0);
            v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
            v27 = ((uint64_t (*)(_QWORD *, const __CFString *, void *))v11[2])(v11, CFSTR("ConversationViewStateExpansionTrackerState"), v26);
            v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
            v29 = v28;
            if (!v28)
              v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
            -[ConversationViewRestorationState setExpansionTrackerState:](v20, "setExpansionTrackerState:", v29);
            if (!v28)

            v30 = objc_opt_class(NSSet);
            v31 = objc_opt_class(EMMessageCollectionItemID);
            v32 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v30, v31, objc_opt_class(EMThreadCollectionItemID), 0);
            v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
            v34 = ((uint64_t (*)(_QWORD *, const __CFString *, void *))v11[2])(v11, CFSTR("ConversationViewStateDisableMarkAsReadIDs"), v33);
            v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
            v36 = v35;
            if (!v35)
              v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
            -[ConversationViewRestorationState setDisabledMarkAsReadMessageItemIDs:](v20, "setDisabledMarkAsReadMessageItemIDs:", v36);
            if (!v35)

            v37 = objc_opt_class(NSSet);
            v38 = objc_opt_class(EMMessageCollectionItemID);
            v39 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v37, v38, objc_opt_class(EMThreadCollectionItemID), 0);
            v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
            v41 = ((uint64_t (*)(_QWORD *, const __CFString *, void *))v11[2])(v11, CFSTR("ConversationViewStatekExpandedContentIDs"), v40);
            v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
            v43 = v42;
            if (!v42)
              v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
            -[ConversationViewRestorationState setExpandedContentItemIDs:](v20, "setExpandedContentItemIDs:", v43);
            if (!v42)

            v44 = objc_opt_class(EMMessageCollectionItemID);
            v45 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v44, objc_opt_class(EMThreadCollectionItemID), 0);
            v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
            v47 = ((uint64_t (*)(_QWORD *, const __CFString *, void *))v11[2])(v11, CFSTR("ConversationViewStateScrolledItemID"), v46);
            v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
            -[ConversationViewRestorationState setScrolledItemID:](v20, "setScrolledItemID:", v48);

            v49 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewRestorationState scrolledItemID](v20, "scrolledItemID"));
            if (v49)
            {
              v50 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(MFDynamicCellOffsetRepresentation), 0);
              v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
              v52 = ((uint64_t (*)(_QWORD *, const __CFString *, void *))v11[2])(v11, CFSTR("ConversationViewStateScrolledOffsetID"), v51);
              v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
              -[ConversationViewRestorationState setScrolledItemOffset:](v20, "setScrolledItemOffset:", v53);

            }
            v54 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewRestorationState scrolledItemID](v20, "scrolledItemID"));

            v55 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewRestorationState expansionTrackerState](v20, "expansionTrackerState"));
            v56 = objc_msgSend(v55, "count");

            v57 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewRestorationState disabledMarkAsReadMessageItemIDs](v20, "disabledMarkAsReadMessageItemIDs"));
            v58 = objc_msgSend(v57, "count");

            v59 = objc_claimAutoreleasedReturnValue(+[ConversationViewRestorationState log](ConversationViewRestorationState, "log"));
            if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v72 = 138413570;
              v73 = v67;
              v74 = 2112;
              v75 = v19;
              v76 = 1024;
              v77 = v66;
              v78 = 1024;
              v79 = v54 != 0;
              v80 = 1024;
              v81 = v56 != 0;
              v82 = 1024;
              v83 = v58 != 0;
              _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "Decoded dictionary representation: referenceItemID=%@ messageListQuery=%@ showAsConversation=%{BOOL}d hasScrolledItem=%{BOOL}d hasExpandedItems=%{BOOL}d hasDisabledMarkAsReadItems=%{BOOL}d", v72, 0x2Eu);
            }

            v60 = objc_claimAutoreleasedReturnValue(-[ConversationViewRestorationState _beginLoadingWithQuery:itemID:usingRepository:](v20, "_beginLoadingWithQuery:itemID:usingRepository:", v19, v67, v68));
          }
          else
          {
            v20 = (ConversationViewRestorationState *)objc_claimAutoreleasedReturnValue(+[NSError mf_restorationQueryInvalid](NSError, "mf_restorationQueryInvalid"));
            v60 = objc_claimAutoreleasedReturnValue(+[EFFuture futureWithError:](EFFuture, "futureWithError:", v20));
          }
        }
        else
        {
          v20 = (ConversationViewRestorationState *)objc_claimAutoreleasedReturnValue(+[NSError mf_invalidRestorationDataErrorWithUnderlyingError:](NSError, "mf_invalidRestorationDataErrorWithUnderlyingError:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40)));
          v60 = objc_claimAutoreleasedReturnValue(+[EFFuture futureWithError:](EFFuture, "futureWithError:", v20));
        }
        v64 = (void *)v60;

      }
      else
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError mf_invalidRestorationDataErrorWithUnderlyingError:](NSError, "mf_invalidRestorationDataErrorWithUnderlyingError:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40)));
        v64 = (void *)objc_claimAutoreleasedReturnValue(+[EFFuture futureWithError:](EFFuture, "futureWithError:", v19));
      }

      _Block_object_dispose(&buf, 8);
      goto LABEL_34;
    }
  }
  else
  {
    v9 = 0;
  }
  v61 = objc_claimAutoreleasedReturnValue(+[ConversationViewRestorationState log](ConversationViewRestorationState, "log"));
  if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    sub_100390EE0((uint64_t)v9, v61, v62);

  v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSError mf_invalidRestorationDataErrorWithUnderlyingError:](NSError, "mf_invalidRestorationDataErrorWithUnderlyingError:", 0));
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[EFFuture futureWithError:](EFFuture, "futureWithError:", v63));

LABEL_34:
  return v64;
}

- (id)_beginLoadingWithQuery:(id)a3 itemID:(id)a4 usingRepository:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[ConversationViewRestorationState setExpectedReferenceItemID:](self, "setExpectedReferenceItemID:", v9);
  -[ConversationViewRestorationState _logSignpostForCollectionLoadBegin](self, "_logSignpostForCollectionLoadBegin");
  v11 = objc_claimAutoreleasedReturnValue(+[ConversationViewRestorationState log](ConversationViewRestorationState, "log"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    v27 = v9;
    v28 = 2114;
    v29 = v10;
    v30 = 2114;
    v31 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Starting load of message list using itemID: %{public}@, repository: %{public}@, query: %{public}@", buf, 0x20u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[EFPromise promise](EFPromise, "promise"));
  -[ConversationViewRestorationState setCollectionDidLoadReferenceIDPromise:](self, "setCollectionDidLoadReferenceIDPromise:", v12);

  v13 = objc_msgSend(objc_alloc((Class)EMMessageList), "initWithQuery:repository:", v8, v10);
  -[ConversationViewRestorationState setReferenceMessageList:](self, "setReferenceMessageList:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewRestorationState referenceMessageList](self, "referenceMessageList"));
  objc_msgSend(v14, "beginObserving:", self);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewRestorationState collectionDidLoadReferenceIDPromise](self, "collectionDidLoadReferenceIDPromise"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "future"));

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100089B1C;
  v24[3] = &unk_10051C3A8;
  v24[4] = self;
  v17 = v9;
  v25 = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "then:", v24));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "recover:", &stru_10051C3E8));

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100089D7C;
  v23[3] = &unk_10051C410;
  v23[4] = self;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "then:", v23));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100089E88;
  v22[3] = &unk_10051B140;
  v22[4] = self;
  objc_msgSend(v20, "addFailureBlock:", v22);

  return v20;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSMutableDictionary *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  NSMutableDictionary *v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewRestorationState referenceMessageListItem](self, "referenceMessageListItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "itemID"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewRestorationState referenceMessageList](self, "referenceMessageList"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "query"));

  v7 = 0;
  if (v4 && v6)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10008A2F8;
    v19[3] = &unk_10051C438;
    v8 = objc_opt_new(NSMutableDictionary);
    v20 = v8;
    v9 = objc_retainBlock(v19);
    if (((unsigned int (*)(_QWORD *, void *, const __CFString *))v9[2])(v9, v4, CFSTR("ConversationViewStateReferenceItemID"))&& (((uint64_t (*)(_QWORD *, void *, const __CFString *))v9[2])(v9, v6, CFSTR("ConversationViewStateMessageListQuery")) & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewRestorationState disabledMarkAsReadMessageItemIDs](self, "disabledMarkAsReadMessageItemIDs"));
      ((void (*)(_QWORD *, void *, const __CFString *))v9[2])(v9, v10, CFSTR("ConversationViewStateDisableMarkAsReadIDs"));

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewRestorationState expansionTrackerState](self, "expansionTrackerState"));
      ((void (*)(_QWORD *, void *, const __CFString *))v9[2])(v9, v11, CFSTR("ConversationViewStateExpansionTrackerState"));

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewRestorationState expandedContentItemIDs](self, "expandedContentItemIDs"));
      ((void (*)(_QWORD *, void *, const __CFString *))v9[2])(v9, v12, CFSTR("ConversationViewStatekExpandedContentIDs"));

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewRestorationState scrolledItemID](self, "scrolledItemID"));
      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewRestorationState scrolledItemID](self, "scrolledItemID"));
        ((void (*)(_QWORD *, void *, const __CFString *))v9[2])(v9, v14, CFSTR("ConversationViewStateScrolledItemID"));

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewRestorationState scrolledItemOffset](self, "scrolledItemOffset"));
        if (v15)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewRestorationState scrolledItemOffset](self, "scrolledItemOffset"));
          ((void (*)(_QWORD *, void *, const __CFString *))v9[2])(v9, v16, CFSTR("ConversationViewStateScrolledOffsetID"));

        }
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ConversationViewRestorationState showAsConversation](self, "showAsConversation")));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v17, CFSTR("ConversationViewStateShowAsConversation"));

      -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", &off_1005413F8, CFSTR("ConversationViewStateVersion"));
      v7 = -[NSMutableDictionary copy](v8, "copy");
    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (void)_logSignpostForCollectionLoadBegin
{
  NSObject *v3;
  os_signpost_id_t v4;
  void *v5;
  int v6;
  void *v7;

  v3 = objc_claimAutoreleasedReturnValue(+[ConversationViewRestorationState signpostLog](ConversationViewRestorationState, "signpostLog"));
  v4 = -[ConversationViewRestorationState signpostID](self, "signpostID");
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewRestorationState expectedReferenceItemID](self, "expectedReferenceItemID"));
    v6 = 138543362;
    v7 = v5;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "ConversationViewStateCollectionLoad", "ItemID=%{public}@", (uint8_t *)&v6, 0xCu);

  }
}

- (void)_logSignpostForCollectionLoadEndFindingItemID:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  os_signpost_id_t v6;
  void *v7;
  _DWORD v8[2];
  __int16 v9;
  void *v10;

  v3 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[ConversationViewRestorationState signpostLog](ConversationViewRestorationState, "signpostLog"));
  v6 = -[ConversationViewRestorationState signpostID](self, "signpostID");
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewRestorationState expectedReferenceItemID](self, "expectedReferenceItemID"));
    v8[0] = 67240450;
    v8[1] = v3;
    v9 = 2114;
    v10 = v7;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_END, v6, "ConversationViewStateCollectionLoad", "DidFindItemID=%{public,signpost.telemetry:number1}u ItemID=%{public}@ enableTelemetry=YES ", (uint8_t *)v8, 0x12u);

  }
}

- (void)_logSignpostForReferenceItemRequest
{
  NSObject *v3;
  os_signpost_id_t v4;
  void *v5;
  int v6;
  void *v7;

  v3 = objc_claimAutoreleasedReturnValue(+[ConversationViewRestorationState signpostLog](ConversationViewRestorationState, "signpostLog"));
  v4 = -[ConversationViewRestorationState signpostID](self, "signpostID");
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewRestorationState expectedReferenceItemID](self, "expectedReferenceItemID"));
    v6 = 138543362;
    v7 = v5;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "ConversationViewStateReferenceItemLoad", "ItemID=%{public}@", (uint8_t *)&v6, 0xCu);

  }
}

- (void)_logSignpostForReferenceItemLoadCompleteWithSuccess:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  os_signpost_id_t v6;
  void *v7;
  _DWORD v8[2];
  __int16 v9;
  void *v10;

  v3 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[ConversationViewRestorationState signpostLog](ConversationViewRestorationState, "signpostLog"));
  v6 = -[ConversationViewRestorationState signpostID](self, "signpostID");
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewRestorationState expectedReferenceItemID](self, "expectedReferenceItemID"));
    v8[0] = 67240450;
    v8[1] = v3;
    v9 = 2114;
    v10 = v7;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_END, v6, "ConversationViewStateReferenceItemLoad", "Success=%{public,signpost.telemetry:number1}u ItemID=%{public}@ enableTelemetry=YES ", (uint8_t *)v8, 0x12u);

  }
}

- (void)collectionDidFinishInitialLoad:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[24];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[ConversationViewRestorationState log](ConversationViewRestorationState, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ef_publicDescription"));
    sub_1003910E8(v6, v8, v5);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewRestorationState collectionDidLoadReferenceIDPromise](self, "collectionDidLoadReferenceIDPromise"));
  objc_msgSend(v7, "finishWithResult:", v4);

  -[ConversationViewRestorationState _logSignpostForCollectionLoadEndFindingItemID:](self, "_logSignpostForCollectionLoadEndFindingItemID:", 0);
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 after:(id)a5
{
  id v7;
  id v8;
  void *v9;
  unsigned int v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewRestorationState expectedReferenceItemID](self, "expectedReferenceItemID"));
  v10 = objc_msgSend(v8, "containsObject:", v9);

  if (v10)
  {
    v11 = objc_claimAutoreleasedReturnValue(+[ConversationViewRestorationState log](ConversationViewRestorationState, "log"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      sub_100391138(v11, v12, v13, v14, v15, v16, v17, v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewRestorationState collectionDidLoadReferenceIDPromise](self, "collectionDidLoadReferenceIDPromise"));
    objc_msgSend(v19, "finishWithResult:", v7);

    -[ConversationViewRestorationState _logSignpostForCollectionLoadEndFindingItemID:](self, "_logSignpostForCollectionLoadEndFindingItemID:", 1);
  }

}

- (void)collection:(id)a3 addedItemIDs:(id)a4 before:(id)a5
{
  id v7;
  id v8;
  void *v9;
  unsigned int v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewRestorationState expectedReferenceItemID](self, "expectedReferenceItemID"));
  v10 = objc_msgSend(v8, "containsObject:", v9);

  if (v10)
  {
    v11 = objc_claimAutoreleasedReturnValue(+[ConversationViewRestorationState log](ConversationViewRestorationState, "log"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      sub_100391138(v11, v12, v13, v14, v15, v16, v17, v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ConversationViewRestorationState collectionDidLoadReferenceIDPromise](self, "collectionDidLoadReferenceIDPromise"));
    objc_msgSend(v19, "finishWithResult:", v7);

    -[ConversationViewRestorationState _logSignpostForCollectionLoadEndFindingItemID:](self, "_logSignpostForCollectionLoadEndFindingItemID:", 1);
  }

}

- (EMMessageListItem)referenceMessageListItem
{
  return self->_referenceMessageListItem;
}

- (void)setReferenceMessageListItem:(id)a3
{
  objc_storeStrong((id *)&self->_referenceMessageListItem, a3);
}

- (EMMessageList)referenceMessageList
{
  return self->_referenceMessageList;
}

- (void)setReferenceMessageList:(id)a3
{
  objc_storeStrong((id *)&self->_referenceMessageList, a3);
}

- (BOOL)showAsConversation
{
  return self->_showAsConversation;
}

- (void)setShowAsConversation:(BOOL)a3
{
  self->_showAsConversation = a3;
}

- (NSDictionary)expansionTrackerState
{
  return self->_expansionTrackerState;
}

- (void)setExpansionTrackerState:(id)a3
{
  objc_storeStrong((id *)&self->_expansionTrackerState, a3);
}

- (NSSet)disabledMarkAsReadMessageItemIDs
{
  return self->_disabledMarkAsReadMessageItemIDs;
}

- (void)setDisabledMarkAsReadMessageItemIDs:(id)a3
{
  objc_storeStrong((id *)&self->_disabledMarkAsReadMessageItemIDs, a3);
}

- (NSSet)expandedContentItemIDs
{
  return self->_expandedContentItemIDs;
}

- (void)setExpandedContentItemIDs:(id)a3
{
  objc_storeStrong((id *)&self->_expandedContentItemIDs, a3);
}

- (EMCollectionItemID)scrolledItemID
{
  return self->_scrolledItemID;
}

- (void)setScrolledItemID:(id)a3
{
  objc_storeStrong((id *)&self->_scrolledItemID, a3);
}

- (MFDynamicCellOffsetRepresentation)scrolledItemOffset
{
  return self->_scrolledItemOffset;
}

- (void)setScrolledItemOffset:(id)a3
{
  objc_storeStrong((id *)&self->_scrolledItemOffset, a3);
}

- (EFPromise)collectionDidLoadReferenceIDPromise
{
  return self->_collectionDidLoadReferenceIDPromise;
}

- (void)setCollectionDidLoadReferenceIDPromise:(id)a3
{
  objc_storeStrong((id *)&self->_collectionDidLoadReferenceIDPromise, a3);
}

- (EMCollectionItemID)expectedReferenceItemID
{
  return self->_expectedReferenceItemID;
}

- (void)setExpectedReferenceItemID:(id)a3
{
  objc_storeStrong((id *)&self->_expectedReferenceItemID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedReferenceItemID, 0);
  objc_storeStrong((id *)&self->_collectionDidLoadReferenceIDPromise, 0);
  objc_storeStrong((id *)&self->_scrolledItemOffset, 0);
  objc_storeStrong((id *)&self->_scrolledItemID, 0);
  objc_storeStrong((id *)&self->_expandedContentItemIDs, 0);
  objc_storeStrong((id *)&self->_disabledMarkAsReadMessageItemIDs, 0);
  objc_storeStrong((id *)&self->_expansionTrackerState, 0);
  objc_storeStrong((id *)&self->_referenceMessageList, 0);
  objc_storeStrong((id *)&self->_referenceMessageListItem, 0);
}

@end
