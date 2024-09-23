@implementation SBStatusBarStateAggregator

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_36(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_updateLocationItemForLocationAttributions:(id)a3
{
  uint64_t v4;
  char v5;
  char v6;
  _BOOL8 prominentLocationOverride;
  char v8;
  _BOOL4 v9;
  int v10;
  NSObject *v12;
  int v13;
  _DWORD v14[2];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "count");
  v5 = *((_BYTE *)&self->_data + 2529);
  v6 = v5 & 0xE7;
  if (self->_prominentLocationOverride)
    v6 = v5 & 0xE7 | 0x10;
  if (v4)
    prominentLocationOverride = 1;
  else
    prominentLocationOverride = self->_prominentLocationOverride;
  *((_BYTE *)&self->_data + 2529) = v6;
  v8 = v6 ^ v5;
  v9 = -[SBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", 21, prominentLocationOverride);
  v10 = (v8 & 0x18) != 0 || v9;
  if (prominentLocationOverride && v10 != 0)
  {
    -[SBStatusBarStateAggregator _notifyItemChanged:](self, "_notifyItemChanged:", 21);
    if ((v8 & 0x18) != 0)
    {
      SBLogStatusBarish();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (*((unsigned __int8 *)&self->_data + 2529) >> 3) & 3;
        v14[0] = 67109120;
        v14[1] = v13;
        _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "locationType changed to %i", (uint8_t *)v14, 8u);
      }

    }
  }
}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  void (**v3)(id, id);
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "beginCoalescentBlock");
  v3[2](v3, WeakRetained);

  objc_msgSend(WeakRetained, "endCoalescentBlock");
}

- (void)updateStatusBarItem:(int)a3
{
  NSObject *v5;

  -[SBStatusBarStateAggregator beginCoalescentBlock](self, "beginCoalescentBlock");
  switch(a3)
  {
    case 0:
    case 1:
      -[SBStatusBarStateAggregator _updateTimeItems](self, "_updateTimeItems");
      break;
    case 2:
      -[SBStatusBarStateAggregator _updateQuietModeItem](self, "_updateQuietModeItem");
      break;
    case 3:
      -[SBStatusBarStateAggregator _updateAirplaneMode](self, "_updateAirplaneMode");
      break;
    case 4:
      -[SBStatusBarStateAggregator _updateSignalStrengthItem](self, "_updateSignalStrengthItem");
      break;
    case 5:
      -[SBStatusBarStateAggregator _updateSecondarySignalStrengthItem](self, "_updateSecondarySignalStrengthItem");
      break;
    case 6:
      -[SBStatusBarStateAggregator _updateServiceItem](self, "_updateServiceItem");
      break;
    case 7:
      -[SBStatusBarStateAggregator _updateSecondaryServiceItem](self, "_updateSecondaryServiceItem");
      break;
    case 8:
      -[SBStatusBarStateAggregator _updatePersonNameItem](self, "_updatePersonNameItem");
      break;
    case 9:
      -[SBStatusBarStateAggregator _updateDataNetworkItem](self, "_updateDataNetworkItem");
      break;
    case 10:
      -[SBStatusBarStateAggregator _updateSecondaryDataNetworkItem](self, "_updateSecondaryDataNetworkItem");
      break;
    case 12:
    case 13:
    case 14:
      -[SBStatusBarStateAggregator _updateBatteryItems](self, "_updateBatteryItems");
      break;
    case 15:
      -[SBStatusBarStateAggregator _updateBluetoothBatteryItem](self, "_updateBluetoothBatteryItem");
      break;
    case 16:
      -[SBStatusBarStateAggregator _updateBluetoothItem](self, "_updateBluetoothItem");
      break;
    case 17:
      -[SBStatusBarStateAggregator _updateTTYItem](self, "_updateTTYItem");
      break;
    case 18:
      -[SBStatusBarStateAggregator _updateAlarmItem](self, "_updateAlarmItem");
      break;
    case 19:
    case 23:
    case 25:
    case 34:
    case 36:
      break;
    case 21:
      -[SBStatusBarStateAggregator _updateLocationItem](self, "_updateLocationItem");
      break;
    case 22:
      -[SBStatusBarStateAggregator _updateRotationLockItem](self, "_updateRotationLockItem");
      break;
    case 24:
      -[SBStatusBarStateAggregator _updateAirplayItem](self, "_updateAirplayItem");
      break;
    case 26:
      -[SBStatusBarStateAggregator _updateCarPlayItem](self, "_updateCarPlayItem");
      break;
    case 28:
      -[SBStatusBarStateAggregator _updateSensorActivityItem](self, "_updateSensorActivityItem");
      break;
    case 29:
      -[SBStatusBarStateAggregator _updateVPNItem](self, "_updateVPNItem");
      break;
    case 30:
      -[SBStatusBarStateAggregator _updateCallForwardingItem](self, "_updateCallForwardingItem");
      break;
    case 31:
      -[SBStatusBarStateAggregator _updateSecondaryCallForwardingItem](self, "_updateSecondaryCallForwardingItem");
      break;
    case 32:
      -[SBStatusBarStateAggregator _updateActivityItem](self, "_updateActivityItem");
      break;
    case 33:
      -[SBStatusBarStateAggregator _updateThermalColorItem](self, "_updateThermalColorItem");
      break;
    case 40:
      -[SBStatusBarStateAggregator _updateLiquidDetectionItem](self, "_updateLiquidDetectionItem");
      break;
    case 41:
      -[SBStatusBarStateAggregator _updateVoiceControlItem](self, "_updateVoiceControlItem");
      break;
    case 42:
      -[SBStatusBarStateAggregator _updateBluetoothHeadphonesItem](self, "_updateBluetoothHeadphonesItem");
      break;
    case 44:
      -[SBStatusBarStateAggregator _updateDisplayWarningItem](self, "_updateDisplayWarningItem");
      break;
    case 45:
      -[SBStatusBarStateAggregator _updateStewieItem](self, "_updateStewieItem");
      break;
    default:
      SBLogStatusBarish();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        -[SBStatusBarStateAggregator updateStatusBarItem:].cold.1(a3, v5);

      break;
  }
  -[SBStatusBarStateAggregator endCoalescentBlock](self, "endCoalescentBlock");
}

- (void)_postItem:(int)a3 withState:(unint64_t)a4 inList:(unint64_t *)a5
{
  if (a3 <= 0x2D)
  {
    if (a5)
    {
      -[SBStatusBarStateAggregator beginCoalescentBlock](self, "beginCoalescentBlock");
      a5[a3] |= a4;
      -[SBStatusBarStateAggregator endCoalescentBlock](self, "endCoalescentBlock");
    }
  }
}

- (void)beginCoalescentBlock
{
  unint64_t coalescentBlockDepth;
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (self->_notifyingPostObservers)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBStatusBarStateAggregator.m"), 312, CFSTR("calls to %s are not allowed from within observer notifications"), "-[SBStatusBarStateAggregator beginCoalescentBlock]");

  }
  coalescentBlockDepth = self->_coalescentBlockDepth;
  self->_coalescentBlockDepth = coalescentBlockDepth + 1;
  if (!coalescentBlockDepth)
  {
    memcpy(&self->_atomicUpdateData, &self->_data, sizeof(self->_atomicUpdateData));
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = self->_postObservers;
    v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "statusBarStateAggregatorDidStartPost:", self);
        }
        while (v7 != v9);
        v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
}

- (BOOL)_setItem:(int)a3 enabled:(BOOL)a4 inList:(BOOL *)a5 itemPostState:(unint64_t *)a6
{
  int v6;
  uint64_t v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  BOOL v11;
  BOOL v12;
  const __CFString *v13;
  __CFString *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  int v19;
  uint64_t v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a3 > 0x2D)
    return 0;
  v6 = a4;
  v7 = *(_QWORD *)&a3;
  v8 = a5[a3];
  a5[a3] = a4;
  -[SBStatusBarStateAggregator _postItem:withState:inList:](self, "_postItem:withState:inList:");
  SBLogStatusBarish();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  v11 = v8 == v6;
  v12 = v8 != v6;
  if (v11)
  {
    if (v10)
    {
      SBStatusBarItemDebugName(v7);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      v17 = CFSTR("dis");
      if (v6)
        v17 = CFSTR("en");
      v19 = 138543618;
      v20 = v15;
      v21 = 2112;
      v22 = v17;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ is unchanged, still %@abled", (uint8_t *)&v19, 0x16u);

    }
  }
  else if (v10)
  {
    if (v6)
      v13 = CFSTR("en");
    else
      v13 = CFSTR("dis");
    SBStatusBarItemDebugName(v7);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v19 = 138412546;
    v20 = (uint64_t)v13;
    v21 = 2114;
    v22 = v14;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "%@abling %{public}@", (uint8_t *)&v19, 0x16u);

  }
  return v12;
}

- (void)endCoalescentBlock
{
  BOOL *p_notifyingPostObservers;
  BOOL *p_performingAtomicUpdate;
  unint64_t coalescentBlockDepth;
  unint64_t v7;
  NSHashTable *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSHashTable *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  uint64_t k;
  NSHashTable *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t m;
  void *v26;
  NSHashTable *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t n;
  NSHashTable *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t ii;
  void *v37;
  uint64_t jj;
  unint64_t *itemPostState;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  p_notifyingPostObservers = &self->_notifyingPostObservers;
  p_performingAtomicUpdate = &self->_performingAtomicUpdate;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (*p_notifyingPostObservers)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBStatusBarStateAggregator.m"), 325, CFSTR("calls to %s are not allowed from within observer notifications"), "-[SBStatusBarStateAggregator endCoalescentBlock]");

  }
  coalescentBlockDepth = self->_coalescentBlockDepth;
  if (!coalescentBlockDepth)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBStatusBarStateAggregator.m"), 326, CFSTR("unbalanced call to %s"), "-[SBStatusBarStateAggregator endCoalescentBlock]");

    coalescentBlockDepth = self->_coalescentBlockDepth;
  }
  v7 = coalescentBlockDepth - 1;
  self->_coalescentBlockDepth = v7;
  if (*p_performingAtomicUpdate)
  {
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v8 = self->_postObservers;
    v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v59;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v59 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v13, "statusBarStateAggregatorDidRequestImmediateUpdates:", self);
        }
        v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
      }
      while (v10);
    }

    *p_notifyingPostObservers = 1;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v14 = self->_postObservers;
    v15 = -[NSHashTable countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v55;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v55 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
          for (k = 538; k != 584; ++k)
          {
            if (*((_QWORD *)&self->super.isa + k))
              objc_msgSend(v19, "statusBarStateAggregator:didVisitItem:withUpdates:toData:", self, (k - 538), (~*((_BYTE *)&self->super.isa + 8 * k) & 3) == 0, &self->_atomicUpdateData);
          }
          objc_msgSend(v19, "statusBarStateAggregatorDidFinishPost:withData:actions:", self, &self->_atomicUpdateData, 0);
        }
        v16 = -[NSHashTable countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
      }
      while (v16);
    }

    *(_OWORD *)&self->_atomicUpdateItemPostState[44] = 0u;
    *(_OWORD *)&self->_atomicUpdateItemPostState[42] = 0u;
    *(_OWORD *)&self->_atomicUpdateItemPostState[40] = 0u;
    *(_OWORD *)&self->_atomicUpdateItemPostState[38] = 0u;
    *(_OWORD *)&self->_atomicUpdateItemPostState[36] = 0u;
    *(_OWORD *)&self->_atomicUpdateItemPostState[34] = 0u;
    *(_OWORD *)&self->_atomicUpdateItemPostState[32] = 0u;
    *(_OWORD *)&self->_atomicUpdateItemPostState[30] = 0u;
    *(_OWORD *)&self->_atomicUpdateItemPostState[28] = 0u;
    *(_OWORD *)&self->_atomicUpdateItemPostState[26] = 0u;
    *(_OWORD *)&self->_atomicUpdateItemPostState[24] = 0u;
    *(_OWORD *)&self->_atomicUpdateItemPostState[22] = 0u;
    *(_OWORD *)&self->_atomicUpdateItemPostState[20] = 0u;
    *(_OWORD *)&self->_atomicUpdateItemPostState[18] = 0u;
    *(_OWORD *)&self->_atomicUpdateItemPostState[16] = 0u;
    *(_OWORD *)&self->_atomicUpdateItemPostState[14] = 0u;
    *(_OWORD *)&self->_atomicUpdateItemPostState[12] = 0u;
    *(_OWORD *)&self->_atomicUpdateItemPostState[10] = 0u;
    *(_OWORD *)&self->_atomicUpdateItemPostState[8] = 0u;
    *(_OWORD *)&self->_atomicUpdateItemPostState[6] = 0u;
    *(_OWORD *)&self->_atomicUpdateItemPostState[4] = 0u;
    *(_OWORD *)&self->_atomicUpdateItemPostState[2] = 0u;
    *(_OWORD *)self->_atomicUpdateItemPostState = 0u;
    *p_notifyingPostObservers = 0;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v21 = self->_postObservers;
    v22 = -[NSHashTable countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v51;
      do
      {
        for (m = 0; m != v23; ++m)
        {
          if (*(_QWORD *)v51 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * m);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v26, "statusBarStateAggregatorDidStopRequestingImmediateUpdates:", self);
        }
        v23 = -[NSHashTable countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
      }
      while (v23);
    }

    if (self->_coalescentBlockDepth)
    {
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v27 = self->_postObservers;
      v28 = -[NSHashTable countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v46, v63, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v47;
        do
        {
          for (n = 0; n != v29; ++n)
          {
            if (*(_QWORD *)v47 != v30)
              objc_enumerationMutation(v27);
            objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * n), "statusBarStateAggregatorDidStartPost:", self);
          }
          v29 = -[NSHashTable countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v46, v63, 16);
        }
        while (v29);
      }

    }
  }
  else if (!v7)
  {
    *p_notifyingPostObservers = 1;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v32 = self->_postObservers;
    v33 = -[NSHashTable countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v42, v62, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v43;
      do
      {
        for (ii = 0; ii != v34; ++ii)
        {
          if (*(_QWORD *)v43 != v35)
            objc_enumerationMutation(v32);
          v37 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * ii);
          for (jj = 5; jj != 51; ++jj)
          {
            if (*((_QWORD *)&self->super.isa + jj))
              objc_msgSend(v37, "statusBarStateAggregator:didVisitItem:withUpdates:toData:", self, (jj - 5), (~*((_BYTE *)&self->super.isa + 8 * jj) & 3) == 0, &self->_data);
          }
          if (self->_nonItemDataChanged)
            objc_msgSend(v37, "statusBarStateAggregator:didUpdateNonItemData:", self, &self->_data);
          objc_msgSend(v37, "statusBarStateAggregatorDidFinishPost:withData:actions:", self, &self->_data, self->_actions);
        }
        v34 = -[NSHashTable countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v42, v62, 16);
      }
      while (v34);
    }

    *(_OWORD *)self->_itemPostState = 0u;
    itemPostState = self->_itemPostState;
    *((_DWORD *)itemPostState + 1064) = 0;
    *p_notifyingPostObservers = 0;
    *((_OWORD *)itemPostState + 1) = 0u;
    *((_OWORD *)itemPostState + 2) = 0u;
    *((_OWORD *)itemPostState + 3) = 0u;
    *((_OWORD *)itemPostState + 4) = 0u;
    *((_OWORD *)itemPostState + 5) = 0u;
    *((_OWORD *)itemPostState + 6) = 0u;
    *((_OWORD *)itemPostState + 7) = 0u;
    *((_OWORD *)itemPostState + 8) = 0u;
    *((_OWORD *)itemPostState + 9) = 0u;
    *((_OWORD *)itemPostState + 10) = 0u;
    *((_OWORD *)itemPostState + 11) = 0u;
    *((_OWORD *)itemPostState + 12) = 0u;
    *((_OWORD *)itemPostState + 13) = 0u;
    *((_OWORD *)itemPostState + 14) = 0u;
    *((_OWORD *)itemPostState + 15) = 0u;
    *((_OWORD *)itemPostState + 16) = 0u;
    *((_OWORD *)itemPostState + 17) = 0u;
    *((_OWORD *)itemPostState + 18) = 0u;
    *((_OWORD *)itemPostState + 19) = 0u;
    *((_OWORD *)itemPostState + 20) = 0u;
    *((_OWORD *)itemPostState + 21) = 0u;
    *((_OWORD *)itemPostState + 22) = 0u;
    *((_BYTE *)itemPostState + 368) = 0;
  }
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_37(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateStatusBarItem:", 32);
}

- (void)_updateActivityItem
{
  void *v3;
  int64_t syncActivityIndicatorCount;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  int v21;
  int v22;
  __CFString *v23;
  __CFString *v24;
  char v25;
  char v26;
  NSObject *v27;
  unsigned int v28;
  NSString *activityDisplayIdentifier;
  void *v30;
  uint64_t v31;
  _DWORD v32[2];
  __int16 v33;
  int v34;
  __int16 v35;
  NSString *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  -[SBStatusBarStateAggregator _telephonyManager](self, "_telephonyManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  syncActivityIndicatorCount = self->_syncActivityIndicatorCount;
  if (syncActivityIndicatorCount > 0)
  {
    v5 = 0;
    v6 = 1;
    goto LABEL_14;
  }
  -[SBStatusBarStateAggregator telephonyDomain](self, "telephonyDomain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "primarySIMInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "dataNetworkType");

  if (v10
    || (objc_msgSend(v3, "hasNonCellularNetworkConnection") & 1) != 0
    || (BKSDisplayServicesDisplayIsTethered() & 1) != 0
    || (-[SBStatusBarStateAggregator _userSessionController](self, "_userSessionController"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v11, "isLoginSession"),
        v11,
        (_DWORD)v6))
  {
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "transientOverlayPresentationManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    +[SBMainSwitcherControllerCoordinator _shim_activeSwitcherController](SBMainSwitcherControllerCoordinator, "_shim_activeSwitcherController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layoutStatePrimaryElement");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "workspaceEntity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "applicationSceneEntity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sceneHandle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18 && (objc_msgSend(v13, "hasActivePresentation") & 1) == 0)
    {
      objc_msgSend(v18, "application");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "bundleIdentifier");
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
    if (self->_activityIndicatorEverywhereCount <= 0
      && (!objc_msgSend(v13, "hasActivePresentation")
       || (objc_msgSend(v13, "prefersStatusBarActivityItemVisible") & 1) == 0))
    {
      if (v18 && (objc_msgSend(v13, "hasActivePresentation") & 1) == 0)
      {
        objc_msgSend(v18, "application");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "showsProgress");
        goto LABEL_40;
      }
      if (!self->_showsActivityIndicatorOnHomeScreen)
      {
        +[SBApplicationPlaceholderController sharedInstance](SBApplicationPlaceholderController, "sharedInstance");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "isUsingNetwork");
LABEL_40:
        v6 = v31;

        goto LABEL_13;
      }
    }
    v6 = 1;
LABEL_13:

    goto LABEL_14;
  }
  v5 = 0;
LABEL_14:
  v20 = -[SBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", 32, v6);
  v21 = objc_msgSend(v3, "isUsingSlowDataConnection");
  if (syncActivityIndicatorCount < 1)
    v22 = v21;
  else
    v22 = 0;
  if (v5)
    v23 = v5;
  else
    v23 = &stru_1E8EC7EC0;
  v24 = v23;

  v25 = *((_BYTE *)&self->_data + 2272);
  if (v22 != ((v25 & 2) == 0) && syncActivityIndicatorCount > 0 != ((v25 & 4) == 0))
  {
    if ((-[__CFString isEqualToString:](v24, "isEqualToString:", self->_activityDisplayIdentifier) & 1) != 0)
      goto LABEL_28;
    v25 = *((_BYTE *)&self->_data + 2272);
  }
  if (v22)
    v26 = 2;
  else
    v26 = 0;
  *((_BYTE *)&self->_data + 2272) = v26 | (4 * (syncActivityIndicatorCount > 0)) | v25 & 0xF9;
  objc_storeStrong((id *)&self->_activityDisplayIdentifier, v23);
  -[NSString getCString:maxLength:encoding:](self->_activityDisplayIdentifier, "getCString:maxLength:encoding:", self->_data.activityDisplayId, 256, 4);
  -[SBStatusBarStateAggregator _notifyItemChanged:](self, "_notifyItemChanged:", 32);
  v20 = 1;
LABEL_28:
  if ((v6 & v20) == 1)
  {
    SBLogStatusBarish();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = *((unsigned __int8 *)&self->_data + 2272);
      activityDisplayIdentifier = self->_activityDisplayIdentifier;
      v32[0] = 67109634;
      v32[1] = (v28 >> 1) & 1;
      v33 = 1024;
      v34 = (v28 >> 2) & 1;
      v35 = 2114;
      v36 = activityDisplayIdentifier;
      _os_log_impl(&dword_1D0540000, v27, OS_LOG_TYPE_DEFAULT, "activity info changed to slow=%i sync=%i identifier=%{public}@", (uint8_t *)v32, 0x18u);
    }

  }
}

- (BOOL)_setItem:(int)a3 enabled:(BOOL)a4
{
  return -[SBStatusBarStateAggregator _setItem:enabled:inList:itemPostState:](self, "_setItem:enabled:inList:itemPostState:", *(_QWORD *)&a3, a4, &self->_data, self->_itemPostState);
}

- (STTelephonyStatusDomain)telephonyDomain
{
  return self->_telephonyDomain;
}

- (id)_telephonyManager
{
  return +[SBTelephonyManager sharedTelephonyManagerCreatingIfNecessary:](SBTelephonyManager, "sharedTelephonyManagerCreatingIfNecessary:", 0);
}

- (void)_notifyItemChanged:(int)a3
{
  -[SBStatusBarStateAggregator _postItem:withState:inList:](self, "_postItem:withState:inList:", *(_QWORD *)&a3, 3, self->_itemPostState);
}

- (void)_updateLocationItem
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend((id)SBApp, "sensorActivityDataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeAndRecentSensorActivityAttributions");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[SBStatusBarStateAggregator _locationAttributionsForSensorActivityAttributions:includeRecent:](self, "_locationAttributionsForSensorActivityAttributions:includeRecent:", v5, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBStatusBarStateAggregator _updateLocationItemForLocationAttributions:](self, "_updateLocationItemForLocationAttributions:", v4);

}

