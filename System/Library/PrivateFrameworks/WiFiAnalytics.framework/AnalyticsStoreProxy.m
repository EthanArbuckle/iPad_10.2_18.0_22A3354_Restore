@implementation AnalyticsStoreProxy

+ (id)fetchAll:(id)a3 moc:(id)a4
{
  id v4;
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _BYTE *v15;
  _BYTE buf[24];
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    WALogCategoryDefaultHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "+[AnalyticsStoreProxy fetchAll:moc:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 18;
      _os_log_impl(&dword_212581000, v11, OS_LOG_TYPE_ERROR, "%{public}s::%d:moc nil", buf, 0x12u);
    }

    goto LABEL_7;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v17 = __Block_byref_object_copy__1;
  v18 = __Block_byref_object_dispose__1;
  v19 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __36__AnalyticsStoreProxy_fetchAll_moc___block_invoke;
  v12[3] = &unk_24CDDDB38;
  v15 = buf;
  v13 = v6;
  v14 = v7;
  objc_msgSend(v14, "performBlockAndWait:", v12);
  v8 = *(void **)(*(_QWORD *)&buf[8] + 40);
  if (v8 && objc_msgSend(v8, "count"))
  {
    v4 = *(id *)(*(_QWORD *)&buf[8] + 40);
    v9 = 0;
  }
  else
  {
    v9 = 1;
  }

  _Block_object_dispose(buf, 8);
  if (v9)
LABEL_7:
    v4 = 0;

  return v4;
}

void __36__AnalyticsStoreProxy_fetchAll_moc___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  +[AnalyticsStoreProxy fetchRequestForEntity:](AnalyticsStoreProxy, "fetchRequestForEntity:", a1[4]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[AnalyticsStoreProxy fetch:withPredicate:moc:](AnalyticsStoreProxy, "fetch:withPredicate:moc:", v5, 0, a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (id)createEntity:(id)a3 moc:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _BYTE *v18;
  uint8_t v19[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  id v24;
  _BYTE buf[24];
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    WALogCategoryDefaultHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "+[AnalyticsStoreProxy createEntity:moc:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 33;
      v13 = "%{public}s::%d:entityName nil";
LABEL_12:
      _os_log_impl(&dword_212581000, v12, OS_LOG_TYPE_ERROR, v13, buf, 0x12u);
    }
LABEL_13:

LABEL_6:
    v9 = 0;
    goto LABEL_7;
  }
  if (!v6)
  {
    WALogCategoryDefaultHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "+[AnalyticsStoreProxy createEntity:moc:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 34;
      v13 = "%{public}s::%d:moc nil";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v26 = __Block_byref_object_copy__1;
  v27 = __Block_byref_object_dispose__1;
  v28 = 0;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __40__AnalyticsStoreProxy_createEntity_moc___block_invoke;
  v15[3] = &unk_24CDDDB38;
  v18 = buf;
  v8 = v5;
  v16 = v8;
  v17 = v7;
  objc_msgSend(v17, "performBlockAndWait:", v15);
  v9 = *(void **)(*(_QWORD *)&buf[8] + 40);
  if (v9)
  {
    v10 = v9;
  }
  else
  {
    WALogCategoryDefaultHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v19 = 136446722;
      v20 = "+[AnalyticsStoreProxy createEntity:moc:]";
      v21 = 1024;
      v22 = 41;
      v23 = 2112;
      v24 = v8;
      _os_log_impl(&dword_212581000, v14, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error creating entity:%@", v19, 0x1Cu);
    }

  }
  _Block_object_dispose(buf, 8);

  if (!v9)
    goto LABEL_6;
LABEL_7:

  return v9;
}

void __40__AnalyticsStoreProxy_createEntity_moc___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBB658], "insertNewObjectForEntityForName:inManagedObjectContext:", a1[4], a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  WALogCategoryDefaultHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7 = a1[4];
    v6 = a1[5];
    v8 = 136446978;
    v9 = "+[AnalyticsStoreProxy createEntity:moc:]_block_invoke";
    v10 = 1024;
    v11 = 39;
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_212581000, v5, OS_LOG_TYPE_DEBUG, "%{public}s::%d:[moc: %@] Inserted new %@", (uint8_t *)&v8, 0x26u);
  }

}

