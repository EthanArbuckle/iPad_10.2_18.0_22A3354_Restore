@implementation _SBPointerTouchDownEventSniffer

- (void)handleEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id WeakRetained;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "type"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v4, "allTouches", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if ((objc_msgSend(v10, "_isPointerTouch") & 1) != 0)
          {
            v12 = objc_msgSend(v10, "phase");
            v13 = objc_msgSend(v10, "phase");

            WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            v11 = WeakRetained;
            if (v12)
            {
              if (v13 == 3)
                objc_msgSend(WeakRetained, "eventSnifferHandledPointerTouchUp:", self);
            }
            else
            {
              objc_msgSend(WeakRetained, "eventSnifferHandledPointerTouchDown:", self);
            }
            goto LABEL_15;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
          continue;
        break;
      }
    }

    v11 = objc_loadWeakRetained((id *)&self->_delegate);
LABEL_15:

  }
}

- (_SBPointerTouchDownEventSnifferDelegate)delegate
{
  return (_SBPointerTouchDownEventSnifferDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
