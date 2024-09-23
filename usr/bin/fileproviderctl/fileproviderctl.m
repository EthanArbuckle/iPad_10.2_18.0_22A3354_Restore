NSMutableDictionary *sub_1000030D4(void *a1)
{
  id v1;
  NSMutableDictionary *v2;
  _QWORD v4[4];
  NSMutableDictionary *v5;

  v1 = a1;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100003160;
  v4[3] = &unk_1000145E8;
  v2 = objc_opt_new(NSMutableDictionary);
  v5 = v2;
  objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v4);

  return v2;
}

void sub_100003160(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    v7 = sub_1000030D4(v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
LABEL_5:
    v10 = (void *)v8;

    v5 = v10;
    goto LABEL_6;
  }
  v9 = objc_opt_class(NSURL);
  if ((objc_opt_isKindOfClass(v5, v9) & 1) != 0)
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path"));
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v11);

}

void sub_100003218(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FPDaemonConnection sharedConnection](FPDaemonConnection, "sharedConnection"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000032A8;
  v6[3] = &unk_100014610;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "providerDomainsCompletionHandler:", v6);

}

void sub_1000032A8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void (*v7)(void);
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *i;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v16 = v8;
      v17 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v17)
            objc_enumerationMutation(v6);
          sub_100009E24(CFSTR("%@"), v9, v10, v11, v12, v13, v14, v15, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i));
        }
        v16 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v16);
    }
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v7();

}

void sub_1000033D4(int a1, char *const *a2, void *a3)
{
  id v3;
  NSObject *v4;
  int v5;
  uint64_t *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD *v11;
  _QWORD v12[4];
  NSObject *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;
  char **v21;
  int v22;

  v22 = a1;
  v21 = (char **)a2;
  v3 = a3;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = sub_1000035B4;
  v19[4] = sub_1000035C4;
  v20 = 0;
  v4 = dispatch_group_create();
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = sub_1000035B4;
  v17[4] = sub_1000035C4;
  v18 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000036B0;
  v16[3] = &unk_100014678;
  v16[4] = v17;
  sub_1000035CC(&v22, (char *const **)&v21, "B:", (const option *)&off_100014630, v16);
  dispatch_group_enter(v4);
  v5 = v22;
  v6 = (uint64_t *)v21;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100003738;
  v12[3] = &unk_1000146C8;
  v14 = v19;
  v7 = v4;
  v13 = v7;
  v15 = v17;
  sub_10000B84C(v5, v6, 2, v12);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100003B7C;
  v9[3] = &unk_1000146F0;
  v10 = v3;
  v11 = v19;
  v8 = v3;
  dispatch_group_notify(v7, (dispatch_queue_t)&_dispatch_main_q, v9);

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);

}

void sub_100003590(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000035B4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000035C4(uint64_t a1)
{

}

void sub_1000035CC(int *a1, char *const **a2, const char *a3, const option *a4, void *a5)
{
  int v9;
  uint64_t v10;
  void (**v11)(id, _QWORD, char *);

  v11 = a5;
  v9 = 1;
  optreset = 1;
  optind = 1;
  if ((unint64_t)a3 | (unint64_t)a4)
  {
    while (1)
    {
      v10 = getopt_long(*a1, *a2, a3, a4, 0);
      if ((_DWORD)v10 == -1)
        break;
      if ((_DWORD)v10 == 63 || (_DWORD)v10 == 58)
        sub_1000043C0();
      v11[2](v11, v10, optarg);
    }
    v9 = optind;
  }
  *a1 -= v9;
  *a2 += optind;

}

void sub_1000036B0(uint64_t a1, int a2, char *__s1)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *v9;

  if (a2 == 66)
  {
    if (!strcmp(__s1, "root"))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v9 = NSFileProviderRootContainerItemIdentifier;
      v7 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v9;
    }
    else
    {
      v5 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", __s1));
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;
    }

  }
}

void sub_100003738(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[5];
  __int128 v23;
  _QWORD v24[5];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v5 = a2;
  v19 = a3;
  if (v19)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
          if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
          {
            v11 = objc_alloc((Class)FPItemID);
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
            v13 = objc_msgSend(v11, "initWithProviderDomainID:itemIdentifier:", v12, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

            v14 = (void *)objc_claimAutoreleasedReturnValue(+[FPDaemonConnection sharedConnectionProxy](FPDaemonConnection, "sharedConnectionProxy"));
            v24[0] = _NSConcreteStackBlock;
            v24[1] = 3221225472;
            v24[2] = sub_1000039BC;
            v24[3] = &unk_1000146A0;
            v24[4] = v10;
            v20 = *(_OWORD *)(a1 + 32);
            v15 = (id)v20;
            v25 = v20;
            objc_msgSend(v14, "waitForChangesOnItemsBelowItemWithID:completionHandler:", v13, v24);

          }
          else
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[FPDaemonConnection sharedConnectionProxy](FPDaemonConnection, "sharedConnectionProxy"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
            v22[0] = _NSConcreteStackBlock;
            v22[1] = 3221225472;
            v22[2] = sub_100003A9C;
            v22[3] = &unk_1000146A0;
            v22[4] = v10;
            v21 = *(_OWORD *)(a1 + 32);
            v18 = (id)v21;
            v23 = v21;
            objc_msgSend(v16, "waitForStabilizationOfDomainWithID:completionHandler:", v17, v22);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v7);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void sub_1000039BC(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  id v29;

  v29 = a2;
  if (objc_msgSend(v29, "fp_isFeatureUnsupportedError"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));
    sub_100009E24(CFSTR("☑️  domain %@ does not support stabilization"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));
    if (v29)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedDescription"));
      sub_100009F38(CFSTR("⚠️  stabilization of domain %@ failed: %@"), v18, v19, v20, v21, v22, v23, v24, (uint64_t)v3);

      v25 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v26 = *(void **)(v25 + 40);
      if (!v26)
        v26 = v29;
      v27 = v26;
      v3 = *(void **)(v25 + 40);
      *(_QWORD *)(v25 + 40) = v27;
    }
    else
    {
      sub_100009E24(CFSTR("✅  domain %@ is stable"), v11, v12, v13, v14, v15, v16, v17, (uint64_t)v3);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_100003A9C(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  id v29;

  v29 = a2;
  if (objc_msgSend(v29, "fp_isFeatureUnsupportedError"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));
    sub_100009E24(CFSTR("☑️  domain %@ does not support stabilization"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));
    if (v29)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedDescription"));
      sub_100009F38(CFSTR("⚠️  stabilization of domain %@ failed: %@"), v18, v19, v20, v21, v22, v23, v24, (uint64_t)v3);

      v25 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v26 = *(void **)(v25 + 40);
      if (!v26)
        v26 = v29;
      v27 = v26;
      v3 = *(void **)(v25 + 40);
      *(_QWORD *)(v25 + 40) = v27;
    }
    else
    {
      sub_100009E24(CFSTR("✅  domain %@ is stable"), v11, v12, v13, v14, v15, v16, v17, (uint64_t)v3);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t sub_100003B7C(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

uint64_t sub_100003B94(uint64_t a1, const char **a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  unsigned int v17;
  posix_spawn_file_actions_t v18;
  pid_t v19[2];

  v18 = 0;
  *(_QWORD *)v19 = 0;
  v3 = posix_spawn_file_actions_init(&v18);
  if ((_DWORD)v3)
  {
    v4 = v3;
    v5 = fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    goto LABEL_13;
  }
  v7 = posix_spawn_file_actions_adddup2(&v18, 2, 2);
  if ((_DWORD)v7)
  {
    v4 = v7;
    v8 = fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    goto LABEL_13;
  }
  v9 = posix_spawn_file_actions_adddup2(&v18, 1, 1);
  if ((_DWORD)v9)
  {
    v4 = v9;
    v10 = fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    goto LABEL_13;
  }
  v11 = posix_spawn_file_actions_adddup2(&v18, 0, 0);
  if ((_DWORD)v11)
  {
    v4 = v11;
    v12 = fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
LABEL_12:
      sub_10000D9E8(v4);
LABEL_13:

    return v4;
  }
  v14 = posix_spawnp(v19, *a2, &v18, 0, (char *const *)a2, environ);
  if ((_DWORD)v14)
  {
    v4 = v14;
    v15 = fp_current_or_default_log();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_10000D954((uint64_t *)a2, v4, v16);

  }
  else
  {
    while (waitpid(v19[0], &v19[1], 0) < 0 && *__error() == 4)
      ;
    posix_spawn_file_actions_destroy(&v18);
    if ((v19[1] & 0xFF00) != 0)
      v17 = 3;
    else
      v17 = 0;
    if ((v19[1] & 0x7F) != 0)
      return 3;
    else
      return v17;
  }
  return v4;
}

void sub_100003D70(int a1, char *const *a2, void *a3)
{
  id v3;
  id v4;
  int v5;
  int v6;
  id v7;
  NSDate *v8;
  uint64_t v9;
  NSOperationQueue *v10;
  NSDate *v11;
  _QWORD v12[4];
  NSDate *v13;
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  _QWORD *v17;
  char *const *v18;
  int v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  uint64_t *v24;
  _QWORD *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  NSMutableArray *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  _QWORD v38[4];
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  char *const *v43;
  int v44;

  v44 = a1;
  v43 = a2;
  v3 = a3;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  v38[3] = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_1000035B4;
  v32 = sub_1000035C4;
  v33 = 0;
  v33 = objc_opt_new(NSMutableArray);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000040A4;
  v22[3] = &unk_100014820;
  v24 = &v39;
  v25 = v38;
  v26 = &v34;
  v4 = v3;
  v23 = v4;
  v27 = &v28;
  sub_1000035CC(&v44, &v43, "R:r:w:d:et:", (const option *)&off_100014710, v22);
  v5 = *((unsigned __int8 *)v40 + 24);
  if (v5 == (objc_msgSend((id)v29[5], "count") != 0))
    sub_1000043C0();
  v6 = v44;
  if (v44 >= 1 && *((_BYTE *)v35 + 24))
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSError fp_errorWithPOSIXCode:description:](NSError, "fp_errorWithPOSIXCode:description:", 22, CFSTR("Can't specify both a timeout and a subcommand")));
    (*((void (**)(id, id))v4 + 2))(v4, v7);
  }
  else if (*((_BYTE *)v40 + 24))
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000043E8;
    v20[3] = &unk_100014848;
    v21 = v4;
    +[NSFileCoordinator _getDebugInfoWithCompletionHandler:](NSFileCoordinator, "_getDebugInfoWithCompletionHandler:", v20);
    v7 = v21;
  }
  else
  {
    v7 = objc_msgSend(objc_alloc((Class)NSFileCoordinator), "initWithFilePresenter:", 0);
    v8 = objc_opt_new(NSDate);
    v9 = v29[5];
    v10 = objc_opt_new(NSOperationQueue);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100004428;
    v12[3] = &unk_100014870;
    v11 = v8;
    v13 = v11;
    v14 = v4;
    v15 = &v28;
    v19 = v6;
    v16 = &v34;
    v17 = v38;
    v18 = v43;
    objc_msgSend(v7, "coordinateAccessWithIntents:queue:byAccessor:", v9, v10, v12);

  }
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(v38, 8);
  _Block_object_dispose(&v39, 8);

}

void sub_100004058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  uint64_t v35;

  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 192), 8);
  _Block_object_dispose((const void *)(v35 - 160), 8);
  _Block_object_dispose((const void *)(v35 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1000040A4(_QWORD *a1, int a2, uint64_t a3)
{
  uint64_t v5;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  NSObject *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_1000035B4;
  v31 = sub_1000035C4;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_1000035B4;
  v25 = sub_1000035C4;
  v5 = (a2 - 82);
  v26 = 0;
  if (v5 <= 0x25)
  {
    if (((1 << (a2 - 82)) & 0x2100040001) != 0)
    {
      v7 = dispatch_group_create();
      dispatch_group_enter(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a3));
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100004338;
      v17[3] = &unk_1000147F8;
      v19 = &v27;
      v20 = &v21;
      v9 = v7;
      v18 = v9;
      sub_10000A050(v8, 1, 0, v17);

      dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
      goto LABEL_9;
    }
    if (v5 == 19)
    {
      v12 = a1[5];
    }
    else
    {
      if (v5 != 34)
        goto LABEL_9;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a3));
      objc_msgSend(v10, "doubleValue");
      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v11;

      v12 = a1[7];
    }
    *(_BYTE *)(*(_QWORD *)(v12 + 8) + 24) = 1;
  }
LABEL_9:
  if (v22[5])
  {
    (*(void (**)(void))(a1[4] + 16))();
    v13 = 0;
    goto LABEL_24;
  }
  v13 = 0;
  if (a2 <= 113)
  {
    if (a2 != 82)
    {
      if (a2 != 100)
        goto LABEL_24;
      v14 = 1;
      goto LABEL_21;
    }
    v15 = 0x20000;
LABEL_19:
    v16 = objc_claimAutoreleasedReturnValue(+[NSFileAccessIntent readingIntentWithURL:options:](NSFileAccessIntent, "readingIntentWithURL:options:", v28[5], v15));
    goto LABEL_22;
  }
  if (a2 != 119)
  {
    if (a2 != 114)
      goto LABEL_24;
    v15 = 0;
    goto LABEL_19;
  }
  v14 = 8;
LABEL_21:
  v16 = objc_claimAutoreleasedReturnValue(+[NSFileAccessIntent writingIntentWithURL:options:](NSFileAccessIntent, "writingIntentWithURL:options:", v28[5], v14));
LABEL_22:
  v13 = (void *)v16;
  if (v16)
    objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "addObject:", v16);
LABEL_24:

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

}

void sub_100004310(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_100004338(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_1000043C0()
{
  const char *v0;

  v0 = getprogname();
  printf("File Provider control utility.\n%s <command> <options>\n\nCommands:\n  dump [<domain|provider>]                                       - dump state of fileprovider's daemon\n      --limit-dump-size                                                 limit the number of items dumped\n  evaluate <item>                                                - evaluate finder actions and decorations on item\n  evaluate <action> [<item>] <target item>                       - evaluate finder interactions\n  check | repair                                                 - run FPCK\n      -f                                                                perform a full dump (all items)\n      -a <path>                                                         perform check under path\n      -b <path>                                                         operate on an already created DB backup. If this is set you need to set -a to point to the domain root\n      -o <path>                                                         write output into file at path\n      -P                                                                no-pager output\n      -d                                                                dimisss low-importance invariants\n      -v                                                                print out files with broken invariants\n      -m [<providerDomainID>]                                           perform check on the d2d migration backup\n      -x xpc|daemon                                                     launch in XPC Service vs daemon (default)\n"
    "  obfuscate [<filename>/<path>...]                               - return the obfuscated form of the filename\n",
    v0);
  exit(64);
}

uint64_t sub_1000043E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100009E24(CFSTR("%@"), a2, a3, a4, a5, a6, a7, a8, a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100004428(uint64_t a1, void *a2)
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(void);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;

  v25 = a2;
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
  sub_100009E24(CFSTR("%.3f seconds passed before coordination callback was invoked."), v4, v5, v6, v7, v8, v9, v10, COERCE__INT64(-v3));
  if (v25)
  {
    v18 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_11:
    v18();
    goto LABEL_12;
  }
  sub_100009E24(CFSTR("Acquired coordinations with intents %@"), v11, v12, v13, v14, v15, v16, v17, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  if (*(int *)(a1 + 80) <= 0)
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      v23 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)));
    else
      v23 = objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
    v24 = (void *)v23;
    +[NSThread sleepUntilDate:](NSThread, "sleepUntilDate:", v23);

    v18 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_11;
  }
  v20 = sub_100003B94(v19, *(const char ***)(a1 + 72));
  v21 = *(_QWORD *)(a1 + 40);
  if (!(_DWORD)v20)
  {
    v18 = *(void (**)(void))(v21 + 16);
    goto LABEL_11;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSError fp_errorWithPOSIXCode:](NSError, "fp_errorWithPOSIXCode:", v20));
  (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);

LABEL_12:
}

void sub_10000456C(int a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  if (a1 > 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", *(_QWORD *)(a2 + 8)));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100004654;
    v8[3] = &unk_1000148C0;
    v9 = v5;
    sub_10000A050(v7, 1, 1, v8);

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError fp_errorWithPOSIXCode:description:](NSError, "fp_errorWithPOSIXCode:description:", 22, CFSTR("Error: must supply path")));
    (*((void (**)(id, void *))v5 + 2))(v5, v6);

  }
}

void sub_100004654(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v5 = a2;
  v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fp_shortDescription"));
    sub_100009E24(CFSTR("Attempting to materialize item at %@"), v8, v9, v10, v11, v12, v13, v14, (uint64_t)v7);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[FPDaemonConnection sharedConnectionProxy](FPDaemonConnection, "sharedConnectionProxy"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100004744;
    v16[3] = &unk_100014898;
    v18 = *(id *)(a1 + 32);
    v17 = v6;
    objc_msgSend(v15, "materializeURL:completionHandler:", v17, v16);

  }
}

