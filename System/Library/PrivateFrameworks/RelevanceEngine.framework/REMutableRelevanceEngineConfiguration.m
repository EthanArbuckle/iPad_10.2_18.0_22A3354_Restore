@implementation REMutableRelevanceEngineConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  return -[RERelevanceEngineConfiguration initWithDictionary:]([RERelevanceEngineConfiguration alloc], "initWithDictionary:", self->super._values);
}

+ (id)defaultConfiguration
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___REMutableRelevanceEngineConfiguration;
  objc_msgSendSuper2(&v5, sel_defaultConfiguration);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  return v3;
}

- (void)setTrainingBehavior:(unint64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_trainingBehavior);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineConfiguration setValue:forKey:ofClass:](self, "setValue:forKey:ofClass:", v5, v4, objc_opt_class());

}

uint64_t __65__REMutableRelevanceEngineConfiguration__indexOfSectionWithName___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)insertSectionWithDescriptor:(id)a3 atIndex:(unint64_t)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int64_t v15;
  NSMutableDictionary *values;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;

  v26 = a3;
  objc_msgSend(v26, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    objc_msgSend(v26, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[REMutableRelevanceEngineConfiguration _indexOfSectionWithName:](self, "_indexOfSectionWithName:", v14);

    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      values = self->super._values;
      NSStringFromSelector(sel_sectionDescriptors);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](values, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "insertObject:atIndex:", v26, a4);
    }
    else
    {
      v19 = (void *)*MEMORY[0x24BDBCAB8];
      objc_msgSend(v26, "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      RERaiseInternalException(v19, CFSTR("Already contains section descriptor with name \"%@\"), v20, v21, v22, v23, v24, v25, (uint64_t)v18);
    }

  }
  else
  {
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("Section descriptor %@ must have name"), v8, v9, v10, v11, v12, v13, (uint64_t)v26);
  }

}

- (int64_t)_indexOfSectionWithName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int64_t v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[RERelevanceEngineConfiguration sectionDescriptors](self, "sectionDescriptors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __65__REMutableRelevanceEngineConfiguration__indexOfSectionWithName___block_invoke;
  v9[3] = &unk_24CF8D5A0;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", v9);

  return v7;
}

- (void)addSectionWithDescriptor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[RERelevanceEngineConfiguration sectionDescriptors](self, "sectionDescriptors");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[REMutableRelevanceEngineConfiguration insertSectionWithDescriptor:atIndex:](self, "insertSectionWithDescriptor:atIndex:", v4, objc_msgSend(v5, "count"));

}

- (void)removeAllInteractions
{
  REMutableRelevanceEngineConfiguration *i;
  void *v3;
  uint64_t v4;

  for (i = self; ; self = i)
  {
    -[RERelevanceEngineConfiguration interactionDescriptors](self, "interactionDescriptors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (!v4)
      break;
    -[REMutableRelevanceEngineConfiguration removeInteractionAtIndex:](i, "removeInteractionAtIndex:", 0);
  }
}

- (void)removeInteractionAtIndex:(unint64_t)a3
{
  NSMutableDictionary *values;
  void *v5;
  id v6;

  values = self->super._values;
  NSStringFromSelector(sel_interactionDescriptors);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](values, "objectForKeyedSubscript:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "removeObjectAtIndex:", a3);
}

- (void)removeAllSections
{
  REMutableRelevanceEngineConfiguration *i;
  void *v3;
  uint64_t v4;

  for (i = self; ; self = i)
  {
    -[RERelevanceEngineConfiguration sectionDescriptors](self, "sectionDescriptors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (!v4)
      break;
    -[REMutableRelevanceEngineConfiguration removeSectionAtIndex:](i, "removeSectionAtIndex:", 0);
  }
}

- (void)removeSectionAtIndex:(unint64_t)a3
{
  NSMutableDictionary *values;
  void *v5;
  id v6;

  values = self->super._values;
  NSStringFromSelector(sel_sectionDescriptors);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](values, "objectForKeyedSubscript:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "removeObjectAtIndex:", a3);
}

- (void)setObserverQueue:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  NSStringFromSelector(sel_observerQueue);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineConfiguration setValue:forKey:ofClass:](self, "setValue:forKey:ofClass:", v4, v5, 0);

}

- (void)setPrimaryFeatures:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  NSStringFromSelector(sel_primaryFeatures);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineConfiguration setValue:forKey:ofClass:](self, "setValue:forKey:ofClass:", v4, v5, objc_opt_class());

}

- (void)setWantsImmutableContent:(BOOL)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_wantsImmutableContent);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineConfiguration setValue:forKey:ofClass:](self, "setValue:forKey:ofClass:", v5, v4, objc_opt_class());

}

- (void)setMetricsRecorder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  NSStringFromSelector(sel_metricsRecorder);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineConfiguration setValue:forKey:ofClass:](self, "setValue:forKey:ofClass:", v4, v5, 0);

}

- (void)setBaseModelFileURL:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  NSStringFromSelector(sel_baseModelFileURL);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineConfiguration setValue:forKey:ofClass:](self, "setValue:forKey:ofClass:", v4, v5, objc_opt_class());

}

- (void)setModelVersion:(unint64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_modelVersion);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineConfiguration setValue:forKey:ofClass:](self, "setValue:forKey:ofClass:", v5, v4, objc_opt_class());

}

- (void)setRelevanceProviderManagerLoader:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  NSStringFromSelector(sel_relevanceProviderManagerLoader);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineConfiguration setValue:forKey:ofClass:](self, "setValue:forKey:ofClass:", v4, v5, objc_opt_class());

}

