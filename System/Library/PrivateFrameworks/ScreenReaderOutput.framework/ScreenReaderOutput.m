void sub_2115BCE38(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x2115BCDE4);
}

void sub_2115BD540(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x2115BD518);
}

void sub_2115BEF30(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_2115BEF50(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x2115BEEECLL);
}

void _inputEventHandler(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)MEMORY[0x212BDDCF0]();
  objc_msgSend(a2, "_inputEventHandler");
  objc_autoreleasePoolPop(v3);
}

void sub_2115C24D4(_Unwind_Exception *exception_object, int a2)
{
  id v2;

  if (a2)
  {
    if (a2 != 2)
    {
      objc_begin_catch(exception_object);
      JUMPOUT(0x2115C240CLL);
    }
    v2 = objc_begin_catch(exception_object);
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_2115C2560(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x2115C2534);
  }
  JUMPOUT(0x2115C2574);
}

void sub_2115C2624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2115C2834()
{
  __break(1u);
}

void sub_2115C2890()
{
  objc_end_catch();
  JUMPOUT(0x2115C2868);
}

void sub_2115C2920()
{
  __break(1u);
}

void sub_2115C297C()
{
  objc_end_catch();
  JUMPOUT(0x2115C2950);
}

void sub_2115C29E8()
{
  __break(1u);
}

void sub_2115C2A48()
{
  objc_end_catch();
  JUMPOUT(0x2115C2A18);
}

void sub_2115C2AB4()
{
  __break(1u);
}

void sub_2115C2B14()
{
  objc_end_catch();
  JUMPOUT(0x2115C2AE4);
}

void sub_2115C2B70()
{
  __break(1u);
}

void sub_2115C2BD0()
{
  objc_end_catch();
  JUMPOUT(0x2115C2BA0);
}

void _blinkerEventHandler(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)MEMORY[0x212BDDCF0]();
  objc_msgSend(a2, "_blinkerEventHandler");
  objc_autoreleasePoolPop(v3);
}

void sub_2115C31DC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2115C365C()
{
  __break(1u);
}

void sub_2115C36CC()
{
  objc_end_catch();
  JUMPOUT(0x2115C368CLL);
}

void sub_2115C390C()
{
  __break(1u);
}

void sub_2115C396C()
{
  objc_end_catch();
  JUMPOUT(0x2115C393CLL);
}

void sub_2115C39F0()
{
  __break(1u);
}

void sub_2115C3A50()
{
  objc_end_catch();
  JUMPOUT(0x2115C3A20);
}

void sub_2115C3B24()
{
  __break(1u);
}

void sub_2115C3B84()
{
  objc_end_catch();
  JUMPOUT(0x2115C3B54);
}

void sub_2115C42C8()
{
  __break(1u);
}

void sub_2115C4324()
{
  objc_end_catch();
  JUMPOUT(0x2115C42F8);
}

void sub_2115C4D34(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_2115C4D54(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x2115C4C4CLL);
}

void sub_2115C4EC0()
{
  __break(1u);
}

void sub_2115C4F1C()
{
  objc_end_catch();
  JUMPOUT(0x2115C4EF0);
}

void sub_2115C5140()
{
  __break(1u);
}

void sub_2115C519C()
{
  objc_end_catch();
  JUMPOUT(0x2115C5174);
}

void sub_2115C54B0()
{
  __break(1u);
}

void sub_2115C5508()
{
  objc_end_catch();
  JUMPOUT(0x2115C54E0);
}

void sub_2115C5674()
{
  __break(1u);
}

void sub_2115C56E4()
{
  objc_end_catch();
  JUMPOUT(0x2115C56B4);
}

void sub_2115C59E8()
{
  __break(1u);
}

void sub_2115C5A88()
{
  objc_end_catch();
  JUMPOUT(0x2115C5A60);
}

void sub_2115C6E9C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_2115C72E4()
{
  __break(1u);
}

void sub_2115C7344()
{
  objc_end_catch();
  JUMPOUT(0x2115C7314);
}

void sub_2115C7880()
{
  __break(1u);
}

void sub_2115C78E4()
{
  objc_end_catch();
  JUMPOUT(0x2115C78B0);
}

void sub_2115C7AF8()
{
  __break(1u);
}

void sub_2115C7B5C()
{
  objc_end_catch();
  JUMPOUT(0x2115C7B28);
}

void sub_2115C94D4()
{
  __break(1u);
}

void sub_2115C9530()
{
  objc_end_catch();
  JUMPOUT(0x2115C9504);
}

void sub_2115C9598()
{
  __break(1u);
}

void sub_2115C95F0()
{
  objc_end_catch();
  JUMPOUT(0x2115C95C8);
}

void sub_2115CA140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void ___appendBrailleKeysToArray_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id *v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id *v28;
  double Current;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  id WeakRetained;
  NSObject *v38;
  void *v39;
  uint8_t v40[16];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  void *v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(a1 + 32), "_isMemorizingKeys") & 1) == 0)
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "currentBrailleChord");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    if (!v3)
    {
LABEL_36:

      return;
    }
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v42 != v6)
          objc_enumerationMutation(v2);
        v5 |= _DotValue[((unsigned __int16)objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "unsignedLongValue") >> 8)];
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v4);

    if (v5)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "setLastBrailleChordTypingTime:", CFAbsoluteTimeGetCurrent());
      v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0FC28]), "initWithBits:", v5);
      objc_msgSend(v2, "unicode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      {
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0FC28]), "initWithBits:", 0);
        objc_msgSend(v9, "unicode");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringByAppendingString:", v8);
        v11 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v11;
      }
      +[SCROBrailleTranslationManager sharedManager](SCROBrailleTranslationManager, "sharedManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "defaultLanguage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      +[SCROBrailleTranslationManager sharedManager](SCROBrailleTranslationManager, "sharedManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "serviceIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if ((SCROCustomBrailleEnabled() & 1) == 0
        && (SCROJapaneseBrailleSelected() & 1) == 0
        && ((objc_msgSend(CFSTR("⠦"), "isEqualToString:", v8) & 1) != 0
         || objc_msgSend(CFSTR("⠰"), "isEqualToString:", v8))
        && objc_msgSend(v15, "isEqualToString:", *MEMORY[0x24BE0FCB8])
        && objc_msgSend(CFSTR("jpn"), "isEqualToString:", v13)
        && !*(_BYTE *)(*(_QWORD *)(a1 + 32) + 72))
      {
        _SCROD_LOG();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v40 = 0;
          _os_log_impl(&dword_2115BB000, v38, OS_LOG_TYPE_INFO, "Starting Latin character input in Japanese Braille", v40, 2u);
        }

        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 1;
        +[SCROBrailleTranslationManager sharedManager](SCROBrailleTranslationManager, "sharedManager");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setDefaultLanguage:", CFSTR("eng-xueb"));

        goto LABEL_35;
      }
      if ((SCROCustomBrailleEnabled() & 1) == 0
        && (SCROJapaneseBrailleSelected() & 1) == 0
        && ((objc_msgSend(CFSTR("⠴"), "isEqualToString:", v8) & 1) != 0
         || objc_msgSend(CFSTR("⠰"), "isEqualToString:", v8))
        && objc_msgSend(v15, "isEqualToString:", *MEMORY[0x24BE0FCB8])
        && objc_msgSend(CFSTR("eng-xueb"), "isEqualToString:", v13)
        && *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72))
      {
        _SCROD_LOG();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v40 = 0;
          _os_log_impl(&dword_2115BB000, v16, OS_LOG_TYPE_INFO, "Stopping Latin character input in Japanese Braille", v40, 2u);
        }

        +[SCROBrailleTranslationManager sharedManager](SCROBrailleTranslationManager, "sharedManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setDefaultLanguage:", CFSTR("jpn"));

        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 0;
      }
      else
      {
        v18 = *(id **)(a1 + 32);
        if (!*(_BYTE *)(a1 + 56))
        {
          v19 = objc_msgSend(v18[6], "isSingleLetterInputOn");
          v18 = *(id **)(a1 + 32);
          if ((v19 & 1) == 0)
          {
            if ((objc_msgSend(v18[6], "wantsEdits") & 1) != 0
              || !objc_msgSend(*(id *)(a1 + 32), "isInputEightDot"))
            {
              v23 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "hasEdits");
              v24 = *(_QWORD *)(a1 + 32);
              v25 = *(void **)(v24 + 48);
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(*(id *)(v24 + 184), "currentBrailleModifiers"));
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = v26;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v46, 1);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v25) = objc_msgSend(v25, "insertBrailleStringAtCursor:modifiers:", v8, v27);

              if ((v25 & 1) == 0)
                objc_msgSend(*(id *)(a1 + 32), "_startEditingText");
              v28 = (id *)*(id *)(a1 + 32);
              Current = CFAbsoluteTimeGetCurrent();
              if (v23)
              {
                objc_msgSend(v28[23], "lastBrailleChordPosted");
                v31 = Current - v30;
                objc_msgSend(v28[23], "brailleCharExponentialMovingAverage");
                objc_msgSend(v28[23], "setBrailleCharExponentialMovingAverage:", v32 * 0.6 + v31 * 0.4);
                objc_msgSend(v28[23], "brailleCharExponentialMovingAverage");
                objc_msgSend(v28[23], "setBrailleTranslationTimeout:", fmin(v33 * 3.5, 10.0));
              }
              objc_msgSend(v28[23], "setLastBrailleChordPosted:", Current);

              objc_msgSend(*(id *)(a1 + 32), "_updateDisplay");
              v40[0] = 0;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "currentBrailleModifiers"));
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = v34;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v45, 1);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              +[SCROBrailleTranslationUtility spokenStringForInsertedBrailleString:speakLiterally:modifiers:](SCROBrailleTranslationUtility, "spokenStringForInsertedBrailleString:speakLiterally:modifiers:", v8, v40, v35);
              v36 = (void *)objc_claimAutoreleasedReturnValue();

              WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
              objc_msgSend(WeakRetained, "brailleDisplay:insertedUntranslatedText:speakLiterally:", *(_QWORD *)(a1 + 32), v36, v40[0]);

              goto LABEL_35;
            }
            v18 = *(id **)(a1 + 32);
          }
        }
        objc_msgSend(v18, "keyArrayForBrailleStringWithCurrentModifiers:", v8);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v22 = *(void **)(v21 + 40);
        *(_QWORD *)(v21 + 40) = v20;

      }
LABEL_35:

      goto LABEL_36;
    }
  }
}

uint64_t ___appendBrailleKeysToArray_block_invoke_805(uint64_t a1)
{
  uint64_t result;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id *v12;
  double Current;
  double v14;
  double v15;
  double v16;
  double v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "currentBrailleChordContainsSpacebar");
  if ((_DWORD)result)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "_isMemorizingKeys") & 1) == 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "setLastBrailleChordTypingTime:", CFAbsoluteTimeGetCurrent());
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0FC28]), "initWithBits:", 0);
      objc_msgSend(v3, "unicode");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (*(_BYTE *)(a1 + 48)
        || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "isSingleLetterInputOn") & 1) != 0
        || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "wantsEdits") & 1) == 0
        && !objc_msgSend(*(id *)(a1 + 32), "isInputContracted"))
      {
        objc_msgSend(*(id *)(a1 + 32), "keyArrayForBrailleStringWithCurrentModifiers:", v4);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v11 = *(void **)(v10 + 40);
        *(_QWORD *)(v10 + 40) = v9;

      }
      else
      {
        v5 = *(_QWORD *)(a1 + 32);
        v6 = *(void **)(v5 + 48);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(*(id *)(v5 + 184), "currentBrailleModifiers"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = v7;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v6) = objc_msgSend(v6, "insertBrailleStringAtCursor:modifiers:", v4, v8);

        if ((v6 & 1) == 0)
          objc_msgSend(*(id *)(a1 + 32), "_startEditingText");
      }
      v12 = (id *)*(id *)(a1 + 32);
      Current = CFAbsoluteTimeGetCurrent();
      objc_msgSend(v12[23], "lastBrailleChordPosted");
      v15 = Current - v14;
      objc_msgSend(v12[23], "brailleCharExponentialMovingAverage");
      objc_msgSend(v12[23], "setBrailleCharExponentialMovingAverage:", v16 * 0.6 + v15 * 0.4);
      objc_msgSend(v12[23], "brailleCharExponentialMovingAverage");
      objc_msgSend(v12[23], "setBrailleTranslationTimeout:", fmin(v17 * 3.5, 10.0));
      objc_msgSend(v12[23], "setLastBrailleChordPosted:", Current);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "setCurrentBrailleChordContainsSpacebar:", 0);
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "setCurrentBrailleChordBeganWithSpacebar:", 0);
  }
  return result;
}

uint64_t term()
{
  uint64_t result;

  result = _fd;
  if (_fd)
  {
    tcdrain(_fd);
    return close(_fd);
  }
  return result;
}

