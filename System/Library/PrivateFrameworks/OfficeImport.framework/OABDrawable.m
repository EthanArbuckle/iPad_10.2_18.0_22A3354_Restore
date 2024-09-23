@implementation OABDrawable

+ (id)readDrawablesFromContainer:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "childCount");
  if (v9)
  {
    v10 = 0;
    do
    {
      objc_msgSend(v6, "childAt:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "readDrawableFromObject:state:", v11, v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        objc_msgSend(v8, "addObject:", v12);

      ++v10;
    }
    while (v9 != v10);
  }

  return v8;
}

+ (id)readDrawableFromObject:(id)a3 state:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  EshGroupProperties *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "eshObject");
  v8 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v7 + 16))(v7);
  if (v8 == 7)
  {
    +[OABShape readShape:state:](OABShape, "readShape:state:", v5, v6);
    v15 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v14 = (void *)v15;
    goto LABEL_14;
  }
  if (v8 != 61443)
  {
    v14 = 0;
    goto LABEL_14;
  }
  if (!objc_msgSend((id)objc_msgSend(v6, "client"), "tablesAreAllowed"))
  {
LABEL_12:
    +[OABGroup readGroup:state:](OABGroup, "readGroup:state:", v5, v6);
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v9 = objc_opt_class();
  TSUDynamicCast(v9, (uint64_t)v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "eshGroup");
  if (!v11
    || (v12 = (EshGroupProperties *)(v11 + 288),
        !EshGroupProperties::isTablePropertiesSet((EshGroupProperties *)(v11 + 288))))
  {

    goto LABEL_12;
  }
  v13 = *(unsigned __int8 *)EshGroupProperties::getTableProperties(v12);

  if (!v13)
    goto LABEL_12;
  +[OABTable readTable:state:](OABTable, "readTable:state:", v5, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_12;
LABEL_14:

  return v14;
}

+ (void)setUpXmlDrawingState:(id)a3 withBinaryReaderState:(id)a4 targetDocument:(id)a5 colorMap:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v9 = a4;
  v10 = a5;
  v11 = a6;
  objc_msgSend(v10, "theme");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "baseStyles");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "styleMatrix");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setStyleMatrix:", v14);

  objc_msgSend(v12, "baseStyles");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "colorScheme");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setColorScheme:", v16);

  objc_msgSend(v21, "setColorMap:", v11);
  objc_msgSend(v12, "baseStyles");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "fontScheme");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFontScheme:", v18);

  objc_msgSend(v10, "blips");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTargetBlipCollection:", v19);

  objc_msgSend(v9, "groupStackReference");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "replaceGroupStack:", v20);

}

+ (id)readDrawableFromZipPackageData:(const CsData *)a3 foundInObject:(id)a4 state:(id)a5
{
  id v7;
  id v8;
  char v9;
  char v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v21;
  void *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _QWORD v29[7];

  v29[5] = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  v9 = objc_msgSend(v8, "useXmlBlobs");
  if (a3)
    v10 = v9;
  else
    v10 = 0;
  if ((v10 & 1) != 0
    && a3->var1
    && (OCPNewZipPackageWithCsData((CsData *)a3), (v11 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v29[0] = CFSTR("http://schemas.microsoft.com/office/2006/relationships/shapeXml");
    v29[1] = CFSTR("http://schemas.microsoft.com/office/2006/relationships/connectorXml");
    v29[2] = CFSTR("http://schemas.microsoft.com/office/2006/relationships/pictureXml");
    v29[3] = CFSTR("http://schemas.microsoft.com/office/2006/relationships/graphicFrameDoc");
    v29[4] = CFSTR("http://schemas.microsoft.com/office/2006/relationships/groupShapeXml");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 5);
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v12);
          v16 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v11, "relationshipsByType:", v16, (_QWORD)v24);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v17, "count"))
          {
            objc_opt_class();
            objc_msgSend(v11, "partByRelationshipType:", v16);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)objc_msgSend(v8, "client"), "readDrawableFromPackagePart:foundInObject:state:", v21, v7, v8);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v22;
            if (v22)
            {
              objc_msgSend(v22, "setAltId:", objc_msgSend(v22, "id"));
              v23 = objc_msgSend(v7, "shapeID");
              objc_msgSend(v18, "setId:", v23);
              objc_msgSend(v8, "setDrawable:forShapeId:", v18, v23);
            }

            goto LABEL_21;
          }

        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v13)
          continue;
        break;
      }
    }
    v18 = 0;
LABEL_21:

    v19 = v18;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

@end
