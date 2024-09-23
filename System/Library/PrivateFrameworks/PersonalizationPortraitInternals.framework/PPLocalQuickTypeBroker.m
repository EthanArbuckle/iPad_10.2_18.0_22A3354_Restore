@implementation PPLocalQuickTypeBroker

- (void)warmUpWithCompletion:(id)a3
{
  void (**v3)(_QWORD);
  NSObject *v4;
  uint8_t v5[16];

  v3 = (void (**)(_QWORD))a3;
  pp_quicktype_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_INFO, "PPLocalQuickTypeBroker: warmUp", v5, 2u);
  }

  if (v3)
    v3[2](v3);

}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken5 != -1)
    dispatch_once(&sharedInstance__pasOnceToken5, &__block_literal_global_10668);
  return (id)sharedInstance__pasExprOnceResult_10669;
}

- (PPLocalQuickTypeBroker)init
{
  NSObject *v3;
  PPLocalQuickTypeBroker *v4;
  id v5;
  void *v6;
  uint64_t v7;
  _PASLock *cacheLock;
  uint64_t v9;
  PPQuickTypeNavigationServant *navigationServant;
  uint64_t v11;
  PPQuickTypeContactsServant *contactsServant;
  uint64_t v13;
  PPQuickTypeEventsServant *eventsServant;
  uint64_t v15;
  PPQuickTypeConnectionsServant *connectionsServant;
  uint64_t v17;
  PPQuickTypeURLServant *urlServant;
  uint64_t v19;
  objc_super v21;
  _QWORD v22[5];
  uint8_t buf[8];
  uint64_t v24;
  uint64_t (*v25)(uint64_t);
  void *v26;
  PPLocalQuickTypeBroker *v27;

  pp_quicktype_log_handle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1C392E000, v3, OS_LOG_TYPE_DEBUG, "instantiating PPLocalQuickTypeBroker", buf, 2u);
  }

  v21.receiver = self;
  v21.super_class = (Class)PPLocalQuickTypeBroker;
  v4 = -[PPLocalQuickTypeBroker init](&v21, sel_init);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0D815F0]);
    v6 = (void *)objc_opt_new();
    v7 = objc_msgSend(v5, "initWithGuardedData:", v6);
    cacheLock = v4->_cacheLock;
    v4->_cacheLock = (_PASLock *)v7;

    v9 = objc_opt_new();
    navigationServant = v4->_navigationServant;
    v4->_navigationServant = (PPQuickTypeNavigationServant *)v9;

    v11 = objc_opt_new();
    contactsServant = v4->_contactsServant;
    v4->_contactsServant = (PPQuickTypeContactsServant *)v11;

    v13 = objc_opt_new();
    eventsServant = v4->_eventsServant;
    v4->_eventsServant = (PPQuickTypeEventsServant *)v13;

    v15 = objc_opt_new();
    connectionsServant = v4->_connectionsServant;
    v4->_connectionsServant = (PPQuickTypeConnectionsServant *)v15;

    v17 = objc_opt_new();
    urlServant = v4->_urlServant;
    v4->_urlServant = (PPQuickTypeURLServant *)v17;

    v19 = MEMORY[0x1E0C809B0];
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __51__PPLocalQuickTypeBroker__registerForNotifications__block_invoke;
    v26 = &unk_1E7E1F4F0;
    v27 = v4;
    objc_msgSend(MEMORY[0x1E0D70BF0], "addContactsObserverForLifetimeOfObject:block:", v4, buf);
    v22[0] = v19;
    v22[1] = 3221225472;
    v22[2] = __51__PPLocalQuickTypeBroker__registerForNotifications__block_invoke_2;
    v22[3] = &unk_1E7E1DF28;
    v22[4] = v4;
    objc_msgSend(MEMORY[0x1E0D70BF0], "addEventKitObserverForLifetimeOfObject:block:", v4, v22);
  }
  return v4;
}