void _postBrailleDisplayDetected(void *a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v3 = (objc_class *)MEMORY[0x24BDBCE70];
    v4 = a2;
    v5 = a1;
    v6 = (void *)objc_msgSend([v3 alloc], "initWithObjectsAndKeys:", v5, CFSTR("driverID"), v4, CFSTR("element"), 0);

    _SCROD_LOG();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v10 = v6;
      _os_log_impl(&dword_2115BB000, v7, OS_LOG_TYPE_DEFAULT, "Detected braille device: %{public}@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:userInfo:", kSCROBrailleDisplayConnectedNotification, _SCROBrailleDisplayAutoDetector, v6);

  }
}

uint64_t _serialPortPublishedCallback(void *a1, const char *a2)
{
  return objc_msgSend(a1, "serialPortsWerePublished:", a2);
}

void _connectHandler(void *a1, io_iterator_t a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  SCROIOUSBElement *v8;

  v4 = (void *)MEMORY[0x212BDDCF0]();
  v5 = a1;
  v6 = IOIteratorNext(a2);
  if ((_DWORD)v6)
  {
    v7 = v6;
    do
    {
      v8 = -[SCROIOUSBElement initWithIOObject:]([SCROIOUSBElement alloc], "initWithIOObject:", v7);
      if (!v8)
        v8 = -[SCROIOHIDElement initWithIOObject:]([SCROIOHIDElement alloc], "initWithIOObject:", v7);
      _postBrailleDisplayDetected(v5, v8);

      IOObjectRelease(v7);
      v7 = IOIteratorNext(a2);
    }
    while ((_DWORD)v7);
  }

  objc_autoreleasePoolPop(v4);
}

uint64_t soft__AXSVoiceOverTouchSetTactileGraphicsDisplay(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v2 = get_AXSVoiceOverTouchSetTactileGraphicsDisplaySymbolLoc_ptr;
  v8 = get_AXSVoiceOverTouchSetTactileGraphicsDisplaySymbolLoc_ptr;
  if (!get_AXSVoiceOverTouchSetTactileGraphicsDisplaySymbolLoc_ptr)
  {
    v3 = (void *)libAccessibilityLibrary();
    v2 = dlsym(v3, "_AXSVoiceOverTouchSetTactileGraphicsDisplay");
    v6[3] = (uint64_t)v2;
    get_AXSVoiceOverTouchSetTactileGraphicsDisplaySymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v5, 8);
  if (!v2)
    soft__AXSVoiceOverTouchSetTactileGraphicsDisplay_cold_1();
  return ((uint64_t (*)(uint64_t))v2)(a1);
}

void sub_2115CCDE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_2115CD6A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t libAccessibilityLibraryCore()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = 0;
  v3 = &v2;
  v4 = 0x2020000000;
  v0 = libAccessibilityLibraryCore_frameworkLibrary_0;
  v5 = libAccessibilityLibraryCore_frameworkLibrary_0;
  if (!libAccessibilityLibraryCore_frameworkLibrary_0)
  {
    v6 = xmmword_24CC1D468;
    v7 = 0;
    v0 = _sl_dlopen();
    v3[3] = v0;
    libAccessibilityLibraryCore_frameworkLibrary_0 = v0;
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_2115CDE00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t libAccessibilityLibrary()
{
  uint64_t result;
  void *v1;

  v1 = 0;
  result = libAccessibilityLibraryCore();
  if (!result)
    libAccessibilityLibrary_cold_1(&v1);
  return result;
}

BOOL SCROBrailleDisplayHistoryIsStringUnread(void *a1)
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "attribute:atIndex:effectiveRange:", kSCROUnreadAttribute, 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

BOOL SCROBrailleDisplayHistoryIsHistoryString(void *a1)
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "attribute:atIndex:effectiveRange:", kSCROHistoryAttribute, 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

void sub_2115CFF58(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_2115D0240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_2115D045C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t _handleTactileGraphicsSettingsChange(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateTactileGraphicsDisplay");
}

void sub_2115D0730(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _updateNewlyActiveDisplay(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v13;
  id v14;

  v13 = a2;
  v14 = a1;
  objc_msgSend(v14, "setDelegateWantsDisplayCallback:", a3);
  objc_msgSend(v14, "setInputAllowed:", a4);
  objc_msgSend(v14, "setStatusAttributesWithMasterCellIndex:virtualAlignment:", a5, a6);
  objc_msgSend(v14, "setPrepareToMemorizeNextKey:immediate:", 0, 0);
  objc_msgSend(v14, "setBrailleFormatter:", v13);

  objc_msgSend(v14, "setAutomaticBrailleTranslationEnabled:", a7);
  objc_msgSend(v14, "endUpdates");

}

void sub_2115D2104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

void _addDisplayConfigurationToList(void *a1, void *a2, const __CFDictionary *a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id key;

  key = a1;
  v7 = a2;
  v8 = (void *)objc_msgSend((id)CFDictionaryGetValue(a3, key), "mutableCopy");
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v9, kSCROBrailleDisplayState[0]);
    objc_msgSend(key, "canvasDescriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v8, "setObject:forKey:", v10, kSCROBrailleDisplayCanvasDescriptor[0]);
    objc_msgSend(v7, "addObject:", v8);

  }
}

void sub_2115D8B28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2115D9688(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t libAccessibilityLibraryCore_0()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = 0;
  v3 = &v2;
  v4 = 0x2020000000;
  v0 = libAccessibilityLibraryCore_frameworkLibrary_1;
  v5 = libAccessibilityLibraryCore_frameworkLibrary_1;
  if (!libAccessibilityLibraryCore_frameworkLibrary_1)
  {
    v6 = xmmword_24CC1D8E8;
    v7 = 0;
    v0 = _sl_dlopen();
    v3[3] = v0;
    libAccessibilityLibraryCore_frameworkLibrary_1 = v0;
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_2115DA790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t libAccessibilityLibrary_0()
{
  uint64_t result;
  void *v1;

  v1 = 0;
  result = libAccessibilityLibraryCore_0();
  if (!result)
    libAccessibilityLibrary_cold_1_0(&v1);
  return result;
}

void _processQueue(void *a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x212BDDCF0]();
  objc_msgSend(a1, "_processQueue");
  objc_autoreleasePoolPop(v2);
}

void sub_2115DB004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_2115E1324(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_2115E1BE8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

id _createAttributedPaddingStringWithLength(unint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  CFStringRef v5;
  __CFString *v6;
  void *v7;
  void *v8;
  UniChar chars[256];
  uint64_t v11;
  CFRange v12;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1 < 0x101)
  {
    v12.location = 0;
    v12.length = a1;
    v5 = CFStringCreateWithSubstring(0, (CFStringRef)_SpaceString, v12);
  }
  else
  {
    v4 = 0;
    do
      chars[v4++] = kSCROBrailleUnicodeCharacterBase;
    while (a1 != v4);
    v5 = CFStringCreateWithCharacters(0, chars, a1);
  }
  v6 = (__CFString *)v5;
  v7 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v7, "setObject:forKey:", CFSTR(" "), kSCROBrailleOriginalStringAttribute[0]);
  objc_msgSend(v7, "setObject:forKey:", MEMORY[0x24BDBD1C8], kSCROEditableTextPaddingAttribute[0]);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v6, v7);

  return v8;
}

__CFString *_applyDots7And8FocusFilterToPrintBraille(void *a1, NSUInteger a2, NSUInteger a3)
{
  __CFString *v5;
  const __CFString *v6;
  uint64_t v7;
  char *v8;
  const char *CStringPtr;
  unint64_t v10;
  NSObject *v11;
  void *v12;
  __CFString *v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  UniChar v20;
  int64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v25;
  NSUInteger v26;
  _OWORD buffer[8];
  CFStringRef v28;
  const UniChar *CharactersPtr;
  const char *v30;
  NSUInteger v31;
  int64_t v32;
  int64_t v33;
  int64_t v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  __CFString *v38;
  uint64_t v39;
  NSRange v40;
  CFRange v41;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = (const __CFString *)MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = v6;
  v26 = a2;
  v31 = a2;
  v32 = a3;
  CharactersPtr = CFStringGetCharactersPtr(v6);
  if (CharactersPtr)
    CStringPtr = 0;
  else
    CStringPtr = CFStringGetCStringPtr(v5, 0x600u);
  memset(buffer, 0, sizeof(buffer));
  v10 = v26 + a3;
  v33 = 0;
  v34 = 0;
  v30 = CStringPtr;
  if (v10 <= -[__CFString length](v5, "length"))
  {
    v25 = (uint64_t)&v25;
    if (a3)
    {
      v14 = 0;
      v15 = 0;
      v16 = 64;
      do
      {
        if ((unint64_t)v15 >= 4)
          v17 = 4;
        else
          v17 = v15;
        v18 = v26 + v15;
        if (v18 >= -[__CFString length](v5, "length", v25))
          break;
        v19 = v32;
        if (v32 <= v15)
        {
          LOBYTE(v20) = 0;
        }
        else if (CharactersPtr)
        {
          v20 = CharactersPtr[v15 + v31];
        }
        else if (v30)
        {
          LOBYTE(v20) = v30[v31 + v15];
        }
        else
        {
          if (v34 <= v15 || (v21 = v33, v33 > v15))
          {
            v22 = v15 - v17 + 64;
            if (v22 >= v32)
              v22 = v32;
            v33 = v15 - v17;
            v34 = v22;
            if (v32 >= v16 - v17)
              v19 = v16 - v17;
            v41.length = v19 + v17 + v14;
            v41.location = v15 - v17 + v31;
            CFStringGetCharacters(v28, v41, (UniChar *)buffer);
            v21 = v33;
          }
          v20 = *((_WORD *)buffer + v15 - v21);
        }
        *(_WORD *)&v8[2 * v15++] = kSCROBrailleUnicodeCharacterBase
                                 + 192
                                 + (((_BYTE)v20 - (_BYTE)kSCROBrailleUnicodeCharacterBase) & 0x3F);
        --v14;
        ++v16;
      }
      while (a3 != v15);
    }
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCharacters:length:", v8, a3);
    -[__CFString stringByReplacingCharactersInRange:withString:](v5, "stringByReplacingCharactersInRange:withString:", v26, a3, v23);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _SCROD_LOG();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v40.location = v26;
      v40.length = a3;
      NSStringFromRange(v40);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412547;
      v36 = v12;
      v37 = 2117;
      v38 = v5;
      _os_log_impl(&dword_2115BB000, v11, OS_LOG_TYPE_DEFAULT, "Error applying braille filter. Range %@ goes beyond braille string \"%{sensitive}@\"", buf, 0x16u);

    }
    v13 = v5;
  }

  return v13;
}

void sub_2115E4938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SCROJapaneseBrailleSelected()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  +[SCROBrailleTranslationManager sharedManager](SCROBrailleTranslationManager, "sharedManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "serviceIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isEqual:", CFSTR("com.apple.scrod.braille.table.nbsc")) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    objc_msgSend(v0, "serviceIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v3, "isEqual:", CFSTR("com.apple.scrod.braille.table.apple"));

  }
  return v2;
}

uint64_t SCROCustomBrailleEnabled()
{
  return _os_feature_enabled_impl();
}

void sub_2115E672C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_2115E6B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  uint64_t v16;
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v16 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_2115E7050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t SCROBrailleCreateTranslatePrintBrailleToBrailleCode(void *a1)
{
  __CFString *v1;
  CFIndex Length;
  uint64_t v3;
  char *v4;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  UniChar v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  int64_t v18;
  CFRange v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  __int128 buffer;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __CFString *v32;
  const UniChar *v33;
  const char *v34;
  uint64_t v35;
  int64_t v36;
  int64_t v37;
  int64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  Length = CFStringGetLength(v1);
  v3 = MEMORY[0x24BDAC7A8]();
  v4 = (char *)&buffer - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = v1;
  v35 = 0;
  v36 = v3;
  CharactersPtr = CFStringGetCharactersPtr(v1);
  CStringPtr = 0;
  v33 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(v1, 0x600u);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v25 = 0u;
  buffer = 0u;
  v37 = 0;
  v38 = 0;
  v34 = CStringPtr;
  if (Length >= 1)
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 64;
    do
    {
      if ((unint64_t)v9 >= 4)
        v11 = 4;
      else
        v11 = v9;
      if (v36 <= v9)
      {
        LOBYTE(v12) = 0;
      }
      else if (v33)
      {
        v12 = v33[v9 + v35];
      }
      else if (v34)
      {
        LOBYTE(v12) = v34[v35 + v9];
      }
      else
      {
        if (v38 <= v9 || v8 > v9)
        {
          v14 = -v11;
          v15 = v11 + v7;
          v16 = v10 - v11;
          v17 = v9 + v14;
          v18 = v17 + 64;
          if (v17 + 64 >= v36)
            v18 = v36;
          v37 = v17;
          v38 = v18;
          v19.location = v17 + v35;
          if (v36 >= v16)
            v20 = v16;
          else
            v20 = v36;
          v19.length = v20 + v15;
          CFStringGetCharacters(v32, v19, (UniChar *)&buffer);
          v8 = v37;
        }
        v12 = *((_WORD *)&buffer + v9 - v8);
      }
      v4[v9++] = v12 - kSCROBrailleUnicodeCharacterBase;
      --v7;
      ++v10;
    }
    while (Length != v9);
  }
  v21 = objc_alloc(MEMORY[0x24BDBCE50]);
  v22 = objc_msgSend(v21, "initWithBytes:length:", v4, Length, (_QWORD)buffer, *((_QWORD *)&buffer + 1), (_QWORD)v25, *((_QWORD *)&v25 + 1), v26, v27, v28, v29, v30, v31);

  return v22;
}

