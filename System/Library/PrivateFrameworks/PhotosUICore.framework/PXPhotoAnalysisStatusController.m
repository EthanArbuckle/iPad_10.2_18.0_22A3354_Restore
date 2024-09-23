@implementation PXPhotoAnalysisStatusController

- (PXPhotoAnalysisStatusController)init
{
  PXPhotoAnalysisStatusController *v2;
  uint64_t v3;
  NSMutableArray *retryBlocks;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXPhotoAnalysisStatusController;
  v2 = -[PXPhotoAnalysisStatusController init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    retryBlocks = v2->__retryBlocks;
    v2->__retryBlocks = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)update
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  dispatch_time_t v8;
  _QWORD v9[5];
  _QWORD block[4];
  id v11;
  id location;

  -[PXPhotoAnalysisStatusController _initialUpdateDate](self, "_initialUpdateDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = MEMORY[0x1E0C809B0];
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotoAnalysisStatusController _setInitialUpdateDate:](self, "_setInitialUpdateDate:", v5);

    objc_initWeak(&location, self);
    +[PXModelSettings sharedInstance](PXModelSettings, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "photoAnalysisGraphInitialGraceDelay");
    v8 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __41__PXPhotoAnalysisStatusController_update__block_invoke;
    block[3] = &unk_1E5148D30;
    objc_copyWeak(&v11, &location);
    dispatch_after(v8, MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  -[PXPhotoAnalysisStatusController _requestGraphReady](self, "_requestGraphReady");
  -[PXPhotoAnalysisStatusController _requestGraphFractionCompleted](self, "_requestGraphFractionCompleted");
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __41__PXPhotoAnalysisStatusController_update__block_invoke_2;
  v9[3] = &unk_1E51479C8;
  v9[4] = self;
  -[PXPhotoAnalysisStatusController performChanges:](self, "performChanges:", v9);
}

- (void)registerRetryBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__PXPhotoAnalysisStatusController_registerRetryBlock___block_invoke;
  v6[3] = &unk_1E5144F20;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PXPhotoAnalysisStatusController performChanges:](self, "performChanges:", v6);

}

- (NSString)stateDescription
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  double v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXPhotoAnalysisStatusController graphStatus](self, "graphStatus");
  if (v4 > 3)
    v5 = CFSTR("?");
  else
    v5 = off_1E5145008[v4];
  objc_msgSend(v3, "appendFormat:", CFSTR("Graph Status: %@\n"), v5);
  -[PXPhotoAnalysisStatusController graphFractionCompleted](self, "graphFractionCompleted");
  objc_msgSend(v3, "appendFormat:", CFSTR("Graph Fraction Completed: %0.2f%%\n"), v6 * 100.0);
  -[PXPhotoAnalysisStatusController _graphError](self, "_graphError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Graph Error: %@\n"), v7);

  if (-[PXPhotoAnalysisStatusController _isWithinGracePeriod](self, "_isWithinGracePeriod"))
    objc_msgSend(v3, "appendString:", CFSTR("Within grace period\n"));
  return (NSString *)v3;
}

- (void)_handleInitialGraceDelay
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __59__PXPhotoAnalysisStatusController__handleInitialGraceDelay__block_invoke;
  v2[3] = &unk_1E51479C8;
  v2[4] = self;
  -[PXPhotoAnalysisStatusController performChanges:](self, "performChanges:", v2);
}

