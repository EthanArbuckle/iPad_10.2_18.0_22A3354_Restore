@implementation CLSTaxonomyBasedModel

- (CLSTaxonomyBasedModel)initWithSceneTaxonomy:(id)a3
{
  id v5;
  CLSTaxonomyBasedModel *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *signalNodeBySignalName;
  NSMutableDictionary *v9;
  NSMutableDictionary *signalNodeBySignalIdentifier;
  uint64_t v11;
  NSString *identifier;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CLSTaxonomyBasedModel;
  v6 = -[CLSTaxonomyBasedModel init](&v14, sel_init);
  if (v6)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    signalNodeBySignalName = v6->_signalNodeBySignalName;
    v6->_signalNodeBySignalName = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    signalNodeBySignalIdentifier = v6->_signalNodeBySignalIdentifier;
    v6->_signalNodeBySignalIdentifier = v9;

    objc_storeStrong((id *)&v6->_sceneTaxonomy, a3);
    -[PFSceneTaxonomy digest](v6->_sceneTaxonomy, "digest");
    v11 = objc_claimAutoreleasedReturnValue();
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v11;

  }
  return v6;
}

- (id)nodeForSignalIdentifier:(unint64_t)a3
{
  NSMutableDictionary *signalNodeBySignalIdentifier;
  void *v6;
  void *v7;
  void *v8;
  CLSTaxonomyBasedSignalNode *v9;
  NSMutableDictionary *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;

  signalNodeBySignalIdentifier = self->_signalNodeBySignalIdentifier;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](signalNodeBySignalIdentifier, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[CLSTaxonomyBasedModel taxonomyNodeForSceneIdentifier:](self, "taxonomyNodeForSceneIdentifier:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v9 = -[CLSTaxonomyBasedSignalNode initWithTaxonomyNode:]([CLSTaxonomyBasedSignalNode alloc], "initWithTaxonomyNode:", v7);
      if (v9)
      {
        v10 = self->_signalNodeBySignalIdentifier;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v9, v11);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = self->_signalNodeBySignalIdentifier;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v11, v13);

      }
      goto LABEL_10;
    }
LABEL_7:
    v9 = 0;
LABEL_10:

    v7 = v9;
    return v7;
  }
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
    goto LABEL_7;
  return v7;
}

- (id)sceneIdentifierBySceneNameForSceneNames:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t i;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v22;
    v10 = MEMORY[0x24BDACB70];
    *(_QWORD *)&v7 = 138412290;
    v19 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(obj);
        v12 = *(id *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v12, "lowercaseString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v13, "isEqualToString:", v12) & 1) == 0)
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v19;
            v26 = v12;
            _os_log_impl(&dword_244052000, v10, OS_LOG_TYPE_INFO, "Scene names should be lower case, %@ is not", buf, 0xCu);
          }
          v14 = v13;

          v12 = v14;
        }
        -[CLSTaxonomyBasedModel taxonomyNodeForName:](self, "taxonomyNodeForName:", v12, v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v15, "extendedSceneClassId"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, v12);

        }
        else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v19;
          v26 = v12;
          _os_log_error_impl(&dword_244052000, v10, OS_LOG_TYPE_ERROR, "[CLSSceneModel] %@ is not a scene name", buf, 0xCu);
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)sceneIdentifiersForSceneNames:(id)a3 includingChildScenes:(BOOL)a4
{
  id v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  id obj;
  _BOOL4 v22;
  _QWORD v23[5];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v22 = a4;
  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v7)
  {
    v9 = v7;
    v10 = MEMORY[0x24BDACB70];
    v11 = *(_QWORD *)v26;
    *(_QWORD *)&v8 = 138412290;
    v20 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(obj);
        v13 = *(id *)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v13, "lowercaseString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v14, "isEqualToString:", v13) & 1) == 0)
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v20;
            v30 = v13;
            _os_log_impl(&dword_244052000, v10, OS_LOG_TYPE_INFO, "Scene names should be lower case, %@ is not", buf, 0xCu);
          }
          v15 = v14;

          v13 = v15;
        }
        -[CLSTaxonomyBasedModel taxonomyNodeForName:](self, "taxonomyNodeForName:", v13, v20);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v16, "extendedSceneClassId"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v18);

          if (v22)
          {
            v23[0] = MEMORY[0x24BDAC760];
            v23[1] = 3221225472;
            v23[2] = __76__CLSTaxonomyBasedModel_sceneIdentifiersForSceneNames_includingChildScenes___block_invoke;
            v23[3] = &unk_25149B668;
            v23[4] = self;
            v24 = v6;
            objc_msgSend(v17, "traverse:visitor:", 1, v23);

          }
        }
        else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v20;
          v30 = v13;
          _os_log_error_impl(&dword_244052000, v10, OS_LOG_TYPE_ERROR, "[CLSSceneModel] %@ is not a scene name", buf, 0xCu);
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v9);
  }

  return v6;
}