id _SCROD_LOG()
{
  if (_SCROD_LOG_onceToken != -1)
    dispatch_once(&_SCROD_LOG_onceToken, &__block_literal_global_4);
  return (id)_SCROD_LOG_log;
}

id _SCROD_BRAILLE_LOG()
{
  if (_SCROD_BRAILLE_LOG_onceToken != -1)
    dispatch_once(&_SCROD_BRAILLE_LOG_onceToken, &__block_literal_global_3);
  return (id)_SCROD_BRAILLE_LOG_log;
}

uint64_t _systemBuildVersion()
{
  const __CFDictionary *v0;
  const __CFDictionary *v1;
  const void *Value;

  if (!_systemBuildVersion_buildVersion)
  {
    v0 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
    if (v0)
    {
      v1 = v0;
      Value = CFDictionaryGetValue(v0, (const void *)*MEMORY[0x24BDBD1F0]);
      _systemBuildVersion_buildVersion = (uint64_t)Value;
      if (Value)
        CFRetain(Value);
      CFRelease(v1);
    }
  }
  return _systemBuildVersion_buildVersion;
}

void sub_2115EA790()
{
  __break(1u);
}

void sub_2115EA7E8()
{
  objc_end_catch();
  JUMPOUT(0x2115EA7C0);
}

void sub_2115EACA0(_Unwind_Exception *a1)
{
  int v1;

  if (v1)
    objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_2115EACB8(uint64_t a1, int a2)
{
  if (a2)
    objc_terminate();
  JUMPOUT(0x2115EACC4);
}

void sub_2115EAD7C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_2115EADD4(void *a1)
{
  objc_end_catch();
  objc_begin_catch(a1);
  JUMPOUT(0x2115EAD4CLL);
}

void sub_2115EAE90()
{
  __break(1u);
}

void sub_2115EAEE8()
{
  objc_end_catch();
  JUMPOUT(0x2115EAEC0);
}

void _addConnections()
{
  const __CFSet *Copy;
  uint64_t v1;
  void *v2;

  objc_msgSend((id)_Lock_0, "lock");
  Copy = CFSetCreateCopy(0, (CFSetRef)_PendingConnections);
  CFSetRemoveAllValues((CFMutableSetRef)_PendingConnections);
  v1 = objc_msgSend((id)_Lock_0, "unlock");
  if (Copy)
  {
    v2 = (void *)MEMORY[0x212BDDCF0](v1);
    CFSetApplyFunction(Copy, (CFSetApplierFunction)_addConnection, 0);
    objc_autoreleasePoolPop(v2);
    CFRelease(Copy);
  }
}

void _retryHandler()
{
  void *v0;

  v0 = (void *)MEMORY[0x212BDDCF0]();
  +[SCROConnection _configServer](SCROConnection, "_configServer");
  objc_autoreleasePoolPop(v0);
}

void sub_2115EB948()
{
  __break(1u);
}

void sub_2115EB9AC()
{
  objc_end_catch();
  JUMPOUT(0x2115EB980);
}

void _scrodDeathCallback()
{
  void *v0;

  v0 = (void *)MEMORY[0x212BDDCF0]();
  +[SCROConnection _unconfigServerAndRetry:](SCROConnection, "_unconfigServerAndRetry:", 1);
  objc_autoreleasePoolPop(v0);
}

void sub_2115EBA08(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  id v9;

  if (a2 == 1)
  {
    v9 = objc_begin_catch(exception_object);
    NSLog(CFSTR("Caught Exception while processing death callback: %@"));

    objc_end_catch();
    JUMPOUT(0x2115EB9F0);
  }
  _Unwind_Resume(exception_object);
}

void sub_2115EBC3C()
{
  __break(1u);
}

void sub_2115EBC98()
{
  objc_end_catch();
  JUMPOUT(0x2115EBC70);
}

void _invalidateConnection(void *a1)
{
  void *v2;
  id v3;

  v2 = (void *)MEMORY[0x212BDDCF0]();
  v3 = a1;
  objc_msgSend(v3, "_stopConnection");
  CFSetRemoveValue((CFMutableSetRef)_ActiveConnections, v3);
  if (!CFSetGetCount((CFSetRef)_ActiveConnections))
    +[SCROConnection _unconfigServerAndRetry:](SCROConnection, "_unconfigServerAndRetry:", 0);

  objc_autoreleasePoolPop(v2);
}

void sub_2115EC07C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  id v9;

  if (a2 == 1)
  {
    v9 = objc_begin_catch(exception_object);
    NSLog(CFSTR("Caught Exception while shutting down connection to server: %@"));

    objc_end_catch();
    JUMPOUT(0x2115EC064);
  }
  _Unwind_Resume(exception_object);
}

void sub_2115EC540(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_2115ED250(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

uint64_t _SCROXPing(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  v3 = (void *)MEMORY[0x212BDDCF0]();
  objc_msgSend(v2, "_ping");
  objc_autoreleasePoolPop(v3);

  return 0;
}

void sub_2115ED3AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  id v9;

  if (a2 == 1)
  {
    v9 = objc_begin_catch(exception_object);
    NSLog(CFSTR("Caught Exception while processing ping request: %@"));

    objc_end_catch();
    JUMPOUT(0x2115ED384);
  }
  _Unwind_Resume(exception_object);
}

void sub_2115ED478(void *a1)
{
  objc_begin_catch(a1);
  objc_end_catch();
  JUMPOUT(0x2115ED440);
}

void _addConnection(void *a1)
{
  __CFSet *v1;
  id v2;

  v1 = (__CFSet *)_ActiveConnections;
  v2 = a1;
  CFSetSetValue(v1, v2);
  objc_msgSend(v2, "_startConnection");

}

void sub_2115F2778(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_2115F2798(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x2115F2758);
}

void sub_2115F2884(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_2115F28A4(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x2115F2848);
}

BOOL SCROSerializeWrapper(uint64_t a1, uint64_t a2, void *a3, _DWORD *a4, void **a5, _DWORD *a6)
{
  void *v11;
  id v12;
  int v13;
  size_t v14;
  void *v15;
  NSObject *v16;
  _BOOL8 v17;
  int v18;
  void *v19;
  id v21;
  size_t __n;
  size_t v23;
  void *__src;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v23 = 4096;
  __src = mmap(0, 0x1000uLL, 3, 4098, -1, 0);
  v21 = 0;
  __n = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a1, 1, &v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v21;
  if (v11)
  {
    v13 = AXSerializeCFType();
    if (v13)
    {
      v14 = v23;
      if (v23 != 4096)
      {
        v15 = __src;
LABEL_11:
        munmap(v15, v14);
      }
    }
    else
    {
      v18 = __n;
      v19 = __src;
      if (__n <= 0x1000)
      {
        memcpy(a3, __src, __n);
        *a4 = v18;
        v14 = v23;
        v15 = v19;
        goto LABEL_11;
      }
      *a5 = __src;
      *a6 = v23;
    }
    v17 = v13 != 0;
    goto LABEL_13;
  }
  _SCROD_LOG();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v12;
    _os_log_impl(&dword_2115BB000, v16, OS_LOG_TYPE_DEFAULT, "Error archiving data: %@", buf, 0xCu);
  }

  v17 = 1;
LABEL_13:

  return v17;
}

BOOL SCROUnserializeWrapper(uint64_t a1, int a2, uint64_t a3, int a4)
{
  int v4;
  CFTypeRef cf;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  cf = 0;
  if (a2 || a4)
    v4 = AXUnserializeCFType();
  else
    v4 = -25200;
  return v4 != 0;
}

void _deadNameHandler(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  __CFRunLoopTimer *v4;
  __CFRunLoopTimer *v5;
  NSObject *v6;
  CFAbsoluteTime Current;
  int v8;
  __CFRunLoopTimer *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (a1 && *(_DWORD *)(a1 + 20) == 72)
  {
    v1 = *(unsigned int *)(a1 + 32);
    +[SCROServer sharedServer](SCROServer, "sharedServer");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_setClientCount:", +[SCROClient removeClientWithPort:](SCROClient, "removeClientWithPort:", v1));
    _SCROD_LOG();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", objc_msgSend(v2, "_clientCount"));
      v4 = (__CFRunLoopTimer *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_2115BB000, v3, OS_LOG_TYPE_DEFAULT, "Client count: %@", (uint8_t *)&v8, 0xCu);

    }
    if (!objc_msgSend(v2, "_clientCount"))
    {
      v5 = (__CFRunLoopTimer *)objc_msgSend(v2, "_deathTimer");
      _SCROD_LOG();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 138412290;
        v9 = v5;
        _os_log_impl(&dword_2115BB000, v6, OS_LOG_TYPE_DEFAULT, "Death timer firing: %@", (uint8_t *)&v8, 0xCu);
      }

      if (v5)
      {
        Current = CFAbsoluteTimeGetCurrent();
        CFRunLoopTimerSetNextFireDate(v5, Current + 3.0);
      }
    }

  }
}

void sub_2115F3680(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    fwrite("Caught Exception handling dead name.\n", 0x25uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
    objc_end_catch();
    JUMPOUT(0x2115F3650);
  }
  _Unwind_Resume(a1);
}

void _deathTimerHandler()
{
  void *v0;
  NSObject *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  v0 = (void *)MEMORY[0x212BDDCF0]();
  _SCROD_LOG();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2115BB000, v1, OS_LOG_TYPE_DEFAULT, "Posting server timeout", v5, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = kSCROServerTimeoutNotification;
  +[SCROServer sharedServer](SCROServer, "sharedServer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", v3, v4, 0);

  objc_autoreleasePoolPop(v0);
}

uint64_t _SCROXRegisterWithServer(uint64_t a1, int a2, unsigned int *a3, _DWORD *a4, _DWORD *a5, _OWORD *a6)
{
  void *v9;
  void *v10;
  __int128 v11;
  void *v12;
  __CFRunLoopTimer *v13;
  CFAbsoluteTime Current;
  _OWORD v17[2];

  if (a2 == 14)
  {
    v9 = (void *)MEMORY[0x212BDDCF0]();
    +[SCROServer sharedServer](SCROServer, "sharedServer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = a6[1];
    v17[0] = *a6;
    v17[1] = v11;
    +[SCROClient addClientGetIdentifier:token:getPort:](SCROClient, "addClientGetIdentifier:token:getPort:", a4, v17, a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      if (objc_msgSend(v10, "_incrementClientCount") == 1)
      {
        v13 = (__CFRunLoopTimer *)objc_msgSend(v10, "_deathTimer");
        if (v13)
        {
          Current = CFAbsoluteTimeGetCurrent();
          CFRunLoopTimerSetNextFireDate(v13, Current + 630720000.0);
        }
      }
    }
    objc_msgSend(v10, "_registerForNotificationOnDeathPort:", *a3);

    objc_autoreleasePoolPop(v9);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "ERROR: Version mismatch: client = %d, scrod = %d\n", a2, 14);
    *a4 = 0;
    *a3 = 0;
    *a5 = 3;
  }
  return 0;
}