+ (id)fetchFirst:(id)a3 withPredicate:(id)a4 moc:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "setFetchLimit:", 1);
  objc_msgSend(a1, "fetch:withPredicate:moc:", v10, v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)fetch:(id)a3 withPredicate:(id)a4 moc:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(_QWORD *);
  void *v24;
  id v25;
  id v26;
  _BYTE *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint8_t v35[4];
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  _BYTE buf[24];
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!v7)
  {
    WALogCategoryDefaultHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "+[AnalyticsStoreProxy fetch:withPredicate:moc:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 59;
      v16 = "%{public}s::%d:fetch request nil";
LABEL_14:
      _os_log_impl(&dword_212581000, v15, OS_LOG_TYPE_ERROR, v16, buf, 0x12u);
    }
LABEL_15:

LABEL_8:
    v12 = 0;
    goto LABEL_9;
  }
  if (!v9)
  {
    WALogCategoryDefaultHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "+[AnalyticsStoreProxy fetch:withPredicate:moc:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 60;
      v16 = "%{public}s::%d:moc request nil";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v46 = __Block_byref_object_copy__1;
  v47 = __Block_byref_object_dispose__1;
  v48 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__1;
  v33 = __Block_byref_object_dispose__1;
  v34 = 0;
  if (v8)
    objc_msgSend(v7, "setPredicate:", v8);
  v21 = MEMORY[0x24BDAC760];
  v22 = 3221225472;
  v23 = __47__AnalyticsStoreProxy_fetch_withPredicate_moc___block_invoke;
  v24 = &unk_24CDDDB60;
  v27 = buf;
  v25 = v10;
  v11 = v7;
  v26 = v11;
  v28 = &v29;
  objc_msgSend(v25, "performBlockAndWait:", &v21);
  v12 = *(void **)(*(_QWORD *)&buf[8] + 40);
  if (v12)
  {
    v13 = v12;
  }
  else
  {
    WALogCategoryDefaultHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "entityName", v21, v22, v23, v24, v25);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v30[5], "localizedDescription");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v30[5], "userInfo");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v35 = 136447234;
      v36 = "+[AnalyticsStoreProxy fetch:withPredicate:moc:]";
      v37 = 1024;
      v38 = 71;
      v39 = 2112;
      v40 = v18;
      v41 = 2112;
      v42 = v19;
      v43 = 2112;
      v44 = v20;
      _os_log_impl(&dword_212581000, v17, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error fetching %@. %@ %@", v35, 0x30u);

    }
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(buf, 8);

  if (!v12)
    goto LABEL_8;
LABEL_9:

  return v12;
}

void __47__AnalyticsStoreProxy_fetch_withPredicate_moc___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

+ (id)fetchRequestForEntity:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WALogCategoryDefaultHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446466;
      v6 = "+[AnalyticsStoreProxy fetchRequestForEntity:]";
      v7 = 1024;
      v8 = 79;
      _os_log_impl(&dword_212581000, v4, OS_LOG_TYPE_ERROR, "%{public}s::%d:entityName nil", (uint8_t *)&v5, 0x12u);
    }

    return 0;
  }
}

+ (unint64_t)entityCount:(id)a3 withPredicate:(id)a4 moc:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!v7)
  {
    WALogCategoryDefaultHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_DWORD *)buf = 136446466;
    v26 = "+[AnalyticsStoreProxy entityCount:withPredicate:moc:]";
    v27 = 1024;
    v28 = 89;
    v17 = "%{public}s::%d:entityName nil";
LABEL_12:
    v18 = v16;
    v19 = 18;
LABEL_15:
    _os_log_impl(&dword_212581000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
    goto LABEL_16;
  }
  if (!v9)
  {
    WALogCategoryDefaultHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_DWORD *)buf = 136446466;
    v26 = "+[AnalyticsStoreProxy entityCount:withPredicate:moc:]";
    v27 = 1024;
    v28 = 90;
    v17 = "%{public}s::%d:entityName nil";
    goto LABEL_12;
  }
  +[AnalyticsStoreProxy fetchRequestForEntity:](AnalyticsStoreProxy, "fetchRequestForEntity:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    WALogCategoryDefaultHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v26 = "+[AnalyticsStoreProxy entityCount:withPredicate:moc:]";
      v27 = 1024;
      v28 = 93;
      v29 = 2112;
      v30 = v7;
      v17 = "%{public}s::%d:fetch request nil for entity:%@";
      v18 = v16;
      v19 = 28;
      goto LABEL_15;
    }
