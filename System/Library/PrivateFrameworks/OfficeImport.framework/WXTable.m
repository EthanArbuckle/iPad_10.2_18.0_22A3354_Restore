@implementation WXTable

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5
{
  id v7;
  CXNamespace *v8;
  _xmlNode *v9;
  CXNamespace *v10;
  _xmlNode *v11;
  CXNamespace *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  CXNamespace *v19;
  _xmlNode *v20;
  _xmlAttr ***v21;
  CXNamespace *v22;
  _xmlNode *Child;
  CXNamespace *v24;
  _xmlAttr *v25;
  unint64_t v26;
  _xmlAttr **v27;
  _xmlAttr **v28;
  _xmlAttr **v29;
  unint64_t v30;
  unint64_t v31;
  unsigned int v32;
  unint64_t v33;
  char *v34;
  unsigned int v35;
  uint64_t v36;
  _xmlAttr **v37;
  _xmlAttr *v38;
  CXNamespace *v39;
  _xmlNode *v40;
  void *v41;
  uint64_t v42;
  _xmlAttr **v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  id v52;

  v52 = a4;
  v7 = a5;
  objc_msgSend(v7, "WXMainNamespace");
  v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v9 = (_xmlNode *)OCXFindChild(a3, v8, "tblPr");

  if (v9)
  {
    objc_msgSend(v7, "WXMainNamespace", 0);
    v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v11 = (_xmlNode *)OCXFindChild(v9, v10, "tblStyle");

    if (!v11)
      goto LABEL_5;
    objc_msgSend(v7, "WXMainNamespace");
    v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    CXDefaultStringAttribute(v11, v12, (xmlChar *)"val", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v52, "document");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "styleSheet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "styleWithId:", v13);
    v16 = objc_claimAutoreleasedReturnValue();

    v49 = v16;
    if (v16)
    {
      objc_msgSend(v52, "properties");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setBaseStyle:", v16);

    }
    else
    {
LABEL_5:
      v49 = 0;
    }
    objc_msgSend(v52, "properties", v49);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[WXTableProperties readFrom:to:state:](WXTableProperties, "readFrom:to:state:", v9, v18, v7);

  }
  else
  {
    v50 = 0;
  }
  objc_msgSend(v7, "WXMainNamespace", v50);
  v19 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v20 = (_xmlNode *)OCXFindChild(a3, v19, "tblGrid");

  v21 = (_xmlAttr ***)operator new();
  *v21 = 0;
  v21[1] = 0;
  v21[2] = 0;
  objc_msgSend(v7, "WXMainNamespace");
  v22 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  Child = (_xmlNode *)OCXFindChild(v20, v22, "gridCol");

  while (Child)
  {
    objc_msgSend(v7, "WXMainNamespace");
    v24 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v25 = CXRequiredLongAttribute(Child, v24, (xmlChar *)"w", 14);

    v27 = v21[1];
    v26 = (unint64_t)v21[2];
    if ((unint64_t)v27 >= v26)
    {
      v29 = *v21;
      v30 = (char *)v27 - (char *)*v21;
      v31 = (v26 - (unint64_t)*v21) >> 3;
      if (2 * (int)v31 <= (v30 >> 3) + 1)
        v32 = (v30 >> 3) + 1;
      else
        v32 = 2 * v31;
      if (v31 >= 0x7FFFFFFF)
        v33 = 0xFFFFFFFFLL;
      else
        v33 = v32;
      if ((_DWORD)v33)
      {
        v34 = (char *)std::__allocate_at_least[abi:ne180100]<ChAllocator<EshComputedValue>>((uint64_t)(v21 + 2), v33);
        v36 = v35;
        v29 = *v21;
        v27 = v21[1];
      }
      else
      {
        v34 = 0;
        v36 = 0;
      }
      v37 = (_xmlAttr **)&v34[v30 & 0x7FFFFFFF8];
      *v37 = v25;
      v28 = v37 + 1;
      while (v27 != v29)
      {
        v38 = *--v27;
        *--v37 = v38;
      }
      *v21 = v37;
      v21[1] = v28;
      v21[2] = (_xmlAttr **)&v34[8 * v36];
      if (v29)
        operator delete(v29);
    }
    else
    {
      *v27 = v25;
      v28 = v27 + 1;
    }
    v21[1] = v28;
    objc_msgSend(v7, "WXMainNamespace");
    v39 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = OCXFindNextChild(Child, v39, (xmlChar *)"gridCol");

  }
  v40 = OCXFirstChild(a3);
  v41 = 0;
  while (v40)
  {
    if (xmlStrEqual(v40->name, (const xmlChar *)"tr"))
    {
      objc_msgSend(v52, "addRow");
      v42 = objc_claimAutoreleasedReturnValue();

      v41 = (void *)v42;
      +[WXTableRow readFrom:tableGrid:to:state:](WXTableRow, "readFrom:tableGrid:to:state:", v40, v21, v42, v7);
    }
    else if (xmlStrEqual(v40->name, (const xmlChar *)"commentRangeStart"))
    {
      objc_msgSend(v7, "addPendingComment:", v40);
    }
    v40 = OCXNextSibling(v40);
  }
  v43 = *v21;
  v21[1] = *v21;
  if (v43)
    operator delete(v43);
  MEMORY[0x22E2DD408](v21, 0x10C402FEFCB83);
  if (objc_msgSend(v52, "rowCount") && objc_msgSend(v7, "currentTableWraps"))
  {
    objc_msgSend(v52, "rowAt:", 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v44, "cellCount"))
    {
      objc_msgSend(v44, "cellAt:", 0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "text");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v46, "blockCount"))
      {
        objc_msgSend(v46, "blockAt:", 0);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v47, "properties");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "setResolveMode:", 0);
          objc_msgSend(v48, "setWrapCode:", 2);
          objc_msgSend(v48, "setResolveMode:", 2);

        }
      }

    }
  }
  objc_msgSend(v7, "setCurrentRowCNFStyle:", 0);
  objc_msgSend(v7, "setCurrentCellCNFStyle:", 0);
  objc_msgSend(v7, "setCurrentTableWraps:", 0);

}

+ (id)newTableGrid:(id)a3
{
  void *v3;
  unint64_t i;
  void *v5;
  unint64_t j;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v24 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i < objc_msgSend(v24, "rowCount"); ++i)
  {
    objc_msgSend(v24, "rowAt:", i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    for (j = 0; j < objc_msgSend(v5, "cellCount"); ++j)
    {
      objc_msgSend(v5, "cellAt:", j);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "properties");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (int)objc_msgSend(v8, "position");

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v10);

    }
  }
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("self"), 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingDescriptors:", v11);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v13 = v23;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v14)
  {
    v15 = 0;
    v16 = *(_QWORD *)v26;
    do
    {
      for (k = 0; k != v14; ++k)
      {
        if (*(_QWORD *)v26 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * k);
        v19 = objc_msgSend(v18, "unsignedLongValue");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v19 - v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v20);
        v15 = objc_msgSend(v18, "unsignedLongValue");

      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v14);
  }

  return v12;
}

@end
