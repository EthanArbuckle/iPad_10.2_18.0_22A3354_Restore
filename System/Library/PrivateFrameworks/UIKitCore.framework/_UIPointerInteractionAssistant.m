@implementation _UIPointerInteractionAssistant

- (void)willMoveToView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  objc_super v8;

  v4 = a3;
  -[_UIPointerInteractionAssistant _monitoredWindow]((id *)&self->super.super.isa);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v4)
  {
    if (v5)
    {
      objc_msgSend(v5, "_unregisterSubtreeMonitor:", self);
      if (self)
        v7 = objc_storeWeakOrNil((id *)&self->_manual_weak_monitoredWindow, 0);
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)_UIPointerInteractionAssistant;
  -[UIPointerInteraction willMoveToView:](&v8, sel_willMoveToView_, v4);

}

- (UIView)previewContainer
{
  _UIPointerInteractionAssistantEffectContainerView *previewContainer;
  _UIPointerInteractionAssistantEffectContainerView *v4;
  _UIPointerInteractionAssistantEffectContainerView *v5;

  previewContainer = self->_previewContainer;
  if (!previewContainer)
  {
    v4 = (_UIPointerInteractionAssistantEffectContainerView *)objc_opt_new();
    v5 = self->_previewContainer;
    self->_previewContainer = v4;

    -[UIView setUserInteractionEnabled:](self->_previewContainer, "setUserInteractionEnabled:", 0);
    previewContainer = self->_previewContainer;
  }
  return (UIView *)previewContainer;
}

- (void)_monitoredView:(id)a3 willMoveFromSuperview:(id)a4 toSuperview:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  int shouldAssistantDescendent;
  void *v12;
  int v13;
  _UIPointerInteractionAssistant *v14;
  id v15;

  v15 = a4;
  v8 = a5;
  _assistedButtonForView(a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[_UIPointerInteractionAssistant _assistantForView:]((uint64_t)self, (uint64_t)v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    shouldAssistantDescendent = _shouldAssistantDescendent((uint64_t)v10, v9);

    -[_UIPointerInteractionAssistant _assistantForView:]((uint64_t)self, (uint64_t)v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = _shouldAssistantDescendent((uint64_t)v12, v9);

    if (shouldAssistantDescendent && !v13)
      goto LABEL_4;
    if (((shouldAssistantDescendent | v13 ^ 1) & 1) == 0)
    {
      objc_msgSend(v9, "_proxyPointerInteraction");
      v14 = (_UIPointerInteractionAssistant *)objc_claimAutoreleasedReturnValue();

      if (v14 == self)
      {
        self = 0;
LABEL_4:
        objc_msgSend(v9, "_setProxyPointerInteraction:", self);
      }
    }
  }

}

- (BOOL)_monitorsView:(id)a3
{
  void *v3;
  BOOL v4;

  -[_UIPointerInteractionAssistant _assistantForView:]((uint64_t)self, (uint64_t)a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)_assistantForView:(uint64_t)a1
{
  void *v2;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  if (!a1)
    return 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__49;
  v10 = __Block_byref_object_dispose__49;
  v11 = 0;
  v2 = *(void **)(a1 + 104);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52___UIPointerInteractionAssistant__assistantForView___block_invoke;
  v5[3] = &unk_1E16BF638;
  v5[4] = &v6;
  v5[5] = a2;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (_UIPointerInteractionAssistant)init
{
  return -[_UIPointerInteractionAssistant initWithDelegate:](self, "initWithDelegate:", self);
}

- (_UIPointerInteractionAssistant)initWithDelegate:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIPointerInteractionAssistant;
  return -[UIPointerInteraction initWithDelegate:](&v4, sel_initWithDelegate_, self);
}

- (void)setAssistedView:(id)a3 identifier:(id)a4
{
  id v7;
  id v8;
  NSMutableDictionary *assistants;
  uint64_t v10;
  id *v11;
  id WeakRetained;
  uint64_t v13;
  void *v14;
  id v15;
  _UIAssistantEntry *v16;
  id v17;
  id v18;
  NSMutableDictionary *v19;
  NSMutableDictionary *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  objc_super v29;

  v7 = a3;
  v8 = a4;
  v28 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPointerInteractionAssistant.m"), 219, CFSTR("assistedView identifier must not be nil"));

  }
  assistants = self->_assistants;
  if (v7)
  {
    if (!assistants)
    {
      v16 = [_UIAssistantEntry alloc];
      v17 = v7;
      if (v16)
      {
        v29.receiver = v16;
        v29.super_class = (Class)_UIAssistantEntry;
        v18 = -[UIPointerInteraction init](&v29, sel_init);
        v16 = (_UIAssistantEntry *)v18;
        if (v18)
          objc_storeWeak((id *)v18 + 1, v17);
      }

      v29.receiver = v16;
      v19 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjects:forKeys:count:", &v29, &v28, 1);
      v20 = self->_assistants;
      self->_assistants = v19;

      v15 = 0;
      goto LABEL_20;
    }
    -[NSMutableDictionary objectForKeyedSubscript:](assistants, "objectForKeyedSubscript:", v8);
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (id *)v10;
      WeakRetained = objc_loadWeakRetained((id *)(v10 + 8));
    }
    else
    {
      v11 = (id *)objc_opt_new();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_assistants, "setObject:forKeyedSubscript:", v11, v8);
      WeakRetained = 0;
      v15 = 0;
      if (!v11)
      {
LABEL_20:
        -[_UIPointerInteractionAssistant _updatePointerInteractionForSubtree:suppressInteractions:]((uint64_t)self, v7, 1);
        v21 = v15;
        goto LABEL_21;
      }
    }
    objc_storeWeak(v11 + 1, v7);

    v15 = WeakRetained;
  }
  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](assistants, "objectForKeyedSubscript:", v8);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      v15 = objc_loadWeakRetained((id *)(v13 + 8));
    else
      v15 = 0;

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_assistants, "setObject:forKeyedSubscript:", 0, v8);
  }
  v21 = v7;
  if (v15 != v7)
  {
    if (v15)
      -[_UIPointerInteractionAssistant _updatePointerInteractionForSubtree:suppressInteractions:]((uint64_t)self, v15, 0);
    v21 = v15;
    if (v7)
      goto LABEL_20;
  }
