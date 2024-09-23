@implementation _UIInternalDraggingSessionSource

- (id)touchRoutingPolicy
{
  return -[UIDraggingSessionConfiguration routingPolicy](self->_configuration, "routingPolicy");
}

- (BOOL)touchRoutingPolicyContainsContextIDToAlwaysSend:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = *(_QWORD *)&a3;
  -[_UIDraggingImageSlotOwner dragManager](self, "dragManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "screen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hardwareIdentifier");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = _UIDraggingSystemEmbeddedDisplayIdentifier;
  if (v8)
    v10 = (__CFString *)v8;
  v11 = v10;

  -[UIDraggingSessionConfiguration routingPolicy](self->_configuration, "routingPolicy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contextIDsToAlwaysSendTouchesByDisplayIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v12) = objc_msgSend(v14, "containsObject:", v15);

  return (char)v12;
}

- (_UIInternalDraggingSessionSource)initWithDragManager:(id)a3 configuration:(id)a4
{
  id v7;
  _UIInternalDraggingSessionSource *v8;
  _UIInternalDraggingSessionSource *v9;
  void *v10;
  uint64_t v11;
  NSArray *internalItems;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  UIWindow *centroidWindow;
  double v19;
  double v20;
  double v21;
  double z;
  objc_super v24;

  v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)_UIInternalDraggingSessionSource;
  v8 = -[_UIDraggingImageSlotOwner initWithDragManager:](&v24, sel_initWithDragManager_, a3);
  v9 = v8;
  if (v8)
  {
    v8->_state = 0;
    objc_storeStrong((id *)&v8->_configuration, a4);
    objc_msgSend(v7, "items");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    internalItems = v9->_internalItems;
    v9->_internalItems = (NSArray *)v11;

    v9->_dataOwner = objc_msgSend(v7, "dataOwner");
    +[_UIKitDragAndDropStatistics incrementUIKitScalarValueBy:forKey:](_UIKitDragAndDropStatistics, "incrementUIKitScalarValueBy:forKey:", 1, CFSTR("dragStarted"));
    +[_UIKitDragAndDropStatistics incrementUIKitScalarValueForKnownInternalAppsForKey:bundleID:](_UIKitDragAndDropStatistics, "incrementUIKitScalarValueForKnownInternalAppsForKey:bundleID:", CFSTR("dragStartedFrom"), 0);
    if (_UIApplicationIsExtension())
      +[_UIKitDragAndDropStatistics incrementUIKitScalarValueBy:forKey:](_UIKitDragAndDropStatistics, "incrementUIKitScalarValueBy:forKey:", 1, CFSTR("dragStartedFromExtension"));
    +[_UIKitDragAndDropStatistics recordUIKitDragAndDropDistributionValue:forKey:](_UIKitDragAndDropStatistics, "recordUIKitDragAndDropDistributionValue:forKey:", CFSTR("itemsPickedUp"), (double)-[NSArray count](v9->_internalItems, "count"));
    _UIDragStatisticLogItemsInDragByType(v9->_internalItems, CFSTR("itemsPickedUpByType"));
    objc_msgSend(v7, "sourceView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "window");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_originatedInHostedWindow = objc_msgSend(v14, "_isHostedInAnotherProcess");

    if (v9->_originatedInHostedWindow)
    {
      v9->_hostIsActive = 1;
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObserver:selector:name:object:", v9, sel__hostWillBecomeActive, 0x1E1784AC0, 0);
      objc_msgSend(v15, "addObserver:selector:name:object:", v9, sel__hostDidDeactivate, 0x1E1784AE0, 0);

    }
    objc_msgSend(v7, "sourceView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "window");
    v17 = objc_claimAutoreleasedReturnValue();
    centroidWindow = v9->_centroidWindow;
    v9->_centroidWindow = (UIWindow *)v17;

    objc_msgSend(v7, "initialCentroidInSourceWindow");
    v9->_centroid.x = v19;
    v9->_centroid.y = v20;
    v9->_centroid.z = v21;
    v9->_restrictedToSourceApp = objc_msgSend(v7, "sessionIsRestrictedToSourceApplication");
    z = v9->_centroid.z;
    *(_OWORD *)&v9->_lastNotifiedCentroid.x = *(_OWORD *)&v9->_centroid.x;
    v9->_lastNotifiedCentroid.z = z;
  }

  return v9;
}

- (void)setState:(int64_t)a3
{
  unint64_t state;
  unint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  state = self->_state;
  if (state != a3)
  {
    self->_state = a3;
    v6 = setState____s_category;
    if (!setState____s_category)
    {
      v6 = __UILogCategoryGetNode("Dragging", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&setState____s_category);
    }
    v7 = *(NSObject **)(v6 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      stringFromDraggingSessionSourceState(state);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      stringFromDraggingSessionSourceState(a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = v9;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "_UIInternalDraggingSessionSource: Drag session state changing from %@ to %@", (uint8_t *)&v15, 0x16u);

    }
    switch(a3)
    {
      case 2:
        -[_UIInternalDraggingSessionSource _sendWillBegin](self, "_sendWillBegin");
        -[_UIInternalDraggingSessionSource _getOperationMaskFromDelegate](self, "_getOperationMaskFromDelegate");
        break;
      case 3:
      case 6:
        -[_UIInternalDraggingSessionSource _endWithOperation:](self, "_endWithOperation:", 0);
        -[_UIDraggingImageSlotOwner dragManager](self, "dragManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "sessionSourceDidEnd:", self);

        break;
      case 4:
        -[_UIInternalDraggingSessionSource _endWithOperation:](self, "_endWithOperation:", -[_UIInternalDraggingSessionSource resultOperation](self, "resultOperation"));
        +[_UIKitDragAndDropStatistics recordUIKitDragAndDropDistributionValue:forKey:](_UIKitDragAndDropStatistics, "recordUIKitDragAndDropDistributionValue:forKey:", CFSTR("itemsDroppedSuccessfully"), (double)-[NSArray count](self->_internalItems, "count"));
        _UIDragStatisticLogItemsInDragByType(self->_internalItems, CFSTR("itemsDroppedSuccessfullyByType"));
        v12 = CFSTR("dropSuccessful");
        v13 = CFSTR("dropSuccessfullFrom");
        goto LABEL_11;
      case 5:
        -[_UIInternalDraggingSessionSource _endWithOperation:](self, "_endWithOperation:", 0);
        -[_UIDraggingImageSlotOwner dragManager](self, "dragManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "sessionSourceDidEnd:", self);

        v12 = CFSTR("dropCancelled");
        v13 = CFSTR("dropCancelledFrom");
LABEL_11:
        +[_UIKitDragAndDropStatistics incrementUIKitScalarValueForKnownInternalAppsForKey:bundleID:](_UIKitDragAndDropStatistics, "incrementUIKitScalarValueForKnownInternalAppsForKey:bundleID:", v13, 0);
        +[_UIKitDragAndDropStatistics incrementUIKitScalarValueBy:forKey:](_UIKitDragAndDropStatistics, "incrementUIKitScalarValueBy:forKey:", 1, v12);
        +[_UIKitDragAndDropStatistics recordUIKitDragAndDropDistributionValue:forKey:](_UIKitDragAndDropStatistics, "recordUIKitDragAndDropDistributionValue:forKey:", CFSTR("itemsTotalInDragSession"), (double)-[NSArray count](self->_internalItems, "count"));
        _UIDragStatisticLogItemsInDragByType(self->_internalItems, CFSTR("itemsTotalInDragSessionByType"));
        break;
      default:
        return;
    }
  }
}

- (BOOL)preventsSimultaneousDragFromView:(id)a3
{
  id v4;
  id v5;
  BOOL v6;

  v4 = a3;
  -[_UIInternalDraggingSessionSource sourceView](self, "sourceView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v5 == v4 && -[_UIInternalDraggingSessionSource state](self, "state") < 3;
  return v6;
}

- (BOOL)prefersFullSizePreview
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[_UIInternalDraggingSessionSource delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[_UIInternalDraggingSessionSource delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "draggingSessionPrefersFullSizePreviews:", self);

  return v6;
}

- (BOOL)dynamicallyUpdatesPrefersFullSizePreviews
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[_UIInternalDraggingSessionSource delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  -[_UIInternalDraggingSessionSource delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "draggingSessionDynamicallyUpdatesPrefersFullSizePreviews:", self);

  return v6;
}

- (void)enumerateItemsUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_UIInternalDraggingSessionSource internalItems](self, "internalItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  enumerateDraggingItems(v5, v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[_UIInternalDraggingSessionSource itemsBecameDirty:](self, "itemsBecameDirty:", v6);
}

- (CGPoint)draggingLocationInCoordinateSpace:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("coordinateSpace must be non-nil"));
  -[_UIInternalDraggingSessionSource centroid](self, "centroid");
  v6 = v5;
  v8 = v7;
  -[_UIInternalDraggingSessionSource centroidWindow](self, "centroidWindow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9
    || (-[_UIInternalDraggingSessionSource weakCentroidWindow](self, "weakCentroidWindow"),
        (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    if (_IsKindOfUIView((uint64_t)v4))
      objc_msgSend(v9, "convertPoint:toView:", v4, v6, v8);
    else
      objc_msgSend(v9, "convertPoint:toCoordinateSpace:", v4, v6, v8);
    v12 = v10;
    v13 = v11;

  }
  else
  {
    v12 = *MEMORY[0x1E0C9D538];
    v13 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }

  v14 = v12;
  v15 = v13;
  result.y = v15;
  result.x = v14;
  return result;
}

- (unint64_t)draggingSourceOperationMask
{
  return self->_withinAppSourceOperationMask;
}

- (BOOL)_routingPolicyHasSpecificTouchContextIDs
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;

  -[_UIDraggingImageSlotOwner dragManager](self, "dragManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hardwareIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = _UIDraggingSystemEmbeddedDisplayIdentifier;
  if (v6)
    v8 = (__CFString *)v6;
  v9 = v8;

  -[UIDraggingSessionConfiguration routingPolicy](self->_configuration, "routingPolicy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contextIDsToAlwaysSendTouchesByDisplayIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v10) = objc_msgSend(v12, "count") != 0;
  return (char)v10;
}

- (void)beginDrag:(id)a3
{
  id v5;
  int v6;
  int64_t v7;
  NSObject *v8;
  int v9;
  void *v10;
  void *v11;
  _UIDruidSourceConnection *v12;
  UIDraggingBeginningSessionConfiguration *configuration;
  id v14;
  unint64_t v15;
  NSObject *v16;
  unint64_t v17;
  NSObject *v18;
  _QWORD v19[5];
  id v20;
  uint8_t buf[4];
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = dyld_program_sdk_at_least();
  v7 = -[_UIInternalDraggingSessionSource state](self, "state");
  if (v6)
  {
    if (!v7)
      goto LABEL_5;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject handleFailureInMethod:object:file:lineNumber:description:](v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDragging.m"), 820, CFSTR("can't begin a drag session from state %d"), -[_UIInternalDraggingSessionSource state](self, "state"));
    goto LABEL_14;
  }
  if (v7)
  {
    v15 = qword_1ECD774F0;
    if (!qword_1ECD774F0)
    {
      v15 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v15, (unint64_t *)&qword_1ECD774F0);
    }
    v16 = *(NSObject **)(v15 + 8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v8 = v16;
      *(_DWORD *)buf = 67109120;
      v22 = -[_UIInternalDraggingSessionSource state](self, "state");
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "can't begin a drag session from state %d", buf, 8u);
LABEL_14:

    }
  }
LABEL_5:
  v9 = dyld_program_sdk_at_least();
  -[_UIInternalDraggingSessionSource druidConnection](self, "druidConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDragging.m"), 821, CFSTR("shouldn't have a druid connection yet"));

    }
  }
  else if (v10)
  {
    v17 = qword_1ECD774F8;
    if (!qword_1ECD774F8)
    {
      v17 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v17, (unint64_t *)&qword_1ECD774F8);
    }
    v18 = *(NSObject **)(v17 + 8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_ERROR, "shouldn't have a druid connection yet", buf, 2u);
    }
  }
  -[_UIInternalDraggingSessionSource setState:](self, "setState:", 1);
  v12 = objc_alloc_init(_UIDruidSourceConnection);
  -[_UIInternalDraggingSessionSource setDruidConnection:](self, "setDruidConnection:", v12);
  configuration = self->_configuration;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __46___UIInternalDraggingSessionSource_beginDrag___block_invoke;
  v19[3] = &unk_1E16C44A8;
  v19[4] = self;
  v20 = v5;
  v14 = v5;
  -[_UIDruidSourceConnection beginDragWithConfiguration:completion:](v12, "beginDragWithConfiguration:completion:", configuration, v19);

}