void sub_100004744(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  unsigned __int8 v38;
  _BYTE v39[128];

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v38 = 0;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "path"));
    v5 = objc_msgSend(v3, "fileExistsAtPath:isDirectory:", v4, &v38);

    if ((v5 & 1) != 0)
    {
      v6 = v38;
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "fp_shortDescription"));
      v15 = (void *)v7;
      if (v6)
      {
        sub_100009E24(CFSTR("ls %@:"), v8, v9, v10, v11, v12, v13, v14, v7);

        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "path"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "enumeratorAtPath:", v17));

        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v35;
          do
          {
            v22 = 0;
            do
            {
              if (*(_QWORD *)v35 != v21)
                objc_enumerationMutation(v18);
              v23 = objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v22)), "fileSystemRepresentation");
              sub_100009E24(CFSTR("%s"), v24, v25, v26, v27, v28, v29, v30, (uint64_t)v23);
              v22 = (char *)v22 + 1;
            }
            while (v20 != v22);
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
          }
          while (v20);
        }

        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      }
      else
      {
        sub_100009E24(CFSTR("file %@:"), v8, v9, v10, v11, v12, v13, v14, v7);

        v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "path")));
        execl("/usr/bin/file", "/usr/bin/file", "-b", objc_msgSend(v33, "fileSystemRepresentation"), 0);

      }
    }
    else
    {
      v31 = *(_QWORD *)(a1 + 40);
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSError fp_errorWithPOSIXCode:description:](NSError, "fp_errorWithPOSIXCode:description:", 2, CFSTR("Error: file doesn't exist after materialization")));
      (*(void (**)(uint64_t, void *))(v31 + 16))(v31, v32);

    }
  }
}

id sub_1000049D8(uint64_t a1)
{
  void *v1;
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_1000035B4;
  v9 = sub_1000035C4;
  v10 = 0;
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a1));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100004AC0;
  v4[3] = &unk_100014910;
  v4[4] = &v5;
  sub_10000A050(v1, 1, 1, v4);

  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void sub_100004AA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100004AC0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[FPDaemonConnection synchronousSharedConnectionProxy](FPDaemonConnection, "synchronousSharedConnectionProxy"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100004B90;
    v8[3] = &unk_1000148E8;
    v10 = *(_QWORD *)(a1 + 32);
    v9 = v5;
    objc_msgSend(v7, "materializeURL:completionHandler:", v9, v8);

  }
}

void sub_100004B90(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id *v19;
  void *v20;
  id v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  char v27;
  _BYTE v28[128];

  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  else
  {
    v27 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "path"));
    v7 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v6, &v27);

    if ((v7 & 1) == 0)
    {
      v8 = objc_claimAutoreleasedReturnValue(+[NSError fp_errorWithPOSIXCode:description:](NSError, "fp_errorWithPOSIXCode:description:", 2, CFSTR("Error: file doesn't exist after materialization")));
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

    }
    if (v27)
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "path"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "enumeratorAtPath:", v12));

      v14 = (char *)objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v24;
        while (1)
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(v13);
          if (!--v15)
          {
            v15 = (char *)objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
            if (!v15)
              break;
          }
        }
      }
    }
    else
    {
      v17 = *(_QWORD *)(a1 + 32);
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      obj = *(id *)(v18 + 40);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileHandle fileHandleForReadingFromURL:error:](NSFileHandle, "fileHandleForReadingFromURL:error:", v17, &obj));
      objc_storeStrong((id *)(v18 + 40), obj);
      if (v13)
      {
        v19 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        v21 = 0;
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "readDataUpToLength:error:", 10, &v21));
        objc_storeStrong(v19, v21);

        objc_msgSend(v13, "closeFile");
      }
    }

  }
}

id sub_100004DCC(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v7[4];
  NSObject *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_1000035B4;
  v14 = sub_1000035C4;
  v15 = 0;
  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a1));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100004EF4;
  v7[3] = &unk_100014938;
  v9 = &v10;
  v4 = v2;
  v8 = v4;
  sub_10000A050(v3, 0, 1, v7);

  dispatch_group_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void sub_100004EDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100004EF4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  __int128 v10;
  _QWORD v11[4];
  __int128 v12;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[FPDaemonConnection synchronousSharedConnectionProxy](FPDaemonConnection, "synchronousSharedConnectionProxy"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100004FE8;
    v11[3] = &unk_1000148E8;
    v10 = *(_OWORD *)(a1 + 32);
    v8 = (id)v10;
    v12 = v10;
    v9 = objc_msgSend(v7, "evictItemAtURL:evenIfEnumeratingFP:andClearACLForConsumer:evictionReason:completionHandler:", v5, 1, 0, 2, v11);

  }
}

void sub_100004FE8(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void sub_100005034(unsigned int a1, char *const *a2, void *a3)
{
  void (**v3)(id, void *);
  uint64_t v4;
  char *const *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  NSObject *v11;
  void *v12;
  void (**v13)(id, void *);
  void (**v14)(id, void *);
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  char *const *v20;
  unsigned int v21;
  _QWORD block[4];
  void (**v23)(id, void *);
  uint64_t *v24;
  void **v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *, void *);
  void *v28;
  NSObject *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v21 = a1;
  v20 = a2;
  v3 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100005368;
  v15[3] = &unk_100014678;
  v15[4] = &v16;
  sub_1000035CC((int *)&v21, &v20, "n", (const option *)&off_100014958, v15);
  v4 = v21;
  if ((int)v21 <= 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError fp_errorWithPOSIXCode:description:](NSError, "fp_errorWithPOSIXCode:description:", 22, CFSTR("Error: must supply path")));
    v3[2](v3, v10);

  }
  else
  {
    v5 = v20;
    if (*((_BYTE *)v17 + 24))
    {
      v14 = v3;
      v31 = 0;
      v32 = &v31;
      v33 = 0x3032000000;
      v34 = sub_1000035B4;
      v35 = sub_1000035C4;
      v36 = 0;
      v6 = dispatch_group_create();
      do
      {
        dispatch_group_enter(v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", *v5));
        v25 = _NSConcreteStackBlock;
        v26 = 3221225472;
        v27 = sub_100006630;
        v28 = &unk_100014B78;
        v8 = v6;
        v29 = v8;
        v30 = &v31;
        sub_10000A050(v7, 0, 1, &v25);

        ++v5;
        --v4;
      }
      while (v4);
      block[0] = _NSConcreteStackBlock;
      v9 = sub_100006C00;
    }
    else
    {
      v14 = v3;
      v31 = 0;
      v32 = &v31;
      v33 = 0x3032000000;
      v34 = sub_1000035B4;
      v35 = sub_1000035C4;
      v36 = 0;
      v11 = dispatch_group_create();
      do
      {
        dispatch_group_enter(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", *v5));
        v25 = _NSConcreteStackBlock;
        v26 = 3221225472;
        v27 = sub_100006C18;
        v28 = &unk_100014B78;
        v8 = v11;
        v29 = v8;
        v30 = &v31;
        sub_10000A050(v12, 0, 1, &v25);

        ++v5;
        --v4;
      }
      while (v4);
      block[0] = _NSConcreteStackBlock;
      v9 = sub_100006DBC;
    }
    block[1] = 3221225472;
    block[2] = v9;
    block[3] = &unk_1000146F0;
    v23 = v14;
    v24 = &v31;
    v13 = v14;
    dispatch_group_notify(v8, (dispatch_queue_t)&_dispatch_main_q, block);

    _Block_object_dispose(&v31, 8);
  }
  _Block_object_dispose(&v16, 8);

}

void sub_100005338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100005368(uint64_t result, int a2)
{
  if (a2 == 110)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

void sub_100005384(unsigned int a1, char *const *a2, void *a3)
{
  id v5;
  void ***v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  char *const *v14;
  uint64_t v15;
  int v16;
  id v17;
  void *v18;
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t, uint64_t, uint64_t, void *, int, void *, uint64_t);
  void *v22;
  id v23;
  _QWORD v24[8];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  char *const *v41;
  unsigned int v42;

  v19 = _NSConcreteStackBlock;
  v20 = 3221225472;
  v21 = sub_1000056B0;
  v22 = &unk_1000149C8;
  v5 = a3;
  v23 = v5;
  v42 = a1;
  v41 = a2;
  v6 = &v19;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 1;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 1;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100006DD4;
  v24[3] = &unk_100014BA0;
  v24[4] = &v29;
  v24[5] = &v37;
  v24[6] = &v33;
  v24[7] = &v25;
  sub_1000035CC((int *)&v42, &v41, "flo:Pd:", (const option *)&off_1000149E8, v24);
  v7 = v42;
  if ((int)v42 < 1)
    v8 = 0;
  else
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", *v41));
  v9 = (const char *)v38[3];
  if (!v9 || !strcmp((const char *)v38[3], "-"))
  {
    if (*((_BYTE *)v34 + 24))
    {
      v12 = objc_msgSend(objc_alloc((Class)FPCTLTermDumper), "initWithFd:forceColor:", 1, 0);
      objc_msgSend(v12, "startPager");

    }
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSFileHandle fileHandleWithStandardOutput](NSFileHandle, "fileHandleWithStandardOutput"));
  }
  else
  {
    v10 = open(v9, 1797, 384, v19, v20);
    if ((v10 & 0x80000000) != 0)
    {
      v14 = v41;
      v15 = v26[3];
      v16 = *((unsigned __int8 *)v30 + 24);
      v17 = +[NSError fp_errorWithPOSIXCode:](NSError, "fp_errorWithPOSIXCode:", *__error());
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v21((uint64_t)v6, v7, (uint64_t)v14, v15, 0, v16 != 0, v8, (uint64_t)v18);

      v13 = 0;
      goto LABEL_12;
    }
    v11 = objc_msgSend(objc_alloc((Class)NSFileHandle), "initWithFileDescriptor:closeOnDealloc:", v10, 1);
  }
  v13 = v11;
  v21((uint64_t)v6, v7, (uint64_t)v41, v26[3], v11, *((unsigned __int8 *)v30 + 24), v8, 0);
LABEL_12:

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

}

void sub_100005664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1000056B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, int a6, void *a7, uint64_t a8)
{
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v12 = a5;
  v13 = a7;
  if (a8)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v14 = +[FPDaemonConnection connectionForUser:](FPDaemonConnection, "connectionForUser:", geteuid());
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000057A0;
    v16[3] = &unk_1000149A0;
    v17 = *(id *)(a1 + 32);
    objc_msgSend(v15, "dumpStateTo:limitNumberOfItems:providerFilter:completionHandler:", v12, a6 ^ 1u, v13, v16);

  }
}

uint64_t sub_1000057A0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1000057AC(unsigned int a1, char *const *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  int v23;
  uint64_t v24;
  char *const *v25;
  _QWORD v26[4];
  id v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t *v38;
  char *const *v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  char v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  char v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  char v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t (*v84)(uint64_t, uint64_t);
  void (*v85)(uint64_t);
  id v86;
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t v90;
  char *const *v91;
  unsigned int v92[3];

  v92[0] = a1;
  v91 = a2;
  v87 = 0;
  v88 = &v87;
  v89 = 0x2020000000;
  v90 = 0;
  v81 = 0;
  v82 = &v81;
  v83 = 0x3032000000;
  v84 = sub_1000035B4;
  v85 = sub_1000035C4;
  v86 = 0;
  v75 = 0;
  v76 = &v75;
  v77 = 0x3032000000;
  v78 = sub_1000035B4;
  v79 = sub_1000035C4;
  v80 = 0;
  v71 = 0;
  v72 = &v71;
  v73 = 0x2020000000;
  v74 = 1;
  v67 = 0;
  v68 = &v67;
  v69 = 0x2020000000;
  v70 = 0;
  v63 = 0;
  v64 = &v63;
  v65 = 0x2020000000;
  v66 = 0;
  v59 = 0;
  v60 = &v59;
  v61 = 0x2020000000;
  v62 = 0;
  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v58 = 0;
  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = sub_1000035B4;
  v49 = sub_1000035C4;
  v50 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 2;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100005CB8;
  v26[3] = &unk_100014AB0;
  v28 = &v63;
  v29 = &v67;
  v30 = &v81;
  v31 = &v87;
  v32 = &v71;
  v33 = &v59;
  v34 = &v55;
  v35 = &v75;
  v36 = &v51;
  v37 = &v41;
  v5 = a3;
  v40 = a1;
  v38 = &v45;
  v39 = a2;
  v27 = v5;
  sub_1000035CC((int *)v92, &v91, "hfa:o:Pdvb:mx:", (const option *)&off_1000149E8, v26);
  if (*((_BYTE *)v64 + 24))
    sub_1000043C0();
  v6 = v92[0];
  if (*((_BYTE *)v52 + 24) && (int)v92[0] >= 1)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", *v91));
    v8 = (void *)v46[5];
    v46[5] = v7;

  }
  v9 = (const char *)v88[3];
  if (!v9 || !strcmp((const char *)v88[3], "-"))
  {
    if (*((_BYTE *)v72 + 24))
    {
      v12 = objc_msgSend(objc_alloc((Class)FPCTLTermDumper), "initWithFd:forceColor:", 1, 0);
      objc_msgSend(v12, "startPager");

    }
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSFileHandle fileHandleWithStandardOutput](NSFileHandle, "fileHandleWithStandardOutput"));
  }
  else
  {
    v10 = open(v9, 1797, 384);
    if ((v10 & 0x80000000) != 0)
    {
      v24 = v82[5];
      v25 = v91;
      v14 = v76[5];
      v15 = *((unsigned __int8 *)v68 + 24);
      v16 = *((unsigned __int8 *)v60 + 24);
      v17 = *((unsigned __int8 *)v56 + 24);
      v18 = *((unsigned __int8 *)v52 + 24);
      v19 = v46[5];
      v20 = v42[3];
      v21 = +[NSError fp_errorWithPOSIXCode:](NSError, "fp_errorWithPOSIXCode:", *__error());
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      BYTE1(v23) = v18 != 0;
      LOBYTE(v23) = v17 != 0;
      (*((void (**)(id, uint64_t, char *const *, _QWORD, uint64_t, uint64_t, BOOL, BOOL, int, uint64_t, uint64_t, void *))v5
       + 2))(v5, v6, v25, 0, v24, v14, v15 != 0, v16 != 0, v23, v19, v20, v22);

      v13 = 0;
      goto LABEL_13;
    }
    v11 = objc_msgSend(objc_alloc((Class)NSFileHandle), "initWithFileDescriptor:closeOnDealloc:", v10, 1);
  }
  v13 = v11;
  BYTE1(v23) = *((_BYTE *)v52 + 24);
  LOBYTE(v23) = *((_BYTE *)v56 + 24);
  (*((void (**)(id, uint64_t, char *const *, id, uint64_t, uint64_t, _QWORD, _QWORD, int, uint64_t, uint64_t, _QWORD))v5
   + 2))(v5, v6, v91, v11, v82[5], v76[5], *((unsigned __int8 *)v68 + 24), *((unsigned __int8 *)v60 + 24), v23, v46[5], v42[3], 0);
LABEL_13:

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(&v71, 8);
  _Block_object_dispose(&v75, 8);

  _Block_object_dispose(&v81, 8);
  _Block_object_dispose(&v87, 8);

}

void sub_100005C1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a64;
  uint64_t v64;

  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose(&a44, 8);
  _Block_object_dispose(&a48, 8);
  _Block_object_dispose(&a52, 8);
  _Block_object_dispose(&a56, 8);
  _Block_object_dispose(&a60, 8);
  _Block_object_dispose(&a64, 8);
  _Block_object_dispose((const void *)(v64 - 232), 8);
  _Block_object_dispose((const void *)(v64 - 184), 8);
  _Block_object_dispose((const void *)(v64 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_100005CB8(uint64_t a1, int a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  if (a2 <= 117)
  {
    switch(a2)
    {
      case 'a':
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:"));
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v10));
        v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByStandardizingPath"));
        v6 = *(_QWORD *)(a1 + 56);
        goto LABEL_11;
      case 'b':
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:"));
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v10));
        v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByStandardizingPath"));
        v6 = *(_QWORD *)(a1 + 96);
LABEL_11:
        v7 = *(_QWORD *)(v6 + 8);
        v8 = *(void **)(v7 + 40);
        *(_QWORD *)(v7 + 40) = v5;

        goto LABEL_12;
      case 'c':
      case 'e':
      case 'g':
      case 'i':
      case 'j':
      case 'k':
      case 'l':
      case 'n':
        return;
      case 'd':
        v9 = *(_QWORD *)(a1 + 80);
        goto LABEL_20;
      case 'f':
        v9 = *(_QWORD *)(a1 + 48);
        goto LABEL_20;
      case 'h':
        v9 = *(_QWORD *)(a1 + 40);
        goto LABEL_20;
      case 'm':
        v9 = *(_QWORD *)(a1 + 104);
        goto LABEL_20;
      case 'o':
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = a3;
        return;
      default:
        if (a2 == 80)
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
        return;
    }
  }
  if (a2 == 118)
  {
    v9 = *(_QWORD *)(a1 + 88);
LABEL_20:
    *(_BYTE *)(*(_QWORD *)(v9 + 8) + 24) = 1;
  }
  else if (a2 == 120)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:"));
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("daemon")))
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = 0;
    }
    else if (objc_msgSend(v10, "isEqualToString:", CFSTR("xpc")))
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = 1;
    }
    else
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSError fp_invalidArgumentError:](NSError, "fp_invalidArgumentError:", CFSTR("-x check unrecognized option %@"), v10));
      (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 136), *(_QWORD *)(a1 + 128), 0);
