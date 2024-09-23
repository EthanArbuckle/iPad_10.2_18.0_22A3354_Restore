@implementation _TUIFeedLayoutSection

- (_TUIFeedLayoutSection)initWithFeedId:(id)a3 section:(unint64_t)a4 controller:(id)a5 entry:(id)a6
{
  id v10;
  id v11;
  _TUIFeedLayoutSection *v12;
  _TUIFeedLayoutSection *v13;
  uint64_t v14;
  TUIWorkQueueContext *queueContext;
  objc_super v17;

  v10 = a5;
  v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)_TUIFeedLayoutSection;
  v12 = -[_TUIFeedLayoutSection init](&v17, "init");
  v13 = v12;
  if (v12)
  {
    v12->_feedId.uniqueIdentifier = a3.var0;
    v12->_section = a4;
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "queueContext"));
    queueContext = v13->_queueContext;
    v13->_queueContext = (TUIWorkQueueContext *)v14;

    objc_storeStrong((id *)&v13->_entry, a6);
    objc_storeWeak((id *)&v13->_feedLayoutController, v10);
    -[_TUIFeedLayoutSection _setupController](v13, "_setupController");
  }

  return v13;
}

- (void)_setupController
{
  TUIFeedLayoutController **p_feedLayoutController;
  void *v4;
  void *v5;
  void *v6;
  TUIFeedEntry *entry;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  TUILayoutController *v13;
  TUILayoutController *layoutController;
  void *v15;
  void *v16;
  TUIStatsEventCollector *eventCollector;
  void *v18;
  TUIInstantiateContextState *v19;
  TUIInstantiateContextState *instantiateState;
  void *v21;
  TUILayoutController *v22;
  id WeakRetained;

  p_feedLayoutController = &self->_feedLayoutController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_feedLayoutController);
  if (self->_template)
  {
    v22 = [TUILayoutController alloc];
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUITemplate package](self->_template, "package"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "manager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "transactionCoordinator"));
    instantiateState = self->_instantiateState;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedEntry identifierMap](self->_entry, "identifierMap"));
    entry = self->_entry;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "environment"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "actionHandlerDelegate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "queueContext"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "workQueue"));
    v12 = objc_loadWeakRetained((id *)p_feedLayoutController);
    v13 = -[TUILayoutController initWithPackage:feedId:manager:transactionCoordinator:state:identifierMap:entry:environment:instantiateDelegate:actionDelegate:queue:renderMode:](v22, "initWithPackage:feedId:manager:transactionCoordinator:state:identifierMap:entry:environment:instantiateDelegate:actionDelegate:queue:renderMode:", v4, self->_feedId.uniqueIdentifier, v21, v5, instantiateState, v6, entry, v8, WeakRetained, v9, v11, objc_msgSend(v12, "renderModelMode"));
    layoutController = self->_layoutController;
    self->_layoutController = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedEntry uid](self->_entry, "uid"));
    -[TUILayoutController setUid:](self->_layoutController, "setUid:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedEntry uuid](self->_entry, "uuid"));
    -[TUILayoutController setUUID:](self->_layoutController, "setUUID:", v16);

    -[TUILayoutController setStatsCollector:](self->_layoutController, "setStatsCollector:", self->_eventCollector);
    eventCollector = self->_eventCollector;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayoutController instantiateContext](self->_layoutController, "instantiateContext"));
    objc_msgSend(v18, "setStatsCollector:", eventCollector);

  }
  v19 = self->_instantiateState;
  self->_instantiateState = 0;

}

- (void)_teardownController
{
  void *v3;
  TUIInstantiateContextState *v4;
  TUIInstantiateContextState *instantiateState;
  TUILayoutController *layoutController;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayoutController instantiateContext](self->_layoutController, "instantiateContext"));
  v4 = (TUIInstantiateContextState *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "saveState"));
  instantiateState = self->_instantiateState;
  self->_instantiateState = v4;

  layoutController = self->_layoutController;
  self->_layoutController = 0;

}

