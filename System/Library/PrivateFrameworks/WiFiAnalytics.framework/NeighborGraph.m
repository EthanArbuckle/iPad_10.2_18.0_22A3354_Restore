@implementation NeighborGraph

- (NeighborGraph)initWithBssidArray:(id)a3 ssid:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NeighborGraph *v11;
  uint64_t v12;
  NSMutableArray *graph;
  unint64_t v14;
  NSMutableArray *v15;
  void *v16;
  uint64_t v17;
  NSString *ssid;
  uint64_t v19;
  NSArray *bssids;
  uint64_t v21;
  NSMutableArray *bssidsDwellTimes;
  unint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  NeighborGraph *v27;
  NSObject *v28;
  const char *v29;
  objc_super v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)NeighborGraph;
  v11 = -[NeighborGraph init](&v31, sel_init);
  if (!v11)
    goto LABEL_31;
  if (!v8)
  {
    WALogCategoryDefaultHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      goto LABEL_30;
    *(_DWORD *)buf = 136446466;
    v33 = "-[NeighborGraph initWithBssidArray:ssid:handler:]";
    v34 = 1024;
    v35 = 35;
    v29 = "%{public}s::%d:bssidArray nil";
LABEL_29:
    _os_log_impl(&dword_212581000, v28, OS_LOG_TYPE_ERROR, v29, buf, 0x12u);
    goto LABEL_30;
  }
  if (!objc_msgSend(v8, "count"))
  {
    WALogCategoryDefaultHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      goto LABEL_30;
    *(_DWORD *)buf = 136446466;
    v33 = "-[NeighborGraph initWithBssidArray:ssid:handler:]";
    v34 = 1024;
    v35 = 36;
    v29 = "%{public}s::%d:bssidArray has 0 objects";
    goto LABEL_29;
  }
  if (!v10)
  {
    WALogCategoryDefaultHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      goto LABEL_30;
    *(_DWORD *)buf = 136446466;
    v33 = "-[NeighborGraph initWithBssidArray:ssid:handler:]";
    v34 = 1024;
    v35 = 37;
    v29 = "%{public}s::%d:analyticsStoreMOHandler nil";
    goto LABEL_29;
  }
  objc_storeStrong((id *)&v11->_managedObjectHandler, a5);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v12 = objc_claimAutoreleasedReturnValue();
  graph = v11->_graph;
  v11->_graph = (NSMutableArray *)v12;

  if (!v11->_graph)
  {
    WALogCategoryDefaultHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      goto LABEL_30;
    *(_DWORD *)buf = 136446466;
    v33 = "-[NeighborGraph initWithBssidArray:ssid:handler:]";
    v34 = 1024;
    v35 = 42;
    v29 = "%{public}s::%d:bss nil";
    goto LABEL_29;
  }
  if (objc_msgSend(v8, "count"))
  {
    v14 = 0;
    do
    {
      v15 = v11->_graph;
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v15, "addObject:", v16);

      ++v14;
    }
    while (v14 < objc_msgSend(v8, "count"));
  }
  v17 = objc_msgSend(v9, "copy");
  ssid = v11->_ssid;
  v11->_ssid = (NSString *)v17;

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v8);
  v19 = objc_claimAutoreleasedReturnValue();
  bssids = v11->_bssids;
  v11->_bssids = (NSArray *)v19;

  if (!v11->_bssids)
  {
    WALogCategoryDefaultHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      goto LABEL_30;
    *(_DWORD *)buf = 136446466;
    v33 = "-[NeighborGraph initWithBssidArray:ssid:handler:]";
    v34 = 1024;
    v35 = 51;
    v29 = "%{public}s::%d:path nil";
    goto LABEL_29;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v21 = objc_claimAutoreleasedReturnValue();
  bssidsDwellTimes = v11->_bssidsDwellTimes;
  v11->_bssidsDwellTimes = (NSMutableArray *)v21;

  if (!v11->_bssidsDwellTimes)
  {
    WALogCategoryDefaultHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v33 = "-[NeighborGraph initWithBssidArray:ssid:handler:]";
      v34 = 1024;
      v35 = 54;
      v29 = "%{public}s::%d:_bssidsDwellTimes nil";
      goto LABEL_29;
    }
LABEL_30:

LABEL_31:
    v27 = 0;
    goto LABEL_32;
  }
  if (objc_msgSend(v8, "count"))
  {
    v23 = 0;
    do
    {
      -[NSMutableArray addObject:](v11->_bssidsDwellTimes, "addObject:", &unk_24CE01C20);
      ++v23;
    }
    while (v23 < objc_msgSend(v8, "count"));
  }
  WALogCategoryDefaultHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    v25 = -[NSArray count](v11->_bssids, "count");
    v26 = -[NSMutableArray count](v11->_graph, "count");
    *(_DWORD *)buf = 136446978;
    v33 = "-[NeighborGraph initWithBssidArray:ssid:handler:]";
    v34 = 1024;
    v35 = 60;
    v36 = 2048;
    v37 = v25;
    v38 = 2048;
    v39 = v26;
    _os_log_impl(&dword_212581000, v24, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Initialized with bssids count:%lu graph count: %lu", buf, 0x26u);
  }

  v27 = v11;