- (void)activityDidChangeForSensorActivityDataProvider:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  SBStatusBarStateAggregator *v22;
  SBStatusBarStateAggregator *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)SBApp, "sensorActivityDataProvider", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeSensorActivityAttributions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = self;
  -[SBStatusBarStateAggregator _locationAttributionsForSensorActivityAttributions:includeRecent:](self, "_locationAttributionsForSensorActivityAttributions:includeRecent:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBMainSwitcherControllerCoordinator _shim_activeSwitcherController](SBMainSwitcherControllerCoordinator, "_shim_activeSwitcherController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutStatePrimaryElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "workspaceEntity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applicationSceneEntity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sceneHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "application");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v13 = v6;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v25;
    while (2)
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v17);
        +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "bundleIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "applicationWithBundleIdentifier:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v12, "isSameExecutableAsApplication:", v21)
          && (objc_msgSend(v21, "hasProminentlyIndicatedLocationUseWhileForeground") & 1) == 0)
        {
          objc_msgSend(v21, "setHasProminentlyIndicatedLocationUseWhileForeground:", 1);
          v22 = v23;
          -[SBStatusBarStateAggregator _temporarilyOverrideLocationItemForProminentIndication](v23, "_temporarilyOverrideLocationItemForProminentIndication");

          goto LABEL_12;
        }

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v15)
        continue;
      break;
    }
  }

  v22 = v23;
  -[SBStatusBarStateAggregator _updateLocationItem](v23, "_updateLocationItem");
LABEL_12:
  -[SBStatusBarStateAggregator _updateActiveAudioRecordingBackgroundActivityAssertionsForActiveSensorActivityAttributions:](v22, "_updateActiveAudioRecordingBackgroundActivityAssertionsForActiveSensorActivityAttributions:", v5);

}

- (id)_locationAttributionsForSensorActivityAttributions:(id)a3 includeRecent:(BOOL)a4
{
  _QWORD v5[4];
  BOOL v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __95__SBStatusBarStateAggregator__locationAttributionsForSensorActivityAttributions_includeRecent___block_invoke;
  v5[3] = &__block_descriptor_33_e37_B16__0__SBSensorActivityAttribution_8l;
  v6 = a4;
  objc_msgSend(a3, "bs_filter:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_updateActiveAudioRecordingBackgroundActivityAssertionsForActiveSensorActivityAttributions:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)SBApp;
  v5 = a3;
  objc_msgSend(v4, "audioRecordingManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[SBStatusBarStateAggregator _activeAudioRecordingAttributionsForSensorActivityAttributions:](self, "_activeAudioRecordingAttributionsForSensorActivityAttributions:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[STCallingStatusDomain data](self->_callingDomain, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "callDescriptors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setNowRecordingAppForActiveAudioRecordingAttributions:callDescriptors:", v6, v8);
}

- (id)_activeAudioRecordingAttributionsForSensorActivityAttributions:(id)a3
{
  return (id)objc_msgSend(a3, "bs_filter:", &__block_literal_global_209_0);
}

- (void)_temporarilyOverrideLocationItemForProminentIndication
{
  NSTimer *prominentLocationTimer;
  NSTimer *v4;
  NSTimer *v5;
  _QWORD v6[5];

  -[NSTimer invalidate](self->_prominentLocationTimer, "invalidate");
  prominentLocationTimer = self->_prominentLocationTimer;
  self->_prominentLocationTimer = 0;

  self->_prominentLocationOverride = 1;
  -[SBStatusBarStateAggregator _updateLocationItem](self, "_updateLocationItem");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __84__SBStatusBarStateAggregator__temporarilyOverrideLocationItemForProminentIndication__block_invoke;
  v6[3] = &unk_1E8EB8270;
  v6[4] = self;
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 0, v6, 4.0);
  v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  v5 = self->_prominentLocationTimer;
  self->_prominentLocationTimer = v4;

}

uint64_t __95__SBStatusBarStateAggregator__locationAttributionsForSensorActivityAttributions_includeRecent___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  BOOL v8;

  v3 = a2;
  v4 = *(unsigned __int8 *)(a1 + 32);
  v5 = objc_msgSend(v3, "sensor");
  if (v4)
    v6 = v5 == 2;
  else
    v6 = 0;
  v7 = v6;
  if (v4)
    v8 = 0;
  else
    v8 = v5 == 2;
  if (v8)
    v7 = objc_msgSend(v3, "usedRecently") ^ 1;

  return v7;
}

uint64_t __93__SBStatusBarStateAggregator__activeAudioRecordingAttributionsForSensorActivityAttributions___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "sensor") == 1)
    v3 = objc_msgSend(v2, "usedRecently") ^ 1;
  else
    v3 = 0;

  return v3;
}

- (void)_restartTimeItemTimer
{
  void *v4;
  void *v5;
  void *v6;
  NSTimer *v7;
  NSTimer *timeItemTimer;
  id v9;

  -[SBStatusBarStateAggregator beginCoalescentBlock](self, "beginCoalescentBlock");
  -[SBStatusBarStateAggregator _updateTimeItems](self, "_updateTimeItems");
  -[SBStatusBarStateAggregator endCoalescentBlock](self, "endCoalescentBlock");
  -[SBStatusBarStateAggregator _stopTimeItemTimer](self, "_stopTimeItemTimer");
  if (!self->_showsRecordingOverrides)
  {
    objc_msgSend(MEMORY[0x1E0DA9DE8], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "overrideDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = (void *)MEMORY[0x1E0C99E88];
      BSTimeUntilNextClockMinute();
      objc_msgSend(v6, "timerWithTimeInterval:target:selector:userInfo:repeats:", self, a2, 0, 0);
      v7 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      timeItemTimer = self->_timeItemTimer;
      self->_timeItemTimer = v7;

      objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addTimer:forMode:", self->_timeItemTimer, *MEMORY[0x1E0C99860]);

    }
  }
}

- (void)_updateTimeItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSString *v8;
  NSString *shortTimeItemTimeString;
  _QWORD v10[5];

  objc_msgSend(MEMORY[0x1E0DA9DE8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDateFormatter stringFromDate:](self->_timeItemDateFormatter, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter stringFromDate:](self->_dateItemDateFormatter, "stringFromDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", 0, 1);
  -[SBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", 1, 1);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__SBStatusBarStateAggregator__updateTimeItems__block_invoke;
  v10[3] = &unk_1E8EBF8E8;
  v10[4] = self;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1D17E5550](v10);
  if ((objc_msgSend(v5, "isEqualToString:", self->_timeItemTimeString) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_timeItemTimeString, v5);
    -[NSDateFormatter stringFromDate:](self->_shortTimeItemDateFormatter, "stringFromDate:", v4);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    shortTimeItemTimeString = self->_shortTimeItemTimeString;
    self->_shortTimeItemTimeString = v8;

    ((void (**)(_QWORD, NSString *, char *, _QWORD))v7)[2](v7, self->_timeItemTimeString, self->_data.timeString, 0);
    ((void (**)(_QWORD, NSString *, char *, _QWORD))v7)[2](v7, self->_shortTimeItemTimeString, self->_data.shortTimeString, 0);
  }
  if ((objc_msgSend(v6, "isEqualToString:", self->_dateItemTimeString) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_dateItemTimeString, v6);
    ((void (**)(_QWORD, NSString *, char *, uint64_t))v7)[2](v7, self->_dateItemTimeString, self->_data.dateString, 1);
  }

}

double __46__SBStatusBarStateAggregator__updateTimeItems__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  int v6;
  uint64_t v7;
  double result;

  v6 = objc_msgSend(a2, "getCString:maxLength:encoding:", a3, 64, 4);
  v7 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    objc_msgSend((id)v7, "_notifyItemChanged:", a4);
  }
  else
  {
    result = 0.0;
    *(_OWORD *)(v7 + 494) = 0u;
    *(_OWORD *)(v7 + 510) = 0u;
    *(_OWORD *)(v7 + 462) = 0u;
    *(_OWORD *)(v7 + 478) = 0u;
  }
  return result;
}

- (void)_stopTimeItemTimer
{
  NSTimer *timeItemTimer;

  -[NSTimer invalidate](self->_timeItemTimer, "invalidate");
  timeItemTimer = self->_timeItemTimer;
  self->_timeItemTimer = 0;

}

- (SBStatusBarStateAggregator)initWithMainDisplayWindowScene:(id)a3
{
  return -[SBStatusBarStateAggregator initWithMainDisplayWindowScene:registerForNotifications:](self, "initWithMainDisplayWindowScene:registerForNotifications:", a3, 1);
}

- (SBStatusBarStateAggregator)initWithMainDisplayWindowScene:(id)a3 registerForNotifications:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  SBStatusBarStateAggregator *v8;
  SBStatusBarStateAggregator *v9;
  void *v10;
  uint64_t v11;
  SBStatusBarDefaults *statusBarDefaults;
  uint64_t v13;
  NSHashTable *postObservers;
  void *v15;
  SBSystemStatusBatteryDataProvider *v16;
  SBSystemStatusBatteryDataProvider *batteryDataProvider;
  SBSystemStatusStatusItemsDataProvider *v18;
  SBSystemStatusStatusItemsDataProvider *statusItemsDataProvider;
  id v20;
  void *v21;
  uint64_t v22;
  STTelephonyStatusDomainDataProvider *telephonyDataProvider;
  SBSystemStatusWifiDataProvider *v24;
  SBSystemStatusWifiDataProvider *wifiDataProvider;
  SBSystemStatusStatusBarOverridesArchiver *v26;
  SBSystemStatusStatusBarOverridesArchiver *statusBarOverridesObserver;
  uint64_t v28;
  STBatteryStatusDomain *batteryDomain;
  uint64_t v30;
  STCallingStatusDomain *callingDomain;
  uint64_t v32;
  STFocusStatusDomain *focusDomain;
  uint64_t v34;
  STPlaygroundsStatusDomain *playgroundsDomain;
  uint64_t v36;
  STStatusItemsStatusDomain *statusItemsDomain;
  uint64_t v38;
  STStewieStatusDomain *stewieDomain;
  uint64_t v40;
  STTelephonyStatusDomain *telephonyDomain;
  uint64_t v42;
  STVoiceControlStatusDomain *voiceControlDomain;
  uint64_t v44;
  STWifiStatusDomain *wifiDomain;
  void *v47;
  objc_super v48;

  v4 = a4;
  v7 = a3;
  v48.receiver = self;
  v48.super_class = (Class)SBStatusBarStateAggregator;
  v8 = -[SBStatusBarStateAggregator init](&v48, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_mainDisplayWindowScene, v7);
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "statusBarDefaults");
    v11 = objc_claimAutoreleasedReturnValue();
    statusBarDefaults = v9->_statusBarDefaults;
    v9->_statusBarDefaults = (SBStatusBarDefaults *)v11;

    v9->_cachedShowRSSI = -[SBStatusBarDefaults showRSSI](v9->_statusBarDefaults, "showRSSI");
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v13 = objc_claimAutoreleasedReturnValue();
    postObservers = v9->_postObservers;
    v9->_postObservers = (NSHashTable *)v13;

    *((_BYTE *)&v9->_data + 2536) = *((_BYTE *)&v9->_data + 2536) & 0xFD | (2
                                                                          * (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1));
    objc_msgSend((id)SBApp, "systemStatusServer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("SBStatusBarStateAggregator.m"), 239, CFSTR("SBStatusBarStateAggregator is being created before the system status server"));

    }
    v16 = objc_alloc_init(SBSystemStatusBatteryDataProvider);
    batteryDataProvider = v9->_batteryDataProvider;
    v9->_batteryDataProvider = v16;

    v18 = -[SBSystemStatusStatusItemsDataProvider initWithMainDisplayWindowScene:]([SBSystemStatusStatusItemsDataProvider alloc], "initWithMainDisplayWindowScene:", v7);
    statusItemsDataProvider = v9->_statusItemsDataProvider;
    v9->_statusItemsDataProvider = v18;

    v20 = objc_alloc(MEMORY[0x1E0DB0F00]);
    objc_msgSend((id)SBApp, "telephonyStateProvider");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "initWithServerHandle:stateProvider:", v15, v21);
    telephonyDataProvider = v9->_telephonyDataProvider;
    v9->_telephonyDataProvider = (STTelephonyStatusDomainDataProvider *)v22;

    v24 = objc_alloc_init(SBSystemStatusWifiDataProvider);
    wifiDataProvider = v9->_wifiDataProvider;
    v9->_wifiDataProvider = v24;

    v26 = objc_alloc_init(SBSystemStatusStatusBarOverridesArchiver);
    statusBarOverridesObserver = v9->_statusBarOverridesObserver;
    v9->_statusBarOverridesObserver = v26;

    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0DB0898]), "initWithServerHandle:", v15);
    batteryDomain = v9->_batteryDomain;
    v9->_batteryDomain = (STBatteryStatusDomain *)v28;

    v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0DB08B0]), "initWithServerHandle:", v15);
    callingDomain = v9->_callingDomain;
    v9->_callingDomain = (STCallingStatusDomain *)v30;

    v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0DB08E0]), "initWithServerHandle:", v15);
    focusDomain = v9->_focusDomain;
    v9->_focusDomain = (STFocusStatusDomain *)v32;

    v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0DB0960]), "initWithServerHandle:", v15);
    playgroundsDomain = v9->_playgroundsDomain;
    v9->_playgroundsDomain = (STPlaygroundsStatusDomain *)v34;

    v36 = objc_msgSend(objc_alloc(MEMORY[0x1E0DB0A40]), "initWithServerHandle:", v15);
    statusItemsDomain = v9->_statusItemsDomain;
    v9->_statusItemsDomain = (STStatusItemsStatusDomain *)v36;

    v38 = objc_msgSend(objc_alloc(MEMORY[0x1E0DB0A60]), "initWithServerHandle:", v15);
    stewieDomain = v9->_stewieDomain;
    v9->_stewieDomain = (STStewieStatusDomain *)v38;

    v40 = objc_msgSend(objc_alloc(MEMORY[0x1E0DB0A80]), "initWithServerHandle:", v15);
    telephonyDomain = v9->_telephonyDomain;
    v9->_telephonyDomain = (STTelephonyStatusDomain *)v40;

    v42 = objc_msgSend(objc_alloc(MEMORY[0x1E0DB0A90]), "initWithServerHandle:", v15);
    voiceControlDomain = v9->_voiceControlDomain;
    v9->_voiceControlDomain = (STVoiceControlStatusDomain *)v42;

    v44 = objc_msgSend(objc_alloc(MEMORY[0x1E0DB0A98]), "initWithServerHandle:", v15);
    wifiDomain = v9->_wifiDomain;
    v9->_wifiDomain = (STWifiStatusDomain *)v44;

    if (v4)
      -[SBStatusBarStateAggregator _registerForNotifications](v9, "_registerForNotifications");

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  objc_msgSend((id)SBApp, "sensorActivityDataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0DA9DE8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  -[SBSystemStatusBatteryDataProvider invalidate](self->_batteryDataProvider, "invalidate");
  -[SBSystemStatusStatusItemsDataProvider invalidate](self->_statusItemsDataProvider, "invalidate");
  -[STTelephonyStatusDomainDataProvider invalidate](self->_telephonyDataProvider, "invalidate");
  -[SBSystemStatusWifiDataProvider invalidate](self->_wifiDataProvider, "invalidate");
  -[STBatteryStatusDomain invalidate](self->_batteryDomain, "invalidate");
  -[STCallingStatusDomain invalidate](self->_callingDomain, "invalidate");
  -[STFocusStatusDomain invalidate](self->_focusDomain, "invalidate");
  -[STPlaygroundsStatusDomain invalidate](self->_playgroundsDomain, "invalidate");
  -[STStatusItemsStatusDomain invalidate](self->_statusItemsDomain, "invalidate");
  -[STStewieStatusDomain invalidate](self->_stewieDomain, "invalidate");
  -[STTelephonyStatusDomain invalidate](self->_telephonyDomain, "invalidate");
  -[STVoiceControlStatusDomain invalidate](self->_voiceControlDomain, "invalidate");
  -[STWifiStatusDomain invalidate](self->_wifiDomain, "invalidate");
  -[SBStatusBarStateAggregator _stopTimeItemTimer](self, "_stopTimeItemTimer");
  -[SBStatusBarStateAggregator _removeTetheringBackgroundActivityAssertion](self, "_removeTetheringBackgroundActivityAssertion");
  v6.receiver = self;
  v6.super_class = (Class)SBStatusBarStateAggregator;
  -[SBStatusBarStateAggregator dealloc](&v6, sel_dealloc);
}

- (const)_statusBarData
{
  return (const $6C45178016D353444451090973A2A97F *)&self->_data;
}

- (SBUserSessionController)_userSessionController
{
  SBUserSessionController *override_userSessionController;

  override_userSessionController = self->_override_userSessionController;
  if (override_userSessionController)
    return override_userSessionController;
  objc_msgSend((id)SBApp, "userSessionController");
  return (SBUserSessionController *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)_updateStateAtomicallyWithoutAnimationUsingBlock:(id)a3
{
  id v5;
  BOOL *p_performingAtomicUpdate;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];

  v5 = a3;
  p_performingAtomicUpdate = &self->_performingAtomicUpdate;
  if (self->_performingAtomicUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBStatusBarStateAggregator.m"), 402, CFSTR("%@ must not be called reentrantly"), v9);

  }
  *p_performingAtomicUpdate = 1;
  -[SBStatusBarStateAggregator beginCoalescentBlock](self, "beginCoalescentBlock");
  v7 = MEMORY[0x1E0C809B0];
  v11[4] = self;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79__SBStatusBarStateAggregator__updateStateAtomicallyWithoutAnimationUsingBlock___block_invoke;
  v12[3] = &unk_1E8E9EBA8;
  v12[4] = self;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __79__SBStatusBarStateAggregator__updateStateAtomicallyWithoutAnimationUsingBlock___block_invoke_2;
  v11[3] = &unk_1E8EBF418;
  (*((void (**)(id, $D1AFE4C712074D7A4DFED30A4D6E293D *, _QWORD *, _QWORD *))v5 + 2))(v5, &self->_atomicUpdateData, v12, v11);
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __79__SBStatusBarStateAggregator__updateStateAtomicallyWithoutAnimationUsingBlock___block_invoke_4;
  v10[3] = &unk_1E8EBF418;
  v10[4] = self;
  (*((void (**)(id, $D1AFE4C712074D7A4DFED30A4D6E293D *, void *, _QWORD *))v5 + 2))(v5, &self->_data, &__block_literal_global_374, v10);
  -[SBStatusBarStateAggregator endCoalescentBlock](self, "endCoalescentBlock");
  *p_performingAtomicUpdate = 0;

}

uint64_t __79__SBStatusBarStateAggregator__updateStateAtomicallyWithoutAnimationUsingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postItem:withState:inList:", a2, 3, *(_QWORD *)(a1 + 32) + 4304);
}

uint64_t __79__SBStatusBarStateAggregator__updateStateAtomicallyWithoutAnimationUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setItem:enabled:inList:itemPostState:", a2, a3, *(_QWORD *)(a1 + 32) + 4672, *(_QWORD *)(a1 + 32) + 4304);
}

uint64_t __79__SBStatusBarStateAggregator__updateStateAtomicallyWithoutAnimationUsingBlock___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setItem:enabled:inList:itemPostState:", a2, a3, *(_QWORD *)(a1 + 32) + 416, 0);
}

- (void)_tickRefCount:(int64_t *)a3 up:(BOOL)a4 withTransitionBlock:(id)a5
{
  _BOOL8 v5;
  id v7;
  int64_t v8;
  BOOL v9;
  BOOL v10;
  int64_t v11;
  id v12;

  v5 = a4;
  v7 = a5;
  v8 = *a3;
  if (v5)
  {
    *a3 = v8 + 1;
    if (!v8)
    {
LABEL_7:
      v12 = v7;
      (*((void (**)(id, _BOOL8))v7 + 2))(v7, v5);
      v7 = v12;
    }
  }
  else
  {
    v9 = v8 == 1;
    v10 = v8 < 1;
    v11 = v8 - 1;
    if (!v10)
    {
      *a3 = v11;
      if (v9)
        goto LABEL_7;
    }
  }

}

- (void)setShowsOverridesForRecording:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  _BOOL4 v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  SBLogStatusBarish();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240192;
    v8 = v3;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "set showing overrides for recording: %{public}d", buf, 8u);
  }

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__SBStatusBarStateAggregator_setShowsOverridesForRecording___block_invoke;
  v6[3] = &unk_1E8E9E980;
  v6[4] = self;
  -[SBStatusBarStateAggregator _tickRefCount:up:withTransitionBlock:](self, "_tickRefCount:up:withTransitionBlock:", &self->_showsRecordingOverrides, v3, v6);
}

uint64_t __60__SBStatusBarStateAggregator_setShowsOverridesForRecording___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "beginCoalescentBlock");
  objc_msgSend(*(id *)(a1 + 32), "_updateOverrideDate");
  objc_msgSend(*(id *)(a1 + 32), "_updateAirplayItem");
  objc_msgSend(*(id *)(a1 + 32), "_updateSignalStrengthItem");
  objc_msgSend(*(id *)(a1 + 32), "_updateServiceItem");
  objc_msgSend(*(id *)(a1 + 32), "_updateDataNetworkItem");
  objc_msgSend(*(id *)(a1 + 32), "_updateSecondarySignalStrengthItem");
  objc_msgSend(*(id *)(a1 + 32), "_updateSecondaryServiceItem");
  objc_msgSend(*(id *)(a1 + 32), "_updateSecondaryDataNetworkItem");
  objc_msgSend(*(id *)(a1 + 32), "_updateBatteryItems");
  return objc_msgSend(*(id *)(a1 + 32), "endCoalescentBlock");
}

- (void)setShouldShowBluetoothHeadphoneGlyph:(BOOL)a3 andShouldShowBluetoothHeadphoneBatteryPercent:(BOOL)a4
{
  if (self->_shouldShowBluetoothHeadphoneGlyph != a3 || self->_shouldShowBluetoothHeadphoneBatteryPercent != a4)
  {
    self->_shouldShowBluetoothHeadphoneGlyph = a3;
    self->_shouldShowBluetoothHeadphoneBatteryPercent = a4;
    -[SBStatusBarStateAggregator _updateBluetoothBatteryItem](self, "_updateBluetoothBatteryItem");
  }
}

