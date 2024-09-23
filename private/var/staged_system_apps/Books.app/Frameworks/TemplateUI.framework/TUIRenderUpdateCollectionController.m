@implementation TUIRenderUpdateCollectionController

- (TUIRenderUpdateCollectionController)initWithLayoutQueue:(id)a3 renderModel:(id)a4
{
  id v7;
  id v8;
  TUIRenderUpdateCollectionController *v9;
  TUIRenderUpdateCollectionController *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *accessQueue;
  NSMutableDictionary *v13;
  NSMutableDictionary *sectionTrackers;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)TUIRenderUpdateCollectionController;
  v9 = -[TUIRenderUpdateCollectionController init](&v16, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_layoutQueue, a3);
    objc_storeStrong((id *)&v10->_currentModel, a4);
    v11 = dispatch_queue_create("TUIRenderUpdateCollectionController.accessQueue", 0);
    accessQueue = v10->_accessQueue;
    v10->_accessQueue = (OS_dispatch_queue *)v11;

    v13 = objc_opt_new(NSMutableDictionary);
    sectionTrackers = v10->_sectionTrackers;
    v10->_sectionTrackers = v13;

    v10->_isInitial = 1;
  }

  return v10;
}

- (id)registerDelegate:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_92C58;
  v16 = sub_92C68;
  v17 = 0;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_92C70;
  block[3] = &unk_23D7A8;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(accessQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)renderModel
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_92C58;
  v10 = sub_92C68;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_93004;
  v5[3] = &unk_23EAF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)renderModelAndHostingMap
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_92C58;
  v10 = sub_92C68;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_930CC;
  v5[3] = &unk_23EAF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)applyInitialUpdate
{
  void (**initialUpdateBlock)(id, SEL);
  id v4;

  initialUpdateBlock = (void (**)(id, SEL))self->_initialUpdateBlock;
  if (initialUpdateBlock)
  {
    initialUpdateBlock[2](initialUpdateBlock, a2);
    v4 = self->_initialUpdateBlock;
    self->_initialUpdateBlock = 0;

  }
}

- (void)unregisterDelegate:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[4];
  id v8;
  TUIRenderUpdateCollectionController *v9;

  v4 = a3;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_931D0;
  block[3] = &unk_23D7D0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(accessQueue, block);

}

- (void)updateWithHostingMap:(id)a3 transactionGroup:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_932E4;
    v8[3] = &unk_23E2C8;
    v8[4] = self;
    v9 = v6;
    v10 = v7;
    objc_msgSend(v10, "computeUpdatesWithBlock:", v8);

  }
  else
  {
    -[TUIRenderUpdateCollectionController _updateWithHostingMap:transactionGroup:](self, "_updateWithHostingMap:transactionGroup:", v6, 0);
  }

}

- (void)_updateWithHostingMap:(id)a3 transactionGroup:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  _QWORD v10[4];
  id v11;
  TUIRenderUpdateCollectionController *v12;
  uint64_t *v13;
  _QWORD block[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_92C58;
  v21 = sub_92C68;
  v22 = 0;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_93454;
  block[3] = &unk_23E848;
  v16 = &v17;
  block[4] = self;
  v9 = v6;
  v15 = v9;
  dispatch_sync(accessQueue, block);
  if ((objc_opt_respondsToSelector(v18[5], "updateHostingMap:controller:") & 1) != 0)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_934CC;
    v10[3] = &unk_240370;
    v13 = &v17;
    v11 = v9;
    v12 = self;
    objc_msgSend(v7, "appendUpdateBlock:", v10);

  }
  _Block_object_dispose(&v17, 8);

}

- (void)updateWithRenderModel:(id)a3 viewState:(id)a4 flags:(unint64_t)a5 transactionGroup:(id)a6
{
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  unint64_t v17;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (v12)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_935D4;
    v13[3] = &unk_240398;
    v13[4] = self;
    v14 = v10;
    v15 = v11;
    v17 = a5;
    v16 = v12;
    objc_msgSend(v16, "computeUpdatesWithBlock:", v13);

  }
  else
  {
    -[TUIRenderUpdateCollectionController _updateWithRenderModel:viewState:flags:transactionGroup:](self, "_updateWithRenderModel:viewState:flags:transactionGroup:", v10, v11, a5, 0);
  }

}