void sub_2115F3DC8(void *a1, int a2)
{
  objc_begin_catch(a1);
  if (a2 == 2)
  {
    fwrite("Caught Exception creating client\n", 0x21uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
    objc_end_catch();
    JUMPOUT(0x2115F3D48);
  }
  JUMPOUT(0x2115F3D4CLL);
}

uint64_t _SCROXSendEvent(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, unsigned int a6, _BYTE *a7, _DWORD *a8, void **a9, _DWORD *a10, _BOOL4 *a11, _OWORD *a12)
{
  _BOOL8 v19;
  id v20;
  __int128 v21;
  _BOOL8 v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v27;
  _BOOL8 v28;
  _BOOL4 v29;
  void *context;
  void *v31;
  _OWORD v32[2];
  CFTypeRef cf;

  *a11 = 0;
  *a7 = 0;
  *a8 = 0;
  *a9 = 0;
  *a10 = 0;
  if (!(a6 | a4))
    return 0;
  context = (void *)MEMORY[0x212BDDCF0]();
  v31 = (void *)a5;
  cf = 0;
  v19 = SCROUnserializeWrapper(a3, a4, a5, a6);
  if (v19)
  {
    NSLog(CFSTR("Error while deserializing data sent from client: %d"), v19, context);
    v20 = 0;
  }
  else
  {
    v20 = -[SCROEvent initForHandlerType:]([SCROEvent alloc], "initForHandlerType:", a2);
    objc_msgSend(v20, "setMainDictionary:", cf);
    v21 = a12[1];
    v32[0] = *a12;
    v32[1] = v21;
    v22 = +[SCROClient isClientTrustedWithPortToken:](SCROClient, "isClientTrustedWithPortToken:", v32);
    +[SCROServer sharedServer](SCROServer, "sharedServer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "handleEvent:handlerType:trusted:", v20, a2, v22);

    if (!(_DWORD)v25)
    {
      v27 = objc_msgSend(v20, "claimDictionary");
      if (v27)
      {
        v28 = SCROSerializeWrapper(v27, 4096, a7, a8, a9, a10);
        v29 = v28;
        if (v28)
        {
          NSLog(CFSTR("Error while serializing values for sending to back to client: %d"), v28, context);
          *a11 = v29;
        }
      }
      goto LABEL_7;
    }
    NSLog(CFSTR("Error while handling the event: %d"), v25, context);
  }
  *a11 = 1;
LABEL_7:
  if (cf)
    CFRelease(cf);
  if (v31 && a6)
    munmap(v31, a6);

  objc_autoreleasePoolPop(context);
  return 0;
}

uint64_t _SCROXRegisterForCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int *a5, _OWORD *a6)
{
  void *v11;
  __int128 v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  _OWORD v17[2];

  *a5 = 0;
  v11 = (void *)MEMORY[0x212BDDCF0]();
  v12 = a6[1];
  v17[0] = *a6;
  v17[1] = v12;
  v13 = +[SCROClient isClientTrustedWithPortToken:](SCROClient, "isClientTrustedWithPortToken:", v17);
  +[SCROServer sharedServer](SCROServer, "sharedServer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  *a5 = objc_msgSend(v15, "registerCallbackForKey:forClientIdentifier:handlerType:trusted:", a4, a2, a3, v13);

  if (*a5)
    NSLog(CFSTR("Error while handling the event: %d"), *a5);
  else
    +[SCROClient registerCallbackWithKey:forClientIdentifier:](SCROClient, "registerCallbackWithKey:forClientIdentifier:", a4, a2);
  objc_autoreleasePoolPop(v11);
  return 0;
}

uint64_t _SCROXGetCallbacks(uint64_t a1, uint64_t a2, _BYTE *a3, _DWORD *a4, void **a5, _DWORD *a6, _BOOL4 *a7)
{
  void *v13;
  id v14;
  _BOOL8 v15;
  _BOOL4 v16;

  *a7 = 0;
  *a3 = 0;
  *a4 = 0;
  *a5 = 0;
  *a6 = 0;
  v13 = (void *)MEMORY[0x212BDDCF0]();
  v14 = +[SCROClient callbacksForClientIdentifier:](SCROClient, "callbacksForClientIdentifier:", a2);
  if (v14)
  {
    v15 = SCROSerializeWrapper((uint64_t)v14, 4096, a3, a4, a5, a6);
    v16 = v15;
    if (v15)
    {
      NSLog(CFSTR("Error while serializing callbacks for sending to back to client: %d"), v15);
      *a7 = v16;
    }
  }
  objc_autoreleasePoolPop(v13);
  return 0;
}

uint64_t _SCROXSetValueForKey(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, void *a6, unsigned int a7, _BOOL4 *a8, _OWORD *a9)
{
  void *v16;
  _BOOL8 v17;
  _BOOL4 v18;
  __int128 v19;
  _BOOL8 v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _OWORD v25[2];
  CFTypeRef cf;

  *a8 = 0;
  cf = 0;
  v16 = (void *)MEMORY[0x212BDDCF0]();
  v17 = SCROUnserializeWrapper(a4, a5, (uint64_t)a6, a7);
  v18 = v17;
  if (v17)
  {
    NSLog(CFSTR("Error while deserializing data sent from client: %d"), v17);
    *a8 = v18;
  }
  else
  {
    v19 = a9[1];
    v25[0] = *a9;
    v25[1] = v19;
    v20 = +[SCROClient isClientTrustedWithPortToken:](SCROClient, "isClientTrustedWithPortToken:", v25);
    +[SCROServer sharedServer](SCROServer, "sharedServer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "setValue:forKey:handlerType:trusted:", cf, a3, a2, v20);

    if ((_DWORD)v23)
    {
      NSLog(CFSTR("Error while handling set value for key event: %d"), v23);
      *a8 = 1;
    }
  }
  if (cf)
    CFRelease(cf);
  if (a6 && a7)
    munmap(a6, a7);
  objc_autoreleasePoolPop(v16);
  return 0;
}

void sub_2115F4448(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

uint64_t _SCROXGetValueForKey(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, _DWORD *a5, void **a6, _DWORD *a7, _BOOL4 *a8, _OWORD *a9)
{
  __int128 v15;
  _BOOL8 v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  _BOOL8 v22;
  _BOOL4 v23;
  void *context;
  id v26;
  _OWORD v27[2];

  *a8 = 0;
  *a4 = 0;
  *a5 = 0;
  *a6 = 0;
  *a7 = 0;
  context = (void *)MEMORY[0x212BDDCF0]();
  v15 = a9[1];
  v27[0] = *a9;
  v27[1] = v15;
  v16 = +[SCROClient isClientTrustedWithPortToken:](SCROClient, "isClientTrustedWithPortToken:", v27);
  +[SCROServer sharedServer](SCROServer, "sharedServer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v19 = objc_msgSend(v18, "getValue:forKey:handlerType:trusted:", &v26, a3, a2, v16);
  v20 = v26;

  if ((_DWORD)v19)
  {
    NSLog(CFSTR("Error while getting value from handler for sending to back to client: %d"), v19);
    *a8 = 1;
  }
  else if (v20)
  {
    v22 = SCROSerializeWrapper((uint64_t)v20, 4096, a4, a5, a6, a7);
    v23 = v22;
    if (v22)
    {
      NSLog(CFSTR("Error while serializing value for sending to back to client: %d"), v22);
      *a8 = v23;
    }
  }
  objc_autoreleasePoolPop(context);

  return 0;
}

uint64_t _SCROXGetValueForKeyWithObject(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, int a7, _BYTE *a8, _DWORD *a9, void **a10, _DWORD *a11, _BOOL4 *a12, _OWORD *a13)
{
  _BOOL8 v19;
  _BOOL4 v20;
  id v21;
  __int128 v22;
  _BOOL8 v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _BOOL8 v27;
  void *context;
  unsigned int v31;
  void *v32;
  id v33;
  _OWORD v34[2];
  CFTypeRef cf;

  *a12 = 0;
  *a8 = 0;
  *a9 = 0;
  *a10 = 0;
  *a11 = 0;
  cf = 0;
  context = (void *)MEMORY[0x212BDDCF0]();
  v32 = (void *)a6;
  v31 = a7;
  v19 = SCROUnserializeWrapper(a4, a5, a6, a7);
  v20 = v19;
  if (v19)
  {
    NSLog(CFSTR("Error while deserializing data sent from client as an object argument: %d"), v19);
    v21 = 0;
LABEL_3:
    *a12 = v20;
    goto LABEL_9;
  }
  v22 = a13[1];
  v34[0] = *a13;
  v34[1] = v22;
  v23 = +[SCROClient isClientTrustedWithPortToken:](SCROClient, "isClientTrustedWithPortToken:", v34);
  +[SCROServer sharedServer](SCROServer, "sharedServer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "delegate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  v26 = objc_msgSend(v25, "getValue:forKey:withObject:handlerType:trusted:", &v33, a3, cf, a2, v23);
  v21 = v33;

  if ((_DWORD)v26)
  {
    NSLog(CFSTR("Error while getting value from handler for sending to back to client: %d"), v26);
    *a12 = 1;
  }
  else if (v21)
  {
    v27 = SCROSerializeWrapper((uint64_t)v21, 4096, a8, a9, a10, a11);
    v20 = v27;
    if (v27)
    {
      NSLog(CFSTR("Error while serializing value for sending to back to client: %d"), v27);
      goto LABEL_3;
    }
  }
LABEL_9:
  if (cf)
    CFRelease(cf);
  if (v32 && v31)
    munmap(v32, v31);
  objc_autoreleasePoolPop(context);

  return 0;
}

void sub_2115F4840(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

uint64_t _SCROXPerformAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int *a5, _OWORD *a6)
{
  void *v10;
  __int128 v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  _OWORD v16[2];

  *a5 = 0;
  v10 = (void *)MEMORY[0x212BDDCF0]();
  v11 = a6[1];
  v16[0] = *a6;
  v16[1] = v11;
  v12 = +[SCROClient isClientTrustedWithPortToken:](SCROClient, "isClientTrustedWithPortToken:", v16);
  +[SCROServer sharedServer](SCROServer, "sharedServer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  *a5 = objc_msgSend(v14, "performActionForKey:handlerType:trusted:", a4, a3, v12);

  if (*a5)
    NSLog(CFSTR("Error while performing action: %d"), *a5);
  objc_autoreleasePoolPop(v10);
  return 0;
}

size_t OUTLINED_FUNCTION_0_0(const void *a1, size_t a2, uint64_t a3, FILE *a4)
{
  return fwrite(a1, a2, 1uLL, a4);
}

id OUTLINED_FUNCTION_1_0(void *exc_buf)
{
  return objc_begin_catch(exc_buf);
}

void OUTLINED_FUNCTION_3_0()
{
  _DWORD *v0;
  int v1;

  *v0 = v1;
  objc_end_catch();
}

uint64_t _SCRORegisterWithServer(int a1, int a2, _DWORD *a3, _DWORD *a4, _DWORD *a5)
{
  mach_port_name_t reply_port;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v14;
  _BYTE rcv_name[32];
  _DWORD v16[7];

  *(_OWORD *)&rcv_name[16] = 0u;
  memset(v16, 0, sizeof(v16));
  *(_OWORD *)rcv_name = 0u;
  *(_QWORD *)&rcv_name[20] = *MEMORY[0x24BDAC470];
  *(_DWORD *)&rcv_name[28] = a2;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = reply_port;
  v14 = 5395;
  *(_QWORD *)&rcv_name[12] = 0xA604000000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v14);
    reply_port = *(_DWORD *)&rcv_name[8];
  }
  v10 = mach_msg((mach_msg_header_t *)&v14, 3, 0x24u, 0x40u, reply_port, 0, 0);
  v11 = v10;
  if ((v10 - 268435458) <= 0xE && ((1 << (v10 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&rcv_name[8]);
  }
  else
  {
    if (!(_DWORD)v10)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        v11 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 680100)
      {
        if ((v14 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 36)
          {
            v11 = 4294966996;
            if (*(_DWORD *)&rcv_name[28])
            {
              if (*(_DWORD *)&rcv_name[4])
                v11 = 4294966996;
              else
                v11 = *(unsigned int *)&rcv_name[28];
            }
          }
          else
          {
            v11 = 4294966996;
          }
          goto LABEL_27;
        }
        v11 = 4294966996;
        if (*(_DWORD *)&rcv_name[20] == 1
          && *(_DWORD *)rcv_name == 56
          && !*(_DWORD *)&rcv_name[4]
          && HIWORD(v16[0]) << 16 == 0x100000)
        {
          v11 = 0;
          v12 = v16[3];
          *a3 = *(_DWORD *)&rcv_name[24];
          *a4 = v12;
          *a5 = v16[4];
          return v11;
        }
      }
      else
      {
        v11 = 4294966995;
      }
LABEL_27:
      mach_msg_destroy((mach_msg_header_t *)&v14);
      return v11;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&rcv_name[8]);
  }
  if ((v11 - 268435459) <= 1)
  {
    if ((v14 & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x24BDAEC58], *(mach_port_name_t *)&rcv_name[8]);
    goto LABEL_27;
  }
  return v11;
}

uint64_t _SCROSendEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, _DWORD *a9, _QWORD *a10, _DWORD *a11, _DWORD *a12)
{
  mach_port_t v12;
  mach_msg_timeout_t v13;
  unsigned int v14;
  unsigned int v15;
  void *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  void *v20;
  unsigned int v21;
  unsigned int v22;
  mach_msg_timeout_t v23;
  mach_port_t v24;
  uint64_t v25;
  mach_msg_size_t v26;
  mach_port_t reply_port;
  uint64_t v28;
  int v29;
  unsigned int v30;
  char *v31;
  mach_msg_header_t rcv_name;
  int v34;
  uint64_t v35;
  int v36;
  _BYTE v37[24];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
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
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;

  v12 = MEMORY[0x24BDAC7A8](a1, a2, a3);
  v66 = *MEMORY[0x24BDAC8D0];
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  *(_OWORD *)&v37[8] = 0u;
  memset(&rcv_name, 0, sizeof(rcv_name));
  v34 = 1;
  v35 = v17;
  v36 = 16777472;
  *(_QWORD *)v37 = v15;
  *(_QWORD *)&v37[4] = *MEMORY[0x24BDAC470];
  *(_DWORD *)&v37[12] = v18;
  if (v14 <= 0x1000)
  {
    v20 = v16;
    v21 = v15;
    v22 = v14;
    v23 = v13;
    v24 = v12;
    __memcpy_chk();
    *(_DWORD *)&v37[16] = v22;
    v25 = (v22 + 3) & 0xFFFFFFFC;
    v26 = v25 + 64;
    *(_DWORD *)((char *)&rcv_name + v25 + 60) = v21;
    reply_port = mig_get_reply_port();
    rcv_name.msgh_remote_port = v24;
    rcv_name.msgh_local_port = reply_port;
    rcv_name.msgh_bits = -2147478253;
    *(_QWORD *)&rcv_name.msgh_voucher_port = 0xA604100000000;
    if (MEMORY[0x24BDB0418])
    {
      voucher_mach_msg_set(&rcv_name);
      reply_port = rcv_name.msgh_local_port;
    }
    v28 = mach_msg(&rcv_name, 275, v26, 0x1048u, reply_port, v23, 0);
    v19 = v28;
    if ((v28 - 268435458) <= 0xE && ((1 << (v28 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(rcv_name.msgh_local_port);
    }
    else
    {
      if (!(_DWORD)v28)
      {
        if (rcv_name.msgh_id == 71)
        {
          v19 = 4294966988;
        }
        else if (rcv_name.msgh_id == 680101)
        {
          if ((rcv_name.msgh_bits & 0x80000000) != 0)
          {
            v19 = 4294966996;
            if (v34 == 1
              && rcv_name.msgh_size >= 0x40
              && rcv_name.msgh_size <= 0x1040
              && !rcv_name.msgh_remote_port
              && HIBYTE(v36) == 1)
            {
              v29 = *(_DWORD *)&v37[12];
              if (*(_DWORD *)&v37[12] <= 0x1000u && rcv_name.msgh_size - 64 >= *(_DWORD *)&v37[12])
              {
                v30 = (*(_DWORD *)&v37[12] + 3) & 0xFFFFFFFC;
                if (rcv_name.msgh_size == v30 + 64)
                {
                  v31 = (char *)&rcv_name + v30 - 4096;
                  if (*(_DWORD *)v37 == *((_DWORD *)v31 + 1038))
                  {
                    memcpy(v20, &v37[16], *(unsigned int *)&v37[12]);
                    v19 = 0;
                    *a9 = v29;
                    *a10 = v35;
                    *a11 = *((_DWORD *)v31 + 1038);
                    *a12 = *((_DWORD *)v31 + 1039);
                    return v19;
                  }
                }
              }
            }
          }
          else if (rcv_name.msgh_size == 36)
          {
            v19 = 4294966996;
            if (HIDWORD(v35))
            {
              if (rcv_name.msgh_remote_port)
                v19 = 4294966996;
              else
                v19 = HIDWORD(v35);
            }
          }
          else
          {
            v19 = 4294966996;
          }
        }
        else
        {
          v19 = 4294966995;
        }
        goto LABEL_34;
      }
      mig_dealloc_reply_port(rcv_name.msgh_local_port);
    }
    if ((v19 - 268435459) > 1)
      return v19;
    if ((rcv_name.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x24BDAEC58], rcv_name.msgh_local_port);
LABEL_34:
    mach_msg_destroy(&rcv_name);
    return v19;
  }
  return 4294966989;
}

uint64_t _SCRORegisterForCallback(int a1, mach_msg_timeout_t a2, int a3, int a4, int a5, _DWORD *a6)
{
  mach_port_name_t reply_port;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  int v14;
  _BYTE rcv_name[44];

  memset(&rcv_name[16], 0, 28);
  *(_OWORD *)rcv_name = 0u;
  *(_QWORD *)&rcv_name[20] = *MEMORY[0x24BDAC470];
  *(_DWORD *)&rcv_name[28] = a3;
  *(_DWORD *)&rcv_name[32] = a4;
  *(_DWORD *)&rcv_name[36] = a5;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = reply_port;
  v14 = 5395;
  *(_QWORD *)&rcv_name[12] = 0xA604200000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v14);
    reply_port = *(_DWORD *)&rcv_name[8];
  }
  v10 = mach_msg((mach_msg_header_t *)&v14, 275, 0x2Cu, 0x30u, reply_port, a2, 0);
  v11 = v10;
  if ((v10 - 268435458) <= 0xE && ((1 << (v10 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&rcv_name[8]);
  }
  else
  {
    if (!(_DWORD)v10)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        v11 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 680102)
      {
        if ((v14 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 40)
          {
            if (!*(_DWORD *)&rcv_name[4])
            {
              v11 = *(unsigned int *)&rcv_name[28];
              if (!*(_DWORD *)&rcv_name[28])
              {
                *a6 = *(_DWORD *)&rcv_name[32];
                return v11;
              }
              goto LABEL_26;
            }
          }
          else if (*(_DWORD *)rcv_name == 36)
          {
            if (*(_DWORD *)&rcv_name[4])
              v12 = 1;
            else
              v12 = *(_DWORD *)&rcv_name[28] == 0;
            if (v12)
              v11 = 4294966996;
            else
              v11 = *(unsigned int *)&rcv_name[28];
            goto LABEL_26;
          }
        }
        v11 = 4294966996;
      }
      else
      {
        v11 = 4294966995;
      }
LABEL_26:
      mach_msg_destroy((mach_msg_header_t *)&v14);
      return v11;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&rcv_name[8]);
  }
  if ((v11 - 268435459) <= 1)
  {
    if ((v14 & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x24BDAEC58], *(mach_port_name_t *)&rcv_name[8]);
    goto LABEL_26;
  }
  return v11;
}

uint64_t _SCROGetCallbacks(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  _DWORD *v4;
  _DWORD *v5;
  _DWORD *v6;
  _DWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _DWORD *v10;
  _DWORD *v11;
  void *v12;
  void *v13;
  mach_msg_timeout_t v14;
  mach_msg_timeout_t v15;
  int v16;
  int v17;
  mach_port_name_t reply_port;
  uint64_t v19;
  uint64_t v20;
  int v21;
  unsigned int v22;
  _BYTE *v23;
  _BYTE *v24;
  int v26;
  _BYTE rcv_name[32];
  __int128 v28;
  size_t __n[2];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
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
  _DWORD v56[7];
  uint64_t v57;

  v3 = MEMORY[0x24BDAC7A8](a1, a2, a3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = v3;
  v57 = *MEMORY[0x24BDAC8D0];
  v55 = 0u;
  memset(v56, 0, sizeof(v56));
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v42 = 0u;
  v41 = 0u;
  v40 = 0u;
  v39 = 0u;
  v38 = 0u;
  v37 = 0u;
  v36 = 0u;
  v35 = 0u;
  v34 = 0u;
  v33 = 0u;
  v32 = 0u;
  v31 = 0u;
  v30 = 0u;
  *(_OWORD *)__n = 0u;
  v28 = 0u;
  *(_OWORD *)&rcv_name[16] = 0u;
  *(_OWORD *)rcv_name = 0u;
  *(_QWORD *)&rcv_name[20] = *MEMORY[0x24BDAC470];
  *(_DWORD *)&rcv_name[28] = v17;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&rcv_name[4] = v16;
  *(_DWORD *)&rcv_name[8] = reply_port;
  v26 = 5395;
  *(_QWORD *)&rcv_name[12] = 0xA604300000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v26);
    reply_port = *(_DWORD *)&rcv_name[8];
  }
  v19 = mach_msg((mach_msg_header_t *)&v26, 275, 0x24u, 0x1048u, reply_port, v15, 0);
  v20 = v19;
  if ((v19 - 268435458) <= 0xE && ((1 << (v19 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&rcv_name[8]);
  }
  else
  {
    if (!(_DWORD)v19)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        v20 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 680103)
      {
        if ((v26 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 36)
          {
            v20 = 4294966996;
            if (*(_DWORD *)&rcv_name[28])
            {
              if (*(_DWORD *)&rcv_name[4])
                v20 = 4294966996;
              else
                v20 = *(unsigned int *)&rcv_name[28];
            }
          }
          else
          {
            v20 = 4294966996;
          }
          goto LABEL_32;
        }
        v20 = 4294966996;
        if (*(_DWORD *)&rcv_name[20] == 1
          && *(_DWORD *)rcv_name >= 0x40u
          && *(_DWORD *)rcv_name <= 0x1040u
          && !*(_DWORD *)&rcv_name[4]
          && BYTE3(v28) == 1)
        {
          v21 = __n[0];
          if (LODWORD(__n[0]) <= 0x1000 && (*(_DWORD *)rcv_name - 64) >= LODWORD(__n[0]))
          {
            v22 = (LODWORD(__n[0]) + 3) & 0xFFFFFFFC;
            if (*(_DWORD *)rcv_name == v22 + 64)
            {
              v23 = &rcv_name[v22 - 4];
              if (DWORD1(v28) == *((_DWORD *)v23 + 14))
              {
                v24 = v23 - 4096;
                memcpy(v13, (char *)__n + 4, LODWORD(__n[0]));
                v20 = 0;
                *v11 = v21;
                *v9 = *(_QWORD *)&rcv_name[24];
                *v7 = *((_DWORD *)v24 + 1038);
                *v5 = *((_DWORD *)v24 + 1039);
                return v20;
              }
            }
          }
        }
      }
      else
      {
        v20 = 4294966995;
      }
LABEL_32:
      mach_msg_destroy((mach_msg_header_t *)&v26);
      return v20;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&rcv_name[8]);
  }
  if ((v20 - 268435459) <= 1)
  {
    if ((v26 & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x24BDAEC58], *(mach_port_name_t *)&rcv_name[8]);
    goto LABEL_32;
  }
  return v20;
}

uint64_t _SCROSetValueForKey(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int *a9)
{
  mach_port_t v9;
  mach_msg_timeout_t v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;
  mach_msg_timeout_t v19;
  mach_port_t v20;
  uint64_t v21;
  mach_msg_size_t v22;
  mach_port_t reply_port;
  uint64_t v24;
  BOOL v25;
  mach_msg_header_t rcv_name;
  int v28;
  uint64_t v29;
  int v30;
  _BYTE v31[24];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
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
  uint64_t v60;

  v9 = MEMORY[0x24BDAC7A8](a1, a2, a3);
  v60 = *MEMORY[0x24BDAC8D0];
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  *(_OWORD *)&v31[8] = 0u;
  memset(&rcv_name, 0, sizeof(rcv_name));
  v28 = 1;
  v29 = v13;
  v30 = 16777472;
  *(_QWORD *)v31 = v12;
  *(_QWORD *)&v31[4] = *MEMORY[0x24BDAC470];
  *(_DWORD *)&v31[12] = v14;
  *(_DWORD *)&v31[16] = v15;
  if (v11 <= 0x1000)
  {
    v17 = v12;
    v18 = v11;
    v19 = v10;
    v20 = v9;
    __memcpy_chk();
    *(_DWORD *)&v31[20] = v18;
    v21 = (v18 + 3) & 0xFFFFFFFC;
    v22 = v21 + 68;
    *(_DWORD *)((char *)&rcv_name + v21 + 64) = v17;
    reply_port = mig_get_reply_port();
    rcv_name.msgh_remote_port = v20;
    rcv_name.msgh_local_port = reply_port;
    rcv_name.msgh_bits = -2147478253;
    *(_QWORD *)&rcv_name.msgh_voucher_port = 0xA604400000000;
    if (MEMORY[0x24BDB0418])
    {
      voucher_mach_msg_set(&rcv_name);
      reply_port = rcv_name.msgh_local_port;
    }
    v24 = mach_msg(&rcv_name, 275, v22, 0x30u, reply_port, v19, 0);
    v16 = v24;
    if ((v24 - 268435458) <= 0xE && ((1 << (v24 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(rcv_name.msgh_local_port);
    }
    else
    {
      if (!(_DWORD)v24)
      {
        if (rcv_name.msgh_id == 71)
        {
          v16 = 4294966988;
        }
        else if (rcv_name.msgh_id == 680104)
        {
          if ((rcv_name.msgh_bits & 0x80000000) == 0)
          {
            if (rcv_name.msgh_size == 40)
            {
              if (!rcv_name.msgh_remote_port)
              {
                v16 = HIDWORD(v29);
                if (!HIDWORD(v29))
                {
                  *a9 = v30;
                  return v16;
                }
                goto LABEL_28;
              }
            }
            else if (rcv_name.msgh_size == 36)
            {
              if (rcv_name.msgh_remote_port)
                v25 = 1;
              else
                v25 = HIDWORD(v29) == 0;
              if (v25)
                v16 = 4294966996;
              else
                v16 = HIDWORD(v29);
              goto LABEL_28;
            }
          }
          v16 = 4294966996;
        }
        else
        {
          v16 = 4294966995;
        }
LABEL_28:
        mach_msg_destroy(&rcv_name);
        return v16;
      }
      mig_dealloc_reply_port(rcv_name.msgh_local_port);
    }
    if ((v16 - 268435459) > 1)
      return v16;
    if ((rcv_name.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x24BDAEC58], rcv_name.msgh_local_port);
    goto LABEL_28;
  }
  return 4294966989;
}

uint64_t _SCROGetValueForKey(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, _DWORD *a9)
{
  int v9;
  _DWORD *v10;
  _DWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _DWORD *v14;
  _DWORD *v15;
  void *v16;
  void *v17;
  mach_msg_timeout_t v18;
  mach_msg_timeout_t v19;
  int v20;
  int v21;
  int v22;
  mach_port_name_t reply_port;
  uint64_t v24;
  uint64_t v25;
  int v26;
  unsigned int v27;
  _BYTE *v28;
  _BYTE *v29;
  int v31;
  _BYTE rcv_name[32];
  __int128 v33;
  size_t __n[2];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
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
  _DWORD v61[7];
  uint64_t v62;

  v9 = MEMORY[0x24BDAC7A8](a1, a2, a3);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v20 = v9;
  v62 = *MEMORY[0x24BDAC8D0];
  v60 = 0u;
  memset(v61, 0, sizeof(v61));
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v47 = 0u;
  v46 = 0u;
  v45 = 0u;
  v44 = 0u;
  v43 = 0u;
  v42 = 0u;
  v41 = 0u;
  v40 = 0u;
  v39 = 0u;
  v38 = 0u;
  v37 = 0u;
  v36 = 0u;
  v35 = 0u;
  *(_OWORD *)__n = 0u;
  v33 = 0u;
  *(_OWORD *)&rcv_name[16] = 0u;
  *(_OWORD *)rcv_name = 0u;
  *(_QWORD *)&rcv_name[20] = *MEMORY[0x24BDAC470];
  *(_DWORD *)&rcv_name[28] = v21;
  LODWORD(v33) = v22;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&rcv_name[4] = v20;
  *(_DWORD *)&rcv_name[8] = reply_port;
  v31 = 5395;
  *(_QWORD *)&rcv_name[12] = 0xA604500000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v31);
    reply_port = *(_DWORD *)&rcv_name[8];
  }
  v24 = mach_msg((mach_msg_header_t *)&v31, 275, 0x28u, 0x1048u, reply_port, v19, 0);
  v25 = v24;
  if ((v24 - 268435458) <= 0xE && ((1 << (v24 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&rcv_name[8]);
  }
  else
  {
    if (!(_DWORD)v24)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        v25 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 680105)
      {
        if ((v31 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 36)
          {
            v25 = 4294966996;
            if (*(_DWORD *)&rcv_name[28])
            {
              if (*(_DWORD *)&rcv_name[4])
                v25 = 4294966996;
              else
                v25 = *(unsigned int *)&rcv_name[28];
            }
          }
          else
          {
            v25 = 4294966996;
          }
          goto LABEL_32;
        }
        v25 = 4294966996;
        if (*(_DWORD *)&rcv_name[20] == 1
          && *(_DWORD *)rcv_name >= 0x40u
          && *(_DWORD *)rcv_name <= 0x1040u
          && !*(_DWORD *)&rcv_name[4]
          && BYTE3(v33) == 1)
        {
          v26 = __n[0];
          if (LODWORD(__n[0]) <= 0x1000 && (*(_DWORD *)rcv_name - 64) >= LODWORD(__n[0]))
          {
            v27 = (LODWORD(__n[0]) + 3) & 0xFFFFFFFC;
            if (*(_DWORD *)rcv_name == v27 + 64)
            {
              v28 = &rcv_name[v27 - 4];
              if (DWORD1(v33) == *((_DWORD *)v28 + 14))
              {
                v29 = v28 - 4096;
                memcpy(v17, (char *)__n + 4, LODWORD(__n[0]));
                v25 = 0;
                *v15 = v26;
                *v13 = *(_QWORD *)&rcv_name[24];
                *v11 = *((_DWORD *)v29 + 1038);
                *a9 = *((_DWORD *)v29 + 1039);
                return v25;
              }
            }
          }
        }
      }
      else
      {
        v25 = 4294966995;
      }
LABEL_32:
      mach_msg_destroy((mach_msg_header_t *)&v31);
      return v25;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&rcv_name[8]);
  }
  if ((v25 - 268435459) <= 1)
  {
    if ((v31 & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x24BDAEC58], *(mach_port_name_t *)&rcv_name[8]);
    goto LABEL_32;
  }
  return v25;
}

uint64_t _SCROGetValueForKeyWithObject(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, int a6, int a7, int a8, void *__dst, _DWORD *a10, _QWORD *a11, _DWORD *a12, _DWORD *a13)
{
  mach_port_t v13;
  mach_msg_timeout_t v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  unsigned int v21;
  unsigned int v22;
  mach_msg_timeout_t v23;
  mach_port_t v24;
  uint64_t v25;
  mach_msg_size_t v26;
  mach_port_t reply_port;
  uint64_t v28;
  int v29;
  unsigned int v30;
  char *v31;
  mach_msg_header_t rcv_name;
  int v34;
  uint64_t v35;
  int v36;
  _BYTE v37[24];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
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
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;

  v13 = MEMORY[0x24BDAC7A8](a1, a2, a3);
  v66 = *MEMORY[0x24BDAC8D0];
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  *(_OWORD *)&v37[8] = 0u;
  memset(&rcv_name, 0, sizeof(rcv_name));
  v34 = 1;
  v35 = v17;
  v36 = 16777472;
  *(_QWORD *)v37 = v16;
  *(_QWORD *)&v37[4] = *MEMORY[0x24BDAC470];
  *(_DWORD *)&v37[12] = v18;
  *(_DWORD *)&v37[16] = v19;
  if (v15 <= 0x1000)
  {
    v21 = v16;
    v22 = v15;
    v23 = v14;
    v24 = v13;
    __memcpy_chk();
    *(_DWORD *)&v37[20] = v22;
    v25 = (v22 + 3) & 0xFFFFFFFC;
    v26 = v25 + 68;
    *(_DWORD *)((char *)&rcv_name + v25 + 64) = v21;
    reply_port = mig_get_reply_port();
    rcv_name.msgh_remote_port = v24;
    rcv_name.msgh_local_port = reply_port;
    rcv_name.msgh_bits = -2147478253;
    *(_QWORD *)&rcv_name.msgh_voucher_port = 0xA604600000000;
    if (MEMORY[0x24BDB0418])
    {
      voucher_mach_msg_set(&rcv_name);
      reply_port = rcv_name.msgh_local_port;
    }
    v28 = mach_msg(&rcv_name, 275, v26, 0x1048u, reply_port, v23, 0);
    v20 = v28;
    if ((v28 - 268435458) <= 0xE && ((1 << (v28 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(rcv_name.msgh_local_port);
    }
    else
    {
      if (!(_DWORD)v28)
      {
        if (rcv_name.msgh_id == 71)
        {
          v20 = 4294966988;
        }
        else if (rcv_name.msgh_id == 680106)
        {
          if ((rcv_name.msgh_bits & 0x80000000) != 0)
          {
            v20 = 4294966996;
            if (v34 == 1
              && rcv_name.msgh_size >= 0x40
              && rcv_name.msgh_size <= 0x1040
              && !rcv_name.msgh_remote_port
              && HIBYTE(v36) == 1)
            {
              v29 = *(_DWORD *)&v37[12];
              if (*(_DWORD *)&v37[12] <= 0x1000u && rcv_name.msgh_size - 64 >= *(_DWORD *)&v37[12])
              {
                v30 = (*(_DWORD *)&v37[12] + 3) & 0xFFFFFFFC;
                if (rcv_name.msgh_size == v30 + 64)
                {
                  v31 = (char *)&rcv_name + v30 - 4096;
                  if (*(_DWORD *)v37 == *((_DWORD *)v31 + 1038))
                  {
                    memcpy(__dst, &v37[16], *(unsigned int *)&v37[12]);
                    v20 = 0;
                    *a10 = v29;
                    *a11 = v35;
                    *a12 = *((_DWORD *)v31 + 1038);
                    *a13 = *((_DWORD *)v31 + 1039);
                    return v20;
                  }
                }
              }
            }
          }
          else if (rcv_name.msgh_size == 36)
          {
            v20 = 4294966996;
            if (HIDWORD(v35))
            {
              if (rcv_name.msgh_remote_port)
                v20 = 4294966996;
              else
                v20 = HIDWORD(v35);
            }
          }
          else
          {
            v20 = 4294966996;
          }
        }
        else
        {
          v20 = 4294966995;
        }
        goto LABEL_34;
      }
      mig_dealloc_reply_port(rcv_name.msgh_local_port);
    }
    if ((v20 - 268435459) > 1)
      return v20;
    if ((rcv_name.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x24BDAEC58], rcv_name.msgh_local_port);
LABEL_34:
    mach_msg_destroy(&rcv_name);
    return v20;
  }
  return 4294966989;
}

uint64_t _SCROPerformAction(int a1, mach_msg_timeout_t a2, int a3, int a4, int a5, _DWORD *a6)
{
  mach_port_name_t reply_port;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  int v14;
  _BYTE rcv_name[44];

  memset(&rcv_name[16], 0, 28);
  *(_OWORD *)rcv_name = 0u;
  *(_QWORD *)&rcv_name[20] = *MEMORY[0x24BDAC470];
  *(_DWORD *)&rcv_name[28] = a3;
  *(_DWORD *)&rcv_name[32] = a4;
  *(_DWORD *)&rcv_name[36] = a5;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = reply_port;
  v14 = 5395;
  *(_QWORD *)&rcv_name[12] = 0xA604700000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v14);
    reply_port = *(_DWORD *)&rcv_name[8];
  }
  v10 = mach_msg((mach_msg_header_t *)&v14, 275, 0x2Cu, 0x30u, reply_port, a2, 0);
  v11 = v10;
  if ((v10 - 268435458) <= 0xE && ((1 << (v10 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&rcv_name[8]);
  }
  else
  {
    if (!(_DWORD)v10)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        v11 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 680107)
      {
        if ((v14 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 40)
          {
            if (!*(_DWORD *)&rcv_name[4])
            {
              v11 = *(unsigned int *)&rcv_name[28];
              if (!*(_DWORD *)&rcv_name[28])
              {
                *a6 = *(_DWORD *)&rcv_name[32];
                return v11;
              }
              goto LABEL_26;
            }
          }
          else if (*(_DWORD *)rcv_name == 36)
          {
            if (*(_DWORD *)&rcv_name[4])
              v12 = 1;
            else
              v12 = *(_DWORD *)&rcv_name[28] == 0;
            if (v12)
              v11 = 4294966996;
            else
              v11 = *(unsigned int *)&rcv_name[28];
            goto LABEL_26;
          }
        }
        v11 = 4294966996;
      }
      else
      {
        v11 = 4294966995;
      }
LABEL_26:
      mach_msg_destroy((mach_msg_header_t *)&v14);
      return v11;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&rcv_name[8]);
  }
  if ((v11 - 268435459) <= 1)
  {
    if ((v14 & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x24BDAEC58], *(mach_port_name_t *)&rcv_name[8]);
    goto LABEL_26;
  }
  return v11;
}

uint64_t (*SCROClientFunctions_server_routine(uint64_t a1))()
{
  int v1;

  v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 680008) >= 0xFFFFFFF8)
    return _SCROXSCROClientFunctions_subsystem[5 * (v1 - 680000) + 5];
  else
    return 0;
}

uint64_t _XRegisterWithServer(uint64_t result, uint64_t a2)
{
  int v3;
  unsigned int *v4;
  uint64_t v5;
  int v6;
  __int128 v7;
  _OWORD v8[2];

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 36) || *(_DWORD *)(result + 40) <= 0x1Fu)
  {
    v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_8;
  }
  v4 = (unsigned int *)(a2 + 28);
  *(_QWORD *)(a2 + 32) = 0x10000000000000;
  v5 = *(unsigned int *)(result + 12);
  v6 = *(_DWORD *)(result + 32);
  v7 = *(_OWORD *)(result + 72);
  v8[0] = *(_OWORD *)(result + 56);
  v8[1] = v7;
  result = _SCROXRegisterWithServer(v5, v6, v4, (_DWORD *)(a2 + 48), (_DWORD *)(a2 + 52), v8);
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 40) = *MEMORY[0x24BDAC470];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 56;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_8:
  *(_QWORD *)(a2 + 24) = *MEMORY[0x24BDAC470];
  return result;
}

uint64_t _XSendEvent(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  _DWORD *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  unsigned int v14;
  __int128 v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  _OWORD v20[2];
  uint64_t v21;

  if ((*(_DWORD *)result & 0x80000000) == 0)
    goto LABEL_2;
  v3 = -304;
  if (*(_DWORD *)(result + 24) != 1)
    goto LABEL_3;
  v4 = *(unsigned int *)(result + 4);
  if (v4 < 0x40 || v4 > 0x1040)
    goto LABEL_3;
  if (*(_BYTE *)(result + 39) != 1)
    goto LABEL_19;
  v6 = *(_DWORD *)(result + 56);
  if (v6 > 0x1000)
  {
LABEL_2:
    v3 = -304;
LABEL_3:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_4;
  }
  v3 = -304;
  if ((int)v4 - 64 < v6)
    goto LABEL_3;
  v7 = (v6 + 3) & 0xFFFFFFFC;
  if ((_DWORD)v4 != v7 + 64)
    goto LABEL_3;
  if (*(_DWORD *)(result + 40) != *(_DWORD *)(result + v7 + 60))
  {
LABEL_19:
    v3 = -300;
    goto LABEL_3;
  }
  v21 = 0;
  v8 = ((v4 + 3) & 0x1FFFFFFFCLL) + result;
  if (*(_DWORD *)v8 || *(_DWORD *)(v8 + 4) <= 0x1Fu)
  {
    v3 = -309;
    goto LABEL_3;
  }
  *(_DWORD *)(a2 + 52) = 4096;
  v9 = (_DWORD *)(a2 + 52);
  *(_DWORD *)(a2 + 36) = 16777473;
  v10 = *(unsigned int *)(result + 12);
  v11 = *(unsigned int *)(result + 52);
  v12 = *(_DWORD *)(result + 56);
  v13 = *(_QWORD *)(result + 28);
  v14 = *(_DWORD *)(result + 40);
  v15 = *(_OWORD *)(v8 + 36);
  v20[0] = *(_OWORD *)(v8 + 20);
  v20[1] = v15;
  result = _SCROXSendEvent(v10, v11, result + 60, v12, v13, v14, (_BYTE *)(a2 + 56), v9, (void **)(a2 + 28), (_DWORD *)&v21 + 1, (_BOOL4 *)&v21, v20);
  if (!(_DWORD)result)
  {
    v16 = HIDWORD(v21);
    *(_DWORD *)(a2 + 40) = HIDWORD(v21);
    *(_QWORD *)(a2 + 44) = *MEMORY[0x24BDAC470];
    v17 = (*(_DWORD *)(a2 + 52) + 3) & 0xFFFFFFFC;
    *(_DWORD *)(a2 + 4) = v17 + 64;
    v18 = a2 + v17;
    v19 = v21;
    *(_DWORD *)(v18 + 56) = v16;
    *(_DWORD *)(v18 + 60) = v19;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_4:
  *(_QWORD *)(a2 + 24) = *MEMORY[0x24BDAC470];
  return result;
}

uint64_t _XRegisterForCallback(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  _OWORD v10[2];

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 44)
  {
    v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 44) || *(_DWORD *)(result + 48) <= 0x1Fu)
  {
    v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    v4 = *MEMORY[0x24BDAC470];
    goto LABEL_8;
  }
  v5 = *(unsigned int *)(result + 12);
  v6 = *(unsigned int *)(result + 32);
  v7 = *(unsigned int *)(result + 36);
  v8 = *(unsigned int *)(result + 40);
  v9 = *(_OWORD *)(result + 80);
  v10[0] = *(_OWORD *)(result + 64);
  v10[1] = v9;
  result = _SCROXRegisterForCallback(v5, v6, v7, v8, (unsigned int *)(a2 + 36), v10);
  *(_DWORD *)(a2 + 32) = result;
  v4 = *MEMORY[0x24BDAC470];
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_8:
  *(_QWORD *)(a2 + 24) = v4;
  return result;
}

