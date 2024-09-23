void sub_2462C6294(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2462C6378(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2462C6494(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2462C6DA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,void *a25)
{
  void *v25;

  _Block_object_dispose(&STACK[0x210], 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2462C6EAC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_2462C6EBC(uint64_t a1)
{

}

void sub_2462C6EC4(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char updated;
  id obj;

  v5 = a2;
  v8 = a3;
  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) && !objc_msgSend_state(v5, v6, v7))
  {
    v12 = (void *)a1[4];
    v13 = a1[5];
    v14 = *(_QWORD *)(a1[7] + 8);
    obj = *(id *)(v14 + 40);
    updated = objc_msgSend_updateBookmark_forSet_error_(v12, v6, (uint64_t)v8, v13, &obj);
    objc_storeStrong((id *)(v14 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = updated;
  }
  else
  {
    objc_msgSend_error(v5, v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1[7] + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
  }

}

void sub_2462C6F9C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t sub_2462C6FB0(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  id v11;
  const char *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  int v21;
  const char *v22;
  uint64_t v23;
  int v24;
  _DWORD *v25;
  void *v26;
  uint64_t v27;
  int v28;
  void *v29;
  void *v30;
  const char *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  id v37;
  id obj;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (!(*(unsigned int (**)(void))(*(_QWORD *)(a1 + 56) + 16))())
  {
    v7 = v3;
    objc_msgSend_sharedItem(v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc(MEMORY[0x24BDD1880]);
    objc_msgSend_prefixedSharedIdentifier_(*(void **)(a1 + 40), v12, (uint64_t)v10);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = objc_msgSend_bytes(v13, v14, v15);
    v18 = (void *)objc_msgSend_initWithUUIDBytes_(v11, v17, v16);

    v21 = objc_msgSend_sharedItemChangeType(v7, v19, v20);
    switch(v21)
    {
      case 0:
        ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
        goto LABEL_13;
      case 1:
        v25 = (_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
        v24 = 1;
        break;
      case 2:
        v24 = 0;
        v25 = (_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
        break;
      default:
        goto LABEL_14;
    }
    ++*v25;
    v26 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    obj = *(id *)(v27 + 40);
    v28 = objc_msgSend_removeItemWithExternalId_error_(v26, v22, (uint64_t)v18, &obj);
    objc_storeStrong((id *)(v27 + 40), obj);
    if (!v28)
      goto LABEL_15;
    if (v24)
    {
LABEL_13:
      v29 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
      objc_msgSend_content(v10, v22, v23);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend__allMetaContent_(*(void **)(a1 + 32), v31, (uint64_t)v7);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = *(_QWORD *)(a1 + 48);
      v34 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
      v37 = *(id *)(v34 + 40);
      LOBYTE(v29) = objc_msgSend_addCascadeSharedItemContent_allMetaContent_sourceIdentifier_externalId_error_(v29, v35, (uint64_t)v30, v32, v33, v18, &v37);
      objc_storeStrong((id *)(v34 + 40), v37);

      if ((v29 & 1) != 0)
        goto LABEL_14;
LABEL_15:
      v6 = 0;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
      goto LABEL_16;
    }
LABEL_14:
    v6 = 1;
LABEL_16:

    goto LABEL_17;
  }
  v4 = qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    *(_DWORD *)buf = 136315394;
    v40 = "-[SEMSkitUpdater indexUpdatesToSets:changeRegistry:shouldDefer:error:]_block_invoke_2";
    v41 = 2112;
    v42 = v5;
    _os_log_impl(&dword_2462C4000, v4, OS_LOG_TYPE_INFO, "%s (%@) Aborting update due to deferral signal", buf, 0x16u);
  }
  v6 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
LABEL_17:

  return v6;
}

void sub_2462C7248(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_2462C75DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2462C7654(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2462C77BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2462C81B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2462C8808(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v4 + 64))
  {
    v5 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(v4 + 16);
      v11 = 136315394;
      v12 = "-[SEMSandbox dealloc]_block_invoke";
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_2462C4000, v5, OS_LOG_TYPE_INFO, "%s Destroying %@", (uint8_t *)&v11, 0x16u);
      v4 = *(_QWORD *)(a1 + 32);
    }
    objc_msgSend_clearAllState(*(void **)(v4 + 40), v6, v7);
    objc_msgSend_remove(*(void **)(*(_QWORD *)(a1 + 32) + 56), v9, v10);
  }
}

_BYTE *sub_2462C8950(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  _BYTE *result;
  int v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v13 = 136315394;
    v14 = "-[SEMSandbox reset]_block_invoke";
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_2462C4000, v2, OS_LOG_TYPE_INFO, "%s Resetting %@", (uint8_t *)&v13, 0x16u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = 0;

  objc_msgSend_clearAllState(*(void **)(*(_QWORD *)(a1 + 32) + 40), v6, v7);
  objc_msgSend_removeAllContents(*(void **)(*(_QWORD *)(a1 + 32) + 56), v8, v9);
  result = *(_BYTE **)(a1 + 32);
  if (result[64])
    return (_BYTE *)objc_msgSend__saveSettings(result, v10, v11);
  return result;
}

void sub_2462C8AA8(uint64_t a1)
{
  uint64_t v1;
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  SEMIndexSiteManager *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  SEMIndexSiteReadAccess *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  int v32;
  const char *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 64))
  {
    v3 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(v1 + 16);
      v32 = 136315394;
      v33 = "-[SEMSandbox save]_block_invoke";
      v34 = 2112;
      v35 = v6;
      _os_log_impl(&dword_2462C4000, v3, OS_LOG_TYPE_INFO, "%s Saving %@", (uint8_t *)&v32, 0x16u);
      v1 = *(_QWORD *)(a1 + 32);
    }
    objc_msgSend__saveSettings((void *)v1, v4, v5);
    objc_msgSend_save(*(void **)(*(_QWORD *)(a1 + 32) + 56), v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(v10 + 48);
      *(_QWORD *)(v10 + 48) = 0;

      objc_msgSend_clearAllState(*(void **)(*(_QWORD *)(a1 + 32) + 40), v12, v13);
      objc_msgSend_remove(*(void **)(*(_QWORD *)(a1 + 32) + 56), v14, v15);
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), v9);
      v16 = [SEMIndexSiteManager alloc];
      objc_msgSend_rootDirectory(*(void **)(*(_QWORD *)(a1 + 32) + 56), v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend_initWithRootDirectoryURL_setEnumerator_settings_(v16, v20, (uint64_t)v19, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
      v22 = *(_QWORD *)(a1 + 32);
      v23 = *(void **)(v22 + 40);
      *(_QWORD *)(v22 + 40) = v21;

      v24 = [SEMIndexSiteReadAccess alloc];
      objc_msgSend_rootDirectory(*(void **)(*(_QWORD *)(a1 + 32) + 56), v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend_initWithRootDirectoryURL_settings_(v24, v28, (uint64_t)v27, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
      v30 = *(_QWORD *)(a1 + 32);
      v31 = *(void **)(v30 + 48);
      *(_QWORD *)(v30 + 48) = v29;

      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) = 1;
    }

  }
}

uint64_t sub_2462C90E4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_2462C90F4(uint64_t a1)
{

}

void sub_2462C90FC(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_rootDirectory(*(void **)(*(_QWORD *)(a1 + 32) + 56), a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

Class sub_2462C9298(uint64_t a1)
{
  Class result;
  void *v3;

  if (!qword_25441F8F0)
  {
    qword_25441F8F0 = _sl_dlopen();
    if (!qword_25441F8F0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CESRRawSpeechProfileConverter");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)abort_report_np();
    free(v3);
  }
  qword_25441F8E8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_2462CB59C()
{
  return 1;
}

void sub_2462CBA60(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  _QWORD *v4;
  const char *v5;
  uint64_t v6;
  _QWORD *v7;
  char v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (!WeakRetained)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 5, 0);
    return;
  }
  v4 = objc_loadWeakRetained(v2);
  v7 = v4;
  if (!*((_BYTE *)v4 + 48))
  {
    v8 = (*(uint64_t (**)(void))(v4[7] + 16))();
    v9 = 0;
    v10 = v9;
    if ((v8 & 1) == 0)
    {
      v11 = qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      {
        v12 = v7[1];
        *(_DWORD *)buf = 136315394;
        v14 = "-[SEMProvisionalResourceManager activateAsyncWithCompletion:]_block_invoke";
        v15 = 2112;
        v16 = v12;
        _os_log_error_impl(&dword_2462C4000, v11, OS_LOG_TYPE_ERROR, "%s Failed to activate resource: %@", buf, 0x16u);
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

      goto LABEL_8;
    }
    *((_BYTE *)v7 + 48) = 1;

  }
  objc_msgSend__setExpirationTimer(v7, v5, v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_8:

}

void sub_2462CBD30(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 48))
  {
    v3 = 3;
LABEL_5:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
    return;
  }
  if (((*(uint64_t (**)(void))(*(_QWORD *)(v2 + 56) + 16))() & 1) != 0)
  {
    v3 = 1;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 1;
    goto LABEL_5;
  }
  v4 = qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = 136315394;
    v7 = "-[SEMProvisionalResourceManager activateWithError:operationBlock:]_block_invoke";
    v8 = 2112;
    v9 = v5;
    _os_log_error_impl(&dword_2462C4000, v4, OS_LOG_TYPE_ERROR, "%s Failed to activate resource: %@", (uint8_t *)&v6, 0x16u);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 5;
}

uint64_t sub_2462CBE50(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_2462CBE5C(uint64_t a1, const char *a2, uint64_t a3)
{
  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
  return objc_msgSend__setExpirationTimer(*(void **)(a1 + 32), a2, a3);
}

void sub_2462CBF08(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  int v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 48))
  {
    v3 = *(_QWORD *)(v2 + 72);
    if (v3)
    {
      v4 = (void *)qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_DEBUG))
      {
        v8 = *(_QWORD *)(v2 + 8);
        v9 = (void *)MEMORY[0x24BDD16E0];
        v10 = v4;
        objc_msgSend_numberWithInteger_(v9, v11, v3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 136315650;
        v15 = "-[SEMProvisionalResourceManager deactivateWithError:]_block_invoke";
        v16 = 2112;
        v17 = v8;
        v18 = 2112;
        v19 = v12;
        _os_log_debug_impl(&dword_2462C4000, v10, OS_LOG_TYPE_DEBUG, "%s Skipping deactivation of resource: %@ with %@ operation(s) in-progress.", (uint8_t *)&v14, 0x20u);

      }
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v6 = 7;
    }
    else
    {
      if (((*(uint64_t (**)(void))(*(_QWORD *)(v2 + 64) + 16))() & 1) != 0)
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 2;
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 0;
        return;
      }
      v7 = qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      {
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v14 = 136315394;
        v15 = "-[SEMProvisionalResourceManager deactivateWithError:]_block_invoke";
        v16 = 2112;
        v17 = v13;
        _os_log_error_impl(&dword_2462C4000, v7, OS_LOG_TYPE_ERROR, "%s Failed to deactivate resource: %@", (uint8_t *)&v14, 0x16u);
      }
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v6 = 6;
    }
  }
  else
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = 4;
  }
  *(_QWORD *)(v5 + 24) = v6;
}

void sub_2462CC188(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  double v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  double v30;
  const char *v31;
  uint64_t v32;
  id v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_expirationDate(*(void **)(a1 + 32), a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_now(MEMORY[0x24BDBCE60], v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_compare_(v4, v8, (uint64_t)v7);

  if (v9 == -1)
  {
    v11 = *(void **)(a1 + 32);
    v33 = 0;
    v12 = objc_msgSend_deactivateWithError_(v11, v10, (uint64_t)&v33);
    v13 = v33;
    if (v12 == 6)
    {
      v26 = (void *)qword_25441F970;
      if (!os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_DEBUG))
      {
LABEL_7:

        return;
      }
      v27 = *(_QWORD *)(a1 + 32);
      v28 = *(_QWORD *)(v27 + 8);
      v29 = (void *)MEMORY[0x24BDD16E0];
      v30 = *(double *)(v27 + 40);
      v19 = v26;
      objc_msgSend_numberWithDouble_(v29, v31, v32, v30);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v35 = "-[SEMProvisionalResourceManager _setExpirationTimer]_block_invoke";
      v36 = 2112;
      v37 = v28;
      v38 = 2112;
      v39 = v22;
      v40 = 2112;
      v41 = v13;
      v23 = "%s Tried to expire resource %@ after %@ seconds of inactivity, but failed due to error: %@";
      v24 = v19;
      v25 = 42;
    }
    else
    {
      if (v12 != 2)
        goto LABEL_7;
      v14 = (void *)qword_25441F970;
      if (!os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_DEBUG))
        goto LABEL_7;
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(_QWORD *)(v15 + 8);
      v17 = (void *)MEMORY[0x24BDD16E0];
      v18 = *(double *)(v15 + 40);
      v19 = v14;
      objc_msgSend_numberWithDouble_(v17, v20, v21, v18);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v35 = "-[SEMProvisionalResourceManager _setExpirationTimer]_block_invoke";
      v36 = 2112;
      v37 = v16;
      v38 = 2112;
      v39 = v22;
      v23 = "%s Expired resource %@ after %@ seconds of inactivity.";
      v24 = v19;
      v25 = 32;
    }
    _os_log_debug_impl(&dword_2462C4000, v24, OS_LOG_TYPE_DEBUG, v23, buf, v25);

    goto LABEL_7;
  }
}

uint64_t sub_2462CC434(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 48);
  return result;
}

void *sub_2462CE00C()
{
  unsigned __int8 v0;

  v0 = atomic_load((unsigned __int8 *)&qword_25441F960);
  if ((v0 & 1) == 0 && __cxa_guard_acquire(&qword_25441F960))
  {
    qword_25441F958 = (uint64_t)os_log_create("com.apple.siri.vocabulary", "semskitbridge");
    __cxa_guard_release(&qword_25441F960);
  }
  return &unk_25756B760;
}

id sub_2462CE41C(void *a1, int a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  const char *v8;
  void *v9;
  void *v10;

  v5 = a1;
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v9 = v7;
  if (v6)
    objc_msgSend_setObject_forKey_(v7, v8, (uint64_t)v6, *MEMORY[0x24BDD0BA0]);
  if (v5)
    objc_msgSend_setObject_forKey_(v9, v8, (uint64_t)v5, *MEMORY[0x24BDD1398]);
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v8, (uint64_t)CFSTR("com.apple.siri.inference.SEMSpanMatcher"), a2, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void sub_2462CF3F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2462CF41C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_2462CF42C(uint64_t a1)
{

}

void sub_2462CF434(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  SEMDatabaseValueRow *v7;
  const char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  id obj;

  v6 = a2;
  v7 = [SEMDatabaseValueRow alloc];
  v9 = (void *)objc_msgSend_initWithDatabaseValueArray_(v7, v8, (uint64_t)v6);

  v10 = a1[4];
  v11 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v11 + 40);
  v12 = (*(uint64_t (**)(void))(v10 + 16))();
  objc_storeStrong((id *)(v11 + 40), obj);
  if ((v12 & 1) == 0)
  {
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
  }

}

uint64_t sub_2462CF580(uint64_t a1, const char *a2, _QWORD *a3, _BYTE *a4)
{
  const char *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend_recordFromDatabaseValueRow_(*(void **)(a1 + 40), a2, (uint64_t)a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v16 = *MEMORY[0x24BDD0BA0];
    v17[0] = CFSTR("Unrecognized database record converted from SQLite value row");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v7, (uint64_t)v17, &v16, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v10, v12, 0x251785690, 15, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (a3 && v13)
      *a3 = objc_retainAutorelease(v13);

    goto LABEL_8;
  }
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) == 0)
  {
LABEL_8:
    v9 = 0;
    *a4 = 1;
    goto LABEL_9;
  }
  v9 = 1;
LABEL_9:

  return v9;
}

uint64_t sub_2462CFAA8(uint64_t a1, const char *a2, _QWORD *a3, _BYTE *a4)
{
  const char *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend_recordFromDatabaseValueRow_(*(void **)(a1 + 40), a2, (uint64_t)a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v16 = *MEMORY[0x24BDD0BA0];
    v17[0] = CFSTR("Unrecognized database record converted from SQLite value row");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v7, (uint64_t)v17, &v16, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v10, v12, 0x251785690, 15, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (a3 && v13)
      *a3 = objc_retainAutorelease(v13);

    goto LABEL_8;
  }
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) == 0)
  {
LABEL_8:
    v9 = 0;
    *a4 = 1;
    goto LABEL_9;
  }
  v9 = 1;
LABEL_9:

  return v9;
}

id sub_2462D01A0(uint64_t a1)
{
  id v2;
  const char *v3;

  v2 = objc_alloc(MEMORY[0x24BDD17C8]);
  return (id)objc_msgSend_initWithData_encoding_(v2, v3, a1, 4);
}

id sub_2462D01D4(void *a1, const char *a2, uint64_t a3)
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_databaseValue_toString(a1, a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_databaseValue_toNumber(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t sub_2462D0210()
{
  return 1;
}

uint64_t sub_2462D0218(id a1, const char *a2, uint64_t *a3)
{
  id v4;
  const char *v5;
  uint64_t v6;

  if (a3)
    *a3 = objc_msgSend_length(a1, a2, (uint64_t)a3);
  v4 = objc_retainAutorelease(a1);
  return objc_msgSend_bytes(v4, v5, v6);
}

uint64_t sub_2462D0250()
{
  return 0;
}

uint64_t sub_2462D0258()
{
  return 0;
}

uint64_t sub_2462D0260()
{
  return 0;
}

uint64_t sub_2462D0268()
{
  return 4;
}

id sub_2462D0278(void *a1, const char *a2, uint64_t a3)
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_databaseValue_toString(a1, a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_databaseValue_toData(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t sub_2462D02B0(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  unsigned int v4;
  void *v6;
  id v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v1 = objc_retainAutorelease(a1);
  v4 = *(char *)objc_msgSend_objCType(v1, v2, v3) - 66;
  if (v4 > 0x31)
    goto LABEL_6;
  if (((1 << v4) & 0x2848200028483) != 0)
    return 3;
  if (((1 << v4) & 0x1400000000) != 0)
    return 2;
LABEL_6:
  v6 = (void *)qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
  {
    v7 = objc_retainAutorelease(v1);
    v8 = v6;
    v11 = 136315650;
    v12 = "-[NSNumber(SEMDatabaseValue) databaseValue_type]";
    v13 = 2112;
    v14 = v1;
    v15 = 2080;
    v16 = objc_msgSend_objCType(v7, v9, v10);
    _os_log_error_impl(&dword_2462C4000, v8, OS_LOG_TYPE_ERROR, "%s %@ (objCType = %s)", (uint8_t *)&v11, 0x20u);

  }
  return 0;
}

id sub_2462D0400(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v4;
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  id v27;
  const char *v28;
  id v29;
  const char *v30;
  __int128 v32;
  int v33;
  __int128 v34;
  int v35;
  uint64_t v36;
  uint64_t v37;

  v4 = objc_msgSend_length(a1, a2, a3);
  v5 = objc_alloc(MEMORY[0x24BDD17A8]);
  v7 = (void *)objc_msgSend_initWithString_(v5, v6, (uint64_t)a1);
  v37 = 0;
  if (objc_msgSend_scanUnsignedLongLong_(v7, v8, (uint64_t)&v37)
    && objc_msgSend_scanLocation(v7, v9, v10) == v4)
  {
    v11 = v37;
    if (v37 != -1)
    {
LABEL_6:
      objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v9, v11);
      v12 = objc_claimAutoreleasedReturnValue();
LABEL_25:
      v20 = (void *)v12;
      goto LABEL_26;
    }
    if (objc_msgSend_isEqualToString_(a1, v9, (uint64_t)CFSTR("18446744073709551615")))
    {
      v11 = v37;
      goto LABEL_6;
    }
LABEL_23:
    v27 = objc_alloc(MEMORY[0x24BDD1518]);
    v12 = objc_msgSend_initWithString_(v27, v28, (uint64_t)a1);
    goto LABEL_25;
  }
  objc_msgSend_setScanLocation_(v7, v9, 0);
  v36 = 0;
  if (objc_msgSend_scanLongLong_(v7, v13, (uint64_t)&v36) && objc_msgSend_scanLocation(v7, v14, v15) == v4)
  {
    v16 = v36;
    if (v36 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ((objc_msgSend_isEqualToString_(a1, v14, (uint64_t)CFSTR("+9223372036854775807")) & 1) == 0)
        goto LABEL_23;
      v16 = v36;
    }
    if (v16 == 0x8000000000000000)
    {
      if (!objc_msgSend_isEqualToString_(a1, v14, (uint64_t)CFSTR("-9223372036854775808")))
        goto LABEL_23;
      v16 = v36;
    }
    objc_msgSend_numberWithLongLong_(MEMORY[0x24BDD16E0], v14, v16);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  objc_msgSend_setScanLocation_(v7, v14, 0);
  v34 = 0uLL;
  v35 = 0;
  v20 = 0;
  if (objc_msgSend_scanDecimal_(v7, v17, (uint64_t)&v34))
  {
    if (objc_msgSend_scanLocation(v7, v18, v19) == v4)
    {
      if ((BYTE1(v34) & 0xC) == 0
        && (objc_msgSend_setScanLocation_(v7, v21, 0),
            *(_QWORD *)&v32 = 0,
            objc_msgSend_scanDouble_(v7, v22, (uint64_t)&v32))
        && objc_msgSend_scanLocation(v7, v23, v24) == v4)
      {
        objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v25, v26, *(double *)&v32);
        v12 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v29 = objc_alloc(MEMORY[0x24BDD1518]);
        v32 = v34;
        v33 = v35;
        v12 = objc_msgSend_initWithDecimal_(v29, v30, (uint64_t)&v32);
      }
      goto LABEL_25;
    }
    v20 = 0;
  }
LABEL_26:

  return v20;
}

uint64_t sub_2462D0610(void *a1, const char *a2)
{
  return objc_msgSend_dataUsingEncoding_(a1, a2, 4);
}

uint64_t sub_2462D0618()
{
  return 5;
}

uint64_t sub_2462D0620(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;

  v1 = objc_retainAutorelease(a1);
  return objc_msgSend_UTF8String(v1, v2, v3);
}

void sub_2462D1DAC(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v3;
  void *v4;

  objc_msgSend__buildKnownIdentifierToUniversalOriginAppIdMap(SEMAppIdMapper, a2, a3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_25441F8F8;
  qword_25441F8F8 = v3;

}

void sub_2462D23EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,char a25,uint64_t a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,int a36,__int16 a37,char a38,char a39)
{
  void *v39;
  void *v40;
  uint64_t v41;

  if (a23 < 0)
    operator delete(__p);
  if (*(char *)(v41 - 121) < 0)
    operator delete(*(void **)(v41 - 144));
  if (*(char *)(v41 - 97) < 0)
    operator delete(*(void **)(v41 - 120));

  _Unwind_Resume(a1);
}

void sub_2462D2538(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2462D2BF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18)
{

  _Unwind_Resume(a1);
}

uint64_t sub_2462D2C84(uint64_t a1)
{
  uint64_t result;

  if (!*(_BYTE *)(a1 + 71))
    __assert_rtn("Finished", "flatbuffers.h", 1319, "finished");
  result = *(_QWORD *)(a1 + 48);
  if (!result)
    __assert_rtn("data", "flatbuffers.h", 1016, "cur_");
  return result;
}

void sub_2462D2FA8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2462D3178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  void *v4;
  va_list va;

  va_start(va, a4);
  sub_2462D3524((uint64_t)va);

  _Unwind_Resume(a1);
}

void sub_2462D3234(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t sub_2462D336C()
{
  return 1;
}

void *sub_2462D3374(_BYTE *__dst, void *__src, unint64_t a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8)
      sub_2462D3400();
    v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17)
      v6 = a3 | 7;
    v7 = v6 + 1;
    v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    *v5 = v8;
    v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }
  return memmove(v5, __src, a3 + 1);
}

void sub_2462D3400()
{
  sub_2462D3414("basic_string");
}

void sub_2462D3414(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_2462D3464(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_25175E4D8, MEMORY[0x24BEDAAF0]);
}

void sub_2462D3450(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_2462D3464(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

void sub_2462D3488()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

void sub_2462D34B0(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t sub_2462D34C0(uint64_t a1, __int128 *a2)
{
  __int128 v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;

  v3 = *a2;
  *(_QWORD *)a2 = 0;
  *((_QWORD *)a2 + 1) = 0;
  v4 = *(std::__shared_weak_count **)(a1 + 8);
  *(_OWORD *)a1 = v3;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  return a1;
}

uint64_t sub_2462D3524(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  return a1;
}

void sub_2462D357C()
{
  sub_2462D3414("vector");
}

uint64_t *sub_2462D3590(uint64_t *result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = *result;
  v2 = result[1];
  v4 = a2[1];
  if (v2 != *result)
  {
    v5 = 0;
    do
    {
      v6 = v4 + v5;
      v7 = v2 + v5;
      *(_WORD *)(v6 - 32) = *(_WORD *)(v2 + v5 - 32);
      *(_QWORD *)(v6 - 16) = 0;
      *(_QWORD *)(v6 - 8) = 0;
      *(_QWORD *)(v6 - 24) = 0;
      *(_OWORD *)(v6 - 24) = *(_OWORD *)(v2 + v5 - 24);
      *(_QWORD *)(v6 - 8) = *(_QWORD *)(v2 + v5 - 8);
      *(_QWORD *)(v7 - 24) = 0;
      *(_QWORD *)(v7 - 16) = 0;
      *(_QWORD *)(v7 - 8) = 0;
      v5 -= 32;
    }
    while (v2 + v5 != v3);
    v4 += v5;
  }
  a2[1] = v4;
  v8 = *result;
  *result = v4;
  a2[1] = v8;
  v9 = result[1];
  result[1] = a2[2];
  a2[2] = v9;
  v10 = result[2];
  result[2] = a2[3];
  a2[3] = v10;
  *a2 = a2[1];
  return result;
}

void *sub_2462D3624(unint64_t a1)
{
  if (a1 >> 59)
    sub_2462D3488();
  return operator new(32 * a1);
}

uint64_t sub_2462D3658(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)(a1 + 8);
  v2 = *(_QWORD *)(a1 + 16);
  while (v2 != v3)
  {
    *(_QWORD *)(a1 + 16) = v2 - 32;
    v4 = *(void **)(v2 - 24);
    if (v4)
    {
      *(_QWORD *)(v2 - 16) = v4;
      operator delete(v4);
      v2 = *(_QWORD *)(a1 + 16);
    }
    else
    {
      v2 -= 32;
    }
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

_QWORD *sub_2462D36B8(_QWORD *a1)
{
  sub_2462D3704(a1);
  if (*((_BYTE *)a1 + 8) && *a1)
    (*(void (**)(_QWORD))(*(_QWORD *)*a1 + 8))(*a1);
  *a1 = 0;
  *((_BYTE *)a1 + 8) = 0;
  return a1;
}

_QWORD *sub_2462D3704(_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = result;
  v2 = result[5];
  if (v2)
  {
    v3 = *result;
    if (*v1)
      result = (_QWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 24))(v3);
    else
      result = (_QWORD *)MEMORY[0x249556DB0](v2, 0x1000C8077774924);
  }
  v1[5] = 0;
  return result;
}

void sub_2462D3760(void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    sub_2462D37A0((uint64_t *)v2);
    operator delete(**a1);
  }
}

void sub_2462D37A0(uint64_t *a1)
{
  uint64_t v2;
  uint64_t i;

  v2 = *a1;
  for (i = a1[1]; i != v2; i -= 48)
  {
    if (*(char *)(i - 25) < 0)
      operator delete(*(void **)(i - 48));
  }
  a1[1] = v2;
}

_QWORD *sub_2462D37EC(_QWORD *a1)
{
  uint64_t v2;

  v2 = a1[11];
  if (v2)
  {
    sub_2462D3838(a1[11], *(_QWORD **)(v2 + 8));
    MEMORY[0x249556DC8](v2, 0x1060C40C2B13FB5);
  }
  return sub_2462D36B8(a1);
}

void sub_2462D3838(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    sub_2462D3838(a1, *a2);
    sub_2462D3838(a1, a2[1]);
    operator delete(a2);
  }
}

void sub_2462D3878(void ***a1)
{
  void **v1;
  char *v2;
  char *v4;
  void *v5;
  char *v6;
  void **v7;

  v1 = *a1;
  v2 = (char *)**a1;
  if (v2)
  {
    v4 = (char *)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v6 = v4 - 32;
        v7 = (void **)(v4 - 24);
        sub_2462D38F0(&v7);
        v4 = v6;
      }
      while (v6 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_2462D38F0(void ***a1)
{
  void **v1;
  void *v2;
  uint64_t v4;
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = (uint64_t)v1[1];
    v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 568;
        sub_2462D3960(v4);
      }
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t sub_2462D3960(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 520);
  if (v2 != (void *)(a1 + 536))
    free(v2);
  if (*(char *)(a1 + 487) < 0)
    operator delete(*(void **)(a1 + 464));
  return sub_2462D39A4(a1);
}

uint64_t sub_2462D39A4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(void **)a1;
  v3 = *(unsigned int *)(a1 + 8);
  if ((_DWORD)v3)
  {
    v4 = 112 * v3;
    do
    {
      v2 = (void *)(sub_2462D39FC((uint64_t)v2) + 112);
      v4 -= 112;
    }
    while (v4);
    v2 = *(void **)a1;
  }
  if (v2 != (void *)(a1 + 16))
    free(v2);
  return a1;
}

uint64_t sub_2462D39FC(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 80);
  if (v2 != (void *)(a1 + 96))
    free(v2);
  if (*(char *)(a1 + 31) < 0)
    operator delete(*(void **)(a1 + 8));
  return a1;
}

void sub_2462D3A40(uint64_t *a1)
{
  uint64_t v2;
  uint64_t i;
  void *v4;

  v2 = *a1;
  for (i = a1[1]; i != v2; i -= 32)
  {
    v4 = *(void **)(i - 24);
    if (v4)
    {
      *(_QWORD *)(i - 16) = v4;
      operator delete(v4);
    }
  }
  a1[1] = v2;
}

uint64_t sub_2462D3A8C(uint64_t a1, skit::internal *a2, __int16 a3, uint64_t a4, int a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  int v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)a1 = &off_25175EC70;
  v11 = *((_QWORD *)a2 + 1);
  if (*((char *)a2 + 23) >= 0)
  {
    v12 = *((unsigned __int8 *)a2 + 23);
  }
  else
  {
    a2 = *(skit::internal **)a2;
    v12 = v11;
  }
  v13 = (_QWORD *)sub_2462ECB80((uint64_t)&off_25175F388, a2, v12);
  *(_QWORD *)(a1 + 8) = v13;
  v14 = v13[5];
  *(_QWORD *)(a1 + 16) = &off_25175ECE8;
  *(_QWORD *)(a1 + 24) = v14;
  v15 = v13[7];
  *(_QWORD *)(a1 + 32) = &off_25175ECE8;
  *(_QWORD *)(a1 + 40) = v15;
  v16 = v13[6];
  *(_QWORD *)(a1 + 48) = &off_25175ECE8;
  *(_QWORD *)(a1 + 56) = v16;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)a6;
  *(_QWORD *)a6 = 0;
  *(_QWORD *)(a6 + 8) = 0;
  *(_QWORD *)(a1 + 200) = 0;
  v17 = MEMORY[0x24BEDDEC8] + 64;
  *(_QWORD *)(a1 + 80) = MEMORY[0x24BEDDEC8] + 16;
  *(_QWORD *)(a1 + 88) = v17;
  v18 = MEMORY[0x24BEDDED0];
  v19 = MEMORY[0x24BEDDED0] + 16;
  *(_QWORD *)(a1 + 96) = 0x500000000;
  *(_QWORD *)(a1 + 104) = v19;
  *(_DWORD *)(a1 + 96) = 1065353216;
  *(_QWORD *)(a1 + 112) = v18 + 64;
  *(_DWORD *)(a1 + 120) = 1056964608;
  *(_WORD *)(a1 + 124) = 4;
  *(_QWORD *)(a1 + 128) = &off_25175ED48;
  *(_QWORD *)(a1 + 136) = &unk_25175ED78;
  *(_QWORD *)(a1 + 144) = 0;
  *(_QWORD *)(a1 + 152) = &off_25175EDD8;
  *(_QWORD *)(a1 + 160) = &unk_25175EE08;
  *(_QWORD *)(a1 + 168) = 0;
  *(_QWORD *)(a1 + 176) = a4;
  *(_DWORD *)(a1 + 184) = a5;
  *(_WORD *)(a1 + 188) = a3;
  *(_QWORD *)(a1 + 208) = 0;
  *(_QWORD *)(a1 + 216) = 0;
  if ((a3 & 1) != 0)
  {
    morphun::util::LocaleUtils::toLocale();
    *(_QWORD *)(a1 + 192) = morphun::dictionary::DictionaryMetaData::createDictionary();
    morphun::util::ULocale::~ULocale((morphun::util::ULocale *)&v22);
    a3 = *(_WORD *)(a1 + 188);
  }
  if ((a3 & 4) != 0)
  {
    v20 = qword_25441F958;
    if (os_log_type_enabled((os_log_t)qword_25441F958, OS_LOG_TYPE_DEBUG))
    {
      v22 = 136315394;
      v23 = "Analyzer";
      v24 = 1024;
      v25 = a5;
      _os_log_debug_impl(&dword_2462C4000, v20, OS_LOG_TYPE_DEBUG, "%s phonetic search enabled. n-gram order from trial: %d", (uint8_t *)&v22, 0x12u);
    }
  }
  return a1;
}

void sub_2462D3C84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  morphun::util::ULocale::~ULocale((morphun::util::ULocale *)&a9);
  sub_2462D3524(v11);

  sub_2462D3524(v10);
  _Unwind_Resume(a1);
}

uint64_t sub_2462D3CCC(uint64_t a1)
{
  const void *v2;

  *(_QWORD *)a1 = &off_25175EC70;
  v2 = *(const void **)(a1 + 144);
  if (v2)
    CFRelease(v2);
  sub_2462D3524(a1 + 200);

  sub_2462D3524(a1 + 64);
  return a1;
}

void sub_2462D3D24(uint64_t a1)
{
  sub_2462D3CCC(a1);
  JUMPOUT(0x249556DC8);
}

void sub_2462D3D48(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v7;
  size_t v8;
  uint64_t v9;
  const void *v10;
  void **v11;
  uint64_t v12;
  uint64_t v13;
  void *__dst[2];
  unint64_t v15;
  _BYTE v16[128];

  if (!a1[25] && !a1[27])
  {
    v2 = operator new(0x168uLL);
    v2[1] = 0;
    v2[2] = 0;
    *v2 = &off_25175EE68;
    v3 = morphun::analysis::DefaultAnalyzerFactory::DefaultAnalyzerFactory((morphun::analysis::DefaultAnalyzerFactory *)(v2 + 3));
    v4 = (std::__shared_weak_count *)a1[26];
    a1[25] = v3;
    a1[26] = v2;
    if (v4)
    {
      p_shared_owners = (unint64_t *)&v4->__shared_owners_;
      do
        v6 = __ldaxr(p_shared_owners);
      while (__stlxr(v6 - 1, p_shared_owners));
      if (!v6)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
    v7 = a1[1];
    v8 = *(_QWORD *)(v7 + 24);
    if (v8 >= 0x7FFFFFFFFFFFFFF8)
      sub_2462D3400();
    v9 = a1[25];
    v10 = *(const void **)(v7 + 16);
    if (v8 >= 0x17)
    {
      v12 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v8 | 7) != 0x17)
        v12 = v8 | 7;
      v13 = v12 + 1;
      v11 = (void **)operator new(v12 + 1);
      __dst[1] = (void *)v8;
      v15 = v13 | 0x8000000000000000;
      __dst[0] = v11;
    }
    else
    {
      HIBYTE(v15) = *(_QWORD *)(v7 + 24);
      v11 = __dst;
      if (!v8)
      {
LABEL_16:
        *((_BYTE *)v11 + v8) = 0;
        morphun::util::ULocale::ULocale();
        a1[27] = (*(uint64_t (**)(uint64_t, _BYTE *))(*(_QWORD *)v9 + 24))(v9, v16);
        morphun::util::ULocale::~ULocale((morphun::util::ULocale *)v16);
        if (SHIBYTE(v15) < 0)
          operator delete(__dst[0]);
        return;
      }
    }
    memmove(v11, v10, v8);
    goto LABEL_16;
  }
}

void sub_2462D3F04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,char a33)
{
  morphun::util::ULocale::~ULocale((morphun::util::ULocale *)&a33);
  if (a14 < 0)
    operator delete(__p);
  if (a20 < 0)
    operator delete(a15);
  if (a26 < 0)
    operator delete(a21);
  if (a32 < 0)
    operator delete(a27);
  _Unwind_Resume(a1);
}

void sub_2462D3F70(uint64_t a1, uint64_t *a2, void *a3, unint64_t a4)
{
  uint64_t v5;
  int v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(a1 + 64);
  if (v5)
  {
    if ((*(_BYTE *)(*(_QWORD *)(a1 + 8) + 32) & 0x40) != 0)
      v6 = (*(unsigned __int16 *)(a1 + 188) >> 3) & 1;
    else
      v6 = 0;
    sub_24630475C(v5, a2, a3, a4, v6);
  }
  else
  {
    v7 = qword_25441F958;
    if (os_log_type_enabled((os_log_t)qword_25441F958, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315138;
      v9 = "analyze_str";
      _os_log_error_impl(&dword_2462C4000, v7, OS_LOG_TYPE_ERROR, "%s Unsupported - this analyzer was constructed without a Tokenizer.", (uint8_t *)&v8, 0xCu);
    }
  }
}

uint64_t sub_2462D4064(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  _BOOL4 v4;
  void (*v5)(__int128 *__return_ptr, __int128 *);
  uint64_t v6;
  uint64_t v7;
  skit *v8;
  uint64_t result;
  float v10;
  uint64_t v11;
  uint64_t v12;
  float v13;
  __int16 v14;
  unint64_t v15;
  int v17;
  uint64_t v18;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  void **v24;

  v3 = *(_QWORD *)(a1 + 8);
  v4 = **(unsigned __int16 **)(v3 + 16) != 28261;
  v5 = *(void (**)(__int128 *__return_ptr, __int128 *))(v3 + 80);
  if (v5)
  {
    v20 = *(_OWORD *)a2;
    v21 = a2[2];
    a2[1] = 0;
    a2[2] = 0;
    *a2 = 0;
    v5(&v22, &v20);
    sub_2462D722C(a2);
    *(_OWORD *)a2 = v22;
    a2[2] = v23;
    v23 = 0;
    v22 = 0uLL;
    v24 = (void **)&v22;
    sub_2462D3760(&v24);
    v24 = (void **)&v20;
    sub_2462D3760(&v24);
  }
  v6 = *a2;
  v7 = a2[1];
  if (*a2 == v7)
  {
    v8 = 0;
  }
  else
  {
    LODWORD(v8) = 0;
    do
    {
      v8 = (skit *)(v8 + ((*(unsigned __int16 *)(v6 + 40) << 31 >> 31) & *(unsigned __int16 *)(v6 + 38)));
      v6 += 48;
    }
    while (v6 != v7);
  }
  result = skit::entity_token_wgt(v8);
  v12 = *a2;
  v11 = a2[1];
  if (v12 != v11)
  {
    v13 = v10;
    do
    {
      v14 = *(_WORD *)(v12 + 40);
      if ((v14 & 1) != 0)
        *(float *)(v12 + 32) = v13 * *(float *)(v12 + 32);
      if (v4)
        goto LABEL_13;
      if (*(char *)(v12 + 23) < 0)
      {
        v15 = *(_QWORD *)(v12 + 8);
        if ((v14 & 7) != 3 || v15 <= 2)
          goto LABEL_13;
        v18 = *(_QWORD *)v12;
        v17 = *(_DWORD *)(*(_QWORD *)v12 + 2 * v15 - 4);
      }
      else
      {
        v15 = *(unsigned __int8 *)(v12 + 23);
        if ((v14 & 7) != 3 || v15 < 3)
          goto LABEL_13;
        v17 = *(_DWORD *)(v12 + 2 * v15 - 4);
        v18 = v12;
      }
      if (v17 == 7536679 || *(_DWORD *)(v18 + 2 * v15 - 4) == 7544857)
        result = sub_2462D7264(v12, v15 - 2, 0);
LABEL_13:
      v12 += 48;
    }
    while (v12 != v11);
  }
  return result;
}

void sub_2462D4220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  sub_2462D3760((void ***)va);
  _Unwind_Resume(a1);
}

void sub_2462D4238(uint64_t a1, TokenStream *a2, __int16 a3, __int128 *a4, __int128 *a5)
{
  TokenStream *v8;
  uint64_t v9;
  uint64_t *v10;
  Token *begin;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  BOOL v18;
  uint64_t v19;
  unsigned __int16 *value_high;
  unsigned __int16 **v21;
  unsigned __int16 *v22;
  unsigned __int16 *v23;
  _WORD *v24;
  void (*v25)(__int128 *__return_ptr, Token **);
  unint64_t *p_end_cap;
  unint64_t end;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char *v31;
  _QWORD v32[3];
  Token *v33;
  __int128 v34;
  Token **v35;
  __int128 v36;
  Token *v37;
  char *v38;
  __compressed_pair<skit::Token *, std::allocator<skit::Token>> *v39;

  v8 = a2;
  v9 = *(_QWORD *)(a1 + 8);
  v10 = *(uint64_t **)(v9 + 64);
  begin = a2->__begin_;
  v12 = *((unsigned int *)v10 + 2);
  if (!(_DWORD)v12)
    goto LABEL_24;
  v13 = 0;
  v14 = *v10;
  v15 = 0xAAAAAAAAAAAAAAABLL * ((a2->__end_ - begin) >> 4);
  while (1)
  {
    v16 = v14 + 56 * v13;
    v17 = *(unsigned int *)(v16 + 48);
    if ((_DWORD)v17)
      v18 = v15 >= v17;
    else
      v18 = 0;
    if (v18)
    {
      v19 = 0;
      while (1)
      {
        a2 = (TokenStream *)((char *)begin + 48 * v19);
        if (SHIBYTE(a2->__end_cap_.__value_) < 0)
        {
          a2 = (TokenStream *)a2->__begin_;
          value_high = (unsigned __int16 *)*((_QWORD *)begin + 6 * v19 + 1);
        }
        else
        {
          value_high = (unsigned __int16 *)HIBYTE(a2->__end_cap_.__value_);
        }
        v21 = (unsigned __int16 **)(v16 + 16 * v19);
        v22 = v21[1];
        if (v22 != value_high)
          goto LABEL_8;
        if (v22)
        {
          v23 = *v21;
          while (LOWORD(a2->__begin_) == *v23)
          {
            ++v23;
            a2 = (TokenStream *)((char *)a2 + 2);
            v22 = (unsigned __int16 *)((char *)v22 - 1);
            if (!v22)
              goto LABEL_19;
          }
          goto LABEL_8;
        }
LABEL_19:
        if (++v19 == v17)
          goto LABEL_22;
      }
    }
    if (v15 >= v17)
      break;
LABEL_8:
    if (++v13 == v12)
      goto LABEL_24;
  }
  if ((_DWORD)v17)
  {
LABEL_22:
    v24 = (_WORD *)((char *)begin + 40);
    do
    {
      *v24 = *v24 & 0xFFFA | 4;
      v24 += 24;
      --v17;
    }
    while (v17);
  }
LABEL_24:
  v25 = *(void (**)(__int128 *__return_ptr, Token **))(v9 + 80);
  if (v25)
  {
    v33 = begin;
    v34 = *(_OWORD *)&v8->__end_;
    v8->__begin_ = 0;
    v8->__end_ = 0;
    v8->__end_cap_.__value_ = 0;
    v25(&v36, &v33);
    sub_2462D722C((uint64_t *)v8);
    *(_OWORD *)&v8->__begin_ = v36;
    v8->__end_cap_.__value_ = v37;
    v37 = 0;
    v35 = (Token **)&v36;
    v36 = 0uLL;
    sub_2462D3760((void ***)&v35);
    v35 = &v33;
    sub_2462D3760((void ***)&v35);
  }
  if (a4 == a5)
  {
    end = (unint64_t)v8->__end_;
  }
  else
  {
    p_end_cap = (unint64_t *)&v8->__end_cap_;
    end = (unint64_t)v8->__end_;
    do
    {
      if (end >= *p_end_cap)
      {
        v28 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(end - (unint64_t)v8->__begin_) >> 4);
        v29 = v28 + 1;
        if (v28 + 1 > 0x555555555555555)
          sub_2462D357C();
        if (0x5555555555555556 * ((uint64_t)(*p_end_cap - (unint64_t)v8->__begin_) >> 4) > v29)
          v29 = 0x5555555555555556 * ((uint64_t)(*p_end_cap - (unint64_t)v8->__begin_) >> 4);
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*p_end_cap - (unint64_t)v8->__begin_) >> 4) >= 0x2AAAAAAAAAAAAAALL)
          v30 = 0x555555555555555;
        else
          v30 = v29;
        v39 = &v8->__end_cap_;
        if (v30)
          v31 = (char *)sub_2462D7644((uint64_t)&v8->__end_cap_, v30);
        else
          v31 = 0;
        *(_QWORD *)&v36 = v31;
        *((_QWORD *)&v36 + 1) = &v31[48 * v28];
        v37 = (Token *)*((_QWORD *)&v36 + 1);
        v38 = &v31[48 * v30];
        sub_2462D74C4(*((uint64_t *)&v36 + 1), a4);
        v37 = (Token *)((char *)v37 + 48);
        sub_2462D75D0((uint64_t *)v8, &v36);
        end = (unint64_t)v8->__end_;
        sub_2462D77AC((uint64_t)&v36);
      }
      else
      {
        sub_2462D74C4(end, a4);
        end += 48;
        v8->__end_ = (Token *)end;
      }
      v8->__end_ = (Token *)end;
      *(_WORD *)(end - 12) = a3;
      a4 = (__int128 *)((char *)a4 + 104);
    }
    while (a4 != a5);
  }
  v32[0] = v8->__begin_;
  v32[1] = end;
  v32[2] = v8->__end_cap_.__value_;
  v8->__end_ = 0;
  v8->__end_cap_.__value_ = 0;
  v8->__begin_ = 0;
  skit::Analyzer::dedup((skit::Analyzer *)v32, a2);
  *(_QWORD *)&v36 = v32;
  sub_2462D3760((void ***)&v36);
}

void sub_2462D451C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  sub_2462D3760((void ***)va);
  _Unwind_Resume(a1);
}

uint64_t sub_2462D4560(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  __int16 v4;
  uint64_t v6;
  uint64_t *v7;

  v4 = a4;
  v6 = a2;
  v7 = (uint64_t *)result;
  if ((a4 - 2) < 2)
  {
    if (a2 != a3)
    {
      do
      {
        *(_DWORD *)(v6 + 32) = 1065353216;
        *(_WORD *)(v6 + 40) = *(_WORD *)(v6 + 40) & 0xFFFA | 1;
        sub_2462D6EE4(v7[3], v6);
        sub_2462D70B0((uint64_t)(v7 + 16), (uint64_t *)v6);
        skit::EmojiFilter::filter((skit::EmojiFilter *)(v7 + 10), (Token *)v6);
        skit::NumberFilter::filter((skit::NumberFilter *)(v7 + 13), (Token *)v6);
        result = sub_2462D70B0((uint64_t)(v7 + 19), (uint64_t *)v6);
        *(_WORD *)(v6 + 36) = v4;
        v6 += 48;
      }
      while (v6 != a3);
    }
  }
  else if ((a4 - 5) >= 2)
  {
    if (a4 == 4)
    {
      if (a2 != a3)
      {
        do
        {
          *(_DWORD *)(v6 + 32) = 1065353216;
          *(_WORD *)(v6 + 40) = *(_WORD *)(v6 + 40) & 0xFFFA | 1;
          sub_2462D6EE4(v7[5], v6);
          sub_2462D6EE4(v7[7], v6);
          sub_2462D70B0((uint64_t)(v7 + 16), (uint64_t *)v6);
          skit::EmojiFilter::filter((skit::EmojiFilter *)(v7 + 10), (Token *)v6);
          skit::NumberFilter::filter((skit::NumberFilter *)(v7 + 13), (Token *)v6);
          result = sub_2462D70B0((uint64_t)(v7 + 19), (uint64_t *)v6);
          *(_WORD *)(v6 + 36) = 4;
          v6 += 48;
        }
        while (v6 != a3);
      }
    }
    else if (a2 != a3)
    {
      do
      {
        *(_DWORD *)(v6 + 32) = 1065353216;
        *(_WORD *)(v6 + 40) = *(_WORD *)(v6 + 40) & 0xFFFA | 1;
        *(_WORD *)(v6 + 36) = a4;
        v6 += 48;
      }
      while (v6 != a3);
    }
  }
  else if (a2 != a3)
  {
    do
    {
      *(_DWORD *)(v6 + 32) = 1065353216;
      *(_WORD *)(v6 + 40) = *(_WORD *)(v6 + 40) & 0xFFFA | 1;
      sub_2462D6EE4(v7[5], v6);
      skit::EmojiFilter::filter((skit::EmojiFilter *)(v7 + 10), (Token *)v6);
      result = skit::NumberFilter::filter((skit::NumberFilter *)(v7 + 13), (Token *)v6);
      *(_WORD *)(v6 + 36) = v4;
      v6 += 48;
    }
    while (v6 != a3);
  }
  return result;
}

uint64_t sub_2462D4768(uint64_t a1, _QWORD *a2, int a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  _QWORD *v7;
  unsigned __int8 v8;
  int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unsigned __int16 *v14;
  unsigned __int16 *v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _WORD *v23;
  uint64_t v24;
  _WORD *v25;
  uint64_t v26;
  _WORD *v27;
  int v28;
  uint64_t v29;
  __int16 *v30;
  int v31;
  uint64_t v32;
  int v33;
  int v38;

  v4 = a2[1];
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - *a2) >> 4) > a4)
  {
    v5 = *a2 + 48 * a4;
    if (v5 != v4)
    {
      v6 = a3;
      v7 = a2;
      v8 = 0;
      v9 = 0;
      while (1)
      {
        if (*(char *)(v5 + 23) < 0)
          v10 = *(_QWORD *)(v5 + 8);
        else
          v10 = *(unsigned __int8 *)(v5 + 23);
        skit::strip_bidi();
        v11 = *(unsigned __int8 *)(v5 + 23);
        if (*(char *)(v5 + 23) < 0)
          v12 = *(_QWORD *)(v5 + 8);
        else
          v12 = *(unsigned __int8 *)(v5 + 23);
        v38 = v10;
        if (v10 > v12)
        {
          if ((v11 & 0x80u) == 0)
            v13 = *(unsigned __int8 *)(v5 + 23);
          else
            v13 = *(_QWORD *)(v5 + 8);
          if (!v13)
            goto LABEL_25;
          if ((*(_WORD *)(v5 + 40) & 2) == 0)
          {
            if ((v11 & 0x80u) == 0)
              v14 = (unsigned __int16 *)v5;
            else
              v14 = *(unsigned __int16 **)v5;
            v15 = &v14[v13];
            do
            {
              v16 = 0;
              while (*(unsigned __int16 *)&asc_246343262[v16] != *v14)
              {
                v16 += 2;
                if (v16 == 12)
                  goto LABEL_31;
              }
              ++v14;
            }
            while (v14 != v15);
LABEL_25:
            v17 = v7;
            v18 = v5 + 48;
            v19 = v17[1];
            if (v5 + 48 == v19)
            {
              v21 = v5;
            }
            else
            {
              v20 = v5;
              do
              {
                if (*(char *)(v20 + 23) < 0)
                  operator delete(*(void **)v20);
                *(_OWORD *)v20 = *(_OWORD *)(v20 + 48);
                *(_QWORD *)(v20 + 16) = *(_QWORD *)(v20 + 64);
                *(_BYTE *)(v20 + 71) = 0;
                *(_WORD *)(v20 + 48) = 0;
                v21 = v20 + 48;
                *(_OWORD *)(v20 + 24) = *(_OWORD *)(v20 + 72);
                *(_QWORD *)(v20 + 40) = *(_QWORD *)(v20 + 88);
                v22 = v20 + 96;
                v20 += 48;
              }
              while (v22 != v19);
              v18 = a2[1];
            }
            v6 = a3;
            while (v18 != v21)
            {
              if (*(char *)(v18 - 25) < 0)
                operator delete(*(void **)(v18 - 48));
              v18 -= 48;
            }
            v7 = a2;
            v9 = v9 - v38 + v13;
            a2[1] = v21;
            goto LABEL_65;
          }
        }
LABEL_31:
        if ((v11 & 0x80) != 0)
        {
          v23 = *(_WORD **)v5;
          v11 = *(_QWORD *)(v5 + 8);
        }
        else
        {
          v23 = (_WORD *)v5;
        }
        if (v11 == 1 && *v23 == 38)
          sub_2462D7834((void **)v5, **(void ***)(*(_QWORD *)(a1 + 8) + 72), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 72) + 8));
        LODWORD(v24) = *(unsigned __int8 *)(v5 + 23);
        if (*(char *)(v5 + 23) < 0)
        {
          v25 = *(_WORD **)v5;
          v26 = *(_QWORD *)(v5 + 8);
        }
        else
        {
          v25 = (_WORD *)v5;
          v26 = *(unsigned __int8 *)(v5 + 23);
        }
        v27 = &v25[v26];
        if (v26)
          break;
LABEL_56:
        if ((v24 & 0x80) != 0)
          v24 = *(_QWORD *)(v5 + 8);
        if (v6)
          v31 = v9;
        else
          v31 = 0;
        v32 = (*(_DWORD *)(v5 + 24) + v31);
        v9 += v24 - v38;
        if (v6)
          v33 = v9;
        else
          v33 = 0;
        *(_QWORD *)(v5 + 24) = v32 | ((unint64_t)(v33 + *(_DWORD *)(v5 + 28)) << 32);
        v5 += 48;
        v21 = v7[1];
LABEL_65:
        if (v5 == v21)
          return v8;
      }
      while (1)
      {
        v28 = (unsigned __int16)*v25;
        if ((v28 & 0xFFFE) == 0x2018)
          break;
        if ((v28 & 0xFFFE) == 0x201C)
        {
          v28 = 34;
LABEL_45:
          *v25 = v28;
        }
        if ((v8 & 1) == 0)
        {
          v29 = 0;
          while ((unsigned __int16)word_246317EFA[v29] != v28)
          {
            if (++v29 == 76)
            {
              v30 = (__int16 *)"N13semskitbridge8AnalyzerE";
              goto LABEL_52;
            }
          }
          v30 = &word_246317EFA[v29];
LABEL_52:
          if ((char *)v30 - (char *)word_246317EFA != 152)
            v8 = 1;
        }
        if (++v25 == v27)
        {
          LODWORD(v24) = *(unsigned __int8 *)(v5 + 23);
          goto LABEL_56;
        }
      }
      v28 = 39;
      goto LABEL_45;
    }
  }
  return 0;
}

id sub_2462D4A8C(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v5;
  NSObject *v6;
  const char *v7;
  SEMG2PExecutor *v8;
  const char *v9;
  uint64_t v10;
  size_t v11;
  SEMG2PExecutor *v12;
  const void *v13;
  _OWORD *p_p;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t isJit;
  void *v20;
  void *v21;
  _BOOL4 v22;
  const char *v23;
  void *v24;
  void *v25;
  const char *v26;
  void *v27;
  __int128 __p;
  unint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = *(void **)(a1 + 168);
  if (v5)
    goto LABEL_16;
  if ((*(_WORD *)(a1 + 188) & 4) == 0)
  {
    v6 = qword_25441F958;
    if (os_log_type_enabled((os_log_t)qword_25441F958, OS_LOG_TYPE_ERROR))
    {
      LODWORD(__p) = 136315138;
      *(_QWORD *)((char *)&__p + 4) = "get_pronunciations_for_orthography";
      v7 = "%s SEMG2PExecutor is not set up as TrialFactors::use_contact_phonetic_search is not enabled.";
LABEL_22:
      _os_log_error_impl(&dword_2462C4000, v6, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&__p, 0xCu);
      goto LABEL_19;
    }
    goto LABEL_19;
  }
  v8 = [SEMG2PExecutor alloc];
  v10 = *(_QWORD *)(a1 + 8);
  v11 = *(_QWORD *)(v10 + 24);
  if (v11 >= 0x7FFFFFFFFFFFFFF8)
    sub_2462D3400();
  v12 = v8;
  v13 = *(const void **)(v10 + 16);
  if (v11 >= 0x17)
  {
    v15 = (v11 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v11 | 7) != 0x17)
      v15 = v11 | 7;
    v16 = v15 + 1;
    p_p = operator new(v15 + 1);
    *((_QWORD *)&__p + 1) = v11;
    v30 = v16 | 0x8000000000000000;
    *(_QWORD *)&__p = p_p;
  }
  else
  {
    HIBYTE(v30) = *(_QWORD *)(v10 + 24);
    p_p = &__p;
    if (!v11)
      goto LABEL_13;
  }
  memmove(p_p, v13, v11);
LABEL_13:
  *((_BYTE *)p_p + v11) = 0;
  sub_2462EA4F4((uint64_t)&__p, v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  isJit = objc_msgSend_initWithLocale_isJit_(v12, v18, (uint64_t)v17, 1);
  v20 = *(void **)(a1 + 168);
  *(_QWORD *)(a1 + 168) = isJit;

  if (SHIBYTE(v30) < 0)
    operator delete((void *)__p);
  v5 = *(void **)(a1 + 168);
LABEL_16:
  objc_msgSend_user_profile(v5, a2, a3, __p, v30, v31);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21 == 0;

  if (v22)
  {
    v6 = qword_25441F958;
    if (os_log_type_enabled((os_log_t)qword_25441F958, OS_LOG_TYPE_ERROR))
    {
      LODWORD(__p) = 136315138;
      *(_QWORD *)((char *)&__p + 4) = "get_pronunciations_for_orthography";
      v7 = "%s G2P user profile is nil.";
      goto LABEL_22;
    }
LABEL_19:
    v27 = 0;
    return v27;
  }
  v24 = *(void **)(a1 + 168);
  sub_2462EA4F4((uint64_t)a2, v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pronunciationsForOrthography_(v24, v26, (uint64_t)v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

void sub_2462D4CC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  void *v14;

  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void sub_2462D4D04(uint64_t a1, uint64_t *a2, uint64_t a3, unsigned __int8 a4, int a5)
{
  int v5;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  __int128 v18;
  int64x2_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  std::ios_base *v27;
  uint64_t v28;
  char *v29;
  unint64_t v30;
  std::string::size_type v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  _BYTE *v37;
  int v38;
  _OWORD *v39;
  __int128 v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  std::string::size_type size;
  __int128 v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  int64x2_t v53;
  std::string::size_type v54;
  unint64_t v55;
  int v56;
  unint64_t v57;
  unint64_t v58;
  _QWORD *v59;
  uint64_t v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  std::string::size_type v68;
  std::string *v69;
  int v70;
  const std::string::value_type *v71;
  std::string::size_type v72;
  int v73;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  void *v81;
  std::string::size_type v82;
  uint64_t v83;
  uint64_t v84;
  unsigned int v85;
  uint64_t v86;
  std::string v87;
  std::string v88;
  int64x2_t v89;
  char *v90;
  void *v91[2];
  char v92;
  void *v93[2];
  char v94;
  std::string __dst;
  std::string::size_type v96;
  char **v97;
  _BYTE buf[24];
  uint64_t v99;
  char **v100;
  _QWORD v101[4];
  char *v102;
  char *v103;
  __int128 v104;
  __int128 v105;
  int v106;
  _QWORD v107[22];

  v5 = a5;
  v107[19] = *MEMORY[0x24BDAC8D0];
  if (a5 < 0 && (v5 = *(_DWORD *)(a1 + 184), v5 < 0))
  {
    v5 = 3;
  }
  else if (!v5)
  {
    v9 = qword_25441F958;
    if (!os_log_type_enabled((os_log_t)qword_25441F958, OS_LOG_TYPE_ERROR))
      return;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "generate_phoneme_ngrams";
    v10 = "%s Error in Analyzer::generate_phoneme_ngrams: Ngram order is out of bounds";
    goto LABEL_21;
  }
  v11 = *(unsigned __int8 *)(a3 + 23);
  if ((v11 & 0x80u) != 0)
    v11 = *(_QWORD *)(a3 + 8);
  if (!v11)
  {
    v9 = qword_25441F958;
    if (!os_log_type_enabled((os_log_t)qword_25441F958, OS_LOG_TYPE_ERROR))
      return;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "generate_phoneme_ngrams";
    v10 = "%s Error in Analyzer::generate_phoneme_ngrams: Input is empty string";
LABEL_21:
    _os_log_error_impl(&dword_2462C4000, v9, OS_LOG_TYPE_ERROR, v10, buf, 0xCu);
    return;
  }
  sub_2462D7A34(v93, "<");
  sub_2462D7A34(v91, ">");
  v89 = 0uLL;
  v90 = 0;
  if (*(char *)(a3 + 23) >= 0)
    v12 = *(unsigned __int8 *)(a3 + 23);
  else
    v12 = *(_QWORD *)(a3 + 8);
  if (v12)
  {
    if (v12 > 0xAAAAAAAAAAAAAAALL)
      sub_2462D357C();
    v100 = &v90;
    v13 = (char *)sub_2462D7AE4(v12);
    v15 = v89.i64[1];
    v16 = v89.i64[0];
    if (v89.i64[1] == v89.i64[0])
    {
      v19 = vdupq_n_s64(v89.u64[1]);
      v17 = v13;
    }
    else
    {
      v17 = v13;
      do
      {
        v18 = *(_OWORD *)(v15 - 24);
        *((_QWORD *)v17 - 1) = *(_QWORD *)(v15 - 8);
        *(_OWORD *)(v17 - 24) = v18;
        v17 -= 24;
        *(_QWORD *)(v15 - 16) = 0;
        *(_QWORD *)(v15 - 8) = 0;
        *(_QWORD *)(v15 - 24) = 0;
        v15 -= 24;
      }
      while (v15 != v16);
      v19 = v89;
    }
    v89.i64[0] = (uint64_t)v17;
    v89.i64[1] = (uint64_t)v13;
    *(int64x2_t *)&buf[8] = v19;
    v20 = (uint64_t)v90;
    v90 = &v13[24 * v14];
    v99 = v20;
    *(_QWORD *)buf = v19.i64[0];
    sub_2462D7B28((uint64_t)buf);
  }
  v85 = v5;
  v21 = MEMORY[0x24BEDB858];
  v22 = MEMORY[0x24BEDB858] + 104;
  v107[0] = MEMORY[0x24BEDB858] + 104;
  v23 = MEMORY[0x24BEDB858] + 64;
  v24 = (_QWORD *)MEMORY[0x24BEDB7F0];
  v25 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 16);
  v26 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 24);
  *(_QWORD *)&buf[16] = MEMORY[0x24BEDB858] + 64;
  *(_QWORD *)buf = v25;
  *(_QWORD *)&buf[*(_QWORD *)(v25 - 24)] = v26;
  *(_QWORD *)&buf[8] = 0;
  v27 = (std::ios_base *)&buf[*(_QWORD *)(*(_QWORD *)buf - 24)];
  std::ios_base::init(v27, &v99);
  v27[1].__vftable = 0;
  v27[1].__fmtflags_ = -1;
  v28 = v24[5];
  *(_QWORD *)&buf[16] = v24[4];
  *(_QWORD *)&buf[*(_QWORD *)(*(_QWORD *)&buf[16] - 24) + 16] = v28;
  *(_QWORD *)buf = v24[1];
  *(_QWORD *)&buf[*(_QWORD *)(*(_QWORD *)buf - 24)] = v24[6];
  v107[0] = v22;
  *(_QWORD *)buf = v21 + 24;
  *(_QWORD *)&buf[16] = v23;
  std::streambuf::basic_streambuf();
  v99 = MEMORY[0x24BEDB848] + 16;
  v104 = 0u;
  v105 = 0u;
  v106 = 24;
  std::string::operator=((std::string *)&v104, (const std::string *)a3);
  *((_QWORD *)&v105 + 1) = 0;
  if ((SBYTE7(v105) & 0x80u) == 0)
    v29 = (char *)&v104;
  else
    v29 = (char *)v104;
  if ((SBYTE7(v105) & 0x80u) == 0)
    v30 = BYTE7(v105);
  else
    v30 = *((_QWORD *)&v104 + 1);
  if ((v106 & 8) != 0)
  {
    v101[0] = v29;
    v101[1] = v29;
    *((_QWORD *)&v105 + 1) = &v29[v30];
    v101[2] = &v29[v30];
  }
  if ((v106 & 0x10) != 0)
  {
    *((_QWORD *)&v105 + 1) = &v29[v30];
    if ((SBYTE7(v105) & 0x80u) == 0)
      v31 = 22;
    else
      v31 = (v105 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    std::string::resize((std::string *)&v104, v31, 0);
    v32 = BYTE7(v105);
    if (SBYTE7(v105) < 0)
      v32 = *((_QWORD *)&v104 + 1);
    v101[3] = v29;
    v102 = v29;
    v103 = &v29[v32];
    if ((v106 & 3) != 0)
    {
      if (v30 >> 31)
      {
        v33 = ((v30 - 0x80000000) * (unsigned __int128)0x200000005uLL) >> 64;
        v34 = 0x7FFFFFFF * ((v33 + ((v30 - 0x80000000 - v33) >> 1)) >> 30);
        v29 += v34 + 0x7FFFFFFF;
        v30 = v30 - v34 - 0x7FFFFFFF;
        v102 = v29;
      }
      if (v30)
        v102 = &v29[v30];
    }
  }
  memset(&v88, 0, sizeof(v88));
  while (2)
  {
    MEMORY[0x249556D2C](&__dst, buf, 1);
    if (!__dst.__r_.__value_.__s.__data_[0])
      goto LABEL_61;
    if (SHIBYTE(v88.__r_.__value_.__r.__words[2]) < 0)
    {
      *v88.__r_.__value_.__l.__data_ = 0;
      v88.__r_.__value_.__l.__size_ = 0;
    }
    else
    {
      v88.__r_.__value_.__s.__data_[0] = 0;
      *((_BYTE *)&v88.__r_.__value_.__s + 23) = 0;
    }
    v35 = 0;
    while (1)
    {
      v36 = *(_QWORD **)((char *)v101 + *(_QWORD *)(*(_QWORD *)buf - 24));
      v37 = (_BYTE *)v36[3];
      if (v37 != (_BYTE *)v36[4])
      {
        v36[3] = v37 + 1;
        LOBYTE(v36) = *v37;
        goto LABEL_52;
      }
      LODWORD(v36) = (*(uint64_t (**)(_QWORD *))(*v36 + 80))(v36);
      if ((_DWORD)v36 == -1)
        break;
LABEL_52:
      if (v36 == a4)
      {
        v38 = 0;
        goto LABEL_60;
      }
      std::string::push_back(&v88, (std::string::value_type)v36);
      --v35;
      if (SHIBYTE(v88.__r_.__value_.__r.__words[2]) < 0 && v88.__r_.__value_.__l.__size_ == 0x7FFFFFFFFFFFFFF7)
      {
        v38 = 4;
        goto LABEL_60;
      }
    }
    if (v35)
      v38 = 2;
    else
      v38 = 6;
LABEL_60:
    std::ios_base::clear((std::ios_base *)&buf[*(_QWORD *)(*(_QWORD *)buf - 24)], *(_DWORD *)((char *)&v101[-1] + *(_QWORD *)(*(_QWORD *)buf - 24)) | v38);
LABEL_61:
    if ((*((_BYTE *)&v101[-1] + *(_QWORD *)(*(_QWORD *)buf - 24)) & 5) == 0)
    {
      v39 = (_OWORD *)v89.i64[1];
      if (v89.i64[1] >= (unint64_t)v90)
      {
        v41 = 0xAAAAAAAAAAAAAAABLL * ((v89.i64[1] - v89.i64[0]) >> 3);
        v42 = v41 + 1;
        if (v41 + 1 > 0xAAAAAAAAAAAAAAALL)
          sub_2462D357C();
        if (0x5555555555555556 * ((uint64_t)&v90[-v89.i64[0]] >> 3) > v42)
          v42 = 0x5555555555555556 * ((uint64_t)&v90[-v89.i64[0]] >> 3);
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v90[-v89.i64[0]] >> 3) >= 0x555555555555555)
          v43 = 0xAAAAAAAAAAAAAAALL;
        else
          v43 = v42;
        v97 = &v90;
        if (v43)
        {
          v45 = (char *)sub_2462D7AE4(v43);
        }
        else
        {
          v45 = 0;
          v44 = 0;
        }
        size = (std::string::size_type)&v45[24 * v41];
        __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)v45;
        __dst.__r_.__value_.__l.__size_ = size;
        __dst.__r_.__value_.__r.__words[2] = size;
        v96 = (std::string::size_type)&v45[24 * v44];
        if (SHIBYTE(v88.__r_.__value_.__r.__words[2]) < 0)
        {
          sub_2462D3374((_BYTE *)size, v88.__r_.__value_.__l.__data_, v88.__r_.__value_.__l.__size_);
          v49 = (char *)__dst.__r_.__value_.__r.__words[2];
          size = __dst.__r_.__value_.__l.__size_;
        }
        else
        {
          v48 = *(_OWORD *)&v88.__r_.__value_.__l.__data_;
          *(_QWORD *)(size + 16) = *((_QWORD *)&v88.__r_.__value_.__l + 2);
          *(_OWORD *)size = v48;
          v49 = &v45[24 * v41];
        }
        v51 = v89.i64[1];
        v50 = v89.i64[0];
        if (v89.i64[1] == v89.i64[0])
        {
          v53 = vdupq_n_s64(v89.u64[1]);
        }
        else
        {
          do
          {
            v52 = *(_OWORD *)(v51 - 24);
            *(_QWORD *)(size - 8) = *(_QWORD *)(v51 - 8);
            *(_OWORD *)(size - 24) = v52;
            size -= 24;
            *(_QWORD *)(v51 - 16) = 0;
            *(_QWORD *)(v51 - 8) = 0;
            *(_QWORD *)(v51 - 24) = 0;
            v51 -= 24;
          }
          while (v51 != v50);
          v53 = v89;
        }
        v46 = v49 + 24;
        v89.i64[0] = size;
        v89.i64[1] = (uint64_t)(v49 + 24);
        *(int64x2_t *)&__dst.__r_.__value_.__r.__words[1] = v53;
        v54 = (std::string::size_type)v90;
        v90 = (char *)v96;
        v96 = v54;
        __dst.__r_.__value_.__r.__words[0] = v53.i64[0];
        sub_2462D7B28((uint64_t)&__dst);
      }
      else
      {
        if (SHIBYTE(v88.__r_.__value_.__r.__words[2]) < 0)
        {
          sub_2462D3374((_BYTE *)v89.i64[1], v88.__r_.__value_.__l.__data_, v88.__r_.__value_.__l.__size_);
        }
        else
        {
          v40 = *(_OWORD *)&v88.__r_.__value_.__l.__data_;
          *(_QWORD *)(v89.i64[1] + 16) = *((_QWORD *)&v88.__r_.__value_.__l + 2);
          *v39 = v40;
        }
        v46 = (char *)v39 + 24;
      }
      v89.i64[1] = (uint64_t)v46;
      continue;
    }
    break;
  }
  v55 = 0xAAAAAAAAAAAAAAABLL * ((v89.i64[1] - v89.i64[0]) >> 3);
  if (v55 >= v85)
    v56 = v85;
  else
    v56 = -1431655765 * ((v89.i64[1] - v89.i64[0]) >> 3);
  v57 = 0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 3);
  v58 = v55 - 0x5555555555555555 * ((a2[1] - *a2) >> 3) - v56 + 1;
  v86 = (uint64_t)(a2 + 2);
  v59 = (_QWORD *)MEMORY[0x24BEDB7F0];
  if (0xAAAAAAAAAAAAAAABLL * ((a2[2] - *a2) >> 3) < v58)
  {
    if (v58 > 0xAAAAAAAAAAAAAAALL)
      sub_2462D357C();
    v97 = (char **)(a2 + 2);
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)sub_2462D7BFC(v86, v58);
    __dst.__r_.__value_.__l.__size_ = __dst.__r_.__value_.__r.__words[0] + 24 * v57;
    __dst.__r_.__value_.__r.__words[2] = __dst.__r_.__value_.__l.__size_;
    v96 = __dst.__r_.__value_.__r.__words[0] + 24 * v60;
    sub_2462D7B88(a2, &__dst);
    sub_2462D7D54((uint64_t)&__dst);
    v55 = 0xAAAAAAAAAAAAAAABLL * ((v89.i64[1] - v89.i64[0]) >> 3);
  }
  v61 = v56 - 1;
  if (v55 > v56 - 1)
  {
    v62 = v61;
    v63 = v61 + 1;
    v64 = 24 * v61 - 24 * v61;
    v65 = v61;
    do
    {
      sub_2462D7A34(&v87, "");
      v66 = v64;
      v67 = v63;
      if (v56 >= 1)
      {
        do
        {
          v68 = HIBYTE(v87.__r_.__value_.__r.__words[2]);
          if ((v87.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
            v68 = v87.__r_.__value_.__l.__size_;
          if (v68)
          {
            v69 = std::string::append(&v87, ".", 1uLL);
            v70 = *(char *)(v89.i64[0] + v66 + 23);
            if (v70 >= 0)
              v71 = (const std::string::value_type *)(v89.i64[0] + v66);
            else
              v71 = *(const std::string::value_type **)(v89.i64[0] + v66);
            if (v70 >= 0)
              v72 = *(unsigned __int8 *)(v89.i64[0] + v66 + 23);
            else
              v72 = *(_QWORD *)(v89.i64[0] + v66 + 8);
          }
          else
          {
            v73 = *(char *)(v89.i64[0] + v66 + 23);
            if (v73 >= 0)
              v71 = (const std::string::value_type *)(v89.i64[0] + v66);
            else
              v71 = *(const std::string::value_type **)(v89.i64[0] + v66);
            if (v73 >= 0)
              v72 = *(unsigned __int8 *)(v89.i64[0] + v66 + 23);
            else
              v72 = *(_QWORD *)(v89.i64[0] + v66 + 8);
            v69 = &v87;
          }
          std::string::append(v69, v71, v72);
          v66 += 24;
        }
        while (v67-- > 1);
      }
      v59 = (_QWORD *)MEMORY[0x24BEDB7F0];
      if (v65 == v62)
      {
        sub_2462D593C(&__dst, (const void **)v93, (const void **)&v87.__r_.__value_.__l.__data_);
        if (SHIBYTE(v87.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v87.__r_.__value_.__l.__data_);
        v87 = __dst;
      }
      if (0xAAAAAAAAAAAAAAABLL * ((v89.i64[1] - v89.i64[0]) >> 3) - 1 == v65)
      {
        sub_2462D593C(&__dst, (const void **)&v87.__r_.__value_.__l.__data_, (const void **)v91);
        if (SHIBYTE(v87.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v87.__r_.__value_.__l.__data_);
        v87 = __dst;
      }
      skit::to_u16string();
      v76 = a2[1];
      v75 = a2[2];
      if (v76 >= v75)
      {
        v77 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v76 - *a2) >> 3);
        v78 = v77 + 1;
        if (v77 + 1 > 0xAAAAAAAAAAAAAAALL)
          sub_2462D357C();
        v79 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v75 - *a2) >> 3);
        if (2 * v79 > v78)
          v78 = 2 * v79;
        if (v79 >= 0x555555555555555)
          v80 = 0xAAAAAAAAAAAAAAALL;
        else
          v80 = v78;
        v97 = (char **)(a2 + 2);
        if (v80)
          v81 = sub_2462D7BFC(v86, v80);
        else
          v81 = 0;
        v82 = (std::string::size_type)v81 + 24 * v77;
        __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)v81;
        __dst.__r_.__value_.__l.__size_ = v82;
        v96 = (std::string::size_type)v81 + 24 * v80;
        *(_QWORD *)(v82 + 16) = 0;
        *(_OWORD *)v82 = 0uLL;
        __dst.__r_.__value_.__r.__words[2] = v82 + 24;
        sub_2462D7B88(a2, &__dst);
        v83 = a2[1];
        sub_2462D7D54((uint64_t)&__dst);
        a2[1] = v83;
      }
      else
      {
        *(_QWORD *)(v76 + 16) = 0;
        *(_OWORD *)v76 = 0uLL;
        a2[1] = v76 + 24;
      }
      if (SHIBYTE(v87.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v87.__r_.__value_.__l.__data_);
      ++v65;
      v64 += 24;
    }
    while (0xAAAAAAAAAAAAAAABLL * ((v89.i64[1] - v89.i64[0]) >> 3) > v65);
  }
  if (SHIBYTE(v88.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v88.__r_.__value_.__l.__data_);
  *(_QWORD *)buf = *v59;
  v84 = v59[9];
  *(_QWORD *)&buf[*(_QWORD *)(*(_QWORD *)buf - 24)] = v59[8];
  *(_QWORD *)&buf[16] = v84;
  v99 = MEMORY[0x24BEDB848] + 16;
  if (SBYTE7(v105) < 0)
    operator delete((void *)v104);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x249556D8C](v107);
  *(_QWORD *)buf = &v89;
  sub_2462D7DDC((void ***)buf);
  if (v92 < 0)
    operator delete(v91[0]);
  if (v94 < 0)
    operator delete(v93[0]);
}

void sub_2462D57EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25,char a26,uint64_t a27,uint64_t a28,void *a29,uint64_t a30,int a31,__int16 a32,char a33,char a34,void *a35,uint64_t a36,int a37,__int16 a38,char a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46)
{
  __cxa_end_catch();
  if (a25 < 0)
    operator delete(__p);
  sub_2462D5A4C((uint64_t)&a46);
  __p = &a26;
  sub_2462D7DDC((void ***)&__p);
  if (a34 < 0)
    operator delete(a29);
  if (a40 < 0)
    operator delete(a35);
  _Unwind_Resume(a1);
}

_QWORD *sub_2462D593C(_QWORD *__dst, const void **a2, const void **a3)
{
  _QWORD *v3;
  int v4;
  size_t v5;
  int v6;
  size_t v7;
  unint64_t v8;
  uint64_t v11;
  uint64_t v12;
  const void *v13;
  char *v14;
  const void *v15;

  v3 = __dst;
  v4 = *((char *)a2 + 23);
  if (v4 >= 0)
    v5 = *((unsigned __int8 *)a2 + 23);
  else
    v5 = (size_t)a2[1];
  v6 = *((char *)a3 + 23);
  if (v6 >= 0)
    v7 = *((unsigned __int8 *)a3 + 23);
  else
    v7 = (size_t)a3[1];
  v8 = v7 + v5;
  if (v7 + v5 >= 0x7FFFFFFFFFFFFFF8)
    sub_2462D3400();
  if (v8 <= 0x16)
  {
    __dst[1] = 0;
    __dst[2] = 0;
    *__dst = 0;
    *((_BYTE *)__dst + 23) = v8;
    if (!v5)
      goto LABEL_18;
    goto LABEL_14;
  }
  v11 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v8 | 7) != 0x17)
    v11 = v8 | 7;
  v12 = v11 + 1;
  __dst = operator new(v11 + 1);
  v3[1] = v8;
  v3[2] = v12 | 0x8000000000000000;
  *v3 = __dst;
  v3 = __dst;
  if (v5)
  {
LABEL_14:
    if (v4 >= 0)
      v13 = a2;
    else
      v13 = *a2;
    __dst = memmove(v3, v13, v5);
  }
LABEL_18:
  v14 = (char *)v3 + v5;
  if (v7)
  {
    if (v6 >= 0)
      v15 = a3;
    else
      v15 = *a3;
    __dst = memmove(v14, v15, v7);
  }
  v14[v7] = 0;
  return __dst;
}

uint64_t sub_2462D5A4C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = MEMORY[0x24BEDB7F0];
  v3 = *MEMORY[0x24BEDB7F0];
  *(_QWORD *)a1 = *MEMORY[0x24BEDB7F0];
  v4 = *(_QWORD *)(v2 + 72);
  *(_QWORD *)(a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 64);
  *(_QWORD *)(a1 + 24) = MEMORY[0x24BEDB848] + 16;
  *(_QWORD *)(a1 + 16) = v4;
  if (*(char *)(a1 + 111) < 0)
    operator delete(*(void **)(a1 + 88));
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x249556D8C](a1 + 128);
  return a1;
}

void sub_2462D5AD4(uint64_t a1@<X0>, unsigned __int16 **a2@<X1>, int a3@<W2>, _QWORD *a4@<X8>)
{
  *a4 = a4 + 2;
  a4[1] = 0x200000000;
  sub_2462D5B4C(a1, a2, (size_t)a4, a3);
  if (*(_BYTE *)(a1 + 177))
    sub_2462D61B8(a1, (uint64_t *)a2, (uint64_t)a4);
}

void sub_2462D5B38(_Unwind_Exception *a1)
{
  uint64_t *v1;

  sub_2462D909C(v1);
  _Unwind_Resume(a1);
}

void sub_2462D5B4C(uint64_t a1, unsigned __int16 **a2, size_t a3, int a4)
{
  unsigned int v8;
  uint64_t v9;
  size_t v10;
  const void *v11;
  void **p_dst;
  uint64_t v13;
  uint64_t v14;
  uint64_t Analyzer;
  unsigned __int16 *v16;
  unsigned __int16 *v17;
  int v18;
  uint64_t v19;
  int v20;
  unint64_t v21;
  char *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  void **v27;
  size_t v28;
  void **v29;
  char v30;
  int v31;
  uint64_t v32;
  BOOL v33;
  size_t v34;
  void **v35;
  char v36;
  void **v37;
  unint64_t v38;
  unsigned __int16 *v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  void **v44;
  _WORD *v45;
  size_t v46;
  char v47;
  uint64_t v48;
  int v49;
  void **v50;
  unsigned __int16 *v51;
  unint64_t v52;
  unsigned __int8 v53;
  uint64_t v54;
  int v55;
  unsigned __int16 *v56;
  unsigned __int16 *v57;
  void **v58;
  int v59;
  size_t v60;
  void *v61[3];
  void *v62[3];
  void **__dst;
  size_t v64;
  int64_t v65;
  void *v66;
  unint64_t v67;
  unsigned __int8 v68;
  _BYTE v69[336];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 8) + 32) & 2) == 0)
    return;
  v8 = *(_DWORD *)(a3 + 8)
     + ((-1431655765 * ((unint64_t)((char *)a2[1] - (char *)*a2) >> 4)) << ((*(_BYTE *)(*(_QWORD *)(a1 + 8) + 32) & 4) != 0));
  if (*(_DWORD *)(a3 + 12) < v8)
    sub_2462D9120((__int128 **)a3, v8);
  morphun::analysis::DefaultAnalyzerFactory::DefaultAnalyzerFactory((morphun::analysis::DefaultAnalyzerFactory *)v69);
  v9 = *(_QWORD *)(a1 + 8);
  v10 = *(_QWORD *)(v9 + 24);
  if (v10 > 0x7FFFFFFFFFFFFFF7)
    sub_2462D3400();
  v11 = *(const void **)(v9 + 16);
  if (v10 >= 0x17)
  {
    v13 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17)
      v13 = v10 | 7;
    v14 = v13 + 1;
    p_dst = (void **)operator new(v13 + 1);
    v64 = v10;
    v65 = v14 | 0x8000000000000000;
    __dst = p_dst;
  }
  else
  {
    HIBYTE(v65) = *(_QWORD *)(v9 + 24);
    p_dst = (void **)&__dst;
    if (!v10)
      goto LABEL_12;
  }
  memmove(p_dst, v11, v10);
LABEL_12:
  *((_BYTE *)p_dst + v10) = 0;
  memset(v62, 0, sizeof(v62));
  memset(v61, 0, sizeof(v61));
  morphun::util::ULocale::ULocale();
  Analyzer = morphun::analysis::DefaultAnalyzerFactory::createAnalyzer((morphun::analysis::DefaultAnalyzerFactory *)v69, (const morphun::util::ULocale *)&v66);
  morphun::util::ULocale::~ULocale((morphun::util::ULocale *)&v66);
  v60 = a3;
  if (SHIBYTE(v65) < 0)
    operator delete(__dst);
  v16 = *a2;
  v17 = a2[1];
  if (*a2 != v17)
  {
    v18 = 0;
    v59 = a4;
    while (1)
    {
      v19 = (*(uint64_t (**)(uint64_t, unsigned __int16 *))(*(_QWORD *)Analyzer + 64))(Analyzer, v16);
      (*(void (**)(void **__return_ptr))(*(_QWORD *)v19 + 72))(&v66);
      LOWORD(v61[0]) = 1024;
      v20 = v18 + 1;
      LODWORD(v62[0]) = v18;
      HIDWORD(v62[0]) = v18 + 1;
      if ((*(_BYTE *)(*(_QWORD *)(a1 + 8) + 32) & 4) == 0)
        goto LABEL_75;
      v21 = v68;
      v22 = (char *)&v66;
      if ((v68 & 0x80u) != 0)
      {
        v22 = (char *)v66;
        v21 = v67;
      }
      if (!v21)
        goto LABEL_75;
      v23 = 0;
      v24 = v21;
      while (*(_WORD *)&v22[v23] != 32)
      {
        v23 += 2;
        if (!--v24)
          goto LABEL_75;
      }
      if (v23 == -2)
      {
LABEL_75:
        if (!a4)
          goto LABEL_89;
        goto LABEL_76;
      }
      __dst = 0;
      v64 = 0;
      v65 = 0;
      if (v21 > 0x7FFFFFFFFFFFFFF7)
        sub_2462D3400();
      if (v21 >= 0xB)
        break;
LABEL_42:
      v38 = v68;
      if ((v68 & 0x80u) == 0)
        v39 = (unsigned __int16 *)&v66;
      else
        v39 = (unsigned __int16 *)v66;
      if ((v68 & 0x80u) != 0)
        v38 = v67;
      if (v38)
      {
        v40 = 2 * v38;
        while (1)
        {
          v41 = *v39;
          if (v41 != 32)
            break;
LABEL_58:
          ++v39;
          v40 -= 2;
          if (!v40)
            goto LABEL_59;
        }
        if (SHIBYTE(v65) < 0)
        {
          v43 = v64;
          v42 = (v65 & 0x7FFFFFFFFFFFFFFFLL) - 1;
          if (v64 == v42)
          {
LABEL_54:
            sub_2462D7374((uint64_t)&__dst, v42, 1uLL, v42, v42, 0, 0);
            v43 = v42;
          }
          v44 = __dst;
          v64 = v43 + 1;
        }
        else
        {
          if (HIBYTE(v65) == 10)
          {
            v42 = 10;
            goto LABEL_54;
          }
          v43 = HIBYTE(v65);
          HIBYTE(v65) = (HIBYTE(v65) + 1) & 0x7F;
          v44 = (void **)&__dst;
        }
        v45 = (_WORD *)v44 + v43;
        *v45 = v41;
        v45[1] = 0;
        goto LABEL_58;
      }
LABEL_59:
      a4 = v59;
      if (!v59)
      {
LABEL_73:
        sub_2462D6A00(v60, (uint64_t *)&__dst, (uint64_t *)v62, (__int16 *)v61);
        v47 = HIBYTE(v65);
        goto LABEL_74;
      }
      v46 = HIBYTE(v65);
      v47 = HIBYTE(v65);
      if (v65 < 0)
        v46 = v64;
      v48 = *((unsigned __int8 *)v16 + 23);
      v49 = (char)v48;
      if ((v48 & 0x80u) != 0)
        v48 = *((_QWORD *)v16 + 1);
      if (v46 == v48)
      {
        if (!v46)
          goto LABEL_73;
        v50 = __dst;
        if (v65 >= 0)
          v50 = (void **)&__dst;
        if (v49 >= 0)
          v51 = v16;
        else
          v51 = *(unsigned __int16 **)v16;
        while (*v51 == *(unsigned __int16 *)v50)
        {
          v50 = (void **)((char *)v50 + 2);
          ++v51;
          if (!--v46)
            goto LABEL_73;
        }
      }
LABEL_74:
      if ((v47 & 0x80) == 0)
        goto LABEL_75;
      operator delete(__dst);
      if (!v59)
        goto LABEL_89;
LABEL_76:
      v52 = v68;
      v53 = v68;
      if ((v68 & 0x80u) != 0)
        v52 = v67;
      v54 = *((unsigned __int8 *)v16 + 23);
      v55 = (char)v54;
      if ((v54 & 0x80u) != 0)
        v54 = *((_QWORD *)v16 + 1);
      if (v52 != v54)
        goto LABEL_90;
      if (v52)
      {
        v56 = (unsigned __int16 *)v66;
        if ((v68 & 0x80u) == 0)
          v56 = (unsigned __int16 *)&v66;
        if (v55 >= 0)
          v57 = v16;
        else
          v57 = *(unsigned __int16 **)v16;
        while (*v57 == *v56)
        {
          ++v56;
          ++v57;
          if (!--v52)
            goto LABEL_89;
        }
        goto LABEL_90;
      }
LABEL_89:
      sub_2462D6A00(v60, (uint64_t *)&v66, (uint64_t *)v62, (__int16 *)v61);
      v53 = v68;
LABEL_90:
      if ((v53 & 0x80) != 0)
        operator delete(v66);
      (*(void (**)(uint64_t))(*(_QWORD *)v19 + 16))(v19);
      v16 += 24;
      v18 = v20;
      if (v16 == v17)
        goto LABEL_96;
    }
    if ((v21 | 3) == 0xB)
    {
      v25 = v21 & 0xFFFFFFFFFFFFFFFCLL;
      v26 = v25 + 5;
      if (v25 < 7)
      {
        v27 = 0;
        v28 = 0;
        v29 = (void **)&__dst;
        v30 = 1;
        v31 = 1;
        goto LABEL_34;
      }
    }
    else
    {
      v26 = (v21 | 3) + 1;
    }
    v29 = (void **)sub_2462D7494((uint64_t)&__dst, v26);
    v26 = v32;
    v30 = 0;
    if (SHIBYTE(v65) < 0)
    {
      v31 = 1;
      v27 = __dst;
      v28 = v64;
    }
    else
    {
      v31 = 0;
      v28 = HIBYTE(v65);
      v27 = (void **)&__dst;
    }
LABEL_34:
    v33 = __CFADD__(v28, 1);
    v34 = v28 + 1;
    if (v33)
    {
      if (v31)
        goto LABEL_40;
    }
    else
    {
      v35 = v29;
      v58 = v29;
      v36 = v30;
      v37 = v27;
      memmove(v35, v27, 2 * v34);
      v27 = v37;
      v30 = v36;
      v29 = v58;
      if (v31)
      {
LABEL_40:
        operator delete(v27);
        if ((v30 & 1) != 0)
        {
LABEL_38:
          HIBYTE(v65) = 0;
          goto LABEL_42;
        }
        goto LABEL_41;
      }
    }
    if ((v30 & 1) != 0)
      goto LABEL_38;
LABEL_41:
    v64 = 0;
    v65 = v26 | 0x8000000000000000;
    __dst = v29;
    goto LABEL_42;
  }
LABEL_96:
  morphun::analysis::DefaultAnalyzerFactory::~DefaultAnalyzerFactory((morphun::analysis::DefaultAnalyzerFactory *)v69);
}

void sub_2462D60F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36,void *a37,uint64_t a38,int a39,__int16 a40,char a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56)
{
  morphun::util::ULocale::~ULocale((morphun::util::ULocale *)&a37);
  if (a18 < 0)
    operator delete(__p);
  if (a24 < 0)
    operator delete(a19);
  if (a30 < 0)
    operator delete(a25);
  if (a36 < 0)
    operator delete(a31);
  morphun::analysis::DefaultAnalyzerFactory::~DefaultAnalyzerFactory((morphun::analysis::DefaultAnalyzerFactory *)&a56);
  _Unwind_Resume(a1);
}

void sub_2462D61B8(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  CFIndex v8;
  const UniChar *v9;
  CFIndex v10;
  const UniChar *v11;
  const __CFString *v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;

  if (!*(_QWORD *)(a1 + 144))
  {
    CFStringCreateWithCharacters(0, **(const UniChar ***)(a1 + 8), *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8));
    *(_QWORD *)(a1 + 144) = CEMCreateEmojiLocaleData();
  }
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v14 = 1280;
  v6 = *a2;
  v7 = a2[1];
  if (*a2 != v7)
  {
    do
    {
      if (*(char *)(v6 + 23) < 0)
      {
        v9 = *(const UniChar **)v6;
        v8 = *(_QWORD *)(v6 + 8);
      }
      else
      {
        v8 = *(unsigned __int8 *)(v6 + 23);
        v9 = (const UniChar *)v6;
      }
      CFStringCreateWithCharacters(0, v9, v8);
      if (CEMStringIsSingleEmoji())
      {
        LODWORD(v13) = *((_DWORD *)v16 + 6);
        HIDWORD(v13) = v13 + 1;
        sub_2462D6AE0(a3, (__int128 *)v6, &v13, &v14);
      }
      else
      {
        if (*(char *)(v6 + 23) < 0)
        {
          v11 = *(const UniChar **)v6;
          v10 = *(_QWORD *)(v6 + 8);
        }
        else
        {
          v10 = *(unsigned __int8 *)(v6 + 23);
          v11 = (const UniChar *)v6;
        }
        v12 = CFStringCreateWithCharacters(0, v11, v10);
        CFStringGetLength(v12);
        CEMEmojiLocaleDataEnumerateSearchResultsInStringWithBlock();
      }
      ++*((_DWORD *)v16 + 6);
      v6 += 48;
    }
    while (v6 != v7);
  }
  _Block_object_dispose(&v15, 8);
}

void sub_2462D6350(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2462D6374(uint64_t a1@<X1>, __int128 ***a2@<X2>, _QWORD *a3@<X8>)
{
  __int128 **v5;
  __int128 **v6;
  uint64_t v7;
  _WORD *v9;
  uint64_t v10;
  unint64_t v11;
  _WORD *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _WORD *v19;
  _WORD *v20;
  __int16 v21;
  __int128 *v22;
  __int128 *v23;
  unsigned int v24;
  __int128 *v25;
  __int128 v26;
  char *v27;
  __int16 v28;
  uint64_t v29;
  __int128 **v30;
  __int128 __dst;
  uint64_t v32;

  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  v6 = *a2;
  v5 = a2[1];
  v7 = (char *)v5 - (char *)*a2;
  if (v5 == *a2)
  {
    v9 = 0;
  }
  else
  {
    if (v7 < 0)
      sub_2462D357C();
    v9 = sub_2462D7E54(v7 >> 5);
    *a3 = v9;
    a3[1] = v9;
    a3[2] = &v9[v10];
    v6 = *a2;
    v5 = a2[1];
  }
  if (v6 != v5)
  {
    v30 = v5;
    do
    {
      v11 = a3[2];
      if ((unint64_t)v9 >= v11)
      {
        v12 = (_WORD *)*a3;
        v13 = (uint64_t)v9 - *a3;
        if (v13 <= -3)
          sub_2462D357C();
        v14 = v13 >> 1;
        v15 = v11 - (_QWORD)v12;
        if (v15 <= (v13 >> 1) + 1)
          v16 = v14 + 1;
        else
          v16 = v15;
        if (v15 >= 0x7FFFFFFFFFFFFFFELL)
          v17 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v17 = v16;
        if (v17)
          v17 = (uint64_t)sub_2462D7E54(v17);
        else
          v18 = 0;
        v19 = (_WORD *)(v17 + 2 * v14);
        *v19 = *((_WORD *)v6 + 12);
        v20 = v19 + 1;
        if (v9 != v12)
        {
          do
          {
            v21 = *--v9;
            *--v19 = v21;
          }
          while (v9 != v12);
          v9 = (_WORD *)*a3;
        }
        *a3 = v19;
        a3[1] = v20;
        a3[2] = v17 + 2 * v18;
        if (v9)
          operator delete(v9);
        v9 = v20;
      }
      else
      {
        *v9++ = *((_WORD *)v6 + 12);
      }
      a3[1] = v9;
      v22 = *v6;
      v23 = v6[1];
      if (*v6 != v23)
      {
        v24 = *(_DWORD *)(a1 + 8);
        do
        {
          if (v24 == *(_DWORD *)(a1 + 12))
          {
            sub_2462D9120((__int128 **)a1, v24 + (v24 >> 1) + 1);
            v24 = *(_DWORD *)(a1 + 8);
          }
          v25 = *(__int128 **)a1;
          if (*((char *)v22 + 23) < 0)
          {
            sub_2462D7540(&__dst, *(void **)v22, *((_QWORD *)v22 + 1));
          }
          else
          {
            v26 = *v22;
            v32 = *((_QWORD *)v22 + 2);
            __dst = v26;
          }
          v27 = (char *)v25 + 40 * v24;
          v28 = *((_WORD *)v6 + 12);
          v29 = v32;
          *(_OWORD *)v27 = __dst;
          *((_QWORD *)v27 + 2) = v29;
          *((_QWORD *)v27 + 3) = 0x100000000;
          *((_WORD *)v27 + 16) = v28;
          v24 = *(_DWORD *)(a1 + 8) + 1;
          *(_DWORD *)(a1 + 8) = v24;
          v22 += 3;
        }
        while (v22 != v23);
      }
      v6 += 4;
    }
    while (v6 != v30);
  }
}

void sub_2462D656C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v2;

  if (v2)
  {
    *(_QWORD *)(v1 + 8) = v2;
    operator delete(v2);
  }
  _Unwind_Resume(exception_object);
}

void sub_2462D6598(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  unint64_t v21;
  unsigned int v22;
  __int128 *v23;
  __int128 v24;
  char *v25;
  uint64_t v26;
  NSObject *v27;
  id obj;
  void *v29;
  uint64_t v30;
  uint64_t v32;
  void *__p[2];
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[16];
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = v4;
    v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v38, v42, 16);
    if (v7)
    {
      LODWORD(v10) = 0;
      v29 = v5;
      v30 = *(_QWORD *)v39;
      do
      {
        v32 = v7;
        v11 = 0;
        v12 = v10;
        do
        {
          if (*(_QWORD *)v39 != v30)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v11);
          v35 = 0;
          v36 = 0;
          v37 = 0;
          objc_msgSend_phoneSequence(v13, v8, v9);
          v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v17 = (char *)objc_msgSend_UTF8String(v14, v15, v16);
          sub_2462D7A34(__p, v17);

          sub_2462D4D04(a1, &v35, (uint64_t)__p, 0x20u, -1);
          v19 = v35;
          v18 = v36;
          v20 = *(_DWORD *)(a2 + 8) - 1431655765 * ((unint64_t)(v36 - v35) >> 3);
          if (*(_DWORD *)(a2 + 12) < v20)
          {
            sub_2462D9120((__int128 **)a2, v20);
            v19 = v35;
            v18 = v36;
          }
          v10 = v12 + 1;
          if (v19 != v18)
          {
            v21 = v12 | (unint64_t)(v10 << 32);
            v22 = *(_DWORD *)(a2 + 8);
            do
            {
              if (v22 == *(_DWORD *)(a2 + 12))
              {
                sub_2462D9120((__int128 **)a2, v22 + (v22 >> 1) + 1);
                v22 = *(_DWORD *)(a2 + 8);
              }
              v23 = *(__int128 **)a2;
              if (*(char *)(v19 + 23) < 0)
              {
                sub_2462D7540(buf, *(void **)v19, *(_QWORD *)(v19 + 8));
              }
              else
              {
                v24 = *(_OWORD *)v19;
                v44 = *(_QWORD *)(v19 + 16);
                *(_OWORD *)buf = v24;
              }
              v25 = (char *)v23 + 40 * v22;
              v26 = v44;
              *(_OWORD *)v25 = *(_OWORD *)buf;
              *((_QWORD *)v25 + 2) = v26;
              *((_QWORD *)v25 + 3) = v21;
              *((_WORD *)v25 + 16) = 1792;
              v22 = *(_DWORD *)(a2 + 8) + 1;
              *(_DWORD *)(a2 + 8) = v22;
              v19 += 24;
            }
            while (v19 != v18);
          }
          if (v34 < 0)
            operator delete(__p[0]);
          *(_QWORD *)buf = &v35;
          sub_2462D7E84((void ***)buf);
          ++v11;
          v12 = v10;
          v5 = v29;
        }
        while (v11 != v32);
        v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v38, v42, 16);
      }
      while (v7);
    }

  }
  else
  {
    v27 = qword_25441F958;
    if (os_log_type_enabled((os_log_t)qword_25441F958, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "append_dynamic_phonetic_aliases";
      _os_log_error_impl(&dword_2462C4000, v27, OS_LOG_TYPE_ERROR, "%s Empty ASR phone sequence found", buf, 0xCu);
    }
  }

}

void sub_2462D6850(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21)
{

  _Unwind_Resume(a1);
}

void sub_2462D68BC(uint64_t a1, size_t a2, __int128 **a3)
{
  __int128 *v5;
  __int128 *v6;
  unsigned int v7;
  unsigned int v8;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *__p[2];
  char v15;
  uint64_t v16;
  __int16 v17;

  v5 = *a3;
  v6 = a3[1];
  v7 = *(_DWORD *)(a2 + 12);
  v8 = *(_DWORD *)(a2 + 8) - 1431655765 * ((unint64_t)((char *)v6 - (char *)*a3) >> 4);
  if (v7 < v8)
  {
    sub_2462D9120((__int128 **)a2, v8);
    v5 = *a3;
    v6 = a3[1];
  }
  v17 = 1536;
  if (v5 != v6)
  {
    v10 = 0;
    do
    {
      v11 = v10 + 1;
      LODWORD(v16) = v10;
      HIDWORD(v16) = v10 + 1;
      v12 = *(_QWORD *)(a1 + 216);
      if (v12)
      {
        v13 = (*(uint64_t (**)(uint64_t, __int128 *))(*(_QWORD *)v12 + 64))(v12, v5);
        (*(void (**)(void **__return_ptr))(*(_QWORD *)v13 + 72))(__p);
        sub_2462D6A00(a2, (uint64_t *)__p, &v16, &v17);
        if (v15 < 0)
          operator delete(__p[0]);
        (*(void (**)(uint64_t))(*(_QWORD *)v13 + 16))(v13);
      }
      else
      {
        sub_2462D6AE0(a2, v5, &v16, &v17);
      }
      v5 += 3;
      v10 = v11;
    }
    while (v5 != v6);
  }
}

void sub_2462D69CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;

  (*(void (**)(uint64_t))(*(_QWORD *)v15 + 16))(v15);
  _Unwind_Resume(a1);
}

size_t sub_2462D6A00(size_t result, uint64_t *a2, uint64_t *a3, __int16 *a4)
{
  size_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  __int16 v13;
  __int128 v14;

  v7 = result;
  v8 = *(_DWORD *)(result + 8);
  if (v8 == *(_DWORD *)(result + 12))
  {
    result = sub_2462D9120((__int128 **)result, v8 + (v8 >> 1) + 1);
    v8 = *(_DWORD *)(v7 + 8);
  }
  v9 = *(_QWORD *)v7 + 40 * v8;
  v10 = *a2;
  *(_QWORD *)&v14 = a2[1];
  *(_QWORD *)((char *)&v14 + 7) = *(uint64_t *)((char *)a2 + 15);
  v11 = *((_BYTE *)a2 + 23);
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  v12 = *a3;
  v13 = *a4;
  *(_QWORD *)v9 = v10;
  *(_QWORD *)(v9 + 8) = v14;
  *(_QWORD *)(v9 + 15) = *(_QWORD *)((char *)&v14 + 7);
  *(_BYTE *)(v9 + 23) = v11;
  *(_QWORD *)(v9 + 24) = v12;
  *(_WORD *)(v9 + 32) = v13;
  ++*(_DWORD *)(v7 + 8);
  return result;
}

double sub_2462D6AE0(uint64_t a1, __int128 *a2, uint64_t *a3, __int16 *a4)
{
  unsigned int v8;
  __int128 *v9;
  char *v10;
  uint64_t v11;
  __int16 v12;
  double result;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;

  v8 = *(_DWORD *)(a1 + 8);
  if (v8 == *(_DWORD *)(a1 + 12))
  {
    sub_2462D9120((__int128 **)a1, v8 + (v8 >> 1) + 1);
    v8 = *(_DWORD *)(a1 + 8);
  }
  v9 = *(__int128 **)a1;
  if (*((char *)a2 + 23) < 0)
  {
    sub_2462D7540(&v15, *(void **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v15 = *a2;
    v16 = *((_QWORD *)a2 + 2);
  }
  v10 = (char *)v9 + 40 * v8;
  v11 = *a3;
  v12 = *a4;
  result = *(double *)&v15;
  v14 = v16;
  *(_OWORD *)v10 = v15;
  *((_QWORD *)v10 + 2) = v14;
  *((_QWORD *)v10 + 3) = v11;
  *((_WORD *)v10 + 16) = v12;
  ++*(_DWORD *)(a1 + 8);
  return result;
}

CFIndex sub_2462D6BA0(uint64_t a1, CFArrayRef theArray)
{
  CFIndex result;
  CFIndex i;
  uint64_t v6;
  const __CFString *String;
  CFIndex Length;
  UniChar *p_p;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  char v14;
  __int16 v15;
  uint64_t v16;
  void *__p;
  __int128 v18;
  _QWORD v19[3];
  CFRange v20;

  v19[2] = *MEMORY[0x24BDAC8D0];
  result = CFArrayGetCount(theArray);
  if (result >= 1)
  {
    for (i = 0; i < result; ++i)
    {
      if (CFArrayGetValueAtIndex(theArray, i))
      {
        v6 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
        String = (const __CFString *)CEMEmojiTokenGetString();
        __p = 0;
        v18 = 0uLL;
        Length = CFStringGetLength(String);
        sub_2462D7264((uint64_t)&__p, Length, 0);
        if (v18 >= 0)
          p_p = (UniChar *)&__p;
        else
          p_p = (UniChar *)__p;
        v20.location = 0;
        v20.length = Length;
        CFStringGetCharacters(String, v20, p_p);
        v10 = *(_QWORD *)(a1 + 40);
        v11 = *(_DWORD *)(v10 + 8);
        if (v11 == *(_DWORD *)(v10 + 12))
        {
          sub_2462D9120(*(__int128 ***)(a1 + 40), v11 + (v11 >> 1) + 1);
          v11 = *(_DWORD *)(v10 + 8);
        }
        v12 = *(_QWORD *)v10 + 40 * v11;
        v13 = __p;
        v19[0] = v18;
        *(_QWORD *)((char *)v19 + 7) = *(_QWORD *)((char *)&v18 + 7);
        v14 = HIBYTE(v18);
        v18 = 0uLL;
        __p = 0;
        v15 = *(_WORD *)(a1 + 48);
        *(_QWORD *)(v12 + 15) = *(_QWORD *)((char *)v19 + 7);
        v16 = v19[0];
        *(_QWORD *)v12 = v13;
        *(_QWORD *)(v12 + 8) = v16;
        *(_BYTE *)(v12 + 23) = v14;
        *(_QWORD *)(v12 + 24) = v6 | ((unint64_t)(v6 + 1) << 32);
        *(_WORD *)(v12 + 32) = v15;
        ++*(_DWORD *)(v10 + 8);
        if (SHIBYTE(v18) < 0)
          operator delete(__p);
      }
      result = CFArrayGetCount(theArray);
    }
  }
  return result;
}

void sub_2462D6D44(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_2462D6D68(uint64_t a1, unsigned __int16 **a2)
{
  unsigned __int16 *v3;
  unsigned __int16 *v4;
  unint64_t v5;
  uint64_t v6;
  void **v7;
  char v9;
  char v10;

  v3 = *a2;
  v4 = a2[1];
  v5 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (((char *)v4 - (char *)v3) >> 3));
  if (v4 == v3)
    v6 = 0;
  else
    v6 = v5;
  sub_2462D7F10((uint64_t)v3, v4, (uint64_t)&v9, v6, 1);
  v7 = sub_2462D8E78(*a2, a2[1], (uint64_t)&v10);
  return sub_2462D6DE0((uint64_t)a2, (uint64_t)v7, (__int128 *)a2[1]);
}

uint64_t sub_2462D6DE0(uint64_t a1, uint64_t a2, __int128 *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;

  if ((__int128 *)a2 != a3)
  {
    sub_2462D8FDC((uint64_t)&v9, a3, *(__int128 **)(a1 + 8), a2);
    v6 = v5;
    v7 = *(_QWORD *)(a1 + 8);
    if (v7 != v5)
    {
      do
      {
        if (*(char *)(v7 - 1) < 0)
          operator delete(*(void **)(v7 - 24));
        v7 -= 24;
      }
      while (v7 != v6);
    }
    *(_QWORD *)(a1 + 8) = v6;
  }
  return a2;
}

void sub_2462D6E64()
{
  JUMPOUT(0x249556DC8);
}

void sub_2462D6E78(uint64_t a1, _QWORD *a2, unint64_t a3)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v7;

  v3 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a2[1] - *a2) >> 4);
  v4 = v3 - a3;
  if (v3 > a3)
  {
    v7 = 48 * a3;
    do
    {
      sub_2462D6EE4(*(_QWORD *)(a1 + 8), *a2 + v7);
      v7 += 48;
      --v4;
    }
    while (v4);
  }
}

float sub_2462D6EE4(uint64_t a1, uint64_t a2)
{
  int v3;
  skit::internal *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  unsigned __int16 *v10;
  float result;

  v3 = *(char *)(a2 + 23);
  if (v3 >= 0)
    v4 = (skit::internal *)a2;
  else
    v4 = *(skit::internal **)a2;
  if (v3 >= 0)
    v5 = *(unsigned __int8 *)(a2 + 23);
  else
    v5 = *(_QWORD *)(a2 + 8);
  v6 = *(_QWORD *)(a1 + 24);
  if (v5)
  {
    v8 = *(__int16 *)(*(_QWORD *)(a1 + 8)
                    + 2
                    * (*(_DWORD *)(a1 + 16) & skit::internal::murmur3_32(v4, (const unsigned __int8 *)(2 * v5))));
    if ((v8 & 0x8000000000000000) == 0)
    {
      v9 = *(_QWORD *)a1 + 24 * (int)v8;
      if (*(_QWORD *)(v9 + 8) == v5)
      {
        v10 = *(unsigned __int16 **)v9;
        while (*(unsigned __int16 *)v4 == *v10)
        {
          ++v10;
          v4 = (skit::internal *)((char *)v4 + 2);
          if (!--v5)
          {
            v6 = *(_QWORD *)a1 + 24 * v8;
            break;
          }
        }
      }
    }
  }
  result = *(float *)(v6 + 16) * *(float *)(a2 + 32);
  *(float *)(a2 + 32) = result;
  *(_WORD *)(a2 + 40) = (*(_WORD *)(a2 + 40) | *(_WORD *)(v6 + 20) & 4) & (*(_WORD *)(v6 + 20) | 0xFFFE);
  return result;
}

void sub_2462D6FCC()
{
  JUMPOUT(0x249556DC8);
}

uint64_t sub_2462D6FE0(uint64_t result, _QWORD *a2, unint64_t a3)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;

  v3 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a2[1] - *a2) >> 4);
  v4 = v3 - a3;
  if (v3 > a3)
  {
    v6 = result;
    v7 = 48 * a3;
    do
    {
      result = sub_2462D70B0(v6, (uint64_t *)(*a2 + v7));
      v7 += 48;
      --v4;
    }
    while (v4);
  }
  return result;
}

BOOL sub_2462D704C(uint64_t a1, unsigned __int16 *a2, uint64_t a3)
{
  return a3 == 1 && *a2 - 97 < 0x1A;
}

void sub_2462D7074()
{
  JUMPOUT(0x249556DC8);
}

BOOL sub_2462D708C(uint64_t a1, unsigned __int16 *a2, uint64_t a3)
{
  return a3 == 1 && *a2 - 97 < 0x1A;
}

uint64_t sub_2462D70B0(uint64_t a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v2 = a2;
  v3 = a2[1];
  if (*((char *)a2 + 23) >= 0)
  {
    v4 = *((unsigned __int8 *)a2 + 23);
  }
  else
  {
    a2 = (uint64_t *)*a2;
    v4 = v3;
  }
  result = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)a1 + 24))(a1, a2, v4);
  if ((_DWORD)result)
  {
    *((_DWORD *)v2 + 8) = 1056964608;
    *((_WORD *)v2 + 20) |= 4u;
  }
  return result;
}

void sub_2462D7108()
{
  JUMPOUT(0x249556DC8);
}

uint64_t sub_2462D711C(uint64_t result, _QWORD *a2, unint64_t a3)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;

  v3 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a2[1] - *a2) >> 4);
  v4 = v3 - a3;
  if (v3 > a3)
  {
    v6 = result;
    v7 = 48 * a3;
    do
    {
      result = sub_2462D70B0(v6, (uint64_t *)(*a2 + v7));
      v7 += 48;
      --v4;
    }
    while (v4);
  }
  return result;
}

uint64_t sub_2462D7188(uint64_t a1, unsigned __int16 *a2, uint64_t a3)
{
  unsigned int v3;
  uint64_t result;

  if (a3 != 1)
    return 0;
  v3 = *a2;
  result = 1;
  if (v3 <= 0xD6)
  {
    if (v3 == 43 || v3 == 61)
      return result;
    return 0;
  }
  if (v3 != 215 && v3 != 247)
    return 0;
  return result;
}

void sub_2462D71D0()
{
  JUMPOUT(0x249556DC8);
}

uint64_t sub_2462D71E8(uint64_t a1, unsigned __int16 *a2, uint64_t a3)
{
  unsigned int v3;
  uint64_t result;

  if (a3 != 1)
    return 0;
  v3 = *a2;
  result = 1;
  if (v3 <= 0xD6)
  {
    if (v3 == 43 || v3 == 61)
      return result;
    return 0;
  }
  if (v3 != 215 && v3 != 247)
    return 0;
  return result;
}

void sub_2462D722C(uint64_t *a1)
{
  if (*a1)
  {
    sub_2462D37A0(a1);
    operator delete((void *)*a1);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

uint64_t sub_2462D7264(uint64_t result, unint64_t a2, __int16 a3)
{
  unint64_t v3;

  if (*(char *)(result + 23) < 0)
  {
    v3 = *(_QWORD *)(result + 8);
    if (v3 >= a2)
    {
      *(_QWORD *)(result + 8) = a2;
      result = *(_QWORD *)result;
      goto LABEL_7;
    }
    return sub_2462D72A8(result, a2 - v3, a3);
  }
  v3 = *(unsigned __int8 *)(result + 23);
  if (v3 < a2)
    return sub_2462D72A8(result, a2 - v3, a3);
  *(_BYTE *)(result + 23) = a2 & 0x7F;
LABEL_7:
  *(_WORD *)(result + 2 * a2) = 0;
  return result;
}

uint64_t sub_2462D72A8(uint64_t a1, unint64_t a2, __int16 a3)
{
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _WORD *v11;
  unint64_t v12;
  unint64_t v13;

  if (a2)
  {
    LODWORD(v6) = *(char *)(a1 + 23);
    if ((v6 & 0x80000000) != 0)
    {
      v7 = *(_QWORD *)(a1 + 8);
      v9 = *(_QWORD *)(a1 + 16);
      v8 = (v9 & 0x7FFFFFFFFFFFFFFFLL) - 1;
      v6 = HIBYTE(v9);
    }
    else
    {
      v7 = *(unsigned __int8 *)(a1 + 23);
      v8 = 10;
    }
    if (v8 - v7 < a2)
    {
      sub_2462D7374(a1, v8, a2 - v8 + v7, v7, v7, 0, 0);
      *(_QWORD *)(a1 + 8) = v7;
      LOBYTE(v6) = *(_BYTE *)(a1 + 23);
    }
    v10 = a1;
    if ((v6 & 0x80) != 0)
      v10 = *(_QWORD *)a1;
    v11 = (_WORD *)(v10 + 2 * v7);
    v12 = a2;
    do
    {
      *v11++ = a3;
      --v12;
    }
    while (v12);
    v13 = v7 + a2;
    if (*(char *)(a1 + 23) < 0)
      *(_QWORD *)(a1 + 8) = v13;
    else
      *(_BYTE *)(a1 + 23) = v13 & 0x7F;
    *(_WORD *)(v10 + 2 * v13) = 0;
  }
  return a1;
}

void sub_2462D7374(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  char *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;

  if (0x7FFFFFFFFFFFFFF7 - a2 < a3)
    sub_2462D3400();
  v13 = (char *)a1;
  if (*(char *)(a1 + 23) < 0)
    v13 = *(char **)a1;
  v14 = a3 + a2;
  if (a3 + a2 <= 2 * a2)
    v14 = 2 * a2;
  v15 = (v14 & 0xFFFFFFFFFFFFFFFCLL) + 4;
  if ((v14 | 3) != 0xB)
    v15 = v14 | 3;
  if (v14 >= 0xB)
    v16 = v15 + 1;
  else
    v16 = 11;
  if (a2 <= 0x3FFFFFFFFFFFFFF2)
    v17 = v16;
  else
    v17 = 0x7FFFFFFFFFFFFFF7;
  v18 = (char *)sub_2462D7494(a1, v17);
  v19 = v18;
  v21 = v20;
  if (a5)
    memmove(v18, v13, 2 * a5);
  if (a4 != a6 + a5)
    memmove(&v19[2 * a5 + 2 * a7], &v13[2 * a5 + 2 * a6], 2 * (a4 - (a6 + a5)));
  if (a2 != 10)
    operator delete(v13);
  *(_QWORD *)a1 = v19;
  *(_QWORD *)(a1 + 16) = v21 | 0x8000000000000000;
}

void *sub_2462D7494(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
    sub_2462D3488();
  return operator new(2 * a2);
}

uint64_t sub_2462D74C4(uint64_t a1, __int128 *a2)
{
  __int128 v4;
  uint64_t v5;

  if (*((char *)a2 + 23) < 0)
  {
    sub_2462D7540(&v4, *(void **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v4 = *a2;
    v5 = *((_QWORD *)a2 + 2);
  }
  *(_OWORD *)a1 = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0x100003F800000;
  *(_WORD *)(a1 + 40) = 3;
  *(_DWORD *)(a1 + 44) = 0;
  return a1;
}

void *sub_2462D7540(_BYTE *__dst, void *__src, unint64_t a3)
{
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;

  v5 = __dst;
  if (a3 > 0xA)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8)
      sub_2462D3400();
    v6 = (a3 & 0xFFFFFFFFFFFFFFFCLL) + 4;
    if ((a3 | 3) != 0xB)
      v6 = a3 | 3;
    v7 = sub_2462D7494((uint64_t)__dst, v6 + 1);
    v5[1] = a3;
    v5[2] = v8 | 0x8000000000000000;
    *v5 = v7;
    v5 = v7;
  }
  else
  {
    __dst[23] = a3;
  }
  return memmove(v5, __src, 2 * a3 + 2);
}

uint64_t sub_2462D75D0(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = sub_2462D7688((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *sub_2462D7644(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556)
    sub_2462D3488();
  return operator new(48 * a2);
}

uint64_t sub_2462D7688(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  _QWORD v13[3];
  char v14;
  __int128 v15;
  __int128 v16;

  v7 = a7;
  *(_QWORD *)&v16 = a6;
  *((_QWORD *)&v16 + 1) = a7;
  v15 = v16;
  v13[0] = a1;
  v13[1] = &v15;
  v13[2] = &v16;
  if (a3 != a5)
  {
    v9 = a7;
    do
    {
      v10 = *(_OWORD *)(a3 - 48);
      *(_QWORD *)(v9 - 32) = *(_QWORD *)(a3 - 32);
      *(_OWORD *)(v9 - 48) = v10;
      *(_QWORD *)(a3 - 40) = 0;
      *(_QWORD *)(a3 - 32) = 0;
      *(_QWORD *)(a3 - 48) = 0;
      v11 = *(_OWORD *)(a3 - 24);
      *(_QWORD *)(v9 - 8) = *(_QWORD *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v11;
      v9 -= 48;
      v7 -= 48;
      a3 -= 48;
    }
    while (a3 != a5);
    *((_QWORD *)&v16 + 1) = v9;
  }
  v14 = 1;
  sub_2462D7734((uint64_t)v13);
  return a6;
}

uint64_t sub_2462D7734(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    sub_2462D7768(a1);
  return a1;
}

void sub_2462D7768(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0)
      operator delete(*(void **)v1);
    v1 += 48;
  }
}

uint64_t sub_2462D77AC(uint64_t a1)
{
  sub_2462D77E0(a1, *(void ***)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void sub_2462D77E0(uint64_t a1, void **a2)
{
  void **v2;
  void **v5;

  v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      v5 = v2 - 6;
      *(_QWORD *)(a1 + 16) = v2 - 6;
      if (*((char *)v2 - 25) < 0)
      {
        operator delete(*v5);
        v5 = *(void ***)(a1 + 16);
      }
      v2 = v5;
    }
    while (v5 != a2);
  }
}

void **sub_2462D7834(void **__dst, void *__src, unint64_t a3)
{
  unint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;

  LODWORD(v6) = *((char *)__dst + 23);
  if ((v6 & 0x80000000) != 0)
  {
    v10 = (unint64_t)__dst[2];
    v9 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (v9 < a3)
    {
      v8 = (uint64_t)__dst[1];
      goto LABEL_6;
    }
    v6 = HIBYTE(v10);
    v7 = *__dst;
  }
  else
  {
    v7 = __dst;
    if (a3 > 0xA)
    {
      v8 = *((unsigned __int8 *)__dst + 23);
      v9 = 10;
LABEL_6:
      sub_2462D78F0((uint64_t)__dst, v9, a3 - v9, v8, 0, v8, a3, __src);
      return __dst;
    }
  }
  if (a3)
  {
    memmove(v7, __src, 2 * a3);
    LOBYTE(v6) = *((_BYTE *)__dst + 23);
  }
  if ((v6 & 0x80) != 0)
    __dst[1] = (void *)a3;
  else
    *((_BYTE *)__dst + 23) = a3 & 0x7F;
  *((_WORD *)v7 + a3) = 0;
  return __dst;
}

void sub_2462D78F0(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, const void *a8)
{
  char *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _WORD *v20;
  _WORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  if (0x7FFFFFFFFFFFFFF6 - a2 < a3)
    sub_2462D3400();
  v15 = (char *)a1;
  if (*(char *)(a1 + 23) < 0)
    v15 = *(char **)a1;
  v16 = a3 + a2;
  if (a3 + a2 <= 2 * a2)
    v16 = 2 * a2;
  v17 = (v16 & 0xFFFFFFFFFFFFFFFCLL) + 4;
  if ((v16 | 3) != 0xB)
    v17 = v16 | 3;
  if (v16 >= 0xB)
    v18 = v17 + 1;
  else
    v18 = 11;
  if (a2 > 0x3FFFFFFFFFFFFFF2)
    v19 = 0x7FFFFFFFFFFFFFF7;
  else
    v19 = v18;
  v20 = sub_2462D7494(a1, v19);
  v21 = v20;
  v23 = v22;
  if (a5)
    memmove(v20, v15, 2 * a5);
  if (a7)
    memmove(&v21[a5], a8, 2 * a7);
  v24 = a4 - (a6 + a5);
  if (v24)
    memmove(&v21[a5 + a7], &v15[2 * a5 + 2 * a6], 2 * v24);
  if (a2 != 10)
    operator delete(v15);
  v25 = a7 + a5 + v24;
  *(_QWORD *)a1 = v21;
  *(_QWORD *)(a1 + 8) = v25;
  *(_QWORD *)(a1 + 16) = v23 | 0x8000000000000000;
  v21[v25] = 0;
}

_QWORD *sub_2462D7A34(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    sub_2462D3400();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void *sub_2462D7AE4(unint64_t a1)
{
  if (a1 >= 0xAAAAAAAAAAAAAABLL)
    sub_2462D3488();
  return operator new(24 * a1);
}

uint64_t sub_2462D7B28(uint64_t a1)
{
  void **v2;
  void **v3;
  void **v4;

  v3 = *(void ***)(a1 + 8);
  v2 = *(void ***)(a1 + 16);
  if (v2 != v3)
  {
    do
    {
      v4 = v2 - 3;
      *(_QWORD *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v4);
        v4 = *(void ***)(a1 + 16);
      }
      v2 = v4;
    }
    while (v4 != v3);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t sub_2462D7B88(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = sub_2462D7C40((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *sub_2462D7BFC(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    sub_2462D3488();
  return operator new(24 * a2);
}

uint64_t sub_2462D7C40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v9;
  __int128 v10;
  _QWORD v12[3];
  char v13;
  __int128 v14;
  __int128 v15;

  v7 = a7;
  *(_QWORD *)&v15 = a6;
  *((_QWORD *)&v15 + 1) = a7;
  v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 != a5)
  {
    v9 = a7;
    do
    {
      v10 = *(_OWORD *)(a3 - 24);
      *(_QWORD *)(v9 - 8) = *(_QWORD *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24;
      *(_QWORD *)(a3 - 16) = 0;
      *(_QWORD *)(a3 - 8) = 0;
      *(_QWORD *)(a3 - 24) = 0;
      v7 -= 24;
      a3 -= 24;
    }
    while (a3 != a5);
    *((_QWORD *)&v15 + 1) = v9;
  }
  v13 = 1;
  sub_2462D7CDC((uint64_t)v12);
  return a6;
}

uint64_t sub_2462D7CDC(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    sub_2462D7D10(a1);
  return a1;
}

void sub_2462D7D10(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0)
      operator delete(*(void **)v1);
    v1 += 24;
  }
}

uint64_t sub_2462D7D54(uint64_t a1)
{
  sub_2462D7D88(a1, *(void ***)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void sub_2462D7D88(uint64_t a1, void **a2)
{
  void **v2;
  void **v5;

  v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      v5 = v2 - 3;
      *(_QWORD *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        v5 = *(void ***)(a1 + 16);
      }
      v2 = v5;
    }
    while (v5 != a2);
  }
}

void sub_2462D7DDC(void ***a1)
{
  void **v1;
  void **v2;
  void **v4;
  void *v5;

  v1 = *a1;
  v2 = (void **)**a1;
  if (v2)
  {
    v4 = (void **)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        if (*((char *)v4 - 1) < 0)
          operator delete(*(v4 - 3));
        v4 -= 3;
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void *sub_2462D7E54(uint64_t a1)
{
  if (a1 < 0)
    sub_2462D3488();
  return operator new(2 * a1);
}

void sub_2462D7E84(void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    sub_2462D7EC4((uint64_t *)v2);
    operator delete(**a1);
  }
}

void sub_2462D7EC4(uint64_t *a1)
{
  uint64_t v2;
  uint64_t i;

  v2 = *a1;
  for (i = a1[1]; i != v2; i -= 24)
  {
    if (*(char *)(i - 1) < 0)
      operator delete(*(void **)(i - 24));
  }
  a1[1] = v2;
}

void sub_2462D7F10(uint64_t a1, unsigned __int16 *a2, uint64_t a3, uint64_t a4, char a5)
{
  unsigned __int16 *v9;
  unsigned __int16 *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unsigned __int16 *v16;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  unint64_t v22;
  unsigned __int16 *v23;
  unsigned __int16 *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 *v28;
  __int128 v29;
  __int128 v30;
  BOOL v31;
  __int128 v32;
  unsigned __int16 *v33;
  char v34;
  unint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  unsigned __int16 *v45;
  BOOL v47;
  uint64_t v48;
  uint64_t v49;
  unsigned __int16 *v50;
  __int128 v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  int64_t v56;
  int64_t v57;
  int64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  uint64_t v63;
  __int128 v64;
  uint64_t v65;
  uint64_t v66;
  __int128 v67;
  int64_t v68;
  unsigned __int16 *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  __int128 v77;
  __int128 v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  __int128 v83;
  uint64_t v84;
  __int128 v85;
  __int128 v86;
  uint64_t v87;
  uint64_t v89;
  unsigned __int16 *v90;
  __int128 v91;
  uint64_t v92;
  char v93;
  __int128 v94;
  uint64_t v96;
  unsigned __int16 *v97;
  char v98;
  unint64_t v99;
  __int128 v100;
  uint64_t v101;
  __int128 v102;
  uint64_t v103;
  uint64_t v104;

  v104 = *MEMORY[0x24BDAC8D0];
LABEL_2:
  v9 = a2 - 12;
  v97 = a2 - 24;
  v99 = (unint64_t)a2;
  v10 = a2 - 36;
  v11 = a1;
  while (2)
  {
    a1 = v11;
    v12 = (uint64_t)a2 - v11;
    v13 = 0xAAAAAAAAAAAAAAABLL * (v12 >> 3);
    switch(v13)
    {
      case 0uLL:
      case 1uLL:
        return;
      case 2uLL:
        if ((sub_2462D8C0C(v9, (unsigned __int16 *)a1) & 0x80) != 0)
        {
          v42 = *(_OWORD *)a1;
          v101 = *(_QWORD *)(a1 + 16);
          v100 = v42;
          v43 = *(_OWORD *)v9;
          *(_QWORD *)(a1 + 16) = *((_QWORD *)v9 + 2);
          *(_OWORD *)a1 = v43;
          v44 = v100;
          *((_QWORD *)v9 + 2) = v101;
          *(_OWORD *)v9 = v44;
        }
        return;
      case 3uLL:
        sub_2462D8918((unsigned __int16 *)a1, (unsigned __int16 *)(a1 + 24), v9);
        return;
      case 4uLL:
        sub_2462D8CA4(a1, (unsigned __int16 *)(a1 + 24), (unsigned __int16 *)(a1 + 48), (__int128 *)v9);
        return;
      case 5uLL:
        sub_2462D8D70(a1, (unsigned __int16 *)(a1 + 24), (unsigned __int16 *)(a1 + 48), (__int128 *)(a1 + 72), (__int128 *)v9);
        return;
      default:
        if (v12 <= 575)
        {
          v45 = (unsigned __int16 *)(a1 + 24);
          v47 = (unsigned __int16 *)a1 == a2 || v45 == a2;
          if ((a5 & 1) != 0)
          {
            if (!v47)
            {
              v48 = 0;
              v49 = a1;
              do
              {
                v50 = (unsigned __int16 *)v49;
                v49 = (uint64_t)v45;
                if ((sub_2462D8C0C(v45, v50) & 0x80) != 0)
                {
                  v51 = *(_OWORD *)v49;
                  v101 = *(_QWORD *)(v49 + 16);
                  v100 = v51;
                  *(_QWORD *)(v49 + 8) = 0;
                  *(_QWORD *)(v49 + 16) = 0;
                  *(_QWORD *)v49 = 0;
                  v52 = v48;
                  while (1)
                  {
                    v53 = a1 + v52;
                    *(_OWORD *)(v53 + 24) = *(_OWORD *)(a1 + v52);
                    *(_QWORD *)(v53 + 40) = *(_QWORD *)(a1 + v52 + 16);
                    *(_BYTE *)(v53 + 23) = 0;
                    *(_WORD *)v53 = 0;
                    if (!v52)
                      break;
                    v52 -= 24;
                    if ((sub_2462D8C0C((unsigned __int16 *)&v100, (unsigned __int16 *)(v52 + a1)) & 0x80) == 0)
                    {
                      v54 = a1 + v52 + 24;
                      goto LABEL_80;
                    }
                  }
                  v54 = a1;
LABEL_80:
                  v55 = v100;
                  *(_QWORD *)(v54 + 16) = v101;
                  *(_OWORD *)v54 = v55;
                }
                v45 = (unsigned __int16 *)(v49 + 24);
                v48 += 24;
              }
              while ((unsigned __int16 *)(v49 + 24) != a2);
            }
          }
          else if (!v47)
          {
            v89 = a1 - 24;
            do
            {
              v90 = (unsigned __int16 *)a1;
              a1 = (uint64_t)v45;
              if ((sub_2462D8C0C(v45, v90) & 0x80) != 0)
              {
                v91 = *(_OWORD *)a1;
                v101 = *(_QWORD *)(a1 + 16);
                v100 = v91;
                *(_QWORD *)(a1 + 8) = 0;
                *(_QWORD *)(a1 + 16) = 0;
                *(_QWORD *)a1 = 0;
                v92 = v89;
                do
                {
                  *(_OWORD *)(v92 + 48) = *(_OWORD *)(v92 + 24);
                  *(_QWORD *)(v92 + 64) = *(_QWORD *)(v92 + 40);
                  *(_BYTE *)(v92 + 47) = 0;
                  *(_WORD *)(v92 + 24) = 0;
                  v93 = sub_2462D8C0C((unsigned __int16 *)&v100, (unsigned __int16 *)v92);
                  v92 -= 24;
                }
                while (v93 < 0);
                v94 = v100;
                *(_QWORD *)(v92 + 64) = v101;
                *(_OWORD *)(v92 + 48) = v94;
              }
              v45 = (unsigned __int16 *)(a1 + 24);
              v89 += 24;
            }
            while ((unsigned __int16 *)(a1 + 24) != a2);
          }
          return;
        }
        if (!a4)
        {
          if ((unsigned __int16 *)a1 != a2)
          {
            v56 = (v13 - 2) >> 1;
            v57 = v56;
            do
            {
              v58 = v57;
              if (v56 >= v57)
              {
                v59 = (2 * v57) | 1;
                v60 = a1 + 24 * v59;
                if (2 * v57 + 2 < (uint64_t)v13
                  && (sub_2462D8C0C((unsigned __int16 *)(a1 + 24 * v59), (unsigned __int16 *)(v60 + 24)) & 0x80u) != 0)
                {
                  v60 += 24;
                  v59 = 2 * v58 + 2;
                }
                v61 = a1 + 24 * v58;
                a2 = (unsigned __int16 *)v99;
                if ((sub_2462D8C0C((unsigned __int16 *)v60, (unsigned __int16 *)v61) & 0x80) == 0)
                {
                  v62 = *(_OWORD *)v61;
                  v101 = *(_QWORD *)(v61 + 16);
                  v100 = v62;
                  *(_QWORD *)(v61 + 8) = 0;
                  *(_QWORD *)(v61 + 16) = 0;
                  *(_QWORD *)v61 = 0;
                  do
                  {
                    v63 = v60;
                    v64 = *(_OWORD *)v60;
                    *(_QWORD *)(v61 + 16) = *(_QWORD *)(v60 + 16);
                    *(_OWORD *)v61 = v64;
                    *(_BYTE *)(v60 + 23) = 0;
                    *(_WORD *)v60 = 0;
                    if (v56 < v59)
                      break;
                    v65 = (2 * v59) | 1;
                    v60 = a1 + 24 * v65;
                    v66 = 2 * v59 + 2;
                    if (v66 < (uint64_t)v13
                      && (sub_2462D8C0C((unsigned __int16 *)(a1 + 24 * v65), (unsigned __int16 *)(v60 + 24)) & 0x80u) != 0)
                    {
                      v60 += 24;
                      v65 = v66;
                    }
                    v61 = v63;
                    v59 = v65;
                  }
                  while ((sub_2462D8C0C((unsigned __int16 *)v60, (unsigned __int16 *)&v100) & 0x80) == 0);
                  v67 = v100;
                  *(_QWORD *)(v63 + 16) = v101;
                  *(_OWORD *)v63 = v67;
                  a2 = (unsigned __int16 *)v99;
                }
              }
              v57 = v58 - 1;
            }
            while (v58);
            v68 = v12 / 0x18uLL;
            do
            {
              v69 = a2;
              v70 = 0;
              v96 = *(_QWORD *)a1;
              *(_QWORD *)&v102 = *(_QWORD *)(a1 + 8);
              *(_QWORD *)((char *)&v102 + 7) = *(_QWORD *)(a1 + 15);
              v98 = *(_BYTE *)(a1 + 23);
              *(_QWORD *)(a1 + 8) = 0;
              *(_QWORD *)(a1 + 16) = 0;
              *(_QWORD *)a1 = 0;
              v71 = v68 - 2;
              if (v68 < 2)
                v71 = v68 - 1;
              v72 = v71 >> 1;
              v73 = a1;
              do
              {
                v74 = v73 + 24 * v70 + 24;
                v75 = 2 * v70;
                v70 = (2 * v70) | 1;
                v76 = v75 + 2;
                if (v75 + 2 < v68
                  && (sub_2462D8C0C((unsigned __int16 *)v74, (unsigned __int16 *)(v74 + 24)) & 0x80u) != 0)
                {
                  v74 += 24;
                  v70 = v76;
                }
                if (*(char *)(v73 + 23) < 0)
                  operator delete(*(void **)v73);
                v77 = *(_OWORD *)v74;
                *(_QWORD *)(v73 + 16) = *(_QWORD *)(v74 + 16);
                *(_OWORD *)v73 = v77;
                *(_BYTE *)(v74 + 23) = 0;
                *(_WORD *)v74 = 0;
                v73 = v74;
              }
              while (v70 <= v72);
              a2 = v69 - 12;
              if ((unsigned __int16 *)v74 == v69 - 12)
              {
                *(_QWORD *)v74 = v96;
                v87 = *(_QWORD *)((char *)&v102 + 7);
                *(_QWORD *)(v74 + 8) = v102;
                *(_QWORD *)(v74 + 15) = v87;
                *(_BYTE *)(v74 + 23) = v98;
              }
              else
              {
                v78 = *(_OWORD *)a2;
                *(_QWORD *)(v74 + 16) = *((_QWORD *)v69 - 1);
                *(_OWORD *)v74 = v78;
                *((_QWORD *)v69 - 3) = v96;
                v79 = v102;
                *(_QWORD *)((char *)v69 - 9) = *(_QWORD *)((char *)&v102 + 7);
                *((_QWORD *)v69 - 2) = v79;
                *((_BYTE *)v69 - 1) = v98;
                v80 = v74 - a1 + 24;
                if (v80 >= 25)
                {
                  v81 = (v80 / 0x18uLL - 2) >> 1;
                  v82 = a1 + 24 * v81;
                  if ((sub_2462D8C0C((unsigned __int16 *)v82, (unsigned __int16 *)v74) & 0x80) != 0)
                  {
                    v83 = *(_OWORD *)v74;
                    v101 = *(_QWORD *)(v74 + 16);
                    v100 = v83;
                    *(_QWORD *)(v74 + 8) = 0;
                    *(_QWORD *)(v74 + 16) = 0;
                    *(_QWORD *)v74 = 0;
                    do
                    {
                      v84 = v82;
                      v85 = *(_OWORD *)v82;
                      *(_QWORD *)(v74 + 16) = *(_QWORD *)(v82 + 16);
                      *(_OWORD *)v74 = v85;
                      *(_BYTE *)(v82 + 23) = 0;
                      *(_WORD *)v82 = 0;
                      if (!v81)
                        break;
                      v81 = (v81 - 1) >> 1;
                      v82 = a1 + 24 * v81;
                      v74 = v84;
                    }
                    while ((sub_2462D8C0C((unsigned __int16 *)v82, (unsigned __int16 *)&v100) & 0x80) != 0);
                    v86 = v100;
                    *(_QWORD *)(v84 + 16) = v101;
                    *(_OWORD *)v84 = v86;
                    a2 = v69 - 12;
                  }
                }
              }
            }
            while (v68-- > 2);
          }
          return;
        }
        v14 = a1 + 24 * (v13 >> 1);
        if ((unint64_t)v12 < 0xC01)
        {
          sub_2462D8918((unsigned __int16 *)(a1 + 24 * (v13 >> 1)), (unsigned __int16 *)a1, v9);
        }
        else
        {
          sub_2462D8918((unsigned __int16 *)a1, (unsigned __int16 *)(a1 + 24 * (v13 >> 1)), v9);
          v15 = 3 * (v13 >> 1);
          v16 = (unsigned __int16 *)(a1 + 24 * (v13 >> 1) - 24);
          sub_2462D8918((unsigned __int16 *)(a1 + 24), v16, v97);
          sub_2462D8918((unsigned __int16 *)(a1 + 48), (unsigned __int16 *)(a1 + 24 + 8 * v15), v10);
          sub_2462D8918(v16, (unsigned __int16 *)v14, (unsigned __int16 *)(a1 + 24 + 8 * v15));
          v17 = *(_OWORD *)a1;
          v101 = *(_QWORD *)(a1 + 16);
          v100 = v17;
          v18 = *(_QWORD *)(v14 + 16);
          *(_OWORD *)a1 = *(_OWORD *)v14;
          *(_QWORD *)(a1 + 16) = v18;
          v19 = v100;
          *(_QWORD *)(v14 + 16) = v101;
          *(_OWORD *)v14 = v19;
        }
        --a4;
        a2 = (unsigned __int16 *)v99;
        if ((a5 & 1) == 0 && (sub_2462D8C0C((unsigned __int16 *)(a1 - 24), (unsigned __int16 *)a1) & 0x80) == 0)
        {
          v32 = *(_OWORD *)a1;
          v103 = *(_QWORD *)(a1 + 16);
          v102 = v32;
          *(_QWORD *)(a1 + 8) = 0;
          *(_QWORD *)(a1 + 16) = 0;
          *(_QWORD *)a1 = 0;
          if ((sub_2462D8C0C((unsigned __int16 *)&v102, v9) & 0x80) != 0)
          {
            v11 = a1;
            do
              v11 += 24;
            while ((sub_2462D8C0C((unsigned __int16 *)&v102, (unsigned __int16 *)v11) & 0x80) == 0);
          }
          else
          {
            v33 = (unsigned __int16 *)(a1 + 24);
            do
            {
              v11 = (unint64_t)v33;
              if ((unint64_t)v33 >= v99)
                break;
              v34 = sub_2462D8C0C((unsigned __int16 *)&v102, v33);
              v33 = (unsigned __int16 *)(v11 + 24);
            }
            while ((v34 & 0x80) == 0);
          }
          v35 = v99;
          if (v11 < v99)
          {
            v35 = v99;
            do
              v35 -= 24;
            while ((sub_2462D8C0C((unsigned __int16 *)&v102, (unsigned __int16 *)v35) & 0x80) != 0);
          }
          while (v11 < v35)
          {
            v36 = *(_OWORD *)v11;
            v101 = *(_QWORD *)(v11 + 16);
            v100 = v36;
            v37 = *(_OWORD *)v35;
            *(_QWORD *)(v11 + 16) = *(_QWORD *)(v35 + 16);
            *(_OWORD *)v11 = v37;
            v38 = v100;
            *(_QWORD *)(v35 + 16) = v101;
            *(_OWORD *)v35 = v38;
            do
              v11 += 24;
            while ((sub_2462D8C0C((unsigned __int16 *)&v102, (unsigned __int16 *)v11) & 0x80) == 0);
            do
              v35 -= 24;
            while ((sub_2462D8C0C((unsigned __int16 *)&v102, (unsigned __int16 *)v35) & 0x80) != 0);
          }
          v39 = (__int128 *)(v11 - 24);
          if (v11 - 24 == a1)
          {
            if (*(char *)(v11 - 1) < 0)
              operator delete(*(void **)a1);
          }
          else
          {
            if (*(char *)(a1 + 23) < 0)
              operator delete(*(void **)a1);
            v40 = *v39;
            *(_QWORD *)(a1 + 16) = *(_QWORD *)(v11 - 8);
            *(_OWORD *)a1 = v40;
            *(_BYTE *)(v11 - 1) = 0;
            *(_WORD *)(v11 - 24) = 0;
          }
          a5 = 0;
          v41 = v102;
          *(_QWORD *)(v11 - 8) = v103;
          *v39 = v41;
          continue;
        }
        v20 = 0;
        v21 = *(_OWORD *)a1;
        v103 = *(_QWORD *)(a1 + 16);
        v102 = v21;
        *(_QWORD *)(a1 + 8) = 0;
        *(_QWORD *)(a1 + 16) = 0;
        *(_QWORD *)a1 = 0;
        do
          v20 += 24;
        while ((sub_2462D8C0C((unsigned __int16 *)(v20 + a1), (unsigned __int16 *)&v102) & 0x80) != 0);
        v22 = a1 + v20;
        v23 = (unsigned __int16 *)v99;
        if (v20 == 24)
        {
          v23 = (unsigned __int16 *)v99;
          do
          {
            if (v22 >= (unint64_t)v23)
              break;
            v23 -= 12;
          }
          while ((sub_2462D8C0C(v23, (unsigned __int16 *)&v102) & 0x80) == 0);
        }
        else
        {
          do
            v23 -= 12;
          while ((sub_2462D8C0C(v23, (unsigned __int16 *)&v102) & 0x80) == 0);
        }
        v11 = a1 + v20;
        if (v22 < (unint64_t)v23)
        {
          v24 = v23;
          do
          {
            v25 = *(_OWORD *)v11;
            v101 = *(_QWORD *)(v11 + 16);
            v100 = v25;
            v26 = *(_OWORD *)v24;
            *(_QWORD *)(v11 + 16) = *((_QWORD *)v24 + 2);
            *(_OWORD *)v11 = v26;
            v27 = v100;
            *((_QWORD *)v24 + 2) = v101;
            *(_OWORD *)v24 = v27;
            do
              v11 += 24;
            while ((sub_2462D8C0C((unsigned __int16 *)v11, (unsigned __int16 *)&v102) & 0x80) != 0);
            do
              v24 -= 12;
            while ((sub_2462D8C0C(v24, (unsigned __int16 *)&v102) & 0x80) == 0);
          }
          while (v11 < (unint64_t)v24);
        }
        v28 = (__int128 *)(v11 - 24);
        if (v11 - 24 == a1)
        {
          if (*(char *)(v11 - 1) < 0)
            operator delete(*(void **)a1);
        }
        else
        {
          if (*(char *)(a1 + 23) < 0)
            operator delete(*(void **)a1);
          v29 = *v28;
          *(_QWORD *)(a1 + 16) = *(_QWORD *)(v11 - 8);
          *(_OWORD *)a1 = v29;
          *(_BYTE *)(v11 - 1) = 0;
          *(_WORD *)(v11 - 24) = 0;
        }
        v30 = v102;
        *(_QWORD *)(v11 - 8) = v103;
        *v28 = v30;
        if (v22 < (unint64_t)v23)
        {
LABEL_34:
          sub_2462D7F10(a1, v11 - 24, a3, a4, a5 & 1);
          a5 = 0;
          continue;
        }
        v31 = sub_2462D8A38(a1, v11 - 24);
        if (!sub_2462D8A38(v11, v99))
        {
          if (v31)
            continue;
          goto LABEL_34;
        }
        a2 = (unsigned __int16 *)(v11 - 24);
        if (!v31)
          goto LABEL_2;
        return;
    }
  }
}

uint64_t sub_2462D8918(unsigned __int16 *a1, unsigned __int16 *a2, unsigned __int16 *a3)
{
  char v6;
  uint64_t result;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;

  v6 = sub_2462D8C0C(a2, a1);
  result = sub_2462D8C0C(a3, a2);
  if (v6 < 0)
  {
    if ((char)result < 0)
    {
      v17 = *((_QWORD *)a1 + 2);
      v18 = *(_OWORD *)a1;
      v20 = *((_QWORD *)a3 + 2);
      *(_OWORD *)a1 = *(_OWORD *)a3;
      *((_QWORD *)a1 + 2) = v20;
    }
    else
    {
      v14 = *((_QWORD *)a1 + 2);
      v15 = *(_OWORD *)a1;
      v16 = *((_QWORD *)a2 + 2);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *((_QWORD *)a1 + 2) = v16;
      *(_OWORD *)a2 = v15;
      *((_QWORD *)a2 + 2) = v14;
      result = sub_2462D8C0C(a3, a2);
      if ((result & 0x80) == 0)
        return result;
      v17 = *((_QWORD *)a2 + 2);
      v18 = *(_OWORD *)a2;
      v19 = *((_QWORD *)a3 + 2);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *((_QWORD *)a2 + 2) = v19;
    }
    *(_OWORD *)a3 = v18;
    *((_QWORD *)a3 + 2) = v17;
  }
  else if ((char)result < 0)
  {
    v8 = *((_QWORD *)a2 + 2);
    v9 = *(_OWORD *)a2;
    v10 = *((_QWORD *)a3 + 2);
    *(_OWORD *)a2 = *(_OWORD *)a3;
    *((_QWORD *)a2 + 2) = v10;
    *(_OWORD *)a3 = v9;
    *((_QWORD *)a3 + 2) = v8;
    result = sub_2462D8C0C(a2, a1);
    if ((result & 0x80) != 0)
    {
      v11 = *((_QWORD *)a1 + 2);
      v12 = *(_OWORD *)a1;
      v13 = *((_QWORD *)a2 + 2);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *((_QWORD *)a1 + 2) = v13;
      *(_OWORD *)a2 = v12;
      *((_QWORD *)a2 + 2) = v11;
    }
  }
  return result;
}

BOOL sub_2462D8A38(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  _BOOL8 result;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  unsigned __int16 *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;

  v4 = 0xAAAAAAAAAAAAAAABLL * ((a2 - a1) >> 3);
  result = 1;
  switch(v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      v6 = a2 - 24;
      if ((sub_2462D8C0C((unsigned __int16 *)(a2 - 24), (unsigned __int16 *)a1) & 0x80) != 0)
      {
        v7 = *(_QWORD *)(a1 + 16);
        v8 = *(_OWORD *)a1;
        v9 = *(_QWORD *)(v6 + 16);
        *(_OWORD *)a1 = *(_OWORD *)v6;
        *(_QWORD *)(a1 + 16) = v9;
        *(_OWORD *)v6 = v8;
        *(_QWORD *)(v6 + 16) = v7;
      }
      return 1;
    case 3uLL:
      sub_2462D8918((unsigned __int16 *)a1, (unsigned __int16 *)(a1 + 24), (unsigned __int16 *)(a2 - 24));
      return 1;
    case 4uLL:
      sub_2462D8CA4(a1, (unsigned __int16 *)(a1 + 24), (unsigned __int16 *)(a1 + 48), (__int128 *)(a2 - 24));
      return 1;
    case 5uLL:
      sub_2462D8D70(a1, (unsigned __int16 *)(a1 + 24), (unsigned __int16 *)(a1 + 48), (__int128 *)(a1 + 72), (__int128 *)(a2 - 24));
      return 1;
    default:
      v10 = (unsigned __int16 *)(a1 + 48);
      sub_2462D8918((unsigned __int16 *)a1, (unsigned __int16 *)(a1 + 24), (unsigned __int16 *)(a1 + 48));
      v11 = a1 + 72;
      if (a1 + 72 == a2)
        return 1;
      v12 = 0;
      v13 = 0;
      break;
  }
  while (1)
  {
    if ((sub_2462D8C0C((unsigned __int16 *)v11, v10) & 0x80) != 0)
    {
      v17 = *(_OWORD *)v11;
      v18 = *(_QWORD *)(v11 + 16);
      *(_QWORD *)(v11 + 8) = 0;
      *(_QWORD *)(v11 + 16) = 0;
      *(_QWORD *)v11 = 0;
      v14 = v12;
      while (1)
      {
        v15 = a1 + v14;
        *(_OWORD *)(v15 + 72) = *(_OWORD *)(a1 + v14 + 48);
        *(_QWORD *)(v15 + 88) = *(_QWORD *)(a1 + v14 + 64);
        *(_BYTE *)(v15 + 71) = 0;
        *(_WORD *)(v15 + 48) = 0;
        if (v14 == -48)
          break;
        v14 -= 24;
        if ((sub_2462D8C0C((unsigned __int16 *)&v17, (unsigned __int16 *)(v15 + 24)) & 0x80) == 0)
        {
          v16 = a1 + v14 + 72;
          goto LABEL_12;
        }
      }
      v16 = a1;
LABEL_12:
      *(_OWORD *)v16 = v17;
      *(_QWORD *)(v16 + 16) = v18;
      if (++v13 == 8)
        return v11 + 24 == a2;
    }
    v10 = (unsigned __int16 *)v11;
    v12 += 24;
    v11 += 24;
    if (v11 == a2)
      return 1;
  }
}

uint64_t sub_2462D8C0C(unsigned __int16 *a1, unsigned __int16 *a2)
{
  unint64_t v2;
  int v3;
  unint64_t v4;
  int v5;
  unint64_t v6;
  unsigned __int16 *v7;
  unsigned __int16 *v8;
  unsigned int v9;
  unsigned int v10;

  v2 = *((unsigned __int8 *)a1 + 23);
  v3 = (char)v2;
  if ((v2 & 0x80u) != 0)
    v2 = *((_QWORD *)a1 + 1);
  v4 = *((unsigned __int8 *)a2 + 23);
  v5 = (char)v4;
  if ((v4 & 0x80u) != 0)
    v4 = *((_QWORD *)a2 + 1);
  if (v4 >= v2)
    v6 = v2;
  else
    v6 = v4;
  if (v6)
  {
    if (v5 >= 0)
      v7 = a2;
    else
      v7 = *(unsigned __int16 **)a2;
    if (v3 >= 0)
      v8 = a1;
    else
      v8 = *(unsigned __int16 **)a1;
    do
    {
      v9 = *v8;
      v10 = *v7;
      if (v9 < v10)
        return 255;
      if (v10 < v9)
        return 1;
      ++v8;
      ++v7;
    }
    while (--v6);
  }
  if (v2 == v4)
    return 0;
  if (v2 < v4)
    return 255;
  return 1;
}

__n128 sub_2462D8CA4(uint64_t a1, unsigned __int16 *a2, unsigned __int16 *a3, __int128 *a4)
{
  __n128 result;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  sub_2462D8918((unsigned __int16 *)a1, a2, a3);
  if ((sub_2462D8C0C((unsigned __int16 *)a4, a3) & 0x80) != 0)
  {
    v9 = *((_QWORD *)a3 + 2);
    v10 = *(_OWORD *)a3;
    v11 = *((_QWORD *)a4 + 2);
    *(_OWORD *)a3 = *a4;
    *((_QWORD *)a3 + 2) = v11;
    *a4 = v10;
    *((_QWORD *)a4 + 2) = v9;
    if ((sub_2462D8C0C(a3, a2) & 0x80) != 0)
    {
      v12 = *((_QWORD *)a2 + 2);
      v13 = *(_OWORD *)a2;
      v14 = *((_QWORD *)a3 + 2);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *((_QWORD *)a2 + 2) = v14;
      *(_OWORD *)a3 = v13;
      *((_QWORD *)a3 + 2) = v12;
      if ((sub_2462D8C0C(a2, (unsigned __int16 *)a1) & 0x80) != 0)
      {
        v15 = *(_QWORD *)(a1 + 16);
        result = *(__n128 *)a1;
        v16 = *((_QWORD *)a2 + 2);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_QWORD *)(a1 + 16) = v16;
        *(__n128 *)a2 = result;
        *((_QWORD *)a2 + 2) = v15;
      }
    }
  }
  return result;
}

__n128 sub_2462D8D70(uint64_t a1, unsigned __int16 *a2, unsigned __int16 *a3, __int128 *a4, __int128 *a5)
{
  __n128 result;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  sub_2462D8CA4(a1, a2, a3, a4);
  if ((sub_2462D8C0C((unsigned __int16 *)a5, (unsigned __int16 *)a4) & 0x80) != 0)
  {
    v11 = *((_QWORD *)a4 + 2);
    v12 = *a4;
    v13 = *((_QWORD *)a5 + 2);
    *a4 = *a5;
    *((_QWORD *)a4 + 2) = v13;
    *a5 = v12;
    *((_QWORD *)a5 + 2) = v11;
    if ((sub_2462D8C0C((unsigned __int16 *)a4, a3) & 0x80) != 0)
    {
      v14 = *((_QWORD *)a3 + 2);
      v15 = *(_OWORD *)a3;
      v16 = *((_QWORD *)a4 + 2);
      *(_OWORD *)a3 = *a4;
      *((_QWORD *)a3 + 2) = v16;
      *a4 = v15;
      *((_QWORD *)a4 + 2) = v14;
      if ((sub_2462D8C0C(a3, a2) & 0x80) != 0)
      {
        v17 = *((_QWORD *)a2 + 2);
        v18 = *(_OWORD *)a2;
        v19 = *((_QWORD *)a3 + 2);
        *(_OWORD *)a2 = *(_OWORD *)a3;
        *((_QWORD *)a2 + 2) = v19;
        *(_OWORD *)a3 = v18;
        *((_QWORD *)a3 + 2) = v17;
        if ((sub_2462D8C0C(a2, (unsigned __int16 *)a1) & 0x80) != 0)
        {
          v20 = *(_QWORD *)(a1 + 16);
          result = *(__n128 *)a1;
          v21 = *((_QWORD *)a2 + 2);
          *(_OWORD *)a1 = *(_OWORD *)a2;
          *(_QWORD *)(a1 + 16) = v21;
          *(__n128 *)a2 = result;
          *((_QWORD *)a2 + 2) = v20;
        }
      }
    }
  }
  return result;
}

void **sub_2462D8E78(unsigned __int16 *a1, unsigned __int16 *a2, uint64_t a3)
{
  void **result;
  unsigned __int16 *v7;
  _BOOL4 v8;
  unsigned __int16 *v9;
  unsigned __int16 *v10;
  void **v11;
  __int128 v12;

  result = (void **)a2;
  if (a1 != a2)
  {
    do
    {
      v7 = a1 + 12;
      if (a1 + 12 == a2)
        return (void **)a2;
      v8 = sub_2462D8F58(a3, a1, a1 + 12);
      a1 = v7;
    }
    while (!v8);
    v9 = v7 + 12;
    v10 = v7 - 12;
    if (v9 == a2)
    {
      v11 = (void **)v10;
    }
    else
    {
      do
      {
        if (sub_2462D8F58(a3, v10, v9))
        {
          v11 = (void **)v10;
        }
        else
        {
          v11 = (void **)(v10 + 12);
          if (*((char *)v10 + 47) < 0)
            operator delete(*v11);
          v12 = *(_OWORD *)v9;
          *((_QWORD *)v10 + 5) = *((_QWORD *)v9 + 2);
          *(_OWORD *)v11 = v12;
          *((_BYTE *)v9 + 23) = 0;
          *v9 = 0;
          v10 += 12;
        }
        v9 += 12;
      }
      while (v9 != a2);
    }
    return v11 + 3;
  }
  return result;
}

BOOL sub_2462D8F58(uint64_t a1, unsigned __int16 *a2, unsigned __int16 *a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  unsigned __int16 *v7;
  unsigned __int16 *v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  int v13;
  BOOL v15;
  _BOOL8 result;

  v3 = *((char *)a2 + 23);
  v4 = *((_QWORD *)a2 + 1);
  if (v3 >= 0)
    v4 = *((unsigned __int8 *)a2 + 23);
  v5 = *((unsigned __int8 *)a3 + 23);
  v6 = (char)v5;
  if ((v5 & 0x80u) != 0)
    v5 = *((_QWORD *)a3 + 1);
  if (v4 != v5)
    return 0;
  if (!v4)
    return 1;
  if (v3 >= 0)
    v7 = a2;
  else
    v7 = *(unsigned __int16 **)a2;
  if (v6 >= 0)
    v8 = a3;
  else
    v8 = *(unsigned __int16 **)a3;
  v9 = v4 - 1;
  do
  {
    v11 = *v7++;
    v10 = v11;
    v13 = *v8++;
    v12 = v13;
    v15 = v9-- != 0;
    result = v12 == v10;
  }
  while (v12 == v10 && v15);
  return result;
}

__int128 *sub_2462D8FDC(uint64_t a1, __int128 *a2, __int128 *a3, uint64_t a4)
{
  __int128 *v5;
  __int128 v7;

  v5 = a2;
  if (a2 != a3)
  {
    do
    {
      if (*(char *)(a4 + 23) < 0)
        operator delete(*(void **)a4);
      v7 = *v5;
      *(_QWORD *)(a4 + 16) = *((_QWORD *)v5 + 2);
      *(_OWORD *)a4 = v7;
      a4 += 24;
      *((_BYTE *)v5 + 23) = 0;
      *(_WORD *)v5 = 0;
      v5 = (__int128 *)((char *)v5 + 24);
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

void sub_2462D904C(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_25175EE68;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_2462D905C(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_25175EE68;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x249556DC8);
}

uint64_t sub_2462D908C(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 24) + 8))(a1 + 24);
}

uint64_t *sub_2462D909C(uint64_t *a1)
{
  sub_2462D90D8(a1);
  if ((uint64_t *)*a1 != a1 + 2)
    free((void *)*a1);
  return a1;
}

void sub_2462D90D8(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *((unsigned int *)a1 + 2);
  if ((_DWORD)v1)
  {
    v2 = *a1;
    v3 = 40 * v1;
    do
    {
      if (*(char *)(v2 + 23) < 0)
        operator delete(*(void **)v2);
      v2 += 40;
      v3 -= 40;
    }
    while (v3);
  }
}

size_t sub_2462D9120(__int128 **a1, unsigned int a2)
{
  __int128 *v3;
  __int128 *v4;
  __int128 *v5;
  uint64_t v6;
  __int128 *v7;
  __int128 *v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  size_t result;
  std::bad_alloc *exception;
  std::bad_alloc *v14;

  v3 = (__int128 *)malloc_type_malloc(40 * a2, 0x10120408116F198uLL);
  if (!v3)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    v14 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v14, MEMORY[0x24BEDB758], MEMORY[0x24BEDB670]);
  }
  v4 = v3;
  v5 = *a1;
  v6 = *((unsigned int *)a1 + 2);
  if ((_DWORD)v6)
  {
    v7 = v3;
    v8 = *a1;
    do
    {
      v9 = *v8;
      *((_QWORD *)v7 + 2) = *((_QWORD *)v8 + 2);
      *v7 = v9;
      *((_QWORD *)v8 + 1) = 0;
      *((_QWORD *)v8 + 2) = 0;
      *(_QWORD *)v8 = 0;
      v10 = *((_QWORD *)v8 + 3);
      *((_WORD *)v7 + 16) = *((_WORD *)v8 + 16);
      *((_QWORD *)v7 + 3) = v10;
      v8 = (__int128 *)((char *)v8 + 40);
      v7 = (__int128 *)((char *)v7 + 40);
    }
    while (v8 != (__int128 *)((char *)v5 + 40 * v6));
    v11 = 40 * v6;
    do
    {
      if (*((char *)v5 + 23) < 0)
        operator delete(*(void **)v5);
      v5 = (__int128 *)((char *)v5 + 40);
      v11 -= 40;
    }
    while (v11);
    v5 = *a1;
  }
  if (v5 != (__int128 *)(a1 + 2))
    free(v5);
  *a1 = v4;
  result = malloc_size(v4);
  *((_DWORD *)a1 + 3) = result / 0x28;
  return result;
}

void sub_2462D948C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_2462D9518(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2462D95D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2462D9678(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2462D96F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2462D9800(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_2462D98E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2462D99A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2462D9B20(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2462D9F20(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_2462D9FEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t sub_2462DA56C(uint64_t a1, _QWORD *a2, void *a3)
{
  unsigned int (**v5)(void);
  const char *v6;
  void *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5[2]())
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v6, (uint64_t)CFSTR("Function '%s' got nonzero result from SKIT."), a1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDD1540];
    v15 = *MEMORY[0x24BDD0FC8];
    v16[0] = v7;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v9, (uint64_t)v16, &v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v8, v11, (uint64_t)CFSTR("com.apple.siri.inference.semskitbridge"), -1, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    sub_2462F1D28(a2, v12);

    v13 = 0;
  }
  else
  {
    v13 = 1;
  }

  return v13;
}

void sub_2462DA68C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v3;

  _Unwind_Resume(a1);
}

uint64_t sub_2462DA774(int a1)
{
  uint64_t v1;
  int v2;
  int v3;

  v1 = 2;
  if (a1 > 27121)
  {
    if (a1 > 47340)
    {
      if (a1 > 54384)
      {
        if (a1 <= 61508)
        {
          if (a1 == 54385)
            return 3;
          v3 = 61352;
        }
        else
        {
          if (a1 == 61509)
            return 1;
          if (a1 == 62158)
            return 3;
          v3 = 63369;
        }
        if (a1 == v3)
          return v1;
        return 0;
      }
      if (a1 > 53481)
      {
        if (a1 == 53482 || a1 == 53601)
          return 3;
        v2 = 53614;
        goto LABEL_55;
      }
      if (a1 != 47341)
      {
        v2 = 49066;
        goto LABEL_55;
      }
    }
    else if (a1 > 36433)
    {
      if (a1 > 42183)
      {
        if (a1 == 42184 || a1 == 42611)
          return 3;
        v2 = 44935;
        goto LABEL_55;
      }
      if (a1 != 36434)
      {
        v2 = 38251;
        goto LABEL_55;
      }
    }
    else
    {
      if (a1 > 32964)
      {
        if (a1 == 32965 || a1 == 34307)
          return 3;
        v2 = 36059;
        goto LABEL_55;
      }
      if (a1 != 27122)
      {
        v2 = 30598;
        goto LABEL_55;
      }
    }
    return 3;
  }
  if (a1 <= 14024)
  {
    if (a1 <= 7821)
    {
      if (a1 > 5594)
      {
        if (a1 == 5595 || a1 == 7690)
          return 3;
        v2 = 7719;
LABEL_55:
        if (a1 == v2)
          return 3;
        return 0;
      }
      if (a1 == 800 || a1 == 3615)
        return 3;
      return 0;
    }
    if (a1 > 12009)
    {
      if (a1 == 12010 || a1 == 12996)
        return 3;
      v2 = 13884;
      goto LABEL_55;
    }
    if (a1 != 7822)
    {
      v2 = 8194;
      goto LABEL_55;
    }
    return 3;
  }
  if (a1 <= 16250)
  {
    if (a1 > 14815)
    {
      if (a1 == 14816 || a1 == 15572)
        return 3;
      v2 = 15757;
      goto LABEL_55;
    }
    if (a1 != 14025)
    {
      v2 = 14706;
      goto LABEL_55;
    }
    return 3;
  }
  if (a1 <= 19667)
  {
    if (a1 != 16251)
    {
      v2 = 18540;
      goto LABEL_55;
    }
    return 3;
  }
  if (a1 != 19668)
  {
    if (a1 != 25883)
    {
      v2 = 26512;
      goto LABEL_55;
    }
    return 3;
  }
  return v1;
}

uint64_t sub_2462DA9F0(int a1)
{
  int v1;
  int v2;
  int v4;

  if (a1 > 27121)
  {
    if (a1 <= 47340)
    {
      if (a1 > 36433)
      {
        if (a1 <= 42183)
        {
          if (a1 == 36434)
            return 6;
          v1 = 38251;
          return a1 == v1;
        }
        if (a1 != 42184)
        {
          if (a1 == 42611)
            return 1;
          v1 = 44935;
          return a1 == v1;
        }
        return 4;
      }
      if (a1 > 32964)
      {
        if (a1 == 32965 || a1 == 34307)
          return 1;
        v1 = 36059;
        return a1 == v1;
      }
      if (a1 != 27122)
      {
        v1 = 30598;
        return a1 == v1;
      }
      return 3;
    }
    if (a1 <= 54384)
    {
      if (a1 > 53481)
      {
        if (a1 == 53482 || a1 == 53601)
          return 1;
        v1 = 53614;
        return a1 == v1;
      }
      if (a1 == 47341)
        return 1;
      v4 = 49066;
LABEL_57:
      if (a1 != v4)
        return 0;
      return 4;
    }
    if (a1 <= 61508)
    {
      if (a1 == 54385)
        return 1;
      v2 = 61352;
    }
    else
    {
      if (a1 == 63369)
        return 3;
      if (a1 == 62158)
        return 1;
      v2 = 61509;
    }
    if (a1 != v2)
      return 0;
    return 3;
  }
  if (a1 > 14024)
  {
    if (a1 <= 16250)
    {
      if (a1 <= 14815)
      {
        if (a1 == 14025)
          return 1;
        v1 = 14706;
      }
      else
      {
        if (a1 == 14816 || a1 == 15572)
          return 1;
        v1 = 15757;
      }
      return a1 == v1;
    }
    if (a1 > 19667)
    {
      if (a1 == 19668)
        return 2;
      if (a1 == 25883)
        return 1;
      v1 = 26512;
      return a1 == v1;
    }
    if (a1 == 16251)
      return 1;
    v4 = 18540;
    goto LABEL_57;
  }
  if (a1 > 7821)
  {
    if (a1 <= 12009)
    {
      if (a1 == 7822)
        return 1;
      v1 = 8194;
    }
    else
    {
      if (a1 == 12010 || a1 == 12996)
        return 1;
      v1 = 13884;
    }
    return a1 == v1;
  }
  if (a1 <= 5594)
  {
    if (a1 != 800)
      return a1 == 3615;
    return 6;
  }
  if (a1 == 5595)
    return 1;
  if (a1 != 7690)
  {
    v1 = 7719;
    return a1 == v1;
  }
  return 5;
}

uint64_t sub_2462DAC84(int a1)
{
  uint64_t v1;
  int v2;
  int v3;

  v1 = 4;
  if (a1 > 27121)
  {
    if (a1 > 47340)
    {
      if (a1 > 54384)
      {
        if (a1 <= 61508)
        {
          if (a1 != 54385)
          {
            v2 = 61352;
            return a1 == v2;
          }
        }
        else if (a1 != 63369)
        {
          if (a1 == 62158)
            return 2;
          v2 = 61509;
          return a1 == v2;
        }
        return 1;
      }
      if (a1 > 53481)
      {
        if (a1 == 53482 || a1 == 53601)
          return 1;
        v2 = 53614;
        return a1 == v2;
      }
      if (a1 == 47341)
        return 3;
      v3 = 49066;
    }
    else
    {
      if (a1 > 36433)
      {
        if (a1 <= 42183)
        {
          if (a1 != 36434)
          {
            v2 = 38251;
            return a1 == v2;
          }
          return 3;
        }
        if (a1 != 42184)
        {
          if (a1 != 42611)
          {
            v2 = 44935;
            return a1 == v2;
          }
          return 3;
        }
        return 1;
      }
      if (a1 <= 32964)
      {
        if (a1 == 27122)
          return v1;
        v2 = 30598;
        return a1 == v2;
      }
      if (a1 == 32965)
        return 1;
      if (a1 == 34307)
        return 3;
      v3 = 36059;
    }
LABEL_51:
    if (a1 != v3)
      return 0;
    return 3;
  }
  if (a1 <= 14024)
  {
    if (a1 <= 7821)
    {
      if (a1 > 5594)
      {
        if (a1 == 5595 || a1 == 7690)
          return 1;
        v2 = 7719;
        return a1 == v2;
      }
      if (a1 != 800)
      {
        if (a1 != 3615)
          return 0;
        return 3;
      }
      return 1;
    }
    if (a1 > 12009)
    {
      if (a1 != 12010 && a1 != 12996)
      {
        v2 = 13884;
        return a1 == v2;
      }
      return 3;
    }
    if (a1 == 7822)
      return 3;
    v3 = 8194;
    goto LABEL_51;
  }
  if (a1 <= 16250)
  {
    if (a1 > 14815)
    {
      if (a1 == 14816 || a1 == 15572)
        return 1;
      v2 = 15757;
      return a1 == v2;
    }
    if (a1 != 14025)
    {
      v2 = 14706;
      return a1 == v2;
    }
    return 3;
  }
  if (a1 <= 19667)
  {
    if (a1 != 16251)
    {
      v2 = 18540;
      return a1 == v2;
    }
    return 1;
  }
  if (a1 != 19668)
  {
    if (a1 != 25883)
    {
      v2 = 26512;
      return a1 == v2;
    }
    return 1;
  }
  return v1;
}

uint64_t sub_2462DAF08(int a1)
{
  uint64_t result;
  int v3;
  unsigned int v4;
  int v5;
  int v6;
  unsigned int v7;

  result = 1;
  if (a1 > 19746)
  {
    if (a1 > 44937)
    {
      if (a1 > 53603)
      {
        if (a1 <= 61511)
        {
          if (a1 <= 54387)
          {
            if (a1 == 53604)
              return result;
            v3 = 53617;
          }
          else
          {
            if ((a1 - 54388) < 2)
              return result;
            v3 = 61355;
          }
        }
        else
        {
          if ((a1 - 62159) < 4 || (a1 - 61512) < 2)
            return result;
          v3 = 63372;
        }
      }
      else if (a1 > 49068)
      {
        if ((a1 - 49069) < 5)
          return result;
        v3 = 53485;
      }
      else
      {
        if ((a1 - 47347) <= 6 && ((1 << (a1 + 13)) & 0x67) != 0)
          return result;
        v3 = 44938;
      }
    }
    else if (a1 <= 34311)
    {
      if (a1 > 26514)
      {
        if (a1 > 30600)
        {
          if (a1 == 30601)
            return result;
          v3 = 32968;
        }
        else
        {
          if ((a1 - 27126) <= 6 && ((1 << (a1 + 10)) & 0x61) != 0)
            return result;
          v3 = 26515;
        }
      }
      else
      {
        if ((a1 - 19747) <= 0x12 && ((1 << (a1 - 35)) & 0x41805) != 0)
          return result;
        v3 = 25886;
      }
    }
    else if (a1 <= 38253)
    {
      if (a1 > 36438)
      {
        if (a1 == 36439)
          return result;
        v3 = 36441;
      }
      else
      {
        if (a1 == 34312)
          return result;
        v3 = 36064;
      }
    }
    else
    {
      if ((a1 - 42618) < 5 || (a1 - 42188) < 3)
        return result;
      v3 = 38254;
    }
    goto LABEL_69;
  }
  if (a1 <= 15767)
  {
    if (a1 > 7824)
    {
      if (a1 > 13886)
      {
        if (a1 <= 14708)
        {
          if (a1 == 13887)
            return result;
          v3 = 14030;
        }
        else
        {
          if (a1 == 14709 || a1 == 14819)
            return result;
          v3 = 15575;
        }
      }
      else if (a1 > 12012)
      {
        if ((a1 - 12999) < 2)
          return result;
        v3 = 12013;
      }
      else
      {
        if (a1 == 7825 || a1 == 7830)
          return result;
        v3 = 8199;
      }
      goto LABEL_69;
    }
    if (a1 <= 7700)
    {
      if (a1 == 803 || a1 == 3620)
        return result;
      v3 = 5598;
      goto LABEL_69;
    }
    v4 = a1 - 7701;
    if (v4 <= 0x15)
    {
      v5 = 1 << v4;
      v6 = 2098107;
      goto LABEL_38;
    }
    return 0;
  }
  if (a1 > 18554)
  {
    if ((a1 - 18555) < 0xC)
      return result;
    v7 = a1 - 19679;
    if (v7 <= 0xE)
    {
      v5 = 1 << v7;
      v6 = 16415;
LABEL_38:
      if ((v5 & v6) == 0)
        return 0;
      return result;
    }
    return 0;
  }
  if ((a1 - 15768) < 6)
    return result;
  v3 = 16254;
LABEL_69:
  if (a1 != v3)
    return 0;
  return result;
}

BOOL sub_2462DB248(int a1)
{
  return (a1 - 19679) < 5 || (a1 - 27131) < 2;
}

void sub_2462DB26C(uint64_t a1@<X0>, const char *a2@<X1>, _QWORD *a3@<X8>)
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  id v7;

  sub_24630F170(a1, a2);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (const char *)objc_msgSend_UTF8String(v7, v4, v5);
  strlen(v6);
  a3[1] = 0;
  a3[2] = 0;
  *a3 = 0;
  skit::to_u16string();

}

void sub_2462DB2C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v10;

  if (*(char *)(v10 + 23) < 0)
    operator delete(*(void **)v10);

  _Unwind_Resume(a1);
}

__CFString *sub_2462DB2F4(int a1, int a2)
{
  if (a2 == 49073 && (a1 - 1) <= 4)
    return off_25175EEE0[a1 - 1];
  else
    return 0;
}

void sub_2462DB324(int a1@<W0>, __int16 a2@<W1>, char a3@<W3>, uint64_t a4@<X8>)
{
  size_t v7;
  _DWORD *v8;
  uint64_t v9;
  char v10;
  void *v11;
  size_t __n;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  if ((a1 - 2) >= 2)
  {
    if (a1 == 5)
    {
      *(_WORD *)(a4 + 16) = 2049;
      *(_QWORD *)a4 = a4 + 16;
      v9 = 0x800000002;
    }
    else
    {
      *(_BYTE *)(a4 + 16) = -1;
      *(_QWORD *)a4 = a4 + 16;
      v9 = 0x800000001;
    }
    *(_QWORD *)(a4 + 8) = v9;
  }
  else
  {
    v11 = v13;
    __n = 0x800000000;
    if ((a2 & 1) != 0)
    {
      v10 = 2;
      sub_2462DB544((size_t)&v11, &v10);
      v10 = 3;
      sub_2462DB544((size_t)&v11, &v10);
      v10 = 4;
      sub_2462DB544((size_t)&v11, &v10);
      if ((a2 & 0x100) != 0)
      {
        v10 = 5;
        sub_2462DB544((size_t)&v11, &v10);
      }
    }
    if ((a3 & 2) != 0)
    {
      v10 = 6;
      sub_2462DB544((size_t)&v11, &v10);
    }
    if ((a3 & 1) != 0)
    {
      v10 = 9;
      sub_2462DB544((size_t)&v11, &v10);
    }
    if ((a3 & 4) != 0)
    {
      v10 = 7;
      sub_2462DB544((size_t)&v11, &v10);
    }
    v7 = __n;
    if ((_DWORD)__n)
    {
      if (v11 == v13)
      {
        *(_QWORD *)a4 = a4 + 16;
        v8 = (_DWORD *)(a4 + 12);
        memcpy((void *)(a4 + 16), v13, v7);
      }
      else
      {
        v8 = (_DWORD *)&__n + 1;
        *(_QWORD *)a4 = v11;
        *(_DWORD *)(a4 + 12) = HIDWORD(__n);
      }
      *v8 = 8;
      *(_DWORD *)(a4 + 8) = v7;
    }
    else
    {
      *(_BYTE *)(a4 + 16) = -1;
      *(_QWORD *)a4 = a4 + 16;
      *(_QWORD *)(a4 + 8) = 0x800000001;
      if (v11 != v13)
        free(v11);
    }
  }
}

void sub_2462DB510(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11)
{
  void *v11;

  if (a11 != v11)
    free(a11);
  _Unwind_Resume(exception_object);
}

size_t sub_2462DB544(size_t result, _BYTE *a2)
{
  size_t v3;
  unsigned int v4;

  v3 = result;
  v4 = *(_DWORD *)(result + 8);
  if (v4 == *(_DWORD *)(result + 12))
  {
    result = sub_2462DBAB0(result, v4 + (v4 >> 1) + 1);
    v4 = *(_DWORD *)(v3 + 8);
  }
  *(_BYTE *)(*(_QWORD *)v3 + v4) = *a2;
  ++*(_DWORD *)(v3 + 8);
  return result;
}

uint64_t sub_2462DB5A0(uint64_t a1, unsigned __int16 *a2, unsigned __int16 *a3)
{
  unsigned __int16 *v5;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a2 != a3)
  {
    v5 = a2;
    do
    {
      sub_2462DB618(a1, v5, v5);
      ++v5;
    }
    while (v5 != a3);
  }
  return a1;
}

void sub_2462DB604(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_2462DBA68(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_2462DB618(uint64_t a1, unsigned __int16 *a2, _WORD *a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  void **v9;
  _QWORD *v10;
  unint64_t v11;
  float v12;
  float v13;
  _BOOL8 v14;
  unint64_t v15;
  unint64_t v16;
  size_t v17;
  uint64_t v18;
  _QWORD *v19;
  unint64_t v20;

  v6 = *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v3 = *a2;
      if (v7 <= v6)
        v3 = v6 % v7;
    }
    else
    {
      v3 = ((_DWORD)v7 - 1) & v6;
    }
    v9 = *(void ***)(*(_QWORD *)a1 + 8 * v3);
    if (v9)
    {
      v10 = *v9;
      if (*v9)
      {
        do
        {
          v11 = v10[1];
          if (v11 == v6)
          {
            if (*((unsigned __int16 *)v10 + 8) == (_DWORD)v6)
              return v10;
          }
          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7)
                v11 %= v7;
            }
            else
            {
              v11 &= v7 - 1;
            }
            if (v11 != v3)
              break;
          }
          v10 = (_QWORD *)*v10;
        }
        while (v10);
      }
    }
  }
  v10 = operator new(0x18uLL);
  *v10 = 0;
  v10[1] = v6;
  *((_WORD *)v10 + 8) = *a3;
  v12 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    v14 = 1;
    if (v7 >= 3)
      v14 = (v7 & (v7 - 1)) != 0;
    v15 = v14 | (2 * v7);
    v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16)
      v17 = v16;
    else
      v17 = v15;
    sub_2462DB834(a1, v17);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6)
        v3 = v6 % v7;
      else
        v3 = v6;
    }
    else
    {
      v3 = ((_DWORD)v7 - 1) & v6;
    }
  }
  v18 = *(_QWORD *)a1;
  v19 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v19)
  {
    *v10 = *v19;
LABEL_38:
    *v19 = v10;
    goto LABEL_39;
  }
  *v10 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v10;
  *(_QWORD *)(v18 + 8 * v3) = a1 + 16;
  if (*v10)
  {
    v20 = *(_QWORD *)(*v10 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7)
        v20 %= v7;
    }
    else
    {
      v20 &= v7 - 1;
    }
    v19 = (_QWORD *)(*(_QWORD *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return v10;
}

void sub_2462DB820(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_2462DB834(uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  unint64_t v5;
  uint8x8_t v6;
  uint64_t v7;

  if (__n == 1)
  {
    prime = 2;
  }
  else
  {
    prime = __n;
    if ((__n & (__n - 1)) != 0)
      prime = std::__next_prime(__n);
  }
  v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(_QWORD *)&v4)
    goto LABEL_16;
  if (prime < *(_QWORD *)&v4)
  {
    v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      v5 = std::__next_prime(v5);
    }
    else
    {
      v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2)
        v5 = v7;
    }
    if (prime <= v5)
      prime = v5;
    if (prime < *(_QWORD *)&v4)
LABEL_16:
      sub_2462DB910(a1, prime);
  }
}

void sub_2462DB910(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint8x8_t v9;
  void *v10;
  _QWORD *v11;
  unint64_t v12;

  if (a2)
  {
    if (a2 >> 61)
      sub_2462D3488();
    v4 = operator new(8 * a2);
    v5 = *(void **)a1;
    *(_QWORD *)a1 = v4;
    if (v5)
      operator delete(v5);
    v6 = 0;
    *(_QWORD *)(a1 + 8) = a2;
    do
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    v7 = *(_QWORD **)(a1 + 16);
    if (v7)
    {
      v8 = v7[1];
      v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2)
          v8 %= a2;
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v8) = a1 + 16;
      v11 = (_QWORD *)*v7;
      if (*v7)
      {
        do
        {
          v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2)
              v12 %= a2;
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v12))
            {
              *(_QWORD *)(*(_QWORD *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *v7 = *v11;
            *v11 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v12);
            **(_QWORD **)(*(_QWORD *)a1 + 8 * v12) = v11;
            v11 = v7;
          }
          v12 = v8;
LABEL_24:
          v7 = v11;
          v11 = (_QWORD *)*v11;
          v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    v10 = *(void **)a1;
    *(_QWORD *)a1 = 0;
    if (v10)
      operator delete(v10);
    *(_QWORD *)(a1 + 8) = 0;
  }
}

uint64_t sub_2462DBA68(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;

  v2 = *(_QWORD **)(a1 + 16);
  if (v2)
  {
    do
    {
      v3 = (_QWORD *)*v2;
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
  v4 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v4)
    operator delete(v4);
  return a1;
}

size_t sub_2462DBAB0(uint64_t a1, size_t size)
{
  _BYTE *v3;
  _BYTE *v4;
  char *v5;
  uint64_t v6;
  _BYTE *v7;
  char v8;
  size_t result;
  std::bad_alloc *exception;
  std::bad_alloc *v11;

  v3 = malloc_type_malloc(size, 0x100004077774924uLL);
  if (!v3)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    v11 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v11, MEMORY[0x24BEDB758], MEMORY[0x24BEDB670]);
  }
  v4 = v3;
  v5 = *(char **)a1;
  v6 = *(unsigned int *)(a1 + 8);
  if ((_DWORD)v6)
  {
    v7 = v4;
    do
    {
      v8 = *v5++;
      *v7++ = v8;
      --v6;
    }
    while (v6);
    v5 = *(char **)a1;
  }
  if (v5 != (char *)(a1 + 16))
    free(v5);
  *(_QWORD *)a1 = v4;
  result = malloc_size(v4);
  *(_DWORD *)(a1 + 12) = result;
  return result;
}

BOOL sub_2462DF164(uint64_t *a1, unsigned int *a2)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;
  unsigned __int16 *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (!a2)
    return 0;
  v3 = *a2;
  if (v3 < 2)
    return 0;
  v6 = v3 - 2;
  sub_2462DF268(a1, *((unsigned __int16 *)a2 + 2));
  v7 = *a1;
  v8 = a1[1];
  v9 = v7 == v8;
  if (v3 >= 0xA && v7 != v8)
  {
    v11 = (unsigned __int16 *)a2 + 3;
    v12 = v7 + 48;
    v13 = v6;
    while (1)
    {
      v14 = *v11;
      v15 = v11[1];
      *(_QWORD *)(v12 - 24) = v14 | (v15 << 32);
      if (v14 > v15)
        break;
      v16 = 2 * (v15 - v14);
      v6 = v13 - (v16 + 8);
      if (v13 < v16 + 8)
        break;
      sub_2462D7834((void **)(v12 - 48), v11 + 2, (v15 - v14));
      _H0 = v11[(unint64_t)v16 / 2 + 2];
      __asm { FCVT            S0, H0 }
      *(_DWORD *)(v12 - 16) = _S0;
      *(_WORD *)(v12 - 8) = v11[(unint64_t)v16 / 2 + 3];
      v9 = v12 == v8;
      if (v12 != v8)
      {
        v11 = (unsigned __int16 *)((char *)v11 + v16 + 8);
        v12 += 48;
        v13 = v6;
        if (v6 > 7)
          continue;
      }
      return !v6 && v9;
    }
    v9 = 0;
    v6 = v13;
  }
  return !v6 && v9;
}

void sub_2462DF268(uint64_t *a1, unint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  BOOL v5;
  unint64_t v6;
  uint64_t v7;

  v3 = a1[1];
  v4 = 0xAAAAAAAAAAAAAAABLL * ((v3 - *a1) >> 4);
  v5 = a2 >= v4;
  v6 = a2 - v4;
  if (v6 != 0 && v5)
  {
    sub_2462DFF74(a1, v6);
  }
  else if (!v5)
  {
    v7 = *a1 + 48 * a2;
    while (v3 != v7)
    {
      if (*(char *)(v3 - 25) < 0)
        operator delete(*(void **)(v3 - 48));
      v3 -= 48;
    }
    a1[1] = v7;
  }
}

uint64_t sub_2462DF2F4(unint64_t a1, unsigned __int16 a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const void *v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  void **v22;
  void **v23;
  unsigned int v24;
  int v25;
  unsigned int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  char *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  char *v36;
  int v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  unsigned int v48;
  unsigned __int16 v49;
  uint64_t v50;
  void **v51;
  void **v52;
  _BYTE *v53;
  _BYTE *v54;
  uint64_t v55;
  unsigned __int16 v56;

  v4 = a4;
  if (!a3)
    goto LABEL_15;
  v7 = *a3;
  v8 = a3[1];
  if (*a3 != v8)
  {
    v9 = 2;
    do
    {
      v10 = *(unsigned __int8 *)(v7 + 23);
      if ((v10 & 0x80u) != 0)
        v10 = *(_QWORD *)(v7 + 8);
      v9 += 2 * v10 + 18;
      v7 += 48;
    }
    while (v7 != v8);
    if (!v9)
    {
LABEL_15:
      v14 = 0;
      if (!a4)
        goto LABEL_55;
      goto LABEL_16;
    }
  }
  sub_2462DF6DC(&v53, a3);
  v11 = v53;
  if (v54 == v53)
    v12 = &unk_25756B768;
  else
    v12 = v53;
  v13 = sub_2462E0BDC(a1, v12, v54 - v53);
  if (v11)
    operator delete(v11);
  v14 = v13;
  if (v4)
  {
LABEL_16:
    v15 = *(_QWORD *)(v4 + 8) - *(_QWORD *)v4;
    v49 = a2;
    v48 = v14;
    if (v15)
    {
      if (v15 < 0)
        sub_2462D357C();
      v16 = (char *)sub_2462E00E4(v15 >> 5);
      v18 = v16;
      v19 = *(_QWORD *)v4;
      v50 = *(_QWORD *)(v4 + 8);
      if (*(_QWORD *)v4 == v50)
      {
        v31 = v16;
      }
      else
      {
        v20 = &v16[4 * v17];
        v21 = v16;
        do
        {
          v53 = 0;
          v54 = 0;
          v55 = 0;
          sub_2462E0118((char *)&v53, *(__int128 **)v19, *(__int128 **)(v19 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v19 + 8) - *(_QWORD *)v19) >> 4));
          v56 = *(_WORD *)(v19 + 24);
          sub_2462DF6DC(&v51, (uint64_t *)&v53);
          v22 = v51;
          if (v52 == v51)
            v23 = (void **)&unk_25756B768;
          else
            v23 = v51;
          v24 = sub_2462E0BDC(a1, v23, (char *)v52 - (char *)v51);
          v25 = v56;
          sub_2462E0334(a1);
          v26 = v24;
          *(_BYTE *)(a1 + 70) = 1;
          v27 = *(_DWORD *)(a1 + 32);
          v28 = *(_DWORD *)(a1 + 48);
          v29 = *(_DWORD *)(a1 + 40);
          sub_2462E0394((_DWORD *)a1, 4, v26);
          sub_2462E0858(a1, 6, v25);
          v30 = sub_2462E0908(a1, v27 - v28 + v29);
          if (v22)
            operator delete(v22);
          if (v21 >= v20)
          {
            v32 = (v21 - v18) >> 2;
            v33 = v32 + 1;
            if ((unint64_t)(v32 + 1) >> 62)
              sub_2462D357C();
            if ((v20 - v18) >> 1 > v33)
              v33 = (v20 - v18) >> 1;
            if ((unint64_t)(v20 - v18) >= 0x7FFFFFFFFFFFFFFCLL)
              v34 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v34 = v33;
            if (v34)
              v34 = (unint64_t)sub_2462E00E4(v34);
            else
              v35 = 0;
            v36 = (char *)(v34 + 4 * v32);
            *(_DWORD *)v36 = v30;
            v31 = v36 + 4;
            while (v21 != v18)
            {
              v37 = *((_DWORD *)v21 - 1);
              v21 -= 4;
              *((_DWORD *)v36 - 1) = v37;
              v36 -= 4;
            }
            v20 = (char *)(v34 + 4 * v35);
            if (v18)
              operator delete(v18);
            v18 = v36;
          }
          else
          {
            *(_DWORD *)v21 = v30;
            v31 = v21 + 4;
          }
          v51 = (void **)&v53;
          sub_2462D3760(&v51);
          v19 += 32;
          v21 = v31;
        }
        while (v19 != v50);
      }
    }
    else
    {
      v18 = 0;
      v31 = 0;
    }
    v38 = v31 - v18;
    if (v31 == v18)
      v39 = (char *)&unk_246318180;
    else
      v39 = v18;
    v4 = v38 >> 2;
    sub_2462E0C44(a1, v38 >> 2, 4uLL);
    if (v18 != v31)
    {
      v40 = v39 - 4;
      v41 = v4;
      do
      {
        v42 = sub_2462E0458((_DWORD *)a1, *(_DWORD *)&v40[4 * v41]);
        sub_2462E04C4(a1, v42);
        --v41;
      }
      while (v41);
    }
    LODWORD(v4) = sub_2462E0C9C(a1, v4);
    if (v18)
      operator delete(v18);
    a2 = v49;
    v14 = v48;
  }
LABEL_55:
  sub_2462E0334(a1);
  *(_BYTE *)(a1 + 70) = 1;
  v44 = *(_QWORD *)(a1 + 40);
  v43 = *(_QWORD *)(a1 + 48);
  v45 = *(_QWORD *)(a1 + 32);
  if ((_DWORD)v4)
  {
    v46 = sub_2462E0458((_DWORD *)a1, v4);
    sub_2462E03D0(a1, 8, v46);
  }
  sub_2462E0394((_DWORD *)a1, 6, v14);
  sub_2462E0858(a1, 4, a2);
  return sub_2462E0908(a1, (int)v45 - (int)v43 + (int)v44);
}

void sub_2462DF678(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  void *v15;

  if (v15)
    operator delete(v15);
  _Unwind_Resume(exception_object);
}

void sub_2462DF6DC(_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  size_t v5;
  uint64_t v6;
  uint64_t v7;
  _WORD *v8;
  uint64_t v9;
  _WORD *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  const void *v16;
  float v17;
  float v18;
  _WORD *v25;

  v3 = *a2;
  v4 = a2[1];
  v5 = 2;
  if (*a2 != v4)
  {
    v6 = *a2;
    do
    {
      v7 = *(unsigned __int8 *)(v6 + 23);
      if ((v7 & 0x80u) != 0)
        v7 = *(_QWORD *)(v6 + 8);
      v5 += 2 * v7 + 8;
      v6 += 48;
    }
    while (v6 != v4);
    if (v5 <= 1)
    {
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
      return;
    }
    if ((v5 & 0x8000000000000000) != 0)
      sub_2462D357C();
  }
  v8 = operator new(v5);
  bzero(v8, v5);
  *v8 = -21845 * ((v4 - v3) >> 4);
  v9 = v5 - 2;
  if (v4 != v3)
  {
    v10 = v8 + 1;
    do
    {
      v11 = *(unsigned __int8 *)(v3 + 23);
      v12 = (char)v11;
      if ((v11 & 0x80u) != 0)
        v11 = *(_QWORD *)(v3 + 8);
      v13 = v11;
      v14 = 2 * v11 + 8;
      v15 = v9 < v14;
      v9 -= v14;
      if (v15)
        goto LABEL_26;
      *v10 = *(_DWORD *)(v3 + 24);
      v10[1] = *(_DWORD *)(v3 + 28);
      v16 = v12 >= 0 ? (const void *)v3 : *(const void **)v3;
      memcpy(v10 + 2, v16, 2 * v11);
      v17 = *(float *)(v3 + 32);
      v18 = v17 <= 65504.0 ? *(float *)(v3 + 32) : 65504.0;
      _S0 = v17 >= -65504.0 ? v18 : -65504.0;
      __asm { FCVT            H0, S0 }
      v25 = &v10[v13];
      v25[2] = _H0;
      v25[3] = *(_WORD *)(v3 + 40);
      if (v14 < 1)
        goto LABEL_26;
      v10 = (_WORD *)((char *)v10 + v14);
      v3 += 48;
    }
    while (v3 != v4);
  }
  if (v9)
  {
LABEL_26:
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
    operator delete(v8);
    return;
  }
  *a1 = v8;
  a1[1] = (char *)v8 + v5;
  a1[2] = (char *)v8 + v5;
}

uint64_t sub_2462DF8A0(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  const void *v6;
  const char *v7;
  uint64_t v8;
  size_t v9;
  size_t v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v3 = objc_retainAutorelease(a2);
  v6 = (const void *)objc_msgSend_bytes(v3, v4, v5);
  v9 = objc_msgSend_length(v3, v7, v8);
  v10 = v9;
  if (v9)
  {
    if ((v9 & 0x8000000000000000) != 0)
      sub_2462D357C();
    v11 = operator new(v9);
    memcpy(v11, v6, v10);
    v12 = v11;
  }
  else
  {
    v12 = 0;
    v11 = &unk_25756B768;
  }
  v13 = sub_2462E0BDC(a1, v11, v10);
  if (v12)
    operator delete(v12);

  return v13;
}

void sub_2462DF950(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  if (v2)
    operator delete(v2);

  _Unwind_Resume(a1);
}

uint64_t sub_2462DF974(unint64_t a1, int a2, void *a3, void *a4, uint64_t a5, uint64_t *a6)
{
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t i;
  void *v24;
  unsigned int v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  int v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  char *v35;
  char *v36;
  int v37;
  uint64_t v38;
  int v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  unsigned int v47;
  unint64_t v48;
  const void *v49;
  _BYTE *v50;
  void *v51;
  unsigned int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  unsigned int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  _BYTE *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unsigned int v68;
  uint64_t v69;
  uint64_t v71;
  id v74;
  id v75;
  id obj;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  uint64_t v82;

  HIDWORD(v71) = a2;
  v82 = *MEMORY[0x24BDAC8D0];
  v74 = a3;
  v75 = a4;
  objc_msgSend_data(v74, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v71) = sub_2462DF8A0(a1, v10);

  if (v75)
  {
    v13 = objc_msgSend_count(v75, v11, v12, v71);
    if (v13)
    {
      if (v13 >> 62)
        sub_2462D357C();
      v14 = (char *)sub_2462E00E4(v13);
      v16 = &v14[4 * v15];
    }
    else
    {
      v14 = 0;
      v16 = 0;
    }
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    obj = v75;
    v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v77, v81, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v78;
      v22 = v14;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v78 != v21)
            objc_enumerationMutation(obj);
          objc_msgSend_data(*(void **)(*((_QWORD *)&v77 + 1) + 8 * i), v18, v19);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = sub_2462DF8A0(a1, v24);

          sub_2462E0334(a1);
          v26 = v25;
          *(_BYTE *)(a1 + 70) = 1;
          v27 = *(_QWORD *)(a1 + 40);
          v28 = *(_QWORD *)(a1 + 48);
          v29 = *(_QWORD *)(a1 + 32);
          sub_2462E0394((_DWORD *)a1, 4, v26);
          v30 = sub_2462E0908(a1, (int)v29 - (int)v28 + (int)v27);
          v31 = v30;
          if (v22 >= v16)
          {
            v32 = (v22 - v14) >> 2;
            v33 = v32 + 1;
            if ((unint64_t)(v32 + 1) >> 62)
              sub_2462D357C();
            if ((v16 - v14) >> 1 > v33)
              v33 = (v16 - v14) >> 1;
            if ((unint64_t)(v16 - v14) >= 0x7FFFFFFFFFFFFFFCLL)
              v34 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v34 = v33;
            if (v34)
              v34 = (unint64_t)sub_2462E00E4(v34);
            else
              v18 = 0;
            v35 = (char *)(v34 + 4 * v32);
            *(_DWORD *)v35 = v31;
            v36 = v35 + 4;
            while (v22 != v14)
            {
              v37 = *((_DWORD *)v22 - 1);
              v22 -= 4;
              *((_DWORD *)v35 - 1) = v37;
              v35 -= 4;
            }
            v16 = (char *)(v34 + 4 * (_QWORD)v18);
            if (v14)
              operator delete(v14);
            v14 = v35;
            v22 = v36;
          }
          else
          {
            *(_DWORD *)v22 = v30;
            v22 += 4;
          }
        }
        v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v77, v81, 16);
      }
      while (v20);

      if (v14 != v22)
      {
        sub_2462E0C44(a1, (v22 - v14) >> 2, 4uLL);
        v38 = ((v22 - v14) >> 2) - 1;
        do
        {
          v39 = sub_2462E0458((_DWORD *)a1, *(_DWORD *)&v14[4 * v38]);
          sub_2462E04C4(a1, v39);
          --v38;
        }
        while (v38 != -1);
        v40 = sub_2462E0C9C(a1, (v22 - v14) >> 2);
        goto LABEL_37;
      }
    }
    else
    {

    }
  }
  else
  {
    v14 = 0;
  }
  v40 = 0;
LABEL_37:
  v42 = *a6;
  v41 = a6[1];
  if (*a6 == v41)
  {
    v47 = 0;
  }
  else
  {
    v43 = (v41 - v42) >> 2;
    sub_2462E0C44(a1, v43, 4uLL);
    v44 = v42 - 4;
    v45 = v43;
    do
    {
      v46 = sub_2462E0458((_DWORD *)a1, *(_DWORD *)(v44 + 4 * v45));
      sub_2462E04C4(a1, v46);
      --v45;
    }
    while (v45);
    v47 = sub_2462E0C9C(a1, v43);
  }
  v48 = *(_QWORD *)(a5 + 8);
  if (v48)
  {
    v49 = *(const void **)a5;
    sub_2462E0334(a1);
    sub_2462E0BA4(a1, v48 + 1, 4uLL);
    v50 = (_BYTE *)(*(_QWORD *)(a1 + 48) - sub_2462E0598(a1, 1uLL));
    *(_QWORD *)(a1 + 48) = v50;
    *v50 = 0;
    v51 = (void *)(*(_QWORD *)(a1 + 48) - sub_2462E0598(a1, v48));
    *(_QWORD *)(a1 + 48) = v51;
    memcpy(v51, v49, v48);
    sub_2462E04C4(a1, v48);
    v52 = *(_DWORD *)(a1 + 32) - *(_DWORD *)(a1 + 48) + *(_DWORD *)(a1 + 40);
  }
  else
  {
    v52 = 0;
  }
  sub_2462E0334(a1);
  *(_BYTE *)(a1 + 70) = 1;
  v53 = *(_DWORD *)(a1 + 32);
  v54 = *(_DWORD *)(a1 + 48);
  v55 = *(_DWORD *)(a1 + 40);
  if (v52)
  {
    v56 = sub_2462E0458((_DWORD *)a1, v52);
    sub_2462E03D0(a1, 10, v56);
  }
  if (v40)
  {
    v57 = sub_2462E0458((_DWORD *)a1, v40);
    sub_2462E03D0(a1, 8, v57);
  }
  sub_2462E0394((_DWORD *)a1, 6, v71);
  sub_2462E0858(a1, 4, SHIDWORD(v71));
  v58 = sub_2462E0908(a1, v53 - v54 + v55);
  sub_2462E0334(a1);
  *(_BYTE *)(a1 + 70) = 1;
  v59 = *(_DWORD *)(a1 + 32);
  v60 = *(_DWORD *)(a1 + 48);
  v61 = *(_DWORD *)(a1 + 40);
  if (v58)
  {
    v62 = sub_2462E0458((_DWORD *)a1, v58);
    sub_2462E03D0(a1, 8, v62);
  }
  if (v47)
  {
    v63 = sub_2462E0458((_DWORD *)a1, v47);
    sub_2462E03D0(a1, 6, v63);
  }
  sub_2462E0518(a1, 1uLL);
  v64 = (_BYTE *)(*(_QWORD *)(a1 + 48) - sub_2462E0598(a1, 1uLL));
  *(_QWORD *)(a1 + 48) = v64;
  *v64 = 1;
  v65 = *(_QWORD *)(a1 + 40);
  v66 = *(_QWORD *)(a1 + 48);
  v67 = *(_QWORD *)(a1 + 32);
  sub_2462E0598(a1, 8uLL);
  **(_QWORD **)(a1 + 56) = (v67 - v66 + v65) | 0x400000000;
  *(_QWORD *)(a1 + 56) += 8;
  ++*(_DWORD *)(a1 + 64);
  v68 = *(unsigned __int16 *)(a1 + 68);
  if (v68 <= 4)
    LOWORD(v68) = 4;
  *(_WORD *)(a1 + 68) = v68;
  v69 = sub_2462E0908(a1, v59 - v60 + v61);
  if (v14)
    operator delete(v14);

  return v69;
}

void sub_2462DFEE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, uint64_t a14)
{
  void *v14;

  if (v14)
    operator delete(v14);

  _Unwind_Resume(a1);
}

uint64_t sub_2462DFF74(uint64_t *a1, unint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  _QWORD v16[5];

  v6 = a1[2];
  result = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD *)(result - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - v7) >> 4) >= a2)
  {
    if (a2)
    {
      v13 = v7 + 48 * a2;
      do
      {
        *(_OWORD *)(v7 + 16) = 0uLL;
        *(_OWORD *)(v7 + 32) = 0uLL;
        *(_OWORD *)v7 = 0uLL;
        *(_DWORD *)(v7 + 32) = 1065353216;
        *(_DWORD *)(v7 + 38) = 196609;
        v7 += 48;
      }
      while (v7 != v13);
      v7 = v13;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = 0xAAAAAAAAAAAAAAABLL * ((v7 - *a1) >> 4);
    v9 = v8 + a2;
    if (v8 + a2 > 0x555555555555555)
      sub_2462D357C();
    v10 = 0xAAAAAAAAAAAAAAABLL * ((v5 - *a1) >> 4);
    if (2 * v10 > v9)
      v9 = 2 * v10;
    if (v10 >= 0x2AAAAAAAAAAAAAALL)
      v11 = 0x555555555555555;
    else
      v11 = v9;
    v16[4] = result;
    if (v11)
      v12 = (char *)sub_2462D7644(result, v11);
    else
      v12 = 0;
    v14 = &v12[48 * v8];
    v16[0] = v12;
    v16[1] = v14;
    v16[3] = &v12[48 * v11];
    v15 = &v14[48 * a2];
    do
    {
      *((_OWORD *)v14 + 1) = 0uLL;
      *((_OWORD *)v14 + 2) = 0uLL;
      *(_OWORD *)v14 = 0uLL;
      *((_DWORD *)v14 + 8) = 1065353216;
      *(_DWORD *)(v14 + 38) = 196609;
      v14 += 48;
    }
    while (v14 != v15);
    v16[2] = v15;
    sub_2462D75D0(a1, v16);
    return sub_2462D77AC((uint64_t)v16);
  }
  return result;
}

void sub_2462E00D0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_2462D77AC((uint64_t)va);
  _Unwind_Resume(a1);
}

void *sub_2462E00E4(unint64_t a1)
{
  if (a1 >> 62)
    sub_2462D3488();
  return operator new(4 * a1);
}

char *sub_2462E0118(char *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  char *v6;

  if (a4)
  {
    v6 = result;
    sub_2462E019C(result, a4);
    result = sub_2462E01EC((uint64_t)(v6 + 16), a2, a3, *((char **)v6 + 1));
    *((_QWORD *)v6 + 1) = result;
  }
  return result;
}

void sub_2462E017C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v9 + 8) = v10;
  sub_2462D3760(&a9);
  _Unwind_Resume(a1);
}

char *sub_2462E019C(_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0x555555555555556)
    sub_2462D357C();
  result = (char *)sub_2462D7644((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[48 * v4];
  return result;
}

char *sub_2462E01EC(uint64_t a1, __int128 *a2, __int128 *a3, char *__dst)
{
  char *v4;
  __int128 *v6;
  __int128 v7;
  char *v8;
  __int128 v9;
  _QWORD v11[3];
  char v12;
  char *v13;
  char *v14;

  v4 = __dst;
  v13 = __dst;
  v14 = __dst;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  v12 = 0;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        sub_2462D7540(v4, *(void **)v6, *((_QWORD *)v6 + 1));
        v8 = v14;
      }
      else
      {
        v7 = *v6;
        *((_QWORD *)v4 + 2) = *((_QWORD *)v6 + 2);
        *(_OWORD *)v4 = v7;
        v8 = v4;
      }
      v9 = *(__int128 *)((char *)v6 + 24);
      *((_QWORD *)v4 + 5) = *((_QWORD *)v6 + 5);
      *(_OWORD *)(v4 + 24) = v9;
      v6 += 3;
      v4 = v8 + 48;
      v14 = v8 + 48;
    }
    while (v6 != a3);
  }
  v12 = 1;
  sub_2462E02BC((uint64_t)v11);
  return v4;
}

void sub_2462E02A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_2462E02BC((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t sub_2462E02BC(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    sub_2462E02F0(a1);
  return a1;
}

void sub_2462E02F0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = **(_QWORD **)(a1 + 16);
  v2 = **(_QWORD **)(a1 + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 - 25) < 0)
      operator delete(*(void **)(v1 - 48));
    v1 -= 48;
  }
}

uint64_t sub_2462E0334(uint64_t result)
{
  if (*(_BYTE *)(result + 70))
    __assert_rtn("NotNested", "flatbuffers.h", 1432, "!nested");
  if (*(_DWORD *)(result + 64))
    __assert_rtn("NotNested", "flatbuffers.h", 1434, "!num_field_loc");
  return result;
}

_DWORD *sub_2462E0394(_DWORD *result, uint64_t a2, unsigned int a3)
{
  unint64_t v4;
  int v5;

  if (a3)
  {
    v4 = (unint64_t)result;
    v5 = sub_2462E0458(result, a3);
    return (_DWORD *)sub_2462E03D0(v4, a2, v5);
  }
  return result;
}

unint64_t sub_2462E03D0(unint64_t result, uint64_t a2, int a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;

  v4 = result;
  if (a3 || *(_BYTE *)(result + 80))
  {
    v5 = sub_2462E04C4(result, a3);
    result = sub_2462E0598(v4, 8uLL);
    **(_QWORD **)(v4 + 56) = v5 | (unint64_t)(a2 << 32);
    *(_QWORD *)(v4 + 56) += 8;
    ++*(_DWORD *)(v4 + 64);
    v6 = *(unsigned __int16 *)(v4 + 68);
    if (v6 <= a2)
      LOWORD(v6) = a2;
    *(_WORD *)(v4 + 68) = v6;
  }
  return result;
}

uint64_t sub_2462E0458(_DWORD *a1, unsigned int a2)
{
  unsigned int v4;
  BOOL v5;
  unsigned int v6;

  sub_2462E0518((uint64_t)a1, 4uLL);
  if (!a2 || (v4 = a1[8] - a1[12] + a1[10], v5 = v4 >= a2, v6 = v4 - a2, !v5))
    __assert_rtn("ReferTo", "flatbuffers.h", 1419, "off && off <= GetSize()");
  return v6 + 4;
}

uint64_t sub_2462E04C4(uint64_t a1, int a2)
{
  _DWORD *v4;

  sub_2462E0518(a1, 4uLL);
  v4 = (_DWORD *)(*(_QWORD *)(a1 + 48) - sub_2462E0598(a1, 4uLL));
  *(_QWORD *)(a1 + 48) = v4;
  *v4 = a2;
  return (*(_DWORD *)(a1 + 32) - (_DWORD)v4 + *(_DWORD *)(a1 + 40));
}

unint64_t sub_2462E0518(uint64_t a1, unint64_t a2)
{
  if (*(_QWORD *)(a1 + 72) < a2)
    *(_QWORD *)(a1 + 72) = a2;
  return sub_2462E054C(a1, (a2 - 1) & -(uint64_t)(*(_DWORD *)(a1 + 32) - *(_DWORD *)(a1 + 48) + *(_DWORD *)(a1 + 40)));
}

unint64_t sub_2462E054C(uint64_t a1, unint64_t a2)
{
  unint64_t result;
  uint64_t v5;

  result = sub_2462E0598(a1, a2);
  *(_QWORD *)(a1 + 48) -= result;
  if (a2)
  {
    v5 = 0;
    do
      *(_BYTE *)(*(_QWORD *)(a1 + 48) + v5++) = 0;
    while (a2 != v5);
  }
  return result;
}

unint64_t sub_2462E0598(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v5;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  if (v2 < v3 || (v5 = *(_QWORD *)(a1 + 40), v3 < v5))
    __assert_rtn("ensure_space", "flatbuffers.h", 988, "cur_ >= scratch_ && scratch_ >= buf_");
  if (v2 - v3 < a2)
  {
    sub_2462E0644((uint64_t *)a1, a2);
    v5 = *(_QWORD *)(a1 + 40);
    v2 = *(_QWORD *)(a1 + 48);
  }
  if ((*(_DWORD *)(a1 + 32) - v2 + v5) >= 0x7FFFFFFF)
    __assert_rtn("ensure_space", "flatbuffers.h", 992, "size() < FLATBUFFERS_MAX_BUFFER_SIZE");
  return a2;
}

uint64_t sub_2462E0644(uint64_t *a1, unint64_t a2)
{
  char *v4;
  unint64_t v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t (**v13)();

  v5 = a1[4];
  v4 = (char *)a1[5];
  v6 = &v4[v5 - a1[6]];
  v7 = a1[7] - (_QWORD)v4;
  if (v5)
    v8 = v5 >> 1;
  else
    v8 = a1[2];
  if (v8 > a2)
    a2 = v8;
  v9 = (v5 + a1[3] + a2 - 1) & -a1[3];
  a1[4] = v9;
  v10 = *a1;
  if (v4)
  {
    if (v10)
    {
      result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v10 + 32))(v10);
    }
    else
    {
      v13 = &off_25175EF20;
      result = (uint64_t)sub_2462E0740((uint64_t)&v13, v4, v5, v9, v6, v7);
    }
  }
  else if (v10)
  {
    result = (*(uint64_t (**)(uint64_t, unint64_t))(*(_QWORD *)v10 + 16))(v10, v9);
  }
  else
  {
    result = operator new[]();
  }
  v12 = result + a1[4] - v6;
  a1[5] = result;
  a1[6] = v12;
  a1[7] = result + v7;
  return result;
}

char *sub_2462E0740(uint64_t a1, char *a2, unint64_t a3, unint64_t a4, size_t a5, size_t a6)
{
  char *v12;

  if (a4 <= a3)
    __assert_rtn("reallocate_downward", "flatbuffers.h", 687, "new_size > old_size");
  v12 = (char *)(*(uint64_t (**)(uint64_t, unint64_t))(*(_QWORD *)a1 + 16))(a1, a4);
  memcpy(&v12[a4 - a5], &a2[a3 - a5], a5);
  memcpy(v12, a2, a6);
  (*(void (**)(uint64_t, char *, unint64_t))(*(_QWORD *)a1 + 24))(a1, a2, a3);
  return v12;
}

void sub_2462E080C()
{
  JUMPOUT(0x249556DC8);
}

uint64_t sub_2462E0820()
{
  return operator new[]();
}

void sub_2462E0838(uint64_t a1, uint64_t a2)
{
  if (a2)
    JUMPOUT(0x249556DB0);
}

unint64_t sub_2462E0858(unint64_t result, uint64_t a2, int a3)
{
  __int16 v3;
  uint64_t v5;
  _WORD *v6;
  uint64_t v7;
  unsigned int v8;

  v3 = a3;
  v5 = result;
  if (a3 || *(_BYTE *)(result + 80))
  {
    sub_2462E0518(result, 2uLL);
    v6 = (_WORD *)(*(_QWORD *)(v5 + 48) - sub_2462E0598(v5, 2uLL));
    *(_QWORD *)(v5 + 48) = v6;
    *v6 = v3;
    v7 = (*(_DWORD *)(v5 + 32) - (_DWORD)v6 + *(_DWORD *)(v5 + 40));
    result = sub_2462E0598(v5, 8uLL);
    **(_QWORD **)(v5 + 56) = v7 | (a2 << 32);
    *(_QWORD *)(v5 + 56) += 8;
    ++*(_DWORD *)(v5 + 64);
    v8 = *(unsigned __int16 *)(v5 + 68);
    if (v8 <= a2)
      LOWORD(v8) = a2;
    *(_WORD *)(v5 + 68) = v8;
  }
  return result;
}

uint64_t sub_2462E0908(uint64_t a1, int a2)
{
  _DWORD *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  unsigned __int16 v8;
  unsigned __int16 *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int *v13;
  uint64_t v14;
  int v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  size_t v19;
  uint64_t v20;
  unsigned int *v21;
  _DWORD *v22;

  if (!*(_BYTE *)(a1 + 70))
    __assert_rtn("EndTable", "flatbuffers.h", 1450, "nested");
  sub_2462E0518(a1, 4uLL);
  v4 = (_DWORD *)(*(_QWORD *)(a1 + 48) - sub_2462E0598(a1, 4uLL));
  *(_QWORD *)(a1 + 48) = v4;
  *v4 = 0;
  v5 = *(_QWORD *)(a1 + 32) - (_QWORD)v4 + *(_QWORD *)(a1 + 40);
  if ((unsigned __int16)(*(_WORD *)(a1 + 68) + 2) <= 4u)
    v6 = 4;
  else
    v6 = (unsigned __int16)(*(_WORD *)(a1 + 68) + 2);
  *(_WORD *)(a1 + 68) = v6;
  v7 = (void *)(*(_QWORD *)(a1 + 48) - sub_2462E0598(a1, v6));
  *(_QWORD *)(a1 + 48) = v7;
  bzero(v7, v6);
  v8 = v5 - a2;
  if ((v5 - a2) >= 0x10000)
    __assert_rtn("EndTable", "flatbuffers.h", 1465, "table_object_size < 0x10000");
  v9 = *(unsigned __int16 **)(a1 + 48);
  if (!v9)
    __assert_rtn("data", "flatbuffers.h", 1016, "cur_");
  v9[1] = v8;
  *v9 = *(_WORD *)(a1 + 68);
  v10 = *(_QWORD *)(a1 + 56);
  if (!v10)
    __assert_rtn("scratch_end", "flatbuffers.h", 1026, "scratch_");
  v11 = *(unsigned int *)(a1 + 64);
  v12 = v10 - 8 * v11;
  if ((_DWORD)v11)
  {
    v13 = (int *)(v10 - 8 * v11);
    do
    {
      v14 = *((unsigned __int16 *)v13 + 2);
      if (*(unsigned __int16 *)((char *)v9 + v14))
        __assert_rtn("EndTable", "flatbuffers.h", 1476, "!ReadScalar<voffset_t>(buf_.data() + field_location->id)");
      v15 = *v13;
      v13 += 2;
      *(unsigned __int16 *)((char *)v9 + v14) = v5 - v15;
    }
    while ((unint64_t)v13 < v10);
  }
  *(_QWORD *)(a1 + 56) = v12;
  *(_DWORD *)(a1 + 64) = 0;
  *(_WORD *)(a1 + 68) = 0;
  v17 = *(_QWORD *)(a1 + 32);
  v16 = *(_QWORD *)(a1 + 40);
  LODWORD(v18) = v17 - (_DWORD)v9 + v16;
  if (*(_BYTE *)(a1 + 81))
  {
    if (!v16)
      __assert_rtn("scratch_data", "flatbuffers.h", 1021, "buf_");
    if (v16 < v12)
    {
      v19 = *v9;
      v20 = v16 + v17;
      v21 = *(unsigned int **)(a1 + 40);
      while (1)
      {
        v18 = *v21;
        if ((_DWORD)v19 == *(unsigned __int16 *)(v20 - v18) && !memcmp((const void *)(v20 - v18), v9, v19))
          break;
        if ((unint64_t)++v21 >= v12)
        {
          LODWORD(v18) = v17 - (_DWORD)v9 + v16;
          goto LABEL_21;
        }
      }
      v9 = (unsigned __int16 *)((char *)v9 + (v17 - (_DWORD)v9 + v16 - v5));
      *(_QWORD *)(a1 + 48) = v9;
    }
  }
LABEL_21:
  if ((_DWORD)v18 == (_DWORD)v17 + (_DWORD)v16 - (_DWORD)v9)
  {
    sub_2462E0598(a1, 4uLL);
    v22 = *(_DWORD **)(a1 + 56);
    *v22 = v18;
    *(_QWORD *)(a1 + 56) = v22 + 1;
    v17 = *(_QWORD *)(a1 + 32);
    v16 = *(_QWORD *)(a1 + 40);
  }
  *(_DWORD *)(v16 + v17 - v5) = v18 - v5;
  *(_BYTE *)(a1 + 70) = 0;
  return v5;
}

unint64_t sub_2462E0BA4(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (*(_QWORD *)(a1 + 72) < a3)
    *(_QWORD *)(a1 + 72) = a3;
  return sub_2462E054C(a1, (a3 - 1) & (-a2 - (*(_DWORD *)(a1 + 32) - *(_DWORD *)(a1 + 48) + *(_DWORD *)(a1 + 40))));
}

uint64_t sub_2462E0BDC(uint64_t a1, const void *a2, unint64_t a3)
{
  void *v6;

  sub_2462E0C44(a1, a3, 1uLL);
  if (a3)
  {
    v6 = (void *)(*(_QWORD *)(a1 + 48) - sub_2462E0598(a1, a3));
    *(_QWORD *)(a1 + 48) = v6;
    memcpy(v6, a2, a3);
  }
  return sub_2462E0C9C(a1, a3);
}

unint64_t sub_2462E0C44(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6;

  sub_2462E0334(a1);
  *(_BYTE *)(a1 + 70) = 1;
  v6 = a3 * a2;
  sub_2462E0BA4(a1, v6, 4uLL);
  return sub_2462E0BA4(a1, v6, a3);
}

uint64_t sub_2462E0C9C(uint64_t a1, int a2)
{
  if (!*(_BYTE *)(a1 + 70))
    __assert_rtn("EndVector", "flatbuffers.h", 1672, "nested");
  *(_BYTE *)(a1 + 70) = 0;
  return sub_2462E04C4(a1, a2);
}

uint64_t sub_2462E1018(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend_beginEvaluation_completion_(a2, (const char *)a2, *(_QWORD *)(a1 + 32), a3);
}

uint64_t sub_2462E103C(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend_endEvaluation_(a2, (const char *)a2, a3);
}

uint64_t sub_2462E1098(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend_triggerMaintenance_completion_(a2, (const char *)a2, *(unsigned __int8 *)(a1 + 32), a3);
}

void sub_2462E10A8()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.siri.inference", "EntityMatcher");
  v1 = (void *)qword_25441F970;
  qword_25441F970 = (uint64_t)v0;

}

id sub_2462E19EC(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;

  v1 = a1;
  v4 = v1;
  if (v1)
  {
    v5 = v1;
  }
  else
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v2, v3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

id sub_2462E1A34(int a1, uint64_t a2)
{
  const char *v4;
  uint64_t v5;
  id v6;
  const char *v7;
  void *v8;
  id v9;
  const char *v10;
  id v11;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;

  if (a1)
  {
    v4 = sqlite3_errstr(a1);
    if (v4)
    {
      v5 = (uint64_t)v4;
      v6 = objc_alloc(MEMORY[0x24BDD17C8]);
      v8 = (void *)objc_msgSend_initWithUTF8String_(v6, v7, v5);
      v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v11 = v9;
      if (v8)
      {
        objc_msgSend_setObject_forKey_(v9, v10, (uint64_t)v8, *MEMORY[0x24BDD0FC8]);

      }
    }
    else
    {
      v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    }
    objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v10, a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v11, v14, (uint64_t)v13, CFSTR("SEMSQLiteAPIErrorExtendedCode"));

    v15 = (void *)MEMORY[0x24BDD1540];
    v18 = (void *)objc_msgSend_copy(v11, v16, v17);
    objc_msgSend_errorWithDomain_code_userInfo_(v15, v19, (uint64_t)CFSTR("com.apple.siri.vocabulary.sqlite.api"), a1, v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  sub_2462E19EC(v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

id sub_2462E29E4(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  SEMDatabaseExecutionResult *v10;
  uint64_t v11;
  const char *v12;
  void *v13;

  v7 = a4;
  v8 = a3;
  v9 = a1;
  v10 = [SEMDatabaseExecutionResult alloc];
  v11 = mach_absolute_time();
  v13 = (void *)objc_msgSend_initWithCommand_beginMachTime_endMachTime_rowValueTuples_error_(v10, v12, (uint64_t)v9, a2, v11, v8, v7);

  return v13;
}

void sub_2462E2E14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2462E2F94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  std::__shared_weak_count *v28;
  void *v30;

  if (a21 < 0)
    operator delete(__p);
  if (a28 < 0)
    operator delete(a23);
  std::__shared_weak_count::~__shared_weak_count(v28);
  operator delete(v30);
  _Unwind_Resume(a1);
}

void sub_2462E3368(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v4;

  _Unwind_Resume(a1);
}

void sub_2462E340C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2462E3460(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)SEMSkitReader;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

uint64_t sub_2462E350C(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  _QWORD v5[4];
  id v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_2462E35A0;
  v5[3] = &unk_25175F020;
  v6 = *(id *)(a1 + 32);
  v3 = sub_2462DA56C((uint64_t)"-[SEMSkitReader _activationBlock]_block_invoke", a2, v5);

  return v3;
}

void sub_2462E358C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

uint64_t sub_2462E35A0(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  uint64_t v12;
  std::__shared_weak_count *v13;

  objc_msgSend_boostrap(*(void **)(a1 + 32), a2, a3);
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_msgSend_searcher(v6, v4, v5);
    v7 = v12;
  }
  else
  {
    v7 = 0;
    v13 = 0;
  }
  v8 = skit::IndexReader::open((skit::IndexReader *)(v7 + 16));
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v10 = __ldaxr(p_shared_owners);
    while (__stlxr(v10 - 1, p_shared_owners));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  return v8;
}

void sub_2462E3634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_2462D3524((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t sub_2462E36C4(uint64_t a1, _QWORD *a2)
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_2462E376C;
  v8[3] = &unk_25175F020;
  v9 = *(id *)(a1 + 32);
  v6 = sub_2462DA56C((uint64_t)"-[SEMSkitReader _deactivationBlock]_block_invoke", a2, v8);
  if ((_DWORD)v6)
    objc_msgSend_teardown(*(void **)(a1 + 32), v4, v5);

  return v6;
}

void sub_2462E3754(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

uint64_t sub_2462E376C(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  uint64_t v9;
  std::__shared_weak_count *v10;

  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend_searcher(v3, a2, a3);
    v4 = v9;
  }
  else
  {
    v4 = 0;
    v10 = 0;
  }
  v5 = skit::IndexReader::close((skit::IndexReader *)(v4 + 16));
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v7 = __ldaxr(p_shared_owners);
    while (__stlxr(v7 - 1, p_shared_owners));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  return v5;
}

void sub_2462E37F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_2462D3524((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_2462E38FC(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_2462E39B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2462E39E8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((unint64_t)(a2 - 1) >= 4)
  {
    v5 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315650;
      v7 = "-[SEMSkitReader prewarm]_block_invoke";
      v8 = 1024;
      v9 = a2;
      v10 = 2112;
      v11 = v4;
      _os_log_error_impl(&dword_2462C4000, v5, OS_LOG_TYPE_ERROR, "%s Prewarm failed (%i): %@", (uint8_t *)&v6, 0x1Cu);
    }
  }

}

void sub_2462E3CD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  void *v24;

  sub_2462D3524((uint64_t)&a17);
  _Block_object_dispose(&a19, 8);

  _Unwind_Resume(a1);
}

uint64_t sub_2462E3D28(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_2462E3D38(uint64_t a1)
{

}

void sub_2462E3D40(_QWORD *a1, const char *a2, uint64_t a3)
{
  void **v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  int **v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  void **v16;
  std::__shared_weak_count *v17;
  uint64_t v18[3];

  v4 = (void **)a1[4];
  if (v4)
  {
    objc_msgSend_searcher(v4, a2, a3);
    v4 = v16;
  }
  else
  {
    v16 = 0;
    v17 = 0;
  }
  sub_2462F676C(v4, a1[6], v18);
  v5 = v17;
  if (v17)
  {
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    do
      v7 = __ldaxr(p_shared_owners);
    while (__stlxr(v7 - 1, p_shared_owners));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v9 = *(_QWORD *)(a1[5] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  v11 = (int **)v18[0];
  v12 = v18[1];
  while (v11 != (int **)v12)
  {
    v13 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
    sub_2462EAEC8(v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v13, v15, (uint64_t)v14);

    v11 += 4;
  }
  v16 = (void **)v18;
  sub_2462D3878(&v16);
}

void sub_2462E3E44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10, uint64_t a11, char a12)
{
  a10 = (void **)&a12;
  sub_2462D3878(&a10);
  _Unwind_Resume(a1);
}

uint64_t sub_2462E3E80(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(result + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(result + 56) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

uint64_t sub_2462E3EA4(uint64_t a1)
{
  return sub_2462D3524(a1 + 48);
}

std::string *sub_2462E3EE8(std::string *this, char *a2, char *a3)
{
  char *v4;
  unint64_t v6;
  unint64_t v7;
  std::string::size_type size;
  std::string::size_type v9;
  std::string *v10;
  unint64_t v11;
  void **v12;
  std::string::size_type v13;
  std::string *v14;
  _BYTE *v15;
  char v16;
  std::string::size_type v17;
  void *__p[2];
  unsigned __int8 v20;

  v4 = a2;
  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  v7 = a3 - a2;
  if ((v6 & 0x80000000) != 0)
  {
    if (a3 == a2)
      return this;
    size = this->__r_.__value_.__l.__size_;
    v11 = this->__r_.__value_.__r.__words[2];
    v9 = (v11 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    v10 = (std::string *)this->__r_.__value_.__r.__words[0];
    v6 = HIBYTE(v11);
  }
  else
  {
    if (a3 == a2)
      return this;
    size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    v9 = 22;
    v10 = this;
  }
  if (v10 > (std::string *)v4 || (char *)&v10->__r_.__value_.__l.__data_ + size + 1 <= v4)
  {
    if (v9 - size < v7)
    {
      std::string::__grow_by(this, v9, size + v7 - v9, size, size, 0, 0);
      this->__r_.__value_.__l.__size_ = size;
      LOBYTE(v6) = *((_BYTE *)&this->__r_.__value_.__s + 23);
    }
    v14 = this;
    if ((v6 & 0x80) != 0)
      v14 = (std::string *)this->__r_.__value_.__r.__words[0];
    v15 = (char *)v14 + size;
    do
    {
      v16 = *v4++;
      *v15++ = v16;
    }
    while (v4 != a3);
    *v15 = 0;
    v17 = size + v7;
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
      this->__r_.__value_.__l.__size_ = v17;
    else
      *((_BYTE *)&this->__r_.__value_.__s + 23) = v17 & 0x7F;
  }
  else
  {
    sub_2462E4054(__p, v4, a3, v7);
    if ((v20 & 0x80u) == 0)
      v12 = __p;
    else
      v12 = (void **)__p[0];
    if ((v20 & 0x80u) == 0)
      v13 = v20;
    else
      v13 = (std::string::size_type)__p[1];
    std::string::append(this, (const std::string::value_type *)v12, v13);
    if ((char)v20 < 0)
      operator delete(__p[0]);
  }
  return this;
}

void sub_2462E4038(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *sub_2462E4054(_QWORD *result, char *a2, char *a3, unint64_t a4)
{
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v4 = result;
  if (a4 >= 0x7FFFFFFFFFFFFFF8)
    sub_2462D3400();
  if (a4 > 0x16)
  {
    v8 = (a4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a4 | 7) != 0x17)
      v8 = a4 | 7;
    v9 = v8 + 1;
    result = operator new(v8 + 1);
    v4[1] = a4;
    v4[2] = v9 | 0x8000000000000000;
    *v4 = result;
    v4 = result;
  }
  else
  {
    *((_BYTE *)result + 23) = a4;
  }
  while (a2 != a3)
  {
    v10 = *a2++;
    *(_BYTE *)v4 = v10;
    v4 = (_QWORD *)((char *)v4 + 1);
  }
  *(_BYTE *)v4 = 0;
  return result;
}

void sub_2462E40F8(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_25175F0F0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_2462E4108(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_25175F0F0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x249556DC8);
}

void sub_2462E4138(uint64_t a1)
{
  sub_2462D3524(a1 + 56);
  MEMORY[0x2495568D0](a1 + 40);
  JUMPOUT(0x249556A68);
}

uint64_t sub_2462E4170(uint64_t a1, std::__fs::filesystem::path *a2, std::__fs::filesystem::path *a3)
{
  NSObject *v6;
  std::__fs::filesystem::path __p;
  std::__fs::filesystem::path v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  skit::IndexWriter::IndexWriter((skit::IndexWriter *)(a1 + 16));
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  v9 = *a2;
  a2->__pn_.__r_.__value_.__l.__size_ = 0;
  a2->__pn_.__r_.__value_.__r.__words[2] = 0;
  a2->__pn_.__r_.__value_.__r.__words[0] = 0;
  __p = *a3;
  a3->__pn_.__r_.__value_.__r.__words[0] = 0;
  a3->__pn_.__r_.__value_.__l.__size_ = 0;
  a3->__pn_.__r_.__value_.__r.__words[2] = 0;
  skit::Alias::Alias((skit::Alias *)(a1 + 88), &v9, &__p);
  if (SHIBYTE(__p.__pn_.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__pn_.__r_.__value_.__l.__data_);
  if (SHIBYTE(v9.__pn_.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v9.__pn_.__r_.__value_.__l.__data_);
  *(_WORD *)(a1 + 108) = 0;
  *(_DWORD *)(a1 + 104) = 0;
  *(_DWORD *)(a1 + 112) = -1;
  if (skit::Alias::init((skit::Alias *)(a1 + 88)))
  {
    v6 = qword_25441F958;
    if (os_log_type_enabled((os_log_t)qword_25441F958, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "Indexer";
      _os_log_error_impl(&dword_2462C4000, v6, OS_LOG_TYPE_ERROR, "%s Failed to initialize alias", buf, 0xCu);
    }
  }
  return a1;
}

void sub_2462E42E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v26 = v25;
  sub_2462D3524(v26);
  sub_2462D3524(v24);
  sub_2462D3524(v23);
  if (*(char *)(v21 + 55) < 0)
    operator delete(*(void **)(v21 + 32));
  MEMORY[0x249556978](v22);
  MEMORY[0x249556A68](v21);
  _Unwind_Resume(a1);
}

uint64_t sub_2462E435C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, std::__fs::filesystem::path *a5, std::__fs::filesystem::path *a6, uint64_t a7, int a8, __int16 a9)
{
  NSObject *v14;
  std::__fs::filesystem::path v16;
  std::__fs::filesystem::path v17;
  int __p;
  __int16 __p_4;
  char v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v20 = 2;
  __p = 7733363;
  __p_4 = 0;
  skit::ContextV2::ContextV2();
  skit::ContextV2::index_writer();
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  v17 = *a5;
  a5->__pn_.__r_.__value_.__l.__size_ = 0;
  a5->__pn_.__r_.__value_.__r.__words[2] = 0;
  a5->__pn_.__r_.__value_.__r.__words[0] = 0;
  v16 = *a6;
  a6->__pn_.__r_.__value_.__r.__words[0] = 0;
  a6->__pn_.__r_.__value_.__l.__size_ = 0;
  a6->__pn_.__r_.__value_.__r.__words[2] = 0;
  skit::Alias::Alias((skit::Alias *)(a1 + 88), &v17, &v16);
  if (SHIBYTE(v16.__pn_.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v16.__pn_.__r_.__value_.__l.__data_);
  if (SHIBYTE(v17.__pn_.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v17.__pn_.__r_.__value_.__l.__data_);
  *(_QWORD *)(a1 + 104) = a7;
  *(_DWORD *)(a1 + 112) = a8;
  *(_WORD *)(a1 + 116) = a9;
  skit::IndexWriter::set_mode((skit::IndexWriter *)(a1 + 16));
  skit::IndexWriter::set_dp_class((skit::IndexWriter *)(a1 + 16));
  skit::IndexWriter::flush_threshold((skit::IndexWriter *)(a1 + 16));
  skit::IndexWriter::set_term_index_write_cache((skit::IndexWriter *)(a1 + 16));
  skit::IndexWriter::set_doc_store_write_cache((skit::IndexWriter *)(a1 + 16));
  if (skit::Alias::init((skit::Alias *)(a1 + 88)))
  {
    v14 = qword_25441F958;
    if (os_log_type_enabled((os_log_t)qword_25441F958, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "Indexer";
      _os_log_error_impl(&dword_2462C4000, v14, OS_LOG_TYPE_ERROR, "%s Failed to initialize alias", buf, 0xCu);
    }
  }
  return a1;
}

void sub_2462E4568(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  if (a16 < 0)
    operator delete(__p);
  if (a23 < 0)
    operator delete(a18);
  sub_2462D3524(v32);
  sub_2462D3524(v31);
  if (*(char *)(v29 + 55) < 0)
    operator delete(*(void **)(v29 + 32));
  MEMORY[0x249556978](v30);
  MEMORY[0x249556A68](v29);
  _Unwind_Resume(a1);
}

uint64_t sub_2462E45F4(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  id v8;
  id v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  int *v23;
  char *v24;
  __int128 v25;
  _QWORD v26[4];
  void **v27;
  char v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  void **v38;
  char v39;
  __int128 __dst;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;
  _BYTE buf[24];
  __int128 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v36 = 0uLL;
  v37 = 0;
  v27 = 0;
  v28 = 0;
  v29 = xmmword_246317ED0;
  v30 = 0u;
  v31 = 0u;
  v32 = 0;
  v33 = 1;
  v34 = 256;
  v35 = 0;
  if (!sub_2462E4A3C(a1, v8, v9, a5, (uint64_t *)&v36, (unint64_t)&v27))
  {
LABEL_20:
    v20 = 0xFFFFFFFFLL;
    goto LABEL_21;
  }
  v26[2] = sub_2462D2C84((uint64_t)&v27);
  v26[3] = (v30 - v31 + DWORD2(v30));
  v10 = v36;
  if ((_QWORD)v36 == *((_QWORD *)&v36 + 1))
    goto LABEL_6;
  v11 = 0;
  do
  {
    v11 += (*(unsigned __int16 *)(v10 + 40) << 31 >> 31) & *(unsigned __int16 *)(v10 + 38);
    v10 += 48;
  }
  while (v10 != *((_QWORD *)&v36 + 1));
  if (!v11)
  {
LABEL_6:
    v12 = (id)qword_25441F958;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (void *)MEMORY[0x24BE5B238];
      v14 = (void *)objc_opt_class();
      v17 = objc_msgSend_itemType(v14, v15, v16);
      objc_msgSend_descriptionForTypeIdentifier_(v13, v18, v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "add_cascade_item";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v19;
      _os_log_impl(&dword_2462C4000, v12, OS_LOG_TYPE_INFO, "%s Cascade item conten has 0 indexed fields. itemType: %@", buf, 0x16u);

    }
    sub_2462E7540(buf, byte_246343270);
    *(_QWORD *)&v45 = 0;
    *((_QWORD *)&v45 + 1) = 0x100003F800000;
    LOWORD(v46) = 3;
    HIDWORD(v46) = 0;
    if ((buf[23] & 0x80000000) != 0)
    {
      sub_2462D7540(&__dst, *(void **)buf, *(unint64_t *)&buf[8]);
    }
    else
    {
      __dst = *(_OWORD *)buf;
      v41 = *(_QWORD *)&buf[16];
    }
    v42 = v45;
    v43 = v46;
    v26[0] = 0;
    v25 = 0uLL;
    v38 = (void **)&v25;
    v39 = 0;
    *(_QWORD *)&v25 = operator new(0x30uLL);
    *((_QWORD *)&v25 + 1) = v25;
    v26[0] = v25 + 48;
    *((_QWORD *)&v25 + 1) = sub_2462E687C((uint64_t)v26, &__dst, (__int128 *)buf, (char *)v25);
    sub_2462D722C((uint64_t *)&v36);
    v36 = v25;
    v37 = v26[0];
    v26[0] = 0;
    v25 = 0uLL;
    v38 = (void **)&v25;
    sub_2462D3760(&v38);
    if (SHIBYTE(v41) < 0)
      operator delete((void *)__dst);
    if ((buf[23] & 0x80000000) != 0)
      operator delete(*(void **)buf);
  }
  if (skit::IndexWriter::append() <= 0)
  {
    v21 = (id)qword_25441F958;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v23 = __error();
      v24 = strerror(*v23);
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "add_cascade_item";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = v24;
      _os_log_error_impl(&dword_2462C4000, v21, OS_LOG_TYPE_ERROR, "%s ERROR: failed to append token stream to index. errno: %s", buf, 0x16u);
    }

    goto LABEL_20;
  }
  v20 = 0;
LABEL_21:
  sub_2462D37EC(&v27);
  v27 = (void **)&v36;
  sub_2462D3760(&v27);

  return v20;
}

void sub_2462E4994(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void **a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  void *v27;
  void *v28;
  uint64_t v29;

  if (*(char *)(v29 - 105) < 0)
    operator delete(*(void **)(v29 - 128));
  sub_2462D37EC(&a15);
  a15 = (void **)&a27;
  sub_2462D3760(&a15);

  _Unwind_Resume(a1);
}

uint64_t sub_2462E4A3C(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t *a5, unint64_t a6)
{
  id v11;
  id v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  const char *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  const char *v22;
  void **v23;
  void **v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  int v30;
  unsigned __int16 *v31;
  char *v32;
  int v33;
  unsigned __int16 *v34;
  unsigned __int16 *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  float v39;
  float v40;
  float v41;
  float v42;
  uint64_t v43;
  float *v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char *v50;
  void **v51;
  uint64_t v52;
  unsigned int v53;
  int v54;
  void *v56;
  unint64_t *v57;
  uint64_t v58;
  void *v59;
  unsigned __int16 v60;
  _QWORD v61[13];
  id v62;
  _QWORD v63[3];
  int v64;
  unsigned __int16 v65;
  void *__p;
  void *v67;
  uint64_t v68;
  _QWORD v69[3];
  _QWORD v70[3];
  float v71;
  int v72;
  void **v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  unsigned int v77;
  uint64_t v78;
  _BYTE buf[24];
  char *v80;
  uint64_t *v81;
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  v11 = a2;
  v12 = a3;
  memset(v70, 0, sizeof(v70));
  memset(v69, 0, sizeof(v69));
  __p = 0;
  v67 = 0;
  v68 = 0;
  v73 = (void **)&v75;
  v74 = 0x200000000;
  v13 = (void *)objc_opt_class();
  v16 = objc_msgSend_itemType(v13, v14, v15);
  v17 = sub_2462DA9F0(v16);
  v65 = v17;
  if (v17)
  {
    v63[0] = 0;
    v63[1] = v63;
    v63[2] = 0x2020000000;
    v64 = 0;
    v62 = 0;
    v61[0] = MEMORY[0x24BDAC760];
    v61[1] = 3221225472;
    v61[2] = sub_2462E50F8;
    v61[3] = &unk_25175F138;
    v61[6] = a1;
    v61[7] = &v65;
    v61[8] = v69;
    v61[9] = &v73;
    v61[10] = a5;
    v61[11] = &__p;
    v61[12] = a6;
    v61[4] = v63;
    v61[5] = v70;
    objc_msgSend_recursivelyEnumerateFieldsWithError_usingBlock_(v11, v18, (uint64_t)&v62, v61);
    v19 = v62;
    if (v19)
    {
      v20 = qword_25441F958;
      if (os_log_type_enabled((os_log_t)qword_25441F958, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "analyze_cascade_item";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v19;
        _os_log_error_impl(&dword_2462C4000, v20, OS_LOG_TYPE_ERROR, "%s Field enumeration failed: %@", buf, 0x16u);
      }
      v21 = 0;
    }
    else
    {
      v60 = v65;
      sub_2462DB324(v65, *(_QWORD *)(a1 + 104), *(_WORD *)(a1 + 116), (uint64_t)&v76);
      v58 = a4;
      v59 = v12;
      if ((_DWORD)v74)
      {
        v23 = v73;
        v24 = &v73[5 * v74];
        v57 = (unint64_t *)(a5 + 2);
        do
        {
          if ((skit::AliasSpanMatchCompare::compare_locale((skit::AliasSpanMatchCompare *)*((unsigned __int8 *)v23 + 32)) & 1) != 0)
          {
            v25 = v77;
            if (v77)
            {
              v26 = v76;
              while ((skit::AliasSpanMatchCompare::compare_entity_type((skit::AliasSpanMatchCompare *)*((unsigned __int8 *)v23 + 33)) & 1) == 0)
              {
                ++v26;
                if (!--v25)
                  goto LABEL_51;
              }
              v27 = *a5;
              v28 = a5[1];
              if (*a5 != v28)
              {
                v29 = (char *)*((unsigned __int8 *)v23 + 23);
                v30 = (char)v29;
                if ((char)v29 < 0)
                  v29 = (char *)v23[1];
                v31 = (unsigned __int16 *)*a5;
                do
                {
                  v32 = (char *)*((unsigned __int8 *)v31 + 23);
                  v33 = (char)v32;
                  if ((char)v32 < 0)
                    v32 = (char *)*((_QWORD *)v31 + 1);
                  if (v32 == v29)
                  {
                    if (!v29)
                      goto LABEL_51;
                    if (v33 >= 0)
                      v34 = v31;
                    else
                      v34 = *(unsigned __int16 **)v31;
                    v35 = (unsigned __int16 *)*v23;
                    if (v30 >= 0)
                      v35 = (unsigned __int16 *)v23;
                    v36 = v29;
                    while (*v35 == *v34)
                    {
                      ++v34;
                      ++v35;
                      if (!--v36)
                        goto LABEL_51;
                    }
                  }
                  v31 += 24;
                }
                while (v31 != (unsigned __int16 *)v28);
              }
              v38 = *((unsigned int *)v23 + 6);
              v37 = *((unsigned int *)v23 + 7);
              v39 = 0.0;
              v40 = (float)(v37 - v38);
              v41 = 1.0 / (float)(v40 + 1.0);
              if (v37 > v38)
              {
                v42 = v41 * v40;
                v43 = v37 - v38;
                v44 = (float *)(v27 + 48 * v38 + 32);
                do
                {
                  v39 = v39 + *v44;
                  *v44 = v42 * *v44;
                  v44 += 12;
                  --v43;
                }
                while (v43);
              }
              v72 = 1;
              v71 = v41 * v39;
              if (v28 >= *v57)
              {
                v46 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v28 - v27) >> 4);
                if (v46 + 1 > 0x555555555555555)
                  sub_2462D357C();
                v47 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*v57 - v27) >> 4);
                v48 = 2 * v47;
                if (2 * v47 <= v46 + 1)
                  v48 = v46 + 1;
                if (v47 >= 0x2AAAAAAAAAAAAAALL)
                  v49 = 0x555555555555555;
                else
                  v49 = v48;
                v81 = a5 + 2;
                if (v49)
                  v50 = (char *)sub_2462D7644((uint64_t)v57, v49);
                else
                  v50 = 0;
                *(_QWORD *)buf = v50;
                *(_QWORD *)&buf[8] = &v50[48 * v46];
                *(_QWORD *)&buf[16] = *(_QWORD *)&buf[8];
                v80 = &v50[48 * v49];
                sub_2462E67E8(*(uint64_t *)&buf[8], (__int128 *)v23, &v72, (int *)&v71);
                *(_QWORD *)&buf[16] += 48;
                sub_2462D75D0(a5, buf);
                v45 = a5[1];
                sub_2462D77AC((uint64_t)buf);
              }
              else
              {
                sub_2462E67E8(v28, (__int128 *)v23, &v72, (int *)&v71);
                v45 = v28 + 48;
                a5[1] = v28 + 48;
              }
              a5[1] = v45;
              *(_WORD *)(v45 - 12) = v60;
            }
          }
LABEL_51:
          v23 += 5;
        }
        while (v23 != v24);
      }
      if (v76 != (char *)&v78)
        free(v76);
      if ((_DWORD)v74)
      {
        v51 = v73;
        v52 = 40 * v74;
        do
        {
          if (*((char *)v51 + 23) < 0)
            operator delete(*v51);
          v51 += 5;
          v52 -= 40;
        }
        while (v52);
      }
      LODWORD(v74) = 0;
      v12 = v59;
      v53 = sub_2462DF974(a6, v16, v11, v59, v58, (uint64_t *)&__p);
      sub_2462E0334(a6);
      *(_QWORD *)(a6 + 56) = *(_QWORD *)(a6 + 40);
      sub_2462E0BA4(a6, 4, *(_QWORD *)(a6 + 72));
      v54 = sub_2462E0458((_DWORD *)a6, v53);
      sub_2462E04C4(a6, v54);
      *(_BYTE *)(a6 + 71) = 1;
      v21 = v65;
    }
    _Block_object_dispose(v63, 8);
  }
  else
  {
    v19 = (id)qword_25441F958;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_descriptionForTypeIdentifier_(MEMORY[0x24BE5B238], v22, v16);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "analyze_cascade_item";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v56;
      _os_log_error_impl(&dword_2462C4000, v19, OS_LOG_TYPE_ERROR, "%s Item_type: %@ does not map to a valid SearchGroup", buf, 0x16u);

    }
    v21 = 0;
  }

  sub_2462D909C((uint64_t *)&v73);
  if (__p)
  {
    v67 = __p;
    operator delete(__p);
  }
  v73 = (void **)v69;
  sub_2462E710C(&v73);
  v73 = (void **)v70;
  sub_2462D3760(&v73);

  return v21;
}

void sub_2462E5028(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *__p,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,char *a42)
{
  void *v42;
  uint64_t v43;
  void *v45;

  v45 = *(void **)(v43 - 184);
  if (v45 != (void *)(v43 - 168))
    free(v45);
  _Block_object_dispose(&a27, 8);
  sub_2462D909C((uint64_t *)&a42);
  if (__p)
  {
    a33 = (uint64_t)__p;
    operator delete(__p);
  }
  a42 = &a35;
  sub_2462E710C((void ***)&a42);
  a42 = &a38;
  sub_2462D3760((void ***)&a42);

  _Unwind_Resume(a1);
}

void sub_2462E50F8(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  uint64_t v11;
  int v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  NSObject *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v6 = objc_msgSend_fieldType(v3, v4, v5);
  if (sub_2462DAF08(v6))
  {
    v9 = objc_msgSend_dataType(v3, v7, v8);
    switch(v9)
    {
      case 0:
        objc_msgSend_stringValueNoCopy(v3, v10, v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        sub_2462E5384((uint64_t **)(a1 + 40), v6, v16, *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
LABEL_9:

        break;
      case 1:
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        objc_msgSend_repeatedStringValueNoCopy(v3, v10, v11, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v24, v32, 16);
        if (v19)
        {
          v20 = *(_QWORD *)v25;
          do
          {
            v21 = 0;
            do
            {
              if (*(_QWORD *)v25 != v20)
                objc_enumerationMutation(v17);
              sub_2462E5384((uint64_t **)(a1 + 40), v6, *(void **)(*((_QWORD *)&v24 + 1) + 8 * v21++), *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
            }
            while (v19 != v21);
            v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v22, (uint64_t)&v24, v32, 16);
          }
          while (v19);
        }

        break;
      case 20:
        v12 = objc_msgSend_rawEnumValue(v3, v10, v11);
        sub_2462DB2F4(v12, v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v13;
        if (v13 && objc_msgSend_length(v13, v14, v15))
          sub_2462E5384((uint64_t **)(a1 + 40), v6, v16, *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
        goto LABEL_9;
      default:
        v23 = qword_25441F958;
        if (os_log_type_enabled((os_log_t)qword_25441F958, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v29 = "analyze_cascade_item_block_invoke";
          v30 = 2112;
          v31 = v3;
          _os_log_error_impl(&dword_2462C4000, v23, OS_LOG_TYPE_ERROR, "%s Ignoring field with unhandled data type: %@", buf, 0x16u);
        }
        break;
    }
  }
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);

}

void sub_2462E5340(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2462E5384(uint64_t **a1, int a2, void *a3, unsigned __int16 a4)
{
  id v7;
  uint64_t *v8;
  const char *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;
  __int16 *v20;
  uint64_t v21;
  void *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  id v29;
  const char *v30;
  uint64_t v31;
  char *v32;
  const char *v33;
  __int128 *j;
  __int128 *v35;
  uint64_t v36;
  __int128 v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  char v43;
  uint64_t v44;
  int v45;
  uint64_t *v46;
  uint64_t v47;
  TokenStream *v48;
  uint64_t v49;
  uint64_t v50;
  __int128 ***v51;
  __int128 **v52;
  __int128 **v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t *v56;
  __int128 *v57;
  uint64_t v58;
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  __int128 v64;
  _DWORD *v65;
  unint64_t v66;
  unint64_t v67;
  void **v68;
  unint64_t v69;
  unint64_t v70;
  void **v71;
  _WORD *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  __int16 v76;
  unint64_t v77;
  __int128 *v78;
  __int128 *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t *v82;
  int v83;
  int v84;
  unint64_t v85;
  _DWORD *v86;
  _DWORD *v87;
  _DWORD *v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  unint64_t v92;
  char *v93;
  char *v94;
  char *v95;
  int v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  char v102;
  uint64_t v103;
  unsigned __int16 v104;
  id v105;
  uint64_t *v106;
  uint64_t *v107;
  __int128 v108;
  uint64_t v109;
  void *v110[2];
  uint64_t v111;
  __int128 __dst;
  unint64_t v113;
  void *__p[2];
  unint64_t v115;
  uint64_t v116;
  int v117;
  __int16 v118;
  int v119;
  int v120;
  void *v121[2];
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  uint64_t v126;
  void **v127;
  unint64_t v128;
  uint8_t buf[16];
  __int128 v130;
  _BYTE v131[10];
  int v132;
  uint64_t v133;

  v133 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a1[1];
  if (!objc_msgSend_length(v7, v9, v10))
    goto LABEL_134;
  v105 = v7;
  v11 = objc_retainAutorelease(v7);
  v14 = (char *)objc_msgSend_UTF8String(v11, v12, v13);
  v104 = a4;
  strlen(v14);
  v110[1] = 0;
  v111 = 0;
  v110[0] = 0;
  skit::to_u16string();
  v16 = **a1;
  v15 = (*a1)[1];
  (*(void (**)(uint64_t))(*(_QWORD *)v8[9] + 16))(v8[9]);
  v102 = sub_2462D4768(v8[9], *a1, 1, 0xAAAAAAAAAAAAAAABLL * ((v15 - v16) >> 4));
  sub_2462D4560(v8[9], **a1, (*a1)[1], *(unsigned __int16 *)a1[2]);
  v17 = *(_WORD *)a1[2];
  if ((v17 & 0xFFFE) == 2)
  {
    v106 = a1[3];
    v18 = v8[9];
    if ((*(_WORD *)(v18 + 188) & 4) != 0)
    {
      v19 = 0;
      v20 = (__int16 *)"NSt3__120__shared_ptr_emplaceIN13semskitbridge9TokenizerENS_9allocatorIS2_EEEE";
      while ((unsigned __int16)word_24631820E[v19] != a2)
      {
        if (++v19 == 4)
          goto LABEL_9;
      }
      v20 = &word_24631820E[v19];
LABEL_9:
      if ((char *)v20 - (char *)word_24631820E != 8)
      {
        sub_2462D7A34(buf, v14);
        sub_2462D4A8C(v18, (const char *)buf, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (SBYTE7(v130) < 0)
          operator delete(*(void **)buf);
        if (v22)
        {
          v125 = 0uLL;
          v126 = 0;
          *(_OWORD *)v121 = 0u;
          v122 = 0u;
          v123 = 0u;
          v124 = 0u;
          v101 = v22;
          v23 = v22;
          v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)v121, buf, 16);
          if (v25)
          {
            v26 = *(_QWORD *)v122;
            do
            {
              for (i = 0; i != v25; ++i)
              {
                if (*(_QWORD *)v122 != v26)
                  objc_enumerationMutation(v23);
                v28 = v8[9];
                v29 = objc_retainAutorelease(*((id *)v121[1] + i));
                v32 = (char *)objc_msgSend_UTF8String(v29, v30, v31);
                sub_2462D7A34(__p, v32);
                sub_2462D4D04(v28, (uint64_t *)&v125, (uint64_t)__p, 0x2Eu, -1);
                if (SHIBYTE(v115) < 0)
                  operator delete(__p[0]);
              }
              v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v33, (uint64_t)v121, buf, 16);
            }
            while (v25);
          }

          sub_2462D6D68(v8[9], (unsigned __int16 **)&v125);
          LOWORD(v127) = 1792;
          v35 = (__int128 *)*((_QWORD *)&v125 + 1);
          for (j = (__int128 *)v125; j != v35; j = (__int128 *)((char *)j + 24))
          {
            if (*((char *)j + 23) < 0)
            {
              sub_2462D7540(&__dst, *(void **)j, *((_QWORD *)j + 1));
              v36 = *((unsigned __int8 *)j + 23);
            }
            else
            {
              v36 = *((unsigned __int8 *)j + 23);
              v37 = *j;
              v113 = *((_QWORD *)j + 2);
              __dst = v37;
            }
            *(_OWORD *)__p = __dst;
            v115 = v113;
            v113 = 0;
            __dst = 0uLL;
            v117 = 1065353216;
            v119 = 196609;
            v120 = 0;
            v118 = v17;
            if ((v36 & 0x80) != 0)
              v36 = *((_QWORD *)j + 1);
            v116 = v36 << 32;
            sub_2462E6020((__int128 *)__p, (unsigned __int16 *)&v127, v106);
            if (SHIBYTE(v115) < 0)
              operator delete(__p[0]);
          }
          __p[0] = &v125;
          sub_2462D7E84((void ***)__p);
          v22 = v101;
        }
        else
        {
          v38 = qword_25441F958;
          if (os_log_type_enabled((os_log_t)qword_25441F958, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            *(_QWORD *)&buf[4] = "add_phonetic_ngrams_for_field";
            _os_log_error_impl(&dword_2462C4000, v38, OS_LOG_TYPE_ERROR, "%s Prons is nil, aborting.", buf, 0xCu);
          }
        }

      }
    }
    if ((v102 & 1) != 0)
    {
      v39 = v8[9];
      if ((*(_BYTE *)(*(_QWORD *)(v39 + 8) + 32) & 8) != 0 && (*(_WORD *)(v39 + 188) & 2) != 0)
      {
        if (!*(_QWORD *)(v39 + 216))
        {
          sub_2462D3D48((_QWORD *)v39);
          v39 = v8[9];
        }
        v40 = *(_QWORD *)(v39 + 216);
        sub_2462E7540(buf, (char *)v110);
        v41 = (*(uint64_t (**)(uint64_t, uint8_t *))(*(_QWORD *)v40 + 64))(v40, buf);
        if (SBYTE7(v130) < 0)
          operator delete(*(void **)buf);
        (*(void (**)(void **__return_ptr, uint64_t))(*(_QWORD *)v41 + 72))(v121, v41);
        v42 = (void *)BYTE7(v122);
        v43 = BYTE7(v122);
        if (SBYTE7(v122) < 0)
          v42 = v121[1];
        if (v42)
        {
          (*(void (**)(void **__return_ptr, uint64_t))(*(_QWORD *)v41 + 72))(__p, v41);
          *(_QWORD *)&v130 = v115;
          *(_OWORD *)buf = *(_OWORD *)__p;
          __p[1] = 0;
          v115 = 0;
          __p[0] = 0;
          *(_DWORD *)v131 = 1065353216;
          *(_DWORD *)&v131[6] = 196609;
          v132 = 0;
          *(_WORD *)&v131[4] = v17;
          v44 = BYTE7(v130);
          v45 = SBYTE7(v130);
          if (SBYTE7(v130) < 0)
            v44 = *(_QWORD *)&buf[8];
          *((_QWORD *)&v130 + 1) = v44 << 32;
          LOWORD(v125) = 1536;
          sub_2462E6020((__int128 *)buf, (unsigned __int16 *)&v125, v106);
          if (v45 < 0)
            operator delete(*(void **)buf);
          v43 = BYTE7(v122);
        }
        if (v43 < 0)
          operator delete(v121[0]);
        (*(void (**)(uint64_t))(*(_QWORD *)v41 + 16))(v41);
      }
    }
  }
  v46 = *a1;
  v47 = (uint64_t)a1[3];
  v125 = 0uLL;
  v126 = 0;
  sub_2462E0118((char *)&v125, (__int128 *)*v46, (__int128 *)v46[1], 0xAAAAAAAAAAAAAAABLL * ((v46[1] - *v46) >> 4));
  sub_2462D4064(v8[9], (uint64_t *)&v125);
  v108 = v125;
  v109 = v126;
  v125 = 0uLL;
  v126 = 0;
  skit::Analyzer::dedup((skit::Analyzer *)&v108, v48);
  sub_2462D722C((uint64_t *)&v125);
  v125 = *(_OWORD *)buf;
  v126 = v130;
  *(_QWORD *)&v130 = 0;
  memset(buf, 0, sizeof(buf));
  v121[0] = buf;
  sub_2462D3760((void ***)v121);
  v121[0] = &v108;
  sub_2462D3760((void ***)v121);
  skit::Alias::match();
  sub_2462E694C(a1[5], a1[5][1], (__int128 *)v125, *((__int128 **)&v125 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)&v125 + 1) - v125) >> 4));
  v50 = *((_QWORD *)&v125 + 1);
  v49 = v125;
  while (v50 != v49)
  {
    if (*(char *)(v50 - 25) < 0)
      operator delete(*(void **)(v50 - 48));
    v50 -= 48;
  }
  *((_QWORD *)&v125 + 1) = v49;
  v51 = (__int128 ***)a1[3];
  v52 = *v51;
  v53 = v51[1];
  if (*v51 != v53)
  {
    do
    {
      sub_2462E6E3C(a1[5], (__int128 *)a1[5][1], *v52, v52[1], 0xAAAAAAAAAAAAAAABLL * (v52[1] - *v52));
      v52 += 4;
    }
    while (v52 != v53);
  }
  v54 = a1[2];
  if ((*(_WORD *)v54 & 0xFFFE) != 2)
    goto LABEL_110;
  v55 = v8[9];
  if ((*(_WORD *)(v55 + 188) & 1) == 0 || (*(_BYTE *)(*(_QWORD *)(v55 + 8) + 32) & 0x10) == 0)
    goto LABEL_110;
  __dst = 0uLL;
  v113 = 0;
  v56 = *a1;
  v57 = (__int128 *)(*a1)[1];
  v58 = (uint64_t)v57 - **a1;
  if (!v58)
  {
    v79 = 0;
    v78 = 0;
    goto LABEL_104;
  }
  v100 = v47;
  v59 = 0;
  v60 = *(_WORD *)v54;
  if ((unint64_t)(v58 / 48) <= 1)
    v61 = 1;
  else
    v61 = v58 / 48;
  v107 = *a1;
  v103 = v61;
  do
  {
    v62 = *v56;
    v63 = *v56 + 48 * v59;
    if ((*(_WORD *)(v63 + 40) & 6) != 2)
      goto LABEL_101;
    if (*(char *)(v63 + 23) < 0)
    {
      sub_2462D7540(v121, *(void **)v63, *(_QWORD *)(v63 + 8));
    }
    else
    {
      v64 = *(_OWORD *)v63;
      *(_QWORD *)&v122 = *(_QWORD *)(v63 + 16);
      *(_OWORD *)v121 = v64;
    }
    v65 = (_DWORD *)(v62 + 48 * v59 + 24);
    v66 = 2;
    while ((SBYTE7(v122) & 0x80000000) == 0)
    {
      v67 = BYTE7(v122);
      if (v66 >= (unint64_t)BYTE7(v122) - 1)
        goto LABEL_100;
      v68 = v121;
LABEL_78:
      if (v67 >= v66 + 1)
        v69 = v66 + 1;
      else
        v69 = v67;
      v127 = v68;
      v128 = v69;
      if (!morphun::dictionary::DictionaryMetaData::isKnownWord() || (skit::is_significant() & 1) == 0)
        goto LABEL_98;
      *(_OWORD *)buf = 0u;
      v130 = 0u;
      *(_QWORD *)v131 = 0x100003F800000;
      *(_WORD *)&v131[8] = 3;
      v132 = 0;
      v70 = v128;
      if (v128 >= 0x7FFFFFFFFFFFFFF8)
        sub_2462D3400();
      v71 = v127;
      if (v128 >= 0xB)
      {
        v73 = (v128 & 0xFFFFFFFFFFFFFFFCLL) + 4;
        if ((v128 | 3) != 0xB)
          v73 = v128 | 3;
        v72 = sub_2462D7494((uint64_t)__p, v73 + 1);
        __p[1] = (void *)v70;
        v115 = v74 | 0x8000000000000000;
        __p[0] = v72;
LABEL_90:
        v75 = 2 * v70;
        do
        {
          v76 = *(_WORD *)v71;
          v71 = (void **)((char *)v71 + 2);
          *v72++ = v76;
          v75 -= 2;
        }
        while (v75);
        goto LABEL_92;
      }
      HIBYTE(v115) = v128;
      v72 = __p;
      if (v128)
        goto LABEL_90;
LABEL_92:
      *v72 = 0;
      if (SBYTE7(v130) < 0)
        operator delete(*(void **)buf);
      *(_OWORD *)buf = *(_OWORD *)__p;
      *(_QWORD *)&v130 = v115;
      *(_WORD *)&v131[8] |= 0xBu;
      v77 = BYTE7(v122);
      if (SBYTE7(v122) < 0)
        v77 = (unint64_t)v121[1];
      *(float *)v131 = (float)v128 / (float)v77;
      *((_QWORD *)&v130 + 1) = *v65 | ((unint64_t)(v66 + *v65 + 1) << 32);
      *(_WORD *)&v131[4] = v60;
      sub_2462E637C((uint64_t *)&__dst, (__int128 *)buf);
      if (SBYTE7(v130) < 0)
        operator delete(*(void **)buf);
LABEL_98:
      ++v66;
    }
    v67 = (unint64_t)v121[1];
    if ((void *)v66 < (char *)v121[1] - 1)
    {
      v68 = (void **)v121[0];
      goto LABEL_78;
    }
    operator delete(v121[0]);
LABEL_100:
    v56 = v107;
    v61 = v103;
LABEL_101:
    ++v59;
  }
  while (v59 != v61);
  v56 = *a1;
  v57 = (__int128 *)(*a1)[1];
  v79 = (__int128 *)*((_QWORD *)&__dst + 1);
  v78 = (__int128 *)__dst;
  v47 = v100;
LABEL_104:
  sub_2462E6E3C(v56, v57, v78, v79, 0xAAAAAAAAAAAAAAABLL * (v79 - v78));
  sub_2462D4064(v8[9], (uint64_t *)&__dst);
  sub_2462E694C(a1[5], a1[5][1], (__int128 *)__dst, *((__int128 **)&__dst + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)&__dst + 1) - __dst) >> 4));
  v81 = *((_QWORD *)&__dst + 1);
  v80 = __dst;
  while (v81 != v80)
  {
    if (*(char *)(v81 - 25) < 0)
      operator delete(*(void **)(v81 - 48));
    v81 -= 48;
  }
  *((_QWORD *)&__dst + 1) = v80;
  *(_QWORD *)buf = &__dst;
  sub_2462D3760((void ***)buf);
LABEL_110:
  v82 = a1[6];
  v83 = sub_2462DF2F4((unint64_t)a1[7], v104, v46, v47);
  v84 = v83;
  v86 = (_DWORD *)v82[1];
  v85 = v82[2];
  if ((unint64_t)v86 >= v85)
  {
    v88 = (_DWORD *)*v82;
    v89 = ((uint64_t)v86 - *v82) >> 2;
    v90 = v89 + 1;
    if ((unint64_t)(v89 + 1) >> 62)
      sub_2462D357C();
    v91 = v85 - (_QWORD)v88;
    if (v91 >> 1 > v90)
      v90 = v91 >> 1;
    if ((unint64_t)v91 >= 0x7FFFFFFFFFFFFFFCLL)
      v92 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v92 = v90;
    if (v92)
    {
      if (v92 >> 62)
        sub_2462D3488();
      v93 = (char *)operator new(4 * v92);
      v88 = (_DWORD *)*v82;
      v86 = (_DWORD *)v82[1];
    }
    else
    {
      v93 = 0;
    }
    v94 = &v93[4 * v89];
    v95 = &v93[4 * v92];
    *(_DWORD *)v94 = v84;
    v87 = v94 + 4;
    if (v86 == v88)
    {
      v7 = v105;
    }
    else
    {
      v7 = v105;
      do
      {
        v96 = *--v86;
        *((_DWORD *)v94 - 1) = v96;
        v94 -= 4;
      }
      while (v86 != v88);
    }
    *v82 = (uint64_t)v94;
    v82[1] = (uint64_t)v87;
    v82[2] = (uint64_t)v95;
    if (v88)
      operator delete(v88);
  }
  else
  {
    *v86 = v83;
    v87 = v86 + 1;
    v7 = v105;
  }
  v82[1] = (uint64_t)v87;
  sub_2462D37A0(*a1);
  v97 = a1[3];
  v98 = *v97;
  v99 = v97[1];
  while (v99 != v98)
  {
    v99 -= 32;
    *(_QWORD *)buf = v99;
    sub_2462D3760((void ***)buf);
  }
  v97[1] = v98;
  *(_QWORD *)buf = &v125;
  sub_2462D3760((void ***)buf);
  if (SHIBYTE(v111) < 0)
    operator delete(v110[0]);
LABEL_134:

}

void sub_2462E5E80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,void *__p,uint64_t a38,int a39,__int16 a40,char a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48)
{
  int v48;
  uint64_t v49;
  uint64_t v50;

  if (v48 < 0)
    operator delete(*(void **)(v50 - 240));
  if (a42 < 0)
    operator delete(__p);
  (*(void (**)(uint64_t))(*(_QWORD *)v49 + 16))(v49);
  if (a23 < 0)
    operator delete(a18);

  _Unwind_Resume(a1);
}

void sub_2462E6020(__int128 *a1, unsigned __int16 *a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  __int128 v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  __int128 v19;
  unint64_t v20;
  char *v21;
  __int128 v22;
  char *v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  __int16 v29;
  void **v30;
  char v31;
  void *__p[2];
  char *v33;
  __int128 v34;
  uint64_t v35;
  __int128 v36;

  *((_QWORD *)&v36 + 1) = *MEMORY[0x24BDAC8D0];
  v6 = a3[1];
  if (*a3 == v6)
  {
LABEL_5:
    v27 = 0uLL;
    v29 = 0;
    v28 = 0;
    if (*((char *)a1 + 23) < 0)
    {
      sub_2462D7540(__p, *(void **)a1, *((_QWORD *)a1 + 1));
    }
    else
    {
      *(_OWORD *)__p = *a1;
      v33 = (char *)*((_QWORD *)a1 + 2);
    }
    v34 = *(__int128 *)((char *)a1 + 24);
    v35 = *((_QWORD *)a1 + 5);
    v26 = 0;
    v25 = 0uLL;
    v30 = (void **)&v25;
    v31 = 0;
    *(_QWORD *)&v25 = operator new(0x30uLL);
    *((_QWORD *)&v25 + 1) = v25;
    v26 = v25 + 48;
    *((_QWORD *)&v25 + 1) = sub_2462E687C((uint64_t)&v26, (__int128 *)__p, &v36, (char *)v25);
    sub_2462D722C((uint64_t *)&v27);
    v27 = v25;
    v28 = v26;
    v26 = 0;
    v25 = 0uLL;
    v30 = (void **)&v25;
    sub_2462D3760(&v30);
    if (SHIBYTE(v33) < 0)
      operator delete(__p[0]);
    v29 = *a2;
    v11 = a3[1];
    if (v11 >= a3[2])
    {
      v12 = sub_2462E71EC(a3, (uint64_t)&v27);
    }
    else
    {
      sub_2462E717C((uint64_t)a3, (uint64_t)&v27);
      v12 = v11 + 32;
    }
    a3[1] = v12;
    __p[0] = &v27;
    sub_2462D3760((void ***)__p);
  }
  else
  {
    v7 = *a3 + 16;
    while (*(unsigned __int16 *)(v7 + 8) != *a2)
    {
      v8 = v7 + 16;
      v7 += 32;
      if (v8 == v6)
        goto LABEL_5;
    }
    v9 = *(_QWORD *)(v7 - 8);
    if (v9 >= *(_QWORD *)v7)
    {
      v13 = *(_QWORD *)(v7 - 16);
      v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v9 - v13) >> 4);
      if (v14 + 1 > 0x555555555555555)
        sub_2462D357C();
      v15 = 0xAAAAAAAAAAAAAAABLL * ((*(_QWORD *)v7 - v13) >> 4);
      v16 = 2 * v15;
      if (2 * v15 <= v14 + 1)
        v16 = v14 + 1;
      if (v15 >= 0x2AAAAAAAAAAAAAALL)
        v17 = 0x555555555555555;
      else
        v17 = v16;
      *((_QWORD *)&v34 + 1) = v7;
      if (v17)
        v18 = (char *)sub_2462D7644(v7, v17);
      else
        v18 = 0;
      v21 = &v18[48 * v14];
      __p[0] = v18;
      __p[1] = v21;
      v33 = v21;
      *(_QWORD *)&v34 = &v18[48 * v17];
      if (*((char *)a1 + 23) < 0)
      {
        sub_2462D7540(v21, *(void **)a1, *((_QWORD *)a1 + 1));
        v21 = v33;
      }
      else
      {
        v22 = *a1;
        *((_QWORD *)v21 + 2) = *((_QWORD *)a1 + 2);
        *(_OWORD *)v21 = v22;
      }
      v23 = &v18[48 * v14];
      v24 = *(__int128 *)((char *)a1 + 24);
      *((_QWORD *)v23 + 5) = *((_QWORD *)a1 + 5);
      *(_OWORD *)(v23 + 24) = v24;
      v33 = v21 + 48;
      sub_2462D75D0((uint64_t *)(v7 - 16), __p);
      v20 = *(_QWORD *)(v7 - 8);
      sub_2462D77AC((uint64_t)__p);
    }
    else
    {
      if (*((char *)a1 + 23) < 0)
      {
        sub_2462D7540(*(_BYTE **)(v7 - 8), *(void **)a1, *((_QWORD *)a1 + 1));
      }
      else
      {
        v10 = *a1;
        *(_QWORD *)(v9 + 16) = *((_QWORD *)a1 + 2);
        *(_OWORD *)v9 = v10;
      }
      v19 = *(__int128 *)((char *)a1 + 24);
      *(_QWORD *)(v9 + 40) = *((_QWORD *)a1 + 5);
      *(_OWORD *)(v9 + 24) = v19;
      v20 = v9 + 48;
      *(_QWORD *)(v7 - 8) = v9 + 48;
    }
    *(_QWORD *)(v7 - 8) = v20;
  }
}

void sub_2462E6314(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  uint64_t v24;
  uint64_t v25;

  *(_QWORD *)(v24 - 8) = v25;
  _Unwind_Resume(exception_object);
}

uint64_t sub_2462E637C(uint64_t *a1, __int128 *a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  char *v15;
  char *v16;
  __int128 v17;
  __int128 v18;
  _QWORD v20[5];

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD *)(v4 - 8);
  if (v7 >= v6)
  {
    v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v7 - *a1) >> 4);
    v12 = v11 + 1;
    if (v11 + 1 > 0x555555555555555)
      sub_2462D357C();
    v13 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - *a1) >> 4);
    if (2 * v13 > v12)
      v12 = 2 * v13;
    if (v13 >= 0x2AAAAAAAAAAAAAALL)
      v14 = 0x555555555555555;
    else
      v14 = v12;
    v20[4] = v4;
    if (v14)
      v15 = (char *)sub_2462D7644(v4, v14);
    else
      v15 = 0;
    v16 = &v15[48 * v11];
    v20[0] = v15;
    v20[1] = v16;
    v20[3] = &v15[48 * v14];
    v17 = *a2;
    *((_QWORD *)v16 + 2) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v16 = v17;
    *((_QWORD *)a2 + 1) = 0;
    *((_QWORD *)a2 + 2) = 0;
    *(_QWORD *)a2 = 0;
    v18 = *(__int128 *)((char *)a2 + 24);
    *((_QWORD *)v16 + 5) = *((_QWORD *)a2 + 5);
    *(_OWORD *)(v16 + 24) = v18;
    v20[2] = v16 + 48;
    sub_2462D75D0(a1, v20);
    v10 = a1[1];
    sub_2462D77AC((uint64_t)v20);
  }
  else
  {
    v8 = *a2;
    *(_QWORD *)(v7 + 16) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v7 = v8;
    *((_QWORD *)a2 + 1) = 0;
    *((_QWORD *)a2 + 2) = 0;
    *(_QWORD *)a2 = 0;
    v9 = *(__int128 *)((char *)a2 + 24);
    *(_QWORD *)(v7 + 40) = *((_QWORD *)a2 + 5);
    *(_OWORD *)(v7 + 24) = v9;
    v10 = v7 + 48;
    a1[1] = v7 + 48;
  }
  a1[1] = v10;
  return v10 - 48;
}

void sub_2462E64C4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_2462D77AC((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_2462E64D8(uint64_t a1, const char *a2, char *a3, uint64_t a4, unsigned int a5, uint64_t a6)
{
  uint64_t v11;
  void *v12;
  unint64_t *v13;
  unint64_t v14;
  void **v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  uint64_t v19;
  skit::internal *v20;
  int v21;
  _QWORD *v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  uint64_t v26;
  int v27;
  unint64_t *v28;
  _QWORD *v29;
  void *v30;
  void *v31;
  unint64_t *v32;
  unint64_t v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  std::__shared_weak_count *v37;
  unint64_t *v38;
  unint64_t v39;
  void *__p[2];
  char v42;

  *(_QWORD *)(a1 + 24) = a2;
  sub_2462DB26C((uint64_t)a2, a2, __p);
  sub_2462E6798((void **)(a1 + 32), __p);
  if (v42 < 0)
    operator delete(__p[0]);
  v12 = *(void **)a6;
  v11 = *(_QWORD *)(a6 + 8);
  if (v11)
  {
    v13 = (unint64_t *)(v11 + 8);
    do
      v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
  }
  v15 = (void **)(a1 + 56);
  v16 = *(std::__shared_weak_count **)(a1 + 64);
  *(_QWORD *)(a1 + 56) = v12;
  *(_QWORD *)(a1 + 64) = v11;
  if (v16)
  {
    p_shared_owners = (unint64_t *)&v16->__shared_owners_;
    do
      v18 = __ldaxr(p_shared_owners);
    while (__stlxr(v18 - 1, p_shared_owners));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
    v12 = *v15;
  }
  if (!v12)
  {
    if (*(char *)(a1 + 55) < 0)
    {
      v20 = *(skit::internal **)(a1 + 32);
      v19 = *(_QWORD *)(a1 + 40);
    }
    else
    {
      v19 = *(unsigned __int8 *)(a1 + 55);
      v20 = (skit::internal *)(a1 + 32);
    }
    v21 = (a5 >> 3) & ((*(_BYTE *)(sub_2462ECB80((uint64_t)&off_25175F388, v20, v19) + 32) & 0x40) >> 6);
    v22 = operator new(0xC0uLL);
    v22[1] = 0;
    v22[2] = 0;
    *v22 = &off_25175F168;
    __p[0] = (void *)sub_2463043D8((uint64_t)(v22 + 3), a1 + 32, a3, a4, v21);
    __p[1] = v22;
    sub_2462D34C0(a1 + 56, (__int128 *)__p);
    v23 = (std::__shared_weak_count *)__p[1];
    if (__p[1])
    {
      v24 = (unint64_t *)((char *)__p[1] + 8);
      do
        v25 = __ldaxr(v24);
      while (__stlxr(v25 - 1, v24));
      if (!v25)
      {
        ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
        std::__shared_weak_count::__release_weak(v23);
      }
    }
    v12 = *v15;
  }
  v26 = *(_QWORD *)(a1 + 104);
  v27 = *(_DWORD *)(a1 + 112);
  v28 = *(unint64_t **)(a1 + 64);
  v29 = operator new(0xF8uLL);
  v30 = v29;
  v29[1] = 0;
  v29[2] = 0;
  *v29 = &off_25175F1B8;
  v31 = v29 + 3;
  __p[0] = v12;
  __p[1] = v28;
  if (v28)
  {
    v32 = v28 + 1;
    do
      v33 = __ldxr(v32);
    while (__stxr(v33 + 1, v32));
  }
  sub_2462D3A8C((uint64_t)(v29 + 3), (skit::internal *)(a1 + 32), a5, v26, v27, (uint64_t)__p);
  v34 = (std::__shared_weak_count *)__p[1];
  if (__p[1])
  {
    v35 = (unint64_t *)((char *)__p[1] + 8);
    do
      v36 = __ldaxr(v35);
    while (__stlxr(v36 - 1, v35));
    if (!v36)
    {
      ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
      std::__shared_weak_count::__release_weak(v34);
    }
  }
  __p[0] = v31;
  __p[1] = v30;
  sub_2462D34C0(a1 + 72, (__int128 *)__p);
  v37 = (std::__shared_weak_count *)__p[1];
  if (__p[1])
  {
    v38 = (unint64_t *)((char *)__p[1] + 8);
    do
      v39 = __ldaxr(v38);
    while (__stlxr(v39 - 1, v38));
    if (!v39)
    {
      ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
      std::__shared_weak_count::__release_weak(v37);
    }
  }
  return 0;
}

void sub_2462E6758(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  std::__shared_weak_count *v15;
  void *v17;

  std::__shared_weak_count::~__shared_weak_count(v15);
  operator delete(v17);
  _Unwind_Resume(a1);
}

void **sub_2462E6798(void **result, void **a2)
{
  __int128 v2;
  unint64_t v3;
  unint64_t v4;

  if (result != a2)
  {
    if (*((char *)result + 23) < 0)
    {
      v3 = (unint64_t)a2[1];
      if (*((char *)a2 + 23) >= 0)
      {
        v4 = *((unsigned __int8 *)a2 + 23);
      }
      else
      {
        a2 = (void **)*a2;
        v4 = v3;
      }
      return sub_2462E7690(result, a2, v4);
    }
    else if ((*((_BYTE *)a2 + 23) & 0x80) != 0)
    {
      return (void **)sub_2462E7620(result, *a2, (unint64_t)a2[1]);
    }
    else
    {
      v2 = *(_OWORD *)a2;
      result[2] = a2[2];
      *(_OWORD *)result = v2;
    }
  }
  return result;
}

uint64_t sub_2462E67E8(uint64_t a1, __int128 *a2, _DWORD *a3, int *a4)
{
  __int16 v7;
  int v8;
  __int128 v10;
  uint64_t v11;

  if (*((char *)a2 + 23) < 0)
  {
    sub_2462D7540(&v10, *(void **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v10 = *a2;
    v11 = *((_QWORD *)a2 + 2);
  }
  v7 = *a3;
  v8 = *a4;
  *(_OWORD *)a1 = v10;
  *(_QWORD *)(a1 + 16) = v11;
  *(_QWORD *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 32) = v8;
  *(_WORD *)(a1 + 36) = 0;
  *(_WORD *)(a1 + 38) = v7;
  *(_WORD *)(a1 + 40) = 3;
  *(_DWORD *)(a1 + 44) = 0;
  return a1;
}

char *sub_2462E687C(uint64_t a1, __int128 *a2, __int128 *a3, char *__dst)
{
  char *v4;
  __int128 *v6;
  __int128 v7;
  char *v8;
  __int128 v9;
  _QWORD v11[3];
  char v12;
  char *v13;
  char *v14;

  v4 = __dst;
  v13 = __dst;
  v14 = __dst;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  v12 = 0;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        sub_2462D7540(v4, *(void **)v6, *((_QWORD *)v6 + 1));
        v8 = v14;
      }
      else
      {
        v7 = *v6;
        *((_QWORD *)v4 + 2) = *((_QWORD *)v6 + 2);
        *(_OWORD *)v4 = v7;
        v8 = v4;
      }
      v9 = *(__int128 *)((char *)v6 + 24);
      *((_QWORD *)v4 + 5) = *((_QWORD *)v6 + 5);
      *(_OWORD *)(v4 + 24) = v9;
      v6 += 3;
      v4 = v8 + 48;
      v14 = v8 + 48;
    }
    while (v6 != a3);
  }
  v12 = 1;
  sub_2462E02BC((uint64_t)v11);
  return v4;
}

void sub_2462E6938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_2462E02BC((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_2462E694C(uint64_t *a1, uint64_t a2, __int128 *a3, __int128 *a4, uint64_t a5)
{
  __int128 *v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  __int128 *v21;
  unint64_t v22;
  __int128 *v23;
  unint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  char *v29;
  char *v30;
  __int128 v31;
  __int128 v32;
  char *v33;
  char *v34;
  unint64_t *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;

  if (a5 < 1)
    return;
  v6 = a3;
  v7 = a2;
  v11 = a1[2];
  v9 = (uint64_t)(a1 + 2);
  v10 = v11;
  v12 = *(_QWORD *)(v9 - 8);
  if ((uint64_t)(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v11 - v12) >> 4)) < a5)
  {
    v13 = *a1;
    v14 = a5 - 0x5555555555555555 * ((uint64_t)(v12 - *a1) >> 4);
    if (v14 > 0x555555555555555)
      sub_2462D357C();
    v15 = 0xAAAAAAAAAAAAAAABLL * ((a2 - v13) >> 4);
    v16 = 0xAAAAAAAAAAAAAAABLL * ((v10 - v13) >> 4);
    v17 = 2 * v16;
    if (2 * v16 <= v14)
      v17 = v14;
    if (v16 >= 0x2AAAAAAAAAAAAAALL)
      v18 = 0x555555555555555;
    else
      v18 = v17;
    v37 = v9;
    if (v18)
      v19 = (char *)sub_2462D7644(v9, v18);
    else
      v19 = 0;
    v29 = &v19[48 * v15];
    v33 = v19;
    v34 = v29;
    v36 = &v19[48 * v18];
    v30 = &v29[48 * a5];
    do
    {
      v31 = *v6;
      *((_QWORD *)v29 + 2) = *((_QWORD *)v6 + 2);
      *(_OWORD *)v29 = v31;
      *((_QWORD *)v6 + 1) = 0;
      *((_QWORD *)v6 + 2) = 0;
      *(_QWORD *)v6 = 0;
      v32 = *(__int128 *)((char *)v6 + 24);
      *((_QWORD *)v29 + 5) = *((_QWORD *)v6 + 5);
      *(_OWORD *)(v29 + 24) = v32;
      v29 += 48;
      v6 += 3;
    }
    while (v29 != v30);
    v35 = (unint64_t *)v30;
    sub_2462E6C54((uint64_t)a1, &v33, (__int128 *)v7);
    sub_2462D77AC((uint64_t)&v33);
    return;
  }
  v20 = v12 - a2;
  if ((uint64_t)(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v12 - a2) >> 4)) >= a5)
  {
    v21 = &a3[3 * a5];
LABEL_19:
    sub_2462E6BD0((uint64_t)a1, v7, v12, v7 + 48 * a5);
    for (; v6 != v21; v6 += 3)
    {
      if (*(char *)(v7 + 23) < 0)
        operator delete(*(void **)v7);
      v27 = *v6;
      *(_QWORD *)(v7 + 16) = *((_QWORD *)v6 + 2);
      *(_OWORD *)v7 = v27;
      *((_BYTE *)v6 + 23) = 0;
      *(_WORD *)v6 = 0;
      v28 = *(__int128 *)((char *)v6 + 24);
      *(_QWORD *)(v7 + 40) = *((_QWORD *)v6 + 5);
      *(_OWORD *)(v7 + 24) = v28;
      v7 += 48;
    }
    return;
  }
  v38 = *(_QWORD *)(v9 - 8);
  v39 = v12;
  v21 = &a3[(uint64_t)(v12 - a2) >> 4];
  v33 = (char *)v9;
  v34 = (char *)&v38;
  v35 = &v39;
  v22 = v12;
  if (v21 != a4)
  {
    v23 = &a3[(uint64_t)(v12 - a2) >> 4];
    v24 = v12;
    do
    {
      v25 = *v23;
      *(_QWORD *)(v24 + 16) = *((_QWORD *)v23 + 2);
      *(_OWORD *)v24 = v25;
      *((_QWORD *)v23 + 1) = 0;
      *((_QWORD *)v23 + 2) = 0;
      *(_QWORD *)v23 = 0;
      v26 = *(__int128 *)((char *)v23 + 24);
      *(_QWORD *)(v24 + 40) = *((_QWORD *)v23 + 5);
      *(_OWORD *)(v24 + 24) = v26;
      v24 += 48;
      v22 += 48;
      v23 += 3;
    }
    while (v23 != a4);
    v39 = v24;
  }
  LOBYTE(v36) = 1;
  sub_2462E02BC((uint64_t)&v33);
  a1[1] = v22;
  if (v20 >= 1)
    goto LABEL_19;
}

void sub_2462E6BBC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_2462D77AC((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_2462E6BD0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  __int128 v10;
  __int128 v11;
  char v13;

  v6 = *(_QWORD *)(a1 + 8);
  v7 = a2 + v6 - a4;
  v8 = v6;
  if (v7 < a3)
  {
    v9 = v7;
    v8 = *(_QWORD *)(a1 + 8);
    do
    {
      v10 = *(_OWORD *)v9;
      *(_QWORD *)(v8 + 16) = *(_QWORD *)(v9 + 16);
      *(_OWORD *)v8 = v10;
      *(_QWORD *)(v9 + 8) = 0;
      *(_QWORD *)(v9 + 16) = 0;
      *(_QWORD *)v9 = 0;
      v11 = *(_OWORD *)(v9 + 24);
      *(_QWORD *)(v8 + 40) = *(_QWORD *)(v9 + 40);
      *(_OWORD *)(v8 + 24) = v11;
      v8 += 48;
      v9 += 48;
    }
    while (v9 < a3);
  }
  *(_QWORD *)(a1 + 8) = v8;
  return sub_2462E6D04((uint64_t)&v13, a2, v7, v6);
}

uint64_t sub_2462E6C54(uint64_t a1, _QWORD *a2, __int128 *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = a2[1];
  v7 = a1 + 16;
  sub_2462D7688(a1 + 16, (uint64_t)a3, (uint64_t)a3, *(_QWORD *)a1, *(_QWORD *)a1, v6, v6);
  a2[1] = v8;
  a2[2] = sub_2462E6DA8(v7, a3, *(__int128 **)(a1 + 8), a2[2]);
  v9 = *(_QWORD *)a1;
  *(_QWORD *)a1 = a2[1];
  a2[1] = v9;
  v10 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = a2[2];
  a2[2] = v10;
  v11 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = a2[3];
  a2[3] = v11;
  *a2 = a2[1];
  return v6;
}

uint64_t sub_2462E6D04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  void **v9;
  __int128 *v10;
  __int128 v11;
  __int128 v12;

  if (a3 != a2)
  {
    v7 = 0;
    do
    {
      v8 = a4 + v7;
      v9 = (void **)(a4 + v7 - 48);
      if (*(char *)(a4 + v7 - 25) < 0)
        operator delete(*v9);
      v10 = (__int128 *)(a3 + v7 - 48);
      v11 = *v10;
      *(_QWORD *)(a4 + v7 - 32) = *(_QWORD *)(a3 + v7 - 32);
      *(_OWORD *)v9 = v11;
      *(_BYTE *)(a3 + v7 - 25) = 0;
      *(_WORD *)v10 = 0;
      v12 = *(_OWORD *)(a3 + v7 - 24);
      *(_QWORD *)(v8 - 8) = *(_QWORD *)(a3 + v7 - 8);
      *(_OWORD *)(v8 - 24) = v12;
      v7 -= 48;
    }
    while (a3 + v7 != a2);
  }
  return a3;
}

uint64_t sub_2462E6DA8(uint64_t a1, __int128 *a2, __int128 *a3, uint64_t a4)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  _QWORD v8[3];
  char v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a4;
  v11 = a4;
  v10 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  if (a2 != a3)
  {
    do
    {
      v5 = *a2;
      *(_QWORD *)(v4 + 16) = *((_QWORD *)a2 + 2);
      *(_OWORD *)v4 = v5;
      *((_QWORD *)a2 + 1) = 0;
      *((_QWORD *)a2 + 2) = 0;
      *(_QWORD *)a2 = 0;
      v6 = *(__int128 *)((char *)a2 + 24);
      *(_QWORD *)(v4 + 40) = *((_QWORD *)a2 + 5);
      *(_OWORD *)(v4 + 24) = v6;
      v4 += 48;
      a2 += 3;
    }
    while (a2 != a3);
    v11 = v4;
  }
  v9 = 1;
  sub_2462E02BC((uint64_t)v8);
  return v4;
}

__int128 *sub_2462E6E3C(uint64_t *a1, __int128 *a2, __int128 *a3, __int128 *a4, uint64_t a5)
{
  __int128 *v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  __int128 *v21;
  char *v23;
  char *v24;
  char *v25;
  char *v26;
  uint64_t v27;

  v5 = a2;
  if (a5 >= 1)
  {
    v11 = a1[2];
    v9 = (uint64_t)(a1 + 2);
    v10 = v11;
    v12 = *(_QWORD *)(v9 - 8);
    if ((uint64_t)(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v11 - v12) >> 4)) >= a5)
    {
      v20 = v12 - (_QWORD)a2;
      if ((uint64_t)(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v12 - (_QWORD)a2) >> 4)) >= a5)
      {
        v21 = &a3[3 * a5];
      }
      else
      {
        v21 = &a3[(uint64_t)(v12 - (_QWORD)a2) >> 4];
        a1[1] = (uint64_t)sub_2462E01EC(v9, v21, a4, *(char **)(v9 - 8));
        if (v20 < 1)
          return v5;
      }
      sub_2462E6BD0((uint64_t)a1, (uint64_t)v5, v12, (uint64_t)&v5[3 * a5]);
      sub_2462E709C((uint64_t)a3, (uint64_t)v21, (uint64_t)v5);
    }
    else
    {
      v13 = *a1;
      v14 = a5 - 0x5555555555555555 * ((uint64_t)(v12 - *a1) >> 4);
      if (v14 > 0x555555555555555)
        sub_2462D357C();
      v15 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)a2 - v13) >> 4);
      v16 = 0xAAAAAAAAAAAAAAABLL * ((v10 - v13) >> 4);
      v17 = 2 * v16;
      if (2 * v16 <= v14)
        v17 = v14;
      if (v16 >= 0x2AAAAAAAAAAAAAALL)
        v18 = 0x555555555555555;
      else
        v18 = v17;
      v27 = v9;
      if (v18)
        v19 = (char *)sub_2462D7644(v9, v18);
      else
        v19 = 0;
      v23 = v19;
      v24 = &v19[48 * v15];
      v25 = v24;
      v26 = &v19[48 * v18];
      sub_2462E6FFC(&v23, a3, a5);
      v5 = (__int128 *)sub_2462E6C54((uint64_t)a1, &v23, v5);
      sub_2462D77AC((uint64_t)&v23);
    }
  }
  return v5;
}

void sub_2462E6FDC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  uint64_t v10;
  uint64_t v11;

  *(_QWORD *)(v10 + 8) = v11;
  _Unwind_Resume(exception_object);
}

_QWORD *sub_2462E6FFC(_QWORD *result, __int128 *a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;

  v3 = result;
  v4 = result[2];
  if (a3)
  {
    v6 = v4 + 48 * a3;
    v7 = 48 * a3;
    do
    {
      if (*((char *)a2 + 23) < 0)
      {
        result = sub_2462D7540((_BYTE *)v4, *(void **)a2, *((_QWORD *)a2 + 1));
      }
      else
      {
        v8 = *a2;
        *(_QWORD *)(v4 + 16) = *((_QWORD *)a2 + 2);
        *(_OWORD *)v4 = v8;
      }
      v9 = *(__int128 *)((char *)a2 + 24);
      *(_QWORD *)(v4 + 40) = *((_QWORD *)a2 + 5);
      *(_OWORD *)(v4 + 24) = v9;
      v4 += 48;
      a2 += 3;
      v7 -= 48;
    }
    while (v7);
    v4 = v6;
  }
  v3[2] = v4;
  return result;
}

void sub_2462E7094(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 16) = v2;
  _Unwind_Resume(a1);
}

uint64_t sub_2462E709C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a1;
  if (a1 == a2)
    return a1;
  v5 = a2;
  do
  {
    sub_2462E6798((void **)a3, (void **)v4);
    v6 = *(_QWORD *)(v4 + 40);
    *(_OWORD *)(a3 + 24) = *(_OWORD *)(v4 + 24);
    *(_QWORD *)(a3 + 40) = v6;
    a3 += 48;
    v4 += 48;
  }
  while (v4 != v5);
  return v5;
}

void sub_2462E710C(void ***a1)
{
  void **v1;
  void **v2;
  void **v4;
  void *v5;
  void **v6;

  v1 = *a1;
  v2 = (void **)**a1;
  if (v2)
  {
    v4 = (void **)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 4;
        v6 = v4;
        sub_2462D3760(&v6);
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

char *sub_2462E717C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char *result;

  v4 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)v4 = 0;
  *(_QWORD *)(v4 + 8) = 0;
  *(_QWORD *)(v4 + 16) = 0;
  result = sub_2462E0118((char *)v4, *(__int128 **)a2, *(__int128 **)(a2 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 4));
  *(_WORD *)(v4 + 24) = *(_WORD *)(a2 + 24);
  *(_QWORD *)(a1 + 8) = v4 + 32;
  return result;
}

void sub_2462E71E4(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t sub_2462E71EC(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void *v14[2];
  char *v15;
  char *v16;
  uint64_t *v17;

  v3 = *a1;
  v4 = (a1[1] - *a1) >> 5;
  v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 59)
    sub_2462D357C();
  v7 = (uint64_t)(a1 + 2);
  v8 = a1[2] - v3;
  if (v8 >> 4 > v5)
    v5 = v8 >> 4;
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFE0)
    v9 = 0x7FFFFFFFFFFFFFFLL;
  else
    v9 = v5;
  v17 = a1 + 2;
  if (v9)
    v10 = (char *)sub_2462E7368(v7, v9);
  else
    v10 = 0;
  v11 = &v10[32 * v4];
  v14[0] = v10;
  v14[1] = v11;
  v15 = v11;
  v16 = &v10[32 * v9];
  *(_QWORD *)v11 = 0;
  *((_QWORD *)v11 + 1) = 0;
  *((_QWORD *)v11 + 2) = 0;
  sub_2462E0118(v11, *(__int128 **)a2, *(__int128 **)(a2 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 4));
  *((_WORD *)v11 + 12) = *(_WORD *)(a2 + 24);
  v15 += 32;
  sub_2462E72F4(a1, v14);
  v12 = a1[1];
  sub_2462E74C0(v14);
  return v12;
}

void sub_2462E72E0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_2462E74C0((void **)va);
  _Unwind_Resume(a1);
}

uint64_t sub_2462E72F4(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = sub_2462E739C((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *sub_2462E7368(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59)
    sub_2462D3488();
  return operator new(32 * a2);
}

uint64_t sub_2462E739C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  _QWORD v11[3];
  char v12;
  __int128 v13;
  __int128 v14;

  v7 = a7;
  *(_QWORD *)&v14 = a6;
  *((_QWORD *)&v14 + 1) = a7;
  v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    v9 = a6;
  }
  else
  {
    do
    {
      *(_QWORD *)(v7 - 32) = 0;
      *(_QWORD *)(v7 - 24) = 0;
      *(_QWORD *)(v7 - 16) = 0;
      v8 = *(_OWORD *)(a3 - 32);
      a3 -= 32;
      *(_OWORD *)(v7 - 32) = v8;
      *(_QWORD *)(v7 - 16) = *(_QWORD *)(a3 + 16);
      *(_QWORD *)a3 = 0;
      *(_QWORD *)(a3 + 8) = 0;
      *(_QWORD *)(a3 + 16) = 0;
      *(_WORD *)(v7 - 8) = *(_WORD *)(a3 + 24);
      v7 = *((_QWORD *)&v14 + 1) - 32;
      *((_QWORD *)&v14 + 1) -= 32;
    }
    while (a3 != a5);
    v9 = v14;
  }
  v12 = 1;
  sub_2462E7444((uint64_t)v11);
  return v9;
}

uint64_t sub_2462E7444(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    sub_2462E7478(a1);
  return a1;
}

void sub_2462E7478(uint64_t a1)
{
  void **v1;
  void **v2;
  void **v3;

  v1 = *(void ***)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(void ***)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    v3 = v1;
    sub_2462D3760(&v3);
    v1 += 4;
  }
}

void **sub_2462E74C0(void **a1)
{
  sub_2462E74F0((uint64_t)a1);
  if (*a1)
    operator delete(*a1);
  return a1;
}

void sub_2462E74F0(uint64_t a1)
{
  uint64_t i;
  uint64_t v2;
  void **v4;
  void **v5;

  v2 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v2; i = *(_QWORD *)(a1 + 16))
  {
    v4 = (void **)(i - 32);
    *(_QWORD *)(a1 + 16) = v4;
    v5 = v4;
    sub_2462D3760(&v5);
  }
}

_BYTE *sub_2462E7540(_BYTE *__dst, char *__src)
{
  size_t v4;
  uint64_t v5;
  int v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  if (!*(_WORD *)__src)
  {
    v7 = 0;
    __dst[23] = 0;
    goto LABEL_9;
  }
  v4 = 0;
  v5 = 0;
  do
  {
    v6 = *(unsigned __int16 *)&__src[v4 + 2];
    --v5;
    v4 += 2;
  }
  while (v6);
  v7 = -v5;
  if ((unint64_t)-v5 >= 0x7FFFFFFFFFFFFFF8)
    sub_2462D3400();
  if (v7 >= 0xB)
  {
    v9 = (v7 & 0xFFFFFFFFFFFFFFFCLL) + 4;
    if ((v7 | 3) != 0xB)
      v9 = v7 | 3;
    v8 = sub_2462D7494((uint64_t)__dst, v9 + 1);
    *((_QWORD *)__dst + 1) = v7;
    *((_QWORD *)__dst + 2) = v10 | 0x8000000000000000;
    *(_QWORD *)__dst = v8;
    goto LABEL_13;
  }
  __dst[23] = v7;
  v8 = __dst;
  if (v5)
  {
LABEL_13:
    memmove(v8, __src, v4);
    goto LABEL_14;
  }
  v7 = 0;
LABEL_9:
  v8 = __dst;
LABEL_14:
  *((_WORD *)v8 + v7) = 0;
  return __dst;
}

_BYTE *sub_2462E7620(_BYTE *__dst, void *__src, unint64_t a3)
{
  BOOL v5;
  unint64_t v6;

  v5 = a3 > 0xA;
  v6 = a3 - 10;
  if (v5)
  {
    sub_2462D78F0((uint64_t)__dst, 0xAuLL, v6, __dst[23] & 0x7F, 0, __dst[23] & 0x7F, a3, __src);
  }
  else
  {
    __dst[23] = a3;
    if (a3)
      memmove(__dst, __src, 2 * a3);
    *(_WORD *)&__dst[2 * a3] = 0;
  }
  return __dst;
}

void **sub_2462E7690(void **a1, void *__src, unint64_t a3)
{
  unint64_t v5;
  void *v6;

  v5 = (unint64_t)a1[2] & 0x7FFFFFFFFFFFFFFFLL;
  if (v5 <= a3)
  {
    sub_2462D78F0((uint64_t)a1, v5 - 1, a3 - v5 + 1, (uint64_t)a1[1], 0, (uint64_t)a1[1], a3, __src);
  }
  else
  {
    v6 = *a1;
    a1[1] = (void *)a3;
    if (a3)
      memmove(v6, __src, 2 * a3);
    *((_WORD *)v6 + a3) = 0;
  }
  return a1;
}

void sub_2462E7718(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_25175F168;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_2462E7728(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_25175F168;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x249556DC8);
}

void sub_2462E7758(uint64_t a1)
{
  sub_2462E7764((morphun::util::ULocale *)(a1 + 24));
}

void sub_2462E7764(morphun::util::ULocale *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *((_QWORD *)this + 19);
  *((_QWORD *)this + 19) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 16))(v2);
  v3 = *((_QWORD *)this + 17);
  *((_QWORD *)this + 17) = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 16))(v3);
  v4 = *((_QWORD *)this + 16);
  *((_QWORD *)this + 16) = 0;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 16))(v4);
  morphun::util::ULocale::~ULocale(this);
}

void sub_2462E77CC(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_25175F1B8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_2462E77DC(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_25175F1B8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x249556DC8);
}

uint64_t sub_2462E780C(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

id sub_2462E7954(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  void *v4;
  int isPartialMatch;
  const char *v6;
  uint64_t v7;
  int isApproximateMatch;
  const char *v9;
  uint64_t v10;
  int isAliasMatch;
  unsigned int v12;
  id v13;
  const char *v14;
  uint64_t v15;
  int v16;
  int v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  unsigned int v35;
  const char *v36;
  uint64_t v37;
  unsigned int v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  double v42;
  const char *v43;
  void *matched;
  unsigned int v46;

  v1 = a1;
  v4 = v1;
  if (v1)
  {
    isPartialMatch = objc_msgSend_isPartialMatch(v1, v2, v3);
    isApproximateMatch = objc_msgSend_isApproximateMatch(v4, v6, v7);
    isAliasMatch = objc_msgSend_isAliasMatch(v4, v9, v10);
    if (isPartialMatch)
      v12 = 2;
    else
      v12 = 0;
    if (isApproximateMatch)
      v12 |= 4u;
    if (isAliasMatch)
      v12 |= 8u;
    if (v12 <= 1)
      v12 = 1;
    v46 = v12;
    v13 = objc_alloc(MEMORY[0x24BEA3A88]);
    objc_msgSend_matchScore(v4, v14, v15);
    v17 = v16;
    v20 = objc_msgSend_maxTokenCount(v4, v18, v19);
    v23 = objc_msgSend_matchedTokenCount(v4, v21, v22);
    v26 = objc_msgSend_maxStopWordCount(v4, v24, v25);
    v29 = objc_msgSend_matchedStopWordCount(v4, v27, v28);
    v32 = objc_msgSend_editDistance(v4, v30, v31);
    v35 = objc_msgSend_maxAliasCount(v4, v33, v34);
    v38 = objc_msgSend_matchedAliasCount(v4, v36, v37);
    objc_msgSend_getAliasTypesArray(v4, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v42) = v17;
    matched = (void *)objc_msgSend_initWithMatchSignalBitSet_matchScore_maxTokenCount_matchedTokenCount_maxStopWordCount_matchedStopWordCount_editDistance_maxAliasCount_matchedAliasCount_matchedAliasTypes_(v13, v43, v46, v20, v23, v26, v29, v32, v42, __PAIR64__(v38, v35), v41);

  }
  else
  {
    matched = 0;
  }

  return matched;
}

void sub_2462E7ABC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2462E7BFC()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("SEMAdministrator", v2);
  v1 = (void *)qword_25441F908;
  qword_25441F908 = (uint64_t)v0;

}

uint64_t sub_2462E7E90(uint64_t a1, int a2)
{
  uint64_t result;
  uint64_t v3;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    if (a2 == 1)
      v3 = 1;
    else
      v3 = 2;
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
  }
  return result;
}

uint64_t sub_2462E80A8(uint64_t a1, int a2)
{
  NSObject *v4;
  const __CFString *v5;
  uint64_t result;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
  {
    v5 = CFSTR("NOT ");
    if (a2 == 1)
      v5 = &stru_251783AF0;
    v8 = 136315394;
    v9 = "-[SEMAdministrator beginEvaluation:completion:]_block_invoke";
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_2462C4000, v4, OS_LOG_TYPE_INFO, "%s Evaluation mode %@activated", (uint8_t *)&v8, 0x16u);
  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    if (a2 == 1)
      v7 = 1;
    else
      v7 = 2;
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v7);
  }
  return result;
}

uint64_t sub_2462E844C(uint64_t a1, const char *a2)
{
  return objc_msgSend_beginEvaluation_completion_(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 40), a2);
}

uint64_t sub_2462E84DC(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_beginEvaluationWithSerializedSets_completion_, *(_QWORD *)(a1 + 40));
}

uint64_t sub_2462E865C(uint64_t a1, int a2)
{
  NSObject *v4;
  const __CFString *v5;
  uint64_t result;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
  {
    v5 = CFSTR("NOT ");
    if (a2 == 1)
      v5 = &stru_251783AF0;
    v8 = 136315394;
    v9 = "-[SEMAdministrator endEvaluation:]_block_invoke";
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_2462C4000, v4, OS_LOG_TYPE_INFO, "%s Evaluation mode %@deactivated", (uint8_t *)&v8, 0x16u);
  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    if (a2 == 1)
      v7 = 1;
    else
      v7 = 2;
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v7);
  }
  return result;
}

uint64_t sub_2462E879C(uint64_t a1, const char *a2)
{
  return objc_msgSend_endEvaluation_(*(void **)(a1 + 32), a2, (uint64_t)a2);
}

void sub_2462E8934(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_2462E894C(uint64_t a1, char a2)
{
  uint64_t v2;
  void *v4;
  void *v5;
  double v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (!*(_BYTE *)(v2 + 24))
  {
    *(_BYTE *)(v2 + 24) = a2;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == 4)
    {
      v4 = (void *)qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      {
        v5 = (void *)MEMORY[0x24BDD16E0];
        v6 = *(double *)(*(_QWORD *)(a1 + 32) + 16);
        v7 = v4;
        objc_msgSend_numberWithDouble_(v5, v8, v9, v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 136315394;
        v12 = "-[SEMAdministrator _synchronouslyWrapRequest:]_block_invoke";
        v13 = 2112;
        v14 = v10;
        _os_log_error_impl(&dword_2462C4000, v7, OS_LOG_TYPE_ERROR, "%s Timed out waiting for admin service. timeout: %@ seconds", (uint8_t *)&v11, 0x16u);

      }
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void sub_2462E8A74(uint64_t a1, char a2)
{
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  char v7;

  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_2462E8AEC;
  v5[3] = &unk_25175F2C0;
  v6 = v3;
  v7 = a2;
  dispatch_async(v4, v5);

}

uint64_t sub_2462E8AEC(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t sub_2462E8B00(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_2462E91F4(uint64_t a1, const char *a2)
{
  objc_msgSend_addObject_(*(void **)(a1 + 32), a2, (uint64_t)a2);
  return 1;
}

uint64_t sub_2462E9480(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  id v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend_externalId(v3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v4, v8, (uint64_t)v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v11 = *(void **)(a1 + 32);
    objc_msgSend_externalId(v3, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v11, v15, (uint64_t)v9, v14);

  }
  objc_msgSend_addObject_(v9, v10, (uint64_t)v3);

  return 1;
}

void sub_2462E9928(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  const char *v4;
  int v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = (void *)qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
    {
      v5 = *(unsigned __int16 *)(a1 + 40);
      v6 = v3;
      objc_msgSend_clientId(WeakRetained, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 136315650;
      v12 = "-[SEMXPCClient _failureHandlerWithResponse:]_block_invoke";
      v13 = 1024;
      v14 = v5;
      v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_2462C4000, v6, OS_LOG_TYPE_INFO, "%s XPC connection terminated (%u) for client %@", (uint8_t *)&v11, 0x1Cu);

    }
    objc_msgSend_setFailureCode_(WeakRetained, v4, *(unsigned __int16 *)(a1 + 40));
    objc_msgSend_setConnection_(WeakRetained, v10, 0);
  }

}

void sub_2462E9AFC(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = (void *)qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      v12 = v5;
      objc_msgSend_clientId(WeakRetained, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 136315650;
      v17 = "-[SEMXPCClient _errorHandlerWithCompletion:]_block_invoke";
      v18 = 2112;
      v19 = v3;
      v20 = 2112;
      v21 = v15;
      _os_log_error_impl(&dword_2462C4000, v12, OS_LOG_TYPE_ERROR, "%s XPC request hit error (%@) for client %@", (uint8_t *)&v16, 0x20u);

    }
    v8 = objc_msgSend_interruptionCode(WeakRetained, v6, v7);
    objc_msgSend_setFailureCode_(WeakRetained, v9, v8);
    objc_msgSend_setConnection_(WeakRetained, v10, 0);
  }
  else
  {
    v8 = 0;
  }
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v11, v8);

}

uint64_t sub_2462E9D88(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, 0);
  return result;
}

uint64_t sub_2462E9E60(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, 0);
  return result;
}

uint64_t sub_2462E9F34(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void sub_2462EA394(const char *a1@<X1>, std::string *a2@<X8>)
{
  void *v3;
  const char *v4;
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  char *v9;

  objc_msgSend_bundleWithIdentifier_(MEMORY[0x24BDD1488], a1, (uint64_t)CFSTR("com.apple.siri.SiriEntityMatcher"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pathForResource_ofType_(v3, v4, (uint64_t)CFSTR("NameTrie"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_retainAutorelease(v5);
    v9 = (char *)objc_msgSend_UTF8String(v6, v7, v8);
    sub_2462EBB80(a2, &v9);
  }
  else
  {
    a2->__r_.__value_.__r.__words[0] = 0;
    a2->__r_.__value_.__l.__size_ = 0;
    a2->__r_.__value_.__r.__words[2] = 0;
  }

}

void sub_2462EA430(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2462EA444(const char *a1@<X1>, std::string *a2@<X8>)
{
  void *v3;
  const char *v4;
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  char *v9;

  objc_msgSend_bundleWithIdentifier_(MEMORY[0x24BDD1488], a1, (uint64_t)CFSTR("com.apple.siri.SiriEntityMatcher"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pathForResource_ofType_(v3, v4, (uint64_t)CFSTR("AliasTrie"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_retainAutorelease(v5);
    v9 = (char *)objc_msgSend_UTF8String(v6, v7, v8);
    sub_2462EBB80(a2, &v9);
  }
  else
  {
    a2->__r_.__value_.__r.__words[0] = 0;
    a2->__r_.__value_.__l.__size_ = 0;
    a2->__r_.__value_.__r.__words[2] = 0;
  }

}

void sub_2462EA4E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t sub_2462EA4F4(uint64_t a1, const char *a2)
{
  if (*(char *)(a1 + 23) >= 0)
    return objc_msgSend_stringWithCString_encoding_(MEMORY[0x24BDD17C8], a2, a1, 4);
  else
    return objc_msgSend_stringWithCString_encoding_(MEMORY[0x24BDD17C8], a2, *(_QWORD *)a1, 4);
}

id sub_2462EA518()
{
  const char *v0;
  void *v1;
  void *__p[2];
  uint64_t v4;

  __p[1] = 0;
  v4 = 0;
  __p[0] = 0;
  skit::to_string();
  objc_msgSend_stringWithCString_encoding_(MEMORY[0x24BDD17C8], v0, (uint64_t)__p, 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(v4) < 0)
    operator delete(__p[0]);
  return v1;
}

void sub_2462EA5A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_2462EA5C0(void *a1@<X0>, uint64_t a2@<X8>)
{
  const __CFString *v3;
  CFIndex Length;
  UniChar *v5;
  __CFString *theString;
  CFRange v7;

  v3 = a1;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = 0;
  theString = (__CFString *)v3;
  if (v3)
  {
    Length = CFStringGetLength(v3);
    sub_2462D7264(a2, Length, 0);
    if (*(char *)(a2 + 23) >= 0)
      v5 = (UniChar *)a2;
    else
      v5 = *(UniChar **)a2;
    v7.location = 0;
    v7.length = Length;
    CFStringGetCharacters(theString, v7, v5);
  }

}

void sub_2462EA638(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v10;

  if (*(char *)(v10 + 23) < 0)
    operator delete(*(void **)v10);

  _Unwind_Resume(a1);
}

id sub_2462EA65C(int *a1, int a2)
{
  unsigned __int16 *v2;
  uint64_t v3;
  int *v4;
  unsigned __int16 *v5;
  unsigned int v6;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  unsigned int *v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  NSObject *v18;
  const char *v19;
  id v20;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  NSObject *v28;
  const char *v29;
  void *v30;
  void *v31;
  objc_class *v32;
  id v33;
  void *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  void *v40;
  const char *v41;
  void *v42;
  id v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v2 = (unsigned __int16 *)((char *)a1 - *a1);
  if (*v2 >= 9u && (v3 = v2[4]) != 0)
  {
    v4 = (int *)((char *)a1 + v3 + *(unsigned int *)((char *)a1 + v3));
    v5 = (unsigned __int16 *)((char *)v4 - *v4);
    v6 = *v5;
    if (v6 <= 4)
    {
      v8 = 0;
    }
    else
    {
      if (v5[2])
        v8 = *(unsigned __int16 *)((char *)v4 + v5[2]);
      else
        v8 = 0;
      if (v6 >= 7)
      {
        v10 = v5[3];
        if (v10)
        {
          v11 = (unsigned int *)((char *)v4 + v10 + *(unsigned int *)((char *)v4 + v10));
          v12 = *v11;
          v13 = objc_alloc(MEMORY[0x24BDBCE50]);
          v15 = (uint64_t)(v11 + 1);
          if (a2)
            v16 = objc_msgSend_initWithBytes_length_(v13, v14, v15, v12);
          else
            v16 = objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(v13, v14, v15, v12, 0);
          v22 = (void *)v16;
          v43 = 0;
          objc_msgSend_contentMessageForItemType_data_error_(MEMORY[0x24BE15680], v17, v8, v16, &v43);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v43;
          if (v23)
          {
            v25 = (void *)objc_opt_class();
            if (objc_msgSend_itemType(v25, v26, v27) == (_DWORD)v8)
            {
              v20 = v23;
LABEL_29:

              return v20;
            }
            v28 = (id)qword_25441F970;
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              v32 = (objc_class *)objc_opt_class();
              NSStringFromClass(v32);
              v33 = (id)objc_claimAutoreleasedReturnValue();
              v34 = (void *)MEMORY[0x24BE5B238];
              v35 = (void *)objc_opt_class();
              v38 = objc_msgSend_itemType(v35, v36, v37);
              objc_msgSend_descriptionForTypeIdentifier_(v34, v39, v38);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_descriptionForTypeIdentifier_(MEMORY[0x24BE5B238], v41, v8);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315906;
              v45 = "SEMCascadeContentFromDocument";
              v46 = 2112;
              v47 = v33;
              v48 = 2112;
              v49 = v40;
              v50 = 2112;
              v51 = v42;
              _os_log_error_impl(&dword_2462C4000, v28, OS_LOG_TYPE_ERROR, "%s Document contains content: %@ of unexpected type (%@) expected: %@", buf, 0x2Au);

            }
          }
          else
          {
            v28 = (id)qword_25441F970;
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend_descriptionForTypeIdentifier_(MEMORY[0x24BE5B238], v29, v8);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315650;
              v45 = "SEMCascadeContentFromDocument";
              v46 = 2112;
              v47 = v31;
              v48 = 2112;
              v49 = v24;
              _os_log_error_impl(&dword_2462C4000, v28, OS_LOG_TYPE_ERROR, "%s Document with type %@ content failed to decode: %@", buf, 0x20u);

            }
          }

          v20 = 0;
          goto LABEL_29;
        }
      }
    }
    v18 = (id)qword_25441F970;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_descriptionForTypeIdentifier_(MEMORY[0x24BE5B238], v19, v8);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v45 = "SEMCascadeContentFromDocument";
      v46 = 2112;
      v47 = v30;
      _os_log_error_impl(&dword_2462C4000, v18, OS_LOG_TYPE_ERROR, "%s Document with type %@ missing content", buf, 0x16u);

    }
  }
  else
  {
    v9 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v45 = "SEMCascadeContentFromDocument";
      _os_log_error_impl(&dword_2462C4000, v9, OS_LOG_TYPE_ERROR, "%s Document missing Cascade item", buf, 0xCu);
    }
  }
  v20 = 0;
  return v20;
}

void sub_2462EAA2C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

id sub_2462EAA94(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  unsigned int v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  unint64_t v17;
  const char *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  unsigned int v24;
  const char *v25;
  int v27;
  const char *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend_entityInfo(v1, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2462EAC48(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_allMetaContent(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v11 = objc_msgSend_duplicateIndex(v1, v9, v10);
    objc_msgSend_allMetaContent(v5, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend_count(v14, v15, v16);

    if (v17 >= v11)
    {
      objc_msgSend_allMetaContent(v5, v18, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend_duplicateIndex(v1, v22, v23);
      objc_msgSend_objectAtIndex_(v21, v25, v24);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v20 = qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      {
        v27 = 136315394;
        v28 = "SEMCascadeMetaContentForResult";
        v29 = 2112;
        v30 = v1;
        _os_log_error_impl(&dword_2462C4000, v20, OS_LOG_TYPE_ERROR, "%s Unexpected result - duplicateIndex beyond allMetaContent range: %@", (uint8_t *)&v27, 0x16u);
      }
      v8 = 0;
    }
  }

  return v8;
}

void sub_2462EAC08(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id sub_2462EAC48(void *a1)
{
  id v1;
  id v2;
  NSObject *v3;
  objc_class *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = v1;
  }
  else
  {
    v3 = (id)qword_25441F970;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 136315650;
      v8 = "SEMCascadeEntityInfoOrNil";
      v9 = 2112;
      v10 = v1;
      v11 = 2112;
      v12 = v6;
      _os_log_error_impl(&dword_2462C4000, v3, OS_LOG_TYPE_ERROR, "%s Unexpected entity info: %@ expected %@", (uint8_t *)&v7, 0x20u);

    }
    v2 = 0;
  }

  return v2;
}

void sub_2462EAD64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id sub_2462EAD88(void *a1)
{
  id v1;
  id v2;
  NSObject *v3;
  objc_class *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = v1;
  }
  else
  {
    v3 = (id)qword_25441F970;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 136315650;
      v8 = "SEMCascadeEntityFieldInfoOrNil";
      v9 = 2112;
      v10 = v1;
      v11 = 2112;
      v12 = v6;
      _os_log_error_impl(&dword_2462C4000, v3, OS_LOG_TYPE_ERROR, "%s Unexpected entity field info: %@ expected %@", (uint8_t *)&v7, 0x20u);

    }
    v2 = 0;
  }

  return v2;
}

void sub_2462EAEA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id sub_2462EAEC8(int **a1)
{
  int *v1;
  unsigned __int16 *v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  unsigned __int16 *v8;
  uint64_t v9;
  int *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  unsigned int v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  size_t v22;
  char *v23;
  _BYTE *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  unsigned int *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int *v33;
  uint64_t v34;
  unint64_t v35;
  void *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  id v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  void *v47;
  void *v48;
  const char *v49;
  id v50;
  SEMCascadeEntityInfo *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  int *v56;
  skit::SpanMatchV3 *v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  unsigned __int8 *v61;
  int v62;
  NSObject *v63;
  __int16 v64;
  uint64_t v65;
  int *v66;
  int v67;
  int v68;
  int v69;
  int v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unsigned int v74;
  uint64_t v75;
  unsigned int v76;
  uint64_t v77;
  int *v78;
  int v79;
  unsigned int v80;
  unsigned int v81;
  double v82;
  const char *v83;
  id v84;
  const char *v85;
  uint64_t v86;
  skit::SpanMatchV3 *v87;
  uint64_t v88;
  int v89;
  int v90;
  int v91;
  int v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unsigned int v96;
  unsigned int v97;
  unsigned int v98;
  unsigned int v99;
  double v100;
  const char *v101;
  void *v102;
  SEMCascadeEntityFieldInfo *v103;
  const char *v104;
  void *v105;
  SEMFieldMatch *v106;
  const char *v107;
  const char *v108;
  void *v109;
  void *v110;
  id v111;
  NSObject *v112;
  unint64_t v113;
  SEMSpanMatchResult *v114;
  const char *v115;
  const char *v116;
  void *v117;
  NSObject *v118;
  const char *v119;
  uint64_t v120;
  void *v121;
  void *v122;
  NSObject *v123;
  const char *v124;
  void *v125;
  uint64_t v126;
  void *v127;
  void *v128;
  id v129;
  int *v130;
  unsigned int *v131;
  void *v132;
  id v133;
  uint64_t v134;
  SEMSpanInfo *v135;
  SEMSpanInfo *v136;
  uint64_t v137;
  void *v138;
  void *v139;
  uint64_t v140;
  unsigned int v141;
  void *matched;
  __int16 v143;
  _BYTE buf[24];
  id v145;
  uint8_t v146[4];
  const char *v147;
  __int16 v148;
  void *v149;
  uint64_t v150;

  v150 = *MEMORY[0x24BDAC8D0];
  v1 = *a1;
  v2 = (unsigned __int16 *)((char *)*a1 - **a1);
  if (*v2 < 5u)
  {
    v11 = qword_25441F970;
    if (!os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    LODWORD(v12) = 0;
LABEL_23:
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "SEMSpanMatchResultsFromItemResult";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v12;
    _os_log_error_impl(&dword_2462C4000, v11, OS_LOG_TYPE_ERROR, "%s Matched document has unsupported entity type: %u", buf, 0x12u);
    goto LABEL_11;
  }
  if (v2[2] && *((_BYTE *)v1 + v2[2]) == 1)
  {
    v133 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    sub_2462EA65C(*a1, 1);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v128)
    {
      v129 = 0;
      v13 = 0;
LABEL_94:

      return v13;
    }
    v4 = (void *)objc_opt_class();
    v141 = objc_msgSend_itemType(v4, v5, v6);
    v8 = (unsigned __int16 *)((char *)*a1 - **a1);
    if (*v8 >= 9u && (v9 = v8[4]) != 0)
      v10 = (int *)((char *)*a1 + v9 + *(unsigned int *)((char *)*a1 + v9));
    else
      v10 = 0;
    v15 = *v10;
    v16 = -v15;
    v17 = (char *)v10 - v15;
    v18 = *(unsigned __int16 *)((char *)v10 - v15);
    if (v18 < 0xB)
    {
      v127 = 0;
      goto LABEL_35;
    }
    v19 = *((unsigned __int16 *)v17 + 5);
    if (!*((_WORD *)v17 + 5))
    {
      v127 = 0;
LABEL_36:
      if (*(_WORD *)((char *)v10 + v16 + 8))
      {
        v28 = objc_alloc(MEMORY[0x24BDBCEB8]);
        v29 = (unsigned int *)((char *)v10 + *(unsigned __int16 *)((char *)v10 - *v10 + 8));
        v139 = (void *)objc_msgSend_initWithCapacity_(v28, v30, *(unsigned int *)((char *)v29 + *v29));
        v31 = *(unsigned __int16 *)((char *)v10 - *v10 + 8);
        v32 = *(unsigned int *)((char *)v10 + v31);
        v33 = (unsigned int *)((char *)v10 + v31 + v32);
        v34 = *v33;
        if ((_DWORD)v34)
        {
          v35 = 0;
          v36 = 0;
          v37 = 4 * v34;
          v38 = (char *)v10 + v31 + v32;
          while (1)
          {
            v39 = v33[v35 / 4 + 1];
            v40 = objc_alloc(MEMORY[0x24BDBCE50]);
            v42 = *(int *)((char *)&v33[v35 / 4 + 1] + v39);
            v43 = *(unsigned __int16 *)&v38[v35 + 8 + v39 - v42];
            if (*(_WORD *)&v38[v35 + 8 + v39 - v42])
            {
              v44 = *(unsigned int *)&v38[v35 + 4 + v39 + v43];
              v45 = objc_msgSend_initWithBytes_length_(v40, v41, (uint64_t)&v38[v35 + 8 + v39 + v43 + v44], *(unsigned int *)&v38[v39 + 4 + v43 + v44 + v35]);
            }
            else
            {
              v45 = objc_msgSend_initWithBytes_length_(v40, v41, 4, *(unsigned int *)&v38[v39 + 4 + *(unsigned int *)((char *)&v33[v35 / 4 + 1] + v39) + v35]);
            }
            v47 = (void *)v45;
            objc_msgSend_metaContentMessageForItemType_data_error_(MEMORY[0x24BE15680], v46, v141);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v129 = v36;

            if (!v48)
              break;
            objc_msgSend_addObject_(v139, v49, (uint64_t)v48);

            v35 += 4;
            v36 = v129;
            if (v37 == v35)
            {
              v50 = v129;
              goto LABEL_47;
            }
          }
          v123 = (id)qword_25441F970;
          if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend_descriptionForTypeIdentifier_(MEMORY[0x24BE5B238], v124, v141);
            v125 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = "_cascadeSpanMatchResults";
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v125;
            *(_WORD *)&buf[22] = 2112;
            v145 = v129;
            _os_log_error_impl(&dword_2462C4000, v123, OS_LOG_TYPE_ERROR, "%s Document with type %@ metacontent failed to decode: %@", buf, 0x20u);

          }
          v13 = 0;
LABEL_93:

          goto LABEL_94;
        }
LABEL_46:
        v50 = 0;
LABEL_47:
        v51 = [SEMCascadeEntityInfo alloc];
        v54 = (void *)objc_msgSend_copy(v139, v52, v53);
        v129 = v50;
        v140 = objc_msgSend_initWithContent_allMetaContent_sourceIdentifier_(v51, v55, (uint64_t)v128, v54, v127);

        v56 = a1[1];
        v130 = a1[2];
        if (v56 != v130)
        {
          do
          {
            v131 = (unsigned int *)v56;
            if (v56[2])
            {
              v57 = (skit::SpanMatchV3 *)(v56 + 122);
              v58 = skit::SpanMatchV3::alias_ids((skit::SpanMatchV3 *)(v56 + 122));
              sub_2462EBAB4((uint64_t)buf, *(char **)v58, (char *)(*(_QWORD *)v58 + 2 * *(unsigned int *)(v58 + 8)));
              if (*(_DWORD *)&buf[8])
              {
                v59 = 0;
                v60 = 2 * *(unsigned int *)&buf[8];
                v61 = (unsigned __int8 *)(*(_QWORD *)buf + 1);
                do
                {
                  v62 = *v61;
                  v61 += 2;
                  switch(v62)
                  {
                    case 1:
                      v59 |= 1u;
                      break;
                    case 2:
                      v59 |= 2u;
                      break;
                    case 3:
                      v59 |= 4u;
                      break;
                    case 4:
                      v59 |= 8u;
                      break;
                    case 6:
                      v59 |= 0x10u;
                      break;
                    case 7:
                      v59 |= 0x40u;
                      break;
                    case 8:
                      v59 |= 0x81u;
                      break;
                    case 9:
                      v59 |= 0x20u;
                      break;
                    default:
                      break;
                  }
                  v60 -= 2;
                }
                while (v60);
              }
              else
              {
                LOWORD(v59) = 0;
              }
              if (*(_BYTE **)buf != &buf[16])
                free(*(void **)buf);
              if (v131[136])
                v64 = v59 | 0x20;
              else
                v64 = v59;
              v143 = v64;
              sub_2462EA518();
              v137 = objc_claimAutoreleasedReturnValue();
              v135 = [SEMSpanInfo alloc];
              v65 = *(unsigned int *)skit::SpanMatchV3::span(v57);
              v66 = (int *)skit::SpanMatchV3::span(v57);
              v67 = *v66;
              v68 = v66[1];
              skit::SpanMatchV3::score(v57);
              v70 = v69;
              v71 = v131[138];
              v72 = skit::SpanMatchV3::token_cnt(v57);
              v73 = v131[139];
              v74 = skit::SpanMatchV3::stop_word_cnt(v57);
              v75 = v131[2];
              if ((_DWORD)v75)
              {
                v76 = 0;
                v77 = 112 * v75;
                v78 = (int *)(*(_QWORD *)v131 + 40);
                do
                {
                  v79 = *v78;
                  v78 += 28;
                  v76 += v79;
                  v77 -= 112;
                }
                while (v77);
              }
              else
              {
                v76 = 0;
              }
              v80 = skit::SpanMatchV3::alias_token_cnt(v57);
              v81 = skit::SpanMatchV3::edit_dist(v57);
              LOWORD(v126) = v143;
              LODWORD(v82) = v70;
              matched = (void *)objc_msgSend_initWithValue_location_length_matchScore_maxTokenCount_matchedTokenCount_maxStopWordCount_matchedStopWordCount_maxAliasCount_matchedAliasCount_editDistance_aliasMatchOptions_(v135, v83, v137, v65, (v68 - v67), v71, v72, v73, v82, __PAIR64__(v76, v74), __PAIR64__(v81, v80), v126);
              v63 = v137;
            }
            else
            {
              v63 = (id)qword_25441F970;
              if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
              {
                sub_2462EA518();
                v121 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v146 = 136315394;
                v147 = "_spanInfoFromCascadeSpanMatchResult";
                v148 = 2112;
                v149 = v121;
                _os_log_error_impl(&dword_2462C4000, v63, OS_LOG_TYPE_ERROR, "%s skit MergedFieldMatchV2 has zero-length fields. value: %@", v146, 0x16u);

              }
              matched = 0;
            }

            v84 = objc_alloc(MEMORY[0x24BDBCEB8]);
            v132 = (void *)objc_msgSend_initWithCapacity_(v84, v85, v131[2]);
            v86 = v131[2];
            if ((_DWORD)v86)
            {
              v134 = 112 * v86;
              v87 = (skit::SpanMatchV3 *)(*(_QWORD *)v131 + 48);
              while (1)
              {
                v136 = [SEMSpanInfo alloc];
                sub_2462EA518();
                v138 = (void *)objc_claimAutoreleasedReturnValue();
                v88 = *(unsigned int *)skit::SpanMatchV3::span(v87);
                v89 = *(_DWORD *)(skit::SpanMatchV3::span(v87) + 4);
                v90 = *(_DWORD *)skit::SpanMatchV3::span(v87);
                skit::SpanMatchV3::score(v87);
                v92 = v91;
                v93 = *((unsigned int *)v87 - 4);
                v94 = skit::SpanMatchV3::token_cnt(v87);
                v95 = *((unsigned int *)v87 - 3);
                v96 = skit::SpanMatchV3::stop_word_cnt(v87);
                v97 = *((_DWORD *)v87 - 2);
                v98 = skit::SpanMatchV3::alias_token_cnt(v87);
                v99 = skit::SpanMatchV3::edit_dist(v87);
                LOWORD(v126) = 0;
                LODWORD(v100) = v92;
                v102 = (void *)objc_msgSend_initWithValue_location_length_matchScore_maxTokenCount_matchedTokenCount_maxStopWordCount_matchedStopWordCount_maxAliasCount_matchedAliasCount_editDistance_aliasMatchOptions_(v136, v101, (uint64_t)v138, v88, (v89 - v90), v93, v94, v95, v100, __PAIR64__(v97, v96), __PAIR64__(v99, v98), v126);

                v103 = [SEMCascadeEntityFieldInfo alloc];
                v105 = (void *)objc_msgSend_initWithFieldType_(v103, v104, *((unsigned __int16 *)v87 - 24));
                v106 = [SEMFieldMatch alloc];
                v109 = (void *)objc_msgSend_initWithSpanInfo_entityFieldInfo_(v106, v107, (uint64_t)v102, v105);
                if (!v109)
                  break;
                objc_msgSend_addObject_(v132, v108, (uint64_t)v109);

                v87 = (skit::SpanMatchV3 *)((char *)v87 + 112);
                v134 -= 112;
                if (!v134)
                  goto LABEL_81;
              }
              v112 = (id)qword_25441F970;
              if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
              {
                sub_2462EA518();
                v122 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)&buf[4] = "_fieldMatchesFromCascadeSpanMatchResult";
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v122;
                _os_log_error_impl(&dword_2462C4000, v112, OS_LOG_TYPE_ERROR, "%s Failed to convert SKIT field match to SEMFieldMatch. value: %@", buf, 0x16u);

              }
              v111 = 0;
              v110 = v132;
            }
            else
            {
LABEL_81:
              v110 = v132;
              v111 = v132;
            }

            v113 = 0;
            do
            {
              v114 = [SEMSpanMatchResult alloc];
              v117 = (void *)objc_msgSend_initWithEntityInfo_spanInfo_fieldMatches_duplicateIndex_(v114, v115, v140, matched, v111, v113);
              if (v117)
              {
                objc_msgSend_addObject_(v133, v116, (uint64_t)v117);
              }
              else
              {
                v118 = qword_25441F970;
                if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  *(_QWORD *)&buf[4] = "_cascadeSpanMatchResults";
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v140;
                  _os_log_error_impl(&dword_2462C4000, v118, OS_LOG_TYPE_ERROR, "%s Failed to convert SKIT match result to SEMSpanMatchResult. entityInfo: %@", buf, 0x16u);
                }
              }

              v113 = (v113 + 1);
            }
            while (objc_msgSend_count(v139, v119, v120) > v113);

            v56 = (int *)(v131 + 142);
          }
          while (v131 + 142 != (unsigned int *)v130);
        }
        v13 = v133;
        v47 = (void *)v140;
        goto LABEL_93;
      }
LABEL_45:
      v139 = 0;
      goto LABEL_46;
    }
    v20 = (char *)v10 + v19;
    v21 = *(unsigned int *)((char *)v10 + v19);
    v23 = &v20[v21 + 4];
    v22 = *(unsigned int *)&v20[v21];
    if (v22 >= 0x17)
    {
      v25 = (v22 & 0xFFFFFFF8) + 8;
      if ((v22 | 7) != 0x17)
        v25 = v22 | 7;
      v26 = v25 + 1;
      v24 = operator new(v25 + 1);
      *(_QWORD *)&buf[8] = v22;
      *(_QWORD *)&buf[16] = v26 | 0x8000000000000000;
      *(_QWORD *)buf = v24;
    }
    else
    {
      buf[23] = *(_DWORD *)&v20[v21];
      v24 = buf;
      if (!(_DWORD)v22)
        goto LABEL_29;
    }
    memmove(v24, v23, v22);
LABEL_29:
    v24[v22] = 0;
    if (buf[23] >= 0)
      objc_msgSend_stringWithCString_encoding_(MEMORY[0x24BDD17C8], v7, (uint64_t)buf, 4);
    else
      objc_msgSend_stringWithCString_encoding_(MEMORY[0x24BDD17C8], v7, *(uint64_t *)buf, 4);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    if ((buf[23] & 0x80000000) != 0)
      operator delete(*(void **)buf);
    v27 = *v10;
    v16 = -v27;
    v18 = *(unsigned __int16 *)((char *)v10 - v27);
LABEL_35:
    if (v18 < 9)
      goto LABEL_45;
    goto LABEL_36;
  }
  v11 = qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
  {
    v12 = v2[2];
    if (v2[2])
      LODWORD(v12) = *((unsigned __int8 *)v1 + v12);
    goto LABEL_23;
  }
LABEL_11:
  v13 = 0;
  return v13;
}

void sub_2462EB934(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29,uint64_t a30,void *__p,uint64_t a32,int a33,__int16 a34,char a35,char a36)
{
  void *v36;
  void *v37;
  void *v38;

  _Unwind_Resume(a1);
}

uint64_t sub_2462EBAB4(uint64_t a1, char *a2, char *a3)
{
  char *v4;
  unint64_t v6;
  void *v7;
  size_t v8;
  _WORD *v9;
  __int16 v10;

  v4 = a2;
  v6 = (unint64_t)(a3 - a2) >> 1;
  if (v6 < 5)
  {
    v9 = (_WORD *)(a1 + 16);
    *(_QWORD *)a1 = a1 + 16;
    LODWORD(v8) = 4;
  }
  else
  {
    v7 = sub_2462EBB34((unint64_t)(a3 - a2) >> 1);
    *(_QWORD *)a1 = v7;
    v8 = malloc_size(v7) >> 1;
    v9 = *(_WORD **)a1;
  }
  *(_DWORD *)(a1 + 8) = v6;
  *(_DWORD *)(a1 + 12) = v8;
  while (v4 != a3)
  {
    v10 = *(_WORD *)v4;
    v4 += 2;
    *v9++ = v10;
  }
  return a1;
}

void *sub_2462EBB34(unsigned int a1)
{
  void *result;
  std::bad_alloc *exception;
  std::bad_alloc *v3;

  result = malloc_type_malloc(2 * a1, 0x1000040BDFB0063uLL);
  if (!result)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    v3 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v3, MEMORY[0x24BEDB758], MEMORY[0x24BEDB670]);
  }
  return result;
}

std::string *sub_2462EBB80(std::string *this, char **a2)
{
  char *v3;
  char *v4;

  *(_OWORD *)&this->__r_.__value_.__l.__data_ = 0uLL;
  this->__r_.__value_.__r.__words[2] = 0;
  v3 = *a2;
  v4 = v3 - 1;
  while (*++v4)
    ;
  sub_2462E3EE8(this, v3, v4);
  return this;
}

void sub_2462EBBC0(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t **sub_2462EBBDC@<X0>(uint64_t **result@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t *v5;
  int v6;
  int v7;
  uint64_t v8;
  unsigned int Script;
  BOOL v11;
  int v12;
  int v13;
  int v14;
  unint64_t v15;
  uint64_t *v16;
  unint64_t v17;
  unint64_t v18;
  void **p_dst;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  void **v24;
  char v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  void **v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  void **__dst;
  __int128 v40;
  int v41;
  __int128 v42;
  char *v43;
  char *v44;
  uint64_t v45;
  _BYTE v46[15];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  v3 = *result;
  v38 = result[1];
  if (*result != v38)
  {
    v37 = (uint64_t)(a2 + 2);
LABEL_3:
    if ((v3[5] & 1) == 0)
      goto LABEL_33;
    if (*((char *)v3 + 23) < 0)
    {
      v5 = (uint64_t *)*v3;
      v4 = v3[1];
    }
    else
    {
      LODWORD(v4) = *((unsigned __int8 *)v3 + 23);
      v5 = v3;
    }
    if ((int)v4 < 1)
    {
LABEL_32:
      result = (uint64_t **)sub_2462E637C(a2, (__int128 *)v3);
      goto LABEL_33;
    }
    v6 = 0;
    v7 = 0;
    while (1)
    {
      v8 = v7 + 1;
      if ((*((_WORD *)v5 + v7) & 0xFC00) != 0xD800 || (_DWORD)v8 == (_DWORD)v4)
      {
        ++v7;
      }
      else if ((*((_WORD *)v5 + v8) & 0xFC00) == 0xDC00)
      {
        v7 += 2;
      }
      else
      {
        ++v7;
      }
      LODWORD(v42) = 0;
      Script = uscript_getScript();
      if ((int)v42 > 0)
        goto LABEL_32;
      if (Script > 0x36)
        break;
      if (((1 << Script) & 0x40000000520020) != 0)
        goto LABEL_28;
      if (((1 << Script) & 3) == 0)
        break;
LABEL_29:
      if (v7 >= (int)v4)
      {
        if (v6)
        {
          v41 = 0;
          result = (uint64_t **)ubrk_open();
          if (v41 < 1)
          {
            v12 = ubrk_first();
            if (v12 != -1)
            {
              while (1)
              {
                v13 = ubrk_next();
                v14 = v13;
                if (v13 == -1)
                  goto LABEL_66;
                if (*((char *)v3 + 23) < 0)
                {
                  v15 = v3[1];
                  if (v15 < v12)
LABEL_68:
                    sub_2462ECC24();
                  v16 = (uint64_t *)*v3;
                }
                else
                {
                  v15 = *((unsigned __int8 *)v3 + 23);
                  v16 = v3;
                  if (v15 < v12)
                    goto LABEL_68;
                }
                v17 = v15 - v12;
                if (v17 >= v13 - v12)
                  v18 = v13 - v12;
                else
                  v18 = v17;
                if (v18 >= 0x7FFFFFFFFFFFFFF8)
                  sub_2462D3400();
                if (v18 >= 0xB)
                  break;
                HIBYTE(v40) = v18;
                p_dst = (void **)&__dst;
                if (v18)
                  goto LABEL_53;
LABEL_54:
                *((_WORD *)p_dst + v18) = 0;
                v22 = a2[1];
                v23 = a2[2];
                if (v22 >= v23)
                {
                  v27 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v22 - *a2) >> 4);
                  v28 = v27 + 1;
                  if (v27 + 1 > 0x555555555555555)
                    sub_2462D357C();
                  v29 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v23 - *a2) >> 4);
                  if (2 * v29 > v28)
                    v28 = 2 * v29;
                  if (v29 >= 0x2AAAAAAAAAAAAAALL)
                    v30 = 0x555555555555555;
                  else
                    v30 = v28;
                  v45 = v37;
                  v31 = (char *)sub_2462D7644(v37, v30);
                  v32 = &v31[48 * v27];
                  *(_QWORD *)&v42 = v31;
                  *((_QWORD *)&v42 + 1) = v32;
                  v44 = &v31[48 * v33];
                  v34 = __dst;
                  *(_QWORD *)&v46[7] = *(_QWORD *)((char *)&v40 + 7);
                  *(_QWORD *)v46 = v40;
                  v35 = HIBYTE(v40);
                  v40 = 0uLL;
                  __dst = 0;
                  v36 = *(_QWORD *)v46;
                  *(_QWORD *)v32 = v34;
                  *((_QWORD *)v32 + 1) = v36;
                  *(_QWORD *)(v32 + 15) = *(_QWORD *)&v46[7];
                  v32[23] = v35;
                  *((_QWORD *)v32 + 3) = 0;
                  *((_QWORD *)v32 + 4) = 0x100003F800000;
                  *((_WORD *)v32 + 20) = 3;
                  *((_DWORD *)v32 + 11) = 0;
                  v43 = v32 + 48;
                  sub_2462D75D0(a2, &v42);
                  v26 = a2[1];
                  sub_2462D77AC((uint64_t)&v42);
                }
                else
                {
                  v24 = __dst;
                  *(_QWORD *)&v42 = v40;
                  *(_QWORD *)((char *)&v42 + 7) = *(_QWORD *)((char *)&v40 + 7);
                  v25 = HIBYTE(v40);
                  v40 = 0uLL;
                  __dst = 0;
                  *(_QWORD *)v22 = v24;
                  *(_QWORD *)(v22 + 8) = v42;
                  *(_QWORD *)(v22 + 15) = *(_QWORD *)((char *)&v42 + 7);
                  *(_BYTE *)(v22 + 23) = v25;
                  *(_QWORD *)(v22 + 24) = 0;
                  *(_QWORD *)(v22 + 32) = 0x100003F800000;
                  *(_WORD *)(v22 + 40) = 3;
                  *(_DWORD *)(v22 + 44) = 0;
                  v26 = v22 + 48;
                }
                a2[1] = v26;
                if (SHIBYTE(v40) < 0)
                {
                  operator delete(__dst);
                  v26 = a2[1];
                }
                *(_QWORD *)(v26 - 24) = (*((_DWORD *)v3 + 6) + v12) | ((unint64_t)(*((_DWORD *)v3 + 6) + v14) << 32);
                *(_DWORD *)(v26 - 16) = *((_DWORD *)v3 + 8);
                *(_WORD *)(v26 - 12) = *((_WORD *)v3 + 18);
                *(_DWORD *)(v26 - 10) = *(_DWORD *)((char *)v3 + 38);
                v12 = v14;
              }
              v20 = (v18 & 0xFFFFFFFFFFFFFFFCLL) + 4;
              if ((v18 | 3) != 0xB)
                v20 = v18 | 3;
              p_dst = (void **)sub_2462D7494((uint64_t)&__dst, v20 + 1);
              *(_QWORD *)&v40 = v18;
              *((_QWORD *)&v40 + 1) = v21 | 0x8000000000000000;
              __dst = p_dst;
LABEL_53:
              memmove(p_dst, (char *)v16 + 2 * v12, 2 * v18);
              goto LABEL_54;
            }
LABEL_66:
            result = (uint64_t **)ubrk_close();
          }
LABEL_33:
          v3 += 6;
          if (v3 == v38)
            return result;
          goto LABEL_3;
        }
        goto LABEL_32;
      }
    }
    v11 = Script - 73 > 0x20 || ((1 << (Script - 73)) & 0x100000003) == 0;
    if (v11 && Script != 172)
      goto LABEL_32;
LABEL_28:
    ++v6;
    goto LABEL_29;
  }
  return result;
}

void sub_2462EC084(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, char a20)
{
  sub_2462D3760((void ***)&__p);
  _Unwind_Resume(a1);
}

void sub_2462EC0E0(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  unint64_t v13;
  __int128 v14;
  unint64_t v15;
  __int128 v16;
  unint64_t v17;
  void **v18;
  uint64_t i;
  uint64_t v20;
  int v21;
  unint64_t v22;
  void **v23;
  uint64_t j;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  __int128 v30;
  uint64_t v31;
  void *v32[2];
  __int128 v33;
  _BYTE v34[10];
  int v35;
  void *__p[2];
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  void *__dst[2];
  uint64_t v41;
  _BYTE v42[24];

  v5 = *a1;
  v4 = a1[1];
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - *a1) >> 4) >= 2)
  {
    v29 = -1;
    v6 = 1;
    do
    {
      v7 = v6 - 1;
      v8 = v5 + 48 * (v6 - 1);
      if (*(char *)(v8 + 23) < 0)
      {
        sub_2462D7540(__dst, *(void **)v8, *(_QWORD *)(v8 + 8));
        v10 = *a1;
      }
      else
      {
        v9 = *(_OWORD *)v8;
        v41 = *(_QWORD *)(v8 + 16);
        *(_OWORD *)__dst = v9;
        v10 = v5;
      }
      v11 = v5 + 48 * v7;
      v12 = *(_OWORD *)(v11 + 24);
      *(_QWORD *)&v42[16] = *(_QWORD *)(v11 + 40);
      *(_OWORD *)v42 = v12;
      v13 = v10 + 48 * v6;
      if (*(char *)(v13 + 23) < 0)
      {
        sub_2462D7540(__p, *(void **)v13, *(_QWORD *)(v13 + 8));
      }
      else
      {
        v14 = *(_OWORD *)v13;
        v37 = *(_QWORD *)(v13 + 16);
        *(_OWORD *)__p = v14;
      }
      v15 = v10 + 48 * v6;
      v16 = *(_OWORD *)(v15 + 24);
      v39 = *(_QWORD *)(v15 + 40);
      v38 = v16;
      if (*(_DWORD *)&v42[4] != (_DWORD)v16 || (v42[16] & 2) == 0)
        goto LABEL_15;
      if ((v39 & 2) != 0)
      {
        if (v7 != v29)
        {
          v32[0] = (void *)(MEMORY[0x24BEDDEC8] + 16);
          v32[1] = (void *)(MEMORY[0x24BEDDEC8] + 64);
          LODWORD(v33) = 1065353216;
          WORD2(v33) = 5;
          if ((skit::EmojiFilter::filter() & 1) != 0)
            goto LABEL_15;
          v17 = HIBYTE(v41);
          if (v41 >= 0)
            v18 = __dst;
          else
            v18 = (void **)__dst[0];
          if (v41 < 0)
            v17 = (unint64_t)__dst[1];
          if (v17)
          {
            for (i = 2 * v17; i; i -= 2)
            {
              v20 = *(unsigned __int16 *)v18;
              if (v20 > 0xFF)
                goto LABEL_65;
              v21 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v20 + 60);
              if ((v21 & 0x400) != 0)
                goto LABEL_15;
              if (v20 <= 0x7F)
              {
                if ((v21 & 0x2000) != 0)
                  goto LABEL_15;
              }
              else
              {
LABEL_65:
                if (__maskrune(v20, 0x2000uLL))
                  goto LABEL_15;
              }
              v18 = (void **)((char *)v18 + 2);
            }
          }
        }
        v32[0] = (void *)(MEMORY[0x24BEDDEC8] + 16);
        v32[1] = (void *)(MEMORY[0x24BEDDEC8] + 64);
        LODWORD(v33) = 1065353216;
        WORD2(v33) = 5;
        if ((skit::EmojiFilter::filter() & 1) == 0)
        {
          v22 = HIBYTE(v37);
          if (v37 >= 0)
            v23 = __p;
          else
            v23 = (void **)__p[0];
          if (v37 < 0)
            v22 = (unint64_t)__p[1];
          if (v22)
          {
            for (j = 2 * v22; j; j -= 2)
            {
              v25 = *(unsigned __int16 *)v23;
              if (v25 > 0xFF)
                goto LABEL_66;
              v26 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v25 + 60);
              if ((v26 & 0x400) != 0)
                goto LABEL_14;
              if (v25 <= 0x7F)
              {
                if ((v26 & 0x2000) != 0)
                  goto LABEL_14;
              }
              else
              {
LABEL_66:
                if (__maskrune(v25, 0x2000uLL))
                  goto LABEL_14;
              }
              v23 = (void **)((char *)v23 + 2);
            }
          }
          *(_OWORD *)v32 = 0u;
          v33 = 0u;
          *(_QWORD *)v34 = 0x100003F800000;
          *(_WORD *)&v34[8] = 3;
          v35 = 0;
          v27 = a1[1];
          if (*(_DWORD *)(v27 - 20) == (_DWORD)v38)
          {
            sub_2462EC544((uint64_t)&v30, (const void **)(v27 - 48), (const void **)__p);
            if (SBYTE7(v33) < 0)
              operator delete(v32[0]);
            *(_OWORD *)v32 = v30;
            *(_QWORD *)&v33 = v31;
            v28 = *(unsigned int *)(a1[1] - 24);
          }
          else
          {
            sub_2462EC544((uint64_t)&v30, (const void **)__dst, (const void **)__p);
            if (SBYTE7(v33) < 0)
              operator delete(v32[0]);
            *(_OWORD *)v32 = v30;
            *(_QWORD *)&v33 = v31;
            v28 = *(unsigned int *)v42;
          }
          *((_QWORD *)&v33 + 1) = v28 | ((unint64_t)DWORD1(v38) << 32);
          *(_DWORD *)v34 = *(_DWORD *)&v42[8];
          *(_WORD *)&v34[4] = *(_WORD *)&v42[12];
          *(_DWORD *)&v34[6] = *(_DWORD *)&v42[14];
          sub_2462E637C(a1, (__int128 *)v32);
          if (SBYTE7(v33) < 0)
            operator delete(v32[0]);
          v29 = v6;
          goto LABEL_15;
        }
      }
LABEL_14:
      ++v6;
LABEL_15:
      if (SHIBYTE(v37) < 0)
        operator delete(__p[0]);
      if (SHIBYTE(v41) < 0)
        operator delete(__dst[0]);
      ++v6;
      v5 = *a1;
      v4 = a1[1];
    }
    while (v6 < 0xAAAAAAAAAAAAAAABLL * ((v4 - *a1) >> 4));
  }
  *a2 = v5;
  a2[1] = v4;
  a2[2] = a1[2];
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
}

void sub_2462EC4E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36)
{
  if (a18 < 0)
    operator delete(__p);
  if (a27 < 0)
    operator delete(a22);
  if (a36 < 0)
    operator delete(a31);
  _Unwind_Resume(exception_object);
}

uint64_t sub_2462EC544(uint64_t a1, const void **a2, const void **a3)
{
  unint64_t v5;
  unint64_t v6;
  uint64_t result;
  char *v8;
  const void *v9;
  const void *v10;

  if (*((char *)a2 + 23) >= 0)
    v5 = *((unsigned __int8 *)a2 + 23);
  else
    v5 = (unint64_t)a2[1];
  if (*((char *)a3 + 23) >= 0)
    v6 = *((unsigned __int8 *)a3 + 23);
  else
    v6 = (unint64_t)a3[1];
  result = sub_2462ECCA4(a1, v6 + v5);
  if (*(char *)(result + 23) >= 0)
    v8 = (char *)result;
  else
    v8 = *(char **)result;
  if (v5)
  {
    if (*((char *)a2 + 23) >= 0)
      v9 = a2;
    else
      v9 = *a2;
    result = (uint64_t)memmove(v8, v9, 2 * v5);
  }
  if (v6)
  {
    if (*((char *)a3 + 23) >= 0)
      v10 = a3;
    else
      v10 = *a3;
    result = (uint64_t)memmove(&v8[2 * v5], v10, 2 * v6);
  }
  *(_WORD *)&v8[2 * v5 + 2 * v6] = 0;
  return result;
}

void sub_2462EC5FC(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v7;
  char *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unsigned __int16 **v13;
  unsigned __int16 *v14;
  BOOL v15;
  unsigned __int16 *v16;
  __int16 *v17;
  int v18;
  unsigned __int16 *v19;
  __int16 *v20;
  unsigned __int16 *v21;
  unsigned __int16 *v22;
  int64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  _BOOL4 v29;
  unint64_t v30;
  unint64_t v31;
  const void **v32;
  unint64_t v33;
  __int16 *v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *p_p;
  const void *v40;
  char *v41;
  uint64_t v42;
  int v43;
  const void *v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  _WORD *v48;
  unint64_t v49;
  void *v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t *v55;
  uint64_t v56;
  uint64_t *v57;
  char *v58;
  void *__p;
  __int128 v60;
  _QWORD v61[3];

  v61[2] = *MEMORY[0x24BDAC8D0];
  v4 = *a1;
  v3 = a1[1];
  v5 = v3 - *a1;
  if (v3 == *a1)
  {
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
  }
  else
  {
    if (v5 < 0)
      sub_2462D357C();
    v7 = v5 / 48;
    v8 = (char *)operator new(8 * ((unint64_t)(v5 / 48 - 1) >> 6) + 8);
    if (v7 >= 0x41)
      v9 = (v7 - 1) >> 6;
    else
      v9 = 0;
    *(_QWORD *)&v8[8 * v9] = 0;
    v10 = v7 >> 6;
    v58 = v8;
    if (v7 >= 0x40)
    {
      bzero(v8, 8 * v10);
      v8 = v58;
    }
    if ((v7 & 0x3F) != 0)
      *(_QWORD *)&v8[8 * v10] &= ~(0xFFFFFFFFFFFFFFFFLL >> -(v7 & 0x3F));
    v11 = 0;
    if (v7 <= 1)
      v12 = 1;
    else
      v12 = v7;
    do
    {
      v13 = (unsigned __int16 **)(v4 + 48 * v11);
      v14 = (unsigned __int16 *)*((unsigned __int8 *)v13 + 23);
      v15 = (char)v14 < 0;
      if ((char)v14 < 0)
        v14 = v13[1];
      if (v15)
        v16 = *v13;
      else
        v16 = (unsigned __int16 *)(v4 + 48 * v11);
      v17 = (__int16 *)&qword_2463182C0;
      do
      {
        v18 = *((char *)v17 + 23);
        v19 = (unsigned __int16 *)*((_QWORD *)v17 + 1);
        if (v18 >= 0)
          v19 = (unsigned __int16 *)*((unsigned __int8 *)v17 + 23);
        if (v19 == v14)
        {
          if (!v14)
            goto LABEL_32;
          if (v18 >= 0)
            v20 = v17;
          else
            v20 = *(__int16 **)v17;
          v21 = v14;
          v22 = v16;
          while (*v22 == (unsigned __int16)*v20)
          {
            ++v20;
            ++v22;
            v21 = (unsigned __int16 *)((char *)v21 - 1);
            if (!v21)
              goto LABEL_32;
          }
        }
        v17 += 12;
      }
      while (v17 != &word_246318380);
      v17 = &word_246318380;
LABEL_32:
      v23 = (char *)v17 - (char *)&qword_2463182C0;
      v24 = v11 >> 6;
      v25 = 1 << v11;
      if (v23 == 192)
        v26 = *(_QWORD *)&v8[8 * v24] & ~v25;
      else
        v26 = *(_QWORD *)&v8[8 * v24] | v25;
      *(_QWORD *)&v8[8 * v24] = v26;
      ++v11;
    }
    while (v11 != v12);
    v27 = 0;
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
    v57 = a2;
    do
    {
      if (((*(_QWORD *)&v8[(v27 >> 3) & 0x1FFFFFFFFFFFFFF8] >> v27) & 1) != 0)
      {
        v28 = v27 + 1;
        if (v27 + 1 >= 0xAAAAAAAAAAAAAAABLL * ((v3 - v4) >> 4))
        {
          v29 = 0;
          v30 = v27;
        }
        else
        {
          LOBYTE(v29) = 0;
          v30 = v27;
          while (1)
          {
            v31 = v28;
            v32 = (const void **)(v4 + 48 * v27);
            v33 = v31 >> 3;
            v34 = &word_246318380;
            if (*((_DWORD *)v32 + 7) != *(_DWORD *)(v4 + 48 * v31 + 24))
            {
              v34 = &word_246343284;
              if (((*(_QWORD *)&v8[v33 & 0x1FFFFFFFFFFFFFF8] >> v31) & 1) == 0 && v29)
                break;
            }
            if (*((char *)v32 + 23) >= 0)
              v35 = *((unsigned __int8 *)v32 + 23);
            else
              v35 = (unint64_t)v32[1];
            if (*v34)
            {
              v36 = 0;
              do
                v37 = v36 + 1;
              while (v34[++v36]);
            }
            else
            {
              v37 = 0;
            }
            sub_2462ECCA4((uint64_t)&__p, v37 + v35);
            if (v60 >= 0)
              p_p = (char *)&__p;
            else
              p_p = (char *)__p;
            if (v35)
            {
              if (*((char *)v32 + 23) >= 0)
                v40 = v32;
              else
                v40 = *v32;
              memmove(p_p, v40, 2 * v35);
            }
            v41 = &p_p[2 * v35];
            if (v37)
              memcpy(v41, v34, 2 * v37);
            *(_WORD *)&v41[2 * v37] = 0;
            v42 = *a1 + 48 * v31;
            v43 = *(char *)(v42 + 23);
            if (v43 >= 0)
              v44 = (const void *)(*a1 + 48 * v31);
            else
              v44 = *(const void **)v42;
            if (v43 >= 0)
              v45 = *(unsigned __int8 *)(v42 + 23);
            else
              v45 = *(_QWORD *)(v42 + 8);
            if (v60 >= 0)
              v46 = 10;
            else
              v46 = (*((_QWORD *)&v60 + 1) & 0x7FFFFFFFFFFFFFFFLL) - 1;
            if (v60 >= 0)
              v47 = HIBYTE(v60);
            else
              v47 = v60;
            if (v46 - v47 >= v45)
            {
              if (v45)
              {
                if (v60 >= 0)
                  v48 = &__p;
                else
                  v48 = __p;
                memmove(&v48[v47], v44, 2 * v45);
                v49 = v47 + v45;
                if (SHIBYTE(v60) < 0)
                  *(_QWORD *)&v60 = v47 + v45;
                else
                  HIBYTE(v60) = v49 & 0x7F;
                v48[v49] = 0;
              }
            }
            else
            {
              sub_2462D78F0((uint64_t)&__p, v46, v47 + v45 - v46, v47, v47, 0, v45, v44);
            }
            v50 = __p;
            v61[0] = v60;
            *(_QWORD *)((char *)v61 + 7) = *(_QWORD *)((char *)&v60 + 7);
            v51 = HIBYTE(v60);
            v60 = 0uLL;
            __p = 0;
            v52 = *a1 + 48 * v27;
            if (*(char *)(v52 + 23) < 0)
              operator delete(*(void **)v52);
            v53 = v61[0];
            *(_QWORD *)v52 = v50;
            *(_QWORD *)(v52 + 8) = v53;
            *(_QWORD *)(v52 + 15) = *(_QWORD *)((char *)v61 + 7);
            *(_BYTE *)(v52 + 23) = v51;
            if (SHIBYTE(v60) < 0)
              operator delete(__p);
            v54 = *a1 + 48 * v27;
            v55 = (unint64_t *)(v54 + 24);
            v56 = *(unsigned int *)(v54 + 24);
            if (*(char *)(v54 + 23) < 0)
              v54 = *(_QWORD *)(v54 + 8);
            else
              LODWORD(v54) = *(unsigned __int8 *)(v54 + 23);
            v8 = v58;
            *v55 = v56 | ((unint64_t)(v56 + v54) << 32);
            v4 = *a1;
            v29 = ((*(_QWORD *)&v58[v33 & 0x1FFFFFFFFFFFFFF8] >> v31) & 1) == 0
               && *(_DWORD *)(v4 + 48 * v27 + 28) != *(_DWORD *)(v4 + 48 * v31 + 24);
            v28 = v31 + 1;
            v30 = v31;
            if (v31 + 1 >= 0xAAAAAAAAAAAAAAABLL * ((a1[1] - v4) >> 4))
              goto LABEL_97;
          }
          v29 = 1;
          v28 = v31;
        }
LABEL_97:
        a2 = v57;
        sub_2462E637C(v57, (__int128 *)(v4 + 48 * v27));
        if (v29)
          v27 = v28;
        else
          v27 = v30 + 2;
      }
      else
      {
        sub_2462E637C(a2, (__int128 *)(v4 + 48 * v27++));
      }
      v8 = v58;
      v4 = *a1;
      v3 = a1[1];
    }
    while (v27 < 0xAAAAAAAAAAAAAAABLL * ((v3 - *a1) >> 4));
    operator delete(v58);
  }
}

void sub_2462ECB3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, void *__p, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  a13 = a10;
  sub_2462D3760((void ***)&a13);
  operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t sub_2462ECB80(uint64_t a1, skit::internal *this, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  skit::internal *v5;
  uint64_t v7;
  uint64_t v8;
  unsigned __int16 *i;

  v3 = *(_QWORD *)(a1 + 24);
  if (a3)
  {
    v4 = a3;
    v5 = this;
    v7 = *(__int16 *)(*(_QWORD *)(a1 + 8)
                    + 2
                    * (*(_DWORD *)(a1 + 16) & skit::internal::murmur3_32(this, (const unsigned __int8 *)(2 * a3))));
    if ((v7 & 0x8000000000000000) == 0)
    {
      v8 = *(_QWORD *)a1 + 88 * (int)v7;
      if (v4 == *(_QWORD *)(v8 + 8))
      {
        for (i = *(unsigned __int16 **)v8; *i == *(unsigned __int16 *)v5; ++i)
        {
          v5 = (skit::internal *)((char *)v5 + 2);
          if (!--v4)
            return *(_QWORD *)a1 + 88 * v7;
        }
      }
    }
  }
  return v3;
}

void sub_2462ECC24()
{
  sub_2462ECC30();
}

void sub_2462ECC30()
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_2462ECC78(exception);
  __cxa_throw(exception, (struct type_info *)off_25175E4E0, MEMORY[0x24BEDAB00]);
}

void sub_2462ECC64(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_2462ECC78(std::logic_error *a1)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, "basic_string");
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8C0] + 16);
  return result;
}

uint64_t sub_2462ECCA4(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (a2 >= 0x7FFFFFFFFFFFFFF8)
    sub_2462D3400();
  if (a2 > 0xA)
  {
    v4 = (a2 & 0xFFFFFFFFFFFFFFFCLL) + 4;
    if ((a2 | 3) != 0xB)
      v4 = a2 | 3;
    v5 = v4 + 1;
    if (v4 + 1 < 0)
      sub_2462D3488();
    v6 = operator new(2 * v5);
    *(_QWORD *)(a1 + 8) = a2;
    *(_QWORD *)(a1 + 16) = v5 | 0x8000000000000000;
    *(_QWORD *)a1 = v6;
  }
  else
  {
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
    *(_QWORD *)a1 = 0;
    *(_BYTE *)(a1 + 23) = a2;
  }
  return a1;
}

id sub_2462ECD30(uint64_t a1, const char *a2)
{
  void *v2;
  const char *v3;
  void *v4;

  if (a1)
  {
    objc_msgSend_stringByAppendingString_(CFSTR("UserEx"), a2, a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    sub_2462F20D4(v2, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

id sub_2462ECD80(void *a1, const char *a2, uint64_t a3)
{
  void *v3;
  uint64_t v4;
  const char *v5;

  if (a1)
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    v4 = objc_msgSend_unsignedLongLongValue(a1, a2, a3);
    objc_msgSend_stringWithFormat_(v3, v5, (uint64_t)CFSTR("%llx"), v4);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

__CFString *sub_2462ECDC8(void *a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  const char *v11;
  __CFString *v12;
  __CFString *v13;

  v3 = a1;
  v4 = a2;
  v7 = (void *)v4;
  if (v3 | v4)
  {
    if (v3)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v5, (uint64_t)CFSTR("\"%@\""), v3);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
LABEL_4:
        v9 = (void *)MEMORY[0x24BDD17C8];
        sub_2462ECD80(v7, v5, v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v9, v11, (uint64_t)CFSTR("<%@>"), v10);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_8:
        objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v5, (uint64_t)CFSTR("%@:%@%@"), CFSTR("UserEx"), v8, v12);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
    }
    else
    {
      v8 = &stru_251783AF0;
      if (v4)
        goto LABEL_4;
    }
    v12 = &stru_251783AF0;
    goto LABEL_8;
  }
  v13 = CFSTR("Default");
LABEL_9:

  return v13;
}

id sub_2462ECED0(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  id v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend_lastPathComponent(v1, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isEqual_(v4, v5, (uint64_t)CFSTR("Default")) & 1) != 0)
  {
LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  v6 = v4;
  v9 = sub_2462F2110((uint64_t)v6, v7);
  if (!v9 && (objc_msgSend_isEqual_(v6, v8, (uint64_t)CFSTR("0")) & 1) == 0)
  {

    goto LABEL_7;
  }
  objc_msgSend_numberWithLongLong_(MEMORY[0x24BDD16E0], v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
LABEL_7:
    v11 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      v13 = 136315394;
      v14 = "SEMUserIdHashFromDataSiteURL";
      v15 = 2112;
      v16 = v1;
      _os_log_error_impl(&dword_2462C4000, v11, OS_LOG_TYPE_ERROR, "%s Unrecognized dataSiteURL: %@", (uint8_t *)&v13, 0x16u);
    }
    goto LABEL_9;
  }
LABEL_10:

  return v10;
}

uint64_t sub_2462ED00C(void *a1, const char *a2, uint64_t a3)
{
  void *v3;
  const char *v4;
  uint64_t v5;

  objc_msgSend_lastPathComponent(a1, a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqual_(v3, v4, (uint64_t)CFSTR("Default")))
    v5 = 3;
  else
    v5 = 6;

  return v5;
}

id sub_2462ED054(uint64_t a1, void *a2)
{
  const char *v3;
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;

  v4 = a2;
  if (v4)
  {
    objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(MEMORY[0x24BDBCF48], v3, (uint64_t)CFSTR("UserEx"), 1, a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    sub_2462ECD80(v4, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(MEMORY[0x24BDBCF48], v9, (uint64_t)v8, 1, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(MEMORY[0x24BDBCF48], v3, (uint64_t)CFSTR("Default"), 1, a1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

id sub_2462ED10C(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  int isDirectory;
  int v12;
  const char *v13;
  BOOL v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  int v20;
  int v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  id v27;
  id v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  int v40;
  int v41;
  const char *v42;
  BOOL v43;
  NSObject *v44;
  NSObject *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  id v55;
  unsigned __int8 v56;
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  id v60;
  uint8_t v61[4];
  const char *v62;
  __int16 v63;
  id v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v50 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0;
  objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(MEMORY[0x24BDBCF48], v5, (uint64_t)CFSTR("Default"), 1, v1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  isDirectory = objc_msgSend_fileExistsAtPath_isDirectory_(v4, v10, (uint64_t)v9, &v56);
  v12 = v56;

  if (isDirectory)
    v14 = v12 == 0;
  else
    v14 = 1;
  if (!v14)
    objc_msgSend_addObject_(v50, v13, (uint64_t)v6);
  objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(MEMORY[0x24BDBCF48], v13, (uint64_t)CFSTR("UserEx"), 1, v1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_fileExistsAtPath_isDirectory_(v4, v19, (uint64_t)v18, &v56);
  v21 = v56;

  if (!v20 || !v21)
    goto LABEL_22;
  objc_msgSend_path(v15, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0;
  objc_msgSend_contentsOfDirectoryAtPath_error_(v4, v25, (uint64_t)v24, &v55);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v55;

  if (v26)
  {
    v47 = v27;
    v48 = v6;
    v49 = v1;
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v28 = v26;
    v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v51, v61, 16);
    if (v30)
    {
      v32 = v30;
      v33 = *(_QWORD *)v52;
      do
      {
        v34 = 0;
        do
        {
          if (*(_QWORD *)v52 != v33)
            objc_enumerationMutation(v28);
          objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(MEMORY[0x24BDBCF48], v31, *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v34), 1, v15, v47);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_path(v35, v36, v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend_fileExistsAtPath_isDirectory_(v4, v39, (uint64_t)v38, &v56);
          v41 = v56;

          if (v40)
            v43 = v41 == 0;
          else
            v43 = 1;
          if (!v43)
            objc_msgSend_addObject_(v50, v42, (uint64_t)v35);

          ++v34;
        }
        while (v32 != v34);
        v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v51, v61, 16);
      }
      while (v32);
    }

    v6 = v48;
    v1 = v49;
LABEL_22:
    v44 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v58 = "_detectDataSites";
      v59 = 2112;
      v60 = v50;
      _os_log_debug_impl(&dword_2462C4000, v44, OS_LOG_TYPE_DEBUG, "%s Managed data sites: %@", buf, 0x16u);
    }
    goto LABEL_24;
  }
  v46 = qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v61 = 136315394;
    v62 = "_detectDataSites";
    v63 = 2112;
    v64 = v27;
    _os_log_error_impl(&dword_2462C4000, v46, OS_LOG_TYPE_ERROR, "%s Failed to resolve UserEx data site directories: %@", v61, 0x16u);
  }

LABEL_24:
  return v50;
}

id sub_2462ED484(void *a1, _QWORD *a2)
{
  const char *v3;
  uint64_t v4;
  id v5;
  void *v6;
  const char *v7;
  int DirectoryAtURL_withIntermediateDirectories_attributes_error;
  id v9;
  void *v10;
  void *v11;

  v5 = a1;
  if (v5)
  {
    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    DirectoryAtURL_withIntermediateDirectories_attributes_error = objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(v6, v7, (uint64_t)v5, 1, 0, a2);

    v9 = 0;
    if (DirectoryAtURL_withIntermediateDirectories_attributes_error)
      v9 = v5;
  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v3, *MEMORY[0x24BDD0B88], -1000, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (a2 && v10)
      *a2 = objc_retainAutorelease(v10);

    v9 = 0;
  }

  return v9;
}

uint64_t sub_2462ED544(void *a1, _QWORD *a2)
{
  const char *v3;
  uint64_t v4;
  id v5;
  void *v6;
  const char *v7;
  char v8;
  id v9;
  const char *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  if (v5)
  {
    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v8 = objc_msgSend_removeItemAtURL_error_(v6, v7, (uint64_t)v5, &v23);
    v9 = v23;
    v12 = v9;
    if ((v8 & 1) != 0)
    {

LABEL_9:
      v20 = 1;
      goto LABEL_10;
    }
    v21 = objc_msgSend_code(v9, v10, v11);

    if (v21 == 4)
      goto LABEL_9;
    v20 = 0;
    if (a2 && v12)
    {
      v12 = objc_retainAutorelease(v12);
      v20 = 0;
      *a2 = v12;
    }
  }
  else
  {
    v13 = (void *)MEMORY[0x24BDD1540];
    v14 = *MEMORY[0x24BDD0B88];
    v24 = *MEMORY[0x24BDD0FC8];
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v3, (uint64_t)CFSTR("Invalid item URL: %@"), 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v25[0] = v12;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v15, (uint64_t)v25, &v24, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v13, v17, v14, -1000, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (a2 && v18)
      *a2 = objc_retainAutorelease(v18);

    v20 = 0;
  }
LABEL_10:

  return v20;
}

uint64_t sub_2462ED6E4(uint64_t a1, void *a2, int a3, uint64_t a4)
{
  id v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  id v19;
  const char *v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  char isDirectory;
  NSObject *v35;
  unsigned __int8 v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x24BDD1770], v8, a1, 200, 0, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_length(v9, v10, v11))
  {
    objc_msgSend_path(v7, v12, v13);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = (const char *)objc_msgSend_UTF8String(v14, v15, v16);
    v18 = open_dprotected_np(v17, 1538, a3, 0, 384);

    v19 = objc_alloc(MEMORY[0x24BDD1578]);
    v21 = (void *)objc_msgSend_initWithFileDescriptor_closeOnDealloc_(v19, v20, v18, 1);
    v25 = objc_msgSend_writeData_error_(v21, v22, (uint64_t)v9, a4);
    if ((v25 & 1) == 0)
    {
      objc_msgSend_URLByDeletingLastPathComponent(v7, v23, v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_path(v26, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = 0;
      objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      isDirectory = objc_msgSend_fileExistsAtPath_isDirectory_(v32, v33, (uint64_t)v29, &v37);

      if ((isDirectory & 1) == 0)
      {
        v35 = qword_25441F970;
        if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v39 = "SEMWritePropertyList";
          v40 = 2112;
          v41 = v29;
          v42 = 1024;
          v43 = v37;
          _os_log_error_impl(&dword_2462C4000, v35, OS_LOG_TYPE_ERROR, "%s Parent directory: %@ does not exist (isDirectory: %i)", buf, 0x1Cu);
        }
      }

    }
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

id sub_2462ED8D0(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v5;
  void *v6;
  void *v7;

  objc_msgSend_dataWithContentsOfURL_options_error_(MEMORY[0x24BDBCE50], a2, a1, 0, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x24BDD1770], v5, (uint64_t)v6, a2, 0, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id sub_2462ED950()
{
  void *v0;
  void *v1;
  const char *v2;
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;

  v0 = (void *)MEMORY[0x24BDBCF48];
  v1 = (void *)CPSharedResourcesDirectory();
  objc_msgSend_stringByAppendingPathComponent_(v1, v2, (uint64_t)CFSTR("Library/Assistant/SiriVocabulary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileURLWithPath_isDirectory_(MEMORY[0x24BDBCF48], v4, (uint64_t)v3, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(v0, v6, (uint64_t)CFSTR("Modules"), 1, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(v0, v8, (uint64_t)CFSTR("SEM"), 1, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void sub_2462EDA88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2462EDCA8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_2462EDE7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_2462EDF28(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2462EE4D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, uint64_t a19, char *a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  uint64_t v30;

  if (v30)
    (*(void (**)(uint64_t))(*(_QWORD *)v30 + 16))(v30);
  a20 = &a22;
  sub_2462D7E84((void ***)&a20);
  if (a30 < 0)
    operator delete(__p);
  if (a17 < 0)
    operator delete(a12);

  _Unwind_Resume(a1);
}

void sub_2462EE67C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

uint64_t sub_2462EE6A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_addTokenWithValue_cleanValue_normalizedValues_beginIndex_endIndex_isSignificant_isWhitespace_, a3);
}

uint64_t sub_2462EE70C(uint64_t a1)
{
  morphun::Token *v2;
  const Token *Next;
  const Token *v4;
  uint64_t v6;

  v2 = *(morphun::Token **)(a1 + 16);
  if (v2)
  {
    Next = (const Token *)morphun::Token::getNext(v2);
    v4 = *(const Token **)(a1 + 16);
  }
  else
  {
    v4 = 0;
    Next = 0;
  }
  morphun::TokenIterator::TokenIterator((morphun::TokenIterator *)&v6, Next, v4);
  return v6;
}

uint64_t sub_2462EE75C(uint64_t *a1, __int128 *a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  __int128 v12;
  uint64_t v13;
  _QWORD v15[2];
  char *v16;
  char *v17;
  uint64_t *v18;

  v3 = *a1;
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL)
    sub_2462D357C();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x555555555555555)
    v9 = 0xAAAAAAAAAAAAAAALL;
  else
    v9 = v5;
  v18 = a1 + 2;
  if (v9)
    v10 = (char *)sub_2462D7BFC(v7, v9);
  else
    v10 = 0;
  v11 = &v10[24 * v4];
  v15[0] = v10;
  v15[1] = v11;
  v16 = v11;
  v17 = &v10[24 * v9];
  if (*((char *)a2 + 23) < 0)
  {
    sub_2462D7540(v11, *(void **)a2, *((_QWORD *)a2 + 1));
    v11 = v16;
  }
  else
  {
    v12 = *a2;
    *((_QWORD *)v11 + 2) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v11 = v12;
  }
  v16 = v11 + 24;
  sub_2462D7B88(a1, v15);
  v13 = a1[1];
  sub_2462D7D54((uint64_t)v15);
  return v13;
}

void sub_2462EE868(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_2462D7D54((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2462EEBB4(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, __int128 buf, id a16, void *a17)
{
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  const char *v28;
  void *v29;

  if ((_BYTE)a17)
  if (a2 == 1)
  {
    v24 = __cxa_begin_catch(a1);
    v25 = (id)qword_25441F970;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = (void *)MEMORY[0x24BDD17C8];
      v27 = (*(uint64_t (**)(void *))(*(_QWORD *)v24 + 16))(v24);
      objc_msgSend_stringWithCString_encoding_(v26, v28, v27, 4);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 136315650;
      *(_QWORD *)((char *)&buf + 4) = "+[SEMOntologyMapper ontologyGraphFromSpanMatch:]";
      WORD6(buf) = 2112;
      *(_QWORD *)((char *)&buf + 14) = v17;
      HIWORD(a16) = 2112;
      a17 = v29;
      _os_log_error_impl(&dword_2462C4000, v25, OS_LOG_TYPE_ERROR, "%s Caught exception while building USOGraph from span match: %@ \nCaught %@", (uint8_t *)&buf, 0x20u);

    }
    __cxa_end_catch();
    JUMPOUT(0x2462EEAA8);
  }

  _Unwind_Resume(a1);
}

void sub_2462EF1DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v9;

  _Unwind_Resume(a1);
}

void sub_2462EFEF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

uint64_t sub_2462EFF68()
{
  id v0;
  const char *v1;
  uint64_t v2;
  void *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;

  v0 = objc_alloc(MEMORY[0x24BDBCEF0]);
  v2 = objc_msgSend_initWithCapacity_(v0, v1, 20);
  v3 = (void *)qword_25441F918;
  qword_25441F918 = v2;

  objc_msgSend_addObject_((void *)qword_25441F918, v4, *MEMORY[0x24BEA3920]);
  objc_msgSend_addObject_((void *)qword_25441F918, v5, *MEMORY[0x24BEA38E8]);
  objc_msgSend_addObject_((void *)qword_25441F918, v6, *MEMORY[0x24BEA38A8]);
  objc_msgSend_addObject_((void *)qword_25441F918, v7, *MEMORY[0x24BEA38B0]);
  objc_msgSend_addObject_((void *)qword_25441F918, v8, *MEMORY[0x24BEA38D8]);
  objc_msgSend_addObject_((void *)qword_25441F918, v9, *MEMORY[0x24BEA38A0]);
  objc_msgSend_addObject_((void *)qword_25441F918, v10, *MEMORY[0x24BEA3890]);
  objc_msgSend_addObject_((void *)qword_25441F918, v11, *MEMORY[0x24BEA3898]);
  objc_msgSend_addObject_((void *)qword_25441F918, v12, 0x251785E90);
  objc_msgSend_addObject_((void *)qword_25441F918, v13, 0x251785EB0);
  objc_msgSend_addObject_((void *)qword_25441F918, v14, *MEMORY[0x24BEA3910]);
  objc_msgSend_addObject_((void *)qword_25441F918, v15, *MEMORY[0x24BEA38F8]);
  objc_msgSend_addObject_((void *)qword_25441F918, v16, *MEMORY[0x24BEA3918]);
  objc_msgSend_addObject_((void *)qword_25441F918, v17, *MEMORY[0x24BEA3908]);
  objc_msgSend_addObject_((void *)qword_25441F918, v18, *MEMORY[0x24BEA3900]);
  objc_msgSend_addObject_((void *)qword_25441F918, v19, 0x2517859B0);
  objc_msgSend_addObject_((void *)qword_25441F918, v20, 0x2517859D0);
  objc_msgSend_addObject_((void *)qword_25441F918, v21, 0x2517859F0);
  objc_msgSend_addObject_((void *)qword_25441F918, v22, 0x251785A10);
  return objc_msgSend_addObject_((void *)qword_25441F918, v23, 0x251785A30);
}

void sub_2462F05A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_2462F07E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_2462F0AE4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2462F0C0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_2462F0F80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v9 = v7;

  _Unwind_Resume(a1);
}

void sub_2462F1154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v14 = v13;

  _Unwind_Resume(a1);
}

void sub_2462F1300(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v15 = v13;

  _Unwind_Resume(a1);
}

void sub_2462F14D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_2462F150C(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  BOOL v22;
  void *v23;
  id v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  int v29;
  const char *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  switch(objc_msgSend_fieldType(v3, v4, v5))
  {
    case 0xBFADu:
      v6 = (id)*MEMORY[0x24BEA3918];
      objc_msgSend_stringValue(v3, v7, v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 0xBFAEu:
      v6 = (id)*MEMORY[0x24BEA3900];
      objc_msgSend_stringValue(v3, v12, v13);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 0xBFAFu:
      v6 = (id)*MEMORY[0x24BEA3910];
      objc_msgSend_stringValue(v3, v14, v15);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 0xBFB0u:
      v6 = (id)*MEMORY[0x24BEA3908];
      objc_msgSend_stringValue(v3, v16, v17);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 0xBFB1u:
      v6 = (id)*MEMORY[0x24BEA38F8];
      v20 = objc_msgSend_rawEnumValue(v3, v18, v19);
      objc_msgSend__radioStationSignalTypeAsString_(SEMOntologyMapper, v21, v20);
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v11 = (void *)v9;
      if (v6)
        v22 = v9 == 0;
      else
        v22 = 1;
      if (!v22)
      {
        v23 = *(void **)(a1 + 40);
        v24 = objc_alloc(MEMORY[0x24BEA3A98]);
        v26 = (void *)objc_msgSend_initWithKey_valueString_(v24, v25, (uint64_t)v6, v11);
        objc_msgSend_addObject_(v23, v27, (uint64_t)v26);

      }
      break;
    default:
      v10 = qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      {
        v28 = *(_QWORD *)(a1 + 32);
        v29 = 136315394;
        v30 = "+[SEMOntologyMapper _appendSpanProperties:forRadioStationMatch:entityInfo:]_block_invoke";
        v31 = 2112;
        v32 = v28;
        _os_log_error_impl(&dword_2462C4000, v10, OS_LOG_TYPE_ERROR, "%s Unknown fieldType on radio station: %@ Could not associate fieldValue with identifier constant", (uint8_t *)&v29, 0x16u);
      }
      v11 = 0;
      v6 = 0;
      break;
  }

}

void sub_2462F1744(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_2462F198C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v8 = v6;

  _Unwind_Resume(a1);
}

void sub_2462F1AAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v13 = v12;

  _Unwind_Resume(a1);
}

void sub_2462F1C30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v14 = v13;

  _Unwind_Resume(a1);
}

void sub_2462F1C9C()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
  *exception = MEMORY[0x24BEDB8E0] + 16;
  __cxa_throw(exception, MEMORY[0x24BEDB740], MEMORY[0x24BEDABA8]);
}

void sub_2462F1CD0(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_251782B88;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_2462F1CE0(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_251782B88;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x249556DC8);
}

void sub_2462F1D10(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 48))

}

void sub_2462F1D28(_QWORD *a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  v6 = v3;
  if (a1 && v3)
    *a1 = objc_retainAutorelease(v3);
  objc_msgSend_domain(v6, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_length(v7, v8, v9);

  if (v10)
  {
    v11 = v6;
    AnalyticsSendEventLazy();

  }
}

id sub_2462F1DE0(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v31[4];
  _QWORD v32[5];

  v32[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend_underlyingErrors(*(void **)(a1 + 32), a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_description(*(void **)(a1 + 32), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = CFSTR("domain");
  objc_msgSend_domain(*(void **)(a1 + 32), v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v13;
  v31[1] = CFSTR("code");
  v14 = (void *)MEMORY[0x24BDD16E0];
  v17 = objc_msgSend_code(*(void **)(a1 + 32), v15, v16);
  objc_msgSend_numberWithInteger_(v14, v18, v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v21;
  v31[2] = CFSTR("underlyingCode");
  if (v7)
  {
    v22 = (void *)MEMORY[0x24BDD16E0];
    v23 = objc_msgSend_code(v7, v19, v20);
    objc_msgSend_numberWithInteger_(v22, v24, v23);
  }
  else
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v19, v20);
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v27;
  v31[3] = CFSTR("description");
  v28 = v10;
  if (!v10)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v25, v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32[3] = v28;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v25, (uint64_t)v32, v31, 4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)

  return v29;
}

id sub_2462F1F80(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  void *v4;
  unsigned int v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;

  v1 = a1;
  v4 = v1;
  if (v1)
  {
    v5 = objc_msgSend_length(v1, v2, v3);
    v6 = objc_retainAutorelease(v4);
    v9 = objc_msgSend_bytes(v6, v7, v8);
    if (v5 >= 0x10)
    {
      v11 = 0;
      v12 = 0;
      do
      {
        v14 = 0x9DDFEA08EB382D69
            * ((0x9DDFEA08EB382D69 * *(_QWORD *)(v9 + v11)) ^ ((0x9DDFEA08EB382D69 * *(_QWORD *)(v9 + v11)) >> 44));
        v15 = 0x9DDFEA08EB382D69
            * ((0x9DDFEA08EB382D69 * *(_QWORD *)(v9 + v11 + 8)) ^ ((0x9DDFEA08EB382D69 * *(_QWORD *)(v9 + v11 + 8)) >> 44));
        v12 -= 0x622015F714C7D297 * ((v15 ^ (v15 >> 41)) + (v14 ^ (v14 >> 41)));
        v11 += 16;
      }
      while (v11 < (v5 & 0xFFFFFFF0));
    }
    else
    {
      LODWORD(v11) = 0;
      v12 = 0;
    }
    if (v5 > v11)
      __memcpy_chk();
    objc_msgSend_numberWithLongLong_(MEMORY[0x24BDD16E0], v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

id sub_2462F20D4(void *a1, const char *a2)
{
  void *v2;
  void *v3;

  objc_msgSend_dataUsingEncoding_(a1, a2, 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2462F1F80(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t sub_2462F2110(uint64_t a1, const char *a2)
{
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v6;

  v6 = 0;
  objc_msgSend_scannerWithString_(MEMORY[0x24BDD17A8], a2, a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_scanHexLongLong_(v2, v3, (uint64_t)&v6);
  v4 = v6;

  return v4;
}

void sub_2462F24EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2462F253C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2462F2550(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v3;
  int BoolTrialValueForTrialCli_withFactor_andNamespaceName;
  const char *v5;
  const char *v6;
  int v7;
  const char *v8;
  const char *v9;
  unint64_t v10;
  int v11;
  const char *v12;
  const char *v13;
  unint64_t v14;
  int v15;
  const char *v16;
  const char *v17;
  unint64_t v18;
  const char *v19;
  unint64_t v20;
  int v21;
  const char *v22;
  int v23;
  const char *v24;
  uint64_t v25;
  unsigned int LongTrialValueForTrialCli_withFactor_andNamespaceName;
  unsigned int v27;
  NSObject *v28;
  uint64_t v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  __int16 v44;
  unsigned int v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_refresh((void *)qword_25441F8E0, a2, a3);
  BoolTrialValueForTrialCli_withFactor_andNamespaceName = objc_msgSend_getBoolTrialValueForTrialCli_withFactor_andNamespaceName_(SEMTrialUtilities, v3, qword_25441F8E0, CFSTR("useContactAliasSpanMatches"), CFSTR("SIRI_VALUE_INFERENCE_ENTITY_MATCHER"));
  v29 = BoolTrialValueForTrialCli_withFactor_andNamespaceName | objc_msgSend_getBoolTrialValueForTrialCli_withFactor_andNamespaceName_(SEMTrialUtilities, v5, qword_25441F8E0, CFSTR("useContactAliasSpanMatches"), CFSTR("SIRI_VALUE_INFERENCE_CONTACT_RESOLUTION"));
  v7 = objc_msgSend_getBoolTrialValueForTrialCli_withFactor_andNamespaceName_(SEMTrialUtilities, v6, qword_25441F8E0, CFSTR("useContactEmojiSpanMatches"), CFSTR("SIRI_VALUE_INFERENCE_ENTITY_MATCHER"));
  if (v7 | objc_msgSend_getBoolTrialValueForTrialCli_withFactor_andNamespaceName_(SEMTrialUtilities, v8, qword_25441F8E0, CFSTR("useContactEmojiSpanMatches"), CFSTR("SIRI_VALUE_INFERENCE_CONTACT_RESOLUTION")))v10 = 256;
  else
    v10 = 0;
  v11 = objc_msgSend_getBoolTrialValueForTrialCli_withFactor_andNamespaceName_(SEMTrialUtilities, v9, qword_25441F8E0, CFSTR("useContactTokenNormalizationForIndexing"), CFSTR("SIRI_VALUE_INFERENCE_ENTITY_MATCHER"));
  if (v11 | objc_msgSend_getBoolTrialValueForTrialCli_withFactor_andNamespaceName_(SEMTrialUtilities, v12, qword_25441F8E0, CFSTR("useContactTokenNormalizationForIndexing"), CFSTR("SIRI_VALUE_INFERENCE_CONTACT_RESOLUTION")))v14 = 0x10000;
  else
    v14 = 0;
  v15 = objc_msgSend_getBoolTrialValueForTrialCli_withFactor_andNamespaceName_(SEMTrialUtilities, v13, qword_25441F8E0, CFSTR("useContactPrefixSpanMatches"), CFSTR("SIRI_VALUE_INFERENCE_ENTITY_MATCHER"));
  if (v15 | objc_msgSend_getBoolTrialValueForTrialCli_withFactor_andNamespaceName_(SEMTrialUtilities, v16, qword_25441F8E0, CFSTR("useContactPrefixSpanMatches"), CFSTR("SIRI_VALUE_INFERENCE_CONTACT_RESOLUTION")))v18 = 0x1000000;
  else
    v18 = 0;
  if (objc_msgSend_getBoolTrialValueForTrialCli_withFactor_andNamespaceName_(SEMTrialUtilities, v17, qword_25441F8E0, CFSTR("useTokenLemmatization"), CFSTR("SIRI_VALUE_INFERENCE_ENTITY_MATCHER")))v20 = 0x10000000000;
  else
    v20 = 0;
  v21 = objc_msgSend_getBoolTrialValueForTrialCli_withFactor_andNamespaceName_(SEMTrialUtilities, v19, qword_25441F8E0, CFSTR("useContactPhoneticSearch"), CFSTR("SIRI_VALUE_INFERENCE_ENTITY_MATCHER"));
  v23 = objc_msgSend_getBoolTrialValueForTrialCli_withFactor_andNamespaceName_(SEMTrialUtilities, v22, qword_25441F8E0, CFSTR("useContactPhoneticSearch"), CFSTR("SIRI_VALUE_INFERENCE_CONTACT_RESOLUTION"));
  if (v21 | v23)
    v25 = 0x100000000;
  else
    v25 = 0;
  if (v23)
    LongTrialValueForTrialCli_withFactor_andNamespaceName = objc_msgSend_getLongTrialValueForTrialCli_withFactor_andNamespaceName_(SEMTrialUtilities, v24, qword_25441F8E0, CFSTR("phoneticSearchNgramOrder"), CFSTR("SIRI_VALUE_INFERENCE_CONTACT_RESOLUTION"));
  else
    LongTrialValueForTrialCli_withFactor_andNamespaceName = objc_msgSend_getLongTrialValueForTrialCli_withFactor_andNamespaceName_(SEMTrialUtilities, v24, qword_25441F8E0, CFSTR("phoneticSearchNgramOrder"), CFSTR("SIRI_VALUE_INFERENCE_ENTITY_MATCHER"));
  v27 = LongTrialValueForTrialCli_withFactor_andNamespaceName;
  do
    __ldaxp(&xmmword_25441F8C0);
  while (__stlxp(__PAIR128__(LongTrialValueForTrialCli_withFactor_andNamespaceName, v10 | v29 | v14 | v18 | v20 | v25), &xmmword_25441F8C0));
  v28 = qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316930;
    v31 = "_refreshTrialFactors";
    v32 = 1024;
    v33 = v29;
    v34 = 1024;
    v35 = v10 >> 8;
    v36 = 1024;
    v37 = v14 >> 16;
    v38 = 1024;
    v39 = v18 >> 24;
    v40 = 1024;
    v41 = HIDWORD(v25);
    v42 = 1024;
    v43 = v20 >> 40;
    v44 = 1024;
    v45 = v27;
    _os_log_debug_impl(&dword_2462C4000, v28, OS_LOG_TYPE_DEBUG, "%s Trial factors refreshed. use_contact_aliases: %d, use_contact_emoji_matches: %d, use_contact_diacritics_stripping: %d, use_contact_prefix_matching: %d, use_contact_phonetic_search: %d, use_token_lemmatization: %d, phonetic_search_n_gram_order: %d", buf, 0x36u);
  }
}

unint64_t sub_2462F284C()
{
  int AppBooleanValue;
  int v1;
  int AppIntegerValue;
  BOOL v3;
  unsigned __int128 v4;
  unint64_t v5;
  uint64_t v6;
  NSObject *v7;
  unsigned __int128 v8;
  Boolean v10;
  Boolean keyExistsAndHasValidFormat[2];
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (qword_25441F8D8 != -1)
    dispatch_once(&qword_25441F8D8, &unk_251782C60);
  *(_WORD *)keyExistsAndHasValidFormat = 0;
  v10 = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("use_contact_alias_span_matches"), CFSTR("com.apple.siri.vocabulary"), &keyExistsAndHasValidFormat[1]);
  v1 = CFPreferencesGetAppBooleanValue(CFSTR("use_contact_phonetic_search"), CFSTR("com.apple.siri.vocabulary"), keyExistsAndHasValidFormat);
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("phonetic_ngram_order"), CFSTR("com.apple.siri.vocabulary"), &v10);
  if (keyExistsAndHasValidFormat[1] || keyExistsAndHasValidFormat[0] || v10)
  {
    v7 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v13 = "SEMGetTrialFactors";
      v14 = 1024;
      v15 = AppBooleanValue;
      v16 = 1024;
      v17 = v1;
      v18 = 1024;
      v19 = AppIntegerValue;
      _os_log_debug_impl(&dword_2462C4000, v7, OS_LOG_TYPE_DEBUG, "%s Some trial factors were overridden by user default. use_contact_aliases: %d, use_contact_phonetic_search: %d, phonetic_ngram_order: %d", buf, 0x1Eu);
    }
    do
    {
      v8 = __ldaxp(&xmmword_25441F8C0);
      v6 = v8;
    }
    while (__stlxp(v8, &xmmword_25441F8C0));
    v5 = DWORD1(v8);
    if (keyExistsAndHasValidFormat[1])
      v3 = AppBooleanValue != 0;
    else
      v3 = v8;
    if (keyExistsAndHasValidFormat[0])
      LOBYTE(v5) = v1 != 0;
  }
  else
  {
    do
    {
      v4 = __ldaxp(&xmmword_25441F8C0);
      v3 = v4;
    }
    while (__stlxp(v4, &xmmword_25441F8C0));
    v5 = DWORD1(v4);
    v6 = v4;
  }
  return v3 | ((unint64_t)v5 << 32) | v6 & 0xFFFFFF00FFFFFF00;
}

id sub_2462F2A34(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  const char *v7;

  objc_msgSend_clientWithIdentifier_(MEMORY[0x24BEBA908], a2, 112);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_25441F8E0;
  qword_25441F8E0 = v2;

  v4 = CFPreferencesAppSynchronize(CFSTR("com.apple.siri.vocabulary"));
  sub_2462F2550(v4, v5, v6);
  return (id)objc_msgSend_addUpdateHandlerForNamespaceName_usingBlock_((void *)qword_25441F8E0, v7, (uint64_t)CFSTR("SIRI_VALUE_INFERENCE_ENTITY_MATCHER"), &unk_251782CA0);
}

void sub_2462F2AA0()
{
  NSObject *v0;
  _BOOL8 v1;
  const char *v2;
  uint64_t v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v0 = qword_25441F970;
  v1 = os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_DEBUG);
  if (v1)
  {
    v4 = 136315138;
    v5 = "SEMGetTrialFactors_block_invoke_2";
    _os_log_debug_impl(&dword_2462C4000, v0, OS_LOG_TYPE_DEBUG, "%s Trial updates detected. Refreshing trial factor levels", (uint8_t *)&v4, 0xCu);
  }
  sub_2462F2550(v1, v2, v3);
}

unint64_t sub_2462F2B4C()
{
  unsigned int v0;
  unsigned int v1;
  unint64_t v2;

  v0 = sub_2462F284C();
  v1 = (sub_2462F284C() >> 15) & 2 | HIBYTE(v0) & 1;
  v2 = (sub_2462F284C() >> 30) & 4;
  return v1 | v2 | (sub_2462F284C() >> 37) & 8;
}

void sub_2462F3DD8(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __int128 buf, int a12, __int16 a13, __int16 a14, id a15, __int16 a16)
{
  objc_class *v16;
  id v17;
  NSObject *v18;
  void *v19;

  if (a2 == 1)
  {
    v17 = objc_begin_catch(a1);
    v18 = (id)qword_25441F970;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      NSStringFromClass(v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 136315906;
      *(_QWORD *)((char *)&buf + 4) = "-[SEMFilesystemBase(FileStorage) readFileWithName:objectClass:inDirectory:]";
      WORD6(buf) = 2112;
      *(_QWORD *)((char *)&buf + 14) = v19;
      a14 = 2112;
      a15 = v17;
      a16 = 2112;
      _os_log_error_impl(&dword_2462C4000, v18, OS_LOG_TYPE_ERROR, "%s Failed to decode data of type: %@ with exception: '%@' for file: '%@'", (uint8_t *)&buf, 0x2Au);

    }
    objc_end_catch();
    JUMPOUT(0x2462F3AE0);
  }
  _Unwind_Resume(a1);
}

_QWORD *sub_2462F4258(_QWORD *a1, std::__fs::filesystem::path *a2, std::__fs::filesystem::path *a3)
{
  NSObject *v6;
  std::__fs::filesystem::path __p;
  std::__fs::filesystem::path v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  *a1 = 0;
  a1[1] = 0;
  skit::ContextV2::index_reader();
  v9 = *a2;
  a2->__pn_.__r_.__value_.__l.__size_ = 0;
  a2->__pn_.__r_.__value_.__r.__words[2] = 0;
  a2->__pn_.__r_.__value_.__r.__words[0] = 0;
  __p = *a3;
  a3->__pn_.__r_.__value_.__r.__words[0] = 0;
  a3->__pn_.__r_.__value_.__l.__size_ = 0;
  a3->__pn_.__r_.__value_.__r.__words[2] = 0;
  skit::Alias::Alias((skit::Alias *)(a1 + 4), &v9, &__p);
  if (SHIBYTE(__p.__pn_.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__pn_.__r_.__value_.__l.__data_);
  if (SHIBYTE(v9.__pn_.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v9.__pn_.__r_.__value_.__l.__data_);
  if (skit::Alias::init((skit::Alias *)(a1 + 4)))
  {
    v6 = qword_25441F958;
    if (os_log_type_enabled((os_log_t)qword_25441F958, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "Searcher";
      _os_log_error_impl(&dword_2462C4000, v6, OS_LOG_TYPE_ERROR, "%s Failed to initialize alias", buf, 0xCu);
    }
  }
  return a1;
}

void sub_2462F43A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  sub_2462D3524(v23);
  MEMORY[0x2495568D0](v22);
  MEMORY[0x249556A68](v21);
  _Unwind_Resume(a1);
}

uint64_t sub_2462F43FC(uint64_t a1, uint64_t a2, std::__fs::filesystem::path *a3, std::__fs::filesystem::path *a4)
{
  NSObject *v7;
  std::__fs::filesystem::path v9;
  std::__fs::filesystem::path v10;
  int __p;
  __int16 __p_4;
  char v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v13 = 2;
  __p = 7733363;
  __p_4 = 0;
  skit::ContextV2::ContextV2();
  skit::ContextV2::index_reader();
  v10 = *a3;
  a3->__pn_.__r_.__value_.__l.__size_ = 0;
  a3->__pn_.__r_.__value_.__r.__words[2] = 0;
  a3->__pn_.__r_.__value_.__r.__words[0] = 0;
  v9 = *a4;
  a4->__pn_.__r_.__value_.__r.__words[0] = 0;
  a4->__pn_.__r_.__value_.__l.__size_ = 0;
  a4->__pn_.__r_.__value_.__r.__words[2] = 0;
  skit::Alias::Alias((skit::Alias *)(a1 + 32), &v10, &v9);
  if (SHIBYTE(v9.__pn_.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v9.__pn_.__r_.__value_.__l.__data_);
  if (SHIBYTE(v10.__pn_.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v10.__pn_.__r_.__value_.__l.__data_);
  if (skit::Alias::init((skit::Alias *)(a1 + 32)))
  {
    v7 = qword_25441F958;
    if (os_log_type_enabled((os_log_t)qword_25441F958, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "Searcher";
      _os_log_error_impl(&dword_2462C4000, v7, OS_LOG_TYPE_ERROR, "%s Failed to initialize alias", buf, 0xCu);
    }
  }
  return a1;
}

void sub_2462F457C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  sub_2462D3524(v23);
  MEMORY[0x2495568D0](v22);
  MEMORY[0x249556A68](v21);
  _Unwind_Resume(a1);
}

void sub_2462F45D0(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0)
    operator delete(__p);
  JUMPOUT(0x2462F45C8);
}

void sub_2462F45E8(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  std::__shared_weak_count *v8;
  uint64_t v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  id v12;
  char v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  int v17;
  unint64_t *v18;
  unint64_t v19;
  unsigned __int16 *v20;
  unsigned __int16 *v21;
  unint64_t v22;
  uint8x8_t v23;
  unint64_t v24;
  uint64_t ***v25;
  uint64_t **i;
  unint64_t v27;
  uint64_t v28;
  int v29;
  NSObject *v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  std::__shared_weak_count *v37;
  void *v38[3];
  void *__p[2];
  uint64_t v40;
  std::__shared_weak_count *v41;
  uint64_t v42;
  int8x8_t v43;
  __int128 *v44;
  __int128 *v45;
  uint64_t v46;
  uint64_t v47;
  std::__shared_weak_count *v48;
  _QWORD v49[3];
  __int128 buf;
  _BYTE v51[16];
  void **v52[14];

  v52[12] = *(void ***)MEMORY[0x24BDAC8D0];
  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  memset(v49, 0, sizeof(v49));
  v9 = *(_QWORD *)(a2 + 168);
  v8 = *(std::__shared_weak_count **)(a2 + 176);
  v47 = v9;
  v48 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
  }
  v44 = 0;
  v45 = 0;
  v46 = 0;
  sub_2462E0118((char *)&v44, *(__int128 **)a2, *(__int128 **)(a2 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 4));
  v12 = *(id *)(a2 + 48);
  sub_2462F4BE8((uint64_t)&v42, a2);
  v13 = sub_2462D4768(v9, &v44, 0, 0);
  if (*(char *)(a2 + 79) < 0)
  {
    sub_2462D7540(__p, *(void **)(a2 + 56), *(_QWORD *)(a2 + 64));
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)(a2 + 56);
    v40 = *(_QWORD *)(a2 + 72);
  }
  memset(v38, 0, sizeof(v38));
  sub_2462E0118((char *)v38, v44, v45, 0xAAAAAAAAAAAAAAABLL * (v45 - v44));
  skit::FieldSpanMatcherV3::FieldSpanMatcherV3();
  v52[0] = v38;
  sub_2462D3760(v52);
  if (SHIBYTE(v40) < 0)
    operator delete(__p[0]);
  sub_2462D5AD4(v9, (unsigned __int16 **)&v44, 0, v52);
  if ((*(_WORD *)(v9 + 188) & 4) != 0)
    sub_2462D6598(v9, (uint64_t)v52, v12);
  if ((*(_BYTE *)(*(_QWORD *)(v9 + 8) + 32) & 8) != 0 && (*(_WORD *)(v9 + 188) & 2) != 0)
  {
    if ((v13 & 1) != 0)
      sub_2462D3D48((_QWORD *)v9);
    sub_2462D68BC(v9, (size_t)v52, &v44);
  }
  v14 = *(std::__shared_weak_count **)(a1 + 40);
  v37 = v14;
  if (v14)
  {
    v15 = (unint64_t *)&v14->__shared_owners_;
    do
      v16 = __ldxr(v15);
    while (__stxr(v16 + 1, v15));
  }
  *(_QWORD *)&buf = v51;
  *((_QWORD *)&buf + 1) = 0x800000000;
  v17 = skit::FieldSpanMatcherV3::alias_span_matcher();
  if ((_BYTE *)buf != v51)
    free((void *)buf);
  if (!v37)
    goto LABEL_25;
  v18 = (unint64_t *)&v37->__shared_owners_;
  do
    v19 = __ldaxr(v18);
  while (__stlxr(v19 - 1, v18));
  if (v19)
  {
LABEL_25:
    if ((v17 & 0x80000000) == 0)
      goto LABEL_26;
LABEL_50:
    v30 = qword_25441F958;
    if (os_log_type_enabled((os_log_t)qword_25441F958, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "match_spans";
      _os_log_error_impl(&dword_2462C4000, v30, OS_LOG_TYPE_ERROR, "%s ERROR: alias span matcher cannot be set up", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_52;
  }
  ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
  std::__shared_weak_count::__release_weak(v37);
  if (v17 < 0)
    goto LABEL_50;
LABEL_26:
  sub_2462F4FCC(a4, (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 5);
  v20 = *(unsigned __int16 **)a3;
  v21 = *(unsigned __int16 **)(a3 + 8);
  if (*(unsigned __int16 **)a3 != v21)
  {
    do
    {
      if (v43)
      {
        v22 = *v20;
        v23 = (uint8x8_t)vcnt_s8(v43);
        v23.i16[0] = vaddlv_u8(v23);
        if (v23.u32[0] > 1uLL)
        {
          v24 = *v20;
          if (*(_QWORD *)&v43 <= v22)
            v24 = v22 % *(_QWORD *)&v43;
        }
        else
        {
          v24 = (v43.i32[0] - 1) & v22;
        }
        v25 = *(uint64_t ****)(v42 + 8 * v24);
        if (v25)
        {
          for (i = *v25; i; i = (uint64_t **)*i)
          {
            v27 = (unint64_t)i[1];
            if (v27 == v22)
            {
              if (*((unsigned __int16 *)i + 8) == (_DWORD)v22)
              {
                v28 = v47;
                sub_2462D4560(v47, (uint64_t)v44, (uint64_t)v45, *v20);
                a3 = a3 & 0xFFFFFFFF00000000 | *(unsigned int *)(v28 + 184);
                sub_2462DB324(v22, *(_QWORD *)(v28 + 176), *(_WORD *)(v28 + 188), (uint64_t)&buf);
                skit::FieldSpanMatcherV3::alias_filters();
                if ((_BYTE *)buf != v51)
                  free((void *)buf);
                v29 = *((_DWORD *)v20 + 4) - *((_QWORD *)v20 + 1);
                *(_QWORD *)&buf = *((_QWORD *)v20 + 1);
                DWORD2(buf) = v29;
                sub_2462F504C();
                break;
              }
            }
            else
            {
              if (v23.u32[0] > 1uLL)
              {
                if (v27 >= *(_QWORD *)&v43)
                  v27 %= *(_QWORD *)&v43;
              }
              else
              {
                v27 &= *(_QWORD *)&v43 - 1;
              }
              if (v27 != v24)
                break;
            }
          }
        }
      }
      v20 += 16;
    }
    while (v20 != v21);
  }
LABEL_52:
  sub_2462D909C((uint64_t *)v52);
  v31 = v41;
  if (v41)
  {
    v32 = (unint64_t *)&v41->__shared_owners_;
    do
      v33 = __ldaxr(v32);
    while (__stlxr(v33 - 1, v32));
    if (!v33)
    {
      ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
      std::__shared_weak_count::__release_weak(v31);
    }
  }
  sub_2462DBA68((uint64_t)&v42);

  v52[0] = (void **)&v44;
  sub_2462D3760(v52);
  v34 = v48;
  if (v48)
  {
    v35 = (unint64_t *)&v48->__shared_owners_;
    do
      v36 = __ldaxr(v35);
    while (__stlxr(v36 - 1, v35));
    if (!v36)
    {
      ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
      std::__shared_weak_count::__release_weak(v34);
    }
  }
  v52[0] = (void **)v49;
  sub_2462FA6D0(v52);
}

void sub_2462F4AEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,void *a36)
{
  uint64_t v36;
  void *v37;
  uint64_t v38;

  sub_2462DBA68((uint64_t)&a23);

  *(_QWORD *)(v38 - 192) = &a28;
  sub_2462D3760((void ***)(v38 - 192));
  sub_2462D3524((uint64_t)&a31);
  *(_QWORD *)(v38 - 192) = &a33;
  sub_2462FA6D0((void ***)(v38 - 192));
  *(_QWORD *)(v38 - 192) = v36;
  sub_2462D3878((void ***)(v38 - 192));
  _Unwind_Resume(a1);
}

void sub_2462F4BE8(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t **v5;
  uint64_t v6;
  int v7;
  int v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  uint64_t **i;
  uint64_t v13;
  int v14;
  NSObject *v15;
  const char *v16;
  void *v17;
  uint64_t **v18;
  uint64_t v19;
  uint64_t j;
  uint64_t *v21;
  unint64_t v22;
  uint64_t *v23;
  uint64_t *v24;
  unint64_t v25;
  _WORD *v26;
  uint64_t *v27;
  uint64_t *v28;
  __int128 v29;
  unsigned __int16 v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  _QWORD v34[2];
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  *((_QWORD *)&v4 + 1) = 0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (*(_QWORD *)(a2 + 112) || *(_QWORD *)(a2 + 152))
  {
    v5 = *(uint64_t ***)(a2 + 144);
    if (!v5)
      goto LABEL_12;
    *(_QWORD *)&v4 = 136315394;
    v29 = v4;
    do
    {
      v6 = *((unsigned __int16 *)v5 + 8);
      v7 = objc_msgSend_itemTypeForFieldType_error_(MEMORY[0x24BE5B238], (const char *)a2, v6, 0, v29);
      v8 = sub_2462DA9F0(v7);
      v30 = v8;
      if (v8)
      {
        sub_2462DB618(a1, &v30, &v30);
      }
      else
      {
        v9 = (id)qword_25441F958;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          objc_msgSend_descriptionForTypeIdentifier_(MEMORY[0x24BE5B238], v10, v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v29;
          v32 = "included_search_groups";
          v33 = 2112;
          v34[0] = v11;
          _os_log_impl(&dword_2462C4000, v9, OS_LOG_TYPE_INFO, "%s Ignoring invalid FieldType filter: %@", buf, 0x16u);

        }
      }
      v5 = (uint64_t **)*v5;
    }
    while (v5);
    if (!*(_QWORD *)(a1 + 24))
    {
LABEL_12:
      for (i = *(uint64_t ***)(a2 + 104); i; i = (uint64_t **)*i)
      {
        v13 = *((unsigned __int16 *)i + 8);
        v14 = sub_2462DA9F0(*((unsigned __int16 *)i + 8));
        v30 = v14;
        if (v14)
        {
          sub_2462DB618(a1, &v30, &v30);
        }
        else
        {
          v15 = (id)qword_25441F958;
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            objc_msgSend_descriptionForTypeIdentifier_(MEMORY[0x24BE5B238], v16, v13);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v32 = "included_search_groups";
            v33 = 2112;
            v34[0] = v17;
            _os_log_impl(&dword_2462C4000, v15, OS_LOG_TYPE_INFO, "%s Ignoring invalid ItemType filter: %@", buf, 0x16u);

          }
        }
      }
    }
  }
  else
  {
    sub_2462DB5A0((uint64_t)buf, word_246318118, (unsigned __int16 *)&dword_246318124);
    if (buf != (uint8_t *)a1)
    {
      *(_DWORD *)(a1 + 32) = v35;
      v18 = *(uint64_t ***)((char *)v34 + 2);
      v19 = *(_QWORD *)(a1 + 8);
      if (!v19)
        goto LABEL_29;
      for (j = 0; j != v19; *(_QWORD *)(*(_QWORD *)a1 + 8 * j++) = 0)
        ;
      v21 = *(uint64_t **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = 0;
      *(_QWORD *)(a1 + 24) = 0;
      if (v21)
      {
        while (v18)
        {
          v22 = *((unsigned __int16 *)v18 + 8);
          *((_WORD *)v21 + 8) = v22;
          v23 = (uint64_t *)*v21;
          v21[1] = v22;
          v24 = sub_2462F7500(a1, v22, (unsigned __int16 *)v21 + 8);
          sub_2462F784C((_QWORD *)a1, v21, v24);
          v18 = (uint64_t **)*v18;
          v21 = v23;
          if (!v23)
            goto LABEL_29;
        }
        do
        {
          v28 = (uint64_t *)*v21;
          operator delete(v21);
          v21 = v28;
        }
        while (v28);
      }
      else
      {
LABEL_29:
        while (v18)
        {
          v25 = *((unsigned __int16 *)v18 + 8);
          v26 = operator new(0x18uLL);
          v26[8] = v25;
          *(_QWORD *)v26 = 0;
          *((_QWORD *)v26 + 1) = v25;
          v27 = sub_2462F7500(a1, v25, v26 + 8);
          sub_2462F784C((_QWORD *)a1, v26, v27);
          v18 = (uint64_t **)*v18;
        }
      }
    }
    sub_2462DBA68((uint64_t)buf);
  }
}

void sub_2462F4F24(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_2462DBA68(v1);
  _Unwind_Resume(a1);
}

uint64_t *sub_2462F4FCC(uint64_t *result, unint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];

  if (a2 > (result[2] - *result) >> 5)
  {
    if (a2 >> 59)
      sub_2462D357C();
    v2 = result;
    v3 = result[1] - *result;
    v5[4] = result + 2;
    v5[0] = sub_2462D3624(a2);
    v5[1] = v5[0] + v3;
    v5[2] = v5[0] + v3;
    v5[3] = v5[0] + 32 * v4;
    sub_2462F7934(v2, v5);
    return (uint64_t *)sub_2462F79AC((uint64_t)v5);
  }
  return result;
}

void sub_2462F504C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t *v2;
  uint64_t *v3;
  unsigned int **v4;
  unsigned int **v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  unsigned __int16 *v11;
  unsigned int v12;
  unsigned __int16 *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unsigned int *v18;
  uint64_t v19;
  int *v20;
  unsigned __int16 *v21;
  unsigned int v22;
  unsigned int *v23;
  unint64_t v24;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  BOOL v29;
  unsigned __int16 *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int *v37;
  uint64_t v38;
  uint64_t v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unsigned __int16 *v44;
  uint64_t v45;
  int *v46;
  unsigned __int16 *v47;
  unsigned int v48;
  unsigned __int16 *v49;
  uint64_t v50;
  unsigned __int16 *v51;
  uint64_t v52;
  _DWORD *v53;
  unint64_t v54;
  unsigned int *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unsigned __int16 *v59;
  uint64_t v60;
  unsigned int *v61;
  NSObject *v62;
  unsigned __int16 *v63;
  id v64;
  void *v65;
  const char *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  NSObject *v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  char v76;
  void *v77;
  int v78;
  char *v79;
  NSObject *v80;
  int v81;
  NSObject *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  int v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t v94;
  skit::SpanMatchV3 *v95;
  skit::SpanMatchV3 *v96;
  unint64_t v97;
  uint64_t v98;
  unsigned int v99;
  int v100;
  int v101;
  _DWORD *v102;
  _DWORD *v103;
  _DWORD *v104;
  _DWORD *v105;
  unsigned int v106;
  float v107;
  float v108;
  float v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  void **v116;
  void *v117;
  uint64_t v118;
  id v119;
  uint64_t v120;
  uint64_t v121;
  unsigned int v122;
  unsigned int v123;
  uint64_t v124;
  _WORD *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  int v130;
  NSObject *v131;
  uint64_t i;
  uint64_t v133;
  NSObject *v134;
  unsigned int v135;
  unsigned __int16 *v136;
  uint64_t v137;
  unsigned __int16 **v138;
  unint64_t v139;
  unsigned __int16 **v140;
  uint64_t v141;
  uint64_t v142;
  unsigned __int16 *v143;
  uint64_t v144;
  char *v145;
  uint64_t v146;
  unsigned __int16 *v147;
  uint64_t v148;
  void *v149;
  void *v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  const char *v154;
  void *v155;
  char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  _DWORD *v161;
  void *v162;
  uint64_t v163;
  id v164;
  uint64_t v165;
  void *v166;
  uint64_t *v167;
  uint64_t v168;
  id v169;
  uint64_t *v170;
  id v171;
  _QWORD v172[9];
  id v173;
  uint64_t v174;
  uint64_t *v175;
  uint64_t v176;
  char v177;
  uint64_t v178;
  uint64_t *v179;
  uint64_t v180;
  int v181;
  uint64_t v182;
  uint64_t *v183;
  uint64_t v184;
  uint64_t (*v185)(uint64_t, uint64_t);
  uint64_t (*v186)();
  void *v187;
  char *v188;
  unsigned __int16 *v189;
  _BYTE buf[40];
  uint64_t v191;
  skit::SpanMatchV3 *v192;
  uint64_t v193;
  _BYTE v194[4384];
  __int128 v195;
  uint64_t v196;
  void *v197;
  uint64_t v198;
  _QWORD *v199;
  uint64_t v200;
  _QWORD v201[11];

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v170 = v3;
  v5 = v4;
  v167 = (uint64_t *)v0;
  v201[8] = *MEMORY[0x24BDAC8D0];
  v171 = v6;
  v7 = (uint64_t)*v5;
  v8 = **v5;
  v9 = *((unsigned int *)v5 + 2);
  *(_QWORD *)buf = *v5;
  *(_QWORD *)&buf[8] = v9;
  *(_OWORD *)&buf[16] = xmmword_246334EE0;
  *(_QWORD *)&buf[32] = 0;
  LOBYTE(v191) = 1;
  if (v9 >= 0x7FFFFFFF)
    __assert_rtn("Verifier", "flatbuffers.h", 2285, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  v10 = (int *)(v7 + v8);
  if (!sub_2462F7A94((uint64_t *)buf, (int *)(v7 + v8)))
    goto LABEL_90;
  v11 = (unsigned __int16 *)((char *)v10 - *v10);
  v12 = *v11;
  if (v12 >= 5
    && v11[2]
    && (*(_QWORD *)&buf[8] < 2uLL || *(_QWORD *)&buf[8] - 1 < (unint64_t)v10 + v11[2] - *(_QWORD *)buf))
  {
    goto LABEL_90;
  }
  if (!sub_2462F7A0C((int *)(v7 + v8), (uint64_t)buf, 6u))
    goto LABEL_90;
  if (v12 >= 7 && v11[3])
  {
    if (!sub_2462F7B4C((uint64_t)buf, (unsigned int *)((char *)v10 + v11[3] + *(unsigned int *)((char *)v10 + v11[3])), 4uLL, 0))goto LABEL_90;
    v13 = (unsigned __int16 *)((char *)v10 - *v10);
    if (*v13 >= 7u)
    {
      v14 = v13[3];
      if (v14)
      {
        v15 = *(unsigned int *)((char *)v10 + v14);
        v161 = (int *)((char *)v10 + v14 + v15);
        if (*v161)
        {
          v16 = 0;
          v168 = v7 + v8 + v14 + v15 + 8;
          v17 = v15 + v14 + v8 + v7;
          v163 = v17 + 8;
          v165 = v17 + 14;
          do
          {
            v18 = &v161[v16 + 1];
            v19 = *v18;
            v20 = (int *)((char *)v18 + v19);
            if (!sub_2462F7A94((uint64_t *)buf, (int *)((char *)v18 + v19)))
              goto LABEL_90;
            v21 = (unsigned __int16 *)((char *)v20 - *v20);
            v22 = *v21;
            if (v22 >= 5
              && v21[2]
              && (*(_QWORD *)&buf[8] < 3uLL || *(_QWORD *)&buf[8] - 2 < (unint64_t)v20
                                                                        + v21[2]
                                                                        - *(_QWORD *)buf))
            {
              goto LABEL_90;
            }
            if (!sub_2462F7A0C(v20, (uint64_t)buf, 6u))
              goto LABEL_90;
            if (v22 >= 7 && v21[3])
            {
              v23 = (unsigned int *)((char *)v20 + v21[3] + *(unsigned int *)((char *)v20 + v21[3]));
              v24 = (unint64_t)v23 - *(_QWORD *)buf;
              if ((((unint64_t)v23 - *(_QWORD *)buf) & 3) != 0 && v191 != 0)
                goto LABEL_90;
              if (*(_QWORD *)&buf[8] < 5uLL)
                goto LABEL_90;
              if (*(_QWORD *)&buf[8] - 4 < v24)
                goto LABEL_90;
              v26 = *v23;
              if (v26 > 0x7FFFFFFE)
                goto LABEL_90;
              v27 = v26 + 4;
              v29 = *(_QWORD *)&buf[8] >= v27;
              v28 = *(_QWORD *)&buf[8] - v27;
              v29 = v28 != 0 && v29 && v28 >= v24;
              if (!v29)
                goto LABEL_90;
            }
            if (!sub_2462F7A0C(v20, (uint64_t)buf, 8u))
              goto LABEL_90;
            if (v22 >= 9 && v21[4])
            {
              if (!sub_2462F7B4C((uint64_t)buf, (unsigned int *)((char *)v20 + v21[4] + *(unsigned int *)((char *)v20 + v21[4])), 4uLL, 0))goto LABEL_90;
              v30 = (unsigned __int16 *)((char *)v20 - *v20);
              if (*v30 >= 9u)
              {
                v31 = v30[4];
                if (v31)
                {
                  v32 = *(unsigned int *)((char *)v20 + v31);
                  v156 = (char *)v20 + v31;
                  if (*(int *)((char *)v20 + v31 + v32))
                  {
                    v33 = 0;
                    v157 = v168 + v19 + v31;
                    v34 = v31 + v19;
                    v158 = v165 + v34;
                    v35 = v163 + v34;
                    do
                    {
                      v36 = *(unsigned int *)(v35 + v32);
                      v37 = (int *)(v35 + v32 + v36);
                      v38 = v32;
                      if (!sub_2462F7A94((uint64_t *)buf, v37) || !sub_2462F7A0C(v37, (uint64_t)buf, 4u))
                        goto LABEL_90;
                      v32 = v38;
                      v39 = *(int *)(v35 + v38 + v36);
                      v40 = *(unsigned __int16 *)(v35 + v38 + v36 - v39);
                      if (v40 >= 5)
                      {
                        if (*(_WORD *)(v35 + v38 + v36 - v39 + 4))
                        {
                          v41 = *(unsigned __int16 *)(v35 + v38 + v36 - v39 + 4);
                          if (!sub_2462F7B4C((uint64_t)buf, (unsigned int *)(v35 + v38 + v36 + v41 + *(unsigned int *)(v35 + v38 + v36 + v41)), 1uLL, 0))goto LABEL_90;
                          v32 = v38;
                          v42 = *(int *)(v35 + v38 + v36);
                          v43 = -v42;
                          v40 = *(unsigned __int16 *)(v35 + v38 + v36 - v42);
                        }
                        else
                        {
                          v43 = -v39;
                        }
                        if (v40 >= 7
                          && *(_WORD *)(v158 + v32 + v43 + v36)
                          && (*(_QWORD *)&buf[8] < 3uLL
                           || *(_QWORD *)&buf[8] - 2 < v32
                                                       + v157
                                                       + v36
                                                       + (unint64_t)*(unsigned __int16 *)(v158 + v32 + v43 + v36)
                                                       - *(_QWORD *)buf))
                        {
                          goto LABEL_90;
                        }
                      }
                      --*(_DWORD *)&buf[16];
                      ++v33;
                      v157 += 4;
                      v158 += 4;
                      v35 += 4;
                    }
                    while (v33 < *(unsigned int *)&v156[v32]);
                  }
                }
              }
            }
            --*(_DWORD *)&buf[16];
            ++v16;
            v168 += 4;
            v163 += 4;
            v165 += 4;
          }
          while (v16 < *v161);
        }
      }
    }
  }
  if (sub_2462F7A0C(v10, (uint64_t)buf, 8u))
  {
    v44 = (unsigned __int16 *)((char *)v10 - *v10);
    if (*v44 < 9u)
      goto LABEL_93;
    v45 = v44[4];
    if (!v45)
      goto LABEL_93;
    v46 = (int *)((char *)v10 + v45 + *(unsigned int *)((char *)v10 + v45));
    if (sub_2462F7A94((uint64_t *)buf, v46))
    {
      v47 = (unsigned __int16 *)((char *)v46 - *v46);
      v48 = *v47;
      if ((v48 < 5
         || !v47[2]
         || *(_QWORD *)&buf[8] >= 3uLL && *(_QWORD *)&buf[8] - 2 >= (unint64_t)v46 + v47[2] - *(_QWORD *)buf)
        && sub_2462F7A0C(v46, (uint64_t)buf, 6u)
        && (v48 < 7
         || !v47[3]
         || sub_2462F7B4C((uint64_t)buf, (unsigned int *)((char *)v46 + v47[3] + *(unsigned int *)((char *)v46 + v47[3])), 1uLL, 0))&& sub_2462F7A0C(v46, (uint64_t)buf, 8u))
      {
        v49 = (unsigned __int16 *)((char *)v46 - *v46);
        if (*v49 < 9u)
          goto LABEL_83;
        v50 = v49[4];
        if (!v50)
          goto LABEL_83;
        if (sub_2462F7B4C((uint64_t)buf, (unsigned int *)((char *)v46 + v50 + *(unsigned int *)((char *)v46 + v50)), 4uLL, 0))
        {
          v51 = (unsigned __int16 *)((char *)v46 - *v46);
          if (*v51 >= 9u)
          {
            v52 = v51[4];
            if (v52)
            {
              v53 = (int *)((char *)v46 + v52 + *(unsigned int *)((char *)v46 + v52));
              if (*v53)
              {
                v54 = 0;
                v55 = v53 + 1;
                do
                {
                  v56 = *v55;
                  if (!sub_2462F7A94((uint64_t *)buf, (int *)((char *)v55 + v56)))
                    goto LABEL_90;
                  if (!sub_2462F7A0C((int *)((char *)v55 + v56), (uint64_t)buf, 4u))
                    goto LABEL_90;
                  v57 = v56 - *(int *)((char *)v55 + v56);
                  if (*(unsigned __int16 *)((char *)v55 + v57) >= 5u)
                  {
                    v58 = *(unsigned __int16 *)((char *)v55 + v57 + 4);
                    if (v58)
                    {
                      if (!sub_2462F7B4C((uint64_t)buf, (unsigned int *)((char *)v55 + v56 + v58 + *(unsigned int *)((char *)v55 + v56 + v58)), 1uLL, 0))goto LABEL_90;
                    }
                  }
                  --*(_DWORD *)&buf[16];
                  ++v54;
                  ++v55;
                }
                while (v54 < *v53);
              }
            }
          }
LABEL_83:
          if (sub_2462F7A0C(v46, (uint64_t)buf, 0xAu))
          {
            v59 = (unsigned __int16 *)((char *)v46 - *v46);
            if (*v59 >= 0xBu && (v60 = v59[5]) != 0)
              v61 = (unsigned int *)((char *)v46 + v60 + *(unsigned int *)((char *)v46 + v60));
            else
              v61 = 0;
            if (sub_2462F7BBC(buf, v61))
            {
              --*(_DWORD *)&buf[16];
              goto LABEL_93;
            }
          }
        }
      }
    }
  }
LABEL_90:
  v62 = qword_25441F958;
  if (os_log_type_enabled((os_log_t)qword_25441F958, OS_LOG_TYPE_ERROR))
  {
    LODWORD(v195) = 136315138;
    *(_QWORD *)((char *)&v195 + 4) = "verify_document";
    _os_log_error_impl(&dword_2462C4000, v62, OS_LOG_TYPE_ERROR, "%s Document failed verification", (uint8_t *)&v195, 0xCu);
  }
  v10 = 0;
LABEL_93:
  v63 = (unsigned __int16 *)((char *)v10 - *v10);
  if (*v63 < 5u)
  {
    v72 = qword_25441F958;
    if (!os_log_type_enabled((os_log_t)qword_25441F958, OS_LOG_TYPE_ERROR))
      goto LABEL_118;
    LODWORD(v73) = 0;
LABEL_104:
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "match_spans_of_document";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v73;
    _os_log_error_impl(&dword_2462C4000, v72, OS_LOG_TYPE_ERROR, "%s Skipping document with unsupported entity_type: %u", buf, 0x12u);
    goto LABEL_118;
  }
  if (!v63[2] || *((_BYTE *)v10 + v63[2]) != 1)
  {
    v72 = qword_25441F958;
    if (!os_log_type_enabled((os_log_t)qword_25441F958, OS_LOG_TYPE_ERROR))
      goto LABEL_118;
    v73 = v63[2];
    if (v63[2])
      LODWORD(v73) = *((unsigned __int8 *)v10 + v73);
    goto LABEL_104;
  }
  v64 = v171;
  sub_2462EA65C(v10, 0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v65;
  if (v65)
  {
    v182 = 0;
    v183 = &v182;
    v184 = 0x3812000000;
    v185 = sub_2462F7C30;
    v186 = nullsub_10;
    v187 = &unk_246344ADF;
    v68 = *v10;
    v69 = *(unsigned __int16 *)((char *)v10 - v68 + 6);
    if (*(_WORD *)((char *)v10 - v68 + 6))
    {
      v70 = *(unsigned int *)((char *)v10 + v69);
      v71 = (char *)v10 + v69 + v70;
    }
    else
    {
      v69 = 0;
      v71 = 0;
      v70 = *v10;
    }
    v166 = v64;
    v188 = v71 + 4;
    v74 = (uint64_t)&v10[*(int *)((char *)v10 + v69 + v70) + 1] + v69 + v70;
    v178 = 0;
    v179 = &v178;
    v180 = 0x2020000000;
    v181 = 0;
    v174 = 0;
    v175 = &v174;
    v176 = 0x2020000000;
    v177 = 1;
    v173 = 0;
    v172[0] = MEMORY[0x24BDAC760];
    v172[1] = 3321888768;
    v172[2] = sub_2462F7C40;
    v172[3] = &unk_251782CC8;
    v172[4] = &v174;
    v172[5] = &v182;
    v172[6] = &v178;
    v172[7] = v74;
    v172[8] = v170;
    v162 = v65;
    v75 = objc_msgSend_recursivelyEnumerateFieldsWithError_usingBlock_(v65, v66, (uint64_t)&v173, v172);
    v164 = v173;
    if (*((_BYTE *)v175 + 24))
      v76 = v75;
    else
      v76 = 0;
    if ((v76 & 1) != 0)
    {
      if (v183[6] == v74)
      {
        *(_QWORD *)buf = *v5;
        sub_2462F80CC(v167, buf);
        v85 = (void *)objc_opt_class();
        v88 = objc_msgSend_itemType(v85, v86, v87);
        switch(sub_2462DAC84(v88))
        {
          case 1u:
            v89 = v167[1];
            *(_WORD *)buf = 0;
            memset(&buf[8], 0, 32);
            v191 = 0;
            v192 = (skit::SpanMatchV3 *)v194;
            v193 = 0x400000000;
            v91 = *v170;
            v90 = v170[1];
            if (*v170 != v90)
            {
              v92 = (uint64_t *)(v89 - 32);
              do
              {
                skit::FieldSpanMatcherV3::match();
                skit::to_u16string();
                skit::FieldSpanMatcherV3::finalize();
                sub_2462F8894(v92, (uint64_t)buf);
                v91 += 72;
              }
              while (v91 != v90);
            }
            sub_2462F8C08((char **)&v192);
            if ((buf[31] & 0x80000000) != 0)
              operator delete(*(void **)&buf[8]);
            break;
          case 2u:
            v127 = *v170;
            v128 = v170[1];
            if (*v170 != v128)
            {
              v129 = v167[1];
              do
              {
                *(_WORD *)buf = 0;
                memset(&buf[8], 0, 32);
                v191 = 0;
                v192 = (skit::SpanMatchV3 *)v194;
                v193 = 0x400000000;
                skit::FieldSpanMatcherV3::match();
                v130 = v193;
                if ((_DWORD)v193)
                {
                  skit::to_u16string();
                  skit::FieldSpanMatcherV3::finalize();
                  sub_2462F8894((uint64_t *)(v129 - 32), (uint64_t)buf);
                }
                else
                {
                  v131 = qword_25441F958;
                  if (os_log_type_enabled((os_log_t)qword_25441F958, OS_LOG_TYPE_DEBUG))
                  {
                    LODWORD(v195) = 136315138;
                    *(_QWORD *)((char *)&v195 + 4) = "match_all_fields";
                    _os_log_debug_impl(&dword_2462C4000, v131, OS_LOG_TYPE_DEBUG, "%s empty span matches. Removing the whole item", (uint8_t *)&v195, 0xCu);
                  }
                  v133 = *(_QWORD *)(v129 - 24);
                  for (i = *(_QWORD *)(v129 - 16); i != v133; sub_2462D3960(i))
                    i -= 568;
                  *(_QWORD *)(v129 - 16) = v133;
                }
                sub_2462F8C08((char **)&v192);
                if ((buf[31] & 0x80000000) != 0)
                  operator delete(*(void **)&buf[8]);
                if (!v130)
                  break;
                v127 += 72;
              }
              while (v127 != v128);
            }
            break;
          case 3u:
            v93 = *v170;
            v159 = v170[1];
            if (*v170 != v159)
            {
              v94 = v167[1];
              do
              {
                *(_WORD *)buf = 0;
                memset(&buf[8], 0, 32);
                v191 = 0;
                v192 = (skit::SpanMatchV3 *)v194;
                v193 = 0x400000000;
                skit::FieldSpanMatcherV3::match();
                skit::to_u16string();
                skit::FieldSpanMatcherV3::finalize();
                v160 = v93;
                if ((_DWORD)v193)
                {
                  v95 = v192;
                  v96 = (skit::SpanMatchV3 *)((char *)v192 + 64 * (unint64_t)v193);
                  v97 = 0x193D4BB7E327A977 * ((uint64_t)(*(_QWORD *)(v94 - 16) - *(_QWORD *)(v94 - 24)) >> 3);
                  do
                  {
                    if (v97)
                    {
                      v98 = 0;
                      v99 = 0;
                      while (1)
                      {
                        v100 = *(_DWORD *)skit::SpanMatchV3::span(v95);
                        if (v100 == *(_DWORD *)skit::SpanMatchV3::span((skit::SpanMatchV3 *)(*(_QWORD *)(v94 - 24)
                                                                                            + 568 * v98
                                                                                            + 488)))
                        {
                          v101 = *(_DWORD *)(skit::SpanMatchV3::span(v95) + 4);
                          if (v101 == *(_DWORD *)(skit::SpanMatchV3::span((skit::SpanMatchV3 *)(*(_QWORD *)(v94 - 24)
                                                                                               + 568 * v98
                                                                                               + 488))
                                                 + 4))
                            break;
                        }
                        v102 = (_DWORD *)skit::SpanMatchV3::span(v95);
                        v103 = (_DWORD *)skit::SpanMatchV3::span((skit::SpanMatchV3 *)(*(_QWORD *)(v94 - 24)
                                                                                     + 568 * v98
                                                                                     + 488));
                        if (*v102 >= *v103 && v102[1] <= v103[1])
                          goto LABEL_159;
                        v104 = (_DWORD *)skit::SpanMatchV3::span((skit::SpanMatchV3 *)(*(_QWORD *)(v94 - 24)
                                                                                     + 568 * v98
                                                                                     + 488));
                        v105 = (_DWORD *)skit::SpanMatchV3::span(v95);
                        if (*v104 >= *v105 && v104[1] <= v105[1])
                          goto LABEL_141;
                        v98 = ++v99;
                        if (v97 <= v99)
                          goto LABEL_157;
                      }
                      v106 = skit::SpanMatchV3::edit_dist(v95);
                      if (v106 >= skit::SpanMatchV3::edit_dist((skit::SpanMatchV3 *)(*(_QWORD *)(v94 - 24)
                                                                                                  + 568 * v98
                                                                                                  + 488)))
                      {
                        skit::SpanMatchV3::score(v95);
                        v108 = v107;
                        skit::SpanMatchV3::score((skit::SpanMatchV3 *)(*(_QWORD *)(v94 - 24) + 568 * v98 + 488));
                        if (v108 <= v109)
                          goto LABEL_159;
                      }
LABEL_141:
                      v110 = *(_QWORD *)(v94 - 16);
                      v111 = *(_QWORD *)(v94 - 24) + 568 * v99;
                      v112 = v111 + 568;
                      if (v111 + 568 != v110)
                      {
                        do
                        {
                          v113 = *(void **)v111;
                          v114 = *(unsigned int *)(v111 + 8);
                          if ((_DWORD)v114)
                          {
                            v115 = 112 * v114;
                            do
                            {
                              v113 = (void *)(sub_2462D39FC((uint64_t)v113) + 112);
                              v115 -= 112;
                            }
                            while (v115);
                            v113 = *(void **)v111;
                          }
                          if (v113 != (void *)(v111 + 16))
                            free(v113);
                          sub_2462FA220(v111, v112);
                          v116 = (void **)(v111 + 464);
                          if (*(char *)(v111 + 487) < 0)
                            operator delete(*v116);
                          *(_OWORD *)v116 = *(_OWORD *)(v112 + 464);
                          *(_QWORD *)(v111 + 480) = *(_QWORD *)(v112 + 480);
                          *(_BYTE *)(v112 + 487) = 0;
                          *(_WORD *)(v112 + 464) = 0;
                          *(_OWORD *)(v111 + 488) = *(_OWORD *)(v112 + 488);
                          *(_OWORD *)(v111 + 500) = *(_OWORD *)(v112 + 500);
                          v117 = *(void **)(v111 + 520);
                          if (v117 != (void *)(v111 + 536))
                            free(v117);
                          sub_2462F8B64(v111 + 520, v112 + 520);
                          *(_DWORD *)(v111 + 544) = *(_DWORD *)(v112 + 544);
                          *(_QWORD *)(v111 + 552) = *(_QWORD *)(v112 + 552);
                          *(_DWORD *)(v111 + 560) = *(_DWORD *)(v112 + 560);
                          v112 += 568;
                          v111 += 568;
                        }
                        while (v112 != v110);
                        v112 = *(_QWORD *)(v94 - 16);
                      }
                      while (v112 != v111)
                      {
                        v112 -= 568;
                        sub_2462D3960(v112);
                      }
                      *(_QWORD *)(v94 - 16) = v111;
                      --v97;
                    }
LABEL_157:
                    sub_2462FA090((uint64_t)&v195, (__int128 *)v95);
                    sub_2462FA37C((uint64_t *)(v94 - 32));
                    if (v197 != &v198)
                      free(v197);
LABEL_159:
                    v95 = (skit::SpanMatchV3 *)((char *)v95 + 64);
                  }
                  while (v95 != v96);
                }
                sub_2462F8C08((char **)&v192);
                if ((buf[31] & 0x80000000) != 0)
                  operator delete(*(void **)&buf[8]);
                v93 = v160 + 72;
              }
              while (v160 + 72 != v159);
            }
            break;
          case 4u:
            v118 = v167[1];
            v119 = v166;
            *(_QWORD *)&v195 = &v196;
            *((_QWORD *)&v195 + 1) = 0x800000000;
            v120 = *v170;
            v121 = v170[1];
            v122 = 954437177 * ((unint64_t)(v121 - *v170) >> 3);
            v169 = v119;
            if (v122 >= 9)
            {
              sub_2462F8964((void **)&v195, v122);
              v120 = *v170;
              v121 = v170[1];
            }
            for (; v120 != v121; v120 += 72)
            {
              if (*(_QWORD *)(v120 + 32) != *(_QWORD *)(v120 + 24))
              {
                v123 = DWORD2(v195);
                if (DWORD2(v195) == HIDWORD(v195))
                {
                  sub_2462F8964((void **)&v195, DWORD2(v195) + (DWORD2(v195) >> 1) + 1);
                  v123 = DWORD2(v195);
                }
                v124 = v195 + 320 * v123;
                *(_OWORD *)(v124 + 288) = 0u;
                *(_OWORD *)(v124 + 304) = 0u;
                *(_OWORD *)(v124 + 256) = 0u;
                *(_OWORD *)(v124 + 272) = 0u;
                *(_OWORD *)(v124 + 224) = 0u;
                *(_OWORD *)(v124 + 240) = 0u;
                *(_OWORD *)(v124 + 192) = 0u;
                *(_OWORD *)(v124 + 208) = 0u;
                *(_OWORD *)(v124 + 160) = 0u;
                *(_OWORD *)(v124 + 176) = 0u;
                *(_OWORD *)(v124 + 128) = 0u;
                *(_OWORD *)(v124 + 144) = 0u;
                *(_OWORD *)(v124 + 96) = 0u;
                *(_OWORD *)(v124 + 112) = 0u;
                *(_OWORD *)(v124 + 80) = 0u;
                *(_OWORD *)(v124 + 32) = 0u;
                *(_OWORD *)(v124 + 48) = 0u;
                *(_OWORD *)v124 = 0u;
                *(_OWORD *)(v124 + 16) = 0u;
                *(_OWORD *)(v124 + 64) = 0u;
                *(_QWORD *)(v124 + 48) = v124 + 64;
                *(_QWORD *)(v124 + 56) = 0x400000000;
                ++DWORD2(v195);
                sub_2462D5AD4(*v2, (unsigned __int16 **)(v120 + 24), 1, buf);
                sub_2462D6374((uint64_t)buf, (__int128 ***)(v120 + 48), &v199);
                v125 = v199;
                if (v199 != (_QWORD *)v200)
                {
                  while (*v125 != 1536)
                  {
                    if (++v125 == (_WORD *)v200)
                    {
                      v125 = (_WORD *)v200;
                      break;
                    }
                  }
                }
                if (v125 == (_WORD *)v200)
                {
                  v126 = *v2;
                  if ((*(_BYTE *)(*(_QWORD *)(*v2 + 8) + 32) & 8) != 0 && (*(_WORD *)(v126 + 188) & 2) != 0)
                    sub_2462D68BC(v126, (size_t)buf, (__int128 **)(v120 + 24));
                }
                skit::FieldSpanMatcherV3::match();
                skit::to_u16string();
                if (v199)
                {
                  v200 = (uint64_t)v199;
                  operator delete(v199);
                }
                sub_2462D909C((uint64_t *)buf);
              }
            }
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = 0;
            *(_QWORD *)&buf[16] = &buf[32];
            *(_QWORD *)&buf[24] = 0x800000000;
            v199 = v201;
            v200 = 0x800000000;
            v135 = DWORD2(v195);
            if (DWORD2(v195) >= 9)
            {
              sub_2462F8D08((uint64_t)&v199, DWORD2(v195));
              v135 = DWORD2(v195);
            }
            if (v135)
            {
              v136 = (unsigned __int16 *)v195;
              v137 = 320 * v135;
              do
              {
                if (*((_DWORD *)v136 + 14) && sub_2462DB248(*v136))
                {
                  v189 = v136;
                  sub_2462F8CB0((size_t)&v199, &v189);
                }
                v136 += 160;
                v137 -= 320;
              }
              while (v137);
            }
            v138 = (unsigned __int16 **)v199;
            v139 = v200;
            if (v200 < 0x81)
            {
              v140 = 0;
              v142 = 0;
            }
            else
            {
              v140 = (unsigned __int16 **)sub_2462F8DB0(v200);
              v142 = v141;
            }
            sub_2462F8E10(v138, &v138[v139], v139, v140, v142);
            if (v140)
              operator delete(v140);
            if (DWORD2(v195))
            {
              v143 = (unsigned __int16 *)v195;
              v144 = 320 * DWORD2(v195);
              do
              {
                if (!*((_DWORD *)v143 + 14) && sub_2462DB248(*v143))
                {
                  v189 = v143;
                  sub_2462F8CB0((size_t)&v199, &v189);
                }
                v143 += 160;
                v144 -= 320;
              }
              while (v144);
            }
            if ((_DWORD)v200)
            {
              v145 = (char *)v199;
              v146 = 8 * v200;
              do
              {
                skit::FieldSpanMatcherV3::merge_field();
                v145 += 8;
                v146 -= 8;
              }
              while (v146);
            }
            skit::FieldSpanMatcherV3::finalize();
            if (v199 != v201)
              free(v199);
            sub_2462F8708(v118 - 32, (uint64_t)buf);
            if (DWORD2(v195))
            {
              v147 = (unsigned __int16 *)v195;
              v148 = 320 * DWORD2(v195);
              do
              {
                if (*((_DWORD *)v147 + 14) && !sub_2462DB248(*v147))
                {
                  skit::FieldSpanMatcherV3::finalize();
                  sub_2462F8894((uint64_t *)(v118 - 32), (uint64_t)v147);
                }
                v147 += 160;
                v148 -= 320;
              }
              while (v148);
            }
            sub_2462FA570((char **)&buf[16]);
            sub_2462FA5F8((char **)&v195);

            break;
          default:
            v134 = (id)qword_25441F958;
            if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
            {
              v149 = (void *)MEMORY[0x24BE5B238];
              v150 = (void *)objc_opt_class();
              v153 = objc_msgSend_itemType(v150, v151, v152);
              objc_msgSend_descriptionForTypeIdentifier_(v149, v154, v153);
              v155 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = "match_spans_of_cascade_entity";
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v155;
              _os_log_error_impl(&dword_2462C4000, v134, OS_LOG_TYPE_ERROR, "%s Document contains item of unsupported type: %@", buf, 0x16u);

            }
            break;
        }
      }
      else
      {
        v77 = (void *)qword_25441F958;
        if (os_log_type_enabled((os_log_t)qword_25441F958, OS_LOG_TYPE_ERROR))
        {
          v78 = *((_DWORD *)v179 + 6);
          v79 = (char *)v10 - *v10;
          v80 = v77;
          v81 = *(int *)((char *)v10
                       + *((unsigned __int16 *)v79 + 3)
                       + *(unsigned int *)((char *)v10 + *((unsigned __int16 *)v79 + 3)));
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = "match_spans_of_cascade_entity";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v78;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v81;
          _os_log_error_impl(&dword_2462C4000, v80, OS_LOG_TYPE_ERROR, "%s Invalid document - enumerated %u content fields but expected: %u", buf, 0x18u);

        }
      }
    }
    else
    {
      v82 = qword_25441F958;
      if (os_log_type_enabled((os_log_t)qword_25441F958, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "match_spans_of_cascade_entity";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v164;
        _os_log_error_impl(&dword_2462C4000, v82, OS_LOG_TYPE_ERROR, "%s Failed to enumerate fields of document: %@", buf, 0x16u);
      }
    }

    v64 = v166;
    _Block_object_dispose(&v174, 8);
    _Block_object_dispose(&v178, 8);
    _Block_object_dispose(&v182, 8);
    v67 = v162;
  }

  sub_2462FA660((uint64_t)v170, *v170);
  v83 = v167[1];
  if (*(_QWORD *)(v83 - 24) == *(_QWORD *)(v83 - 16))
  {
    v84 = v83 - 32;
    *(_QWORD *)buf = v83 - 24;
    sub_2462D38F0((void ***)buf);
    v167[1] = v84;
  }
LABEL_118:

}

void sub_2462F65BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  sub_2462FA5F8((char **)&STACK[0x12A0]);

  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a41, 8);

  _Unwind_Resume(a1);
}

void sub_2462F676C(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  std::__shared_weak_count *v6;
  uint64_t v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  char v10;
  NSObject *v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  unint64_t v17;
  __int128 *v18;
  __int128 *v19;
  uint64_t v20;
  unint64_t v21;
  __int128 *v22;
  __int128 *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t token_stream_begin;
  uint64_t token_stream_end;
  unint64_t v29;
  unint64_t v30;
  __int128 *alias_matches_begin;
  __int128 *alias_matches_end;
  _BYTE *v33;
  _QWORD *v34;
  unint64_t v35;
  unint64_t v36;
  uint8x8_t v37;
  _QWORD *v38;
  _QWORD *i;
  unint64_t v40;
  _QWORD *v41;
  float v42;
  _BOOL8 v43;
  unint64_t v44;
  unint64_t v45;
  int8x8_t prime;
  void *v47;
  void *v48;
  uint64_t v49;
  _QWORD **v50;
  unint64_t v51;
  uint8x8_t v52;
  unint64_t v53;
  uint8x8_t v54;
  uint64_t v55;
  _QWORD *j;
  unint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  unint64_t v60;
  void *v61;
  NSObject *v62;
  uint64_t v63;
  NSObject *v64;
  std::__shared_weak_count *v65;
  unint64_t *v66;
  unint64_t v67;
  std::__shared_weak_count *v68;
  unint64_t *v69;
  unint64_t v70;
  uint64_t v71;
  unint64_t v72;
  id v73;
  TokenStream v74;
  char v75;
  uint64_t v76;
  std::__shared_weak_count *v77;
  void *v78[3];
  void *__p[2];
  uint64_t v80;
  char v81[8];
  std::__shared_weak_count *v82;
  __int128 *v83;
  int v84[2];
  uint64_t v85;
  __int128 *v86;
  __int128 *v87;
  uint64_t v88;
  __int128 *v89;
  __int128 *v90;
  uint64_t v91;
  void *v92;
  _BYTE *v93;
  uint64_t v94;
  __int128 v95;
  __int128 v96;
  float v97;
  uint64_t v98;
  std::__shared_weak_count *v99;
  _QWORD v100[3];
  uint8_t v101[4];
  const char *v102;
  void *v103;
  int v104;
  uint64_t v105;
  int v106;
  int v107;
  _BYTE buf[96];
  _BYTE v109[24];
  uint64_t v110;
  uint64_t *v111;
  uint64_t v112;

  v112 = *MEMORY[0x24BDAC8D0];
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  memset(v100, 0, sizeof(v100));
  v7 = *(_QWORD *)(a2 + 168);
  v6 = *(std::__shared_weak_count **)(a2 + 176);
  v98 = v7;
  v99 = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }
  v95 = 0u;
  v96 = 0u;
  v97 = 1.0;
  v92 = 0;
  v93 = 0;
  v94 = 0;
  v89 = 0;
  v90 = 0;
  v91 = 0;
  sub_2462E0118((char *)&v89, *(__int128 **)a2, *(__int128 **)(a2 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 4));
  v86 = 0;
  v87 = 0;
  v88 = 0;
  sub_2462E0118((char *)&v86, *(__int128 **)(a2 + 24), *(__int128 **)(a2 + 32), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a2 + 32) - *(_QWORD *)(a2 + 24)) >> 4));
  v73 = *(id *)(a2 + 48);
  v83 = 0;
  *(_QWORD *)v84 = 0;
  v85 = 0;
  if ((skit::IndexReader::is_open((skit::IndexReader *)(a1 + 2)) & 1) != 0)
  {
    v10 = sub_2462D4768(v7, &v89, 0, 0);
    sub_2462D4768(v7, &v86, 0, 0);
    if (*(char *)(a2 + 79) < 0)
    {
      sub_2462D7540(__p, *(void **)(a2 + 56), *(_QWORD *)(a2 + 64));
    }
    else
    {
      *(_OWORD *)__p = *(_OWORD *)(a2 + 56);
      v80 = *(_QWORD *)(a2 + 72);
    }
    memset(v78, 0, sizeof(v78));
    sub_2462E0118((char *)v78, v89, v90, 0xAAAAAAAAAAAAAAABLL * (v90 - v89));
    skit::FieldSpanMatcherV3::FieldSpanMatcherV3();
    *(_QWORD *)buf = v78;
    sub_2462D3760((void ***)buf);
    if (SHIBYTE(v80) < 0)
      operator delete(__p[0]);
    sub_2462D5AD4(v7, (unsigned __int16 **)&v89, 0, buf);
    if ((*(_WORD *)(v7 + 188) & 4) != 0)
      sub_2462D6598(v7, (uint64_t)buf, v73);
    if ((*(_BYTE *)(*(_QWORD *)(v7 + 8) + 32) & 8) != 0 && (*(_WORD *)(v7 + 188) & 2) != 0)
    {
      if ((v10 & 1) != 0)
        sub_2462D3D48((_QWORD *)v7);
      sub_2462D68BC(v7, (size_t)buf, &v89);
    }
    v12 = (std::__shared_weak_count *)a1[5];
    v76 = a1[4];
    v77 = v12;
    if (v12)
    {
      v13 = (unint64_t *)&v12->__shared_owners_;
      do
        v14 = __ldxr(v13);
      while (__stxr(v14 + 1, v13));
    }
    *(_QWORD *)v109 = &v109[16];
    *(_QWORD *)&v109[8] = 0x800000000;
    v15 = skit::FieldSpanMatcherV3::alias_span_matcher();
    if (*(_BYTE **)v109 != &v109[16])
      free(*(void **)v109);
    if (!v77)
      goto LABEL_28;
    v16 = &v77->__shared_owners_;
    do
      v17 = __ldaxr((unint64_t *)v16);
    while (__stlxr(v17 - 1, (unint64_t *)v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v77->__on_zero_shared)(v77);
      std::__shared_weak_count::__release_weak(v77);
      if ((v15 & 0x80000000) == 0)
        goto LABEL_29;
    }
    else
    {
LABEL_28:
      if ((v15 & 0x80000000) == 0)
      {
LABEL_29:
        v18 = v89;
        v19 = v90;
        v20 = 0xAAAAAAAAAAAAAAABLL * (v90 - v89);
        v21 = v20 - 0x5555555555555555 * (v87 - v86);
        v22 = v83;
        if (0xAAAAAAAAAAAAAAABLL * ((v85 - (uint64_t)v83) >> 4) < v21)
        {
          if (v21 >= 0x555555555555556)
            sub_2462D357C();
          v23 = *(__int128 **)v84;
          v111 = &v85;
          *(_QWORD *)v109 = sub_2462D7644((uint64_t)&v85, v21);
          *(_QWORD *)&v109[8] = *(_QWORD *)v109 + (char *)v23 - (char *)v22;
          *(_QWORD *)&v109[16] = *(_QWORD *)&v109[8];
          v110 = *(_QWORD *)v109 + 48 * v24;
          sub_2462D75D0((uint64_t *)&v83, v109);
          sub_2462D77AC((uint64_t)v109);
          v18 = v89;
          v19 = v90;
          v20 = 0xAAAAAAAAAAAAAAABLL * (v90 - v89);
        }
        sub_2462E6E3C((uint64_t *)&v83, *(__int128 **)v84, v18, v19, v20);
        sub_2462E6E3C((uint64_t *)&v83, *(__int128 **)v84, v86, v87, 0xAAAAAAAAAAAAAAABLL * (v87 - v86));
        sub_2462F4BE8((uint64_t)v109, a2);
        v25 = *(uint64_t **)&v109[16];
        if (*(_QWORD *)&v109[16])
        {
          v26 = v98;
          v71 = v98;
          do
          {
            token_stream_begin = skit::FieldSpanMatcherV3::query_token_stream_begin((skit::FieldSpanMatcherV3 *)v81);
            token_stream_end = skit::FieldSpanMatcherV3::query_token_stream_end((skit::FieldSpanMatcherV3 *)v81);
            sub_2462D4560(v26, token_stream_begin, token_stream_end, *((unsigned __int16 *)v25 + 8));
            sub_2462D4560(v26, (uint64_t)v83, *(uint64_t *)v84, *((unsigned __int16 *)v25 + 8));
            v29 = v15 & 0xFFFFFFFF00000000 | *(unsigned int *)(v26 + 184);
            sub_2462DB324(*((unsigned __int16 *)v25 + 8), *(_QWORD *)(v26 + 176), *(_WORD *)(v26 + 188), (uint64_t)&v103);
            skit::FieldSpanMatcherV3::alias_filters();
            if (v103 != (char *)&v105 + 4)
              free(v103);
            memset(&v74, 0, sizeof(v74));
            sub_2462E0118((char *)&v74, v83, *(__int128 **)v84, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)v84 - (_QWORD)v83) >> 4));
            v30 = *((unsigned __int16 *)v25 + 8);
            alias_matches_begin = (__int128 *)skit::FieldSpanMatcherV3::query_alias_matches_begin((skit::FieldSpanMatcherV3 *)v81);
            alias_matches_end = (__int128 *)skit::FieldSpanMatcherV3::query_alias_matches_end((skit::FieldSpanMatcherV3 *)v81);
            sub_2462D4238(v26, &v74, v30, alias_matches_begin, alias_matches_end);
            v103 = &v74;
            sub_2462D3760((void ***)&v103);
            v104 = 0;
            v103 = 0;
            v107 = 1;
            v105 = 0x100000014;
            v106 = 872415232;
            if (*((_WORD *)v25 + 8) == 5)
              HIDWORD(v103) = 3;
            v72 = v29;
            skit::IndexReader::search();
            sub_2462F4FCC(a3, 0xCCCCCCCCCCCCCCCDLL * ((v93 - (_BYTE *)v92) >> 3) + ((a3[1] - *a3) >> 5));
            v34 = v92;
            v33 = v93;
            if (v92 == v93)
              goto LABEL_125;
            do
            {
              if (v34[3])
              {
                v35 = v34[1];
                v36 = *((_QWORD *)&v95 + 1);
                if (*((_QWORD *)&v95 + 1))
                {
                  v37 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v95 + 8));
                  v37.i16[0] = vaddlv_u8(v37);
                  if (v37.u32[0] > 1uLL)
                  {
                    v30 = v34[1];
                    if (*((_QWORD *)&v95 + 1) <= v35)
                      v30 = v35 % *((_QWORD *)&v95 + 1);
                  }
                  else
                  {
                    v30 = (*((_QWORD *)&v95 + 1) - 1) & v35;
                  }
                  v38 = *(_QWORD **)(v95 + 8 * v30);
                  if (v38)
                  {
                    for (i = (_QWORD *)*v38; i; i = (_QWORD *)*i)
                    {
                      v40 = i[1];
                      if (v40 == v35)
                      {
                        if (i[2] == v35)
                          goto LABEL_114;
                      }
                      else
                      {
                        if (v37.u32[0] > 1uLL)
                        {
                          if (v40 >= *((_QWORD *)&v95 + 1))
                            v40 %= *((_QWORD *)&v95 + 1);
                        }
                        else
                        {
                          v40 &= *((_QWORD *)&v95 + 1) - 1;
                        }
                        if (v40 != v30)
                          break;
                      }
                    }
                  }
                }
                v41 = operator new(0x18uLL);
                *v41 = 0;
                v41[1] = v35;
                v41[2] = v35;
                v42 = (float)(unint64_t)(*((_QWORD *)&v96 + 1) + 1);
                if (!v36 || (float)(v97 * (float)v36) < v42)
                {
                  v43 = (v36 & (v36 - 1)) != 0;
                  if (v36 < 3)
                    v43 = 1;
                  v44 = v43 | (2 * v36);
                  v45 = vcvtps_u32_f32(v42 / v97);
                  if (v44 <= v45)
                    prime = (int8x8_t)v45;
                  else
                    prime = (int8x8_t)v44;
                  if (*(_QWORD *)&prime == 1)
                  {
                    prime = (int8x8_t)2;
                  }
                  else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
                  {
                    prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
                    v36 = *((_QWORD *)&v95 + 1);
                  }
                  if (*(_QWORD *)&prime <= v36)
                  {
                    if (*(_QWORD *)&prime < v36)
                    {
                      v53 = vcvtps_u32_f32((float)*((unint64_t *)&v96 + 1) / v97);
                      if (v36 < 3
                        || (v54 = (uint8x8_t)vcnt_s8((int8x8_t)v36), v54.i16[0] = vaddlv_u8(v54), v54.u32[0] > 1uLL))
                      {
                        v53 = std::__next_prime(v53);
                      }
                      else
                      {
                        v55 = 1 << -(char)__clz(v53 - 1);
                        if (v53 >= 2)
                          v53 = v55;
                      }
                      if (*(_QWORD *)&prime <= v53)
                        prime = (int8x8_t)v53;
                      if (*(_QWORD *)&prime >= v36)
                      {
                        v36 = *((_QWORD *)&v95 + 1);
                      }
                      else
                      {
                        if (prime)
                          goto LABEL_70;
                        v61 = (void *)v95;
                        *(_QWORD *)&v95 = 0;
                        if (v61)
                          operator delete(v61);
                        v36 = 0;
                        *((_QWORD *)&v95 + 1) = 0;
                      }
                    }
                  }
                  else
                  {
LABEL_70:
                    if (*(_QWORD *)&prime >> 61)
                      sub_2462D3488();
                    v47 = operator new(8 * *(_QWORD *)&prime);
                    v48 = (void *)v95;
                    *(_QWORD *)&v95 = v47;
                    if (v48)
                      operator delete(v48);
                    v49 = 0;
                    *((int8x8_t *)&v95 + 1) = prime;
                    do
                      *(_QWORD *)(v95 + 8 * v49++) = 0;
                    while (*(_QWORD *)&prime != v49);
                    v50 = (_QWORD **)v96;
                    if ((_QWORD)v96)
                    {
                      v51 = *(_QWORD *)(v96 + 8);
                      v52 = (uint8x8_t)vcnt_s8(prime);
                      v52.i16[0] = vaddlv_u8(v52);
                      if (v52.u32[0] > 1uLL)
                      {
                        if (v51 >= *(_QWORD *)&prime)
                          v51 %= *(_QWORD *)&prime;
                      }
                      else
                      {
                        v51 &= *(_QWORD *)&prime - 1;
                      }
                      *(_QWORD *)(v95 + 8 * v51) = &v96;
                      for (j = *v50; j; v51 = v57)
                      {
                        v57 = j[1];
                        if (v52.u32[0] > 1uLL)
                        {
                          if (v57 >= *(_QWORD *)&prime)
                            v57 %= *(_QWORD *)&prime;
                        }
                        else
                        {
                          v57 &= *(_QWORD *)&prime - 1;
                        }
                        if (v57 != v51)
                        {
                          if (!*(_QWORD *)(v95 + 8 * v57))
                          {
                            *(_QWORD *)(v95 + 8 * v57) = v50;
                            goto LABEL_95;
                          }
                          *v50 = (_QWORD *)*j;
                          *j = **(_QWORD **)(v95 + 8 * v57);
                          **(_QWORD **)(v95 + 8 * v57) = j;
                          j = v50;
                        }
                        v57 = v51;
LABEL_95:
                        v50 = (_QWORD **)j;
                        j = (_QWORD *)*j;
                      }
                    }
                    v36 = (unint64_t)prime;
                  }
                  if ((v36 & (v36 - 1)) != 0)
                  {
                    if (v36 <= v35)
                      v30 = v35 % v36;
                    else
                      v30 = v35;
                  }
                  else
                  {
                    v30 = (v36 - 1) & v35;
                  }
                }
                v58 = v95;
                v59 = *(_QWORD **)(v95 + 8 * v30);
                if (v59)
                {
                  *v41 = *v59;
                  goto LABEL_112;
                }
                *v41 = v96;
                *(_QWORD *)&v96 = v41;
                *(_QWORD *)(v58 + 8 * v30) = &v96;
                if (*v41)
                {
                  v60 = *(_QWORD *)(*v41 + 8);
                  if ((v36 & (v36 - 1)) != 0)
                  {
                    if (v60 >= v36)
                      v60 %= v36;
                  }
                  else
                  {
                    v60 &= v36 - 1;
                  }
                  v59 = (_QWORD *)(v95 + 8 * v60);
LABEL_112:
                  *v59 = v41;
                }
                ++*((_QWORD *)&v96 + 1);
                sub_2462F504C();
                goto LABEL_114;
              }
              v30 = qword_25441F958;
              if (os_log_type_enabled((os_log_t)qword_25441F958, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v101 = 136315138;
                v102 = "match_spans";
                _os_log_error_impl(&dword_2462C4000, (os_log_t)v30, OS_LOG_TYPE_ERROR, "%s Document missing", v101, 0xCu);
              }
LABEL_114:
              v34 += 5;
            }
            while (v34 != (_QWORD *)v33);
            v34 = v92;
LABEL_125:
            v93 = v34;
            v103 = &v75;
            sub_2462D3760((void ***)&v103);
            v25 = (uint64_t *)*v25;
            v26 = v71;
            v15 = v72;
          }
          while (v25);
        }
        sub_2462DBA68((uint64_t)v109);
        v62 = qword_25441F958;
        if (os_log_type_enabled((os_log_t)qword_25441F958, OS_LOG_TYPE_DEBUG))
        {
          v63 = (a3[1] - *a3) >> 5;
          *(_DWORD *)v109 = 136315394;
          *(_QWORD *)&v109[4] = "match_spans";
          *(_WORD *)&v109[12] = 2048;
          *(_QWORD *)&v109[14] = v63;
          _os_log_debug_impl(&dword_2462C4000, v62, OS_LOG_TYPE_DEBUG, "%s Skit search produced %lu document hit(s)", v109, 0x16u);
        }
        goto LABEL_131;
      }
    }
    v64 = qword_25441F958;
    if (os_log_type_enabled((os_log_t)qword_25441F958, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v109 = 136315138;
      *(_QWORD *)&v109[4] = "match_spans";
      _os_log_error_impl(&dword_2462C4000, v64, OS_LOG_TYPE_ERROR, "%s ERROR: alias span matcher cannot be set up", v109, 0xCu);
    }
LABEL_131:
    sub_2462D909C((uint64_t *)buf);
    v65 = v82;
    if (v82)
    {
      v66 = (unint64_t *)&v82->__shared_owners_;
      do
        v67 = __ldaxr(v66);
      while (__stlxr(v67 - 1, v66));
      if (!v67)
      {
        ((void (*)(std::__shared_weak_count *))v65->__on_zero_shared)(v65);
        std::__shared_weak_count::__release_weak(v65);
      }
    }
    goto LABEL_136;
  }
  v11 = qword_25441F958;
  if (os_log_type_enabled((os_log_t)qword_25441F958, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "match_spans";
    _os_log_error_impl(&dword_2462C4000, v11, OS_LOG_TYPE_ERROR, "%s ERROR: index reader is not open", buf, 0xCu);
  }
LABEL_136:
  *(_QWORD *)buf = &v83;
  sub_2462D3760((void ***)buf);

  *(_QWORD *)buf = &v86;
  sub_2462D3760((void ***)buf);
  *(_QWORD *)buf = &v89;
  sub_2462D3760((void ***)buf);
  if (v92)
  {
    v93 = v92;
    operator delete(v92);
  }
  sub_2462DBA68((uint64_t)&v95);
  v68 = v99;
  if (v99)
  {
    v69 = (unint64_t *)&v99->__shared_owners_;
    do
      v70 = __ldaxr(v69);
    while (__stlxr(v70 - 1, v69));
    if (!v70)
    {
      ((void (*)(std::__shared_weak_count *))v68->__on_zero_shared)(v68);
      std::__shared_weak_count::__release_weak(v68);
    }
  }
  *(_QWORD *)buf = v100;
  sub_2462FA6D0((void ***)buf);
}

void sub_2462F7360(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, char a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,uint64_t a30,int a31,__int16 a32,char a33,char a34,uint64_t a35,char a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,void *__p,uint64_t a48,uint64_t a49,char a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,void *a62)
{
  uint64_t v62;
  uint64_t v63;

  sub_2462D77AC(v63 - 160);
  sub_2462D909C((uint64_t *)(v63 - 256));
  sub_2462D3524((uint64_t)&a36);
  *(_QWORD *)(v63 - 256) = &a38;
  sub_2462D3760((void ***)(v63 - 256));

  *(_QWORD *)(v63 - 256) = &a41;
  sub_2462D3760((void ***)(v63 - 256));
  *(_QWORD *)(v63 - 256) = &a44;
  sub_2462D3760((void ***)(v63 - 256));
  if (__p)
  {
    a48 = (uint64_t)__p;
    operator delete(__p);
  }
  sub_2462DBA68((uint64_t)&a50);
  sub_2462D3524((uint64_t)&a55);
  *(_QWORD *)(v63 - 256) = &a57;
  sub_2462FA6D0((void ***)(v63 - 256));
  *(_QWORD *)(v63 - 256) = v62;
  sub_2462D3878((void ***)(v63 - 256));
  _Unwind_Resume(a1);
}

uint64_t *sub_2462F7500(uint64_t a1, unint64_t a2, unsigned __int16 *a3)
{
  unint64_t v6;
  float v7;
  float v8;
  _BOOL8 v9;
  unint64_t v10;
  unint64_t v11;
  int8x8_t prime;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t **v16;
  unint64_t v17;
  uint8x8_t v18;
  unint64_t v19;
  uint8x8_t v20;
  uint64_t v21;
  uint64_t *i;
  unint64_t v23;
  uint64_t *v24;
  _QWORD *v25;
  uint8x8_t v26;
  unint64_t v27;
  uint64_t *v28;
  int v29;
  uint64_t *result;
  unint64_t v31;
  unint64_t v32;
  _BOOL4 v33;
  int v34;
  void *v35;

  v6 = *(_QWORD *)(a1 + 8);
  v7 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v8 = *(float *)(a1 + 32);
  if (!v6 || (float)(v8 * (float)v6) < v7)
  {
    v9 = 1;
    if (v6 >= 3)
      v9 = (v6 & (v6 - 1)) != 0;
    v10 = v9 | (2 * v6);
    v11 = vcvtps_u32_f32(v7 / v8);
    if (v10 <= v11)
      prime = (int8x8_t)v11;
    else
      prime = (int8x8_t)v10;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      v6 = *(_QWORD *)(a1 + 8);
    }
    if (*(_QWORD *)&prime > v6)
      goto LABEL_74;
    if (*(_QWORD *)&prime >= v6)
      goto LABEL_43;
    v19 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (v6 < 3 || (v20 = (uint8x8_t)vcnt_s8((int8x8_t)v6), v20.i16[0] = vaddlv_u8(v20), v20.u32[0] > 1uLL))
    {
      v19 = std::__next_prime(v19);
    }
    else
    {
      v21 = 1 << -(char)__clz(v19 - 1);
      if (v19 >= 2)
        v19 = v21;
    }
    if (*(_QWORD *)&prime <= v19)
      prime = (int8x8_t)v19;
    if (*(_QWORD *)&prime >= v6)
    {
      v6 = *(_QWORD *)(a1 + 8);
      goto LABEL_43;
    }
    if (prime)
    {
LABEL_74:
      if (*(_QWORD *)&prime >> 61)
        sub_2462D3488();
      v13 = operator new(8 * *(_QWORD *)&prime);
      v14 = *(void **)a1;
      *(_QWORD *)a1 = v13;
      if (v14)
        operator delete(v14);
      v15 = 0;
      *(int8x8_t *)(a1 + 8) = prime;
      do
        *(_QWORD *)(*(_QWORD *)a1 + 8 * v15++) = 0;
      while (*(_QWORD *)&prime != v15);
      v16 = *(uint64_t ***)(a1 + 16);
      if (v16)
      {
        v17 = (unint64_t)v16[1];
        v18 = (uint8x8_t)vcnt_s8(prime);
        v18.i16[0] = vaddlv_u8(v18);
        if (v18.u32[0] > 1uLL)
        {
          if (v17 >= *(_QWORD *)&prime)
            v17 %= *(_QWORD *)&prime;
        }
        else
        {
          v17 &= *(_QWORD *)&prime - 1;
        }
        *(_QWORD *)(*(_QWORD *)a1 + 8 * v17) = a1 + 16;
        for (i = *v16; *v16; i = *v16)
        {
          v23 = i[1];
          if (v18.u32[0] > 1uLL)
          {
            if (v23 >= *(_QWORD *)&prime)
              v23 %= *(_QWORD *)&prime;
          }
          else
          {
            v23 &= *(_QWORD *)&prime - 1;
          }
          if (v23 == v17)
          {
            v16 = (uint64_t **)i;
          }
          else
          {
            v24 = i;
            if (*(_QWORD *)(*(_QWORD *)a1 + 8 * v23))
            {
              do
              {
                v25 = v24;
                v24 = (uint64_t *)*v24;
              }
              while (v24 && *((unsigned __int16 *)i + 8) == *((unsigned __int16 *)v24 + 8));
              *v16 = v24;
              *v25 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v23);
              **(_QWORD **)(*(_QWORD *)a1 + 8 * v23) = i;
            }
            else
            {
              *(_QWORD *)(*(_QWORD *)a1 + 8 * v23) = v16;
              v16 = (uint64_t **)i;
              v17 = v23;
            }
          }
        }
      }
      v6 = (unint64_t)prime;
    }
    else
    {
      v35 = *(void **)a1;
      *(_QWORD *)a1 = 0;
      if (v35)
        operator delete(v35);
      v6 = 0;
      *(_QWORD *)(a1 + 8) = 0;
    }
  }
LABEL_43:
  v26 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
  v26.i16[0] = vaddlv_u8(v26);
  if (v26.u32[0] > 1uLL)
  {
    v27 = a2;
    if (v6 <= a2)
      v27 = a2 % v6;
  }
  else
  {
    v27 = (v6 - 1) & a2;
  }
  v28 = *(uint64_t **)(*(_QWORD *)a1 + 8 * v27);
  if (!v28)
    return 0;
  v29 = 0;
  do
  {
    result = v28;
    v28 = (uint64_t *)*v28;
    if (!v28)
      break;
    v31 = v28[1];
    if (v26.u32[0] > 1uLL)
    {
      v32 = v28[1];
      if (v31 >= v6)
        v32 = v31 % v6;
    }
    else
    {
      v32 = v31 & (v6 - 1);
    }
    if (v32 != v27)
      break;
    v33 = v31 == a2 && *((unsigned __int16 *)v28 + 8) == *a3;
    v34 = v29 & !v33;
    v29 |= v33;
  }
  while (v34 != 1);
  return result;
}

_QWORD *sub_2462F784C(_QWORD *result, _QWORD *a2, _QWORD *a3)
{
  int8x8_t v3;
  unint64_t v4;
  uint8x8_t v5;
  unint64_t v6;

  v3 = (int8x8_t)result[1];
  v4 = a2[1];
  v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(_QWORD *)&v3)
      v4 %= *(_QWORD *)&v3;
  }
  else
  {
    v4 &= *(_QWORD *)&v3 - 1;
  }
  if (!a3)
  {
    *a2 = result[2];
    result[2] = a2;
    *(_QWORD *)(*result + 8 * v4) = result + 2;
    if (!*a2)
      goto LABEL_19;
    v6 = *(_QWORD *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(_QWORD *)&v3)
        v6 %= *(_QWORD *)&v3;
    }
    else
    {
      v6 &= *(_QWORD *)&v3 - 1;
    }
LABEL_18:
    *(_QWORD *)(*result + 8 * v6) = a2;
    goto LABEL_19;
  }
  *a2 = *a3;
  *a3 = a2;
  if (*a2)
  {
    v6 = *(_QWORD *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(_QWORD *)&v3)
        v6 %= *(_QWORD *)&v3;
    }
    else
    {
      v6 &= *(_QWORD *)&v3 - 1;
    }
    if (v6 != v4)
      goto LABEL_18;
  }
LABEL_19:
  ++result[3];
  return result;
}

uint64_t *sub_2462F7934(uint64_t *result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *result;
  v2 = result[1];
  v4 = (_QWORD *)a2[1];
  while (v2 != v3)
  {
    v5 = *(_QWORD *)(v2 - 32);
    v2 -= 32;
    *(v4 - 4) = v5;
    v4 -= 4;
    v4[2] = 0;
    v4[3] = 0;
    v4[1] = 0;
    *(_OWORD *)(v4 + 1) = *(_OWORD *)(v2 + 8);
    v4[3] = *(_QWORD *)(v2 + 24);
    *(_QWORD *)(v2 + 8) = 0;
    *(_QWORD *)(v2 + 16) = 0;
    *(_QWORD *)(v2 + 24) = 0;
  }
  a2[1] = v4;
  v6 = *result;
  *result = (uint64_t)v4;
  a2[1] = v6;
  v7 = result[1];
  result[1] = a2[2];
  a2[2] = v7;
  v8 = result[2];
  result[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t sub_2462F79AC(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;
  void **v5;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 32;
    v5 = (void **)(i - 24);
    sub_2462D38F0(&v5);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

BOOL sub_2462F7A0C(int *a1, uint64_t a2, unsigned int a3)
{
  unsigned __int16 *v3;
  uint64_t v4;
  unint64_t v5;
  _BOOL8 result;
  unint64_t v8;
  uint64_t v9;

  v3 = (unsigned __int16 *)((char *)a1 - *a1);
  if (*v3 <= a3)
    return 1;
  v4 = *(unsigned __int16 *)((char *)v3 + a3);
  if (!v4)
    return 1;
  v5 = (unint64_t)a1 + v4 - *(_QWORD *)a2;
  if ((v5 & 3) != 0 && *(_BYTE *)(a2 + 40) != 0)
    return 0;
  result = 0;
  v8 = *(_QWORD *)(a2 + 8);
  if (v8 >= 5 && v8 - 4 >= v5)
  {
    v9 = *(unsigned int *)(*(_QWORD *)a2 + v5);
    if ((int)v9 >= 1)
      return v8 - 1 >= v5 + v9;
    return 0;
  }
  return result;
}

BOOL sub_2462F7A94(uint64_t *a1, int *a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  BOOL v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v14;

  v2 = *a1;
  v3 = (unint64_t)a2 - *a1;
  if ((v3 & 3) != 0 && *((_BYTE *)a1 + 40))
    return 0;
  v4 = a1[1];
  v5 = v4 >= 5 && v4 - 4 >= v3;
  if (!v5)
    return 0;
  v6 = *a2;
  v7 = *((_DWORD *)a1 + 5);
  v8 = *((_DWORD *)a1 + 4) + 1;
  *((_DWORD *)a1 + 4) = v8;
  v9 = *((_DWORD *)a1 + 6) + 1;
  *((_DWORD *)a1 + 6) = v9;
  if (v8 > v7 || v9 > *((_DWORD *)a1 + 7))
    return 0;
  v10 = v3 - v6;
  if ((v10 & 1) != 0)
  {
    v11 = 0;
    if (*((_BYTE *)a1 + 40) || v4 - 2 < v10)
      return v11;
  }
  else if (v4 - 2 < v10)
  {
    return 0;
  }
  v12 = *(unsigned __int16 *)(v2 + v10);
  if ((v12 & 1) != 0 && *((_BYTE *)a1 + 40))
    return 0;
  v5 = v4 >= v12;
  v14 = v4 - v12;
  return v14 != 0 && v5 && v14 >= v10;
}

BOOL sub_2462F7B4C(uint64_t a1, unsigned int *a2, unint64_t a3, _QWORD *a4)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  unint64_t v10;

  v4 = (unint64_t)a2 - *(_QWORD *)a1;
  if ((v4 & 3) != 0 && *(_BYTE *)(a1 + 40))
    return 0;
  v5 = *(_QWORD *)(a1 + 8);
  if (v5 < 5 || v5 - 4 < v4)
    return 0;
  v7 = *a2;
  if (0x7FFFFFFF / a3 <= v7)
    return 0;
  v8 = v7 * a3 + 4;
  if (a4)
  {
    *a4 = v8 + v4;
    v5 = *(_QWORD *)(a1 + 8);
  }
  v9 = v5 > v8;
  v10 = v5 - v8;
  return v9 && v10 >= v4;
}

BOOL sub_2462F7BBC(_QWORD *a1, unsigned int *a2)
{
  _BOOL8 result;
  unint64_t v4;
  unint64_t v6;

  if (!a2)
    return 1;
  v6 = 0;
  result = sub_2462F7B4C((uint64_t)a1, a2, 1uLL, &v6);
  if (result)
  {
    v4 = a1[1];
    return v4 >= 2 && v4 - 1 >= v6 && *(_BYTE *)(*a1 + v6) == 0;
  }
  return result;
}

uint64_t sub_2462F7C30(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 48) = *(_QWORD *)(a2 + 48);
  return result;
}

void sub_2462F7C40(_QWORD *a1, void *a2)
{
  const char *v3;
  uint64_t v4;
  unsigned int *v5;
  int *v6;
  unsigned __int16 *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  uint64_t v14;
  int v15;
  void *v16;
  unsigned int *v17;
  uint64_t v18;
  id v19;
  const char *v20;
  uint64_t v21;
  int64x2_t *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  char *v26;
  int *v27;
  unint64_t v28;
  uint64_t v29;
  void *v30;
  unsigned int *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  int64x2_t *v35;
  id v36;
  const char *v37;
  uint64_t v38;
  char *v39;
  int *v40;
  unint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  unsigned int *v48;
  uint64_t v49;
  id v50;
  const char *v51;
  uint64_t v52;
  int64x2_t *v53;
  id v54;
  const char *v55;
  uint64_t v56;
  char *v57;
  int *v58;
  unint64_t v59;
  uint64_t v60;
  const char *v61;
  NSObject *v62;
  int v63;
  id v64;
  int v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t buf[4];
  const char *v71;
  __int16 v72;
  int v73;
  __int16 v74;
  id v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v64 = a2;
  if (*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    v5 = *(unsigned int **)(*(_QWORD *)(a1[5] + 8) + 48);
    if (v5 != (unsigned int *)a1[7])
    {
      v6 = (int *)((char *)v5 + *v5);
      v7 = (unsigned __int16 *)((char *)v6 - *v6);
      if (*v7 >= 5u && (v8 = v7[2]) != 0)
        v9 = *(unsigned __int16 *)((char *)v6 + v8);
      else
        v9 = 0;
      if (*(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) == v9)
      {
        v65 = objc_msgSend_fieldType(v64, v3, v4);
        v12 = objc_msgSend_dataType(v64, v10, v11);
        if (v12)
        {
          if (v12 == 1)
          {
            v68 = 0u;
            v69 = 0u;
            v66 = 0u;
            v67 = 0u;
            objc_msgSend_repeatedStringValueNoCopy(v64, v13, v14);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v66, v76, 16);
            if (v45)
            {
              v46 = *(_QWORD *)v67;
              do
              {
                for (i = 0; i != v45; ++i)
                {
                  if (*(_QWORD *)v67 != v46)
                    objc_enumerationMutation(v43);
                  v48 = *(unsigned int **)(*(_QWORD *)(a1[5] + 8) + 48);
                  v49 = *v48;
                  v50 = *(id *)(*((_QWORD *)&v66 + 1) + 8 * i);
                  if (objc_msgSend_length(v50, v51, v52))
                  {
                    v53 = (int64x2_t *)a1[8];
                    v54 = objc_retainAutorelease(v50);
                    v57 = (char *)objc_msgSend_UTF8String(v54, v55, v56);
                    v58 = (int *)((char *)v48 + v49);
                    v59 = v53->u64[1];
                    if (v59 >= v53[1].i64[0])
                    {
                      v60 = sub_2462F8230(v53, v65, v58, v57);
                    }
                    else
                    {
                      sub_2462F81C4((uint64_t)v53, v65, v58, v57);
                      v60 = v59 + 72;
                    }
                    v53->i64[1] = v60;

                    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 48) += 4;
                  }
                  else
                  {

                  }
                }
                v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v61, (uint64_t)&v66, v76, 16);
              }
              while (v45);
            }

          }
          else
          {
            if (v12 == 20)
            {
              v15 = objc_msgSend_rawEnumValue(v64, v13, v14);
              sub_2462DB2F4(v15, v65);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = *(unsigned int **)(*(_QWORD *)(a1[5] + 8) + 48);
              v18 = *v17;
              v19 = v16;
              if (objc_msgSend_length(v19, v20, v21))
              {
                v22 = (int64x2_t *)a1[8];
                v23 = objc_retainAutorelease(v19);
                v26 = (char *)objc_msgSend_UTF8String(v23, v24, v25);
                v27 = (int *)((char *)v17 + v18);
                v28 = v22->u64[1];
                if (v28 >= v22[1].i64[0])
                {
                  v29 = sub_2462F8230(v22, v65, v27, v26);
                }
                else
                {
                  sub_2462F81C4((uint64_t)v22, v65, v27, v26);
                  v29 = v28 + 72;
                }
                v22->i64[1] = v29;

                *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 48) += 4;
                goto LABEL_39;
              }
LABEL_34:

LABEL_39:
              goto LABEL_40;
            }
            v62 = qword_25441F958;
            if (os_log_type_enabled((os_log_t)qword_25441F958, OS_LOG_TYPE_ERROR))
            {
              v63 = *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
              *(_DWORD *)buf = 136315650;
              v71 = "match_spans_of_cascade_entity_block_invoke";
              v72 = 1024;
              v73 = v63;
              v74 = 2112;
              v75 = v64;
              _os_log_error_impl(&dword_2462C4000, v62, OS_LOG_TYPE_ERROR, "%s field index: %u has unexpected type: %@", buf, 0x1Cu);
            }
            *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 0;
          }
        }
        else
        {
          objc_msgSend_stringValueNoCopy(v64, v13, v14);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = *(unsigned int **)(*(_QWORD *)(a1[5] + 8) + 48);
          v32 = *v31;
          v19 = v30;
          if (!objc_msgSend_length(v19, v33, v34))
            goto LABEL_34;
          v35 = (int64x2_t *)a1[8];
          v36 = objc_retainAutorelease(v19);
          v39 = (char *)objc_msgSend_UTF8String(v36, v37, v38);
          v40 = (int *)((char *)v31 + v32);
          v41 = v35->u64[1];
          if (v41 >= v35[1].i64[0])
          {
            v42 = sub_2462F8230(v35, v65, v40, v39);
          }
          else
          {
            sub_2462F81C4((uint64_t)v35, v65, v40, v39);
            v42 = v41 + 72;
          }
          v35->i64[1] = v42;

          *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 48) += 4;
        }
      }
    }
  }
LABEL_40:
  ++*(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24);

}

void sub_2462F8058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v9;

  _Unwind_Resume(a1);
}

uint64_t sub_2462F80BC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 56) = *(_QWORD *)(a2 + 56);
  return result;
}

uint64_t *sub_2462F80CC(uint64_t *result, _QWORD *a2)
{
  uint64_t *v3;
  _QWORD *v4;
  unint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD v14[5];

  v3 = result;
  v4 = result + 2;
  v5 = result[2];
  v6 = (_QWORD *)result[1];
  if ((unint64_t)v6 >= v5)
  {
    v8 = ((uint64_t)v6 - *result) >> 5;
    v9 = v8 + 1;
    if ((unint64_t)(v8 + 1) >> 59)
      sub_2462D357C();
    v10 = v5 - *result;
    if (v10 >> 4 > v9)
      v9 = v10 >> 4;
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFE0)
      v11 = 0x7FFFFFFFFFFFFFFLL;
    else
      v11 = v9;
    v14[4] = v4;
    if (v11)
      v11 = (unint64_t)sub_2462D3624(v11);
    else
      v12 = 0;
    v13 = (_QWORD *)(v11 + 32 * v8);
    v14[0] = v11;
    v14[1] = v13;
    v14[3] = v11 + 32 * v12;
    *v13 = *a2 + *(unsigned int *)*a2;
    v13[1] = 0;
    v13[2] = 0;
    v13[3] = 0;
    v14[2] = v13 + 4;
    sub_2462F7934(v3, v14);
    v7 = (_QWORD *)v3[1];
    result = (uint64_t *)sub_2462F79AC((uint64_t)v14);
  }
  else
  {
    *v6 = *a2 + *(unsigned int *)*a2;
    v6[1] = 0;
    v6[2] = 0;
    v6[3] = 0;
    v7 = v6 + 4;
  }
  v3[1] = (uint64_t)v7;
  return result;
}

uint64_t sub_2462F81C4(uint64_t a1, __int16 a2, int *a3, char *__s)
{
  uint64_t v8;
  size_t v9;
  uint64_t result;

  v8 = *(_QWORD *)(a1 + 8);
  v9 = strlen(__s);
  result = sub_2462F8414(v8, a2, a3, (uint64_t)__s, v9);
  *(_QWORD *)(a1 + 8) = v8 + 72;
  return result;
}

void sub_2462F8228(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t sub_2462F8230(int64x2_t *a1, __int16 a2, int *a3, const char *a4)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v10;
  char *v11;
  size_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int64x2_t v21;
  char *v22;
  char *v24;
  int64x2_t v25;
  char *v26;
  int64x2_t *v27;

  v4 = 0x8E38E38E38E38E39 * ((a1->i64[1] - a1->i64[0]) >> 3);
  v5 = v4 + 1;
  if (v4 + 1 > 0x38E38E38E38E38ELL)
    sub_2462D357C();
  if (0x1C71C71C71C71C72 * ((a1[1].i64[0] - a1->i64[0]) >> 3) > v5)
    v5 = 0x1C71C71C71C71C72 * ((a1[1].i64[0] - a1->i64[0]) >> 3);
  if (0x8E38E38E38E38E39 * ((a1[1].i64[0] - a1->i64[0]) >> 3) >= 0x1C71C71C71C71C7)
    v10 = 0x38E38E38E38E38ELL;
  else
    v10 = v5;
  v27 = a1 + 1;
  if (v10)
  {
    if (v10 > 0x38E38E38E38E38ELL)
      sub_2462D3488();
    v11 = (char *)operator new(72 * v10);
  }
  else
  {
    v11 = 0;
  }
  v24 = v11;
  v25.i64[0] = (uint64_t)&v11[72 * v4];
  v26 = &v11[72 * v10];
  v12 = strlen(a4);
  sub_2462F8414(v25.i64[0], a2, a3, (uint64_t)a4, v12);
  v13 = v25.i64[0];
  v14 = v25.i64[0] + 72;
  v25.i64[1] = v25.i64[0] + 72;
  v16 = a1->i64[0];
  v15 = a1->u64[1];
  if (v15 == a1->i64[0])
  {
    v21 = vdupq_n_s64(v15);
  }
  else
  {
    v17 = 0;
    do
    {
      v18 = v13 + v17;
      v19 = v15 + v17;
      v20 = *(_QWORD *)(v15 + v17 - 56);
      *(_OWORD *)(v18 - 72) = *(_OWORD *)(v15 + v17 - 72);
      *(_QWORD *)(v18 - 56) = v20;
      *(_QWORD *)(v18 - 48) = 0;
      *(_QWORD *)(v18 - 40) = 0;
      *(_QWORD *)(v18 - 32) = 0;
      *(_OWORD *)(v18 - 48) = *(_OWORD *)(v15 + v17 - 48);
      *(_QWORD *)(v18 - 32) = *(_QWORD *)(v15 + v17 - 32);
      *(_QWORD *)(v19 - 48) = 0;
      *(_QWORD *)(v19 - 40) = 0;
      *(_QWORD *)(v19 - 32) = 0;
      *(_QWORD *)(v18 - 24) = 0;
      *(_QWORD *)(v18 - 16) = 0;
      *(_QWORD *)(v18 - 8) = 0;
      *(_OWORD *)(v18 - 24) = *(_OWORD *)(v15 + v17 - 24);
      *(_QWORD *)(v18 - 8) = *(_QWORD *)(v15 + v17 - 8);
      *(_QWORD *)(v19 - 24) = 0;
      *(_QWORD *)(v19 - 16) = 0;
      *(_QWORD *)(v19 - 8) = 0;
      v17 -= 72;
    }
    while (v15 + v17 != v16);
    v21 = *a1;
    v14 = v25.i64[1];
    v13 += v17;
  }
  a1->i64[0] = v13;
  a1->i64[1] = v14;
  v25 = v21;
  v22 = (char *)a1[1].i64[0];
  a1[1].i64[0] = (uint64_t)v26;
  v26 = v22;
  v24 = (char *)v21.i64[0];
  sub_2462F8690((uint64_t)&v24);
  return v14;
}

void sub_2462F8400(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_2462F8690((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_2462F8414(uint64_t a1, __int16 a2, int *a3, uint64_t a4, uint64_t a5)
{
  uint64_t *v7;
  unsigned __int16 *v8;
  uint64_t v9;
  unsigned int *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int *v29;
  unint64_t v30;
  uint64_t v31;
  char **v33;
  char *v34;
  char *v35;
  char *v36;
  char *v37;
  uint64_t v38;

  *(_WORD *)a1 = a2;
  *(_QWORD *)(a1 + 8) = a4;
  *(_QWORD *)(a1 + 16) = a5;
  *(_OWORD *)(a1 + 24) = 0u;
  v7 = (uint64_t *)(a1 + 48);
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  v8 = (unsigned __int16 *)((char *)a3 - *a3);
  if (*v8 >= 7u && (v9 = v8[3]) != 0)
    v10 = (unsigned int *)((char *)a3 + v9 + *(unsigned int *)((char *)a3 + v9));
  else
    v10 = 0;
  sub_2462DF164((uint64_t *)(a1 + 24), v10);
  v11 = *a3;
  if (*(unsigned __int16 *)((char *)a3 - v11) >= 9u && *(_WORD *)((char *)a3 - v11 + 8))
  {
    v12 = *(unsigned int *)((char *)a3
                          + *(unsigned __int16 *)((char *)a3 - v11 + 8)
                          + *(unsigned int *)((char *)a3 + *(unsigned __int16 *)((char *)a3 - v11 + 8)));
    v13 = *(_QWORD *)(a1 + 48);
    if (v12 > (*(_QWORD *)(a1 + 64) - v13) >> 5)
    {
      v14 = *(_QWORD *)(a1 + 56);
      v38 = a1 + 64;
      v34 = (char *)sub_2462E7368(a1 + 64, v12);
      v35 = &v34[v14 - v13];
      v36 = v35;
      v37 = &v34[32 * v15];
      sub_2462E72F4(v7, &v34);
      sub_2462E74C0((void **)&v34);
      v11 = *a3;
    }
    v16 = *(unsigned __int16 *)((char *)a3 - v11 + 8);
    v17 = *(unsigned int *)((char *)a3 + v16);
    v18 = (unsigned int *)((char *)a3 + v16 + v17);
    v19 = *v18;
    if ((_DWORD)v19)
    {
      v20 = 0;
      v21 = 4 * v19;
      v22 = (char *)a3 + v16 + v17;
      do
      {
        v23 = v18[v20 / 4 + 1];
        v34 = 0;
        v35 = 0;
        LOWORD(v37) = 0;
        v36 = 0;
        v24 = v23 - *(int *)((char *)&v18[v20 / 4 + 1] + v23);
        v25 = &v22[v20 + v24];
        v26 = *((unsigned __int16 *)v25 + 2);
        if (v26 < 7)
        {
          if (v26 < 5)
            goto LABEL_18;
        }
        else
        {
          v27 = *((unsigned __int16 *)v25 + 5);
          if (v27)
            LOWORD(v27) = *(_WORD *)&v22[v20 + 4 + v23 + v27];
          LOWORD(v37) = v27;
        }
        v28 = *(unsigned __int16 *)&v22[v20 + 8 + v24];
        if (!v28)
        {
LABEL_18:
          v29 = 0;
          goto LABEL_19;
        }
        v29 = (unsigned int *)&v22[v20 + 4 + v23 + v28 + *(unsigned int *)&v22[v20 + 4 + v23 + v28]];
LABEL_19:
        sub_2462DF164((uint64_t *)&v34, v29);
        v30 = *(_QWORD *)(a1 + 56);
        if (v30 >= *(_QWORD *)(a1 + 64))
        {
          v31 = sub_2462E71EC(v7, (uint64_t)&v34);
        }
        else
        {
          sub_2462E717C((uint64_t)v7, (uint64_t)&v34);
          v31 = v30 + 32;
        }
        *(_QWORD *)(a1 + 56) = v31;
        v33 = &v34;
        sub_2462D3760((void ***)&v33);
        v20 += 4;
      }
      while (v21 != v20);
    }
  }
  return a1;
}

void sub_2462F8644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9, void *a10)
{
  sub_2462E74C0(&a10);
  sub_2462E710C(&a9);
  sub_2462D3760(&a9);
  _Unwind_Resume(a1);
}

uint64_t sub_2462F8690(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;
  void **v5;

  v2 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v2; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 72;
    v5 = (void **)(i - 24);
    sub_2462E710C(&v5);
    v5 = (void **)(i - 48);
    sub_2462D3760(&v5);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t sub_2462F8708(uint64_t result, uint64_t a2)
{
  unsigned int v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t *v18;

  v2 = *(_DWORD *)(a2 + 24);
  if (v2)
  {
    v4 = result;
    v5 = *(_QWORD *)(a2 + 16);
    v6 = (uint64_t *)(result + 8);
    v7 = (unint64_t *)(result + 24);
    v8 = *(_QWORD *)(result + 16);
    v9 = 552 * v2;
    do
    {
      if (v8 >= *v7)
      {
        v10 = 0x193D4BB7E327A977 * ((uint64_t)(v8 - *v6) >> 3);
        v11 = v10 + 1;
        if ((unint64_t)(v10 + 1) > 0x73615A240E6C2BLL)
          sub_2462D357C();
        if (0x327A976FC64F52EELL * ((uint64_t)(*v7 - *v6) >> 3) > v11)
          v11 = 0x327A976FC64F52EELL * ((uint64_t)(*v7 - *v6) >> 3);
        if ((unint64_t)(0x193D4BB7E327A977 * ((uint64_t)(*v7 - *v6) >> 3)) >= 0x39B0AD12073615)
          v12 = 0x73615A240E6C2BLL;
        else
          v12 = v11;
        v18 = v7;
        if (v12)
          v12 = (unint64_t)sub_2462FA1D8(v12);
        else
          v13 = 0;
        v14 = v12;
        v15 = v12 + 568 * v10;
        v16 = v15;
        v17 = v12 + 568 * v13;
        sub_2462F9DD0(v15, (unsigned int *)a2, v5);
        v16 += 568;
        sub_2462FA0E0(v6, &v14);
        v8 = *(_QWORD *)(v4 + 16);
        result = sub_2462FA330((uint64_t)&v14);
      }
      else
      {
        result = sub_2462F9DD0(v8, (unsigned int *)a2, v5);
        v8 += 568;
        *(_QWORD *)(v4 + 16) = v8;
      }
      *(_QWORD *)(v4 + 16) = v8;
      v5 += 552;
      v9 -= 552;
    }
    while (v9);
  }
  return result;
}

void sub_2462F8874(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_2462FA330((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2462F8894(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  __int128 *v4;
  uint64_t v5;
  _BYTE v6[32];
  void *v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v2 = *(unsigned int *)(a2 + 56);
  if ((_DWORD)v2)
  {
    v4 = *(__int128 **)(a2 + 48);
    v5 = v2 << 6;
    do
    {
      sub_2462FA090((uint64_t)v6, v4);
      sub_2462FA37C(a1);
      if (v7 != v8)
        free(v7);
      v4 += 4;
      v5 -= 64;
    }
    while (v5);
  }
}

void sub_2462F8948(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  if (a14 != v14)
    free(a14);
  _Unwind_Resume(exception_object);
}

size_t sub_2462F8964(void **a1, unsigned int a2)
{
  char *v3;
  void *v4;
  void **v5;
  unsigned int v6;
  char *v7;
  char *v8;
  char *v9;
  __int128 v10;
  char *v11;
  _DWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  size_t result;
  std::bad_alloc *exception;
  std::bad_alloc *v25;
  uint64_t v26;
  void *v27;
  void **v28;

  v3 = (char *)malloc_type_malloc(320 * a2, 0x103204007ED9757uLL);
  if (!v3)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    v25 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v25, MEMORY[0x24BEDB758], MEMORY[0x24BEDB670]);
  }
  v4 = v3;
  v5 = (void **)*a1;
  v6 = *((_DWORD *)a1 + 2);
  if (v6)
  {
    v27 = v3;
    v28 = a1;
    v26 = *((unsigned int *)a1 + 2);
    v7 = (char *)&v5[40 * v6];
    v8 = v3;
    v9 = (char *)*a1;
    do
    {
      *(_WORD *)v8 = *(_WORD *)v9;
      v10 = *(_OWORD *)(v9 + 8);
      *((_QWORD *)v8 + 3) = *((_QWORD *)v9 + 3);
      *(_OWORD *)(v8 + 8) = v10;
      *((_QWORD *)v9 + 2) = 0;
      *((_QWORD *)v9 + 3) = 0;
      *((_QWORD *)v9 + 1) = 0;
      *((_OWORD *)v8 + 2) = *((_OWORD *)v9 + 2);
      v11 = (char *)*((_QWORD *)v9 + 6);
      if (v11 == v9 + 64)
      {
        *((_QWORD *)v8 + 6) = v8 + 64;
        v13 = *((unsigned int *)v9 + 14);
        if ((_DWORD)v13)
        {
          v14 = 0;
          v15 = *((_QWORD *)v9 + 6);
          do
          {
            v16 = &v8[v14];
            v17 = v15 + v14;
            v18 = *(_OWORD *)(v15 + v14);
            *(_OWORD *)(v16 + 76) = *(_OWORD *)(v15 + v14 + 12);
            *((_OWORD *)v16 + 4) = v18;
            sub_2462F8B64((uint64_t)&v8[v14 + 96], v15 + v14 + 32);
            *((_DWORD *)v16 + 30) = *(_DWORD *)(v15 + v14 + 56);
            v14 += 64;
          }
          while (v17 + 64 != v15 + (v13 << 6));
          v19 = v13 << 6;
          v20 = (_QWORD *)(v15 + 48);
          do
          {
            v21 = (_QWORD *)*(v20 - 2);
            if (v20 != v21)
              free(v21);
            v20 += 8;
            v19 -= 64;
          }
          while (v19);
        }
        v12 = v8 + 60;
      }
      else
      {
        *((_QWORD *)v8 + 6) = v11;
        v12 = v9 + 60;
        *((_DWORD *)v8 + 15) = *((_DWORD *)v9 + 15);
        *((_QWORD *)v9 + 6) = v9 + 64;
      }
      *v12 = 4;
      *((_DWORD *)v8 + 14) = *((_DWORD *)v9 + 14);
      *((_DWORD *)v9 + 14) = 0;
      v8 += 320;
      v9 += 320;
    }
    while (v9 != v7);
    v22 = 320 * v26;
    do
    {
      sub_2462F8C74((uint64_t)v5);
      v5 += 40;
      v22 -= 320;
    }
    while (v22);
    v4 = v27;
    a1 = v28;
    v5 = (void **)*v28;
  }
  if (v5 != a1 + 2)
    free(v5);
  *a1 = v4;
  result = malloc_size(v4);
  *((_DWORD *)a1 + 3) = result / 0x140;
  return result;
}

uint64_t sub_2462F8B64(uint64_t result, uint64_t a2)
{
  _DWORD *v2;
  _WORD *v3;
  uint64_t v4;
  __int16 *v5;
  uint64_t v6;
  __int16 v7;

  if (*(_QWORD *)a2 == a2 + 16)
  {
    v3 = (_WORD *)(result + 16);
    *(_QWORD *)result = result + 16;
    v4 = *(unsigned int *)(a2 + 8);
    if ((_DWORD)v4)
    {
      v5 = *(__int16 **)a2;
      v6 = 2 * v4;
      do
      {
        v7 = *v5++;
        *v3++ = v7;
        v6 -= 2;
      }
      while (v6);
    }
    v2 = (_DWORD *)(result + 12);
  }
  else
  {
    *(_QWORD *)result = *(_QWORD *)a2;
    v2 = (_DWORD *)(a2 + 12);
    *(_DWORD *)(result + 12) = *(_DWORD *)(a2 + 12);
    *(_QWORD *)a2 = a2 + 16;
  }
  *v2 = 4;
  *(_DWORD *)(result + 8) = *(_DWORD *)(a2 + 8);
  *(_DWORD *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_2462F8BD0(uint64_t a1)
{
  sub_2462F8C08((char **)(a1 + 48));
  if (*(char *)(a1 + 31) < 0)
    operator delete(*(void **)(a1 + 8));
  return a1;
}

char **sub_2462F8C08(char **a1)
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;

  v2 = *a1;
  v3 = *((unsigned int *)a1 + 2);
  if ((_DWORD)v3)
  {
    v4 = v3 << 6;
    v5 = v2 + 48;
    do
    {
      v6 = (char *)*((_QWORD *)v5 - 2);
      if (v5 != v6)
        free(v6);
      v5 += 64;
      v4 -= 64;
    }
    while (v4);
    v2 = *a1;
  }
  if (v2 != (char *)(a1 + 2))
    free(v2);
  return a1;
}

void sub_2462F8C74(uint64_t a1)
{
  sub_2462F8C08((char **)(a1 + 48));
  if (*(char *)(a1 + 31) < 0)
    operator delete(*(void **)(a1 + 8));
}

size_t sub_2462F8CB0(size_t result, _QWORD *a2)
{
  size_t v3;
  unsigned int v4;

  v3 = result;
  v4 = *(_DWORD *)(result + 8);
  if (v4 == *(_DWORD *)(result + 12))
  {
    result = sub_2462F8D08(result, v4 + (v4 >> 1) + 1);
    v4 = *(_DWORD *)(v3 + 8);
  }
  *(_QWORD *)(*(_QWORD *)v3 + 8 * v4) = *a2;
  *(_DWORD *)(v3 + 8) = v4 + 1;
  return result;
}

size_t sub_2462F8D08(uint64_t a1, unsigned int a2)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  size_t result;
  std::bad_alloc *exception;
  std::bad_alloc *v12;

  v3 = malloc_type_malloc(8 * a2, 0x6004044C4A2DFuLL);
  if (!v3)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    v12 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v12, MEMORY[0x24BEDB758], MEMORY[0x24BEDB670]);
  }
  v4 = v3;
  v5 = *(uint64_t **)a1;
  v6 = *(unsigned int *)(a1 + 8);
  if ((_DWORD)v6)
  {
    v7 = 8 * v6;
    v8 = v4;
    do
    {
      v9 = *v5++;
      *v8++ = v9;
      v7 -= 8;
    }
    while (v7);
    v5 = *(uint64_t **)a1;
  }
  if (v5 != (uint64_t *)(a1 + 16))
    free(v5);
  *(_QWORD *)a1 = v4;
  result = malloc_size(v4);
  *(_DWORD *)(a1 + 12) = result >> 3;
  return result;
}

void *sub_2462F8DB0(uint64_t a1)
{
  unint64_t v1;
  const std::nothrow_t *v2;
  void *result;
  BOOL v4;

  if (a1 < 1)
    return 0;
  if (a1 >= 0xFFFFFFFFFFFFFFFLL)
    v1 = 0xFFFFFFFFFFFFFFFLL;
  else
    v1 = a1;
  v2 = (const std::nothrow_t *)MEMORY[0x24BEDB6B8];
  while (1)
  {
    result = operator new(8 * v1, v2);
    if (result)
      break;
    v4 = v1 > 1;
    v1 >>= 1;
    if (!v4)
      return 0;
  }
  return result;
}

unsigned __int16 **sub_2462F8E10(unsigned __int16 **result, unsigned __int16 **a2, unint64_t a3, unsigned __int16 **a4, uint64_t a5)
{
  unsigned __int16 **v6;
  unsigned __int16 *v7;
  unsigned __int16 **v9;
  uint64_t v10;
  unsigned __int16 **v11;
  unsigned __int16 *v12;
  unsigned __int16 *v13;
  unsigned __int16 *v14;
  uint64_t v15;
  unsigned __int16 **v16;
  unsigned __int16 **v18;
  unint64_t v19;
  unsigned __int16 **v20;
  unint64_t v21;
  unsigned __int16 **v22;
  unsigned __int16 **v23;
  unsigned __int16 **v24;
  unsigned __int16 **v25;
  uint64_t v26;
  uint64_t v27;

  if (a3 >= 2)
  {
    v6 = result;
    if (a3 == 2)
    {
      result = (unsigned __int16 **)sub_2462F9028(*(a2 - 1), *result);
      if ((_DWORD)result)
      {
        v7 = *v6;
        *v6 = *(a2 - 1);
        *(a2 - 1) = v7;
      }
    }
    else if ((uint64_t)a3 > 128)
    {
      v18 = a4;
      v19 = a3 >> 1;
      v20 = &result[a3 >> 1];
      v21 = a3 >> 1;
      if ((uint64_t)a3 <= a5)
      {
        sub_2462F9394(result, v20, v21, a4);
        v22 = &v18[v19];
        result = sub_2462F9394(&v6[a3 >> 1], a2, a3 - (a3 >> 1), v22);
        v23 = &v18[a3];
        v24 = v22;
        while (v24 != v23)
        {
          result = (unsigned __int16 **)sub_2462F9028(*v24, *v18);
          if ((_DWORD)result)
            v25 = v24;
          else
            v25 = v18;
          v18 += result ^ 1;
          v24 += result;
          *v6++ = *v25;
          if (v18 == v22)
          {
            if (v24 != v23)
            {
              v26 = 0;
              do
              {
                v6[v26] = v24[v26];
                ++v26;
              }
              while (&v24[v26] != v23);
            }
            return result;
          }
        }
        if (v18 != v22)
        {
          v27 = 0;
          do
          {
            v6[v27] = v18[v27];
            ++v27;
          }
          while (&v18[v27] != v22);
        }
      }
      else
      {
        sub_2462F8E10(result, v20, v21, a4, a5);
        sub_2462F8E10(&v6[a3 >> 1], a2, a3 - (a3 >> 1), v18, a5);
        return (unsigned __int16 **)sub_2462F956C((uint64_t)v6, &v6[a3 >> 1], a2, a3 >> 1, a3 - (a3 >> 1), v18, a5);
      }
    }
    else if (result != a2)
    {
      v9 = result + 1;
      if (result + 1 != a2)
      {
        v10 = 0;
        v11 = result;
        do
        {
          v13 = *v11;
          v12 = v11[1];
          v11 = v9;
          result = (unsigned __int16 **)sub_2462F9028(v12, v13);
          if ((_DWORD)result)
          {
            v14 = *v11;
            v15 = v10;
            while (1)
            {
              *(unsigned __int16 **)((char *)v6 + v15 + 8) = *(unsigned __int16 **)((char *)v6 + v15);
              if (!v15)
                break;
              result = (unsigned __int16 **)sub_2462F9028(v14, *(unsigned __int16 **)((char *)v6 + v15 - 8));
              v15 -= 8;
              if ((result & 1) == 0)
              {
                v16 = (unsigned __int16 **)((char *)v6 + v15 + 8);
                goto LABEL_15;
              }
            }
            v16 = v6;
LABEL_15:
            *v16 = v14;
          }
          v9 = v11 + 1;
          v10 += 8;
        }
        while (v11 + 1 != a2);
      }
    }
  }
  return result;
}

BOOL sub_2462F9028(unsigned __int16 *a1, unsigned __int16 *a2)
{
  unsigned int *v4;
  char *v5;
  unsigned int v6;
  unsigned int v7;
  char *v8;
  unsigned int v9;
  unsigned int *v10;
  unsigned int v11;
  char *v12;
  unsigned int v13;
  unsigned int *v14;
  unsigned int *v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v24;
  unsigned int v25;
  BOOL v26;
  unsigned int v27;
  BOOL v28;
  skit::SpanMatchV3 *v29;
  skit::SpanMatchV3 *v30;
  unsigned int v31;
  unsigned int v33;
  _DWORD *v34;
  unsigned int v35;
  _DWORD *v36;
  _DWORD *v37;
  unsigned int v38;
  _DWORD *v39;
  unsigned int v40;
  unsigned int v41;
  unsigned int v42;
  unsigned int v43;
  unsigned int v44;
  unsigned int v45;
  unsigned int *v46;
  char *v47;
  char *v48;
  unsigned int *v49;
  unsigned int v50;
  void *__p;
  char *v52;
  uint64_t v53;
  unsigned int *v54;
  unsigned int *v55;
  uint64_t v56;

  v54 = 0;
  v55 = 0;
  v56 = 0;
  __p = 0;
  v52 = 0;
  v53 = 0;
  sub_2462F9A98((void **)&v54, *((unsigned int *)a1 + 14));
  sub_2462F9A98(&__p, *((unsigned int *)a2 + 14));
  sub_2462F9B20((uint64_t)a1, (uint64_t)&v54);
  sub_2462F9B20((uint64_t)a2, (uint64_t)&__p);
  v4 = v54;
  v49 = v55;
  v5 = (char *)__p;
  if ((char *)v55 - (char *)v54 == 4 && v52 - (_BYTE *)__p == 4)
  {
    v6 = *v54;
    v7 = *(_DWORD *)__p;
  }
  else
  {
    v46 = v54;
    if (v54 == v55)
    {
      v50 = 0;
      v7 = 0;
    }
    else
    {
      v50 = 0;
      v7 = 0;
      v8 = v52;
      v47 = (char *)__p + 4;
      v48 = (char *)__p;
      v9 = -1;
      do
      {
        v10 = (unsigned int *)skit::SpanMatchV3::span((skit::SpanMatchV3 *)(*((_QWORD *)a1 + 6)
                                                                          + ((unint64_t)*v4 << 6)));
        if (v5 != v8)
        {
          v11 = *v10;
          v12 = v47;
          do
          {
            v13 = *(_DWORD *)skit::SpanMatchV3::span((skit::SpanMatchV3 *)(*((_QWORD *)a2 + 6)
                                                                         + ((unint64_t)*((unsigned int *)v12 - 1) << 6)));
            v14 = (unsigned int *)skit::SpanMatchV3::span((skit::SpanMatchV3 *)(*((_QWORD *)a1 + 6)
                                                                              + ((unint64_t)*v4 << 6)));
            v15 = (unsigned int *)skit::SpanMatchV3::span((skit::SpanMatchV3 *)(*((_QWORD *)a2 + 6)
                                                                              + ((unint64_t)*((unsigned int *)v12 - 1) << 6)));
            v16 = *v14;
            v17 = v14[1];
            v18 = *v15;
            v19 = v15[1];
            if (*v14 <= *v15)
              v20 = *v15;
            else
              v20 = *v14;
            if (v19 >= v17)
              v21 = v14[1];
            else
              v21 = v15[1];
            v22 = v16 - v19;
            if (v16 < v18)
              v22 = v18 - v17;
            if (v16 == v18 && v17 == v19)
              v24 = 0;
            else
              v24 = v22;
            v25 = v18 - v16;
            v26 = v16 >= v18;
            v27 = v16 - v18;
            if (v27 == 0 || !v26)
              v27 = v25;
            if (v20 > v21)
              v27 = v24;
            if (v27 < v9)
            {
              v50 = *v4;
              v7 = *((_DWORD *)v12 - 1);
              v9 = v27;
            }
            v28 = v11 < v13 || v12 == v8;
            v12 += 4;
          }
          while (!v28);
        }
        ++v4;
        v5 = v48;
      }
      while (v4 != v49);
    }
    v4 = v46;
    v6 = v50;
    if (!v5)
      goto LABEL_38;
  }
  operator delete(v5);
LABEL_38:
  if (v4)
    operator delete(v4);
  v29 = (skit::SpanMatchV3 *)(*((_QWORD *)a1 + 6) + ((unint64_t)v6 << 6));
  v30 = (skit::SpanMatchV3 *)(*((_QWORD *)a2 + 6) + ((unint64_t)v7 << 6));
  v31 = *(_DWORD *)skit::SpanMatchV3::span(v29);
  if (v31 < *(_DWORD *)skit::SpanMatchV3::span(v30))
    return 1;
  v33 = *(_DWORD *)skit::SpanMatchV3::span(v29);
  if (v33 > *(_DWORD *)skit::SpanMatchV3::span(v30))
    return 0;
  v34 = (_DWORD *)skit::SpanMatchV3::span(v29);
  v35 = v34[1] - *v34;
  v36 = (_DWORD *)skit::SpanMatchV3::span(v30);
  if (v35 > v36[1] - *v36)
    return 1;
  v37 = (_DWORD *)skit::SpanMatchV3::span(v29);
  v38 = v37[1] - *v37;
  v39 = (_DWORD *)skit::SpanMatchV3::span(v30);
  if (v38 < v39[1] - *v39)
    return 0;
  v40 = skit::SpanMatchV3::alias_token_cnt(v29);
  if (v40 < skit::SpanMatchV3::alias_token_cnt(v30))
    return 1;
  v41 = skit::SpanMatchV3::alias_token_cnt(v29);
  if (v41 > skit::SpanMatchV3::alias_token_cnt(v30))
    return 0;
  v42 = *a1 - 19679;
  if (v42 > 4)
    v43 = 5;
  else
    v43 = dword_246334EF8[(__int16)v42];
  v44 = *a2 - 19679;
  if (v44 > 4)
    v45 = 5;
  else
    v45 = dword_246334EF8[(__int16)v44];
  return v43 < v45;
}

void sub_2462F9358(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, void *a18)
{
  if (a15)
    operator delete(a15);
  if (a18)
    operator delete(a18);
  _Unwind_Resume(exception_object);
}

unsigned __int16 **sub_2462F9394(unsigned __int16 **result, unsigned __int16 **a2, unint64_t a3, unsigned __int16 **a4)
{
  unsigned __int16 **v4;
  unsigned __int16 **v6;
  unsigned __int16 **v8;
  unsigned __int16 **v9;
  unsigned __int16 **v10;
  uint64_t v11;
  unsigned __int16 **v12;
  unsigned __int16 **v13;
  unsigned __int16 *v14;
  unsigned __int16 **v15;
  uint64_t v16;
  unsigned __int16 *v17;
  unsigned __int16 **v18;
  unsigned __int16 **v19;
  unsigned __int16 **v20;
  uint64_t v21;
  uint64_t v22;

  if (a3)
  {
    v4 = a4;
    v6 = result;
    if (a3 == 1)
    {
LABEL_9:
      *v4 = *v6;
      return result;
    }
    if (a3 == 2)
    {
      v8 = a2 - 1;
      result = (unsigned __int16 **)sub_2462F9028(*(a2 - 1), *result);
      if ((_DWORD)result)
        v9 = v8;
      else
        v9 = v6;
      *v4++ = *v9;
      if (!(_DWORD)result)
        v6 = v8;
      goto LABEL_9;
    }
    if ((uint64_t)a3 > 8)
    {
      v18 = &result[a3 >> 1];
      sub_2462F8E10(result, v18, a3 >> 1, a4, a3 >> 1);
      result = (unsigned __int16 **)sub_2462F8E10(&v6[a3 >> 1], a2, a3 - (a3 >> 1), &v4[a3 >> 1], a3 - (a3 >> 1));
      v19 = &v6[a3 >> 1];
      while (v19 != a2)
      {
        result = (unsigned __int16 **)sub_2462F9028(*v19, *v6);
        if ((_DWORD)result)
          v20 = v19;
        else
          v20 = v6;
        v19 += result;
        v6 += result ^ 1;
        *v4++ = *v20;
        if (v6 == v18)
        {
          if (v19 != a2)
          {
            v21 = 0;
            do
            {
              v4[v21] = v19[v21];
              ++v21;
            }
            while (&v19[v21] != a2);
          }
          return result;
        }
      }
      if (v6 != v18)
      {
        v22 = 0;
        do
        {
          v4[v22] = v6[v22];
          ++v22;
        }
        while (&v6[v22] != v18);
      }
    }
    else if (result != a2)
    {
      v10 = result + 1;
      *a4 = *result;
      if (result + 1 != a2)
      {
        v11 = 0;
        v12 = a4;
        do
        {
          v13 = v12;
          v14 = *v12++;
          result = (unsigned __int16 **)sub_2462F9028(*v10, v14);
          v15 = v12;
          if ((_DWORD)result)
          {
            v13[1] = *v13;
            v15 = v4;
            if (v13 != v4)
            {
              v16 = v11;
              while (1)
              {
                v15 = (unsigned __int16 **)((char *)v4 + v16);
                result = (unsigned __int16 **)sub_2462F9028(*v10, *(unsigned __int16 **)((char *)v4 + v16 - 8));
                if (!(_DWORD)result)
                  break;
                *v15 = *(v15 - 1);
                v16 -= 8;
                if (!v16)
                {
                  v15 = v4;
                  break;
                }
              }
            }
          }
          v17 = *v10++;
          *v15 = v17;
          v11 += 8;
        }
        while (v10 != a2);
      }
    }
  }
  return result;
}

uint64_t sub_2462F956C(uint64_t result, unsigned __int16 **a2, unsigned __int16 **a3, uint64_t a4, uint64_t a5, unsigned __int16 **a6, uint64_t a7)
{
  uint64_t v9;
  unsigned __int16 **v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int16 **v17;
  unint64_t v18;
  unsigned __int16 **v19;
  unsigned __int16 **v20;
  unsigned __int16 **v21;
  unsigned __int16 *v22;
  unsigned __int16 **v23;
  uint64_t v24;
  unsigned __int16 **v25;
  unint64_t v26;
  unsigned __int16 **v27;
  unsigned __int16 **v28;
  unsigned __int16 *v29;
  _BOOL4 v30;
  unsigned __int16 **v31;
  unsigned __int16 **v32;
  uint64_t v33;
  uint64_t v34;
  unsigned __int16 *v35;
  uint64_t v36;
  uint64_t v37;
  int64_t v39;
  uint64_t v40;
  unsigned __int16 **v41;
  size_t v42;
  uint64_t v43;
  uint64_t v44;
  unsigned __int16 *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unsigned __int16 **v51;
  unsigned __int16 *v52;
  unsigned __int16 *v53;
  unsigned __int16 **v54;
  unsigned __int16 **v55;
  unsigned __int16 **v56;
  BOOL v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unsigned __int16 **v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unsigned __int16 **v68;
  unsigned __int16 **v69;
  unsigned __int16 **v70;
  uint64_t v71;
  unsigned __int16 **v72;
  unsigned __int16 **v73;
  unsigned __int16 *v74;
  uint64_t v75;
  uint64_t v76;
  unsigned __int16 **v77;
  unsigned __int16 **v78;
  unsigned __int16 **v79;
  unsigned __int16 *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unsigned __int16 *v84;

  if (a5)
  {
    v9 = a5;
    v12 = (unsigned __int16 **)result;
    while (a4 > a7 && v9 > a7)
    {
      if (!a4)
        return result;
      v13 = 0;
      v14 = 0;
      while (1)
      {
        result = sub_2462F9028(*a2, v12[v14]);
        if ((result & 1) != 0)
          break;
        ++v14;
        v13 -= 8;
        if (a4 == v14)
          return result;
      }
      result = (uint64_t)&v12[v13 / 0xFFFFFFFFFFFFFFF8];
      if (a4 - v14 >= v9)
      {
        if (a4 - 1 == v14)
        {
          v74 = v12[v14];
          v12[v14] = *a2;
          *a2 = v74;
          return result;
        }
        v24 = (a4 - v14) / 2;
        v25 = &v12[v24];
        if (a3 == a2)
        {
          v31 = a3;
          v17 = a3;
        }
        else
        {
          v79 = &v12[v13 / 0xFFFFFFFFFFFFFFF8];
          v82 = a7;
          v26 = a3 - a2;
          v17 = a2;
          do
          {
            v27 = &v17[v26 >> 1];
            v29 = *v27;
            v28 = v27 + 1;
            v30 = sub_2462F9028(v29, v25[v14]);
            if (v30)
              v26 += ~(v26 >> 1);
            else
              v26 >>= 1;
            if (v30)
              v17 = v28;
          }
          while (v26);
          v31 = a2;
          result = (uint64_t)v79;
          a7 = v82;
          v24 = (a4 - v14) / 2;
        }
        v19 = &v25[v13 / 0xFFFFFFFFFFFFFFF8];
        v16 = v17 - v31;
      }
      else
      {
        if (v9 >= 0)
          v15 = v9;
        else
          v15 = v9 + 1;
        v16 = v15 >> 1;
        v17 = &a2[v15 >> 1];
        if ((unsigned __int16 **)result == a2)
        {
          v19 = a2;
          v23 = a2;
        }
        else
        {
          v76 = v15 >> 1;
          v77 = a6;
          v78 = &v12[v13 / 0xFFFFFFFFFFFFFFF8];
          v18 = (uint64_t)((char *)a2 - (char *)v12 + v13) >> 3;
          v19 = (unsigned __int16 **)result;
          do
          {
            v20 = &v19[v18 >> 1];
            v22 = *v20;
            v21 = v20 + 1;
            if (sub_2462F9028(*v17, v22))
            {
              v18 >>= 1;
            }
            else
            {
              v19 = v21;
              v18 += ~(v18 >> 1);
            }
          }
          while (v18);
          a6 = v77;
          result = (uint64_t)v78;
          v23 = v78;
          v16 = v76;
        }
        v24 = v19 - v23;
      }
      v32 = v17;
      if (v19 != a2)
      {
        v32 = v19;
        if (a2 != v17)
        {
          if (v19 + 1 == a2)
          {
            v80 = *v19;
            v83 = a7;
            v39 = (char *)v17 - (char *)a2;
            v40 = result;
            v41 = a2;
            v42 = (char *)v17 - (char *)a2;
            v43 = v16;
            v44 = v24;
            memmove(v19, v41, v42);
            v24 = v44;
            v16 = v43;
            result = v40;
            v32 = (unsigned __int16 **)((char *)v19 + v39);
            a7 = v83;
            *v32 = v80;
          }
          else if (a2 + 1 == v17)
          {
            v45 = *(v17 - 1);
            v32 = v19 + 1;
            if (v17 - 1 != v19)
            {
              v81 = result;
              v84 = *(v17 - 1);
              v46 = v16;
              v47 = v24;
              memmove(v19 + 1, v19, (char *)(v17 - 1) - (char *)v19);
              result = v81;
              v45 = v84;
              v24 = v47;
              v16 = v46;
            }
            *v19 = v45;
          }
          else
          {
            v33 = a2 - v19;
            if (v33 == v17 - a2)
            {
              v34 = 0;
              do
              {
                v35 = v19[v34];
                v19[v34] = a2[v34];
                v36 = (uint64_t)&v19[v34 + 1];
                a2[v34] = v35;
                v37 = (uint64_t)&a2[++v34];
              }
              while ((unsigned __int16 **)v36 != a2 && v37 != (_QWORD)v17);
              v32 = a2;
            }
            else
            {
              v48 = v17 - a2;
              v49 = a2 - v19;
              do
              {
                v50 = v49;
                v49 = v48;
                v48 = v50 % v48;
              }
              while (v48);
              if (v49)
              {
                v51 = &v19[v49];
                do
                {
                  v53 = *--v51;
                  v52 = v53;
                  v54 = &v51[v33];
                  v55 = v51;
                  do
                  {
                    v56 = v55;
                    v55 = v54;
                    *v56 = *v54;
                    v57 = __OFSUB__(v33, v17 - v54);
                    v59 = v33 - (v17 - v54);
                    v58 = (v59 < 0) ^ v57;
                    v54 = &v19[v59];
                    if (v58)
                      v54 = &v55[v33];
                  }
                  while (v54 != v51);
                  *v55 = v52;
                }
                while (v51 != v19);
              }
              v32 = &v19[v17 - a2];
            }
          }
        }
      }
      v60 = a4 - v24 - v14;
      v61 = v9 - v16;
      if (v24 + v16 >= v9 + a4 - (v24 + v16) - v14)
      {
        v63 = result;
        v64 = v24;
        v65 = v60;
        v66 = v16;
        result = sub_2462F956C(v32, v17, a3, v65, v61, a6, a7);
        v62 = (unsigned __int16 **)v63;
        v17 = v19;
        v61 = v66;
        v60 = v64;
        a3 = v32;
      }
      else
      {
        result = sub_2462F956C(result, v19, v32, v24, v16, a6, a7);
        v62 = v32;
      }
      a4 = v60;
      v9 = v61;
      v12 = v62;
      a2 = v17;
      if (!v61)
        return result;
    }
    if (a4 <= v9)
    {
      if (v12 != a2)
      {
        v71 = 0;
        do
        {
          a6[v71] = v12[v71];
          ++v71;
        }
        while (&v12[v71] != a2);
        if (v71 * 8)
        {
          v72 = a6;
          while (a2 != a3)
          {
            result = sub_2462F9028(*a2, *v72);
            if ((_DWORD)result)
              v73 = a2;
            else
              v73 = v72;
            v72 += result ^ 1;
            a2 += result;
            *v12++ = *v73;
            if (&a6[v71] == v72)
              return result;
          }
          return (uint64_t)memmove(v12, v72, (char *)a6 - (char *)v72 + v71 * 8);
        }
      }
    }
    else if (a2 != a3)
    {
      v67 = 0;
      do
      {
        a6[v67] = a2[v67];
        ++v67;
      }
      while (&a2[v67] != a3);
      if (v67 * 8)
      {
        v68 = &a6[v67];
        v69 = a3 - 1;
        while (a2 != v12)
        {
          result = sub_2462F9028(*(v68 - 1), *(a2 - 1));
          if ((_DWORD)result)
            v70 = a2;
          else
            v70 = v68;
          if ((_DWORD)result)
            --a2;
          else
            --v68;
          *v69-- = *(v70 - 1);
          if (v68 == a6)
            return result;
        }
        v75 = 0;
        do
        {
          v69[v75] = v68[v75 - 1];
          --v75;
        }
        while (&v68[v75] != a6);
      }
    }
  }
  return result;
}

void sub_2462F9A98(void **a1, unint64_t a2)
{
  int64_t v3;
  char *v4;
  char *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  int v11;

  if (a2 > ((_BYTE *)a1[2] - (_BYTE *)*a1) >> 2)
  {
    v3 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v4 = (char *)sub_2462E00E4(a2);
    v5 = &v4[v3 & 0xFFFFFFFFFFFFFFFCLL];
    v7 = &v4[4 * v6];
    v8 = (char *)*a1;
    v9 = (char *)a1[1];
    v10 = v5;
    if (v9 != *a1)
    {
      v10 = v5;
      do
      {
        v11 = *((_DWORD *)v9 - 1);
        v9 -= 4;
        *((_DWORD *)v10 - 1) = v11;
        v10 -= 4;
      }
      while (v9 != v8);
    }
    *a1 = v10;
    a1[1] = v5;
    a1[2] = v7;
    if (v8)
      operator delete(v8);
  }
}

void sub_2462F9B20(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  _DWORD *v5;
  _DWORD *v6;
  _DWORD *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  BOOL v11;
  unint64_t v12;
  uint64_t v13;
  _DWORD *v14;
  unint64_t v15;
  int v16;
  uint64_t v17;
  unint64_t i;
  float v19;
  float v20;
  float v21;
  unsigned int v22;
  float v23;
  float v24;
  float v25;
  int v26;
  unint64_t v27;
  _DWORD *v28;
  _DWORD *v29;
  _DWORD *v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  _DWORD *v36;
  _DWORD *v37;
  _DWORD *v38;
  _DWORD *v39;
  int v40;
  _DWORD *v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  int v47;

  v5 = *(_DWORD **)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 16);
  if ((unint64_t)v5 >= v4)
  {
    v7 = *(_DWORD **)a2;
    v8 = ((uint64_t)v5 - *(_QWORD *)a2) >> 2;
    v9 = v8 + 1;
    if ((unint64_t)(v8 + 1) >> 62)
LABEL_53:
      sub_2462D357C();
    v10 = v4 - (_QWORD)v7;
    if (v10 >> 1 > v9)
      v9 = v10 >> 1;
    v11 = (unint64_t)v10 >= 0x7FFFFFFFFFFFFFFCLL;
    v12 = 0x3FFFFFFFFFFFFFFFLL;
    if (!v11)
      v12 = v9;
    if (v12)
    {
      v12 = (unint64_t)sub_2462E00E4(v12);
      v7 = *(_DWORD **)a2;
      v5 = *(_DWORD **)(a2 + 8);
    }
    else
    {
      v13 = 0;
    }
    v14 = (_DWORD *)(v12 + 4 * v8);
    v15 = v12 + 4 * v13;
    *v14 = 0;
    v6 = v14 + 1;
    while (v5 != v7)
    {
      v16 = *--v5;
      *--v14 = v16;
    }
    *(_QWORD *)a2 = v14;
    *(_QWORD *)(a2 + 8) = v6;
    *(_QWORD *)(a2 + 16) = v15;
    if (v7)
      operator delete(v7);
  }
  else
  {
    *v5 = 0;
    v6 = v5 + 1;
  }
  *(_QWORD *)(a2 + 8) = v6;
  if (*(_DWORD *)(a1 + 56) >= 2u)
  {
    v17 = 0;
    for (i = 1; i < *(unsigned int *)(a1 + 56); ++i)
    {
      skit::SpanMatchV3::score((skit::SpanMatchV3 *)(*(_QWORD *)(a1 + 48) + (i << 6)));
      v20 = v19;
      skit::SpanMatchV3::score((skit::SpanMatchV3 *)(*(_QWORD *)(a1 + 48) + (v17 << 6)));
      if (v20 > v21
        && (v22 = skit::SpanMatchV3::edit_dist((skit::SpanMatchV3 *)(*(_QWORD *)(a1 + 48) + (i << 6))),
            v22 <= skit::SpanMatchV3::edit_dist((skit::SpanMatchV3 *)(*(_QWORD *)(a1 + 48) + (v17 << 6)))))
      {
        v30 = *(_DWORD **)a2;
        *(_QWORD *)(a2 + 8) = *(_QWORD *)a2;
        v31 = *(_QWORD *)(a2 + 16);
        if ((unint64_t)v30 >= v31)
        {
          v32 = v31 - (_QWORD)v30;
          v33 = v32 >> 1;
          if ((unint64_t)(v32 >> 1) <= 1)
            v33 = 1;
          if ((unint64_t)v32 >= 0x7FFFFFFFFFFFFFFCLL)
            v34 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v34 = v33;
          v36 = sub_2462E00E4(v34);
          v37 = *(_DWORD **)a2;
          v38 = *(_DWORD **)(a2 + 8);
          *v36 = i;
          v29 = v36 + 1;
          v39 = v36;
          while (v38 != v37)
          {
            v40 = *--v38;
            *--v39 = v40;
          }
          v41 = &v36[v35];
          v17 = i;
LABEL_48:
          *(_QWORD *)a2 = v39;
          *(_QWORD *)(a2 + 8) = v29;
          *(_QWORD *)(a2 + 16) = v41;
          if (v37)
            operator delete(v37);
          goto LABEL_50;
        }
        v17 = i;
        *v30 = i;
        v29 = v30 + 1;
      }
      else
      {
        skit::SpanMatchV3::score((skit::SpanMatchV3 *)(*(_QWORD *)(a1 + 48) + (i << 6)));
        v24 = v23;
        skit::SpanMatchV3::score((skit::SpanMatchV3 *)(*(_QWORD *)(a1 + 48) + (v17 << 6)));
        if (v24 != v25)
          continue;
        v26 = skit::SpanMatchV3::edit_dist((skit::SpanMatchV3 *)(*(_QWORD *)(a1 + 48) + (i << 6)));
        if (v26 != skit::SpanMatchV3::edit_dist((skit::SpanMatchV3 *)(*(_QWORD *)(a1 + 48) + (v17 << 6))))
          continue;
        v28 = *(_DWORD **)(a2 + 8);
        v27 = *(_QWORD *)(a2 + 16);
        if ((unint64_t)v28 >= v27)
        {
          v37 = *(_DWORD **)a2;
          v42 = ((uint64_t)v28 - *(_QWORD *)a2) >> 2;
          v43 = v42 + 1;
          if ((unint64_t)(v42 + 1) >> 62)
            goto LABEL_53;
          v44 = v27 - (_QWORD)v37;
          if (v44 >> 1 > v43)
            v43 = v44 >> 1;
          if ((unint64_t)v44 >= 0x7FFFFFFFFFFFFFFCLL)
            v45 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v45 = v43;
          if (v45)
          {
            v45 = (unint64_t)sub_2462E00E4(v45);
            v37 = *(_DWORD **)a2;
            v28 = *(_DWORD **)(a2 + 8);
          }
          else
          {
            v46 = 0;
          }
          v39 = (_DWORD *)(v45 + 4 * v42);
          *v39 = i;
          v29 = v39 + 1;
          while (v28 != v37)
          {
            v47 = *--v28;
            *--v39 = v47;
          }
          v41 = (_DWORD *)(v45 + 4 * v46);
          goto LABEL_48;
        }
        *v28 = i;
        v29 = v28 + 1;
      }
LABEL_50:
      *(_QWORD *)(a2 + 8) = v29;
    }
  }
}

uint64_t sub_2462F9DD0(uint64_t a1, unsigned int *a2, uint64_t a3)
{
  uint64_t *v6;
  __int128 v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  int v14;
  unsigned int v15;
  int *v16;
  uint64_t v17;
  int v18;
  unsigned int v19;
  int *v20;
  int v21;
  unsigned int v22;

  v6 = sub_2462F9F0C((uint64_t *)a1, *(_QWORD *)a3, *(_QWORD *)a3 + 112 * *(unsigned int *)(a3 + 8)) + 58;
  if (*(char *)(a3 + 487) < 0)
  {
    sub_2462D7540(v6, *(void **)(a3 + 464), *(_QWORD *)(a3 + 472));
  }
  else
  {
    v7 = *(_OWORD *)(a3 + 464);
    v6[2] = *(_QWORD *)(a3 + 480);
    *(_OWORD *)v6 = v7;
  }
  sub_2462FA090(a1 + 488, (__int128 *)(a3 + 488));
  v8 = *(unsigned int *)(a3 + 8);
  if ((_DWORD)v8)
  {
    v9 = 0;
    v10 = *(_QWORD *)a3;
    v11 = 112 * v8;
    v12 = (int *)(*(_QWORD *)a3 + 32);
    v13 = v11;
    do
    {
      v14 = *v12;
      v12 += 28;
      v9 += v14;
      v13 -= 112;
    }
    while (v13);
    v15 = 0;
    if (*a2 > v9)
      v9 = *a2;
    *(_DWORD *)(a1 + 552) = v9;
    v16 = (int *)(v10 + 36);
    v17 = v11;
    do
    {
      v18 = *v16;
      v16 += 28;
      v15 += v18;
      v17 -= 112;
    }
    while (v17);
    v19 = 0;
    if (a2[1] > v15)
      v15 = a2[1];
    *(_DWORD *)(a1 + 556) = v15;
    v20 = (int *)(v10 + 44);
    do
    {
      v21 = *v20;
      v20 += 28;
      v19 += v21;
      v11 -= 112;
    }
    while (v11);
  }
  else
  {
    v19 = 0;
    *(_DWORD *)(a1 + 552) = *a2;
    *(_DWORD *)(a1 + 556) = a2[1];
  }
  v22 = a2[3];
  if (v22 <= v19)
    v22 = v19;
  *(_DWORD *)(a1 + 560) = v22;
  return a1;
}

void sub_2462F9EF8(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_2462D39A4(v1);
  _Unwind_Resume(a1);
}

uint64_t *sub_2462F9F0C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  unsigned int v6;
  void *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  void **v13;
  __int128 v14;
  std::bad_alloc *exception;
  std::bad_alloc *v17;

  v6 = -1227133513 * ((a3 - a2) >> 4);
  if (v6 < 5)
  {
    v9 = a1 + 2;
    *a1 = (uint64_t)(a1 + 2);
    LODWORD(v8) = 4;
  }
  else
  {
    v7 = malloc_type_malloc(0xFFFFFFE000000010 * ((a3 - a2) >> 4), 0x1032040567AB6A7uLL);
    if (!v7)
    {
      exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
      v17 = std::bad_alloc::bad_alloc(exception);
      __cxa_throw(v17, MEMORY[0x24BEDB758], MEMORY[0x24BEDB670]);
    }
    *a1 = (uint64_t)v7;
    v8 = ((malloc_size(v7) >> 4) * (unsigned __int128)0x2492492492492493uLL) >> 64;
    v9 = (uint64_t *)*a1;
  }
  *((_DWORD *)a1 + 2) = v6;
  *((_DWORD *)a1 + 3) = v8;
  if (a2 != a3)
  {
    v10 = 0;
    do
    {
      v11 = a2 + v10 * 8;
      LOWORD(v9[v10]) = *(_WORD *)(a2 + v10 * 8);
      v12 = &v9[v10 + 1];
      v13 = (void **)(a2 + v10 * 8 + 8);
      if (*(char *)(a2 + v10 * 8 + 31) < 0)
      {
        sub_2462D7540(v12, *v13, *(_QWORD *)(v11 + 16));
      }
      else
      {
        v14 = *(_OWORD *)v13;
        v9[v10 + 3] = *(_QWORD *)(a2 + v10 * 8 + 24);
        *(_OWORD *)v12 = v14;
      }
      *(_OWORD *)&v9[v10 + 4] = *(_OWORD *)(v11 + 32);
      sub_2462FA090((uint64_t)&v9[v10 + 6], (__int128 *)(a2 + v10 * 8 + 48));
      v10 += 14;
    }
    while (v11 + 112 != a3);
  }
  return a1;
}

void sub_2462FA058(void *a1)
{
  uint64_t v1;
  uint64_t v2;

  __cxa_begin_catch(a1);
  for (; v2; v2 -= 112)
  {
    sub_2462D39FC(v1);
    v1 += 112;
  }
  __cxa_rethrow();
}

void sub_2462FA07C(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t sub_2462FA090(uint64_t a1, __int128 *a2)
{
  __int128 v4;

  v4 = *a2;
  *(_OWORD *)(a1 + 12) = *(__int128 *)((char *)a2 + 12);
  *(_OWORD *)a1 = v4;
  sub_2462EBAB4(a1 + 32, *((char **)a2 + 4), (char *)(*((_QWORD *)a2 + 4) + 2 * *((unsigned int *)a2 + 10)));
  *(_DWORD *)(a1 + 56) = *((_DWORD *)a2 + 14);
  return a1;
}

uint64_t *sub_2462FA0E0(uint64_t *result, _QWORD *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = result;
  v5 = *result;
  v4 = result[1];
  v6 = a2[1];
  if (v4 != *result)
  {
    v7 = 0;
    do
    {
      v8 = v6 + v7;
      v9 = v4 + v7;
      sub_2462FA220(v6 + v7 - 568, v4 + v7 - 568);
      v10 = *(_OWORD *)(v4 + v7 - 104);
      *(_QWORD *)(v8 - 88) = *(_QWORD *)(v4 + v7 - 88);
      *(_OWORD *)(v8 - 104) = v10;
      *(_QWORD *)(v9 - 104) = 0;
      *(_QWORD *)(v9 - 96) = 0;
      *(_QWORD *)(v9 - 88) = 0;
      v11 = *(_OWORD *)(v4 + v7 - 80);
      *(_OWORD *)(v8 - 68) = *(_OWORD *)(v4 + v7 - 68);
      *(_OWORD *)(v8 - 80) = v11;
      result = (uint64_t *)sub_2462F8B64(v6 + v7 - 48, v4 + v7 - 48);
      *(_DWORD *)(v8 - 24) = *(_DWORD *)(v4 + v7 - 24);
      v12 = *(_QWORD *)(v4 + v7 - 16);
      *(_DWORD *)(v8 - 8) = *(_DWORD *)(v4 + v7 - 8);
      *(_QWORD *)(v8 - 16) = v12;
      v7 -= 568;
    }
    while (v4 + v7 != v5);
    v6 += v7;
  }
  a2[1] = v6;
  v13 = *v3;
  *v3 = v6;
  a2[1] = v13;
  v14 = v3[1];
  v3[1] = a2[2];
  a2[2] = v14;
  v15 = v3[2];
  v3[2] = a2[3];
  a2[3] = v15;
  *a2 = a2[1];
  return result;
}

void *sub_2462FA1D8(unint64_t a1)
{
  if (a1 >= 0x73615A240E6C2CLL)
    sub_2462D3488();
  return operator new(568 * a1);
}

uint64_t sub_2462FA220(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  _DWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v3 = result;
  if (*(_QWORD *)a2 == a2 + 16)
  {
    v5 = result + 16;
    *(_QWORD *)result = result + 16;
    v6 = *(unsigned int *)(a2 + 8);
    if ((_DWORD)v6)
    {
      v7 = *(_QWORD *)a2;
      v8 = *(_QWORD *)a2 + 112 * v6;
      v9 = *(_QWORD *)a2;
      do
      {
        *(_WORD *)v5 = *(_WORD *)v9;
        v10 = *(_OWORD *)(v9 + 8);
        *(_QWORD *)(v5 + 24) = *(_QWORD *)(v9 + 24);
        *(_OWORD *)(v5 + 8) = v10;
        *(_QWORD *)(v9 + 16) = 0;
        *(_QWORD *)(v9 + 24) = 0;
        *(_QWORD *)(v9 + 8) = 0;
        *(_OWORD *)(v5 + 32) = *(_OWORD *)(v9 + 32);
        v11 = *(_OWORD *)(v9 + 48);
        *(_OWORD *)(v5 + 60) = *(_OWORD *)(v9 + 60);
        *(_OWORD *)(v5 + 48) = v11;
        sub_2462F8B64(v5 + 80, v9 + 80);
        *(_DWORD *)(v5 + 104) = *(_DWORD *)(v9 + 104);
        v9 += 112;
        v5 += 112;
      }
      while (v9 != v8);
      v12 = 112 * v6;
      do
      {
        result = sub_2462D39FC(v7);
        v7 += 112;
        v12 -= 112;
      }
      while (v12);
    }
    v4 = (_DWORD *)(v3 + 12);
  }
  else
  {
    *(_QWORD *)result = *(_QWORD *)a2;
    v4 = (_DWORD *)(a2 + 12);
    *(_DWORD *)(result + 12) = *(_DWORD *)(a2 + 12);
    *(_QWORD *)a2 = a2 + 16;
  }
  *v4 = 4;
  *(_DWORD *)(v3 + 8) = *(_DWORD *)(a2 + 8);
  *(_DWORD *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_2462FA330(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 568;
    sub_2462D3960(i - 568);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t sub_2462FA37C(uint64_t *a1)
{
  uint64_t *v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t *v17;

  v2 = a1 + 3;
  v3 = a1[3];
  v4 = a1[2];
  if (v4 >= v3)
  {
    v7 = a1[1];
    v8 = 0x193D4BB7E327A977 * ((uint64_t)(v4 - v7) >> 3);
    if ((unint64_t)(v8 + 1) > 0x73615A240E6C2BLL)
      sub_2462D357C();
    v9 = 0x193D4BB7E327A977 * ((uint64_t)(v3 - v7) >> 3);
    v10 = 2 * v9;
    if (2 * v9 <= v8 + 1)
      v10 = v8 + 1;
    if (v9 >= 0x39B0AD12073615)
      v11 = 0x73615A240E6C2BLL;
    else
      v11 = v10;
    v17 = v2;
    if (v11)
      v11 = (unint64_t)sub_2462FA1D8(v11);
    else
      v12 = 0;
    v13 = v11;
    v14 = v11 + 568 * v8;
    v16 = v11 + 568 * v12;
    sub_2462FA4DC();
    v15 = v14 + 568;
    sub_2462FA0E0(a1 + 1, &v13);
    v6 = a1[2];
    result = sub_2462FA330((uint64_t)&v13);
  }
  else
  {
    result = sub_2462FA4DC();
    v6 = v4 + 568;
    a1[2] = v4 + 568;
  }
  a1[2] = v6;
  return result;
}

void sub_2462FA4BC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_2462FA330((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_2462FA4DC()
{
  uint64_t result;
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  uint64_t v6;
  int v7;
  int v8;
  int *v9;
  uint64_t v10;
  int v11;
  int v12;
  int *v13;
  int v14;

  result = skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>::MergedFieldMatchImpl();
  v1 = *(unsigned int *)(result + 8);
  if ((_DWORD)v1)
  {
    v2 = 0;
    v3 = *(_QWORD *)result;
    v4 = 112 * v1;
    v5 = (int *)(*(_QWORD *)result + 32);
    v6 = v4;
    do
    {
      v7 = *v5;
      v5 += 28;
      v2 += v7;
      v6 -= 112;
    }
    while (v6);
    v8 = 0;
    *(_DWORD *)(result + 552) = v2;
    v9 = (int *)(v3 + 36);
    v10 = v4;
    do
    {
      v11 = *v9;
      v9 += 28;
      v8 += v11;
      v10 -= 112;
    }
    while (v10);
    v12 = 0;
    *(_DWORD *)(result + 556) = v8;
    v13 = (int *)(v3 + 44);
    do
    {
      v14 = *v13;
      v13 += 28;
      v12 += v14;
      v4 -= 112;
    }
    while (v4);
  }
  else
  {
    v12 = 0;
    *(_QWORD *)(result + 552) = 0;
  }
  *(_DWORD *)(result + 560) = v12;
  return result;
}

char **sub_2462FA570(char **a1)
{
  char *v2;
  unsigned int v3;
  char *v4;
  uint64_t v5;
  char *v6;

  v2 = *a1;
  v3 = *((_DWORD *)a1 + 2);
  if (v3)
  {
    v4 = v2 + 536;
    v5 = 552 * v3;
    do
    {
      v6 = (char *)*((_QWORD *)v4 - 2);
      if (v4 != v6)
        free(v6);
      if (*(v4 - 49) < 0)
        operator delete(*((void **)v4 - 9));
      sub_2462D39A4((uint64_t)(v4 - 536));
      v4 += 552;
      v5 -= 552;
    }
    while (v5);
    v2 = *a1;
  }
  if (v2 != (char *)(a1 + 2))
    free(v2);
  return a1;
}

char **sub_2462FA5F8(char **a1)
{
  char *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *a1;
  v3 = *((unsigned int *)a1 + 2);
  if ((_DWORD)v3)
  {
    v4 = 320 * v3;
    do
    {
      sub_2462F8C74((uint64_t)v2);
      v2 += 320;
      v4 -= 320;
    }
    while (v4);
    v2 = *a1;
  }
  if (v2 != (char *)(a1 + 2))
    free(v2);
  return a1;
}

void sub_2462FA660(uint64_t a1, uint64_t a2)
{
  uint64_t i;
  void **v5;

  for (i = *(_QWORD *)(a1 + 8); i != a2; i -= 72)
  {
    v5 = (void **)(i - 24);
    sub_2462E710C(&v5);
    v5 = (void **)(i - 48);
    sub_2462D3760(&v5);
  }
  *(_QWORD *)(a1 + 8) = a2;
}

void sub_2462FA6D0(void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    sub_2462FA660((uint64_t)v2, (uint64_t)*v2);
    operator delete(**a1);
  }
}

id sub_2462FA710(void *a1, const char *a2)
{
  const char *v2;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v4[0] = 0;
  v4[1] = 0;
  objc_msgSend_getUUIDBytes_(a1, a2, (uint64_t)v4);
  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v2, (uint64_t)v4, 16);
  return (id)objc_claimAutoreleasedReturnValue();
}

id sub_2462FA778(void *a1, const char *a2, uint64_t a3)
{
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;

  objc_msgSend_sem_data(a1, a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_substringToIndex_(v5, v6, 22);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id sub_2462FA7CC(void *a1, const char *a2, void *a3)
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  void *v13;
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  void *v20;

  v4 = (void *)objc_msgSend_copy(a3, a2, (uint64_t)a3);
  v7 = v4;
  if (!v4)
    goto LABEL_7;
  if (objc_msgSend_length(v4, v5, v6) == 22)
  {
    objc_msgSend_stringByAppendingString_(v7, v8, (uint64_t)CFSTR("=="));
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v10;
  }
  if (objc_msgSend_length(v7, v8, v9) == 24)
  {
    v11 = objc_alloc(MEMORY[0x24BDBCE50]);
    v13 = (void *)objc_msgSend_initWithBase64EncodedString_options_(v11, v12, (uint64_t)v7, 0);
    if (v13)
    {
      v14 = a1;
      v15 = objc_retainAutorelease(v13);
      v18 = objc_msgSend_bytes(v15, v16, v17);
      v20 = (void *)objc_msgSend_initWithUUIDBytes_(v14, v19, v18);
    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
LABEL_7:
    v20 = 0;
  }

  return v20;
}

void sub_2462FAA80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2462FAAE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2462FABFC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2462FAC7C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2462FAE28(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2462FAFA4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2462FB1C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18, void *a19, void *a20,void *a21)
{
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;

  _Unwind_Resume(a1);
}

void sub_2462FB238()
{
  JUMPOUT(0x2462FB200);
}

void sub_2462FB240()
{
  JUMPOUT(0x2462FB208);
}

void sub_2462FB248()
{
  JUMPOUT(0x2462FB210);
}

void sub_2462FB250()
{
  JUMPOUT(0x2462FB218);
}

void sub_2462FB258()
{
  JUMPOUT(0x2462FB220);
}

void sub_2462FB260()
{
  JUMPOUT(0x2462FB228);
}

void sub_2462FB490(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2462FB674(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2462FB7A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2462FBE88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2462FBEE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2462FC19C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2462FC33C(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_2462FC4BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2462FC664(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2462FC7A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2462FC900(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_2462FC964(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2462FCD80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *__p,uint64_t a36,int a37,__int16 a38,char a39,char a40)
{
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;

  if (*(char *)(v44 - 121) < 0)
    operator delete(*(void **)(v44 - 144));

  _Unwind_Resume(a1);
}

void sub_2462FCEA8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2462FD29C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,char a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,char a29)
{
  void *v29;
  void *v30;

  _Unwind_Resume(a1);
}

_QWORD *sub_2462FD438(_QWORD *result)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t i;

  if (result[3])
  {
    v1 = result;
    result = (_QWORD *)result[2];
    if (result)
    {
      do
      {
        v2 = (_QWORD *)*result;
        operator delete(result);
        result = v2;
      }
      while (v2);
    }
    v1[2] = 0;
    v3 = v1[1];
    if (v3)
    {
      for (i = 0; i != v3; ++i)
        *(_QWORD *)(*v1 + 8 * i) = 0;
    }
    v1[3] = 0;
  }
  return result;
}

void sub_2462FD49C(float *a1, unsigned __int16 a2, __int16 a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  uint64_t ***v9;
  uint64_t **i;
  unint64_t v11;
  _QWORD *v12;
  float v13;
  float v14;
  _BOOL8 v15;
  unint64_t v16;
  unint64_t v17;
  int8x8_t prime;
  void *v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  unint64_t v23;
  uint8x8_t v24;
  unint64_t v25;
  uint8x8_t v26;
  uint64_t v27;
  _QWORD *v28;
  unint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  unint64_t v32;
  _QWORD *v33;

  v6 = a2;
  v7 = *((_QWORD *)a1 + 1);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v3 = a2;
      if (v7 <= a2)
        v3 = a2 % v7;
    }
    else
    {
      v3 = ((_DWORD)v7 - 1) & a2;
    }
    v9 = *(uint64_t ****)(*(_QWORD *)a1 + 8 * v3);
    if (v9)
    {
      for (i = *v9; i; i = (uint64_t **)*i)
      {
        v11 = (unint64_t)i[1];
        if (v11 == a2)
        {
          if (*((unsigned __int16 *)i + 8) == a2)
            return;
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7)
              v11 %= v7;
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v3)
            break;
        }
      }
    }
  }
  v12 = operator new(0x18uLL);
  *v12 = 0;
  v12[1] = v6;
  *((_WORD *)v12 + 8) = a3;
  v13 = (float)(unint64_t)(*((_QWORD *)a1 + 3) + 1);
  v14 = a1[8];
  if (!v7 || (float)(v14 * (float)v7) < v13)
  {
    v15 = 1;
    if (v7 >= 3)
      v15 = (v7 & (v7 - 1)) != 0;
    v16 = v15 | (2 * v7);
    v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17)
      prime = (int8x8_t)v17;
    else
      prime = (int8x8_t)v16;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      v7 = *((_QWORD *)a1 + 1);
    }
    if (*(_QWORD *)&prime > v7)
      goto LABEL_30;
    if (*(_QWORD *)&prime < v7)
    {
      v25 = vcvtps_u32_f32((float)*((unint64_t *)a1 + 3) / a1[8]);
      if (v7 < 3 || (v26 = (uint8x8_t)vcnt_s8((int8x8_t)v7), v26.i16[0] = vaddlv_u8(v26), v26.u32[0] > 1uLL))
      {
        v25 = std::__next_prime(v25);
      }
      else
      {
        v27 = 1 << -(char)__clz(v25 - 1);
        if (v25 >= 2)
          v25 = v27;
      }
      if (*(_QWORD *)&prime <= v25)
        prime = (int8x8_t)v25;
      if (*(_QWORD *)&prime >= v7)
      {
        v7 = *((_QWORD *)a1 + 1);
      }
      else
      {
        if (prime)
        {
LABEL_30:
          if (*(_QWORD *)&prime >> 61)
            sub_2462D3488();
          v19 = operator new(8 * *(_QWORD *)&prime);
          v20 = *(_QWORD **)a1;
          *(_QWORD *)a1 = v19;
          if (v20)
            operator delete(v20);
          v21 = 0;
          *((int8x8_t *)a1 + 1) = prime;
          do
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v21++) = 0;
          while (*(_QWORD *)&prime != v21);
          v22 = (_QWORD *)*((_QWORD *)a1 + 2);
          if (v22)
          {
            v23 = v22[1];
            v24 = (uint8x8_t)vcnt_s8(prime);
            v24.i16[0] = vaddlv_u8(v24);
            if (v24.u32[0] > 1uLL)
            {
              if (v23 >= *(_QWORD *)&prime)
                v23 %= *(_QWORD *)&prime;
            }
            else
            {
              v23 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v23) = a1 + 4;
            v28 = (_QWORD *)*v22;
            if (*v22)
            {
              do
              {
                v29 = v28[1];
                if (v24.u32[0] > 1uLL)
                {
                  if (v29 >= *(_QWORD *)&prime)
                    v29 %= *(_QWORD *)&prime;
                }
                else
                {
                  v29 &= *(_QWORD *)&prime - 1;
                }
                if (v29 != v23)
                {
                  if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v29))
                  {
                    *(_QWORD *)(*(_QWORD *)a1 + 8 * v29) = v22;
                    goto LABEL_55;
                  }
                  *v22 = *v28;
                  *v28 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v29);
                  **(_QWORD **)(*(_QWORD *)a1 + 8 * v29) = v28;
                  v28 = v22;
                }
                v29 = v23;
LABEL_55:
                v22 = v28;
                v28 = (_QWORD *)*v28;
                v23 = v29;
              }
              while (v28);
            }
          }
          v7 = (unint64_t)prime;
          goto LABEL_59;
        }
        v33 = *(_QWORD **)a1;
        *(_QWORD *)a1 = 0;
        if (v33)
          operator delete(v33);
        v7 = 0;
        *((_QWORD *)a1 + 1) = 0;
      }
    }
LABEL_59:
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6)
        v3 = v6 % v7;
      else
        v3 = v6;
    }
    else
    {
      v3 = ((_DWORD)v7 - 1) & v6;
    }
  }
  v30 = *(_QWORD **)a1;
  v31 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v31)
  {
    *v12 = *v31;
LABEL_72:
    *v31 = v12;
    goto LABEL_73;
  }
  *v12 = *((_QWORD *)a1 + 2);
  *((_QWORD *)a1 + 2) = v12;
  v30[v3] = a1 + 4;
  if (*v12)
  {
    v32 = *(_QWORD *)(*v12 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v32 >= v7)
        v32 %= v7;
    }
    else
    {
      v32 &= v7 - 1;
    }
    v31 = (_QWORD *)(*(_QWORD *)a1 + 8 * v32);
    goto LABEL_72;
  }
LABEL_73:
  ++*((_QWORD *)a1 + 3);
}

void sub_2462FD86C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

__n128 sub_2462FD880(uint64_t a1, __int128 *a2)
{
  uint64_t v4;
  __int128 v5;
  __n128 result;

  v4 = *(_QWORD *)(a1 + 8);
  if (*((char *)a2 + 23) < 0)
  {
    sub_2462D7540(*(_BYTE **)(a1 + 8), *(void **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v5 = *a2;
    *(_QWORD *)(v4 + 16) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v4 = v5;
  }
  result = *(__n128 *)((char *)a2 + 24);
  *(_QWORD *)(v4 + 40) = *((_QWORD *)a2 + 5);
  *(__n128 *)(v4 + 24) = result;
  *(_QWORD *)(a1 + 8) = v4 + 48;
  return result;
}

void sub_2462FD8EC(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t sub_2462FD8F4(uint64_t *a1, __int128 *a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  __int128 v12;
  char *v13;
  __int128 v14;
  uint64_t v15;
  _QWORD v17[2];
  char *v18;
  char *v19;
  uint64_t *v20;

  v3 = *a1;
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 4);
  v5 = v4 + 1;
  if (v4 + 1 > 0x555555555555555)
    sub_2462D357C();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 4);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x2AAAAAAAAAAAAAALL)
    v9 = 0x555555555555555;
  else
    v9 = v5;
  v20 = a1 + 2;
  if (v9)
    v10 = (char *)sub_2462D7644(v7, v9);
  else
    v10 = 0;
  v11 = &v10[48 * v4];
  v17[0] = v10;
  v17[1] = v11;
  v18 = v11;
  v19 = &v10[48 * v9];
  if (*((char *)a2 + 23) < 0)
  {
    sub_2462D7540(v11, *(void **)a2, *((_QWORD *)a2 + 1));
    v11 = v18;
  }
  else
  {
    v12 = *a2;
    *((_QWORD *)v11 + 2) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v11 = v12;
  }
  v13 = &v10[48 * v4];
  v14 = *(__int128 *)((char *)a2 + 24);
  *((_QWORD *)v13 + 5) = *((_QWORD *)a2 + 5);
  *(_OWORD *)(v13 + 24) = v14;
  v18 = v11 + 48;
  sub_2462D75D0(a1, v17);
  v15 = a1[1];
  sub_2462D77AC((uint64_t)v17);
  return v15;
}

void sub_2462FDA18(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_2462D77AC((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t **sub_2462FDA2C(_QWORD *a1, unsigned __int16 a2)
{
  unint64_t v2;
  uint8x8_t v3;
  unint64_t v4;
  uint64_t ***v5;
  uint64_t **result;
  unint64_t v7;

  v2 = a1[1];
  if (!v2)
    return 0;
  v3 = (uint8x8_t)vcnt_s8((int8x8_t)v2);
  v3.i16[0] = vaddlv_u8(v3);
  if (v3.u32[0] > 1uLL)
  {
    v4 = a2;
    if (v2 <= a2)
      v4 = a2 % v2;
  }
  else
  {
    v4 = ((_DWORD)v2 - 1) & a2;
  }
  v5 = *(uint64_t ****)(*a1 + 8 * v4);
  if (!v5)
    return 0;
  for (result = *v5; result; result = (uint64_t **)*result)
  {
    v7 = (unint64_t)result[1];
    if (v7 == a2)
    {
      if (*((unsigned __int16 *)result + 8) == a2)
        return result;
    }
    else
    {
      if (v3.u32[0] > 1uLL)
      {
        if (v7 >= v2)
          v7 %= v2;
      }
      else
      {
        v7 &= v2 - 1;
      }
      if (v7 != v4)
        return 0;
    }
  }
  return result;
}

void sub_2462FDAE0(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_251782D08;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_2462FDAF0(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_251782D08;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x249556DC8);
}

void sub_2462FDB20(uint64_t a1)
{
  void **v2;

  sub_2462D3524(a1 + 192);
  sub_2462DBA68(a1 + 152);
  sub_2462DBA68(a1 + 112);
  if (*(char *)(a1 + 103) < 0)
    operator delete(*(void **)(a1 + 80));

  v2 = (void **)(a1 + 48);
  sub_2462D3760(&v2);
  v2 = (void **)(a1 + 24);
  sub_2462D3760(&v2);
}

id SEMAppCustomVocabularyTypeToNumber(unsigned int a1, const char *a2)
{
  if (a1 - 1 >= 2)
    objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], a2, 0);
  else
    objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], a2, a1);
  return (id)objc_claimAutoreleasedReturnValue();
}

BOOL SEMAppCustomVocabularyTypeIsValid(int a1)
{
  return (a1 - 1) < 2;
}

uint64_t SEMAppCustomVocabularyTypeFromNumber(void *a1, const char *a2, uint64_t a3)
{
  unsigned int v3;

  v3 = (unsigned __int16)objc_msgSend_integerValue(a1, a2, a3);
  if (v3 - 1 >= 2)
    return 0;
  else
    return v3;
}

__CFString *sub_2462FF088(uint64_t a1, const char *a2)
{
  __CFString *v2;
  void *v3;
  void *v4;
  const char *v5;

  if (a1 >= 4)
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], a2, a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v3, v5, (uint64_t)CFSTR("%@"), v4);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = off_251782D48[(char)a1];
  }
  return v2;
}

void sub_2462FF47C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2462FF494(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_2462FF4A4(uint64_t a1)
{

}

void sub_2462FF4AC(uint64_t a1, void *a2)
{
  const char *v3;
  id v4;

  v4 = a2;
  if (AFOfflineDictationStatusStringIsInstalled())
    objc_msgSend_addObject_(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v3, (uint64_t)v4);

}

id sub_2462FF658(char a1)
{
  id v2;
  const char *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = v2;
  if ((a1 & 1) != 0)
    objc_msgSend_addObject_(v2, v3, (uint64_t)CFSTR("PrefixMatching"));
  if ((a1 & 2) != 0)
    objc_msgSend_addObject_(v4, v3, (uint64_t)CFSTR("DiacriticsStripping"));
  if ((a1 & 4) != 0)
    objc_msgSend_addObject_(v4, v3, (uint64_t)CFSTR("PhoneticSearch"));
  if ((a1 & 8) != 0)
    objc_msgSend_addObject_(v4, v3, (uint64_t)CFSTR("TokenLemmatization"));
  objc_msgSend_componentsJoinedByString_(v4, v3, (uint64_t)CFSTR("|"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void sub_2462FF6F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2462FFB40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *__p,uint64_t a28,int a29,__int16 a30,char a31,char a32,uint64_t a33,void *a34,uint64_t a35,int a36,__int16 a37,char a38,char a39)
{
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;

  if (a32 < 0)
    operator delete(__p);
  if (a39 < 0)
    operator delete(a34);
  if (*(char *)(v44 - 105) < 0)
    operator delete(*(void **)(v44 - 128));
  MEMORY[0x249556DC8](v43, 0x1032C40E2FF2C5FLL);
  if (a16 < 0)
    operator delete(a11);
  if (a22 < 0)
    operator delete(a17);

  _Unwind_Resume(a1);
}

void sub_2462FFC58(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t sub_2462FFD70(uint64_t a1)
{
  return skit::IndexWriter::start_txn((skit::IndexWriter *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) + 16));
}

void sub_2462FFF70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2462FFF88(uint64_t a1)
{
  skit::IndexWriter *v2;
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  char v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  unint64_t v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  int v15;
  const char *v16;
  __int16 v17;
  unsigned int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  unsigned int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = (skit::IndexWriter *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) + 16);
  v3 = skit::IndexWriter::segment_cnt(v2);
  if (v3 < 0x14)
    goto LABEL_9;
  v4 = v3;
  if (v3 >= 0xC9)
  {
    v5 = qword_25441F958;
    v6 = 1;
    if (os_log_type_enabled((os_log_t)qword_25441F958, OS_LOG_TYPE_INFO))
    {
      v15 = 136315650;
      v16 = "should_auto_merge";
      v17 = 1024;
      v18 = v4;
      v19 = 1024;
      v20 = 200;
      v7 = "%s Index segment count (%u) exceeds maximum threshold (%u)";
      v8 = v5;
      v9 = 24;
LABEL_8:
      _os_log_impl(&dword_2462C4000, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v15, v9);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  v10 = (unint64_t)((double)(unint64_t)skit::IndexWriter::flush_threshold(v2) * 0.25);
  v11 = skit::IndexWriter::index_count_threshold(v2);
  if (v4 >> 1 >= v11)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  v12 = v11;
  v13 = qword_25441F958;
  v6 = 1;
  if (os_log_type_enabled((os_log_t)qword_25441F958, OS_LOG_TYPE_INFO))
  {
    v15 = 136316162;
    v16 = "should_auto_merge";
    v17 = 1024;
    v18 = v12;
    v19 = 1024;
    v20 = v4;
    v21 = 2048;
    v22 = v10;
    v23 = 1024;
    v24 = v4 >> 1;
    v7 = "%s Index has %u/%u segments smaller than %lu bytes exceeding threshold %u";
    v8 = v13;
    v9 = 40;
    goto LABEL_8;
  }
LABEL_10:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6;
  return skit::IndexWriter::end_txn((skit::IndexWriter *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) + 16));
}

uint64_t sub_2463002D0(uint64_t a1)
{
  return skit::IndexWriter::abort_txn((skit::IndexWriter *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) + 16));
}

void sub_246300334(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_24630037C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2463005EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t sub_246300674(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  uint64_t v13;
  std::__shared_weak_count *v14;

  v3 = *(const char **)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  v5 = *(char **)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v7 = objc_msgSend_indexFeatures(*(void **)(a1 + 32), a2, a3);
  v13 = 0;
  v14 = 0;
  v8 = sub_2462E64D8(v4, v3, v5, v6, v7, (uint64_t)&v13);
  v9 = v14;
  if (v14)
  {
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  return v8;
}

void sub_246300710(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_2462D3524((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_246300900(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_246300BE4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

uint64_t sub_246300C68(uint64_t a1)
{
  return sub_2462E45F4(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(_QWORD *)(a1 + 56), *(void **)(a1 + 40), *(void **)(a1 + 48), a1 + 64);
}

uint64_t sub_246300D50()
{
  return skit::IndexWriter::erase() - 1;
}

uint64_t sub_246300EE0(uint64_t a1)
{
  return skit::IndexWriter::clear((skit::IndexWriter *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) + 16));
}

uint64_t sub_246300F50(uint64_t a1)
{
  return skit::ContextV2::cleanup(*(skit::ContextV2 **)(*(_QWORD *)(a1 + 32) + 24));
}

uint64_t sub_246300FF0(uint64_t a1)
{
  skit::IndexWriter *v2;
  _BOOL4 v3;
  float v4;
  NSObject *v5;
  const __CFString *v6;
  _BYTE *v7;
  int v9;
  const char *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (skit::IndexWriter *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) + 16);
  if ((skit::IndexWriter::should_merge(v2) & 1) != 0)
  {
    v3 = 1;
  }
  else if ((unint64_t)skit::IndexWriter::size(v2) < 0x3E8)
  {
    v3 = 0;
  }
  else
  {
    v4 = (float)(unint64_t)skit::IndexWriter::record_cnt(v2);
    v3 = (float)((float)(unint64_t)skit::IndexWriter::size(v2) * 0.9) >= v4;
  }
  v5 = qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
  {
    v6 = CFSTR("NO");
    if (v3)
      v6 = CFSTR("YES");
    v9 = 136315394;
    v10 = "-[SEMSkitWriter shouldMerge:error:]_block_invoke";
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_2462C4000, v5, OS_LOG_TYPE_INFO, "%s Skit should_merge = %@", (uint8_t *)&v9, 0x16u);
  }
  v7 = *(_BYTE **)(a1 + 40);
  if (v7)
    *v7 = v3;
  return 0;
}

void sub_24630118C(uint64_t a1)
{
  sub_2462D3524(a1 + 88);
  sub_2462D3524(a1 + 72);
  sub_2462D3524(a1 + 56);
  if (*(char *)(a1 + 55) < 0)
    operator delete(*(void **)(a1 + 32));
  MEMORY[0x249556978](a1 + 16);
  MEMORY[0x249556A68](a1);
  JUMPOUT(0x249556DC8);
}

void sub_246301A64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose(&a55, 8);
  _Block_object_dispose(&a61, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_246301AB0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_246301AC0(uint64_t a1)
{

}

void sub_246301AC8(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  char updated;
  id obj;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend_state(v5, v7, v8))
  {
    objc_msgSend_error(v5, v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1[7] + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
  }
  else
  {
    v14 = (void *)a1[4];
    v15 = a1[5];
    v16 = *(_QWORD *)(a1[7] + 8);
    obj = *(id *)(v16 + 40);
    updated = objc_msgSend_updateBookmark_forSet_error_(v14, v9, (uint64_t)v6, v15, &obj);
    objc_storeStrong((id *)(v16 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = updated;
  }

}

uint64_t sub_246301B90(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  id v11;
  const char *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  int v21;
  const char *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  char inserted;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  char v30;
  id v32;
  id obj;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (!(*(unsigned int (**)(void))(*(_QWORD *)(a1 + 56) + 16))())
  {
    v7 = v3;
    objc_msgSend_sharedItem(v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc(MEMORY[0x24BDD1880]);
    objc_msgSend_prefixedSharedIdentifier_(*(void **)(a1 + 40), v12, (uint64_t)v10);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = objc_msgSend_bytes(v13, v14, v15);
    v18 = (void *)objc_msgSend_initWithUUIDBytes_(v11, v17, v16);

    v21 = objc_msgSend_sharedItemChangeType(v7, v19, v20);
    if (v21 == 2)
    {
      v28 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
      v29 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v32 = *(id *)(v29 + 40);
      v30 = objc_msgSend_deleteExternalId_error_(v28, v22, (uint64_t)v18, &v32);
      objc_storeStrong((id *)(v29 + 40), v32);
      if ((v30 & 1) != 0)
      {
        v27 = *(_QWORD *)(a1 + 88);
        goto LABEL_11;
      }
    }
    else
    {
      if (v21)
      {
LABEL_12:
        v6 = 1;
LABEL_14:

        goto LABEL_15;
      }
      v23 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
      v24 = *(_QWORD *)(a1 + 48);
      v25 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      obj = *(id *)(v25 + 40);
      inserted = objc_msgSend_insertRecordsFromCascadeItem_originAppId_externalId_error_(v23, v22, (uint64_t)v10, v24, v18, &obj);
      objc_storeStrong((id *)(v25 + 40), obj);
      if ((inserted & 1) != 0)
      {
        v27 = *(_QWORD *)(a1 + 80);
LABEL_11:
        ++*(_DWORD *)(*(_QWORD *)(v27 + 8) + 24);
        goto LABEL_12;
      }
    }
    v6 = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    goto LABEL_14;
  }
  v4 = qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    *(_DWORD *)buf = 136315394;
    v35 = "-[SEMFTSUpdater indexUpdatesToSets:changeRegistry:shouldDefer:error:]_block_invoke_2";
    v36 = 2112;
    v37 = v5;
    _os_log_impl(&dword_2462C4000, v4, OS_LOG_TYPE_INFO, "%s (%@) Aborting update due to deferral signal", buf, 0x16u);
  }
  v6 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
LABEL_15:

  return v6;
}

void sub_246302EB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_246302EF4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_246302F04(uint64_t a1)
{

}

void sub_246302F0C(_QWORD *a1, void *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  NSObject *v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  id obj;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  uint64_t v52;
  _QWORD v53[4];
  _QWORD v54[5];

  v54[4] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v6 = objc_msgSend_fieldType(v3, v4, v5);
  objc_msgSend_stringValueNoCopy(v3, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
  {
    if (objc_msgSend__isIndexedFieldType_(SEMFTSWriter, v10, v6) && v9 != 0)
    {
      v13 = a1[5];
      v54[0] = a1[4];
      objc_msgSend_encodedExternalIdString_(SEMFTSRecord, v11, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v54[1] = v14;
      objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v15, v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v54[2] = v16;
      v54[3] = v9;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v17, (uint64_t)v54, 4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend_updateParameters_(*(void **)(*(_QWORD *)(a1[8] + 8) + 40), v19, (uint64_t)v18) & 1) == 0)
      {
        v53[0] = 0x251783870;
        v53[1] = 0x251783890;
        v53[2] = 0x2517838B0;
        v53[3] = 0x2517838D0;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v20, (uint64_t)v53, 4);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_builderWithTableName_columnNames_(SEMDatabaseInsert, v22, 0x251783850, v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_setColumnValues_(v23, v24, (uint64_t)v18);
        v25 = *(_QWORD *)(a1[9] + 8);
        obj = *(id *)(v25 + 40);
        objc_msgSend_buildWithError_(v23, v26, (uint64_t)&obj);
        v27 = objc_claimAutoreleasedReturnValue();
        objc_storeStrong((id *)(v25 + 40), obj);
        v28 = *(_QWORD *)(a1[8] + 8);
        v29 = *(void **)(v28 + 40);
        *(_QWORD *)(v28 + 40) = v27;

        v31 = *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40);
        if (!v31)
        {
          v37 = qword_25441F970;
          if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
          {
            v41 = *(_QWORD *)(a1[6] + 8);
            v42 = *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 40);
            *(_DWORD *)buf = 136315906;
            v46 = "-[SEMFTSWriter insertRecordsFromCascadeItem:originAppId:externalId:error:]_block_invoke";
            v47 = 2112;
            v48 = v41;
            v49 = 2112;
            v50 = v18;
            v51 = 2112;
            v52 = v42;
            _os_log_error_impl(&dword_2462C4000, v37, OS_LOG_TYPE_ERROR, "%s (%@) Failed to build Insert with params: {%@} error: %@", buf, 0x2Au);
          }
          *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 0;

          goto LABEL_16;
        }
        objc_msgSend_setObject_forKey_(*(void **)(a1[6] + 16), v30, v31, &unk_25178EE88);

      }
      v32 = *(void **)(a1[6] + 8);
      v33 = *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40);
      v34 = *(_QWORD *)(a1[9] + 8);
      v43 = *(id *)(v34 + 40);
      v35 = objc_msgSend_executeCommand_error_(v32, v20, v33, &v43);
      objc_storeStrong((id *)(v34 + 40), v43);
      if ((v35 & 1) == 0)
      {
        v36 = qword_25441F970;
        if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
        {
          v38 = *(_QWORD *)(a1[6] + 8);
          v39 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
          v40 = *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 40);
          *(_DWORD *)buf = 136315906;
          v46 = "-[SEMFTSWriter insertRecordsFromCascadeItem:originAppId:externalId:error:]_block_invoke";
          v47 = 2112;
          v48 = v38;
          v49 = 2112;
          v50 = v39;
          v51 = 2112;
          v52 = v40;
          _os_log_error_impl(&dword_2462C4000, v36, OS_LOG_TYPE_ERROR, "%s (%@) Failed to execute insert: {%@} error: %@", buf, 0x2Au);
        }
        *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 0;
      }
LABEL_16:

    }
  }

}

BOOL SEMEntityTypeIsValid(int a1)
{
  return a1 == 1;
}

__CFString *SEMEntityTypeDescription(unsigned int a1, const char *a2)
{
  __CFString *v2;

  if (!a1)
    return CFSTR("Undefined");
  if (a1 == 1)
  {
    v2 = CFSTR("Cascade");
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("Undefined (%u)"), a1);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

uint64_t sub_246303494(uint64_t a1, const char *a2)
{
  uint64_t result;
  const char *v4;
  uint64_t v5;
  int isEvaluationEnabled;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  result = objc_msgSend__isCustomerInstall_(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 48));
  if ((result & 1) == 0)
  {
    isEvaluationEnabled = objc_msgSend_isEvaluationEnabled(*(void **)(*(_QWORD *)(a1 + 32) + 8), v4, v5);
    v7 = qword_25441F970;
    if (isEvaluationEnabled && os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      v15 = 136315138;
      v16 = "-[SEMAdminConnection beginEvaluation:completion:]_block_invoke";
      _os_log_error_impl(&dword_2462C4000, v7, OS_LOG_TYPE_ERROR, "%s Evaluation is already enabled.", (uint8_t *)&v15, 0xCu);
      v7 = qword_25441F970;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v15 = 136315394;
      v16 = "-[SEMAdminConnection beginEvaluation:completion:]_block_invoke";
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_2462C4000, v7, OS_LOG_TYPE_INFO, "%s Beginning evaluaton with serializedSets: %@", (uint8_t *)&v15, 0x16u);
    }
    objc_msgSend_setEvaluationEnabled_(*(void **)(*(_QWORD *)(a1 + 32) + 8), v8, 1);
    if (objc_msgSend_rebuildAllStateWithSerializedSets_(*(void **)(*(_QWORD *)(a1 + 32) + 16), v10, *(_QWORD *)(a1 + 40)))
    {
      result = *(_QWORD *)(a1 + 48);
      if (result)
        return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
    }
    else
    {
      v11 = qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      {
        v14 = *(_QWORD *)(a1 + 40);
        v15 = 136315394;
        v16 = "-[SEMAdminConnection beginEvaluation:completion:]_block_invoke";
        v17 = 2112;
        v18 = v14;
        _os_log_error_impl(&dword_2462C4000, v11, OS_LOG_TYPE_ERROR, "%s Failed to begin evaluation with serializedSets: %@", (uint8_t *)&v15, 0x16u);
      }
      v13 = *(_QWORD *)(a1 + 48);
      if (v13)
        (*(void (**)(uint64_t, uint64_t))(v13 + 16))(v13, 2);
      return objc_msgSend_setEvaluationEnabled_(*(void **)(*(_QWORD *)(a1 + 32) + 8), v12, 0);
    }
  }
  return result;
}

uint64_t sub_246303700(uint64_t a1, const char *a2)
{
  uint64_t result;
  const char *v4;
  uint64_t v5;
  char isEvaluationEnabled;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t (*v11)(void);
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  result = objc_msgSend__isCustomerInstall_(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 40));
  if ((result & 1) == 0)
  {
    isEvaluationEnabled = objc_msgSend_isEvaluationEnabled(*(void **)(*(_QWORD *)(a1 + 32) + 8), v4, v5);
    v7 = qword_25441F970;
    if ((isEvaluationEnabled & 1) != 0)
    {
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
      {
        v12 = 136315138;
        v13 = "-[SEMAdminConnection endEvaluation:]_block_invoke";
        _os_log_impl(&dword_2462C4000, v7, OS_LOG_TYPE_INFO, "%s Clearing all state and ending evaluation", (uint8_t *)&v12, 0xCu);
      }
      objc_msgSend_clearAllState(*(void **)(*(_QWORD *)(a1 + 32) + 16), v8, v9);
      objc_msgSend_setEvaluationEnabled_(*(void **)(*(_QWORD *)(a1 + 32) + 8), v10, 0);
      result = *(_QWORD *)(a1 + 40);
      if (result)
      {
        v11 = *(uint64_t (**)(void))(result + 16);
        return v11();
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      {
        v12 = 136315138;
        v13 = "-[SEMAdminConnection endEvaluation:]_block_invoke";
        _os_log_error_impl(&dword_2462C4000, v7, OS_LOG_TYPE_ERROR, "%s Evaluation is not enabled. Use beginEvaluation API to enable evaluation.", (uint8_t *)&v12, 0xCu);
      }
      result = *(_QWORD *)(a1 + 40);
      if (result)
      {
        v11 = *(uint64_t (**)(void))(result + 16);
        return v11();
      }
    }
  }
  return result;
}

uint64_t sub_2463038E4(uint64_t a1)
{
  NSObject *v2;
  const char *v3;
  const __CFString *v4;
  int v5;
  uint64_t result;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
  {
    v4 = CFSTR("clean ");
    if (!*(_BYTE *)(a1 + 48))
      v4 = &stru_251783AF0;
    v8 = 136315394;
    v9 = "-[SEMAdminConnection triggerMaintenance:completion:]_block_invoke";
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_2462C4000, v2, OS_LOG_TYPE_INFO, "%s Triggering %@maintenance", (uint8_t *)&v8, 0x16u);
  }
  v5 = objc_msgSend_performMaintenance_(*(void **)(*(_QWORD *)(a1 + 32) + 16), v3, 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
  {
    if (v5)
      v7 = 1;
    else
      v7 = 2;
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v7);
  }
  return result;
}

uint64_t sub_2463043D8(uint64_t a1, uint64_t a2, char *a3, uint64_t a4, int a5)
{
  uint64_t *v8;
  NSObject *v9;
  _WORD *v10;
  uint64_t v11;
  morphun::analysis::DefaultAnalyzerFactory *v12;
  uint64_t v13;
  morphun::analysis::DefaultAnalyzerFactory *v14;
  uint64_t v15;
  uint64_t Tokenizer;
  uint64_t v18;
  _QWORD *v19;
  _BYTE __p[12];
  __int16 v21;
  _QWORD *v22;
  __int16 v23;
  char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  morphun::util::LocaleUtils::toLocale();
  *(_QWORD *)(a1 + 128) = 0;
  v8 = (uint64_t *)(a1 + 128);
  *(_QWORD *)(a1 + 152) = 0;
  *(_QWORD *)(a1 + 136) = 0;
  if (a3)
  {
    sub_2462D7A34(__p, a3);
    morphun::resources::DataRegistrationService::registerDataPathForLocale();
    if (SHIBYTE(v23) < 0)
      operator delete(*(void **)__p);
    v9 = qword_25441F958;
    if (os_log_type_enabled((os_log_t)qword_25441F958, OS_LOG_TYPE_DEBUG))
    {
      v19 = (_QWORD *)(a1 + 8);
      if (*(char *)(a1 + 31) < 0)
        v19 = (_QWORD *)*v19;
      *(_DWORD *)__p = 136315650;
      *(_QWORD *)&__p[4] = "Tokenizer";
      v21 = 2080;
      v22 = v19;
      v23 = 2080;
      v24 = a3;
      _os_log_debug_impl(&dword_2462C4000, v9, OS_LOG_TYPE_DEBUG, "%s Registered Morphun assets from Trial for %s : %s", __p, 0x20u);
    }
  }
  if (*(char *)(a1 + 31) < 0)
  {
    v10 = *(_WORD **)(a1 + 8);
    v11 = *(_QWORD *)(a1 + 16);
  }
  else
  {
    v10 = (_WORD *)(a1 + 8);
    v11 = *(unsigned __int8 *)(a1 + 31);
  }
  if (v11 == 2 && *v10 == 28261)
  {
    Tokenizer = morphun::TokenizerFactory::createTokenizer();
    v18 = *v8;
    *v8 = Tokenizer;
    if (v18)
      (*(void (**)(uint64_t))(*(_QWORD *)v18 + 16))(v18);
  }
  else
  {
    v12 = (morphun::analysis::DefaultAnalyzerFactory *)operator new();
    morphun::analysis::DefaultAnalyzerFactory::DefaultAnalyzerFactory(v12);
    v13 = *(_QWORD *)(a1 + 136);
    *(_QWORD *)(a1 + 136) = v12;
    if (v13)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v13 + 16))(v13);
      v12 = *(morphun::analysis::DefaultAnalyzerFactory **)(a1 + 136);
    }
    *(_QWORD *)(a1 + 144) = (*(uint64_t (**)(morphun::analysis::DefaultAnalyzerFactory *, uint64_t))(*(_QWORD *)v12 + 24))(v12, a1);
  }
  if (a5)
  {
    v14 = (morphun::analysis::DefaultAnalyzerFactory *)operator new();
    morphun::analysis::DefaultAnalyzerFactory::DefaultAnalyzerFactory(v14);
    v15 = *(_QWORD *)(a1 + 152);
    *(_QWORD *)(a1 + 152) = v14;
    if (v15)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v15 + 16))(v15);
      v14 = *(morphun::analysis::DefaultAnalyzerFactory **)(a1 + 152);
    }
    *(_QWORD *)(a1 + 160) = (*(uint64_t (**)(morphun::analysis::DefaultAnalyzerFactory *, uint64_t))(*(_QWORD *)v14 + 24))(v14, a1);
  }
  return a1;
}

void sub_246304614(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, int a10, __int16 a11, uint64_t a12, char a13, char a14, uint64_t a15)
{
  morphun::util::ULocale *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  MEMORY[0x249556DC8](v16, 0x10F3C40F4CE41AFLL);
  v19 = *((_QWORD *)v15 + 19);
  *((_QWORD *)v15 + 19) = 0;
  if (v19)
    (*(void (**)(uint64_t))(*(_QWORD *)v19 + 16))(v19);
  v20 = *((_QWORD *)v15 + 17);
  *((_QWORD *)v15 + 17) = 0;
  if (v20)
    (*(void (**)(uint64_t))(*(_QWORD *)v20 + 16))(v20);
  v21 = *v17;
  *v17 = 0;
  if (v21)
    (*(void (**)(uint64_t))(*(_QWORD *)v21 + 16))(v21);
  morphun::util::ULocale::~ULocale(v15);
  _Unwind_Resume(a1);
}

void sub_24630475C(uint64_t a1, uint64_t *a2, void *__src, unint64_t a4, int a5)
{
  void **v8;
  uint64_t v9;
  uint64_t v10;
  _WORD *v11;
  uint64_t v12;
  _QWORD **v13;
  uint64_t v14;
  const Token **v15;
  morphun::TokenIterator *v16;
  uint64_t v17;
  morphun::Token *v18;
  morphun::Token *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  morphun::Token *v23;
  void **v24;
  void **i;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  morphun::Token *v32;
  uint64_t Value;
  morphun::Token *v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  int v39;
  unsigned __int16 *v40;
  unsigned __int16 *v41;
  morphun::Token *v42;
  uint64_t CleanValue;
  __int128 *v44;
  __int128 v45;
  void **v46;
  morphun::Token *v47;
  uint64_t v48;
  int v49;
  void *v50;
  unint64_t v51;
  uint64_t v52;
  int v53;
  void *v54;
  unint64_t v55;
  unsigned int v56;
  uint64_t v57;
  int isWhitespace;
  char isSignificant;
  void **v60;
  void **v61;
  uint64_t v62;
  int v63;
  unsigned __int16 *v64;
  char *v65;
  char *v66;
  unsigned __int16 *v67;
  char v68;
  char v69;
  uint64_t v70;
  int v71;
  void *v72;
  unint64_t v73;
  unint64_t v74;
  void *v75;
  unsigned int v76;
  uint64_t v77;
  int v78;
  char v79;
  const Token **v80;
  const Token **v82;
  void **v84;
  void **v85;
  unint64_t v86;
  void *__dst[2];
  unint64_t v88;
  void *__p[2];
  __int128 v90;
  uint64_t v91;
  __int16 v92;
  int v93;
  __int128 v94;
  __int128 v95;
  uint64_t v96;
  __int16 v97;
  int v98;

  if (a4 >= 0x7FFFFFFFFFFFFFF8)
    sub_2462D3400();
  if (a4 >= 0xB)
  {
    v9 = (a4 & 0xFFFFFFFFFFFFFFFCLL) + 4;
    if ((a4 | 3) != 0xB)
      v9 = a4 | 3;
    v8 = (void **)sub_2462D7494((uint64_t)__dst, v9 + 1);
    __dst[1] = (void *)a4;
    v88 = v10 | 0x8000000000000000;
    __dst[0] = v8;
  }
  else
  {
    HIBYTE(v88) = a4;
    v8 = __dst;
    if (!a4)
      goto LABEL_9;
  }
  memmove(v8, __src, 2 * a4);
LABEL_9:
  *((_WORD *)v8 + a4) = 0;
  v84 = 0;
  v85 = 0;
  v86 = 0;
  if (*(char *)(a1 + 31) < 0)
  {
    v11 = *(_WORD **)(a1 + 8);
    v12 = *(_QWORD *)(a1 + 16);
  }
  else
  {
    v11 = (_WORD *)(a1 + 8);
    v12 = *(unsigned __int8 *)(a1 + 31);
  }
  if (v12 == 2 && *v11 == 28261)
  {
    v13 = (_QWORD **)(a1 + 128);
    v14 = 3;
  }
  else
  {
    v13 = (_QWORD **)(a1 + 144);
    v14 = 8;
  }
  v15 = (const Token **)(*(uint64_t (**)(void))(**v13 + 8 * v14))();
  if (*(_QWORD *)(a1 + 152))
    v82 = (const Token **)(*(uint64_t (**)(_QWORD, const Token **))(**(_QWORD **)(a1 + 160) + 72))(*(_QWORD *)(a1 + 160), v15);
  else
    v82 = 0;
  v16 = (morphun::TokenIterator *)morphun::TokenIterator::TokenIterator((morphun::TokenIterator *)&v94, v15[1], v15[2]);
  if (v82)
    morphun::TokenIterator::TokenIterator(v16, v82[1], v82[2]);
  else
    morphun::TokenIterator::TokenIterator(v16, v15[1], v15[2]);
  v80 = v15;
  while (1)
  {
    *(_QWORD *)&v94 = sub_2462EE70C((uint64_t)v15);
    *((_QWORD *)&v94 + 1) = v17;
    if (!morphun::TokenIterator::operator!=())
      break;
    v18 = (morphun::Token *)morphun::TokenIterator::operator->();
    if ((morphun::Token::isHead(v18) & 1) == 0)
    {
      v19 = (morphun::Token *)morphun::TokenIterator::operator->();
      if ((morphun::Token::isTail(v19) & 1) == 0)
      {
        if (v82)
        {
          while (1)
          {
            v20 = morphun::TokenIterator::operator->();
            v21 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v20 + 24))(v20);
            v22 = morphun::TokenIterator::operator->();
            if (v21 >= (*(int (**)(uint64_t))(*(_QWORD *)v22 + 24))(v22))
            {
              v23 = (morphun::Token *)morphun::TokenIterator::operator->();
              if (!morphun::Token::isHead(v23))
                break;
            }
            morphun::TokenIterator::operator++();
          }
          v24 = v84;
          for (i = v85; i != v24; i -= 3)
          {
            if (*((char *)i - 1) < 0)
              operator delete(*(i - 3));
          }
          v85 = v24;
          v15 = v80;
          while (1)
          {
            v26 = morphun::TokenIterator::operator->();
            v27 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v26 + 24))(v26);
            v28 = morphun::TokenIterator::operator->();
            if (v27 > (*(int (**)(uint64_t))(*(_QWORD *)v28 + 24))(v28))
              break;
            v29 = morphun::TokenIterator::operator->();
            v30 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v29 + 32))(v29);
            v31 = morphun::TokenIterator::operator->();
            if (v30 < (*(int (**)(uint64_t))(*(_QWORD *)v31 + 32))(v31))
              break;
            v32 = (morphun::Token *)morphun::TokenIterator::operator->();
            Value = morphun::Token::getValue(v32);
            v34 = (morphun::Token *)morphun::TokenIterator::operator->();
            v35 = morphun::Token::getValue(v34);
            v36 = *(unsigned __int8 *)(Value + 23);
            v37 = (char)v36;
            if ((v36 & 0x80u) != 0)
              v36 = *(_QWORD *)(Value + 8);
            v38 = *(unsigned __int8 *)(v35 + 23);
            v39 = (char)v38;
            if ((v38 & 0x80u) != 0)
              v38 = *(_QWORD *)(v35 + 8);
            if (v36 != v38)
              break;
            if (v36)
            {
              if (v37 >= 0)
                v40 = (unsigned __int16 *)Value;
              else
                v40 = *(unsigned __int16 **)Value;
              if (v39 >= 0)
                v41 = (unsigned __int16 *)v35;
              else
                v41 = *(unsigned __int16 **)v35;
              while (*v41 == *v40)
              {
                ++v40;
                ++v41;
                if (!--v36)
                  goto LABEL_51;
              }
              break;
            }
LABEL_51:
            v42 = (morphun::Token *)morphun::TokenIterator::operator->();
            CleanValue = morphun::Token::getCleanValue(v42);
            v44 = (__int128 *)v85;
            if ((unint64_t)v85 >= v86)
            {
              v46 = (void **)sub_2462EE75C((uint64_t *)&v84, (__int128 *)CleanValue);
            }
            else
            {
              if (*(char *)(CleanValue + 23) < 0)
              {
                sub_2462D7540(v85, *(void **)CleanValue, *(_QWORD *)(CleanValue + 8));
              }
              else
              {
                v45 = *(_OWORD *)CleanValue;
                v85[2] = *(void **)(CleanValue + 16);
                *v44 = v45;
              }
              v46 = (void **)v44 + 3;
            }
            v85 = v46;
            morphun::TokenIterator::operator++();
          }
        }
        v47 = (morphun::Token *)morphun::TokenIterator::operator*();
        v94 = 0u;
        v95 = 0u;
        v96 = 0x100003F800000;
        v97 = 3;
        v98 = 0;
        v48 = morphun::Token::getValue(v47);
        v49 = *(char *)(v48 + 23);
        if (v49 >= 0)
          v50 = (void *)v48;
        else
          v50 = *(void **)v48;
        if (v49 >= 0)
          v51 = *(unsigned __int8 *)(v48 + 23);
        else
          v51 = *(_QWORD *)(v48 + 8);
        v52 = morphun::Token::getCleanValue(v47);
        v53 = *(char *)(v52 + 23);
        if (v53 >= 0)
          v54 = (void *)v52;
        else
          v54 = *(void **)v52;
        if (v53 >= 0)
          v55 = *(unsigned __int8 *)(v52 + 23);
        else
          v55 = *(_QWORD *)(v52 + 8);
        v56 = (*(uint64_t (**)(morphun::Token *))(*(_QWORD *)v47 + 24))(v47);
        v57 = (*(uint64_t (**)(morphun::Token *))(*(_QWORD *)v47 + 32))(v47);
        isWhitespace = morphun::Token::isWhitespace(v47);
        isSignificant = morphun::Token::isSignificant(v47);
        if (sub_246304E78((uint64_t)&v94, v50, v51, v54, v55, v56, v57, isWhitespace, isSignificant))
          sub_2462E637C(a2, &v94);
        if (a5)
        {
          v61 = v84;
          v60 = v85;
          if (v85 != v84)
          {
            *(_OWORD *)__p = 0u;
            v90 = 0u;
            v91 = 0x100003F800000;
            v92 = 3;
            v93 = 0;
            do
            {
              v62 = morphun::Token::getValue(v47);
              v63 = *(char *)(v62 + 23);
              if (v63 >= 0)
                v64 = (unsigned __int16 *)v62;
              else
                v64 = *(unsigned __int16 **)v62;
              if (v63 >= 0)
                v65 = (char *)*(unsigned __int8 *)(v62 + 23);
              else
                v65 = *(char **)(v62 + 8);
              if (*((char *)v61 + 23) < 0)
              {
                v67 = (unsigned __int16 *)*v61;
                v66 = (char *)v61[1];
              }
              else
              {
                v66 = (char *)*((unsigned __int8 *)v61 + 23);
                v67 = (unsigned __int16 *)v61;
              }
              v68 = morphun::Token::isWhitespace(v47);
              if (v66)
                v69 = v68;
              else
                v69 = 1;
              if ((v69 & 1) == 0)
              {
                if (v66 == v65)
                {
                  while (*v64 == *v67)
                  {
                    ++v67;
                    ++v64;
                    if (!--v65)
                      goto LABEL_103;
                  }
                }
                v70 = morphun::Token::getValue(v47);
                v71 = *(char *)(v70 + 23);
                if (v71 >= 0)
                  v72 = (void *)v70;
                else
                  v72 = *(void **)v70;
                if (v71 >= 0)
                  v73 = *(unsigned __int8 *)(v70 + 23);
                else
                  v73 = *(_QWORD *)(v70 + 8);
                if (*((char *)v61 + 23) < 0)
                {
                  v75 = *v61;
                  v74 = (unint64_t)v61[1];
                }
                else
                {
                  v74 = *((unsigned __int8 *)v61 + 23);
                  v75 = v61;
                }
                v76 = (*(uint64_t (**)(morphun::Token *))(*(_QWORD *)v47 + 24))(v47);
                v77 = (*(uint64_t (**)(morphun::Token *))(*(_QWORD *)v47 + 32))(v47);
                v78 = morphun::Token::isWhitespace(v47);
                v79 = morphun::Token::isSignificant(v47);
                if (sub_246304E78((uint64_t)__p, v72, v73, v75, v74, v76, v77, v78, v79))
                  sub_2462E637C(a2, (__int128 *)__p);
              }
LABEL_103:
              v61 += 3;
            }
            while (v61 != v60);
            if (SBYTE7(v90) < 0)
              operator delete(__p[0]);
            v15 = v80;
          }
        }
        if (SBYTE7(v95) < 0)
          operator delete((void *)v94);
      }
    }
    morphun::TokenIterator::operator++();
  }
  if (v82)
    (*((void (**)(const Token **))*v82 + 2))(v82);
  if (v15)
    (*((void (**)(const Token **))*v15 + 2))(v15);
  *(_QWORD *)&v94 = &v84;
  sub_2462D7E84((void ***)&v94);
  if (SHIBYTE(v88) < 0)
    operator delete(__dst[0]);
}

void sub_246304DB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27,char *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  uint64_t v33;

  if (v33)
    (*(void (**)(uint64_t))(*(_QWORD *)v33 + 16))(v33);
  a28 = &a19;
  sub_2462D7E84((void ***)&a28);
  if (a27 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t sub_246304E78(uint64_t a1, void *a2, unint64_t a3, void *__src, unint64_t a5, unsigned int a6, uint64_t a7, int a8, char a9)
{
  if ((a8 & 1) == 0)
  {
    if (a5)
    {
      a2 = __src;
      a3 = a5;
    }
    sub_2462D7834((void **)a1, a2, a3);
    *(_QWORD *)(a1 + 24) = a6 | (unint64_t)(a7 << 32);
    if ((a9 & 1) == 0)
    {
      *(_WORD *)(a1 + 40) &= 0xFFFCu;
      *(_DWORD *)(a1 + 32) = 0;
    }
  }
  return a8 ^ 1u;
}

void sub_246305318(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  const char *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  int v14;
  void *v15;
  _BOOL4 v16;
  const char *v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  int v21;
  const char *v22;
  uint64_t v23;
  int v24;
  void *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  int v29;
  const char *v30;
  uint64_t v31;
  int v32;
  _BYTE v33[24];
  _BYTE v34[24];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend__rankerPolicyForGroupKey_(v6, v8, (uint64_t)v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2463055B4(v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v33 = 136315394;
    *(_QWORD *)&v33[4] = "-[SEMSpanMatchResultInterpreter interpretSpanMatchResults:ofQuery:]_block_invoke";
    *(_WORD *)&v33[12] = 2112;
    *(_QWORD *)&v33[14] = v10;
    _os_log_impl(&dword_2462C4000, v11, OS_LOG_TYPE_INFO, "%s Processing candidate group: %@", v33, 0x16u);
  }
  objc_msgSend__filterRankAndThresholdCandidates_ofQuery_withPolicy_(*(void **)(a1 + 32), v12, (uint64_t)v5, *(_QWORD *)(a1 + 40), v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8);
  v15 = (void *)qword_25441F970;
  v16 = os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO);
  if (v14)
  {
    if (v16)
    {
      v18 = v15;
      v21 = objc_msgSend_count(v13, v19, v20);
      v24 = objc_msgSend_count(v5, v22, v23);
      sub_24630566C(v13, (const char *)*(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v33 = 136316163;
      *(_QWORD *)&v33[4] = "-[SEMSpanMatchResultInterpreter interpretSpanMatchResults:ofQuery:]_block_invoke";
      *(_WORD *)&v33[12] = 1024;
      *(_DWORD *)&v33[14] = v21;
      *(_WORD *)&v33[18] = 1024;
      *(_DWORD *)&v33[20] = v24;
      *(_WORD *)v34 = 2112;
      *(_QWORD *)&v34[2] = v10;
      *(_WORD *)&v34[10] = 2117;
      *(_QWORD *)&v34[12] = v25;
      v26 = "%s Accepted %u / %u candidate(s) in group: %@%{sensitive}@";
LABEL_8:
      _os_log_impl(&dword_2462C4000, v18, OS_LOG_TYPE_INFO, v26, v33, 0x2Cu);

    }
  }
  else if (v16)
  {
    v18 = v15;
    v29 = objc_msgSend_count(v13, v27, v28);
    v32 = objc_msgSend_count(v5, v30, v31);
    sub_24630566C(v13, (const char *)*(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v33 = 136316162;
    *(_QWORD *)&v33[4] = "-[SEMSpanMatchResultInterpreter interpretSpanMatchResults:ofQuery:]_block_invoke";
    *(_WORD *)&v33[12] = 1024;
    *(_DWORD *)&v33[14] = v29;
    *(_WORD *)&v33[18] = 1024;
    *(_DWORD *)&v33[20] = v32;
    *(_WORD *)v34 = 2112;
    *(_QWORD *)&v34[2] = v10;
    *(_WORD *)&v34[10] = 2112;
    *(_QWORD *)&v34[12] = v25;
    v26 = "%s Accepted %u / %u candidate(s) in group: %@%@";
    goto LABEL_8;
  }
  objc_msgSend_addObjectsFromArray_(*(void **)(a1 + 48), v17, (uint64_t)v13, *(_OWORD *)v33, *(_QWORD *)&v33[16], *(_OWORD *)v34, *(_QWORD *)&v34[16]);

}

id sub_2463055B4(void *a1)
{
  id v1;
  uint64_t v2;
  const char *v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  id v7;
  void *v8;
  const char *v9;

  v1 = a1;
  v2 = sub_24630758C(v1);
  objc_msgSend_descriptionForTypeIdentifier_(MEMORY[0x24BE5B238], v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = sub_2463075DC(v1);

  if ((_DWORD)v5 == (unsigned __int16)*MEMORY[0x24BE15620])
  {
    v7 = v4;
  }
  else
  {
    objc_msgSend_descriptionForTypeIdentifier_(MEMORY[0x24BE5B238], v6, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingFormat_(v4, v9, (uint64_t)CFSTR(".%@"), v8);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

__CFString *sub_24630566C(void *a1, const char *a2)
{
  void *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  unint64_t v12;
  int v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  unsigned int v20;
  const char *v21;
  uint64_t v22;
  __CFString *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  void *v36;
  const char *v37;
  id v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t i;
  void *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  void *v56;
  const char *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  __CFString *v65;
  void *v66;
  void *v67;
  const char *v68;
  void *v69;
  const char *v70;
  void *v71;
  const char *v72;
  const char *v73;
  uint64_t v74;
  unint64_t v75;
  void *v76;
  void *v77;
  const char *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  unsigned int v88;
  int v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x24BDAC8D0];
  if ((a2 & 1) != 0)
    return &stru_251783AF0;
  objc_msgSend_sortedArrayUsingComparator_(a1, a2, (uint64_t)&unk_2517831C0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v7 = objc_msgSend_count(v3, v5, v6);
  v86 = (void *)objc_msgSend_initWithCapacity_(v4, v8, v7);
  if (objc_msgSend_count(v3, v9, v10))
  {
    v12 = 0;
    v13 = 0;
    v80 = v3;
    do
    {
      v89 = v13;
      objc_msgSend_objectAtIndex_(v3, v11, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_entityInfo(v14, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend_entityType(v17, v18, v19);

      v23 = &stru_251783AF0;
      v88 = v20;
      if (v20 == 1)
      {
        v87 = v14;
        objc_msgSend_entityInfo(v87, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        sub_2462EAC48(v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_sourceIdentifier(v27, v28, v29);
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = (void *)MEMORY[0x24BE5B238];
        v34 = objc_msgSend_itemType(v27, v32, v33);
        objc_msgSend_descriptionForTypeIdentifier_(v31, v35, v34);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = v27;
        v85 = v14;
        v82 = v36;
        v83 = (void *)v30;
        if (v30)
        {
          objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v37, (uint64_t)CFSTR("%@:%@"), v36, v30);
          v38 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v38 = v36;
        }
        v81 = v38;
        v92 = 0u;
        v93 = 0u;
        v90 = 0u;
        v91 = 0u;
        objc_msgSend_fieldMatches(v87, v39, v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v90, v94, 16);
        if (v43)
        {
          v46 = v43;
          v47 = 0;
          v48 = *(_QWORD *)v91;
          do
          {
            for (i = 0; i != v46; ++i)
            {
              if (*(_QWORD *)v91 != v48)
                objc_enumerationMutation(v41);
              objc_msgSend_entityFieldInfo(*(void **)(*((_QWORD *)&v90 + 1) + 8 * i), v44, v45);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              sub_2462EAD88(v50);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v54 = objc_msgSend_fieldType(v51, v52, v53);

              objc_msgSend_descriptionForTypeIdentifier_(MEMORY[0x24BE5B238], v55, v54);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              v58 = v56;
              if (v47)
              {
                objc_msgSend_stringByAppendingFormat_(v47, v57, (uint64_t)CFSTR("|%@"), v56);
                v59 = objc_claimAutoreleasedReturnValue();

                v47 = (id)v59;
              }
              else
              {
                v47 = v56;
              }

            }
            v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v44, (uint64_t)&v90, v94, 16);
          }
          while (v46);
        }
        else
        {
          v47 = 0;
        }

        sub_2462EAA94(v87);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_sourceItemIdentifier(v60, v61, v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        if (v63)
        {
          objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v64, (uint64_t)CFSTR(" sourceItemIdentifier: \"%@\""), v63);
          v65 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v65 = &stru_251783AF0;
        }
        v3 = v80;
        objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v64, (uint64_t)CFSTR(" source: %@ match: %@%@"), v81, v47, v65);
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v14 = v85;
      }
      v66 = (void *)MEMORY[0x24BDD17C8];
      v12 = (v89 + 1);
      objc_msgSend_spanInfo(v14, v21, v22);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      SEMEntityTypeDescription(v88, v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v66, v70, (uint64_t)CFSTR("%u.\t%@\n\tEntity type: %@ %@"), v12, v67, v69, v23);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v86, v72, (uint64_t)v71);

      v75 = objc_msgSend_count(v3, v73, v74);
      v13 = v89 + 1;
    }
    while (v75 > v12);
  }
  v76 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_componentsJoinedByString_(v86, v11, (uint64_t)CFSTR("\n\n"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v76, v78, (uint64_t)CFSTR("\n\n%@\n_"), v77);
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  return (__CFString *)v79;
}

uint64_t sub_246305EB8(void *a1, const char *a2, uint64_t a3)
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;

  objc_msgSend_fieldMatches(a1, a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_entityFieldInfo(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2462EAD88(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v13 = objc_msgSend_fieldType(v10, v11, v12);
  else
    v13 = (unsigned __int16)*MEMORY[0x24BE15620];

  return v13;
}

id sub_246305F3C(__int16 a1, __int16 a2)
{
  id v2;
  const char *v3;
  void *v4;
  const char *v5;
  const char *v6;
  __int16 v8;
  __int16 v9;

  v9 = a1;
  v8 = a2;
  v2 = objc_alloc(MEMORY[0x24BDBCEC8]);
  v4 = (void *)objc_msgSend_initWithLength_(v2, v3, 4);
  objc_msgSend_replaceBytesInRange_withBytes_(v4, v5, 0, 2, &v9);
  objc_msgSend_replaceBytesInRange_withBytes_(v4, v6, 2, 2, &v8);
  return v4;
}

uint64_t sub_24630758C(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  id v4;
  const char *v5;
  uint64_t v6;
  unsigned __int16 *v7;
  uint64_t v8;

  v1 = a1;
  if (objc_msgSend_length(v1, v2, v3) == 4)
  {
    v4 = objc_retainAutorelease(v1);
    v7 = (unsigned __int16 *)objc_msgSend_bytes(v4, v5, v6);
  }
  else
  {
    v7 = (unsigned __int16 *)MEMORY[0x24BE15620];
  }
  v8 = *v7;

  return v8;
}

uint64_t sub_2463075DC(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  id v4;
  const char *v5;
  uint64_t v6;
  unsigned __int16 *v7;
  uint64_t v8;

  v1 = a1;
  if (objc_msgSend_length(v1, v2, v3) == 4)
  {
    v4 = objc_retainAutorelease(v1);
    v7 = (unsigned __int16 *)(objc_msgSend_bytes(v4, v5, v6) + 2);
  }
  else
  {
    v7 = (unsigned __int16 *)MEMORY[0x24BE15620];
  }
  v8 = *v7;

  return v8;
}

uint64_t sub_246307698(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  float v10;
  float v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  float v16;
  float v17;
  float v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  float v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  float v28;
  float v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  float v35;
  float v36;
  const char *v37;
  uint64_t v38;
  void *v40;
  const char *v41;
  uint64_t v42;
  float v43;
  float v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  float v50;
  float v51;

  v4 = a2;
  v5 = a3;
  v6 = v4;
  v7 = v5;
  objc_msgSend_score(v6, v8, v9);
  v11 = v10;
  objc_msgSend_score(v7, v12, v13);
  if (v11 < v16)
    goto LABEL_5;
  objc_msgSend_score(v6, v14, v15);
  v18 = v17;
  objc_msgSend_score(v7, v19, v20);
  if (v18 > v23)
  {
    v24 = -1;
    goto LABEL_6;
  }
  objc_msgSend_spanInfo(v6, v21, v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_matchScore(v25, v26, v27);
  v29 = v28;
  objc_msgSend_spanInfo(v7, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_matchScore(v32, v33, v34);
  v36 = v35;

  if (v29 < v36)
  {
LABEL_5:
    v24 = 1;
    goto LABEL_6;
  }
  objc_msgSend_spanInfo(v6, v37, v38);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_matchScore(v40, v41, v42);
  v44 = v43;
  objc_msgSend_spanInfo(v7, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_matchScore(v47, v48, v49);
  v51 = v50;

  if (v44 <= v51)
    v24 = 0;
  else
    v24 = -1;
LABEL_6:

  return v24;
}

uint64_t sub_246307A50(uint64_t a1, const char *a2)
{
  uint64_t result;

  result = objc_msgSend__didHandleUpdatedSets_shouldDefer_(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 40), 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t sub_246307B18(uint64_t a1, const char *a2)
{
  uint64_t result;

  result = objc_msgSend__didRefreshSettings_skipMaintenance_(*(void **)(a1 + 32), a2, 0, 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void sub_246307C04(uint64_t a1)
{
  NSObject *v2;
  const char *v3;
  const char *v4;
  BOOL v5;
  const char *v6;
  const char *v7;
  NSObject *v8;
  char v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[SEMIndexSiteManager performMaintenance:]_block_invoke";
    _os_log_impl(&dword_2462C4000, v2, OS_LOG_TYPE_INFO, "%s Starting maintenance", buf, 0xCu);
  }
  v10 = 0;
  if (objc_msgSend__didRefreshSettings_skipMaintenance_(*(void **)(a1 + 32), v3, *(_QWORD *)(a1 + 40), &v10))v5 = v10 == 0;
  else
    v5 = 1;
  if (v5)
  {
    if (objc_msgSend__didHandleAnyUpdatedSets_(*(void **)(a1 + 32), v4, *(_QWORD *)(a1 + 40))
      && objc_msgSend__didPerformVerification_(*(void **)(a1 + 32), v6, *(_QWORD *)(a1 + 40)))
    {
      v8 = qword_25441F970;
      if (!os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
        return;
      *(_DWORD *)buf = 136315138;
      v12 = "-[SEMIndexSiteManager performMaintenance:]_block_invoke";
      v7 = "%s Maintenance completed";
      goto LABEL_14;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
  else
  {
    v8 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[SEMIndexSiteManager performMaintenance:]_block_invoke";
      v7 = "%s Maintenance handled settings change(s)";
LABEL_14:
      _os_log_impl(&dword_2462C4000, v8, OS_LOG_TYPE_INFO, v7, buf, 0xCu);
    }
  }
}

uint64_t sub_246307E18(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend__resetRootDirectory(*(void **)(a1 + 32), a2, a3);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t sub_246307EF8(uint64_t a1, const char *a2)
{
  uint64_t result;

  result = objc_msgSend__removeSiteWithUserId_(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t sub_246307FDC(uint64_t a1, const char *a2)
{
  uint64_t result;

  result = objc_msgSend__rebuildAllStateWithSerializedSets_(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t sub_246308068(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel__handleSysdiagnoseStarted, a3);
}

uint64_t sub_2463092BC(uint64_t a1, const char *a2)
{
  return objc_msgSend_objectForKey_(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 40));
}

id sub_246309628(uint64_t a1, const char *a2)
{
  void *v3;
  void *v4;
  id v5;
  const char *v6;
  void *v7;
  NSObject *v8;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = *(void **)(a1 + 32);
  v11 = 0;
  objc_msgSend__allSetsSorted_(v3, a2, (uint64_t)&v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v11;
  objc_msgSend_objectForKey_(v4, v6, *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136315650;
      v13 = "-[SEMIndexSiteManager _updateApplicableIndexSitesWithSets:shouldDefer:]_block_invoke";
      v14 = 2112;
      v15 = v10;
      v16 = 2112;
      v17 = v5;
      _os_log_error_impl(&dword_2462C4000, v8, OS_LOG_TYPE_ERROR, "%s Failed to resolve all sets applicable to index site: %@ error: %@", buf, 0x20u);
    }
  }

  return v7;
}

void sub_24630A2FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24630A31C(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  void *v5;
  id v6;
  void *v7;
  const char *v8;
  const char *v9;
  char v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend__cachedWriterForIndexSite_(*(void **)(a1 + 32), v4, (uint64_t)v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = sub_24630A52C;
  v15[3] = &unk_251783238;
  v16 = *(id *)(a1 + 40);
  v6 = v3;
  v17 = v6;
  v7 = (void *)MEMORY[0x2495571C4](v15);
  if ((objc_msgSend_performVerificationWithAllSets_shouldDefer_(v5, v8, (uint64_t)v7, *(_QWORD *)(a1 + 48)) & 1) != 0)
  {
    v14 = 0;
    v10 = objc_msgSend_recordMaintenance_(v6, v9, (uint64_t)&v14);
    v11 = v14;
    if ((v10 & 1) == 0)
    {
      v12 = qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v19 = "-[SEMIndexSiteManager _didPerformVerification:]_block_invoke";
        v20 = 2112;
        v21 = v6;
        v22 = 2112;
        v23 = v11;
        _os_log_error_impl(&dword_2462C4000, v12, OS_LOG_TYPE_ERROR, "%s Failed to record maintenance at index site: %@ error: %@", buf, 0x20u);
      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    }

  }
  else
  {
    v13 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[SEMIndexSiteManager _didPerformVerification:]_block_invoke";
      v20 = 2112;
      v21 = v5;
      _os_log_error_impl(&dword_2462C4000, v13, OS_LOG_TYPE_ERROR, "%s Maintenance aborted at index site: %@", buf, 0x16u);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }

}

id sub_24630A52C(uint64_t a1, const char *a2)
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_objectForKey_(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v7 = 136315394;
      v8 = "-[SEMIndexSiteManager _didPerformVerification:]_block_invoke_2";
      v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_2462C4000, v4, OS_LOG_TYPE_INFO, "%s No available sets at index site: %@", (uint8_t *)&v7, 0x16u);
    }
    v3 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v3;
}

void sub_24630A734(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  void *v5;
  const char *v6;
  const char *v7;
  void *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend__cachedWriterForIndexSite_(*(void **)(a1 + 32), v4, (uint64_t)v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(*(void **)(a1 + 40), v6, (uint64_t)v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v9 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
    {
      v10 = 136315394;
      v11 = "-[SEMIndexSiteManager _handleSysdiagnoseStarted]_block_invoke";
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_2462C4000, v9, OS_LOG_TYPE_INFO, "%s No available sets at index site: %@", (uint8_t *)&v10, 0x16u);
    }
    v8 = (void *)MEMORY[0x24BDBD1A8];
  }
  objc_msgSend_logCurrentStateWithAllSets_(v5, v7, (uint64_t)v8);

}

uint64_t sub_24630ACEC(uint64_t a1, const char *a2)
{
  return objc_msgSend_openWithError_(*(void **)(a1 + 32), a2, (uint64_t)a2);
}

uint64_t sub_24630AD74(uint64_t a1, const char *a2)
{
  return objc_msgSend_closeWithError_(*(void **)(a1 + 32), a2, (uint64_t)a2);
}

void sub_24630AF68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_24630AF88(_QWORD *a1, const char *a2)
{
  uint64_t result;

  result = objc_msgSend_enumerateRecordResultsOfSelect_recordClass_error_usingBlock_(*(void **)(a1[4] + 8), a2, a1[5], a1[8], a1[9], a1[6]);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = result;
  return result;
}

void sub_24630B180(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_24630B1A0(uint64_t a1, const char *a2)
{
  uint64_t result;

  result = objc_msgSend_enumerateRecordResultsOfSelect_recordClass_batchSize_offset_enumerateAll_error_usingBlock_(*(void **)(*(_QWORD *)(a1 + 32) + 8), a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(unsigned __int8 *)(a1 + 96), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

void sub_24630B38C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_24630B3AC(_QWORD *a1, const char *a2)
{
  uint64_t result;

  result = objc_msgSend_enumerateRowResultsOfSelect_error_usingBlock_(*(void **)(a1[4] + 8), a2, a1[5], a1[8], a1[6]);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = result;
  return result;
}

void sub_24630B5A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_24630B5C0(uint64_t a1, const char *a2)
{
  uint64_t result;

  result = objc_msgSend_enumerateRowResultsOfSelect_batchSize_offset_enumerateAll_error_usingBlock_(*(void **)(*(_QWORD *)(a1 + 32) + 8), a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(unsigned __int8 *)(a1 + 88), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

__CFString *sub_24630BC80(unsigned int a1, const char *a2)
{
  if (a1 - 1 < 3)
    return off_251783370[(char)(a1 - 1)];
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("Undefined (%u)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_24630C9A0()
{
  id v0;
  const char *v1;
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v0 = objc_alloc((Class)objc_opt_class());
  sub_2462ED950();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_defaultSettings(SEMSettings, v1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend_initWithRootDirectoryURL_settings_(v0, v4, (uint64_t)v7, v3);
  v6 = (void *)qword_25441F928;
  qword_25441F928 = v5;

}

uint64_t sub_24630CF24(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_24630CF34(uint64_t a1)
{

}

void sub_24630CF3C(uint64_t a1, const char *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  int v20;
  SEMSkitReader *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  SEMSkitEmptyAccess *v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  __CFString *v34;
  SEMSkitEmptyAccess *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  const char *v46;
  int isFileNotFoundError;
  const __CFString *v48;
  id v49;
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  const __CFString *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v49 = 0;
  objc_msgSend_indexSiteWithUserId_error_(v4, a2, v3, &v49);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (__CFString *)v49;
  if (!v5)
  {
    v27 = (void *)qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      v42 = *(void **)(a1 + 40);
      v43 = v27;
      sub_2462ECDC8(v42, 0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (void *)objc_opt_class();
      isFileNotFoundError = objc_msgSend__isFileNotFoundError_(v45, v46, (uint64_t)v8);
      v48 = CFSTR("No such file.");
      *(_DWORD *)buf = 136315650;
      v51 = "-[SEMIndexSiteReadAccess skitReadAccessWithUserId:]_block_invoke";
      v52 = 2112;
      if (!isFileNotFoundError)
        v48 = v8;
      v53 = v44;
      v54 = 2112;
      v55 = v48;
      _os_log_error_impl(&dword_2462C4000, v43, OS_LOG_TYPE_ERROR, "%s Failed to resolve index site (%@) - %@ Returning empty access", buf, 0x20u);

    }
    v28 = objc_alloc_init(SEMSkitEmptyAccess);
    v29 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v29 + 40);
    *(_QWORD *)(v29 + 40) = v28;
    goto LABEL_16;
  }
  if (!*(_BYTE *)(a1 + 56)
    || (objc_msgSend_objectForKey_(*(void **)(*(_QWORD *)(a1 + 32) + 32), v6, (uint64_t)v5),
        v9 = objc_claimAutoreleasedReturnValue(),
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8),
        v11 = *(void **)(v10 + 40),
        *(_QWORD *)(v10 + 40) = v9,
        v11,
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend_skitDirectoryURL(v5, v6, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_path(v12, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend_fileExistsAtPath_(v15, v19, (uint64_t)v18);

    if (v20)
    {
      v21 = [SEMSkitReader alloc];
      v23 = objc_msgSend_initWithSkitDirectoryURL_(v21, v22, (uint64_t)v12);
      v24 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v25 = *(void **)(v24 + 40);
      *(_QWORD *)(v24 + 40) = v23;

    }
    else
    {
      v30 = (void *)qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
      {
        v31 = v30;
        objc_msgSend_path(v12, v32, v33);
        v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v51 = "-[SEMIndexSiteReadAccess skitReadAccessWithUserId:]_block_invoke";
        v52 = 2112;
        v53 = v5;
        v54 = 2112;
        v55 = v34;
        _os_log_impl(&dword_2462C4000, v31, OS_LOG_TYPE_INFO, "%s (%@) SKIT directory has not been created at path: %@", buf, 0x20u);

      }
    }
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      v35 = objc_alloc_init(SEMSkitEmptyAccess);
      v36 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v37 = *(void **)(v36 + 40);
      *(_QWORD *)(v36 + 40) = v35;

    }
    if (*(_BYTE *)(a1 + 56))
    {
      v38 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
      if (!v38)
      {
        v39 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        v40 = *(_QWORD *)(a1 + 32);
        v41 = *(void **)(v40 + 32);
        *(_QWORD *)(v40 + 32) = v39;

        v38 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
      }
      objc_msgSend_setObject_forKey_(v38, v26, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v5);
    }
LABEL_16:

  }
}

void sub_24630D394(uint64_t a1, const char *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  __CFString *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  int v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;
  SEMDatabaseEmptyAccess *v30;
  uint64_t v31;
  NSObject *v32;
  SEMDatabaseEmptyAccess *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  const char *v44;
  int isFileNotFoundError;
  const __CFString *v46;
  id v47;
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  const __CFString *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v47 = 0;
  objc_msgSend_indexSiteWithUserId_error_(v4, a2, v3, &v47);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (__CFString *)v47;
  if (!v5)
  {
    v29 = (void *)qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      v40 = *(void **)(a1 + 40);
      v41 = v29;
      sub_2462ECDC8(v40, 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (void *)objc_opt_class();
      isFileNotFoundError = objc_msgSend__isFileNotFoundError_(v43, v44, (uint64_t)v8);
      v46 = CFSTR("does not exist");
      *(_DWORD *)buf = 136315650;
      v49 = "-[SEMIndexSiteReadAccess ftsDatabaseReadAccessWithUserId:]_block_invoke";
      v50 = 2112;
      if (!isFileNotFoundError)
        v46 = v8;
      v51 = v42;
      v52 = 2112;
      v53 = v46;
      _os_log_error_impl(&dword_2462C4000, v41, OS_LOG_TYPE_ERROR, "%s Failed to resolve %@ index site (%@) Returning empty access", buf, 0x20u);

    }
    v30 = objc_alloc_init(SEMDatabaseEmptyAccess);
    v31 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v15 = *(__CFString **)(v31 + 40);
    *(_QWORD *)(v31 + 40) = v30;
    goto LABEL_16;
  }
  if (!*(_BYTE *)(a1 + 56)
    || (objc_msgSend_objectForKey_(*(void **)(*(_QWORD *)(a1 + 32) + 40), v6, (uint64_t)v5),
        v9 = objc_claimAutoreleasedReturnValue(),
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8),
        v11 = *(void **)(v10 + 40),
        *(_QWORD *)(v10 + 40) = v9,
        v11,
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend_ftsDirectoryURL(v5, v6, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_path(v12, v13, v14);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend_fileExistsAtPath_(v18, v19, (uint64_t)v15);

    if (v20)
    {
      objc_msgSend_ftsDatabaseURL(v5, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_readerForDatabaseAtURL_(SEMDatabaseReader, v24, (uint64_t)v23);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v27 = *(void **)(v26 + 40);
      *(_QWORD *)(v26 + 40) = v25;

    }
    else
    {
      v32 = qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v49 = "-[SEMIndexSiteReadAccess ftsDatabaseReadAccessWithUserId:]_block_invoke";
        v50 = 2112;
        v51 = v5;
        v52 = 2112;
        v53 = v15;
        _os_log_impl(&dword_2462C4000, v32, OS_LOG_TYPE_INFO, "%s (%@) FTS database has not been created at path: %@", buf, 0x20u);
      }
    }
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      v33 = objc_alloc_init(SEMDatabaseEmptyAccess);
      v34 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v35 = *(void **)(v34 + 40);
      *(_QWORD *)(v34 + 40) = v33;

    }
    if (*(_BYTE *)(a1 + 56))
    {
      v36 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      if (!v36)
      {
        v37 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        v38 = *(_QWORD *)(a1 + 32);
        v39 = *(void **)(v38 + 40);
        *(_QWORD *)(v38 + 40) = v37;

        v36 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      }
      objc_msgSend_setObject_forKey_(v36, v28, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v5);
    }
LABEL_16:

  }
}

void sub_24630D8EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_24630D9C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_24630DA1C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_24630DAD4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_24630DB64(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_24630DBE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

uint64_t sub_24630DCC0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_24630DCD0(uint64_t a1)
{

}

void sub_24630DCD8(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 8));
}

void sub_24630DDA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (!v4)
  {
    objc_msgSend_currentDictationLanguageCodes(SEMAssistantSettingsBridge, 0, a3);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 16);
    *(_QWORD *)(v6 + 16) = v5;

    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v4);
}

void sub_24630DE54(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_currentSiriLanguageCode(SEMAssistantSettingsBridge, a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v16 = 136315650;
    v17 = "-[SEMLocalization refresh]_block_invoke";
    v18 = 2112;
    v19 = v4;
    v20 = 2112;
    v21 = v7;
    _os_log_impl(&dword_2462C4000, v5, OS_LOG_TYPE_INFO, "%s Siri language is %@, previously %@", (uint8_t *)&v16, 0x20u);
  }
  if ((objc_msgSend_isEqual_(v4, v6, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)) & 1) == 0)
  {
    v10 = a1 + 32;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), v4);
    *(_DWORD *)(*(_QWORD *)v10 + 32) = 0;
    *(_BYTE *)(*(_QWORD *)v10 + 36) = 0;
    v11 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    *(_QWORD *)(*(_QWORD *)v10 + 24) = 0;

  }
  objc_msgSend_currentDictationLanguageCodes(SEMAssistantSettingsBridge, v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
  {
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v16 = 136315650;
    v17 = "-[SEMLocalization refresh]_block_invoke";
    v18 = 2112;
    v19 = v12;
    v20 = 2112;
    v21 = v15;
    _os_log_impl(&dword_2462C4000, v13, OS_LOG_TYPE_INFO, "%s Dictation languages are %@, previously %@", (uint8_t *)&v16, 0x20u);
  }
  if ((objc_msgSend_isEqual_(v12, v14, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16)) & 1) == 0)
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), v12);

}

void sub_24630E028(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_24630E0C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_24630E138(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id sub_24630E148(uint64_t a1, const char *a2)
{
  void *v2;
  void *v3;
  const char *v4;
  void *v5;

  if ((unint64_t)(a1 - 1) > 0x2B)
  {
    v5 = 0;
  }
  else
  {
    v2 = (void *)MEMORY[0x24BDBCEA0];
    objc_msgSend_stringWithCString_encoding_(MEMORY[0x24BDD17C8], a2, (uint64_t)off_251783490[a1], 4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localeWithLocaleIdentifier_(v2, v4, (uint64_t)v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

void sub_24630E1C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_24630E2C4(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_24630E390(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t sub_24630E3AC(void *a1, const char *a2, uint64_t a3)
{
  void *v3;
  uint64_t v4;

  objc_msgSend_localeIdentifier(a1, a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = sub_24630F1B4(v3);

  return v4;
}

void sub_24630E3E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_24630E4E8(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  const char *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  void *v22;
  id obj;
  uint64_t v24;
  void *v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v2 = a1[4];
  if (*(_BYTE *)(v2 + 36))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(v2 + 24));
LABEL_3:
    v3 = (void *)objc_opt_class();
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend_supportedLocaleFromLanguageCode_(v3, v4, *(_QWORD *)(a1[4] + 8));
    return;
  }
  v5 = (void *)objc_opt_class();
  objc_msgSend_supportedNSLocaleFromLanguageCode_(v5, v6, *(_QWORD *)(a1[4] + 8));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)a1[4];
    v10 = *(_QWORD *)(a1[5] + 8);
    obj = *(id *)(v10 + 40);
    v11 = objc_msgSend__locateMorphunAssetForLocale_outAssetPath_error_(v9, v7, (uint64_t)v8, &obj, a1[7]);
    objc_storeStrong((id *)(v10 + 40), obj);
    if ((v11 & 1) != 0)
    {
      *(_BYTE *)(a1[4] + 36) = 1;
      objc_storeStrong((id *)(a1[4] + 24), *(id *)(*(_QWORD *)(a1[5] + 8) + 40));

      goto LABEL_3;
    }
  }
  else
  {
    v12 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
    {
      v14 = *(_QWORD *)(a1[4] + 8);
      *(_DWORD *)buf = 136315394;
      v27 = "-[SEMLocalization locateMorphunAssetForSiriLanguage:error:]_block_invoke";
      v28 = 2112;
      v29 = v14;
      _os_log_impl(&dword_2462C4000, v12, OS_LOG_TYPE_INFO, "%s Unsupported Siri Language: %@", buf, 0x16u);
    }
    v15 = (_QWORD *)a1[7];
    v16 = (void *)MEMORY[0x24BDD1540];
    v24 = *MEMORY[0x24BDD0FC8];
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v13, (uint64_t)CFSTR("Unsupported Siri Language: \"%@\""), *(_QWORD *)(a1[4] + 8));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v17;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v18, (uint64_t)&v25, &v24, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v16, v20, (uint64_t)CFSTR("com.apple.siri.entitymatcher.tokenization"), 1, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v15)
    {
      if (v21)
        *v15 = objc_retainAutorelease(v21);
    }

  }
}

void sub_24630E720(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_24630EE3C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_24630EF10(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  int v19;
  const char *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (id)qword_25441F970;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend_localeIdentifier(*(void **)(a1 + 32), v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 136315906;
    v20 = "-[SEMLocalization _locateMorphunAssetForLocale:outAssetPath:error:]_block_invoke";
    v21 = 2112;
    v22 = v9;
    v23 = 1024;
    v24 = a2;
    v25 = 2112;
    v26 = v5;
    _os_log_impl(&dword_2462C4000, v6, OS_LOG_TYPE_INFO, "%s MorphunAssets download completion invoked for locale: %@ result: %d error: %@", (uint8_t *)&v19, 0x26u);

  }
  if (v5)
  {
    sub_2462F1D28(0, v5);
  }
  else
  {
    v10 = (id)qword_25441F970;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend_localeIdentifier(*(void **)(a1 + 32), v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 136315394;
      v20 = "-[SEMLocalization _locateMorphunAssetForLocale:outAssetPath:error:]_block_invoke";
      v21 = 2112;
      v22 = v13;
      _os_log_impl(&dword_2462C4000, v10, OS_LOG_TYPE_INFO, "%s MorphunAssets finished downloading asynchronously for locale: %@. Rebuilding indexing", (uint8_t *)&v19, 0x16u);

    }
    objc_msgSend_sharedInstance(SEMDispatcher, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleSettingsChange(v16, v17, v18);

  }
}

void sub_24630F0B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id sub_24630F13C(uint64_t a1, const char *a2)
{
  if ((unint64_t)(a1 - 1) >= 0x2C)
    objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], a2, 0);
  else
    objc_msgSend_numberWithUnsignedChar_(MEMORY[0x24BDD16E0], a2, a1);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t sub_24630F170(uint64_t a1, const char *a2)
{
  unsigned __int8 v2;

  if ((unint64_t)(a1 - 1) >= 0x2C)
    v2 = 0;
  else
    v2 = a1;
  if (v2 <= 0x2Cu)
    return objc_msgSend_stringWithCString_encoding_(MEMORY[0x24BDD17C8], a2, (uint64_t)off_251783490[v2], 4);
  else
    return objc_msgSend_stringWithCString_encoding_(MEMORY[0x24BDD17C8], a2, (uint64_t)"", 4);
}

uint64_t sub_24630F1B4(void *a1)
{
  const char *v1;
  id v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;

  v2 = a1;
  if (qword_25441F940 != -1)
    dispatch_once(&qword_25441F940, &unk_251783470);
  objc_msgSend_objectForKey_((void *)qword_25441F938, v1, (uint64_t)v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_unsignedShortValue(v3, v4, v5);
  if ((unint64_t)v6 - 1 >= 0x2C)
    v7 = 0;
  else
    v7 = v6;

  return v7;
}

void sub_24630F23C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_24630F258()
{
  id v0;
  void *v1;
  const char *v2;
  uint64_t i;
  const char *v4;
  void *v5;
  void *v6;
  void *v7;
  const char *v8;

  v0 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v1 = (void *)qword_25441F938;
  qword_25441F938 = (uint64_t)v0;

  for (i = 0; i != 45; ++i)
  {
    if ((unint64_t)(i - 1) <= 0x2B)
    {
      objc_msgSend_stringWithCString_encoding_(MEMORY[0x24BDD17C8], v2, (uint64_t)off_251783490[i], 4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v6 = (void *)qword_25441F938;
        sub_24630F13C(i, v4);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(v6, v8, (uint64_t)v7, v5);

      }
    }
  }
}

void sub_24630F314(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id sub_24630F330(uint64_t a1, const char *a2)
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  if ((unint64_t)(a1 - 1) >= 0x2C)
    v4 = 0;
  else
    v4 = a1;
  if (v4 <= 0x2Cu)
    objc_msgSend_stringWithCString_encoding_(MEMORY[0x24BDD17C8], a2, (uint64_t)off_251783490[v4], 4);
  else
    objc_msgSend_stringWithCString_encoding_(MEMORY[0x24BDD17C8], a2, (uint64_t)"", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v6, a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("%@ (%@)"), v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void sub_24630F3EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_24630F574(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_24630F60C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_24630F7F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_24630F9F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2463100D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, void *a18)
{

  _Unwind_Resume(a1);
}

void sub_2463101C4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  int isBookmarkUpToDate;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  int v24;
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend_changePublisherWithUseCase_(v5, v7, 0x251784FD0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_descriptionForBookmark_(*(void **)(a1 + 32), v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  isBookmarkUpToDate = objc_msgSend_isBookmarkUpToDate_(v8, v11, (uint64_t)v6);
  v13 = qword_25441F970;
  if (isBookmarkUpToDate)
  {
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
    {
      v15 = *(_QWORD *)(a1 + 48);
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v24 = 136315906;
      v25 = "-[SEMIndexSiteWriter logCurrentStateWithAllSets:]_block_invoke";
      v26 = 2112;
      v27 = v16;
      v28 = 2112;
      v29 = v15;
      v30 = 2112;
      v31 = v10;
      _os_log_impl(&dword_2462C4000, v13, OS_LOG_TYPE_INFO, "%s (%@) [%@] Up-to-date: %@", (uint8_t *)&v24, 0x2Au);
    }
  }
  else
  {
    v17 = (id)qword_25441F970;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v20 = *(_QWORD *)(a1 + 48);
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v24 = 136316674;
      v25 = "-[SEMIndexSiteWriter logCurrentStateWithAllSets:]_block_invoke";
      v26 = 2112;
      v27 = v21;
      v28 = 2112;
      v29 = v20;
      v30 = 2112;
      v31 = v10;
      v32 = 2112;
      v33 = v5;
      v34 = 2048;
      v35 = objc_msgSend_sharedItemCount(v8, v18, v19);
      v36 = 2048;
      v37 = objc_msgSend_localItemInstanceCount(v8, v22, v23);
      _os_log_impl(&dword_2462C4000, v17, OS_LOG_TYPE_INFO, "%s (%@) [%@] OUTDATED: %@ with current set %@ sharedItemCount: %lu localItemInstanceCount: %lu", (uint8_t *)&v24, 0x48u);
    }

  }
  objc_msgSend_removeObject_(*(void **)(a1 + 56), v14, (uint64_t)v5);
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);

}

void sub_2463103D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_24631060C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_2463113F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

uint64_t sub_246311510()
{
  return 0;
}

void sub_246311648(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2463116D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_246311820(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2463130D8()
{
  NSObject *v0;
  NSObject *v1;
  dispatch_queue_t v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v0 = qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
  {
    v13 = 136315138;
    v14 = "+[SEMDispatcher sharedInstance]_block_invoke";
    _os_log_impl(&dword_2462C4000, v0, OS_LOG_TYPE_INFO, "%s Starting up...", (uint8_t *)&v13, 0xCu);
  }
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = dispatch_queue_create("Siri Entity Matcher Dispatcher", v1);

  objc_msgSend_defaultManager(SEMIndexSiteManager, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_settings(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc((Class)objc_opt_class());
  v11 = objc_msgSend_initWithIndexSiteManager_settings_queue_(v9, v10, (uint64_t)v5, v8, v2);
  v12 = (void *)qword_25441F950;
  qword_25441F950 = v11;

}

uint64_t sub_2463133CC(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_handleSetChangeBatch_, a2);
}

void sub_246313C8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_246313D10(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_246313F44(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

uint64_t AFBuildVersion()
{
  return MEMORY[0x24BE08BD0]();
}

uint64_t AFDeviceSupportsSiriUOD()
{
  return MEMORY[0x24BE08CC0]();
}

uint64_t AFIsCustomerInstall()
{
  return MEMORY[0x24BE08D80]();
}

uint64_t AFOfflineDictationCapable()
{
  return MEMORY[0x24BE08E48]();
}

uint64_t AFOfflineDictationStatusStringIsInstalled()
{
  return MEMORY[0x24BE08E70]();
}

uint64_t AFShouldRunAsrOnServerForUOD()
{
  return MEMORY[0x24BE08F60]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

uint64_t CEMCreateEmojiLocaleData()
{
  return MEMORY[0x24BE1B200]();
}

uint64_t CEMEmojiLocaleDataEnumerateSearchResultsInStringWithBlock()
{
  return MEMORY[0x24BE1B220]();
}

uint64_t CEMEmojiTokenGetString()
{
  return MEMORY[0x24BE1B258]();
}

uint64_t CEMStringIsSingleEmoji()
{
  return MEMORY[0x24BE1B280]();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC190](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x24BDBC580](alloc, chars, numChars);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x24BDBC620](theString, range.location, range.length, buffer);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x24BE04728]();
}

uint64_t KVFieldTypeFromCascadeFieldType()
{
  return MEMORY[0x24BE5E830]();
}

uint64_t KVFieldTypeFromNumber()
{
  return MEMORY[0x24BE5E838]();
}

uint64_t KVFieldTypeToCascadeFieldType()
{
  return MEMORY[0x24BE5E840]();
}

uint64_t KVItemTypeFromNumber()
{
  return MEMORY[0x24BE5E858]();
}

uint64_t KVItemTypeToCascadeItemType()
{
  return MEMORY[0x24BE5E860]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x24BDD1250](proto);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t PB::Writer::Writer(PB::Writer *this)
{
  return MEMORY[0x24BE7B2E8](this);
}

void PB::Writer::~Writer(PB::Writer *this)
{
  MEMORY[0x24BE7B2F0](this);
}

uint64_t siri::ontology::UsoGraphProtoWriter::toProtobuf()
{
  return MEMORY[0x24BE9E388]();
}

uint64_t siri::ontology::oname::graph::ontology_init::common_App(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3B00](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Group(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3B08](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_name(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3B10](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Person(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3B28](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_label(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3B30](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_names(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3B38](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_value(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3B40](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Workout(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3B60](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_entity(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3B68](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AppEntity(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3B78](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_MediaItem(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3B80](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Medication(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3B88](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_NoteFolder(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3B90](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_UserEntity(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3B98](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_UserProfile(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3BB0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Organization(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3BC8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_RadioStation(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3BD0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ReminderList(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3BD8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_VoiceCommand(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3BE0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_CalendarEvent(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3BE8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_PostalAddress(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3BF8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ContactAddress(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3C18](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_PaymentAccount(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3C28](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_frequencyName(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3C30](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_PointOfInterest(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3C38](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_WorkoutInstructor(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3C60](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_relationshipType(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3C70](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_PersonRelationship(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x24BEA3CB8](this);
}

uint64_t skit::strip_bidi()
{
  return MEMORY[0x24BEDDCB8]();
}

uint64_t skit::IndexReader::open(skit::IndexReader *this)
{
  return MEMORY[0x24BEDDCC0](this);
}

uint64_t skit::IndexReader::close(skit::IndexReader *this)
{
  return MEMORY[0x24BEDDCC8](this);
}

uint64_t skit::IndexReader::IndexReader(skit::IndexReader *this)
{
  return MEMORY[0x24BEDDCD0](this);
}

void skit::IndexReader::~IndexReader(skit::IndexReader *this)
{
  MEMORY[0x24BEDDCD8](this);
}

uint64_t skit::IndexReader::operator=()
{
  return MEMORY[0x24BEDDCE0]();
}

uint64_t skit::IndexWriter::set_dp_class(skit::IndexWriter *this)
{
  return MEMORY[0x24BEDDCE8](this);
}

uint64_t skit::IndexWriter::flush_threshold(skit::IndexWriter *this)
{
  return MEMORY[0x24BEDDCF0](this);
}

{
  return MEMORY[0x24BEDDE28](this);
}

uint64_t skit::IndexWriter::set_doc_store_write_cache(skit::IndexWriter *this)
{
  return MEMORY[0x24BEDDCF8](this);
}

uint64_t skit::IndexWriter::set_term_index_write_cache(skit::IndexWriter *this)
{
  return MEMORY[0x24BEDDD00](this);
}

uint64_t skit::IndexWriter::clear(skit::IndexWriter *this)
{
  return MEMORY[0x24BEDDD08](this);
}

uint64_t skit::IndexWriter::erase()
{
  return MEMORY[0x24BEDDD10]();
}

uint64_t skit::IndexWriter::append()
{
  return MEMORY[0x24BEDDD18]();
}

uint64_t skit::IndexWriter::end_txn(skit::IndexWriter *this)
{
  return MEMORY[0x24BEDDD20](this);
}

uint64_t skit::IndexWriter::set_mode(skit::IndexWriter *this)
{
  return MEMORY[0x24BEDDD28](this);
}

uint64_t skit::IndexWriter::abort_txn(skit::IndexWriter *this)
{
  return MEMORY[0x24BEDDD30](this);
}

uint64_t skit::IndexWriter::start_txn(skit::IndexWriter *this)
{
  return MEMORY[0x24BEDDD38](this);
}

uint64_t skit::IndexWriter::IndexWriter(skit::IndexWriter *this)
{
  return MEMORY[0x24BEDDD40](this);
}

void skit::IndexWriter::~IndexWriter(skit::IndexWriter *this)
{
  MEMORY[0x24BEDDD48](this);
}

uint64_t skit::IndexWriter::operator=()
{
  return MEMORY[0x24BEDDD50]();
}

uint64_t skit::to_u16string()
{
  return MEMORY[0x24BEDDD58]();
}

uint64_t skit::is_significant()
{
  return MEMORY[0x24BEDDD60]();
}

uint64_t skit::entity_token_wgt(skit *this)
{
  return MEMORY[0x24BEDDD68](this);
}

uint64_t skit::FieldSpanMatcherV3::alias_filters()
{
  return MEMORY[0x24BEDDD70]();
}

uint64_t skit::FieldSpanMatcherV3::alias_span_matcher()
{
  return MEMORY[0x24BEDDD78]();
}

uint64_t skit::FieldSpanMatcherV3::query_token_stream_end(skit::FieldSpanMatcherV3 *this)
{
  return MEMORY[0x24BEDDD80](this);
}

uint64_t skit::FieldSpanMatcherV3::query_token_stream_begin(skit::FieldSpanMatcherV3 *this)
{
  return MEMORY[0x24BEDDD88](this);
}

uint64_t skit::FieldSpanMatcherV3::FieldSpanMatcherV3()
{
  return MEMORY[0x24BEDDD90]();
}

uint64_t skit::AliasSpanMatchCompare::compare_locale(skit::AliasSpanMatchCompare *this)
{
  return MEMORY[0x24BEDDD98](this);
}

uint64_t skit::AliasSpanMatchCompare::compare_entity_type(skit::AliasSpanMatchCompare *this)
{
  return MEMORY[0x24BEDDDA0](this);
}

uint64_t skit::Alias::init(skit::Alias *this)
{
  return MEMORY[0x24BEDDDA8](this);
}

uint64_t skit::Alias::Alias(skit::Alias *this, std::__fs::filesystem::path *a2, std::__fs::filesystem::path *a3)
{
  return MEMORY[0x24BEDDDB0](this, a2, a3);
}

uint64_t skit::Analyzer::dedup(skit::Analyzer *this, TokenStream *a2)
{
  return MEMORY[0x24BEDDDB8](this, a2);
}

uint64_t skit::internal::murmur3_32(skit::internal *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BEDDDC0](this, a2);
}

uint64_t skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>::MergedFieldMatchImpl()
{
  return off_25175E248();
}

uint64_t skit::ContextV2::index_writer()
{
  return MEMORY[0x24BEDDDC8]();
}

uint64_t skit::ContextV2::cleanup(skit::ContextV2 *this)
{
  return MEMORY[0x24BEDDDD0](this);
}

uint64_t skit::ContextV2::ContextV2()
{
  return MEMORY[0x24BEDDDD8]();
}

void skit::ContextV2::~ContextV2(skit::ContextV2 *this)
{
  MEMORY[0x24BEDDDE0](this);
}

uint64_t skit::to_string()
{
  return MEMORY[0x24BEDDDE8]();
}

uint64_t morphun::dictionary::DictionaryMetaData::createDictionary()
{
  return MEMORY[0x24BEDC878]();
}

uint64_t morphun::TokenIterator::TokenIterator(morphun::TokenIterator *this, const Token *a2, const Token *a3)
{
  return MEMORY[0x24BEDC880](this, a2, a3);
}

uint64_t morphun::TokenIterator::operator++()
{
  return MEMORY[0x24BEDC888]();
}

uint64_t morphun::TokenizerFactory::createTokenizer()
{
  return MEMORY[0x24BEDC890]();
}

uint64_t morphun::util::LocaleUtils::toLocale()
{
  return MEMORY[0x24BEDC8A0]();
}

uint64_t morphun::util::ULocale::ULocale()
{
  return MEMORY[0x24BEDC8B0]();
}

void morphun::util::ULocale::~ULocale(morphun::util::ULocale *this)
{
  MEMORY[0x24BEDC8B8](this);
}

uint64_t morphun::analysis::DefaultAnalyzerFactory::createAnalyzer(morphun::analysis::DefaultAnalyzerFactory *this, const morphun::util::ULocale *a2)
{
  return MEMORY[0x24BEDC8C0](this, a2);
}

uint64_t morphun::analysis::DefaultAnalyzerFactory::DefaultAnalyzerFactory(morphun::analysis::DefaultAnalyzerFactory *this)
{
  return MEMORY[0x24BEDC8C8](this);
}

void morphun::analysis::DefaultAnalyzerFactory::~DefaultAnalyzerFactory(morphun::analysis::DefaultAnalyzerFactory *this)
{
  MEMORY[0x24BEDC8D0](this);
}

uint64_t morphun::resources::DataRegistrationService::registerDataPathForLocale()
{
  return MEMORY[0x24BEDC8E8]();
}

uint64_t skit::EmojiFilter::filter()
{
  return MEMORY[0x24BEDDDF0]();
}

uint64_t skit::EmojiFilter::filter(skit::EmojiFilter *this, Token *a2)
{
  return MEMORY[0x24BEDDDF8](this, a2);
}

uint64_t skit::IndexReader::search()
{
  return MEMORY[0x24BEDDE00]();
}

uint64_t skit::IndexReader::is_open(skit::IndexReader *this)
{
  return MEMORY[0x24BEDDE08](this);
}

uint64_t skit::IndexWriter::record_cnt(skit::IndexWriter *this)
{
  return MEMORY[0x24BEDDE10](this);
}

uint64_t skit::IndexWriter::segment_cnt(skit::IndexWriter *this)
{
  return MEMORY[0x24BEDDE18](this);
}

uint64_t skit::IndexWriter::should_merge(skit::IndexWriter *this)
{
  return MEMORY[0x24BEDDE20](this);
}

uint64_t skit::IndexWriter::index_count_threshold(skit::IndexWriter *this)
{
  return MEMORY[0x24BEDDE30](this);
}

uint64_t skit::IndexWriter::size(skit::IndexWriter *this)
{
  return MEMORY[0x24BEDDE38](this);
}

uint64_t skit::SpanMatchV3::stop_word_cnt(skit::SpanMatchV3 *this)
{
  return MEMORY[0x24BEDDE40](this);
}

uint64_t skit::SpanMatchV3::alias_token_cnt(skit::SpanMatchV3 *this)
{
  return MEMORY[0x24BEDDE48](this);
}

uint64_t skit::SpanMatchV3::span(skit::SpanMatchV3 *this)
{
  return MEMORY[0x24BEDDE50](this);
}

uint64_t skit::SpanMatchV3::score(skit::SpanMatchV3 *this)
{
  return MEMORY[0x24BEDDE58](this);
}

uint64_t skit::SpanMatchV3::alias_ids(skit::SpanMatchV3 *this)
{
  return MEMORY[0x24BEDDE60](this);
}

uint64_t skit::SpanMatchV3::edit_dist(skit::SpanMatchV3 *this)
{
  return MEMORY[0x24BEDDE68](this);
}

uint64_t skit::SpanMatchV3::token_cnt(skit::SpanMatchV3 *this)
{
  return MEMORY[0x24BEDDE70](this);
}

uint64_t skit::NumberFilter::filter(skit::NumberFilter *this, Token *a2)
{
  return MEMORY[0x24BEDDE78](this, a2);
}

uint64_t skit::FieldSpanMatcherV3::merge_field()
{
  return MEMORY[0x24BEDDE80]();
}

uint64_t skit::FieldSpanMatcherV3::query_alias_matches_end(skit::FieldSpanMatcherV3 *this)
{
  return MEMORY[0x24BEDDE88](this);
}

uint64_t skit::FieldSpanMatcherV3::query_alias_matches_begin(skit::FieldSpanMatcherV3 *this)
{
  return MEMORY[0x24BEDDE90](this);
}

uint64_t skit::FieldSpanMatcherV3::match()
{
  return MEMORY[0x24BEDDE98]();
}

{
  return MEMORY[0x24BEDDEA0]();
}

uint64_t skit::FieldSpanMatcherV3::finalize()
{
  return MEMORY[0x24BEDDEA8]();
}

{
  return MEMORY[0x24BEDDEB0]();
}

uint64_t skit::Alias::match()
{
  return MEMORY[0x24BEDDEB8]();
}

uint64_t skit::ContextV2::index_reader()
{
  return MEMORY[0x24BEDDEC0]();
}

uint64_t morphun::dictionary::DictionaryMetaData::isKnownWord()
{
  return MEMORY[0x24BEDC8F0]();
}

uint64_t morphun::TokenIterator::operator*()
{
  return MEMORY[0x24BEDC8F8]();
}

uint64_t morphun::TokenIterator::operator!=()
{
  return MEMORY[0x24BEDC900]();
}

uint64_t morphun::TokenIterator::operator->()
{
  return MEMORY[0x24BEDC908]();
}

uint64_t morphun::Token::isWhitespace(morphun::Token *this)
{
  return MEMORY[0x24BEDC910](this);
}

uint64_t morphun::Token::getCleanValue(morphun::Token *this)
{
  return MEMORY[0x24BEDC918](this);
}

uint64_t morphun::Token::isSignificant(morphun::Token *this)
{
  return MEMORY[0x24BEDC920](this);
}

uint64_t morphun::Token::isHead(morphun::Token *this)
{
  return MEMORY[0x24BEDC928](this);
}

uint64_t morphun::Token::isTail(morphun::Token *this)
{
  return MEMORY[0x24BEDC930](this);
}

uint64_t morphun::Token::getNext(morphun::Token *this)
{
  return MEMORY[0x24BEDC938](this);
}

uint64_t morphun::Token::getValue(morphun::Token *this)
{
  return MEMORY[0x24BEDC940](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x24BEDAC98](this, __n, __c);
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
  MEMORY[0x24BEDACC0](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x24BEDACC8](this, __c);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x24BEDAE50]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x24BEDB010]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x24BEDB048]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x24BEDB050]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x24BEDB518](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x24BEDB530](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x24BEDB5E8]();
}

std::bad_alloc *__cdecl std::bad_alloc::bad_alloc(std::bad_alloc *this)
{
  return (std::bad_alloc *)MEMORY[0x24BEDB660](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete[]()
{
  return off_25175E548();
}

void operator delete(void *__p)
{
  off_25175E550(__p);
}

uint64_t operator delete()
{
  return off_25175E558();
}

uint64_t operator new[]()
{
  return off_25175E560();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_25175E568(__sz);
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  return (void *)off_25175E570(__sz, a2);
}

uint64_t operator new()
{
  return off_25175E578();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x24BEDB928]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

void __cxa_rethrow(void)
{
  MEMORY[0x24BEDB958]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
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

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x24BDAF230](a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
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

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

int sqlite3_bind_blob64(sqlite3_stmt *a1, int a2, const void *a3, sqlite3_uint64 a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x24BEDDF50](a1, *(_QWORD *)&a2, a3, a4, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x24BEDDF58](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x24BEDDF68](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x24BEDDF70](a1, *(_QWORD *)&a2);
}

int sqlite3_bind_parameter_count(sqlite3_stmt *a1)
{
  return MEMORY[0x24BEDDF78](a1);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x24BEDDF98](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_changes(sqlite3 *a1)
{
  return MEMORY[0x24BEDDFF8](a1);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x24BEDE008](a1);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return MEMORY[0x24BEDE018](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x24BEDE020](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE028](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE038](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  double result;

  MEMORY[0x24BEDE048](a1, *(_QWORD *)&iCol);
  return result;
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE058](a1, *(_QWORD *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x24BEDE068](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE078](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return (const char *)MEMORY[0x24BEDE110](*(_QWORD *)&a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x24BEDE118](a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return MEMORY[0x24BEDE128](db);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE140](pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x24BEDE1C0](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x24BEDE1D0](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE1E0](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x24BEDE2A8](a1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

uint64_t ubrk_close()
{
  return MEMORY[0x24BEDC070]();
}

uint64_t ubrk_first()
{
  return MEMORY[0x24BEDC078]();
}

uint64_t ubrk_next()
{
  return MEMORY[0x24BEDC0A0]();
}

uint64_t ubrk_open()
{
  return MEMORY[0x24BEDC0A8]();
}

uint64_t uscript_getScript()
{
  return MEMORY[0x24BEDC270]();
}

uint64_t xpc_copy_entitlements_for_self()
{
  return MEMORY[0x24BDB0838]();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0908](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