- (void)_updateWithRenderModel:(id)a3 viewState:(id)a4 flags:(unint64_t)a5 transactionGroup:(id)a6
{
  TUIRenderModelCollection *model;
  void *v10;
  id v11;
  void *i;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSMutableDictionary *sectionTrackers;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  void *v27;
  NSMutableDictionary *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  TUIRenderModelCollection *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  TUIRenderModelCollection *v53;
  TUIRenderUpdateCollection *v54;
  NSObject *accessQueue;
  id v56;
  TUIRenderModelCollection *v57;
  TUIRenderUpdateCollection *v58;
  NSMutableArray *v59;
  void *v60;
  __int128 v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  uint64_t v66;
  void *j;
  id v68;
  id v71;
  id *location;
  id v73;
  TUIRenderModelCollection *v74;
  id v75;
  NSMutableArray *v76;
  id v77;
  id obj;
  NSMutableDictionary *v79;
  uint64_t v80;
  void *v81;
  TUIRenderUpdateChanges *v82;
  TUIRenderUpdateCollectionController *v83;
  _QWORD v84[4];
  TUIRenderUpdateCollection *v85;
  TUIRenderUpdateCollectionController *v86;
  NSMutableArray *v87;
  id v88;
  uint64_t *v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _OWORD v94[3];
  _QWORD block[5];
  id v96;
  TUIRenderModelCollection *v97;
  TUIRenderUpdateCollection *v98;
  NSMutableArray *v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t (*v104)(uint64_t, uint64_t);
  void (*v105)(uint64_t);
  id v106;
  id v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  _BYTE v112[128];
  _BYTE v113[128];

  v75 = a3;
  v73 = a4;
  v71 = a6;
  v83 = self;
  model = self->_model;
  location = (id *)&self->_model;
  if (model)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelCollection sections](model, "sections"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForKey:", CFSTR("UUID")));

  }
  else
  {
    v81 = &__NSArray0__struct;
  }
  v76 = objc_opt_new(NSMutableArray);
  v74 = self->_currentModel;
  v82 = objc_alloc_init(TUIRenderUpdateChanges);
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "sections"));
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v113, 16);
  if (!v11)
  {
    v79 = 0;
    v77 = 0;
    goto LABEL_26;
  }
  v77 = 0;
  v79 = 0;
  v80 = *(_QWORD *)v109;
  do
  {
    for (i = 0; i != v11; i = (char *)i + 1)
    {
      if (*(_QWORD *)v109 != v80)
        objc_enumerationMutation(obj);
      v13 = *(id *)(*((_QWORD *)&v108 + 1) + 8 * (_QWORD)i);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUID"));
      v15 = objc_msgSend(v81, "indexOfObject:", v14);

      if (v15 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v16 = 0;
LABEL_21:
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifierToContainedSubmodelMap"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "allKeys"));
        -[TUIRenderUpdateChanges unionInserts:](v82, "unionInserts:", v22);
        goto LABEL_22;
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelCollection sections](v83->_model, "sections"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", v15));

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelCollection sections](v83->_currentModel, "sections"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", v15));

      if (!v18)
        goto LABEL_21;
      sectionTrackers = v83->_sectionTrackers;
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUID"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](sectionTrackers, "objectForKeyedSubscript:", v21));

      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "computeContainerUpdateCurrent:from:tracker:flags:", v16, v18, v22, 0));
      if (!v79)
        v79 = objc_opt_new(NSMutableDictionary);
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUID"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v79, "setObject:forKeyedSubscript:", v23, v24);

      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "tracker"));
      v26 = v25 == v22;

      if (!v26)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "tracker"));
        v28 = v83->_sectionTrackers;
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUID"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v27, v29);

      }
      v107 = 0;
      v30 = objc_msgSend(v23, "newToContainerPlusDeletedWithInterests:changes:", v76, &v107);
      v31 = v107;
      if (v30 != v13)
      {
        if (!v77)
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "sections"));
          v77 = objc_msgSend(v32, "mutableCopy");

        }
        objc_msgSend(v77, "replaceObjectAtIndex:withObject:", objc_msgSend(v13, "section"), v30);
      }
      -[TUIRenderUpdateChanges unionChanges:](v82, "unionChanges:", v31);

LABEL_22:
    }
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v113, 16);
  }
  while (v11);
