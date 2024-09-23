@implementation SDLogAgentCollectionContainer

- (id)createRulesFromPaths:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  id v18;
  void *v19;
  char v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  void *v26;

  v4 = a3;
  if (-[SDLogAgentCollectionContainer flattenReturnedDirectoryPaths](self, "flattenReturnedDirectoryPaths"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithMutablePaths:](SDUnitLogPathArray, "logRuleWithMutablePaths:", v4));
    v26 = v5;
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v18 = v4;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          v20 = 0;
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
          v14 = objc_msgSend(v13, "fileExistsAtPath:isDirectory:", v12, &v20);

          if (v14)
          {
            if (v20)
            {
              v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:](SDUnitLogDirectory, "logRuleWithDirectory:", v12));
              objc_msgSend(v5, "addObject:", v15);

            }
            else
            {
              objc_msgSend(v19, "addObject:", v12);
            }
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v9);
    }

    if (objc_msgSend(v19, "count"))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithMutablePaths:](SDUnitLogPathArray, "logRuleWithMutablePaths:", v19));
      objc_msgSend(v5, "addObject:", v16);

    }
    v6 = objc_msgSend(v5, "copy");

    v4 = v18;
  }

  return v6;
}

- (BOOL)addRulesFromHelperReply:(id)a3
{
  xpc_object_t value;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  BOOL v11;

  value = xpc_dictionary_get_value(a3, "resultPaths");
  v5 = (void *)objc_claimAutoreleasedReturnValue(value);
  v6 = v5;
  if (v5)
  {
    v7 = sub_1000240F4(v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDLogAgentCollectionContainer createRulesFromPaths:](self, "createRulesFromPaths:", v8));
    v10 = objc_msgSend(v9, "count");
    v11 = v10 != 0;
    if (v10)
      -[SDLogCollectionContainer addRules:](self, "addRules:", v9);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)flattenReturnedDirectoryPaths
{
  return self->_flattenReturnedDirectoryPaths;
}

- (void)setFlattenReturnedDirectoryPaths:(BOOL)a3
{
  self->_flattenReturnedDirectoryPaths = a3;
}

@end