- (id)confidenceThresholdBySceneIdentifierForSceneNames:(id)a3 withThresholdType:(unint64_t)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  unint64_t v10;
  uint64_t i;
  id v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  id v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  int v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v19 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    v9 = MEMORY[0x24BDACB70];
    v10 = a4 - 1;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(obj);
        v12 = *(id *)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (-[CLSTaxonomyBasedModel taxonomyNodeRefForName:](self, "taxonomyNodeRefForName:", v12))
        {
          switch(v10)
          {
            case 0uLL:
              PFSceneTaxonomyNodeSearchThreshold();
              goto LABEL_16;
            case 1uLL:
              PFSceneTaxonomyNodeF0Point5Threshold();
              goto LABEL_16;
            case 2uLL:
              PFSceneTaxonomyNodeF2Threshold();
              goto LABEL_16;
            case 3uLL:
              PFSceneTaxonomyNodeF1Threshold();
              goto LABEL_16;
            case 4uLL:
              PFSceneTaxonomyNodeGraphHighPrecisionThreshold();
              goto LABEL_16;
            case 5uLL:
              PFSceneTaxonomyNodeGraphHighRecallThreshold();
LABEL_16:
              if (v13 == 1.79769313e308)
                goto LABEL_17;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", PFSceneTaxonomyNodeExtendedSceneClassId());
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "setObject:forKeyedSubscript:", v15, v16);

              v10 = a4 - 1;
              break;
            default:
LABEL_17:
              if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
              {
                PFSceneTaxonomyNodeName();
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v26 = v14;
                v27 = 1024;
                v28 = a4;
                _os_log_error_impl(&dword_244052000, v9, OS_LOG_TYPE_ERROR, "No confidence threshold found for node with name %@ and thresholdType %d", buf, 0x12u);

              }
              break;
          }
        }
        else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v12;
          _os_log_error_impl(&dword_244052000, v9, OS_LOG_TYPE_ERROR, "%@ is not a scene name", buf, 0xCu);
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v7);
  }

  return v19;
}