LABEL_32:

  return v27;
}

- (void)setNeighborsForBssid:(id)a3 neighbors:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  NSObject *v30;
  const char *v31;
  NSObject *v32;
  uint32_t v33;
  uint64_t v34;
  id v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    WALogCategoryDefaultHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    *(_DWORD *)buf = 136446466;
    v43 = "-[NeighborGraph setNeighborsForBssid:neighbors:]";
    v44 = 1024;
    v45 = 70;
    v31 = "%{public}s::%d:bssid nil";
    goto LABEL_28;
  }
  if (!v7)
  {
    WALogCategoryDefaultHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    *(_DWORD *)buf = 136446466;
    v43 = "-[NeighborGraph setNeighborsForBssid:neighbors:]";
    v44 = 1024;
    v45 = 71;
    v31 = "%{public}s::%d:neighborBssids nil";
    goto LABEL_28;
  }
  if (!objc_msgSend(v7, "count"))
  {
    WALogCategoryDefaultHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    *(_DWORD *)buf = 136446466;
    v43 = "-[NeighborGraph setNeighborsForBssid:neighbors:]";
    v44 = 1024;
    v45 = 72;
    v31 = "%{public}s::%d:neighborBssids empty";
LABEL_28:
    v32 = v13;
    v33 = 18;
    goto LABEL_31;
  }
  -[NeighborGraph bssids](self, "bssids");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "indexOfObject:", v6);

  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    WALogCategoryDefaultHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    *(_DWORD *)buf = 136446722;
    v43 = "-[NeighborGraph setNeighborsForBssid:neighbors:]";
    v44 = 1024;
    v45 = 75;
    v46 = 2112;
    v47 = v6;
    v31 = "%{public}s::%d:bssid %@ not found";
    v32 = v13;
    v33 = 28;
LABEL_31:
    _os_log_impl(&dword_212581000, v32, OS_LOG_TYPE_ERROR, v31, buf, v33);
    goto LABEL_21;
  }
  v34 = v10;
  v35 = v6;
  v11 = (void *)MEMORY[0x24BDBCEB8];
  -[NeighborGraph bssids](self, "bssids");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arrayWithCapacity:", objc_msgSend(v12, "count"));
  v13 = objc_claimAutoreleasedReturnValue();

  -[NeighborGraph bssids](self, "bssids");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    v16 = 0;
    do
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](v13, "addObject:", v17);

      ++v16;
      -[NeighborGraph bssids](self, "bssids");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");

    }
    while (v16 < v19);
  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v8;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v38;
    while (2)
    {
      for (i = 0; i != v21; ++i)
      {
        v24 = v13;
        if (*(_QWORD *)v38 != v22)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        -[NeighborGraph bssids](self, "bssids");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "indexOfObject:", v25);

        if (v27 == 0x7FFFFFFFFFFFFFFFLL)
        {
          WALogCategoryDefaultHandle();
          v30 = objc_claimAutoreleasedReturnValue();
          v13 = v24;
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446722;
            v43 = "-[NeighborGraph setNeighborsForBssid:neighbors:]";
            v44 = 1024;
            v45 = 84;
            v46 = 2112;
            v47 = v25;
            _os_log_impl(&dword_212581000, v30, OS_LOG_TYPE_ERROR, "%{public}s::%d:neighbor %@ not found", buf, 0x1Cu);
          }

          goto LABEL_20;
        }
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v24;
        -[NSObject insertObject:atIndex:](v24, "insertObject:atIndex:", v28, v27);

      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v21)
        continue;
      break;
    }
  }

  -[NeighborGraph graph](self, "graph");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "insertObject:atIndex:", v13, v34);