- (void)_sendDragPreviewReplyWithIndexSet:(id)a3 dragPreviews:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)UIApp;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __94___UIInternalDraggingSessionSource__sendDragPreviewReplyWithIndexSet_dragPreviews_completion___block_invoke;
  v15[3] = &unk_1E16BE398;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  objc_msgSend(v11, "_performBlockAfterCATransactionCommits:", v15);

}

- (void)_didBeginDrag
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id location;

  -[_UIInternalDraggingSessionSource setState:](self, "setState:", 2);
  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __49___UIInternalDraggingSessionSource__didBeginDrag__block_invoke;
  v20[3] = &unk_1E16C44D0;
  objc_copyWeak(&v21, &location);
  -[_UIInternalDraggingSessionSource druidConnection](self, "druidConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDragPreviewProviderBlock:", v20);

  v18[0] = v3;
  v18[1] = 3221225472;
  v18[2] = __49___UIInternalDraggingSessionSource__didBeginDrag__block_invoke_2;
  v18[3] = &unk_1E16C44F8;
  objc_copyWeak(&v19, &location);
  -[_UIInternalDraggingSessionSource druidConnection](self, "druidConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUpdatedPresentationBlock:", v18);

  v16[0] = v3;
  v16[1] = 3221225472;
  v16[2] = __49___UIInternalDraggingSessionSource__didBeginDrag__block_invoke_3;
  v16[3] = &unk_1E16C4520;
  objc_copyWeak(&v17, &location);
  -[_UIInternalDraggingSessionSource druidConnection](self, "druidConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCanHandOffCancelledItemsBlock:", v16);

  v14[0] = v3;
  v14[1] = 3221225472;
  v14[2] = __49___UIInternalDraggingSessionSource__didBeginDrag__block_invoke_4;
  v14[3] = &unk_1E16C4548;
  objc_copyWeak(&v15, &location);
  -[_UIInternalDraggingSessionSource druidConnection](self, "druidConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHandOffCancelledItemsBlock:", v14);

  v12[0] = v3;
  v12[1] = 3221225472;
  v12[2] = __49___UIInternalDraggingSessionSource__didBeginDrag__block_invoke_5;
  v12[3] = &unk_1E16C4570;
  objc_copyWeak(&v13, &location);
  -[_UIInternalDraggingSessionSource druidConnection](self, "druidConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDragCompletionBlock:", v12);

  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __49___UIInternalDraggingSessionSource__didBeginDrag__block_invoke_6;
  v10[3] = &unk_1E16B3F40;
  objc_copyWeak(&v11, &location);
  -[_UIInternalDraggingSessionSource druidConnection](self, "druidConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDataTransferFinishedBlock:", v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (void)_getOperationMaskFromDelegate
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  id v6;

  -[_UIInternalDraggingSessionSource delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_withinAppSourceOperationMask = objc_msgSend(v3, "draggingSession:sourceOperationMaskForDraggingWithinApp:", self, 1);

  -[_UIInternalDraggingSessionSource delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_outsideAppSourceOperationMask = objc_msgSend(v4, "draggingSession:sourceOperationMaskForDraggingWithinApp:", self, 0);

  v5 = -[_UIInternalDraggingSessionSource prefersFullSizePreview](self, "prefersFullSizePreview");
  -[_UIInternalDraggingSessionSource druidConnection](self, "druidConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "takeInsideAppSourceOperationMask:outsideAppSourceOperationMask:prefersFullSizePreview:", self->_withinAppSourceOperationMask, self->_outsideAppSourceOperationMask, v5);

}

- (void)itemsBecameDirty:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "count") && -[_UIInternalDraggingSessionSource state](self, "state") == 2)
  {
    -[_UIInternalDraggingSessionSource druidConnection](self, "druidConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dirtyItems:", v5);

  }
}

