@implementation UITextInputSessionAccidentalDictationIdentifyTruePositive

void __UITextInputSessionAccidentalDictationIdentifyTruePositive_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  BOOL v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  UITextInputSessionLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v22 = 134218242;
    v23 = a3;
    v24 = 2112;
    v25 = v7;
    _os_log_debug_impl(&dword_185066000, v8, OS_LOG_TYPE_DEBUG, "[UITextInputSessionAccidentalDictation] TP: Checking idx %lu: %@", (uint8_t *)&v22, 0x16u);
  }

  if (a3)
  {
    v9 = a1 + 32;
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    {
      objc_msgSend(v7, "asDictationBegan");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v9 + 8) + 24) = 0;
        UITextInputSessionLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v22) = 0;
          v12 = "[UITextInputSessionAccidentalDictation] TP stage 2";
LABEL_12:
          _os_log_debug_impl(&dword_185066000, v11, OS_LOG_TYPE_DEBUG, v12, (uint8_t *)&v22, 2u);
          goto LABEL_26;
        }
        goto LABEL_26;
      }
    }
LABEL_14:
    objc_msgSend(v7, "asKeyboardDockItemButtonPress");
    v16 = objc_claimAutoreleasedReturnValue();
    v11 = v16;
    if (a3
      && (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v9 + 8) + 24) ? (v17 = v16 == 0) : (v17 = 1),
          !v17 && -[NSObject buttonType](v16, "buttonType") == 1 && -[NSObject uiOrientation](v11, "uiOrientation") == 1))
    {
      if (-[NSObject buttonPressResult](v11, "buttonPressResult") == 3)
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v9 + 8) + 24) = 0;
        UITextInputSessionLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v22) = 0;
          v19 = "[UITextInputSessionAccidentalDictation] TP stage 3";
LABEL_31:
          _os_log_debug_impl(&dword_185066000, v18, OS_LOG_TYPE_DEBUG, v19, (uint8_t *)&v22, 2u);
        }
      }
      else
      {
        v20 = -[NSObject buttonPressResult](v11, "buttonPressResult");
        v21 = *(_QWORD *)(*(_QWORD *)v9 + 8);
        if (v20 != 1)
        {
          *(_QWORD *)(v21 + 24) = 2;
          *a4 = 1;
          UITextInputSessionLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            goto LABEL_25;
          LOWORD(v22) = 0;
          v19 = "[UITextInputSessionAccidentalDictation] TP stage 5 - INVALID";
          goto LABEL_31;
        }
        *(_QWORD *)(v21 + 24) = 1;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
        *a4 = 1;
        UITextInputSessionLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v22) = 0;
          v19 = "[UITextInputSessionAccidentalDictation] TP stage 4 - VALID";
          goto LABEL_31;
        }
      }
    }
    else
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v9 + 8) + 24) = 2;
      *a4 = 1;
      UITextInputSessionLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v22) = 0;
        v19 = "[UITextInputSessionAccidentalDictation] TP stage 6 - INVALID";
        goto LABEL_31;
      }
    }
LABEL_25:

    goto LABEL_26;
  }
  objc_msgSend(v7, "asInsertion");
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13 || (v14 = (void *)v13, v15 = objc_msgSend(v7, "source"), v14, v15 != 2))
  {
    v9 = a1 + 32;
    goto LABEL_14;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  UITextInputSessionLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v22) = 0;
    v12 = "[UITextInputSessionAccidentalDictation] TP stage 1";
    goto LABEL_12;
  }
LABEL_26:

}

@end