- (void)suspendAndTeardownWithTransactionGroup:(id)a3
{
  TUIRenderModelSection *renderModel;
  TUIRenderModelAuxiliary *auxRenderModel;
  TUIRenderModelLayer *layerRenderModel;

  -[_TUIFeedLayoutSection _teardownController](self, "_teardownController", a3);
  renderModel = self->_renderModel;
  self->_renderModel = 0;

  auxRenderModel = self->_auxRenderModel;
  self->_auxRenderModel = 0;

  layerRenderModel = self->_layerRenderModel;
  self->_layerRenderModel = 0;

}

- (void)resumeAndRebuildWithTransactionGroup:(id)a3
{
  -[_TUIFeedLayoutSection _setupController](self, "_setupController", a3);
  self->_needsInstantiation = 1;
}

- (void)setStatsMode:(unint64_t)a3
{
  TUIStatsEventCollector *eventCollector;
  TUIStatsTimingCollector *timingCollector;
  unint64_t statsMode;
  TUIStatsEventCollector *v7;
  TUIStatsEventCollector *v8;
  TUIStatsTimingCollector *v9;
  TUIStatsTimingCollector *v10;
  TUIStatsEventCollector *v11;
  id v12;

  if (self->_statsMode != a3)
  {
    self->_statsMode = a3;
    eventCollector = self->_eventCollector;
    self->_eventCollector = 0;

    timingCollector = self->_timingCollector;
    self->_timingCollector = 0;

    statsMode = self->_statsMode;
    if ((statsMode & 8) != 0)
    {
      v7 = objc_alloc_init(TUIStatsEventCollector);
      v8 = self->_eventCollector;
      self->_eventCollector = v7;

      statsMode = self->_statsMode;
    }
    if ((statsMode & 4) != 0)
    {
      v9 = -[TUIStatsTimingCollector initWithMode:]([TUIStatsTimingCollector alloc], "initWithMode:", self->_statsMode);
      v10 = self->_timingCollector;
      self->_timingCollector = v9;

    }
    -[TUILayoutController setStatsCollector:](self->_layoutController, "setStatsCollector:", self->_eventCollector);
    v11 = self->_eventCollector;
    v12 = (id)objc_claimAutoreleasedReturnValue(-[TUILayoutController instantiateContext](self->_layoutController, "instantiateContext"));
    objc_msgSend(v12, "setStatsCollector:", v11);

  }
}

- (void)lq_loadOrUpdateEntry:(id)a3 data:(id)a4 controller:(id)a5 transactionGroup:(id)a6
{
  TUIFeedEntry *v8;
  TUIBindings *v9;
  TUIBindings *bindings;
  TUIFeedEntry *entry;
  id v12;

  v8 = (TUIFeedEntry *)a3;
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "dictionary"));
  if (v12)
  {
    v9 = -[TUIBindings initWithData:]([TUIBindings alloc], "initWithData:", v12);
    bindings = self->_bindings;
    self->_bindings = v9;
  }
  else
  {
    bindings = self->_bindings;
    self->_bindings = 0;
  }

  self->_needsInstantiation = 1;
  entry = self->_entry;
  self->_entry = v8;

}

- (void)lq_captureWithController:(id)a3
{
  self->_needsInstantiation = 1;
  objc_storeStrong((id *)&self->_captureController, a3);
}