- (void)updateCentroidFromDragEvent
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  UIWindow *v10;
  UIWindow *centroidWindow;
  __int128 v12;

  if (-[_UIInternalDraggingSessionSource state](self, "state") == 2)
  {
    -[_UIInternalDraggingSessionSource dragEvent](self, "dragEvent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[_UIInternalDraggingSessionSource dragEvent](self, "dragEvent");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "locationInView:", 0);
      v6 = v5;
      v8 = v7;

      self->_centroid.x = v6;
      self->_centroid.y = v8;
      self->_centroid.z = 0.0;
      -[_UIInternalDraggingSessionSource dragEvent](self, "dragEvent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "eventWindow");
      v10 = (UIWindow *)objc_claimAutoreleasedReturnValue();
      centroidWindow = self->_centroidWindow;
      self->_centroidWindow = v10;

    }
    if ((CAPoint3DEqualToPoint() & 1) == 0)
    {
      -[_UIInternalDraggingSessionSource _sendDidMove](self, "_sendDidMove");
      v12 = *(_OWORD *)&self->_centroid.x;
      self->_lastNotifiedCentroid.z = self->_centroid.z;
      *(_OWORD *)&self->_lastNotifiedCentroid.x = v12;
    }
  }
}

- (void)dragDidExitApp
{
  double v3;
  void *v4;
  NSTimer *v5;
  NSTimer *waitingToSendDidExitAppTimer;
  _QWORD v7[4];
  id v8;
  id location;

  if (-[_UIInternalDraggingSessionSource state](self, "state") == 2)
  {
    if (_UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_DraggingExitTimerDuration, (uint64_t)CFSTR("DraggingExitTimerDuration"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))v3 = 0.2;
    else
      v3 = *(double *)&qword_1EDDA7F60;
    objc_initWeak(&location, self);
    v4 = (void *)MEMORY[0x1E0C99E88];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __50___UIInternalDraggingSessionSource_dragDidExitApp__block_invoke;
    v7[3] = &unk_1E16B26E0;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v4, "scheduledTimerWithTimeInterval:repeats:block:", 0, v7, v3);
    v5 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    waitingToSendDidExitAppTimer = self->_waitingToSendDidExitAppTimer;
    self->_waitingToSendDidExitAppTimer = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)dragIsInsideApp
{
  NSTimer *waitingToSendDidExitAppTimer;

  -[NSTimer invalidate](self->_waitingToSendDidExitAppTimer, "invalidate");
  waitingToSendDidExitAppTimer = self->_waitingToSendDidExitAppTimer;
  self->_waitingToSendDidExitAppTimer = 0;

}