LABEL_16:
    v12 = 0;
    v13 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_20:

    goto LABEL_7;
  }
  v12 = v11;
  if (v8)
    objc_msgSend(v11, "setPredicate:", v8);
  v24 = 0;
  v13 = objc_msgSend(v10, "countForFetchRequest:error:", v12, &v24);
  v14 = v24;
  if (v14)
  {
    v16 = v14;
    WALogCategoryDefaultHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "entityName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject localizedDescription](v16, "localizedDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject userInfo](v16, "userInfo");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136447234;
      v26 = "+[AnalyticsStoreProxy entityCount:withPredicate:moc:]";
      v27 = 1024;
      v28 = 100;
      v29 = 2112;
      v30 = v21;
      v31 = 2112;
      v32 = v22;
      v33 = 2112;
      v34 = v23;
      _os_log_impl(&dword_212581000, v20, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error countForFetchRequest for entity %@. %@ %@", buf, 0x30u);

    }
    goto LABEL_20;
  }
LABEL_7:

  return v13;
}

+ (id)entityByCounting:(id)a3 withPredicate:(id)a4 created:(BOOL *)a5 moc:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  int v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = v11;
  if (!v9)
  {
    WALogCategoryDefaultHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    v23 = 136446466;
    v24 = "+[AnalyticsStoreProxy entityByCounting:withPredicate:created:moc:]";
    v25 = 1024;
    v26 = 106;
    v15 = "%{public}s::%d:entityName nil";
    goto LABEL_26;
  }
  if (!v11)
  {
    WALogCategoryDefaultHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    v23 = 136446466;
    v24 = "+[AnalyticsStoreProxy entityByCounting:withPredicate:created:moc:]";
    v25 = 1024;
    v26 = 107;
    v15 = "%{public}s::%d:moc nil";
LABEL_26:
    v16 = v14;
    v17 = 18;
    goto LABEL_7;
  }
  v13 = +[AnalyticsStoreProxy entityCount:withPredicate:moc:](AnalyticsStoreProxy, "entityCount:withPredicate:moc:", v9, v10, v11);
  if (v13)
  {
    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
      WALogCategoryDefaultHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
LABEL_20:

        v18 = 0;
        goto LABEL_21;
      }
      v23 = 136446722;
      v24 = "+[AnalyticsStoreProxy entityByCounting:withPredicate:created:moc:]";
      v25 = 1024;
      v26 = 111;
      v27 = 2112;
      v28 = v9;
      v15 = "%{public}s::%d:count NSNotFound for entity:%@";
      v16 = v14;
      v17 = 28;
LABEL_7:
      _os_log_impl(&dword_212581000, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v23, v17);
      goto LABEL_20;
    }
    +[AnalyticsStoreProxy fetchRequestForEntity:](AnalyticsStoreProxy, "fetchRequestForEntity:", v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[AnalyticsStoreProxy fetch:withPredicate:moc:](AnalyticsStoreProxy, "fetch:withPredicate:moc:", v19, v10, v12);
    v14 = objc_claimAutoreleasedReturnValue();

    if (!v14 || !-[NSObject count](v14, "count"))
    {
      WALogCategoryDefaultHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v10, "predicateFormat");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 136446978;
        v24 = "+[AnalyticsStoreProxy entityByCounting:withPredicate:created:moc:]";
        v25 = 1024;
        v26 = 130;
        v27 = 2112;
        v28 = v9;
        v29 = 2112;
        v30 = v21;
        _os_log_impl(&dword_212581000, v20, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error fetching entity %@ with predicate %@", (uint8_t *)&v23, 0x26u);

      }
      goto LABEL_20;
    }
    if (a5)
      *a5 = 0;
    if (-[NSObject count](v14, "count") != 1)
      abort();
    -[NSObject firstObject](v14, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (a5)
      *a5 = 1;
    +[AnalyticsStoreProxy createEntity:moc:](AnalyticsStoreProxy, "createEntity:moc:", v9, v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_21:

  return v18;
}

+ (id)entity:(id)a3 withPredicate:(id)a4 created:(BOOL *)a5 moc:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(_QWORD *);
  void *v23;
  id v24;
  id v25;
  id v26;
  _BYTE *v27;
  _BYTE buf[24];
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = v11;
  if (!v9)
  {
    WALogCategoryDefaultHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "+[AnalyticsStoreProxy entity:withPredicate:created:moc:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 139;
      _os_log_impl(&dword_212581000, v19, OS_LOG_TYPE_ERROR, "%{public}s::%d:entityName nil", buf, 0x12u);
    }
    goto LABEL_19;
  }
  if (!v11)
  {
    WALogCategoryDefaultHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "+[AnalyticsStoreProxy entity:withPredicate:created:moc:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 140;
      _os_log_impl(&dword_212581000, v19, OS_LOG_TYPE_ERROR, "%{public}s::%d:moc nil", buf, 0x12u);
    }
