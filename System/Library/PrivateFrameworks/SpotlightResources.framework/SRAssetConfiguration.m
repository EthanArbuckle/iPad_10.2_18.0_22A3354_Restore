@implementation SRAssetConfiguration

- (id)assetTypes
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  SRAssetType *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSMutableDictionary *obj;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v24 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = self->_properties;
  v3 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v26 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        v8 = objc_alloc_init(SRAssetType);
        -[SRAssetType setAssetType:](v8, "setAssetType:", v7);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("XPCName"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SRAssetType setXpcName:](v8, "setXpcName:", v10);

        -[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("DeliveryTypes"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SRAssetType setContentTypeMap:](v8, "setContentTypeMap:", v12);

        -[SRAssetType setDeliveryTypeMap:](v8, "setDeliveryTypeMap:", self->_deliveryTypeMap);
        -[SRAssetType contentTypeMap](v8, "contentTypeMap");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = objc_alloc(MEMORY[0x24BDBCF20]);
          -[SRAssetType contentTypeMap](v8, "contentTypeMap");
          v15 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "allKeys");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)objc_msgSend(v14, "initWithArray:", v16);
          -[SRAssetType setDeliveryTypes:](v8, "setDeliveryTypes:", v17);

        }
        else
        {
          v15 = objc_alloc_init(MEMORY[0x24BDBCF20]);
          -[SRAssetType setDeliveryTypes:](v8, "setDeliveryTypes:", v15);
        }

        -[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", v7);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("CompatibilityVersion"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", v7);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("CompatibilityVersion"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[SRAssetType setCompatibilityVersion:](v8, "setCompatibilityVersion:", objc_msgSend(v21, "integerValue"));

        }
        else
        {
          -[SRAssetType setCompatibilityVersion:](v8, "setCompatibilityVersion:", -1);
        }

        objc_msgSend(v24, "addObject:", v8);
      }
      v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v4);
  }

  return v24;
}

- (void)setProperties:(id)a3 client:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *i;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t j;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  uint64_t v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t m;
  uint64_t v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  id obj;
  id obja;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AssetType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AssetProperties"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("_XPCName"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("_CompatibilityVersion"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DeliveryTypes"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  if (!v10)
    v10 = v8;
  if (v8 && v12)
  {
    v59 = v10;
    v60 = v9;
    v58 = v11;
    v62 = v6;
    v63 = v12;
    v64 = v7;
    if (v10 && v11)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        v14 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_properties, "setObject:forKeyedSubscript:", v14, v8);

      }
      -[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v10, CFSTR("XPCName"));

      -[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v11, CFSTR("CompatibilityVersion"));

      -[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("DeliveryTypes"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        v19 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", v8);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, CFSTR("DeliveryTypes"));

      }
      v85 = 0u;
      v86 = 0u;
      v83 = 0u;
      v84 = 0u;
      v21 = v12;
      obj = (id)objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v83, v90, 16);
      if (obj)
      {
        v67 = *(_QWORD *)v84;
        do
        {
          for (i = 0; i != obj; i = (char *)i + 1)
          {
            if (*(_QWORD *)v84 != v67)
              objc_enumerationMutation(v21);
            v23 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * (_QWORD)i);
            -[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", v8);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("DeliveryTypes"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "objectForKeyedSubscript:", v23);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v26)
            {
              v27 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
              -[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", v8);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("DeliveryTypes"));
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "setObject:forKeyedSubscript:", v27, v23);

            }
            -[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", v8);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("DeliveryTypes"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "objectForKeyedSubscript:", v23);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectForKeyedSubscript:", v23);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "addObjectsFromArray:", v33);

          }
          obj = (id)objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v83, v90, 16);
        }
        while (obj);
      }

      v7 = v64;
    }
    v61 = v8;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_clientMap, "objectForKeyedSubscript:", v7);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v34)
    {
      v35 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_clientMap, "setObject:forKeyedSubscript:", v35, v7);

    }
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    obja = v12;
    v68 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v79, v89, 16);
    if (v68)
    {
      v65 = *(_QWORD *)v80;
      do
      {
        for (j = 0; j != v68; ++j)
        {
          if (*(_QWORD *)v80 != v65)
            objc_enumerationMutation(obja);
          v37 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * j);
          -[NSMutableSet addObject:](self->_deliveryTypes, "addObject:", v37);
          objc_msgSend(obja, "objectForKeyedSubscript:", v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "addObjectsFromArray:", v38);

          v77 = 0u;
          v78 = 0u;
          v75 = 0u;
          v76 = 0u;
          objc_msgSend(obja, "objectForKeyedSubscript:", v37);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v75, v88, 16);
          if (v40)
          {
            v41 = v40;
            v42 = *(_QWORD *)v76;
            do
            {
              for (k = 0; k != v41; ++k)
              {
                if (*(_QWORD *)v76 != v42)
                  objc_enumerationMutation(v39);
                v44 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * k);
                -[NSMutableDictionary objectForKeyedSubscript:](self->_deliveryTypeMap, "objectForKeyedSubscript:", v44);
                v45 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v45)
                {
                  v46 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
                  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deliveryTypeMap, "setObject:forKeyedSubscript:", v46, v44);

                }
                -[NSMutableDictionary objectForKeyedSubscript:](self->_deliveryTypeMap, "objectForKeyedSubscript:", v44);
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "addObject:", v37);

              }
              v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v75, v88, 16);
            }
            while (v41);
          }

        }
        v68 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v79, v89, 16);
      }
      while (v68);
    }

    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v48 = v66;
    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v71, v87, 16);
    v7 = v64;
    if (v49)
    {
      v50 = v49;
      v51 = *(_QWORD *)v72;
      do
      {
        for (m = 0; m != v50; ++m)
        {
          if (*(_QWORD *)v72 != v51)
            objc_enumerationMutation(v48);
          v53 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * m);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_contentTypeMap, "objectForKeyedSubscript:", v53);
          v54 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v54)
          {
            v55 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_contentTypeMap, "setObject:forKeyedSubscript:", v55, v53);

          }
          -[NSMutableDictionary objectForKeyedSubscript:](self->_contentTypeMap, "objectForKeyedSubscript:", v53);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "addObject:", v64);

          -[NSMutableDictionary objectForKeyedSubscript:](self->_clientMap, "objectForKeyedSubscript:", v64);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "addObject:", v53);

        }
        v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v71, v87, 16);
      }
      while (v50);
    }

    v8 = v61;
    v6 = v62;
    v10 = v59;
    v9 = v60;
    v11 = v58;
    v12 = v63;
  }

}