- (void)quickTypeItemsWithQuery:(id)a3 limit:(unint64_t)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, PPLocalQuickTypeBroker *, void *);
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  unint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD *v20;
  id *v21;
  id v22;
  int v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;
  PPLocalQuickTypeBroker *v29;
  NSObject *p_super;
  uint64_t v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void (**v38)(void *, PPQuickTypeContactsServant *);
  NSObject *v39;
  os_signpost_id_t v40;
  NSObject *v41;
  NSObject *v42;
  unint64_t v43;
  NSObject *v44;
  NSObject *v45;
  const char *v46;
  NSObject *v47;
  os_signpost_id_t v48;
  NSObject *v49;
  NSObject *v50;
  unint64_t v51;
  NSObject *v52;
  NSObject *v53;
  os_signpost_id_t v54;
  NSObject *v55;
  NSObject *v56;
  unint64_t v57;
  NSObject *v58;
  NSObject *v59;
  os_signpost_id_t v60;
  NSObject *v61;
  NSObject *v62;
  unint64_t v63;
  NSObject *v64;
  NSObject *v65;
  os_signpost_id_t v66;
  NSObject *v67;
  NSObject *v68;
  unint64_t v69;
  NSObject *v70;
  NSObject *v71;
  os_signpost_id_t v72;
  NSObject *v73;
  NSObject *v74;
  unint64_t v75;
  NSObject *v76;
  void *v77;
  void *v78;
  id v79;
  id v80;
  void *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  _PASLock *cacheLock;
  id v87;
  NSObject *v88;
  NSObject *v89;
  os_signpost_id_t spid;
  id v91;
  void *v92;
  void *v93;
  unint64_t v94;
  void *v95;
  os_signpost_id_t v96;
  _QWORD v98[4];
  id v99;
  id v100;
  uint8_t v101[8];
  uint64_t v102;
  void (*v103)(uint64_t, void *, uint64_t);
  void *v104;
  id v105;
  id v106;
  _BYTE buf[24];
  void *v108;
  id v109;
  id v110;
  id v111;
  unint64_t v112;
  uint64_t v113;

  v113 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, PPLocalQuickTypeBroker *, void *))a5;
  pp_quicktype_log_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = a4;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v8;
    _os_log_impl(&dword_1C392E000, v10, OS_LOG_TYPE_DEFAULT, "PPQuickTypeBroker quickTypeItemsForQuery limit: %lu query: %@", buf, 0x16u);
  }

  pp_quicktype_signpost_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_generate(v11);

  pp_quicktype_signpost_handle();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v15 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PPLocalQuickTypeBroker.quickTypeItemsWithQuery", ", buf, 2u);
  }

  v16 = (void *)objc_opt_new();
  v17 = v8;
  v18 = v17;
  if (!self)
  {
    v28 = 0;
    goto LABEL_18;
  }
  objc_msgSend(v17, "recipients");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPLocalQuickTypeBroker _cacheEntryWithRecipients:]((uint64_t)self, v19);
  v20 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  if (!v20 || !objc_msgSend(v18, "isResultEquivelentToQuickTypeQuery:", v20[2]))
    goto LABEL_16;
  v21 = v20;
  v22 = v18;
  v23 = objc_msgSend(v22, "type");
  if (v23 == 2)
  {
    objc_msgSend(v21[3], "timeIntervalSinceNow");
    v25 = v24;

    v26 = -900.0;
    goto LABEL_15;
  }
  if (v23 == 4)
  {
    objc_msgSend(v21[3], "timeIntervalSinceNow");
    v25 = v27;

    v26 = -60.0;
LABEL_15:
    if (v25 <= v26)
      goto LABEL_16;
LABEL_75:
    v28 = v21[1];
    goto LABEL_17;
  }
  if (v23 != 5)
  {

    goto LABEL_75;
  }

LABEL_16:
  v28 = 0;
LABEL_17:

LABEL_18:
  v29 = (PPLocalQuickTypeBroker *)objc_msgSend(v28, "mutableCopy");

  if (v29 && -[PPLocalQuickTypeBroker count](v29, "count"))
  {
    pp_quicktype_log_handle();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      v31 = -[PPLocalQuickTypeBroker count](v29, "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v31;
      _os_log_impl(&dword_1C392E000, p_super, OS_LOG_TYPE_DEFAULT, "PQT item cache hit with %tu items", buf, 0xCu);
    }
  }
  else
  {
    v94 = v12 - 1;
    v96 = v12;
    v32 = v18;
    v95 = v16;
    v33 = v16;
    v92 = v33;
    v93 = v32;
    if (self)
    {
      v34 = v33;
      v35 = (void *)objc_opt_new();
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __84__PPLocalQuickTypeBroker__quickTypeItemsFromServantsWithQuery_limit_explanationSet___block_invoke;
      v108 = &unk_1E7E19448;
      v36 = v32;
      v109 = v36;
      v112 = a4;
      v110 = v34;
      v91 = v35;
      v37 = v35;
      v111 = v37;
      v38 = (void (**)(void *, PPQuickTypeContactsServant *))_Block_copy(buf);
      switch(objc_msgSend(v36, "type"))
      {
        case 0u:
          pp_quicktype_signpost_handle();
          v39 = objc_claimAutoreleasedReturnValue();
          v40 = os_signpost_id_generate(v39);

          pp_quicktype_signpost_handle();
          v41 = objc_claimAutoreleasedReturnValue();
          v42 = v41;
          spid = v40;
          v43 = v40 - 1;
          if (v43 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
          {
            *(_WORD *)v101 = 0;
            _os_signpost_emit_with_name_impl(&dword_1C392E000, v42, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PPLocalQuickTypeBroker.quickTypeItems.semantic", ", v101, 2u);
          }

          v38[2](v38, self->_contactsServant);
          v38[2](v38, (PPQuickTypeContactsServant *)self->_connectionsServant);
          pp_quicktype_signpost_handle();
          v44 = objc_claimAutoreleasedReturnValue();
          v45 = v44;
          if (v43 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v44))
            goto LABEL_61;
          *(_WORD *)v101 = 0;
          v46 = "PPLocalQuickTypeBroker.quickTypeItems.semantic";
          break;
        case 1u:
          pp_quicktype_signpost_handle();
          v47 = objc_claimAutoreleasedReturnValue();
          v48 = os_signpost_id_generate(v47);

          pp_quicktype_signpost_handle();
          v49 = objc_claimAutoreleasedReturnValue();
          v50 = v49;
          spid = v48;
          v51 = v48 - 1;
          if (v51 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
          {
            *(_WORD *)v101 = 0;
            _os_signpost_emit_with_name_impl(&dword_1C392E000, v50, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PPLocalQuickTypeBroker.quickTypeItems.contacts", ", v101, 2u);
          }

          v38[2](v38, self->_contactsServant);
          pp_quicktype_signpost_handle();
          v52 = objc_claimAutoreleasedReturnValue();
          v45 = v52;
          if (v51 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v52))
            goto LABEL_61;
          *(_WORD *)v101 = 0;
          v46 = "PPLocalQuickTypeBroker.quickTypeItems.contacts";
          break;
        case 2u:
          pp_quicktype_signpost_handle();
          v53 = objc_claimAutoreleasedReturnValue();
          v54 = os_signpost_id_generate(v53);

          pp_quicktype_signpost_handle();
          v55 = objc_claimAutoreleasedReturnValue();
          v56 = v55;
          spid = v54;
          v57 = v54 - 1;
          if (v57 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v55))
          {
            *(_WORD *)v101 = 0;
            _os_signpost_emit_with_name_impl(&dword_1C392E000, v56, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PPLocalQuickTypeBroker.quickTypeItems.events", ", v101, 2u);
          }

          v38[2](v38, (PPQuickTypeContactsServant *)self->_eventsServant);
          pp_quicktype_signpost_handle();
          v58 = objc_claimAutoreleasedReturnValue();
          v45 = v58;
          if (v57 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v58))
            goto LABEL_61;
          *(_WORD *)v101 = 0;
          v46 = "PPLocalQuickTypeBroker.quickTypeItems.events";
          break;
        case 3u:
          pp_quicktype_signpost_handle();
          v59 = objc_claimAutoreleasedReturnValue();
          v60 = os_signpost_id_generate(v59);

          pp_quicktype_signpost_handle();
          v61 = objc_claimAutoreleasedReturnValue();
          v62 = v61;
          spid = v60;
          v63 = v60 - 1;
          if (v63 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v61))
          {
            *(_WORD *)v101 = 0;
            _os_signpost_emit_with_name_impl(&dword_1C392E000, v62, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PPLocalQuickTypeBroker.quickTypeItems.connections", ", v101, 2u);
          }

          v38[2](v38, (PPQuickTypeContactsServant *)self->_connectionsServant);
          pp_quicktype_signpost_handle();
          v64 = objc_claimAutoreleasedReturnValue();
          v45 = v64;
          if (v63 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v64))
            goto LABEL_61;
          *(_WORD *)v101 = 0;
          v46 = "PPLocalQuickTypeBroker.quickTypeItems.connections";
          break;
        case 4u:
          pp_quicktype_signpost_handle();
          v65 = objc_claimAutoreleasedReturnValue();
          v66 = os_signpost_id_generate(v65);

          pp_quicktype_signpost_handle();
          v67 = objc_claimAutoreleasedReturnValue();
          v68 = v67;
          spid = v66;
          v69 = v66 - 1;
          if (v69 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v67))
          {
            *(_WORD *)v101 = 0;
            _os_signpost_emit_with_name_impl(&dword_1C392E000, v68, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PPLocalQuickTypeBroker.quickTypeItems.navigation", ", v101, 2u);
          }

          v38[2](v38, (PPQuickTypeContactsServant *)self->_navigationServant);
          pp_quicktype_signpost_handle();
          v70 = objc_claimAutoreleasedReturnValue();
          v45 = v70;
          if (v69 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v70))
            goto LABEL_61;
          *(_WORD *)v101 = 0;
          v46 = "PPLocalQuickTypeBroker.quickTypeItems.navigation";
          break;
        case 5u:
          pp_quicktype_signpost_handle();
          v71 = objc_claimAutoreleasedReturnValue();
          v72 = os_signpost_id_generate(v71);

          pp_quicktype_signpost_handle();
          v73 = objc_claimAutoreleasedReturnValue();
          v74 = v73;
          spid = v72;
          v75 = v72 - 1;
          if (v75 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v73))
          {
            *(_WORD *)v101 = 0;
            _os_signpost_emit_with_name_impl(&dword_1C392E000, v74, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PPLocalQuickTypeBroker.quickTypeItems.url", ", v101, 2u);
          }

          v38[2](v38, (PPQuickTypeContactsServant *)self->_urlServant);
          pp_quicktype_signpost_handle();
          v76 = objc_claimAutoreleasedReturnValue();
          v45 = v76;
          if (v75 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v76))
            goto LABEL_61;
          *(_WORD *)v101 = 0;
          v46 = "PPLocalQuickTypeBroker.quickTypeItems.url";
          break;
        default:
          goto LABEL_62;
      }
      _os_signpost_emit_with_name_impl(&dword_1C392E000, v45, OS_SIGNPOST_INTERVAL_END, spid, v46, "", v101, 2u);