LABEL_19:

    v17 = 0;
    goto LABEL_13;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v29 = __Block_byref_object_copy__1;
  v30 = __Block_byref_object_dispose__1;
  v31 = 0;
  v20 = MEMORY[0x24BDAC760];
  v21 = 3221225472;
  v22 = __56__AnalyticsStoreProxy_entity_withPredicate_created_moc___block_invoke;
  v23 = &unk_24CDDDB88;
  v27 = buf;
  v13 = v9;
  v24 = v13;
  v25 = v10;
  v14 = v12;
  v26 = v14;
  objc_msgSend(v14, "performBlockAndWait:", &v20);
  v15 = *(void **)(*(_QWORD *)&buf[8] + 40);
  if (v15 && objc_msgSend(v15, "count", v20, v21, v22, v23, v24, v25))
  {
    if (a5)
      *a5 = 0;
    if (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count") != 1)
      abort();
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "firstObject");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a5)
      *a5 = 1;
    +[AnalyticsStoreProxy createEntity:moc:](AnalyticsStoreProxy, "createEntity:moc:", v13, v14, v20, v21, v22, v23);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v17 = (void *)v16;

  _Block_object_dispose(buf, 8);
LABEL_13:

  return v17;
}

void __56__AnalyticsStoreProxy_entity_withPredicate_created_moc___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  +[AnalyticsStoreProxy fetchRequestForEntity:](AnalyticsStoreProxy, "fetchRequestForEntity:", a1[4]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[AnalyticsStoreProxy fetch:withPredicate:moc:](AnalyticsStoreProxy, "fetch:withPredicate:moc:", v5, a1[5], a1[6]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[7] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (id)fetchRequestForEntityWithOffset:(id)a3 limit:(unint64_t)a4 offset:(unint64_t)a5 prefetch:(id)a6
{
  id v9;
  void *v10;

  v9 = a6;
  +[AnalyticsStoreProxy fetchRequestForEntity:](AnalyticsStoreProxy, "fetchRequestForEntity:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFetchLimit:", a4);
  objc_msgSend(v10, "setFetchOffset:", a5);
  if (v9)
    objc_msgSend(v10, "setRelationshipKeyPathsForPrefetching:", v9);

  return v10;
}

+ (id)fetchRequestForEntityWithBatchSize:(id)a3 batchSize:(unint64_t)a4 prefetch:(id)a5
{
  id v7;
  void *v8;

  v7 = a5;
  +[AnalyticsStoreProxy fetchRequestForEntity:](AnalyticsStoreProxy, "fetchRequestForEntity:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFetchBatchSize:", a4);
  if (v7)
    objc_msgSend(v8, "setRelationshipKeyPathsForPrefetching:", v7);

  return v8;
}

+ (id)predicateForEntityWithAge:(id)a3 maxAge:(unint64_t)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  +[AnalyticsStoreProxy analyticsStoreEntitiesWithDate](AnalyticsStoreProxy, "analyticsStoreEntitiesWithDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v5);

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(MEMORY[0x24BDBCE68]);
    objc_msgSend(v9, "setDay:", -(uint64_t)a4);
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dateByAddingComponents:toDate:options:", v9, v8, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(date >= %@) AND (date <= %@)"), v11, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

+ (id)predicateForEntityWithAgeOlderThan:(id)a3 dateAttribute:(id)a4 olderThan:(double)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void *)MEMORY[0x24BDBCE60];
  v9 = a4;
  objc_msgSend(v8, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v11, "setDay:", -(uint64_t)(a5 / 86400.0));
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dateByAddingComponents:toDate:options:", v11, v10, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K < %@"), v9, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  WALogCategoryDefaultHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v14, "description");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446978;
    v19 = "+[AnalyticsStoreProxy predicateForEntityWithAgeOlderThan:dateAttribute:olderThan:]";
    v20 = 1024;
    v21 = 217;
    v22 = 2112;
    v23 = v7;
    v24 = 2112;
    v25 = v16;
    _os_log_impl(&dword_212581000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Batch deleted predicate on %@: %@", buf, 0x26u);

  }
  return v14;
}