LABEL_20:
  v6 = v35;
LABEL_21:

}

- (BOOL)doesPathExist:(id)a3 target:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char isKindOfClass;
  NSObject *v18;
  const char *v19;
  int v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    WALogCategoryDefaultHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    v21 = 136446466;
    v22 = "-[NeighborGraph doesPathExist:target:]";
    v23 = 1024;
    v24 = 99;
    v19 = "%{public}s::%d:sourceBssid nil";
LABEL_18:
    _os_log_impl(&dword_212581000, v18, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v21, 0x12u);
    goto LABEL_19;
  }
  if (!v7)
  {
    WALogCategoryDefaultHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    v21 = 136446466;
    v22 = "-[NeighborGraph doesPathExist:target:]";
    v23 = 1024;
    v24 = 100;
    v19 = "%{public}s::%d:targetBssid nil";
    goto LABEL_18;
  }
  -[NeighborGraph bssids](self, "bssids");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "indexOfObject:", v6);

  -[NeighborGraph bssids](self, "bssids");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "indexOfObject:", v8);

  if (v12 == v10)
  {
    WALogCategoryDefaultHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v21 = 136446466;
      v22 = "-[NeighborGraph doesPathExist:target:]";
      v23 = 1024;
      v24 = 105;
      v19 = "%{public}s::%d:source and target are same.. bailing";
      goto LABEL_18;
    }
LABEL_19:

    v14 = 0;
LABEL_20:
    isKindOfClass = 0;
    goto LABEL_21;
  }
  -[NeighborGraph graph](self, "graph");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndex:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14 || !objc_msgSend(v14, "count"))
    goto LABEL_20;
  objc_msgSend(v14, "objectAtIndex:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 == v16)
  {
    isKindOfClass = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      isKindOfClass = 1;
    }
    else
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
    }
  }

LABEL_21:
  return isKindOfClass & 1;
}

- (unint64_t)graphDensity
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  unint64_t v18;
  NSObject *v19;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  unint64_t v38;
  __int16 v39;
  unint64_t v40;
  __int16 v41;
  unint64_t v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  -[NeighborGraph bssids](self, "bssids");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v3, "count");

  -[NeighborGraph bssids](self, "bssids");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v44, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v22 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v22)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        v12 = (void *)objc_msgSend(v6, "mutableCopy", v21);
        objc_msgSend(v12, "removeObject:", v11);
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v13 = v12;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v43, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v24;
          do
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v24 != v16)
                objc_enumerationMutation(v13);
              v9 += -[NeighborGraph doesPathExist:target:](self, "doesPathExist:target:", v11, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j));
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v43, 16);
          }
          while (v15);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v44, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  v18 = (unint64_t)((v21 - 1) * v21) >> 1;
  WALogCategoryDefaultHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136447490;
    v32 = "-[NeighborGraph graphDensity]";
    v33 = 1024;
    v34 = 144;
    v35 = 2048;
    v36 = v21;
    v37 = 2048;
    v38 = (unint64_t)((v21 - 1) * v21) >> 1;
    v39 = 2048;
    v40 = v9;
    v41 = 2048;
    v42 = (unint64_t)((double)v9 / (double)v18 * 100.0);
    _os_log_impl(&dword_212581000, v19, OS_LOG_TYPE_DEBUG, "%{public}s::%d:BssCount:%lu MaxPaths:%lu actualPaths:%lu Density:%lu", buf, 0x3Au);
  }

  return (unint64_t)((double)v9 / (double)v18 * 100.0);
}