- (void)_requestGraphReady
{
  NSObject *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[4];
  PXPhotoAnalysisStatusController *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PLMemoriesGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v8 = self;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "[%@] request graph ready", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__PXPhotoAnalysisStatusController__requestGraphReady__block_invoke;
  v5[3] = &unk_1E5144F70;
  objc_copyWeak(&v6, (id *)buf);
  objc_msgSend(v4, "requestGraphReadyNotificationWithCoalescingIdentifier:completion:", 0, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

- (void)_handleGraphReadyReplyWithSuccess:(BOOL)a3 error:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__PXPhotoAnalysisStatusController__handleGraphReadyReplyWithSuccess_error___block_invoke;
  v8[3] = &unk_1E5144F98;
  v10 = a3;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[PXPhotoAnalysisStatusController performChanges:](self, "performChanges:", v8);

}

- (void)_requestGraphFractionCompleted
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  if (!-[PXPhotoAnalysisStatusController _isRequestingGraphFractionCompleted](self, "_isRequestingGraphFractionCompleted"))
  {
    -[PXPhotoAnalysisStatusController _setRequestingGraphFractionCompleted:](self, "_setRequestingGraphFractionCompleted:", 1);
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __65__PXPhotoAnalysisStatusController__requestGraphFractionCompleted__block_invoke;
    v4[3] = &unk_1E5144FC0;
    objc_copyWeak(&v5, &location);
    objc_msgSend(v3, "requestGraphRebuildProgressWithCompletion:", v4);

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)_handleGraphFractionCompletedReply:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  double v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  double v13;
  dispatch_time_t v14;
  _QWORD block[4];
  id v16;
  _QWORD v17[6];
  uint8_t buf[4];
  PXPhotoAnalysisStatusController *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PXPhotoAnalysisStatusController _setRequestingGraphFractionCompleted:](self, "_setRequestingGraphFractionCompleted:", 0);
  PLMemoriesGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v19 = self;
    v20 = 2112;
    v21 = v6;
    v22 = 2112;
    v23 = v7;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEBUG, "[%@] fraction completed=%@ error=%@", buf, 0x20u);
  }

  if (v6 && !v7)
  {
    objc_msgSend(v6, "doubleValue");
    v10 = v9 < 1.0;
    if (v9 < 0.0)
      v9 = 0.0;
    v11 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __76__PXPhotoAnalysisStatusController__handleGraphFractionCompletedReply_error___block_invoke;
    v17[3] = &unk_1E5144FE8;
    v17[4] = self;
    v17[5] = fmin(v9, 1.0);
    -[PXPhotoAnalysisStatusController performChanges:](self, "performChanges:", v17);
    if (v10 && !-[PXPhotoAnalysisStatusController _isGraphReady](self, "_isGraphReady"))
    {
      objc_initWeak((id *)buf, self);
      +[PXModelSettings sharedInstance](PXModelSettings, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "photoAnalysisGraphProgressUpdateInterval");
      v14 = dispatch_time(0, (uint64_t)(v13 * 1000000000.0));
      block[0] = v11;
      block[1] = 3221225472;
      block[2] = __76__PXPhotoAnalysisStatusController__handleGraphFractionCompletedReply_error___block_invoke_2;
      block[3] = &unk_1E5148D30;
      objc_copyWeak(&v16, (id *)buf);
      dispatch_after(v14, MEMORY[0x1E0C80D38], block);

      objc_destroyWeak(&v16);
      objc_destroyWeak((id *)buf);
    }
  }

}

- (void)_setHasBeenReadyForSomeTime:(BOOL)a3
{
  if (self->_hasBeenReadyForSomeTime != a3)
  {
    self->_hasBeenReadyForSomeTime = a3;
    -[PXPhotoAnalysisStatusController signalChange:](self, "signalChange:", 4);
  }
}