LABEL_21:
  if (-[NSMutableDictionary count](self->_assistants, "count"))
  {
    -[UIView window](self->_previewContainer, "window");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_storeWeakOrNil((id *)&self->_manual_weak_monitoredWindow, v22);

    -[_UIPointerInteractionAssistant _monitoredWindow]((id *)&self->super.super.isa);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "_registerSubtreeMonitor:", self);

  }
  else
  {
    -[_UIPointerInteractionAssistant _monitoredWindow]((id *)&self->super.super.isa);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "_unregisterSubtreeMonitor:", self);

    v26 = objc_storeWeakOrNil((id *)&self->_manual_weak_monitoredWindow, 0);
  }
  -[UIPointerInteraction invalidate](self, "invalidate");

}

- (void)_updatePointerInteractionForSubtree:(char)a3 suppressInteractions:
{
  id v5;
  _UIViewBlockVisitor *v6;
  _UIViewBlockVisitor *v7;
  _QWORD v8[5];
  char v9;

  if (a1)
  {
    v5 = a2;
    v6 = [_UIViewBlockVisitor alloc];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __91___UIPointerInteractionAssistant__updatePointerInteractionForSubtree_suppressInteractions___block_invoke;
    v8[3] = &unk_1E16BF610;
    v9 = a3;
    v8[4] = a1;
    v7 = -[_UIViewBlockVisitor initWithTraversalDirection:visitorBlock:](v6, "initWithTraversalDirection:visitorBlock:", 2, v8);
    objc_msgSend(v5, "_receiveVisitor:", v7);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assistants, 0);
  objc_destroyWeak((id *)&self->_manual_weak_monitoredWindow);
  objc_storeStrong((id *)&self->_previewContainer, 0);
}

- (id)createPreviewTargetForView:(id)a3 center:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  y = a4.y;
  x = a4.x;
  objc_msgSend(a3, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertPoint:toView:", self->_previewContainer, x, y);
  v9 = v8;
  v11 = v10;

  return -[UIPreviewTarget initWithContainer:center:]([UIPreviewTarget alloc], "initWithContainer:center:", self->_previewContainer, v9, v11);
}

- (id)createRegionFromRect:(CGRect)a3 targetView:(id)a4 identifier:(id)a5 selected:(BOOL)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = a4;
  v14 = a5;
  -[UIPointerInteraction view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "convertRect:toView:", v15, x, y, width, height);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  +[UIPointerRegion regionWithRect:identifier:](_UIPointerAssistantRegion, "regionWithRect:identifier:", v14, v17, v19, v21, v23);
  v24 = objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_storeWeak((id *)(v24 + 80), v13);
    *(_BYTE *)(v24 + 72) = a6;
  }

  return (id)v24;
}

