@implementation SDComplexContainer

+ (id)complexContainerWithTasks:(id)a3 withTimeout:(double)a4 withRules:(id)a5 atDestination:(id)a6 withDelegate:(id)a7
{
  return +[SDComplexContainer complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:isConcurrent:](SDComplexContainer, "complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:isConcurrent:", a3, a5, a6, a7, 0, a4);
}

+ (id)complexContainerWithTasks:(id)a3 withTimeout:(double)a4 withRules:(id)a5 atDestination:(id)a6 withDelegate:(id)a7 isConcurrent:(BOOL)a8
{
  _BOOL8 v8;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  const char *v21;
  SDComplexContainer *v22;
  id v23;
  void *v24;
  void *v25;
  const char *v26;
  void *v27;
  void *v28;
  _BOOL8 v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  SDComplexContainer *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id v46;
  void *v47;
  _QWORD v48[4];
  id v49;

  v8 = a8;
  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = sub_10002768C(v15, CFSTR("unnamed_tasks"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = sub_100029B00(v16, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  if (v20)
  {
    v22 = -[SDContainer initWithName:andDestination:withDelegate:]([SDComplexContainer alloc], "initWithName:andDestination:withDelegate:", v18, v15, v16);
    if (v22)
    {
      v46 = v13;
      v47 = v14;
      v23 = sub_100027714(v18, v21);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", v24, v15, v16));

      if (v25)
      {
        -[SDComplexContainer setCollectionContainer:](v22, "setCollectionContainer:", v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDComplexContainer collectionContainer](v22, "collectionContainer"));
        objc_msgSend(v27, "setResolveHomeDirs:", 0);

        v28 = (void *)objc_claimAutoreleasedReturnValue(-[SDComplexContainer collectionContainer](v22, "collectionContainer"));
        v29 = v8;
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:](SDUnitLogDirectory, "logRuleWithDirectory:", v20));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "arrayByAddingObject:", v30));
        objc_msgSend(v28, "addRules:", v31);

        v8 = v29;
      }
      v32 = sub_100027708(v18, v26);
      v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_100029DDC;
      v48[3] = &unk_100098F88;
      v49 = v25;
      v34 = v25;
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:withCompletionBlock:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:withCompletionBlock:", v33, v15, v8, v16, v48, a4));

      v13 = v46;
      if (v35)
      {
        objc_msgSend(v35, "addSDTasksToContainer:withTmpOutputDir:", v46, v20);
        -[SDComplexContainer setTaskContainer:](v22, "setTaskContainer:", v35);
      }
      v22 = v22;

      v36 = v22;
      v14 = v47;
    }
    else
    {
      v36 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10005FC28((uint64_t)v18, v37, v38, v39, v40, v41, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v44, "stderrWrite:", CFSTR("Tasks container %@ has invalid temporary directory"), v18);

    v22 = (SDComplexContainer *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    -[SDComplexContainer log:](v22, "log:", CFSTR("Tasks container %@ has invalid temporary directory"), v18);
    v36 = 0;
  }

  return v36;
}

+ (id)complexContainerWithSPITask:(int)a3 withTimeout:(double)a4 atDestination:(id)a5 withDelegate:(id)a6 withIntermediateDirectory:(id)a7
{
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  __CFString *v14;
  void *v15;
  id v16;
  void *v17;
  const char *v18;
  SDComplexContainer *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  SDComplexContainer *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  _QWORD v39[4];
  id v40;
  void *v41;

  v10 = *(_QWORD *)&a3;
  v11 = a5;
  v12 = a6;
  v13 = a7;
  if (v13)
  {
    v14 = sub_1000453A4(v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = sub_10002768C(v11, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

    v19 = -[SDContainer initWithName:andDestination:withDelegate:]([SDComplexContainer alloc], "initWithName:andDestination:withDelegate:", v17, v11, v12);
    if (v19)
    {
      v20 = sub_100027714(v17, v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogAgentCollectionContainer, "containerWithName:destination:withDelegate:", v21, v11, v12));

      if (v22)
      {
        -[SDComplexContainer setCollectionContainer:](v19, "setCollectionContainer:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDComplexContainer collectionContainer](v19, "collectionContainer"));
        objc_msgSend(v23, "setResolveHomeDirs:", 0);

        objc_msgSend(v22, "setFlattenReturnedDirectoryPaths:", 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[SDComplexContainer collectionContainer](v19, "collectionContainer"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:](SDUnitLogDirectory, "logRuleWithDirectory:", v13));
        v41 = v25;
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v41, 1));
        objc_msgSend(v24, "addRules:", v26);

      }
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_10002A0BC;
      v39[3] = &unk_100099990;
      v40 = v22;
      v27 = v22;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogAgentContainer containerAtLocation:forTaskType:withTimeout:withDelegate:withMsgContents:withReplyBlock:](SDLogAgentContainer, "containerAtLocation:forTaskType:withTimeout:withDelegate:withMsgContents:withReplyBlock:", v13, v10, v12, 0, v39, a4));
      if (v28)
        -[SDComplexContainer setTaskContainer:](v19, "setTaskContainer:", v28);
      v29 = v19;

    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10005FDA8((uint64_t)v11, v30, v31, v32, v33, v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v37, "stderrWrite:", CFSTR("Task %@ has invalid temporary directory"), v11);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v17, "log:", CFSTR("Task %@ has invalid temporary directory"), v11);
    v19 = 0;
  }

  return v19;
}