- (void)setAlarmEnabled:(BOOL)a3
{
  -[SBSystemStatusStatusItemsDataProvider setAlarmEnabled:](self->_statusItemsDataProvider, "setAlarmEnabled:", a3);
  -[SBStatusBarStateAggregator updateStatusBarItem:](self, "updateStatusBarItem:", 18);
}

- (void)setShowsActivityIndicatorOnHomeScreen:(BOOL)a3
{
  self->_showsActivityIndicatorOnHomeScreen = a3;
  -[SBStatusBarStateAggregator updateStatusBarItem:](self, "updateStatusBarItem:", 32);
}

- (void)setShowsActivityIndicatorEverywhere:(BOOL)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __66__SBStatusBarStateAggregator_setShowsActivityIndicatorEverywhere___block_invoke;
  v3[3] = &unk_1E8E9E980;
  v3[4] = self;
  -[SBStatusBarStateAggregator _tickRefCount:up:withTransitionBlock:](self, "_tickRefCount:up:withTransitionBlock:", &self->_activityIndicatorEverywhereCount, a3, v3);
}

uint64_t __66__SBStatusBarStateAggregator_setShowsActivityIndicatorEverywhere___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateStatusBarItem:", 32);
}

- (void)setShowsSyncActivityIndicator:(BOOL)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__SBStatusBarStateAggregator_setShowsSyncActivityIndicator___block_invoke;
  v3[3] = &unk_1E8E9E980;
  v3[4] = self;
  -[SBStatusBarStateAggregator _tickRefCount:up:withTransitionBlock:](self, "_tickRefCount:up:withTransitionBlock:", &self->_syncActivityIndicatorCount, a3, v3);
}

uint64_t __60__SBStatusBarStateAggregator_setShowsSyncActivityIndicator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateStatusBarItem:", 32);
}

- (void)setUserNameOverride:(id)a3
{
  NSString *v4;
  NSString *overridePersonName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  overridePersonName = self->_overridePersonName;
  self->_overridePersonName = v4;

  -[SBStatusBarStateAggregator updateStatusBarItem:](self, "updateStatusBarItem:", 8);
}

- (void)addPostingObserver:(id)a3
{
  id v5;
  uint64_t i;
  uint64_t j;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (self->_notifyingPostObservers)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBStatusBarStateAggregator.m"), 514, CFSTR("calls to %s are not allowed from within observer notifications"), "-[SBStatusBarStateAggregator addPostingObserver:]");

    v5 = v9;
  }
  if (!-[NSHashTable containsObject:](self->_postObservers, "containsObject:", v5))
  {
    -[NSHashTable addObject:](self->_postObservers, "addObject:", v9);
    if (self->_hasPostedOnce)
    {
      objc_msgSend(v9, "statusBarStateAggregatorDidStartPost:", self);
      for (i = 0; i != 46; ++i)
        objc_msgSend(v9, "statusBarStateAggregator:didVisitItem:withUpdates:toData:", self, i, 1, &self->_data);
      objc_msgSend(v9, "statusBarStateAggregator:didUpdateNonItemData:", self, &self->_data);
      if (!self->_coalescentBlockDepth)
        objc_msgSend(v9, "statusBarStateAggregatorDidFinishPost:withData:actions:", self, &self->_data, self->_actions);
    }
    else
    {
      if (self->_coalescentBlockDepth)
        objc_msgSend(v9, "statusBarStateAggregatorDidStartPost:", self);
      -[SBStatusBarStateAggregator beginCoalescentBlock](self, "beginCoalescentBlock");
      -[SBStatusBarStateAggregator _resetTimeItemFormatter](self, "_resetTimeItemFormatter");
      for (j = 0; j != 46; ++j)
      {
        -[SBStatusBarStateAggregator updateStatusBarItem:](self, "updateStatusBarItem:", j);
        -[SBStatusBarStateAggregator _notifyItemChanged:](self, "_notifyItemChanged:", j);
      }
      -[SBStatusBarStateAggregator _updateTetheringState](self, "_updateTetheringState");
      self->_hasPostedOnce = 1;
      -[SBStatusBarStateAggregator endCoalescentBlock](self, "endCoalescentBlock");
    }
  }

}

- (void)removePostingObserver:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (self->_notifyingPostObservers)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBStatusBarStateAggregator.m"), 552, CFSTR("calls to %s are not allowed from within observer notifications"), "-[SBStatusBarStateAggregator removePostingObserver:]");

    v5 = v7;
  }
  -[NSHashTable removeObject:](self->_postObservers, "removeObject:", v5);

}

- (void)_registerForNotifications
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  SBStatusBarDefaults *statusBarDefaults;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  SBStatusBarDefaults *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  SBStatusBarDefaults *v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  SBStatusBarDefaults *v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  id v71;
  void *v72;
  uint64_t v73;
  id v74;
  id v75;
  uint64_t v76;
  id v77;
  id v78;
  void *v79;
  NSMutableArray *v80;
  NSMutableArray *connectedClassicBluetoothDevices;
  id v82;
  uint64_t v83;
  void *v84;
  CBCentralManager *v85;
  CBCentralManager *coreBluetoothManager;
  uint64_t v87;
  id v88;
  id v89;
  __CFString *v90;
  id v91;
  id v92;
  void *v93;
  id v94;
  void *v95;
  id v96;
  id v97;
  id v98;
  void *v99;
  id v100;
  id v101;
  id v102;
  uint64_t v103;
  id v104;
  id v105;
  uint64_t v106;
  id v107;
  id v108;
  id v109;
  id v110;
  void *v111;
  id v112;
  id v113;
  void *v114;
  SBStatusBarDefaults *v115;
  void *v116;
  id v117;
  id v118;
  id v119;
  id v120;
  dispatch_block_t v121;
  dispatch_block_t v122;
  dispatch_block_t v123;
  dispatch_block_t v124;
  dispatch_block_t v125;
  dispatch_block_t block;
  void *v127;
  _QWORD v128[5];
  _QWORD v129[4];
  id v130;
  _QWORD v131[4];
  id v132;
  _QWORD v133[4];
  id v134;
  _QWORD v135[4];
  id v136;
  _QWORD v137[4];
  id v138;
  _QWORD v139[4];
  id v140;
  _QWORD v141[4];
  id v142;
  _QWORD v143[4];
  id v144;
  _QWORD v145[4];
  id v146;
  _QWORD v147[4];
  id v148;
  _QWORD v149[4];
  id v150;
  _QWORD v151[5];
  id v152;
  _QWORD v153[4];
  id v154;
  _QWORD v155[4];
  id v156;
  _QWORD v157[4];
  id v158;
  _QWORD v159[4];
  id v160;
  _QWORD v161[4];
  id v162;
  id v163;
  _QWORD v164[4];
  id v165;
  _QWORD v166[4];
  id v167;
  id v168;
  _QWORD v169[4];
  id v170;
  _QWORD v171[4];
  id v172;
  id v173;
  _QWORD v174[4];
  id v175;
  _QWORD v176[5];
  id v177;
  _QWORD v178[4];
  id v179;
  _QWORD v180[4];
  id v181;
  _QWORD v182[4];
  id v183;
  _QWORD v184[5];
  id v185;
  _QWORD v186[4];
  id v187;
  id v188;
  _QWORD v189[4];
  id v190;
  _QWORD v191[5];
  _QWORD v192[4];
  id v193;
  _QWORD v194[4];
  id v195;
  _QWORD v196[4];
  id v197;
  _QWORD v198[5];
  _QWORD v199[5];
  _QWORD v200[4];
  id v201;
  _QWORD v202[4];
  id v203;
  _QWORD v204[4];
  id v205;
  _QWORD v206[4];
  id v207;
  id location;
  _QWORD v209[2];
  _QWORD v210[2];
  void *v211;
  void *v212;
  _QWORD v213[4];

  v213[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v4 = MEMORY[0x1E0C809B0];
  v206[0] = MEMORY[0x1E0C809B0];
  v206[1] = 3221225472;
  v206[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke;
  v206[3] = &unk_1E8EBF460;
  objc_copyWeak(&v207, &location);
  v204[0] = v4;
  v204[1] = 3221225472;
  v204[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_2;
  v204[3] = &unk_1E8EABB80;
  v5 = (id)MEMORY[0x1D17E5550](v206);
  v205 = v5;
  v6 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("SBBootCompleteNotification"), 0, v127, v204);
  v202[0] = v4;
  v202[1] = 3221225472;
  v202[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_4;
  v202[3] = &unk_1E8EABB80;
  v7 = v5;
  v203 = v7;
  v8 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("SBSignificantTimeChangedNotification"), 0, v127, v202);
  v200[0] = v4;
  v200[1] = 3221225472;
  v200[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_6;
  v200[3] = &unk_1E8EABB80;
  v9 = v7;
  v201 = v9;
  v10 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("SBCurrentLocaleDidChangeNotification"), 0, v127, v200);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__restartTimeItemTimer, CFSTR("SBWorkspaceDidWakeFromSleepNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_systemApertureLayoutDidChange_, CFSTR("SBSystemApertureLayoutDidChangeNotification"), 0);
  v199[0] = v4;
  v199[1] = 3221225472;
  v199[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_8;
  v199[3] = &unk_1E8E9DED8;
  v199[4] = self;
  block = (dispatch_block_t)MEMORY[0x1D17E5550](v199);
  statusBarDefaults = self->_statusBarDefaults;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "showOverridesForRecording");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C80D38];
  v14 = MEMORY[0x1E0C80D38];
  v15 = (id)-[SBStatusBarDefaults observeDefault:onQueue:withBlock:](statusBarDefaults, "observeDefault:onQueue:withBlock:", v12, v13, block);

  v16 = (void *)MEMORY[0x1E0C80D38];
  dispatch_async(MEMORY[0x1E0C80D38], block);

  v198[0] = v4;
  v198[1] = 3221225472;
  v198[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_9;
  v198[3] = &unk_1E8EBF508;
  v198[4] = self;
  v17 = (void *)MEMORY[0x1D17E5550](v198);
  v196[0] = v4;
  v196[1] = 3221225472;
  v196[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_10;
  v196[3] = &unk_1E8E9E8D0;
  v18 = v9;
  v197 = v18;
  v19 = (void *)MEMORY[0x1D17E5550](v196);
  -[SBStatusBarStateAggregator batteryDomain](self, "batteryDomain");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v194[0] = v4;
  v194[1] = 3221225472;
  v194[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_12;
  v194[3] = &unk_1E8EBF550;
  v125 = v19;
  v195 = v125;
  objc_msgSend(v20, "observeDataWithBlock:", v194);

  v21 = (void *)MEMORY[0x1E0C80D38];
  dispatch_async(MEMORY[0x1E0C80D38], v125);

  v22 = self->_statusBarDefaults;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "showBatteryPercentage");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v213[0] = v23;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "showBatteryLevel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v213[1] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v213, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v192[0] = v4;
  v192[1] = 3221225472;
  v192[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_13;
  v192[3] = &unk_1E8E9E8D0;
  v26 = v18;
  v193 = v26;
  v27 = (id)-[SBStatusBarDefaults observeDefaults:onQueue:withBlock:](v22, "observeDefaults:onQueue:withBlock:", v25, MEMORY[0x1E0C80D38], v192);

  v191[0] = v4;
  v191[1] = 3221225472;
  v191[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_15;
  v191[3] = &unk_1E8EBF598;
  v191[4] = self;
  v28 = (void *)MEMORY[0x1D17E5550](v191);
  -[SBStatusBarStateAggregator callingDomain](self, "callingDomain");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v189[0] = v4;
  v189[1] = 3221225472;
  v189[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_16;
  v189[3] = &unk_1E8EBF5C0;
  v30 = v28;
  v190 = v30;
  objc_msgSend(v29, "observeDataWithBlock:", v189);

  v186[0] = v4;
  v186[1] = 3221225472;
  v186[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_18;
  v186[3] = &unk_1E8EA1EE0;
  objc_copyWeak(&v188, &location);
  v120 = v30;
  v187 = v120;
  v31 = (void *)MEMORY[0x1E0C80D38];
  dispatch_async(MEMORY[0x1E0C80D38], v186);

  v184[0] = v4;
  v184[1] = 3221225472;
  v184[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_19;
  v184[3] = &unk_1E8EA02D8;
  v184[4] = self;
  v32 = v26;
  v185 = v32;
  v33 = (void *)MEMORY[0x1D17E5550](v184);
  -[SBStatusBarStateAggregator wifiDomain](self, "wifiDomain");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v182[0] = v4;
  v182[1] = 3221225472;
  v182[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_2_70;
  v182[3] = &unk_1E8EBF608;
  v124 = v33;
  v183 = v124;
  objc_msgSend(v34, "observeDataWithBlock:", v182);

  v35 = (void *)MEMORY[0x1E0C80D38];
  dispatch_async(MEMORY[0x1E0C80D38], v124);

  v180[0] = v4;
  v180[1] = 3221225472;
  v180[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_3_72;
  v180[3] = &unk_1E8E9E8D0;
  v36 = v32;
  v181 = v36;
  v37 = (void *)MEMORY[0x1D17E5550](v180);
  -[SBStatusBarStateAggregator focusDomain](self, "focusDomain");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v178[0] = v4;
  v178[1] = 3221225472;
  v178[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_5_75;
  v178[3] = &unk_1E8EBF650;
  v123 = v37;
  v179 = v123;
  objc_msgSend(v38, "observeDataWithBlock:", v178);

  v39 = (void *)MEMORY[0x1E0C80D38];
  dispatch_async(MEMORY[0x1E0C80D38], v123);

  objc_msgSend((id)SBApp, "sensorActivityDataProvider");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "addObserver:", self);
  v176[0] = v4;
  v176[1] = 3221225472;
  v176[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_6_77;
  v176[3] = &unk_1E8E9E820;
  v176[4] = self;
  v119 = v40;
  v177 = v119;
  v41 = (void *)MEMORY[0x1E0C80D38];
  dispatch_async(MEMORY[0x1E0C80D38], v176);

  -[SBStatusBarStateAggregator playgroundsDomain](self, "playgroundsDomain");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v174[0] = v4;
  v174[1] = 3221225472;
  v174[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_7_78;
  v174[3] = &unk_1E8EBF678;
  v43 = v17;
  v175 = v43;
  objc_msgSend(v42, "observeDataWithBlock:", v174);

  v171[0] = v4;
  v171[1] = 3221225472;
  v171[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_9_81;
  v171[3] = &unk_1E8EA1EE0;
  objc_copyWeak(&v173, &location);
  v44 = v43;
  v172 = v44;
  v45 = (void *)MEMORY[0x1E0C80D38];
  dispatch_async(MEMORY[0x1E0C80D38], v171);

  -[SBStatusBarStateAggregator statusItemsDomain](self, "statusItemsDomain");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v169[0] = v4;
  v169[1] = 3221225472;
  v169[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_10_82;
  v169[3] = &unk_1E8EBF6A0;
  v47 = v44;
  v170 = v47;
  objc_msgSend(v46, "observeDataWithBlock:", v169);

  v166[0] = v4;
  v166[1] = 3221225472;
  v166[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_12_85;
  v166[3] = &unk_1E8EA1EE0;
  objc_copyWeak(&v168, &location);
  v48 = v47;
  v167 = v48;
  v49 = (void *)MEMORY[0x1E0C80D38];
  dispatch_async(MEMORY[0x1E0C80D38], v166);

  -[SBStatusBarStateAggregator stewieDomain](self, "stewieDomain");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v164[0] = v4;
  v164[1] = 3221225472;
  v164[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_13_86;
  v164[3] = &unk_1E8EBF6C8;
  v51 = v48;
  v165 = v51;
  objc_msgSend(v50, "observeDataWithBlock:", v164);

  v161[0] = v4;
  v161[1] = 3221225472;
  v161[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_15_89;
  v161[3] = &unk_1E8EA1EE0;
  objc_copyWeak(&v163, &location);
  v118 = v51;
  v162 = v118;
  v52 = (void *)MEMORY[0x1E0C80D38];
  dispatch_async(MEMORY[0x1E0C80D38], v161);

  v159[0] = v4;
  v159[1] = 3221225472;
  v159[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_16_90;
  v159[3] = &unk_1E8E9E8D0;
  v53 = v36;
  v160 = v53;
  v54 = (void *)MEMORY[0x1D17E5550](v159);
  -[SBStatusBarStateAggregator telephonyDomain](self, "telephonyDomain");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v157[0] = v4;
  v157[1] = 3221225472;
  v157[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_18_93;
  v157[3] = &unk_1E8EBF710;
  v122 = v54;
  v158 = v122;
  objc_msgSend(v55, "observeDataWithBlock:", v157);

  v56 = (void *)MEMORY[0x1E0C80D38];
  dispatch_async(MEMORY[0x1E0C80D38], v122);

  v155[0] = v4;
  v155[1] = 3221225472;
  v155[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_19_95;
  v155[3] = &unk_1E8E9E8D0;
  v57 = v53;
  v156 = v57;
  v58 = (void *)MEMORY[0x1D17E5550](v155);
  -[SBStatusBarStateAggregator voiceControlDomain](self, "voiceControlDomain");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v153[0] = v4;
  v153[1] = 3221225472;
  v153[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_21;
  v153[3] = &unk_1E8EBF758;
  v121 = v58;
  v154 = v121;
  objc_msgSend(v59, "observeDataWithBlock:", v153);

  v60 = (void *)MEMORY[0x1E0C80D38];
  dispatch_async(MEMORY[0x1E0C80D38], v121);

  v61 = self->_statusBarDefaults;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "showRSSI");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v212 = v62;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v212, 1);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v151[0] = v4;
  v151[1] = 3221225472;
  v151[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_22;
  v151[3] = &unk_1E8EA02D8;
  v151[4] = self;
  v64 = v57;
  v152 = v64;
  v65 = (id)-[SBStatusBarDefaults observeDefaults:onQueue:withBlock:](v61, "observeDefaults:onQueue:withBlock:", v63, MEMORY[0x1E0C80D38], v151);

  v66 = self->_statusBarDefaults;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "showThermalWarning");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v211 = v67;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v211, 1);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v149[0] = v4;
  v149[1] = 3221225472;
  v149[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_24;
  v149[3] = &unk_1E8E9E8D0;
  v69 = v64;
  v150 = v69;
  v70 = (id)-[SBStatusBarDefaults observeDefaults:onQueue:withBlock:](v66, "observeDefaults:onQueue:withBlock:", v68, MEMORY[0x1E0C80D38], v149);

  v71 = +[SBAirplaneModeController sharedInstance](SBAirplaneModeController, "sharedInstance");
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_beginCoalescentBlock, *MEMORY[0x1E0DAC2C8], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__noteAirplaneModeChanged, *MEMORY[0x1E0DAC2B8], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_endCoalescentBlock, *MEMORY[0x1E0DAC2C0], 0);
  objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = *MEMORY[0x1E0D033B0];
  v147[0] = v4;
  v147[1] = 3221225472;
  v147[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_26;
  v147[3] = &unk_1E8EABB80;
  v74 = v69;
  v148 = v74;
  v75 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v73, 0, v127, v147);
  v76 = *MEMORY[0x1E0D033C0];
  v145[0] = v4;
  v145[1] = 3221225472;
  v145[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_28;
  v145[3] = &unk_1E8EABB80;
  v77 = v74;
  v146 = v77;
  v78 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v76, 0, v127, v145);
  objc_msgSend(v72, "connectedDevices");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v79, "count"))
  {
    v80 = (NSMutableArray *)objc_msgSend(v79, "mutableCopy");
    connectedClassicBluetoothDevices = self->_connectedClassicBluetoothDevices;
    self->_connectedClassicBluetoothDevices = v80;

  }
  v82 = objc_alloc(MEMORY[0x1E0C97728]);
  v83 = *MEMORY[0x1E0C97698];
  v209[0] = *MEMORY[0x1E0C97640];
  v209[1] = v83;
  v210[0] = MEMORY[0x1E0C9AAB0];
  v210[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v210, v209, 2);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = (CBCentralManager *)objc_msgSend(v82, "initWithDelegate:queue:options:", self, MEMORY[0x1E0C80D38], v84);
  coreBluetoothManager = self->_coreBluetoothManager;
  self->_coreBluetoothManager = v85;

  v87 = *MEMORY[0x1E0D03378];
  v143[0] = v4;
  v143[1] = 3221225472;
  v143[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_30;
  v143[3] = &unk_1E8EABB80;
  v88 = v77;
  v144 = v88;
  v89 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v87, 0, v127, v143);
  v90 = SBBluetoothConnectionChangedNotification;
  v141[0] = v4;
  v141[1] = 3221225472;
  v141[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_32;
  v141[3] = &unk_1E8EABB80;
  v91 = v88;
  v142 = v91;
  v92 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v90, 0, v127, v141);
  +[SBAVSystemControllerCache sharedInstance](SBAVSystemControllerCache, "sharedInstance");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "addObserver:", self);

  v139[0] = v4;
  v139[1] = 3221225472;
  v139[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_34;
  v139[3] = &unk_1E8EABB80;
  v94 = v91;
  v140 = v94;
  v95 = (void *)MEMORY[0x1D17E5550](v139);
  v96 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", SBBluetoothBatteryAvailabilityChangedNotification, 0, v127, v95);
  v97 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", SBBluetoothBatteryLevelChangedNotification, 0, v127, v95);
  v137[0] = v4;
  v137[1] = 3221225472;
  v137[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_36;
  v137[3] = &unk_1E8EABB80;
  v98 = v94;
  v138 = v98;
  v99 = (void *)MEMORY[0x1D17E5550](v137);
  v100 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("SBApplicationShowsProgressChangedNotification"), 0, v127, v99);
  v101 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("SBApplicationPlaceholdersNetworkUsageDidChangeNotification"), 0, v127, v99);
  v102 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("SBFrontmostDisplayChangedNotification"), 0, v127, v99);
  v103 = *MEMORY[0x1E0DAC360];
  v135[0] = v4;
  v135[1] = 3221225472;
  v135[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_38;
  v135[3] = &unk_1E8EABB80;
  v104 = v98;
  v136 = v104;
  v105 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v103, 0, v127, v135);
  v106 = *MEMORY[0x1E0DAA248];
  v133[0] = v4;
  v133[1] = 3221225472;
  v133[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_40;
  v133[3] = &unk_1E8EABB80;
  v107 = v104;
  v134 = v107;
  v108 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v106, 0, v127, v133);
  v131[0] = v4;
  v131[1] = 3221225472;
  v131[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_42;
  v131[3] = &unk_1E8EABB80;
  v109 = v107;
  v132 = v109;
  v110 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("SBThermalControllerStateDidChange"), 0, v127, v131);
  objc_msgSend(MEMORY[0x1E0DA9DE8], "sharedInstance");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "addObserver:", self);

  v129[0] = v4;
  v129[1] = 3221225472;
  v129[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_44;
  v129[3] = &unk_1E8EABB80;
  v112 = v109;
  v130 = v112;
  v113 = (id)objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("SBRingerChangedNotification"), 0, v127, v129);
  v128[0] = v4;
  v128[1] = 3221225472;
  v128[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_46;
  v128[3] = &unk_1E8E9DED8;
  v128[4] = self;
  v114 = (void *)MEMORY[0x1D17E5550](v128);
  v115 = self->_statusBarDefaults;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "showRingerState");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = (id)-[SBStatusBarDefaults observeDefault:onQueue:withBlock:](v115, "observeDefault:onQueue:withBlock:", v116, MEMORY[0x1E0C80D38], v114);

  objc_destroyWeak(&v163);
  objc_destroyWeak(&v168);

  objc_destroyWeak(&v173);
  objc_destroyWeak(&v188);

  objc_destroyWeak(&v207);
  objc_destroyWeak(&location);

}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "_updatePersonNameItem");
  objc_msgSend(v2, "_updateLockItem");
  objc_msgSend(v2, "_updateRingerItem");

}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_resetTimeItemFormatter");
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_resetTimeItemFormatter");
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShowsOverridesForRecording:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "showOverridesForRecording"));
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateStatusBarForSystemStatusDomainName:data:", a2, a3);
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_11(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateBatteryItems");
}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_12(uint64_t a1)
{
  dispatch_async(MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 32));
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_13(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_14(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "updateStatusBarItem:", 13);
  +[SBBluetoothController sharedInstance](SBBluetoothController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateBattery");

}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_15(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "callDescriptors");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_updateCallingBackgroundActivityAssertionsForCallDescriptors:", v5);
  objc_msgSend((id)SBApp, "sensorActivityDataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeSensorActivityAttributions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_updateActiveAudioRecordingBackgroundActivityAssertionsForActiveSensorActivityAttributions:", v4);
}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_17;
  v6[3] = &unk_1E8E9F1E8;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_18(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "callingDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_19(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  SBLogStatusBarish();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "wifiDomain");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "STWifiStatusDomainData update: %{public}@", (uint8_t *)&v6, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_68(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "updateStatusBarItem:", 9);
  objc_msgSend(v2, "updateStatusBarItem:", 10);
  objc_msgSend(v2, "updateStatusBarItem:", 32);

}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_2_70(uint64_t a1)
{
  dispatch_async(MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 32));
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_3_72(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_4_73(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateStatusBarItem:", 2);
}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_5_75(uint64_t a1)
{
  dispatch_async(MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 32));
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_6_77(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activityDidChangeForSensorActivityDataProvider:", *(_QWORD *)(a1 + 40));
}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_7_78(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_8_79;
  v6[3] = &unk_1E8E9F1E8;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_8_79(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 7, *(_QWORD *)(a1 + 32));
}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_9_81(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "playgroundsDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_10_82(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_11_83;
  v6[3] = &unk_1E8E9F1E8;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_11_83(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 14, *(_QWORD *)(a1 + 32));
}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_12_85(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "statusItemsDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_13_86(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_14_87;
  v6[3] = &unk_1E8E9F1E8;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_14_87(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 8, *(_QWORD *)(a1 + 32));
}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_15_89(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "stewieDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_16_90(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_17_91(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "updateStatusBarItem:", 4);
  objc_msgSend(v2, "updateStatusBarItem:", 5);
  objc_msgSend(v2, "updateStatusBarItem:", 6);
  objc_msgSend(v2, "updateStatusBarItem:", 7);
  objc_msgSend(v2, "updateStatusBarItem:", 9);
  objc_msgSend(v2, "updateStatusBarItem:", 10);
  objc_msgSend(v2, "updateStatusBarItem:", 32);
  objc_msgSend(v2, "updateStatusBarItem:", 30);
  objc_msgSend(v2, "updateStatusBarItem:", 31);
  objc_msgSend(v2, "updateStatusBarItem:", 45);

}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_18_93(uint64_t a1)
{
  dispatch_async(MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 32));
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_19_95(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_20(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateStatusBarItem:", 41);
}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_21(uint64_t a1)
{
  dispatch_async(MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 32));
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_22(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8689) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "showRSSI");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_23(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "updateStatusBarItem:", 9);
  objc_msgSend(v2, "updateStatusBarItem:", 10);

}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_24(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_25(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateStatusBarItem:", 33);
}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_26(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void (*v5)(uint64_t, _QWORD *);
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_27;
  v7[3] = &unk_1E8EBF7C0;
  v8 = v3;
  v5 = *(void (**)(uint64_t, _QWORD *))(v4 + 16);
  v6 = v3;
  v5(v4, v7);

}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_27(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id *v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  if (v7 && (objc_msgSend(v11[1091], "containsObject:", v7) & 1) == 0)
  {
    v8 = v11[1091];
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v11[1091];
      v11[1091] = (id)v9;

      v8 = v11[1091];
    }
    objc_msgSend(v8, "addObject:", v7);
    objc_msgSend(v11, "updateStatusBarItem:", 16);
  }

}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_28(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void (*v5)(uint64_t, _QWORD *);
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_29;
  v7[3] = &unk_1E8EBF7C0;
  v8 = v3;
  v5 = *(void (**)(uint64_t, _QWORD *))(v4 + 16);
  v6 = v3;
  v5(v4, v7);

}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_29(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id *v9;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  if (v7 && objc_msgSend(v9[1091], "containsObject:", v7))
  {
    objc_msgSend(v9[1091], "removeObject:", v7);
    if (!objc_msgSend(v9[1091], "count"))
    {
      v8 = v9[1091];
      v9[1091] = 0;

    }
    objc_msgSend(v9, "updateStatusBarItem:", 16);
  }

}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_30(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_31(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateStatusBarItem:", 42);
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_32(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_33(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "updateStatusBarItem:", 9);
  objc_msgSend(v2, "updateStatusBarItem:", 10);

}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_34(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_35(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateStatusBarItem:", 15);
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_38(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_39(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateTetheringState");
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_40(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_41(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateLockItem");
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_42(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_43(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateThermalColorItem");
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_44(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_45(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateRingerItem");
}

uint64_t __55__SBStatusBarStateAggregator__registerForNotifications__block_invoke_46(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateRingerItem");
}

- (void)_updateLockItem
{
  void *v3;
  uint64_t v4;

  objc_msgSend((id)SBApp, "authenticationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAuthenticated") ^ 1;

  -[SBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", 39, v4);
}

- (BOOL)_isInAirplaneMode
{
  void *v2;
  char v3;

  +[SBAirplaneModeController sharedInstance](SBAirplaneModeController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInAirplaneMode");

  return v3;
}

- (void)_updateAirplaneMode
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[STStatusItemsStatusDomain data](self->_statusItemsDomain, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeStatusItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", *MEMORY[0x1E0DB0E58]);

  -[SBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", 3, v5);
}

- (void)_updateSignalStrengthItem
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  -[SBStatusBarStateAggregator telephonyDomain](self, "telephonyDomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "primarySIMInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[4] = self;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__SBStatusBarStateAggregator__updateSignalStrengthItem__block_invoke;
  v7[3] = &unk_1E8EBF910;
  v7[4] = self;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__SBStatusBarStateAggregator__updateSignalStrengthItem__block_invoke_2;
  v6[3] = &unk_1E8E9EBA8;
  -[SBStatusBarStateAggregator _updateSignalStrengthItem:withData:SIMInfo:barsGetter:barsSetter:](self, "_updateSignalStrengthItem:withData:SIMInfo:barsGetter:barsSetter:", 4, v4, v5, v7, v6);

}

uint64_t __55__SBStatusBarStateAggregator__updateSignalStrengthItem__block_invoke(uint64_t a1)
{
  return *(unsigned int *)(*(_QWORD *)(a1 + 32) + 856);
}

uint64_t __55__SBStatusBarStateAggregator__updateSignalStrengthItem__block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 856) = a2;
  return result;
}

- (void)_updateSecondarySignalStrengthItem
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  -[SBStatusBarStateAggregator telephonyDomain](self, "telephonyDomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "secondarySIMInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *((_BYTE *)&self->_data + 3160) = *((_BYTE *)&self->_data + 3160) & 0xFB | (4 * (v5 != 0));
  v6[4] = self;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__SBStatusBarStateAggregator__updateSecondarySignalStrengthItem__block_invoke;
  v7[3] = &unk_1E8EBF910;
  v7[4] = self;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__SBStatusBarStateAggregator__updateSecondarySignalStrengthItem__block_invoke_2;
  v6[3] = &unk_1E8E9EBA8;
  -[SBStatusBarStateAggregator _updateSignalStrengthItem:withData:SIMInfo:barsGetter:barsSetter:](self, "_updateSignalStrengthItem:withData:SIMInfo:barsGetter:barsSetter:", 5, v4, v5, v7, v6);

}

uint64_t __64__SBStatusBarStateAggregator__updateSecondarySignalStrengthItem__block_invoke(uint64_t a1)
{
  return *(unsigned int *)(*(_QWORD *)(a1 + 32) + 860);
}

uint64_t __64__SBStatusBarStateAggregator__updateSecondarySignalStrengthItem__block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 860) = a2;
  return result;
}

- (void)_updateSignalStrengthItem:(int)a3 withData:(id)a4 SIMInfo:(id)a5 barsGetter:(id)a6 barsSetter:(id)a7
{
  uint64_t v10;
  id v12;
  id v13;
  unsigned int (**v14)(_QWORD);
  void (**v15)(id, uint64_t);
  void *v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  unsigned int v23;
  unsigned int v24;
  NSObject *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  unsigned int v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v10 = *(_QWORD *)&a3;
  v33 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = (unsigned int (**)(_QWORD))a6;
  v15 = (void (**)(id, uint64_t))a7;
  -[SBStatusBarStateAggregator _telephonyManager](self, "_telephonyManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "containsCellularRadio");
  if (self->_showsRecordingOverrides && v17)
  {
    -[SBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", v10, (_DWORD)v10 == 4);
    if (v14[2](v14) != 4)
    {
      v15[2](v15, 4);
LABEL_22:
      -[SBStatusBarStateAggregator _notifyItemChanged:](self, "_notifyItemChanged:", v10);
      goto LABEL_23;
    }
    goto LABEL_23;
  }
  v18 = objc_msgSend(v12, "isCellularRadioCapabilityEnabled");
  v19 = objc_msgSend(v13, "cellularServiceState");
  if (v13 && v18 && v19 == 2 && !-[SBStatusBarStateAggregator _isInAirplaneMode](self, "_isInAirplaneMode"))
  {
    -[SBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", v10, 1);
    v21 = objc_msgSend(v13, "signalStrengthBars");
  }
  else
  {
    v20 = objc_msgSend(v12, "isRadioModuleDead");
    -[SBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", v10, v20);
    if ((v20 & 1) == 0)
      goto LABEL_23;
    v21 = objc_msgSend(v13, "signalStrengthBars");
    if (!v13)
    {
      SBLogStatusBarish();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v22, OS_LOG_TYPE_DEFAULT, "Status bar data manager: reporting 0 signal strength bars because we have no SIM info.", buf, 2u);
      }
      goto LABEL_17;
    }
  }
  if ((_DWORD)v21)
    goto LABEL_18;
  SBLogStatusBarish();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v22, OS_LOG_TYPE_DEFAULT, "Status bar data manager: telephony domain reports 0 signal strength bars", buf, 2u);
    v21 = 0;
  }
LABEL_17:

LABEL_18:
  v23 = v14[2](v14);
  if (v23 != (_DWORD)v21)
  {
    v24 = v23;
    v15[2](v15, v21);
    SBLogStatusBarish();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      SBStatusBarItemDebugName(v10);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v28 = v26;
      v29 = 1026;
      v30 = v24;
      v31 = 1026;
      v32 = v21;
      _os_log_impl(&dword_1D0540000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ changing from '%{public}d' to '%{public}d'", buf, 0x18u);

    }
    goto LABEL_22;
  }
LABEL_23:

}

- (void)_updateServiceItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];

  -[SBStatusBarStateAggregator telephonyDomain](self, "telephonyDomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "primarySIMInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "secondarySIMInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = self;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __48__SBStatusBarStateAggregator__updateServiceItem__block_invoke;
  v14[3] = &unk_1E8EA89D0;
  v14[4] = self;
  v12[4] = self;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __48__SBStatusBarStateAggregator__updateServiceItem__block_invoke_2;
  v13[3] = &unk_1E8EAE058;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __48__SBStatusBarStateAggregator__updateServiceItem__block_invoke_3;
  v12[3] = &unk_1E8EA89D0;
  v10[4] = self;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__SBStatusBarStateAggregator__updateServiceItem__block_invoke_4;
  v11[3] = &unk_1E8EAE058;
  v11[4] = self;
  v9[4] = self;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__SBStatusBarStateAggregator__updateServiceItem__block_invoke_5;
  v10[3] = &unk_1E8EBF910;
  v8[4] = self;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__SBStatusBarStateAggregator__updateServiceItem__block_invoke_6;
  v9[3] = &unk_1E8E9EBA8;
  v7[4] = self;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__SBStatusBarStateAggregator__updateServiceItem__block_invoke_7;
  v8[3] = &unk_1E8EA89D0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__SBStatusBarStateAggregator__updateServiceItem__block_invoke_8;
  v7[3] = &unk_1E8EAE058;
  -[SBStatusBarStateAggregator _updateServiceItem:withData:SIMInfo:otherSIMInfo:serviceStringGetter:serviceStringSetter:serviceCrossfadeStringGetter:serviceCrossfadeStringSetter:serviceContentTypeGetter:serviceContentTypeSetter:serviceBadgeStringGetter:serviceBadgeStringSetter:](self, "_updateServiceItem:withData:SIMInfo:otherSIMInfo:serviceStringGetter:serviceStringSetter:serviceCrossfadeStringGetter:serviceCrossfadeStringSetter:serviceContentTypeGetter:serviceContentTypeSetter:serviceBadgeStringGetter:serviceBadgeStringSetter:", 6, v4, v5, v6, v14, v13, v12, v11, v10, v9, v8, v7);

}

id __48__SBStatusBarStateAggregator__updateServiceItem__block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8632);
}

void __48__SBStatusBarStateAggregator__updateServiceItem__block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8632), a2);
  v4 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8632), "getCString:maxLength:encoding:", *(_QWORD *)(a1 + 32) + 864, 100, 4);

}

id __48__SBStatusBarStateAggregator__updateServiceItem__block_invoke_3(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8640);
}

void __48__SBStatusBarStateAggregator__updateServiceItem__block_invoke_4(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8640), a2);
  v4 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8640), "getCString:maxLength:encoding:", *(_QWORD *)(a1 + 32) + 1064, 100, 4);

}

uint64_t __48__SBStatusBarStateAggregator__updateServiceItem__block_invoke_5(uint64_t a1)
{
  return *(unsigned int *)(*(_QWORD *)(a1 + 32) + 2488);
}

uint64_t __48__SBStatusBarStateAggregator__updateServiceItem__block_invoke_6(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 2488) = a2;
  return result;
}

id __48__SBStatusBarStateAggregator__updateServiceItem__block_invoke_7(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8664);
}

void __48__SBStatusBarStateAggregator__updateServiceItem__block_invoke_8(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8664), a2);
  v4 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8664), "getCString:maxLength:encoding:", *(_QWORD *)(a1 + 32) + 3577, 100, 4);

}