- (void)_setGraphStatus:(int64_t)a3
{
  void *v5;
  dispatch_time_t v6;
  id v7;
  NSDate *lastGraphBecameReadyDate;
  NSObject *v9;
  const __CFString *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _BYTE location[12];
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_graphStatus != a3)
  {
    self->_graphStatus = a3;
    if (a3 == 1)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)&self->__lastGraphBecameReadyDate, v5);
      objc_initWeak((id *)location, self);
      v6 = dispatch_time(0, 10000000000);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __51__PXPhotoAnalysisStatusController__setGraphStatus___block_invoke;
      v11[3] = &unk_1E5147280;
      objc_copyWeak(&v13, (id *)location);
      v12 = v5;
      v7 = v5;
      dispatch_after(v6, MEMORY[0x1E0C80D38], v11);

      objc_destroyWeak(&v13);
      objc_destroyWeak((id *)location);
    }
    else
    {
      lastGraphBecameReadyDate = self->__lastGraphBecameReadyDate;
      self->__lastGraphBecameReadyDate = 0;

      -[PXPhotoAnalysisStatusController _setHasBeenReadyForSomeTime:](self, "_setHasBeenReadyForSomeTime:", 0);
    }
    PLMemoriesGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)a3 > 3)
        v10 = CFSTR("?");
      else
        v10 = off_1E5145008[a3];
      *(_DWORD *)location = 138412546;
      *(_QWORD *)&location[4] = self;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "[%@] graph status=%@", location, 0x16u);
    }

    -[PXPhotoAnalysisStatusController signalChange:](self, "signalChange:", 1);
  }
}

- (void)_handleGraphReadyForSomeTimeForDate:(id)a3
{
  _QWORD v3[5];

  if (self->__lastGraphBecameReadyDate == a3)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __71__PXPhotoAnalysisStatusController__handleGraphReadyForSomeTimeForDate___block_invoke;
    v3[3] = &unk_1E51479C8;
    v3[4] = self;
    -[PXPhotoAnalysisStatusController performChanges:](self, "performChanges:", v3);
  }
}

- (void)_setGraphFractionCompleted:(double)a3
{
  NSObject *v5;
  int v6;
  PXPhotoAnalysisStatusController *v7;
  __int16 v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_graphFractionCompleted != a3)
  {
    self->_graphFractionCompleted = a3;
    PLMemoriesGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412546;
      v7 = self;
      v8 = 2048;
      v9 = a3 * 100.0;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "[%@] graph fraction completed=%f%%", (uint8_t *)&v6, 0x16u);
    }

    -[PXPhotoAnalysisStatusController signalChange:](self, "signalChange:", 2);
    if (a3 > 0.0)
      -[PXPhotoAnalysisStatusController _invalidateGraphStatus](self, "_invalidateGraphStatus");
  }
}

- (void)_setDidReceiveGraphFractionCompleted:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  int v6;
  PXPhotoAnalysisStatusController *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->__didReceiveGraphFractionCompleted != a3)
  {
    v3 = a3;
    self->__didReceiveGraphFractionCompleted = a3;
    PLMemoriesGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412546;
      v7 = self;
      v8 = 1024;
      v9 = v3;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "[%@] did receive graph fraction completed=%i", (uint8_t *)&v6, 0x12u);
    }

    -[PXPhotoAnalysisStatusController _invalidateGraphStatus](self, "_invalidateGraphStatus");
  }
}

- (void)_setGraphReady:(BOOL)a3
{
  if (self->__graphReady != a3)
  {
    self->__graphReady = a3;
    -[PXPhotoAnalysisStatusController _invalidateGraphStatus](self, "_invalidateGraphStatus");
  }
}

- (void)_setGraphError:(id)a3
{
  NSError *v5;
  char v6;
  NSError *v7;

  v7 = (NSError *)a3;
  v5 = self->__graphError;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[NSError isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->__graphError, a3);
      -[PXPhotoAnalysisStatusController _invalidateGraphStatus](self, "_invalidateGraphStatus");
    }
  }

}

- (BOOL)_isWithinGracePeriod
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  BOOL v7;

  -[PXPhotoAnalysisStatusController _initialUpdateDate](self, "_initialUpdateDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceNow");
  v4 = -v3;

  +[PXModelSettings sharedInstance](PXModelSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoAnalysisGraphInitialGraceDelay");
  v7 = v6 > v4;

  return v7;
}

- (void)_dequeueAndPerformBlocks:(id)a3
{
  id v3;
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
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_msgSend(v3, "copy");
    objc_msgSend(v3, "removeAllObjects");
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = v4;
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

- (void)didPerformChanges
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPhotoAnalysisStatusController;
  -[PXPhotoAnalysisStatusController didPerformChanges](&v3, sel_didPerformChanges);
  -[PXPhotoAnalysisStatusController _updateIfNeeded](self, "_updateIfNeeded");
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.graphStatus;
}