- (void)setNeighborsForBssid:(id)a3 dwellTime:(unint64_t)a4 neighborInfoArray:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  NSObject *v54;
  uint32_t v55;
  void *v56;
  id v57;
  uint64_t v58;
  id obj;
  NSObject *log;
  uint64_t v61;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t v67[128];
  uint8_t buf[4];
  const char *v69;
  __int16 v70;
  int v71;
  __int16 v72;
  id v73;
  __int16 v74;
  uint64_t v75;
  __int16 v76;
  unint64_t v77;
  __int16 v78;
  uint64_t v79;
  __int16 v80;
  uint64_t v81;
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  v9 = v8;
  if (!v7)
  {
    WALogCategoryDefaultHandle();
    log = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    *(_DWORD *)buf = 136446466;
    v69 = "-[NeighborGraph setNeighborsForBssid:dwellTime:neighborInfoArray:]";
    v70 = 1024;
    v71 = 151;
    v53 = "%{public}s::%d:bssid nil";
    goto LABEL_33;
  }
  if (!v8)
  {
    WALogCategoryDefaultHandle();
    log = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    *(_DWORD *)buf = 136446466;
    v69 = "-[NeighborGraph setNeighborsForBssid:dwellTime:neighborInfoArray:]";
    v70 = 1024;
    v71 = 152;
    v53 = "%{public}s::%d:neighborInfoArray nil";
    goto LABEL_33;
  }
  if (!objc_msgSend(v8, "count"))
  {
    WALogCategoryDefaultHandle();
    log = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    *(_DWORD *)buf = 136446466;
    v69 = "-[NeighborGraph setNeighborsForBssid:dwellTime:neighborInfoArray:]";
    v70 = 1024;
    v71 = 153;
    v53 = "%{public}s::%d:neighborInfoArray empty";
LABEL_33:
    v54 = log;
    v55 = 18;
    goto LABEL_36;
  }
  -[NeighborGraph bssids](self, "bssids");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "indexOfObject:", v7);

  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    WALogCategoryDefaultHandle();
    log = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    *(_DWORD *)buf = 136446722;
    v69 = "-[NeighborGraph setNeighborsForBssid:dwellTime:neighborInfoArray:]";
    v70 = 1024;
    v71 = 156;
    v72 = 2112;
    v73 = v7;
    v53 = "%{public}s::%d:bssid %@ not found";
    v54 = log;
    v55 = 28;
