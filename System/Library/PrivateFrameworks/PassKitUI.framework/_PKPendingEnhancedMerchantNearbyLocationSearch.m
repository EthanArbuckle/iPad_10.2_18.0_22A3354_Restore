@implementation _PKPendingEnhancedMerchantNearbyLocationSearch

- (_PKPendingEnhancedMerchantNearbyLocationSearch)initWithMerchant:(id)a3
{
  id v5;
  _PKPendingEnhancedMerchantNearbyLocationSearch *v6;
  _PKPendingEnhancedMerchantNearbyLocationSearch *v7;
  NSMutableArray *v8;
  NSMutableArray *completionHandlers;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_PKPendingEnhancedMerchantNearbyLocationSearch;
  v6 = -[_PKPendingEnhancedMerchantNearbyLocationSearch init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_merchant, a3);
    v7->_state = 0;
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    completionHandlers = v7->_completionHandlers;
    v7->_completionHandlers = v8;

  }
  return v7;
}

- (unint64_t)state
{
  os_unfair_lock_s *p_lock;
  unint64_t state;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  state = self->_state;
  os_unfair_lock_unlock(p_lock);
  return state;
}

- (BOOL)isInProgress
{
  return -[_PKPendingEnhancedMerchantNearbyLocationSearch state](self, "state") == 1;
}

- (BOOL)isInTerminalState
{
  return -[_PKPendingEnhancedMerchantNearbyLocationSearch state](self, "state") - 2 < 3;
}

- (void)didStart
{
  -[_PKPendingEnhancedMerchantNearbyLocationSearch _updateState:error:](self, "_updateState:error:", 1, 0);
}

- (void)didCompleteSuccessfully
{
  -[_PKPendingEnhancedMerchantNearbyLocationSearch _updateState:error:](self, "_updateState:error:", 2, 0);
}

- (void)didFailWithError:(id)a3
{
  -[_PKPendingEnhancedMerchantNearbyLocationSearch _updateState:error:](self, "_updateState:error:", 4, a3);
}

- (void)cancel
{
  -[_PKPendingEnhancedMerchantNearbyLocationSearch _updateState:error:](self, "_updateState:error:", 3, 0);
}

- (void)addCompletionHandler:(id)a3
{
  id v4;
  _BOOL4 v5;
  os_unfair_lock_s *p_lock;
  NSError *v7;
  NSError *v8;
  NSMutableArray *completionHandlers;
  void *v10;
  _QWORD v11[4];
  NSError *v12;
  id v13;

  v4 = a3;
  v5 = -[_PKPendingEnhancedMerchantNearbyLocationSearch isInTerminalState](self, "isInTerminalState");
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (v5)
  {
    v7 = self->_error;
    os_unfair_lock_unlock(p_lock);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __71___PKPendingEnhancedMerchantNearbyLocationSearch_addCompletionHandler___block_invoke;
    v11[3] = &unk_1E3E618A0;
    v12 = v7;
    v13 = v4;
    v8 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], v11);

  }
  else
  {
    completionHandlers = self->_completionHandlers;
    v10 = _Block_copy(v4);
    -[NSMutableArray addObject:](completionHandlers, "addObject:", v10);

    os_unfair_lock_unlock(p_lock);
  }

}

- (void)_updateState:(unint64_t)a3 error:(id)a4
{
  NSError *v6;
  NSError *error;

  v6 = (NSError *)a4;
  os_unfair_lock_lock(&self->_lock);
  self->_state = a3;
  error = self->_error;
  self->_error = v6;

  os_unfair_lock_unlock(&self->_lock);
  if (-[_PKPendingEnhancedMerchantNearbyLocationSearch isInTerminalState](self, "isInTerminalState"))
    -[_PKPendingEnhancedMerchantNearbyLocationSearch _callCompletionHandlers](self, "_callCompletionHandlers");
}

- (void)_callCompletionHandlers
{
  os_unfair_lock_s *p_lock;
  NSError *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[4];
  NSError *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_error;
  v5 = (void *)-[NSMutableArray copy](self->_completionHandlers, "copy");
  -[NSMutableArray removeAllObjects](self->_completionHandlers, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    v10 = MEMORY[0x1E0C809B0];
    v11 = MEMORY[0x1E0C80D38];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12);
        v14[0] = v10;
        v14[1] = 3221225472;
        v14[2] = __73___PKPendingEnhancedMerchantNearbyLocationSearch__callCompletionHandlers__block_invoke;
        v14[3] = &unk_1E3E618A0;
        v16 = v13;
        v15 = v4;
        dispatch_async(v11, v14);

        ++v12;
      }
      while (v8 != v12);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

}

- (PKAccountEnhancedMerchant)merchant
{
  return self->_merchant;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_merchant, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
}

@end