+ (id)configuration
{
  return objc_alloc_init(SRAssetConfiguration);
}

- (SRAssetConfiguration)init
{
  SRAssetConfiguration *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *properties;
  NSMutableDictionary *v5;
  NSMutableDictionary *contentTypeMap;
  NSMutableDictionary *v7;
  NSMutableDictionary *clientMap;
  NSMutableDictionary *v9;
  NSMutableDictionary *deliveryTypeMap;
  NSMutableSet *v11;
  NSMutableSet *deliveryTypes;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SRAssetConfiguration;
  v2 = -[SRAssetConfiguration init](&v14, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    properties = v2->_properties;
    v2->_properties = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    contentTypeMap = v2->_contentTypeMap;
    v2->_contentTypeMap = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    clientMap = v2->_clientMap;
    v2->_clientMap = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    deliveryTypeMap = v2->_deliveryTypeMap;
    v2->_deliveryTypeMap = v9;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    deliveryTypes = v2->_deliveryTypes;
    v2->_deliveryTypes = v11;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deliveryTypes, 0);
  objc_storeStrong((id *)&self->_deliveryTypeMap, 0);
  objc_storeStrong((id *)&self->_clientMap, 0);
  objc_storeStrong((id *)&self->_contentTypeMap, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

- (id)debugDescription
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(&stru_251909998, "mutableCopy");
  v4 = v3;
  if (self->_properties)
    objc_msgSend(v3, "appendFormat:", CFSTR("properties: %@\n"), self->_properties);
  if (self->_contentTypeMap)
    objc_msgSend(v4, "appendFormat:", CFSTR("contentTypeMap: %@\n"), self->_contentTypeMap);
  if (self->_clientMap)
    objc_msgSend(v4, "appendFormat:", CFSTR("clientMap: %@\n"), self->_clientMap);
  if (self->_deliveryTypeMap)
    objc_msgSend(v4, "appendFormat:", CFSTR("deliveryTypeMap: %@\n"), self->_deliveryTypeMap);
  if (self->_deliveryTypes)
    objc_msgSend(v4, "appendFormat:", CFSTR("deliveryTypes: %@\n"), self->_deliveryTypes);
  return v4;
}

- (id)contentTypesForClient:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_clientMap, "objectForKeyedSubscript:", a3);
}

- (void)clear
{
  -[NSMutableDictionary removeAllObjects](self->_properties, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_contentTypeMap, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_clientMap, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_deliveryTypeMap, "removeAllObjects");
}

@end
