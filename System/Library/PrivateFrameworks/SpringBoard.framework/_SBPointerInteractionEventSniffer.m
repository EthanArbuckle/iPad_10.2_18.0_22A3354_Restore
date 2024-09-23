@implementation _SBPointerInteractionEventSniffer

- (void)handleEvent:(id)a3
{
  void *WeakRetained;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  _BOOL4 v18;
  _BOOL4 v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(a3, "allTouches", 0);
  WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(WeakRetained, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(WeakRetained);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v9, "_isPointerTouch"))
        {
          objc_msgSend(v9, "view");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "previousLocationInView:", v10);
          v12 = v11;
          v14 = v13;
          objc_msgSend(v9, "view");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "locationInView:", v15);
          v18 = v14 == v17 && v12 == v16;

          v19 = objc_msgSend(v9, "phase") != 4 && objc_msgSend(v9, "phase") != 2;
          v20 = objc_msgSend(v9, "type");
          if (!v18 && v19 && !v20)
          {

            WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            objc_msgSend(WeakRetained, "eventSnifferHandledPointerInteractionQualifyingEvent:", self);
            goto LABEL_19;
          }
        }
      }
      v6 = objc_msgSend(WeakRetained, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_19:

}

- (_SBPointerInteractionEventSnifferDelegate)delegate
{
  return (_SBPointerInteractionEventSnifferDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBWindowScene)windowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (void)setWindowScene:(id)a3
{
  objc_storeWeak((id *)&self->_windowScene, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
