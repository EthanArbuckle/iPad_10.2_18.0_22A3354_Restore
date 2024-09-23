@implementation RBSStateCaptureSetSegment

- (unint64_t)count
{
  return -[NSMutableSet count](self->_items, "count");
}

- (void)addItem:(id)a3 withLength:(unint64_t)a4
{
  -[NSMutableSet addObject:](self->_items, "addObject:", a3, a4);
}

- (RBSStateCaptureSetSegment)init
{
  RBSStateCaptureSetSegment *v2;
  uint64_t v3;
  NSMutableSet *items;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  RBSInvalidatable *invalidatable;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)RBSStateCaptureSetSegment;
  v2 = -[RBSStateCaptureSetSegment init](&v15, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    items = v2->_items;
    v2->_items = (NSMutableSet *)v3;

    objc_initWeak(&location, v2);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __33__RBSStateCaptureSetSegment_init__block_invoke;
    v12[3] = &unk_24DD471C0;
    objc_copyWeak(&v13, &location);
    v5 = (void *)MEMORY[0x22074BF04](v12);
    v6 = segmentUniqueID++;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("RBSStateCaptureSet Segment %d"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(17, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _RBLogAddStateCaptureBlockWithTitle(v8, v7, v5);
    v9 = objc_claimAutoreleasedReturnValue();
    invalidatable = v2->_invalidatable;
    v2->_invalidatable = (RBSInvalidatable *)v9;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (BOOL)containsItem:(id)a3
{
  return -[NSMutableSet containsObject:](self->_items, "containsObject:", a3);
}

- (void)removeItem:(id)a3
{
  -[NSMutableSet removeObject:](self->_items, "removeObject:", a3);
}

- (void)dealloc
{
  objc_super v3;

  -[RBSInvalidatable invalidate](self->_invalidatable, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)RBSStateCaptureSetSegment;
  -[RBSStateCaptureSetSegment dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_invalidatable, 0);
}

- (NSSet)items
{
  return (NSSet *)self->_items;
}

__CFString *__33__RBSStateCaptureSetSegment_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  __CFString *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_stateCapture");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_24DD48378;
  }

  return v3;
}

- (id)_stateCapture
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock(&_stateCaptureLock);
  v3 = (void *)-[NSMutableSet copy](self->_items, "copy");
  os_unfair_lock_unlock(&_stateCaptureLock);
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "captureState", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendString:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

@end
