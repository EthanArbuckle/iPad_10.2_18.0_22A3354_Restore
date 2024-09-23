@implementation _UIViewAnimatablePropertyTransformer

- (void)presentationValueUpdatedForProgress:(id)a3
{
  _UIViewAnimatablePropertyTransformer *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;

  v4 = self;
  v5 = a3;
  -[_UIViewAnimatablePropertyTransformer runningProgresses](v4, "runningProgresses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v5);

  -[_UIViewAnimatablePropertyTransformer presentationValueChangedCallback](v4, "presentationValueChangedCallback");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v4->_presentationValueCallbackRan && v7)
  {
    v4->_presentationValueCallbackRan = 1;
    v9 = MEMORY[0x1E0C809B0];
    if (v4->_unsafe)
    {
      __UIVIEWANIMATABLEPROPERTYTRANSFORMER_IS_EXECUTING_CALLBACK__((uint64_t)v7);
    }
    else
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __76___UIViewAnimatablePropertyTransformer_presentationValueUpdatedForProgress___block_invoke;
      v15[3] = &unk_1E16B1BF8;
      v16 = v7;
      +[UIView _collectedViewPresentationPropertiesByPerforming:]((uint64_t)UIView, v15);
      v13[0] = v9;
      v13[1] = 3221225472;
      v13[2] = __76___UIViewAnimatablePropertyTransformer_presentationValueUpdatedForProgress___block_invoke_2;
      v13[3] = &unk_1E16B1B50;
      v13[4] = v4;
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v10 = v14;
      -[_UIViewAnimatablePropertyTransformer performWithLock:](v4, "performWithLock:", v13);

    }
    +[UIViewInProcessAnimationManager sharedManager](UIViewInProcessAnimationManager, "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __76___UIViewAnimatablePropertyTransformer_presentationValueUpdatedForProgress___block_invoke_3;
    v12[3] = &unk_1E16B1B28;
    v12[4] = v4;
    objc_msgSend(v11, "performAfterTick:", v12);

  }
}

- (void)performWithLock:(id)a3
{
  dispatch_sync((dispatch_queue_t)self->_lockingQueue, a3);
}

- (NSMutableSet)runningProgresses
{
  return self->_runningProgresses;
}

- (id)presentationValueChangedCallback
{
  return self->_presentationValueChangedCallback;
}

- (void)presentationValueStabilizedForProgress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  -[_UIViewAnimatablePropertyTransformer runningProgresses](self, "runningProgresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  -[_UIViewAnimatablePropertyTransformer runningProgresses](self, "runningProgresses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
  {
    -[_UIViewAnimatablePropertyTransformer presentationValueChangedCallback](self, "presentationValueChangedCallback");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = MEMORY[0x1E0C809B0];
    if (self->_unsafe)
    {
      if (v8)
        __UIVIEWANIMATABLEPROPERTYTRANSFORMER_IS_EXECUTING_CALLBACK__((uint64_t)v8);
      v11 = 0;
    }
    else
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __79___UIViewAnimatablePropertyTransformer_presentationValueStabilizedForProgress___block_invoke;
      v15[3] = &unk_1E16B1BF8;
      v16 = v8;
      +[UIView _collectedViewPresentationPropertiesByPerforming:]((uint64_t)UIView, v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __79___UIViewAnimatablePropertyTransformer_presentationValueStabilizedForProgress___block_invoke_2;
    v13[3] = &unk_1E16B1B50;
    v13[4] = self;
    v14 = v11;
    v12 = v11;
    -[_UIViewAnimatablePropertyTransformer performWithLock:](self, "performWithLock:", v13);

  }
}

- (id)modelValueChangedCallback
{
  return self->_modelValueChangedCallback;
}

- (void)modelValueUpdatedForProgress:(id)a3
{
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  id v7;
  _QWORD v8[5];

  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69___UIViewAnimatablePropertyTransformer_modelValueUpdatedForProgress___block_invoke;
  v8[3] = &unk_1E16B1B28;
  v8[4] = self;
  +[UIView _collectedViewPropertiesByPerforming:]((uint64_t)UIView, v8);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __69___UIViewAnimatablePropertyTransformer_modelValueUpdatedForProgress___block_invoke_2;
  v6[3] = &unk_1E16B1B50;
  v6[4] = self;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = v7;
  -[_UIViewAnimatablePropertyTransformer performWithLock:](self, "performWithLock:", v6);

}

- (_UICompoundObjectMap)capturedProperties
{
  return self->_capturedProperties;
}

- (BOOL)clearsCapturesPropertiesOnStabilization
{
  return self->_clearsCapturesPropertiesOnStabilization;
}

- (_UIViewAnimatablePropertyTransformer)initWithInputAnimatableProperties:(id)a3 presentationValueChangedCallback:(id)a4
{
  id v6;
  id v7;
  dispatch_queue_t v8;
  NSObject *v9;
  id v10;
  void *v11;
  _UIViewAnimatablePropertyTransformer *v12;
  _QWORD aBlock[4];
  NSObject *v15;
  id v16;
  _QWORD *v17;
  _QWORD v18[3];
  char v19;

  v6 = a3;
  v7 = a4;
  v8 = dispatch_queue_create("com.apple.UIKit.inProcessAnimation.Transformer.callbackLock", 0);
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v19 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __107___UIViewAnimatablePropertyTransformer_initWithInputAnimatableProperties_presentationValueChangedCallback___block_invoke;
  aBlock[3] = &unk_1E16C13C0;
  v9 = v8;
  v15 = v9;
  v17 = v18;
  v10 = v7;
  v16 = v10;
  v11 = _Block_copy(aBlock);
  v12 = -[_UIViewAnimatablePropertyTransformer initWithInputAnimatableProperties:unsafe:modelValueSetter:presentationValueSetter:stabilizedCallback:](self, "initWithInputAnimatableProperties:unsafe:modelValueSetter:presentationValueSetter:stabilizedCallback:", v6, 0, 0, v11, v11);

  _Block_object_dispose(v18, 8);
  return v12;
}

- (_UIViewAnimatablePropertyTransformer)initWithInputAnimatableProperties:(id)a3 unsafe:(BOOL)a4 modelValueSetter:(id)a5 presentationValueSetter:(id)a6 stabilizedCallback:(id)a7 allowsProgressAnimatableProperties:(BOOL)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  _UIViewAnimatablePropertyTransformer *v19;
  _UIViewAnimatablePropertyTransformer *v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *lockingQueue;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  SEL v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v39.receiver = self;
  v39.super_class = (Class)_UIViewAnimatablePropertyTransformer;
  v19 = -[_UIViewAnimatablePropertyTransformer init](&v39, sel_init);
  v20 = v19;
  if (v19)
  {
    v33 = a2;
    v34 = v16;
    v19->_unsafe = a4;
    v21 = dispatch_queue_create("com.apple.UIKit.inProcessAnimation.Transformer.accessQueue", 0);
    lockingQueue = v20->_lockingQueue;
    v20->_lockingQueue = (OS_dispatch_queue *)v21;

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v23 = v15;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v36;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v36 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v27);
          if (!a8)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", v33, v20, CFSTR("_UIViewAnimatablePropertyTransformer.m"), 43, CFSTR("An instance of UIViewProgressAnimatableProperty may not be passed into a transformer. Consider using an UIViewFloatAnimatableProperty instead."));

            }
          }
          objc_msgSend(v28, "setTransformer:", v20);
          ++v27;
        }
        while (v25 != v27);
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v25);
    }

    v16 = v34;
    -[_UIViewAnimatablePropertyTransformer setModelValueChangedCallback:](v20, "setModelValueChangedCallback:", v34);
    -[_UIViewAnimatablePropertyTransformer setPresentationValueChangedCallback:](v20, "setPresentationValueChangedCallback:", v17);
    -[_UIViewAnimatablePropertyTransformer setStabilizedCallback:](v20, "setStabilizedCallback:", v18);
    v29 = (void *)objc_opt_new();
    -[_UIViewAnimatablePropertyTransformer setRunningProgresses:](v20, "setRunningProgresses:", v29);

    v30 = (void *)objc_opt_new();
    -[_UIViewAnimatablePropertyTransformer setCapturedProperties:](v20, "setCapturedProperties:", v30);

    -[_UIViewAnimatablePropertyTransformer setClearsCapturesPropertiesOnStabilization:](v20, "setClearsCapturesPropertiesOnStabilization:", 1);
  }

  return v20;
}

