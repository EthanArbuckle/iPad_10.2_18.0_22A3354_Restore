@implementation _UISystemReferenceAngleMultiplexer

- (_UISystemReferenceAngleMultiplexer)init
{
  _UISystemReferenceAngleMultiplexer *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UISystemReferenceAngleMultiplexer;
  v2 = -[_UISystemReferenceAngleMultiplexer init](&v4, sel_init);
  if (v2)
    _UISSetSystemReferenceAngleDataSource();
  return v2;
}

+ (_UISystemReferenceAngleMultiplexer)sharedMultiplexer
{
  if (_MergedGlobals_1176 != -1)
    dispatch_once(&_MergedGlobals_1176, &__block_literal_global_416);
  return (_UISystemReferenceAngleMultiplexer *)(id)qword_1ECD7F648;
}

- (void)systemReferenceAngleDidChange:(double)a3 mode:(unint64_t)a4 forWindows:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  int v19;
  double v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  _QWORD v25[3];
  _QWORD v26[4];

  v26[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a5, "bs_compactMap:", &__block_literal_global_2_11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v25[0] = *MEMORY[0x1E0DC5D40];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v8;
    v25[1] = *MEMORY[0x1E0DC5D38];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v9;
    v25[2] = *MEMORY[0x1E0DC5D28];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v26[2] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = qword_1ECD7F658;
    if (!qword_1ECD7F658)
    {
      v12 = __UILogCategoryGetNode("SystemReferenceAngle", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v12, (unint64_t *)&qword_1ECD7F658);
    }
    if ((*(_BYTE *)v12 & 1) != 0)
    {
      v15 = *(NSObject **)(v12 + 8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = v15;
        _UISStringForSystemReferenceAngleMode();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 134218498;
        v20 = a3;
        v21 = 2112;
        v22 = v17;
        v23 = 2048;
        v24 = objc_msgSend(v7, "count");
        _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "Notifying system reference angle changed: angle=%.0f; mode=%@; affectedContextCount=%lu",
          (uint8_t *)&v19,
          0x20u);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postNotificationName:object:userInfo:", *MEMORY[0x1E0DC5D30], 0, v11);
    goto LABEL_6;
  }
  v14 = qword_1ECD7F650;
  if (!qword_1ECD7F650)
  {
    v14 = __UILogCategoryGetNode("SystemReferenceAngle", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v14, (unint64_t *)&qword_1ECD7F650);
  }
  if ((*(_BYTE *)v14 & 1) != 0)
  {
    v18 = *(NSObject **)(v14 + 8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v11 = v18;
      _UISStringForSystemReferenceAngleMode();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 134218242;
      v20 = a3;
      v21 = 2112;
      v22 = v13;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "System reference angle changed but there are no affected contexts. Ignoring. angle=%.0f; mode=%@",
        (uint8_t *)&v19,
        0x16u);
LABEL_6:

    }
  }

}

- (double)_systemReferenceAngleForContextID:(unsigned int)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  unint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  unint64_t v13;
  NSObject *v15;
  int v16;
  unsigned int v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[UIWindow _windowWithContextId:](UIWindow, "_windowWithContextId:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "_systemReferenceAngle");
    v7 = v6;
    v8 = qword_1ECD7F660;
    if (!qword_1ECD7F660)
    {
      v8 = __UILogCategoryGetNode("SystemReferenceAngle", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v8, (unint64_t *)&qword_1ECD7F660);
    }
    if ((*(_BYTE *)v8 & 1) != 0)
    {
      v9 = *(NSObject **)(v8 + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v16 = 67109376;
        v17 = a3;
        v18 = 2048;
        v19 = v7;
        v10 = "System reference angle requested for contextID %i -> %.0f";
        v11 = v9;
        v12 = 18;
LABEL_13:
        _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v16, v12);
      }
    }
  }
  else
  {
    v13 = qword_1ECD7F668;
    if (!qword_1ECD7F668)
    {
      v13 = __UILogCategoryGetNode("SystemReferenceAngle", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v13, (unint64_t *)&qword_1ECD7F668);
    }
    v7 = 0.0;
    if ((*(_BYTE *)v13 & 1) != 0)
    {
      v15 = *(NSObject **)(v13 + 8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = 67109120;
        v17 = a3;
        v10 = "System reference angle requested for an unknown contextID (%i). Returning 0.";
        v11 = v15;
        v12 = 8;
        goto LABEL_13;
      }
    }
  }

  return v7;
}

- (unint64_t)_systemReferenceAngleModeForContextID:(unsigned int)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  int v16;
  unsigned int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[UIWindow _windowWithContextId:](UIWindow, "_windowWithContextId:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "_systemReferenceAngleMode");
    v7 = qword_1ECD7F670;
    if (!qword_1ECD7F670)
    {
      v7 = __UILogCategoryGetNode("SystemReferenceAngle", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&qword_1ECD7F670);
    }
    v8 = (double)v6;
    if ((*(_BYTE *)v7 & 1) != 0)
    {
      v12 = *(NSObject **)(v7 + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = v12;
        _UISStringForSystemReferenceAngleMode();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 67109378;
        v17 = a3;
        v18 = 2112;
        v19 = v14;
        _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "System reference angle mode requested for contextID %i -> %@", (uint8_t *)&v16, 0x12u);

      }
    }
    v9 = (unint64_t)v8;
  }
  else
  {
    v10 = qword_1ECD7F678;
    if (!qword_1ECD7F678)
    {
      v10 = __UILogCategoryGetNode("SystemReferenceAngle", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v10, (unint64_t *)&qword_1ECD7F678);
    }
    if ((*(_BYTE *)v10 & 1) != 0)
    {
      v15 = *(NSObject **)(v10 + 8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = 67109120;
        v17 = a3;
        _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "System reference angle mode requested for an unknown contextID (%i). Returning \"unknown\".", (uint8_t *)&v16, 8u);
      }
    }
    v9 = 0;
  }

  return v9;
}

@end