_DWORD *_XGetCallbacks(_DWORD *result, uint64_t a2)
{
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;

  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    v3 = -304;
    goto LABEL_7;
  }
  v8 = 0;
  if (result[9] || result[10] <= 0x1Fu)
  {
    v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_8;
  }
  *(_DWORD *)(a2 + 52) = 4096;
  *(_DWORD *)(a2 + 36) = 16777473;
  result = (_DWORD *)_SCROXGetCallbacks(result[3], result[8], (_BYTE *)(a2 + 56), (_DWORD *)(a2 + 52), (void **)(a2 + 28), (_DWORD *)&v8 + 1, (_BOOL4 *)&v8);
  if (!(_DWORD)result)
  {
    v4 = HIDWORD(v8);
    *(_DWORD *)(a2 + 40) = HIDWORD(v8);
    *(_QWORD *)(a2 + 44) = *MEMORY[0x24BDAC470];
    v5 = (*(_DWORD *)(a2 + 52) + 3) & 0xFFFFFFFC;
    *(_DWORD *)(a2 + 4) = v5 + 64;
    v6 = a2 + v5;
    v7 = v8;
    *(_DWORD *)(v6 + 56) = v4;
    *(_DWORD *)(v6 + 60) = v7;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_8:
  *(_QWORD *)(a2 + 24) = *MEMORY[0x24BDAC470];
  return result;
}

