@implementation UIDraggingBeginningSessionConfiguration

- (UIDraggingBeginningSessionConfiguration)initWithItems:(id)a3 dataOwner:(int64_t)a4 requiredContextIds:(id)a5 sourceView:(id)a6
{
  id v11;
  id v12;
  id v13;
  UIDraggingBeginningSessionConfiguration *v14;
  UIDraggingBeginningSessionConfiguration *v15;
  void **p_items;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _DUITargetLayerDescriptor *v23;
  void *v24;
  void *v25;
  void *v26;
  UIDraggingSystemTouchRoutingPolicy *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  __CFString *v32;
  __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v39;
  id v40;
  _QWORD v41[4];
  id v42;
  objc_super v43;
  __CFString *v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v43.receiver = self;
  v43.super_class = (Class)UIDraggingBeginningSessionConfiguration;
  v14 = -[UIDraggingBeginningSessionConfiguration init](&v43, sel_init);
  v15 = v14;
  if (v14)
  {
    v40 = v11;
    p_items = (void **)&v14->_items;
    objc_storeStrong((id *)&v14->_items, a3);
    v15->_dataOwner = a4;
    objc_storeStrong((id *)&v15->_sourceView, a6);
    objc_msgSend(v13, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_window");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "windowScene");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "_sceneIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDraggingSessionConfiguration setSceneIdentifier:](v15, "setSceneIdentifier:", v20);

    objc_msgSend(v19, "session");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "persistentIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDraggingSessionConfiguration setPersistentSceneIdentifier:](v15, "setPersistentSceneIdentifier:", v22);

    v23 = objc_alloc_init(_DUITargetLayerDescriptor);
    objc_msgSend(v17, "context");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DUITargetLayerDescriptor setContextID:](v23, "setContextID:", objc_msgSend(v24, "contextId"));

    -[_DUITargetLayerDescriptor setRenderID:](v23, "setRenderID:", CALayerGetRenderId());
    objc_msgSend(v19, "systemShellHostingEnvironment");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "systemShellHostingSpaceIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DUITargetLayerDescriptor setSystemShellHostingSpaceIdentifier:](v23, "setSystemShellHostingSpaceIdentifier:", v26);

    -[UIDraggingSessionConfiguration setCoordinateSpaceSourceLayerContext:](v15, "setCoordinateSpaceSourceLayerContext:", v23);
    -[UIDraggingSessionConfiguration setSupportsSystemDrag:](v15, "setSupportsSystemDrag:", 1);
    v27 = objc_alloc_init(UIDraggingSystemTouchRoutingPolicy);
    if (objc_msgSend(v12, "count"))
    {
      objc_msgSend(v13, "_screen");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "displayConfiguration");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "hardwareIdentifier");
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = (void *)v30;
      v32 = _UIDraggingSystemEmbeddedDisplayIdentifier;
      if (v30)
        v32 = (__CFString *)v30;
      v39 = v19;
      v33 = v32;

      p_items = (void **)&v15->_items;
      v44 = v33;
      v45[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = v39;
      -[UIDraggingSystemTouchRoutingPolicy setContextIDsToAlwaysSendTouchesByDisplayIdentifier:](v27, "setContextIDsToAlwaysSendTouchesByDisplayIdentifier:", v34);

    }
    -[UIDraggingSessionConfiguration setRoutingPolicy:](v15, "setRoutingPolicy:", v27);

    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = *p_items;
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __97__UIDraggingBeginningSessionConfiguration_initWithItems_dataOwner_requiredContextIds_sourceView___block_invoke;
    v41[3] = &unk_1E16E4FC0;
    v37 = v35;
    v42 = v37;
    objc_msgSend(v36, "enumerateObjectsUsingBlock:", v41);
    if (objc_msgSend(v37, "count"))
      -[UIDraggingSessionConfiguration setPreferredPreviewIndexes:](v15, "setPreferredPreviewIndexes:", v37);

    v11 = v40;
  }

  return v15;
}

void __97__UIDraggingBeginningSessionConfiguration_initWithItems_dataOwner_requiredContextIds_sourceView___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "_targetedLiftPreview");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v10, "_targetedLiftPreview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_duiPreview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "preferredStackOrder");

    if ((v9 & 0x8000000000000000) == 0)
      objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
  }

}

+ (UIDraggingBeginningSessionConfiguration)configurationWithItems:(id)a3 dataOwner:(int64_t)a4 touches:(id)a5 requiredContextIds:(id)a6 sourceView:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v30 = v12;
  v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithItems:dataOwner:requiredContextIds:sourceView:", v12, a4, v14, v15);
  v17 = (void *)objc_opt_new();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v18 = v13;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v32;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v32 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v22), "_touchIdentifier"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v20);
  }

  objc_msgSend(v16, "setTouchIDs:", v17);
  objc_msgSend(v15, "window");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "_convertPointFromSceneReferenceSpace:", _CentroidOfTouches(v18, 0));
  v26 = v25;
  v28 = v27;

  objc_msgSend(v16, "setInitialCentroidInSourceWindow:", v26, v28, 0.0);
  objc_msgSend(v16, "set_initialCentroid:", _CentroidOfTouchesInView(v18, v15));

  return (UIDraggingBeginningSessionConfiguration *)v16;
}