LABEL_61:

LABEL_62:
      if ((unint64_t)objc_msgSend(v37, "count", spid) >= 2)
      {
        objc_msgSend(v37, "sortUsingSelector:", sel_reverseCompare_);
        v77 = (void *)objc_opt_new();
        v78 = (void *)objc_opt_new();
        *(_QWORD *)v101 = MEMORY[0x1E0C809B0];
        v102 = 3221225472;
        v103 = __84__PPLocalQuickTypeBroker__quickTypeItemsFromServantsWithQuery_limit_explanationSet___block_invoke_90;
        v104 = &unk_1E7E19470;
        v105 = v77;
        v106 = v78;
        v79 = v78;
        v80 = v77;
        objc_msgSend(v37, "enumerateObjectsUsingBlock:", v101);
        objc_msgSend(v37, "removeObjectsAtIndexes:", v79);

      }
      objc_msgSend(v36, "recipients");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPLocalQuickTypeBroker _recipientItemCacheKeyForRecipients:](v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();

      if (v82)
      {
        v83 = objc_opt_new();
        objc_storeStrong((id *)(v83 + 16), a3);
        objc_storeStrong((id *)(v83 + 8), v91);
        v84 = objc_opt_new();
        v85 = *(void **)(v83 + 24);
        *(_QWORD *)(v83 + 24) = v84;

        cacheLock = self->_cacheLock;
        v98[0] = MEMORY[0x1E0C809B0];
        v98[1] = 3221225472;
        v98[2] = __84__PPLocalQuickTypeBroker__quickTypeItemsFromServantsWithQuery_limit_explanationSet___block_invoke_2;
        v98[3] = &unk_1E7E19498;
        v99 = (id)v83;
        v100 = v82;
        v87 = (id)v83;
        -[_PASLock runWithLockAcquired:](cacheLock, "runWithLockAcquired:", v98);

      }
      self = (PPLocalQuickTypeBroker *)v37;

    }
    v15 = v94;
    v16 = v95;

    p_super = &v29->super;
    v29 = self;
    v12 = v96;
  }

  if (-[PPLocalQuickTypeBroker count](v29, "count") > a4)
    -[PPLocalQuickTypeBroker removeObjectsInRange:](v29, "removeObjectsInRange:", a4, -[PPLocalQuickTypeBroker count](v29, "count") - a4);
  pp_quicktype_signpost_handle();
  v88 = objc_claimAutoreleasedReturnValue();
  v89 = v88;
  if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v88))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v89, OS_SIGNPOST_INTERVAL_END, v12, "PPLocalQuickTypeBroker.quickTypeItemsWithQuery", ", buf, 2u);
  }

  v9[2](v9, v29, v16);
}