- (id)createStyleForButton:(id)a3 shapeProvider:(id)a4
{
  id v7;
  void (**v8)(id, id, _UIPointerInteractionAssistantEffectContainerView *, void *);
  void *v9;
  UITargetedPreview *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  void *v30;
  SEL v31;
  _UIPointerInteractionAssistant *v32;
  void *v33;
  void (**v34)(id, id, _UIPointerInteractionAssistantEffectContainerView *, void *);
  void *v35;

  v7 = a3;
  v8 = (void (**)(id, id, _UIPointerInteractionAssistantEffectContainerView *, void *))a4;
  objc_msgSend(v7, "center");
  -[_UIPointerInteractionAssistant createPreviewTargetForView:center:](self, "createPreviewTargetForView:center:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = [UITargetedPreview alloc];
  objc_msgSend(v7, "_pointerEffectPreviewParameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[UITargetedPreview initWithView:parameters:target:](v10, "initWithView:parameters:target:", v7, v11, v9);

  v13 = (void *)v12;
  objc_msgSend(v7, "_pointerEffectWithPreview:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_shapeInContainer:", self->_previewContainer);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v8[2](v8, v7, self->_previewContainer, v15);
    v16 = v14;
    v17 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v17;
    v14 = v16;
  }
  objc_msgSend(v7, "pointerStyleProvider");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18)
  {
    v31 = a2;
    v32 = self;
    v35 = v14;
    (*(void (**)(uint64_t, id, void *, void *))(v18 + 16))(v18, v7, v14, v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "pointerEffect");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      objc_msgSend(v21, "preview");
      v23 = v9;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "target");
      v34 = v8;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "container");
      v33 = v13;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "container");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v34;
      v9 = v23;
      v28 = v26 == v27;
      v13 = v33;
      if (!v28)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", v31, v32, CFSTR("_UIPointerInteractionAssistant.m"), 202, CFSTR("UIButton pointer effect must use the same container as the UITargetedPreview provided with the proposedEffect when used as a custom view in a UINavigationBar or UIToolbar"));

      }
    }

    v14 = v35;
  }
  else
  {
    +[UIPointerStyle styleWithEffect:shape:](UIPointerStyle, "styleWithEffect:shape:", v14, v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

- (CGPoint)request:(id)a3 locationInView:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGPoint result;

  v6 = a4;
  objc_msgSend(a3, "location");
  v8 = v7;
  v10 = v9;
  -[UIPointerInteraction view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertPoint:fromView:", v11, v8, v10);
  v13 = v12;
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.y = v17;
  result.x = v16;
  return result;
}

- (id)_monitoredWindow
{
  if (a1)
  {
    objc_loadWeak(a1 + 12);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSMutableDictionary *assistants;
  id v14;
  uint64_t v15;
  id WeakRetained;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "location");
  objc_msgSend(v11, "hitTest:withEvent:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__49;
  v34 = __Block_byref_object_dispose__49;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__49;
  v28 = __Block_byref_object_dispose__49;
  v29 = 0;
  assistants = self->_assistants;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __84___UIPointerInteractionAssistant_pointerInteraction_regionForRequest_defaultRegion___block_invoke;
  v20[3] = &unk_1E16BF660;
  v14 = v12;
  v21 = v14;
  v22 = &v30;
  v23 = &v24;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](assistants, "enumerateKeysAndObjectsUsingBlock:", v20);
  v15 = v31[5];
  if (v15)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v15 + 8));
    objc_msgSend(WeakRetained, "bounds");
    objc_msgSend(WeakRetained, "convertRect:toView:", v11);
    +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", v25[5]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v31[5], "pointerInteraction:regionForRequest:defaultRegion:", v8, v9, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v18;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  UIPreviewTarget *v21;
  void *v22;
  id v23;
  void *v24;

  if (a4)
    v7 = (void *)*((_QWORD *)a4 + 11);
  else
    v7 = 0;
  v8 = v7;
  objc_msgSend(v8, "pointerInteraction:styleForRegion:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (self->_previewContainer)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (v11
    || (objc_msgSend(v9, "pointerEffect"), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, !v12))
  {
    v23 = v10;
  }
  else
  {
    objc_msgSend(v10, "pointerEffect");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "preview");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "target");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "container");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "center");
    objc_msgSend(v16, "convertPoint:toView:", self->_previewContainer);
    v18 = v17;
    v20 = v19;

    v21 = -[UIPreviewTarget initWithContainer:center:]([UIPreviewTarget alloc], "initWithContainer:center:", self->_previewContainer, v18, v20);
    objc_msgSend(v14, "retargetedPreviewWithTarget:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (id)objc_msgSend(v10, "copy");
    objc_msgSend(v23, "pointerEffect");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setPreview:", v22);

  }
  return v23;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  void *v5;

  if (a4)
    v5 = (void *)*((_QWORD *)a4 + 11);
  else
    v5 = 0;
  objc_msgSend(v5, "pointerInteraction:willEnterRegion:animator:", a3);
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  void *v5;

  if (a4)
    v5 = (void *)*((_QWORD *)a4 + 11);
  else
    v5 = 0;
  objc_msgSend(v5, "pointerInteraction:willExitRegion:animator:", a3);
}

- (void)_willMoveFromWindow:(id)a3 toWindow:(id)a4
{
  void *v5;
  id v6;
  id obj;

  obj = a4;
  -[_UIPointerInteractionAssistant _monitoredWindow]((id *)&self->super.super.isa);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_unregisterSubtreeMonitor:", self);

  if (-[NSMutableDictionary count](self->_assistants, "count"))
    objc_msgSend(obj, "_registerSubtreeMonitor:", self);
  v6 = objc_storeWeakOrNil((id *)&self->_manual_weak_monitoredWindow, obj);

}

@end