- (void)_setNeedsUpdate
{
  -[PXPhotoAnalysisStatusController signalChange:](self, "signalChange:", 0);
}

- (void)_updateIfNeeded
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  PXPhotoAnalysisStatusController *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[PXPhotoAnalysisStatusController _needsUpdate](self, "_needsUpdate"))
  {
    -[PXPhotoAnalysisStatusController _updateGraphStatusIfNeeded](self, "_updateGraphStatusIfNeeded");
    PLMemoriesGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      -[PXPhotoAnalysisStatusController stateDescription](self, "stateDescription");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412546;
      v7 = self;
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEBUG, "[%@] state: %@", (uint8_t *)&v6, 0x16u);

    }
    if ((-[PXPhotoAnalysisStatusController graphStatus](self, "graphStatus") | 2) == 3)
    {
      -[PXPhotoAnalysisStatusController _retryBlocks](self, "_retryBlocks");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotoAnalysisStatusController _dequeueAndPerformBlocks:](self, "_dequeueAndPerformBlocks:", v5);

    }
  }
}

- (void)_invalidateGraphStatus
{
  self->_needsUpdateFlags.graphStatus = 1;
  -[PXPhotoAnalysisStatusController _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateGraphStatusIfNeeded
{
  uint64_t v3;
  void *v4;

  if (self->_needsUpdateFlags.graphStatus)
  {
    self->_needsUpdateFlags.graphStatus = 0;
    if (-[PXPhotoAnalysisStatusController _isGraphReady](self, "_isGraphReady"))
    {
      -[PXPhotoAnalysisStatusController _setGraphFractionCompleted:](self, "_setGraphFractionCompleted:", 0.0);
      v3 = 1;
    }
    else if (-[PXPhotoAnalysisStatusController _isWithinGracePeriod](self, "_isWithinGracePeriod"))
    {
      v3 = 0;
    }
    else
    {
      -[PXPhotoAnalysisStatusController _graphError](self, "_graphError");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        v3 = 3;
      }
      else if (-[PXPhotoAnalysisStatusController _didReceiveGraphFractionCompleted](self, "_didReceiveGraphFractionCompleted"))
      {
        v3 = 2;
      }
      else
      {
        v3 = 0;
      }
    }
    -[PXPhotoAnalysisStatusController _setGraphStatus:](self, "_setGraphStatus:", v3);
  }
}

- (int64_t)graphStatus
{
  return self->_graphStatus;
}

- (BOOL)hasBeenReadyForSomeTime
{
  return self->_hasBeenReadyForSomeTime;
}

- (double)graphFractionCompleted
{
  return self->_graphFractionCompleted;
}

- (BOOL)_didReceiveGraphFractionCompleted
{
  return self->__didReceiveGraphFractionCompleted;
}

- (NSDate)_initialUpdateDate
{
  return self->__initialUpdateDate;
}

- (void)_setInitialUpdateDate:(id)a3
{
  objc_storeStrong((id *)&self->__initialUpdateDate, a3);
}

- (NSDate)_lastGraphBecameReadyDate
{
  return self->__lastGraphBecameReadyDate;
}

- (void)_setLastGraphBecameReadyDate:(id)a3
{
  objc_storeStrong((id *)&self->__lastGraphBecameReadyDate, a3);
}

- (BOOL)_isGraphReady
{
  return self->__graphReady;
}

- (NSError)_graphError
{
  return self->__graphError;
}

- (BOOL)_isRequestingGraphFractionCompleted
{
  return self->__requestingGraphFractionCompleted;
}

- (void)_setRequestingGraphFractionCompleted:(BOOL)a3
{
  self->__requestingGraphFractionCompleted = a3;
}

- (NSMutableArray)_retryBlocks
{
  return self->__retryBlocks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__retryBlocks, 0);
  objc_storeStrong((id *)&self->__graphError, 0);
  objc_storeStrong((id *)&self->__lastGraphBecameReadyDate, 0);
  objc_storeStrong((id *)&self->__initialUpdateDate, 0);
}

