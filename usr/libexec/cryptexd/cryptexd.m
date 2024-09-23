void sub_100002298(uint64_t a1, int a2)
{
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  char *v9;
  int v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  CFErrorRef v21;
  CFErrorRef v22;
  id v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  int v28;

  if (a2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logHandle"));

    if (v4)
    {
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logHandle"));
      v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "cryptexName"));
      if (v6)
        v8 = 3;
      else
        v8 = 2;
      *(_DWORD *)buf = 138543618;
      v26 = v7;
      v27 = 1024;
      v28 = a2;
      v9 = (char *)_os_log_send_and_compose_impl(v8, 0, 0, 0, &_mh_execute_header, v5, 16);

    }
    else
    {
      v19 = &_os_log_default;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "cryptexName"));
      *(_DWORD *)buf = 138543618;
      v26 = v20;
      v27 = 1024;
      v28 = a2;
      v9 = (char *)_os_log_send_and_compose_impl(2, 0, 0, 0, &_mh_execute_header, &_os_log_default, 16);

      v5 = &_os_log_default;
    }

    v21 = sub_10000A6F8("-[UpgradeOperation terminateJobsWithCompletion:]_block_invoke", "upgrade_sequencer.m", 128, "com.apple.security.cryptex.posix", a2, 0, v9);
LABEL_20:
    v22 = v21;
    free(v9);
    goto LABEL_21;
  }
  v10 = *__error();
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logHandle"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "cryptexName"));
    *(_DWORD *)buf = 138543362;
    v26 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Terminated jobs for cryptex '%{public}@'", buf, 0xCu);

  }
  *__error() = v10;
  v13 = proc_terminate_all_rsr(9);
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logHandle"));

    if (v14)
    {
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logHandle"));
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "cryptexName"));
      if (v16)
        v18 = 3;
      else
        v18 = 2;
      *(_DWORD *)buf = 138543618;
      v26 = v17;
      v27 = 1024;
      v28 = v13;
      v9 = (char *)_os_log_send_and_compose_impl(v18, 0, 0, 0, &_mh_execute_header, v15, 16);

    }
    else
    {
      v23 = &_os_log_default;
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "cryptexName"));
      *(_DWORD *)buf = 138543618;
      v26 = v24;
      v27 = 1024;
      v28 = v13;
      v9 = (char *)_os_log_send_and_compose_impl(2, 0, 0, 0, &_mh_execute_header, &_os_log_default, 16);

      v15 = &_os_log_default;
    }

    v21 = sub_10000A6F8("-[UpgradeOperation terminateJobsWithCompletion:]_block_invoke", "upgrade_sequencer.m", 143, "com.apple.security.cryptex.posix", v13, 0, v9);
    goto LABEL_20;
  }
  v22 = 0;
LABEL_21:
  (*(void (**)(_QWORD, CFErrorRef))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v22);

}

void sub_10000268C(_Unwind_Exception *a1)
{
  free(0);
  _Unwind_Resume(a1);
}

void sub_1000027EC(uint64_t a1)
{
  int v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = *__error();
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logHandle"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Upgrade complete.", v5, 2u);
  }

  *__error() = v2;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "group"));
  dispatch_group_leave(v4);

}

void sub_100002934(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "error"));
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void sub_100002C3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100002C64(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleInterfaceLockMessage:", v3);

}

void sub_100003024(_Unwind_Exception *a1)
{
  void *v1;

  free(v1);
  _Unwind_Resume(a1);
}

void sub_100003184(id a1)
{
  UpgradeSequencer *v1;
  void *v2;

  v1 = objc_alloc_init(UpgradeSequencer);
  v2 = (void *)qword_10005A3D8;
  qword_10005A3D8 = (uint64_t)v1;

}

int *sub_10000336C(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int *result;
  int v8;
  void *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_timeout"));

  v3 = *__error();
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logHandle"));
  v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_timeout"));
      v8 = 138412290;
      v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Timed out client.: %@", (uint8_t *)&v8, 0xCu);

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v8) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Timed out client. [no error]", (uint8_t *)&v8, 2u);
  }

  result = __error();
  *result = v3;
  return result;
}

void sub_100003558(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  char *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  char *v13;
  signed int v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  char *v19;
  CFErrorRef v20;
  void *v21;
  CFErrorRef v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  CFErrorRef v29;
  _QWORD block[5];
  id v31;
  uint64_t *v32;
  _QWORD v33[4];
  NSObject *v34;
  uint64_t v35;
  uint64_t *v36;
  char v37;
  _QWORD v38[6];
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  int v45;
  signed int v46;

  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = sub_100003B28;
  v43 = sub_100003B38;
  v44 = 0;
  v2 = dispatch_group_create();
  if ((objc_msgSend(*(id *)(a1 + 32), "_isInterfaceLocked") & 1) != 0)
  {
    v3 = (void *)v40[5];
    v40[5] = 0;

    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_100003B40;
    v38[3] = &unk_100055198;
    v4 = *(void **)(a1 + 40);
    v38[4] = *(_QWORD *)(a1 + 32);
    v38[5] = &v39;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v38);
    v5 = *(void **)(a1 + 32);
    if (v40[5])
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "logHandle"));

      if (v6)
      {
        v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logHandle"));
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          v8 = 3;
        else
          v8 = 2;
        LOWORD(v45) = 0;
        v9 = (char *)_os_log_send_and_compose_impl(v8, 0, 0, 0, &_mh_execute_header, v7, 16);

      }
      else
      {
        LOWORD(v45) = 0;
        v9 = (char *)_os_log_send_and_compose_impl(2, 0, 0, 0, &_mh_execute_header, &_os_log_default, 16);
      }
      v22 = sub_10000A6F8("-[UpgradeSequencer startUpgradeForCryptexes:killingJobs:withCompletion:]_block_invoke", "upgrade_sequencer.m", 425, "com.apple.security.cryptex", 11, (const void *)v40[5], v9);
      free(v9);
      v23 = v40[5];
      v40[5] = (uint64_t)v22;
      goto LABEL_24;
    }
    v14 = objc_msgSend(v5, "_setKernelUpgradeOngoing:", 1);
    v15 = *(void **)(a1 + 32);
    if (!v14)
    {
      objc_msgSend(v15, "_disableInterfaceLockTimeout");
      dispatch_group_enter(v2);
      v24 = *(void **)(a1 + 40);
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_100003E0C;
      v33[3] = &unk_1000551E8;
      v25 = v2;
      v26 = *(_QWORD *)(a1 + 32);
      v34 = v25;
      v35 = v26;
      v37 = *(_BYTE *)(a1 + 56);
      v36 = &v39;
      objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v33);
      v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "workQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000403C;
      block[3] = &unk_100055210;
      v28 = *(_QWORD *)(a1 + 32);
      v32 = &v39;
      block[4] = v28;
      v31 = *(id *)(a1 + 48);
      dispatch_group_notify(v25, v27, block);

      dispatch_group_leave(v25);
      v23 = v34;
LABEL_24:

      goto LABEL_25;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "logHandle"));

    if (v16)
    {
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logHandle"));
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        v18 = 3;
      else
        v18 = 2;
      v45 = 67109120;
      v46 = v14;
      v19 = (char *)_os_log_send_and_compose_impl(v18, 0, 0, 0, &_mh_execute_header, v17, 16);

    }
    else
    {
      v45 = 67109120;
      v46 = v14;
      v19 = (char *)_os_log_send_and_compose_impl(2, 0, 0, 0, &_mh_execute_header, &_os_log_default, 16);
    }
    v29 = sub_10000A6F8("-[UpgradeSequencer startUpgradeForCryptexes:killingJobs:withCompletion:]_block_invoke", "upgrade_sequencer.m", 435, "com.apple.security.cryptex.posix", v14, 0, v19);
    free(v19);
    v21 = (void *)v40[5];
    v40[5] = (uint64_t)v29;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logHandle"));

    if (v10)
    {
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logHandle"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        v12 = 3;
      else
        v12 = 2;
      LOWORD(v45) = 0;
      v13 = (char *)_os_log_send_and_compose_impl(v12, 0, 0, 0, &_mh_execute_header, v11, 16);

    }
    else
    {
      LOWORD(v45) = 0;
      v13 = (char *)_os_log_send_and_compose_impl(2, 0, 0, 0, &_mh_execute_header, &_os_log_default, 16);
    }
    v20 = sub_10000A6F8("-[UpgradeSequencer startUpgradeForCryptexes:killingJobs:withCompletion:]_block_invoke", "upgrade_sequencer.m", 393, "com.apple.security.cryptex", 11, 0, v13);
    free(v13);
    v21 = (void *)v40[5];
    v40[5] = (uint64_t)v20;
  }

  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v40[5]);
LABEL_25:

  _Block_object_dispose(&v39, 8);
}

void sub_100003ACC(_Unwind_Exception *a1)
{
  uint64_t v1;

  free(0);
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100003B28(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100003B38(uint64_t a1)
{

}

void sub_100003B40(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  char *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  CFErrorRef v18;
  CFErrorRef v19;
  uint64_t v20;
  void *v21;

  v7 = a2;
  v8 = a3;
  v9 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) == 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logHandle"));

    if (v15)
    {
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logHandle"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        v17 = 3;
      else
        v17 = 2;
      v14 = (char *)_os_log_send_and_compose_impl(v17, 0, 0, 0, &_mh_execute_header, v16, 16);

    }
    else
    {
      v14 = (char *)_os_log_send_and_compose_impl(2, 0, 0, 0, &_mh_execute_header, &_os_log_default, 16);
    }
    v18 = sub_10000A6F8("-[UpgradeSequencer startUpgradeForCryptexes:killingJobs:withCompletion:]_block_invoke", "upgrade_sequencer.m", 407, "com.apple.security.cryptex", 11, 0, v14);
    goto LABEL_17;
  }
  v10 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logHandle"));

    if (v11)
    {
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logHandle"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        v13 = 3;
      else
        v13 = 2;
      v14 = (char *)_os_log_send_and_compose_impl(v13, 0, 0, 0, &_mh_execute_header, v12, 16);

    }
    else
    {
      v14 = (char *)_os_log_send_and_compose_impl(2, 0, 0, 0, &_mh_execute_header, &_os_log_default, 16);
    }
    v18 = sub_10000A6F8("-[UpgradeSequencer startUpgradeForCryptexes:killingJobs:withCompletion:]_block_invoke", "upgrade_sequencer.m", 415, "com.apple.security.cryptex", 11, 0, v14);
LABEL_17:
    v19 = v18;
    free(v14);
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v19;

    *a4 = 1;
  }

}

void sub_100003DE4(_Unwind_Exception *a1)
{
  free(0);
  _Unwind_Resume(a1);
}

void sub_100003E0C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  uint64_t v15;

  v5 = a2;
  v6 = *(NSObject **)(a1 + 32);
  v7 = a3;
  dispatch_group_enter(v6);
  v8 = *(unsigned __int8 *)(a1 + 56);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100003EE0;
  v11[3] = &unk_1000551C0;
  v9 = *(void **)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  v13 = v5;
  v15 = *(_QWORD *)(a1 + 48);
  v14 = v9;
  v10 = v5;
  objc_msgSend(v12, "_startUpgradeForCryptex:withGraftPath:killingJobs:withCompletion:", v10, v7, v8, v11);

}

void sub_100003EE0(uint64_t a1, void *a2)
{
  id v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  id *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;

  v4 = a2;
  v5 = *__error();
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logHandle"));
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 40);
      v13 = 138543618;
      v14 = v8;
      v15 = 2112;
      v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "start upgrade of cryptex '%{public}@': %@", (uint8_t *)&v13, 0x16u);
    }

    *__error() = v5;
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v11 = *(_QWORD *)(v9 + 40);
    v10 = (id *)(v9 + 40);
    if (!v11)
      objc_storeStrong(v10, a2);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v12 = *(_QWORD *)(a1 + 40);
      v13 = 138543362;
      v14 = v12;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "start upgrade of cryptex '%{public}@' [no error]", (uint8_t *)&v13, 0xCu);
    }

    *__error() = v5;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t sub_10000403C(uint64_t a1)
{
  uint64_t v2;
  int v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  int v12;
  uint64_t v13;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v3 = *__error();
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logHandle"));
  v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v12 = 138412290;
      v13 = v6;
      v7 = "start upgrade session: %@";
      v8 = v5;
      v9 = OS_LOG_TYPE_ERROR;
      v10 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, (uint8_t *)&v12, v10);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v12) = 0;
    v7 = "start upgrade session [no error]";
    v8 = v5;
    v9 = OS_LOG_TYPE_DEBUG;
    v10 = 2;
    goto LABEL_6;
  }

  *__error() = v3;
  objc_msgSend(*(id *)(a1 + 32), "_restartInterfaceLockTimeout");
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
}

void sub_1000041FC(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_completeUpgradeWithError:", 0));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_10000431C(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  CFErrorRef v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  char *v9;
  NSObject *v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "upgradesUnderway"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)));

  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 48);
    v5 = (CFErrorRef)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "workQueue"));
    objc_msgSend(v3, "onComplete:withQueue:", v4, v5);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logHandle"));

    if (v6)
    {
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logHandle"));
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        v8 = 3;
      else
        v8 = 2;
      v9 = (char *)_os_log_send_and_compose_impl(v8, 0, 0, 0, &_mh_execute_header, v7, 16);

    }
    else
    {
      v9 = (char *)_os_log_send_and_compose_impl(2, 0, 0, 0, &_mh_execute_header, &_os_log_default, 16);
    }
    v5 = sub_10000A6F8("-[UpgradeSequencer onUpgradeCompleteForCryptex:withCompletion:]_block_invoke", "upgrade_sequencer.m", 497, "com.apple.security.cryptex", 8, 0, v9);
    free(v9);
    (*(void (**)(_QWORD, CFErrorRef))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v5);
  }

  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "workQueue"));
  dispatch_resume(v10);

}

void sub_1000044CC(_Unwind_Exception *a1)
{
  free(0);
  _Unwind_Resume(a1);
}

void sub_10000459C(uint64_t a1)
{
  NSObject *v2;

  objc_msgSend(*(id *)(a1 + 32), "setSessionCompleteCallback:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "workQueue"));
  dispatch_resume(v2);

}

void sub_10000469C(uint64_t a1)
{
  void *v1;
  void *v2;
  _xpc_connection_s *v3;
  void *v5;
  void *v6;
  _xpc_connection_s *v7;
  pid_t pid;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  pid_t v14;
  _xpc_connection_s *v15;
  NSObject *v16;
  UpgradeClient *v17;
  uint64_t v18;
  void *v19;
  UpgradeClient *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  CFErrorRef v24;
  id v25;
  void *v26;
  void *v27;
  pid_t v28;
  void *v29;
  _xpc_connection_s *v30;
  pid_t v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  pid_t v37;
  char *v38;
  CFErrorRef v39;
  id v40;
  void *v41;
  void *v42;
  pid_t v43;
  pid_t v44;
  int v45;
  NSObject *v46;
  NSObject *v47;
  _xpc_connection_s *v48;
  pid_t v49;
  _xpc_connection_s *v50;
  pid_t v51;
  const char *v52;
  NSObject *v53;
  os_log_type_t v54;
  uint32_t v55;
  _QWORD block[5];
  _QWORD v57[5];
  uint8_t buf[4];
  __int128 *p_buffer;
  __int16 v60;
  pid_t v61;
  __int16 v62;
  CFErrorRef v63;
  __int128 buffer;
  __int128 v65;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "lockingClient"));

  if (v5)
  {
    buffer = *(_OWORD *)"unknown";
    v65 = *(_OWORD *)&qword_100044728;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "lockingClient"));
    v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "conn"));
    pid = xpc_connection_get_pid(v7);
    proc_name(pid, &buffer, 0x20u);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logHandle"));
    if (v9)
    {
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logHandle"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        v11 = 3;
      else
        v11 = 2;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "lockingClient"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "conn"));
      if (v13)
      {
        v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "lockingClient"));
        v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "conn"));
        v14 = xpc_connection_get_pid(v3);
      }
      else
      {
        v14 = -1;
      }
      *(_DWORD *)buf = 136315650;
      p_buffer = &buffer;
      v60 = 1024;
      v61 = v14;
      v62 = 1024;
      LODWORD(v63) = 16;
      v38 = (char *)_os_log_send_and_compose_impl(v11, 0, 0, 0, &_mh_execute_header, v10, 16);
      if (v13)
      {

      }
    }
    else
    {
      v25 = &_os_log_default;
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "lockingClient"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "conn"));
      if (v27)
      {
        v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "lockingClient"));
        v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "conn"));
        v28 = xpc_connection_get_pid((xpc_connection_t)v2);
      }
      else
      {
        v28 = -1;
      }
      *(_DWORD *)buf = 136315650;
      p_buffer = &buffer;
      v60 = 1024;
      v61 = v28;
      v62 = 1024;
      LODWORD(v63) = 16;
      v38 = (char *)_os_log_send_and_compose_impl(2, 0, 0, 0, &_mh_execute_header, &_os_log_default, 16);
      if (v27)
      {

      }
      v10 = &_os_log_default;
    }

    v39 = sub_10000A6F8("-[UpgradeSequencer lockInterfaceForClient:withCompletion:]_block_invoke", "upgrade_sequencer.m", 524, "com.apple.security.cryptex.posix", 16, 0, v38);
  }
  else
  {
    if (sub_100029AF0(*(_QWORD *)(a1 + 40), (uint64_t)"com.apple.private.security.cryptex.upgrade"))
    {
      v15 = *(_xpc_connection_s **)(a1 + 40);
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "workQueue"));
      xpc_connection_set_target_queue(v15, v16);

      v17 = [UpgradeClient alloc];
      v18 = *(_QWORD *)(a1 + 40);
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logHandle"));
      v20 = -[UpgradeClient initWithConn:log:](v17, "initWithConn:log:", v18, v19);
      objc_msgSend(*(id *)(a1 + 32), "setLockingClient:", v20);

      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "lockingClient"));
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472;
      v57[2] = sub_100004EA4;
      v57[3] = &unk_1000550E0;
      v57[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v21, "onCancel:", v57);

      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "lockingClient"));
      objc_msgSend(v22, "activate");

      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "workQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100004EAC;
      block[3] = &unk_1000550E0;
      block[4] = *(_QWORD *)(a1 + 32);
      dispatch_async(v23, block);

      v24 = 0;
      goto LABEL_39;
    }
    buffer = *(_OWORD *)"unknown";
    v65 = *(_OWORD *)&qword_100044728;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "lockingClient"));
    v30 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "conn"));
    v31 = xpc_connection_get_pid(v30);
    proc_name(v31, &buffer, 0x20u);

    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logHandle"));
    if (v32)
    {
      v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logHandle"));
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        v34 = 3;
      else
        v34 = 2;
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "lockingClient"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "conn"));
      if (v36)
      {
        v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "lockingClient"));
        v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "conn"));
        v37 = xpc_connection_get_pid(v3);
      }
      else
      {
        v37 = -1;
      }
      *(_DWORD *)buf = 136315650;
      p_buffer = &buffer;
      v60 = 1024;
      v61 = v37;
      v62 = 1024;
      LODWORD(v63) = 144;
      v38 = (char *)_os_log_send_and_compose_impl(v34, 0, 0, 0, &_mh_execute_header, v33, 16);
      if (v36)
      {

      }
    }
    else
    {
      v40 = &_os_log_default;
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "lockingClient"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "conn"));
      if (v42)
      {
        v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "lockingClient"));
        v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "conn"));
        v43 = xpc_connection_get_pid((xpc_connection_t)v2);
      }
      else
      {
        v43 = -1;
      }
      *(_DWORD *)buf = 136315650;
      p_buffer = &buffer;
      v60 = 1024;
      v61 = v43;
      v62 = 1024;
      LODWORD(v63) = 144;
      v38 = (char *)_os_log_send_and_compose_impl(2, 0, 0, 0, &_mh_execute_header, &_os_log_default, 16);
      if (v42)
      {

      }
      v33 = &_os_log_default;
    }

    v39 = sub_10000A6F8("-[UpgradeSequencer lockInterfaceForClient:withCompletion:]_block_invoke", "upgrade_sequencer.m", 534, "com.apple.security.cryptex.posix", 144, 0, v38);
  }
  v24 = v39;
  free(v38);
LABEL_39:
  buffer = *(_OWORD *)"unknown";
  v65 = *(_OWORD *)&qword_100044728;
  v44 = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 40));
  proc_name(v44, &buffer, 0x20u);
  v45 = *__error();
  v46 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "logHandle"));
  v47 = v46;
  if (v24)
  {
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      v48 = *(_xpc_connection_s **)(a1 + 40);
      if (v48)
        v49 = xpc_connection_get_pid(v48);
      else
        v49 = -1;
      *(_DWORD *)buf = 136315650;
      p_buffer = &buffer;
      v60 = 1024;
      v61 = v49;
      v62 = 2112;
      v63 = v24;
      v52 = "XPC client <process=%s pid=%d>: lock upgrade interface: %@";
      v53 = v47;
      v54 = OS_LOG_TYPE_ERROR;
      v55 = 28;
LABEL_50:
      _os_log_impl((void *)&_mh_execute_header, v53, v54, v52, buf, v55);
    }
  }
  else if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
  {
    v50 = *(_xpc_connection_s **)(a1 + 40);
    if (v50)
      v51 = xpc_connection_get_pid(v50);
    else
      v51 = -1;
    *(_DWORD *)buf = 136315394;
    p_buffer = &buffer;
    v60 = 1024;
    v61 = v51;
    v52 = "XPC client <process=%s pid=%d>: lock upgrade interface [no error]";
    v53 = v47;
    v54 = OS_LOG_TYPE_DEBUG;
    v55 = 18;
    goto LABEL_50;
  }

  *__error() = v45;
  (*(void (**)(_QWORD, CFErrorRef))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v24);

}

void sub_100004E64(_Unwind_Exception *a1)
{
  free(0);
  _Unwind_Resume(a1);
}

id sub_100004EA4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleInterfaceLockCancel");
}

id sub_100004EAC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_restartInterfaceLockTimeout");
}

void sub_100004F60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100004F78(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "lockingClient"));

  if (v2)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "lockingClient"));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = sub_10003A0E8(objc_msgSend(v3, "cred"), *(_DWORD **)(a1 + 48));

  }
}

void sub_100005088(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_abort"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_100005440(_Unwind_Exception *a1)
{
  free(0);
  _Unwind_Resume(a1);
}

void sub_100005DB8(_Unwind_Exception *a1)
{
  free(0);
  _Unwind_Resume(a1);
}

void sub_100005EC4(_Unwind_Exception *a1)
{
  void *v1;

  free(v1);
  _Unwind_Resume(a1);
}

void sub_100006280(_Unwind_Exception *a1)
{
  free(0);
  _Unwind_Resume(a1);
}

void sub_1000063C4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a3;
  objc_msgSend(v4, "setError:", v3);
  objc_msgSend(v4, "completeUpgrade");

}

void sub_1000064DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  _QWORD v8[6];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UpgradeSequencer getSharedInstance](UpgradeSequencer, "getSharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a1));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100006584;
  v8[3] = &unk_1000552F8;
  v8[4] = a3;
  v8[5] = a2;
  objc_msgSend(v6, "onUpgradeCompleteForCryptex:withCompletion:", v7, v8);

}

uint64_t sub_100006584(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40));
}

void sub_10000658C()
{
  NSObject *v0;
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[UpgradeSequencer getSharedInstance](UpgradeSequencer, "getSharedInstance"));
  v0 = objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "lockAcquireQueue"));
  dispatch_resume(v0);

}

uint64_t sub_1000065D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  return _os_log_send_and_compose_impl(a1, a2, a3, 80, a5, v5, 16);
}

BOOL sub_1000065E8()
{
  NSObject *v0;

  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

uint64_t sub_1000065F4(unint64_t a1)
{
  if (a1 > 0xA || a1 - 1 > 9)
    return 0;
  else
    return (uint64_t)*(&off_100055318 + a1 - 1);
}

unint64_t sub_100006620(uint64_t a1, const char *a2, char a3)
{
  NSFileManager *v6;
  NSString *v7;
  NSString *v8;
  NSURL *v9;
  NSURL *v10;
  int v11;
  int v12;
  NSObject *v13;
  unint64_t v14;
  int v15;
  uint64_t v16;
  const char *v17;
  id v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int v30;
  NSFileAttributeKey v31;
  _UNKNOWN **v32;

  v6 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
  v7 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", a1, 4);
  v26 = 0;
  v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", a2, 4);
  v9 = -[NSURL URLByDeletingLastPathComponent](+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v8), "URLByDeletingLastPathComponent");
  if ((a3 & 2) != 0)
  {
    v10 = v9;
    v31 = NSFilePosixPermissions;
    v32 = &off_100057B68;
    if (!-[NSFileManager createDirectoryAtURL:withIntermediateDirectories:attributes:error:](v6, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v9, 1, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1), &v26))
    {
      v14 = (unint64_t)objc_msgSend(v26, "code");
      v15 = *__error();
      if (qword_10005A3E0 != -1)
        dispatch_once(&qword_10005A3E0, &stru_100055368);
      v21 = qword_10005A3E8;
      if (!os_log_type_enabled((os_log_t)qword_10005A3E8, OS_LOG_TYPE_ERROR))
        goto LABEL_34;
      v22 = -[NSString UTF8String](-[NSURL path](v10, "path"), "UTF8String");
      *(_DWORD *)buf = 136315394;
      v28 = v22;
      v29 = 1024;
      v30 = v14;
      v17 = "failed to create dir at %s: %{darwin.errno}d";
      v23 = v21;
      v24 = 18;
      goto LABEL_33;
    }
  }
  if ((a3 & 4) != 0)
  {
    if ((faccessat(-2, a2, 4, 32) & 0x80000000) == 0)
      *__error() = 0;
    v11 = *__error();
    if (v11 != 2)
    {
      if (v11)
      {
        v14 = *__error();
        v15 = *__error();
        if (qword_10005A3E0 != -1)
          dispatch_once(&qword_10005A3E0, &stru_100055368);
        v16 = qword_10005A3E8;
        if (!os_log_type_enabled((os_log_t)qword_10005A3E8, OS_LOG_TYPE_ERROR))
          goto LABEL_34;
        *(_DWORD *)buf = 67109120;
        LODWORD(v28) = v14;
        v17 = "failed to access symlink: %{darwin.errno}d";
LABEL_32:
        v23 = v16;
        v24 = 8;
LABEL_33:
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, v17, buf, v24);
LABEL_34:
        *__error() = v15;
        return v14;
      }
      v12 = *__error();
      if (qword_10005A3E0 != -1)
        dispatch_once(&qword_10005A3E0, &stru_100055368);
      v13 = qword_10005A3E8;
      if (os_log_type_enabled((os_log_t)qword_10005A3E8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "symlink exists, removing", buf, 2u);
      }
      *__error() = v12;
      if (unlink(a2))
      {
        v14 = *__error();
        v15 = *__error();
        if (qword_10005A3E0 != -1)
          dispatch_once(&qword_10005A3E0, &stru_100055368);
        v16 = qword_10005A3E8;
        if (!os_log_type_enabled((os_log_t)qword_10005A3E8, OS_LOG_TYPE_ERROR))
          goto LABEL_34;
        *(_DWORD *)buf = 67109120;
        LODWORD(v28) = v14;
        v17 = "failed to unlink symlink: %{darwin.errno}d";
        goto LABEL_32;
      }
    }
  }
  if (!-[NSFileManager createSymbolicLinkAtPath:withDestinationPath:error:](v6, "createSymbolicLinkAtPath:withDestinationPath:error:", v8, v7, &v26))
  {
    v18 = objc_msgSend(v26, "code");
    v15 = *__error();
    if (qword_10005A3E0 != -1)
      dispatch_once(&qword_10005A3E0, &stru_100055368);
    v19 = qword_10005A3E8;
    if (os_log_type_enabled((os_log_t)qword_10005A3E8, OS_LOG_TYPE_ERROR))
    {
      v20 = -[NSString UTF8String](v7, "UTF8String");
      *(_DWORD *)buf = 136315394;
      v28 = v20;
      v29 = 1024;
      v30 = (int)v18;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "failed to create symlink to %s: %{darwin.errno}d", buf, 0x12u);
    }
    v14 = (unint64_t)v18;
    goto LABEL_34;
  }
  return 0;
}

unint64_t sub_100006A54(uint64_t a1, uint64_t a2, const char *a3, char a4)
{
  uint64_t v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  uint8_t buf[4];
  int v14;
  char __str[1024];
  char v16[1024];

  bzero(v16, 0x400uLL);
  bzero(__str, 0x400uLL);
  v8 = realpath_np(a2, v16);
  if ((_DWORD)v8)
  {
    v9 = v8;
    v10 = *__error();
    if (qword_10005A3E0 != -1)
      dispatch_once(&qword_10005A3E0, &stru_100055368);
    v11 = qword_10005A3E8;
    if (os_log_type_enabled((os_log_t)qword_10005A3E8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "realpath_np: %{darwin.errno}d", buf, 8u);
    }
    *__error() = v10;
  }
  else
  {
    snprintf(__str, 0x400uLL, "%s/%s", v16, a3);
    return sub_100006620(a1, __str, a4);
  }
  return v9;
}

void sub_100006BA8(id a1)
{
  qword_10005A3E8 = (uint64_t)os_log_create("com.apple.libcryptex", "fs");
}

id sub_100006BD4(void *a1, _QWORD *a2)
{
  id v3;
  NSMutableArray *v4;
  id v5;
  void *v6;
  id v7;
  xpc_object_t value;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  char *v18;
  id v19;
  CFErrorRef v20;
  id v21;
  void *v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  char *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  NSObject *v32;
  uint64_t v33;
  char *v34;
  BOOL v35;
  id v36;
  void *v37;
  id v38;
  NSObject *v39;
  uint64_t v40;
  CFErrorRef v41;
  CFErrorRef v42;
  NSObject *v43;
  uint64_t *v44;
  id v45;
  id v47;
  _QWORD applier[4];
  NSMutableArray *v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint8_t buf[16];

  v3 = a1;
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = sub_100007248;
  v55 = sub_100007258;
  v56 = 0;
  v4 = objc_opt_new(NSMutableArray);
  v5 = v3;
  v6 = v5;
  if (v5 && xpc_get_type(v5) == (xpc_type_t)&_xpc_type_dictionary)
    v7 = v6;
  else
    v7 = 0;

  if (v7)
  {
    value = xpc_dictionary_get_value(v6, "Watchdog");
    v9 = (void *)objc_claimAutoreleasedReturnValue(value);
    v10 = v9;
    if (!v9
      || ((v11 = v9, xpc_get_type(v11) == (xpc_type_t)&_xpc_type_array)
        ? (v12 = v11)
        : (v12 = 0),
          v11,
          v12,
          v12))
    {
      v19 = objc_retainAutorelease(v10);

      v20 = 0;
      goto LABEL_27;
    }
    v21 = sub_100007260();
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

    if (v22)
    {
      v23 = sub_100007260();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        v25 = 3;
      else
        v25 = 2;
      *(_WORD *)buf = 0;
      v26 = (char *)_os_log_send_and_compose_impl(v25, 0, 0, 0, &_mh_execute_header, v24, 16);

    }
    else
    {
      *(_WORD *)buf = 0;
      v26 = (char *)_os_log_send_and_compose_impl(2, 0, 0, 0, &_mh_execute_header, &_os_log_default, 16);
    }
    v20 = sub_10000A6F8("_watchdog_copy_watchdog_array", "watchdog.m", 133, "com.apple.security.cryptex", 11, 0, v26);
    free(v26);

  }
  else
  {
    v13 = sub_100007260();
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

    if (v14)
    {
      v15 = sub_100007260();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        v17 = 3;
      else
        v17 = 2;
      *(_WORD *)buf = 0;
      v18 = (char *)_os_log_send_and_compose_impl(v17, 0, 0, 0, &_mh_execute_header, v16, 16);

    }
    else
    {
      *(_WORD *)buf = 0;
      v18 = (char *)_os_log_send_and_compose_impl(2, 0, 0, 0, &_mh_execute_header, &_os_log_default, 16);
    }
    v20 = sub_10000A6F8("_watchdog_copy_watchdog_array", "watchdog.m", 128, "com.apple.security.cryptex", 11, 0, v18);
    free(v18);
  }
  v19 = 0;
LABEL_27:

  v27 = v19;
  v28 = (void *)v52[5];
  v52[5] = (uint64_t)v20;

  if (v52[5])
  {
    v29 = sub_100007260();
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);

    if (v30)
    {
      v31 = sub_100007260();
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        v33 = 3;
      else
        v33 = 2;
      *(_WORD *)buf = 0;
      v34 = (char *)_os_log_send_and_compose_impl(v33, 0, 0, 0, &_mh_execute_header, v32, 16);

    }
    else
    {
      *(_WORD *)buf = 0;
      v34 = (char *)_os_log_send_and_compose_impl(2, 0, 0, 0, &_mh_execute_header, &_os_log_default, 16);
    }
    v41 = sub_10000A6F8("watchdog_create_service_descriptions", "watchdog.m", 151, "com.apple.security.cryptex", 11, (const void *)v52[5], v34);
LABEL_42:
    v42 = v41;
    free(v34);
    v43 = v52[5];
    v52[5] = (uint64_t)v42;
LABEL_43:

    goto LABEL_44;
  }
  if (!v27)
  {
    v52[5] = 0;
    v47 = sub_100007260();
    v43 = objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "No jobs to register with watchdog.", buf, 2u);
    }
    goto LABEL_43;
  }
  applier[0] = _NSConcreteStackBlock;
  applier[1] = 3221225472;
  applier[2] = sub_1000072A0;
  applier[3] = &unk_100055390;
  v50 = &v51;
  v49 = v4;
  v35 = xpc_array_apply(v27, applier);

  if (!v35)
  {
    v36 = sub_100007260();
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);

    if (v37)
    {
      v38 = sub_100007260();
      v39 = objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        v40 = 3;
      else
        v40 = 2;
      *(_WORD *)buf = 0;
      v34 = (char *)_os_log_send_and_compose_impl(v40, 0, 0, 0, &_mh_execute_header, v39, 16);

    }
    else
    {
      *(_WORD *)buf = 0;
      v34 = (char *)_os_log_send_and_compose_impl(2, 0, 0, 0, &_mh_execute_header, &_os_log_default, 16);
    }
    v41 = sub_10000A6F8("watchdog_create_service_descriptions", "watchdog.m", 178, "com.apple.security.cryptex", 11, (const void *)v52[5], v34);
    goto LABEL_42;
  }
LABEL_44:
  v44 = v52;
  if (a2 && !v52[5])
  {
    *a2 = -[NSMutableArray copy](v4, "copy");
    v44 = v52;
  }
  v45 = (id)v44[5];

  _Block_object_dispose(&v51, 8);
  return v45;
}

void sub_100007214(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  void *v17;

  free(v17);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100007248(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100007258(uint64_t a1)
{

}

id sub_100007260()
{
  if (qword_10005A3F8 != -1)
    dispatch_once(&qword_10005A3F8, &stru_1000553B0);
  return (id)qword_10005A3F0;
}

uint64_t sub_1000072A0(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  int v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  char *v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  int v20;
  id v21;
  void *v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  CFErrorRef v26;
  int v27;
  id v28;
  void *v29;
  id v30;
  NSObject *v31;
  uint64_t v32;
  int v33;
  id v34;
  void *v35;
  id v36;
  NSObject *v37;
  uint64_t v38;
  int v39;
  id v40;
  NSObject *v41;
  int v42;
  id v43;
  NSObject *v44;
  int v45;
  id v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  CFErrorRef v55;
  id v56;
  void *v57;
  BOOL v58;
  uint64_t v59;
  id v60;
  void *v61;
  id v62;
  NSObject *v63;
  uint64_t v64;
  char *v65;
  CFErrorRef v66;
  uint64_t v67;
  void *v68;
  void *v70;
  void *v71;
  BOOL v72;
  __int16 v73;
  const char *v74;
  const char *v75;
  const char *v76;
  const char *v77;
  _QWORD v78[7];
  _BYTE buf[24];
  void *v80;
  void *v81;
  void *v82;
  void *v83;

  v76 = 0;
  v77 = 0;
  v74 = 0;
  v75 = 0;
  v73 = 0;
  v72 = 0;
  v5 = a3;
  v6 = v5;
  if (v5 && xpc_get_type(v5) == (xpc_type_t)&_xpc_type_dictionary)
    v7 = v6;
  else
    v7 = 0;

  if (!v7)
  {
    v15 = sub_100007260();
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

    if (v16)
    {
      v17 = sub_100007260();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        v19 = 3;
      else
        v19 = 2;
      *(_WORD *)buf = 0;
      v14 = (char *)_os_log_send_and_compose_impl(v19, 0, 0, 0, &_mh_execute_header, v18, 16);

    }
    else
    {
      *(_WORD *)buf = 0;
      v14 = (char *)_os_log_send_and_compose_impl(2, 0, 0, 0, &_mh_execute_header, &_os_log_default, 16);
    }
    v26 = sub_10000A6F8("_watchdog_create_service_description", "watchdog.m", 37, "com.apple.security.cryptex", 11, 0, v14);
    goto LABEL_58;
  }
  v8 = sub_10003CEB8(v6, "Label", &v77);
  if (v8)
  {
    v9 = sub_100007260();
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

    if (v10)
    {
      v11 = sub_100007260();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        v13 = 3;
      else
        v13 = 2;
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "Label";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v8;
      v14 = (char *)_os_log_send_and_compose_impl(v13, 0, 0, 0, &_mh_execute_header, v12, 16);

    }
    else
    {
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "Label";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v8;
      v14 = (char *)_os_log_send_and_compose_impl(2, 0, 0, 0, &_mh_execute_header, &_os_log_default, 16);
    }
    v26 = sub_10000A6F8("_watchdog_create_service_description", "watchdog.m", 43, "com.apple.security.cryptex.posix", v8, 0, v14);
LABEL_58:
    v55 = v26;
    free(v14);
    v54 = 0;
    goto LABEL_59;
  }
  v20 = sub_10003CEB8(v6, "ProcessName", &v76);
  if (v20)
  {
    v21 = sub_100007260();
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

    if (v22)
    {
      v23 = sub_100007260();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        v25 = 3;
      else
        v25 = 2;
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "ProcessName";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v20;
      v14 = (char *)_os_log_send_and_compose_impl(v25, 0, 0, 0, &_mh_execute_header, v24, 16);

    }
    else
    {
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "ProcessName";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v20;
      v14 = (char *)_os_log_send_and_compose_impl(2, 0, 0, 0, &_mh_execute_header, &_os_log_default, 16);
    }
    v26 = sub_10000A6F8("_watchdog_create_service_description", "watchdog.m", 49, "com.apple.security.cryptex.posix", v20, 0, v14);
    goto LABEL_58;
  }
  v27 = sub_10003CEB8(v6, "CFBundleIdentifier", &v75);
  if (v27)
  {
    v28 = sub_100007260();
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

    if (v29)
    {
      v30 = sub_100007260();
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        v32 = 3;
      else
        v32 = 2;
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "CFBundleIdentifier";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v27;
      v14 = (char *)_os_log_send_and_compose_impl(v32, 0, 0, 0, &_mh_execute_header, v31, 16);

    }
    else
    {
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "CFBundleIdentifier";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v27;
      v14 = (char *)_os_log_send_and_compose_impl(2, 0, 0, 0, &_mh_execute_header, &_os_log_default, 16);
    }
    v26 = sub_10000A6F8("_watchdog_create_service_description", "watchdog.m", 55, "com.apple.security.cryptex.posix", v27, 0, v14);
    goto LABEL_58;
  }
  v33 = sub_10003CEB8(v6, "WatchdogMachService", &v74);
  if (v33)
  {
    v34 = sub_100007260();
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);

    if (v35)
    {
      v36 = sub_100007260();
      v37 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        v38 = 3;
      else
        v38 = 2;
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "WatchdogMachService";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v33;
      v14 = (char *)_os_log_send_and_compose_impl(v38, 0, 0, 0, &_mh_execute_header, v37, 16);

    }
    else
    {
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "WatchdogMachService";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v33;
      v14 = (char *)_os_log_send_and_compose_impl(2, 0, 0, 0, &_mh_execute_header, &_os_log_default, 16);
    }
    v26 = sub_10000A6F8("_watchdog_create_service_description", "watchdog.m", 61, "com.apple.security.cryptex.posix", v33, 0, v14);
    goto LABEL_58;
  }
  if (sub_10003CF18(v6, "LateFirstCheckin", (BOOL *)&v73 + 1))
  {
    HIBYTE(v73) = 0;
    v39 = *__error();
    v40 = sub_100007260();
    v41 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "LateFirstCheckin";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = HIBYTE(v73);
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "%{public}s defaulted to %d", buf, 0x12u);
    }

    *__error() = v39;
  }
  if (sub_10003CF18(v6, "PanicOnFirstTimeout", &v72))
  {
    v72 = 0;
    v42 = *__error();
    v43 = sub_100007260();
    v44 = objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "PanicOnFirstTimeout";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v72;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "%{public}s defaulted to %d", buf, 0x12u);
    }

    *__error() = v42;
  }
  if (sub_10003CF18(v6, "CaptureDdtOnTimeout", (BOOL *)&v73))
  {
    LOBYTE(v73) = 0;
    v45 = *__error();
    v46 = sub_100007260();
    v47 = objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "CaptureDdtOnTimeout";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v73;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "%{public}s defaulted to %d", buf, 0x12u);
    }

    *__error() = v45;
  }
  v78[0] = wd_optin_service_launchd_job_label;
  v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v77));
  *(_QWORD *)buf = v71;
  v78[1] = wd_optin_service_process_name;
  v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v76));
  *(_QWORD *)&buf[8] = v70;
  v78[2] = wd_optin_service_bundle_id;
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v75));
  *(_QWORD *)&buf[16] = v48;
  v78[3] = wd_optin_service_bootstrap_service_name;
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v74));
  v80 = v49;
  v78[4] = wd_optin_service_late_first_checkin;
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", HIBYTE(v73)));
  v81 = v50;
  v78[5] = wd_optin_service_panic_on_first_timeout;
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v72));
  v82 = v51;
  v78[6] = wd_optin_service_capture_ddt_on_timeout;
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v73));
  v83 = v52;
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, v78, 7));
  v54 = objc_msgSend(v53, "copy");

  v55 = 0;
LABEL_59:

  v56 = v54;
  v57 = v56;
  if (v55)
    v58 = 1;
  else
    v58 = v56 == 0;
  v59 = !v58;
  if (v58)
  {
    v60 = sub_100007260();
    v61 = (void *)objc_claimAutoreleasedReturnValue(v60);

    if (v61)
    {
      v62 = sub_100007260();
      v63 = objc_claimAutoreleasedReturnValue(v62);
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        v64 = 3;
      else
        v64 = 2;
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = a2;
      v65 = (char *)_os_log_send_and_compose_impl(v64, 0, 0, 0, &_mh_execute_header, v63, 16);

    }
    else
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = a2;
      v65 = (char *)_os_log_send_and_compose_impl(2, 0, 0, 0, &_mh_execute_header, &_os_log_default, 16);
    }
    v66 = sub_10000A6F8("watchdog_create_service_descriptions_block_invoke", "watchdog.m", 167, "com.apple.security.cryptex", 11, v55, v65);
    free(v65);
    v67 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v68 = *(void **)(v67 + 40);
    *(_QWORD *)(v67 + 40) = v66;

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v56);
  }

  return v59;
}

void sub_100007E34(_Unwind_Exception *a1)
{
  void *v1;

  free(v1);
  _Unwind_Resume(a1);
}

id sub_100007E6C(void *a1)
{
  NSMutableArray *v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v2 = objc_opt_new(NSMutableArray);
  if (a1)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v3 = a1;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v13;
      v7 = wd_optin_service_launchd_job_label;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(v3);
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8), "objectForKeyedSubscript:", v7, (_QWORD)v12));
          -[NSMutableArray addObject:](v2, "addObject:", v9);

          v8 = (char *)v8 + 1;
        }
        while (v5 != v8);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v5);
    }

  }
  v10 = -[NSMutableArray copy](v2, "copy", (_QWORD)v12);

  return v10;
}

CFErrorRef sub_100007FAC(void *a1)
{
  id v1;
  char *v2;
  char *v3;
  id v4;
  NSObject *v5;
  CFIndex v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  char *v12;
  id v13;
  NSObject *v14;
  _BOOL4 v15;
  uint64_t v16;
  CFErrorRef v17;
  CFErrorRef v18;
  CFErrorRef v19;
  id v20;
  void *v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  char *v25;
  uint8_t *v27;
  uint64_t v28;
  uint8_t buf[4];
  char *v30;
  __int16 v31;
  int v32;

  v1 = a1;
  if (!objc_msgSend(v1, "count"))
  {
LABEL_24:
    v19 = 0;
    goto LABEL_32;
  }
  v2 = 0;
  while (1)
  {
    v3 = (char *)(id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectAtIndexedSubscript:", v2, v27, v28));
    if ((wd_optin_service_register_sync() & 1) == 0)
      break;
    v4 = sub_100007260();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v30 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Registered job with watchdog: %{public}@", buf, 0xCu);
    }

LABEL_23:
    if (++v2 >= objc_msgSend(v1, "count"))
      goto LABEL_24;
  }
  v6 = *__error();
  v7 = sub_100007260();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v6 == 45)
  {
    if (v8)
    {
      v9 = sub_100007260();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        v11 = 3;
      else
        v11 = 2;
      *(_WORD *)buf = 0;
      LODWORD(v28) = 2;
      v27 = buf;
      v12 = (char *)_os_log_send_and_compose_impl(v11, 0, 0, 0, &_mh_execute_header, v10, 16);

    }
    else
    {
      *(_WORD *)buf = 0;
      LODWORD(v28) = 2;
      v27 = buf;
      v12 = (char *)_os_log_send_and_compose_impl(2, 0, 0, 0, &_mh_execute_header, &_os_log_default, 16);
    }
    v17 = sub_10000A6F8("_watchdog_bootstrap_service", "watchdog.m", 109, "com.apple.security.cryptex", 10, 0, v12);
  }
  else
  {
    if (v8)
    {
      v13 = sub_100007260();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 138543618;
      if (v15)
        v16 = 3;
      else
        v16 = 2;
      v30 = v3;
      v31 = 1024;
      v32 = v6;
      LODWORD(v28) = 18;
      v27 = buf;
      v12 = (char *)_os_log_send_and_compose_impl(v16, 0, 0, 0, &_mh_execute_header, v14, 16);

    }
    else
    {
      *(_DWORD *)buf = 138543618;
      v30 = v3;
      v31 = 1024;
      v32 = v6;
      LODWORD(v28) = 18;
      v27 = buf;
      v12 = (char *)_os_log_send_and_compose_impl(2, 0, 0, 0, &_mh_execute_header, &_os_log_default, 16);
    }
    v17 = sub_10000A6F8("_watchdog_bootstrap_service", "watchdog.m", 112, "com.apple.security.cryptex.posix", v6, 0, v12);
  }
  v18 = v17;
  free(v12);

  if (!v18)
    goto LABEL_23;
  v20 = sub_100007260();
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

  if (v21)
  {
    v22 = sub_100007260();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      v24 = 3;
    else
      v24 = 2;
    *(_DWORD *)buf = 134217984;
    v30 = v2;
    v25 = (char *)_os_log_send_and_compose_impl(v24, 0, 0, 0, &_mh_execute_header, v23, 16);

  }
  else
  {
    *(_DWORD *)buf = 134217984;
    v30 = v2;
    v25 = (char *)_os_log_send_and_compose_impl(2, 0, 0, 0, &_mh_execute_header, &_os_log_default, 16);
  }
  v19 = sub_10000A6F8("watchdog_bootstrap_service_descriptions", "watchdog.m", 216, "com.apple.security.cryptex", 33, v18, v25);
  free(v25);

LABEL_32:
  return v19;
}

void sub_100008408(_Unwind_Exception *a1)
{
  void *v1;

  free(v1);
  _Unwind_Resume(a1);
}

void sub_10000842C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.libcryptex", "watchdog");
  v2 = (void *)qword_10005A3F0;
  qword_10005A3F0 = (uint64_t)v1;

}

void sub_10000845C(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v4 = a1;
  dispatch_release(*(dispatch_object_t *)(a1 + 80));
  free(*(void **)(a1 + 96));
  free(*(void **)(a1 + 104));
  free(*(void **)(a1 + 112));
  close_drop_np(a1 + 88, &v4);
  close_drop_np(a1 + 92, &v4);
  v2 = *(void **)(a1 + 272);
  if (v2)
    os_release(v2);
  v3 = *(void **)(a1 + 280);
  if (v3)
    os_release(v3);
  os_release(*(void **)(a1 + 304));
  sub_10003AA48(a1 + 16);
}

int *sub_1000084E4()
{
  _QWORD *v0;
  int v1;
  char **v2;
  char *v3;
  int i;
  const char *v5;
  int v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  int v11;
  NSObject *v12;
  char *v13;
  const char *v14;
  NSObject *v15;
  const char *v16;
  char *v17;
  const char *v18;
  NSObject *v19;
  const char *v20;
  int v21;
  int v22;
  int v23;
  int v24;
  char *v25;
  char *v26;
  uint64_t v27;
  const char *v28;
  int v29;
  NSObject *v30;
  const char *v31;
  unint64_t v32;
  char *v33;
  const char *v34;
  const char *v35;
  int v36;
  NSObject *v37;
  const char *v38;
  char *v39;
  char *v40;
  int v41;
  const char *v42;
  int v43;
  NSObject *v44;
  _BOOL4 v45;
  const char *v46;
  const char *v47;
  char *v48;
  char *v49;
  char *v50;
  const char *v51;
  int v52;
  NSObject *v53;
  const char *v54;
  const char *v55;
  const char *v56;
  int v57;
  NSObject *v58;
  const char *v59;
  const char *v60;
  int *result;
  int v62[2];
  uint32_t bufsize[2];
  uint64_t v64;
  char buf[4];
  const char *v66;
  __int16 v67;
  const char *v68;
  uint8_t v69[88];

  v0 = sub_100008DC0();
  bzero(buf, 0x400uLL);
  bufsize[0] = 1024;
  v1 = *_NSGetArgc();
  v2 = *_NSGetArgv();
  v62[0] = 0;
  if (_NSGetExecutablePath(buf, bufsize))
    sub_10003DFB0(&v64, v69);
  v0[6] = getprogname();
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      v3 = strdup(buf);
      if (v3)
        break;
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    v3 = strdup(buf);
    if (!v3)
      sub_10003DC18(buf);
  }
  v0[12] = v3;
  v0[36] = *_NSGetEnviron();
  for (i = getopt_long(v1, v2, "r", (const option *)&off_1000553D0, v62);
        i != -1;
        i = getopt_long(v1, v2, "r", (const option *)&off_1000553D0, v62))
  {
    if (optind <= 0)
      sub_10003DF20(&v64, v69);
    switch(i)
    {
      case ':':
        v9 = v62[0];
        v10 = (const char *)v0[2];
        v11 = *__error();
        v12 = v0[4];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v13 = (&off_1000553D0)[4 * v9];
          *(_DWORD *)v69 = 136446466;
          v14 = "[anonymous]";
          if (v10)
            v14 = v10;
          *(_QWORD *)&v69[4] = v14;
          *(_WORD *)&v69[12] = 2080;
          *(_QWORD *)&v69[14] = v13;
          v15 = v12;
          v16 = "%{public}s: missing argument for option: %s";
          goto LABEL_24;
        }
        break;
      case '?':
        v17 = v2[optind - 1];
        v18 = (const char *)v0[2];
        v11 = *__error();
        v19 = v0[4];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v69 = 136446466;
          v20 = "[anonymous]";
          if (v18)
            v20 = v18;
          *(_QWORD *)&v69[4] = v20;
          *(_WORD *)&v69[12] = 2080;
          *(_QWORD *)&v69[14] = v17;
          v15 = v19;
          v16 = "%{public}s: unknown option: %s";
LABEL_24:
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v16, v69, 0x16u);
        }
        break;
      case 'r':
        v5 = (const char *)v0[2];
        v6 = *__error();
        v7 = v0[4];
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          v8 = "[anonymous]";
          if (v5)
            v8 = v5;
          *(_DWORD *)v69 = 136446210;
          *(_QWORD *)&v69[4] = v8;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%{public}s: other side of exec", v69, 0xCu);
        }
        *__error() = v6;
        v0[5] |= 2uLL;
        continue;
      default:
        sub_10003DF98();
    }
    *__error() = v11;
  }
  bzero(buf, 0x400uLL);
  v21 = open("/var/db/", 1048832);
  if (v21 < 0)
    sub_10003DE98(&v64, v69);
  v22 = v21;
  v23 = open("/var/run/", 1048832);
  if (v23 < 0)
    sub_10003DE10(&v64, v69);
  v24 = v23;
  *((_DWORD *)v0 + 22) = sub_100009150((uint64_t)v0, v22, (uint64_t)buf);
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      v25 = strdup(buf);
      if (v25)
        break;
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    v25 = strdup(buf);
    if (!v25)
      sub_10003DC18(buf);
  }
  v0[13] = v25;
  *((_DWORD *)v0 + 23) = sub_100009150((uint64_t)v0, v24, (uint64_t)buf);
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      v26 = strdup(buf);
      if (v26)
        break;
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    v26 = strdup(buf);
    if (!v26)
      sub_10003DC18(buf);
  }
  v0[14] = v26;
  if (v24 != -1 && close(v24) == -1)
    sub_10003DD94(v69, buf);
  if (v22 != -1 && close(v22) == -1)
    sub_10003DD94(v69, buf);
  v27 = img4_chip_select_personalized_ap();
  if (img4_chip_instantiate(v27, v0 + 16))
    sub_10003DD1C(v69, buf);
  *(_QWORD *)v62 = 0;
  *(_QWORD *)bufsize = 0;
  if (sub_1000261B0(bufsize, v62, v0[4]))
    sub_10003DCA4(v69, buf);
  v28 = (const char *)v0[2];
  v29 = *__error();
  v30 = v0[4];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    v31 = "[anonymous]";
    if (v28)
      v31 = v28;
    *(_DWORD *)buf = 136446466;
    v66 = v31;
    v67 = 2048;
    v68 = *(const char **)v62;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "%{public}s: copied %lu mounts", (uint8_t *)buf, 0x16u);
  }
  *__error() = v29;
  if (*(_QWORD *)v62)
  {
    v32 = 0;
    do
    {
      v33 = *(char **)bufsize;
      v34 = (const char *)(*(_QWORD *)bufsize + 3582 * v32);
      memset(v69, 0, 32);
      v35 = (const char *)v0[2];
      v36 = *__error();
      v37 = v0[4];
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        v38 = "[anonymous]";
        if (v35)
          v38 = v35;
        v66 = v38;
        v67 = 2080;
        v68 = v34;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "%{public}s: potential forerunner: %s", (uint8_t *)buf, 0x16u);
      }
      *__error() = v36;
      if (_dispatch_is_multithreaded())
      {
        v39 = strdup(v34);
        if (!v39)
        {
          do
          {
            __os_temporary_resource_shortage();
            v40 = strdup(v34);
          }
          while (!v40);
          v39 = v40;
        }
      }
      else
      {
        v39 = strdup(v34);
        if (!v39)
          sub_10003DC18(v34);
      }
      v41 = cryptex_core_parse_hdiid(v39, v69);
      v42 = (const char *)v0[2];
      v43 = *__error();
      v44 = v0[4];
      v45 = os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG);
      if (v41)
      {
        if (v45)
        {
          *(_DWORD *)buf = 136446466;
          v46 = "[anonymous]";
          if (v42)
            v46 = v42;
          v66 = v46;
          v67 = 2080;
          v68 = v34;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "%{public}s: not a forerunner: %s", (uint8_t *)buf, 0x16u);
        }
        *__error() = v43;
      }
      else
      {
        if (v45)
        {
          *(_DWORD *)buf = 136446466;
          v47 = "[anonymous]";
          if (v42)
            v47 = v42;
          v66 = v47;
          v67 = 2080;
          v68 = v34;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "%{public}s: found forerunner: %s", (uint8_t *)buf, 0x16u);
        }
        *__error() = v43;
        v48 = (char *)malloc_type_calloc(1uLL, 0xD98uLL, 0x61D5536CuLL);
        if (!v48)
          sub_10003DB54(&v64, buf);
        v49 = v48;
        __strlcpy_chk(v48 + 8, *(_QWORD *)&v69[8], 255, 255);
        v50 = &v33[3582 * v32];
        __strlcpy_chk(v49 + 263, v50 + 510, 1024, 1024);
        __strlcpy_chk(v49 + 1287, v50 + 1534, 1024, 1024);
        __strlcpy_chk(v49 + 2311, v50 + 2558, 1024, 1024);
        __strlcpy_chk(v49 + 3383, *(_QWORD *)&v69[24], 97, 97);
        sub_10003AA84(v49 + 3335, v49 + 3383);
        *(_QWORD *)v49 = v0[37];
        v0[37] = v49;
      }
      free(v39);
      ++v32;
    }
    while (v32 < *(_QWORD *)v62);
  }
  free(*(void **)bufsize);
  v51 = (const char *)v0[2];
  v52 = *__error();
  v53 = v0[4];
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
  {
    v54 = "[anonymous]";
    if (v51)
      v54 = v51;
    v55 = (const char *)v0[13];
    *(_DWORD *)buf = 136446466;
    v66 = v54;
    v67 = 2080;
    v68 = v55;
    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEBUG, "%{public}s: state dir = %s", (uint8_t *)buf, 0x16u);
  }
  *__error() = v52;
  v56 = (const char *)v0[2];
  v57 = *__error();
  v58 = v0[4];
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
  {
    v59 = "[anonymous]";
    if (v56)
      v59 = v56;
    v60 = (const char *)v0[14];
    *(_DWORD *)buf = 136446466;
    v66 = v59;
    v67 = 2080;
    v68 = v60;
    _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEBUG, "%{public}s: run state dir = %s", (uint8_t *)buf, 0x16u);
  }
  result = __error();
  *result = v57;
  qword_10005A400 = (uint64_t)v0;
  return result;
}

_QWORD *sub_100008DC0()
{
  _QWORD *v0;

  if (_dispatch_is_multithreaded())
    sub_10003E02C();
  v0 = (_QWORD *)sub_100011210(344);
  v0[7] = off_10005A3B0;
  v0[8] = "com.apple.security.cryptexd";
  v0[9] = "com.apple.security.cryptexd";
  v0[10] = os_retain(*(void **)(off_10005A3A0 + 8));
  v0[38] = os_log_create("com.apple.libcryptex", "authinstall");
  v0[11] = -1;
  v0[41] = os_transaction_create("Bootstrap cryptexd");
  sub_10003A760((uint64_t)(v0 + 2), (int)"com.apple.security.cryptexd", "daemon");
  return v0;
}

void *sub_100008E6C()
{
  return os_retain((void *)qword_10005A400);
}

void sub_100008E78()
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(qword_10005A400 + 80));
}

uint64_t sub_100008E88()
{
  return *(_QWORD *)(off_10005A3A0 + 8);
}

uint64_t sub_100008E9C(uint64_t a1)
{
  return *(_QWORD *)(a1 + 312);
}

uint64_t sub_100008EA4(uint64_t a1)
{
  id v2;
  const char *v3;
  int v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uintptr_t v8;
  NSObject *v9;
  NSObject *v10;
  _xpc_connection_s *mach_service;
  uint64_t v13;
  mach_port_t sp;
  __int128 buf;
  void *v16;
  void *v17;
  uint64_t v18;

  if ((*(_BYTE *)off_10005A3A0 & 1) == 0)
    sub_10003E044();
  AMAuthInstallLogSetHandler(sub_100009234);
  v2 = sub_100014C18();
  objc_msgSend(v2, "activate");
  v3 = *(const char **)(a1 + 16);
  v4 = *__error();
  v5 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = "[anonymous]";
    if (v3)
      v6 = v3;
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}s: Activated event server", (uint8_t *)&buf, 0xCu);
  }
  *__error() = v4;
  if (v2)
    os_release(v2);
  if (signal(15, (void (__cdecl *)(int))1) == (void (__cdecl *)(int))-1)
    sub_10003E05C(&v13, &buf);
  v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, *(dispatch_queue_t *)(a1 + 80));
  dispatch_set_context(v7, (void *)a1);
  dispatch_source_set_event_handler_f(v7, (dispatch_function_t)sub_1000092EC);
  *(_QWORD *)(a1 + 280) = v7;
  dispatch_activate(v7);
  sp = 0;
  if (bootstrap_check_in(bootstrap_port, *(const char **)(a1 + 72), &sp))
    sub_10003E0D8(&v13, &buf);
  v8 = sp;
  *(_DWORD *)(a1 + 120) = sp;
  v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_mach_recv, v8, 0, *(dispatch_queue_t *)(a1 + 80));
  dispatch_set_context(v9, (void *)a1);
  dispatch_source_set_event_handler_f(v9, (dispatch_function_t)sub_1000093F8);
  dispatch_source_set_cancel_handler_f(v9, (dispatch_function_t)sub_1000094D4);
  *(_QWORD *)(a1 + 272) = v9;
  dispatch_activate(v9);
  v10 = dispatch_queue_create("DaemonHandler", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
  *(_QWORD *)(a1 + 312) = v10;
  mach_service = xpc_connection_create_mach_service("com.apple.security.cryptex.xpc", v10, 1uLL);
  *(_QWORD *)(a1 + 320) = mach_service;
  *(_QWORD *)&buf = _NSConcreteStackBlock;
  *((_QWORD *)&buf + 1) = 0x40000000;
  v16 = sub_1000094F4;
  v17 = &unk_100055410;
  v18 = a1;
  xpc_connection_set_event_handler(mach_service, &buf);
  xpc_connection_activate(*(xpc_connection_t *)(a1 + 320));
  *(_QWORD *)(a1 + 336) = xpc_remote_connection_create_remote_service_listener("com.apple.security.cryptexd.remote", *(_QWORD *)(a1 + 312), 0);
  *(_QWORD *)&buf = _NSConcreteStackBlock;
  *((_QWORD *)&buf + 1) = 0x40000000;
  v16 = sub_100009730;
  v17 = &unk_100055450;
  v18 = a1;
  xpc_remote_connection_set_event_handler();
  return xpc_remote_connection_activate(*(_QWORD *)(a1 + 336));
}

uint64_t sub_100009150(uint64_t a1, int a2, uint64_t a3)
{
  int v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  _OWORD v12[5];

  if ((mkdirat(a2, *(const char **)(a1 + 64), 0x1C5u) & 0x80000000) == 0)
    *__error() = 0;
  v6 = *__error();
  if (v6)
    v7 = v6 == 17;
  else
    v7 = 1;
  if (!v7)
    sub_10003E150(&v11, v12);
  v8 = openat(a2, *(const char **)(a1 + 64), 1048832);
  if ((v8 & 0x80000000) != 0)
    sub_10003E244(&v11, v12);
  v9 = v8;
  if (realpath_np(v8, a3))
    sub_10003E1CC(&v11, v12);
  return v9;
}

void sub_100009234(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  NSObject *v4;
  int v5;
  uint64_t v6;

  v3 = os_retain((void *)qword_10005A400);
  v4 = v3[38];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }
  os_release(v3);
}

void sub_1000092EC(uint64_t a1)
{
  void *v2;
  const char *v3;
  int v4;
  NSObject *v5;
  const char *v6;
  int v7;
  const char *v8;

  v2 = sub_100014FE0();
  v3 = *(const char **)(a1 + 16);
  v4 = *__error();
  v5 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = "[anonymous]";
    if (v3)
      v6 = v3;
    v7 = 136446210;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%{public}s: received SIGTERM", (uint8_t *)&v7, 0xCu);
  }
  *__error() = v4;
  sub_100017E54(v2, 0, (uint64_t)&j__xpc_transaction_exit_clean);
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 280));
  dispatch_release(*(dispatch_object_t *)(a1 + 280));
  *(_QWORD *)(a1 + 280) = 0;
  if (v2)
    os_release(v2);
}

void sub_1000093F8(uint64_t a1)
{
  const char *v2;
  int v3;
  NSObject *v4;
  const char *v5;
  int v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;

  v2 = *(const char **)(a1 + 16);
  v3 = *__error();
  v4 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = "[anonymous]";
    v6 = *(_DWORD *)(a1 + 120);
    if (v2)
      v5 = v2;
    v7 = 136446466;
    v8 = v5;
    v9 = 1024;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%{public}s: ipc recv: port = %#x", (uint8_t *)&v7, 0x12u);
  }
  *__error() = v3;
  sub_100029C08(*(unsigned int *)(a1 + 120));
}

uint64_t sub_1000094D4(NSObject *a1)
{
  unsigned int handle;

  handle = dispatch_source_get_handle(a1);
  return mach_right_recv_destruct(handle, 0, 0);
}

void sub_1000094F4(uint64_t a1, _xpc_connection_s *object)
{
  char *v4;
  const char *v5;
  int v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  _BYTE v10[24];
  void *v11;
  uint64_t v12;

  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_connection)
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
    *(_QWORD *)v10 = _NSConcreteStackBlock;
    *(_QWORD *)&v10[8] = 0x40000000;
    *(_QWORD *)&v10[16] = sub_10000964C;
    v11 = &unk_100055430;
    v12 = v9;
    xpc_connection_set_event_handler(object, v10);
    xpc_connection_activate(object);
  }
  else
  {
    v4 = xpc_copy_description(object);
    v5 = *(const char **)(*(_QWORD *)(a1 + 32) + 16);
    v6 = *__error();
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = "[anonymous]";
      if (v5)
        v8 = v5;
      *(_DWORD *)v10 = 136446466;
      *(_QWORD *)&v10[4] = v8;
      *(_WORD *)&v10[12] = 2080;
      *(_QWORD *)&v10[14] = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s: Received unexpected object: %s", v10, 0x16u);
    }
    *__error() = v6;
    free(v4);
  }
}

void sub_10000964C(uint64_t a1, xpc_object_t object)
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;

  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_error)
  {
    v5 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10003E2C0(object, v5);
  }
  else if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_dictionary)
  {
    v4 = sub_10002A82C(object);
    switch(v4)
    {
      case 9:
        sub_100026F6C(object);
        break;
      case 6:
        sub_100037958(object);
        break;
      case 2:
        sub_10001104C(object);
        break;
      default:
        v6 = *(NSObject **)(a1 + 32);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          sub_10003E354(v6);
        break;
    }
  }
}

void sub_100009730(uint64_t a1, xpc_object_t object)
{
  char *v4;
  const char *v5;
  int v6;
  NSObject *v7;
  const char *v8;
  int v9;
  const char *v10;
  __int16 v11;
  char *v12;

  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_remote_connection)
  {
    sub_10001F538(object);
  }
  else
  {
    v4 = xpc_copy_description(object);
    v5 = *(const char **)(*(_QWORD *)(a1 + 32) + 16);
    v6 = *__error();
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = "[anonymous]";
      if (v5)
        v8 = v5;
      v9 = 136446466;
      v10 = v8;
      v11 = 2080;
      v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s: Received unexpected object: %s", (uint8_t *)&v9, 0x16u);
    }
    *__error() = v6;
    free(v4);
  }
}

uint64_t sub_100009868(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  return _os_log_send_and_compose_impl(v8, v6, v5, 80, a5, v7, 16);
}

uint64_t sub_100009884(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;

  return _os_log_send_and_compose_impl(a1, a2, v5, 80, a5, v6, 16);
}

double sub_100009898(_QWORD *a1, _OWORD *a2)
{
  double result;

  *a1 = 0;
  result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

BOOL sub_1000098E0()
{
  NSObject *v0;

  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

BOOL sub_1000098EC(NSObject *a1)
{
  return os_log_type_enabled(a1, OS_LOG_TYPE_ERROR);
}

uint64_t sub_1000098F4(uint64_t a1)
{
  _QWORD *v1;

  return _os_crash_msg(*v1, a1);
}

uint64_t sub_10000991C(uint64_t a1)
{
  _QWORD *v1;

  return _os_crash_msg(*v1, a1);
}

uint64_t sub_100009944(uint64_t a1)
{
  _QWORD *v1;

  return _os_crash_msg(*v1, a1);
}

double sub_100009950()
{
  _QWORD *v0;
  _OWORD *v1;
  double result;

  *v0 = 0;
  result = 0.0;
  *v1 = 0u;
  v1[1] = 0u;
  v1[2] = 0u;
  v1[3] = 0u;
  v1[4] = 0u;
  return result;
}

size_t sub_10000996C(const char *__s)
{
  return strlen(__s);
}

char *sub_100009978(int *a1)
{
  return strerror(*a1);
}

CFErrorRef sub_1000099A4(uint64_t a1, _QWORD *a2)
{
  xpc_object_t empty;
  CFErrorRef v5;
  char *v6;

  if (a1)
  {
    empty = xpc_dictionary_create_empty();
    xpc_dictionary_set_uint64(empty, "img4_chip_omit", *(_QWORD *)(a1 + 16));
    xpc_dictionary_set_uint64(empty, "img4_chip_cepo", *(unsigned int *)(a1 + 24));
    xpc_dictionary_set_uint64(empty, "img4_chip_bord", *(unsigned int *)(a1 + 28));
    xpc_dictionary_set_uint64(empty, "img4_chip_chip", *(unsigned int *)(a1 + 32));
    xpc_dictionary_set_uint64(empty, "img4_chip_sdom", *(unsigned int *)(a1 + 36));
    xpc_dictionary_set_uint64(empty, "img4_chip_ecid", *(_QWORD *)(a1 + 40));
    xpc_dictionary_set_uint64(empty, "img4_chip_cpro", *(unsigned __int8 *)(a1 + 48));
    xpc_dictionary_set_uint64(empty, "img4_chip_csec", *(unsigned __int8 *)(a1 + 49));
    xpc_dictionary_set_uint64(empty, "img4_chip_epro", *(unsigned __int8 *)(a1 + 50));
    xpc_dictionary_set_uint64(empty, "img4_chip_esec", *(unsigned __int8 *)(a1 + 51));
    xpc_dictionary_set_uint64(empty, "img4_chip_iuou", *(unsigned __int8 *)(a1 + 52));
    xpc_dictionary_set_uint64(empty, "img4_chip_rsch", *(unsigned __int8 *)(a1 + 53));
    xpc_dictionary_set_uint64(empty, "img4_chip_euou", *(unsigned __int8 *)(a1 + 54));
    xpc_dictionary_set_uint64(empty, "img4_chip_esdm", *(unsigned int *)(a1 + 56));
    xpc_dictionary_set_uint64(empty, "img4_chip_fpgt", *(unsigned __int8 *)(a1 + 60));
    xpc_dictionary_set_uint64(empty, "img4_chip_fchp", *(unsigned int *)(a1 + 128));
    xpc_dictionary_set_uint64(empty, "img4_chip_type", *(unsigned int *)(a1 + 132));
    xpc_dictionary_set_uint64(empty, "img4_chip_styp", *(unsigned int *)(a1 + 136));
    xpc_dictionary_set_uint64(empty, "img4_chip_clas", *(unsigned int *)(a1 + 140));
    if (a2)
    {
      empty = objc_retainAutorelease(empty);
      v5 = 0;
      *a2 = empty;
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v6 = (char *)_os_log_send_and_compose_impl(2, 0, 0, 0, &_mh_execute_header, &_os_log_default, 16);
    v5 = sub_10000A6F8("img4_chip_instance_to_xpc", "img4_xpc.m", 35, "com.apple.security.cryptex", 11, 0, v6);
    free(v6);
    empty = 0;
  }

  return v5;
}

void sub_100009C08(_Unwind_Exception *a1)
{
  void *v1;

  free(v1);
  _Unwind_Resume(a1);
}

void sub_100009C1C(uint64_t a1)
{
  close_drop_np(a1 + 56, 0);
  sub_10003AA48(a1 + 16);
}

uint64_t sub_100009C48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_1000115BC(64);
  *(_QWORD *)(v6 + 40) = a3;
  *(_QWORD *)(v6 + 48) = a1;
  *(_DWORD *)(v6 + 56) = dup_np(a2);
  sub_10003A760(v6 + 16, (int)"com.apple.security.cryptexd", *(char **)(a1 + 8));
  return v6;
}

uint64_t sub_100009CA8(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, void *, uint64_t), char a5)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  int v14;
  NSObject *v15;
  const char *v16;
  int v17;
  int v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  int v23;
  NSObject *v24;
  const char *v25;
  int v26;
  const char *v27;
  NSObject *v28;
  const char *v29;
  DIR *v30;
  DIR *v31;
  dirent *v32;
  const char *d_name;
  void *v34;
  void *v35;
  uint64_t v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  char *v45;
  __int16 v46;
  int v47;
  char __str[1024];

  v5 = *(_QWORD *)(a1 + 48);
  if (*(_QWORD *)(v5 + 16))
  {
    v6 = a2;
    v8 = 0;
    v9 = 0;
    v10 = "%s/%s";
    v11 = ".";
    while (1)
    {
      v12 = *(_QWORD *)(v5 + 8 * v8 + 24);
      bzero(__str, 0x400uLL);
      snprintf(__str, 0x400uLL, v10, v12, *(_QWORD *)(v6 + 16));
      v13 = *(const char **)(a1 + 16);
      v14 = *__error();
      v15 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        v16 = "[anonymous]";
        if (v13)
          v16 = v13;
        v43 = v16;
        v44 = 2080;
        v45 = __str;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%{public}s: opening subpath: %s", buf, 0x16u);
      }
      *__error() = v14;
      v17 = openat(*(_DWORD *)(a1 + 56), __str, 0);
      if ((v17 & 0x80000000) == 0)
        *__error() = 0;
      v18 = *__error();
      if (v18 != 2)
      {
        v19 = v11;
        v20 = v9;
        v21 = v10;
        if (v18)
        {
          v26 = *__error();
          v27 = *(const char **)(a1 + 16);
          v23 = *__error();
          v28 = *(NSObject **)(a1 + 32);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446722;
            v29 = "[anonymous]";
            if (v27)
              v29 = v27;
            v43 = v29;
            v44 = 2080;
            v45 = __str;
            v46 = 1024;
            v47 = v26;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%{public}s: failed to open subpath: %s: %{darwin.errno}d", buf, 0x1Cu);
          }
          v6 = a2;
        }
        else
        {
          v22 = *(const char **)(a1 + 16);
          v23 = *__error();
          v24 = *(NSObject **)(a1 + 32);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136446466;
            v25 = "[anonymous]";
            if (v22)
              v25 = v22;
            v43 = v25;
            v44 = 2080;
            v45 = __str;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "%{public}s: opened subpath: %s", buf, 0x16u);
          }
        }
        *__error() = v23;
        v10 = v21;
        v9 = v20;
        v11 = v19;
      }
      if ((v17 & 0x80000000) == 0)
        break;
      if (v17 != -1)
      {
        LODWORD(v32) = 4;
        goto LABEL_39;
      }
LABEL_41:
      ++v8;
      v5 = *(_QWORD *)(a1 + 48);
      if (v8 >= *(_QWORD *)(v5 + 16))
        return v9;
    }
    if ((a5 & 1) != 0)
    {
      v35 = (void *)sub_10000A0D0((_QWORD *)a1, v6, __str);
      a4(a1, v35, a3);
      if (v35)
        os_release(v35);
      LODWORD(v32) = 20;
LABEL_39:
      if (close(v17) == -1)
        sub_10003E474(&v41, buf);
    }
    else
    {
      v30 = fdopendir(v17);
      if (!v30)
        sub_10003E394(&v41, buf);
      v31 = v30;
      while (1)
      {
        v32 = readdir(v31);
        if (!v32)
          break;
        bzero(buf, 0x400uLL);
        d_name = v32->d_name;
        if (strcmp(d_name, v11) && strcmp(d_name, ".."))
        {
          snprintf((char *)buf, 0x400uLL, v10, __str, d_name);
          v34 = (void *)sub_10000A0D0((_QWORD *)a1, v6, (const char *)buf);
          v9 = ((uint64_t (*)(uint64_t, void *, uint64_t))a4)(a1, v34, a3);
          if (v34)
            os_release(v34);
          if (v9)
          {
            LODWORD(v32) = 20;
            break;
          }
        }
      }
      if (closedir(v31) == -1)
        sub_10003E404(&v41, buf);
    }
    if ((v32 | 4) != 4)
      return v9;
    goto LABEL_41;
  }
  return 0;
}

uint64_t sub_10000A0D0(_QWORD *a1, uint64_t a2, const char *a3)
{
  const char *v6;
  int v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  int v13;
  NSObject *v14;
  const char *v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint32_t v19;
  const char *v20;
  const char *v21;
  int v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;

  v6 = (const char *)a1[2];
  v7 = *__error();
  v8 = a1[4];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = "[anonymous]";
    if (v6)
      v9 = v6;
    v23 = 136446466;
    v24 = v9;
    v25 = 2080;
    v26 = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%{public}s: resource: %s", (uint8_t *)&v23, 0x16u);
  }
  *__error() = v7;
  v10 = sub_100026960(a2, a1, a3, 0);
  v11 = sub_100026A8C(v10, 0);
  v12 = (const char *)a1[2];
  v13 = *__error();
  v14 = a1[4];
  if (v11)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = "[anonymous]";
      v23 = 136446722;
      if (v12)
        v15 = v12;
      v24 = v15;
      v25 = 2080;
      v26 = a3;
      v27 = 1024;
      LODWORD(v28) = v11;
      v16 = "%{public}s: failed to open resource %s: %{darwin.errno}d";
      v17 = v14;
      v18 = OS_LOG_TYPE_ERROR;
      v19 = 28;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v17, v18, v16, (uint8_t *)&v23, v19);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v20 = "[anonymous]";
    if (v12)
      v20 = v12;
    v21 = *(const char **)(a1[6] + 8);
    v23 = 136446722;
    v24 = v20;
    v25 = 2080;
    v26 = v21;
    v27 = 2080;
    v28 = a3;
    v16 = "%{public}s: calling out with %s resource: %s";
    v17 = v14;
    v18 = OS_LOG_TYPE_DEBUG;
    v19 = 32;
    goto LABEL_14;
  }
  *__error() = v13;
  return v10;
}

double sub_10000A2D4(_QWORD *a1, _OWORD *a2)
{
  double result;

  *a1 = 0;
  result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

char *sub_10000A2F4(const __CFString *a1)
{
  CFIndex Length;
  CFIndex MaximumSizeForEncoding;
  CFIndex v4;
  char *v5;
  char *v6;
  int CString;
  char *v8;

  Length = CFStringGetLength(a1);
  MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  if (MaximumSizeForEncoding <= -2)
    sub_10003E4E4();
  v4 = MaximumSizeForEncoding + 1;
  v5 = (char *)malloc_type_calloc(1uLL, MaximumSizeForEncoding + 1, 0x7906B74DuLL);
  if (v5)
  {
    v6 = v5;
    CString = CFStringGetCString(a1, v5, v4, 0x8000100u);
    if (CString)
      v8 = v6;
    else
      v8 = 0;
    if (CString)
      v5 = 0;
    else
      v5 = v6;
  }
  else
  {
    v8 = 0;
  }
  free(v5);
  return v8;
}

CFNumberRef sub_10000A388(int a1)
{
  int valuePtr;

  valuePtr = a1;
  return CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
}

unint64_t sub_10000A3B4(const __CFNumber *a1)
{
  uint64_t v2;
  unint64_t valuePtr;
  _OWORD v4[5];

  valuePtr = -1;
  if (!CFNumberGetValue(a1, kCFNumberSInt64Type, &valuePtr))
    sub_10003E4FC();
  if (HIDWORD(valuePtr))
    sub_10003E514(&v2, v4);
  return valuePtr;
}

CFStringRef sub_10000A430(char *cStr)
{
  return CFStringCreateWithCString(0, cStr, 0x8000100u);
}

char *sub_10000A444(const __CFString *a1, char *a2, CFIndex a3)
{
  if (a3 < 0)
    sub_10003E5C0();
  if (CFStringGetCString(a1, a2, a3, 0x8000100u))
    return a2;
  else
    return 0;
}

uint64_t sub_10000A47C(uint64_t a1, CFURLRef *a2)
{
  uint64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  CFURLRef v7;
  uint64_t v9;
  char cStr[1024];
  _OWORD v11[5];

  bzero(cStr, 0x400uLL);
  v4 = realpath_np(a1, cStr);
  if (!(_DWORD)v4)
  {
    v5 = CFStringCreateWithCString(0, cStr, 0x8000100u);
    if (!v5)
      sub_10003E5D8(&v9, v11);
    v6 = v5;
    v7 = CFURLCreateWithFileSystemPath(0, v5, kCFURLPOSIXPathStyle, 0);
    if (!v7)
      sub_10003E64C(&v9, v11);
    *a2 = v7;
    CFRelease(v6);
  }
  return v4;
}

CFMutableDictionaryRef sub_10000A554()
{
  CFMutableDictionaryRef result;
  uint64_t v1;
  _OWORD v2[5];

  result = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!result)
    sub_10003E6C0(&v1, v2);
  return result;
}

void sub_10000A5C4(__CFDictionary *a1, const void *a2, int a3)
{
  CFNumberRef v5;
  CFNumberRef v6;
  int valuePtr;
  uint64_t v8;
  _OWORD v9[5];

  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  if (!v5)
    sub_10003E734(&v8, v9);
  v6 = v5;
  CFDictionarySetValue(a1, a2, v5);
  CFRelease(v6);
}

void sub_10000A660(__CFDictionary *a1, const void *a2, char *cStr)
{
  CFStringRef v5;
  CFStringRef v6;
  uint64_t v7;
  _OWORD v8[5];

  v5 = CFStringCreateWithCString(0, cStr, 0x8000100u);
  if (!v5)
    sub_10003E5D8(&v7, v8);
  v6 = v5;
  CFDictionarySetValue(a1, a2, v5);
  CFRelease(v6);
}

CFErrorRef sub_10000A6F8(const char *a1, const char *a2, int a3, const char *a4, CFIndex a5, const void *a6, char *cStr)
{
  CFStringRef v12;
  CFStringRef v13;
  const __CFString *v14;
  CFStringRef v15;
  CFNumberRef v16;
  __CFDictionary *v17;
  CFErrorRef v18;
  int valuePtr;

  valuePtr = a3;
  v12 = CFStringCreateWithCString(0, cStr, 0x8000100u);
  v13 = CFStringCreateWithCString(0, a1, 0x8000100u);
  v14 = CFStringCreateWithCString(0, a4, 0x8000100u);
  v15 = CFStringCreateWithCString(0, a2, 0x8000100u);
  v16 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  v17 = sub_10000A554();
  CFDictionarySetValue(v17, kCFErrorLocalizedDescriptionKey, v12);
  if (os_variant_allows_internal_security_policies("com.apple.security.cryptexd"))
  {
    CFDictionarySetValue(v17, CFSTR("FunctionName"), v13);
    CFDictionarySetValue(v17, CFSTR("FileName"), v15);
    CFDictionarySetValue(v17, CFSTR("LineNumber"), v16);
  }
  if (a6)
    CFDictionarySetValue(v17, kCFErrorUnderlyingErrorKey, a6);
  v18 = CFErrorCreate(0, v14, a5, v17);
  CFRelease(v17);
  CFRelease(v12);
  CFRelease(v13);
  CFRelease(v14);
  CFRelease(v15);
  CFRelease(v16);
  return v18;
}

CFIndex sub_10000A88C(CFIndex result)
{
  __CFError *v1;
  CFTypeID v2;
  __CFError *Value;
  CFErrorDomain Domain;
  const __CFDictionary *v5;
  const __CFDictionary *v6;
  CFErrorDomain v7;
  CFErrorDomain v8;
  unsigned int Code;

  if (result)
  {
    v1 = (__CFError *)result;
    v2 = CFGetTypeID((CFTypeRef)result);
    if (v2 != CFErrorGetTypeID())
      return 0xFFFFFFFFLL;
    Value = v1;
    while (1)
    {
      Domain = CFErrorGetDomain(Value);
      if (CFEqual(Domain, CFSTR("com.apple.security.cryptex.posix")))
        break;
      v5 = CFErrorCopyUserInfo(Value);
      if (!v5)
        break;
      v6 = v5;
      Value = (__CFError *)CFDictionaryGetValue(v5, kCFErrorUnderlyingErrorKey);
      CFRelease(v6);
      if (!Value)
        goto LABEL_10;
    }
    v7 = CFErrorGetDomain(Value);
    if (CFEqual(v7, CFSTR("com.apple.security.cryptex.posix")))
      return CFErrorGetCode(Value);
LABEL_10:
    v8 = CFErrorGetDomain(v1);
    if (CFEqual(v8, CFSTR("com.apple.security.cryptex")) && (Code = CFErrorGetCode(v1), Code <= 0x24))
      return dword_100044760[Code];
    else
      return 0xFFFFFFFFLL;
  }
  return result;
}

CFDictionaryRef sub_10000A98C(CFDictionaryRef result, const void *a2, uint64_t a3)
{
  __CFError *Value;
  CFTypeID v6;
  CFTypeID TypeID;
  CFErrorDomain Domain;
  const void *v9;

  if (result)
  {
    Value = result;
    v6 = CFGetTypeID(result);
    TypeID = CFErrorGetTypeID();
    result = 0;
    if (a2)
    {
      if (v6 == TypeID)
      {
        while (1)
        {
          Domain = CFErrorGetDomain(Value);
          if (CFEqual(Domain, a2))
          {
            if (CFErrorGetCode(Value) == a3)
              break;
          }
          result = CFErrorCopyUserInfo(Value);
          if (!result)
            return result;
          v9 = result;
          Value = (__CFError *)CFDictionaryGetValue(result, kCFErrorUnderlyingErrorKey);
          CFRelease(v9);
          if (!Value)
            return 0;
        }
        return (CFDictionaryRef)1;
      }
    }
  }
  return result;
}

uint64_t sub_10000AA48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  return _os_log_send_and_compose_impl(a1, v6, v5, 80, a5, v7, 16);
}

void sub_10000ADDC(void *a1)
{
  void *v2;
  uint64_t uid;
  uint64_t v4;
  int v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  void *v11;
  __int16 v12;
  unsigned int v13;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cs"));
  uid = cryptex_session_core_get_uid();

  v4 = sub_1000380FC(uid);
  if ((_DWORD)v4)
  {
    objc_msgSend(a1, "setError:", v4);
    v5 = *__error();
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "log"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412546;
      v11 = a1;
      v12 = 1024;
      v13 = objc_msgSend(a1, "error");
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to uncork session %@: %{darwin.errno}d", (uint8_t *)&v10, 0x12u);
    }

    *__error() = v5;
    v7 = a1;
    v8 = 32;
  }
  else
  {
    v7 = a1;
    v8 = 4;
  }
  objc_msgSend(v7, "sessionEventNotify:", v8);
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "session_work_group"));
  dispatch_group_leave(v9);

}

void sub_10000B454(void *a1, void *a2, CFIndex a3, void *a4)
{
  dispatch_queue_t *v7;
  id v8;
  CFIndex v9;
  CFIndex v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  _DWORD v14[2];

  v7 = a1;
  v8 = a2;
  if (a3 && (v9 = sub_10000A88C(a3), (_DWORD)v9))
  {
    v10 = v9;
    v11 = *__error();
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "log"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14[0] = 67109120;
      v14[1] = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to unbootstrap quire: %{darwin.errno}d", (uint8_t *)v14, 8u);
    }

    *__error() = v11;
    objc_msgSend(a4, "setError:", v10);
    objc_msgSend(a4, "sessionEventNotify:", 32);
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "session_work_group"));
    dispatch_group_leave(v13);

  }
  else
  {
    sub_100016EB4(v7, v8, (uint64_t)a4, (uint64_t)sub_10000DCF0);
  }

}

id sub_10000B7D8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  const char *string;
  int64_t int64;
  xpc_object_t dictionary;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  _BOOL4 v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL4 v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BOOL4 v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BOOL4 v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  uint64_t v38;
  int v39;
  int v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;

  v4 = a3;
  string = xpc_dictionary_get_string(v4, "BUNDLEID");
  v37 = xpc_dictionary_dup_fd(v4, "DMG");
  v36 = xpc_dictionary_dup_fd(v4, "TCH");
  v35 = xpc_dictionary_dup_fd(v4, "IM4");
  v34 = xpc_dictionary_dup_fd(v4, "INF");
  v33 = xpc_dictionary_dup_fd(v4, "VOLHASH");
  int64 = xpc_dictionary_get_int64(v4, "TYPE");
  dictionary = xpc_dictionary_get_dictionary(v4, "CRYPTEX1_PROPERTIES");
  v8 = objc_claimAutoreleasedReturnValue(dictionary);
  v9 = (void *)v8;
  if (v8)
    v10 = (void *)cryptex_core_cx1_properties_create_with_xpc_dictionary(v8);
  else
    v10 = 0;
  v11 = objc_msgSend(*(id *)(a1 + 32), "sessionAddCptxWithBundleID:withType:dmgFd:trustCacheFD:manifestFD:volumeHashFD:infoPlistFd:cx1Properties:", string, int64, &v37, &v36, &v35, &v33, &v34, v10);

  if (v33 != -1 && close(v33) == -1)
  {
    v38 = 0;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v41 = 0u;
    v13 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    v14 = *__error();
    if (v13)
      v15 = 3;
    else
      v15 = 2;
    v39 = 67109120;
    v40 = v14;
    v16 = _os_log_send_and_compose_impl(v15, &v38, &v41, 80, &_mh_execute_header, &_os_log_default, 16);
    v17 = _os_crash_msg(v38, v16);
    sub_10003E8A4(v17);
  }
  if (v34 != -1 && close(v34) == -1)
  {
    v38 = 0;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v41 = 0u;
    v18 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    v19 = *__error();
    if (v18)
      v20 = 3;
    else
      v20 = 2;
    v39 = 67109120;
    v40 = v19;
    v21 = _os_log_send_and_compose_impl(v20, &v38, &v41, 80, &_mh_execute_header, &_os_log_default, 16);
    v22 = _os_crash_msg(v38, v21);
    sub_10003E8A4(v22);
  }
  if (v35 != -1 && close(v35) == -1)
  {
    v38 = 0;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v41 = 0u;
    v23 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    v24 = *__error();
    if (v23)
      v25 = 3;
    else
      v25 = 2;
    v39 = 67109120;
    v40 = v24;
    v26 = _os_log_send_and_compose_impl(v25, &v38, &v41, 80, &_mh_execute_header, &_os_log_default, 16);
    v27 = _os_crash_msg(v38, v26);
    sub_10003E8A4(v27);
  }
  if (v36 != -1 && close(v36) == -1)
  {
    v38 = 0;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v41 = 0u;
    v28 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    v29 = *__error();
    if (v28)
      v30 = 3;
    else
      v30 = 2;
    v39 = 67109120;
    v40 = v29;
    v31 = _os_log_send_and_compose_impl(v30, &v38, &v41, 80, &_mh_execute_header, &_os_log_default, 16);
    v32 = _os_crash_msg(v38, v31);
    sub_10003E8A4(v32);
  }
  if (v37 != -1 && close(v37) == -1)
    sub_10003E7DC(&v38, &v41);

  return v11;
}

void sub_10000BC3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, unsigned int a12, unsigned int a13, unsigned int a14, unsigned int a15, unsigned int a16)
{
  sub_10000BCA4(&a12);
  sub_10000BCA4(&a13);
  sub_10000BCA4(&a14);
  sub_10000BCA4(&a15);
  sub_10000BCA4(&a16);
  _Unwind_Resume(a1);
}

uint64_t sub_10000BCA4(unsigned int *a1)
{
  uint64_t result;
  uint64_t v2;
  _OWORD v3[5];

  result = *a1;
  if ((_DWORD)result != -1)
  {
    result = close(result);
    if ((_DWORD)result == -1)
      sub_10003E8A8(&v2, v3);
  }
  return result;
}

void sub_10000BF74(void *a1, void *a2, CFIndex a3, uint64_t a4)
{
  id v7;
  id v8;
  id v9;
  CFIndex v10;
  CFIndex v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  int v17;
  void *v18;
  int uid;
  void *v20;
  uint64_t overrides;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;

  v7 = a1;
  v8 = a2;
  v27 = a4;
  v9 = *(id *)(a4 + 32);
  if (a3 && (v10 = sub_10000A88C(a3), (_DWORD)v10))
  {
    v11 = v10;
    v12 = *__error();
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "log"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v29) = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "exiting session codex install: %{darwin.errno}d", buf, 8u);
    }

    *__error() = v12;
    objc_msgSend(v9, "setError:", v11);
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "session_work_group"));
    dispatch_group_leave(v14);

    sub_100038008(&v27);
  }
  else if (*(_DWORD *)(a4 + 8))
  {
    v15 = *__error();
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "log"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = *(_DWORD *)(a4 + 8);
      *(_DWORD *)buf = 67109120;
      LODWORD(v29) = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "_session_install_codex_callback context error: %{darwin.errno}d", buf, 8u);
    }

    *__error() = v15;
    objc_msgSend(v9, "setError:", *(unsigned int *)(a4 + 8));
  }
  else
  {
    if (v8)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cs"));
      uid = cryptex_session_core_get_uid();

      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cs"));
      overrides = cryptex_session_core_get_overrides();
      v22 = (void *)objc_claimAutoreleasedReturnValue(overrides);

      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cs"));
      v24 = cryptex_session_core_copy_name();
      sub_10003114C((uint64_t)v8, uid, v22, v24);

      v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "log"));
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v29 = v9;
        v30 = 2048;
        v31 = v8;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%@: Saving the quire %p", buf, 0x16u);
      }

      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "quire_array"));
      objc_msgSend(v26, "addObject:", v8);

    }
    sub_100017648((uint64_t)v7, v8, a4, (uint64_t)sub_10000DBB8);
  }

}

void sub_10000C6D8(uint64_t a1, void *a2)
{
  id v3;
  xpc_type_t type;
  xpc_type_t v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  pid_t pid;
  NSObject *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  const char *string;

  v3 = a2;
  type = xpc_get_type(v3);
  if (type != (xpc_type_t)&_xpc_type_connection)
  {
    v5 = type;
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "log"));
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5 == (xpc_type_t)&_xpc_type_error)
    {
      if (v7)
      {
        *(_DWORD *)buf = 136315138;
        string = xpc_dictionary_get_string(v3, _xpc_error_key_description);
        v8 = "connection error: %s";
        v9 = v6;
        v10 = 12;
        goto LABEL_10;
      }
    }
    else if (v7)
    {
      *(_WORD *)buf = 0;
      v8 = "unrecognized connection event";
      v9 = v6;
      v10 = 2;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
    }

    goto LABEL_12;
  }
  pid = xpc_connection_get_pid((xpc_connection_t)v3);
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "log"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(string) = pid;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "activating peer for %d", buf, 8u);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peer_array"));
  objc_msgSend(v13, "addObject:", v3);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000C8D0;
  v15[3] = &unk_100055560;
  v15[4] = *(_QWORD *)(a1 + 32);
  v14 = v3;
  v16 = v14;
  xpc_connection_set_event_handler((xpc_connection_t)v14, v15);
  xpc_connection_activate((xpc_connection_t)v14);

LABEL_12:
}

id sub_10000C8D0(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "parseCommandFromMessage:fromPeer:", a2, *(_QWORD *)(a1 + 40));
}

void sub_10000D11C(_Unwind_Exception *a1)
{
  void *v1;

  free(0);
  free(v1);
  _Unwind_Resume(a1);
}

void sub_10000D400(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[CryptexSessionList createCryptexSessionList](CryptexSessionList, "createCryptexSessionList"));
  v2 = (void *)qword_10005A410;
  qword_10005A410 = v1;

}

BOOL sub_10000D5F4(uint64_t a1, void *a2)
{
  char *v3;
  _BOOL8 v4;

  v3 = (char *)objc_msgSend(a2, "copySessionName");
  v4 = strcmp(*(const char **)(a1 + 32), v3) == 0;
  free(v3);
  return v4;
}

uint64_t sub_10000D694(void *a1)
{
  void (**v1)(id, void *);
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  pthread_rwlock_t *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  _BYTE v21[128];

  v1 = a1;
  v2 = objc_claimAutoreleasedReturnValue(+[CryptexSessionList sharedList](CryptexSessionList, "sharedList"));
  v13 = (pthread_rwlock_t *)(v2 + 8);
  pthread_rwlock_rdlock((pthread_rwlock_t *)(v2 + 8));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v14 = (void *)v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v2, "list"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "log", v13));
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
          *(_DWORD *)buf = 138412290;
          v20 = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "passing session %@", buf, 0xCu);

        }
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cs"));
        v1[2](v1, v11);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v5);
  }

  pthread_rwlock_unlock(v13);
  return 0;
}

uint64_t sub_10000D86C(void *a1, uint64_t a2)
{
  void (**v3)(id, void *, _QWORD);
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  pthread_rwlock_t *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  _BYTE v23[128];

  v3 = a1;
  v4 = objc_claimAutoreleasedReturnValue(+[CryptexSessionList sharedList](CryptexSessionList, "sharedList"));
  v15 = (pthread_rwlock_t *)(v4 + 8);
  pthread_rwlock_rdlock((pthread_rwlock_t *)(v4 + 8));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v16 = (void *)v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v4, "list"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "log", v15));
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
          *(_DWORD *)buf = 138412290;
          v22 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "passing session %@", buf, 0xCu);

        }
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cs"));
        v3[2](v3, v13, a2);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v7);
  }

  pthread_rwlock_unlock(v15);
  return 0;
}

uint64_t sub_10000DA48(void *a1)
{
  id v1;
  CryptexSession *v2;
  void *v3;
  uint64_t v4;

  v1 = a1;
  v2 = -[CryptexSession initWithCore:]([CryptexSession alloc], "initWithCore:", v1);

  if (v2)
  {
    -[CryptexSession setupHandler](v2, "setupHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[CryptexSessionList sharedList](CryptexSessionList, "sharedList"));
    objc_msgSend(v3, "addCryptexSession:", v2);

    v4 = -[CryptexSession activate](v2, "activate");
  }
  else
  {
    v4 = 22;
  }

  return v4;
}

void sub_10000DAD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CryptexSessionList sharedList](CryptexSessionList, "sharedList"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "findCryptexSession:", a1));

  v7 = v8;
  if (v8)
  {
    objc_msgSend(v8, "sessionStopWithReason:exitCode:", a2, a3);
    v7 = v8;
  }

}

id sub_10000DB48(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CryptexSessionList sharedList](CryptexSessionList, "sharedList"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "findCryptexSession:", a1));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getDispatchQueue"));
  }
  else
  {
    v4 = &_dispatch_main_q;
    v5 = &_dispatch_main_q;
  }

  return v4;
}

void sub_10000DBB8(void *a1, void *a2, CFIndex a3, uint64_t a4)
{
  id v7;
  id v8;
  id v9;
  CFIndex v10;
  CFIndex v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint8_t buf[4];
  int v17;

  v7 = a1;
  v8 = a2;
  v15 = a4;
  v9 = *(id *)(a4 + 32);
  if (a3)
  {
    v10 = sub_10000A88C(a3);
    if ((_DWORD)v10)
    {
      v11 = v10;
      v12 = *__error();
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "log"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v17 = v11;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "exiting session quire bootstrap: %{darwin.errno}d", buf, 8u);
      }

      *__error() = v12;
      objc_msgSend(v9, "setError:", v11);
    }
  }
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "session_work_group"));
  dispatch_group_leave(v14);

  sub_100038008(&v15);
}

void sub_10000DCF0(void *a1, void *a2, CFIndex a3, void *a4)
{
  id v7;
  id v8;
  int v9;
  NSObject *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  int v20;
  CFIndex v21;
  __int16 v22;
  unsigned int v23;

  v7 = a1;
  v8 = a2;
  if (a3)
  {
    v9 = *__error();
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "log"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v20 = 138412290;
      v21 = a3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to unmount quire: %@", (uint8_t *)&v20, 0xCu);
    }

    *__error() = v9;
    objc_msgSend(a4, "setError:", sub_10000A88C(a3));
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "quire_array"));
    v12 = objc_msgSend(v11, "containsObject:", v8);

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "quire_array"));
      objc_msgSend(v13, "removeObject:", v8);

    }
    else
    {
      objc_msgSend(a4, "setError:", 2);
      v14 = *__error();
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "log"));
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v20 = 134218240;
        v21 = (CFIndex)v8;
        v22 = 1024;
        v23 = objc_msgSend(a4, "error");
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Quire object not found %p: %{darwin.errno}d", (uint8_t *)&v20, 0x12u);
      }

      *__error() = v14;
    }
  }
  if (objc_msgSend(a4, "error"))
  {
    objc_msgSend(a4, "sessionEventNotify:", 32);
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "quire_array"));
    v17 = objc_msgSend(v16, "count");

    if (!v17)
    {
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "log"));
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "taking down the session", (uint8_t *)&v20, 2u);
      }

      objc_msgSend(a4, "sessionEventNotify:", 16);
      objc_msgSend(a4, "cancelPeerConnections");
    }
  }
  v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "session_work_group"));
  dispatch_group_leave(v19);

}

void sub_10000DF68(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void *sub_10000DF78()
{
  if (qword_10005A418 != -1)
    dispatch_once(&qword_10005A418, &stru_1000555E8);
  return &unk_10005A420;
}

void sub_10000DFB8(id a1)
{
  snprintf(byte_10005A420, 0x400uLL, "/AppleInternal/Library/Python/%d.%d/site-packages", 3, 9);
}

void sub_10000DFF4(uint64_t a1, unsigned int a2, void *a3, void *a4)
{
  NSObject *v7;
  id v8;
  dispatch_time_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD *v13;
  _QWORD v14[4];
  id v15;
  _QWORD *v16;
  _QWORD v17[4];

  v7 = a3;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000E134;
  v14[3] = &unk_100055638;
  v16 = v17;
  v8 = a4;
  v15 = v8;
  launch_cryptex_terminate(a1, v7, v14);
  v9 = dispatch_time(0, 1000000000 * a2);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000E1CC;
  v11[3] = &unk_100055688;
  v12 = v8;
  v13 = v17;
  v10 = v8;
  dispatch_after(v9, v7, v11);

  _Block_object_dispose(v17, 8);
}

void sub_10000E11C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000E134(uint64_t a1, int a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  dispatch_once_t *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  int v10;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000E1B8;
  v8[3] = &unk_100055610;
  v5 = v3;
  v7 = *(_QWORD *)(v4 + 24);
  v6 = (dispatch_once_t *)(v4 + 24);
  v9 = v5;
  v10 = a2;
  if (v7 != -1)
    dispatch_once(v6, v8);

}

uint64_t sub_10000E1B8(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

void sub_10000E1CC(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  dispatch_once_t *v4;
  uint64_t v5;
  _QWORD block[4];
  id v7;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E248;
  block[3] = &unk_100055660;
  v3 = v1;
  v5 = *(_QWORD *)(v2 + 24);
  v4 = (dispatch_once_t *)(v2 + 24);
  v7 = v3;
  if (v5 != -1)
    dispatch_once(v4, block);

}

uint64_t sub_10000E248(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_10000E258(uint64_t a1, uint64_t a2)
{
  NSArray *v3;
  uint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  v3 = -[NSString pathComponents](-[NSString stringByResolvingSymlinksInPath](+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a1), "stringByResolvingSymlinksInPath"), "pathComponents");
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000E344;
  v6[3] = &unk_1000556B0;
  v6[4] = -[NSString pathComponents](-[NSString stringByResolvingSymlinksInPath](+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a2), "stringByResolvingSymlinksInPath"), "pathComponents");
  v6[5] = &v7;
  -[NSArray enumerateObjectsUsingBlock:](v3, "enumerateObjectsUsingBlock:", v6);
  v4 = *((unsigned __int8 *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void sub_10000E328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

char *sub_10000E344(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  char *result;

  result = (char *)objc_msgSend(*(id *)(a1 + 32), "count");
  if ((unint64_t)(result - 1) <= a3
    || (result = (char *)objc_msgSend(a2, "isEqual:", objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3)),
        (result & 1) == 0))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

uint64_t sub_10000E3B8()
{
  return 1;
}

uint64_t sub_10000E3C0()
{
  return 0;
}

BOOL sub_10000E3C8(uint64_t a1, uint64_t a2)
{
  int v2;
  CFTypeRef cf;

  cf = 0;
  v2 = APFSVolumeRoleFind(a1, a2, &cf);
  if (cf)
    CFRelease(cf);
  return v2 == 0;
}

uint64_t sub_10000E40C(uint64_t a1, char *a2, int a3, _WORD *a4, NSObject *a5)
{
  __CFDictionary *v10;
  int v11;
  int v12;
  int v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  const __CFNumber *Value;
  int v20;
  char *v21;
  __int16 v22;
  int v23;

  v10 = sub_10000A554();
  sub_10000A660(v10, kAPFSVolumeNameKey, a2);
  sub_10000A5C4(v10, kAPFSVolumeRoleKey, a3);
  v11 = APFSVolumeCreate(a1, v10);
  if (v11)
  {
    v12 = v11;
    v13 = *__error();
    if (!os_log_type_enabled(a5, OS_LOG_TYPE_ERROR))
    {
LABEL_5:
      *__error() = v13;
      v17 = 22;
      goto LABEL_6;
    }
    v20 = 136315394;
    v21 = a2;
    v22 = 1024;
    v23 = v12;
    v14 = "failed to create volume %s: 0x%x";
    v15 = a5;
    v16 = 18;
LABEL_4:
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v20, v16);
    goto LABEL_5;
  }
  Value = (const __CFNumber *)CFDictionaryGetValue(v10, kAPFSVolumeFSIndexKey);
  if (!Value)
  {
    v13 = *__error();
    if (!os_log_type_enabled(a5, OS_LOG_TYPE_ERROR))
      goto LABEL_5;
    v20 = 136315138;
    v21 = a2;
    v14 = "failed to get volume %s index key";
    v15 = a5;
    v16 = 12;
    goto LABEL_4;
  }
  v17 = 0;
  if (a4)
    *a4 = sub_10000A3B4(Value) + 1;
LABEL_6:
  if (v10)
    CFRelease(v10);
  return v17;
}

uint64_t sub_10000E5BC(char *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  pid_t v10;
  pid_t v11;
  int v13;
  pid_t v14;
  uint8_t buf[4];
  _BYTE v16[10];
  int v17;
  __int16 v18;
  int v19;
  char *__argv[2];
  uint64_t v21;
  uint64_t v22;

  v13 = -1;
  v14 = -1;
  __argv[0] = "/sbin/mount_apfs";
  v22 = unk_1000556E8;
  __argv[1] = a1;
  v21 = a2;
  v4 = posix_spawn(&v14, "/sbin/mount_apfs", 0, 0, __argv, 0);
  if ((_DWORD)v4)
  {
    v5 = v4;
    v6 = *__error();
    if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(char **)v16 = __argv[0];
      *(_WORD *)&v16[8] = 1024;
      v17 = v5;
      v7 = "failed to posix_spawn %s: %{darwin.errno}d";
LABEL_4:
      v8 = a3;
      v9 = 18;
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, v7, buf, v9);
      goto LABEL_19;
    }
    goto LABEL_19;
  }
  v10 = waitpid(v14, &v13, 0);
  if (v10 != v14)
  {
    v11 = v10;
    v5 = *__error();
    v6 = *__error();
    if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v16 = v11;
      *(_WORD *)&v16[4] = 1024;
      *(_DWORD *)&v16[6] = v5;
      v7 = "unexpected return code for waitpid: %d: %{darwin.errno}d";
      v8 = a3;
      v9 = 14;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  if ((v13 & 0x7F) != 0)
  {
    if ((v13 & 0x7F) == 0x7F)
    {
      v6 = *__error();
      v5 = 35;
      if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(char **)v16 = __argv[0];
        *(_WORD *)&v16[8] = 1024;
        v17 = 35;
        v7 = "%s exited with an unknown state: %{darwin.errno}d";
        goto LABEL_4;
      }
LABEL_19:
      *__error() = v6;
      return v5;
    }
    v6 = *__error();
    v5 = 4;
    if (!os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    *(_DWORD *)buf = 136315650;
    *(char **)v16 = __argv[0];
    *(_WORD *)&v16[8] = 1024;
    v17 = v13 & 0x7F;
    v18 = 1024;
    v19 = 4;
    v7 = "%s exited with signal: %d: %{darwin.errno}d";
LABEL_17:
    v8 = a3;
    v9 = 24;
    goto LABEL_18;
  }
  v5 = BYTE1(v13);
  if (BYTE1(v13))
  {
    v6 = *__error();
    if (!os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    *(_DWORD *)buf = 136315650;
    *(char **)v16 = __argv[0];
    *(_WORD *)&v16[8] = 1024;
    v17 = BYTE1(v13);
    v18 = 1024;
    v19 = v5;
    v7 = "%s returned non-zero exit: %d: %{darwin.errno}d";
    goto LABEL_17;
  }
  return v5;
}

uint64_t sub_10000E874(int a1, char **a2, NSObject *a3)
{
  const __CFDictionary *v6;
  uint64_t MatchingServices;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  io_object_t v12;
  io_registry_entry_t v13;
  kern_return_t v14;
  kern_return_t v15;
  int v16;
  const __CFNumber *v17;
  const __CFNumber *Value;
  CFTypeID v19;
  int v20;
  CFTypeID v21;
  unsigned __int16 valuePtr;
  io_iterator_t existing;
  CFMutableDictionaryRef properties;
  uint8_t buf[88];

  existing = 0;
  v6 = IOServiceMatching("AppleAPFSVolume");
  if (v6)
  {
    MatchingServices = IOServiceGetMatchingServices(kIOMainPortDefault, v6, &existing);
    if ((_DWORD)MatchingServices)
    {
      v8 = MatchingServices;
      v9 = *__error();
      if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v8;
        _os_log_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "failed to get matching services: %{mach.errno}x", buf, 8u);
      }
      *__error() = v9;
      v10 = sub_100010B88(v8);
      goto LABEL_34;
    }
    IOIteratorReset(existing);
    v12 = IOIteratorNext(existing);
    if (!v12)
    {
LABEL_33:
      v10 = 93;
      goto LABEL_34;
    }
    v13 = v12;
    v10 = 0xFFFFFFFFLL;
    while (1)
    {
      properties = 0;
      if (!IORegistryEntryInPlane(v13, "IOService"))
        goto LABEL_16;
      v14 = IORegistryEntryCreateCFProperties(v13, &properties, kCFAllocatorDefault, 0);
      if (v14)
        break;
      Value = (const __CFNumber *)CFDictionaryGetValue(properties, CFSTR("RoleValue"));
      v17 = Value;
      if (Value)
      {
        v19 = CFGetTypeID(Value);
        if (v19 != CFNumberGetTypeID())
          goto LABEL_32;
        valuePtr = 0;
        if (!CFNumberGetValue(v17, kCFNumberSInt16Type, &valuePtr) || valuePtr != a1)
          goto LABEL_32;
        v17 = (const __CFNumber *)CFDictionaryGetValue(properties, CFSTR("FormattedBy"));
        v20 = *__error();
        if (os_log_type_enabled(a3, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v17;
          _os_log_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "volume is formatted by %@", buf, 0xCu);
        }
        *__error() = v20;
        if (v17 && (v21 = CFGetTypeID(v17), v21 == CFStringGetTypeID()))
        {
          v10 = 0;
          *a2 = sub_10000A2F4((const __CFString *)v17);
          LODWORD(v17) = 4;
        }
        else
        {
LABEL_32:
          LODWORD(v17) = 0;
        }
      }
LABEL_17:
      if (properties)
        CFRelease(properties);
      if (IOObjectRelease(v13))
        sub_10003EA04(&properties, buf);
      if ((v17 | 8) != 8)
        goto LABEL_34;
      v13 = IOIteratorNext(existing);
      if (!v13)
        goto LABEL_33;
    }
    v15 = v14;
    v16 = *__error();
    if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v15;
      _os_log_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "failed to get service properties: %{mach.errno}x", buf, 8u);
    }
    *__error() = v16;
LABEL_16:
    LODWORD(v17) = 8;
    goto LABEL_17;
  }
  v11 = *__error();
  if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "AppleAPFSVolume";
    _os_log_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "failed to match service %s", buf, 0xCu);
  }
  *__error() = v11;
  v10 = 78;
LABEL_34:
  if (existing && IOObjectRelease(existing))
    sub_10003EA04(&properties, buf);
  return v10;
}

uint64_t sub_10000EC18(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v4;
  int v5;
  uint64_t v6;
  CFIndex v7;
  const __CFString *ValueAtIndex;
  char *v9;
  int v10;
  int v11;
  char *f_mntfromname;
  int v13;
  const char *v14;
  statfs *v16;
  CFArrayRef theArray;
  uint8_t buf[4];
  char *f_mntonname;
  __int16 v20;
  int v21;

  v4 = a2;
  theArray = 0;
  if (APFSVolumeRoleFind(a1, a2, &theArray))
  {
    v5 = *__error();
    if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(f_mntonname) = v4;
      _os_log_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "failed to find volume for role %d", buf, 8u);
    }
    *__error() = v5;
    v6 = 2;
  }
  else if (CFArrayGetCount(theArray) < 1)
  {
LABEL_15:
    v6 = 0;
  }
  else
  {
    v7 = 0;
    while (1)
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, v7);
      v9 = sub_10000A2F4(ValueAtIndex);
      v16 = 0;
      v10 = getmntinfo(&v16, 2);
      if (v10)
      {
        v11 = v10;
        f_mntfromname = v16->f_mntfromname;
        while (strcmp(v9, f_mntfromname))
        {
          v16 = (statfs *)(f_mntfromname + 1056);
          f_mntfromname += 2168;
          if (!--v11)
            goto LABEL_13;
        }
        if (unmount(f_mntfromname - 1024, 0x80000))
          break;
      }
LABEL_13:
      if (APFSVolumeDelete(v9))
      {
        v6 = *__error();
        v13 = *__error();
        if (!os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
          goto LABEL_21;
        *(_DWORD *)buf = 136315394;
        f_mntonname = v9;
        v20 = 1024;
        v21 = v6;
        v14 = "failed to delete volume %s: %{darwin.errno}d";
        goto LABEL_20;
      }
      free(v9);
      if (++v7 >= CFArrayGetCount(theArray))
        goto LABEL_15;
    }
    v6 = *__error();
    v13 = *__error();
    if (!os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    *(_DWORD *)buf = 136315394;
    f_mntonname = v16->f_mntonname;
    v20 = 1024;
    v21 = v6;
    v14 = "failed to umount %s: %{darwin.errno}d";
LABEL_20:
    _os_log_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, v14, buf, 0x12u);
LABEL_21:
    *__error() = v13;
    free(v9);
  }
  if (theArray)
    CFRelease(theArray);
  return v6;
}

uint64_t sub_10000EE70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  return _os_log_send_and_compose_impl(a1, v6, v5, 80, a5, v7, 16);
}

double sub_10000EE88(_QWORD *a1, _OWORD *a2)
{
  double result;

  *a1 = 0;
  result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

void *sub_10000EEAC(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = sub_100014FE0();
  v3 = sub_100017DE4((uint64_t)v2, (char *)(a1 + 24), 0);
  if (v2)
    os_release(v2);
  return v3;
}

uint64_t sub_10000EEF0(_QWORD *a1, _BYTE *a2, _BYTE *a3)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  int v10;
  NSObject *v11;
  const char *v12;
  const char *v13;
  int v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  _QWORD *v24;
  _BYTE v26[12];
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  int v36;

  v6 = (_QWORD *)sub_1000116F4((uint64_t)a2, 0);
  v7 = sub_100011758((uint64_t)v6);
  if ((_DWORD)v7)
  {
    v8 = v7;
    v9 = (const char *)a1[7];
    v10 = *__error();
    v11 = a1[9];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = "[anonymous]";
      if (v9)
        v12 = v9;
      *(_DWORD *)v26 = 136446466;
      *(_QWORD *)&v26[4] = v12;
      v27 = 1024;
      LODWORD(v28) = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}s: failed to resolve proc: %{darwin.errno}d", v26, 0x12u);
    }
    *__error() = v10;
  }
  else
  {
    v8 = sub_100012380((uint64_t)v6, "com.apple.private.security.cryptex.install");
    v13 = (const char *)a1[7];
    v14 = *__error();
    v15 = a1[9];
    if ((_DWORD)v8)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = "[anonymous]";
        v17 = v6[8];
        v18 = v6[9];
        if (v13)
          v16 = v13;
        *(_DWORD *)v26 = 136447490;
        *(_QWORD *)&v26[4] = v16;
        v27 = 2080;
        v28 = "uninstall";
        v29 = 2080;
        v30 = "com.apple.private.security.cryptex.install";
        v31 = 2080;
        v32 = v17;
        v33 = 2080;
        v34 = v18;
        v35 = 1024;
        v36 = v8;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}s: proc not entitled for %s: entitlement = %s, proc = %s, signing id = %s: %{darwin.errno}d", v26, 0x3Au);
      }
      *__error() = v14;
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v19 = "[anonymous]";
        if (v13)
          v19 = v13;
        v20 = v6[8];
        v21 = v6[9];
        *(_DWORD *)v26 = 136447234;
        *(_QWORD *)&v26[4] = v19;
        v27 = 2080;
        v28 = "uninstall";
        v29 = 2080;
        v30 = "com.apple.private.security.cryptex.install";
        v31 = 2080;
        v32 = v20;
        v33 = 2080;
        v34 = v21;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%{public}s: authorized proc for %s: entitlement = %s, proc = %s, signing id = %s", v26, 0x34u);
      }
      *__error() = v14;
      v22 = a1[49];
      *(_QWORD *)v26 = 0;
      v8 = cryptex_uninstall_unpack(a2, v26);
      if (!(_DWORD)v8)
      {
        v23 = v26[0] & 1;
        v24 = sub_10002A74C(0, a2, a3);
        sub_10001783C(v22, a1, v23, (uint64_t)v24, (uint64_t)sub_10000F1BC);
        v8 = 36;
      }
    }
  }
  if (v6)
    os_release(v6);
  os_release(a1);
  return v8;
}

void sub_10000F1BC(dispatch_queue_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  int v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  int v14;
  uint64_t v15;

  v8 = *__error();
  v9 = a2[9];
  if (a3)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412290;
      v15 = a3;
      v10 = "unbootstrap: %@";
      v11 = v9;
      v12 = OS_LOG_TYPE_ERROR;
      v13 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, (uint8_t *)&v14, v13);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v14) = 0;
    v10 = "unbootstrap [no error]";
    v11 = v9;
    v12 = OS_LOG_TYPE_DEBUG;
    v13 = 2;
    goto LABEL_6;
  }
  *__error() = v8;
  sub_100016EB4(a1, a2, a4, (uint64_t)sub_10000F2D0);
}

void sub_10000F2D0(uint64_t a1, uint64_t a2, CFIndex a3, uint64_t a4)
{
  int v5;
  uint64_t v6;

  if (a3)
    v5 = sub_10000A88C(a3);
  else
    v5 = 0;
  v6 = a4;
  sub_10002A79C(&v6, v5);
}

id sub_10000F318(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  NSFileManager *v10;
  NSString *v11;
  NSURL *v12;
  NSURL *v13;
  NSObject *v14;
  const __CFString *v15;
  id v16;
  int v17;
  NSObject *v18;
  const char *v19;
  id v20;
  NSObject *v21;
  const char *v22;
  const char *v23;
  NSObject *v24;
  const char *v25;
  const char *v26;
  int v28;
  id v29;
  NSFileAttributeKey v30;
  _UNKNOWN **v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  int v35;
  NSFileAttributeKey v36;
  _UNKNOWN **v37;

  v29 = 0;
  v10 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
  v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s/%s"), a4, a3);
  v12 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v11);
  v13 = -[NSURL URLByDeletingLastPathComponent](v12, "URLByDeletingLastPathComponent");
  v36 = NSFilePosixPermissions;
  v37 = &off_100057B80;
  if (!-[NSFileManager createDirectoryAtURL:withIntermediateDirectories:attributes:error:](v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v13, 1, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1), &v29))
  {
    v16 = objc_msgSend(v29, "code");
    v17 = *__error();
    if (qword_10005A828 != -1)
      dispatch_once(&qword_10005A828, &stru_100055720);
    v18 = qword_10005A820;
    if (os_log_type_enabled((os_log_t)qword_10005A820, OS_LOG_TYPE_ERROR))
    {
      v19 = -[NSString UTF8String](-[NSURL path](v13, "path"), "UTF8String");
      *(_DWORD *)buf = 136315394;
      v33 = v19;
      v34 = 1024;
      v35 = (int)v16;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "failed to create directory at %s: %{darwin.errno}d", buf, 0x12u);
    }
    goto LABEL_33;
  }
  if (-[NSFileManager fileExistsAtPath:](v10, "fileExistsAtPath:", v11))
  {
    v28 = *__error();
    if (qword_10005A828 != -1)
      dispatch_once(&qword_10005A828, &stru_100055720);
    v14 = qword_10005A820;
    if (os_log_type_enabled((os_log_t)qword_10005A820, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "trampoline file exists, removing", buf, 2u);
    }
    *__error() = v28;
    if (!-[NSFileManager removeItemAtPath:error:](v10, "removeItemAtPath:error:", v11, &v29))
    {
      v16 = objc_msgSend(v29, "code");
      v17 = *__error();
      if (qword_10005A828 != -1)
        dispatch_once(&qword_10005A828, &stru_100055720);
      v24 = qword_10005A820;
      if (os_log_type_enabled((os_log_t)qword_10005A820, OS_LOG_TYPE_ERROR))
      {
        v25 = -[NSString UTF8String](v11, "UTF8String");
        *(_DWORD *)buf = 136315394;
        v33 = v25;
        v34 = 1024;
        v35 = (int)v16;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "failed to remove file at %s: %{darwin.errno}d", buf, 0x12u);
      }
      goto LABEL_33;
    }
  }
  if (a5)
    v15 = CFSTR("#!/bin/sh\n/usr/bin/cryptexctl exec -P -i %s %s %s \"$@\"\n");
  else
    v15 = CFSTR("#!/bin/sh\n/usr/bin/cryptexctl exec -i %s %s %s \"$@\"\n");
  if (!-[NSString writeToFile:atomically:encoding:error:](+[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, a1, a2, a3), "writeToFile:atomically:encoding:error:", v11, 0, 4, &v29))
  {
    v20 = objc_msgSend(v29, "code");
    v17 = *__error();
    if (qword_10005A828 != -1)
      dispatch_once(&qword_10005A828, &stru_100055720);
    v21 = qword_10005A820;
    if (!os_log_type_enabled((os_log_t)qword_10005A820, OS_LOG_TYPE_ERROR))
      goto LABEL_32;
    v22 = -[NSString UTF8String](-[NSURL path](v12, "path"), "UTF8String");
    *(_DWORD *)buf = 136315394;
    v33 = v22;
    v34 = 1024;
    v35 = (int)v20;
    v23 = "failed to write trampoline at %s: %{darwin.errno}d";
    goto LABEL_31;
  }
  v30 = NSFilePosixPermissions;
  v31 = &off_100057B80;
  if (!-[NSFileManager setAttributes:ofItemAtPath:error:](v10, "setAttributes:ofItemAtPath:error:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1), v11, &v29))
  {
    v20 = objc_msgSend(v29, "code");
    v17 = *__error();
    if (qword_10005A828 != -1)
      dispatch_once(&qword_10005A828, &stru_100055720);
    v21 = qword_10005A820;
    if (!os_log_type_enabled((os_log_t)qword_10005A820, OS_LOG_TYPE_ERROR))
      goto LABEL_32;
    v26 = -[NSString UTF8String](-[NSURL path](v12, "path"), "UTF8String");
    *(_DWORD *)buf = 136315394;
    v33 = v26;
    v34 = 1024;
    v35 = (int)v20;
    v23 = "failed to change trampoline permission at %s: %{darwin.errno}d";
LABEL_31:
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, v23, buf, 0x12u);
LABEL_32:
    v16 = v20;
LABEL_33:
    *__error() = v17;
    return v16;
  }
  return 0;
}

void sub_10000F7DC(id a1)
{
  qword_10005A820 = (uint64_t)os_log_create("com.apple.libcryptex", "bin_trampoline");
}

uint64_t sub_10000F808(BOOL *a1)
{
  uint64_t result;
  size_t v3;
  int v4;

  v4 = 0;
  v3 = 4;
  if (sysctlbyname("security.mac.amfi.developer_mode_status", &v4, &v3, 0, 0))
    return *__error();
  result = 0;
  if (a1)
    *a1 = v4 != 0;
  return result;
}

void sub_10000F87C(void **a1)
{
  close_drop_optional_np(a1 + 14, 0);
  os_release(a1[11]);
  os_release(a1[12]);
  os_release(a1[13]);
  free(a1[15]);
  sub_10003AA48((uint64_t)(a1 + 7));
}

_QWORD *sub_10000F8C8(uint64_t a1, void *a2, uint64_t a3)
{
  _QWORD *v6;
  uint64_t v7;

  v6 = (_QWORD *)sub_100011388(128);
  v6[10] = a3;
  v6[11] = os_retain(a2);
  v6[12] = os_retain((void *)a1);
  v7 = cryptex_core_create(0);
  v6[13] = v7;
  if (*(_QWORD *)(a1 + 168))
  {
    cryptex_core_attach_host();
    v7 = v6[13];
  }
  if (*(_QWORD *)(a1 + 216))
  {
    cryptex_core_set_cryptex1_properties(v7);
    v7 = v6[13];
  }
  *(_OWORD *)(v7 + 40) = *(_OWORD *)(a1 + 40);
  *(_QWORD *)(v7 + 56) = *(_QWORD *)(a1 + 56);
  sub_10003A760((uint64_t)(v6 + 7), (int)"com.apple.security.cryptexd", "protex");
  cryptex_init(v6, 0, sub_10000F98C, 0);
  return v6;
}

uint64_t sub_10000F98C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  int v5;
  NSObject *v6;
  const char *v7;
  const char *v8;
  int v9;
  NSObject *v10;
  const char *v11;
  const char *v12;
  int v13;
  NSObject *v14;
  const char *v15;
  char *v16;
  const char *v17;
  int v18;
  NSObject *v19;
  const char *v20;
  int v22;
  uint8_t v23[4];
  const char *v24;
  __int16 v25;
  uint8_t *v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int v30;
  _OWORD __s1[16];

  __s1[0] = *(_OWORD *)"protex.XXXXXX";
  memset(&__s1[1], 0, 239);
  v22 = -1;
  v2 = sub_100015678(*(_QWORD *)(a1 + 88), (uint64_t)&unk_100055D40, (char *)__s1, &v22);
  if ((_DWORD)v2)
  {
    v3 = v2;
    v4 = *(const char **)(a1 + 56);
    v5 = *__error();
    v6 = *(NSObject **)(a1 + 72);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = "[anonymous]";
      if (v4)
        v7 = v4;
      *(_DWORD *)buf = 136446466;
      v28 = v7;
      v29 = 1024;
      v30 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s: failed to create staging directory: %{darwin.errno}d", buf, 0x12u);
    }
    *__error() = v5;
  }
  else
  {
    if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_DEBUG))
    {
      bzero(buf, 0x400uLL);
      if (!realpath_np(v22, buf))
      {
        v8 = *(const char **)(a1 + 56);
        v9 = *__error();
        v10 = *(NSObject **)(a1 + 72);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          v11 = "[anonymous]";
          if (v8)
            v11 = v8;
          *(_DWORD *)v23 = 136446466;
          v24 = v11;
          v25 = 2080;
          v26 = buf;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%{public}s: staging directory = %s", v23, 0x16u);
        }
        *__error() = v9;
      }
    }
    v12 = *(const char **)(a1 + 56);
    v13 = *__error();
    v14 = *(NSObject **)(a1 + 72);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v15 = "[anonymous]";
      if (v12)
        v15 = v12;
      *(_DWORD *)buf = 136446466;
      v28 = v15;
      v29 = 1024;
      v30 = v22;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%{public}s: dirfd = %d", buf, 0x12u);
    }
    *__error() = v13;
    *(_DWORD *)(a1 + 112) = sub_10003AA70(&v22);
    if (_dispatch_is_multithreaded())
    {
      while (1)
      {
        v16 = strdup((const char *)__s1);
        if (v16)
          break;
        __os_temporary_resource_shortage();
      }
    }
    else
    {
      v16 = strdup((const char *)__s1);
      if (!v16)
        sub_10003EA78((const char *)__s1, v23, buf);
    }
    v3 = 0;
    *(_QWORD *)(a1 + 120) = v16;
  }
  if (v22 != -1 && close(v22) == -1)
    sub_10003E474(v23, buf);
  if ((_DWORD)v3)
  {
    v17 = *(const char **)(a1 + 56);
    v18 = *__error();
    v19 = *(NSObject **)(a1 + 72);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = "[anonymous]";
      if (v17)
        v20 = v17;
      *(_DWORD *)buf = 136446466;
      v28 = v20;
      v29 = 1024;
      v30 = v3;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}s: failed to make stage directory: %{darwin.errno}d", buf, 0x12u);
    }
    *__error() = v18;
  }
  return cryptex_set_error(a1, v3);
}

uint64_t sub_10000FD00(void *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;

  v6 = sub_10003C89C(a1, 0x28uLL);
  v6[3] = a2;
  v6[4] = a3;
  cryptex_async_f(a1, v6, sub_10000FD50);
  return cryptex_activate(a1);
}

uint64_t sub_10000FD50(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;
  int error;
  int v4;
  const char *v5;
  int v6;
  NSObject *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  int v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  NSObject *v22;
  int *v23;
  char *v24;
  unint64_t v25;
  const char *v26;
  void *v27;
  int v28;
  const char *v29;
  int v30;
  NSObject *v31;
  uint64_t v32;
  const char *v33;
  const char *v34;
  int v35;
  NSObject *v36;
  const char *v37;
  uint64_t v38;
  int v39;
  const char *v40;
  int v41;
  NSObject *v42;
  const char *v43;
  const char *v44;
  int v45;
  NSObject *v46;
  const char *v47;
  NSObject *v48;
  const char *v49;
  const char *v50;
  NSObject *v51;
  const char *v52;
  int v53;
  const char *v54;
  uint64_t v55;
  int v56;
  int v57;
  const char *v58;
  int v59;
  NSObject *v60;
  const char *v61;
  NSObject *v62;
  const char *v63;
  int v64;
  int v65;
  NSObject *v66;
  int *v67;
  char *v68;
  unint64_t v69;
  const char *v70;
  void *v71;
  int v72;
  const char *v73;
  NSObject *v74;
  const char *v75;
  int v76;
  int v77;
  const char *v78;
  const char *v79;
  uint64_t v80;
  const char *v81;
  const char *v82;
  NSObject *v83;
  const char *v84;
  NSObject *v85;
  uint32_t v86;
  const char *v87;
  int v88;
  NSObject *v89;
  const char *v91;
  uint64_t v92;
  const char *v93;
  const char *v94;
  _QWORD *v96;
  int v97;
  uint64_t v98;
  stat v99;
  uint8_t v100[4];
  const char *v101;
  __int16 v102;
  int v103;
  __int16 v104;
  const char *v105;
  __int16 v106;
  off_t st_size;
  __int16 v108;
  void *v109;
  __int16 v110;
  uint8_t *v111;
  stat v112;
  uint8_t v113[4];
  const char *v114;
  __int16 v115;
  int v116;
  __int16 v117;
  const char *v118;
  __int16 v119;
  off_t v120;
  __int16 v121;
  void *v122;
  __int16 v123;
  uint8_t *v124;
  uint8_t buf[4];
  const char *v126;
  __int16 v127;
  uint64_t v128;
  __int16 v129;
  int v130;

  v1 = a1;
  v2 = *a1;
  error = cryptex_get_error(*a1);
  if (error)
  {
    v4 = error;
    v5 = *(const char **)(v2 + 56);
    v6 = *__error();
    v7 = *(NSObject **)(v2 + 72);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = "[anonymous]";
      if (v5)
        v8 = v5;
      *(_DWORD *)buf = 136446466;
      v126 = v8;
      v127 = 1024;
      LODWORD(v128) = v4;
      v9 = "%{public}s: initialization failed: %{darwin.errno}d";
      goto LABEL_119;
    }
    goto LABEL_120;
  }
  v96 = v1;
  v10 = 0;
  v11 = 0;
  v4 = -1;
  do
  {
    v12 = *(_QWORD *)((char *)&cryptex_asset_types + v10);
    v13 = *(_QWORD *)(*(_QWORD *)(v2 + 96) + v10 + 64);
    if (v13)
    {
      if (*(_UNKNOWN **)(v13 + 8) == &_cryptex_asset_type_im4m || (*(_BYTE *)(v2 + 80) & 1) == 0)
      {
        v14 = *(const char **)(v2 + 56);
        v15 = *__error();
        v16 = *(NSObject **)(v2 + 72);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          v17 = "[anonymous]";
          if (v14)
            v17 = v14;
          v18 = *(_QWORD *)(*(_QWORD *)(v13 + 8) + 40);
          *(_DWORD *)buf = 136446466;
          v126 = v17;
          v127 = 2080;
          v128 = v18;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%{public}s: copying asset: %s", buf, 0x16u);
        }
        *__error() = v15;
        v19 = cryptex_asset_copy(v13);
        *(_QWORD *)&v99.st_dev = v19;
        v20 = openat(*(_DWORD *)(v2 + 112), *(const char **)(*(_QWORD *)(v13 + 8) + 40), 514, 438);
        *(_DWORD *)v113 = v20;
        if (v20 < 0)
        {
          v4 = *__error();
          v44 = *(const char **)(v2 + 56);
          v45 = *__error();
          v46 = *(NSObject **)(v2 + 72);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            v47 = "[anonymous]";
            if (v44)
              v47 = v44;
            v126 = v47;
            v127 = 1024;
            LODWORD(v128) = v4;
            v48 = v46;
            v49 = "%{public}s: openat: %{darwin.errno}d";
            goto LABEL_49;
          }
        }
        else
        {
          v21 = v20;
          if (lseek(*(_DWORD *)(v13 + 16), 0, 0) == -1)
            sub_10003EB5C(&v112, buf);
          if ((fcopyfile(*(_DWORD *)(v13 + 16), v21, 0, 0x100000Fu) & 0x80000000) == 0)
          {
            if (lseek(v21, 0, 0) == -1)
              sub_10003EB5C(&v112, buf);
            v22 = *(NSObject **)(v2 + 72);
            bzero(buf, 0x400uLL);
            memset(&v112, 0, sizeof(v112));
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              if (fstat(v21, &v112) == -1)
              {
                v56 = *__error();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                {
                  v57 = *__error();
                  *(_DWORD *)v100 = 136315650;
                  v101 = "fd_copy";
                  v102 = 1024;
                  v103 = v21;
                  v104 = 1024;
                  LODWORD(v105) = v57;
                  _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s fd[%d] : [invalid descriptor]: %{darwin.errno}d", v100, 0x18u);
                }
                *__error() = v56;
              }
              else
              {
                if (fcntl(v21, 50, buf))
                {
                  v23 = __error();
                  v24 = strerror(*v23);
                  snprintf((char *)buf, 0x400uLL, "[%s]", v24);
                }
                v25 = ((unint64_t)v112.st_mode >> 12) ^ 8;
                v26 = "[unknown]";
                if ((_DWORD)v25 != 15)
                  v26 = off_100055B40[v25];
                v27 = (void *)os_flagset_copy_string(&unk_100055740, v112.st_flags);
                v28 = *__error();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)v100 = 136316418;
                  v101 = "fd_copy";
                  v102 = 1024;
                  v103 = v21;
                  v104 = 2080;
                  v105 = v26;
                  v106 = 2048;
                  st_size = v112.st_size;
                  v108 = 2080;
                  v109 = v27;
                  v110 = 2080;
                  v111 = buf;
                  _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "%s fd[%d]: type = %s, size = %lld, flags = %s, path = %s", v100, 0x3Au);
                }
                *__error() = v28;
                free(v27);
              }
            }
            *(_DWORD *)(v19 + 16) = claimfd_np(v113, 0, 0);
            cryptex_core_set_asset(*(_QWORD *)(v2 + 104), &v99);
            v4 = 0;
            v19 = *(_QWORD *)&v99.st_dev;
LABEL_65:
            cryptex_asset_destroy(v19);
            if (*(_DWORD *)v113 != -1 && close(*(int *)v113) == -1)
              sub_10003E474(&v112, buf);
            if (v4)
            {
              v78 = *(const char **)(v2 + 56);
              v88 = *__error();
              v89 = *(NSObject **)(v2 + 72);
              if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
              {
                v79 = "[anonymous]";
                if (v78)
                  v79 = v78;
                v80 = *(_QWORD *)(v12 + 40);
                *(_DWORD *)buf = 136446722;
                v126 = v79;
                v127 = 2080;
                v128 = v80;
                v129 = 1024;
                v130 = v4;
                v81 = "%{public}s: copy asset: %s: %{darwin.errno}d";
                goto LABEL_112;
              }
              goto LABEL_114;
            }
LABEL_68:
            v4 = 0;
            ++v11;
            goto LABEL_69;
          }
          v4 = *__error();
          v50 = *(const char **)(v2 + 56);
          v45 = *__error();
          v51 = *(NSObject **)(v2 + 72);
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            v52 = "[anonymous]";
            if (v50)
              v52 = v50;
            v126 = v52;
            v127 = 1024;
            LODWORD(v128) = v4;
            v48 = v51;
            v49 = "%{public}s: fcopyfile: %{darwin.errno}d";
LABEL_49:
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, v49, buf, 0x12u);
          }
        }
        *__error() = v45;
        goto LABEL_65;
      }
      bzero(&v112, 0x400uLL);
      bzero(v100, 0x400uLL);
      v98 = 0;
      v97 = -1;
      v34 = *(const char **)(v2 + 56);
      v35 = *__error();
      v36 = *(NSObject **)(v2 + 72);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        v37 = "[anonymous]";
        if (v34)
          v37 = v34;
        v38 = *(_QWORD *)(*(_QWORD *)(v13 + 8) + 40);
        *(_DWORD *)buf = 136446466;
        v126 = v37;
        v127 = 2080;
        v128 = v38;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "%{public}s: symlinking asset: %s", buf, 0x16u);
      }
      *__error() = v35;
      v39 = realpath_np(*(unsigned int *)(v13 + 16), &v112);
      if (v39)
      {
        v4 = v39;
        v40 = *(const char **)(v2 + 56);
        v41 = *__error();
        v42 = *(NSObject **)(v2 + 72);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v43 = "[anonymous]";
          if (v40)
            v43 = v40;
LABEL_55:
          v126 = v43;
          v127 = 1024;
          LODWORD(v128) = v4;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%{public}s: realpath_np: %{darwin.errno}d", buf, 0x12u);
          goto LABEL_56;
        }
        goto LABEL_56;
      }
      v53 = realpath_np(*(unsigned int *)(v2 + 112), v100);
      if (v53)
      {
        v4 = v53;
        v54 = *(const char **)(v2 + 56);
        v41 = *__error();
        v42 = *(NSObject **)(v2 + 72);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v43 = "[anonymous]";
          if (v54)
            v43 = v54;
          goto LABEL_55;
        }
LABEL_56:
        v55 = 0;
        *__error() = v41;
        goto LABEL_57;
      }
      __strcat_chk(v100, "/", 1024);
      __strncat_chk(v100, *(_QWORD *)(*(_QWORD *)(v13 + 8) + 40), 4, 1024);
      v55 = cryptex_asset_copy(v13);
      v98 = v55;
      if (symlink((const char *)&v112, (const char *)v100))
      {
        v4 = *__error();
        v58 = *(const char **)(v2 + 56);
        v59 = *__error();
        v60 = *(NSObject **)(v2 + 72);
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v61 = "[anonymous]";
          if (v58)
            v61 = v58;
          v126 = v61;
          v127 = 1024;
          LODWORD(v128) = v4;
          v62 = v60;
          v63 = "%{public}s: symlink: %{darwin.errno}d";
LABEL_76:
          _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, v63, buf, 0x12u);
        }
      }
      else
      {
        v64 = open((const char *)v100, 0, 438);
        v97 = v64;
        if ((v64 & 0x80000000) == 0)
        {
          v65 = v64;
          if (lseek(v64, 0, 0) == -1)
            sub_10003EB5C(&v99, buf);
          v66 = *(NSObject **)(v2 + 72);
          bzero(buf, 0x400uLL);
          memset(&v99, 0, sizeof(v99));
          if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
          {
            if (fstat(v65, &v99) == -1)
            {
              v76 = *__error();
              if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
              {
                v77 = *__error();
                *(_DWORD *)v113 = 136315650;
                v114 = "fd_symlink";
                v115 = 1024;
                v116 = v65;
                v117 = 1024;
                LODWORD(v118) = v77;
                _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "%s fd[%d] : [invalid descriptor]: %{darwin.errno}d", v113, 0x18u);
              }
              *__error() = v76;
            }
            else
            {
              if (fcntl(v65, 50, buf))
              {
                v67 = __error();
                v68 = strerror(*v67);
                snprintf((char *)buf, 0x400uLL, "[%s]", v68);
              }
              v69 = ((unint64_t)v99.st_mode >> 12) ^ 8;
              v70 = "[unknown]";
              if ((_DWORD)v69 != 15)
                v70 = off_100055B40[v69];
              v71 = (void *)os_flagset_copy_string(&unk_100055740, v99.st_flags);
              v72 = *__error();
              if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)v113 = 136316418;
                v114 = "fd_symlink";
                v115 = 1024;
                v116 = v65;
                v117 = 2080;
                v118 = v70;
                v119 = 2048;
                v120 = v99.st_size;
                v121 = 2080;
                v122 = v71;
                v123 = 2080;
                v124 = buf;
                _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEBUG, "%s fd[%d]: type = %s, size = %lld, flags = %s, path = %s", v113, 0x3Au);
              }
              *__error() = v72;
              free(v71);
            }
          }
          *(_DWORD *)(v55 + 16) = claimfd_np(&v97, 0, 0);
          cryptex_core_set_asset(*(_QWORD *)(v2 + 104), &v98);
          v4 = 0;
          v55 = v98;
LABEL_57:
          cryptex_asset_destroy(v55);
          if (v97 != -1 && close(v97) == -1)
            sub_10003E474(&v99, buf);
          if (v4)
          {
            v87 = *(const char **)(v2 + 56);
            v88 = *__error();
            v89 = *(NSObject **)(v2 + 72);
            if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
            {
              v91 = "[anonymous]";
              if (v87)
                v91 = v87;
              v92 = *(_QWORD *)(v12 + 40);
              *(_DWORD *)buf = 136446722;
              v126 = v91;
              v127 = 2080;
              v128 = v92;
              v129 = 1024;
              v130 = v4;
              v81 = "%{public}s: symlink asset: %s: %{darwin.errno}d";
LABEL_112:
              v85 = v89;
              v86 = 28;
LABEL_113:
              _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_ERROR, v81, buf, v86);
            }
LABEL_114:
            v1 = v96;
            *__error() = v88;
            goto LABEL_115;
          }
          goto LABEL_68;
        }
        v4 = *__error();
        v73 = *(const char **)(v2 + 56);
        v59 = *__error();
        v74 = *(NSObject **)(v2 + 72);
        if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v75 = "[anonymous]";
          if (v73)
            v75 = v73;
          v126 = v75;
          v127 = 1024;
          LODWORD(v128) = v4;
          v62 = v74;
          v63 = "%{public}s: open: %{darwin.errno}d";
          goto LABEL_76;
        }
      }
      *__error() = v59;
      goto LABEL_57;
    }
    v29 = *(const char **)(v2 + 56);
    v30 = *__error();
    v31 = *(NSObject **)(v2 + 72);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      v32 = *(_QWORD *)(v12 + 40);
      v33 = "[anonymous]";
      if (v29)
        v33 = v29;
      *(_DWORD *)buf = 136446466;
      v126 = v33;
      v127 = 2080;
      v128 = v32;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "%{public}s: asset not present; skipping: %s",
        buf,
        0x16u);
    }
    *__error() = v30;
LABEL_69:
    v10 += 8;
  }
  while (v10 != 96);
  if (!v11)
  {
    v82 = *(const char **)(v2 + 56);
    v88 = *__error();
    v83 = *(NSObject **)(v2 + 72);
    v4 = 2;
    if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
    {
      v84 = "[anonymous]";
      if (v82)
        v84 = v82;
      *(_DWORD *)buf = 136446466;
      v126 = v84;
      v127 = 1024;
      LODWORD(v128) = 2;
      v81 = "%{public}s: empty core: %{darwin.errno}d";
      v85 = v83;
      v86 = 18;
      goto LABEL_113;
    }
    goto LABEL_114;
  }
  v1 = v96;
  if (!v4)
    goto LABEL_121;
LABEL_115:
  v93 = *(const char **)(v2 + 56);
  v6 = *__error();
  v7 = *(NSObject **)(v2 + 72);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v94 = "[anonymous]";
    if (v93)
      v94 = v93;
    *(_DWORD *)buf = 136446466;
    v126 = v94;
    v127 = 1024;
    LODWORD(v128) = v4;
    v9 = "%{public}s: copy assets failed: %{darwin.errno}d";
LABEL_119:
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, v9, buf, 0x12u);
  }
LABEL_120:
  *__error() = v6;
LABEL_121:
  *((_DWORD *)v1 + 2) = v4;
  return cryptex_target_async_f(v2, v1, sub_100010B50);
}

void sub_100010B50(void **a1)
{
  ((void (*)(void *, _QWORD, _QWORD, _QWORD, void *))a1[4])(*a1, *((unsigned int *)*a1 + 28), *((_QWORD *)*a1 + 13), *((unsigned int *)a1 + 2), a1[3]);
  sub_10003C998(a1);
}

uint64_t sub_100010B88(uint64_t result)
{
  switch(result)
  {
    case 0xE00002BD:
    case 0xE00002BE:
    case 0xE00002C8:
    case 0xE00002DE:
      result = 12;
      break;
    case 0xE00002BF:
      result = 72;
      break;
    case 0xE00002C0:
    case 0xE00002D7:
    case 0xE00002D9:
    case 0xE00002DA:
      result = 19;
      break;
    case 0xE00002C1:
      result = 1;
      break;
    case 0xE00002C2:
      result = 22;
      break;
    case 0xE00002C3:
    case 0xE00002C4:
    case 0xE00002C5:
    case 0xE00002CC:
      result = 35;
      break;
    case 0xE00002C6:
      result = 94;
      break;
    case 0xE00002C7:
      result = 45;
      break;
    case 0xE00002C9:
    case 0xE00002CA:
    case 0xE00002D3:
    case 0xE00002D4:
      result = 5;
      break;
    case 0xE00002CB:
    case 0xE00002DC:
    case 0xE00002DF:
    case 0xE00002E0:
    case 0xE00002E3:
    case 0xE00002E4:
    case 0xE00002E5:
    case 0xE00002E6:
    case 0xE00002E7:
    case 0xE00002E8:
    case 0xE00002EA:
      goto LABEL_10;
    case 0xE00002CD:
      result = 9;
      break;
    case 0xE00002CE:
    case 0xE00002CF:
    case 0xE00002E2:
      result = 13;
      break;
    case 0xE00002D0:
      result = 14;
      break;
    case 0xE00002D1:
    case 0xE00002E9:
      result = 83;
      break;
    case 0xE00002D2:
    case 0xE00002D5:
      result = 16;
      break;
    case 0xE00002D6:
      result = 60;
      break;
    case 0xE00002D8:
      result = 6;
      break;
    case 0xE00002DB:
      result = 28;
      break;
    case 0xE00002DD:
      result = 17;
      break;
    case 0xE00002E1:
      result = 7;
      break;
    case 0xE00002EB:
      result = 89;
      break;
    default:
      if ((_DWORD)result)
LABEL_10:
        result = 104;
      break;
  }
  return result;
}

uint64_t sub_100010C60(io_object_t *a1, const char *a2)
{
  uint64_t v2;
  io_object_t v6;
  io_object_t v7;
  io_iterator_t iterator;

  iterator = 0;
  v2 = 2;
  if (a1 && a2)
  {
    if (!IORegistryEntryGetChildIterator(*a1, "IOService", &iterator))
    {
      v6 = IOIteratorNext(iterator);
      if (v6)
      {
        v7 = v6;
        while (!IOObjectConformsTo(v7, a2))
        {
          IOObjectRelease(v7);
          v7 = IOIteratorNext(iterator);
          if (!v7)
          {
            v2 = 2;
            goto LABEL_4;
          }
        }
        IOObjectRelease(*a1);
        v2 = 0;
        *a1 = v7;
      }
    }
LABEL_4:
    if (iterator)
      IOObjectRelease(iterator);
  }
  return v2;
}

uint64_t (*sub_100010D1C())(void *a1)
{
  return sub_10000DA48;
}

xpc_type_t sub_100010D28(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  xpc_object_t v5;
  xpc_type_t result;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint8_t v11[16];
  uint8_t buf[8];
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void *v15;
  xpc_object_t v16;
  xpc_object_t v17;

  if (!*(_QWORD *)(a2 + 24))
  {
    *(_QWORD *)buf = 0;
    v17 = 0;
    v8 = session_activate_unpack(a2, &v17);
    if ((_DWORD)v8)
    {
      v7 = v8;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "failed to unpack", v11, 2u);
      }
      sub_10003A174(a2, a3, v7);
      return (xpc_type_t)v7;
    }
    v5 = v17;
    v9 = (void *)cryptex_session_core_create_from_xpc(v17);
    v7 = sub_10000DA48(v9);
    if ((_DWORD)v7)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "failed to add session core to session list", v11, 2u);
      }
      v10 = 0;
    }
    else
    {
      v10 = (void *)cryptex_session_core_copy_xpc_object(v9);
      result = xpc_get_type(v10);
      if (result != (xpc_type_t)&_xpc_type_dictionary)
        goto LABEL_25;
      *(_QWORD *)buf = v10;
      session_activate_reply_pack(buf, a3);
    }
    sub_10003A174(a2, a3, v7);
    if (v9)
      os_release(v9);
    if (v10)
      os_release(v10);
    goto LABEL_12;
  }
  v5 = xpc_array_create(0, 0);
  result = xpc_get_type(v5);
  if (result == (xpc_type_t)&_xpc_type_array)
  {
    v17 = v5;
    v7 = session_list_unpack(a2, v11);
    if ((_DWORD)v7)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "failed to unpack", buf, 2u);
      }
    }
    else
    {
      *(_QWORD *)buf = _NSConcreteStackBlock;
      v13 = 0x40000000;
      v14 = sub_100010F80;
      v15 = &unk_100055BE8;
      v16 = v5;
      sub_10000D694(buf);
      session_list_reply_pack(&v17, a3);
    }
    sub_10003A174(a2, a3, v7);
LABEL_12:
    if (v5)
      os_release(v5);
    return (xpc_type_t)v7;
  }
LABEL_25:
  __break(1u);
  return result;
}

void sub_100010F80(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;

  v4 = (void *)cryptex_session_core_copy_xpc_object(a2);
  xpc_array_append_value(*(xpc_object_t *)(a1 + 32), v4);
  xpc_release(v4);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a2 + 96);
    v6 = 136315138;
    v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "callback %s", (uint8_t *)&v6, 0xCu);
  }
}

void sub_10001104C(void *a1)
{
  id v1;
  uint64_t uint64;
  id v3;
  void *v4;
  xpc_object_t xdict;

  v1 = a1;
  xdict = xpc_dictionary_create_reply(v1);
  uint64 = xpc_dictionary_get_uint64(v1, "user");

  v3 = sub_10001F1DC(uint64);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (v4)
    xpc_dictionary_set_value(xdict, "endpoint", v4);
  xpc_dictionary_send_reply(xdict);

}

uint64_t sub_100011154(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = objc_opt_class(OS_codex);
  result = _os_object_alloc(v2, a1);
  if (!result)
    sub_10003EBCC();
  return result;
}

uint64_t sub_100011210(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = objc_opt_class(OS_daemon);
  result = _os_object_alloc(v2, a1);
  if (!result)
    sub_10003EC48();
  return result;
}

uint64_t sub_1000112CC(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = objc_opt_class(OS_proc);
  result = _os_object_alloc(v2, a1);
  if (!result)
    sub_10003ECC4();
  return result;
}

uint64_t sub_100011388(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = objc_opt_class(OS_protex);
  result = _os_object_alloc(v2, a1);
  if (!result)
    sub_10003ED40();
  return result;
}

uint64_t sub_100011444(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = objc_opt_class(OS_quire);
  result = _os_object_alloc(v2, a1);
  if (!result)
    sub_10003EDBC();
  return result;
}

uint64_t sub_100011500(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = objc_opt_class(OS_resource);
  result = _os_object_alloc(v2, a1);
  if (!result)
    sub_10003EE38();
  return result;
}

uint64_t sub_1000115BC(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = objc_opt_class(OS_view);
  result = _os_object_alloc(v2, a1);
  if (!result)
    sub_10003EEB4();
  return result;
}

uint64_t sub_100011664(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  return _os_log_send_and_compose_impl(v8, v5, v6, 80, a5, v7, 16);
}

double sub_100011680(_QWORD *a1, _OWORD *a2)
{
  double result;

  *a1 = 0;
  result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

void sub_1000116B8(uint64_t a1)
{
  void *v2;

  free(*(void **)(a1 + 64));
  free(*(void **)(a1 + 72));
  v2 = *(void **)(a1 + 272);
  if (v2)
    os_release(v2);
  sub_10003AA48(a1 + 16);
}

uint64_t sub_1000116F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;

  v4 = sub_1000112CC(312);
  *(_QWORD *)(v4 + 40) = a2;
  v5 = *(_OWORD *)(a1 + 344);
  *(_OWORD *)(v4 + 280) = *(_OWORD *)(a1 + 328);
  *(_OWORD *)(v4 + 296) = v5;
  sub_10003A760(v4 + 16, (int)"com.apple.security.cryptexd", "proc");
  return v4;
}

uint64_t sub_100011758(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  int v9;
  NSObject *v10;
  const char *v11;
  int v12;
  kern_return_t v13;
  unsigned int v14;
  const char *v15;
  int v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  const char *v20;
  unsigned int v21;
  const char *v22;
  int v23;
  NSObject *v24;
  unsigned int v25;
  const char *v26;
  int v27;
  const char *v28;
  int v29;
  NSObject *v30;
  const char *v31;
  int *v32;
  int v33;
  const char *v34;
  int v35;
  NSObject *v36;
  const char *v37;
  BOOL v38;
  kern_return_t v39;
  unsigned int v40;
  const char *v41;
  NSObject *v42;
  const char *v43;
  int v44;
  const char *v45;
  int v46;
  NSObject *v47;
  const char *v48;
  int v49;
  int *v50;
  char *v51;
  char *v52;
  const char *v53;
  int v54;
  NSObject *v55;
  const char *v56;
  const char *v57;
  int v58;
  NSObject *v59;
  const char *v60;
  const char *v62;
  int v63;
  const char *v64;
  NSObject *v65;
  const char *v66;
  _BOOL4 v67;
  char *v68;
  int v69;
  const char *v70;
  void *v71;
  void *v72;
  const char *v73;
  int v74;
  NSObject *v75;
  const char *v76;
  char *v77;
  const char *v78;
  int v79;
  NSObject *v80;
  const char *v81;
  const char *v82;
  char *v83;
  int *v84;
  mach_msg_type_number_t task_info_outCnt;
  audit_token_t task_info_out;
  mach_port_name_t tn;
  void *v88;
  void *v89;
  audit_token_t buf;
  _OWORD buffer[3];
  char v92[152];
  char __str[608];

  v88 = 0;
  v89 = 0;
  bzero(__str, 0x260uLL);
  v2 = proc_pidinfo(*(_DWORD *)(a1 + 300), 18, 0, (void *)(a1 + 80), 192);
  if (v2 != 192)
  {
    v44 = v2;
    v4 = *__error();
    v45 = *(const char **)(a1 + 16);
    v46 = *__error();
    v47 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      v48 = "[anonymous]";
      v49 = *(_DWORD *)(a1 + 300);
      if (v45)
        v48 = v45;
      LODWORD(buffer[0]) = 136446978;
      *(_QWORD *)((char *)buffer + 4) = v48;
      WORD6(buffer[0]) = 1024;
      *(_DWORD *)((char *)buffer + 14) = v49;
      WORD1(buffer[1]) = 1024;
      DWORD1(buffer[1]) = v44;
      WORD4(buffer[1]) = 1024;
      *(_DWORD *)((char *)&buffer[1] + 10) = v4;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%{public}s: proc_pidinfo[%d]: ret = %d: %{darwin.errno}d", (uint8_t *)buffer, 0x1Eu);
    }
    v50 = __error();
    v51 = 0;
    goto LABEL_52;
  }
  v84 = (int *)(a1 + 280);
  __strlcpy_chk(a1 + 48, a1 + 128, 16, 16);
  v3 = 38;
  snprintf(__str, 0x26uLL, "%s.%d@%d", (const char *)(a1 + 48), *(_DWORD *)(a1 + 300), *(_DWORD *)(a1 + 308));
  sub_10003A790(a1 + 16, __str);
  v4 = 0xFFFFFFFFLL;
  v5 = *(_DWORD *)(a1 + 96);
  v6 = 1;
  while (1)
  {
    v7 = v3;
    tn = 0;
    memset(v92, 0, 144);
    memset(buffer, 0, sizeof(buffer));
    memset(&task_info_out, 0, sizeof(task_info_out));
    task_info_outCnt = 8;
    v8 = *(const char **)(a1 + 16);
    v9 = *__error();
    v10 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      buf.val[0] = 136446722;
      v11 = "[anonymous]";
      if (v8)
        v11 = v8;
      *(_QWORD *)&buf.val[1] = v11;
      LOWORD(buf.val[3]) = 2048;
      *(_QWORD *)((char *)&buf.val[3] + 2) = v6;
      HIWORD(buf.val[5]) = 1024;
      buf.val[6] = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%{public}s: examining ancestor[%lu]: %d", (uint8_t *)&buf, 0x1Cu);
    }
    *__error() = v9;
    v12 = proc_pidinfo(v5, 18, 0, buffer, 192);
    if (v12 == 192)
    {
      if (v5)
      {
        v13 = task_name_for_pid(mach_task_self_, v5, &tn);
        if (v13)
        {
          v14 = v13;
          v15 = *(const char **)(a1 + 16);
          v16 = *__error();
          v17 = *(NSObject **)(a1 + 32);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            buf.val[0] = 136446722;
            v18 = "[anonymous]";
            if (v15)
              v18 = v15;
            *(_QWORD *)&buf.val[1] = v18;
            LOWORD(buf.val[3]) = 1024;
            *(unsigned int *)((char *)&buf.val[3] + 2) = v14;
            HIWORD(buf.val[4]) = 1024;
            buf.val[5] = 3;
            v19 = v17;
            v20 = "%{public}s: task_name_for_pid: %#x: %{darwin.errno}d";
LABEL_39:
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&buf, 0x18u);
            goto LABEL_40;
          }
          goto LABEL_40;
        }
        v39 = task_info(tn, 0xFu, (task_info_t)&task_info_out, &task_info_outCnt);
        if (v39)
        {
          v40 = v39;
          v41 = *(const char **)(a1 + 16);
          v16 = *__error();
          v42 = *(NSObject **)(a1 + 32);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            buf.val[0] = 136446722;
            v43 = "[anonymous]";
            if (v41)
              v43 = v41;
            *(_QWORD *)&buf.val[1] = v43;
            LOWORD(buf.val[3]) = 1024;
            *(unsigned int *)((char *)&buf.val[3] + 2) = v40;
            HIWORD(buf.val[4]) = 1024;
            buf.val[5] = 3;
            v19 = v42;
            v20 = "%{public}s: task_info: %#x: %{darwin.errno}d";
            goto LABEL_39;
          }
LABEL_40:
          *__error() = v16;
          v4 = 3;
          v27 = 11;
          goto LABEL_41;
        }
        buf = task_info_out;
        v33 = audit_token_to_pidversion(&buf);
      }
      else
      {
        v28 = *(const char **)(a1 + 16);
        v29 = *__error();
        v30 = *(NSObject **)(a1 + 32);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          v31 = "[anonymous]";
          if (v28)
            v31 = v28;
          buf.val[0] = 136446210;
          *(_QWORD *)&buf.val[1] = v31;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "%{public}s: hit kernel_task; assuming ppid version of 0",
            (uint8_t *)&buf,
            0xCu);
        }
        v32 = __error();
        v33 = 0;
        *v32 = v29;
      }
      snprintf(&__str[v7], 0x26uLL, "%s.%d.%d", v92, v5, v33);
      v34 = *(const char **)(a1 + 16);
      v35 = *__error();
      v36 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        buf.val[0] = 136446722;
        v37 = "[anonymous]";
        if (v34)
          v37 = v34;
        *(_QWORD *)&buf.val[1] = v37;
        LOWORD(buf.val[3]) = 2048;
        *(_QWORD *)((char *)&buf.val[3] + 2) = v6;
        HIWORD(buf.val[5]) = 2080;
        *(_QWORD *)&buf.val[6] = &__str[v7];
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "%{public}s: setting ancestor[%lu]: %s", (uint8_t *)&buf, 0x20u);
      }
      *__error() = v35;
      v38 = v5 == 0;
      v5 = v5 ? LODWORD(buffer[1]) : 0;
      v27 = v38 ? 11 : 0;
    }
    else
    {
      v21 = v12;
      v4 = *__error();
      v22 = *(const char **)(a1 + 16);
      v23 = *__error();
      v24 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = *(_DWORD *)(a1 + 300);
        v26 = "[anonymous]";
        if (v22)
          v26 = v22;
        buf.val[0] = 136446978;
        *(_QWORD *)&buf.val[1] = v26;
        LOWORD(buf.val[3]) = 1024;
        *(unsigned int *)((char *)&buf.val[3] + 2) = v25;
        HIWORD(buf.val[4]) = 1024;
        buf.val[5] = v21;
        LOWORD(buf.val[6]) = 1024;
        *(unsigned int *)((char *)&buf.val[6] + 2) = v4;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%{public}s: proc_pidinfo[%d]: ret = %d: %{darwin.errno}d", (uint8_t *)&buf, 0x1Eu);
      }
      *__error() = v23;
      v27 = 6;
    }
LABEL_41:
    if (tn - 1 <= 0xFFFFFFFD)
      mach_right_send_release(tn);
    if (v27)
      break;
    ++v6;
    v3 = v7 + 38;
    if (v7 == 570)
      goto LABEL_54;
  }
  if (v27 != 11)
  {
    v51 = 0;
    goto LABEL_68;
  }
LABEL_54:
  v52 = (char *)malloc_type_calloc(1uLL, 0x100uLL, 0x61D5536CuLL);
  if (!v52)
    sub_10003EF30(&task_info_out, buffer);
  v51 = v52;
  do
  {
    snprintf(v51, 0x100uLL, "%s->%s", v51, &__str[v7]);
    v7 -= 38;
  }
  while (v7);
  v53 = *(const char **)(a1 + 16);
  v54 = *__error();
  v55 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
  {
    v56 = "[anonymous]";
    if (v53)
      v56 = v53;
    LODWORD(buffer[0]) = 136446466;
    *(_QWORD *)((char *)buffer + 4) = v56;
    WORD6(buffer[0]) = 2080;
    *(_QWORD *)((char *)buffer + 14) = v51;
    _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEBUG, "%{public}s: ancestry = %s", (uint8_t *)buffer, 0x16u);
  }
  *__error() = v54;
  v4 = sub_100012210(v84, 11, (int8x8_t **)&v89);
  v57 = *(const char **)(a1 + 16);
  v58 = *__error();
  v59 = *(NSObject **)(a1 + 32);
  if ((_DWORD)v4)
  {
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      v60 = "[anonymous]";
      if (v57)
        v60 = v57;
      LODWORD(buffer[0]) = 136446466;
      *(_QWORD *)((char *)buffer + 4) = v60;
      WORD6(buffer[0]) = 1024;
      *(_DWORD *)((char *)buffer + 14) = v4;
      _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "%{public}s: copy csblob [csid]: %{darwin.errno}d", (uint8_t *)buffer, 0x12u);
    }
    *__error() = v58;
    goto LABEL_68;
  }
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
  {
    v62 = "[anonymous]";
    if (v57)
      v62 = v57;
    v63 = *((_DWORD *)v89 + 1) - 8;
    LODWORD(buffer[0]) = 136446722;
    *(_QWORD *)((char *)buffer + 4) = v62;
    WORD6(buffer[0]) = 1040;
    *(_DWORD *)((char *)buffer + 14) = v63;
    WORD1(buffer[1]) = 2096;
    *(_QWORD *)((char *)&buffer[1] + 4) = (char *)v89 + 8;
    _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEBUG, "%{public}s: identity blob = %.*P", (uint8_t *)buffer, 0x1Cu);
  }
  *__error() = v58;
  v4 = sub_100012210(v84, 7, (int8x8_t **)&v88);
  v64 = *(const char **)(a1 + 16);
  v46 = *__error();
  v65 = *(NSObject **)(a1 + 32);
  if ((_DWORD)v4)
  {
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      v66 = "[anonymous]";
      if (v64)
        v66 = v64;
      LODWORD(buffer[0]) = 136446466;
      *(_QWORD *)((char *)buffer + 4) = v66;
      WORD6(buffer[0]) = 1024;
      *(_DWORD *)((char *)buffer + 14) = v4;
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "%{public}s: copy csblob [entitlements]: %{darwin.errno}d", (uint8_t *)buffer, 0x12u);
    }
    v50 = __error();
LABEL_52:
    *v50 = v46;
    goto LABEL_68;
  }
  v67 = os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG);
  v68 = (char *)v88;
  if (v67)
  {
    v69 = *((_DWORD *)v88 + 1);
    v70 = "[anonymous]";
    if (v64)
      v70 = v64;
    LODWORD(buffer[0]) = 136446722;
    *(_QWORD *)((char *)buffer + 4) = v70;
    WORD6(buffer[0]) = 1040;
    *(_DWORD *)((char *)buffer + 14) = v69 - 8;
    WORD1(buffer[1]) = 2096;
    *(_QWORD *)((char *)&buffer[1] + 4) = (char *)v88 + 8;
    _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEBUG, "%{public}s: entitlements blob = %.*P", (uint8_t *)buffer, 0x1Cu);
  }
  *__error() = v46;
  v71 = (void *)xpc_create_from_plist(v68 + 8);
  v72 = v71;
  if (!v71 || xpc_get_type(v71) != (xpc_type_t)&_xpc_type_dictionary)
  {
    v73 = *(const char **)(a1 + 16);
    v74 = *__error();
    v75 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
    {
      v76 = "[anonymous]";
      if (v73)
        v76 = v73;
      LODWORD(buffer[0]) = 136446466;
      *(_QWORD *)((char *)buffer + 4) = v76;
      WORD6(buffer[0]) = 1024;
      *(_DWORD *)((char *)buffer + 14) = 90;
      _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_ERROR, "%{public}s: entitlements not a dictionary: %{darwin.errno}d", (uint8_t *)buffer, 0x12u);
    }
    *__error() = v74;
    v4 = 90;
    if (!v72)
      goto LABEL_68;
LABEL_102:
    os_release(v72);
    goto LABEL_68;
  }
  if (os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_DEBUG))
  {
    v77 = xpc_copy_description(v72);
    v78 = *(const char **)(a1 + 16);
    v79 = *__error();
    v80 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
    {
      v81 = "[anonymous]";
      if (v78)
        v81 = v78;
      LODWORD(buffer[0]) = 136446466;
      *(_QWORD *)((char *)buffer + 4) = v81;
      WORD6(buffer[0]) = 2080;
      *(_QWORD *)((char *)buffer + 14) = v77;
      _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEBUG, "%{public}s: entitlements = %s", (uint8_t *)buffer, 0x16u);
    }
    *__error() = v79;
    free(v77);
  }
  *(_QWORD *)(a1 + 64) = v51;
  v82 = (char *)v89 + 8;
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      v83 = strdup(v82);
      if (v83)
        break;
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    v83 = strdup(v82);
    if (!v83)
      sub_10003EFD4(v82, &task_info_out, buffer);
  }
  *(_QWORD *)(a1 + 72) = v83;
  v51 = 0;
  v4 = 0;
  *(_QWORD *)(a1 + 272) = os_retain(v72);
  if (v72)
    goto LABEL_102;
LABEL_68:
  free(v51);
  free(v88);
  free(v89);
  return v4;
}

uint64_t sub_100012210(int *a1, uint64_t a2, int8x8_t **a3)
{
  __int128 v6;
  int8x8_t *v7;
  int8x8_t *v8;
  int v9;
  size_t v10;
  int8x8_t *v11;
  int *v12;
  uint64_t v13;
  int v15;
  __int128 v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  _OWORD v20[5];

  *(_QWORD *)&v6 = *(_QWORD *)(a1 + 1);
  DWORD2(v6) = v6;
  HIDWORD(v6) = a1[4];
  v15 = *a1;
  v16 = v6;
  v17 = *(_QWORD *)(a1 + 5);
  v18 = a1[7];
  v7 = (int8x8_t *)malloc_type_malloc(0x408uLL, 0x18EC0261uLL);
  if (!v7)
    sub_10003F098(&v19, v20);
  v8 = v7;
  if ((csops_audittoken(a1[5], a2, v7, 1032, &v15) & 0x80000000) == 0)
    *__error() = 0;
  v9 = *__error();
  if (v9)
  {
    if (v9 != 34)
      goto LABEL_8;
    v10 = bswap32(v8->u32[1]);
    v11 = (int8x8_t *)malloc_type_realloc(v8, v10, 0x387A0C8uLL);
    if (!v11)
    {
      v12 = __error();
      goto LABEL_11;
    }
    v8 = v11;
    if (csops_audittoken(a1[5], a2, v11, v10, &v15))
    {
LABEL_8:
      v12 = __error();
      v8 = 0;
LABEL_11:
      v13 = *v12;
      goto LABEL_12;
    }
  }
  v13 = 0;
  *v8 = vrev32_s8(*v8);
  *a3 = v8;
  v8 = 0;
LABEL_12:
  free(v8);
  return v13;
}

BOOL sub_100012380(uint64_t a1, const char *a2)
{
  return a2 && !xpc_dictionary_get_BOOL(*(xpc_object_t *)(a1 + 272), a2);
}

uint64_t sub_1000123A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  return _os_log_send_and_compose_impl(v8, v5, v6, 80, a5, v7, 16);
}

uint64_t sub_1000123E8(void *object, uint64_t a2, _BYTE *a3)
{
  uint64_t v6;
  uint64_t v7;
  dispatch_queue_t *v8;
  uint64_t v9;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;

  v12 = 0;
  v13 = 0;
  v6 = *(_QWORD *)(a2 + 24);
  if (v6 == 2)
  {
    v8 = (dispatch_queue_t *)sub_100014FE0();
    v9 = daemon_open_mountable_unpack(a2, &v13);
    if ((_DWORD)v9)
    {
      v7 = v9;
      if (!v8)
        goto LABEL_11;
    }
    else
    {
      v11 = sub_10002A74C(object, (_BYTE *)a2, a3);
      dispatch_async_f(v8[12], v11, (dispatch_function_t)sub_1000124EC);
      v7 = 36;
    }
    os_release(v8);
    if (!object)
      return v7;
    goto LABEL_12;
  }
  if (v6 == 1)
  {
    v7 = 78;
    if (!object)
      return v7;
    goto LABEL_12;
  }
  v7 = daemon_version_unpack(a2, &v13);
  if (!(_DWORD)v7)
  {
    v12 = *((_QWORD *)object + 7);
    daemon_version_reply_pack(&v12, a3);
  }
  sub_10003A174(a2, a3, v7);
LABEL_11:
  if (object)
LABEL_12:
    os_release(object);
  return v7;
}

void sub_1000124EC(_QWORD *a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  int v5;
  int v6;
  const char *v7;
  int v8;
  NSObject *v9;
  const char *v10;
  _BOOL4 v11;
  const char *v12;
  int v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  _QWORD *v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  int v30;
  char __str[16];
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
  _BYTE v45[31];

  v20 = a1;
  v2 = *a1;
  v3 = sub_100014FE0();
  v44 = 0u;
  memset(v45, 0, sizeof(v45));
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
  *(_OWORD *)__str = 0u;
  v18 = 0;
  v19 = -1;
  v4 = sub_1000116F4(a1[3], 0);
  v5 = sub_100011758(v4);
  if (v5)
  {
    v6 = v5;
    v7 = (const char *)v3[7];
    v8 = *__error();
    v9 = v3[9];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = "[anonymous]";
      if (v7)
        v10 = v7;
      *(_DWORD *)buf = 136446466;
      v22 = v10;
      v23 = 1024;
      LODWORD(v24) = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s: failed to resolve proc: %{darwin.errno}d", buf, 0x12u);
    }
    *__error() = v8;
  }
  else
  {
    v11 = sub_100012380(v4, "com.apple.private.security.cryptex.open-mountable");
    if (v11)
    {
      v6 = v11;
      v12 = *(const char **)(v2 + 16);
      v13 = *__error();
      v14 = *(NSObject **)(v2 + 32);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = "[anonymous]";
        if (v12)
          v15 = v12;
        v16 = *(_QWORD *)(v4 + 64);
        v17 = *(_QWORD *)(v4 + 72);
        *(_DWORD *)buf = 136447234;
        v22 = v15;
        v23 = 2080;
        v24 = "com.apple.private.security.cryptex.install";
        v25 = 2080;
        v26 = v16;
        v27 = 2080;
        v28 = v17;
        v29 = 1024;
        v30 = v6;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}s: proc not entitled for to open mountable: entitlement = %s, proc = %s, signing id = %s: %{darwin.errno}d", buf, 0x30u);
      }
      *__error() = v13;
    }
    else
    {
      snprintf(__str, 0xFFuLL, "%s.XXXXXX", (const char *)(v4 + 48));
      v6 = sub_100015678((uint64_t)v3, (uint64_t)&unk_100055D88, __str, &v19);
      if (!v6)
      {
        v18 = v19;
        daemon_open_mountable_reply_pack(&v18, a1[4]);
      }
    }
  }
  sub_10002A79C((uint64_t *)&v20, v6);
  if (v4)
    os_release((void *)v4);
  if (v3)
    os_release(v3);
}

CFErrorRef sub_100012760(_QWORD *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char *v15;
  CFErrorRef v16;
  char *v17;
  char *v18;
  int v20;
  NSObject *v21;
  const char *v22;
  unint64_t v23;
  char *v24;
  uint64_t v25;
  int v26;
  xpc_object_t v27;
  const char *string;
  const char *v29;
  const char *v30;
  const char *v31;
  xpc_object_t dictionary;
  xpc_object_t empty;
  xpc_object_t v34;
  xpc_object_t v35;
  xpc_object_t v36;
  const char *v37;
  xpc_object_t v38;
  xpc_object_t v39;
  NSObject *v40;
  uint64_t v41;
  NSObject *v42;
  int v43;
  NSObject *v44;
  const char *v45;
  NSObject *v46;
  uint64_t v47;
  NSObject *v48;
  xpc_object_t array;
  void *v50;
  const char *v51;
  char *v52;
  char *v53;
  char *v54;
  void *v55;
  xpc_object_t v56;
  char *v57;
  char *v58;
  int v59;
  NSObject *v60;
  int v61;
  NSObject *v62;
  int v63;
  NSObject *v64;
  int v65;
  NSObject *v66;
  const char *v67;
  CFErrorRef v68;
  CFErrorRef v69;
  NSObject *v70;
  uint64_t v71;
  NSObject *v72;
  char *v73;
  int v74;
  char v75;
  __int128 xdict;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint64_t v81;
  uint8_t v82[16];
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint64_t v86;
  char __str[1024];
  _BYTE buf[12];
  __int16 v89;
  int v90;

  *((_QWORD *)&v78 + 1) = 0;
  v79 = 0uLL;
  if (a1[1] > 0x1000uLL)
  {
    v5 = (void *)a2[13];
    if (v5)
    {
      if (os_log_type_enabled((os_log_t)a2[13], OS_LOG_TYPE_ERROR))
        v6 = 3;
      else
        v6 = 2;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = 84;
      v7 = v5;
    }
    else
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = 84;
      v7 = &_os_log_default;
      v6 = 2;
    }
    v15 = (char *)_os_log_send_and_compose_impl(v6, 0, 0, 0, &_mh_execute_header, v7, 16);
    v16 = sub_10000A6F8("sm_bootstrap_service", "sm.c", 244, "com.apple.security.cryptex.posix", 84, 0, v15);
    free(v15);
    v17 = 0;
    v11 = 0;
    goto LABEL_18;
  }
  v10 = (void *)xpc_create_from_plist(*a1);
  v11 = v10;
  if (!v10 || xpc_get_type(v10) != (xpc_type_t)&_xpc_type_dictionary)
  {
    v12 = (void *)a2[13];
    if (v12)
    {
      if (os_log_type_enabled((os_log_t)a2[13], OS_LOG_TYPE_ERROR))
        v13 = 3;
      else
        v13 = 2;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = 22;
      v14 = v12;
    }
    else
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = 22;
      v14 = &_os_log_default;
      v13 = 2;
    }
    v18 = (char *)_os_log_send_and_compose_impl(v13, 0, 0, 0, &_mh_execute_header, v14, 16);
    v16 = sub_10000A6F8("sm_bootstrap_service", "sm.c", 251, "com.apple.security.cryptex.posix", 22, 0, v18);
    free(v18);
    v17 = 0;
    goto LABEL_18;
  }
  v20 = *__error();
  v21 = a2[13];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v11;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "frobbing plist: %@", buf, 0xCu);
  }
  *__error() = v20;
  v22 = (const char *)a2[1];
  v77 = *a2;
  v75 = v77;
  v23 = a2[11];
  *(_QWORD *)&v78 = v22;
  *(_QWORD *)&v79 = v23;
  v74 = *((_DWORD *)a2 + 24);
  DWORD2(v79) = v74;
  *(_QWORD *)&xdict = a2[14];
  *((_QWORD *)&xdict + 1) = a2[13];
  v80 = xdict;
  v81 = a3;
  v24 = (char *)malloc_type_malloc(0x400uLL, 0x18EC0261uLL);
  if (!v24)
    sub_10003F13C(__str, buf);
  v17 = v24;
  snprintf(v24, 0x400uLL, "%s", v22);
  if (*((int *)a2 + 20) >= 1)
  {
    v25 = 0;
    while (1)
    {
      *(_QWORD *)buf = 0;
      v26 = asprintf((char **)buf, ":%s", (const char *)a2[v25 + 2]);
      if ((int)(v26 + strlen(v17)) >= 1024)
        break;
      __strlcat_chk(v17, *(_QWORD *)buf, 1024, 1024);
      free(*(void **)buf);
      if (++v25 >= *((int *)a2 + 20))
        goto LABEL_29;
    }
    v40 = a2[13];
    if (v40)
    {
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        v41 = 3;
      else
        v41 = 2;
      *(_DWORD *)__str = 67109120;
      *(_DWORD *)&__str[4] = 22;
      v42 = v40;
    }
    else
    {
      *(_DWORD *)__str = 67109120;
      *(_DWORD *)&__str[4] = 22;
      v42 = &_os_log_default;
      v41 = 2;
    }
    v54 = (char *)_os_log_send_and_compose_impl(v41, 0, 0, 0, &_mh_execute_header, v42, 16);
    v16 = sub_10000A6F8("sm_bootstrap_service", "sm.c", 275, "com.apple.security.cryptex.posix", 22, 0, v54);
    free(v54);
    v53 = *(char **)buf;
    goto LABEL_69;
  }
LABEL_29:
  *((_QWORD *)&v78 + 1) = v17;
  v27 = xpc_copy(v11);
  bzero(buf, 0x400uLL);
  bzero(__str, 0x400uLL);
  string = xpc_dictionary_get_string(v27, "Label");
  if (!string)
  {
    v43 = *__error();
    v44 = *((_QWORD *)&xdict + 1);
    if (!os_log_type_enabled(*((os_log_t *)&xdict + 1), OS_LOG_TYPE_ERROR))
    {
LABEL_53:
      *__error() = v43;
      if (v27)
        os_release(v27);
      v46 = a2[13];
      if (v46)
      {
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          v47 = 3;
        else
          v47 = 2;
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v11;
        v89 = 1024;
        v90 = 22;
        v48 = v46;
      }
      else
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v11;
        v89 = 1024;
        v90 = 22;
        v48 = &_os_log_default;
        v47 = 2;
      }
      v52 = (char *)_os_log_send_and_compose_impl(v47, 0, 0, 0, &_mh_execute_header, v48, 16);
      v16 = sub_10000A6F8("sm_bootstrap_service", "sm.c", 286, "com.apple.security.cryptex.posix", 22, 0, v52);
      v53 = v52;
LABEL_69:
      free(v53);
LABEL_18:
      free(v17);
      goto LABEL_19;
    }
    *(_WORD *)v82 = 0;
    v45 = "missing label";
LABEL_52:
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, v45, v82, 2u);
    goto LABEL_53;
  }
  v29 = string;
  sub_1000135E0((uint64_t)&v77, (uint64_t)"Label", string, buf);
  xpc_dictionary_set_string(v27, "Label", buf);
  __strlcpy_chk(a3, buf, 128, 128);
  v30 = xpc_dictionary_get_string(v27, "Program");
  if (v30)
  {
    *((_QWORD *)&xdict + 1) = v29;
    v31 = buf;
    sub_1000136F8((uint64_t)&v77, (uint64_t)"Program", v30, buf);
    xpc_dictionary_set_string(v27, "Program", buf);
    goto LABEL_32;
  }
  array = xpc_dictionary_get_array(v27, "ProgramArguments");
  if (!array)
  {
    v43 = *__error();
    v44 = *((_QWORD *)&xdict + 1);
    if (!os_log_type_enabled(*((os_log_t *)&xdict + 1), OS_LOG_TYPE_ERROR))
      goto LABEL_53;
    *(_WORD *)v82 = 0;
    v45 = "missing argv";
    goto LABEL_52;
  }
  v50 = array;
  if (!xpc_array_get_count(array))
  {
    v43 = *__error();
    v44 = *((_QWORD *)&xdict + 1);
    if (!os_log_type_enabled(*((os_log_t *)&xdict + 1), OS_LOG_TYPE_ERROR))
      goto LABEL_53;
    *(_WORD *)v82 = 0;
    v45 = "empty argv";
    goto LABEL_52;
  }
  v51 = xpc_array_get_string(v50, 0);
  if (!v51)
  {
    v43 = *__error();
    v44 = *((_QWORD *)&xdict + 1);
    if (!os_log_type_enabled(*((os_log_t *)&xdict + 1), OS_LOG_TYPE_ERROR))
      goto LABEL_53;
    *(_WORD *)v82 = 0;
    v45 = "bad argv0";
    goto LABEL_52;
  }
  v31 = v51;
  *((_QWORD *)&xdict + 1) = v29;
  if (*v51 == 47)
  {
    sub_1000136F8((uint64_t)&v77, (uint64_t)"ProgramArguments", v51, buf);
    xpc_array_set_string(v50, 0, buf);
    v31 = buf;
  }
LABEL_32:
  __strlcpy_chk(a3 + 128, v31, 1024, 1024);
  dictionary = xpc_dictionary_get_dictionary(v27, "EnvironmentVariables");
  if (!dictionary)
  {
    empty = xpc_dictionary_create_empty();
    xpc_dictionary_set_value(v27, "EnvironmentVariables", empty);
    dictionary = xpc_dictionary_get_dictionary(v27, "EnvironmentVariables");
    if (empty)
      os_release(empty);
  }
  xpc_dictionary_set_string(dictionary, "CRYPTEX_MOUNT_PATH", v22);
  v34 = xpc_dictionary_get_dictionary(v27, "MachServices");
  if (v34)
  {
    v35 = v34;
    v84 = v79;
    v85 = v80;
    v86 = v81;
    *(_OWORD *)v82 = v77;
    v83 = v78;
    v36 = xpc_copy(v34);
    *(_QWORD *)&v82[8] = v36;
    xpc_dictionary_apply_f(v35, v82, sub_100013900);
    xpc_dictionary_set_value(v27, "MachServices", v36);
    if (v36)
      os_release(v36);
  }
  *(_BYTE *)(a3 + 1152) = xpc_dictionary_get_dictionary(v27, "RemoteServices") != 0;
  if ((v75 & 8) != 0)
    xpc_dictionary_set_string(v27, "_SubsystemRoot", v17);
  if ((v75 & 0x40) != 0)
  {
    v37 = (const char *)sub_10000DF78();
    snprintf(__str, 0x400uLL, "%s/%s", v22, v37);
    xpc_dictionary_set_string(dictionary, "PYTHONPATH", __str);
  }
  if ((_QWORD)xdict)
  {
    v38 = xpc_dictionary_get_dictionary((xpc_object_t)xdict, "CRYPTEX_SESSION");
    v39 = v38 ? xpc_copy(v38) : xpc_dictionary_create_empty();
    v55 = v39;
    v56 = xpc_dictionary_get_dictionary((xpc_object_t)xdict, *((const char **)&xdict + 1));
    sub_10003CBFC((uint64_t)v55, v56);
    sub_10003CBFC((uint64_t)v27, v55);
    if (v55)
      os_release(v55);
  }
  *((_QWORD *)&v77 + 1) = v27;
  if (os_log_type_enabled((os_log_t)a2[13], OS_LOG_TYPE_DEBUG))
  {
    v57 = xpc_copy_description(v11);
    v58 = xpc_copy_description(v27);
    v59 = *__error();
    v60 = a2[13];
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v57;
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEBUG, "frobbed initial plist: %s", buf, 0xCu);
    }
    *__error() = v59;
    v61 = *__error();
    v62 = a2[13];
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v58;
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEBUG, "frobbed final plist: %s", buf, 0xCu);
    }
    *__error() = v61;
    free(v58);
    free(v57);
  }
  if ((*a2 & 4) != 0)
  {
    v65 = *__error();
    v66 = a2[13];
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = a3;
      v67 = "dry run; skipping bootstrap: %s";
LABEL_98:
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEBUG, v67, buf, 0xCu);
    }
LABEL_99:
    v16 = 0;
    *__error() = v65;
    goto LABEL_104;
  }
  if ((*a2 & 0x80) != 0)
  {
    if ((sub_10003C07C(v27, "_LimitLoadFromBootMode", "rem") & 1) != 0)
    {
      v63 = *__error();
      v64 = a2[13];
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEBUG, "not injecting _LimitLoadToBootMode=>rem; _LimitLoadFromBootMode=>rem already exists",
          buf,
          2u);
      }
      *__error() = v63;
    }
    else
    {
      sub_10003BF6C(v27, "_LimitLoadToBootMode", "rem");
    }
  }
  v68 = sub_1000386A4(v27, v74, a4);
  if (!v68)
  {
    v65 = *__error();
    v66 = a2[13];
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = a3;
      v67 = "bootstrapped plist: %s";
      goto LABEL_98;
    }
    goto LABEL_99;
  }
  v69 = v68;
  v70 = a2[13];
  if (v70)
  {
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      v71 = 3;
    else
      v71 = 2;
    *(_WORD *)buf = 0;
    v72 = v70;
  }
  else
  {
    *(_WORD *)buf = 0;
    v72 = &_os_log_default;
    v71 = 2;
  }
  v73 = (char *)_os_log_send_and_compose_impl(v71, 0, 0, 0, &_mh_execute_header, v72, 16);
  v16 = sub_10000A6F8("sm_bootstrap_service", "sm.c", 329, "com.apple.security.cryptex", 14, v69, v73);
  free(v73);
  CFRelease(v69);
LABEL_104:
  free(v17);
  if (v27)
    os_release(v27);
LABEL_19:
  if (v11)
    os_release(v11);
  return v16;
}

uint64_t sub_1000134AC(char *a1, uint64_t a2)
{
  CFStringRef v4;
  uint64_t v5;
  int v6;
  NSObject *v7;
  const char *v8;
  int v10;
  char *v11;

  v4 = sub_10000A430(a1);
  if ((*(_QWORD *)a2 & 4) != 0)
  {
    v6 = *__error();
    v7 = *(NSObject **)(a2 + 104);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      goto LABEL_10;
    v10 = 136315138;
    v11 = a1;
    v8 = "dry run; skipping unbootstrap: %s";
  }
  else
  {
    v5 = *(unsigned int *)(a2 + 96);
    if ((*(_QWORD *)a2 & 0x20) != 0)
      sub_10003823C(v5, (uint64_t)v4);
    else
      sub_100038464(v5, (uint64_t)v4, *(void **)(a2 + 104));
    v6 = *__error();
    v7 = *(NSObject **)(a2 + 104);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      goto LABEL_10;
    v10 = 136315138;
    v11 = a1;
    v8 = "unbootstrapped plist: %s";
  }
  _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, v8, (uint8_t *)&v10, 0xCu);
LABEL_10:
  *__error() = v6;
  if (v4)
    CFRelease(v4);
  return 0;
}

int *sub_1000135E0(uint64_t a1, uint64_t a2, const char *a3, char *__str)
{
  int *result;
  int v9;
  NSObject *v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  char *v16;

  if ((*(_BYTE *)a1 & 1) == 0)
    return (int *)snprintf(__str, 0x80uLL, "%s", a3);
  snprintf(__str, 0x80uLL, "%s.%#llx", a3, *(_QWORD *)(a1 + 32));
  v9 = *__error();
  v10 = *(NSObject **)(a1 + 56);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v12 = a2;
    v13 = 2080;
    v14 = a3;
    v15 = 2080;
    v16 = __str;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s: %s -> %s", buf, 0x20u);
  }
  result = __error();
  *result = v9;
  return result;
}

int *sub_1000136F8(uint64_t a1, uint64_t a2, const char *a3, char *a4)
{
  const char *v8;
  const char *v9;
  int v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  char *v14;
  int v15;
  NSObject *v16;
  int *result;
  stat v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  char *v24;
  char __str[1024];

  bzero(__str, 0x400uLL);
  v8 = *(const char **)(a1 + 16);
  if (v8[strlen(v8)] == 47 || *a3 == 47)
    v9 = "";
  else
    v9 = "/";
  snprintf(__str, 0x400uLL, "%s%s%s", v8, v9, a3);
  memset(&v18, 0, sizeof(v18));
  v10 = stat(__str, &v18);
  v11 = *__error();
  v12 = *(NSObject **)(a1 + 56);
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if (v10)
  {
    v14 = (char *)a3;
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Path not in cryptex, not frobnicate path", buf, 2u);
      v14 = (char *)a3;
    }
  }
  else
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Path exists in cryptex, frobnicate path", buf, 2u);
    }
    v14 = __str;
  }
  *__error() = v11;
  strlcpy(a4, v14, 0x400uLL);
  v15 = *__error();
  v16 = *(NSObject **)(a1 + 56);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v20 = a2;
    v21 = 2080;
    v22 = a3;
    v23 = 2080;
    v24 = a4;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s: %s -> %s", buf, 0x20u);
  }
  result = __error();
  *result = v15;
  return result;
}

void sub_100013900(const char *a1, void *a2, uint64_t a3)
{
  _OWORD v5[8];

  memset(v5, 0, sizeof(v5));
  sub_1000135E0(a3, (uint64_t)"MachServices", a1, (char *)v5);
  xpc_dictionary_set_value(*(xpc_object_t *)(a3 + 8), (const char *)v5, a2);
}

void sub_100013BF0(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v7;
  int v8;
  NSObject *v9;
  _DWORD v10[2];
  __int16 v11;
  int v12;

  v7 = a4;
  if (a2 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "handlePublisherInitialBarrier");
  }
  else if (a2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "handlePublisherRemoveToken:", a3);
  }
  else if (a2)
  {
    v8 = *__error();
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "log"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v10[0] = 67109376;
      v10[1] = a2;
      v11 = 1024;
      v12 = 22;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "Unexpected publisher action: %d: %{darwin.errno}d", (uint8_t *)v10, 0xEu);
    }

    *__error() = v8;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "handlePublisherAddToken:descriptor:", a3, v7);
  }

}

id sub_100013D1C(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handlePublisherError:", a2);
}

void sub_100013DAC(uint64_t a1, uint64_t a2, uint64_t a3, void (**a4)(_QWORD))
{
  a4[2](a4);

}

void sub_100013E5C(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  _QWORD v5[5];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100013ED0;
  v5[3] = &unk_100055C90;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  xpc_array_apply(a3, v5);

}

uint64_t sub_100013ED0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  const char *string;
  const char *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v15;

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableDictionary);
  string = xpc_array_get_string(v4, 0);
  v7 = xpc_array_get_string(v4, 1uLL);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("Identifier"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v7));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("Version"));

  v10 = *(void **)(a1 + 32);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
  v15 = *(_QWORD *)(a1 + 40);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  v13 = objc_msgSend(v10, "broadcastEvent:forCryptex:withInfo:toClients:", 1, v11, v5, v12);

  return 1;
}

void sub_100014314(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000144BC(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_100014758(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100014B9C(_Unwind_Exception *a1)
{
  free(0);
  _Unwind_Resume(a1);
}

id sub_100014C18()
{
  if (qword_10005A830 != -1)
    dispatch_once(&qword_10005A830, &stru_100055CD8);
  return (id)qword_10005A838;
}

void sub_100014C58(id a1)
{
  EventServer *v1;
  void *v2;

  v1 = -[EventServer initWithEventStream:]([EventServer alloc], "initWithEventStream:", "com.apple.security.cryptex.events");
  v2 = (void *)qword_10005A838;
  qword_10005A838 = (uint64_t)v1;

}

uint64_t sub_100014C90(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  int v21;

  v7 = a1;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a3));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "broadcastEvent:forCryptex:withInfo:", a2, v8, a4));

  if (v9)
  {
    v10 = *__error();
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "log"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v14 = 134218754;
      v15 = a2;
      v16 = 2080;
      v17 = a3;
      v18 = 2112;
      v19 = v9;
      v20 = 1024;
      v21 = 72;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to broadcast event 0x%llx about cryptex '%s': %@: %{darwin.errno}d", (uint8_t *)&v14, 0x26u);
    }

    *__error() = v10;
    v12 = 72;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t sub_100014DE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  if (_dispatch_is_multithreaded())
    sub_10003E02C();
  v0 = sub_100014EF0("system", 0);
  v1 = sub_100008E88();
  cryptex_set_target_queue(v0, v1);
  result = cryptex_activate(v0);
  qword_10005A840 = v0;
  return result;
}

void sub_100014E38(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _OWORD v5[5];

  if (*(_DWORD *)(a1 + 1360))
    sub_10003F218(&v4, v5);
  v2 = 0;
  v3 = a1 + 88;
  do
  {
    close_drop_np(a1 + (*(_QWORD **)((char *)&off_100055CF8 + v2))[2], v3);
    v2 += 8;
  }
  while (v2 != 72);
  dispatch_release(*(dispatch_object_t *)(a1 + 104));
  dispatch_release(*(dispatch_object_t *)(a1 + 112));
  dispatch_release(*(dispatch_object_t *)(a1 + 96));
  sub_10003AA48(a1 + 56);
}

uint64_t sub_100014EF0(const char *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_100011154(1424);
  *(_QWORD *)(v4 + 80) = a2;
  *(_QWORD *)(v4 + 88) = v4;
  *(_QWORD *)(v4 + 96) = dispatch_queue_create("com.apple.security.cryptexd.codex.iodq", 0);
  *(_QWORD *)(v4 + 104) = dispatch_group_create();
  *(_QWORD *)(v4 + 112) = dispatch_group_create();
  sub_100038F08((_OWORD *)(v4 + 144));
  sub_100038F08((_OWORD *)(v4 + 448));
  sub_100038F08((_OWORD *)(v4 + 752));
  sub_100038F08((_OWORD *)(v4 + 1056));
  *(_QWORD *)(v4 + 120) = 0;
  *(_QWORD *)(v4 + 128) = v4 + 120;
  *(_QWORD *)(v4 + 1368) = 0;
  *(_QWORD *)(v4 + 1376) = v4 + 1368;
  *(_DWORD *)(v4 + 1384) = -1;
  *(_QWORD *)(v4 + 1392) = -1;
  *(_QWORD *)(v4 + 1400) = -1;
  sub_10003A760(v4 + 56, (int)"com.apple.security.cryptexd", "codex");
  sub_10003A790(v4 + 56, a1);
  v5 = sub_100008E88();
  cryptex_init(v4, v5, sub_100014FEC, 0);
  return v4;
}

void *sub_100014FE0()
{
  return os_retain((void *)qword_10005A840);
}

uint64_t sub_100014FEC(uint64_t a1)
{
  uint64_t i;
  uint64_t *v3;
  _DWORD *v4;
  _DWORD *v5;
  char *v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  int *v10;
  char *v11;
  unint64_t v12;
  const char *v13;
  void *v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  const char *v21;
  int v22;
  NSObject *v23;
  const char *v24;
  uint64_t result;
  int v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  int v30;
  char __str[16];
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
  _BYTE v45[31];
  _BYTE buf[12];
  __int16 v47;
  int v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  off_t st_size;
  __int16 v53;
  void *v54;
  __int16 v55;
  _OWORD *v56;
  stat v57;
  _OWORD v58[64];

  for (i = 0; i != 72; i += 8)
  {
    v3 = *(uint64_t **)((char *)&off_100055CF8 + i);
    v4 = sub_100008E6C();
    v5 = v4;
    v44 = 0u;
    memset(v45, 0, sizeof(v45));
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v39 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    *(_OWORD *)__str = 0u;
    v32 = 0u;
    v30 = -1;
    v6 = (char *)v3[1];
    if (v6)
    {
      v7 = *(_DWORD *)(a1 + 1384);
      v8 = *v3;
      if ((*v3 & 2) != 0)
      {
        if ((v8 & 4) == 0)
        {
          if ((v8 & 1) != 0)
            v7 = v4[23];
          else
            v7 = v4[22];
        }
      }
      else if ((v8 & 1) != 0)
      {
        v7 = *(_DWORD *)(a1 + 1388);
      }
    }
    else
    {
      v7 = v4[22];
      v6 = __str;
      snprintf(__str, 0xFFuLL, "codex.%s", *(const char **)(a1 + 56));
      if ((*(_BYTE *)v3 & 1) != 0)
      {
        v7 = v5[23];
        v6 = __str;
      }
    }
    v9 = *(NSObject **)(a1 + 72);
    bzero(v58, 0x400uLL);
    memset(&v57, 0, sizeof(v57));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      if (fstat(v7, &v57) == -1)
      {
        v15 = *__error();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v16 = *__error();
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = "rootfd";
          v47 = 1024;
          v48 = v7;
          v49 = 1024;
          LODWORD(v50) = v16;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s fd[%d] : [invalid descriptor]: %{darwin.errno}d", buf, 0x18u);
        }
        *__error() = v15;
      }
      else
      {
        if (fcntl(v7, 50, v58))
        {
          v10 = __error();
          v11 = strerror(*v10);
          snprintf((char *)v58, 0x400uLL, "[%s]", v11);
        }
        v12 = ((unint64_t)v57.st_mode >> 12) ^ 8;
        v13 = "[unknown]";
        if ((_DWORD)v12 != 15)
          v13 = off_100056220[v12];
        v14 = (void *)os_flagset_copy_string(&unk_100055DE8, v57.st_flags);
        v29 = *__error();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136316418;
          *(_QWORD *)&buf[4] = "rootfd";
          v47 = 1024;
          v48 = v7;
          v49 = 2080;
          v50 = v13;
          v51 = 2048;
          st_size = v57.st_size;
          v53 = 2080;
          v54 = v14;
          v55 = 2080;
          v56 = v58;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s fd[%d]: type = %s, size = %lld, flags = %s, path = %s", buf, 0x3Au);
        }
        *__error() = v29;
        free(v14);
      }
    }
    v17 = sub_10003AB48(v7, v6, 1049344, 0x1FFu, &v30);
    if (v17)
    {
      v26 = v17;
      *(_QWORD *)buf = 0;
      memset(v58, 0, 80);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        v27 = 3;
      else
        v27 = 2;
      v57.st_dev = 136315394;
      *(_QWORD *)&v57.st_mode = v6;
      WORD2(v57.st_ino) = 1024;
      *(_DWORD *)((char *)&v57.st_ino + 6) = v26;
      v28 = _os_log_send_and_compose_impl(v27, buf, v58, 80, &_mh_execute_header, &_os_log_default, 16);
      _os_crash_msg(*(_QWORD *)buf, v28);
      __break(1u);
    }
    *(_DWORD *)(a1 + v3[2]) = v30;
    if (v5)
      os_release(v5);
  }
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 104));
  dispatch_group_notify_f(*(dispatch_group_t *)(a1 + 104), *(dispatch_queue_t *)(a1 + 24), (void *)a1, (dispatch_function_t)sub_100018200);
  sub_1000184F4(a1, &qword_100055D58);
  sub_1000184F4(a1, &qword_100055DA0);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 104));
  v18 = 0;
  v57.st_dev = -1;
  do
  {
    v19 = (*(_QWORD **)((char *)&off_100055CF8 + v18))[2];
    LODWORD(v58[0]) = *(_DWORD *)(a1 + v19);
    *(_DWORD *)(a1 + v19) = claimfd_np(v58, a1 + 88, 7);
    v18 += 8;
  }
  while (v18 != 72);
  v20 = sub_100015564(a1, (uint64_t)&unk_100044990, "lockdown", 0, 0, &v57);
  if (v20 != 2)
  {
    if (v20)
      sub_10003F294(__str, v58);
    *(_QWORD *)(a1 + 80) |= 4uLL;
    v21 = *(const char **)(a1 + 56);
    v22 = *__error();
    v23 = *(NSObject **)(a1 + 72);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v24 = "[anonymous]";
      if (v21)
        v24 = v21;
      LODWORD(v58[0]) = 136446210;
      *(_QWORD *)((char *)v58 + 4) = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "%{public}s: system codex is locked down", (uint8_t *)v58, 0xCu);
    }
    *__error() = v22;
  }
  result = v57.st_dev;
  if (v57.st_dev != -1)
  {
    result = close(v57.st_dev);
    if ((_DWORD)result == -1)
      sub_10003E474(__str, v58);
  }
  return result;
}

uint64_t sub_100015564(uint64_t a1, uint64_t a2, char *a3, int a4, uint64_t a5, _DWORD *a6)
{
  uint64_t v8;
  const char *v9;
  int v10;
  NSObject *v11;
  const char *v12;
  int v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;

  v14 = openat(*(_DWORD *)(a1 + *(_QWORD *)(a2 + 16)), a3, a4, a5);
  if (v14 < 0)
  {
    v8 = *__error();
    v9 = *(const char **)(a1 + 56);
    v10 = *__error();
    v11 = *(NSObject **)(a1 + 72);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = "[anonymous]";
      if (v9)
        v12 = v9;
      *(_DWORD *)buf = 136446466;
      v16 = v12;
      v17 = 1024;
      v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}s: openat: %{darwin.errno}d", buf, 0x12u);
    }
    *__error() = v10;
  }
  else
  {
    v8 = 0;
    *a6 = sub_10003AA70(&v14);
  }
  return v8;
}

uint64_t sub_100015678(uint64_t a1, uint64_t a2, char *a3, _DWORD *a4)
{
  uint64_t v6;
  const char *v7;
  int v8;
  NSObject *v9;
  const char *v10;
  int v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;

  v12 = -1;
  v6 = sub_10003BA5C(*(_DWORD *)(a1 + *(_QWORD *)(a2 + 16)), a3, &v12);
  if ((_DWORD)v6)
  {
    v7 = *(const char **)(a1 + 56);
    v8 = *__error();
    v9 = *(NSObject **)(a1 + 72);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = "[anonymous]";
      if (v7)
        v10 = v7;
      *(_DWORD *)buf = 136446466;
      v14 = v10;
      v15 = 1024;
      v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s: mkodtempat: %{darwin.errno}d", buf, 0x12u);
    }
    *__error() = v8;
  }
  else
  {
    *a4 = sub_10003AA70(&v12);
  }
  return v6;
}

void sub_100015790(_QWORD *a1, uint64_t a2, void *a3, int a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t asset;
  const char *v16;
  int v17;
  NSObject *v18;
  _BOOL4 v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  int v23;
  int v24;
  int v25;
  const char *v26;
  int v27;
  NSObject *v28;
  const char *v29;
  int v30;
  const char *v31;
  int v32;
  NSObject *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  int v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  int v43;

  v39 = -1;
  v38 = 0;
  v12 = sub_10003C89C(a1, 0x48uLL);
  v12[3] = os_retain((void *)a2);
  v12[6] = a5;
  v12[7] = a6;
  *((_DWORD *)v12 + 16) = a4;
  if (a3)
  {
    v13 = os_retain(a3);
  }
  else
  {
    v13 = (_QWORD *)cryptex_scrivener_create(*(_QWORD *)(a2 + 104), 0);
    if (cryptex_core_is_cryptex1(*(_QWORD *)(a2 + 104)))
      v13[10] |= 8uLL;
  }
  v14 = *(_QWORD *)(a2 + 104);
  if (!*(_QWORD *)(v14 + 216) || cryptex_core_get_asset(v14, &_cryptex_asset_type_cx1p))
    goto LABEL_7;
  v22 = openat(*(_DWORD *)(a2 + 112), *((const char **)&_cryptex_asset_type_cx1p + 5), 514, 420);
  v39 = v22;
  if ((v22 & 0x80000000) != 0)
  {
    v30 = *__error();
    v31 = (const char *)a1[7];
    v32 = *__error();
    v33 = a1[9];
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      goto LABEL_39;
    v34 = "[anonymous]";
    if (v31)
      v34 = v31;
    *(_DWORD *)buf = 136446466;
    v41 = v34;
    v42 = 1024;
    v43 = v30;
    v35 = "%{public}s: openat: %{darwin.errno}d";
    goto LABEL_38;
  }
  v23 = v22;
  v24 = cryptex_core_cx1_write_to_file(*(_QWORD *)(*(_QWORD *)(a2 + 104) + 216), v22);
  if (v24)
  {
    v25 = v24;
    v26 = (const char *)a1[7];
    v27 = *__error();
    v28 = a1[9];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = "[anonymous]";
      if (v26)
        v29 = v26;
      *(_DWORD *)buf = 136446466;
      v41 = v29;
      v42 = 1024;
      v43 = v25;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%{public}s: Failed to write Cryptex1 properties to file.: %{darwin.errno}d", buf, 0x12u);
    }
    *__error() = v27;
LABEL_40:
    cryptex_target_async_f(a1, v12, sub_100016108);
    goto LABEL_19;
  }
  if (fchmod(v23, 0x124u))
  {
    v30 = *__error();
    v36 = (const char *)a1[7];
    v32 = *__error();
    v33 = a1[9];
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      goto LABEL_39;
    v37 = "[anonymous]";
    if (v36)
      v37 = v36;
    *(_DWORD *)buf = 136446466;
    v41 = v37;
    v42 = 1024;
    v43 = v30;
    v35 = "%{public}s: fchmod: %{darwin.errno}d";
LABEL_38:
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, v35, buf, 0x12u);
LABEL_39:
    *__error() = v32;
    if (!v30)
      goto LABEL_19;
    goto LABEL_40;
  }
  v38 = cryptex_asset_new(&_cryptex_asset_type_cx1p, &v39);
  cryptex_core_set_asset(*(_QWORD *)(a2 + 104), &v38);
LABEL_7:
  cryptex_set_target_object(v13, a1);
  asset = cryptex_core_get_asset(*(_QWORD *)(a2 + 104), &_cryptex_asset_type_im4m);
  v16 = (const char *)a1[7];
  v17 = *__error();
  v18 = a1[9];
  v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
  if (asset)
  {
    if (v19)
    {
      v20 = "[anonymous]";
      if (v16)
        v20 = v16;
      *(_DWORD *)buf = 136446210;
      v41 = v20;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%{public}s: using existing im4m", buf, 0xCu);
    }
    *__error() = v17;
    cryptex_scrivener_read_signature(v13, v12, sub_100015BB8);
  }
  else
  {
    if (v19)
    {
      v21 = "[anonymous]";
      if (v16)
        v21 = v16;
      *(_DWORD *)buf = 136446210;
      v41 = v21;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%{public}s: will personalize", buf, 0xCu);
    }
    *__error() = v17;
    cryptex_scrivener_sign(v13, v12, sub_100015BB8);
  }
  v12[5] = sub_100015FEC((uint64_t)a1, (uint64_t)"install");
  cryptex_activate(v13);
LABEL_19:
  if (v13)
    os_release(v13);
}

void sub_100015BB8(uint64_t a1, uint64_t a2, const char *a3, uint64_t *a4)
{
  uint64_t v7;
  uint64_t v8;
  int v9;
  NSObject *v10;
  int v11;
  const char *v12;
  const char *v13;
  int v14;
  NSObject *v15;
  const char *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  const char *v20;
  int v21;
  NSObject *v22;
  const char *v23;
  const char *string;
  const char *v25;
  int v26;
  NSObject *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  const char **v31;
  const char *v32;
  NSObject *v33;
  const char *v34;
  const char *v35;
  char *v36;
  char **v37;
  char *__s2;
  uint64_t v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  char *v45;
  __int16 v46;
  int v47;

  v7 = *a4;
  v8 = *(_QWORD *)(a4[3] + 104);
  sub_100008E78();
  v9 = *__error();
  v10 = *(NSObject **)(v7 + 72);
  if (!a3)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "protex personalization [no error]", buf, 2u);
    }
    *__error() = v9;
    a4[2] = 0;
    if (!*(_QWORD *)(a2 + 264) || !cryptex_core_get_info_asset(v8))
      goto LABEL_22;
    __s2 = 0;
    v39 = 0;
    v37 = 0;
    v11 = cryptex_core_parse_info_asset(v8, &__s2, &v37, 0);
    if (v11)
    {
      LODWORD(v12) = v11;
      v13 = *(const char **)(a2 + 16);
      v14 = *__error();
      v15 = *(NSObject **)(a2 + 32);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = "[anonymous]";
        if (v13)
          v16 = v13;
        *(_DWORD *)buf = 136446466;
        v41 = v16;
        v42 = 1024;
        LODWORD(v43) = (_DWORD)v12;
        v17 = "%{public}s: Failed to extract cryptex identifier and version.: %{darwin.errno}d";
        v18 = v15;
        v19 = 18;
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
      }
    }
    else
    {
      string = xpc_dictionary_get_string(*(xpc_object_t *)(a2 + 264), "com.apple.CryptexIdentifier");
      v12 = string;
      if (string)
      {
        if (!strcmp(string, __s2))
        {
          LODWORD(v12) = 0;
        }
        else
        {
          v25 = *(const char **)(a2 + 16);
          v26 = *__error();
          v27 = *(NSObject **)(a2 + 32);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            v28 = "[anonymous]";
            if (v25)
              v28 = v25;
            *(_DWORD *)buf = 136446978;
            v41 = v28;
            v42 = 2080;
            v43 = v12;
            v44 = 2080;
            v45 = __s2;
            v46 = 1024;
            v47 = 8;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%{public}s: im4m identifier mismatches cryptex (actual, expected): (%s, %s): %{darwin.errno}d", buf, 0x26u);
          }
          *__error() = v26;
          LODWORD(v12) = 8;
        }
      }
      v29 = xpc_dictionary_get_string(*(xpc_object_t *)(a2 + 264), "com.apple.CryptexVersion");
      v30 = cryptex_version_new(v29);
      v39 = v30;
      if (!v30)
        goto LABEL_16;
      v31 = (const char **)v30;
      if (!cryptex_version_compare(v30, v37))
        goto LABEL_16;
      v32 = *(const char **)(a2 + 16);
      v14 = *__error();
      v33 = *(NSObject **)(a2 + 32);
      LODWORD(v12) = 8;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v34 = "[anonymous]";
        if (v32)
          v34 = v32;
        v35 = *v31;
        v36 = *v37;
        *(_DWORD *)buf = 136446978;
        v41 = v34;
        v42 = 2080;
        v43 = v35;
        v44 = 2080;
        v45 = v36;
        v46 = 1024;
        v47 = 8;
        v17 = "%{public}s: im4m version mismatches cryptex (actual, expected): (%s, %s): %{darwin.errno}d";
        v18 = v33;
        v19 = 38;
        goto LABEL_14;
      }
    }
    *__error() = v14;
LABEL_16:
    cryptex_version_destroy(&v39);
    cryptex_version_destroy(&v37);
    free(__s2);
    if ((_DWORD)v12)
    {
      v20 = *(const char **)(v7 + 56);
      v21 = *__error();
      v22 = *(NSObject **)(v7 + 72);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = "[anonymous]";
        if (v20)
          v23 = v20;
        *(_DWORD *)buf = 136446466;
        v41 = v23;
        v42 = 1024;
        LODWORD(v43) = (_DWORD)v12;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%{public}s: Signature metadata does not match cryptex.: %{darwin.errno}d", buf, 0x12u);
      }
      *__error() = v21;
    }
LABEL_22:
    cryptex_core_attach_signature(v8, a2);
    dispatch_async_f(*(dispatch_queue_t *)(v7 + 96), a4, (dispatch_function_t)sub_10001BB70);
    return;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v41 = a3;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "protex personalization: %@", buf, 0xCu);
  }
  *__error() = v9;
  a4[2] = (uint64_t)CFRetain(a3);
  cryptex_target_async_f(v7, a4, sub_100016108);
}

uint64_t sub_100015FEC(uint64_t a1, uint64_t a2)
{
  const char *v4;
  int v5;
  NSObject *v6;
  const char *v7;
  int v8;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;

  sub_100008E78();
  ++*(_DWORD *)(a1 + 1360);
  v4 = *(const char **)(a1 + 56);
  v5 = *__error();
  v6 = *(NSObject **)(a1 + 72);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = "[anonymous]";
    v8 = *(_DWORD *)(a1 + 1360);
    if (v4)
      v7 = v4;
    v10 = 136446978;
    v11 = v7;
    v12 = 2080;
    v13 = a2;
    v14 = 1024;
    v15 = v8 - 1;
    v16 = 1024;
    v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}s: activation: %s: %u -> %u", (uint8_t *)&v10, 0x22u);
  }
  *__error() = v5;
  if (!*(_DWORD *)(a1 + 1360))
    sub_10003F310();
  return os_transaction_create(a2);
}

void sub_100016108(uint64_t a1)
{
  void *v2;
  const void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = *(void **)a1;
  v3 = *(const void **)(a1 + 16);
  v4 = *(void **)(a1 + 24);
  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  sub_100008E78();
  (*(void (**)(void *, void *, const void *, uint64_t))(a1 + 56))(v2, v5, v3, v7);
  sub_10001B110((uint64_t)v2, v6);
  os_release(v4);
  sub_10003C998((void **)a1);
  if (v5)
    os_release(v5);
  if (v3)
    CFRelease(v3);
}

CFIndex sub_1000161B0(uint64_t a1, int a2, void *a3)
{
  const char *v6;
  int v7;
  NSObject *v8;
  const char *v9;
  const char *v10;
  int v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  CFIndex v16;
  CFIndex v17;
  const void *v18;
  int v20;
  const char *v21;
  __int16 v22;
  int v23;

  v6 = *(const char **)(a1 + 56);
  v7 = *__error();
  v8 = *(NSObject **)(a1 + 72);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    if (v6)
      v9 = v6;
    else
      v9 = "[anonymous]";
    v20 = 136446210;
    v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%{public}s: Waiting to search the codex for LaunchAgents", (uint8_t *)&v20, 0xCu);
  }
  *__error() = v7;
  dispatch_group_wait(*(dispatch_group_t *)(a1 + 112), 0xFFFFFFFFFFFFFFFFLL);
  v10 = *(const char **)(a1 + 56);
  v11 = *__error();
  v12 = *(NSObject **)(a1 + 72);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    if (v10)
      v13 = v10;
    else
      v13 = "[anonymous]";
    v20 = 136446466;
    v21 = v13;
    v22 = 1024;
    v23 = a2;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%{public}s: Searching the codex for LaunchAgents - have uid of: %u.", (uint8_t *)&v20, 0x12u);
  }
  v14 = 0;
  *__error() = v11;
  while (1)
  {
    v15 = *(_QWORD *)(a1 + 144 + 8 * v14);
    if (v15)
      break;
LABEL_15:
    if (++v14 == 37)
      return 0;
  }
  while (1)
  {
    v16 = sub_100030BE4((void *)(v15 - 80), a2, a3);
    if (v16)
      break;
    v15 = *(_QWORD *)(v15 + 8);
    if (!v15)
      goto LABEL_15;
  }
  v18 = (const void *)v16;
  v17 = sub_10000A88C(v16);
  CFRelease(v18);
  return v17;
}

_DWORD *sub_100016360(uint64_t a1, int a2)
{
  const char *v4;
  int v5;
  NSObject *v6;
  const char *v7;
  _DWORD *result;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;

  v4 = *(const char **)(a1 + 56);
  v5 = *__error();
  v6 = *(NSObject **)(a1 + 72);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = "[anonymous]";
    if (v4)
      v7 = v4;
    v12 = 136446466;
    v13 = v7;
    v14 = 1024;
    v15 = a2;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}s: Searching the codex for LaunchAgents - have uid of: %u.", (uint8_t *)&v12, 0x12u);
  }
  result = __error();
  v9 = 0;
  *result = v5;
  v10 = a1 + 144;
  do
  {
    for (i = *(_QWORD *)(v10 + 8 * v9); i; i = *(_QWORD *)(i + 8))
      result = (_DWORD *)sub_100030F60((void *)(i - 80), a2);
    ++v9;
  }
  while (v9 != 37);
  return result;
}

uint64_t sub_100016474(void *a1, void *a2, uint64_t a3)
{
  _QWORD *v6;

  v6 = sub_10003C89C(a1, 0x28uLL);
  v6[3] = a3;
  v6[4] = os_retain(a2);
  return cryptex_async_f(a1, v6, sub_1000164CC);
}

void sub_1000164CC(void **a1)
{
  os_log_t *v2;
  uint64_t v3;
  _QWORD *v4;
  os_log_t v5;
  uint64_t v6;
  os_log_t v7;
  char *v8;
  CFErrorRef v9;

  v2 = (os_log_t *)*a1;
  v3 = (uint64_t)a1[3];
  if ((*((_BYTE *)*a1 + 80) & 4) != 0)
  {
    v5 = v2[9];
    if (v5)
    {
      if (os_log_type_enabled(v2[9], OS_LOG_TYPE_ERROR))
        v6 = 3;
      else
        v6 = 2;
      v7 = v5;
    }
    else
    {
      v7 = (os_log_t)&_os_log_default;
      v6 = 2;
    }
    v8 = (char *)_os_log_send_and_compose_impl(v6, 0, 0, 0, &_mh_execute_header, v7, 16);
    v9 = sub_10000A6F8("_codex_install_cryptex_continue", "codex.c", 2867, "com.apple.security.cryptex.posix", 58, 0, v8);
    free(v8);
    a1[2] = v9;
    (*(void (**)(os_log_t *, _QWORD, CFErrorRef, uint64_t))(v3 + 40))(v2, 0, v9, v3);
    v4 = 0;
  }
  else
  {
    v4 = sub_10000F8C8((uint64_t)a1[4], v2, 0);
    cryptex_set_target_object(v4, v2);
    sub_10000FD00(v4, v3, (uint64_t)sub_10001C128);
  }
  os_release(a1[4]);
  sub_10003C998(a1);
  if (v4)
    os_release(v4);
}

uint64_t sub_1000166E4(void *a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v9;

  v9 = sub_10003C89C(a1, 0x40uLL);
  a2[6] = 1;
  v9[3] = os_retain(a2);
  v9[4] = 0;
  v9[6] = a4;
  v9[7] = a5;
  v9[5] = 0;
  return cryptex_async_f(a1, v9, sub_100016754);
}

void sub_100016754(uint64_t a1)
{
  os_log_t *v2;
  _QWORD *v3;
  os_log_t v4;
  uint64_t v5;
  os_log_t v6;
  char *v7;
  CFErrorRef v8;

  v2 = *(os_log_t **)a1;
  if ((cryptex_core_is_cryptex1(*(_QWORD *)(a1 + 24)) & 1) != 0)
  {
    v3 = sub_10000F8C8(*(_QWORD *)(a1 + 24), v2, 1);
    *(_QWORD *)(a1 + 32) = v3;
    cryptex_set_target_object(v3, v2);
    sub_10000FD00(*(void **)(a1 + 32), a1, (uint64_t)sub_10001C2F4);
  }
  else
  {
    v4 = v2[9];
    if (v4)
    {
      if (os_log_type_enabled(v2[9], OS_LOG_TYPE_ERROR))
        v5 = 3;
      else
        v5 = 2;
      v6 = v4;
    }
    else
    {
      v6 = (os_log_t)&_os_log_default;
      v5 = 2;
    }
    v7 = (char *)_os_log_send_and_compose_impl(v5, 0, 0, 0, &_mh_execute_header, v6, 16);
    v8 = sub_10000A6F8("_codex_mount_continue", "codex.c", 3028, "com.apple.security.cryptex.posix", 22, 0, v7);
    free(v7);
    if (v8)
    {
      *(_QWORD *)(a1 + 16) = v8;
      cryptex_target_async_f(v2, a1, sub_10001C4F4);
    }
  }
}

uint64_t sub_100016968(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v10 = sub_10003C89C(a1, 0xD0uLL);
  v11 = *(_OWORD *)(a3 + 112);
  *(_OWORD *)(v10 + 15) = *(_OWORD *)(a3 + 96);
  *(_OWORD *)(v10 + 17) = v11;
  *(_OWORD *)(v10 + 19) = *(_OWORD *)(a3 + 128);
  v12 = *(_OWORD *)(a3 + 48);
  *(_OWORD *)(v10 + 7) = *(_OWORD *)(a3 + 32);
  *(_OWORD *)(v10 + 9) = v12;
  v13 = *(_OWORD *)(a3 + 80);
  *(_OWORD *)(v10 + 11) = *(_OWORD *)(a3 + 64);
  *(_OWORD *)(v10 + 13) = v13;
  v14 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(v10 + 3) = *(_OWORD *)a3;
  v10[21] = *(_QWORD *)(a3 + 144);
  v10[22] = a2;
  *(_OWORD *)(v10 + 5) = v14;
  v10[24] = a4;
  v10[25] = a5;
  v10[23] = 0;
  return cryptex_async_f(a1, v10, sub_100016A04);
}

void sub_100016A04(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t cryptex1_properties;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char *v16;
  int v17;
  CFIndex v18;
  CFErrorRef v19;

  v2 = *(_QWORD *)a1;
  v3 = *(_QWORD *)(a1 + 176);
  v4 = sub_100017DE4(*(_QWORD *)a1, *(char **)(a1 + 24), *(_QWORD *)(a1 + 40));
  v5 = v4;
  if (v4)
  {
    if ((cryptex_core_is_cryptex1(v4[25]) & 1) != 0)
    {
      cryptex1_properties = cryptex_core_get_cryptex1_properties(v5[25]);
      if (cryptex1_properties && *(_BYTE *)(cryptex1_properties + 64))
      {
        *(_QWORD *)(a1 + 184) = os_retain(v5);
        sub_10002FD44((uint64_t)v5, v3 & 1 | 2, a1, (uint64_t)sub_10001CDCC);
LABEL_31:
        os_release(v5);
        return;
      }
      v13 = *(void **)(v2 + 72);
      if (v13)
      {
        if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR))
          v14 = 3;
        else
          v14 = 2;
        v15 = v13;
      }
      else
      {
        v15 = &_os_log_default;
        v14 = 2;
      }
      v16 = (char *)_os_log_send_and_compose_impl(v14, 0, 0, 0, &_mh_execute_header, v15, 16);
      v17 = 3156;
    }
    else
    {
      v10 = *(void **)(v2 + 72);
      if (v10)
      {
        if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR))
          v11 = 3;
        else
          v11 = 2;
        v12 = v10;
      }
      else
      {
        v12 = &_os_log_default;
        v11 = 2;
      }
      v16 = (char *)_os_log_send_and_compose_impl(v11, 0, 0, 0, &_mh_execute_header, v12, 16);
      v17 = 3149;
    }
    v18 = 22;
  }
  else
  {
    v7 = *(void **)(v2 + 72);
    if (v7)
    {
      if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR))
        v8 = 3;
      else
        v8 = 2;
      v9 = v7;
    }
    else
    {
      v9 = &_os_log_default;
      v8 = 2;
    }
    v16 = (char *)_os_log_send_and_compose_impl(v8, 0, 0, 0, &_mh_execute_header, v9, 16);
    v17 = 3143;
    v18 = 2;
  }
  v19 = sub_10000A6F8("_codex_unmount_continue", "codex.c", v17, "com.apple.security.cryptex.posix", v18, 0, v16);
  free(v16);
  if (v19)
  {
    *(_QWORD *)(a1 + 16) = v19;
    cryptex_target_async_f(v2, a1, sub_10001CFC8);
  }
  if (v5)
    goto LABEL_31;
}

void sub_100016EB4(dispatch_queue_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v8;

  v8 = sub_10003C89C(a1, 0x48uLL);
  v8[4] = os_retain(a2);
  v8[6] = a3;
  v8[7] = a4;
  dispatch_async_f(a1[12], v8, (dispatch_function_t)sub_100016F18);
}

void sub_100016F18(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  const char *v18;
  char *v19;
  int v20;
  CFIndex v21;
  const char *v22;
  int v23;
  CFErrorRef v24;
  CFErrorRef v25;
  void *v26;
  uint64_t v27;
  const char *v28;
  void *v29;
  const char *v30;
  CFErrorRef v31;
  void *v32;
  uint64_t v33;
  const char *v34;
  void *v35;
  const char *v36;
  int v37;
  const char *v38;
  int v39;
  uint64_t v40;
  char __str[16];
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
  _BYTE v55[31];
  int v56;
  const char *v57;
  __int16 v58;
  int v59;

  v2 = *a1;
  v3 = a1[4];
  v54 = 0u;
  memset(v55, 0, sizeof(v55));
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v49 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  *(_OWORD *)__str = 0u;
  v42 = 0u;
  v39 = -1;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 96));
  snprintf(__str, 0xFFuLL, "%s.XXXXXX", *(const char **)(v3 + 208));
  if ((*(_BYTE *)(v3 + 176) & 0x10) != 0)
  {
    v8 = *(void **)(v2 + 72);
    if (v8)
    {
      if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR))
        v9 = 3;
      else
        v9 = 2;
      v10 = *(const char **)(v2 + 56);
      if (!v10)
        v10 = "[anonymous]";
      v56 = 136446466;
      v57 = v10;
      v58 = 1024;
      v59 = 45;
      v11 = v8;
    }
    else
    {
      v18 = *(const char **)(v2 + 56);
      if (!v18)
        v18 = "[anonymous]";
      v56 = 136446466;
      v57 = v18;
      v58 = 1024;
      v59 = 45;
      v11 = &_os_log_default;
      v9 = 2;
    }
    v19 = (char *)_os_log_send_and_compose_impl(v9, 0, 0, 0, &_mh_execute_header, v11, 16);
    v20 = 1362;
    v21 = 45;
    goto LABEL_45;
  }
  if (*(_QWORD *)(v3 + 480))
  {
    v4 = *(void **)(v2 + 72);
    if (v4)
    {
      if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR))
        v5 = 3;
      else
        v5 = 2;
      v6 = *(const char **)(v2 + 56);
      if (!v6)
        v6 = "[anonymous]";
      v56 = 136446466;
      v57 = v6;
      v58 = 1024;
      v59 = 16;
      v7 = v4;
    }
    else
    {
      v22 = *(const char **)(v2 + 56);
      if (!v22)
        v22 = "[anonymous]";
      v56 = 136446466;
      v57 = v22;
      v58 = 1024;
      v59 = 16;
      v7 = &_os_log_default;
      v5 = 2;
    }
    v19 = (char *)_os_log_send_and_compose_impl(v5, 0, 0, 0, &_mh_execute_header, v7, 16);
    v20 = 1369;
    v21 = 16;
LABEL_45:
    v31 = sub_10000A6F8("_codex_uninstall_continue", "codex.c", v20, "com.apple.security.cryptex.posix", v21, 0, v19);
    v25 = 0;
    goto LABEL_46;
  }
  v12 = sub_100015678(v2, (uint64_t)&unk_100055D70, __str, &v39);
  if (v12)
  {
    v13 = v12;
    v14 = *(void **)(v2 + 72);
    if (v14)
    {
      if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR))
        v15 = 3;
      else
        v15 = 2;
      v16 = *(const char **)(v2 + 56);
      if (!v16)
        v16 = "[anonymous]";
      v56 = 136446466;
      v57 = v16;
      v58 = 1024;
      v59 = v13;
      v17 = v14;
    }
    else
    {
      v30 = *(const char **)(v2 + 56);
      if (!v30)
        v30 = "[anonymous]";
      v56 = 136446466;
      v57 = v30;
      v58 = 1024;
      v59 = v12;
      v17 = &_os_log_default;
      v15 = 2;
    }
    v19 = (char *)_os_log_send_and_compose_impl(v15, 0, 0, 0, &_mh_execute_header, v17, 16);
    v21 = v13;
    v20 = 1380;
    goto LABEL_45;
  }
  v23 = v39;
  v24 = sub_10001D2C8(v2, *(_DWORD *)(v2 + 1396), *(char **)(v3 + 208), v39);
  if (v24)
  {
    v25 = v24;
    v26 = *(void **)(v2 + 72);
    if (v26)
    {
      if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR))
        v27 = 3;
      else
        v27 = 2;
      v28 = *(const char **)(v2 + 56);
      if (!v28)
        v28 = "[anonymous]";
      v56 = 136446210;
      v57 = v28;
      v29 = v26;
    }
    else
    {
      v36 = *(const char **)(v2 + 56);
      if (!v36)
        v36 = "[anonymous]";
      v56 = 136446210;
      v57 = v36;
      v29 = &_os_log_default;
      v27 = 2;
    }
    v19 = (char *)_os_log_send_and_compose_impl(v27, 0, 0, 0, &_mh_execute_header, v29, 16);
    v37 = 1389;
  }
  else
  {
    v25 = sub_10001D2C8(v2, *(_DWORD *)(v2 + 1408), *(char **)(v3 + 208), v23);
    if (!v25)
    {
      a1[2] = 0;
      goto LABEL_61;
    }
    v32 = *(void **)(v2 + 72);
    if (v32)
    {
      if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR))
        v33 = 3;
      else
        v33 = 2;
      v34 = *(const char **)(v2 + 56);
      if (!v34)
        v34 = "[anonymous]";
      v56 = 136446210;
      v57 = v34;
      v35 = v32;
    }
    else
    {
      v38 = *(const char **)(v2 + 56);
      if (!v38)
        v38 = "[anonymous]";
      v56 = 136446210;
      v57 = v38;
      v35 = &_os_log_default;
      v33 = 2;
    }
    v19 = (char *)_os_log_send_and_compose_impl(v33, 0, 0, 0, &_mh_execute_header, v35, 16);
    v37 = 1398;
  }
  v31 = sub_10000A6F8("_codex_uninstall_continue", "codex.c", v37, "com.apple.security.cryptex", 4, v25, v19);
LABEL_46:
  free(v19);
  a1[2] = (uint64_t)v31;
  if (!v31)
  {
LABEL_61:
    cryptex_async_f(v2, a1, sub_10001D534);
    goto LABEL_62;
  }
  cryptex_target_async_f(v2, a1, sub_10001D4AC);
LABEL_62:
  if (v39 != -1 && close(v39) == -1)
    sub_10003E474(&v40, &v56);
  if (v25)
    CFRelease(v25);
}

_QWORD *sub_100017648(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v8;

  v8 = sub_10003C89C((void *)a1, 0x38uLL);
  v8[3] = os_retain(a2);
  v8[5] = a3;
  v8[6] = a4;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 112));
  return sub_10002C0A0((uint64_t)a2, *(_DWORD *)(a1 + 1404), (uint64_t)v8, (uint64_t)sub_1000176B8);
}

void sub_1000176B8(uint64_t a1, uint64_t a2, const void *a3, uint64_t *a4)
{
  uint64_t v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const void *v17;

  v7 = *a4;
  sub_100008E78();
  v8 = *__error();
  v9 = *(NSObject **)(v7 + 72);
  if (a3)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 208);
      v14 = 136315394;
      v15 = v10;
      v16 = 2112;
      v17 = a3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "quire mount: %s: %@", (uint8_t *)&v14, 0x16u);
    }
    *__error() = v8;
    a4[2] = (uint64_t)CFRetain(a3);
    cryptex_target_async_f(v7, a4, sub_10001D700);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v11 = *(_QWORD *)(a1 + 208);
      v14 = 136315138;
      v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "quire mount: %s [no error]", (uint8_t *)&v14, 0xCu);
    }
    *__error() = v8;
    a4[2] = 0;
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 200) + 216);
    if (v12)
      v13 = 4 * *(unsigned __int8 *)(v12 + 64);
    else
      v13 = 0;
    sub_10002DEA8(a1, *(unsigned int *)(v7 + 1420), v13, (uint64_t)a4, (uint64_t)sub_10001D78C);
  }
}

uint64_t sub_10001783C(uint64_t a1, void *a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  const char *v10;
  int v11;
  NSObject *v12;
  const char *v13;
  _QWORD *v14;
  int v16;
  const char *v17;

  v10 = *(const char **)(a1 + 56);
  v11 = *__error();
  v12 = *(NSObject **)(a1 + 72);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = "[anonymous]";
    if (v10)
      v13 = v10;
    v16 = 136446210;
    v17 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%{public}s: codex_unbootstrap occuring.", (uint8_t *)&v16, 0xCu);
  }
  *__error() = v11;
  v14 = sub_10003C89C((void *)a1, 0x38uLL);
  v14[3] = os_retain(a2);
  v14[4] = a3;
  v14[5] = a4;
  v14[6] = a5;
  return sub_10002F858(a2, *(unsigned int *)(a1 + 1420), (a3 >> 1) & 1, (uint64_t)v14, (uint64_t)sub_10001795C);
}

_QWORD *sub_10001795C(uint64_t a1, uint64_t a2, const void *a3, uint64_t *a4)
{
  uint64_t v7;
  uint64_t v8;
  CFTypeRef v9;
  const char *v10;
  int v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  char *v25;
  int v26;
  const char *v27;
  CFErrorRef v28;
  const char *v30;
  int v31;
  NSObject *v32;
  const char *v33;
  const char *v34;
  int v35;
  NSObject *v36;
  const char *v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  uint64_t v41;

  v7 = *a4;
  v8 = a4[4];
  sub_100008E78();
  if (a3)
    v9 = CFRetain(a3);
  else
    v9 = 0;
  a4[2] = (uint64_t)v9;
  v10 = *(const char **)(v7 + 56);
  v11 = *__error();
  v12 = *(NSObject **)(v7 + 72);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = "[anonymous]";
    v14 = *(_QWORD *)(a1 + 208);
    if (v10)
      v13 = v10;
    *(_DWORD *)buf = 136446466;
    v39 = v13;
    v40 = 2080;
    v41 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}s: quire unbootstrap: %s", buf, 0x16u);
  }
  *__error() = v11;
  if (a3 && (sub_10000A98C((CFDictionaryRef)a3, CFSTR("com.apple.security.cryptex"), 18) & 1) == 0)
    cryptex_target_async_f(v7, a4, sub_10001DA80);
  if ((*(_BYTE *)(a1 + 176) & 0x10) != 0 && (v8 & 2) == 0)
  {
    v15 = *(void **)(a1 + 72);
    if (v15)
    {
      if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR))
        v16 = 3;
      else
        v16 = 2;
      v17 = *(const char **)(a1 + 56);
      if (!v17)
        v17 = "[anonymous]";
      *(_DWORD *)buf = 136446210;
      v39 = v17;
      v18 = v15;
    }
    else
    {
      v24 = *(const char **)(a1 + 56);
      if (!v24)
        v24 = "[anonymous]";
      *(_DWORD *)buf = 136446210;
      v39 = v24;
      v18 = &_os_log_default;
      v16 = 2;
    }
    v25 = (char *)_os_log_send_and_compose_impl(v16, 0, 0, 0, &_mh_execute_header, v18, 16);
    v26 = 1491;
LABEL_38:
    v28 = sub_10000A6F8("_codex_unbootstrap_continue", "codex.c", v26, "com.apple.security.cryptex", 4, 0, v25);
    free(v25);
    a4[2] = (uint64_t)v28;
    return (_QWORD *)cryptex_target_async_f(v7, a4, sub_10001DA80);
  }
  if (*(_QWORD *)(a1 + 480))
  {
    v19 = *(void **)(a1 + 72);
    if (v19)
    {
      if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR))
        v20 = 3;
      else
        v20 = 2;
      v21 = *(const char **)(a1 + 56);
      if (!v21)
        v21 = "[anonymous]";
      *(_DWORD *)buf = 136446210;
      v39 = v21;
      v22 = v19;
    }
    else
    {
      v27 = *(const char **)(a1 + 56);
      if (!v27)
        v27 = "[anonymous]";
      *(_DWORD *)buf = 136446210;
      v39 = v27;
      v22 = &_os_log_default;
      v20 = 2;
    }
    v25 = (char *)_os_log_send_and_compose_impl(v20, 0, 0, 0, &_mh_execute_header, v22, 16);
    v26 = 1502;
    goto LABEL_38;
  }
  if ((v8 & 1) != 0)
  {
    v30 = *(const char **)(v7 + 56);
    v31 = *__error();
    v32 = *(NSObject **)(v7 + 72);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      v33 = "[anonymous]";
      if (v30)
        v33 = v30;
      *(_DWORD *)buf = 136446210;
      v39 = v33;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "%{public}s: will force unmount", buf, 0xCu);
    }
    *__error() = v31;
    v23 = 1;
  }
  else
  {
    v23 = 0;
  }
  v34 = *(const char **)(v7 + 56);
  v35 = *__error();
  v36 = *(NSObject **)(v7 + 72);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
  {
    v37 = "[anonymous]";
    if (v34)
      v37 = v34;
    *(_DWORD *)buf = 136446210;
    v39 = v37;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "%{public}s: _codex_unbootstrap_continue progressing to quire unmount", buf, 0xCu);
  }
  *__error() = v35;
  return sub_10002FD44(a1, v23, (uint64_t)a4, (uint64_t)sub_10001DB04);
}

void *sub_100017DE4(uint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  sub_100008E78();
  v6 = sub_10003909C(a1 + 144, a2);
  if (!v6)
    return 0;
  v7 = v6;
  if (a3 && cryptex_version_compare(a3, *(_QWORD *)(v6 + 144)))
    return 0;
  else
    return os_retain((void *)(v7 - 80));
}

uint64_t sub_100017E54(void *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;

  v6 = sub_10003C89C(a1, 0x38uLL);
  v6[5] = a2;
  v6[6] = a3;
  v6[4] = sub_100015FEC((uint64_t)a1, (uint64_t)"barrier");
  return cryptex_async_f(a1, v6, sub_100017EB4);
}

void sub_100017EB4(uint64_t *a1)
{
  uint64_t v2;
  void *v3;
  const char *v4;
  int v5;
  NSObject *v6;
  const char *v7;
  int v8;
  const char *v9;

  v2 = *a1;
  v3 = (void *)a1[4];
  sub_100008E78();
  v4 = *(const char **)(v2 + 56);
  v5 = *__error();
  v6 = *(NSObject **)(v2 + 72);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = "[anonymous]";
    if (v4)
      v7 = v4;
    v8 = 136446210;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}s: enqueuing barrier", (uint8_t *)&v8, 0xCu);
  }
  *__error() = v5;
  a1[3] = 0;
  **(_QWORD **)(v2 + 1376) = a1;
  *(_QWORD *)(v2 + 1376) = a1 + 3;
  sub_10001B110(v2, v3);
}

uint64_t sub_100017FAC(void *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;

  v6 = sub_10003C89C(a1, 0x28uLL);
  v6[3] = a2;
  v6[4] = a3;
  return cryptex_async_f(a1, v6, sub_100017FF4);
}

void sub_100017FF4(_DWORD *a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  const char *v5;
  int v6;
  NSObject *v7;
  const char *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;

  v2 = *(_QWORD *)a1;
  v3 = os_retain((void *)qword_10005A840);
  *(_QWORD *)(v2 + 80) |= 4uLL;
  if ((void *)v2 == v3)
  {
    v4 = cryptex_signature_seal();
    if (v4)
    {
      v5 = *(const char **)(v2 + 56);
      v6 = *__error();
      v7 = *(NSObject **)(v2 + 72);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = "[anonymous]";
        if (v5)
          v8 = v5;
        v9 = 136446466;
        v10 = v8;
        v11 = 1024;
        v12 = v4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s: failed to seal hash slot: %{darwin.errno}d", (uint8_t *)&v9, 0x12u);
      }
      *__error() = v6;
    }
  }
  else
  {
    v4 = 0;
  }
  a1[2] = v4;
  dispatch_async_f(*(dispatch_queue_t *)(v2 + 96), a1, (dispatch_function_t)sub_10001DE64);
  if (v3)
    os_release(v3);
}

void sub_100018134(void *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v5;
  NSObject *v6;

  v5 = sub_10003C89C(a1, 0x40uLL);
  v5[6] = a2;
  v5[7] = a3;
  v5[4] = xpc_array_create(0, 0);
  v6 = sub_100008E88();
  dispatch_async_f(v6, v5, (dispatch_function_t)sub_10001818C);
}

uint64_t sub_10001818C(void **a1)
{
  return sub_100017E54(*a1, (uint64_t)a1, (uint64_t)sub_10001E160);
}

uint64_t sub_1000181A0(uint64_t result, uint64_t a2)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = 0;
  v4 = result + 144;
  while (1)
  {
    v5 = *(_QWORD *)(v4 + 8 * v3);
    if (v5)
      break;
LABEL_5:
    if (v3++ >= 0x24)
      return result;
  }
  while (1)
  {
    result = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, v5 - 80);
    if ((result & 1) == 0)
      return result;
    v5 = *(_QWORD *)(v5 + 8);
    if (!v5)
      goto LABEL_5;
  }
}

void sub_100018200(uint64_t a1)
{
  uint64_t *v2;
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  int v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  void *v16;
  const char *v17;
  int v18;
  NSObject *v19;
  const char *v20;
  const char *v21;
  int v22;
  NSObject *v23;
  const char *v24;
  char *v25;
  char *v26;
  char *object;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  char *v31;

  object = (char *)sub_100008E6C();
  v2 = (uint64_t *)(a1 + 120);
  v3 = *(_QWORD *)(a1 + 120);
  if (v3)
  {
    do
    {
      v4 = *(NSObject **)(v3 + 40);
      v5 = *(const char **)(a1 + 56);
      v6 = *__error();
      v7 = *(NSObject **)(a1 + 72);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v8 = "[anonymous]";
        if (v5)
          v8 = v5;
        *(_DWORD *)buf = 136446210;
        v29 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%{public}s: uncorking import", buf, 0xCu);
      }
      *__error() = v6;
      v9 = *v2;
      if (*v2 == v3)
      {
        v13 = *(_QWORD *)(v3 + 24);
        *v2 = v13;
        v12 = a1 + 120;
        if (v13)
          goto LABEL_10;
      }
      else
      {
        do
        {
          v10 = v9;
          v9 = *(_QWORD *)(v9 + 24);
        }
        while (v9 != v3);
        v11 = *(_QWORD *)(v3 + 24);
        *(_QWORD *)(v10 + 24) = v11;
        v12 = v10 + 24;
        if (v11)
          goto LABEL_10;
      }
      *(_QWORD *)(a1 + 128) = v12;
LABEL_10:
      *(_QWORD *)(v3 + 24) = -1;
      dispatch_group_leave(v4);
      v3 = *v2;
    }
    while (*v2);
  }
  v14 = (char *)*((_QWORD *)object + 37);
  if (v14)
  {
    do
    {
      v15 = *(char **)v14;
      v16 = sub_100017DE4(a1, v14 + 8, 0);
      if (!v16)
      {
        v17 = *(const char **)(a1 + 56);
        v18 = *__error();
        v19 = *(NSObject **)(a1 + 72);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136446466;
          v20 = "[anonymous]";
          if (v17)
            v20 = v17;
          v29 = v20;
          v30 = 2080;
          v31 = v14 + 8;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "%{public}s: lingering forerunner: %s", buf, 0x16u);
        }
        *__error() = v18;
      }
      v21 = *(const char **)(a1 + 56);
      v22 = *__error();
      v23 = *(NSObject **)(a1 + 72);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        v24 = "[anonymous]";
        if (v21)
          v24 = v21;
        v29 = v24;
        v30 = 2080;
        v31 = v14 + 8;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "%{public}s: removing forerunner: %s", buf, 0x16u);
      }
      *__error() = v22;
      v25 = (char *)*((_QWORD *)object + 37);
      v26 = object + 296;
      while (v25 != v14)
      {
        v26 = v25;
        v25 = *(char **)v25;
      }
      *(_QWORD *)v26 = *(_QWORD *)v14;
      free(v14);
      if (v16)
        os_release(v16);
      v14 = v15;
    }
    while (v15);
  }
  sub_10000658C();
  dispatch_async_f(*(dispatch_queue_t *)(a1 + 96), 0, (dispatch_function_t)sub_100018968);
  *(_QWORD *)(a1 + 80) |= 2uLL;
  if (object)
    os_release(object);
}

uint64_t sub_1000184F4(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  DIR *v4;
  dirent *i;
  const char *d_name;
  const char *v7;
  int v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  _QWORD *v12;
  int v13;
  int v14;
  const char *v15;
  int v16;
  NSObject *v17;
  const char *v18;
  const char *v19;
  int v20;
  NSObject *v21;
  const char *v22;
  int v23;
  int v24;
  const char *v25;
  int v26;
  NSObject *v27;
  const char *v28;
  int v29;
  const char *v30;
  int v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t result;
  uint64_t v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;

  v3 = dup_np(*(unsigned int *)(a1 + a2[2]));
  v4 = fdopendir(v3);
  for (i = readdir(v4); i; i = readdir(v4))
  {
    d_name = i->d_name;
    if (strcmp(i->d_name, ".") && strcmp(d_name, ".."))
    {
      v7 = *(const char **)(a1 + 56);
      v8 = *__error();
      v9 = *(NSObject **)(a1 + 72);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        v10 = "[anonymous]";
        if (v7)
          v10 = v7;
        v40 = v10;
        v41 = 2080;
        v42 = d_name;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%{public}s: importing pre-existing cryptex: %s", buf, 0x16u);
      }
      *__error() = v8;
      v11 = openat(v3, d_name, 1048832);
      if ((v11 & 0x80000000) != 0)
      {
        v29 = *__error();
        v30 = *(const char **)(a1 + 56);
        v31 = *__error();
        v32 = *(NSObject **)(a1 + 72);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          v33 = "[anonymous]";
          if (v30)
            v33 = v30;
          v40 = v33;
          v41 = 2080;
          v42 = d_name;
          v43 = 1024;
          v44 = v29;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%{public}s: failed to open cryptex: %s: %{darwin.errno}d", buf, 0x1Cu);
        }
        *__error() = v31;
        if ((_DWORD)v11 != -1 && close(v11) == -1)
LABEL_42:
          sub_10003E474(&v38, buf);
      }
      else
      {
        v12 = (_QWORD *)cryptex_core_create(0);
        v13 = cryptex_core_set_assets_from_directory(v12, v11);
        if (v13)
        {
          v14 = v13;
          v15 = *(const char **)(a1 + 56);
          v16 = *__error();
          v17 = *(NSObject **)(a1 + 72);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446722;
            v18 = "[anonymous]";
            if (v15)
              v18 = v15;
            v40 = v18;
            v41 = 2080;
            v42 = d_name;
            v43 = 1024;
            v44 = v14;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}s: failed to create core from directory: %s: %{darwin.errno}d", buf, 0x1Cu);
          }
          *__error() = v16;
          if (v14 == 2)
          {
            v19 = *(const char **)(a1 + 56);
            v20 = *__error();
            v21 = *(NSObject **)(a1 + 72);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136446466;
              v22 = "[anonymous]";
              if (v19)
                v22 = v19;
              v40 = v22;
              v41 = 2080;
              v42 = d_name;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%{public}s: removing broken cryptex: %s", buf, 0x16u);
            }
            *__error() = v20;
            v23 = sub_10003ABE4(v3, d_name);
            if (v23)
            {
              v24 = v23;
              v25 = *(const char **)(a1 + 56);
              v26 = *__error();
              v27 = *(NSObject **)(a1 + 72);
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136446722;
                v28 = "[anonymous]";
                if (v25)
                  v28 = v25;
                v40 = v28;
                v41 = 2080;
                v42 = d_name;
                v43 = 1024;
                v44 = v24;
                _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%{public}s: failed to remove core directory: %s: %{darwin.errno}d", buf, 0x1Cu);
              }
              *__error() = v26;
            }
          }
        }
        else
        {
          if ((*a2 & 1) != 0)
            v34 = 1;
          else
            v34 = 2;
          cryptex_core_set_nonce_persistence(v12, v34);
          dispatch_group_enter(*(dispatch_group_t *)(a1 + 104));
          v35 = sub_10003C89C((void *)a1, 0x98uLL);
          v35[17] = sub_100018A40;
          sub_100018C74(a1, v12, v35);
        }
        if (close(v11) == -1)
          goto LABEL_42;
        if (v12)
          os_release(v12);
      }
    }
  }
  result = closedir(v4);
  if ((_DWORD)result == -1)
    sub_10003E404(&v38, buf);
  return result;
}

void sub_100018968()
{
  _DWORD *v0;
  int v1;
  int v2;
  BOOL v3;
  void *v4;
  uint64_t v5;
  _OWORD v6[5];

  v0 = sub_100008E6C();
  v1 = openat(v0[23], "init", 2560, 438);
  if ((v1 & 0x80000000) == 0)
    *__error() = 0;
  v2 = *__error();
  if (v2)
    v3 = v2 == 17;
  else
    v3 = 1;
  if (!v3)
    sub_10003F328(&v5, v6);
  v4 = (void *)*((_QWORD *)v0 + 41);
  if (v4)
    os_release(v4);
  *((_QWORD *)v0 + 41) = 0;
  if (v1 != -1 && close(v1) == -1)
    sub_10003E474(&v5, v6);
  os_release(v0);
}

void sub_100018A40(uint64_t a1, void *a2, _QWORD *a3, const void *a4)
{
  void *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  int v12;
  NSObject *v13;
  const char *v14;
  const char *v15;
  char *v16;
  CFErrorRef v17;
  _QWORD *v18;
  uint8_t buf[4];
  const char *v20;

  if (a4)
  {
    v7 = *(void **)(a1 + 72);
    if (v7)
    {
      if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR))
        v8 = 3;
      else
        v8 = 2;
      v9 = *(const char **)(a1 + 56);
      if (!v9)
        v9 = "[anonymous]";
      *(_DWORD *)buf = 136446210;
      v20 = v9;
      v10 = v7;
    }
    else
    {
      v15 = *(const char **)(a1 + 56);
      if (!v15)
        v15 = "[anonymous]";
      *(_DWORD *)buf = 136446210;
      v20 = v15;
      v10 = &_os_log_default;
      v8 = 2;
    }
    v16 = (char *)_os_log_send_and_compose_impl(v8, 0, 0, 0, &_mh_execute_header, v10, 16);
    v17 = sub_10000A6F8("_codex_import_initial_continue", "codex.c", 1907, "com.apple.security.cryptex", 15, a4, v16);
    free(v16);
    v18 = sub_10003C89C((void *)a1, 0x20uLL);
    v18[3] = os_retain(a2);
    dispatch_async_f(*(dispatch_queue_t *)(a1 + 96), v18, (dispatch_function_t)sub_10001B7B4);
    if (v17)
      CFRelease(v17);
  }
  else
  {
    v12 = *__error();
    v13 = *(NSObject **)(a1 + 72);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = (const char *)a3[26];
      *(_DWORD *)buf = 136315138;
      v20 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "imported: %s [no error]", buf, 0xCu);
    }
    *__error() = v12;
    sub_100017648(a1, a3, 0, (uint64_t)sub_10001B690);
  }
}

void sub_100018C74(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  _BYTE *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t asset;
  BOOL v10;
  _BOOL8 v11;
  _QWORD *v12;
  uint64_t image_asset;
  int v14;
  uint64_t info_asset;
  uint64_t v16;
  const char *v17;
  int v18;
  NSObject *v19;
  const char *v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  int v27;
  NSObject *v28;
  const char *v29;
  __darwin_ino64_t v30;
  const char *v31;
  int v32;
  NSObject *v33;
  const char *v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  __int16 v42;
  int v43;
  stat v44;

  v6 = sub_100008E6C();
  sub_100008E78();
  v7 = dispatch_group_create();
  dispatch_set_context(v7, a3);
  a3[4] = os_retain(a2);
  a3[5] = v7;
  v8 = a2[21];
  asset = cryptex_core_get_asset(a2, &_cryptex_asset_type_im4m);
  if (os_variant_allows_internal_security_policies("com.apple.security.cryptexd")
    && v8
    && (*(_BYTE *)(v8 + 40) & 4) != 0
    || asset
    && ((memset(&v44, 0, sizeof(v44)), !fstat(*(_DWORD *)(asset + 16), &v44)) ? (v10 = v44.st_size == 0) : (v10 = 0),
        v10 && os_variant_allows_internal_security_policies("com.apple.security.cryptexd")))
  {
    a2[5] |= 1uLL;
  }
  dispatch_group_enter(v7);
  if (os_variant_allows_internal_security_policies("com.apple.security.cryptexd"))
    v11 = v6[176] == 0;
  else
    v11 = 0;
  v12 = (_QWORD *)cryptex_magister_create(a2, v11);
  cryptex_set_target_object(v12, a1);
  image_asset = cryptex_core_get_image_asset(a2);
  v14 = cryptex_asset_evaluate(image_asset, v6 + 128);
  if (v14)
  {
    v35 = v14;
    v39 = 0;
    memset(&v44, 0, 80);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      v36 = 3;
    else
      v36 = 2;
    v37 = *(_QWORD *)(*(_QWORD *)(image_asset + 8) + 40);
    v40 = 136315394;
    v41 = v37;
    v42 = 1024;
    v43 = v35;
    v38 = _os_log_send_and_compose_impl(v36, &v39, &v44, 80, &_mh_execute_header, &_os_log_default, 16);
    _os_crash_msg(v39, v38);
    __break(1u);
  }
  info_asset = cryptex_core_get_info_asset(a2);
  v16 = info_asset;
  if ((*(_BYTE *)(v12[11] + 40) & 1) == 0)
  {
    if (cryptex_core_image_authapfs_enabled(a2))
    {
      v17 = *(const char **)(a1 + 56);
      v18 = *__error();
      v19 = *(NSObject **)(a1 + 72);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        v20 = "[anonymous]";
        if (v17)
          v20 = v17;
        v44.st_dev = 136446210;
        *(_QWORD *)&v44.st_mode = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "%{public}s: AuthAPFS enabled, skip up-front dmg authentication.", (uint8_t *)&v44, 0xCu);
      }
      *__error() = v18;
      if (v16)
        goto LABEL_23;
      goto LABEL_31;
    }
LABEL_30:
    dispatch_group_enter(v7);
    cryptex_magister_authenticate(v12, *(_QWORD *)(v12[11] + 176), a3, sub_1000191D0);
    if (v16)
    {
LABEL_23:
      dispatch_group_enter(v7);
      cryptex_magister_authenticate(v12, *(_QWORD *)(v16 + 8), a3, sub_100019330);
LABEL_36:
      dispatch_group_enter(v7);
      cryptex_magister_record_property(v12, "atad", a3, sub_10001948C);
      goto LABEL_37;
    }
LABEL_31:
    v26 = *(const char **)(a1 + 56);
    v27 = *__error();
    v28 = *(NSObject **)(a1 + 72);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      v29 = "[anonymous]";
      v30 = _cryptex_asset_type_c411[5];
      if (v26)
        v29 = v26;
      v44.st_dev = 136446466;
      *(_QWORD *)&v44.st_mode = v29;
      WORD2(v44.st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&v44.st_ino + 6) = v30;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "%{public}s: will use adhoc %s, skip authenticating it", (uint8_t *)&v44, 0x16u);
    }
    *__error() = v27;
    goto LABEL_36;
  }
  if (info_asset)
  {
    v21 = sub_10003BC08(*(_DWORD *)(info_asset + 16), a3 + 9);
    if (v21)
    {
      v22 = v21;
      v39 = 0;
      memset(&v44, 0, 80);
      v6 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        v23 = 3;
      else
        v23 = 2;
      v24 = *(_QWORD *)(*(_QWORD *)(v16 + 8) + 40);
      v40 = 136315394;
      v41 = v24;
      v42 = 1024;
      v43 = v22;
      v25 = _os_log_send_and_compose_impl(v23, &v39, &v44, 80, &_mh_execute_header, &_os_log_default, 16);
      _os_crash_msg(v39, v25);
      __break(1u);
      goto LABEL_30;
    }
  }
LABEL_37:
  if ((*(_BYTE *)(a1 + 80) & 2) == 0 && a3[18])
  {
    v31 = *(const char **)(a1 + 56);
    v32 = *__error();
    v33 = *(NSObject **)(a1 + 72);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      v34 = "[anonymous]";
      if (v31)
        v34 = v31;
      v44.st_dev = 136446210;
      *(_QWORD *)&v44.st_mode = v34;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "%{public}s: corking import", (uint8_t *)&v44, 0xCu);
    }
    *__error() = v32;
    a3[3] = 0;
    **(_QWORD **)(a1 + 128) = a3;
    *(_QWORD *)(a1 + 128) = a3 + 3;
    dispatch_group_enter(v7);
  }
  a3[16] = sub_100015FEC(a1, (uint64_t)"import");
  dispatch_group_notify_f(v7, *(dispatch_queue_t *)(a1 + 32), a3, (dispatch_function_t)sub_10001963C);
  dispatch_group_leave(v7);
  cryptex_activate(v12);
  if (v7)
    os_release(v7);
  os_release(v12);
  if (v6)
    os_release(v6);
}

void sub_1000191D0(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4, uint64_t *a5)
{
  uint64_t v8;
  NSObject *v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  CFTypeRef v14;
  uint64_t v15;
  uint64_t v16;
  int *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const void *v23;

  v8 = *a5;
  v9 = a5[5];
  v10 = *__error();
  v11 = *(NSObject **)(v8 + 72);
  if (a4)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a2 + 40);
      v12 = *(_QWORD *)(a2 + 48);
      v18 = 136315650;
      v19 = v12;
      v20 = 2080;
      v21 = v13;
      v22 = 2112;
      v23 = a4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s (%s) authentication: %@", (uint8_t *)&v18, 0x20u);
    }
    *__error() = v10;
    v14 = CFRetain(a4);
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v16 = *(_QWORD *)(a2 + 40);
      v15 = *(_QWORD *)(a2 + 48);
      v18 = 136315394;
      v19 = v15;
      v20 = 2080;
      v21 = v16;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s (%s) authentication [no error]", (uint8_t *)&v18, 0x16u);
    }
    v17 = __error();
    v14 = 0;
    *v17 = v10;
  }
  a5[7] = (uint64_t)v14;
  dispatch_group_leave(v9);
}

void sub_100019330(uint64_t a1, uint64_t a2, __n128 *a3, const void *a4, uint64_t *a5)
{
  uint64_t v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  const void *v18;

  v9 = *a5;
  v10 = a5[5];
  v11 = *__error();
  v12 = *(NSObject **)(v9 + 72);
  if (a4)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a2 + 40);
      v15 = 136315394;
      v16 = v13;
      v17 = 2112;
      v18 = a4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s authentication: %@", (uint8_t *)&v15, 0x16u);
    }
    *__error() = v11;
    a5[8] = (uint64_t)CFRetain(a4);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v14 = *(_QWORD *)(a2 + 40);
      v15 = 136315138;
      v16 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%s authentication [no error]", (uint8_t *)&v15, 0xCu);
    }
    *__error() = v11;
    a5[8] = 0;
    sub_10003C444((__n128 *)(a5 + 9), a3);
  }
  dispatch_group_leave(v10);
}

void sub_10001948C(uint64_t a1, _QWORD *a2, const void *a3, _QWORD *a4)
{
  NSObject *v6;
  const char *v7;
  int v8;
  NSObject *v9;
  const char *v10;
  CFTypeRef v11;
  const char *v12;
  int v13;
  NSObject *v14;
  const char *v15;
  char v16;
  uint8_t buf[4];
  const char *v18;

  v16 = 0;
  v6 = a4[5];
  if (!a2)
  {
    v12 = *(const char **)(a4[4] + 16);
    v13 = *__error();
    v14 = *(NSObject **)(a4[4] + 32);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = "[anonymous]";
      if (v12)
        v15 = v12;
      *(_DWORD *)buf = 136446210;
      v18 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%{public}s: im4m missing DataOnly property", buf, 0xCu);
    }
    *__error() = v13;
    if (a3)
      goto LABEL_10;
LABEL_16:
    v11 = 0;
    goto LABEL_17;
  }
  __memcpy_chk(&v16, *a2, a2[1], 1);
  if (v16)
  {
    v7 = *(const char **)(a4[4] + 16);
    v8 = *__error();
    v9 = *(NSObject **)(a4[4] + 32);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = "[anonymous]";
      if (v7)
        v10 = v7;
      *(_DWORD *)buf = 136446210;
      v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%{public}s: im4m marked as DataOnly.", buf, 0xCu);
    }
    *__error() = v8;
    if (v16)
      *(_QWORD *)(a4[4] + 40) |= 4uLL;
  }
  if (!a3)
    goto LABEL_16;
LABEL_10:
  v11 = CFRetain(a3);
LABEL_17:
  a4[6] = v11;
  dispatch_group_leave(v6);
}

void sub_10001963C(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  char *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  const char *v16;
  char *v17;
  char *v18;
  const char *v19;
  int v20;
  CFIndex v21;
  const void *v22;
  uint64_t info_asset;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  char *v28;
  void *v29;
  const char *v30;
  CFErrorRef v31;
  void *v32;
  _QWORD *v33;
  void *v34;
  void *v35;
  void (*v36)(void *, _QWORD, _QWORD *, CFErrorRef);
  void *v37;
  const char *v38;
  int v39;
  NSObject *v40;
  const char *v41;
  const char *identifier;
  char *version;
  xpc_object_t v44;
  xpc_object_t v45;
  xpc_object_t v46;
  _QWORD *v47;
  const char *v48;
  int v49;
  NSObject *v50;
  const char *v51;
  void *v52;
  char *v53;
  _QWORD *v54;
  _QWORD *v55;
  void *v56;
  _QWORD *v57;
  int v58;
  const char *v59;
  int v60;
  NSObject *v61;
  const char *v62;
  _QWORD *v63;
  _QWORD *i;
  void *v65;
  char *v66;
  char *v67;
  void *v68;
  _BOOL4 v69;
  const char *v70;
  uint64_t v71;
  const char *v72;
  void *v73;
  const char *v74;
  char *v75;
  void *v76;
  uint64_t v77;
  const char *v78;
  void *v79;
  uint64_t v80;
  _BOOL4 v81;
  int v82;
  int v83;
  char *v84;
  void *v85;
  uint64_t v86;
  const char *v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  const char *v92;
  void *v93;
  const char *v94;
  char *v95;
  CFIndex v96;
  int v97;
  int v98;
  int v99;
  char *v100;
  void *v101;
  uint64_t v102;
  const char *v103;
  void *v104;
  const char *v105;
  int v106;
  NSObject *v107;
  const char *v108;
  const char *v109;
  char *v110;
  const char *v111;
  char *v112;
  const char *v113;
  int v114;
  int v115;
  void *v116;
  uint64_t v117;
  const char *v118;
  void *v119;
  void *v120;
  uint64_t v121;
  const char *v122;
  void *v123;
  _BOOL4 v124;
  const char *v125;
  const char *v126;
  char *v127;
  const char *v128;
  int v129;
  CFIndex v130;
  const char *v131;
  void *v132;
  uint64_t v133;
  const char *v134;
  void *v135;
  void *v136;
  uint64_t v137;
  const char *v138;
  void *v139;
  const char *v140;
  const char *v141;
  void *object;
  char *v143;
  void *v144;
  char *v145;
  const void *v146;
  const void *v147;
  char *v148;
  _QWORD *v149;
  CFTypeRef cf;
  _QWORD *context;
  BOOL v152;
  void *v153;
  __int128 v154;
  xpc_object_t xdict[2];
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  uint64_t v163;
  __n128 v164[3];
  uint64_t v165;
  xpc_object_t values[2];
  __int128 keys;
  int buf;
  const char *v169;
  __int16 v170;
  char *v171;
  __int16 v172;
  char *v173;

  v2 = *(void **)a1;
  v3 = *(_QWORD **)(a1 + 32);
  v5 = *(const void **)(a1 + 48);
  v4 = *(const void **)(a1 + 56);
  v6 = *(const void **)(a1 + 64);
  v165 = 0;
  memset(v164, 0, sizeof(v164));
  v163 = 0;
  v162 = 0u;
  v160 = 0u;
  v161 = 0u;
  v158 = 0u;
  v159 = 0u;
  v156 = 0u;
  v157 = 0u;
  v154 = 0u;
  *(_OWORD *)xdict = 0u;
  context = *(_QWORD **)(a1 + 144);
  v153 = 0;
  v152 = 0;
  sub_100008E78();
  sub_10003C444(v164, (__n128 *)(a1 + 72));
  cf = v6;
  if (v4)
  {
    v7 = (void *)*((_QWORD *)v2 + 9);
    if (v7)
    {
      if (os_log_type_enabled(*((os_log_t *)v2 + 9), OS_LOG_TYPE_ERROR))
        v8 = 3;
      else
        v8 = 2;
      v9 = (const char *)*((_QWORD *)v2 + 7);
      v10 = *(char **)(v3[22] + 40);
      if (!v9)
        v9 = "[anonymous]";
      buf = 136446466;
      v169 = v9;
      v170 = 2080;
      v171 = v10;
      v11 = v7;
    }
    else
    {
      v16 = "[anonymous]";
      if (*((_QWORD *)v2 + 7))
        v16 = (const char *)*((_QWORD *)v2 + 7);
      v17 = *(char **)(v3[22] + 40);
      buf = 136446466;
      v169 = v16;
      v170 = 2080;
      v171 = v17;
      v11 = &_os_log_default;
      v8 = 2;
    }
    v18 = (char *)_os_log_send_and_compose_impl(v8, 0, 0, 0, &_mh_execute_header, v11, 16);
    v19 = "com.apple.security.cryptex";
    v20 = 614;
    v21 = 14;
    v22 = v4;
LABEL_34:
    v31 = sub_10000A6F8("_codex_import_core_continue", "codex.c", v20, v19, v21, v22, v18);
    free(v18);
    v32 = 0;
LABEL_35:
    v33 = 0;
LABEL_36:
    v34 = 0;
    goto LABEL_37;
  }
  if (v5)
  {
    v12 = (void *)*((_QWORD *)v2 + 9);
    if (v12)
    {
      if (os_log_type_enabled(*((os_log_t *)v2 + 9), OS_LOG_TYPE_ERROR))
        v13 = 3;
      else
        v13 = 2;
      v14 = (const char *)*((_QWORD *)v2 + 7);
      if (!v14)
        v14 = "[anonymous]";
      buf = 136446210;
      v169 = v14;
      v15 = v12;
    }
    else
    {
      v30 = (const char *)*((_QWORD *)v2 + 7);
      if (!v30)
        v30 = "[anonymous]";
      buf = 136446210;
      v169 = v30;
      v15 = &_os_log_default;
      v13 = 2;
    }
    v18 = (char *)_os_log_send_and_compose_impl(v13, 0, 0, 0, &_mh_execute_header, v15, 16);
    v19 = "com.apple.security.cryptex";
    v20 = 623;
    v21 = 14;
    v22 = v5;
    goto LABEL_34;
  }
  info_asset = cryptex_core_get_info_asset(v3);
  if (info_asset)
  {
    if (v6)
    {
      v24 = info_asset;
      v25 = (void *)*((_QWORD *)v2 + 9);
      if (v25)
      {
        if (os_log_type_enabled(*((os_log_t *)v2 + 9), OS_LOG_TYPE_ERROR))
          v26 = 3;
        else
          v26 = 2;
        v27 = (const char *)*((_QWORD *)v2 + 7);
        v28 = *(char **)(*(_QWORD *)(v24 + 8) + 40);
        if (!v27)
          v27 = "[anonymous]";
        buf = 136446466;
        v169 = v27;
        v170 = 2080;
        v171 = v28;
        v29 = v25;
      }
      else
      {
        v74 = "[anonymous]";
        if (*((_QWORD *)v2 + 7))
          v74 = (const char *)*((_QWORD *)v2 + 7);
        v75 = *(char **)(*(_QWORD *)(info_asset + 8) + 40);
        buf = 136446466;
        v169 = v74;
        v170 = 2080;
        v171 = v75;
        v29 = &_os_log_default;
        v26 = 2;
      }
      v18 = (char *)_os_log_send_and_compose_impl(v26, 0, 0, 0, &_mh_execute_header, v29, 16);
      v19 = "com.apple.security.cryptex";
      v20 = 634;
      v21 = 14;
      v22 = v6;
      goto LABEL_34;
    }
    v65 = (void *)xpc_create_from_plist(v164[0].n128_u64[0]);
    if (!v65)
    {
      v76 = (void *)*((_QWORD *)v2 + 9);
      if (v76)
      {
        if (os_log_type_enabled(*((os_log_t *)v2 + 9), OS_LOG_TYPE_ERROR))
          v77 = 3;
        else
          v77 = 2;
        v78 = (const char *)*((_QWORD *)v2 + 7);
        if (!v78)
          v78 = "[anonymous]";
        buf = 136446466;
        v169 = v78;
        v170 = 1024;
        LODWORD(v171) = 212;
        v79 = v76;
      }
      else
      {
        v113 = (const char *)*((_QWORD *)v2 + 7);
        if (!v113)
          v113 = "[anonymous]";
        buf = 136446466;
        v169 = v113;
        v170 = 1024;
        LODWORD(v171) = 212;
        v79 = &_os_log_default;
        v77 = 2;
      }
      v18 = (char *)_os_log_send_and_compose_impl(v77, 0, 0, 0, &_mh_execute_header, v79, 16);
      v19 = "com.apple.security.cryptex.posix";
      v20 = 642;
      v21 = 212;
      v22 = 0;
      goto LABEL_34;
    }
    v32 = v65;
    if (xpc_get_type(v65) != (xpc_type_t)&_xpc_type_dictionary)
    {
      v66 = xpc_copy_description(v32);
      v67 = v66;
      v68 = (void *)*((_QWORD *)v2 + 9);
      if (v68)
      {
        v69 = os_log_type_enabled(*((os_log_t *)v2 + 9), OS_LOG_TYPE_ERROR);
        v70 = (const char *)*((_QWORD *)v2 + 7);
        if (v69)
          v71 = 3;
        else
          v71 = 2;
        buf = 136446722;
        if (v70)
          v72 = v70;
        else
          v72 = "[anonymous]";
        v169 = v72;
        v170 = 2080;
        v171 = v67;
        v172 = 1024;
        LODWORD(v173) = 212;
        v73 = v68;
      }
      else
      {
        v111 = "[anonymous]";
        if (*((_QWORD *)v2 + 7))
          v111 = (const char *)*((_QWORD *)v2 + 7);
        buf = 136446722;
        v169 = v111;
        v170 = 2080;
        v171 = v66;
        v172 = 1024;
        LODWORD(v173) = 212;
        v73 = &_os_log_default;
        v71 = 2;
      }
      v95 = (char *)_os_log_send_and_compose_impl(v71, 0, 0, 0, &_mh_execute_header, v73, 16);
      v97 = 652;
      v96 = 212;
LABEL_161:
      v31 = sub_10000A6F8("_codex_import_core_continue", "codex.c", v97, "com.apple.security.cryptex.posix", v96, 0, v95);
      free(v95);
      v112 = v67;
LABEL_162:
      free(v112);
      goto LABEL_35;
    }
    if (!os_log_type_enabled(*((os_log_t *)v2 + 9), OS_LOG_TYPE_DEBUG))
    {
      v52 = v32;
      v47 = context;
      if (context)
        goto LABEL_114;
      goto LABEL_76;
    }
    v53 = xpc_copy_description(v32);
    v105 = (const char *)*((_QWORD *)v2 + 7);
    v106 = *__error();
    v107 = *((_QWORD *)v2 + 9);
    if (os_log_type_enabled(v107, OS_LOG_TYPE_DEBUG))
    {
      v108 = "[anonymous]";
      if (v105)
        v108 = v105;
      buf = 136446466;
      v169 = v108;
      v170 = 2080;
      v171 = v53;
      _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_DEBUG, "%{public}s: importing Info.plist: %s", (uint8_t *)&buf, 0x16u);
    }
    *__error() = v106;
    v52 = v32;
    v4 = 0;
    v5 = 0;
    v47 = context;
  }
  else
  {
    v38 = (const char *)*((_QWORD *)v2 + 7);
    v39 = *__error();
    v40 = *((_QWORD *)v2 + 9);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      v41 = "[anonymous]";
      if (v38)
        v41 = v38;
      buf = 136446210;
      v169 = v41;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "%{public}s: no Info.plist found in core, generating adhoc one", (uint8_t *)&buf, 0xCu);
    }
    *__error() = v39;
    identifier = (const char *)cryptex_core_generate_identifier(v3);
    version = (char *)cryptex_core_generate_version(v3);
    v148 = (char *)identifier;
    v44 = xpc_string_create(identifier);
    v45 = xpc_string_create(version);
    keys = *(_OWORD *)off_100056210;
    values[0] = v44;
    values[1] = v45;
    v46 = xpc_dictionary_create((const char *const *)&keys, values, 2uLL);
    v47 = context;
    if (os_log_type_enabled(*((os_log_t *)v2 + 9), OS_LOG_TYPE_DEBUG))
    {
      v143 = version;
      v145 = xpc_copy_description(v46);
      v48 = (const char *)*((_QWORD *)v2 + 7);
      v49 = *__error();
      v50 = *((_QWORD *)v2 + 9);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
      {
        v51 = "[anonymous]";
        if (v48)
          v51 = v48;
        buf = 136446466;
        v169 = v51;
        v170 = 2080;
        v171 = v145;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEBUG, "%{public}s: generated Info.plist: %s", (uint8_t *)&buf, 0x16u);
      }
      *__error() = v49;
      free(v145);
      version = v143;
    }
    if (v45)
      os_release(v45);
    v5 = 0;
    v4 = 0;
    if (v44)
      os_release(v44);
    free(version);
    v32 = 0;
    v52 = v46;
    v53 = v148;
  }
  free(v53);
  if (v47)
    goto LABEL_114;
LABEL_76:
  v144 = v52;
  v146 = v5;
  v147 = v4;
  v54 = sub_100008E6C();
  v149 = v54 + 37;
  object = v54;
  v55 = (_QWORD *)v54[37];
  while (v55)
  {
    v56 = v32;
    v57 = (_QWORD *)*v55;
    v58 = memcmp((const void *)(v3[20] + 112), (char *)v55 + 3335, 0x30uLL);
    if (!v58)
    {
      v59 = (const char *)*((_QWORD *)v2 + 7);
      v60 = *__error();
      v61 = *((_QWORD *)v2 + 9);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
      {
        buf = 136446722;
        v62 = "[anonymous]";
        if (v59)
          v62 = v59;
        v169 = v62;
        v170 = 2080;
        v171 = (char *)(v55 + 1);
        v172 = 2080;
        v173 = (char *)v55 + 3383;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEBUG, "%{public}s: found forerunner; will carry on the legacy: name = %s, hash = %s",
          (uint8_t *)&buf,
          0x20u);
      }
      *__error() = v60;
      v63 = v149;
      for (i = (_QWORD *)*v149; i != v55; i = (_QWORD *)*i)
        v63 = i;
      *v63 = *v55;
      *v55 = -1;
      v47 = v55;
    }
    v55 = v57;
    v32 = v56;
    if (!v58)
      goto LABEL_111;
  }
  v47 = 0;
LABEL_111:
  if (object)
    os_release(object);
  v153 = v47;
  v5 = v146;
  v4 = v147;
  v47 = context;
  v52 = v144;
LABEL_114:
  v80 = v3[27];
  if (v80)
    v81 = *(unsigned __int8 *)(v80 + 64) != 0;
  else
    v81 = 0;
  v82 = sub_10002B548(v52, &v153, (uint64_t)&v154, v81);
  if (v82)
  {
    v83 = v82;
    v84 = xpc_copy_description(v52);
    v67 = v84;
    v85 = (void *)*((_QWORD *)v2 + 9);
    if (v85)
    {
      if (os_log_type_enabled(*((os_log_t *)v2 + 9), OS_LOG_TYPE_ERROR))
        v86 = 3;
      else
        v86 = 2;
      v87 = (const char *)*((_QWORD *)v2 + 7);
      buf = 136446722;
      if (!v87)
        v87 = "[anonymous]";
      v169 = v87;
      v170 = 2080;
      v171 = v67;
      v172 = 1024;
      LODWORD(v173) = v83;
      v88 = v85;
    }
    else
    {
      v94 = (const char *)*((_QWORD *)v2 + 7);
      if (!v94)
        v94 = "[anonymous]";
      buf = 136446722;
      v169 = v94;
      v170 = 2080;
      v171 = v84;
      v172 = 1024;
      LODWORD(v173) = v83;
      v88 = &_os_log_default;
      v86 = 2;
    }
    v95 = (char *)_os_log_send_and_compose_impl(v86, 0, 0, 0, &_mh_execute_header, v88, 16);
    v96 = v83;
    v97 = 686;
    goto LABEL_161;
  }
  v89 = sub_100017DE4((uint64_t)v2, (char *)v154, 0);
  if (v89)
  {
    v34 = v89;
    v47[4] = os_retain(v89);
    v90 = (void *)*((_QWORD *)v2 + 9);
    if (v90)
    {
      if (os_log_type_enabled(*((os_log_t *)v2 + 9), OS_LOG_TYPE_ERROR))
        v91 = 3;
      else
        v91 = 2;
      v92 = (const char *)*((_QWORD *)v2 + 7);
      if (!v92)
        v92 = "[anonymous]";
      buf = 136446466;
      v169 = v92;
      v170 = 2080;
      v171 = (char *)v154;
      v93 = v90;
    }
    else
    {
      v109 = (const char *)*((_QWORD *)v2 + 7);
      if (!v109)
        v109 = "[anonymous]";
      buf = 136446466;
      v169 = v109;
      v170 = 2080;
      v171 = (char *)v154;
      v93 = &_os_log_default;
      v91 = 2;
    }
    v110 = (char *)_os_log_send_and_compose_impl(v91, 0, 0, 0, &_mh_execute_header, v93, 16);
    v31 = sub_10000A6F8("_codex_import_core_continue", "codex.c", 696, "com.apple.security.cryptex", 17, 0, v110);
    free(v110);
    v33 = 0;
    goto LABEL_37;
  }
  if (xpc_dictionary_get_array(xdict[1], "Dependencies"))
  {
    if (!v47)
    {
      v120 = (void *)*((_QWORD *)v2 + 9);
      if (v120)
      {
        if (os_log_type_enabled(*((os_log_t *)v2 + 9), OS_LOG_TYPE_ERROR))
          v121 = 3;
        else
          v121 = 2;
        v122 = (const char *)*((_QWORD *)v2 + 7);
        if (!v122)
          v122 = "[anonymous]";
        buf = 136446466;
        v169 = v122;
        v170 = 1024;
        LODWORD(v171) = 45;
        v123 = v120;
      }
      else
      {
        v126 = (const char *)*((_QWORD *)v2 + 7);
        if (!v126)
          v126 = "[anonymous]";
        buf = 136446466;
        v169 = v126;
        v170 = 1024;
        LODWORD(v171) = 45;
        v123 = &_os_log_default;
        v121 = 2;
      }
      v127 = (char *)_os_log_send_and_compose_impl(v121, 0, 0, 0, &_mh_execute_header, v123, 16);
      v128 = "com.apple.security.cryptex.posix";
      v129 = 708;
      v130 = 45;
      goto LABEL_207;
    }
    v98 = sub_10002BA54((uint64_t)&v154, *((unsigned int *)v47 + 16));
    if (v98)
    {
      v99 = v98;
      v100 = xpc_copy_description(v52);
      v67 = v100;
      v101 = (void *)*((_QWORD *)v2 + 9);
      if (v101)
      {
        if (os_log_type_enabled(*((os_log_t *)v2 + 9), OS_LOG_TYPE_ERROR))
          v102 = 3;
        else
          v102 = 2;
        v103 = (const char *)*((_QWORD *)v2 + 7);
        buf = 136446722;
        if (!v103)
          v103 = "[anonymous]";
        v169 = v103;
        v170 = 2080;
        v171 = v67;
        v172 = 1024;
        LODWORD(v173) = v99;
        v104 = v101;
      }
      else
      {
        v125 = (const char *)*((_QWORD *)v2 + 7);
        if (!v125)
          v125 = "[anonymous]";
        buf = 136446722;
        v169 = v125;
        v170 = 2080;
        v171 = v100;
        v172 = 1024;
        LODWORD(v173) = v99;
        v104 = &_os_log_default;
        v102 = 2;
      }
      v95 = (char *)_os_log_send_and_compose_impl(v102, 0, 0, 0, &_mh_execute_header, v104, 16);
      v96 = v99;
      v97 = 720;
      goto LABEL_161;
    }
  }
  if ((_BYTE)v163)
  {
    v114 = sub_10000F808(&v152);
    if (v114)
    {
      v115 = v114;
      v116 = (void *)*((_QWORD *)v2 + 9);
      if (v116)
      {
        if (os_log_type_enabled(*((os_log_t *)v2 + 9), OS_LOG_TYPE_ERROR))
          v117 = 3;
        else
          v117 = 2;
        v118 = (const char *)*((_QWORD *)v2 + 7);
        if (!v118)
          v118 = "[anonymous]";
        buf = 136446466;
        v169 = v118;
        v170 = 1024;
        LODWORD(v171) = v115;
        v119 = v116;
      }
      else
      {
        v131 = (const char *)*((_QWORD *)v2 + 7);
        if (!v131)
          v131 = "[anonymous]";
        buf = 136446466;
        v169 = v131;
        v170 = 1024;
        LODWORD(v171) = v114;
        v119 = &_os_log_default;
        v117 = 2;
      }
      v127 = (char *)_os_log_send_and_compose_impl(v117, 0, 0, 0, &_mh_execute_header, v119, 16);
      v130 = v115;
      v128 = "com.apple.security.cryptex.posix";
      v129 = 729;
LABEL_207:
      v31 = sub_10000A6F8("_codex_import_core_continue", "codex.c", v129, v128, v130, 0, v127);
      v112 = v127;
      goto LABEL_162;
    }
    if (!v152)
    {
      v132 = (void *)*((_QWORD *)v2 + 9);
      if (v132)
      {
        if (os_log_type_enabled(*((os_log_t *)v2 + 9), OS_LOG_TYPE_ERROR))
          v133 = 3;
        else
          v133 = 2;
        v134 = (const char *)*((_QWORD *)v2 + 7);
        if (!v134)
          v134 = "[anonymous]";
        buf = 136446466;
        v169 = v134;
        v170 = 2082;
        v171 = (char *)v154;
        v135 = v132;
      }
      else
      {
        v140 = (const char *)*((_QWORD *)v2 + 7);
        if (!v140)
          v140 = "[anonymous]";
        buf = 136446466;
        v169 = v140;
        v170 = 2082;
        v171 = (char *)v154;
        v135 = &_os_log_default;
        v133 = 2;
      }
      v127 = (char *)_os_log_send_and_compose_impl(v133, 0, 0, 0, &_mh_execute_header, v135, 16);
      v128 = "com.apple.security.cryptex";
      v129 = 735;
      v130 = 20;
      goto LABEL_207;
    }
  }
  v124 = xpc_dictionary_get_BOOL(xdict[1], "NoCode");
  if (cryptex_core_is_cryptex1(v3) && (v3[5] & 1) == 0 && ((v124 ^ ((v3[5] & 4) == 0)) & 1) == 0)
  {
    v136 = (void *)*((_QWORD *)v2 + 9);
    if (v136)
    {
      if (os_log_type_enabled(*((os_log_t *)v2 + 9), OS_LOG_TYPE_ERROR))
        v137 = 3;
      else
        v137 = 2;
      v138 = (const char *)*((_QWORD *)v2 + 7);
      if (!v138)
        v138 = "[anonymous]";
      buf = 136446210;
      v169 = v138;
      v139 = v136;
    }
    else
    {
      v141 = (const char *)*((_QWORD *)v2 + 7);
      if (!v141)
        v141 = "[anonymous]";
      buf = 136446210;
      v169 = v141;
      v139 = &_os_log_default;
      v137 = 2;
    }
    v127 = (char *)_os_log_send_and_compose_impl(v137, 0, 0, 0, &_mh_execute_header, v139, 16);
    v128 = "com.apple.security.cryptex";
    v129 = 757;
    v130 = 11;
    goto LABEL_207;
  }
  if (v124 || (v3[5] & 4) != 0)
    sub_10002BE30((uint64_t)&v154);
  v33 = (_QWORD *)sub_10002BE3C(v2, v3, (uint64_t *)&v154, 4);
  cryptex_set_target_object(v33, v2);
  cryptex_activate(v33);
  sub_10001ABC8((uint64_t)v2, v33);
  if (!context)
  {
    v31 = 0;
    goto LABEL_36;
  }
  v31 = 0;
  v34 = 0;
  context[4] = os_retain(v33);
LABEL_37:
  sub_10003C630(v164);
  sub_10002B424((uint64_t)&v154);
  v35 = *(void **)(a1 + 32);
  v37 = *(void **)(a1 + 128);
  v36 = *(void (**)(void *, _QWORD, _QWORD *, CFErrorRef))(a1 + 136);
  if (v36)
    v36(v2, *(_QWORD *)(a1 + 32), v33, v31);
  sub_10001B110((uint64_t)v2, v37);
  sub_10003C998((void **)a1);
  if (v35)
    os_release(v35);
  if (context)
  {
    if (v31)
    {
      context[2] = CFRetain(v31);
      cryptex_target_async_f(v2, context, sub_100016108);
    }
    else
    {
      dispatch_async_f(*((dispatch_queue_t *)v2 + 12), context, (dispatch_function_t)sub_10001AD54);
    }
  }
  free(v153);
  if (v34)
    os_release(v34);
  if (v33)
    os_release(v33);
  if (v32)
    os_release(v32);
  if (v31)
    CFRelease(v31);
  if (cf)
    CFRelease(cf);
  if (v5)
    CFRelease(v5);
  if (v4)
    CFRelease(v4);
}

uint64_t sub_10001ABC8(uint64_t a1, _QWORD *a2)
{
  const char *v4;
  const char *v5;
  int v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  char *v12;
  uint64_t v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;

  if (a2[26])
    v4 = (const char *)a2[26];
  else
    v4 = "unknown quire";
  v5 = *(const char **)(a1 + 56);
  v6 = *__error();
  v7 = *(NSObject **)(a1 + 72);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = "[anonymous]";
    v9 = a2[26];
    if (v5)
      v8 = v5;
    *(_DWORD *)buf = 136446466;
    v16 = v8;
    v17 = 2080;
    v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%{public}s: added cryptex: %s", buf, 0x16u);
  }
  *__error() = v6;
  sub_100038F70(a1 + 144, (uint64_t)(a2 + 10));
  os_retain(a2);
  v10 = malloc_type_calloc(1uLL, 0x30uLL, 0x61D5536CuLL);
  if (!v10)
    sub_10003F398(&v14, buf);
  v11 = (uint64_t)v10;
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      v12 = strdup(v4);
      if (v12)
        break;
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    v12 = strdup(v4);
    if (!v12)
      sub_10003F45C(v4, &v14, buf);
  }
  *(_QWORD *)(v11 + 32) = v12;
  *(_QWORD *)(v11 + 40) = os_transaction_create(v12);
  sub_100038F38(v11, *(char **)(v11 + 32));
  return sub_100038F70(a1 + 1056, v11);
}

uint64_t sub_10001AD54(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  const char *v5;
  const char *v6;
  int v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  int v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  int v16;
  int v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  const char *v22;
  char *v23;
  int v24;
  CFIndex v25;
  CFErrorRef v26;
  const char *v27;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;

  v2 = *a1;
  v3 = a1[4];
  v4 = *(const char **)(a1[3] + 120);
  v5 = *(const char **)(v3 + 208);
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*a1 + 96));
  v6 = *(const char **)(v2 + 56);
  v7 = *__error();
  v8 = *(NSObject **)(v2 + 72);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = "[anonymous]";
    *(_DWORD *)buf = 136446722;
    if (v6)
      v9 = v6;
    v30 = v9;
    v31 = 2080;
    v32 = v4;
    v33 = 2080;
    v34 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%{public}s: renaming: src = %s, dst = %s", buf, 0x20u);
  }
  *__error() = v7;
  v10 = 1408;
  if (*(_QWORD *)(*(_QWORD *)(v3 + 200) + 48) > 1uLL)
    v10 = 1396;
  if (renameat(*(_DWORD *)(v2 + 1392), v4, *(_DWORD *)(v2 + v10), v5))
  {
    v11 = *__error();
    v12 = *(void **)(v2 + 72);
    if (v12)
    {
      if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR))
        v13 = 3;
      else
        v13 = 2;
      v14 = *(const char **)(v2 + 56);
      if (!v14)
        v14 = "[anonymous]";
      *(_DWORD *)buf = 136446466;
      v30 = v14;
      v31 = 1024;
      LODWORD(v32) = v11;
      v15 = v12;
    }
    else
    {
      v22 = *(const char **)(v2 + 56);
      if (!v22)
        v22 = "[anonymous]";
      *(_DWORD *)buf = 136446466;
      v30 = v22;
      v31 = 1024;
      LODWORD(v32) = v11;
      v15 = &_os_log_default;
      v13 = 2;
    }
    v23 = (char *)_os_log_send_and_compose_impl(v13, 0, 0, 0, &_mh_execute_header, v15, 16);
    v24 = 1108;
    v25 = v11;
LABEL_32:
    v26 = sub_10000A6F8("_codex_install_continue4", "codex.c", v24, "com.apple.security.cryptex.posix", v25, 0, v23);
    free(v23);
    goto LABEL_33;
  }
  v16 = sub_10001B3BC(v3, 2);
  if (v16)
  {
    v17 = v16;
    v18 = *(void **)(v2 + 72);
    if (v18)
    {
      if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR))
        v19 = 3;
      else
        v19 = 2;
      v20 = *(const char **)(v2 + 56);
      if (!v20)
        v20 = "[anonymous]";
      *(_DWORD *)buf = 136446466;
      v30 = v20;
      v31 = 1024;
      LODWORD(v32) = v17;
      v21 = v18;
    }
    else
    {
      v27 = *(const char **)(v2 + 56);
      if (!v27)
        v27 = "[anonymous]";
      *(_DWORD *)buf = 136446466;
      v30 = v27;
      v31 = 1024;
      LODWORD(v32) = v16;
      v21 = &_os_log_default;
      v19 = 2;
    }
    v23 = (char *)_os_log_send_and_compose_impl(v19, 0, 0, 0, &_mh_execute_header, v21, 16);
    v25 = v17;
    v24 = 1115;
    goto LABEL_32;
  }
  v26 = 0;
LABEL_33:
  a1[2] = v26;
  return cryptex_async_f(v2, a1, sub_10001B46C);
}

void sub_10001B110(uint64_t a1, void *a2)
{
  uint64_t v4;
  const char *v5;
  int v6;
  NSObject *v7;
  const char *v8;
  int v9;
  int v10;
  const char *v11;
  int v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  const char *v18;
  int v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;

  sub_100008E78();
  --*(_DWORD *)(a1 + 1360);
  v4 = os_transaction_copy_description(a2);
  v5 = *(const char **)(a1 + 56);
  v6 = *__error();
  v7 = *(NSObject **)(a1 + 72);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = "[anonymous]";
    v9 = *(_DWORD *)(a1 + 1360);
    if (v5)
      v8 = v5;
    *(_DWORD *)buf = 136446978;
    v29 = v8;
    v30 = 2080;
    v31 = v4;
    v32 = 1024;
    v33 = v9 + 1;
    v34 = 1024;
    v35 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%{public}s: de-activation: %s: %u -> %u", buf, 0x22u);
  }
  *__error() = v6;
  os_release(a2);
  v10 = *(_DWORD *)(a1 + 1360);
  v27 = (void *)v4;
  if (v10)
  {
    if (v10 == -1)
      sub_10003F310();
    goto LABEL_26;
  }
  v11 = *(const char **)(a1 + 56);
  v12 = *__error();
  v13 = *(NSObject **)(a1 + 72);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v14 = "[anonymous]";
    if (v11)
      v14 = v11;
    *(_DWORD *)buf = 136446210;
    v29 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%{public}s: quiesced", buf, 0xCu);
  }
  *__error() = v12;
  v15 = *(_QWORD *)(a1 + 1368);
  if (v15)
  {
    v16 = (uint64_t *)(a1 + 1368);
    do
    {
      v17 = *(_QWORD *)(v15 + 40);
      v18 = *(const char **)(a1 + 56);
      v19 = *__error();
      v20 = *(NSObject **)(a1 + 72);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        v21 = "[anonymous]";
        if (v18)
          v21 = v18;
        *(_DWORD *)buf = 136446210;
        v29 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%{public}s: dispatching barrier", buf, 0xCu);
      }
      *__error() = v19;
      (*(void (**)(uint64_t, uint64_t))(v15 + 48))(a1, v17);
      v22 = *(_QWORD *)(a1 + 1368);
      if (v22 == v15)
      {
        v26 = *(_QWORD *)(v15 + 24);
        *v16 = v26;
        v25 = a1 + 1368;
        if (v26)
          goto LABEL_22;
      }
      else
      {
        do
        {
          v23 = v22;
          v22 = *(_QWORD *)(v22 + 24);
        }
        while (v22 != v15);
        v24 = *(_QWORD *)(v15 + 24);
        *(_QWORD *)(v23 + 24) = v24;
        v25 = v23 + 24;
        if (v24)
          goto LABEL_22;
      }
      *(_QWORD *)(a1 + 1376) = v25;
LABEL_22:
      *(_QWORD *)(v15 + 24) = -1;
      sub_10003C998((void **)v15);
      v15 = *v16;
    }
    while (*v16);
  }
LABEL_26:
  free(v27);
}

uint64_t sub_10001B3BC(uint64_t a1, uint64_t a2)
{
  id v4;
  __CFDictionary *v5;
  __CFDictionary *v6;
  char **v7;
  char *v8;
  uint64_t v9;

  v4 = sub_100014C18();
  v5 = sub_10000A554();
  v6 = v5;
  v7 = *(char ***)(a1 + 224);
  if (v7)
    sub_10000A660(v5, CFSTR("Version"), *v7);
  v8 = *(char **)(a1 + 208);
  if (v8)
    sub_10000A660(v6, CFSTR("Identifier"), v8);
  else
    v8 = "name-unknown";
  v9 = sub_100014C90(v4, a2, (uint64_t)v8, (uint64_t)v6);
  if (v6)
    CFRelease(v6);
  if (v4)
    os_release(v4);
  return v9;
}

uint64_t sub_10001B46C(uint64_t *a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  int v5;
  NSObject *v6;
  int v8;
  uint64_t v9;

  v2 = *a1;
  v3 = (_QWORD *)a1[4];
  v4 = a1[2];
  sub_100008E78();
  if (v4)
  {
    v5 = *__error();
    v6 = *(NSObject **)(v2 + 72);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "installation failed; cleaning up quire: %@",
        (uint8_t *)&v8,
        0xCu);
    }
    *__error() = v5;
    sub_10001B558(v2, v3);
  }
  return cryptex_target_async_f(v2, a1, sub_100016108);
}

void sub_10001B558(uint64_t a1, _QWORD *a2)
{
  char *v4;
  uint64_t v5;
  void **v6;
  const char *v7;
  int v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;

  v4 = (char *)a2[26];
  if (v4)
  {
    v5 = sub_10003909C(a1 + 1056, v4);
    if (v5)
    {
      v6 = (void **)v5;
      sub_1000390DC(a1 + 1056, v5);
      free(v6[4]);
      v6[4] = 0;
      os_release(v6[5]);
      free(v6);
    }
  }
  v7 = *(const char **)(a1 + 56);
  v8 = *__error();
  v9 = *(NSObject **)(a1 + 72);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = "[anonymous]";
    v11 = a2[26];
    if (v7)
      v10 = v7;
    v12 = 136446466;
    v13 = v10;
    v14 = 2080;
    v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%{public}s: removed cryptex: %s", (uint8_t *)&v12, 0x16u);
  }
  *__error() = v8;
  sub_1000390DC(a1 + 144, (uint64_t)(a2 + 10));
  os_release(a2);
}

void sub_10001B690(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;

  sub_100008E78();
  v6 = *__error();
  v7 = *(NSObject **)(a1 + 72);
  if (a3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a2 + 208);
      v14 = 136315394;
      v15 = v8;
      v16 = 2112;
      v17 = a3;
      v9 = "initial cryptex bootstrap: %s: %@";
      v10 = v7;
      v11 = OS_LOG_TYPE_ERROR;
      v12 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, (uint8_t *)&v14, v12);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v13 = *(_QWORD *)(a2 + 208);
    v14 = 136315138;
    v15 = v13;
    v9 = "initial cryptex bootstrap: %s [no error]";
    v10 = v7;
    v11 = OS_LOG_TYPE_DEBUG;
    v12 = 12;
    goto LABEL_6;
  }
  *__error() = v6;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 104));
}

void sub_10001B7B4(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t asset;
  int v4;
  int v5;
  const char *v6;
  int v7;
  NSObject *v8;
  char *v9;
  const char *v10;
  const char *v11;
  int v12;
  const char *v13;
  const char *v14;
  const char *v15;
  int v16;
  NSObject *v17;
  const char *v18;
  int v19;
  const char *v20;
  int v21;
  NSObject *v22;
  const char *v23;
  const char *v24;
  int v25;
  NSObject *v26;
  const char *v27;
  int v28;
  uint64_t v29;
  char __str[16];
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
  char v44[31];
  char v45[1024];
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  char *v49;
  __int16 v50;
  int v51;

  v1 = *a1;
  v2 = a1[3];
  bzero(v45, 0x400uLL);
  v43 = 0u;
  memset(v44, 0, sizeof(v44));
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v38 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  *(_OWORD *)__str = 0u;
  v31 = 0u;
  v28 = -1;
  asset = cryptex_core_get_asset(v2, &_cryptex_asset_type_root);
  if (!asset)
    sub_10003F524();
  v4 = realpath_np(*(unsigned int *)(asset + 16), v45);
  if (v4)
  {
    v5 = v4;
    v6 = *(const char **)(v1 + 56);
    v7 = *__error();
    v8 = *(NSObject **)(v1 + 72);
    v9 = "[anonymous]";
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      if (v6)
        v10 = v6;
      else
        v10 = "[anonymous]";
      *(_DWORD *)buf = 136446466;
      v47 = v10;
      v48 = 1024;
      LODWORD(v49) = v5;
      v11 = "%{public}s: realpath: %{darwin.errno}d";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, v11, buf, 0x12u);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  v9 = basename(v45);
  snprintf(__str, 0xFFuLL, "%s.XXXXXX", v9);
  v12 = sub_100015678(v1, (uint64_t)&unk_100055D70, __str, &v28);
  if (v12)
  {
    v5 = v12;
    v13 = *(const char **)(v1 + 56);
    v7 = *__error();
    v8 = *(NSObject **)(v1 + 72);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      if (v13)
        v14 = v13;
      else
        v14 = "[anonymous]";
      *(_DWORD *)buf = 136446466;
      v47 = v14;
      v48 = 1024;
      LODWORD(v49) = v5;
      v11 = "%{public}s: mkodtempat: %{darwin.errno}d";
      goto LABEL_14;
    }
LABEL_15:
    *__error() = v7;
LABEL_16:
    v15 = *(const char **)(v1 + 56);
    v16 = *__error();
    v17 = *(NSObject **)(v1 + 72);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      if (v15)
        v18 = v15;
      else
        v18 = "[anonymous]";
      *(_DWORD *)buf = 136446722;
      v47 = v18;
      v48 = 2080;
      v49 = v9;
      v50 = 1024;
      v51 = v5;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}s: failed to uninstall stale cryptex: %s: %{darwin.errno}d", buf, 0x1Cu);
    }
    *__error() = v16;
    v19 = v28;
    goto LABEL_22;
  }
  v19 = v28;
  if (renameat(*(_DWORD *)(v1 + 1396), v9, v28, "uninstalled"))
  {
    v5 = *__error();
    v20 = *(const char **)(v1 + 56);
    v21 = *__error();
    v22 = *(NSObject **)(v1 + 72);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      if (v20)
        v23 = v20;
      else
        v23 = "[anonymous]";
      *(_DWORD *)buf = 136446466;
      v47 = v23;
      v48 = 1024;
      LODWORD(v49) = v5;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%{public}s: renameat: %{darwin.errno}d", buf, 0x12u);
    }
    *__error() = v21;
    if (v5)
      goto LABEL_16;
  }
  v24 = *(const char **)(v1 + 56);
  v25 = *__error();
  v26 = *(NSObject **)(v1 + 72);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    if (v24)
      v27 = v24;
    else
      v27 = "[anonymous]";
    *(_DWORD *)buf = 136446466;
    v47 = v27;
    v48 = 2080;
    v49 = v9;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "%{public}s: uninstalled stale cryptex: %s", buf, 0x16u);
  }
  *__error() = v25;
LABEL_22:
  dispatch_group_leave(*(dispatch_group_t *)(v1 + 104));
  if (v19 != -1 && close(v19) == -1)
    sub_10003E474(&v29, buf);
}

void sub_10001BB70(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  int v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  int v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  int v15;
  NSObject *v16;
  const char *v17;
  int v18;
  int v19;
  void *v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  void *v28;
  CFErrorRef v29;
  const char *v30;
  char *v31;
  const char *v32;
  char *v33;
  uint64_t v34;
  int v35;
  uint8_t v36[4];
  const char *v37;
  __int16 v38;
  uint8_t *v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  int v43;

  v2 = *a1;
  v3 = a1[3];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*a1 + 96));
  if (cryptex_core_get_asset(*(_QWORD *)(v3 + 104), &_cryptex_asset_type_im4m))
  {
    v4 = *(const char **)(v2 + 56);
    v5 = *__error();
    v6 = *(NSObject **)(v2 + 72);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = "[anonymous]";
      if (v4)
        v7 = v4;
      *(_DWORD *)buf = 136446210;
      v41 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}s: pre-canned manifest", buf, 0xCu);
    }
    *__error() = v5;
    a1[2] = 0;
    goto LABEL_7;
  }
  v8 = *(_QWORD *)(*(_QWORD *)(v3 + 104) + 160);
  v9 = *(const char **)(v2 + 56);
  v10 = *__error();
  v11 = *(NSObject **)(v2 + 72);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = "[anonymous]";
    if (v9)
      v12 = v9;
    *(_DWORD *)buf = 136446210;
    v41 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%{public}s: writing im4m to disk", buf, 0xCu);
  }
  *__error() = v10;
  v13 = openat(*(_DWORD *)(v3 + 112), *((const char **)&_cryptex_asset_type_im4m + 5), 513, 438);
  v35 = v13;
  if ((v13 & 0x80000000) != 0)
  {
    v24 = *__error();
    v25 = *(void **)(v2 + 72);
    if (v25)
    {
      if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR))
        v26 = 3;
      else
        v26 = 2;
      v27 = *(const char **)(v2 + 56);
      if (!v27)
        v27 = "[anonymous]";
      *(_DWORD *)buf = 136446466;
      v41 = v27;
      v42 = 1024;
      v43 = v24;
      v28 = v25;
    }
    else
    {
      v32 = *(const char **)(v2 + 56);
      if (!v32)
        v32 = "[anonymous]";
      *(_DWORD *)buf = 136446466;
      v41 = v32;
      v42 = 1024;
      v43 = v24;
      v28 = &_os_log_default;
      v26 = 2;
    }
    v33 = (char *)_os_log_send_and_compose_impl(v26, 0, 0, 0, &_mh_execute_header, v28, 16);
    v29 = sub_10000A6F8("_codex_install_continue2", "codex.c", 1161, "com.apple.security.cryptex.posix", v24, 0, v33);
    free(v33);
LABEL_44:
    if ((_DWORD)v13 == -1)
      goto LABEL_46;
    goto LABEL_45;
  }
  if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_DEBUG))
  {
    bzero(buf, 0x400uLL);
    if (!realpath_np(v13, buf))
    {
      v14 = *(const char **)(v2 + 56);
      v15 = *__error();
      v16 = *(NSObject **)(v2 + 72);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v17 = "[anonymous]";
        if (v14)
          v17 = v14;
        *(_DWORD *)v36 = 136446466;
        v37 = v17;
        v38 = 2080;
        v39 = buf;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%{public}s: im4m path: %s", v36, 0x16u);
      }
      *__error() = v15;
    }
  }
  v18 = cryptex_signature_write(v8, v13);
  if (!v18)
  {
    v34 = cryptex_asset_new(&_cryptex_asset_type_im4m, &v35);
    cryptex_core_set_asset(*(_QWORD *)(v3 + 104), &v34);
    v29 = 0;
    LODWORD(v13) = v35;
    goto LABEL_44;
  }
  v19 = v18;
  v20 = *(void **)(v2 + 72);
  if (v20)
  {
    if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR))
      v21 = 3;
    else
      v21 = 2;
    v22 = *(const char **)(v2 + 56);
    if (!v22)
      v22 = "[anonymous]";
    *(_DWORD *)buf = 136446466;
    v41 = v22;
    v42 = 1024;
    v43 = v19;
    v23 = v20;
  }
  else
  {
    v30 = *(const char **)(v2 + 56);
    if (!v30)
      v30 = "[anonymous]";
    *(_DWORD *)buf = 136446466;
    v41 = v30;
    v42 = 1024;
    v43 = v18;
    v23 = &_os_log_default;
    v21 = 2;
  }
  v31 = (char *)_os_log_send_and_compose_impl(v21, 0, 0, 0, &_mh_execute_header, v23, 16);
  v29 = sub_10000A6F8("_codex_install_continue2", "codex.c", 1179, "com.apple.security.cryptex.posix", v19, 0, v31);
  free(v31);
LABEL_45:
  if (close(v13) == -1)
    sub_10003E474(v36, buf);
LABEL_46:
  a1[2] = v29;
  if (!v29)
  {
LABEL_7:
    cryptex_async_f(v2, a1, sub_10001C0D8);
    return;
  }
  cryptex_target_async_f(v2, a1, sub_100016108);
}

void sub_10001C0D8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v2 = *(void **)a1;
  v3 = *(_QWORD *)(a1 + 24);
  sub_100008E78();
  v4 = *(_QWORD **)(v3 + 104);
  v5 = sub_10003C89C(v2, 0x98uLL);
  v5[18] = a1;
  sub_100018C74((uint64_t)v2, v4, v5);
}

void sub_10001C128(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  uint64_t v7;
  void *v9;
  uint64_t v10;
  void *v11;
  char *v12;
  CFErrorRef v13;
  uint64_t v14;

  v7 = *(_QWORD *)a5;
  if (a4)
  {
    v9 = *(void **)(v7 + 72);
    if (v9)
    {
      if (os_log_type_enabled(*(os_log_t *)(v7 + 72), OS_LOG_TYPE_ERROR))
        v10 = 3;
      else
        v10 = 2;
      v11 = v9;
    }
    else
    {
      v11 = &_os_log_default;
      v10 = 2;
    }
    v12 = (char *)_os_log_send_and_compose_impl(v10, 0, 0, 0, &_mh_execute_header, v11, 16);
    v13 = sub_10000A6F8("_protex_stage_install_callback", "codex.c", 2844, "com.apple.security.cryptex.posix", a4, 0, v12);
    free(v12);
    *(_QWORD *)(a5 + 16) = v13;
  }
  else if (!v7)
  {
    return;
  }
  v14 = *(_QWORD *)(a5 + 40);
  if (v14)
    sub_100015790((_QWORD *)v7, a1, 0, *(_DWORD *)(a5 + 48), a5, v14);
}

void sub_10001C2F4(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t *a5)
{
  uint64_t v6;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  char *v12;
  CFErrorRef v13;

  v6 = *a5;
  if (a4)
  {
    v8 = *(void **)(v6 + 72);
    if (v8)
    {
      if (os_log_type_enabled(*(os_log_t *)(v6 + 72), OS_LOG_TYPE_ERROR))
        v9 = 3;
      else
        v9 = 2;
      v10 = v8;
    }
    else
    {
      v10 = &_os_log_default;
      v9 = 2;
    }
    v12 = (char *)_os_log_send_and_compose_impl(v9, 0, 0, 0, &_mh_execute_header, v10, 16);
    v13 = sub_10000A6F8("_codex_mount_continue2", "codex.c", 3001, "com.apple.security.cryptex.posix", a4, 0, v12);
    free(v12);
    if (v13)
    {
      a5[2] = (uint64_t)v13;
      cryptex_target_async_f(v6, a5, sub_10001C4F4);
    }
  }
  else
  {
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 216);
    if (v11)
      *(_BYTE *)(v11 + 64) = 1;
    cryptex_async_f(v6, a5, sub_10001C570);
  }
}

void sub_10001C4F4(void **a1)
{
  const void *v2;
  void *v3;

  v2 = a1[2];
  v3 = a1[5];
  ((void (*)(void *, void *, void *, void *))a1[7])(*a1, a1[5], a1[2], a1[6]);
  os_release(a1[3]);
  os_release(a1[4]);
  sub_10003C998(a1);
  if (v3)
    os_release(v3);
  if (v2)
    CFRelease(v2);
}

void sub_10001C570(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  CFIndex v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char *v9;
  CFErrorRef v10;

  v2 = *(_QWORD *)a1;
  v3 = *(_QWORD *)(a1 + 32);
  if ((*(_DWORD *)(v3 + 112) & 0x80000000) != 0)
  {
    v4 = *__error();
    v5 = *(void **)(v2 + 72);
    if (v5)
    {
      if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR))
        v6 = 3;
      else
        v6 = 2;
      __error();
      v7 = v6;
      v8 = v5;
    }
    else
    {
      __error();
      v8 = &_os_log_default;
      v7 = 2;
    }
    v9 = (char *)_os_log_send_and_compose_impl(v7, 0, 0, 0, &_mh_execute_header, v8, 16);
    v10 = sub_10000A6F8("_codex_mount_continue3", "codex.c", 2978, "com.apple.security.cryptex.posix", v4, 0, v9);
    free(v9);
    if (v10)
    {
      *(_QWORD *)(a1 + 16) = v10;
      cryptex_target_async_f(v2, a1, sub_10001C4F4);
    }
  }
  else
  {
    sub_100015790(*(_QWORD **)a1, v3, 0, 0, a1, (uint64_t)sub_10001C790);
  }
}

void sub_10001C790(uint64_t a1, void *a2, const __CFDictionary *a3, uint64_t a4)
{
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char *v17;
  const char *v18;
  int v19;
  CFIndex v20;
  const __CFDictionary *v21;
  CFErrorRef v22;
  char *v23;

  if (a3 && (sub_10000A98C(a3, CFSTR("com.apple.security.cryptex"), 17) & 1) == 0)
  {
    v11 = *(void **)(a1 + 72);
    if (v11)
    {
      if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR))
        v12 = 3;
      else
        v12 = 2;
      v13 = v11;
    }
    else
    {
      v13 = &_os_log_default;
      v12 = 2;
    }
    v17 = (char *)_os_log_send_and_compose_impl(v12, 0, 0, 0, &_mh_execute_header, v13, 16);
    v18 = "com.apple.security.cryptex";
    v19 = 2942;
    v20 = 14;
    v21 = a3;
LABEL_25:
    v22 = sub_10000A6F8("_codex_mount_continue4", "codex.c", v19, v18, v20, v21, v17);
    free(v17);
    if (!v22)
      return;
    goto LABEL_26;
  }
  if (!a2)
  {
    v14 = *(void **)(a1 + 72);
    if (v14)
    {
      if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR))
        v15 = 3;
      else
        v15 = 2;
      v16 = v14;
    }
    else
    {
      v16 = &_os_log_default;
      v15 = 2;
    }
    v17 = (char *)_os_log_send_and_compose_impl(v15, 0, 0, 0, &_mh_execute_header, v16, 16);
    v18 = "com.apple.security.cryptex.posix";
    v19 = 2948;
    v20 = 2;
    v21 = 0;
    goto LABEL_25;
  }
  if (!sub_10000A98C(a3, CFSTR("com.apple.security.cryptex"), 17))
  {
    sub_100017648(a1, a2, a4, (uint64_t)sub_10001CBFC);
    return;
  }
  v8 = *(void **)(a1 + 72);
  if (v8)
  {
    if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR))
      v9 = 3;
    else
      v9 = 2;
    v10 = v8;
  }
  else
  {
    v10 = &_os_log_default;
    v9 = 2;
  }
  v23 = (char *)_os_log_send_and_compose_impl(v9, 0, 0, 0, &_mh_execute_header, v10, 16);
  v22 = sub_10000A6F8("_codex_mount_continue4", "codex.c", 2955, "com.apple.security.cryptex", 1, 0, v23);
  free(v23);
  *(_QWORD *)(a4 + 40) = os_retain(a2);
  if (v22)
  {
LABEL_26:
    *(_QWORD *)(a4 + 16) = v22;
    cryptex_target_async_f(a1, a4, sub_10001C4F4);
  }
}

void sub_10001CBFC(uint64_t a1, void *object, const void *a3, uint64_t a4)
{
  void *v7;
  uint64_t v8;
  void *v9;
  char *v10;
  CFErrorRef v11;

  *(_QWORD *)(a4 + 40) = os_retain(object);
  if (a3
    && ((v7 = *(void **)(a1 + 72)) == 0
      ? (void *)(v9 = &_os_log_default, v8 = 2)
      : (!os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR) ? (v8 = 2) : (v8 = 3), v9 = v7),
        v10 = (char *)_os_log_send_and_compose_impl(v8, 0, 0, 0, &_mh_execute_header, v9, 16),
        v11 = sub_10000A6F8("_codex_mount_continue5", "codex.c", 2923, "com.apple.security.cryptex", 14, a3, v10),
        free(v10),
        v11))
  {
    *(_QWORD *)(a4 + 16) = CFRetain(v11);
    cryptex_target_async_f(a1, a4, sub_10001C4F4);
    CFRelease(v11);
  }
  else
  {
    *(_QWORD *)(a4 + 16) = 0;
    cryptex_target_async_f(a1, a4, sub_10001C4F4);
  }
}

void sub_10001CDCC(_QWORD *a1, uint64_t a2, const void *a3, uint64_t a4)
{
  dispatch_queue_t *v7;
  dispatch_queue_t v8;
  uint64_t v9;
  dispatch_queue_t v10;
  char *v11;
  CFErrorRef v12;

  v7 = *(dispatch_queue_t **)a4;
  sub_100008E78();
  if (a3)
  {
    v8 = v7[9];
    if (v8)
    {
      if (os_log_type_enabled(v7[9], OS_LOG_TYPE_ERROR))
        v9 = 3;
      else
        v9 = 2;
      v10 = v8;
    }
    else
    {
      v10 = (dispatch_queue_t)&_os_log_default;
      v9 = 2;
    }
    v11 = (char *)_os_log_send_and_compose_impl(v9, 0, 0, 0, &_mh_execute_header, v10, 16);
    v12 = sub_10000A6F8("_codex_unmount_continue2", "codex.c", 3109, "com.apple.security.cryptex", 2, a3, v11);
    free(v11);
    if (v12)
    {
      *(_QWORD *)(a4 + 16) = CFRetain(v12);
      cryptex_target_async_f(v7, a4, sub_10001CFC8);
      CFRelease(v12);
    }
  }
  else
  {
    sub_10001D03C((uint64_t)v7, a1);
    sub_100016EB4(v7, a1, a4, (uint64_t)sub_10001D130);
  }
}

void sub_10001CFC8(void **a1)
{
  const void *v2;
  void *v3;

  v2 = a1[2];
  v3 = a1[23];
  ((void (*)(void *, void *, void *, void *))a1[25])(*a1, a1[23], a1[2], a1[24]);
  sub_10002B424((uint64_t)(a1 + 3));
  sub_10003C998(a1);
  if (v3)
    os_release(v3);
  if (v2)
    CFRelease(v2);
}

void sub_10001D03C(uint64_t a1, _QWORD *a2)
{
  const char *v4;
  int v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;

  v4 = *(const char **)(a1 + 56);
  v5 = *__error();
  v6 = *(NSObject **)(a1 + 72);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = "[anonymous]";
    v8 = a2[26];
    if (v4)
      v7 = v4;
    v9 = 136446466;
    v10 = v7;
    v11 = 2080;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}s: deactivated cryptex: %s", (uint8_t *)&v9, 0x16u);
  }
  *__error() = v5;
  sub_1000390DC(a1 + 448, (uint64_t)(a2 + 14));
  os_release(a2);
}

uint64_t sub_10001D130(uint64_t a1, uint64_t a2, const void *a3, uint64_t a4)
{
  void *v7;
  uint64_t v8;
  void *v9;
  char *v10;
  CFErrorRef v11;

  if (a3)
  {
    v7 = *(void **)(a1 + 72);
    if (v7)
    {
      if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR))
        v8 = 3;
      else
        v8 = 2;
      v9 = v7;
    }
    else
    {
      v9 = &_os_log_default;
      v8 = 2;
    }
    v10 = (char *)_os_log_send_and_compose_impl(v8, 0, 0, 0, &_mh_execute_header, v9, 16);
    v11 = sub_10000A6F8("_codex_unmount_continue3", "codex.c", 3084, "com.apple.security.cryptex", 2, a3, v10);
    free(v10);
    if (v11)
      *(_QWORD *)(a4 + 16) = v11;
  }
  return cryptex_target_async_f(a1, a4, sub_10001CFC8);
}

CFErrorRef sub_10001D2C8(uint64_t a1, int a2, char *a3, int a4)
{
  CFErrorRef v5;
  CFIndex v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char *v12;

  if ((renameat(a2, a3, a4, "uninstalled") & 0x80000000) == 0 || (*__error() | 2) == 2)
    return 0;
  v7 = *__error();
  v8 = *(void **)(a1 + 72);
  if (v8)
  {
    if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR))
      v9 = 3;
    else
      v9 = 2;
    __error();
    v10 = v9;
    v11 = v8;
  }
  else
  {
    __error();
    v11 = &_os_log_default;
    v10 = 2;
  }
  v12 = (char *)_os_log_send_and_compose_impl(v10, 0, 0, 0, &_mh_execute_header, v11, 16);
  v5 = sub_10000A6F8("_codex_uninstall_location", "codex.c", 1334, "com.apple.security.cryptex.posix", v7, 0, v12);
  free(v12);
  return v5;
}

void sub_10001D4AC(uint64_t a1)
{
  void *v2;
  void *v3;
  const void *v4;
  uint64_t v5;

  v2 = *(void **)a1;
  v3 = *(void **)(a1 + 32);
  v4 = *(const void **)(a1 + 16);
  v5 = *(_QWORD *)(a1 + 48);
  sub_100008E78();
  (*(void (**)(void *, void *, const void *, uint64_t))(a1 + 56))(v2, v3, v4, v5);
  sub_10003C998((void **)a1);
  if (v4)
    CFRelease(v4);
  if (v3)
    os_release(v3);
}

uint64_t sub_10001D534(uint64_t *a1)
{
  uint64_t v2;
  _QWORD *v3;
  int v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char *v9;
  CFErrorRef v10;

  v2 = *a1;
  v3 = (_QWORD *)a1[4];
  sub_100008E78();
  sub_10001B558(v2, v3);
  v4 = sub_10001B3BC((uint64_t)v3, 4);
  if (v4)
  {
    v5 = v4;
    v6 = *(void **)(v2 + 72);
    if (v6)
    {
      if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR))
        v7 = 3;
      else
        v7 = 2;
      v8 = v6;
    }
    else
    {
      v8 = &_os_log_default;
      v7 = 2;
    }
    v9 = (char *)_os_log_send_and_compose_impl(v7, 0, 0, 0, &_mh_execute_header, v8, 16);
    v10 = sub_10000A6F8("_codex_uninstall_continue2", "codex.c", 1311, "com.apple.security.cryptex.posix", v5, 0, v9);
    free(v9);
    a1[2] = (uint64_t)v10;
  }
  return cryptex_target_async_f(v2, a1, sub_10001D4AC);
}

void sub_10001D700(uint64_t a1)
{
  dispatch_group_t *v2;
  void *v3;
  const void *v4;
  uint64_t v5;

  v2 = *(dispatch_group_t **)a1;
  v4 = *(const void **)(a1 + 16);
  v3 = *(void **)(a1 + 24);
  v5 = *(_QWORD *)(a1 + 40);
  sub_100008E78();
  dispatch_group_leave(v2[14]);
  (*(void (**)(dispatch_group_t *, void *, const void *, uint64_t))(a1 + 48))(v2, v3, v4, v5);
  sub_10003C998((void **)a1);
  if (v4)
    CFRelease(v4);
  if (v3)
    os_release(v3);
}

uint64_t sub_10001D78C(uint64_t a1, uint64_t a2, const void *a3, uint64_t *a4)
{
  uint64_t v7;
  const char *v8;
  int v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  int v14;
  NSObject *v15;
  const char *v16;
  const char *v17;
  int v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  int v23;
  NSObject *v24;
  const char *v25;
  int v26;
  int v27;
  const char *v28;
  int v29;
  NSObject *v30;
  const char *v31;
  CFTypeRef v32;
  int v34;
  const char *v35;
  __int16 v36;
  _BYTE v37[10];

  v7 = *a4;
  sub_100008E78();
  v8 = *(const char **)(v7 + 56);
  v9 = *__error();
  v10 = *(NSObject **)(v7 + 72);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (v8)
      v11 = v8;
    else
      v11 = "[anonymous]";
    v12 = *(_QWORD *)(a1 + 208);
    v34 = 136446466;
    v35 = v11;
    v36 = 2080;
    *(_QWORD *)v37 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}s: quire bootstrap: %s", (uint8_t *)&v34, 0x16u);
  }
  *__error() = v9;
  if (!a3)
  {
    v13 = *(const char **)(v7 + 56);
    v14 = *__error();
    v15 = *(NSObject **)(v7 + 72);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      if (v13)
        v16 = v13;
      else
        v16 = "[anonymous]";
      v34 = 136446210;
      v35 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%{public}s: _codex_bootstrap_continue2 bootstrap succeeded", (uint8_t *)&v34, 0xCu);
    }
    *__error() = v14;
    v17 = *(const char **)(v7 + 56);
    v18 = *__error();
    v19 = *(NSObject **)(v7 + 72);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      if (v17)
        v20 = v17;
      else
        v20 = "[anonymous]";
      v21 = *(_QWORD *)(a1 + 208);
      v34 = 136446466;
      v35 = v20;
      v36 = 2080;
      *(_QWORD *)v37 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "%{public}s: activated cryptex: %s", (uint8_t *)&v34, 0x16u);
    }
    *__error() = v18;
    v22 = *(const char **)(v7 + 56);
    v23 = *__error();
    v24 = *(NSObject **)(v7 + 72);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      if (v22)
        v25 = v22;
      else
        v25 = "[anonymous]";
      v26 = *(_DWORD *)(a1 + 188);
      v27 = *(_DWORD *)(a1 + 400);
      v34 = 136446722;
      v35 = v25;
      v36 = 1024;
      *(_DWORD *)v37 = v26;
      *(_WORD *)&v37[4] = 1024;
      *(_DWORD *)&v37[6] = v27;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "%{public}s: UID: %d\tFD: %d", (uint8_t *)&v34, 0x18u);
    }
    *__error() = v23;
    sub_100038F70(v7 + 448, a1 + 112);
    os_retain((void *)a1);
  }
  v28 = *(const char **)(v7 + 56);
  v29 = *__error();
  v30 = *(NSObject **)(v7 + 72);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    if (v28)
      v31 = v28;
    else
      v31 = "[anonymous]";
    v34 = 136446210;
    v35 = v31;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "%{public}s: _codex_bootstrap_continue2 occured", (uint8_t *)&v34, 0xCu);
  }
  *__error() = v29;
  if (a3)
    v32 = CFRetain(a3);
  else
    v32 = 0;
  a4[2] = (uint64_t)v32;
  return cryptex_target_async_f(v7, a4, sub_10001D700);
}

void sub_10001DA80(uint64_t a1)
{
  void *v2;
  void *v3;
  const void *v4;
  uint64_t v5;

  v2 = *(void **)a1;
  v4 = *(const void **)(a1 + 16);
  v3 = *(void **)(a1 + 24);
  v5 = *(_QWORD *)(a1 + 40);
  sub_100008E78();
  (*(void (**)(void *, void *, const void *, uint64_t))(a1 + 48))(v2, v3, v4, v5);
  sub_10003C998((void **)a1);
  if (v4)
    CFRelease(v4);
  if (v3)
    os_release(v3);
}

void sub_10001DB04(_QWORD *a1, uint64_t *a2, const void *a3, uint64_t *a4)
{
  uint64_t v8;
  const void *v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  int v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint32_t v22;
  uint64_t v23;
  int v24;
  int v25;
  char *v26;
  uint64_t v27;
  int v28;
  int v29;
  char *v30;
  const char *v31;
  int v32;
  NSObject *v33;
  const char *v34;
  CFTypeRef v35;
  uint64_t v36;
  uint8_t v37[4];
  const char *v38;
  __int16 v39;
  uint8_t *v40;
  __int16 v41;
  char *v42;
  char __str[1024];
  uint8_t buf[4];
  const void *v45;

  v8 = *a4;
  v9 = (const void *)a4[2];
  v10 = *a2;
  sub_100008E78();
  v11 = *__error();
  v12 = *(NSObject **)(v8 + 72);
  if (a3)
  {
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_DWORD *)buf = 138412290;
    v45 = a3;
    v13 = "unmount: %@";
    v14 = v12;
    v15 = OS_LOG_TYPE_ERROR;
    v16 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v13 = "unmount [no error]";
    v14 = v12;
    v15 = OS_LOG_TYPE_DEBUG;
    v16 = 2;
  }
  _os_log_impl((void *)&_mh_execute_header, v14, v15, v13, buf, v16);
LABEL_7:
  *__error() = v11;
  v17 = *__error();
  v18 = *(NSObject **)(v8 + 72);
  if (v9)
  {
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    *(_DWORD *)buf = 138412290;
    v45 = v9;
    v19 = "forwarded unbootstrap: %@";
    v20 = v18;
    v21 = OS_LOG_TYPE_ERROR;
    v22 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      goto LABEL_13;
    *(_WORD *)buf = 0;
    v19 = "forwarded unbootstrap [no error]";
    v20 = v18;
    v21 = OS_LOG_TYPE_DEBUG;
    v22 = 2;
  }
  _os_log_impl((void *)&_mh_execute_header, v20, v21, v19, buf, v22);
LABEL_13:
  *__error() = v17;
  if (sub_1000390D0(v8 + 448, (uint64_t)(a1 + 14)))
    sub_10001D03C(v8, a1);
  if (v10)
  {
    *(_QWORD *)v10 = *(_QWORD *)(v8 + 136);
    *(_QWORD *)(v8 + 136) = v10;
    *a2 = 0;
    bzero(buf, 0x400uLL);
    bzero(__str, 0x400uLL);
    v23 = *(unsigned int *)(v10 + 12);
    if ((v23 & 0x80000000) != 0)
      sub_10003F53C(&v36, v37);
    if (os_log_type_enabled(*(os_log_t *)(v8 + 72), OS_LOG_TYPE_DEBUG))
    {
      v24 = realpath_np(v23, buf);
      if (v24)
      {
        v25 = v24;
        v26 = strerror(v24);
        snprintf((char *)buf, 0x400uLL, "[%d: %s]", v25, v26);
      }
      v27 = *(unsigned int *)(v10 + 8);
      if ((v27 & 0x80000000) != 0)
      {
        strcpy(__str, "[none]");
      }
      else
      {
        v28 = realpath_np(v27, __str);
        if (v28)
        {
          v29 = v28;
          v30 = strerror(v28);
          snprintf(__str, 0x400uLL, "[%d: %s]", v29, v30);
        }
      }
      v31 = *(const char **)(v8 + 56);
      v32 = *__error();
      v33 = *(NSObject **)(v8 + 72);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        v34 = "[anonymous]";
        *(_DWORD *)v37 = 136446722;
        if (v31)
          v34 = v31;
        v38 = v34;
        v39 = 2080;
        v40 = buf;
        v41 = 2080;
        v42 = __str;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "%{public}s: claimed quire husk: dev = %s, mnt = %s", v37, 0x20u);
      }
      *__error() = v32;
    }
  }
  if (a3)
    v35 = CFRetain(a3);
  else
    v35 = 0;
  a4[2] = (uint64_t)v35;
  cryptex_target_async_f(v8, a4, sub_10001DA80);
  if (v9)
    CFRelease(v9);
}

uint64_t sub_10001DE64(uint64_t a1)
{
  uint64_t v2;
  int v3;
  const char *v4;
  int v5;
  NSObject *v6;
  const char *v7;
  const char *v8;
  int v9;
  const char *v10;
  NSObject *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  uint64_t result;
  const char *v16;
  NSObject *v17;
  const char *v18;
  int v19;
  uint64_t v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;

  v2 = *(_QWORD *)a1;
  v3 = *(_DWORD *)(a1 + 8);
  v19 = -1;
  if (v3)
  {
    v4 = *(const char **)(v2 + 56);
    v5 = *__error();
    v6 = *(NSObject **)(v2 + 72);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    v7 = "[anonymous]";
    if (v4)
      v7 = v4;
    *(_DWORD *)buf = 136446466;
    v22 = v7;
    v23 = 1024;
    v24 = v3;
    v8 = "%{public}s: failed to lock down codex: %{darwin.errno}d";
LABEL_18:
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, v8, buf, 0x12u);
    goto LABEL_19;
  }
  v9 = sub_100015564(v2, (uint64_t)&unk_100044990, "lockdown", 2560, 438, &v19);
  v3 = v9;
  if ((v9 - 23) < 2)
  {
    v13 = *(const char **)(v2 + 56);
    v5 = *__error();
    v6 = *(NSObject **)(v2 + 72);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    v14 = "[anonymous]";
    if (v13)
      v14 = v13;
    *(_DWORD *)buf = 136446466;
    v22 = v14;
    v23 = 1024;
    v24 = v3;
    v8 = "%{public}s: failed to write lockdown state cookie: %{darwin.errno}d";
    goto LABEL_18;
  }
  if (v9 == 17)
  {
    v16 = *(const char **)(v2 + 56);
    v5 = *__error();
    v17 = *(NSObject **)(v2 + 72);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v18 = "[anonymous]";
      if (v16)
        v18 = v16;
      *(_DWORD *)buf = 136446210;
      v22 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%{public}s: codex already locked down", buf, 0xCu);
    }
    v3 = 37;
  }
  else
  {
    if (v9)
      sub_10003F5B8(&v20, buf);
    v10 = *(const char **)(v2 + 56);
    v5 = *__error();
    v11 = *(NSObject **)(v2 + 72);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = "[anonymous]";
      if (v10)
        v12 = v10;
      *(_DWORD *)buf = 136446210;
      v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%{public}s: wrote lockdown state cookie", buf, 0xCu);
    }
    v3 = 0;
  }
LABEL_19:
  *__error() = v5;
  *(_DWORD *)(a1 + 8) = v3;
  cryptex_target_async_f(v2, a1, sub_10001E114);
  result = v19;
  if (v19 != -1)
  {
    result = close(v19);
    if ((_DWORD)result == -1)
      sub_10003E474(&v20, buf);
  }
  return result;
}

void sub_10001E114(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(void **)a1;
  v3 = *(unsigned int *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 24);
  sub_100008E78();
  (*(void (**)(void *, uint64_t, uint64_t))(a1 + 32))(v2, v3, v4);
  sub_10003C998((void **)a1);
}

void sub_10001E160(uint64_t a1, _QWORD *a2)
{
  void *v4;
  NSObject *v5;
  uint64_t i;
  uint64_t j;
  _QWORD *v8;

  v4 = (void *)a2[4];
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  for (i = 0; i != 37; ++i)
  {
    for (j = *(_QWORD *)(a1 + 144 + 8 * i); j; j = *(_QWORD *)(j + 8))
    {
      v8 = sub_10003C89C((void *)(j - 80), 0x40uLL);
      v8[3] = os_retain(v5);
      v8[4] = os_retain(v4);
      dispatch_group_enter(v5);
      cryptex_async_f(j - 80, v8, sub_10001E264);
    }
  }
  dispatch_group_notify_f(v5, *(dispatch_queue_t *)(a1 + 32), a2, (dispatch_function_t)sub_10001E358);
  dispatch_group_leave(v5);
  if (v5)
    os_release(v5);
}

void sub_10001E264(uint64_t *a1)
{
  uint64_t v2;
  xpc_object_t v3;
  void *v4;
  const char *v5;
  int v6;
  NSObject *v7;

  v2 = *a1;
  v3 = xpc_array_create(0, 0);
  xpc_array_set_string(v3, 0xFFFFFFFFFFFFFFFFLL, *(const char **)(v2 + 208));
  xpc_array_set_string(v3, 0xFFFFFFFFFFFFFFFFLL, **(const char ***)(v2 + 224));
  if (*(_QWORD *)(v2 + 408))
  {
    xpc_array_set_string(v3, 0xFFFFFFFFFFFFFFFFLL, "[not mounted]");
    xpc_array_set_string(v3, 0xFFFFFFFFFFFFFFFFLL, "[not mounted]");
    v4 = v3;
    v5 = "[not mounted]";
  }
  else
  {
    xpc_array_set_string(v3, 0xFFFFFFFFFFFFFFFFLL, *(const char **)(v2 + 424));
    xpc_array_set_string(v3, 0xFFFFFFFFFFFFFFFFLL, *(const char **)(v2 + 432));
    v5 = *(const char **)(v2 + 416);
    v4 = v3;
  }
  xpc_array_set_string(v4, 0xFFFFFFFFFFFFFFFFLL, v5);
  v6 = sub_10000A88C(*(_QWORD *)(v2 + 408));
  xpc_array_set_int64(v3, 0xFFFFFFFFFFFFFFFFLL, v6);
  a1[5] = (uint64_t)v3;
  v7 = sub_100008E88();
  dispatch_async_f(v7, a1, (dispatch_function_t)sub_10001E394);
}

void sub_10001E358(void **a1)
{
  ((void (*)(void *, _QWORD, void *, void *))a1[7])(*a1, *((unsigned int *)a1 + 2), a1[4], a1[6]);
  xpc_release(a1[4]);
  sub_10003C998(a1);
}

void sub_10001E394(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;

  v2 = *(NSObject **)(a1 + 24);
  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  xpc_array_append_value(v3, v4);
  dispatch_group_leave(v2);
  sub_10003C998((void **)a1);
  if (v4)
    os_release(v4);
  if (v3)
    os_release(v3);
  if (v2)
    os_release(v2);
}

void sub_10001E584(uint64_t a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  _OWORD v4[5];

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_10005A850;
  qword_10005A850 = (uint64_t)v1;

  if (!qword_10005A850)
    sub_10003F6B0(&v3, v4);
}

void sub_10001E6BC(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "coll_map"));
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)));

  if (!v3)
  {
    v3 = objc_msgSend(objc_alloc((Class)CollationCore), "initWithID:", *(unsigned int *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "coll_map"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 40));

    if (*(_DWORD *)(a1 + 48))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "coll_map"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", &off_100057B98));

      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_10001E7CC;
      v7[3] = &unk_1000562C0;
      v3 = v3;
      v8 = v3;
      objc_msgSend(v6, "enumerateCollationElements:", v7);

    }
  }

}

uint64_t sub_10001E7CC(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "appendCollationElement:", a2);
  return 1;
}

void sub_10001E8A0(uint64_t a1)
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSString *v16;
  void *v17;
  NSString *v18;
  uint64_t v19;
  NSString *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  void *i;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];

  v2 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48)));
  v3 = sub_100031190(*(_QWORD *)(a1 + 32));
  if (v3)
    v4 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v3));
  else
    v4 = 0;
  v5 = sub_100031198(*(_QWORD *)(a1 + 32));
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v6)
  {
    v8 = _CFXPCCreateCFObjectFromXPCObject(v6);
    v9 = objc_claimAutoreleasedReturnValue(v8);
  }
  else
  {
    v9 = 0;
  }
  v55 = (void *)v7;
  v56 = (void *)v2;
  v10 = sub_1000311A0(*(_QWORD *)(a1 + 32));
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)v11;
  v13 = (void *)v4;
  if (v11)
  {
    v14 = _CFXPCCreateCFObjectFromXPCObject(v11);
    v15 = objc_claimAutoreleasedReturnValue(v14);
  }
  else
  {
    v15 = 0;
  }
  v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", sub_100031188(*(_QWORD *)(a1 + 32)));
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", sub_1000311A8(*(_QWORD *)(a1 + 32)));
  v19 = objc_claimAutoreleasedReturnValue(v18);
  v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", *(_QWORD *)sub_1000311B0(*(_QWORD *)(a1 + 32)));
  v21 = objc_claimAutoreleasedReturnValue(v20);
  v22 = objc_alloc((Class)CollationElement);
  v52 = (void *)v19;
  v53 = (void *)v15;
  v23 = v19;
  v51 = (void *)v21;
  v54 = (void *)v9;
  v24 = v13;
  v25 = objc_msgSend(v22, "initWithBundle:version:atPath:withScope:withCommand:withCommandArgs:withEnv:", v23, v21, v17, 1, v13, v9, v15);
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "coll_map"));
  v27 = v56;
  v28 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", v56));

  v29 = v55;
  if (!v28)
  {
    v30 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 8);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      sub_10003F72C(a1 + 48, v30, v31, v32, v33, v34, v35, v36);
    v28 = objc_msgSend(objc_alloc((Class)CollationCore), "initWithID:", *(unsigned int *)(a1 + 48));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "coll_map"));
    objc_msgSend(v37, "setObject:forKeyedSubscript:", v28, v56);

  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "coll_map"));
  v39 = objc_msgSend(v38, "count");

  if ((unint64_t)v39 >= 2)
  {
    v49 = v12;
    v50 = v24;
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "coll_map"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "keyEnumerator"));

    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v43; i = (char *)i + 1)
        {
          if (*(_QWORD *)v58 != v44)
            objc_enumerationMutation(v41);
          v46 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v46, "intValue"))
          {
            v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "coll_map"));
            v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", v46));

            objc_msgSend(v48, "appendCollationElement:", v25);
          }
        }
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
      }
      while (v43);
    }

    v29 = v55;
    v27 = v56;
    v12 = v49;
    v24 = v50;
  }
  objc_msgSend(v28, "appendCollationElement:", v25);

}

void sub_10001ECE0(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  unsigned __int8 v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _OWORD v16[5];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48)));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", v2));
  if (!v3)
    sub_10003F798(&v15, v16);
  v4 = (void *)v3;
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_10003F8CC(a1, (int *)(a1 + 48), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", *(_QWORD *)(a1 + 40)));
  v7 = objc_msgSend(v4, "removeCollationElementWithPath:", v6);

  if ((v7 & 1) == 0)
    sub_10003F8B4();
  if (objc_msgSend(v4, "isEmpty"))
  {
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      sub_10003F848(a1 + 48, v8, v9, v10, v11, v12, v13, v14);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", v2);
  }

}

void sub_10001EF0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001EF24(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  __int128 v6;
  uint64_t v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "coll_map"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 64)));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", v3));

  if (v4)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10001EFE4;
    v5[3] = &unk_100056338;
    v6 = *(_OWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v4, "enumerateElements:", v5);
  }

}

BOOL sub_10001EFE4(uint64_t a1, int a2, char *__s2, uint64_t a4)
{
  uint64_t v4;
  _BOOL8 result;
  uint64_t v8;
  _OWORD v9[5];

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_BYTE *)(v4 + 24))
    sub_10003F958(&v8, v9);
  if (strcmp(*(const char **)(a1 + 40), __s2))
    return 1;
  if (*(_QWORD *)(a1 + 48))
  {
    *(_QWORD *)&v9[0] = cryptex_version_new(a4);
    if ((cryptex_version_compare(*(_QWORD *)&v9[0], *(_QWORD *)(a1 + 48)) & 0x80000000) == 0)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    cryptex_version_destroy(v9);
    return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 0;
  }
  else
  {
    result = 0;
    *(_BYTE *)(v4 + 24) = 1;
  }
  return result;
}

uint64_t sub_10001F148(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  sub_100031180((uint64_t)v1);
  v2 = +[CollationMap addEntryForUser:fromQuire:](CollationMap, "addEntryForUser:fromQuire:", 0, v1);

  return v2;
}

id sub_10001F18C(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  sub_100031180((uint64_t)v1);
  v2 = sub_100031188((uint64_t)v1);

  return (id)+[CollationMap removeEntryForUser:withValue:](CollationMap, "removeEntryForUser:withValue:", 0, v2);
}

id sub_10001F1DC(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CollationMap getMap](CollationMap, "getMap"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "coll_map"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v4));

  if (!v5)
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", &off_100057B98));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "createEndpoint"));

  return v6;
}

BOOL sub_10001F28C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  _BOOL8 v5;
  uint64_t v7;

  v7 = 0;
  if (a3)
  {
    v4 = cryptex_version_new(a3);
    v7 = v4;
  }
  else
  {
    v4 = 0;
  }
  v5 = +[CollationMap lookupEntryForUser:withBundleID:minVersion:](CollationMap, "lookupEntryForUser:withBundleID:minVersion:", 0, a2, v4);
  cryptex_version_destroy(&v7);
  return v5;
}

id sub_10001F2F4()
{
  return +[CollationMap createCollationForUser:](CollationMap, "createCollationForUser:", 0);
}

void sub_10001F304(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void sub_10001F468(uint64_t a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  _OWORD v4[5];

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_10005A860;
  qword_10005A860 = (uint64_t)v1;

  if (!qword_10005A860)
    sub_10003FA58(&v3, v4);
}

void sub_10001F538(void *a1)
{
  id v1;

  v1 = a1;
  xpc_remote_connection_set_event_handler();
  xpc_remote_connection_activate(v1);

}

void sub_10001F570(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  int v3;
  id v4;
  NSObject *v5;
  id v6;
  char *v7;
  int v8;
  id v9;
  NSObject *v10;
  int v11;
  const char *string;

  v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_error)
  {
    v3 = *__error();
    v6 = sub_10001F764();
    v5 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315138;
      string = xpc_dictionary_get_string(v2, _xpc_error_key_description);
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Received error from client: %s", (uint8_t *)&v11, 0xCu);
    }
    goto LABEL_8;
  }
  if (xpc_get_type(v2) != (xpc_type_t)&_xpc_type_dictionary)
  {
    v3 = *__error();
    v4 = sub_10001F764();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Malformed message from client", (uint8_t *)&v11, 2u);
    }
LABEL_8:

    *__error() = v3;
    goto LABEL_12;
  }
  v7 = xpc_copy_description(v2);
  v8 = *__error();
  v9 = sub_10001F764();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = 136315138;
    string = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "remote service msg recv: %s", (uint8_t *)&v11, 0xCu);
  }

  *__error() = v8;
  sub_10001F7A4(v2);
  free(v7);
LABEL_12:

}

void sub_10001F744(_Unwind_Exception *a1)
{
  void *v1;

  free(v1);
  _Unwind_Resume(a1);
}

id sub_10001F764()
{
  if (qword_10005A868 != -1)
    dispatch_once(&qword_10005A868, &stru_1000563C0);
  return (id)qword_10005A870;
}

void sub_10001F7A4(void *a1)
{
  id v1;
  xpc_object_t value;
  void *v3;
  void *v4;
  int v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  const char *string_ptr;
  int v12;
  id v13;
  NSObject *v14;
  id v15;
  int v16;
  void **v17;
  void **v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  char *v24;
  id v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  char *v32;
  int v33;
  int v34;
  id v35;
  NSObject *v36;
  int *v37;
  id v38;
  id v39;
  id v40;
  uint64_t uint64;
  uint64_t v42;
  id v43;
  void *v44;
  id v45;
  NSObject *v46;
  uint64_t v47;
  char *v48;
  int v49;
  int v50;
  int v51;
  id v52;
  void *v53;
  id v54;
  NSObject *v55;
  uint64_t v56;
  char *v57;
  id v58;
  int v59;
  id v60;
  void *v61;
  int v62;
  id v63;
  NSObject *v64;
  void *v65;
  __CFError *v66;
  void *v67;
  int v68;
  id v69;
  NSObject *v70;
  int v71;
  int v72;
  id v73;
  void *v74;
  id v75;
  NSObject *v76;
  uint64_t v77;
  char *v78;
  id v79;
  void *v80;
  id v81;
  NSObject *v82;
  uint64_t v83;
  char *v84;
  xpc_object_t v85;
  void *v86;
  id v87;
  void *v88;
  id v89;
  NSObject *v90;
  uint64_t v91;
  char *v92;
  const char *string;
  const char *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  xpc_object_t v98;
  xpc_object_t v99;
  xpc_object_t v100;
  xpc_object_t v101;
  xpc_object_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  xpc_object_t dictionary;
  void *v107;
  void *v108;
  id *v109;
  id v110;
  NSObject *v111;
  uint64_t v112;
  int is_cryptex1;
  int v114;
  void *v115;
  void *v116;
  _QWORD *v117;
  const char **v118;
  _QWORD *v119;
  uint64_t v120;
  int v121;
  id v122;
  NSObject *v123;
  __CFError *v124;
  void *v125;
  xpc_object_t empty;
  id v127;
  void *v128;
  id v129;
  NSObject *v130;
  uint64_t v131;
  char *v132;
  id v133;
  void *v134;
  id v135;
  NSObject *v136;
  uint64_t v137;
  char *v138;
  int v139;
  id v140;
  NSObject *v141;
  id v142;
  void *v143;
  void *v144;
  uint64_t v145;
  NSObject *v146;
  id v147;
  id v148;
  const char **v149;
  uint64_t v150;
  id v151;
  id v152;
  NSObject *v153;
  void *v154;
  dispatch_group_t v155;
  id v156;
  NSObject *v157;
  id v158;
  NSObject *v159;
  void *v160;
  _QWORD *v161;
  void *v162;
  unsigned int v163;
  void *v164;
  unsigned int v165;
  void *v166;
  id *v167;
  void *v168;
  id v169;
  id v170;
  int64_t int64;
  id v172;
  id v173;
  void *v174;
  id v175;
  void *v176;
  xpc_object_t xdict;
  id v178;
  void **v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t (*v182)(uint64_t, uint64_t);
  void (*v183)(uint64_t);
  id v184;
  uint64_t *v185;
  int64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  id v190;
  uint64_t v191;
  uint64_t *v192;
  uint64_t v193;
  uint64_t (*v194)(uint64_t, uint64_t);
  void (*v195)(uint64_t);
  id v196;
  _QWORD v197[6];
  _QWORD v198[6];
  _QWORD v199[6];
  _QWORD v200[6];
  _QWORD v201[6];
  _QWORD v202[5];
  id *v203;
  id v204;
  id *v205;
  uint64_t v206;
  uint64_t (*v207)(uint64_t, uint64_t);
  void (*v208)(uint64_t);
  id v209;
  _QWORD v210[3];
  int v211;
  int v212;
  _BYTE block[24];
  uint64_t (*v214)(uint64_t, uint64_t);
  void (*v215)(uint64_t);
  id v216;
  _QWORD *v217;
  _QWORD *v218;
  int64_t v219;
  void *v220;
  _QWORD *v221;
  void *v222;
  int v223;
  uint8_t buf[32];
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  _BYTE v237[31];

  v1 = a1;
  value = xpc_dictionary_get_value(v1, "routine");
  v3 = (void *)objc_claimAutoreleasedReturnValue(value);
  v4 = v3;
  if (!v3)
  {
    v5 = *__error();
    v8 = sub_10001F764();
    v7 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Malformed message from client: no routine key found", buf, 2u);
    }
    goto LABEL_8;
  }
  if (xpc_get_type(v3) != (xpc_type_t)&_xpc_type_string)
  {
    v5 = *__error();
    v6 = sub_10001F764();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Malformed message from client: routine is not a string", buf, 2u);
    }
LABEL_8:

    *__error() = v5;
    v9 = sub_10003D10C(v1, 0, 22);
LABEL_9:
    v10 = v9;
    goto LABEL_10;
  }
  string_ptr = xpc_string_get_string_ptr(v4);
  if (!strcmp(string_ptr, "get-nonce"))
  {
    v15 = v1;
    *(_QWORD *)&v226 = 0;
    v225 = 0u;
    memset(buf, 0, sizeof(buf));
    v179 = 0;
    v16 = sub_10003D990(v15, &v179);
    v17 = v179;
    v18 = v17;
    if (v16)
    {
      v19 = sub_10001F764();
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

      if (v20)
      {
        v21 = sub_10001F764();
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          v23 = 3;
        else
          v23 = 2;
        *(_DWORD *)block = 67109120;
        *(_DWORD *)&block[4] = v16;
        v24 = (char *)_os_log_send_and_compose_impl(v23, 0, 0, 0, &_mh_execute_header, v22, 16);

      }
      else
      {
        *(_DWORD *)block = 67109120;
        *(_DWORD *)&block[4] = v16;
        v24 = (char *)_os_log_send_and_compose_impl(2, 0, 0, 0, &_mh_execute_header, &_os_log_default, 16);
      }
      v66 = sub_10000A6F8("_remote_service_get_nonce", "sub_remote_service.m", 110, "com.apple.security.cryptex.posix", v16, 0, v24);
      free(v24);
      v67 = sub_10003D890(v15, 0, v66);
      goto LABEL_62;
    }
    if (sub_10003CF78(v17, "nonce-domain", (const _xpc_type_s *)&_xpc_type_uint64))
    {
      uint64 = xpc_dictionary_get_uint64(v18, "nonce-domain");
      v42 = sub_1000065F4(uint64);
      if (!v42)
      {
        v43 = sub_10001F764();
        v44 = (void *)objc_claimAutoreleasedReturnValue(v43);

        if (v44)
        {
          v45 = sub_10001F764();
          v46 = objc_claimAutoreleasedReturnValue(v45);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            v47 = 3;
          else
            v47 = 2;
          *(_DWORD *)block = 134217984;
          *(_QWORD *)&block[4] = uint64;
          v48 = (char *)_os_log_send_and_compose_impl(v47, 0, 0, 0, &_mh_execute_header, v46, 16);

        }
        else
        {
          *(_DWORD *)block = 134217984;
          *(_QWORD *)&block[4] = uint64;
          v48 = (char *)_os_log_send_and_compose_impl(2, 0, 0, 0, &_mh_execute_header, &_os_log_default, 16);
        }
        v66 = sub_10000A6F8("_remote_service_get_nonce", "sub_remote_service.m", 126, "com.apple.security.cryptex", 10, 0, v48);
        free(v48);
        v67 = sub_10003D890(v15, 0, v66);
        goto LABEL_62;
      }
    }
    else
    {
      if (!sub_10003CF78(v18, "nonce-domain-handle", (const _xpc_type_s *)&_xpc_type_uint64))
      {
        v87 = sub_10001F764();
        v88 = (void *)objc_claimAutoreleasedReturnValue(v87);

        if (v88)
        {
          v89 = sub_10001F764();
          v90 = objc_claimAutoreleasedReturnValue(v89);
          if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
            v91 = 3;
          else
            v91 = 2;
          *(_DWORD *)block = 136315394;
          *(_QWORD *)&block[4] = "nonce-domain";
          *(_WORD *)&block[12] = 2080;
          *(_QWORD *)&block[14] = "nonce-domain-handle";
          v92 = (char *)_os_log_send_and_compose_impl(v91, 0, 0, 0, &_mh_execute_header, v90, 16);

        }
        else
        {
          *(_DWORD *)block = 136315394;
          *(_QWORD *)&block[4] = "nonce-domain";
          *(_WORD *)&block[12] = 2080;
          *(_QWORD *)&block[14] = "nonce-domain-handle";
          v92 = (char *)_os_log_send_and_compose_impl(2, 0, 0, 0, &_mh_execute_header, &_os_log_default, 16);
        }
        v66 = sub_10000A6F8("_remote_service_get_nonce", "sub_remote_service.m", 151, "com.apple.security.cryptex", 11, 0, v92);
        free(v92);
        v67 = sub_10003D890(v15, 0, v66);
        goto LABEL_62;
      }
      v71 = xpc_dictionary_get_uint64(v18, "nonce-domain-handle");
      v42 = img4_nonce_domain_get_from_handle();
      if (!v42)
      {
        v133 = sub_10001F764();
        v134 = (void *)objc_claimAutoreleasedReturnValue(v133);

        if (v134)
        {
          v135 = sub_10001F764();
          v136 = objc_claimAutoreleasedReturnValue(v135);
          if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR))
            v137 = 3;
          else
            v137 = 2;
          *(_DWORD *)block = 67109120;
          *(_DWORD *)&block[4] = v71;
          v138 = (char *)_os_log_send_and_compose_impl(v137, 0, 0, 0, &_mh_execute_header, v136, 16);

        }
        else
        {
          *(_DWORD *)block = 67109120;
          *(_DWORD *)&block[4] = v71;
          v138 = (char *)_os_log_send_and_compose_impl(2, 0, 0, 0, &_mh_execute_header, &_os_log_default, 16);
        }
        v66 = sub_10000A6F8("_remote_service_get_nonce", "sub_remote_service.m", 141, "com.apple.security.cryptex", 10, 0, v138);
        free(v138);
        v67 = sub_10003D890(v15, 0, v66);
        goto LABEL_62;
      }
    }
    v72 = img4_nonce_domain_copy_nonce(v42, buf);
    if (!v72)
    {
      empty = xpc_dictionary_create_empty();
      xpc_dictionary_set_data(empty, "nonce", buf, 0x38uLL);
      v10 = sub_10003D890(v15, empty, 0);

LABEL_64:
      goto LABEL_10;
    }
    v73 = sub_10001F764();
    v74 = (void *)objc_claimAutoreleasedReturnValue(v73);

    if (v74)
    {
      v75 = sub_10001F764();
      v76 = objc_claimAutoreleasedReturnValue(v75);
      if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
        v77 = 3;
      else
        v77 = 2;
      *(_DWORD *)block = 67109120;
      *(_DWORD *)&block[4] = v72;
      v78 = (char *)_os_log_send_and_compose_impl(v77, 0, 0, 0, &_mh_execute_header, v76, 16);

    }
    else
    {
      *(_DWORD *)block = 67109120;
      *(_DWORD *)&block[4] = v72;
      v78 = (char *)_os_log_send_and_compose_impl(2, 0, 0, 0, &_mh_execute_header, &_os_log_default, 16);
    }
    v66 = sub_10000A6F8("_remote_service_get_nonce", "sub_remote_service.m", 161, "com.apple.security.cryptex.posix", v72, 0, v78);
    free(v78);
    v67 = sub_10003D890(v15, 0, v66);
LABEL_62:
    v10 = v67;
    if (v66)
      CFRelease(v66);
    goto LABEL_64;
  }
  if (strcmp(string_ptr, "roll-nonce"))
  {
    if (strcmp(string_ptr, "install"))
    {
      if (strcmp(string_ptr, "uninstall"))
      {
        if (!strcmp(string_ptr, "copy-installed"))
        {
          sub_100021558(v1);
          goto LABEL_12;
        }
        if (!strcmp(string_ptr, "read-personalization-id"))
        {
          sub_1000215E0(v1);
          goto LABEL_12;
        }
        v12 = *__error();
        v13 = sub_10001F764();
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = string_ptr;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Unsupported routine: %s", buf, 0xCu);
        }

        *__error() = v12;
        v9 = sub_10003D10C(v1, 0, 45);
        goto LABEL_9;
      }
      *(_QWORD *)block = 0;
      *(_QWORD *)&block[8] = block;
      *(_QWORD *)&block[16] = 0x3032000000;
      v214 = sub_100021980;
      v215 = sub_100021990;
      v216 = 0;
      v58 = v1;
      v216 = v58;
      v179 = 0;
      v180 = (uint64_t)&v179;
      v181 = 0x3032000000;
      v182 = sub_100021980;
      v183 = sub_100021990;
      v184 = 0;
      v204 = 0;
      v59 = sub_10003D990(v58, &v204);
      v60 = v204;
      v61 = v60;
      if (v59)
      {
        v62 = *__error();
        v63 = sub_10001F764();
        v64 = objc_claimAutoreleasedReturnValue(v63);
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v59;
          _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "failed to get argv from request: %{darwin.errno}d", buf, 8u);
        }

        *__error() = v62;
      }
      else
      {
        string = xpc_dictionary_get_string(v60, "remote-cryptex-identifier");
        v94 = xpc_dictionary_get_string(v61, "remote-cryptex-version");
        if (string)
        {
          if (v94)
            v95 = cryptex_version_new(v94);
          else
            v95 = 0;
          v143 = sub_100014FE0();
          v144 = *(void **)(v180 + 40);
          *(_QWORD *)(v180 + 40) = v143;

          v145 = sub_100008E88();
          v146 = objc_claimAutoreleasedReturnValue(v145);
          *(_QWORD *)buf = _NSConcreteStackBlock;
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = sub_100023790;
          *(_QWORD *)&buf[24] = &unk_1000568F8;
          *(_QWORD *)&v226 = string;
          *((_QWORD *)&v226 + 1) = v95;
          *(_QWORD *)&v227 = 1;
          *(_QWORD *)&v225 = &v179;
          *((_QWORD *)&v225 + 1) = block;
          dispatch_async(v146, buf);

          v65 = 0;
          goto LABEL_150;
        }
        v139 = *__error();
        v140 = sub_10001F764();
        v141 = objc_claimAutoreleasedReturnValue(v140);
        if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "remote-cryptex-identifier";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 22;
          _os_log_impl((void *)&_mh_execute_header, v141, OS_LOG_TYPE_ERROR, "required key missing or with wrong type: %s: %{darwin.errno}d", buf, 0x12u);
        }

        *__error() = v139;
        v59 = 22;
      }
      v65 = sub_10003D10C(v58, 0, v59);
      sub_100021870(v65);
LABEL_150:
      _Block_object_dispose(&v179, 8);

      _Block_object_dispose(block, 8);
      goto LABEL_12;
    }
    v191 = 0;
    v192 = &v191;
    v193 = 0x3032000000;
    v194 = sub_100021980;
    v195 = sub_100021990;
    v196 = 0;
    v178 = v1;
    if ((remote_service_install_request_valid() & 1) == 0)
    {
      v68 = *__error();
      v69 = sub_10001F764();
      v70 = objc_claimAutoreleasedReturnValue(v69);
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = 22;
        _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "Invalid install request: %{darwin.errno}d", buf, 8u);
      }

      v38 = 0;
      v175 = 0;
      xdict = 0;
      v172 = 0;
      v173 = 0;
      v39 = 0;
      v40 = 0;
      *__error() = v68;
      v33 = 22;
      goto LABEL_173;
    }
    v190 = 0;
    v33 = sub_10003D990(v178, &v190);
    xdict = v190;
    if (v33)
    {
      v34 = *__error();
      v35 = sub_10001F764();
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v33;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "failed to get argv from request: %{darwin.errno}d", buf, 8u);
      }

      v37 = __error();
      v38 = 0;
      v172 = 0;
      v173 = 0;
      v39 = 0;
      v40 = 0;
      v175 = 0;
LABEL_172:
      *v37 = v34;
LABEL_173:
      v154 = sub_10003D10C(v178, 0, v33);
      sub_100021870(v154);
LABEL_174:
      _Block_object_dispose(&v191, 8);

      goto LABEL_12;
    }
    v96 = sub_100014FE0();
    v97 = (void *)v192[5];
    v192[5] = (uint64_t)v96;

    v98 = xpc_dictionary_get_value(xdict, "image");
    v176 = (void *)objc_claimAutoreleasedReturnValue(v98);
    int64 = xpc_dictionary_get_int64(xdict, "image-type-index");
    v99 = xpc_dictionary_get_value(xdict, "trustcache");
    v174 = (void *)objc_claimAutoreleasedReturnValue(v99);
    v100 = xpc_dictionary_get_value(xdict, "im4m");
    v168 = (void *)objc_claimAutoreleasedReturnValue(v100);
    v101 = xpc_dictionary_get_value(xdict, "info");
    v166 = (void *)objc_claimAutoreleasedReturnValue(v101);
    v102 = xpc_dictionary_get_value(xdict, "volumehash");
    v164 = (void *)objc_claimAutoreleasedReturnValue(v102);
    v103 = xpc_dictionary_get_uint64(xdict, "persistence");
    v104 = xpc_dictionary_get_uint64(xdict, "nonce-persistence");
    v105 = xpc_dictionary_get_uint64(xdict, "auth");
    dictionary = xpc_dictionary_get_dictionary(xdict, "cryptex1-properties");
    v107 = (void *)objc_claimAutoreleasedReturnValue(dictionary);
    v108 = (void *)v192[5];
    v179 = _NSConcreteStackBlock;
    v180 = 3221225472;
    v181 = (uint64_t)sub_100021998;
    v182 = (uint64_t (*)(uint64_t, uint64_t))&unk_1000563E8;
    v186 = int64;
    v38 = v107;
    v183 = (void (*)(uint64_t))v38;
    v185 = &v191;
    v184 = v178;
    v187 = v105;
    v188 = v103;
    v189 = v104;
    v170 = v108;
    v172 = v176;
    v173 = v174;
    v175 = v168;
    v39 = v166;
    v40 = v164;
    v109 = &v179;
    v236 = 0u;
    memset(v237, 0, sizeof(v237));
    v234 = 0u;
    v235 = 0u;
    v232 = 0u;
    v233 = 0u;
    v230 = 0u;
    v231 = 0u;
    v228 = 0u;
    v229 = 0u;
    v226 = 0u;
    v227 = 0u;
    v225 = 0u;
    memset(buf, 0, sizeof(buf));
    v212 = -1;
    v210[0] = 0;
    v210[1] = v210;
    v210[2] = 0x2020000000;
    v211 = 0;
    v204 = 0;
    v205 = &v204;
    v206 = 0x3032000000;
    v207 = sub_100021980;
    v208 = sub_100021990;
    v209 = 0;
    v202[0] = 0;
    v202[1] = v202;
    v202[2] = 0x3032000000;
    v202[3] = sub_100021D24;
    v202[4] = sub_100021D4C;
    v203 = 0;
    v167 = v109;
    v169 = v38;
    v203 = objc_retainBlock(v109);
    v110 = sub_100021D54();
    v111 = objc_claimAutoreleasedReturnValue(v110);
    dispatch_assert_queue_V2(v111);

    __snprintf_chk((char *)buf, 0xFFuLL, 0, 0xFFuLL, "XXXXXX");
    sub_100015678((uint64_t)v170, (uint64_t)&unk_100055DB8, (char *)buf, &v212);
    v112 = openat(v212, *(const char **)(cryptex_asset_types[int64] + 40), 514, 438);
    if ((v112 & 0x80000000) != 0)
    {
      v33 = *__error();
      v121 = *__error();
      v142 = sub_10001F764();
      v123 = objc_claimAutoreleasedReturnValue(v142);
      if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)block = 67109120;
        *(_DWORD *)&block[4] = v33;
        _os_log_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_ERROR, "failed to create file for image: %{darwin.errno}d", block, 8u);
      }
      goto LABEL_167;
    }
    is_cryptex1 = cryptex_asset_type_is_cryptex1(cryptex_asset_types[int64]);
    v114 = is_cryptex1;
    if (is_cryptex1)
      v115 = &_cryptex_asset_type_gtgv;
    else
      v115 = &_cryptex_asset_type_roothash;
    v162 = v115;
    if (is_cryptex1)
      v116 = &_cryptex_asset_type_gtcd;
    else
      v116 = &_cryptex_asset_type_ltrs;
    v160 = v116;
    if (is_cryptex1)
      v117 = &_cryptex_asset_type_ginf;
    else
      v117 = _cryptex_asset_type_c411;
    v161 = v117;
    v118 = (const char **)((char *)&_cryptex_asset_type_ltrs + 40);
    if (is_cryptex1)
      v118 = (const char **)((char *)&_cryptex_asset_type_gtcd + 40);
    v165 = openat(v212, *v118, 514, 438);
    if ((v165 & 0x80000000) != 0)
    {
      v33 = *__error();
      v121 = *__error();
      v147 = sub_10001F764();
      v123 = objc_claimAutoreleasedReturnValue(v147);
      if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)block = 67109120;
        *(_DWORD *)&block[4] = v33;
        _os_log_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_ERROR, "failed to create file for trust cache: %{darwin.errno}d", block, 8u);
      }
      goto LABEL_167;
    }
    v163 = openat(v212, *((const char **)&_cryptex_asset_type_im4m + 5), 514, 438);
    if ((v163 & 0x80000000) != 0)
    {
      v33 = *__error();
      v121 = *__error();
      v148 = sub_10001F764();
      v123 = objc_claimAutoreleasedReturnValue(v148);
      if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)block = 67109120;
        *(_DWORD *)&block[4] = v33;
        _os_log_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_ERROR, "failed to create file for im4m: %{darwin.errno}d", block, 8u);
      }
      goto LABEL_167;
    }
    if (v39)
    {
      if (v114)
        v119 = &_cryptex_asset_type_ginf;
      else
        v119 = _cryptex_asset_type_c411;
      v120 = openat(v212, (const char *)v119[5], 514, 438);
      if ((v120 & 0x80000000) != 0)
      {
        v33 = *__error();
        v121 = *__error();
        v122 = sub_10001F764();
        v123 = objc_claimAutoreleasedReturnValue(v122);
        if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)block = 67109120;
          *(_DWORD *)&block[4] = v33;
          _os_log_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_ERROR, "failed to create file for info: %{darwin.errno}d", block, 8u);
        }
LABEL_167:

        *__error() = v121;
LABEL_168:
        _Block_object_dispose(v202, 8);

        _Block_object_dispose(&v204, 8);
        _Block_object_dispose(v210, 8);

        if (!v33)
        {
          v154 = 0;
          goto LABEL_174;
        }
        v34 = *__error();
        v152 = sub_10001F764();
        v153 = objc_claimAutoreleasedReturnValue(v152);
        if (os_log_type_enabled(v153, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v33;
          _os_log_impl((void *)&_mh_execute_header, v153, OS_LOG_TYPE_ERROR, "file receive failed: %{darwin.errno}d", buf, 8u);
        }

        v37 = __error();
        goto LABEL_172;
      }
    }
    else
    {
      v120 = 0xFFFFFFFFLL;
    }
    if (v40)
    {
      if (v114)
        v149 = (const char **)&_cryptex_asset_type_gtgv;
      else
        v149 = (const char **)&_cryptex_asset_type_roothash;
      v150 = openat(v212, v149[5], 514, 438);
      if ((v150 & 0x80000000) != 0)
      {
        v33 = *__error();
        v38 = v169;
        v121 = *__error();
        v151 = sub_10001F764();
        v123 = objc_claimAutoreleasedReturnValue(v151);
        if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)block = 67109120;
          *(_DWORD *)&block[4] = v33;
          _os_log_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_ERROR, "failed to create file for volume hash: %{darwin.errno}d", block, 8u);
        }
        goto LABEL_167;
      }
    }
    else
    {
      v150 = 0xFFFFFFFFLL;
    }
    v155 = dispatch_group_create();
    v156 = v205[5];
    v205[5] = v155;

    dispatch_group_enter((dispatch_group_t)v205[5]);
    dispatch_group_enter((dispatch_group_t)v205[5]);
    v201[0] = _NSConcreteStackBlock;
    v201[1] = 3221225472;
    v201[2] = sub_100021D94;
    v201[3] = &unk_100056410;
    v201[4] = v210;
    v201[5] = &v204;
    xpc_file_transfer_write_to_fd(v172, v112, v201);
    dispatch_group_enter((dispatch_group_t)v205[5]);
    v200[0] = _NSConcreteStackBlock;
    v200[1] = 3221225472;
    v200[2] = sub_100021EB4;
    v200[3] = &unk_100056410;
    v200[4] = v210;
    v200[5] = &v204;
    xpc_file_transfer_write_to_fd(v173, v165, v200);
    dispatch_group_enter((dispatch_group_t)v205[5]);
    v199[0] = _NSConcreteStackBlock;
    v199[1] = 3221225472;
    v199[2] = sub_100021FD4;
    v199[3] = &unk_100056410;
    v199[4] = v210;
    v199[5] = &v204;
    xpc_file_transfer_write_to_fd(v175, v163, v199);
    if (v39)
    {
      dispatch_group_enter((dispatch_group_t)v205[5]);
      v198[0] = _NSConcreteStackBlock;
      v198[1] = 3221225472;
      v198[2] = sub_1000220F4;
      v198[3] = &unk_100056410;
      v198[4] = v210;
      v198[5] = &v204;
      xpc_file_transfer_write_to_fd(v39, v120, v198);
    }
    if (v40)
    {
      dispatch_group_enter((dispatch_group_t)v205[5]);
      v197[0] = _NSConcreteStackBlock;
      v197[1] = 3221225472;
      v197[2] = sub_100022214;
      v197[3] = &unk_100056410;
      v197[4] = v210;
      v197[5] = &v204;
      xpc_file_transfer_write_to_fd(v40, v150, v197);
    }
    v157 = v205[5];
    v158 = sub_100021D54();
    v159 = objc_claimAutoreleasedReturnValue(v158);
    *(_QWORD *)block = _NSConcreteStackBlock;
    *(_QWORD *)&block[8] = 3221225472;
    *(_QWORD *)&block[16] = sub_100022334;
    v214 = (uint64_t (*)(uint64_t, uint64_t))&unk_100056438;
    v223 = v212;
    v219 = int64;
    v220 = v160;
    v215 = (void (*)(uint64_t))v39;
    v221 = v161;
    v216 = v40;
    v217 = v202;
    v222 = v162;
    v218 = v210;
    dispatch_group_notify(v157, v159, block);

    v38 = v169;
    dispatch_group_leave((dispatch_group_t)v205[5]);

    v33 = 0;
    goto LABEL_168;
  }
  v25 = v1;
  if (!sub_10003CF78(v25, "nonce-domain", (const _xpc_type_s *)&_xpc_type_uint64))
  {
    if (sub_10003CF78(v25, "nonce-domain-handle", (const _xpc_type_s *)&_xpc_type_uint64))
    {
      v49 = xpc_dictionary_get_uint64(v25, "nonce-domain-handle");
      if (img4_nonce_domain_get_from_handle())
        goto LABEL_49;
      v127 = sub_10001F764();
      v128 = (void *)objc_claimAutoreleasedReturnValue(v127);

      if (v128)
      {
        v129 = sub_10001F764();
        v130 = objc_claimAutoreleasedReturnValue(v129);
        if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
          v131 = 3;
        else
          v131 = 2;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v49;
        v132 = (char *)_os_log_send_and_compose_impl(v131, 0, 0, 0, &_mh_execute_header, v130, 16);

      }
      else
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v49;
        v132 = (char *)_os_log_send_and_compose_impl(2, 0, 0, 0, &_mh_execute_header, &_os_log_default, 16);
      }
      v124 = sub_10000A6F8("_remote_service_roll_nonce", "sub_remote_service.m", 211, "com.apple.security.cryptex", 10, 0, v132);
      free(v132);
      v125 = sub_10003D890(v25, 0, v124);
    }
    else
    {
      v79 = sub_10001F764();
      v80 = (void *)objc_claimAutoreleasedReturnValue(v79);

      if (v80)
      {
        v81 = sub_10001F764();
        v82 = objc_claimAutoreleasedReturnValue(v81);
        if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
          v83 = 3;
        else
          v83 = 2;
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "nonce-domain";
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "nonce-domain-handle";
        v84 = (char *)_os_log_send_and_compose_impl(v83, 0, 0, 0, &_mh_execute_header, v82, 16);

      }
      else
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "nonce-domain";
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "nonce-domain-handle";
        v84 = (char *)_os_log_send_and_compose_impl(2, 0, 0, 0, &_mh_execute_header, &_os_log_default, 16);
      }
      v124 = sub_10000A6F8("_remote_service_roll_nonce", "sub_remote_service.m", 221, "com.apple.security.cryptex", 11, 0, v84);
      free(v84);
      v125 = sub_10003D890(v25, 0, v124);
    }
LABEL_145:
    v10 = v125;
    if (v124)
      CFRelease(v124);
    goto LABEL_147;
  }
  v26 = xpc_dictionary_get_uint64(v25, "nonce-domain");
  if (!sub_1000065F4(v26))
  {
    v27 = sub_10001F764();
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);

    if (v28)
    {
      v29 = sub_10001F764();
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        v31 = 3;
      else
        v31 = 2;
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v26;
      v32 = (char *)_os_log_send_and_compose_impl(v31, 0, 0, 0, &_mh_execute_header, v30, 16);

    }
    else
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v26;
      v32 = (char *)_os_log_send_and_compose_impl(2, 0, 0, 0, &_mh_execute_header, &_os_log_default, 16);
    }
    v124 = sub_10000A6F8("_remote_service_roll_nonce", "sub_remote_service.m", 196, "com.apple.security.cryptex", 10, 0, v32);
    free(v32);
    v125 = sub_10003D890(v25, 0, v124);
    goto LABEL_145;
  }
LABEL_49:
  v50 = img4_nonce_domain_roll_nonce();
  if (v50)
  {
    v51 = v50;
    v52 = sub_10001F764();
    v53 = (void *)objc_claimAutoreleasedReturnValue(v52);

    if (v53)
    {
      v54 = sub_10001F764();
      v55 = objc_claimAutoreleasedReturnValue(v54);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        v56 = 3;
      else
        v56 = 2;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v51;
      v57 = (char *)_os_log_send_and_compose_impl(v56, 0, 0, 0, &_mh_execute_header, v55, 16);

    }
    else
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v51;
      v57 = (char *)_os_log_send_and_compose_impl(2, 0, 0, 0, &_mh_execute_header, &_os_log_default, 16);
    }
    v124 = sub_10000A6F8("_remote_service_roll_nonce", "sub_remote_service.m", 231, "com.apple.security.cryptex.posix", v51, 0, v57);
    free(v57);
    v125 = sub_10003D890(v25, 0, v124);
    goto LABEL_145;
  }
  v85 = xpc_dictionary_create_empty();
  v86 = sub_10003D890(v25, v85, 0);

  v10 = v86;
LABEL_147:

LABEL_10:
  if (v10)
  {
    sub_100021870(v10);

  }
LABEL_12:

}

void sub_10002142C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  _Block_object_dispose(&STACK[0x208], 8);
  _Block_object_dispose(&STACK[0x238], 8);
  _Block_object_dispose(&STACK[0x268], 8);
  _Block_object_dispose(&a38, 8);
  _Unwind_Resume(a1);
}

void sub_100021528(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.libcryptex", "remote_service");
  v2 = (void *)qword_10005A870;
  qword_10005A870 = (uint64_t)v1;

}

void sub_100021558(void *a1)
{
  id v1;
  uint64_t v2;
  NSObject *v3;
  id v4;
  _QWORD block[4];
  id v6;

  v1 = a1;
  v2 = sub_100008E88();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100023C6C;
  block[3] = &unk_1000550E0;
  v6 = v1;
  v4 = v1;
  dispatch_async(v3, block);

}

void sub_1000215E0(void *a1)
{
  id v1;
  id v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  char *v7;
  CFErrorRef v8;
  __CFError *v9;
  id v10;
  int v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  __CFError *v17;
  _OWORD v18[9];

  v1 = a1;
  memset(v18, 0, sizeof(v18));
  LOWORD(v18[0]) = 6;
  if (img4_chip_instantiate(&_img4_chip_cryptex1_generic, v18))
  {
    v2 = sub_10001F764();
    v3 = (void *)objc_claimAutoreleasedReturnValue(v2);

    if (v3)
    {
      v4 = sub_10001F764();
      v5 = objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        v6 = 3;
      else
        v6 = 2;
      *(_DWORD *)buf = 67109120;
      LODWORD(v17) = 5;
      v7 = (char *)_os_log_send_and_compose_impl(v6, 0, 0, 0, &_mh_execute_header, v5, 16);

    }
    else
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v17) = 5;
      v7 = (char *)_os_log_send_and_compose_impl(2, 0, 0, 0, &_mh_execute_header, &_os_log_default, 16);
    }
    v9 = sub_10000A6F8("_remote_service_read_personalization_identifiers", "sub_remote_service.m", 837, "com.apple.security.cryptex.posix", 5, 0, v7);
    free(v7);
LABEL_13:
    v10 = 0;
    goto LABEL_14;
  }
  v15 = 0;
  v8 = sub_1000099A4((uint64_t)v18, &v15);
  v9 = (__CFError *)objc_claimAutoreleasedReturnValue(v8);
  v10 = v15;
  if (v9)
  {
    v11 = *__error();
    v12 = sub_10001F764();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to encode AppleImage4 chip instance.: %@", buf, 0xCu);
    }

    *__error() = v11;
    goto LABEL_13;
  }
LABEL_14:
  v14 = sub_10003D890(v1, v10, v9);
  sub_100021870(v14);

}

void sub_100021854(_Unwind_Exception *a1)
{
  void *v1;

  free(v1);
  _Unwind_Resume(a1);
}

void sub_100021870(void *a1)
{
  id v1;
  id v2;
  NSObject *v3;
  char *v4;
  int v5;
  id v6;
  NSObject *v7;
  int v8;
  char *v9;

  v1 = a1;
  v2 = sub_100021D54();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  dispatch_assert_queue_V2(v3);

  v4 = xpc_copy_description(v1);
  v5 = *__error();
  v6 = sub_10001F764();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 136315138;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "remote service reply: %s", (uint8_t *)&v8, 0xCu);
  }

  *__error() = v5;
  xpc_dictionary_send_reply(v1);
  free(v4);

}

void sub_100021960(_Unwind_Exception *a1)
{
  void *v1;

  free(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100021980(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100021990(uint64_t a1)
{

}

void sub_100021998(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7)
{
  int v8;
  int v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  int v22;
  id v23;
  NSObject *v24;
  void *v25;
  int v26;
  id v27;
  NSObject *v28;
  void *v29;
  int v30;
  id v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  _QWORD *v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  uint8_t buf[4];
  int v43;

  v40 = a4;
  v41 = a3;
  v38 = a6;
  v39 = a5;
  v37 = a7;
  if (a2)
  {
    v8 = a2;
    v9 = *__error();
    v10 = sub_10001F764();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v43 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "file transfer failed: %{darwin.errno}d", buf, 8u);
    }
    v12 = 0;
LABEL_5:

    *__error() = v9;
    v13 = sub_10003D10C(*(void **)(a1 + 40), 0, v8);
    sub_100021870(v13);
    goto LABEL_6;
  }
  v12 = (id)cryptex_core_create(0);
  v14 = cryptex_core_set_assets_from_fds(v12, *(_QWORD *)(a1 + 56), &v41, &v40, &v38, &v39, &v37);
  if (v14)
  {
    v8 = v14;
    v9 = *__error();
    v15 = sub_10001F764();
    v11 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v43 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "set assets to core from fds failed: %{darwin.errno}d", buf, 8u);
    }
    goto LABEL_5;
  }
  v13 = (void *)cryptex_core_cx1_properties_create_with_xpc_dictionary(*(_QWORD *)(a1 + 32));
  if (v13)
    cryptex_core_set_cryptex1_properties(v12);
  v16 = *(void **)(a1 + 40);
  v17 = *(_QWORD *)(a1 + 64);
  v18 = *(_QWORD *)(a1 + 72);
  v19 = *(_QWORD *)(a1 + 80);
  v20 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v21 = v16;
  v12 = v12;
  if (v17 != 2)
  {
    if (v17 != 1)
    {
      v30 = *__error();
      v31 = sub_10001F764();
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "using default signing service", buf, 2u);
      }

      v29 = 0;
      *__error() = v30;
      goto LABEL_23;
    }
    v22 = *__error();
    v23 = sub_10001F764();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "using supplemental signing service", buf, 2u);
    }

    *__error() = v22;
    v25 = (void *)cryptex_host_create(0, 1);
    cryptex_core_attach_host(v12, v25);

  }
  v26 = *__error();
  v27 = sub_10001F764();
  v28 = objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "using NO signing service", buf, 2u);
  }

  *__error() = v26;
  v29 = (void *)cryptex_host_create(0, 4);
  cryptex_core_attach_host(v12, v29);
LABEL_23:
  v33 = v18 + 1;
  if (v19)
    v34 = 2;
  else
    v34 = 1;
  cryptex_core_set_install_persistence(v12, v33);
  cryptex_core_set_nonce_persistence(v12, v34);
  v35 = v20;
  v36 = sub_100037F90(v35, 0, 0, 0, v21, (uint64_t)sub_100022EE8);
  sub_100016474(v35, v12, (uint64_t)v36);

LABEL_6:
}

id sub_100021D24(uint64_t a1, uint64_t a2)
{
  id result;

  result = objc_retainBlock(*(id *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void sub_100021D4C(uint64_t a1)
{

}

id sub_100021D54()
{
  if (qword_10005A878 != -1)
    dispatch_once(&qword_10005A878, &stru_100056458);
  return (id)qword_10005A880;
}

void sub_100021D94(uint64_t a1, int a2)
{
  int v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  _DWORD v8[2];

  v4 = *__error();
  v5 = sub_10001F764();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8[0] = 67109120;
      v8[1] = a2;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "image file transfer: %{darwin.errno}d", (uint8_t *)v8, 8u);
    }

    *__error() = v4;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v8[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "image file transfer [no error]", (uint8_t *)v8, 2u);
    }

    *__error() = v4;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void sub_100021EB4(uint64_t a1, int a2)
{
  int v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  _DWORD v8[2];

  v4 = *__error();
  v5 = sub_10001F764();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8[0] = 67109120;
      v8[1] = a2;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "trustcache file transfer: %{darwin.errno}d", (uint8_t *)v8, 8u);
    }

    *__error() = v4;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v8[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "trustcache file transfer [no error]", (uint8_t *)v8, 2u);
    }

    *__error() = v4;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void sub_100021FD4(uint64_t a1, int a2)
{
  int v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  _DWORD v8[2];

  v4 = *__error();
  v5 = sub_10001F764();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8[0] = 67109120;
      v8[1] = a2;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "im4m file transfer: %{darwin.errno}d", (uint8_t *)v8, 8u);
    }

    *__error() = v4;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v8[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "im4m file transfer [no error]", (uint8_t *)v8, 2u);
    }

    *__error() = v4;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void sub_1000220F4(uint64_t a1, int a2)
{
  int v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  _DWORD v8[2];

  v4 = *__error();
  v5 = sub_10001F764();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8[0] = 67109120;
      v8[1] = a2;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "info file transfer: %{darwin.errno}d", (uint8_t *)v8, 8u);
    }

    *__error() = v4;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v8[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "info file transfer [no error]", (uint8_t *)v8, 2u);
    }

    *__error() = v4;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void sub_100022214(uint64_t a1, int a2)
{
  int v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  _DWORD v8[2];

  v4 = *__error();
  v5 = sub_10001F764();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8[0] = 67109120;
      v8[1] = a2;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "volume hash file transfer: %{darwin.errno}d", (uint8_t *)v8, 8u);
    }

    *__error() = v4;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v8[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "volume hash file transfer [no error]", (uint8_t *)v8, 2u);
    }

    *__error() = v4;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

uint64_t sub_100022334(uint64_t a1)
{
  int v2;
  id v3;
  NSObject *v4;
  int *v5;
  char *v6;
  unint64_t v7;
  const char *v8;
  int v9;
  NSObject *v10;
  int v11;
  void *v12;
  int v13;
  int v14;
  id v15;
  NSObject *v16;
  int *v17;
  char *v18;
  unint64_t v19;
  const char *v20;
  int v21;
  NSObject *v22;
  int v23;
  void *v24;
  int v25;
  int v26;
  id v27;
  NSObject *v28;
  int *v29;
  char *v30;
  unint64_t v31;
  const char *v32;
  int v33;
  NSObject *v34;
  int v35;
  void *v36;
  int v37;
  int v38;
  id v39;
  NSObject *v40;
  int *v41;
  char *v42;
  unint64_t v43;
  const char *v44;
  int v45;
  NSObject *v46;
  int v47;
  void *v48;
  int v49;
  int v50;
  id v51;
  NSObject *v52;
  int *v53;
  char *v54;
  unint64_t v55;
  const char *v56;
  int v57;
  NSObject *v58;
  int v59;
  void *v60;
  int v61;
  stat v63;
  uint8_t buf[4];
  const char *v65;
  __int16 v66;
  int v67;
  __int16 v68;
  const char *v69;
  __int16 v70;
  off_t st_size;
  __int16 v72;
  void *v73;
  __int16 v74;
  char *v75;
  char __str[1024];

  v2 = openat(*(_DWORD *)(a1 + 96), *(const char **)(cryptex_asset_types[*(_QWORD *)(a1 + 64)] + 40), 0, 438);
  v3 = sub_10001F764();
  v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  bzero(__str, 0x400uLL);
  memset(&v63, 0, sizeof(v63));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    if (fstat(v2, &v63) == -1)
    {
      v9 = *__error();
      v10 = v4;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = *__error();
        *(_DWORD *)buf = 136315650;
        v65 = "imagefd_r";
        v66 = 1024;
        v67 = v2;
        v68 = 1024;
        LODWORD(v69) = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s fd[%d] : [invalid descriptor]: %{darwin.errno}d", buf, 0x18u);
      }

      *__error() = v9;
    }
    else
    {
      if (fcntl(v2, 50, __str))
      {
        v5 = __error();
        v6 = strerror(*v5);
        snprintf(__str, 0x400uLL, "[%s]", v6);
      }
      v7 = ((unint64_t)v63.st_mode >> 12) ^ 8;
      if ((_DWORD)v7 == 15)
        v8 = "[unknown]";
      else
        v8 = off_1000569B8[v7];
      v12 = (void *)os_flagset_copy_string(&unk_100056478, v63.st_flags);
      v13 = *__error();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136316418;
        v65 = "imagefd_r";
        v66 = 1024;
        v67 = v2;
        v68 = 2080;
        v69 = v8;
        v70 = 2048;
        st_size = v63.st_size;
        v72 = 2080;
        v73 = v12;
        v74 = 2080;
        v75 = __str;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s fd[%d]: type = %s, size = %lld, flags = %s, path = %s", buf, 0x3Au);
      }
      *__error() = v13;
      free(v12);
    }
  }

  v14 = openat(*(_DWORD *)(a1 + 96), *(const char **)(*(_QWORD *)(a1 + 72) + 40), 514, 438);
  v15 = sub_10001F764();
  v16 = (id)objc_claimAutoreleasedReturnValue(v15);
  bzero(__str, 0x400uLL);
  memset(&v63, 0, sizeof(v63));
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    if (fstat(v14, &v63) == -1)
    {
      v21 = *__error();
      v22 = v16;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = *__error();
        *(_DWORD *)buf = 136315650;
        v65 = "tcfd_r";
        v66 = 1024;
        v67 = v14;
        v68 = 1024;
        LODWORD(v69) = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s fd[%d] : [invalid descriptor]: %{darwin.errno}d", buf, 0x18u);
      }

      *__error() = v21;
    }
    else
    {
      if (fcntl(v14, 50, __str))
      {
        v17 = __error();
        v18 = strerror(*v17);
        snprintf(__str, 0x400uLL, "[%s]", v18);
      }
      v19 = ((unint64_t)v63.st_mode >> 12) ^ 8;
      if ((_DWORD)v19 == 15)
        v20 = "[unknown]";
      else
        v20 = off_1000569B8[v19];
      v24 = (void *)os_flagset_copy_string(&unk_100056478, v63.st_flags);
      v25 = *__error();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136316418;
        v65 = "tcfd_r";
        v66 = 1024;
        v67 = v14;
        v68 = 2080;
        v69 = v20;
        v70 = 2048;
        st_size = v63.st_size;
        v72 = 2080;
        v73 = v24;
        v74 = 2080;
        v75 = __str;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s fd[%d]: type = %s, size = %lld, flags = %s, path = %s", buf, 0x3Au);
      }
      *__error() = v25;
      free(v24);
    }
  }

  v26 = openat(*(_DWORD *)(a1 + 96), *((const char **)&_cryptex_asset_type_im4m + 5), 514, 438);
  v27 = sub_10001F764();
  v28 = (id)objc_claimAutoreleasedReturnValue(v27);
  bzero(__str, 0x400uLL);
  memset(&v63, 0, sizeof(v63));
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    if (fstat(v26, &v63) == -1)
    {
      v33 = *__error();
      v34 = v28;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v35 = *__error();
        *(_DWORD *)buf = 136315650;
        v65 = "im4mfd_r";
        v66 = 1024;
        v67 = v26;
        v68 = 1024;
        LODWORD(v69) = v35;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%s fd[%d] : [invalid descriptor]: %{darwin.errno}d", buf, 0x18u);
      }

      *__error() = v33;
    }
    else
    {
      if (fcntl(v26, 50, __str))
      {
        v29 = __error();
        v30 = strerror(*v29);
        snprintf(__str, 0x400uLL, "[%s]", v30);
      }
      v31 = ((unint64_t)v63.st_mode >> 12) ^ 8;
      if ((_DWORD)v31 == 15)
        v32 = "[unknown]";
      else
        v32 = off_1000569B8[v31];
      v36 = (void *)os_flagset_copy_string(&unk_100056478, v63.st_flags);
      v37 = *__error();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136316418;
        v65 = "im4mfd_r";
        v66 = 1024;
        v67 = v26;
        v68 = 2080;
        v69 = v32;
        v70 = 2048;
        st_size = v63.st_size;
        v72 = 2080;
        v73 = v36;
        v74 = 2080;
        v75 = __str;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "%s fd[%d]: type = %s, size = %lld, flags = %s, path = %s", buf, 0x3Au);
      }
      *__error() = v37;
      free(v36);
    }
  }

  if (*(_QWORD *)(a1 + 32))
  {
    v38 = openat(*(_DWORD *)(a1 + 96), *(const char **)(*(_QWORD *)(a1 + 80) + 40), 514, 438);
    v39 = sub_10001F764();
    v40 = (id)objc_claimAutoreleasedReturnValue(v39);
    bzero(__str, 0x400uLL);
    memset(&v63, 0, sizeof(v63));
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      if (fstat(v38, &v63) == -1)
      {
        v45 = *__error();
        v46 = v40;
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          v47 = *__error();
          *(_DWORD *)buf = 136315650;
          v65 = "infofd_r";
          v66 = 1024;
          v67 = v38;
          v68 = 1024;
          LODWORD(v69) = v47;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%s fd[%d] : [invalid descriptor]: %{darwin.errno}d", buf, 0x18u);
        }

        *__error() = v45;
      }
      else
      {
        if (fcntl(v38, 50, __str))
        {
          v41 = __error();
          v42 = strerror(*v41);
          snprintf(__str, 0x400uLL, "[%s]", v42);
        }
        v43 = ((unint64_t)v63.st_mode >> 12) ^ 8;
        if ((_DWORD)v43 == 15)
          v44 = "[unknown]";
        else
          v44 = off_1000569B8[v43];
        v48 = (void *)os_flagset_copy_string(&unk_100056478, v63.st_flags);
        v49 = *__error();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136316418;
          v65 = "infofd_r";
          v66 = 1024;
          v67 = v38;
          v68 = 2080;
          v69 = v44;
          v70 = 2048;
          st_size = v63.st_size;
          v72 = 2080;
          v73 = v48;
          v74 = 2080;
          v75 = __str;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "%s fd[%d]: type = %s, size = %lld, flags = %s, path = %s", buf, 0x3Au);
        }
        *__error() = v49;
        free(v48);
      }
    }

  }
  if (*(_QWORD *)(a1 + 40))
  {
    v50 = openat(*(_DWORD *)(a1 + 96), *(const char **)(*(_QWORD *)(a1 + 88) + 40), 514, 438);
    v51 = sub_10001F764();
    v52 = (id)objc_claimAutoreleasedReturnValue(v51);
    bzero(__str, 0x400uLL);
    memset(&v63, 0, sizeof(v63));
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
    {
      if (fstat(v50, &v63) == -1)
      {
        v57 = *__error();
        v58 = v52;
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          v59 = *__error();
          *(_DWORD *)buf = 136315650;
          v65 = "volhashfd_r";
          v66 = 1024;
          v67 = v50;
          v68 = 1024;
          LODWORD(v69) = v59;
          _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "%s fd[%d] : [invalid descriptor]: %{darwin.errno}d", buf, 0x18u);
        }

        *__error() = v57;
      }
      else
      {
        if (fcntl(v50, 50, __str))
        {
          v53 = __error();
          v54 = strerror(*v53);
          snprintf(__str, 0x400uLL, "[%s]", v54);
        }
        v55 = ((unint64_t)v63.st_mode >> 12) ^ 8;
        if ((_DWORD)v55 == 15)
          v56 = "[unknown]";
        else
          v56 = off_1000569B8[v55];
        v60 = (void *)os_flagset_copy_string(&unk_100056478, v63.st_flags);
        v61 = *__error();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136316418;
          v65 = "volhashfd_r";
          v66 = 1024;
          v67 = v50;
          v68 = 2080;
          v69 = v56;
          v70 = 2048;
          st_size = v63.st_size;
          v72 = 2080;
          v73 = v60;
          v74 = 2080;
          v75 = __str;
          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEBUG, "%s fd[%d]: type = %s, size = %lld, flags = %s, path = %s", buf, 0x3Au);
        }
        *__error() = v61;
        free(v60);
      }
    }

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) + 16))();
}

void sub_100022EAC(id a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;

  v4 = sub_100008E6C();
  v1 = sub_100008E9C((uint64_t)v4);
  v2 = objc_claimAutoreleasedReturnValue(v1);
  v3 = (void *)qword_10005A880;
  qword_10005A880 = v2;

}

void sub_100022EE8(void *a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  int v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  _QWORD block[4];
  id v17;
  id v18;
  _QWORD *v19;
  _QWORD v20[4];
  uint8_t buf[4];
  id v22;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = a4;
  v10 = *(id *)(a4 + 56);
  if (v9)
  {
    v11 = *__error();
    v12 = sub_10001F764();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "installation failed: %@", buf, 0xCu);
    }

    *__error() = v11;
    v14 = sub_100021D54();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000232B0;
    block[3] = &unk_100056880;
    v17 = v10;
    v18 = v9;
    v19 = v20;
    dispatch_async(v15, block);

  }
  else
  {
    sub_100017648((uint64_t)v7, v8, a4, (uint64_t)sub_1000230C4);
  }

  _Block_object_dispose(v20, 8);
}

void sub_1000230A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000230C4(void *a1, void *a2, const void *a3, uint64_t a4)
{
  id v7;
  id v8;
  id v9;
  int v10;
  id v11;
  NSObject *v12;
  CFTypeRef v13;
  id v14;
  NSObject *v15;
  _QWORD block[4];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t buf[4];
  const void *v25;

  v7 = a1;
  v8 = a2;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = a4;
  v9 = *(id *)(a4 + 56);
  if (a3)
  {
    v10 = *__error();
    v11 = sub_10001F764();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v25 = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "bootstrap failed, unbootstrapping: %@", buf, 0xCu);
    }

    *__error() = v10;
    v13 = CFRetain(a3);
    *(_QWORD *)(v21[3] + 16) = v13;
    sub_10001783C((uint64_t)v7, v8, 1uLL, a4, (uint64_t)sub_100023300);
  }
  else
  {
    v14 = sub_100021D54();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100023430;
    block[3] = &unk_100056880;
    v17 = v8;
    v18 = v9;
    v19 = &v20;
    dispatch_async(v15, block);

  }
  _Block_object_dispose(&v20, 8);

}

void sub_10002328C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000232B0(uint64_t a1)
{
  id v2;

  v2 = sub_10003D890(*(void **)(a1 + 32), 0, *(__CFError **)(a1 + 40));
  sub_100021870(v2);
  sub_100038008((uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));

}

void sub_100023300(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  dispatch_queue_t *v8;
  int v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  int v17;
  uint64_t v18;

  v7 = a2;
  v8 = a1;
  v9 = *__error();
  v10 = sub_10001F764();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (a3)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v17 = 138412290;
      v18 = a3;
      v13 = "unbootstrap: %@";
      v14 = v12;
      v15 = OS_LOG_TYPE_ERROR;
      v16 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v14, v15, v13, (uint8_t *)&v17, v16);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v17) = 0;
    v13 = "unbootstrap [no error]";
    v14 = v12;
    v15 = OS_LOG_TYPE_DEBUG;
    v16 = 2;
    goto LABEL_6;
  }

  *__error() = v9;
  sub_100016EB4(v8, v7, a4, (uint64_t)sub_100023504);

}

void sub_100023430(uint64_t a1)
{
  xpc_object_t empty;
  id v3;
  xpc_object_t v4;
  uint64_t v5;
  id v6;

  empty = xpc_dictionary_create_empty();
  v3 = *(id *)(a1 + 32);
  v4 = xpc_dictionary_create_empty();
  v5 = sub_1000311B8((uint64_t)v3);

  xpc_dictionary_set_string(v4, "remote-cryptex-identifier", *(const char **)v5);
  xpc_dictionary_set_string(v4, "remote-cryptex-version", **(const char ***)(v5 + 16));
  xpc_dictionary_set_value(empty, "remote-cryptex", v4);
  v6 = sub_10003D890(*(void **)(a1 + 40), empty, 0);
  sub_100021870(v6);
  sub_100038008((uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));

}

void sub_100023504(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  id v8;
  id v9;
  int v10;
  id v11;
  NSObject *v12;
  int v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD *v21;
  _QWORD v22[4];
  uint8_t buf[4];
  uint64_t v24;

  v7 = a1;
  v8 = a2;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = a4;
  v9 = *(id *)(a4 + 56);
  if (a3)
  {
    v10 = *__error();
    v11 = sub_10001F764();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v24 = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "uninstall: %@", buf, 0xCu);
    }

    *__error() = v10;
  }
  else
  {
    v13 = *__error();
    v14 = sub_10001F764();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "uninstall [no error]", buf, 2u);
    }

    *__error() = v13;
  }
  v16 = sub_100021D54();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100023700;
  v19[3] = &unk_1000568A8;
  v20 = v9;
  v21 = v22;
  v18 = v9;
  dispatch_async(v17, v19);

  _Block_object_dispose(v22, 8);
}

void sub_1000236DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100023700(uint64_t a1)
{
  __CFError *v2;
  void *v3;

  v2 = *(__CFError **)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) + 16);
  v3 = sub_10003D890(*(void **)(a1 + 32), 0, v2);
  sub_100021870(v3);
  sub_100038008((uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));

  if (v2)
    CFRelease(v2);
}

void sub_100023774(_Unwind_Exception *exception_object)
{
  const void *v1;

  if (v1)
    CFRelease(v1);
  _Unwind_Resume(exception_object);
}

void sub_100023790(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  _QWORD v9[5];
  int v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  int v14;

  v2 = sub_100017DE4(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(char **)(a1 + 48), *(_QWORD *)(a1 + 56));
  if (v2)
  {
    sub_10001783C(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v2, *(_QWORD *)(a1 + 64), (uint64_t)*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), (uint64_t)sub_10002390C);
  }
  else
  {
    v3 = *__error();
    v4 = sub_10001F764();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 136315394;
      v12 = v6;
      v13 = 1024;
      v14 = 2;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "failed to find cryptex with identifier %s: %{darwin.errno}d", buf, 0x12u);
    }

    *__error() = v3;
    v7 = sub_100021D54();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100023A48;
    v9[3] = &unk_1000568D0;
    v9[4] = *(_QWORD *)(a1 + 40);
    v10 = 2;
    dispatch_async(v8, v9);

  }
}

void sub_10002390C(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  dispatch_queue_t *v9;
  int v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint32_t v17;
  int v18;
  uint64_t v19;

  v7 = a4;
  v8 = a2;
  v9 = a1;
  v10 = *__error();
  v11 = sub_10001F764();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  if (a3)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v18 = 138412290;
      v19 = a3;
      v14 = "unbootstrap: %@";
      v15 = v13;
      v16 = OS_LOG_TYPE_ERROR;
      v17 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v15, v16, v14, (uint8_t *)&v18, v17);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v18) = 0;
    v14 = "unbootstrap [no error]";
    v15 = v13;
    v16 = OS_LOG_TYPE_DEBUG;
    v17 = 2;
    goto LABEL_6;
  }

  *__error() = v10;
  sub_100016EB4(v9, v8, (uint64_t)v7, (uint64_t)sub_100023A88);

}

void sub_100023A48(uint64_t a1)
{
  id v1;

  v1 = sub_10003D10C(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), 0, *(_DWORD *)(a1 + 40));
  sub_100021870(v1);

}

void sub_100023A88(uint64_t a1, uint64_t a2, CFIndex a3, void *a4)
{
  int v6;
  int v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  int v16;
  uint8_t buf[4];
  CFIndex v18;

  if (a3)
  {
    v6 = sub_10000A88C(a3);
    v7 = *__error();
    v8 = sub_10001F764();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = a3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "uninstall: %@", buf, 0xCu);
    }
  }
  else
  {
    v7 = *__error();
    v10 = sub_10001F764();
    v9 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "uninstall [no error]", buf, 2u);
    }
    v6 = 0;
  }

  *__error() = v7;
  v11 = sub_100021D54();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100023C10;
  v14[3] = &unk_100056920;
  v15 = a4;
  v16 = v6;
  v13 = a4;
  dispatch_async(v12, v14);

}

void sub_100023C10(uint64_t a1)
{
  void *v2;
  xpc_object_t empty;
  id v4;

  v2 = *(void **)(a1 + 32);
  empty = xpc_dictionary_create_empty();
  v4 = sub_10003D10C(v2, empty, *(_DWORD *)(a1 + 40));

  sub_100021870(v4);
}

void sub_100023C6C(uint64_t a1)
{
  id v2;

  v2 = sub_100014FE0();
  sub_100017E54(v2, (uint64_t)*(id *)(a1 + 32), (uint64_t)sub_100023CB8);

}

void sub_100023CB8(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  xpc_object_t v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  NSObject *v16;
  id v17;

  v3 = a2;
  v4 = a1;
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100023DEC;
  v15[3] = &unk_100056970;
  v16 = v5;
  v6 = xpc_array_create_empty();
  v17 = v6;
  v7 = v5;
  sub_1000181A0((uint64_t)v4, (uint64_t)v15);

  v8 = sub_100021D54();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100023FB0;
  v12[3] = &unk_100056998;
  v13 = v6;
  v14 = v3;
  v10 = v3;
  v11 = v6;
  dispatch_group_notify(v7, v9, v12);

  dispatch_group_leave(v7);
}

uint64_t sub_100023DEC(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void **v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id v11;
  id v12;

  v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v6 = _NSConcreteStackBlock;
  v7 = 3221225472;
  v8 = sub_100023E98;
  v9 = &unk_100056948;
  v10 = v3;
  v11 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 32);
  v4 = v3;
  cryptex_async();

  return 1;
}

void sub_100023E98(uint64_t a1)
{
  uint64_t v2;
  xpc_object_t empty;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;

  v2 = sub_1000311B8(*(_QWORD *)(a1 + 32));
  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_string(empty, "remote-cryptex-identifier", *(const char **)v2);
  xpc_dictionary_set_string(empty, "remote-cryptex-version", **(const char ***)(v2 + 16));
  v4 = sub_100008E88();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100023F84;
  block[3] = &unk_100056948;
  v8 = *(id *)(a1 + 40);
  v9 = empty;
  v10 = *(id *)(a1 + 48);
  v6 = empty;
  dispatch_async(v5, block);

}

void sub_100023F84(uint64_t a1)
{
  xpc_array_append_value(*(xpc_object_t *)(a1 + 32), *(xpc_object_t *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_100023FB0(uint64_t a1)
{
  void *v2;
  id empty;

  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_value(empty, "remote-cryptex-array", *(xpc_object_t *)(a1 + 32));
  v2 = sub_10003D10C(*(void **)(a1 + 40), empty, 0);
  sub_100021870(v2);

}

uint64_t sub_10002400C(unsigned int *a1, CFTypeRef *a2)
{
  CFMutableDictionaryRef v4;
  __CFDictionary *v5;
  char *v6;
  CFStringRef v7;
  const __CFUUID *v8;
  const __CFUUID *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  NSObject *v13;
  CFNumberRef v14;
  CFDataRef v15;
  const __CFData *v16;
  io_service_t v17;
  size_t v19;
  CFDataRef v20;
  CFNumberRef v21;
  int v22;
  NSObject *v23;
  const __CFData *Data;
  const UInt8 *BytePtr;
  CFIndex Length;
  const __CFDictionary *v27;
  io_service_t MatchingService;
  int v29;
  NSObject *v30;
  NSObject *v31;
  kern_return_t v32;
  kern_return_t v33;
  NSObject *v34;
  int v35;
  NSObject *v36;
  int v37;
  int v38;
  size_t outputStructCnt;
  int outputStruct;
  io_connect_t connect;
  uint64_t v42;
  char __s[1024];
  uint64_t inputStruct;
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
  uint8_t buf[88];

  connect = 0;
  v60 = 0;
  v59 = 0u;
  v58 = 0u;
  v57 = 0u;
  v56 = 0u;
  v55 = 0u;
  v54 = 0u;
  v53 = 0u;
  v52 = 0u;
  v51 = 0u;
  v50 = 0u;
  v49 = 0u;
  v48 = 0u;
  v47 = 0u;
  v46 = 0u;
  v45 = 0u;
  inputStruct = 0x1BEEFFEEDLL;
  outputStruct = 0;
  outputStructCnt = 4;
  bzero(__s, 0x400uLL);
  v4 = sub_10000A554();
  if (!v4)
    sub_10003FADC(&v42, buf);
  v5 = v4;
  v6 = (char *)*((_QWORD *)a1 + 1);
  if (v6)
  {
    v7 = sub_10000A430(v6);
    v8 = 0;
  }
  else
  {
    v9 = CFUUIDCreate(0);
    if (!v9)
      sub_10003FB58(&v42, buf);
    v8 = v9;
    v7 = CFUUIDCreateString(0, v9);
    if (!v7)
      sub_10003FBD4(&v42, buf);
  }
  CFDictionarySetValue(v5, CFSTR("hdik-unique-identifier"), v7);
  CFDictionarySetValue(v5, CFSTR("autodiskmount"), kCFBooleanFalse);
  CFDictionarySetValue(v5, CFSTR("write-protected"), kCFBooleanTrue);
  v10 = realpath_np(*a1, __s);
  if ((_DWORD)v10)
  {
    v11 = v10;
    v12 = *__error();
    v13 = *((_QWORD *)a1 + 259);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "realpath_np: %{darwin.errno}d", buf, 8u);
    }
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    *__error() = v12;
  }
  else
  {
    v19 = strlen(__s);
    v20 = CFDataCreate(0, (const UInt8 *)__s, v19);
    if (!v20)
      sub_10003FC50(&v42, buf);
    v15 = v20;
    CFDictionarySetValue(v5, CFSTR("image-path"), v20);
    v21 = sub_10000A388(*a1);
    if (!v21)
      sub_10003FCCC(&v42, buf);
    v14 = v21;
    CFDictionarySetValue(v5, CFSTR("image-fd"), v21);
    v22 = *__error();
    v23 = *((_QWORD *)a1 + 259);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v5;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "attach args = %@", buf, 0xCu);
    }
    *__error() = v22;
    Data = CFPropertyListCreateData(0, v5, kCFPropertyListXMLFormat_v1_0, 0, 0);
    if (!Data)
      sub_10003FC50(&v42, buf);
    v16 = Data;
    BytePtr = CFDataGetBytePtr(Data);
    Length = CFDataGetLength(v16);
    if (Length < 0)
      sub_10003E4E4();
    *(_QWORD *)&v45 = BytePtr;
    *((_QWORD *)&v45 + 1) = Length;
    v27 = IOServiceMatching("IOHDIXController");
    MatchingService = IOServiceGetMatchingService(0, v27);
    if (MatchingService)
    {
      v17 = MatchingService;
      if (IOServiceOpen(MatchingService, mach_task_self_, 0, &connect))
      {
        v29 = *__error();
        v30 = *((_QWORD *)a1 + 259);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = 5;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "IOServiceOpen: %{mach.errno}x", buf, 8u);
        }
        *__error() = v29;
        v11 = 61;
      }
      else
      {
        v32 = IOConnectCallStructMethod(connect, 0, &inputStruct, 0x100uLL, &outputStruct, &outputStructCnt);
        if (v32)
        {
          v33 = v32;
          v38 = *__error();
          v34 = *((_QWORD *)a1 + 259);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v33;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "kIOHDIXControllerCreateDriveMethod: %{mach.errno}x", buf, 8u);
          }
          *__error() = v38;
          v11 = 83;
        }
        else
        {
          if (outputStructCnt != 4)
            sub_10003FDC0(&v42, buf);
          v35 = *__error();
          v36 = *((_QWORD *)a1 + 259);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = outputStruct;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "drive number: %d", buf, 8u);
          }
          *__error() = v35;
          v11 = 0;
          *a2 = CFRetain(v7);
        }
      }
    }
    else
    {
      v37 = *__error();
      v31 = *((_QWORD *)a1 + 259);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "IOHDIXController";
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "could not find %s", buf, 0xCu);
      }
      v17 = 0;
      *__error() = v37;
      v11 = 78;
    }
  }
  if (connect && IOServiceClose(connect))
    sub_10003FD48(&v42, buf);
  if (v17 - 1 <= 0xFFFFFFFD)
    mach_right_send_release(v17);
  if (v16)
    CFRelease(v16);
  if (v15)
    CFRelease(v15);
  if (v14)
    CFRelease(v14);
  if (v7)
    CFRelease(v7);
  if (v8)
    CFRelease(v8);
  CFRelease(v5);
  return v11;
}

uint64_t sub_1000245DC(uint64_t a1, const void *a2, const char **a3, char *a4, char *a5)
{
  IONotificationPortRef v10;
  IONotificationPort *v11;
  const __CFDictionary *v12;
  kern_return_t v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  const char *v17;
  io_registry_entry_t v18;
  io_object_t v19;
  CFTypeRef v20;
  const void *v21;
  const char *v22;
  int v23;
  NSObject *v24;
  int v25;
  unsigned int v26;
  int v27;
  NSObject *v28;
  char *v29;
  char *v30;
  const __CFString *v31;
  const char **v33;
  unsigned int v34;
  IONotificationPort *notify;
  const __CFString *v36;
  CFTypeRef cf;
  io_iterator_t notification;
  uint8_t v39[4];
  const void *v40;
  uint8_t buf[16];
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
  _BYTE v55[31];

  notification = 0;
  v36 = 0;
  cf = 0;
  v10 = IONotificationPortCreate(0);
  if (!v10)
    sub_10003FE54();
  v11 = v10;
  v12 = IOServiceMatching("IOMedia");
  notify = v11;
  v13 = IOServiceAddMatchingNotification(v11, "IOServiceMatched", v12, 0, 0, &notification);
  v14 = *__error();
  v15 = *(NSObject **)(a1 + 2072);
  if (v13)
  {
    if (os_log_type_enabled(*(os_log_t *)(a1 + 2072), OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "IOServiceAddMatchingNotification: %{mach.errno}x", buf, 8u);
    }
    *__error() = v14;
    IONotificationPortDestroy(v11);
    v16 = 0xFFFFFFFFLL;
    goto LABEL_36;
  }
  v33 = a3;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = a2;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "looking for drive: %@", buf, 0xCu);
  }
  v34 = 2;
  *__error() = v14;
  v17 = "/dev/";
  do
  {
    v18 = IOIteratorNext(notification);
    if (!v18)
      break;
    v19 = v18;
    v54 = 0u;
    memset(v55, 0, sizeof(v55));
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v47 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    *(_OWORD *)buf = 0u;
    v42 = 0u;
    v20 = IORegistryEntrySearchCFProperty(v18, "IOService", CFSTR("hdik-unique-identifier"), 0, 3u);
    if (v20)
    {
      v21 = v20;
      v22 = v17;
      v23 = *__error();
      v24 = *(NSObject **)(a1 + 2072);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v39 = 138412290;
        v40 = v21;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "found property: %@", v39, 0xCu);
      }
      *__error() = v23;
      if (CFEqual(a2, v21))
      {
        v17 = v22;
        if (IOObjectConformsTo(v19, "AppleAPFSVolume")
          || IOObjectConformsTo(v19, "AppleAPFSMedia")
          || IOObjectConformsTo(v19, "AppleAPFSContainerScheme")
          || IOObjectConformsTo(v19, "AppleAPFSContainer"))
        {
          v25 = 9;
LABEL_22:
          CFRelease(v21);
          goto LABEL_23;
        }
        v26 = sub_100024A10(*(NSObject **)(a1 + 2072), v19, v33, &cf, &v36);
        if (!v26)
        {
          v29 = sub_10000A444((const __CFString *)cf, (char *)buf, 255);
          if (!v29)
            sub_10003FEE4();
          snprintf(a4, 0x400uLL, "%s%s", v22, v29);
          v30 = sub_10000A444(v36, (char *)buf, 255);
          if (!v30)
            sub_10003FEE4();
          snprintf(a5, 0x400uLL, "%s%s", v22, v30);
          v34 = 0;
          v25 = 10;
          goto LABEL_22;
        }
        v34 = v26;
        v27 = *__error();
        v28 = *(NSObject **)(a1 + 2072);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v39 = 67109120;
          LODWORD(v40) = v34;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "failed to get device nodes: %{darwin.errno}d", v39, 8u);
        }
        v25 = 0;
        *__error() = v27;
      }
      else
      {
        v25 = 9;
      }
      v17 = v22;
      goto LABEL_22;
    }
    v25 = 9;
LABEL_23:
    if (IOObjectRelease(v19))
      sub_10003FE6C(v39, buf);
  }
  while (v25 != 10);
  v31 = v36;
  IONotificationPortDestroy(notify);
  if (v31)
    CFRelease(v31);
  v16 = v34;
LABEL_36:
  if (cf)
    CFRelease(cf);
  return v16;
}

uint64_t sub_100024A10(NSObject *a1, io_object_t object, const char **a3, _QWORD *a4, _QWORD *a5)
{
  io_registry_entry_t v8;
  const char *v10;
  const __CFAllocator *v11;
  CFTypeRef CFProperty;
  CFTypeRef v13;
  CFTypeID v14;
  int v15;
  CFBooleanRef v16;
  const __CFString *v17;
  const __CFBoolean *v18;
  const __CFBoolean *v19;
  CFTypeID v20;
  const __CFBoolean *v21;
  int v22;
  _BOOL4 v23;
  io_registry_entry_t v24;
  kern_return_t ParentEntry;
  kern_return_t v26;
  int v27;
  char v28;
  uint64_t v29;
  CFTypeRef v30;
  CFTypeRef v31;
  CFTypeID v32;
  CFTypeRef v33;
  const __CFBoolean *v34;
  const __CFString *v35;
  _QWORD *v36;
  int v37;
  int v38;
  const char *v40;
  CFTypeRef v41;
  const char **v42;
  _QWORD *v43;
  CFTypeRef v44;
  io_object_t objecta;
  io_registry_entry_t entry;
  uint64_t v47;
  uint8_t buf[80];

  v8 = object;
  if (IOObjectRetain(object))
    sub_10003FF2C(&v47, buf);
  entry = v8;
  if (IOObjectRetain(v8))
    sub_10003FF2C(&v47, buf);
  objecta = v8;
  if (sub_100010C60(&objecta, "AppleAPFSContainerScheme")
    || sub_100010C60(&objecta, "AppleAPFSMedia"))
  {
    v10 = "hfs";
  }
  else
  {
    v10 = "hfs";
    if (!sub_100010C60(&objecta, "AppleAPFSContainer")
      && !sub_100010C60(&objecta, "AppleAPFSVolume"))
    {
      v10 = "apfs";
      v8 = objecta;
    }
  }
  v11 = kCFAllocatorDefault;
  CFProperty = IORegistryEntryCreateCFProperty(v8, CFSTR("BSD Name"), kCFAllocatorDefault, 0);
  if (!CFProperty || (v13 = CFProperty, v14 = CFGetTypeID(CFProperty), v14 != CFStringGetTypeID()))
    sub_10003FEFC();
  v40 = v10;
  v42 = a3;
  v43 = a5;
  v15 = *__error();
  if (os_log_type_enabled(a1, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v13;
    _os_log_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_DEBUG, "subdevice node = %@", buf, 0xCu);
  }
  v41 = v13;
  v44 = 0;
  *__error() = v15;
  v16 = kCFBooleanTrue;
  v17 = CFSTR("Whole");
  do
  {
    v18 = (const __CFBoolean *)IORegistryEntryCreateCFProperty(entry, v17, v11, 0);
    v19 = v18;
    if (v18)
    {
      v20 = CFGetTypeID(v18);
      if (v20 == CFBooleanGetTypeID())
        v21 = v19;
      else
        v21 = 0;
    }
    else
    {
      v21 = 0;
    }
    v22 = *__error();
    v23 = os_log_type_enabled(a1, OS_LOG_TYPE_DEBUG);
    if (v21 == v16)
    {
      if (v23)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_DEBUG, "found whole disk node", buf, 2u);
      }
      *__error() = v22;
      v30 = IORegistryEntryCreateCFProperty(entry, CFSTR("BSD Name"), v11, 0);
      if (v30)
      {
        v31 = v30;
        v32 = CFGetTypeID(v30);
        if (v32 == CFStringGetTypeID())
          v33 = v31;
        else
          v33 = 0;
        if (!a4)
LABEL_57:
          sub_10003FF14();
      }
      else
      {
        v33 = 0;
        if (!a4)
          goto LABEL_57;
      }
      v38 = *__error();
      if (os_log_type_enabled(a1, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v33;
        _os_log_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_DEBUG, "devnode = %@", buf, 0xCu);
      }
      v44 = v33;
      v28 = 0;
      v29 = 0;
      *__error() = v38;
      v24 = entry;
    }
    else
    {
      if (v23)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_DEBUG, "not whole disk node", buf, 2u);
      }
      *__error() = v22;
      v24 = entry;
      ParentEntry = IORegistryEntryGetParentEntry(entry, "IOService", &entry);
      if (ParentEntry)
      {
        v26 = ParentEntry;
        if (ParentEntry == -536870208)
        {
          v27 = *__error();
          if (os_log_type_enabled(a1, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_DEBUG, "found root node, stopping", buf, 2u);
          }
          v28 = 0;
          *__error() = v27;
          v29 = 2;
        }
        else
        {
          v34 = v16;
          v35 = v17;
          v36 = a4;
          v37 = *__error();
          if (os_log_type_enabled(a1, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v26;
            _os_log_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "IORegistryEntryGetParentEntry: %{mach.errno}x", buf, 8u);
          }
          v28 = 0;
          *__error() = v37;
          v29 = 83;
          a4 = v36;
          v17 = v35;
          v16 = v34;
          v11 = kCFAllocatorDefault;
        }
      }
      else
      {
        v29 = 35;
        v28 = 1;
      }
    }
    if (v19)
      CFRelease(v19);
    if (v24 && IOObjectRelease(v24))
      sub_10003FE6C(&v47, buf);
  }
  while ((v28 & 1) != 0);
  if (v21 == v16)
  {
    if (v42)
      *v42 = v40;
    *a4 = v44;
    *v43 = v41;
  }
  if (objecta && IOObjectRelease(objecta))
    sub_10003FE6C(&v47, buf);
  return v29;
}

uint64_t sub_100024F10(int *a1, int a2, uint64_t a3)
{
  int v6;
  os_log_t v7;
  os_log_t v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  int v12;
  const char *v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  NSObject *v20;
  int v21;
  NSObject *v22;
  int v23;
  NSObject *v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  uint64_t v30;
  int v31;
  NSObject *v32;
  const char *v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  int v37;
  NSObject *v38;
  NSObject *v39;
  int v40;
  NSObject *v41;
  int v42;
  passwd *v43;
  int v44;
  int v45;
  int v46;
  NSObject *v47;
  ssize_t v48;
  int v49;
  NSObject *v50;
  int v51;
  NSObject *v52;
  int v53;
  NSObject *v54;
  int v55;
  int v56;
  NSObject *v57;
  unint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  int v61;
  NSObject *v62;
  int v63;
  NSObject *v64;
  int v65;
  NSObject *v66;
  int v67;
  int v69;
  uint64_t v70;
  NSObject *v71;
  int *v72;
  char *v73;
  unint64_t v74;
  const char *v75;
  int v76;
  int v77;
  void *v78;
  int v79;
  int v80;
  NSObject *v81;
  int v82;
  unsigned int v83;
  int v84;
  int v85;
  int v86;
  uint64_t v87;
  uid_t v88;
  gid_t v89;
  uint64_t v90;
  __int128 v91;
  uint64_t v92;
  uint64_t v93;
  size_t v94;
  int v95;
  _OWORD v96[3];
  uint64_t v97;
  stat __buf;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  int v122[2];
  int v123;
  _BYTE buf[24];
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  _DWORD v141[186];
  vfsconf v142;
  void *v143;
  __int16 v144;
  _BYTE *v145;

  v6 = *a1;
  v7 = os_log_create("com.apple.libcryptex", "hdi");
  v8 = v7;
  if (!*(_QWORD *)(a3 + 2072))
    *(_QWORD *)(a3 + 2072) = v7;
  if ((*(_DWORD *)a3 & 0x80000000) != 0)
  {
    v12 = -1;
  }
  else
  {
    v9 = sub_100025F98(a3);
    v10 = *__error();
    v11 = *(NSObject **)(a3 + 2072);
    if ((_DWORD)v9)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "hdi_mount_slow: %{darwin.errno}d", buf, 8u);
      }
      *__error() = v10;
      goto LABEL_118;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = a3 + 1048;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "attached as: %s", buf, 0xCu);
    }
    *__error() = v10;
    v12 = *(_DWORD *)(a3 + 4);
  }
  v13 = *(const char **)(a3 + 16);
  if (!v13)
  {
    v14 = *__error();
    v20 = *(NSObject **)(a3 + 2072);
    v9 = 22;
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      goto LABEL_112;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = 22;
    v17 = "FS type not specified: %{darwin.errno}d";
LABEL_110:
    v18 = v20;
    v19 = 8;
LABEL_111:
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
LABEL_112:
    *__error() = v14;
    if ((v12 & 0x80000000) == 0)
    {
      if (ioctl(v12, 0x20006415uLL))
      {
        v65 = *__error();
        v66 = *(NSObject **)(a3 + 2072);
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        {
          v67 = *__error();
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v67;
          _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "failed to clean up device: %{darwin.errno}d", buf, 8u);
        }
        *__error() = v65;
      }
      *(_BYTE *)(a3 + 24) = 0;
      *(_BYTE *)(a3 + 1048) = 0;
      *(_DWORD *)(a3 + 4) = -1;
    }
    goto LABEL_118;
  }
  if (!strcmp(*(const char **)(a3 + 16), "hfs"))
  {
    v83 = v6;
    v85 = v12;
    bzero(v96, 0x400uLL);
    v90 = 511;
    v87 = a3 + 1048;
    v88 = getuid();
    v89 = getgid();
    v91 = xmmword_1000449B0;
    v92 = 0;
    v21 = *__error();
    v22 = *(NSObject **)(a3 + 2072);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = a3 + 1048;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "mounting device = %s", buf, 0xCu);
    }
    *__error() = v21;
    if (os_log_type_enabled(*(os_log_t *)(a3 + 2072), OS_LOG_TYPE_DEBUG) && !realpath_np(v83, v96))
    {
      v23 = *__error();
      v24 = *(NSObject **)(a3 + 2072);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = v96;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "mount point = %s", buf, 0xCu);
      }
      *__error() = v23;
    }
    if (gettimeofday(0, &v91) == -1)
      sub_10003FFA4(&__buf, buf);
    v120 = 0u;
    v121 = 0u;
    v118 = 0u;
    v119 = 0u;
    v116 = 0u;
    v117 = 0u;
    v114 = 0u;
    v115 = 0u;
    v112 = 0u;
    v113 = 0u;
    v110 = 0u;
    v111 = 0u;
    v108 = 0u;
    v109 = 0u;
    v106 = 0u;
    v107 = 0u;
    v104 = 0u;
    v105 = 0u;
    v102 = 0u;
    v103 = 0u;
    v100 = 0u;
    v101 = 0u;
    v99 = 0u;
    memset(&__buf, 0, sizeof(__buf));
    v25 = open((const char *)(a3 + 1048), 4);
    v26 = v25;
    v12 = v85;
    if (v25 < 0)
    {
      v9 = *__error();
      goto LABEL_102;
    }
    if (pread(v25, &__buf, 0x200uLL, 1024) < 162)
    {
      v9 = 96;
LABEL_103:
      if (close(v26) == -1)
        sub_10004009C(&v142, buf);
LABEL_104:
      v63 = *__error();
      v64 = *(NSObject **)(a3 + 2072);
      if ((_DWORD)v9)
      {
        if (os_log_type_enabled(*(os_log_t *)(a3 + 2072), OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v9;
          _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "could not get encoding: %{darwin.errno}d", buf, 8u);
        }
        *__error() = v63;
      }
      else
      {
        v69 = a2 | 0x100001;
        if (os_log_type_enabled(*(os_log_t *)(a3 + 2072), OS_LOG_TYPE_DEBUG))
        {
          v70 = *(_QWORD *)(a3 + 16);
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = v70;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v83;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v69;
          _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEBUG, "mount args: fs = %s, fd = %d, flags = %#x", buf, 0x18u);
        }
        *__error() = v63;
        v71 = *(NSObject **)(a3 + 2072);
        bzero(buf, 0x400uLL);
        memset(&__buf, 0, sizeof(__buf));
        v6 = v83;
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
        {
          if (fstat(v83, &__buf) == -1)
          {
            v76 = *__error();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
            {
              v77 = *__error();
              v142.vfc_reserved1 = 136315650;
              *(_QWORD *)v142.vfc_name = "mntfd";
              *(_WORD *)&v142.vfc_name[8] = 1024;
              *(_DWORD *)&v142.vfc_name[10] = v83;
              *(_WORD *)&v142.vfc_name[14] = 1024;
              v142.vfc_typenum = v77;
              _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_ERROR, "%s fd[%d] : [invalid descriptor]: %{darwin.errno}d", (uint8_t *)&v142, 0x18u);
            }
            *__error() = v76;
          }
          else
          {
            if (fcntl(v83, 50, buf))
            {
              v72 = __error();
              v73 = strerror(*v72);
              snprintf(buf, 0x400uLL, "[%s]", v73);
            }
            v74 = ((unint64_t)__buf.st_mode >> 12) ^ 8;
            if ((_DWORD)v74 == 15)
              v75 = "[unknown]";
            else
              v75 = off_100056E30[v74];
            v78 = (void *)os_flagset_copy_string(&unk_100056A30, __buf.st_flags);
            v79 = *__error();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
            {
              v142.vfc_reserved1 = 136316418;
              *(_QWORD *)v142.vfc_name = "mntfd";
              *(_WORD *)&v142.vfc_name[8] = 1024;
              *(_DWORD *)&v142.vfc_name[10] = v83;
              *(_WORD *)&v142.vfc_name[14] = 2080;
              *(_QWORD *)&v142.vfc_typenum = v75;
              LOWORD(v142.vfc_flags) = 2048;
              *(_QWORD *)((char *)&v142.vfc_flags + 2) = __buf.st_size;
              HIWORD(v142.vfc_reserved3) = 2080;
              v143 = v78;
              v144 = 2080;
              v145 = buf;
              _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEBUG, "%s fd[%d]: type = %s, size = %lld, flags = %s, path = %s", (uint8_t *)&v142, 0x3Au);
            }
            *__error() = v79;
            free(v78);
            v6 = v83;
          }
        }
        if (!fmount("hfs", v6, v69, &v87))
          goto LABEL_142;
        v9 = *__error();
        v80 = *__error();
        v81 = *(NSObject **)(a3 + 2072);
        if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v9;
          _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "fmount: %{darwin.errno}d", buf, 8u);
        }
        *__error() = v80;
        v12 = v85;
        if (!(_DWORD)v9)
          goto LABEL_142;
      }
      v14 = *__error();
      v20 = *(NSObject **)(a3 + 2072);
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        goto LABEL_112;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v9;
      v17 = "mount hfs failed: %{darwin.errno}d";
      goto LABEL_110;
    }
    v34 = bswap32(LOWORD(__buf.st_dev));
    v35 = HIWORD(v34);
    LOWORD(__buf.st_dev) = HIWORD(v34);
    LOWORD(__buf.st_lspare) = bswap32(LOWORD(__buf.st_lspare)) >> 16;
    v36 = bswap32(HIDWORD(__buf.st_blocks));
    HIDWORD(__buf.st_blocks) = v36;
    if (v35 != 18475 && v35 != 18520)
    {
      v40 = *__error();
      v41 = *(NSObject **)(a3 + 2072);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)&buf[4] = LOWORD(__buf.st_dev);
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = LOWORD(__buf.st_lspare);
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "filesystem unsupported or corrupt: drSigWord = %#hx, drEmbedSigWord = %#hx", buf, 0xEu);
      }
      *__error() = v40;
      v9 = 92;
      goto LABEL_103;
    }
    if (v36 >> 8 == 6647395)
    {
      v37 = v36;
      goto LABEL_93;
    }
    v123 = 1;
    *(_QWORD *)v122 = 3;
    memset(&v142, 0, sizeof(v142));
    v95 = -1;
    v94 = 4;
    if (getvfsbyname("hfs", &v142) == -1)
      sub_10003FFA4(&v93, buf);
    v122[1] = v142.vfc_typenum;
    if ((sysctl(v122, 3u, &v95, &v94, 0, 0) & 0x80000000) == 0)
      *__error() = 0;
    v42 = *__error();
    if (v42 && v42 != 45 && *__error())
      sub_100040194(&v93, buf);
    v37 = v95;
    if ((v95 + 1) > 1)
    {
LABEL_93:
      if (v37 == 4)
      {
LABEL_94:
        v9 = 0;
        HIDWORD(v90) = v37;
      }
      else
      {
        v58 = -1;
        v59 = &qword_1000449E8;
        while (v58 != 36)
        {
          v60 = *v59;
          v59 += 3;
          ++v58;
          if (v60 == v37)
          {
            if (v58 < 0x25)
              goto LABEL_94;
            break;
          }
        }
        v61 = *__error();
        v62 = *(NSObject **)(a3 + 2072);
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v37;
          _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "unsupported encoding: %u", buf, 8u);
        }
        *__error() = v61;
        v9 = 79;
        v12 = v85;
      }
LABEL_102:
      if (v26 == -1)
        goto LABEL_104;
      goto LABEL_103;
    }
    bzero(buf, 0x400uLL);
    v43 = getpwuid(0);
    if (!v43)
      sub_100040118(v122, &v142);
    snprintf(buf, 0x400uLL, "%s/%s", v43->pw_dir, "/.CFUserTextEncoding");
    v44 = open(buf, 0);
    if ((v44 & 0x80000000) == 0)
      *__error() = 0;
    v37 = 0;
    v45 = *__error();
    v82 = v44;
    if (v45 > 3)
    {
      if (v45 != 4 && v45 != 13)
        goto LABEL_76;
    }
    else
    {
      if (!v45)
      {
LABEL_77:
        v48 = read(v44, buf, 0x400uLL);
        if (v48)
        {
          if (v48 < 0)
          {
            v53 = *__error();
            v54 = *(NSObject **)(a3 + 2072);
            if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
            {
              v55 = *__error();
              v142.vfc_reserved1 = 67109120;
              *(_DWORD *)v142.vfc_name = v55;
              _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "error reading encoding file: %{darwin.errno}d", (uint8_t *)&v142, 8u);
            }
            v37 = 0;
            *__error() = v53;
          }
          else
          {
            buf[v48] = 0;
            v49 = *__error();
            v50 = *(NSObject **)(a3 + 2072);
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
            {
              v142.vfc_reserved1 = 136315138;
              *(_QWORD *)v142.vfc_name = buf;
              _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEBUG, "read encoding: %s", (uint8_t *)&v142, 0xCu);
            }
            *__error() = v49;
            v37 = strtol(buf, 0, 0);
          }
        }
        else
        {
          v51 = *__error();
          v52 = *(NSObject **)(a3 + 2072);
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
          {
            LOWORD(v142.vfc_reserved1) = 0;
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEBUG, "encoding file empty", (uint8_t *)&v142, 2u);
          }
          v37 = 0;
          *__error() = v51;
        }
        goto LABEL_88;
      }
      if (v45 != 2)
      {
LABEL_76:
        if (*__error())
          sub_100040194(v122, &v142);
        goto LABEL_77;
      }
    }
LABEL_88:
    v56 = *__error();
    v57 = *(NSObject **)(a3 + 2072);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
    {
      v142.vfc_reserved1 = 67109120;
      *(_DWORD *)v142.vfc_name = v37;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEBUG, "returning encoding: %u", (uint8_t *)&v142, 8u);
    }
    *__error() = v56;
    if (v82 != -1 && close(v82) == -1)
      sub_10004009C(v122, &v142);
    v12 = v85;
    goto LABEL_93;
  }
  if (strcmp(v13, "apfs"))
  {
    v14 = *__error();
    v15 = *(NSObject **)(a3 + 2072);
    v9 = 22;
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_112;
    v16 = *(_QWORD *)(a3 + 16);
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = v16;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 22;
    v17 = "Invalid FS type: %s: %{darwin.errno}d";
    v18 = v15;
    v19 = 18;
    goto LABEL_111;
  }
  v140 = 0u;
  memset(v141, 0, 48);
  v139 = 0u;
  v138 = 0u;
  v137 = 0u;
  v136 = 0u;
  v135 = 0u;
  v134 = 0u;
  v133 = 0u;
  v132 = 0u;
  v131 = 0u;
  v130 = 0u;
  v129 = 0u;
  v128 = 0u;
  v127 = 0u;
  v126 = 0u;
  v125 = 0u;
  *(_OWORD *)&buf[8] = 0u;
  v27 = *(_DWORD *)(a3 + 2092);
  v28 = *(_DWORD *)(a3 + 2084);
  v84 = *(_DWORD *)(a3 + 2096);
  v86 = *(_DWORD *)(a3 + 2088);
  v97 = 0;
  memset(v96, 0, sizeof(v96));
  memset(&__buf, 0, 56);
  v29 = a2 | 0x100001;
  *(_QWORD *)buf = a3 + 1048;
  v141[11] = getuid();
  v141[12] = getgid();
  *(_WORD *)&buf[16] = 1;
  *(_DWORD *)&buf[8] = v29;
  if (*(_BYTE *)(a3 + 2080))
  {
    v30 = sub_10003BC08(v27, v96);
    if ((_DWORD)v30)
    {
      v9 = v30;
      v31 = *__error();
      v32 = *(NSObject **)(a3 + 2072);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v142.vfc_reserved1 = 67109120;
        *(_DWORD *)v142.vfc_name = v9;
        v33 = "Failed to read im4m.: %{darwin.errno}d";
LABEL_67:
        v39 = v32;
        goto LABEL_68;
      }
      goto LABEL_69;
    }
    v9 = sub_10003BC08(v28, &__buf);
    v31 = *__error();
    v38 = *(NSObject **)(a3 + 2072);
    if ((_DWORD)v9)
    {
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v142.vfc_reserved1 = 67109120;
        *(_DWORD *)v142.vfc_name = v9;
        v33 = "Failed to read root volume hash.: %{darwin.errno}d";
        v39 = v38;
LABEL_68:
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, v33, (uint8_t *)&v142, 8u);
        goto LABEL_69;
      }
      goto LABEL_69;
    }
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      v142.vfc_reserved1 = 134217984;
      *(_QWORD *)v142.vfc_name = *((_QWORD *)&v96[0] + 1);
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "im4m len: %lu", (uint8_t *)&v142, 0xCu);
    }
    *__error() = v31;
    v46 = *__error();
    v47 = *(NSObject **)(a3 + 2072);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      v142.vfc_reserved1 = 134217984;
      *(_QWORD *)v142.vfc_name = __buf.st_ino;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEBUG, "im4p len: %lu", (uint8_t *)&v142, 0xCu);
    }
    *__error() = v46;
    *(_WORD *)&buf[16] = 8;
    v141[9] = v86;
    v141[10] = v84;
    *(_OWORD *)&v141[5] = v96[0];
    *(_QWORD *)&v141[1] = *(_QWORD *)&__buf.st_dev;
    *(_QWORD *)&v141[3] = __buf.st_ino;
  }
  if (fmount("apfs", v6, v29, buf))
  {
    v9 = *__error();
    v31 = *__error();
    v32 = *(NSObject **)(a3 + 2072);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v142.vfc_reserved1 = 67109120;
      *(_DWORD *)v142.vfc_name = v9;
      v33 = "fmount: %{darwin.errno}d";
      goto LABEL_67;
    }
LABEL_69:
    *__error() = v31;
    goto LABEL_70;
  }
  v9 = 0;
LABEL_70:
  sub_10003C630(v96);
  sub_10003C630(&__buf);
  if ((_DWORD)v9)
  {
    v14 = *__error();
    v20 = *(NSObject **)(a3 + 2072);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      goto LABEL_112;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v9;
    v17 = "mount apfs failed: %{darwin.errno}d";
    goto LABEL_110;
  }
LABEL_142:
  if (close(v6) == -1)
    sub_100040020(v96, buf);
  v9 = 0;
  *a1 = -1;
LABEL_118:
  if (*(os_log_t *)(a3 + 2072) == v8)
    *(_QWORD *)(a3 + 2072) = 0;
  if (v8)
    os_release(v8);
  return v9;
}

uint64_t sub_100025F98(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  NSObject *v5;
  CFTypeRef v6;
  uint64_t v7;
  int v8;
  NSObject *v9;
  int v10;
  int v12;
  NSObject *v13;
  int v14;
  CFTypeRef cf;
  uint8_t buf[4];
  int v17;
  char v18[1024];

  cf = 0;
  bzero(v18, 0x400uLL);
  v2 = sub_10002400C((unsigned int *)a1, &cf);
  if ((_DWORD)v2)
  {
    v3 = v2;
    v4 = *__error();
    v5 = *(NSObject **)(a1 + 2072);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v17 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "attach failed: %{darwin.errno}d", buf, 8u);
    }
    *__error() = v4;
    v6 = cf;
    if (!cf)
      return v3;
LABEL_13:
    CFRelease(v6);
    return v3;
  }
  v6 = cf;
  v7 = sub_1000245DC(a1, cf, (const char **)(a1 + 16), v18, (char *)(a1 + 1048));
  if ((_DWORD)v7)
  {
    v3 = v7;
    v8 = *__error();
    v9 = *(NSObject **)(a1 + 2072);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v17 = v3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "could not find attached media: %{darwin.errno}d", buf, 8u);
    }
    *__error() = v8;
    if (v6)
      goto LABEL_13;
  }
  else
  {
    v10 = open(v18, 0);
    *(_DWORD *)(a1 + 4) = v10;
    if ((v10 & 0x80000000) == 0)
    {
      __strlcpy_chk(a1 + 24, v18, 1024, 1024);
      v3 = 0;
      if (!v6)
        return v3;
      goto LABEL_13;
    }
    v12 = *__error();
    v13 = *(NSObject **)(a1 + 2072);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = *__error();
      *(_DWORD *)buf = 67109120;
      v17 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "open: %{darwin.errno}d", buf, 8u);
    }
    *__error() = v12;
    v3 = *__error();
    if (v6)
      goto LABEL_13;
  }
  return v3;
}

uint64_t sub_1000261B0(_QWORD *a1, _QWORD *a2, NSObject *a3)
{
  unsigned int v6;
  unsigned int v7;
  size_t v8;
  statfs *v9;
  statfs *v10;
  uint64_t v11;
  int v12;
  int *v13;
  char *v14;
  char *v15;
  IONotificationPortRef v16;
  IONotificationPort *v17;
  const __CFDictionary *v18;
  kern_return_t v19;
  kern_return_t v20;
  int v21;
  io_registry_entry_t v22;
  io_object_t v23;
  const __CFString *v24;
  int v25;
  int v26;
  CFTypeRef v27;
  size_t v28;
  const char *f_mntfromname;
  char *v31;
  int v32;
  NSObject *v33;
  unsigned int v34;
  _QWORD *v35;
  uint64_t v36;
  CFTypeRef cf;
  CFTypeRef v38;
  io_iterator_t notification;
  _OWORD v40[16];
  char v41[256];
  _QWORD v42[32];
  uint8_t buf[4];
  CFTypeRef v44;
  __int16 v45;
  CFTypeRef v46;

  notification = 0;
  v6 = getfsstat(0, 0, 2);
  if ((v6 & 0x80000000) != 0)
  {
    v11 = *__error();
    v12 = *__error();
    if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v44) = v11;
      _os_log_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "getfsstat: %{darwin.errno}d", buf, 8u);
    }
    v13 = __error();
    v9 = 0;
    goto LABEL_18;
  }
  v7 = v6;
  v8 = v6;
  if (_dispatch_is_multithreaded())
  {
    v9 = (statfs *)malloc_type_calloc(v8, 0x878uLL, 0x1B044E25uLL);
    if (!v9)
    {
      do
      {
        __os_temporary_resource_shortage();
        v10 = (statfs *)malloc_type_calloc(v8, 0x878uLL, 0x1B044E25uLL);
      }
      while (!v10);
      v9 = v10;
    }
  }
  else
  {
    v9 = (statfs *)malloc_type_calloc(v8, 0x878uLL, 0x61D5536CuLL);
    if (!v9)
      sub_1000402B8(v42, buf);
  }
  if (getfsstat(v9, 2168 * v7, 2) < 0)
  {
    v11 = *__error();
    v12 = *__error();
    if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v44) = v11;
      _os_log_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "getfsstat: %{darwin.errno}d", buf, 8u);
    }
    v13 = __error();
LABEL_18:
    *v13 = v12;
    goto LABEL_61;
  }
  if (_dispatch_is_multithreaded())
  {
    v14 = (char *)malloc_type_calloc(v8, 0xDFEuLL, 0x1B044E25uLL);
    if (!v14)
    {
      do
      {
        __os_temporary_resource_shortage();
        v15 = (char *)malloc_type_calloc(v8, 0xDFEuLL, 0x1B044E25uLL);
      }
      while (!v15);
      v14 = v15;
    }
  }
  else
  {
    v14 = (char *)malloc_type_calloc(v8, 0xDFEuLL, 0x61D5536CuLL);
    if (!v14)
      sub_100040214(v42, buf);
  }
  v16 = IONotificationPortCreate(0);
  if (!v16)
    sub_10003FE54();
  v17 = v16;
  v18 = IOServiceMatching("IOMedia");
  v19 = IOServiceAddMatchingNotification(v17, "IOServiceMatched", v18, 0, 0, &notification);
  if (!v19)
  {
    v35 = a1;
    v34 = v7;
    v36 = 0;
    while (1)
    {
      v22 = IOIteratorNext(notification);
      if (!v22)
      {
        v11 = 0;
        *v35 = v14;
        *a2 = v36;
        goto LABEL_60;
      }
      v23 = v22;
      cf = 0;
      v38 = 0;
      memset(v42, 0, 255);
      memset(v41, 0, 255);
      memset(v40, 0, 255);
      v24 = (const __CFString *)IORegistryEntrySearchCFProperty(v22, "IOService", CFSTR("hdik-unique-identifier"), 0, 3u);
      if (!v24
        || IOObjectConformsTo(v23, "AppleAPFSVolume")
        || IOObjectConformsTo(v23, "AppleAPFSMedia")
        || IOObjectConformsTo(v23, "AppleAPFSContainerScheme")
        || IOObjectConformsTo(v23, "AppleAPFSContainer"))
      {
        goto LABEL_38;
      }
      v25 = *__error();
      if (os_log_type_enabled(a3, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v44 = v24;
        _os_log_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "found property: %@", buf, 0xCu);
      }
      *__error() = v25;
      v26 = sub_100024A10(a3, v23, 0, &v38, &cf);
      v32 = *__error();
      if (v26)
        break;
      if (os_log_type_enabled(a3, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v44 = v38;
        v45 = 2112;
        v46 = cf;
        _os_log_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "found dev nodes: dev = %@, sub = %@", buf, 0x16u);
      }
      *__error() = v32;
      if (!sub_10000A444(v24, (char *)v42, 255))
        sub_10003FEE4();
      if (!sub_10000A444((const __CFString *)v38, v41, 255))
        sub_10003FEE4();
      v27 = cf;
      if (!sub_10000A444((const __CFString *)cf, (char *)v40, 255))
        sub_10003FEE4();
      if (v34)
      {
        v33 = a3;
        v28 = v8;
        f_mntfromname = v9->f_mntfromname;
        while (1)
        {
          bzero(buf, 0x400uLL);
          snprintf((char *)buf, 0x400uLL, "%s%s", "/dev/", (const char *)v40);
          if (!strcmp(f_mntfromname, (const char *)buf))
            break;
          f_mntfromname += 2168;
          if (!--v28)
          {
            a3 = v33;
            goto LABEL_38;
          }
        }
        a3 = v33;
        v31 = &v14[3582 * v36];
        __strlcpy_chk(v31, v42, 510, 510);
        snprintf(v31 + 510, 0x400uLL, "%s%s", "/dev/", v41);
        snprintf(v31 + 1534, 0x400uLL, "%s%s", "/dev/", (const char *)v40);
        strlcpy(v31 + 2558, f_mntfromname - 1024, 0x400uLL);
        ++v36;
        goto LABEL_38;
      }
LABEL_39:
      if (v27)
        CFRelease(v27);
      if (v38)
        CFRelease(v38);
      if (v24)
        CFRelease(v24);
      if (IOObjectRelease(v23))
        sub_10003FE6C(v42, buf);
    }
    if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v44) = v26;
      _os_log_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "failed to get device nodes: %{darwin.errno}d", buf, 8u);
    }
    *__error() = v32;
LABEL_38:
    v27 = cf;
    goto LABEL_39;
  }
  v20 = v19;
  *__error() = 83;
  v21 = *__error();
  if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v44) = v20;
    _os_log_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "IOServiceAddMatchingNotification: %{mach.errno}x", buf, 8u);
  }
  *__error() = v21;
  v11 = 0xFFFFFFFFLL;
LABEL_60:
  IONotificationPortDestroy(v17);
LABEL_61:
  if (notification && IOObjectRelease(notification))
    sub_10003FE6C(v42, buf);
  free(v9);
  return v11;
}

void sub_100026924(uint64_t a1)
{
  os_release(*(void **)(a1 + 64));
  free(*(void **)(a1 + 72));
  close_drop_optional_np(a1 + 80, 0);
  sub_10003AA48(a1 + 16);
}

uint64_t sub_100026960(uint64_t a1, void *a2, const char *a3, uint64_t a4)
{
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v14;
  _OWORD v15[5];

  v8 = sub_100011500(232);
  *(_QWORD *)(v8 + 40) = a4;
  *(_QWORD *)(v8 + 64) = os_retain(a2);
  *(_QWORD *)(v8 + 48) = a1;
  if (_dispatch_is_multithreaded())
  {
    v9 = strdup(a3);
    if (!v9)
    {
      do
      {
        __os_temporary_resource_shortage();
        v10 = strdup(a3);
      }
      while (!v10);
      v9 = v10;
    }
  }
  else
  {
    v9 = strdup(a3);
    if (!v9)
      sub_10003EA78(a3, &v14, v15);
  }
  *(_QWORD *)(v8 + 72) = v9;
  *(_DWORD *)(v8 + 80) = -1;
  v11 = strrchr(v9, 47);
  if (v11)
    v12 = v11 + 1;
  else
    v12 = v9;
  *(_QWORD *)(v8 + 56) = v12;
  sub_10003A760(v8 + 16, (int)"com.apple.security.cryptexd", "resource");
  sub_10003A790(v8 + 16, *(const char **)(v8 + 56));
  return v8;
}

uint64_t sub_100026A8C(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  int v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  const char *v19;
  int v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  int v31;
  NSObject *v32;
  const char *v33;
  int v34;
  uint64_t v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  int v43;

  v3 = *(_QWORD *)(a1 + 64);
  v4 = *(_QWORD *)(v3 + 48);
  v5 = **(_QWORD **)(a1 + 48);
  v6 = (uint64_t (*)(uint64_t, uint64_t))qword_100056FB0[v5];
  v7 = openat(*(_DWORD *)(v3 + 56), *(const char **)(a1 + 72), a2 & 0xFFFFFFFC);
  v34 = v7;
  if ((v7 & 0x80000000) == 0)
    *__error() = 0;
  if (*__error())
  {
    v8 = *__error();
    v9 = *(const char **)(a1 + 16);
    v10 = *__error();
    v11 = *(NSObject **)(a1 + 32);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_9:
      *__error() = v10;
      goto LABEL_10;
    }
    v12 = "[anonymous]";
    if (v9)
      v12 = v9;
    v13 = *(_QWORD *)(v4 + 8);
    v14 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)buf = 136446978;
    v37 = v12;
    v38 = 2080;
    v39 = v13;
    v40 = 2080;
    v41 = v14;
    v42 = 1024;
    v43 = v8;
    v15 = "%{public}s: failed to open %s resource: %s: %{darwin.errno}d";
    v16 = v11;
    v17 = 38;
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
    goto LABEL_9;
  }
  v19 = *(const char **)(a1 + 16);
  v20 = *__error();
  v21 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    v22 = "[anonymous]";
    if (v19)
      v22 = v19;
    v23 = *(_QWORD *)(v4 + 8);
    v24 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)buf = 136446722;
    v37 = v22;
    v38 = 2080;
    v39 = v23;
    v40 = 2080;
    v41 = v24;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "%{public}s: opened %s resource: %s", buf, 0x20u);
  }
  *__error() = v20;
  if ((unint64_t)(v5 - 7) >= 0xFFFFFFFFFFFFFFFELL)
  {
    v25 = v6(a1, v7);
    if ((_DWORD)v25)
    {
      v8 = v25;
      v26 = *(const char **)(a1 + 16);
      v10 = *__error();
      v27 = *(NSObject **)(a1 + 32);
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        goto LABEL_9;
      v28 = "[anonymous]";
      v29 = *(_QWORD *)(a1 + 56);
      if (v26)
        v28 = v26;
      *(_DWORD *)buf = 136446722;
      v37 = v28;
      v38 = 2080;
      v39 = v29;
      v40 = 1024;
      LODWORD(v41) = v8;
      v15 = "%{public}s: failed to validate resource: %s: %{darwin.errno}d";
      v16 = v27;
      v17 = 28;
      goto LABEL_8;
    }
  }
  if (fstat(v7, (stat *)(a1 + 88)))
  {
    v8 = *__error();
    v30 = *(const char **)(a1 + 16);
    v31 = *__error();
    v32 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v33 = "[anonymous]";
      if (v30)
        v33 = v30;
      *(_DWORD *)buf = 136446466;
      v37 = v33;
      v38 = 1024;
      LODWORD(v39) = v8;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%{public}s: fstat: %{darwin.errno}d", buf, 0x12u);
    }
    *__error() = v31;
  }
  else
  {
    v8 = 0;
    *(_DWORD *)(a1 + 80) = sub_10003AA70(&v34);
    LODWORD(v7) = v34;
  }
LABEL_10:
  if ((_DWORD)v7 != -1 && close(v7) == -1)
    sub_10003E8A8(&v35, buf);
  return v8;
}

uint64_t sub_100026DD8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  int v6;
  NSObject *v7;
  const char *v8;
  const char *v9;
  CFBundleRef v10;
  CFBundleRef v11;
  const char *v13;
  const char *v14;
  CFURLRef bundleURL;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;

  bundleURL = 0;
  v3 = sub_10000A47C(a2, &bundleURL);
  if ((_DWORD)v3)
  {
    v4 = v3;
    v5 = *(const char **)(a1 + 16);
    v6 = *__error();
    v7 = *(NSObject **)(a1 + 32);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_7:
      v10 = 0;
      *__error() = v6;
      goto LABEL_10;
    }
    v8 = "[anonymous]";
    if (v5)
      v8 = v5;
    *(_DWORD *)buf = 136446466;
    v17 = v8;
    v18 = 1024;
    v19 = v4;
    v9 = "%{public}s: _CFURLCreateFromFileDescriptor: %{darwin.errno}d";
LABEL_6:
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, v9, buf, 0x12u);
    goto LABEL_7;
  }
  v11 = CFBundleCreate(kCFAllocatorDefault, bundleURL);
  if (!v11)
  {
    v13 = *(const char **)(a1 + 16);
    v6 = *__error();
    v7 = *(NSObject **)(a1 + 32);
    v4 = 22;
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v14 = "[anonymous]";
    if (v13)
      v14 = v13;
    *(_DWORD *)buf = 136446466;
    v17 = v14;
    v18 = 1024;
    v19 = 22;
    v9 = "%{public}s: failed to create bundle from resource: %{darwin.errno}d";
    goto LABEL_6;
  }
  v10 = v11;
  v4 = 0;
LABEL_10:
  if (bundleURL)
    CFRelease(bundleURL);
  if (v10)
    CFRelease(v10);
  return v4;
}

void sub_100026F6C(void *a1)
{
  id v1;
  xpc_connection_t remote_connection;
  _xpc_connection_s *v3;
  const char *string;
  const char *v5;
  pid_t pid;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  pid_t v12;
  id v13;
  xpc_connection_t v14;
  void *v15;
  unsigned int v16;
  pid_t v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  pid_t v23;
  id v24;
  pid_t v25;
  id v26;
  xpc_connection_t v27;
  void *v28;
  unsigned int v29;
  pid_t v30;
  id v31;
  void *v32;
  id v33;
  NSObject *v34;
  uint64_t v35;
  pid_t v36;
  uint64_t v37;
  pid_t v38;
  int v39;
  id v40;
  NSObject *v41;
  pid_t v42;
  char *v43;
  __CFError *v44;
  int v45;
  int v46;
  pid_t v47;
  id v48;
  void *v49;
  id v50;
  NSObject *v51;
  uint64_t v52;
  pid_t v53;
  id v54;
  pid_t v55;
  uint64_t v56;
  id v57;
  pid_t v58;
  pid_t v59;
  id v60;
  void *v61;
  id v62;
  NSObject *v63;
  uint64_t v64;
  pid_t v65;
  uint64_t v66;
  pid_t v67;
  id v68;
  void *v69;
  id v70;
  NSObject *v71;
  uint64_t v72;
  pid_t v73;
  pid_t v74;
  id v75;
  void *v76;
  id v77;
  NSObject *v78;
  uint64_t v79;
  pid_t v80;
  char *v81;
  CFErrorRef v82;
  __CFError *v83;
  char *v84;
  uint64_t v85;
  xpc_connection_t v86;
  _xpc_connection_s *v87;
  int v88;
  pid_t v89;
  int v90;
  id v91;
  NSObject *v92;
  pid_t v93;
  pid_t v94;
  id v95;
  void *v96;
  id v97;
  NSObject *v98;
  uint64_t v99;
  pid_t v100;
  char *v101;
  __CFError *v102;
  char *v103;
  id v104;
  pid_t v105;
  pid_t v106;
  id v107;
  void *v108;
  id v109;
  NSObject *v110;
  uint64_t v111;
  pid_t v112;
  id v113;
  pid_t v114;
  uint64_t v115;
  id v116;
  pid_t v117;
  id v118;
  pid_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  id v124;
  char *v125;
  pid_t v126;
  int v127;
  id v128;
  NSObject *v129;
  pid_t v130;
  id v131;
  pid_t v132;
  char *v133;
  CFErrorRef v134;
  char *v135;
  CFErrorRef v136;
  uint64_t v137;
  id v138;
  pid_t v139;
  char *v140;
  uint64_t v141;
  pid_t v142;
  int v143;
  id v144;
  NSObject *v145;
  pid_t v146;
  void *v147;
  char *v148;
  pid_t v149;
  id v150;
  NSObject *v151;
  pid_t v152;
  id v153;
  xpc_object_t value;
  int64_t int64;
  int64_t v156;
  id v157;
  id v158;
  uint64_t v159;
  void *v160;
  int v161;
  int v162;
  id v163;
  NSObject *v164;
  int *v165;
  id v166;
  pid_t v167;
  id v168;
  void *v169;
  id v170;
  NSObject *v171;
  uint64_t v172;
  pid_t v173;
  pid_t v174;
  id v175;
  void *v176;
  id v177;
  NSObject *v178;
  uint64_t v179;
  pid_t v180;
  int v181;
  id v182;
  NSObject *v183;
  id v184;
  pid_t v185;
  void *v186;
  _QWORD *v187;
  int v188;
  id v189;
  NSObject *v190;
  pid_t v191;
  id v192;
  void *v193;
  id v194;
  NSObject *v195;
  uint64_t v196;
  pid_t v197;
  id v198;
  pid_t v199;
  uint64_t v200;
  id v201;
  pid_t v202;
  uint64_t v203;
  uint64_t v204;
  id v205;
  NSObject *v206;
  char *v207;
  char *v208;
  char *v209;
  pid_t v210;
  id v211;
  void *v212;
  id v213;
  NSObject *v214;
  uint64_t v215;
  pid_t v216;
  id v217;
  pid_t v218;
  uint64_t v219;
  _BOOL4 v220;
  int v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  _BOOL4 v225;
  int v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  _BOOL4 v230;
  int v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  _BOOL4 v235;
  int v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  int v240;
  id v241;
  uid_t v242;
  void *v243;
  void *v244;
  int v245;
  int v246;
  int v247;
  int v248;
  _BYTE buffer[136];
  _BYTE buf[32];
  _OWORD v251[3];
  uint64_t v252;
  __int128 v253[3];
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  uint64_t v260;

  v1 = a1;
  remote_connection = xpc_dictionary_get_remote_connection(v1);
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
  string = xpc_dictionary_get_string(v1, "MOUNT_SUB_REQ");
  v5 = string;
  if (!string)
    goto LABEL_4;
  if (strcmp(string, "REQ:MOUNT"))
  {
    if (strcmp(v5, "REQ:UNMOUNT"))
    {
LABEL_4:
      *(_OWORD *)buffer = *(_OWORD *)"unknown";
      *(_OWORD *)&buffer[16] = unk_100044D68;
      pid = xpc_connection_get_pid(v3);
      proc_name(pid, buffer, 0x20u);
      v7 = sub_100029408();
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

      if (v8)
      {
        v9 = sub_100029408();
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          v11 = 3;
        else
          v11 = 2;
        if (v3)
          v12 = xpc_connection_get_pid(v3);
        else
          v12 = -1;
        LODWORD(v253[0]) = 136316162;
        *(_QWORD *)((char *)v253 + 4) = buffer;
        WORD6(v253[0]) = 1024;
        *(_DWORD *)((char *)v253 + 14) = v12;
        WORD1(v253[1]) = 2080;
        *(_QWORD *)((char *)&v253[1] + 4) = v5;
        WORD6(v253[1]) = 2080;
        *(_QWORD *)((char *)&v253[1] + 14) = "MOUNT_SUB_REQ";
        WORD3(v253[2]) = 1024;
        DWORD2(v253[2]) = 22;
        v37 = v11;
      }
      else
      {
        v24 = &_os_log_default;
        if (v3)
          v25 = xpc_connection_get_pid(v3);
        else
          v25 = -1;
        LODWORD(v253[0]) = 136316162;
        *(_QWORD *)((char *)v253 + 4) = buffer;
        WORD6(v253[0]) = 1024;
        *(_DWORD *)((char *)v253 + 14) = v25;
        WORD1(v253[1]) = 2080;
        *(_QWORD *)((char *)&v253[1] + 4) = v5;
        WORD6(v253[1]) = 2080;
        *(_QWORD *)((char *)&v253[1] + 14) = "MOUNT_SUB_REQ";
        WORD3(v253[2]) = 1024;
        DWORD2(v253[2]) = 22;
        v10 = &_os_log_default;
        v37 = 2;
      }
      v43 = (char *)_os_log_send_and_compose_impl(v37, 0, 0, 0, &_mh_execute_header, v10, 16);

      v44 = sub_10000A6F8("mount_sub_handle_request", "sub_mount.m", 414, "com.apple.security.cryptex.posix", 22, 0, v43);
      free(v43);
      sub_100029448(v1, v44, 0, 0, 0);
      goto LABEL_267;
    }
    v26 = v1;
    v27 = xpc_dictionary_get_remote_connection(v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    LOBYTE(v247) = 0;
    v248 = -1;
    v29 = sub_10002967C(v28, (uint64_t)"com.apple.private.security.cryptex.unmount");
    if (v29)
    {
      v253[0] = *(_OWORD *)"unknown";
      v253[1] = unk_100044D68;
      v30 = xpc_connection_get_pid((xpc_connection_t)v28);
      proc_name(v30, v253, 0x20u);
      v31 = sub_100029408();
      v32 = (void *)objc_claimAutoreleasedReturnValue(v31);

      if (v32)
      {
        v33 = sub_100029408();
        v34 = objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          v35 = 3;
        else
          v35 = 2;
        if (v28)
          v36 = xpc_connection_get_pid((xpc_connection_t)v28);
        else
          v36 = -1;
        *(_DWORD *)buffer = 136315650;
        *(_QWORD *)&buffer[4] = v253;
        *(_WORD *)&buffer[12] = 1024;
        *(_DWORD *)&buffer[14] = v36;
        *(_WORD *)&buffer[18] = 1024;
        *(_DWORD *)&buffer[20] = v29;
        v66 = v35;
      }
      else
      {
        v57 = &_os_log_default;
        if (v28)
          v58 = xpc_connection_get_pid((xpc_connection_t)v28);
        else
          v58 = -1;
        *(_DWORD *)buffer = 136315650;
        *(_QWORD *)&buffer[4] = v253;
        *(_WORD *)&buffer[12] = 1024;
        *(_DWORD *)&buffer[14] = v58;
        *(_WORD *)&buffer[18] = 1024;
        *(_DWORD *)&buffer[20] = v29;
        v34 = &_os_log_default;
        v66 = 2;
      }
      v101 = (char *)_os_log_send_and_compose_impl(v66, 0, 0, 0, &_mh_execute_header, v34, 16);

      v102 = sub_10000A6F8("mount_sub_unmount_cryptex", "sub_mount.m", 359, "com.apple.security.cryptex.posix", v29, 0, v101);
      v103 = v101;
      goto LABEL_90;
    }
    v45 = xpc_dictionary_dup_fd(v26, "UNMOUNT:INFO_FD");
    v248 = v45;
    if (v45 == -1)
    {
      *(_OWORD *)buffer = *(_OWORD *)"unknown";
      *(_OWORD *)&buffer[16] = unk_100044D68;
      v67 = xpc_connection_get_pid((xpc_connection_t)v28);
      proc_name(v67, buffer, 0x20u);
      v68 = sub_100029408();
      v69 = (void *)objc_claimAutoreleasedReturnValue(v68);

      if (v69)
      {
        v70 = sub_100029408();
        v71 = objc_claimAutoreleasedReturnValue(v70);
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
          v72 = 3;
        else
          v72 = 2;
        if (v28)
          v73 = xpc_connection_get_pid((xpc_connection_t)v28);
        else
          v73 = -1;
        LODWORD(v253[0]) = 136315906;
        *(_QWORD *)((char *)v253 + 4) = buffer;
        WORD6(v253[0]) = 1024;
        *(_DWORD *)((char *)v253 + 14) = v73;
        WORD1(v253[1]) = 2080;
        *(_QWORD *)((char *)&v253[1] + 4) = "MOUNT:INFO_FD";
        WORD6(v253[1]) = 1024;
        *(_DWORD *)((char *)&v253[1] + 14) = 22;
        v121 = v72;
      }
      else
      {
        v116 = &_os_log_default;
        if (v28)
          v117 = xpc_connection_get_pid((xpc_connection_t)v28);
        else
          v117 = -1;
        LODWORD(v253[0]) = 136315906;
        *(_QWORD *)((char *)v253 + 4) = buffer;
        WORD6(v253[0]) = 1024;
        *(_DWORD *)((char *)v253 + 14) = v117;
        WORD1(v253[1]) = 2080;
        *(_QWORD *)((char *)&v253[1] + 4) = "MOUNT:INFO_FD";
        WORD6(v253[1]) = 1024;
        *(_DWORD *)((char *)&v253[1] + 14) = 22;
        v71 = &_os_log_default;
        v121 = 2;
      }
      v140 = (char *)_os_log_send_and_compose_impl(v121, 0, 0, 0, &_mh_execute_header, v71, 16);

      v102 = sub_10000A6F8("mount_sub_unmount_cryptex", "sub_mount.m", 367, "com.apple.security.cryptex.posix", 22, 0, v140);
      v103 = v140;
LABEL_90:
      free(v103);
      v45 = -1;
      if (!v102)
      {
LABEL_264:
        if (v45 == -1)
        {
LABEL_266:

          goto LABEL_267;
        }
LABEL_265:
        if (close(v45) == -1)
          sub_100040400(buffer, v253);
        goto LABEL_266;
      }
LABEL_263:
      sub_100029854(v26, v102);
      goto LABEL_264;
    }
    v46 = sub_10003CF18(v26, "UNMOUNT:FORCE", (BOOL *)&v247);
    if (v46)
    {
      *(_OWORD *)buffer = *(_OWORD *)"unknown";
      *(_OWORD *)&buffer[16] = unk_100044D68;
      v47 = xpc_connection_get_pid((xpc_connection_t)v28);
      proc_name(v47, buffer, 0x20u);
      v48 = sub_100029408();
      v49 = (void *)objc_claimAutoreleasedReturnValue(v48);

      if (v49)
      {
        v50 = sub_100029408();
        v51 = objc_claimAutoreleasedReturnValue(v50);
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          v52 = 3;
        else
          v52 = 2;
        if (v28)
          v53 = xpc_connection_get_pid((xpc_connection_t)v28);
        else
          v53 = -1;
        LODWORD(v253[0]) = 136315906;
        *(_QWORD *)((char *)v253 + 4) = buffer;
        WORD6(v253[0]) = 1024;
        *(_DWORD *)((char *)v253 + 14) = v53;
        WORD1(v253[1]) = 2080;
        *(_QWORD *)((char *)&v253[1] + 4) = "UNMOUNT:FORCE";
        WORD6(v253[1]) = 1024;
        *(_DWORD *)((char *)&v253[1] + 14) = v46;
        v120 = v52;
      }
      else
      {
        v113 = &_os_log_default;
        if (v28)
          v114 = xpc_connection_get_pid((xpc_connection_t)v28);
        else
          v114 = -1;
        LODWORD(v253[0]) = 136315906;
        *(_QWORD *)((char *)v253 + 4) = buffer;
        WORD6(v253[0]) = 1024;
        *(_DWORD *)((char *)v253 + 14) = v114;
        WORD1(v253[1]) = 2080;
        *(_QWORD *)((char *)&v253[1] + 4) = "UNMOUNT:FORCE";
        WORD6(v253[1]) = 1024;
        *(_DWORD *)((char *)&v253[1] + 14) = v46;
        v51 = &_os_log_default;
        v120 = 2;
      }
      v135 = (char *)_os_log_send_and_compose_impl(v120, 0, 0, 0, &_mh_execute_header, v51, 16);

      v136 = sub_10000A6F8("mount_sub_unmount_cryptex", "sub_mount.m", 375, "com.apple.security.cryptex.posix", v46, 0, v135);
      goto LABEL_262;
    }
    v85 = v247;
    v241 = v26;
    v86 = xpc_dictionary_get_remote_connection(v241);
    v87 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(v86);
    v260 = 0;
    v258 = 0u;
    v259 = 0u;
    v256 = 0u;
    v257 = 0u;
    v254 = 0u;
    v255 = 0u;
    memset(v253, 0, sizeof(v253));
    v252 = 0;
    memset(v251, 0, sizeof(v251));
    v243 = sub_100014FE0();
    v88 = sub_10003BC08(v45, v251);
    if (v88)
    {
      *(_OWORD *)buffer = *(_OWORD *)"unknown";
      *(_OWORD *)&buffer[16] = unk_100044D68;
      v89 = xpc_connection_get_pid(v87);
      proc_name(v89, buffer, 0x20u);
      v90 = *__error();
      v91 = sub_100029408();
      v92 = objc_claimAutoreleasedReturnValue(v91);
      if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
      {
        if (v87)
          v93 = xpc_connection_get_pid(v87);
        else
          v93 = -1;
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = buffer;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v93;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v88;
        _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_ERROR, "XPC client <process=%s pid=%d>: Failed to read cryptex info from disk.: %{darwin.errno}d", buf, 0x18u);
      }

      v124 = 0;
      v147 = 0;
      *__error() = v90;
    }
    else
    {
      v123 = (void *)xpc_create_from_plist(*(_QWORD *)&v251[0]);
      if (v123)
      {
        v124 = v123;
        if (xpc_get_type(v124) == (xpc_type_t)&_xpc_type_dictionary)
        {
          v88 = sub_10002B548(v124, 0, (uint64_t)v253, 1);
          if (v88)
          {
            v148 = xpc_copy_description(v124);
            *(_OWORD *)buf = *(_OWORD *)"unknown";
            *(_OWORD *)&buf[16] = unk_100044D68;
            v149 = xpc_connection_get_pid(v87);
            proc_name(v149, buf, 0x20u);
            v240 = *__error();
            v150 = sub_100029408();
            v151 = objc_claimAutoreleasedReturnValue(v150);
            if (os_log_type_enabled(v151, OS_LOG_TYPE_ERROR))
            {
              if (v87)
                v152 = xpc_connection_get_pid(v87);
              else
                v152 = -1;
              *(_DWORD *)buffer = 136315906;
              *(_QWORD *)&buffer[4] = buf;
              *(_WORD *)&buffer[12] = 1024;
              *(_DWORD *)&buffer[14] = v152;
              *(_WORD *)&buffer[18] = 2080;
              *(_QWORD *)&buffer[20] = v148;
              *(_WORD *)&buffer[28] = 1024;
              *(_DWORD *)&buffer[30] = v88;
              _os_log_impl((void *)&_mh_execute_header, v151, OS_LOG_TYPE_ERROR, "XPC client <process=%s pid=%d>: Info.plist invalid contents: %s: %{darwin.errno}d", buffer, 0x22u);
            }

            *__error() = v240;
            free(v148);
          }
          else
          {
            sub_1000299BC((uint64_t)buffer, v253);
            sub_100016968(v243, v85, (uint64_t)buffer, (uint64_t)v241, (uint64_t)sub_100029A44);
            v88 = 0;
          }
          v147 = v124;
          goto LABEL_248;
        }

        v125 = xpc_copy_description(v124);
        *(_OWORD *)buf = *(_OWORD *)"unknown";
        *(_OWORD *)&buf[16] = unk_100044D68;
        v126 = xpc_connection_get_pid(v87);
        proc_name(v126, buf, 0x20u);
        v127 = *__error();
        v128 = sub_100029408();
        v129 = objc_claimAutoreleasedReturnValue(v128);
        if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
        {
          if (v87)
            v130 = xpc_connection_get_pid(v87);
          else
            v130 = -1;
          *(_DWORD *)buffer = 136315906;
          *(_QWORD *)&buffer[4] = buf;
          *(_WORD *)&buffer[12] = 1024;
          *(_DWORD *)&buffer[14] = v130;
          *(_WORD *)&buffer[18] = 2080;
          *(_QWORD *)&buffer[20] = v125;
          *(_WORD *)&buffer[28] = 1024;
          *(_DWORD *)&buffer[30] = 212;
          _os_log_impl((void *)&_mh_execute_header, v129, OS_LOG_TYPE_ERROR, "XPC client <process=%s pid=%d>: Info.plist invalid root type: %s: %{darwin.errno}d", buffer, 0x22u);
        }

        *__error() = v127;
        free(v125);
        v147 = 0;
      }
      else
      {
        *(_OWORD *)buffer = *(_OWORD *)"unknown";
        *(_OWORD *)&buffer[16] = unk_100044D68;
        v142 = xpc_connection_get_pid(v87);
        proc_name(v142, buffer, 0x20u);
        v143 = *__error();
        v144 = sub_100029408();
        v145 = objc_claimAutoreleasedReturnValue(v144);
        if (os_log_type_enabled(v145, OS_LOG_TYPE_ERROR))
        {
          if (v87)
            v146 = xpc_connection_get_pid(v87);
          else
            v146 = -1;
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = buffer;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v146;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = 212;
          _os_log_impl((void *)&_mh_execute_header, v145, OS_LOG_TYPE_ERROR, "XPC client <process=%s pid=%d>: Failed to parse cryptex info: %{darwin.errno}d", buf, 0x18u);
        }

        v124 = 0;
        v147 = 0;
        *__error() = v143;
      }
      v88 = 212;
    }
LABEL_248:
    sub_10003C630(v251);

    sub_100029A70((id *)v253);
    if (!v88)
      goto LABEL_265;
    v253[0] = *(_OWORD *)"unknown";
    v253[1] = unk_100044D68;
    v210 = xpc_connection_get_pid((xpc_connection_t)v28);
    proc_name(v210, v253, 0x20u);
    v211 = sub_100029408();
    v212 = (void *)objc_claimAutoreleasedReturnValue(v211);

    if (v212)
    {
      v213 = sub_100029408();
      v214 = objc_claimAutoreleasedReturnValue(v213);
      if (os_log_type_enabled(v214, OS_LOG_TYPE_ERROR))
        v215 = 3;
      else
        v215 = 2;
      if (v28)
        v216 = xpc_connection_get_pid((xpc_connection_t)v28);
      else
        v216 = -1;
      *(_DWORD *)buffer = 136315650;
      *(_QWORD *)&buffer[4] = v253;
      *(_WORD *)&buffer[12] = 1024;
      *(_DWORD *)&buffer[14] = v216;
      *(_WORD *)&buffer[18] = 1024;
      *(_DWORD *)&buffer[20] = v88;
      v219 = v215;
    }
    else
    {
      v217 = &_os_log_default;
      if (v28)
        v218 = xpc_connection_get_pid((xpc_connection_t)v28);
      else
        v218 = -1;
      *(_DWORD *)buffer = 136315650;
      *(_QWORD *)&buffer[4] = v253;
      *(_WORD *)&buffer[12] = 1024;
      *(_DWORD *)&buffer[14] = v218;
      *(_WORD *)&buffer[18] = 1024;
      *(_DWORD *)&buffer[20] = v88;
      v214 = &_os_log_default;
      v219 = 2;
    }
    v135 = (char *)_os_log_send_and_compose_impl(v219, 0, 0, 0, &_mh_execute_header, v214, 16);

    v136 = sub_10000A6F8("mount_sub_unmount_cryptex", "sub_mount.m", 383, "com.apple.security.cryptex.posix", v88, 0, v135);
LABEL_262:
    v102 = v136;
    free(v135);
    if (!v102)
      goto LABEL_264;
    goto LABEL_263;
  }
  v13 = v1;
  *(_DWORD *)buf = -1;
  v247 = -1;
  v248 = -1;
  v245 = -1;
  v246 = -1;
  v14 = xpc_dictionary_get_remote_connection(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = sub_10002967C(v15, (uint64_t)"com.apple.private.security.cryptex.mount");
  if (v16)
  {
    v253[0] = *(_OWORD *)"unknown";
    v253[1] = unk_100044D68;
    v17 = xpc_connection_get_pid((xpc_connection_t)v15);
    proc_name(v17, v253, 0x20u);
    v18 = sub_100029408();
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

    if (v19)
    {
      v20 = sub_100029408();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        v22 = 3;
      else
        v22 = 2;
      if (v15)
        v23 = xpc_connection_get_pid((xpc_connection_t)v15);
      else
        v23 = -1;
      *(_DWORD *)buffer = 136315650;
      *(_QWORD *)&buffer[4] = v253;
      *(_WORD *)&buffer[12] = 1024;
      *(_DWORD *)&buffer[14] = v23;
      *(_WORD *)&buffer[18] = 1024;
      *(_DWORD *)&buffer[20] = v16;
      v56 = v22;
    }
    else
    {
      v54 = &_os_log_default;
      if (v15)
        v55 = xpc_connection_get_pid((xpc_connection_t)v15);
      else
        v55 = -1;
      *(_DWORD *)buffer = 136315650;
      *(_QWORD *)&buffer[4] = v253;
      *(_WORD *)&buffer[12] = 1024;
      *(_DWORD *)&buffer[14] = v55;
      *(_WORD *)&buffer[18] = 1024;
      *(_DWORD *)&buffer[20] = v16;
      v21 = &_os_log_default;
      v56 = 2;
    }
    v81 = (char *)_os_log_send_and_compose_impl(v56, 0, 0, 0, &_mh_execute_header, v21, 16);

    v82 = sub_10000A6F8("mount_sub_mount_cryptex", "sub_mount.m", 182, "com.apple.security.cryptex.posix", v16, 0, v81);
LABEL_76:
    v83 = v82;
    v84 = v81;
    goto LABEL_156;
  }
  *(_DWORD *)buf = xpc_dictionary_dup_fd(v13, "MOUNT:DMG_FD");
  if ((*(_DWORD *)buf & 0x80000000) != 0)
  {
    *(_OWORD *)buffer = *(_OWORD *)"unknown";
    *(_OWORD *)&buffer[16] = unk_100044D68;
    v59 = xpc_connection_get_pid((xpc_connection_t)v15);
    proc_name(v59, buffer, 0x20u);
    v60 = sub_100029408();
    v61 = (void *)objc_claimAutoreleasedReturnValue(v60);

    if (v61)
    {
      v62 = sub_100029408();
      v63 = objc_claimAutoreleasedReturnValue(v62);
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        v64 = 3;
      else
        v64 = 2;
      if (v15)
        v65 = xpc_connection_get_pid((xpc_connection_t)v15);
      else
        v65 = -1;
      LODWORD(v253[0]) = 136315906;
      *(_QWORD *)((char *)v253 + 4) = buffer;
      WORD6(v253[0]) = 1024;
      *(_DWORD *)((char *)v253 + 14) = v65;
      WORD1(v253[1]) = 2080;
      *(_QWORD *)((char *)&v253[1] + 4) = "MOUNT:DMG_FD";
      WORD6(v253[1]) = 1024;
      *(_DWORD *)((char *)&v253[1] + 14) = 22;
      v115 = v64;
    }
    else
    {
      v104 = &_os_log_default;
      if (v15)
        v105 = xpc_connection_get_pid((xpc_connection_t)v15);
      else
        v105 = -1;
      LODWORD(v253[0]) = 136315906;
      *(_QWORD *)((char *)v253 + 4) = buffer;
      WORD6(v253[0]) = 1024;
      *(_DWORD *)((char *)v253 + 14) = v105;
      WORD1(v253[1]) = 2080;
      *(_QWORD *)((char *)&v253[1] + 4) = "MOUNT:DMG_FD";
      WORD6(v253[1]) = 1024;
      *(_DWORD *)((char *)&v253[1] + 14) = 22;
      v63 = &_os_log_default;
      v115 = 2;
    }
    v133 = (char *)_os_log_send_and_compose_impl(v115, 0, 0, 0, &_mh_execute_header, v63, 16);

    v134 = sub_10000A6F8("mount_sub_mount_cryptex", "sub_mount.m", 190, "com.apple.security.cryptex.posix", 22, 0, v133);
    goto LABEL_155;
  }
  v248 = xpc_dictionary_dup_fd(v13, "MOUNT:LTRS_FD");
  if (v248 < 0)
  {
    *(_OWORD *)buffer = *(_OWORD *)"unknown";
    *(_OWORD *)&buffer[16] = unk_100044D68;
    v74 = xpc_connection_get_pid((xpc_connection_t)v15);
    proc_name(v74, buffer, 0x20u);
    v75 = sub_100029408();
    v76 = (void *)objc_claimAutoreleasedReturnValue(v75);

    if (v76)
    {
      v77 = sub_100029408();
      v78 = objc_claimAutoreleasedReturnValue(v77);
      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
        v79 = 3;
      else
        v79 = 2;
      if (v15)
        v80 = xpc_connection_get_pid((xpc_connection_t)v15);
      else
        v80 = -1;
      LODWORD(v253[0]) = 136315906;
      *(_QWORD *)((char *)v253 + 4) = buffer;
      WORD6(v253[0]) = 1024;
      *(_DWORD *)((char *)v253 + 14) = v80;
      WORD1(v253[1]) = 2080;
      *(_QWORD *)((char *)&v253[1] + 4) = "MOUNT:LTRS_FD";
      WORD6(v253[1]) = 1024;
      *(_DWORD *)((char *)&v253[1] + 14) = 22;
      v122 = v79;
    }
    else
    {
      v118 = &_os_log_default;
      if (v15)
        v119 = xpc_connection_get_pid((xpc_connection_t)v15);
      else
        v119 = -1;
      LODWORD(v253[0]) = 136315906;
      *(_QWORD *)((char *)v253 + 4) = buffer;
      WORD6(v253[0]) = 1024;
      *(_DWORD *)((char *)v253 + 14) = v119;
      WORD1(v253[1]) = 2080;
      *(_QWORD *)((char *)&v253[1] + 4) = "MOUNT:LTRS_FD";
      WORD6(v253[1]) = 1024;
      *(_DWORD *)((char *)&v253[1] + 14) = 22;
      v78 = &_os_log_default;
      v122 = 2;
    }
    v133 = (char *)_os_log_send_and_compose_impl(v122, 0, 0, 0, &_mh_execute_header, v78, 16);

    v134 = sub_10000A6F8("mount_sub_mount_cryptex", "sub_mount.m", 198, "com.apple.security.cryptex.posix", 22, 0, v133);
    goto LABEL_155;
  }
  v247 = xpc_dictionary_dup_fd(v13, "MOUNT:INFO_FD");
  if (v247 < 0)
  {
    *(_OWORD *)buffer = *(_OWORD *)"unknown";
    *(_OWORD *)&buffer[16] = unk_100044D68;
    v94 = xpc_connection_get_pid((xpc_connection_t)v15);
    proc_name(v94, buffer, 0x20u);
    v95 = sub_100029408();
    v96 = (void *)objc_claimAutoreleasedReturnValue(v95);

    if (v96)
    {
      v97 = sub_100029408();
      v98 = objc_claimAutoreleasedReturnValue(v97);
      if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
        v99 = 3;
      else
        v99 = 2;
      if (v15)
        v100 = xpc_connection_get_pid((xpc_connection_t)v15);
      else
        v100 = -1;
      LODWORD(v253[0]) = 136315906;
      *(_QWORD *)((char *)v253 + 4) = buffer;
      WORD6(v253[0]) = 1024;
      *(_DWORD *)((char *)v253 + 14) = v100;
      WORD1(v253[1]) = 2080;
      *(_QWORD *)((char *)&v253[1] + 4) = "MOUNT:INFO_FD";
      WORD6(v253[1]) = 1024;
      *(_DWORD *)((char *)&v253[1] + 14) = 22;
      v137 = v99;
    }
    else
    {
      v131 = &_os_log_default;
      if (v15)
        v132 = xpc_connection_get_pid((xpc_connection_t)v15);
      else
        v132 = -1;
      LODWORD(v253[0]) = 136315906;
      *(_QWORD *)((char *)v253 + 4) = buffer;
      WORD6(v253[0]) = 1024;
      *(_DWORD *)((char *)v253 + 14) = v132;
      WORD1(v253[1]) = 2080;
      *(_QWORD *)((char *)&v253[1] + 4) = "MOUNT:INFO_FD";
      WORD6(v253[1]) = 1024;
      *(_DWORD *)((char *)&v253[1] + 14) = 22;
      v98 = &_os_log_default;
      v137 = 2;
    }
    v133 = (char *)_os_log_send_and_compose_impl(v137, 0, 0, 0, &_mh_execute_header, v98, 16);

    v134 = sub_10000A6F8("mount_sub_mount_cryptex", "sub_mount.m", 206, "com.apple.security.cryptex.posix", 22, 0, v133);
    goto LABEL_155;
  }
  v246 = xpc_dictionary_dup_fd(v13, "MOUNT:IM4M_FD");
  if (v246 < 0)
  {
    *(_OWORD *)buffer = *(_OWORD *)"unknown";
    *(_OWORD *)&buffer[16] = unk_100044D68;
    v106 = xpc_connection_get_pid((xpc_connection_t)v15);
    proc_name(v106, buffer, 0x20u);
    v107 = sub_100029408();
    v108 = (void *)objc_claimAutoreleasedReturnValue(v107);

    if (v108)
    {
      v109 = sub_100029408();
      v110 = objc_claimAutoreleasedReturnValue(v109);
      if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
        v111 = 3;
      else
        v111 = 2;
      if (v15)
        v112 = xpc_connection_get_pid((xpc_connection_t)v15);
      else
        v112 = -1;
      LODWORD(v253[0]) = 136315906;
      *(_QWORD *)((char *)v253 + 4) = buffer;
      WORD6(v253[0]) = 1024;
      *(_DWORD *)((char *)v253 + 14) = v112;
      WORD1(v253[1]) = 2080;
      *(_QWORD *)((char *)&v253[1] + 4) = "MOUNT:IM4M_FD";
      WORD6(v253[1]) = 1024;
      *(_DWORD *)((char *)&v253[1] + 14) = 22;
      v141 = v111;
    }
    else
    {
      v138 = &_os_log_default;
      if (v15)
        v139 = xpc_connection_get_pid((xpc_connection_t)v15);
      else
        v139 = -1;
      LODWORD(v253[0]) = 136315906;
      *(_QWORD *)((char *)v253 + 4) = buffer;
      WORD6(v253[0]) = 1024;
      *(_DWORD *)((char *)v253 + 14) = v139;
      WORD1(v253[1]) = 2080;
      *(_QWORD *)((char *)&v253[1] + 4) = "MOUNT:IM4M_FD";
      WORD6(v253[1]) = 1024;
      *(_DWORD *)((char *)&v253[1] + 14) = 22;
      v110 = &_os_log_default;
      v141 = 2;
    }
    v133 = (char *)_os_log_send_and_compose_impl(v141, 0, 0, 0, &_mh_execute_header, v110, 16);

    v134 = sub_10000A6F8("mount_sub_mount_cryptex", "sub_mount.m", 214, "com.apple.security.cryptex.posix", 22, 0, v133);
LABEL_155:
    v83 = v134;
    v84 = v133;
LABEL_156:
    free(v84);
    v153 = 0;
    if (!v83)
      goto LABEL_158;
    goto LABEL_157;
  }
  v245 = xpc_dictionary_dup_fd(v13, "MOUNT:VOLHASH_FD");
  if (v245 < 0)
  {
    v253[0] = *(_OWORD *)"unknown";
    v253[1] = unk_100044D68;
    v38 = xpc_connection_get_pid((xpc_connection_t)v15);
    proc_name(v38, v253, 0x20u);
    v39 = *__error();
    v40 = sub_100029408();
    v41 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      if (v15)
        v42 = xpc_connection_get_pid((xpc_connection_t)v15);
      else
        v42 = -1;
      *(_DWORD *)buffer = 136315650;
      *(_QWORD *)&buffer[4] = v253;
      *(_WORD *)&buffer[12] = 1024;
      *(_DWORD *)&buffer[14] = v42;
      *(_WORD *)&buffer[18] = 2080;
      *(_QWORD *)&buffer[20] = "MOUNT:VOLHASH_FD";
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "XPC client <process=%s pid=%d>: No value for optional key %s", buffer, 0x1Cu);
    }

    *__error() = v39;
  }
  value = xpc_dictionary_get_value(v13, "MOUNT:CX1_PROPERTIES");
  v153 = (id)objc_claimAutoreleasedReturnValue(value);
  if (!v153)
  {
    *(_OWORD *)buffer = *(_OWORD *)"unknown";
    *(_OWORD *)&buffer[16] = unk_100044D68;
    v167 = xpc_connection_get_pid((xpc_connection_t)v15);
    proc_name(v167, buffer, 0x20u);
    v168 = sub_100029408();
    v169 = (void *)objc_claimAutoreleasedReturnValue(v168);

    if (v169)
    {
      v170 = sub_100029408();
      v171 = objc_claimAutoreleasedReturnValue(v170);
      if (os_log_type_enabled(v171, OS_LOG_TYPE_ERROR))
        v172 = 3;
      else
        v172 = 2;
      if (v15)
        v173 = xpc_connection_get_pid((xpc_connection_t)v15);
      else
        v173 = -1;
      LODWORD(v253[0]) = 136315906;
      *(_QWORD *)((char *)v253 + 4) = buffer;
      WORD6(v253[0]) = 1024;
      *(_DWORD *)((char *)v253 + 14) = v173;
      WORD1(v253[1]) = 2080;
      *(_QWORD *)((char *)&v253[1] + 4) = "MOUNT:CX1_PROPERTIES";
      WORD6(v253[1]) = 1024;
      *(_DWORD *)((char *)&v253[1] + 14) = 22;
      v200 = v172;
    }
    else
    {
      v184 = &_os_log_default;
      if (v15)
        v185 = xpc_connection_get_pid((xpc_connection_t)v15);
      else
        v185 = -1;
      LODWORD(v253[0]) = 136315906;
      *(_QWORD *)((char *)v253 + 4) = buffer;
      WORD6(v253[0]) = 1024;
      *(_DWORD *)((char *)v253 + 14) = v185;
      WORD1(v253[1]) = 2080;
      *(_QWORD *)((char *)&v253[1] + 4) = "MOUNT:CX1_PROPERTIES";
      WORD6(v253[1]) = 1024;
      *(_DWORD *)((char *)&v253[1] + 14) = 22;
      v171 = &_os_log_default;
      v200 = 2;
    }
    v81 = (char *)_os_log_send_and_compose_impl(v200, 0, 0, 0, &_mh_execute_header, v171, 16);

    v82 = sub_10000A6F8("mount_sub_mount_cryptex", "sub_mount.m", 228, "com.apple.security.cryptex.posix", 22, 0, v81);
    goto LABEL_76;
  }
  int64 = xpc_dictionary_get_int64(v13, "MOUNT:DMG_ASSET_IDX_INT64");
  v156 = int64;
  if (int64 != 5 && int64 != 9)
  {
    *(_OWORD *)buffer = *(_OWORD *)"unknown";
    *(_OWORD *)&buffer[16] = unk_100044D68;
    v174 = xpc_connection_get_pid((xpc_connection_t)v15);
    proc_name(v174, buffer, 0x20u);
    v175 = sub_100029408();
    v176 = (void *)objc_claimAutoreleasedReturnValue(v175);

    if (v176)
    {
      v177 = sub_100029408();
      v178 = objc_claimAutoreleasedReturnValue(v177);
      if (os_log_type_enabled(v178, OS_LOG_TYPE_ERROR))
        v179 = 3;
      else
        v179 = 2;
      if (v15)
        v180 = xpc_connection_get_pid((xpc_connection_t)v15);
      else
        v180 = -1;
      LODWORD(v253[0]) = 136315906;
      *(_QWORD *)((char *)v253 + 4) = buffer;
      WORD6(v253[0]) = 1024;
      *(_DWORD *)((char *)v253 + 14) = v180;
      WORD1(v253[1]) = 2080;
      *(_QWORD *)((char *)&v253[1] + 4) = "MOUNT:DMG_ASSET_IDX_INT64";
      WORD6(v253[1]) = 1024;
      *(_DWORD *)((char *)&v253[1] + 14) = 22;
      v204 = v179;
    }
    else
    {
      v201 = &_os_log_default;
      if (v15)
        v202 = xpc_connection_get_pid((xpc_connection_t)v15);
      else
        v202 = -1;
      LODWORD(v253[0]) = 136315906;
      *(_QWORD *)((char *)v253 + 4) = buffer;
      WORD6(v253[0]) = 1024;
      *(_DWORD *)((char *)v253 + 14) = v202;
      WORD1(v253[1]) = 2080;
      *(_QWORD *)((char *)&v253[1] + 4) = "MOUNT:DMG_ASSET_IDX_INT64";
      WORD6(v253[1]) = 1024;
      *(_DWORD *)((char *)&v253[1] + 14) = 22;
      v178 = &_os_log_default;
      v204 = 2;
    }
    v209 = (char *)_os_log_send_and_compose_impl(v204, 0, 0, 0, &_mh_execute_header, v178, 16);

    v83 = sub_10000A6F8("mount_sub_mount_cryptex", "sub_mount.m", 240, "com.apple.security.cryptex.posix", 22, 0, v209);
    v208 = v209;
    goto LABEL_235;
  }
  v157 = v13;
  v158 = v153;
  v244 = sub_100014FE0();
  memset(v253, 0, 32);
  xpc_dictionary_get_audit_token(v157, v253);
  *(_OWORD *)buffer = v253[0];
  *(_OWORD *)&buffer[16] = v253[1];
  v242 = audit_token_to_euid((audit_token_t *)buffer);
  v153 = v158;
  v159 = cryptex_core_create(0);
  v160 = (void *)v159;
  if (!v159)
  {
    v181 = *__error();
    v182 = sub_100029408();
    v183 = objc_claimAutoreleasedReturnValue(v182);
    if (os_log_type_enabled(v183, OS_LOG_TYPE_ERROR))
    {
      *(_QWORD *)buffer = 0xC04000100;
      _os_log_impl((void *)&_mh_execute_header, v183, OS_LOG_TYPE_ERROR, "Failed to create cryptex core.: %{darwin.errno}d", buffer, 8u);
    }

    v166 = 0;
    *__error() = v181;
    v161 = 12;
    goto LABEL_200;
  }
  v161 = cryptex_core_set_assets_from_fds(v159, v156, buf, &v248, &v247, &v246, &v245);
  if (v161)
  {
    v162 = *__error();
    v163 = sub_100029408();
    v164 = objc_claimAutoreleasedReturnValue(v163);
    if (os_log_type_enabled(v164, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buffer = 67109120;
      *(_DWORD *)&buffer[4] = v161;
      _os_log_impl((void *)&_mh_execute_header, v164, OS_LOG_TYPE_ERROR, "Failed to set cryptex core assets.: %{darwin.errno}d", buffer, 8u);
    }

    v165 = __error();
    v166 = 0;
  }
  else
  {
    v186 = (void *)cryptex_core_cx1_properties_create_with_xpc_dictionary(v153);
    if (v186)
    {
      cryptex_core_set_cryptex1_properties(v160);
      v166 = objc_retainAutorelease(v160);

      v161 = 0;
      goto LABEL_200;
    }
    v162 = *__error();
    v205 = sub_100029408();
    v206 = objc_claimAutoreleasedReturnValue(v205);
    if (os_log_type_enabled(v206, OS_LOG_TYPE_ERROR))
    {
      *(_QWORD *)buffer = 67109120;
      _os_log_impl((void *)&_mh_execute_header, v206, OS_LOG_TYPE_ERROR, "Failed to parse Cryptex1 properties.: %{darwin.errno}d", buffer, 8u);
    }

    v165 = __error();
    v166 = 0;
    v161 = 0;
  }
  *v165 = v162;
LABEL_200:

  v187 = v166;
  if (v161)
  {
    v188 = *__error();
    v189 = sub_100029408();
    v190 = objc_claimAutoreleasedReturnValue(v189);
    if (os_log_type_enabled(v190, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buffer = 67109120;
      *(_DWORD *)&buffer[4] = v161;
      _os_log_impl((void *)&_mh_execute_header, v190, OS_LOG_TYPE_ERROR, "Failed to initialize cryptex core.: %{darwin.errno}d", buffer, 8u);
    }

    *__error() = v188;
  }
  else
  {
    sub_1000166E4(v244, v187, v242, (uint64_t)v157, (uint64_t)sub_1000297BC);
  }

  if (!v161)
    goto LABEL_158;
  v253[0] = *(_OWORD *)"unknown";
  v253[1] = unk_100044D68;
  v191 = xpc_connection_get_pid((xpc_connection_t)v15);
  proc_name(v191, v253, 0x20u);
  v192 = sub_100029408();
  v193 = (void *)objc_claimAutoreleasedReturnValue(v192);

  if (v193)
  {
    v194 = sub_100029408();
    v195 = objc_claimAutoreleasedReturnValue(v194);
    if (os_log_type_enabled(v195, OS_LOG_TYPE_ERROR))
      v196 = 3;
    else
      v196 = 2;
    if (v15)
      v197 = xpc_connection_get_pid((xpc_connection_t)v15);
    else
      v197 = -1;
    *(_DWORD *)buffer = 136315650;
    *(_QWORD *)&buffer[4] = v253;
    *(_WORD *)&buffer[12] = 1024;
    *(_DWORD *)&buffer[14] = v197;
    *(_WORD *)&buffer[18] = 1024;
    *(_DWORD *)&buffer[20] = v161;
    v203 = v196;
  }
  else
  {
    v198 = &_os_log_default;
    if (v15)
      v199 = xpc_connection_get_pid((xpc_connection_t)v15);
    else
      v199 = -1;
    *(_DWORD *)buffer = 136315650;
    *(_QWORD *)&buffer[4] = v253;
    *(_WORD *)&buffer[12] = 1024;
    *(_DWORD *)&buffer[14] = v199;
    *(_WORD *)&buffer[18] = 1024;
    *(_DWORD *)&buffer[20] = v161;
    v195 = &_os_log_default;
    v203 = 2;
  }
  v207 = (char *)_os_log_send_and_compose_impl(v203, 0, 0, 0, &_mh_execute_header, v195, 16);

  v83 = sub_10000A6F8("mount_sub_mount_cryptex", "sub_mount.m", 249, "com.apple.security.cryptex.posix", v161, 0, v207);
  v208 = v207;
LABEL_235:
  free(v208);
  if (v83)
LABEL_157:
    sub_100029448(v13, v83, 0, 0, 0);
LABEL_158:

  if (v245 != -1 && close(v245) == -1)
  {
    *(_QWORD *)buffer = 0;
    v254 = 0u;
    v255 = 0u;
    memset(v253, 0, sizeof(v253));
    v220 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    v221 = *__error();
    if (v220)
      v222 = 3;
    else
      v222 = 2;
    LODWORD(v251[0]) = 67109120;
    DWORD1(v251[0]) = v221;
    v223 = _os_log_send_and_compose_impl(v222, buffer, v253, 80, &_mh_execute_header, &_os_log_default, 16);
    v224 = _os_crash_msg(*(_QWORD *)buffer, v223);
    sub_10003E8A4(v224);
  }
  if (v246 != -1 && close(v246) == -1)
  {
    *(_QWORD *)buffer = 0;
    v254 = 0u;
    v255 = 0u;
    memset(v253, 0, sizeof(v253));
    v225 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    v226 = *__error();
    if (v225)
      v227 = 3;
    else
      v227 = 2;
    LODWORD(v251[0]) = 67109120;
    DWORD1(v251[0]) = v226;
    v228 = _os_log_send_and_compose_impl(v227, buffer, v253, 80, &_mh_execute_header, &_os_log_default, 16);
    v229 = _os_crash_msg(*(_QWORD *)buffer, v228);
    sub_10003E8A4(v229);
  }
  if (v247 != -1 && close(v247) == -1)
  {
    *(_QWORD *)buffer = 0;
    v254 = 0u;
    v255 = 0u;
    memset(v253, 0, sizeof(v253));
    v230 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    v231 = *__error();
    if (v230)
      v232 = 3;
    else
      v232 = 2;
    LODWORD(v251[0]) = 67109120;
    DWORD1(v251[0]) = v231;
    v233 = _os_log_send_and_compose_impl(v232, buffer, v253, 80, &_mh_execute_header, &_os_log_default, 16);
    v234 = _os_crash_msg(*(_QWORD *)buffer, v233);
    sub_10003E8A4(v234);
  }
  if (v248 != -1 && close(v248) == -1)
  {
    *(_QWORD *)buffer = 0;
    v254 = 0u;
    v255 = 0u;
    memset(v253, 0, sizeof(v253));
    v235 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    v236 = *__error();
    if (v235)
      v237 = 3;
    else
      v237 = 2;
    LODWORD(v251[0]) = 67109120;
    DWORD1(v251[0]) = v236;
    v238 = _os_log_send_and_compose_impl(v237, buffer, v253, 80, &_mh_execute_header, &_os_log_default, 16);
    v239 = _os_crash_msg(*(_QWORD *)buffer, v238);
    sub_10003E8A4(v239);
  }
  if (*(_DWORD *)buf != -1 && close(*(int *)buf) == -1)
    sub_10004035C(buffer, v253);

LABEL_267:
}

void sub_1000291EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, __int16 a14, char a15, char a16, __int16 a17, char a18, char a19, __int16 a20,unsigned int a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42)
{
  void *v42;
  uint64_t v43;

  free(v42);
  sub_100029A70((id *)(v43 - 256));
  sub_100029614(&a21);
  _Unwind_Resume(a1);
}

id sub_100029408()
{
  if (qword_10005A888 != -1)
    dispatch_once(&qword_10005A888, &stru_100057008);
  return (id)qword_10005A890;
}

void sub_100029448(void *a1, __CFError *a2, const char *a3, const char *a4, const char *a5)
{
  id v9;
  xpc_object_t reply;
  xpc_connection_t remote_connection;
  _xpc_connection_s *v12;
  xpc_object_t v13;
  pid_t pid;
  int v15;
  id v16;
  NSObject *v17;
  pid_t v18;
  int v19;
  _OWORD *v20;
  __int16 v21;
  pid_t v22;
  __int16 v23;
  xpc_object_t v24;
  _OWORD buffer[2];

  v9 = a1;
  reply = xpc_dictionary_create_reply(v9);
  remote_connection = xpc_dictionary_get_remote_connection(v9);
  v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);

  if (a3)
    xpc_dictionary_set_string(reply, "MOUNT:NAME_STR", a3);
  if (a4)
    xpc_dictionary_set_string(reply, "MOUNT:VERSION_STR", a4);
  if (a5)
    xpc_dictionary_set_string(reply, "MOUNT:MOUNTPATH_STR", a5);
  if (a2)
  {
    v13 = sub_10003D708(a2);
    xpc_dictionary_set_value(reply, "MOUNT:ERROR_DICT", v13);

  }
  buffer[0] = *(_OWORD *)"unknown";
  buffer[1] = unk_100044D68;
  pid = xpc_connection_get_pid(v12);
  proc_name(pid, buffer, 0x20u);
  v15 = *__error();
  v16 = sub_100029408();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    if (v12)
      v18 = xpc_connection_get_pid(v12);
    else
      v18 = -1;
    v19 = 136315650;
    v20 = buffer;
    v21 = 1024;
    v22 = v18;
    v23 = 2114;
    v24 = reply;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "XPC client <process=%s pid=%d>: Replying to mount client: %{public}@", (uint8_t *)&v19, 0x1Cu);
  }

  *__error() = v15;
  xpc_dictionary_send_reply(reply);

}

uint64_t sub_100029614(unsigned int *a1)
{
  uint64_t result;
  uint64_t v2;
  _OWORD v3[5];

  result = *a1;
  if ((_DWORD)result != -1)
  {
    result = close(result);
    if ((_DWORD)result == -1)
      sub_1000404A4(&v2, v3);
  }
  return result;
}

uint64_t sub_10002967C(void *a1, uint64_t a2)
{
  _xpc_connection_s *v3;
  uint64_t v4;
  pid_t pid;
  int v6;
  id v7;
  NSObject *v8;
  pid_t v9;
  int v11;
  _OWORD *v12;
  __int16 v13;
  pid_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  int v18;
  _OWORD buffer[2];

  v3 = a1;
  if (sub_100029AF0((uint64_t)v3, a2))
  {
    v4 = 0;
  }
  else
  {
    buffer[0] = *(_OWORD *)"unknown";
    buffer[1] = unk_100044D68;
    pid = xpc_connection_get_pid(v3);
    proc_name(pid, buffer, 0x20u);
    v6 = *__error();
    v7 = sub_100029408();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      if (v3)
        v9 = xpc_connection_get_pid(v3);
      else
        v9 = -1;
      v11 = 136315906;
      v12 = buffer;
      v13 = 1024;
      v14 = v9;
      v15 = 2080;
      v16 = a2;
      v17 = 1024;
      v18 = 144;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "XPC client <process=%s pid=%d>: Client lacks entitlement '%s': %{darwin.errno}d", (uint8_t *)&v11, 0x22u);
    }

    *__error() = v6;
    v4 = 144;
  }

  return v4;
}

void sub_1000297BC(void *a1, void *a2, __CFError *a3, void *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  const char *v12;
  id v13;

  v13 = a1;
  v7 = a2;
  v8 = v7;
  if (!v7)
  {
    v10 = 0;
    goto LABEL_5;
  }
  v9 = sub_1000311B8((uint64_t)v7);
  v10 = (const char *)sub_100031188((uint64_t)v8);
  if (!v9)
  {
LABEL_5:
    v11 = 0;
    v12 = 0;
    goto LABEL_6;
  }
  v11 = *(const char **)v9;
  v12 = **(const char ***)(v9 + 16);
LABEL_6:
  sub_100029448(a4, a3, v11, v12, v10);

}

void sub_100029854(void *a1, __CFError *a2)
{
  id v3;
  xpc_object_t reply;
  xpc_connection_t remote_connection;
  _xpc_connection_s *v6;
  xpc_object_t v7;
  pid_t pid;
  int v9;
  id v10;
  NSObject *v11;
  pid_t v12;
  int v13;
  _OWORD *v14;
  __int16 v15;
  pid_t v16;
  __int16 v17;
  xpc_object_t v18;
  _OWORD buffer[2];

  v3 = a1;
  reply = xpc_dictionary_create_reply(v3);
  remote_connection = xpc_dictionary_get_remote_connection(v3);
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);

  if (a2)
  {
    v7 = sub_10003D708(a2);
    xpc_dictionary_set_value(reply, "UNMOUNT:ERROR_DICT", v7);

  }
  buffer[0] = *(_OWORD *)"unknown";
  buffer[1] = unk_100044D68;
  pid = xpc_connection_get_pid(v6);
  proc_name(pid, buffer, 0x20u);
  v9 = *__error();
  v10 = sub_100029408();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    if (v6)
      v12 = xpc_connection_get_pid(v6);
    else
      v12 = -1;
    v13 = 136315650;
    v14 = buffer;
    v15 = 1024;
    v16 = v12;
    v17 = 2114;
    v18 = reply;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "XPC client <process=%s pid=%d>: Replying to unmount client: %{public}@", (uint8_t *)&v13, 0x1Cu);
  }

  *__error() = v9;
  xpc_dictionary_send_reply(reply);

}

id sub_1000299BC(uint64_t a1, __int128 *a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  id result;

  v4 = *a2;
  *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
  *(_OWORD *)a1 = v4;
  *(_QWORD *)(a1 + 24) = *((id *)a2 + 3);
  v5 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v5;
  v7 = a2[5];
  v6 = a2[6];
  v8 = a2[4];
  *(_QWORD *)(a1 + 112) = *((_QWORD *)a2 + 14);
  *(_OWORD *)(a1 + 80) = v7;
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 64) = v8;
  *(_QWORD *)(a1 + 120) = *((id *)a2 + 15);
  *(_QWORD *)(a1 + 128) = *((id *)a2 + 16);
  result = *((id *)a2 + 17);
  *(_QWORD *)(a1 + 136) = result;
  *(_WORD *)(a1 + 144) = *((_WORD *)a2 + 72);
  return result;
}

void sub_100029A44(uint64_t a1, uint64_t a2, __CFError *a3, void *a4)
{
  sub_100029854(a4, a3);

}

void sub_100029A70(id *a1)
{

}

void sub_100029AA8(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.libcryptex", "mount_sub");
  v2 = (void *)qword_10005A890;
  qword_10005A890 = (uint64_t)v1;

}

uint64_t sub_100029AD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  return _os_log_send_and_compose_impl(v8, v6, v7, 80, a5, a6, 16);
}

BOOL sub_100029AF0(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  int v5;
  _BOOL8 value;
  int v8;
  uint64_t v9;

  v3 = (void *)xpc_connection_copy_entitlement_value();
  if (!v3)
    return 0;
  v4 = v3;
  if (xpc_get_type(v3) != (xpc_type_t)&_xpc_type_BOOL)
  {
    v5 = *__error();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315138;
      v9 = a2;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Entitlement is not a BOOLean: %s", (uint8_t *)&v8, 0xCu);
    }
    *__error() = v5;
  }
  value = xpc_BOOL_get_value(v4);

  return value;
}

void sub_100029BE0(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_100029C08(uint64_t a1)
{
  void *v2;
  int v3;
  const char *v4;
  int v5;
  NSObject *v6;
  const char *v7;
  CFErrorRef v8;
  _QWORD *v9;
  const char *v10;
  CFErrorRef v11;
  int v12;
  const char *v13;
  NSObject *v14;
  const char *v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint32_t v19;
  const char *v20;
  int v21;
  NSObject *v22;
  const char *v23;
  mach_header_64 *v24;
  char *v25;
  char *v26;
  mach_header_64 *v27;
  char *v28;
  uint64_t image_slide;
  _QWORD *v30;
  mach_header_64 *v31;
  char *v32;
  uint64_t v33;
  const char *v34;
  int v35;
  NSObject *v36;
  const char *v37;
  void *v38;
  uint64_t v39;
  int v40;
  const char *v42;
  NSObject *v43;
  const char *v44;
  void *v45;
  const char *v46;
  const char *v47;
  void *v48;
  const char *v49;
  const char *v50;
  const char *v51;
  void *v52;
  NSObject *v53;
  uint32_t v54;
  const char *v55;
  int v56;
  NSObject *v57;
  const char *v58;
  const char *v59;
  NSObject *v60;
  const char *v61;
  void *v62;
  const char *v63;
  NSObject *v64;
  const char *v66;
  void *v67;
  void *object;
  _BYTE buf[12];
  __int16 v70;
  void *v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  int v75;
  uint64_t v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  uint64_t v121;

  v2 = sub_100008E6C();
  object = 0;
  v121 = 0;
  v119 = 0u;
  v120 = 0u;
  v117 = 0u;
  v118 = 0u;
  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  v92 = 0u;
  v91 = 0u;
  v90 = 0u;
  v89 = 0u;
  v88 = 0u;
  v87 = 0u;
  v86 = 0u;
  v85 = 0u;
  v84 = 0u;
  v83 = 0u;
  v82 = 0u;
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v77 = 0u;
  v76 = 32;
  v3 = xpc_pipe_receive(a1, &object, 0);
  v4 = (const char *)*((_QWORD *)v2 + 2);
  v5 = *__error();
  v6 = *((_QWORD *)v2 + 4);
  if (!v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v10 = "[anonymous]";
      if (v4)
        v10 = v4;
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = v10;
      v70 = 2112;
      v71 = object;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}s: msg recv: %@", buf, 0x16u);
    }
    *__error() = v5;
    v11 = sub_100039338((uint64_t)&v99, object, *((NSObject **)v2 + 4));
    v8 = v11;
    if (v11)
    {
      v12 = sub_10000A88C((CFIndex)v11);
      if (v12)
      {
        v3 = v12;
        v13 = (const char *)*((_QWORD *)v2 + 2);
        v5 = *__error();
        v14 = *((_QWORD *)v2 + 4);
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
          goto LABEL_7;
        v15 = "[anonymous]";
        if (v13)
          v15 = v13;
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = v15;
        v70 = 1024;
        LODWORD(v71) = v3;
        v16 = "%{public}s: init msg failed: %{darwin.errno}d";
        v17 = v14;
        v18 = OS_LOG_TYPE_FAULT;
        v19 = 18;
        goto LABEL_19;
      }
    }
    sub_10002A4A8((uint64_t)&v99, (uint64_t)"received ipc");
    if ((unint64_t)v100 >= 4)
    {
      v20 = (const char *)*((_QWORD *)v2 + 2);
      v21 = *__error();
      v22 = *((_QWORD *)v2 + 4);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        v23 = "[anonymous]";
        if (v20)
          v23 = v20;
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = v23;
        v70 = 2048;
        v71 = (void *)v100;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, "%{public}s: bad subsystem id: %llu", buf, 0x16u);
      }
      v3 = 72;
      goto LABEL_56;
    }
    sub_100039F14(&v76, (uint64_t)&v99);
    v24 = _NSGetMachExecuteHeader();
    *(_QWORD *)buf = 0;
    v25 = getsectdatafromheader_64(v24, "__DATA_CONST", "__subsystem", (uint64_t *)buf);
    v26 = &v25[_dyld_get_image_slide(v24)];
    v27 = _NSGetMachExecuteHeader();
    *(_QWORD *)buf = 0;
    v28 = getsectdatafromheader_64(v27, "__DATA_CONST", "__subsystem", (uint64_t *)buf);
    image_slide = _dyld_get_image_slide(v27);
    if (v26 >= &v28[image_slide + *(_QWORD *)buf])
LABEL_29:
      sub_100040548();
    while (1)
    {
      v30 = *(_QWORD **)v26;
      if ((_QWORD)v100 == **(_QWORD **)v26)
        break;
      v26 += 8;
      v31 = _NSGetMachExecuteHeader();
      *(_QWORD *)buf = 0;
      v32 = getsectdatafromheader_64(v31, "__DATA_CONST", "__subsystem", (uint64_t *)buf);
      v33 = _dyld_get_image_slide(v31);
      if (v26 >= &v32[v33 + *(_QWORD *)buf])
        goto LABEL_29;
    }
    v34 = (const char *)*((_QWORD *)v2 + 2);
    v35 = *__error();
    v36 = *((_QWORD *)v2 + 4);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      v37 = "[anonymous]";
      v38 = (void *)v30[2];
      if (v34)
        v37 = v34;
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = v37;
      v70 = 2080;
      v71 = v38;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "%{public}s: found subsystem: %s", buf, 0x16u);
    }
    *__error() = v35;
    if (v30[1] == (_QWORD)v101)
    {
      if (*((_QWORD *)&v100 + 1) >= v30[5])
      {
        v50 = (const char *)*((_QWORD *)v2 + 2);
        v21 = *__error();
        v64 = *((_QWORD *)v2 + 4);
        v3 = 76;
        if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
        {
          v51 = "[anonymous]";
          if (v50)
            v51 = v50;
          v52 = (void *)v30[2];
          *(_DWORD *)buf = 136446978;
          *(_QWORD *)&buf[4] = v51;
          v70 = 2080;
          v71 = v52;
          v72 = 2048;
          v73 = *((_QWORD *)&v100 + 1);
          v74 = 1024;
          v75 = 76;
          v49 = "%{public}s: bad routine id: subsystem = %s, rpc = %llu: %{darwin.errno}d";
          goto LABEL_54;
        }
      }
      else
      {
        v39 = ((uint64_t (*)(__int128 *))v30[3])(&v100);
        if (!v39)
        {
          v59 = (const char *)*((_QWORD *)v2 + 2);
          v21 = *__error();
          v60 = *((_QWORD *)v2 + 4);
          v3 = 71;
          if (!os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
            goto LABEL_56;
          v61 = "[anonymous]";
          v62 = (void *)v30[2];
          if (v59)
            v61 = v59;
          *(_DWORD *)buf = 136446722;
          *(_QWORD *)&buf[4] = v61;
          v70 = 2080;
          v71 = v62;
          v72 = 1024;
          LODWORD(v73) = 71;
          v49 = "%{public}s: no target %s object found: %{darwin.errno}d";
          v53 = v60;
          v54 = 28;
          goto LABEL_55;
        }
        v40 = ((uint64_t (*)(uint64_t, __int128 *, uint64_t *))v30[4])(v39, &v99, &v76);
        v3 = v40;
        if (v40 == 36 || v40 == 0)
        {
          v42 = (const char *)*((_QWORD *)v2 + 2);
          v5 = *__error();
          v43 = *((_QWORD *)v2 + 4);
          if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
            goto LABEL_7;
          v44 = "[anonymous]";
          if (v42)
            v44 = v42;
          v45 = (void *)v30[2];
          *(_DWORD *)buf = 136446978;
          *(_QWORD *)&buf[4] = v44;
          v70 = 2080;
          v71 = v45;
          v72 = 2048;
          v73 = *((_QWORD *)&v100 + 1);
          v74 = 1024;
          v75 = v3;
          v16 = "%{public}s: %s demux: routine = %llu: %{darwin.errno}d";
          v17 = v43;
          v18 = OS_LOG_TYPE_DEBUG;
          v19 = 38;
LABEL_19:
          _os_log_impl((void *)&_mh_execute_header, v17, v18, v16, buf, v19);
          goto LABEL_7;
        }
        v63 = (const char *)*((_QWORD *)v2 + 2);
        v21 = *__error();
        v64 = *((_QWORD *)v2 + 4);
        if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
        {
          v66 = "[anonymous]";
          if (v63)
            v66 = v63;
          v67 = (void *)v30[2];
          *(_DWORD *)buf = 136446978;
          *(_QWORD *)&buf[4] = v66;
          v70 = 2080;
          v71 = v67;
          v72 = 2048;
          v73 = *((_QWORD *)&v100 + 1);
          v74 = 1024;
          v75 = v3;
          v49 = "%{public}s: %s demux failed: routine = %llu: %{darwin.errno}d";
LABEL_54:
          v53 = v64;
          v54 = 38;
LABEL_55:
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_FAULT, v49, buf, v54);
        }
      }
    }
    else
    {
      v46 = (const char *)*((_QWORD *)v2 + 2);
      v21 = *__error();
      v64 = *((_QWORD *)v2 + 4);
      v3 = 74;
      if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
      {
        v47 = "[anonymous]";
        if (v46)
          v47 = v46;
        v48 = (void *)v30[2];
        *(_DWORD *)buf = 136446978;
        *(_QWORD *)&buf[4] = v47;
        v70 = 2080;
        v71 = v48;
        v72 = 2048;
        v73 = v101;
        v74 = 1024;
        v75 = 74;
        v49 = "%{public}s: bad target type: subsystem = %s, type = %llu: %{darwin.errno}d";
        goto LABEL_54;
      }
    }
LABEL_56:
    *__error() = v21;
    v9 = sub_100008E6C();
    goto LABEL_57;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    v7 = "[anonymous]";
    if (v4)
      v7 = v4;
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = v7;
    v70 = 1024;
    LODWORD(v71) = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "%{public}s: msg recv failed: %{darwin.errno}d", buf, 0x12u);
  }
  v8 = 0;
LABEL_7:
  *__error() = v5;
  v9 = sub_100008E6C();
  if (v3 == 36)
  {
LABEL_63:
    if (!v9)
      goto LABEL_65;
    goto LABEL_64;
  }
LABEL_57:
  if ((v76 & 0x10) != 0)
    goto LABEL_63;
  v55 = (const char *)v9[2];
  v56 = *__error();
  v57 = v9[4];
  if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT))
  {
    v58 = "[anonymous]";
    if (v55)
      v58 = v55;
    *(_DWORD *)buf = 136446722;
    *(_QWORD *)&buf[4] = v58;
    v70 = 2048;
    v71 = (void *)v100;
    v72 = 1024;
    LODWORD(v73) = v3;
    _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_FAULT, "%{public}s: demux failed: subsystem = %llu: %{darwin.errno}d", buf, 0x1Cu);
  }
  *__error() = v56;
  sub_10003A174((uint64_t)&v99, &v76, v3);
LABEL_64:
  os_release(v9);
LABEL_65:
  sub_10003A088(&v76);
  sub_10003A088(&v99);
  if (object)
    os_release(object);
  os_release(v2);
  if (v8)
    CFRelease(v8);
}

void sub_10002A4A8(uint64_t a1, uint64_t a2)
{
  void *v4;
  char *v5;
  void *v6;
  char *v7;
  uint64_t v8;
  const char *v9;
  int v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  char *v24;
  uint64_t v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  char *v41;
  __int16 v42;
  char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  int v47;
  __int16 v48;
  int v49;
  __int16 v50;
  int v51;
  __int16 v52;
  int v53;
  __int16 v54;
  int v55;
  __int16 v56;
  int v57;
  __int16 v58;
  int v59;

  v4 = sub_100008E6C();
  v24 = 0;
  v5 = 0;
  v6 = 0;
  v7 = 0;
  if (os_log_type_enabled(*((os_log_t *)v4 + 4), OS_LOG_TYPE_DEBUG))
  {
    v6 = (void *)os_flagset_copy_string(&unk_100059FA0, *(_QWORD *)a1);
    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
    {
      if (v8 == 1)
      {
        if (asprintf(&v24, "%s", (const char *)(a1 + 40)) < 0)
          sub_100040560(&v25, buf);
      }
      else if (v8 == 2)
      {
        v24 = (char *)os_mach_port_copy_description(*(unsigned int *)(a1 + 40));
      }
      else if (asprintf(&v24, "[invalid target type: %#llx]", *(_QWORD *)(a1 + 32)) < 0)
      {
        sub_100040560(&v25, buf);
      }
    }
    else if (asprintf(&v24, "%#llx", *(_QWORD *)(a1 + 40)) < 0)
    {
      sub_100040560(&v25, buf);
    }
    v7 = xpc_copy_description(*(xpc_object_t *)(a1 + 304));
    v9 = (const char *)*((_QWORD *)v4 + 2);
    v10 = *__error();
    v11 = *((_QWORD *)v4 + 4);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = "[anonymous]";
      v13 = *(_QWORD *)(a1 + 16);
      v14 = *(_QWORD *)(a1 + 24);
      if (v9)
        v12 = v9;
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(_DWORD *)(a1 + 328);
      v17 = *(_DWORD *)(a1 + 332);
      v18 = *(_DWORD *)(a1 + 336);
      v19 = *(_DWORD *)(a1 + 340);
      v20 = *(_DWORD *)(a1 + 344);
      v21 = *(_DWORD *)(a1 + 348);
      v22 = *(_DWORD *)(a1 + 352);
      v23 = *(_DWORD *)(a1 + 356);
      *(_DWORD *)buf = 136450306;
      v27 = v12;
      v28 = 2080;
      v29 = a2;
      v30 = 2048;
      v31 = a1;
      v32 = 2080;
      v33 = v6;
      v34 = 2048;
      v35 = v13;
      v36 = 2048;
      v37 = v14;
      v38 = 2048;
      v39 = v15;
      v40 = 2080;
      v41 = v24;
      v42 = 2080;
      v43 = v7;
      v44 = 1024;
      v45 = v16;
      v46 = 1024;
      v47 = v17;
      v48 = 1024;
      v49 = v18;
      v50 = 1024;
      v51 = v19;
      v52 = 1024;
      v53 = v20;
      v54 = 1024;
      v55 = v21;
      v56 = 1024;
      v57 = v22;
      v58 = 1024;
      v59 = v23;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%{public}s: invoke = %s [%p]\ninvoke.flags = %s\ninvoke.target.sub = %llu\ninvoke.target.routine = %llu\ninvoke.target.type = %llu\ninvoke.target = %s\ninvoke.argv = %s\ninvoke.cred.auid = %u\ninvoke.cred.euid = %u\ninvoke.cred.egid = %u\ninvoke.cred.ruid = %u\ninvoke.cred.rgid = %u\ninvoke.cred.pid = %u\ninvoke.cred.asid = %u\ninvoke.cred.pidvers = %u\n", buf,
        0x8Cu);
    }
    *__error() = v10;
    v5 = v24;
  }
  free(v7);
  free(v5);
  free(v6);
  os_release(v4);
}

_QWORD *sub_10002A74C(void *a1, _BYTE *a2, _BYTE *a3)
{
  _QWORD *v5;

  v5 = sub_10003C89C(a1, 0x28uLL);
  v5[3] = sub_100039FB8(a2);
  v5[4] = sub_100039FB8(a3);
  return v5;
}

void sub_10002A79C(uint64_t *a1, int a2)
{
  uint64_t v3;

  v3 = *a1;
  sub_10003A174(*(_QWORD *)(*a1 + 24), *(_BYTE **)(*a1 + 32), a2);
  sub_10003A088(*(_BYTE **)(v3 + 24));
  sub_10003A088(*(_BYTE **)(v3 + 32));
  sub_10003C998((void **)v3);
  *a1 = 0;
}

void sub_10002A7E4(uint64_t *a1, __CFError *a2)
{
  uint64_t v3;

  v3 = *a1;
  sub_10003A328(*(_QWORD *)(*a1 + 24), *(_QWORD *)(*a1 + 32), a2);
  sub_10003A088(*(_BYTE **)(v3 + 24));
  sub_10003A088(*(_BYTE **)(v3 + 32));
  sub_10003C998((void **)v3);
  *a1 = 0;
}

uint64_t sub_10002A82C(void *a1)
{
  uint64_t result;
  const char *v2;

  result = (uint64_t)xpc_dictionary_get_string(a1, "SUBSYSTEM");
  if (result)
  {
    v2 = (const char *)result;
    if (!strcmp((const char *)result, "CODEX"))
    {
      return 1;
    }
    else if (!strcmp(v2, "COLLATION"))
    {
      return 2;
    }
    else if (!strcmp(v2, "UPGRADE_WAIT"))
    {
      return 6;
    }
    else if (!strcmp(v2, "UPGRADE_LOCK"))
    {
      return 7;
    }
    else if (!strcmp(v2, "UPGRADE_ABORT"))
    {
      return 8;
    }
    else if (!strcmp(v2, "CRYPTEX"))
    {
      return 3;
    }
    else if (!strcmp(v2, "DAEMON"))
    {
      return 4;
    }
    else if (!strcmp(v2, "SESSION"))
    {
      return 5;
    }
    else if (!strcmp(v2, "MOUNT"))
    {
      return 9;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_1000405D0((uint64_t)v2);
      return 0;
    }
  }
  return result;
}

void start()
{
  _QWORD *v0;
  void *v1;
  mach_header_64 *v2;
  char *v3;
  void (**v4)(void);
  mach_header_64 *v5;
  char *v6;
  uint64_t image_slide;
  void (*v8)(void);
  mach_header_64 *v9;
  char *v10;
  uint64_t v11;
  uint64_t size;

  v0 = (_QWORD *)off_10005A3A0;
  v0[1] = dispatch_queue_create("com.apple.security.cryptexd.main", 0);
  sub_1000084E4();
  v1 = sub_100008E6C();
  v2 = _NSGetMachExecuteHeader();
  size = 0;
  v3 = getsectdatafromheader_64(v2, "__DATA_CONST", "__object_init", &size);
  v4 = (void (**)(void))&v3[_dyld_get_image_slide(v2)];
  v5 = _NSGetMachExecuteHeader();
  size = 0;
  v6 = getsectdatafromheader_64(v5, "__DATA_CONST", "__object_init", &size);
  image_slide = _dyld_get_image_slide(v5);
  if (v4 < (void (**)(void))&v6[image_slide + size])
  {
    do
    {
      v8 = *v4++;
      v8();
      v9 = _NSGetMachExecuteHeader();
      size = 0;
      v10 = getsectdatafromheader_64(v9, "__DATA_CONST", "__object_init", &size);
      v11 = _dyld_get_image_slide(v9);
    }
    while (v4 < (void (**)(void))&v10[v11 + size]);
  }
  *v0 |= 1uLL;
  sub_100008EA4((uint64_t)v1);
  dispatch_main();
}

CFErrorRef sub_10002AAB8(int a1, int a2, NSObject *a3)
{
  NSObject *v3;
  os_log_t v6;
  const __CFDictionary *v7;
  io_service_t MatchingService;
  io_service_t v9;
  int v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  CFErrorRef v15;
  FILE *v16;
  int v17;
  int v18;
  uint64_t v19;
  NSObject *v20;
  char *v21;
  CFIndex v22;
  const char *v23;
  int v24;
  kern_return_t v25;
  kern_return_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  _QWORD *v30;
  const void *v31;
  size_t v32;
  size_t v33;
  uint64_t v34;
  int v35;
  int v36;
  int v37;
  uint64_t v38;
  NSObject *v39;
  int v41;
  uint64_t v42;
  NSObject *v43;
  char *v44;
  _OWORD v45[3];
  uint64_t v46;
  _OWORD v47[3];
  uint64_t v48;
  _OWORD v49[3];
  uint64_t v50;
  io_connect_t connect;
  uint64_t v52;
  uint8_t buf[88];

  v3 = a3;
  v6 = 0;
  connect = 0;
  v50 = 0;
  memset(v49, 0, sizeof(v49));
  v48 = 0;
  memset(v47, 0, sizeof(v47));
  v46 = 0;
  memset(v45, 0, sizeof(v45));
  if (!a3)
  {
    v6 = os_log_create("com.apple.libcryptex", "amfi");
    v3 = v6;
  }
  v7 = IOServiceMatching("AppleMobileFileIntegrity");
  MatchingService = IOServiceGetMatchingService(0, v7);
  if (MatchingService)
  {
    v9 = MatchingService;
    v10 = sub_10003BC08(a2, v47);
    if (v10)
    {
      v11 = v10;
      if (v3)
      {
        if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
          v12 = 3;
        else
          v12 = 2;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v11;
        v13 = v3;
      }
      else
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v10;
        v13 = &_os_log_default;
        v12 = 2;
      }
      v21 = (char *)_os_log_send_and_compose_impl(v12, 0, 0, 0, &_mh_execute_header, v13, 16);
      v22 = v11;
      v23 = "com.apple.security.cryptex.posix";
      v24 = 38;
LABEL_40:
      v15 = sub_10000A6F8("amfi_load_trust_cache", "amfi.c", v24, v23, v22, 0, v21);
      free(v21);
      v16 = 0;
      goto LABEL_41;
    }
    v17 = sub_10003BC08(a1, v49);
    if (v17)
    {
      v18 = v17;
      if (v3)
      {
        if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
          v19 = 3;
        else
          v19 = 2;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v18;
        v20 = v3;
      }
      else
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v17;
        v20 = &_os_log_default;
        v19 = 2;
      }
      v21 = (char *)_os_log_send_and_compose_impl(v19, 0, 0, 0, &_mh_execute_header, v20, 16);
      v22 = v18;
      v23 = "com.apple.security.cryptex.posix";
      v24 = 44;
      goto LABEL_40;
    }
    v25 = IOServiceOpen(v9, mach_task_self_, 0, &connect);
    if (v25)
    {
      v26 = v25;
      if (v3)
      {
        if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
          v27 = 3;
        else
          v27 = 2;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v26;
        v28 = v3;
      }
      else
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v25;
        v28 = &_os_log_default;
        v27 = 2;
      }
      v21 = (char *)_os_log_send_and_compose_impl(v27, 0, 0, 0, &_mh_execute_header, v28, 16);
      v23 = "com.apple.security.cryptex";
      v24 = 50;
      v22 = 34;
      goto LABEL_40;
    }
    v29 = *((_QWORD *)&v47[0] + 1) + *((_QWORD *)&v49[0] + 1) + 16;
    v30 = mmap(0, v29, 3, 4098, -1, 0);
    if (v30 == (_QWORD *)-1)
    {
      v41 = *__error();
      if (v3)
      {
        if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
          v42 = 3;
        else
          v42 = 2;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v41;
        v43 = v3;
      }
      else
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v41;
        v43 = &_os_log_default;
        v42 = 2;
      }
      v44 = (char *)_os_log_send_and_compose_impl(v42, 0, 0, 0, &_mh_execute_header, v43, 16);
      v15 = sub_10000A6F8("amfi_load_trust_cache", "amfi.c", 66, "com.apple.security.cryptex.posix", v41, 0, v44);
      v16 = 0;
    }
    else
    {
      v31 = v30;
      *v30 = *((_QWORD *)&v47[0] + 1);
      v30[1] = *((_QWORD *)&v49[0] + 1);
      sub_10003C3E0(v45, 0, (uint64_t)sub_10003C384, (uint64_t)v30, v29);
      v16 = sub_10003C588((uint64_t)v45, "rw", 0x10uLL);
      v32 = fwrite(*(const void **)&v47[0], *((size_t *)&v47[0] + 1), 1uLL, v16);
      if (fcheck_np(v16, v32, 1))
        sub_100040730(&v52, buf);
      v33 = fwrite(*(const void **)&v49[0], *((size_t *)&v49[0] + 1), 1uLL, v16);
      if (fcheck_np(v16, v33, 1))
        sub_100040730(&v52, buf);
      v34 = IOConnectCallMethod(connect, 7u, 0, 0, v31, v29, 0, 0, 0, 0);
      if (!(_DWORD)v34)
      {
        v15 = 0;
        goto LABEL_58;
      }
      v35 = v34;
      v36 = sub_100010B88(v34);
      v37 = v36;
      if (v3)
      {
        if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
          v38 = 3;
        else
          v38 = 2;
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)&buf[4] = v35;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = v37;
        v39 = v3;
      }
      else
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)&buf[4] = v35;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = v36;
        v39 = &_os_log_default;
        v38 = 2;
      }
      v44 = (char *)_os_log_send_and_compose_impl(v38, 0, 0, 0, &_mh_execute_header, v39, 16);
      v15 = sub_10000A6F8("amfi_load_trust_cache", "amfi.c", 96, "com.apple.security.cryptex.posix", v37, 0, v44);
    }
    free(v44);
LABEL_58:
    if (connect && IOServiceClose(connect))
      sub_1000406B8(&v52, buf);
    if (v9 != -1)
      mach_right_send_release(v9);
    goto LABEL_41;
  }
  v14 = *__error();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "could not find AppleMobileFileIntegrity", buf, 2u);
  }
  v15 = 0;
  v16 = 0;
  *__error() = v14;
LABEL_41:
  sub_10003C630(v45);
  sub_10003C630(v49);
  sub_10003C630(v47);
  if (v6)
    os_release(v6);
  if (v16 && fclose(v16) == -1 && *__error())
    sub_10004064C(&v52, buf);
  return v15;
}

double sub_10002B284(_QWORD *a1, _OWORD *a2)
{
  double result;

  *a1 = 0;
  result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

void sub_10002B2C4(uint64_t a1)
{
  int v1;
  int v2;
  const void *v4;
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int16 v12;
  int v13;
  _OWORD v14[5];

  v1 = *(_DWORD *)(a1 + 404);
  v2 = *(_DWORD *)(a1 + 400);
  if ((v1 & 0x80000000) == 0 || (v2 & 0x80000000) == 0)
  {
    v10 = 0;
    memset(v14, 0, sizeof(v14));
    v6 = v2;
    v7 = v1;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      v8 = 3;
    else
      v8 = 2;
    LODWORD(v11) = 67109376;
    HIDWORD(v11) = v7;
    v12 = 1024;
    v13 = v6;
    v9 = _os_log_send_and_compose_impl(v8, &v10, v14, 80, &_mh_execute_header, &_os_log_default, 16);
    _os_crash_msg(v10, v9);
    __break(1u);
LABEL_13:
    sub_10004079C(&v11, v14);
  }
  if (*(_DWORD *)(a1 + 184))
    goto LABEL_13;
  sub_10002B424(a1 + 208);
  free(*(void **)(a1 + 360));
  os_release(*(void **)(a1 + 392));
  os_release(*(void **)(a1 + 200));
  v4 = *(const void **)(a1 + 408);
  if (v4)
    CFRelease(v4);
  v5 = *(void **)(a1 + 192);
  if (v5)
    xpc_release(v5);
  sub_10002B4F8(a1);
  sub_10003AA48(a1 + 56);
}

void sub_10002B424(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a1)
  {
    v2 = *(void **)a1;
    if (v2)
    {
      if (!*(_QWORD *)(a1 + 104))
        goto LABEL_7;
      v3 = 0;
      do
      {
        v4 = a1 + 8 * v3;
        free(*(void **)(v4 + 40));
        *(_QWORD *)(v4 + 40) = 0;
        ++v3;
      }
      while (v3 < *(_QWORD *)(a1 + 104));
      v2 = *(void **)a1;
      if (*(_QWORD *)a1)
      {
LABEL_7:
        free(v2);
        *(_QWORD *)a1 = 0;
      }
      if (*(_QWORD *)(a1 + 16))
      {
        cryptex_version_destroy(a1 + 16);
        *(_QWORD *)(a1 + 16) = 0;
      }
      v5 = *(void **)(a1 + 24);
      if (v5)
      {
        os_release(v5);
        *(_QWORD *)(a1 + 24) = 0;
      }
      v6 = *(void **)(a1 + 32);
      if (v6)
      {
        free(v6);
        *(_QWORD *)(a1 + 32) = 0;
      }
      v7 = *(void **)(a1 + 128);
      if (v7)
      {
        xpc_release(v7);
        *(_QWORD *)(a1 + 128) = 0;
      }
      v8 = *(void **)(a1 + 136);
      if (v8)
      {
        xpc_release(v8);
        *(_QWORD *)(a1 + 136) = 0;
      }
      v9 = *(void **)(a1 + 120);
      if (v9)
      {
        xpc_release(v9);
        *(_QWORD *)(a1 + 120) = 0;
      }
    }
  }
}

void sub_10002B4F8(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 368);
  if (v2)
  {
    free(v2);
    *(_QWORD *)(a1 + 368) = 0;
  }
  free(*(void **)(a1 + 416));
  *(_QWORD *)(a1 + 416) = 0;
  free(*(void **)(a1 + 424));
  *(_QWORD *)(a1 + 424) = 0;
  free(*(void **)(a1 + 432));
  *(_QWORD *)(a1 + 432) = 0;
}

uint64_t sub_10002B548(void *a1, _QWORD *a2, uint64_t a3, int a4)
{
  void *v8;
  char *v9;
  const char *v10;
  int v11;
  NSObject *v12;
  const char *v13;
  xpc_object_t v14;
  void *v15;
  xpc_object_t v16;
  void *v17;
  xpc_object_t v18;
  void *v19;
  const char *v20;
  int v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  int v26;
  NSObject *v27;
  const char *v28;
  void *string_ptr;
  void *v30;
  xpc_object_t v31;
  void *v32;
  const char *v33;
  int v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  _BYTE buf[24];
  void *v41;
  void *v42;
  uint64_t v43;

  v8 = sub_100008E6C();
  if (os_log_type_enabled(*((os_log_t *)v8 + 4), OS_LOG_TYPE_DEBUG))
  {
    v9 = xpc_copy_description(a1);
    v10 = (const char *)*((_QWORD *)v8 + 2);
    v11 = *__error();
    v12 = *((_QWORD *)v8 + 4);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = "[anonymous]";
      if (v10)
        v13 = v10;
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%{public}s: making attr from: %s", buf, 0x16u);
    }
    *__error() = v11;
    free(v9);
  }
  v14 = sub_10003CB30((uint64_t)&off_100057028, a1);
  if (v14)
  {
    v15 = v14;
    v16 = sub_10003CB30((uint64_t)&off_100057048, a1);
    if (!v16)
    {
      v25 = (const char *)*((_QWORD *)v8 + 2);
      v26 = *__error();
      v27 = *((_QWORD *)v8 + 4);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = "[anonymous]";
        *(_DWORD *)buf = 136446978;
        if (v25)
          v28 = v25;
        *(_QWORD *)&buf[4] = v28;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "CFBundleVersion";
        *(_WORD *)&buf[22] = 2112;
        v41 = a1;
        LOWORD(v42) = 1024;
        *(_DWORD *)((char *)&v42 + 2) = 212;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%{public}s: missing key: %s: %@: %{darwin.errno}d", buf, 0x26u);
      }
      *__error() = v26;
      v24 = 212;
      goto LABEL_45;
    }
    v17 = v16;
    v18 = sub_10003CB30((uint64_t)&off_100057068, a1);
    if (v18)
    {
      v19 = sub_100008E6C();
      *(_QWORD *)buf = _NSConcreteStackBlock;
      *(_QWORD *)&buf[8] = 0x40000000;
      *(_QWORD *)&buf[16] = sub_1000311C0;
      v41 = &unk_100057128;
      v42 = v19;
      v43 = a3;
      xpc_array_apply(v18, buf);
      if (v19)
        os_release(v19);
    }
    xpc_string_get_string_ptr(v15);
    if (a4)
    {
      xpc_string_get_string_ptr(v17);
      asprintf((char **)a3, "%s-v%s");
    }
    else
    {
      asprintf((char **)a3, "%s");
    }
    string_ptr = sub_10003CB30((uint64_t)&off_100057088, a1);
    v30 = string_ptr;
    if (string_ptr)
      string_ptr = (void *)xpc_string_get_string_ptr(string_ptr);
    *(_QWORD *)(a3 + 8) = string_ptr;
    v31 = sub_10003CB30((uint64_t)&off_1000570A8, a1);
    v32 = v31;
    if (v31)
    {
      if (xpc_get_type(v31) != (xpc_type_t)&_xpc_type_BOOL)
      {
        v33 = (const char *)*((_QWORD *)v8 + 2);
        v34 = *__error();
        v35 = *((_QWORD *)v8 + 4);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          v36 = "[anonymous]";
          *(_DWORD *)buf = 136446978;
          if (v33)
            v36 = v33;
          *(_QWORD *)&buf[4] = v36;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "DeveloperModeRequired";
          *(_WORD *)&buf[22] = 2112;
          v41 = a1;
          LOWORD(v42) = 1024;
          *(_DWORD *)((char *)&v42 + 2) = 212;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%{public}s: invalid value for key: %s: %@: %{darwin.errno}d", buf, 0x26u);
        }
        *__error() = v34;
        os_release(v8);
        v37 = 212;
LABEL_39:
        os_release(v32);
        v24 = v37;
LABEL_40:
        if (v18)
          os_release(v18);
        if (v30)
          os_release(v30);
        v8 = v17;
LABEL_45:
        os_release(v8);
        goto LABEL_46;
      }
      LOBYTE(v31) = xpc_BOOL_get_value(v32);
    }
    *(_BYTE *)(a3 + 144) = (_BYTE)v31;
    *(_QWORD *)(a3 + 120) = sub_10003CB30((uint64_t)&off_1000570C8, a1);
    *(_QWORD *)(a3 + 136) = sub_10003CB30((uint64_t)&off_1000570E8, a1);
    *(_QWORD *)(a3 + 128) = sub_10003CB30((uint64_t)&off_100057108, a1);
    v38 = xpc_string_get_string_ptr(v17);
    *(_QWORD *)(a3 + 16) = cryptex_version_new(v38);
    *(_QWORD *)(a3 + 24) = os_retain(a1);
    if (a2)
      *(_QWORD *)(a3 + 32) = *a2;
    else
      a2 = (_QWORD *)(a3 + 32);
    *a2 = 0;
    os_release(v8);
    v37 = 0;
    v24 = 0;
    if (!v32)
      goto LABEL_40;
    goto LABEL_39;
  }
  v20 = (const char *)*((_QWORD *)v8 + 2);
  v21 = *__error();
  v22 = *((_QWORD *)v8 + 4);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    v23 = "[anonymous]";
    *(_DWORD *)buf = 136446978;
    if (v20)
      v23 = v20;
    *(_QWORD *)&buf[4] = v23;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "CFBundleIdentifier";
    *(_WORD *)&buf[22] = 2112;
    v41 = a1;
    LOWORD(v42) = 1024;
    *(_DWORD *)((char *)&v42 + 2) = 212;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%{public}s: missing key: %s: %@: %{darwin.errno}d", buf, 0x26u);
  }
  *__error() = v21;
  v24 = 212;
  v15 = v8;
LABEL_46:
  os_release(v15);
  return v24;
}

uint64_t sub_10002BA54(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  void *v5;
  xpc_object_t array;
  size_t count;
  uint64_t v8;
  size_t v9;
  void *v10;
  void *v11;
  const _xpc_type_s *type;
  size_t v13;
  size_t v14;
  size_t i;
  xpc_object_t dictionary;
  void *v17;
  const char *string;
  const char *v19;
  const char *v20;
  const char *v21;
  int v22;
  NSObject *v23;
  const char *v24;
  const char *v25;
  int v26;
  NSObject *v27;
  const char *v28;
  const char *v29;
  NSObject *v30;
  const char *v31;
  const char *v32;
  size_t j;
  xpc_object_t v34;
  const char *v35;
  char *v36;
  uint64_t v37;
  _QWORD *v39;
  void *v40;
  uint64_t v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  size_t v45;
  __int16 v46;
  const char *v47;

  v4 = sub_100008E6C();
  v5 = *(void **)(a1 + 24);
  if (!v5)
    sub_100040824(&v41, buf);
  array = xpc_dictionary_get_array(v5, "Dependencies");
  count = xpc_array_get_count(array);
  if (count > 8)
  {
    v8 = 59;
    if (!v4)
      return v8;
    goto LABEL_47;
  }
  v9 = count;
  v10 = sub_100008E6C();
  if (!array)
    sub_1000408AC(&v41, buf);
  v11 = v10;
  type = xpc_get_type(array);
  if (type != (const _xpc_type_s *)&_xpc_type_array)
    sub_1000409E0(&v41, buf, type);
  v13 = xpc_array_get_count(array);
  if (v13)
  {
    v14 = v13;
    v39 = v4;
    v40 = v11;
    for (i = 0; i != v14; ++i)
    {
      dictionary = xpc_array_get_dictionary(array, i);
      if (!dictionary)
      {
        v11 = v40;
        v25 = (const char *)*((_QWORD *)v40 + 2);
        v26 = *__error();
        v27 = *((_QWORD *)v40 + 4);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v28 = "[anonymous]";
          if (v25)
            v28 = v25;
          *(_DWORD *)buf = 136446466;
          v43 = v28;
          v44 = 2048;
          v45 = i;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%{public}s: unable to parse dependency dictionary for element %lu in dependencies array from c411", buf, 0x16u);
        }
        v4 = v39;
        goto LABEL_36;
      }
      v17 = dictionary;
      string = xpc_dictionary_get_string(dictionary, "CFBundleIdentifier");
      v19 = xpc_dictionary_get_string(v17, "CFBundleVersion");
      if (!string)
      {
        v8 = 22;
        goto LABEL_27;
      }
      v20 = v19;
      if (!sub_10001F28C(a2, (uint64_t)string, (uint64_t)v19))
      {
        v29 = (const char *)*((_QWORD *)v40 + 2);
        v26 = *__error();
        v30 = *((_QWORD *)v40 + 4);
        v4 = v39;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v31 = "[anonymous]";
          if (v29)
            v31 = v29;
          v32 = "unspecified";
          *(_DWORD *)buf = 136446722;
          v43 = v31;
          v44 = 2080;
          v45 = (size_t)string;
          if (v20)
            v32 = v20;
          v46 = 2080;
          v47 = v32;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%{public}s: unable to satisfy dependency with bundleID : %s (min version : %s)", buf, 0x20u);
        }
        v11 = v40;
LABEL_36:
        *__error() = v26;
        v8 = 22;
        goto LABEL_37;
      }
    }
    v8 = 0;
LABEL_27:
    v4 = v39;
    v11 = v40;
    if (v40)
      goto LABEL_37;
  }
  else
  {
    v8 = 0;
    if (v11)
    {
LABEL_37:
      os_release(v11);
      if ((_DWORD)v8)
        goto LABEL_16;
      goto LABEL_38;
    }
  }
  if ((_DWORD)v8)
  {
LABEL_16:
    v21 = (const char *)v4[2];
    v22 = *__error();
    v23 = v4[4];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = "[anonymous]";
      if (v21)
        v24 = v21;
      *(_DWORD *)buf = 136446466;
      v43 = v24;
      v44 = 1024;
      LODWORD(v45) = v8;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%{public}s: quire_evaluate_dependencies() failed: %{darwin.errno}d", buf, 0x12u);
    }
    *__error() = v22;
LABEL_47:
    os_release(v4);
    return v8;
  }
LABEL_38:
  if (v9)
  {
    for (j = 0; j != v9; ++j)
    {
      v34 = xpc_array_get_dictionary(array, j);
      if (!v34)
        sub_10004093C();
      v35 = xpc_dictionary_get_string(v34, "CFBundleIdentifier");
      if (_dispatch_is_multithreaded())
      {
        while (1)
        {
          v36 = strdup(v35);
          if (v36)
            break;
          __os_temporary_resource_shortage();
        }
      }
      else
      {
        v36 = strdup(v35);
        if (!v36)
          sub_100040954();
      }
      v37 = *(_QWORD *)(a1 + 104);
      *(_QWORD *)(a1 + 8 * v37 + 40) = v36;
      *(_QWORD *)(a1 + 104) = v37 + 1;
    }
  }
  v8 = 0;
  if (v4)
    goto LABEL_47;
  return v8;
}

uint64_t sub_10002BE30(uint64_t result)
{
  *(_BYTE *)(result + 145) = 1;
  return result;
}

uint64_t sub_10002BE3C(void *a1, _QWORD *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  void *v19;
  _QWORD *v20;
  unint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD v29[3];
  const char *v30;

  v8 = *a3;
  v29[0] = "cryptex";
  v29[1] = v8;
  v9 = a3 + 2;
  v29[2] = *(_QWORD *)a3[2];
  v30 = "NODGST";
  v10 = a2[20];
  if (v10)
    v30 = (const char *)(v10 + 160);
  v11 = sub_100011444(488);
  *(_QWORD *)(v11 + 176) = a4;
  v12 = *((_OWORD *)a3 + 1);
  *(_OWORD *)(v11 + 208) = *(_OWORD *)a3;
  *(_OWORD *)(v11 + 224) = v12;
  v13 = *((_OWORD *)a3 + 5);
  v15 = *((_OWORD *)a3 + 2);
  v14 = *((_OWORD *)a3 + 3);
  *(_OWORD *)(v11 + 272) = *((_OWORD *)a3 + 4);
  *(_OWORD *)(v11 + 288) = v13;
  *(_OWORD *)(v11 + 240) = v15;
  *(_OWORD *)(v11 + 256) = v14;
  v17 = *((_OWORD *)a3 + 7);
  v16 = *((_OWORD *)a3 + 8);
  v18 = *((_OWORD *)a3 + 6);
  *(_QWORD *)(v11 + 352) = a3[18];
  *(_OWORD *)(v11 + 320) = v17;
  *(_OWORD *)(v11 + 336) = v16;
  *(_OWORD *)(v11 + 304) = v18;
  *(_QWORD *)(v11 + 392) = os_retain(a1);
  v19 = os_retain(a2);
  *(_QWORD *)(v11 + 400) = -1;
  *(_DWORD *)(v11 + 188) = 0;
  *(_QWORD *)(v11 + 192) = 0;
  *(_QWORD *)(v11 + 200) = v19;
  *(_QWORD *)(v11 + 360) = cryptex_core_unparse_hdiid(v29);
  *(_QWORD *)(v11 + 384) = v11 + 376;
  v20 = (_QWORD *)(v11 + 472);
  *(_OWORD *)(v11 + 368) = 0u;
  *(_OWORD *)(v11 + 472) = 0u;
  if (a3[13])
  {
    v21 = 0;
    do
    {
      v22 = sub_100017DE4((uint64_t)a1, (char *)a3[v21 + 5], 0);
      if (!v22)
        sub_100040A78();
      v23 = v22;
      v24 = malloc_type_malloc(0x10uLL, 0x18EC0261uLL);
      if (!v24)
        sub_100040A90();
      v25 = v24;
      *v24 = v23;
      os_retain(v23);
      v25[1] = *v20;
      *v20 = v25;
      v26 = malloc_type_malloc(0x10uLL, 0x18EC0261uLL);
      if (!v26)
        sub_100040A90();
      v27 = v26;
      *v26 = v11;
      os_retain((void *)v11);
      v27[1] = v23[60];
      v23[60] = v27;
      os_release(v23);
      ++v21;
    }
    while (v21 < a3[13]);
  }
  *a3 = 0;
  *v9 = 0;
  v9[1] = 0;
  sub_10003A760(v11 + 56, (int)"com.apple.security.cryptexd", "quire");
  sub_10003A908(v11 + 56, *(const char **)(v11 + 208));
  cryptex_init(v11, 0, 0, 0);
  sub_100038F38(v11 + 80, *(char **)(v11 + 208));
  sub_100038F38(v11 + 112, *(char **)(v11 + 208));
  sub_100038F38(v11 + 144, *(char **)(v11 + 208));
  return v11;
}

_QWORD *sub_10002C0A0(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  _QWORD *result;

  result = sub_10003C89C((void *)a1, 0x50uLL);
  *((_DWORD *)result + 11) = a2;
  result[7] = a3;
  result[8] = a4;
  if (!*(_DWORD *)(a1 + 184))
    return (_QWORD *)cryptex_async_f(a1, result, sub_10002C11C);
  result[3] = 0;
  **(_QWORD **)(a1 + 384) = result;
  *(_QWORD *)(a1 + 384) = result + 3;
  return result;
}

uint64_t sub_10002C11C(uint64_t *a1)
{
  uint64_t v2;
  int v3;
  const char *v4;
  const char *v5;
  const char *v6;
  int v7;
  int v8;
  CFIndex v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  const char *v28;
  int v29;
  NSObject *v30;
  const char *v31;
  __darwin_ino64_t v32;
  int v33;
  int v34;
  void *v35;
  uint64_t v36;
  const char *v37;
  void *v38;
  char *v39;
  const char *v40;
  char *v41;
  const char *v42;
  int v43;
  CFIndex v44;
  CFErrorRef v45;
  const char *v46;
  char *v47;
  int v48;
  CFIndex v49;
  CFErrorRef v50;
  char *v51;
  const char *v52;
  char *v53;
  int v54;
  const char *v55;
  CFTypeRef v56;
  void *v57;
  uint64_t v58;
  const char *v59;
  void *v60;
  int v61;
  int v62;
  void *v63;
  uint64_t v64;
  const char *v65;
  void *v66;
  const char *v67;
  char *v68;
  int v69;
  CFErrorRef v70;
  CFErrorRef v71;
  const char *v72;
  char *v73;
  uint64_t result;
  int v75;
  int v76;
  void *v77;
  uint64_t v78;
  const char *v79;
  void *v80;
  void *v81;
  _BOOL4 v82;
  const char *v83;
  uint64_t v84;
  const char *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  const char *v89;
  void *v90;
  char *v91;
  char *v92;
  const char *v93;
  uint64_t v94;
  char v95;
  char v96;
  void *v97;
  uint64_t v98;
  const char *v99;
  __darwin_ino64_t v100;
  void *v101;
  uint64_t v102;
  uint64_t image_asset;
  uint64_t asset;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  int v109;
  NSObject *v110;
  const char *v111;
  uint64_t v112;
  const char *v113;
  int v114;
  NSObject *v115;
  const char *v116;
  const char *v117;
  const char *v118;
  const char *v119;
  const char *v120;
  int v121;
  NSObject *v122;
  const char *v123;
  int v124;
  int v125;
  void *v126;
  uint64_t v127;
  const char *v128;
  void *v129;
  int v130;
  int v131;
  void *v132;
  uint64_t v133;
  const char *v134;
  void *v135;
  const char *v136;
  char *v137;
  CFIndex v138;
  const char *v139;
  int v140;
  void *v141;
  uint64_t v142;
  const char *v143;
  void *v144;
  int v145;
  char *v146;
  const char *v147;
  const char *v148;
  CFTypeRef v149;
  void *v150;
  uint64_t v151;
  const char *v152;
  void *v153;
  int v154;
  int v155;
  void *v156;
  uint64_t v157;
  const char *v158;
  void *v159;
  const char *v160;
  const char *v161;
  const char *v162;
  __darwin_ino64_t v163;
  int v164;
  void *v165;
  _BOOL4 v166;
  const char *v167;
  uint64_t v168;
  const char *v169;
  void *v170;
  char *v171;
  char *v172;
  char *v173;
  const char *v174;
  char *v175;
  int v176;
  int v177;
  const char *v178;
  NSObject *v179;
  const char *v180;
  const char *v181;
  int v182;
  NSObject *v183;
  int v184;
  int v185;
  int v186;
  int v187;
  int v188;
  uint64_t v189;
  char __str[16];
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  char v204[31];
  char __s1[4];
  const char *v206;
  __int16 v207;
  const char *v208;
  __int16 v209;
  int v210;
  stat v211;
  char v212[1036];
  int v213;
  int v214;
  int v215;
  int v216;
  uint8_t buf[4];
  const char *v218;
  __int16 v219;
  char *v220;
  __int16 v221;
  int v222;

  v2 = *a1;
  v3 = *((_DWORD *)a1 + 11);
  v186 = -1;
  v4 = *(const char **)(v2 + 240);
  if (!v4)
  {
    v203 = 0u;
    memset(v204, 0, sizeof(v204));
    v201 = 0u;
    v202 = 0u;
    v199 = 0u;
    v200 = 0u;
    v197 = 0u;
    v198 = 0u;
    v195 = 0u;
    v196 = 0u;
    v193 = 0u;
    v194 = 0u;
    v191 = 0u;
    v192 = 0u;
    *(_OWORD *)__str = 0u;
    if ((*(_DWORD *)(v2 + 400) & 0x80000000) == 0)
    {
      v14 = *(void **)(v2 + 72);
      if (v14)
      {
        if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR))
          v15 = 3;
        else
          v15 = 2;
        v16 = *(const char **)(v2 + 56);
        if (!v16)
          v16 = "[anonymous]";
        v211.st_dev = 136446466;
        *(_QWORD *)&v211.st_mode = v16;
        WORD2(v211.st_ino) = 1024;
        *(_DWORD *)((char *)&v211.st_ino + 6) = 37;
        v17 = v14;
      }
      else
      {
        v40 = *(const char **)(v2 + 56);
        if (!v40)
          v40 = "[anonymous]";
        v211.st_dev = 136446466;
        *(_QWORD *)&v211.st_mode = v40;
        WORD2(v211.st_ino) = 1024;
        *(_DWORD *)((char *)&v211.st_ino + 6) = 37;
        v17 = &_os_log_default;
        v15 = 2;
      }
      v41 = (char *)_os_log_send_and_compose_impl(v15, 0, 0, 0, &_mh_execute_header, v17, 16);
      v42 = "com.apple.security.cryptex.posix";
      v43 = 576;
      v44 = 37;
      goto LABEL_56;
    }
    if (*(_QWORD *)(v2 + 216))
    {
      v28 = *(const char **)(v2 + 56);
      v29 = *__error();
      v30 = *(NSObject **)(v2 + 72);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = "[anonymous]";
        v32 = *(_QWORD *)(v2 + 216);
        if (v28)
          v31 = v28;
        v211.st_dev = 136446466;
        *(_QWORD *)&v211.st_mode = v31;
        WORD2(v211.st_ino) = 2080;
        *(__darwin_ino64_t *)((char *)&v211.st_ino + 6) = v32;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}s: custom mount path %s", (uint8_t *)&v211, 0x16u);
      }
      *__error() = v29;
      if (**(_BYTE **)(v2 + 216) != 47)
      {
        v87 = *(void **)(v2 + 72);
        if (v87)
        {
          if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR))
            v88 = 3;
          else
            v88 = 2;
          v89 = *(const char **)(v2 + 56);
          if (!v89)
            v89 = "[anonymous]";
          v211.st_dev = 136446466;
          *(_QWORD *)&v211.st_mode = v89;
          WORD2(v211.st_ino) = 1024;
          *(_DWORD *)((char *)&v211.st_ino + 6) = 22;
          v90 = v87;
        }
        else
        {
          v117 = *(const char **)(v2 + 56);
          if (!v117)
            v117 = "[anonymous]";
          v211.st_dev = 136446466;
          *(_QWORD *)&v211.st_mode = v117;
          WORD2(v211.st_ino) = 1024;
          *(_DWORD *)((char *)&v211.st_ino + 6) = 22;
          v90 = &_os_log_default;
          v88 = 2;
        }
        v41 = (char *)_os_log_send_and_compose_impl(v88, 0, 0, 0, &_mh_execute_header, v90, 16);
        v42 = "com.apple.security.cryptex.posix";
        v43 = 586;
        v44 = 22;
        goto LABEL_56;
      }
      snprintf(__str, 0xFFuLL, "%s", *(const char **)(v2 + 216));
      v33 = sub_10003BAB4(__str, 0x1FFu, &v186);
      if (v33)
      {
        v34 = v33;
        v35 = *(void **)(v2 + 72);
        if (v35)
        {
          if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR))
            v36 = 3;
          else
            v36 = 2;
          v37 = *(const char **)(v2 + 56);
          if (!v37)
            v37 = "[anonymous]";
          v211.st_dev = 136446466;
          *(_QWORD *)&v211.st_mode = v37;
          WORD2(v211.st_ino) = 1024;
          *(_DWORD *)((char *)&v211.st_ino + 6) = v34;
          v38 = v35;
        }
        else
        {
          v119 = *(const char **)(v2 + 56);
          if (!v119)
            v119 = "[anonymous]";
          v211.st_dev = 136446466;
          *(_QWORD *)&v211.st_mode = v119;
          WORD2(v211.st_ino) = 1024;
          *(_DWORD *)((char *)&v211.st_ino + 6) = v33;
          v38 = &_os_log_default;
          v36 = 2;
        }
        v41 = (char *)_os_log_send_and_compose_impl(v36, 0, 0, 0, &_mh_execute_header, v38, 16);
        v44 = v34;
        v42 = "com.apple.security.cryptex.posix";
        v43 = 592;
        goto LABEL_56;
      }
      if (*(_BYTE *)(v2 + 353))
      {
        v94 = 0;
        v95 = 1;
        while (1)
        {
          v96 = v95;
          if ((sub_10000E258((uint64_t)off_100057148[v94], *(_QWORD *)(v2 + 216)) & 1) != 0)
            break;
          v95 = 0;
          v94 = 1;
          if ((v96 & 1) == 0)
          {
            v97 = *(void **)(v2 + 72);
            if (v97)
            {
              if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR))
                v98 = 3;
              else
                v98 = 2;
              v99 = *(const char **)(v2 + 56);
              v100 = *(_QWORD *)(v2 + 216);
              if (!v99)
                v99 = "[anonymous]";
              v211.st_dev = 136446466;
              *(_QWORD *)&v211.st_mode = v99;
              WORD2(v211.st_ino) = 2082;
              *(__darwin_ino64_t *)((char *)&v211.st_ino + 6) = v100;
              v101 = v97;
            }
            else
            {
              v162 = *(const char **)(v2 + 56);
              if (!v162)
                v162 = "[anonymous]";
              v163 = *(_QWORD *)(v2 + 216);
              v211.st_dev = 136446466;
              *(_QWORD *)&v211.st_mode = v162;
              WORD2(v211.st_ino) = 2082;
              *(__darwin_ino64_t *)((char *)&v211.st_ino + 6) = v163;
              v101 = &_os_log_default;
              v98 = 2;
            }
            v41 = (char *)_os_log_send_and_compose_impl(v98, 0, 0, 0, &_mh_execute_header, v101, 16);
            v42 = "com.apple.security.cryptex";
            v43 = 606;
            v44 = 2;
            goto LABEL_56;
          }
        }
      }
    }
    else
    {
      snprintf(__str, 0xFFuLL, "%s.XXXXXX", *(const char **)(v2 + 208));
      v75 = sub_10003BA5C(v3, __str, &v186);
      if (v75)
      {
        v76 = v75;
        v77 = *(void **)(v2 + 72);
        if (v77)
        {
          if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR))
            v78 = 3;
          else
            v78 = 2;
          v79 = *(const char **)(v2 + 56);
          if (!v79)
            v79 = "[anonymous]";
          v211.st_dev = 136446466;
          *(_QWORD *)&v211.st_mode = v79;
          WORD2(v211.st_ino) = 1024;
          *(_DWORD *)((char *)&v211.st_ino + 6) = v76;
          v80 = v77;
        }
        else
        {
          v118 = *(const char **)(v2 + 56);
          if (!v118)
            v118 = "[anonymous]";
          v211.st_dev = 136446466;
          *(_QWORD *)&v211.st_mode = v118;
          WORD2(v211.st_ino) = 1024;
          *(_DWORD *)((char *)&v211.st_ino + 6) = v75;
          v80 = &_os_log_default;
          v78 = 2;
        }
        v41 = (char *)_os_log_send_and_compose_impl(v78, 0, 0, 0, &_mh_execute_header, v80, 16);
        v44 = v76;
        v42 = "com.apple.security.cryptex.posix";
        v43 = 614;
        goto LABEL_56;
      }
    }
    v188 = -1;
    v102 = v186;
    bzero(&v211.st_uid, 0x828uLL);
    v211.st_ino = *(_QWORD *)(v2 + 360);
    *(_DWORD *)&v211.st_mode = -1;
    v213 = -1;
    v215 = -1;
    bzero(__s1, 0x400uLL);
    v187 = -1;
    image_asset = cryptex_core_get_image_asset(*(_QWORD *)(v2 + 200));
    v211.st_dev = *(_DWORD *)(image_asset + 16);
    if (cryptex_asset_type_is_cryptex1(*(_QWORD *)(image_asset + 8)))
    {
      asset = cryptex_core_get_asset(*(_QWORD *)(v2 + 200), &_cryptex_asset_type_gtgv);
      if (!asset)
      {
        v141 = *(void **)(v2 + 72);
        if (v141)
        {
          if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR))
            v142 = 3;
          else
            v142 = 2;
          v143 = *(const char **)(v2 + 56);
          if (!v143)
            v143 = "[anonymous]";
          *(_DWORD *)buf = 136446210;
          v218 = v143;
          v144 = v141;
        }
        else
        {
          v148 = *(const char **)(v2 + 56);
          if (!v148)
            v148 = "[anonymous]";
          *(_DWORD *)buf = 136446210;
          v218 = v148;
          v144 = &_os_log_default;
          v142 = 2;
        }
        v137 = (char *)_os_log_send_and_compose_impl(v142, 0, 0, 0, &_mh_execute_header, v144, 16);
        v139 = "com.apple.security.cryptex";
        v140 = 212;
        v138 = 15;
        goto LABEL_230;
      }
      v105 = asset;
      v106 = cryptex_core_get_asset(*(_QWORD *)(v2 + 200), &_cryptex_asset_type_im4m);
      if (v106 && (v107 = v106, cryptex_asset_len(v106, v2 + 56) >= 1))
      {
        v108 = *(const char **)(v2 + 56);
        v109 = *__error();
        v110 = *(NSObject **)(v2 + 72);
        if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
        {
          v111 = "[anonymous]";
          if (v108)
            v111 = v108;
          *(_DWORD *)buf = 136446210;
          v218 = v111;
          _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_INFO, "%{public}s: AuthAPFS enabled.", buf, 0xCu);
        }
        *__error() = v109;
        v212[1032] = 1;
        v213 = *(_DWORD *)(v105 + 16);
        v214 = *(_DWORD *)(*(_QWORD *)(v105 + 8) + 32);
        v215 = *(_DWORD *)(v107 + 16);
        v216 = 4;
        v112 = *(_QWORD *)(*(_QWORD *)(v2 + 200) + 168);
        if (v112 && (*(_BYTE *)(v112 + 40) & 1) != 0)
        {
          v113 = *(const char **)(v2 + 56);
          v114 = *__error();
          v115 = *(NSObject **)(v2 + 72);
          if (os_log_type_enabled(v115, OS_LOG_TYPE_INFO))
          {
            v116 = "[anonymous]";
            if (v113)
              v116 = v113;
            *(_DWORD *)buf = 136446210;
            v218 = v116;
            _os_log_impl((void *)&_mh_execute_header, v115, OS_LOG_TYPE_INFO, "%{public}s: AuthAPFS using supplemental auth environment.", buf, 0xCu);
          }
          *__error() = v114;
          v216 = 5;
        }
      }
      else
      {
        v120 = *(const char **)(v2 + 56);
        v121 = *__error();
        v122 = *(NSObject **)(v2 + 72);
        if (os_log_type_enabled(v122, OS_LOG_TYPE_INFO))
        {
          v123 = "[anonymous]";
          if (v120)
            v123 = v120;
          *(_DWORD *)buf = 136446210;
          v218 = v123;
          _os_log_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_INFO, "%{public}s: AuthAPFS disabled because quire lacks an im4m.", buf, 0xCu);
        }
        *__error() = v121;
      }
    }
    v124 = realpath_np(v102, __s1);
    if (v124)
    {
      v125 = v124;
      v126 = *(void **)(v2 + 72);
      if (v126)
      {
        if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR))
          v127 = 3;
        else
          v127 = 2;
        v128 = *(const char **)(v2 + 56);
        if (!v128)
          v128 = "[anonymous]";
        *(_DWORD *)buf = 136446466;
        v218 = v128;
        v219 = 1024;
        LODWORD(v220) = v125;
        v129 = v126;
      }
      else
      {
        v136 = *(const char **)(v2 + 56);
        if (!v136)
          v136 = "[anonymous]";
        *(_DWORD *)buf = 136446466;
        v218 = v136;
        v219 = 1024;
        LODWORD(v220) = v124;
        v129 = &_os_log_default;
        v127 = 2;
      }
      v137 = (char *)_os_log_send_and_compose_impl(v127, 0, 0, 0, &_mh_execute_header, v129, 16);
      v138 = v125;
      v139 = "com.apple.security.cryptex.posix";
      v140 = 238;
    }
    else
    {
      v130 = sub_100024F10(&v186, 0, (uint64_t)&v211);
      if (!v130)
      {
        v145 = sub_10003AA70(&v211.st_mode);
        v187 = v145;
        v188 = open(__s1, 1048832);
        if ((v188 & 0x80000000) == 0)
        {
          *(_DWORD *)(v2 + 404) = sub_10003AA70(&v187);
          *(_DWORD *)(v2 + 400) = sub_10003AA70(&v188);
          if (_dispatch_is_multithreaded())
          {
            while (1)
            {
              v146 = strdup(__s1);
              if (v146)
                break;
              __os_temporary_resource_shortage();
            }
          }
          else
          {
            v146 = strdup(__s1);
            if (!v146)
              sub_100040954();
          }
          *(_QWORD *)(v2 + 416) = v146;
          if (_dispatch_is_multithreaded())
          {
            while (1)
            {
              v171 = strdup(v212);
              if (v171)
                break;
              __os_temporary_resource_shortage();
            }
          }
          else
          {
            v171 = strdup(v212);
            if (!v171)
              sub_100040954();
          }
          *(_QWORD *)(v2 + 432) = v171;
          if (_dispatch_is_multithreaded())
          {
            v172 = strdup((const char *)&v211.st_rdev);
            if (!v172)
            {
              do
              {
                __os_temporary_resource_shortage();
                v173 = strdup((const char *)&v211.st_rdev);
              }
              while (!v173);
              v172 = v173;
            }
          }
          else
          {
            v172 = strdup((const char *)&v211.st_rdev);
            if (!v172)
              sub_100040954();
          }
          v50 = 0;
          v149 = 0;
          *(_QWORD *)(v2 + 424) = v172;
          v145 = v187;
          goto LABEL_234;
        }
        v164 = *__error();
        v165 = *(void **)(v2 + 72);
        if (v165)
        {
          v166 = os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
          v167 = *(const char **)(v2 + 56);
          if (v166)
            v168 = 3;
          else
            v168 = 2;
          *(_DWORD *)buf = 136446722;
          if (v167)
            v169 = v167;
          else
            v169 = "[anonymous]";
          v218 = v169;
          v219 = 2080;
          v220 = __s1;
          v221 = 1024;
          v222 = v164;
          v170 = v165;
        }
        else
        {
          v174 = "[anonymous]";
          if (*(_QWORD *)(v2 + 56))
            v174 = *(const char **)(v2 + 56);
          *(_DWORD *)buf = 136446722;
          v218 = v174;
          v219 = 2080;
          v220 = __s1;
          v221 = 1024;
          v222 = v164;
          v170 = &_os_log_default;
          v168 = 2;
        }
        v175 = (char *)_os_log_send_and_compose_impl(v168, 0, 0, 0, &_mh_execute_header, v170, 16);
        v50 = sub_10000A6F8("_quire_mount_hdi", "quire.c", 255, "com.apple.security.cryptex.posix", v164, 0, v175);
        free(v175);
        v176 = unmount(__s1, 0x80000);
        if (v176)
        {
          v177 = v176;
          v178 = *(const char **)(v2 + 56);
          v185 = *__error();
          v179 = *(NSObject **)(v2 + 72);
          if (os_log_type_enabled(v179, OS_LOG_TYPE_ERROR))
          {
            v180 = "[anonymous]";
            *(_DWORD *)buf = 136446722;
            if (v178)
              v180 = v178;
            v218 = v180;
            v219 = 2080;
            v220 = __s1;
            v221 = 1024;
            v222 = v177;
            _os_log_impl((void *)&_mh_execute_header, v179, OS_LOG_TYPE_ERROR, "%{public}s: failed to clean up mount point: %s: %{darwin.errno}d", buf, 0x1Cu);
          }
          *__error() = v185;
        }
        if ((v145 & 0x80000000) == 0 && ioctl(v145, 0x20006415uLL, 0, 28))
        {
          v181 = *(const char **)(v2 + 56);
          v182 = *__error();
          v183 = *(NSObject **)(v2 + 72);
          if (os_log_type_enabled(v183, OS_LOG_TYPE_ERROR))
          {
            if (!v181)
              v181 = "[anonymous]";
            v184 = *__error();
            *(_DWORD *)buf = 136446722;
            v218 = v181;
            v219 = 2080;
            v220 = v212;
            v221 = 1024;
            v222 = v184;
            _os_log_impl((void *)&_mh_execute_header, v183, OS_LOG_TYPE_ERROR, "%{public}s: failed to clean up device: %s: %{darwin.errno}d", buf, 0x1Cu);
          }
          *__error() = v182;
        }
LABEL_231:
        if (v50)
          v149 = CFRetain(v50);
        else
          v149 = 0;
LABEL_234:
        *(_QWORD *)(v2 + 408) = v149;
        if (v145 != -1 && close(v145) == -1)
          sub_100040B38(&v189, buf);
        if (v188 != -1 && close(v188) == -1)
          sub_100040B38(__s1, &v211);
        if (v50)
        {
          v150 = *(void **)(v2 + 72);
          if (v150)
          {
            if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR))
              v151 = 3;
            else
              v151 = 2;
            v152 = *(const char **)(v2 + 56);
            if (!v152)
              v152 = "[anonymous]";
            v211.st_dev = 136446210;
            *(_QWORD *)&v211.st_mode = v152;
            v153 = v150;
          }
          else
          {
            v160 = *(const char **)(v2 + 56);
            if (!v160)
              v160 = "[anonymous]";
            v211.st_dev = 136446210;
            *(_QWORD *)&v211.st_mode = v160;
            v153 = &_os_log_default;
            v151 = 2;
          }
          v68 = (char *)_os_log_send_and_compose_impl(v151, 0, 0, 0, &_mh_execute_header, v153, 16);
          v69 = 621;
          goto LABEL_100;
        }
        v154 = sub_10001F148((void *)v2);
        if (!v154)
        {
          v45 = 0;
          goto LABEL_57;
        }
        v155 = v154;
        v156 = *(void **)(v2 + 72);
        if (v156)
        {
          if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR))
            v157 = 3;
          else
            v157 = 2;
          v158 = *(const char **)(v2 + 56);
          if (!v158)
            v158 = "[anonymous]";
          v211.st_dev = 136446466;
          *(_QWORD *)&v211.st_mode = v158;
          WORD2(v211.st_ino) = 1024;
          *(_DWORD *)((char *)&v211.st_ino + 6) = v155;
          v159 = v156;
        }
        else
        {
          v161 = *(const char **)(v2 + 56);
          if (!v161)
            v161 = "[anonymous]";
          v211.st_dev = 136446466;
          *(_QWORD *)&v211.st_mode = v161;
          WORD2(v211.st_ino) = 1024;
          *(_DWORD *)((char *)&v211.st_ino + 6) = v154;
          v159 = &_os_log_default;
          v157 = 2;
        }
        v41 = (char *)_os_log_send_and_compose_impl(v157, 0, 0, 0, &_mh_execute_header, v159, 16);
        v44 = v155;
        v42 = "com.apple.security.cryptex.posix";
        v43 = 627;
LABEL_56:
        v45 = sub_10000A6F8("_quire_mount_continue", "quire.c", v43, v42, v44, 0, v41);
        free(v41);
LABEL_57:
        a1[2] = (uint64_t)v45;
        goto LABEL_107;
      }
      v131 = v130;
      v132 = *(void **)(v2 + 72);
      if (v132)
      {
        if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR))
          v133 = 3;
        else
          v133 = 2;
        v134 = *(const char **)(v2 + 56);
        if (!v134)
          v134 = "[anonymous]";
        *(_DWORD *)buf = 136446466;
        v218 = v134;
        v219 = 1024;
        LODWORD(v220) = v131;
        v135 = v132;
      }
      else
      {
        v147 = *(const char **)(v2 + 56);
        if (!v147)
          v147 = "[anonymous]";
        *(_DWORD *)buf = 136446466;
        v218 = v147;
        v219 = 1024;
        LODWORD(v220) = v130;
        v135 = &_os_log_default;
        v133 = 2;
      }
      v137 = (char *)_os_log_send_and_compose_impl(v133, 0, 0, 0, &_mh_execute_header, v135, 16);
      v138 = v131;
      v139 = "com.apple.security.cryptex.posix";
      v140 = 244;
    }
LABEL_230:
    v50 = sub_10000A6F8("_quire_mount_hdi", "quire.c", v140, v139, v138, 0, v137);
    free(v137);
    v145 = -1;
    goto LABEL_231;
  }
  LODWORD(v189) = -1;
  v5 = v4 + 2311;
  memset(&v211, 0, sizeof(v211));
  *(_DWORD *)buf = open(v4 + 2311, 1048832);
  if ((*(_DWORD *)buf & 0x80000000) != 0)
  {
    v18 = *__error();
    v19 = *(void **)(v2 + 72);
    if (v19)
    {
      if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR))
        v20 = 3;
      else
        v20 = 2;
      v21 = *(const char **)(v2 + 56);
      *(_DWORD *)__s1 = 136446722;
      if (!v21)
        v21 = "[anonymous]";
      v206 = v21;
      v207 = 2080;
      v208 = v5;
      v209 = 1024;
      v210 = v18;
      v22 = v19;
    }
    else
    {
      v46 = *(const char **)(v2 + 56);
      if (!v46)
        v46 = "[anonymous]";
      *(_DWORD *)__s1 = 136446722;
      v206 = v46;
      v207 = 2080;
      v208 = v5;
      v209 = 1024;
      v210 = v18;
      v22 = &_os_log_default;
      v20 = 2;
    }
    v47 = (char *)_os_log_send_and_compose_impl(v20, 0, 0, 0, &_mh_execute_header, v22, 16);
    v48 = 134;
    v49 = v18;
  }
  else
  {
    v6 = v4 + 263;
    v7 = open(v4 + 263, 256);
    LODWORD(v189) = v7;
    if (v7 < 0)
    {
      v23 = *__error();
      v9 = v23;
      v24 = *(void **)(v2 + 72);
      if (v24)
      {
        if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR))
          v25 = 3;
        else
          v25 = 2;
        v26 = *(const char **)(v2 + 56);
        *(_DWORD *)__s1 = 136446722;
        if (!v26)
          v26 = "[anonymous]";
        v206 = v26;
        v207 = 2080;
        v208 = v6;
        v209 = 1024;
        v210 = v23;
        v27 = v24;
      }
      else
      {
        v55 = *(const char **)(v2 + 56);
        if (!v55)
          v55 = "[anonymous]";
        *(_DWORD *)__s1 = 136446722;
        v206 = v55;
        v207 = 2080;
        v208 = v6;
        v209 = 1024;
        v210 = v23;
        v27 = &_os_log_default;
        v25 = 2;
      }
      v53 = (char *)_os_log_send_and_compose_impl(v25, 0, 0, 0, &_mh_execute_header, v27, 16);
      v54 = 141;
      goto LABEL_71;
    }
    if (fstat(v7, &v211))
    {
      v8 = *__error();
      v9 = v8;
      v10 = *(void **)(v2 + 72);
      if (v10)
      {
        if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR))
          v11 = 3;
        else
          v11 = 2;
        v12 = *(const char **)(v2 + 56);
        *(_DWORD *)__s1 = 136446722;
        if (!v12)
          v12 = "[anonymous]";
        v206 = v12;
        v207 = 2080;
        v208 = v6;
        v209 = 1024;
        v210 = v8;
        v13 = v10;
      }
      else
      {
        v52 = *(const char **)(v2 + 56);
        if (!v52)
          v52 = "[anonymous]";
        *(_DWORD *)__s1 = 136446722;
        v206 = v52;
        v207 = 2080;
        v208 = v6;
        v209 = 1024;
        v210 = v8;
        v13 = &_os_log_default;
        v11 = 2;
      }
      v53 = (char *)_os_log_send_and_compose_impl(v11, 0, 0, 0, &_mh_execute_header, v13, 16);
      v54 = 148;
LABEL_71:
      v50 = sub_10000A6F8("_quire_mount_forerunner", "quire.c", v54, "com.apple.security.cryptex.posix", v9, 0, v53);
      v51 = v53;
      goto LABEL_72;
    }
    if ((v211.st_mode & 0xF000) == 0x6000)
    {
      *(_DWORD *)(v2 + 404) = sub_10003AA70(&v189);
      *(_DWORD *)(v2 + 400) = sub_10003AA70(buf);
      if (_dispatch_is_multithreaded())
      {
        while (1)
        {
          v39 = strdup(v4 + 2311);
          if (v39)
            break;
          __os_temporary_resource_shortage();
        }
      }
      else
      {
        v39 = strdup(v4 + 2311);
        if (!v39)
          sub_100040954();
      }
      *(_QWORD *)(v2 + 416) = v39;
      if (_dispatch_is_multithreaded())
      {
        while (1)
        {
          v91 = strdup(v4 + 1287);
          if (v91)
            break;
          __os_temporary_resource_shortage();
        }
      }
      else
      {
        v91 = strdup(v4 + 1287);
        if (!v91)
          sub_100040954();
      }
      *(_QWORD *)(v2 + 432) = v91;
      if (_dispatch_is_multithreaded())
      {
        while (1)
        {
          v92 = strdup(v4 + 263);
          if (v92)
            break;
          __os_temporary_resource_shortage();
        }
      }
      else
      {
        v92 = strdup(v4 + 263);
        if (!v92)
          sub_100040954();
      }
      v50 = 0;
      *(_QWORD *)(v2 + 424) = v92;
      *(_QWORD *)(v2 + 176) |= 1uLL;
      goto LABEL_73;
    }
    v81 = *(void **)(v2 + 72);
    if (v81)
    {
      v82 = os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
      v83 = *(const char **)(v2 + 56);
      if (v82)
        v84 = 3;
      else
        v84 = 2;
      *(_DWORD *)__s1 = 136446722;
      if (v83)
        v85 = v83;
      else
        v85 = "[anonymous]";
      v206 = v85;
      v207 = 2080;
      v208 = v4 + 263;
      v209 = 1024;
      v210 = 19;
      v86 = v81;
    }
    else
    {
      v93 = "[anonymous]";
      if (*(_QWORD *)(v2 + 56))
        v93 = *(const char **)(v2 + 56);
      *(_DWORD *)__s1 = 136446722;
      v206 = v93;
      v207 = 2080;
      v208 = v4 + 263;
      v209 = 1024;
      v210 = 19;
      v86 = &_os_log_default;
      v84 = 2;
    }
    v47 = (char *)_os_log_send_and_compose_impl(v84, 0, 0, 0, &_mh_execute_header, v86, 16);
    v48 = 155;
    v49 = 19;
  }
  v50 = sub_10000A6F8("_quire_mount_forerunner", "quire.c", v48, "com.apple.security.cryptex.posix", v49, 0, v47);
  v51 = v47;
LABEL_72:
  free(v51);
LABEL_73:
  free(*(void **)(v2 + 240));
  *(_QWORD *)(v2 + 240) = 0;
  if (v50)
    v56 = CFRetain(v50);
  else
    v56 = 0;
  *(_QWORD *)(v2 + 408) = v56;
  if ((_DWORD)v189 != -1 && close(v189) == -1)
    sub_100040B38(__s1, &v211);
  if (*(_DWORD *)buf != -1 && close(*(int *)buf) == -1)
    sub_100040B38(__s1, &v211);
  if (v50)
  {
    v57 = *(void **)(v2 + 72);
    if (v57)
    {
      if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR))
        v58 = 3;
      else
        v58 = 2;
      v59 = *(const char **)(v2 + 56);
      if (!v59)
        v59 = "[anonymous]";
      v211.st_dev = 136446210;
      *(_QWORD *)&v211.st_mode = v59;
      v60 = v57;
    }
    else
    {
      v67 = *(const char **)(v2 + 56);
      if (!v67)
        v67 = "[anonymous]";
      v211.st_dev = 136446210;
      *(_QWORD *)&v211.st_mode = v67;
      v60 = &_os_log_default;
      v58 = 2;
    }
    v68 = (char *)_os_log_send_and_compose_impl(v58, 0, 0, 0, &_mh_execute_header, v60, 16);
    v69 = 561;
LABEL_100:
    v70 = sub_10000A6F8("_quire_mount_continue", "quire.c", v69, "com.apple.security.cryptex", 2, v50, v68);
    free(v68);
    a1[2] = (uint64_t)v70;
    cryptex_target_async_f(v2, a1, sub_10003134C);
    CFRelease(v50);
    goto LABEL_108;
  }
  v61 = sub_10001F148((void *)v2);
  if (v61)
  {
    v62 = v61;
    v63 = *(void **)(v2 + 72);
    if (v63)
    {
      if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR))
        v64 = 3;
      else
        v64 = 2;
      v65 = *(const char **)(v2 + 56);
      if (!v65)
        v65 = "[anonymous]";
      v211.st_dev = 136446466;
      *(_QWORD *)&v211.st_mode = v65;
      WORD2(v211.st_ino) = 1024;
      *(_DWORD *)((char *)&v211.st_ino + 6) = v62;
      v66 = v63;
    }
    else
    {
      v72 = *(const char **)(v2 + 56);
      if (!v72)
        v72 = "[anonymous]";
      v211.st_dev = 136446466;
      *(_QWORD *)&v211.st_mode = v72;
      WORD2(v211.st_ino) = 1024;
      *(_DWORD *)((char *)&v211.st_ino + 6) = v61;
      v66 = &_os_log_default;
      v64 = 2;
    }
    v73 = (char *)_os_log_send_and_compose_impl(v64, 0, 0, 0, &_mh_execute_header, v66, 16);
    v71 = sub_10000A6F8("_quire_mount_continue", "quire.c", 567, "com.apple.security.cryptex.posix", v62, 0, v73);
    free(v73);
  }
  else
  {
    v71 = 0;
  }
  a1[2] = (uint64_t)v71;
LABEL_107:
  cryptex_target_async_f(v2, a1, sub_10003134C);
LABEL_108:
  result = v186;
  if (v186 != -1)
  {
    result = close(v186);
    if ((_DWORD)result == -1)
      sub_100040B38(__s1, &v211);
  }
  return result;
}

void sub_10002DEA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  _QWORD *v14;
  void *v15;
  const char *v16;
  char *v17;
  CFErrorRef v18;
  uint64_t v19;
  _OWORD v20[5];

  if ((~(_BYTE)a3 & 6) != 0)
  {
    v14 = sub_10003C89C((void *)a1, 0x50uLL);
    v14[7] = a4;
    v14[8] = a5;
    *((_DWORD *)v14 + 10) = a2;
    v15 = malloc_type_calloc(1uLL, 0x400uLL, 0x61D5536CuLL);
    if (!v15)
      sub_100040BC0(&v19, v20);
    v14[6] = v15;
    v14[9] = a3;
    if (realpath_np(a2, v15))
      sub_100040C68(&v19, v20);
    cryptex_async_f(a1, v14, sub_10002E110);
  }
  else
  {
    v7 = *(void **)(a1 + 72);
    if (v7)
    {
      if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR))
        v8 = 3;
      else
        v8 = 2;
      v9 = *(const char **)(a1 + 56);
      if (!v9)
        v9 = "[anonymous]";
      LODWORD(v20[0]) = 136446210;
      *(_QWORD *)((char *)v20 + 4) = v9;
      v10 = v7;
    }
    else
    {
      v16 = *(const char **)(a1 + 56);
      if (!v16)
        v16 = "[anonymous]";
      LODWORD(v20[0]) = 136446210;
      *(_QWORD *)((char *)v20 + 4) = v16;
      v10 = &_os_log_default;
      v8 = 2;
    }
    v17 = (char *)_os_log_send_and_compose_impl(v8, 0, 0, 0, &_mh_execute_header, v10, 16);
    v18 = sub_10000A6F8("quire_bootstrap", "quire.c", 2834, "com.apple.security.cryptex", 11, 0, v17);
    free(v17);
    if (v18)
    {
      MEMORY[0x10] = CFRetain(v18);
      cryptex_target_async_f(a1, 0, sub_10002F800);
      CFRelease(v18);
    }
  }
}

void sub_10002E110(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t info_asset;
  uint64_t v5;
  const char *v6;
  int v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  int v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  const __CFDictionary *v20;
  CFErrorRef v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  const char *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  int v35;
  NSObject *v36;
  const char *v37;
  const char *v38;
  int v39;
  NSObject *v40;
  const char *v41;
  int mounted_jetsam_properties;
  int v43;
  const char *v44;
  int v45;
  NSObject *v46;
  const char *v47;
  void *v48;
  uint64_t v49;
  const char *v50;
  void *v51;
  const char *v52;
  char *v53;
  int v54;
  CFIndex v55;
  const char *v56;
  int v57;
  NSObject *v58;
  const char *v59;
  const char *v60;
  int v61;
  NSObject *v62;
  const char *v63;
  void *v64;
  const char *v65;
  int v66;
  NSObject *v67;
  const char *v68;
  int v69;
  const char *v70;
  int v71;
  NSObject *v72;
  const char *v73;
  const char *v74;
  const char *v75;
  char *v76;
  CFIndex v77;
  int v78;
  int v79;
  const char *v80;
  const char *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  const char *v86;
  void *v87;
  int v88;
  const char *v89;
  const char *v90;
  const char *v91;
  int v92;
  const char *v93;
  const char *v94;
  void *v95;
  uint64_t v96;
  const char *v97;
  void *v98;
  const char *v99;
  int v100;
  NSObject *v101;
  const char *v102;
  const void *v103;
  const char *v104;
  int v105;
  NSObject *v106;
  const char *v107;
  const char *v108;
  int v109;
  NSObject *v110;
  const char *v111;
  CFTypeRef v112;
  void *v113;
  uint64_t v114;
  const char *v115;
  void *v116;
  const char *v117;
  void *v118;
  uint64_t v119;
  const char *v120;
  void *v121;
  const char *v122;
  char *v123;
  void *v124;
  uint64_t v125;
  const char *v126;
  void *v127;
  const char *v128;
  CFErrorRef v129;
  CFErrorRef v130;
  const char *v131;
  char *v132;
  const __CFDictionary *v133;
  const char *v134;
  int v135;
  NSObject *v136;
  const char *v137;
  uint64_t v138;
  const char *v139;
  int v140;
  NSObject *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  void *object;
  void *v146;
  void *v147;
  _BYTE buf[72];
  uint8_t v149[4];
  const char *v150;

  v2 = *a1;
  v3 = a1[9];
  info_asset = cryptex_core_get_info_asset(*(_QWORD *)(*a1 + 200));
  if ((*(_BYTE *)(*(_QWORD *)(v2 + 200) + 40) & 1) != 0 || (*(_BYTE *)(v2 + 176) & 4) == 0)
    goto LABEL_3;
  v14 = info_asset;
  v15 = *(const char **)(v2 + 56);
  v16 = *__error();
  v17 = *(NSObject **)(v2 + 72);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v18 = "[anonymous]";
    if (v15)
      v18 = v15;
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%{public}s: locking signature digest", buf, 0xCu);
  }
  *__error() = v16;
  if (v14)
    v19 = *(unsigned int *)(v14 + 16);
  else
    v19 = 0xFFFFFFFFLL;
  v26 = cryptex_signature_lock(*(_QWORD *)(*(_QWORD *)(v2 + 200) + 160), v19);
  if (v26)
  {
    v21 = (CFErrorRef)v26;
    v27 = *(void **)(v2 + 72);
    if (v27)
    {
      if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR))
        v28 = 3;
      else
        v28 = 2;
      v29 = *(const char **)(v2 + 56);
      if (!v29)
        v29 = "[anonymous]";
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&buf[4] = v29;
      v30 = v27;
    }
    else
    {
      v52 = *(const char **)(v2 + 56);
      if (!v52)
        v52 = "[anonymous]";
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&buf[4] = v52;
      v30 = &_os_log_default;
      v28 = 2;
    }
    v53 = (char *)_os_log_send_and_compose_impl(v28, 0, 0, 0, &_mh_execute_header, v30, 16);
    v54 = 2250;
LABEL_71:
    v55 = 36;
    goto LABEL_221;
  }
  v31 = *(_QWORD *)(v2 + 200);
  if ((*(_BYTE *)(v31 + 40) & 1) == 0)
  {
    v32 = *(_QWORD *)(v31 + 168);
    if (!v32 || (*(_BYTE *)(v32 + 40) & 1) == 0)
    {
      v33 = v14 ? *(unsigned int *)(v14 + 16) : 0xFFFFFFFFLL;
      v83 = cryptex_signature_lock_with_sep(*(_QWORD *)(v31 + 160), v33);
      if (v83)
      {
        v21 = (CFErrorRef)v83;
        v84 = *(void **)(v2 + 72);
        if (v84)
        {
          if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR))
            v85 = 3;
          else
            v85 = 2;
          v86 = *(const char **)(v2 + 56);
          if (!v86)
            v86 = "[anonymous]";
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = v86;
          v87 = v84;
        }
        else
        {
          v91 = *(const char **)(v2 + 56);
          if (!v91)
            v91 = "[anonymous]";
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = v91;
          v87 = &_os_log_default;
          v85 = 2;
        }
        v53 = (char *)_os_log_send_and_compose_impl(v85, 0, 0, 0, &_mh_execute_header, v87, 16);
        v54 = 2260;
        goto LABEL_71;
      }
    }
  }
LABEL_3:
  if ((v3 & 2) == 0 && !*(_BYTE *)(v2 + 353))
  {
    v20 = sub_1000313C0(v2, a1);
    if (v20)
    {
      v21 = v20;
      if ((sub_10000A98C(v20, CFSTR("com.apple.security.cryptex.posix"), 36) & 1) != 0)
        goto LABEL_223;
      v22 = *(void **)(v2 + 72);
      if (v22)
      {
        if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR))
          v23 = 3;
        else
          v23 = 2;
        v24 = *(const char **)(v2 + 56);
        if (!v24)
          v24 = "[anonymous]";
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = v24;
        v25 = v22;
      }
      else
      {
        v82 = *(const char **)(v2 + 56);
        if (!v82)
          v82 = "[anonymous]";
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = v82;
        v25 = &_os_log_default;
        v23 = 2;
      }
      v53 = (char *)_os_log_send_and_compose_impl(v23, 0, 0, 0, &_mh_execute_header, v25, 16);
      v54 = 2276;
      v55 = 34;
LABEL_221:
      v129 = sub_10000A6F8("_quire_bootstrap_continue", "quire.c", v54, "com.apple.security.cryptex", v55, v21, v53);
      free(v53);
      if (v129)
      {
        a1[2] = (uint64_t)CFRetain(v129);
        cryptex_async_f(v2, a1, sub_100031A94);
        CFRelease(v21);
        v130 = v129;
LABEL_224:
        CFRelease(v130);
        return;
      }
LABEL_223:
      cryptex_async_f(v2, a1, sub_100031A94);
      v130 = v21;
      goto LABEL_224;
    }
  }
  if ((v3 & 4) != 0 || (*(_BYTE *)(v2 + 176) & 0x10) != 0)
    goto LABEL_229;
  v5 = *(_QWORD *)(v2 + 320);
  v6 = *(const char **)(v2 + 56);
  v7 = *__error();
  v8 = *(NSObject **)(v2 + 72);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = "[anonymous]";
    if (v6)
      v9 = v6;
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}s: bootstrap contents bitmap before consolidating: 0x%04llX", buf, 0x16u);
  }
  *__error() = v7;
  v10 = _cryptex_content_type_jetsam_properties[2];
  v11 = _cryptex_content_type_service[2] | v5 | v10;
  v12 = _cryptex_content_type_log_profile[2];
  v143 = v12;
  v144 = _cryptex_content_type_service[2];
  if (*(_DWORD *)(v2 + 188))
    v13 = v11 & ~(_cryptex_content_type_library[2] | _cryptex_content_type_executable[2] | _cryptex_content_type_factory[2] | v12);
  else
    v13 = v11 | v12;
  if (*(_BYTE *)(v2 + 353))
  {
    v34 = *(const char **)(v2 + 56);
    v35 = *__error();
    v36 = *(NSObject **)(v2 + 72);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = "[anonymous]";
      if (v34)
        v37 = v34;
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&buf[4] = v37;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%{public}s: No-code cryptex will not bootstrap any contents.", buf, 0xCu);
    }
    v13 = 0;
    *__error() = v35;
  }
  v38 = *(const char **)(v2 + 56);
  v39 = *__error();
  v40 = *(NSObject **)(v2 + 72);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    v41 = "[anonymous]";
    if (v38)
      v41 = v38;
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = v41;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v13;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "%{public}s: bootstrap contents bitmap after consolidating: 0x%04llX", buf, 0x16u);
  }
  *__error() = v39;
  *(_QWORD *)(v2 + 320) = v13;
  if ((v13 & v10) != 0)
  {
    if (!*(_QWORD *)(v2 + 416))
      sub_100040CE8(v149, buf);
    mounted_jetsam_properties = launch_load_mounted_jetsam_properties();
    if (mounted_jetsam_properties)
    {
      v43 = mounted_jetsam_properties;
      v44 = *(const char **)(v2 + 56);
      v45 = *__error();
      v46 = *(NSObject **)(v2 + 72);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        v47 = "[anonymous]";
        if (v44)
          v47 = v44;
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = v47;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v43;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%{public}s: failed to launch_load_mounted_jetsam_properties: %{darwin.errno}d", buf, 0x12u);
      }
      *__error() = v45;
      v48 = *(void **)(v2 + 72);
      if (v48)
      {
        if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR))
          v49 = 3;
        else
          v49 = 2;
        v50 = *(const char **)(v2 + 56);
        if (!v50)
          v50 = "[anonymous]";
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = v50;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v43;
        v51 = v48;
      }
      else
      {
        v75 = *(const char **)(v2 + 56);
        if (!v75)
          v75 = "[anonymous]";
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = v75;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v43;
        v51 = &_os_log_default;
        v49 = 2;
      }
      v76 = (char *)_os_log_send_and_compose_impl(v49, 0, 0, 0, &_mh_execute_header, v51, 16);
      v77 = v43;
      v78 = 2163;
      goto LABEL_199;
    }
    v13 = *(_QWORD *)(v2 + 320);
  }
  if ((_cryptex_content_type_library[2] & v13) != 0)
  {
    v146 = 0;
    v147 = 0;
    object = 0;
    *(_QWORD *)buf = &v147;
    *(_QWORD *)&buf[8] = &v146;
    *(_QWORD *)&buf[16] = &object;
    v147 = (void *)sub_100009C48((uint64_t)&unk_1000554D0, *(unsigned int *)(v2 + 400), 0);
    v146 = (void *)sub_100009C48((uint64_t)&unk_100055470, *(unsigned int *)(v2 + 400), 0);
    object = (void *)sub_100009C48((uint64_t)&unk_1000554A0, *(unsigned int *)(v2 + 400), 0);
    v56 = *(const char **)(v2 + 56);
    v57 = *__error();
    v58 = *(NSObject **)(v2 + 72);
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
    {
      v59 = "[anonymous]";
      if (v56)
        v59 = v56;
      *(_DWORD *)v149 = 136446210;
      v150 = v59;
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEBUG, "%{public}s: iterating libraries", v149, 0xCu);
    }
    *__error() = v57;
    sub_100031E4C(v2, (uint64_t)a1, (uint64_t)&unk_100056EA8, (uint64_t **)buf, 3, (void (*)(uint64_t, void *, uint64_t))sub_10003205C);
    sub_100031E4C(v2, (uint64_t)a1, (uint64_t)&unk_100056F08, (uint64_t **)buf, 3, (void (*)(uint64_t, void *, uint64_t))sub_10003205C);
    sub_100031E4C(v2, (uint64_t)a1, (uint64_t)&unk_100056F20, (uint64_t **)buf, 3, (void (*)(uint64_t, void *, uint64_t))sub_10003205C);
    if (object)
      os_release(object);
    if (v146)
      os_release(v146);
    if (v147)
      os_release(v147);
    v13 = *(_QWORD *)(v2 + 320);
  }
  if ((_cryptex_content_type_executable[2] & v13) != 0)
  {
    v146 = 0;
    v147 = 0;
    object = 0;
    *(_QWORD *)buf = &v147;
    *(_QWORD *)&buf[8] = &v146;
    *(_QWORD *)&buf[16] = &object;
    v147 = (void *)sub_100009C48((uint64_t)&unk_1000554D0, *(unsigned int *)(v2 + 400), 0);
    v146 = (void *)sub_100009C48((uint64_t)&unk_100055470, *(unsigned int *)(v2 + 400), 0);
    object = (void *)sub_100009C48((uint64_t)&unk_1000554A0, *(unsigned int *)(v2 + 400), 0);
    v60 = *(const char **)(v2 + 56);
    v61 = *__error();
    v62 = *(NSObject **)(v2 + 72);
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
    {
      v63 = "[anonymous]";
      if (v60)
        v63 = v60;
      *(_DWORD *)v149 = 136446210;
      v150 = v63;
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEBUG, "%{public}s: iterating binaries", v149, 0xCu);
    }
    *__error() = v61;
    sub_100031E4C(v2, (uint64_t)a1, (uint64_t)&unk_100056EC0, (uint64_t **)buf, 3, (void (*)(uint64_t, void *, uint64_t))sub_100032398);
    if (object)
      os_release(object);
    if (v146)
      os_release(v146);
    if (v147)
      os_release(v147);
    v13 = *(_QWORD *)(v2 + 320);
  }
  if ((_cryptex_content_type_factory[2] & v13) == 0)
  {
LABEL_156:
    if ((v13 & v143) != 0)
    {
      v146 = 0;
      v147 = 0;
      *(_QWORD *)buf = &v147;
      *(_QWORD *)&buf[8] = &v146;
      v147 = (void *)sub_100009C48((uint64_t)&unk_1000554D0, *(unsigned int *)(v2 + 400), 0);
      v146 = (void *)sub_100009C48((uint64_t)&unk_1000554A0, *(unsigned int *)(v2 + 400), 0);
      v99 = *(const char **)(v2 + 56);
      v100 = *__error();
      v101 = *(NSObject **)(v2 + 72);
      if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
      {
        v102 = "[anonymous]";
        if (v99)
          v102 = v99;
        *(_DWORD *)v149 = 136446210;
        v150 = v102;
        _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEBUG, "%{public}s: iterating log_profiles", v149, 0xCu);
      }
      *__error() = v100;
      sub_100031E4C(v2, (uint64_t)a1, (uint64_t)&unk_100056F38, (uint64_t **)buf, 2, (void (*)(uint64_t, void *, uint64_t))sub_100033EF0);
      if (v146)
        os_release(v146);
      if (v147)
        os_release(v147);
      v13 = *(_QWORD *)(v2 + 320);
    }
    if ((v13 & v144) == 0)
      goto LABEL_229;
    v146 = 0;
    v147 = 0;
    object = 0;
    *(_QWORD *)buf = &v147;
    *(_QWORD *)&buf[8] = &v146;
    *(_QWORD *)&buf[16] = &object;
    v147 = (void *)sub_100009C48((uint64_t)&unk_1000554D0, *(unsigned int *)(v2 + 400), 0);
    v146 = (void *)sub_100009C48((uint64_t)&unk_100055470, *(unsigned int *)(v2 + 400), 0);
    object = (void *)sub_100009C48((uint64_t)&unk_1000554A0, *(unsigned int *)(v2 + 400), 0);
    v103 = sub_100034248(v2, 1);
    if (v103)
      goto LABEL_181;
    v104 = *(const char **)(v2 + 56);
    v105 = *__error();
    v106 = *(NSObject **)(v2 + 72);
    if (os_log_type_enabled(v106, OS_LOG_TYPE_DEBUG))
    {
      v107 = "[anonymous]";
      if (v104)
        v107 = v104;
      *(_DWORD *)v149 = 136446210;
      v150 = v107;
      _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_DEBUG, "%{public}s: iterating launch agents", v149, 0xCu);
    }
    *__error() = v105;
    v103 = (const void *)sub_100009CA8((uint64_t)v147, (uint64_t)&unk_100056EF0, (uint64_t)a1, (void (*)(uint64_t, void *, uint64_t))sub_1000344F0, 0);
    if (v103)
      goto LABEL_179;
    v108 = *(const char **)(v2 + 56);
    v109 = *__error();
    v110 = *(NSObject **)(v2 + 72);
    if (os_log_type_enabled(v110, OS_LOG_TYPE_DEBUG))
    {
      v111 = "[anonymous]";
      if (v108)
        v111 = v108;
      *(_DWORD *)v149 = 136446210;
      v150 = v111;
      _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_DEBUG, "%{public}s: iterating services", v149, 0xCu);
    }
    *__error() = v109;
    v103 = (const void *)sub_100031E4C(v2, (uint64_t)a1, (uint64_t)&unk_100056ED8, (uint64_t **)buf, 3, (void (*)(uint64_t, void *, uint64_t))sub_1000349D8);
    if (v103 || (v103 = sub_100034248(v2, 0)) != 0)
    {
LABEL_179:
      v112 = sub_100034248(v2, 0);
      if (v112)
        CFRelease(v112);
    }
    else
    {
      v133 = sub_100034F88(v2);
      if (v133)
      {
        v103 = v133;
        if (!sub_10000A98C(v133, CFSTR("com.apple.security.cryptex"), 10))
          goto LABEL_181;
        v134 = *(const char **)(v2 + 56);
        v135 = *__error();
        v136 = *(NSObject **)(v2 + 72);
        if (os_log_type_enabled(v136, OS_LOG_TYPE_INFO))
        {
          v137 = "[anonymous]";
          if (v134)
            v137 = v134;
          *(_DWORD *)v149 = 136446210;
          v150 = v137;
          _os_log_impl((void *)&_mh_execute_header, v136, OS_LOG_TYPE_INFO, "%{public}s: Watchdog registration not supported on this device. Skipping.", v149, 0xCu);
        }
        *__error() = v135;
        CFRelease(v103);
      }
      v138 = v2 + 448;
      while (1)
      {
        v138 = *(_QWORD *)v138;
        if (!v138)
          break;
        if (*(_BYTE *)(v138 + 1160))
        {
          v139 = *(const char **)(v2 + 56);
          v140 = *__error();
          v141 = *(NSObject **)(v2 + 72);
          if (os_log_type_enabled(v141, OS_LOG_TYPE_DEBUG))
          {
            v142 = "[anonymous]";
            if (v139)
              v142 = v139;
            *(_DWORD *)v149 = 136446210;
            v150 = v142;
            _os_log_impl((void *)&_mh_execute_header, v141, OS_LOG_TYPE_DEBUG, "%{public}s: resetting remote devices for added remote services", v149, 0xCu);
          }
          *__error() = v140;
          sub_1000359B0(v2);
          break;
        }
      }
      v103 = 0;
    }
LABEL_181:
    if (object)
      os_release(object);
    if (v146)
      os_release(v146);
    if (v147)
      os_release(v147);
    if (v103)
    {
      v113 = *(void **)(v2 + 72);
      if (v113)
      {
        if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR))
          v114 = 3;
        else
          v114 = 2;
        v115 = *(const char **)(v2 + 56);
        if (!v115)
          v115 = "[anonymous]";
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = v115;
        v116 = v113;
      }
      else
      {
        v131 = *(const char **)(v2 + 56);
        if (!v131)
          v131 = "[anonymous]";
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = v131;
        v116 = &_os_log_default;
        v114 = 2;
      }
      v132 = (char *)_os_log_send_and_compose_impl(v114, 0, 0, 0, &_mh_execute_header, v116, 16);
      v21 = sub_10000A6F8("_quire_bootstrap_contents", "quire.c", 2201, "com.apple.security.cryptex", 14, v103, v132);
      free(v132);
      CFRelease(v103);
      if (v21)
        goto LABEL_210;
    }
    goto LABEL_229;
  }
  v64 = (void *)sub_100009C48((uint64_t)&unk_100055500, *(unsigned int *)(v2 + 400), 0);
  v65 = *(const char **)(v2 + 56);
  v66 = *__error();
  v67 = *(NSObject **)(v2 + 72);
  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
  {
    v68 = "[anonymous]";
    if (v65)
      v68 = v65;
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&buf[4] = v68;
    _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEBUG, "%{public}s: iterating factory content", buf, 0xCu);
  }
  *__error() = v66;
  sub_100009CA8((uint64_t)v64, (uint64_t)&unk_100056F50, (uint64_t)a1, (void (*)(uint64_t, void *, uint64_t))sub_10003272C, 1);
  v69 = *((_DWORD *)a1 + 2);
  if (v69)
  {
    v70 = *(const char **)(v2 + 56);
    v71 = *__error();
    v72 = *(NSObject **)(v2 + 72);
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
    {
      v73 = "[anonymous]";
      if (v70)
        v73 = v70;
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = v73;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v69;
      v74 = "%{public}s: failed to bootstrap diags: %{darwin.errno}d";
LABEL_143:
      _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_ERROR, v74, buf, 0x12u);
    }
  }
  else
  {
    sub_100009CA8((uint64_t)v64, (uint64_t)&unk_100056F68, (uint64_t)a1, (void (*)(uint64_t, void *, uint64_t))sub_100033444, 1);
    v79 = *((_DWORD *)a1 + 2);
    if (v79)
    {
      v80 = *(const char **)(v2 + 56);
      v71 = *__error();
      v72 = *(NSObject **)(v2 + 72);
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      {
        v81 = "[anonymous]";
        if (v80)
          v81 = v80;
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = v81;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v79;
        v74 = "%{public}s: failed to bootstrap luacore libraries: %{darwin.errno}d";
        goto LABEL_143;
      }
    }
    else
    {
      sub_100009CA8((uint64_t)v64, (uint64_t)&unk_100056F80, (uint64_t)a1, (void (*)(uint64_t, void *, uint64_t))sub_1000337FC, 1);
      v88 = *((_DWORD *)a1 + 2);
      if (v88)
      {
        v89 = *(const char **)(v2 + 56);
        v71 = *__error();
        v72 = *(NSObject **)(v2 + 72);
        if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
        {
          v90 = "[anonymous]";
          if (v89)
            v90 = v89;
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = v90;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v88;
          v74 = "%{public}s: failed to bootstrap python libraries: %{darwin.errno}d";
          goto LABEL_143;
        }
      }
      else
      {
        sub_100009CA8((uint64_t)v64, (uint64_t)&unk_100056F98, (uint64_t)a1, (void (*)(uint64_t, void *, uint64_t))sub_100033B38, 1);
        v92 = *((_DWORD *)a1 + 2);
        if (!v92)
          goto LABEL_145;
        v93 = *(const char **)(v2 + 56);
        v71 = *__error();
        v72 = *(NSObject **)(v2 + 72);
        if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
        {
          v94 = "[anonymous]";
          if (v93)
            v94 = v93;
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = v94;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v92;
          v74 = "%{public}s: failed to bootstrap astro content: %{darwin.errno}d";
          goto LABEL_143;
        }
      }
    }
  }
  *__error() = v71;
LABEL_145:
  if (v64)
    os_release(v64);
  v43 = *((_DWORD *)a1 + 2);
  if (!v43)
  {
    v13 = *(_QWORD *)(v2 + 320);
    goto LABEL_156;
  }
  v95 = *(void **)(v2 + 72);
  if (v95)
  {
    if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR))
      v96 = 3;
    else
      v96 = 2;
    v97 = *(const char **)(v2 + 56);
    if (!v97)
      v97 = "[anonymous]";
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = v97;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v43;
    v98 = v95;
  }
  else
  {
    v117 = *(const char **)(v2 + 56);
    if (!v117)
      v117 = "[anonymous]";
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = v117;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v43;
    v98 = &_os_log_default;
    v96 = 2;
  }
  v76 = (char *)_os_log_send_and_compose_impl(v96, 0, 0, 0, &_mh_execute_header, v98, 16);
  v78 = 2184;
  v77 = v43;
LABEL_199:
  sub_10000A6F8("_quire_bootstrap_contents", "quire.c", v78, "com.apple.security.cryptex.posix", v77, 0, v76);
  free(v76);
  v118 = *(void **)(v2 + 72);
  if (v118)
  {
    if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR))
      v119 = 3;
    else
      v119 = 2;
    v120 = *(const char **)(v2 + 56);
    if (!v120)
      v120 = "[anonymous]";
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = v120;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v43;
    v121 = v118;
  }
  else
  {
    v122 = *(const char **)(v2 + 56);
    if (!v122)
      v122 = "[anonymous]";
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = v122;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v43;
    v121 = &_os_log_default;
    v119 = 2;
  }
  v123 = (char *)_os_log_send_and_compose_impl(v119, 0, 0, 0, &_mh_execute_header, v121, 16);
  v21 = sub_10000A6F8("_quire_bootstrap_contents", "quire.c", 2220, "com.apple.security.cryptex.posix", v43, 0, v123);
  free(v123);
  if (v21)
  {
LABEL_210:
    v124 = *(void **)(v2 + 72);
    if (v124)
    {
      if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR))
        v125 = 3;
      else
        v125 = 2;
      v126 = *(const char **)(v2 + 56);
      if (!v126)
        v126 = "[anonymous]";
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&buf[4] = v126;
      v127 = v124;
    }
    else
    {
      v128 = *(const char **)(v2 + 56);
      if (!v128)
        v128 = "[anonymous]";
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&buf[4] = v128;
      v127 = &_os_log_default;
      v125 = 2;
    }
    v53 = (char *)_os_log_send_and_compose_impl(v125, 0, 0, 0, &_mh_execute_header, v127, 16);
    v54 = 2299;
    v55 = 14;
    goto LABEL_221;
  }
LABEL_229:
  cryptex_async_f(v2, a1, sub_100031A94);
}

void sub_10002F800(void **a1)
{
  const void *v2;

  v2 = a1[2];
  ((void (*)(void *, _QWORD, void *, void *))a1[8])(*a1, 0, a1[2], a1[7]);
  free(a1[6]);
  sub_10003C998(a1);
  if (v2)
    CFRelease(v2);
}

uint64_t sub_10002F858(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v10;
  void *v11;
  uint64_t v13;
  _OWORD v14[5];

  v10 = sub_10003C89C(a1, 0x50uLL);
  v10[7] = a4;
  v10[8] = a5;
  *((_DWORD *)v10 + 10) = a2;
  v11 = malloc_type_calloc(1uLL, 0x400uLL, 0x61D5536CuLL);
  if (!v11)
    sub_100040BC0(&v13, v14);
  v10[6] = v11;
  v10[9] = a3;
  if (realpath_np(a2, v11))
    sub_100040C68(&v13, v14);
  return cryptex_async_f(a1, v10, sub_10002F938);
}

void sub_10002F938(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char *v13;
  int v14;
  CFIndex v15;
  CFErrorRef v16;

  v2 = *a1;
  v3 = *(_QWORD *)(*a1 + 176);
  if ((v3 & 0x10) != 0 && (a1[9] & 1) == 0)
  {
    v4 = *(void **)(v2 + 72);
    if (v4)
    {
      if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR))
        v5 = 3;
      else
        v5 = 2;
      v6 = v4;
    }
    else
    {
      v6 = &_os_log_default;
      v5 = 2;
    }
    v13 = (char *)_os_log_send_and_compose_impl(v5, 0, 0, 0, &_mh_execute_header, v6, 16);
    v14 = 2328;
LABEL_27:
    v15 = 4;
    goto LABEL_28;
  }
  if (*(_QWORD *)(v2 + 480))
  {
    v7 = *(void **)(v2 + 72);
    if (v7)
    {
      if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR))
        v8 = 3;
      else
        v8 = 2;
      v9 = v7;
    }
    else
    {
      v9 = &_os_log_default;
      v8 = 2;
    }
    v13 = (char *)_os_log_send_and_compose_impl(v8, 0, 0, 0, &_mh_execute_header, v9, 16);
    v14 = 2337;
    goto LABEL_27;
  }
  if ((v3 & 2) != 0)
  {
    sub_100036288((_QWORD *)*a1);
    if (*(_QWORD *)(v2 + 448))
      sub_100035BB4(v2);
    sub_100035EB4(v2);
    *(_QWORD *)(v2 + 176) &= ~2uLL;
    goto LABEL_30;
  }
  v10 = *(void **)(v2 + 72);
  if (v10)
  {
    if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR))
      v11 = 3;
    else
      v11 = 2;
    v12 = v10;
  }
  else
  {
    v12 = &_os_log_default;
    v11 = 2;
  }
  v13 = (char *)_os_log_send_and_compose_impl(v11, 0, 0, 0, &_mh_execute_header, v12, 16);
  v14 = 2347;
  v15 = 18;
LABEL_28:
  v16 = sub_10000A6F8("_quire_unbootstrap_continue", "quire.c", v14, "com.apple.security.cryptex", v15, 0, v13);
  free(v13);
  if (v16)
  {
    a1[2] = (uint64_t)CFRetain(v16);
    cryptex_target_async_f(v2, a1, sub_10002F800);
    CFRelease(v16);
    return;
  }
LABEL_30:
  a1[2] = 0;
  cryptex_target_async_f(v2, a1, sub_10002F800);
}

_QWORD *sub_10002FD44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *result;

  result = sub_10003C89C((void *)a1, 0x50uLL);
  result[4] = a2;
  *((_DWORD *)result + 11) = -1;
  result[7] = a3;
  result[8] = a4;
  if (!*(_DWORD *)(a1 + 184))
    return (_QWORD *)cryptex_async_f(a1, result, sub_10002FDC8);
  result[3] = 0;
  **(_QWORD **)(a1 + 384) = result;
  *(_QWORD *)(a1 + 384) = result + 3;
  return result;
}

void sub_10002FDC8(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  int v5;
  NSObject *v6;
  const char *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  const char *v23;
  int v24;
  NSObject *v25;
  const char *v26;
  void *v27;
  uint64_t v28;
  const char *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  const char *v33;
  void *v34;
  const char *v35;
  int v36;
  NSObject *v37;
  const char *v38;
  const char *v39;
  char *v40;
  CFIndex v41;
  int v42;
  const char *v43;
  CFErrorRef v44;
  BOOL v45;
  _DWORD *v46;
  _DWORD *v47;
  unint64_t v48;
  _BOOL4 v49;
  char v50;
  int v51;
  int v52;
  const char *v53;
  int v54;
  NSObject *v55;
  const char *v56;
  BOOL v57;
  const char *v58;
  int v59;
  NSObject *v60;
  const char *v61;
  const char *v62;
  const char *v63;
  int v64;
  NSObject *v65;
  int v66;
  uint64_t v67;
  const char *v68;
  int v69;
  NSObject *v70;
  const char *v71;
  unint64_t v72;
  int v73;
  int v74;
  const char *v75;
  int v76;
  NSObject *v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  int v81;
  NSObject *v82;
  const char *v83;
  const char *v84;
  int v85;
  NSObject *v86;
  const char *v87;
  void *v88;
  uint64_t v89;
  const char *v90;
  void *v91;
  const char *v92;
  int v93;
  NSObject *v94;
  const char *v95;
  unsigned int v96;
  signed int v97;
  void *v98;
  uint64_t v99;
  const char *v100;
  void *v101;
  const char *v102;
  const char *v103;
  int v104;
  NSObject *v105;
  const char *v106;
  const char *v107;
  char v108;
  _QWORD *v109;
  int *v110;
  uint8_t v111[4];
  const char *v112;
  __int16 v113;
  uint8_t *v114;
  __int16 v115;
  uint8_t *v116;
  uint8_t buf[4];
  const char *v118;
  __int16 v119;
  int v120;

  v1 = a1;
  v2 = a1[4];
  v3 = *a1;
  v4 = *(const char **)(*a1 + 56);
  v5 = *__error();
  v6 = *(NSObject **)(v3 + 72);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = "[anonymous]";
    if (v4)
      v7 = v4;
    *(_DWORD *)buf = 136446210;
    v118 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}s: _quire_unmount_continue called.", buf, 0xCu);
  }
  *__error() = v5;
  v110 = (int *)(v3 + 400);
  if ((*(_DWORD *)(v3 + 400) & 0x80000000) != 0)
  {
    v31 = *(void **)(v3 + 72);
    if (v31)
    {
      if (os_log_type_enabled(*(os_log_t *)(v3 + 72), OS_LOG_TYPE_ERROR))
        v32 = 3;
      else
        v32 = 2;
      v33 = *(const char **)(v3 + 56);
      if (!v33)
        v33 = "[anonymous]";
      *(_DWORD *)buf = 136446466;
      v118 = v33;
      v119 = 1024;
      v120 = 6;
      v34 = v31;
    }
    else
    {
      v43 = *(const char **)(v3 + 56);
      if (!v43)
        v43 = "[anonymous]";
      *(_DWORD *)buf = 136446466;
      v118 = v43;
      v119 = 1024;
      v120 = 6;
      v34 = &_os_log_default;
      v32 = 2;
    }
    v40 = (char *)_os_log_send_and_compose_impl(v32, 0, 0, 0, &_mh_execute_header, v34, 16);
    v42 = 722;
    v41 = 6;
  }
  else
  {
    if (*(_QWORD *)(v3 + 480))
      sub_100040D70(v111, buf);
    v8 = *(_QWORD **)(v3 + 472);
    if (v8)
    {
      v9 = (_QWORD *)(v3 + 472);
      do
      {
        v10 = (_QWORD *)*v9;
        v11 = (_QWORD *)(v3 + 472);
        if ((_QWORD *)*v9 != v8)
        {
          do
          {
            v12 = v10;
            v10 = (_QWORD *)v10[1];
          }
          while (v10 != v8);
          v11 = v12 + 1;
        }
        v14 = (_QWORD *)*v8;
        v13 = (_QWORD *)v8[1];
        *v11 = v13;
        v8[1] = -1;
        v15 = (_QWORD *)v14[60];
        if (v15)
        {
          v16 = v14 + 60;
          v17 = (_QWORD *)v14[60];
          while (*v17 != v3)
          {
            v17 = (_QWORD *)v17[1];
            if (!v17)
            {
              if (!v14)
                goto LABEL_18;
              goto LABEL_17;
            }
          }
          if (v15 != v17)
          {
            do
            {
              v18 = v15;
              v15 = (_QWORD *)v15[1];
            }
            while (v15 != v17);
            v16 = v18 + 1;
            v15 = v17;
          }
          *v16 = v15[1];
          v17[1] = -1;
          os_release((void *)v3);
          free(v17);
          if (v14)
            goto LABEL_17;
        }
        else
        {
LABEL_17:
          os_release(v14);
        }
LABEL_18:
        free(v8);
        v8 = v13;
      }
      while (v13);
    }
    sub_100036288((_QWORD *)v3);
    v19 = v1[4];
    v20 = *(unsigned int *)(v3 + 400);
    bzero(buf, 0x400uLL);
    v21 = realpath_np(v20, buf);
    if (v21)
    {
      v22 = v21;
      v23 = *(const char **)(v3 + 56);
      v24 = *__error();
      v25 = *(NSObject **)(v3 + 72);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = "[anonymous]";
        if (v23)
          v26 = v23;
        *(_DWORD *)v111 = 136446466;
        v112 = v26;
        v113 = 1024;
        LODWORD(v114) = v22;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%{public}s: could not resolve mount point for unmount: %{darwin.errno}d", v111, 0x12u);
      }
      *__error() = v24;
      goto LABEL_31;
    }
    close_drop_np(v110, 0);
    v35 = *(const char **)(v3 + 56);
    v36 = *__error();
    v37 = *(NSObject **)(v3 + 72);
    v108 = v2;
    v109 = v1;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      v38 = "[anonymous]";
      if (v35)
        v38 = v35;
      *(_DWORD *)v111 = 136446466;
      v112 = v38;
      v113 = 2080;
      v114 = buf;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "%{public}s: unmounting: %s", v111, 0x16u);
    }
    v48 = 0;
    *__error() = v36;
    while (1)
    {
      v49 = v48 != 0;
      v50 = v19 & v49;
      if ((v19 & v49) != 0)
        v51 = 0x80000;
      else
        v51 = 0;
      if ((unmount((const char *)buf, v51) & 0x80000000) == 0)
        *__error() = 0;
      v52 = *__error();
      if (v52 != 16)
        break;
      v22 = *__error();
      v53 = *(const char **)(v3 + 56);
      v54 = *__error();
      v55 = *(NSObject **)(v3 + 72);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v111 = 136446722;
        v56 = "[anonymous]";
        if (v53)
          v56 = v53;
        v112 = v56;
        v113 = 2048;
        v114 = (uint8_t *)v48;
        v115 = 2080;
        v116 = buf;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "%{public}s: mount busy [%lu]: %s", v111, 0x20u);
      }
      *__error() = v54;
      usleep(0x3E8u);
      if (v22 == 16)
      {
        v57 = v48++ >= 4;
        if (!v57)
          continue;
      }
      goto LABEL_97;
    }
    if (v52)
    {
      v22 = *__error();
      v63 = *(const char **)(v3 + 56);
      v64 = *__error();
      v65 = *(NSObject **)(v3 + 72);
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        if (!v63)
          v63 = "[anonymous]";
        v66 = *__error();
        *(_DWORD *)v111 = 136446466;
        v112 = v63;
        v113 = 1024;
        LODWORD(v114) = v66;
        _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "%{public}s: unmount: %{darwin.errno}d", v111, 0x12u);
      }
      *__error() = v64;
LABEL_97:
      LOBYTE(v2) = v108;
      if (v22)
      {
        *v110 = open((const char *)buf, 1048832);
LABEL_31:
        v27 = *(void **)(v3 + 72);
        if (v27)
        {
          if (os_log_type_enabled(*(os_log_t *)(v3 + 72), OS_LOG_TYPE_ERROR))
            v28 = 3;
          else
            v28 = 2;
          v29 = *(const char **)(v3 + 56);
          if (!v29)
            v29 = "[anonymous]";
          *(_DWORD *)buf = 136446466;
          v118 = v29;
          v119 = 1024;
          v120 = v22;
          v30 = v27;
        }
        else
        {
          v39 = *(const char **)(v3 + 56);
          if (!v39)
            v39 = "[anonymous]";
          *(_DWORD *)buf = 136446466;
          v118 = v39;
          v119 = 1024;
          v120 = v22;
          v30 = &_os_log_default;
          v28 = 2;
        }
        v40 = (char *)_os_log_send_and_compose_impl(v28, 0, 0, 0, &_mh_execute_header, v30, 16);
        v41 = v22;
        v42 = 733;
        goto LABEL_57;
      }
    }
    else
    {
      v58 = *(const char **)(v3 + 56);
      v59 = *__error();
      v60 = *(NSObject **)(v3 + 72);
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
      {
        v61 = "";
        v62 = "[anonymous]";
        if (v58)
          v62 = v58;
        if ((v50 & 1) != 0)
          v61 = "force ";
        *(_DWORD *)v111 = 136446466;
        v112 = v62;
        v113 = 2080;
        v114 = (uint8_t *)v61;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEBUG, "%{public}s: %sunmount succeeded", v111, 0x16u);
      }
      *__error() = v59;
    }
    v67 = *(unsigned int *)(v3 + 404);
    if (os_log_type_enabled(*(os_log_t *)(v3 + 72), OS_LOG_TYPE_DEBUG))
    {
      bzero(buf, 0x400uLL);
      if (!realpath_np(v67, buf))
      {
        v68 = *(const char **)(v3 + 56);
        v69 = *__error();
        v70 = *(NSObject **)(v3 + 72);
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v111 = 136446722;
          v71 = "[anonymous]";
          if (v68)
            v71 = v68;
          v112 = v71;
          v113 = 2080;
          v114 = buf;
          v115 = 1024;
          LODWORD(v116) = v67;
          _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEBUG, "%{public}s: detaching: path = %s, fd = %d", v111, 0x1Cu);
        }
        *__error() = v69;
      }
    }
    v72 = 0;
    while (1)
    {
      if ((ioctl(v67, 0x20006415uLL, 0) & 0x80000000) == 0)
        *__error() = 0;
      v73 = *__error();
      if (v73 != 16)
        break;
      v74 = *__error();
      v75 = *(const char **)(v3 + 56);
      v76 = *__error();
      v77 = *(NSObject **)(v3 + 72);
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        v78 = "[anonymous]";
        if (v75)
          v78 = v75;
        *(_DWORD *)buf = 136446210;
        v118 = v78;
        _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "%{public}s: device busy", buf, 0xCu);
      }
      *__error() = v76;
      usleep(0x3E8u);
      v79 = 0;
      if (v74 == 16)
      {
        v57 = v72++ >= 4;
        if (!v57)
          continue;
      }
      goto LABEL_124;
    }
    if (v73)
    {
      v74 = *__error();
      v92 = *(const char **)(v3 + 56);
      v93 = *__error();
      v94 = *(NSObject **)(v3 + 72);
      if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
      {
        v95 = "[anonymous]";
        if (v92)
          v95 = v92;
        *(_DWORD *)buf = 136446466;
        v118 = v95;
        v119 = 1024;
        v120 = v74;
        _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_ERROR, "%{public}s: ioctl: DKIOCEJECT: %{darwin.errno}d", buf, 0x12u);
      }
      *__error() = v93;
      LOBYTE(v2) = v108;
      v1 = v109;
      if (v74)
        goto LABEL_131;
    }
    else
    {
      v80 = *(const char **)(v3 + 56);
      v81 = *__error();
      v82 = *(NSObject **)(v3 + 72);
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
      {
        v83 = "[anonymous]";
        if (v80)
          v83 = v80;
        *(_DWORD *)buf = 136446210;
        v118 = v83;
        _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEBUG, "%{public}s: detach succeeded", buf, 0xCu);
      }
      v74 = 0;
      *__error() = v81;
      v79 = v3 + 404;
LABEL_124:
      v84 = *(const char **)(v3 + 56);
      v85 = *__error();
      v86 = *(NSObject **)(v3 + 72);
      if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG))
      {
        v87 = "[anonymous]";
        if (v84)
          v87 = v84;
        *(_DWORD *)buf = 136446210;
        v118 = v87;
        _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEBUG, "%{public}s: Finished quire detach.", buf, 0xCu);
      }
      *__error() = v85;
      LOBYTE(v2) = v108;
      v1 = v109;
      if (v79)
        close_drop_np(v3 + 404, 0);
      if (v74)
      {
LABEL_131:
        v88 = *(void **)(v3 + 72);
        if (v88)
        {
          if (os_log_type_enabled(*(os_log_t *)(v3 + 72), OS_LOG_TYPE_ERROR))
            v89 = 3;
          else
            v89 = 2;
          v90 = *(const char **)(v3 + 56);
          if (!v90)
            v90 = "[anonymous]";
          *(_DWORD *)buf = 136446466;
          v118 = v90;
          v119 = 1024;
          v120 = v74;
          v91 = v88;
        }
        else
        {
          v102 = *(const char **)(v3 + 56);
          if (!v102)
            v102 = "[anonymous]";
          *(_DWORD *)buf = 136446466;
          v118 = v102;
          v119 = 1024;
          v120 = v74;
          v91 = &_os_log_default;
          v89 = 2;
        }
        v40 = (char *)_os_log_send_and_compose_impl(v89, 0, 0, 0, &_mh_execute_header, v91, 16);
        v41 = v74;
        v42 = 739;
        goto LABEL_57;
      }
    }
    v96 = sub_10001F18C((void *)v3);
    if (!v96)
    {
      sub_10002B4F8(v3);
      v103 = *(const char **)(v3 + 56);
      v104 = *__error();
      v105 = *(NSObject **)(v3 + 72);
      if (os_log_type_enabled(v105, OS_LOG_TYPE_DEBUG))
      {
        v106 = "[anonymous]";
        if (v103)
          v106 = v103;
        *(_DWORD *)buf = 136446210;
        v118 = v106;
        _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_DEBUG, "%{public}s: Finished quire unmount.", buf, 0xCu);
      }
      *__error() = v104;
      goto LABEL_62;
    }
    v97 = v96;
    v98 = *(void **)(v3 + 72);
    if (v98)
    {
      if (os_log_type_enabled(*(os_log_t *)(v3 + 72), OS_LOG_TYPE_ERROR))
        v99 = 3;
      else
        v99 = 2;
      v100 = *(const char **)(v3 + 56);
      if (!v100)
        v100 = "[anonymous]";
      *(_DWORD *)buf = 136446466;
      v118 = v100;
      v119 = 1024;
      v120 = v97;
      v101 = v98;
    }
    else
    {
      v107 = *(const char **)(v3 + 56);
      if (!v107)
        v107 = "[anonymous]";
      *(_DWORD *)buf = 136446466;
      v118 = v107;
      v119 = 1024;
      v120 = v96;
      v101 = &_os_log_default;
      v99 = 2;
    }
    v40 = (char *)_os_log_send_and_compose_impl(v99, 0, 0, 0, &_mh_execute_header, v101, 16);
    v41 = v97;
    v42 = 745;
  }
LABEL_57:
  v44 = sub_10000A6F8("_quire_unmount_continue", "quire.c", v42, "com.apple.security.cryptex.posix", v41, 0, v40);
  free(v40);
  if (v44)
    v45 = (v2 & 2) == 0;
  else
    v45 = 0;
  if (v45)
  {
    if ((*(_DWORD *)(v3 + 404) & 0x80000000) != 0)
    {
      v47 = 0;
    }
    else
    {
      v46 = malloc_type_calloc(1uLL, 0x10uLL, 0x61D5536CuLL);
      if (!v46)
        sub_100040A90();
      v47 = v46;
      v46[3] = sub_10003AA70((_DWORD *)(v3 + 404));
      v47[2] = sub_10003AA70(v110);
    }
    v1[6] = v47;
  }
  else if (!v44)
  {
LABEL_62:
    v1[2] = 0;
    cryptex_target_async_f(v3, v1, sub_10003134C);
    return;
  }
  v1[2] = CFRetain(v44);
  cryptex_target_async_f(v3, v1, sub_10003134C);
  CFRelease(v44);
}

uint64_t sub_100030BE4(void *a1, int a2, void *a3)
{
  _QWORD *v6;
  uint64_t v7;

  v6 = sub_10003C89C(a1, 0x28uLL);
  *((_DWORD *)v6 + 6) = a2;
  v6[4] = a3;
  xpc_retain(a3);
  cryptex_sync_f(a1, v6, sub_100030C50);
  v7 = v6[2];
  sub_10003C998((void **)v6);
  return v7;
}

void sub_100030C50(uint64_t a1)
{
  uint64_t v2;
  const char *v3;
  int v4;
  NSObject *v5;
  const char *v6;
  int v7;
  uint64_t *v8;
  uint64_t *v9;
  _QWORD *v10;
  _QWORD *v11;
  int v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  CFErrorRef v19;
  CFErrorRef v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  int v24;
  void *v25;
  const char *v26;
  int v27;
  char *v28;
  CFErrorRef v29;
  uint64_t v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  _QWORD *v34;
  __int16 v35;
  int v36;

  v2 = *(_QWORD *)a1;
  v3 = *(const char **)(*(_QWORD *)a1 + 56);
  v4 = *__error();
  v5 = *(NSObject **)(v2 + 72);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = "[anonymous]";
    v7 = *(_DWORD *)(a1 + 24);
    if (v3)
      v6 = v3;
    *(_DWORD *)buf = 136446466;
    v32 = v6;
    v33 = 1024;
    LODWORD(v34) = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%{public}s: Launching Launch Agent quires for target user of: %u.", buf, 0x12u);
  }
  *__error() = v4;
  v8 = *(uint64_t **)(v2 + 456);
  if (v8)
  {
    while (1)
    {
      v9 = (uint64_t *)*v8;
      v10 = malloc_type_calloc(1uLL, 0x510uLL, 0x61D5536CuLL);
      if (!v10)
        sub_100040DF0(&v30, buf);
      v11 = v10;
      v12 = *(_DWORD *)(a1 + 24);
      *((_DWORD *)v10 + 322) = v12;
      v13 = *(_OWORD *)(v8 + 11);
      v14 = *(_OWORD *)(v8 + 9);
      v15 = v8[15];
      *((_OWORD *)v10 + 79) = *(_OWORD *)(v8 + 13);
      v16 = *(_OWORD *)(v8 + 1);
      v17 = *(_OWORD *)(v8 + 3);
      v18 = *(_OWORD *)(v8 + 5);
      *((_OWORD *)v10 + 76) = *(_OWORD *)(v8 + 7);
      *((_OWORD *)v10 + 75) = v18;
      *((_OWORD *)v10 + 74) = v17;
      *((_OWORD *)v10 + 73) = v16;
      v10[160] = v15;
      *((_OWORD *)v10 + 77) = v14;
      *((_OWORD *)v10 + 78) = v13;
      *((_DWORD *)v10 + 316) = v12;
      v10[160] = *(_QWORD *)(a1 + 32);
      v19 = sub_100012760(v8 + 16, v10 + 146, (uint64_t)(v10 + 1), *(_QWORD *)(v2 + 368));
      if (v19)
        break;
      *v11 = *(_QWORD *)(v2 + 464);
      *(_QWORD *)(v2 + 464) = v11;
      sub_100035A08(v2);
      v8 = v9;
      if (!v9)
        goto LABEL_9;
    }
    v20 = v19;
    v21 = *(void **)(v2 + 72);
    if (v21)
    {
      if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR))
        v22 = 3;
      else
        v22 = 2;
      v23 = *(const char **)(v2 + 56);
      v24 = *(_DWORD *)(a1 + 24);
      *(_DWORD *)buf = 136446722;
      if (!v23)
        v23 = "[anonymous]";
      v32 = v23;
      v33 = 2080;
      v34 = v11 + 1;
      v35 = 1024;
      v36 = v24;
      v25 = v21;
    }
    else
    {
      v26 = *(const char **)(v2 + 56);
      if (!v26)
        v26 = "[anonymous]";
      v27 = *(_DWORD *)(a1 + 24);
      *(_DWORD *)buf = 136446722;
      v32 = v26;
      v33 = 2080;
      v34 = v11 + 1;
      v35 = 1024;
      v36 = v27;
      v25 = &_os_log_default;
      v22 = 2;
    }
    v28 = (char *)_os_log_send_and_compose_impl(v22, 0, 0, 0, &_mh_execute_header, v25, 16);
    v29 = sub_10000A6F8("_quire_attach_launch_agents", "quire.c", 937, "com.apple.security.cryptex", 21, v20, v28);
    free(v28);
    free(v11);
    *(_QWORD *)(a1 + 16) = v29;
    CFRelease(v20);
  }
  else
  {
LABEL_9:
    *(_QWORD *)(a1 + 16) = 0;
  }
}

uint64_t sub_100030F60(void *a1, int a2)
{
  _QWORD *v4;

  v4 = sub_10003C89C(a1, 0x28uLL);
  *((_DWORD *)v4 + 6) = a2;
  return cryptex_async_f(a1, v4, sub_100030F9C);
}

void sub_100030F9C(void **a1)
{
  _QWORD *v2;
  const char *v3;
  int v4;
  NSObject *v5;
  const char *v6;
  char *v7;
  char *v8;
  const char *v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;

  v2 = *a1;
  if (*((_DWORD *)*a1 + 47))
  {
    v3 = (const char *)v2[7];
    v4 = *__error();
    v5 = v2[9];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = "[anonymous]";
      if (v3)
        v6 = v3;
      *(_DWORD *)buf = 136446210;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%{public}s: Attempted to remove a Launch Agent that wasn't installed in a system cryptex.", buf, 0xCu);
    }
    *__error() = v4;
  }
  else
  {
    v7 = (char *)v2[58];
    if (v7)
    {
      do
      {
        v8 = *(char **)v7;
        if (*((_DWORD *)v7 + 322) == *((_DWORD *)a1 + 6))
        {
          v9 = (const char *)v2[7];
          v10 = *__error();
          v11 = v2[9];
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            v12 = v2[52];
            v13 = "[anonymous]";
            if (v9)
              v13 = v9;
            *(_DWORD *)buf = 136446466;
            v15 = v13;
            v16 = 2080;
            v17 = v12;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%{public}s: Found a Launch Agent: %s - going to deactivate it.", buf, 0x16u);
          }
          *__error() = v10;
          sub_100036470(v7, v2);
        }
        v7 = v8;
      }
      while (v8);
    }
  }
  sub_10003C998(a1);
}

xpc_object_t sub_10003114C(uint64_t a1, int a2, xpc_object_t object, uint64_t a4)
{
  xpc_object_t result;

  *(_DWORD *)(a1 + 188) = a2;
  *(_QWORD *)(a1 + 192) = object;
  result = xpc_retain(object);
  *(_QWORD *)(a1 + 368) = a4;
  return result;
}

uint64_t sub_100031180(uint64_t a1)
{
  return *(unsigned int *)(a1 + 188);
}

uint64_t sub_100031188(uint64_t a1)
{
  return *(_QWORD *)(a1 + 416);
}

const char *sub_100031190(uint64_t a1)
{
  return xpc_string_get_string_ptr(*(xpc_object_t *)(a1 + 328));
}

uint64_t sub_100031198(uint64_t a1)
{
  return *(_QWORD *)(a1 + 344);
}

uint64_t sub_1000311A0(uint64_t a1)
{
  return *(_QWORD *)(a1 + 336);
}

uint64_t sub_1000311A8(uint64_t a1)
{
  return *(_QWORD *)(a1 + 208);
}

uint64_t sub_1000311B0(uint64_t a1)
{
  return *(_QWORD *)(a1 + 224);
}

uint64_t sub_1000311B8(uint64_t a1)
{
  return a1 + 208;
}

uint64_t sub_1000311C0(uint64_t a1, int a2, xpc_object_t xstring)
{
  const char *string_ptr;
  const char **v5;
  const char *v6;
  int v7;
  NSObject *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  int v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;

  string_ptr = xpc_string_get_string_ptr(xstring);
  v5 = (const char **)cryptex_content_type_parse();
  v6 = *(const char **)(*(_QWORD *)(a1 + 32) + 16);
  v7 = *__error();
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = "[anonymous]";
      v10 = *v5;
      if (v6)
        v9 = v6;
      v13 = 136446466;
      v14 = v9;
      v15 = 2080;
      v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}s: populated content type to bootstrap: %s", (uint8_t *)&v13, 0x16u);
    }
    *__error() = v7;
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 112) |= (unint64_t)v5[2];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v11 = "[anonymous]";
      v13 = 136446722;
      if (v6)
        v11 = v6;
      v14 = v11;
      v15 = 2080;
      v16 = string_ptr;
      v17 = 1024;
      v18 = 22;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}s: invalid content type %s: %{darwin.errno}d", (uint8_t *)&v13, 0x1Cu);
    }
    *__error() = v7;
  }
  return 1;
}

void sub_10003134C(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  const void *v4;
  BOOL v5;
  void *v6;

  v2 = *(void **)a1;
  v3 = *(_QWORD *)(a1 + 56);
  v6 = *(void **)(a1 + 48);
  v4 = *(const void **)(a1 + 16);
  (*(void (**)(void *, void **, const void *, uint64_t))(a1 + 64))(v2, &v6, v4, v3);
  if (*(_QWORD *)(a1 + 48))
    v5 = v6 == 0;
  else
    v5 = 1;
  if (!v5)
    sub_100040E98();
  free(v6);
  sub_10003C998((void **)a1);
  if (v4)
    CFRelease(v4);
}

CFErrorRef sub_1000313C0(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  const char *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  uint64_t tc_asset;
  uint64_t asset;
  const __CFDictionary *v12;
  const __CFDictionary *v13;
  const char *v14;
  int v15;
  NSObject *v16;
  const char *v17;
  int v18;
  const char *v19;
  int v20;
  NSObject *v21;
  const char *v22;
  const char *v23;
  NSObject *v24;
  os_log_type_t v25;
  const char *v26;
  CFErrorRef v27;
  void *v28;
  uint64_t v29;
  const char *v30;
  void *v31;
  const char *v32;
  NSObject *v33;
  uint64_t v34;
  const char *v35;
  int v36;
  NSObject *v37;
  const char *v38;
  int v39;
  int v40;
  const char *v41;
  int v42;
  NSObject *v43;
  const char *v44;
  const char *v45;
  char *v46;
  const char *v47;
  int v48;
  NSObject *v49;
  const char *v50;
  char *v51;
  uint64_t v53;
  _QWORD v54[6];
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  int v58;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 200) + 40);
  v5 = *(const char **)(a1 + 56);
  v6 = *__error();
  v7 = *(NSObject **)(a1 + 72);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if ((v4 & 1) != 0)
  {
    if (v8)
    {
      v26 = "[anonymous]";
      if (v5)
        v26 = v5;
      *(_DWORD *)buf = 136446210;
      v56 = v26;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%{public}s: Running in debug mode, skip trust cache", buf, 0xCu);
    }
    v27 = 0;
    *__error() = v6;
  }
  else
  {
    if (v8)
    {
      v9 = "[anonymous]";
      if (v5)
        v9 = v5;
      *(_DWORD *)buf = 136446210;
      v56 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%{public}s: loading trust cache", buf, 0xCu);
    }
    *__error() = v6;
    tc_asset = cryptex_core_get_tc_asset(*(_QWORD *)(a1 + 200));
    asset = cryptex_core_get_asset(*(_QWORD *)(a1 + 200), &_cryptex_asset_type_im4m);
    v12 = sub_10002AAB8(*(_DWORD *)(tc_asset + 16), *(_DWORD *)(asset + 16), *(NSObject **)(a1 + 72));
    if (v12)
    {
      v13 = v12;
      if (!sub_10000A98C(v12, CFSTR("com.apple.security.cryptex.posix"), 6))
      {
        v28 = *(void **)(a1 + 72);
        if (v28)
        {
          if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR))
            v29 = 3;
          else
            v29 = 2;
          v30 = *(const char **)(a1 + 56);
          if (!v30)
            v30 = "[anonymous]";
          *(_DWORD *)buf = 136446210;
          v56 = v30;
          v31 = v28;
        }
        else
        {
          v45 = *(const char **)(a1 + 56);
          if (!v45)
            v45 = "[anonymous]";
          *(_DWORD *)buf = 136446210;
          v56 = v45;
          v31 = &_os_log_default;
          v29 = 2;
        }
        v46 = (char *)_os_log_send_and_compose_impl(v29, 0, 0, 0, &_mh_execute_header, v31, 16);
        v27 = sub_10000A6F8("_quire_bootstrap_load_trust_cache", "quire.c", 1864, "com.apple.security.cryptex", 34, v13, v46);
        free(v46);
        goto LABEL_61;
      }
      v14 = *(const char **)(a1 + 56);
      v15 = *__error();
      v16 = *(NSObject **)(a1 + 72);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = "[anonymous]";
        if (v14)
          v17 = v14;
        *(_DWORD *)buf = 136446210;
        v56 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}s: failed to load trust cache: device is locked", buf, 0xCu);
      }
      *__error() = v15;
      v18 = MKBDeviceUnlockedSinceBoot();
      v19 = *(const char **)(a1 + 56);
      v20 = *__error();
      v21 = *(NSObject **)(a1 + 72);
      if (v18 < 0)
      {
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          goto LABEL_35;
        v32 = "[anonymous]";
        if (v19)
          v32 = v19;
        *(_DWORD *)buf = 136446466;
        v56 = v32;
        v57 = 1024;
        v58 = v18;
        v23 = "%{public}s: failed to get initial lock state: error = %d";
        v24 = v21;
        v25 = OS_LOG_TYPE_ERROR;
      }
      else
      {
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          goto LABEL_35;
        v22 = "[anonymous]";
        if (v19)
          v22 = v19;
        *(_DWORD *)buf = 136446466;
        v56 = v22;
        v57 = 1024;
        v58 = v18;
        v23 = "%{public}s: initial unlock state: %d";
        v24 = v21;
        v25 = OS_LOG_TYPE_DEBUG;
      }
      _os_log_impl((void *)&_mh_execute_header, v24, v25, v23, buf, 0x12u);
LABEL_35:
      *__error() = v20;
      v33 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_data_add, 0, 0, *(dispatch_queue_t *)(a1 + 24));
      dispatch_set_context(v33, a2);
      dispatch_source_set_event_handler_f(v33, (dispatch_function_t)sub_100031BF0);
      a2[4] = os_retain(v33);
      v34 = *(_QWORD *)(a1 + 24);
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 0x40000000;
      v54[2] = sub_100031D54;
      v54[3] = &unk_100057158;
      v54[4] = a1;
      v54[5] = v33;
      a2[3] = MKBEventsRegister(v34, v54);
      if (!v18 && MKBDeviceUnlockedSinceBoot() == 1)
      {
        v35 = *(const char **)(a1 + 56);
        v36 = *__error();
        v37 = *(NSObject **)(a1 + 72);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          v38 = "[anonymous]";
          if (v35)
            v38 = v35;
          *(_DWORD *)buf = 136446210;
          v56 = v38;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "%{public}s: first unlock during race window; firing source",
            buf,
            0xCu);
        }
        *__error() = v36;
        dispatch_source_merge_data(v33, 1uLL);
      }
      v39 = MKBGetDeviceLockState(0);
      if ((v39 - 1) >= 3)
      {
        v40 = v39;
        if (v39)
        {
          if (v39 >= 1)
            sub_100040EB0(&v53, buf);
          v47 = *(const char **)(a1 + 56);
          v48 = *__error();
          v49 = *(NSObject **)(a1 + 72);
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            v50 = "[anonymous]";
            if (v47)
              v50 = v47;
            *(_DWORD *)buf = 136446466;
            v56 = v50;
            v57 = 1024;
            v58 = v40;
            _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "%{public}s: failed to get lock state to de-bounce keybag event race: error = %d", buf, 0x12u);
          }
          *__error() = v48;
        }
        else
        {
          v41 = *(const char **)(a1 + 56);
          v42 = *__error();
          v43 = *(NSObject **)(a1 + 72);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          {
            v44 = "[anonymous]";
            if (v41)
              v44 = v41;
            *(_DWORD *)buf = 136446210;
            v56 = v44;
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "%{public}s: device unlocked during race window; firing source",
              buf,
              0xCu);
          }
          *__error() = v42;
          dispatch_source_merge_data(v33, 1uLL);
        }
      }
      dispatch_activate(v33);
      *(_DWORD *)buf = 67109120;
      LODWORD(v56) = 36;
      v51 = (char *)_os_log_send_and_compose_impl(2, 0, 0, 0, &_mh_execute_header, &_os_log_default, 16);
      v27 = sub_10000A6F8("_quire_handle_device_lock", "quire.c", 1809, "com.apple.security.cryptex.posix", 36, 0, v51);
      free(v51);
      if (v33)
        os_release(v33);
LABEL_61:
      CFRelease(v13);
      return v27;
    }
    return 0;
  }
  return v27;
}

uint64_t sub_100031A94(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  const char *v9;
  int v11;
  const char *v12;

  v2 = *a1;
  v3 = a1[2];
  v4 = *(const char **)(*a1 + 56);
  v5 = *__error();
  v6 = *(NSObject **)(v2 + 72);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v7)
    {
      v8 = "[anonymous]";
      if (v4)
        v8 = v4;
      v11 = 136446210;
      v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}s: unwinding after bootstrap failure", (uint8_t *)&v11, 0xCu);
    }
    *__error() = v5;
    sub_100035BB4(v2);
    sub_100035EB4(v2);
  }
  else
  {
    if (v7)
    {
      v9 = "[anonymous]";
      if (v4)
        v9 = v4;
      v11 = 136446210;
      v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}s: quire bootstrap succeeded", (uint8_t *)&v11, 0xCu);
    }
    *__error() = v5;
    *(_QWORD *)(v2 + 176) |= 2uLL;
  }
  return cryptex_target_async_f(v2, a1, sub_10002F800);
}

void sub_100031BF0(_QWORD *a1)
{
  uint64_t v2;
  NSObject *v3;
  const char *v4;
  int v5;
  NSObject *v6;
  const char *v7;
  const __CFDictionary *v8;
  const __CFDictionary *v9;
  int v10;
  const char *v11;

  v2 = *a1;
  v3 = a1[4];
  v4 = *(const char **)(*a1 + 56);
  v5 = *__error();
  v6 = *(NSObject **)(v2 + 72);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = "[anonymous]";
    if (v4)
      v7 = v4;
    v10 = 136446210;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}s: lock state source fired", (uint8_t *)&v10, 0xCu);
  }
  *__error() = v5;
  v8 = (const __CFDictionary *)sub_1000313C0(v2, a1);
  v9 = v8;
  if (v8)
  {
    if ((sub_10000A98C(v8, CFSTR("com.apple.security.cryptex.posix"), 36) & 1) != 0)
      goto LABEL_10;
    a1[2] = CFRetain(v9);
    v8 = (const __CFDictionary *)CFRetain(v9);
  }
  else
  {
    a1[2] = 0;
  }
  *(_QWORD *)(v2 + 408) = v8;
  cryptex_async_f(v2, a1, sub_100031A94);
LABEL_10:
  dispatch_source_cancel(v3);
  a1[4] = 0;
  MKBEventsUnregister(a1[3]);
  a1[3] = 0;
  if (v3)
    os_release(v3);
  if (v9)
    CFRelease(v9);
}

void sub_100031D54(uint64_t a1, unsigned int a2)
{
  const char *v4;
  int v5;
  NSObject *v6;
  const char *v7;
  int v8;
  const char *v9;
  __int16 v10;
  unsigned int v11;

  v4 = *(const char **)(*(_QWORD *)(a1 + 32) + 56);
  v5 = *__error();
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 72);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = "[anonymous]";
    if (v4)
      v7 = v4;
    v8 = 136446466;
    v9 = v7;
    v10 = 1024;
    v11 = a2;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}s: keybag event; firing source: event = %#x",
      (uint8_t *)&v8,
      0x12u);
  }
  *__error() = v5;
  if (a2 <= 1)
    dispatch_source_merge_data(*(dispatch_source_t *)(a1 + 40), 1uLL);
}

uint64_t sub_100031E4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t **a4, uint64_t a5, void (*a6)(uint64_t, void *, uint64_t))
{
  uint64_t v7;
  uint64_t v10;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, uint64_t);
  void *v17;
  const char *v18;
  int v19;
  NSObject *v20;
  const char *v21;
  uint64_t result;
  const char *v23;
  int v24;
  NSObject *v25;
  const char *v26;
  uint8_t buf[4];
  const char *v29;

  if (a5 >= 1)
  {
    v7 = a5;
    v10 = a2;
    v12 = &unk_100055470;
    do
    {
      v13 = **a4;
      v14 = *(void **)(v13 + 48);
      if (v14 == v12)
      {
        if ((os_variant_has_internal_content("com.apple.security.cryptexd") & 1) == 0)
        {
          v15 = a3;
          v16 = a6;
          v17 = v12;
          v18 = *(const char **)(a1 + 56);
          v19 = *__error();
          v20 = *(NSObject **)(a1 + 72);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v21 = "[anonymous]";
            if (v18)
              v21 = v18;
            *(_DWORD *)buf = 136446210;
            v29 = v21;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}s: trying to bootstrap internal content on non internal system", buf, 0xCu);
          }
          *__error() = v19;
          v12 = v17;
          a6 = v16;
          a3 = v15;
          v10 = a2;
        }
        v14 = *(void **)(v13 + 48);
      }
      if (v14 == &unk_1000554A0 && *(_DWORD *)(a1 + 188))
      {
        v23 = *(const char **)(a1 + 56);
        v24 = *__error();
        v25 = *(NSObject **)(a1 + 72);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          v26 = "[anonymous]";
          if (v23)
            v26 = v23;
          *(_DWORD *)buf = 136446210;
          v29 = v26;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%{public}s: not bootstrapping platform content for session", buf, 0xCu);
        }
        *__error() = v24;
      }
      else
      {
        result = sub_100009CA8(v13, a3, v10, a6, 0);
        if (result)
          return result;
      }
      ++a4;
      --v7;
    }
    while (v7);
  }
  return 0;
}

CFErrorRef sub_10003205C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;
  int v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char *v16;
  CFIndex v17;
  int v18;
  CFErrorRef v19;
  _BYTE v21[1024];

  v5 = *a3;
  bzero(v21, 0x400uLL);
  v6 = realpath_np(*(unsigned int *)(a2 + 80), v21);
  if (v6)
  {
    v7 = v6;
    v8 = *(void **)(v5 + 72);
    if (v8)
    {
      if (os_log_type_enabled(*(os_log_t *)(v5 + 72), OS_LOG_TYPE_ERROR))
        v9 = 3;
      else
        v9 = 2;
      v10 = v8;
    }
    else
    {
      v10 = &_os_log_default;
      v9 = 2;
    }
    v16 = (char *)_os_log_send_and_compose_impl(v9, 0, 0, 0, &_mh_execute_header, v10, 16);
    v17 = v7;
    v18 = 1423;
LABEL_18:
    v19 = sub_10000A6F8("_quire_bootstrap_library", "quire.c", v18, "com.apple.security.cryptex.posix", v17, 0, v16);
    free(v16);
    return v19;
  }
  v11 = sub_100006A54((uint64_t)v21, *((unsigned int *)a3 + 10), *(const char **)(a2 + 72), 6);
  if (v11)
  {
    v12 = v11;
    v13 = *(void **)(v5 + 72);
    if (v13)
    {
      if (os_log_type_enabled(*(os_log_t *)(v5 + 72), OS_LOG_TYPE_ERROR))
        v14 = 3;
      else
        v14 = 2;
      v15 = v13;
    }
    else
    {
      v15 = &_os_log_default;
      v14 = 2;
    }
    v16 = (char *)_os_log_send_and_compose_impl(v14, 0, 0, 0, &_mh_execute_header, v15, 16);
    v17 = v12;
    v18 = 1432;
    goto LABEL_18;
  }
  return 0;
}

CFErrorRef sub_100032398(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  unsigned int v9;
  signed int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  CFErrorRef v14;
  char *v15;
  unsigned int v16;
  signed int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  char *v21;

  v5 = *a3;
  v6 = _cryptex_content_type_factory[2] & *(_QWORD *)(*a3 + 320);
  v7 = *(void **)(a1 + 48);
  v8 = v7 == &unk_100055470 || v7 == &unk_1000554A0;
  if (v8
    && (v9 = sub_10000F318(*(_QWORD *)(v5 + 208), a3[6], *(_QWORD *)(a2 + 72), (uint64_t)"/", v6 != 0)) != 0)
  {
    v10 = v9;
    v11 = *(void **)(v5 + 72);
    if (v11)
    {
      if (os_log_type_enabled(*(os_log_t *)(v5 + 72), OS_LOG_TYPE_ERROR))
        v12 = 3;
      else
        v12 = 2;
      v13 = v11;
    }
    else
    {
      v13 = &_os_log_default;
      v12 = 2;
    }
    v15 = (char *)_os_log_send_and_compose_impl(v12, 0, 0, 0, &_mh_execute_header, v13, 16);
    v14 = sub_10000A6F8("_quire_bootstrap_binary", "quire.c", 1519, "com.apple.security.cryptex.posix", v10, 0, v15);
    free(v15);
  }
  else
  {
    v14 = 0;
  }
  v16 = sub_10000F318(*(_QWORD *)(v5 + 208), a3[6], *(_QWORD *)(a2 + 72), a3[6], v6 != 0);
  if (v16)
  {
    v17 = v16;
    v18 = *(void **)(v5 + 72);
    if (v18)
    {
      if (os_log_type_enabled(*(os_log_t *)(v5 + 72), OS_LOG_TYPE_ERROR))
        v19 = 3;
      else
        v19 = 2;
      v20 = v18;
    }
    else
    {
      v20 = &_os_log_default;
      v19 = 2;
    }
    v21 = (char *)_os_log_send_and_compose_impl(v19, 0, 0, 0, &_mh_execute_header, v20, 16);
    v14 = sub_10000A6F8("_quire_bootstrap_binary", "quire.c", 1527, "com.apple.security.cryptex.posix", v17, 0, v21);
    free(v21);
  }
  return v14;
}

CFErrorRef sub_10003272C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4;
  const char *v5;
  int v6;
  NSObject *v7;
  const char *v8;
  int v9;
  const char *v10;
  int v11;
  NSObject *v12;
  const char *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  int v17;
  CFErrorRef v18;
  int v19;
  const char *v20;
  int v21;
  NSObject *v22;
  const char *v23;
  const char *v24;
  int v25;
  const char *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  int v30;
  const char *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  NSObject *v35;
  uint32_t v36;
  void *v37;
  uint64_t v38;
  const char *v39;
  void *v40;
  const char *v41;
  char *v42;
  const char *v44;
  const char *v45;
  int v46;
  const char *v47;
  NSObject *v48;
  const char *v49;
  const char *v50;
  int v51;
  NSObject *v52;
  const char *v53;
  const char *v54;
  NSObject *v55;
  const char *v56;
  const char *v57;
  int v58;
  NSObject *v59;
  const char *v60;
  const char *v61;
  const char *v62;
  const char *v63;
  const char *v64;
  const char *v65;
  NSObject *v66;
  const char *v67;
  const char *v68;
  NSObject *v69;
  uint32_t v70;
  const char *v71;
  NSObject *v72;
  const char *v73;
  const char *v74;
  const char *v75;
  unsigned __int16 v76;
  char *__s1;
  int v78;
  uint64_t v79;
  char __str[1024];
  char to[1024];
  char from[1024];
  char v83[1024];
  char v84[256];
  char v85[264];
  statfs v86;
  int buf;
  const char *v88;
  __int16 v89;
  char *v90;
  __int16 v91;
  char *v92;
  __int16 v93;
  int v94;

  v4 = *a3;
  bzero(&v86, 0x878uLL);
  v78 = 0;
  memset(v85, 0, 255);
  memset(v84, 0, 255);
  bzero(v83, 0x400uLL);
  bzero(from, 0x400uLL);
  bzero(to, 0x400uLL);
  bzero(__str, 0x400uLL);
  __s1 = 0;
  v76 = 0;
  v5 = *(const char **)(v4 + 56);
  v6 = *__error();
  v7 = *(NSObject **)(v4 + 72);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = "[anonymous]";
    if (v5)
      v8 = v5;
    buf = 136446210;
    v88 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%{public}s: bootstrapping diags", (uint8_t *)&buf, 0xCu);
  }
  *__error() = v6;
  if (statfs("/", &v86))
  {
    v9 = *__error();
    v10 = *(const char **)(v4 + 56);
    v11 = *__error();
    v12 = *(NSObject **)(v4 + 72);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_12:
      v17 = -1;
      goto LABEL_13;
    }
    v13 = "[anonymous]";
    if (v10)
      v13 = v10;
    buf = 136446466;
    v88 = v13;
    v89 = 1024;
    LODWORD(v90) = v9;
    v14 = "%{public}s: failed to statfs root path: %{darwin.errno}d";
    goto LABEL_10;
  }
  sscanf(v86.f_mntfromname, "/dev/disk%d", &v78);
  snprintf(v85, 0xFFuLL, "disk%d", v78);
  if (sub_10000E3C8((uint64_t)v85, 640))
  {
    v19 = sub_10000E874(640, &__s1, *(NSObject **)(v4 + 72));
    if (v19)
    {
      v9 = v19;
      v20 = *(const char **)(v4 + 56);
      v21 = *__error();
      v22 = *(NSObject **)(v4 + 72);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = "[anonymous]";
        if (v20)
          v23 = v20;
        buf = 136446466;
        v88 = v23;
        v89 = 1024;
        LODWORD(v90) = v9;
        v24 = "%{public}s: failed to copy diags volume formatter: %{darwin.errno}d";
LABEL_43:
        v35 = v22;
        v36 = 18;
LABEL_44:
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, v24, (uint8_t *)&buf, v36);
        goto LABEL_45;
      }
      goto LABEL_45;
    }
    if (!strstr(__s1, "cryptexd"))
    {
      v33 = *(const char **)(v4 + 56);
      v21 = *__error();
      v22 = *(NSObject **)(v4 + 72);
      v9 = 17;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v34 = "[anonymous]";
        if (v33)
          v34 = v33;
        buf = 136446466;
        v88 = v34;
        v89 = 1024;
        LODWORD(v90) = 17;
        v24 = "%{public}s: diags volume already exists but not formatted by us: %{darwin.errno}d";
        goto LABEL_43;
      }
      goto LABEL_45;
    }
    if (access("/System/Volumes/Diags/AppleInternal/Diags", 1)
      || (snprintf(__str, 0x400uLL, "%s/.%s", "/System/Volumes/Diags/AppleInternal/Diags", *(const char **)(v4 + 208)),
          access(__str, 0)))
    {
      v28 = *(const char **)(v4 + 56);
      v21 = *__error();
      v22 = *(NSObject **)(v4 + 72);
      v9 = 17;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v29 = "[anonymous]";
        if (v28)
          v29 = v28;
        buf = 136446466;
        v88 = v29;
        v89 = 1024;
        LODWORD(v90) = 17;
        v24 = "%{public}s: diags volume already created by another cryptex install. please uninstall it first: %{darwin.errno}d";
        goto LABEL_43;
      }
LABEL_45:
      *__error() = v21;
      v17 = -1;
      goto LABEL_46;
    }
    v50 = *(const char **)(v4 + 56);
    v51 = *__error();
    v52 = *(NSObject **)(v4 + 72);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
    {
      v53 = "[anonymous]";
      if (v50)
        v53 = v50;
      buf = 136446210;
      v88 = v53;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEBUG, "%{public}s: diags volume already created", (uint8_t *)&buf, 0xCu);
    }
    *__error() = v51;
    *(_QWORD *)(v4 + 176) |= 0x20uLL;
    if (unlink("/AppleInternal/Diags") && *__error() != 2)
    {
      v9 = *__error();
      v61 = *(const char **)(v4 + 56);
      v11 = *__error();
      v12 = *(NSObject **)(v4 + 72);
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        goto LABEL_12;
      v62 = "[anonymous]";
      if (v61)
        v62 = v61;
      buf = 136446466;
      v88 = v62;
      v89 = 1024;
      LODWORD(v90) = v9;
      v14 = "%{public}s: failed to unlink diags symlink: %{darwin.errno}d";
    }
    else
    {
      if (!symlink("/System/Volumes/Diags/AppleInternal/Diags", "/AppleInternal/Diags") || *__error() == 17)
      {
        v18 = 0;
        goto LABEL_59;
      }
      v9 = *__error();
      v63 = *(const char **)(v4 + 56);
      v11 = *__error();
      v12 = *(NSObject **)(v4 + 72);
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        goto LABEL_12;
      v64 = "[anonymous]";
      if (v63)
        v64 = v63;
      buf = 136446466;
      v88 = v64;
      v89 = 1024;
      LODWORD(v90) = v9;
      v14 = "%{public}s: failed to create symlink for diags: %{darwin.errno}d";
    }
LABEL_10:
    v15 = v12;
    v16 = 18;
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&buf, v16);
    goto LABEL_12;
  }
  v25 = sub_10000E40C((uint64_t)v85, "AppleInternalDiags", 640, &v76, *(NSObject **)(v4 + 72));
  if (v25)
  {
    v9 = v25;
    v26 = *(const char **)(v4 + 56);
    v21 = *__error();
    v22 = *(NSObject **)(v4 + 72);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v27 = "[anonymous]";
      if (v26)
        v27 = v26;
      buf = 136446466;
      v88 = v27;
      v89 = 1024;
      LODWORD(v90) = v9;
      v24 = "%{public}s: failed to create diags volume: %{darwin.errno}d";
      goto LABEL_43;
    }
    goto LABEL_45;
  }
  *(_QWORD *)(v4 + 176) |= 0x20uLL;
  __strlcpy_chk(v83, "/tmp/tmp-mount-XXXXXX", 1024, 1024);
  if (!mkdtemp(v83))
  {
    v9 = *__error();
    v44 = *(const char **)(v4 + 56);
    v11 = *__error();
    v12 = *(NSObject **)(v4 + 72);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v45 = "[anonymous]";
    if (v44)
      v45 = v44;
    buf = 136446466;
    v88 = v45;
    v89 = 1024;
    LODWORD(v90) = v9;
    v14 = "%{public}s: failed to create temporary mount point: %{darwin.errno}d";
    goto LABEL_10;
  }
  snprintf(v84, 0xFFuLL, "/dev/%ss%d", v85, v76);
  v30 = sub_10000E5BC(v84, (uint64_t)v83, *(NSObject **)(v4 + 72));
  if (v30)
  {
    v9 = v30;
    v31 = *(const char **)(v4 + 56);
    v21 = *__error();
    v22 = *(NSObject **)(v4 + 72);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v32 = "[anonymous]";
      if (v31)
        v32 = v31;
      buf = 136446466;
      v88 = v32;
      v89 = 1024;
      LODWORD(v90) = v9;
      v24 = "%{public}s: failed to mount diags volume: %{darwin.errno}d";
      goto LABEL_43;
    }
    goto LABEL_45;
  }
  snprintf(from, 0x400uLL, "%s/%s", *(const char **)(v4 + 416), *(const char **)(a2 + 72));
  snprintf(to, 0x400uLL, "%s/%s", v83, "AppleInternal");
  v46 = mkdir(to, 0x1FFu);
  if (v46)
  {
    v9 = v46;
    v47 = *(const char **)(v4 + 56);
    v21 = *__error();
    v48 = *(NSObject **)(v4 + 72);
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      goto LABEL_45;
    v49 = "[anonymous]";
    buf = 136446722;
    if (v47)
      v49 = v47;
    v88 = v49;
    v89 = 2080;
    v90 = to;
    v91 = 1024;
    LODWORD(v92) = v9;
    v24 = "%{public}s: failed to mkdir %s: %{darwin.errno}d";
    v35 = v48;
    v36 = 28;
    goto LABEL_44;
  }
  if (copyfile(from, to, 0, 0xC8008u))
  {
    v9 = *__error();
    v54 = *(const char **)(v4 + 56);
    v11 = *__error();
    v55 = *(NSObject **)(v4 + 72);
    if (!os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v56 = "[anonymous]";
    buf = 136446978;
    if (v54)
      v56 = v54;
    v88 = v56;
    v89 = 2080;
    v90 = from;
    v91 = 2080;
    v92 = to;
    v93 = 1024;
    v94 = v9;
    v14 = "%{public}s: failed to copyfile from %s to %s: %{darwin.errno}d";
    v15 = v55;
    v16 = 38;
    goto LABEL_11;
  }
  snprintf(__str, 0x400uLL, "%s/%s/.%s", v83, *(const char **)(a2 + 72), *(const char **)(v4 + 208));
  v17 = open(__str, 512, 420);
  if (v17 < 0)
  {
    v9 = *__error();
    v65 = *(const char **)(v4 + 56);
    v11 = *__error();
    v66 = *(NSObject **)(v4 + 72);
    if (!os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    v67 = "[anonymous]";
    buf = 136446722;
    if (v65)
      v67 = v65;
    v88 = v67;
    v89 = 2080;
    v90 = __str;
    v91 = 1024;
    LODWORD(v92) = v9;
    v68 = "%{public}s: failed to open %s: %{darwin.errno}d";
    v69 = v66;
    v70 = 28;
    goto LABEL_115;
  }
  if (unlink("/AppleInternal/Diags") && *__error() != 2)
  {
    v9 = *__error();
    v71 = *(const char **)(v4 + 56);
    v11 = *__error();
    v72 = *(NSObject **)(v4 + 72);
    if (!os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    v73 = "[anonymous]";
    if (v71)
      v73 = v71;
    buf = 136446466;
    v88 = v73;
    v89 = 1024;
    LODWORD(v90) = v9;
    v68 = "%{public}s: failed to unlink diags symlink: %{darwin.errno}d";
LABEL_114:
    v69 = v72;
    v70 = 18;
LABEL_115:
    _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_ERROR, v68, (uint8_t *)&buf, v70);
LABEL_13:
    *__error() = v11;
    if (!v9)
    {
      v18 = 0;
      goto LABEL_57;
    }
LABEL_46:
    v37 = *(void **)(v4 + 72);
    if (v37)
    {
      if (os_log_type_enabled(*(os_log_t *)(v4 + 72), OS_LOG_TYPE_ERROR))
        v38 = 3;
      else
        v38 = 2;
      v39 = *(const char **)(v4 + 56);
      if (!v39)
        v39 = "[anonymous]";
      buf = 136446466;
      v88 = v39;
      v89 = 1024;
      LODWORD(v90) = v9;
      v40 = v37;
    }
    else
    {
      v41 = *(const char **)(v4 + 56);
      if (!v41)
        v41 = "[anonymous]";
      buf = 136446466;
      v88 = v41;
      v89 = 1024;
      LODWORD(v90) = v9;
      v40 = &_os_log_default;
      v38 = 2;
    }
    v42 = (char *)_os_log_send_and_compose_impl(v38, 0, 0, 0, &_mh_execute_header, v40, 16);
    v18 = sub_10000A6F8("_quire_bootstrap_diags", "quire.c", 2033, "com.apple.security.cryptex.posix", v9, 0, v42);
    free(v42);
LABEL_57:
    if (v17 == -1)
      goto LABEL_59;
    goto LABEL_58;
  }
  snprintf(to, 0x400uLL, "%s/%s", v83, *(const char **)(a2 + 72));
  if (symlink(to, "/AppleInternal/Diags") && *__error() != 17)
  {
    v9 = *__error();
    v74 = *(const char **)(v4 + 56);
    v11 = *__error();
    v72 = *(NSObject **)(v4 + 72);
    if (!os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    v75 = "[anonymous]";
    if (v74)
      v75 = v74;
    buf = 136446466;
    v88 = v75;
    v89 = 1024;
    LODWORD(v90) = v9;
    v68 = "%{public}s: failed to create symlink for diags: %{darwin.errno}d";
    goto LABEL_114;
  }
  v57 = *(const char **)(v4 + 56);
  v58 = *__error();
  v59 = *(NSObject **)(v4 + 72);
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
  {
    v60 = "[anonymous]";
    if (v57)
      v60 = v57;
    buf = 136446210;
    v88 = v60;
    _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEBUG, "%{public}s: bootstrap diags successfully", (uint8_t *)&buf, 0xCu);
  }
  v18 = 0;
  *__error() = v58;
LABEL_58:
  if (close(v17) == -1)
    sub_100040B38(&v79, &buf);
LABEL_59:
  free(__s1);
  return v18;
}

CFErrorRef sub_100033444(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4;
  int v5;
  int v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  char *v21;
  CFIndex v22;
  int v23;
  CFErrorRef v24;
  const char *v26;
  int v27;
  NSObject *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  int v37;
  _BYTE v38[1024];

  v4 = *a3;
  bzero(v38, 0x400uLL);
  v5 = realpath_np(*(unsigned int *)(a2 + 80), v38);
  if (v5)
  {
    v6 = v5;
    v7 = *(void **)(v4 + 72);
    if (v7)
    {
      if (os_log_type_enabled(*(os_log_t *)(v4 + 72), OS_LOG_TYPE_ERROR))
        v8 = 3;
      else
        v8 = 2;
      v9 = *(const char **)(v4 + 56);
      v10 = *(_QWORD *)(a2 + 72);
      *(_DWORD *)buf = 136446722;
      if (!v9)
        v9 = "[anonymous]";
      v33 = v9;
      v34 = 2080;
      v35 = v10;
      v36 = 1024;
      v37 = v6;
      v11 = v7;
    }
    else
    {
      v19 = *(const char **)(v4 + 56);
      if (!v19)
        v19 = "[anonymous]";
      v20 = *(_QWORD *)(a2 + 72);
      *(_DWORD *)buf = 136446722;
      v33 = v19;
      v34 = 2080;
      v35 = v20;
      v36 = 1024;
      v37 = v5;
      v11 = &_os_log_default;
      v8 = 2;
    }
    v21 = (char *)_os_log_send_and_compose_impl(v8, 0, 0, 0, &_mh_execute_header, v11, 16);
    v22 = v6;
    v23 = 1562;
LABEL_22:
    v24 = sub_10000A6F8("_quire_bootstrap_luacore_lib", "quire.c", v23, "com.apple.security.cryptex.posix", v22, 0, v21);
    free(v21);
    return v24;
  }
  if (access(*(const char **)(a2 + 72), 0))
  {
    v12 = sub_100006620((uint64_t)v38, *(const char **)(a2 + 72), 6);
    if (!v12)
      return 0;
    v13 = v12;
    v14 = *(void **)(v4 + 72);
    if (v14)
    {
      if (os_log_type_enabled(*(os_log_t *)(v4 + 72), OS_LOG_TYPE_ERROR))
        v15 = 3;
      else
        v15 = 2;
      v16 = *(const char **)(v4 + 56);
      v17 = *(_QWORD *)(a2 + 72);
      *(_DWORD *)buf = 136446722;
      if (!v16)
        v16 = "[anonymous]";
      v33 = v16;
      v34 = 2080;
      v35 = v17;
      v36 = 1024;
      v37 = v13;
      v18 = v14;
    }
    else
    {
      v30 = *(const char **)(v4 + 56);
      if (!v30)
        v30 = "[anonymous]";
      v31 = *(_QWORD *)(a2 + 72);
      *(_DWORD *)buf = 136446722;
      v33 = v30;
      v34 = 2080;
      v35 = v31;
      v36 = 1024;
      v37 = v12;
      v18 = &_os_log_default;
      v15 = 2;
    }
    v21 = (char *)_os_log_send_and_compose_impl(v15, 0, 0, 0, &_mh_execute_header, v18, 16);
    v22 = v13;
    v23 = 1574;
    goto LABEL_22;
  }
  v26 = *(const char **)(v4 + 56);
  v27 = *__error();
  v28 = *(NSObject **)(v4 + 72);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    v29 = "[anonymous]";
    if (v26)
      v29 = v26;
    *(_DWORD *)buf = 136446210;
    v33 = v29;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "%{public}s: symlink exists, skipping", buf, 0xCu);
  }
  v24 = 0;
  *__error() = v27;
  return v24;
}

CFErrorRef sub_1000337FC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;
  int v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char *v16;
  CFIndex v17;
  int v18;
  CFErrorRef v19;
  _BYTE v21[1024];

  v5 = *a3;
  bzero(v21, 0x400uLL);
  v6 = realpath_np(*(unsigned int *)(a2 + 80), v21);
  if (v6)
  {
    v7 = v6;
    v8 = *(void **)(v5 + 72);
    if (v8)
    {
      if (os_log_type_enabled(*(os_log_t *)(v5 + 72), OS_LOG_TYPE_ERROR))
        v9 = 3;
      else
        v9 = 2;
      v10 = v8;
    }
    else
    {
      v10 = &_os_log_default;
      v9 = 2;
    }
    v16 = (char *)_os_log_send_and_compose_impl(v9, 0, 0, 0, &_mh_execute_header, v10, 16);
    v17 = v7;
    v18 = 1597;
LABEL_18:
    v19 = sub_10000A6F8("_quire_bootstrap_python_lib", "quire.c", v18, "com.apple.security.cryptex.posix", v17, 0, v16);
    free(v16);
    return v19;
  }
  v11 = sub_100006A54((uint64_t)v21, *((unsigned int *)a3 + 10), *(const char **)(a2 + 72), 6);
  if (v11)
  {
    v12 = v11;
    v13 = *(void **)(v5 + 72);
    if (v13)
    {
      if (os_log_type_enabled(*(os_log_t *)(v5 + 72), OS_LOG_TYPE_ERROR))
        v14 = 3;
      else
        v14 = 2;
      v15 = v13;
    }
    else
    {
      v15 = &_os_log_default;
      v14 = 2;
    }
    v16 = (char *)_os_log_send_and_compose_impl(v14, 0, 0, 0, &_mh_execute_header, v15, 16);
    v17 = v12;
    v18 = 1606;
    goto LABEL_18;
  }
  return 0;
}

CFErrorRef sub_100033B38(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4;
  int v5;
  int v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  char *v21;
  CFIndex v22;
  int v23;
  CFErrorRef v24;
  const char *v26;
  int v27;
  NSObject *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  int v37;
  _BYTE v38[1024];

  v4 = *a3;
  bzero(v38, 0x400uLL);
  v5 = realpath_np(*(unsigned int *)(a2 + 80), v38);
  if (v5)
  {
    v6 = v5;
    v7 = *(void **)(v4 + 72);
    if (v7)
    {
      if (os_log_type_enabled(*(os_log_t *)(v4 + 72), OS_LOG_TYPE_ERROR))
        v8 = 3;
      else
        v8 = 2;
      v9 = *(const char **)(v4 + 56);
      v10 = *(_QWORD *)(a2 + 72);
      *(_DWORD *)buf = 136446722;
      if (!v9)
        v9 = "[anonymous]";
      v33 = v9;
      v34 = 2080;
      v35 = v10;
      v36 = 1024;
      v37 = v6;
      v11 = v7;
    }
    else
    {
      v19 = *(const char **)(v4 + 56);
      if (!v19)
        v19 = "[anonymous]";
      v20 = *(_QWORD *)(a2 + 72);
      *(_DWORD *)buf = 136446722;
      v33 = v19;
      v34 = 2080;
      v35 = v20;
      v36 = 1024;
      v37 = v5;
      v11 = &_os_log_default;
      v8 = 2;
    }
    v21 = (char *)_os_log_send_and_compose_impl(v8, 0, 0, 0, &_mh_execute_header, v11, 16);
    v22 = v6;
    v23 = 1628;
LABEL_22:
    v24 = sub_10000A6F8("_quire_bootstrap_astro", "quire.c", v23, "com.apple.security.cryptex.posix", v22, 0, v21);
    free(v21);
    return v24;
  }
  if (access(*(const char **)(a2 + 72), 0))
  {
    v12 = sub_100006620((uint64_t)v38, *(const char **)(a2 + 72), 6);
    if (!v12)
      return 0;
    v13 = v12;
    v14 = *(void **)(v4 + 72);
    if (v14)
    {
      if (os_log_type_enabled(*(os_log_t *)(v4 + 72), OS_LOG_TYPE_ERROR))
        v15 = 3;
      else
        v15 = 2;
      v16 = *(const char **)(v4 + 56);
      v17 = *(_QWORD *)(a2 + 72);
      *(_DWORD *)buf = 136446722;
      if (!v16)
        v16 = "[anonymous]";
      v33 = v16;
      v34 = 2080;
      v35 = v17;
      v36 = 1024;
      v37 = v13;
      v18 = v14;
    }
    else
    {
      v30 = *(const char **)(v4 + 56);
      if (!v30)
        v30 = "[anonymous]";
      v31 = *(_QWORD *)(a2 + 72);
      *(_DWORD *)buf = 136446722;
      v33 = v30;
      v34 = 2080;
      v35 = v31;
      v36 = 1024;
      v37 = v12;
      v18 = &_os_log_default;
      v15 = 2;
    }
    v21 = (char *)_os_log_send_and_compose_impl(v15, 0, 0, 0, &_mh_execute_header, v18, 16);
    v22 = v13;
    v23 = 1640;
    goto LABEL_22;
  }
  v26 = *(const char **)(v4 + 56);
  v27 = *__error();
  v28 = *(NSObject **)(v4 + 72);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    v29 = "[anonymous]";
    if (v26)
      v29 = v26;
    *(_DWORD *)buf = 136446210;
    v33 = v29;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "%{public}s: symlink exists, skipping", buf, 0xCu);
  }
  v24 = 0;
  *__error() = v27;
  return v24;
}

CFErrorRef sub_100033EF0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4;
  int v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  CFIndex v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char *v15;
  CFIndex v16;
  int v17;
  CFErrorRef v18;
  char from[1024];

  v4 = *a3;
  bzero(from, 0x400uLL);
  v5 = realpath_np(*(unsigned int *)(a2 + 80), from);
  if (v5)
  {
    v6 = v5;
    v7 = *(void **)(v4 + 72);
    if (v7)
    {
      if (os_log_type_enabled(*(os_log_t *)(v4 + 72), OS_LOG_TYPE_ERROR))
        v8 = 3;
      else
        v8 = 2;
      v9 = v7;
    }
    else
    {
      v9 = &_os_log_default;
      v8 = 2;
    }
    v15 = (char *)_os_log_send_and_compose_impl(v8, 0, 0, 0, &_mh_execute_header, v9, 16);
    v16 = v6;
    v17 = 1474;
LABEL_18:
    v18 = sub_10000A6F8("_quire_bootstrap_log_plists", "quire.c", v17, "com.apple.security.cryptex.posix", v16, 0, v15);
    free(v15);
    return v18;
  }
  if (copyfile(from, "/Library/Preferences/Logging/Subsystems/", 0, 0xE8008u))
  {
    v10 = *__error();
    v11 = *(void **)(v4 + 72);
    if (v11)
    {
      if (os_log_type_enabled(*(os_log_t *)(v4 + 72), OS_LOG_TYPE_ERROR))
        v12 = 3;
      else
        v12 = 2;
      __error();
      v13 = v12;
      v14 = v11;
    }
    else
    {
      __error();
      v14 = &_os_log_default;
      v13 = 2;
    }
    v15 = (char *)_os_log_send_and_compose_impl(v13, 0, 0, 0, &_mh_execute_header, v14, 16);
    v17 = 1481;
    v16 = v10;
    goto LABEL_18;
  }
  return 0;
}

CFTypeRef sub_100034248(uint64_t a1, uint64_t a2)
{
  int v2;
  void *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  void *v8;
  const char *v9;
  int v10;
  NSObject *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  CFTypeRef v15;
  const char *v16;
  const char *v17;
  char *v18;
  CFErrorRef v19;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;

  v2 = a2;
  if (_vproc_set_global_on_demand(a2))
  {
    v4 = *(void **)(a1 + 72);
    if (v4)
    {
      if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR))
        v5 = 3;
      else
        v5 = 2;
      v6 = *(const char **)(a1 + 56);
      if (!v6)
        v6 = "[anonymous]";
      v7 = "set";
      if (!v2)
        v7 = "clear";
      *(_DWORD *)buf = 136446466;
      v22 = v6;
      v23 = 2080;
      v24 = v7;
      v8 = v4;
    }
    else
    {
      v16 = *(const char **)(a1 + 56);
      if (!v16)
        v16 = "[anonymous]";
      v17 = "set";
      if (!v2)
        v17 = "clear";
      *(_DWORD *)buf = 136446466;
      v22 = v16;
      v23 = 2080;
      v24 = v17;
      v8 = &_os_log_default;
      v5 = 2;
    }
    v18 = (char *)_os_log_send_and_compose_impl(v5, 0, 0, 0, &_mh_execute_header, v8, 16);
    v19 = sub_10000A6F8("_quire_globally_toggle_runatload_jobs", "quire.c", 1188, "com.apple.security.cryptex", 35, 0, v18);
    free(v18);
    if (v19)
    {
      v15 = CFRetain(v19);
      CFRelease(v19);
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v9 = *(const char **)(a1 + 56);
    v10 = *__error();
    v11 = *(NSObject **)(a1 + 72);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = "[anonymous]";
      if (v9)
        v12 = v9;
      v13 = "Unsuppressing";
      if (v2)
        v13 = "Suppressing";
      *(_DWORD *)buf = 136446722;
      v22 = v12;
      v14 = "setting";
      v23 = 2080;
      v24 = v13;
      if (!v2)
        v14 = "clearing";
      v25 = 2080;
      v26 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%{public}s: %s RunAtLoad jobs by %s global on-demand bit in launchd", buf, 0x20u);
    }
    v15 = 0;
    *__error() = v10;
  }
  return v15;
}

CFErrorRef sub_1000344F0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;
  _QWORD *v6;
  int *v7;
  _QWORD *v8;
  const char *v9;
  int v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  _QWORD *v18;
  uint64_t v19;
  int *v20;
  const char *v21;
  int v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  int v26;
  int v27;
  const char *v28;
  int v29;
  NSObject *v30;
  const char *v31;
  const char *v32;
  int v33;
  const char *v34;
  const char *v35;
  void *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  char *v43;
  CFErrorRef v44;
  _QWORD v46[5];
  uint64_t v47;
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  int v53;

  v5 = *a3;
  v6 = malloc_type_calloc(1uLL, 0xC0uLL, 0x61D5536CuLL);
  if (!v6)
    sub_100040F38(&v47, buf);
  v7 = (int *)v6;
  *((_OWORD *)v6 + 8) = 0u;
  v8 = v6 + 16;
  v6[22] = 0;
  *((_OWORD *)v6 + 9) = 0u;
  *((_OWORD *)v6 + 10) = 0u;
  v9 = *(const char **)(v5 + 56);
  v10 = *__error();
  v11 = *(NSObject **)(v5 + 72);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = "[anonymous]";
    v13 = *(_QWORD *)(a2 + 56);
    if (v9)
      v12 = v9;
    *(_DWORD *)buf = 136446466;
    v49 = v12;
    v50 = 2080;
    v51 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%{public}s: _quire_bootstrap_agents: bootstrapping agent: %s", buf, 0x16u);
  }
  *__error() = v10;
  v14 = *(_DWORD *)(v5 + 188);
  if (v14)
  {
    v15 = *(_QWORD *)(v5 + 192);
    if (v15)
      v16 = 40;
    else
      v16 = 8;
    if (!v15)
    {
      v15 = 0;
      v14 = 0;
    }
  }
  else
  {
    v15 = 0;
    v16 = 8;
  }
  *((_QWORD *)v7 + 1) = 0;
  *((_QWORD *)v7 + 2) = *(_QWORD *)(v5 + 416);
  *((_QWORD *)v7 + 12) = 0;
  v7[26] = v14;
  *((_QWORD *)v7 + 14) = *(_QWORD *)(v5 + 72);
  *((_QWORD *)v7 + 15) = v15;
  v17 = *(_DWORD *)(v5 + 176);
  v18 = *(_QWORD **)(v5 + 472);
  if (v18)
  {
    v19 = v7[22];
    v20 = &v7[2 * v19 + 6];
    do
    {
      *(_QWORD *)v20 = *(_QWORD *)(*v18 + 416);
      v20 += 2;
      v18 = (_QWORD *)v18[1];
      LODWORD(v19) = v19 + 1;
    }
    while (v18);
    v7[22] = v19;
  }
  v21 = *(const char **)(v5 + 56);
  v22 = *__error();
  v23 = *(NSObject **)(v5 + 72);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    v24 = "[anonymous]";
    v25 = *(_QWORD *)(a2 + 56);
    if (v21)
      v24 = v21;
    *(_DWORD *)buf = 136446466;
    v49 = v24;
    v50 = 2080;
    v51 = v25;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "%{public}s: bootstrapping agent: %s", buf, 0x16u);
  }
  *__error() = v22;
  v26 = sub_10003BC08(*(_DWORD *)(a2 + 80), v8);
  if (v26)
  {
    v27 = v26;
    v28 = *(const char **)(v5 + 56);
    v29 = *__error();
    v30 = *(NSObject **)(v5 + 72);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = "[anonymous]";
      if (v28)
        v31 = v28;
      *(_DWORD *)buf = 136446466;
      v49 = v31;
      v50 = 1024;
      LODWORD(v51) = v27;
      v32 = "%{public}s: failed to read plist: %{darwin.errno}d";
LABEL_32:
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, v32, buf, 0x12u);
    }
  }
  else
  {
    *(_QWORD *)v7 = *(_QWORD *)(v5 + 456);
    *(_QWORD *)(v5 + 456) = v7;
    *((_QWORD *)v7 + 1) = (16 * (v17 & 1)) | v16;
    sub_100035A08(v5);
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 0x40000000;
    v46[2] = sub_100035A40;
    v46[3] = &unk_100057178;
    v46[4] = v5;
    v33 = sub_10000D86C(v46, (uint64_t)a3);
    if (!v33)
      return 0;
    v27 = v33;
    v34 = *(const char **)(v5 + 56);
    v29 = *__error();
    v30 = *(NSObject **)(v5 + 72);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v35 = "[anonymous]";
      if (v34)
        v35 = v34;
      *(_DWORD *)buf = 136446466;
      v49 = v35;
      v50 = 1024;
      LODWORD(v51) = v27;
      v32 = "%{public}s: launchagent bootstrap failed: %{darwin.errno}d";
      goto LABEL_32;
    }
  }
  *__error() = v29;
  sub_10003C630(v8);
  free(v7);
  v36 = *(void **)(v5 + 72);
  if (v36)
  {
    if (os_log_type_enabled(*(os_log_t *)(v5 + 72), OS_LOG_TYPE_ERROR))
      v37 = 3;
    else
      v37 = 2;
    v38 = *(const char **)(v5 + 56);
    v39 = *(_QWORD *)(a2 + 56);
    *(_DWORD *)buf = 136446722;
    if (!v38)
      v38 = "[anonymous]";
    v49 = v38;
    v50 = 2080;
    v51 = v39;
    v52 = 1024;
    v53 = v27;
    v40 = v36;
  }
  else
  {
    v41 = *(const char **)(v5 + 56);
    if (!v41)
      v41 = "[anonymous]";
    v42 = *(_QWORD *)(a2 + 56);
    *(_DWORD *)buf = 136446722;
    v49 = v41;
    v50 = 2080;
    v51 = v42;
    v52 = 1024;
    v53 = v27;
    v40 = &_os_log_default;
    v37 = 2;
  }
  v43 = (char *)_os_log_send_and_compose_impl(v37, 0, 0, 0, &_mh_execute_header, v40, 16);
  v44 = sub_10000A6F8("_quire_bootstrap_agents", "quire.c", 1051, "com.apple.security.cryptex.posix", v27, 0, v43);
  free(v43);
  return v44;
}

CFErrorRef sub_1000349D8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4;
  const char *v5;
  int v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  _QWORD *v15;
  uint64_t v16;
  unint64_t v17;
  const char *v18;
  int v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  int v23;
  int v24;
  const char *v25;
  int v26;
  NSObject *v27;
  const char *v28;
  void *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  _QWORD *v34;
  _QWORD *v35;
  CFErrorRef v36;
  void *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  char *v44;
  CFErrorRef v45;
  const char *v46;
  uint64_t v47;
  char *v48;
  _OWORD v50[3];
  uint64_t v51;
  uint64_t v52;
  _QWORD buf[4];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint8_t v61[4];
  const char *v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  int v66;

  v4 = *a3;
  v51 = 0;
  memset(v50, 0, sizeof(v50));
  v5 = *(const char **)(v4 + 56);
  v6 = *__error();
  v7 = *(NSObject **)(v4 + 72);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    if (v5)
      v8 = v5;
    else
      v8 = "[anonymous]";
    v9 = *(_QWORD *)(a2 + 56);
    LODWORD(buf[0]) = 136446466;
    *(_QWORD *)((char *)buf + 4) = v8;
    WORD2(buf[1]) = 2080;
    *(_QWORD *)((char *)&buf[1] + 6) = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%{public}s: _quire_bootstrap_service: bootstrapping service: %s", (uint8_t *)buf, 0x16u);
  }
  *__error() = v6;
  v10 = *(_DWORD *)(v4 + 188);
  if (v10)
  {
    v11 = *(_QWORD *)(v4 + 192);
    if (v11)
    {
      v12 = 40;
      goto LABEL_12;
    }
    v10 = 0;
  }
  else
  {
    v11 = 0;
  }
  v12 = 8;
LABEL_12:
  if ((_cryptex_content_type_factory[2] & *(_QWORD *)(v4 + 320)) != 0)
    v13 = v12 | 0x40;
  else
    v13 = v12;
  v58 = 0;
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  memset(buf, 0, sizeof(buf));
  buf[1] = *(_QWORD *)(v4 + 416);
  LODWORD(v58) = v10;
  v59 = *(_QWORD *)(v4 + 72);
  v60 = v11;
  v14 = *(_DWORD *)(v4 + 176);
  v15 = *(_QWORD **)(v4 + 472);
  if (v15)
  {
    v16 = 0;
    do
    {
      buf[v16++ + 2] = *(_QWORD *)(*v15 + 416);
      v15 = (_QWORD *)v15[1];
    }
    while (v15);
    LODWORD(v57) = v16;
  }
  v17 = *(unsigned int *)(*(_QWORD *)(v4 + 200) + 40);
  v18 = *(const char **)(v4 + 56);
  v19 = *__error();
  v20 = *(NSObject **)(v4 + 72);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    if (v18)
      v21 = v18;
    else
      v21 = "[anonymous]";
    v22 = *(_QWORD *)(a2 + 56);
    *(_DWORD *)v61 = 136446466;
    v62 = v21;
    v63 = 2080;
    v64 = v22;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%{public}s: bootstrapping service: %s", v61, 0x16u);
  }
  *__error() = v19;
  v23 = sub_10003BC08(*(_DWORD *)(a2 + 80), v50);
  if (v23)
  {
    v24 = v23;
    v25 = *(const char **)(v4 + 56);
    v26 = *__error();
    v27 = *(NSObject **)(v4 + 72);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      if (v25)
        v28 = v25;
      else
        v28 = "[anonymous]";
      *(_DWORD *)v61 = 136446466;
      v62 = v28;
      v63 = 1024;
      LODWORD(v64) = v24;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%{public}s: failed to read plist: %{darwin.errno}d", v61, 0x12u);
    }
    *__error() = v26;
    sub_10003C630(v50);
    v29 = *(void **)(v4 + 72);
    if (v29)
    {
      if (os_log_type_enabled(*(os_log_t *)(v4 + 72), OS_LOG_TYPE_ERROR))
        v30 = 3;
      else
        v30 = 2;
      v31 = *(const char **)(v4 + 56);
      v32 = *(_QWORD *)(a2 + 56);
      if (!v31)
        v31 = "[anonymous]";
      *(_DWORD *)v61 = 136446722;
      v62 = v31;
      v63 = 2080;
      v64 = v32;
      v65 = 1024;
      v66 = v24;
      v33 = v29;
    }
    else
    {
      v42 = *(const char **)(v4 + 56);
      if (!v42)
        v42 = "[anonymous]";
      v43 = *(_QWORD *)(a2 + 56);
      *(_DWORD *)v61 = 136446722;
      v62 = v42;
      v63 = 2080;
      v64 = v43;
      v65 = 1024;
      v66 = v24;
      v33 = &_os_log_default;
      v30 = 2;
    }
    v44 = (char *)_os_log_send_and_compose_impl(v30, 0, 0, 0, &_mh_execute_header, v33, 16);
    v45 = sub_10000A6F8("_quire_bootstrap_service", "quire.c", 908, "com.apple.security.cryptex.posix", v24, 0, v44);
    free(v44);
  }
  else
  {
    buf[0] = ((16 * (v14 & 1)) | v13) & 0xFFFFFFFFFFFFFF7FLL | (((v17 >> 1) & 1) << 7);
    v34 = malloc_type_calloc(1uLL, 0x490uLL, 0x61D5536CuLL);
    if (!v34)
      sub_100040FE0(&v52, v61);
    v35 = v34;
    v36 = sub_100012760(v50, buf, (uint64_t)(v34 + 1), *(_QWORD *)(v4 + 368));
    if (v36)
    {
      v37 = *(void **)(v4 + 72);
      if (v37)
      {
        if (os_log_type_enabled(*(os_log_t *)(v4 + 72), OS_LOG_TYPE_ERROR))
          v38 = 3;
        else
          v38 = 2;
        v39 = *(const char **)(v4 + 56);
        v40 = *(_QWORD *)(a2 + 56);
        if (!v39)
          v39 = "[anonymous]";
        *(_DWORD *)v61 = 136446466;
        v62 = v39;
        v63 = 2080;
        v64 = v40;
        v41 = v37;
      }
      else
      {
        v46 = *(const char **)(v4 + 56);
        if (!v46)
          v46 = "[anonymous]";
        v47 = *(_QWORD *)(a2 + 56);
        *(_DWORD *)v61 = 136446466;
        v62 = v46;
        v63 = 2080;
        v64 = v47;
        v41 = &_os_log_default;
        v38 = 2;
      }
      v48 = (char *)_os_log_send_and_compose_impl(v38, 0, 0, 0, &_mh_execute_header, v41, 16);
      v45 = sub_10000A6F8("_quire_bootstrap_service", "quire.c", 893, "com.apple.security.cryptex", 14, v36, v48);
      free(v48);
    }
    else
    {
      *v35 = *(_QWORD *)(v4 + 448);
      *(_QWORD *)(v4 + 448) = v35;
      sub_100035A08(v4);
      v35 = 0;
      v45 = 0;
    }
    sub_10003C630(v50);
    free(v35);
    if (v36)
      CFRelease(v36);
  }
  return v45;
}

CFErrorRef sub_100034F88(uint64_t a1)
{
  uint64_t info_asset;
  int v3;
  int v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  void *v9;
  CFErrorRef v10;
  CFErrorRef v11;
  void *v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  char *v18;
  const char *v19;
  __CFError *v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  const __CFArray *v26;
  size_t Count;
  CFIndex v28;
  const void **v29;
  const __CFSet *v30;
  CFIndex v31;
  const __CFString *ValueAtIndex;
  char *v33;
  const char *v34;
  const char *v35;
  void *v36;
  uint64_t v37;
  const char *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  const char *v42;
  void *v43;
  const char *v44;
  const char *v45;
  char *v46;
  void *v47;
  uint64_t v48;
  const char *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  const char *v53;
  void *v54;
  const char *v55;
  char *v56;
  int v57;
  CFIndex v58;
  const char *v59;
  const __CFSet *v60;
  CFTypeRef cf;
  _OWORD v62[3];
  uint64_t v63;
  int v64;
  const char *v65;
  __int16 v66;
  const __CFString *v67;
  CFRange v68;

  v63 = 0;
  memset(v62, 0, sizeof(v62));
  cf = 0;
  info_asset = cryptex_core_get_info_asset(*(_QWORD *)(a1 + 200));
  if (!info_asset)
  {
    v9 = 0;
    goto LABEL_11;
  }
  v3 = sub_10003BC08(*(_DWORD *)(info_asset + 16), v62);
  if (v3)
  {
    v4 = v3;
    v5 = *(void **)(a1 + 72);
    if (v5)
    {
      if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR))
        v6 = 3;
      else
        v6 = 2;
      v7 = *(const char **)(a1 + 56);
      if (!v7)
        v7 = "[anonymous]";
      v64 = 136446466;
      v65 = v7;
      v66 = 1024;
      LODWORD(v67) = v4;
      v8 = v5;
    }
    else
    {
      v17 = *(const char **)(a1 + 56);
      if (!v17)
        v17 = "[anonymous]";
      v64 = 136446466;
      v65 = v17;
      v66 = 1024;
      LODWORD(v67) = v3;
      v8 = &_os_log_default;
      v6 = 2;
    }
    v18 = (char *)_os_log_send_and_compose_impl(v6, 0, 0, 0, &_mh_execute_header, v8, 16);
    v11 = sub_10000A6F8("_quire_bootstrap_watchdog_registration", "quire.c", 1218, "com.apple.security.cryptex.posix", v4, 0, v18);
    v9 = 0;
LABEL_29:
    v10 = 0;
LABEL_30:
    free(v18);
    goto LABEL_31;
  }
  v12 = (void *)xpc_create_from_plist(*(_QWORD *)&v62[0]);
  v9 = v12;
  if (!v12 || xpc_get_type(v12) != (xpc_type_t)&_xpc_type_dictionary)
  {
    v13 = *(void **)(a1 + 72);
    if (v13)
    {
      if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR))
        v14 = 3;
      else
        v14 = 2;
      v15 = *(const char **)(a1 + 56);
      if (!v15)
        v15 = "[anonymous]";
      v64 = 136446210;
      v65 = v15;
      v16 = v13;
    }
    else
    {
      v19 = *(const char **)(a1 + 56);
      if (!v19)
        v19 = "[anonymous]";
      v64 = 136446210;
      v65 = v19;
      v16 = &_os_log_default;
      v14 = 2;
    }
    v18 = (char *)_os_log_send_and_compose_impl(v14, 0, 0, 0, &_mh_execute_header, v16, 16);
    v11 = sub_10000A6F8("_quire_bootstrap_watchdog_registration", "quire.c", 1224, "com.apple.security.cryptex", 11, 0, v18);
    goto LABEL_29;
  }
  v21 = (__CFError *)sub_100006BD4(v9, &cf);
  if (v21)
  {
    v10 = v21;
    v22 = *(void **)(a1 + 72);
    if (v22)
    {
      if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR))
        v23 = 3;
      else
        v23 = 2;
      v24 = *(const char **)(a1 + 56);
      if (!v24)
        v24 = "[anonymous]";
      v64 = 136446210;
      v65 = v24;
      v25 = v22;
    }
    else
    {
      v35 = *(const char **)(a1 + 56);
      if (!v35)
        v35 = "[anonymous]";
      v64 = 136446210;
      v65 = v35;
      v25 = &_os_log_default;
      v23 = 2;
    }
    v18 = (char *)_os_log_send_and_compose_impl(v23, 0, 0, 0, &_mh_execute_header, v25, 16);
    v11 = sub_10000A6F8("_quire_bootstrap_watchdog_registration", "quire.c", 1230, "com.apple.security.cryptex", 11, v10, v18);
    goto LABEL_30;
  }
  if (!cf || CFArrayGetCount((CFArrayRef)cf) < 1)
  {
LABEL_11:
    v10 = 0;
    v11 = 0;
LABEL_31:
    sub_10003C630(v62);
    goto LABEL_32;
  }
  v26 = (const __CFArray *)sub_100007E6C((void *)cf);
  Count = CFArrayGetCount(v26);
  if (!Count)
    goto LABEL_96;
  v28 = Count;
  v29 = (const void **)malloc_type_calloc(Count, 8uLL, 0xC0040B8AA526DuLL);
  v68.location = 0;
  v68.length = v28;
  CFArrayGetValues(v26, v68, v29);
  v30 = CFSetCreate(0, v29, v28, &kCFTypeSetCallBacks);
  if (CFSetGetCount(v30) == v28)
  {
    if (v28 < 1)
    {
      v10 = 0;
    }
    else
    {
      v31 = 0;
      v60 = v30;
      while (2)
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v26, v31);
        v33 = sub_10000A2F4(ValueAtIndex);
        v34 = (const char *)(a1 + 448);
        do
        {
          v34 = *(const char **)v34;
          if (!v34)
          {
            v40 = *(void **)(a1 + 72);
            if (v40)
            {
              if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR))
                v41 = 3;
              else
                v41 = 2;
              v42 = *(const char **)(a1 + 56);
              if (!v42)
                v42 = "[anonymous]";
              v64 = 136446466;
              v65 = v42;
              v66 = 2114;
              v67 = ValueAtIndex;
              v43 = v40;
            }
            else
            {
              v45 = *(const char **)(a1 + 56);
              if (!v45)
                v45 = "[anonymous]";
              v64 = 136446466;
              v65 = v45;
              v66 = 2114;
              v67 = ValueAtIndex;
              v43 = &_os_log_default;
              v41 = 2;
            }
            v46 = (char *)_os_log_send_and_compose_impl(v41, 0, 0, 0, &_mh_execute_header, v43, 16);
            v30 = v60;
            v10 = sub_10000A6F8("_quire_validate_watchdog_service_labels", "quire.c", 1168, "com.apple.security.cryptex", 11, 0, v46);
            free(v46);
            goto LABEL_85;
          }
        }
        while (strcmp(v34 + 8, v33));
        free(v33);
        v10 = 0;
        ++v31;
        v30 = v60;
        if (v31 != v28)
          continue;
        break;
      }
    }
  }
  else
  {
    v36 = *(void **)(a1 + 72);
    if (v36)
    {
      if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR))
        v37 = 3;
      else
        v37 = 2;
      v38 = *(const char **)(a1 + 56);
      if (!v38)
        v38 = "[anonymous]";
      v64 = 136446210;
      v65 = v38;
      v39 = v36;
    }
    else
    {
      v44 = *(const char **)(a1 + 56);
      if (!v44)
        v44 = "[anonymous]";
      v64 = 136446210;
      v65 = v44;
      v39 = &_os_log_default;
      v37 = 2;
    }
    v33 = (char *)_os_log_send_and_compose_impl(v37, 0, 0, 0, &_mh_execute_header, v39, 16);
    v10 = sub_10000A6F8("_quire_validate_watchdog_service_labels", "quire.c", 1147, "com.apple.security.cryptex", 11, 0, v33);
LABEL_85:
    free(v33);
  }
  if (v30)
    CFRelease(v30);
  free(v29);
  if (v10)
  {
    v47 = *(void **)(a1 + 72);
    if (v47)
    {
      if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR))
        v48 = 3;
      else
        v48 = 2;
      v49 = *(const char **)(a1 + 56);
      if (!v49)
        v49 = "[anonymous]";
      v64 = 136446210;
      v65 = v49;
      v50 = v47;
    }
    else
    {
      v55 = *(const char **)(a1 + 56);
      if (!v55)
        v55 = "[anonymous]";
      v64 = 136446210;
      v65 = v55;
      v50 = &_os_log_default;
      v48 = 2;
    }
    v56 = (char *)_os_log_send_and_compose_impl(v48, 0, 0, 0, &_mh_execute_header, v50, 16);
    v57 = 1238;
    v58 = 11;
  }
  else
  {
LABEL_96:
    v10 = sub_100007FAC((void *)cf);
    if (!v10)
    {
      v11 = 0;
      goto LABEL_114;
    }
    v51 = *(void **)(a1 + 72);
    if (v51)
    {
      if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR))
        v52 = 3;
      else
        v52 = 2;
      v53 = *(const char **)(a1 + 56);
      if (!v53)
        v53 = "[anonymous]";
      v64 = 136446210;
      v65 = v53;
      v54 = v51;
    }
    else
    {
      v59 = *(const char **)(a1 + 56);
      if (!v59)
        v59 = "[anonymous]";
      v64 = 136446210;
      v65 = v59;
      v54 = &_os_log_default;
      v52 = 2;
    }
    v56 = (char *)_os_log_send_and_compose_impl(v52, 0, 0, 0, &_mh_execute_header, v54, 16);
    v57 = 1244;
    v58 = 33;
  }
  v11 = sub_10000A6F8("_quire_bootstrap_watchdog_registration", "quire.c", v57, "com.apple.security.cryptex", v58, v10, v56);
  free(v56);
LABEL_114:
  sub_10003C630(v62);
  if (v26)
    CFRelease(v26);
LABEL_32:
  if (cf)
    CFRelease(cf);
  if (v10)
    CFRelease(v10);
  if (v9)
    os_release(v9);
  return v11;
}

uint64_t sub_1000359B0(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[5];

  v1 = *(_QWORD *)(a1 + 24);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 0x40000000;
  v3[2] = sub_100035AA4;
  v3[3] = &unk_100057198;
  v3[4] = a1;
  return remote_device_browse_present(0xFFFFLL, v1, v3);
}

void sub_100035A08(uint64_t a1)
{
  int v2;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  v2 = *(_DWORD *)(a1 + 184);
  *(_DWORD *)(a1 + 184) = v2 + 1;
  if (v2 == -1)
    sub_100041088();
}

void sub_100035A40(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  void *v4;

  if (*(_QWORD *)(a2 + 48) == 3)
  {
    v3 = sub_10003C89C(*(void **)(a1 + 32), 0x50uLL);
    *((_DWORD *)v3 + 6) = *(_DWORD *)(a2 + 40);
    v4 = *(void **)(a2 + 80);
    v3[4] = v4;
    xpc_retain(v4);
    sub_100030C50((uint64_t)v3);
    sub_10003C998((void **)v3);
  }
}

int *sub_100035AA4(int *result, uint64_t a2, char a3)
{
  int *v4;
  int v5;
  const char *v6;
  int v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t name;
  __int16 v13;
  int v14;

  if ((a3 & 1) == 0)
  {
    v4 = result;
    result = (int *)remote_device_reset(a2);
    if ((result & 1) == 0)
    {
      v5 = *__error();
      v6 = *(const char **)(*((_QWORD *)v4 + 4) + 56);
      v7 = *__error();
      v8 = *(NSObject **)(*((_QWORD *)v4 + 4) + 72);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        if (!v6)
          v6 = "[anonymous]";
        v9 = 136446722;
        v10 = v6;
        v11 = 2080;
        name = remote_device_get_name(a2);
        v13 = 1024;
        v14 = v5;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}s: failed to reset remote device: %s: %{darwin.errno}d", (uint8_t *)&v9, 0x1Cu);
      }
      result = __error();
      *result = v7;
    }
  }
  return result;
}

void sub_100035BB4(uint64_t a1)
{
  int v2;
  _BOOL4 v3;
  char *v4;
  char v5;
  void **v6;
  const char *v7;
  int v8;
  NSObject *v9;
  const char *v10;
  BOOL v11;
  int v12;
  int v13;
  const char *v14;
  int v15;
  NSObject *v16;
  const char *v17;
  char *v18;
  char *v19;
  const char *v20;
  int v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  _OWORD v26[6];
  __int128 v27;
  uint64_t v28;
  _BYTE buf[24];
  void *v30;
  uint64_t v31;

  v2 = *(_DWORD *)(a1 + 188);
  v3 = v2 != 0;
  v27 = 0u;
  memset(v26, 0, sizeof(v26));
  *((_QWORD *)&v26[0] + 1) = *(_QWORD *)(a1 + 416);
  LODWORD(v27) = v2;
  *((_QWORD *)&v27 + 1) = *(_QWORD *)(a1 + 72);
  v28 = 0;
  sub_100035A08(a1);
  v4 = *(char **)(a1 + 448);
  if (v4)
  {
    v5 = 0;
    v25 = 32 * v3;
    v6 = (void **)(a1 + 448);
    do
    {
      v7 = *(const char **)(a1 + 56);
      v8 = *__error();
      v9 = *(NSObject **)(a1 + 72);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v10 = "[anonymous]";
        if (v7)
          v10 = v7;
        *(_DWORD *)buf = 136446466;
        *(_QWORD *)&buf[4] = v10;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = v4 + 8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%{public}s: unbootstrapping service: %s", buf, 0x16u);
      }
      *__error() = v8;
      v11 = v4[1160] != 0;
      *(_QWORD *)&v26[0] = v25;
      v12 = sub_1000134AC(v4 + 8, (uint64_t)v26);
      if (v12)
      {
        v13 = v12;
        v14 = *(const char **)(a1 + 56);
        v15 = *__error();
        v16 = *(NSObject **)(a1 + 72);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          v17 = "[anonymous]";
          if (v14)
            v17 = v14;
          *(_QWORD *)&buf[4] = v17;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = v4 + 8;
          *(_WORD *)&buf[22] = 1024;
          LODWORD(v30) = v13;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}s: failed to unbootstrap service: %s: %{darwin.errno}d", buf, 0x1Cu);
        }
        *__error() = v15;
      }
      sub_1000361BC(a1);
      v18 = *(char **)(a1 + 448);
      v19 = (char *)(a1 + 448);
      while (v18 != v4)
      {
        v19 = v18;
        v18 = *(char **)v18;
      }
      v5 |= v11;
      *(_QWORD *)v19 = *(_QWORD *)v4;
      free(v4);
      v4 = (char *)*v6;
    }
    while (*v6);
    if ((v5 & 1) != 0)
    {
      v20 = *(const char **)(a1 + 56);
      v21 = *__error();
      v22 = *(NSObject **)(a1 + 72);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        v23 = "[anonymous]";
        if (v20)
          v23 = v20;
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "%{public}s: resetting remote devices for removed remote services", buf, 0xCu);
      }
      *__error() = v21;
      v24 = *(_QWORD *)(a1 + 24);
      *(_QWORD *)buf = _NSConcreteStackBlock;
      *(_QWORD *)&buf[8] = 0x40000000;
      *(_QWORD *)&buf[16] = sub_100035AA4;
      v30 = &unk_100057198;
      v31 = a1;
      remote_device_browse_present(0xFFFFLL, v24, buf);
    }
  }
  sub_1000361BC(a1);
}

_DWORD *sub_100035EB4(uint64_t a1)
{
  const char *v2;
  int v3;
  NSObject *v4;
  const char *v5;
  _DWORD *result;
  int v7;
  const char *v8;
  int v9;
  NSObject *v10;
  const char *v11;
  const char *v12;
  int v13;
  const char *v14;
  int v15;
  NSObject *v16;
  const char *v17;
  int v18;
  const char *v19;
  const char *v20;
  int v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  char __str[16];
  __int128 v27;
  __int128 v28;
  __int128 v29;
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
  _BYTE v40[31];
  statfs v41;

  bzero(&v41, 0x878uLL);
  v21 = 0;
  v39 = 0u;
  memset(v40, 0, sizeof(v40));
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v32 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  *(_OWORD *)__str = 0u;
  v27 = 0u;
  v2 = *(const char **)(a1 + 56);
  v3 = *__error();
  v4 = *(NSObject **)(a1 + 72);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = "[anonymous]";
    if (v2)
      v5 = v2;
    *(_DWORD *)buf = 136446210;
    v23 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%{public}s: unbootstrap diags", buf, 0xCu);
  }
  result = __error();
  *result = v3;
  if ((*(_BYTE *)(a1 + 176) & 0x20) != 0)
  {
    if (statfs("/", &v41))
    {
      v7 = *__error();
      v8 = *(const char **)(a1 + 56);
      v9 = *__error();
      v10 = *(NSObject **)(a1 + 72);
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
LABEL_12:
        result = __error();
        *result = v9;
        return result;
      }
      v11 = "[anonymous]";
      if (v8)
        v11 = v8;
      *(_DWORD *)buf = 136446466;
      v23 = v11;
      v24 = 1024;
      v25 = v7;
      v12 = "%{public}s: failed to statfs root path: %{darwin.errno}d";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, v12, buf, 0x12u);
      goto LABEL_12;
    }
    sscanf(v41.f_mntfromname, "/dev/disk%d", &v21);
    snprintf(__str, 0xFFuLL, "disk%d", v21);
    if (unlink("/AppleInternal/Diags") && *__error() != 2)
    {
      v18 = *__error();
      v19 = *(const char **)(a1 + 56);
      v9 = *__error();
      v10 = *(NSObject **)(a1 + 72);
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        goto LABEL_12;
      v20 = "[anonymous]";
      if (v19)
        v20 = v19;
      *(_DWORD *)buf = 136446466;
      v23 = v20;
      v24 = 1024;
      v25 = v18;
      v12 = "%{public}s: failed to unlink diags symlink: %{darwin.errno}d";
      goto LABEL_11;
    }
    result = (_DWORD *)sub_10000EC18((uint64_t)__str, 640, *(NSObject **)(a1 + 72));
    if ((_DWORD)result)
    {
      v13 = (int)result;
      v14 = *(const char **)(a1 + 56);
      v15 = *__error();
      v16 = *(NSObject **)(a1 + 72);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = "[anonymous]";
        if (v14)
          v17 = v14;
        *(_DWORD *)buf = 136446466;
        v23 = v17;
        v24 = 1024;
        v25 = v13;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}s: failed to delete diags volume: %{darwin.errno}d", buf, 0x12u);
      }
      result = __error();
      *result = v15;
    }
    else
    {
      *(_QWORD *)(a1 + 176) &= ~0x20uLL;
    }
  }
  return result;
}

void sub_1000361BC(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  v2 = *(_DWORD *)(a1 + 184);
  *(_DWORD *)(a1 + 184) = v2 - 1;
  if (!v2)
    sub_100041088();
  if (v2 == 1)
  {
    v3 = *(_QWORD *)(a1 + 376);
    if (v3)
    {
      v4 = (uint64_t *)(a1 + 376);
      do
      {
        if ((*(_DWORD *)(v3 + 44) & 0x80000000) != 0)
          sub_10002FDC8((_QWORD *)v3);
        else
          sub_10002C11C((uint64_t *)v3);
        v5 = *v4;
        v6 = *v4;
        if (*v4 == v3)
        {
          v5 = *(_QWORD *)(v3 + 24);
          *v4 = v5;
          if (!v5)
          {
            *(_QWORD *)(a1 + 384) = v4;
            *(_QWORD *)(v3 + 24) = -1;
            return;
          }
        }
        else
        {
          do
          {
            v7 = v6;
            v6 = *(_QWORD *)(v6 + 24);
          }
          while (v6 != v3);
          v8 = *(_QWORD *)(v3 + 24);
          *(_QWORD *)(v7 + 24) = v8;
          v9 = v7 + 24;
          if (!v8)
            *(_QWORD *)(a1 + 384) = v9;
        }
        *(_QWORD *)(v3 + 24) = -1;
        v3 = v5;
      }
      while (v5);
    }
  }
}

uint64_t sub_100036288(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  const char *v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  const char *v13;
  int v14;
  NSObject *v15;
  const char *v16;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  uint64_t v21;

  v2 = (_QWORD *)a1[58];
  if (v2)
  {
    do
    {
      v3 = (_QWORD *)*v2;
      v4 = (const char *)a1[7];
      v5 = *__error();
      v6 = a1[9];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        v7 = a1[52];
        if (v4)
          v8 = v4;
        else
          v8 = "[anonymous]";
        *(_DWORD *)buf = 136446466;
        v19 = v8;
        v20 = 2080;
        v21 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}s: Found a Launch Agent while removing quire: %s - going to deactivate it.", buf, 0x16u);
      }
      *__error() = v5;
      sub_100036470(v2, a1);
      v2 = v3;
    }
    while (v3);
  }
  sub_100035A08((uint64_t)a1);
  v9 = (_QWORD *)a1[57];
  if (v9)
  {
    do
    {
      v10 = (_QWORD *)a1[57];
      v11 = a1 + 57;
      while (v10 != v9)
      {
        v11 = v10;
        v10 = (_QWORD *)*v10;
      }
      v12 = (_QWORD *)*v9;
      *v11 = *v9;
      *v9 = -1;
      sub_10003C630(v9 + 16);
      free(v9);
      sub_1000361BC(a1);
      v9 = v12;
    }
    while (v12);
  }
  v13 = (const char *)a1[7];
  v14 = *__error();
  v15 = a1[9];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    if (v13)
      v16 = v13;
    else
      v16 = "[anonymous]";
    *(_DWORD *)buf = 136446210;
    v19 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%{public}s: Removed all launch agents.", buf, 0xCu);
  }
  *__error() = v14;
  return sub_1000361BC(a1);
}

void sub_100036470(char *a1, _QWORD *a2)
{
  char *v4;
  int v5;
  int v6;
  const char *v7;
  int v8;
  NSObject *v9;
  const char *v10;
  char *v11;
  char *v12;
  int v13;
  const char *v14;
  __int16 v15;
  char *v16;
  __int16 v17;
  int v18;

  v4 = a1 + 8;
  v5 = sub_1000134AC(a1 + 8, (uint64_t)(a1 + 1168));
  if (v5)
  {
    v6 = v5;
    v7 = (const char *)a2[7];
    v8 = *__error();
    v9 = a2[9];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = "[anonymous]";
      v13 = 136446722;
      if (v7)
        v10 = v7;
      v14 = v10;
      v15 = 2080;
      v16 = v4;
      v17 = 1024;
      v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s: failed to unbootstrap agent: %s: %{darwin.errno}d", (uint8_t *)&v13, 0x1Cu);
    }
    *__error() = v8;
  }
  v11 = (char *)a2[58];
  if (v11 == a1)
  {
    v12 = (char *)(a2 + 58);
  }
  else
  {
    do
    {
      v12 = v11;
      v11 = *(char **)v11;
    }
    while (v11 != a1);
  }
  *(_QWORD *)v12 = *(_QWORD *)a1;
  *(_QWORD *)a1 = -1;
  sub_1000361BC((uint64_t)a2);
  free(a1);
}

uint64_t sub_1000365D8(int a1)
{
  uint64_t result;
  int v2;

  v2 = a1;
  result = sysctlbyname("kern.proc_rsr_in_progress", 0, 0, &v2, 4uLL);
  if ((_DWORD)result)
    return *__error();
  return result;
}

uint64_t sub_100036620(_QWORD *a1, uint64_t a2, _BYTE *a3)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  int v10;
  NSObject *v11;
  const char *v12;
  unint64_t v13;
  char *v14;
  char *v15;
  const char *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  const char *v26;
  int v27;
  NSObject *v28;
  const char *v29;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  _QWORD *v34;
  _QWORD *v35;
  _BOOL8 v36;
  const char *v37;
  NSObject *v38;
  const char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  const char *v44;
  int v45;
  NSObject *v46;
  const char *v47;
  const char *v48;
  int v49;
  NSObject *v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  const char *v55;
  _QWORD *v56;
  uint64_t v57;
  const char *v58;
  int v59;
  NSObject *v60;
  const char *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  NSObject *v66;
  const char *v67;
  void *v68;
  const char *v69;
  NSObject *v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  NSObject *v74;
  const char *v75;
  __int128 v76;
  _QWORD *v77;
  _QWORD *v78;
  const char *v79;
  int v80;
  NSObject *v81;
  const char *v82;
  int v83;
  int v84;
  int v85;
  int v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  void *v91;
  uint8_t buf[4];
  const char *v93;
  __int16 v94;
  const char *v95;
  __int16 v96;
  char *v97;
  __int16 v98;
  uint64_t v99;
  __int16 v100;
  uint64_t v101;
  __int16 v102;
  int v103;

  v91 = 0;
  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v6 = (_QWORD *)sub_1000116F4(a2, 0);
  v7 = sub_100011758((uint64_t)v6);
  if ((_DWORD)v7)
  {
    v8 = v7;
    v9 = (const char *)a1[7];
    v10 = *__error();
    v11 = a1[9];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = "[anonymous]";
      if (v9)
        v12 = v9;
      *(_DWORD *)buf = 136446466;
      v93 = v12;
      v94 = 1024;
      LODWORD(v95) = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}s: failed to resolve proc: %{darwin.errno}d", buf, 0x12u);
    }
    *__error() = v10;
    goto LABEL_25;
  }
  v13 = *(_QWORD *)(a2 + 24);
  if (v13 > 4)
  {
LABEL_24:
    v8 = 22;
    goto LABEL_25;
  }
  v14 = off_1000571E8[v13];
  v15 = (&off_100057238)[v13];
  v8 = sub_100012380((uint64_t)v6, (&off_100057210)[v13]);
  v16 = (const char *)a1[7];
  v83 = *__error();
  v17 = a1[9];
  if ((_DWORD)v8)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = "[anonymous]";
      v19 = v6[8];
      v20 = v6[9];
      if (v16)
        v18 = v16;
      *(_DWORD *)buf = 136447490;
      v93 = v18;
      v94 = 2080;
      v95 = v14;
      v96 = 2080;
      v97 = v15;
      v98 = 2080;
      v99 = v19;
      v100 = 2080;
      v101 = v20;
      v102 = 1024;
      v103 = v8;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}s: proc not entitled for %s: entitlement = %s, proc = %s, signing id = %s: %{darwin.errno}d", buf, 0x3Au);
    }
    *__error() = v83;
    goto LABEL_25;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v21 = "[anonymous]";
    if (v16)
      v21 = v16;
    v22 = v6[8];
    v23 = v6[9];
    *(_DWORD *)buf = 136447234;
    v93 = v21;
    v94 = 2080;
    v95 = v14;
    v96 = 2080;
    v97 = v15;
    v98 = 2080;
    v99 = v22;
    v100 = 2080;
    v101 = v23;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%{public}s: authorized proc for %s: entitlement = %s, proc = %s, signing id = %s", buf, 0x34u);
  }
  *__error() = v83;
  v8 = 45;
  switch(v13)
  {
    case 0uLL:
      v24 = (_QWORD *)sub_1000116F4(a2, 0);
      v25 = sub_100011758((uint64_t)v24);
      if ((_DWORD)v25)
      {
        v8 = v25;
        v26 = (const char *)a1[7];
        v27 = *__error();
        v28 = a1[9];
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v29 = "[anonymous]";
          if (v26)
            v29 = v26;
          *(_DWORD *)buf = 136446466;
          v93 = v29;
          v94 = 1024;
          LODWORD(v95) = v8;
          v30 = "%{public}s: failed to resolve proc: %{darwin.errno}d";
          v31 = v28;
          v32 = 18;
LABEL_39:
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, v30, buf, v32);
          goto LABEL_40;
        }
        goto LABEL_40;
      }
      v36 = sub_100012380((uint64_t)v24, "com.apple.private.security.cryptex.install");
      if (v36)
      {
        v8 = v36;
        v37 = (const char *)a1[7];
        v27 = *__error();
        v38 = a1[9];
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          v39 = "[anonymous]";
          if (v37)
            v39 = v37;
          v40 = (char *)v24[8];
          v41 = v24[9];
          *(_DWORD *)buf = 136447234;
          v93 = v39;
          v94 = 2080;
          v95 = "com.apple.private.security.cryptex.install";
          v96 = 2080;
          v97 = v40;
          v98 = 2080;
          v99 = v41;
          v100 = 1024;
          LODWORD(v101) = v8;
          v30 = "%{public}s: proc not entitled for install: entitlement = %s, proc = %s, signing id = %s: %{darwin.errno}d";
          v31 = v38;
          v32 = 48;
          goto LABEL_39;
        }
LABEL_40:
        *__error() = v27;
        goto LABEL_41;
      }
      v42 = codex_install_unpack(a2, &v87);
      if (!(_DWORD)v42)
      {
        if (*((_QWORD *)&v88 + 1) >= 0xCuLL)
        {
          v48 = (const char *)a1[7];
          v49 = *__error();
          v50 = a1[9];
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            v51 = "[anonymous]";
            if (v48)
              v51 = v48;
            *(_DWORD *)buf = 136446722;
            v93 = v51;
            v94 = 2048;
            v95 = (const char *)*((_QWORD *)&v88 + 1);
            v96 = 1024;
            LODWORD(v97) = 34;
            v52 = "%{public}s: dmg type index invalid: %lld: %{darwin.errno}d";
LABEL_59:
            _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, v52, buf, 0x1Cu);
            goto LABEL_60;
          }
          goto LABEL_60;
        }
        v53 = v89;
        if ((unint64_t)v89 >= 3)
        {
          v54 = (const char *)a1[7];
          v49 = *__error();
          v50 = a1[9];
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            v55 = "[anonymous]";
            if (v54)
              v55 = v54;
            *(_DWORD *)buf = 136446722;
            v93 = v55;
            v94 = 2048;
            v95 = (const char *)v89;
            v96 = 1024;
            LODWORD(v97) = 34;
            v52 = "%{public}s: authentication type invalid: %lld: %{darwin.errno}d";
            goto LABEL_59;
          }
LABEL_60:
          *__error() = v49;
          v8 = 34;
          goto LABEL_41;
        }
        v56 = (_QWORD *)cryptex_core_create(0);
        v57 = cryptex_core_set_assets_from_fds(v56, *((_QWORD *)&v88 + 1), &v87, (char *)&v87 + 4, (char *)&v87 + 8, (unint64_t)&v87 | 0xC, &v88);
        if ((_DWORD)v57)
        {
          v8 = v57;
          v58 = (const char *)a1[7];
          v59 = *__error();
          v60 = a1[9];
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          {
            v61 = "[anonymous]";
            if (v58)
              v61 = v58;
            *(_DWORD *)buf = 136446466;
            v93 = v61;
            v94 = 1024;
            LODWORD(v95) = v8;
            _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "%{public}s: set assets to core from fds failed: %{darwin.errno}d", buf, 0x12u);
          }
          *__error() = v59;
LABEL_105:
          if (v56)
            os_release(v56);
          goto LABEL_41;
        }
        v62 = v91;
        if (cryptex_core_is_cryptex1(v56))
        {
          v63 = cryptex_core_cx1_properties_create_with_xpc_dictionary(v62);
          if (!v63)
          {
            v79 = (const char *)a1[7];
            v80 = *__error();
            v81 = a1[9];
            if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
            {
              v82 = "[anonymous]";
              if (v79)
                v82 = v79;
              *(_DWORD *)buf = 136446466;
              v93 = v82;
              v94 = 1024;
              LODWORD(v95) = 22;
              _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "%{public}s: failed to parse Cryptex1 properties.: %{darwin.errno}d", buf, 0x12u);
            }
            v68 = 0;
            *__error() = v80;
            v8 = 22;
            goto LABEL_101;
          }
          v64 = (void *)v63;
          cryptex_core_set_cryptex1_properties(v56);
        }
        else
        {
          v64 = 0;
        }
        if (v53 == 2)
        {
          v69 = (const char *)a1[7];
          v85 = *__error();
          v70 = a1[9];
          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
          {
            v71 = "[anonymous]";
            if (v69)
              v71 = v69;
            *(_DWORD *)buf = 136446210;
            v93 = v71;
            _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEBUG, "%{public}s: using NO signing service", buf, 0xCu);
          }
          *__error() = v85;
          v72 = 4;
        }
        else
        {
          if (v53 != 1)
          {
            if (v53)
            {
              v68 = 0;
              v8 = 22;
LABEL_94:
              if (v64)
                os_release(v64);
LABEL_101:
              if (v62)
                os_release(v62);
              if (v68)
                os_release(v68);
              goto LABEL_105;
            }
            v65 = (const char *)a1[7];
            v84 = *__error();
            v66 = a1[9];
            if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
            {
              v67 = "[anonymous]";
              if (v65)
                v67 = v65;
              *(_DWORD *)buf = 136446210;
              v93 = v67;
              _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEBUG, "%{public}s: using default signing service", buf, 0xCu);
            }
            v68 = 0;
            *__error() = v84;
LABEL_90:
            v76 = v90;
            v56[6] = *((_QWORD *)&v89 + 1);
            v56[7] = *((_QWORD *)&v76 + 1);
            if ((_QWORD)v76)
              v56[5] |= 2uLL;
            v77 = sub_10002A74C(a1, (_BYTE *)a2, a3);
            v78 = sub_100037F90(a1, (uint64_t)v77, 0, 0, 0, (uint64_t)sub_100037028);
            sub_100016474(a1, v56, (uint64_t)v78);
            v8 = 36;
            goto LABEL_94;
          }
          v73 = (const char *)a1[7];
          v86 = *__error();
          v74 = a1[9];
          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
          {
            v75 = "[anonymous]";
            if (v73)
              v75 = v73;
            *(_DWORD *)buf = 136446210;
            v93 = v75;
            _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEBUG, "%{public}s: using supplemental signing service", buf, 0xCu);
          }
          *__error() = v86;
          v72 = 1;
        }
        v68 = (void *)cryptex_host_create(0, v72);
        cryptex_core_attach_host(v56, v68);
        goto LABEL_90;
      }
      v8 = v42;
      v43 = xpc_copy_description(*(xpc_object_t *)(a2 + 296));
      v44 = (const char *)a1[7];
      v45 = *__error();
      v46 = a1[9];
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        v47 = "[anonymous]";
        *(_DWORD *)buf = 136446722;
        if (v44)
          v47 = v44;
        v93 = v47;
        v94 = 2080;
        v95 = v43;
        v96 = 1024;
        LODWORD(v97) = v8;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%{public}s: failed to unpack ipc: %s: %{darwin.errno}d", buf, 0x1Cu);
      }
      *__error() = v45;
      free(v43);
LABEL_41:
      if (v24)
        os_release(v24);
LABEL_25:
      if (v6)
        os_release(v6);
      if (a1)
        os_release(a1);
      return v8;
    case 1uLL:
      v8 = codex_list_unpack(a2, &v87);
      if ((_DWORD)v8)
        goto LABEL_25;
      v35 = sub_10002A74C(a1, (_BYTE *)a2, a3);
      sub_100018134(a1, (uint64_t)v35, (uint64_t)sub_10003780C);
LABEL_33:
      v8 = 36;
      goto LABEL_25;
    case 2uLL:
      v34 = sub_10002A74C(a1, (_BYTE *)a2, a3);
      sub_100017FAC(a1, (uint64_t)v34, (uint64_t)sub_100037870);
      goto LABEL_33;
    case 3uLL:
    case 4uLL:
      goto LABEL_25;
    default:
      goto LABEL_24;
  }
}

void sub_100037028(uint64_t a1, void *a2, const void *a3, uint64_t a4)
{
  void *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  const char *v16;
  char *v17;
  const char *v18;
  int v19;
  CFIndex v20;
  const void *v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  const char *v26;
  const char *v27;
  __CFError *v28;
  uint64_t v29;
  int v30;
  const char *v31;
  __int16 v32;
  int v33;

  v29 = a4;
  if (a3)
  {
    v7 = *(void **)(a1 + 72);
    if (v7)
    {
      if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR))
        v8 = 3;
      else
        v8 = 2;
      v9 = *(const char **)(a1 + 56);
      if (!v9)
        v9 = "[anonymous]";
      v30 = 136446210;
      v31 = v9;
      v10 = v7;
    }
    else
    {
      v16 = *(const char **)(a1 + 56);
      if (!v16)
        v16 = "[anonymous]";
      v30 = 136446210;
      v31 = v16;
      v10 = &_os_log_default;
      v8 = 2;
    }
    v17 = (char *)_os_log_send_and_compose_impl(v8, 0, 0, 0, &_mh_execute_header, v10, 16);
    v18 = "com.apple.security.cryptex";
    v19 = 171;
    v20 = 14;
    v21 = a3;
  }
  else
  {
    v11 = *(_DWORD *)(a4 + 8);
    if (v11)
    {
      v12 = *(void **)(a1 + 72);
      if (v12)
      {
        if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR))
          v13 = 3;
        else
          v13 = 2;
        v14 = *(const char **)(a1 + 56);
        if (!v14)
          v14 = "[anonymous]";
        v30 = 136446466;
        v31 = v14;
        v32 = 1024;
        v33 = v11;
        v15 = v12;
      }
      else
      {
        v26 = *(const char **)(a1 + 56);
        if (!v26)
          v26 = "[anonymous]";
        v30 = 136446466;
        v31 = v26;
        v32 = 1024;
        v33 = v11;
        v15 = &_os_log_default;
        v13 = 2;
      }
      v17 = (char *)_os_log_send_and_compose_impl(v13, 0, 0, 0, &_mh_execute_header, v15, 16);
      v18 = "com.apple.security.cryptex.posix";
      v19 = 179;
      v20 = v11;
      v21 = 0;
    }
    else
    {
      if (!*(_QWORD *)(a4 + 16))
      {
        sub_100017648(a1, a2, a4, (uint64_t)sub_100037424);
        return;
      }
      v22 = *(void **)(a1 + 72);
      if (v22)
      {
        if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR))
          v23 = 3;
        else
          v23 = 2;
        v24 = *(const char **)(a1 + 56);
        if (!v24)
          v24 = "[anonymous]";
        v30 = 136446210;
        v31 = v24;
        v25 = v22;
      }
      else
      {
        v27 = *(const char **)(a1 + 56);
        if (!v27)
          v27 = "[anonymous]";
        v30 = 136446210;
        v31 = v27;
        v25 = &_os_log_default;
        v23 = 2;
      }
      v17 = (char *)_os_log_send_and_compose_impl(v23, 0, 0, 0, &_mh_execute_header, v25, 16);
      v21 = *(const void **)(a4 + 16);
      v18 = "com.apple.security.cryptex";
      v19 = 187;
      v20 = 4;
    }
  }
  v28 = sub_10000A6F8("_codex_rpc_install_continue2", "sub_codex.c", v19, v18, v20, v21, v17);
  free(v17);
  if (v28)
  {
    sub_10002A7E4((uint64_t *)(a4 + 24), v28);
    sub_100038008(&v29);
    CFRelease(v28);
  }
}

void sub_100037424(uint64_t a1, uint64_t a2, const void *a3, uint64_t a4)
{
  int v8;
  NSObject *v9;
  uint64_t *v10;
  const char *v11;
  int v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t v18[4];
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  _OWORD buf[2];
  uint64_t v25;

  v17 = a4;
  if (a3)
  {
    v8 = *__error();
    v9 = *(NSObject **)(a1 + 72);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf[0]) = 138412290;
      *(_QWORD *)((char *)buf + 4) = a3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "bootstrap failed, unbootstrapping: %@", (uint8_t *)buf, 0xCu);
    }
    *__error() = v8;
    *(_QWORD *)(a4 + 16) = CFRetain(a3);
    sub_10001783C(a1, (void *)a2, 1uLL, a4, (uint64_t)sub_1000375F0);
  }
  else
  {
    *(_QWORD *)&buf[0] = *(_QWORD *)(a2 + 208);
    *((_QWORD *)&buf[0] + 1) = **(_QWORD **)(a2 + 224);
    buf[1] = *(_OWORD *)(a2 + 424);
    v25 = *(_QWORD *)(a2 + 416);
    v10 = (uint64_t *)(a4 + 24);
    codex_install_reply_pack(buf, *(_QWORD *)(*(_QWORD *)(a4 + 24) + 32));
    v11 = *(const char **)(a1 + 56);
    v12 = *__error();
    v13 = *(NSObject **)(a1 + 72);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = "[anonymous]";
      if (v11)
        v14 = v11;
      v15 = *(_QWORD *)(a2 + 208);
      v16 = *(_QWORD *)(a2 + 416);
      *(_DWORD *)v18 = 136446722;
      v19 = v14;
      v20 = 2080;
      v21 = v15;
      v22 = 2080;
      v23 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%{public}s: replying: name = %s, mnt path = %s", v18, 0x20u);
    }
    *__error() = v12;
    sub_10002A79C(v10, 0);
    sub_100038008(&v17);
  }
}

void sub_1000375F0(dispatch_queue_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  int v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  int v14;
  uint64_t v15;

  v8 = *__error();
  v9 = a1[9];
  if (a3)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412290;
      v15 = a3;
      v10 = "unbootstrap: %@";
      v11 = v9;
      v12 = OS_LOG_TYPE_ERROR;
      v13 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, (uint8_t *)&v14, v13);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v14) = 0;
    v10 = "unbootstrap [no error]";
    v11 = v9;
    v12 = OS_LOG_TYPE_DEBUG;
    v13 = 2;
    goto LABEL_6;
  }
  *__error() = v8;
  sub_100016EB4(a1, a2, a4, (uint64_t)sub_100037704);
}

void sub_100037704(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;

  v13 = a4;
  v7 = *__error();
  v8 = *(NSObject **)(a1 + 72);
  if (a3)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = a3;
      v9 = "uninstall: %@";
      v10 = v8;
      v11 = OS_LOG_TYPE_ERROR;
      v12 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, buf, v12);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    v9 = "uninstall [no error]";
    v10 = v8;
    v11 = OS_LOG_TYPE_DEBUG;
    v12 = 2;
    goto LABEL_6;
  }
  *__error() = v7;
  sub_10002A7E4((uint64_t *)(a4 + 24), *(__CFError **)(a4 + 16));
  sub_100038008(&v13);
}

void sub_10003780C(int a1, int a2, xpc_object_t object, uint64_t a4)
{
  xpc_object_t v6;
  uint64_t v7;

  v7 = a4;
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_array)
  {
    v6 = object;
    codex_list_reply_pack(&v6, *(_QWORD *)(a4 + 32));
    sub_10002A79C(&v7, 0);
  }
  else
  {
    __break(1u);
  }
}

void sub_100037870(uint64_t a1, int a2, uint64_t a3)
{
  const char *v5;
  int v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;

  v9 = a3;
  if (a2)
  {
    v5 = *(const char **)(a1 + 56);
    v6 = *__error();
    v7 = *(NSObject **)(a1 + 72);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = "[anonymous]";
      if (v5)
        v8 = v5;
      *(_DWORD *)buf = 136446466;
      v11 = v8;
      v12 = 1024;
      v13 = a2;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s: codex lockdown failed: %{darwin.errno}d", buf, 0x12u);
    }
    *__error() = v6;
  }
  sub_10002A79C(&v9, a2);
}

void sub_100037958(void *a1)
{
  id v1;
  void *v2;
  xpc_connection_t remote_connection;
  _xpc_connection_s *v4;
  const char *string;
  uint64_t v6;
  pid_t pid;
  int v8;
  id v9;
  NSObject *v10;
  pid_t v11;
  int v12;
  id v13;
  NSObject *v14;
  pid_t v15;
  int v16;
  id v17;
  NSObject *v18;
  pid_t v19;
  int v20;
  __int128 *p_buffer;
  __int16 v22;
  pid_t v23;
  __int16 v24;
  uint64_t v25;
  __int128 buffer;
  __int128 v27;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    remote_connection = xpc_dictionary_get_remote_connection(v1);
    v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
    string = xpc_dictionary_get_string(v2, "cryptex_name");
    if (string)
    {
      v6 = (uint64_t)string;
      buffer = *(_OWORD *)"unknown";
      v27 = unk_100044D95;
      pid = xpc_connection_get_pid(v4);
      proc_name(pid, &buffer, 0x20u);
      v8 = *__error();
      v9 = sub_100037BCC();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        if (v4)
          v11 = xpc_connection_get_pid(v4);
        else
          v11 = -1;
        v20 = 136315650;
        p_buffer = &buffer;
        v22 = 1024;
        v23 = v11;
        v24 = 2080;
        v25 = v6;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "XPC client <process=%s pid=%d>: Blocking client during upgrade for cryptex '%s'.", (uint8_t *)&v20, 0x1Cu);
      }

      *__error() = v8;
      sub_1000064DC(v6, (uint64_t)v2, (uint64_t)sub_100037C0C);
    }
    else
    {
      buffer = *(_OWORD *)"unknown";
      v27 = unk_100044D95;
      v15 = xpc_connection_get_pid(v4);
      proc_name(v15, &buffer, 0x20u);
      v16 = *__error();
      v17 = sub_100037BCC();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        if (v4)
          v19 = xpc_connection_get_pid(v4);
        else
          v19 = -1;
        v20 = 136315394;
        p_buffer = &buffer;
        v22 = 1024;
        v23 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "XPC client <process=%s pid=%d>: Client did not provide the name of a cryptex to block on.", (uint8_t *)&v20, 0x12u);
      }

      *__error() = v16;
      sub_100037C0C(v2, 0);
    }

  }
  else
  {
    v12 = *__error();
    v13 = sub_100037BCC();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buffer) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Invalid input.", (uint8_t *)&buffer, 2u);
    }

    *__error() = v12;
  }

}

id sub_100037BCC()
{
  if (qword_10005A8B0 != -1)
    dispatch_once(&qword_10005A8B0, &stru_100057260);
  return (id)qword_10005A8A8;
}

void sub_100037C0C(xpc_object_t xdict, uint64_t a2)
{
  xpc_connection_t remote_connection;
  _xpc_connection_s *v5;
  const char *string;
  const char *v7;
  pid_t pid;
  int v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  pid_t v13;
  int v14;
  id v15;
  NSObject *v16;
  pid_t v17;
  const char *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint32_t v21;
  pid_t v22;
  int v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  pid_t v27;
  pid_t v28;
  const char *v29;
  NSObject *v30;
  os_log_type_t v31;
  uint32_t v32;
  xpc_object_t reply;
  _BYTE v34[38];
  _BYTE buffer[32];

  if (xdict)
  {
    remote_connection = xpc_dictionary_get_remote_connection(xdict);
    v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
    string = xpc_dictionary_get_string(xdict, "cryptex_name");
    if (!string)
      goto LABEL_19;
    v7 = string;
    *(_OWORD *)buffer = *(_OWORD *)"unknown";
    *(_OWORD *)&buffer[16] = unk_100044D95;
    pid = xpc_connection_get_pid(v5);
    proc_name(pid, buffer, 0x20u);
    v9 = *__error();
    v10 = sub_100037BCC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = v11;
    if (a2)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        if (v5)
          v13 = xpc_connection_get_pid(v5);
        else
          v13 = -1;
        *(_DWORD *)v34 = 136315906;
        *(_QWORD *)&v34[4] = buffer;
        *(_WORD *)&v34[12] = 1024;
        *(_DWORD *)&v34[14] = v13;
        *(_WORD *)&v34[18] = 2080;
        *(_QWORD *)&v34[20] = v7;
        *(_WORD *)&v34[28] = 2112;
        *(_QWORD *)&v34[30] = a2;
        v18 = "XPC client <process=%s pid=%d>: Upgrade for cryptex '%s' has finished.: %@";
        v19 = v12;
        v20 = OS_LOG_TYPE_ERROR;
        v21 = 38;
LABEL_17:
        _os_log_impl((void *)&_mh_execute_header, v19, v20, v18, v34, v21);
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      if (v5)
        v17 = xpc_connection_get_pid(v5);
      else
        v17 = -1;
      *(_DWORD *)v34 = 136315650;
      *(_QWORD *)&v34[4] = buffer;
      *(_WORD *)&v34[12] = 1024;
      *(_DWORD *)&v34[14] = v17;
      *(_WORD *)&v34[18] = 2080;
      *(_QWORD *)&v34[20] = v7;
      v18 = "XPC client <process=%s pid=%d>: Upgrade for cryptex '%s' has finished. [no error]";
      v19 = v12;
      v20 = OS_LOG_TYPE_DEBUG;
      v21 = 28;
      goto LABEL_17;
    }

    *__error() = v9;
LABEL_19:
    *(_OWORD *)v34 = *(_OWORD *)"unknown";
    *(_OWORD *)&v34[16] = unk_100044D95;
    v22 = xpc_connection_get_pid(v5);
    proc_name(v22, v34, 0x20u);
    v23 = *__error();
    v24 = sub_100037BCC();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    v26 = v25;
    if (a2)
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        if (v5)
          v27 = xpc_connection_get_pid(v5);
        else
          v27 = -1;
        *(_DWORD *)buffer = 136315650;
        *(_QWORD *)&buffer[4] = v34;
        *(_WORD *)&buffer[12] = 1024;
        *(_DWORD *)&buffer[14] = v27;
        *(_WORD *)&buffer[18] = 2112;
        *(_QWORD *)&buffer[20] = a2;
        v29 = "XPC client <process=%s pid=%d>: Unblocking client.: %@";
        v30 = v26;
        v31 = OS_LOG_TYPE_ERROR;
        v32 = 28;
LABEL_30:
        _os_log_impl((void *)&_mh_execute_header, v30, v31, v29, buffer, v32);
      }
    }
    else if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      if (v5)
        v28 = xpc_connection_get_pid(v5);
      else
        v28 = -1;
      *(_DWORD *)buffer = 136315394;
      *(_QWORD *)&buffer[4] = v34;
      *(_WORD *)&buffer[12] = 1024;
      *(_DWORD *)&buffer[14] = v28;
      v29 = "XPC client <process=%s pid=%d>: Unblocking client. [no error]";
      v30 = v26;
      v31 = OS_LOG_TYPE_DEBUG;
      v32 = 18;
      goto LABEL_30;
    }

    *__error() = v23;
    reply = xpc_dictionary_create_reply(xdict);
    xpc_dictionary_send_reply(reply);

    goto LABEL_32;
  }
  v14 = *__error();
  v15 = sub_100037BCC();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v34 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Invalid input.", v34, 2u);
  }

  *__error() = v14;
LABEL_32:

}

void sub_100037F60(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.libcryptex", "upgrade_sub_trampoline");
  v2 = (void *)qword_10005A8A8;
  qword_10005A8A8 = (uint64_t)v1;

}

_QWORD *sub_100037F90(void *a1, uint64_t a2, void *a3, int a4, void *a5, uint64_t a6)
{
  _QWORD *v11;

  v11 = sub_10003C89C(a1, 0x40uLL);
  *((_DWORD *)v11 + 12) = a4;
  v11[3] = a2;
  v11[4] = a3;
  if (a3)
    os_retain(a3);
  v11[7] = 0;
  if (a5)
    v11[7] = xpc_retain(a5);
  v11[5] = a6;
  return v11;
}

void sub_100038008(uint64_t *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  if (a1)
  {
    v2 = *a1;
    if (*(_QWORD *)(*a1 + 24))
      sub_1000410A0();
    v3 = *(void **)(v2 + 32);
    if (v3)
    {
      os_release(v3);
      *(_QWORD *)(v2 + 32) = 0;
    }
    v4 = *(void **)(v2 + 56);
    if (v4)
    {
      xpc_release(v4);
      *(_QWORD *)(v2 + 56) = 0;
    }
    sub_10003C998((void **)v2);
    *a1 = 0;
  }
}

id sub_100038064(uint64_t a1)
{
  _BOOL8 v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v10[16];

  if (a1)
  {
    v1 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v1)
      sub_1000410B8(v1, v2, v3, v4, v5, v6, v7, v8);
    return 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Using system domain", v10, 2u);
    }
    return (id)objc_claimAutoreleasedReturnValue(+[OSLaunchdDomain currentDomain](OSLaunchdDomain, "currentDomain"));
  }
}

uint64_t sub_1000380F4()
{
  return 0;
}

uint64_t sub_1000380FC(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 v11;
  id v12;
  id v14;
  uint8_t buf[4];
  int v16;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[OSLaunchdDomain domainForRoleAccountUser:](OSLaunchdDomain, "domainForRoleAccountUser:", a1));
  if (v2)
  {
    v3 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      sub_1000411B0(a1, v4, v5, v6, v7, v8, v9, v10);
    v3 = 33;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v16 = a1;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Uncorking session for uid %d", buf, 8u);
  }
  v14 = 0;
  v11 = objc_msgSend(v2, "unpendLaunches:", &v14);
  v12 = v14;
  if ((v11 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100041130(v12);
    v3 = 22;
  }

  return v3;
}

uint64_t sub_10003823C(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  const char *v15;
  unsigned __int8 v16;
  id v17;
  id v19;
  uint8_t buf[4];
  int v21;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[OSLaunchdDomain domainForRoleAccountUser:](OSLaunchdDomain, "domainForRoleAccountUser:", a1));
  if (v4)
  {
    v5 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      sub_1000411B0(a1, v6, v7, v8, v9, v10, v11, v12);
    v5 = 33;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Shutting down process monitoring", buf, 2u);
  }
  v13 = +[OSLaunchdJob copyJobWithLabel:domain:](OSLaunchdJob, "copyJobWithLabel:domain:", a2, v4);
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "cancelMonitor");
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v15 = "Shut down process monitoring";
  }
  else
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v15 = "Couldn't find job to stop it from being monitored";
  }
  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v15, buf, 2u);
LABEL_14:
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v21 = a1;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Closing domain for uid %d", buf, 8u);
  }
  v19 = 0;
  v16 = objc_msgSend(v4, "initiateRemoval:", &v19);
  v17 = v19;
  if ((v16 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      sub_10004121C(v17);
    v5 = 22;
  }

  return v5;
}

uint64_t sub_100038464(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v4;
  id v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  id v18;
  uint8_t buf[16];

  v4 = a3;
  v5 = sub_100038064(0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = *__error();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Shutting down process monitoring", buf, 2u);
  }
  *__error() = v7;
  v8 = +[OSLaunchdJob copyJobWithLabel:domain:](OSLaunchdJob, "copyJobWithLabel:domain:", a2, v6);
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "cancelMonitor");
    v10 = *__error();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Shut down process monitoring", buf, 2u);
    }
    *__error() = v10;
    v18 = 0;
    objc_msgSend(v9, "remove:", &v18);
    v11 = v18;
    if (v11)
    {
      v12 = v11;
      if (objc_msgSend(v11, "code") == (id)36)
      {
        v13 = *__error();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Removing launchd job", buf, 2u);
        }
        *__error() = v13;

        v14 = 0;
      }
      else
      {
        v14 = (uint64_t)objc_msgSend(v12, "code");

      }
    }
    else
    {
      v16 = *__error();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Removed launchd job", buf, 2u);
      }
      v14 = 0;
      *__error() = v16;
    }
  }
  else
  {
    v15 = *__error();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Couldn't find job to stop it from being monitored", buf, 2u);
    }
    *__error() = v15;
    v14 = 3;
  }

  return v14;
}

CFErrorRef sub_1000386A4(void *a1, int a2, uint64_t a3)
{
  id v4;
  xpc_object_t array;
  const char *string;
  id v7;
  void *v8;
  xpc_object_t empty;
  uint64_t v10;
  char *v11;
  CFErrorRef v12;
  id v13;
  xpc_object_t v14;
  xpc_object_t v15;
  id v16;
  xpc_object_t value;
  void *v18;
  BOOL v19;
  BOOL v20;
  char uint64;
  xpc_object_t dictionary;
  void *v23;
  id v24;
  void *v25;
  unsigned __int8 v26;
  const char *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  _BOOL4 v32;
  void *v33;
  uint64_t v34;
  char *v35;
  uint64_t object;
  id v39;
  _QWORD v40[4];
  id v41;
  uint64_t v42;
  BOOL v43;
  char v44;
  BOOL v45;
  uint8_t buf[4];
  _BYTE v47[18];
  __int16 v48;
  int v49;

  v4 = a1;
  array = xpc_dictionary_get_array(v4, "_ManagedBy");
  object = objc_claimAutoreleasedReturnValue(array);
  string = xpc_dictionary_get_string(v4, "_ManagedBy");
  v7 = sub_100038064(0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      v10 = 3;
    else
      v10 = 2;
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v47 = a2;
    *(_WORD *)&v47[4] = 1024;
    *(_DWORD *)&v47[6] = 33;
    v11 = (char *)_os_log_send_and_compose_impl(v10, 0, 0, 0, &_mh_execute_header, &_os_log_default, 16);
    v12 = sub_10000A6F8("launchd_session_add_job", "launchd_session.m", 321, "com.apple.security.cryptex.posix", 33, 0, v11);
    free(v11);
    v13 = 0;
    goto LABEL_35;
  }
  if (object | (unint64_t)string)
  {
    if (object)
    {
      empty = xpc_copy((xpc_object_t)object);
    }
    else
    {
      empty = xpc_array_create_empty();
      v14 = xpc_string_create(string);
      xpc_array_append_value(empty, v14);

    }
    v15 = xpc_string_create("com.apple.security.cryptexd");
    xpc_array_append_value(empty, v15);

    xpc_dictionary_set_value(v4, "_ManagedBy", empty);
  }
  else
  {
    xpc_dictionary_set_string(v4, "_ManagedBy", "com.apple.security.cryptexd");
  }
  sub_10003BF6C(v4, "_PersistToBootMode", "rem");
  v16 = objc_msgSend(objc_alloc((Class)OSLaunchdJob), "initWithPlist:domain:", v4, v8);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v47 = a2;
    *(_WORD *)&v47[4] = 2112;
    *(_QWORD *)&v47[6] = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Submitting job for uid %d : %@", buf, 0x12u);
  }
  value = xpc_dictionary_get_value(v4, "CryptexSessionKeystone");
  v18 = (void *)objc_claimAutoreleasedReturnValue(value);
  if (xpc_get_type(v18) == (xpc_type_t)&_xpc_type_BOOL)
  {
    v19 = xpc_dictionary_get_BOOL(v4, "CryptexSessionKeystone");
    goto LABEL_22;
  }
  if (xpc_get_type(v18) != (xpc_type_t)&_xpc_type_dictionary)
  {
    if (v18
      && xpc_get_type(v18) != (xpc_type_t)&_xpc_type_null
      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_1000412A8();
    }
    v19 = 0;
LABEL_22:
    v20 = 0;
    uint64 = 0;
    if (!a3)
      goto LABEL_26;
    goto LABEL_25;
  }
  dictionary = xpc_dictionary_get_dictionary(v4, "CryptexSessionKeystone");
  v23 = (void *)objc_claimAutoreleasedReturnValue(dictionary);
  v20 = xpc_dictionary_get_BOOL(v23, "StopOnFailure");
  uint64 = xpc_dictionary_get_uint64(v23, "StopOnExitCode");

  v19 = 0;
  if (a3)
  {
LABEL_25:
    v24 = sub_10000DB48(a3);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100038C9C;
    v40[3] = &unk_100057288;
    v43 = v19;
    v44 = uint64;
    v41 = v16;
    v42 = a3;
    v45 = v20;
    objc_msgSend(v41, "monitorOnQueue:withHandler:", v25, v40);

  }
LABEL_26:
  v39 = 0;
  v26 = objc_msgSend(v16, "submit:", &v39);
  v13 = v39;
  if ((v26 & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v27 = xpc_dictionary_get_string(v4, "Label");
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "handle"));
      v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "UUIDString")));
      v30 = objc_msgSend(v29, "UTF8String");
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)v47 = v27;
      *(_WORD *)&v47[8] = 2080;
      *(_QWORD *)&v47[10] = v30;
      v48 = 1024;
      v49 = a2;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Submited job %s (UUID: %s) for uid %d", buf, 0x1Cu);

    }
    v12 = 0;
  }
  else
  {
    v31 = &_os_log_default;
    v32 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedDescription"));
    if (v32)
      v34 = 3;
    else
      v34 = 2;
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v47 = v33;
    *(_WORD *)&v47[8] = 1024;
    *(_DWORD *)&v47[10] = 22;
    v35 = (char *)_os_log_send_and_compose_impl(v34, 0, 0, 0, &_mh_execute_header, &_os_log_default, 16);

    v12 = sub_10000A6F8("launchd_session_add_job", "launchd_session.m", 421, "com.apple.security.cryptex.posix", 22, v13, v35);
    free(v35);
  }

LABEL_35:
  return v12;
}

void sub_100038C70(_Unwind_Exception *a1)
{
  void *v1;

  free(v1);
  _Unwind_Resume(a1);
}

void sub_100038C9C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unsigned __int16 v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  int v14;
  id v15;
  __int16 v16;
  unsigned int v17;
  __int16 v18;
  int v19;

  v3 = a2;
  if (objc_msgSend(v3, "state") == (id)4)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastExitStatus"));
    v5 = (unsigned __int16)objc_msgSend(v4, "wait4Status");

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "handle"));
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString")));
      v14 = 136315650;
      v15 = objc_msgSend(v7, "UTF8String");
      v16 = 1024;
      v17 = (v5 & 0x7F) == 0;
      v18 = 1024;
      v19 = HIBYTE(v5);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Cryptex Session process (uuid %s) exited (%d) with code: %hhu", (uint8_t *)&v14, 0x18u);

    }
    if (*(_BYTE *)(a1 + 48)
      || *(_BYTE *)(a1 + 49) && *(unsigned __int8 *)(a1 + 49) == HIBYTE(v5)
      || *(_BYTE *)(a1 + 50) && (v5 & 0xFF00) != 0)
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 2;
      v10 = HIBYTE(v5);
LABEL_17:
      sub_10000DAD0(v8, v9, v10);
    }
  }
  else if (objc_msgSend(v3, "state") == (id)3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "handle"));
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUIDString")));
      v14 = 136315394;
      v15 = objc_msgSend(v12, "UTF8String");
      v16 = 1024;
      v17 = objc_msgSend(v3, "lastSpawnError");
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Cryptex Session process (uuid %s) failed to launch with lastSpawnError: %d", (uint8_t *)&v14, 0x12u);

    }
    if (*(_BYTE *)(a1 + 48) || *(_BYTE *)(a1 + 50) || *(_BYTE *)(a1 + 49))
    {
      v13 = *(_QWORD *)(a1 + 40);
      v10 = (int)objc_msgSend(v3, "lastSpawnError");
      v8 = v13;
      v9 = 1;
      goto LABEL_17;
    }
  }

}

void sub_100038ED4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100038EE4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 8u);
}

double sub_100038F08(_OWORD *a1)
{
  double result;

  result = 0.0;
  a1[17] = 0u;
  a1[18] = 0u;
  a1[15] = 0u;
  a1[16] = 0u;
  a1[13] = 0u;
  a1[14] = 0u;
  a1[11] = 0u;
  a1[12] = 0u;
  a1[9] = 0u;
  a1[10] = 0u;
  a1[7] = 0u;
  a1[8] = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

size_t sub_100038F38(uint64_t a1, char *__s)
{
  size_t result;

  result = strlen(__s);
  *(_DWORD *)a1 |= 2u;
  *(_QWORD *)(a1 + 16) = __s;
  *(_QWORD *)(a1 + 24) = result;
  return result;
}

uint64_t sub_100038F70(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t result;

  v4 = os_simple_hash(*(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24));
  if ((*(_BYTE *)a2 & 2) == 0)
    sub_100039178();
  v5 = v4;
  result = sub_100039010(a1, *(const void **)(a2 + 16), *(_QWORD *)(a2 + 24));
  if (result)
    sub_1000391A8();
  *(_QWORD *)(a2 + 8) = *(_QWORD *)(a1 + 8 * (v5 % 0x25));
  *(_QWORD *)(a1 + 8 * (v5 % 0x25)) = a2;
  if ((*(_DWORD *)a2 & 1) != 0)
    sub_100039190();
  *(_DWORD *)a2 |= 1u;
  ++*(_QWORD *)(a1 + 296);
  return result;
}

uint64_t sub_100039010(uint64_t a1, const void *a2, size_t a3)
{
  uint64_t i;

  for (i = *(_QWORD *)(a1 + 8 * (os_simple_hash(a2, a3) % 0x25uLL)); i; i = *(_QWORD *)(i + 8))
  {
    if (*(_QWORD *)(i + 24) == a3 && !memcmp(*(const void **)(i + 16), a2, a3))
      break;
  }
  return i;
}

uint64_t sub_10003909C(uint64_t a1, char *__s)
{
  size_t v4;

  v4 = strlen(__s);
  return sub_100039010(a1, __s, v4);
}

uint64_t sub_1000390D0(uint64_t a1, uint64_t a2)
{
  return sub_100039010(a1, *(const void **)(a2 + 16), *(_QWORD *)(a2 + 24));
}

unint64_t sub_1000390DC(uint64_t a1, uint64_t a2)
{
  unint64_t result;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  result = os_simple_hash(*(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24));
  v5 = (uint64_t *)(a1 + 8 * (result % 0x25));
  v6 = *v5;
  if (*v5 != a2)
  {
    do
    {
      v7 = v6;
      v6 = *(_QWORD *)(v6 + 8);
    }
    while (v6 != a2);
    v5 = (uint64_t *)(v7 + 8);
  }
  *v5 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = -1;
  if ((*(_DWORD *)a2 & 1) == 0)
    sub_1000391C0();
  *(_DWORD *)a2 &= ~1u;
  --*(_QWORD *)(a1 + 296);
  return result;
}

void sub_100039178()
{
  _os_crash("unexpected failure: node not initialized");
  __break(1u);
}

void sub_100039190()
{
  _os_crash("probable data corruption: node already in hash");
  __break(1u);
}

void sub_1000391A8()
{
  _os_crash("unexpected failure: existing node not removed before insertion");
  __break(1u);
}

void sub_1000391C0()
{
  _os_crash("probable data corruption: node not in hash");
  __break(1u);
}

void sub_1000391D8(uint64_t a1, xpc_object_t a2, void *a3)
{
  xpc_object_t v6;
  uint64_t v7;
  void *v8;

  v6 = xpc_array_create(0, 0);
  if (a2)
    xpc_retain(a2);
  else
    a2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_value(a2, "argv", v6);
  xpc_dictionary_set_uint64(a2, "subsystem", *(_QWORD *)(a1 + 16));
  xpc_dictionary_set_uint64(a2, "routine", *(_QWORD *)(a1 + 24));
  xpc_dictionary_set_uint64(a2, "target-type", *(_QWORD *)(a1 + 32));
  v7 = *(_QWORD *)(a1 + 32);
  switch(v7)
  {
    case 2:
      xpc_dictionary_set_mach_send(a2, "target", *(unsigned int *)(a1 + 40));
      break;
    case 1:
      xpc_dictionary_set_string(a2, "target", (const char *)(a1 + 40));
      break;
    case 0:
      xpc_dictionary_set_uint64(a2, "target", *(_QWORD *)(a1 + 40));
      break;
  }
  *(_QWORD *)a1 = 1;
  if (a3)
    v8 = os_retain(a3);
  else
    v8 = &_os_log_default;
  *(_QWORD *)(a1 + 8) = v8;
  *(_QWORD *)(a1 + 296) = a2;
  *(_QWORD *)(a1 + 304) = v6;
  *(_DWORD *)(a1 + 312) = -1;
  *(_OWORD *)(a1 + 328) = 0u;
  *(_OWORD *)(a1 + 344) = 0u;
  if (v6)
    os_release(v6);
}

CFErrorRef sub_100039338(uint64_t a1, xpc_object_t xdict, NSObject *a3)
{
  xpc_object_t value;
  xpc_object_t v7;
  uint64_t v8;
  NSObject *v9;
  char *v10;
  const char *v11;
  int v12;
  CFIndex v13;
  CFTypeRef v14;
  CFErrorRef v15;
  xpc_object_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  xpc_object_t v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  xpc_object_t v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  xpc_object_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  NSObject *v40;
  const char *string_ptr;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  _OWORD v45[2];
  CFTypeRef cf;
  int v47;
  int v48;

  cf = 0;
  memset(v45, 0, sizeof(v45));
  value = xpc_dictionary_get_value(xdict, "argv");
  if (!value || (v7 = value, xpc_get_type(value) != (xpc_type_t)&_xpc_type_array))
  {
    if (a3)
    {
      if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
        v8 = 3;
      else
        v8 = 2;
      v47 = 67109120;
      v48 = 94;
      v9 = a3;
    }
    else
    {
      v47 = 67109120;
      v48 = 94;
      v9 = &_os_log_default;
      v8 = 2;
    }
    v10 = (char *)_os_log_send_and_compose_impl(v8, 0, 0, 0, &_mh_execute_header, v9, 16);
    v11 = "com.apple.security.cryptex.posix";
    v12 = 105;
LABEL_10:
    v13 = 94;
LABEL_11:
    v14 = 0;
    goto LABEL_12;
  }
  v17 = xpc_dictionary_get_value(xdict, "subsystem");
  if (!v17 || (v18 = v17, xpc_get_type(v17) != (xpc_type_t)&_xpc_type_uint64))
  {
    if (a3)
    {
      if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
        v19 = 3;
      else
        v19 = 2;
      v47 = 67109120;
      v48 = 94;
      v20 = a3;
    }
    else
    {
      v47 = 67109120;
      v48 = 94;
      v20 = &_os_log_default;
      v19 = 2;
    }
    v10 = (char *)_os_log_send_and_compose_impl(v19, 0, 0, 0, &_mh_execute_header, v20, 16);
    v11 = "com.apple.security.cryptex.posix";
    v12 = 113;
    goto LABEL_10;
  }
  v21 = xpc_dictionary_get_value(xdict, "routine");
  if (!v21 || (v22 = v21, xpc_get_type(v21) != (xpc_type_t)&_xpc_type_uint64))
  {
    if (a3)
    {
      if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
        v23 = 3;
      else
        v23 = 2;
      v47 = 67109120;
      v48 = 94;
      v24 = a3;
    }
    else
    {
      v47 = 67109120;
      v48 = 94;
      v24 = &_os_log_default;
      v23 = 2;
    }
    v10 = (char *)_os_log_send_and_compose_impl(v23, 0, 0, 0, &_mh_execute_header, v24, 16);
    v11 = "com.apple.security.cryptex.posix";
    v12 = 121;
    goto LABEL_10;
  }
  v25 = xpc_dictionary_get_value(xdict, "target-type");
  if (!v25 || (v26 = v25, xpc_get_type(v25) != (xpc_type_t)&_xpc_type_uint64))
  {
    if (a3)
    {
      if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
        v27 = 3;
      else
        v27 = 2;
      v47 = 67109120;
      v48 = 94;
      v28 = a3;
    }
    else
    {
      v47 = 67109120;
      v48 = 94;
      v28 = &_os_log_default;
      v27 = 2;
    }
    v10 = (char *)_os_log_send_and_compose_impl(v27, 0, 0, 0, &_mh_execute_header, v28, 16);
    v11 = "com.apple.security.cryptex.posix";
    v12 = 129;
    goto LABEL_10;
  }
  v29 = xpc_dictionary_get_value(xdict, "target");
  v30 = xpc_uint64_get_value(v26);
  if (v30 == 2)
  {
    if (xpc_get_type(v29) != (xpc_type_t)&_xpc_type_mach_send)
    {
      if (a3)
      {
        if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
          v33 = 3;
        else
          v33 = 2;
        v47 = 67109120;
        v48 = 22;
        v34 = a3;
      }
      else
      {
        v47 = 67109120;
        v48 = 22;
        v34 = &_os_log_default;
        v33 = 2;
      }
      v10 = (char *)_os_log_send_and_compose_impl(v33, 0, 0, 0, &_mh_execute_header, v34, 16);
      v11 = "com.apple.security.cryptex.posix";
      v12 = 167;
      goto LABEL_100;
    }
    *(_DWORD *)(a1 + 40) = xpc_mach_send_copy_right(v29);
  }
  else if (v30 == 1)
  {
    if (xpc_get_type(v29) != (xpc_type_t)&_xpc_type_string)
    {
      if (a3)
      {
        if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
          v35 = 3;
        else
          v35 = 2;
        v47 = 67109120;
        v48 = 22;
        v36 = a3;
      }
      else
      {
        v47 = 67109120;
        v48 = 22;
        v36 = &_os_log_default;
        v35 = 2;
      }
      v10 = (char *)_os_log_send_and_compose_impl(v35, 0, 0, 0, &_mh_execute_header, v36, 16);
      v11 = "com.apple.security.cryptex.posix";
      v12 = 148;
      goto LABEL_100;
    }
    if (xpc_string_get_length(v29) >= 0xFF)
    {
      if (a3)
      {
        if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
          v39 = 3;
        else
          v39 = 2;
        v47 = 67109120;
        v48 = 22;
        v40 = a3;
      }
      else
      {
        v47 = 67109120;
        v48 = 22;
        v40 = &_os_log_default;
        v39 = 2;
      }
      v10 = (char *)_os_log_send_and_compose_impl(v39, 0, 0, 0, &_mh_execute_header, v40, 16);
      v11 = "com.apple.security.cryptex.posix";
      v12 = 156;
      goto LABEL_100;
    }
    string_ptr = xpc_string_get_string_ptr(v29);
    strlcpy((char *)(a1 + 40), string_ptr, 0xFFuLL);
  }
  else
  {
    if (v30)
    {
      if (a3)
      {
        if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
          v37 = 3;
        else
          v37 = 2;
        v47 = 67109120;
        v48 = 22;
        v38 = a3;
      }
      else
      {
        v47 = 67109120;
        v48 = 22;
        v38 = &_os_log_default;
        v37 = 2;
      }
      v10 = (char *)_os_log_send_and_compose_impl(v37, 0, 0, 0, &_mh_execute_header, v38, 16);
      v11 = "com.apple.security.cryptex.posix";
      v12 = 175;
      goto LABEL_100;
    }
    if (xpc_get_type(v29) != (xpc_type_t)&_xpc_type_uint64)
    {
      if (a3)
      {
        if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
          v31 = 3;
        else
          v31 = 2;
        v47 = 67109120;
        v48 = 22;
        v32 = a3;
      }
      else
      {
        v47 = 67109120;
        v48 = 22;
        v32 = &_os_log_default;
        v31 = 2;
      }
      v10 = (char *)_os_log_send_and_compose_impl(v31, 0, 0, 0, &_mh_execute_header, v32, 16);
      v11 = "com.apple.security.cryptex.posix";
      v12 = 139;
LABEL_100:
      v13 = 22;
      goto LABEL_11;
    }
    *(_QWORD *)(a1 + 40) = xpc_uint64_get_value(v29);
  }
  if (sub_10003D1F0(xdict, "cferror", (CFErrorRef *)&cf))
  {
    *(_QWORD *)a1 = 1;
    if (a3)
      v42 = os_retain(a3);
    else
      v42 = &_os_log_default;
    *(_QWORD *)(a1 + 8) = v42;
    *(_QWORD *)(a1 + 16) = xpc_uint64_get_value(v18);
    *(_QWORD *)(a1 + 24) = xpc_uint64_get_value(v22);
    *(_QWORD *)(a1 + 32) = xpc_uint64_get_value(v26);
    *(_QWORD *)(a1 + 296) = xpc_retain(xdict);
    *(_QWORD *)(a1 + 304) = v7;
    xpc_dictionary_get_audit_token(xdict, v45);
    sub_100039E4C((uid_t *)(a1 + 328), v45);
    v15 = 0;
    goto LABEL_13;
  }
  if (a3)
  {
    if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
      v43 = 3;
    else
      v43 = 2;
    LOWORD(v47) = 0;
    v44 = a3;
  }
  else
  {
    LOWORD(v47) = 0;
    v44 = &_os_log_default;
    v43 = 2;
  }
  v10 = (char *)_os_log_send_and_compose_impl(v43, 0, 0, 0, &_mh_execute_header, v44, 16);
  v14 = cf;
  v11 = "com.apple.security.cryptex";
  v12 = 181;
  v13 = 16;
LABEL_12:
  v15 = sub_10000A6F8("rpc_init_local", "rpc.c", v12, v11, v13, v14, v10);
  free(v10);
LABEL_13:
  if (cf)
    CFRelease(cf);
  return v15;
}

uint64_t sub_100039E4C(uid_t *a1, _OWORD *a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t result;
  audit_token_t v13;

  v4 = a2[1];
  *(_OWORD *)v13.val = *a2;
  *(_OWORD *)&v13.val[4] = v4;
  *a1 = audit_token_to_auid(&v13);
  v5 = a2[1];
  *(_OWORD *)v13.val = *a2;
  *(_OWORD *)&v13.val[4] = v5;
  a1[1] = audit_token_to_euid(&v13);
  v6 = a2[1];
  *(_OWORD *)v13.val = *a2;
  *(_OWORD *)&v13.val[4] = v6;
  a1[2] = audit_token_to_egid(&v13);
  v7 = a2[1];
  *(_OWORD *)v13.val = *a2;
  *(_OWORD *)&v13.val[4] = v7;
  a1[3] = audit_token_to_ruid(&v13);
  v8 = a2[1];
  *(_OWORD *)v13.val = *a2;
  *(_OWORD *)&v13.val[4] = v8;
  a1[4] = audit_token_to_rgid(&v13);
  v9 = a2[1];
  *(_OWORD *)v13.val = *a2;
  *(_OWORD *)&v13.val[4] = v9;
  a1[5] = audit_token_to_pid(&v13);
  v10 = a2[1];
  *(_OWORD *)v13.val = *a2;
  *(_OWORD *)&v13.val[4] = v10;
  a1[6] = audit_token_to_asid(&v13);
  v11 = a2[1];
  *(_OWORD *)v13.val = *a2;
  *(_OWORD *)&v13.val[4] = v11;
  result = audit_token_to_pidversion(&v13);
  a1[7] = result;
  return result;
}

void sub_100039F14(_QWORD *a1, uint64_t a2)
{
  xpc_object_t reply;
  xpc_object_t v5;
  uint64_t v6;

  memcpy(a1 + 2, (const void *)(a2 + 16), 0x118uLL);
  reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a2 + 296));
  if (reply)
  {
    v5 = reply;
    v6 = 2;
  }
  else
  {
    v5 = xpc_dictionary_create(0, 0, 0);
    v6 = 10;
  }
  sub_1000391D8((uint64_t)a1, v5, *(void **)(a2 + 8));
  *a1 |= v6;
  *(_QWORD *)a2 |= 4uLL;
  if (v5)
    os_release(v5);
}

_QWORD *sub_100039FB8(_BYTE *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v5;
  _OWORD v6[5];

  if ((*a1 & 0x40) != 0)
    sub_10003A654();
  v2 = malloc_type_calloc(1uLL, 0x168uLL, 0x61D5536CuLL);
  if (!v2)
    sub_10003A578(&v5, v6);
  v3 = v2;
  memcpy(v2, a1, 0x168uLL);
  *v3 |= 0x40uLL;
  v3[37] = xpc_retain(*((xpc_object_t *)a1 + 37));
  *v3 |= 0x80uLL;
  if (*((_QWORD *)a1 + 4) == 2)
    *((_DWORD *)a1 + 10) = mach_right_send_retain(*((unsigned int *)a1 + 10));
  return v3;
}

void sub_10003A088(_BYTE *a1)
{
  if ((*a1 & 1) != 0)
  {
    if (*((_QWORD *)a1 + 4) == 2)
      mach_right_send_release(*((unsigned int *)a1 + 10));
    xpc_release(*((xpc_object_t *)a1 + 37));
    os_release(*((void **)a1 + 1));
    if ((*a1 & 0x40) != 0)
      free(a1);
  }
}

BOOL sub_10003A0E8(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2
      && a1[1] == a2[1]
      && a1[2] == a2[2]
      && a1[3] == a2[3]
      && a1[4] == a2[4]
      && a1[5] == a2[5]
      && a1[6] == a2[6]
      && a1[7] == a2[7];
}

void sub_10003A174(uint64_t a1, _BYTE *a2, int a3)
{
  int v6;
  NSObject *v7;
  char *v8;
  __CFError *v9;
  uint8_t buf[4];
  int v11;

  if (a3 == 36)
  {
    if ((*(_BYTE *)a1 & 4) == 0)
      sub_10003A66C();
    if ((*a2 & 0x80) == 0)
      sub_10003A684();
    v6 = *__error();
    v7 = *(NSObject **)(a1 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "reply in-progress", buf, 2u);
    }
    *__error() = v6;
  }
  else if (a3)
  {
    *(_DWORD *)buf = 67109120;
    v11 = a3;
    v8 = (char *)_os_log_send_and_compose_impl(2, 0, 0, 0, &_mh_execute_header, &_os_log_default, 16);
    v9 = sub_10000A6F8("rpc_reply", "rpc.c", 373, "com.apple.security.cryptex.posix", a3, 0, v8);
    free(v8);
    sub_10003A328(a1, (uint64_t)a2, v9);
    if (v9)
      CFRelease(v9);
  }
  else
  {
    sub_10003A328(a1, (uint64_t)a2, 0);
  }
}

void sub_10003A328(uint64_t a1, uint64_t a2, __CFError *a3)
{
  int v6;
  NSObject *v7;
  xpc_object_t v8;
  int v9;
  NSObject *v10;
  int v11;
  int v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint8_t buf[88];

  if ((*(_QWORD *)a2 & 8) == 0)
  {
    if ((*(_QWORD *)a2 & 0x10) != 0)
      sub_10003A748();
    v6 = *__error();
    v7 = *(NSObject **)(a1 + 8);
    if (a3)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = a3;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "sending reply: %@", buf, 0xCu);
      }
      *__error() = v6;
      *(_QWORD *)a2 |= 0x10uLL;
      v8 = sub_10003D708(a3);
      xpc_dictionary_set_value(*(xpc_object_t *)(a2 + 296), "cferror", v8);
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "sending reply [no error]", buf, 2u);
      }
      v8 = 0;
      *__error() = v6;
      *(_QWORD *)a2 |= 0x10uLL;
    }
    v11 = xpc_pipe_routine_reply(*(_QWORD *)(a2 + 296));
    if (v11 == 32)
    {
      v12 = *__error();
      v13 = *(NSObject **)(a1 + 8);
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        goto LABEL_20;
      *(_WORD *)buf = 0;
      v14 = "caller died";
    }
    else
    {
      if (v11)
        sub_10003A69C(&v15, buf);
      v12 = *__error();
      v13 = *(NSObject **)(a1 + 8);
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        goto LABEL_20;
      *(_WORD *)buf = 0;
      v14 = "reply sent";
    }
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, v14, buf, 2u);
LABEL_20:
    *__error() = v12;
    if (v8)
      os_release(v8);
    return;
  }
  v9 = *__error();
  v10 = *(NSObject **)(a1 + 8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "fake reply, not sending", buf, 2u);
  }
  *__error() = v9;
}

void sub_10003A578(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    v4 = 3;
  else
    v4 = 2;
  v5 = __error();
  strerror(*v5);
  v6 = _os_log_send_and_compose_impl(v4, a1, a2, 80, &_mh_execute_header, &_os_log_default, 16);
  _os_crash_msg(*a1, v6);
  __break(1u);
}

void sub_10003A654()
{
  _os_crash("unexpected failure: ipc already on heap");
  __break(1u);
}

void sub_10003A66C()
{
  _os_crash("unexpected failure: in-progress with no reply created");
  __break(1u);
}

void sub_10003A684()
{
  _os_crash("unexpected failure: reply has not gone to heap");
  __break(1u);
}

void sub_10003A69C(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    v4 = 3;
  else
    v4 = 2;
  v5 = _os_log_send_and_compose_impl(v4, a1, a2, 80, &_mh_execute_header, &_os_log_default, 16);
  _os_crash_msg(*a1, v5);
  __break(1u);
}

void sub_10003A748()
{
  _os_crash("unexpected failure: reply already sent");
  __break(1u);
}

os_log_t sub_10003A760(uint64_t a1, int a2, char *category)
{
  os_log_t result;

  result = os_log_create("com.apple.libcryptex", category);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

char *sub_10003A790(uint64_t a1, const char *a2)
{
  const char *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  char *result;
  uint64_t v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;

  v4 = *(const char **)a1;
  v5 = *__error();
  v6 = *(NSObject **)(a1 + 16);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v7)
    {
      v8 = *(const char **)a1;
      *(_DWORD *)buf = 136446722;
      v12 = v4;
      v13 = 2080;
      v14 = v8;
      v15 = 2080;
      v16 = a2;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}s: changing name: %s -> %s", buf, 0x20u);
    }
    *__error() = v5;
    free(*(void **)(a1 + 8));
  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 136446466;
      v12 = "[anonymous]";
      v13 = 2080;
      v14 = a2;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}s: setting name: %s", buf, 0x16u);
    }
    *__error() = v5;
  }
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      result = strdup(a2);
      if (result)
        break;
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    result = strdup(a2);
    if (!result)
      sub_10003EA78(a2, &v10, buf);
  }
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

void sub_10003A908(uint64_t a1, const char *a2)
{
  const char *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;

  v4 = *(const char **)a1;
  v5 = *__error();
  v6 = *(NSObject **)(a1 + 16);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v7)
    {
      v8 = *(const char **)a1;
      v9 = 136446722;
      v10 = v4;
      v11 = 2080;
      v12 = v8;
      v13 = 2080;
      v14 = a2;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}s: changing name: %s -> %s", (uint8_t *)&v9, 0x20u);
    }
    *__error() = v5;
    free(*(void **)(a1 + 8));
  }
  else
  {
    if (v7)
    {
      v9 = 136446466;
      v10 = "[anonymous]";
      v11 = 2080;
      v12 = a2;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}s: setting name: %s", (uint8_t *)&v9, 0x16u);
    }
    *__error() = v5;
  }
  *(_QWORD *)a1 = a2;
  *(_QWORD *)(a1 + 8) = 0;
}

void sub_10003AA48(uint64_t a1)
{
  free(*(void **)(a1 + 8));
  os_release(*(void **)(a1 + 16));
}

uint64_t sub_10003AA70(_DWORD *a1)
{
  uint64_t v1;

  v1 = *a1;
  *a1 = -1;
  return v1;
}

size_t sub_10003AA84(_BYTE *a1, char *__s)
{
  size_t result;
  size_t v5;
  size_t i;
  uint64_t v7;
  char __str[2];
  char v9;
  _OWORD v10[5];

  result = strlen(__s);
  if (result)
  {
    v5 = result;
    for (i = 0; i < v5; i += 2)
    {
      v9 = 0;
      *(_WORD *)__str = 0;
      __strlcpy_chk(__str, &__s[i], 3, 3);
      result = strtoul(__str, 0, 16);
      if (result >= 0x100)
        sub_10003C0DC(&v7, v10);
      *a1++ = result;
    }
  }
  return result;
}

uint64_t sub_10003AB48(int a1, char *a2, int a3, mode_t a4, int *a5)
{
  int v8;
  int v9;
  int v11;
  uint64_t result;

  v8 = a3 | 0x100000;
  if ((a3 & 0x200) != 0)
  {
    if ((mkdirat(a1, a2, a4) & 0x80000000) == 0)
      *__error() = 0;
    v9 = *__error();
    if (v9 != 17 && v9 != 0)
    {
      v11 = -1;
      goto LABEL_11;
    }
    v8 &= ~0x200u;
  }
  v11 = openat(a1, a2, v8);
  if (v11 < 0)
  {
LABEL_11:
    result = *__error();
    if ((_DWORD)result)
      return result;
  }
  result = 0;
  *a5 = v11;
  return result;
}

uint64_t sub_10003ABE4(uint64_t a1, const char *a2)
{
  int v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  int *v8;
  char *v9;
  unint64_t v10;
  const char *v11;
  int v12;
  NSObject *v13;
  int v14;
  int v15;
  void *v16;
  int v17;
  DIR *v18;
  DIR *v19;
  char v20;
  dirent *v21;
  unint64_t v22;
  char v23;
  int v24;
  dirent *v25;
  int v26;
  int v27;
  int v28;
  NSObject *v29;
  uint64_t v30;
  int v31;
  NSObject *v32;
  int *v33;
  char *v34;
  unint64_t v35;
  const char *v36;
  void *v37;
  int v38;
  NSObject *v39;
  int v40;
  int v41;
  NSObject *v42;
  int v43;
  int v44;
  NSObject *v45;
  int v46;
  int v47;
  NSObject *v48;
  uint8_t *v49;
  NSObject *v50;
  const char *v51;
  int v52;
  NSObject *v53;
  int v54;
  NSObject *v55;
  int v56;
  NSObject *v57;
  int v58;
  NSObject *v59;
  int v60;
  NSObject *v61;
  NSObject *v62;
  NSObject *v63;
  int v64;
  int v65;
  int v66;
  int v67;
  NSObject *v68;
  int v69;
  int v70;
  NSObject *v71;
  NSObject *v72;
  NSObject *v73;
  int v75;
  char *v76;
  int v77;
  unsigned int v78;
  unint64_t v79;
  uint8_t v80[4];
  const char *v81;
  __int16 v82;
  int v83;
  __int16 v84;
  const char *v85;
  __int16 v86;
  off_t st_size;
  __int16 v88;
  void *v89;
  __int16 v90;
  uint8_t *v91;
  stat v92;
  uint8_t buf[4];
  void *d_name;
  __int16 v95;
  int v96;

  v3 = a1;
  if (a2)
  {
    v4 = openat(a1, a2, 0x100000);
    v5 = *__error();
    if (v4 < 0)
    {
      v12 = *__error();
      v13 = os_log_create("com.apple.libcryptex", "utility");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(d_name) = v5;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "openat: %{darwin.errno}d", buf, 8u);
      }
      *__error() = v12;
      return v5;
    }
    v75 = v3;
    v6 = os_log_create("com.apple.libcryptex", "utility");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      d_name = (void *)a2;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "top-level directory: %s", buf, 0xCu);
    }
    *__error() = v5;
  }
  else
  {
    v75 = a1;
    v4 = dup_np(a1);
  }
  v7 = os_log_create("com.apple.libcryptex", "utility");
  bzero(buf, 0x400uLL);
  memset(&v92, 0, sizeof(v92));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    if (fstat(v4, &v92) == -1)
    {
      v14 = *__error();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v15 = *__error();
        *(_DWORD *)v80 = 136315650;
        v81 = "subdirfd";
        v82 = 1024;
        v83 = v4;
        v84 = 1024;
        LODWORD(v85) = v15;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s fd[%d] : [invalid descriptor]: %{darwin.errno}d", v80, 0x18u);
      }
      *__error() = v14;
    }
    else
    {
      if (fcntl(v4, 50, buf))
      {
        v8 = __error();
        v9 = strerror(*v8);
        snprintf((char *)buf, 0x400uLL, "[%s]", v9);
      }
      v10 = ((unint64_t)v92.st_mode >> 12) ^ 8;
      if ((_DWORD)v10 == 15)
        v11 = "[unknown]";
      else
        v11 = off_1000576A8[v10];
      v16 = (void *)os_flagset_copy_string(&unk_1000572A8, v92.st_flags);
      v17 = *__error();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v80 = 136316418;
        v81 = "subdirfd";
        v82 = 1024;
        v83 = v4;
        v84 = 2080;
        v85 = v11;
        v86 = 2048;
        st_size = v92.st_size;
        v88 = 2080;
        v89 = v16;
        v90 = 2080;
        v91 = buf;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s fd[%d]: type = %s, size = %lld, flags = %s, path = %s", v80, 0x3Au);
      }
      *__error() = v17;
      free(v16);
    }
  }
  v76 = (char *)a2;
  v18 = fdopendir(v4);
  if (!v18)
    sub_10003C158(&v92, buf);
  v19 = v18;
  v20 = 0;
  v21 = 0;
  v78 = -1;
  v22 = 0;
  while (1)
  {
    v23 = v20;
    if ((v20 & 1) == 0)
      break;
    v24 = 128;
LABEL_29:
    v26 = dirfd(v19);
    if (v22 >= 4)
      sub_10003C1D4(&v92, buf);
    v27 = v26;
    v20 = 0;
    if (strcmp(v21->d_name, "."))
    {
      v20 = 0;
      if (strcmp(v21->d_name, ".."))
      {
        v79 = v22;
        v28 = *__error();
        v29 = os_log_create("com.apple.libcryptex", "utility");
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          d_name = v21->d_name;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "removing: %s", buf, 0xCu);
        }
        *__error() = v28;
        v30 = openat(v27, v21->d_name, 256);
        if ((v30 & 0x80000000) == 0)
          *__error() = 0;
        v31 = *__error();
        if (v31 == 62)
        {
          v38 = *__error();
          v39 = os_log_create("com.apple.libcryptex", "utility");
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315138;
            d_name = v21->d_name;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "%s is a symlink", buf, 0xCu);
          }
          *__error() = v38;
        }
        else
        {
          if (v31 == 2)
          {
            v44 = *__error();
            v45 = os_log_create("com.apple.libcryptex", "utility");
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315138;
              d_name = v21->d_name;
              _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, "file disappeared: %s", buf, 0xCu);
            }
            v22 = 0;
            v20 = 0;
            *__error() = v44;
            v43 = 9;
            goto LABEL_94;
          }
          if (v31)
          {
            v46 = *__error();
            v47 = *__error();
            v48 = os_log_create("com.apple.libcryptex", "utility");
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109120;
              LODWORD(d_name) = v46;
              v49 = buf;
              v50 = v48;
              v51 = "openat: %{darwin.errno}d";
              goto LABEL_90;
            }
            goto LABEL_91;
          }
          v32 = os_log_create("com.apple.libcryptex", "utility");
          bzero(buf, 0x400uLL);
          memset(&v92, 0, sizeof(v92));
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            if (fstat(v30, &v92) == -1)
            {
              v64 = *__error();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              {
                v65 = *__error();
                *(_DWORD *)v80 = 136315650;
                v81 = "defd";
                v82 = 1024;
                v83 = v30;
                v84 = 1024;
                LODWORD(v85) = v65;
                _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%s fd[%d] : [invalid descriptor]: %{darwin.errno}d", v80, 0x18u);
              }
              *__error() = v64;
            }
            else
            {
              if (fcntl(v30, 50, buf))
              {
                v33 = __error();
                v34 = strerror(*v33);
                snprintf((char *)buf, 0x400uLL, "[%s]", v34);
              }
              v35 = ((unint64_t)v92.st_mode >> 12) ^ 8;
              v36 = "[unknown]";
              if ((_DWORD)v35 != 15)
                v36 = off_1000576A8[v35];
              v37 = (void *)os_flagset_copy_string(&unk_1000572A8, v92.st_flags);
              v77 = *__error();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)v80 = 136316418;
                v81 = "defd";
                v82 = 1024;
                v83 = v30;
                v84 = 2080;
                v85 = v36;
                v86 = 2048;
                st_size = v92.st_size;
                v88 = 2080;
                v89 = v37;
                v90 = 2080;
                v91 = buf;
                _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "%s fd[%d]: type = %s, size = %lld, flags = %s, path = %s", v80, 0x3Au);
              }
              *__error() = v77;
              free(v37);
            }
          }
        }
        if ((unlinkat(v27, v21->d_name, v24) & 0x80000000) == 0)
          *__error() = 0;
        v40 = *__error();
        if (v40 <= 15)
        {
          if (!v40)
          {
            v58 = *__error();
            v59 = os_log_create("com.apple.libcryptex", "utility");
            if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315138;
              d_name = v21->d_name;
              _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEBUG, "removed: %s", buf, 0xCu);
            }
            v22 = 0;
            v20 = 0;
            v43 = 0;
            *__error() = v58;
            goto LABEL_94;
          }
          if (v40 != 1)
          {
            if (v40 == 2)
            {
              v41 = *__error();
              v42 = os_log_create("com.apple.libcryptex", "utility");
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315138;
                d_name = v21->d_name;
                _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "file disappeared: %s", buf, 0xCu);
              }
              v20 = 0;
              v43 = 0;
              *__error() = v41;
              goto LABEL_93;
            }
LABEL_88:
            v46 = *__error();
            v47 = *__error();
            v63 = os_log_create("com.apple.libcryptex", "utility");
            if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109120;
              LODWORD(d_name) = v46;
              v49 = buf;
              v50 = v63;
              v51 = "unlinkat: %{darwin.errno}d";
LABEL_90:
              _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, v51, v49, 8u);
            }
            goto LABEL_91;
          }
          goto LABEL_71;
        }
        if (v40 != 16)
        {
          if (v40 != 21)
          {
            if (v40 != 66)
              goto LABEL_88;
            v52 = *__error();
            v53 = os_log_create("com.apple.libcryptex", "utility");
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315138;
              d_name = v21->d_name;
              _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEBUG, "re-trying directory cleanup: %s", buf, 0xCu);
            }
            *__error() = v52;
            ++v79;
          }
LABEL_71:
          v54 = *__error();
          v55 = os_log_create("com.apple.libcryptex", "utility");
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315138;
            d_name = v21->d_name;
            _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEBUG, "emptying subdirectory: %s", buf, 0xCu);
          }
          *__error() = v54;
          v56 = sub_10003ABE4(v30, 0);
          if (v56)
          {
            v46 = v56;
            v47 = *__error();
            v57 = os_log_create("com.apple.libcryptex", "utility");
            if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109120;
              LODWORD(d_name) = v46;
              v49 = buf;
              v50 = v57;
              v51 = "emptydir [recurse]: %{darwin.errno}d";
              goto LABEL_90;
            }
            goto LABEL_91;
          }
          goto LABEL_87;
        }
        if ((v23 & 1) == 0 && v21->d_type != 4)
        {
          v66 = *__error();
          v67 = *__error();
          v68 = os_log_create("com.apple.libcryptex", "utility");
          if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            d_name = v21->d_name;
            v95 = 1024;
            v96 = v66;
            _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "file busy: %s: %{darwin.errno}d", buf, 0x12u);
          }
          v78 = v66;
          v20 = 0;
          *__error() = v67;
          goto LABEL_92;
        }
        bzero(buf, 0x400uLL);
        if (realpath_np(v30, buf))
          sub_10003C2DC(v80, &v92);
        v60 = *__error();
        v61 = os_log_create("com.apple.libcryptex", "utility");
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
        {
          v92.st_dev = 136315138;
          *(_QWORD *)&v92.st_mode = v21->d_name;
          _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEBUG, "mount point; forcing unmount: %s",
            (uint8_t *)&v92,
            0xCu);
        }
        *__error() = v60;
        if (unmount((const char *)buf, 0x80000))
        {
          v46 = *__error();
          v47 = *__error();
          v62 = os_log_create("com.apple.libcryptex", "utility");
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          {
            v92.st_dev = 67109120;
            *(_DWORD *)&v92.st_mode = v46;
            v49 = (uint8_t *)&v92;
            v50 = v62;
            v51 = "unmount + MNT_FORCE: %{darwin.errno}d";
            goto LABEL_90;
          }
LABEL_91:
          v78 = v46;
          v20 = 0;
          *__error() = v47;
LABEL_92:
          v43 = 4;
          goto LABEL_93;
        }
LABEL_87:
        v43 = 0;
        v78 = 0;
        v20 = 1;
LABEL_93:
        v22 = v79;
LABEL_94:
        if ((_DWORD)v30 != -1 && close(v30) == -1)
          sub_10003DD94(&v92, buf);
        if (v43 && v43 != 9)
        {
          v5 = v78;
          goto LABEL_116;
        }
      }
    }
  }
  v25 = readdir(v19);
  if (v25)
  {
    v21 = v25;
    v24 = 0;
    goto LABEL_29;
  }
  if (v76)
  {
    v69 = unlinkat(v75, v76, 128);
    v5 = *__error();
    if (v69)
    {
      v70 = *__error();
      v71 = os_log_create("com.apple.libcryptex", "utility");
      if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(d_name) = v5;
        _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_ERROR, "unlinkat [top level]: %{darwin.errno}d", buf, 8u);
      }
      goto LABEL_115;
    }
    v73 = os_log_create("com.apple.libcryptex", "utility");
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      d_name = v76;
      _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEBUG, "removed top-level directory: %s", buf, 0xCu);
    }
    v70 = v5;
  }
  else
  {
    v70 = *__error();
    v72 = os_log_create("com.apple.libcryptex", "utility");
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEBUG, "removed subdirectory", buf, 2u);
    }
  }
  v5 = 0;
LABEL_115:
  *__error() = v70;
LABEL_116:
  if (closedir(v19) == -1)
    sub_10003C260(&v92, buf);
  return v5;
}

uint64_t sub_10003BA5C(int a1, char *a2, int *a3)
{
  char *v5;
  int v6;
  int v7;
  uint64_t result;

  v5 = mkdtempat_np(a1, a2);
  if (!v5)
    return *__error();
  v6 = openat(a1, v5, 1048832);
  if (v6 < 0)
    return *__error();
  v7 = v6;
  result = 0;
  *a3 = v7;
  return result;
}

uint64_t sub_10003BAB4(const char *a1, mode_t a2, int *a3)
{
  int v5;
  BOOL v6;
  DIR *v7;
  dirent *v8;
  const char *d_name;
  uint64_t v10;
  int *v11;
  int v12;
  uint64_t v14;
  _OWORD v15[5];

  if ((mkdir(a1, a2) & 0x80000000) == 0)
    *__error() = 0;
  v5 = *__error();
  if (v5)
    v6 = v5 == 17;
  else
    v6 = 1;
  if (!v6)
  {
    v11 = __error();
    return *v11;
  }
  v7 = opendir(a1);
  v11 = __error();
  if (!v7)
    return *v11;
  *v11 = 0;
  v8 = readdir(v7);
  if (v8)
  {
    while (1)
    {
      d_name = v8->d_name;
      if (strcmp(v8->d_name, "."))
      {
        if (strcmp(d_name, ".."))
          break;
      }
      v8 = readdir(v7);
      if (!v8)
        goto LABEL_13;
    }
    v10 = 17;
  }
  else
  {
LABEL_13:
    if (*__error() || (v12 = open(a1, 1048832), v12 < 0))
    {
      v10 = *__error();
    }
    else
    {
      v10 = 0;
      *a3 = v12;
    }
  }
  if (closedir(v7) == -1)
    sub_10003C260(&v14, v15);
  return v10;
}

uint64_t sub_10003BC08(int a1, _QWORD *a2)
{
  uint64_t v4;
  int v5;
  NSObject *v6;
  off_t st_size;
  void *v8;
  void *v10;
  ssize_t v11;
  int v12;
  NSObject *v13;
  int v14;
  NSObject *v15;
  ssize_t v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  stat v20;
  uint8_t buf[4];
  off_t v22;
  __int16 v23;
  off_t v24;

  memset(&v20, 0, sizeof(v20));
  if (fstat(a1, &v20))
  {
    v4 = *__error();
    v5 = *__error();
    v6 = os_log_create("com.apple.libcryptex", "utility");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v22) = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "stat: %{darwin.errno}d", buf, 8u);
    }
    st_size = 0;
LABEL_5:
    v8 = 0;
    *__error() = v5;
LABEL_6:
    if (!(_DWORD)v4)
      goto LABEL_7;
    goto LABEL_8;
  }
  st_size = v20.st_size;
  if (v20.st_size < 0)
    sub_10003C368();
  v10 = malloc_type_malloc(v20.st_size, 0xD8A116BDuLL);
  if (!v10)
  {
    v4 = *__error();
    v5 = *__error();
    v15 = os_log_create("com.apple.libcryptex", "utility");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v22) = v4;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "malloc: %{darwin.errno}d", buf, 8u);
    }
    goto LABEL_5;
  }
  v8 = v10;
  while (1)
  {
    v11 = pread(a1, v8, st_size, 0);
    if ((v11 & 0x8000000000000000) == 0)
      break;
    v12 = *__error();
    v13 = os_log_create("com.apple.libcryptex", "utility");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = *__error();
      *(_DWORD *)buf = 67109120;
      LODWORD(v22) = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "pread: %{darwin.errno}d", buf, 8u);
    }
    *__error() = v12;
    v4 = *__error();
    if ((_DWORD)v4 != 4)
      goto LABEL_6;
  }
  v16 = v11;
  v17 = *__error();
  v18 = os_log_create("com.apple.libcryptex", "utility");
  v19 = v18;
  if (v16 == st_size)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v22 = st_size;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "read %ld bytes", buf, 0xCu);
    }
    *__error() = v17;
LABEL_7:
    sub_10003C3E0(a2, 0, (uint64_t)j__free, (uint64_t)v8, st_size);
    v4 = 0;
    v8 = 0;
    goto LABEL_8;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218240;
    v22 = v16;
    v23 = 2048;
    v24 = st_size;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "truncated read: actual = %ld, expected = %lu", buf, 0x16u);
  }
  *__error() = v17;
  v4 = 5;
LABEL_8:
  free(v8);
  return v4;
}

uint64_t sub_10003BF6C(void *a1, const char *a2, const char *a3)
{
  if (xpc_dictionary_get_value(a1, a2))
    return 17;
  xpc_dictionary_set_string(a1, a2, a3);
  return 0;
}

BOOL sub_10003BFBC(void *a1, const char *a2)
{
  uint64_t v4;
  const char *string_ptr;
  size_t v7;
  xpc_object_t value;

  if (xpc_get_type(a1) == (xpc_type_t)&_xpc_type_string)
  {
    string_ptr = xpc_string_get_string_ptr(a1);
    return strcmp(a2, string_ptr) == 0;
  }
  else if (xpc_get_type(a1) == (xpc_type_t)&_xpc_type_array && xpc_array_get_count(a1))
  {
    v7 = 0;
    do
    {
      value = xpc_array_get_value(a1, v7);
      v4 = sub_10003BFBC(value, a2);
      if ((_DWORD)v4)
        break;
      ++v7;
    }
    while (v7 < xpc_array_get_count(a1));
  }
  else
  {
    return 0;
  }
  return v4;
}

xpc_object_t sub_10003C07C(void *a1, const char *a2, const char *a3)
{
  xpc_object_t result;

  result = xpc_dictionary_get_value(a1, a2);
  if (result)
    return (xpc_object_t)sub_10003BFBC(result, a3);
  return result;
}

uint64_t sub_10003C0B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  return _os_log_send_and_compose_impl(a1, a2, a3, 80, a5, v5, 16);
}

void sub_10003C0DC(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  sub_1000098E0();
  sub_10003C0C0();
  v6 = sub_10003C0B0(v4, (uint64_t)a1, (uint64_t)a2, v5, (uint64_t)&_mh_execute_header);
  sub_10000991C(v6);
  __break(1u);
}

void sub_10003C158(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  sub_1000098EC(&_os_log_default);
  __error();
  sub_100009900();
  v6 = sub_100009868(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000098F4(v6);
  __break(1u);
}

void sub_10003C1D4(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  if (sub_1000098E0())
    v5 = 3;
  else
    v5 = 2;
  v6 = sub_10003C0B0(v5, (uint64_t)a1, (uint64_t)a2, v4, (uint64_t)&_mh_execute_header);
  sub_10000991C(v6);
  __break(1u);
}

void sub_10003C260(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  sub_1000098EC(&_os_log_default);
  __error();
  sub_100009900();
  v6 = sub_100009868(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000098F4(v6);
  __break(1u);
}

void sub_10003C2DC(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  if (sub_1000098E0())
    v5 = 3;
  else
    v5 = 2;
  v6 = sub_10003C0B0(v5, (uint64_t)a1, (uint64_t)a2, v4, (uint64_t)&_mh_execute_header);
  sub_10000991C(v6);
  __break(1u);
}

void sub_10003C368()
{
  _os_crash("unexpected failure: value not representable as size_t");
  __break(1u);
}

uint64_t sub_10003C384(void *a1, size_t a2)
{
  uint64_t result;
  uint64_t v3;
  _OWORD v4[5];

  result = munmap(a1, a2);
  if ((_DWORD)result == -1)
    sub_10003C674(&v3, v4);
  return result;
}

_QWORD *sub_10003C3E0(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _OWORD v6[5];

  *result = a4;
  result[1] = a5;
  result[2] = a4;
  result[3] = a5;
  result[4] = a2;
  result[5] = a3;
  if (a5 < 0)
    sub_10003C6F0(&v5, v6);
  return result;
}

double sub_10003C444(__n128 *a1, __n128 *a2)
{
  double result;

  *(_QWORD *)&result = sub_10003C450(a1, a2, 0, a2->n128_u64[1]).n128_u64[0];
  return result;
}

__n128 sub_10003C450(__n128 *a1, __n128 *a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  __n128 result;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  unint64_t v15;
  __int16 v16;
  unint64_t v17;
  _OWORD v18[5];

  v4 = a2->n128_u64[1];
  if (a4 + a3 > v4)
  {
    v11 = 0;
    memset(v18, 0, sizeof(v18));
    v8 = v4;
    v12 = 134218496;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      v9 = 3;
    else
      v9 = 2;
    v13 = a3;
    v14 = 2048;
    v15 = a4;
    v16 = 2048;
    v17 = v8;
    v10 = _os_log_send_and_compose_impl(v9, &v11, v18, 80, &_mh_execute_header, &_os_log_default, 16);
    _os_crash_msg(v11, v10);
    __break(1u);
  }
  a1->n128_u64[0] = a2->n128_u64[0] + a3;
  a1->n128_u64[1] = a4;
  a1[1].n128_u64[0] = a2->n128_u64[0];
  a1[1].n128_u64[1] = a2->n128_u64[1];
  result = a2[2];
  a1[2] = result;
  a2[2].n128_u64[1] = 0;
  return result;
}

FILE *sub_10003C588(uint64_t a1, char *__mode, unint64_t a3)
{
  size_t v5;
  FILE *v6;
  FILE *v7;
  uint64_t v9;
  _OWORD v10[5];

  if ((a3 & 0x8000000000000000) != 0 || (v5 = *(_QWORD *)(a1 + 8), v5 < a3))
    sub_10003C774();
  v6 = fmemopen(*(void **)a1, v5, __mode);
  if (!v6)
    sub_10003C78C(&v9, v10);
  v7 = v6;
  if (fseek(v6, a3, 0) == -1)
    sub_10003C808(&v9, v10);
  return v7;
}

_QWORD *sub_10003C630(_QWORD *result)
{
  uint64_t (*v1)(_QWORD, _QWORD, _QWORD);

  if (result)
  {
    if (*result)
    {
      v1 = (uint64_t (*)(_QWORD, _QWORD, _QWORD))result[5];
      if (v1)
      {
        if (result[6])
          sub_10003C884();
        return (_QWORD *)v1(result[2], result[3], result[4]);
      }
    }
  }
  return result;
}

void sub_10003C674(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  sub_1000098EC(&_os_log_default);
  __error();
  sub_100009900();
  v6 = sub_100009868(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000098F4(v6);
  __break(1u);
}

void sub_10003C6F0(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  if (sub_1000098EC(&_os_log_default))
    v5 = 3;
  else
    v5 = 2;
  v6 = sub_10000EE70(v5, v2, v3, v4, (uint64_t)&_mh_execute_header);
  sub_10000991C(v6);
  __break(1u);
}

void sub_10003C774()
{
  _os_crash("unexpected failure: offset overflow");
  __break(1u);
}

void sub_10003C78C(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  sub_1000098EC(&_os_log_default);
  __error();
  sub_100009900();
  v6 = sub_100009868(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000098F4(v6);
  __break(1u);
}

void sub_10003C808(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  sub_1000098EC(&_os_log_default);
  __error();
  sub_100009900();
  v6 = sub_100009868(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000098F4(v6);
  __break(1u);
}

void sub_10003C884()
{
  _os_crash("unexpected failure: buffer destroyed with active borrow");
  __break(1u);
}

_QWORD *sub_10003C89C(void *a1, size_t a2)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v7;
  _OWORD v8[5];

  if (a2 <= 0x17)
    sub_10003C9CC(&v7, v8);
  if (_dispatch_is_multithreaded())
  {
    v4 = malloc_type_calloc(1uLL, a2, 0x1B044E25uLL);
    if (!v4)
    {
      do
      {
        __os_temporary_resource_shortage();
        v5 = malloc_type_calloc(1uLL, a2, 0x1B044E25uLL);
      }
      while (!v5);
      v4 = v5;
    }
  }
  else
  {
    v4 = malloc_type_calloc(1uLL, a2, 0x61D5536CuLL);
    if (!v4)
      sub_10003CA64(&v7, v8);
  }
  if (a1)
    *v4 = os_retain(a1);
  return v4;
}

void sub_10003C998(void **a1)
{
  void *v2;

  if (a1)
  {
    v2 = *a1;
    if (v2)
      os_release(v2);
    free(a1);
  }
}

void sub_10003C9CC(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (sub_1000098E0())
    v5 = 3;
  else
    v5 = 2;
  v6 = sub_10003C0B0(v5, (uint64_t)a1, (uint64_t)a2, v4, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v6);
  __break(1u);
}

void sub_10003CA64(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (sub_1000098E0())
    v4 = 3;
  else
    v4 = 2;
  v5 = __error();
  strerror(*v5);
  v7 = sub_10003C0B0(v4, (uint64_t)a1, (uint64_t)a2, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

xpc_object_t sub_10003CB30(uint64_t a1, xpc_object_t object)
{
  xpc_type_t type;
  xpc_object_t value;
  size_t v8;
  void *v9;

  if (*(_UNKNOWN **)a1 != &_xpc_type_array && *(_QWORD *)a1 != (_QWORD)&_xpc_type_dictionary)
    sub_10003DA18();
  type = xpc_get_type(object);
  if (type != *(xpc_type_t *)a1)
    return 0;
  if (type == (xpc_type_t)&_xpc_type_array)
  {
    v8 = *(_QWORD *)(a1 + 24);
    if (v8 >= xpc_array_get_count(object))
      return 0;
    value = xpc_array_get_value(object, *(_QWORD *)(a1 + 24));
  }
  else
  {
    value = xpc_dictionary_get_value(object, *(const char **)(a1 + 16));
  }
  v9 = value;
  if (!value || xpc_get_type(value) != *(xpc_type_t *)(a1 + 8))
    return 0;
  return xpc_retain(v9);
}

uint64_t sub_10003CBFC(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  int v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2000000000;
  v8 = 0;
  if (xdict)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 0x40000000;
    v4[2] = sub_10003CC98;
    v4[3] = &unk_100057748;
    v4[4] = &v5;
    v4[5] = a1;
    xpc_dictionary_apply(xdict, v4);
    v2 = *((unsigned int *)v6 + 6);
  }
  else
  {
    v2 = 0;
  }
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t sub_10003CC98(uint64_t a1, const char *a2, void *a3)
{
  xpc_object_t value;
  xpc_object_t v7;
  xpc_type_t type;
  int v9;
  NSObject *v10;
  int v11;
  _QWORD applier[5];
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;

  value = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 40), a2);
  if (!value)
  {
LABEL_9:
    xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 40), a2, a3);
    return 1;
  }
  v7 = value;
  type = xpc_get_type(value);
  if (type == xpc_get_type(a3))
  {
    if (type == (xpc_type_t)&_xpc_type_dictionary)
    {
      applier[0] = _NSConcreteStackBlock;
      applier[1] = 0x40000000;
      applier[2] = sub_10003CE3C;
      applier[3] = &unk_100057720;
      applier[4] = v7;
      xpc_dictionary_apply(a3, applier);
      return 1;
    }
    goto LABEL_9;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 79;
  v9 = *__error();
  if (qword_10005A8B8 != -1)
    dispatch_once(&qword_10005A8B8, &stru_100057788);
  v10 = qword_10005A8C0;
  if (os_log_type_enabled((os_log_t)qword_10005A8C0, OS_LOG_TYPE_ERROR))
  {
    v11 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    *(_DWORD *)buf = 136315394;
    v15 = a2;
    v16 = 1024;
    v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Error merging override for key %s: %{darwin.errno}d", buf, 0x12u);
  }
  *__error() = v9;
  return 1;
}

uint64_t sub_10003CE3C(uint64_t a1, const char *a2, void *a3)
{
  xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), a2, a3);
  return 1;
}

uint64_t sub_10003CE58(void *a1, const char *a2, uint64_t *a3)
{
  xpc_object_t value;
  void *v5;
  uint64_t result;
  uint64_t v7;

  value = xpc_dictionary_get_value(a1, a2);
  if (!value)
    return 2;
  v5 = value;
  if (xpc_get_type(value) != (xpc_type_t)&_xpc_type_uint64)
    return 79;
  v7 = xpc_uint64_get_value(v5);
  result = 0;
  *a3 = v7;
  return result;
}

uint64_t sub_10003CEB8(void *a1, const char *a2, const char **a3)
{
  xpc_object_t value;
  void *v5;
  uint64_t result;
  const char *string_ptr;

  value = xpc_dictionary_get_value(a1, a2);
  if (!value)
    return 2;
  v5 = value;
  if (xpc_get_type(value) != (xpc_type_t)&_xpc_type_string)
    return 79;
  string_ptr = xpc_string_get_string_ptr(v5);
  result = 0;
  *a3 = string_ptr;
  return result;
}

uint64_t sub_10003CF18(void *a1, const char *a2, BOOL *a3)
{
  xpc_object_t value;
  void *v5;
  uint64_t result;
  BOOL v7;

  value = xpc_dictionary_get_value(a1, a2);
  if (!value)
    return 2;
  v5 = value;
  if (xpc_get_type(value) != (xpc_type_t)&_xpc_type_BOOL)
    return 79;
  v7 = xpc_BOOL_get_value(v5);
  result = 0;
  *a3 = v7;
  return result;
}

uint64_t sub_10003CF78(void *a1, const char *a2, const _xpc_type_s *a3)
{
  xpc_object_t value;
  int v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  int *v12;
  uint64_t result;
  int v14;
  const char *v15;
  __int16 v16;
  const char *name;

  value = xpc_dictionary_get_value(a1, a2);
  if (!value)
  {
    v6 = *__error();
    if (qword_10005A8B8 != -1)
      dispatch_once(&qword_10005A8B8, &stru_100057788);
    v11 = qword_10005A8C0;
    if (!os_log_type_enabled((os_log_t)qword_10005A8C0, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v14 = 136315138;
    v15 = a2;
    v8 = "key %s doesn't exist";
    v9 = v11;
    v10 = 12;
    goto LABEL_11;
  }
  if (xpc_get_type(value) != a3)
  {
    v6 = *__error();
    if (qword_10005A8B8 != -1)
      dispatch_once(&qword_10005A8B8, &stru_100057788);
    v7 = qword_10005A8C0;
    if (!os_log_type_enabled((os_log_t)qword_10005A8C0, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v14 = 136315394;
    v15 = a2;
    v16 = 2080;
    name = xpc_type_get_name(a3);
    v8 = "key %s isn't of type %s";
    v9 = v7;
    v10 = 22;
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v14, v10);
LABEL_12:
    v12 = __error();
    result = 0;
    *v12 = v6;
    return result;
  }
  return 1;
}

void *sub_10003D10C(void *a1, void *a2, int a3)
{
  xpc_object_t reply;
  void *v6;
  int v7;
  NSObject *v8;
  uint8_t v10[16];

  reply = xpc_dictionary_create_reply(a1);
  v6 = reply;
  if (reply)
  {
    xpc_dictionary_set_uint64(reply, "error", a3);
    xpc_dictionary_set_value(v6, "argv", a2);
  }
  else
  {
    v7 = *__error();
    if (qword_10005A8B8 != -1)
      dispatch_once(&qword_10005A8B8, &stru_100057788);
    v8 = qword_10005A8C0;
    if (os_log_type_enabled((os_log_t)qword_10005A8C0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "failed to extract reply from request, the connection may have gone", v10, 2u);
    }
    *__error() = v7;
  }
  return v6;
}

uint64_t sub_10003D1F0(void *a1, const char *a2, CFErrorRef *a3)
{
  xpc_object_t value;
  void *v5;

  value = xpc_dictionary_get_value(a1, a2);
  if (!value)
    return 2;
  v5 = value;
  if (xpc_get_type(value) == (xpc_type_t)&_xpc_type_dictionary)
    return sub_10003D24C(v5, a3);
  else
    return 79;
}

uint64_t sub_10003D24C(void *a1, CFErrorRef *a2)
{
  xpc_object_t dictionary;
  void *v5;
  char *string;
  CFStringRef v7;
  const __CFString *v8;
  int64_t int64;
  xpc_object_t v10;
  int v11;
  NSObject *v12;
  const char *v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  const __CFDictionary *v17;
  const __CFDictionary *v18;
  __CFDictionary *MutableCopy;
  const __CFDictionary *v20;
  CFErrorRef v21;
  int v22;
  NSObject *v23;
  int v24;
  NSObject *v25;
  int v26;
  NSObject *v27;
  void *value;
  uint8_t buf[4];
  int v31;

  value = 0;
  dictionary = xpc_dictionary_get_dictionary(a1, "cferr_userinfo");
  if (dictionary)
  {
    v5 = dictionary;
    string = (char *)xpc_dictionary_get_string(a1, "cferr_domain");
    v7 = sub_10000A430(string);
    if (v7)
    {
      v8 = v7;
      int64 = xpc_dictionary_get_int64(a1, "cferr_code");
      v10 = xpc_dictionary_get_dictionary(v5, "underlying_cferr");
      if (v10 && sub_10003D24C(v10, &value))
      {
        v11 = *__error();
        if (qword_10005A8B8 != -1)
          dispatch_once(&qword_10005A8B8, &stru_100057788);
        v12 = qword_10005A8C0;
        if (!os_log_type_enabled((os_log_t)qword_10005A8C0, OS_LOG_TYPE_ERROR))
          goto LABEL_31;
        *(_DWORD *)buf = 67109120;
        v31 = 22;
        v13 = "Failed to unpack underlying error.: %{darwin.errno}d";
      }
      else
      {
        xpc_dictionary_set_value(v5, "underlying_cferr", 0);
        v17 = (const __CFDictionary *)_CFXPCCreateCFObjectFromXPCObject(v5);
        if (v17)
        {
          v18 = v17;
          MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v17);
          if (MutableCopy)
          {
            v20 = MutableCopy;
            if (value)
              CFDictionarySetValue(MutableCopy, kCFErrorUnderlyingErrorKey, value);
            v21 = CFErrorCreate(0, v8, int64, v20);
            if (v21)
            {
              if (a2)
              {
                v16 = 0;
                *a2 = v21;
              }
              else
              {
                CFRelease(v21);
                v16 = 0;
              }
            }
            else
            {
              v26 = *__error();
              if (qword_10005A8B8 != -1)
                dispatch_once(&qword_10005A8B8, &stru_100057788);
              v27 = qword_10005A8C0;
              if (os_log_type_enabled((os_log_t)qword_10005A8C0, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109120;
                v31 = 12;
                _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to create CFError.: %{darwin.errno}d", buf, 8u);
              }
              *__error() = v26;
              v16 = 12;
            }
            CFRelease(v20);
          }
          else
          {
            v24 = *__error();
            if (qword_10005A8B8 != -1)
              dispatch_once(&qword_10005A8B8, &stru_100057788);
            v25 = qword_10005A8C0;
            if (os_log_type_enabled((os_log_t)qword_10005A8C0, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109120;
              v31 = 12;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Failed to create mutable dictionary.: %{darwin.errno}d", buf, 8u);
            }
            *__error() = v24;
            v16 = 12;
          }
          CFRelease(v18);
          goto LABEL_45;
        }
        v11 = *__error();
        if (qword_10005A8B8 != -1)
          dispatch_once(&qword_10005A8B8, &stru_100057788);
        v12 = qword_10005A8C0;
        if (!os_log_type_enabled((os_log_t)qword_10005A8C0, OS_LOG_TYPE_ERROR))
        {
LABEL_31:
          *__error() = v11;
          v16 = 22;
LABEL_45:
          CFRelease(v8);
          goto LABEL_46;
        }
        *(_DWORD *)buf = 67109120;
        v31 = 22;
        v13 = "Failed to convert CF to XPC.: %{darwin.errno}d";
      }
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, v13, buf, 8u);
      goto LABEL_31;
    }
    v22 = *__error();
    if (qword_10005A8B8 != -1)
      dispatch_once(&qword_10005A8B8, &stru_100057788);
    v23 = qword_10005A8C0;
    if (os_log_type_enabled((os_log_t)qword_10005A8C0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v31 = 12;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to create string.: %{darwin.errno}d", buf, 8u);
    }
    *__error() = v22;
    v16 = 12;
  }
  else
  {
    v14 = *__error();
    if (qword_10005A8B8 != -1)
      dispatch_once(&qword_10005A8B8, &stru_100057788);
    v15 = qword_10005A8C0;
    if (os_log_type_enabled((os_log_t)qword_10005A8C0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v31 = 22;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "CFError XPC dictionary is missing user info.: %{darwin.errno}d", buf, 8u);
    }
    *__error() = v14;
    v16 = 22;
  }
LABEL_46:
  if (value)
    CFRelease(value);
  return v16;
}

xpc_object_t sub_10003D708(__CFError *a1)
{
  xpc_object_t v2;
  const __CFDictionary *v3;
  __CFDictionary *MutableCopy;
  __CFDictionary *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *Domain;
  char *v11;
  int64_t Code;

  v2 = xpc_dictionary_create(0, 0, 0);
  v3 = CFErrorCopyUserInfo(a1);
  if (v3)
  {
    MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v3);
    if (!MutableCopy)
      sub_10003DA48();
    v5 = MutableCopy;
    CFDictionaryRemoveValue(MutableCopy, kCFErrorUnderlyingErrorKey);
    v6 = _CFXPCCreateXPCObjectFromCFObject(v5);
    if (!v6)
      sub_10003DA60();
    v7 = (void *)v6;
    if (CFDictionaryGetValue(v3, kCFErrorUnderlyingErrorKey))
    {
      v8 = (void *)sub_10003D708();
      if (!v8)
        sub_10003DA78();
      v9 = v8;
      xpc_dictionary_set_value(v7, "underlying_cferr", v8);
    }
    else
    {
      v9 = 0;
    }
    xpc_dictionary_set_value(v2, "cferr_userinfo", v7);
  }
  else
  {
    v9 = 0;
    v7 = 0;
    v5 = 0;
  }
  if (!CFErrorGetDomain(a1))
    sub_10003DA30();
  Domain = CFErrorGetDomain(a1);
  v11 = sub_10000A2F4(Domain);
  xpc_dictionary_set_string(v2, "cferr_domain", v11);
  Code = CFErrorGetCode(a1);
  xpc_dictionary_set_int64(v2, "cferr_code", Code);
  free(v11);
  if (v5)
    CFRelease(v5);
  if (v3)
    CFRelease(v3);
  if (v7)
    os_release(v7);
  if (v9)
    os_release(v9);
  return v2;
}

void *sub_10003D890(void *a1, void *a2, __CFError *a3)
{
  xpc_object_t reply;
  void *v6;
  xpc_object_t v7;
  int v8;
  NSObject *v9;
  uint8_t v11[16];

  reply = xpc_dictionary_create_reply(a1);
  v6 = reply;
  if (reply)
  {
    xpc_dictionary_set_value(reply, "argv", a2);
    if (a3)
    {
      v7 = sub_10003D708(a3);
      xpc_dictionary_set_value(v6, "cferr", v7);
      if (v7)
        os_release(v7);
    }
  }
  else
  {
    v8 = *__error();
    if (qword_10005A8B8 != -1)
      dispatch_once(&qword_10005A8B8, &stru_100057788);
    v9 = qword_10005A8C0;
    if (os_log_type_enabled((os_log_t)qword_10005A8C0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "failed to extract reply from request, the connection may have gone", v11, 2u);
    }
    *__error() = v8;
  }
  return v6;
}

uint64_t sub_10003D990(void *a1, _QWORD *a2)
{
  xpc_object_t dictionary;
  uint64_t result;

  if (!sub_10003CF78(a1, "argv", (const _xpc_type_s *)&_xpc_type_dictionary))
    return 22;
  dictionary = xpc_dictionary_get_dictionary(a1, "argv");
  result = 0;
  *a2 = dictionary;
  return result;
}

void sub_10003D9EC(id a1)
{
  qword_10005A8C0 = (uint64_t)os_log_create("com.apple.libcryptex", "xpc");
}

void sub_10003DA18()
{
  _os_crash("unexpected failure: illegal plist value definition");
  __break(1u);
}

void sub_10003DA30()
{
  _os_crash("unexpected failure: CFError has no domain");
  __break(1u);
}

void sub_10003DA48()
{
  _os_crash("unexpected failure: failed to create mutable dictionary");
  __break(1u);
}

void sub_10003DA60()
{
  _os_crash("unexpected failure: failed to convert user info to xpc dict");
  __break(1u);
}

void sub_10003DA78()
{
  _os_crash("unexpected failure: failed to convert CFError to xpc dict");
  __break(1u);
}

void sub_10003DA90(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (sub_1000065E8())
    v4 = 3;
  else
    v4 = 2;
  v5 = __error();
  strerror(*v5);
  v7 = sub_1000065D8(v4, (uint64_t)a1, (uint64_t)a2, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_10003DB54(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  if (sub_1000098EC(&_os_log_default))
    v4 = 3;
  else
    v4 = 2;
  v5 = __error();
  sub_100009978(v5);
  v6 = _os_log_send_and_compose_impl(v4, a1, a2, 80, &_mh_execute_header, &_os_log_default, 16);
  sub_100009944(v6);
  __break(1u);
}

void sub_10003DC18(const char *a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000996C(a1);
  sub_100009950();
  if (sub_1000098E0())
    v2 = 3;
  else
    v2 = 2;
  v3 = __error();
  sub_100009978(v3);
  sub_1000098B0();
  v6 = sub_100009884(v2, v1, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009944(v6);
  __break(1u);
}

void sub_10003DCA4(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  sub_1000098E0();
  sub_100009928();
  v6 = sub_100009884(v3, (uint64_t)a1, v4, v5, (uint64_t)&_mh_execute_header);
  sub_10000991C(v6);
  __break(1u);
}

void sub_10003DD1C(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  sub_1000098E0();
  sub_100009928();
  v6 = sub_100009884(v3, (uint64_t)a1, v4, v5, (uint64_t)&_mh_execute_header);
  sub_10000991C(v6);
  __break(1u);
}

void sub_10003DD94(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  sub_1000098EC(&_os_log_default);
  __error();
  sub_100009900();
  v6 = sub_100009868(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000098F4(v6);
  __break(1u);
}

void sub_10003DE10(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  sub_1000098EC(&_os_log_default);
  __error();
  sub_100009980();
  v6 = sub_100009868(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000098F4(v6);
  __break(1u);
}

void sub_10003DE98(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  sub_1000098EC(&_os_log_default);
  __error();
  sub_100009980();
  v6 = sub_100009868(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000098F4(v6);
  __break(1u);
}

void sub_10003DF20(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  sub_1000098E0();
  sub_100009928();
  v6 = sub_100009884(v3, (uint64_t)a1, v4, v5, (uint64_t)&_mh_execute_header);
  sub_10000991C(v6);
  __break(1u);
}

void sub_10003DF98()
{
  _os_crash("unexpected failure: bogus return from getopt_long; forget to update the argument switch?");
  __break(1u);
}

void sub_10003DFB0(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  sub_1000098E0();
  sub_100009900();
  v6 = sub_100009884(v3, (uint64_t)a1, v4, v5, (uint64_t)&_mh_execute_header);
  sub_10000991C(v6);
  __break(1u);
}

void sub_10003E02C()
{
  _os_crash("unexpected failure: init routine called after transition to multithreaded");
  __break(1u);
}

void sub_10003E044()
{
  _os_crash("unexpected failure: multithreaded hack called before object init complete");
  __break(1u);
}

void sub_10003E05C(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  sub_1000098EC(&_os_log_default);
  __error();
  sub_100009900();
  v6 = sub_100009868(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000098F4(v6);
  __break(1u);
}

void sub_10003E0D8(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  sub_1000098E0();
  sub_100009928();
  v6 = sub_100009884(v3, (uint64_t)a1, v4, v5, (uint64_t)&_mh_execute_header);
  sub_10000991C(v6);
  __break(1u);
}

void sub_10003E150(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  sub_1000098EC(&_os_log_default);
  __error();
  sub_100009900();
  v6 = sub_100009868(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000098F4(v6);
  __break(1u);
}

void sub_10003E1CC(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  sub_1000098E0();
  sub_100009928();
  v6 = sub_100009884(v3, (uint64_t)a1, v4, v5, (uint64_t)&_mh_execute_header);
  sub_10000991C(v6);
  __break(1u);
}

void sub_10003E244(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  sub_1000098EC(&_os_log_default);
  __error();
  sub_100009900();
  v6 = sub_100009868(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000098F4(v6);
  __break(1u);
}

void sub_10003E2C0(void *a1, NSObject *a2)
{
  int v3;
  const char *string;

  v3 = 136315138;
  string = xpc_dictionary_get_string(a1, _xpc_error_key_description);
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Received error from client: %s", (uint8_t *)&v3, 0xCu);
}

void sub_10003E354(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unexpected subsystem message", v1, 2u);
}

void sub_10003E394(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000A2D4(a1, a2);
  sub_1000065E8();
  __error();
  sub_100009900();
  v6 = sub_100009868(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000098F4(v6);
  __break(1u);
}

void sub_10003E404(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000A2D4(a1, a2);
  sub_1000065E8();
  __error();
  sub_100009900();
  v6 = sub_100009868(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000098F4(v6);
  __break(1u);
}

void sub_10003E474(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000A2D4(a1, a2);
  sub_1000065E8();
  __error();
  sub_100009900();
  v6 = sub_100009868(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000098F4(v6);
  __break(1u);
}

void sub_10003E4E4()
{
  _os_crash("value not representable as size_t");
  __break(1u);
}

void sub_10003E4FC()
{
  _os_crash("unexpected failure: CFNumberGetValue failed");
  __break(1u);
}

void sub_10003E514(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    v4 = 3;
  else
    v4 = 2;
  v5 = _os_log_send_and_compose_impl(v4, a1, a2, 80, &_mh_execute_header, &_os_log_default, 16);
  _os_crash_msg(*a1, v5);
  __break(1u);
}

void sub_10003E5C0()
{
  _os_crash("value not representable as CFIndex");
  __break(1u);
}

void sub_10003E5D8(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000A2D4(a1, a2);
  sub_1000065E8();
  sub_10000AA60();
  v6 = sub_10000AA48(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000098F4(v6);
  __break(1u);
}

void sub_10003E64C(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000A2D4(a1, a2);
  sub_1000065E8();
  sub_10000AA60();
  v6 = sub_10000AA48(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000098F4(v6);
  __break(1u);
}

void sub_10003E6C0(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000A2D4(a1, a2);
  sub_1000065E8();
  sub_10000AA60();
  v6 = sub_10000AA48(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000098F4(v6);
  __break(1u);
}

void sub_10003E734(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000A2D4(a1, a2);
  sub_1000065E8();
  sub_10000AA60();
  v6 = sub_10000AA48(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000098F4(v6);
  __break(1u);
}

void sub_10003E7A8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000DF68((void *)&_mh_execute_header, a1, a3, "no reply context", a5, a6, a7, a8, 0);
}

void sub_10003E7DC(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    v4 = 3;
  else
    v4 = 2;
  __error();
  v5 = _os_log_send_and_compose_impl(v4, a1, a2, 80, &_mh_execute_header, &_os_log_default, 16);
  _os_crash_msg(*a1, v5);
  __break(1u);
}

void sub_10003E8A8(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    v4 = 3;
  else
    v4 = 2;
  __error();
  v5 = _os_log_send_and_compose_impl(v4, a1, a2, 80, &_mh_execute_header, &_os_log_default, 16);
  _os_crash_msg(*a1, v5);
  __break(1u);
}

void sub_10003E95C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000DF68((void *)&_mh_execute_header, a1, a3, "XPC payload with unexpected format", a5, a6, a7, a8, 0);
}

void sub_10003E990(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 134217984;
  v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Unexpected command %llu", (uint8_t *)&v2, 0xCu);
}

void sub_10003EA04(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000EE88(a1, a2);
  if (sub_1000098E0())
    v5 = 3;
  else
    v5 = 2;
  v6 = sub_10000EE70(v5, v2, v3, v4, (uint64_t)&_mh_execute_header);
  sub_10000991C(v6);
  __break(1u);
}

void sub_10003EA78(const char *a1, _QWORD *a2, _OWORD *a3)
{
  uint64_t v5;
  int *v6;
  uint64_t v7;

  strlen(a1);
  *a2 = 0;
  *a3 = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  a3[4] = 0u;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    v5 = 3;
  else
    v5 = 2;
  v6 = __error();
  strerror(*v6);
  v7 = _os_log_send_and_compose_impl(v5, a2, a3, 80, &_mh_execute_header, &_os_log_default, 16);
  _os_crash_msg(*a2, v7);
  __break(1u);
}

void sub_10003EB5C(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000A2D4(a1, a2);
  sub_1000065E8();
  __error();
  sub_100009900();
  v6 = sub_100009868(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000098F4(v6);
  __break(1u);
}

void sub_10003EBCC()
{
  _QWORD *v0;
  _OWORD *v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_1000116A4();
  sub_100011680(v0, v1);
  sub_1000098E0();
  v2 = __error();
  sub_100009978(v2);
  sub_100011634();
  v7 = sub_100011664(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  sub_100009944(v7);
  __break(1u);
}

void sub_10003EC48()
{
  _QWORD *v0;
  _OWORD *v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_1000116A4();
  sub_100011680(v0, v1);
  sub_1000098E0();
  v2 = __error();
  sub_100009978(v2);
  sub_100011634();
  v7 = sub_100011664(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  sub_100009944(v7);
  __break(1u);
}

void sub_10003ECC4()
{
  _QWORD *v0;
  _OWORD *v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_1000116A4();
  sub_100011680(v0, v1);
  sub_1000098E0();
  v2 = __error();
  sub_100009978(v2);
  sub_100011634();
  v7 = sub_100011664(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  sub_100009944(v7);
  __break(1u);
}

void sub_10003ED40()
{
  _QWORD *v0;
  _OWORD *v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_1000116A4();
  sub_100011680(v0, v1);
  sub_1000098E0();
  v2 = __error();
  sub_100009978(v2);
  sub_100011634();
  v7 = sub_100011664(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  sub_100009944(v7);
  __break(1u);
}

void sub_10003EDBC()
{
  _QWORD *v0;
  _OWORD *v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_1000116A4();
  sub_100011680(v0, v1);
  sub_1000098E0();
  v2 = __error();
  sub_100009978(v2);
  sub_100011634();
  v7 = sub_100011664(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  sub_100009944(v7);
  __break(1u);
}

void sub_10003EE38()
{
  _QWORD *v0;
  _OWORD *v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_1000116A4();
  sub_100011680(v0, v1);
  sub_1000098E0();
  v2 = __error();
  sub_100009978(v2);
  sub_100011634();
  v7 = sub_100011664(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  sub_100009944(v7);
  __break(1u);
}

void sub_10003EEB4()
{
  _QWORD *v0;
  _OWORD *v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_1000116A4();
  sub_100011680(v0, v1);
  sub_1000098E0();
  v2 = __error();
  sub_100009978(v2);
  sub_100011634();
  v7 = sub_100011664(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  sub_100009944(v7);
  __break(1u);
}

void sub_10003EF30(_QWORD *a1, _OWORD *a2)
{
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  sub_1000098EC(&_os_log_default);
  v2 = __error();
  sub_100009978(v2);
  sub_1000123C4();
  v7 = sub_1000123A8(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  sub_100009944(v7);
  __break(1u);
}

void sub_10003EFD4(const char *a1, _QWORD *a2, _OWORD *a3)
{
  uint64_t v5;
  int *v6;
  uint64_t v7;

  strlen(a1);
  *a2 = 0;
  *a3 = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  a3[4] = 0u;
  if (sub_1000098EC(&_os_log_default))
    v5 = 3;
  else
    v5 = 2;
  v6 = __error();
  sub_100009978(v6);
  sub_1000123C4();
  v7 = _os_log_send_and_compose_impl(v5, a2, a3, 80, &_mh_execute_header, &_os_log_default, 16);
  sub_100009944(v7);
  __break(1u);
}

void sub_10003F098(_QWORD *a1, _OWORD *a2)
{
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  sub_1000098EC(&_os_log_default);
  v2 = __error();
  sub_100009978(v2);
  sub_1000123C4();
  v7 = sub_1000123A8(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  sub_100009944(v7);
  __break(1u);
}

void sub_10003F13C(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    v4 = 3;
  else
    v4 = 2;
  v5 = __error();
  strerror(*v5);
  v6 = _os_log_send_and_compose_impl(v4, a1, a2, 80, &_mh_execute_header, &_os_log_default, 16);
  _os_crash_msg(*a1, v6);
  __break(1u);
}

void sub_10003F218(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  sub_1000098EC(&_os_log_default);
  sub_100009928();
  v6 = sub_100009884(v3, (uint64_t)a1, v4, v5, (uint64_t)&_mh_execute_header);
  sub_10000991C(v6);
  __break(1u);
}

void sub_10003F294(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  sub_1000098EC(&_os_log_default);
  sub_100009928();
  v6 = sub_100009884(v3, (uint64_t)a1, v4, v5, (uint64_t)&_mh_execute_header);
  sub_10000991C(v6);
  __break(1u);
}

void sub_10003F310()
{
  _os_crash("unexpected failure: activation count underflow");
  __break(1u);
}

void sub_10003F328(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000A2D4(a1, a2);
  sub_1000065E8();
  __error();
  sub_100009900();
  v6 = sub_100009868(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000098F4(v6);
  __break(1u);
}

void sub_10003F398(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  if (sub_1000065E8())
    v4 = 3;
  else
    v4 = 2;
  v5 = __error();
  strerror(*v5);
  v6 = _os_log_send_and_compose_impl(v4, a1, a2, 80, &_mh_execute_header, &_os_log_default, 16);
  sub_100009944(v6);
  __break(1u);
}

void sub_10003F45C(const char *a1, _QWORD *a2, _OWORD *a3)
{
  uint64_t v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  strlen(a1);
  *a2 = 0;
  *a3 = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  a3[4] = 0u;
  if (sub_1000098EC(&_os_log_default))
    v5 = 3;
  else
    v5 = 2;
  v6 = __error();
  strerror(*v6);
  v9 = sub_100009884(v5, (uint64_t)a2, v7, v8, (uint64_t)&_mh_execute_header);
  sub_100009944(v9);
  __break(1u);
}

void sub_10003F524()
{
  _os_crash("unexpected failure: stale core has no root asset");
  __break(1u);
}

void sub_10003F53C(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  sub_1000098EC(&_os_log_default);
  sub_100009928();
  v6 = sub_100009884(v3, (uint64_t)a1, v4, v5, (uint64_t)&_mh_execute_header);
  sub_10000991C(v6);
  __break(1u);
}

void sub_10003F5B8(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  sub_1000098EC(&_os_log_default);
  sub_100009928();
  v6 = sub_100009884(v3, (uint64_t)a1, v4, v5, (uint64_t)&_mh_execute_header);
  sub_10000991C(v6);
  __break(1u);
}

void sub_10003F634(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000A2D4(a1, a2);
  if (sub_1000065E8())
    v5 = 3;
  else
    v5 = 2;
  v6 = sub_10000AA48(v5, v2, v3, v4, (uint64_t)&_mh_execute_header);
  sub_1000098F4(v6);
  __break(1u);
}

void sub_10003F6B0(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000A2D4(a1, a2);
  if (sub_1000065E8())
    v5 = 3;
  else
    v5 = 2;
  v6 = sub_10000AA48(v5, v2, v3, v4, (uint64_t)&_mh_execute_header);
  sub_1000098F4(v6);
  __break(1u);
}

void sub_10003F72C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001F304((void *)&_mh_execute_header, a2, a3, "Collation: Creating new collation for user %d", a5, a6, a7, a8, 0);
}

void sub_10003F798(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    v4 = 3;
  else
    v4 = 2;
  v5 = _os_log_send_and_compose_impl(v4, a1, a2, 80, &_mh_execute_header, &_os_log_default, 16);
  _os_crash_msg(*a1, v5);
  __break(1u);
}

void sub_10003F848(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001F304((void *)&_mh_execute_header, a2, a3, "Collation: No remaining mounts for user %d", a5, a6, a7, a8, 0);
}

void sub_10003F8B4()
{
  _os_crash("unexpected failure: Removal of collation failed.");
  __break(1u);
}

void sub_10003F8CC(uint64_t a1, int *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *a2;
  v5 = 136315394;
  v6 = v3;
  v7 = 1024;
  v8 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Collation: Removing path [%s] for user %d", (uint8_t *)&v5, 0x12u);
}

void sub_10003F958(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000A2D4(a1, a2);
  if (sub_1000065E8())
    v5 = 3;
  else
    v5 = 2;
  v6 = sub_10000AA48(v5, v2, v3, v4, (uint64_t)&_mh_execute_header);
  sub_1000098F4(v6);
  __break(1u);
}

void sub_10003F9D4(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (sub_1000065E8())
    v5 = 3;
  else
    v5 = 2;
  v6 = sub_10000AA48(v5, v2, v3, v4, (uint64_t)&_mh_execute_header);
  sub_1000098F4(v6);
  __break(1u);
}

void sub_10003FA58(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (sub_1000065E8())
    v5 = 3;
  else
    v5 = 2;
  v6 = sub_10000AA48(v5, v2, v3, v4, (uint64_t)&_mh_execute_header);
  sub_1000098F4(v6);
  __break(1u);
}

void sub_10003FADC(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  sub_1000065E8();
  sub_10000AA60();
  v6 = sub_10000AA48(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000098F4(v6);
  __break(1u);
}

void sub_10003FB58(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  sub_1000065E8();
  sub_10000AA60();
  v6 = sub_10000AA48(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000098F4(v6);
  __break(1u);
}

void sub_10003FBD4(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  sub_1000065E8();
  sub_10000AA60();
  v6 = sub_10000AA48(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000098F4(v6);
  __break(1u);
}

void sub_10003FC50(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  sub_1000065E8();
  sub_10000AA60();
  v6 = sub_10000AA48(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000098F4(v6);
  __break(1u);
}

void sub_10003FCCC(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  sub_1000065E8();
  sub_10000AA60();
  v6 = sub_10000AA48(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000098F4(v6);
  __break(1u);
}

void sub_10003FD48(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  sub_1000098EC(&_os_log_default);
  sub_100009928();
  v6 = sub_10000EE70(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_10000991C(v6);
  __break(1u);
}

void sub_10003FDC0(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  if (sub_1000098EC(&_os_log_default))
    v5 = 3;
  else
    v5 = 2;
  v6 = sub_10000EE70(v5, v2, v3, v4, (uint64_t)&_mh_execute_header);
  sub_10000991C(v6);
  __break(1u);
}

void sub_10003FE54()
{
  _os_crash("unexpected failure: failed to get notification port");
  __break(1u);
}

void sub_10003FE6C(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  sub_1000098EC(&_os_log_default);
  sub_100009928();
  v6 = sub_10000EE70(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_10000991C(v6);
  __break(1u);
}

void sub_10003FEE4()
{
  _os_crash("unexpected failure: CFString conversion failed");
  __break(1u);
}

void sub_10003FEFC()
{
  _os_crash("unexpected failure: bsd name not present as string in subnode");
  __break(1u);
}

void sub_10003FF14()
{
  _os_crash("unexpected failure: bsd name not present as string in whole disk node");
  __break(1u);
}

void sub_10003FF2C(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  sub_1000098EC(&_os_log_default);
  sub_100009928();
  v6 = sub_10000EE70(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_10000991C(v6);
  __break(1u);
}

void sub_10003FFA4(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  if (sub_1000065E8())
    v2 = 3;
  else
    v2 = 2;
  __error();
  sub_100009900();
  v6 = sub_10000AA48(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000098F4(v6);
  __break(1u);
}

void sub_100040020(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  if (sub_1000065E8())
    v2 = 3;
  else
    v2 = 2;
  __error();
  sub_100009900();
  v6 = sub_10000AA48(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000098F4(v6);
  __break(1u);
}

void sub_10004009C(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  if (sub_1000065E8())
    v2 = 3;
  else
    v2 = 2;
  __error();
  sub_100009900();
  v6 = sub_10000AA48(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000098F4(v6);
  __break(1u);
}

void sub_100040118(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  if (sub_1000065E8())
    v2 = 3;
  else
    v2 = 2;
  __error();
  sub_100009900();
  v6 = sub_10000AA48(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000098F4(v6);
  __break(1u);
}

void sub_100040194(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  sub_1000098EC(&_os_log_default);
  sub_10000AA60();
  v6 = sub_10000EE70(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_10000991C(v6);
  __break(1u);
}

void sub_100040214(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;

  sub_100009898(a1, a2);
  if (sub_1000065E8())
    v4 = 3;
  else
    v4 = 2;
  v5 = __error();
  strerror(*v5);
  sub_100026900();
  v7 = sub_1000065D8(v4, (uint64_t)a1, (uint64_t)a2, v6, (uint64_t)&_mh_execute_header);
  sub_100009944(v7);
  __break(1u);
}

void sub_1000402B8(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;

  sub_100009898(a1, a2);
  if (sub_1000065E8())
    v4 = 3;
  else
    v4 = 2;
  v5 = __error();
  strerror(*v5);
  sub_100026900();
  v7 = sub_1000065D8(v4, (uint64_t)a1, (uint64_t)a2, v6, (uint64_t)&_mh_execute_header);
  sub_100009944(v7);
  __break(1u);
}

void sub_10004035C(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  sub_1000098EC(&_os_log_default);
  __error();
  sub_100009900();
  v7 = sub_100029AD8(v3, v4, v5, v6, (uint64_t)&_mh_execute_header, (uint64_t)&_os_log_default);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_100040400(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  sub_1000098EC(&_os_log_default);
  __error();
  sub_100009900();
  v7 = sub_100029AD8(v3, v4, v5, v6, (uint64_t)&_mh_execute_header, (uint64_t)&_os_log_default);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_1000404A4(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (sub_1000098EC(&_os_log_default))
    v4 = 3;
  else
    v4 = 2;
  __error();
  sub_100009900();
  v5 = _os_log_send_and_compose_impl(v4, a1, a2, 80, &_mh_execute_header, &_os_log_default, 16);
  _os_crash_msg(*a1, v5);
  __break(1u);
}

void sub_100040548()
{
  _os_crash("unexpected failure: subsystem not found");
  __break(1u);
}

void sub_100040560(_QWORD *a1, _OWORD *a2)
{
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_10000A2D4(a1, a2);
  sub_1000065E8();
  v2 = __error();
  sub_100009978(v2);
  sub_10002A974();
  v7 = sub_100009868(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  sub_1000098F4(v7);
  __break(1u);
}

void sub_1000405D0(uint64_t a1)
{
  int v1;
  uint64_t v2;

  v1 = 136315138;
  v2 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Subsystem unknown %s", (uint8_t *)&v1, 0xCu);
}

void sub_10004064C(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10002B284(a1, a2);
  sub_1000098E0();
  sub_10002B2A4();
  v6 = sub_10000EE70(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_10000991C(v6);
  __break(1u);
}

void sub_1000406B8(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10002B284(a1, a2);
  if (sub_1000098E0())
    v5 = 3;
  else
    v5 = 2;
  v6 = sub_10000EE70(v5, v2, v3, v4, (uint64_t)&_mh_execute_header);
  sub_10000991C(v6);
  __break(1u);
}

void sub_100040730(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10002B284(a1, a2);
  sub_1000098E0();
  sub_10002B2A4();
  v6 = sub_10000EE70(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_10000991C(v6);
  __break(1u);
}

void sub_10004079C(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  if (sub_1000098EC(&_os_log_default))
    v5 = 3;
  else
    v5 = 2;
  v6 = sub_100009884(v5, (uint64_t)a1, v3, v4, (uint64_t)&_mh_execute_header);
  sub_10000991C(v6);
  __break(1u);
}

void sub_100040824(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  if (sub_1000098EC(&_os_log_default))
    v5 = 3;
  else
    v5 = 2;
  v6 = sub_1000065D8(v5, (uint64_t)a1, (uint64_t)a2, v4, (uint64_t)&_mh_execute_header);
  sub_1000098F4(v6);
  __break(1u);
}

void sub_1000408AC(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  if (sub_1000098EC(&_os_log_default))
    v5 = 3;
  else
    v5 = 2;
  v6 = sub_1000065D8(v5, (uint64_t)a1, (uint64_t)a2, v4, (uint64_t)&_mh_execute_header);
  sub_1000098F4(v6);
  __break(1u);
}

void sub_10004093C()
{
  _os_crash("unexpected failure: invalid value in dependency array during second iteration");
  __break(1u);
}

void sub_100040954()
{
  uint64_t v0;
  const char *v1;
  uint64_t v2;
  int *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_1000116A4();
  sub_10000996C(v1);
  sub_100009950();
  if (sub_1000098EC(&_os_log_default))
    v2 = 3;
  else
    v2 = 2;
  v3 = __error();
  sub_100009978(v3);
  sub_1000098B0();
  v6 = sub_100009884(v2, v0, v4, v5, (uint64_t)&_mh_execute_header);
  sub_100009944(v6);
  __break(1u);
}

void sub_1000409E0(_QWORD *a1, _OWORD *a2, const _xpc_type_s *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_100009898(a1, a2);
  if (sub_1000098EC(&_os_log_default))
    v5 = 3;
  else
    v5 = 2;
  xpc_type_get_name(a3);
  v8 = sub_100009884(v5, (uint64_t)a1, v6, v7, (uint64_t)&_mh_execute_header);
  sub_10000991C(v8);
  __break(1u);
}

void sub_100040A78()
{
  _os_crash("unexpected failure: unable to find quire for dependency that existed in collation map");
  __break(1u);
}

void sub_100040A90()
{
  _OWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;

  sub_1000116A4();
  v1 = (uint64_t)v0;
  v3 = (uint64_t)v2;
  sub_100009898(v2, v0);
  if (sub_1000098EC(&_os_log_default))
    v4 = 3;
  else
    v4 = 2;
  v5 = __error();
  sub_100009978(v5);
  sub_1000123C4();
  v7 = sub_1000065D8(v4, v3, v1, v6, (uint64_t)&_mh_execute_header);
  sub_100009944(v7);
  __break(1u);
}

void sub_100040B38(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  if (sub_1000098EC(&_os_log_default))
    v4 = 3;
  else
    v4 = 2;
  __error();
  sub_100009900();
  v6 = sub_1000065D8(v4, (uint64_t)a1, (uint64_t)a2, v5, (uint64_t)&_mh_execute_header);
  sub_1000098F4(v6);
  __break(1u);
}

void sub_100040BC0(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;

  sub_100009898(a1, a2);
  if (sub_1000098EC(&_os_log_default))
    v4 = 3;
  else
    v4 = 2;
  v5 = __error();
  sub_100009978(v5);
  sub_1000123C4();
  v7 = sub_1000065D8(v4, (uint64_t)a1, (uint64_t)a2, v6, (uint64_t)&_mh_execute_header);
  sub_100009944(v7);
  __break(1u);
}

void sub_100040C68(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  sub_1000098EC(&_os_log_default);
  sub_1000365BC();
  v6 = sub_100009884(v3, (uint64_t)a1, v4, v5, (uint64_t)&_mh_execute_header);
  sub_10000991C(v6);
  __break(1u);
}

void sub_100040CE8(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  if (sub_1000098EC(&_os_log_default))
    v5 = 3;
  else
    v5 = 2;
  v6 = sub_1000065D8(v5, (uint64_t)a1, (uint64_t)a2, v4, (uint64_t)&_mh_execute_header);
  sub_1000098F4(v6);
  __break(1u);
}

void sub_100040D70(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  sub_1000098EC(&_os_log_default);
  sub_1000365BC();
  v6 = sub_100009884(v3, (uint64_t)a1, v4, v5, (uint64_t)&_mh_execute_header);
  sub_10000991C(v6);
  __break(1u);
}

void sub_100040DF0(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;

  sub_100009898(a1, a2);
  if (sub_1000098EC(&_os_log_default))
    v4 = 3;
  else
    v4 = 2;
  v5 = __error();
  sub_100009978(v5);
  sub_1000123C4();
  v7 = sub_1000065D8(v4, (uint64_t)a1, (uint64_t)a2, v6, (uint64_t)&_mh_execute_header);
  sub_100009944(v7);
  __break(1u);
}

void sub_100040E98()
{
  _os_crash("unexpected failure: husk unclaimed by callee");
  __break(1u);
}

void sub_100040EB0(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100009898(a1, a2);
  if (sub_1000098EC(&_os_log_default))
    v5 = 3;
  else
    v5 = 2;
  v6 = sub_100009884(v5, (uint64_t)a1, v3, v4, (uint64_t)&_mh_execute_header);
  sub_10000991C(v6);
  __break(1u);
}

void sub_100040F38(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;

  sub_100009898(a1, a2);
  if (sub_1000098EC(&_os_log_default))
    v4 = 3;
  else
    v4 = 2;
  v5 = __error();
  sub_100009978(v5);
  sub_1000123C4();
  v7 = sub_1000065D8(v4, (uint64_t)a1, (uint64_t)a2, v6, (uint64_t)&_mh_execute_header);
  sub_100009944(v7);
  __break(1u);
}

void sub_100040FE0(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;

  sub_100009898(a1, a2);
  if (sub_1000098EC(&_os_log_default))
    v4 = 3;
  else
    v4 = 2;
  v5 = __error();
  sub_100009978(v5);
  sub_1000123C4();
  v7 = sub_1000065D8(v4, (uint64_t)a1, (uint64_t)a2, v6, (uint64_t)&_mh_execute_header);
  sub_100009944(v7);
  __break(1u);
}

void sub_100041088()
{
  _os_crash("unexpected failure: underflow of activation count");
  __break(1u);
}

void sub_1000410A0()
{
  _os_crash("unexpected failure: pipeline_start_state_destroyed before consuming rpc");
  __break(1u);
}

void sub_1000410B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100038ED4((void *)&_mh_execute_header, &_os_log_default, a3, "Unexpected domain type %s", a5, a6, a7, a8, 2u);
}

void sub_100041130(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  sub_100038ED4((void *)&_mh_execute_header, &_os_log_default, v2, "Unpending failed: %@", v3, v4, v5, v6, 2u);

  sub_100038EF4();
}

void sub_1000411B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100038EE4((void *)&_mh_execute_header, &_os_log_default, a3, "Failed to find targetDomain %d", a5, a6, a7, a8, 0);
  sub_100038F00();
}

void sub_10004121C(void *a1)
{
  void *v1;
  int v2;
  void *v3;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  v2 = 138412290;
  v3 = v1;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Initiating removal for domain failed: %@", (uint8_t *)&v2, 0xCu);

  sub_100038EF4();
}

void sub_1000412A8()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Invalid type for CryptexSessionKeystone", v0, 2u);
  sub_100038F00();
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByDeletingLastPathComponent");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend__abort(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_abort");
}

id objc_msgSend__completeUpgradeSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_completeUpgradeSession");
}

id objc_msgSend__completeUpgradeWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_completeUpgradeWithError:");
}

id objc_msgSend__disableInterfaceLockTimeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_disableInterfaceLockTimeout");
}

id objc_msgSend__handleInterfaceLockMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleInterfaceLockMessage:");
}

id objc_msgSend__isInterfaceLocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isInterfaceLocked");
}

id objc_msgSend__restartInterfaceLockTimeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_restartInterfaceLockTimeout");
}

id objc_msgSend__setKernelUpgradeOngoing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setKernelUpgradeOngoing:");
}

id objc_msgSend__startUpgradeForCryptex_withGraftPath_killingJobs_withCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startUpgradeForCryptex:withGraftPath:killingJobs:withCompletion:");
}

id objc_msgSend__timeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_timeout");
}

id objc_msgSend__unlockInterface(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_unlockInterface");
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activate");
}

id objc_msgSend_addCryptexSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addCryptexSession:");
}

id objc_msgSend_addEntryForUser_fromQuire_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntryForUser:fromQuire:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_appendCollationElement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendCollationElement:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_broadcastEvent_forCryptex_withInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "broadcastEvent:forCryptex:withInfo:");
}

id objc_msgSend_broadcastEvent_forCryptex_withInfo_toClients_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "broadcastEvent:forCryptex:withInfo:toClients:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_cancelHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelHandler");
}

id objc_msgSend_cancelMonitor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelMonitor");
}

id objc_msgSend_cancelPeerConnections(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelPeerConnections");
}

id objc_msgSend_clientName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientName");
}

id objc_msgSend_clients(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clients");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_coll_map(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coll_map");
}

id objc_msgSend_completeUpgrade(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completeUpgrade");
}

id objc_msgSend_conn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conn");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_copyJobWithLabel_domain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyJobWithLabel:domain:");
}

id objc_msgSend_copySessionName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copySessionName");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createCryptexSessionList(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createCryptexSessionList");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createEndpoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createEndpoint");
}

id objc_msgSend_createSymbolicLinkAtPath_withDestinationPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createSymbolicLinkAtPath:withDestinationPath:error:");
}

id objc_msgSend_cred(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cred");
}

id objc_msgSend_cryptexName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cryptexName");
}

id objc_msgSend_cs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cs");
}

id objc_msgSend_currentDomain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentDomain");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_domainForRoleAccountUser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domainForRoleAccountUser:");
}

id objc_msgSend_dq(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dq");
}

id objc_msgSend_enumerateCollationElements_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateCollationElements:");
}

id objc_msgSend_enumerateElements_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateElements:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "error");
}

id objc_msgSend_eventMask(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventMask");
}

id objc_msgSend_exit_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exit_code");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_findCryptexSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "findCryptexSession:");
}

id objc_msgSend_getDispatchQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDispatchQueue");
}

id objc_msgSend_getMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getMap");
}

id objc_msgSend_getSharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSharedInstance");
}

id objc_msgSend_group(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "group");
}

id objc_msgSend_handle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handle");
}

id objc_msgSend_handlePublisherAddToken_descriptor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handlePublisherAddToken:descriptor:");
}

id objc_msgSend_handlePublisherInitialBarrier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handlePublisherInitialBarrier");
}

id objc_msgSend_handlePublisherRemoveToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handlePublisherRemoveToken:");
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexOfObjectPassingTest:");
}

id objc_msgSend_initWithBundle_version_atPath_withScope_withCommand_withCommandArgs_withEnv_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundle:version:atPath:withScope:withCommand:withCommandArgs:withEnv:");
}

id objc_msgSend_initWithConn_log_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConn:log:");
}

id objc_msgSend_initWithCore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCore:");
}

id objc_msgSend_initWithCryptexName_graftPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCryptexName:graftPath:");
}

id objc_msgSend_initWithEventStream_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEventStream:");
}

id objc_msgSend_initWithID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithID:");
}

id objc_msgSend_initWithPlist_domain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPlist:domain:");
}

id objc_msgSend_initWithToken_name_eventMask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithToken:name:eventMask:");
}

id objc_msgSend_initiateRemoval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initiateRemoval:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_isEmpty(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEmpty");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyEnumerator");
}

id objc_msgSend_lastExitStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastExitStatus");
}

id objc_msgSend_lastSpawnError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastSpawnError");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_list(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "list");
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listener");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_lockAcquireQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lockAcquireQueue");
}

id objc_msgSend_lockTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lockTimer");
}

id objc_msgSend_lockingClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lockingClient");
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "log");
}

id objc_msgSend_logHandle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logHandle");
}

id objc_msgSend_lookupEntryForUser_withBundleID_minVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lookupEntryForUser:withBundleID:minVersion:");
}

id objc_msgSend_monitorOnQueue_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "monitorOnQueue:withHandler:");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_onCancel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "onCancel:");
}

id objc_msgSend_onComplete_withQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "onComplete:withQueue:");
}

id objc_msgSend_onUpgradeCompleteForCryptex_withCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "onUpgradeCompleteForCryptex:withCompletion:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathComponents");
}

id objc_msgSend_peer_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "peer_array");
}

id objc_msgSend_publisher(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "publisher");
}

id objc_msgSend_quire_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "quire_array");
}

id objc_msgSend_registrationQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registrationQueue");
}

id objc_msgSend_remove_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remove:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeCollationElementWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeCollationElementWithPath:");
}

id objc_msgSend_removeCryptexSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeCryptexSession:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_sandboxHandles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sandboxHandles");
}

id objc_msgSend_sendAlreadyInstalledCryptexesToClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendAlreadyInstalledCryptexesToClient:");
}

id objc_msgSend_sessionAddCptxWithBundleID_withType_dmgFd_trustCacheFD_manifestFD_volumeHashFD_infoPlistFd_cx1Properties_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionAddCptxWithBundleID:withType:dmgFd:trustCacheFD:manifestFD:volumeHashFD:infoPlistFd:cx1Properties:");
}

id objc_msgSend_sessionAddParseXPC_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionAddParseXPC:");
}

id objc_msgSend_sessionCompleteCallback(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionCompleteCallback");
}

id objc_msgSend_sessionEventNotify_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionEventNotify:");
}

id objc_msgSend_sessionMessageReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionMessageReply:");
}

id objc_msgSend_sessionStart(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionStart");
}

id objc_msgSend_sessionStopWithReason_exitCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionStopWithReason:exitCode:");
}

id objc_msgSend_session_removal_begun(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "session_removal_begun");
}

id objc_msgSend_session_work_group(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "session_work_group");
}

id objc_msgSend_setAttributes_ofItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttributes:ofItemAtPath:error:");
}

id objc_msgSend_setColl_map_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setColl_map:");
}

id objc_msgSend_setCs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCs:");
}

id objc_msgSend_setDq_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDq:");
}

id objc_msgSend_setError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setError:");
}

id objc_msgSend_setExitReason_withCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExitReason:withCode:");
}

id objc_msgSend_setListener_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setListener:");
}

id objc_msgSend_setLockingClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLockingClient:");
}

id objc_msgSend_setLog_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLog:");
}

id objc_msgSend_setLog_handle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLog_handle:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setName:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPeer_array_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPeer_array:");
}

id objc_msgSend_setQuire_array_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQuire_array:");
}

id objc_msgSend_setSandboxHandles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSandboxHandles:");
}

id objc_msgSend_setSessionCompleteCallback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSessionCompleteCallback:");
}

id objc_msgSend_setSession_removal_begun_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSession_removal_begun:");
}

id objc_msgSend_setSession_work_group_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSession_work_group:");
}

id objc_msgSend_setStop_reason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStop_reason:");
}

id objc_msgSend_setupHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupHandler");
}

id objc_msgSend_sharedList(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedList");
}

id objc_msgSend_startUpgrade(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startUpgrade");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "state");
}

id objc_msgSend_stop_reason(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stop_reason");
}

id objc_msgSend_stringByResolvingSymlinksInPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByResolvingSymlinksInPath");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_submit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "submit:");
}

id objc_msgSend_terminateJobsWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "terminateJobsWithCompletion:");
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "token");
}

id objc_msgSend_unpendLaunches_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unpendLaunches:");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_upgradesUnderway(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "upgradesUnderway");
}

id objc_msgSend_wait4Status(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wait4Status");
}

id objc_msgSend_withInstalledCryptexList_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "withInstalledCryptexList:");
}

id objc_msgSend_workQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "workQueue");
}

id objc_msgSend_writeToFile_atomically_encoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:encoding:error:");
}