LABEL_12:

    }
  }
}

void sub_100005F10(int a1, uint64_t a2, void *a3)
{
  void *v5;
  uint64_t *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (**v19)(id, void *);

  v19 = a3;
  if (a1 > 1)
  {
    v6 = (uint64_t *)(a2 + 8);
    v7 = a1 - 1;
    do
    {
      v8 = objc_alloc((Class)NSString);
      v9 = *v6++;
      v10 = objc_msgSend(v8, "initWithCString:encoding:", v9, 4);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fp_alwaysObfuscatedPath"));
      sub_100009E24(CFSTR("%@"), v12, v13, v14, v15, v16, v17, v18, (uint64_t)v11);

      --v7;
    }
    while (v7);
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError fp_errorWithPOSIXCode:description:](NSError, "fp_errorWithPOSIXCode:description:", 22, CFSTR("Error: please provide a name of a file")));
    v19[2](v19, v5);

  }
  v19[2](v19, 0);

}

void sub_100005FFC(int a1, uint64_t a2, void *a3)
{
  void (**v5)(id, id);
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id v48;
  _BYTE v49[128];

  v5 = a3;
  if (a1 > 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", *(_QWORD *)(a2 + 8)));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v7));

    v48 = 0;
    v9 = FPGetImportCookieForURL(v8, &v48);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = v48;
    if (v10)
    {
      if (objc_msgSend(v10, "hasExpired"))
        sub_100009E24(CFSTR("cookie has expired"), v12, v13, v14, v15, v16, v17, v18, v42);
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "entries"));
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      if (v20)
      {
        v21 = v20;
        v43 = v11;
        v22 = *(_QWORD *)v45;
        do
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(_QWORD *)v45 != v22)
              objc_enumerationMutation(v19);
            v24 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "entries"));
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", v24));

            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "domainPathRelativeToVolumeRoot"));
            objc_msgSend(v26, "fileID");
            sub_100009E24(CFSTR("%@ %llu"), v28, v29, v30, v31, v32, v33, v34, (uint64_t)v27);

          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
        }
        while (v21);
        v11 = v43;
      }
    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
      sub_100009E24(CFSTR("no import cookie for %@"), v35, v36, v37, v38, v39, v40, v41, (uint64_t)v19);
    }

    v5[2](v5, v11);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError fp_errorWithPOSIXCode:description:](NSError, "fp_errorWithPOSIXCode:description:", 22, CFSTR("error: missing operation")));
    v5[2](v5, v6);

  }
}

uint64_t start(int a1, char *const *a2)
{
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  void *v15;
  _QWORD *v16;
  char *const *v17;
  uint64_t v18;
  void *v19;
  uint64_t *v20;
  void *v21;
  uint64_t v22;
  uint64_t v24[5];
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  int v29;

  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v4 = getpid();
  if (fpfs_lp_sandbox_check(v4, 0, 0, 0))
    errx(1, "Trying to invoke fileproviderctl from a sandboxed process");
  if (os_variant_has_internal_content("com.apple.FileProvider"))
    execv("/usr/local/bin/fileproviderctl_internal", a2);
  v5 = objc_autoreleasePoolPush();
  v6 = (id)fp_default_log();
  if (!getuid())
    sub_100009F38(CFSTR("⚠️  running as root, file operations might not work correctly"), v7, v8, v9, v10, v11, v12, v13, v24[0]);
  fpfs_enable_fts_thread_fchdir();
  v14 = a1 - 1;
  if (a1 <= 1)
    sub_1000043C0();
  v15 = objc_autoreleasePoolPush();
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10000651C;
  v25[3] = &unk_100014AD8;
  v25[4] = &v26;
  v16 = objc_retainBlock(v25);
  v18 = *((_QWORD *)a2 + 1);
  v17 = a2 + 1;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v18));
  if (objc_msgSend(v19, "isEqualToString:", CFSTR("dump")))
  {
    sub_100005384(v14, v17, v16);
  }
  else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("check")) & 1) != 0
         || objc_msgSend(v19, "isEqualToString:", CFSTR("repair")))
  {
    v24[0] = (uint64_t)_NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = (uint64_t)sub_100006580;
    v24[3] = (uint64_t)&unk_100014AD8;
    v24[4] = (uint64_t)&v26;
    v20 = objc_retainBlock(v24);
    if (objc_msgSend(v19, "isEqualToString:", CFSTR("check")))
      sub_10000C684(v14, v17, v20);
    else
      sub_10000C7E4(v14, v17, v20);

  }
  else if (objc_msgSend(v19, "isEqualToString:", CFSTR("evaluate")))
  {
    sub_100008A9C(v14, (uint64_t)v17, v16);
  }
  else
  {
    if (!objc_msgSend(v19, "isEqualToString:", CFSTR("obfuscate")))
      sub_1000043C0();
    sub_100005F10(v14, (uint64_t)v17, v16);
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
  objc_msgSend(v21, "run");

  objc_autoreleasePoolPop(v15);
  objc_autoreleasePoolPop(v5);
  v22 = *((unsigned int *)v27 + 6);
  _Block_object_dispose(&v26, 8);
  return v22;
}

void sub_1000064FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000651C(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a2;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description"));
    sub_100009F38(CFSTR("Error: %@\n"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

    v4 = 1;
  }
  else
  {
    v4 = 0;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
  exit(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

void sub_100006580(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a2;
  if (!v3)
  {
    v4 = 0;
    goto LABEL_8;
  }
  v5 = v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("FPCKDomain")))
  {
    v7 = objc_msgSend(v5, "code");

    if (v7 == (id)65)
    {
      v4 = 65;
      goto LABEL_8;
    }
  }
  else
  {

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description"));
  sub_100009F38(CFSTR("Error: %@\n"), v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);

  v4 = 1;
LABEL_8:
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
  exit(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

void sub_100006630(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t v20;

  v5 = a2;
  if (a3)
  {
    v6 = *(id *)(a1 + 32);
    v7 = a3;
    objc_sync_enter(v6);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v8 + 40);
    v9 = (id *)(v8 + 40);
    v10 = v11;
    if (v11)
      v12 = v10;
    else
      v12 = v7;
    objc_storeStrong(v9, v12);
    objc_sync_exit(v6);

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    v13 = 0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[FPItemManager defaultManager](FPItemManager, "defaultManager"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100006750;
    v17[3] = &unk_100014B50;
    v18 = v5;
    v15 = *(id *)(a1 + 32);
    v16 = *(_QWORD *)(a1 + 40);
    v19 = v15;
    v20 = v16;
    objc_msgSend(v14, "fetchItemForURL:completionHandler:", v18, v17);

  }
}

void sub_100006750(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  id *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint64_t v28;
  NSErrorUserInfoKey v29;
  uint64_t v30;

  v5 = a2;
  v6 = a3;
  v14 = v6;
  if (!v5 || v6)
  {
    if (!v6)
    {
      v29 = NSURLErrorKey;
      v30 = *(_QWORD *)(a1 + 32);
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSFileProviderErrorDomain, -1005, v18));

    }
    v19 = *(id *)(a1 + 40);
    objc_sync_enter(v19);
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v23 = *(void **)(v20 + 40);
    v21 = (id *)(v20 + 40);
    v22 = v23;
    if (v23)
      v24 = v22;
    else
      v24 = v14;
    objc_storeStrong(v21, v24);
    objc_sync_exit(v19);

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else
  {
    sub_100009E24(CFSTR("Evicting %@"), v7, v8, v9, v10, v11, v12, v13, (uint64_t)v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[FPDaemonConnection sharedConnection](FPDaemonConnection, "sharedConnection"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10000690C;
    v25[3] = &unk_100014B28;
    v16 = *(id *)(a1 + 40);
    v17 = *(_QWORD *)(a1 + 48);
    v26 = v16;
    v28 = v17;
    v27 = v5;
    objc_msgSend(v15, "providerDomainsCompletionHandler:", v25);

    v14 = v26;
  }

}

void sub_10000690C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  char v23;
  uint64_t v24;
  void *i;
  void *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  uint64_t v36;
  _QWORD v37[4];
  id v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = *(id *)(a1 + 32);
    objc_sync_enter(v8);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v9 + 40);
    v10 = (id *)(v9 + 40);
    v11 = v12;
    if (v12)
      v13 = v11;
    else
      v13 = v5;
    objc_storeStrong(v10, v13);
    objc_sync_exit(v8);

    goto LABEL_17;
  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v14 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (!v14)
    goto LABEL_16;
  v22 = v14;
  v23 = 0;
  v24 = *(_QWORD *)v41;
  do
  {
    for (i = 0; i != v22; i = (char *)i + 1)
    {
      if (*(_QWORD *)v41 != v24)
        objc_enumerationMutation(v7);
      v26 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "providerDomainID"));
      v28 = objc_msgSend(v26, "isEqualToString:", v27);

      if (v28)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v26));
        v30 = objc_alloc((Class)NSFileProviderManager);
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "providerID"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "domain"));
        v33 = objc_msgSend(v30, "_initWithProviderIdentifier:domain:", v31, v32);

        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "itemIdentifier"));
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = sub_100006B80;
        v37[3] = &unk_100014B00;
        v35 = *(id *)(a1 + 32);
        v36 = *(_QWORD *)(a1 + 48);
        v38 = v35;
        v39 = v36;
        objc_msgSend(v33, "evictItemWithIdentifier:completionHandler:", v34, v37);

        v23 = 1;
      }
    }
    v22 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  }
  while (v22);
  if ((v23 & 1) == 0)
  {
LABEL_16:
    sub_100009E24(CFSTR("[UNREACH] Domain not found for item : %@"), v15, v16, v17, v18, v19, v20, v21, *(_QWORD *)(a1 + 40));
LABEL_17:
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

}

void sub_100006B80(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = *(id *)(a1 + 32);
  v10 = a2;
  objc_sync_enter(v4);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v5 + 40);
  v6 = (id *)(v5 + 40);
  v7 = v8;
  v9 = v10;
  if (v8)
    v9 = v7;
  objc_storeStrong(v6, v9);
  objc_sync_exit(v4);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_100006C00(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void sub_100006C18(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;

  v5 = a2;
  if (a3)
  {
    v6 = *(id *)(a1 + 32);
    v7 = a3;
    objc_sync_enter(v6);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v8 + 40);
    v9 = (id *)(v8 + 40);
    v10 = v11;
    if (v11)
      v12 = v10;
    else
      v12 = v7;
    objc_storeStrong(v9, v12);
    objc_sync_exit(v6);

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    v13 = 0;
    v7 = (id)objc_claimAutoreleasedReturnValue(+[FPDaemonConnection sharedConnectionProxy](FPDaemonConnection, "sharedConnectionProxy"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100006D3C;
    v17[3] = &unk_100014B00;
    v14 = *(id *)(a1 + 32);
    v15 = *(_QWORD *)(a1 + 40);
    v18 = v14;
    v19 = v15;
    v16 = objc_msgSend(v7, "evictItemAtURL:evenIfEnumeratingFP:andClearACLForConsumer:evictionReason:completionHandler:", v5, 1, 0, 2, v17);

  }
}

void sub_100006D3C(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = *(id *)(a1 + 32);
  v10 = a2;
  objc_sync_enter(v4);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v5 + 40);
  v6 = (id *)(v5 + 40);
  v7 = v8;
  v9 = v10;
  if (v8)
    v9 = v7;
  objc_storeStrong(v6, v9);
  objc_sync_exit(v4);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_100006DBC(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

_QWORD *sub_100006DD4(_QWORD *result, int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  if (a2 <= 101)
  {
    if (a2 == 80)
    {
      v4 = result[6];
      goto LABEL_14;
    }
    if (a2 != 100)
      return result;
    v3 = result[7];
LABEL_11:
    *(_QWORD *)(*(_QWORD *)(v3 + 8) + 24) = a3;
    return result;
  }
  switch(a2)
  {
    case 'o':
      v3 = result[5];
      goto LABEL_11;
    case 'l':
      v4 = result[4];
LABEL_14:
      *(_BYTE *)(*(_QWORD *)(v4 + 8) + 24) = 0;
      return result;
    case 'f':
      *(_BYTE *)(*(_QWORD *)(result[4] + 8) + 24) = 1;
      break;
  }
  return result;
}

void sub_100006E4C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

char *sub_100006E6C(int __errnum)
{
  return strerror(__errnum);
}

id sub_100006ECC(void *a1)
{
  void *v1;
  void *v2;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fp_map:", &stru_100014BE0));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "componentsJoinedByString:", CFSTR(",")));

  return v2;
}

id sub_100006F14(id a1, FPTag *a2)
{
  FPTag *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FPTag label](v2, "label"));
  v4 = -[FPTag color](v2, "color");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@#%i"), v3, v4));
  return v5;
}

void sub_100007BC4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void *v4;
  id v5;
  id v6;

  if (a3)
  {
    v4 = *(void **)(a1 + 32);
    v5 = sub_10000A548(a3, a4);
    v6 = (id)objc_claimAutoreleasedReturnValue(v5);
    objc_msgSend(v4, "dumpImage:characterWidth:characterHeight:", v6, 2, 1);

  }
}

void sub_100007C1C(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v6 = a2;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v7 = *(id *)(a1 + 32);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (!v8)
    goto LABEL_20;
  v9 = v8;
  v10 = *(_QWORD *)v28;
  while (2)
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(_QWORD *)v28 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "type"));
      v14 = objc_msgSend(v13, "isEqualToString:", v6);

      if (v14)
      {
        objc_msgSend(*(id *)(a1 + 40), "startFgColor:attr:", a3, 2);
        v15 = *(_QWORD *)(a1 + 48);
        v26 = 0;
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "labelWithItem:error:", v15, &v26));
        v17 = v26;
        if (v16)
          v18 = v16;
        else
          v18 = v17;
        objc_msgSend(*(id *)(a1 + 40), "write:", CFSTR(" %@"), v18);
        if (!a4)
          goto LABEL_19;
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageType"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[UTType typeWithIdentifier:](UTType, "typeWithIdentifier:", v19));
        v21 = objc_msgSend(v20, "isDeclared");

        if ((v21 & 1) != 0)
        {
          if (!*(_DWORD *)(a1 + 56))
          {
LABEL_19:

            goto LABEL_20;
          }
          v22 = *(void **)(a1 + 40);
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageType"));
          objc_msgSend(v22, "write:", CFSTR(" (%@)"), v23);
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 40), "startFgColor:attr:", 1, 2);
          v24 = *(void **)(a1 + 40);
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageType"));
          objc_msgSend(v24, "write:", CFSTR(" (undeclared type %@)"), v23);
        }

        goto LABEL_19;
      }
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v9)
      continue;
    break;
  }
LABEL_20:

}

void sub_100007E5C(void *a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100007EDC;
  v4[3] = &unk_1000148C0;
  v5 = a2;
  v3 = v5;
  sub_10000A050(a1, 0, 1, v4);

}

void sub_100007EDC(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[FPItemManager defaultManager](FPItemManager, "defaultManager"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100007FA8;
    v7[3] = &unk_100014CE8;
    v9 = *(id *)(a1 + 32);
    v8 = v5;
    objc_msgSend(v6, "fetchItemForURL:completionHandler:", v8, v7);

  }
}

