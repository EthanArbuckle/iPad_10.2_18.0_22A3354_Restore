@implementation TUIFeedRenderer

- (TUIFeedRenderer)initWithContent:(id)a3 environment:(id)a4 factory:(id)a5 manager:(id)a6 options:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  TUIFeedRenderer *v18;
  id v19;
  NSObject *v20;
  unint64_t uniqueIdentifier;
  double v22;
  TUIFeedLayoutController *v23;
  TUIFeedLayoutController *layoutController;
  void *v25;
  id v26;
  objc_super v28;
  uint8_t buf[4];
  unint64_t v30;
  __int16 v31;
  TUIFeedRenderer *v32;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v28.receiver = self;
  v28.super_class = (Class)TUIFeedRenderer;
  v18 = -[TUIFeedRenderer init](&v28, "init");
  if (v18)
  {
    v18->_feedId.uniqueIdentifier = TUIFeedIdentifierGenerate();
    v19 = TUIDefaultLog();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uniqueIdentifier = v18->_feedId.uniqueIdentifier;
      *(_DWORD *)buf = 134218242;
      v30 = uniqueIdentifier;
      v31 = 2112;
      v32 = v18;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "[fid:%lu] created feed renderer: %@", buf, 0x16u);
    }

    objc_storeStrong((id *)&v18->_content, a3);
    objc_msgSend(v14, "contentsScale");
    v18->_contentScale = v22;
    objc_storeStrong((id *)&v18->_options, a7);
    v23 = -[TUIFeedLayoutController initWithFeedId:environment:factory:manager:renderMode:]([TUIFeedLayoutController alloc], "initWithFeedId:environment:factory:manager:renderMode:", v18->_feedId.uniqueIdentifier, v14, v15, v16, 1);
    layoutController = v18->_layoutController;
    v18->_layoutController = v23;

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedLayoutController layerUpdateController](v18->_layoutController, "layerUpdateController"));
    v26 = objc_msgSend(v25, "registerDelegate:", v18);

  }
  return v18;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedLayoutController layerUpdateController](self->_layoutController, "layerUpdateController"));
  objc_msgSend(v3, "unregisterDelegate:", self);

  v4.receiver = self;
  v4.super_class = (Class)TUIFeedRenderer;
  -[TUIFeedRenderer dealloc](&v4, "dealloc");
}

- (void)capture:(id)a3
{
  TUIFeedLayoutController *layoutController;
  TUIFeedContent *content;
  id v6;
  TUIFeedSuspendLayoutLayerUpdateCondition *v7;
  void *v8;
  TUIFeedSuspendLayoutLayerUpdateCondition *v9;
  TUIFeedSuspendLayoutLayerUpdateCondition *layoutCondition;
  id v11;
  id completion;

  content = self->_content;
  layoutController = self->_layoutController;
  v6 = a3;
  -[TUIFeedLayoutController updateWithContent:transaction:](layoutController, "updateWithContent:transaction:", content, 0);
  v7 = [TUIFeedSuspendLayoutLayerUpdateCondition alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedContent entries](self->_content, "entries"));
  v9 = -[TUIFeedSuspendLayoutLayerUpdateCondition initWithSectionCount:completion:](v7, "initWithSectionCount:completion:", objc_msgSend(v8, "count"), 0);
  layoutCondition = self->_layoutCondition;
  self->_layoutCondition = v9;

  -[TUIFeedLayoutController suspendUpdatesUntilMeetingLayoutCondition:](self->_layoutController, "suspendUpdatesUntilMeetingLayoutCondition:", self->_layoutCondition);
  v11 = objc_retainBlock(v6);

  completion = self->_completion;
  self->_completion = v11;

}

- (void)applyLayerModelUpdate:(id)a3 hasInvalidLayouts:(BOOL)a4
{
  id v6;
  TUIFeedRendererOptions *options;
  double v8;
  double v9;
  TUIFeedRendererImageResourceObserver *v10;
  TUIFeedRendererImageResourceObserver *resourceObserver;
  TUIFeedRendererImageResourceObserver *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  BOOL v16;

  v6 = a3;
  options = self->_options;
  if (options)
  {
    -[TUIFeedRendererOptions timeout](options, "timeout");
    v9 = v8;
  }
  else
  {
    v9 = 3.0;
  }
  v10 = -[TUIFeedRendererImageResourceObserver initWithRenderModel:timeout:]([TUIFeedRendererImageResourceObserver alloc], "initWithRenderModel:timeout:", v6, v9);
  resourceObserver = self->_resourceObserver;
  self->_resourceObserver = v10;

  v12 = self->_resourceObserver;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_156E64;
  v14[3] = &unk_242D90;
  v14[4] = self;
  v15 = v6;
  v16 = a4;
  v13 = v6;
  -[TUIFeedRendererImageResourceObserver waitForImageResources:](v12, "waitForImageResources:", v14);

}

- (id)_buildRootLayerFromRenderModel:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  _QWORD v11[5];
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
  v15 = sub_157250;
  v16 = sub_157260;
  v17 = objc_alloc_init((Class)CALayer);
  objc_msgSend((id)v13[5], "setAnchorPoint:", 0.5, 0.5);
  objc_msgSend(v4, "size");
  v6 = v5;
  objc_msgSend(v4, "size");
  objc_msgSend((id)v13[5], "setFrame:", 0.0, 0.0, v6, v7);
  objc_msgSend((id)v13[5], "setContentsScale:", self->_contentScale);
  objc_msgSend((id)v13[5], "setRasterizationScale:", self->_contentScale);
  objc_msgSend((id)v13[5], "setShouldRasterize:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "submodels"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_157268;
  v11[3] = &unk_242DB8;
  v11[4] = &v12;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v11);

  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (TUIFeedContent)content
{
  return self->_content;
}

- (TUIFeedLayoutController)layoutController
{
  return self->_layoutController;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (TUIFeedRendererOptions)options
{
  return self->_options;
}

- (BCUOperation)renderOperation
{
  return self->_renderOperation;
}

- (void)setRenderOperation:(id)a3
{
  objc_storeStrong((id *)&self->_renderOperation, a3);
}

- (BCULayerRenderer)layerRenderer
{
  return self->_layerRenderer;
}

- (void)setLayerRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_layerRenderer, a3);
}

- (TUIFeedRendererImageResourceObserver)resourceObserver
{
  return self->_resourceObserver;
}

- (void)setResourceObserver:(id)a3
{
  objc_storeStrong((id *)&self->_resourceObserver, a3);
}

- (TUIFeedSuspendLayoutLayerUpdateCondition)layoutCondition
{
  return self->_layoutCondition;
}

- (void)setLayoutCondition:(id)a3
{
  objc_storeStrong((id *)&self->_layoutCondition, a3);
}

- ($61A80719B04F7407D3E47539F1B23CAA)feedId
{
  return ($61A80719B04F7407D3E47539F1B23CAA)self->_feedId.uniqueIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutCondition, 0);
  objc_storeStrong((id *)&self->_resourceObserver, 0);
  objc_storeStrong((id *)&self->_layerRenderer, 0);
  objc_storeStrong((id *)&self->_renderOperation, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_layoutController, 0);
  objc_storeStrong((id *)&self->_content, 0);
}

@end