- (void)lq_instantiateWithController:(id)a3 transactionGroup:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  TUITemplate *v14;
  TUITemplate *v15;
  void *v16;
  void *v17;
  TUILayoutController *layoutController;
  void *v19;
  unint64_t updated;
  id v21;
  NSObject *v22;
  _BOOL4 v23;
  unint64_t uniqueIdentifier;
  unint64_t v25;
  unint64_t section;
  TUIFeedEntry *entry;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  unint64_t v31;
  unint64_t v32;
  TUIFeedEntry *v33;
  id v34;
  NSObject *v35;
  TUIFeedCaptureController *captureController;
  void *v37;
  void *v38;
  id WeakRetained;
  unsigned __int8 v40;
  void *v41;
  TUIFeedCaptureController *v42;
  _BYTE v43[40];

  v6 = a3;
  v7 = a4;
  self->_needsInstantiation = 0;
  if (self->_updated)
    v8 = 4;
  else
    v8 = 8;
  -[TUIStatsTimingCollector recordReason:](self->_timingCollector, "recordReason:", v8);
  -[TUIStatsTimingCollector startPhase:](self->_timingCollector, "startPhase:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUITemplate url](self->_template, "url"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedEntry templateURL](self->_entry, "templateURL"));
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if ((v11 & 1) == 0)
  {
    -[TUIStatsTimingCollector startPhase:](self->_timingCollector, "startPhase:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "templateFactory"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedEntry templateURL](self->_entry, "templateURL"));
    v14 = (TUITemplate *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "templateFromURL:", v13));
    v15 = self->_template;
    self->_template = v14;

    -[TUIStatsTimingCollector endPhase:](self->_timingCollector, "endPhase:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayoutController package](self->_layoutController, "package"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TUITemplate package](self->_template, "package"));

    if (v16 != v17)
      -[_TUIFeedLayoutSection _setupController](self, "_setupController");
  }
  layoutController = self->_layoutController;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "environment"));
  -[TUILayoutController updateEnvironment:](layoutController, "updateEnvironment:", v19);

  updated = self->_updated;
  v21 = TUILayoutLog();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  v23 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
  if (updated)
  {
    if (!v23)
      goto LABEL_13;
    uniqueIdentifier = self->_feedId.uniqueIdentifier;
    v25 = self->_updated;
    section = self->_section;
    entry = self->_entry;
    *(_DWORD *)v43 = 134218754;
    *(_QWORD *)&v43[4] = uniqueIdentifier;
    *(_WORD *)&v43[12] = 2048;
    *(_QWORD *)&v43[14] = v25;
    *(_WORD *)&v43[22] = 1024;
    *(_DWORD *)&v43[24] = section;
    *(_WORD *)&v43[28] = 2112;
    *(_QWORD *)&v43[30] = entry;
    v28 = "[fid:%lu] feed data update #%lu at section %d: %@";
    v29 = v22;
    v30 = 38;
  }
  else
  {
    if (!v23)
      goto LABEL_13;
    v31 = self->_feedId.uniqueIdentifier;
    v32 = self->_section;
    v33 = self->_entry;
    *(_DWORD *)v43 = 134218498;
    *(_QWORD *)&v43[4] = v31;
    *(_WORD *)&v43[12] = 1024;
    *(_DWORD *)&v43[14] = v32;
    *(_WORD *)&v43[18] = 2112;
    *(_QWORD *)&v43[20] = v33;
    v28 = "[fid:%lu] feed data loaded at section %d: %@";
    v29 = v22;
    v30 = 28;
  }
  _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, v28, v43, v30);
LABEL_13:

  ++self->_updated;
  if (!self->_template)
  {
    v34 = TUILayoutLog();
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      sub_17E598((uint64_t)self, (id *)&self->_entry, v35);

  }
  captureController = self->_captureController;
  if (captureController)
  {
    -[TUIFeedCaptureController captureSectionWithEntry:bindings:template:](captureController, "captureSectionWithEntry:bindings:template:", self->_entry, self->_bindings, self->_template);
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedCaptureController instantiateCaptureForEntry:](self->_captureController, "instantiateCaptureForEntry:", self->_entry));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayoutController instantiateContext](self->_layoutController, "instantiateContext"));
    objc_msgSend(v38, "setCapture:", v37);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_feedLayoutController);
  v40 = objc_msgSend(WeakRetained, "suspended");

  if ((v40 & 1) == 0)
    -[_TUIFeedLayoutSection _instantiateTemplateWithTransactionGroup:](self, "_instantiateTemplateWithTransactionGroup:", v7);
  if (self->_captureController)
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayoutController instantiateContext](self->_layoutController, "instantiateContext"));
    objc_msgSend(v41, "setCapture:", 0);

    v42 = self->_captureController;
    self->_captureController = 0;

  }
  -[TUIStatsTimingCollector endPhase:](self->_timingCollector, "endPhase:", 0, *(_OWORD *)v43, *(_QWORD *)&v43[16], *(_OWORD *)&v43[24]);

}