- (void)addPublicItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  PBItemCollection *v17;
  PBItemCollection *pbItemCollection;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_UIInternalDraggingSessionSource canAddItems](self, "canAddItems"))
  {
    v5 = (void *)objc_opt_new();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v4, "reverseObjectEnumerator", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v20;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v5, "addObject:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v8);
    }

    if (objc_msgSend(v5, "count"))
    {
      -[_UIInternalDraggingSessionSource internalItems](self, "internalItems");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");
      +[_UIKitDragAndDropStatistics incrementUIKitScalarValueBy:forKey:](_UIKitDragAndDropStatistics, "incrementUIKitScalarValueBy:forKey:", 1, CFSTR("itemsAddedToDrag"));
      if (v12)
      {
        if (v12 == 1)
          v13 = CFSTR("itemsAddedToSingleDrag");
        else
          v13 = CFSTR("itemsAddedToMultipleDrag");
        +[_UIKitDragAndDropStatistics incrementUIKitScalarValueBy:forKey:](_UIKitDragAndDropStatistics, "incrementUIKitScalarValueBy:forKey:", 1, v13);
      }

      -[_UIInternalDraggingSessionSource internalItems](self, "internalItems");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIInternalDraggingSessionSource setInternalItems:](self, "setInternalItems:", v15);

      -[_UIInternalDraggingSessionSource druidConnection](self, "druidConnection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addItems:withOldItemCollection:", v5, self->_pbItemCollection);
      v17 = (PBItemCollection *)objc_claimAutoreleasedReturnValue();
      pbItemCollection = self->_pbItemCollection;
      self->_pbItemCollection = v17;

      -[_UIInternalDraggingSessionSource _sendWillAddItems:](self, "_sendWillAddItems:", v4);
    }

  }
}