+ (BOOL)batchDelete:(id)a3 withPredicate:(id)a4 withFetchRequest:(id)a5 moc:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  BOOL v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  BOOL v25;
  NSObject *v26;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  _QWORD v32[4];
  NSObject *v33;
  uint64_t *v34;
  uint64_t *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  int v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v11)
    v13 = v11;
  else
    v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBB678]), "initWithEntityName:", v9);
  v14 = v13;
  v31 = v9;
  if (v10)
  {
    objc_msgSend(v13, "setPredicate:", v10);
    objc_msgSend(v10, "predicateFormat");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB5E8]), "initWithFetchRequest:", v14);
  objc_msgSend(v16, "setResultType:", 1);
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__1;
  v51 = __Block_byref_object_dispose__1;
  v52 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__1;
  v45 = __Block_byref_object_dispose__1;
  v17 = MEMORY[0x24BDAC760];
  v46 = 0;
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __70__AnalyticsStoreProxy_batchDelete_withPredicate_withFetchRequest_moc___block_invoke;
  v36[3] = &unk_24CDDDB60;
  v39 = &v47;
  v18 = v12;
  v37 = v18;
  v19 = v16;
  v38 = v19;
  v40 = &v41;
  objc_msgSend(v18, "performBlockAndWait:", v36);
  if (v42[5])
  {
    WALogCategoryDefaultHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)v42[5], "localizedDescription");
      v28 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v42[5], "userInfo");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136447490;
      v54 = "+[AnalyticsStoreProxy batchDelete:withPredicate:withFetchRequest:moc:]";
      v55 = 1024;
      v56 = 246;
      v57 = 2112;
      v58 = (uint64_t)v31;
      v59 = 2112;
      v60 = v15;
      v61 = 2112;
      v62 = (uint64_t)v28;
      v63 = 2112;
      v64 = v29;
      _os_log_impl(&dword_212581000, v26, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error executing batch delete for entity[%@] predicateFormat[%@]. %@ %@", buf, 0x3Au);

    }
  }
  else
  {
    objc_msgSend((id)v48[5], "result");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count") == 0;

    if (v21)
    {
      v25 = 1;
      goto LABEL_15;
    }
    if (objc_msgSend((id)v48[5], "resultType") == 1)
    {
      v32[0] = v17;
      v32[1] = 3221225472;
      v32[2] = __70__AnalyticsStoreProxy_batchDelete_withPredicate_withFetchRequest_moc___block_invoke_11;
      v32[3] = &unk_24CDDDBD8;
      v34 = &v47;
      v33 = v18;
      v35 = &v41;
      -[NSObject performBlockAndWait:](v33, "performBlockAndWait:", v32);
      WALogCategoryDefaultHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend((id)v48[5], "result");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "count");
        *(_DWORD *)buf = 136447234;
        v54 = "+[AnalyticsStoreProxy batchDelete:withPredicate:withFetchRequest:moc:]";
        v55 = 1024;
        v56 = 260;
        v57 = 2048;
        v58 = v24;
        v59 = 2112;
        v60 = v31;
        v61 = 2112;
        v62 = (uint64_t)v15;
        _os_log_impl(&dword_212581000, v22, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Batch deleted %lu MOs of entity[%@] predicateFormat[%@]", buf, 0x30u);

      }
      v25 = 1;
      v26 = v33;
      goto LABEL_13;
    }
    WALogCategoryDefaultHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v30 = objc_msgSend((id)v48[5], "resultType");
      *(_DWORD *)buf = 136447234;
      v54 = "+[AnalyticsStoreProxy batchDelete:withPredicate:withFetchRequest:moc:]";
      v55 = 1024;
      v56 = 249;
      v57 = 2112;
      v58 = (uint64_t)v31;
      v59 = 2112;
      v60 = v15;
      v61 = 2048;
      v62 = v30;
      _os_log_impl(&dword_212581000, v26, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error executing batch delete for entity[%@] predicateFormat[%@]. Unexpected ResultType %lu ", buf, 0x30u);
    }
  }
  v25 = 0;