LABEL_36:
    _os_log_impl(&dword_212581000, v54, OS_LOG_TYPE_ERROR, v53, buf, v55);
    goto LABEL_26;
  }
  -[NeighborGraph bssidsDwellTimes](self, "bssidsDwellTimes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v11;
  objc_msgSend(v12, "insertObject:atIndex:", v13, v11);

  WALogCategoryDefaultHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = objc_msgSend(v9, "count");
    -[NeighborGraph bssids](self, "bssids");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136447746;
    v69 = "-[NeighborGraph setNeighborsForBssid:dwellTime:neighborInfoArray:]";
    v70 = 1024;
    v71 = 160;
    v72 = 2048;
    v73 = (id)(v11 + 1);
    v74 = 2112;
    v75 = (uint64_t)v7;
    v76 = 2048;
    v77 = a4;
    v78 = 2048;
    v79 = v15;
    v80 = 2048;
    v81 = objc_msgSend(v16, "count");
    _os_log_impl(&dword_212581000, v14, OS_LOG_TYPE_DEBUG, "%{public}s::%d:(%lu) BSSID: %@ dwell:%lu has %lu neighbors. BssidsCount:%lu", buf, 0x44u);

  }
  v57 = v7;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  log = objc_claimAutoreleasedReturnValue();
  -[NeighborGraph bssids](self, "bssids");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18)
  {
    v19 = 0;
    do
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](log, "addObject:", v20);

      ++v19;
      -[NeighborGraph bssids](self, "bssids");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "count");

    }
    while (v19 < v22);
  }
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v56 = v9;
  obj = v9;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
  if (v23)
  {
    v24 = v23;
    v25 = 0;
    v61 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v64 != v61)
          objc_enumerationMutation(obj);
        v27 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
        objc_msgSend(v27, "valueForKey:", CFSTR("NeighborBssid"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[NeighborGraph bssids](self, "bssids");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "indexOfObject:", v28);

        WALogCategoryDefaultHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136447234;
          v69 = "-[NeighborGraph setNeighborsForBssid:dwellTime:neighborInfoArray:]";
          v70 = 1024;
          v71 = 173;
          v72 = 2112;
          v73 = v28;
          v74 = 2048;
          v75 = v30;
          v76 = 2048;
          v77 = v25 + 1;
          _os_log_impl(&dword_212581000, v31, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Neighbor: %@ has index %lu at iteration:%lu", buf, 0x30u);
        }

        if (v30 == 0x7FFFFFFFFFFFFFFFLL)
        {
          WALogCategoryDefaultHandle();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446978;
            v69 = "-[NeighborGraph setNeighborsForBssid:dwellTime:neighborInfoArray:]";
            v70 = 1024;
            v71 = 176;
            v72 = 2112;
            v73 = v28;
            v74 = 2048;
            v75 = v25 + 1;
            _os_log_impl(&dword_212581000, v32, OS_LOG_TYPE_ERROR, "%{public}s::%d:Couldnt find Neighbor: %@ in iteration:%lu", buf, 0x26u);
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v32 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("NeighborBssNumRoamCacheRssiHigh"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v33, CFSTR("NeighborBssNumRoamCacheRssiHigh"));

          objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("NeighborBssNumRoamCacheRssiMid"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v34, CFSTR("NeighborBssNumRoamCacheRssiMid"));

          objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("NeighborBssNumRoamCacheRssiUpperMid"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v35, CFSTR("NeighborBssNumRoamCacheRssiUpperMid"));

          objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("NeighborBssNumRoamCacheRssiLow"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v36, CFSTR("NeighborBssNumRoamCacheRssiLow"));

          objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("NeighborBssNumRoamCacheRssiReallyLow"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v37, CFSTR("NeighborBssNumRoamCacheRssiReallyLow"));

          objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("NeighborBssNumRoamOriginRssiHigh"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v38, CFSTR("NeighborBssNumRoamOriginRssiHigh"));

          objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("NeighborBssNumRoamOriginRssiUpperHigh"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v39, CFSTR("NeighborBssNumRoamOriginRssiUpperHigh"));

          objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("NeighborBssNumRoamOriginRssiOptimum"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v40, CFSTR("NeighborBssNumRoamOriginRssiOptimum"));

          objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("NeighborBssNumRoamOriginRssiUpperOptimum"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v41, CFSTR("NeighborBssNumRoamOriginRssiUpperOptimum"));

          objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("NeighborBssNumRoamOriginRssiMid"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v42, CFSTR("NeighborBssNumRoamOriginRssiMid"));

          objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("NeighborBssNumRoamOriginRssiUpperMid"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v43, CFSTR("NeighborBssNumRoamOriginRssiUpperMid"));

          objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("NeighborBssNumRoamOriginRssiLow"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v44, CFSTR("NeighborBssNumRoamOriginRssiLow"));

          objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("NeighborBssNumLazyRoamOriginRssiHigh"));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v45, CFSTR("NeighborBssNumLazyRoamOriginRssiHigh"));

          objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("NeighborBssNumLazyRoamOriginRssiUpperHigh"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v46, CFSTR("NeighborBssNumLazyRoamOriginRssiUpperHigh"));

          objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("NeighborBssNumLazyRoamOriginRssiOptimum"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v47, CFSTR("NeighborBssNumLazyRoamOriginRssiOptimum"));

          objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("NeighborBssNumLazyRoamOriginRssiUpperOptimum"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v48, CFSTR("NeighborBssNumLazyRoamOriginRssiUpperOptimum"));

          objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("NeighborBssNumLazyRoamOriginRssiMid"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v49, CFSTR("NeighborBssNumLazyRoamOriginRssiMid"));

          -[NSObject replaceObjectAtIndex:withObject:](log, "replaceObjectAtIndex:withObject:", v30, v32);
          ++v25;
        }

      }
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
    }
    while (v24);
  }

  WALogCategoryDefaultHandle();
  v50 = objc_claimAutoreleasedReturnValue();
  v7 = v57;
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
  {
    v51 = -[NSObject count](log, "count");
    *(_DWORD *)buf = 136447234;
    v69 = "-[NeighborGraph setNeighborsForBssid:dwellTime:neighborInfoArray:]";
    v70 = 1024;
    v71 = 205;
    v72 = 2112;
    v73 = v57;
    v74 = 2048;
    v75 = v58;
    v76 = 2048;
    v77 = v51;
    _os_log_impl(&dword_212581000, v50, OS_LOG_TYPE_DEBUG, "%{public}s::%d:BSSID %@ at %lu has Neighbor count: %lu", buf, 0x30u);
  }

  -[NeighborGraph graph](self, "graph");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "insertObject:atIndex:", log, v58);

  v9 = v56;
