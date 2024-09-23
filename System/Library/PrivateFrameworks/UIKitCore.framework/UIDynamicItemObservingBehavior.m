@implementation UIDynamicItemObservingBehavior

void __54___UIDynamicItemObservingBehavior_willMoveToAnimator___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _BOOL4 v13;
  double v14;
  _BOOL4 v15;
  void *v16;
  uint64_t v17;
  void *v18;
  double v19;
  dispatch_time_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(WeakRetained, "items", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(WeakRetained, "linearVelocityForItem:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
        v9 = v8;
        v11 = v10;
        objc_msgSend(WeakRetained, "targetVelocity");
        v13 = v9 == 0.0;
        if (fabs(v14) > fabs(v9))
          v13 = 1;
        v15 = v11 == 0.0;
        if (fabs(v12) > fabs(v11))
          v15 = 1;
        v5 += v13 & v15;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  if (objc_msgSend(WeakRetained, "frameCount") >= 1)
  {
    objc_msgSend(WeakRetained, "items");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (v5 == v17)
    {
      objc_msgSend(WeakRetained, "setEnabled:", 0);
      objc_msgSend(WeakRetained, "completionHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        objc_msgSend(WeakRetained, "completionHandlerInvocationDelay");
        v20 = dispatch_time(0, (uint64_t)(v19 * 1000000000.0));
        dispatch_after(v20, MEMORY[0x1E0C80D38], v18);
      }

    }
  }
  objc_msgSend(WeakRetained, "setFrameCount:", objc_msgSend(WeakRetained, "frameCount") + 1);

}

@end
