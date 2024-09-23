@implementation UIKeyboardUIHandle

- (UIKeyboardUIHandle)initWithService:(id)a3 connection:(id)a4
{
  id v6;
  id v7;
  UIKeyboardUIHandle *v8;
  UIKeyboardUIHandle *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UIKeyboardUIHandle;
  v8 = -[UIKeyboardUIHandle init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_service, v6);
    objc_storeStrong((id *)&v9->_connection, a4);
  }

  return v9;
}

- (id)snapshotForView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIKeyboardUISnapshot *v13;
  id WeakRetained;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  UIKeyboardUISnapshot *v34;
  NSObject *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  CATransform3D v41;
  CATransform3D v42;
  _QWORD v43[8];
  _QWORD v44[10];

  v44[8] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(v4, "_window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "screen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "scale");
    v8 = v7;
    objc_msgSend(v4, "frame");
    v10 = v9;
    v12 = v11;
    v13 = objc_alloc_init(UIKeyboardUISnapshot);
    WeakRetained = objc_loadWeakRetained((id *)&self->_service);
    -[UIKeyboardUISnapshot setSlotID:](v13, "setSlotID:", objc_msgSend(WeakRetained, "createSlot:", v8 * v10, v8 * v12));

    -[UIKeyboardUISnapshot setSize:](v13, "setSize:", v10, v12);
    v15 = *MEMORY[0x1E0CD30F0];
    v44[0] = *MEMORY[0x1E0CD3110];
    v16 = *MEMORY[0x1E0CD30B0];
    v43[0] = v15;
    v43[1] = v16;
    v40 = v6;
    objc_msgSend(v6, "displayConfiguration");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "name");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v44[1] = v38;
    v43[2] = *MEMORY[0x1E0CD3098];
    v17 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "layer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "numberWithUnsignedInt:", objc_msgSend(v18, "contextId"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v44[2] = v19;
    v43[3] = *MEMORY[0x1E0CD30E8];
    v20 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "numberWithUnsignedLongLong:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v44[3] = v22;
    v43[4] = *MEMORY[0x1E0CD30A8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[UIKeyboardUISnapshot slotID](v13, "slotID"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v44[4] = v23;
    v43[5] = *MEMORY[0x1E0CD3140];
    v24 = (void *)MEMORY[0x1E0CB3B18];
    v25 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    *(_OWORD *)&v41.m31 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    *(_OWORD *)&v41.m33 = v25;
    v26 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    *(_OWORD *)&v41.m41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    *(_OWORD *)&v41.m43 = v26;
    v27 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    *(_OWORD *)&v41.m11 = *MEMORY[0x1E0CD2610];
    *(_OWORD *)&v41.m13 = v27;
    v28 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    *(_OWORD *)&v41.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    *(_OWORD *)&v41.m23 = v28;
    CATransform3DScale(&v42, &v41, v8, v8, 1.0);
    objc_msgSend(v24, "valueWithCATransform3D:", &v42);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = *MEMORY[0x1E0CD3130];
    v44[5] = v29;
    v44[6] = MEMORY[0x1E0C9AAB0];
    v31 = *MEMORY[0x1E0CD30E0];
    v43[6] = v30;
    v43[7] = v31;
    v44[7] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 8);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView _appendSnapshotDisplaySystemIdentifierToOptionsIfNeeded:](v4, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if ((CARenderServerSnapshot() & 1) != 0)
    {
      v34 = v13;
    }
    else
    {
      KeyboardUIServiceLog();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v41.m11) = 0;
        _os_log_error_impl(&dword_185066000, v35, OS_LOG_TYPE_ERROR, "Failed to snapshot", (uint8_t *)&v41, 2u);
      }

      v34 = 0;
    }
    v6 = v40;

  }
  else
  {
    KeyboardUIServiceLog();
    v13 = (UIKeyboardUISnapshot *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v13->super, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v41.m11) = 0;
      _os_log_error_impl(&dword_185066000, &v13->super, OS_LOG_TYPE_ERROR, "Snapshot view does not have a screen", (uint8_t *)&v41, 2u);
    }
    v34 = 0;
  }

  return v34;
}

- (id)snapshotForOptions:(id)a3
{
  uint64_t v4;
  id v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  if (!a3)
    return 0;
  v4 = objc_msgSend(a3, "unsignedIntegerValue");
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__185;
  v12 = __Block_byref_object_dispose__185;
  v13 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__UIKeyboardUIHandle_snapshotForOptions___block_invoke;
  block[3] = &unk_1E16DB6C8;
  block[5] = &v8;
  block[6] = v4;
  block[4] = self;
  dispatch_sync(MEMORY[0x1E0C80D38], block);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __41__UIKeyboardUIHandle_snapshotForOptions___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend((id)UIApp, "isSuspended") & 1) == 0)
  {
    v2 = *(_QWORD *)(a1 + 48);
    if (v2 == 1)
    {
      +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "window");
      v3 = objc_claimAutoreleasedReturnValue();

      if (!v3)
        goto LABEL_11;
    }
    else
    {
      if (v2 != 2)
      {
        KeyboardUIServiceLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v9 = *(_QWORD *)(a1 + 48);
          v10[0] = 67109120;
          v10[1] = v9;
          _os_log_error_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Unsupported snapshot options %d", (uint8_t *)v10, 8u);
        }

        goto LABEL_11;
      }
      +[UIKeyboard snapshotViewForPredictionViewTransition](UIKeyboard, "snapshotViewForPredictionViewTransition");
      v3 = objc_claimAutoreleasedReturnValue();
      if (!v3)
      {
LABEL_11:
        KeyboardUIServiceLog();
        v3 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v10[0]) = 0;
          _os_log_error_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "Snapshot target is nil", (uint8_t *)v10, 2u);
        }
        goto LABEL_13;
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "snapshotForView:", v3);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

LABEL_13:
  }
}

- (void)setKeyboardAlpha:(id)a3 force:(id)a4 processId:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  -[BSServiceConnectionHost remoteProcess](self->_connection, "remoteProcess");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hasPrefix:", CFSTR("com.apple."));

  if (v13 && v12)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__UIKeyboardUIHandle_setKeyboardAlpha_force_processId___block_invoke;
    block[3] = &unk_1E16B47A8;
    v15 = v13;
    v16 = v8;
    v17 = v9;
    dispatch_sync(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __55__UIKeyboardUIHandle_setKeyboardAlpha_force_processId___block_invoke(id *a1)
{
  double v2;
  double v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  objc_msgSend(a1[4], "doubleValue");
  v3 = v2;
  v4 = objc_msgSend(a1[5], "BOOLValue");
  v5 = objc_msgSend(a1[6], "intValue");
  if ((v4 & 1) != 0)
    return +[UIKeyboard setKeyboardAlpha:remote:force:processId:](UIKeyboard, "setKeyboardAlpha:remote:force:processId:", 1, v4, v5, v3);
  if (v3 > 0.0)
    return +[UIKeyboard setKeyboardAlpha:remote:force:processId:](UIKeyboard, "setKeyboardAlpha:remote:force:processId:", 1, v4, v5, v3);
  result = +[UIKeyboard keyboardProcessId](UIKeyboard, "keyboardProcessId");
  if ((_DWORD)v5 == (_DWORD)result)
    return +[UIKeyboard setKeyboardAlpha:remote:force:processId:](UIKeyboard, "setKeyboardAlpha:remote:force:processId:", 1, v4, v5, v3);
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_service);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