void sub_100007FA8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  void *i;
  void *v36;
  void *v37;
  __CFString *v38;
  __CFString *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  id v56;
  int v57;
  id v58;
  uint64_t v59;
  void *j;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  void *k;
  NSObject *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  id v86;
  id v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  id v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  id v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  id v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  id v138;
  dispatch_semaphore_t v139;
  uint64_t v140;
  void *v141;
  void *v142;
  void *v143;
  id obj;
  void *v145;
  id v146;
  id v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  _QWORD v152[4];
  NSObject *v153;
  id v154;
  uint64_t *v155;
  uint64_t v156;
  uint64_t *v157;
  uint64_t v158;
  uint64_t (*v159)(uint64_t, uint64_t);
  void (*v160)(uint64_t);
  id v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  _QWORD v166[4];
  id v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  id v176;
  _BYTE v177[128];
  _BYTE v178[128];
  _BYTE v179[128];
  _BYTE v180[128];
  id v181;
  NSErrorUserInfoKey v182;
  uint64_t v183;

  v5 = a2;
  v6 = a3;
  v143 = v5;
  if (!v6)
  {
    if (!v5)
    {
      sub_100009F38(CFSTR("No item for URL %@\n"), v7, v8, v9, v10, v11, v12, v13, *(_QWORD *)(a1 + 32));
      v82 = *(_QWORD *)(a1 + 32);
      v83 = *(_QWORD *)(a1 + 40);
      v182 = NSURLErrorKey;
      v183 = v82;
      v84 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v183, &v182, 1));
      v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSFileProviderErrorDomain, -1005, v84));
      (*(void (**)(uint64_t, void *))(v83 + 16))(v83, v85);

      v14 = (void *)v84;
      goto LABEL_51;
    }
    v140 = a1;
    v176 = 0;
    v142 = (void *)objc_claimAutoreleasedReturnValue(+[FPProviderDomain providerDomainForItem:cachePolicy:error:](FPProviderDomain, "providerDomainForItem:cachePolicy:error:", v5, 0, &v176));
    v146 = v176;
    if (!v142)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_50:

      v14 = v146;
      goto LABEL_51;
    }
    v15 = objc_msgSend(sub_1000087E0(), "actionsForProviderDomain:", v142);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = sub_1000087E0();
    v181 = v5;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v181, 1));
    v145 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "extensionMatchingDictionaryForItems:fpProviderDomain:", v18, v142));

    sub_100009E24(CFSTR("Evaluating actions against %@"), v19, v20, v21, v22, v23, v24, v25, (uint64_t)v145);
    sub_100009E24(CFSTR("\nActions:"), v26, v27, v28, v29, v30, v31, v32, v134);
    v174 = 0u;
    v175 = 0u;
    v172 = 0u;
    v173 = 0u;
    obj = v16;
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v172, v180, 16);
    if (v33)
    {
      v34 = *(_QWORD *)v173;
      do
      {
        for (i = 0; i != v33; i = (char *)i + 1)
        {
          if (*(_QWORD *)v173 != v34)
            objc_enumerationMutation(obj);
          v36 = *(void **)(*((_QWORD *)&v172 + 1) + 8 * (_QWORD)i);
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "predicate"));
          if (objc_msgSend(v37, "evaluateWithObject:", v145))
            v38 = CFSTR("YES");
          else
            v38 = CFSTR("NO");
          v39 = v38;

          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "identifier"));
          v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "predicate"));
          sub_100009E24(CFSTR("%@: %@ - %@"), v41, v42, v43, v44, v45, v46, v47, (uint64_t)v40);

        }
        v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v172, v180, 16);
      }
      while (v33);
    }

    sub_100009E24(CFSTR("\nDecorations:"), v48, v49, v50, v51, v52, v53, v54, v135);
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "itemDecorations"));
    v139 = dispatch_semaphore_create(0);
    v168 = 0u;
    v169 = 0u;
    v170 = 0u;
    v171 = 0u;
    v56 = v55;
    v57 = 0;
    v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v168, v179, 16);
    if (v58)
    {
      v59 = *(_QWORD *)v169;
      do
      {
        for (j = 0; j != v58; j = (char *)j + 1)
        {
          if (*(_QWORD *)v169 != v59)
            objc_enumerationMutation(v56);
          v57 |= objc_msgSend(*(id *)(*((_QWORD *)&v168 + 1) + 8 * (_QWORD)j), "requiresFetchingInfoFirst");
        }
        v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v168, v179, 16);
      }
      while (v58);
    }

    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "fp_map:", &stru_100014C70));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "decorations"));
    v166[0] = _NSConcreteStackBlock;
    v166[1] = 3221225472;
    v166[2] = sub_1000088A0;
    v166[3] = &unk_100014C98;
    v138 = v61;
    v167 = v138;
    v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "fp_filter:", v166));

    if (v141)
    {
      v164 = 0u;
      v165 = 0u;
      v162 = 0u;
      v163 = 0u;
      v70 = v141;
      v78 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v162, v178, 16);
      if (v78)
      {
        v79 = *(_QWORD *)v163;
        do
        {
          for (k = 0; k != v78; k = (char *)k + 1)
          {
            if (*(_QWORD *)v163 != v79)
              objc_enumerationMutation(v70);
            sub_100009E24(CFSTR("%@: missing or invalid"), v71, v72, v73, v74, v75, v76, v77, *(_QWORD *)(*((_QWORD *)&v162 + 1) + 8 * (_QWORD)k));
          }
          v78 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v162, v178, 16);
        }
        while (v78);
      }

    }
    if ((v57 & 1) != 0)
    {
      sub_100009E24(CFSTR("Item decorations require fetching item hierarchy"), v63, v64, v65, v66, v67, v68, v69, v136);
      v156 = 0;
      v157 = &v156;
      v158 = 0x3032000000;
      v159 = sub_1000088C0;
      v160 = sub_1000088D0;
      v161 = 0;
      v152[0] = _NSConcreteStackBlock;
      v152[1] = 3221225472;
      v152[2] = sub_1000088D8;
      v152[3] = &unk_100014CC0;
      v155 = &v156;
      v81 = v139;
      v153 = v81;
      v154 = v56;
      +[FPItemDecoration fetchInfoForItem:completionHandler:](FPItemDecoration, "fetchInfoForItem:completionHandler:", v143, v152);
      dispatch_semaphore_wait(v81, 0xFFFFFFFFFFFFFFFFLL);
      if (v157[5])
      {
        (*(void (**)(void))(*(_QWORD *)(v140 + 40) + 16))();

        _Block_object_dispose(&v156, 8);
LABEL_49:

        goto LABEL_50;
      }

      _Block_object_dispose(&v156, 8);
    }
    else
    {
      v150 = 0u;
      v151 = 0u;
      v148 = 0u;
      v149 = 0u;
      v86 = v56;
      v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v148, v177, 16);
      if (v87)
      {
        v88 = *(_QWORD *)v149;
        do
        {
          v89 = 0;
          v90 = v146;
          do
          {
            if (*(_QWORD *)v149 != v88)
              objc_enumerationMutation(v86);
            v91 = *(void **)(*((_QWORD *)&v148 + 1) + 8 * (_QWORD)v89);
            v147 = v90;
            v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "labelWithItem:error:", v143, &v147));
            v146 = v147;

            v93 = objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "decorationIdentifier"));
            v101 = (void *)v93;
            if (v92)
              sub_100009E24(CFSTR("%@: \"%@\""), v94, v95, v96, v97, v98, v99, v100, v93);
            else
              sub_100009E24(CFSTR("%@ failed: %@"), v94, v95, v96, v97, v98, v99, v100, v93);

            v89 = (char *)v89 + 1;
            v90 = v146;
          }
          while (v87 != v89);
          v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v148, v177, 16);
        }
        while (v87);
      }

    }
    v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "humanReadableCapabilities"));
    sub_100009E24(CFSTR("\nCapabilities: %@"), v103, v104, v105, v106, v107, v108, v109, (uint64_t)v102);

    v110 = objc_msgSend(v143, "contentPolicy");
    sub_100009E24(CFSTR("\nContent Policy: %ld"), v111, v112, v113, v114, v115, v116, v117, (uint64_t)v110);
    v118 = objc_msgSend(v143, "inheritedContentPolicy");
    sub_100009E24(CFSTR("\nInherited Content Policy: %ld"), v119, v120, v121, v122, v123, v124, v125, (uint64_t)v118);
    v126 = objc_msgSend(v143, "effectiveContentPolicy");
    sub_100009E24(CFSTR("\nEffective Content Policy: %ld"), v127, v128, v129, v130, v131, v132, v133, (uint64_t)v126);
    (*(void (**)(void))(*(_QWORD *)(v140 + 40) + 16))();
    goto LABEL_49;
  }
  v14 = v6;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_51:

}

void sub_1000087B4(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1000087C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a39, 8);
  _Unwind_Resume(a1);
}

id sub_1000087E0()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)qword_100018D20;
  v7 = qword_100018D20;
  if (!qword_100018D20)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1000097A4;
    v3[3] = &unk_100014D78;
    v3[4] = &v4;
    sub_1000097A4((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100008880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100008898(id a1, FPItemDecoration *a2)
{
  return -[FPItemDecoration decorationIdentifier](a2, "decorationIdentifier");
}

uint64_t sub_1000088A0(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

uint64_t sub_1000088C0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000088D0(uint64_t a1)
{

}

void sub_1000088D8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
    v8 = *(NSObject **)(a1 + 32);
  }
  else
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = a1;
    v9 = *(id *)(a1 + 40);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v10)
    {
      v11 = v10;
      v7 = 0;
      v12 = *(_QWORD *)v29;
      do
      {
        v13 = 0;
        v14 = v7;
        do
        {
          if (*(_QWORD *)v29 != v12)
            objc_enumerationMutation(v9);
          v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v13);
          v27 = v14;
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "labelWithInfo:error:", v5, &v27));
          v7 = v27;

          v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "decorationIdentifier"));
          v25 = (void *)v17;
          if (v16)
            sub_100009E24(CFSTR("%@: \"%@\""), v18, v19, v20, v21, v22, v23, v24, v17);
          else
            sub_100009E24(CFSTR("%@ failed: %@"), v18, v19, v20, v21, v22, v23, v24, v17);

          v13 = (char *)v13 + 1;
          v14 = v7;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v11);
    }
    else
    {
      v7 = 0;
    }

    v8 = *(NSObject **)(v26 + 32);
  }
  dispatch_semaphore_signal(v8);

}

void sub_100008A9C(int a1, uint64_t a2, void *a3)
{
  void (**v5)(id, void *);
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  void *v20;
  id v21;
  dispatch_group_t v22;
  void *v23;
  id v24;
  char *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  id v29;
  dispatch_queue_global_t global_queue;
  NSObject *v31;
  id v32;
  _QWORD *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  void (**v38)(id, void *);
  _QWORD v39[4];
  id v40;
  _QWORD block[4];
  id v42;
  id v43;
  _QWORD *v44;
  _QWORD v45[4];
  NSObject *v46;
  id v47;
  _QWORD *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[5];
  id v54;
  _QWORD v55[11];
  _BYTE v56[128];

  v5 = a3;
  if (a1 <= 1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError fp_errorWithPOSIXCode:description:](NSError, "fp_errorWithPOSIXCode:description:", 22, CFSTR("Error: fileproviderctl evaluate <item>")));
    v5[2](v5, v6);
LABEL_5:

    goto LABEL_18;
  }
  if (a1 == 2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", *(_QWORD *)(a2 + 8)));
    sub_100007E5C(v6, v5);
    goto LABEL_5;
  }
  v55[0] = FPPreflightActionCreate;
  v55[1] = FPPreflightActionMove;
  v55[2] = FPPreflightActionMoveOut;
  v55[3] = FPPreflightActionMoveIn;
  v55[4] = FPPreflightActionCopy;
  v55[5] = FPPreflightActionCopyIn;
  v55[6] = FPPreflightActionCopyOut;
  v55[7] = FPPreflightActionTrash;
  v55[8] = FPPreflightActionDelete;
  v55[9] = FPPreflightActionRename;
  v55[10] = FPPreflightActionIgnore;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v55, 11));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", *(_QWORD *)(a2 + 8)));
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100008FD4;
  v39[3] = &unk_100014C98;
  v8 = v7;
  v40 = v8;
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "fp_filter:", v39));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "lastObject"));
  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v18 = (_QWORD *)(a2 + 16);
    v19 = a1 - 2;
    do
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", *v18));
      objc_msgSend(v17, "addObject:", v20);

      ++v18;
      --v19;
    }
    while (v19);
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100009040;
    v36[3] = &unk_100014D50;
    v38 = v5;
    v37 = v16;
    v21 = v17;
    v33 = v36;
    v22 = dispatch_group_create();
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v53[0] = 0;
    v53[1] = v53;
    v53[2] = 0x3032000000;
    v53[3] = sub_1000088C0;
    v53[4] = sub_1000088D0;
    v54 = 0;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v24 = v21;
    v25 = (char *)objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v50;
      while (1)
      {
        if (*(_QWORD *)v50 != v26)
          objc_enumerationMutation(v24);
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
        objc_msgSend(v23, "addObject:", v27);

        if (!--v25)
        {
          v25 = (char *)objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
          if (!v25)
            break;
        }
      }
    }

    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_100009880;
    v45[3] = &unk_100014E08;
    v28 = v22;
    v46 = v28;
    v29 = v23;
    v47 = v29;
    v48 = v53;
    objc_msgSend(v24, "enumerateObjectsUsingBlock:", v45);
    global_queue = dispatch_get_global_queue(21, 0);
    v31 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100009BE4;
    block[3] = &unk_100014E30;
    v44 = v53;
    v42 = v29;
    v43 = v33;
    v32 = v29;
    dispatch_group_notify(v28, v31, block);

    _Block_object_dispose(v53, 8);
  }
  else
  {
    sub_100009F38(CFSTR("%@ is not a valid action; possible actions are %@"),
      v9,
      v10,
      v11,
      v12,
      v13,
      v14,
      v15,
      (uint64_t)v8);
    v24 = (id)objc_claimAutoreleasedReturnValue(+[NSError fp_errorWithPOSIXCode:description:](NSError, "fp_errorWithPOSIXCode:description:", 22, CFSTR("Error: fileproviderctl evaluate <action> <items>")));
    v5[2](v5, v24);
  }

LABEL_18:
}

void sub_100008FA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
  _Block_object_dispose(&a47, 8);
  _Unwind_Resume(a1);
}

id sub_100008FD4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lowercaseString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lowercaseString"));

  v6 = objc_msgSend(v4, "isEqualToString:", v5);
  return v6;
}