- (BOOL)_canHandOffCancelledItems:(id)a3
{
  _UIInternalDraggingSessionSource *v3;
  void *v4;

  v3 = self;
  -[_UIInternalDraggingSessionSource internalItems](self, "internalItems", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = +[_UIDragSetDownAnimation canAnimateItems:forSource:policyDriven:](_UIDragSetDownAnimation, "canAnimateItems:forSource:policyDriven:", v4, 1, -[_UIInternalDraggingSessionSource _routingPolicyHasSpecificTouchContextIDs](v3, "_routingPolicyHasSpecificTouchContextIDs"));

  return (char)v3;
}

- (void)_setupAnimationForCancelledItems:(id)a3 returningLayerContext:(id *)a4
{
  id v6;
  void (**v7)(_QWORD);
  _UIDragSetDownAnimation *v8;
  void *v9;
  _UIDragSetDownAnimation *v10;
  _UIDragSetDownAnimation *setDownAnimation;
  void *v12;
  void *v13;
  _DUITargetLayerDescriptor *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _DUITargetLayerDescriptor *v20;
  _QWORD aBlock[5];

  v6 = a3;
  -[_UIInternalDraggingSessionSource _sendWillEndWithOperation:](self, "_sendWillEndWithOperation:", 0);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __91___UIInternalDraggingSessionSource__setupAnimationForCancelledItems_returningLayerContext___block_invoke;
  aBlock[3] = &unk_1E16B1B28;
  aBlock[4] = self;
  v7 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (objc_msgSend(v6, "count"))
  {
    v8 = [_UIDragSetDownAnimation alloc];
    -[_UIInternalDraggingSessionSource internalItems](self, "internalItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[_UIDragSetDownAnimation initWithVisibleDroppedItems:items:forSource:policyDriven:completion:](v8, "initWithVisibleDroppedItems:items:forSource:policyDriven:completion:", v6, v9, 1, -[_UIInternalDraggingSessionSource _routingPolicyHasSpecificTouchContextIDs](self, "_routingPolicyHasSpecificTouchContextIDs"), v7);
    setDownAnimation = self->_setDownAnimation;
    self->_setDownAnimation = v10;

    if (a4)
    {
      -[_UIDragSetDownAnimation coordinateContainerWindow](self->_setDownAnimation, "coordinateContainerWindow");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = objc_alloc_init(_DUITargetLayerDescriptor);
      objc_msgSend(v13, "context");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DUITargetLayerDescriptor setContextID:](v14, "setContextID:", objc_msgSend(v15, "contextId"));

      -[_DUITargetLayerDescriptor setRenderID:](v14, "setRenderID:", CALayerGetRenderId());
      -[_UIDragSetDownAnimation coordinateContainerWindow](self->_setDownAnimation, "coordinateContainerWindow");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "windowScene");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "systemShellHostingEnvironment");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "systemShellHostingSpaceIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_DUITargetLayerDescriptor setSystemShellHostingSpaceIdentifier:](v14, "setSystemShellHostingSpaceIdentifier:", v19);

      v20 = objc_retainAutorelease(v14);
      *a4 = v20;

    }
  }
  else
  {
    v7[2](v7);
  }

}