- (void)_updateSecondaryServiceItem
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];

  -[SBStatusBarStateAggregator telephonyDomain](self, "telephonyDomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "secondarySIMInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *((_BYTE *)&self->_data + 3160);
  *((_BYTE *)&self->_data + 3160) = v6 & 0xFB | (4 * (v5 != 0));
  if (self->_showsRecordingOverrides)
  {
    *((_BYTE *)&self->_data + 3160) = v6 & 0xFB;
  }
  else
  {
    objc_msgSend(v4, "primarySIMInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[4] = self;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __57__SBStatusBarStateAggregator__updateSecondaryServiceItem__block_invoke;
    v15[3] = &unk_1E8EA89D0;
    v15[4] = self;
    v13[4] = self;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __57__SBStatusBarStateAggregator__updateSecondaryServiceItem__block_invoke_2;
    v14[3] = &unk_1E8EAE058;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __57__SBStatusBarStateAggregator__updateSecondaryServiceItem__block_invoke_3;
    v13[3] = &unk_1E8EA89D0;
    v11[4] = self;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __57__SBStatusBarStateAggregator__updateSecondaryServiceItem__block_invoke_4;
    v12[3] = &unk_1E8EAE058;
    v12[4] = self;
    v10[4] = self;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __57__SBStatusBarStateAggregator__updateSecondaryServiceItem__block_invoke_5;
    v11[3] = &unk_1E8EBF910;
    v9[4] = self;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57__SBStatusBarStateAggregator__updateSecondaryServiceItem__block_invoke_6;
    v10[3] = &unk_1E8E9EBA8;
    v8[4] = self;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __57__SBStatusBarStateAggregator__updateSecondaryServiceItem__block_invoke_7;
    v9[3] = &unk_1E8EA89D0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __57__SBStatusBarStateAggregator__updateSecondaryServiceItem__block_invoke_8;
    v8[3] = &unk_1E8EAE058;
    -[SBStatusBarStateAggregator _updateServiceItem:withData:SIMInfo:otherSIMInfo:serviceStringGetter:serviceStringSetter:serviceCrossfadeStringGetter:serviceCrossfadeStringSetter:serviceContentTypeGetter:serviceContentTypeSetter:serviceBadgeStringGetter:serviceBadgeStringSetter:](self, "_updateServiceItem:withData:SIMInfo:otherSIMInfo:serviceStringGetter:serviceStringSetter:serviceCrossfadeStringGetter:serviceCrossfadeStringSetter:serviceContentTypeGetter:serviceContentTypeSetter:serviceBadgeStringGetter:serviceBadgeStringSetter:", 7, v4, v5, v7, v15, v14, v13, v12, v11, v10, v9, v8);

  }
}

id __57__SBStatusBarStateAggregator__updateSecondaryServiceItem__block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8648);
}

void __57__SBStatusBarStateAggregator__updateSecondaryServiceItem__block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8648), a2);
  v4 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8648), "getCString:maxLength:encoding:", *(_QWORD *)(a1 + 32) + 964, 100, 4);

}

id __57__SBStatusBarStateAggregator__updateSecondaryServiceItem__block_invoke_3(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8656);
}

void __57__SBStatusBarStateAggregator__updateSecondaryServiceItem__block_invoke_4(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8656), a2);
  v4 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8656), "getCString:maxLength:encoding:", *(_QWORD *)(a1 + 32) + 1164, 100, 4);

}

uint64_t __57__SBStatusBarStateAggregator__updateSecondaryServiceItem__block_invoke_5(uint64_t a1)
{
  return *(unsigned int *)(*(_QWORD *)(a1 + 32) + 2492);
}

uint64_t __57__SBStatusBarStateAggregator__updateSecondaryServiceItem__block_invoke_6(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 2492) = a2;
  return result;
}

id __57__SBStatusBarStateAggregator__updateSecondaryServiceItem__block_invoke_7(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8672);
}

void __57__SBStatusBarStateAggregator__updateSecondaryServiceItem__block_invoke_8(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8672), a2);
  v4 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8672), "getCString:maxLength:encoding:", *(_QWORD *)(a1 + 32) + 3677, 100, 4);

}