void sub_100009040(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const __CFString *v36;
  void *i;
  void *v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const __CFString *v51;
  void *v52;
  void *v53;
  void *v54;
  unsigned int v55;
  void *v56;
  void *v57;
  unsigned int v58;
  void *v59;
  void *v60;
  __CFString *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  const __CFString *v65;
  const __CFString *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  id v81;
  uint64_t v82;
  void *v83;
  id v84;
  id obj;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  id v91;
  void *v92;
  uint64_t v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  id v98;
  id v99;
  _BYTE v100[128];

  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
    v99 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[FPProviderDomain providerDomainForItem:cachePolicy:error:](FPProviderDomain, "providerDomainForItem:cachePolicy:error:", v8, 0, &v99));
    v7 = v99;

    if (!v9)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_37:

      goto LABEL_38;
    }
    v10 = FPPreflightActionMove;
    if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", FPPreflightActionMove) & 1) != 0
      || objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", FPPreflightActionCopy))
    {
      if ((unint64_t)objc_msgSend(v5, "count") <= 1)
      {
        v11 = *(_QWORD *)(a1 + 40);
        v12 = +[NSError fp_errorWithPOSIXCode:description:](NSError, "fp_errorWithPOSIXCode:description:", 22, CFSTR("Error: %@ and %@ require at least two items (sources and destination)"), v10, FPPreflightActionCopy);
LABEL_8:
        v13 = (id)objc_claimAutoreleasedReturnValue(v12);
        (*(void (**)(uint64_t, id))(v11 + 16))(v11, v13);
        v14 = v7;
LABEL_36:

        v7 = v14;
        goto LABEL_37;
      }
      v13 = objc_msgSend(v5, "mutableCopy");
      objc_msgSend(v13, "removeLastObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
    }
    else
    {
      v16 = FPPreflightActionCreate;
      if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", FPPreflightActionCreate))
      {
        if (objc_msgSend(v5, "count") != (id)1)
        {
          v11 = *(_QWORD *)(a1 + 40);
          v12 = +[NSError fp_errorWithPOSIXCode:description:](NSError, "fp_errorWithPOSIXCode:description:", 22, CFSTR("Error: %@ requires exactly one item (parent folder)"), v16, v75);
          goto LABEL_8;
        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
        v13 = 0;
      }
      else
      {
        v13 = v5;
        v15 = 0;
      }
    }
    v17 = *(_QWORD *)(a1 + 32);
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "fp_map:", &stru_100014D28));
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "itemIdentifier"));
    sub_100009E24(CFSTR("Evaluating %@ with source items %@, destination item %@"), v18, v19, v20, v21, v22, v23, v24, v17);

    v25 = objc_claimAutoreleasedReturnValue(+[FPPreflightUserInteraction evaluationObjectsForAction:sourceItems:destinationItem:domainUserInfo:sourceItemKeysAllowList:destinationItemKeysAllowList:](FPPreflightUserInteraction, "evaluationObjectsForAction:sourceItems:destinationItem:domainUserInfo:sourceItemKeysAllowList:destinationItemKeysAllowList:", *(_QWORD *)(a1 + 32), v13, v15, 0, 0, 0));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
    v98 = v7;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[FPPreflightUserInteraction interactionsForProviderItem:error:](FPPreflightUserInteraction, "interactionsForProviderItem:error:", v26, &v98));
    v14 = v98;

    if (v27)
    {
      v79 = v14;
      v80 = v15;
      v81 = v13;
      v82 = a1;
      v83 = v9;
      v84 = v5;
      sub_100009E24(CFSTR("Evaluating interactions against %@"), v28, v29, v30, v31, v32, v33, v34, v25);
      v96 = 0u;
      v97 = 0u;
      v94 = 0u;
      v95 = 0u;
      v78 = v27;
      obj = v27;
      v35 = (void *)v25;
      v91 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v100, 16);
      if (v91)
      {
        v90 = *(_QWORD *)v95;
        v88 = FPIsSuppressed;
        v87 = FPCanBeSuppressed;
        v36 = &stru_1000160E0;
        v86 = FPHelpURLKey;
        v89 = (void *)v25;
        do
        {
          for (i = 0; i != v91; i = (char *)i + 1)
          {
            if (*(_QWORD *)v95 != v90)
              objc_enumerationMutation(obj);
            v38 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * (_QWORD)i);
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "evaluateWithObjectsByName:suppressionDelegate:", v35, 0));
            v40 = objc_msgSend(v39, "count");
            v41 = sub_100009628(v38);
            v42 = objc_claimAutoreleasedReturnValue(v41);
            v50 = (void *)v42;
            if (v40)
            {
              v51 = v36;
              v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "firstObject"));
              v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "userInfo"));
              v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", v88));
              v55 = objc_msgSend(v54, "BOOLValue");

              v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "userInfo"));
              v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectForKeyedSubscript:", v87));
              v58 = objc_msgSend(v57, "BOOLValue");

              v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "userInfo"));
              v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "objectForKeyedSubscript:", v86));

              v92 = v39;
              v93 = (uint64_t)v50;
              if (v60)
              {
                v61 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(", %@"), v60, v76, v77));
                v36 = v51;
              }
              else
              {
                v36 = v51;
                v61 = (__CFString *)v51;
              }
              v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "localizedDescription"));
              v63 = objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "localizedRecoverySuggestion"));
              v64 = (void *)v63;
              v65 = CFSTR(", can be suppressed");
              if (!v58)
                v65 = v36;
              v66 = CFSTR(", suppressed");
              if (!v55)
                v66 = v36;
              v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\"%@\" - \"%@\"%@%@ %@"), v62, v63, v65, v66, v61));

              v50 = (void *)v93;
              v76 = v67;
              sub_100009E24(CFSTR("%@ - %@"), v68, v69, v70, v71, v72, v73, v74, v93);

              v35 = v89;
              v39 = v92;
            }
            else
            {
              sub_100009E24(CFSTR("%@ - no match"), v43, v44, v45, v46, v47, v48, v49, v42);
            }

          }
          v91 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v100, 16);
        }
        while (v91);
      }

      (*(void (**)(void))(*(_QWORD *)(v82 + 40) + 16))();
      v9 = v83;
      v5 = v84;
      v15 = v80;
      v13 = v81;
      v27 = v78;
      v14 = v79;
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      v35 = (void *)v25;
    }

    goto LABEL_36;
  }
  v7 = v6;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_38:

}

id sub_100009620(id a1, FPItem *a2)
{
  return -[FPItem itemIdentifier](a2, "itemIdentifier");
}

id sub_100009628(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "userInteractionIdentifier"));
  v3 = objc_msgSend(v2, "length");

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "userInteractionIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "predicate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@"), v4, v5));

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "predicate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v4));
  }

  return v6;
}

id sub_1000096F4(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v3));

  v7 = 0;
  if (objc_msgSend(v4, "getResourceValue:forKey:error:", &v7, NSURLUbiquitousItemDownloadingStatusKey, a2))v5 = objc_msgSend(v7, "isEqualTo:", NSURLUbiquitousItemDownloadingStatusCurrent);
  else
    v5 = 0;

  return v5;
}

Class sub_1000097A4(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;

  v3 = 0;
  if (!qword_100018D28)
  {
    v4 = off_100014D98;
    v5 = 0;
    qword_100018D28 = _sl_dlopen(&v4, &v3);
  }
  if (!qword_100018D28)
    sub_10000DA50(&v3);
  if (v3)
    free(v3);
  result = objc_getClass("FPUIManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    sub_10000DACC();
  qword_100018D20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100009880(uint64_t a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  id v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  v5 = *(NSObject **)(a1 + 32);
  v6 = a2;
  dispatch_group_enter(v5);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000993C;
  v9[3] = &unk_100014DE0;
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v10 = v7;
  v12 = v8;
  v11 = *(id *)(a1 + 32);
  v13 = a3;
  sub_10000A050(v6, 0, 1, v9);

}

void sub_10000993C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(id *)(a1 + 32);
    objc_sync_enter(v7);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    objc_sync_exit(v7);

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FPItemManager defaultManager](FPItemManager, "defaultManager"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100009A6C;
    v13[3] = &unk_100014DB8;
    v9 = *(id *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 48);
    v14 = v9;
    v17 = v10;
    v11 = v5;
    v12 = *(_QWORD *)(a1 + 56);
    v15 = v11;
    v18 = v12;
    v16 = *(id *)(a1 + 40);
    objc_msgSend(v8, "fetchItemForURL:completionHandler:", v11, v13);

  }
}

void sub_100009A6C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSErrorUserInfoKey v20;
  uint64_t v21;

  v5 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  objc_sync_enter(v7);
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  }
  else if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "replaceObjectAtIndex:withObject:", *(_QWORD *)(a1 + 64), v5);
  }
  else
  {
    sub_100009F38(CFSTR("No item for URL %@\n"), v8, v9, v10, v11, v12, v13, v14, *(_QWORD *)(a1 + 40));
    v15 = *(_QWORD *)(a1 + 40);
    v20 = NSURLErrorKey;
    v21 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
    v17 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSFileProviderErrorDomain, -1005, v16));
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  objc_sync_exit(v7);

}

void sub_100009BC8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100009BE4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v3 = a1 + 40;
  v2 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 8) + 8) + 40))
    return (*(uint64_t (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
  else
    return (*(uint64_t (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 32));
}

void sub_100009C10(uint64_t a1, const char *a2, char *a3)
{
  const char *v5;
  const char *v6;
  const char *v7;
  uint64_t i;

  puts(a3);
  v5 = getprogname();
  v6 = "";
  if (a2)
    v7 = a2;
  else
    v7 = "";
  if (a2)
    v6 = " ";
  printf("Usage: %s %s%s<verb> <options>, where <verb> is as follows:\n\n", v5, v7, v6);
  for (i = a1 + 24; *(_QWORD *)(i + 8) || *(_QWORD *)(i + 16); i += 48)
  {
    if (*(_BYTE *)i)
      printf("    %c|%s %s\n        %s\n\n");
    else
      printf("    %s %s\n        %s\n\n");
  }
  exit(64);
}

void sub_100009CD4(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  const char **v8;
  const char *v9;
  const char *v10;
  _QWORD *i;
  uint64_t (*v12)(uint64_t, const char **);
  size_t v13;
  const char *v14;
  int v15;
  int v16;
  int *v17;
  char *v18;
  id v19;

  v19 = a4;
  v7 = (a2 - 1);
  if (a2 <= 1)
  {
    printf("Error: argc <= %d: (argc = %d)\n", 1, a2);
    exit(65);
  }
  v10 = *(const char **)(a3 + 8);
  v8 = (const char **)(a3 + 8);
  v9 = v10;
  for (i = (_QWORD *)(a1 + 40); ; i += 6)
  {
    v12 = (uint64_t (*)(uint64_t, const char **))*(i - 1);
    if (!v12 && !*i)
      goto LABEL_18;
    if (*((_BYTE *)i - 16))
    {
      v13 = strlen(v9);
      v14 = (const char *)*(i - 5);
      if (v13 == 1 && *(unsigned __int8 *)v9 == *(unsigned __int8 *)v14)
        goto LABEL_11;
    }
    else
    {
      v14 = (const char *)*(i - 5);
    }
    if (strcmp(v9, v14))
      continue;
LABEL_11:
    if (v12)
    {
      v15 = v12(v7, v8);
      if (v15)
      {
        v16 = v15;
        if (v15 != 64)
        {
          v17 = __error();
          v18 = strerror(*v17);
          printf("error: %s\n", v18);
          exit(v16);
        }
        v9 = *v8;
LABEL_18:
        fprintf(__stderrp, "Unknown command '%s'\n", v9);
        v15 = 64;
      }
      exit(v15);
    }
    if (*i)
      break;
  }
  ((void (*)(uint64_t, const char **, id))*i)(v7, v8, v19);

}

void sub_100009E24(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9;
  id v10;
  FILE *v11;
  id v12;

  v9 = a1;
  v10 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", v9, &a9);

  v11 = __stdoutp;
  v12 = objc_retainAutorelease(v10);
  fprintf(v11, "%s\n", (const char *)objc_msgSend(v12, "UTF8String"));

}

void sub_100009EAC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9;
  id v10;
  FILE *v11;
  id v12;

  v9 = a1;
  v10 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", v9, &a9);

  v11 = __stdoutp;
  v12 = objc_retainAutorelease(v10);
  fputs((const char *)objc_msgSend(v12, "UTF8String"), v11);
  fflush(__stdoutp);

}

void sub_100009F38(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9;
  id v10;
  FILE *v11;
  id v12;

  v9 = a1;
  v10 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", v9, &a9);

  v11 = __stderrp;
  v12 = objc_retainAutorelease(v10);
  fprintf(v11, "%s\n", (const char *)objc_msgSend(v12, "UTF8String"));

}

BOOL sub_100009FC0(void *a1, int a2)
{
  const char *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  _BOOL8 v7;

  if (a2)
    v2 = "file-read-metadata";
  else
    v2 = "file-read*";
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "path"));
  v4 = getpid();
  v5 = SANDBOX_CHECK_NO_REPORT | 1u;
  v6 = objc_retainAutorelease(v3);
  v7 = fpfs_lp_sandbox_check(v4, v2, v5, objc_msgSend(v6, "fileSystemRepresentation")) == 0;

  return v7;
}

void sub_10000A050(void *a1, char a2, char a3, void *a4)
{
  id v7;
  id v8;
  _QWORD *v9;
  uint64_t v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  int v19;
  void *v20;
  id v21;
  void *v22;
  stat v23;
  void *v24;
  _QWORD v25[4];
  _QWORD *v26;
  _QWORD v27[4];
  id v28;
  char v29;

  v7 = a1;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10000A3D4;
  v27[3] = &unk_100014E58;
  v29 = a3;
  v8 = a4;
  v28 = v8;
  v9 = objc_retainBlock(v27);
  if (fpfs_supports_long_paths() && (unint64_t)objc_msgSend(v7, "length") <= 0x3FF)
  {
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByExpandingTildeInPath"));

    v7 = (id)v10;
  }
  v11 = objc_msgSend(v7, "characterAtIndex:", (char *)objc_msgSend(v7, "length") - 1);
  if (objc_msgSend(v7, "hasPrefix:", CFSTR("fp:")))
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10000A498;
    v25[3] = &unk_100014E80;
    v26 = v9;
    FPDocumentURLFromBookmarkableString(v7, v25);
    v12 = v26;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    if (objc_msgSend(v7, "hasPrefix:", CFSTR("/")))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v7, v11 == 47));
      v14 = v13;
      if (v11 == 47)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "URLByResolvingSymlinksInPath"));

        v14 = v15;
        if (objc_msgSend(v15, "fp_isSymlink"))
          sub_10000DB44();
      }
    }
    else if (objc_msgSend(v7, "hasPrefix:", CFSTR("file://")))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v7));
    }
    else
    {
      v24 = 0;
      memset(&v23, 0, sizeof(v23));
      if (stat(".", &v23) < 0 || (fpfs_fsgetpath(v23.st_dev, v23.st_ino, &v24, 0) & 0x80000000) != 0)
      {
        v21 = +[NSError fp_errorWithPOSIXCode:description:](NSError, "fp_errorWithPOSIXCode:description:", *__error(), CFSTR("Couldn't determine current working directory"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        ((void (*)(_QWORD *, _QWORD, _QWORD, void *))v9[2])(v9, 0, 0, v22);

        goto LABEL_20;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v24));
      free(v24);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByAppendingPathComponent:", v7));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v17));

    }
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "path")));
    v19 = fpfs_lp_faccessat(4294967294, objc_msgSend(v18, "fileSystemRepresentation"), 0, 32);

    if ((a2 & 1) != 0 || !v19)
    {
      ((void (*)(_QWORD *, void *, BOOL, _QWORD))v9[2])(v9, v14, v19 == 0, 0);
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError fp_errorWithPOSIXCode:description:](NSError, "fp_errorWithPOSIXCode:description:", 2, CFSTR("Couldn't find a file for %@"), v7));
      ((void (*)(_QWORD *, _QWORD, _QWORD, void *))v9[2])(v9, 0, 0, v20);

    }
  }
LABEL_20:

}

void sub_10000A3D4(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v7 = a4;
  if (v7 || !a3 || sub_100009FC0(v10, *(unsigned __int8 *)(a1 + 40)))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError fp_errorWithPOSIXCode:description:](NSError, "fp_errorWithPOSIXCode:description:", 1, CFSTR("Couldn't access src file %@ (exist: %d)"), v10, 1));
    (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v9);

  }
}

uint64_t sub_10000A498(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10000A4AC(const char *a1, char a2, char a3, void *a4)
{
  id v7;
  void *v8;
  id v9;
  id v10;

  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v9 = objc_msgSend(v8, "stringWithFileSystemRepresentation:length:", a1, strlen(a1));
  v10 = (id)objc_claimAutoreleasedReturnValue(v9);

  sub_10000A050(v10, a2, a3, v7);
}

id sub_10000A548(void *a1, void *a2)
{
  id v3;
  id v4;
  const void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v4, "isEqualToString:", FPThumbnailFormatLICachedBitmap))
  {
    v5 = (const void *)LICreateIconFromCachedBitmap(v3);
    v6 = objc_msgSend(sub_10000A640(), "imageWithCGImage:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    CFRelease(v5);
    v8 = sub_10000A6F8(v7);
    v9 = (id)objc_claimAutoreleasedReturnValue(v8);
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", FPThumbnailFormatBRUndecorated))
    {
      v9 = v3;
      goto LABEL_7;
    }
    v10 = objc_msgSend(sub_10000A640(), "imageWithData:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_applicationIconImageForFormat:precomposed:", 2, 0));
    v12 = sub_10000A6F8(v11);
    v9 = (id)objc_claimAutoreleasedReturnValue(v12);

  }
LABEL_7:

  return v9;
}

id sub_10000A640()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)qword_100018D30;
  v7 = qword_100018D30;
  if (!qword_100018D30)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10000B914;
    v3[3] = &unk_100014D78;
    v3[4] = &v4;
    sub_10000B914((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_10000A6E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10000A6F8(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;

  v1 = a1;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = off_100018D40;
  v10 = off_100018D40;
  if (!off_100018D40)
  {
    v3 = (void *)sub_10000B968();
    v2 = dlsym(v3, "UIImagePNGRepresentation");
    v8[3] = (uint64_t)v2;
    off_100018D40 = v2;
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
    sub_10000DB6C();
  v4 = ((uint64_t (*)(id))v2)(v1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

void sub_10000A79C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_10000A7B4(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "domainFullDisplayName"));
  objc_msgSend(v1, "isUsingFPFS");
  objc_msgSend(v1, "isEnabled");
  objc_msgSend(v1, "isHidden");
  objc_msgSend(v1, "needsAuthentication");
  objc_msgSend(v1, "testingModes");
  objc_msgSend(v1, "testingModes");
  v3 = objc_msgSend(v1, "disconnectionState");
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "disconnectionReason"));
  v5 = FPConnectionStateToPrettyString(v3, v4);
  v26 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "identifier"));
  sub_100009E24(CFSTR(" - %@%@%@%@%@%@%@%@\n\t%@"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v2);

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "storageURLs"));
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v16)
          objc_enumerationMutation(v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i), "fp_shortDescription"));
        sub_100009E24(CFSTR("\t%@"), v19, v20, v21, v22, v23, v24, v25, (uint64_t)v18);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v15);
  }

}

BOOL sub_10000A9F8(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v5 = a2;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000AAD8;
  v11[3] = &unk_100014EA8;
  v12 = a3;
  v6 = v12;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fp_filter:", v11));
  v8 = objc_msgSend(v7, "count");
  if (v8 == (id)1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
    objc_msgSend(v5, "addObject:", v9);

  }
  return v8 == (id)1;
}