- (void)_instantiateTemplateWithTransactionGroup:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  TUILayoutController *layoutController;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char *v13;
  TUIRenderModelAuxiliary *v14;
  TUIRenderModelAuxiliary *auxRenderModel;
  TUILayoutController *v16;
  unint64_t section;
  TUIRenderModelLayer *layerRenderModel;
  TUIRenderModelSection *v19;
  TUIRenderModelSection *renderModel;
  TUIRenderModelLayer *v21;
  id v22;

  v22 = a3;
  if (self->_layoutController)
  {
    -[TUIStatsTimingCollector startPhase:](self->_timingCollector, "startPhase:", 2);
    v4 = objc_autoreleasePoolPush();
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayoutController instantiateContext](self->_layoutController, "instantiateContext"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "instantiateTemplate:bindings:actionObject:", self->_template, self->_bindings, self->_entry));

    layoutController = self->_layoutController;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayoutController instantiateContext](layoutController, "instantiateContext"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "evaluationErrors"));
    -[TUILayoutController addErrors:](layoutController, "addErrors:", v9);

    objc_autoreleasePoolPop(v4);
    -[TUIStatsTimingCollector endPhase:](self->_timingCollector, "endPhase:", 2);
    -[TUIStatsTimingCollector startPhase:](self->_timingCollector, "startPhase:", 3);
    v10 = objc_autoreleasePoolPush();
    -[TUILayoutController setRootBox:](self->_layoutController, "setRootBox:", v6);
    -[TUILayoutController validateLayouts](self->_layoutController, "validateLayouts");
    objc_autoreleasePoolPop(v10);
    -[TUIStatsTimingCollector endPhase:](self->_timingCollector, "endPhase:", 3);
    -[TUIStatsTimingCollector startPhase:](self->_timingCollector, "startPhase:", 4);
    v11 = objc_autoreleasePoolPush();
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIFeedLayoutSection feedLayoutController](self, "feedLayoutController"));
    v13 = (char *)objc_msgSend(v12, "renderModelMode");

    if (v13 == (_BYTE *)&dword_0 + 1)
    {
      v21 = (TUIRenderModelLayer *)objc_claimAutoreleasedReturnValue(-[TUILayoutController renderModelLayer:](self->_layoutController, "renderModelLayer:", v22));
      layerRenderModel = self->_layerRenderModel;
      self->_layerRenderModel = v21;
    }
    else
    {
      if (v13)
      {
LABEL_8:
        objc_autoreleasePoolPop(v11);
        -[TUIStatsTimingCollector endPhase:](self->_timingCollector, "endPhase:", 4);

        goto LABEL_9;
      }
      v14 = (TUIRenderModelAuxiliary *)objc_claimAutoreleasedReturnValue(-[TUILayoutController renderModelAuxiliary:](self->_layoutController, "renderModelAuxiliary:", v22));
      auxRenderModel = self->_auxRenderModel;
      self->_auxRenderModel = v14;

      v16 = self->_layoutController;
      section = self->_section;
      layerRenderModel = (TUIRenderModelLayer *)objc_claimAutoreleasedReturnValue(-[_TUIFeedLayoutSection UUID](self, "UUID"));
      v19 = (TUIRenderModelSection *)objc_claimAutoreleasedReturnValue(-[TUILayoutController renderModelSection:offset:uuid:transactionGroup:](v16, "renderModelSection:offset:uuid:transactionGroup:", section, layerRenderModel, v22, CGPointZero.x, CGPointZero.y));
      renderModel = self->_renderModel;
      self->_renderModel = v19;

    }
    goto LABEL_8;
  }
  -[_TUIFeedLayoutSection lq_createEmptyRenderModelWithSize:](self, "lq_createEmptyRenderModelWithSize:", CGSizeZero.width, CGSizeZero.height);
LABEL_9:

}

- (id)UUID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedEntry identifierMap](self->_entry, "identifierMap"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "UUID"));

  return v3;
}

- (void)lq_updateEnvironment:(id)a3 withTransactionGroup:(id)a4
{
  TUILayoutController *layoutController;

  layoutController = self->_layoutController;
  if (layoutController)
    -[TUILayoutController updateEnvironment:](layoutController, "updateEnvironment:", a3, a4);
  self->_environmentNeedsUpdate = 0;
}

- (BOOL)lq_updateHostingGeometryMap:(id)a3
{
  return -[TUILayoutController applyHostingGeometryMapUpdate:](self->_layoutController, "applyHostingGeometryMapUpdate:", a3);
}