LABEL_26:

}

- (id)copyNeighborGraphAsDictionary
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[8];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2;
  v25 = __Block_byref_object_dispose__2;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  -[NeighborGraph bssidsDwellTimes](self, "bssidsDwellTimes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:", CFSTR("@sum.self"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "unsignedIntegerValue");
  WALogCategoryDefaultHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    -[NeighborGraph bssids](self, "bssids");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    -[NeighborGraph bssids](self, "bssids");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136447234;
    v28 = "-[NeighborGraph copyNeighborGraphAsDictionary]";
    v29 = 1024;
    v30 = 221;
    v31 = 2048;
    v32 = v8;
    v33 = 2048;
    v34 = v5;
    v35 = 2112;
    v36 = v9;
    _os_log_impl(&dword_212581000, v6, OS_LOG_TYPE_DEBUG, "%{public}s::%d:bssidCount:%lu totalDwell:%lu BSSIDs:%@", buf, 0x30u);

  }
  -[NeighborGraph bssids](self, "bssids");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __46__NeighborGraph_copyNeighborGraphAsDictionary__block_invoke;
  v14[3] = &unk_24CDDDCF0;
  v14[4] = self;
  v14[5] = &v21;
  v14[6] = &v15;
  v14[7] = v5;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v14);

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v22[5], CFSTR("nodes"));
  objc_msgSend(v11, "setObject:forKey:", v16[5], CFSTR("links"));
  v12 = (void *)objc_msgSend(v11, "copy");

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v12;
}

void __46__NeighborGraph_copyNeighborGraphAsDictionary__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  unint64_t v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3 + 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v7, CFSTR("id"));

  objc_msgSend(v6, "setValue:forKey:", v5, CFSTR("bssid"));
  objc_msgSend(*(id *)(a1 + 32), "bssidsDwellTimes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (unint64_t)(100 * objc_msgSend(v9, "unsignedIntegerValue")) / *(_QWORD *)(a1 + 56);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v11, CFSTR("dwellTime"));

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v6);
  objc_msgSend(*(id *)(a1 + 32), "ssid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "managedObjectHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "managedObjectContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[BSSMO getInstance:ssid:moc:](BSSMO, "getInstance:ssid:moc:", v5, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v16, CFSTR("dwellTime"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", objc_msgSend(v15, "channel"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v17, CFSTR("channel"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v15, "isEdgeForJoin"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v18, CFSTR("isEdgeForJoin"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v15, "isEdgeForLeave"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v19, CFSTR("isEdgeForLeave"));

  objc_msgSend(*(id *)(a1 + 32), "graph");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndex:", a3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  WALogCategoryDefaultHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "bssidsDwellTimes");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectAtIndex:", a3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136447746;
    v33 = "-[NeighborGraph copyNeighborGraphAsDictionary]_block_invoke";
    v34 = 1024;
    v35 = 241;
    v36 = 2112;
    v37 = v5;
    v38 = 2112;
    v39 = v24;
    v40 = 2048;
    v41 = v10;
    v42 = 2048;
    v43 = a3;
    v44 = 2048;
    v45 = objc_msgSend(v21, "count");
    _os_log_impl(&dword_212581000, v22, OS_LOG_TYPE_DEBUG, "%{public}s::%d:BSSID %@ dwell:%@ dwellPct:%lu at %lu has Neighbor count: %lu", buf, 0x44u);

  }
  if (v21 && objc_msgSend(v21, "count"))
  {
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __46__NeighborGraph_copyNeighborGraphAsDictionary__block_invoke_56;
    v27[3] = &unk_24CDDDCC8;
    v31 = a3;
    v25 = v5;
    v26 = *(_QWORD *)(a1 + 32);
    v28 = v25;
    v29 = v26;
    v30 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v21, "enumerateObjectsUsingBlock:", v27);

  }
}