uint64_t sub_10000AAD8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10000AAE4(void *a1, int a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  NSObject *v16;
  id v17;
  id v18;
  _QWORD *v19;
  int v20;
  _QWORD v21[3];
  char v22;

  v5 = a1;
  v6 = a3;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v22 = 0;
  v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000AC64;
  v15[3] = &unk_100014FA0;
  v19 = v21;
  v8 = v7;
  v16 = v8;
  v20 = a2;
  v9 = v5;
  v17 = v9;
  v10 = v6;
  v18 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[FPProviderDomain beginMonitoringProviderDomainChangesWithHandler:](FPProviderDomain, "beginMonitoringProviderDomainChangesWithHandler:", v15));
  v12 = v11;
  if (v11)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000B570;
    v13[3] = &unk_100014FC8;
    v14 = v11;
    dispatch_group_notify(v8, (dispatch_queue_t)&_dispatch_main_q, v13);

  }
  _Block_object_dispose(v21, 8);

}

void sub_10000AC4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000AC64(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  id v50;
  id v51;
  uint64_t v52;
  void *i;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  dispatch_queue_global_t global_queue;
  NSObject *v59;
  uint64_t v60;
  void *v61;
  id v62;
  id v63;
  uint64_t v64;
  id v65;
  id v66;
  char v67;
  uint64_t v68;
  _QWORD block[4];
  id v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _QWORD v76[5];
  _QWORD v77[5];
  _QWORD v78[5];
  _QWORD v79[5];
  _QWORD v80[5];
  _QWORD v81[5];
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  NSErrorUserInfoKey v86;
  const __CFString *v87;
  _BYTE v88[128];
  _BYTE v89[128];

  v3 = a2;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allValues"));
    v5 = v4;
    v6 = *(_DWORD *)(a1 + 64);
    if ((v6 & 1) == 0)
    {
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fp_filter:", &stru_100014EE8));

      v6 = *(_DWORD *)(a1 + 64);
      v5 = (void *)v7;
    }
    if ((v6 & 4) != 0)
    {
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fp_filter:", &stru_100014F08));

      v5 = (void *)v8;
    }
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v10 = *(void **)(a1 + 40);
    if (v10)
    {
      v18 = objc_msgSend(v10, "count");
      if (!v18)
      {
        v63 = 0;
        sub_100009F38(CFSTR("Available providers:"), v11, v12, v13, v14, v15, v16, v17, v60);
        goto LABEL_40;
      }
      v62 = v3;
      v84 = 0u;
      v85 = 0u;
      v82 = 0u;
      v83 = 0u;
      v19 = *(id *)(a1 + 40);
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v82, v89, 16);
      if (v20)
      {
        v21 = v20;
        v63 = v18;
        v67 = 0;
        v68 = *(_QWORD *)v83;
        v64 = a1;
        v65 = v9;
        do
        {
          v22 = 0;
          v66 = v21;
          do
          {
            if (*(_QWORD *)v83 != v68)
              objc_enumerationMutation(v19);
            v23 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * (_QWORD)v22);
            v81[0] = _NSConcreteStackBlock;
            v81[1] = 3221225472;
            v81[2] = sub_10000B314;
            v81[3] = &unk_100014F30;
            v81[4] = v23;
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fp_filter:", v81));
            if (!objc_msgSend(v24, "count"))
            {
              v80[0] = _NSConcreteStackBlock;
              v80[1] = 3221225472;
              v80[2] = sub_10000B354;
              v80[3] = &unk_100014F30;
              v80[4] = v23;
              v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fp_filter:", v80));

              v24 = (void *)v25;
            }
            if (objc_msgSend(v24, "count"))
            {
              if ((*(_BYTE *)(a1 + 64) & 2) != 0)
              {
                v33 = v24;
                if ((unint64_t)objc_msgSend(v33, "count") < 2)
                  goto LABEL_28;
                v79[0] = _NSConcreteStackBlock;
                v79[1] = 3221225472;
                v79[2] = sub_10000B3E4;
                v79[3] = &unk_100014F30;
                v79[4] = v23;
                if (sub_10000A9F8(v33, v9, v79))
                  goto LABEL_23;
                v78[0] = _NSConcreteStackBlock;
                v78[1] = 3221225472;
                v78[2] = sub_10000B424;
                v78[3] = &unk_100014F30;
                v78[4] = v23;
                if (sub_10000A9F8(v33, v9, v78))
                  goto LABEL_23;
                v77[0] = _NSConcreteStackBlock;
                v77[1] = 3221225472;
                v77[2] = sub_10000B464;
                v77[3] = &unk_100014F30;
                v77[4] = v23;
                if (sub_10000A9F8(v33, v9, v77))
                  goto LABEL_23;
                v76[0] = _NSConcreteStackBlock;
                v76[1] = 3221225472;
                v76[2] = sub_10000B4A4;
                v76[3] = &unk_100014F30;
                v76[4] = v23;
                if (sub_10000A9F8(v33, v9, v76) ? 3 : 0)
                {
LABEL_23:
                  v24 = v33;
                }
                else
                {
LABEL_28:
                  v24 = v33;
                  if ((unint64_t)objc_msgSend(v33, "count") >= 2)
                  {
                    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "fp_filter:", &stru_100014F50));

                  }
                  if (objc_msgSend(v24, "count") == (id)1)
                  {
                    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "firstObject"));
                    objc_msgSend(v9, "addObject:", v35);

                  }
                  else
                  {
                    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectAtIndexedSubscript:", 0));
                    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "identifier"));
                    v67 = 1;
                    v38 = v19;
                    v39 = v5;
                    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectAtIndexedSubscript:", 1));
                    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "identifier"));
                    sub_100009F38(CFSTR("multiple matches found for %@: %@ and %@"), v41, v42, v43, v44, v45, v46, v47, v23);

                    v5 = v39;
                    v19 = v38;
                    v21 = v66;

                    a1 = v64;
                    v9 = v65;
                  }
                }

              }
              else
              {
                objc_msgSend(v9, "addObjectsFromArray:", v24);
              }
            }
            else
            {
              sub_100009F38(CFSTR("File provider %@ not found. Available providers:"), v26, v27, v28, v29, v30, v31, v32, v23);
              v67 = 1;
            }

            v22 = (char *)v22 + 1;
          }
          while (v21 != v22);
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v82, v89, 16);
        }
        while (v21);

        v3 = v62;
        if ((v67 & 1) == 0)
          goto LABEL_52;
LABEL_40:
        v74 = 0u;
        v75 = 0u;
        v72 = 0u;
        v73 = 0u;
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allValues"));
        v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v72, v88, 16);
        if (v50)
        {
          v51 = v50;
          v52 = *(_QWORD *)v73;
          do
          {
            for (i = 0; i != v51; i = (char *)i + 1)
            {
              if (*(_QWORD *)v73 != v52)
                objc_enumerationMutation(v49);
              v54 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)i);
              if (objc_msgSend(v54, "supportsEnumeration"))
                sub_10000A7B4(v54);
            }
            v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v72, v88, 16);
          }
          while (v51);
        }

        v55 = *(_QWORD *)(a1 + 48);
        if (v63)
        {
          v86 = NSLocalizedDescriptionKey;
          v87 = CFSTR("Could not find a matching provider");
          v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1));
          v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSFileProviderErrorDomain, -2001, v56));
          (*(void (**)(uint64_t, _QWORD, void *))(v55 + 16))(v55, 0, v57);

        }
        else
        {
          (*(void (**)(uint64_t, _QWORD, _QWORD))(v55 + 16))(v55, 0, 0);
        }
        goto LABEL_53;
      }

    }
    else
    {
      v48 = objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v5));

      v9 = (id)v48;
    }
LABEL_52:
    global_queue = dispatch_get_global_queue(21, 0);
    v59 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000B528;
    block[3] = &unk_100014F78;
    v71 = *(id *)(a1 + 48);
    v9 = v9;
    v70 = v9;
    dispatch_async(v59, block);

LABEL_53:
  }

}

BOOL sub_10000B304(id a1, FPProviderDomain *a2)
{
  return -[FPProviderDomain supportsEnumeration](a2, "supportsEnumeration");
}

BOOL sub_10000B30C(id a1, FPProviderDomain *a2)
{
  return -[FPProviderDomain isUsingFPFS](a2, "isUsingFPFS");
}

id sub_10000B314(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "identifier"));
  v4 = objc_msgSend(v3, "localizedCaseInsensitiveContainsString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t sub_10000B354(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domainFullDisplayName"));
  if ((objc_msgSend(v4, "localizedCaseInsensitiveContainsString:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayName"));
    v5 = (uint64_t)objc_msgSend(v7, "localizedCaseInsensitiveContainsString:", *(_QWORD *)(a1 + 32));

  }
  return v5;
}

id sub_10000B3E4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "identifier"));
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

id sub_10000B424(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "domainDisplayName"));
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

id sub_10000B464(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "identifier"));
  v4 = objc_msgSend(v3, "hasPrefix:", *(_QWORD *)(a1 + 32));

  return v4;
}

id sub_10000B4A4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "domainDisplayName"));
  v4 = objc_msgSend(v3, "hasPrefix:", *(_QWORD *)(a1 + 32));

  return v4;
}

BOOL sub_10000B4E4(id a1, FPProviderDomain *a2)
{
  FPProviderDomain *v2;
  unsigned __int8 v3;

  v2 = a2;
  if ((-[FPProviderDomain isHidden](v2, "isHidden") & 1) != 0)
    v3 = 0;
  else
    v3 = -[FPProviderDomain isEnabled](v2, "isEnabled");

  return v3;
}

void sub_10000B528(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "allObjects"));
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

id sub_10000B570(uint64_t a1)
{
  return +[FPProviderDomain endMonitoringProviderDomainChanges:](FPProviderDomain, "endMonitoringProviderDomainChanges:", *(_QWORD *)(a1 + 32));
}

void sub_10000B584(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a1;
  v4 = a2;
  if (v3)
  {
    v9 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
  }
  else
  {
    v5 = &__NSArray0__struct;
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000B67C;
  v7[3] = &unk_100014FF0;
  v6 = v4;
  v8 = v6;
  sub_10000AAE4(v5, 2, v7);
  if (v3)

}

void sub_10000B67C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "firstObject"));
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

void sub_10000B6E0(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a1;
  v4 = a2;
  if (v3)
  {
    v9 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
  }
  else
  {
    v5 = &__NSArray0__struct;
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000B7D8;
  v7[3] = &unk_100014FF0;
  v6 = v4;
  v8 = v6;
  sub_10000AAE4(v5, 2, v7);
  if (v3)

}

void sub_10000B7D8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "firstObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  (*(void (**)(uint64_t, void *, id))(v4 + 16))(v4, v6, v5);

}

void sub_10000B84C(int a1, uint64_t *a2, int a3, void *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v7 = a4;
  v12 = v7;
  if (a1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", a1));
    if (a1 >= 1)
    {
      v9 = a1;
      do
      {
        v10 = *a2++;
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v10));
        objc_msgSend(v8, "addObject:", v11);

        --v9;
      }
      while (v9);
    }
    sub_10000AAE4(v8, a3, v12);

  }
  else
  {
    sub_10000AAE4(0, a3, v7);
  }

}

Class sub_10000B914(uint64_t a1)
{
  Class result;

  sub_10000B968();
  result = objc_getClass("UIImage");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    sub_10000DBE0();
  qword_100018D30 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10000B968()
{
  uint64_t v0;
  void *v2;
  __int128 v3;
  uint64_t v4;

  v2 = 0;
  if (!qword_100018D38)
  {
    v3 = off_100015010;
    v4 = 0;
    qword_100018D38 = _sl_dlopen(&v3, &v2);
  }
  v0 = qword_100018D38;
  if (!qword_100018D38)
    sub_10000DC58(&v2);
  if (v2)
    free(v2);
  return v0;
}

void sub_10000BA10(void *a1, uint64_t a2, void *a3, void *a4, char a5, char a6, void *a7, void *a8, void *a9, char a10, char a11, char a12, char a13, uint64_t a14, void *a15)
{
  id v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  id v27;
  void *v28;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  char v40;
  char v41;
  char v42;
  char v43;
  char v44;
  _QWORD block[4];
  id v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;

  v19 = a1;
  v20 = a3;
  v21 = a4;
  v22 = a7;
  v23 = a8;
  v24 = a9;
  v25 = a15;
  dispatch_group_enter(v20);
  v62 = 0;
  v63 = &v62;
  v64 = 0x3032000000;
  v65 = sub_10000BCE0;
  v66 = sub_10000BCF0;
  v67 = 0;
  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = sub_10000BCE0;
  v60 = sub_10000BCF0;
  v61 = 0;
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = sub_10000BCE0;
  v54 = sub_10000BCF0;
  v55 = 0;
  if (v24)
  {
    objc_storeStrong(&v67, a8);
    v26 = v57;
    v27 = v24;
    v28 = (void *)v26[5];
    v26[5] = (uint64_t)v27;
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000BCF8;
    block[3] = &unk_100015058;
    v46 = v23;
    v47 = &v50;
    v48 = &v62;
    v49 = &v56;
    dispatch_sync(v21, block);
    v28 = v46;
  }

  if (v63[5])
  {
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10000BED4;
    v31[3] = &unk_1000150A8;
    v39 = a10;
    v40 = a11;
    v41 = a5;
    v42 = a6;
    v43 = a13;
    v36 = &v62;
    v37 = &v56;
    v32 = v19;
    v38 = a14;
    v44 = a12;
    v33 = v23;
    v34 = v22;
    v35 = v25;
    dispatch_sync(v21, v31);

  }
  else
  {
    (*((void (**)(id, uint64_t))v25 + 2))(v25, v51[5]);
  }
  _Block_object_dispose(&v50, 8);

  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v62, 8);

}

void sub_10000BCB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  uint64_t v32;

  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 184), 8);
  _Block_object_dispose((const void *)(v32 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000BCE0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000BCF0(uint64_t a1)
{

}

void sub_10000BCF8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  __int128 v5;
  uint64_t v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FPDaemonConnection sharedConnection](FPDaemonConnection, "sharedConnection"));
  v3 = *(_QWORD *)(a1 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000BD7C;
  v4[3] = &unk_100015030;
  v5 = *(_OWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v2, "copyDatabaseForFPCKStartingAtPath:completionHandler:", v3, v4);

}

void sub_10000BD7C(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;

  v23 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description"));
    NSLog(CFSTR("Error copying FPFS databases for FPCK: %@"), v7);

    v8 = *(_QWORD *)(a1[4] + 8);
    v9 = v6;
    v10 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v9;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "allKeys"));
    v12 = objc_msgSend(v11, "count");

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "allKeys"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", 0));
      v15 = objc_msgSend(v14, "copy");
      v16 = *(_QWORD *)(a1[5] + 8);
      v17 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = v15;

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40)));
      v18 = objc_msgSend(v10, "copy");
      v19 = *(_QWORD *)(a1[6] + 8);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v18;

    }
    else
    {
      v21 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSFileProviderInternalErrorDomain, 21, 0));
      v22 = *(_QWORD *)(a1[4] + 8);
      v10 = *(void **)(v22 + 40);
      *(_QWORD *)(v22 + 40) = v21;
    }
  }

}

void sub_10000BED4(uint64_t a1)
{
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  char v25;
  uint8_t buf[16];

  v2 = *(unsigned __int8 *)(a1 + 88);
  v3 = *(unsigned __int8 *)(a1 + 89);
  v4 = *(unsigned __int8 *)(a1 + 90);
  v5 = *(unsigned __int8 *)(a1 + 91);
  v6 = *(unsigned __int8 *)(a1 + 92);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), 0));
  v10 = fp_current_or_default_log();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[INFO] 🧹 fileproviderctl launching FPCK", buf, 2u);
  }
  if (v3)
    v12 = (4 * (v2 == 0)) | 2;
  else
    v12 = 4 * (v2 == 0);
  if (v4)
  {
    v12 |= 8uLL;
    v13 = 12;
  }
  else
  {
    v13 = 8;
  }
  if (v5)
    v12 |= 0x10uLL;
  if (v6)
    v14 = v12 | 0x20;
  else
    v14 = v12;

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[FPDaemonConnection sharedConnection](FPDaemonConnection, "sharedConnection"));
  v16 = *(_QWORD *)(a1 + 80);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000C0EC;
  v19[3] = &unk_100015080;
  v25 = *(_BYTE *)(a1 + 93);
  v20 = v7;
  v17 = *(_QWORD *)(a1 + 32);
  v21 = *(id *)(a1 + 40);
  v24 = v14;
  v22 = *(id *)(a1 + 48);
  v23 = *(id *)(a1 + 56);
  v18 = v7;
  objc_msgSend(v15, "runFPCKForDomainWithID:domainRootURL:databaseBackupPath:options:reason:launchType:completionHandler:", v17, v8, v9, v14, v13, v16, v19);

}