- (void)_updateServiceItem:(int)a3 withData:(id)a4 SIMInfo:(id)a5 otherSIMInfo:(id)a6 serviceStringGetter:(id)a7 serviceStringSetter:(id)a8 serviceCrossfadeStringGetter:(id)a9 serviceCrossfadeStringSetter:(id)a10 serviceContentTypeGetter:(id)a11 serviceContentTypeSetter:(id)a12 serviceBadgeStringGetter:(id)a13 serviceBadgeStringSetter:(id)a14
{
  id v18;
  void (**v19)(_QWORD);
  void (**v20)(id, const __CFString *);
  void (**v21)(id, void *);
  unsigned int (**v22)(_QWORD);
  void (**v23)(id, uint64_t);
  void *v24;
  void *v25;
  void *v26;
  void (**v27)(_QWORD);
  void *v28;
  uint64_t v29;
  uint64_t v30;
  __CFString *v31;
  uint64_t v32;
  int v33;
  char v34;
  int v35;
  uint64_t v36;
  SBStatusBarStateAggregator *v37;
  char v38;
  uint64_t v39;
  BOOL v40;
  int v41;
  BOOL v42;
  char v43;
  NSObject *v44;
  unsigned int v45;
  __CFString *v46;
  NSObject *v47;
  unsigned int serviceContentType;
  __CFString *v49;
  __CFString *v50;
  char v51;
  NSObject *v52;
  __CFString *v53;
  __CFString *v54;
  uint64_t v55;
  __CFString *v56;
  NSObject *v57;
  __CFString *v58;
  uint64_t v59;
  void *v60;
  __CFString *v61;
  void *v62;
  NSObject *v63;
  void (**v64)(id, void *);
  void (**v65)(id, const __CFString *);
  __CFString *v66;
  char v67;
  void *v68;
  void *v69;
  unsigned int v70;
  void *v71;
  char v72;
  __CFString *v73;
  __CFString *v74;
  __CFString *v75;
  __CFString *v76;
  _BOOL4 v77;
  __CFString *v78;
  id v79;
  id v80;
  void (**v81)(id, _QWORD);
  void (**v82)(void);
  id v83;
  uint8_t buf[4];
  _BYTE v87[10];
  _BYTE v88[10];
  __CFString *v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v79 = a4;
  v18 = a5;
  v83 = a6;
  v19 = (void (**)(_QWORD))a7;
  v20 = (void (**)(id, const __CFString *))a8;
  v80 = a9;
  v21 = (void (**)(id, void *))a10;
  v22 = (unsigned int (**)(_QWORD))a11;
  v23 = (void (**)(id, uint64_t))a12;
  v82 = (void (**)(void))a13;
  v81 = (void (**)(id, _QWORD))a14;
  if (self->_showsRecordingOverrides)
  {
    -[SBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", a3, 1);
    v20[2](v20, &stru_1E8EC7EC0);
    v23[2](v23, 4);
    v24 = v79;
    v25 = v83;
    v26 = v18;
LABEL_6:
    v27 = v19;
    v28 = v80;
    goto LABEL_7;
  }
  v26 = v18;
  if (!v18 || self->_suppressCellServiceForAirplaneModeTransition)
  {
    -[SBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", a3, 0);
    v24 = v79;
    v25 = v83;
    goto LABEL_6;
  }
  v24 = v79;
  v25 = v83;
  v27 = v19;
  if (-[SBStatusBarStateAggregator _isInAirplaneMode](self, "_isInAirplaneMode"))
  {
    v29 = objc_msgSend(v26, "isRegisteredWithoutCellular");
    -[SBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", a3, v29);
    v28 = v80;
    if ((v29 & 1) == 0)
      goto LABEL_7;
  }
  else
  {
    -[SBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", a3, 1);
  }
  v72 = objc_msgSend(v79, "isCellularRadioCapabilityEnabled");
  v65 = v20;
  if ((v72 & 1) != 0 || objc_msgSend(v26, "isRegisteredWithoutCellular"))
  {
    objc_msgSend(v26, "serviceDescription");
    v75 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = MGCopyAnswer();
    if (v30)
      v31 = (__CFString *)v30;
    else
      v31 = 0;
    v75 = v31;
  }
  v77 = -[SBStatusBarStateAggregator _shouldShowEmergencyOnlyStatusForInfo:](self, "_shouldShowEmergencyOnlyStatusForInfo:", v26);
  v32 = objc_msgSend(v26, "serviceState");
  v33 = objc_msgSend(v79, "isInactiveSOSEnabled");
  if (objc_msgSend(v26, "isBootstrap"))
  {
    v73 = 0;
    if (((v77 | v33) & ((v32 & 0xFFFFFFFFFFFFFFFELL) == 2)) != 0)
      v34 = 2;
    else
      v34 = 0;
    *((_BYTE *)&self->_data + 3160) = *((_BYTE *)&self->_data + 3160) & 0xFC | v77 | v33 | v34;
    v35 = 7;
    goto LABEL_29;
  }
  v67 = v33;
  if ((v72 & 1) != 0)
  {
    v36 = v32;
    if (v32 == 2)
    {
      v70 = 0;
      v73 = 0;
      v37 = self;
      v20 = v65;
      v38 = v67;
      if (v77)
        goto LABEL_46;
      goto LABEL_45;
    }
    v37 = self;
    if (v77)
    {
      *((_BYTE *)&self->_data + 3160) |= 1u;
      objc_msgSend(v26, "secondaryServiceDescription");
      v39 = objc_claimAutoreleasedReturnValue();
      v36 = v32;
      v73 = (__CFString *)v39;
      v40 = v77;
    }
    else
    {
      v40 = 0;
      v73 = 0;
    }
    if (v36 == 1)
    {
      v70 = 5;
    }
    else
    {
      if ((objc_msgSend(v79, "isUsingStewieConnection") & 1) != 0)
      {
        v70 = 0;
      }
      else
      {
        if (objc_msgSend(v79, "isRadioModuleDead"))
          v41 = 6;
        else
          v41 = 1;
        v70 = v41;
      }
      v36 = v32;
      v40 = v77;
    }
    if (v40)
    {
      v20 = v65;
    }
    else
    {
      v42 = -[SBStatusBarStateAggregator _shouldShowEmergencyOnlyStatusForInfo:](self, "_shouldShowEmergencyOnlyStatusForInfo:", v83);
      v36 = v32;
      v20 = v65;
      v38 = v67;
      if (!v42)
LABEL_45:
        *((_BYTE *)&v37->_data + 3160) = *((_BYTE *)&v37->_data + 3160) & 0xFE | v38;
    }
LABEL_46:
    if ((*((_BYTE *)&v37->_data + 3160) & ((v36 & 0xFFFFFFFFFFFFFFFELL) == 2)) != 0)
      v43 = 2;
    else
      v43 = 0;
    *((_BYTE *)&v37->_data + 3160) = v43 | *((_BYTE *)&v37->_data + 3160) & 0xFD;
    goto LABEL_50;
  }
  v73 = 0;
  *((_BYTE *)&self->_data + 3160) &= 0xFCu;
  v35 = 2;
LABEL_29:
  v70 = v35;
  v20 = v65;
LABEL_50:
  SBLogStatusBarish();
  v44 = objc_claimAutoreleasedReturnValue();
  v28 = v80;
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    v45 = *((unsigned __int8 *)&self->_data + 3160);
    *(_DWORD *)buf = 67240448;
    *(_DWORD *)v87 = v45 & 1;
    *(_WORD *)&v87[4] = 1026;
    *(_DWORD *)&v87[6] = (v45 >> 1) & 1;
    _os_log_impl(&dword_1D0540000, v44, OS_LOG_TYPE_DEFAULT, "shouldShowEmergencyOnlyStatus: %{public}i, emergencyOnly: %{public}i", buf, 0xEu);
  }

  v46 = CFSTR("secondary ");
  if (a3 != 7)
    v46 = &stru_1E8EC7EC0;
  v78 = v46;
  if (v70 != v22[2](v22))
  {
    SBLogStatusBarish();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      serviceContentType = self->_data.serviceContentType;
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)v87 = v78;
      *(_WORD *)&v87[8] = 1024;
      *(_DWORD *)v88 = serviceContentType;
      *(_WORD *)&v88[4] = 1024;
      *(_DWORD *)&v88[6] = v70;
      _os_log_impl(&dword_1D0540000, v47, OS_LOG_TYPE_DEFAULT, "%{public}@serviceContent changing from %i to %i", buf, 0x18u);
    }

    v23[2](v23, v70);
    -[SBStatusBarStateAggregator _notifyItemChanged:](self, "_notifyItemChanged:", a3);
  }
  v49 = &stru_1E8EC7EC0;
  if (v75)
    v49 = v75;
  v50 = v49;

  v27[2](v27);
  v76 = v50;
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = -[__CFString isEqualToString:](v50, "isEqualToString:");
  v25 = v83;
  if ((v51 & 1) == 0)
  {
    SBLogStatusBarish();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      SBStatusBarItemDebugName(a3);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)v87 = v68;
      *(_WORD *)&v87[8] = 2114;
      *(_QWORD *)v88 = v71;
      *(_WORD *)&v88[8] = 2114;
      v89 = v76;
      _os_log_impl(&dword_1D0540000, v52, OS_LOG_TYPE_DEFAULT, "%{public}@ changing from '%{public}@' to '%{public}@'", buf, 0x20u);

    }
    v20[2](v20, v76);
    -[SBStatusBarStateAggregator _notifyItemChanged:](self, "_notifyItemChanged:", a3);
    -[SBStatusBarStateAggregator _requestActions:](self, "_requestActions:", 1);
  }
  v53 = &stru_1E8EC7EC0;
  if (v73)
    v53 = v73;
  v54 = v53;

  (*((void (**)(id))v80 + 2))(v80);
  v55 = objc_claimAutoreleasedReturnValue();
  v74 = v54;
  v56 = v54;
  v24 = v79;
  v69 = (void *)v55;
  if ((-[__CFString isEqualToString:](v56, "isEqualToString:") & 1) == 0)
  {
    SBLogStatusBarish();
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)v87 = v78;
      *(_WORD *)&v87[8] = 2114;
      *(_QWORD *)v88 = v69;
      *(_WORD *)&v88[8] = 2114;
      v89 = v74;
      _os_log_impl(&dword_1D0540000, v57, OS_LOG_TYPE_DEFAULT, "%{public}@serviceCrossfade changing from '%{public}@' to '%{public}@'", buf, 0x20u);
    }

    v21[2](v21, v74);
    -[SBStatusBarStateAggregator _notifyItemChanged:](self, "_notifyItemChanged:", a3);
    -[SBStatusBarStateAggregator _requestActions:](self, "_requestActions:", 8);
  }
  v64 = v21;
  v58 = &stru_1E8EC7EC0;
  if (v83)
  {
    objc_msgSend(v26, "shortLabel");
    v59 = objc_claimAutoreleasedReturnValue();
    v60 = (void *)v59;
    if (v59)
      v61 = (__CFString *)v59;
    else
      v61 = &stru_1E8EC7EC0;
    v58 = v61;

  }
  v82[2]();
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[__CFString isEqualToString:](v58, "isEqualToString:") & 1) == 0)
  {
    v66 = v58;
    SBLogStatusBarish();
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)v87 = v78;
      *(_WORD *)&v87[8] = 2114;
      *(_QWORD *)v88 = v62;
      *(_WORD *)&v88[8] = 2114;
      v89 = v66;
      _os_log_impl(&dword_1D0540000, v63, OS_LOG_TYPE_DEFAULT, "%{public}@serviceBadgeString changing from '%{public}@' to '%{public}@'", buf, 0x20u);
    }

    v58 = v66;
    ((void (**)(id, __CFString *))v81)[2](v81, v66);
    -[SBStatusBarStateAggregator _notifyItemChanged:](self, "_notifyItemChanged:", a3);
  }

  v21 = v64;
LABEL_7:

}

- (void)_updateDataNetworkItem
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[5];

  -[SBStatusBarStateAggregator telephonyDomain](self, "telephonyDomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[4] = self;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__SBStatusBarStateAggregator__updateDataNetworkItem__block_invoke;
  v6[3] = &unk_1E8EBF910;
  v6[4] = self;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__SBStatusBarStateAggregator__updateDataNetworkItem__block_invoke_2;
  v5[3] = &unk_1E8E9EBA8;
  -[SBStatusBarStateAggregator _updateDataNetworkItem:withData:primary:dataNetworkTypeGetter:dataNetworkTypeSetter:](self, "_updateDataNetworkItem:withData:primary:dataNetworkTypeGetter:dataNetworkTypeSetter:", 9, v4, 1, v6, v5);

}

uint64_t __52__SBStatusBarStateAggregator__updateDataNetworkItem__block_invoke(uint64_t a1)
{
  return *(unsigned int *)(*(_QWORD *)(a1 + 32) + 2512);
}

uint64_t __52__SBStatusBarStateAggregator__updateDataNetworkItem__block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 2512) = a2;
  return result;
}

- (void)_updateSecondaryDataNetworkItem
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  -[SBStatusBarStateAggregator telephonyDomain](self, "telephonyDomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "secondarySIMInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *((_BYTE *)&self->_data + 3160) = *((_BYTE *)&self->_data + 3160) & 0xFB | (4 * (v5 != 0));
  v6[4] = self;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__SBStatusBarStateAggregator__updateSecondaryDataNetworkItem__block_invoke;
  v7[3] = &unk_1E8EBF910;
  v7[4] = self;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__SBStatusBarStateAggregator__updateSecondaryDataNetworkItem__block_invoke_2;
  v6[3] = &unk_1E8E9EBA8;
  -[SBStatusBarStateAggregator _updateDataNetworkItem:withData:primary:dataNetworkTypeGetter:dataNetworkTypeSetter:](self, "_updateDataNetworkItem:withData:primary:dataNetworkTypeGetter:dataNetworkTypeSetter:", 10, v4, 0, v7, v6);

}

uint64_t __61__SBStatusBarStateAggregator__updateSecondaryDataNetworkItem__block_invoke(uint64_t a1)
{
  return *(unsigned int *)(*(_QWORD *)(a1 + 32) + 2516);
}

uint64_t __61__SBStatusBarStateAggregator__updateSecondaryDataNetworkItem__block_invoke_2(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 2516) = a2;
  return result;
}

- (void)_updateDataNetworkItem:(int)a3 withData:(id)a4 primary:(BOOL)a5 dataNetworkTypeGetter:(id)a6 dataNetworkTypeSetter:(id)a7
{
  unsigned int v8;
  uint64_t (*v11)(id);
  id v12;
  id v13;
  uint64_t v14;
  _BOOL4 cachedShowRSSI;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _BOOL4 v20;
  int v21;
  int v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  _BOOL4 v30;
  int v31;
  void *v32;
  char v33;
  char v34;
  NSObject *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  id v40;
  void *v41;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v8 = a5;
  v47 = *MEMORY[0x1E0C80C00];
  v40 = a7;
  v11 = (uint64_t (*)(id))*((_QWORD *)a6 + 2);
  v12 = a6;
  v13 = a4;
  v14 = v11(v12);
  cachedShowRSSI = self->_cachedShowRSSI;
  objc_msgSend(v13, "primarySIMInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "secondarySIMInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v18 = v16;
  else
    v18 = v17;
  v19 = v18;
  v39 = v17;
  v41 = v19;
  if (self->_showsRecordingOverrides)
  {
    v20 = 0;
    v38 = 0;
    v21 = 1;
    v14 = 5;
    v22 = 3;
  }
  else
  {
    v23 = v19;
    if ((objc_msgSend(v16, "isProvidingDataConnection") & 1) != 0
      || objc_msgSend(v17, "isProvidingDataConnection"))
    {
      v8 = objc_msgSend(v23, "isProvidingDataConnection");
    }
    +[SBBluetoothController sharedInstance](SBBluetoothController, "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "tetheringConnected");

    if (v25)
    {
      v38 = 0;
      v22 = 0;
      v20 = cachedShowRSSI;
      v21 = 1;
      v14 = 6;
    }
    else
    {
      -[SBStatusBarStateAggregator wifiDomain](self, "wifiDomain");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "data");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v27, "isWifiActive"))
      {
        if (objc_msgSend(v27, "isAssociatedToIOSHotspot"))
          v14 = 6;
        else
          v14 = 5;
        v22 = objc_msgSend(v27, "signalStrengthBars");
        +[SBWiFiManager sharedInstance](SBWiFiManager, "sharedInstance");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v28, "signalStrengthRSSI");

        v21 = 1;
      }
      else
      {
        v8 = objc_msgSend(v41, "isProvidingDataConnection");
        if (v41)
        {
          v38 = 0;
          v22 = 0;
          v21 = 1;
          v14 = 7;
          switch(objc_msgSend(v41, "dataNetworkType"))
          {
            case 1:
              break;
            case 2:
              v38 = 0;
              v22 = 0;
              v14 = 0;
              break;
            case 3:
              v38 = 0;
              v22 = 0;
              v14 = 1;
              break;
            case 4:
            case 5:
              v38 = 0;
              v22 = 0;
              v14 = 2;
              break;
            case 6:
              v38 = 0;
              v22 = 0;
              v14 = 3;
              break;
            case 7:
              v38 = 0;
              v22 = 0;
              v14 = 4;
              break;
            case 8:
              v38 = 0;
              v22 = 0;
              v14 = 9;
              break;
            case 9:
              v38 = 0;
              v22 = 0;
              v14 = 10;
              break;
            case 10:
              v38 = 0;
              v22 = 0;
              v14 = 8;
              break;
            case 11:
              v38 = 0;
              v22 = 0;
              v14 = 11;
              break;
            case 12:
              v38 = 0;
              v22 = 0;
              v14 = 12;
              break;
            case 13:
              v38 = 0;
              v22 = 0;
              v14 = 13;
              break;
            case 14:
              v38 = 0;
              v22 = 0;
              v14 = 14;
              break;
            default:
              goto LABEL_19;
          }
        }
        else
        {
LABEL_19:
          v38 = 0;
          v22 = 0;
          v21 = 0;
        }
      }

      v20 = cachedShowRSSI;
    }
  }
  v29 = v21 & v8;
  v30 = -[SBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", a3, v29);
  v31 = (*((uint64_t (**)(id))a6 + 2))(v12);

  if ((_DWORD)v14 == v31)
  {
    v32 = v40;
    if (!v8)
      goto LABEL_39;
  }
  else
  {
    v32 = v40;
    (*((void (**)(id, uint64_t))v40 + 2))(v40, v14);
    if ((_DWORD)v29)
      -[SBStatusBarStateAggregator _notifyItemChanged:](self, "_notifyItemChanged:", a3);
    v30 = 1;
    if (!v8)
      goto LABEL_39;
  }
  if (v22 != self->_data.wifiSignalStrengthBars)
  {
    self->_data.wifiSignalStrengthBars = v22;
    if ((_DWORD)v29)
      -[SBStatusBarStateAggregator _notifyItemChanged:](self, "_notifyItemChanged:", a3);
  }
  if (v38 != self->_data.wifiSignalStrengthRaw)
  {
    self->_data.wifiSignalStrengthRaw = v38;
    if ((v20 & v29) == 1)
      -[SBStatusBarStateAggregator _notifyItemChanged:](self, "_notifyItemChanged:", a3);
  }
  v33 = *((_BYTE *)&self->_data + 2529);
  if (((v20 ^ ((v33 & 4) == 0)) & 1) == 0)
  {
    if (v20)
      v34 = 4;
    else
      v34 = 0;
    *((_BYTE *)&self->_data + 2529) = v33 & 0xFB | v34;
    if (!(_DWORD)v29)
      goto LABEL_43;
    -[SBStatusBarStateAggregator _notifyItemChanged:](self, "_notifyItemChanged:", a3);
  }
LABEL_39:
  if ((v29 & v30) == 1)
  {
    SBLogStatusBarish();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      SBStatusBarItemDebugName(a3);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      SBStatusBarDataNetworkDebugName(v14);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v44 = v36;
      v45 = 2114;
      v46 = v37;
      _os_log_impl(&dword_1D0540000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ changed to %{public}@", buf, 0x16u);

    }
  }
LABEL_43:

}

- (void)_updateLiquidDetectionItem
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[STStatusItemsStatusDomain data](self->_statusItemsDomain, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeStatusItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", *MEMORY[0x1E0DB0E80]);

  -[SBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", 40, v5);
}

- (void)_updateStewieItem
{
  uint64_t v2;
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  -[SBStatusBarStateAggregator telephonyDomain](self, "telephonyDomain");
  v2 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "isUsingStewieForSOS");
  v4 = objc_msgSend(v3, "isUsingStewieConnection");
  if ((v2 & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DB09E8], "entryWithConnectionStatus:", v4);
  else
    objc_msgSend(MEMORY[0x1E0DB09E8], "disabledEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DB0F18], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__SBStatusBarStateAggregator__updateStewieItem__block_invoke;
  v8[3] = &unk_1E8EBF938;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "updateWithData:", v8);

}

uint64_t __47__SBStatusBarStateAggregator__updateStewieItem__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dataByReplacingEntry:forKey:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0DB0D30]);
}