- (void)quickTypeItemsWithLanguageModelingTokens:(id)a3 localeIdentifier:(id)a4 recipients:(id)a5 bundleIdentifier:(id)a6 limit:(unint64_t)a7 completion:(id)a8
{
  void *v14;
  id v15;
  id v16;

  v14 = (void *)MEMORY[0x1E0D70C20];
  v15 = a8;
  objc_msgSend(v14, "quickTypeQueryFromLMTokens:localeIdentifier:recipients:bundleIdentifier:", a3, a4, a5, a6);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[PPLocalQuickTypeBroker quickTypeItemsWithQuery:limit:completion:](self, "quickTypeItemsWithQuery:limit:completion:", v16, a7, v15);

}

- (void)recentQuickTypeItemsForRecipients:(id)a3 completion:(id)a4
{
  void (**v6)(id, id);
  uint64_t v7;
  void *v8;
  id v9;

  v6 = (void (**)(id, id))a4;
  if (self)
  {
    -[PPLocalQuickTypeBroker _cacheEntryWithRecipients:]((uint64_t)self, a3);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
      v9 = *(id *)(v7 + 8);
    else
      v9 = 0;

    v6[2](v6, v9);
  }
  else
  {
    v9 = 0;
    v6[2](v6, 0);
  }

}

- (void)hibernateWithCompletion:(id)a3
{
  void (**v3)(_QWORD);
  NSObject *v4;
  uint8_t v5[16];

  v3 = (void (**)(_QWORD))a3;
  pp_quicktype_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_INFO, "PPLocalQuickTypeBroker: hibernate", v5, 2u);
  }

  if (v3)
    v3[2](v3);

}

- (void)registerFeedback:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  pp_private_log_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v13 = 138412290;
    v14 = v6;
    _os_log_debug_impl(&dword_1C392E000, v8, OS_LOG_TYPE_DEBUG, "QuickType feedback received: %@", (uint8_t *)&v13, 0xCu);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PPQuickTypeContactsServant registerFeedback:](self->_contactsServant, "registerFeedback:", v6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PPQuickTypeEventsServant registerFeedback:](self->_eventsServant, "registerFeedback:", v6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PPQuickTypeConnectionsServant registerFeedback:](self->_connectionsServant, "registerFeedback:", v6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PPQuickTypeNavigationServant registerFeedback:](self->_navigationServant, "registerFeedback:", v6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PPQuickTypeURLServant registerFeedback:](self->_urlServant, "registerFeedback:", v6);
  +[PPInternalFeedback fromBaseFeedback:storeType:](PPInternalFeedback, "fromBaseFeedback:storeType:", v6, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPLocalQuickTypeBroker filterFeedback:](self, "filterFeedback:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)objc_opt_new();
    objc_msgSend(v11, "storePendingFeedback:storeType:error:", v10, 7, 0);
    if (v7)
      v7[2](v7, 1, 0);

  }
  else
  {
    pp_quicktype_log_handle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1C392E000, v12, OS_LOG_TYPE_DEFAULT, "registerFeedback had no matches after filtering", (uint8_t *)&v13, 2u);
    }

    if (v7)
      v7[2](v7, 1, 0);
  }

}

