@implementation WXTableRowProperties

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5
{
  id v7;
  id v8;
  CXNamespace *v9;
  _xmlNode *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CXNamespace *v17;
  _xmlNode *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  CXNamespace *v27;
  xmlNode *v28;
  void *v29;
  CXNamespace *v30;
  xmlNode *v31;
  void *v32;
  CXNamespace *v33;
  _xmlNode *v34;
  CXNamespace *v35;
  CXNamespace *v36;
  _xmlNode *v37;
  CXNamespace *v38;
  _BOOL4 v39;
  _BOOL8 v40;
  BOOL v41;
  uint64_t v42;
  __int16 v43;
  unsigned int v44;
  unsigned int v45;

  v7 = a4;
  v8 = a5;
  objc_msgSend(v8, "WXMainNamespace");
  v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v10 = (_xmlNode *)OCXFindChild(a3, v9, "ins");

  if (v10)
  {
    objc_msgSend(v7, "characterProperties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEdited:", 1);

    objc_msgSend(v7, "characterProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    wmxmlGetDateProperty(v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setEditDate:", v13);

    objc_msgSend(v7, "characterProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "document");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    wmxmlGetAuthorProperty(v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setIndexToAuthorIDOfEdit:", (unsigned __int16)objc_msgSend(v15, "revisionAuthorAddLookup:", v16));

  }
  objc_msgSend(v8, "WXMainNamespace");
  v17 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v18 = (_xmlNode *)OCXFindChild(a3, v17, "del");

  if (v18)
  {
    objc_msgSend(v7, "characterProperties");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDeleted:", 1);

    objc_msgSend(v7, "characterProperties");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    wmxmlGetDateProperty(v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setDeletionDate:", v21);

    objc_msgSend(v7, "characterProperties");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "document");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    wmxmlGetAuthorProperty(v18);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setIndexToAuthorIDOfDeletion:", (unsigned __int16)objc_msgSend(v23, "revisionAuthorAddLookup:", v24));

  }
  v45 = 0;
  +[WXCommon heightTypeEnumMap](WXCommon, "heightTypeEnumMap");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = readEnumProperty<WDHeightType>(a3, "trHeight", (const xmlChar *)"hRule", v25, &v45, v8);

  if (v26)
    objc_msgSend(v7, "setHeightType:", v45);
  v44 = 1;
  v43 = 0;
  v42 = 0;
  objc_msgSend(v8, "WXMainNamespace");
  v27 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v28 = (xmlNode *)OCXFindChild(a3, v27, "wBefore");

  objc_msgSend(v8, "WXMainNamespace");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v28) = WXOptionalTableWidthAttribute(v28, v29, (xmlChar *)"w", &v43, &v44);

  if ((_DWORD)v28)
  {
    objc_msgSend(v7, "setWidthBefore:", v43);
    objc_msgSend(v7, "setWidthBeforeType:", v44);
  }
  objc_msgSend(v8, "WXMainNamespace");
  v30 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v31 = (xmlNode *)OCXFindChild(a3, v30, "wAfter");

  objc_msgSend(v8, "WXMainNamespace");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v31) = WXOptionalTableWidthAttribute(v31, v32, (xmlChar *)"w", &v43, &v44);

  if ((_DWORD)v31)
  {
    objc_msgSend(v7, "setWidthAfter:", v43);
    objc_msgSend(v7, "setWidthAfterType:", v44);
  }
  objc_msgSend(v8, "WXMainNamespace");
  v33 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v34 = (_xmlNode *)OCXFindChild(a3, v33, "trHeight");

  objc_msgSend(v8, "WXMainNamespace");
  v35 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  LODWORD(v34) = CXOptionalLongAttribute(v34, v35, (xmlChar *)"val", &v42, 14);

  if ((_DWORD)v34)
    objc_msgSend(v7, "setHeight:", (__int16)v42);
  v41 = 0;
  objc_msgSend(v8, "WXMainNamespace");
  v36 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v37 = (_xmlNode *)OCXFindChild(a3, v36, "tblHeader");

  objc_msgSend(v8, "WXMainNamespace");
  v38 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v39 = CXOptionalBoolAttribute(v37, v38, (xmlChar *)"val", &v41);

  if (v39)
  {
    v40 = v41;
LABEL_17:
    objc_msgSend(v7, "setHeader:", v40);
    goto LABEL_18;
  }
  if (v37)
  {
    v40 = 1;
    goto LABEL_17;
  }
LABEL_18:
  objc_msgSend(v8, "setCurrentRowCNFStyle:", +[WXTableCellProperties bitfieldForCnfStyleFrom:state:](WXTableCellProperties, "bitfieldForCnfStyleFrom:state:", a3, v8));

}

@end
