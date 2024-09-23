@implementation PMLTrainingMock

- (PMLTrainingMock)init
{
  PMLTrainingMock *v2;
  uint64_t v3;
  NSMutableArray *internalCollectedSessions;
  uint64_t v5;
  NSMutableDictionary *lastTrainingFeaturizations;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PMLTrainingMock;
  v2 = -[PMLTrainingMock init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    internalCollectedSessions = v2->_internalCollectedSessions;
    v2->_internalCollectedSessions = (NSMutableArray *)v3;

    objc_storeStrong((id *)&v2->_collectedSessions, v2->_internalCollectedSessions);
    v5 = objc_opt_new();
    lastTrainingFeaturizations = v2->_lastTrainingFeaturizations;
    v2->_lastTrainingFeaturizations = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (void)addSessionWithCovariates:(id)a3 label:(int64_t)a4 sessionDescriptor:(id)a5 spotlightReference:(id)a6 isInternal:(BOOL)a7
{
  _BOOL8 v7;
  NSMutableArray *internalCollectedSessions;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[6];

  v7 = a7;
  v20[5] = *MEMORY[0x24BDAC8D0];
  internalCollectedSessions = self->_internalCollectedSessions;
  v20[0] = a3;
  v19[0] = CFSTR("covariates");
  v19[1] = CFSTR("label");
  v12 = (void *)MEMORY[0x24BDD16E0];
  v13 = a6;
  v14 = a5;
  v15 = a3;
  objc_msgSend(v12, "numberWithInteger:", a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v16;
  v20[2] = v14;
  v19[2] = CFSTR("model");
  v19[3] = CFSTR("spotlightReference");
  v20[3] = v13;
  v19[4] = CFSTR("isInternal");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](internalCollectedSessions, "addObject:", v18);

}

- (id)planReceivedWithPayload:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)planReceivedWithRecipe:(id)a3 attachments:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)lastTrainingFeaturizationForModelName:(id)a3 andLocale:(id)a4
{
  NSMutableDictionary *lastTrainingFeaturizations;
  void *v5;
  void *v6;

  lastTrainingFeaturizations = self->_lastTrainingFeaturizations;
  objc_msgSend(MEMORY[0x24BE7A648], "tupleWithFirst:second:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](lastTrainingFeaturizations, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)updateLastTrainingFeaturizationForModel:(id)a3 andData:(id)a4
{
  NSMutableDictionary *lastTrainingFeaturizations;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  lastTrainingFeaturizations = self->_lastTrainingFeaturizations;
  v6 = (void *)MEMORY[0x24BE7A648];
  v7 = a3;
  objc_msgSend(v6, "tupleWithFirst:second:", v7, a4);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BE7A648];
  objc_msgSend(v7, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "locale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "tupleWithFirst:second:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](lastTrainingFeaturizations, "setObject:forKey:", v12, v11);

}

- (void)clearCollectedSessions
{
  -[NSMutableArray removeAllObjects](self->_internalCollectedSessions, "removeAllObjects");
}

- (NSArray)collectedSessions
{
  return self->_collectedSessions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectedSessions, 0);
  objc_storeStrong((id *)&self->_lastTrainingFeaturizations, 0);
  objc_storeStrong((id *)&self->_internalCollectedSessions, 0);
}

@end