- (BOOL)lq_updateLayoutWithTransactionGroup:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  TUIRenderModelSection *v8;
  TUILayoutController *layoutController;
  unint64_t section;
  void *v11;
  TUIRenderModelSection *renderModel;
  BOOL v13;

  v4 = a3;
  if (self->_layoutController)
  {
    -[TUIStatsTimingCollector recordReason:](self->_timingCollector, "recordReason:", 1);
    -[TUIStatsTimingCollector startPhase:](self->_timingCollector, "startPhase:", 0);
    v5 = objc_claimAutoreleasedReturnValue(-[TUIWorkQueueContext workQueue](self->_queueContext, "workQueue"));
    dispatch_assert_queue_V2(v5);

    -[TUIStatsTimingCollector startPhase:](self->_timingCollector, "startPhase:", 2);
    -[TUILayoutController validateInstantiationWithTransactionGroup:](self->_layoutController, "validateInstantiationWithTransactionGroup:", v4);
    -[TUIStatsTimingCollector endPhase:](self->_timingCollector, "endPhase:", 2);
    -[TUIStatsTimingCollector startPhase:](self->_timingCollector, "startPhase:", 3);
    -[TUILayoutController validateLayouts](self->_layoutController, "validateLayouts");
    -[TUIStatsTimingCollector endPhase:](self->_timingCollector, "endPhase:", 3);
    -[TUIStatsTimingCollector startPhase:](self->_timingCollector, "startPhase:", 4);
    -[TUILayoutController validateRenderModelsWithTransactionGroup:](self->_layoutController, "validateRenderModelsWithTransactionGroup:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIFeedLayoutSection feedLayoutController](self, "feedLayoutController"));
    v7 = objc_msgSend(v6, "renderModelMode");

    v8 = 0;
    if (!v7)
    {
      layoutController = self->_layoutController;
      section = self->_section;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIFeedLayoutSection UUID](self, "UUID"));
      v8 = (TUIRenderModelSection *)objc_claimAutoreleasedReturnValue(-[TUILayoutController renderModelSection:offset:uuid:transactionGroup:](layoutController, "renderModelSection:offset:uuid:transactionGroup:", section, v11, v4, CGPointZero.x, CGPointZero.y));

    }
    -[TUIStatsTimingCollector endPhase:](self->_timingCollector, "endPhase:", 4);
    renderModel = self->_renderModel;
    v13 = v8 != renderModel;
    if (v8 != renderModel)
      objc_storeStrong((id *)&self->_renderModel, v8);
    -[TUIStatsTimingCollector endPhase:](self->_timingCollector, "endPhase:", 0);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)lq_createEmptyRenderModelWithSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  id v7;
  TUIRenderModelSection *v8;
  TUIFeedEntry *entry;
  void *v10;
  TUIRenderModelSection *v11;
  unint64_t section;
  void *v13;
  TUIRenderModelSection *v14;
  TUIRenderModelSection *renderModel;
  _DWORD v16[2];
  uint64_t v17;
  uint64_t v18;

  height = a3.height;
  width = a3.width;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIFeedLayoutSection feedLayoutController](self, "feedLayoutController"));
  v7 = objc_msgSend(v6, "renderModelMode");

  if (!v7)
  {
    v8 = [TUIRenderModelSection alloc];
    entry = self->_entry;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIWorkQueueContext workQueue](self->_queueContext, "workQueue"));
    memset(v16, 0, sizeof(v16));
    v17 = 0;
    v18 = 0;
    v11 = -[TUIRenderModelSection initWithEntry:submodels:config:impressions:linkEntities:hoverRegions:identifierMap:layoutQueue:](v8, "initWithEntry:submodels:config:impressions:linkEntities:hoverRegions:identifierMap:layoutQueue:", entry, 0, v16, 0, 0, 0, 0, v10);
    section = self->_section;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIFeedLayoutSection UUID](self, "UUID"));
    v14 = -[TUIRenderModelSection copyWithSection:offset:uuid:](v11, "copyWithSection:offset:uuid:", section, v13, CGPointZero.x, CGPointZero.y);
    renderModel = self->_renderModel;
    self->_renderModel = v14;

    -[TUIRenderModelSection setSize:](self->_renderModel, "setSize:", width, height);
  }
}