- (void)_handOffCancelledItems:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "itemIndex");
        -[_UIInternalDraggingSessionSource internalItems](self, "internalItems");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "count");

        if (v10 < v12)
        {
          -[_UIInternalDraggingSessionSource internalItems](self, "internalItems");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectAtIndexedSubscript:", v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "_setVisibleDropItemSize:", visibleDroppedItemSize(v9));
          objc_msgSend(v9, "center");
          objc_msgSend(v14, "_setVisibleDropItemCenter:");

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }
  -[_UIDragSetDownAnimation updateVisibleDroppedItems:](self->_setDownAnimation, "updateVisibleDroppedItems:", v4);
  -[_UIDragSetDownAnimation begin](self->_setDownAnimation, "begin");

}

- (void)_endWithOperation:(unint64_t)a3
{
  UIWindow *centroidWindow;

  -[_UIInternalDraggingSessionSource _sendWillEndWithOperation:](self, "_sendWillEndWithOperation:");
  -[_UIInternalDraggingSessionSource _sendDidEndWithOperation:](self, "_sendDidEndWithOperation:", a3);
  objc_storeWeak((id *)&self->_weakCentroidWindow, self->_centroidWindow);
  centroidWindow = self->_centroidWindow;
  self->_centroidWindow = 0;

}