uint64_t _XSetValueForKey(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  _OWORD v16[2];

  if ((*(_DWORD *)result & 0x80000000) == 0)
    goto LABEL_2;
  v3 = -304;
  if (*(_DWORD *)(result + 24) != 1)
    goto LABEL_3;
  v5 = *(unsigned int *)(result + 4);
  if (v5 < 0x44 || v5 > 0x1044)
    goto LABEL_3;
  if (*(_BYTE *)(result + 39) != 1)
    goto LABEL_19;
  v7 = *(_DWORD *)(result + 60);
  if (v7 > 0x1000)
  {
LABEL_2:
    v3 = -304;
LABEL_3:
    *(_DWORD *)(a2 + 32) = v3;
    v4 = *MEMORY[0x24BDAC470];
    goto LABEL_4;
  }
  v3 = -304;
  if ((int)v5 - 68 < v7)
    goto LABEL_3;
  v8 = (v7 + 3) & 0xFFFFFFFC;
  if ((_DWORD)v5 != v8 + 68)
    goto LABEL_3;
  v9 = *(_DWORD *)(result + 40);
  if (v9 != *(_DWORD *)(result + v8 + 64))
  {
LABEL_19:
    v3 = -300;
    goto LABEL_3;
  }
  v10 = ((v5 + 3) & 0x1FFFFFFFCLL) + result;
  if (*(_DWORD *)v10 || *(_DWORD *)(v10 + 4) <= 0x1Fu)
  {
    v3 = -309;
    goto LABEL_3;
  }
  v11 = *(unsigned int *)(result + 12);
  v12 = *(unsigned int *)(result + 52);
  v13 = *(unsigned int *)(result + 56);
  v14 = *(void **)(result + 28);
  v15 = *(_OWORD *)(v10 + 36);
  v16[0] = *(_OWORD *)(v10 + 20);
  v16[1] = v15;
  result = _SCROXSetValueForKey(v11, v12, v13, result + 64, v7, v14, v9, (_BOOL4 *)(a2 + 36), v16);
  *(_DWORD *)(a2 + 32) = result;
  v4 = *MEMORY[0x24BDAC470];
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_4:
  *(_QWORD *)(a2 + 24) = v4;
  return result;
}