void sub_10000C0EC(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *i;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  unsigned __int8 v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v12)
  {
LABEL_35:
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "description"));
    NSLog(CFSTR("💣 FPCK failed completing: %@"), v36);

    goto LABEL_36;
  }
  if (*(_BYTE *)(a1 + 72))
    objc_msgSend(*(id *)(a1 + 32), "appendString:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "lastPathComponent"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\nFPCK for %@:\n"), v13));

  objc_msgSend(*(id *)(a1 + 32), "appendString:", v14);
  if ((uint64_t)objc_msgSend(v10, "numberOfBrokenFilesInFSAndFSSnapshotCheck") < 1)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("✅ disk <-> FSSnapshot succeeded on %ld files.\n"), objc_msgSend(v10, "numberOfFilesChecked")));
    v12 = 0;
  }
  else
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FPCKDomain"), 65, 0));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("❌ disk <-> FSSnapshot failed on %ld/%ld files. \n"), objc_msgSend(v10, "numberOfBrokenFilesInFSAndFSSnapshotCheck"), objc_msgSend(v10, "numberOfFilesChecked")));
  }
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v15);

  if ((uint64_t)objc_msgSend(v10, "numberOfBrokenFilesInFSSnapshotAndFPSnapshotCheck") < 1)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("✅ FSSnapshot <-> FPSnapshot succeeded on %ld files. \n\n"), objc_msgSend(v10, "numberOfFilesChecked")));
  }
  else
  {
    v16 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FPCKDomain"), 65, 0));

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("❌ FSSnapshot <-> FPSnapshot failed on %ld/%ld files. \n\n"), objc_msgSend(v10, "numberOfBrokenFilesInFSSnapshotAndFPSnapshotCheck"), objc_msgSend(v10, "numberOfFilesChecked")));
    v12 = (id)v16;
  }
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v17);

  if ((uint64_t)objc_msgSend(v10, "numberOfBrokenFilesInReconciliationTableCheck") < 1)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("✅ ReconciliationTable checks succeeded on %ld files. \n\n"), objc_msgSend(v10, "numberOfFilesChecked")));
  }
  else
  {
    v18 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FPCKDomain"), 65, 0));

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("❌ ReconciliationTable checks failed on %ld/%ld files. \n\n"), objc_msgSend(v10, "numberOfBrokenFilesInReconciliationTableCheck"), objc_msgSend(v10, "numberOfFilesChecked")));
    v12 = (id)v18;
  }
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v19);

  if ((*(_BYTE *)(a1 + 64) & 0x20) != 0)
  {
    if ((uint64_t)objc_msgSend(v10, "numberOfBrokenFilesInBackupManifestCheck") >= 1)
    {
      v20 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FPCKDomain"), 65, 0));

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("❌ Backup Manifest <-> FSSnapshot failed on %ld/%ld files. \n\n"), objc_msgSend(v10, "numberOfBrokenFilesInBackupManifestCheck"), objc_msgSend(v10, "numberOfFilesChecked")));
      v12 = (id)v20;
LABEL_18:
      objc_msgSend(*(id *)(a1 + 32), "appendString:", v21);

      goto LABEL_19;
    }
    if ((*(_BYTE *)(a1 + 64) & 0x20) != 0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("✅ Backup Manifest <-> FSSnapshot succeeded on %ld files. \n\n"), objc_msgSend(v10, "numberOfFilesChecked")));
      goto LABEL_18;
    }
  }
LABEL_19:
  if (*(_BYTE *)(a1 + 72) && objc_msgSend(v11, "count"))
  {
    v37 = v12;
    v38 = v14;
    v40 = v10;
    v41 = v9;
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n✉️   Telemetry report:\n\n"));
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v39 = v11;
    v22 = v11;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(_QWORD *)v44 != v25)
            objc_enumerationMutation(v22);
          v27 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKey:", v27));
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@\n"), v27, v28));

          objc_msgSend(*(id *)(a1 + 32), "appendString:", v29);
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      }
      while (v24);
    }

    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n======================================\n\n"));
    v10 = v40;
    v9 = v41;
    v14 = v38;
    v11 = v39;
    v12 = v37;
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "dataUsingEncoding:", 4));
  if (!v30)
    v31 = objc_msgSend(CFSTR("<Invalid report format>"), "dataUsingEncoding:", 4);
  v32 = *(void **)(a1 + 48);
  v42 = 0;
  v33 = objc_msgSend(v32, "writeData:error:", v30, &v42);
  v34 = v42;
  v35 = v34;
  if ((v33 & 1) == 0)
  {
    NSLog(CFSTR("Error writing FPCK report: %@"), v34);
    if (!v12)
      v12 = v35;
  }

  if (v12)
    goto LABEL_35;
LABEL_36:
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void sub_10000C684(unsigned int a1, char *const *a2, void *a3)
{
  sub_10000C694(a1, a2, 0, 0, a3);
}

void sub_10000C694(unsigned int a1, char *const *a2, char a3, char a4, void *a5)
{
  id v9;
  dispatch_queue_attr_t v10;
  NSObject *v11;
  dispatch_queue_t v12;
  id v13;
  NSObject *v14;
  _QWORD v15[4];
  NSObject *v16;
  id v17;
  _QWORD *v18;
  char v19;
  char v20;
  _QWORD v21[5];
  dispatch_group_t v22;

  v9 = a5;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = sub_10000BCE0;
  v21[4] = sub_10000BCF0;
  v22 = 0;
  v22 = dispatch_group_create();
  v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = dispatch_queue_create("fpck", v11);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000C7F4;
  v15[3] = &unk_100015170;
  v13 = v9;
  v17 = v13;
  v18 = v21;
  v14 = v12;
  v16 = v14;
  v19 = a3;
  v20 = a4;
  sub_1000057AC(a1, a2, v15);

  _Block_object_dispose(v21, 8);
}

void sub_10000C7CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000C7E4(unsigned int a1, char *const *a2, void *a3)
{
  sub_10000C694(a1, a2, 1, 1, a3);
}

void sub_10000C7F4(uint64_t a1, int a2, uint64_t a3, void *a4, void *a5, void *a6, char a7, char a8, char a9, char a10, void *a11, uint64_t a12, void *a13)
{
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void (**v29)(id, id);
  void *v30;
  void *v31;
  char *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  void *v52;
  NSObject *v53;
  NSObject *v54;
  id v55;
  int v56;
  int v57;
  void *v58;
  id v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  __int128 v64;
  id v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  id v74;
  _QWORD v75[4];
  id v76;
  id v77;
  id v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  int v83;
  __int16 v84;
  char v85;
  char v86;
  char v87;
  char v88;
  _QWORD v89[4];
  __int128 v90;
  id obj;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t (*v95)(uint64_t, uint64_t);
  void (*v96)(uint64_t);
  id v97;
  _QWORD block[4];
  void (**v99)(id, id);
  _QWORD *v100;
  _QWORD v101[4];
  __CFString *v102;
  id v103;
  NSObject *v104;
  NSObject *v105;
  id v106;
  uint64_t *v107;
  _QWORD *v108;
  uint64_t v109;
  char v110;
  _QWORD v111[5];
  id v112;
  id v113;
  _QWORD v114[5];
  id v115;
  uint64_t v116;
  uint64_t *v117;
  uint64_t v118;
  uint64_t (*v119)(uint64_t, uint64_t);
  void (*v120)(uint64_t);
  NSMutableDictionary *v121;

  v74 = a4;
  v20 = a5;
  v21 = a6;
  v73 = a11;
  v22 = a13;
  if (!v22)
  {
    if (!v20 && v21)
    {
      v23 = *(_QWORD *)(a1 + 40);
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSError fp_invalidArgumentError:](NSError, "fp_invalidArgumentError:", CFSTR("Usage: -b is set, you need to set -a to point to the domain's root")));
      (*(void (**)(uint64_t, void *))(v23 + 16))(v23, v24);

      goto LABEL_29;
    }
    v92 = 0;
    v93 = &v92;
    v94 = 0x3032000000;
    v95 = sub_10000BCE0;
    v96 = sub_10000BCF0;
    v97 = 0;
    if (a10)
    {
      v25 = *(void **)(a1 + 40);
      v26 = *(void **)(a1 + 32);
      v27 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v28 = v26;
      v67 = v74;
      v65 = v73;
      v29 = v25;
      v116 = 0;
      v117 = &v116;
      v118 = 0x3032000000;
      v119 = sub_10000BCE0;
      v120 = sub_10000BCF0;
      v121 = 0;
      v121 = objc_opt_new(NSMutableDictionary);
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/.b/9"), "stringByAppendingPathComponent:", CFSTR("Library/Mobile Documents")));
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v30, 1));

      v32 = sub_10000D564(v31);
      v63 = v27;
      v33 = objc_claimAutoreleasedReturnValue(v32);
      NSLog(CFSTR("snapshotMobileDocumentsURL at %@ is %@"), v31, v33);
      if (v33)
        objc_msgSend((id)v117[5], "setValue:forKey:", v31, v33);
      v61 = (void *)v33;
      v62 = v31;
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/.b/9"), "stringByAppendingPathComponent:", CFSTR("Library/CloudStorage")));
      v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v34, 1));

      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v115 = 0;
      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v71, 0, 1, &v115));
      v36 = v115;

      if (v36)
      {
        v37 = fp_current_or_default_log();
        v38 = objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          sub_10000DCD4();

      }
      v114[0] = _NSConcreteStackBlock;
      v114[1] = 3221225472;
      v114[2] = sub_10000D644;
      v114[3] = &unk_100015198;
      v114[4] = &v116;
      objc_msgSend(v69, "enumerateObjectsUsingBlock:", v114);
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/.b/9"), "stringByAppendingPathComponent:", CFSTR("Library/Application Support/FileProvider")));
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v39, 1));

      NSLog(CFSTR("snapshotFPAppSupportURL is %@"), v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v113 = 0;
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v40, 0, 1, &v113));
      v43 = v113;

      if (v43)
      {
        v44 = fp_current_or_default_log();
        v45 = objc_claimAutoreleasedReturnValue(v44);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          sub_10000DCD4();

        v29[2](v29, v43);
      }
      else
      {
        v111[0] = 0;
        v111[1] = v111;
        v111[2] = 0x3032000000;
        v111[3] = sub_10000BCE0;
        v111[4] = sub_10000BCF0;
        v112 = 0;
        v101[0] = _NSConcreteStackBlock;
        v101[1] = 3221225472;
        v101[2] = sub_10000D6B8;
        v101[3] = &unk_1000151C0;
        v102 = CFSTR("database/db");
        v107 = &v116;
        v103 = v65;
        v53 = v63;
        v104 = v53;
        v54 = v28;
        v105 = v54;
        v55 = v67;
        v110 = a9;
        v108 = v111;
        v109 = a12;
        v106 = v55;
        objc_msgSend(v42, "enumerateObjectsUsingBlock:", v101);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10000D910;
        block[3] = &unk_1000146F0;
        v99 = v29;
        v100 = v111;
        dispatch_group_notify(v53, v54, block);

        _Block_object_dispose(v111, 8);
      }

      _Block_object_dispose(&v116, 8);
      v52 = v63;
      goto LABEL_24;
    }
    if (!v20)
    {
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[FPDaemonConnection sharedConnection](FPDaemonConnection, "sharedConnection"));
      v75[0] = _NSConcreteStackBlock;
      v75[1] = 3221225472;
      v75[2] = sub_10000D0E8;
      v75[3] = &unk_100015148;
      v79 = &v92;
      v50 = *(id *)(a1 + 40);
      v83 = a2;
      v51 = *(_QWORD *)(a1 + 48);
      v78 = v50;
      v80 = v51;
      v81 = a3;
      v76 = *(id *)(a1 + 32);
      v84 = *(_WORD *)(a1 + 56);
      v85 = a7;
      v86 = a8;
      v87 = a9;
      v88 = 0;
      v77 = v74;
      v82 = a12;
      objc_msgSend(v49, "providerDomainsCompletionHandler:", v75);

      v52 = v78;
LABEL_24:

LABEL_28:
      _Block_object_dispose(&v92, 8);

      goto LABEL_29;
    }
    obj = 0;
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[FPProviderDomain providerDomainForURL:error:](FPProviderDomain, "providerDomainForURL:error:", v20, &obj));
    objc_storeStrong(&v97, obj);
    v47 = (void *)v93[5];
    if (v47)
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "description"));
      NSLog(CFSTR("Error while fetching providerDomainID for url %@: %@"), v20, v48);
    }
    else
    {
      if (v46)
      {
        v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "identifier"));
        objc_msgSend(v46, "isUsingFPFS");
        v66 = *(void **)(a1 + 32);
        v68 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        v56 = *(unsigned __int8 *)(a1 + 56);
        v57 = *(unsigned __int8 *)(a1 + 57);
        v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "path"));
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "path"));
        v89[0] = _NSConcreteStackBlock;
        v89[1] = 3221225472;
        v89[2] = sub_10000D094;
        v89[3] = &unk_1000150D0;
        v64 = *(_OWORD *)(a1 + 40);
        v59 = (id)v64;
        v90 = v64;
        sub_10000BA10(v72, 0, v68, v66, v56 != 0, v57 != 0, v74, v70, v58, a7, a8, a9, 0, a12, v89);

        goto LABEL_27;
      }
      NSLog(CFSTR("No providerDomainID for url %@"), v20);
      v60 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSFileProviderErrorDomain, -2001, 0));
      v48 = (void *)v93[5];
      v93[5] = v60;
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_27:

    goto LABEL_28;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_29:

}

void sub_10000D034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48)
{
  uint64_t v48;

  _Block_object_dispose((const void *)(v48 - 256), 8);
  _Block_object_dispose((const void *)(v48 - 152), 8);
  _Block_object_dispose(&a48, 8);
  _Unwind_Resume(a1);
}

void sub_10000D094(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;

  v3 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v4 = a2;
  dispatch_group_leave(v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_10000D0E8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int16 v17;
  int v18;

  v3 = a2;
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "description"));
    NSLog(CFSTR("Error while fetching providerDomainID: %@"), v4);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v5 = *(_DWORD *)(a1 + 88);
    v6 = *(uint64_t **)(a1 + 72);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000D208;
    v10[3] = &unk_100015120;
    v7 = *(id *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 64);
    v13 = v7;
    v14 = v8;
    v11 = *(id *)(a1 + 32);
    v17 = *(_WORD *)(a1 + 92);
    v12 = *(id *)(a1 + 40);
    v18 = *(_DWORD *)(a1 + 94);
    v9 = *(_QWORD *)(a1 + 80);
    v15 = *(_QWORD *)(a1 + 56);
    v16 = v9;
    sub_10000B84C(v5, v6, 4, v10);

  }
}

void sub_10000D208(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int8x16_t v21;
  uint64_t v22;
  char v23;
  char v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  id v33;
  uint64_t v34;
  id v35;
  _QWORD block[4];
  id v37;
  uint64_t v38;
  _QWORD v39[4];
  int8x16_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
    NSLog(CFSTR("Error while parsing provider domains: %@"), v8);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    NSLog(CFSTR("🧹 About to launch FPCK checks for %lu domains"), objc_msgSend(v5, "count"));
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v35 = v5;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v42 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "storageURLs"));
          v16 = objc_msgSend(v15, "count");

          if (v16)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "storageURLs"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", 0));
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "path"));

            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
            v21 = vextq_s8(*(int8x16_t *)(a1 + 56), *(int8x16_t *)(a1 + 56), 8uLL);
            v22 = *(_QWORD *)(a1 + 56);
            v23 = *(_BYTE *)(a1 + 80);
            v24 = *(_BYTE *)(a1 + 81);
            v25 = *(void **)(a1 + 32);
            v26 = *(void **)(a1 + 40);
            v27 = *(_DWORD *)(a1 + 82);
            v28 = *(_QWORD *)(a1 + 72);
            v39[0] = _NSConcreteStackBlock;
            v29 = *(void **)(*(_QWORD *)(v22 + 8) + 40);
            v39[1] = 3221225472;
            v39[2] = sub_10000D4EC;
            v39[3] = &unk_1000150F8;
            v40 = v21;
            sub_10000BA10(v20, 0, v29, v25, v23, v24, v26, v19, 0, v27, SBYTE1(v27), SBYTE2(v27), SHIBYTE(v27), v28, v39);

          }
          else
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
            NSLog(CFSTR("Skipping %@, usingFPFS %d"), v19, objc_msgSend(v14, "isUsingFPFS"));
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v11);
    }

    v30 = *(void **)(a1 + 48);
    v31 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v32 = *(NSObject **)(a1 + 32);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D54C;
    block[3] = &unk_1000146F0;
    v33 = v30;
    v34 = *(_QWORD *)(a1 + 64);
    v37 = v33;
    v38 = v34;
    dispatch_group_notify(v31, v32, block);

    v7 = 0;
    v5 = v35;
  }

}