- (void)_updateBatteryItems
{
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  char v19;
  NSObject *v20;
  void *v21;
  NSString *batteryDetailString;
  void *v23;
  uint64_t v24;
  int v25;
  void *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  NSString *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[SBStatusBarStateAggregator batteryDomain](self, "batteryDomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "chargingState");
  -[SBStatusBarStateAggregator setBatteryChargingState:](self, "setBatteryChargingState:", v5);
  if (self->_showsRecordingOverrides)
    v6 = 100;
  else
    v6 = objc_msgSend(v4, "percentCharge");
  v7 = -[SBStatusBarStateAggregator _statusBarBatteryStateForSystemStatusChargingState:](self, "_statusBarBatteryStateForSystemStatusChargingState:", v5);
  v8 = objc_msgSend(v4, "chargingDescriptionType");
  v9 = objc_msgSend(v4, "isBatterySaverModeActive");
  if (v6 <= 0)
  {
    SBLogStatusBarish();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      SBStatusBarBatteryStateDebugName(v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543618;
      v26 = v11;
      v27 = 1024;
      v28 = v6;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "battery info changed to unpresentable (%{public}@ %i), resetting to capacity 1", (uint8_t *)&v25, 0x12u);

    }
    v6 = 1;
  }
  objc_msgSend(v4, "chargingDescription");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = &stru_1E8EC7EC0;
  if (v12)
    v14 = (__CFString *)v12;
  v15 = v14;

  if (self->_showsRecordingOverrides)
  {
    objc_msgSend(MEMORY[0x1E0D01B18], "localizedBatteryDetailTextForBatteryLevel:", 100.0);
    v16 = objc_claimAutoreleasedReturnValue();

    v15 = (__CFString *)v16;
  }
  if (os_variant_has_internal_content()
    && (-[SBStatusBarDefaults showBatteryLevel](self->_statusBarDefaults, "showBatteryLevel") & 1) != 0)
  {
    v17 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v18, "hasGasGauge");

    if ((_DWORD)v17)
      v17 = -[SBStatusBarDefaults showBatteryPercentage](self->_statusBarDefaults, "showBatteryPercentage");
  }
  v19 = -[__CFString isEqualToString:](v15, "isEqualToString:", self->_batteryDetailString);
  if ((v19 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_batteryDetailString, v15);
    -[NSString getCString:maxLength:encoding:](self->_batteryDetailString, "getCString:maxLength:encoding:", self->_data.batteryDetailString, 150, 4);
  }
  if (v6 == self->_data.batteryCapacity
    && (_DWORD)v7 == self->_data.batteryState
    && ((v9 ^ ((*((_BYTE *)&self->_data + 2536) & 1) == 0)) & 1) != 0)
  {
    -[SBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", 12, 1);
    -[SBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", 13, v17);
    -[SBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", 14, v8 == 2);
    if ((v19 & 1) != 0)
      goto LABEL_28;
  }
  else
  {
    self->_data.batteryCapacity = v6;
    self->_data.batteryState = v7;
    *((_BYTE *)&self->_data + 2536) = *((_BYTE *)&self->_data + 2536) & 0xFE | v9;
    -[SBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", 12, 1);
    -[SBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", 13, v17);
    -[SBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", 14, v8 == 2);
  }
  SBLogStatusBarish();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    SBStatusBarBatteryStateDebugName(v7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    batteryDetailString = self->_batteryDetailString;
    v25 = 138544130;
    v26 = v21;
    v27 = 1024;
    v28 = v6;
    v29 = 2114;
    v30 = batteryDetailString;
    v31 = 1024;
    v32 = v9;
    _os_log_impl(&dword_1D0540000, v20, OS_LOG_TYPE_DEFAULT, "battery info changed to (%{public}@ %i) with detail='%{public}@', low power mode='%i'", (uint8_t *)&v25, 0x22u);

  }
  -[SBStatusBarStateAggregator _notifyItemChanged:](self, "_notifyItemChanged:", 12);
  -[SBStatusBarStateAggregator _notifyItemChanged:](self, "_notifyItemChanged:", 13);
  -[SBStatusBarStateAggregator _notifyItemChanged:](self, "_notifyItemChanged:", 14);
LABEL_28:
  if (self->_showsRecordingOverrides)
  {
    self->_data.batteryState = 0;
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "userInterfaceIdiom");

    if ((v24 & 0xFFFFFFFFFFFFFFFBLL) != 1)
      -[SBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", 13, 0);
  }

}

- (int)_statusBarBatteryStateForSystemStatusChargingState:(unint64_t)a3
{
  if (a3 == 1)
    return 1;
  else
    return 2 * (a3 == 2);
}

- (void)centralManagerDidUpdateState:(id)a3
{
  uint64_t v4;
  NSMutableArray *v6;
  NSMutableArray *connectedLEBluetoothDevices;
  void *v8;
  id v9;

  v9 = a3;
  v4 = objc_msgSend(v9, "state");
  if (v4 == 10 || v4 == 5)
  {
    objc_msgSend(v9, "retrieveConnectedPeripheralsWithServices:allowAll:", 0, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      v6 = (NSMutableArray *)objc_msgSend(v8, "mutableCopy");
      connectedLEBluetoothDevices = self->_connectedLEBluetoothDevices;
      self->_connectedLEBluetoothDevices = v6;

    }
  }
  else
  {
    v8 = self->_connectedLEBluetoothDevices;
    self->_connectedLEBluetoothDevices = 0;
  }

  -[SBStatusBarStateAggregator updateStatusBarItem:](self, "updateStatusBarItem:", 16);
}

- (void)centralManager:(id)a3 didUpdatePeripheralConnectionState:(id)a4
{
  int v5;
  int v6;
  NSMutableArray *connectedLEBluetoothDevices;
  NSMutableArray *v8;
  NSMutableArray *v9;
  NSMutableArray *v10;
  id v11;

  v11 = a4;
  v5 = objc_msgSend(v11, "isConnectedToSystem");
  v6 = -[NSMutableArray containsObject:](self->_connectedLEBluetoothDevices, "containsObject:", v11);
  if (v5)
  {
    if ((v6 & 1) == 0)
    {
      connectedLEBluetoothDevices = self->_connectedLEBluetoothDevices;
      if (!connectedLEBluetoothDevices)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        v9 = self->_connectedLEBluetoothDevices;
        self->_connectedLEBluetoothDevices = v8;

        connectedLEBluetoothDevices = self->_connectedLEBluetoothDevices;
      }
      -[NSMutableArray addObject:](connectedLEBluetoothDevices, "addObject:", v11);
LABEL_9:
      -[SBStatusBarStateAggregator updateStatusBarItem:](self, "updateStatusBarItem:", 16);
    }
  }
  else if (v6)
  {
    -[NSMutableArray removeObject:](self->_connectedLEBluetoothDevices, "removeObject:", v11);
    if (!-[NSMutableArray count](self->_connectedLEBluetoothDevices, "count"))
    {
      v10 = self->_connectedLEBluetoothDevices;
      self->_connectedLEBluetoothDevices = 0;

    }
    goto LABEL_9;
  }

}

- (void)_updateBluetoothItem
{
  uint64_t v3;
  BOOL v4;
  _BOOL4 v5;
  NSObject *v6;
  int v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (MGGetBoolAnswer()
    && (v3 = -[NSMutableArray count](self->_connectedClassicBluetoothDevices, "count"),
        v3 + -[NSMutableArray count](self->_connectedLEBluetoothDevices, "count")))
  {
    v5 = -[SBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", 16, 1);
    if ((*((_BYTE *)&self->_data + 2529) & 1) != 0)
    {
      if (!v5)
        return;
    }
    else
    {
      *((_BYTE *)&self->_data + 2529) |= 1u;
      -[SBStatusBarStateAggregator _notifyItemChanged:](self, "_notifyItemChanged:", 16);
      -[SBStatusBarStateAggregator _requestActions:](self, "_requestActions:", 2);
    }
  }
  else
  {
    v4 = -[SBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", 16, 0);
    *((_BYTE *)&self->_data + 2529) &= ~1u;
    if (!v4)
      return;
  }
  SBLogStatusBarish();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *((_BYTE *)&self->_data + 2529) & 1;
    v8[0] = 67109120;
    v8[1] = v7;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "bluetoothConnected changed to %i", (uint8_t *)v8, 8u);
  }

}

- (void)_updateBluetoothHeadphonesItem
{
  void *v3;
  _QWORD v4[5];

  +[SBAVSystemControllerCache sharedInstance](SBAVSystemControllerCache, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__SBStatusBarStateAggregator__updateBluetoothHeadphonesItem__block_invoke;
  v4[3] = &unk_1E8EA3290;
  v4[4] = self;
  objc_msgSend(v3, "fetchPickableRoutesWithCompletion:", v4);

}

void __60__SBStatusBarStateAggregator__updateBluetoothHeadphonesItem__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  uint64_t v11;

  v3 = a2;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(v3, "bs_map:", &__block_literal_global_144);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__SBStatusBarStateAggregator__updateBluetoothHeadphonesItem__block_invoke_3;
  block[3] = &unk_1E8E9E270;
  v9 = v3;
  v10 = v4;
  v11 = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = v3;
  dispatch_async(v5, block);

}

id __60__SBStatusBarStateAggregator__updateBluetoothHeadphonesItem__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  +[SBBluetoothController sharedInstance](SBBluetoothController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceForAudioRoute:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __60__SBStatusBarStateAggregator__updateBluetoothHeadphonesItem__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  BOOL v19;
  int v20;
  char v21;
  BOOL v22;
  void *v23;
  void *v24;
  _QWORD block[5];
  BOOL v26;
  char v27;
  int v28;
  int v29;

  if (!objc_msgSend(*(id *)(a1 + 32), "count"))
  {
LABEL_28:
    v21 = 0;
    v22 = 0;
    goto LABEL_29;
  }
  v2 = 0;
  v3 = (_QWORD *)MEMORY[0x1E0D481E0];
  v4 = (_QWORD *)MEMORY[0x1E0D48020];
  while (1)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", *v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *v4);

    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D481C8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D48170]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D48128]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");

    if ((v7 & 1) == 0 && (v9 & 1) == 0 && (v11 & 1) == 0 && !v13)
      goto LABEL_27;
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", v2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      break;
LABEL_26:

LABEL_27:
    if (++v2 >= (unint64_t)objc_msgSend(*(id *)(a1 + 32), "count"))
      goto LABEL_28;
  }
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D481F8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
    goto LABEL_25;
  objc_msgSend(v14, "address");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
    goto LABEL_25;
  objc_msgSend(v14, "address");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v15, "hasPrefix:", v17);

  if (objc_msgSend(v14, "isAppleAudioDevice") && objc_msgSend(v14, "inEarDetectEnabled"))
  {
    v28 = 3;
    v29 = 0;
    objc_msgSend(v14, "inEarStatusPrimary:secondary:", &v29, &v28);
    if (v29)
      v19 = v28 == 0;
    else
      v19 = 1;
    v20 = v19;
  }
  else
  {
    v20 = 1;
  }
  if (objc_msgSend(v14, "type") == 20)
  {
    if ((v18 & v20) == 1)
      goto LABEL_30;
    goto LABEL_25;
  }
  if (objc_msgSend(v14, "type") != 16 || ((v18 ^ 1) & 1) != 0 || ((v20 ^ 1) & 1) != 0)
  {
LABEL_25:

    v3 = (_QWORD *)MEMORY[0x1E0D481E0];
    v4 = (_QWORD *)MEMORY[0x1E0D48020];
    goto LABEL_26;
  }
LABEL_30:
  v21 = objc_msgSend(v14, "isAppleAudioDevice") ^ 1;
  if (((v13 ^ 1 | v9 | v11) & 1) != 0)
  {
    v22 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C8B2B0], "sharedSystemAudioContext");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "predictedOutputDevice");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = v24 != 0;
  }

LABEL_29:
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__SBStatusBarStateAggregator__updateBluetoothHeadphonesItem__block_invoke_4;
  block[3] = &unk_1E8EA1C70;
  block[4] = *(_QWORD *)(a1 + 48);
  v26 = v22;
  v27 = v21;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __60__SBStatusBarStateAggregator__updateBluetoothHeadphonesItem__block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setShouldShowBluetoothHeadphoneGlyph:andShouldShowBluetoothHeadphoneBatteryPercent:", *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
  return objc_msgSend(*(id *)(a1 + 32), "_setItem:enabled:", 42, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8752));
}