- (void)processFeedback:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "feedbackItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = (void *)objc_opt_new();
    v7 = (void *)objc_opt_new();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(v3, "feedbackItems", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v33 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v13, "itemString");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "length");

          if (v15)
            v16 = v6;
          else
            v16 = v7;
          objc_msgSend(v16, "addObject:", v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v10);
    }

    if (objc_msgSend(v6, "count"))
    {
      v17 = objc_alloc(MEMORY[0x1E0D70AD0]);
      objc_msgSend(v3, "timestamp");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "clientIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "clientBundleId");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "mappingId");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v17, "initWithFeedbackItems:timestamp:clientIdentifier:clientBundleId:mappingId:", v6, v18, v19, v20, v21);

      +[PPFeedbackStorage logFeedback:domain:domainStatus:inBackground:](PPFeedbackStorage, "logFeedback:domain:domainStatus:inBackground:", v22, 6, 2, 1);
      objc_msgSend(v22, "feedbackItems");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "clientBundleId");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "clientIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPFeedbackUtils recordUserEventsFromFeedback:matchingFeedbackItems:clientBundleId:clientIdentifier:domain:](PPFeedbackUtils, "recordUserEventsFromFeedback:matchingFeedbackItems:clientBundleId:clientIdentifier:domain:", v3, v23, v24, v25, 6);

    }
    if (objc_msgSend(v7, "count"))
    {
      v26 = objc_alloc(MEMORY[0x1E0D70AD0]);
      objc_msgSend(v3, "timestamp");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "clientIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "clientBundleId");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "mappingId");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_msgSend(v26, "initWithFeedbackItems:timestamp:clientIdentifier:clientBundleId:mappingId:", v7, v27, v28, v29, v30);

      +[PPFeedbackStorage logFeedback:domain:domainStatus:inBackground:](PPFeedbackStorage, "logFeedback:domain:domainStatus:inBackground:", v31, 6, 1, 1);
    }

  }
}

- (id)filterFeedback:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _PASLock *cacheLock;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  PPInternalFeedback *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  PPInternalFeedback *v26;
  void *context;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  context = (void *)MEMORY[0x1C3BD6630]();
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(v4, "feedbackItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v35;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v35 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v11), "itemString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v9);
  }

  v13 = MEMORY[0x1E0C809B0];
  cacheLock = self->_cacheLock;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __41__PPLocalQuickTypeBroker_filterFeedback___block_invoke;
  v31[3] = &unk_1E7E19498;
  v32 = v5;
  v15 = v6;
  v33 = v15;
  v16 = v5;
  -[_PASLock runWithLockAcquired:](cacheLock, "runWithLockAcquired:", v31);
  objc_msgSend(v4, "feedbackItems");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v13;
  v29[1] = 3221225472;
  v29[2] = __41__PPLocalQuickTypeBroker_filterFeedback___block_invoke_3;
  v29[3] = &unk_1E7E19510;
  v30 = v15;
  v18 = v15;
  objc_msgSend(v17, "_pas_mappedArrayWithTransform:", v29);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = [PPInternalFeedback alloc];
  objc_msgSend(v4, "timestamp");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientBundleId");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mappingId");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "build");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[PPInternalFeedback initWithFeedbackItems:timestamp:clientIdentifier:clientBundleId:mappingId:storeType:build:](v20, "initWithFeedbackItems:timestamp:clientIdentifier:clientBundleId:mappingId:storeType:build:", v19, v21, v22, v23, v24, 7, v25);

  objc_autoreleasePoolPop(context);
  return v26;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheLock, 0);
  objc_storeStrong((id *)&self->_urlServant, 0);
  objc_storeStrong((id *)&self->_connectionsServant, 0);
  objc_storeStrong((id *)&self->_eventsServant, 0);
  objc_storeStrong((id *)&self->_contactsServant, 0);
  objc_storeStrong((id *)&self->_navigationServant, 0);
}

void __41__PPLocalQuickTypeBroker_filterFeedback___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v3 = *(void **)(a2 + 16);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__PPLocalQuickTypeBroker_filterFeedback___block_invoke_2;
  v4[3] = &unk_1E7E194E8;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v4);

}

id __41__PPLocalQuickTypeBroker_filterFeedback___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "itemString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4)
    v6 = v3;
  else
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D70B60]), "initWithItemString:itemFeedbackType:", &stru_1E7E221D0, objc_msgSend(v3, "itemFeedbackType"));
  v7 = v6;

  return v7;
}

