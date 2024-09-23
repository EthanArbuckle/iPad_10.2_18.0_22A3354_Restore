@implementation APDBEventRow

- (id)readOnlyColumns
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("branch"), CFSTR("environment"), 0));
  v8.receiver = self;
  v8.super_class = (Class)APDBEventRow;
  v4 = -[APDBEventRow readOnlyColumns](&v8, "readOnlyColumns");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "setByAddingObjectsFromSet:", v5));

  return v6;
}

- (id)initHandle:(id)a3 timestamp:(id)a4 purpose:(id)a5 event:(id)a6 source:(id)a7 unknownSource:(id)a8 handleSet:(id)a9 eventOrder:(id)a10 trace:(id)a11 branch:(id)a12 environment:(id)a13 impression:(id)a14 properties:(id)a15 internalProperties:(id)a16 insertOrder:(id)a17 table:(id)a18
{
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  objc_super v45;

  v23 = a3;
  v24 = a4;
  v25 = a5;
  v26 = a6;
  v44 = a7;
  v43 = a8;
  v42 = a9;
  v27 = v26;
  v41 = a10;
  v28 = v25;
  v40 = a11;
  v29 = v24;
  v39 = a12;
  v30 = a13;
  v31 = a14;
  v32 = a15;
  v33 = a16;
  v34 = a17;
  v45.receiver = self;
  v45.super_class = (Class)APDBEventRow;
  v35 = -[APDBEventRow initAsNewObjectWithTable:](&v45, "initAsNewObjectWithTable:", a18);
  v36 = v35;
  if (v35)
  {
    objc_msgSend(v35, "setValue:forColumnName:", v23, CFSTR("handle"));
    objc_msgSend(v36, "setValue:forColumnName:", v29, CFSTR("timestamp"));
    objc_msgSend(v36, "setValue:forColumnName:", v28, CFSTR("purpose"));
    objc_msgSend(v36, "setValue:forColumnName:", v27, CFSTR("event"));
    objc_msgSend(v36, "setValue:forColumnName:", v44, CFSTR("source"));
    objc_msgSend(v36, "setValue:forColumnName:", v43, CFSTR("unknownSource"));
    objc_msgSend(v36, "setValue:forColumnName:", v42, CFSTR("handleSet"));
    objc_msgSend(v36, "setValue:forColumnName:", v41, CFSTR("eventOrder"));
    objc_msgSend(v36, "setValue:forColumnName:", v40, CFSTR("trace"));
    objc_msgSend(v36, "setBranch:", v39);
    objc_msgSend(v36, "setEnvironment:", v30);
    objc_msgSend(v36, "setValue:forColumnName:", v31, CFSTR("impression"));
    objc_msgSend(v36, "setProperties:", v32);
    objc_msgSend(v36, "setInternalProperties:", v33);
    objc_msgSend(v36, "setValue:forColumnName:", v34, CFSTR("insertOrder"));
  }

  return v36;
}

- (id)initHandle:(id)a3 timestamp:(id)a4 event:(id)a5 impression:(id)a6 insertOrder:(id)a7 table:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  objc_super v22;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v22.receiver = self;
  v22.super_class = (Class)APDBEventRow;
  v19 = -[APDBEventRow initAsNewObjectWithTable:](&v22, "initAsNewObjectWithTable:", a8);
  v20 = v19;
  if (v19)
  {
    objc_msgSend(v19, "setValue:forColumnName:", v14, CFSTR("handle"));
    objc_msgSend(v20, "setValue:forColumnName:", v15, CFSTR("timestamp"));
    objc_msgSend(v20, "setValue:forColumnName:", v16, CFSTR("event"));
    objc_msgSend(v20, "setValue:forColumnName:", v17, CFSTR("impression"));
    objc_msgSend(v20, "setValue:forColumnName:", v18, CFSTR("insertOrder"));
  }

  return v20;
}

- (void)setBranch:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "componentsJoinedByString:", CFSTR("|")));
  -[APDBEventRow setValue:forColumnName:](self, "setValue:forColumnName:", v4, CFSTR("branchString"));

}

- (NSArray)branch
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APDBEventRow valueForColumnName:](self, "valueForColumnName:", CFSTR("branchString")));
  v3 = v2;
  if (v2)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "componentsSeparatedByString:", CFSTR("|")));
  else
    v4 = 0;

  return (NSArray *)v4;
}

- (void)setEnvironment:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "componentsJoinedByString:", CFSTR("|")));
  -[APDBEventRow setValue:forColumnName:](self, "setValue:forColumnName:", v4, CFSTR("environmentString"));

}

- (NSArray)environment
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APDBEventRow valueForColumnName:](self, "valueForColumnName:", CFSTR("environmentString")));
  v3 = v2;
  if (v2)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "componentsSeparatedByString:", CFSTR("|")));
  else
    v4 = 0;

  return (NSArray *)v4;
}

- (NSDictionary)properties
{
  return (NSDictionary *)-[APDBEventRow dictionaryFromBlobForColumnName:](self, "dictionaryFromBlobForColumnName:", CFSTR("propertiesData"));
}

- (void)setProperties:(id)a3
{
  -[APDBEventRow setDictionary:forBlobColumnName:](self, "setDictionary:forBlobColumnName:", a3, CFSTR("propertiesData"));
}

- (NSDictionary)internalProperties
{
  return (NSDictionary *)-[APDBEventRow dictionaryFromBlobForColumnName:](self, "dictionaryFromBlobForColumnName:", CFSTR("internalPropertiesData"));
}

- (void)setInternalProperties:(id)a3
{
  -[APDBEventRow setDictionary:forBlobColumnName:](self, "setDictionary:forBlobColumnName:", a3, CFSTR("internalPropertiesData"));
}

- (NSNumber)insertOrder
{
  return self->_insertOrder;
}

- (void)setInsertOrder:(id)a3
{
  objc_storeStrong((id *)&self->_insertOrder, a3);
}

- (NSData)propertiesData
{
  return self->_propertiesData;
}

- (void)setPropertiesData:(id)a3
{
  objc_storeStrong((id *)&self->_propertiesData, a3);
}

- (NSData)internalPropertiesData
{
  return self->_internalPropertiesData;
}

- (void)setInternalPropertiesData:(id)a3
{
  objc_storeStrong((id *)&self->_internalPropertiesData, a3);
}

- (NSString)branchString
{
  return self->_branchString;
}

- (void)setBranchString:(id)a3
{
  objc_storeStrong((id *)&self->_branchString, a3);
}

- (NSString)environmentString
{
  return self->_environmentString;
}

- (void)setEnvironmentString:(id)a3
{
  objc_storeStrong((id *)&self->_environmentString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentString, 0);
  objc_storeStrong((id *)&self->_branchString, 0);
  objc_storeStrong((id *)&self->_internalPropertiesData, 0);
  objc_storeStrong((id *)&self->_propertiesData, 0);
  objc_storeStrong((id *)&self->_insertOrder, 0);
}

@end