- (void)_updateBluetoothBatteryItem
{
  void *v3;
  int v4;

  if ((MGGetBoolAnswer() & 1) == 0)
    goto LABEL_7;
  +[SBBluetoothController sharedInstance](SBBluetoothController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "canReportBatteryLevel") || !self->_shouldShowBluetoothHeadphoneBatteryPercent)
  {

LABEL_7:
    -[SBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", 15, 0);
    return;
  }
  v4 = objc_msgSend(v3, "batteryLevel");

  -[SBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", 15, 1);
  if (v4 != self->_data.bluetoothBatteryCapacity)
  {
    self->_data.bluetoothBatteryCapacity = v4;
    -[SBStatusBarStateAggregator _notifyItemChanged:](self, "_notifyItemChanged:", 15);
  }
}

- (void)_updateTTYItem
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[STStatusItemsStatusDomain data](self->_statusItemsDomain, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeStatusItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", *MEMORY[0x1E0DB0E98]);

  -[SBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", 17, v5);
}

- (void)_updateAlarmItem
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[STStatusItemsStatusDomain data](self->_statusItemsDomain, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeStatusItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", *MEMORY[0x1E0DB0E60]);

  -[SBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", 18, v5);
}

- (void)_updateVPNItem
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[STStatusItemsStatusDomain data](self->_statusItemsDomain, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeStatusItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", *MEMORY[0x1E0DB0EA0]);

  -[SBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", 29, v5);
}

- (void)_updateStudentItem
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[STStatusItemsStatusDomain data](self->_statusItemsDomain, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeStatusItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", *MEMORY[0x1E0DB0E90]);

  -[SBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", 27, v5);
}

- (void)_updateCallForwardingItem
{
  void *v3;
  void *v4;
  id v5;

  -[SBStatusBarStateAggregator telephonyDomain](self, "telephonyDomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primarySIMInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[SBStatusBarStateAggregator _updateCallForwardingItem:withInfo:](self, "_updateCallForwardingItem:withInfo:", 30, v5);
}

- (void)_updateSecondaryCallForwardingItem
{
  void *v3;
  void *v4;
  id v5;

  -[SBStatusBarStateAggregator telephonyDomain](self, "telephonyDomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "secondarySIMInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[SBStatusBarStateAggregator _updateCallForwardingItem:withInfo:](self, "_updateCallForwardingItem:withInfo:", 31, v5);
}

- (void)_updateCallForwardingItem:(int)a3 withInfo:(id)a4
{
  -[SBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", *(_QWORD *)&a3, objc_msgSend(a4, "isCallForwardingEnabled"));
}

- (void)_updateVoiceControlItem
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  unsigned int v7;
  id v8;

  -[SBStatusBarStateAggregator voiceControlDomain](self, "voiceControlDomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v8, "isVoiceControlActive");
  -[SBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", 41, v4);
  if ((_DWORD)v4)
  {
    v5 = objc_msgSend(v8, "listeningState");
    v6 = 2 * (v5 == 2);
    if (v5 == 1)
      v6 = 1;
    v7 = *((unsigned __int8 *)&self->_data + 2529);
    if (v6 != ((v7 >> 5) & 3))
    {
      *((_BYTE *)&self->_data + 2529) = v7 & 0x9F | (32 * v6);
      -[SBStatusBarStateAggregator _notifyItemChanged:](self, "_notifyItemChanged:", 41);
    }
  }

}

- (void)_updateRotationLockItem
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[STStatusItemsStatusDomain data](self->_statusItemsDomain, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeStatusItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", *MEMORY[0x1E0DB0E88]);

  -[SBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", 22, v5);
}

- (void)_updateQuietModeItem
{
  _BOOL4 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  _OWORD __s1[16];
  _OWORD v26[16];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (-[SBStatusBarStateAggregator _systemApertureElementIsVisibleForStatusBarItem:](self, "_systemApertureElementIsVisibleForStatusBarItem:", 2))
  {
    -[SBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", 2, 0);
  }
  else
  {
    v3 = self->_data.itemIsEnabled[2];
    v4 = *(_OWORD *)&self->_data.quietModeImage[208];
    v26[12] = *(_OWORD *)&self->_data.quietModeImage[192];
    v26[13] = v4;
    v5 = *(_OWORD *)&self->_data.quietModeImage[240];
    v26[14] = *(_OWORD *)&self->_data.quietModeImage[224];
    v26[15] = v5;
    v6 = *(_OWORD *)&self->_data.quietModeImage[144];
    v26[8] = *(_OWORD *)&self->_data.quietModeImage[128];
    v26[9] = v6;
    v7 = *(_OWORD *)&self->_data.quietModeImage[176];
    v26[10] = *(_OWORD *)&self->_data.quietModeImage[160];
    v26[11] = v7;
    v8 = *(_OWORD *)&self->_data.quietModeImage[80];
    v26[4] = *(_OWORD *)&self->_data.quietModeImage[64];
    v26[5] = v8;
    v9 = *(_OWORD *)&self->_data.quietModeImage[112];
    v26[6] = *(_OWORD *)&self->_data.quietModeImage[96];
    v26[7] = v9;
    v10 = *(_OWORD *)&self->_data.quietModeImage[16];
    v26[0] = *(_OWORD *)self->_data.quietModeImage;
    v26[1] = v10;
    v11 = *(_OWORD *)&self->_data.quietModeImage[48];
    v26[2] = *(_OWORD *)&self->_data.quietModeImage[32];
    v26[3] = v11;
    v12 = *(_OWORD *)&self->_data.quietModeName[208];
    __s1[12] = *(_OWORD *)&self->_data.quietModeName[192];
    __s1[13] = v12;
    v13 = *(_OWORD *)&self->_data.quietModeName[240];
    __s1[14] = *(_OWORD *)&self->_data.quietModeName[224];
    __s1[15] = v13;
    v14 = *(_OWORD *)&self->_data.quietModeName[144];
    __s1[8] = *(_OWORD *)&self->_data.quietModeName[128];
    __s1[9] = v14;
    v15 = *(_OWORD *)&self->_data.quietModeName[176];
    __s1[10] = *(_OWORD *)&self->_data.quietModeName[160];
    __s1[11] = v15;
    v16 = *(_OWORD *)&self->_data.quietModeName[80];
    __s1[4] = *(_OWORD *)&self->_data.quietModeName[64];
    __s1[5] = v16;
    v17 = *(_OWORD *)&self->_data.quietModeName[112];
    __s1[6] = *(_OWORD *)&self->_data.quietModeName[96];
    __s1[7] = v17;
    v18 = *(_OWORD *)&self->_data.quietModeName[16];
    __s1[0] = *(_OWORD *)self->_data.quietModeName;
    __s1[1] = v18;
    v19 = *(_OWORD *)&self->_data.quietModeName[48];
    __s1[2] = *(_OWORD *)&self->_data.quietModeName[32];
    __s1[3] = v19;
    -[SBStatusBarStateAggregator focusDomain](self, "focusDomain");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "data");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "modeSymbol");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "getCString:maxLength:encoding:", self->_data.quietModeImage, 256, 4);
    objc_msgSend(v20, "modeName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "getCString:maxLength:encoding:", self->_data.quietModeName, 256, 4);
    if (v3 != (v21 != 0)
      || (v23 = memcmp(__s1, self->_data.quietModeName, 0x100uLL),
          memcmp(v26, self->_data.quietModeImage, 0x100uLL) | v23))
    {
      -[SBStatusBarStateAggregator _requestActions:](self, "_requestActions:", 16);
    }
    -[SBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", 2, v21 != 0);

  }
}

- (void)_updateAirplayItem
{
  uint64_t v3;
  void *v4;
  void *v5;

  if (self->_showsRecordingOverrides)
  {
    v3 = 0;
  }
  else
  {
    -[STStatusItemsStatusDomain data](self->_statusItemsDomain, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activeStatusItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "containsObject:", *MEMORY[0x1E0DB0E50]);

  }
  -[SBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", 24, v3);
}

- (void)_updateThermalColorItem
{
  void *v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  int v8;
  int v9;
  char v10;

  if (!os_variant_has_internal_content())
  {
    v9 = 0;
    v8 = 0;
    v7 = 0;
    goto LABEL_11;
  }
  +[SBThermalController sharedInstance](SBThermalController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "level");
  v5 = objc_msgSend((id)objc_opt_class(), "_thermalColorForLevel:", v4);
  v6 = v5;
  if (v4 == 1)
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    if (!-[SBStatusBarDefaults showThermalWarning](self->_statusBarDefaults, "showThermalWarning") || !v6)
      goto LABEL_10;
  }
  else if (!v5)
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    goto LABEL_10;
  }
  v9 = objc_msgSend(v3, "isInSunlight");
  v7 = 1;
  v8 = v6;
LABEL_10:

LABEL_11:
  -[SBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", 33, v7);
  v10 = *((_BYTE *)&self->_data + 2272);
  if (self->_data.thermalColor != v8 || v9 != (v10 & 1))
  {
    self->_data.thermalColor = v8;
    *((_BYTE *)&self->_data + 2272) = v10 & 0xFE | v9;
    -[SBStatusBarStateAggregator _notifyItemChanged:](self, "_notifyItemChanged:", 33);
  }
}

- (void)_updateDisplayWarningItem
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[STStatusItemsStatusDomain data](self->_statusItemsDomain, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeStatusItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", *MEMORY[0x1E0DB0E78]);

  SBLogStatusBarish();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("disabled");
    if ((_DWORD)v5)
      v7 = CFSTR("enabled");
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Display reference mode warning %{public}@", (uint8_t *)&v8, 0xCu);
  }

  -[SBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", 44, v5);
}

- (void)_updateCarPlayItem
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[STStatusItemsStatusDomain data](self->_statusItemsDomain, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeStatusItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", *MEMORY[0x1E0DB0E68]);

  -[SBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", 26, v5);
}

- (void)_updateSensorActivityItem
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend((id)SBApp, "windowSceneManager", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "connectedWindowScenes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    LOBYTE(v7) = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "recordingIndicatorManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if ((v7 & 1) != 0)
          v7 = 1;
        else
          v7 = objc_msgSend(v10, "isIndicatorVisibleAtStatusBarLocation");

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  -[SBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", 28, v7);
}

- (void)_updatePersonNameItem
{
  NSString *overridePersonName;
  NSString *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSString *personName;
  NSString *v9;
  __CFString *v10;
  __CFString *v11;
  int v12;
  NSString *v13;
  __int16 v14;
  NSString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[SBStatusBarStateAggregator _shouldShowPersonName](self, "_shouldShowPersonName"))
  {
    overridePersonName = self->_overridePersonName;
    if (overridePersonName)
    {
      v4 = overridePersonName;
    }
    else
    {
      -[SBStatusBarStateAggregator _userSessionController](self, "_userSessionController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "user");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "displayName");
      v4 = (NSString *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v4 = 0;
  }
  if (!-[NSString isEqualToString:](self->_personName, "isEqualToString:", v4))
  {
    SBLogStatusBarish();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      personName = self->_personName;
      v12 = 138543618;
      v13 = personName;
      v14 = 2114;
      v15 = v4;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "personName changing from '%{public}@' to '%{public}@'", (uint8_t *)&v12, 0x16u);
    }

    v9 = self->_personName;
    self->_personName = v4;
    v10 = v4;

    -[SBStatusBarStateAggregator beginCoalescentBlock](self, "beginCoalescentBlock");
    -[SBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", 8, -[NSString length](self->_personName, "length") != 0);
    v11 = &stru_1E8EC7EC0;
    if (v10)
      v11 = v10;
    v4 = v11;

    -[NSString getCString:maxLength:encoding:](v4, "getCString:maxLength:encoding:", self->_data.personName, 100, 4);
    -[SBStatusBarStateAggregator _notifyItemChanged:](self, "_notifyItemChanged:", 8);
    -[SBStatusBarStateAggregator _updateServiceItem](self, "_updateServiceItem");
    -[SBStatusBarStateAggregator _updateSecondaryServiceItem](self, "_updateSecondaryServiceItem");
    -[SBStatusBarStateAggregator endCoalescentBlock](self, "endCoalescentBlock");
  }

}

- (void)_updateCallToActionItem
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *callToActionIdentifier;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;

  -[STStatusItemsStatusDomain data](self->_statusItemsDomain, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __53__SBStatusBarStateAggregator__updateCallToActionItem__block_invoke;
  v23[3] = &unk_1E8EBF9A0;
  v6 = v3;
  v24 = v6;
  objc_msgSend(v4, "bs_firstObjectPassingTest:", v23);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "statusItemIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((BSEqualObjects() & 1) == 0)
  {
    v9 = (NSString *)objc_msgSend(v8, "copy");
    callToActionIdentifier = self->_callToActionIdentifier;
    self->_callToActionIdentifier = v9;

    if (self->_callToActionIdentifier)
    {
      objc_msgSend(v6, "visualDescriptorForStatusItemWithIdentifier:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0DB09C0];
      objc_msgSend(v11, "systemImageName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "entryWithImageNamed:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DB09C0], "disabledEntry");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v18 = v5;
    v19 = 3221225472;
    v20 = __53__SBStatusBarStateAggregator__updateCallToActionItem__block_invoke_2;
    v21 = &unk_1E8EBF938;
    v22 = v14;
    v15 = v14;
    v16 = (void *)MEMORY[0x1D17E5550](&v18);
    objc_msgSend(MEMORY[0x1E0DB0F18], "sharedInstance", v18, v19, v20, v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "updateWithData:", v16);

  }
}

uint64_t __53__SBStatusBarStateAggregator__updateCallToActionItem__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "statusItemIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "visualDescriptorForStatusItemWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCallToAction");

  return v5;
}

uint64_t __53__SBStatusBarStateAggregator__updateCallToActionItem__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dataByReplacingEntry:forKey:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0DB0CB8]);
}

- (void)_updateRingerItem
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  objc_msgSend((id)SBApp, "ringerControl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBRingerControl isRingerMuted]((uint64_t)v3);

  if (-[SBStatusBarDefaults showRingerState](self->_statusBarDefaults, "showRingerState"))
    objc_msgSend(MEMORY[0x1E0DB0998], "entryWithBoolValue:", v4);
  else
    objc_msgSend(MEMORY[0x1E0DB0998], "disabledEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__SBStatusBarStateAggregator__updateRingerItem__block_invoke;
  v9[3] = &unk_1E8EBF938;
  v10 = v5;
  v6 = v5;
  v7 = (void *)MEMORY[0x1D17E5550](v9);
  objc_msgSend(MEMORY[0x1E0DB0F18], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateWithData:", v7);

}

uint64_t __47__SBStatusBarStateAggregator__updateRingerItem__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dataByReplacingEntry:forKey:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0DB0D20]);
}

- (void)_updateStatusBarForSystemStatusDomainName:(unint64_t)a3 data:(id)a4
{
  id v6;
  SBStatusBarStateAggregator *v7;
  uint64_t v8;
  NSObject *v9;

  v6 = a4;
  switch(a3)
  {
    case 0xEuLL:
      -[SBStatusBarStateAggregator _updateStatusBarItemsForSystemStatusDomain:andData:](self, "_updateStatusBarItemsForSystemStatusDomain:andData:", 14, v6);
      break;
    case 8uLL:
      v7 = self;
      v8 = 8;
      goto LABEL_7;
    case 7uLL:
      v7 = self;
      v8 = 7;
LABEL_7:
      -[SBStatusBarStateAggregator _updateBackgroundActivityAssertionsForSystemStatusDomain:andData:](v7, "_updateBackgroundActivityAssertionsForSystemStatusDomain:andData:", v8, v6);
      break;
    default:
      SBLogStatusBarish();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        -[SBStatusBarStateAggregator _updateStatusBarForSystemStatusDomainName:data:].cold.1(v9);

      break;
  }

}

- (void)_updateBackgroundActivityAssertionsForSystemStatusDomain:(unint64_t)a3 andData:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  SBSBackgroundActivityAssertion *v14;
  SBSBackgroundActivityAssertion *playgroundsBackgroundActivityAssertion;
  SBSBackgroundActivityAssertion *v16;
  id *v17;
  SBSBackgroundActivityAssertion *v18;
  SBSBackgroundActivityAssertion *satelliteSOSBackgroundActivityAssertion;
  SBSBackgroundActivityAssertion *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id location;

  v6 = a4;
  if (a3 == 8)
  {
    v10 = objc_opt_class();
    v11 = v6;
    if (v10)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = v11;
      else
        v12 = 0;
    }
    else
    {
      v12 = 0;
    }
    v13 = v12;

    if (!objc_msgSend(v13, "isStewieActive"))
    {
      -[SBStatusBarStateAggregator _removeSatelliteSOSBackgroundActivityAssertion](self, "_removeSatelliteSOSBackgroundActivityAssertion");
      goto LABEL_22;
    }
    if (!self->_satelliteSOSBackgroundActivityAssertion)
    {
      objc_msgSend(MEMORY[0x1E0DAADE8], "assertionWithBackgroundActivityIdentifier:forPID:exclusive:showsWhenForeground:", *MEMORY[0x1E0DB0BA8], getpid(), 0, 0);
      v18 = (SBSBackgroundActivityAssertion *)objc_claimAutoreleasedReturnValue();
      satelliteSOSBackgroundActivityAssertion = self->_satelliteSOSBackgroundActivityAssertion;
      self->_satelliteSOSBackgroundActivityAssertion = v18;

      objc_initWeak(&location, self);
      v20 = self->_satelliteSOSBackgroundActivityAssertion;
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __95__SBStatusBarStateAggregator__updateBackgroundActivityAssertionsForSystemStatusDomain_andData___block_invoke_165;
      v21[3] = &unk_1E8E9DF28;
      v17 = &v22;
      objc_copyWeak(&v22, &location);
      -[SBSBackgroundActivityAssertion acquireWithHandler:invalidationHandler:](v20, "acquireWithHandler:invalidationHandler:", &__block_literal_global_164, v21);
      goto LABEL_20;
    }
LABEL_22:

    goto LABEL_23;
  }
  if (a3 == 7)
  {
    v7 = objc_opt_class();
    v8 = v6;
    if (v7)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v13 = v9;

    if (objc_msgSend(v13, "isPlaygroundsActive"))
    {
      if (!self->_playgroundsBackgroundActivityAssertion)
      {
        objc_msgSend(MEMORY[0x1E0DAADE8], "assertionWithBackgroundActivityIdentifier:forPID:exclusive:showsWhenForeground:", *MEMORY[0x1E0DB0B98], getpid(), 0, 0);
        v14 = (SBSBackgroundActivityAssertion *)objc_claimAutoreleasedReturnValue();
        playgroundsBackgroundActivityAssertion = self->_playgroundsBackgroundActivityAssertion;
        self->_playgroundsBackgroundActivityAssertion = v14;

        objc_initWeak(&location, self);
        v16 = self->_playgroundsBackgroundActivityAssertion;
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __95__SBStatusBarStateAggregator__updateBackgroundActivityAssertionsForSystemStatusDomain_andData___block_invoke_162;
        v23[3] = &unk_1E8E9DF28;
        v17 = &v24;
        objc_copyWeak(&v24, &location);
        -[SBSBackgroundActivityAssertion acquireWithHandler:invalidationHandler:](v16, "acquireWithHandler:invalidationHandler:", &__block_literal_global_161_2, v23);
LABEL_20:
        objc_destroyWeak(v17);
        objc_destroyWeak(&location);
        goto LABEL_22;
      }
    }
    else
    {
      -[SBStatusBarStateAggregator _removePlaygroundsBackgroundActivityAssertion](self, "_removePlaygroundsBackgroundActivityAssertion");
    }
    goto LABEL_22;
  }
LABEL_23:

}

void __95__SBStatusBarStateAggregator__updateBackgroundActivityAssertionsForSystemStatusDomain_andData___block_invoke(uint64_t a1, char a2)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if ((a2 & 1) == 0)
  {
    SBLogStatusBarish();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __95__SBStatusBarStateAggregator__updateBackgroundActivityAssertionsForSystemStatusDomain_andData___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  }
}

void __95__SBStatusBarStateAggregator__updateBackgroundActivityAssertionsForSystemStatusDomain_andData___block_invoke_162(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__SBStatusBarStateAggregator__updateBackgroundActivityAssertionsForSystemStatusDomain_andData___block_invoke_2;
  block[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __95__SBStatusBarStateAggregator__updateBackgroundActivityAssertionsForSystemStatusDomain_andData___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_removePlaygroundsBackgroundActivityAssertion");

}

void __95__SBStatusBarStateAggregator__updateBackgroundActivityAssertionsForSystemStatusDomain_andData___block_invoke_3(uint64_t a1, char a2)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if ((a2 & 1) == 0)
  {
    SBLogStatusBarish();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __95__SBStatusBarStateAggregator__updateBackgroundActivityAssertionsForSystemStatusDomain_andData___block_invoke_3_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  }
}

void __95__SBStatusBarStateAggregator__updateBackgroundActivityAssertionsForSystemStatusDomain_andData___block_invoke_165(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__SBStatusBarStateAggregator__updateBackgroundActivityAssertionsForSystemStatusDomain_andData___block_invoke_2_166;
  block[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __95__SBStatusBarStateAggregator__updateBackgroundActivityAssertionsForSystemStatusDomain_andData___block_invoke_2_166(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_removeSatelliteSOSBackgroundActivityAssertion");

}

- (void)_updateStatusBarItemsForSystemStatusDomain:(unint64_t)a3 andData:(id)a4
{
  NSObject *v6;

  if (a3 == 14)
  {
    -[SBStatusBarStateAggregator _updateAirplaneMode](self, "_updateAirplaneMode", 14, a4);
    -[SBStatusBarStateAggregator _updateAirplayItem](self, "_updateAirplayItem");
    -[SBStatusBarStateAggregator _updateAlarmItem](self, "_updateAlarmItem");
    -[SBStatusBarStateAggregator _updateCarPlayItem](self, "_updateCarPlayItem");
    -[SBStatusBarStateAggregator _updateDisplayWarningItem](self, "_updateDisplayWarningItem");
    -[SBStatusBarStateAggregator _updateLiquidDetectionItem](self, "_updateLiquidDetectionItem");
    -[SBStatusBarStateAggregator _updateRotationLockItem](self, "_updateRotationLockItem");
    -[SBStatusBarStateAggregator _updateStudentItem](self, "_updateStudentItem");
    -[SBStatusBarStateAggregator _updateTTYItem](self, "_updateTTYItem");
    -[SBStatusBarStateAggregator _updateVPNItem](self, "_updateVPNItem");
    -[SBStatusBarStateAggregator _updateCallToActionItem](self, "_updateCallToActionItem");
  }
  else
  {
    SBLogStatusBarish();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SBStatusBarStateAggregator _updateStatusBarItemsForSystemStatusDomain:andData:].cold.1(a3, v6);

  }
}

- (void)_removePlaygroundsBackgroundActivityAssertion
{
  SBSBackgroundActivityAssertion *playgroundsBackgroundActivityAssertion;
  SBSBackgroundActivityAssertion *v4;

  playgroundsBackgroundActivityAssertion = self->_playgroundsBackgroundActivityAssertion;
  if (playgroundsBackgroundActivityAssertion)
  {
    -[SBSBackgroundActivityAssertion invalidate](playgroundsBackgroundActivityAssertion, "invalidate");
    v4 = self->_playgroundsBackgroundActivityAssertion;
    self->_playgroundsBackgroundActivityAssertion = 0;

  }
}

- (void)_removeSatelliteSOSBackgroundActivityAssertion
{
  SBSBackgroundActivityAssertion *satelliteSOSBackgroundActivityAssertion;
  SBSBackgroundActivityAssertion *v4;

  satelliteSOSBackgroundActivityAssertion = self->_satelliteSOSBackgroundActivityAssertion;
  if (satelliteSOSBackgroundActivityAssertion)
  {
    -[SBSBackgroundActivityAssertion invalidate](satelliteSOSBackgroundActivityAssertion, "invalidate");
    v4 = self->_satelliteSOSBackgroundActivityAssertion;
    self->_satelliteSOSBackgroundActivityAssertion = 0;

  }
}

- (void)_removeTetheringBackgroundActivityAssertion
{
  SBSBackgroundActivityAssertion *tetheringBackgroundActivityAssertion;
  SBSBackgroundActivityAssertion *v4;

  tetheringBackgroundActivityAssertion = self->_tetheringBackgroundActivityAssertion;
  if (tetheringBackgroundActivityAssertion)
  {
    -[SBSBackgroundActivityAssertion invalidate](tetheringBackgroundActivityAssertion, "invalidate");
    v4 = self->_tetheringBackgroundActivityAssertion;
    self->_tetheringBackgroundActivityAssertion = 0;

  }
}

- (void)_updateTetheringState
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  SBSBackgroundActivityAssertion *v15;
  SBSBackgroundActivityAssertion *tetheringBackgroundActivityAssertion;
  SBSBackgroundActivityAssertion *v17;
  _QWORD v18[4];
  id v19;
  id location;

  -[SBStatusBarStateAggregator _telephonyManager](self, "_telephonyManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isNetworkTethering"))
  {
    v4 = objc_msgSend(v3, "numberOfNetworkTetheredDevices");
    v5 = (void *)SBApp;
    if ((_DWORD)v4 == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "formattedDecimalStringForNumber:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = CFSTR("INTERNET_TETHERING_SINGLE_HOST");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "formattedDecimalStringForNumber:", v13);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = CFSTR("INTERNET_TETHERING_MULTIPLE_HOSTS");
    }
    objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", v14, v7);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!self->_tetheringBackgroundActivityAssertion)
    {
      objc_msgSend(MEMORY[0x1E0DAADE8], "assertionWithBackgroundActivityIdentifier:forPID:exclusive:showsWhenForeground:", *MEMORY[0x1E0DB0BF0], getpid(), 1, 1);
      v15 = (SBSBackgroundActivityAssertion *)objc_claimAutoreleasedReturnValue();
      tetheringBackgroundActivityAssertion = self->_tetheringBackgroundActivityAssertion;
      self->_tetheringBackgroundActivityAssertion = v15;

      objc_initWeak(&location, self);
      v17 = self->_tetheringBackgroundActivityAssertion;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __51__SBStatusBarStateAggregator__updateTetheringState__block_invoke_176;
      v18[3] = &unk_1E8E9DF28;
      objc_copyWeak(&v19, &location);
      -[SBSBackgroundActivityAssertion acquireWithHandler:invalidationHandler:](v17, "acquireWithHandler:invalidationHandler:", &__block_literal_global_175_1, v18);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    -[SBStatusBarStateAggregator _removeTetheringBackgroundActivityAssertion](self, "_removeTetheringBackgroundActivityAssertion");
    LODWORD(v4) = 0;
    v12 = &stru_1E8EC7EC0;
  }
  -[SBSBackgroundActivityAssertion setStatusString:](self->_tetheringBackgroundActivityAssertion, "setStatusString:", v12);
  if (self->_data.tetheringConnectionCount != (_DWORD)v4)
  {
    self->_data.tetheringConnectionCount = v4;
    -[SBStatusBarStateAggregator _notifyNonItemDataChanged](self, "_notifyNonItemDataChanged");
  }

}

void __51__SBStatusBarStateAggregator__updateTetheringState__block_invoke(uint64_t a1, char a2)
{
  NSObject *v2;
  uint8_t v3[16];

  if ((a2 & 1) == 0)
  {
    SBLogStatusBarish();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "Failed to acquire tethering status bar style override", v3, 2u);
    }

  }
}

void __51__SBStatusBarStateAggregator__updateTetheringState__block_invoke_176(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__SBStatusBarStateAggregator__updateTetheringState__block_invoke_2;
  block[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __51__SBStatusBarStateAggregator__updateTetheringState__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_removeTetheringBackgroundActivityAssertion");

}

- (id)_backgroundActivityDescriptorsForCallDescriptors:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  const __CFString *v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  SBStatusBarBackgroundActivityDescriptor *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id obj;
  uint64_t v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[16];
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v40 = 0;
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v4)
  {
    v5 = v4;
    v39 = *(_QWORD *)v42;
    v6 = (void *)*MEMORY[0x1E0DB0B58];
    v27 = (void *)*MEMORY[0x1E0DB0BE0];
    v32 = (void *)*MEMORY[0x1E0DB0BD0];
    v35 = (void *)*MEMORY[0x1E0DB0BD8];
    v37 = (void *)*MEMORY[0x1E0DB0B50];
    v36 = (void *)*MEMORY[0x1E0DB0AC8];
    v31 = (void *)*MEMORY[0x1E0DB0B60];
    v30 = (void *)*MEMORY[0x1E0DB0BF8];
    v34 = (void *)*MEMORY[0x1E0DB0C00];
    v28 = (void *)*MEMORY[0x1E0DB0B08];
    v29 = (void *)*MEMORY[0x1E0DB0AF8];
    v33 = (void *)*MEMORY[0x1E0DB0B00];
LABEL_6:
    v7 = 0;
    while (2)
    {
      if (*(_QWORD *)v42 != v39)
        objc_enumerationMutation(obj);
      v8 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v7);
      v9 = objc_msgSend(v8, "callState", v27);
      v10 = objc_msgSend(v8, "callState");
      v11 = objc_msgSend(v8, "callState");
      v12 = objc_msgSend(v8, "callState");
      v13 = objc_msgSend(v8, "callState");
      v14 = v6;
      switch(objc_msgSend(v8, "callType"))
      {
        case 0:
          if (v9 == 1)
          {
            v15 = v33;
            goto LABEL_35;
          }
          if (v10 == 3)
          {
            v15 = v29;
            goto LABEL_35;
          }
          if (v12 == 4)
          {
            v15 = v28;
            goto LABEL_35;
          }
          v16 = v14;
          v18 = CFSTR("com.apple.systemstatus.background-activity.CallRecording");
          if (v13 == 6)
            goto LABEL_36;
          goto LABEL_37;
        case 1:
          if (v9 == 1)
          {
            v15 = v34;
          }
          else if (v10 == 3)
          {
            v15 = v30;
          }
          else
          {
            v15 = v31;
          }
          goto LABEL_35;
        case 2:
          if (v9 == 1)
          {
            v15 = v35;
          }
          else
          {
            v19 = objc_msgSend(v8, "copresenceActivityType");
            if (v19 > 5)
              goto LABEL_37;
            if (v19 == 3)
              v15 = v27;
            else
              v15 = v32;
          }
LABEL_35:
          v18 = v15;
          v16 = v14;
LABEL_36:

          v14 = v18;
LABEL_37:
          v20 = getpid();
          objc_msgSend(v8, "callProviderAttribution");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            *(_OWORD *)buf = 0u;
            v46 = 0u;
            objc_msgSend(v8, "callProviderAttribution");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v22;
            if (v22)
            {
              objc_msgSend(v22, "auditToken");
            }
            else
            {
              *(_OWORD *)buf = 0u;
              v46 = 0u;
            }

            v20 = BSPIDForAuditToken();
          }
          v24 = -[SBStatusBarBackgroundActivityDescriptor initWithBackgroundActivityIdentifier:pid:]([SBStatusBarBackgroundActivityDescriptor alloc], "initWithBackgroundActivityIdentifier:pid:", v14, v20);
          objc_msgSend(v40, "addObject:", v24);

          if (v5 != ++v7)
            continue;
          v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
          if (!v5)
            goto LABEL_44;
          goto LABEL_6;
        case 3:
          v15 = v37;
          if (v11 != 2)
            v15 = v36;
          goto LABEL_35;
        default:
          SBLogStatusBarish();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v17 = objc_msgSend(v8, "callType");
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)&buf[4] = v17;
            _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, "[Call Type] Unhandled enum value: %lu", buf, 0xCu);
          }
          v18 = (const __CFString *)v14;
          goto LABEL_36;
      }
    }
  }
LABEL_44:

  v25 = (void *)objc_msgSend(v40, "copy");
  return v25;
}

- (void)_updateCallingBackgroundActivityAssertionsForCallDescriptors:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *callingBackgroundActivityAssertionsByDescriptor;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  NSMutableDictionary *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[5];
  _QWORD v26[5];
  id v27;
  uint8_t buf[4];
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[SBStatusBarStateAggregator _backgroundActivityDescriptorsForCallDescriptors:](self, "_backgroundActivityDescriptorsForCallDescriptors:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary allKeys](self->_callingBackgroundActivityAssertionsByDescriptor, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __91__SBStatusBarStateAggregator__updateCallingBackgroundActivityAssertionsForCallDescriptors___block_invoke;
  v26[3] = &unk_1E8EBFA50;
  v26[4] = self;
  v7 = v4;
  v27 = v7;
  objc_msgSend(v5, "bs_compactMap:", v26);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count") && !self->_callingBackgroundActivityAssertionsByDescriptor)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
    v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    callingBackgroundActivityAssertionsByDescriptor = self->_callingBackgroundActivityAssertionsByDescriptor;
    self->_callingBackgroundActivityAssertionsByDescriptor = v9;

  }
  v25[0] = v6;
  v25[1] = 3221225472;
  v25[2] = __91__SBStatusBarStateAggregator__updateCallingBackgroundActivityAssertionsForCallDescriptors___block_invoke_3;
  v25[3] = &unk_1E8EBFA78;
  v25[4] = self;
  v20 = v7;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v25);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_callingBackgroundActivityAssertionsByDescriptor, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        SBLogStatusBarish();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v29 = v17;
          _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_DEFAULT, "invalidating %{public}@", buf, 0xCu);
        }

        objc_msgSend(v17, "invalidate");
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_callingBackgroundActivityAssertionsByDescriptor, "setObject:forKeyedSubscript:", 0, v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
    }
    while (v13);
  }

  if (!-[NSMutableDictionary count](self->_callingBackgroundActivityAssertionsByDescriptor, "count"))
  {
    v19 = self->_callingBackgroundActivityAssertionsByDescriptor;
    self->_callingBackgroundActivityAssertionsByDescriptor = 0;

  }
}

id __91__SBStatusBarStateAggregator__updateCallingBackgroundActivityAssertionsForCallDescriptors___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8768);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 40);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __91__SBStatusBarStateAggregator__updateCallingBackgroundActivityAssertionsForCallDescriptors___block_invoke_2;
  v11[3] = &unk_1E8EBFA28;
  v12 = v5;
  v7 = v5;
  if (objc_msgSend(v6, "bs_containsObjectPassingTest:", v11))
    v8 = 0;
  else
    v8 = v4;
  v9 = v8;

  return v9;
}