uint64_t _XGetValueForKey(uint64_t result, uint64_t a2)
{
  int v3;
  _DWORD *v4;
  void **v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  _OWORD v14[2];
  uint64_t v15;

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 40)
  {
    v3 = -304;
    goto LABEL_7;
  }
  v15 = 0;
  if (*(_DWORD *)(result + 40) || *(_DWORD *)(result + 44) <= 0x1Fu)
  {
    v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_8;
  }
  *(_DWORD *)(a2 + 52) = 4096;
  v4 = (_DWORD *)(a2 + 52);
  v5 = (void **)(a2 + 28);
  *(_DWORD *)(a2 + 36) = 16777473;
  v6 = *(unsigned int *)(result + 12);
  v7 = *(unsigned int *)(result + 32);
  v8 = *(unsigned int *)(result + 36);
  v9 = *(_OWORD *)(result + 76);
  v14[0] = *(_OWORD *)(result + 60);
  v14[1] = v9;
  result = _SCROXGetValueForKey(v6, v7, v8, (_BYTE *)(a2 + 56), v4, v5, (_DWORD *)&v15 + 1, (_BOOL4 *)&v15, v14);
  if (!(_DWORD)result)
  {
    v10 = HIDWORD(v15);
    *(_DWORD *)(a2 + 40) = HIDWORD(v15);
    *(_QWORD *)(a2 + 44) = *MEMORY[0x24BDAC470];
    v11 = (*(_DWORD *)(a2 + 52) + 3) & 0xFFFFFFFC;
    *(_DWORD *)(a2 + 4) = v11 + 64;
    v12 = a2 + v11;
    v13 = v15;
    *(_DWORD *)(v12 + 56) = v10;
    *(_DWORD *)(v12 + 60) = v13;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_8:
  *(_QWORD *)(a2 + 24) = *MEMORY[0x24BDAC470];
  return result;
}

uint64_t _XGetValueForKeyWithObject(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int v14;
  __int128 v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  _OWORD v20[2];
  uint64_t v21;

  if ((*(_DWORD *)result & 0x80000000) == 0)
    goto LABEL_2;
  v3 = -304;
  if (*(_DWORD *)(result + 24) != 1)
    goto LABEL_3;
  v4 = *(unsigned int *)(result + 4);
  if (v4 < 0x44 || v4 > 0x1044)
    goto LABEL_3;
  if (*(_BYTE *)(result + 39) != 1)
    goto LABEL_19;
  v6 = *(_DWORD *)(result + 60);
  if (v6 > 0x1000)
  {
LABEL_2:
    v3 = -304;
LABEL_3:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_4;
  }
  v3 = -304;
  if ((int)v4 - 68 < v6)
    goto LABEL_3;
  v7 = (v6 + 3) & 0xFFFFFFFC;
  if ((_DWORD)v4 != v7 + 68)
    goto LABEL_3;
  if (*(_DWORD *)(result + 40) != *(_DWORD *)(result + v7 + 64))
  {
LABEL_19:
    v3 = -300;
    goto LABEL_3;
  }
  v21 = 0;
  v8 = ((v4 + 3) & 0x1FFFFFFFCLL) + result;
  if (*(_DWORD *)v8 || *(_DWORD *)(v8 + 4) <= 0x1Fu)
  {
    v3 = -309;
    goto LABEL_3;
  }
  *(_DWORD *)(a2 + 52) = 4096;
  *(_DWORD *)(a2 + 36) = 16777473;
  v9 = *(unsigned int *)(result + 12);
  v10 = *(_DWORD *)(result + 52);
  v11 = *(unsigned int *)(result + 56);
  v12 = *(_DWORD *)(result + 60);
  v13 = *(_QWORD *)(result + 28);
  v14 = *(_DWORD *)(result + 40);
  v15 = *(_OWORD *)(v8 + 36);
  v20[0] = *(_OWORD *)(v8 + 20);
  v20[1] = v15;
  result = _SCROXGetValueForKeyWithObject(v9, v10, v11, result + 64, v12, v13, v14, (_BYTE *)(a2 + 56), (_DWORD *)(a2 + 52), (void **)(a2 + 28), (_DWORD *)&v21 + 1, (_BOOL4 *)&v21, v20);
  if (!(_DWORD)result)
  {
    v16 = HIDWORD(v21);
    *(_DWORD *)(a2 + 40) = HIDWORD(v21);
    *(_QWORD *)(a2 + 44) = *MEMORY[0x24BDAC470];
    v17 = (*(_DWORD *)(a2 + 52) + 3) & 0xFFFFFFFC;
    *(_DWORD *)(a2 + 4) = v17 + 64;
    v18 = a2 + v17;
    v19 = v21;
    *(_DWORD *)(v18 + 56) = v16;
    *(_DWORD *)(v18 + 60) = v19;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_4:
  *(_QWORD *)(a2 + 24) = *MEMORY[0x24BDAC470];
  return result;
}

uint64_t _XPerformAction(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  _OWORD v10[2];

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 44)
  {
    v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 44) || *(_DWORD *)(result + 48) <= 0x1Fu)
  {
    v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    v4 = *MEMORY[0x24BDAC470];
    goto LABEL_8;
  }
  v5 = *(unsigned int *)(result + 12);
  v6 = *(unsigned int *)(result + 32);
  v7 = *(unsigned int *)(result + 36);
  v8 = *(unsigned int *)(result + 40);
  v9 = *(_OWORD *)(result + 80);
  v10[0] = *(_OWORD *)(result + 64);
  v10[1] = v9;
  result = _SCROXPerformAction(v5, v6, v7, v8, (unsigned int *)(a2 + 36), v10);
  *(_DWORD *)(a2 + 32) = result;
  v4 = *MEMORY[0x24BDAC470];
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_8:
  *(_QWORD *)(a2 + 24) = v4;
  return result;
}

