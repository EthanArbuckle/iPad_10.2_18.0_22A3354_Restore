@implementation UIFeedback

void __19___UIFeedback_play__block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  unint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _BYTE location[12];
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_player");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9 != v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "_setPlayer:", v7);
      objc_initWeak((id *)location, *(id *)(a1 + 32));
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __19___UIFeedback_play__block_invoke_2;
      v20[3] = &unk_1E16B3F40;
      objc_copyWeak(&v21, (id *)location);
      objc_msgSend(v7, "setInvalidationBlock:", v20);
      objc_destroyWeak(&v21);
      objc_destroyWeak((id *)location);
    }
    objc_msgSend(*(id *)(a1 + 32), "_playedAtTime:engine:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
  }
  else if (!_UIFeedbackLoggingDisabled)
  {
    v10 = _UISystemSoundIDNone_block_invoke___s_category;
    if (!_UISystemSoundIDNone_block_invoke___s_category)
    {
      v10 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v10, (unint64_t *)&_UISystemSoundIDNone_block_invoke___s_category);
    }
    v11 = *(NSObject **)(v10 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      v13 = *(id *)(a1 + 32);
      v14 = v11;
      objc_msgSend(v12, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v13), v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (void *)MEMORY[0x1E0CB3940];
      v17 = *(id *)(a1 + 40);
      v18 = v15;
      objc_msgSend(v16, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v17), v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)location = 138412802;
      *(_QWORD *)&location[4] = v8;
      v23 = 2112;
      v24 = v15;
      v25 = 2112;
      v26 = v19;
      _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_DEFAULT, "%@ - can't play feedback %@ with engine %@, dropping it", location, 0x20u);

    }
  }

}

void __19___UIFeedback_play__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setPlayer:", 0);

}

uint64_t __19___UIFeedback_stop__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_stopFeedback:", *(_QWORD *)(a1 + 32));
}

void __26___UIFeedback_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "description");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("; %@: %@"), v5, v6);

}

@end
