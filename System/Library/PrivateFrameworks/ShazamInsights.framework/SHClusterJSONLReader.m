@implementation SHClusterJSONLReader

- (BOOL)readDataLineByLineFromURL:(id)a3 error:(id *)a4 callback:(id)a5
{
  id v8;
  id v9;

  v8 = a3;
  -[SHClusterJSONLReader setCallback:](self, "setCallback:", a5);
  v9 = objc_alloc_init(MEMORY[0x24BE90540]);
  objc_msgSend(v9, "setDelegate:", self);
  LOBYTE(a4) = objc_msgSend(v9, "loadDataFromURL:error:", v8, a4);

  return (char)a4;
}

- (BOOL)parsedJSONObject:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)MEMORY[0x220745558]();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHClusterJSONLReader importClusters:toParentCluster:startIndex:](self, "importClusters:toParentCluster:startIndex:", v7, &stru_24DCD2C90, -[SHClusterJSONLReader index](self, "index"));

  -[SHClusterJSONLReader setIndex:](self, "setIndex:", -[SHClusterJSONLReader index](self, "index") + 1);
  objc_autoreleasePoolPop(v6);

  return 1;
}

- (void)importClusters:(id)a3 toParentCluster:(id)a4 startIndex:(unint64_t)a5
{
  id v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  SHClusterJSONLReader *v21;
  void (**v22)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id obj;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v25 = a4;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v7;
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v26)
  {
    v24 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v30 != v24)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x220745558]();
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("clusters"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "count");
        v13 = &stru_24DCD2C90;
        if (v12)
          v13 = CFSTR(" ");
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu%@"), a5 + i, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringByAppendingString:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v11, "count"))
          -[SHClusterJSONLReader importClusters:toParentCluster:startIndex:](self, "importClusters:toParentCluster:startIndex:", v11, v15, 0);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("tracks"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, CFSTR("tracks"));
        if (objc_msgSend(v16, "count"))
        {
          objc_msgSend(v15, "componentsSeparatedByString:", CFSTR(" "));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v17, "count"))
          {
            objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v18 = 0;
          }
          if ((unint64_t)objc_msgSend(v17, "count") < 2)
          {
            v19 = 0;
          }
          else
          {
            objc_msgSend(v17, "objectAtIndexedSubscript:", 1);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v28 = v10;
          if ((unint64_t)objc_msgSend(v17, "count") < 3)
          {
            v20 = 0;
          }
          else
          {
            objc_msgSend(v17, "objectAtIndexedSubscript:", 2);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
          }
          -[SHClusterJSONLReader callback](self, "callback");
          v21 = self;
          v22 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, void *, void *, void *))v22)[2](v22, v20, v19, v18, v16);

          self = v21;
          v10 = v28;
        }

        objc_autoreleasePoolPop(v10);
      }
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      a5 += i;
    }
    while (v26);
  }

}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
}

@end
