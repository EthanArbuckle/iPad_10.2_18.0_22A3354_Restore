@implementation WBSQueryParameterFilteringDataQueue

- (void)addPendingDataWithAdjustedURL:(id)a3 originalURL:(id)a4
{
  id v6;
  WBSQueryParameterFilteringData *pendingData;
  WBSQueryParameterFilteringData *v8;
  WBSQueryParameterFilteringData *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  pendingData = self->_pendingData;
  if (!pendingData)
  {
    v8 = objc_alloc_init(WBSQueryParameterFilteringData);
    v9 = self->_pendingData;
    self->_pendingData = v8;

    pendingData = self->_pendingData;
  }
  -[WBSQueryParameterFilteringData addAdjustedURL:originalURL:](pendingData, "addAdjustedURL:originalURL:", v10, v6);
  -[WBSQueryParameterFilteringDataQueue _mergePendingDataSoon](self, "_mergePendingDataSoon");

}

- (void)clearPendingData
{
  WBSQueryParameterFilteringData *pendingData;

  pendingData = self->_pendingData;
  self->_pendingData = 0;

  -[WBSQueryParameterFilteringDataQueue _cancelMergingPendingData](self, "_cancelMergingPendingData");
}

- (void)commitPendingData
{
  WBSQueryParameterFilteringData *pendingData;

  objc_storeStrong((id *)&self->_currentData, self->_pendingData);
  pendingData = self->_pendingData;
  self->_pendingData = 0;

  -[WBSQueryParameterFilteringDataQueue _cancelMergingPendingData](self, "_cancelMergingPendingData");
}

- (void)transferPendingDataToQueue:(id)a3
{
  WBSQueryParameterFilteringData *pendingData;

  objc_storeStrong((id *)a3 + 1, self->_pendingData);
  pendingData = self->_pendingData;
  self->_pendingData = 0;

  -[WBSQueryParameterFilteringDataQueue _cancelMergingPendingData](self, "_cancelMergingPendingData");
}

- (void)_cancelMergingPendingData
{
  NSTimer *mergePendingDataTimer;

  -[NSTimer invalidate](self->_mergePendingDataTimer, "invalidate");
  mergePendingDataTimer = self->_mergePendingDataTimer;
  self->_mergePendingDataTimer = 0;

}

- (void)_mergePendingData
{
  WBSQueryParameterFilteringData *pendingData;
  WBSQueryParameterFilteringData **p_currentData;
  WBSQueryParameterFilteringData *v5;
  WBSQueryParameterFilteringData *currentData;
  WBSQueryParameterFilteringData *v7;

  pendingData = self->_pendingData;
  if (pendingData)
  {
    currentData = self->_currentData;
    p_currentData = &self->_currentData;
    v5 = currentData;
    if (currentData)
      -[WBSQueryParameterFilteringData addData:](v5, "addData:");
    else
      objc_storeStrong((id *)p_currentData, pendingData);
    v7 = self->_pendingData;
    self->_pendingData = 0;

  }
}

- (void)_mergePendingDataSoon
{
  void *v3;
  NSTimer *v4;
  NSTimer *mergePendingDataTimer;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  -[WBSQueryParameterFilteringDataQueue _cancelMergingPendingData](self, "_cancelMergingPendingData");
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0C99E88];
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __60__WBSQueryParameterFilteringDataQueue__mergePendingDataSoon__block_invoke;
  v10 = &unk_1E4B3E530;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v3, "timerWithTimeInterval:repeats:block:", 0, &v7, 1.0);
  v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  mergePendingDataTimer = self->_mergePendingDataTimer;
  self->_mergePendingDataTimer = v4;

  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop", v7, v8, v9, v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addTimer:forMode:", self->_mergePendingDataTimer, *MEMORY[0x1E0C99860]);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __60__WBSQueryParameterFilteringDataQueue__mergePendingDataSoon__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  void *v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_cancelMergingPendingData");
    v2 = objc_loadWeakRetained(v4 + 4);
    v3 = v2;
    if (!v2 || objc_msgSend(v2, "queryParameterFilteringDataQueueShouldMergePendingData:", v4))
      objc_msgSend(v4, "_mergePendingData");

    WeakRetained = v4;
  }

}

- (WBSQueryParameterFilteringData)currentData
{
  return self->_currentData;
}

- (WBSQueryParameterFilteringDataQueueDelegate)delegate
{
  return (WBSQueryParameterFilteringDataQueueDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentData, 0);
  objc_storeStrong((id *)&self->_mergePendingDataTimer, 0);
  objc_storeStrong((id *)&self->_pendingData, 0);
}

@end