- (BOOL)lq_updateAuxiliaryLayoutWithTransactionGroup:(id)a3
{
  TUIStatsTimingCollector *timingCollector;
  id v5;
  TUIRenderModelAuxiliary *v6;
  TUIRenderModelAuxiliary **p_auxRenderModel;
  TUIRenderModelAuxiliary *v8;
  TUIRenderModelAuxiliary *auxRenderModel;

  timingCollector = self->_timingCollector;
  v5 = a3;
  -[TUIStatsTimingCollector startPhase:](timingCollector, "startPhase:", 4);
  v6 = (TUIRenderModelAuxiliary *)objc_claimAutoreleasedReturnValue(-[TUILayoutController renderModelAuxiliary:](self->_layoutController, "renderModelAuxiliary:", v5));

  -[TUIStatsTimingCollector endPhase:](self->_timingCollector, "endPhase:", 4);
  auxRenderModel = self->_auxRenderModel;
  p_auxRenderModel = &self->_auxRenderModel;
  v8 = auxRenderModel;
  if (v6 != auxRenderModel)
    objc_storeStrong((id *)p_auxRenderModel, v6);

  return v6 != v8;
}

- (BOOL)lq_updateLayerLayoutWithTransactionGroup:(id)a3
{
  TUIStatsTimingCollector *timingCollector;
  id v5;
  TUIRenderModelLayer *v6;
  TUIRenderModelLayer **p_layerRenderModel;
  TUIRenderModelLayer *v8;
  TUIRenderModelLayer *layerRenderModel;

  timingCollector = self->_timingCollector;
  v5 = a3;
  -[TUIStatsTimingCollector startPhase:](timingCollector, "startPhase:", 4);
  v6 = (TUIRenderModelLayer *)objc_claimAutoreleasedReturnValue(-[TUILayoutController renderModelLayer:](self->_layoutController, "renderModelLayer:", v5));

  -[TUIStatsTimingCollector endPhase:](self->_timingCollector, "endPhase:", 4);
  layerRenderModel = self->_layerRenderModel;
  p_layerRenderModel = &self->_layerRenderModel;
  v8 = layerRenderModel;
  if (v6 != layerRenderModel)
    objc_storeStrong((id *)p_layerRenderModel, v6);

  return v6 != v8;
}

- (void)lq_appendAnchorsToSet:(id)a3
{
  void *v4;
  TUILayoutController *layoutController;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayoutController rootBox](self->_layoutController, "rootBox"));

  if (v4)
  {
    layoutController = self->_layoutController;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayoutController rootBox](layoutController, "rootBox"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayoutController layoutForModel:](layoutController, "layoutForModel:", v6));

    objc_msgSend(v7, "appendAnchorsToSet:inRoot:", v8, v7);
  }

}

- (id)loadingRenderModelWithSize:(CGSize)a3 center:(CGPoint)a4 environment:(id)a5
{
  double y;
  double x;
  double height;
  double width;
  TUIFeedEntry *entry;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  TUIRenderModelTransform *v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  TUIRenderModelSection *v19;
  TUIFeedEntry *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  TUIRenderModelSection *v25;
  unint64_t section;
  void *v27;
  id v28;
  _BYTE v30[8];
  uint64_t v31;
  uint64_t v32;
  TUIRenderModelTransform *v33;

  y = a4.y;
  x = a4.x;
  height = a3.height;
  width = a3.width;
  entry = self->_entry;
  v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedEntry identifierMap](entry, "identifierMap"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "loadingIdentifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[TUISpinnerView renderModelWithIdentifier:](TUISpinnerView, "renderModelWithIdentifier:", v13));

  v15 = -[TUIRenderModelTransform initWithSubmodel:]([TUIRenderModelTransform alloc], "initWithSubmodel:", v14);
  -[TUIRenderModelTransform setSize:](v15, "setSize:", width, height);
  -[TUIRenderModelTransform setCenter:](v15, "setCenter:", x, y);
  v16 = objc_msgSend(v11, "layoutDirection") == (char *)&dword_0 + 2;
  objc_msgSend(v11, "viewSize");
  v18 = v17;

  v19 = [TUIRenderModelSection alloc];
  v20 = self->_entry;
  v33 = v15;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v33, 1));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedEntry identifierMap](self->_entry, "identifierMap"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "renderModelIdentifierMap"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[TUIWorkQueueContext workQueue](self->_queueContext, "workQueue"));
  v30[0] = v16;
  memset(&v30[1], 0, 7);
  v31 = v18;
  v32 = 0;
  v25 = -[TUIRenderModelSection initWithEntry:submodels:config:impressions:linkEntities:hoverRegions:identifierMap:layoutQueue:](v19, "initWithEntry:submodels:config:impressions:linkEntities:hoverRegions:identifierMap:layoutQueue:", v20, v21, v30, 0, 0, 0, v23, v24);

  -[TUIRenderModelTransform size](v15, "size");
  -[TUIRenderModelSection setSize:](v25, "setSize:");
  section = self->_section;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIFeedLayoutSection UUID](self, "UUID"));
  v28 = -[TUIRenderModelSection copyWithSection:offset:uuid:](v25, "copyWithSection:offset:uuid:", section, v27, CGPointZero.x, CGPointZero.y);

  return v28;
}