void __41__PPLocalQuickTypeBroker_filterFeedback___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = *(id *)(a3 + 8);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
      v10 = *(void **)(a1 + 32);
      objc_msgSend(v9, "value", (_QWORD)v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v10) = objc_msgSend(v10, "containsObject:", v11);

      if ((_DWORD)v10)
      {
        v12 = *(void **)(a1 + 40);
        objc_msgSend(v9, "value");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v13);

      }
      v14 = objc_msgSend(*(id *)(a1 + 40), "count");
      if (v14 == objc_msgSend(*(id *)(a1 + 32), "count"))
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (id)_cacheEntryWithRecipients:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = a2;
  -[PPLocalQuickTypeBroker _recipientItemCacheKeyForRecipients:](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__10610;
    v16 = __Block_byref_object_dispose__10611;
    v17 = 0;
    v6 = *(void **)(a1 + 48);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __52__PPLocalQuickTypeBroker__cacheEntryWithRecipients___block_invoke;
    v9[3] = &unk_1E7E194C0;
    v11 = &v12;
    v10 = v5;
    objc_msgSend(v6, "runWithLockAcquired:", v9);
    v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_recipientItemCacheKeyForRecipients:(void *)a1
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "sortedArrayUsingSelector:", sel_compare_);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_pas_componentsJoinedByString:", CFSTR(":"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void __52__PPLocalQuickTypeBroker__cacheEntryWithRecipients___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = *(id *)(a1 + 32);
  if (a2)
  {
    objc_msgSend(*(id *)(a2 + 16), "objectForKeyedSubscript:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(*(id *)(a2 + 8), "removeObject:", v4);
      objc_msgSend(*(id *)(a2 + 8), "addObject:", v4);
    }
    v6 = objc_msgSend(*(id *)(a2 + 8), "count");
    if (v6 != objc_msgSend(*(id *)(a2 + 16), "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", sel_entryWithKey_, a2, CFSTR("PPLocalQuickTypeBroker.m"), 65, CFSTR("PQT cache count mismatch"));

    }
  }
  else
  {
    v5 = 0;
  }

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

}

void __84__PPLocalQuickTypeBroker__quickTypeItemsFromServantsWithQuery_limit_explanationSet___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v3, "quickTypeItemsWithQuery:limit:explanationSet:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    pp_quicktype_log_handle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_opt_class();
      v8 = v7;
      v9 = objc_msgSend(v5, "count");
      v10 = objc_msgSend(*(id *)(a1 + 40), "count");
      v11 = 138412802;
      v12 = v7;
      v13 = 2048;
      v14 = v9;
      v15 = 2048;
      v16 = v10;
      _os_log_impl(&dword_1C392E000, v6, OS_LOG_TYPE_DEFAULT, "%@ returned %lu items and explanation set now has %lu explanations", (uint8_t *)&v11, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:", v5);
  }

  objc_autoreleasePoolPop(v4);
}

void __84__PPLocalQuickTypeBroker__quickTypeItemsFromServantsWithQuery_limit_explanationSet___block_invoke_90(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v10 = v5;
  objc_msgSend(v5, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v6, "containsObject:", v7);

  if ((_DWORD)v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v10, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

  }
}

uint64_t __84__PPLocalQuickTypeBroker__quickTypeItemsFromServantsWithQuery_limit_explanationSet___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setEntry:key:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __51__PPLocalQuickTypeBroker__registerForNotifications__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (v1)
    return objc_msgSend(*(id *)(v1 + 48), "runWithLockAcquired:", &__block_literal_global_81_10665);
  return result;
}

uint64_t __51__PPLocalQuickTypeBroker__registerForNotifications__block_invoke_2(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (v1)
    return objc_msgSend(*(id *)(v1 + 48), "runWithLockAcquired:", &__block_literal_global_81_10665);
  return result;
}

void __38__PPLocalQuickTypeBroker__clearCaches__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint8_t v8[16];

  v2 = a2;
  pp_quicktype_log_handle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1C392E000, v3, OS_LOG_TYPE_INFO, "PPLocalQuickTypeBroker: clearing caches", v8, 2u);
  }

  if (v2)
  {
    v4 = objc_opt_new();
    v5 = (void *)v2[1];
    v2[1] = v4;

    v6 = objc_opt_new();
    v7 = (void *)v2[2];
    v2[2] = v6;

  }
}

void __40__PPLocalQuickTypeBroker_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_10669;
  sharedInstance__pasExprOnceResult_10669 = v1;

  objc_autoreleasePoolPop(v0);
}

@end