- (id)sceneNamesFromSceneClassifications:(id)a3 passingThresholdOfType:(unint64_t)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    v12 = a4 - 1;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (-[CLSTaxonomyBasedModel taxonomyNodeRefForSceneIdentifier:](self, "taxonomyNodeRefForSceneIdentifier:", objc_msgSend(v14, "sceneIdentifier", (_QWORD)v20)))
        {
          switch(v12)
          {
            case 0uLL:
              PFSceneTaxonomyNodeSearchThreshold();
              goto LABEL_15;
            case 1uLL:
              PFSceneTaxonomyNodeF0Point5Threshold();
              goto LABEL_15;
            case 2uLL:
              PFSceneTaxonomyNodeF2Threshold();
              goto LABEL_15;
            case 3uLL:
              PFSceneTaxonomyNodeF1Threshold();
              goto LABEL_15;
            case 4uLL:
              PFSceneTaxonomyNodeGraphHighPrecisionThreshold();
              goto LABEL_15;
            case 5uLL:
              PFSceneTaxonomyNodeGraphHighRecallThreshold();
LABEL_15:
              v16 = v15;
              break;
            default:
              v16 = 1.79769313e308;
              break;
          }
          objc_msgSend(v14, "confidence");
          if (v17 >= v16)
          {
            PFSceneTaxonomyNodeName();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v18);

          }
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)sceneIdentifiersFromSceneClassifications:(id)a3 passingThresholdOfType:(unint64_t)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    v12 = a4 - 1;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "sceneIdentifier", (_QWORD)v21);
        if (-[CLSTaxonomyBasedModel taxonomyNodeRefForSceneIdentifier:](self, "taxonomyNodeRefForSceneIdentifier:", v15))
        {
          switch(v12)
          {
            case 0uLL:
              PFSceneTaxonomyNodeSearchThreshold();
              goto LABEL_15;
            case 1uLL:
              PFSceneTaxonomyNodeF0Point5Threshold();
              goto LABEL_15;
            case 2uLL:
              PFSceneTaxonomyNodeF2Threshold();
              goto LABEL_15;
            case 3uLL:
              PFSceneTaxonomyNodeF1Threshold();
              goto LABEL_15;
            case 4uLL:
              PFSceneTaxonomyNodeGraphHighPrecisionThreshold();
              goto LABEL_15;
            case 5uLL:
              PFSceneTaxonomyNodeGraphHighRecallThreshold();
LABEL_15:
              v17 = v16;
              break;
            default:
              v17 = 1.79769313e308;
              break;
          }
          objc_msgSend(v14, "confidence");
          if (v18 >= v17)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v15);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v19);

          }
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  return v7;
}

- (BOOL)nodeIsSupported:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CLSTaxonomyBasedModel.m"), 260, CFSTR("Subclasses need to implement this"));

  return 0;
}

- (BOOL)nodeRefIsSupported:(void *)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CLSTaxonomyBasedModel.m"), 265, CFSTR("Subclasses need to implement this"));

  return 0;
}

- (id)taxonomyNodeForSceneIdentifier:(unint64_t)a3
{
  void *v4;

  -[PFSceneTaxonomy nodeForExtendedSceneClassId:](self->_sceneTaxonomy, "nodeForExtendedSceneClassId:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && !-[CLSTaxonomyBasedModel nodeIsSupported:](self, "nodeIsSupported:", v4))
  {

    v4 = 0;
  }
  return v4;
}

- (id)taxonomyNodeForName:(id)a3
{
  void *v4;

  -[PFSceneTaxonomy nodeForName:](self->_sceneTaxonomy, "nodeForName:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && !-[CLSTaxonomyBasedModel nodeIsSupported:](self, "nodeIsSupported:", v4))
  {

    v4 = 0;
  }
  return v4;
}

- (void)taxonomyNodeRefForSceneIdentifier:(unint64_t)a3
{
  void *result;
  void *v5;

  result = (void *)-[PFSceneTaxonomy nodeRefForExtendedSceneClassId:](self->_sceneTaxonomy, "nodeRefForExtendedSceneClassId:", a3);
  if (result)
  {
    v5 = result;
    if (-[CLSTaxonomyBasedModel nodeRefIsSupported:](self, "nodeRefIsSupported:", result))
      return v5;
    else
      return 0;
  }
  return result;
}

- (void)taxonomyNodeRefForName:(id)a3
{
  void *result;
  void *v5;

  result = (void *)-[PFSceneTaxonomy nodeRefForName:](self->_sceneTaxonomy, "nodeRefForName:", a3);
  if (result)
  {
    v5 = result;
    if (-[CLSTaxonomyBasedModel nodeRefIsSupported:](self, "nodeRefIsSupported:", result))
      return v5;
    else
      return 0;
  }
  return result;
}

- (PFSceneTaxonomy)sceneTaxonomy
{
  return (PFSceneTaxonomy *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_sceneTaxonomy, 0);
  objc_storeStrong((id *)&self->_signalNodeBySignalIdentifier, 0);
  objc_storeStrong((id *)&self->_signalNodeBySignalName, 0);
}

uint64_t __76__CLSTaxonomyBasedModel_sceneIdentifiersForSceneNames_includingChildScenes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "nodeIsSupported:", v3))
  {
    v4 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v3, "extendedSceneClassId"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
  return 0;
}

@end
