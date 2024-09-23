void sub_22827BC40()
{
  ADMetricManager *v0;
  void *v1;

  v0 = objc_alloc_init(ADMetricManager);
  v1 = (void *)qword_253E8E8F8;
  qword_253E8E8F8 = (uint64_t)v0;

}

void sub_22827BCB0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_sharedInstance(MEMORY[0x24BE021D0], a2, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_idForClientType_(v6, v7, 4, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v10, *MEMORY[0x24BE02108], 2, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  APLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v11;
    _os_log_impl(&dword_228279000, v13, OS_LOG_TYPE_DEFAULT, "requestUserTargetingIdentifier %@", (uint8_t *)&v15, 0xCu);
  }

  v14 = *(_QWORD *)(a1 + 32);
  if (v14)
    (*(void (**)(uint64_t, void *, void *))(v14 + 16))(v14, v11, v12);

}

void sub_22827BF08()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)qword_253E8E8E0;
  qword_253E8E8E0 = (uint64_t)v0;

}

id sub_22827CDA8(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6)
{
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;

  objc_msgSend_checkAndUpdateToroID(a1, a2, a3, a4, a5);
  v9 = a1;
  objc_sync_enter(v9);
  objc_msgSend_clickCountData(v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_count(v14, v15, v16, v17, v18);

  objc_msgSend_clickCountData(v9, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_filteredCapData_maxItems_expirationThresholdInSeconds_(v9, v25, (uint64_t)v24, a3, v26, a6);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClickCountData_(v9, v28, (uint64_t)v27, v29, v30);

  objc_msgSend_clickCountData(v9, v31, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend_count(v35, v36, v37, v38, v39);

  if (v40 != v19)
    objc_msgSend_saveCapDataWithReason_(v9, v41, (uint64_t)CFSTR("Landing Click Cleanup"), v43, v44);
  v45 = (void *)MEMORY[0x24BDBCED8];
  objc_msgSend_clickCountData(v9, v41, v42, v43, v44);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_capData_(v9, v47, (uint64_t)v46, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryWithDictionary_(v45, v51, (uint64_t)v50, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v9);
  return v54;
}

void sub_22827CED4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_22827CEF0(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6)
{
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;

  objc_msgSend_checkAndUpdateToroID(a1, a2, a3, a4, a5);
  v9 = a1;
  objc_sync_enter(v9);
  objc_msgSend_frequencyCapData(v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_count(v14, v15, v16, v17, v18);

  objc_msgSend_frequencyCapData(v9, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_filteredCapData_maxItems_expirationThresholdInSeconds_(v9, v25, (uint64_t)v24, a3, v26, a6);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFrequencyCapData_(v9, v28, (uint64_t)v27, v29, v30);

  objc_msgSend_frequencyCapData(v9, v31, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend_count(v35, v36, v37, v38, v39);

  if (v40 != v19)
    objc_msgSend_saveCapDataWithReason_(v9, v41, (uint64_t)CFSTR("Frequency Cap Cleanup"), v43, v44);
  v45 = (void *)MEMORY[0x24BDBCED8];
  objc_msgSend_frequencyCapData(v9, v41, v42, v43, v44);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_capData_(v9, v47, (uint64_t)v46, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryWithDictionary_(v45, v51, (uint64_t)v50, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v9);
  return v54;
}

void sub_22827D01C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22827D738(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22827EED0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22827EEFC(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id WeakRetained;
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(void);
  NSObject *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  id v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  __int16 v34;
  const __CFString *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v7 = *(void **)(a1 + 32);
    if (v7 && objc_msgSend_length(v7, v2, v3, v4, v5))
    {
      v8 = objc_alloc(MEMORY[0x24BE021C8]);
      v12 = (void *)objc_msgSend_initWithIdentifier_(v8, v9, *(_QWORD *)(a1 + 32), v10, v11);
      objc_msgSend_capData(WeakRetained, v13, v14, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addCapDataObject_ofKind_(v17, v18, (uint64_t)v12, *(_QWORD *)(a1 + 56), v19);

      v20 = *(_QWORD *)(a1 + 40);
      if (v20)
      {
        v21 = *(void (**)(void))(v20 + 16);
LABEL_14:
        v21();
        goto LABEL_15;
      }
      goto LABEL_15;
    }
    APLogForCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v32 = 138412290;
      v33 = objc_opt_class();
      _os_log_impl(&dword_228279000, v22, OS_LOG_TYPE_ERROR, "[%@] We received a nil data object.", (uint8_t *)&v32, 0xCu);
    }

    v23 = objc_alloc(MEMORY[0x24BDD1540]);
    v26 = objc_msgSend_initWithAdCode_andDescription_(v23, v24, 16, (uint64_t)CFSTR("We received a nil data object."), v25);
  }
  else
  {
    APLogForCategory();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v32 = 138412546;
      v33 = objc_opt_class();
      v34 = 2112;
      v35 = CFSTR("ERROR: we have lost ourselves");
      _os_log_impl(&dword_228279000, v27, OS_LOG_TYPE_ERROR, "[%@] %@", (uint8_t *)&v32, 0x16u);
    }

    v28 = objc_alloc(MEMORY[0x24BDD1540]);
    v26 = objc_msgSend_initWithAdCode_andDescription_(v28, v29, 16, (uint64_t)CFSTR("ERROR: we have lost ourselves"), v30);
  }
  v12 = (void *)v26;
  v31 = *(_QWORD *)(a1 + 40);
  if (v31)
  {
    v21 = *(void (**)(void))(v31 + 16);
    goto LABEL_14;
  }
LABEL_15:

}

void sub_22827F268(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22827F294(uint64_t a1)
{
  id WeakRetained;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(void);
  NSObject *v26;
  id v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  id v32;
  const char *v33;
  uint64_t v34;
  const __CFString *v35;
  NSObject *v36;
  uint64_t v37;
  int v38;
  const __CFString *v39;
  __int16 v40;
  const __CFString *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (*(_QWORD *)(a1 + 56))
  {
    if (WeakRetained)
    {
      v8 = *(void **)(a1 + 32);
      if (v8 && objc_msgSend_length(v8, v3, v4, v5, v6))
      {
        v9 = objc_alloc(MEMORY[0x24BE021C8]);
        v13 = (void *)objc_msgSend_initWithIdentifier_(v9, v10, *(_QWORD *)(a1 + 32), v11, v12);
        objc_msgSend_setDownloadType_(v13, v14, *(_QWORD *)(a1 + 56), v15, v16);
        objc_msgSend_capData(v7, v17, v18, v19, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addCapDataObject_ofKind_(v21, v22, (uint64_t)v13, 2, v23);

        v24 = *(_QWORD *)(a1 + 40);
        if (v24)
        {
          v25 = *(void (**)(void))(v24 + 16);
LABEL_19:
          v25();
          goto LABEL_20;
        }
        goto LABEL_20;
      }
      APLogForCategory();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v38 = 138412290;
        v39 = (const __CFString *)objc_opt_class();
        _os_log_impl(&dword_228279000, v31, OS_LOG_TYPE_ERROR, "[%@] We received a nil data object.", (uint8_t *)&v38, 0xCu);
      }

      v32 = objc_alloc(MEMORY[0x24BDD1540]);
      v35 = CFSTR("We received a nil data object.");
    }
    else
    {
      APLogForCategory();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v38 = 138412546;
        v39 = (const __CFString *)objc_opt_class();
        v40 = 2112;
        v41 = CFSTR("ERROR: we have lost ourselves");
        _os_log_impl(&dword_228279000, v36, OS_LOG_TYPE_ERROR, "[%@] %@", (uint8_t *)&v38, 0x16u);
      }

      v32 = objc_alloc(MEMORY[0x24BDD1540]);
      v35 = CFSTR("ERROR: we have lost ourselves");
    }
    v30 = objc_msgSend_initWithAdCode_andDescription_(v32, v33, 16, (uint64_t)v35, v34);
  }
  else
  {
    APLogForCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v38 = 138412290;
      v39 = CFSTR("ERROR: We were passed a download type of None");
      _os_log_impl(&dword_228279000, v26, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v38, 0xCu);
    }

    v27 = objc_alloc(MEMORY[0x24BDD1540]);
    v30 = objc_msgSend_initWithAdCode_andDescription_(v27, v28, 15, (uint64_t)CFSTR("ERROR: We were passed a download type of None"), v29);
  }
  v13 = (void *)v30;
  v37 = *(_QWORD *)(a1 + 40);
  if (v37)
  {
    v25 = *(void (**)(void))(v37 + 16);
    goto LABEL_19;
  }
LABEL_20:

}

void sub_228280880(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2282808AC(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id WeakRetained;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  ADResponseData *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  __int16 v57;
  const __CFString *v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    objc_msgSend_error(*(void **)(a1 + 40), v2, v3, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (*(_QWORD *)(a1 + 64))
        v8 = CFSTR("ad tap");
      else
        v8 = CFSTR("frequency cap update");
      v9 = v8;
      APLogForCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = objc_opt_class();
        objc_msgSend_error(*(void **)(a1 + 40), v12, v13, v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = 138412802;
        v56 = v11;
        v57 = 2112;
        v58 = v9;
        v59 = 2112;
        v60 = v16;
        _os_log_impl(&dword_228279000, v10, OS_LOG_TYPE_ERROR, "[%@] We received an error with the %@ : %@", (uint8_t *)&v55, 0x20u);

      }
      v21 = *(_QWORD *)(a1 + 48);
      if (v21)
      {
        objc_msgSend_error(*(void **)(a1 + 40), v17, v18, v19, v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);

      }
    }
    else
    {
      v28 = [ADResponseData alloc];
      objc_msgSend_adResponseInUse(*(void **)(a1 + 40), v29, v30, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (__CFString *)objc_msgSend_initWithDict_(v28, v34, (uint64_t)v33, v35, v36);

      v37 = objc_alloc(MEMORY[0x24BE021C8]);
      objc_msgSend_lineItem(v9, v38, v39, v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (void *)objc_msgSend_initWithIdentifier_(v37, v43, (uint64_t)v42, v44, v45);

      objc_msgSend_capData(*(void **)(a1 + 32), v47, v48, v49, v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addCapDataObject_ofKind_(v51, v52, (uint64_t)v46, *(_QWORD *)(a1 + 64), v53);

      v54 = *(_QWORD *)(a1 + 48);
      if (v54)
        (*(void (**)(uint64_t, _QWORD))(v54 + 16))(v54, 0);

    }
  }
  else
  {
    APLogForCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v55 = 138412546;
      v56 = objc_opt_class();
      v57 = 2112;
      v58 = CFSTR("ERROR: we have lost ourselves");
      _os_log_impl(&dword_228279000, v23, OS_LOG_TYPE_ERROR, "[%@] %@", (uint8_t *)&v55, 0x16u);
    }

    v24 = objc_alloc(MEMORY[0x24BDD1540]);
    v9 = (__CFString *)objc_msgSend_initWithAdCode_andDescription_(v24, v25, 16, (uint64_t)CFSTR("ERROR: we have lost ourselves"), v26);
    v27 = *(_QWORD *)(a1 + 48);
    if (v27)
      (*(void (**)(uint64_t, __CFString *))(v27 + 16))(v27, v9);
  }

}

void sub_228280D30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_228280D5C(uint64_t a1)
{
  id WeakRetained;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(void);
  NSObject *v45;
  id v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  const __CFString *v51;
  __int16 v52;
  const __CFString *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v7 = WeakRetained;
  if (!*(_QWORD *)(a1 + 72))
  {
    APLogForCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v50 = 138412290;
      v51 = CFSTR("ERROR: We were passed a download type of None");
      _os_log_impl(&dword_228279000, v23, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v50, 0xCu);
    }

    v24 = objc_alloc(MEMORY[0x24BDD1540]);
    v27 = objc_msgSend_initWithAdCode_andDescription_(v24, v25, 15, (uint64_t)CFSTR("ERROR: We were passed a download type of None"), v26);
LABEL_17:
    v32 = (void *)v27;
    v49 = *(_QWORD *)(a1 + 56);
    if (v49)
    {
      v44 = *(void (**)(void))(v49 + 16);
      goto LABEL_19;
    }
LABEL_20:

    goto LABEL_21;
  }
  if (!WeakRetained)
  {
    APLogForCategory();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      v50 = 138412546;
      v51 = (const __CFString *)objc_opt_class();
      v52 = 2112;
      v53 = CFSTR("ERROR: we have lost ourselves");
      _os_log_impl(&dword_228279000, v45, OS_LOG_TYPE_ERROR, "[%@] %@", (uint8_t *)&v50, 0x16u);
    }

    v46 = objc_alloc(MEMORY[0x24BDD1540]);
    v27 = objc_msgSend_initWithAdCode_andDescription_(v46, v47, 16, (uint64_t)CFSTR("ERROR: we have lost ourselves"), v48);
    goto LABEL_17;
  }
  v8 = *(void **)(a1 + 40);
  if (!v8
    || (objc_msgSend_error(v8, v3, v4, v5, v6), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    v28 = objc_alloc(MEMORY[0x24BE021C8]);
    v32 = (void *)objc_msgSend_initWithIdentifier_(v28, v29, *(_QWORD *)(a1 + 48), v30, v31);
    objc_msgSend_setDownloadType_(v32, v33, *(_QWORD *)(a1 + 72), v34, v35);
    objc_msgSend_capData(v7, v36, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addCapDataObject_ofKind_(v40, v41, (uint64_t)v32, 2, v42);

    v43 = *(_QWORD *)(a1 + 56);
    if (v43)
    {
      v44 = *(void (**)(void))(v43 + 16);
LABEL_19:
      v44();
      goto LABEL_20;
    }
    goto LABEL_20;
  }
  APLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = objc_opt_class();
    objc_msgSend_error(*(void **)(a1 + 40), v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 138412802;
    v51 = (const __CFString *)v11;
    v52 = 2112;
    v53 = CFSTR("download data update");
    v54 = 2112;
    v55 = v16;
    _os_log_impl(&dword_228279000, v10, OS_LOG_TYPE_ERROR, "[%@] We received an error with the %@ : %@", (uint8_t *)&v50, 0x20u);

  }
  v21 = *(_QWORD *)(a1 + 56);
  if (v21)
  {
    objc_msgSend_error(*(void **)(a1 + 40), v17, v18, v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);

  }
LABEL_21:

}

void sub_228281730(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_frequencyCapUpdated(*(void **)(a1 + 32), a2, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_containsObject_(v6, v7, *(_QWORD *)(a1 + 40), v8, v9);

  if ((v10 & 1) == 0)
  {
    objc_msgSend_activeAdvertisementsByInstanceID(*(void **)(a1 + 32), v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v15, v16, *(_QWORD *)(a1 + 40), v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      if (*(double *)(a1 + 48) < 1.0)
      {
LABEL_8:

        return;
      }
      objc_msgSend_desRecordManager(*(void **)(a1 + 32), v20, v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_adamID(v19, v25, v26, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_updateDESRecord_forEvent_(v24, v30, (uint64_t)v29, 1, v31);

      objc_msgSend_capService(*(void **)(a1 + 32), v32, v33, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_adData(v19, v37, v38, v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_updateFrequencyCapData_completionHandler_(v36, v42, (uint64_t)v41, 0, v43);

      objc_msgSend_frequencyCapUpdated(*(void **)(a1 + 32), v44, v45, v46, v47);
      v48 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v48, v49, *(_QWORD *)(a1 + 40), v50, v51);
    }
    else
    {
      APLogForCategory();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        v52 = *(_QWORD *)(a1 + 40);
        v53 = 138412290;
        v54 = v52;
        _os_log_impl(&dword_228279000, v48, OS_LOG_TYPE_ERROR, "[Ad %@] Error: Tried to send metric visible but the Ad was not found.", (uint8_t *)&v53, 0xCu);
      }
    }

    goto LABEL_8;
  }
}

uint64_t sub_228281A20(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_228281B0C(uint64_t a1)
{
  NSObject *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  ADResponseData *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  NSObject *v84;
  uint64_t v85;
  id v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  _QWORD v90[4];
  id v91;
  uint8_t buf[4];
  uint64_t v93;
  __int16 v94;
  void *v95;
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  APLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend_buttonStateToString_(*(void **)(a1 + 40), v3, *(_QWORD *)(a1 + 56), v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v93 = v6;
    v94 = 2112;
    v95 = v7;
    _os_log_impl(&dword_228279000, v2, OS_LOG_TYPE_DEFAULT, "[Ad %@] Ad is being downloaded with button state %@.", buf, 0x16u);

  }
  objc_msgSend_downloadCapUpdated(*(void **)(a1 + 40), v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_containsObject_(v12, v13, *(_QWORD *)(a1 + 32), v14, v15);

  if (v16)
  {
    v21 = *(_QWORD *)(a1 + 48);
    if (v21)
      (*(void (**)(uint64_t, _QWORD))(v21 + 16))(v21, 0);
  }
  else
  {
    objc_msgSend_activeAdvertisementsByInstanceID(*(void **)(a1 + 40), v17, v18, v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v22, v23, *(_QWORD *)(a1 + 32), v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend_downloadCapUpdated(*(void **)(a1 + 40), v27, v28, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v31, v32, *(_QWORD *)(a1 + 32), v33, v34);

      objc_msgSend_desRecordManager(*(void **)(a1 + 40), v35, v36, v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_adamID(v26, v40, v41, v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_updateDESRecord_forEvent_(v39, v45, (uint64_t)v44, 2, v46);

      v50 = objc_msgSend_buttonStateToDownloadType_(*(void **)(a1 + 40), v47, *(_QWORD *)(a1 + 56), v48, v49);
      v51 = [ADResponseData alloc];
      objc_msgSend_adData(v26, v52, v53, v54, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_adResponseInUse(v56, v57, v58, v59, v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = (void *)objc_msgSend_initWithDict_(v51, v62, (uint64_t)v61, v63, v64);

      objc_msgSend_updateStoreKitAttribution_targetAdvertisement_(*(void **)(a1 + 40), v66, *(_QWORD *)(a1 + 32), (uint64_t)v26, v67);
      objc_msgSend_capService(*(void **)(a1 + 40), v68, v69, v70, v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_adData(v26, v73, v74, v75, v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_lineItem(v65, v78, v79, v80, v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v90[0] = MEMORY[0x24BDAC760];
      v90[1] = 3221225472;
      v90[2] = sub_228281E30;
      v90[3] = &unk_24F0D8DC0;
      v91 = *(id *)(a1 + 48);
      objc_msgSend_updateDownloadData_identifier_forType_completionHandler_(v72, v83, (uint64_t)v77, (uint64_t)v82, v50, v90);

    }
    else
    {
      APLogForCategory();
      v84 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
      {
        v85 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v93 = v85;
        _os_log_impl(&dword_228279000, v84, OS_LOG_TYPE_ERROR, "[Ad %@] Error: Tried to send metric getApp but the Ad was not found.", buf, 0xCu);
      }

      v86 = objc_alloc(MEMORY[0x24BDD1540]);
      v65 = (void *)objc_msgSend_initWithAdCode_andDescription_(v86, v87, 17, (uint64_t)CFSTR("ERROR: Tried to send metric getApp but the Ad was not found."), v88);
      v89 = *(_QWORD *)(a1 + 48);
      if (v89)
        (*(void (**)(uint64_t, void *))(v89 + 16))(v89, v65);
    }

  }
}

uint64_t sub_228281E30(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void sub_228281EE4(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  APLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v19 = 138412290;
    v20 = v3;
    _os_log_impl(&dword_228279000, v2, OS_LOG_TYPE_DEFAULT, "[Ad %@] Ad is tapped.", (uint8_t *)&v19, 0xCu);
  }

  objc_msgSend_activeAdvertisementsByInstanceID(*(void **)(a1 + 40), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v8, v9, *(_QWORD *)(a1 + 32), v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend_updateStoreKitAttribution_targetAdvertisement_(*(void **)(a1 + 40), v13, *(_QWORD *)(a1 + 32), (uint64_t)v12, v14);
    objc_msgSend_updateClickCap_targetAdvertisement_(*(void **)(a1 + 40), v15, *(_QWORD *)(a1 + 32), (uint64_t)v12, v16);
  }
  else
  {
    APLogForCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = *(_QWORD *)(a1 + 32);
      v19 = 138412290;
      v20 = v18;
      _os_log_impl(&dword_228279000, v17, OS_LOG_TYPE_ERROR, "[Ad %@] Error: Tried to send metric interacted but the Ad was not found.", (uint8_t *)&v19, 0xCu);
    }

  }
}

void sub_228282130(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    APLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412546;
      v7 = v5;
      v8 = 2112;
      v9 = v3;
      _os_log_impl(&dword_228279000, v4, OS_LOG_TYPE_ERROR, "[Ad %@] Error: Failed to record StoreKit ad interaction with %@", (uint8_t *)&v6, 0x16u);
    }

  }
}

void sub_22828233C(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    APLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412546;
      v7 = v5;
      v8 = 2112;
      v9 = v3;
      _os_log_impl(&dword_228279000, v4, OS_LOG_TYPE_ERROR, "[Ad %@] Error: Click data update failed with %@", (uint8_t *)&v6, 0x16u);
    }

  }
}

void sub_228282524(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v5 = *(void **)(a1 + 32);
  v10[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], a2, (uint64_t)v10, 1, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deactivateAdvertisementsByInstanceIDs_(v5, v7, (uint64_t)v6, v8, v9);

}

void sub_2282828C4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend_clickCapUpdated(v3, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObject_(v9, v10, (uint64_t)v4, v11, v12);

  objc_msgSend_downloadCapUpdated(*(void **)(a1 + 32), v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObject_(v17, v18, (uint64_t)v4, v19, v20);

  objc_msgSend_frequencyCapUpdated(*(void **)(a1 + 32), v21, v22, v23, v24);
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObject_(v28, v25, (uint64_t)v4, v26, v27);

}

void sub_2282829E4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend_clickCapUpdated(v3, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObject_(v9, v10, (uint64_t)v4, v11, v12);

  objc_msgSend_downloadCapUpdated(*(void **)(a1 + 32), v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObject_(v17, v18, (uint64_t)v4, v19, v20);

  objc_msgSend_frequencyCapUpdated(*(void **)(a1 + 32), v21, v22, v23, v24);
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObject_(v28, v25, (uint64_t)v4, v26, v27);

}

void sub_228282E0C(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  id v64;

  objc_msgSend_sharedInstance(ADSearchAdsSettings, a2, a3, a4, a5);
  v64 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_checkAndUpdateToroID(a1, v6, v7, v8, v9);
  v10 = a1;
  objc_sync_enter(v10);
  objc_msgSend_downloadData(v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_count(v15, v16, v17, v18, v19);

  objc_msgSend_downloadData(v10, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_searchSettings(v64, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend_maxClickCapElements(v30, v31, v32, v33, v34);
  objc_msgSend_searchSettings(v64, v36, v37, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clickExpirationThresholdInSeconds(v40, v41, v42, v43, v44);
  objc_msgSend_filteredCapData_maxItems_expirationThresholdInSeconds_(v10, v45, (uint64_t)v25, v35, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDownloadData_(v10, v48, (uint64_t)v47, v49, v50);

  objc_msgSend_downloadData(v10, v51, v52, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend_count(v55, v56, v57, v58, v59);

  if (v20 != v60)
    objc_msgSend_saveCapDataWithReason_(v10, v61, (uint64_t)CFSTR("Download Data Cleanup"), v62, v63);
  objc_sync_exit(v10);

}

void sub_228282F38(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_228282F50(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;

  objc_msgSend_sharedInstance(ADSearchAdsSettings, a2, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_checkAndUpdateToroID(a1, v7, v8, v9, v10);
  v11 = a1;
  objc_sync_enter(v11);
  objc_msgSend_frequencyCapData(v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_count(v16, v17, v18, v19, v20);

  objc_msgSend_frequencyCapData(v11, v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_searchSettings(v6, v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend_maxFrequencyCapElements(v31, v32, v33, v34, v35);
  objc_msgSend_searchSettings(v6, v37, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_frequencyCapExpirationInSeconds(v41, v42, v43, v44, v45);
  objc_msgSend_filteredCapData_maxItems_expirationThresholdInSeconds_(v11, v46, (uint64_t)v26, v36, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFrequencyCapData_(v11, v49, (uint64_t)v48, v50, v51);

  objc_msgSend_frequencyCapData(v11, v52, v53, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend_count(v56, v57, v58, v59, v60);

  if (v61 != v21)
    objc_msgSend_saveCapDataWithReason_(v11, v62, (uint64_t)CFSTR("Frequency Cap Cleanup"), v64, v65);
  objc_msgSend_frequencyCapData(v11, v62, v63, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_capDataJSON_(v11, v67, (uint64_t)v66, v68, v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v11);
  return v70;
}

void sub_2282830A8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_2282830C0(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;

  objc_msgSend_sharedInstance(ADSearchAdsSettings, a2, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_checkAndUpdateToroID(a1, v7, v8, v9, v10);
  v11 = a1;
  objc_sync_enter(v11);
  objc_msgSend_clickCountData(v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_count(v16, v17, v18, v19, v20);

  objc_msgSend_clickCountData(v11, v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_searchSettings(v6, v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend_maxClickCapElements(v31, v32, v33, v34, v35);
  objc_msgSend_searchSettings(v6, v37, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clickExpirationThresholdInSeconds(v41, v42, v43, v44, v45);
  objc_msgSend_filteredCapData_maxItems_expirationThresholdInSeconds_(v11, v46, (uint64_t)v26, v36, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClickCountData_(v11, v49, (uint64_t)v48, v50, v51);

  objc_msgSend_clickCountData(v11, v52, v53, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend_count(v56, v57, v58, v59, v60);

  if (v61 != v21)
    objc_msgSend_saveCapDataWithReason_(v11, v62, (uint64_t)CFSTR("Toro Click Cleanup"), v64, v65);
  objc_msgSend_clickCountData(v11, v62, v63, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_capDataJSON_(v11, v67, (uint64_t)v66, v68, v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v11);
  return v70;
}

void sub_228283218(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_228283384(uint64_t a1)
{
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend_sharedInputModeController(MEMORY[0x24BEBD6F0], v1, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_normalizedEnabledInputModeIdentifiers(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUserKeyboards_(WeakRetained, v11, (uint64_t)v10, v12, v13);

}

void sub_2282833E8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  _QWORD v48[5];
  id v49;

  objc_msgSend_sharedInstance(MEMORY[0x24BE021D0], a2, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x24BE02190]);
  objc_msgSend_clientSettings(*(void **)(a1 + 32), v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_searchAdsSettingsParams(v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCurrentSettingParams_(v7, v18, (uint64_t)v17, v19, v20);

  objc_msgSend_clientSettings(*(void **)(a1 + 32), v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_searchLandingAdsSettingsParams(v25, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCurrentSearchLandingAdsSettingParams_(v7, v31, (uint64_t)v30, v32, v33);

  objc_msgSend_idForClientType_(v6, v34, 0, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setIAdIDString_(v7, v38, (uint64_t)v37, v39, v40);

  v41 = *(void **)(a1 + 40);
  objc_msgSend_defaultToroServerURL(*(void **)(a1 + 32), v42, v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = MEMORY[0x24BDAC760];
  v48[1] = 3221225472;
  v48[2] = sub_22828353C;
  v48[3] = &unk_24F0D8EE8;
  v48[4] = *(_QWORD *)(a1 + 32);
  v49 = *(id *)(a1 + 48);
  objc_msgSend_handleRequest_serverURL_responseHandler_(v41, v47, (uint64_t)v7, (uint64_t)v46, (uint64_t)v48);

}

void sub_22828353C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  int v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  NSObject *v36;
  uint64_t v37;
  void (*v38)(void);
  NSObject *v39;
  id v40;
  uint64_t v41;
  int v42;
  id v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v7 || v9)
  {
    APLogForCategory();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v42 = 138412546;
      v43 = (id)objc_opt_class();
      v44 = 2112;
      v45 = v10;
      v40 = v43;
      _os_log_impl(&dword_228279000, v39, OS_LOG_TYPE_ERROR, "[%@]: ADClientSettingsRequest failed with error: %@.", (uint8_t *)&v42, 0x16u);

    }
    v41 = *(_QWORD *)(a1 + 40);
    if (v41)
    {
      v38 = *(void (**)(void))(v41 + 16);
      goto LABEL_15;
    }
  }
  else
  {
    v11 = objc_alloc(MEMORY[0x24BE02198]);
    v15 = (void *)objc_msgSend_initWithData_(v11, v12, (uint64_t)v7, v13, v14);
    objc_msgSend_setClientSettings_(*(void **)(a1 + 32), v16, (uint64_t)v15, v17, v18);

    APLogForCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_clientSettings(*(void **)(a1 + 32), v20, v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_AD_jsonString(v24, v25, v26, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 138412290;
      v43 = v29;
      _os_log_impl(&dword_228279000, v19, OS_LOG_TYPE_DEFAULT, "Received response for ADClientSettingsRequest: %@", (uint8_t *)&v42, 0xCu);

    }
    v30 = ADWriteDataToKeychain();
    if (v30)
    {
      v35 = v30;
      APLogForCategory();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v42 = 67109120;
        LODWORD(v43) = v35;
        _os_log_impl(&dword_228279000, v36, OS_LOG_TYPE_ERROR, "Error saving Client Settings to keychain: %d", (uint8_t *)&v42, 8u);
      }

    }
    objc_msgSend_applyClientSettings(*(void **)(a1 + 32), v31, v32, v33, v34);
    v37 = *(_QWORD *)(a1 + 40);
    if (v37)
    {
      v38 = *(void (**)(void))(v37 + 16);
LABEL_15:
      v38();
    }
  }

}

void sub_228283F94(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  objc_msgSend_AD_jsonDictionary(a2, (const char *)a2, a3, a4, a5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v5, v6, (uint64_t)v9, v7, v8);

}

void sub_228283FD8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  objc_msgSend_sharedInstance(ADMetricManager, a2, a3, a4, a5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_activateAdvertisements_(v9, v6, *(_QWORD *)(a1 + 32), v7, v8);

}

void sub_22828426C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  uint8_t *v17;
  NSObject *v18;
  os_log_type_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  __int16 v60;
  uint8_t v61[2];
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  OdmlLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_ident(*(void **)(a1 + 32), v8, v9, v10, v11);
  if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v13 = v12;
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_228279000, v7, OS_SIGNPOST_INTERVAL_END, v13, "App Store Total Reranking", (const char *)&unk_22828C47F, buf, 2u);
    }
  }

  APLogForCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v6)
  {
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    v60 = 0;
    v16 = "Reranking Failure; reporting ODMLSuccess FALSE to Figaro.";
    v17 = (uint8_t *)&v60;
    v18 = v15;
    v19 = OS_LOG_TYPE_ERROR;
  }
  else
  {
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    *(_WORD *)v61 = 0;
    v16 = "Reranking Success; reporting ODMLSuccess TRUE to Figaro.";
    v17 = v61;
    v18 = v15;
    v19 = OS_LOG_TYPE_DEFAULT;
  }
  _os_log_impl(&dword_228279000, v18, v19, v16, v17, 2u);
LABEL_10:

  objc_msgSend_desRecordManager(*(void **)(a1 + 32), v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sharedInstance(ADMetricManager, v25, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDesRecordManager_(v29, v30, (uint64_t)v24, v31, v32);

  objc_msgSend_desRecordManager(*(void **)(a1 + 32), v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_advertisements(*(void **)(a1 + 32), v38, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_organics(*(void **)(a1 + 32), v43, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v47, v48, v49, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_adamID(v52, v53, v54, v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_createRecords_firstOrganicId_error_(v37, v58, (uint64_t)v42, (uint64_t)v57, (uint64_t)v6);

  v59 = *(_QWORD *)(a1 + 40);
  if (v59)
    (*(void (**)(uint64_t, id, id))(v59 + 16))(v59, v5, v6);

}

void sub_2282845F0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  uint8_t *v17;
  NSObject *v18;
  os_log_type_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  __int16 v60;
  uint8_t v61[2];
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  OdmlLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_ident(*(void **)(a1 + 32), v8, v9, v10, v11);
  if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v13 = v12;
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_228279000, v7, OS_SIGNPOST_INTERVAL_END, v13, "App Store Total Reranking", (const char *)&unk_22828C47F, buf, 2u);
    }
  }

  APLogForCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v6)
  {
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    v60 = 0;
    v16 = "Reranking Failure; reporting ODMLSuccess FALSE to Figaro.";
    v17 = (uint8_t *)&v60;
    v18 = v15;
    v19 = OS_LOG_TYPE_ERROR;
  }
  else
  {
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    *(_WORD *)v61 = 0;
    v16 = "Reranking Success; reporting ODMLSuccess TRUE to Figaro.";
    v17 = v61;
    v18 = v15;
    v19 = OS_LOG_TYPE_DEFAULT;
  }
  _os_log_impl(&dword_228279000, v18, v19, v16, v17, 2u);
LABEL_10:

  objc_msgSend_desRecordManager(*(void **)(a1 + 32), v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sharedInstance(ADMetricManager, v25, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDesRecordManager_(v29, v30, (uint64_t)v24, v31, v32);

  objc_msgSend_desRecordManager(*(void **)(a1 + 32), v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_advertisements(*(void **)(a1 + 32), v38, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_organics(*(void **)(a1 + 32), v43, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v47, v48, v49, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_adamID(v52, v53, v54, v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_createRecords_firstOrganicId_error_(v37, v58, (uint64_t)v42, (uint64_t)v57, (uint64_t)v6);

  v59 = *(_QWORD *)(a1 + 40);
  if (v59)
    (*(void (**)(uint64_t, id, BOOL))(v59 + 16))(v59, v5, v6 == 0);

}

void sub_228285378(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6)
{
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  id obj;

  objc_msgSend_checkAndUpdateToroID(a1, a2, a3, a4, a5);
  obj = a1;
  objc_sync_enter(obj);
  objc_msgSend_downloadData(obj, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_count(v13, v14, v15, v16, v17);

  objc_msgSend_downloadData(obj, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_filteredCapData_maxItems_expirationThresholdInSeconds_(obj, v24, (uint64_t)v23, a3, v25, a6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDownloadData_(obj, v27, (uint64_t)v26, v28, v29);

  objc_msgSend_downloadData(obj, v30, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend_count(v34, v35, v36, v37, v38);

  if (v18 != v39)
    objc_msgSend_saveCapDataWithReason_(obj, v40, (uint64_t)CFSTR("Download Data Cleanup"), v41, v42);
  objc_sync_exit(obj);

}

void sub_228285460(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_228285960(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;
  NSObject *v3;
  dispatch_time_t v4;
  NSObject *v5;
  _QWORD block[4];
  _QWORD *v7;
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && !*((_BYTE *)WeakRetained + 16))
  {
    *((_BYTE *)WeakRetained + 16) = 1;
    APLogForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_228279000, v3, OS_LOG_TYPE_DEFAULT, "A notification was received to update to the current user. Waiting 1 second for the DSID to update.", buf, 2u);
    }

    v4 = dispatch_time(0, 1000000000);
    v5 = v2[1];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_228285A58;
    block[3] = &unk_24F0D8F60;
    v7 = v2;
    dispatch_after(v4, v5, block);

  }
}

uint64_t sub_228285A58(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;

  result = objc_msgSend_startUpdatingIDs(*(void **)(a1 + 32), a2, a3, a4, a5);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 0;
  return result;
}

void sub_228285A84(uint64_t a1)
{
  id v2;
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v2 = objc_alloc(MEMORY[0x24BE7A768]);
  v8 = (id)objc_msgSend_initWithPlacementType_assetManagerType_(v2, v3, 0, 0, v4);
  objc_msgSend_setOdmlSettings_(*(void **)(a1 + 32), v5, (uint64_t)v8, v6, v7);

}

void sub_2282866BC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  objc_msgSend_sharedInstance(ADMetricManager, a2, a3, a4, a5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deactivateAllAdvertisements(v9, v5, v6, v7, v8);

}

void sub_2282866F0(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  ADSearchObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  void *v62;
  uint64_t v63;
  const char *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  NSObject *v69;
  const char *v70;
  void *v71;
  const char *v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  double v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  void *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char isRunningTests;
  const char *v109;
  uint8_t v110[8];
  const __CFString *v111;
  void *v112;
  const __CFString *v113;
  void *v114;
  uint64_t v115;
  const __CFString *v116;
  uint64_t v117;
  const __CFString *v118;
  uint64_t v119;
  _QWORD v120[2];

  v120[1] = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = a2;
  v13 = objc_alloc_init(ADSearchObject);
  objc_msgSend_setSponsoredSearchRequestData_(v13, v14, (uint64_t)v12, v15, v16);

  objc_msgSend_setRoutingInfoData_(v13, v17, (uint64_t)v11, v18, v19);
  objc_msgSend_setDeviceRequestID_(v13, v20, (uint64_t)v10, v21, v22);

  objc_msgSend_sharedInstance(MEMORY[0x24BE021D0], v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_idForClientType_(v27, v28, 4, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUserTargetingID_(v13, v32, (uint64_t)v31, v33, v34);

  objc_msgSend_setError_(v13, v35, (uint64_t)v9, v36, v37);
  objc_msgSend_sharedInstance(MEMORY[0x24BE021D0], v38, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_activeDSIDRecord(v42, v43, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_sharedInstance(MEMORY[0x24BE021B8], v48, v49, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isRestrictedRegion(v52, v53, v54, v55, v56))
  {
    APLogForCategory();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v110 = 0;
      _os_log_impl(&dword_228279000, v61, OS_LOG_TYPE_DEFAULT, "This is a no services region. No ad requests allowed to server.", v110, 2u);
    }

    v62 = (void *)MEMORY[0x24BDD1540];
    v63 = *MEMORY[0x24BE02108];
    v119 = *MEMORY[0x24BDD0FC8];
    v120[0] = CFSTR("This is a no services region. No search request to be made.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v64, (uint64_t)v120, (uint64_t)&v119, 1);
    goto LABEL_9;
  }
  if (objc_msgSend_accountIsU13(v47, v57, v58, v59, v60))
  {
    APLogForCategory();
    v69 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v110 = 0;
      _os_log_impl(&dword_228279000, v69, OS_LOG_TYPE_DEFAULT, "This is a U13 user. No ad requests allowed to server.", v110, 2u);
    }

    v62 = (void *)MEMORY[0x24BDD1540];
    v63 = *MEMORY[0x24BE02108];
    v117 = *MEMORY[0x24BDD0FC8];
    v118 = CFSTR("This is a U13 account. No search request to be made.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v70, (uint64_t)&v118, (uint64_t)&v117, 1);
    goto LABEL_9;
  }
  objc_msgSend_userTargetingID(v13, v65, v66, v67, v68);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  if (v77 || (objc_msgSend_error(v13, v78, v79, v80, v81), (v77 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    objc_msgSend_processInfo(MEMORY[0x24BDD1760], v82, v83, v84, v85);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    isRunningTests = objc_msgSend_isRunningTests(v103, v104, v105, v106, v107);

    if ((isRunningTests & 1) == 0)
    {
      v62 = (void *)MEMORY[0x24BDD1540];
      v63 = *MEMORY[0x24BE02108];
      v115 = *MEMORY[0x24BDD0FC8];
      v116 = CFSTR("We were unable to get the 'userTargetingIdentifier'.");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v109, (uint64_t)&v116, (uint64_t)&v115, 1);
LABEL_9:
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v62, v72, v63, 2, (uint64_t)v71);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setError_(v13, v74, (uint64_t)v73, v75, v76);

    }
  }
  v86 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 40);
  v113 = CFSTR("SearchTime");
  objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v87, v88, v89, v90, v86);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = v91;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v92, (uint64_t)&v114, (uint64_t)&v113, 1);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

  if (v86 > 0.5)
  {
    v111 = CFSTR("ResponseTime");
    objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v94, v95, v96, v97, v86);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = v98;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v99, (uint64_t)&v112, (uint64_t)&v111, 1);
    v100 = (void *)objc_claimAutoreleasedReturnValue();

    CreateDiagnosticReport();
  }
  v101 = *(_QWORD *)(a1 + 32);
  if (v101)
  {
    objc_msgSend_error(v13, v94, v95, v96, v97);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, ADSearchObject *, void *))(v101 + 16))(v101, v13, v102);

  }
}

void sub_228286C54(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;

  objc_msgSend_sharedInstance(ADSearchAdsSettings, a2, a3, a4, a5);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sharedInstance(MEMORY[0x24BE02228], v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_class();
  objc_msgSend_defaultToroServerURL(v21, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serverURLForMessageClass_serverURL_(v10, v17, v11, (uint64_t)v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = *(_QWORD *)(a1 + 32);
  if (v20)
    (*(void (**)(uint64_t, void *))(v20 + 16))(v20, v19);

}

void sub_228286E4C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  id v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int isTest;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  NSObject *v71;
  NSObject *v72;
  int v73;
  void *v74;
  __int16 v75;
  void *v76;
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_sponsoredSearchRequestForLanguageLocale_(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 40), a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sharedInstance(MEMORY[0x24BE02228], v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sharedInstance(ADSearchAdsSettings, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc(MEMORY[0x24BE02210]);
  objc_msgSend_sharedInstance(MEMORY[0x24BE021B0], v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend_initWithRoutingType_preferencesStore_(v17, v23, 0, (uint64_t)v22, v24);
  objc_msgSend_payload(v25, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_sharedInstance(MEMORY[0x24BE021D0], v31, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_logIDs_(v35, v36, (uint64_t)CFSTR("ADSponsoredSearchRequest Current IDs:"), v37, v38);

  APLogForCategory();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    v40 = (void *)objc_opt_class();
    v41 = v40;
    objc_msgSend_AD_jsonString(v6, v42, v43, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = 138412546;
    v74 = v40;
    v75 = 2112;
    v76 = v46;
    _os_log_impl(&dword_228279000, v39, OS_LOG_TYPE_DEFAULT, "[%@] Sending an ADSponsoredSearchRequest with Request: %@", (uint8_t *)&v73, 0x16u);

  }
  objc_msgSend_serializeMessage_(v11, v47, (uint64_t)v6, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(v50, v51, 0, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  isTest = objc_msgSend_isTest(v16, v55, v56, v57, v58);
  v64 = *(_QWORD *)(a1 + 48);
  if (isTest)
  {
    if (v64)
    {
      objc_msgSend_properties(v6, v60, v61, v62, v63);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_deviceRequestID(v65, v66, v67, v68, v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, void *, void *, _QWORD))(v64 + 16))(v64, v54, v30, v70, 0);

    }
  }
  else if (v64)
  {
    (*(void (**)(uint64_t, void *, void *, _QWORD, _QWORD))(v64 + 16))(v64, v54, v30, 0, 0);
  }
  APLogForCategory();
  v71 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
  {
    v73 = 138412290;
    v74 = v30;
    _os_log_impl(&dword_228279000, v71, OS_LOG_TYPE_DEFAULT, "ADSponsoredSearchRequest RoutingInfo Blob: %@", (uint8_t *)&v73, 0xCu);
  }

  APLogForCategory();
  v72 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
  {
    v73 = 138412290;
    v74 = v54;
    _os_log_impl(&dword_228279000, v72, OS_LOG_TYPE_DEFAULT, "ADSponsoredSearchRequest SSR Blob:         %@", (uint8_t *)&v73, 0xCu);
  }

}

void sub_228288E54(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;

  v3 = a2;
  objc_msgSend_workQueue(MEMORY[0x24BE02228], v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = sub_228288F04;
  v15[3] = &unk_24F0D8F10;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v16 = v3;
  v17 = v9;
  v18 = v10;
  v11 = v3;
  objc_msgSend_addOperationWithBlock_(v8, v12, (uint64_t)v15, v13, v14);

}

uint64_t sub_228288F04(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  uint64_t result;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  APLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v5 = objc_opt_class();
    v6 = *(_QWORD *)(a1 + 32);
    v12 = 138412546;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    v7 = "[%@] An error was returned by StoreKit: %@";
    v8 = v4;
    v9 = OS_LOG_TYPE_ERROR;
    v10 = 22;
  }
  else
  {
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v12 = 138412290;
    v13 = objc_opt_class();
    v7 = "[%@] Install Attribution Update succeeded";
    v8 = v4;
    v9 = OS_LOG_TYPE_DEFAULT;
    v10 = 12;
  }
  _os_log_impl(&dword_228279000, v8, v9, v7, (uint8_t *)&v12, v10);
LABEL_7:

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

id ADJourneyMetricsHelper.__allocating_init(promotedContentIdentifier:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return ADJourneyMetricsHelper.init(promotedContentIdentifier:)(a1, a2);
}

id ADJourneyMetricsHelper.init(promotedContentIdentifier:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  char *v8;
  void (*v9)(char *, uint64_t);
  objc_class *v10;
  _QWORD v12[2];
  objc_super v13;
  uint64_t v14;
  unint64_t v15;

  v12[1] = a2;
  v3 = sub_22828A1FC();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = &v2[OBJC_IVAR___ADJourneyMetricsHelperInternal_appStoreSource];
  *(_QWORD *)v7 = 3684153;
  *((_QWORD *)v7 + 1) = 0xE300000000000000;
  v14 = 0;
  v15 = 0xE000000000000000;
  v8 = v2;
  sub_22828A2D4();
  swift_bridgeObjectRelease();
  v14 = 0x43676E697373696DLL;
  v15 = 0xEF5F747865746E6FLL;
  sub_22828A1F0();
  sub_22828A1E4();
  v9 = *(void (**)(char *, uint64_t))(v4 + 8);
  v9(v6, v3);
  sub_22828A2B0();
  swift_bridgeObjectRelease();
  sub_22828A1F0();
  sub_22828A1E4();
  v9(v6, v3);
  sub_22828A28C();
  swift_bridgeObjectRetain();
  *(_QWORD *)&v8[OBJC_IVAR___ADJourneyMetricsHelperInternal_helper] = sub_22828A208();

  v10 = (objc_class *)type metadata accessor for ADJourneyMetricsHelper();
  v13.receiver = v8;
  v13.super_class = v10;
  return objc_msgSendSuper2(&v13, sel_init);
}

uint64_t type metadata accessor for ADJourneyMetricsHelper()
{
  return objc_opt_self();
}

uint64_t sub_2282898D8()
{
  return sub_22828A238();
}

uint64_t sub_22828994C()
{
  return sub_22828A250();
}

uint64_t sub_2282899B8()
{
  return sub_22828A280();
}

uint64_t sub_228289A24()
{
  return sub_22828A244();
}

uint64_t sub_228289B18()
{
  return sub_22828A220();
}

uint64_t sub_228289B7C()
{
  return sub_22828A22C();
}

uint64_t sub_228289BF0()
{
  return sub_22828A214();
}

uint64_t sub_228289C54()
{
  return sub_22828A274();
}

uint64_t sub_228289CB8()
{
  return sub_22828A268();
}

uint64_t sub_228289D24()
{
  return sub_22828A25C();
}

void sub_228289E18()
{
  id v0;

  sub_22828A2BC();
  sub_228289EB4();
  v0 = (id)sub_22828A2C8();
  sub_22828A298();

}

unint64_t sub_228289EB4()
{
  unint64_t result;

  result = qword_255973C00;
  if (!qword_255973C00)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255973C00);
  }
  return result;
}

id ADJourneyMetricsHelper.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void ADJourneyMetricsHelper.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ADJourneyMetricsHelper.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ADJourneyMetricsHelper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for ADJourneyMetricsHelper()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ADJourneyMetricsHelper.__allocating_init(promotedContentIdentifier:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of ADJourneyMetricsHelper.placed()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of ADJourneyMetricsHelper.onScreen()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of ADJourneyMetricsHelper.offScreen()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of ADJourneyMetricsHelper.visible(starting:duration:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of ADJourneyMetricsHelper.adMarkerInteracted()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of ADJourneyMetricsHelper.getApp(buttonState:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of ADJourneyMetricsHelper.interacted()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of ADJourneyMetricsHelper.delivered()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of ADJourneyMetricsHelper.completed()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of ADJourneyMetricsHelper.received(adamId:impressionId:adMetadata:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of ADJourneyMetricsHelper.discarded()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t sub_22828A1CC()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_22828A1D8()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_22828A1E4()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_22828A1F0()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_22828A1FC()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_22828A208()
{
  return MEMORY[0x24BE7A6D8]();
}

uint64_t sub_22828A214()
{
  return MEMORY[0x24BE7A6E0]();
}

uint64_t sub_22828A220()
{
  return MEMORY[0x24BE7A6E8]();
}

uint64_t sub_22828A22C()
{
  return MEMORY[0x24BE7A6F0]();
}

uint64_t sub_22828A238()
{
  return MEMORY[0x24BE7A6F8]();
}

uint64_t sub_22828A244()
{
  return MEMORY[0x24BE7A700]();
}

uint64_t sub_22828A250()
{
  return MEMORY[0x24BE7A708]();
}

uint64_t sub_22828A25C()
{
  return MEMORY[0x24BE7A710]();
}

uint64_t sub_22828A268()
{
  return MEMORY[0x24BE7A718]();
}

uint64_t sub_22828A274()
{
  return MEMORY[0x24BE7A720]();
}

uint64_t sub_22828A280()
{
  return MEMORY[0x24BE7A728]();
}

uint64_t sub_22828A28C()
{
  return MEMORY[0x24BE7A730]();
}

uint64_t sub_22828A298()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_22828A2A4()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_22828A2B0()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_22828A2BC()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_22828A2C8()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_22828A2D4()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t ADCopyDataFromKeychain()
{
  return MEMORY[0x24BE020F8]();
}

uint64_t ADWriteDataToKeychain()
{
  return MEMORY[0x24BE02128]();
}

uint64_t APLogForCategory()
{
  return MEMORY[0x24BDFD458]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x24BE1A1B0]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

uint64_t CreateDiagnosticReport()
{
  return MEMORY[0x24BDFD470]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t OdmlLogForCategory()
{
  return MEMORY[0x24BE7A788]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)((uint64_t (*)(id, SEL))MEMORY[0x24BEDD108])(a1, a2);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x24BDAF408](log);
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

