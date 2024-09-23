@implementation BDCSchema

+ (id)sharedBDCSchema
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018384;
  block[3] = &unk_10002C5E0;
  block[4] = a1;
  if (qword_1000352C8 != -1)
    dispatch_once(&qword_1000352C8, block);
  return (id)qword_1000352C0;
}

- (BDCSchema)init
{
  BDCSchema *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSDictionary *versionSchemaMap;
  void *v10;
  objc_super v11;
  _QWORD v12[4];
  _QWORD v13[4];
  _QWORD v14[4];
  _QWORD v15[4];
  _QWORD v16[4];
  _QWORD v17[4];
  _QWORD v18[4];
  _QWORD v19[4];
  _QWORD v20[5];
  _QWORD v21[5];
  const __CFString *v22;
  void *v23;

  v11.receiver = self;
  v11.super_class = (Class)BDCSchema;
  v2 = -[BDCSchema init](&v11, "init");
  if (v2)
  {
    v22 = CFSTR("1.3");
    v20[0] = CFSTR("timestamp");
    v18[0] = CFSTR("StreamName");
    v18[1] = CFSTR("ColumnName");
    v19[0] = CFSTR("BDC_SBC");
    v19[1] = CFSTR("timestamp");
    v18[2] = CFSTR("ColumnIndexinCSV");
    v18[3] = CFSTR("DataType");
    v19[2] = &off_10002FB60;
    v19[3] = &off_10002FB78;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 4));
    v21[0] = v10;
    v20[1] = CFSTR("uisoc");
    v16[0] = CFSTR("StreamName");
    v16[1] = CFSTR("ColumnName");
    v17[0] = CFSTR("BDC_SBC");
    v17[1] = CFSTR("CurrentCapacity");
    v16[2] = CFSTR("ColumnIndexinCSV");
    v16[3] = CFSTR("DataType");
    v17[2] = &off_10002FB90;
    v17[3] = &off_10002FBA8;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 4));
    v20[2] = CFSTR("temp");
    v21[1] = v3;
    v15[0] = CFSTR("BDC_SBC");
    v15[1] = CFSTR("Temperature");
    v14[0] = CFSTR("StreamName");
    v14[1] = CFSTR("ColumnName");
    v14[2] = CFSTR("ColumnIndexinCSV");
    v14[3] = CFSTR("DataType");
    v15[2] = &off_10002FBC0;
    v15[3] = &off_10002FBA8;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 4));
    v21[2] = v4;
    v20[3] = CFSTR("amperage");
    v12[0] = CFSTR("StreamName");
    v12[1] = CFSTR("ColumnName");
    v13[0] = CFSTR("BDC_SBC");
    v13[1] = CFSTR("Amperage");
    v12[2] = CFSTR("ColumnIndexinCSV");
    v12[3] = CFSTR("DataType");
    v13[2] = &off_10002FBD8;
    v13[3] = &off_10002FBA8;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 4));
    v20[4] = CFSTR("maxColumnIdx");
    v21[3] = v5;
    v21[4] = &off_10002FBF0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 5));
    v23 = v6;
    v7 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
    versionSchemaMap = v2->_versionSchemaMap;
    v2->_versionSchemaMap = (NSDictionary *)v7;

  }
  return v2;
}

- (id)bdcStreamNameforKey:(id)a3 atVersion:(id)a4
{
  id v5;
  NSDictionary *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v5 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_versionSchemaMap;
  v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10), "isEqualToString:", v5, (_QWORD)v14) & 1) != 0)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_versionSchemaMap, "objectForKeyedSubscript:", v5));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("StreamName")));

          goto LABEL_11;
        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = -[NSDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (int)maxColumnIndexForBDCStream:(id)a3 atVersion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;

  v6 = a4;
  if (objc_msgSend(a3, "isEqual:", CFSTR("BDC_SBC"))
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_versionSchemaMap, "objectForKeyedSubscript:", v6))) != 0)
  {
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("maxColumnIdx")));
    v10 = objc_msgSend(v9, "intValue");

  }
  else
  {
    v10 = -1;
  }

  return v10;
}

- (int)columnIndexForColumnName:(id)a3 atVersion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_versionSchemaMap, "objectForKeyedSubscript:", a4));
  v8 = v7;
  if (v7 && (v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v6))) != 0)
  {
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ColumnIndexinCSV")));
    v12 = objc_msgSend(v11, "intValue");

  }
  else
  {
    v12 = -1;
  }

  return v12;
}

- (id)bdcNameForColumnName:(id)a3 atVersion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_versionSchemaMap, "objectForKeyedSubscript:", a4));
  v8 = v7;
  if (v7 && (v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v6))) != 0)
  {
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ColumnName")));

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionSchemaMap, 0);
}

@end