LABEL_13:

LABEL_15:
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);
  return v25;
}

void __70__AnalyticsStoreProxy_batchDelete_withPredicate_withFetchRequest_moc___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "executeRequest:error:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __70__AnalyticsStoreProxy_batchDelete_withPredicate_withFetchRequest_moc___block_invoke_11(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "result");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __70__AnalyticsStoreProxy_batchDelete_withPredicate_withFetchRequest_moc___block_invoke_2;
  v5[3] = &unk_24CDDDBB0;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 48);
  v6 = v2;
  v7 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

void __70__AnalyticsStoreProxy_batchDelete_withPredicate_withFetchRequest_moc___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id obj;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v3, "existingObjectWithID:error:", a2, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  if (v5 && (objc_msgSend(v5, "isFault") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "refreshObject:mergeChanges:", v5, 1);

}

+ (BOOL)batchUpdate:(id)a3 withPredicate:(id)a4 propertiesToUpdate:(id)a5 moc:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  BOOL v13;
  BOOL v14;
  NSObject *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v9)
    v13 = v11 == 0;
  else
    v13 = 1;
  v14 = !v13;
  if (v13)
  {
    WALogCategoryDefaultHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v23 = "+[AnalyticsStoreProxy batchUpdate:withPredicate:propertiesToUpdate:moc:]";
      v24 = 1024;
      v25 = 307;
      v26 = 2112;
      v27 = v9;
      v28 = 2112;
      v29 = v11;
      _os_log_impl(&dword_212581000, v15, OS_LOG_TYPE_ERROR, "%{public}s::%d:entityName %@ or propertiesToUpdate %@ nil", buf, 0x26u);
    }

  }
  else
  {
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __72__AnalyticsStoreProxy_batchUpdate_withPredicate_propertiesToUpdate_moc___block_invoke;
    v17[3] = &unk_24CDDDC00;
    v18 = v9;
    v19 = v11;
    v20 = v10;
    v21 = v12;
    objc_msgSend(v21, "performBlockAndWait:", v17);

  }
  return v14;
}

void __72__AnalyticsStoreProxy_batchUpdate_withPredicate_propertiesToUpdate_moc___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  _QWORD v17[4];
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBB5F8], "batchUpdateRequestWithEntityName:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPropertiesToUpdate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "setPredicate:", *(_QWORD *)(a1 + 48));
  v3 = *(void **)(a1 + 48);
  if (v3)
  {
    objc_msgSend(v3, "predicateFormat");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(*(id *)(a1 + 56), "persistentStoreCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistentStores");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAffectedStores:", v6);

  objc_msgSend(v2, "setResultType:", 1);
  v7 = *(void **)(a1 + 56);
  v22 = 0;
  objc_msgSend(v7, "executeRequest:error:", v2, &v22);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v22;
  objc_msgSend(v8, "result");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) == 0)
  {
    WALogCategoryDefaultHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    *(_DWORD *)buf = 136446466;
    v24 = "+[AnalyticsStoreProxy batchUpdate:withPredicate:propertiesToUpdate:moc:]_block_invoke";
    v25 = 1024;
    v26 = 302;
    v16 = "%{public}s::%d:batchUpdate results empty";
LABEL_11:
    _os_log_impl(&dword_212581000, v15, OS_LOG_TYPE_ERROR, v16, buf, 0x12u);
    goto LABEL_12;
  }
  objc_msgSend(v8, "result");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (!v13)
  {
    WALogCategoryDefaultHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    *(_DWORD *)buf = 136446466;
    v24 = "+[AnalyticsStoreProxy batchUpdate:withPredicate:propertiesToUpdate:moc:]_block_invoke";
    v25 = 1024;
    v26 = 299;
    v16 = "%{public}s::%d:batchUpdate count is 0";
    goto LABEL_11;
  }
  v14 = *(void **)(a1 + 56);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __72__AnalyticsStoreProxy_batchUpdate_withPredicate_propertiesToUpdate_moc___block_invoke_2;
  v17[3] = &unk_24CDDDC00;
  v18 = v8;
  v19 = *(id *)(a1 + 56);
  v20 = *(id *)(a1 + 32);
  v21 = v4;
  objc_msgSend(v14, "performBlockAndWait:", v17);

  v15 = v18;