void __46__NeighborGraph_copyNeighborGraphAsDictionary__block_invoke_56(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  NSObject *v14;
  _BOOL4 v15;
  const char *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
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
  unint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  unint64_t v38;
  void *v39;
  unint64_t v40;
  void *v41;
  unint64_t v42;
  void *v43;
  unint64_t v44;
  void *v45;
  unint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  unint64_t v65;
  unint64_t v66;
  void *v67;
  void *v68;
  NSObject *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  id v73;
  uint8_t buf[4];
  const char *v75;
  __int16 v76;
  int v77;
  __int16 v78;
  uint64_t v79;
  __int16 v80;
  uint64_t v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  void *v85;
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      WALogCategoryDefaultHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      v70 = a3;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v8 = *(_QWORD *)(a1 + 56) + 1;
        v9 = (void *)(a3 + 1);
        v10 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "bssids");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndex:", a3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136447490;
        v75 = "-[NeighborGraph copyNeighborGraphAsDictionary]_block_invoke";
        v76 = 1024;
        v77 = 248;
        v78 = 2048;
        v79 = v8;
        v80 = 2112;
        v81 = v10;
        v82 = 2048;
        v83 = v9;
        v84 = 2112;
        v85 = v12;
        _os_log_impl(&dword_212581000, v7, OS_LOG_TYPE_DEBUG, "%{public}s::%d:(%lu) BSSID: %@ -> (%lu) BSSID: %@", buf, 0x3Au);

      }
      else
      {
        v9 = (void *)(a3 + 1);
      }

      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v17 = objc_claimAutoreleasedReturnValue();
      v72 = a1;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56) + 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKey:](v17, "setObject:forKey:", v18, CFSTR("source"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v9);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v17;
      -[NSObject setObject:forKey:](v17, "setObject:forKey:", v19, CFSTR("target"));

      v73 = v5;
      v20 = v5;
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("NeighborBssNumRoamOriginRssiHigh"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "unsignedIntegerValue");
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("NeighborBssNumRoamOriginRssiUpperHigh"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "unsignedIntegerValue") + v22;
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("NeighborBssNumRoamOriginRssiOptimum"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "unsignedIntegerValue");
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("NeighborBssNumRoamOriginRssiUpperOptimum"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v24 + v26 + objc_msgSend(v27, "unsignedIntegerValue");
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("NeighborBssNumRoamOriginRssiMid"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "unsignedIntegerValue");
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("NeighborBssNumRoamOriginRssiUpperMid"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v30 + objc_msgSend(v31, "unsignedIntegerValue");
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("NeighborBssNumRoamOriginRssiLow"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v28 + v32 + objc_msgSend(v33, "unsignedIntegerValue");

      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("NeighborBssNumRoamOriginRssiHigh"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = 100 * objc_msgSend(v35, "unsignedIntegerValue") / v34;

      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("NeighborBssNumRoamOriginRssiUpperHigh"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = 100 * objc_msgSend(v36, "unsignedIntegerValue") / v34;

      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("NeighborBssNumRoamOriginRssiOptimum"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 100 * objc_msgSend(v37, "unsignedIntegerValue") / v34;

      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("NeighborBssNumRoamOriginRssiUpperOptimum"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 100 * objc_msgSend(v39, "unsignedIntegerValue") / v34;

      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("NeighborBssNumRoamOriginRssiMid"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 100 * objc_msgSend(v41, "unsignedIntegerValue") / v34;

      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("NeighborBssNumRoamOriginRssiUpperMid"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 100 * objc_msgSend(v43, "unsignedIntegerValue") / v34;

      v68 = v20;
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("NeighborBssNumRoamOriginRssiLow"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 100 * objc_msgSend(v45, "unsignedIntegerValue") / v34;

      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v66);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "addObject:", v48);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v65);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "addObject:", v49);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v38);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "addObject:", v50);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v40);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "addObject:", v51);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v42);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "addObject:", v52);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v44);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "addObject:", v53);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v46);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "addObject:", v54);

      objc_msgSend(v47, "valueForKeyPath:", CFSTR("@max.integerValue"));
      v55 = objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v47, "indexOfObject:", v55);
      WALogCategoryDefaultHandle();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136447234;
        v75 = "-[NeighborGraph copyNeighborGraphAsDictionary]_block_invoke";
        v76 = 1024;
        v77 = 286;
        v78 = 2112;
        v79 = v55;
        v80 = 2048;
        v81 = v56;
        v82 = 2112;
        v83 = v47;
        _os_log_impl(&dword_212581000, v57, OS_LOG_TYPE_DEBUG, "%{public}s::%d:max:%@ level:%lu %@", buf, 0x30u);
      }

      +[RoamPolicyStore rangeStringWithRssiLevel:](RoamPolicyStore, "rangeStringWithRssiLevel:", v56);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v69;
      -[NSObject setObject:forKey:](v69, "setObject:forKey:", v67, CFSTR("rssiBucketWithMostRoams"));
      -[NSObject setObject:forKey:](v69, "setObject:forKey:", v55, CFSTR("rssiBucketWithRoamsPct"));
      v58 = (void *)MEMORY[0x24BDD16E0];
      v59 = *(_QWORD *)(v72 + 32);
      objc_msgSend(*(id *)(v72 + 40), "bssids");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "objectAtIndex:", v70);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v72 + 40), "managedObjectHandler");
      v71 = (void *)v55;
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "managedObjectContext");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "numberWithUnsignedInteger:", +[RoamMO roamsCountBetweenBssids:target:moc:](RoamMO, "roamsCountBetweenBssids:target:moc:", v59, v61, v63));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKey:](v69, "setObject:forKey:", v64, CFSTR("roamsCount"));

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v72 + 48) + 8) + 40), "addObject:", v69);
      v5 = v73;
      goto LABEL_15;
    }
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    WALogCategoryDefaultHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if ((isKindOfClass & 1) != 0)
    {
      if (v15)
      {
        *(_DWORD *)buf = 136446466;
        v75 = "-[NeighborGraph copyNeighborGraphAsDictionary]_block_invoke";
        v76 = 1024;
        v77 = 296;
        v16 = "%{public}s::%d:Unexpected neighborInfo class";
LABEL_14:
        _os_log_impl(&dword_212581000, v14, OS_LOG_TYPE_ERROR, v16, buf, 0x12u);
      }
    }
    else if (v15)
    {
      *(_DWORD *)buf = 136446466;
      v75 = "-[NeighborGraph copyNeighborGraphAsDictionary]_block_invoke";
      v76 = 1024;
      v77 = 298;
      v16 = "%{public}s::%d:Invalid neighborInfo class";
      goto LABEL_14;
    }
