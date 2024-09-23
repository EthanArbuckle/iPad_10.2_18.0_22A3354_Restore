@implementation PXGAXCoalescingResponder

- (void)setPauseEventDelivery:(BOOL)a3
{
  if (self->_pauseEventDelivery != a3)
  {
    self->_pauseEventDelivery = a3;
    if (!a3)
      -[PXGAXCoalescingResponder _distributeEvents](self, "_distributeEvents");
  }
}

- (BOOL)pauseEventDelivery
{
  return self->_pauseEventDelivery;
}

- (void)_distributeEvents
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_pendingAXEventBlocks, "count"))
  {
    v3 = (void *)-[NSMutableArray copy](self->_pendingAXEventBlocks, "copy");
    -[NSMutableArray removeAllObjects](self->_pendingAXEventBlocks, "removeAllObjects");
    -[PXGAXCoalescingResponder axNextResponder](self, "axNextResponder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      v5 = v3;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v11;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v11 != v8)
              objc_enumerationMutation(v5);
            (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9));
            ++v9;
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        }
        while (v7);
      }

    }
  }
}

- (void)axGroup:(id)a3 didChange:(unint64_t)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  unint64_t v15;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__PXGAXCoalescingResponder_axGroup_didChange_userInfo___block_invoke;
  v12[3] = &unk_1E512D740;
  v14 = v9;
  v15 = a4;
  v13 = v8;
  v10 = v9;
  v11 = v8;
  -[PXGAXCoalescingResponder _notifyResponder:](self, "_notifyResponder:", v12);

}

- (void)_notifyResponder:(id)a3
{
  void *v4;
  NSMutableArray *pendingAXEventBlocks;
  void *v6;
  id aBlock;

  aBlock = a3;
  -[PXGAXCoalescingResponder axNextResponder](self, "axNextResponder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (-[PXGAXCoalescingResponder pauseEventDelivery](self, "pauseEventDelivery"))
    {
      pendingAXEventBlocks = self->_pendingAXEventBlocks;
      v6 = _Block_copy(aBlock);
      -[NSMutableArray addObject:](pendingAXEventBlocks, "addObject:", v6);

    }
    else
    {
      (*((void (**)(id, void *))aBlock + 2))(aBlock, v4);
    }
  }

}

- (PXGAXResponder)axNextResponder
{
  return (PXGAXResponder *)objc_loadWeakRetained((id *)&self->axNextResponder);
}

- (void)setAxNextResponder:(id)a3
{
  objc_storeWeak((id *)&self->axNextResponder, a3);
}

- (id)axContainingScrollViewForAXGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXGAXCoalescingResponder axNextResponder](self, "axNextResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "axContainingScrollViewForAXGroup:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)axGroup:(id)a3 didRequestToPerformAction:(int64_t)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  -[PXGAXCoalescingResponder axNextResponder](self, "axNextResponder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v10, "axGroup:didRequestToPerformAction:userInfo:", v9, a4, v8);

  return a4;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->axNextResponder);
  objc_storeStrong((id *)&self->_pendingAXEventBlocks, 0);
}

uint64_t __55__PXGAXCoalescingResponder_axGroup_didChange_userInfo___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "axGroup:didChange:userInfo:", a1[4], a1[6], a1[5]);
}

@end