LABEL_12:

}

void __72__AnalyticsStoreProxy_batchUpdate_withPredicate_propertiesToUpdate_moc___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v33, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v20;
    *(_QWORD *)&v4 = 136447234;
    v17 = v4;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v7);
        v9 = *(void **)(a1 + 40);
        v18 = 0;
        objc_msgSend(v9, "existingObjectWithID:error:", v8, &v18, v17);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v18;
        objc_msgSend(*(id *)(a1 + 40), "refreshObject:mergeChanges:", v10, 1);
        WALogCategoryDefaultHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(*(id *)(a1 + 32), "result");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "count");
          v15 = *(_QWORD *)(a1 + 48);
          v16 = *(_QWORD *)(a1 + 56);
          *(_DWORD *)buf = v17;
          v24 = "+[AnalyticsStoreProxy batchUpdate:withPredicate:propertiesToUpdate:moc:]_block_invoke_2";
          v25 = 1024;
          v26 = 295;
          v27 = 2048;
          v28 = v14;
          v29 = 2112;
          v30 = v15;
          v31 = 2112;
          v32 = v16;
          _os_log_impl(&dword_212581000, v12, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Batch updated %lu MOs of entity[%@] predicateFormat[%@]", buf, 0x30u);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v33, 16);
    }
    while (v5);
  }

}

+ (id)fetchPropertiesForEntity:(id)a3 properties:(id)a4 predicate:(id)a5 moc:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  int v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  +[AnalyticsStoreProxy fetchRequestForEntity:](AnalyticsStoreProxy, "fetchRequestForEntity:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    WALogCategoryDefaultHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v21 = 136446722;
      v22 = "+[AnalyticsStoreProxy fetchPropertiesForEntity:properties:predicate:moc:]";
      v23 = 1024;
      v24 = 319;
      v25 = 2112;
      v26 = v9;
      v18 = "%{public}s::%d:fetch request nil for entity:%@";
      v19 = v17;
      v20 = 28;
LABEL_9:
      _os_log_impl(&dword_212581000, v19, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v21, v20);
    }