- (void)_sendWillEndWithOperation:(unint64_t)a3
{
  void *v5;
  char v6;
  id v7;

  if (!self->_sentWillEnd)
  {
    self->_sentWillEnd = 1;
    -[_UIInternalDraggingSessionSource delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[_UIInternalDraggingSessionSource delegate](self, "delegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "draggingSessionWillEnd:withOperation:", self, a3);

    }
  }
}

- (BOOL)shouldCancelOnAppDeactivation
{
  void *v2;
  uint64_t v3;
  int *v4;
  const __CFString *v5;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v4 = (int *)&_MergedGlobals_17;
    v5 = CFSTR("CancelOnDeactivationPad");
  }
  else
  {
    v4 = (int *)&unk_1ECD76198;
    v5 = CFSTR("CancelOnDeactivationPhone");
  }
  return (*((_BYTE *)v4 + 4) != 0) & ~_UIInternalPreferenceUsesDefault(v4, (uint64_t)v5, (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
}

- (void)cancelDrag
{
  id v3;

  if ((unint64_t)-[_UIInternalDraggingSessionSource state](self, "state") <= 2)
  {
    -[_UIInternalDraggingSessionSource druidConnection](self, "druidConnection");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelDrag");

  }
}

- (BOOL)canAddItems
{
  void *v3;
  int v4;

  if (-[_UIInternalDraggingSessionSource state](self, "state") == 2)
  {
    -[_UIInternalDraggingSessionSource druidConnection](self, "druidConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isCancelled") ^ 1;

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)isActive
{
  return -[_UIInternalDraggingSessionSource state](self, "state") < 3;
}

- (BOOL)didHandOffDragImage
{
  return self->_didHandOffDragImage;
}

- (void)_hostWillBecomeActive
{
  self->_hostIsActive = 1;
}

- (void)_hostDidDeactivate
{
  self->_hostIsActive = 0;
  if (-[_UIInternalDraggingSessionSource shouldCancelOnAppDeactivation](self, "shouldCancelOnAppDeactivation"))
    -[_UIInternalDraggingSessionSource cancelDrag](self, "cancelDrag");
}

- (void)_sendWillBegin
{
  void *v3;
  char v4;
  id v5;

  -[_UIInternalDraggingSessionSource delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[_UIInternalDraggingSessionSource delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "draggingSessionWillBegin:", self);

  }
}

- (void)_sendHandedOffDragImage
{
  void *v3;
  char v4;
  id v5;

  -[_UIInternalDraggingSessionSource delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[_UIInternalDraggingSessionSource delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_draggingSessionHandedOffDragImage:", self);

  }
}

- (void)_sendHandedOffDragImageForItem:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_UIInternalDraggingSessionSource delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[_UIInternalDraggingSessionSource delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_draggingSession:handedOffDragImageForItem:", self, v7);

  }
}

- (void)_sendWillAddItems:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_UIInternalDraggingSessionSource delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[_UIInternalDraggingSessionSource delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "draggingSession:willAddItems:", self, v7);

  }
}

- (void)_sendDidEndWithOperation:(unint64_t)a3
{
  void *v5;
  char v6;
  id v7;

  -[_UIInternalDraggingSessionSource delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[_UIInternalDraggingSessionSource delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "draggingSessionDidEnd:withOperation:", self, a3);

  }
}

- (void)_sendDidMove
{
  void *v3;
  char v4;
  id v5;

  -[_UIInternalDraggingSessionSource delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[_UIInternalDraggingSessionSource delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "draggingSessionDidMove:", self);

  }
}

- (void)_sendDataTransferFinished
{
  void *v3;
  char v4;
  id v5;

  -[_UIInternalDraggingSessionSource delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[_UIInternalDraggingSessionSource delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "draggingSessionDidTransferItems:", self);

  }
}

- (void)_updatedPresentation:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_UIInternalDraggingSessionSource delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[_UIInternalDraggingSessionSource delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_draggingSession:updatedPresentation:", self, v7);

  }
}

