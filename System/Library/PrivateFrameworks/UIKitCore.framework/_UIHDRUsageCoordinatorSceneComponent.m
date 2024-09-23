@implementation _UIHDRUsageCoordinatorSceneComponent

- (_UIHDRUsageCoordinatorSceneComponent)initWithScene:(id)a3
{
  id v4;
  _UIHDRUsageCoordinatorSceneComponent *v5;
  _UIHDRUsageCoordinatorSceneComponent *v6;
  id v7;
  id WeakRetained;
  char v9;
  id v10;
  char v11;
  id v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_UIHDRUsageCoordinatorSceneComponent;
  v5 = -[_UIHDRUsageCoordinatorSceneComponent init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = objc_storeWeak((id *)&v5->_scene, v4);
    objc_opt_class();
    *(_BYTE *)&v6->_flags = *(_BYTE *)&v6->_flags & 0xFE | objc_opt_isKindOfClass() & 1;

    WeakRetained = objc_loadWeakRetained((id *)&v6->_scene);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 2;
    else
      v9 = 0;
    *(_BYTE *)&v6->_flags = *(_BYTE *)&v6->_flags & 0xFD | v9;

    v10 = objc_loadWeakRetained((id *)&v6->_scene);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = 4;
    else
      v11 = 0;
    *(_BYTE *)&v6->_flags = *(_BYTE *)&v6->_flags & 0xFB | v11;

    v12 = objc_loadWeakRetained((id *)&v6->_scene);
    *(_BYTE *)&v6->_flags = *(_BYTE *)&v6->_flags & 0xF7 | (8 * (objc_msgSend(v12, "activationState") < 1));

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel__powerStateDidChange_, *MEMORY[0x1E0CB3048], 0);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CB3048], 0);

  v4.receiver = self;
  v4.super_class = (Class)_UIHDRUsageCoordinatorSceneComponent;
  -[_UIHDRUsageCoordinatorSceneComponent dealloc](&v4, sel_dealloc);
}

- (id)_settingsDiffActionsForScene:(id)a3
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (UITraitCollection)_traitOverrides
{
  void *v2;
  int v3;
  char *v4;
  void *v5;

  if ((*(_BYTE *)&self->_flags & 0x18) == 8)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isLowPowerModeEnabled");

  }
  else
  {
    v3 = 1;
  }
  +[_UIHDRUsageCoordinator sharedInstance]();
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  -[_UIHDRUsageCoordinator traitCollectionSuppressingHDR:](v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITraitCollection *)v5;
}

- (void)_invalidateTraitOverrides
{
  id WeakRetained;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
    objc_msgSend(WeakRetained, "_componentDidUpdateTraitOverrides:", self);

  }
}