LABEL_10:

    v15 = 0;
    goto LABEL_4;
  }
  if (!v12)
  {
    WALogCategoryDefaultHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v21 = 136446466;
      v22 = "+[AnalyticsStoreProxy fetchPropertiesForEntity:properties:predicate:moc:]";
      v23 = 1024;
      v24 = 320;
      v18 = "%{public}s::%d:moc nil";
      v19 = v17;
      v20 = 18;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  objc_msgSend(v13, "setResultType:", 2);
  objc_msgSend(v14, "setReturnsDistinctResults:", 1);
  objc_msgSend(v14, "setPropertiesToFetch:", v10);
  +[AnalyticsStoreProxy fetch:withPredicate:moc:](AnalyticsStoreProxy, "fetch:withPredicate:moc:", v14, v11, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_4:

  return v15;
}

+ (id)fetchPropertiesForEntityWithLimitAndSortDescriptor:(id)a3 properties:(id)a4 predicate:(id)a5 fetchLimit:(unint64_t)a6 sortDescriptor:(id)a7 returnDistinct:(BOOL)a8 moc:(id)a9
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v9 = a8;
  v35 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a9;
  +[AnalyticsStoreProxy fetchRequestForEntity:](AnalyticsStoreProxy, "fetchRequestForEntity:", v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (!v19)
  {
    WALogCategoryDefaultHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v30 = "+[AnalyticsStoreProxy fetchPropertiesForEntityWithLimitAndSortDescriptor:properties:predicate:fetchLimit:sor"
            "tDescriptor:returnDistinct:moc:]";
      v31 = 1024;
      v32 = 340;
      v33 = 2112;
      v34 = v14;
      v25 = "%{public}s::%d:fetch request nil for entity:%@";
      v26 = v24;
      v27 = 28;
LABEL_13:
      _os_log_impl(&dword_212581000, v26, OS_LOG_TYPE_ERROR, v25, buf, v27);
    }
LABEL_14:

    v22 = 0;
    goto LABEL_8;
  }
  if (!v18)
  {
    WALogCategoryDefaultHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v30 = "+[AnalyticsStoreProxy fetchPropertiesForEntityWithLimitAndSortDescriptor:properties:predicate:fetchLimit:sor"
            "tDescriptor:returnDistinct:moc:]";
      v31 = 1024;
      v32 = 341;
      v25 = "%{public}s::%d:moc nil";
      v26 = v24;
      v27 = 18;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  objc_msgSend(v19, "setResultType:", 2);
  objc_msgSend(v20, "setReturnsDistinctResults:", v9);
  objc_msgSend(v20, "setPropertiesToFetch:", v15);
  if (v17)
  {
    v28 = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v28, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setSortDescriptors:", v21);

  }
  if (a6)
    objc_msgSend(v20, "setFetchLimit:", a6);
  +[AnalyticsStoreProxy fetch:withPredicate:moc:](AnalyticsStoreProxy, "fetch:withPredicate:moc:", v20, v16, v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v22;
}

+ (id)analyticsStoreEntityNames
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v14 = (void *)MEMORY[0x24BDBCE30];
  +[BSSMO entityName](BSSMO, "entityName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[NetworkMO entityName](NetworkMO, "entityName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[JoinMO entityName](JoinMO, "entityName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[LeaveMO entityName](LeaveMO, "entityName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[RoamMO entityName](RoamMO, "entityName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[GeoTagMO entityName](GeoTagMO, "entityName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[ScanMO entityName](ScanMO, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SessionMO entityName](SessionMO, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[FaultMO entityName](FaultMO, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MetricEntryMO entityName](MetricEntryMO, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[WiFiStatMO entityName](WiFiStatMO, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[DiagnosticStateMO entityName](DiagnosticStateMO, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[LinkTestMO entityName](LinkTestMO, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[RecoveryMO entityName](RecoveryMO, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "arrayWithObjects:", v18, v17, v16, v13, v12, v2, v3, v4, v5, v6, v7, v8, v9, v10, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)analyticsStoreEntityRelationshipNames
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("bss"), CFSTR("network"), CFSTR("roamsTo"), CFSTR("roamsFrom"), CFSTR("source"), CFSTR("target"), CFSTR("geoTag"), CFSTR("joins"), CFSTR("leaves"), CFSTR("blacklist"), CFSTR("join"), CFSTR("leave"), CFSTR("roamsSet"), CFSTR("origin"), CFSTR("result"), CFSTR("metricEntry"), CFSTR("faults"),
               CFSTR("linkTest"),
               CFSTR("linkTest"),
               CFSTR("recoveries"),
               0);
}

+ (id)analyticsStoreEntitiesWithDate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  id v14;
  void *v15;

  v13 = (id)MEMORY[0x24BDBCF20];
  +[JoinMO entityName](JoinMO, "entityName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[LeaveMO entityName](LeaveMO, "entityName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[RoamMO entityName](RoamMO, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[GeoTagMO entityName](GeoTagMO, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ScanMO entityName](ScanMO, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SessionMO entityName](SessionMO, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[FaultMO entityName](FaultMO, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MetricEntryMO entityName](MetricEntryMO, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[DiagnosticStateMO entityName](DiagnosticStateMO, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[LinkTestMO entityName](LinkTestMO, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[RecoveryMO entityName](RecoveryMO, "entityName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithObjects:", v15, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, 0);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