- (void)setModelFileURL:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  NSStringFromSelector(sel_modelFileURL);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineConfiguration setValue:forKey:ofClass:](self, "setValue:forKey:ofClass:", v4, v5, objc_opt_class());

}

- (void)setDataSourceLoader:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  NSStringFromSelector(sel_dataSourceLoader);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineConfiguration setValue:forKey:ofClass:](self, "setValue:forKey:ofClass:", v4, v5, objc_opt_class());

}

- (void)addInteractionWithDescriptor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[RERelevanceEngineConfiguration interactionDescriptors](self, "interactionDescriptors");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[REMutableRelevanceEngineConfiguration insertInteractionWithDescriptor:atIndex:](self, "insertInteractionWithDescriptor:atIndex:", v4, objc_msgSend(v5, "count"));

}

- (void)insertInteractionWithDescriptor:(id)a3 atIndex:(unint64_t)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int64_t v15;
  NSMutableDictionary *values;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;

  v26 = a3;
  objc_msgSend(v26, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    objc_msgSend(v26, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[REMutableRelevanceEngineConfiguration _indexOfInteractionWithName:](self, "_indexOfInteractionWithName:", v14);

    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      values = self->super._values;
      NSStringFromSelector(sel_interactionDescriptors);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](values, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "insertObject:atIndex:", v26, a4);
    }
    else
    {
      v19 = (void *)*MEMORY[0x24BDBCAB8];
      objc_msgSend(v26, "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      RERaiseInternalException(v19, CFSTR("Already contains interaction descriptor with name \"%@\"), v20, v21, v22, v23, v24, v25, (uint64_t)v18);
    }

  }
  else
  {
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("Interaction descriptor %@ must have name"), v8, v9, v10, v11, v12, v13, (uint64_t)v26);
  }

}

- (int64_t)_indexOfInteractionWithName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int64_t v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[RERelevanceEngineConfiguration interactionDescriptors](self, "interactionDescriptors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __69__REMutableRelevanceEngineConfiguration__indexOfInteractionWithName___block_invoke;
  v9[3] = &unk_24CF8D5C8;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", v9);

  return v7;
}

- (void)setEngineQueue:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  NSStringFromSelector(sel_engineQueue);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineConfiguration setValue:forKey:ofClass:](self, "setValue:forKey:ofClass:", v4, v5, 0);

}

- (void)setAllowsUpdatingModelFile:(BOOL)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_allowsUpdatingModelFile);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineConfiguration setValue:forKey:ofClass:](self, "setValue:forKey:ofClass:", v5, v4, objc_opt_class());

}

- (void)setModelStorageBehavior:(unint64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_modelStorageBehavior);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineConfiguration setValue:forKey:ofClass:](self, "setValue:forKey:ofClass:", v5, v4, objc_opt_class());

}

- (void)setLocationManager:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  NSStringFromSelector(sel_locationManager);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineConfiguration setValue:forKey:ofClass:](self, "setValue:forKey:ofClass:", v4, v5, objc_opt_class());

}

- (void)removeSectionWithName:(id)a3
{
  int64_t v4;

  v4 = -[REMutableRelevanceEngineConfiguration _indexOfSectionWithName:](self, "_indexOfSectionWithName:", a3);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    -[REMutableRelevanceEngineConfiguration removeSectionAtIndex:](self, "removeSectionAtIndex:", v4);
}

uint64_t __69__REMutableRelevanceEngineConfiguration__indexOfInteractionWithName___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)setPreferenceDomain:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  NSStringFromSelector(sel_preferenceDomain);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineConfiguration setValue:forKey:ofClass:](self, "setValue:forKey:ofClass:", v4, v5, objc_opt_class());

}

- (void)setAllowsRemoteTraining:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_allowsRemoteTraining);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineConfiguration setValue:forKey:ofClass:](self, "setValue:forKey:ofClass:", v5, v6, objc_opt_class());

  if (v3)
    v7 = +[RERemoteTrainingClientListener sharedTrainingClientListener](RERemoteTrainingClientListener, "sharedTrainingClientListener");
}

- (void)setWantsBackup:(BOOL)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_wantsBackup);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineConfiguration setValue:forKey:ofClass:](self, "setValue:forKey:ofClass:", v5, v4, objc_opt_class());

}

- (void)setIgnoreDeviceLockState:(BOOL)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_ignoreDeviceLockState);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineConfiguration setValue:forKey:ofClass:](self, "setValue:forKey:ofClass:", v5, v4, objc_opt_class());

}

- (void)setAllowsDiagnosticExtension:(BOOL)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_allowsDiagnosticExtension);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineConfiguration setValue:forKey:ofClass:](self, "setValue:forKey:ofClass:", v5, v4, objc_opt_class());

}

- (void)setIgnoresInstalledApplications:(BOOL)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_ignoresInstalledApplications);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineConfiguration setValue:forKey:ofClass:](self, "setValue:forKey:ofClass:", v5, v4, objc_opt_class());

}

- (void)setDisableAutomaticContentManagement:(BOOL)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_disableAutomaticContentManagement);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineConfiguration setValue:forKey:ofClass:](self, "setValue:forKey:ofClass:", v5, v4, objc_opt_class());

}

+ (id)defaultUpNextConfiguration
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___REMutableRelevanceEngineConfiguration;
  objc_msgSendSuper2(&v5, sel_defaultUpNextConfiguration);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  return v3;
}

+ (id)sampleUpNextConfiguration
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___REMutableRelevanceEngineConfiguration;
  objc_msgSendSuper2(&v5, sel_sampleUpNextConfiguration);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  return v3;
}

@end