- (void)_powerStateDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61___UIHDRUsageCoordinatorSceneComponent__powerStateDidChange___block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)_setApplicationOcclusionRects:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  unint64_t v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  unint64_t v40;
  NSObject *v41;
  char v42;
  unint64_t v43;
  NSObject *v44;
  NSObject *v45;
  CGRect v46;
  double rect;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v6 = objc_msgSend(v4, "count");
    if (v6)
    {
      v7 = v6;
      WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
      objc_msgSend(WeakRetained, "screen");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "fixedCoordinateSpace");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(WeakRetained, "coordinateSpace");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (!v10 || !v11)
      {
        if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134218240;
            v49 = v10;
            v50 = 2048;
            v51 = v12;
            _os_log_fault_impl(&dword_185066000, v45, OS_LOG_TYPE_FAULT, "Could not obtain source(%p) or destination(%p) coordinate space", buf, 0x16u);
          }

        }
        else
        {
          v40 = _MergedGlobals_930;
          if (!_MergedGlobals_930)
          {
            v40 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v40, (unint64_t *)&_MergedGlobals_930);
          }
          v41 = *(NSObject **)(v40 + 8);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            v49 = v10;
            v50 = 2048;
            v51 = v12;
            _os_log_impl(&dword_185066000, v41, OS_LOG_TYPE_ERROR, "Could not obtain source(%p) or destination(%p) coordinate space", buf, 0x16u);
          }
        }
        if ((*(_BYTE *)&self->_flags & 0x10) == 0)
          goto LABEL_30;
        v42 = *(_BYTE *)&self->_flags & 0xEF;
        goto LABEL_29;
      }
      objc_msgSend(v11, "bounds");
      if (v7 != 1)
      {
        if (!os_variant_has_internal_diagnostics())
        {
          v43 = qword_1ECD7CA18;
          if (!qword_1ECD7CA18)
          {
            v43 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v43, (unint64_t *)&qword_1ECD7CA18);
          }
          v44 = *(NSObject **)(v43 + 8);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v49 = v5;
            _os_log_impl(&dword_185066000, v44, OS_LOG_TYPE_ERROR, "Expected single occlusion rect, got multiple – %@", buf, 0xCu);
          }
          goto LABEL_27;
        }
        __UIFaultDebugAssertLog();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v49 = v5;
          _os_log_fault_impl(&dword_185066000, v36, OS_LOG_TYPE_FAULT, "Expected single occlusion rect, got multiple – %@", buf, 0xCu);
        }
        goto LABEL_37;
      }
      rect = v15 * v16;
      v17 = v14;
      v18 = v13;
      v19 = v16;
      v20 = v15;
      objc_msgSend(v5, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "CGRectValue");
      v23 = v22;
      v25 = v24;
      v27 = v26;
      v29 = v28;

      objc_msgSend(v10, "convertRect:toCoordinateSpace:", v12, v23, v25, v27, v29);
      x = v55.origin.x;
      y = v55.origin.y;
      width = v55.size.width;
      height = v55.size.height;
      v61.origin.x = v18;
      v61.origin.y = v17;
      v61.size.width = v20;
      v61.size.height = v19;
      v56 = CGRectIntersection(v55, v61);
      if (v56.size.width * v56.size.height / rect > 0.999)
      {
LABEL_27:
        if ((*(_BYTE *)&self->_flags & 0x10) != 0)
        {
LABEL_30:

          goto LABEL_31;
        }
        v42 = *(_BYTE *)&self->_flags | 0x10;
LABEL_29:
        *(_BYTE *)&self->_flags = v42;
        -[_UIHDRUsageCoordinatorSceneComponent _invalidateTraitOverrides](self, "_invalidateTraitOverrides", *(_QWORD *)&v46.origin.x, *(_QWORD *)&v46.origin.y, *(_QWORD *)&v46.size.width, *(_QWORD *)&v46.size.height);
        goto LABEL_30;
      }
      v46 = v56;
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v36 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
          goto LABEL_37;
        v59.size.width = v20;
        v59.origin.x = v18;
        v59.origin.y = v17;
        v59.size.height = v19;
        NSStringFromCGRect(v59);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v60.origin.x = x;
        v60.origin.y = y;
        v60.size.width = width;
        v60.size.height = height;
        NSStringFromCGRect(v60);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromCGRect(v46);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v49 = v37;
        v50 = 2112;
        v51 = v38;
        v52 = 2112;
        v53 = v39;
        _os_log_fault_impl(&dword_185066000, v36, OS_LOG_TYPE_FAULT, "Expected full coverage from single occlusion rect (sceneBounds=%@, sceneOrientedOcclusion=%@, intersection=%@)", buf, 0x20u);
      }
      else
      {
        v34 = qword_1ECD7CA10;
        if (!qword_1ECD7CA10)
        {
          v34 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v34, (unint64_t *)&qword_1ECD7CA10);
        }
        v35 = *(NSObject **)(v34 + 8);
        if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          goto LABEL_27;
        v36 = v35;
        v57.origin.x = v18;
        v57.origin.y = v17;
        v57.size.width = v20;
        v57.size.height = v19;
        NSStringFromCGRect(v57);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v58.origin.x = x;
        v58.origin.y = y;
        v58.size.width = width;
        v58.size.height = height;
        NSStringFromCGRect(v58);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromCGRect(v46);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v49 = v37;
        v50 = 2112;
        v51 = v38;
        v52 = 2112;
        v53 = v39;
        _os_log_impl(&dword_185066000, v36, OS_LOG_TYPE_ERROR, "Expected full coverage from single occlusion rect (sceneBounds=%@, sceneOrientedOcclusion=%@, intersection=%@)", buf, 0x20u);
      }

LABEL_37:
      goto LABEL_27;
    }
    if ((*(_BYTE *)&self->_flags & 0x10) != 0)
    {
      *(_BYTE *)&self->_flags &= ~0x10u;
      -[_UIHDRUsageCoordinatorSceneComponent _invalidateTraitOverrides](self, "_invalidateTraitOverrides");
    }
  }
LABEL_31:

}

- (void)_scene:(id)a3 willTransitionToActivationState:(int64_t)a4 withReasonsMask:(unint64_t)a5
{
  char flags;

  if (self)
  {
    flags = (char)self->_flags;
    if (a4 < 1 == ((flags & 8) == 0))
    {
      *(_BYTE *)&self->_flags = flags & 0xF7 | (8 * (a4 < 1));
      -[_UIHDRUsageCoordinatorSceneComponent _invalidateTraitOverrides](self, "_invalidateTraitOverrides", a3);
    }
  }
}

- (UIScene)_scene
{
  return (UIScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)_setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);
}

@end
