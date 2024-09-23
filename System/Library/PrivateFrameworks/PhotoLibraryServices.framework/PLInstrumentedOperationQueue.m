@implementation PLInstrumentedOperationQueue

- (PLInstrumentedOperationQueue)init
{
  PLInstrumentedOperationQueue *v2;
  PLInstrumentedOperationQueue *v3;
  PLInstrumentedOperationQueue *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLInstrumentedOperationQueue;
  v2 = -[PLInstrumentedOperationQueue init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PLInstrumentedOperationQueue addObserver:forKeyPath:options:context:](v2, "addObserver:forKeyPath:options:context:", v2, CFSTR("operationCount"), 1, &sOperationCountContext);
    v4 = v3;
  }

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[PLInstrumentedOperationQueue removeObserver:forKeyPath:](self, "removeObserver:forKeyPath:", self, CFSTR("operationCount"));
  v3.receiver = self;
  v3.super_class = (Class)PLInstrumentedOperationQueue;
  -[PLInstrumentedOperationQueue dealloc](&v3, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD);
  id v10;
  objc_super v11;

  if (a6 == &sOperationCountContext)
  {
    objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CB2CB8], a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedIntegerValue");

    -[PLInstrumentedOperationQueue pl_operationCountChangedBlock](self, "pl_operationCountChangedBlock");
    v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = v9;
      v9[2](v9, v8);
      v9 = (void (**)(_QWORD, _QWORD))v10;
    }

  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)PLInstrumentedOperationQueue;
    -[PLInstrumentedOperationQueue observeValueForKeyPath:ofObject:change:context:](&v11, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (id)pl_operationCountChangedBlock
{
  return objc_getProperty(self, a2, 512, 1);
}

- (void)setPl_operationCountChangedBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 512);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pl_operationCountChangedBlock, 0);
}

@end