- (void)setStabilizedCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setRunningProgresses:(id)a3
{
  objc_storeStrong((id *)&self->_runningProgresses, a3);
}

- (void)setPresentationValueChangedCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setModelValueChangedCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setClearsCapturesPropertiesOnStabilization:(BOOL)a3
{
  self->_clearsCapturesPropertiesOnStabilization = a3;
}

- (void)setCapturedProperties:(id)a3
{
  objc_storeStrong((id *)&self->_capturedProperties, a3);
}

- (_UIViewAnimatablePropertyTransformer)initWithInputAnimatableProperties:(id)a3 unsafe:(BOOL)a4 modelValueSetter:(id)a5 presentationValueSetter:(id)a6 stabilizedCallback:(id)a7
{
  return -[_UIViewAnimatablePropertyTransformer initWithInputAnimatableProperties:unsafe:modelValueSetter:presentationValueSetter:stabilizedCallback:allowsProgressAnimatableProperties:](self, "initWithInputAnimatableProperties:unsafe:modelValueSetter:presentationValueSetter:stabilizedCallback:allowsProgressAnimatableProperties:", a3, a4, a5, a6, a7, 0);
}

- (_UIViewAnimatablePropertyTransformer)initWithInputAnimatableProperties:(id)a3 unsafe:(BOOL)a4 modelValueSetter:(id)a5 presentationValueSetter:(id)a6
{
  return -[_UIViewAnimatablePropertyTransformer initWithInputAnimatableProperties:unsafe:modelValueSetter:presentationValueSetter:stabilizedCallback:](self, "initWithInputAnimatableProperties:unsafe:modelValueSetter:presentationValueSetter:stabilizedCallback:", a3, a4, a5, a6, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningProgresses, 0);
  objc_storeStrong((id *)&self->_capturedProperties, 0);
  objc_storeStrong(&self->_stabilizedCallback, 0);
  objc_storeStrong(&self->_presentationValueChangedCallback, 0);
  objc_storeStrong(&self->_modelValueChangedCallback, 0);
  objc_storeStrong((id *)&self->_lockingQueue, 0);
}

- (_UIViewAnimatablePropertyTransformer)initWithProgressAnimatableProperty:(id)a3 modelValueSetter:(id)a4 presentationValueSetter:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _UIViewAnimatablePropertyTransformer *v13;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", &v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[_UIViewAnimatablePropertyTransformer initWithInputAnimatableProperties:unsafe:modelValueSetter:presentationValueSetter:stabilizedCallback:allowsProgressAnimatableProperties:](self, "initWithInputAnimatableProperties:unsafe:modelValueSetter:presentationValueSetter:stabilizedCallback:allowsProgressAnimatableProperties:", v12, 0, v10, v9, 0, 1, v15, v16);
  return v13;
}

- (id)stabilizedCallback
{
  return self->_stabilizedCallback;
}

@end