LABEL_26:

  objc_storeStrong(location, a3);
  if (v77)
  {
    v33 = [TUIRenderModelCollection alloc];
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "content"));
    objc_msgSend(v75, "size");
    v36 = v35;
    v38 = v37;
    objc_msgSend(v75, "insets");
    v40 = v39;
    v42 = v41;
    v44 = v43;
    v46 = v45;
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "visibleBoundsObservers"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "info"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "anchorSet"));
    v50 = objc_msgSend(*location, "layoutDirection");
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "matchingSectionUUID"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "matchingSectionUID"));
    v53 = -[TUIRenderModelCollection initWithContent:sections:size:insets:visibleBoundsObservers:info:anchorSet:layoutDirection:matchingUUID:matchingUID:](v33, "initWithContent:sections:size:insets:visibleBoundsObservers:info:anchorSet:layoutDirection:matchingUUID:matchingUID:", v34, v77, v47, v48, v49, v50, v36, v38, v40, v42, v44, v46, v51, v52);

  }
  else
  {
    v53 = (TUIRenderModelCollection *)v75;
  }
  v54 = -[TUIRenderUpdateCollection initWithFrom:to:viewState:updates:changes:layoutQueue:flags:]([TUIRenderUpdateCollection alloc], "initWithFrom:to:viewState:updates:changes:layoutQueue:flags:", v74, v53, v73, v79, v82, v83->_layoutQueue, a5);
  v101 = 0;
  v102 = &v101;
  v103 = 0x3032000000;
  v104 = sub_92C58;
  v105 = sub_92C68;
  v106 = 0;
  accessQueue = v83->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_93DF8;
  block[3] = &unk_2403C0;
  v100 = &v101;
  block[4] = v83;
  v56 = v75;
  v96 = v56;
  v57 = v53;
  v97 = v57;
  v58 = v54;
  v98 = v58;
  v59 = v76;
  v99 = v59;
  dispatch_sync(accessQueue, block);
  if (v102[5])
  {
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[TUIResourceCollector createImageResourceCollectorForLoaded](TUIResourceCollector, "createImageResourceCollectorForLoaded"));
    v61 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v94[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v94[1] = v61;
    v94[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    -[TUIRenderModelCollection appendResourcesToCollector:transform:](v57, "appendResourcesToCollector:transform:", v60, v94);
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "imageResources"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "setRepresentation"));

    v92 = 0u;
    v93 = 0u;
    v90 = 0u;
    v91 = 0u;
    v64 = v63;
    v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v90, v112, 16);
    if (v65)
    {
      v66 = *(_QWORD *)v91;
      do
      {
        for (j = 0; j != v65; j = (char *)j + 1)
        {
          if (*(_QWORD *)v91 != v66)
            objc_enumerationMutation(v64);
          objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * (_QWORD)j), "pauseUnload");
        }
        v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v90, v112, 16);
      }
      while (v65);
    }

    v84[0] = _NSConcreteStackBlock;
    v84[1] = 3221225472;
    v84[2] = sub_93EC4;
    v84[3] = &unk_2403E8;
    v89 = &v101;
    v85 = v58;
    v86 = v83;
    v87 = v59;
    v68 = v64;
    v88 = v68;
    objc_msgSend(v71, "appendUpdateBlock:", v84);

  }
  _Block_object_dispose(&v101, 8);

}

- (OS_dispatch_queue)layoutQueue
{
  return self->_layoutQueue;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (TUIRenderUpdateCollectionControllerDelegate)delegate
{
  return (TUIRenderUpdateCollectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (TUIRenderModelCollection)currentModel
{
  return self->_currentModel;
}

- (TUIRenderModelCollection)model
{
  return self->_model;
}

- (TUIHostingMap)currentHostingMap
{
  return self->_currentHostingMap;
}

- (NSMutableDictionary)sectionTrackers
{
  return self->_sectionTrackers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionTrackers, 0);
  objc_storeStrong((id *)&self->_currentHostingMap, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_currentModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_layoutQueue, 0);
  objc_storeStrong((id *)&self->_initialHostingMap, 0);
  objc_storeStrong(&self->_initialUpdateBlock, 0);
  objc_storeStrong((id *)&self->_initialUpdate, 0);
  objc_storeStrong((id *)&self->_initialInterests, 0);
}

@end