LABEL_15:

  }
}

- (NSArray)bssids
{
  return self->_bssids;
}

- (void)setBssids:(id)a3
{
  objc_storeStrong((id *)&self->_bssids, a3);
}

- (NSMutableArray)graph
{
  return self->_graph;
}

- (void)setGraph:(id)a3
{
  objc_storeStrong((id *)&self->_graph, a3);
}

- (AnalyticsStoreMOHandler)managedObjectHandler
{
  return self->_managedObjectHandler;
}

- (void)setManagedObjectHandler:(id)a3
{
  objc_storeStrong((id *)&self->_managedObjectHandler, a3);
}

- (NSMutableArray)bssidsDwellTimes
{
  return self->_bssidsDwellTimes;
}

- (void)setBssidsDwellTimes:(id)a3
{
  objc_storeStrong((id *)&self->_bssidsDwellTimes, a3);
}

- (NSString)ssid
{
  return self->_ssid;
}

- (void)setSsid:(id)a3
{
  objc_storeStrong((id *)&self->_ssid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ssid, 0);
  objc_storeStrong((id *)&self->_bssidsDwellTimes, 0);
  objc_storeStrong((id *)&self->_managedObjectHandler, 0);
  objc_storeStrong((id *)&self->_graph, 0);
  objc_storeStrong((id *)&self->_bssids, 0);
}

@end