uint64_t SCROClientFunctions_server(_DWORD *a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  void (*v5)(void);
  uint64_t result;

  v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  v4 = a1[5];
  if ((v4 - 680008) >= 0xFFFFFFF8
    && (v5 = (void (*)(void))_SCROXSCROClientFunctions_subsystem[5 * (v4 - 680000) + 5]) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    result = 0;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x24BDAC470];
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

uint64_t _SCROPing(mach_port_t a1, mach_msg_timeout_t timeout)
{
  uint64_t v3;
  mach_msg_header_t msg;

  msg.msgh_size = 0;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(_QWORD *)&msg.msgh_voucher_port = 0xA875000000000;
  if (MEMORY[0x24BDB0418])
    voucher_mach_msg_set(&msg);
  v3 = mach_msg(&msg, 17, 0x18u, 0, 0, timeout, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x24BDAEC58], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v3;
}

uint64_t (*SCROHandlerFunctions_server_routine(uint64_t a1))(uint64_t result, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 20) == 690000)
    return _XPing;
  else
    return 0;
}

uint64_t _XPing(uint64_t result, uint64_t a2)
{
  int v3;

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 24)
  {
    v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 24) || *(_DWORD *)(result + 28) <= 7u)
  {
    v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x24BDAC470];
    return result;
  }
  result = _SCROXPing(*(unsigned int *)(result + 12), *(void **)(result + 76));
  *(_DWORD *)(a2 + 32) = result;
  return result;
}

uint64_t SCROHandlerFunctions_server(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  int v3;
  int v4;
  uint64_t result;

  v2 = *(_DWORD *)(a1 + 8);
  *(_DWORD *)a2 = *(_DWORD *)a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  v3 = *(_DWORD *)(a1 + 20) + 100;
  *(_QWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  if (*(_DWORD *)(a1 + 20) != 690000)
  {
    result = 0;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x24BDAC470];
    *(_DWORD *)(a2 + 32) = -303;
    return result;
  }
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 24)
  {
    v4 = -304;
  }
  else
  {
    if (!*(_DWORD *)(a1 + 24) && *(_DWORD *)(a1 + 28) > 7u)
    {
      *(_DWORD *)(a2 + 32) = _SCROXPing(*(unsigned int *)(a1 + 12), *(void **)(a1 + 76));
      return 1;
    }
    v4 = -309;
  }
  *(_DWORD *)(a2 + 32) = v4;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x24BDAC470];
  return 1;
}

void soft__AXSVoiceOverTouchSetTactileGraphicsDisplay_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void soft__AXSVoiceOverTouchSetTactileGraphicsDisplay(CFStringRef)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SCROBrailleDisplayAutoDetector.m"), 46, CFSTR("%s"), dlerror());

  __break(1u);
}

void libAccessibilityLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *libAccessibilityLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SCROBrailleDisplayAutoDetector.m"), 45, CFSTR("%s"), *a1);

  __break(1u);
}

void libAccessibilityLibrary_cold_1_0(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *libAccessibilityLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SCROBrailleDisplayManager.m"), 23, CFSTR("%s"), *a1);

  __break(1u);
}

void _SCROXRegisterForCallback_cold_1(void *a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_1_0(a1);
  OUTLINED_FUNCTION_0_0("Caught Exception while registering for callback\n", 0x30uLL, v1, (FILE *)*MEMORY[0x24BDAC8D8]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
}

void _SCROXGetCallbacks_cold_1(void *a1)
{
  _DWORD *v1;
  uint64_t v2;

  OUTLINED_FUNCTION_1_0(a1);
  OUTLINED_FUNCTION_0_0("Caught Exception while processing callback fetch\n", 0x31uLL, v2, (FILE *)*MEMORY[0x24BDAC8D8]);
  *v1 = 1;
  objc_end_catch();
}

void _SCROXGetValueForKey_cold_1(void *a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_1_0(a1);
  OUTLINED_FUNCTION_0_0("Caught Exception while getting value for key\n", 0x2DuLL, v1, (FILE *)*MEMORY[0x24BDAC8D8]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
}

void _SCROXPerformAction_cold_1(void *a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_1_0(a1);
  OUTLINED_FUNCTION_0_0("Caught Exception while performing action\n", 0x29uLL, v1, (FILE *)*MEMORY[0x24BDAC8D8]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
}

uint64_t AXSerializeCFType()
{
  return MEMORY[0x24BDFE950]();
}

uint64_t AXUnserializeCFType()
{
  return MEMORY[0x24BDFEA18]();
}

uint64_t BRLTModeForFlags()
{
  return MEMORY[0x24BE0FC20]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x24BDBB838](theArray, range.location, range.length, value);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
  MEMORY[0x24BDBB878](theArray);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x24BDBB880](theArray, idx);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x24BDBB930](arg);
}

uint64_t CFBundleCopyLocalizedStringForLocalization()
{
  return MEMORY[0x24BDBBA70]();
}

uint64_t CFBundleCopyLocalizedStringTableForLocalization()
{
  return MEMORY[0x24BDBBA78]();
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x24BDBBA98](allocator, bundleURL);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDE0](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x24BDBBE00](theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x24BDBBE48](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2D0](rl, timer, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC2F8]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
  MEMORY[0x24BDBC338](rl, mode, block);
}

void CFRunLoopRun(void)
{
  MEMORY[0x24BDBC358]();
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDBC370](allocator, order, context);
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
  MEMORY[0x24BDBC378](source);
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
  MEMORY[0x24BDBC380](source);
}

void CFRunLoopStop(CFRunLoopRef rl)
{
  MEMORY[0x24BDBC388](rl);
}

CFRunLoopTimerRef CFRunLoopTimerCreate(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval, CFOptionFlags flags, CFIndex order, CFRunLoopTimerCallBack callout, CFRunLoopTimerContext *context)
{
  return (CFRunLoopTimerRef)MEMORY[0x24BDBC390](allocator, flags, order, callout, context, fireDate, interval);
}

void CFRunLoopTimerInvalidate(CFRunLoopTimerRef timer)
{
  MEMORY[0x24BDBC3A8](timer);
}

void CFRunLoopTimerSetNextFireDate(CFRunLoopTimerRef timer, CFAbsoluteTime fireDate)
{
  MEMORY[0x24BDBC3B0](timer, fireDate);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x24BDBC3B8](rl);
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
  MEMORY[0x24BDBC3C8](theSet, applier, context);
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x24BDBC3D0](theSet, value);
}

CFSetRef CFSetCreateCopy(CFAllocatorRef allocator, CFSetRef theSet)
{
  return (CFSetRef)MEMORY[0x24BDBC3E0](allocator, theSet);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x24BDBC3E8](allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x24BDBC3F8](theSet);
}

void CFSetRemoveAllValues(CFMutableSetRef theSet)
{
  MEMORY[0x24BDBC420](theSet);
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x24BDBC428](theSet, value);
}

void CFSetSetValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x24BDBC430](theSet, value);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x24BDBC580](alloc, chars, numChars);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x24BDBC5B0](alloc, str, range.location, range.length);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x24BDBC620](theString, range.location, range.length, buffer);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x24BDBC628](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

Boolean CFStringTransform(CFMutableStringRef string, CFRange *range, CFStringRef transform, Boolean reverse)
{
  return MEMORY[0x24BDBC730](string, range, transform, reverse);
}

IOHIDDeviceRef IOHIDDeviceCreate(CFAllocatorRef allocator, io_service_t service)
{
  return (IOHIDDeviceRef)MEMORY[0x24BDD8038](allocator, *(_QWORD *)&service);
}

CFTypeRef IOHIDDeviceGetProperty(IOHIDDeviceRef device, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x24BDD8040](device, key);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x24BDD8680](*(_QWORD *)&bootstrapPort, mainPort);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x24BDD8690](*(_QWORD *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x24BDD8698](notify);
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDD86A8](notify);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x24BDD86B8](*(_QWORD *)&object, className);
}

BOOLean_t IOObjectIsEqualTo(io_object_t object, io_object_t anObject)
{
  return MEMORY[0x24BDD86F0](*(_QWORD *)&object, *(_QWORD *)&anObject);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x24BDD8700](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x24BDD8960](notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x24BDD8990](*(_QWORD *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

uint64_t MSHCreateMIGServerSource()
{
  return MEMORY[0x24BDFEA48]();
}

uint64_t MSHCreateMachServerSource()
{
  return MEMORY[0x24BDFEA50]();
}

uint64_t MSHGetMachPortFromSource()
{
  return MEMORY[0x24BDFEA58]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD0DD8]();
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x24BDD0E08](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x24BDD1258](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t SCRCFormattedString()
{
  return MEMORY[0x24BE843C8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x24BDBCFB0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t archive_error_string()
{
  return MEMORY[0x24BEDA430]();
}

uint64_t archive_read_data_block()
{
  return MEMORY[0x24BEDA460]();
}

uint64_t archive_read_new()
{
  return MEMORY[0x24BEDA4C8]();
}

uint64_t archive_read_next_header()
{
  return MEMORY[0x24BEDA4D0]();
}

uint64_t archive_read_open_filename()
{
  return MEMORY[0x24BEDA4F8]();
}

uint64_t archive_read_support_format_zip()
{
  return MEMORY[0x24BEDA550]();
}

void audit_token_to_au32(audit_token_t *atoken, uid_t *auidp, uid_t *euidp, gid_t *egidp, uid_t *ruidp, gid_t *rgidp, pid_t *pidp, au_asid_t *asidp, au_tid_t *tidp)
{
  MEMORY[0x24BEDA8D8](atoken, auidp, euidp, egidp, ruidp, rgidp, pidp, asidp);
}

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x24BDAD2D8](*(_QWORD *)&bp, service_name, sp);
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x24BDAD2E0](*(_QWORD *)&bp, service_name, sp);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

speed_t cfgetispeed(const termios *a1)
{
  return MEMORY[0x24BDAD948](a1);
}

speed_t cfgetospeed(const termios *a1)
{
  return MEMORY[0x24BDAD950](a1);
}

void cfmakeraw(termios *a1)
{
  MEMORY[0x24BDAD958](a1);
}

int cfsetspeed(termios *a1, speed_t a2)
{
  return MEMORY[0x24BDAD970](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCB8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_handle(dispatch_source_t source)
{
  return MEMORY[0x24BDADF88](source);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x24BDADFD8](source);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x24BDAE008](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x24BDAE8C8](*(_QWORD *)&a1, a2);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x24BDAEB80](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  MEMORY[0x24BDAEB90](a1);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x24BDAEBA0](*(_QWORD *)&task, *(_QWORD *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x24BDAEBB0](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x24BDAEBE8](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&poly, *(_QWORD *)&polyPoly);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x24BDAEBF8](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, *(_QWORD *)&delta);
}

kern_return_t mach_port_request_notification(ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_t notify, mach_msg_type_name_t notifyPoly, mach_port_t *previous)
{
  return MEMORY[0x24BDAEC08](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&msgid, *(_QWORD *)&sync, *(_QWORD *)&notify, *(_QWORD *)&notifyPoly, previous);
}

kern_return_t mach_port_set_attributes(ipc_space_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info, mach_msg_type_number_t port_infoCnt)
{
  return MEMORY[0x24BDAEC10](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&flavor, port_info, *(_QWORD *)&port_infoCnt);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
  MEMORY[0x24BDAEEE0](*(_QWORD *)&reply_port);
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x24BDAEEF8]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
  MEMORY[0x24BDAEF08](*(_QWORD *)&reply_port);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x24BDAEFA8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x24BDAEFF0](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x24BEDD070]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x24BDAF708](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0000](__str, __endptr, *(_QWORD *)&__base);
}

kern_return_t task_get_special_port(task_inspect_t task, int which_port, mach_port_t *special_port)
{
  return MEMORY[0x24BDB0170](*(_QWORD *)&task, *(_QWORD *)&which_port, special_port);
}

int tcdrain(int a1)
{
  return MEMORY[0x24BDB01D0](*(_QWORD *)&a1);
}

int tcgetattr(int a1, termios *a2)
{
  return MEMORY[0x24BDB01E0](*(_QWORD *)&a1, a2);
}

int tcsetattr(int a1, int a2, const termios *a3)
{
  return MEMORY[0x24BDB01E8](*(_QWORD *)&a1, *(_QWORD *)&a2, a3);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x24BDB0418](msg);
}