- (_UIDraggingSessionDelegate)delegate
{
  return (_UIDraggingSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIDragEvent)dragEvent
{
  return (UIDragEvent *)objc_loadWeakRetained((id *)&self->_dragEvent);
}

- (void)setDragEvent:(id)a3
{
  objc_storeWeak((id *)&self->_dragEvent, a3);
}

- (UIView)sourceView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_sourceView);
}

- (void)setSourceView:(id)a3
{
  objc_storeWeak((id *)&self->_sourceView, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (unint64_t)resultOperation
{
  return self->_resultOperation;
}

- (void)setResultOperation:(unint64_t)a3
{
  self->_resultOperation = a3;
}

- (NSArray)internalItems
{
  return self->_internalItems;
}

- (void)setInternalItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (int64_t)dataOwner
{
  return self->_dataOwner;
}

- (void)setDataOwner:(int64_t)a3
{
  self->_dataOwner = a3;
}

- (CAPoint3D)centroid
{
  double x;
  double y;
  double z;
  CAPoint3D result;

  x = self->_centroid.x;
  y = self->_centroid.y;
  z = self->_centroid.z;
  result.z = z;
  result.y = y;
  result.x = x;
  return result;
}

- (UIWindow)centroidWindow
{
  return self->_centroidWindow;
}

- (UIWindow)weakCentroidWindow
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_weakCentroidWindow);
}

- (unsigned)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (BOOL)restrictedToSourceApp
{
  return self->_restrictedToSourceApp;
}

- (unint64_t)withinAppSourceOperationMask
{
  return self->_withinAppSourceOperationMask;
}

- (unint64_t)outsideAppSourceOperationMask
{
  return self->_outsideAppSourceOperationMask;
}

- (_UIDruidSourceConnection)druidConnection
{
  return self->_druidConnection;
}

- (void)setDruidConnection:(id)a3
{
  objc_storeStrong((id *)&self->_druidConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_druidConnection, 0);
  objc_destroyWeak((id *)&self->_weakCentroidWindow);
  objc_storeStrong((id *)&self->_centroidWindow, 0);
  objc_storeStrong((id *)&self->_internalItems, 0);
  objc_destroyWeak((id *)&self->_sourceView);
  objc_destroyWeak((id *)&self->_dragEvent);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_waitingToSendDidExitAppTimer, 0);
  objc_storeStrong((id *)&self->_setDownAnimation, 0);
  objc_storeStrong((id *)&self->_touchRoutingPolicy, 0);
  objc_storeStrong((id *)&self->_pbItemCollection, 0);
}

@end