void sub_10000D4EC(uint64_t a1, void *a2)
{
  uint64_t v4;
  id *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  if (v7)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(_QWORD *)(v4 + 40);
    v5 = (id *)(v4 + 40);
    if (!v6)
      objc_storeStrong(v5, a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

uint64_t sub_10000D54C(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

char *sub_10000D564(void *a1)
{
  id v1;
  char *v2;
  void *v3;
  void *v4;
  const char *v5;
  ssize_t v6;
  size_t size;

  size = 0;
  v1 = objc_retainAutorelease(a1);
  v2 = (char *)fpfs_path_return_assigned_provider_domain_xattr(objc_msgSend(v1, "fileSystemRepresentation"), &size, 0, 0);
  if (v2)
  {
    v3 = malloc_type_malloc(size + 1, 0x3ADBDA92uLL);
    if (v3)
    {
      v4 = v3;
      v5 = (const char *)objc_msgSend(objc_retainAutorelease(v1), "fileSystemRepresentation");
      v6 = getxattr(v5, v2, v4, size, 0, 0);
      if (v6 >= 1 && v6 <= (uint64_t)size)
      {
        *((_BYTE *)v4 + v6) = 0;
        v2 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v4));
      }
      else
      {
        v2 = 0;
      }
      free(v4);
    }
    else
    {
      v2 = 0;
    }
  }

  return v2;
}

void sub_10000D644(uint64_t a1, void *a2)
{
  char *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = sub_10000D564(v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  NSLog(CFSTR("csProviderDomainID at %@ is %@"), v5, v4);
  if (v4)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setValue:forKey:", v5, v4);

}

void sub_10000D6B8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  char *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;

  v3 = a2;
  NSLog(CFSTR("enumerating... %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent"));
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("backup"));

  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:", *(_QWORD *)(a1 + 32)));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
    v9 = objc_msgSend(v7, "fileExistsAtPath:", v8);

    if (v9)
    {
      v10 = sub_10000D564(v3);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "objectForKey:", v11));
      if (v12)
      {
        v13 = *(void **)(a1 + 40);
        if (!v13 || objc_msgSend(v13, "isEqualToString:", v11))
        {
          NSLog(CFSTR("found providerDomainID (%@) for db at %@, that matches rootURL %@"), v11, v3, v12);
          v14 = *(void **)(a1 + 56);
          v19 = *(void **)(a1 + 48);
          v20 = *(void **)(a1 + 64);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "path"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
          v17 = *(_BYTE *)(a1 + 96);
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472;
          v21[2] = sub_10000D8B8;
          v21[3] = &unk_1000148E8;
          v18 = *(_QWORD *)(a1 + 88);
          v23 = *(_QWORD *)(a1 + 80);
          v22 = *(id *)(a1 + 48);
          sub_10000BA10(v11, 0, v19, v14, 0, 0, v20, v15, v16, 1, 1, v17, 1, v18, v21);

        }
      }

    }
  }

}

void sub_10000D8B8(uint64_t a1, void *a2)
{
  uint64_t v4;
  id *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  if (v7)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(_QWORD *)(v4 + 40);
    v5 = (id *)(v4 + 40);
    if (!v6)
      objc_storeStrong(v5, a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t sub_10000D910(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void sub_10000D928(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_10000D954(uint64_t *a1, int __errnum, NSObject *a3)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  char *v8;

  v4 = *a1;
  v5 = 136315394;
  v6 = v4;
  v7 = 2080;
  v8 = strerror(__errnum);
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "[ERROR] Can't spawn %s: %s", (uint8_t *)&v5, 0x16u);
  sub_100006E60();
}

void sub_10000D9E8(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_100006E6C(a1);
  sub_100006E74();
  sub_100006E4C((void *)&_mh_execute_header, v1, v2, "[ERROR] Unable to initialize the file actions properly: %s", v3, v4, v5, v6, v7);
  sub_100006E60();
}

void sub_10000DA50(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *FileProviderUILibrary(void)"));
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("cmd-evaluate.m"), 28, CFSTR("%s"), *a1);

  __break(1u);
}

void sub_10000DACC()
{
  void *v0;
  void *v1;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Class getFPUIManagerClass(void)_block_invoke"));
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("cmd-evaluate.m"), 29, CFSTR("Unable to find class %s"), "FPUIManager");

  __break(1u);
}

void sub_10000DB44()
{
  __assert_rtn("FPURLFromParameterString", "fileproviderctl-utilities.m", 173, "!url.fp_isSymlink");
}

void sub_10000DB6C()
{
  void *v0;
  void *v1;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "NSData *_UIImagePNGRepresentation(UIImage *__strong)"));
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("fileproviderctl-utilities.m"), 25, CFSTR("%s"), dlerror());

  __break(1u);
}

void sub_10000DBE0()
{
  void *v0;
  void *v1;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Class getUIImageClass(void)_block_invoke"));
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("fileproviderctl-utilities.m"), 24, CFSTR("Unable to find class %s"), "UIImage");

  __break(1u);
}

void sub_10000DC58(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *UIKitLibrary(void)"));
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("fileproviderctl-utilities.m"), 23, CFSTR("%s"), *a1);

  __break(1u);
}

void sub_10000DCD4()
{
  uint64_t v0;
  os_log_t v1;

  sub_10000D93C();
  sub_10000D928((void *)&_mh_execute_header, v0, v1, "[ERROR] there was an error enumerating %@, error: %@");
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByResolvingSymlinksInPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByResolvingSymlinksInPath");
}

id objc_msgSend_URLByStandardizingPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByStandardizingPath");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__applicationIconImageForFormat_precomposed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_applicationIconImageForFormat:precomposed:");
}

id objc_msgSend__getDebugInfoWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getDebugInfoWithCompletionHandler:");
}

id objc_msgSend__initWithProviderIdentifier_domain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initWithProviderIdentifier:domain:");
}

id objc_msgSend_actionsForProviderDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionsForProviderDomain:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addOperation:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allValues");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_beginMonitoringProviderDomainChangesWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginMonitoringProviderDomainChangesWithHandler:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "characterAtIndex:");
}

id objc_msgSend_closeFile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "closeFile");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_color(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "color");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_conformsToType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conformsToType:");
}

id objc_msgSend_connectionForUser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionForUser:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentModificationDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentModificationDate");
}

id objc_msgSend_contentPolicy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentPolicy");
}

id objc_msgSend_contentType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentType");
}

id objc_msgSend_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:");
}

id objc_msgSend_coordinateAccessWithIntents_queue_byAccessor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coordinateAccessWithIntents:queue:byAccessor:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_copyDatabaseForFPCKStartingAtPath_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyDatabaseForFPCKStartingAtPath:completionHandler:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dateFormatter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateFormatter");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_decorationIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decorationIdentifier");
}

id objc_msgSend_decorations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decorations");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_descriptionForFPCTL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "descriptionForFPCTL:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_disconnectionReason(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disconnectionReason");
}

id objc_msgSend_disconnectionState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disconnectionState");
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayName");
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "distantFuture");
}

id objc_msgSend_documentSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "documentSize");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_domainDisplayName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domainDisplayName");
}

id objc_msgSend_domainFullDisplayName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domainFullDisplayName");
}

id objc_msgSend_domainPathRelativeToVolumeRoot(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domainPathRelativeToVolumeRoot");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_downloadingError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadingError");
}

id objc_msgSend_downloadingProgress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadingProgress");
}

id objc_msgSend_dumpImage_characterWidth_characterHeight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dumpImage:characterWidth:characterHeight:");
}

id objc_msgSend_dumpProgress_prefix_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dumpProgress:prefix:error:");
}

id objc_msgSend_dumpStateTo_limitNumberOfItems_providerFilter_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dumpStateTo:limitNumberOfItems:providerFilter:completionHandler:");
}

id objc_msgSend_effectiveContentPolicy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectiveContentPolicy");
}

id objc_msgSend_entries(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "entries");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumeratorAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumeratorAtPath:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_evaluateWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "evaluateWithObject:");
}

id objc_msgSend_evaluateWithObjectsByName_suppressionDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "evaluateWithObjectsByName:suppressionDelegate:");
}

id objc_msgSend_evaluationObjectsForAction_sourceItems_destinationItem_domainUserInfo_sourceItemKeysAllowList_destinationItemKeysAllowList_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "evaluationObjectsForAction:sourceItems:destinationItem:domainUserInfo:sourceItemKeysAllowList:destinationItemKeysAllowList:");
}

id objc_msgSend_evictItemAtURL_evenIfEnumeratingFP_andClearACLForConsumer_evictionReason_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "evictItemAtURL:evenIfEnumeratingFP:andClearACLForConsumer:evictionReason:completionHandler:");
}

id objc_msgSend_evictItemWithIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "evictItemWithIdentifier:completionHandler:");
}

id objc_msgSend_extensionMatchingDictionaryForItems_fpProviderDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionMatchingDictionaryForItems:fpProviderDomain:");
}

id objc_msgSend_fetchInfoForItem_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchInfoForItem:completionHandler:");
}

id objc_msgSend_fetchItemForURL_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchItemForURL:completionHandler:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileHandleForReadingFromURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileHandleForReadingFromURL:error:");
}

id objc_msgSend_fileHandleWithStandardOutput(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileHandleWithStandardOutput");
}

id objc_msgSend_fileID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileID");
}

id objc_msgSend_fileSystemFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSystemFlags");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSystemRepresentation");
}

id objc_msgSend_fileURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURL");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_fp_alwaysObfuscatedPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fp_alwaysObfuscatedPath");
}

id objc_msgSend_fp_errorWithPOSIXCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fp_errorWithPOSIXCode:");
}

id objc_msgSend_fp_errorWithPOSIXCode_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fp_errorWithPOSIXCode:description:");
}

id objc_msgSend_fp_filter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fp_filter:");
}

id objc_msgSend_fp_invalidArgumentError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fp_invalidArgumentError:");
}

id objc_msgSend_fp_isFeatureUnsupportedError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fp_isFeatureUnsupportedError");
}

id objc_msgSend_fp_isSymlink(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fp_isSymlink");
}

id objc_msgSend_fp_map_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fp_map:");
}

id objc_msgSend_fp_shortDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fp_shortDescription");
}

id objc_msgSend_fractionCompleted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fractionCompleted");
}

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getResourceValue:forKey:error:");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_hasExpired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasExpired");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_humanReadableCapabilities(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "humanReadableCapabilities");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_imageType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageType");
}

id objc_msgSend_imageWithCGImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageWithCGImage:");
}

id objc_msgSend_imageWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageWithData:");
}

id objc_msgSend_inheritedContentPolicy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inheritedContentPolicy");
}

id objc_msgSend_initWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCString:encoding:");
}

id objc_msgSend_initWithFd_forceColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFd:forceColor:");
}

id objc_msgSend_initWithFileDescriptor_closeOnDealloc_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFileDescriptor:closeOnDealloc:");
}

id objc_msgSend_initWithFilePresenter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFilePresenter:");
}

id objc_msgSend_initWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:arguments:");
}

id objc_msgSend_initWithProviderDomainID_itemIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithProviderDomainID:itemIdentifier:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_interactionsForProviderItem_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interactionsForProviderItem:error:");
}

id objc_msgSend_isCloudItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCloudItem");
}

id objc_msgSend_isContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isContainer");
}

id objc_msgSend_isDeclared(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDeclared");
}

id objc_msgSend_isDownloaded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDownloaded");
}

id objc_msgSend_isDownloading(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDownloading");
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEnabled");
}

id objc_msgSend_isEqualTo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualTo:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isExcludedFromSync(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isExcludedFromSync");
}

id objc_msgSend_isFolder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFolder");
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isHidden");
}

id objc_msgSend_isInPinnedFolder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInPinnedFolder");
}

id objc_msgSend_isIndeterminate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isIndeterminate");
}

id objc_msgSend_isMostRecentVersionDownloaded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMostRecentVersionDownloaded");
}

id objc_msgSend_isPinned(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPinned");
}

id objc_msgSend_isRecursivelyDownloaded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRecursivelyDownloaded");
}

id objc_msgSend_isTrashed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isTrashed");
}

id objc_msgSend_isUploaded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isUploaded");
}

id objc_msgSend_isUploading(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isUploading");
}

id objc_msgSend_isUsingFPFS(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isUsingFPFS");
}

id objc_msgSend_itemDecorations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "itemDecorations");
}

id objc_msgSend_itemIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "itemIdentifier");
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "label");
}

id objc_msgSend_labelWithInfo_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "labelWithInfo:error:");
}

id objc_msgSend_labelWithItem_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "labelWithItem:error:");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastObject");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_lastUsedDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastUsedDate");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_localizedCaseInsensitiveContainsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedCaseInsensitiveContainsString:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_localizedRecoverySuggestion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedRecoverySuggestion");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lowercaseString");
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainRunLoop");
}

id objc_msgSend_materializeURL_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "materializeURL:completionHandler:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_needsAuthentication(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "needsAuthentication");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_numberOfBrokenFilesInBackupManifestCheck(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberOfBrokenFilesInBackupManifestCheck");
}

id objc_msgSend_numberOfBrokenFilesInFSAndFSSnapshotCheck(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberOfBrokenFilesInFSAndFSSnapshotCheck");
}

id objc_msgSend_numberOfBrokenFilesInFSSnapshotAndFPSnapshotCheck(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberOfBrokenFilesInFSSnapshotAndFPSnapshotCheck");
}

id objc_msgSend_numberOfBrokenFilesInReconciliationTableCheck(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberOfBrokenFilesInReconciliationTableCheck");
}

id objc_msgSend_numberOfFilesChecked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberOfFilesChecked");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
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

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_predicate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicate");
}

id objc_msgSend_providerDomainForItem_cachePolicy_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "providerDomainForItem:cachePolicy:error:");
}

id objc_msgSend_providerDomainForURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "providerDomainForURL:error:");
}

id objc_msgSend_providerDomainID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "providerDomainID");
}

id objc_msgSend_providerDomainsCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "providerDomainsCompletionHandler:");
}

id objc_msgSend_providerID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "providerID");
}

id objc_msgSend_providerNameForProviderIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "providerNameForProviderIdentifier:");
}

id objc_msgSend_readDataUpToLength_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readDataUpToLength:error:");
}

id objc_msgSend_readingIntentWithURL_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readingIntentWithURL:options:");
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeLastObject");
}

id objc_msgSend_replaceObjectAtIndex_withObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replaceObjectAtIndex:withObject:");
}

id objc_msgSend_requiresFetchingInfoFirst(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requiresFetchingInfoFirst");
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reset");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_runFPCKForDomainWithID_domainRootURL_databaseBackupPath_options_reason_launchType_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runFPCKForDomainWithID:domainRootURL:databaseBackupPath:options:reason:launchType:completionHandler:");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set");
}

id objc_msgSend_setDateStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDateStyle:");
}

id objc_msgSend_setDoesRelativeDateFormatting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDoesRelativeDateFormatting:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPerThumbnailCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPerThumbnailCompletionBlock:");
}

id objc_msgSend_setTimeStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeStyle:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedConnection");
}

id objc_msgSend_sharedConnectionProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedConnectionProxy");
}

id objc_msgSend_sleepUntilDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sleepUntilDate:");
}

id objc_msgSend_startAttributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startAttributes:");
}

id objc_msgSend_startFgColor_attr_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startFgColor:attr:");
}

id objc_msgSend_startPager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startPager");
}

id objc_msgSend_storageURLs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storageURLs");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "string");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByExpandingTildeInPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByExpandingTildeInPath");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringWithFileSystemRepresentation_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFileSystemRepresentation:length:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_supportsEnumeration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsEnumeration");
}

id objc_msgSend_synchronousSharedConnectionProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronousSharedConnectionProxy");
}

id objc_msgSend_tags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tags");
}

id objc_msgSend_testingModes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testingModes");
}

id objc_msgSend_thumbnailQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "thumbnailQueue");
}

id objc_msgSend_thumbnailsFetchOperationForItems_withSize_scale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "thumbnailsFetchOperationForItems:withSize:scale:");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_typeAndCreator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "typeAndCreator");
}

id objc_msgSend_typeWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "typeWithIdentifier:");
}

id objc_msgSend_uploadingError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uploadingError");
}

id objc_msgSend_uploadingProgress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uploadingProgress");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userInteractionIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInteractionIdentifier");
}

id objc_msgSend_waitForChangesOnItemsBelowItemWithID_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitForChangesOnItemsBelowItemWithID:completionHandler:");
}

id objc_msgSend_waitForStabilizationOfDomainWithID_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitForStabilizationOfDomainWithID:completionHandler:");
}

id objc_msgSend_waitUntilFinished(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitUntilFinished");
}

id objc_msgSend_write_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "write:");
}

id objc_msgSend_writeData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeData:error:");
}

id objc_msgSend_writingIntentWithURL_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writingIntentWithURL:options:");
}