+ (id)complexContainerWithSPITask:(int)a3 withTimeout:(double)a4 atDestination:(id)a5 withDelegate:(id)a6
{
  uint64_t v8;
  id v9;
  id v10;
  __CFString *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;

  v8 = *(_QWORD *)&a3;
  v9 = a6;
  v10 = a5;
  v11 = sub_1000453A4(v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = sub_10002768C(v10, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  v15 = sub_100029B00(v9, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:withIntermediateDirectory:](SDComplexContainer, "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:withIntermediateDirectory:", v8, v10, v9, v16, a4));

  return v17;
}

+ (id)complexContainerWithBlock:(id)a3 withTimeout:(double)a4 atDestination:(id)a5 withDelegate:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  const char *v14;
  SDComplexContainer *v15;
  id v16;
  void *v17;
  void *v18;
  const char *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  SDComplexContainer *v25;
  _QWORD v27[4];
  id v28;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = sub_10002768C(v10, CFSTR("unnamed_block"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v15 = -[SDContainer initWithName:andDestination:withDelegate:]([SDComplexContainer alloc], "initWithName:andDestination:withDelegate:", v13, v10, v11);
  if (v15)
  {
    v16 = sub_100027714(v13, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", v17, v10, v11));

    if (v18)
    {
      -[SDComplexContainer setCollectionContainer:](v15, "setCollectionContainer:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDComplexContainer collectionContainer](v15, "collectionContainer"));
      objc_msgSend(v20, "setResolveHomeDirs:", 0);

    }
    v21 = sub_100027708(v13, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10002A374;
    v27[3] = &unk_1000999B8;
    v28 = v18;
    v23 = v18;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[SDBlockContainer containerWithName:forBlock:withTimeout:withDelegate:withCompletionBlock:](SDBlockContainer, "containerWithName:forBlock:withTimeout:withDelegate:withCompletionBlock:", v22, v9, v11, v27, a4));

    if (v24)
      -[SDComplexContainer setTaskContainer:](v15, "setTaskContainer:", v24);
    v25 = v15;

  }
  return v15;
}

- (void)setName:(id)a3
{
  const char *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_storeStrong((id *)&self->_name, a3);
  if (self->_taskContainer)
  {
    v6 = sub_100027708(v10, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[SDContainer setName:](self->_taskContainer, "setName:", v7);

  }
  if (self->_collectionContainer)
  {
    v8 = sub_100027714(v10, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[SDContainer setName:](self->_collectionContainer, "setName:", v9);

  }
}

- (BOOL)_executeFromCallback:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  -[SDContainer updateContainerWithOverride](self, "updateContainerWithOverride");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDComplexContainer collectionContainer](self, "collectionContainer"));

  if (v5)
  {
    v6 = -[SDContainer runtimeChecks](self, "runtimeChecks");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDComplexContainer collectionContainer](self, "collectionContainer"));
    objc_msgSend(v7, "setRuntimeChecks:", v6);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDComplexContainer taskContainer](self, "taskContainer"));

  if (v8)
  {
    v9 = -[SDContainer runtimeChecks](self, "runtimeChecks");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDComplexContainer taskContainer](self, "taskContainer"));
    objc_msgSend(v10, "setRuntimeChecks:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDComplexContainer taskContainer](self, "taskContainer"));
    v12 = v11;
    if (v3)
      objc_msgSend(v11, "executeFromCallback");
    else
      objc_msgSend(v11, "execute");

  }
  return 1;
}

- (BOOL)executeFromCallback
{
  return -[SDComplexContainer _executeFromCallback:](self, "_executeFromCallback:", 1);
}

- (BOOL)execute
{
  return -[SDComplexContainer _executeFromCallback:](self, "_executeFromCallback:", 0);
}

- (void)applyContainerOverride:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("timeout")));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDComplexContainer taskContainer](self, "taskContainer"));

    if (v5)
    {
      objc_msgSend(v4, "doubleValue");
      v7 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDComplexContainer taskContainer](self, "taskContainer"));
      objc_msgSend(v8, "setTimeout:", v7);

    }
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("maxSizeMB")));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDComplexContainer collectionContainer](self, "collectionContainer"));

    if (v10)
    {
      v11 = objc_msgSend(v9, "unsignedIntegerValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDComplexContainer collectionContainer](self, "collectionContainer"));
      objc_msgSend(v12, "setMaximumSizeMB:", v11);

    }
  }

}

- (id)name
{
  return self->_name;
}

- (SDTaskContainer)taskContainer
{
  return self->_taskContainer;
}

- (void)setTaskContainer:(id)a3
{
  objc_storeStrong((id *)&self->_taskContainer, a3);
}

- (SDLogCollectionContainer)collectionContainer
{
  return self->_collectionContainer;
}

- (void)setCollectionContainer:(id)a3
{
  objc_storeStrong((id *)&self->_collectionContainer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionContainer, 0);
  objc_storeStrong((id *)&self->_taskContainer, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
