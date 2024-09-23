@implementation UITextInputSessionAccidentalDictationIdentifyFalsePositive

void __UITextInputSessionAccidentalDictationIdentifyFalsePositive_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  NSObject *v14;
  BOOL v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  UITextInputSessionLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v20 = 134218242;
    v21 = a3;
    v22 = 2112;
    v23 = v7;
    _os_log_debug_impl(&dword_185066000, v8, OS_LOG_TYPE_DEBUG, "[UITextInputSessionAccidentalDictation] FP: Checking idx %lu: %@", (uint8_t *)&v20, 0x16u);
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
          LOWORD(v20) = 0;
          v12 = "[UITextInputSessionAccidentalDictation] FP stage 2";
LABEL_11:
          _os_log_debug_impl(&dword_185066000, v11, OS_LOG_TYPE_DEBUG, v12, (uint8_t *)&v20, 2u);
          goto LABEL_24;
        }
        goto LABEL_24;
      }
    }
LABEL_12:
    objc_msgSend(v7, "asKeyboardDockItemButtonPress");
    v14 = objc_claimAutoreleasedReturnValue();
    v11 = v14;
    if (a3
      && (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v9 + 8) + 24) ? (v15 = v14 == 0) : (v15 = 1),
          !v15 && -[NSObject buttonType](v14, "buttonType") == 1 && -[NSObject uiOrientation](v11, "uiOrientation") == 1))
    {
      if (-[NSObject buttonPressResult](v11, "buttonPressResult") == 3)
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v9 + 8) + 24) = 0;
        UITextInputSessionLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v20) = 0;
          v17 = "[UITextInputSessionAccidentalDictation] FP stage 3";
LABEL_29:
          _os_log_debug_impl(&dword_185066000, v16, OS_LOG_TYPE_DEBUG, v17, (uint8_t *)&v20, 2u);
        }
      }
      else
      {
        v18 = -[NSObject buttonPressResult](v11, "buttonPressResult");
        v19 = *(_QWORD *)(*(_QWORD *)v9 + 8);
        if (v18 != 1)
        {
          *(_QWORD *)(v19 + 24) = 2;
          *a4 = 1;
          UITextInputSessionLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            goto LABEL_23;
          LOWORD(v20) = 0;
          v17 = "[UITextInputSessionAccidentalDictation] FP stage 5 - INVALID";
          goto LABEL_29;
        }
        *(_QWORD *)(v19 + 24) = 1;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
        *a4 = 1;
        UITextInputSessionLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v20) = 0;
          v17 = "[UITextInputSessionAccidentalDictation] FP stage 4 - VALID";
          goto LABEL_29;
        }
      }
    }
    else
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v9 + 8) + 24) = 2;
      *a4 = 1;
      UITextInputSessionLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v20) = 0;
        v17 = "[UITextInputSessionAccidentalDictation] FP stage 6 - INVALID";
        goto LABEL_29;
      }
    }
LABEL_23:

    goto LABEL_24;
  }
  objc_msgSend(v7, "asDictationEnded");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = a1 + 32;
  if (!v13)
    goto LABEL_12;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v9 + 8) + 24) = 0;
  UITextInputSessionLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v20) = 0;
    v12 = "[UITextInputSessionAccidentalDictation] FP stage 1";
    goto LABEL_11;
  }
LABEL_24:

}

@end