uint64_t __71__PXPhotoAnalysisStatusController__handleGraphReadyForSomeTimeForDate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setHasBeenReadyForSomeTime:", 1);
}

void __51__PXPhotoAnalysisStatusController__setGraphStatus___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleGraphReadyForSomeTimeForDate:", *(_QWORD *)(a1 + 32));

}

uint64_t __76__PXPhotoAnalysisStatusController__handleGraphFractionCompletedReply_error___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setDidReceiveGraphFractionCompleted:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_setGraphFractionCompleted:", *(double *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_setGraphError:", 0);
}

void __76__PXPhotoAnalysisStatusController__handleGraphFractionCompletedReply_error___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_requestGraphFractionCompleted");

}

void __65__PXPhotoAnalysisStatusController__requestGraphFractionCompleted__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = a2;
  v6 = a3;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  v7 = v5;
  v8 = v6;
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v9);
}

void __65__PXPhotoAnalysisStatusController__requestGraphFractionCompleted__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handleGraphFractionCompletedReply:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __75__PXPhotoAnalysisStatusController__handleGraphReadyReplyWithSuccess_error___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_setGraphReady:", *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_setGraphError:", *(_QWORD *)(a1 + 40));
  v2 = *(unsigned __int8 *)(a1 + 48);
  PLMemoriesGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(unsigned __int8 *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      v13 = v5;
      v14 = 1024;
      LODWORD(v15) = v6;
      _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "[%@] graph ready reply success=%i", buf, 0x12u);
    }

  }
  else
  {
    if (v4)
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v13 = v7;
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "[%@] graph ready reply error=%@", buf, 0x16u);
    }

    if (objc_msgSend(*(id *)(a1 + 32), "_isWithinGracePeriod"))
    {
      PLMemoriesGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v13 = v10;
        _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "[%@] within grace period, re-requesting graph ready", buf, 0xCu);
      }

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __75__PXPhotoAnalysisStatusController__handleGraphReadyReplyWithSuccess_error___block_invoke_143;
      block[3] = &unk_1E5149198;
      block[4] = *(_QWORD *)(a1 + 32);
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
}

uint64_t __75__PXPhotoAnalysisStatusController__handleGraphReadyReplyWithSuccess_error___block_invoke_143(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requestGraphReady");
}

void __53__PXPhotoAnalysisStatusController__requestGraphReady__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  char v8;

  v5 = a3;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v8 = a2;
  v6 = v5;
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v7);
}

void __53__PXPhotoAnalysisStatusController__requestGraphReady__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleGraphReadyReplyWithSuccess:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

uint64_t __59__PXPhotoAnalysisStatusController__handleInitialGraceDelay__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateGraphStatus");
}

uint64_t __54__PXPhotoAnalysisStatusController_registerRetryBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_retryBlocks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  v4 = _Block_copy(v3);
  objc_msgSend(v2, "addObject:", v4);

  return objc_msgSend(*(id *)(a1 + 32), "update");
}

void __41__PXPhotoAnalysisStatusController_update__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleInitialGraceDelay");

}

uint64_t __41__PXPhotoAnalysisStatusController_update__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateGraphStatus");
}

+ (id)sharedStatusController
{
  if (sharedStatusController_onceToken != -1)
    dispatch_once(&sharedStatusController_onceToken, &__block_literal_global_283263);
  return (id)sharedStatusController_sharedStatusController;
}

void __57__PXPhotoAnalysisStatusController_sharedStatusController__block_invoke()
{
  PXPhotoAnalysisStatusController *v0;
  void *v1;

  v0 = objc_alloc_init(PXPhotoAnalysisStatusController);
  v1 = (void *)sharedStatusController_sharedStatusController;
  sharedStatusController_sharedStatusController = (uint64_t)v0;

}

@end