- (id)axModelTree
{
  return -[TUILayoutController axModelTree](self->_layoutController, "axModelTree");
}

- (void)debugDumpEnvironmentContainerStructure
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[TUIFeedEntry templateURL](self->_entry, "templateURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUILayoutController debugDumpEnvironmentContainerStructure](self->_layoutController, "debugDumpEnvironmentContainerStructure"));
  NSLog(CFSTR("\nEntry: %@\n\n%@"), v4, v3);

}

- (unint64_t)section
{
  return self->_section;
}

- (TUIBindings)bindings
{
  return self->_bindings;
}

- (TUIRenderModelSection)renderModel
{
  return self->_renderModel;
}

- (TUIRenderModelAuxiliary)auxRenderModel
{
  return self->_auxRenderModel;
}

- (TUIRenderModelLayer)layerRenderModel
{
  return self->_layerRenderModel;
}

- (unint64_t)statsMode
{
  return self->_statsMode;
}

- (TUIStatsTimingCollector)timingCollector
{
  return self->_timingCollector;
}

- (TUIFeedEntry)entry
{
  return self->_entry;
}

- (TUITemplate)template
{
  return self->_template;
}

- (TUILayoutController)layoutController
{
  return self->_layoutController;
}

- (TUIStatsEventCollector)eventCollector
{
  return self->_eventCollector;
}

- (TUIWorkQueueContext)queueContext
{
  return self->_queueContext;
}

- (BOOL)environmentNeedsUpdate
{
  return self->_environmentNeedsUpdate;
}

- (void)setEnvironmentNeedsUpdate:(BOOL)a3
{
  self->_environmentNeedsUpdate = a3;
}

- (BOOL)needsInstantiation
{
  return self->_needsInstantiation;
}

- (TUIFeedLayoutController)feedLayoutController
{
  return (TUIFeedLayoutController *)objc_loadWeakRetained((id *)&self->_feedLayoutController);
}

- (void)setFeedLayoutController:(id)a3
{
  objc_storeWeak((id *)&self->_feedLayoutController, a3);
}

- (TUIInstantiateContextState)instantiateState
{
  return self->_instantiateState;
}

- (TUIFeedCaptureController)captureController
{
  return self->_captureController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureController, 0);
  objc_storeStrong((id *)&self->_instantiateState, 0);
  objc_destroyWeak((id *)&self->_feedLayoutController);
  objc_storeStrong((id *)&self->_queueContext, 0);
  objc_storeStrong((id *)&self->_eventCollector, 0);
  objc_storeStrong((id *)&self->_layoutController, 0);
  objc_storeStrong((id *)&self->_template, 0);
  objc_storeStrong((id *)&self->_entry, 0);
  objc_storeStrong((id *)&self->_timingCollector, 0);
  objc_storeStrong((id *)&self->_layerRenderModel, 0);
  objc_storeStrong((id *)&self->_auxRenderModel, 0);
  objc_storeStrong((id *)&self->_renderModel, 0);
  objc_storeStrong((id *)&self->_bindings, 0);
}

@end