uint64_t __91__SBStatusBarStateAggregator__updateCallingBackgroundActivityAssertionsForCallDescriptors___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "pid");
  if (v4 == objc_msgSend(v3, "pid"))
  {
    objc_msgSend(*(id *)(a1 + 32), "backgroundActivityIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "backgroundActivityIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "containsObject:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __91__SBStatusBarStateAggregator__updateCallingBackgroundActivityAssertionsForCallDescriptors___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t v21;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8768), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = (void *)MEMORY[0x1E0DAADE8];
    objc_msgSend(v3, "backgroundActivityIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertionWithBackgroundActivityIdentifier:forPID:exclusive:showsWhenForeground:", v6, objc_msgSend(v3, "pid"), 0, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8768), "setObject:forKeyedSubscript:", v7, v3);
    v8 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __91__SBStatusBarStateAggregator__updateCallingBackgroundActivityAssertionsForCallDescriptors___block_invoke_4;
    v18[3] = &unk_1E8E9EEF0;
    v19 = v7;
    v9 = v3;
    v10 = *(_QWORD *)(a1 + 32);
    v20 = v9;
    v21 = v10;
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __91__SBStatusBarStateAggregator__updateCallingBackgroundActivityAssertionsForCallDescriptors___block_invoke_184;
    v14[3] = &unk_1E8E9E270;
    v11 = v9;
    v12 = *(_QWORD *)(a1 + 32);
    v15 = v11;
    v16 = v12;
    v17 = v19;
    v13 = v19;
    objc_msgSend(v13, "acquireWithHandler:invalidationHandler:", v18, v14);

  }
}

void __91__SBStatusBarStateAggregator__updateCallingBackgroundActivityAssertionsForCallDescriptors___block_invoke_4(_QWORD *a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  SBLogStatusBarish();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = a1[4];
      v9 = 138543362;
      v10 = v6;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "acquired %{public}@", (uint8_t *)&v9, 0xCu);
    }

  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __91__SBStatusBarStateAggregator__updateCallingBackgroundActivityAssertionsForCallDescriptors___block_invoke_4_cold_1((uint64_t)a1);

    objc_msgSend(*(id *)(a1[6] + 8768), "objectForKeyedSubscript:", a1[5]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)a1[4];

    if (v7 == v8)
      objc_msgSend(*(id *)(a1[6] + 8768), "setObject:forKeyedSubscript:", 0, a1[5]);
  }
}

void __91__SBStatusBarStateAggregator__updateCallingBackgroundActivityAssertionsForCallDescriptors___block_invoke_184(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  void *v4;

  SBLogStatusBarish();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    __91__SBStatusBarStateAggregator__updateCallingBackgroundActivityAssertionsForCallDescriptors___block_invoke_184_cold_1((uint64_t)a1);

  objc_msgSend(*(id *)(a1[5] + 8768), "objectForKeyedSubscript:", a1[4]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)a1[6];

  if (v3 == v4)
    objc_msgSend(*(id *)(a1[5] + 8768), "setObject:forKeyedSubscript:", 0, a1[4]);
}

- (void)_updateStatusBarItemsWithRelatedSystemApertureElements
{
  -[SBStatusBarStateAggregator updateStatusBarItem:](self, "updateStatusBarItem:", 2);
}

- (id)_systemApertureElementIdentifiersForStatusBarItem:(int)a3
{
  uint64_t v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  if (a3 == 2)
  {
    v3 = *MEMORY[0x1E0DAC948];
    v6[0] = *MEMORY[0x1E0DAC940];
    v6[1] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)_systemApertureElementIsVisibleForStatusBarItem:(int)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[SBStatusBarStateAggregator _systemApertureElementIdentifiersForStatusBarItem:](self, "_systemApertureElementIdentifiersForStatusBarItem:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBStatusBarStateAggregator systemApertureVisibleElementIdentifiers](self, "systemApertureVisibleElementIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObjectCommonWithArray:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  return v7;
}

- (void)setBatteryChargingState:(unint64_t)a3
{
  unint64_t batteryChargingState;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  double v15;
  SBChargingSystemApertureElementProvider *v16;
  void *v17;
  void *v18;
  SAInvalidatable *v19;
  SAInvalidatable *systemApertureChargingElementAssertion;

  batteryChargingState = self->_batteryChargingState;
  if (batteryChargingState != a3)
  {
    if (a3 - 1 >= 2)
    {
      if (!a3)
        -[SBStatusBarStateAggregator _invalidateSystemApertureChargingElementAssertionForReason:](self, "_invalidateSystemApertureChargingElementAssertionForReason:", CFSTR("Charging ended"));
      goto LABEL_17;
    }
    v6 = SBFEffectiveArtworkSubtype();
    if (v6 > 2795)
    {
      if (v6 != 2868 && v6 != 2796)
        goto LABEL_17;
    }
    else if (v6 != 2556 && v6 != 2622)
    {
LABEL_17:
      self->_batteryChargingState = a3;
      return;
    }
    if (!batteryChargingState)
    {
      +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isUILocked");

      +[SBUIController sharedInstance](SBUIController, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isConnectedToWirelessInternalCharger");

      +[SBUIController sharedInstance](SBUIController, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isConnectedToWirelessInternalChargingAccessory");

      if (!v8 || ((v10 | v12) & 1) == 0)
      {
        -[SBStatusBarStateAggregator batteryDomain](self, "batteryDomain");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "data");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = 1.0;
        if (!self->_showsRecordingOverrides)
          v15 = (double)(int)objc_msgSend(v14, "percentCharge") / 100.0;
        v16 = objc_alloc_init(SBChargingSystemApertureElementProvider);
        -[SBChargingSystemApertureElementProvider powerElementWithBatteryCapacity:](v16, "powerElementWithBatteryCapacity:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)SBApp, "systemApertureControllerForMainDisplay");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "registerElement:", v17);
        v19 = (SAInvalidatable *)objc_claimAutoreleasedReturnValue();
        systemApertureChargingElementAssertion = self->_systemApertureChargingElementAssertion;
        self->_systemApertureChargingElementAssertion = v19;

      }
    }
    goto LABEL_17;
  }
}

- (void)_invalidateSystemApertureChargingElementAssertionForReason:(id)a3
{
  SAInvalidatable *systemApertureChargingElementAssertion;

  -[SAInvalidatable invalidateWithReason:](self->_systemApertureChargingElementAssertion, "invalidateWithReason:", a3);
  systemApertureChargingElementAssertion = self->_systemApertureChargingElementAssertion;
  self->_systemApertureChargingElementAssertion = 0;

}

- (void)_notifyNonItemDataChanged
{
  -[SBStatusBarStateAggregator beginCoalescentBlock](self, "beginCoalescentBlock");
  self->_nonItemDataChanged = 1;
  -[SBStatusBarStateAggregator endCoalescentBlock](self, "endCoalescentBlock");
}

- (void)_requestActions:(int)a3
{
  if ((a3 & ~self->_actions) != 0)
  {
    -[SBStatusBarStateAggregator beginCoalescentBlock](self, "beginCoalescentBlock");
    self->_actions |= a3;
    -[SBStatusBarStateAggregator endCoalescentBlock](self, "endCoalescentBlock");
  }
}

- (void)_resetTimeItemFormatter
{
  id v3;
  NSDateFormatter *v4;
  NSDateFormatter *v5;
  NSDateFormatter *v6;
  NSDateFormatter *shortTimeItemDateFormatter;
  NSDateFormatter *v8;
  NSDateFormatter *dateItemDateFormatter;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSDateFormatter *timeItemDateFormatter;
  void *v18;
  id v19;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter locale](self->_timeItemDateFormatter, "locale");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v19 == v3)
  {
    timeItemDateFormatter = self->_timeItemDateFormatter;
    objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setTimeZone:](timeItemDateFormatter, "setTimeZone:", v18);

    -[SBStatusBarStateAggregator _updateOverrideDate](self, "_updateOverrideDate");
  }
  else
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    v5 = self->_timeItemDateFormatter;
    self->_timeItemDateFormatter = v4;

    -[NSDateFormatter setLocale:](self->_timeItemDateFormatter, "setLocale:", v19);
    -[NSDateFormatter setDateStyle:](self->_timeItemDateFormatter, "setDateStyle:", 0);
    -[NSDateFormatter setTimeStyle:](self->_timeItemDateFormatter, "setTimeStyle:", 1);
    objc_msgSend(MEMORY[0x1E0D01738], "formatterForDateAsTimeNoAMPMWithLocale:", v19);
    v6 = (NSDateFormatter *)objc_claimAutoreleasedReturnValue();
    shortTimeItemDateFormatter = self->_shortTimeItemDateFormatter;
    self->_shortTimeItemDateFormatter = v6;

    v8 = (NSDateFormatter *)-[NSDateFormatter copy](self->_timeItemDateFormatter, "copy");
    dateItemDateFormatter = self->_dateItemDateFormatter;
    self->_dateItemDateFormatter = v8;

    -[NSDateFormatter setFormattingContext:](self->_dateItemDateFormatter, "setFormattingContext:", 2);
    v10 = (void *)MEMORY[0x1E0CB3578];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("STATUS_BAR_DATE_FORMAT_STRING"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dateFormatFromTemplate:options:locale:", v12, 0, v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("STATUS_BAR_DATE_FORMAT_SEPARATOR_TO_STRIP"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "length"))
    {
      objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", v15, &stru_1E8EC7EC0);
      v16 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v16;
    }
    -[NSDateFormatter setDateFormat:](self->_dateItemDateFormatter, "setDateFormat:", v13);

  }
  -[SBStatusBarStateAggregator _restartTimeItemTimer](self, "_restartTimeItemTimer");

}

- (void)_updateOverrideDate
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  id v6;

  if (self->_showsRecordingOverrides)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 1168335660.0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 1168335660.0 - (double)objc_msgSend(v3, "secondsFromGMTForDate:", v2);

    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x1E0DA9DE8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOverrideDate:", v6);

}

- (BOOL)_shouldShowPersonName
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  int v7;

  -[SBStatusBarStateAggregator _userSessionController](self, "_userSessionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_overridePersonName)
  {
    v5 = 1;
  }
  else if (objc_msgSend(v3, "isMultiUserSupported"))
  {
    objc_msgSend(v4, "user");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v4, "isLoginSession") ^ 1;
    if (v6)
      v5 = v7;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_noteAirplaneModeChanged
{
  void *v3;
  _BOOL8 v4;
  unint64_t v5;
  dispatch_time_t v6;
  _QWORD v7[6];

  -[SBStatusBarStateAggregator _telephonyManager](self, "_telephonyManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[SBStatusBarStateAggregator _isInAirplaneMode](self, "_isInAirplaneMode");
    -[SBStatusBarStateAggregator beginCoalescentBlock](self, "beginCoalescentBlock");
    -[SBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", 3, v4);
    -[SBStatusBarStateAggregator _requestActions:](self, "_requestActions:", 4);
    if (v4)
    {
      -[SBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", 6, 0);
      -[SBStatusBarStateAggregator _setItem:enabled:](self, "_setItem:enabled:", 7, 0);
      v5 = self->_airplaneTransitionToken + 1;
      self->_airplaneTransitionToken = v5;
      self->_suppressCellServiceForAirplaneModeTransition = 1;
      v6 = dispatch_time(0, 5000000000);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __54__SBStatusBarStateAggregator__noteAirplaneModeChanged__block_invoke;
      v7[3] = &unk_1E8E9DE88;
      v7[4] = self;
      v7[5] = v5;
      dispatch_after(v6, MEMORY[0x1E0C80D38], v7);
    }
    else
    {
      ++self->_airplaneTransitionToken;
      self->_suppressCellServiceForAirplaneModeTransition = 0;
      -[SBStatusBarStateAggregator updateStatusBarItem:](self, "updateStatusBarItem:", 6);
      -[SBStatusBarStateAggregator updateStatusBarItem:](self, "updateStatusBarItem:", 7);
    }
    -[SBStatusBarStateAggregator endCoalescentBlock](self, "endCoalescentBlock");
  }
}

uint64_t __54__SBStatusBarStateAggregator__noteAirplaneModeChanged__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(result + 40) == *(_QWORD *)(v1 + 8680))
  {
    v2 = result;
    *(_BYTE *)(v1 + 8688) = 0;
    objc_msgSend(*(id *)(result + 32), "updateStatusBarItem:", 6);
    return objc_msgSend(*(id *)(v2 + 32), "updateStatusBarItem:", 7);
  }
  return result;
}

- (BOOL)_shouldShowEmergencyOnlyStatusForInfo:(id)a3
{
  return objc_msgSend(a3, "serviceState") == 3;
}

+ (int)_thermalColorForLevel:(int64_t)a3
{
  if ((unint64_t)(a3 + 2) > 5)
    return 0;
  else
    return dword_1D0E8BC50[a3 + 2];
}

uint64_t __84__SBStatusBarStateAggregator__temporarilyOverrideLocationItemForProminentIndication__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8755) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_updateLocationItem");
}

- (void)systemApertureLayoutDidChange:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("SBSystemApertureVisibleElementIdentifiers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBStatusBarStateAggregator setSystemApertureVisibleElementIdentifiers:](self, "setSystemApertureVisibleElementIdentifiers:", v4);
  -[SBStatusBarStateAggregator _updateStatusBarItemsWithRelatedSystemApertureElements](self, "_updateStatusBarItemsWithRelatedSystemApertureElements");

}

- (void)controller:(id)a3 didChangeOverrideDateFromDate:(id)a4
{
  id v5;

  objc_msgSend(a3, "overrideDate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SBStatusBarStateAggregator _stopTimeItemTimer](self, "_stopTimeItemTimer");
    -[SBStatusBarStateAggregator _updateTimeItems](self, "_updateTimeItems");
  }
  else
  {
    -[SBStatusBarStateAggregator _restartTimeItemTimer](self, "_restartTimeItemTimer");
  }

}

- (void)cache:(id)a3 didUpdateActiveAudioRoute:(id)a4
{
  -[SBStatusBarStateAggregator updateStatusBarItem:](self, "updateStatusBarItem:", 42, a4);
}

- (void)cache:(id)a3 didUpdatePickableRoutes:(id)a4
{
  -[SBStatusBarStateAggregator updateStatusBarItem:](self, "updateStatusBarItem:", 42, a4);
}

- (void)_setUserSessionController:(id)a3
{
  objc_storeStrong((id *)&self->_override_userSessionController, a3);
}

- (SBWindowScene)mainDisplayWindowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_mainDisplayWindowScene);
}

- (SBSystemStatusBatteryDataProvider)batteryDataProvider
{
  return self->_batteryDataProvider;
}

- (SBSystemStatusStatusItemsDataProvider)statusItemsDataProvider
{
  return self->_statusItemsDataProvider;
}

- (STTelephonyStatusDomainDataProvider)telephonyDataProvider
{
  return self->_telephonyDataProvider;
}

- (SBSystemStatusWifiDataProvider)wifiDataProvider
{
  return self->_wifiDataProvider;
}

- (SBSystemStatusStatusBarOverridesArchiver)statusBarOverridesObserver
{
  return self->_statusBarOverridesObserver;
}

- (STBatteryStatusDomain)batteryDomain
{
  return self->_batteryDomain;
}

- (void)setBatteryDomain:(id)a3
{
  objc_storeStrong((id *)&self->_batteryDomain, a3);
}

- (STCallingStatusDomain)callingDomain
{
  return self->_callingDomain;
}

- (void)setCallingDomain:(id)a3
{
  objc_storeStrong((id *)&self->_callingDomain, a3);
}

- (STFocusStatusDomain)focusDomain
{
  return self->_focusDomain;
}

- (void)setFocusDomain:(id)a3
{
  objc_storeStrong((id *)&self->_focusDomain, a3);
}

- (STPlaygroundsStatusDomain)playgroundsDomain
{
  return self->_playgroundsDomain;
}

- (void)setPlaygroundsDomain:(id)a3
{
  objc_storeStrong((id *)&self->_playgroundsDomain, a3);
}

- (STStatusItemsStatusDomain)statusItemsDomain
{
  return self->_statusItemsDomain;
}

- (void)setStatusItemsDomain:(id)a3
{
  objc_storeStrong((id *)&self->_statusItemsDomain, a3);
}

- (STStewieStatusDomain)stewieDomain
{
  return self->_stewieDomain;
}

- (void)setStewieDomain:(id)a3
{
  objc_storeStrong((id *)&self->_stewieDomain, a3);
}

- (void)setTelephonyDomain:(id)a3
{
  objc_storeStrong((id *)&self->_telephonyDomain, a3);
}

- (STVoiceControlStatusDomain)voiceControlDomain
{
  return self->_voiceControlDomain;
}

- (void)setVoiceControlDomain:(id)a3
{
  objc_storeStrong((id *)&self->_voiceControlDomain, a3);
}

- (STWifiStatusDomain)wifiDomain
{
  return self->_wifiDomain;
}

- (void)setWifiDomain:(id)a3
{
  objc_storeStrong((id *)&self->_wifiDomain, a3);
}

- (NSArray)systemApertureVisibleElementIdentifiers
{
  return self->_systemApertureVisibleElementIdentifiers;
}

- (void)setSystemApertureVisibleElementIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_systemApertureVisibleElementIdentifiers, a3);
}

- (SAInvalidatable)systemApertureChargingElementAssertion
{
  return self->_systemApertureChargingElementAssertion;
}

- (void)setSystemApertureChargingElementAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_systemApertureChargingElementAssertion, a3);
}

- (unint64_t)batteryChargingState
{
  return self->_batteryChargingState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemApertureChargingElementAssertion, 0);
  objc_storeStrong((id *)&self->_systemApertureVisibleElementIdentifiers, 0);
  objc_storeStrong((id *)&self->_wifiDomain, 0);
  objc_storeStrong((id *)&self->_voiceControlDomain, 0);
  objc_storeStrong((id *)&self->_telephonyDomain, 0);
  objc_storeStrong((id *)&self->_stewieDomain, 0);
  objc_storeStrong((id *)&self->_statusItemsDomain, 0);
  objc_storeStrong((id *)&self->_playgroundsDomain, 0);
  objc_storeStrong((id *)&self->_focusDomain, 0);
  objc_storeStrong((id *)&self->_callingDomain, 0);
  objc_storeStrong((id *)&self->_batteryDomain, 0);
  objc_storeStrong((id *)&self->_statusBarOverridesObserver, 0);
  objc_storeStrong((id *)&self->_wifiDataProvider, 0);
  objc_storeStrong((id *)&self->_telephonyDataProvider, 0);
  objc_storeStrong((id *)&self->_statusItemsDataProvider, 0);
  objc_storeStrong((id *)&self->_batteryDataProvider, 0);
  objc_destroyWeak((id *)&self->_mainDisplayWindowScene);
  objc_storeStrong((id *)&self->_callToActionIdentifier, 0);
  objc_storeStrong((id *)&self->_overridePersonName, 0);
  objc_storeStrong((id *)&self->_personName, 0);
  objc_storeStrong((id *)&self->_lazy_userSessionController, 0);
  objc_storeStrong((id *)&self->_tetheringBackgroundActivityAssertion, 0);
  objc_storeStrong((id *)&self->_satelliteSOSBackgroundActivityAssertion, 0);
  objc_storeStrong((id *)&self->_playgroundsBackgroundActivityAssertion, 0);
  objc_storeStrong((id *)&self->_mediaBackgroundActivityAssertion, 0);
  objc_storeStrong((id *)&self->_callingBackgroundActivityAssertionsByDescriptor, 0);
  objc_storeStrong((id *)&self->_prominentLocationTimer, 0);
  objc_storeStrong((id *)&self->_coreBluetoothManager, 0);
  objc_storeStrong((id *)&self->_connectedLEBluetoothDevices, 0);
  objc_storeStrong((id *)&self->_connectedClassicBluetoothDevices, 0);
  objc_storeStrong((id *)&self->_batteryDetailString, 0);
  objc_storeStrong((id *)&self->_activityDisplayIdentifier, 0);
  objc_storeStrong((id *)&self->_secondaryServiceBadgeString, 0);
  objc_storeStrong((id *)&self->_serviceBadgeString, 0);
  objc_storeStrong((id *)&self->_secondaryServiceCrossfadeString, 0);
  objc_storeStrong((id *)&self->_secondaryServiceString, 0);
  objc_storeStrong((id *)&self->_serviceCrossfadeString, 0);
  objc_storeStrong((id *)&self->_serviceString, 0);
  objc_storeStrong((id *)&self->_dateItemTimeString, 0);
  objc_storeStrong((id *)&self->_shortTimeItemTimeString, 0);
  objc_storeStrong((id *)&self->_timeItemTimeString, 0);
  objc_storeStrong((id *)&self->_dateItemDateFormatter, 0);
  objc_storeStrong((id *)&self->_shortTimeItemDateFormatter, 0);
  objc_storeStrong((id *)&self->_timeItemDateFormatter, 0);
  objc_storeStrong((id *)&self->_timeItemTimer, 0);
  objc_storeStrong((id *)&self->_postObservers, 0);
  objc_storeStrong((id *)&self->_override_userSessionController, 0);
  objc_storeStrong((id *)&self->_statusBarDefaults, 0);
}

- (void)_updateStatusBarForSystemStatusDomainName:(os_log_t)log data:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D0540000, log, OS_LOG_TYPE_FAULT, "[SBStatusBarStateAggregator] Cannot update status bar for unknown or invalid SystemStatus domain.", v1, 2u);
  OUTLINED_FUNCTION_4();
}

void __95__SBStatusBarStateAggregator__updateBackgroundActivityAssertionsForSystemStatusDomain_andData___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1D0540000, a1, a3, "Failed to acquire playgrounds status bar style override", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __95__SBStatusBarStateAggregator__updateBackgroundActivityAssertionsForSystemStatusDomain_andData___block_invoke_3_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1D0540000, a1, a3, "Failed to acquire stewie status bar style override", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)_updateStatusBarItemsForSystemStatusDomain:(uint64_t)a1 andData:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  STSystemStatusDescriptionForDomain();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "Don't know how to update items for %@", (uint8_t *)&v4, 0xCu);

}

void __91__SBStatusBarStateAggregator__updateCallingBackgroundActivityAssertionsForCallDescriptors___block_invoke_4_cold_1(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 40), "backgroundActivityIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  STBackgroundActivityIdentifierDescription();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_20(&dword_1D0540000, v3, v4, "failed to acquire calling background activity assertion for identifier: %{public}@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_20();
}

void __91__SBStatusBarStateAggregator__updateCallingBackgroundActivityAssertionsForCallDescriptors___block_invoke_184_cold_1(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "backgroundActivityIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  STBackgroundActivityIdentifierDescription();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_20(&dword_1D0540000, v3, v4, "calling background activity assertion unexpectedly invalidated for identifier: %{public}@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_20();
}

- (void)updateStatusBarItem:(int)a1 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_1D0540000, a2, OS_LOG_TYPE_DEBUG, "*** [SBStatusBarStateAggregator] cannot update unknown status bar item (%i)", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_4();
}

@end