+ (UIDraggingBeginningSessionConfiguration)configurationWithItems:(id)a3 dataOwner:(int64_t)a4 initialCentroidInSourceWindow:(CAPoint3D)a5 requiredContextIds:(id)a6 sourceView:(id)a7 accessibilityEndpoint:(id)a8
{
  double z;
  double y;
  double x;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;

  z = a5.z;
  y = a5.y;
  x = a5.x;
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a3;
  v20 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithItems:dataOwner:requiredContextIds:sourceView:", v19, a4, v18, v17);

  objc_msgSend(v20, "setAxEndpoint:", v16);
  objc_msgSend(v20, "setInitialCentroidInSourceWindow:", x, y, z);
  objc_msgSend(v17, "window");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "convertPoint:fromView:", v21, x, y);
  v23 = v22;
  v25 = v24;

  objc_msgSend(v20, "set_initialCentroid:", v23, v25, 0.0);
  return (UIDraggingBeginningSessionConfiguration *)v20;
}

+ (UIDraggingBeginningSessionConfiguration)configurationWithItems:(id)a3 dataOwner:(int64_t)a4 pointerTouch:(id)a5 requiredContextIds:(id)a6 sourceView:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a3;
  v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithItems:dataOwner:requiredContextIds:sourceView:", v15, a4, v13, v12);

  objc_msgSend(v16, "setInitiatedWithPointer:", 1);
  objc_msgSend(v12, "window");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = _CentroidOfTouches(v18, 0);
  v21 = v20;

  objc_msgSend(v17, "_convertPointFromSceneReferenceSpace:", v19, v21);
  v23 = v22;
  v25 = v24;

  objc_msgSend(v16, "setInitialCentroidInSourceWindow:", v23, v25, 0.0);
  v33 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = _CentroidOfTouchesInView(v26, v12);
  v29 = v28;
  v31 = v30;

  objc_msgSend(v16, "set_initialCentroid:", v27, v29, v31);
  return (UIDraggingBeginningSessionConfiguration *)v16;
}

+ (UIDraggingBeginningSessionConfiguration)configurationWithItems:(id)a3 initialCentroidInSourceWindow:(CAPoint3D)a4 sourceView:(id)a5
{
  double z;
  double y;
  double x;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _DUITargetLayerDescriptor *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;

  z = a4.z;
  y = a4.y;
  x = a4.x;
  v10 = a5;
  v11 = a3;
  objc_msgSend(v10, "_window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "windowScene");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc((Class)a1);
  v15 = (void *)objc_msgSend(v14, "initWithItems:dataOwner:requiredContextIds:sourceView:", v11, 1, MEMORY[0x1E0C9AA60], v10);

  objc_msgSend(v15, "setInitialCentroidInSourceWindow:", x, y, z);
  v16 = objc_alloc_init(_DUITargetLayerDescriptor);
  objc_msgSend(v10, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "context");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DUITargetLayerDescriptor setContextID:](v16, "setContextID:", objc_msgSend(v18, "contextId"));

  objc_msgSend(v10, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DUITargetLayerDescriptor setRenderID:](v16, "setRenderID:", CALayerGetRenderId());

  objc_msgSend(v13, "systemShellHostingEnvironment");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "systemShellHostingSpaceIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DUITargetLayerDescriptor setSystemShellHostingSpaceIdentifier:](v16, "setSystemShellHostingSpaceIdentifier:", v21);

  objc_msgSend(v15, "setCoordinateSpaceSourceLayerContext:", v16);
  objc_msgSend(v13, "_sceneIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSceneIdentifier:", v22);

  objc_msgSend(v13, "session");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "persistentIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPersistentSceneIdentifier:", v24);

  objc_msgSend(v15, "setInitiatedWithPointer:", 1);
  objc_msgSend(v15, "setSupportsSystemDrag:", 1);
  objc_msgSend(v15, "setInitialCentroidInSourceWindow:", x, y, z);
  objc_msgSend(v15, "setWantsPresentationUpdates:", 1);
  objc_msgSend(v10, "window");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "convertPoint:fromView:", v25, x, y);
  v27 = v26;
  v29 = v28;

  objc_msgSend(v15, "set_initialCentroid:", v27, v29, 0.0);
  return (UIDraggingBeginningSessionConfiguration *)v15;
}

- (int64_t)dataOwner
{
  return self->_dataOwner;
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
}

@end
