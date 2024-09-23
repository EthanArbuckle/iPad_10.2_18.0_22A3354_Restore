uint64_t container_log_handle_for_category(unsigned int a1)
{
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  if (a1 > 0x16)
    return MEMORY[0x1E0C88EA0];
  else
    return container_log_handle_for_category_logHandles[a1];
}

uint64_t container_class_supports_data_subdirectory()
{
  return 0;
}

uint64_t container_get_path(uint64_t a1)
{
  if (a1)
    return container_object_get_path(a1);
  return a1;
}

uint64_t container_get_identifier(uint64_t a1)
{
  if (a1)
    return container_object_get_identifier(a1);
  return a1;
}

dispatch_queue_t ___container_xpc_invalidate_shared_connection_after_timeout_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.containermanager connection release hysteresis", 0);
  _container_xpc_invalidate_shared_connection_after_timeout_queue = (uint64_t)result;
  return result;
}

unsigned __int8 *__container_copy_object_block_invoke(uint64_t a1)
{
  unsigned __int8 *result;

  result = container_object_copy(*(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t container_create_or_lookup_path_for_current_user(uint64_t a1, uint64_t a2, char a3, char a4, uint64_t a5, uint64_t a6)
{
  NSObject *v12;
  uint64_t v13;
  _QWORD v15[9];
  char v16;
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2000000000;
  v21 = 0;
  v12 = _os_activity_create(&dword_1CF7DA000, "container_create_or_lookup_path_for_current_user", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  v15[0] = MEMORY[0x1E0C87450];
  v15[1] = 0x40000000;
  v15[2] = __container_create_or_lookup_path_for_current_user_block_invoke;
  v15[3] = &unk_1E8CB3168;
  v15[4] = &v18;
  v15[5] = a1;
  v16 = a3;
  v17 = a4;
  v15[6] = a2;
  v15[7] = a5;
  v15[8] = a6;
  os_activity_apply(v12, v15);
  os_release(v12);
  v13 = v19[3];
  _Block_object_dispose(&v18, 8);
  return v13;
}

uint64_t __container_create_or_lookup_path_for_current_user_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = container_create_or_lookup_path_for_platform(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, *(_BYTE *)(a1 + 72), *(_BYTE *)(a1 + 73), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t container_create_or_lookup_path_for_platform(uint64_t a1, uint64_t a2, int a3, char a4, char a5, uint64_t a6, uint64_t a7)
{
  NSObject *v14;
  uint64_t v15;
  _QWORD v17[10];
  int v18;
  char v19;
  char v20;
  _QWORD v21[4];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v22 = 0;
  v23 = &v22;
  v24 = 0x2000000000;
  v25 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2000000000;
  v21[3] = 1;
  v14 = _os_activity_create(&dword_1CF7DA000, "container_create_or_lookup_path_for_platform", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  v17[0] = MEMORY[0x1E0C87450];
  v17[1] = 0x40000000;
  v17[2] = __container_create_or_lookup_path_for_platform_block_invoke;
  v17[3] = &unk_1E8CB3140;
  v17[6] = a1;
  v17[7] = a2;
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v17[4] = v21;
  v17[5] = &v22;
  v17[8] = a6;
  v17[9] = a7;
  os_activity_apply(v14, v17);
  os_release(v14);
  v15 = v23[3];
  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&v22, 8);
  return v15;
}

os_log_t __container_log_handle_for_category_block_invoke()
{
  os_log_t result;

  container_log_handle_for_category_logHandles[0] = (uint64_t)os_log_create("com.apple.containermanager", "unspecified");
  qword_1ECD3F338 = (uint64_t)os_log_create("com.apple.containermanager", "cache");
  qword_1ECD3F340 = (uint64_t)os_log_create("com.apple.containermanager", "sandbox");
  qword_1ECD3F348 = (uint64_t)os_log_create("com.apple.containermanager", "xpc");
  qword_1ECD3F350 = (uint64_t)os_log_create("com.apple.containermanager", "query");
  qword_1ECD3F358 = (uint64_t)os_log_create("com.apple.containermanager", "paths");
  qword_1ECD3F360 = (uint64_t)os_log_create("com.apple.containermanager", "locking");
  qword_1ECD3F368 = (uint64_t)os_log_create("com.apple.containermanager", "database");
  qword_1ECD3F370 = (uint64_t)os_log_create("com.apple.containermanager", "upcall");
  qword_1ECD3F378 = (uint64_t)os_log_create("com.apple.containermanager", "lifecycle");
  qword_1ECD3F380 = (uint64_t)os_log_create("com.apple.containermanager", "fs");
  qword_1ECD3F388 = (uint64_t)os_log_create("com.apple.containermanager", "startup");
  qword_1ECD3F390 = (uint64_t)os_log_create("com.apple.containermanager", "test");
  qword_1ECD3F398 = (uint64_t)os_log_create("com.apple.containermanager", "metadata");
  qword_1ECD3F3A0 = (uint64_t)os_log_create("com.apple.containermanager", "codesignmapping");
  qword_1ECD3F3A8 = (uint64_t)os_log_create("com.apple.containermanager", "longterm");
  qword_1ECD3F3B0 = (uint64_t)os_log_create("com.apple.containermanager", "schema");
  qword_1ECD3F3B8 = (uint64_t)os_log_create("com.apple.containermanager", "codesign");
  qword_1ECD3F3C0 = (uint64_t)os_log_create("com.apple.containermanager", "repair");
  qword_1ECD3F3C8 = (uint64_t)os_log_create("com.apple.containermanager", "disk");
  qword_1ECD3F3D0 = (uint64_t)os_log_create("com.apple.containermanager", "persona");
  qword_1ECD3F3D8 = (uint64_t)os_log_create("com.apple.containermanager", "command");
  result = os_log_create("com.apple.containermanager", "telemetry");
  qword_1ECD3F3E0 = (uint64_t)result;
  return result;
}

uint64_t __container_string_rom_create_block_invoke(uint64_t a1, unsigned int *a2, unsigned int *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int *v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int *v17;
  unsigned int v18;
  const char *v19;
  _BYTE *v20;
  unsigned int v21;
  unsigned int v22;

  v3 = *a2;
  v4 = *a3;
  if ((_DWORD)v3 == (_DWORD)v4)
    return 0;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = v6 + 32 * v3;
  v8 = v6 + 32 * v4;
  v9 = *(_QWORD *)(v7 + 16);
  v10 = *(_QWORD *)(v8 + 16);
  if (v9 < v10)
    return 0xFFFFFFFFLL;
  if (v9 > v10)
    return 1;
  v11 = v6 + 32 * v3;
  v14 = *(_DWORD *)(v11 + 24);
  v13 = (unsigned int *)(v11 + 24);
  v12 = v14;
  if (v14 == (_DWORD)v4)
    return 0;
  v15 = v6 + 32 * v4;
  v18 = *(_DWORD *)(v15 + 24);
  v17 = (unsigned int *)(v15 + 24);
  v16 = v18;
  if (v18 == (_DWORD)v3)
    return 0;
  v19 = *(const char **)v7;
  if (v19 == *(const char **)v8
    || (v20 = *(_BYTE **)(a1 + 40), result = strcmp(v19, *(const char **)v8), !(_DWORD)result))
  {
    if (v3 >= v4)
      v21 = v4;
    else
      v21 = v3;
    if (v12 >= v16)
      v22 = v16;
    else
      v22 = v12;
    if (v21 >= v22)
      v21 = v22;
    if (v21 != (_DWORD)v3)
      *v13 = v21;
    if (v21 != (_DWORD)v4)
      *v17 = v21;
    if ((_DWORD)v12 != -1 && v21 != (_DWORD)v12)
      *(_DWORD *)(v6 + 32 * v12 + 24) = v21;
    result = 0;
    if ((_DWORD)v16 != -1 && v21 != (_DWORD)v16)
    {
      result = 0;
      *(_DWORD *)(v6 + 32 * v16 + 24) = v21;
    }
  }
  else
  {
    *v20 = 1;
  }
  return result;
}

uint64_t container_create_or_lookup_user_managed_assets_path(uint64_t a1, char a2, uint64_t a3, uint64_t *a4)
{
  NSObject *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD block[8];
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2000000000;
  v22 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2000000000;
  v18 = 1;
  v8 = _os_activity_create(&dword_1CF7DA000, "container_create_or_lookup_user_managed_assets_path", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C87450];
  block[1] = 0x40000000;
  block[2] = __container_create_or_lookup_user_managed_assets_path_block_invoke;
  block[3] = &unk_1E8CB36E0;
  v14 = a2;
  block[6] = a1;
  block[7] = a3;
  block[4] = &v19;
  block[5] = &v15;
  os_activity_apply(v8, block);
  os_release(v8);
  v9 = v16;
  v10 = v16[3];
  if (a4 && v10 != 1)
  {
    *a4 = v10;
    v10 = v9[3];
  }
  container_log_error((uint64_t)"container_create_or_lookup_user_managed_assets_path", gClientFaultLoggingEnabled, v10);
  v11 = v20[3];
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  return v11;
}

uint64_t container_create_or_lookup_app_group_path_by_app_group_identifier(uint64_t a1, uint64_t *a2)
{
  int current_persona;
  NSObject *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[7];
  int v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2000000000;
  v19 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2000000000;
  v15 = 1;
  current_persona = voucher_get_current_persona();
  v5 = _os_activity_create(&dword_1CF7DA000, "container_create_or_lookup_app_group_path_by_app_group_identifier", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  v10[0] = MEMORY[0x1E0C87450];
  v10[1] = 0x40000000;
  v10[2] = __container_create_or_lookup_app_group_path_by_app_group_identifier_block_invoke;
  v10[3] = &unk_1E8CB38B0;
  v10[5] = &v16;
  v10[6] = a1;
  v10[4] = &v12;
  v11 = current_persona;
  os_activity_apply(v5, v10);
  os_release(v5);
  v6 = v13;
  v7 = v13[3];
  if (a2 && v7 != 1)
  {
    *a2 = v7;
    v7 = v6[3];
  }
  container_log_error((uint64_t)"container_create_or_lookup_app_group_path_by_app_group_identifier", 0, v7);
  v8 = v17[3];
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  return v8;
}

void container_log_error(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  char *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  NSObject *v21;
  uint32_t v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C874D8];
  if (a3 <= 70)
  {
    if (a3 > 23)
    {
      if (a3 != 24)
      {
        if (a3 != 38)
        {
          if (a3 == 55)
          {
            if (a2)
            {
              if (container_log_handle_for_category_onceToken != -1)
                dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
              v5 = container_log_handle_for_category_logHandles[0];
              if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_FAULT))
              {
                v23 = 136446210;
                v24 = a1;
                v6 = "%{public}s: client is not entitled";
LABEL_49:
                v8 = v5;
                v9 = 12;
                goto LABEL_50;
              }
              return;
            }
            if (container_log_handle_for_category_onceToken != -1)
              dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
            v15 = container_log_handle_for_category_logHandles[0];
            if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_ERROR))
              return;
            v23 = 136446210;
            v24 = a1;
            v16 = "%{public}s: client is not entitled";
            goto LABEL_85;
          }
          goto LABEL_56;
        }
        if (a2)
        {
          if (container_log_handle_for_category_onceToken != -1)
            dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
          v15 = container_log_handle_for_category_logHandles[0];
          if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_ERROR))
            return;
          v23 = 136446210;
          v24 = a1;
          v16 = "%{public}s: client sent invalid parameters";
        }
        else
        {
          if (container_log_handle_for_category_onceToken != -1)
            dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
          v15 = container_log_handle_for_category_logHandles[0];
          if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_ERROR))
            return;
          v23 = 136446210;
          v24 = a1;
          v16 = "%{public}s: client sent invalid parameters";
        }
LABEL_85:
        v21 = v15;
        v22 = 12;
        goto LABEL_88;
      }
      goto LABEL_30;
    }
    if (a3 == 1)
    {
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v17 = container_log_handle_for_category_logHandles[0];
      if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_DEFAULT))
        return;
      v23 = 136446210;
      v24 = a1;
      v12 = "%{public}s: success";
      v13 = v17;
      v14 = 12;
LABEL_55:
      _os_log_impl(&dword_1CF7DA000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v23, v14);
      return;
    }
    if (a3 != 21)
    {
LABEL_56:
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v18 = container_log_handle_for_category_logHandles[0];
      if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_ERROR))
        return;
      if ((unint64_t)a3 > 0x99)
        v19 = "UNKNOWN";
      else
        v19 = off_1E8CB1EC0[a3];
      v23 = 136446722;
      v24 = a1;
      v25 = 2050;
      v26 = a3;
      v27 = 2082;
      v28 = (void *)v19;
      v16 = "%{public}s: error = ((container_error_t)%{public}llu) %{public}s";
      v21 = v18;
      v22 = 32;
      goto LABEL_88;
    }
LABEL_30:
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v10 = container_log_handle_for_category_logHandles[0];
    if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_DEFAULT))
      return;
    v11 = off_1E8CB1EC0[a3];
    v23 = 136446722;
    v24 = a1;
    v25 = 2050;
    v26 = a3;
    v27 = 2082;
    v28 = v11;
    v12 = "%{public}s: error = ((container_error_t)%{public}llu) %{public}s";
    v13 = v10;
    v14 = 32;
    goto LABEL_55;
  }
  if (a3 <= 75)
  {
    if (a3 != 71)
    {
      if (a3 == 74)
      {
        if (a2)
        {
          if (container_log_handle_for_category_onceToken != -1)
            dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
          v7 = container_log_handle_for_category_logHandles[0];
          if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_FAULT))
          {
            v23 = 136446466;
            v24 = a1;
            v25 = 1026;
            LODWORD(v26) = geteuid();
            v6 = "%{public}s: client uid is not permitted, uid = %{public}u";
            v8 = v7;
            v9 = 18;
LABEL_50:
            _os_log_fault_impl(&dword_1CF7DA000, v8, OS_LOG_TYPE_FAULT, v6, (uint8_t *)&v23, v9);
            return;
          }
          return;
        }
        if (container_log_handle_for_category_onceToken != -1)
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        v20 = container_log_handle_for_category_logHandles[0];
        if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_ERROR))
          return;
        v23 = 136446466;
        v24 = a1;
        v25 = 1026;
        LODWORD(v26) = geteuid();
        v16 = "%{public}s: client uid is not permitted, uid = %{public}u";
        v21 = v20;
        v22 = 18;
LABEL_88:
        _os_log_error_impl(&dword_1CF7DA000, v21, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v23, v22);
        return;
      }
      goto LABEL_56;
    }
    goto LABEL_30;
  }
  if (a3 == 76)
  {
    if (a2)
    {
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v5 = container_log_handle_for_category_logHandles[0];
      if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_FAULT))
      {
        v23 = 136446210;
        v24 = a1;
        v6 = "%{public}s: client had incorrect persona during request";
        goto LABEL_49;
      }
      return;
    }
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v15 = container_log_handle_for_category_logHandles[0];
    if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_ERROR))
      return;
    v23 = 136446210;
    v24 = a1;
    v16 = "%{public}s: client had incorrect persona during request";
    goto LABEL_85;
  }
  if (a3 == 115)
  {
    if (a2)
    {
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v5 = container_log_handle_for_category_logHandles[0];
      if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_FAULT))
      {
        v23 = 136446210;
        v24 = a1;
        v6 = "%{public}s: client had ambiguous persona during request";
        goto LABEL_49;
      }
      return;
    }
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v15 = container_log_handle_for_category_logHandles[0];
    if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_ERROR))
      return;
    v23 = 136446210;
    v24 = a1;
    v16 = "%{public}s: client had ambiguous persona during request";
    goto LABEL_85;
  }
  if (a3 != 151)
    goto LABEL_56;
  if (!a2)
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v15 = container_log_handle_for_category_logHandles[0];
    if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_ERROR))
      return;
    v23 = 136446210;
    v24 = a1;
    v16 = "%{public}s: client persona did not propagate to container manager";
    goto LABEL_85;
  }
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  v5 = container_log_handle_for_category_logHandles[0];
  if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_FAULT))
  {
    v23 = 136446210;
    v24 = a1;
    v6 = "%{public}s: client persona did not propagate to container manager";
    goto LABEL_49;
  }
}

unsigned __int8 *container_object_copy(uint64_t a1)
{
  int uid;
  const char *path;
  const char *unique_path_component;
  const char *persona_unique_string;
  uint64_t v6;
  void *v7;
  xpc_object_t dictionary;
  void *v9;
  const char *string;
  unsigned __int8 v11;
  unsigned __int8 v12;
  const char *user_managed_assets_relative_path;
  const char *creator_codesign_identifier;
  unsigned __int8 *v15;
  unsigned __int8 *v16;
  _DWORD *v18;
  const char *identifier;
  const unsigned __int8 *uuid;

  uuid = (const unsigned __int8 *)container_object_get_uuid(a1);
  identifier = (const char *)container_object_get_identifier(a1);
  v18 = container_object_get_class(a1);
  uid = container_object_get_uid(a1);
  path = (const char *)container_object_get_path(a1);
  unique_path_component = (const char *)container_object_get_unique_path_component(a1);
  persona_unique_string = (const char *)container_object_get_persona_unique_string(a1);
  v6 = *(_QWORD *)(a1 + 88);
  if (v6 && (v7 = *(void **)(v6 + 136)) != 0)
  {
    dictionary = xpc_array_get_dictionary(v7, *(unsigned int *)(a1 + 96));
    v6 = *(_QWORD *)(a1 + 88);
    if (!v6)
      goto LABEL_8;
  }
  else
  {
    dictionary = *(xpc_object_t *)(a1 + 80);
    if (!v6)
    {
LABEL_8:
      string = *(const char **)(a1 + 48);
      goto LABEL_9;
    }
  }
  v9 = *(void **)(v6 + 128);
  if (!v9)
    goto LABEL_8;
  string = xpc_array_get_string(v9, *(unsigned int *)(a1 + 96));
LABEL_9:
  v11 = container_object_is_new(a1);
  v12 = container_object_is_transient(a1);
  user_managed_assets_relative_path = (const char *)container_object_get_user_managed_assets_relative_path(a1);
  creator_codesign_identifier = (const char *)container_object_get_creator_codesign_identifier(a1);
  v15 = container_object_create(uuid, identifier, (uint64_t)v18, uid, path, unique_path_component, persona_unique_string, dictionary, string, v11, v12, user_managed_assets_relative_path, creator_codesign_identifier, 0);
  v16 = v15;
  if (v15 && *(_BYTE *)(a1 + 110))
    container_object_sandbox_extension_activate((uint64_t)v15, *(unsigned __int8 *)(a1 + 111));
  return v16;
}

unint64_t container_string_rom_string_at_index(uint64_t a1, unint64_t a2)
{
  unint64_t result;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int v8;
  unint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unint64_t v12;
  int v13;
  unint64_t v14;
  unint64_t v15;
  unsigned int v16;
  unint64_t v17;
  unint64_t v18;
  BOOL v19;
  _QWORD *v20;
  unint64_t v21;
  _QWORD *v22;
  unint64_t v23;
  uint64_t v24;

  result = 0;
  if (!a1 || (a2 & 0x8000000000000000) != 0)
    return result;
  v5 = *(unsigned int *)(a1 + 8);
  if (v5 <= a2)
    return 0;
  v6 = a1 + 24;
  if (*(_BYTE *)(a1 + 6))
  {
    if (a1 == -24)
    {
      v10 = 0;
    }
    else
    {
      v7 = (*(_QWORD *)(a1 + 64) + 7) & 0xFFFFFFFFFFFFFFF8;
      v8 = flsl(v5 - 1);
      v9 = *(unsigned int *)(a1 + 32);
      if ((*(_BYTE *)(a1 + 30) & 1) == 0)
      {
        v9 += (v9 + 3) >> 2;
        if (v9 != 3 * ((v9 * (unsigned __int128)0x5555555555555556uLL) >> 64))
          LODWORD(v9) = 3 * ((v9 * (unsigned __int128)0x5555555555555556uLL) >> 64) + 3;
      }
      v10 = v7 + 8 * (((unint64_t)v9 * v8 + 63) >> 6) + v6;
      v5 = *(unsigned int *)(a1 + 8);
      if (*(_BYTE *)(a1 + 6))
      {
        v11 = *(unsigned __int8 *)(a1 + 7);
        v12 = (*(_QWORD *)(a1 + 64) + 7) & 0xFFFFFFFFFFFFFFF8;
        v13 = flsl(v5 - 1);
        v14 = *(unsigned int *)(a1 + 32);
        if ((*(_BYTE *)(a1 + 30) & 1) == 0)
        {
          v14 += (v14 + 3) >> 2;
          if (v14 != 3 * ((v14 * (unsigned __int128)0x5555555555555556uLL) >> 64))
            LODWORD(v14) = 3 * ((v14 * (unsigned __int128)0x5555555555555556uLL) >> 64) + 3;
        }
        v15 = v12 + 8 * (((unint64_t)v14 * v13 + 63) >> 6);
        v16 = *(unsigned __int8 *)(a1 + 7);
        goto LABEL_18;
      }
    }
  }
  else
  {
    v10 = a1 + 24;
  }
  v15 = 0;
  v16 = *(unsigned __int8 *)(a1 + 7);
  v11 = v16;
LABEL_18:
  if (v16 > 0x40 || !v10 && v16)
    __assert_rtn("container_bitvector_get", "container_bitvector.h", 80, "((void)\"container_bitvector_get(): bad argument\", 0)");
  v17 = ((v16 * a2) & 0x3F) + v16;
  if (v17)
  {
    v18 = ((v16 * a2) >> 3) & 0x1FFFFFFFFFFFFFF8;
    if (v17 > 0x40)
    {
      v21 = v18 + 8;
      v19 = __CFADD__(v21, v10);
      v22 = (_QWORD *)(v21 + v10);
      if (v19 || (unint64_t)v22 + 7 < 8)
        __assert_rtn("container_bitvector_get", "container_bitvector.h", 113, "((void)\"container_bitvector_get(): index too large for array\", 0)");
      v17 = (*v22 >> -(char)v17) | (*(v22 - 1) << v17);
    }
    else
    {
      v19 = __CFADD__(v18, v10);
      v20 = (_QWORD *)(v18 + v10);
      if (v19 || (unint64_t)v20 + 7 < 8)
        __assert_rtn("container_bitvector_get", "container_bitvector.h", 104, "((void)\"container_bitvector_get(): index too large for array\", 0)");
      v17 = *v20 >> -(char)v17;
    }
  }
  v23 = v15 + v6 + (((v5 * (unint64_t)v11 + 63) >> 3) & 0x3FFFFFFFF8);
  if (v16 == 64)
    v24 = -1;
  else
    v24 = ~(-1 << v16);
  return v23 + (v17 & v24);
}

unsigned __int8 *container_object_create(const unsigned __int8 *a1, const char *a2, uint64_t a3, int a4, const char *a5, const char *a6, const char *a7, void *a8, const char *a9, unsigned __int8 a10, unsigned __int8 a11, const char *a12, const char *a13, _QWORD *a14)
{
  int is_null;
  unsigned __int8 *v23;
  char *v24;
  char *v25;
  xpc_object_t v26;
  char *v27;
  char *v28;
  char *v29;

  if (a1 && a2 && a6 && (is_null = uuid_is_null(a1), (unint64_t)(a3 - 1) <= 0xD) && !is_null)
  {
    v23 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x70uLL, 0x10F00403C1846C7uLL);
    uuid_copy(v23, a1);
    *((_QWORD *)v23 + 3) = strdup(a2);
    if (a5)
      v24 = strdup(a5);
    else
      v24 = 0;
    *((_QWORD *)v23 + 4) = v24;
    *((_QWORD *)v23 + 7) = strdup(a6);
    if (a7)
      v25 = strdup(a7);
    else
      v25 = 0;
    *((_QWORD *)v23 + 5) = v25;
    *((_QWORD *)v23 + 2) = a3;
    *((_DWORD *)v23 + 26) = a4;
    if (a8)
      v26 = xpc_retain(a8);
    else
      v26 = 0;
    *((_QWORD *)v23 + 10) = v26;
    *((_DWORD *)v23 + 25) = 0;
    *((_WORD *)v23 + 55) = 0;
    if (a9)
      v27 = strndup(a9, 0x800uLL);
    else
      v27 = 0;
    *((_QWORD *)v23 + 6) = v27;
    v23[108] = a10;
    v23[109] = a11;
    *((_QWORD *)v23 + 11) = 0;
    *((_DWORD *)v23 + 24) = -1;
    if (a12)
      v28 = strdup(a12);
    else
      v28 = 0;
    *((_QWORD *)v23 + 8) = v28;
    if (a13)
      v29 = strdup(a13);
    else
      v29 = 0;
    *((_QWORD *)v23 + 9) = v29;
  }
  else
  {
    v23 = 0;
    if (a14)
      *a14 = 11;
  }
  return v23;
}

unint64_t container_frozenset_get_path_of_container_at_index(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  if (!a1)
    return 0;
  v2 = *(_DWORD *)(a1 + 8);
  if (v2 <= a2 || (*(_BYTE *)(a1 + 24 + 24 * a2 + 17) & 8) != 0)
    return 0;
  else
    return container_string_rom_string_at_index(a1 + 24 + 24 * v2, 6 * a2 + 3);
}

unint64_t container_frozenset_get_identifier_of_container_at_index(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  if (!a1)
    return 0;
  v2 = *(_DWORD *)(a1 + 8);
  if (v2 <= a2 || (*(_BYTE *)(a1 + 24 + 24 * a2 + 17) & 1) != 0)
    return 0;
  else
    return container_string_rom_string_at_index(a1 + 24 + 24 * v2, 6 * a2);
}

char *container_frozenset_create(int a1, uint64_t a2, unsigned int a3, int a4, int a5, int a6, uint64_t a7)
{
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t uuid;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const unsigned __int8 *v16;
  uint64_t v17;
  const unsigned __int8 *v18;
  unint64_t identifier;
  void *persona_unique_string;
  unint64_t unique_path_component;
  unint64_t path;
  unint64_t user_managed_assets_relative_path;
  unint64_t creator_codesign_identifier;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unsigned __int8 v34;
  int v35;
  unsigned int v36;
  unsigned int v37;
  int v38;
  int v39;
  unsigned int uid;
  char *v41;
  char *v42;
  const char **v43;
  size_t v44;
  const char *v46;
  size_t v47;
  size_t v48;
  size_t v49;
  uint64_t v50;
  char *v51;
  unint64_t v52;
  int v53;
  uint64_t v54;
  size_t v55;
  BOOL v56;
  uint64_t v60;
  int v64;
  _QWORD v65[2];
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const char **v75;
  uint64_t v76;
  void *v77;
  uuid_t dst;
  uint64_t v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C874D8];
  v72 = 0;
  v73 = 0;
  v74 = 8;
  v75 = 0;
  v68 = 0;
  v69 = 0;
  v70 = 24;
  v71 = 0;
  v65[0] = 0;
  v65[1] = 0;
  v66 = 8;
  v67 = 0;
  if (!a2)
  {
LABEL_78:
    v41 = 0;
    goto LABEL_79;
  }
  v7 = a7;
  v8 = a1;
  if (!a3)
  {
    v44 = 0;
    v43 = 0;
LABEL_82:
    v46 = container_string_rom_create(v43, v44, 1);
    v41 = (char *)v46;
    if (v46)
    {
      v47 = *((_QWORD *)v46 + 2);
      v48 = v47 + 24 * v69;
      v49 = v48 + 24;
      if (v7)
      {
        v50 = v7;
        v51 = (char *)(*(uint64_t (**)(uint64_t, size_t))(v7 + 16))(v7, v49);
      }
      else
      {
        v50 = 0;
        v51 = (char *)malloc_type_calloc(1uLL, v48 + 24, 0x4B00C31CuLL);
      }
      v42 = v51;
      if (v51)
      {
        *(_DWORD *)v51 = 1952797507;
        v51[4] = 1;
        v51[5] = v50 != 0;
        v52 = v69;
        *((_DWORD *)v51 + 2) = v69;
        *((_DWORD *)v51 + 3) = v8;
        *((_QWORD *)v51 + 2) = v49;
        memcpy(v51 + 24, v71, v70 * v52);
        v53 = *((_DWORD *)v42 + 2);
        v54 = (uint64_t)&v42[24 * v53 + 24];
        v55 = *((_QWORD *)v41 + 2);
        if (v54)
          v56 = v55 > v47;
        else
          v56 = 1;
        if (!v56)
        {
          memcpy(&v42[24 * v53 + 24], v41, v55);
          *(_BYTE *)(v54 + 5) = 1;
        }
      }
      goto LABEL_80;
    }
LABEL_79:
    v42 = 0;
    goto LABEL_80;
  }
  v9 = a2;
  v10 = 0;
  v60 = a3;
  do
  {
    v11 = *(_QWORD *)(v9 + 8 * v10);
    if (!v11)
    {
      v17 = 0;
      goto LABEL_21;
    }
    uuid = container_object_get_uuid(v11);
    v13 = v69;
    if (!v69)
      goto LABEL_20;
    v14 = uuid;
    v15 = 0;
    while (!v70)
    {
      v16 = 0;
LABEL_14:
      if (!uuid_compare((const unsigned __int8 *)v14, v16))
        goto LABEL_19;
      v13 = v69;
LABEL_16:
      if (++v15 >= v13)
        goto LABEL_20;
    }
    v16 = (const unsigned __int8 *)&v71[v70 * v15];
    if (!v14 || !v16)
      goto LABEL_14;
    if (*(_QWORD *)v14 != *(_QWORD *)v16 || *(_QWORD *)(v14 + 8) != *((_QWORD *)v16 + 1))
      goto LABEL_16;
LABEL_19:
    if ((v15 & 0x8000000000000000) == 0)
      goto LABEL_73;
LABEL_20:
    v17 = *(_QWORD *)(v9 + 8 * v10);
LABEL_21:
    v76 = v17;
    memset(dst, 0, sizeof(dst));
    v79 = 0;
    v18 = (const unsigned __int8 *)container_object_get_uuid(v17);
    uuid_copy(dst, v18);
    if (v17)
    {
      identifier = container_object_get_identifier(v17);
      persona_unique_string = (void *)container_object_get_persona_unique_string(v17);
    }
    else
    {
      identifier = 0;
      persona_unique_string = 0;
    }
    unique_path_component = container_object_get_unique_path_component(v17);
    if (a4)
      path = container_object_get_path(v17);
    else
      path = 0;
    if (a5)
      user_managed_assets_relative_path = container_object_get_user_managed_assets_relative_path(v17);
    else
      user_managed_assets_relative_path = 0;
    if (a6)
      creator_codesign_identifier = container_object_get_creator_codesign_identifier(v17);
    else
      creator_codesign_identifier = 0;
    if (identifier)
      v25 = (void *)identifier;
    else
      v25 = &unk_1CF80235E;
    v77 = v25;
    if (!c_array_append((uint64_t)&v72, &v77))
      goto LABEL_57;
    v26 = persona_unique_string ? persona_unique_string : &unk_1CF80235E;
    v77 = v26;
    if (c_array_append((uint64_t)&v72, &v77)
      && (unique_path_component ? (v27 = (void *)unique_path_component) : (v27 = &unk_1CF80235E),
          (v77 = v27, c_array_append((uint64_t)&v72, &v77))
       && (path ? (v28 = (void *)path) : (v28 = &unk_1CF80235E),
           (v77 = v28, c_array_append((uint64_t)&v72, &v77))
        && (user_managed_assets_relative_path
          ? (v29 = (void *)user_managed_assets_relative_path)
          : (v29 = &unk_1CF80235E),
            v77 = v29,
            c_array_append((uint64_t)&v72, &v77)))))
    {
      if (creator_codesign_identifier)
        v30 = (void *)creator_codesign_identifier;
      else
        v30 = &unk_1CF80235E;
      v77 = v30;
      v64 = c_array_append((uint64_t)&v72, &v77);
    }
    else
    {
LABEL_57:
      v64 = 0;
    }
    v31 = creator_codesign_identifier;
    v32 = user_managed_assets_relative_path;
    v33 = path;
    if (v17)
      v34 = container_object_get_class(v17);
    else
      v34 = 0;
    v35 = identifier == 0;
    v36 = container_object_is_new(v17);
    v37 = container_object_is_transient(v17);
    if (v36)
      v38 = 128;
    else
      v38 = 0;
    if (v37)
      v39 = 64;
    else
      v39 = 0;
    LODWORD(v79) = (v35 << 8) | ((persona_unique_string == 0) << 9) | ((unique_path_component == 0) << 10) | ((v33 == 0) << 11) | ((v32 == 0) << 12) | ((v31 == 0) << 13) | v34 & 0x3F | v38 | v39;
    if (v17)
      uid = container_object_get_uid(v17);
    else
      uid = 0;
    HIDWORD(v79) = uid;
    if (!v64)
      goto LABEL_78;
    if ((c_array_append((uint64_t)&v68, dst) & 1) == 0)
      goto LABEL_78;
    v9 = a2;
    if (!c_array_append((uint64_t)v65, &v76))
      goto LABEL_78;
LABEL_73:
    ++v10;
  }
  while (v10 != v60);
  v41 = 0;
  if (v74 && v70)
  {
    v42 = 0;
    if (v66)
    {
      v43 = v75;
      v44 = v73;
      v8 = a1;
      v7 = a7;
      goto LABEL_82;
    }
  }
  else
  {
    v42 = 0;
  }
LABEL_80:
  c_array_deinit(&v72);
  c_array_deinit(&v68);
  c_array_deinit(v65);
  container_string_rom_destroy(v41);
  return v42;
}

uint64_t c_array_append(uint64_t a1, const void *a2)
{
  size_t v3;
  uint64_t v5;
  unint64_t v6;
  size_t v7;
  char *v8;
  char *v9;
  void *v10;

  if (!a2)
    return 0;
  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v5 = *(_QWORD *)(a1 + 8);
    if (v5 != *(_QWORD *)a1)
    {
      v9 = *(char **)(a1 + 24);
LABEL_16:
      memcpy(&v9[v3 * v5], a2, v3);
      ++*(_QWORD *)(a1 + 8);
      return 1;
    }
    if (v5)
      v6 = 2 * v5;
    else
      v6 = 16;
    if (v6 <= 1)
      v7 = 1;
    else
      v7 = v6;
    v8 = (char *)malloc_type_calloc(v7, v3, 0x450253A6uLL);
    if (v8)
    {
      v9 = v8;
      memcpy(v8, *(const void **)(a1 + 24), *(_QWORD *)(a1 + 16) * *(_QWORD *)a1);
      v10 = *(void **)(a1 + 24);
      if (v10)
      {
        free(v10);
        memset_s((void *)(a1 + 24), 8uLL, 0, 8uLL);
      }
      *(_QWORD *)(a1 + 24) = v9;
      *(_QWORD *)a1 = v6;
      v5 = *(_QWORD *)(a1 + 8);
      v3 = *(_QWORD *)(a1 + 16);
      goto LABEL_16;
    }
    c_array_deinit((_QWORD *)a1);
  }
  return 0;
}

uint64_t container_object_get_uuid(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _DWORD *bytes_ptr;
  unsigned int v5;

  v1 = a1;
  v2 = *(_QWORD *)(a1 + 88);
  if (v2)
  {
    v3 = *(void **)(v2 + 120);
    if (v3)
    {
      bytes_ptr = xpc_data_get_bytes_ptr(v3);
      if (bytes_ptr && (v5 = *(_DWORD *)(v1 + 96), bytes_ptr[2] > v5))
        return (uint64_t)&bytes_ptr[6 * v5 + 6];
      else
        return 0;
    }
  }
  return v1;
}

unint64_t container_object_get_path(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  const void *bytes_ptr;

  v2 = *(_QWORD *)(a1 + 88);
  if (!v2)
    return *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 120);
  if (!v3)
    return *(_QWORD *)(a1 + 32);
  bytes_ptr = xpc_data_get_bytes_ptr(v3);
  return container_frozenset_get_path_of_container_at_index((uint64_t)bytes_ptr, *(_DWORD *)(a1 + 96));
}

_DWORD *container_object_is_new(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _DWORD *result;
  unsigned int v5;

  v2 = *(_QWORD *)(a1 + 88);
  if (!v2)
    return (_DWORD *)(*(_BYTE *)(a1 + 108) != 0);
  v3 = *(void **)(v2 + 120);
  if (!v3)
    return (_DWORD *)(*(_BYTE *)(a1 + 108) != 0);
  result = xpc_data_get_bytes_ptr(v3);
  if (result)
  {
    v5 = *(_DWORD *)(a1 + 96);
    if (result[2] <= v5)
      return 0;
    else
      return (_DWORD *)(LOBYTE(result[6 * v5 + 10]) >> 7);
  }
  return result;
}

unint64_t container_object_get_identifier(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  const void *bytes_ptr;

  v2 = *(_QWORD *)(a1 + 88);
  if (!v2)
    return *(_QWORD *)(a1 + 24);
  v3 = *(void **)(v2 + 120);
  if (!v3)
    return *(_QWORD *)(a1 + 24);
  bytes_ptr = xpc_data_get_bytes_ptr(v3);
  return container_frozenset_get_identifier_of_container_at_index((uint64_t)bytes_ptr, *(_DWORD *)(a1 + 96));
}

unint64_t container_object_get_persona_unique_string(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  const void *bytes_ptr;

  v2 = *(_QWORD *)(a1 + 88);
  if (!v2)
    return *(_QWORD *)(a1 + 40);
  v3 = *(void **)(v2 + 120);
  if (!v3)
    return *(_QWORD *)(a1 + 40);
  bytes_ptr = xpc_data_get_bytes_ptr(v3);
  return container_frozenset_get_persona_unique_string_of_container_at_index((uint64_t)bytes_ptr, *(_DWORD *)(a1 + 96));
}

_DWORD *container_object_is_transient(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _DWORD *result;
  unsigned int v5;

  v2 = *(_QWORD *)(a1 + 88);
  if (!v2)
    return (_DWORD *)(*(_BYTE *)(a1 + 109) != 0);
  v3 = *(void **)(v2 + 120);
  if (!v3)
    return (_DWORD *)(*(_BYTE *)(a1 + 109) != 0);
  result = xpc_data_get_bytes_ptr(v3);
  if (result)
  {
    v5 = *(_DWORD *)(a1 + 96);
    if (result[2] <= v5)
      return 0;
    else
      return (_DWORD *)((LOBYTE(result[6 * v5 + 10]) >> 6) & 1);
  }
  return result;
}

unint64_t container_object_get_unique_path_component(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  const void *bytes_ptr;

  v2 = *(_QWORD *)(a1 + 88);
  if (!v2)
    return *(_QWORD *)(a1 + 56);
  v3 = *(void **)(v2 + 120);
  if (!v3)
    return *(_QWORD *)(a1 + 56);
  bytes_ptr = xpc_data_get_bytes_ptr(v3);
  return container_frozenset_get_unique_path_component_of_container_at_index((uint64_t)bytes_ptr, *(_DWORD *)(a1 + 96));
}

_DWORD *container_object_get_uid(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _DWORD *result;
  unsigned int v5;

  v2 = *(_QWORD *)(a1 + 88);
  if (!v2)
    return (_DWORD *)*(unsigned int *)(a1 + 104);
  v3 = *(void **)(v2 + 120);
  if (!v3)
    return (_DWORD *)*(unsigned int *)(a1 + 104);
  result = xpc_data_get_bytes_ptr(v3);
  if (result)
  {
    v5 = *(_DWORD *)(a1 + 96);
    if (result[2] <= v5)
      return 0;
    else
      return (_DWORD *)result[6 * v5 + 11];
  }
  return result;
}

_DWORD *container_object_get_class(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _DWORD *result;
  unsigned int v5;

  v2 = *(_QWORD *)(a1 + 88);
  if (!v2)
    return *(_DWORD **)(a1 + 16);
  v3 = *(void **)(v2 + 120);
  if (!v3)
    return *(_DWORD **)(a1 + 16);
  result = xpc_data_get_bytes_ptr(v3);
  if (result)
  {
    v5 = *(_DWORD *)(a1 + 96);
    if (result[2] <= v5)
      return 0;
    else
      return (_DWORD *)(result[6 * v5 + 10] & 0x3FLL);
  }
  return result;
}

void *c_array_deinit(_QWORD *a1)
{
  void *result;
  void *v2;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  v2 = a1 + 3;
  result = (void *)a1[3];
  if (result)
  {
    free(result);
    return (void *)memset_s(v2, 8uLL, 0, 8uLL);
  }
  return result;
}

_BYTE *container_string_rom_destroy(_BYTE *result)
{
  _BYTE *__s;

  __s = result;
  if (result)
  {
    if (!result[5])
    {
      free(result);
      return (_BYTE *)memset_s(&__s, 8uLL, 0, 8uLL);
    }
  }
  return result;
}

const char *container_string_rom_create(const char **a1, size_t count, int a3)
{
  char *v3;
  BOOL v4;
  char v5;
  const char *v6;
  unsigned int v7;
  int v8;
  const char **v9;
  size_t v10;
  uint64_t v11;
  size_t v12;
  const char **v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  unsigned __int8 *v20;
  unsigned int v21;
  void *v22;
  uint64_t v23;
  char v24;
  void *v25;
  unsigned int v26;
  _DWORD *v27;
  size_t v28;
  uint64_t v29;
  uint64_t v30;
  _DWORD *v31;
  size_t v32;
  uint64_t v33;
  uint64_t v34;
  unsigned __int8 v35;
  unsigned __int8 v36;
  uint64_t v37;
  int v38;
  unint64_t v39;
  unint64_t v40;
  char *v41;
  size_t v42;
  char *v43;
  void *v44;
  int v45;
  const char *v46;
  unint64_t v47;
  int v48;
  unint64_t v49;
  unint64_t v50;
  const char *v51;
  uint64_t v52;
  unsigned int v53;
  const char *v54;
  unint64_t v55;
  int v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  _BOOL4 v64;
  uint64_t v65;
  unint64_t v66;
  int v67;
  BOOL v68;
  _BOOL4 v69;
  char *v70;
  unsigned int v71;
  unint64_t v72;
  unint64_t v73;
  uint64_t v74;
  BOOL v75;
  const char *v76;
  uint64_t v77;
  unint64_t v78;
  unint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  unint64_t v85;
  unint64_t v86;
  uint64_t v87;
  const char *v88;
  unint64_t v89;
  unint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  unint64_t v96;
  unint64_t v97;
  uint64_t v98;
  const char *v99;
  unint64_t v100;
  int8x16_t v101;
  uint64_t v102;
  const char *v103;
  unint64_t v104;
  unint64_t v105;
  int8x16_t v106;
  const char *v107;
  unint64_t v108;
  unint64_t v109;
  uint64_t v110;
  unint64_t *v111;
  unint64_t v112;
  unint64_t v113;
  unint64_t v114;
  unint64_t v115;
  unint64_t v116;
  uint64_t v117;
  unint64_t v118;
  unint64_t v119;
  unint64_t v120;
  int8x16_t v121;
  uint64_t v123;
  unint64_t v124;
  unint64_t v125;
  _BOOL4 v126;
  unint64_t v127;
  uint64_t v128;
  int v129;
  char *v130;
  unsigned __int8 v131;
  unint64_t v132;
  _BOOL4 v133;
  _QWORD v134[3];
  _QWORD __compar[6];
  char v136;
  void *__s;
  char *v138;

  v3 = 0;
  v138 = 0;
  if (a1)
    v4 = 1;
  else
    v4 = (_DWORD)count == 0;
  v5 = !v4;
  v6 = 0;
  if ((_DWORD)count == -1 || (v5 & 1) != 0)
    goto LABEL_175;
  v7 = count;
  if (count > 2)
    v8 = a3;
  else
    v8 = 0;
  if ((_DWORD)count)
  {
    v9 = a1;
    v10 = count;
    v3 = (char *)malloc_type_calloc(count, 0x20uLL, 0x105004026DBB1D4uLL);
    v138 = v3;
    if (v3)
    {
      v11 = 0;
      while (1)
      {
        v6 = *v9;
        if (!*v9)
          break;
        v12 = strlen(*v9);
        v13 = (const char **)&v3[v11];
        *v13 = v6;
        v13[1] = (const char *)(v12 + 1);
        v11 += 32;
        ++v9;
        if (32 * v7 == v11)
          goto LABEL_19;
      }
      v3 = 0;
    }
    else
    {
LABEL_53:
      v6 = 0;
    }
    goto LABEL_175;
  }
  v10 = 0;
  v3 = 0;
LABEL_19:
  v14 = 0;
  v15 = MEMORY[0x1E0C87450];
  while (v7)
  {
    v16 = 0;
    do
    {
      if (v8)
      {
        v17 = &v3[32 * v16];
        v18 = *((_QWORD *)v17 + 1);
        v19 = v18 + (v14 << 7);
        if (v18 >= 1)
        {
          v20 = *(unsigned __int8 **)v17;
          do
          {
            v21 = *v20++;
            v19 = 257 * v19 + v21;
          }
          while ((unint64_t)v20 < *(_QWORD *)v17 + v18);
        }
        *((_QWORD *)v17 + 2) = (v19 << (v18 & 0x1F)) + v19;
      }
      *(_DWORD *)&v3[32 * v16++ + 24] = -1;
    }
    while (v16 != v10);
    if (v7 <= 1)
      break;
    __s = 0;
    v22 = malloc_type_calloc(v10, 4uLL, 0x100004052888210uLL);
    __s = v22;
    if (!v22)
      goto LABEL_52;
    v23 = 0;
    do
    {
      *((_DWORD *)v22 + v23) = v23;
      ++v23;
    }
    while (v10 != v23);
    v136 = 0;
    __compar[0] = v15;
    __compar[1] = 0x40000000;
    __compar[2] = __container_string_rom_create_block_invoke;
    __compar[3] = &__block_descriptor_tmp_758;
    v3 = v138;
    __compar[4] = v138;
    __compar[5] = &v136;
    qsort_b(v22, v10, 4uLL, __compar);
    if (__s)
    {
      free(__s);
      memset_s(&__s, 8uLL, 0, 8uLL);
    }
    if (v136)
      v24 = v8;
    else
      v24 = 0;
    if ((v24 & 1) == 0)
      goto LABEL_41;
    if (++v14 == 1024)
      goto LABEL_52;
  }
  LOWORD(v14) = 0;
LABEL_41:
  if (v8)
  {
    __s = 0;
    v25 = malloc_type_calloc(v10, 8uLL, 0x100004000313F17uLL);
    __s = v25;
    if (!v25)
      goto LABEL_52;
    v26 = 0;
    v27 = v138 + 24;
    v28 = v10;
    do
    {
      if (*v27 == -1)
        *((_QWORD *)v25 + v26++) = *((_QWORD *)v27 - 1);
      v27 += 8;
      --v28;
    }
    while (v28);
    v133 = v26 > 2;
    if (v26 <= 2)
    {
      free(v25);
      memset_s(&__s, 8uLL, 0, 8uLL);
      v3 = 0;
      if (!v7)
        goto LABEL_64;
      goto LABEL_57;
    }
    v3 = (char *)container_perfect_hash_create((uint64_t)v25, v26, 2uLL);
    if (__s)
    {
      free(__s);
      memset_s(&__s, 8uLL, 0, 8uLL);
    }
    if (!v3)
    {
LABEL_52:
      v3 = 0;
      goto LABEL_53;
    }
  }
  else
  {
    v3 = 0;
    v133 = 0;
  }
  if (!v7)
  {
LABEL_64:
    v33 = 0;
    v34 = 0;
    goto LABEL_65;
  }
LABEL_57:
  v29 = 0;
  v30 = 0;
  v31 = v138 + 24;
  v32 = v10;
  do
  {
    if (*v31 == -1)
    {
      v33 = *((_QWORD *)v31 - 2) + v30;
      v29 = v30;
    }
    else
    {
      v33 = v30;
      v30 = v29;
    }
    v31 += 8;
    v34 = v30;
    v30 = v33;
    --v32;
  }
  while (v32);
LABEL_65:
  v35 = flsl(v34);
  v36 = v35;
  v134[0] = 0;
  v134[2] = 0;
  HIBYTE(v134[0]) = v35;
  v134[1] = v7;
  if (v3)
  {
    v37 = *((_QWORD *)v3 + 5);
    v38 = flsl(v7 - 1);
    v39 = *((unsigned int *)v3 + 2);
    if ((v3[6] & 1) == 0)
    {
      v39 += (v39 + 3) >> 2;
      if (v39 != 3 * ((v39 * (unsigned __int128)0x5555555555555556uLL) >> 64))
        LODWORD(v39) = 3 * ((v39 * (unsigned __int128)0x5555555555555556uLL) >> 64) + 3;
    }
    v40 = ((v37 + 7) & 0xFFFFFFFFFFFFFFF8) + 8 * (((unint64_t)v39 * v38 + 63) >> 6);
    v41 = (char *)v134 + (((v7 * (unint64_t)v36 + 63) >> 3) & 0x3FFFFFFFF8);
  }
  else
  {
    v40 = ((v7 * (unint64_t)v35 + 63) >> 3) & 0x3FFFFFFFF8;
    v41 = (char *)v134;
  }
  v42 = &v41[v40 + 24] - (char *)v134 + v33;
  v43 = (char *)malloc_type_calloc(1uLL, v42, 0xCDBD14A0uLL);
  v6 = v43;
  if (v43)
  {
    *(_DWORD *)v43 = 1297044051;
    v43[4] = 1;
    v43[6] = v133;
    v43[7] = v36;
    *((_DWORD *)v43 + 2) = v7;
    *((_WORD *)v43 + 6) = v14 & 0x3FF;
    *((_QWORD *)v43 + 2) = v42;
    if (v133
      && ((v44 = v43 + 24, v6 == (const char *)-24)
       || (memcpy(v44, v3, *((_QWORD *)v3 + 5)), *((_BYTE *)v6 + 29) = 1, v6[6]))
      && v6 != (const char *)-24)
    {
      v125 = (unint64_t)&v6[((*((_QWORD *)v6 + 8) + 7) & 0xFFFFFFFFFFFFFFF8) + 24];
    }
    else
    {
      v125 = 0;
    }
    v45 = flsl(*((unsigned int *)v6 + 2) - 1);
    v46 = v6 + 24;
    v131 = v36;
    if (!v6[6] || v6 == (const char *)-24)
    {
      v58 = 0;
      LODWORD(v52) = *((_DWORD *)v6 + 2);
      v53 = *((unsigned __int8 *)v6 + 7);
      v51 = v6 + 24;
      if (!v7)
        goto LABEL_175;
    }
    else
    {
      v129 = v45;
      v47 = (*((_QWORD *)v6 + 8) + 7) & 0xFFFFFFFFFFFFFFF8;
      v48 = flsl(*((unsigned int *)v6 + 2) - 1);
      v49 = *((unsigned int *)v6 + 8);
      if ((v6[30] & 1) == 0)
      {
        v49 += (v49 + 3) >> 2;
        if (v49 != 3 * ((v49 * (unsigned __int128)0x5555555555555556uLL) >> 64))
          LODWORD(v49) = 3 * ((v49 * (unsigned __int128)0x5555555555555556uLL) >> 64) + 3;
      }
      v50 = v47 + 8 * (((unint64_t)v49 * v48 + 63) >> 6);
      v51 = &v46[v50];
      v52 = *((unsigned int *)v6 + 2);
      v53 = *((unsigned __int8 *)v6 + 7);
      if (v6[6])
      {
        v54 = &v46[v50];
        v55 = (*((_QWORD *)v6 + 8) + 7) & 0xFFFFFFFFFFFFFFF8;
        v56 = flsl(v52 - 1);
        v57 = *((unsigned int *)v6 + 8);
        if ((v6[30] & 1) == 0)
        {
          v57 += (v57 + 3) >> 2;
          if (v57 != 3 * ((v57 * (unsigned __int128)0x5555555555555556uLL) >> 64))
            LODWORD(v57) = 3 * ((v57 * (unsigned __int128)0x5555555555555556uLL) >> 64) + 3;
        }
        v58 = v55 + 8 * (((unint64_t)v57 * v56 + 63) >> 6);
        v51 = v54;
      }
      else
      {
        v58 = 0;
      }
      v45 = v129;
      if (!v7)
        goto LABEL_175;
    }
    v128 = (uint64_t)v3;
    v59 = 0;
    v60 = 0;
    v61 = 0;
    v62 = (char *)&v46[v58 + (((v52 * (unint64_t)v53 + 63) >> 3) & 0x3FFFFFFFF8)];
    v63 = v131;
    v64 = v131 != 0;
    if (v51)
      v64 = 0;
    if (v45 == 64)
      v65 = -1;
    else
      v65 = ~(-1 << v45);
    if (v131 == 64)
      v66 = -1;
    else
      v66 = ~(-1 << v131);
    v130 = v62;
    v132 = ~v66;
    v67 = v63 > 0x40 || v64;
    v127 = v45;
    if (v125)
      v68 = 1;
    else
      v68 = v45 == 0;
    v123 = ~v65;
    v124 = v65;
    v69 = !v68 || v45 > 0x40;
    v126 = v69;
    do
    {
      v70 = v138;
      v71 = *(_DWORD *)&v138[v59 + 24];
      if (v71 == -1)
      {
        if (v67)
          goto LABEL_181;
        v78 = (v60 & 0x3F) + v63;
        if (v78)
        {
          v79 = v62 - v130;
          v80 = (v60 >> 3) & 0xFFFFFFFFFFFFFF8;
          if (v78 > 0x40)
          {
            v102 = v80 + 8;
            v75 = __CFADD__(v102, v51);
            v103 = &v51[v102];
            if (v75 || (unint64_t)(v103 + 7) < 8)
LABEL_179:
              __assert_rtn("container_bitvector_set", "container_bitvector.h", 180, "((void)\"container_bitvector_set(): index too large for array\", 0)");
            v104 = v79 & v66;
            v105 = __ROR8__(v104, v78);
            if (((v78 - 64) & 0xFFFFFFFFFFFFFFBFLL) != 0)
              v104 = v105;
            v106.i64[0] = v66 >> v78;
            v106.i64[1] = v66 << -(char)v78;
            *(int8x16_t *)(v103 - 8) = vbslq_s8(v106, (int8x16_t)vdupq_n_s64(v104), *(int8x16_t *)(v103 - 8));
          }
          else
          {
            v75 = __CFADD__(v80, v51);
            v81 = (char *)&v51[v80];
            if (v75 || (unint64_t)(v81 + 7) < 8)
LABEL_178:
              __assert_rtn("container_bitvector_set", "container_bitvector.h", 165, "((void)\"container_bitvector_set(): index too large for array\", 0)");
            v82 = *(_QWORD *)v81;
            v83 = __ROR8__(*(_QWORD *)v81, -(char)v78);
            if (((64 - v78) & 0xFFFFFFFFFFFFFFBFLL) != 0)
              v82 = v83;
            v84 = v82 & v132 | v79 & v66;
            v85 = __ROR8__(v84, v78);
            if ((v78 & 0x1BF) != 0)
              v86 = v85;
            else
              v86 = v84;
            *(_QWORD *)v81 = v86;
          }
        }
        v107 = v51;
        memcpy(v62, *(const void **)&v70[v59], *(_QWORD *)&v70[v59 + 8]);
        v62 += *(_QWORD *)&v138[v59 + 8];
        if (!v133)
          goto LABEL_166;
        v108 = container_perfect_hash_index_of(v128, *(_QWORD *)&v138[v59 + 16]);
        if ((v108 & 0x8000000000000000) != 0)
        {
          _os_crash();
          __break(1u);
LABEL_185:
          __assert_rtn("container_bitvector_set", "container_bitvector.h", 144, "((void)\"container_bitvector_set(): index too large for element width\", 0)");
        }
        if (v126)
LABEL_181:
          __assert_rtn("container_bitvector_set", "container_bitvector.h", 139, "((void)\"container_bitvector_set(): bad argument\", 0)");
        if (!is_mul_ok(v108, v127))
          goto LABEL_185;
        v109 = ((v108 * v127) & 0x3F) + v127;
        if (v109)
        {
          v110 = ((v108 * v127) >> 3) & 0x1FFFFFFFFFFFFFF8;
          v51 = v107;
          if (v109 > 0x40)
          {
            v117 = v110 + 8;
            v75 = __CFADD__(v117, v125);
            v118 = v117 + v125;
            if (v75 || v118 + 7 < 8)
              goto LABEL_179;
            v119 = __ROR8__(v124 & v61, v109);
            if (((v109 - 64) & 0xFFFFFFFFFFFFFFBFLL) != 0)
              v120 = v119;
            else
              v120 = v124 & v61;
            v121.i64[0] = v124 >> v109;
            v121.i64[1] = v124 << -(char)v109;
            *(int8x16_t *)(v118 - 8) = vbslq_s8(v121, (int8x16_t)vdupq_n_s64(v120), *(int8x16_t *)(v118 - 8));
          }
          else
          {
            v75 = __CFADD__(v110, v125);
            v111 = (unint64_t *)(v110 + v125);
            if (v75 || (unint64_t)v111 + 7 < 8)
              goto LABEL_178;
            v112 = *v111;
            v113 = __ROR8__(*v111, -(char)v109);
            if (((64 - v109) & 0xFFFFFFFFFFFFFFBFLL) != 0)
              v112 = v113;
            v114 = v112 & v123 | v124 & v61;
            v115 = __ROR8__(v114, v109);
            if ((v109 & 0xFFFFFFFFFFFFFFBFLL) != 0)
              v116 = v115;
            else
              v116 = v114;
            *v111 = v116;
          }
        }
        else
        {
LABEL_166:
          v51 = v107;
        }
      }
      else
      {
        if (v67)
          __assert_rtn("container_bitvector_get", "container_bitvector.h", 80, "((void)\"container_bitvector_get(): bad argument\", 0)");
        v72 = v71 * (unint64_t)v63;
        v73 = (v72 & 0x3F) + v63;
        if (v73)
        {
          v74 = (v72 >> 3) & 0x1FFFFFFFF8;
          if (v73 > 0x40)
          {
            v87 = v74 + 8;
            v75 = __CFADD__(v87, v51);
            v88 = &v51[v87];
            if (v75 || (unint64_t)(v88 + 7) < 8)
              __assert_rtn("container_bitvector_get", "container_bitvector.h", 113, "((void)\"container_bitvector_get(): index too large for array\", 0)");
            v77 = (*(_QWORD *)v88 >> -(char)v73) | (*((_QWORD *)v88 - 1) << v73);
          }
          else
          {
            v75 = __CFADD__(v74, v51);
            v76 = &v51[v74];
            if (v75 || (unint64_t)(v76 + 7) < 8)
              __assert_rtn("container_bitvector_get", "container_bitvector.h", 104, "((void)\"container_bitvector_get(): index too large for array\", 0)");
            v77 = *(_QWORD *)v76 >> -(char)v73;
          }
        }
        else
        {
          v77 = 0;
        }
        v89 = (v60 & 0x3F) + v63;
        if (v89)
        {
          v90 = v77 & v66;
          v91 = (v60 >> 3) & 0xFFFFFFFFFFFFFF8;
          if (v89 > 0x40)
          {
            v98 = v91 + 8;
            v75 = __CFADD__(v98, v51);
            v99 = &v51[v98];
            if (v75 || (unint64_t)(v99 + 7) < 8)
              goto LABEL_179;
            v100 = __ROR8__(v90, v89);
            if (((v89 - 64) & 0xFFFFFFFFFFFFFFBFLL) != 0)
              v90 = v100;
            v101.i64[0] = v66 >> v89;
            v101.i64[1] = v66 << -(char)v89;
            *(int8x16_t *)(v99 - 8) = vbslq_s8(v101, (int8x16_t)vdupq_n_s64(v90), *(int8x16_t *)(v99 - 8));
          }
          else
          {
            v75 = __CFADD__(v91, v51);
            v92 = (char *)&v51[v91];
            if (v75 || (unint64_t)(v92 + 7) < 8)
              goto LABEL_178;
            v93 = *(_QWORD *)v92;
            v94 = __ROR8__(*(_QWORD *)v92, -(char)v89);
            if (((64 - v89) & 0xFFFFFFFFFFFFFFBFLL) != 0)
              v93 = v94;
            v95 = v93 & v132 | v90;
            v96 = __ROR8__(v95, v89);
            if ((v89 & 0x1BF) != 0)
              v97 = v96;
            else
              v97 = v95;
            *(_QWORD *)v92 = v97;
          }
        }
      }
      ++v61;
      v60 += v63;
      v59 += 32;
    }
    while (v10 != v61);
    v3 = (char *)v128;
  }
LABEL_175:
  container_perfect_hash_destroy(v3);
  if (v138)
  {
    free(v138);
    memset_s(&v138, 8uLL, 0, 8uLL);
  }
  return v6;
}

uint64_t container_perfect_hash_index_of(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
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
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  BOOL v36;
  int v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  BOOL v42;
  _QWORD *v43;
  unint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  unint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;

  v2 = *(_QWORD *)(a1 + 16);
  if ((*(_BYTE *)(a1 + 6) & 2) != 0)
  {
    v6 = ((a2 - 0x2152411021524111) ^ 0xE6ADBEEFDEADBEEFLL) + __ROR8__(a2 - 0x2152411021524111, 49);
    v7 = __ROR8__(v6, 12);
    v8 = (v2 ^ v6) + v7;
    v9 = (v8 ^ v2) + __ROR8__(v8, 38);
    v10 = (v9 ^ __ROR8__(a2 - 0x2152411021524111, 49)) + __ROR8__(v9, 13);
    v11 = (v10 ^ v7) + __ROR8__(v10, 36);
    v12 = (v11 ^ __ROR8__(v8, 38)) + __ROR8__(v11, 55);
    v13 = (v12 ^ __ROR8__(v9, 13)) + __ROR8__(v12, 17);
    v14 = (v13 ^ __ROR8__(v10, 36)) + __ROR8__(v13, 10);
    v15 = (v14 ^ __ROR8__(v11, 55)) + __ROR8__(v14, 32);
    v3 = __ROR8__((v15 ^ __ROR8__(v12, 17)) + __ROR8__(v15, 39), 1);
    v16 = *(_QWORD *)(a1 + 24);
    v17 = *(_QWORD *)(a1 + 32);
    v18 = (v16 ^ v6) + v7;
    v19 = (v18 ^ v16) + __ROR8__(v18, 38);
    v20 = (v19 ^ __ROR8__(a2 - 0x2152411021524111, 49)) + __ROR8__(v19, 13);
    v21 = (v20 ^ v7) + __ROR8__(v20, 36);
    v22 = (v21 ^ __ROR8__(v18, 38)) + __ROR8__(v21, 55);
    v23 = (v22 ^ __ROR8__(v19, 13)) + __ROR8__(v22, 17);
    v24 = (v23 ^ __ROR8__(v20, 36)) + __ROR8__(v23, 10);
    v25 = (v24 ^ __ROR8__(v21, 55)) + __ROR8__(v24, 32);
    v4 = __ROR8__((v25 ^ __ROR8__(v22, 17)) + __ROR8__(v25, 39), 1);
    v26 = (v17 ^ v6) + v7;
    v27 = (v26 ^ v17) + __ROR8__(v26, 38);
    v28 = (v27 ^ __ROR8__(a2 - 0x2152411021524111, 49)) + __ROR8__(v27, 13);
    v29 = (v28 ^ __ROR8__(v6, 12)) + __ROR8__(v28, 36);
    v30 = (v29 ^ __ROR8__(v26, 38)) + __ROR8__(v29, 55);
    v31 = (v30 ^ __ROR8__(v27, 13)) + __ROR8__(v30, 17);
    v32 = (v31 ^ __ROR8__(v28, 36)) + __ROR8__(v31, 10);
    v33 = (v32 ^ __ROR8__(v29, 55)) + __ROR8__(v32, 32);
    v5 = __ROR8__((v33 ^ __ROR8__(v30, 17)) + __ROR8__(v33, 39), 1);
  }
  else
  {
    v3 = v2 ^ a2;
    v4 = *(_QWORD *)(a1 + 24) ^ a2;
    v5 = *(_QWORD *)(a1 + 32) ^ a2;
  }
  v34 = *(unsigned int *)(a1 + 8) + (((unint64_t)*(unsigned int *)(a1 + 8) + 3) >> 2);
  v35 = 3 * ((v34 * (unsigned __int128)0x5555555555555556uLL) >> 64);
  v36 = v34 == v35;
  v37 = v35 + 3;
  if (!v36)
    LODWORD(v34) = v37;
  v38 = v34 / 3uLL;
  v39 = v3 % v38;
  v40 = a1 + 48;
  v41 = (v39 >> 2) & 0x1FFFFFF8;
  v42 = __CFADD__(v41, a1 + 48);
  v43 = (_QWORD *)(v41 + a1 + 48);
  if (v42)
    goto LABEL_24;
  if ((unint64_t)v43 + 7 < 8)
    goto LABEL_24;
  v44 = v4 % (v34 / 3uLL) + v34 / 3uLL;
  v45 = (v44 >> 2) & 0x3FFFFFF8;
  v42 = __CFADD__(v45, v40);
  v46 = (_QWORD *)(v45 + v40);
  if (v42
    || (unint64_t)v46 + 7 < 8
    || (v47 = v5 % v38 + 2 * v38,
        v48 = (v47 >> 2) & 0x7FFFFFF8,
        v42 = __CFADD__(v48, v40),
        v49 = (_QWORD *)(v48 + v40),
        v42)
    || (unint64_t)v49 + 7 < 8)
  {
LABEL_24:
    __assert_rtn("container_bitvector_get", "container_bitvector.h", 104, "((void)\"container_bitvector_get(): index too large for array\", 0)");
  }
  v50 = (*v43 >> (~(2 * v39) & 0x3E)) & 3;
  v51 = (*v46 >> (~(2 * v44) & 0x3E)) & 3;
  v52 = (*v49 >> (~(2 * v47) & 0x3E)) & 3;
  v53 = v51 + v50 + v52;
  if (v53 > 8)
    return -1;
  if (((1 << v53) & 0x49) != 0)
  {
    if (v50 == 3)
      return -1;
  }
  else
  {
    if (((1 << v53) & 0x92) != 0)
    {
      LODWORD(v39) = v44;
      if (v51 != 3)
        goto LABEL_20;
      return -1;
    }
    LODWORD(v39) = v47;
    if (v52 == 3)
      return -1;
  }
LABEL_20:
  if (v34 <= v39)
  {
    _os_crash();
    __break(1u);
    JUMPOUT(0x1CF7DDD50);
  }
  if ((*(_BYTE *)(a1 + 6) & 1) != 0)
    __asm { BR              X0 }
  return v39;
}

void sub_1CF7DDD80()
{
  _os_crash();
  __break(1u);
  JUMPOUT(0x1CF7DDD90);
}

_BYTE *container_perfect_hash_destroy(_BYTE *result)
{
  _BYTE *__s;

  __s = result;
  if (result)
  {
    if (!result[5])
    {
      free(result);
      return (_BYTE *)memset_s(&__s, 8uLL, 0, 8uLL);
    }
  }
  return result;
}

void *container_perfect_hash_create(uint64_t a1, unsigned int a2, unint64_t a3)
{
  unint64_t v3;
  size_t v5;
  unint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v9;
  unint64_t v10;
  unint64_t v12;
  BOOL v13;
  uint64_t v14;
  unint64_t v16;
  unsigned int v17;
  int v18;
  unsigned int v19;
  int v20;
  size_t v21;
  _BYTE *v22;
  char v23;
  unsigned int *v24;
  _BYTE *v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint32_t v32;
  uint64_t v33;
  size_t v34;
  unint64_t v35;
  BOOL v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unsigned int v72;
  unsigned int v73;
  char v74;
  char *v75;
  uint64_t v76;
  int v77;
  uint64_t v78;
  uint64_t v79;
  unsigned int *v80;
  char *v81;
  __int128 v82;
  void *result;
  _QWORD *v84;
  _BYTE *v85;
  _QWORD *v86;
  unsigned int *v87;
  unint64_t v88;
  uint64_t v89;
  unint64_t *v90;
  unint64_t v91;
  uint64_t v92;
  unint64_t *v93;
  unint64_t v94;
  uint64_t v95;
  unint64_t *v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;
  unint64_t v102;
  char v103;
  uint64_t v104;
  unint64_t v105;
  unint64_t v106;
  unint64_t v107;
  uint64_t v108;
  unint64_t v109;
  unint64_t v110;
  unint64_t v111;
  uint64_t v112;
  unint64_t v113;
  unint64_t v114;
  unint64_t v115;
  unint64_t v116;
  uint64_t v117;
  unsigned int v118;
  unint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  unint64_t v123;
  unint64_t v124;
  unsigned int v125;
  char *v126;
  uint64_t v127;
  _BOOL4 v128;
  unint64_t v129;
  _QWORD *v130;
  __int32 v131;
  uint8x8_t v132;
  __int32 v133;
  uint8x8_t v134;
  __int32 v135;
  uint8x8_t v136;
  __int32 v137;
  uint8x8_t v138;
  __int32 v139;
  uint8x8_t v140;
  __int32 v141;
  uint8x8_t v142;
  __int32 v143;
  uint8x8_t v144;
  uint8x8_t v145;
  unint64_t v146;
  unint64_t v147;
  uint64_t v148;
  BOOL v149;
  char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  char *v157;
  unint64_t v158;
  unint64_t v159;
  int8x16_t v160;
  unsigned int v161;
  size_t v162;
  _BYTE *v163;
  _QWORD __compar[8];
  _QWORD v165[3];
  int v166;
  _QWORD v167[3];
  int v168;
  uint64_t v169;
  uint64_t *v170;
  uint64_t v171;
  char v172;
  _BYTE *v173;
  unsigned int *__s;
  void *v175[2];

  v3 = 4;
  if (a3 < 4)
    v3 = a3;
  if (!a3)
    v3 = 3;
  if (a2 < 3)
    return 0;
  v5 = a2;
  v6 = (((unint64_t)a2 + 3) >> 2) + a2;
  v7 = 3 * ((v6 * (unsigned __int128)0x5555555555555556uLL) >> 64);
  v8 = v6 == v7;
  v9 = v7 + 3;
  if (v8)
    v10 = (((unint64_t)a2 + 3) >> 2) + a2;
  else
    LODWORD(v10) = v9;
  if (v10 < a2)
    return 0;
  v12 = (2 * (unint64_t)v10 + 63) >> 6;
  v13 = v12 < 3 && v3 > 3;
  v14 = 3;
  if (!v13)
    v14 = v3;
  if (v12 < 2 && v3 > 2)
    v16 = 2;
  else
    v16 = v14;
  v17 = (v12 - 1) >> (v16 - 2);
  if (v16 <= 1)
    v17 = 0;
  v18 = 1;
  if ((_DWORD)v10 != a2)
  {
    v19 = v17;
    v20 = fls(v10 - a2);
    v17 = v19;
    v18 = v20;
  }
  v161 = v17;
  v21 = 8 * v12 + 48 + ((((unint64_t)(v18 * v17) + 63) >> 3) & 0x3FFFFFF8);
  v175[0] = malloc_type_calloc(1uLL, v21, 0x908C43D5uLL);
  *(_BYTE *)v175[0] = 80;
  *((_BYTE *)v175[0] + 1) = 72;
  *((_BYTE *)v175[0] + 2) = 115;
  *((_BYTE *)v175[0] + 3) = 104;
  v22 = v175[0];
  *((_BYTE *)v175[0] + 4) = 1;
  v22[6] = (v16 > 1) | 2;
  v23 = (32 * v16 + 64) & 0x60;
  if (v16 <= 1)
    v23 = 0;
  v22[7] = v23 & 0xE0 | v18 & 0x1F;
  *((_DWORD *)v22 + 2) = a2;
  *((_QWORD *)v22 + 5) = v21;
  v24 = (unsigned int *)malloc_type_calloc(v5, 0x10uLL, 0x1000040451B5BE8uLL);
  __s = v24;
  v25 = malloc_type_calloc(v10, 1uLL, 0x100004077774924uLL);
  v173 = v25;
  if (!v24 || !v25)
  {
    if (v24)
    {
      free(v24);
      memset_s(&__s, 8uLL, 0, 8uLL);
      v25 = v173;
    }
    if (v25)
    {
      free(v25);
      memset_s(&v173, 8uLL, 0, 8uLL);
    }
    result = v175[0];
    if (!v175[0])
      return result;
    free(v175[0]);
    memset_s(v175, 8uLL, 0, 8uLL);
    return 0;
  }
  v26 = v10 / 3uLL;
  do
  {
LABEL_30:
    bzero(v25, v10);
    v27 = arc4random();
    v28 = arc4random() | (unint64_t)(v27 << 32);
    v29 = arc4random();
    v30 = arc4random() | (unint64_t)(v29 << 32);
    v31 = arc4random();
    v32 = arc4random();
    v33 = 0;
    v34 = 0;
    v35 = v32 | (unint64_t)(v31 << 32);
    v36 = 1;
    while (1)
    {
      v37 = *(_QWORD *)(a1 + 8 * v34);
      if ((*((_BYTE *)v175[0] + 6) & 2) != 0)
      {
        v39 = ((v37 - 0x2152411021524111) ^ 0xE6ADBEEFDEADBEEFLL) + __ROR8__(v37 - 0x2152411021524111, 49);
        v40 = (v39 ^ v28) + __ROR8__(v39, 12);
        v41 = (v40 ^ v28) + __ROR8__(v40, 38);
        v42 = (v41 ^ __ROR8__(v37 - 0x2152411021524111, 49)) + __ROR8__(v41, 13);
        v43 = (v42 ^ __ROR8__(v39, 12)) + __ROR8__(v42, 36);
        v44 = (v43 ^ __ROR8__(v40, 38)) + __ROR8__(v43, 55);
        v45 = (v44 ^ __ROR8__(v41, 13)) + __ROR8__(v44, 17);
        v46 = (v45 ^ __ROR8__(v42, 36)) + __ROR8__(v45, 10);
        v47 = (v46 ^ __ROR8__(v43, 55)) + __ROR8__(v46, 32);
        v38 = __ROR8__((v47 ^ __ROR8__(v44, 17)) + __ROR8__(v47, 39), 1);
      }
      else
      {
        v38 = v37 ^ v28;
      }
      v48 = v38 % v26;
      __s[v33 + 1] = v48;
      ++v173[v48];
      v25 = v173;
      if (v173[v48] == 255)
        break;
      if ((*((_BYTE *)v175[0] + 6) & 2) != 0)
      {
        v50 = ((v37 - 0x2152411021524111) ^ 0xE6ADBEEFDEADBEEFLL) + __ROR8__(v37 - 0x2152411021524111, 49);
        v51 = (v50 ^ v30) + __ROR8__(v50, 12);
        v52 = (v51 ^ v30) + __ROR8__(v51, 38);
        v53 = (v52 ^ __ROR8__(v37 - 0x2152411021524111, 49)) + __ROR8__(v52, 13);
        v54 = (v53 ^ __ROR8__(v50, 12)) + __ROR8__(v53, 36);
        v55 = (v54 ^ __ROR8__(v51, 38)) + __ROR8__(v54, 55);
        v56 = (v55 ^ __ROR8__(v52, 13)) + __ROR8__(v55, 17);
        v57 = (v56 ^ __ROR8__(v53, 36)) + __ROR8__(v56, 10);
        v58 = (v57 ^ __ROR8__(v54, 55)) + __ROR8__(v57, 32);
        v49 = __ROR8__((v58 ^ __ROR8__(v55, 17)) + __ROR8__(v58, 39), 1);
      }
      else
      {
        v49 = v37 ^ v30;
      }
      v59 = v49 % v26 + v26;
      __s[v33 + 2] = v59;
      ++v25[v59];
      v25 = v173;
      if (v173[v59] == 255)
        break;
      if ((*((_BYTE *)v175[0] + 6) & 2) != 0)
      {
        v61 = v37 - 0x2152411021524111;
        v62 = (v61 ^ 0xE6ADBEEFDEADBEEFLL) + __ROR8__(v61, 49);
        v63 = (v62 ^ v35) + __ROR8__(v62, 12);
        v64 = (v63 ^ v35) + __ROR8__(v63, 38);
        v65 = (v64 ^ __ROR8__(v61, 49)) + __ROR8__(v64, 13);
        v66 = (v65 ^ __ROR8__(v62, 12)) + __ROR8__(v65, 36);
        v67 = (v66 ^ __ROR8__(v63, 38)) + __ROR8__(v66, 55);
        v68 = (v67 ^ __ROR8__(v64, 13)) + __ROR8__(v67, 17);
        v69 = (v68 ^ __ROR8__(v65, 36)) + __ROR8__(v68, 10);
        v70 = (v69 ^ __ROR8__(v66, 55)) + __ROR8__(v69, 32);
        v60 = __ROR8__((v70 ^ __ROR8__(v67, 17)) + __ROR8__(v70, 39), 1);
      }
      else
      {
        v60 = v37 ^ v35;
      }
      v71 = v60 % v26 + 2 * v26;
      __s[v33 + 3] = v71;
      ++v25[v71];
      v25 = v173;
      if (v173[v71] == 255)
        break;
      __s[v33] = v34++;
      v36 = v34 < v5;
      v33 += 4;
      if (v5 == v34)
        goto LABEL_46;
    }
  }
  while (v36);
LABEL_46:
  v72 = v5;
  do
  {
    if (!v72)
      goto LABEL_68;
    v73 = 0;
    v74 = 0;
    do
    {
      v75 = (char *)&__s[4 * v73];
      v77 = *(_DWORD *)v75;
      v76 = *((unsigned int *)v75 + 1);
      v79 = *((unsigned int *)v75 + 2);
      v78 = *((unsigned int *)v75 + 3);
      if (v173[v76] == 1 || v173[v79] == 1 || v173[v78] == 1)
      {
        v173[v76] = v173[v76] - 1;
        --v173[v79];
        --v173[v78];
        if (v73 != --v72)
        {
          v80 = __s;
          v81 = (char *)&__s[4 * v72];
          v82 = *(_OWORD *)v81;
          *(_DWORD *)v81 = v77;
          *((_DWORD *)v81 + 1) = v76;
          *((_DWORD *)v81 + 2) = v79;
          *((_DWORD *)v81 + 3) = v78;
          *(_OWORD *)&v80[4 * v73] = v82;
        }
        --v73;
        v74 = 1;
      }
      ++v73;
    }
    while (v73 < v72);
  }
  while ((v74 & 1) != 0);
  if (v72)
  {
    v169 = 0;
    v170 = &v169;
    v171 = 0x2000000000;
    v172 = 0;
    v167[0] = 0;
    v167[1] = v167;
    v167[2] = 0x2000000000;
    v168 = 0;
    v165[0] = 0;
    v165[1] = v165;
    v165[2] = 0x2000000000;
    v166 = 0;
    __compar[0] = MEMORY[0x1E0C87450];
    __compar[1] = 0x40000000;
    __compar[2] = __container_perfect_hash_create_block_invoke;
    __compar[3] = &unk_1E8CB3068;
    __compar[4] = &v169;
    __compar[5] = v167;
    __compar[6] = v165;
    __compar[7] = a1;
    qsort_b(__s, v72, 0x10uLL, __compar);
    if (!*((_BYTE *)v170 + 24))
    {
      _Block_object_dispose(v165, 8);
      _Block_object_dispose(v167, 8);
      _Block_object_dispose(&v169, 8);
      v25 = v173;
      goto LABEL_30;
    }
    goto LABEL_153;
  }
LABEL_68:
  v84 = v175[0];
  *((_QWORD *)v175[0] + 2) = v28;
  v84[3] = v30;
  v84[4] = v35;
  v85 = v173;
  v162 = (size_t)v84;
  v163 = v173;
  v86 = v84 + 6;
  memset(v84 + 6, 255, 8 * v12);
  v87 = __s + 3;
  do
  {
    v88 = *(v87 - 2);
    v89 = (v88 >> 2) & 0x3FFFFFF8;
    v90 = (_QWORD *)((char *)v86 + v89);
    if (__CFADD__(v89, v86)
      || (unint64_t)v90 + 7 < 8
      || (v91 = *(v87 - 1), v92 = (v91 >> 2) & 0x3FFFFFF8, v93 = (_QWORD *)((char *)v86 + v92), __CFADD__(v92, v86))
      || (unint64_t)v93 + 7 < 8
      || (v94 = *v87, v95 = (v94 >> 2) & 0x3FFFFFF8, v96 = (_QWORD *)((char *)v86 + v95), __CFADD__(v95, v86))
      || (unint64_t)v96 + 7 < 8)
    {
      __assert_rtn("container_bitvector_get", "container_bitvector.h", 104, "((void)\"container_bitvector_get(): index too large for array\", 0)");
    }
    v97 = 2 * (v88 & 0x1F);
    v98 = *v90 >> (62 - v97);
    v99 = 2 * (v91 & 0x1F);
    v100 = *v93 >> (62 - v99);
    v101 = 2 * (v94 & 0x1F);
    v102 = *v96 >> (62 - v101);
    v103 = (v100 & 3) + (v98 & 3) + (v102 & 3);
    if (v85[v88])
    {
      if (v85[v91])
      {
        if (v85[v94])
        {
          _os_crash();
          __break(1u);
LABEL_162:
          __assert_rtn("container_bitvector_set", "container_bitvector.h", 139, "((void)\"container_bitvector_set(): bad argument\", 0)");
        }
        v104 = (11 - v103) % 3u;
        v105 = v102 | (*v96 << (v101 + 2));
        if (v101 == 62)
          v105 = *v96;
        v106 = v105 & 0xFFFFFFFFFFFFFFFCLL | v104;
        if ((((_BYTE)v101 + 2) & 0x3E) != 0)
          v107 = (v106 >> (v101 + 2)) | (v106 << (62 - v101));
        else
          v107 = v106;
        *v96 = v107;
      }
      else
      {
        v112 = (10 - v103) % 3u;
        v113 = v100 | (*v93 << (v99 + 2));
        if (v99 == 62)
          v113 = *v93;
        v114 = v113 & 0xFFFFFFFFFFFFFFFCLL | v112;
        if ((((_BYTE)v99 + 2) & 0x3E) != 0)
          v115 = (v114 >> (v99 + 2)) | (v114 << (62 - v99));
        else
          v115 = v114;
        *v93 = v115;
      }
    }
    else
    {
      v108 = (9 - v103) % 3u;
      v109 = v98 | (*v90 << (v97 + 2));
      if (v97 == 62)
        v109 = *v90;
      v110 = v109 & 0xFFFFFFFFFFFFFFFCLL | v108;
      if ((((_BYTE)v97 + 2) & 0x3E) != 0)
        v111 = (v110 >> (v97 + 2)) | (v110 << (62 - v97));
      else
        v111 = v110;
      *v90 = v111;
    }
    v85[v88] = 1;
    v87 += 4;
    v85[v91] = 1;
    v85[v94] = 1;
    --v5;
  }
  while (v5);
  free(v85);
  memset_s(&v163, 8uLL, 0, 8uLL);
  if (__s)
  {
    free(__s);
    memset_s(&__s, 8uLL, 0, 8uLL);
  }
  result = v175[0];
  if ((*((_BYTE *)v175[0] + 6) & 1) != 0)
  {
    if ((_DWORD)v12)
    {
      v116 = 0;
      LODWORD(v117) = 0;
      v118 = 0;
      v119 = *((unsigned __int8 *)v175[0] + 7);
      v120 = (v119 >> 5) & 3;
      v121 = 1 << v120;
      v122 = *((unsigned int *)v175[0] + 2);
      v123 = v122 + ((unint64_t)(v122 + 3) >> 2);
      if (v123 != 3 * ((v123 * (unsigned __int128)0x5555555555555556uLL) >> 64))
        LODWORD(v123) = 3 * ((v123 * (unsigned __int128)0x5555555555555556uLL) >> 64) + 3;
      v124 = (2 * (unint64_t)v123 + 63) >> 6;
      v125 = (v124 - 1) >> v120;
      v126 = (char *)v175[0] + 8 * v124 + 48;
      v127 = v119 & 0x1F;
      v128 = v127 != 0;
      if (v125)
        v128 = 0;
      v129 = ~(-1 << v127);
      if (!v125)
        v126 = 0;
      v130 = (_QWORD *)(v162 + 56);
      do
      {
        v131 = 0;
        if ((_DWORD)v120 && v116 + 1 < v12)
        {
          v132 = (uint8x8_t)vcnt_s8((int8x8_t)(*v130 & (*v130 >> 1) & 0x5555555555555555));
          v132.i16[0] = vaddlv_u8(v132);
          v131 = v132.i32[0];
        }
        v133 = 0;
        if (v120 >= 2 && v116 + 2 < v12)
        {
          v134 = (uint8x8_t)vcnt_s8((int8x8_t)(v130[1] & (v130[1] >> 1) & 0x5555555555555555));
          v134.i16[0] = vaddlv_u8(v134);
          v133 = v134.i32[0];
        }
        v135 = 0;
        if (v120 >= 2 && v116 + 3 < v12)
        {
          v136 = (uint8x8_t)vcnt_s8((int8x8_t)(v130[2] & (v130[2] >> 1) & 0x5555555555555555));
          v136.i16[0] = vaddlv_u8(v136);
          v135 = v136.i32[0];
        }
        v137 = 0;
        if ((_DWORD)v120 == 3 && v116 + 4 < v12)
        {
          v138 = (uint8x8_t)vcnt_s8((int8x8_t)(v130[3] & (v130[3] >> 1) & 0x5555555555555555));
          v138.i16[0] = vaddlv_u8(v138);
          v137 = v138.i32[0];
        }
        v139 = 0;
        if ((_DWORD)v120 == 3 && v116 + 5 < v12)
        {
          v140 = (uint8x8_t)vcnt_s8((int8x8_t)(v130[4] & (v130[4] >> 1) & 0x5555555555555555));
          v140.i16[0] = vaddlv_u8(v140);
          v139 = v140.i32[0];
        }
        v141 = 0;
        if ((_DWORD)v120 == 3 && v116 + 6 < v12)
        {
          v142 = (uint8x8_t)vcnt_s8((int8x8_t)(v130[5] & (v130[5] >> 1) & 0x5555555555555555));
          v142.i16[0] = vaddlv_u8(v142);
          v141 = v142.i32[0];
        }
        v143 = 0;
        if ((_DWORD)v120 == 3 && v116 + 7 < v12)
        {
          v144 = (uint8x8_t)vcnt_s8((int8x8_t)(v130[6] & (v130[6] >> 1) & 0x5555555555555555));
          v144.i16[0] = vaddlv_u8(v144);
          v143 = v144.i32[0];
        }
        v145 = (uint8x8_t)vcnt_s8((int8x8_t)(*(v130 - 1) & (*(v130 - 1) >> 1) & 0x5555555555555555));
        v145.i16[0] = vaddlv_u8(v145);
        v117 = (v117 + v145.i32[0] + v131 + v133 + v135 + v137 + v139 + v141 + v143);
        if (v118 < v161)
        {
          if (v128)
            goto LABEL_162;
          v146 = v127 * (unint64_t)v118;
          v147 = (v146 & 0x3F) + v127;
          if (v147)
          {
            v148 = (v146 >> 3) & 0x3FFFFFFF8;
            if (v147 > 0x40)
            {
              v156 = v148 + 8;
              v149 = __CFADD__(v156, v126);
              v157 = &v126[v156];
              if (v149 || (unint64_t)(v157 + 7) < 8)
                __assert_rtn("container_bitvector_set", "container_bitvector.h", 180, "((void)\"container_bitvector_set(): index too large for array\", 0)");
              v158 = __ROR8__(v117 & v129, v147);
              if (((v147 - 64) & 0xFFFFFFFFFFFFFFBFLL) != 0)
                v159 = v158;
              else
                v159 = v117 & v129;
              v160.i64[0] = v129 >> v147;
              v160.i64[1] = v129 << -(char)v147;
              *(int8x16_t *)(v157 - 8) = vbslq_s8(v160, (int8x16_t)vdupq_n_s64(v159), *(int8x16_t *)(v157 - 8));
            }
            else
            {
              v149 = __CFADD__(v148, v126);
              v150 = &v126[v148];
              if (v149 || (unint64_t)(v150 + 7) < 8)
                __assert_rtn("container_bitvector_set", "container_bitvector.h", 165, "((void)\"container_bitvector_set(): index too large for array\", 0)");
              v151 = *(_QWORD *)v150;
              v152 = __ROR8__(*(_QWORD *)v150, -(char)v147);
              if (((64 - v147) & 0xFFFFFFFFFFFFFFBFLL) != 0)
                v151 = v152;
              v153 = v151 & (-1 << v127) | v117 & v129;
              v154 = __ROR8__(v153, v147);
              if ((v147 & 0x3F) != 0)
                v155 = v154;
              else
                v155 = v153;
              *(_QWORD *)v150 = v155;
            }
          }
          ++v118;
        }
        v116 += v121;
        v130 += v121;
      }
      while (v116 < v12);
    }
    else
    {
      LODWORD(v117) = 0;
      LODWORD(v122) = *((_DWORD *)v175[0] + 2);
    }
    if ((_DWORD)v117 != 32 * (_DWORD)v12 - (_DWORD)v122)
    {
      _os_crash();
      __break(1u);
LABEL_153:
      if (__s)
      {
        free(__s);
        memset_s(&__s, 8uLL, 0, 8uLL);
      }
      if (v173)
      {
        free(v173);
        memset_s(&v173, 8uLL, 0, 8uLL);
      }
      if (v175[0])
      {
        free(v175[0]);
        memset_s(v175, 8uLL, 0, 8uLL);
      }
      _Block_object_dispose(v165, 8);
      _Block_object_dispose(v167, 8);
      _Block_object_dispose(&v169, 8);
      return 0;
    }
  }
  return result;
}

unint64_t container_frozenset_get_persona_unique_string_of_container_at_index(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  if (!a1)
    return 0;
  v2 = *(_DWORD *)(a1 + 8);
  if (v2 <= a2 || (*(_BYTE *)(a1 + 24 + 24 * a2 + 17) & 2) != 0)
    return 0;
  else
    return container_string_rom_string_at_index(a1 + 24 + 24 * v2, (6 * a2) | 1);
}

unint64_t container_object_get_user_managed_assets_relative_path(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  const void *bytes_ptr;

  v2 = *(_QWORD *)(a1 + 88);
  if (!v2)
    return *(_QWORD *)(a1 + 64);
  v3 = *(void **)(v2 + 120);
  if (!v3)
    return *(_QWORD *)(a1 + 64);
  bytes_ptr = xpc_data_get_bytes_ptr(v3);
  return container_frozenset_get_uma_relative_path_of_container_at_index((uint64_t)bytes_ptr, *(_DWORD *)(a1 + 96));
}

unint64_t container_frozenset_get_unique_path_component_of_container_at_index(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  if (!a1)
    return 0;
  v2 = *(_DWORD *)(a1 + 8);
  if (v2 <= a2 || (*(_BYTE *)(a1 + 24 + 24 * a2 + 17) & 4) != 0)
    return 0;
  else
    return container_string_rom_string_at_index(a1 + 24 + 24 * v2, 6 * a2 + 2);
}

unint64_t container_frozenset_get_uma_relative_path_of_container_at_index(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  if (!a1)
    return 0;
  v2 = *(_DWORD *)(a1 + 8);
  if (v2 <= a2 || (*(_BYTE *)(a1 + 24 + 24 * a2 + 17) & 0x10) != 0)
    return 0;
  else
    return container_string_rom_string_at_index(a1 + 24 + 24 * v2, 6 * a2 + 4);
}

uint64_t __container_perfect_hash_create_block_invoke(_QWORD *a1, unsigned int *a2, unsigned int *a3)
{
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t result;
  uint64_t v11;

  v3 = a2[1];
  v4 = a3[1];
  if (v3 < v4)
    return 0xFFFFFFFFLL;
  if (v3 > v4)
    return 1;
  v5 = a2[2];
  v6 = a3[2];
  if (v5 < v6)
    return 0xFFFFFFFFLL;
  if (v5 > v6)
    return 1;
  v7 = a2[3];
  v8 = a3[3];
  if (v7 < v8)
    return 0xFFFFFFFFLL;
  if (v7 > v8)
    return 1;
  v11 = *a2;
  if (*(_QWORD *)(a1[7] + 8 * v11) != *(_QWORD *)(a1[7] + 8 * *a3))
    return 0;
  result = 0;
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 1;
  *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v11;
  *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = *a3;
  return result;
}

_BYTE *container_frozenset_destroy(_BYTE *result)
{
  _BYTE *__s;

  __s = result;
  if (result)
  {
    if (!result[5])
    {
      free(result);
      return (_BYTE *)memset_s(&__s, 8uLL, 0, 8uLL);
    }
  }
  return result;
}

_BYTE *container_client_is_test_client(_BYTE *result)
{
  if (result)
    return (_BYTE *)(*result & 1);
  return result;
}

BOOL container_client_is_signed(_BOOL8 result)
{
  if (result)
    return *(_BYTE *)(result + 84) != 0;
  return result;
}

char *container_object_set_path(_QWORD *a1, const char *a2)
{
  void *v4;
  char **v5;
  void *v6;
  char *result;

  __container_object_separate_from_query(a1);
  v6 = (void *)a1[4];
  v5 = (char **)(a1 + 4);
  v4 = v6;
  if (v6)
  {
    free(v4);
    memset_s(v5, 8uLL, 0, 8uLL);
  }
  result = strndup(a2, 0x400uLL);
  *v5 = result;
  return result;
}

_QWORD *__container_object_separate_from_query(_QWORD *result)
{
  uint64_t v1;
  const unsigned __int8 *uuid;
  const char *identifier;
  const char *path;
  const char *unique_path_component;
  const char *persona_unique_string;
  uint64_t v7;
  void *v8;
  xpc_object_t dictionary;
  void *v10;
  const char *string;
  unsigned __int8 v12;
  unsigned __int8 v13;
  char *v14;
  char *v15;
  unsigned int uid;
  _DWORD *v17;

  if (!result[11])
    return result;
  v1 = (uint64_t)result;
  uuid = (const unsigned __int8 *)container_object_get_uuid((uint64_t)result);
  identifier = (const char *)container_object_get_identifier(v1);
  v17 = container_object_get_class(v1);
  uid = container_object_get_uid(v1);
  path = (const char *)container_object_get_path(v1);
  unique_path_component = (const char *)container_object_get_unique_path_component(v1);
  persona_unique_string = (const char *)container_object_get_persona_unique_string(v1);
  v7 = *(_QWORD *)(v1 + 88);
  if (v7 && (v8 = *(void **)(v7 + 136)) != 0)
  {
    dictionary = xpc_array_get_dictionary(v8, *(unsigned int *)(v1 + 96));
    v7 = *(_QWORD *)(v1 + 88);
    if (!v7)
      goto LABEL_9;
  }
  else
  {
    dictionary = *(xpc_object_t *)(v1 + 80);
    if (!v7)
    {
LABEL_9:
      string = *(const char **)(v1 + 48);
      goto LABEL_10;
    }
  }
  v10 = *(void **)(v7 + 128);
  if (!v10)
    goto LABEL_9;
  string = xpc_array_get_string(v10, *(unsigned int *)(v1 + 96));
LABEL_10:
  v12 = container_object_is_new(v1);
  v13 = container_object_is_transient(v1);
  uuid_copy((unsigned __int8 *)v1, uuid);
  *(_QWORD *)(v1 + 24) = strdup(identifier);
  if (path)
    v14 = strdup(path);
  else
    v14 = 0;
  *(_QWORD *)(v1 + 32) = v14;
  *(_QWORD *)(v1 + 56) = strdup(unique_path_component);
  if (persona_unique_string)
    v15 = strdup(persona_unique_string);
  else
    v15 = 0;
  *(_QWORD *)(v1 + 40) = v15;
  *(_QWORD *)(v1 + 16) = v17;
  *(_DWORD *)(v1 + 104) = uid;
  if (dictionary)
    result = xpc_retain(dictionary);
  else
    result = 0;
  *(_QWORD *)(v1 + 80) = result;
  if (!*(_QWORD *)(v1 + 48))
  {
    if (string)
      result = strndup(string, 0x800uLL);
    else
      result = 0;
    *(_QWORD *)(v1 + 48) = result;
  }
  *(_BYTE *)(v1 + 108) = v12;
  *(_BYTE *)(v1 + 109) = v13;
  *(_QWORD *)(v1 + 88) = 0;
  *(_DWORD *)(v1 + 96) = -1;
  return result;
}

uint64_t container_client_get_euid(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  if (a1)
    return *(unsigned int *)(a1 + 40);
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  v2 = qword_1ECD3F348;
  if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1CF7DA000, v2, OS_LOG_TYPE_FAULT, "NULL client when fetching euid", v3, 2u);
  }
  return geteuid();
}

void *container_audit_token_copy_codesign_hash(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  __int128 v3;
  _OWORD v5[2];

  v2 = *(unsigned int *)(a1 + 20);
  v3 = *(_OWORD *)(a1 + 16);
  v5[0] = *(_OWORD *)a1;
  v5[1] = v3;
  return container_codesign_copy_cdhash(v2, (uint64_t)v5, a2);
}

void *container_codesign_copy_cdhash(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v4;
  void *__s;

  v4 = malloc_type_calloc(0x14uLL, 1uLL, 0x100004077774924uLL);
  __s = v4;
  if (csops_audittoken())
  {
    if (v4)
    {
      free(v4);
      memset_s(&__s, 8uLL, 0, 8uLL);
      return 0;
    }
  }
  else if (a3)
  {
    *a3 = 20;
  }
  return v4;
}

void container_query_set_include_other_owners(uint64_t a1, char a2)
{
  NSObject *v3;
  NSObject *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C874D8];
  if (a1)
  {
    if (*(_QWORD *)(a1 + 120))
    {
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v3 = qword_1ECD3F350;
      if (os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_FAULT))
      {
        v6 = 136315138;
        v7 = "container_query_set_include_other_owners";
        _os_log_fault_impl(&dword_1CF7DA000, v3, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: query has already been executed", (uint8_t *)&v6, 0xCu);
      }
      _container_query_set_usage_error((uint64_t *)a1, 111);
    }
    else
    {
      _container_query_log_if_error(*(_QWORD *)a1, (uint64_t)"container_query_set_include_other_owners");
      *(_BYTE *)(a1 + 65) = a2;
      *(_QWORD *)(a1 + 16) |= 0x40uLL;
    }
  }
  else
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v4 = qword_1ECD3F350;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_FAULT))
    {
      v6 = 136315138;
      v7 = "container_query_set_include_other_owners";
      _os_log_fault_impl(&dword_1CF7DA000, v4, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: query parameter is NULL", (uint8_t *)&v6, 0xCu);
    }
  }
}

void container_query_set_uid(uint64_t a1, int a2)
{
  NSObject *v3;
  NSObject *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C874D8];
  if (a1)
  {
    if (*(_QWORD *)(a1 + 120))
    {
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v3 = qword_1ECD3F350;
      if (os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_FAULT))
      {
        v6 = 136315138;
        v7 = "container_query_set_uid";
        _os_log_fault_impl(&dword_1CF7DA000, v3, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: query has already been executed", (uint8_t *)&v6, 0xCu);
      }
      _container_query_set_usage_error((uint64_t *)a1, 111);
    }
    else
    {
      _container_query_log_if_error(*(_QWORD *)a1, (uint64_t)"container_query_set_uid");
      *(_DWORD *)(a1 + 48) = a2;
      *(_QWORD *)(a1 + 16) |= 8uLL;
    }
  }
  else
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v4 = qword_1ECD3F350;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_FAULT))
    {
      v6 = 136315138;
      v7 = "container_query_set_uid";
      _os_log_fault_impl(&dword_1CF7DA000, v4, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: query parameter is NULL", (uint8_t *)&v6, 0xCu);
    }
  }
}

void container_query_set_persona_unique_string(uint64_t *a1, const char *a2)
{
  NSObject *v3;
  uint64_t *v4;
  uint64_t v5;
  NSObject *v6;
  void *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C874D8];
  if (a1)
  {
    if (a1[15])
    {
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v3 = qword_1ECD3F350;
      if (os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_FAULT))
      {
        v10 = 136315138;
        v11 = "container_query_set_persona_unique_string";
        _os_log_fault_impl(&dword_1CF7DA000, v3, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: query has already been executed", (uint8_t *)&v10, 0xCu);
      }
      v4 = a1;
      v5 = 111;
LABEL_8:
      _container_query_set_usage_error(v4, v5);
      return;
    }
    if (!a2)
    {
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v9 = qword_1ECD3F350;
      if (os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_FAULT))
      {
        v10 = 136315138;
        v11 = "container_query_set_persona_unique_string";
        _os_log_fault_impl(&dword_1CF7DA000, v9, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: persona_unique_string parameter is NULL", (uint8_t *)&v10, 0xCu);
      }
      v4 = a1;
      v5 = 38;
      goto LABEL_8;
    }
    _container_query_log_if_error(*a1, (uint64_t)"container_query_set_persona_unique_string");
    v8 = (void *)a1[7];
    if (v8)
    {
      free(v8);
      memset_s(a1 + 7, 8uLL, 0, 8uLL);
    }
    a1[7] = (uint64_t)strndup(a2, 0x400uLL);
    a1[2] |= 0x10uLL;
  }
  else
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v6 = qword_1ECD3F350;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_FAULT))
    {
      v10 = 136315138;
      v11 = "container_query_set_persona_unique_string";
      _os_log_fault_impl(&dword_1CF7DA000, v6, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: query parameter is NULL", (uint8_t *)&v10, 0xCu);
    }
  }
}

void __container_system_path_for_identifier_block_invoke(_QWORD *a1)
{
  const char *v2;
  int active_platform;
  uint64_t v4;
  _QWORD *v5;
  const char *path;
  uint64_t v7;
  uint64_t *v8;

  v2 = (const char *)a1[6];
  active_platform = dyld_get_active_platform();
  v4 = _container_legacy_lookup(0xCuLL, v2, 0, active_platform, 1, 0, 0, (uint64_t *)(*(_QWORD *)(a1[4] + 8) + 24));
  v5 = (_QWORD *)v4;
  if (v4)
  {
    path = (const char *)container_object_get_path(v4);
    if (path)
      *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = strndup(path, 0x400uLL);
    else
      *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = 53;
  }
  container_object_free(v5);
  v7 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  if (v7 != 1)
  {
    v8 = (uint64_t *)a1[7];
    if (v8)
    {
      *v8 = v7;
      v7 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
    }
  }
  container_log_error((uint64_t)"container_system_path_for_identifier", gClientFaultLoggingEnabled, v7);
}

BOOL container_query_iterate_results_sync(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  _DWORD *bytes_ptr;
  unsigned int v6;
  BOOL v7;
  int v8;
  _QWORD *v9;
  NSObject *v10;
  _QWORD block[7];
  __int128 buf;
  uint64_t v14;
  char v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C874D8];
  if (a1)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v14 = 0x2000000000;
    v15 = 1;
    _container_query_log_if_error(*(_QWORD *)a1, (uint64_t)"container_query_iterate_results_sync");
    if (!*(_QWORD *)(a1 + 120))
    {
      v4 = *(NSObject **)(a1 + 8);
      block[0] = MEMORY[0x1E0C87450];
      block[1] = 0x40000000;
      block[2] = __container_query_iterate_results_sync_block_invoke;
      block[3] = &unk_1E8CB2CD0;
      block[4] = &buf;
      block[5] = a1;
      block[6] = "container_query_iterate_results_sync";
      os_activity_apply(v4, block);
    }
    if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
    {
      bytes_ptr = xpc_data_get_bytes_ptr(*(xpc_object_t *)(a1 + 120));
      if (bytes_ptr)
      {
        v6 = bytes_ptr[2];
        if (v6)
        {
          v7 = 0;
          v8 = 0;
          v9 = 0;
          while (1)
          {
            if (v9)
            {
              if (v9[11])
                goto LABEL_12;
              container_object_free(v9);
            }
            v9 = malloc_type_calloc(1uLL, 0x70uLL, 0x10F00403C1846C7uLL);
LABEL_12:
            v9[11] = a1;
            *((_DWORD *)v9 + 24) = v8;
            if (((*(uint64_t (**)(uint64_t, _QWORD *))(a2 + 16))(a2, v9) & 1) != 0)
            {
              v7 = ++v8 >= v6;
              if (v6 != v8)
                continue;
            }
            v9[11] = 0;
            *((_DWORD *)v9 + 24) = 0;
            container_object_free(v9);
            goto LABEL_22;
          }
        }
      }
      v7 = 1;
    }
    else
    {
      v7 = 0;
    }
LABEL_22:
    container_log_ext_error((uint64_t)"container_query_iterate_results_sync", gClientFaultLoggingEnabled, *(uint64_t **)a1);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v10 = qword_1ECD3F350;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "container_query_iterate_results_sync";
      _os_log_fault_impl(&dword_1CF7DA000, v10, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: query parameter is NULL", (uint8_t *)&buf, 0xCu);
    }
    return 0;
  }
  return v7;
}

void __container_system_group_path_for_identifier_block_invoke(_QWORD *a1)
{
  const char *v2;
  const char *v3;
  int active_platform;
  uint64_t v5;
  _QWORD *v6;
  const char *path;
  uint64_t v8;
  uint64_t *v9;

  v2 = (const char *)a1[6];
  v3 = (const char *)a1[7];
  active_platform = dyld_get_active_platform();
  v5 = _container_legacy_lookup(0xDuLL, v2, v3, active_platform, 1, 0, 0, (uint64_t *)(*(_QWORD *)(a1[4] + 8) + 24));
  v6 = (_QWORD *)v5;
  if (v5)
  {
    path = (const char *)container_object_get_path(v5);
    if (path)
      *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = strndup(path, 0x400uLL);
    else
      *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = 53;
  }
  container_object_free(v6);
  v8 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  if (v8 != 1)
  {
    v9 = (uint64_t *)a1[8];
    if (v9)
    {
      *v9 = v8;
      v8 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
    }
  }
  container_log_error((uint64_t)"container_system_group_path_for_identifier", gClientFaultLoggingEnabled, v8);
}

void __container_create_or_lookup_path_for_platform_block_invoke(uint64_t a1)
{
  unint64_t v2;
  const char *v4;
  const char *v5;
  uint64_t v6;
  _QWORD *v7;
  const char *path;
  uint64_t v9;
  uint64_t *v10;

  v2 = *(_QWORD *)(a1 + 48);
  if (v2 == 7 || v2 == 13)
  {
    v5 = 0;
    v4 = *(const char **)(a1 + 56);
  }
  else
  {
    v4 = 0;
    v5 = *(const char **)(a1 + 56);
  }
  v6 = _container_legacy_lookup(v2, v5, v4, *(_DWORD *)(a1 + 80), *(unsigned __int8 *)(a1 + 84), *(unsigned __int8 *)(a1 + 85), *(_BYTE **)(a1 + 64), (uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  v7 = (_QWORD *)v6;
  if (v6)
  {
    path = (const char *)container_object_get_path(v6);
    if (path)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = strndup(path, 0x400uLL);
    else
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 53;
  }
  container_object_free(v7);
  v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v9 != 1)
  {
    v10 = *(uint64_t **)(a1 + 72);
    if (v10)
    {
      *v10 = v9;
      v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    }
  }
  container_log_error((uint64_t)"container_create_or_lookup_path_for_platform", gClientFaultLoggingEnabled, v9);
}

uint64_t _container_legacy_lookup(unint64_t a1, const char *a2, const char *a3, int a4, int a5, int a6, _BYTE *a7, uint64_t *a8)
{
  const char *v14;
  NSObject *v16;
  uint64_t *v17;
  xpc_object_t v18;
  xpc_object_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  xpc_object_t v24;
  uint64_t v25;
  _QWORD *single_result;
  uint64_t v27;
  unsigned __int8 v28;
  int current_persona;
  const char *v32;
  NSObject *v33;
  const char *v34;
  const char *v35;
  _BYTE *v36;
  uint8_t v37[4];
  int v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  int v46;
  __int16 v47;
  int v48;
  __int16 v49;
  int v50;
  __int16 v51;
  unint64_t v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  int v58;
  __int16 v59;
  int v60;
  __int16 v61;
  uid_t v62;
  __int16 v63;
  uid_t v64;
  _BYTE buf[52];
  __int128 v66;
  __int128 v67;
  _BYTE v68[256];
  uint64_t v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C874D8];
  if (a1 - 1 > 0xD)
  {
    v20 = 0;
    v17 = 0;
    v21 = 20;
  }
  else
  {
    v14 = a2;
    if ((a1 & 0xFFFFFFFFFFFFFFFELL) == 0xC || a1 <= 8 && ((1 << a1) & 0x12A) != 0)
    {
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v16 = qword_1ECD3F348;
      if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134219523;
        *(_QWORD *)&buf[4] = a1;
        *(_WORD *)&buf[12] = 2081;
        *(_QWORD *)&buf[14] = v14;
        *(_WORD *)&buf[22] = 2081;
        *(_QWORD *)&buf[24] = a3;
        *(_WORD *)&buf[32] = 1024;
        *(_DWORD *)&buf[34] = a5;
        *(_WORD *)&buf[38] = 1024;
        *(_DWORD *)&buf[40] = a6;
        *(_WORD *)&buf[44] = 1024;
        *(_DWORD *)&buf[46] = geteuid();
        *(_WORD *)&buf[50] = 1024;
        LODWORD(v66) = getuid();
        _os_log_impl(&dword_1CF7DA000, v16, OS_LOG_TYPE_DEFAULT, "Requesting container lookup; class = %llu, identifier = %{private}s, group_identifier = %{private}s, create = "
          "%d, temp = %d, euid = %d, uid = %d",
          buf,
          0x38u);
      }
    }
    else
    {
      v74 = 0u;
      v75 = 0u;
      v73 = 0u;
      voucher_get_current_persona_originator_info();
      v71 = 0u;
      v72 = 0u;
      v70 = 0u;
      voucher_get_current_persona_proximate_info();
      v69 = 0;
      memset(v68, 0, sizeof(v68));
      v67 = 0u;
      v66 = 0u;
      memset(&buf[4], 0, 48);
      *(_DWORD *)buf = 2;
      current_persona = voucher_get_current_persona();
      if (current_persona == -1 || (kpersona_info() & 0x80000000) != 0)
      {
        v34 = "NOPERSONA";
        v35 = "<unknown>";
        v14 = a2;
      }
      else
      {
        if ((*(_DWORD *)&buf[8] - 2) > 4)
          v32 = "<unknown>";
        else
          v32 = (&off_1E8CB3988)[*(_DWORD *)&buf[8] - 2];
        v34 = v32;
        v14 = a2;
        v35 = &v68[4];
      }
      v36 = a7;
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v33 = qword_1ECD3F348;
      if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v37 = 67112451;
        v38 = current_persona;
        v39 = 2082;
        v40 = v34;
        v41 = 2082;
        v42 = v35;
        v43 = 1024;
        v44 = 0;
        v45 = 1024;
        v46 = 0;
        v47 = 1024;
        v48 = 0;
        v49 = 1024;
        v50 = 0;
        v51 = 2048;
        v52 = a1;
        v53 = 2081;
        v54 = v14;
        v55 = 2081;
        v56 = a3;
        v57 = 1024;
        v58 = a5;
        v59 = 1024;
        v60 = a6;
        v61 = 1024;
        v62 = geteuid();
        v63 = 1024;
        v64 = getuid();
        _os_log_impl(&dword_1CF7DA000, v33, OS_LOG_TYPE_DEFAULT, "Requesting container lookup; personaid = %d, type = %{public}s, name = %{public}s, origin [pid = %d, personaid"
          " = %d], proximate [pid = %d, personaid = %d], class = %llu, identifier = %{private}s, group_identifier = %{pri"
          "vate}s, create = %d, temp = %d, euid = %d, uid = %d",
          v37,
          0x6Au);
      }
      a7 = v36;
    }
    v17 = container_query_create();
    container_query_set_class(v17, a1);
    container_query_set_transient((uint64_t)v17, a6);
    if (v14)
    {
      v18 = xpc_string_create(v14);
      container_query_set_identifiers(v17, v18);
      if (v18)
        xpc_release(v18);
    }
    if (a1 == 13 || a1 == 7)
    {
      if (a3)
      {
        v19 = xpc_string_create(a3);
        container_query_set_group_identifiers(v17, v19);
        if (v19)
          xpc_release(v19);
      }
      else
      {
        v22 = container_codesign_copy_current_identifier();
        *(_QWORD *)buf = v22;
        if (v22)
        {
          v23 = v22;
          v24 = xpc_string_create(v22);
          container_query_set_group_identifiers(v17, v24);
          if (v24)
            xpc_release(v24);
          free(v23);
          memset_s(buf, 8uLL, 0, 8uLL);
        }
      }
    }
    container_query_operation_set_platform((uint64_t)v17, a4);
    if (a5)
      v25 = 0x900000001;
    else
      v25 = 0x900000000;
    container_query_operation_set_flags(v17, v25);
    v17[13] = 3;
    single_result = container_query_get_single_result((uint64_t)v17);
    if (single_result)
    {
      v27 = (uint64_t)single_result;
      v28 = container_object_is_new((uint64_t)single_result);
      container_object_sandbox_extension_activate(v27, 1);
      if (a7)
        *a7 = v28 ^ 1;
      v20 = container_copy_object(v27);
      v21 = 1;
    }
    else
    {
      v20 = 0;
      if (*v17)
        v21 = *(_QWORD *)*v17;
      else
        v21 = 21;
    }
  }
  container_query_free(v17);
  if (a8 && v21 != 1)
    *a8 = v21;
  return v20;
}

void container_query_set_class(uint64_t *a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C874D8];
  if (a1)
  {
    if (a1[15])
    {
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v3 = qword_1ECD3F350;
      if (os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_FAULT))
      {
        v9 = 136315138;
        v10 = "container_query_set_class";
        _os_log_fault_impl(&dword_1CF7DA000, v3, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: query has already been executed", (uint8_t *)&v9, 0xCu);
      }
      v4 = a1;
      v5 = 111;
    }
    else
    {
      if ((unint64_t)(a2 - 1) < 0xE)
      {
        _container_query_log_if_error(*a1, (uint64_t)"container_query_set_class");
        a1[4] = a2;
        a1[2] |= 2uLL;
        return;
      }
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v8 = qword_1ECD3F350;
      if (os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_FAULT))
      {
        v9 = 136315138;
        v10 = "container_query_set_class";
        _os_log_fault_impl(&dword_1CF7DA000, v8, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: invalid container class", (uint8_t *)&v9, 0xCu);
      }
      v4 = a1;
      v5 = 20;
    }
    _container_query_set_usage_error(v4, v5);
  }
  else
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v6 = qword_1ECD3F350;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_FAULT))
    {
      v9 = 136315138;
      v10 = "container_query_set_class";
      _os_log_fault_impl(&dword_1CF7DA000, v6, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: query parameter is NULL", (uint8_t *)&v9, 0xCu);
    }
  }
}

void container_query_operation_set_flags(uint64_t *a1, uint64_t a2)
{
  NSObject *v3;
  NSObject *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C874D8];
  if (a1)
  {
    if (a1[15])
    {
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v3 = qword_1ECD3F350;
      if (os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_FAULT))
      {
        v6 = 136315138;
        v7 = "container_query_operation_set_flags";
        _os_log_fault_impl(&dword_1CF7DA000, v3, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: query has already been executed", (uint8_t *)&v6, 0xCu);
      }
      _container_query_set_usage_error(a1, 111);
    }
    else
    {
      _container_query_log_if_error(*a1, (uint64_t)"container_query_operation_set_flags");
      a1[12] = a2;
    }
  }
  else
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v4 = qword_1ECD3F350;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_FAULT))
    {
      v6 = 136315138;
      v7 = "container_query_operation_set_flags";
      _os_log_fault_impl(&dword_1CF7DA000, v4, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: query parameter is NULL", (uint8_t *)&v6, 0xCu);
    }
  }
}

void _container_query_log_if_error(uint64_t a1, uint64_t a2)
{
  char *v3;
  NSObject *v4;
  char *__s;
  uint8_t buf[4];
  uint64_t v7;
  __int16 v8;
  char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C874D8];
  if (a1)
  {
    v3 = container_error_copy_unlocalized_description(a1);
    __s = v3;
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v4 = qword_1ECD3F350;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v7 = a2;
      v8 = 2080;
      v9 = v3;
      _os_log_error_impl(&dword_1CF7DA000, v4, OS_LOG_TYPE_ERROR, "WARNING: Calling %s with a query that has a previous error: %s", buf, 0x16u);
      if (!v3)
        return;
    }
    else if (!v3)
    {
      return;
    }
    free(v3);
    memset_s(&__s, 8uLL, 0, 8uLL);
  }
}

_QWORD *container_query_create()
{
  _QWORD *v0;

  v0 = malloc_type_calloc(1uLL, 0xA8uLL, 0x10B004034091A17uLL);
  v0[1] = _os_activity_create(&dword_1CF7DA000, "container_query_t", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  *((_DWORD *)v0 + 40) = -1;
  *((_DWORD *)v0 + 41) = voucher_get_current_persona();
  return v0;
}

_QWORD *container_query_free(_QWORD *result)
{
  _QWORD *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  void *v11;
  uint64_t __s;

  __s = (uint64_t)result;
  if (result)
  {
    v1 = result;
    v2 = (void *)result[3];
    if (v2)
      xpc_release(v2);
    v1[3] = 0;
    v3 = (void *)v1[5];
    if (v3)
      xpc_release(v3);
    v4 = (void *)v1[7];
    v1[5] = 0;
    if (v4)
    {
      free(v4);
      memset_s(v1 + 7, 8uLL, 0, 8uLL);
    }
    v5 = (void *)v1[15];
    if (v5)
      xpc_release(v5);
    v1[15] = 0;
    v6 = (void *)v1[17];
    if (v6)
      xpc_release(v6);
    v1[17] = 0;
    v7 = (void *)v1[16];
    if (v7)
      xpc_release(v7);
    v1[16] = 0;
    v8 = v1[19];
    if (v8)
    {
      *(_QWORD *)(v8 + 88) = 0;
      *(_DWORD *)(v8 + 96) = 0;
      container_object_free((_QWORD *)v8);
    }
    v9 = (_QWORD *)*v1;
    if (*v1)
    {
      v9[4] = 0;
      container_error_free(v9);
      *v1 = 0;
    }
    v10 = (_QWORD *)v1[14];
    if (v10)
    {
      container_free_client(v10);
      v1[14] = 0;
    }
    v11 = (void *)v1[1];
    if (v11)
      os_release(v11);
    free(v1);
    return (_QWORD *)memset_s(&__s, 8uLL, 0, 8uLL);
  }
  return result;
}

_QWORD *container_free_client(_QWORD *result)
{
  _QWORD *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t __s;

  __s = (uint64_t)result;
  if (result)
  {
    v1 = result;
    v3 = result + 1;
    v2 = (void *)result[1];
    if (v2)
    {
      free(v2);
      memset_s(v3, 8uLL, 0, 8uLL);
    }
    v4 = (void *)v1[2];
    if (v4)
    {
      free(v4);
      memset_s(v1 + 2, 8uLL, 0, 8uLL);
    }
    v5 = (void *)v1[11];
    if (v5)
      xpc_release(v5);
    v6 = (void *)v1[4];
    v1[11] = 0;
    if (v6)
    {
      free(v6);
      memset_s(v1 + 4, 8uLL, 0, 8uLL);
    }
    free(v1);
    return (_QWORD *)memset_s(&__s, 8uLL, 0, 8uLL);
  }
  return result;
}

uint64_t container_object_sandbox_extension_activate(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  const char *string;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  const char *path;
  const char *persona_unique_string;
  const char *v14;
  const char *v15;
  int v16;
  const char *v17;
  int v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C874D8];
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  v4 = qword_1ECD3F340;
  if (os_log_type_enabled((os_log_t)qword_1ECD3F340, OS_LOG_TYPE_DEBUG))
  {
    v14 = "false";
    if (a2)
      v14 = "true";
    v18 = 136446466;
    v19 = "container_object_sandbox_extension_activate";
    v20 = 2082;
    v21 = v14;
    _os_log_debug_impl(&dword_1CF7DA000, v4, OS_LOG_TYPE_DEBUG, "%{public}s(container, %{public}s)", (uint8_t *)&v18, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 88);
  if (v5 && (v6 = *(void **)(v5 + 128)) != 0)
  {
    string = xpc_array_get_string(v6, *(unsigned int *)(a1 + 96));
    if (!string)
    {
LABEL_7:
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v8 = qword_1ECD3F340;
      if (os_log_type_enabled((os_log_t)qword_1ECD3F340, OS_LOG_TYPE_DEBUG))
      {
        v9 = "false";
        if (a2)
          v9 = "true";
        v18 = 136446466;
        v19 = "container_object_sandbox_extension_activate";
        v20 = 2082;
        v21 = v9;
        _os_log_debug_impl(&dword_1CF7DA000, v8, OS_LOG_TYPE_DEBUG, "%{public}s(container, %{public}s): no sandbox token in container", (uint8_t *)&v18, 0x16u);
      }
      return 1;
    }
  }
  else
  {
    string = *(const char **)(a1 + 48);
    if (!string)
      goto LABEL_7;
  }
  if (!*(_BYTE *)(a1 + 110) || !*(_BYTE *)(a1 + 111) && a2)
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v10 = qword_1ECD3F340;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F340, OS_LOG_TYPE_DEBUG))
    {
      v15 = "false";
      if (a2)
        v15 = "true";
      v16 = *(unsigned __int8 *)(a1 + 110);
      v19 = "container_object_sandbox_extension_activate";
      v18 = 136446722;
      v20 = 2082;
      v21 = v15;
      if (v16)
        v17 = "upgrading";
      else
        v17 = "consuming";
      v22 = 2082;
      v23 = v17;
      _os_log_debug_impl(&dword_1CF7DA000, v10, OS_LOG_TYPE_DEBUG, "%{public}s(container, %{public}s): %{public}s container extension", (uint8_t *)&v18, 0x20u);
    }
    path = (const char *)container_object_get_path(a1);
    persona_unique_string = (const char *)container_object_get_persona_unique_string(a1);
    *(_DWORD *)(a1 + 100) = container_sandbox_extension_consume((uint64_t)string, path, persona_unique_string, a2);
    *(_BYTE *)(a1 + 111) = a2;
    *(_BYTE *)(a1 + 110) = 1;
  }
  return 1;
}

void *container_free_array_of_containers(void *result, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  _QWORD **v4;
  _QWORD *v5;
  uint64_t __s;

  __s = (uint64_t)result;
  if (result)
  {
    v2 = a2;
    v3 = result;
    if (a2)
    {
      v4 = (_QWORD **)result;
      do
      {
        v5 = *v4++;
        container_object_free(v5);
        --v2;
      }
      while (v2);
    }
    free(v3);
    return (void *)memset_s(&__s, 8uLL, 0, 8uLL);
  }
  return result;
}

void container_object_free(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD *__s;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C874D8];
  __s = a1;
  if (a1)
  {
    if (a1[11])
    {
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v2 = qword_1ECD3F350;
      if (os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v13 = "container_object_free";
        _os_log_fault_impl(&dword_1CF7DA000, v2, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: Attempt to free container_object_t that is owned by a container_query_t. Ignoring.", buf, 0xCu);
      }
    }
    else
    {
      if (*((_BYTE *)a1 + 110))
        container_sandbox_extension_revoke(a1[5], *((unsigned int *)a1 + 25));
      v3 = (void *)a1[3];
      if (v3)
      {
        free(v3);
        memset_s(a1 + 3, 8uLL, 0, 8uLL);
      }
      v4 = (void *)a1[4];
      if (v4)
      {
        free(v4);
        memset_s(a1 + 4, 8uLL, 0, 8uLL);
      }
      v5 = (void *)a1[7];
      if (v5)
      {
        free(v5);
        memset_s(a1 + 7, 8uLL, 0, 8uLL);
      }
      v6 = (void *)a1[5];
      if (v6)
      {
        free(v6);
        memset_s(a1 + 5, 8uLL, 0, 8uLL);
      }
      v7 = (void *)a1[6];
      if (v7)
      {
        free(v7);
        memset_s(a1 + 6, 8uLL, 0, 8uLL);
      }
      v8 = (void *)a1[10];
      if (v8)
        xpc_release(v8);
      v9 = (void *)a1[8];
      a1[10] = 0;
      if (v9)
      {
        free(v9);
        memset_s(a1 + 8, 8uLL, 0, 8uLL);
      }
      v10 = (void *)a1[9];
      if (v10)
      {
        free(v10);
        memset_s(a1 + 9, 8uLL, 0, 8uLL);
      }
      free(a1);
      memset_s(&__s, 8uLL, 0, 8uLL);
    }
  }
}

void container_query_set_transient(uint64_t a1, char a2)
{
  NSObject *v3;
  NSObject *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C874D8];
  if (a1)
  {
    if (*(_QWORD *)(a1 + 120))
    {
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v3 = qword_1ECD3F350;
      if (os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_FAULT))
      {
        v6 = 136315138;
        v7 = "container_query_set_transient";
        _os_log_fault_impl(&dword_1CF7DA000, v3, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: query has already been executed", (uint8_t *)&v6, 0xCu);
      }
      _container_query_set_usage_error((uint64_t *)a1, 111);
    }
    else
    {
      _container_query_log_if_error(*(_QWORD *)a1, (uint64_t)"container_query_set_transient");
      *(_BYTE *)(a1 + 64) = a2;
      *(_QWORD *)(a1 + 16) |= 0x20uLL;
    }
  }
  else
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v4 = qword_1ECD3F350;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_FAULT))
    {
      v6 = 136315138;
      v7 = "container_query_set_transient";
      _os_log_fault_impl(&dword_1CF7DA000, v4, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: query parameter is NULL", (uint8_t *)&v6, 0xCu);
    }
  }
}

void container_query_operation_set_platform(uint64_t a1, int a2)
{
  NSObject *v3;
  NSObject *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C874D8];
  if (a1)
  {
    if (*(_QWORD *)(a1 + 120))
    {
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v3 = qword_1ECD3F350;
      if (os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_FAULT))
      {
        v6 = 136315138;
        v7 = "container_query_operation_set_platform";
        _os_log_fault_impl(&dword_1CF7DA000, v3, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: query has already been executed", (uint8_t *)&v6, 0xCu);
      }
      _container_query_set_usage_error((uint64_t *)a1, 111);
    }
    else
    {
      _container_query_log_if_error(*(_QWORD *)a1, (uint64_t)"container_query_operation_set_platform");
      *(_DWORD *)(a1 + 88) = a2;
    }
  }
  else
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v4 = qword_1ECD3F350;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_FAULT))
    {
      v6 = 136315138;
      v7 = "container_query_operation_set_platform";
      _os_log_fault_impl(&dword_1CF7DA000, v4, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: query parameter is NULL", (uint8_t *)&v6, 0xCu);
    }
  }
}

_QWORD *container_query_get_single_result(uint64_t a1)
{
  NSObject *v2;
  _DWORD *bytes_ptr;
  int v4;
  _QWORD *v5;
  NSObject *v6;
  _QWORD *v7;
  _QWORD block[7];
  __int128 buf;
  uint64_t v11;
  char v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C874D8];
  if (a1)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v11 = 0x2000000000;
    v12 = 1;
    _container_query_log_if_error(*(_QWORD *)a1, (uint64_t)"container_query_get_single_result");
    if (!*(_QWORD *)(a1 + 120))
    {
      v2 = *(NSObject **)(a1 + 8);
      block[0] = MEMORY[0x1E0C87450];
      block[1] = 0x40000000;
      block[2] = __container_query_get_single_result_block_invoke;
      block[3] = &unk_1E8CB2CF8;
      block[4] = &buf;
      block[5] = a1;
      block[6] = "container_query_get_single_result";
      os_activity_apply(v2, block);
    }
    if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
    {
      bytes_ptr = xpc_data_get_bytes_ptr(*(xpc_object_t *)(a1 + 120));
      if (bytes_ptr)
      {
        v4 = bytes_ptr[2];
        if (v4)
        {
          if (v4 == 1)
          {
            v5 = *(_QWORD **)(a1 + 152);
            if (!v5)
            {
              v5 = malloc_type_calloc(1uLL, 0x70uLL, 0x10F00403C1846C7uLL);
              *(_QWORD *)(a1 + 152) = v5;
              v5[11] = a1;
              *((_DWORD *)v5 + 24) = 0;
            }
            goto LABEL_17;
          }
          v7 = container_error_create(3, 114, 0, 0);
          v7[4] = a1;
          _container_query_replace_error((uint64_t *)a1, (uint64_t)v7);
        }
      }
    }
    v5 = 0;
LABEL_17:
    container_log_ext_error((uint64_t)"container_query_get_single_result", gClientFaultLoggingEnabled, *(uint64_t **)a1);
    _Block_object_dispose(&buf, 8);
    return v5;
  }
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  v6 = qword_1ECD3F350;
  if (os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_FAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "container_query_get_single_result";
    _os_log_fault_impl(&dword_1CF7DA000, v6, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: query parameter is NULL", (uint8_t *)&buf, 0xCu);
  }
  return 0;
}

void container_log_ext_error(uint64_t a1, int a2, uint64_t *a3)
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  char *v8;
  NSObject *v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  char *__s;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C874D8];
  if (a3)
  {
    v4 = *a3;
    if (*a3 <= 54)
    {
      if (v4 <= 23)
      {
        if (v4 != 1)
        {
          if (v4 != 21)
            goto LABEL_51;
LABEL_23:
          v8 = container_error_copy_unlocalized_description((uint64_t)a3);
          __s = v8;
          if (container_log_handle_for_category_onceToken != -1)
            dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
          v9 = container_log_handle_for_category_logHandles[0];
          if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_DEFAULT))
          {
LABEL_54:
            if (!v8)
              return;
            goto LABEL_55;
          }
          *(_DWORD *)buf = 136446466;
          v21 = a1;
          v22 = 2082;
          v23 = v8;
          _os_log_impl(&dword_1CF7DA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s: error = %{public}s", buf, 0x16u);
          if (!v8)
            return;
LABEL_55:
          free(v8);
          memset_s(&__s, 8uLL, 0, 8uLL);
          return;
        }
        if (container_log_handle_for_category_onceToken != -1)
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        v5 = container_log_handle_for_category_logHandles[0];
        if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446210;
          v21 = a1;
          goto LABEL_11;
        }
        return;
      }
      if (v4 == 24)
        goto LABEL_23;
      if (v4 == 38)
      {
        if (a2)
        {
          if (container_log_handle_for_category_onceToken != -1)
            dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
          v6 = container_log_handle_for_category_logHandles[0];
          if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_ERROR))
            return;
          *(_DWORD *)buf = 136446210;
          v21 = a1;
          v7 = "%{public}s: client sent invalid parameters";
        }
        else
        {
          if (container_log_handle_for_category_onceToken != -1)
            dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
          v6 = container_log_handle_for_category_logHandles[0];
          if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_ERROR))
            return;
          *(_DWORD *)buf = 136446210;
          v21 = a1;
          v7 = "%{public}s: client sent invalid parameters";
        }
LABEL_69:
        v16 = v6;
        v17 = 12;
        goto LABEL_74;
      }
LABEL_51:
      v8 = container_error_copy_unlocalized_description((uint64_t)a3);
      __s = v8;
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v15 = container_log_handle_for_category_logHandles[0];
      if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_ERROR))
        goto LABEL_54;
      *(_DWORD *)buf = 136446466;
      v21 = a1;
      v22 = 2082;
      v23 = v8;
      _os_log_error_impl(&dword_1CF7DA000, v15, OS_LOG_TYPE_ERROR, "%{public}s: error = %{public}s", buf, 0x16u);
      if (!v8)
        return;
      goto LABEL_55;
    }
    if (v4 > 73)
    {
      if (v4 == 74)
      {
        if (!a2)
        {
          if (container_log_handle_for_category_onceToken != -1)
            dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
          v18 = container_log_handle_for_category_logHandles[0];
          if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_ERROR))
            return;
          *(_DWORD *)buf = 136446466;
          v21 = a1;
          v22 = 1026;
          LODWORD(v23) = geteuid();
          v7 = "%{public}s: client uid is not permitted, uid = %{public}u";
          v16 = v18;
          v17 = 18;
LABEL_74:
          _os_log_error_impl(&dword_1CF7DA000, v16, OS_LOG_TYPE_ERROR, v7, buf, v17);
          return;
        }
        if (container_log_handle_for_category_onceToken != -1)
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        v14 = container_log_handle_for_category_logHandles[0];
        if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_FAULT))
          return;
        *(_DWORD *)buf = 136446466;
        v21 = a1;
        v22 = 1026;
        LODWORD(v23) = geteuid();
        v11 = "%{public}s: client uid is not permitted, uid = %{public}u";
        v12 = v14;
        v13 = 18;
LABEL_50:
        _os_log_fault_impl(&dword_1CF7DA000, v12, OS_LOG_TYPE_FAULT, v11, buf, v13);
        return;
      }
      if (v4 != 151)
        goto LABEL_51;
      if (!a2)
      {
        if (container_log_handle_for_category_onceToken != -1)
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        v6 = container_log_handle_for_category_logHandles[0];
        if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_ERROR))
          return;
        *(_DWORD *)buf = 136446210;
        v21 = a1;
        v7 = "%{public}s: client persona did not propagate to container manager";
        goto LABEL_69;
      }
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v10 = container_log_handle_for_category_logHandles[0];
      if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_FAULT))
        return;
      *(_DWORD *)buf = 136446210;
      v21 = a1;
      v11 = "%{public}s: client persona did not propagate to container manager";
    }
    else
    {
      if (v4 != 55)
      {
        if (v4 != 71)
          goto LABEL_51;
        goto LABEL_23;
      }
      if (!a2)
      {
        if (container_log_handle_for_category_onceToken != -1)
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        v6 = container_log_handle_for_category_logHandles[0];
        if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_ERROR))
          return;
        *(_DWORD *)buf = 136446210;
        v21 = a1;
        v7 = "%{public}s: client is not entitled";
        goto LABEL_69;
      }
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v10 = container_log_handle_for_category_logHandles[0];
      if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_FAULT))
        return;
      *(_DWORD *)buf = 136446210;
      v21 = a1;
      v11 = "%{public}s: client is not entitled";
    }
    v12 = v10;
    v13 = 12;
    goto LABEL_50;
  }
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  v5 = container_log_handle_for_category_logHandles[0];
  if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v21 = a1;
LABEL_11:
    _os_log_impl(&dword_1CF7DA000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: success", buf, 0xCu);
  }
}

uint64_t container_copy_object(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v1 = a1;
  if (a1)
  {
    v5 = 0;
    v6 = &v5;
    v7 = 0x2000000000;
    v8 = 0;
    v2 = _os_activity_create(&dword_1CF7DA000, "container_copy_object", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
    v4[0] = MEMORY[0x1E0C87450];
    v4[1] = 0x40000000;
    v4[2] = __container_copy_object_block_invoke;
    v4[3] = &unk_1E8CB2E38;
    v4[4] = &v5;
    v4[5] = v1;
    os_activity_apply(v2, v4);
    os_release(v2);
    v1 = v6[3];
    _Block_object_dispose(&v5, 8);
  }
  return v1;
}

void container_query_set_identifiers(uint64_t *a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  xpc_object_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  xpc_object_t v12;
  xpc_object_t objects;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C874D8];
  objects = a2;
  if (a1)
  {
    if (a1[15])
    {
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v3 = qword_1ECD3F350;
      if (os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "container_query_set_identifiers";
        _os_log_fault_impl(&dword_1CF7DA000, v3, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: query has already been executed", buf, 0xCu);
      }
      v4 = 111;
LABEL_8:
      _container_query_set_usage_error(a1, v4);
      return;
    }
    v6 = a2;
    if (!a2)
    {
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v10 = qword_1ECD3F350;
      if (os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "container_query_set_identifiers";
        _os_log_fault_impl(&dword_1CF7DA000, v10, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: identifiers parameter is NULL", buf, 0xCu);
      }
      v4 = 38;
      goto LABEL_8;
    }
    v7 = MEMORY[0x1D17D6434](a2);
    v8 = MEMORY[0x1E0C89020];
    if (v7 == MEMORY[0x1E0C89020])
    {
      v6 = xpc_array_create(&objects, 1uLL);
      objects = v6;
    }
    if (MEMORY[0x1D17D6434](v6) == MEMORY[0x1E0C88FC0])
    {
      _container_query_log_if_error(*a1, (uint64_t)"container_query_set_identifiers");
      v11 = (void *)a1[3];
      if (v11)
        xpc_release(v11);
      a1[3] = 0;
      v12 = xpc_retain(objects);
      a1[2] |= 1uLL;
      a1[3] = (uint64_t)v12;
    }
    else
    {
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v9 = qword_1ECD3F350;
      if (os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "container_query_set_identifiers";
        _os_log_fault_impl(&dword_1CF7DA000, v9, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: identifiers is not an array or string", buf, 0xCu);
      }
      _container_query_set_usage_error(a1, 38);
    }
    if (v7 == v8 && objects)
      xpc_release(objects);
  }
  else
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v5 = qword_1ECD3F350;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "container_query_set_identifiers";
      _os_log_fault_impl(&dword_1CF7DA000, v5, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: query parameter is NULL", buf, 0xCu);
    }
  }
}

void container_query_set_group_identifiers(uint64_t *a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  xpc_object_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  xpc_object_t objects;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C874D8];
  objects = a2;
  if (a1)
  {
    if (a1[15])
    {
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v3 = qword_1ECD3F350;
      if (os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v14 = "container_query_set_group_identifiers";
        _os_log_fault_impl(&dword_1CF7DA000, v3, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: query has already been executed", buf, 0xCu);
      }
      v4 = 111;
LABEL_8:
      _container_query_set_usage_error(a1, v4);
      return;
    }
    v6 = a2;
    if (!a2)
    {
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v10 = qword_1ECD3F350;
      if (os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v14 = "container_query_set_group_identifiers";
        _os_log_fault_impl(&dword_1CF7DA000, v10, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: identifiers parameter is NULL", buf, 0xCu);
      }
      v4 = 38;
      goto LABEL_8;
    }
    v7 = MEMORY[0x1D17D6434](a2);
    v8 = MEMORY[0x1E0C89020];
    if (v7 == MEMORY[0x1E0C89020])
    {
      v6 = xpc_array_create(&objects, 1uLL);
      objects = v6;
    }
    if (MEMORY[0x1D17D6434](v6) == MEMORY[0x1E0C88FC0])
    {
      _container_query_log_if_error(*a1, (uint64_t)"container_query_set_group_identifiers");
      v11 = (void *)a1[5];
      if (v11)
        xpc_release(v11);
      a1[5] = 0;
      a1[5] = (uint64_t)xpc_retain(objects);
      a1[2] |= 4uLL;
    }
    else
    {
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v9 = qword_1ECD3F350;
      if (os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v14 = "container_query_set_group_identifiers";
        _os_log_fault_impl(&dword_1CF7DA000, v9, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: identifiers is not an array or string", buf, 0xCu);
      }
      _container_query_set_usage_error(a1, 38);
    }
    if (v7 == v8 && objects)
      xpc_release(objects);
  }
  else
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v5 = qword_1ECD3F350;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "container_query_set_group_identifiers";
      _os_log_fault_impl(&dword_1CF7DA000, v5, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: query parameter is NULL", buf, 0xCu);
    }
  }
}

uint64_t container_sandbox_extension_revoke(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  int v7;
  uint64_t *v8;
  void *v9;
  int v10;
  NSObject *v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C874D8];
  if ((a2 & 0x8000000000000000) == 0)
  {
    v2 = a2;
    if (__initialize_container_sandbox_extensions_onceToken != -1)
      dispatch_once(&__initialize_container_sandbox_extensions_onceToken, &__block_literal_global_674);
    os_unfair_lock_lock((os_unfair_lock_t)&container_global_sandbox_extension_per_persona_lock);
    if (v2)
    {
      v3 = os_map_str_find();
      if (v3)
      {
        v4 = *(_QWORD *)(v3 + 24);
        if (v4)
        {
          v5 = 0;
          v6 = (int *)(v3 + 40);
          while (1)
          {
            v7 = *v6;
            if (*v6)
            {
              if (v6[1] == v2)
                break;
            }
            ++v5;
            v6 += 4;
            if (v4 == v5)
              goto LABEL_28;
          }
          if (v7 == 1)
          {
            v8 = (uint64_t *)(v3 + 32 + 16 * v5);
            v16 = 0;
            v17 = &v16;
            v18 = 0x2000000000;
            v19 = 0;
            os_map_str_foreach();
            if (v17[3])
            {
              os_map_str_delete();
              v9 = (void *)v17[3];
              if (v9)
              {
                free(v9);
                memset_s(v17 + 3, 8uLL, 0, 8uLL);
              }
            }
            v10 = sandbox_extension_release();
            if (v10)
            {
              if (v10 < 0)
              {
                if (container_log_handle_for_category_onceToken != -1)
                  dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
                v11 = qword_1ECD3F340;
                if (os_log_type_enabled((os_log_t)qword_1ECD3F340, OS_LOG_TYPE_ERROR))
                {
                  v12 = *__error();
                  *(_DWORD *)buf = 67109120;
                  LODWORD(v21) = v12;
                  _os_log_error_impl(&dword_1CF7DA000, v11, OS_LOG_TYPE_ERROR, "container_sandbox_extension_revoke(): error %d releasing sandbox extension", buf, 8u);
                }
              }
            }
            else
            {
              if (container_log_handle_for_category_onceToken != -1)
                dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
              v13 = qword_1ECD3F340;
              if (os_log_type_enabled((os_log_t)qword_1ECD3F340, OS_LOG_TYPE_DEFAULT))
              {
                v14 = *v8;
                *(_DWORD *)buf = 134217984;
                v21 = v14;
                _os_log_impl(&dword_1CF7DA000, v13, OS_LOG_TYPE_DEFAULT, "Revoked sandbox extension; handle = %lld",
                  buf,
                  0xCu);
              }
            }
            *v8 = 0;
            v8[1] = 0;
            _Block_object_dispose(&v16, 8);
          }
          else
          {
            *v6 = v7 - 1;
          }
        }
      }
    }
LABEL_28:
    os_unfair_lock_unlock((os_unfair_lock_t)&container_global_sandbox_extension_per_persona_lock);
  }
  return 1;
}

uint64_t container_sandbox_extension_consume(uint64_t a1, const char *a2, const char *a3, int a4)
{
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  NSObject *v19;
  int v20;
  _QWORD *v21;
  int v22;
  unsigned int v23;
  int v24;
  int v26;
  NSObject *v27;
  int v28;
  _QWORD *__s;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C874D8];
  if (__initialize_container_sandbox_extensions_onceToken != -1)
    dispatch_once(&__initialize_container_sandbox_extensions_onceToken, &__block_literal_global_674);
  os_unfair_lock_lock((os_unfair_lock_t)&container_global_sandbox_extension_per_persona_lock);
  if (!a3)
    a3 = "default";
  v7 = (_QWORD *)os_map_str_find();
  __s = v7;
  if (!v7)
  {
    v7 = malloc_type_calloc(1uLL, 0x3E0uLL, 0x5CF0B10FuLL);
    __s = v7;
    os_map_str_init();
    v7[3] = 60;
    strdup(a3);
    os_map_str_insert();
  }
  v8 = os_map_str_find();
  if (v8)
  {
    v9 = &v7[2 * v8];
    v10 = v9 + 4;
    v11 = *((_DWORD *)v9 + 6);
    if (v11 != -1)
    {
      if (a4)
        *(v10 - 1) = 0xFFFFFFFFLL;
      else
        *((_DWORD *)v10 - 2) = v11 + 1;
    }
    v23 = *((_DWORD *)v10 - 1);
  }
  else
  {
    v12 = v7[3];
    if (v12)
    {
      v13 = 0;
      v14 = 5;
      while (LODWORD(v7[v14]))
      {
        ++v13;
        v14 += 2;
        if (v12 == v13)
          goto LABEL_15;
      }
    }
    else
    {
LABEL_15:
      v15 = malloc_type_calloc(1uLL, 32 * v12 + 32, 0x425E2600uLL);
      memcpy(v15, v7, 16 * v12 + 32);
      v15[3] = 2 * v7[3];
      free(v7);
      memset_s(&__s, 8uLL, 0, 8uLL);
      __s = v15;
      os_map_str_entry();
      os_map_str_delete();
      os_map_str_insert();
      v7 = __s;
      v13 = v12;
    }
    v16 = sandbox_extension_consume();
    if (v16 < 0)
    {
      v26 = *__error();
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v27 = qword_1ECD3F340;
      if (os_log_type_enabled((os_log_t)qword_1ECD3F340, OS_LOG_TYPE_ERROR))
      {
        v28 = *__error();
        *(_DWORD *)buf = 67109120;
        LODWORD(v31) = v28;
        _os_log_error_impl(&dword_1CF7DA000, v27, OS_LOG_TYPE_ERROR, "container_sandbox_extension_consume(): error %d consuming sandbox extension", buf, 8u);
      }
      *__error() = v26;
      v23 = -1;
    }
    else
    {
      v17 = v16;
      v18 = v7 + 4;
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v19 = qword_1ECD3F340;
      if (os_log_type_enabled((os_log_t)qword_1ECD3F340, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v31 = a2;
        v32 = 2048;
        v33 = v17;
        _os_log_impl(&dword_1CF7DA000, v19, OS_LOG_TYPE_DEFAULT, "Consumed sandbox extension; path = [%s], handle = %lld",
          buf,
          0x16u);
      }
      v18[2 * v13] = v17;
      if (a4)
        v20 = -1;
      else
        v20 = 1;
      v21 = &v18[2 * v13];
      *((_DWORD *)v21 + 2) = v20;
      v22 = next_temp_key;
      if (a4)
        v22 = 0;
      *((_DWORD *)v21 + 3) = v22;
      ++next_temp_key;
      strndup(a2, 0x400uLL);
      os_map_str_insert();
      v23 = *((_DWORD *)v21 + 3);
    }
  }
  v24 = *__error();
  os_unfair_lock_unlock((os_unfair_lock_t)&container_global_sandbox_extension_per_persona_lock);
  *__error() = v24;
  return v23;
}

char *container_error_copy_unlocalized_description(uint64_t a1)
{
  int v1;
  char *v3;

  v3 = 0;
  if (a1)
  {
    v1 = *(_DWORD *)(a1 + 24);
    if (v1 < 1)
    {
      asprintf(&v3, "%llu→(%llu) %s");
    }
    else
    {
      strerror(v1);
      asprintf(&v3, "%llu→(%llu) %s at path [%s] with errno (%d) %s");
    }
  }
  return v3;
}

xpc_object_t __container_create_or_lookup_app_group_path_by_app_group_identifier_block_invoke_2()
{
  xpc_object_t result;

  result = xpc_dictionary_create(0, 0, 0);
  CONTAINER_PERSONA_CURRENT_block_invoke_cache = (uint64_t)result;
  return result;
}

uint64_t container_client_get_pid(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  if (a1)
    return *(unsigned int *)(a1 + 80);
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  v2 = qword_1ECD3F348;
  if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1CF7DA000, v2, OS_LOG_TYPE_FAULT, "NULL client when fetching pid", v3, 2u);
  }
  return getpid();
}

uint64_t container_client_get_platform(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  if (a1)
    return *(unsigned int *)(a1 + 24);
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  v2 = qword_1ECD3F348;
  if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1CF7DA000, v2, OS_LOG_TYPE_FAULT, "NULL client when fetching platform", v3, 2u);
  }
  return dyld_get_active_platform();
}

uint64_t container_client_get_persona_unique_string(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  if (a1)
    return *(_QWORD *)(a1 + 32);
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  v2 = qword_1ECD3F348;
  if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1CF7DA000, v2, OS_LOG_TYPE_FAULT, "NULL client when fetching persona unique string", v3, 2u);
  }
  return 0;
}

const char *container_client_get_codesign_identifier(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  if (a1)
    return *(const char **)(a1 + 8);
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  v2 = qword_1ECD3F348;
  if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1CF7DA000, v2, OS_LOG_TYPE_FAULT, "NULL client when fetching code sign identifier", v3, 2u);
  }
  return "unknown";
}

double container_client_get_audit_token@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  __int128 v3;
  __int128 v4;
  NSObject *v5;
  uint8_t v7[16];

  if (a1)
  {
    v3 = *(_OWORD *)(a1 + 48);
    v4 = *(_OWORD *)(a1 + 64);
    *a2 = v3;
    a2[1] = v4;
  }
  else
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v5 = qword_1ECD3F348;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_fault_impl(&dword_1CF7DA000, v5, OS_LOG_TYPE_FAULT, "NULL client when fetching audit token", v7, 2u);
    }
    *(_QWORD *)&v3 = 0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return *(double *)&v3;
}

char *__container_create_or_lookup_user_managed_assets_path_block_invoke(uint64_t a1)
{
  char *result;

  result = _common_user_managed_assets_path(*(char **)(a1 + 48), 0, *(unsigned __int8 *)(a1 + 64), *(BOOL **)(a1 + 56), (uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

char *_common_user_managed_assets_path(char *a1, BOOL a2, _BOOL4 a3, BOOL *a4, uint64_t *a5)
{
  const char *v9;
  xpc_object_t v10;
  int v11;
  void *v12;
  void *v13;
  const char *string;
  const char *v15;
  char *v16;
  uint64_t v17;
  void *v19;

  v19 = 0;
  if (!a1)
  {
    v10 = 0;
    v17 = 18;
    goto LABEL_17;
  }
  v9 = a1;
  v10 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v10, "Command", 0x1CuLL);
  xpc_dictionary_set_string(v10, "Identifier", v9);
  xpc_dictionary_set_BOOL(v10, "IsRelative", a2);
  xpc_dictionary_set_BOOL(v10, "CreateIfNecessary", a3);
  if (a4)
    v11 = !a3;
  else
    v11 = 1;
  v12 = (void *)container_xpc_send_sync_message(2, 0, v10, v11, 0, 0, (uint64_t)&v19);
  if (!v12)
  {
    a1 = (char *)v19;
    if (v19)
      v17 = *(_QWORD *)v19;
    else
      v17 = 1;
LABEL_17:
    container_error_free(a1);
    v16 = 0;
    if (!v10)
      goto LABEL_19;
LABEL_18:
    xpc_release(v10);
    goto LABEL_19;
  }
  v13 = v12;
  string = xpc_dictionary_get_string(v12, "ReplyPath");
  if (string)
  {
    v15 = string;
    if (a4)
      *a4 = xpc_dictionary_get_BOOL(v13, "ReplyExisted");
    v16 = strdup(v15);
    v17 = 1;
  }
  else
  {
    v16 = 0;
    v17 = 53;
  }
  container_error_free(v19);
  xpc_release(v13);
  if (v10)
    goto LABEL_18;
LABEL_19:
  if (a5 && v17 != 1)
    *a5 = v17;
  return v16;
}

BOOL __container_query_iterate_results_sync_block_invoke(_QWORD *a1)
{
  _BOOL8 result;

  result = _container_query_execute(a1[5], a1[6]);
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  return result;
}

void __container_create_or_lookup_app_group_path_by_app_group_identifier_block_invoke(uint64_t a1)
{
  const char **v2;
  unint64_t v3;
  xpc_object_t dictionary;
  const char *string;
  const char *v6;
  uint64_t v7;
  int current_persona;
  const char *v9;
  NSObject *v10;
  const char *v11;
  uid_t v12;
  char *v13;
  char *v14;
  int v15;
  uint64_t v16;
  void *v17;
  _BOOL4 v18;
  NSObject *v19;
  xpc_object_t v20;
  void *v21;
  void *v22;
  unsigned __int8 *v23;
  unsigned __int8 *v24;
  const char *path;
  void *v26;
  xpc_object_t v27;
  void *v28;
  void *v29;
  xpc_object_t v30;
  void *v31;
  xpc_object_t v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  _DWORD value[3];
  void *v38;
  uint64_t v39;
  uint8_t buf[4];
  int v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  int v49;
  __int16 v50;
  int v51;
  __int16 v52;
  int v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  uid_t v57;
  __int16 v58;
  uid_t v59;
  __int16 v60;
  int v61;
  _BYTE v62[20];
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint64_t v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C874D8];
  if (CONTAINER_PERSONA_CURRENT_block_invoke_once_token != -1)
    dispatch_once(&CONTAINER_PERSONA_CURRENT_block_invoke_once_token, &__block_literal_global_914);
  *(_QWORD *)&value[1] = 0;
  v2 = (const char **)(a1 + 48);
  if (!*(_QWORD *)(a1 + 48))
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v10 = container_log_handle_for_category_logHandles[0];
    if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)v62 = 0;
    v11 = "A NULL string is not a valid group container identifier.";
    goto LABEL_43;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&CONTAINER_PERSONA_CURRENT_block_invoke_lock);
  v3 = 0x1ECD3F000uLL;
  if (CONTAINER_PERSONA_CURRENT_block_invoke_cache)
  {
    v83 = 0;
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    v78 = 0u;
    v77 = 0u;
    v76 = 0u;
    v75 = 0u;
    v74 = 0u;
    v73 = 0u;
    v72 = 0u;
    v71 = 0u;
    v70 = 0u;
    v69 = 0u;
    v68 = 0u;
    v67 = 0u;
    v66 = 0u;
    v65 = 0u;
    v64 = 0u;
    v63 = 0u;
    *(_OWORD *)&v62[4] = 0u;
    *(_DWORD *)v62 = 2;
    kpersona_info();
    dictionary = xpc_dictionary_get_dictionary((xpc_object_t)CONTAINER_PERSONA_CURRENT_block_invoke_cache, "default");
    if (dictionary)
    {
      string = xpc_dictionary_get_string(dictionary, *v2);
      if (string)
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = strndup(string, 0x400uLL);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&CONTAINER_PERSONA_CURRENT_block_invoke_lock);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    return;
  v6 = *v2;
  if (!**v2)
  {
    if (!dyld_program_sdk_at_least())
    {
      v12 = geteuid();
      v13 = container_pwd_copy_user_home_path(v12, 1, 1, (uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
      *(_QWORD *)&value[1] = v13;
      if (!v13)
        return;
      v14 = v13;
      v15 = asprintf((char **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), "%s/%s/%s", v13, "Library", "AppGroup");
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v17 = *(void **)(v16 + 24);
      if (!v17 || v15 < 0)
      {
        if (v17)
        {
          free(v17);
          memset_s((void *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), 8uLL, 0, 8uLL);
          v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        }
        *(_QWORD *)(v16 + 24) = 0;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 73;
        goto LABEL_70;
      }
      v18 = 0;
      goto LABEL_55;
    }
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v10 = container_log_handle_for_category_logHandles[0];
    if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_ERROR))
    {
LABEL_17:
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 38;
      return;
    }
    *(_WORD *)v62 = 0;
    v11 = "An empty string is not a valid group container identifier.";
LABEL_43:
    _os_log_error_impl(&dword_1CF7DA000, v10, OS_LOG_TYPE_ERROR, v11, v62, 2u);
    goto LABEL_17;
  }
  v36 = *(unsigned int *)(a1 + 56);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v39 = 1;
  value[0] = dyld_get_active_platform();
  v38 = 0;
  v88 = 0u;
  v89 = 0u;
  v87 = 0u;
  voucher_get_current_persona_originator_info();
  v85 = 0u;
  v86 = 0u;
  v84 = 0u;
  voucher_get_current_persona_proximate_info();
  v83 = 0;
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v78 = 0u;
  v77 = 0u;
  v76 = 0u;
  v75 = 0u;
  v74 = 0u;
  v73 = 0u;
  v72 = 0u;
  v71 = 0u;
  v70 = 0u;
  v69 = 0u;
  v68 = 0u;
  v67 = 0u;
  v66 = 0u;
  v65 = 0u;
  v64 = 0u;
  v63 = 0u;
  *(_OWORD *)&v62[4] = 0u;
  *(_DWORD *)v62 = 2;
  current_persona = voucher_get_current_persona();
  if (current_persona == -1 || (kpersona_info() & 0x80000000) != 0)
  {
    v33 = "<unknown>";
    v34 = "NOPERSONA";
  }
  else
  {
    if ((*(_DWORD *)&v62[8] - 2) > 4)
      v9 = "<unknown>";
    else
      v9 = (&off_1E8CB3988)[*(_DWORD *)&v62[8] - 2];
    v34 = v9;
    v33 = (char *)&v67 + 4;
  }
  v35 = v7;
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  v19 = qword_1ECD3F348;
  if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67111683;
    v41 = current_persona;
    v42 = 2082;
    v43 = v34;
    v44 = 2082;
    v45 = v33;
    v46 = 1024;
    v47 = 0;
    v48 = 1024;
    v49 = 0;
    v50 = 1024;
    v51 = 0;
    v52 = 1024;
    v53 = 0;
    v54 = 2081;
    v55 = v6;
    v56 = 1024;
    v57 = geteuid();
    v58 = 1024;
    v59 = getuid();
    v60 = 1024;
    v61 = value[0];
    _os_log_impl(&dword_1CF7DA000, v19, OS_LOG_TYPE_DEFAULT, "Requesting app group container lookup; personaid = %d, type = %{public}s, name = %{public}s, origin [pid = %d, per"
      "sonaid = %d], proximate [pid = %d, personaid = %d], identifier = %{private}s, euid = %d, uid = %d, platform = %d",
      buf,
      0x50u);
  }
  v20 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v20, "Command", 0x26uLL);
  xpc_dictionary_set_string(v20, "Identifier", v6);
  xpc_dictionary_set_uint64(v20, "Platform", value[0]);
  xpc_dictionary_set_uint64(v20, "PersonaKernelID", v36);
  v21 = (void *)container_xpc_send_sync_message(2, 0, v20, 1, 0, 0, (uint64_t)&v38);
  v22 = v21;
  if (v21)
  {
    v23 = container_xpc_decode_container_object(v21, &v39);
    v24 = v23;
    v3 = 0x1ECD3F000uLL;
    if (v23)
    {
      if (container_object_get_path((uint64_t)v23))
      {
        path = (const char *)container_object_get_path((uint64_t)v24);
        v18 = xpc_dictionary_get_BOOL(v22, "ReplyCacheable");
        container_object_sandbox_extension_activate((uint64_t)v24, 1);
        if (path)
          path = strndup(path, 0x400uLL);
      }
      else
      {
        path = 0;
        v18 = 0;
        v39 = 54;
      }
    }
    else
    {
      path = 0;
      v18 = 0;
    }
  }
  else
  {
    path = 0;
    v24 = 0;
    v18 = 0;
    v3 = 0x1ECD3F000;
  }
  if (v38)
    v39 = *(_QWORD *)v38;
  container_error_free(v38);
  container_object_free(v24);
  if (v20)
    xpc_release(v20);
  if (v22)
    xpc_release(v22);
  if (v39 != 1)
    *(_QWORD *)(v35 + 24) = v39;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = path;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    return;
  v14 = 0;
LABEL_55:
  os_unfair_lock_lock_with_options();
  v26 = *(void **)(v3 + 632);
  if (!v26 || !v18)
    goto LABEL_69;
  v27 = xpc_dictionary_get_dictionary(v26, "default");
  if (v27)
  {
    v28 = v27;
    if (xpc_dictionary_get_count(v27) >= 0xA)
    {
      v29 = *(void **)(v3 + 632);
      if (v29)
        xpc_release(v29);
      *(_QWORD *)(v3 + 632) = 0;
      goto LABEL_69;
    }
    v32 = xpc_string_create(*(const char **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    xpc_dictionary_set_value(v28, *(const char **)(a1 + 48), v32);
    if (!v32)
      goto LABEL_69;
    v31 = v32;
LABEL_68:
    xpc_release(v31);
    goto LABEL_69;
  }
  *(_QWORD *)v62 = xpc_string_create(*(const char **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v30 = xpc_dictionary_create((const char *const *)(a1 + 48), (xpc_object_t *)v62, 1uLL);
  xpc_dictionary_set_value(*(xpc_object_t *)(v3 + 632), "default", v30);
  if (v30)
    xpc_release(v30);
  v31 = *(void **)v62;
  if (*(_QWORD *)v62)
    goto LABEL_68;
LABEL_69:
  os_unfair_lock_unlock((os_unfair_lock_t)&CONTAINER_PERSONA_CURRENT_block_invoke_lock);
  if (v14)
  {
LABEL_70:
    free(v14);
    memset_s(&value[1], 8uLL, 0, 8uLL);
  }
}

void __container_xpc_create_connection_block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  _QWORD *v5;
  NSObject *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  _QWORD *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C874D8];
  if (a2 == MEMORY[0x1E0C88FA0])
  {
    xpc_connection_set_event_handler(*(xpc_connection_t *)(a1 + 32), &__block_literal_global_312);
    os_unfair_lock_lock_with_options();
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v3 = qword_1ECD3F348;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_DEBUG))
    {
      v7 = *(_QWORD **)(a1 + 40);
      v8 = v7[1];
      v9 = v7[2];
      v10 = gSharedClientConnection[6 * v8 + v9];
      v15 = 134218752;
      v16 = v7;
      v17 = 2048;
      v18 = v8;
      v19 = 2048;
      v20 = v9;
      v21 = 2048;
      v22 = v10;
      _os_log_debug_impl(&dword_1CF7DA000, v3, OS_LOG_TYPE_DEBUG, "connection <%p/%lld/%lld; %p> invalidated",
        (uint8_t *)&v15,
        0x2Au);
    }
    v4 = *(_QWORD *)(a1 + 40);
    *(_BYTE *)(v4 + 25) = 1;
    if (*(_BYTE *)(v4 + 24))
    {
      v5 = &gSharedClientConnection[6 * *(_QWORD *)(v4 + 8) + *(_QWORD *)(v4 + 16)];
      if (v4 == *v5)
      {
        *v5 = 0;
        --*(_QWORD *)(v4 + 40);
        if (container_log_handle_for_category_onceToken != -1)
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        v6 = qword_1ECD3F348;
        if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_DEBUG))
        {
          v11 = *(_QWORD **)(a1 + 40);
          v12 = v11[1];
          v13 = v11[2];
          v14 = v11[5];
          v15 = 134218752;
          v16 = v11;
          v17 = 2048;
          v18 = v12;
          v19 = 2048;
          v20 = v13;
          v21 = 2048;
          v22 = v14;
          _os_log_debug_impl(&dword_1CF7DA000, v6, OS_LOG_TYPE_DEBUG, "connection <%p/%lld/%lld> released (shared; handler); cnt = %lld",
            (uint8_t *)&v15,
            0x2Au);
        }
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&gSharedClientConnectionLock);
    container_xpc_release(*(_QWORD *)(a1 + 40));
  }
}

BOOL __container_query_get_single_result_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  _BOOL8 result;

  v2 = a1[5];
  v3 = a1[6];
  *(_QWORD *)(v2 + 96) |= 2uLL;
  result = _container_query_execute(v2, v3);
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  return result;
}

BOOL _container_query_execute(uint64_t a1, uint64_t a2)
{
  xpc_object_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _QWORD *v9;
  uint64_t v10;
  _BOOL8 v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  const char *v15;
  int v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  NSObject *v21;
  void **p_s;
  void *v23;
  size_t count;
  const char *string;
  uint64_t v26;
  uid_t v27;
  uid_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint8_t *v32;
  NSObject *v33;
  uint32_t v34;
  uint64_t v35;
  int v36;
  unint64_t v37;
  void *v38;
  xpc_object_t value;
  xpc_object_t v40;
  xpc_object_t v41;
  void *v43;
  int current_persona;
  const char *v45;
  void *v46;
  size_t v47;
  const char *v48;
  const char *v49;
  int v50;
  const char *v51;
  NSObject *v52;
  uint64_t v53;
  uid_t v54;
  uid_t v55;
  void *v56;
  uint64_t v57;
  const char *v58;
  const char *v59;
  const char *v60;
  void *v61;
  _QWORD *v62;
  void *__s;
  __int16 v64;
  const char *v65;
  __int16 v66;
  const char *v67;
  __int16 v68;
  int v69;
  __int16 v70;
  int v71;
  __int16 v72;
  int v73;
  __int16 v74;
  int v75;
  __int16 v76;
  uid_t v77;
  __int16 v78;
  uid_t v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  const char *v83;
  __int16 v84;
  size_t v85;
  __int16 v86;
  uint64_t v87;
  uint8_t buf[4];
  _QWORD v89[4];
  _QWORD v90[4];
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
  uint64_t v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  uint64_t v115;

  v115 = *MEMORY[0x1E0C874D8];
  v62 = 0;
  if (!a1)
    return 0;
  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v4, "Command", 0x27uLL);
  xpc_dictionary_set_uint64(v4, "Flags", *(_QWORD *)(a1 + 96));
  xpc_dictionary_set_uint64(v4, "PrivateFlags", *(_QWORD *)(a1 + 104));
  xpc_dictionary_set_uint64(v4, "Platform", *(unsigned int *)(a1 + 88));
  v5 = *(_QWORD *)(a1 + 112);
  if (v5)
    container_xpc_encode_client_onto_message(v4, v5);
  xpc_dictionary_set_uint64(v4, "Explicit", *(_QWORD *)(a1 + 16));
  v6 = *(_QWORD *)(a1 + 16);
  if ((v6 & 1) != 0)
  {
    v7 = *(void **)(a1 + 24);
    if (v7)
    {
      xpc_dictionary_set_value(v4, "IdentifiersArray", v7);
      v6 = *(_QWORD *)(a1 + 16);
    }
  }
  if ((v6 & 2) != 0)
  {
    xpc_dictionary_set_uint64(v4, "ContainerClass", *(_QWORD *)(a1 + 32));
    if ((*(_BYTE *)(a1 + 16) & 4) != 0)
    {
      v14 = *(void **)(a1 + 40);
      if (v14)
        xpc_dictionary_set_value(v4, "GroupIdentifiers", v14);
    }
    xpc_dictionary_set_uint64(v4, "PersonaKernelID", *(unsigned int *)(a1 + 164));
    if ((*(_BYTE *)(a1 + 16) & 0x10) != 0)
    {
      v15 = *(const char **)(a1 + 56);
      if (v15)
        xpc_dictionary_set_string(v4, "PersonaUniqueString", v15);
    }
    v16 = 0;
    v17 = *(_QWORD *)(a1 + 32);
    if (v17 <= 0xE && ((1 << v17) & 0x4ED4) != 0)
    {
      if ((*(_BYTE *)(a1 + 16) & 8) != 0)
      {
        xpc_dictionary_set_uint64(v4, "UID", *(unsigned int *)(a1 + 48));
        v16 = *(_DWORD *)(a1 + 48);
      }
      else
      {
        v16 = 0;
      }
    }
    v18 = *(_QWORD *)(a1 + 16);
    if ((v18 & 0x20) != 0)
    {
      xpc_dictionary_set_BOOL(v4, "Transient", *(_BYTE *)(a1 + 64));
      v18 = *(_QWORD *)(a1 + 16);
      if ((v18 & 0x40) == 0)
      {
LABEL_29:
        if ((v18 & 0x80) == 0)
          goto LABEL_31;
        goto LABEL_30;
      }
    }
    else if ((v18 & 0x40) == 0)
    {
      goto LABEL_29;
    }
    xpc_dictionary_set_BOOL(v4, "IncludeUnowned", *(_BYTE *)(a1 + 65));
    if ((*(_QWORD *)(a1 + 16) & 0x80) == 0)
    {
LABEL_31:
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      if (!os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_DEFAULT))
        goto LABEL_57;
      v19 = *(_QWORD *)(a1 + 32);
      if ((v19 & 0xFFFFFFFFFFFFFFFELL) == 0xC || v19 <= 8 && ((1 << v19) & 0x12A) != 0)
      {
        if (os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_DEBUG))
        {
          v20 = (void *)MEMORY[0x1D17D632C](v4);
          __s = v20;
          if (container_log_handle_for_category_onceToken != -1)
            dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
          v21 = qword_1ECD3F348;
          if (!os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_DEBUG))
          {
            if (!v20)
              goto LABEL_57;
            goto LABEL_42;
          }
          *(_DWORD *)buf = 67109634;
          LODWORD(v89[0]) = geteuid();
          WORD2(v89[0]) = 1024;
          *(_DWORD *)((char *)v89 + 6) = getuid();
          WORD1(v89[1]) = 2080;
          *(_QWORD *)((char *)&v89[1] + 4) = v20;
          _os_log_debug_impl(&dword_1CF7DA000, v21, OS_LOG_TYPE_DEBUG, "Query; euid = %d, uid = %d, query = %s",
            buf,
            0x18u);
          if (v20)
          {
LABEL_42:
            free(v20);
            p_s = &__s;
LABEL_43:
            memset_s(p_s, 8uLL, 0, 8uLL);
            goto LABEL_57;
          }
          goto LABEL_57;
        }
        v23 = *(void **)(a1 + 24);
        if (v23)
        {
          count = xpc_array_get_count(v23);
          if (count)
            string = xpc_array_get_string(*(xpc_object_t *)(a1 + 24), 0);
          else
            string = 0;
        }
        else
        {
          string = 0;
          count = 0;
        }
        if (container_log_handle_for_category_onceToken != -1)
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        v26 = qword_1ECD3F348;
        if (!os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_DEFAULT))
          goto LABEL_57;
        v27 = geteuid();
        v28 = getuid();
        v29 = *(_QWORD *)(a1 + 32);
        v30 = *(_QWORD *)(a1 + 96);
        *(_DWORD *)buf = 67110402;
        LODWORD(v89[0]) = v27;
        WORD2(v89[0]) = 1024;
        *(_DWORD *)((char *)v89 + 6) = v28;
        WORD1(v89[1]) = 2048;
        *(_QWORD *)((char *)&v89[1] + 4) = v29;
        WORD2(v89[2]) = 2080;
        *(_QWORD *)((char *)&v89[2] + 6) = string;
        HIWORD(v89[3]) = 2048;
        v90[0] = count;
        LOWORD(v90[1]) = 2048;
        *(_QWORD *)((char *)&v90[1] + 2) = v30;
        v31 = "Query; euid = %d, uid = %d, class = %llu, identifier = [%s](%zd), flags = %llx";
        v32 = buf;
        v33 = v26;
        v34 = 54;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_DEBUG))
        {
          v43 = (void *)MEMORY[0x1D17D632C](v4);
          v61 = v43;
          v113 = 0u;
          v114 = 0u;
          v112 = 0u;
          voucher_get_current_persona_originator_info();
          v110 = 0u;
          v111 = 0u;
          v109 = 0u;
          voucher_get_current_persona_proximate_info();
          v108 = 0;
          v106 = 0u;
          v107 = 0u;
          v104 = 0u;
          v105 = 0u;
          v103 = 0u;
          v102 = 0u;
          v101 = 0u;
          v100 = 0u;
          v99 = 0u;
          v98 = 0u;
          v97 = 0u;
          v96 = 0u;
          v95 = 0u;
          v94 = 0u;
          v93 = 0u;
          v92 = 0u;
          v91 = 0u;
          memset(v90, 0, sizeof(v90));
          memset(v89, 0, sizeof(v89));
          *(_DWORD *)buf = 2;
          current_persona = voucher_get_current_persona();
          if (current_persona == -1 || (kpersona_info() & 0x80000000) != 0)
          {
            v49 = "<unknown>";
            v58 = "NOPERSONA";
          }
          else
          {
            if ((HIDWORD(v89[0]) - 2) > 4)
              v45 = "<unknown>";
            else
              v45 = (&off_1E8CB3988)[HIDWORD(v89[0]) - 2];
            v58 = v45;
            v49 = (char *)&v92 + 4;
          }
          if (container_log_handle_for_category_onceToken != -1)
            dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
          v52 = qword_1ECD3F350;
          if (os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_DEBUG))
          {
            LODWORD(__s) = 67111426;
            HIDWORD(__s) = current_persona;
            v64 = 2082;
            v65 = v58;
            v66 = 2082;
            v67 = v49;
            v68 = 1024;
            v69 = 0;
            v70 = 1024;
            v71 = 0;
            v72 = 1024;
            v73 = 0;
            v74 = 1024;
            v75 = 0;
            v76 = 1024;
            v77 = geteuid();
            v78 = 1024;
            v79 = getuid();
            v80 = 2080;
            v81 = v43;
            _os_log_debug_impl(&dword_1CF7DA000, v52, OS_LOG_TYPE_DEBUG, "Query; personaid = %d, type = %{public}s, name = %{public}s, origin [pid = %d, personaid = %d], proximate "
              "[pid = %d, personaid = %d], euid = %d, uid = %d, query = %s",
              (uint8_t *)&__s,
              0x4Au);
            if (!v43)
              goto LABEL_57;
          }
          else if (!v43)
          {
            goto LABEL_57;
          }
          free(v43);
          p_s = &v61;
          goto LABEL_43;
        }
        v46 = *(void **)(a1 + 24);
        if (v46)
        {
          v47 = xpc_array_get_count(v46);
          if (v47)
            v48 = xpc_array_get_string(*(xpc_object_t *)(a1 + 24), 0);
          else
            v48 = 0;
        }
        else
        {
          v48 = 0;
          v47 = 0;
        }
        v113 = 0u;
        v114 = 0u;
        v112 = 0u;
        voucher_get_current_persona_originator_info();
        v110 = 0u;
        v111 = 0u;
        v109 = 0u;
        voucher_get_current_persona_proximate_info();
        v108 = 0;
        v106 = 0u;
        v107 = 0u;
        v104 = 0u;
        v105 = 0u;
        v103 = 0u;
        v102 = 0u;
        v101 = 0u;
        v100 = 0u;
        v99 = 0u;
        v98 = 0u;
        v97 = 0u;
        v96 = 0u;
        v95 = 0u;
        v94 = 0u;
        v93 = 0u;
        v92 = 0u;
        v91 = 0u;
        memset(v90, 0, sizeof(v90));
        memset(v89, 0, sizeof(v89));
        *(_DWORD *)buf = 2;
        v50 = voucher_get_current_persona();
        if (v50 == -1 || (kpersona_info() & 0x80000000) != 0)
        {
          v59 = "NOPERSONA";
          v60 = "<unknown>";
        }
        else
        {
          if ((HIDWORD(v89[0]) - 2) > 4)
            v51 = "<unknown>";
          else
            v51 = (&off_1E8CB3988)[HIDWORD(v89[0]) - 2];
          v59 = v51;
          v60 = (char *)&v92 + 4;
        }
        if (container_log_handle_for_category_onceToken != -1)
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        v53 = qword_1ECD3F350;
        if (!os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_DEFAULT))
        {
LABEL_57:
          v35 = *(_QWORD *)(a1 + 32);
          if ((v35 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
          {
            v36 = 1;
          }
          else
          {
            v37 = v35 - 1;
            if (v37 > 0xD)
              v36 = 0;
            else
              v36 = dword_1CF7FFD6C[v37];
          }
          v38 = (void *)container_xpc_send_sync_message(v36, 0, v4, 1, v16, a1 + 160, (uint64_t)&v62);
          v12 = v38;
          v11 = v38 != 0;
          if (v38)
          {
            value = xpc_dictionary_get_value(v38, "ReplyContainerSet");
            *(_QWORD *)(a1 + 120) = value;
            if (!value)
            {
              v9 = container_error_create(2, 53, 0, 0);
              v10 = (uint64_t)v9;
              v11 = 0;
              goto LABEL_13;
            }
            xpc_retain(value);
            v40 = xpc_dictionary_get_value(v12, "ReplyContainerInfos");
            *(_QWORD *)(a1 + 136) = v40;
            if (v40)
              xpc_retain(v40);
            v41 = xpc_dictionary_get_value(v12, "ReplyContainerTokens");
            *(_QWORD *)(a1 + 128) = v41;
            if (v41)
              xpc_retain(v41);
            *(_QWORD *)(a1 + 144) = xpc_dictionary_get_uint64(v12, "ReplyFlags");
          }
          v10 = (uint64_t)v62;
          if (v62)
            goto LABEL_14;
LABEL_70:
          v13 = 0;
          goto LABEL_71;
        }
        v54 = geteuid();
        v55 = getuid();
        v56 = *(void **)(a1 + 32);
        v57 = *(_QWORD *)(a1 + 96);
        LODWORD(__s) = 67112194;
        HIDWORD(__s) = v50;
        v64 = 2082;
        v65 = v59;
        v66 = 2082;
        v67 = v60;
        v68 = 1024;
        v69 = 0;
        v70 = 1024;
        v71 = 0;
        v72 = 1024;
        v73 = 0;
        v74 = 1024;
        v75 = 0;
        v76 = 1024;
        v77 = v54;
        v78 = 1024;
        v79 = v55;
        v80 = 2048;
        v81 = v56;
        v82 = 2080;
        v83 = v48;
        v84 = 2048;
        v85 = v47;
        v86 = 2048;
        v87 = v57;
        v31 = "Query; personaid = %d, type = %{public}s, name = %{public}s, origin [pid = %d, personaid = %d], proximate "
              "[pid = %d, personaid = %d], euid = %d, uid = %d, class = %llu, identifier = [%s](%zd), flags = %llx";
        v32 = (uint8_t *)&__s;
        v33 = v53;
        v34 = 104;
      }
      _os_log_impl(&dword_1CF7DA000, v33, OS_LOG_TYPE_DEFAULT, v31, v32, v34);
      goto LABEL_57;
    }
LABEL_30:
    xpc_dictionary_set_uuid(v4, "UUID", (const unsigned __int8 *)(a1 + 66));
    goto LABEL_31;
  }
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  v8 = qword_1ECD3F350;
  if (os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    v89[0] = a2;
    _os_log_fault_impl(&dword_1CF7DA000, v8, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: container_query_set_class() is required", buf, 0xCu);
  }
  v9 = container_error_create(3, 38, 0, 0);
  v10 = (uint64_t)v9;
  v11 = 0;
  v12 = 0;
LABEL_13:
  v62 = v9;
  if (!v10)
    goto LABEL_70;
LABEL_14:
  _container_query_replace_error((uint64_t *)a1, v10);
  v11 = 0;
  v13 = v62;
LABEL_71:
  container_error_free(v13);
  if (v4)
    xpc_release(v4);
  if (v12)
    xpc_release(v12);
  return v11;
}

void container_error_free(_QWORD *a1)
{
  NSObject *v2;
  const char *v3;
  void *v4;
  _QWORD *__s;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C874D8];
  __s = a1;
  if (a1)
  {
    if (a1[4])
    {
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v2 = qword_1ECD3F350;
      if (os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v7 = "container_error_free";
        v3 = "%s: SPI MISUSE: Attempt to free container_error_extended_t that is owned by a container_query_t. Ignoring.";
LABEL_12:
        _os_log_fault_impl(&dword_1CF7DA000, v2, OS_LOG_TYPE_FAULT, v3, buf, 0xCu);
      }
    }
    else if (a1[5])
    {
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v2 = qword_1ECD3F350;
      if (os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v7 = "container_error_free";
        v3 = "%s: SPI MISUSE: Attempt to free container_error_extended_t that is owned by a container_references_t. Ignoring.";
        goto LABEL_12;
      }
    }
    else
    {
      v4 = (void *)a1[2];
      if (v4)
      {
        free(v4);
        memset_s(a1 + 2, 8uLL, 0, 8uLL);
      }
      free(a1);
      memset_s(&__s, 8uLL, 0, 8uLL);
    }
  }
}

uint64_t container_xpc_send_sync_message(int a1, void *a2, void *a3, int a4, int a5, uint64_t a6, uint64_t a7)
{
  char v8;
  uint64_t v9;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2000000000;
  v15 = 0;
  v11[0] = MEMORY[0x1E0C87450];
  v11[1] = 0x40000000;
  if (a4)
    v8 = 2;
  else
    v8 = 0;
  v11[2] = __container_xpc_send_sync_message_block_invoke;
  v11[3] = &unk_1E8CB2A98;
  v11[5] = a6;
  v11[6] = a7;
  v11[4] = &v12;
  container_xpc_send_message(a1, a2, a3, a5, v8, (uint64_t)v11);
  v9 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v9;
}

void container_xpc_send_message(int a1, void *a2, xpc_object_t xdict, int a4, char a5, uint64_t a6)
{
  void *v12;
  void (**v13)(uint64_t, int, void *, void *, int, char, uint64_t);
  uint64_t v14;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  _BOOL8 v19;
  __int128 v20;
  int v21;

  if (!xpc_dictionary_get_value(xdict, "ProxyForClient"))
  {
    if (_container_xpc_pthread_key_for_client_context_key)
    {
      v12 = pthread_getspecific(_container_xpc_pthread_key_for_client_context_key);
      if (v12)
        container_xpc_encode_client_onto_message(xdict, (uint64_t)v12);
    }
  }
  if (_outgoingPostprocessor)
    (*(void (**)(void))(_outgoingPostprocessor + 16))();
  v16 = 0;
  v17 = &v16;
  v18 = 0x3800000000;
  v19 = (a5 & 3) == 2;
  v20 = xmmword_1CF7FFDB0;
  v21 = 6;
  v13 = (void (**)(uint64_t, int, void *, void *, int, char, uint64_t))_outgoingSender;
  v14 = MEMORY[0x1E0C87450];
  do
  {
    v15[0] = v14;
    v15[1] = 0x40000000;
    v15[2] = __container_xpc_send_message_block_invoke;
    v15[3] = &unk_1E8CB2A70;
    v15[4] = a6;
    v15[5] = &v16;
    v13[2]((uint64_t)v13, a1, a2, xdict, a4, a5, (uint64_t)v15);
  }
  while (*((_BYTE *)v17 + 24));
  _Block_object_dispose(&v16, 8);
}

void _block_invoke(uint64_t a1, int a2, void *a3, void *a4, int a5, char a6, uint64_t a7)
{
  uint64_t v12;
  uid_t v13;
  BOOL v14;
  int v15;
  _QWORD *v16;
  NSObject *v17;
  const char *v18;
  _QWORD *v19;
  BOOL v20;
  xpc_connection_t *v21;
  uint64_t v22;
  _xpc_connection_s *v23;
  xpc_object_t v24;
  uint64_t pid;
  _QWORD *v26;
  NSObject *global_queue;
  _QWORD v28[7];
  uint64_t v29;

  if ((a2 - 2) >= 2)
  {
    if (a2)
    {
      if (a2 == 1)
      {
        v12 = 1;
LABEL_23:
        v15 = 1;
        goto LABEL_24;
      }
      v16 = container_error_create(3, 38, 0, 0);
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v17 = qword_1ECD3F348;
      if (!os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_ERROR))
      {
LABEL_18:
        if (v16)
        {
LABEL_19:
          (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD *))(a7 + 16))(a7, 0, 0, v16);
          v19 = v16;
LABEL_35:
          container_error_free(v19);
          return;
        }
LABEL_22:
        v12 = 0;
        goto LABEL_23;
      }
      LOWORD(v28[0]) = 0;
      v18 = "Undefined disposition value.";
    }
    else
    {
      v16 = container_error_create(3, 74, 0, 0);
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v17 = qword_1ECD3F348;
      if (!os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_ERROR))
        goto LABEL_18;
      LOWORD(v28[0]) = 0;
      v18 = "Disposition unsupported.";
    }
    _os_log_error_impl(&dword_1CF7DA000, v17, OS_LOG_TYPE_ERROR, v18, (uint8_t *)v28, 2u);
    if (v16)
      goto LABEL_19;
    goto LABEL_22;
  }
  v13 = getuid();
  v12 = 0;
  if (a5)
    v14 = v13 == a5;
  else
    v14 = 1;
  v15 = v14;
LABEL_24:
  v29 = 1;
  if (gContainerXPCUsesSharedConnection)
    v20 = v15 == 0;
  else
    v20 = 1;
  if (v20)
    v21 = (xpc_connection_t *)container_xpc_create_connection((void *)v12, a3, a5, &v29);
  else
    v21 = (xpc_connection_t *)container_xpc_shared_copy_connection(v12, (uint64_t)a3, &v29);
  v22 = (uint64_t)v21;
  if (!v21)
  {
    v26 = container_error_create(2, v29, 0, 0);
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD *))(a7 + 16))(a7, 0, 0, v26);
    v19 = v26;
    goto LABEL_35;
  }
  v23 = *v21;
  if ((a6 & 1) != 0)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v28[0] = MEMORY[0x1E0C87450];
    v28[1] = 0x40000000;
    v28[2] = ___container_xpc_default_sender_block_invoke;
    v28[3] = &unk_1E8CB2B40;
    v28[4] = a7;
    v28[5] = v22;
    xpc_connection_send_message_with_reply(v23, a4, global_queue, v28);
  }
  else
  {
    v24 = xpc_connection_send_message_with_reply_sync(*v21, a4);
    pid = xpc_connection_get_pid(v23);
    (*(void (**)(uint64_t, xpc_object_t, uint64_t, _QWORD))(a7 + 16))(a7, v24, pid, 0);
    container_xpc_release(v22);
    if (v24)
      xpc_release(v24);
  }
}

void container_xpc_release(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  dispatch_time_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t __s;
  _BYTE block[24];
  void *v20;
  _BYTE v21[20];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C874D8];
  __s = a1;
  if (!a1)
    return;
  os_unfair_lock_lock_with_options();
  --*(_QWORD *)(a1 + 40);
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  v2 = qword_1ECD3F348;
  if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_DEBUG))
  {
    v9 = *(_QWORD *)(a1 + 8);
    v10 = *(void **)(a1 + 16);
    v11 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)block = 134218752;
    *(_QWORD *)&block[4] = a1;
    *(_WORD *)&block[12] = 2048;
    *(_QWORD *)&block[14] = v9;
    *(_WORD *)&block[22] = 2048;
    v20 = v10;
    *(_WORD *)v21 = 2048;
    *(_QWORD *)&v21[2] = v11;
    _os_log_debug_impl(&dword_1CF7DA000, v2, OS_LOG_TYPE_DEBUG, "connection <%p/%lld/%lld> released; cnt = %lld",
      block,
      0x2Au);
  }
  if (!*(_BYTE *)(a1 + 25))
  {
    v3 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(a1 + 24))
    {
      if (v3 != 2)
        goto LABEL_8;
      if (_container_xpc_invalidate_shared_connection_after_timeout_onceToken != -1)
        dispatch_once(&_container_xpc_invalidate_shared_connection_after_timeout_onceToken, &__block_literal_global_9);
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v5 = qword_1ECD3F348;
      if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_DEBUG))
      {
        v15 = *(_QWORD *)(a1 + 8);
        v16 = *(void **)(a1 + 16);
        v17 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)block = 134219008;
        *(_QWORD *)&block[4] = a1;
        *(_WORD *)&block[12] = 2048;
        *(_QWORD *)&block[14] = v15;
        *(_WORD *)&block[22] = 2048;
        v20 = v16;
        *(_WORD *)v21 = 2048;
        *(_QWORD *)&v21[2] = 2;
        *(_WORD *)&v21[10] = 2048;
        *(_QWORD *)&v21[12] = v17;
        _os_log_debug_impl(&dword_1CF7DA000, v5, OS_LOG_TYPE_DEBUG, "connection <%p/%lld/%lld> will be canceled in %lld seconds; cnt = %lld",
          block,
          0x34u);
      }
      v6 = mach_absolute_time();
      v7 = *(_QWORD *)(a1 + 40) + 1;
      *(_QWORD *)(a1 + 32) = v6;
      *(_QWORD *)(a1 + 40) = v7;
      *(_QWORD *)block = MEMORY[0x1E0C87450];
      *(_QWORD *)&block[8] = 0x40000000;
      *(_QWORD *)&block[16] = ___container_xpc_invalidate_shared_connection_after_timeout_block_invoke_11;
      v20 = &__block_descriptor_tmp_12;
      *(_QWORD *)v21 = a1;
      *(_QWORD *)&v21[8] = v6;
      v8 = dispatch_time(0, 2000000000);
      dispatch_after(v8, (dispatch_queue_t)_container_xpc_invalidate_shared_connection_after_timeout_queue, block);
    }
    else
    {
      if (v3 != 1)
        goto LABEL_8;
      xpc_connection_cancel(*(xpc_connection_t *)a1);
    }
  }
  v3 = *(_QWORD *)(a1 + 40);
LABEL_8:
  if (v3 <= 0)
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v4 = qword_1ECD3F348;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_DEBUG))
    {
      v12 = *(_QWORD *)(a1 + 8);
      v13 = *(void **)(a1 + 16);
      v14 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)block = 134218752;
      *(_QWORD *)&block[4] = a1;
      *(_WORD *)&block[12] = 2048;
      *(_QWORD *)&block[14] = v12;
      *(_WORD *)&block[22] = 2048;
      v20 = v13;
      *(_WORD *)v21 = 2048;
      *(_QWORD *)&v21[2] = v14;
      _os_log_debug_impl(&dword_1CF7DA000, v4, OS_LOG_TYPE_DEBUG, "connection <%p/%lld/%lld> freed; cnt = %lld",
        block,
        0x2Au);
    }
    xpc_release(*(xpc_object_t *)a1);
    free((void *)a1);
    memset_s(&__s, 8uLL, 0, 8uLL);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&gSharedClientConnectionLock);
}

void __container_xpc_send_message_block_invoke(uint64_t a1, xpc_object_t object, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v12;
  NSObject *v13;
  int v14;
  int v15;
  const char *v16;
  unsigned int v17;
  int v18;
  int v19;
  uint64_t v20;
  _QWORD *v21;
  xpc_object_t dictionary;
  _QWORD *v23;
  unsigned int v24;
  NSObject *v25;
  int v26;
  int v27;
  xpc_object_t xdict;
  uint8_t buf[4];
  int v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C874D8];
  if (a4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    return;
  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  xdict = object;
  v8 = *(unsigned __int8 *)(v7 + 24);
  if (*(_BYTE *)(v7 + 24))
    *(_BYTE *)(v7 + 24) = 0;
  v9 = _incomingPreprocessor;
  if (_incomingPreprocessor)
  {
    xpc_retain(object);
    (*(void (**)(uint64_t, xpc_object_t *))(v9 + 16))(v9, &xdict);
    object = xdict;
  }
  v10 = MEMORY[0x1D17D6434](object);
  if (v10 == MEMORY[0x1E0C89000] && xdict == (xpc_object_t)MEMORY[0x1E0C88FA0])
  {
    if (v8)
    {
      v17 = *(_DWORD *)(v7 + 36);
      if (v17 < *(_DWORD *)(v7 + 40))
      {
        *(_BYTE *)(v7 + 24) = 1;
        *(_DWORD *)(v7 + 36) = v17 + 1;
        if (container_log_handle_for_category_onceToken != -1)
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        v13 = container_log_handle_for_category_logHandles[0];
        if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_ERROR))
        {
          v18 = *(_DWORD *)(v7 + 36);
          v19 = *(_DWORD *)(v7 + 40);
          *(_DWORD *)buf = 67109376;
          v30 = v18;
          v31 = 1024;
          v32 = v19;
          v16 = "XPC connection to containermanagerd invalidated. Retry attempt %d of %d";
          goto LABEL_25;
        }
LABEL_48:
        if (*(_BYTE *)(v7 + 24))
          goto LABEL_50;
        goto LABEL_49;
      }
    }
    v20 = 51;
    goto LABEL_31;
  }
  if (v10 == MEMORY[0x1E0C89000] && xdict == (xpc_object_t)MEMORY[0x1E0C88F98])
  {
    if (v8)
    {
      v12 = *(_DWORD *)(v7 + 28);
      if (v12 < *(_DWORD *)(v7 + 32))
      {
        *(_BYTE *)(v7 + 24) = 1;
        *(_DWORD *)(v7 + 28) = v12 + 1;
        if (container_log_handle_for_category_onceToken != -1)
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        v13 = container_log_handle_for_category_logHandles[0];
        if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_ERROR))
        {
          v14 = *(_DWORD *)(v7 + 28);
          v15 = *(_DWORD *)(v7 + 32);
          *(_DWORD *)buf = 67109376;
          v30 = v14;
          v31 = 1024;
          v32 = v15;
          v16 = "XPC connection to containermanagerd interrupted. Retry attempt %d of %d";
LABEL_25:
          _os_log_error_impl(&dword_1CF7DA000, v13, OS_LOG_TYPE_ERROR, v16, buf, 0xEu);
          goto LABEL_48;
        }
        goto LABEL_48;
      }
    }
    v20 = 52;
    goto LABEL_31;
  }
  if (v10 == MEMORY[0x1E0C89000] && xdict == (xpc_object_t)MEMORY[0x1E0C88FB0])
  {
    v20 = 101;
LABEL_31:
    v21 = container_error_create(2, v20, 0, 0);
    goto LABEL_32;
  }
  v20 = 50;
  if (v10 != MEMORY[0x1E0C88FE8] || MEMORY[0x1E0C89000] == MEMORY[0x1E0C88FE8])
    goto LABEL_31;
  dictionary = xpc_dictionary_get_dictionary(xdict, "ReplyErrorExtended");
  if (!dictionary)
    goto LABEL_47;
  v23 = container_xpc_decode_error(dictionary, 1);
  v21 = v23;
  if (v8 && v23)
  {
    if (*v23 == 107)
    {
      v24 = *(_DWORD *)(v7 + 44);
      if (v24 < *(_DWORD *)(v7 + 48))
      {
        *(_BYTE *)(v7 + 24) = 1;
        *(_DWORD *)(v7 + 44) = v24 + 1;
        if (container_log_handle_for_category_onceToken != -1)
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        v25 = container_log_handle_for_category_logHandles[0];
        if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_ERROR))
        {
          v26 = *(_DWORD *)(v7 + 44);
          v27 = *(_DWORD *)(v7 + 48);
          *(_DWORD *)buf = 67109376;
          v30 = v26;
          v31 = 1024;
          v32 = v27;
          _os_log_error_impl(&dword_1CF7DA000, v25, OS_LOG_TYPE_ERROR, "containermanagerd state reset, retry requested. Retry attempt %d of %d", buf, 0xEu);
        }
        container_error_free(v21);
        goto LABEL_48;
      }
    }
LABEL_33:
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD *))(v6 + 16))(v6, 0, 0, v21);
    container_error_free(v21);
    if (v8)
      *(_BYTE *)(v7 + 24) = 0;
    goto LABEL_50;
  }
LABEL_32:
  if (v21)
    goto LABEL_33;
LABEL_47:
  if (v8)
    goto LABEL_48;
LABEL_49:
  (*(void (**)(uint64_t, xpc_object_t, uint64_t, _QWORD))(v6 + 16))(v6, xdict, a3, 0);
LABEL_50:
  if (v9)
    xpc_release(xdict);
}

xpc_object_t *container_xpc_shared_copy_connection(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  xpc_object_t **v6;
  xpc_object_t *v7;
  NSObject *v8;
  NSObject *v10;
  xpc_object_t v11;
  uint64_t v12;
  uint8_t buf[4];
  xpc_object_t *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  xpc_object_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C874D8];
  v12 = 1;
  os_unfair_lock_lock((os_unfair_lock_t)&gSharedClientConnectionLock);
  v6 = (xpc_object_t **)&gSharedClientConnection[6 * a1 + a2];
  v7 = *v6;
  if (*v6 || (v7 = container_xpc_create_connection((void *)a1, (void *)a2, 0, &v12), (*v6 = v7) != 0))
  {
    v7[5] = (char *)v7[5] + 1;
    *((_BYTE *)v7 + 24) = 1;
    v7[4] = (xpc_object_t)mach_absolute_time();
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v8 = qword_1ECD3F348;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_DEBUG))
    {
      v11 = v7[5];
      *(_DWORD *)buf = 134218752;
      v14 = v7;
      v15 = 2048;
      v16 = a1;
      v17 = 2048;
      v18 = a2;
      v19 = 2048;
      v20 = v11;
      _os_log_debug_impl(&dword_1CF7DA000, v8, OS_LOG_TYPE_DEBUG, "connection <%p/%lld/%lld> shared; cnt = %lld",
        buf,
        0x2Au);
    }
  }
  else
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v10 = qword_1ECD3F348;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218496;
      v14 = (xpc_object_t *)a1;
      v15 = 2048;
      v16 = a2;
      v17 = 2048;
      v18 = v12;
      _os_log_error_impl(&dword_1CF7DA000, v10, OS_LOG_TYPE_ERROR, "failed to generate connection for sharing of type %lld, purpose %lld: %lld", buf, 0x20u);
    }
    v7 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&gSharedClientConnectionLock);
  if (a3)
    *a3 = v12;
  return v7;
}

xpc_object_t __container_xpc_send_sync_message_block_invoke(uint64_t a1, xpc_object_t object, int a3, uint64_t a4)
{
  _DWORD *v6;
  xpc_object_t result;

  v6 = *(_DWORD **)(a1 + 40);
  if (v6)
    *v6 = a3;
  if (a4 && *(_QWORD *)(a1 + 48))
    **(_QWORD **)(a1 + 48) = container_error_create(*(_QWORD *)(a4 + 8), *(_QWORD *)a4, *(char **)(a4 + 16), *(_DWORD *)(a4 + 24));
  if (object)
    result = xpc_retain(object);
  else
    result = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

xpc_object_t *container_xpc_create_connection(void *a1, void *a2, int a3, uint64_t *a4)
{
  const char *v8;
  xpc_connection_t mach_service;
  xpc_connection_t v10;
  xpc_object_t *v11;
  xpc_object_t *v12;
  _BOOL4 v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  xpc_object_t v18;
  xpc_object_t v19;
  xpc_object_t v20;
  _QWORD v21[6];
  uint8_t buf[4];
  xpc_object_t *v23;
  __int16 v24;
  xpc_object_t v25;
  __int16 v26;
  xpc_object_t v27;
  __int16 v28;
  xpc_object_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C874D8];
  if (a1 == (void *)1)
    v8 = "com.apple.containermanagerd.system";
  else
    v8 = "com.apple.containermanagerd";
  mach_service = xpc_connection_create_mach_service(v8, 0, 0);
  if (!mach_service)
  {
    v12 = 0;
    v13 = 1;
    v16 = 19;
    if (!a4)
      return v12;
    goto LABEL_19;
  }
  v10 = mach_service;
  __xpc_connection_set_logging();
  v11 = (xpc_object_t *)malloc_type_calloc(1uLL, 0x30uLL, 0x1020040B750F859uLL);
  v12 = v11;
  v13 = v11 == 0;
  if (v11)
  {
    v11[1] = a1;
    v11[2] = a2;
    *((_WORD *)v11 + 12) = 0;
    v11[4] = (xpc_object_t)mach_absolute_time();
    v12[5] = (xpc_object_t)2;
    *v12 = xpc_retain(v10);
    xpc_connection_set_context(v10, v12);
    v14 = xpc_user_sessions_enabled();
    if (a1 != (void *)1 && a3 && v14)
      xpc_connection_set_target_user_session_uid();
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v15 = qword_1ECD3F348;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_DEBUG))
    {
      v18 = v12[1];
      v19 = v12[2];
      v20 = v12[5];
      *(_DWORD *)buf = 134218752;
      v23 = v12;
      v24 = 2048;
      v25 = v18;
      v26 = 2048;
      v27 = v19;
      v28 = 2048;
      v29 = v20;
      _os_log_debug_impl(&dword_1CF7DA000, v15, OS_LOG_TYPE_DEBUG, "connection <%p/%lld/%lld> created; cnt = %lld",
        buf,
        0x2Au);
    }
    v21[0] = MEMORY[0x1E0C87450];
    v21[1] = 0x40000000;
    v21[2] = __container_xpc_create_connection_block_invoke;
    v21[3] = &__block_descriptor_tmp_6;
    v21[4] = v10;
    v21[5] = v12;
    xpc_connection_set_event_handler(v10, v21);
    xpc_connection_resume(v10);
    v16 = 1;
  }
  else
  {
    v16 = 73;
  }
  xpc_release(v10);
  if (a4)
  {
LABEL_19:
    if (v13)
      *a4 = v16;
  }
  return v12;
}

unsigned __int8 *container_xpc_decode_container_object(void *a1, uint64_t *a2)
{
  uint64_t v4;
  const char *string;
  const unsigned __int8 *uuid;
  const unsigned __int8 *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  unsigned __int8 *result;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  uint64_t uint64;
  uint64_t v17;
  void *dictionary;
  void *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  unsigned __int8 v23;
  const char *v24;
  void *v25;
  unsigned __int8 v26;
  BOOL v27;
  xpc_object_t value;
  const char *v29;
  BOOL v30;
  int v31;
  void *__s;
  uint64_t v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C874D8];
  if (MEMORY[0x1D17D6434]() != MEMORY[0x1E0C88FE8])
  {
    v4 = 53;
    goto LABEL_6;
  }
  string = xpc_dictionary_get_string(a1, "ContainerPersonaUniqueString");
  uuid = xpc_dictionary_get_uuid(a1, "ContainerUUID");
  if (!uuid
    || (v7 = uuid, uuid_is_null(uuid))
    || (v12 = xpc_dictionary_get_string(a1, "ContainerUniquePathComponent")) == 0
    || (v13 = v12, (v14 = xpc_dictionary_get_string(a1, "ContainerIdentifier")) == 0)
    || (v15 = v14, uint64 = xpc_dictionary_get_uint64(a1, "ContainerClass"), uint64 - 1 > 0xD))
  {
    v4 = 54;
    goto LABEL_6;
  }
  v17 = uint64;
  v31 = xpc_dictionary_get_uint64(a1, "ContainerUID");
  dictionary = xpc_dictionary_get_dictionary(a1, "ContainerMetadata");
  if (dictionary)
  {
    v19 = dictionary;
    v30 = xpc_dictionary_get_BOOL(dictionary, "ContainerMetadataExisted");
    v29 = xpc_dictionary_get_string(v19, "ContainerMetadataPath");
    value = xpc_dictionary_get_value(v19, "ContainerMetadataInfo");
    v27 = xpc_dictionary_get_BOOL(v19, "ContainerMetadataTransient");
    v20 = xpc_dictionary_get_string(v19, "ContainerMetadataUMARelativePath");
    v21 = xpc_dictionary_get_string(v19, "ContainerMetadataCreator");
    dictionary = (void *)xpc_dictionary_get_string(v19, "ContainerMetadataSandboxToken");
    v22 = v20;
    v23 = v27;
    v25 = value;
    v24 = v29;
    v26 = !v30;
  }
  else
  {
    v24 = 0;
    v25 = 0;
    v23 = 0;
    v22 = 0;
    v21 = 0;
    v26 = 1;
  }
  v4 = 1;
  v33 = 1;
  result = container_object_create(v7, v15, v17, v31, v24, v13, string, v25, (const char *)dictionary, v26, v23, v22, v21, &v33);
  if (!result)
  {
LABEL_6:
    if (!a1)
    {
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v10 = qword_1ECD3F348;
      if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CF7DA000, v10, OS_LOG_TYPE_ERROR, "Could not decode message into container object: NULL", buf, 2u);
      }
      goto LABEL_16;
    }
    v8 = (void *)MEMORY[0x1D17D632C](a1);
    __s = v8;
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v9 = qword_1ECD3F348;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v35 = v8;
      _os_log_error_impl(&dword_1CF7DA000, v9, OS_LOG_TYPE_ERROR, "Could not decode message into container object: %{public}s", buf, 0xCu);
      if (!v8)
      {
LABEL_16:
        result = 0;
        if (a2)
          *a2 = v4;
        return result;
      }
    }
    else if (!v8)
    {
      goto LABEL_16;
    }
    free(v8);
    memset_s(&__s, 8uLL, 0, 8uLL);
    goto LABEL_16;
  }
  return result;
}

void *container_error_create(uint64_t a1, uint64_t a2, char *a3, int a4)
{
  void *v8;
  void *v9;

  v8 = malloc_type_calloc(1uLL, 0x30uLL, 0x1030040588A6FFDuLL);
  v9 = v8;
  if (v8)
    container_error_reinitialize((uint64_t)v8, a1, a2, a3, a4);
  return v9;
}

char *container_error_reinitialize(uint64_t a1, uint64_t a2, uint64_t a3, char *__s1, int a5)
{
  void *v10;
  void *v11;
  char *result;

  v11 = (void *)(a1 + 16);
  v10 = *(void **)(a1 + 16);
  if (v10)
  {
    free(v10);
    memset_s(v11, 8uLL, 0, 8uLL);
  }
  *(_QWORD *)a1 = a3;
  *(_QWORD *)(a1 + 8) = a2;
  if (__s1)
    result = strndup(__s1, 0x400uLL);
  else
    result = 0;
  *(_QWORD *)(a1 + 16) = result;
  *(_DWORD *)(a1 + 24) = a5;
  return result;
}

void *container_xpc_decode_error(void *a1, int a2)
{
  void *v4;
  NSObject *v5;
  void *result;
  uint64_t uint64;
  uint64_t v8;
  char *string;
  int v10;
  void *__s;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C874D8];
  if (MEMORY[0x1D17D6434]() != MEMORY[0x1E0C88FE8]
    || (uint64 = xpc_dictionary_get_uint64(a1, "ErrorType"),
        v8 = xpc_dictionary_get_uint64(a1, "ErrorCategory"),
        string = (char *)xpc_dictionary_get_string(a1, "ErrorPath"),
        v10 = xpc_dictionary_get_uint64(a1, "ErrorPOSIXErrno"),
        !uint64)
    || (result = container_error_create(v8, uint64, string, v10)) == 0)
  {
    v4 = (void *)MEMORY[0x1D17D632C](a1);
    __s = v4;
    if (!a2)
      goto LABEL_6;
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v5 = qword_1ECD3F348;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v13 = v4;
      _os_log_error_impl(&dword_1CF7DA000, v5, OS_LOG_TYPE_ERROR, "Could not decode message into error: %{public}s", buf, 0xCu);
      if (!v4)
        return 0;
    }
    else
    {
LABEL_6:
      if (!v4)
        return 0;
    }
    free(v4);
    memset_s(&__s, 8uLL, 0, 8uLL);
    return 0;
  }
  return result;
}

_QWORD *_container_query_replace_error(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *result;

  v4 = *a1;
  v5 = *(_QWORD *)(a2 + 8);
  if (v4)
  {
    container_error_reinitialize(v4, v5, *(_QWORD *)a2, *(char **)(a2 + 16), *(_DWORD *)(a2 + 24));
    result = (_QWORD *)*a1;
  }
  else
  {
    result = container_error_create(v5, *(_QWORD *)a2, *(char **)(a2 + 16), *(_DWORD *)(a2 + 24));
    *a1 = (uint64_t)result;
  }
  result[4] = a1;
  return result;
}

BOOL container_client_is_sandboxed(uint64_t a1)
{
  __int128 v1;
  NSObject *v3;
  _OWORD v4[2];

  if (a1)
  {
    v1 = *(_OWORD *)(a1 + 64);
    v4[0] = *(_OWORD *)(a1 + 48);
    v4[1] = v1;
    return sandbox_check_by_audit_token() != 0;
  }
  else
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v3 = qword_1ECD3F348;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v4[0]) = 0;
      _os_log_fault_impl(&dword_1CF7DA000, v3, OS_LOG_TYPE_FAULT, "NULL client when fetching sandbox state", (uint8_t *)v4, 2u);
    }
    return 1;
  }
}

uint64_t container_get_persona_unique_string(uint64_t a1)
{
  if (a1)
    return container_object_get_persona_unique_string(a1);
  return a1;
}

unint64_t container_audit_token_get_codesign_status()
{
  return container_codesign_get_status();
}

void *container_client_create_from_audit_token(uint64_t a1, const char *a2, uint64_t *a3)
{
  int v6;
  void *v7;
  _DWORD *v8;
  __int128 v9;
  int platform;
  int v11;
  uint64_t v12;
  char *v13;
  int v14;
  uint64_t v15;
  char *v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  __int128 v21;
  int v22;
  uint64_t v23;
  unint64_t status;
  NSObject *v25;
  uint64_t v27;
  int v28;
  void *__s;
  _BYTE buf[32];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C874D8];
  v6 = *(_DWORD *)(a1 + 20);
  v7 = malloc_type_calloc(1uLL, 0x60uLL, 0x10900405E1FA0D8uLL);
  __s = v7;
  if (v7)
  {
    v8 = v7;
    v9 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)buf = *(_OWORD *)a1;
    *(_OWORD *)&buf[16] = v9;
    platform = container_audit_token_get_platform((uint64_t)buf);
    v8[6] = platform;
    if (platform)
    {
      *(_OWORD *)buf = *(_OWORD *)a1;
      v11 = *(_DWORD *)(a1 + 20);
      v12 = *(_QWORD *)(a1 + 24);
      *(_DWORD *)&buf[16] = *(_DWORD *)(a1 + 16);
      *(_DWORD *)&buf[20] = v11;
      *(_QWORD *)&buf[24] = v12;
      v13 = container_codesign_copy_cs_identity();
      *((_QWORD *)v8 + 1) = v13;
      if (v13)
      {
        *(_QWORD *)v8 = 0;
        *(_OWORD *)buf = *(_OWORD *)a1;
        v14 = *(_DWORD *)(a1 + 20);
        v15 = *(_QWORD *)(a1 + 24);
        *(_DWORD *)&buf[16] = *(_DWORD *)(a1 + 16);
        *(_DWORD *)&buf[20] = v14;
        *(_QWORD *)&buf[24] = v15;
        *((_QWORD *)v8 + 2) = container_codesign_copy_cs_team_identifier();
        if (a2)
          v16 = strdup(a2);
        else
          v16 = 0;
        *((_QWORD *)v8 + 4) = v16;
        v8[10] = *(_DWORD *)(a1 + 4);
        v8[11] = *(_DWORD *)(a1 + 8);
        v21 = *(_OWORD *)(a1 + 16);
        *((_OWORD *)v8 + 3) = *(_OWORD *)a1;
        *((_OWORD *)v8 + 4) = v21;
        v8[20] = *(_DWORD *)(a1 + 20);
        *((_QWORD *)v8 + 11) = 0;
        *(_OWORD *)buf = *(_OWORD *)a1;
        v22 = *(_DWORD *)(a1 + 20);
        v23 = *(_QWORD *)(a1 + 24);
        *(_DWORD *)&buf[16] = *(_DWORD *)(a1 + 16);
        *(_DWORD *)&buf[20] = v22;
        *(_QWORD *)&buf[24] = v23;
        status = container_codesign_get_status();
        *((_WORD *)v8 + 42) = 0;
        *((_BYTE *)v8 + 86) = 0;
        if ((status & 0x8000000000000000) == 0)
        {
          if ((status & 1) != 0)
            *((_BYTE *)v8 + 84) = 1;
          if ((status & 2) != 0)
            *((_BYTE *)v8 + 85) = 1;
          v18 = 1;
          if ((status & 4) != 0)
            *((_BYTE *)v8 + 86) = 1;
          goto LABEL_35;
        }
        if (container_log_handle_for_category_onceToken != -1)
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        v25 = qword_1ECD3F348;
        if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_ERROR))
        {
          v27 = *((_QWORD *)v8 + 1);
          v28 = *__error();
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)&buf[4] = v6;
          *(_WORD *)&buf[8] = 2080;
          *(_QWORD *)&buf[10] = v27;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v28;
          _os_log_error_impl(&dword_1CF7DA000, v25, OS_LOG_TYPE_ERROR, "Could not get code sign status from audit token for pid [%d] identifier [%s]: %{darwin.errno}d", buf, 0x18u);
        }
        v18 = 128;
      }
      else
      {
        if (container_log_handle_for_category_onceToken != -1)
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        v20 = qword_1ECD3F348;
        if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v6;
          _os_log_error_impl(&dword_1CF7DA000, v20, OS_LOG_TYPE_ERROR, "Could not get code sign identifier from audit token to initialize a client object for pid [%d].", buf, 8u);
        }
        v18 = 98;
      }
    }
    else
    {
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v19 = qword_1ECD3F348;
      if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v6;
        _os_log_error_impl(&dword_1CF7DA000, v19, OS_LOG_TYPE_ERROR, "Could not get platform from audit token to initialize a client object for pid [%d].", buf, 8u);
      }
      v18 = 80;
    }
    free(v8);
    memset_s(&__s, 8uLL, 0, 8uLL);
    goto LABEL_35;
  }
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  v17 = qword_1ECD3F348;
  if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v6;
    _os_log_error_impl(&dword_1CF7DA000, v17, OS_LOG_TYPE_ERROR, "Could not allocate memory to initialize a client object for pid [%d].", buf, 8u);
  }
  v18 = 73;
LABEL_35:
  if (a3)
    *a3 = v18;
  return __s;
}

unint64_t container_codesign_get_status()
{
  uint64_t v0;

  if ((csops_audittoken() & 0x80000000) != 0)
    return 0x8000000000000000;
  v0 = 0;
  os_variant_has_internal_content();
  return v0;
}

uint64_t container_audit_token_get_platform(uint64_t a1)
{
  uint64_t active_platform;
  int v3;
  NSObject *v4;
  int v6;
  unsigned int buffer;
  uint8_t buf[4];
  int v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C874D8];
  active_platform = dyld_get_active_platform();
  buffer = 0;
  v3 = *(_DWORD *)(a1 + 20);
  if (proc_pidinfo(v3, 30, 0, &buffer, 4) == 4)
    return buffer;
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  v4 = qword_1ECD3F348;
  if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_ERROR))
  {
    v6 = *__error();
    *(_DWORD *)buf = 67109376;
    v9 = v3;
    v10 = 1024;
    v11 = v6;
    _os_log_error_impl(&dword_1CF7DA000, v4, OS_LOG_TYPE_ERROR, "Unable to fetch platform from client for pid [%d]: %{darwin.errno}d", buf, 0xEu);
  }
  return active_platform;
}

char *container_audit_token_copy_codesign_identifier()
{
  return container_codesign_copy_cs_identity();
}

char *container_codesign_copy_cs_identity()
{
  int v0;
  uint64_t v1;
  char *v2;
  char *v3;
  int v4;
  uint64_t v5;
  char *__s;
  unsigned int size;
  unsigned int size_4;
  char v10[1032];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C874D8];
  v0 = csops_audittoken();
  v1 = bswap32(0);
  size = bswap32(0);
  size_4 = v1;
  if ((v0 & 0x80000000) == 0)
  {
    if (!v0)
      return strndup(v10, v1 - 8);
    return 0;
  }
  if (*__error() != 34)
    return 0;
  v3 = (char *)malloc_type_calloc(1uLL, size_4, 0xA0343387uLL);
  __s = v3;
  v4 = csops_audittoken();
  v5 = bswap32(*((_DWORD *)v3 + 1));
  *(_DWORD *)v3 = bswap32(*(_DWORD *)v3);
  *((_DWORD *)v3 + 1) = v5;
  if (v4)
    v2 = 0;
  else
    v2 = strndup(v3 + 8, v5 - 8);
  free(v3);
  memset_s(&__s, 8uLL, 0, 8uLL);
  return v2;
}

uint64_t container_system_group_path_for_identifier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  uint64_t v7;
  _QWORD block[9];
  _QWORD v10[4];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2000000000;
  v14 = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2000000000;
  v10[3] = 1;
  v6 = _os_activity_create(&dword_1CF7DA000, "container_system_group_path_for_identifier", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C87450];
  block[1] = 0x40000000;
  block[2] = __container_system_group_path_for_identifier_block_invoke;
  block[3] = &unk_1E8CB3258;
  block[6] = a1;
  block[7] = a2;
  block[4] = v10;
  block[5] = &v11;
  block[8] = a3;
  os_activity_apply(v6, block);
  os_release(v6);
  v7 = v12[3];
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(&v11, 8);
  return v7;
}

void container_xpc_encode_container_metadata_as_object(xpc_object_t xdict, BOOL value, char *string, char *a4, xpc_object_t a5, BOOL a6, char *a7, char *a8)
{
  if (a5)
    xpc_dictionary_set_value(xdict, "ContainerMetadataInfo", a5);
  if (string)
    xpc_dictionary_set_string(xdict, "ContainerMetadataPath", string);
  if (a7)
    xpc_dictionary_set_string(xdict, "ContainerMetadataUMARelativePath", a7);
  if (a8)
    xpc_dictionary_set_string(xdict, "ContainerMetadataCreator", a8);
  if (a4)
    xpc_dictionary_set_string(xdict, "ContainerMetadataSandboxToken", a4);
  xpc_dictionary_set_BOOL(xdict, "ContainerMetadataExisted", value);
  xpc_dictionary_set_BOOL(xdict, "ContainerMetadataTransient", a6);
}

void container_xpc_encode_container_as_object(void *a1, char *string, uint64_t a3, unsigned int a4, const unsigned __int8 *a5, const char *a6, const char *a7, void *a8)
{
  xpc_dictionary_set_string(a1, "ContainerIdentifier", string);
  xpc_dictionary_set_uint64(a1, "ContainerClass", a3);
  xpc_dictionary_set_uint64(a1, "ContainerUID", a4);
  xpc_dictionary_set_uuid(a1, "ContainerUUID", a5);
  if (a6)
    xpc_dictionary_set_string(a1, "ContainerUniquePathComponent", a6);
  if (a7)
    xpc_dictionary_set_string(a1, "ContainerPersonaUniqueString", a7);
  if (a8)
    xpc_dictionary_set_value(a1, "ContainerMetadata", a8);
}

uint64_t container_sandbox_issue_custom_extension(uint64_t a1, _OWORD *a2, uint64_t a3)
{
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  NSObject *v9;
  _BYTE v11[32];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C874D8];
  if (a2)
  {
    v5 = a2[1];
    *(_OWORD *)v11 = *a2;
    *(_OWORD *)&v11[16] = v5;
    v6 = sandbox_extension_issue_file_to_process();
  }
  else
  {
    v6 = sandbox_extension_issue_file();
  }
  v7 = v6;
  if (!v6)
  {
    v8 = *__error();
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v9 = qword_1ECD3F340;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F340, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v11 = 136446722;
      *(_QWORD *)&v11[4] = a1;
      *(_WORD *)&v11[12] = 2080;
      *(_QWORD *)&v11[14] = a3;
      *(_WORD *)&v11[22] = 1024;
      *(_DWORD *)&v11[24] = v8;
      _os_log_error_impl(&dword_1CF7DA000, v9, OS_LOG_TYPE_ERROR, "sandbox_extension_issue_file failed for class %{public}s at path [%s]: %d", v11, 0x1Cu);
    }
    *__error() = v8;
  }
  return v7;
}

uint64_t container_system_path_for_identifier(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  _QWORD v7[8];
  _QWORD v8[4];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2000000000;
  v12 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2000000000;
  v8[3] = 1;
  v4 = _os_activity_create(&dword_1CF7DA000, "container_system_path_for_identifier", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  v7[0] = MEMORY[0x1E0C87450];
  v7[1] = 0x40000000;
  v7[2] = __container_system_path_for_identifier_block_invoke;
  v7[3] = &unk_1E8CB3230;
  v7[4] = v8;
  v7[5] = &v9;
  v7[6] = a1;
  v7[7] = a2;
  os_activity_apply(v4, v7);
  os_release(v4);
  v5 = v10[3];
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v9, 8);
  return v5;
}

void ____initialize_container_sandbox_extensions_block_invoke()
{
  uint32_t v0;
  uint32_t v1;
  NSObject *v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C874D8];
  os_map_str_init();
  __initialize_container_sandbox_extensions_queue = (uint64_t)dispatch_queue_create("com.apple.containermanager.sandbox-extensions", 0);
  v0 = notify_register_dispatch("com.apple.containermanagerd.user-invalidated", (int *)&__initialize_container_sandbox_extensions_notify_token, (dispatch_queue_t)__initialize_container_sandbox_extensions_queue, &__block_literal_global_4);
  if (v0)
  {
    v1 = v0;
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v2 = qword_1ECD3F340;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F340, OS_LOG_TYPE_ERROR))
    {
      v3[0] = 67109120;
      v3[1] = v1;
      _os_log_error_impl(&dword_1CF7DA000, v2, OS_LOG_TYPE_ERROR, "Could not register for user invalidated notifications; status = %u",
        (uint8_t *)v3,
        8u);
    }
  }
}

void _container_init()
{
  int container_expected;
  int v1;
  char __value[1040];
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  int v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C874D8];
  _os_feature_enabled_impl();
  bzero(__value, 0x410uLL);
  container_expected = sandbox_get_container_expected();
  if (container_expected)
  {
    v1 = container_expected;
    v3 = 0;
    v7 = 0u;
    v8 = 0u;
    v5 = 0u;
    v6 = 0u;
    v4 = 0u;
    os_log_type_enabled(MEMORY[0x1E0C88E98], OS_LOG_TYPE_ERROR);
    v9 = 67109120;
    v10 = v1;
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
  }
}

uint64_t container_xpc_encode_error(void *a1, uint64_t a2)
{
  container_xpc_encode_error_as_object(a1, *(_QWORD *)a2, *(_QWORD *)(a2 + 8), *(const char **)(a2 + 16), *(_DWORD *)(a2 + 24));
  return 1;
}

uint64_t container_xpc_encode_error_as_object(void *a1, uint64_t value, uint64_t a3, const char *a4, int a5)
{
  xpc_dictionary_set_uint64(a1, "ErrorType", value);
  xpc_dictionary_set_uint64(a1, "ErrorCategory", a3);
  if (a4)
    xpc_dictionary_set_string(a1, "ErrorPath", a4);
  xpc_dictionary_set_uint64(a1, "ErrorPOSIXErrno", a5);
  return 1;
}

BOOL container_codesign_get_self_audit_token(task_info_t task_info_out)
{
  kern_return_t v1;
  NSObject *v2;
  uint8_t v4[12];
  mach_msg_type_number_t task_info_outCnt;

  task_info_outCnt = 8;
  v1 = task_info(*MEMORY[0x1E0C883F0], 0xFu, task_info_out, &task_info_outCnt);
  if (v1)
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v2 = qword_1ECD3F340;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F340, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl(&dword_1CF7DA000, v2, OS_LOG_TYPE_ERROR, "Failed to fetch our own audit token", v4, 2u);
    }
  }
  return v1 == 0;
}

xpc_object_t container_client_copy_entitlement(char *key, uint64_t a2)
{
  xpc_object_t value;
  __int128 v5;
  NSObject *v6;
  _OWORD v7[2];

  if (a2)
  {
    if ((*(_BYTE *)a2 & 1) != 0 && (value = *(xpc_object_t *)(a2 + 88)) != 0)
    {
      if (key)
        value = xpc_dictionary_get_value(value, key);
      return xpc_retain(value);
    }
    else
    {
      v5 = *(_OWORD *)(a2 + 64);
      v7[0] = *(_OWORD *)(a2 + 48);
      v7[1] = v5;
      return container_audit_token_copy_entitlement((uint64_t)v7, (uint64_t)key);
    }
  }
  else
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v6 = qword_1ECD3F348;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v7[0]) = 0;
      _os_log_fault_impl(&dword_1CF7DA000, v6, OS_LOG_TYPE_FAULT, "NULL client when fetching entitlements", (uint8_t *)v7, 2u);
    }
    return 0;
  }
}

void *container_audit_token_copy_entitlement(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  v3 = xpc_copy_entitlement_for_token();
  v4 = (void *)v3;
  if (!a2 && v3 && MEMORY[0x1D17D6434](v3) != MEMORY[0x1E0C88FE8])
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v5 = qword_1ECD3F348;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_1CF7DA000, v5, OS_LOG_TYPE_ERROR, "Could not get entitlements for client", v7, 2u);
    }
    xpc_release(v4);
    return 0;
  }
  return v4;
}

uint64_t container_realpath(uint64_t a1, char *a2, size_t a3)
{
  return container_realpathat(4294967294, a1, a2, a3);
}

void container_xpc_encode_client_onto_message(void *a1, uint64_t a2)
{
  xpc_object_t v3;
  void *v4;

  v3 = container_client_copy_encoded_xpc_object(a2, 0);
  if (v3)
  {
    v4 = v3;
    xpc_dictionary_set_value(a1, "ProxyForClient", v3);
    xpc_release(v4);
  }
}

void container_xpc_encode_container_object(void *a1, uint64_t a2, char *a3)
{
  xpc_object_t v6;
  char v7;
  char *path;
  uint64_t v9;
  void *v10;
  xpc_object_t dictionary;
  unsigned __int8 v12;
  char *user_managed_assets_relative_path;
  char *creator_codesign_identifier;
  char *identifier;
  _DWORD *v16;
  unsigned int uid;
  const unsigned __int8 *uuid;
  const char *unique_path_component;
  const char *persona_unique_string;

  v6 = xpc_dictionary_create(0, 0, 0);
  v7 = container_object_is_new(a2) ^ 1;
  path = (char *)container_object_get_path(a2);
  v9 = *(_QWORD *)(a2 + 88);
  if (v9 && (v10 = *(void **)(v9 + 136)) != 0)
    dictionary = xpc_array_get_dictionary(v10, *(unsigned int *)(a2 + 96));
  else
    dictionary = *(xpc_object_t *)(a2 + 80);
  v12 = container_object_is_transient(a2);
  user_managed_assets_relative_path = (char *)container_object_get_user_managed_assets_relative_path(a2);
  creator_codesign_identifier = (char *)container_object_get_creator_codesign_identifier(a2);
  container_xpc_encode_container_metadata_as_object(v6, v7, path, a3, dictionary, v12, user_managed_assets_relative_path, creator_codesign_identifier);
  identifier = (char *)container_object_get_identifier(a2);
  v16 = container_object_get_class(a2);
  uid = container_object_get_uid(a2);
  uuid = (const unsigned __int8 *)container_object_get_uuid(a2);
  unique_path_component = (const char *)container_object_get_unique_path_component(a2);
  persona_unique_string = (const char *)container_object_get_persona_unique_string(a2);
  container_xpc_encode_container_as_object(a1, identifier, (uint64_t)v16, uid, uuid, unique_path_component, persona_unique_string, v6);
  if (v6)
    xpc_release(v6);
}

void container_xpc_encode_container_array(void *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  xpc_object_t v7;

  if (a3)
  {
    v3 = a3;
    do
    {
      v6 = *a2++;
      v7 = xpc_dictionary_create(0, 0, 0);
      container_xpc_encode_container_object(v7, v6, 0);
      xpc_array_append_value(a1, v7);
      xpc_release(v7);
      --v3;
    }
    while (v3);
  }
}

void *container_xpc_decode_create_container_object_array(void *a1, _QWORD *a2, _QWORD *a3)
{
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  size_t count;
  void *v11;
  BOOL v12;
  _QWORD applier[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2000000000;
  v21 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2000000000;
  v17 = 1;
  if (MEMORY[0x1D17D6434]() == MEMORY[0x1E0C88FC0])
  {
    count = xpc_array_get_count(a1);
    if (count <= 1)
      count = 1;
    v11 = malloc_type_calloc(count, 8uLL, 0x2004093837F09uLL);
    v6 = v11;
    if (!v11)
    {
      v7 = v15;
      v8 = 73;
      goto LABEL_4;
    }
    applier[0] = MEMORY[0x1E0C87450];
    applier[1] = 0x40000000;
    applier[2] = __container_xpc_decode_create_container_object_array_block_invoke;
    applier[3] = &unk_1E8CB1EA0;
    applier[4] = &v14;
    applier[5] = &v18;
    applier[6] = v11;
    v12 = xpc_array_apply(a1, applier);
    v7 = v15;
    if (v12)
    {
      if (v15[3] == 1)
        goto LABEL_7;
      goto LABEL_5;
    }
  }
  else
  {
    v6 = 0;
    v7 = v15;
  }
  v8 = 53;
LABEL_4:
  v7[3] = v8;
LABEL_5:
  container_free_array_of_containers(v6, v19[3]);
  v19[3] = 0;
  v6 = 0;
  if (a3)
    *a3 = v15[3];
LABEL_7:
  if (a2)
    *a2 = v19[3];
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  return v6;
}

unsigned __int8 *__container_xpc_decode_create_container_object_array_block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  unsigned __int8 *result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = 1;
  result = container_xpc_decode_container_object(a3, &v7);
  if (result)
  {
    *(_QWORD *)(a1[6] + 8 * *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24)) = result;
    v5 = *(_QWORD *)(a1[5] + 8);
    v6 = *(_QWORD *)(v5 + 24);
    if (*(_QWORD *)(a1[6] + 8 * v6))
    {
      *(_QWORD *)(v5 + 24) = v6 + 1;
      return (unsigned __int8 *)1;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v7;
  }
  return result;
}

uint64_t container_error_is_fatal()
{
  return 0;
}

uint64_t container_error_get_path(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

uint64_t container_error_get_type(uint64_t a1)
{
  if (a1)
    return *(_QWORD *)a1;
  else
    return 1;
}

uint64_t container_error_get_category(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

uint64_t container_error_get_posix_errno(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

void *container_error_copy(uint64_t a1)
{
  return container_error_create(*(_QWORD *)(a1 + 8), *(_QWORD *)a1, *(char **)(a1 + 16), *(_DWORD *)(a1 + 24));
}

const char *container_get_error_description(unint64_t a1)
{
  if (a1 > 0x99)
    return "UNKNOWN";
  else
    return off_1E8CB1EC0[a1];
}

uint64_t container_error_is_file_system_error(uint64_t a1)
{
  uint64_t result;

  result = 0;
  switch(a1)
  {
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 12:
    case 13:
    case 14:
    case 15:
    case 17:
    case 22:
    case 23:
    case 25:
    case 26:
    case 27:
    case 28:
    case 30:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 41:
    case 42:
    case 43:
    case 48:
    case 56:
    case 61:
    case 62:
    case 63:
    case 64:
    case 66:
    case 70:
    case 71:
    case 82:
    case 84:
    case 85:
    case 86:
    case 87:
    case 92:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 109:
    case 122:
    case 123:
    case 125:
    case 127:
    case 129:
    case 130:
    case 132:
    case 144:
    case 145:
    case 146:
    case 152:
    case 153:
      result = 1;
      break;
    default:
      return result;
  }
  return result;
}

size_t container_frozenset_copyout_external_bytes(_QWORD *__src, void *__dst, size_t a3)
{
  size_t v3;

  v3 = __src[2];
  if (__dst && v3 <= a3)
  {
    memcpy(__dst, __src, v3);
    *((_BYTE *)__dst + 5) = 1;
    return __src[2];
  }
  return v3;
}

_BYTE *container_frozenset_create_from_external_bytes(const void *a1, size_t a2, char a3)
{
  _BYTE *v5;

  if ((a3 & 1) == 0)
  {
    v5 = malloc_type_calloc(1uLL, a2, 0xCC1879BBuLL);
    memcpy(v5, a1, a2);
    v5[5] = 0;
    return v5;
  }
  return a1;
}

uint64_t container_frozenset_get_count(uint64_t result)
{
  if (result)
    return *(unsigned int *)(result + 8);
  return result;
}

uint64_t container_frozenset_get_generation(uint64_t result)
{
  if (result)
    return *(unsigned int *)(result + 12);
  return result;
}

uint64_t container_frozenset_get_uuid_of_container_at_index(uint64_t result, unsigned int a2)
{
  if (result)
  {
    if (*(_DWORD *)(result + 8) > a2)
      result += 24 * a2 + 24;
    else
      return 0;
  }
  return result;
}

uint64_t container_frozenset_get_is_new_of_container_at_index(uint64_t result, unsigned int a2)
{
  if (result)
  {
    if (*(_DWORD *)(result + 8) <= a2)
      return 0;
    else
      return *(unsigned __int8 *)(result + 24 * a2 + 40) >> 7;
  }
  return result;
}

uint64_t container_frozenset_get_is_transient_of_container_at_index(uint64_t result, unsigned int a2)
{
  if (result)
  {
    if (*(_DWORD *)(result + 8) <= a2)
      return 0;
    else
      return (*(unsigned __int8 *)(result + 24 * a2 + 40) >> 6) & 1;
  }
  return result;
}

uint64_t container_frozenset_get_container_class_of_container_at_index(uint64_t result, unsigned int a2)
{
  if (result)
  {
    if (*(_DWORD *)(result + 8) <= a2)
      return 0;
    else
      return *(_DWORD *)(result + 24 * a2 + 40) & 0x3FLL;
  }
  return result;
}

uint64_t container_frozenset_get_uid_of_container_at_index(uint64_t result, unsigned int a2)
{
  if (result)
  {
    if (*(_DWORD *)(result + 8) <= a2)
      return 0;
    else
      return *(unsigned int *)(result + 24 * a2 + 44);
  }
  return result;
}

unint64_t container_frozenset_get_creator_of_container_at_index(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  if (!a1)
    return 0;
  v2 = *(_DWORD *)(a1 + 8);
  if (v2 <= a2 || (*(_BYTE *)(a1 + 24 + 24 * a2 + 17) & 0x20) != 0)
    return 0;
  else
    return container_string_rom_string_at_index(a1 + 24 + 24 * v2, 6 * a2 + 5);
}

unint64_t container_frozenset_get_stored_string(uint64_t a1, const char *a2)
{
  uint64_t v2;
  unint64_t v3;

  if (a1
    && a2
    && (v2 = a1 + 24 * *(unsigned int *)(a1 + 8) + 24,
        v3 = container_string_rom_index_of(v2, a2),
        (v3 & 0x8000000000000000) == 0))
  {
    return container_string_rom_string_at_index(v2, v3);
  }
  else
  {
    return 0;
  }
}

uint64_t container_frozenset_enumerate_matches(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  size_t count;
  void *v12;
  xpc_object_t *v13;
  size_t v14;
  void *v15;
  unsigned int v16;
  unsigned int v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  size_t v23;
  unint64_t v24;
  uint64_t v25;
  _QWORD v27[7];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  void *__s;

  if (!a1)
    return 0;
  v6 = a1 + 24;
  v7 = a1 + 24 + 24 * *(unsigned int *)(a1 + 8);
  v8 = container_string_rom_index_of(v7, *(const char **)(a2 + 16));
  if (*(_QWORD *)(a2 + 16))
  {
    if ((v8 & 0x8000000000000000) != 0)
      return 0;
  }
  v9 = container_string_rom_string_at_index(v7, v8);
  __s = 0;
  v10 = *(void **)(a2 + 24);
  if (v10)
  {
    count = xpc_array_get_count(v10);
    v13 = (xpc_object_t *)(a2 + 32);
    v12 = *(void **)(a2 + 32);
    if (!v12)
      goto LABEL_9;
    goto LABEL_8;
  }
  count = 0;
  v13 = (xpc_object_t *)(a2 + 32);
  v12 = *(void **)(a2 + 32);
  if (v12)
  {
LABEL_8:
    v12 = (void *)xpc_array_get_count(v12);
LABEL_9:
    if ((unint64_t)v12 + count <= 1)
      v14 = 1;
    else
      v14 = (size_t)v12 + count;
    __s = malloc_type_calloc(v14, 8uLL, 0x50040EE9192B6uLL);
    v28 = 0;
    v29 = &v28;
    v30 = 0x2000000000;
    v31 = 0;
    v27[0] = MEMORY[0x1E0C87450];
    v27[1] = 0x40000000;
    v27[2] = __container_frozenset_enumerate_matches_block_invoke;
    v27[3] = &unk_1E8CB2398;
    v27[5] = v7;
    v27[6] = __s;
    v27[4] = &v28;
    v15 = *(void **)(a2 + 24);
    if (v15)
      xpc_array_apply(v15, v27);
    if (*v13)
      xpc_array_apply(*v13, v27);
    count = v29[3];
    if (count)
    {
      _Block_object_dispose(&v28, 8);
      goto LABEL_18;
    }
    if (__s)
    {
      free(__s);
      memset_s(&__s, 8uLL, 0, 8uLL);
    }
    _Block_object_dispose(&v28, 8);
    return 0;
  }
LABEL_18:
  v16 = *(_DWORD *)(a1 + 8);
  v18 = *(unsigned int *)(a2 + 40);
  v17 = *(_DWORD *)(a2 + 44);
  if (v16 < v17)
    v17 = *(_DWORD *)(a1 + 8);
  if (v18 < v17)
  {
    do
    {
      if (*(_BYTE *)(a2 + 13) && *(_QWORD *)a2 != (*(_DWORD *)(v6 + 24 * v18 + 16) & 0x3F))
        goto LABEL_43;
      if (*(_BYTE *)(a2 + 14) && *(_DWORD *)(a2 + 8) != (*(_DWORD *)(v6 + 24 * v18 + 20) != 0))
        goto LABEL_43;
      if (*(_BYTE *)(a2 + 15) && *(_BYTE *)(a2 + 12) != ((*(_DWORD *)(v6 + 24 * v18 + 16) >> 6) & 1))
        goto LABEL_43;
      if (*(_QWORD *)(a2 + 16))
      {
        v19 = (*(_BYTE *)(v6 + 24 * v18 + 17) & 2) != 0
            ? 0
            : container_string_rom_string_at_index(v6 + 24 * v16, (6 * v18) | 1);
        if (v19 != v9)
          goto LABEL_43;
      }
      if (__s)
      {
        v20 = *(unsigned int *)(a1 + 8);
        if (v18 >= v20 || (*(_BYTE *)(v6 + 24 * v18 + 17) & 1) != 0)
        {
          v21 = 0;
          if (!count)
            goto LABEL_43;
        }
        else
        {
          v21 = container_string_rom_string_at_index(v6 + 24 * v20, (6 * v18));
          if (!count)
            goto LABEL_43;
        }
        v22 = __s;
        v23 = count;
        while (v21 != *v22)
        {
          ++v22;
          if (!--v23)
            goto LABEL_43;
        }
      }
      if (!(*(unsigned int (**)(uint64_t, unint64_t))(a3 + 16))(a3, v18))
      {
        v25 = 0;
        goto LABEL_48;
      }
LABEL_43:
      ++v18;
      v16 = *(_DWORD *)(a1 + 8);
      LODWORD(v24) = *(_DWORD *)(a2 + 44);
      if (v16 >= v24)
        v24 = v24;
      else
        v24 = v16;
    }
    while (v18 < v24);
  }
  v25 = 1;
LABEL_48:
  if (__s)
  {
    free(__s);
    memset_s(&__s, 8uLL, 0, 8uLL);
  }
  return v25;
}

uint64_t __container_frozenset_enumerate_matches_block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  const char *string_ptr;
  unint64_t v6;

  if (MEMORY[0x1D17D6434](a3) == MEMORY[0x1E0C89020])
    string_ptr = xpc_string_get_string_ptr(a3);
  else
    string_ptr = 0;
  v6 = container_string_rom_index_of(a1[5], string_ptr);
  if ((v6 & 0x8000000000000000) == 0)
    *(_QWORD *)(a1[6] + 8 * (*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24))++) = container_string_rom_string_at_index(a1[5], v6);
  return 1;
}

BOOL container_fs_item_exists_at(int a1, const char *a2, int *a3)
{
  int v5;
  NSObject *v6;
  int v8;
  stat v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C874D8];
  memset(&v9, 0, sizeof(v9));
  v5 = fstatat(a1, a2, &v9, 32);
  if (a3)
    *a3 = *__error();
  if (v5 && *__error() != 2 && *__error() != 20)
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v6 = container_log_handle_for_category_logHandles[0];
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_ERROR))
    {
      v8 = *__error();
      *(_DWORD *)buf = 136380931;
      v11 = a2;
      v12 = 1024;
      v13 = v8;
      _os_log_error_impl(&dword_1CF7DA000, v6, OS_LOG_TYPE_ERROR, "Failed to determine if %{private}s exists: %{darwin.errno}d", buf, 0x12u);
    }
  }
  return v5 == 0;
}

BOOL container_fs_item_exists(const char *a1, int *a2)
{
  int v4;
  NSObject *v5;
  int v7;
  stat v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C874D8];
  memset(&v8, 0, sizeof(v8));
  v4 = lstat(a1, &v8);
  if (a2)
    *a2 = *__error();
  if (v4 && *__error() != 2 && *__error() != 20)
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v5 = container_log_handle_for_category_logHandles[0];
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_ERROR))
    {
      v7 = *__error();
      *(_DWORD *)buf = 136380931;
      v10 = a1;
      v11 = 1024;
      v12 = v7;
      _os_log_error_impl(&dword_1CF7DA000, v5, OS_LOG_TYPE_ERROR, "Failed to determine if %{private}s exists: %{darwin.errno}d", buf, 0x12u);
    }
  }
  return v4 == 0;
}

uint64_t container_fs_load_plist_at(int a1, const char *a2)
{
  int v2;
  int v3;
  size_t v4;
  int64_t v5;
  uint64_t v6;
  int v7;
  char *v8;
  char *v9;
  off_t v10;
  ssize_t v11;
  void *__s;

  __s = 0;
  v2 = openat(a1, a2, 0x1000000);
  if ((v2 & 0x80000000) == 0)
  {
    v3 = v2;
    v4 = lseek(v2, 0, 2);
    if ((v4 & 0x8000000000000000) == 0)
    {
      v5 = v4;
      if (v4 > 0xA00000)
      {
        v6 = 0;
        v7 = 27;
LABEL_21:
        close(v3);
        goto LABEL_22;
      }
      v8 = (char *)malloc_type_calloc(1uLL, v4, 0xA0F1ED12uLL);
      __s = v8;
      if (v8)
      {
        v9 = v8;
        if (v5)
        {
          v10 = 0;
          v7 = 0;
          while (1)
          {
            v11 = pread(v3, &v9[v10], v5 - v10, v10);
            if (v11 < 0)
            {
              v7 = *__error();
              if (v7 != 4)
              {
                v6 = 0;
                goto LABEL_20;
              }
            }
            else
            {
              if (!v11)
              {
                v6 = 0;
                v7 = 70;
                goto LABEL_20;
              }
              v10 += v11;
            }
            if (v10 >= v5)
              goto LABEL_17;
          }
        }
        v7 = 0;
LABEL_17:
        v6 = xpc_create_from_plist();
LABEL_20:
        free(v9);
        memset_s(&__s, 8uLL, 0, 8uLL);
        goto LABEL_21;
      }
    }
    v6 = 0;
    v7 = *__error();
    goto LABEL_21;
  }
  v6 = 0;
  v7 = *__error();
LABEL_22:
  *__error() = v7;
  return v6;
}

uint64_t container_realpathat(uint64_t a1, uint64_t a2, char *a3, size_t a4)
{
  uint64_t result;
  int *v9;
  __int128 v10;
  uint64_t v11;
  _BYTE v12[12];
  char v13[1028];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C874D8];
  if (a2 && a3)
  {
    v11 = 0;
    v10 = xmmword_1CF7FFD28;
    bzero(v12, 0x410uLL);
    if ((_DWORD)a1 == -2)
      result = (*((uint64_t (**)(uint64_t, __int128 *, _BYTE *, uint64_t, uint64_t))gCMFSSeam + 50))(a2, &v10, v12, 1039, 32);
    else
      result = (*((uint64_t (**)(uint64_t, uint64_t, __int128 *, _BYTE *, uint64_t, uint64_t))gCMFSSeam + 51))(a1, a2, &v10, v12, 1039, 32);
    v13[1024] = 0;
    if (!(_DWORD)result)
    {
      if (strlcpy(a3, v13, a4) <= a4)
      {
        return 0;
      }
      else
      {
        *a3 = 0;
        v9 = __error();
        result = 0;
        *v9 = 63;
      }
    }
  }
  else
  {
    *__error() = 22;
    return 0xFFFFFFFFLL;
  }
  return result;
}

const char *container_fs_add_path_component(const char *result, uint64_t a2, size_t __n)
{
  const char *v5;

  if (result)
  {
    v5 = result;
    result = (const char *)strnlen(result, __n);
    if ((unint64_t)result < __n - 1 && result && v5[(_QWORD)result - 1] != 47)
      (result++)[(_QWORD)v5] = 47;
    if (*(_BYTE *)a2 == 47 && *(_BYTE *)(a2 + 1))
      ++a2;
    if ((unint64_t)result < __n - 1)
      return (const char *)strlcpy((char *)&result[(_QWORD)v5], (const char *)a2, __n - (_QWORD)result);
  }
  return result;
}

uint64_t container_fs_resolve_dirent_type_at(int a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  int v4;
  unsigned int v5;
  stat v7;

  v2 = *(unsigned __int8 *)(a2 + 20);
  if (!*(_BYTE *)(a2 + 20))
  {
    memset(&v7, 0, sizeof(v7));
    v3 = fstatat(a1, (const char *)(a2 + 21), &v7, 0);
    v2 = 0;
    if (!v3)
    {
      v4 = v7.st_mode & 0xF000;
      if (v4 == 0x4000)
      {
        return 4;
      }
      else
      {
        if (v4 == 40960)
          v5 = 10;
        else
          v5 = 0;
        if (v4 == 0x8000)
          return 8;
        else
          return v5;
      }
    }
  }
  return v2;
}

void *container_fs_path_at(int a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *__s;

  v4 = malloc_type_calloc(0x401uLL, 1uLL, 0x100004077774924uLL);
  v5 = v4;
  __s = v4;
  if (v4)
  {
    if (fcntl(a1, 50, v4, __s))
    {
      free(v5);
      memset_s(&__s, 8uLL, 0, 8uLL);
      return 0;
    }
    else if (a2)
    {
      container_fs_add_path_component((const char *)v5, a2, 0x400uLL);
    }
  }
  return v5;
}

size_t container_fs_append_trailing_slash(const char *a1, size_t a2)
{
  size_t result;

  result = strnlen(a1, a2);
  if (!result || result < a2 - 1 && a1[result - 1] != 47)
    *(_WORD *)&a1[result] = 47;
  return result;
}

uint64_t container_retry_test(uint64_t a1, char a2)
{
  return container_test_set_locks_and_restart(a1, a2, 0);
}

uint64_t container_test_set_locks_and_restart(uint64_t a1, char a2, uint64_t a3)
{
  NSObject *v6;
  uint64_t v7;
  _QWORD v9[7];
  char v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2000000000;
  v14 = 1;
  v6 = _os_activity_create(&dword_1CF7DA000, "container_retry_test", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  v9[0] = MEMORY[0x1E0C87450];
  v9[1] = 0x40000000;
  v9[2] = __container_test_set_locks_and_restart_block_invoke;
  v9[3] = &unk_1E8CB23C0;
  v9[5] = a1;
  v9[6] = a3;
  v10 = a2;
  v9[4] = &v11;
  os_activity_apply(v6, v9);
  os_release(v6);
  container_log_error((uint64_t)"container_test_set_locks_and_restart", gClientFaultLoggingEnabled, v12[3]);
  v7 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v7;
}

void __container_test_set_locks_and_restart_block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  int v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v7 = 0;
  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "Command", 0x19uLL);
  xpc_dictionary_set_uint64(v2, "NumRetryCrashes", *(_QWORD *)(a1 + 40));
  xpc_dictionary_set_uint64(v2, "TestLock", *(_QWORD *)(a1 + 48));
  if (*(_BYTE *)(a1 + 56))
    v3 = 1;
  else
    v3 = 2;
  v4 = (void *)container_xpc_send_sync_message(v3, (void *)4, v2, 1, 0, 0, (uint64_t)&v7);
  v5 = v7;
  if (!v4)
  {
    if (v7)
      v6 = *(_QWORD *)v7;
    else
      v6 = 1;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v6;
  }
  container_error_free(v5);
  if (v2)
    xpc_release(v2);
  if (v4)
    xpc_release(v4);
}

uint64_t container_set_test_lock(uint64_t a1, char a2)
{
  NSObject *v4;
  uint64_t v5;
  _QWORD block[6];
  char v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2000000000;
  v12 = 1;
  v4 = _os_activity_create(&dword_1CF7DA000, "container_set_test_lock", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C87450];
  block[1] = 0x40000000;
  block[2] = __container_set_test_lock_block_invoke;
  block[3] = &unk_1E8CB23E8;
  v8 = a2;
  block[4] = &v9;
  block[5] = a1;
  os_activity_apply(v4, block);
  os_release(v4);
  container_log_error((uint64_t)"container_set_test_lock", gClientFaultLoggingEnabled, v10[3]);
  v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

void __container_set_test_lock_block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v6 = 0;
  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "Command", 0x1FuLL);
  xpc_dictionary_set_uint64(v2, "TestLock", *(_QWORD *)(a1 + 40));
  xpc_dictionary_set_BOOL(v2, "Enable", *(_BYTE *)(a1 + 48));
  v3 = (void *)container_xpc_send_sync_message(2, (void *)4, v2, 1, 0, 0, (uint64_t)&v6);
  v4 = v6;
  if (!v3)
  {
    if (v6)
      v5 = *(_QWORD *)v6;
    else
      v5 = 1;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
  }
  container_error_free(v4);
  if (v2)
    xpc_release(v2);
  if (v3)
    xpc_release(v3);
}

char *container_codesign_copy_cs_team_identifier()
{
  int v0;
  uint64_t v1;
  char *v2;
  char *v3;
  int v4;
  uint64_t v5;
  char *__s;
  unsigned int size;
  unsigned int size_4;
  char v10[1032];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C874D8];
  v0 = csops_audittoken();
  v1 = bswap32(0);
  size = bswap32(0);
  size_4 = v1;
  if ((v0 & 0x80000000) == 0)
  {
    if (!v0)
      return strndup(v10, v1 - 8);
    return 0;
  }
  if (*__error() != 34)
    return 0;
  v3 = (char *)malloc_type_calloc(1uLL, size_4, 0x6FE8AB66uLL);
  __s = v3;
  v4 = csops_audittoken();
  v5 = bswap32(*((_DWORD *)v3 + 1));
  *(_DWORD *)v3 = bswap32(*(_DWORD *)v3);
  *((_DWORD *)v3 + 1) = v5;
  if (v4)
    v2 = 0;
  else
    v2 = strndup(v3 + 8, v5 - 8);
  free(v3);
  memset_s(&__s, 8uLL, 0, 8uLL);
  return v2;
}

char *container_codesign_copy_current_identifier()
{
  integer_t task_info_out[4];
  __int128 v2;

  *(_OWORD *)task_info_out = 0u;
  v2 = 0u;
  if (!container_codesign_get_self_audit_token(task_info_out))
    return 0;
  getpid();
  return container_codesign_copy_cs_identity();
}

_QWORD *container_client_initializer(uint64_t a1, const char *a2, const char *a3, int a4, const char *a5, int a6, int a7, _OWORD *a8, int a9, char a10, char a11, char a12, xpc_object_t object, uint64_t *a14)
{
  _QWORD *v22;
  _QWORD *v23;
  char *v24;
  NSObject *v25;
  const char *v26;
  uint8_t *v27;
  uint64_t v28;
  NSObject *v29;
  char v30;
  char *v31;
  __int128 v32;
  __int16 v34[8];
  uint8_t buf[2];
  __int16 v36;

  if (!a2)
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v25 = qword_1ECD3F348;
    if (!os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    v36 = 0;
    v26 = "Missing a codesign identifier when trying to initialize a client object.";
    v27 = (uint8_t *)&v36;
    goto LABEL_30;
  }
  if (!a4)
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v25 = qword_1ECD3F348;
    if (!os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    *(_WORD *)buf = 0;
    v26 = "Missing platform when trying to initialize a client object.";
    v27 = buf;
LABEL_30:
    _os_log_error_impl(&dword_1CF7DA000, v25, OS_LOG_TYPE_ERROR, v26, v27, 2u);
LABEL_13:
    v28 = 80;
    goto LABEL_14;
  }
  v22 = malloc_type_calloc(1uLL, 0x60uLL, 0x10900405E1FA0D8uLL);
  if (v22)
  {
    v23 = v22;
    *v22 = a1;
    v22[1] = strdup(a2);
    if (a3)
      v24 = strdup(a3);
    else
      v24 = 0;
    v30 = a12;
    v23[2] = v24;
    *((_DWORD *)v23 + 6) = a4;
    if (a5)
    {
      v31 = strdup(a5);
      v30 = a12;
    }
    else
    {
      v31 = 0;
    }
    v23[4] = v31;
    *((_DWORD *)v23 + 10) = a6;
    *((_DWORD *)v23 + 11) = a7;
    v32 = a8[1];
    *((_OWORD *)v23 + 3) = *a8;
    *((_OWORD *)v23 + 4) = v32;
    *((_DWORD *)v23 + 20) = a9;
    *((_BYTE *)v23 + 84) = a10;
    *((_BYTE *)v23 + 85) = a11;
    *((_BYTE *)v23 + 86) = v30;
    v23[11] = 0;
    if ((a1 & 1) != 0 && object)
      v23[11] = xpc_retain(object);
    return v23;
  }
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  v29 = qword_1ECD3F348;
  if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_ERROR))
  {
    v34[0] = 0;
    _os_log_error_impl(&dword_1CF7DA000, v29, OS_LOG_TYPE_ERROR, "Could not allocate memory to initialize a client object.", (uint8_t *)v34, 2u);
  }
  v28 = 73;
LABEL_14:
  v23 = 0;
  if (a14)
    *a14 = v28;
  return v23;
}

xpc_object_t container_client_copy_encoded_xpc_object(uint64_t a1, _QWORD *a2)
{
  xpc_object_t v3;
  const char *v4;
  xpc_object_t v5;
  NSObject *v7;
  xpc_object_t v8;
  xpc_object_t v9;
  const char *v10;
  xpc_object_t v11;
  xpc_object_t v12;
  xpc_object_t v13;
  xpc_object_t v14;
  xpc_object_t v15;
  void *v16;
  xpc_object_t v17;
  xpc_object_t object;
  uint8_t buf[16];
  xpc_object_t values[10];
  char *keys[2];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C874D8];
  if (a1)
  {
    v3 = xpc_uint64_create(*(_QWORD *)a1);
    object = xpc_string_create(*(const char **)(a1 + 8));
    v4 = *(const char **)(a1 + 16);
    if (v4)
      v5 = xpc_string_create(v4);
    else
      v5 = 0;
    v9 = xpc_uint64_create(*(unsigned int *)(a1 + 24));
    v10 = *(const char **)(a1 + 32);
    if (v10)
      v11 = xpc_string_create(v10);
    else
      v11 = 0;
    v12 = xpc_uint64_create(*(unsigned int *)(a1 + 40));
    v13 = xpc_uint64_create(*(unsigned int *)(a1 + 44));
    v14 = xpc_data_create((const void *)(a1 + 48), 0x20uLL);
    v15 = xpc_int64_create(*(int *)(a1 + 80));
    v16 = *(void **)(a1 + 88);
    if (v16)
      v17 = xpc_retain(v16);
    else
      v17 = 0;
    v24 = xmmword_1E8CB2428;
    v25 = *(_OWORD *)&off_1E8CB2438;
    v26 = xmmword_1E8CB2448;
    *(_OWORD *)keys = xmmword_1E8CB2408;
    v23 = *(_OWORD *)&off_1E8CB2418;
    values[0] = v3;
    values[1] = object;
    values[2] = v5;
    values[3] = v9;
    values[4] = v11;
    values[5] = v12;
    values[6] = v13;
    values[7] = v14;
    values[8] = v15;
    values[9] = v17;
    v8 = xpc_dictionary_create((const char *const *)keys, values, 0xAuLL);
    if (v3)
      xpc_release(v3);
    if (object)
      xpc_release(object);
    if (v5)
      xpc_release(v5);
    if (v9)
      xpc_release(v9);
    if (v11)
      xpc_release(v11);
    if (v12)
      xpc_release(v12);
    if (v13)
      xpc_release(v13);
    if (v14)
      xpc_release(v14);
    if (v15)
      xpc_release(v15);
    if (v17)
      xpc_release(v17);
  }
  else
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v7 = qword_1ECD3F348;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CF7DA000, v7, OS_LOG_TYPE_ERROR, "No client object to encode.", buf, 2u);
    }
    v8 = 0;
    if (a2)
      *a2 = 80;
  }
  return v8;
}

_QWORD *container_client_copy_decoded_from_xpc_object(void *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  uint64_t uint64;
  const char *v9;
  int v10;
  const char *v11;
  int v12;
  int v13;
  _DWORD *data;
  _DWORD *v15;
  xpc_object_t value;
  void *object;
  _QWORD *result;
  uint64_t v19;
  int v20;
  uint64_t v21;
  unint64_t status;
  NSObject *v23;
  int v24;
  int int64;
  const char *string;
  size_t length;
  uint64_t v28;
  __int128 v29;
  int v30;
  _BYTE buf[32];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C874D8];
  v28 = 1;
  if (!a1)
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v6 = qword_1ECD3F348;
    if (!os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    *(_WORD *)buf = 0;
    v7 = "No client xpc object to decode.";
    goto LABEL_23;
  }
  v4 = MEMORY[0x1D17D6434]();
  v5 = MEMORY[0x1E0C88FE8];
  if (v4 != MEMORY[0x1E0C88FE8])
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v6 = qword_1ECD3F348;
    if (!os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    *(_WORD *)buf = 0;
    v7 = "Client xpc object is not a dictionary.";
LABEL_23:
    _os_log_error_impl(&dword_1CF7DA000, v6, OS_LOG_TYPE_ERROR, v7, buf, 2u);
LABEL_24:
    result = 0;
    v19 = 80;
    goto LABEL_25;
  }
  uint64 = xpc_dictionary_get_uint64(a1, "PrivateFlags");
  string = xpc_dictionary_get_string(a1, "CodesignIdentifier");
  v9 = xpc_dictionary_get_string(a1, "CodesignTeamIdentifier");
  v10 = xpc_dictionary_get_uint64(a1, "Platform");
  v11 = xpc_dictionary_get_string(a1, "PersonaUniqueString");
  v12 = xpc_dictionary_get_uint64(a1, "EUID");
  v13 = xpc_dictionary_get_uint64(a1, "EGID");
  length = 0;
  data = xpc_dictionary_get_data(a1, "AuditToken", &length);
  if (length != 32 || (v15 = data) == 0)
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v6 = qword_1ECD3F348;
    if (!os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    *(_WORD *)buf = 0;
    v7 = "Client xpc object has a malformed audit token.";
    goto LABEL_23;
  }
  int64 = xpc_dictionary_get_int64(a1, "PID");
  value = xpc_dictionary_get_value(a1, "Entitlements");
  object = value;
  if (value)
  {
    if (MEMORY[0x1D17D6434](value) != v5)
    {
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v6 = qword_1ECD3F348;
      if (!os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_ERROR))
        goto LABEL_24;
      *(_WORD *)buf = 0;
      v7 = "Client xpc object has a malformed entitlements.";
      goto LABEL_23;
    }
    if ((uint64 & 1) == 0)
    {
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v6 = qword_1ECD3F348;
      if (!os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_ERROR))
        goto LABEL_24;
      *(_WORD *)buf = 0;
      v7 = "Client xpc object cannot set entitlements.";
      goto LABEL_23;
    }
  }
  v29 = *(_OWORD *)v15;
  v20 = v15[5];
  v30 = v15[4];
  v21 = *((_QWORD *)v15 + 3);
  *(_OWORD *)buf = v29;
  *(_DWORD *)&buf[16] = v30;
  *(_DWORD *)&buf[20] = v20;
  *(_QWORD *)&buf[24] = v21;
  status = container_codesign_get_status();
  if ((status & 0x8000000000000000) != 0)
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v23 = qword_1ECD3F348;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_ERROR))
    {
      v24 = *__error();
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&buf[4] = int64;
      *(_WORD *)&buf[8] = 2080;
      *(_QWORD *)&buf[10] = string;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v24;
      _os_log_error_impl(&dword_1CF7DA000, v23, OS_LOG_TYPE_ERROR, "Could not get code sign status from audit token for pid [%d] identifier [%s]: %{darwin.errno}d", buf, 0x18u);
    }
    result = 0;
    v19 = 128;
  }
  else
  {
    *(_OWORD *)buf = *(_OWORD *)v15;
    *(_OWORD *)&buf[16] = *((_OWORD *)v15 + 1);
    result = container_client_initializer(uint64, string, v9, v10, v11, v12, v13, buf, int64, status & 1, (status & 2) != 0, (status & 4) != 0, object, &v28);
    v19 = v28;
  }
LABEL_25:
  if (a2)
  {
    if (v19 != 1)
      *a2 = v19;
  }
  return result;
}

uint64_t container_client_get_codesign_team_identifier(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  if (a1)
    return *(_QWORD *)(a1 + 16);
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  v2 = qword_1ECD3F348;
  if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1CF7DA000, v2, OS_LOG_TYPE_FAULT, "NULL client when fetching code sign team identifier", v3, 2u);
  }
  return 0;
}

uint64_t container_client_get_egid(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  if (a1)
    return *(unsigned int *)(a1 + 44);
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  v2 = qword_1ECD3F348;
  if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1CF7DA000, v2, OS_LOG_TYPE_FAULT, "NULL client when fetching egid", v3, 2u);
  }
  return getegid();
}

BOOL container_client_is_signature_valid(_BOOL8 result)
{
  if (result)
    return *(_BYTE *)(result + 85) != 0;
  return result;
}

BOOL container_client_is_platform_binary(_BOOL8 result)
{
  if (result)
    return *(_BYTE *)(result + 86) != 0;
  return result;
}

BOOL container_client_is_alive(uint64_t a1)
{
  audit_token_t v2;
  audit_token_t v3;

  memset(&v2, 0, sizeof(v2));
  container_client_get_audit_token(a1, &v2);
  v3 = v2;
  return container_audit_token_copy_executable_name(&v3, 0) != 3;
}

char *container_copy_client(uint64_t a1, uint64_t *a2)
{
  char *v4;
  char *v5;
  const char *v6;
  char *v7;
  char *v8;
  __int128 v9;
  xpc_object_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  __int16 v15[8];
  uint8_t buf[16];

  if (a1)
  {
    v4 = (char *)malloc_type_calloc(1uLL, 0x60uLL, 0x10900405E1FA0D8uLL);
    if (v4)
    {
      v5 = v4;
      v6 = *(const char **)(a1 + 8);
      *(_QWORD *)v5 = *(_QWORD *)a1;
      *((_QWORD *)v5 + 1) = strdup(v6);
      v7 = *(char **)(a1 + 16);
      if (v7)
        v7 = strdup(v7);
      *((_QWORD *)v5 + 2) = v7;
      *((_DWORD *)v5 + 6) = *(_DWORD *)(a1 + 24);
      v8 = *(char **)(a1 + 32);
      if (v8)
        v8 = strdup(v8);
      *((_QWORD *)v5 + 4) = v8;
      *((_QWORD *)v5 + 5) = *(_QWORD *)(a1 + 40);
      v9 = *(_OWORD *)(a1 + 64);
      *((_OWORD *)v5 + 3) = *(_OWORD *)(a1 + 48);
      *((_OWORD *)v5 + 4) = v9;
      *((_DWORD *)v5 + 20) = *(_DWORD *)(a1 + 80);
      v5[84] = *(_BYTE *)(a1 + 84);
      *(_WORD *)(v5 + 85) = *(_WORD *)(a1 + 85);
      v10 = *(xpc_object_t *)(a1 + 88);
      if (v10)
        v10 = xpc_retain(v10);
      *((_QWORD *)v5 + 11) = v10;
      return v5;
    }
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v13 = qword_1ECD3F348;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_ERROR))
    {
      v15[0] = 0;
      _os_log_error_impl(&dword_1CF7DA000, v13, OS_LOG_TYPE_ERROR, "Could not allocate memory to initialize a client object.", (uint8_t *)v15, 2u);
    }
    v12 = 73;
  }
  else
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v11 = qword_1ECD3F348;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CF7DA000, v11, OS_LOG_TYPE_ERROR, "NULL client when copying", buf, 2u);
    }
    v12 = 80;
  }
  v5 = 0;
  if (a2)
    *a2 = v12;
  return v5;
}

_QWORD *container_paths_context_create()
{
  _QWORD *v0;
  int64_t v1;
  size_t v2;
  char *v3;
  int v4;
  uid_t pw_uid;
  passwd *v7;
  passwd v8;
  char *__s;

  v0 = malloc_type_calloc(1uLL, 0x30uLL, 0x1030040B3384863uLL);
  v0[5] = _os_activity_create(&dword_1CF7DA000, "container_paths_context_t", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  __s = 0;
  v1 = sysconf(71);
  if (v1 < 1)
  {
    pw_uid = 0;
    v4 = *__error();
    goto LABEL_9;
  }
  v2 = v1;
  v3 = (char *)malloc_type_calloc(v1, 1uLL, 0x100004077774924uLL);
  __s = v3;
  memset(&v8, 0, sizeof(v8));
  v7 = 0;
  if (getpwnam_r("mobile", &v8, v3, v2, &v7) || !v7)
  {
    pw_uid = 0;
    v4 = *__error();
    if (!v3)
      goto LABEL_9;
    goto LABEL_8;
  }
  v4 = 0;
  pw_uid = v8.pw_uid;
  if (v3)
  {
LABEL_8:
    free(v3);
    memset_s(&__s, 8uLL, 0, 8uLL);
  }
LABEL_9:
  if (v4 >= 1)
    *__error() = v4;
  *((_DWORD *)v0 + 8) = pw_uid;
  *v0 = 2;
  v0[2] = 0;
  v0[3] = strdup("com.apple.containermanager.current-persona");
  *((_BYTE *)v0 + 8) = 0;
  return v0;
}

void container_paths_context_set_class(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD v4[6];
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C874D8];
  if (a1)
  {
    v2 = *(NSObject **)(a1 + 40);
    v4[0] = MEMORY[0x1E0C87450];
    v4[1] = 0x40000000;
    v4[2] = __container_paths_context_set_class_block_invoke;
    v4[3] = &__block_descriptor_tmp_184;
    v4[4] = a1;
    v4[5] = a2;
    os_activity_apply(v2, v4);
  }
  else
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v3 = qword_1ECD3F358;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F358, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v6 = "container_paths_context_set_class";
      _os_log_fault_impl(&dword_1CF7DA000, v3, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: context parameter is NULL", buf, 0xCu);
    }
  }
}

uint64_t __container_paths_context_set_class_block_invoke(uint64_t result)
{
  **(_QWORD **)(result + 32) = *(_QWORD *)(result + 40);
  return result;
}

void container_paths_context_set_transient(uint64_t a1, char a2)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD v4[5];
  char v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C874D8];
  if (a1)
  {
    v2 = *(NSObject **)(a1 + 40);
    v4[0] = MEMORY[0x1E0C87450];
    v4[1] = 0x40000000;
    v4[2] = __container_paths_context_set_transient_block_invoke;
    v4[3] = &__block_descriptor_tmp_1;
    v4[4] = a1;
    v5 = a2;
    os_activity_apply(v2, v4);
  }
  else
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v3 = qword_1ECD3F358;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F358, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "container_paths_context_set_transient";
      _os_log_fault_impl(&dword_1CF7DA000, v3, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: context parameter is NULL", buf, 0xCu);
    }
  }
}

uint64_t __container_paths_context_set_transient_block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 8) = *(_BYTE *)(result + 40);
  return result;
}

void container_paths_context_set_flags(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD v4[6];
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C874D8];
  if (a1)
  {
    v2 = *(NSObject **)(a1 + 40);
    v4[0] = MEMORY[0x1E0C87450];
    v4[1] = 0x40000000;
    v4[2] = __container_paths_context_set_flags_block_invoke;
    v4[3] = &__block_descriptor_tmp_2;
    v4[4] = a1;
    v4[5] = a2;
    os_activity_apply(v2, v4);
  }
  else
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v3 = qword_1ECD3F358;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F358, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v6 = "container_paths_context_set_flags";
      _os_log_fault_impl(&dword_1CF7DA000, v3, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: context parameter is NULL", buf, 0xCu);
    }
  }
}

uint64_t __container_paths_context_set_flags_block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 16) = *(_QWORD *)(result + 40);
  return result;
}

void container_paths_context_set_persona_unique_string(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD v4[6];
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C874D8];
  if (a1)
  {
    v2 = *(NSObject **)(a1 + 40);
    v4[0] = MEMORY[0x1E0C87450];
    v4[1] = 0x40000000;
    v4[2] = __container_paths_context_set_persona_unique_string_block_invoke;
    v4[3] = &__block_descriptor_tmp_3;
    v4[4] = a1;
    v4[5] = a2;
    os_activity_apply(v2, v4);
  }
  else
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v3 = qword_1ECD3F358;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F358, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v6 = "container_paths_context_set_persona_unique_string";
      _os_log_fault_impl(&dword_1CF7DA000, v3, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: context parameter is NULL", buf, 0xCu);
    }
  }
}

char *__container_paths_context_set_persona_unique_string_block_invoke(uint64_t a1)
{
  void *v2;
  char *result;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (v2)
  {
    free(v2);
    memset_s((void *)(*(_QWORD *)(a1 + 32) + 24), 8uLL, 0, 8uLL);
  }
  result = *(char **)(a1 + 40);
  if (result)
    result = strndup(result, 0x400uLL);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = result;
  return result;
}

void container_paths_context_set_uid(uint64_t a1, int a2)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD v4[5];
  int v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C874D8];
  if (a1)
  {
    v2 = *(NSObject **)(a1 + 40);
    v4[0] = MEMORY[0x1E0C87450];
    v4[1] = 0x40000000;
    v4[2] = __container_paths_context_set_uid_block_invoke;
    v4[3] = &__block_descriptor_tmp_4;
    v4[4] = a1;
    v5 = a2;
    os_activity_apply(v2, v4);
  }
  else
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v3 = qword_1ECD3F358;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F358, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "container_paths_context_set_uid";
      _os_log_fault_impl(&dword_1CF7DA000, v3, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: context parameter is NULL", buf, 0xCu);
    }
  }
}

uint64_t __container_paths_context_set_uid_block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 32) = *(_DWORD *)(result + 40);
  return result;
}

uint64_t container_paths_context_free(uint64_t result)
{
  uint64_t v1;
  void *v2;
  uint64_t __s;

  __s = result;
  if (result)
  {
    v1 = result;
    os_release(*(void **)(result + 40));
    v2 = *(void **)(v1 + 24);
    if (v2)
    {
      free(v2);
      memset_s((void *)(v1 + 24), 8uLL, 0, 8uLL);
    }
    free((void *)v1);
    return memset_s(&__s, 8uLL, 0, 8uLL);
  }
  return result;
}

unsigned __int8 *container_paths_copy_container_from_path(char *a1, char **a2, void **a3)
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  int *v10;
  char *v11;
  const char *v12;
  unsigned __int8 *v13;
  int v14;
  int *v16;
  unsigned __int8 *v17;
  int v18;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  void *v24;
  char __s1[1025];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C874D8];
  v24 = 0;
  bzero(__s1, 0x401uLL);
  v23 = 0;
  if (!a1)
  {
    v7 = 3;
    v8 = 38;
    v9 = 0;
    v6 = 0;
    goto LABEL_5;
  }
  if (container_realpathat(4294967294, (uint64_t)a1, __s1, 0x400uLL))
  {
    v6 = *__error();
    v7 = 1;
    v8 = 127;
    v9 = a1;
LABEL_5:
    v10 = (int *)container_error_create(v7, v8, v9, v6);
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v24 = v10;
    v14 = -1;
    goto LABEL_6;
  }
  v11 = strndup(__s1, 0x400uLL);
  v23 = v11;
  v12 = &v11[strnlen(v11, 0x400uLL)];
  while (1)
  {
    v14 = open(v11, 0x1000000, v23);
    v16 = __error();
    if (v14 < 0)
    {
      v18 = *v16;
    }
    else
    {
      v17 = container_paths_copy_container_at(v14, 0, 0, &v24);
      if (v17)
      {
        v13 = v17;
        container_object_get_class((uint64_t)v17);
        v10 = (int *)v24;
        goto LABEL_6;
      }
      if (v24)
        v18 = *((_DWORD *)v24 + 6);
      else
        v18 = 14;
      container_error_free(v24);
      v24 = 0;
    }
    if (v18 != 2 && v18 != 20)
    {
      v21 = 1;
      v22 = 127;
      goto LABEL_37;
    }
    v20 = rindex(v11, 47);
    if (!v20)
      break;
    *v20 = 0;
    v12 = &__s1[v20 - v11 + 1];
    if ((v14 & 0x80000000) == 0)
      close(v14);
  }
  v21 = 3;
  v22 = 21;
LABEL_37:
  v10 = (int *)container_error_create(v21, v22, a1, v18);
  v13 = 0;
  v24 = v10;
LABEL_6:
  if (a3 && v10)
  {
    *a3 = container_error_create(*((_QWORD *)v10 + 1), *(_QWORD *)v10, *((char **)v10 + 2), v10[6]);
    v10 = (int *)v24;
  }
  container_log_ext_error((uint64_t)"container_paths_copy_container_from_path", gClientFaultLoggingEnabled, (uint64_t *)v10);
  if ((v14 & 0x80000000) == 0)
    close(v14);
  if (v13 && a2 && v12)
    *a2 = strndup(v12, 0x400uLL);
  if (v11)
  {
    free(v11);
    memset_s(&v23, 8uLL, 0, 8uLL);
  }
  container_error_free(v24);
  return v13;
}

unsigned __int8 *container_paths_copy_container_at(int a1, int a2, unsigned __int8 a3, void **a4)
{
  void *plist_at;
  int v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  NSObject *v13;
  _QWORD *v14;
  unsigned __int8 *v15;
  _QWORD *v16;
  const char *string;
  __darwin_ino64_t v19;
  uint64_t v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  uint64_t v24;
  int64_t int64;
  const char *v26;
  const char *v27;
  xpc_object_t dictionary;
  void *v29;
  xpc_object_t value;
  int v31;
  const char *v32;
  int st_uid;
  NSObject *v34;
  const char *v35;
  char *v36;
  char *v37;
  xpc_object_t v38;
  void *v39;
  xpc_object_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *__s;
  stat buf;
  uuid_t uu;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C874D8];
  v43 = 0;
  __s = 0;
  memset(uu, 0, sizeof(uu));
  plist_at = (void *)container_fs_load_plist_at(a1, ".com.apple.mobile_container_manager.metadata.plist");
  v9 = *__error();
  if (plist_at)
  {
    v10 = MEMORY[0x1D17D6434](plist_at);
    v11 = MEMORY[0x1E0C88FE8];
    if (v10 == MEMORY[0x1E0C88FE8])
    {
      string = xpc_dictionary_get_string(plist_at, "MCMMetadataUUID");
      if (!string)
      {
        v12 = (char *)container_fs_path_at(a1, (uint64_t)".com.apple.mobile_container_manager.metadata.plist");
        __s = v12;
        if (container_log_handle_for_category_onceToken != -1)
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        v24 = container_log_handle_for_category_logHandles[0];
        if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_ERROR))
          goto LABEL_26;
        buf.st_dev = 136380675;
        *(_QWORD *)&buf.st_mode = v12;
        v21 = "Metadata plist [%{private}s] is missing a UUID.";
        v22 = v24;
        v23 = 12;
        goto LABEL_45;
      }
      v19 = (__darwin_ino64_t)string;
      if (uuid_parse(string, uu))
      {
        v12 = (char *)container_fs_path_at(a1, (uint64_t)".com.apple.mobile_container_manager.metadata.plist");
        __s = v12;
        if (container_log_handle_for_category_onceToken != -1)
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        v20 = container_log_handle_for_category_logHandles[0];
        if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_ERROR))
          goto LABEL_26;
        buf.st_dev = 136380931;
        *(_QWORD *)&buf.st_mode = v12;
        WORD2(buf.st_ino) = 2082;
        *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = v19;
        v21 = "Metadata plist [%{private}s] is has a corrupt UUID [%{public}s].";
        v22 = v20;
        v23 = 22;
LABEL_45:
        _os_log_error_impl(&dword_1CF7DA000, v22, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&buf, v23);
LABEL_26:
        v14 = container_error_create(1, 108, v12, 0);
        v15 = 0;
        goto LABEL_27;
      }
      int64 = xpc_dictionary_get_int64(plist_at, "MCMMetadataContentClass");
      v26 = xpc_dictionary_get_string(plist_at, "MCMMetadataIdentifier");
      if (!v26)
      {
        if (container_log_handle_for_category_onceToken != -1)
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        v34 = container_log_handle_for_category_logHandles[0];
        if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_ERROR))
        {
          buf.st_dev = 136380675;
          *(_QWORD *)&buf.st_mode = 0;
          _os_log_error_impl(&dword_1CF7DA000, v34, OS_LOG_TYPE_ERROR, "Metadata plist [%{private}s] is missing an identifier.", (uint8_t *)&buf, 0xCu);
        }
        v12 = 0;
        goto LABEL_26;
      }
      v27 = v26;
      dictionary = xpc_dictionary_get_dictionary(plist_at, "MCMMetadataUserIdentity");
      v41 = int64;
      if (dictionary && (v29 = dictionary, MEMORY[0x1D17D6434]() == v11))
      {
        v32 = xpc_dictionary_get_string(v29, "personaUniqueString");
        st_uid = xpc_dictionary_get_int64(v29, "posixUID");
      }
      else
      {
        value = xpc_dictionary_get_value(plist_at, "MCMMetadataPersona");
        if (value)
        {
          v31 = xpc_uint64_get_value(value);
          v32 = 0;
          if (v31 == 499)
            st_uid = 0;
          else
            st_uid = v31;
        }
        else if ((int64 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
        {
          v32 = 0;
          st_uid = 0;
        }
        else
        {
          memset(&buf, 0, sizeof(buf));
          v32 = 0;
          if (fstat(a1, &buf))
            st_uid = 0;
          else
            st_uid = buf.st_uid;
        }
      }
      v35 = (const char *)container_fs_path_at(a1, 0);
      v12 = (char *)v35;
      __s = (void *)v35;
      if (v35)
      {
        v36 = rindex(v35, 47);
        v37 = strndup(v36 + 1, 0x400uLL);
        v43 = v37;
        if (a2)
          goto LABEL_51;
      }
      else
      {
        v37 = 0;
        if (a2)
        {
LABEL_51:
          v38 = xpc_dictionary_get_dictionary(plist_at, "MCMMetadataInfo");
          if (v38)
          {
            v39 = v38;
            v40 = 0;
          }
          else
          {
            v40 = xpc_dictionary_create(0, 0, 0);
            v39 = v40;
          }
LABEL_56:
          v42 = 1;
          v15 = container_object_create(uu, v27, v41, st_uid, v12, v37, v32, v39, 0, 0, a3, 0, 0, &v42);
          xpc_release(plist_at);
          v14 = 0;
          v16 = 0;
          plist_at = v40;
          if (!v40)
            goto LABEL_8;
LABEL_27:
          xpc_release(plist_at);
          v16 = v14;
          if (!v12)
            goto LABEL_10;
          goto LABEL_9;
        }
      }
      v40 = 0;
      v39 = 0;
      goto LABEL_56;
    }
  }
  v12 = (char *)container_fs_path_at(a1, (uint64_t)".com.apple.mobile_container_manager.metadata.plist");
  __s = v12;
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  v13 = container_log_handle_for_category_logHandles[0];
  if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_ERROR))
  {
    buf.st_dev = 136380931;
    *(_QWORD *)&buf.st_mode = v12;
    WORD2(buf.st_ino) = 1024;
    *(_DWORD *)((char *)&buf.st_ino + 6) = v9;
    _os_log_error_impl(&dword_1CF7DA000, v13, OS_LOG_TYPE_ERROR, "Failed to read metadata plist [%{private}s]: %{darwin.errno}d", (uint8_t *)&buf, 0x12u);
  }
  v14 = container_error_create(1, 12, v12, v9);
  v15 = 0;
  v16 = v14;
  if (plist_at)
    goto LABEL_27;
LABEL_8:
  if (v12)
  {
LABEL_9:
    free(v12);
    memset_s(&__s, 8uLL, 0, 8uLL);
  }
LABEL_10:
  if (!v15 && a4 && v16)
    *a4 = container_error_create(v16[1], *v16, (char *)v16[2], *((_DWORD *)v16 + 6));
  if (v43)
  {
    free(v43);
    memset_s(&v43, 8uLL, 0, 8uLL);
  }
  container_error_free(v16);
  return v15;
}

BOOL container_paths_enumerate_containers_at(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  _BOOL8 v7;
  uint64_t *v8;
  NSObject *v9;
  _QWORD v11[9];
  int v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[4];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint8_t buf[4];
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C874D8];
  v18 = 0;
  v19 = &v18;
  v20 = 0x2000000000;
  v21 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2000000000;
  v17[3] = a2;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2000000000;
  v16 = 0;
  if (a3)
  {
    v4 = *(NSObject **)(a3 + 40);
    v11[0] = MEMORY[0x1E0C87450];
    v11[1] = 0x40000000;
    v11[2] = __container_paths_enumerate_containers_at_block_invoke;
    v11[3] = &unk_1E8CB2598;
    v11[4] = a4;
    v11[5] = &v13;
    v11[7] = &v18;
    v11[8] = a3;
    v12 = a1;
    v11[6] = v17;
    os_activity_apply(v4, v11);
    if (*((_BYTE *)v19 + 24))
    {
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v5 = container_log_handle_for_category_logHandles[0];
      if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446210;
        v23 = "container_paths_enumerate_containers_at";
        _os_log_impl(&dword_1CF7DA000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: success", buf, 0xCu);
      }
    }
    else
    {
      v8 = (uint64_t *)v14[3];
      if (v8)
      {
        container_log_ext_error((uint64_t)"container_paths_enumerate_containers_at", gClientFaultLoggingEnabled, v8);
      }
      else
      {
        if (container_log_handle_for_category_onceToken != -1)
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        v9 = container_log_handle_for_category_logHandles[0];
        if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446210;
          v23 = "container_paths_enumerate_containers_at";
          _os_log_error_impl(&dword_1CF7DA000, v9, OS_LOG_TYPE_ERROR, "%{public}s: failed (errors during enumeration)", buf, 0xCu);
        }
      }
    }
    container_error_free((_QWORD *)v14[3]);
    v7 = *((_BYTE *)v19 + 24) != 0;
  }
  else
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v6 = qword_1ECD3F358;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F358, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "container_paths_enumerate_containers_at";
      _os_log_fault_impl(&dword_1CF7DA000, v6, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: context parameter is NULL", buf, 0xCu);
    }
    v7 = 0;
  }
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v18, 8);
  return v7;
}

void __container_paths_enumerate_containers_at_block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);
  _QWORD *v5;
  const char *v6;
  char v7;
  void *v8;
  int current_persona_originator_info;
  int current_persona_proximate_info;
  int current_persona;
  const char *v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint64_t v16;
  os_signpost_id_t v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  const char *v23;
  NSObject *v24;
  int v25;
  uid_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  int v32;
  uint64_t v33;
  int v34;
  int v35;
  DIR *v36;
  DIR *v37;
  char v38;
  dirent *v39;
  dirent *v40;
  const char *d_name;
  int v42;
  xpc_object_t v43;
  int v44;
  NSObject *v45;
  size_t count;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  char *v52;
  char *v53;
  int v54;
  int v55;
  void *v56;
  int v57;
  const char *v58;
  int v59;
  int v60;
  int v61;
  uid_t v62;
  int v63;
  int v64;
  int v65;
  int v66;
  void *v67;
  char v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  _QWORD block[11];
  int v71;
  char v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  unint64_t v76;
  void *__s;
  uint8_t v78[4];
  int v79;
  __int16 v80;
  const char *v81;
  __int16 v82;
  const char *v83;
  __int16 v84;
  int v85;
  __int16 v86;
  int v87;
  __int16 v88;
  int v89;
  __int16 v90;
  int v91;
  __int16 v92;
  uid_t v93;
  __int16 v94;
  uid_t v95;
  __int16 v96;
  void *v97;
  __int16 v98;
  uint64_t v99;
  __int16 v100;
  uint64_t v101;
  __int16 v102;
  uint64_t v103;
  __int16 v104;
  int v105;
  __int16 v106;
  int v107;
  _BYTE buf[20];
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _BYTE v113[256];
  uint64_t v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  uint64_t v121;

  v121 = *MEMORY[0x1E0C874D8];
  v2 = xpc_array_create(0, 0);
  v76 = 0;
  __s = 0;
  v73 = 0;
  v74 = &v73;
  v75 = 0x2000000000;
  atomic_store(0, &v76);
  if (!*(_QWORD *)(a1 + 32))
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v13 = qword_1ECD3F358;
    if (!os_log_type_enabled((os_log_t)qword_1ECD3F358, OS_LOG_TYPE_FAULT))
      goto LABEL_30;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "container_paths_enumerate_containers_at_block_invoke";
    v14 = "%s: SPI MISUSE: enumerator cannot be NULL";
    goto LABEL_53;
  }
  v3 = *(_QWORD *)(a1 + 64);
  if (!v3)
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v13 = qword_1ECD3F358;
    if (!os_log_type_enabled((os_log_t)qword_1ECD3F358, OS_LOG_TYPE_FAULT))
      goto LABEL_30;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "container_paths_enumerate_containers_at_block_invoke";
    v14 = "%s: SPI MISUSE: context cannot be NULL";
LABEL_53:
    _os_log_fault_impl(&dword_1CF7DA000, v13, OS_LOG_TYPE_FAULT, v14, buf, 0xCu);
LABEL_30:
    v16 = 38;
LABEL_31:
    v17 = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = container_error_create(3, v16, 0, 0);
    v18 = -1;
    goto LABEL_32;
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    v4 = MEMORY[0x1E0C86F98];
  else
    v4 = _container_paths_passthru_dispatch_async;
  if ((unint64_t)(*(_QWORD *)v3 - 1) > 0xD
    || (*(_BYTE *)(v3 + 8)
      ? (v5 = &_container_paths_get_volume_relative_path__transient_relative_paths)
      : (v5 = &_container_paths_get_volume_relative_path__relative_paths),
        (v6 = (const char *)v5[*(_QWORD *)v3]) == 0))
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v15 = qword_1ECD3F358;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F358, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "container_paths_enumerate_containers_at_block_invoke";
      _os_log_fault_impl(&dword_1CF7DA000, v15, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: Unknown container class", buf, 0xCu);
    }
    v16 = 20;
    goto LABEL_31;
  }
  v69 = v4;
  v7 = *(_BYTE *)(v3 + 16);
  v8 = container_fs_path_at(*(_DWORD *)(a1 + 72), (uint64_t)v6);
  __s = v8;
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  if (os_log_type_enabled((os_log_t)qword_1ECD3F358, OS_LOG_TYPE_DEFAULT))
  {
    v68 = v7;
    v119 = 0u;
    v120 = 0u;
    v118 = 0u;
    current_persona_originator_info = voucher_get_current_persona_originator_info();
    v63 = DWORD1(v119);
    v65 = DWORD2(v118);
    v116 = 0u;
    v117 = 0u;
    v115 = 0u;
    current_persona_proximate_info = voucher_get_current_persona_proximate_info();
    v60 = DWORD2(v115);
    v61 = current_persona_proximate_info;
    v59 = DWORD1(v116);
    v114 = 0;
    memset(v113, 0, sizeof(v113));
    v112 = 0u;
    v111 = 0u;
    v110 = 0u;
    v109 = 0u;
    *(_OWORD *)&buf[4] = 0u;
    *(_DWORD *)buf = 2;
    current_persona = voucher_get_current_persona();
    if (current_persona == -1 || (kpersona_info() & 0x80000000) != 0)
    {
      v23 = "<unknown>";
      v12 = "NOPERSONA";
    }
    else
    {
      if ((*(_DWORD *)&buf[8] - 2) > 4)
        v12 = "<unknown>";
      else
        v12 = (&off_1E8CB3988)[*(_DWORD *)&buf[8] - 2];
      v23 = &v113[4];
    }
    v67 = v8;
    v58 = v23;
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v24 = qword_1ECD3F358;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F358, OS_LOG_TYPE_DEFAULT))
    {
      v57 = v65 & ~(current_persona_originator_info >> 31);
      v64 = v63 & ~(current_persona_originator_info >> 31);
      v66 = v60 & ~(v61 >> 31);
      v25 = v59 & ~(v61 >> 31);
      v62 = geteuid();
      v26 = getuid();
      v27 = *(uint64_t **)(a1 + 64);
      v28 = *v27;
      v29 = v27[2];
      v30 = v27[3];
      v31 = *((_DWORD *)v27 + 8);
      LODWORD(v27) = *((unsigned __int8 *)v27 + 8);
      *(_DWORD *)v78 = 67112706;
      v79 = current_persona;
      v80 = 2082;
      v81 = v12;
      v82 = 2082;
      v83 = v58;
      v84 = 1024;
      v85 = v57;
      v86 = 1024;
      v87 = v64;
      v88 = 1024;
      v89 = v66;
      v90 = 1024;
      v91 = v25;
      v92 = 1024;
      v93 = v62;
      v94 = 1024;
      v95 = v26;
      v96 = 2080;
      v97 = v67;
      v98 = 2048;
      v99 = v28;
      v100 = 2048;
      v101 = v29;
      v102 = 2082;
      v103 = v30;
      v104 = 1024;
      v105 = v31;
      v106 = 1024;
      v107 = (int)v27;
      _os_log_impl(&dword_1CF7DA000, v24, OS_LOG_TYPE_DEFAULT, "Enumerate; personaid = %d, type = %{public}s, name = %{public}s, origin [pid = %d, personaid = %d], proximate [p"
        "id = %d, personaid = %d], euid = %d, uid = %d, context<path = [%s], class = %llu, flags = 0x%llx, persona = [%{p"
        "ublic}s], uid = %d, transient = %d>",
        v78,
        0x74u);
    }
    v7 = v68;
  }
  v32 = openat(*(_DWORD *)(a1 + 72), v6, 0x1000000);
  v18 = v32;
  if (v32 < 0)
  {
    v44 = *__error();
    if (v44 == 2)
    {
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v45 = qword_1ECD3F358;
      if (os_log_type_enabled((os_log_t)qword_1ECD3F358, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = __s;
        _os_log_impl(&dword_1CF7DA000, v45, OS_LOG_TYPE_DEFAULT, "[%s] does not exist, assuming no containers.", buf, 0xCu);
      }
      v17 = 0;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    }
    else
    {
      v17 = 0;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = container_error_create(1, 127, (char *)__s, v44);
    }
  }
  else
  {
    v33 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v34 = dup(v32);
    if (v34 < 0)
    {
      v51 = *__error();
      v52 = (char *)container_fs_path_at(v18, 0);
      *(_QWORD *)buf = v52;
      v53 = v52;
      v54 = v51;
    }
    else
    {
      v35 = v34;
      v36 = fdopendir(v34);
      if (v36)
      {
        v37 = v36;
        v38 = v7 & 1;
        while (1)
        {
          v39 = readdir(v37);
          if (!v39)
            break;
          v40 = v39;
          if (container_fs_resolve_dirent_type_at(v18, (uint64_t)v39) == 4)
          {
            v42 = v40->d_name[0];
            d_name = v40->d_name;
            if (v42 != 46)
            {
              v43 = xpc_string_create(d_name);
              xpc_array_append_value(v2, v43);
              if (v43)
                xpc_release(v43);
            }
          }
        }
        closedir(v37);
        count = xpc_array_get_count(v2);
        if (container_log_handle_for_category_onceToken != -1)
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        v17 = os_signpost_id_make_with_pointer((os_log_t)qword_1ECD3F358, *(const void **)(a1 + 64));
        if (container_log_handle_for_category_onceToken != -1)
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v47 = qword_1ECD3F358;
          if (os_signpost_enabled((os_log_t)qword_1ECD3F358))
          {
            v48 = **(_QWORD **)(a1 + 64);
            *(_DWORD *)buf = 134349056;
            *(_QWORD *)&buf[4] = v48;
            _os_signpost_emit_with_name_impl(&dword_1CF7DA000, v47, OS_SIGNPOST_INTERVAL_BEGIN, v17, "Enumerate", " class=%{public, signpost.description:attribute}llu ", buf, 0xCu);
          }
        }
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
        block[0] = MEMORY[0x1E0C87450];
        block[1] = 0x40000000;
        block[2] = __container_paths_enumerate_containers_at_block_invoke_23;
        block[3] = &unk_1E8CB2550;
        v71 = v18;
        v72 = v38;
        v49 = *(_QWORD *)(a1 + 64);
        block[8] = __s;
        block[9] = v49;
        block[10] = v69;
        v50 = *(_QWORD *)(a1 + 48);
        block[4] = *(_QWORD *)(a1 + 32);
        block[5] = v50;
        block[6] = &v73;
        block[7] = v2;
        dispatch_apply(count, 0, block);
        goto LABEL_32;
      }
      v55 = *__error();
      v52 = (char *)container_fs_path_at(v35, 0);
      *(_QWORD *)buf = v52;
      v53 = v52;
      v54 = v55;
    }
    v56 = container_error_create(1, 127, v53, v54);
    if (v52)
    {
      free(v52);
      memset_s(buf, 8uLL, 0, 8uLL);
    }
    v17 = 0;
    *(_QWORD *)(v33 + 24) = v56;
  }
LABEL_32:
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  v19 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v19)
    dispatch_barrier_async_and_wait(v19, &__block_literal_global);
  if (v17)
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    if (v17 != -1)
    {
      v20 = qword_1ECD3F358;
      if (os_signpost_enabled((os_log_t)qword_1ECD3F358))
      {
        v21 = **(_QWORD **)(a1 + 64);
        *(_DWORD *)buf = 134349056;
        *(_QWORD *)&buf[4] = v21;
        _os_signpost_emit_with_name_impl(&dword_1CF7DA000, v20, OS_SIGNPOST_INTERVAL_END, v17, "Enumerate", " class=%{public, signpost.description:attribute}llu ", buf, 0xCu);
      }
    }
  }
  if (atomic_load((unint64_t *)v74 + 3))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  if (__s)
  {
    free(__s);
    memset_s(&__s, 8uLL, 0, 8uLL);
  }
  if (v2)
    xpc_release(v2);
  if ((v18 & 0x80000000) == 0)
    close(v18);
  _Block_object_dispose(&v73, 8);
}

uint64_t _container_paths_passthru_dispatch_async(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
    return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  return result;
}

uint64_t __container_paths_enumerate_containers_at_block_invoke_23(uint64_t a1, size_t a2)
{
  const char *string;
  int v4;
  char *v5;
  int *v6;
  void *v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t (*v10)(uint64_t, _QWORD *);
  uint64_t v11;
  uint64_t v12;
  unsigned __int8 *v14;
  uint64_t (*v15)(uint64_t, _QWORD *);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[8];
  _QWORD v20[9];
  void *v21;

  v21 = 0;
  string = xpc_array_get_string(*(xpc_object_t *)(a1 + 56), a2);
  v4 = openat(*(_DWORD *)(a1 + 88), string, 0x1000000);
  if ((v4 & 0x80000000) == 0)
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_DEBUG)
      && !os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_ERROR))
    {
      v5 = 0;
      goto LABEL_11;
    }
  }
  v5 = (char *)malloc_type_calloc(0x401uLL, 1uLL, 0x100004077774924uLL);
  __strlcpy_chk();
  container_fs_add_path_component(v5, (uint64_t)string, 0x400uLL);
  if ((v4 & 0x80000000) == 0)
  {
LABEL_11:
    v14 = container_paths_copy_container_at(v4, *(unsigned __int8 *)(a1 + 92), *(_BYTE *)(*(_QWORD *)(a1 + 72) + 8), &v21);
    close(v4);
    v15 = *(uint64_t (**)(uint64_t, _QWORD *))(a1 + 80);
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v20[0] = MEMORY[0x1E0C87450];
    v20[1] = 0x40000000;
    v20[2] = __container_paths_enumerate_containers_at_block_invoke_2;
    v20[3] = &unk_1E8CB2500;
    v20[6] = v14;
    v20[7] = v21;
    v20[8] = v5;
    v18 = *(_QWORD *)(a1 + 48);
    v20[4] = v16;
    v20[5] = v18;
    return v15(v17, v20);
  }
  v6 = __error();
  v7 = container_error_create(1, 127, v5, *v6);
  v8 = (unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  do
    v9 = __ldaxr(v8);
  while (__stlxr(v9 + 1, v8));
  v10 = *(uint64_t (**)(uint64_t, _QWORD *))(a1 + 80);
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v19[0] = MEMORY[0x1E0C87450];
  v19[1] = 0x40000000;
  v19[2] = __container_paths_enumerate_containers_at_block_invoke_25;
  v19[3] = &unk_1E8CB2528;
  v19[4] = v11;
  v19[5] = v7;
  v19[6] = v9;
  v19[7] = v5;
  return v10(v12, v19);
}

void *__container_paths_enumerate_containers_at_block_invoke_2(_QWORD *a1)
{
  int v2;
  NSObject *v3;
  unint64_t *v4;
  unint64_t v5;
  char *v6;
  NSObject *v7;
  void *result;
  void *v9;
  void *v10;
  uint64_t v11;
  _BOOL4 v12;
  uint64_t v13;
  char *__s;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  _BYTE v20[10];
  char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C874D8];
  v2 = (*(uint64_t (**)(void))(a1[4] + 16))();
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  v3 = container_log_handle_for_category_logHandles[0];
  if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_DEBUG))
  {
    v11 = a1[8];
    v12 = a1[6] != 0;
    *(_DWORD *)buf = 136446978;
    v16 = "container_paths_enumerate_containers_at";
    v17 = 2080;
    v18 = v11;
    v19 = 1024;
    *(_DWORD *)v20 = v2;
    *(_WORD *)&v20[4] = 1024;
    *(_DWORD *)&v20[6] = v12;
    _os_log_debug_impl(&dword_1CF7DA000, v3, OS_LOG_TYPE_DEBUG, "%{public}s: enumeration of path [%s]: success = %d, found container = %d", buf, 0x22u);
    if (!v2)
      goto LABEL_6;
  }
  else if (!v2)
  {
    goto LABEL_6;
  }
  if (a1[6])
    goto LABEL_16;
LABEL_6:
  v4 = (unint64_t *)(*(_QWORD *)(a1[5] + 8) + 24);
  do
    v5 = __ldaxr(v4);
  while (__stlxr(v5 + 1, v4));
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_ERROR))
  {
    v6 = container_error_copy_unlocalized_description(a1[7]);
    __s = v6;
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v7 = container_log_handle_for_category_logHandles[0];
    if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_ERROR))
    {
      if (!v6)
        goto LABEL_16;
      goto LABEL_15;
    }
    v13 = a1[8];
    *(_DWORD *)buf = 136446978;
    v16 = "container_paths_enumerate_containers_at";
    v17 = 2080;
    v18 = v13;
    v19 = 2048;
    *(_QWORD *)v20 = v5 + 1;
    *(_WORD *)&v20[8] = 2080;
    v21 = v6;
    _os_log_error_impl(&dword_1CF7DA000, v7, OS_LOG_TYPE_ERROR, "%{public}s: enumeration failure processing container [%s][%llu]: %s", buf, 0x2Au);
    if (v6)
    {
LABEL_15:
      free(v6);
      memset_s(&__s, 8uLL, 0, 8uLL);
    }
  }
LABEL_16:
  container_error_free((_QWORD *)a1[7]);
  container_object_free((_QWORD *)a1[6]);
  v10 = (void *)a1[8];
  v9 = a1 + 8;
  result = v10;
  if (v10)
  {
    free(result);
    return (void *)memset_s(v9, 8uLL, 0, 8uLL);
  }
  return result;
}

void *__container_paths_enumerate_containers_at_block_invoke_25(_QWORD *a1)
{
  char *v2;
  NSObject *v3;
  void *result;
  void *v5;
  void *v6;
  uint64_t v7;
  char *__s;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C874D8];
  (*(void (**)(void))(a1[4] + 16))();
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_ERROR))
  {
    v2 = container_error_copy_unlocalized_description(a1[5]);
    __s = v2;
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v3 = container_log_handle_for_category_logHandles[0];
    if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_ERROR))
    {
      if (!v2)
        goto LABEL_9;
      goto LABEL_8;
    }
    v7 = a1[6] + 1;
    *(_DWORD *)buf = 136446722;
    v10 = "container_paths_enumerate_containers_at";
    v11 = 2048;
    v12 = v7;
    v13 = 2080;
    v14 = v2;
    _os_log_error_impl(&dword_1CF7DA000, v3, OS_LOG_TYPE_ERROR, "%{public}s: enumeration failure opening container dir [%llu]: %s", buf, 0x20u);
    if (v2)
    {
LABEL_8:
      free(v2);
      memset_s(&__s, 8uLL, 0, 8uLL);
    }
  }
LABEL_9:
  container_error_free((_QWORD *)a1[5]);
  v6 = (void *)a1[7];
  v5 = a1 + 7;
  result = v6;
  if (v6)
  {
    free(result);
    return (void *)memset_s(v5, 8uLL, 0, 8uLL);
  }
  return result;
}

uint64_t container_paths_copy_container_root_path_for_context(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  _QWORD block[9];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C874D8];
  v9 = 0;
  v10 = &v9;
  v11 = 0x2000000000;
  v12 = 0;
  if (!a3)
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v5 = qword_1ECD3F358;
    if (!os_log_type_enabled((os_log_t)qword_1ECD3F358, OS_LOG_TYPE_FAULT))
      goto LABEL_11;
    *(_DWORD *)buf = 136315138;
    v14 = "container_paths_copy_container_root_path_for_context";
    v6 = "%s: SPI MISUSE: context parameter is NULL";
    goto LABEL_14;
  }
  if ((unint64_t)(*a3 - 1) >= 0xE)
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v5 = qword_1ECD3F358;
    if (!os_log_type_enabled((os_log_t)qword_1ECD3F358, OS_LOG_TYPE_FAULT))
      goto LABEL_11;
    *(_DWORD *)buf = 136315138;
    v14 = "container_paths_copy_container_root_path_for_context";
    v6 = "%s: SPI MISUSE: Unknown container class";
LABEL_14:
    _os_log_fault_impl(&dword_1CF7DA000, v5, OS_LOG_TYPE_FAULT, v6, buf, 0xCu);
LABEL_11:
    v4 = 0;
    goto LABEL_12;
  }
  v3 = a3[5];
  block[0] = MEMORY[0x1E0C87450];
  block[1] = 0x40000000;
  block[2] = __container_paths_copy_container_root_path_for_context_block_invoke;
  block[3] = &unk_1E8CB25C0;
  block[4] = &v9;
  block[5] = a2;
  block[6] = a3;
  block[7] = "container_paths_copy_container_root_path_for_context";
  block[8] = a1;
  os_activity_apply(v3, block);
  v4 = v10[3];
LABEL_12:
  _Block_object_dispose(&v9, 8);
  return v4;
}

void __container_paths_copy_container_root_path_for_context_block_invoke(uint64_t a1)
{
  unint64_t *v2;
  unint64_t v3;
  BOOL v4;
  uint64_t v5;
  BOOL v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  BOOL v11;
  const char *v12;
  unint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  host_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  int v32;
  void *v33;
  void *__s;
  uint8_t buf[4];
  _OWORD v36[21];
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C874D8];
  switch(*(_QWORD *)(a1 + 40))
  {
    case 0:
      v2 = *(unint64_t **)(a1 + 48);
      v3 = *v2;
      if ((*v2 & 0xFFFFFFFFFFFFFFFELL) == 0xC
        || ((v4 = v3 > 8, v5 = (1 << v3) & 0x12A, !v4) ? (v6 = v5 == 0) : (v6 = 1), !v6))
      {
        v7 = strdup("/private/var");
        goto LABEL_8;
      }
      if (!v2[3])
        goto LABEL_63;
      *(_DWORD *)buf = 0;
      v26 = MEMORY[0x1D17D5ED0]();
      if (!host_get_multiuser_config_flags(v26, (uint32_t *)buf) && (*(_DWORD *)buf & 0x80000000) != 0)
        goto LABEL_63;
      v27 = *(const char **)(*(_QWORD *)(a1 + 48) + 24);
      v28 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      if (!v27)
        goto LABEL_61;
      v37 = 0;
      memset(v36, 0, sizeof(v36));
      *(_DWORD *)buf = 2;
      if (!strncmp(v27, "com.apple.containermanager.current-persona", 0x2AuLL))
      {
        if (voucher_get_current_persona() == -1)
          goto LABEL_61;
      }
      else if (container_persona_convert_unique_string_to_persona_uid((uint64_t)v27) == -1)
      {
        *(_QWORD *)(v28 + 24) = 0;
        return;
      }
      v32 = kpersona_info();
      if (!v32 && DWORD1(v36[0]) == 2)
      {
        v33 = malloc_type_calloc(0x401uLL, 1uLL, 0x100004077774924uLL);
        __s = v33;
        if (!kpersona_getpath() || !v33)
          goto LABEL_62;
        free(v33);
        memset_s(&__s, 8uLL, 0, 8uLL);
LABEL_61:
        v33 = 0;
LABEL_62:
        *(_QWORD *)(v28 + 24) = v33;
        goto LABEL_63;
      }
      *(_QWORD *)(v28 + 24) = 0;
      if (v32)
        return;
LABEL_63:
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      {
        v7 = container_pwd_copy_user_home_path(*(_DWORD *)(*(_QWORD *)(a1 + 48) + 32), 1, 0, 0);
        goto LABEL_8;
      }
      return;
    case 1:
      if (*(_QWORD *)(a1 + 64))
      {
        v8 = *(_QWORD *)(a1 + 48);
        v9 = *(_QWORD *)v8;
        if ((*(_QWORD *)v8 & 0xFFFFFFFFFFFFFFFELL) != 0xC
          && ((v4 = v9 > 8, v10 = (1 << v9) & 0x12A, !v4) ? (v11 = v10 == 0) : (v11 = 1), v11))
        {
          if (*(_DWORD *)(v8 + 32) == 501)
          {
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = malloc_type_calloc(0x401uLL, 1uLL, 0x100004077774924uLL);
            strlcpy(*(char **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), *(const char **)(a1 + 64), 0x400uLL);
            container_fs_add_path_component(*(const char **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), (uint64_t)"mobile", 0x400uLL);
          }
          else
          {
            if (container_log_handle_for_category_onceToken != -1)
              dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
            v29 = qword_1ECD3F358;
            if (os_log_type_enabled((os_log_t)qword_1ECD3F358, OS_LOG_TYPE_FAULT))
            {
              v30 = *(_QWORD *)(a1 + 56);
              v31 = *(_DWORD *)(*(_QWORD *)(a1 + 48) + 32);
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&v36[0] = v30;
              WORD4(v36[0]) = 1024;
              *(_DWORD *)((char *)v36 + 10) = v31;
              v19 = "%s: SPI MISUSE: Cannot use CONTAINER_PATHS_PREFIX_TYPE_DATA_VOLUME_MOUNT_POINT with edu mode user %d";
              v20 = v29;
              v21 = 18;
              goto LABEL_40;
            }
          }
        }
        else
        {
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = malloc_type_calloc(0x401uLL, 1uLL, 0x100004077774924uLL);
          strlcpy(*(char **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), *(const char **)(a1 + 64), 0x400uLL);
        }
      }
      else
      {
        if (container_log_handle_for_category_onceToken != -1)
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        v22 = qword_1ECD3F358;
        if (os_log_type_enabled((os_log_t)qword_1ECD3F358, OS_LOG_TYPE_FAULT))
        {
          v24 = *(_QWORD *)(a1 + 56);
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&v36[0] = v24;
          v19 = "%s: SPI MISUSE: prefix parameter is NULL";
          goto LABEL_39;
        }
      }
      return;
    case 2:
      if (*(_QWORD *)(*(_QWORD *)(a1 + 48) + 24))
        goto LABEL_17;
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v22 = qword_1ECD3F358;
      if (os_log_type_enabled((os_log_t)qword_1ECD3F358, OS_LOG_TYPE_FAULT))
      {
        v25 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&v36[0] = v25;
        v19 = "%s: SPI MISUSE: persona_unique_string is NULL but is required for data separated mount point";
        goto LABEL_39;
      }
      return;
    case 3:
LABEL_17:
      v12 = *(const char **)(a1 + 64);
      if (v12)
      {
        v13 = **(_QWORD **)(a1 + 48);
        if ((v13 & 0xFFFFFFFFFFFFFFFELL) != 0xC
          && ((v4 = v13 > 8, v14 = (1 << v13) & 0x12A, !v4) ? (v15 = v14 == 0) : (v15 = 1), v15))
        {
          v7 = strndup(v12, 0x400uLL);
LABEL_8:
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v7;
        }
        else
        {
          if (container_log_handle_for_category_onceToken != -1)
            dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
          v16 = qword_1ECD3F358;
          if (os_log_type_enabled((os_log_t)qword_1ECD3F358, OS_LOG_TYPE_FAULT))
          {
            v17 = *(_QWORD *)(a1 + 56);
            v18 = **(_QWORD **)(a1 + 48);
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&v36[0] = v17;
            WORD4(v36[0]) = 2048;
            *(_QWORD *)((char *)v36 + 10) = v18;
            v19 = "%s: SPI MISUSE: Cannot use CONTAINER_PATHS_PREFIX_TYPE_USER_HOME with global container class %llu";
            v20 = v16;
            v21 = 22;
LABEL_40:
            _os_log_fault_impl(&dword_1CF7DA000, v20, OS_LOG_TYPE_FAULT, v19, buf, v21);
          }
        }
      }
      else
      {
        if (container_log_handle_for_category_onceToken != -1)
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        v22 = qword_1ECD3F358;
        if (os_log_type_enabled((os_log_t)qword_1ECD3F358, OS_LOG_TYPE_FAULT))
        {
          v23 = *(_QWORD *)(a1 + 56);
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&v36[0] = v23;
          v19 = "%s: SPI MISUSE: prefix parameter is NULL";
LABEL_39:
          v20 = v22;
          v21 = 12;
          goto LABEL_40;
        }
      }
      return;
    default:
      return;
  }
}

BOOL container_paths_create_uid_home_relative(int a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  char *v7;
  char *v8;
  int v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int v14;
  void *v15;
  char v16;
  _QWORD *v17;
  char v18;
  void *v19;
  _QWORD v21[7];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;

  v31 = 0;
  v32 = &v31;
  v33 = 0x2000000000;
  v34 = 0;
  v30 = 1;
  v7 = container_pwd_copy_user_home_path(a1, 1, 0, &v30);
  v26 = 0;
  v27 = &v26;
  v28 = 0x2000000000;
  v29 = v7;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2000000000;
  v25 = -1;
  if (v7)
  {
    v8 = v7;
    v9 = (*((uint64_t (**)(char *, uint64_t))gCMFSSeam + 64))(v7, 1611694080);
    *((_DWORD *)v23 + 6) = v9;
    if ((v9 & 0x80000000) == 0)
    {
      v21[0] = MEMORY[0x1E0C87450];
      v21[1] = 0x40000000;
      v21[2] = __container_paths_create_uid_home_relative_block_invoke;
      v21[3] = &unk_1E8CB25E8;
      v21[4] = &v22;
      v21[5] = &v26;
      v21[6] = &v31;
      v10 = _container_paths_in_reverse_order_from_type_do(a2, (uint64_t)v21);
      goto LABEL_7;
    }
    v14 = *__error();
    v12 = 1;
    v11 = 127;
    v13 = v8;
  }
  else
  {
    v11 = v30;
    v12 = 3;
    v13 = 0;
    v14 = 0;
  }
  v15 = container_error_create(v12, v11, v13, v14);
  v10 = 0;
  v32[3] = (uint64_t)v15;
LABEL_7:
  if ((v23[3] & 0x80000000) == 0)
    (*((void (**)(void))gCMFSSeam + 19))();
  if (a4)
    v16 = v10;
  else
    v16 = 1;
  v17 = (_QWORD *)v32[3];
  if ((v16 & 1) != 0)
    container_error_free(v17);
  else
    *a4 = v17;
  v18 = !v10;
  v19 = (void *)v27[3];
  if (!a3)
    v18 = 1;
  if ((v18 & 1) != 0)
  {
    if (v19)
    {
      free(v19);
      memset_s(v27 + 3, 8uLL, 0, 8uLL);
    }
  }
  else
  {
    *a3 = v19;
  }
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v31, 8);
  return v10;
}

uint64_t __container_paths_create_uid_home_relative_block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  int v9;
  void **v10;
  const char *v11;
  int v12;
  int v13;
  char *v14;
  void *v15;
  const char *v16;
  int v17;
  int *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t result;
  char *__s;
  _QWORD v25[6];
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  gid_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uid_t v34;

  v2 = *(_QWORD *)(a1[4] + 8);
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(unsigned __int16 *)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 24);
  v6 = *(const char **)(a2 + 32);
  v8 = *(const char **)(a2 + 40);
  v9 = *(unsigned __int8 *)(a2 + 48);
  v11 = *(const char **)(v3 + 24);
  v10 = (void **)(v3 + 24);
  __s = 0;
  asprintf(&__s, "%s/%s", v11, v8);
  if (!__s)
  {
    _os_crash();
    __break(1u);
    JUMPOUT(0x1CF7EC504);
  }
  if (v9
    && ((*((uint64_t (**)(_QWORD, const char *, uint64_t))gCMFSSeam + 59))(*(unsigned int *)(v2 + 24), v8, v5) & 0x80000000) != 0
    && *__error() != 17
    || (v12 = (*((uint64_t (**)(_QWORD, const char *, uint64_t))gCMFSSeam + 66))(*(unsigned int *)(v2 + 24), v8, 1611694080), v12 < 0))
  {
    v18 = __error();
    v15 = container_error_create(1, 127, __s, *v18);
    if (__s)
    {
      free(__s);
      memset_s(&__s, 8uLL, 0, 8uLL);
    }
LABEL_21:
    result = 0;
    *(_QWORD *)(v4 + 24) = v15;
  }
  else
  {
    v13 = v12;
    v14 = __s;
    v31 = 0;
    v32 = &v31;
    v33 = 0x2000000000;
    v34 = 0;
    v34 = geteuid();
    v27 = 0;
    v28 = &v27;
    v29 = 0x2000000000;
    v30 = 0;
    v30 = getegid();
    v15 = 0;
    v16 = "mobile";
    v17 = 1;
    switch(v7)
    {
      case 0:
        goto LABEL_17;
      case 1:
        goto LABEL_11;
      case 3:
        *((_DWORD *)v32 + 6) = (_DWORD)v6;
        *((_DWORD *)v28 + 6) = HIDWORD(v6);
        goto LABEL_12;
      case 4:
        v16 = v6;
LABEL_11:
        v26 = 1;
        v25[0] = MEMORY[0x1E0C87450];
        v25[1] = 0x40000000;
        v25[2] = ___container_paths_chown_component_block_invoke;
        v25[3] = &unk_1E8CB2808;
        v25[4] = &v31;
        v25[5] = &v27;
        if (container_pwd_for_name((uint64_t)v16, &v26, (uint64_t)v25))
          goto LABEL_12;
        v21 = v26;
        v20 = 3;
        v22 = 0;
        v19 = 0;
        goto LABEL_16;
      default:
LABEL_12:
        if (fchown(v13, *((_DWORD *)v32 + 6), *((_DWORD *)v32 + 6)) < 0)
        {
          v19 = *__error();
          v20 = 1;
          v21 = 127;
          v22 = v14;
LABEL_16:
          v15 = container_error_create(v20, v21, v22, v19);
          v17 = 0;
        }
        else
        {
          v15 = 0;
          v17 = 1;
        }
LABEL_17:
        _Block_object_dispose(&v27, 8);
        _Block_object_dispose(&v31, 8);
        if (!v17)
          goto LABEL_21;
        if (*v10)
        {
          free(*v10);
          memset_s(v10, 8uLL, 0, 8uLL);
        }
        *v10 = __s;
        (*((void (**)(_QWORD))gCMFSSeam + 19))(*(unsigned int *)(v2 + 24));
        *(_DWORD *)(v2 + 24) = v13;
        result = 1;
        break;
    }
  }
  return result;
}

BOOL _container_paths_in_reverse_order_from_type_do(uint64_t a1, uint64_t a2)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  __int128 v14;
  uint64_t (*v15)(uint64_t, _QWORD *);
  _QWORD v17[2];
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v3 = (char *)&_container_paths_definition_from_type_definitions[7 * a1];
  v4 = *((_QWORD *)v3 + 1);
  if (v4)
  {
    v5 = 0;
    v6 = *((_QWORD *)v3 + 1);
    do
    {
      v6 = _container_paths_definition_from_type_definitions[7 * v6 + 1];
      ++v5;
    }
    while (v6);
  }
  else
  {
    v5 = 0;
  }
  v7 = v5 + 1;
  do
  {
    v8 = v7;
    if (!v7)
      break;
    v9 = *(_QWORD *)v3;
    v10 = *((_OWORD *)v3 + 2);
    v21 = *((_OWORD *)v3 + 1);
    v22 = v10;
    v23 = *((_QWORD *)v3 + 6);
    v11 = v5;
    v12 = v4;
    --v7;
    if (v8 == 1)
    {
      v12 = v4;
    }
    else
    {
      do
      {
        v13 = (char *)&_container_paths_definition_from_type_definitions[7 * v12];
        v12 = *((_QWORD *)v13 + 1);
        v14 = *((_OWORD *)v13 + 2);
        v21 = *((_OWORD *)v13 + 1);
        v22 = v14;
        v23 = *((_QWORD *)v13 + 6);
        --v11;
      }
      while (v11);
      v9 = *(_QWORD *)v13;
    }
    v15 = *(uint64_t (**)(uint64_t, _QWORD *))(a2 + 16);
    v17[0] = v9;
    v17[1] = v12;
    v18 = v21;
    v19 = v22;
    v20 = v23;
    --v5;
  }
  while ((v15(a2, v17) & 1) != 0);
  return v8 == 0;
}

uint64_t ___container_paths_chown_component_block_invoke(uint64_t a1, _DWORD *a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *a2;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2[1];
  return 1;
}

uint64_t container_paths_copy_uid_home_relative(int a1, uint64_t a2, _QWORD *a3)
{
  char *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  char *__s;
  uint64_t v17;

  v17 = 1;
  v5 = container_pwd_copy_user_home_path(a1, 1, 0, &v17);
  __s = v5;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2000000000;
  v15 = 0;
  v6 = malloc_type_calloc(0x401uLL, 1uLL, 0x100004077774924uLL);
  v13[3] = (uint64_t)v6;
  __strlcpy_chk();
  if (v5)
  {
    v11[0] = MEMORY[0x1E0C87450];
    v11[1] = 0x40000000;
    v11[2] = __container_paths_copy_uid_home_relative_block_invoke;
    v11[3] = &unk_1E8CB2610;
    v11[4] = &v12;
    _container_paths_in_reverse_order_from_type_do(a2, (uint64_t)v11);
    v7 = 0;
    if (a3)
    {
LABEL_3:
      *a3 = v7;
      goto LABEL_6;
    }
  }
  else
  {
    v7 = container_error_create(3, v17, 0, 0);
    if (a3)
      goto LABEL_3;
  }
  container_error_free(v7);
LABEL_6:
  v8 = (void *)v13[3];
  if (v8)
  {
    free(v8);
    memset_s(v13 + 3, 8uLL, 0, 8uLL);
  }
  if (v5)
  {
    free(v5);
    memset_s(&__s, 8uLL, 0, 8uLL);
  }
  v9 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v9;
}

uint64_t __container_paths_copy_uid_home_relative_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  void **v5;

  v2 = *(_QWORD *)(a2 + 40);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = (const char *)malloc_type_calloc(0x401uLL, 1uLL, 0x100004077774924uLL);
  v5 = (void **)(v3 + 24);
  __strlcpy_chk();
  container_fs_add_path_component(v4, v2, 0x400uLL);
  if (*v5)
  {
    free(*v5);
    memset_s(v5, 8uLL, 0, 8uLL);
  }
  *v5 = (void *)v4;
  return 1;
}

char *container_serialize_copy_serialized_reference(char *result, _QWORD *a2)
{
  uint64_t v3;
  const char *identifier;
  char *persona_unique_string;
  const char *unique_path_component;
  char *v7;
  size_t v8;
  char *v9;
  const unsigned __int8 *uuid;
  unsigned int v11;
  _DWORD *v12;
  unsigned int uid;
  const char *v14;
  const char *v15;
  char *__s;
  char *v17;
  char *v18;
  char *v19;
  char out[40];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C874D8];
  if (result)
  {
    v3 = (uint64_t)result;
    identifier = (const char *)container_object_get_identifier((uint64_t)result);
    persona_unique_string = (char *)container_object_get_persona_unique_string(v3);
    unique_path_component = (const char *)container_object_get_unique_path_component(v3);
    v7 = (char *)container_base64_encode_string(identifier);
    v19 = v7;
    if (persona_unique_string)
    {
      v8 = strlen(persona_unique_string);
      persona_unique_string = container_base64_encode((uint64_t)persona_unique_string, v8);
    }
    v18 = persona_unique_string;
    v9 = (char *)container_base64_encode_string(unique_path_component);
    v17 = v9;
    memset(out, 0, 37);
    uuid = (const unsigned __int8 *)container_object_get_uuid(v3);
    uuid_unparse(uuid, out);
    v11 = container_object_is_transient(v3);
    __s = 0;
    v12 = container_object_get_class(v3);
    uid = container_object_get_uid(v3);
    v14 = (const char *)&unk_1CF80235E;
    v15 = "T";
    if (!v11)
      v15 = (const char *)&unk_1CF80235E;
    if (persona_unique_string)
      v14 = persona_unique_string;
    asprintf(&__s, "CmCo:1:%llu:%u:%s:%s:%s:%s:%s", v12, uid, out, v15, v7, v9, v14);
    if (a2 && __s)
      *a2 = strlen(__s) + 1;
    if (v7)
    {
      free(v7);
      memset_s(&v19, 8uLL, 0, 8uLL);
    }
    if (persona_unique_string)
    {
      free(persona_unique_string);
      memset_s(&v18, 8uLL, 0, 8uLL);
    }
    if (v9)
    {
      free(v9);
      memset_s(&v17, 8uLL, 0, 8uLL);
    }
    return __s;
  }
  return result;
}

unsigned __int8 *container_serialize_copy_deserialized_reference(const char *a1, size_t a2, void **a3)
{
  unsigned __int8 *v6;
  uint64_t v7;
  char *v9;
  char *v10;
  size_t v11;
  char *v12;
  unsigned __int8 *v13;
  size_t v14;
  size_t v15;
  unint64_t v16;
  size_t v17;
  char *v18;
  unsigned __int8 *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;

  v25 = 0;
  v26 = 1;
  if (a1)
  {
    if (strnlen(a1, a2) <= 4)
    {
      v6 = 0;
      v7 = 133;
LABEL_7:
      v26 = v7;
      goto LABEL_8;
    }
    if (strncmp("CmCo", a1, 4uLL))
    {
      v6 = 0;
      v7 = 134;
      goto LABEL_7;
    }
    v9 = strndup(a1, a2);
    v10 = v9;
    v25 = v9;
    if (v9 < &v9[a2 - 1])
    {
      v11 = a2 - 1;
      v12 = v9;
      do
      {
        if (*v12 == 58)
        {
          *v12 = 0;
        }
        else if (!*v12)
        {
          v6 = 0;
          v24 = 142;
          goto LABEL_29;
        }
        ++v12;
        --v11;
      }
      while (v11);
    }
    v13 = (unsigned __int8 *)(v9 + 5);
    v14 = a2 - 5;
    v15 = strnlen(v9 + 5, v14);
    v16 = 0;
    v17 = v15 + 1;
    v18 = (char *)&v13[v15 + 1];
    v19 = &v13[v15];
    while (v13 < v19)
    {
      if (is_mul_ok(v16, 0xAuLL))
      {
        v20 = *v13;
        if ((v20 - 48) <= 9)
        {
          v21 = 10 * v16;
          v22 = (v20 - 48);
          ++v13;
          v23 = __CFADD__(v21, v22);
          v16 = v21 + v22;
          if (!v23)
            continue;
        }
      }
      goto LABEL_28;
    }
    if (v16 == 1)
    {
      v6 = _container_serialize_copy_deserialized_reference_v1(v18, v14 - v17, &v26);
      goto LABEL_30;
    }
LABEL_28:
    v6 = 0;
    v24 = 135;
LABEL_29:
    v26 = v24;
LABEL_30:
    if (v10)
    {
      free(v10);
      memset_s(&v25, 8uLL, 0, 8uLL);
    }
  }
  else
  {
    v6 = 0;
  }
LABEL_8:
  if (a3 && v26 != 1)
    *a3 = container_error_create(5, v26, 0, 0);
  return v6;
}

unsigned __int8 *_container_serialize_copy_deserialized_reference_v1(char *__s, uint64_t a2, uint64_t *a3)
{
  uint64_t *v3;
  char *v4;
  char *v5;
  char *v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  unint64_t v10;
  size_t v11;
  unint64_t v12;
  char *v13;
  int v14;
  uint64_t v15;
  BOOL v16;
  char *v17;
  int v18;
  uint64_t v19;
  char *i;
  int v21;
  char *v22;
  unsigned __int8 *v24;
  uint64_t v25;
  const char *v26;
  char *v28;
  void *v29;
  char *v30;
  char *__sa;
  uint64_t v32;
  uuid_t uu;
  uint64_t v34;

  v3 = a3;
  v34 = *MEMORY[0x1E0C874D8];
  v32 = 1;
  memset(uu, 0, sizeof(uu));
  v30 = 0;
  __sa = 0;
  v29 = 0;
  if (a2 < 1)
  {
    v6 = 0;
    v5 = 0;
LABEL_40:
    v24 = 0;
    v32 = 141;
    if (v5)
      goto LABEL_46;
    goto LABEL_47;
  }
  v4 = __s;
  v26 = 0;
  v5 = 0;
  v6 = 0;
  LODWORD(v7) = 0;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v28 = &__s[a2];
  while (2)
  {
    v11 = strlen(v4);
    v12 = v11 + 1;
    switch(v8)
    {
      case 0uLL:
        v10 = 0;
        v13 = v4;
        while (v13 < &v4[v11])
        {
          if (is_mul_ok(v10, 0xAuLL))
          {
            v14 = *v13;
            if ((v14 - 48) <= 9)
            {
              v15 = (v14 - 48);
              ++v13;
              v16 = __CFADD__(10 * v10, v15);
              v10 = 10 * v10 + v15;
              if (!v16)
                continue;
            }
          }
          goto LABEL_42;
        }
        if (v10 - 1 < 0xE)
          goto LABEL_36;
LABEL_42:
        v24 = 0;
        v25 = 20;
        goto LABEL_44;
      case 1uLL:
        v7 = 0;
        v17 = v4;
        while (v17 < &v4[v11])
        {
          if (is_mul_ok(v7, 0xAuLL))
          {
            v18 = *v17;
            if ((v18 - 48) <= 9)
            {
              v19 = (v18 - 48);
              ++v17;
              v16 = __CFADD__(10 * v7, v19);
              v7 = 10 * v7 + v19;
              if (!v16)
                continue;
            }
          }
          goto LABEL_43;
        }
        if (v7 <= 0x7FFFFFFE)
          goto LABEL_36;
LABEL_43:
        v24 = 0;
        v25 = 136;
LABEL_44:
        v32 = v25;
        goto LABEL_45;
      case 2uLL:
        if (v11 == 36 && !uuid_parse(v4, uu))
          goto LABEL_36;
        v24 = 0;
        v25 = 137;
        goto LABEL_44;
      case 3uLL:
        for (i = v4; v11; --v11)
        {
          v21 = *i++;
          v9 |= v21 == 84;
        }
        goto LABEL_36;
      case 4uLL:
        v22 = _container_base64_decode(v4, 0, 1u);
        __sa = v22;
        if (!v22)
        {
          v24 = 0;
          v32 = 138;
          v3 = a3;
          if (v6)
            goto LABEL_48;
          goto LABEL_49;
        }
        v5 = v22;
LABEL_36:
        v4 += v12;
        ++v8;
        if (v4 < v28)
          continue;
        if (v8 <= 5)
        {
          v3 = a3;
          goto LABEL_40;
        }
        v24 = container_object_create(uu, v5, v10, v7, 0, v6, v26, 0, 0, 0, v9 & 1, 0, 0, &v32);
LABEL_45:
        v3 = a3;
        if (v5)
        {
LABEL_46:
          free(v5);
          memset_s(&__sa, 8uLL, 0, 8uLL);
          v6 = v30;
        }
LABEL_47:
        if (v6)
        {
LABEL_48:
          free(v6);
          memset_s(&v30, 8uLL, 0, 8uLL);
        }
LABEL_49:
        if (v29)
        {
          free(v29);
          memset_s(&v29, 8uLL, 0, 8uLL);
        }
        if (v3 && !v24)
          *v3 = v32;
        return v24;
      case 5uLL:
        if (v12 >= 2)
        {
          v6 = _container_base64_decode(v4, 0, 1u);
          v30 = v6;
        }
        if (v6)
          goto LABEL_36;
        v24 = 0;
        v25 = 139;
        goto LABEL_44;
      case 6uLL:
        if (v12 < 2)
          goto LABEL_36;
        v29 = _container_base64_decode(v4, 0, 1u);
        v26 = (const char *)v29;
        if (v29)
          goto LABEL_36;
        v24 = 0;
        v25 = 76;
        goto LABEL_44;
      default:
        goto LABEL_36;
    }
  }
}

uint64_t container_operation_delete(uint64_t a1, uint64_t a2, uint64_t a3, void **a4)
{
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD block[9];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2000000000;
  v20 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2000000000;
  v16 = 0;
  v8 = _os_activity_create(&dword_1CF7DA000, "container_operation_delete", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C87450];
  block[1] = 0x40000000;
  block[2] = __container_operation_delete_block_invoke;
  block[3] = &unk_1E8CB2830;
  block[6] = a1;
  block[7] = a2;
  block[8] = a3;
  block[4] = &v17;
  block[5] = &v13;
  os_activity_apply(v8, block);
  os_release(v8);
  v9 = v14[3];
  if (a4 && v9)
  {
    *a4 = container_error_create(*(_QWORD *)(v9 + 8), *(_QWORD *)v9, *(char **)(v9 + 16), *(_DWORD *)(v9 + 24));
    v9 = v14[3];
  }
  container_log_ext_error((uint64_t)"container_operation_delete", gClientFaultLoggingEnabled, (uint64_t *)v9);
  container_error_free((_QWORD *)v14[3]);
  v10 = v18[3];
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  return v10;
}

uint64_t __container_operation_delete_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C874D8];
  v2 = *(_QWORD *)(a1 + 40);
  v4[0] = *(_QWORD *)(a1 + 48);
  result = container_operation_delete_array((uint64_t)v4, 1, *(_QWORD *)(a1 + 56), *(_QWORD **)(a1 + 64), (void **)(*(_QWORD *)(v2 + 8) + 24));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t container_operation_delete_array(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, void **a5)
{
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[10];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v23 = 0;
  v24 = &v23;
  v25 = 0x2000000000;
  v26 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2000000000;
  v22 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2000000000;
  v18 = 0;
  v10 = _os_activity_create(&dword_1CF7DA000, "container_operation_delete_array", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  v14[0] = MEMORY[0x1E0C87450];
  v14[1] = 0x40000000;
  v14[2] = __container_operation_delete_array_block_invoke;
  v14[3] = &unk_1E8CB2858;
  v14[8] = a2;
  v14[9] = a3;
  v14[4] = &v23;
  v14[5] = &v19;
  v14[6] = &v15;
  v14[7] = a1;
  os_activity_apply(v10, v14);
  os_release(v10);
  if (a4)
    *a4 = v20[3];
  v11 = v16[3];
  if (a5 && v11)
  {
    *a5 = container_error_create(*(_QWORD *)(v11 + 8), *(_QWORD *)v11, *(char **)(v11 + 16), *(_DWORD *)(v11 + 24));
    v11 = v16[3];
  }
  container_log_ext_error((uint64_t)"container_operation_delete_array", gClientFaultLoggingEnabled, (uint64_t *)v11);
  container_error_free((_QWORD *)v16[3]);
  v12 = v24[3];
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  return v12;
}

void __container_operation_delete_array_block_invoke(_QWORD *a1)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  xpc_object_t v6;
  xpc_object_t v7;
  void *v8;
  int current_persona;
  const char *v10;
  void *v11;
  void *v12;
  int *v13;
  const char *v14;
  NSObject *v15;
  uint64_t i;
  uint64_t v17;
  int v18;
  void *v19;
  xpc_object_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t value;
  void *__s;
  int v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t buf[4];
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  __int16 v43;
  uid_t v44;
  __int16 v45;
  uid_t v46;
  __int16 v47;
  void *v48;
  int v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[256];
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C874D8];
  v2 = (uint64_t *)a1[7];
  v3 = a1[8];
  value = a1[9];
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(_QWORD *)(a1[6] + 8);
  v27 = 0;
  v28 = 1;
  v26 = 0;
  v25 = 0;
  if (v3)
  {
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "Command", 3uLL);
    xpc_dictionary_set_uint64(v6, "Flags", value);
    v7 = xpc_array_create(0, 0);
    container_xpc_encode_container_array(v7, v2, v3);
    xpc_dictionary_set_value(v6, "ContainersArray", v7);
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_DEFAULT))
    {
      v21 = v4;
      v22 = v5;
      v8 = (void *)MEMORY[0x1D17D632C](v6);
      __s = v8;
      v61 = 0u;
      v62 = 0u;
      v60 = 0u;
      voucher_get_current_persona_originator_info();
      v58 = 0u;
      v59 = 0u;
      v57 = 0u;
      voucher_get_current_persona_proximate_info();
      v56 = 0;
      memset(v55, 0, sizeof(v55));
      v54 = 0u;
      v53 = 0u;
      v52 = 0u;
      v51 = 0u;
      v50 = 0u;
      v49 = 2;
      current_persona = voucher_get_current_persona();
      if (current_persona == -1 || (kpersona_info() & 0x80000000) != 0)
      {
        v14 = "<unknown>";
        v10 = "NOPERSONA";
      }
      else
      {
        if ((DWORD1(v50) - 2) > 4)
          v10 = "<unknown>";
        else
          v10 = (&off_1E8CB3988)[DWORD1(v50) - 2];
        v14 = &v55[4];
      }
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v15 = qword_1ECD3F348;
      if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67111427;
        v30 = current_persona;
        v31 = 2082;
        v32 = v10;
        v33 = 2082;
        v34 = v14;
        v35 = 1024;
        v36 = 0;
        v37 = 1024;
        v38 = 0;
        v39 = 1024;
        v40 = 0;
        v41 = 1024;
        v42 = 0;
        v43 = 1024;
        v44 = geteuid();
        v45 = 1024;
        v46 = getuid();
        v47 = 2081;
        v48 = v8;
        _os_log_impl(&dword_1CF7DA000, v15, OS_LOG_TYPE_DEFAULT, "Container delete; personaid = %d, type = %{public}s, name = %{public}s, origin [pid = %d, personaid = %d], pro"
          "ximate [pid = %d, personaid = %d], euid = %d, uid = %d, manifest = %{private}s",
          buf,
          0x4Au);
      }
      if (v8)
      {
        free(v8);
        memset_s(&__s, 8uLL, 0, 8uLL);
      }
      v4 = v21;
      v5 = v22;
    }
    for (i = 0; i != v3; ++i)
    {
      v17 = v2[i];
      if (!v17 || (unint64_t)container_object_get_class(v17) - 1 >= 0xE)
      {
        v13 = (int *)container_error_create(3, 11, 0, 0);
        v11 = 0;
        v12 = 0;
LABEL_29:
        v26 = v13;
        goto LABEL_30;
      }
    }
    v18 = container_disposition_for_array(v2, v3, &v25);
    v19 = (void *)container_xpc_send_sync_message(v18, (void *)(2 * (value & 1)), v6, 1, v25, 0, (uint64_t)&v26);
    v12 = v19;
    if (v19)
    {
      v20 = xpc_dictionary_get_value(v19, "ReplyContainersArray");
      v11 = container_xpc_decode_create_container_object_array(v20, &v27, &v28);
      if (v11)
        goto LABEL_10;
      v13 = (int *)container_error_create(2, v28, 0, 0);
      goto LABEL_29;
    }
    v11 = 0;
  }
  else
  {
    v11 = malloc_type_calloc(1uLL, 8uLL, 0x2004093837F09uLL);
    v7 = 0;
    v6 = 0;
    v12 = 0;
  }
LABEL_10:
  v13 = (int *)v26;
LABEL_30:
  *(_QWORD *)(v4 + 24) = v27;
  if (v13)
  {
    *(_QWORD *)(v5 + 24) = container_error_create(*((_QWORD *)v13 + 1), *(_QWORD *)v13, *((char **)v13 + 2), v13[6]);
    v13 = (int *)v26;
  }
  container_error_free(v13);
  if (v7)
    xpc_release(v7);
  if (v6)
    xpc_release(v6);
  if (v12)
    xpc_release(v12);
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v11;
}

uint64_t container_operation_delete_reclaim_disk_space()
{
  NSObject *v0;
  uint64_t v1;
  _QWORD block[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2000000000;
  v7 = 0;
  v0 = _os_activity_create(&dword_1CF7DA000, "container_operation_delete_reclaim_disk_space", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C87450];
  block[1] = 0x40000000;
  block[2] = __container_operation_delete_reclaim_disk_space_block_invoke;
  block[3] = &unk_1E8CB2880;
  block[4] = &v4;
  os_activity_apply(v0, block);
  os_release(v0);
  container_log_ext_error((uint64_t)"container_operation_delete_reclaim_disk_space", gClientFaultLoggingEnabled, (uint64_t *)v5[3]);
  v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

void __container_operation_delete_reclaim_disk_space_block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  int current_persona;
  const char *v4;
  const char *v5;
  NSObject *v6;
  void *v7;
  uint8_t buf[4];
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uid_t v23;
  __int16 v24;
  uid_t v25;
  int v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[256];
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C874D8];
  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "Command", 4uLL);
  v38 = 0u;
  v39 = 0u;
  v37 = 0u;
  voucher_get_current_persona_originator_info();
  v35 = 0u;
  v36 = 0u;
  v34 = 0u;
  voucher_get_current_persona_proximate_info();
  v33 = 0;
  memset(v32, 0, sizeof(v32));
  v31 = 0u;
  v30 = 0u;
  v29 = 0u;
  v28 = 0u;
  v27 = 0u;
  v26 = 2;
  current_persona = voucher_get_current_persona();
  if (current_persona == -1 || (kpersona_info() & 0x80000000) != 0)
  {
    v5 = "<unknown>";
    v4 = "NOPERSONA";
  }
  else
  {
    if ((DWORD1(v27) - 2) > 4)
      v4 = "<unknown>";
    else
      v4 = (&off_1E8CB3988)[DWORD1(v27) - 2];
    v5 = &v32[4];
  }
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  v6 = qword_1ECD3F348;
  if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67111170;
    v9 = current_persona;
    v10 = 2082;
    v11 = v4;
    v12 = 2082;
    v13 = v5;
    v14 = 1024;
    v15 = 0;
    v16 = 1024;
    v17 = 0;
    v18 = 1024;
    v19 = 0;
    v20 = 1024;
    v21 = 0;
    v22 = 1024;
    v23 = geteuid();
    v24 = 1024;
    v25 = getuid();
    _os_log_impl(&dword_1CF7DA000, v6, OS_LOG_TYPE_DEFAULT, "Wait for obliteration; personaid = %d, type = %{public}s, name = %{public}s, origin [pid = %d, personaid = %d], pr"
      "oximate [pid = %d, personaid = %d], euid = %d, uid = %d",
      buf,
      0x40u);
  }
  v7 = (void *)container_xpc_send_sync_message(2, (void *)2, v2, 1, 0, 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v2)
    xpc_release(v2);
  if (v7)
    xpc_release(v7);
}

uint64_t container_operation_complete_background_tasks(int a1)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD v5[5];
  int v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2000000000;
  v10 = 0;
  v2 = _os_activity_create(&dword_1CF7DA000, "container_operation_complete_background_tasks", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  v5[0] = MEMORY[0x1E0C87450];
  v5[1] = 0x40000000;
  v5[2] = __container_operation_complete_background_tasks_block_invoke;
  v5[3] = &unk_1E8CB28A8;
  v6 = a1;
  v5[4] = &v7;
  os_activity_apply(v2, v5);
  os_release(v2);
  container_log_ext_error((uint64_t)"container_operation_complete_background_tasks", gClientFaultLoggingEnabled, (uint64_t *)v8[3]);
  v3 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v3;
}

void __container_operation_complete_background_tasks_block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  NSObject *v3;
  int v4;
  int v5;
  void *v6;
  void *v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C874D8];
  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "Command", 0x2EuLL);
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  v3 = qword_1ECD3F348;
  if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_DWORD *)(a1 + 40);
    v8[0] = 67109120;
    v8[1] = v4;
    _os_log_impl(&dword_1CF7DA000, v3, OS_LOG_TYPE_DEFAULT, "Wait for background task completion; disposition = 0x%x",
      (uint8_t *)v8,
      8u);
  }
  v5 = *(_DWORD *)(a1 + 40);
  if ((v5 & 0xFFFFFFFE) == 2)
  {
    v6 = (void *)container_xpc_send_sync_message(2, (void *)5, v2, 1, 0, 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    if (!v6)
      goto LABEL_11;
    xpc_release(v6);
    v5 = *(_DWORD *)(a1 + 40);
  }
  if ((v5 | 2) == 3)
  {
    v7 = (void *)container_xpc_send_sync_message(1, (void *)5, v2, 1, 0, 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    if (v7)
      xpc_release(v7);
  }
LABEL_11:
  if (v2)
    xpc_release(v2);
}

uint64_t container_audit_token_get_pid(uint64_t a1)
{
  return *(unsigned int *)(a1 + 20);
}

char *container_audit_token_copy_codesign_team_identifier()
{
  return container_codesign_copy_cs_team_identifier();
}

uint64_t container_audit_token_copy_executable_name(audit_token_t *a1, char **a2)
{
  unsigned int v4;
  char *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  _DWORD v10[2];
  __int16 v11;
  int v12;
  char buffer[1025];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C874D8];
  v4 = a1->val[5];
  bzero(buffer, 0x401uLL);
  if (proc_pidpath_audittoken(a1, buffer, 0x400u) >= 2)
  {
    v5 = rindex(buffer, 47);
    v6 = 0;
    if (v5)
      v7 = v5 + 1;
    else
      v7 = buffer;
    if (!a2)
      return v6;
LABEL_12:
    if (!(_DWORD)v6)
      *a2 = strndup(v7, 0x400uLL);
    return v6;
  }
  v6 = *__error();
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  v8 = qword_1ECD3F348;
  if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_ERROR))
  {
    v10[0] = 67109376;
    v10[1] = v4;
    v11 = 1024;
    v12 = v6;
    _os_log_error_impl(&dword_1CF7DA000, v8, OS_LOG_TYPE_ERROR, "Unable to fetch executable path from client for pid [%d]: %{darwin.errno}d", (uint8_t *)v10, 0xEu);
  }
  v7 = 0;
  if (a2)
    goto LABEL_12;
  return v6;
}

uint64_t container_audit_token_get_euid(uint64_t a1)
{
  return *(unsigned int *)(a1 + 4);
}

uint64_t container_audit_token_get_egid(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

BOOL container_audit_token_for_pid(int pid, _OWORD *a2)
{
  mach_port_name_t *v4;
  kern_return_t v5;
  mach_error_t v6;
  NSObject *v7;
  _BOOL8 v8;
  kern_return_t v9;
  mach_error_t v10;
  NSObject *v11;
  char *v12;
  __int128 v13;
  char *v15;
  mach_msg_type_number_t task_info_outCnt;
  mach_port_name_t tn;
  integer_t task_info_out[4];
  __int128 v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  char *v23;
  __int16 v24;
  mach_error_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C874D8];
  if (!a2)
    return 0;
  *(_OWORD *)task_info_out = 0u;
  v19 = 0u;
  tn = 0;
  v4 = (mach_port_name_t *)MEMORY[0x1E0C883F0];
  if (task_name_for_pid(*MEMORY[0x1E0C883F0], pid, &tn))
  {
    v5 = task_name_for_pid(*v4, pid, &tn);
    if (v5)
    {
      v6 = v5;
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v7 = qword_1ECD3F348;
      if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_ERROR))
      {
        v15 = mach_error_string(v6);
        *(_DWORD *)buf = 67109634;
        v21 = pid;
        v22 = 2082;
        v23 = v15;
        v24 = 1024;
        v25 = v6;
        _os_log_error_impl(&dword_1CF7DA000, v7, OS_LOG_TYPE_ERROR, "Unable to obtain a task name port right for pid %i: %{public}s (0x%x)", buf, 0x18u);
      }
      return 0;
    }
  }
  task_info_outCnt = 8;
  v9 = task_info(tn, 0xFu, task_info_out, &task_info_outCnt);
  v8 = v9 == 0;
  if (v9)
  {
    v10 = v9;
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v11 = qword_1ECD3F348;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_ERROR))
    {
      v12 = mach_error_string(v10);
      *(_DWORD *)buf = 67109634;
      v21 = pid;
      v22 = 2082;
      v23 = v12;
      v24 = 1024;
      v25 = v10;
      _os_log_error_impl(&dword_1CF7DA000, v11, OS_LOG_TYPE_ERROR, "Unable to obtain a task info for pid %i: %{public}s (0x%x)", buf, 0x18u);
    }
  }
  else
  {
    v13 = v19;
    *a2 = *(_OWORD *)task_info_out;
    a2[1] = v13;
  }
  return v8;
}

BOOL container_audit_token_is_valid(_OWORD *a1)
{
  __int128 v1;
  audit_token_t v3;

  v1 = a1[1];
  *(_OWORD *)v3.val = *a1;
  *(_OWORD *)&v3.val[4] = v1;
  return container_audit_token_copy_executable_name(&v3, 0) != 3;
}

uint64_t ___container_xpc_invalidate_shared_connection_after_timeout_block_invoke_11(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  _QWORD *v5;
  NSObject *v6;
  _BOOL4 v7;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  _QWORD *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C874D8];
  os_unfair_lock_lock_with_options();
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 32) == *(_QWORD *)(a1 + 40) && !*(_BYTE *)(v2 + 25))
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v3 = qword_1ECD3F348;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_DEBUG))
    {
      v9 = *(_QWORD **)(a1 + 32);
      v10 = v9[1];
      v11 = v9[2];
      v12 = gSharedClientConnection[6 * v10 + v11];
      v13 = v9[5];
      v17 = 134219008;
      v18 = v9;
      v19 = 2048;
      v20 = v10;
      v21 = 2048;
      v22 = v11;
      v23 = 2048;
      v24 = v12;
      v25 = 2048;
      v26 = v13;
      _os_log_debug_impl(&dword_1CF7DA000, v3, OS_LOG_TYPE_DEBUG, "connection <%p/%lld/%lld; %p> canceled after timeout; cnt = %lld",
        (uint8_t *)&v17,
        0x34u);
    }
    v4 = *(_QWORD *)(a1 + 32);
    *(_BYTE *)(v4 + 25) = 1;
    if (*(_BYTE *)(v4 + 24))
    {
      v5 = &gSharedClientConnection[6 * *(_QWORD *)(v4 + 8) + *(_QWORD *)(v4 + 16)];
      if (v4 == *v5)
      {
        *v5 = 0;
        --*(_QWORD *)(v4 + 40);
        if (container_log_handle_for_category_onceToken != -1)
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        v6 = qword_1ECD3F348;
        v7 = os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_DEBUG);
        v4 = *(_QWORD *)(a1 + 32);
        if (v7)
        {
          v14 = *(_QWORD *)(v4 + 8);
          v15 = *(_QWORD *)(v4 + 16);
          v16 = *(_QWORD *)(v4 + 40);
          v17 = 134218752;
          v18 = (_QWORD *)v4;
          v19 = 2048;
          v20 = v14;
          v21 = 2048;
          v22 = v15;
          v23 = 2048;
          v24 = v16;
          _os_log_debug_impl(&dword_1CF7DA000, v6, OS_LOG_TYPE_DEBUG, "connection <%p/%lld/%lld> released (shared; canceler); cnt = %lld",
            (uint8_t *)&v17,
            0x2Au);
          v4 = *(_QWORD *)(a1 + 32);
        }
      }
    }
    xpc_connection_cancel(*(xpc_connection_t *)v4);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&gSharedClientConnectionLock);
  return container_xpc_release(*(_QWORD *)(a1 + 32));
}

void __container_xpc_create_connection_block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  const char *v4;
  const char *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C874D8];
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  v3 = qword_1ECD3F348;
  if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_DEBUG))
  {
    if (a2 == MEMORY[0x1E0C88F98])
      v4 = " interrupted";
    else
      v4 = (const char *)&unk_1CF80235E;
    if (a2 == MEMORY[0x1E0C88FA0])
      v5 = " invalidation";
    else
      v5 = v4;
    v6 = 136446210;
    v7 = v5;
    _os_log_debug_impl(&dword_1CF7DA000, v3, OS_LOG_TYPE_DEBUG, "received superfluous connection%{public}s event, ignoring", (uint8_t *)&v6, 0xCu);
  }
}

void container_xpc_invalidate_connection(uint64_t a1)
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    if (!*(_BYTE *)(a1 + 25))
      xpc_connection_cancel(*(xpc_connection_t *)a1);
    os_unfair_lock_unlock((os_unfair_lock_t)&gSharedClientConnectionLock);
  }
}

uint64_t container_xpc_get_raw_connection(uint64_t a1)
{
  return *(_QWORD *)a1;
}

_QWORD *container_references_create()
{
  _QWORD *v0;

  v0 = malloc_type_calloc(1uLL, 0x50uLL, 0x103004031F9774FuLL);
  v0[1] = _os_activity_create(&dword_1CF7DA000, "container_references_t", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  *((_DWORD *)v0 + 18) = -1;
  return v0;
}

void container_references_set_class(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD block[7];
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C874D8];
  if (a1)
  {
    v2 = *(NSObject **)(a1 + 8);
    block[0] = MEMORY[0x1E0C87450];
    block[1] = 0x40000000;
    block[2] = __container_references_set_class_block_invoke;
    block[3] = &__block_descriptor_tmp_328;
    block[4] = a2;
    block[5] = "container_references_set_class";
    block[6] = a1;
    os_activity_apply(v2, block);
  }
  else
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v3 = container_log_handle_for_category_logHandles[0];
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v6 = "container_references_set_class";
      _os_log_fault_impl(&dword_1CF7DA000, v3, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: references parameter is NULL", buf, 0xCu);
    }
  }
}

void __container_references_set_class_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C874D8];
  if ((unint64_t)(*(_QWORD *)(a1 + 32) - 1) >= 0xE)
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v4 = container_log_handle_for_category_logHandles[0];
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_FAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = 136315138;
      v9 = v7;
      _os_log_fault_impl(&dword_1CF7DA000, v4, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: invalid container class", (uint8_t *)&v8, 0xCu);
    }
    v5 = *(uint64_t **)(a1 + 48);
    v6 = container_error_create(3, 20, 0, 0);
    _container_references_replace_error(v5, (uint64_t)v6);
  }
  else
  {
    _container_references_log_if_error(*(uint64_t **)(a1 + 48), *(_QWORD *)(a1 + 40));
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 48);
    *(_QWORD *)(v3 + 16) |= 1uLL;
    *(_QWORD *)(v3 + 24) = v2;
  }
}

_QWORD *_container_references_replace_error(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *result;

  v4 = *a1;
  v5 = *(_QWORD *)(a2 + 8);
  if (v4)
  {
    container_error_reinitialize(v4, v5, *(_QWORD *)a2, *(char **)(a2 + 16), *(_DWORD *)(a2 + 24));
    result = (_QWORD *)*a1;
  }
  else
  {
    result = container_error_create(v5, *(_QWORD *)a2, *(char **)(a2 + 16), *(_DWORD *)(a2 + 24));
    *a1 = (uint64_t)result;
  }
  result[5] = a1;
  return result;
}

void _container_references_log_if_error(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  char *v4;
  NSObject *v5;
  char *__s;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C874D8];
  if (a1)
  {
    v2 = *a1;
    if (v2)
    {
      v4 = container_error_copy_unlocalized_description(v2);
      __s = v4;
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v5 = qword_1ECD3F350;
      if (os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v8 = a2;
        v9 = 2080;
        v10 = v4;
        _os_log_error_impl(&dword_1CF7DA000, v5, OS_LOG_TYPE_ERROR, "WARNING: Calling %s with a references that has a previous error: %s", buf, 0x16u);
        if (!v4)
          return;
      }
      else if (!v4)
      {
        return;
      }
      free(v4);
      memset_s(&__s, 8uLL, 0, 8uLL);
    }
  }
}

void container_references_set_uid(uint64_t a1, int a2)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD block[6];
  int v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C874D8];
  if (a1)
  {
    v2 = *(NSObject **)(a1 + 8);
    block[0] = MEMORY[0x1E0C87450];
    block[1] = 0x40000000;
    block[2] = __container_references_set_uid_block_invoke;
    block[3] = &__block_descriptor_tmp_1_333;
    block[4] = a1;
    block[5] = "container_references_set_uid";
    v5 = a2;
    os_activity_apply(v2, block);
  }
  else
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v3 = container_log_handle_for_category_logHandles[0];
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "container_references_set_uid";
      _os_log_fault_impl(&dword_1CF7DA000, v3, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: references parameter is NULL", buf, 0xCu);
    }
  }
}

void __container_references_set_uid_block_invoke(uint64_t a1)
{
  uint64_t v2;

  _container_references_log_if_error(*(uint64_t **)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  *(_DWORD *)(v2 + 32) = *(_DWORD *)(a1 + 48);
  *(_QWORD *)(v2 + 16) |= 2uLL;
}

void container_references_set_persona_unique_string(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD block[7];
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C874D8];
  if (a1)
  {
    v2 = *(NSObject **)(a1 + 8);
    block[0] = MEMORY[0x1E0C87450];
    block[1] = 0x40000000;
    block[2] = __container_references_set_persona_unique_string_block_invoke;
    block[3] = &__block_descriptor_tmp_2_335;
    block[4] = a2;
    block[5] = "container_references_set_persona_unique_string";
    block[6] = a1;
    os_activity_apply(v2, block);
  }
  else
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v3 = container_log_handle_for_category_logHandles[0];
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v6 = "container_references_set_persona_unique_string";
      _os_log_fault_impl(&dword_1CF7DA000, v3, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: references parameter is NULL", buf, 0xCu);
    }
  }
}

char *__container_references_set_persona_unique_string_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char *result;
  NSObject *v5;
  uint64_t *v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C874D8];
  if (*(_QWORD *)(a1 + 32))
  {
    _container_references_log_if_error(*(uint64_t **)(a1 + 48), (uint64_t)"container_references_set_persona_unique_string_block_invoke");
    v2 = *(_QWORD *)(a1 + 48);
    v3 = *(void **)(v2 + 40);
    if (v3)
    {
      free(v3);
      memset_s((void *)(*(_QWORD *)(a1 + 48) + 40), 8uLL, 0, 8uLL);
      v2 = *(_QWORD *)(a1 + 48);
    }
    result = strndup(*(const char **)(a1 + 32), 0x400uLL);
    *(_QWORD *)(v2 + 40) = result;
    *(_QWORD *)(*(_QWORD *)(a1 + 48) + 16) |= 4uLL;
  }
  else
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v5 = container_log_handle_for_category_logHandles[0];
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_FAULT))
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 136315138;
      v10 = v8;
      _os_log_fault_impl(&dword_1CF7DA000, v5, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: persona_unique_string parameter is NULL", (uint8_t *)&v9, 0xCu);
    }
    v6 = *(uint64_t **)(a1 + 48);
    v7 = container_error_create(3, 38, 0, 0);
    return (char *)_container_references_replace_error(v6, (uint64_t)v7);
  }
  return result;
}

void container_references_operation_set_flags(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD block[7];
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C874D8];
  if (a1)
  {
    v2 = *(NSObject **)(a1 + 8);
    block[0] = MEMORY[0x1E0C87450];
    block[1] = 0x40000000;
    block[2] = __container_references_operation_set_flags_block_invoke;
    block[3] = &__block_descriptor_tmp_3_338;
    block[4] = a1;
    block[5] = "container_references_operation_set_flags";
    block[6] = a2;
    os_activity_apply(v2, block);
  }
  else
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v3 = container_log_handle_for_category_logHandles[0];
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v6 = "container_references_operation_set_flags";
      _os_log_fault_impl(&dword_1CF7DA000, v3, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: references parameter is NULL", buf, 0xCu);
    }
  }
}

void __container_references_operation_set_flags_block_invoke(uint64_t a1)
{
  _container_references_log_if_error(*(uint64_t **)(a1 + 32), *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = *(_QWORD *)(a1 + 48);
}

_QWORD *container_references_free(_QWORD *result)
{
  _QWORD *v1;
  void *v2;
  void *v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  uint64_t __s;

  __s = (uint64_t)result;
  if (result)
  {
    v1 = result;
    v3 = result + 5;
    v2 = (void *)result[5];
    if (v2)
    {
      free(v2);
      memset_s(v3, 8uLL, 0, 8uLL);
    }
    v4 = (_QWORD *)*v1;
    if (*v1)
    {
      v4[5] = 0;
      container_error_free(v4);
      *v1 = 0;
    }
    v5 = (_QWORD *)v1[8];
    if (v5)
    {
      container_free_client(v5);
      v1[8] = 0;
    }
    v6 = (void *)v1[1];
    if (v6)
      os_release(v6);
    free(v1);
    return (_QWORD *)memset_s(&__s, 8uLL, 0, 8uLL);
  }
  return result;
}

uint64_t container_references_add(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v9[10];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C874D8];
  v10 = 0;
  v11 = &v10;
  v12 = 0x2000000000;
  v13 = 0;
  if (a1)
  {
    v5 = *(NSObject **)(a1 + 8);
    v9[0] = MEMORY[0x1E0C87450];
    v9[1] = 0x40000000;
    v9[2] = __container_references_add_block_invoke;
    v9[3] = &unk_1E8CB29D0;
    v9[4] = &v10;
    v9[5] = a1;
    v9[6] = "container_references_add";
    v9[7] = a2;
    v9[8] = a3;
    v9[9] = a4;
    os_activity_apply(v5, v9);
    container_log_ext_error((uint64_t)"container_references_add", gClientFaultLoggingEnabled, *(uint64_t **)a1);
    v6 = v11[3];
  }
  else
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v7 = container_log_handle_for_category_logHandles[0];
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "container_references_add";
      _os_log_fault_impl(&dword_1CF7DA000, v7, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: references parameter is NULL", buf, 0xCu);
    }
    v6 = 0;
  }
  _Block_object_dispose(&v10, 8);
  return v6;
}

void *__container_references_add_block_invoke(uint64_t a1)
{
  void *result;

  _container_references_log_if_error(*(uint64_t **)(a1 + 40), *(_QWORD *)(a1 + 48));
  result = _container_add_remove(*(_QWORD *)(a1 + 40), 0x30uLL, *(xpc_object_t *)(a1 + 56), *(void **)(a1 + 64), *(_QWORD **)(a1 + 72), *(_QWORD *)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void *_container_add_remove(uint64_t a1, uint64_t a2, xpc_object_t a3, void *a4, _QWORD *a5, uint64_t a6)
{
  xpc_object_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  _BOOL4 v25;
  int v26;
  xpc_object_t v27;
  NSObject *v28;
  _QWORD *v29;
  NSObject *v31;
  int v32;
  unint64_t v33;
  const char *v34;
  void *v35;
  unint64_t v36;
  NSObject *v37;
  uid_t v38;
  uid_t v39;
  uint64_t v40;
  int v41;
  unint64_t v42;
  void *v43;
  xpc_object_t value;
  int current_persona_originator_info;
  int current_persona_proximate_info;
  const char *v47;
  int v48;
  NSObject *v49;
  uid_t v50;
  uid_t v51;
  const char *v52;
  const char *v53;
  int current_persona;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  uint64_t v61;
  void *__s;
  xpc_object_t object;
  xpc_object_t objects;
  uint64_t v65;
  void *v66;
  uint8_t v67[4];
  int v68;
  __int16 v69;
  const char *v70;
  __int16 v71;
  const char *v72;
  __int16 v73;
  int v74;
  __int16 v75;
  int v76;
  __int16 v77;
  int v78;
  __int16 v79;
  int v80;
  __int16 v81;
  uid_t v82;
  __int16 v83;
  uid_t v84;
  __int16 v85;
  void *v86;
  uint8_t buf[4];
  _QWORD v88[4];
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[256];
  uint64_t v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C874D8];
  v65 = 0;
  v66 = 0;
  object = 0;
  objects = 0;
  v12 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v12, "Command", a2);
  xpc_dictionary_set_uint64(v12, "Flags", *(_QWORD *)(a1 + 48));
  xpc_dictionary_set_uint64(v12, "PrivateFlags", *(_QWORD *)(a1 + 56));
  v13 = *(_QWORD *)(a1 + 64);
  if (v13)
    container_xpc_encode_client_onto_message(v12, v13);
  xpc_dictionary_set_uint64(v12, "Explicit", *(_QWORD *)(a1 + 16));
  if ((*(_BYTE *)(a1 + 16) & 1) == 0)
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v14 = container_log_handle_for_category_logHandles[0];
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v88[0] = a6;
      _os_log_fault_impl(&dword_1CF7DA000, v14, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: container_query_set_class() is required", buf, 0xCu);
    }
    v15 = container_error_create(3, 38, 0, 0);
    v16 = v15;
    v17 = 0;
    v18 = 0;
    v19 = 0;
LABEL_22:
    v25 = 0;
LABEL_23:
    v66 = v15;
    goto LABEL_24;
  }
  xpc_dictionary_set_uint64(v12, "ContainerClass", *(_QWORD *)(a1 + 24));
  v20 = MEMORY[0x1E0C89020];
  v21 = MEMORY[0x1E0C88FC0];
  if (a3)
  {
    objects = a3;
    v22 = MEMORY[0x1D17D6434](a3);
    v19 = v22 == v20;
    if (v22 == v20)
    {
      v23 = 1;
      a3 = xpc_array_create(&objects, 1uLL);
      objects = a3;
    }
    else
    {
      v23 = 0;
    }
    if (MEMORY[0x1D17D6434](a3) != v21)
    {
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v28 = container_log_handle_for_category_logHandles[0];
      if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v88[0] = a6;
        _os_log_fault_impl(&dword_1CF7DA000, v28, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: owner_identifiers is not an array or string", buf, 0xCu);
      }
      v15 = container_error_create(3, 38, 0, 0);
      v16 = v15;
      v17 = 0;
      v18 = 0;
      goto LABEL_22;
    }
    xpc_dictionary_set_value(v12, "OwnerIdentifiersArray", objects);
    if (!a4)
      goto LABEL_42;
  }
  else
  {
    v23 = 0;
    if (!a4)
    {
LABEL_42:
      v26 = 0;
      goto LABEL_51;
    }
  }
  object = a4;
  v24 = MEMORY[0x1D17D6434](a4);
  v25 = v24 == v20;
  if (v24 == v20)
  {
    v26 = 1;
    v27 = xpc_array_create(&object, 1uLL);
    object = v27;
  }
  else
  {
    v26 = 0;
    v27 = object;
  }
  if (MEMORY[0x1D17D6434](v27) != v21)
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v31 = container_log_handle_for_category_logHandles[0];
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v88[0] = a6;
      _os_log_fault_impl(&dword_1CF7DA000, v31, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: group_identifiers is not an array or string", buf, 0xCu);
    }
    v16 = container_error_create(3, 38, 0, 0);
    v17 = 0;
    v18 = 0;
    v66 = v16;
    v19 = v23 != 0;
    goto LABEL_24;
  }
  xpc_dictionary_set_value(v12, "GroupIdentifiers", object);
LABEL_51:
  v32 = 0;
  v33 = *(_QWORD *)(a1 + 24);
  if (v33 <= 0xE && ((1 << v33) & 0x4ED4) != 0)
  {
    if ((*(_BYTE *)(a1 + 16) & 2) != 0)
    {
      xpc_dictionary_set_uint64(v12, "UID", *(unsigned int *)(a1 + 32));
      v32 = *(_DWORD *)(a1 + 32);
    }
    else
    {
      v32 = 0;
    }
  }
  if ((*(_BYTE *)(a1 + 16) & 4) != 0)
  {
    v34 = *(const char **)(a1 + 40);
    if (v34)
      xpc_dictionary_set_string(v12, "PersonaUniqueString", v34);
  }
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  if (!os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_DEFAULT))
    goto LABEL_71;
  v35 = (void *)MEMORY[0x1D17D632C](v12);
  __s = v35;
  v36 = *(_QWORD *)(a1 + 24);
  if ((v36 & 0xFFFFFFFFFFFFFFFELL) == 0xC || v36 <= 8 && ((1 << v36) & 0x12A) != 0)
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v37 = qword_1ECD3F348;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_DEFAULT))
    {
      v38 = geteuid();
      v39 = getuid();
      *(_DWORD *)buf = 67109634;
      LODWORD(v88[0]) = v38;
      WORD2(v88[0]) = 1024;
      *(_DWORD *)((char *)v88 + 6) = v39;
      WORD1(v88[1]) = 2080;
      *(_QWORD *)((char *)&v88[1] + 4) = v35;
      _os_log_impl(&dword_1CF7DA000, v37, OS_LOG_TYPE_DEFAULT, "References query; euid = %d, uid = %d, query = %s",
        buf,
        0x18u);
    }
    if (!v35)
      goto LABEL_71;
  }
  else
  {
    v98 = 0u;
    v99 = 0u;
    v97 = 0u;
    current_persona_originator_info = voucher_get_current_persona_originator_info();
    v59 = DWORD2(v97);
    v60 = current_persona_originator_info;
    v58 = DWORD1(v98);
    v95 = 0u;
    v96 = 0u;
    v94 = 0u;
    current_persona_proximate_info = voucher_get_current_persona_proximate_info();
    v56 = DWORD2(v94);
    v57 = current_persona_proximate_info;
    v55 = DWORD1(v95);
    v93 = 0;
    memset(v92, 0, sizeof(v92));
    v91 = 0u;
    v90 = 0u;
    v89 = 0u;
    memset(v88, 0, sizeof(v88));
    *(_DWORD *)buf = 2;
    current_persona = voucher_get_current_persona();
    if (current_persona == -1 || (kpersona_info() & 0x80000000) != 0)
    {
      v52 = "NOPERSONA";
      v53 = "<unknown>";
    }
    else
    {
      if ((HIDWORD(v88[0]) - 2) > 4)
        v47 = "<unknown>";
      else
        v47 = (&off_1E8CB3988)[HIDWORD(v88[0]) - 2];
      v52 = v47;
      v53 = &v92[4];
    }
    v48 = v26;
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v49 = qword_1ECD3F350;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_DEFAULT))
    {
      v50 = geteuid();
      v51 = getuid();
      *(_DWORD *)v67 = 67111426;
      v68 = current_persona;
      v69 = 2082;
      v70 = v52;
      v71 = 2082;
      v72 = v53;
      v73 = 1024;
      v74 = v59 & ~(v60 >> 31);
      v75 = 1024;
      v76 = v58 & ~(v60 >> 31);
      v77 = 1024;
      v78 = v56 & ~(v57 >> 31);
      v79 = 1024;
      v80 = v55 & ~(v57 >> 31);
      v81 = 1024;
      v82 = v50;
      v83 = 1024;
      v84 = v51;
      v85 = 2080;
      v86 = v35;
      _os_log_impl(&dword_1CF7DA000, v49, OS_LOG_TYPE_DEFAULT, "References query; personaid = %d, type = %{public}s, name = %{public}s, origin [pid = %d, personaid = %d], proxi"
        "mate [pid = %d, personaid = %d], euid = %d, uid = %d, query = %s",
        v67,
        0x4Au);
    }
    v26 = v48;
    if (!v35)
      goto LABEL_71;
  }
  free(v35);
  memset_s(&__s, 8uLL, 0, 8uLL);
LABEL_71:
  v40 = *(_QWORD *)(a1 + 24);
  if ((v40 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
  {
    v41 = 1;
  }
  else
  {
    v42 = v40 - 1;
    if (v42 > 0xD)
      v41 = 0;
    else
      v41 = dword_1CF7FFD6C[v42];
  }
  v43 = (void *)container_xpc_send_sync_message(v41, 0, v12, 1, v32, a1 + 72, (uint64_t)&v66);
  v18 = v43;
  v19 = v23 != 0;
  v25 = v26 != 0;
  if (v43)
  {
    value = xpc_dictionary_get_value(v43, "ReplyContainersArray");
    v61 = 1;
    v17 = container_xpc_decode_create_container_object_array(value, &v65, &v61);
    if (!v17)
    {
      v15 = container_error_create(2, v61, 0, 0);
      v16 = v15;
      goto LABEL_23;
    }
  }
  else
  {
    v17 = 0;
  }
  v16 = v66;
LABEL_24:
  if (v16)
  {
    _container_references_replace_error((uint64_t *)a1, (uint64_t)v16);
    v29 = v66;
  }
  else
  {
    v29 = 0;
  }
  container_error_free(v29);
  if (a5)
    *a5 = v65;
  if (v12)
    xpc_release(v12);
  if (v18)
    xpc_release(v18);
  if (v19)
  {
    if (objects)
      xpc_release(objects);
    objects = 0;
  }
  if (v25 && object)
    xpc_release(object);
  return v17;
}

uint64_t container_references_remove(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v9[10];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C874D8];
  v10 = 0;
  v11 = &v10;
  v12 = 0x2000000000;
  v13 = 0;
  if (a1)
  {
    v5 = *(NSObject **)(a1 + 8);
    v9[0] = MEMORY[0x1E0C87450];
    v9[1] = 0x40000000;
    v9[2] = __container_references_remove_block_invoke;
    v9[3] = &unk_1E8CB29F8;
    v9[4] = &v10;
    v9[5] = a1;
    v9[6] = "container_references_remove";
    v9[7] = a2;
    v9[8] = a3;
    v9[9] = a4;
    os_activity_apply(v5, v9);
    container_log_ext_error((uint64_t)"container_references_remove", gClientFaultLoggingEnabled, *(uint64_t **)a1);
    v6 = v11[3];
  }
  else
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v7 = container_log_handle_for_category_logHandles[0];
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "container_references_remove";
      _os_log_fault_impl(&dword_1CF7DA000, v7, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: references parameter is NULL", buf, 0xCu);
    }
    v6 = 0;
  }
  _Block_object_dispose(&v10, 8);
  return v6;
}

void *__container_references_remove_block_invoke(uint64_t a1)
{
  void *result;

  _container_references_log_if_error(*(uint64_t **)(a1 + 40), *(_QWORD *)(a1 + 48));
  result = _container_add_remove(*(_QWORD *)(a1 + 40), 0x31uLL, *(xpc_object_t *)(a1 + 56), *(void **)(a1 + 64), *(_QWORD **)(a1 + 72), *(_QWORD *)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

BOOL container_references_iterate_by_owner_sync(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  _BOOL8 v5;
  NSObject *v6;
  _QWORD block[9];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C874D8];
  v9 = 0;
  v10 = &v9;
  v11 = 0x2000000000;
  v12 = 0;
  if (a1)
  {
    v4 = *(NSObject **)(a1 + 8);
    block[0] = MEMORY[0x1E0C87450];
    block[2] = __container_references_iterate_by_owner_sync_block_invoke;
    block[3] = &unk_1E8CB2A20;
    block[1] = 0x40000000;
    block[6] = a1;
    block[7] = "container_references_iterate_by_owner_sync";
    block[8] = a2;
    block[4] = a3;
    block[5] = &v9;
    os_activity_apply(v4, block);
    container_log_ext_error((uint64_t)"container_references_iterate_by_owner_sync", gClientFaultLoggingEnabled, *(uint64_t **)a1);
    v5 = *((_BYTE *)v10 + 24) != 0;
  }
  else
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v6 = container_log_handle_for_category_logHandles[0];
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "container_references_iterate_by_owner_sync";
      _os_log_fault_impl(&dword_1CF7DA000, v6, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: references parameter is NULL", buf, 0xCu);
    }
    v5 = 0;
  }
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __container_references_iterate_by_owner_sync_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  _container_references_log_if_error(*(uint64_t **)(a1 + 48), *(_QWORD *)(a1 + 56));
  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(v2 + 56) = 1;
  result = _container_references_query_execute(v2, *(xpc_object_t *)(a1 + 64), 0, v3, *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

uint64_t _container_references_query_execute(uint64_t a1, xpc_object_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  xpc_object_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  _BOOL4 v23;
  int v24;
  xpc_object_t v25;
  NSObject *v26;
  NSObject *v27;
  _QWORD *v28;
  int v29;
  unint64_t v30;
  const char *v31;
  unint64_t v32;
  uint64_t v33;
  uid_t v34;
  uid_t v35;
  const char *v36;
  uint8_t *v37;
  NSObject *v38;
  uint32_t v39;
  uint64_t v40;
  int v41;
  unint64_t v42;
  void *v43;
  xpc_object_t array;
  void *v45;
  xpc_object_t v46;
  void *v47;
  char *data;
  void *v49;
  uint64_t v51;
  uint64_t v52;
  size_t *v53;
  const char *string;
  const char *v55;
  uint64_t v56;
  BOOL v58;
  int current_persona_originator_info;
  int current_persona_proximate_info;
  int current_persona;
  const char *v62;
  uint64_t v63;
  uid_t v64;
  uid_t v65;
  const char *v66;
  const char *v67;
  int v68;
  int v69;
  int v70;
  xpc_object_t object;
  int objecta;
  _BOOL4 v73;
  int v74;
  _BOOL4 v75;
  void *__s;
  xpc_object_t value;
  xpc_object_t objects;
  void *v79;
  _DWORD v80[2];
  __int16 v81;
  const char *v82;
  __int16 v83;
  const char *v84;
  __int16 v85;
  int v86;
  __int16 v87;
  int v88;
  __int16 v89;
  int v90;
  __int16 v91;
  int v92;
  __int16 v93;
  uid_t v94;
  __int16 v95;
  uid_t v96;
  __int16 v97;
  void *v98;
  _BYTE buf[36];
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _BYTE v103[256];
  uint64_t v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  uint64_t v111;

  v111 = *MEMORY[0x1E0C874D8];
  objects = 0;
  v79 = 0;
  value = 0;
  if (!a1)
    return 0;
  v10 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v10, "Command", 0x2FuLL);
  xpc_dictionary_set_uint64(v10, "Flags", *(_QWORD *)(a1 + 48));
  xpc_dictionary_set_uint64(v10, "PrivateFlags", *(_QWORD *)(a1 + 56));
  v11 = *(_QWORD *)(a1 + 64);
  if (v11)
    container_xpc_encode_client_onto_message(v10, v11);
  xpc_dictionary_set_uint64(v10, "Explicit", *(_QWORD *)(a1 + 16));
  if ((*(_BYTE *)(a1 + 16) & 1) == 0)
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v12 = container_log_handle_for_category_logHandles[0];
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = a4;
      _os_log_fault_impl(&dword_1CF7DA000, v12, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: container_query_set_class() is required", buf, 0xCu);
    }
    v13 = container_error_create(3, 38, 0, 0);
    v14 = v13;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    goto LABEL_24;
  }
  xpc_dictionary_set_uint64(v10, "ContainerClass", *(_QWORD *)(a1 + 24));
  v18 = MEMORY[0x1E0C89020];
  v19 = MEMORY[0x1E0C88FC0];
  if (!a2)
  {
    v21 = 0;
    if (!a3)
    {
LABEL_27:
      v24 = 0;
      goto LABEL_37;
    }
LABEL_15:
    value = a3;
    v22 = MEMORY[0x1D17D6434](a3);
    v23 = v22 == v18;
    if (v22 == v18)
    {
      v24 = 1;
      v25 = xpc_array_create(&value, 1uLL);
      value = v25;
    }
    else
    {
      v24 = 0;
      v25 = value;
    }
    if (MEMORY[0x1D17D6434](v25) != v19)
    {
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v27 = container_log_handle_for_category_logHandles[0];
      if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = a4;
        _os_log_fault_impl(&dword_1CF7DA000, v27, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: group_identifiers is not an array or string", buf, 0xCu);
      }
      v14 = container_error_create(3, 38, 0, 0);
      v15 = 0;
      v16 = 0;
      v79 = v14;
      v17 = v21 != 0;
      if (!v14)
        goto LABEL_35;
      goto LABEL_76;
    }
    xpc_dictionary_set_value(v10, "GroupIdentifiers", value);
LABEL_37:
    v29 = 0;
    v30 = *(_QWORD *)(a1 + 24);
    if (v30 <= 0xE && ((1 << v30) & 0x4ED4) != 0)
    {
      if ((*(_BYTE *)(a1 + 16) & 2) != 0)
      {
        xpc_dictionary_set_uint64(v10, "UID", *(unsigned int *)(a1 + 32));
        v29 = *(_DWORD *)(a1 + 32);
      }
      else
      {
        v29 = 0;
      }
    }
    if ((*(_BYTE *)(a1 + 16) & 4) != 0)
    {
      v31 = *(const char **)(a1 + 40);
      if (v31)
        xpc_dictionary_set_string(v10, "PersonaUniqueString", v31);
    }
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    if (!os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_DEFAULT))
    {
LABEL_58:
      v40 = *(_QWORD *)(a1 + 24);
      if ((v40 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
      {
        v41 = 1;
      }
      else
      {
        v42 = v40 - 1;
        if (v42 > 0xD)
          v41 = 0;
        else
          v41 = dword_1CF7FFD6C[v42];
      }
      v43 = (void *)container_xpc_send_sync_message(v41, 0, v10, 1, v29, a1 + 72, (uint64_t)&v79);
      v16 = v43;
      v17 = v21 != 0;
      v23 = v24 != 0;
      if (v43)
      {
        object = xpc_retain(v43);
        array = xpc_dictionary_get_array(v16, "ReplyOwnerIdentifiers");
        v73 = v21 != 0;
        v75 = v24 != 0;
        if (array
          && (v45 = array, (v46 = xpc_dictionary_get_array(v16, "ReplyGroupIdentifiers")) != 0)
          && (v47 = v46,
              *(_QWORD *)buf = 0,
              (data = (char *)xpc_dictionary_get_data(v16, "ReplyFacts", (size_t *)buf)) != 0))
        {
          if (*(_QWORD *)buf >= 0x10uLL)
          {
            v51 = a5;
            v52 = (*(_QWORD *)buf >> 4) - 1;
            v53 = (size_t *)(data + 8);
            v49 = 0;
            do
            {
              string = xpc_array_get_string(v45, *(v53 - 1));
              v55 = xpc_array_get_string(v47, *v53);
              v56 = (*(uint64_t (**)(uint64_t, const char *, const char *))(v51 + 16))(v51, string, v55);
              v15 = v56;
              v58 = v52-- != 0;
              if (!(_DWORD)v56)
                break;
              v53 += 2;
            }
            while (v58);
          }
          else
          {
            v49 = 0;
            v15 = 1;
          }
        }
        else
        {
          v49 = container_error_create(2, 53, 0, 0);
          v15 = 0;
        }
        if (object)
          xpc_release(object);
        v17 = v73;
        v23 = v75;
        if ((v15 & 1) == 0)
          v79 = v49;
      }
      else
      {
        v15 = 0;
      }
      v14 = v79;
      if (!v79)
        goto LABEL_35;
LABEL_76:
      _container_references_replace_error((uint64_t *)a1, (uint64_t)v14);
      v15 = 0;
      v28 = v79;
      goto LABEL_77;
    }
    __s = (void *)MEMORY[0x1D17D632C](v10);
    v32 = *(_QWORD *)(a1 + 24);
    if ((v32 & 0xFFFFFFFFFFFFFFFELL) == 0xC || v32 <= 8 && ((1 << v32) & 0x12A) != 0)
    {
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v33 = qword_1ECD3F348;
      if (!os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_DEFAULT))
        goto LABEL_56;
      v34 = geteuid();
      v35 = getuid();
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&buf[4] = v34;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v35;
      *(_WORD *)&buf[14] = 2080;
      *(_QWORD *)&buf[16] = __s;
      v36 = "References query; euid = %d, uid = %d, query = %s";
      v37 = buf;
      v38 = v33;
      v39 = 24;
    }
    else
    {
      v109 = 0u;
      v110 = 0u;
      v108 = 0u;
      current_persona_originator_info = voucher_get_current_persona_originator_info();
      v74 = DWORD2(v108);
      objecta = DWORD1(v109);
      v106 = 0u;
      v107 = 0u;
      v105 = 0u;
      current_persona_proximate_info = voucher_get_current_persona_proximate_info();
      v69 = DWORD2(v105);
      v70 = current_persona_proximate_info;
      v68 = DWORD1(v106);
      v104 = 0;
      memset(v103, 0, sizeof(v103));
      v102 = 0u;
      v101 = 0u;
      v100 = 0u;
      memset(&buf[4], 0, 32);
      *(_DWORD *)buf = 2;
      current_persona = voucher_get_current_persona();
      if (current_persona == -1 || (kpersona_info() & 0x80000000) != 0)
      {
        v66 = "<unknown>";
        v67 = "NOPERSONA";
      }
      else
      {
        if ((*(_DWORD *)&buf[8] - 2) > 4)
          v62 = "<unknown>";
        else
          v62 = (&off_1E8CB3988)[*(_DWORD *)&buf[8] - 2];
        v67 = v62;
        v66 = &v103[4];
      }
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v63 = qword_1ECD3F350;
      if (!os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_DEFAULT))
        goto LABEL_56;
      v64 = geteuid();
      v65 = getuid();
      v80[0] = 67111426;
      v80[1] = current_persona;
      v81 = 2082;
      v82 = v67;
      v83 = 2082;
      v84 = v66;
      v85 = 1024;
      v86 = v74 & ~(current_persona_originator_info >> 31);
      v87 = 1024;
      v88 = objecta & ~(current_persona_originator_info >> 31);
      v89 = 1024;
      v90 = v69 & ~(v70 >> 31);
      v91 = 1024;
      v92 = v68 & ~(v70 >> 31);
      v93 = 1024;
      v94 = v64;
      v95 = 1024;
      v96 = v65;
      v97 = 2080;
      v98 = __s;
      v36 = "References query; personaid = %d, type = %{public}s, name = %{public}s, origin [pid = %d, personaid = %d], p"
            "roximate [pid = %d, personaid = %d], euid = %d, uid = %d, query = %s";
      v37 = (uint8_t *)v80;
      v38 = v63;
      v39 = 74;
    }
    _os_log_impl(&dword_1CF7DA000, v38, OS_LOG_TYPE_DEFAULT, v36, v37, v39);
LABEL_56:
    if (__s)
    {
      free(__s);
      memset_s(&__s, 8uLL, 0, 8uLL);
    }
    goto LABEL_58;
  }
  objects = a2;
  v20 = MEMORY[0x1D17D6434](a2);
  v17 = v20 == v18;
  if (v20 == v18)
  {
    v21 = 1;
    a2 = xpc_array_create(&objects, 1uLL);
    objects = a2;
  }
  else
  {
    v21 = 0;
  }
  if (MEMORY[0x1D17D6434](a2) == v19)
  {
    xpc_dictionary_set_value(v10, "OwnerIdentifiersArray", objects);
    if (!a3)
      goto LABEL_27;
    goto LABEL_15;
  }
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  v26 = container_log_handle_for_category_logHandles[0];
  if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = a4;
    _os_log_fault_impl(&dword_1CF7DA000, v26, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: owner_identifiers is not an array or string", buf, 0xCu);
  }
  v13 = container_error_create(3, 38, 0, 0);
  v14 = v13;
  v15 = 0;
  v16 = 0;
LABEL_24:
  v23 = 0;
  v79 = v13;
  if (v14)
    goto LABEL_76;
LABEL_35:
  v28 = 0;
LABEL_77:
  container_error_free(v28);
  if (v10)
    xpc_release(v10);
  if (v16)
    xpc_release(v16);
  if (v17)
  {
    if (objects)
      xpc_release(objects);
    objects = 0;
  }
  if (v23 && value)
    xpc_release(value);
  return v15;
}

BOOL container_references_iterate_by_group_sync(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  _BOOL8 v5;
  NSObject *v6;
  _QWORD block[9];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C874D8];
  v9 = 0;
  v10 = &v9;
  v11 = 0x2000000000;
  v12 = 0;
  if (a1)
  {
    v4 = *(NSObject **)(a1 + 8);
    block[0] = MEMORY[0x1E0C87450];
    block[2] = __container_references_iterate_by_group_sync_block_invoke;
    block[3] = &unk_1E8CB2A48;
    block[1] = 0x40000000;
    block[6] = a1;
    block[7] = "container_references_iterate_by_group_sync";
    block[8] = a2;
    block[4] = a3;
    block[5] = &v9;
    os_activity_apply(v4, block);
    container_log_ext_error((uint64_t)"container_references_iterate_by_group_sync", gClientFaultLoggingEnabled, *(uint64_t **)a1);
    v5 = *((_BYTE *)v10 + 24) != 0;
  }
  else
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v6 = container_log_handle_for_category_logHandles[0];
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "container_references_iterate_by_group_sync";
      _os_log_fault_impl(&dword_1CF7DA000, v6, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: references parameter is NULL", buf, 0xCu);
    }
    v5 = 0;
  }
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __container_references_iterate_by_group_sync_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  _container_references_log_if_error(*(uint64_t **)(a1 + 48), *(_QWORD *)(a1 + 56));
  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(v2 + 56) = *(_QWORD *)(v2 + 56) & 0xFFFFFFFFFFFFFFFCLL | 2;
  result = _container_references_query_execute(v2, 0, *(void **)(a1 + 64), v3, *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

uint64_t container_references_get_last_error(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t _container_references_get_servicing_pid(uint64_t a1)
{
  return *(unsigned int *)(a1 + 72);
}

void ___container_xpc_default_sender_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  container_xpc_release(*(_QWORD *)(a1 + 40));
}

uint64_t container_xpc_get_outgoing_message_postprocess_block()
{
  return _outgoingPostprocessor;
}

void *container_xpc_get_outgoing_message_send_block()
{
  return _outgoingSender;
}

uint64_t container_xpc_send_sync_message_with_object(uint64_t a1, void *a2, int a3, uint64_t a4)
{
  int v7;
  int v9;

  v9 = 0;
  v7 = container_disposition(a1, &v9);
  return container_xpc_send_sync_message(v7, 0, a2, a3, v9, 0, a4);
}

uint64_t container_xpc_set_client_context_during_block(void *a1, uint64_t a2)
{
  pthread_key_t v4;

  if (_container_xpc_pthread_key_for_client_context_onceToken != -1)
    dispatch_once(&_container_xpc_pthread_key_for_client_context_onceToken, &__block_literal_global_8);
  v4 = _container_xpc_pthread_key_for_client_context_key;
  if (!_container_xpc_pthread_key_for_client_context_key)
    return 147;
  pthread_setspecific(_container_xpc_pthread_key_for_client_context_key, a1);
  (*(void (**)(uint64_t))(a2 + 16))(a2);
  pthread_setspecific(v4, 0);
  return 1;
}

void ___container_xpc_pthread_key_for_client_context_block_invoke()
{
  int v0;
  int v1;
  NSObject *v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C874D8];
  v0 = pthread_key_create((pthread_key_t *)&_container_xpc_pthread_key_for_client_context_key, 0);
  if (v0)
  {
    v1 = v0;
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v2 = qword_1ECD3F348;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_FAULT))
    {
      v3[0] = 67109120;
      v3[1] = v1;
      _os_log_fault_impl(&dword_1CF7DA000, v2, OS_LOG_TYPE_FAULT, "Failed to create pthread key. container_perform_with_client_context() cannot continue; errno = %{darwin.errno}d",
        (uint8_t *)v3,
        8u);
    }
  }
}

void container_xpc_set_outgoing_message_postprocess_block(const void *a1)
{
  void *v1;

  if (a1)
    v1 = _Block_copy(a1);
  else
    v1 = 0;
  if (_outgoingPostprocessor)
    _Block_release((const void *)_outgoingPostprocessor);
  _outgoingPostprocessor = (uint64_t)v1;
}

uint64_t container_xpc_get_incoming_reply_preprocess_block()
{
  return _incomingPreprocessor;
}

void container_xpc_set_incoming_reply_preprocess_block(const void *a1)
{
  void *v1;

  if (a1)
    v1 = _Block_copy(a1);
  else
    v1 = 0;
  if (_incomingPreprocessor)
    _Block_release((const void *)_incomingPreprocessor);
  _incomingPreprocessor = (uint64_t)v1;
}

void container_xpc_set_outgoing_message_send_block(const void *a1)
{
  void *v1;

  v1 = &__block_literal_global_382;
  if (a1 && a1 != &__block_literal_global_382)
    v1 = _Block_copy(a1);
  if (_outgoingSender != &__block_literal_global_382)
    _Block_release(_outgoingSender);
  _outgoingSender = v1;
}

xpc_object_t container_entitlements_copy_container_identifiers(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  xpc_object_t v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  xpc_object_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  xpc_object_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v24;
  const char *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C874D8];
  v8 = xpc_array_create(0, 0);
  if (a4)
  {
    if (!a3)
    {
      switch(a2)
      {
        case 1:
        case 2:
        case 4:
        case 14:
          v14 = xpc_string_create(a1);
          xpc_array_append_value(v8, v14);
          if (v14)
            goto LABEL_34;
          return v8;
        case 7:
          v15 = (void *)(*(uint64_t (**)(uint64_t, const char *))(a4 + 16))(a4, "com.apple.security.application-groups");
          if (v15)
          {
            v16 = v15;
            _container_entitlements_append_strings_to_array(v8, v15);
            xpc_release(v16);
          }
          v17 = (void *)(*(uint64_t (**)(uint64_t, const char *))(a4 + 16))(a4, "com.apple.private.security.restricted-application-groups");
          goto LABEL_32;
        case 10:
          v18 = (void *)(*(uint64_t (**)(uint64_t, const char *))(a4 + 16))(a4, "com.apple.private.security.daemon-container");
          goto LABEL_25;
        case 12:
          v18 = (void *)(*(uint64_t (**)(uint64_t, const char *))(a4 + 16))(a4, "com.apple.security.system-container");
LABEL_25:
          if (!v18)
            return v8;
          v14 = v18;
          if (!xpc_BOOL_get_value(v18))
            return v8;
          v19 = xpc_string_create(a1);
          xpc_array_append_value(v8, v19);
          if (v19)
            xpc_release(v19);
          goto LABEL_34;
        case 13:
          v20 = (void *)(*(uint64_t (**)(uint64_t, const char *))(a4 + 16))(a4, "com.apple.security.system-groups");
          if (v20)
          {
            v21 = v20;
            _container_entitlements_append_strings_to_array(v8, v20);
            v22 = v21;
          }
          else
          {
            v17 = (void *)(*(uint64_t (**)(uint64_t, const char *))(a4 + 16))(a4, "com.apple.security.system-group-containers");
LABEL_32:
            if (!v17)
              return v8;
            v14 = v17;
            _container_entitlements_append_strings_to_array(v8, v17);
LABEL_34:
            v22 = v14;
          }
          xpc_release(v22);
          return v8;
        default:
          if (container_log_handle_for_category_onceToken != -1)
            dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
          v9 = container_log_handle_for_category_logHandles[0];
          if (!os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_FAULT))
            return v8;
          v24 = 136315394;
          v25 = "container_entitlements_copy_container_identifiers";
          v26 = 2048;
          v27 = a2;
          v10 = "%s: SPI MISUSE: Provided container class is not a valid container class: %llu";
          goto LABEL_7;
      }
    }
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v9 = container_log_handle_for_category_logHandles[0];
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_FAULT))
    {
      v24 = 136315394;
      v25 = "container_entitlements_copy_container_identifiers";
      v26 = 2048;
      v27 = a3;
      v10 = "%s: SPI MISUSE: Invalid flags specified: 0x%08llx";
LABEL_7:
      v11 = v9;
      v12 = 22;
      goto LABEL_12;
    }
  }
  else
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v13 = container_log_handle_for_category_logHandles[0];
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_FAULT))
    {
      v24 = 136315138;
      v25 = "container_entitlements_copy_container_identifiers";
      v10 = "%s: SPI MISUSE: entitlement_read_handler block is required";
      v11 = v13;
      v12 = 12;
LABEL_12:
      _os_log_fault_impl(&dword_1CF7DA000, v11, OS_LOG_TYPE_FAULT, v10, (uint8_t *)&v24, v12);
    }
  }
  return v8;
}

size_t _container_entitlements_append_strings_to_array(void *a1, void *a2)
{
  size_t result;
  size_t v5;
  uint64_t v6;
  xpc_object_t value;

  result = MEMORY[0x1D17D6434](a2);
  if (result == MEMORY[0x1E0C88FC0])
  {
    v5 = 0;
    v6 = MEMORY[0x1E0C89020];
    while (1)
    {
      result = xpc_array_get_count(a2);
      if (v5 >= result)
        break;
      value = xpc_array_get_value(a2, v5);
      if (MEMORY[0x1D17D6434]() == v6)
        xpc_array_append_value(a1, value);
      ++v5;
    }
  }
  return result;
}

void _container_traverse_state_init(void *a1)
{
  bzero(a1, 0x420uLL);
}

uint64_t *_container_traverse_state_deinit(uint64_t **a1)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  uint64_t *v5;
  uint64_t *result;
  uint64_t *__s;

  v2 = *a1;
  if (*a1)
  {
    do
    {
      v3 = (uint64_t *)*v2;
      *a1 = (uint64_t *)*v2;
      --*((_BYTE *)a1 + 1051);
      v4 = (uint64_t *)v2[1];
      if (v4)
      {
        *v4 = (uint64_t)a1[1];
        a1[1] = v4;
      }
      if ((v2[3] & 0x80000000) == 0)
      {
        (*((void (**)(void))gCMFSSeam + 19))();
        *((_DWORD *)v2 + 6) = -1;
        v3 = *a1;
      }
      *v2 = (uint64_t)a1[2];
      a1[2] = v2;
      v2 = v3;
    }
    while (v3);
  }
  while (1)
  {
    v5 = a1[1];
    if (!v5)
      break;
    __s = 0;
    a1[1] = (uint64_t *)*v5;
    __s = v5;
    free(v5);
    memset_s(&__s, 8uLL, 0, 8uLL);
  }
  while (1)
  {
    result = a1[2];
    if (!result)
      break;
    __s = 0;
    a1[2] = (uint64_t *)*result;
    __s = result;
    free(result);
    memset_s(&__s, 8uLL, 0, 8uLL);
  }
  return result;
}

_QWORD *_container_traverse_continuation_pop(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)a1;
  if (result)
  {
    *(_QWORD *)a1 = *result;
    --*(_BYTE *)(a1 + 1051);
  }
  return result;
}

uint64_t _container_traverse_continuation_free(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t result;

  v4 = *(_QWORD **)(a2 + 8);
  if (v4)
  {
    *v4 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v4;
  }
  result = *(unsigned int *)(a2 + 24);
  if ((result & 0x80000000) == 0)
  {
    result = (*((uint64_t (**)(void))gCMFSSeam + 19))();
    *(_DWORD *)(a2 + 24) = -1;
  }
  *(_QWORD *)a2 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = a2;
  return result;
}

_QWORD *_container_traverse_continuation_create(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *attr_buf;
  NSObject *v4;
  NSObject *v5;
  uint8_t v7[16];
  uint8_t buf[8];
  _QWORD *__s;

  v2 = *(_QWORD **)(a1 + 16);
  if (v2)
  {
    *(_QWORD *)(a1 + 16) = *v2;
    __s = v2;
  }
  else
  {
    v2 = malloc_type_calloc(1uLL, 0x20uLL, 0x10200406C4767B9uLL);
    __s = v2;
    if (!v2)
    {
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v5 = qword_1ECD3F380;
      if (os_log_type_enabled((os_log_t)qword_1ECD3F380, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CF7DA000, v5, OS_LOG_TYPE_ERROR, "Failed to allocate a continuation!", buf, 2u);
      }
      return 0;
    }
  }
  attr_buf = _container_traverse_get_attr_buf(a1);
  v2[1] = attr_buf;
  if (!attr_buf)
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v4 = qword_1ECD3F380;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F380, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_1CF7DA000, v4, OS_LOG_TYPE_ERROR, "Failed to allocate an attribute buffer!", v7, 2u);
    }
    free(v2);
    memset_s(&__s, 8uLL, 0, 8uLL);
    return 0;
  }
  v2[2] = 0;
  v2[3] = 0xFFFFFFFFLL;
  *v2 = *(_QWORD *)a1;
  *(_QWORD *)a1 = v2;
  ++*(_BYTE *)(a1 + 1051);
  return v2;
}

_QWORD *_container_traverse_get_attr_buf(uint64_t a1)
{
  _QWORD *v1;
  unsigned int v3;
  _QWORD *v4;
  _QWORD *v5;
  NSObject *v6;
  uint8_t v7[16];

  v1 = *(_QWORD **)(a1 + 8);
  if (v1)
  {
    *(_QWORD *)(a1 + 8) = *v1;
    return v1;
  }
  v3 = *(unsigned __int8 *)(a1 + 1050);
  if (v3 >= 0x10)
  {
    v4 = *(_QWORD **)a1;
    if (*(_QWORD *)a1 && v4[1])
    {
      do
      {
        v5 = v4;
        v4 = (_QWORD *)*v4;
      }
      while (v4 && v4[1]);
      v1 = (_QWORD *)v5[1];
      v5[1] = 0;
      *((_DWORD *)v5 + 7) = 0;
      *((_DWORD *)v5 + 5) = 0;
      if ((v5[3] & 0x80000000) == 0)
      {
        (*((void (**)(void))gCMFSSeam + 19))();
        *((_DWORD *)v5 + 6) = -1;
      }
    }
    else
    {
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v6 = qword_1ECD3F380;
      if (os_log_type_enabled((os_log_t)qword_1ECD3F380, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v7 = 0;
        _os_log_error_impl(&dword_1CF7DA000, v6, OS_LOG_TYPE_ERROR, "Failed to find a candidate buffer to scavenge!", v7, 2u);
      }
      return 0;
    }
    return v1;
  }
  *(_BYTE *)(a1 + 1050) = v3 + 1;
  return malloc_type_malloc(0x4000uLL, 0x8D486972uLL);
}

uint64_t _container_traverse_continuation_push(uint64_t result, _QWORD *a2)
{
  *a2 = *(_QWORD *)result;
  *(_QWORD *)result = a2;
  ++*(_BYTE *)(result + 1051);
  return result;
}

BOOL _container_traverse_path_push(uint64_t a1, const void *a2, size_t a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;

  v3 = *(unsigned __int16 *)(a1 + 1048);
  v4 = a3 + v3 + 1;
  if (v4 <= 0x3FF)
  {
    v6 = a1 + 24;
    *(_BYTE *)(a1 + 24 + v3) = 47;
    memcpy((void *)(*(unsigned __int16 *)(a1 + 1048) + a1 + 24 + 1), a2, a3);
    *(_WORD *)(a1 + 1048) = v4;
    *(_BYTE *)(v6 + v4) = 0;
  }
  return v4 < 0x400;
}

uint64_t _container_traverse_path_pop(uint64_t result)
{
  uint64_t v1;
  BOOL v2;

  v1 = *(unsigned __int16 *)(result + 1048);
  if (*(_WORD *)(result + 1048))
  {
    do
    {
      v2 = *(_BYTE *)(result + 23 + v1) == 47 || v1 == 1;
      --v1;
    }
    while (!v2);
  }
  *(_BYTE *)(result + 24 + (unsigned __int16)v1) = 0;
  *(_WORD *)(result + 1048) = v1;
  return result;
}

unsigned __int8 *_container_traverse_get_last_path_component(unint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  int v6;
  unsigned __int8 *result;

  v3 = a1 + a2;
  v4 = (unsigned __int8 *)(a1 + a2 - 1);
  while (1)
  {
    v5 = v4;
    v6 = *v4;
    if ((unint64_t)v4 <= a1)
      break;
    --v4;
    if (v6 == 47)
      goto LABEL_6;
  }
  if (v6 == 47)
  {
LABEL_6:
    result = v5 + 1;
    *a3 = v3 - (_QWORD)(v5 + 1);
    return result;
  }
  return 0;
}

BOOL container_traverse_directory(uint64_t a1, char a2, unsigned int a3, int *a4, uint64_t a5, uint64_t a6)
{
  int v12;
  unint64_t v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  _BOOL8 result;
  const char *v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t continuation_fd;
  unsigned __int8 *v22;
  unsigned __int8 *v23;
  int v24;
  NSObject *v25;
  NSObject *v26;
  __int128 *v27;
  unint64_t v28;
  int32x2_t *v29;
  _QWORD *attr_buf;
  unsigned int v31;
  unsigned __int32 v32;
  unsigned __int32 v33;
  unsigned int v34;
  unsigned int v35;
  int32x2_t v36;
  int v37;
  unint64_t v38;
  uint64_t v39;
  void *v40;
  size_t v41;
  unint64_t v42;
  char v43;
  int v44;
  __int128 *v45;
  uint64_t v46;
  uint64_t v47;
  unsigned __int16 v48;
  BOOL v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  unsigned __int16 v53;
  BOOL v54;
  _QWORD *v55;
  NSObject *v56;
  NSObject *v57;
  const char *v58;
  NSObject *v59;
  const char *v60;
  uint8_t *v61;
  NSObject *v62;
  NSObject *v63;
  _QWORD *v64;
  NSObject *v65;
  _QWORD *v66;
  __int32 v67;
  __int32 v68;
  _QWORD *v69;
  __int32 v70;
  NSObject *v71;
  _QWORD *v72;
  int *v73;
  uint64_t v74;
  char v75;
  uint64_t v76;
  uint64_t __s;
  uint64_t v78;
  uint64_t v79;
  __int16 v80;
  void *__src;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  int v88;
  __int128 buf;
  int32x2_t *v90;
  _BYTE v91[1024];
  unsigned __int16 v92;
  char v93;
  uint8_t v94[4];
  _BYTE v95[20];
  _BYTE *v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  int v101;
  uint8_t v102[32];
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  uint64_t v107;

  v107 = *MEMORY[0x1E0C874D8];
  if (!a1)
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v16 = qword_1ECD3F380;
    result = os_log_type_enabled((os_log_t)qword_1ECD3F380, OS_LOG_TYPE_FAULT);
    if (!result)
      return result;
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "container_traverse_directory";
    v18 = "%s: SPI MISUSE: path parameter is NULL";
LABEL_24:
    _os_log_fault_impl(&dword_1CF7DA000, v16, OS_LOG_TYPE_FAULT, v18, (uint8_t *)&buf, 0xCu);
    return 0;
  }
  if (!a5)
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v16 = qword_1ECD3F380;
    result = os_log_type_enabled((os_log_t)qword_1ECD3F380, OS_LOG_TYPE_FAULT);
    if (!result)
      return result;
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "container_traverse_directory";
    v18 = "%s: SPI MISUSE: node_handler parameter is NULL";
    goto LABEL_24;
  }
  __s = 0;
  v78 = 0;
  v79 = 0;
  memset_s(&__s, 0x18uLL, 0, 0x18uLL);
  LOWORD(__s) = 5;
  if ((a3 & 1) != 0)
    v12 = -1610579959;
  else
    v12 = -1610612727;
  HIDWORD(__s) = v12 & 0xBDB8FFFF | (((a3 >> 1) & 7) << 16) & 0xBDBFFFFF | (((a3 >> 5) & 1) << 22) & 0xBDFFFFFF | (((a3 >> 4) & 1) << 30) | (((a3 >> 6) & 1) << 25);
  if ((a3 & 0x80) != 0)
    LODWORD(v79) = v79 | 1;
  if ((a3 & 0x100) != 0)
    LODWORD(v79) = v79 | 4;
  HIDWORD(v78) = 6;
  bzero(&buf, 0x420uLL);
  v13 = __strlcpy_chk();
  if (v13 >= 0x400)
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v14 = qword_1ECD3F380;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F380, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v102 = 136315138;
      *(_QWORD *)&v102[4] = a1;
      _os_log_error_impl(&dword_1CF7DA000, v14, OS_LOG_TYPE_ERROR, "Attempted to iterate directories starting at a path that was too long: [%s]", v102, 0xCu);
    }
    v15 = 22;
    goto LABEL_156;
  }
  v92 = v13;
  v19 = _container_traverse_continuation_create((uint64_t)&buf);
  if (!v19)
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v25 = qword_1ECD3F380;
    if (!os_log_type_enabled((os_log_t)qword_1ECD3F380, OS_LOG_TYPE_ERROR))
      goto LABEL_39;
    *(_WORD *)v102 = 0;
    v58 = "Failed to create a continuation";
    goto LABEL_130;
  }
  if ((a2 & 1) != 0)
    goto LABEL_50;
  v20 = v19;
  LODWORD(__src) = 0;
  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  memset(v102, 0, sizeof(v102));
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v101 = 0;
  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  LOBYTE(v88) = 0;
  HIBYTE(v80) = 0;
  continuation_fd = _container_traverse_get_continuation_fd((uint64_t)&buf, (uint64_t)v19, 0, (int *)&__src);
  if ((_DWORD)continuation_fd == -1)
  {
LABEL_128:
    v15 = (int)__src;
    goto LABEL_156;
  }
  if ((*((unsigned int (**)(uint64_t, uint64_t *, _QWORD, uint64_t, _QWORD))gCMFSSeam + 32))(continuation_fd, &__s, v20[1], 0x4000, 0) == -1)
  {
    LODWORD(__src) = *__error();
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v26 = qword_1ECD3F380;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F380, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v94 = 136315394;
      *(_QWORD *)v95 = v91;
      *(_WORD *)&v95[8] = 1024;
      *(_DWORD *)&v95[10] = (_DWORD)__src;
      _os_log_error_impl(&dword_1CF7DA000, v26, OS_LOG_TYPE_ERROR, "fgetattrlist for [%s] failed; error = %{darwin.errno}d",
        v94,
        0x12u);
    }
    goto LABEL_128;
  }
  _container_traverse_parse_attr_buf((uint64_t)&buf, v20[1], (char *)v102, (uint64_t)&v97, &v88, 0, (_BYTE *)&v80 + 1);
  if (DWORD1(v103) != 2 && (v20[3] & 0x80000000) == 0)
  {
    (*((void (**)(void))gCMFSSeam + 19))();
    *((_DWORD *)v20 + 6) = -1;
  }
  v22 = (unsigned __int8 *)&buf + v92 + 23;
  while (1)
  {
    v23 = v22;
    v24 = *v22;
    if (v22 <= v91)
      break;
    --v22;
    if (v24 == 47)
      goto LABEL_45;
  }
  if (v24 != 47)
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v57 = qword_1ECD3F380;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F380, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v94 = 136315138;
      *(_QWORD *)v95 = v91;
      _os_log_error_impl(&dword_1CF7DA000, v57, OS_LOG_TYPE_ERROR, "Failed to locate last path element in [%s]", v94, 0xCu);
    }
    LODWORD(__src) = 40;
    goto LABEL_128;
  }
LABEL_45:
  v27 = &v97;
  if (!(_BYTE)v88)
    v27 = 0;
  v28 = _container_traverse_call_node_handler(-1, a2, (uint64_t)v91, v92, (uint64_t)(v23 + 1), &v91[v92] - (v23 + 1), 0, (uint64_t)v102, (uint64_t)&v82, (uint64_t)v27, a5);
  if (HIBYTE(v80) || DWORD1(v103) != 2 || v28 > 1)
    goto LABEL_176;
LABEL_50:
  v29 = (int32x2_t *)buf;
  if (!(_QWORD)buf)
  {
LABEL_176:
    _container_traverse_state_deinit((uint64_t **)&buf);
    return 1;
  }
  v73 = a4;
  v74 = a6;
  v75 = a2;
  while (1)
  {
    *(int32x2_t *)&buf = *v29;
    --v93;
    if (!*(_QWORD *)&v29[1])
    {
      attr_buf = _container_traverse_get_attr_buf((uint64_t)&buf);
      v29[1] = (int32x2_t)attr_buf;
      if (!attr_buf)
      {
        if (container_log_handle_for_category_onceToken != -1)
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        v25 = qword_1ECD3F380;
        if (!os_log_type_enabled((os_log_t)qword_1ECD3F380, OS_LOG_TYPE_ERROR))
          goto LABEL_39;
        *(_WORD *)v102 = 0;
        v58 = "Failed to locate an attr buf";
LABEL_130:
        _os_log_error_impl(&dword_1CF7DA000, v25, OS_LOG_TYPE_ERROR, v58, v102, 2u);
LABEL_39:
        v15 = 12;
        goto LABEL_156;
      }
    }
    v76 = (uint64_t)v29;
LABEL_55:
    v88 = 0;
    v105 = 0u;
    v106 = 0u;
    v103 = 0u;
    v104 = 0u;
    memset(v102, 0, sizeof(v102));
    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    v31 = v29[3].u16[2];
    if (!v29[3].i16[2])
      goto LABEL_95;
    v32 = v29[2].u32[0];
    v33 = v29[2].u32[1];
    v34 = v32 - v33;
    if (v32 < v33)
    {
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      a4 = v73;
      v56 = qword_1ECD3F380;
      if (!os_log_type_enabled((os_log_t)qword_1ECD3F380, OS_LOG_TYPE_ERROR))
        goto LABEL_122;
      v67 = v29[2].i32[0];
      v68 = v29[2].i32[1];
      LODWORD(v97) = 67109376;
      DWORD1(v97) = v67;
      WORD4(v97) = 1024;
      *(_DWORD *)((char *)&v97 + 10) = v68;
      v60 = "Internal error: totalProcessedEntryCount (%u) was less than reprocessCount (%u)";
      goto LABEL_178;
    }
    if (v32 == v33)
    {
      v35 = v29[3].u16[3];
    }
    else
    {
      if (v34 >= v31)
      {
        v29[2].i32[1] = v33 + v31;
        v29[3].i16[3] = v31;
        goto LABEL_95;
      }
      v35 = (unsigned __int16)(v32 - v33);
      v29[3].i16[3] = v34;
      v29[2].i32[1] = v32;
    }
    v36 = v29[1];
    if (v35)
    {
      v37 = 0;
      v38 = 0;
      while (1)
      {
        v39 = *(unsigned int *)(*(_QWORD *)&v36 + v38);
        v38 += v39;
        if (v38 > 0x4000)
          break;
        if (++v37 >= v35)
          goto LABEL_67;
      }
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      a4 = v73;
      v56 = qword_1ECD3F380;
      if (!os_log_type_enabled((os_log_t)qword_1ECD3F380, OS_LOG_TYPE_ERROR))
      {
LABEL_122:
        v15 = 40;
        goto LABEL_151;
      }
      LODWORD(v97) = 67109376;
      DWORD1(v97) = v39;
      WORD4(v97) = 1024;
      *(_DWORD *)((char *)&v97 + 10) = v37;
      v60 = "Read entry length %u for entry %hu but that put us off the end of the buffer";
LABEL_178:
      v61 = (uint8_t *)&v97;
LABEL_179:
      _os_log_error_impl(&dword_1CF7DA000, v56, OS_LOG_TYPE_ERROR, v60, v61, 0xEu);
      goto LABEL_122;
    }
    v38 = 0;
LABEL_67:
    if (v35 < v31)
      break;
LABEL_95:
    LODWORD(v82) = 0;
    v50 = _container_traverse_get_continuation_fd((uint64_t)&buf, (uint64_t)v29, 1, (int *)&v82);
    if ((_DWORD)v50 == -1)
      goto LABEL_163;
    v51 = (*((uint64_t (**)(uint64_t, uint64_t *, _QWORD, uint64_t, _QWORD))gCMFSSeam + 52))(v50, &__s, *(_QWORD *)&v29[1], 0x4000, 0);
    if (v51)
    {
      if (v51 == -1)
      {
        LODWORD(v82) = *__error();
        if (container_log_handle_for_category_onceToken != -1)
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        v65 = qword_1ECD3F380;
        if (os_log_type_enabled((os_log_t)qword_1ECD3F380, OS_LOG_TYPE_ERROR))
        {
          v70 = v29[2].i32[0];
          *(_DWORD *)v102 = 67109634;
          *(_DWORD *)&v102[4] = v70;
          *(_WORD *)&v102[8] = 2080;
          *(_QWORD *)&v102[10] = v91;
          *(_WORD *)&v102[18] = 1024;
          *(_DWORD *)&v102[20] = v82;
          _os_log_error_impl(&dword_1CF7DA000, v65, OS_LOG_TYPE_ERROR, "getattrlistbulk failed on entry %u in [%s]; error = %{darwin.errno}d",
            v102,
            0x18u);
        }
LABEL_163:
        v15 = v82;
        v66 = (_QWORD *)v29[1];
        if (v66)
        {
          *v66 = *((_QWORD *)&buf + 1);
          *((_QWORD *)&buf + 1) = v66;
        }
        a4 = v73;
        if ((v29[3].i32[0] & 0x80000000) == 0)
          goto LABEL_154;
        goto LABEL_155;
      }
      v29[3].i16[2] = v51;
      v29[3].i16[3] = 0;
      goto LABEL_55;
    }
    if (v74
      && ((v75 & 1) == 0 || (_QWORD)buf)
      && ((*(uint64_t (**)(uint64_t, _BYTE *))(v74 + 16))(v74, v91) & 1) == 0)
    {
      v72 = (_QWORD *)v29[1];
      if (v72)
      {
        *v72 = *((_QWORD *)&buf + 1);
        *((_QWORD *)&buf + 1) = v72;
      }
      v29 = (int32x2_t *)v76;
LABEL_173:
      if ((v29[3].i32[0] & 0x80000000) == 0)
      {
        (*((void (**)(void))gCMFSSeam + 19))();
        v29[3].i32[0] = -1;
      }
      *v29 = (int32x2_t)v90;
      v90 = v29;
      goto LABEL_176;
    }
    v52 = v92;
    a4 = v73;
    if (v92)
    {
      do
      {
        v53 = v52 - 1;
        v54 = v91[v52 - 1] == 47 || v52 == 1;
        --v52;
      }
      while (!v54);
      v52 = v53;
    }
    v91[v52] = 0;
    v92 = v52;
    v55 = (_QWORD *)v29[1];
    if (v55)
    {
      *v55 = *((_QWORD *)&buf + 1);
      *((_QWORD *)&buf + 1) = v55;
    }
    if ((v29[3].i32[0] & 0x80000000) == 0)
    {
      (*((void (**)(void))gCMFSSeam + 19))();
      v29[3].i32[0] = -1;
    }
    *v29 = (int32x2_t)v90;
    v90 = v29;
LABEL_117:
    v29 = (int32x2_t *)buf;
    if (!(_QWORD)buf)
      goto LABEL_176;
  }
  while (1)
  {
    __src = 0;
    v101 = 0;
    v99 = 0u;
    v100 = 0u;
    v97 = 0u;
    v98 = 0u;
    v80 = 0;
    _container_traverse_parse_attr_buf((uint64_t)&buf, *(_QWORD *)&v36 + v38, (char *)&v82, (uint64_t)&v97, &v80, &__src, (_BYTE *)&v80 + 1);
    v40 = __src;
    if (!__src)
    {
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v59 = qword_1ECD3F380;
      if (os_log_type_enabled((os_log_t)qword_1ECD3F380, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v94 = 67109378;
        *(_DWORD *)v95 = v35;
        *(_WORD *)&v95[4] = 2080;
        *(_QWORD *)&v95[6] = v91;
        _os_log_error_impl(&dword_1CF7DA000, v59, OS_LOG_TYPE_ERROR, "Entry %hu in %s did not include name information even though we requested it.", v94, 0x12u);
      }
      v15 = 40;
      goto LABEL_150;
    }
    v38 += v82;
    if (v38 > 0x4000)
    {
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      a4 = v73;
      v56 = qword_1ECD3F380;
      if (os_log_type_enabled((os_log_t)qword_1ECD3F380, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v94 = 67109376;
        *(_DWORD *)v95 = v82;
        *(_WORD *)&v95[4] = 1024;
        *(_DWORD *)&v95[6] = v35;
        v60 = "Read entry length %u for entry %hu but that put us off the end of the buffer";
        v61 = v94;
        goto LABEL_179;
      }
      goto LABEL_122;
    }
    if (DWORD2(v83))
    {
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v62 = qword_1ECD3F380;
      if (os_log_type_enabled((os_log_t)qword_1ECD3F380, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v94 = 67109634;
        *(_DWORD *)v95 = v35;
        *(_WORD *)&v95[4] = 2080;
        *(_QWORD *)&v95[6] = v91;
        *(_WORD *)&v95[14] = 1024;
        *(_DWORD *)&v95[16] = DWORD2(v83);
        _os_log_error_impl(&dword_1CF7DA000, v62, OS_LOG_TYPE_ERROR, "got error while processing entry %hu in [%s]; error = %{darwin.errno}d",
          v94,
          0x18u);
      }
      v15 = DWORD2(v83);
      goto LABEL_150;
    }
    v41 = (v84 - 1);
    v42 = v41 + v92 + 1;
    if (v42 >= 0x400)
    {
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v63 = qword_1ECD3F380;
      if (os_log_type_enabled((os_log_t)qword_1ECD3F380, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v94 = 136315650;
        *(_QWORD *)v95 = __src;
        *(_WORD *)&v95[8] = 2048;
        *(_QWORD *)&v95[10] = v41;
        *(_WORD *)&v95[18] = 2080;
        v96 = v91;
        _os_log_error_impl(&dword_1CF7DA000, v63, OS_LOG_TYPE_ERROR, "Could not append element [%s] of length %zd to path [%s] because it would make the path longer than MAXPATHLEN", v94, 0x20u);
      }
      v15 = 63;
LABEL_150:
      a4 = v73;
      goto LABEL_151;
    }
    v91[v92] = 47;
    memcpy(&v91[v92 + 1], v40, v41);
    v92 = v42;
    v91[v42] = 0;
    v43 = v93;
    if ((a3 & 0x200) != 0)
    {
      v29 = (int32x2_t *)v76;
      v44 = _container_traverse_get_continuation_fd((uint64_t)&buf, v76, 1, &v88);
      v40 = __src;
    }
    else
    {
      v44 = -1;
      v29 = (int32x2_t *)v76;
    }
    v45 = &v97;
    if (!(_BYTE)v80)
      v45 = 0;
    v46 = _container_traverse_call_node_handler(v44, v75, (uint64_t)v91, v92, (uint64_t)v40, v41, v43 + 1, (uint64_t)&v82, (uint64_t)v102, (uint64_t)v45, a5);
    if (v46 == 3)
    {
      HIBYTE(v80) = 1;
    }
    else if (v46 == 2)
    {
      goto LABEL_171;
    }
    ++v29[3].i16[3];
    v29[2] = vadd_s32(v29[2], (int32x2_t)0x100000001);
    if (DWORD1(v84) != 2)
      goto LABEL_85;
    if (!HIBYTE(v80))
      break;
    if (v74 && !(*(unsigned int (**)(uint64_t, _BYTE *))(v74 + 16))(v74, v91))
    {
LABEL_171:
      v69 = (_QWORD *)v29[1];
      if (v69)
      {
        *v69 = *((_QWORD *)&buf + 1);
        *((_QWORD *)&buf + 1) = v69;
      }
      goto LABEL_173;
    }
LABEL_85:
    v47 = v92;
    if (v92)
    {
      do
      {
        v48 = v47 - 1;
        v49 = v91[v47 - 1] == 47 || v47 == 1;
        --v47;
      }
      while (!v49);
      v47 = v48;
    }
    ++v35;
    v91[v47] = 0;
    v92 = v47;
    if (v35 >= v29[3].u16[2])
      goto LABEL_95;
  }
  *v29 = (int32x2_t)buf;
  *(_QWORD *)&buf = v29;
  ++v93;
  if (_container_traverse_continuation_create((uint64_t)&buf))
  {
    a4 = v73;
    goto LABEL_117;
  }
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  v71 = qword_1ECD3F380;
  if (os_log_type_enabled((os_log_t)qword_1ECD3F380, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v94 = 0;
    _os_log_error_impl(&dword_1CF7DA000, v71, OS_LOG_TYPE_ERROR, "Failed to create a continuation", v94, 2u);
  }
  v15 = 12;
  a4 = v73;
  v29 = (int32x2_t *)v76;
LABEL_151:
  v64 = (_QWORD *)v29[1];
  if (v64)
  {
    *v64 = *((_QWORD *)&buf + 1);
    *((_QWORD *)&buf + 1) = v64;
  }
  if ((v29[3].i32[0] & 0x80000000) == 0)
  {
LABEL_154:
    (*((void (**)(void))gCMFSSeam + 19))();
    v29[3].i32[0] = -1;
  }
LABEL_155:
  *v29 = (int32x2_t)v90;
  v90 = v29;
LABEL_156:
  _container_traverse_state_deinit((uint64_t **)&buf);
  result = 0;
  if (a4)
    *a4 = v15;
  return result;
}

uint64_t _container_traverse_get_continuation_fd(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C874D8];
  result = *(unsigned int *)(a2 + 24);
  if ((_DWORD)result == -1)
  {
    if (a3)
      v8 = 1081600;
    else
      v8 = 2129920;
    v9 = a1 + 24;
    result = (*((uint64_t (**)(uint64_t, uint64_t))gCMFSSeam + 64))(a1 + 24, v8);
    if ((result & 0x80000000) == 0)
    {
      *(_DWORD *)(a2 + 24) = result;
      return result;
    }
    v10 = *__error();
    if (v10 == 2)
      goto LABEL_11;
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v11 = qword_1ECD3F380;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F380, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315394;
      v13 = v9;
      v14 = 1024;
      v15 = v10;
      _os_log_error_impl(&dword_1CF7DA000, v11, OS_LOG_TYPE_ERROR, "Failed to open [%s]; error = %{darwin.errno}d",
        (uint8_t *)&v12,
        0x12u);
      if (!a4)
        return 0xFFFFFFFFLL;
    }
    else
    {
LABEL_11:
      if (!a4)
        return 0xFFFFFFFFLL;
    }
    *a4 = v10;
    return 0xFFFFFFFFLL;
  }
  return result;
}

void _container_traverse_parse_attr_buf(uint64_t a1, uint64_t a2, char *__s, uint64_t a4, _BYTE *a5, _QWORD *a6, _BYTE *a7)
{
  int v14;
  int v15;
  uint64_t *v16;
  uint64_t v17;
  char *v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  NSObject *v24;
  int v25;
  int v26;
  int v27;
  int v28;
  uint64_t v29;
  char *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  int v35;
  int v36;
  int v37;
  uint64_t v38;
  __int16 v39;
  char *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C874D8];
  if (__s)
    memset_s(__s, 0x60uLL, 0, 0x60uLL);
  *(_DWORD *)__s = *(_DWORD *)a2;
  v14 = *(_DWORD *)(a2 + 20);
  *(_OWORD *)(__s + 4) = *(_OWORD *)(a2 + 4);
  *((_DWORD *)__s + 5) = v14;
  v15 = *((_DWORD *)__s + 1);
  if ((v15 & 0x20000000) == 0)
  {
    v16 = (uint64_t *)(a2 + 24);
    if ((v15 & 1) != 0)
      goto LABEL_5;
LABEL_8:
    v18 = 0;
    if ((v15 & 8) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  *((_DWORD *)__s + 6) = *(_DWORD *)(a2 + 24);
  v16 = (uint64_t *)(a2 + 28);
  if ((v15 & 1) == 0)
    goto LABEL_8;
LABEL_5:
  v17 = *v16;
  *(_QWORD *)(__s + 28) = *v16;
  v18 = (char *)v16++ + (int)v17;
  if ((v15 & 8) != 0)
  {
LABEL_9:
    v19 = *(_DWORD *)v16;
    v16 = (uint64_t *)((char *)v16 + 4);
    *((_DWORD *)__s + 9) = v19;
  }
LABEL_10:
  if ((v15 & 0x8000) != 0)
  {
    v25 = *(_DWORD *)v16;
    v16 = (uint64_t *)((char *)v16 + 4);
    *((_DWORD *)__s + 10) = v25;
    if ((v15 & 0x10000) == 0)
    {
LABEL_12:
      if ((v15 & 0x20000) == 0)
        goto LABEL_13;
      goto LABEL_32;
    }
  }
  else if ((v15 & 0x10000) == 0)
  {
    goto LABEL_12;
  }
  v26 = *(_DWORD *)v16;
  v16 = (uint64_t *)((char *)v16 + 4);
  *((_DWORD *)__s + 11) = v26;
  if ((v15 & 0x20000) == 0)
  {
LABEL_13:
    if ((v15 & 0x40000) == 0)
      goto LABEL_14;
    goto LABEL_33;
  }
LABEL_32:
  v27 = *(_DWORD *)v16;
  v16 = (uint64_t *)((char *)v16 + 4);
  *((_DWORD *)__s + 12) = v27;
  if ((v15 & 0x40000) == 0)
  {
LABEL_14:
    if ((v15 & 0x400000) == 0)
      goto LABEL_15;
    goto LABEL_34;
  }
LABEL_33:
  v28 = *(_DWORD *)v16;
  v16 = (uint64_t *)((char *)v16 + 4);
  *((_DWORD *)__s + 13) = v28;
  if ((v15 & 0x400000) == 0)
  {
LABEL_15:
    if ((v15 & 0x2000000) == 0)
      goto LABEL_16;
    goto LABEL_35;
  }
LABEL_34:
  v29 = *v16;
  *((_QWORD *)__s + 7) = *v16;
  v30 = (char *)v16 + (int)v29;
  *(_OWORD *)a4 = *(_OWORD *)v30;
  v31 = *((_OWORD *)v30 + 1);
  v32 = *((_OWORD *)v30 + 2);
  v33 = *((_OWORD *)v30 + 3);
  *(_DWORD *)(a4 + 64) = *((_DWORD *)v30 + 16);
  *(_OWORD *)(a4 + 32) = v32;
  *(_OWORD *)(a4 + 48) = v33;
  *(_OWORD *)(a4 + 16) = v31;
  *a5 = 1;
  ++v16;
  v15 = *((_DWORD *)__s + 1);
  if ((v15 & 0x2000000) == 0)
  {
LABEL_16:
    if ((v15 & 0x40000000) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_35:
  v34 = *v16++;
  *((_QWORD *)__s + 8) = v34;
  if ((v15 & 0x40000000) != 0)
  {
LABEL_17:
    v20 = *(_DWORD *)v16;
    v16 = (uint64_t *)((char *)v16 + 4);
    *((_DWORD *)__s + 18) = v20;
  }
LABEL_18:
  if (*((_DWORD *)__s + 9) == 2)
  {
    v21 = *((_DWORD *)__s + 3);
    if ((v21 & 2) != 0)
    {
      v22 = *(_DWORD *)v16;
      v16 = (uint64_t *)((char *)v16 + 4);
      *((_DWORD *)__s + 20) = v22;
      if (!v22)
        *a7 = 1;
    }
    if ((v21 & 4) != 0)
    {
      v23 = *(_DWORD *)v16;
      *((_DWORD *)__s + 21) = v23;
      if (*(_BYTE *)(a1 + 1051))
      {
        if ((v23 & 3) != 0)
        {
          if (container_log_handle_for_category_onceToken != -1)
            dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
          v24 = qword_1ECD3F380;
          if (os_log_type_enabled((os_log_t)qword_1ECD3F380, OS_LOG_TYPE_DEBUG))
          {
            v37 = 136315394;
            v38 = a1 + 24;
            v39 = 2080;
            v40 = v18;
            _os_log_debug_impl(&dword_1CF7DA000, v24, OS_LOG_TYPE_DEBUG, "skipping mount point or trigger at [%s]/[%s]", (uint8_t *)&v37, 0x16u);
          }
          *a7 = 1;
        }
      }
    }
  }
  else
  {
    v35 = *((_DWORD *)__s + 4);
    if ((v35 & 1) != 0)
    {
      v36 = *(_DWORD *)v16;
      v16 = (uint64_t *)((char *)v16 + 4);
      *((_DWORD *)__s + 20) = v36;
    }
    if ((v35 & 4) != 0)
      *((_QWORD *)__s + 11) = *v16;
  }
  if (a6)
    *a6 = v18;
}

uint64_t _container_traverse_call_node_handler(int a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  __int16 v22;
  unsigned int v23;
  BOOL v24;
  int v25;
  uint64_t v26;
  char v28;

  v17 = *(_DWORD *)(a8 + 36);
  if ((a2 & 2) != 0 && v17 == 2)
    return 1;
  if (a1 < 0)
  {
    v19 = 0xFFFFFFFFLL;
  }
  else
  {
    v19 = (*((uint64_t (**)(void))gCMFSSeam + 24))();
    v17 = *(_DWORD *)(a8 + 36);
  }
  *(_DWORD *)(a9 + 80) = v19;
  *(_QWORD *)a9 = *(_QWORD *)(a8 + 64);
  *(_QWORD *)(a9 + 8) = *(_QWORD *)(a8 + 88);
  *(_QWORD *)(a9 + 16) = a3;
  *(_WORD *)(a9 + 88) = 0;
  *(_QWORD *)(a9 + 24) = a4;
  *(_QWORD *)(a9 + 32) = a5;
  v20 = *(unsigned int *)(a8 + 52);
  *(_QWORD *)(a9 + 40) = a6;
  *(_QWORD *)(a9 + 48) = v20;
  *(_DWORD *)(a9 + 56) = v17;
  v21 = *(_DWORD *)(a8 + 72);
  *(_DWORD *)(a9 + 60) = *(_DWORD *)(a8 + 80);
  *(_DWORD *)(a9 + 64) = v21;
  *(_QWORD *)(a9 + 68) = *(_QWORD *)(a8 + 40);
  *(_DWORD *)(a9 + 76) = *(_DWORD *)(a8 + 80);
  v22 = *(_WORD *)(a8 + 48) & 0xFFF;
  *(_WORD *)(a9 + 84) = v22;
  v23 = v17 - 1;
  if (v23 <= 6)
    *(_WORD *)(a9 + 84) = word_1CF7FFD40[v23] | v22;
  if (a10)
    v24 = *(_DWORD *)(a10 + 36) != -1;
  else
    v24 = 0;
  *(_BYTE *)(a9 + 86) = v24;
  *(_BYTE *)(a9 + 87) = a7;
  v28 = 1;
  v25 = (*(uint64_t (**)(uint64_t, uint64_t, char *))(a11 + 16))(a11, a9, &v28);
  v26 = 3;
  if (v28)
    v26 = 1;
  if (v25)
    v18 = v26;
  else
    v18 = 2;
  if ((v19 & 0x80000000) == 0)
    (*((void (**)(uint64_t))gCMFSSeam + 19))(v19);
  return v18;
}

const char *container_traverse_node_get_path(uint64_t a1, _QWORD *a2)
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C874D8];
  if (a1)
  {
    if (a2)
      *a2 = *(_QWORD *)(a1 + 24);
    return *(const char **)(a1 + 16);
  }
  else
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v3 = qword_1ECD3F380;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F380, OS_LOG_TYPE_FAULT))
    {
      v4 = 136315138;
      v5 = "container_traverse_node_get_path";
      _os_log_fault_impl(&dword_1CF7DA000, v3, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: node parameter is NULL", (uint8_t *)&v4, 0xCu);
    }
    return "<NULL>";
  }
}

const char *container_traverse_node_get_name(uint64_t a1, _QWORD *a2)
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C874D8];
  if (a1)
  {
    if (a2)
      *a2 = *(_QWORD *)(a1 + 40);
    return *(const char **)(a1 + 32);
  }
  else
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v3 = qword_1ECD3F380;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F380, OS_LOG_TYPE_FAULT))
    {
      v4 = 136315138;
      v5 = "container_traverse_node_get_name";
      _os_log_fault_impl(&dword_1CF7DA000, v3, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: node parameter is NULL", (uint8_t *)&v4, 0xCu);
    }
    return "<NULL>";
  }
}

uint64_t container_traverse_node_get_subordinate_count(uint64_t a1)
{
  uint64_t result;
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C874D8];
  if (a1)
    return *(unsigned int *)(a1 + 60);
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  v2 = qword_1ECD3F380;
  result = os_log_type_enabled((os_log_t)qword_1ECD3F380, OS_LOG_TYPE_FAULT);
  if ((_DWORD)result)
  {
    v3 = 136315138;
    v4 = "container_traverse_node_get_subordinate_count";
    _os_log_fault_impl(&dword_1CF7DA000, v2, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: node parameter is NULL", (uint8_t *)&v3, 0xCu);
    return 0;
  }
  return result;
}

uint64_t container_traverse_node_get_depth_from_origin(uint64_t a1)
{
  uint64_t result;
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C874D8];
  if (a1)
    return *(unsigned __int8 *)(a1 + 87);
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  v2 = qword_1ECD3F380;
  result = os_log_type_enabled((os_log_t)qword_1ECD3F380, OS_LOG_TYPE_FAULT);
  if ((_DWORD)result)
  {
    v3 = 136315138;
    v4 = "container_traverse_node_get_depth_from_origin";
    _os_log_fault_impl(&dword_1CF7DA000, v2, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: node parameter is NULL", (uint8_t *)&v3, 0xCu);
    return 0;
  }
  return result;
}

BOOL container_traverse_node_is_directory(uint64_t a1)
{
  _BOOL8 result;
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C874D8];
  if (a1)
    return *(_DWORD *)(a1 + 56) == 2;
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  v2 = qword_1ECD3F380;
  result = os_log_type_enabled((os_log_t)qword_1ECD3F380, OS_LOG_TYPE_FAULT);
  if (result)
  {
    v3 = 136315138;
    v4 = "container_traverse_node_is_directory";
    _os_log_fault_impl(&dword_1CF7DA000, v2, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: node parameter is NULL", (uint8_t *)&v3, 0xCu);
    return 0;
  }
  return result;
}

BOOL container_traverse_node_is_symlink(uint64_t a1)
{
  _BOOL8 result;
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C874D8];
  if (a1)
    return *(_DWORD *)(a1 + 56) == 5;
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  v2 = qword_1ECD3F380;
  result = os_log_type_enabled((os_log_t)qword_1ECD3F380, OS_LOG_TYPE_FAULT);
  if (result)
  {
    v3 = 136315138;
    v4 = "container_traverse_node_is_symlink";
    _os_log_fault_impl(&dword_1CF7DA000, v2, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: node parameter is NULL", (uint8_t *)&v3, 0xCu);
    return 0;
  }
  return result;
}

BOOL container_traverse_node_is_regular_file(uint64_t a1)
{
  _BOOL8 result;
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C874D8];
  if (a1)
    return *(_DWORD *)(a1 + 56) == 1;
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  v2 = qword_1ECD3F380;
  result = os_log_type_enabled((os_log_t)qword_1ECD3F380, OS_LOG_TYPE_FAULT);
  if (result)
  {
    v3 = 136315138;
    v4 = "container_traverse_node_is_regular_file";
    _os_log_fault_impl(&dword_1CF7DA000, v2, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: node parameter is NULL", (uint8_t *)&v3, 0xCu);
    return 0;
  }
  return result;
}

uint64_t container_traverse_node_get_optional_file_id(uint64_t a1)
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C874D8];
  if (a1)
    return *(_QWORD *)a1;
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  v2 = qword_1ECD3F380;
  if (os_log_type_enabled((os_log_t)qword_1ECD3F380, OS_LOG_TYPE_FAULT))
  {
    v3 = 136315138;
    v4 = "container_traverse_node_get_optional_file_id";
    _os_log_fault_impl(&dword_1CF7DA000, v2, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: node parameter is NULL", (uint8_t *)&v3, 0xCu);
  }
  return 0;
}

uint64_t container_traverse_node_get_optional_alloc_size(uint64_t a1)
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C874D8];
  if (a1)
    return *(_QWORD *)(a1 + 8);
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  v2 = qword_1ECD3F380;
  if (os_log_type_enabled((os_log_t)qword_1ECD3F380, OS_LOG_TYPE_FAULT))
  {
    v3 = 136315138;
    v4 = "container_traverse_node_get_optional_alloc_size";
    _os_log_fault_impl(&dword_1CF7DA000, v2, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: node parameter is NULL", (uint8_t *)&v3, 0xCu);
  }
  return -1;
}

uint64_t container_traverse_node_get_optional_flags(uint64_t a1)
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C874D8];
  if (a1)
    return *(_QWORD *)(a1 + 48);
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  v2 = qword_1ECD3F380;
  if (os_log_type_enabled((os_log_t)qword_1ECD3F380, OS_LOG_TYPE_FAULT))
  {
    v3 = 136315138;
    v4 = "container_traverse_node_get_optional_flags";
    _os_log_fault_impl(&dword_1CF7DA000, v2, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: node parameter is NULL", (uint8_t *)&v3, 0xCu);
  }
  return 0;
}

uint64_t container_traverse_node_get_optional_dp_class(uint64_t a1)
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C874D8];
  if (a1)
    return *(unsigned int *)(a1 + 64);
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  v2 = qword_1ECD3F380;
  if (os_log_type_enabled((os_log_t)qword_1ECD3F380, OS_LOG_TYPE_FAULT))
  {
    v3 = 136315138;
    v4 = "container_traverse_node_get_optional_dp_class";
    _os_log_fault_impl(&dword_1CF7DA000, v2, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: node parameter is NULL", (uint8_t *)&v3, 0xCu);
  }
  return 0xFFFFFFFFLL;
}

uint64_t container_traverse_node_get_optional_uid(uint64_t a1)
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C874D8];
  if (a1)
    return *(unsigned int *)(a1 + 68);
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  v2 = qword_1ECD3F380;
  if (os_log_type_enabled((os_log_t)qword_1ECD3F380, OS_LOG_TYPE_FAULT))
  {
    v3 = 136315138;
    v4 = "container_traverse_node_get_optional_uid";
    _os_log_fault_impl(&dword_1CF7DA000, v2, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: node parameter is NULL", (uint8_t *)&v3, 0xCu);
  }
  return 4294967294;
}

uint64_t container_traverse_node_get_optional_gid(uint64_t a1)
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C874D8];
  if (a1)
    return *(unsigned int *)(a1 + 72);
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  v2 = qword_1ECD3F380;
  if (os_log_type_enabled((os_log_t)qword_1ECD3F380, OS_LOG_TYPE_FAULT))
  {
    v3 = 136315138;
    v4 = "container_traverse_node_get_optional_gid";
    _os_log_fault_impl(&dword_1CF7DA000, v2, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: node parameter is NULL", (uint8_t *)&v3, 0xCu);
  }
  return 4294967294;
}

uint64_t container_traverse_node_get_optional_link_count(uint64_t a1)
{
  unsigned int v1;
  NSObject *v2;
  uint8_t buf[16];
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C874D8];
  if (a1)
  {
    v1 = *(_DWORD *)(a1 + 76);
    if (v1 < 0x10000)
      return (unsigned __int16)v1;
    v7 = 0u;
    v8 = 0u;
    v5 = 0u;
    v6 = 0u;
    *(_OWORD *)buf = 0u;
    os_log_type_enabled(MEMORY[0x1E0C88E98], OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
  }
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  v2 = qword_1ECD3F380;
  if (os_log_type_enabled((os_log_t)qword_1ECD3F380, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "container_traverse_node_get_optional_link_count";
    _os_log_fault_impl(&dword_1CF7DA000, v2, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: node parameter is NULL", buf, 0xCu);
  }
  LOWORD(v1) = 0;
  return (unsigned __int16)v1;
}

uint64_t container_traverse_node_get_optional_mode(uint64_t a1)
{
  uint64_t result;
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C874D8];
  if (a1)
    return *(unsigned __int16 *)(a1 + 84);
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  v2 = qword_1ECD3F380;
  result = os_log_type_enabled((os_log_t)qword_1ECD3F380, OS_LOG_TYPE_FAULT);
  if ((_DWORD)result)
  {
    v3 = 136315138;
    v4 = "container_traverse_node_get_optional_mode";
    _os_log_fault_impl(&dword_1CF7DA000, v2, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: node parameter is NULL", (uint8_t *)&v3, 0xCu);
    return 0;
  }
  return result;
}

BOOL container_traverse_node_optional_has_acl(uint64_t a1)
{
  _BOOL8 result;
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C874D8];
  if (a1)
    return *(_BYTE *)(a1 + 86) != 0;
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  v2 = qword_1ECD3F380;
  result = os_log_type_enabled((os_log_t)qword_1ECD3F380, OS_LOG_TYPE_FAULT);
  if (result)
  {
    v3 = 136315138;
    v4 = "container_traverse_node_optional_has_acl";
    _os_log_fault_impl(&dword_1CF7DA000, v2, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: node parameter is NULL", (uint8_t *)&v3, 0xCu);
    return 0;
  }
  return result;
}

uint64_t container_traverse_node_get_optional_parent_fd(uint64_t a1)
{
  uint64_t result;
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C874D8];
  if (a1)
    return *(unsigned int *)(a1 + 80);
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  v2 = qword_1ECD3F380;
  result = os_log_type_enabled((os_log_t)qword_1ECD3F380, OS_LOG_TYPE_FAULT);
  if ((_DWORD)result)
  {
    v3 = 136315138;
    v4 = "container_traverse_node_get_optional_parent_fd";
    _os_log_fault_impl(&dword_1CF7DA000, v2, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: node parameter is NULL", (uint8_t *)&v3, 0xCu);
    return 0;
  }
  return result;
}

char *container_traverse_node_copy_unlocalized_description(uint64_t a1)
{
  const char *v2;
  const char *v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int optional_link_count;
  const char *v10;
  const char *v11;
  int v12;
  const char *v13;
  const char *v14;
  __int128 v16;
  char *v17;

  v17 = 0;
  if (!a1)
    return strdup("<NULL>");
  v2 = *(const char **)(a1 + 32);
  v3 = *(const char **)(a1 + 16);
  v16 = *(_OWORD *)a1;
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_DWORD *)(a1 + 60);
  v6 = *(_DWORD *)(a1 + 64);
  v7 = *(_DWORD *)(a1 + 68);
  v8 = *(_DWORD *)(a1 + 72);
  optional_link_count = container_traverse_node_get_optional_link_count(a1);
  v10 = (const char *)&unk_1CF80235E;
  v11 = "DIR";
  v12 = *(_DWORD *)(a1 + 56);
  if (v12 != 2)
    v11 = (const char *)&unk_1CF80235E;
  v13 = "REG";
  if (v12 != 1)
    v13 = (const char *)&unk_1CF80235E;
  if (v12 == 5)
    v10 = "LNK";
  if (*(_BYTE *)(a1 + 86))
    v14 = " true";
  else
    v14 = "false";
  asprintf(&v17, "(%04d:0x%08llx:0x%08llx:0x%04lx:%02d:%04d:%04d:%04d:O%06o:%03d:%s%s%s:%s:%03d)[%s][%s]", v5, (_QWORD)v16, *((_QWORD *)&v16 + 1), v4, v6, v7, v8, optional_link_count, *(unsigned __int16 *)(a1 + 84), *(unsigned __int8 *)(a1 + 87), v11, v13, v10, v14, *(_DWORD *)(a1 + 80), v2, v3);
  return v17;
}

char **container_traverse_node_copy(_OWORD *a1)
{
  char **v2;
  char **v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  int v8;

  if (!a1)
    return 0;
  v2 = (char **)malloc_type_calloc(1uLL, 0x60uLL, 0x101004039251551uLL);
  v3 = v2;
  if (v2)
  {
    v4 = a1[1];
    *(_OWORD *)v2 = *a1;
    *((_OWORD *)v2 + 1) = v4;
    v5 = a1[2];
    v6 = a1[3];
    v7 = a1[5];
    *((_OWORD *)v2 + 4) = a1[4];
    *((_OWORD *)v2 + 5) = v7;
    *((_OWORD *)v2 + 2) = v5;
    *((_OWORD *)v2 + 3) = v6;
    asprintf(v2 + 2, "%s", *((const char **)a1 + 2));
    *((_BYTE *)v3 + 88) = 1;
    asprintf(v3 + 4, "%s", *((const char **)a1 + 4));
    *((_BYTE *)v3 + 89) = 1;
    *((_DWORD *)v3 + 20) = -1;
    v8 = *((_DWORD *)a1 + 20);
    if (v8 != -1)
      *((_DWORD *)v3 + 20) = dup(v8);
  }
  return v3;
}

uint64_t container_traverse_node_free(uint64_t result)
{
  uint64_t v1;
  int v2;
  void *v3;
  void *v4;
  uint64_t __s;

  __s = result;
  if (result)
  {
    v1 = result;
    v2 = *(_DWORD *)(result + 80);
    if (v2 != -1)
    {
      close(v2);
      *(_DWORD *)(v1 + 80) = -1;
    }
    if (*(_BYTE *)(v1 + 88))
    {
      v3 = *(void **)(v1 + 16);
      if (v3)
      {
        free(v3);
        memset_s((void *)(v1 + 16), 8uLL, 0, 8uLL);
      }
    }
    if (*(_BYTE *)(v1 + 89))
    {
      v4 = *(void **)(v1 + 32);
      if (v4)
      {
        free(v4);
        memset_s((void *)(v1 + 32), 8uLL, 0, 8uLL);
      }
    }
    free((void *)v1);
    return memset_s(&__s, 8uLL, 0, 8uLL);
  }
  return result;
}

uint64_t container_log_client_fault_logging_is_enabled()
{
  return gClientFaultLoggingEnabled;
}

uint64_t container_log_set_client_fault_logging(uint64_t result)
{
  gClientFaultLoggingEnabled = result;
  return result;
}

uint64_t container_xpc_connection_is_shared()
{
  return gContainerXPCUsesSharedConnection;
}

void container_xpc_set_use_shared_connection(int a1)
{
  NSObject *v2;
  const char *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C874D8];
  if (gContainerXPCUsesSharedConnection != a1)
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v2 = qword_1ECD3F348;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_DEFAULT))
    {
      v3 = "Disabling";
      if (a1)
        v3 = "Enabling";
      v4 = 136446210;
      v5 = v3;
      _os_log_impl(&dword_1CF7DA000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s connection sharing", (uint8_t *)&v4, 0xCu);
    }
    gContainerXPCUsesSharedConnection = a1;
  }
}

uint64_t container_internal_get_first_boot_uuid(_QWORD *a1)
{
  if (container_internal_get_first_boot_uuid_once != -1)
  {
    dispatch_once(&container_internal_get_first_boot_uuid_once, &__block_literal_global_468);
    if (!a1)
      return container_internal_get_first_boot_uuid_uuid;
    goto LABEL_3;
  }
  if (a1)
LABEL_3:
    *a1 = container_internal_get_first_boot_uuid_length;
  return container_internal_get_first_boot_uuid_uuid;
}

uint64_t __container_internal_get_first_boot_uuid_block_invoke()
{
  uint64_t result;
  _BYTE v1[38];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C874D8];
  memset(v1, 0, sizeof(v1));
  container_internal_get_first_boot_uuid_length = 38;
  if ((sysctlbyname("kern.bootsessionuuid", v1, (size_t *)&container_internal_get_first_boot_uuid_length, 0, 0) & 0x80000000) == 0)
  {
    result = (uint64_t)strndup(v1, container_internal_get_first_boot_uuid_length);
LABEL_3:
    container_internal_get_first_boot_uuid_uuid = result;
    return result;
  }
  result = (uint64_t)__error();
  if (*(_DWORD *)result == 12)
  {
    container_internal_get_first_boot_uuid_length = 0;
    result = sysctlbyname("kern.bootsessionuuid", 0, (size_t *)&container_internal_get_first_boot_uuid_length, 0, 0);
    if (!(_DWORD)result)
    {
      result = (uint64_t)malloc_type_calloc(container_internal_get_first_boot_uuid_length, 1uLL, 0x2A79BC7EuLL);
      container_internal_get_first_boot_uuid_uuid = result;
      if (result)
      {
        result = sysctlbyname("kern.bootsessionuuid", (void *)result, (size_t *)&container_internal_get_first_boot_uuid_length, 0, 0);
        if ((result & 0x80000000) != 0)
        {
          result = container_internal_get_first_boot_uuid_uuid;
          if (container_internal_get_first_boot_uuid_uuid)
          {
            free((void *)container_internal_get_first_boot_uuid_uuid);
            memset_s(&container_internal_get_first_boot_uuid_uuid, 8uLL, 0, 8uLL);
            result = 0;
          }
          goto LABEL_3;
        }
      }
    }
  }
  return result;
}

BOOL container_class_supports_randomized_path(int a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0 || a1 != 6 && a1 != 1)
    return 1;
  return a2 != 2 && a2 != 7;
}

BOOL container_class_supports_randomized_path_on_current_platform(uint64_t a1, char a2)
{
  int active_platform;

  active_platform = dyld_get_active_platform();
  if ((a2 & 1) != 0 || active_platform != 6 && active_platform != 1)
    return 1;
  return a1 != 2 && a1 != 7;
}

uint64_t container_class_for_each_normalized_class(uint64_t result)
{
  uint64_t v1;
  uint64_t i;

  v1 = result;
  for (i = 0; i != 15; ++i)
  {
    if (i)
      result = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 16))(v1, i);
  }
  return result;
}

uint64_t container_persona_collect_all_ids(void *a1, uint64_t a2, void **a3, size_t *a4)
{
  size_t v7;
  int i;
  size_t v9;
  void *__src;

  v7 = 0;
  __src = a1;
  for (i = 1; i != 8; ++i)
  {
    if ((kpersona_find_by_type() & 0x80000000) != 0)
      v9 = 0;
    else
      v9 = a2 - v7;
    v7 += v9;
  }
  qsort_b(__src, v7, 4uLL, &__block_literal_global_476);
  *a3 = __src;
  *a4 = v7;
  return 1;
}

uint64_t __container_persona_collect_all_ids_block_invoke(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  if (*a2 < *a3)
    return 0xFFFFFFFFLL;
  else
    return *a3 < *a2;
}

uint64_t container_persona_foreach(uint64_t a1)
{
  uint64_t result;
  _BYTE *v3;
  size_t v4;
  _DWORD *v5;
  int v6;
  size_t v8;
  _BYTE *__s;
  int v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  _BYTE v33[256];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C874D8];
  v8 = 0;
  __s = 0;
  result = container_persona_collect_all_ids(v33, 64, (void **)&__s, &v8);
  v4 = v8;
  v3 = __s;
  if (v8)
  {
    v5 = __s;
    do
    {
      v32 = 0;
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v11 = 0u;
      v10 = 2;
      v6 = kpersona_info();
      if (v6)
        LODWORD(v11) = *v5;
      result = (*(uint64_t (**)(uint64_t, BOOL, int *))(a1 + 16))(a1, v6 == 0, &v10);
      ++v5;
      --v4;
    }
    while (v4);
  }
  if (v3 != v33 && v3 != 0)
  {
    free(v3);
    return memset_s(&__s, 8uLL, 0, 8uLL);
  }
  return result;
}

uint64_t container_persona_convert_unique_string_to_persona_uid(uint64_t a1)
{
  if (a1)
    kpersona_find();
  return 0xFFFFFFFFLL;
}

void container_log_error_with_faults(uint64_t a1, uint64_t a2)
{
  container_log_error(a1, gClientFaultLoggingEnabled, a2);
}

void container_log_ext_error_with_faults(uint64_t a1, uint64_t *a2)
{
  container_log_ext_error(a1, gClientFaultLoggingEnabled, a2);
}

void container_log_replication_enable_to_uid_relative_path(const char *a1, int a2)
{
  _container_log_replication_enable_to_uid_relative_path(1, a1, a2);
}

void _container_log_replication_enable_to_uid_relative_path(int a1, const char *a2, int a3)
{
  unsigned __int8 v6;
  int *v7;
  int v8;
  NSObject *v9;
  char *v10;
  NSObject *v11;
  unsigned __int8 v12;
  char *__s;
  char *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C874D8];
  os_unfair_lock_lock(&_container_log_replication_enable_to_uid_relative_path_lock);
  v6 = atomic_load(_container_log_replication_enable_to_uid_relative_path_enabled);
  if (!a1)
  {
    if ((v6 & 1) != 0)
    {
      os_trace_get_mode();
      os_trace_set_mode();
      do
        __ldaxr(_container_log_replication_enable_to_uid_relative_path_enabled);
      while (__stlxr(0, _container_log_replication_enable_to_uid_relative_path_enabled));
      (*((void (**)(_QWORD))gCMFSSeam + 19))(_container_log_replication_enable_to_uid_relative_path_log_fd);
      _container_log_replication_enable_to_uid_relative_path_log_fd = -1;
    }
    goto LABEL_31;
  }
  if ((v6 & 1) != 0)
  {
LABEL_31:
    os_unfair_lock_unlock(&_container_log_replication_enable_to_uid_relative_path_lock);
    return;
  }
  if (!a2)
  {
    _os_crash();
    __break(1u);
    goto LABEL_35;
  }
  if (a3 == -1)
  {
LABEL_35:
    _os_crash();
    __break(1u);
    goto LABEL_36;
  }
  v15 = 0;
  v16 = 0;
  v14 = 0;
  if (!container_paths_create_uid_home_relative(a3, 3, &v15, &v16))
  {
    v10 = container_error_copy_unlocalized_description((uint64_t)v16);
    __s = v10;
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v11 = qword_1ECD3F380;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F380, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v18 = v10;
      _os_log_fault_impl(&dword_1CF7DA000, v11, OS_LOG_TYPE_FAULT, "Log replication failed to create directory; error = %s",
        buf,
        0xCu);
      if (!v10)
      {
LABEL_21:
        if (_container_log_replication_enable_to_uid_relative_path_log_fd < 0)
        {
LABEL_26:
          if (v15)
          {
            free(v15);
            memset_s(&v15, 8uLL, 0, 8uLL);
          }
          if (v14)
          {
            free(v14);
            memset_s(&v14, 8uLL, 0, 8uLL);
          }
          container_error_free(v16);
          goto LABEL_31;
        }
LABEL_22:
        if (_container_log_replication_enable_to_uid_relative_path_onceToken != -1)
          dispatch_once(&_container_log_replication_enable_to_uid_relative_path_onceToken, &__block_literal_global_30);
        do
          v12 = __ldaxr(_container_log_replication_enable_to_uid_relative_path_enabled);
        while (__stlxr(v12 | 1, _container_log_replication_enable_to_uid_relative_path_enabled));
        os_trace_get_mode();
        os_trace_set_mode();
        goto LABEL_26;
      }
    }
    else if (!v10)
    {
      goto LABEL_21;
    }
    free(v10);
    memset_s(&__s, 8uLL, 0, 8uLL);
    goto LABEL_21;
  }
  asprintf(&v14, "%s/%s.log", (const char *)v15, a2);
  if (v14)
  {
    _container_log_replication_enable_to_uid_relative_path_log_fd = (*((uint64_t (**)(char *, uint64_t, uint64_t, _QWORD))gCMFSSeam
                                                                     + 65))(v14, 521, 4, 0);
    v7 = __error();
    if (_container_log_replication_enable_to_uid_relative_path_log_fd < 0)
    {
      v8 = *v7;
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v9 = qword_1ECD3F380;
      if (os_log_type_enabled((os_log_t)qword_1ECD3F380, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v18) = v8;
        _os_log_fault_impl(&dword_1CF7DA000, v9, OS_LOG_TYPE_FAULT, "Log replication failed to open output stream; error = %{darwin.errno}d",
          buf,
          8u);
      }
      goto LABEL_26;
    }
    goto LABEL_22;
  }
LABEL_36:
  _os_crash();
  __break(1u);
}

uint64_t ___container_log_replication_enable_to_uid_relative_path_block_invoke()
{
  uint64_t result;

  result = os_log_set_hook();
  _container_log_replication_enable_to_uid_relative_path_g_log_hook = result;
  return result;
}

uint64_t ___container_log_replication_enable_to_uid_relative_path_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned __int8 v3;
  const char *v4;
  int v5;
  char *v6;
  size_t v7;
  uint64_t result;

  v3 = atomic_load(_container_log_replication_enable_to_uid_relative_path_enabled);
  if ((v3 & 1) != 0)
  {
    v4 = *(const char **)(a3 + 128);
    if (v4)
    {
      v5 = _container_log_replication_enable_to_uid_relative_path_log_fd;
      if (!strcmp("com.apple.containermanager", v4))
      {
        v6 = (char *)os_log_copy_decorated_message();
        v7 = strlen(v6);
        write(v5, v6, v7);
        free(v6);
        fsync(v5);
      }
    }
  }
  result = _container_log_replication_enable_to_uid_relative_path_g_log_hook;
  if (_container_log_replication_enable_to_uid_relative_path_g_log_hook)
    return (*(uint64_t (**)(void))(_container_log_replication_enable_to_uid_relative_path_g_log_hook + 16))();
  return result;
}

void container_log_replication_disable()
{
  _container_log_replication_enable_to_uid_relative_path(0, 0, -1);
}

void *container_seam_fs_set_common(void *__src)
{
  void *result;

  result = memcpy(&gCMFSCustomSeamStore, __src, 0x2D0uLL);
  gCMFSSeam = &gCMFSCustomSeamStore;
  return result;
}

void container_seam_fs_reset()
{
  gCMFSSeam = &CMFSSEAM_DEFAULT;
}

_QWORD *container_query_create_from_container(uint64_t a1)
{
  _QWORD *v2;
  _DWORD *v3;
  const char *identifier;
  xpc_object_t v5;
  int uid;
  const char *persona_unique_string;
  char v8;
  uint64_t uuid;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  const unsigned __int8 *v13;
  int v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C874D8];
  if (a1)
  {
    v2 = container_query_create();
    v3 = container_object_get_class(a1);
    container_query_set_class(v2, (uint64_t)v3);
    identifier = (const char *)container_object_get_identifier(a1);
    v5 = xpc_string_create(identifier);
    container_query_set_identifiers(v2, v5);
    uid = container_object_get_uid(a1);
    container_query_set_uid((uint64_t)v2, uid);
    persona_unique_string = (const char *)container_object_get_persona_unique_string(a1);
    if (persona_unique_string)
      container_query_set_persona_unique_string(v2, persona_unique_string);
    v8 = container_object_is_transient(a1);
    container_query_set_transient((uint64_t)v2, v8);
    uuid = container_object_get_uuid(a1);
    if (v2)
    {
      if (v2[15])
      {
        if (container_log_handle_for_category_onceToken != -1)
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        v10 = qword_1ECD3F350;
        if (os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_FAULT))
        {
          v15 = 136315138;
          v16 = "_container_query_set_internal_uuid";
          _os_log_fault_impl(&dword_1CF7DA000, v10, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: query has already been executed", (uint8_t *)&v15, 0xCu);
        }
        _container_query_set_usage_error(v2, 111);
      }
      else
      {
        v13 = (const unsigned __int8 *)uuid;
        _container_query_log_if_error(*v2, (uint64_t)"_container_query_set_internal_uuid");
        uuid_copy((unsigned __int8 *)v2 + 66, v13);
        v2[2] |= 0x80uLL;
      }
    }
    else
    {
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v12 = qword_1ECD3F350;
      if (os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_FAULT))
      {
        v15 = 136315138;
        v16 = "_container_query_set_internal_uuid";
        _os_log_fault_impl(&dword_1CF7DA000, v12, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: query parameter is NULL", (uint8_t *)&v15, 0xCu);
      }
    }
    *((_DWORD *)v2 + 41) = voucher_get_current_persona();
    if (v5)
      xpc_release(v5);
  }
  else
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v11 = qword_1ECD3F350;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_FAULT))
    {
      v15 = 136315138;
      v16 = "container_query_create_from_container";
      _os_log_fault_impl(&dword_1CF7DA000, v11, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: container parameter is NULL", (uint8_t *)&v15, 0xCu);
    }
    return 0;
  }
  return v2;
}

void _container_query_set_usage_error(uint64_t *a1, uint64_t a2)
{
  _QWORD *v3;

  v3 = container_error_create(3, a2, 0, 0);
  _container_query_replace_error(a1, (uint64_t)v3);
  container_error_free(v3);
}

void container_query_operation_set_client(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  NSObject *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C874D8];
  if (a1)
  {
    if (*(_QWORD *)(a1 + 120))
    {
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v3 = qword_1ECD3F350;
      if (os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_FAULT))
      {
        v6 = 136315138;
        v7 = "container_query_operation_set_client";
        _os_log_fault_impl(&dword_1CF7DA000, v3, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: query has already been executed", (uint8_t *)&v6, 0xCu);
      }
      _container_query_set_usage_error((uint64_t *)a1, 111);
    }
    else
    {
      _container_query_log_if_error(*(_QWORD *)a1, (uint64_t)"container_query_operation_set_client");
      container_free_client(*(_QWORD **)(a1 + 112));
      *(_QWORD *)(a1 + 112) = container_copy_client(a2, 0);
    }
  }
  else
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v4 = qword_1ECD3F350;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_FAULT))
    {
      v6 = 136315138;
      v7 = "container_query_operation_set_client";
      _os_log_fault_impl(&dword_1CF7DA000, v4, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: query parameter is NULL", (uint8_t *)&v6, 0xCu);
    }
  }
}

uint64_t container_query_count_results(uint64_t a1)
{
  NSObject *v2;
  unsigned int *bytes_ptr;
  uint64_t v4;
  NSObject *v5;
  _QWORD block[7];
  __int128 buf;
  uint64_t v9;
  char v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C874D8];
  if (a1)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v9 = 0x2000000000;
    v10 = 1;
    _container_query_log_if_error(*(_QWORD *)a1, (uint64_t)"container_query_count_results");
    if (!*(_QWORD *)(a1 + 120))
    {
      v2 = *(NSObject **)(a1 + 8);
      block[0] = MEMORY[0x1E0C87450];
      block[1] = 0x40000000;
      block[2] = __container_query_count_results_block_invoke;
      block[3] = &unk_1E8CB2CA8;
      block[4] = &buf;
      block[5] = a1;
      block[6] = "container_query_count_results";
      os_activity_apply(v2, block);
    }
    if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
    {
      bytes_ptr = (unsigned int *)xpc_data_get_bytes_ptr(*(xpc_object_t *)(a1 + 120));
      if (bytes_ptr)
        v4 = bytes_ptr[2];
      else
        v4 = 0;
    }
    else
    {
      v4 = -1;
    }
    container_log_ext_error((uint64_t)"container_query_count_results", gClientFaultLoggingEnabled, *(uint64_t **)a1);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v5 = qword_1ECD3F350;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "container_query_count_results";
      _os_log_fault_impl(&dword_1CF7DA000, v5, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: query parameter is NULL", (uint8_t *)&buf, 0xCu);
    }
    return 0;
  }
  return v4;
}

BOOL __container_query_count_results_block_invoke(_QWORD *a1)
{
  _BOOL8 result;

  result = _container_query_execute(a1[5], a1[6]);
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  return result;
}

BOOL container_query_iterate_results_with_identifier_sync(uint64_t a1, const char *a2, uint64_t a3)
{
  NSObject *v6;
  _DWORD *bytes_ptr;
  unint64_t stored_string;
  BOOL v9;
  unsigned int v10;
  unint64_t v11;
  unsigned int v12;
  _QWORD *v13;
  NSObject *v14;
  _QWORD block[7];
  __int128 buf;
  uint64_t v18;
  char v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C874D8];
  if (a1)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v18 = 0x2000000000;
    v19 = 1;
    _container_query_log_if_error(*(_QWORD *)a1, (uint64_t)"container_query_iterate_results_with_identifier_sync");
    if (!*(_QWORD *)(a1 + 120))
    {
      v6 = *(NSObject **)(a1 + 8);
      block[0] = MEMORY[0x1E0C87450];
      block[1] = 0x40000000;
      block[2] = __container_query_iterate_results_with_identifier_sync_block_invoke;
      block[3] = &unk_1E8CB2D20;
      block[4] = &buf;
      block[5] = a1;
      block[6] = "container_query_iterate_results_with_identifier_sync";
      os_activity_apply(v6, block);
    }
    if (!*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
    {
      v9 = 0;
      goto LABEL_24;
    }
    bytes_ptr = xpc_data_get_bytes_ptr(*(xpc_object_t *)(a1 + 120));
    stored_string = container_frozenset_get_stored_string((uint64_t)bytes_ptr, a2);
    v9 = 1;
    if (stored_string)
    {
      if (bytes_ptr)
      {
        v10 = bytes_ptr[2];
        if (v10)
        {
          v11 = stored_string;
          v9 = 0;
          v12 = 0;
          v13 = 0;
          while (v11 != container_frozenset_get_identifier_of_container_at_index((uint64_t)bytes_ptr, v12))
          {
LABEL_15:
            v9 = ++v12 >= v10;
            if (v10 == v12)
            {
              if (!v13)
                goto LABEL_24;
LABEL_17:
              v13[11] = 0;
              *((_DWORD *)v13 + 24) = 0;
              container_object_free(v13);
              goto LABEL_24;
            }
          }
          if (v13)
          {
            if (v13[11])
              goto LABEL_14;
            container_object_free(v13);
          }
          v13 = malloc_type_calloc(1uLL, 0x70uLL, 0x10F00403C1846C7uLL);
LABEL_14:
          v13[11] = a1;
          *((_DWORD *)v13 + 24) = v12;
          if (!(*(unsigned int (**)(uint64_t, _QWORD *))(a3 + 16))(a3, v13))
            goto LABEL_17;
          goto LABEL_15;
        }
      }
    }
LABEL_24:
    container_log_ext_error((uint64_t)"container_query_iterate_results_with_identifier_sync", gClientFaultLoggingEnabled, *(uint64_t **)a1);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v14 = qword_1ECD3F350;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "container_query_iterate_results_with_identifier_sync";
      _os_log_fault_impl(&dword_1CF7DA000, v14, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: query parameter is NULL", (uint8_t *)&buf, 0xCu);
    }
    return 0;
  }
  return v9;
}

BOOL __container_query_iterate_results_with_identifier_sync_block_invoke(_QWORD *a1)
{
  _BOOL8 result;

  result = _container_query_execute(a1[5], a1[6]);
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  return result;
}

BOOL container_query_iterate_results_with_subquery_sync(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  NSObject *v7;
  _DWORD *bytes_ptr;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t *v16;
  uint64_t v17;
  _QWORD v19[8];
  uint64_t v20;
  int v21;
  char v22;
  BOOL v23;
  BOOL v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  int v30;
  _QWORD block[7];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  __int128 buf;
  uint64_t v41;
  char v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C874D8];
  v36 = 0;
  v37 = &v36;
  v38 = 0x2000000000;
  v39 = 0;
  if (a1)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v41 = 0x2000000000;
    v42 = 1;
    v32 = 0;
    v33 = &v32;
    v34 = 0x2000000000;
    v35 = 0;
    _container_query_log_if_error(*(_QWORD *)a1, (uint64_t)"container_query_iterate_results_with_subquery_sync");
    v6 = MEMORY[0x1E0C87450];
    if (!*(_QWORD *)(a1 + 120))
    {
      v7 = *(NSObject **)(a1 + 8);
      block[0] = MEMORY[0x1E0C87450];
      block[1] = 0x40000000;
      block[2] = __container_query_iterate_results_with_subquery_sync_block_invoke;
      block[3] = &unk_1E8CB2D48;
      block[4] = &buf;
      block[5] = a1;
      block[6] = "container_query_iterate_results_with_subquery_sync";
      os_activity_apply(v7, block);
    }
    if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
    {
      bytes_ptr = xpc_data_get_bytes_ptr(*(xpc_object_t *)(a1 + 120));
      v20 = *(unsigned int *)(a2 + 32);
      v21 = *(_DWORD *)(a2 + 48);
      v22 = *(_BYTE *)(a2 + 64);
      v9 = *(_QWORD *)(a2 + 16);
      v23 = (v9 & 2) != 0;
      v24 = (v9 & 8) != 0;
      v25 = (v9 & 0x20) != 0;
      if ((v9 & 0x10) != 0)
        v10 = *(_QWORD *)(a2 + 56);
      else
        v10 = 0;
      v26 = v10;
      if ((v9 & 1) != 0)
        v13 = *(_QWORD *)(a2 + 24);
      else
        v13 = 0;
      v27 = v13;
      if ((v9 & 4) != 0)
        v14 = *(_QWORD *)(a2 + 40);
      else
        v14 = 0;
      v28 = v14;
      v29 = 0;
      if (bytes_ptr)
        v15 = bytes_ptr[2];
      else
        v15 = 0;
      v30 = v15;
      *((_BYTE *)v37 + 24) = 1;
      v19[0] = v6;
      v19[1] = 0x40000000;
      v19[2] = __container_query_iterate_results_with_subquery_sync_block_invoke_2;
      v19[3] = &unk_1E8CB2D70;
      v19[4] = a3;
      v19[5] = &v32;
      v19[6] = &v36;
      v19[7] = a1;
      container_frozenset_enumerate_matches((uint64_t)bytes_ptr, (uint64_t)&v20, (uint64_t)v19);
      v16 = v33;
      v17 = v33[3];
      if (v17)
      {
        *(_QWORD *)(v17 + 88) = 0;
        *(_DWORD *)(v17 + 96) = 0;
        container_object_free((_QWORD *)v16[3]);
      }
    }
    container_log_ext_error((uint64_t)"container_query_iterate_results_with_subquery_sync", gClientFaultLoggingEnabled, *(uint64_t **)a1);
    v12 = *((_BYTE *)v37 + 24) != 0;
    _Block_object_dispose(&v32, 8);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v11 = qword_1ECD3F350;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "container_query_iterate_results_with_subquery_sync";
      _os_log_fault_impl(&dword_1CF7DA000, v11, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: query parameter is NULL", (uint8_t *)&buf, 0xCu);
    }
    v12 = 0;
  }
  _Block_object_dispose(&v36, 8);
  return v12;
}

BOOL __container_query_iterate_results_with_subquery_sync_block_invoke(_QWORD *a1)
{
  _BOOL8 result;

  result = _container_query_execute(a1[5], a1[6]);
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  return result;
}

uint64_t __container_query_iterate_results_with_subquery_sync_block_invoke_2(_QWORD *a1, int a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t result;

  v4 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  if (!v4 || !*(_QWORD *)(v4 + 88))
  {
    container_object_free((_QWORD *)v4);
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = malloc_type_calloc(1uLL, 0x70uLL, 0x10F00403C1846C7uLL);
    v4 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  }
  v5 = a1[7];
  *(_QWORD *)(v4 + 88) = v5;
  if (v5)
    v6 = a2;
  else
    v6 = 0;
  *(_DWORD *)(v4 + 96) = v6;
  result = (*(uint64_t (**)(void))(a1[4] + 16))();
  if ((result & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
  return result;
}

uint64_t container_query_get_last_error(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t _container_query_get_servicing_pid(uint64_t a1)
{
  return *(unsigned int *)(a1 + 160);
}

uint64_t container_query_copy(uint64_t *a1)
{
  os_activity_t v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C874D8];
  v9 = 0;
  v10 = &v9;
  v11 = 0x2000000000;
  v12 = 0;
  if (a1)
  {
    v2 = _os_activity_create(&dword_1CF7DA000, "container_query_t", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
    _container_query_log_if_error(*a1, (uint64_t)"container_query_copy");
    v3 = malloc_type_calloc(1uLL, 0xA8uLL, 0x10B004034091A17uLL);
    v10[3] = (uint64_t)v3;
    if (v3)
    {
      *(_DWORD *)(v10[3] + 164) = voucher_get_current_persona();
      v4 = a1[1];
      block[0] = MEMORY[0x1E0C87450];
      block[1] = 0x40000000;
      block[2] = __container_query_copy_block_invoke;
      block[3] = &unk_1E8CB2D98;
      block[4] = &v9;
      block[5] = a1;
      block[6] = v2;
      os_activity_apply(v4, block);
    }
  }
  else
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v5 = qword_1ECD3F350;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F350, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "container_query_copy";
      _os_log_fault_impl(&dword_1CF7DA000, v5, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: query parameter is NULL", buf, 0xCu);
    }
  }
  v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

char *__container_query_copy_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  xpc_object_t v4;
  xpc_object_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *result;

  v2 = a1[5];
  v3 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  v4 = *(xpc_object_t *)(v2 + 24);
  *(_QWORD *)(v3 + 32) = *(_QWORD *)(v2 + 32);
  if (v4)
    v4 = xpc_retain(v4);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) + 24) = v4;
  v5 = *(xpc_object_t *)(a1[5] + 40);
  if (v5)
    v5 = xpc_retain(v5);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) + 40) = v5;
  v6 = a1[5];
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) + 48) = *(_DWORD *)(v6 + 48);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) + 64) = *(_BYTE *)(v6 + 64);
  v7 = *(char **)(v6 + 56);
  if (v7)
    v7 = strndup(v7, 0x400uLL);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) + 56) = v7;
  v8 = a1[5];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) + 65) = *(_BYTE *)(v8 + 65);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) + 64) = *(_BYTE *)(v8 + 64);
  uuid_copy((unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) + 66), (const unsigned __int8 *)(v8 + 66));
  v9 = a1[5];
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) + 16) = *(_QWORD *)(v9 + 16);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) + 88) = *(_DWORD *)(v9 + 88);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) + 96) = *(_QWORD *)(v9 + 96);
  result = container_copy_client(*(_QWORD *)(v9 + 112), 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) + 112) = result;
  **(_QWORD **)(*(_QWORD *)(a1[4] + 8) + 24) = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) + 8) = a1[6];
  return result;
}

uint64_t container_disposition(uint64_t a1, _DWORD *a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if (!a1)
  {
LABEL_12:
    v5 = 0;
    if (!a2)
      return v5;
    goto LABEL_9;
  }
  v3 = a1;
  v4 = (unint64_t)container_object_get_class(a1);
  if ((v4 & 0xFFFFFFFFFFFFFFFELL) != 0xC)
  {
    if (v4 > 0xE)
      goto LABEL_11;
    if (((1 << v4) & 0x4ED4) != 0)
    {
      LODWORD(a1) = container_object_get_uid(v3);
      v5 = 2;
      if (!a2)
        return v5;
      goto LABEL_9;
    }
    if (((1 << v4) & 0x12A) == 0)
    {
LABEL_11:
      LODWORD(a1) = 0;
      goto LABEL_12;
    }
  }
  LODWORD(a1) = 0;
  v5 = 1;
  if (a2)
LABEL_9:
    *a2 = a1;
  return v5;
}

uint64_t container_get_class(uint64_t a1)
{
  if (a1)
    return (uint64_t)container_object_get_class(a1);
  return a1;
}

uint64_t container_get_uid(uint64_t a1)
{
  if (a1)
    return (uint64_t)container_object_get_uid(a1);
  return a1;
}

uint64_t container_disposition_for_array(uint64_t *a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v4;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t result;
  unsigned int v10;

  if (a2)
  {
    v4 = a2;
    v6 = 0;
    v7 = 0;
    while (1)
    {
      v8 = v6;
      v10 = 0;
      result = container_disposition(*a1, &v10);
      if ((_DWORD)result != 2)
        break;
      v6 = v10;
      if ((_DWORD)v8 && (_DWORD)v8 != v10)
      {
        result = 0;
        LODWORD(v6) = v8;
        if (a3)
          goto LABEL_16;
        return result;
      }
      if (v7)
        goto LABEL_9;
LABEL_10:
      ++a1;
      v7 = result;
      if (!--v4)
        goto LABEL_15;
    }
    v6 = v8;
    if (!v7)
      goto LABEL_10;
LABEL_9:
    if (v7 != (_DWORD)result)
    {
      result = 3;
LABEL_15:
      if (!a3)
        return result;
      goto LABEL_16;
    }
    goto LABEL_10;
  }
  result = 0;
  LODWORD(v6) = 0;
  if (a3)
LABEL_16:
    *a3 = v6;
  return result;
}

BOOL container_object_update_metadata(uint64_t a1, int a2, const char **a3, uint64_t *a4)
{
  const unsigned __int8 *uuid;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t *v12;
  _DWORD *v13;
  int uid;
  char v15;
  const char *identifier;
  xpc_object_t v17;
  _DWORD *v18;
  const char *persona_unique_string;
  uint64_t v20;
  _QWORD *single_result;
  _QWORD *v22;
  uint64_t v23;
  void *v24;
  const char *string;

  if (a1
    && (uuid = (const unsigned __int8 *)container_object_get_uuid(a1), !uuid_is_null(uuid))
    && container_object_get_identifier(a1)
    && (unint64_t)container_object_get_class(a1) - 1 <= 0xD)
  {
    v12 = container_query_create();
    v13 = container_object_get_class(a1);
    container_query_set_class(v12, (uint64_t)v13);
    uid = container_object_get_uid(a1);
    container_query_set_uid((uint64_t)v12, uid);
    v15 = container_object_is_transient(a1);
    container_query_set_transient((uint64_t)v12, v15);
    identifier = (const char *)container_object_get_identifier(a1);
    v17 = xpc_string_create(identifier);
    v18 = container_object_get_class(a1);
    if (v18 == (_DWORD *)13 || v18 == (_DWORD *)7)
      container_query_set_group_identifiers(v12, v17);
    else
      container_query_set_identifiers(v12, v17);
    persona_unique_string = (const char *)container_object_get_persona_unique_string(a1);
    if (persona_unique_string)
      container_query_set_persona_unique_string(v12, persona_unique_string);
    if (a2)
      v20 = 0x300000000;
    else
      v20 = 0x100000000;
    container_query_operation_set_flags(v12, v20);
    v12[13] |= 3uLL;
    single_result = container_query_get_single_result((uint64_t)v12);
    v9 = single_result != 0;
    if (single_result)
    {
      v22 = single_result;
      container_update_with_container(a1, (uint64_t)single_result);
      if (a3)
      {
        v23 = v22[11];
        if (v23 && (v24 = *(void **)(v23 + 128)) != 0)
          string = xpc_array_get_string(v24, *((unsigned int *)v22 + 24));
        else
          string = (const char *)v22[6];
        if (string)
          string = strndup(string, 0x800uLL);
        *a3 = string;
      }
      v10 = 1;
    }
    else if (*v12)
    {
      v10 = *(_QWORD *)*v12;
    }
    else
    {
      v10 = 21;
    }
    container_query_free(v12);
    if (v17)
      xpc_release(v17);
  }
  else
  {
    v9 = 0;
    v10 = 11;
  }
  if (a4 && v10 != 1)
    *a4 = v10;
  return v9;
}

void container_update_with_container(uint64_t a1, uint64_t a2)
{
  const unsigned __int8 *uuid;
  const unsigned __int8 *v5;
  unsigned __int8 v6;
  uint64_t v7;
  void *v8;
  xpc_object_t dictionary;
  const char *path;
  const char *unique_path_component;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  unint64_t identifier;
  __int16 v17;
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C874D8];
  uuid = (const unsigned __int8 *)container_object_get_uuid(a1);
  if (uuid_is_null(uuid))
    goto LABEL_3;
  v5 = (const unsigned __int8 *)container_object_get_uuid(a2);
  if (uuid_is_null(v5))
    goto LABEL_3;
  v12 = container_object_get_uuid(a1);
  v13 = container_object_get_uuid(a2);
  if (v12 && v13)
  {
    if (*(_QWORD *)v12 != *(_QWORD *)v13 || *(_QWORD *)(v12 + 8) != *(_QWORD *)(v13 + 8))
      goto LABEL_16;
LABEL_3:
    v6 = container_object_is_transient(a2);
    __container_object_separate_from_query((_QWORD *)a1);
    *(_BYTE *)(a1 + 109) = v6;
    v7 = *(_QWORD *)(a2 + 88);
    if (v7 && (v8 = *(void **)(v7 + 136)) != 0)
      dictionary = xpc_array_get_dictionary(v8, *(unsigned int *)(a2 + 96));
    else
      dictionary = *(xpc_object_t *)(a2 + 80);
    container_object_set_info((_QWORD *)a1, dictionary);
    if (container_object_get_path(a2))
    {
      path = (const char *)container_object_get_path(a2);
      container_object_set_path((_QWORD *)a1, path);
    }
    unique_path_component = (const char *)container_object_get_unique_path_component(a2);
    container_object_set_unique_path_component((_QWORD *)a1, unique_path_component);
    return;
  }
  if (!uuid_compare((const unsigned __int8 *)v12, (const unsigned __int8 *)v13))
    goto LABEL_3;
LABEL_16:
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  v14 = container_log_handle_for_category_logHandles[0];
  if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315394;
    identifier = container_object_get_identifier(a1);
    v17 = 2080;
    v18 = container_object_get_identifier(a2);
    _os_log_impl(&dword_1CF7DA000, v14, OS_LOG_TYPE_DEFAULT, "Skipping update of [%s] from [%s] since UUIDs don't match.", (uint8_t *)&v15, 0x16u);
  }
}

uint64_t container_get_user_managed_assets_relative_path(uint64_t a1)
{
  if (a1)
    return container_object_get_user_managed_assets_relative_path(a1);
  return a1;
}

uint64_t container_get_creator_codesign_identifier(uint64_t a1)
{
  if (a1)
    return container_object_get_creator_codesign_identifier(a1);
  return a1;
}

uint64_t container_copy_path(uint64_t a1, uint64_t *a2)
{
  NSObject *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2000000000;
  v17 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2000000000;
  v13 = 1;
  v4 = _os_activity_create(&dword_1CF7DA000, "container_copy_path", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C87450];
  block[1] = 0x40000000;
  block[2] = __container_copy_path_block_invoke;
  block[3] = &unk_1E8CB2DC0;
  block[5] = &v14;
  block[6] = a1;
  block[4] = &v10;
  os_activity_apply(v4, block);
  os_release(v4);
  v5 = v11;
  v6 = v11[3];
  if (a2 && v6 != 1)
  {
    *a2 = v6;
    v6 = v5[3];
  }
  container_log_error((uint64_t)"container_copy_path", gClientFaultLoggingEnabled, v6);
  v7 = v15[3];
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  return v7;
}

void *__container_copy_path_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  const unsigned __int8 *uuid;
  void *result;
  unint64_t path;
  uint64_t v6;
  const char *v7;
  const char *v8;
  NSObject *v9;
  uint8_t v10[8];
  void *__s;

  __s = 0;
  v2 = a1[6];
  if (!v2
    || (uuid = (const unsigned __int8 *)container_object_get_uuid(a1[6]), uuid_is_null(uuid))
    || !container_object_get_identifier(v2)
    || (unint64_t)container_object_get_class(v2) - 1 >= 0xE)
  {
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = 11;
    goto LABEL_4;
  }
  path = container_object_get_path(a1[6]);
  v6 = a1[6];
  if (path)
  {
    container_object_sandbox_extension_activate(v6, 1);
    v7 = (const char *)container_object_get_path(a1[6]);
    if (container_fs_item_exists(v7, 0))
    {
      v8 = (const char *)container_object_get_path(a1[6]);
      goto LABEL_20;
    }
  }
  else if (*(_QWORD *)(v6 + 88))
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v9 = container_log_handle_for_category_logHandles[0];
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1CF7DA000, v9, OS_LOG_TYPE_DEFAULT, "Retrieving the path from a container which was fetched by a query without the CONTAINER_QUERY_FLAGS_RESULT_INCLUDE_PATH option. If you want the path from queried containers, set that option on the query. That will be much faster than what is about to happen...", v10, 2u);
    }
  }
  if (!container_object_update_metadata(a1[6], 0, (const char **)&__s, (uint64_t *)(*(_QWORD *)(a1[4] + 8) + 24)))
    goto LABEL_4;
  v8 = (const char *)container_object_get_path(a1[6]);
  if (__s)
  {
    container_object_set_sandbox_token((_QWORD *)a1[6], (const char *)__s);
    container_object_sandbox_extension_activate(a1[6], 1);
  }
LABEL_20:
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = strdup(v8);
LABEL_4:
  result = __s;
  if (__s)
  {
    free(__s);
    return (void *)memset_s(&__s, 8uLL, 0, 8uLL);
  }
  return result;
}

uint64_t container_is_transient(uint64_t a1, _BYTE *a2)
{
  if (a1 && a2)
    *a2 = container_object_is_transient(a1);
  return 1;
}

uint64_t container_copy_info(uint64_t a1, uint64_t *a2)
{
  NSObject *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2000000000;
  v17 = 1;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2000000000;
  v13 = 0;
  v4 = _os_activity_create(&dword_1CF7DA000, "container_copy_info", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C87450];
  block[1] = 0x40000000;
  block[2] = __container_copy_info_block_invoke;
  block[3] = &unk_1E8CB2DE8;
  block[5] = &v14;
  block[6] = a1;
  block[4] = &v10;
  os_activity_apply(v4, block);
  os_release(v4);
  v5 = v15;
  v6 = v15[3];
  if (a2 && v6 != 1)
  {
    *a2 = v6;
    v6 = v5[3];
  }
  container_log_error((uint64_t)"container_copy_info", gClientFaultLoggingEnabled, v6);
  v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  return v7;
}

xpc_object_t __container_copy_info_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  xpc_object_t dictionary;
  uint64_t v6;
  void *v7;
  xpc_object_t v8;
  xpc_object_t result;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  xpc_object_t v17;
  uint8_t v18[16];

  v2 = a1[6];
  v3 = *(_QWORD *)(v2 + 88);
  if (v3 && (v4 = *(void **)(v3 + 136)) != 0)
  {
    dictionary = xpc_array_get_dictionary(v4, *(unsigned int *)(v2 + 96));
    v2 = a1[6];
  }
  else
  {
    dictionary = *(xpc_object_t *)(v2 + 80);
  }
  v6 = *(_QWORD *)(v2 + 88);
  if (dictionary)
  {
    if (v6 && (v7 = *(void **)(v6 + 136)) != 0)
      v8 = xpc_array_get_dictionary(v7, *(unsigned int *)(v2 + 96));
    else
      v8 = *(xpc_object_t *)(v2 + 80);
    result = xpc_retain(v8);
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  }
  else
  {
    if (v6)
    {
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v10 = container_log_handle_for_category_logHandles[0];
      if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_1CF7DA000, v10, OS_LOG_TYPE_DEFAULT, "Retrieving the info from a container which was fetched by a query without the CONTAINER_QUERY_FLAGS_RESULT_INCLUDE_INFO option. If you want the info from queried containers, set that option on the query. That will be much faster than what is about to happen...", v18, 2u);
      }
    }
    result = (xpc_object_t)container_object_update_metadata(a1[6], 1, 0, (uint64_t *)(*(_QWORD *)(a1[5] + 8) + 24));
    if ((_DWORD)result)
    {
      v11 = a1[6];
      v12 = *(_QWORD *)(v11 + 88);
      if (v12 && (v13 = *(void **)(v12 + 136)) != 0)
      {
        result = xpc_array_get_dictionary(v13, *(unsigned int *)(v11 + 96));
        if (!result)
          return result;
      }
      else
      {
        result = *(xpc_object_t *)(v11 + 80);
        if (!result)
          return result;
      }
      v14 = a1[6];
      v15 = *(_QWORD *)(v14 + 88);
      if (v15 && (v16 = *(void **)(v15 + 136)) != 0)
        v17 = xpc_array_get_dictionary(v16, *(unsigned int *)(v14 + 96));
      else
        v17 = *(xpc_object_t *)(v14 + 80);
      *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = xpc_retain(v17);
      return container_object_set_info((_QWORD *)a1[6], 0);
    }
  }
  return result;
}

xpc_object_t container_get_info(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C874D8];
  if (a1)
  {
    v1 = *(_QWORD *)(a1 + 88);
    if (v1 && (v2 = *(void **)(v1 + 136)) != 0)
      return xpc_array_get_dictionary(v2, *(unsigned int *)(a1 + 96));
    else
      return *(xpc_object_t *)(a1 + 80);
  }
  else
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v4 = container_log_handle_for_category_logHandles[0];
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_FAULT))
    {
      v5 = 136315138;
      v6 = "container_get_info";
      _os_log_fault_impl(&dword_1CF7DA000, v4, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: container parameter is NULL", (uint8_t *)&v5, 0xCu);
    }
    return 0;
  }
}

xpc_object_t container_get_info_value_for_key(uint64_t a1, const char *a2)
{
  uint64_t v3;
  void *v4;
  xpc_object_t dictionary;
  NSObject *v6;
  NSObject *v7;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C874D8];
  if (!a1 || !a2)
  {
    if (a1)
      goto LABEL_11;
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v6 = container_log_handle_for_category_logHandles[0];
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_FAULT))
    {
      v9 = 136315138;
      v10 = "container_get_info_value_for_key";
      _os_log_fault_impl(&dword_1CF7DA000, v6, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: container parameter is NULL", (uint8_t *)&v9, 0xCu);
      if (a2)
        return 0;
    }
    else
    {
LABEL_11:
      if (a2)
        return 0;
    }
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v7 = container_log_handle_for_category_logHandles[0];
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_FAULT))
    {
      v9 = 136315138;
      v10 = "container_get_info_value_for_key";
      _os_log_fault_impl(&dword_1CF7DA000, v7, OS_LOG_TYPE_FAULT, "%s: SPI MISUSE: key parameter is NULL", (uint8_t *)&v9, 0xCu);
    }
    return 0;
  }
  v3 = *(_QWORD *)(a1 + 88);
  if (v3)
  {
    v4 = *(void **)(v3 + 136);
    if (v4)
    {
      dictionary = xpc_array_get_dictionary(v4, *(unsigned int *)(a1 + 96));
      if (!dictionary)
        return 0;
      return xpc_dictionary_get_value(dictionary, a2);
    }
  }
  dictionary = *(xpc_object_t *)(a1 + 80);
  if (dictionary)
    return xpc_dictionary_get_value(dictionary, a2);
  return 0;
}

_DWORD *container_is_new(uint64_t a1)
{
  const unsigned __int8 *uuid;

  if (a1
    && (uuid = (const unsigned __int8 *)container_object_get_uuid(a1), !uuid_is_null(uuid))
    && container_object_get_identifier(a1)
    && (unint64_t)container_object_get_class(a1) - 1 <= 0xD)
  {
    return container_object_is_new(a1);
  }
  else
  {
    return 0;
  }
}

uint64_t container_copy_sandbox_token(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2000000000;
  v9 = 0;
  v2 = _os_activity_create(&dword_1CF7DA000, "container_copy_sandbox_token", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  v5[0] = MEMORY[0x1E0C87450];
  v5[1] = 0x40000000;
  v5[2] = __container_copy_sandbox_token_block_invoke;
  v5[3] = &unk_1E8CB2E10;
  v5[4] = &v6;
  v5[5] = a1;
  os_activity_apply(v2, v5);
  os_release(v2);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

unint64_t __container_copy_sandbox_token_block_invoke(unint64_t result)
{
  uint64_t v1;
  unint64_t v2;
  const unsigned __int8 *uuid;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v1 = *(_QWORD *)(result + 40);
  if (v1)
  {
    v2 = result;
    uuid = (const unsigned __int8 *)container_object_get_uuid(*(_QWORD *)(result + 40));
    result = uuid_is_null(uuid);
    if (!(_DWORD)result)
    {
      result = container_object_get_identifier(v1);
      if (result)
      {
        result = (unint64_t)container_object_get_class(v1);
        if (result - 1 <= 0xD)
        {
          v4 = *(_QWORD *)(v2 + 40);
          v5 = *(_QWORD *)(v4 + 88);
          if (v5 && (v6 = *(void **)(v5 + 128)) != 0)
            result = (unint64_t)xpc_array_get_string(v6, *(unsigned int *)(v4 + 96));
          else
            result = *(_QWORD *)(v4 + 48);
          if (result)
            result = (unint64_t)strndup((const char *)result, 0x800uLL);
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 32) + 8) + 24) = result;
        }
      }
    }
  }
  return result;
}

char *container_copy_unlocalized_description(uint64_t a1)
{
  const char *identifier;
  _DWORD *v3;
  const char *persona_unique_string;
  const char *creator_codesign_identifier;
  unsigned int uid;
  const char *v7;
  const char *v8;
  const unsigned __int8 *uuid;
  char *v11;
  char out[40];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C874D8];
  v11 = 0;
  if (!a1)
    return strdup("<NULL>");
  identifier = (const char *)container_object_get_identifier(a1);
  v3 = container_object_get_class(a1);
  persona_unique_string = (const char *)container_object_get_persona_unique_string(a1);
  creator_codesign_identifier = (const char *)container_object_get_creator_codesign_identifier(a1);
  uid = container_object_get_uid(a1);
  if (container_object_is_transient(a1))
    v7 = "temp-";
  else
    v7 = (const char *)&unk_1CF80235E;
  if (!persona_unique_string)
    persona_unique_string = (const char *)&unk_1CF80235E;
  if (creator_codesign_identifier)
  {
    v8 = "|";
  }
  else
  {
    creator_codesign_identifier = (const char *)&unk_1CF80235E;
    v8 = (const char *)&unk_1CF80235E;
  }
  memset(out, 0, 37);
  uuid = (const unsigned __int8 *)container_object_get_uuid(a1);
  uuid_unparse_upper(uuid, out);
  asprintf(&v11, "[%s%s:%s:%u:%s:(%s%s%s)]", v7, *((const char **)&_CONTAINER_NAMES + (_QWORD)v3), identifier, uid, persona_unique_string, out, v8, creator_codesign_identifier);
  return v11;
}

_QWORD *container_create_merged_array(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v6;
  uint64_t v8;
  size_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  int v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v6 = a4;
  v8 = a2;
  v22 = *MEMORY[0x1E0C874D8];
  if ((unint64_t)(a4 + a2) <= 1)
    v10 = 1;
  else
    v10 = a4 + a2;
  v11 = malloc_type_calloc(v10, 8uLL, 0x2004093837F09uLL);
  if (!v11)
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v16 = container_log_handle_for_category_logHandles[0];
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_ERROR))
    {
      v18 = 134218240;
      v19 = v8;
      v20 = 2048;
      v21 = v6;
      _os_log_error_impl(&dword_1CF7DA000, v16, OS_LOG_TYPE_ERROR, "Could not allocate memory to merge container arrays: %zu + %zu", (uint8_t *)&v18, 0x16u);
    }
    return 0;
  }
  v12 = v11;
  if (v8)
  {
    v13 = 0;
    do
    {
      v14 = container_copy_object(*(_QWORD *)(a1 + 8 * v13));
      v12[v13] = v14;
      if (!v14)
        goto LABEL_19;
    }
    while (v8 != ++v13);
  }
  if (v6)
  {
    while (1)
    {
      v15 = container_copy_object(*a3);
      v12[v8] = v15;
      if (!v15)
        break;
      ++v8;
      ++a3;
      if (!--v6)
        goto LABEL_12;
    }
    v13 = v8;
LABEL_19:
    container_free_array_of_containers(v12, v13);
    return 0;
  }
LABEL_12:
  if (a5)
    *a5 = v8;
  return v12;
}

BOOL container_is_equal(uint64_t a1, uint64_t a2)
{
  _BOOL8 result;
  uint64_t uuid;
  uint64_t v6;
  _DWORD *v7;
  unsigned int uid;
  unsigned int v9;
  const char *persona_unique_string;
  const char *v11;
  const char *identifier;
  const char *v13;

  result = 0;
  if (a1 && a2)
  {
    if (a1 == a2)
      return 1;
    uuid = container_object_get_uuid(a1);
    v6 = container_object_get_uuid(a2);
    if (uuid && v6)
    {
      if (*(_QWORD *)uuid != *(_QWORD *)v6 || *(_QWORD *)(uuid + 8) != *(_QWORD *)(v6 + 8))
        return 0;
    }
    else if (uuid_compare((const unsigned __int8 *)uuid, (const unsigned __int8 *)v6))
    {
      return 0;
    }
    v7 = container_object_get_class(a1);
    if (v7 == container_object_get_class(a2))
    {
      uid = container_object_get_uid(a1);
      if (uid == container_object_get_uid(a2))
      {
        v9 = container_object_is_transient(a1);
        if (v9 == container_object_is_transient(a2))
        {
          persona_unique_string = (const char *)container_object_get_persona_unique_string(a1);
          v11 = (const char *)container_object_get_persona_unique_string(a2);
          if ((persona_unique_string != 0) == (v11 != 0)
            && (!persona_unique_string || !v11 || !strncmp(persona_unique_string, v11, 0x400uLL)))
          {
            identifier = (const char *)container_object_get_identifier(a1);
            v13 = (const char *)container_object_get_identifier(a2);
            return strncmp(identifier, v13, 0x400uLL) == 0;
          }
        }
      }
    }
    return 0;
  }
  return result;
}

BOOL ____locked_revoke_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 40) + 1;
  if (v3 == a3)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  return v3 != a3;
}

void ____initialize_container_sandbox_extensions_block_invoke_2()
{
  uint64_t v0;
  void *v1;
  size_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t *v5;
  unint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  unint64_t v10;
  _DWORD *v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  _QWORD applier[5];
  _QWORD v16[12];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  void *__s;
  uint64_t v23;
  uint8_t buf[4];
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C874D8];
  v14 = 1;
  v0 = container_copy_persona_unique_strings(&v14);
  if (v0 && v14 == 1)
  {
    v1 = (void *)v0;
    os_unfair_lock_lock((os_unfair_lock_t)&container_global_sandbox_extension_per_persona_lock);
    v2 = os_map_str_count();
    if (v2 <= 1)
      v2 = 1;
    v3 = malloc_type_calloc(v2, 8uLL, 0x10040436913F5uLL);
    v21 = v3;
    v17 = 0;
    v18 = &v17;
    v19 = 0x2000000000;
    v20 = 0;
    v4 = MEMORY[0x1E0C87450];
    v16[6] = MEMORY[0x1E0C87450];
    v16[7] = 0x40000000;
    v16[8] = ____locked_clear_dead_personas_block_invoke;
    v16[9] = &unk_1E8CB2F60;
    v16[10] = &v17;
    v16[11] = v3;
    os_map_str_foreach();
    v16[0] = v4;
    v16[1] = 0x40000000;
    v16[2] = ____locked_clear_dead_personas_block_invoke_2;
    v16[3] = &unk_1E8CB2F88;
    v16[4] = &v17;
    v16[5] = v3;
    ____locked_clear_dead_personas_block_invoke_2((uint64_t)v16, "default");
    applier[0] = v4;
    applier[1] = 0x40000000;
    applier[2] = ____locked_clear_dead_personas_block_invoke_3;
    applier[3] = &unk_1E8CB2FB0;
    applier[4] = v16;
    xpc_array_apply(v1, applier);
    v5 = v18;
    if (v18[3])
    {
      v6 = 0;
      do
      {
        if (v3[v6])
        {
          v7 = os_map_str_find();
          v23 = v7;
          if (v7)
          {
            v8 = (_QWORD *)v7;
            v9 = (void *)os_map_str_entry();
            __s = v9;
            os_map_str_delete();
            if (v9)
            {
              free(v9);
              memset_s(&__s, 8uLL, 0, 8uLL);
            }
            if (v8[3])
            {
              v10 = 0;
              v11 = v8 + 5;
              do
              {
                if (*v11 && (sandbox_extension_release() & 0x80000000) != 0)
                {
                  if (container_log_handle_for_category_onceToken != -1)
                    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
                  v12 = qword_1ECD3F340;
                  if (os_log_type_enabled((os_log_t)qword_1ECD3F340, OS_LOG_TYPE_ERROR))
                  {
                    v13 = *__error();
                    *(_DWORD *)buf = 67109120;
                    v25 = v13;
                    _os_log_error_impl(&dword_1CF7DA000, v12, OS_LOG_TYPE_ERROR, "container_sandbox_extension_revoke_all(): error %d releasing sandbox extension", buf, 8u);
                  }
                }
                ++v10;
                v11 += 4;
              }
              while (v10 < v8[3]);
            }
            os_map_str_clear();
            os_map_str_destroy();
            free(v8);
            memset_s(&v23, 8uLL, 0, 8uLL);
          }
          v5 = v18;
        }
        ++v6;
      }
      while (v6 < v5[3]);
    }
    if (v3)
    {
      free(v3);
      memset_s(&v21, 8uLL, 0, 8uLL);
    }
    _Block_object_dispose(&v17, 8);
    os_unfair_lock_unlock((os_unfair_lock_t)&container_global_sandbox_extension_per_persona_lock);
    xpc_release(v1);
  }
}

uint64_t ____locked_clear_dead_personas_block_invoke(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))++) = a2;
  return 1;
}

uint64_t ____locked_clear_dead_personas_block_invoke_2(uint64_t result, char *__s2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  if (__s2)
  {
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
    if (v2)
    {
      v4 = 0;
      v5 = *(_QWORD *)(result + 40);
      while (1)
      {
        result = *(_QWORD *)(v5 + 8 * v4);
        if (result)
        {
          result = strcmp((const char *)result, __s2);
          if (!(_DWORD)result)
            break;
        }
        if (v2 == ++v4)
          return result;
      }
      *(_QWORD *)(v5 + 8 * v4) = 0;
    }
  }
  return result;
}

uint64_t ____locked_clear_dead_personas_block_invoke_3(uint64_t a1, int a2, xpc_object_t xstring)
{
  uint64_t v3;
  const char *string_ptr;

  v3 = *(_QWORD *)(a1 + 32);
  string_ptr = xpc_string_get_string_ptr(xstring);
  (*(void (**)(uint64_t, const char *))(v3 + 16))(v3, string_ptr);
  return 1;
}

uint64_t ____locked_clear_per_persona_data_block_invoke(int a1, void *a2)
{
  void *__s;

  __s = a2;
  if (a2)
  {
    free(a2);
    memset_s(&__s, 8uLL, 0, 8uLL);
  }
  return 1;
}

uint64_t container_sandbox_issue_extension(_OWORD *a1, uint64_t a2)
{
  return container_sandbox_issue_custom_extension(*MEMORY[0x1E0C88E00], a1, a2);
}

void *container_object_create_blank()
{
  return malloc_type_calloc(1uLL, 0x70uLL, 0x10F00403C1846C7uLL);
}

unint64_t container_object_get_creator_codesign_identifier(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  const void *bytes_ptr;

  v2 = *(_QWORD *)(a1 + 88);
  if (!v2)
    return *(_QWORD *)(a1 + 72);
  v3 = *(void **)(v2 + 120);
  if (!v3)
    return *(_QWORD *)(a1 + 72);
  bytes_ptr = xpc_data_get_bytes_ptr(v3);
  return container_frozenset_get_creator_of_container_at_index((uint64_t)bytes_ptr, *(_DWORD *)(a1 + 96));
}

xpc_object_t container_object_get_info(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 88);
  if (v1 && (v2 = *(void **)(v1 + 136)) != 0)
    return xpc_array_get_dictionary(v2, *(unsigned int *)(a1 + 96));
  else
    return *(xpc_object_t *)(a1 + 80);
}

const char *container_object_get_sandbox_token(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 88);
  if (v1 && (v2 = *(void **)(v1 + 128)) != 0)
    return xpc_array_get_string(v2, *(unsigned int *)(a1 + 96));
  else
    return *(const char **)(a1 + 48);
}

uint64_t container_object_get_query(uint64_t a1)
{
  return *(_QWORD *)(a1 + 88);
}

_QWORD *container_object_set_class(_QWORD *a1, uint64_t a2)
{
  _QWORD *result;

  result = __container_object_separate_from_query(a1);
  a1[2] = a2;
  return result;
}

char *container_object_set_unique_path_component(_QWORD *a1, const char *a2)
{
  void *v4;
  char **v5;
  void *v6;
  char *result;

  __container_object_separate_from_query(a1);
  v6 = (void *)a1[7];
  v5 = (char **)(a1 + 7);
  v4 = v6;
  if (v6)
  {
    free(v4);
    memset_s(v5, 8uLL, 0, 8uLL);
  }
  result = strndup(a2, 0x400uLL);
  *v5 = result;
  return result;
}

xpc_object_t container_object_set_info(_QWORD *a1, void *a2)
{
  void *v4;
  xpc_object_t result;

  __container_object_separate_from_query(a1);
  v4 = (void *)a1[10];
  if (v4)
    xpc_release(v4);
  if (a2)
    result = xpc_retain(a2);
  else
    result = 0;
  a1[10] = result;
  return result;
}

char *container_object_set_sandbox_token(_QWORD *a1, const char *a2)
{
  void *v4;
  char **v5;
  void *v6;
  char *result;

  __container_object_separate_from_query(a1);
  v6 = (void *)a1[6];
  v5 = (char **)(a1 + 6);
  v4 = v6;
  if (v6)
  {
    free(v4);
    memset_s(v5, 8uLL, 0, 8uLL);
  }
  if (a2)
    result = strndup(a2, 0x800uLL);
  else
    result = 0;
  *v5 = result;
  return result;
}

_QWORD *container_object_set_transient(uint64_t a1, char a2)
{
  _QWORD *result;

  result = __container_object_separate_from_query((_QWORD *)a1);
  *(_BYTE *)(a1 + 109) = a2;
  return result;
}

_QWORD *container_object_set_is_new(uint64_t a1, char a2)
{
  _QWORD *result;

  result = __container_object_separate_from_query((_QWORD *)a1);
  *(_BYTE *)(a1 + 108) = a2;
  return result;
}

void container_object_set_uuid(unsigned __int8 *a1, const unsigned __int8 *a2)
{
  __container_object_separate_from_query(a1);
  uuid_copy(a1, a2);
}

char *container_object_set_user_managed_assets_relative_path(_QWORD *a1, const char *a2)
{
  void *v4;
  char **v5;
  void *v6;
  char *result;

  __container_object_separate_from_query(a1);
  v6 = (void *)a1[8];
  v5 = (char **)(a1 + 8);
  v4 = v6;
  if (v6)
  {
    free(v4);
    memset_s(v5, 8uLL, 0, 8uLL);
  }
  result = strndup(a2, 0x400uLL);
  *v5 = result;
  return result;
}

char *container_object_set_creator_codesign_identifier(_QWORD *a1, const char *a2)
{
  void *v4;
  char **v5;
  void *v6;
  char *result;

  __container_object_separate_from_query(a1);
  v6 = (void *)a1[9];
  v5 = (char **)(a1 + 9);
  v4 = v6;
  if (v6)
  {
    free(v4);
    memset_s(v5, 8uLL, 0, 8uLL);
  }
  result = strndup(a2, 0x400uLL);
  *v5 = result;
  return result;
}

uint64_t container_object_set_backing_store_from_query(uint64_t result, uint64_t a2, int a3)
{
  int v3;

  *(_QWORD *)(result + 88) = a2;
  if (a2)
    v3 = a3;
  else
    v3 = 0;
  *(_DWORD *)(result + 96) = v3;
  return result;
}

_BYTE *container_base64_encode(uint64_t a1, unint64_t a2)
{
  size_t v3;
  unint64_t v4;
  unint64_t v5;
  _BYTE *v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  char v18;

  if (!a1)
    return 0;
  if (a2 % 3)
    v3 = (a2 % 3) ^ 3;
  else
    v3 = 0;
  v4 = v3 + a2;
  v5 = (v3 + a2) / 3;
  v6 = malloc_type_calloc((4 * v5) | 1, 1uLL, 0x100004077774924uLL);
  v7 = v6;
  if (v4 >= 3)
  {
    v8 = 0;
    v9 = 0;
    v10 = v5 - 1;
    if (v5 <= 1)
      v11 = 1;
    else
      v11 = v5;
    do
    {
      v12 = *(unsigned __int8 *)(a1 + 3 * v8) << 16;
      if (v3 >= 2 && v10 == v8)
      {
        v13 = 2;
      }
      else
      {
        v14 = 3 * v8 + a1;
        v12 |= *(unsigned __int8 *)(v14 + 1) << 8;
        if (v3 && v10 == v8)
        {
          v13 = 3;
        }
        else
        {
          v12 |= *(unsigned __int8 *)(v14 + 2);
          v13 = 4;
        }
      }
      v15 = 0;
      v16 = 6 * v13;
      do
      {
        v17 = (v12 >> (v15 + 18)) & 0x3F;
        if (v17 <= 0x19)
        {
          v18 = v17 + 65;
LABEL_23:
          v6[v9] = v18;
          goto LABEL_24;
        }
        if (v17 <= 0x33)
        {
          v18 = v17 + 71;
          goto LABEL_23;
        }
        if (v17 <= 0x3D)
        {
          v18 = v17 - 4;
          goto LABEL_23;
        }
        if (v17 == 62)
          v6[v9] = 43;
        else
          v6[v9] = 47;
LABEL_24:
        ++v9;
        v15 -= 6;
      }
      while (v16 + v15);
      ++v8;
    }
    while (v8 != v11);
  }
  if (v3)
    memset(&v6[4 * v5 - v3], 61, v3);
  return v7;
}

const char *container_base64_encode_string(const char *result)
{
  uint64_t v1;
  size_t v2;

  if (result)
  {
    v1 = (uint64_t)result;
    v2 = strlen(result);
    return container_base64_encode(v1, v2);
  }
  return result;
}

char *container_base64_decode(char *a1, unint64_t *a2)
{
  return _container_base64_decode(a1, a2, 0);
}

char *_container_base64_decode(char *result, unint64_t *a2, unsigned int a3)
{
  char *v5;
  size_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  size_t v11;
  char *v12;
  uint64_t v13;
  int v14;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  size_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  char *v25;
  uint64_t v26;
  int v27;
  int v28;
  int v29;
  uint64_t v30;
  char *__s;

  if (result)
  {
    v5 = result;
    v6 = strlen(result);
    if ((v6 & 3) != 0)
    {
      return 0;
    }
    else
    {
      v7 = v6;
      v8 = v6 >> 2;
      v9 = 3 * (v6 >> 2);
      if (v6)
      {
        v10 = 0;
        v11 = v6 - 1;
        v12 = v5;
        do
        {
          v13 = v10;
          v14 = v12[v11];
          ++v10;
          --v12;
        }
        while (v14 == 61 && v11 != v13);
        if ((v14 & 0x3F) != 0 || v11 == v13)
          v17 = v13;
        else
          v17 = v13 + 1;
      }
      else
      {
        v17 = 0;
      }
      v18 = v9 - v17;
      v19 = v9 - v17 + a3;
      if (v19 <= 1)
        v20 = 1;
      else
        v20 = v19;
      result = (char *)malloc_type_calloc(v20, 1uLL, 0x100004077774924uLL);
      __s = result;
      if (v7 >= 4)
      {
        v21 = 0;
        v22 = 0;
        if (v8 <= 1)
          v23 = 1;
        else
          v23 = v8;
        while (2)
        {
          v24 = 0;
          v25 = v5;
          v26 = 24;
          do
          {
            v28 = *v25++;
            v27 = v28;
            v29 = v28 - 65;
            if ((v28 - 65) > 0x19)
            {
              if ((v27 - 97) > 0x19)
              {
                if ((v27 - 48) > 9)
                {
                  if (v27 == 43)
                  {
                    v29 = 62;
                  }
                  else if (v27 == 61)
                  {
                    v29 = 0;
                  }
                  else
                  {
                    if (v27 != 47)
                    {
                      if (!result)
                        return result;
                      free(result);
                      memset_s(&__s, 8uLL, 0, 8uLL);
                      return 0;
                    }
                    v29 = 63;
                  }
                }
                else
                {
                  v29 = v27 + 4;
                }
              }
              else
              {
                v29 = v27 - 71;
              }
            }
            v26 -= 6;
            v24 |= v29 << v26;
          }
          while (v26);
          v30 = v22 + 1;
          result[v22] = BYTE2(v24);
          if (v22 + 1 < v18)
          {
            result[v30] = BYTE1(v24);
            if (v22 + 2 >= v18)
            {
              v30 = v22 + 2;
            }
            else
            {
              v30 = v22 + 3;
              result[v22 + 2] = v24;
            }
          }
          ++v21;
          v5 += 4;
          v22 = v30;
          if (v21 != v23)
            continue;
          break;
        }
      }
      if (a2)
      {
        if (result)
          *a2 = v19;
      }
    }
  }
  return result;
}

char *container_base64_decode_string(char *a1)
{
  return _container_base64_decode(a1, 0, 1u);
}

size_t container_string_rom_copyout_external_bytes(_QWORD *__src, void *__dst, size_t a3)
{
  size_t v3;

  v3 = __src[2];
  if (__dst && v3 <= a3)
  {
    memcpy(__dst, __src, v3);
    *((_BYTE *)__dst + 5) = 1;
    return __src[2];
  }
  return v3;
}

_BYTE *container_string_rom_create_from_external_bytes(const void *a1, size_t a2, char a3)
{
  _BYTE *v5;

  if ((a3 & 1) == 0)
  {
    v5 = malloc_type_calloc(1uLL, a2, 0xDE05C3DuLL);
    memcpy(v5, a1, a2);
    v5[5] = 0;
    return v5;
  }
  return a1;
}

uint64_t container_string_rom_count(uint64_t result)
{
  if (result)
    return *(unsigned int *)(result + 8);
  return result;
}

uint64_t container_string_rom_index_of(uint64_t a1, const char *a2)
{
  uint64_t i;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  int v8;
  unint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unint64_t v12;
  int v13;
  unint64_t v14;
  unint64_t v15;
  int v16;
  unint64_t v17;
  size_t v18;
  size_t v19;
  uint64_t v20;
  const char *v21;
  unsigned int v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  int v26;
  unint64_t v27;
  unint64_t v28;
  BOOL v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  char v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  _QWORD *v41;
  unint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;

  i = -1;
  if (!a1 || !a2)
    return i;
  v5 = a1 + 24;
  v6 = a1 + 24;
  if (!*(_BYTE *)(a1 + 6))
    goto LABEL_13;
  if (a1 == -24)
  {
    v6 = 0;
    v15 = 0;
    LODWORD(v10) = MEMORY[0xFFFFFFFFFFFFFFF0];
    v11 = MEMORY[0xFFFFFFFFFFFFFFEF];
    v16 = 1;
    goto LABEL_15;
  }
  v7 = (*(_QWORD *)(a1 + 64) + 7) & 0xFFFFFFFFFFFFFFF8;
  v8 = flsl(*(unsigned int *)(a1 + 8) - 1);
  v9 = *(unsigned int *)(a1 + 32);
  if ((*(_BYTE *)(a1 + 30) & 1) == 0)
  {
    v9 += (v9 + 3) >> 2;
    if (v9 != 3 * ((v9 * (unsigned __int128)0x5555555555555556uLL) >> 64))
      LODWORD(v9) = 3 * ((v9 * (unsigned __int128)0x5555555555555556uLL) >> 64) + 3;
  }
  v6 = v7 + 8 * (((unint64_t)v9 * v8 + 63) >> 6) + v5;
  if (!*(_BYTE *)(a1 + 6))
  {
LABEL_13:
    v16 = 0;
    v15 = 0;
    LODWORD(v10) = *(_DWORD *)(a1 + 8);
    v11 = *(unsigned __int8 *)(a1 + 7);
    goto LABEL_15;
  }
  v10 = *(unsigned int *)(a1 + 8);
  v11 = *(unsigned __int8 *)(a1 + 7);
  v12 = (*(_QWORD *)(a1 + 64) + 7) & 0xFFFFFFFFFFFFFFF8;
  v13 = flsl(v10 - 1);
  v14 = *(unsigned int *)(a1 + 32);
  if ((*(_BYTE *)(a1 + 30) & 1) == 0)
  {
    v14 += (v14 + 3) >> 2;
    if (v14 != 3 * ((v14 * (unsigned __int128)0x5555555555555556uLL) >> 64))
      LODWORD(v14) = 3 * ((v14 * (unsigned __int128)0x5555555555555556uLL) >> 64) + 3;
  }
  v15 = v12 + 8 * (((unint64_t)v14 * v13 + 63) >> 6);
  v16 = *(unsigned __int8 *)(a1 + 6);
LABEL_15:
  v17 = v15 + v5 + (((v10 * (unint64_t)v11 + 63) >> 3) & 0x3FFFFFFFF8);
  if (!v16)
  {
    v31 = *(unsigned int *)(a1 + 8);
    i = -1;
    if (!(_DWORD)v31)
      return i;
    v32 = *(unsigned __int8 *)(a1 + 7);
    if (v6)
      v33 = 1;
    else
      v33 = v32 == 0;
    v34 = !v33;
    if ((_DWORD)v32 == 64)
      v35 = -1;
    else
      v35 = ~(-1 << v32);
    if (v32 > 0x40 || (v34 & 1) != 0)
      goto LABEL_82;
    v36 = 0;
    for (i = 0; i != v31; ++i)
    {
      v37 = (v36 & 0x3F) + v32;
      if (v37)
      {
        v38 = (v36 >> 3) & 0xFFFFFFFFFFFFFF8;
        if (v37 > 0x40)
        {
          v40 = v38 + 8;
          v29 = __CFADD__(v40, v6);
          v41 = (_QWORD *)(v40 + v6);
          if (v29 || (unint64_t)v41 + 7 < 8)
            goto LABEL_81;
          v37 = (*v41 >> -(char)v37) | (*(v41 - 1) << v37);
        }
        else
        {
          v29 = __CFADD__(v38, v6);
          v39 = (_QWORD *)(v38 + v6);
          if (v29 || (unint64_t)v39 + 7 < 8)
            goto LABEL_80;
          v37 = *v39 >> -(char)v37;
        }
      }
      if (!strcmp(a2, (const char *)(v17 + (v37 & v35))))
        return i;
      v36 += v32;
    }
    return -1;
  }
  v18 = strlen(a2);
  v19 = v18 + 1;
  v20 = v18 + 1 + ((unint64_t)*(unsigned __int16 *)(a1 + 12) << 7);
  if (v18 <= 0x7FFFFFFFFFFFFFFELL)
  {
    v21 = a2;
    do
    {
      v22 = *(unsigned __int8 *)v21++;
      v20 = 257 * v20 + v22;
    }
    while (v21 < &a2[v19]);
  }
  v23 = container_perfect_hash_index_of(v5, (v20 << (v19 & 0x1F)) + v20);
  if (v23 < 0)
    return -1;
  v24 = v23;
  v25 = 0;
  if (v5 && *(_BYTE *)(a1 + 6))
    v25 = ((*(_QWORD *)(v5 + 40) + 7) & 0xFFFFFFFFFFFFFFF8) + v5;
  v26 = flsl(*(unsigned int *)(a1 + 8) - 1);
  if (v26 > 0x40 || !v25 && v26)
    goto LABEL_82;
  if (!is_mul_ok(v24, v26))
    goto LABEL_83;
  v27 = ((v24 * v26) & 0x3F) + v26;
  if (v27)
  {
    v28 = ((v24 * v26) >> 3) & 0x1FFFFFFFFFFFFFF8;
    if (v27 > 0x40)
    {
      v42 = v28 + 8;
      v29 = __CFADD__(v42, v25);
      v43 = (_QWORD *)(v42 + v25);
      if (v29 || (unint64_t)v43 + 7 < 8)
        goto LABEL_81;
      v27 = (*v43 >> -(char)v27) | (*(v43 - 1) << v27);
    }
    else
    {
      v29 = __CFADD__(v28, v25);
      v30 = (_QWORD *)(v28 + v25);
      if (v29 || (unint64_t)v30 + 7 < 8)
        goto LABEL_80;
      v27 = *v30 >> -(char)v27;
    }
  }
  v44 = -1;
  if (v26 != 64)
    v44 = ~(-1 << v26);
  v45 = *(unsigned __int8 *)(a1 + 7);
  if (v45 > 0x40 || !v6 && *(_BYTE *)(a1 + 7))
LABEL_82:
    __assert_rtn("container_bitvector_get", "container_bitvector.h", 80, "((void)\"container_bitvector_get(): bad argument\", 0)");
  v46 = v27 & v44;
  if (!is_mul_ok(v27 & v44, v45))
LABEL_83:
    __assert_rtn("container_bitvector_get", "container_bitvector.h", 85, "((void)\"container_bitvector_get(): index too large for element width\", 0)");
  v47 = ((v46 * v45) & 0x3F) + v45;
  if (v47)
  {
    v48 = ((v46 * v45) >> 3) & 0x1FFFFFFFFFFFFFF8;
    if (v47 <= 0x40)
    {
      v29 = __CFADD__(v48, v6);
      v49 = (_QWORD *)(v48 + v6);
      if (!v29 && (unint64_t)v49 + 7 >= 8)
      {
        v47 = *v49 >> -(char)v47;
        goto LABEL_73;
      }
LABEL_80:
      __assert_rtn("container_bitvector_get", "container_bitvector.h", 104, "((void)\"container_bitvector_get(): index too large for array\", 0)");
    }
    v50 = v48 + 8;
    v29 = __CFADD__(v50, v6);
    v51 = (_QWORD *)(v50 + v6);
    if (!v29 && (unint64_t)v51 + 7 >= 8)
    {
      v47 = (*v51 >> -(char)v47) | (*(v51 - 1) << v47);
      goto LABEL_73;
    }
LABEL_81:
    __assert_rtn("container_bitvector_get", "container_bitvector.h", 113, "((void)\"container_bitvector_get(): index too large for array\", 0)");
  }
LABEL_73:
  if ((_DWORD)v45 == 64)
    v52 = -1;
  else
    v52 = ~(-1 << v45);
  if (!strcmp(a2, (const char *)(v17 + (v47 & v52))))
    return v46;
  else
    return -1;
}

size_t container_perfect_hash_copyout_external_bytes(_QWORD *__src, void *__dst, size_t a3)
{
  size_t v3;

  v3 = __src[5];
  if (__dst && v3 <= a3)
  {
    memcpy(__dst, __src, v3);
    *((_BYTE *)__dst + 5) = 1;
    return __src[5];
  }
  return v3;
}

_BYTE *container_perfect_hash_create_from_external_bytes(const void *a1, size_t a2, char a3)
{
  _BYTE *v5;

  if ((a3 & 1) == 0)
  {
    v5 = malloc_type_calloc(1uLL, a2, 0x6FFC536CuLL);
    memcpy(v5, a1, a2);
    v5[5] = 0;
    return v5;
  }
  return a1;
}

uint64_t container_perfect_hash_count(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

uint64_t container_perfect_hash_num_indexes(uint64_t a1)
{
  char v1;
  uint64_t result;
  unint64_t v3;

  v1 = *(_BYTE *)(a1 + 6);
  result = *(unsigned int *)(a1 + 8);
  if ((v1 & 1) == 0)
  {
    v3 = result + ((unint64_t)(result + 3) >> 2);
    if (v3 == 3 * ((v3 * (unsigned __int128)0x5555555555555556uLL) >> 64))
      return v3;
    else
      return 3 * ((v3 * (unsigned __int128)0x5555555555555556uLL) >> 64) + 3;
  }
  return result;
}

uint64_t container_pwd_for_name(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2000000000;
  v11 = 1;
  v7[0] = MEMORY[0x1E0C87450];
  v7[1] = 0x40000000;
  v7[2] = __container_pwd_for_name_block_invoke;
  v7[3] = &unk_1E8CB3090;
  v7[5] = &v8;
  v7[6] = a1;
  v7[4] = a3;
  v4 = _container_pwd(&v11, (uint64_t)v7);
  v5 = v4;
  if (a2 && (v4 & 1) == 0)
    *a2 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __container_pwd_for_name_block_invoke(uint64_t a1, char *a2, size_t a3, _QWORD *a4)
{
  BOOL v6;
  NSObject *v7;
  uint64_t (*v8)(void);
  uint64_t result;
  uint64_t v10;
  int v11;
  passwd *v12;
  passwd v13;
  _BYTE buf[24];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C874D8];
  memset(&v13, 0, sizeof(v13));
  v12 = 0;
  if (getpwnam_r(*(const char **)(a1 + 48), &v13, a2, a3, &v12))
    v6 = 1;
  else
    v6 = v12 == 0;
  if (v6)
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v7 = container_log_handle_for_category_logHandles[0];
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 48);
      v11 = *__error();
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = v11;
      _os_log_error_impl(&dword_1CF7DA000, v7, OS_LOG_TYPE_ERROR, "getpwnam_r(%s) returned %{public, darwin.errno}d", buf, 0x12u);
    }
    result = 0;
    *a4 = 99;
  }
  else
  {
    v8 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    *(_QWORD *)buf = *(_QWORD *)&v13.pw_uid;
    *(_QWORD *)&buf[8] = v13.pw_dir;
    *(_QWORD *)&buf[16] = v13.pw_name;
    return v8();
  }
  return result;
}

uint64_t _container_pwd(uint64_t *a1, uint64_t a2)
{
  int64_t v4;
  int64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v12;
  uint8_t __s[24];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C874D8];
  v12 = 1;
  v4 = sysconf(71);
  v5 = v4;
  if (v4 <= 0)
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v9 = container_log_handle_for_category_logHandles[0];
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__s = 134349056;
      *(_QWORD *)&__s[4] = v5;
      _os_log_error_impl(&dword_1CF7DA000, v9, OS_LOG_TYPE_ERROR, "sysconf(_SC_GETPW_R_SIZE_MAX) <= 0: %{public}ld", __s, 0xCu);
    }
    v8 = 0;
    v10 = 99;
LABEL_11:
    v12 = v10;
    if (!a1)
      return v8;
    goto LABEL_12;
  }
  v6 = malloc_type_calloc(v4, 1uLL, 0x100004077774924uLL);
  *(_QWORD *)__s = v6;
  if (!v6)
  {
    v8 = 0;
    v10 = 73;
    goto LABEL_11;
  }
  v7 = v6;
  v8 = (*(uint64_t (**)(uint64_t, void *, int64_t, uint64_t *))(a2 + 16))(a2, v6, v5, &v12);
  free(v7);
  memset_s(__s, 8uLL, 0, 8uLL);
  if (!a1)
    return v8;
LABEL_12:
  if ((v8 & 1) == 0)
    *a1 = v12;
  return v8;
}

uint64_t container_pwd_for_uid(int a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[6];
  int v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2000000000;
  v12 = 1;
  v7[0] = MEMORY[0x1E0C87450];
  v7[1] = 0x40000000;
  v7[2] = __container_pwd_for_uid_block_invoke;
  v7[3] = &unk_1E8CB30B8;
  v8 = a1;
  v7[4] = a3;
  v7[5] = &v9;
  v4 = _container_pwd(&v12, (uint64_t)v7);
  v5 = v4;
  if (a2 && (v4 & 1) == 0)
    *a2 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __container_pwd_for_uid_block_invoke(uint64_t a1, char *a2, size_t a3, _QWORD *a4)
{
  BOOL v6;
  NSObject *v7;
  uint64_t (*v8)(void);
  uint64_t result;
  int v10;
  int v11;
  passwd *v12;
  passwd v13;
  uint8_t buf[8];
  char *pw_dir;
  char *pw_name;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C874D8];
  memset(&v13, 0, sizeof(v13));
  v12 = 0;
  if (getpwuid_r(*(_DWORD *)(a1 + 48), &v13, a2, a3, &v12))
    v6 = 1;
  else
    v6 = v12 == 0;
  if (v6)
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v7 = container_log_handle_for_category_logHandles[0];
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_ERROR))
    {
      v10 = *(_DWORD *)(a1 + 48);
      v11 = *__error();
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&buf[4] = v10;
      LOWORD(pw_dir) = 1026;
      *(_DWORD *)((char *)&pw_dir + 2) = v11;
      _os_log_error_impl(&dword_1CF7DA000, v7, OS_LOG_TYPE_ERROR, "getpwuid_r(%d) returned %{public, darwin.errno}d", buf, 0xEu);
    }
    result = 0;
    *a4 = 99;
  }
  else
  {
    v8 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    *(_QWORD *)buf = *(_QWORD *)&v13.pw_uid;
    pw_dir = v13.pw_dir;
    pw_name = v13.pw_name;
    return v8();
  }
  return result;
}

char *container_pwd_copy_user_home_path(int a1, int a2, int a3, uint64_t *a4)
{
  NSObject *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  NSObject *v12;
  int v13;
  int v15;
  _QWORD v16[5];
  uint64_t v17;
  char *__s;
  __int16 v19;
  int v20;
  uint8_t buf[4];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
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
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  char __s1[1025];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C874D8];
  v17 = 1;
  bzero(__s1, 0x401uLL);
  if (!a3)
    goto LABEL_10;
  v43 = 0;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v38 = 0u;
  v37 = 0u;
  v36 = 0u;
  v35 = 0u;
  v34 = 0u;
  v33 = 0u;
  v32 = 0u;
  v31 = 0u;
  v30 = 0u;
  v29 = 0u;
  v28 = 0u;
  v27 = 0u;
  v26 = 0u;
  v25 = 0u;
  v24 = 0u;
  v23 = 0u;
  v22 = 0u;
  *(_DWORD *)buf = 2;
  if (kpersona_info())
    goto LABEL_10;
  if (DWORD1(v22) == 2)
  {
    if (kpersona_getpath())
    {
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v8 = container_log_handle_for_category_logHandles[0];
      if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_ERROR))
      {
        v15 = *__error();
        LODWORD(__s) = 67109376;
        HIDWORD(__s) = v22;
        v19 = 1026;
        v20 = v15;
        _os_log_error_impl(&dword_1CF7DA000, v8, OS_LOG_TYPE_ERROR, "kpersona_getpath(%d) returned %{public, darwin.errno}d", (uint8_t *)&__s, 0xEu);
      }
      v9 = 76;
      goto LABEL_22;
    }
  }
  else
  {
LABEL_10:
    v16[0] = MEMORY[0x1E0C87450];
    v16[1] = 0x40000000;
    v16[2] = __container_pwd_copy_user_home_path_block_invoke;
    v16[3] = &__block_descriptor_tmp_3_813;
    v16[4] = __s1;
    if (!container_pwd_for_uid(a1, &v17, (uint64_t)v16))
      goto LABEL_23;
  }
  if (a2)
  {
    v10 = (char *)malloc_type_calloc(0x401uLL, 1uLL, 0x100004077774924uLL);
    __s = v10;
    if (v10)
    {
      v11 = v10;
      if (container_realpathat(4294967294, (uint64_t)__s1, v10, 0x400uLL))
      {
        v17 = 99;
        if (container_log_handle_for_category_onceToken != -1)
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        v12 = container_log_handle_for_category_logHandles[0];
        if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_ERROR))
        {
          v13 = *__error();
          *(_DWORD *)buf = 136380931;
          *(_QWORD *)&v22 = __s1;
          WORD4(v22) = 1026;
          *(_DWORD *)((char *)&v22 + 10) = v13;
          _os_log_error_impl(&dword_1CF7DA000, v12, OS_LOG_TYPE_ERROR, "realpath_np([%{private}s]) failed: %{public, darwin.errno}d", buf, 0x12u);
        }
      }
      goto LABEL_19;
    }
LABEL_21:
    v9 = 73;
LABEL_22:
    v17 = v9;
    goto LABEL_23;
  }
  v11 = strndup(__s1, 0x400uLL);
  __s = v11;
  if (!v11)
    goto LABEL_21;
LABEL_19:
  if (v17 == 1)
    return v11;
  free(v11);
  memset_s(&__s, 8uLL, 0, 8uLL);
LABEL_23:
  v11 = 0;
  if (a4)
  {
    v11 = 0;
    *a4 = v17;
  }
  return v11;
}

BOOL __container_pwd_copy_user_home_path_block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3)
    strlcpy(*(char **)(a1 + 32), *(const char **)(a2 + 8), 0x400uLL);
  else
    *a3 = 100;
  return v3 != 0;
}

uint64_t container_create_or_lookup_path(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, uint64_t a6, uint64_t a7)
{
  NSObject *v13;
  uint64_t v14;
  _QWORD v16[9];
  char v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2000000000;
  v22 = 0;
  v13 = _os_activity_create(&dword_1CF7DA000, "container_create_or_lookup_path", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  v16[0] = MEMORY[0x1E0C87450];
  v16[1] = 0x40000000;
  v16[2] = __container_create_or_lookup_path_block_invoke;
  v16[3] = &unk_1E8CB3118;
  v16[4] = &v19;
  v16[5] = a2;
  v17 = a4;
  v18 = a5;
  v16[6] = a3;
  v16[7] = a6;
  v16[8] = a7;
  os_activity_apply(v13, v16);
  os_release(v13);
  v14 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v14;
}

uint64_t __container_create_or_lookup_path_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = container_create_or_lookup_path_for_current_user(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_BYTE *)(a1 + 72), *(_BYTE *)(a1 + 73), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t container_bundle_copy_data_container_path(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSObject *v8;
  uint64_t v9;
  _QWORD v11[10];
  _QWORD v12[4];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2000000000;
  v16 = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2000000000;
  v12[3] = 1;
  v8 = _os_activity_create(&dword_1CF7DA000, "container_bundle_copy_data_container_path", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  v11[0] = MEMORY[0x1E0C87450];
  v11[1] = 0x40000000;
  v11[2] = __container_bundle_copy_data_container_path_block_invoke;
  v11[3] = &unk_1E8CB3190;
  v11[6] = a1;
  v11[7] = a2;
  v11[4] = v12;
  v11[5] = &v13;
  v11[8] = a3;
  v11[9] = a4;
  os_activity_apply(v8, v11);
  os_release(v8);
  v9 = v14[3];
  _Block_object_dispose(v12, 8);
  _Block_object_dispose(&v13, 8);
  return v9;
}

void __container_bundle_copy_data_container_path_block_invoke(uint64_t a1)
{
  void *v2;
  const char *path;
  uint64_t v5;
  uint64_t *v6;
  void *v7;

  v7 = 0;
  v2 = _common_bundle_lookup(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), (uint64_t *)&v7, *(_BYTE **)(a1 + 64), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 1 && v7 != 0)
  {
    path = (const char *)container_object_get_path((uint64_t)v7);
    if (path)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = strndup(path, 0x400uLL);
  }
  container_object_free(v7);
  if (v2)
    xpc_release(v2);
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v5 != 1)
  {
    v6 = *(uint64_t **)(a1 + 72);
    if (v6)
    {
      *v6 = v5;
      v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    }
  }
  container_log_error((uint64_t)"container_bundle_copy_data_container_path", gClientFaultLoggingEnabled, v5);
}

void *_common_bundle_lookup(uint64_t a1, uint64_t a2, uint64_t *a3, _BYTE *a4, _QWORD *a5)
{
  uint64_t v10;
  void *v11;
  uint64_t property;
  const char *v13;
  uint64_t v14;
  char *v15;
  int current_persona;
  const char *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  NSObject *v24;
  const char *v25;
  const char *v26;
  xpc_object_t v27;
  uint64_t v28;
  NSObject *v29;
  const char *v30;
  char *v31;
  _BOOL4 v33;
  void *v34;
  unsigned __int8 *v35;
  uint64_t v36;
  _QWORD *v37;
  NSObject *v38;
  uint64_t v39;
  const char *v40;
  const char *v41;
  char *string;
  void *v43;
  const char *__s;
  uint64_t v45;
  uint8_t v46[4];
  int v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  int v53;
  __int16 v54;
  int v55;
  __int16 v56;
  int v57;
  __int16 v58;
  int v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  const char *v63;
  __int16 v64;
  char *v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  uid_t v69;
  __int16 v70;
  uid_t v71;
  uint8_t buf[4];
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[256];
  uint64_t v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C874D8];
  __s = 0;
  v45 = 1;
  v43 = 0;
  if (!a3)
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v18 = qword_1ECD3F348;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CF7DA000, v18, OS_LOG_TYPE_ERROR, "Could not allocate return container object.", buf, 2u);
    }
    v19 = 73;
    goto LABEL_26;
  }
  if (!a1)
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v20 = qword_1ECD3F348;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CF7DA000, v20, OS_LOG_TYPE_ERROR, "Client passed NULL path_to_bundle parameter.", buf, 2u);
    }
    v19 = 38;
    goto LABEL_26;
  }
  v10 = xpc_bundle_create();
  if (!v10)
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v21 = qword_1ECD3F348;
    if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&v73 = a1;
      _os_log_error_impl(&dword_1CF7DA000, v21, OS_LOG_TYPE_ERROR, "Unable to get bundle from [%{public}s]", buf, 0xCu);
    }
    v19 = 94;
    if ((a2 & 4) != 0)
      v19 = 95;
LABEL_26:
    v45 = v19;
    container_error_free(0);
    v22 = 0;
    goto LABEL_27;
  }
  v11 = (void *)v10;
  property = xpc_bundle_get_property();
  if (!property)
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v24 = qword_1ECD3F348;
    if (!os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_ERROR))
      goto LABEL_39;
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&v73 = a1;
    WORD4(v73) = 1026;
    *(_DWORD *)((char *)&v73 + 10) = xpc_bundle_get_error();
    v25 = "Unable to get bundle root path from bundle at [%{public}s]: %{public}d";
    goto LABEL_74;
  }
  v13 = (const char *)property;
  v14 = xpc_bundle_get_property();
  if (!v14)
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v24 = qword_1ECD3F348;
    if (!os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_ERROR))
      goto LABEL_39;
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&v73 = a1;
    WORD4(v73) = 1026;
    *(_DWORD *)((char *)&v73 + 10) = xpc_bundle_get_error();
    v25 = "Unable to get executable path from bundle at [%{public}s]: %{public}d";
LABEL_74:
    _os_log_error_impl(&dword_1CF7DA000, v24, OS_LOG_TYPE_ERROR, v25, buf, 0x12u);
LABEL_39:
    v27 = 0;
    v28 = 94;
    if ((a2 & 4) != 0)
      v28 = 95;
    goto LABEL_41;
  }
  v15 = (char *)v14;
  v84 = 0u;
  v85 = 0u;
  v83 = 0u;
  voucher_get_current_persona_originator_info();
  v81 = 0u;
  v82 = 0u;
  v80 = 0u;
  voucher_get_current_persona_proximate_info();
  v79 = 0;
  memset(v78, 0, sizeof(v78));
  v77 = 0u;
  v76 = 0u;
  v75 = 0u;
  v74 = 0u;
  v73 = 0u;
  *(_DWORD *)buf = 2;
  current_persona = voucher_get_current_persona();
  if (current_persona == -1 || (kpersona_info() & 0x80000000) != 0)
  {
    v26 = "<unknown>";
    v17 = "NOPERSONA";
  }
  else
  {
    if ((DWORD1(v73) - 2) > 4)
      v17 = "<unknown>";
    else
      v17 = (&off_1E8CB3988)[DWORD1(v73) - 2];
    v26 = &v78[4];
  }
  string = v15;
  v40 = v26;
  v41 = v17;
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  v29 = qword_1ECD3F348;
  if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v46 = 67112194;
    v47 = current_persona;
    v48 = 2082;
    v49 = v41;
    v50 = 2082;
    v51 = v40;
    v52 = 1024;
    v53 = 0;
    v54 = 1024;
    v55 = 0;
    v56 = 1024;
    v57 = 0;
    v58 = 1024;
    v59 = 0;
    v60 = 2082;
    v61 = a1;
    v62 = 2082;
    v63 = v13;
    v64 = 2082;
    v65 = string;
    v66 = 2048;
    v67 = a2;
    v68 = 1024;
    v69 = geteuid();
    v70 = 1024;
    v71 = getuid();
    _os_log_impl(&dword_1CF7DA000, v29, OS_LOG_TYPE_DEFAULT, "Requesting container lookup; personaid = %d, type = %{public}s, name = %{public}s, origin [pid = %d, personaid = %"
      "d], proximate [pid = %d, personaid = %d], bundle = [%{public}s], root = [%{public}s], executable = [%{public}s], f"
      "lags = %llu, euid = %d, uid = %d",
      v46,
      0x68u);
  }
  v27 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v27, "Command", 0x24uLL);
  xpc_dictionary_set_string(v27, "BundlePath", v13);
  xpc_dictionary_set_string(v27, "ExecutablePath", string);
  xpc_dictionary_set_uint64(v27, "Flags", a2);
  v30 = (const char *)container_sandbox_issue_custom_extension(*MEMORY[0x1E0C88E00], 0, (uint64_t)v13);
  __s = v30;
  if (v30)
  {
    v31 = (char *)v30;
    v33 = (a2 & 1) == 0 || a4 == 0;
    xpc_dictionary_set_string(v27, "SandboxToken", v30);
    v34 = (void *)container_xpc_send_sync_message(3, 0, v27, v33, 0, 0, (uint64_t)&v43);
    if (v34)
    {
      v22 = v34;
      v35 = container_xpc_decode_container_object(v34, &v45);
      if (v35)
      {
        v36 = (uint64_t)v35;
        if (a4)
          *a4 = container_is_new((uint64_t)v35) ^ 1;
        container_object_sandbox_extension_activate(v36, 1);
        *a3 = v36;
      }
      v37 = v43;
    }
    else
    {
      v37 = v43;
      if (v43)
        v39 = *(_QWORD *)v43;
      else
        v39 = 1;
      v22 = 0;
      v45 = v39;
    }
    container_error_free(v37);
    free(v31);
    memset_s(&__s, 8uLL, 0, 8uLL);
    goto LABEL_71;
  }
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  v38 = qword_1ECD3F348;
  if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    *(_QWORD *)&v73 = v13;
    _os_log_error_impl(&dword_1CF7DA000, v38, OS_LOG_TYPE_ERROR, "Failed to issue sandbox extension to [%{public}s] for containermanagerd", buf, 0xCu);
  }
  v28 = 90;
LABEL_41:
  v45 = v28;
  container_error_free(0);
  v22 = 0;
LABEL_71:
  xpc_release(v11);
  if (v27)
    xpc_release(v27);
LABEL_27:
  if (a5 && v45 != 1)
    *a5 = v45;
  return v22;
}

uint64_t container_bundle_copy_data_container(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSObject *v8;
  uint64_t v9;
  _QWORD v11[10];
  _QWORD v12[4];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2000000000;
  v16 = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2000000000;
  v12[3] = 1;
  v8 = _os_activity_create(&dword_1CF7DA000, "container_bundle_copy_data_container", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  v11[0] = MEMORY[0x1E0C87450];
  v11[1] = 0x40000000;
  v11[2] = __container_bundle_copy_data_container_block_invoke;
  v11[3] = &unk_1E8CB31B8;
  v11[6] = a1;
  v11[7] = a2;
  v11[4] = v12;
  v11[5] = &v13;
  v11[8] = a3;
  v11[9] = a4;
  os_activity_apply(v8, v11);
  os_release(v8);
  v9 = v14[3];
  _Block_object_dispose(v12, 8);
  _Block_object_dispose(&v13, 8);
  return v9;
}

void __container_bundle_copy_data_container_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v4;
  uint64_t *v5;
  void *v6;

  v6 = 0;
  v2 = _common_bundle_lookup(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), (uint64_t *)&v6, *(_BYTE **)(a1 + 64), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) != 1 || v6 == 0)
  {
    container_object_free(v6);
    if (!v2)
      goto LABEL_10;
    goto LABEL_9;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6;
  if (v2)
LABEL_9:
    xpc_release(v2);
LABEL_10:
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v4 != 1)
  {
    v5 = *(uint64_t **)(a1 + 72);
    if (v5)
    {
      *v5 = v4;
      v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    }
  }
  container_log_error((uint64_t)"container_bundle_copy_data_container", gClientFaultLoggingEnabled, v4);
}

uint64_t container_create_or_lookup(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, uint64_t a6, uint64_t a7)
{
  return container_create_or_lookup_for_current_user(a2, a3, a4, a5, a6, a7);
}

uint64_t container_create_or_lookup_for_current_user(uint64_t a1, uint64_t a2, char a3, char a4, uint64_t a5, uint64_t a6)
{
  NSObject *v12;
  uint64_t v13;
  _QWORD v15[9];
  char v16;
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2000000000;
  v21 = 0;
  v12 = _os_activity_create(&dword_1CF7DA000, "container_create_or_lookup_for_current_user", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  v15[0] = MEMORY[0x1E0C87450];
  v15[1] = 0x40000000;
  v15[2] = __container_create_or_lookup_for_current_user_block_invoke;
  v15[3] = &unk_1E8CB3208;
  v15[4] = &v18;
  v15[5] = a1;
  v16 = a3;
  v17 = a4;
  v15[6] = a2;
  v15[7] = a5;
  v15[8] = a6;
  os_activity_apply(v12, v15);
  os_release(v12);
  v13 = v19[3];
  _Block_object_dispose(&v18, 8);
  return v13;
}

uint64_t __container_create_or_lookup_for_current_user_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = container_create_or_lookup_for_platform(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, *(_BYTE *)(a1 + 72), *(_BYTE *)(a1 + 73), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t container_create_or_lookup_for_platform(uint64_t a1, uint64_t a2, int a3, char a4, char a5, uint64_t a6, uint64_t a7)
{
  NSObject *v14;
  uint64_t v15;
  _QWORD v17[10];
  int v18;
  char v19;
  char v20;
  _QWORD v21[4];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v22 = 0;
  v23 = &v22;
  v24 = 0x2000000000;
  v25 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2000000000;
  v21[3] = 1;
  v14 = _os_activity_create(&dword_1CF7DA000, "container_create_or_lookup_for_platform", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  v17[0] = MEMORY[0x1E0C87450];
  v17[1] = 0x40000000;
  v17[2] = __container_create_or_lookup_for_platform_block_invoke;
  v17[3] = &unk_1E8CB31E0;
  v17[6] = a1;
  v17[7] = a2;
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v17[4] = &v22;
  v17[5] = v21;
  v17[8] = a6;
  v17[9] = a7;
  os_activity_apply(v14, v17);
  os_release(v14);
  v15 = v23[3];
  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&v22, 8);
  return v15;
}

void __container_create_or_lookup_for_platform_block_invoke(uint64_t a1)
{
  unint64_t v2;
  const char *v4;
  const char *v5;
  uint64_t v6;
  uint64_t *v7;

  v2 = *(_QWORD *)(a1 + 48);
  if (v2 == 7 || v2 == 13)
  {
    v5 = 0;
    v4 = *(const char **)(a1 + 56);
  }
  else
  {
    v4 = 0;
    v5 = *(const char **)(a1 + 56);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = _container_legacy_lookup(v2, v5, v4, *(_DWORD *)(a1 + 80), *(unsigned __int8 *)(a1 + 84), *(unsigned __int8 *)(a1 + 85), *(_BYTE **)(a1 + 64), (uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)+ 24));
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v6 != 1)
  {
    v7 = *(uint64_t **)(a1 + 72);
    if (v7)
    {
      *v7 = v6;
      v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    }
  }
  container_log_error((uint64_t)"container_create_or_lookup_for_platform", gClientFaultLoggingEnabled, v6);
}

uint64_t container_create_or_lookup_system_group_paths(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  _QWORD v7[8];
  _QWORD v8[4];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2000000000;
  v12 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2000000000;
  v8[3] = 1;
  v4 = _os_activity_create(&dword_1CF7DA000, "container_create_or_lookup_system_group_paths", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  v7[0] = MEMORY[0x1E0C87450];
  v7[1] = 0x40000000;
  v7[2] = __container_create_or_lookup_system_group_paths_block_invoke;
  v7[3] = &unk_1E8CB3280;
  v7[4] = v8;
  v7[5] = &v9;
  v7[6] = a1;
  v7[7] = a2;
  os_activity_apply(v4, v7);
  os_release(v4);
  v5 = v10[3];
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v9, 8);
  return v5;
}

void __container_create_or_lookup_system_group_paths_block_invoke(_QWORD *a1)
{
  const char *v2;
  xpc_object_t v3;
  int active_platform;
  _QWORD *v5;
  unint64_t i;
  uint64_t v7;
  const char *identifier;
  const char *path;
  uint64_t v10;
  void *v11;
  const char *string;
  uint64_t v13;
  uint64_t *v14;
  unint64_t v15;

  v15 = 0;
  v2 = (const char *)a1[6];
  if (v2)
    v3 = xpc_string_create(v2);
  else
    v3 = 0;
  active_platform = dyld_get_active_platform();
  v5 = (_QWORD *)_container_legacy_lookup_multiple(0xDuLL, v3, 0, 0, 1, 0, active_platform, &v15, (uint64_t *)(*(_QWORD *)(a1[4] + 8) + 24));
  if (v5)
  {
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = xpc_dictionary_create(0, 0, 0);
    if (v15)
    {
      for (i = 0; i < v15; ++i)
      {
        v7 = v5[i];
        identifier = (const char *)container_object_get_identifier(v7);
        path = (const char *)container_object_get_path(v7);
        v10 = *(_QWORD *)(v7 + 88);
        if (v10 && (v11 = *(void **)(v10 + 128)) != 0)
          string = xpc_array_get_string(v11, *(unsigned int *)(v7 + 96));
        else
          string = *(const char **)(v7 + 48);
        xpc_dictionary_set_string(*(xpc_object_t *)(*(_QWORD *)(a1[5] + 8) + 24), identifier, path);
        if (string)
          container_sandbox_extension_consume((uint64_t)string, path, 0, 1);
      }
    }
  }
  if (v3)
    xpc_release(v3);
  container_free_array_of_containers(v5, v15);
  v13 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  if (v13 != 1)
  {
    v14 = (uint64_t *)a1[7];
    if (v14)
    {
      *v14 = v13;
      v13 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
    }
  }
  container_log_error((uint64_t)"container_create_or_lookup_system_group_paths", gClientFaultLoggingEnabled, v13);
}

uint64_t _container_legacy_lookup_multiple(unint64_t a1, void *a2, void *a3, int a4, int a5, int a6, int a7, _QWORD *a8, uint64_t *a9)
{
  uint64_t *v9;
  _QWORD *v10;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  _QWORD *v23;
  int v24;
  uid_t v25;
  uid_t v26;
  uint64_t *v27;
  BOOL v28;
  uint64_t v29;
  size_t count_results;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  int current_persona_proximate_info;
  int current_persona;
  const char *v37;
  NSObject *v38;
  uid_t v39;
  int v40;
  int v41;
  const char *v42;
  const char *v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int current_persona_originator_info;
  uid_t v51;
  _QWORD v52[6];
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint8_t v61[4];
  int v62;
  __int16 v63;
  const char *v64;
  __int16 v65;
  const char *v66;
  __int16 v67;
  int v68;
  __int16 v69;
  int v70;
  __int16 v71;
  int v72;
  __int16 v73;
  int v74;
  __int16 v75;
  unint64_t v76;
  __int16 v77;
  int v78;
  __int16 v79;
  uid_t v80;
  __int16 v81;
  uid_t v82;
  uint8_t buf[4];
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[256];
  uint64_t v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  uint64_t v97;

  v9 = a9;
  v97 = *MEMORY[0x1E0C874D8];
  v57 = 0;
  v58 = &v57;
  v59 = 0x2000000000;
  v60 = 0;
  v53 = 0;
  v54 = &v53;
  v55 = 0x2000000000;
  v56 = 0;
  if (a1 - 1 > 0xD)
  {
    v27 = 0;
    v32 = 20;
  }
  else
  {
    v10 = a8;
    if (a8)
    {
      if ((a1 & 0xFFFFFFFFFFFFFFFELL) == 0xC || a1 <= 8 && ((1 << a1) & 0x12A) != 0)
      {
        if (container_log_handle_for_category_onceToken != -1)
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        v18 = qword_1ECD3F348;
        if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_DEFAULT))
        {
          v19 = a2;
          v20 = a3;
          v21 = a7;
          v22 = a5;
          v23 = v10;
          v24 = a6;
          v25 = geteuid();
          v26 = getuid();
          *(_DWORD *)buf = 134218752;
          *(_QWORD *)&v84 = a1;
          WORD4(v84) = 1024;
          *(_DWORD *)((char *)&v84 + 10) = a4;
          HIWORD(v84) = 1024;
          LODWORD(v85) = v25;
          a6 = v24;
          v10 = v23;
          a5 = v22;
          a7 = v21;
          a3 = v20;
          a2 = v19;
          v9 = a9;
          WORD2(v85) = 1024;
          *(_DWORD *)((char *)&v85 + 6) = v26;
          _os_log_impl(&dword_1CF7DA000, v18, OS_LOG_TYPE_DEFAULT, "Requesting multiple containers; class = %llu, temp = %d, euid = %d, uid = %d",
            buf,
            0x1Eu);
        }
      }
      else
      {
        v95 = 0u;
        v96 = 0u;
        v94 = 0u;
        current_persona_originator_info = voucher_get_current_persona_originator_info();
        v47 = DWORD1(v95);
        v48 = DWORD2(v94);
        v92 = 0u;
        v93 = 0u;
        v91 = 0u;
        current_persona_proximate_info = voucher_get_current_persona_proximate_info();
        v45 = DWORD2(v91);
        v46 = current_persona_proximate_info;
        v44 = DWORD1(v92);
        v90 = 0;
        memset(v89, 0, sizeof(v89));
        v88 = 0u;
        v87 = 0u;
        v86 = 0u;
        v85 = 0u;
        v84 = 0u;
        *(_DWORD *)buf = 2;
        current_persona = voucher_get_current_persona();
        if (current_persona == -1 || (kpersona_info() & 0x80000000) != 0)
        {
          v42 = "NOPERSONA";
          v43 = "<unknown>";
        }
        else
        {
          if ((DWORD1(v84) - 2) > 4)
            v37 = "<unknown>";
          else
            v37 = (&off_1E8CB3988)[DWORD1(v84) - 2];
          v42 = v37;
          v43 = &v89[4];
        }
        v49 = a6;
        if (container_log_handle_for_category_onceToken != -1)
          dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
        v38 = qword_1ECD3F348;
        if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_DEFAULT))
        {
          v40 = v48 & ~(current_persona_originator_info >> 31);
          v41 = v47 & ~(current_persona_originator_info >> 31);
          v51 = geteuid();
          v39 = getuid();
          *(_DWORD *)v61 = 67111682;
          v62 = current_persona;
          v63 = 2082;
          v64 = v42;
          v65 = 2082;
          v66 = v43;
          v67 = 1024;
          v68 = v40;
          v69 = 1024;
          v70 = v41;
          v71 = 1024;
          v72 = v45 & ~(v46 >> 31);
          v73 = 1024;
          v74 = v44 & ~(v46 >> 31);
          v75 = 2048;
          v76 = a1;
          v77 = 1024;
          v78 = a4;
          v79 = 1024;
          v80 = v51;
          v81 = 1024;
          v82 = v39;
          _os_log_impl(&dword_1CF7DA000, v38, OS_LOG_TYPE_DEFAULT, "Requesting multiple containers; personaid = %d, type = %{public}s, name = %{public}s, origin [pid = %d, pers"
            "onaid = %d], proximate [pid = %d, personaid = %d], class = %llu, temp = %d, euid = %d, uid = %d",
            v61,
            0x50u);
        }
        a6 = v49;
      }
      v27 = container_query_create();
      container_query_set_class(v27, a1);
      container_query_set_transient((uint64_t)v27, a4);
      if (a2)
        container_query_set_identifiers(v27, a2);
      v28 = a1 == 13 || a1 == 7;
      if (v28 && a3)
        container_query_set_group_identifiers(v27, a3);
      container_query_operation_set_platform((uint64_t)v27, a7);
      if (a5)
        v29 = 0x900000001;
      else
        v29 = 0x900000000;
      container_query_operation_set_flags(v27, v29);
      if (a6)
        container_query_set_include_other_owners((uint64_t)v27, 1);
      v27[13] = 3;
      count_results = container_query_count_results((uint64_t)v27);
      if ((count_results & 0x8000000000000000) != 0)
        goto LABEL_52;
      v31 = malloc_type_calloc(count_results, 8uLL, 0x2004093837F09uLL);
      v58[3] = (uint64_t)v31;
      if (!v31)
      {
        v32 = 73;
        goto LABEL_34;
      }
      v52[0] = MEMORY[0x1E0C87450];
      v52[1] = 0x40000000;
      v52[2] = ___container_legacy_lookup_multiple_block_invoke;
      v52[3] = &unk_1E8CB3900;
      v52[4] = &v57;
      v52[5] = &v53;
      if (!container_query_iterate_results_sync((uint64_t)v27, (uint64_t)v52))
      {
LABEL_52:
        if (*v27)
          v32 = *(_QWORD *)*v27;
        else
          v32 = 53;
      }
      else
      {
        *v10 = v54[3];
        v32 = 1;
      }
    }
    else
    {
      v27 = 0;
      v32 = 38;
    }
  }
LABEL_34:
  container_query_free(v27);
  if (v9 && v32 != 1)
    *v9 = v32;
  v33 = v58[3];
  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);
  return v33;
}

uint64_t ___container_legacy_lookup_multiple_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = container_copy_object(a2);
  if (v3)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)
              + 8 * (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))++) = v3;
  return 1;
}

uint64_t container_create_or_lookup_app_group_paths(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return container_create_or_lookup_app_group_paths_for_current_user(a2, a3);
}

uint64_t container_create_or_lookup_app_group_paths_for_current_user(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2000000000;
  v11 = 0;
  v4 = _os_activity_create(&dword_1CF7DA000, "container_create_or_lookup_app_group_paths_for_current_user", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C87450];
  block[1] = 0x40000000;
  block[2] = __container_create_or_lookup_app_group_paths_for_current_user_block_invoke;
  block[3] = &unk_1E8CB32D0;
  block[4] = &v8;
  block[5] = a1;
  block[6] = a2;
  os_activity_apply(v4, block);
  os_release(v4);
  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __container_create_or_lookup_app_group_paths_for_current_user_block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = container_create_or_lookup_app_group_paths_for_platform(a1[5], 0, a1[6]);
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  return result;
}

uint64_t container_create_or_lookup_app_group_paths_for_platform(uint64_t a1, int a2, uint64_t a3)
{
  NSObject *v6;
  uint64_t v7;
  _QWORD block[8];
  int v10;
  _QWORD v11[4];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2000000000;
  v15 = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2000000000;
  v11[3] = 1;
  v6 = _os_activity_create(&dword_1CF7DA000, "container_create_or_lookup_app_group_paths_for_platform", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C87450];
  block[1] = 0x40000000;
  block[2] = __container_create_or_lookup_app_group_paths_for_platform_block_invoke;
  block[3] = &unk_1E8CB32A8;
  v10 = a2;
  block[4] = v11;
  block[5] = &v12;
  block[6] = a1;
  block[7] = a3;
  os_activity_apply(v6, block);
  os_release(v6);
  v7 = v13[3];
  _Block_object_dispose(v11, 8);
  _Block_object_dispose(&v12, 8);
  return v7;
}

void __container_create_or_lookup_app_group_paths_for_platform_block_invoke(uint64_t a1)
{
  const char *v2;
  xpc_object_t v3;
  _QWORD *v4;
  unint64_t i;
  uint64_t v6;
  const char *identifier;
  const char *path;
  uint64_t v9;
  void *v10;
  const char *string;
  uint64_t v12;
  uint64_t *v13;
  unint64_t v14;

  v14 = 0;
  v2 = *(const char **)(a1 + 48);
  if (v2)
    v3 = xpc_string_create(v2);
  else
    v3 = 0;
  v4 = (_QWORD *)_container_legacy_lookup_multiple(7uLL, v3, 0, 0, 1, 0, *(_DWORD *)(a1 + 64), &v14, (uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  if (v4)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = xpc_dictionary_create(0, 0, 0);
    if (v14)
    {
      for (i = 0; i < v14; ++i)
      {
        v6 = v4[i];
        identifier = (const char *)container_object_get_identifier(v6);
        path = (const char *)container_object_get_path(v6);
        v9 = *(_QWORD *)(v6 + 88);
        if (v9 && (v10 = *(void **)(v9 + 128)) != 0)
          string = xpc_array_get_string(v10, *(unsigned int *)(v6 + 96));
        else
          string = *(const char **)(v6 + 48);
        xpc_dictionary_set_string(*(xpc_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), identifier, path);
        if (string)
          container_sandbox_extension_consume((uint64_t)string, path, 0, 1);
      }
    }
  }
  if (v3)
    xpc_release(v3);
  container_free_array_of_containers(v4, v14);
  v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v12 != 1)
  {
    v13 = *(uint64_t **)(a1 + 56);
    if (v13)
    {
      *v13 = v12;
      v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    }
  }
  container_log_error((uint64_t)"container_create_or_lookup_app_group_paths_for_platform", gClientFaultLoggingEnabled, v12);
}

uint64_t container_create_or_lookup_group_container_paths_for_current_user(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return container_create_or_lookup_app_group_paths_for_current_user(a1, a3);
}

uint64_t container_create_or_lookup_app_group_paths_from_entitlements(uint64_t a1, int a2, uint64_t a3)
{
  return container_create_or_lookup_app_group_paths_from_entitlements_4ls(a1, 1, a2, a3);
}

uint64_t container_create_or_lookup_app_group_paths_from_entitlements_4ls(uint64_t a1, char a2, int a3, uint64_t a4)
{
  NSObject *v8;
  uint64_t v9;
  _QWORD block[8];
  int v12;
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];

  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2000000000;
  v18[3] = 1;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2000000000;
  v17 = 0;
  v8 = _os_activity_create(&dword_1CF7DA000, "container_create_or_lookup_app_group_paths_from_entitlements", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C87450];
  block[1] = 0x40000000;
  block[2] = __container_create_or_lookup_app_group_paths_from_entitlements_4ls_block_invoke;
  block[3] = &unk_1E8CB32F8;
  v13 = a2;
  v12 = a3;
  block[4] = v18;
  block[5] = &v14;
  block[6] = a1;
  block[7] = a4;
  os_activity_apply(v8, block);
  os_release(v8);
  v9 = v15[3];
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(v18, 8);
  return v9;
}

void __container_create_or_lookup_app_group_paths_from_entitlements_4ls_block_invoke(uint64_t a1)
{
  xpc_object_t array;
  xpc_object_t v3;
  _QWORD *v4;
  unint64_t i;
  uint64_t v6;
  const char *identifier;
  const char *path;
  uint64_t v9;
  void *v10;
  const char *string;
  uint64_t v12;
  uint64_t *v13;
  unint64_t v14;

  v14 = 0;
  array = xpc_dictionary_get_array(*(xpc_object_t *)(a1 + 48), "com.apple.security.application-groups");
  if (array)
  {
    v3 = xpc_retain(array);
    v4 = (_QWORD *)_container_legacy_lookup_multiple(7uLL, 0, v3, 0, *(unsigned __int8 *)(a1 + 68), 0, *(_DWORD *)(a1 + 64), &v14, (uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
    if (v4)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = xpc_dictionary_create(0, 0, 0);
      if (v14)
      {
        for (i = 0; i < v14; ++i)
        {
          v6 = v4[i];
          identifier = (const char *)container_object_get_identifier(v6);
          path = (const char *)container_object_get_path(v6);
          v9 = *(_QWORD *)(v6 + 88);
          if (v9 && (v10 = *(void **)(v9 + 128)) != 0)
            string = xpc_array_get_string(v10, *(unsigned int *)(v6 + 96));
          else
            string = *(const char **)(v6 + 48);
          xpc_dictionary_set_string(*(xpc_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), identifier, path);
          if (string)
            container_sandbox_extension_consume((uint64_t)string, path, 0, 1);
        }
      }
    }
    if (v3)
      xpc_release(v3);
  }
  else
  {
    v4 = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 143;
  }
  container_free_array_of_containers(v4, v14);
  v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v12 != 1)
  {
    v13 = *(uint64_t **)(a1 + 56);
    if (v13)
    {
      *v13 = v12;
      v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    }
  }
  container_log_error((uint64_t)"container_create_or_lookup_app_group_paths_from_entitlements_4ls", gClientFaultLoggingEnabled, v12);
}

uint64_t container_group_container_identifiers_for_current_user(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  _QWORD v7[8];
  _QWORD v8[4];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2000000000;
  v12 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2000000000;
  v8[3] = 1;
  v4 = _os_activity_create(&dword_1CF7DA000, "container_group_container_identifiers_for_current_user", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  v7[0] = MEMORY[0x1E0C87450];
  v7[1] = 0x40000000;
  v7[2] = __container_group_container_identifiers_for_current_user_block_invoke;
  v7[3] = &unk_1E8CB3320;
  v7[4] = v8;
  v7[5] = &v9;
  v7[6] = a1;
  v7[7] = a2;
  os_activity_apply(v4, v7);
  os_release(v4);
  v5 = v10[3];
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v9, 8);
  return v5;
}

void __container_group_container_identifiers_for_current_user_block_invoke(_QWORD *a1)
{
  const char *v2;
  xpc_object_t v3;
  int active_platform;
  _QWORD *v5;
  unint64_t i;
  const char *identifier;
  xpc_object_t v8;
  uint64_t v9;
  uint64_t *v10;
  unint64_t v11;

  v11 = 0;
  v2 = (const char *)a1[6];
  if (v2)
    v3 = xpc_string_create(v2);
  else
    v3 = 0;
  active_platform = dyld_get_active_platform();
  v5 = (_QWORD *)_container_legacy_lookup_multiple(7uLL, v3, 0, 0, 1, 0, active_platform, &v11, (uint64_t *)(*(_QWORD *)(a1[4] + 8) + 24));
  if (v5)
  {
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = xpc_array_create(0, 0);
    if (v11)
    {
      for (i = 0; i < v11; ++i)
      {
        identifier = (const char *)container_object_get_identifier(v5[i]);
        v8 = xpc_string_create(identifier);
        xpc_array_append_value(*(xpc_object_t *)(*(_QWORD *)(a1[5] + 8) + 24), v8);
        if (v8)
          xpc_release(v8);
      }
    }
  }
  if (v3)
    xpc_release(v3);
  container_free_array_of_containers(v5, v11);
  v9 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  if (v9 != 1)
  {
    v10 = (uint64_t *)a1[7];
    if (v10)
    {
      *v10 = v9;
      v9 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
    }
  }
  container_log_error((uint64_t)"container_group_container_identifiers_for_current_user", gClientFaultLoggingEnabled, v9);
}

uint64_t container_get_all_with_class(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  return container_get_all_with_class_for_current_user(a2, a3, a4, a5);
}

uint64_t container_get_all_with_class_for_current_user(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  NSObject *v8;
  uint64_t v9;
  _QWORD v11[9];
  char v12;
  _QWORD v13[4];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2000000000;
  v17 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2000000000;
  v13[3] = 1;
  v8 = _os_activity_create(&dword_1CF7DA000, "container_get_all_with_class_for_current_user", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  v11[0] = MEMORY[0x1E0C87450];
  v11[1] = 0x40000000;
  v11[2] = __container_get_all_with_class_for_current_user_block_invoke;
  v11[3] = &unk_1E8CB3348;
  v12 = a2;
  v11[6] = a1;
  v11[7] = a3;
  v11[4] = &v14;
  v11[5] = v13;
  v11[8] = a4;
  os_activity_apply(v8, v11);
  os_release(v8);
  v9 = v15[3];
  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v14, 8);
  return v9;
}

void __container_get_all_with_class_for_current_user_block_invoke(uint64_t a1)
{
  unint64_t v2;
  int v3;
  int active_platform;
  uint64_t v5;
  uint64_t *v6;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(unsigned __int8 *)(a1 + 72);
  active_platform = dyld_get_active_platform();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = _container_legacy_lookup_multiple(v2, 0, 0, v3, 0, 1, active_platform, *(_QWORD **)(a1 + 56), (uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)+ 24));
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v5 != 1)
  {
    v6 = *(uint64_t **)(a1 + 64);
    if (v6)
    {
      *v6 = v5;
      v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    }
  }
  container_log_error((uint64_t)"container_get_all_with_class_for_current_user", gClientFaultLoggingEnabled, v5);
}

uint64_t container_replace(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  uint64_t v7;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2000000000;
  v13 = 1;
  v6 = _os_activity_create(&dword_1CF7DA000, "container_replace", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  v9[0] = MEMORY[0x1E0C87450];
  v9[1] = 0x40000000;
  v9[2] = __container_replace_block_invoke;
  v9[3] = &unk_1E8CB3370;
  v9[6] = a1;
  v9[7] = a2;
  v9[4] = a3;
  v9[5] = &v10;
  os_activity_apply(v6, v9);
  os_release(v6);
  container_log_error((uint64_t)"container_replace", gClientFaultLoggingEnabled, v11[3]);
  v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

void __container_replace_block_invoke(uint64_t *a1)
{
  char *v2;
  char *v3;
  NSObject *v4;
  uint64_t v5;
  const unsigned __int8 *uuid;
  xpc_object_t v7;
  xpc_object_t v8;
  void *v9;
  xpc_object_t v10;
  uint64_t v11;
  uint64_t v12;
  const unsigned __int8 *v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  unsigned __int8 *v19;
  char *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  void *v26;
  char *__s;
  void *v28;
  uint8_t buf[4];
  char *v30;
  __int16 v31;
  char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C874D8];
  v28 = 0;
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = container_copy_unlocalized_description(a1[6]);
    __s = v2;
    v3 = container_copy_unlocalized_description(a1[7]);
    v26 = v3;
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v4 = container_log_handle_for_category_logHandles[0];
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v30 = v2;
      v31 = 2080;
      v32 = v3;
      _os_log_impl(&dword_1CF7DA000, v4, OS_LOG_TYPE_DEFAULT, "Replace; old = %s, new = %s", buf, 0x16u);
      v2 = __s;
    }
    if (v2)
    {
      free(v2);
      memset_s(&__s, 8uLL, 0, 8uLL);
    }
    if (v26)
    {
      free(v26);
      memset_s(&v26, 8uLL, 0, 8uLL);
    }
  }
  v5 = a1[7];
  if (!v5
    || (uuid = (const unsigned __int8 *)container_object_get_uuid(a1[7]), uuid_is_null(uuid))
    || !container_object_get_identifier(v5)
    || (unint64_t)container_object_get_class(v5) - 1 >= 0xE
    || (v12 = a1[6]) != 0
    && ((v13 = (const unsigned __int8 *)container_object_get_uuid(a1[6]), uuid_is_null(v13))
     || !container_object_get_identifier(v12)
     || (unint64_t)container_object_get_class(v12) - 1 >= 0xE))
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = 11;
    goto LABEL_15;
  }
  v10 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v10, "Command", 2uLL);
  if (a1[6])
  {
    v8 = xpc_dictionary_create(0, 0, 0);
    container_xpc_encode_container_object(v8, a1[6], 0);
    xpc_dictionary_set_value(v10, "OldContainer", v8);
  }
  else
  {
    v8 = 0;
  }
  v7 = xpc_dictionary_create(0, 0, 0);
  container_xpc_encode_container_object(v7, a1[7], 0);
  xpc_dictionary_set_value(v10, "NewContainer", v7);
  LODWORD(v26) = 0;
  v14 = container_disposition(a1[7], &v26);
  v15 = (void *)container_xpc_send_sync_message(v14, 0, v10, 0, (int)v26, 0, (uint64_t)&v28);
  if (!v15)
  {
    v24 = v28;
    if (v28)
      v25 = *(_QWORD *)v28;
    else
      v25 = 1;
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v25;
    container_error_free(v24);
    v9 = 0;
    goto LABEL_15;
  }
  v9 = v15;
  v16 = *(_QWORD *)(a1[5] + 8);
  v18 = *(_QWORD *)(v16 + 24);
  v17 = (uint64_t *)(v16 + 24);
  if (v18 != 1)
    goto LABEL_15;
  v19 = container_xpc_decode_container_object(v15, v17);
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_DEBUG))
  {
    v20 = (char *)MEMORY[0x1D17D632C](v9);
    __s = v20;
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v21 = qword_1ECD3F348;
    if (!os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_DEBUG))
    {
      if (!v20)
        goto LABEL_46;
      goto LABEL_45;
    }
    *(_DWORD *)buf = 136315138;
    v30 = v20;
    _os_log_debug_impl(&dword_1CF7DA000, v21, OS_LOG_TYPE_DEBUG, "Updated container during replace: %s", buf, 0xCu);
    if (v20)
    {
LABEL_45:
      free(v20);
      memset_s(&__s, 8uLL, 0, 8uLL);
    }
  }
LABEL_46:
  if (v19)
  {
    container_update_with_container(a1[7], (uint64_t)v19);
    v22 = a1[7];
    __container_object_separate_from_query((_QWORD *)v22);
    *(_BYTE *)(v22 + 108) = 0;
    container_object_free(v19);
    v23 = a1[6];
    if (v23)
    {
      __container_object_separate_from_query((_QWORD *)a1[6]);
      *(_QWORD *)(v23 + 16) = 0;
    }
    _container_async_reclaim_disk_space(a1[4]);
  }
LABEL_15:
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) != 1)
  {
    v11 = a1[4];
    if (v11)
      (*(void (**)(void))(v11 + 16))();
  }
  if (v8)
    xpc_release(v8);
  if (v7)
    xpc_release(v7);
  if (v9)
    xpc_release(v9);
  if (v10)
    xpc_release(v10);
}

void _container_async_reclaim_disk_space(uint64_t a1)
{
  _QWORD block[5];

  if (a1)
  {
    if (_container_async_reclaim_disk_space_onceToken != -1)
      dispatch_once(&_container_async_reclaim_disk_space_onceToken, &__block_literal_global_103);
    block[0] = MEMORY[0x1E0C87450];
    block[1] = 0x40000000;
    block[2] = ___container_async_reclaim_disk_space_block_invoke_2;
    block[3] = &unk_1E8CB3968;
    block[4] = a1;
    dispatch_async((dispatch_queue_t)_container_async_reclaim_disk_space_queue, block);
  }
}

void ___container_async_reclaim_disk_space_block_invoke_2(uint64_t a1)
{
  uint64_t *v2;

  v2 = (uint64_t *)container_operation_delete_reclaim_disk_space();
  container_log_ext_error((uint64_t)"_container_async_reclaim_disk_space_block_invoke_2", gClientFaultLoggingEnabled, v2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  container_error_free(v2);
}

dispatch_queue_t ___container_async_reclaim_disk_space_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("container_delete_array_of_containers async obliteration", 0);
  _container_async_reclaim_disk_space_queue = (uint64_t)result;
  return result;
}

uint64_t container_set_code_signing_info_for_identifier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  uint64_t v7;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2000000000;
  v13 = 1;
  v6 = _os_activity_create(&dword_1CF7DA000, "container_set_code_signing_info_for_identifier", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  v9[0] = MEMORY[0x1E0C87450];
  v9[1] = 0x40000000;
  v9[2] = __container_set_code_signing_info_for_identifier_block_invoke;
  v9[3] = &unk_1E8CB3550;
  v9[4] = &v10;
  v9[5] = a1;
  v9[6] = a2;
  v9[7] = a3;
  os_activity_apply(v6, v9);
  os_release(v6);
  container_log_error((uint64_t)"container_set_code_signing_info_for_identifier", gClientFaultLoggingEnabled, v11[3]);
  v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

void __container_set_code_signing_info_for_identifier_block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;

  v8 = 0;
  if (!*(_QWORD *)(a1 + 40))
  {
    v6 = 0;
    v2 = 0;
    v7 = 18;
    goto LABEL_13;
  }
  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "Command", 0x12uLL);
  xpc_dictionary_set_string(v2, "Identifier", *(const char **)(a1 + 40));
  v3 = *(void **)(a1 + 48);
  if (v3)
    xpc_dictionary_set_value(v2, "CodeSigningInfo", v3);
  v4 = *(void **)(a1 + 56);
  if (v4)
    xpc_dictionary_set_value(v2, "OptionsDictionary", v4);
  v5 = (void *)container_xpc_send_sync_message(2, 0, v2, 1, 0, 0, (uint64_t)&v8);
  v6 = v8;
  if (!v5)
  {
    if (v8)
      v7 = *(_QWORD *)v8;
    else
      v7 = 1;
LABEL_13:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v7;
    container_error_free(v6);
    if (!v2)
      return;
    goto LABEL_14;
  }
  container_error_free(v8);
  xpc_release(v5);
  if (v2)
LABEL_14:
    xpc_release(v2);
}

uint64_t container_delete_with_uid_class_and_identifier(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  return container_delete_with_class_and_identifier_for_current_user(a2, a3, a4, a5);
}

uint64_t container_delete_with_class_and_identifier_for_current_user(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  NSObject *v8;
  uint64_t v9;
  _QWORD block[8];
  char v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2000000000;
  v16 = 1;
  v8 = _os_activity_create(&dword_1CF7DA000, "container_delete_with_class_and_identifier_for_current_user", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C87450];
  block[1] = 0x40000000;
  block[2] = __container_delete_with_class_and_identifier_for_current_user_block_invoke;
  block[3] = &unk_1E8CB3398;
  block[6] = a2;
  block[7] = a1;
  v12 = a3;
  block[4] = a4;
  block[5] = &v13;
  os_activity_apply(v8, block);
  os_release(v8);
  container_log_error((uint64_t)"container_delete_with_class_and_identifier_for_current_user", gClientFaultLoggingEnabled, v14[3]);
  v9 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v9;
}

void __container_delete_with_class_and_identifier_for_current_user_block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  uint64_t v3;
  int v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v13 = 0;
  if (!*(_QWORD *)(a1 + 48))
  {
    v5 = 0;
    v2 = 0;
    v6 = 0;
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = 18;
LABEL_7:
    *(_QWORD *)(v7 + 24) = v8;
    goto LABEL_17;
  }
  if ((unint64_t)(*(_QWORD *)(a1 + 56) - 1) >= 0xE)
  {
    v5 = 0;
    v2 = 0;
    v6 = 0;
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = 20;
    goto LABEL_7;
  }
  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "Command", 0xAuLL);
  xpc_dictionary_set_string(v2, "Identifier", *(const char **)(a1 + 48));
  xpc_dictionary_set_uint64(v2, "ContainerClass", *(_QWORD *)(a1 + 56));
  xpc_dictionary_set_BOOL(v2, "Transient", *(_BYTE *)(a1 + 64));
  v3 = *(_QWORD *)(a1 + 56);
  if ((v3 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
  {
    v4 = 1;
  }
  else
  {
    v9 = v3 - 1;
    if (v9 > 0xD)
      v4 = 0;
    else
      v4 = dword_1CF7FFD6C[v9];
  }
  v10 = container_xpc_send_sync_message(v4, 0, v2, 0, 0, 0, (uint64_t)&v13);
  if (v10)
  {
    v6 = (void *)v10;
    _container_async_reclaim_disk_space(*(_QWORD *)(a1 + 32));
    v5 = v13;
  }
  else
  {
    v5 = v13;
    if (v13)
      v11 = *(_QWORD *)v13;
    else
      v11 = 1;
    v6 = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v11;
  }
LABEL_17:
  container_error_free(v5);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 1)
  {
    v12 = *(_QWORD *)(a1 + 32);
    if (v12)
      (*(void (**)(void))(v12 + 16))();
  }
  if (v6)
    xpc_release(v6);
  if (v2)
    xpc_release(v2);
}

uint64_t container_delete(uint64_t a1, uint64_t a2)
{
  const unsigned __int8 *uuid;
  uint64_t v5;
  NSObject *v7;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  if (a1
    && (uuid = (const unsigned __int8 *)container_object_get_uuid(a1), !uuid_is_null(uuid))
    && container_object_get_identifier(a1)
    && (unint64_t)container_object_get_class(a1) - 1 < 0xE)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2000000000;
    v12 = 1;
    v7 = _os_activity_create(&dword_1CF7DA000, "container_delete", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
    block[0] = MEMORY[0x1E0C87450];
    block[1] = 0x40000000;
    block[2] = __container_delete_block_invoke;
    block[3] = &unk_1E8CB33C0;
    block[5] = &v9;
    block[6] = a1;
    block[4] = a2;
    os_activity_apply(v7, block);
    os_release(v7);
    container_log_error((uint64_t)"container_delete", gClientFaultLoggingEnabled, v10[3]);
    v5 = v10[3];
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    v5 = 11;
    (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a2, 11);
  }
  return v5;
}

uint64_t __container_delete_block_invoke(uint64_t *a1)
{
  uint64_t result;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C874D8];
  v3[0] = a1[6];
  result = container_delete_array_of_containers((uint64_t)v3, 1, a1[4]);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

uint64_t container_delete_array_of_containers(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  uint64_t v7;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2000000000;
  v13 = 1;
  v6 = _os_activity_create(&dword_1CF7DA000, "container_delete_array_of_containers", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  v9[0] = MEMORY[0x1E0C87450];
  v9[1] = 0x40000000;
  v9[2] = __container_delete_array_of_containers_block_invoke;
  v9[3] = &unk_1E8CB33E8;
  v9[6] = a1;
  v9[7] = a2;
  v9[4] = a3;
  v9[5] = &v10;
  os_activity_apply(v6, v9);
  os_release(v6);
  container_log_error((uint64_t)"container_delete_array_of_containers", gClientFaultLoggingEnabled, v11[3]);
  v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

void __container_delete_array_of_containers_block_invoke(uint64_t *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v5 = 0;
  v6 = 0;
  v2 = (void *)container_operation_delete_array(a1[6], a1[7], 0, &v5, &v6);
  if (!v2)
  {
    if (v6)
      v3 = *(_QWORD *)v6;
    else
      v3 = 1;
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v3;
  }
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) != 1
    || (_container_async_reclaim_disk_space(a1[4]), *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) != 1))
  {
    v4 = a1[4];
    if (v4)
      (*(void (**)(void))(v4 + 16))();
  }
  container_free_array_of_containers(v2, v5);
  container_error_free(v6);
}

uint64_t container_set_info_value(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  uint64_t v7;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2000000000;
  v13 = 1;
  v6 = _os_activity_create(&dword_1CF7DA000, "container_set_info_value", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  v9[0] = MEMORY[0x1E0C87450];
  v9[1] = 0x40000000;
  v9[2] = __container_set_info_value_block_invoke;
  v9[3] = &unk_1E8CB3410;
  v9[4] = &v10;
  v9[5] = a1;
  v9[6] = a2;
  v9[7] = a3;
  os_activity_apply(v6, v9);
  os_release(v6);
  container_log_error((uint64_t)"container_set_info_value", gClientFaultLoggingEnabled, v11[3]);
  v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

void __container_set_info_value_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const unsigned __int8 *uuid;
  uint64_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  uint64_t v7;
  int v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  int v13;

  v12 = 0;
  v2 = *(_QWORD *)(a1 + 40);
  if (!v2
    || (uuid = (const unsigned __int8 *)container_object_get_uuid(*(_QWORD *)(a1 + 40)), uuid_is_null(uuid))
    || !container_object_get_identifier(v2)
    || (unint64_t)container_object_get_class(v2) - 1 > 0xD)
  {
    v4 = 11;
LABEL_4:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
    return;
  }
  if (!*(_QWORD *)(a1 + 48))
  {
    v4 = 38;
    goto LABEL_4;
  }
  v5 = xpc_dictionary_create(0, 0, 0);
  container_xpc_encode_container_object(v5, *(_QWORD *)(a1 + 40), 0);
  v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v6, "Command", 5uLL);
  xpc_dictionary_set_value(v6, "Container", v5);
  xpc_dictionary_set_string(v6, "Key", *(const char **)(a1 + 48));
  xpc_dictionary_set_value(v6, "Value", *(xpc_object_t *)(a1 + 56));
  v7 = *(_QWORD *)(a1 + 40);
  v13 = 0;
  v8 = container_disposition(v7, &v13);
  v9 = (void *)container_xpc_send_sync_message(v8, 0, v6, 1, v13, 0, (uint64_t)&v12);
  v10 = v12;
  if (!v9)
  {
    if (v12)
      v11 = *(_QWORD *)v12;
    else
      v11 = 1;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v11;
  }
  container_error_free(v10);
  if (v5)
    xpc_release(v5);
  if (v9)
    xpc_release(v9);
  if (v6)
    xpc_release(v6);
}

uint64_t container_copy_info_value_for_key(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  NSObject *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[8];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2000000000;
  v19 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2000000000;
  v15 = 1;
  v6 = _os_activity_create(&dword_1CF7DA000, "container_copy_info_value_for_key", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  v11[0] = MEMORY[0x1E0C87450];
  v11[1] = 0x40000000;
  v11[2] = __container_copy_info_value_for_key_block_invoke;
  v11[3] = &unk_1E8CB3438;
  v11[6] = a1;
  v11[7] = a2;
  v11[4] = &v12;
  v11[5] = &v16;
  os_activity_apply(v6, v11);
  os_release(v6);
  v7 = v13;
  v8 = v13[3];
  if (a3 && v8 != 1)
  {
    *a3 = v8;
    v8 = v7[3];
  }
  container_log_error((uint64_t)"container_copy_info_value_for_key", gClientFaultLoggingEnabled, v8);
  v9 = v17[3];
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  return v9;
}

void __container_copy_info_value_for_key_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const unsigned __int8 *uuid;
  uint64_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  uint64_t v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;

  v13 = 0;
  v2 = *(_QWORD *)(a1 + 48);
  if (!v2
    || (uuid = (const unsigned __int8 *)container_object_get_uuid(*(_QWORD *)(a1 + 48)), uuid_is_null(uuid))
    || !container_object_get_identifier(v2)
    || (unint64_t)container_object_get_class(v2) - 1 > 0xD)
  {
    v4 = 11;
LABEL_4:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
    return;
  }
  if (!*(_QWORD *)(a1 + 56))
  {
    v4 = 38;
    goto LABEL_4;
  }
  v5 = xpc_dictionary_create(0, 0, 0);
  container_xpc_encode_container_object(v5, *(_QWORD *)(a1 + 48), 0);
  v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v6, "Command", 6uLL);
  xpc_dictionary_set_value(v6, "Container", v5);
  xpc_dictionary_set_string(v6, "Key", *(const char **)(a1 + 56));
  v7 = *(_QWORD *)(a1 + 48);
  v14 = 0;
  v8 = container_disposition(v7, &v14);
  v9 = (void *)container_xpc_send_sync_message(v8, 0, v6, 1, v14, 0, (uint64_t)&v13);
  v10 = v9;
  if (v9)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = xpc_dictionary_get_value(v9, "ReplyInfoValue");
    v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    if (v11)
      xpc_retain(v11);
    else
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 53;
  }
  else
  {
    if (v13)
      v12 = *(_QWORD *)v13;
    else
      v12 = 1;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v12;
  }
  container_error_free(v13);
  if (v5)
    xpc_release(v5);
  if (v10)
    xpc_release(v10);
  if (v6)
    xpc_release(v6);
}

uint64_t container_recreate_structure(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2000000000;
  v9 = 1;
  v2 = _os_activity_create(&dword_1CF7DA000, "container_recreate_structure", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  v5[0] = MEMORY[0x1E0C87450];
  v5[1] = 0x40000000;
  v5[2] = __container_recreate_structure_block_invoke;
  v5[3] = &unk_1E8CB3460;
  v5[4] = &v6;
  v5[5] = a1;
  os_activity_apply(v2, v5);
  os_release(v2);
  container_log_error((uint64_t)"container_recreate_structure", gClientFaultLoggingEnabled, v7[3]);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __container_recreate_structure_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const unsigned __int8 *uuid;
  xpc_object_t v4;
  xpc_object_t v5;
  uint64_t v6;
  int v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  int v12;

  v11 = 0;
  v2 = *(_QWORD *)(a1 + 40);
  if (v2
    && (uuid = (const unsigned __int8 *)container_object_get_uuid(*(_QWORD *)(a1 + 40)), !uuid_is_null(uuid))
    && container_object_get_identifier(v2)
    && (unint64_t)container_object_get_class(v2) - 1 < 0xE)
  {
    v4 = xpc_dictionary_create(0, 0, 0);
    container_xpc_encode_container_object(v4, *(_QWORD *)(a1 + 40), 0);
    v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v5, "Command", 8uLL);
    xpc_dictionary_set_value(v5, "Container", v4);
    v6 = *(_QWORD *)(a1 + 40);
    v12 = 0;
    v7 = container_disposition(v6, &v12);
    v8 = (void *)container_xpc_send_sync_message(v7, 0, v5, 1, v12, 0, (uint64_t)&v11);
    v9 = v11;
    if (!v8)
    {
      if (v11)
        v10 = *(_QWORD *)v11;
      else
        v10 = 1;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v10;
    }
    container_error_free(v9);
    if (v4)
      xpc_release(v4);
    if (v8)
      xpc_release(v8);
    if (v5)
      xpc_release(v5);
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 11;
  }
}

uint64_t container_regenerate_uuid(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2000000000;
  v9 = 1;
  v2 = _os_activity_create(&dword_1CF7DA000, "container_regenerate_uuid", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  v5[0] = MEMORY[0x1E0C87450];
  v5[1] = 0x40000000;
  v5[2] = __container_regenerate_uuid_block_invoke;
  v5[3] = &unk_1E8CB3488;
  v5[4] = &v6;
  v5[5] = a1;
  os_activity_apply(v2, v5);
  os_release(v2);
  container_log_error((uint64_t)"container_regenerate_uuid", gClientFaultLoggingEnabled, v7[3]);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __container_regenerate_uuid_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const unsigned __int8 *uuid;
  void *v4;
  xpc_object_t v5;
  xpc_object_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C874D8];
  v15 = 0;
  v2 = *(_QWORD *)(a1 + 40);
  if (!v2
    || (uuid = (const unsigned __int8 *)container_object_get_uuid(*(_QWORD *)(a1 + 40)), uuid_is_null(uuid))
    || !container_object_get_identifier(v2)
    || (unint64_t)container_object_get_class(v2) - 1 >= 0xE)
  {
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 11;
    goto LABEL_4;
  }
  v6 = xpc_dictionary_create(0, 0, 0);
  container_xpc_encode_container_object(v6, *(_QWORD *)(a1 + 40), 0);
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v5, "Command", 9uLL);
  xpc_dictionary_set_value(v5, "Container", v6);
  v8 = *(_QWORD *)(a1 + 40);
  *(_DWORD *)buf = 0;
  v9 = container_disposition(v8, buf);
  v10 = (void *)container_xpc_send_sync_message(v9, 0, v5, 1, *(int *)buf, 0, (uint64_t)&v15);
  if (!v10)
  {
    if (v15)
      v13 = *(_QWORD *)v15;
    else
      v13 = 1;
    v4 = 0;
    v7 = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v13;
    goto LABEL_4;
  }
  v4 = v10;
  v7 = container_xpc_decode_container_object(v10, (uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  v11 = (void *)MEMORY[0x1D17D632C](v4);
  v14 = v11;
  if (container_log_handle_for_category_onceToken != -1)
    dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
  v12 = qword_1ECD3F348;
  if (!os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_DEBUG))
  {
    if (!v11)
      goto LABEL_19;
    goto LABEL_18;
  }
  *(_DWORD *)buf = 136315394;
  v17 = "container_error_t container_regenerate_uuid(container_object_t _Nonnull)_block_invoke";
  v18 = 2080;
  v19 = v11;
  _os_log_debug_impl(&dword_1CF7DA000, v12, OS_LOG_TYPE_DEBUG, "Updated container during %s: %s", buf, 0x16u);
  if (v11)
  {
LABEL_18:
    free(v11);
    memset_s(&v14, 8uLL, 0, 8uLL);
  }
LABEL_19:
  if (v7)
    container_update_with_container(*(_QWORD *)(a1 + 40), (uint64_t)v7);
LABEL_4:
  container_error_free(v15);
  container_object_free(v7);
  if (v6)
    xpc_release(v6);
  if (v4)
    xpc_release(v4);
  if (v5)
    xpc_release(v5);
}

uint64_t container_process_restored_container(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2000000000;
  v9 = 1;
  v2 = _os_activity_create(&dword_1CF7DA000, "container_process_restored_container", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  v5[0] = MEMORY[0x1E0C87450];
  v5[1] = 0x40000000;
  v5[2] = __container_process_restored_container_block_invoke;
  v5[3] = &unk_1E8CB34B0;
  v5[4] = &v6;
  v5[5] = a1;
  os_activity_apply(v2, v5);
  os_release(v2);
  container_log_error((uint64_t)"container_process_restored_container", gClientFaultLoggingEnabled, v7[3]);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __container_process_restored_container_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const unsigned __int8 *uuid;
  xpc_object_t v4;
  xpc_object_t v5;
  uint64_t v6;
  int v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  int v12;

  v11 = 0;
  v2 = *(_QWORD *)(a1 + 40);
  if (v2
    && (uuid = (const unsigned __int8 *)container_object_get_uuid(*(_QWORD *)(a1 + 40)), !uuid_is_null(uuid))
    && container_object_get_identifier(v2)
    && (unint64_t)container_object_get_class(v2) - 1 < 0xE)
  {
    v4 = xpc_dictionary_create(0, 0, 0);
    container_xpc_encode_container_object(v4, *(_QWORD *)(a1 + 40), 0);
    v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v5, "Command", 0x16uLL);
    xpc_dictionary_set_value(v5, "Container", v4);
    v6 = *(_QWORD *)(a1 + 40);
    v12 = 0;
    v7 = container_disposition(v6, &v12);
    v8 = (void *)container_xpc_send_sync_message(v7, 0, v5, 1, v12, 0, (uint64_t)&v11);
    v9 = v11;
    if (!v8)
    {
      if (v11)
        v10 = *(_QWORD *)v11;
      else
        v10 = 1;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v10;
    }
    container_error_free(v9);
    if (v4)
      xpc_release(v4);
    if (v8)
      xpc_release(v8);
    if (v5)
      xpc_release(v5);
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 11;
  }
}

uint64_t container_disk_usage(uint64_t a1, _QWORD *a2)
{
  NSObject *v4;
  uint64_t *v5;
  uint64_t v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2000000000;
  v16 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2000000000;
  v12 = 1;
  v4 = _os_activity_create(&dword_1CF7DA000, "container_disk_usage", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C87450];
  block[1] = 0x40000000;
  block[2] = __container_disk_usage_block_invoke;
  block[3] = &unk_1E8CB34D8;
  block[5] = &v13;
  block[6] = a1;
  block[4] = &v9;
  os_activity_apply(v4, block);
  os_release(v4);
  v5 = v10;
  if (a2)
    *a2 = v10[3];
  container_log_error((uint64_t)"container_disk_usage", gClientFaultLoggingEnabled, v5[3]);
  v6 = v14[3];
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  return v6;
}

void __container_disk_usage_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  const unsigned __int8 *uuid;
  NSObject *v4;
  _DWORD *v5;
  unint64_t identifier;
  xpc_object_t v7;
  xpc_object_t v8;
  int v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  _DWORD *v16;
  __int16 v17;
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C874D8];
  v14 = 0;
  v2 = a1[6];
  if (v2
    && (uuid = (const unsigned __int8 *)container_object_get_uuid(a1[6]), !uuid_is_null(uuid))
    && container_object_get_identifier(v2)
    && (unint64_t)container_object_get_class(v2) - 1 < 0xE)
  {
    if (container_log_handle_for_category_onceToken != -1)
      dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
    v4 = container_log_handle_for_category_logHandles[0];
    if (os_log_type_enabled((os_log_t)container_log_handle_for_category_logHandles[0], OS_LOG_TYPE_DEFAULT))
    {
      v5 = container_object_get_class(a1[6]);
      identifier = container_object_get_identifier(a1[6]);
      *(_DWORD *)buf = 134218243;
      v16 = v5;
      v17 = 2081;
      v18 = identifier;
      _os_log_impl(&dword_1CF7DA000, v4, OS_LOG_TYPE_DEFAULT, "Requesting disk usage; class = %llu, identifier = %{private}s",
        buf,
        0x16u);
    }
    v7 = xpc_dictionary_create(0, 0, 0);
    container_xpc_encode_container_object(v7, a1[6], 0);
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "Command", 0x17uLL);
    xpc_dictionary_set_value(v8, "Container", v7);
    *(_DWORD *)buf = 0;
    v9 = container_disposition(a1[6], buf);
    v10 = (void *)container_xpc_send_sync_message(v9, (void *)1, v8, 1, *(int *)buf, 0, (uint64_t)&v14);
    v11 = v10;
    if (v10)
    {
      *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = xpc_dictionary_get_uint64(v10, "ReplyDiskUsage");
      v12 = v14;
    }
    else
    {
      v12 = v14;
      if (v14)
        v13 = *(_QWORD *)v14;
      else
        v13 = 1;
      *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v13;
    }
    container_error_free(v12);
    if (v7)
      xpc_release(v7);
    if (v11)
      xpc_release(v11);
    if (v8)
      xpc_release(v8);
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = 11;
  }
}

uint64_t container_delete_all_data_container_content(uint64_t a1, uint64_t a2)
{
  return container_delete_all_data_container_content_for_current_user(a2);
}

uint64_t container_delete_all_data_container_content_for_current_user(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2000000000;
  v9 = 1;
  v2 = _os_activity_create(&dword_1CF7DA000, "container_delete_all_data_container_content_for_current_user", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  v5[0] = MEMORY[0x1E0C87450];
  v5[1] = 0x40000000;
  v5[2] = __container_delete_all_data_container_content_for_current_user_block_invoke;
  v5[3] = &unk_1E8CB3500;
  v5[4] = &v6;
  v5[5] = a1;
  os_activity_apply(v2, v5);
  os_release(v2);
  container_log_error((uint64_t)"container_delete_all_data_container_content_for_current_user", gClientFaultLoggingEnabled, v7[3]);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __container_delete_all_data_container_content_for_current_user_block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v6 = 0;
  if (!*(_QWORD *)(a1 + 40))
  {
    v4 = 0;
    v2 = 0;
    v5 = 18;
    goto LABEL_9;
  }
  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "Command", 0xBuLL);
  xpc_dictionary_set_string(v2, "Identifier", *(const char **)(a1 + 40));
  v3 = (void *)container_xpc_send_sync_message(2, 0, v2, 1, 0, 0, (uint64_t)&v6);
  v4 = v6;
  if (!v3)
  {
    if (v6)
      v5 = *(_QWORD *)v6;
    else
      v5 = 1;
LABEL_9:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
    container_error_free(v4);
    if (!v2)
      return;
    goto LABEL_10;
  }
  container_error_free(v6);
  xpc_release(v3);
  if (v2)
LABEL_10:
    xpc_release(v2);
}

uint64_t container_delete_all_container_content(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2000000000;
  v9 = 1;
  v2 = _os_activity_create(&dword_1CF7DA000, "container_delete_all_container_content", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  v5[0] = MEMORY[0x1E0C87450];
  v5[1] = 0x40000000;
  v5[2] = __container_delete_all_container_content_block_invoke;
  v5[3] = &unk_1E8CB3528;
  v5[4] = &v6;
  v5[5] = a1;
  os_activity_apply(v2, v5);
  os_release(v2);
  container_log_error((uint64_t)"container_delete_all_container_content", gClientFaultLoggingEnabled, v7[3]);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __container_delete_all_container_content_block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  const unsigned __int8 *uuid;
  _QWORD *identifier;
  uint64_t v5;
  const char *persona_unique_string;
  const char *v7;
  _DWORD *v8;
  uint64_t v9;
  int v10;
  void *v11;
  void *v12;
  int v13;

  v12 = 0;
  v2 = *(xpc_object_t *)(a1 + 40);
  if (!v2)
  {
    identifier = 0;
    goto LABEL_6;
  }
  uuid = (const unsigned __int8 *)container_object_get_uuid(*(_QWORD *)(a1 + 40));
  if (uuid_is_null(uuid))
    goto LABEL_3;
  identifier = (_QWORD *)container_object_get_identifier((uint64_t)v2);
  if (!identifier)
    goto LABEL_4;
  if ((unint64_t)container_object_get_class((uint64_t)v2) - 1 > 0xD)
  {
LABEL_3:
    identifier = 0;
LABEL_4:
    v2 = 0;
LABEL_6:
    v5 = 11;
    goto LABEL_7;
  }
  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "Command", 0xCuLL);
  if (container_object_get_persona_unique_string(*(_QWORD *)(a1 + 40)))
  {
    persona_unique_string = (const char *)container_object_get_persona_unique_string(*(_QWORD *)(a1 + 40));
    xpc_dictionary_set_string(v2, "PersonaUniqueString", persona_unique_string);
  }
  v7 = (const char *)container_object_get_identifier(*(_QWORD *)(a1 + 40));
  xpc_dictionary_set_string(v2, "Identifier", v7);
  v8 = container_object_get_class(*(_QWORD *)(a1 + 40));
  xpc_dictionary_set_uint64(v2, "ContainerClass", (uint64_t)v8);
  v9 = *(_QWORD *)(a1 + 40);
  v13 = 0;
  v10 = container_disposition(v9, &v13);
  v11 = (void *)container_xpc_send_sync_message(v10, 0, v2, 1, v13, 0, (uint64_t)&v12);
  identifier = v12;
  if (!v11)
  {
    if (v12)
      v5 = *(_QWORD *)v12;
    else
      v5 = 1;
LABEL_7:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
    container_error_free(identifier);
    if (!v2)
      return;
    goto LABEL_8;
  }
  container_error_free(v12);
  xpc_release(v11);
  if (v2)
LABEL_8:
    xpc_release(v2);
}

uint64_t container_copy_code_signing_info_for_identifier(uint64_t a1, uint64_t *a2)
{
  NSObject *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2000000000;
  v17 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2000000000;
  v13 = 1;
  v4 = _os_activity_create(&dword_1CF7DA000, "container_copy_code_signing_info_for_identifier", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C87450];
  block[1] = 0x40000000;
  block[2] = __container_copy_code_signing_info_for_identifier_block_invoke;
  block[3] = &unk_1E8CB3578;
  block[5] = &v14;
  block[6] = a1;
  block[4] = &v10;
  os_activity_apply(v4, block);
  os_release(v4);
  v5 = v11;
  v6 = v11[3];
  if (a2 && v6 != 1)
  {
    *a2 = v6;
    v6 = v5[3];
  }
  container_log_error((uint64_t)"container_copy_code_signing_info_for_identifier", gClientFaultLoggingEnabled, v6);
  v7 = v15[3];
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  return v7;
}

void __container_copy_code_signing_info_for_identifier_block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;

  v8 = 0;
  if (!*(_QWORD *)(a1 + 48))
  {
    v6 = 0;
    v2 = 0;
    v7 = 18;
    goto LABEL_12;
  }
  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "Command", 0x13uLL);
  xpc_dictionary_set_string(v2, "Identifier", *(const char **)(a1 + 48));
  v3 = (void *)container_xpc_send_sync_message(2, 0, v2, 1, 0, 0, (uint64_t)&v8);
  if (!v3)
  {
    v6 = v8;
    if (v8)
      v7 = *(_QWORD *)v8;
    else
      v7 = 1;
LABEL_12:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v7;
    container_error_free(v6);
    if (!v2)
      return;
    goto LABEL_13;
  }
  v4 = v3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = xpc_dictionary_get_value(v3, "ReplyInfoDictionary");
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v5)
    xpc_retain(v5);
  else
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 53;
  container_error_free(v8);
  xpc_release(v4);
  if (v2)
LABEL_13:
    xpc_release(v2);
}

uint64_t container_invalidate_code_signing_cache(uint64_t *a1)
{
  NSObject *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2000000000;
  v15 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2000000000;
  v11 = 1;
  v2 = _os_activity_create(&dword_1CF7DA000, "container_invalidate_code_signing_cache", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  v7[0] = MEMORY[0x1E0C87450];
  v7[1] = 0x40000000;
  v7[2] = __container_invalidate_code_signing_cache_block_invoke;
  v7[3] = &unk_1E8CB35A0;
  v7[4] = &v8;
  v7[5] = &v12;
  os_activity_apply(v2, v7);
  os_release(v2);
  v3 = v9;
  v4 = v9[3];
  if (a1 && v4 != 1)
  {
    *a1 = v4;
    v4 = v3[3];
  }
  container_log_error((uint64_t)"container_invalidate_code_signing_cache", gClientFaultLoggingEnabled, v4);
  v5 = *((unsigned __int8 *)v13 + 24);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v5;
}

void __container_invalidate_code_signing_cache_block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v7 = 0;
  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "Command", 0x14uLL);
  v3 = container_xpc_send_sync_message(2, 0, v2, 1, 0, 0, (uint64_t)&v7);
  if (v3)
  {
    v4 = (void *)v3;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    container_error_free(v7);
    xpc_release(v4);
    if (!v2)
      return;
    goto LABEL_3;
  }
  v5 = v7;
  if (v7)
    v6 = *(_QWORD *)v7;
  else
    v6 = 1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v6;
  container_error_free(v5);
  if (v2)
LABEL_3:
    xpc_release(v2);
}

void container_set_data_protection_for_current_user(uint64_t a1, uint64_t a2, int a3, char a4, char a5, uint64_t a6)
{
  NSObject *v12;
  _QWORD v13[7];
  int v14;
  char v15;
  char v16;

  v12 = _os_activity_create(&dword_1CF7DA000, "container_set_data_protection_for_current_user", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  v13[0] = MEMORY[0x1E0C87450];
  v13[1] = 0x40000000;
  v13[2] = __container_set_data_protection_for_current_user_block_invoke;
  v13[3] = &unk_1E8CB35F0;
  v13[5] = a2;
  v13[6] = a1;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v13[4] = a6;
  os_activity_apply(v12, v13);
  os_release(v12);
}

void __container_set_data_protection_for_current_user_block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  uint64_t v3;
  int v4;
  unint64_t v5;
  _QWORD v6[5];

  if (*(_QWORD *)(a1 + 40))
  {
    v2 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v2, "Command", 0x15uLL);
    xpc_dictionary_set_string(v2, "Identifier", *(const char **)(a1 + 40));
    xpc_dictionary_set_uint64(v2, "ContainerClass", *(_QWORD *)(a1 + 48));
    xpc_dictionary_set_int64(v2, "DataProtectionClass", *(int *)(a1 + 56));
    xpc_dictionary_set_BOOL(v2, "IsThirdParty", *(_BYTE *)(a1 + 60));
    xpc_dictionary_set_BOOL(v2, "RetryIfLocked", *(_BYTE *)(a1 + 61));
    v3 = *(_QWORD *)(a1 + 48);
    if ((v3 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
    {
      v4 = 1;
    }
    else
    {
      v5 = v3 - 1;
      if (v5 >= 0xE)
        v4 = 0;
      else
        v4 = dword_1CF7FFD6C[v5];
    }
    v6[0] = MEMORY[0x1E0C87450];
    v6[1] = 0x40000000;
    v6[2] = __container_set_data_protection_for_current_user_block_invoke_2;
    v6[3] = &unk_1E8CB35C8;
    v6[4] = *(_QWORD *)(a1 + 32);
    container_xpc_send_message(v4, (void *)3, v2, 0, 1, (uint64_t)v6);
    if (v2)
      xpc_release(v2);
  }
  else if (*(_QWORD *)(a1 + 32))
  {
    container_log_error((uint64_t)"container_set_data_protection_for_current_user", gClientFaultLoggingEnabled, 18);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

uint64_t __container_set_data_protection_for_current_user_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  container_log_ext_error((uint64_t)"container_set_data_protection_for_current_user", gClientFaultLoggingEnabled, a4);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t container_perform_data_migration(uint64_t *a1)
{
  NSObject *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2000000000;
  v15 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2000000000;
  v11 = 1;
  v2 = _os_activity_create(&dword_1CF7DA000, "container_perform_data_migration", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  v7[0] = MEMORY[0x1E0C87450];
  v7[1] = 0x40000000;
  v7[2] = __container_perform_data_migration_block_invoke;
  v7[3] = &unk_1E8CB3618;
  v7[4] = &v12;
  v7[5] = &v8;
  os_activity_apply(v2, v7);
  os_release(v2);
  v3 = v9;
  v4 = v9[3];
  if (a1 && v4 != 1)
  {
    *a1 = v4;
    v4 = v3[3];
  }
  container_log_error((uint64_t)"container_perform_data_migration", gClientFaultLoggingEnabled, v4);
  v5 = *((unsigned __int8 *)v13 + 24);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v5;
}

BOOL __container_perform_data_migration_block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = _common_perform_data_migration(0, (uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

BOOL _common_perform_data_migration(int a1, uint64_t *a2)
{
  xpc_object_t v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v11;

  v11 = 0;
  v4 = xpc_dictionary_create(0, 0, 0);
  v5 = v4;
  if (a1)
    v6 = 30;
  else
    v6 = 24;
  if (a1)
    v7 = 2;
  else
    v7 = 1;
  xpc_dictionary_set_uint64(v4, "Command", v6);
  v8 = (void *)container_xpc_send_sync_message(v7, 0, v5, 1, 0, 0, (uint64_t)&v11);
  if (!v8)
  {
    if (v11)
      v9 = *(_QWORD *)v11;
    else
      v9 = 1;
    container_error_free(v11);
    if (!v5)
      goto LABEL_10;
    goto LABEL_9;
  }
  container_error_free(v11);
  xpc_release(v8);
  v9 = 1;
  if (v5)
LABEL_9:
    xpc_release(v5);
LABEL_10:
  if (a2 && v9 != 1)
    *a2 = v9;
  return v9 != 0;
}

uint64_t container_perform_data_migration_for_current_user(uint64_t *a1)
{
  NSObject *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2000000000;
  v15 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2000000000;
  v11 = 1;
  v2 = _os_activity_create(&dword_1CF7DA000, "container_perform_data_migration_for_current_user", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  v7[0] = MEMORY[0x1E0C87450];
  v7[1] = 0x40000000;
  v7[2] = __container_perform_data_migration_for_current_user_block_invoke;
  v7[3] = &unk_1E8CB3640;
  v7[4] = &v12;
  v7[5] = &v8;
  os_activity_apply(v2, v7);
  os_release(v2);
  v3 = v9;
  v4 = v9[3];
  if (a1 && v4 != 1)
  {
    *a1 = v4;
    v4 = v3[3];
  }
  container_log_error((uint64_t)"container_perform_data_migration_for_current_user", gClientFaultLoggingEnabled, v4);
  v5 = *((unsigned __int8 *)v13 + 24);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v5;
}

BOOL __container_perform_data_migration_for_current_user_block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = _common_perform_data_migration(1, (uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t container_stage_shared_system_content(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  NSObject *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD block[9];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2000000000;
  v21 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2000000000;
  v17 = 1;
  v8 = _os_activity_create(&dword_1CF7DA000, "container_stage_shared_system_content", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C87450];
  block[1] = 0x40000000;
  block[2] = __container_stage_shared_system_content_block_invoke;
  block[3] = &unk_1E8CB3668;
  block[6] = a1;
  block[7] = a2;
  block[8] = a3;
  block[4] = &v14;
  block[5] = &v18;
  os_activity_apply(v8, block);
  os_release(v8);
  v9 = v15;
  v10 = v15[3];
  if (a4 && v10 != 1)
  {
    *a4 = v10;
    v10 = v9[3];
  }
  container_log_error((uint64_t)"container_stage_shared_system_content", gClientFaultLoggingEnabled, v10);
  v11 = v19[3];
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  return v11;
}

void __container_stage_shared_system_content_block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  void *v4;
  const char *string;
  uint64_t v6;
  void *v7;

  v7 = 0;
  if (*(_QWORD *)(a1 + 48) && *(_QWORD *)(a1 + 56) && *(_QWORD *)(a1 + 64))
  {
    v2 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v2, "Command", 0x1AuLL);
    xpc_dictionary_set_string(v2, "Identifier", *(const char **)(a1 + 48));
    xpc_dictionary_set_string(v2, "SourcePath", *(const char **)(a1 + 56));
    xpc_dictionary_set_string(v2, "DestPath", *(const char **)(a1 + 64));
    v3 = (void *)container_xpc_send_sync_message(1, 0, v2, 1, 0, 0, (uint64_t)&v7);
    v4 = v3;
    if (v3)
    {
      string = xpc_dictionary_get_string(v3, "ReplyPath");
      if (string)
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = strdup(string);
      else
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 53;
    }
    else
    {
      if (v7)
        v6 = *(_QWORD *)v7;
      else
        v6 = 1;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v6;
    }
    container_error_free(v7);
    if (v2)
      xpc_release(v2);
    if (v4)
      xpc_release(v4);
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 38;
  }
}

uint64_t container_user_managed_assets_path(uint64_t a1, uint64_t *a2)
{
  NSObject *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2000000000;
  v17 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2000000000;
  v13 = 1;
  v4 = _os_activity_create(&dword_1CF7DA000, "container_user_managed_assets_path", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C87450];
  block[1] = 0x40000000;
  block[2] = __container_user_managed_assets_path_block_invoke;
  block[3] = &unk_1E8CB3690;
  block[5] = &v10;
  block[6] = a1;
  block[4] = &v14;
  os_activity_apply(v4, block);
  os_release(v4);
  v5 = v11;
  v6 = v11[3];
  if (a2 && v6 != 1)
  {
    *a2 = v6;
    v6 = v5[3];
  }
  container_log_error((uint64_t)"container_user_managed_assets_path", gClientFaultLoggingEnabled, v6);
  v7 = v15[3];
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  return v7;
}

char *__container_user_managed_assets_path_block_invoke(uint64_t a1)
{
  char *result;

  result = _common_user_managed_assets_path(*(char **)(a1 + 48), 0, 1, 0, (uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t container_user_managed_assets_relative_path(uint64_t a1, uint64_t *a2)
{
  NSObject *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2000000000;
  v17 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2000000000;
  v13 = 1;
  v4 = _os_activity_create(&dword_1CF7DA000, "container_user_managed_assets_relative_path", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C87450];
  block[1] = 0x40000000;
  block[2] = __container_user_managed_assets_relative_path_block_invoke;
  block[3] = &unk_1E8CB36B8;
  block[5] = &v10;
  block[6] = a1;
  block[4] = &v14;
  os_activity_apply(v4, block);
  os_release(v4);
  v5 = v11;
  v6 = v11[3];
  if (a2 && v6 != 1)
  {
    *a2 = v6;
    v6 = v5[3];
  }
  container_log_error((uint64_t)"container_user_managed_assets_relative_path", gClientFaultLoggingEnabled, v6);
  v7 = v15[3];
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  return v7;
}

char *__container_user_managed_assets_relative_path_block_invoke(uint64_t a1)
{
  char *result;

  result = _common_user_managed_assets_path(*(char **)(a1 + 48), 1, 1, 0, (uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t container_create_or_lookup_user_managed_assets_relative_path(uint64_t a1, char a2, uint64_t a3, uint64_t *a4)
{
  NSObject *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD block[8];
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2000000000;
  v22 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2000000000;
  v18 = 1;
  v8 = _os_activity_create(&dword_1CF7DA000, "container_create_or_lookup_user_managed_assets_relative_path", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C87450];
  block[1] = 0x40000000;
  block[2] = __container_create_or_lookup_user_managed_assets_relative_path_block_invoke;
  block[3] = &unk_1E8CB3708;
  v14 = a2;
  block[6] = a1;
  block[7] = a3;
  block[4] = &v19;
  block[5] = &v15;
  os_activity_apply(v8, block);
  os_release(v8);
  v9 = v16;
  v10 = v16[3];
  if (a4 && v10 != 1)
  {
    *a4 = v10;
    v10 = v9[3];
  }
  container_log_error((uint64_t)"container_create_or_lookup_user_managed_assets_relative_path", gClientFaultLoggingEnabled, v10);
  v11 = v20[3];
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  return v11;
}

char *__container_create_or_lookup_user_managed_assets_relative_path_block_invoke(uint64_t a1)
{
  char *result;

  result = _common_user_managed_assets_path(*(char **)(a1 + 48), 1, *(unsigned __int8 *)(a1 + 64), *(BOOL **)(a1 + 56), (uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t container_delete_user_managed_assets(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  uint64_t v7;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2000000000;
  v13 = 1;
  v6 = _os_activity_create(&dword_1CF7DA000, "container_delete_user_managed_assets", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  v9[0] = MEMORY[0x1E0C87450];
  v9[1] = 0x40000000;
  v9[2] = __container_delete_user_managed_assets_block_invoke;
  v9[3] = &unk_1E8CB3730;
  v9[6] = a1;
  v9[7] = a2;
  v9[4] = a3;
  v9[5] = &v10;
  os_activity_apply(v6, v9);
  os_release(v6);
  container_log_error((uint64_t)"container_delete_user_managed_assets", gClientFaultLoggingEnabled, v11[3]);
  v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

void __container_delete_user_managed_assets_block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v8 = 0;
  if (*(_QWORD *)(a1 + 48))
  {
    v2 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v2, "Command", 0x1DuLL);
    xpc_dictionary_set_string(v2, "Identifier", *(const char **)(a1 + 48));
    xpc_dictionary_set_string(v2, "SourcePath", *(const char **)(a1 + 56));
    v3 = container_xpc_send_sync_message(2, 0, v2, 1, 0, 0, (uint64_t)&v8);
    if (v3)
    {
      v4 = (void *)v3;
      _container_async_reclaim_disk_space(*(_QWORD *)(a1 + 32));
      v5 = v8;
    }
    else
    {
      v5 = v8;
      if (v8)
        v6 = *(_QWORD *)v8;
      else
        v6 = 1;
      v4 = 0;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6;
    }
  }
  else
  {
    v5 = 0;
    v4 = 0;
    v2 = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 18;
  }
  container_error_free(v5);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 1)
  {
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
      (*(void (**)(void))(v7 + 16))();
  }
  if (v4)
    xpc_release(v4);
  if (v2)
    xpc_release(v2);
}

uint64_t container_subdirectories_for_class(uint64_t a1, uint64_t *a2)
{
  NSObject *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2000000000;
  v17 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2000000000;
  v13 = 1;
  v4 = _os_activity_create(&dword_1CF7DA000, "container_subdirectories_for_class", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C87450];
  block[1] = 0x40000000;
  block[2] = __container_subdirectories_for_class_block_invoke;
  block[3] = &unk_1E8CB3758;
  block[5] = &v14;
  block[6] = a1;
  block[4] = &v10;
  os_activity_apply(v4, block);
  os_release(v4);
  v5 = v11;
  v6 = v11[3];
  if (a2 && v6 != 1)
  {
    *a2 = v6;
    v6 = v5[3];
  }
  container_log_error((uint64_t)"container_subdirectories_for_class", gClientFaultLoggingEnabled, v6);
  v7 = v15[3];
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  return v7;
}

void __container_subdirectories_for_class_block_invoke(_QWORD *a1)
{
  unint64_t v2;
  void *v3;
  const char *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;

  if ((unint64_t)(a1[6] - 1) >= 0xE)
  {
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = 20;
    return;
  }
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = xpc_array_create(0, 0);
  v2 = a1[6];
  if (v2 > 0xE)
    goto LABEL_13;
  if (((1 << v2) & 0x1E54) == 0)
  {
    if (((1 << v2) & 0x412A) != 0)
      return;
    if (((1 << v2) & 0x2080) != 0)
    {
      xpc_array_set_string(*(xpc_object_t *)(*(_QWORD *)(a1[5] + 8) + 24), 0xFFFFFFFFFFFFFFFFLL, "Library");
      v3 = *(void **)(*(_QWORD *)(a1[5] + 8) + 24);
      v4 = "Library/Caches";
LABEL_12:
      xpc_array_set_string(v3, 0xFFFFFFFFFFFFFFFFLL, v4);
      return;
    }
LABEL_13:
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = 70;
    v6 = *(_QWORD *)(a1[5] + 8);
    v7 = *(void **)(v6 + 24);
    if (v7)
    {
      xpc_release(v7);
      v6 = *(_QWORD *)(a1[5] + 8);
    }
    *(_QWORD *)(v6 + 24) = 0;
    return;
  }
  xpc_array_set_string(*(xpc_object_t *)(*(_QWORD *)(a1[5] + 8) + 24), 0xFFFFFFFFFFFFFFFFLL, "Documents");
  xpc_array_set_string(*(xpc_object_t *)(*(_QWORD *)(a1[5] + 8) + 24), 0xFFFFFFFFFFFFFFFFLL, "Library");
  xpc_array_set_string(*(xpc_object_t *)(*(_QWORD *)(a1[5] + 8) + 24), 0xFFFFFFFFFFFFFFFFLL, "Library/Caches");
  xpc_array_set_string(*(xpc_object_t *)(*(_QWORD *)(a1[5] + 8) + 24), 0xFFFFFFFFFFFFFFFFLL, "Library/Preferences");
  xpc_array_set_string(*(xpc_object_t *)(*(_QWORD *)(a1[5] + 8) + 24), 0xFFFFFFFFFFFFFFFFLL, "tmp");
  v5 = a1[6];
  if (v5 <= 0xB && ((1 << v5) & 0xED4) != 0)
  {
    v3 = *(void **)(*(_QWORD *)(a1[5] + 8) + 24);
    v4 = "SystemData";
    goto LABEL_12;
  }
}

uint64_t container_copy_persona_unique_strings(uint64_t *a1)
{
  NSObject *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2000000000;
  v15 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2000000000;
  v11 = 1;
  v2 = _os_activity_create(&dword_1CF7DA000, "container_copy_persona_unique_strings", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  v7[0] = MEMORY[0x1E0C87450];
  v7[1] = 0x40000000;
  v7[2] = __container_copy_persona_unique_strings_block_invoke;
  v7[3] = &unk_1E8CB3780;
  v7[4] = &v8;
  v7[5] = &v12;
  os_activity_apply(v2, v7);
  os_release(v2);
  v3 = v9;
  v4 = v9[3];
  if (a1 && v4 != 1)
  {
    *a1 = v4;
    v4 = v3[3];
  }
  container_log_error((uint64_t)"container_copy_persona_unique_strings", gClientFaultLoggingEnabled, v4);
  v5 = v13[3];
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v5;
}

void __container_copy_persona_unique_strings_block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;

  v9 = 0;
  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "Command", 0x20uLL);
  v3 = (void *)container_xpc_send_sync_message(2, 0, v2, 1, 0, 0, (uint64_t)&v9);
  if (v3)
  {
    v4 = v3;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = xpc_dictionary_get_value(v3, "ReplyPersonaUniqueStringsArray");
    v5 = MEMORY[0x1D17D6434](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (v5 == MEMORY[0x1E0C88FC0])
    {
      xpc_retain(*(xpc_object_t *)(v6 + 24));
    }
    else
    {
      *(_QWORD *)(v6 + 24) = 0;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 53;
    }
    container_error_free(v9);
    xpc_release(v4);
    if (v2)
LABEL_8:
      xpc_release(v2);
  }
  else
  {
    v7 = v9;
    if (v9)
      v8 = *(_QWORD *)v9;
    else
      v8 = 1;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v8;
    container_error_free(v7);
    if (v2)
      goto LABEL_8;
  }
}

uint64_t container_flush_container_cache(uint64_t a1, char a2)
{
  NSObject *v4;
  uint64_t v5;
  _QWORD block[6];
  char v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2000000000;
  v12 = 1;
  v4 = _os_activity_create(&dword_1CF7DA000, "container_flush_container_cache", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C87450];
  block[1] = 0x40000000;
  block[2] = __container_flush_container_cache_block_invoke;
  block[3] = &unk_1E8CB37A8;
  v8 = a2;
  block[4] = &v9;
  block[5] = a1;
  os_activity_apply(v4, block);
  os_release(v4);
  container_log_error((uint64_t)"container_flush_container_cache", gClientFaultLoggingEnabled, v10[3]);
  v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

void __container_flush_container_cache_block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  uint64_t v3;
  int v4;
  unint64_t v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;

  v9 = 0;
  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "Command", 0x21uLL);
  xpc_dictionary_set_uint64(v2, "ContainerClass", *(_QWORD *)(a1 + 40));
  xpc_dictionary_set_BOOL(v2, "Transient", *(_BYTE *)(a1 + 48));
  v3 = *(_QWORD *)(a1 + 40);
  if ((v3 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
  {
    v4 = 1;
  }
  else
  {
    v5 = v3 - 1;
    if (v5 > 0xD)
      v4 = 0;
    else
      v4 = dword_1CF7FFD6C[v5];
  }
  v6 = (void *)container_xpc_send_sync_message(v4, 0, v2, 1, 0, 0, (uint64_t)&v9);
  v7 = v9;
  if (v6)
  {
    container_error_free(v9);
    xpc_release(v6);
    if (!v2)
      return;
    goto LABEL_8;
  }
  if (v9)
    v8 = *(_QWORD *)v9;
  else
    v8 = 1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v8;
  container_error_free(v7);
  if (v2)
LABEL_8:
    xpc_release(v2);
}

uint64_t container_flush_persona_cache()
{
  NSObject *v0;
  uint64_t v1;
  _QWORD block[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2000000000;
  v7 = 1;
  v0 = _os_activity_create(&dword_1CF7DA000, "container_flush_persona_cache", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C87450];
  block[1] = 0x40000000;
  block[2] = __container_flush_persona_cache_block_invoke;
  block[3] = &unk_1E8CB37D0;
  block[4] = &v4;
  os_activity_apply(v0, block);
  os_release(v0);
  container_log_error((uint64_t)"container_flush_persona_cache", gClientFaultLoggingEnabled, v5[3]);
  v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

void __container_flush_persona_cache_block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v6 = 0;
  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "Command", 0x22uLL);
  v3 = (void *)container_xpc_send_sync_message(2, 0, v2, 1, 0, 0, (uint64_t)&v6);
  v4 = v6;
  if (v3)
  {
    container_error_free(v6);
    xpc_release(v3);
    if (!v2)
      return;
    goto LABEL_3;
  }
  if (v6)
    v5 = *(_QWORD *)v6;
  else
    v5 = 1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
  container_error_free(v4);
  if (v2)
LABEL_3:
    xpc_release(v2);
}

void container_perform_with_client_context(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  _QWORD v5[6];

  v4 = _os_activity_create(&dword_1CF7DA000, "container_perform_with_client_context", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  v5[0] = MEMORY[0x1E0C87450];
  v5[1] = 0x40000000;
  v5[2] = __container_perform_with_client_context_block_invoke;
  v5[3] = &unk_1E8CB37F8;
  v5[4] = a2;
  v5[5] = a1;
  os_activity_apply(v4, v5);
  os_release(v4);
}

uint64_t __container_perform_with_client_context_block_invoke(uint64_t a1)
{
  return container_xpc_set_client_context_during_block(*(void **)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t container_copy_from_path(char *a1, char **a2, uint64_t *a3)
{
  uint64_t *v4;
  void **v5;
  int v8;
  unsigned __int8 *v9;
  uint64_t v10;
  _DWORD *v11;
  int v12;
  BOOL v13;
  BOOL v14;
  NSObject *v15;
  uint64_t *v16;
  uint64_t v17;
  _QWORD block[8];
  uint64_t v20;
  void **v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v4 = &v24;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2000000000;
  v27 = 0;
  v5 = (void **)&v20;
  v20 = 0;
  v21 = (void **)&v20;
  v22 = 0x2000000000;
  v23 = 0;
  if (a1)
  {
    getpid();
    v8 = sandbox_check();
    if (v8)
    {
      v4 = v25;
      v9 = (unsigned __int8 *)v25[3];
    }
    else
    {
      v9 = container_paths_copy_container_from_path(a1, a2, v21 + 3);
      v4 = v25;
      v25[3] = (uint64_t)v9;
    }
    v5 = v21;
    if (!v9
      && ((v11 = v21[3]) == 0 ? (v12 = 0) : (v12 = v11[6]),
          !v8 ? (v13 = v12 == 13) : (v13 = 1),
          !v13 ? (v14 = v12 == 1) : (v14 = 1),
          v14))
    {
      container_error_free(v11);
      v21[3] = 0;
      v15 = _os_activity_create(&dword_1CF7DA000, "container_copy_from_path", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
      block[0] = MEMORY[0x1E0C87450];
      block[1] = 0x40000000;
      block[2] = __container_copy_from_path_block_invoke;
      block[3] = &unk_1E8CB3820;
      block[4] = &v20;
      block[5] = &v24;
      block[6] = a1;
      block[7] = a2;
      os_activity_apply(v15, block);
      os_release(v15);
      v4 = v25;
      v10 = 1;
      v5 = v21;
      if (!a3)
        goto LABEL_26;
    }
    else
    {
      v10 = 1;
      if (!a3)
        goto LABEL_26;
    }
  }
  else
  {
    v10 = 38;
    if (!a3)
      goto LABEL_26;
  }
  if (!v4[3])
  {
    v16 = (uint64_t *)v5[3];
    if (v16)
      v10 = *v16;
    *a3 = v10;
  }
LABEL_26:
  container_error_free(v5[3]);
  v17 = v25[3];
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  return v17;
}

void __container_copy_from_path_block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  void *v4;
  const char *string;
  char **v6;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "Command", 0x2CuLL);
  xpc_dictionary_set_string(v2, "Path", *(const char **)(a1 + 48));
  v3 = (void *)container_xpc_send_sync_message(3, 0, v2, 1, 0, 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v4 = v3;
  if (v3)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = container_xpc_decode_container_object(v3, 0);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      string = xpc_dictionary_get_string(v4, "ReplyRelativePath");
      if (string)
      {
        v6 = *(char ***)(a1 + 56);
        if (v6)
          *v6 = strndup(string, 0x400uLL);
      }
    }
  }
  if (v2)
    xpc_release(v2);
  if (v4)
    xpc_release(v4);
}

uint64_t container_acquire_sandbox_extension(uint64_t a1, char a2, uint64_t *a3)
{
  NSObject *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[7];
  char v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2000000000;
  v20 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2000000000;
  v16 = 1;
  v6 = _os_activity_create(&dword_1CF7DA000, "container_acquire_sandbox_extension", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  v11[0] = MEMORY[0x1E0C87450];
  v11[1] = 0x40000000;
  v11[2] = __container_acquire_sandbox_extension_block_invoke;
  v11[3] = &unk_1E8CB3848;
  v11[5] = &v17;
  v11[6] = a1;
  v12 = a2;
  v11[4] = &v13;
  os_activity_apply(v6, v11);
  os_release(v6);
  v7 = v14;
  v8 = v14[3];
  if (a3 && v8 != 1)
  {
    *a3 = v8;
    v8 = v7[3];
  }
  container_log_error((uint64_t)"container_acquire_sandbox_extension", gClientFaultLoggingEnabled, v8);
  v9 = *((unsigned __int8 *)v18 + 24);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  return v9;
}

void __container_acquire_sandbox_extension_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const unsigned __int8 *uuid;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *string;
  xpc_object_t v8;
  xpc_object_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  int v17;

  v16 = 0;
  v2 = *(_QWORD *)(a1 + 48);
  if (!v2
    || (uuid = (const unsigned __int8 *)container_object_get_uuid(*(_QWORD *)(a1 + 48)), uuid_is_null(uuid))
    || !container_object_get_identifier(v2)
    || (unint64_t)container_object_get_class(v2) - 1 >= 0xE)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 11;
    return;
  }
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(v4 + 88);
  if (!v5 || (v6 = *(void **)(v5 + 128)) == 0)
  {
    string = *(const char **)(v4 + 48);
    if (!string)
      goto LABEL_10;
LABEL_14:
    container_object_sandbox_extension_activate(*(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    return;
  }
  string = xpc_array_get_string(v6, *(unsigned int *)(v4 + 96));
  if (string)
    goto LABEL_14;
LABEL_10:
  v8 = xpc_dictionary_create((const char *const *)string, 0, 0);
  container_xpc_encode_container_object(v8, *(_QWORD *)(a1 + 48), 0);
  v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v9, "Command", 0x23uLL);
  xpc_dictionary_set_value(v9, "Container", v8);
  v10 = *(_QWORD *)(a1 + 48);
  v17 = 0;
  v11 = container_disposition(v10, &v17);
  v12 = (void *)container_xpc_send_sync_message(v11, 0, v9, 1, v17, 0, (uint64_t)&v16);
  v13 = v12;
  if (v12)
  {
    v14 = xpc_dictionary_get_string(v12, "ReplySandboxToken");
    if (v14)
    {
      container_object_set_sandbox_token(*(_QWORD **)(a1 + 48), v14);
      container_object_sandbox_extension_activate(*(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  else
  {
    if (v16)
      v15 = *(_QWORD *)v16;
    else
      v15 = 1;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v15;
  }
  container_error_free(v16);
  if (v8)
    xpc_release(v8);
  if (v9)
    xpc_release(v9);
  if (v13)
    xpc_release(v13);
}

uint64_t container_repair_user_data(uint64_t a1, uint64_t *a2)
{
  NSObject *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2000000000;
  v17 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2000000000;
  v13 = 1;
  v4 = _os_activity_create(&dword_1CF7DA000, "container_repair_user_data", MEMORY[0x1E0C88E88], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E0C87450];
  block[1] = 0x40000000;
  block[2] = __container_repair_user_data_block_invoke;
  block[3] = &unk_1E8CB38D8;
  block[5] = &v14;
  block[6] = a1;
  block[4] = &v10;
  os_activity_apply(v4, block);
  os_release(v4);
  v5 = v11;
  v6 = v11[3];
  if (a2 && v6 != 1)
  {
    *a2 = v6;
    v6 = v5[3];
  }
  container_log_error((uint64_t)"container_repair_user_data", gClientFaultLoggingEnabled, v6);
  v7 = *((unsigned __int8 *)v15 + 24);
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  return v7;
}

void __container_repair_user_data_block_invoke(_QWORD *a1)
{
  xpc_object_t v2;
  const char *v3;
  uid_t v4;
  char *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  char *v14;
  char *__s;
  uint8_t buf[4];
  char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C874D8];
  v13 = 0;
  v14 = 0;
  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "Command", 0x25uLL);
  v3 = (const char *)a1[6];
  if (v3)
    xpc_dictionary_set_string(v2, "Path", v3);
  v4 = geteuid();
  v5 = container_pwd_copy_user_home_path(v4, 1, 1, (uint64_t *)(*(_QWORD *)(a1[4] + 8) + 24));
  __s = v5;
  if (v5)
  {
    v6 = v5;
    v7 = (char *)container_sandbox_issue_custom_extension((uint64_t)"com.apple.containermanagerd.home-repair", 0, (uint64_t)v5);
    v14 = v7;
    if (v7)
    {
      xpc_dictionary_set_string(v2, "SandboxToken", v7);
      v8 = container_xpc_send_sync_message(1, 0, v2, 1, 0, 0, (uint64_t)&v13);
      if (v8)
      {
        v9 = (void *)v8;
        *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
        v10 = v13;
      }
      else
      {
        v10 = v13;
        if (v13)
          v12 = *(_QWORD *)v13;
        else
          v12 = 1;
        v9 = 0;
        *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v12;
      }
    }
    else
    {
      if (container_log_handle_for_category_onceToken != -1)
        dispatch_once(&container_log_handle_for_category_onceToken, &__block_literal_global_483);
      v11 = qword_1ECD3F348;
      if (os_log_type_enabled((os_log_t)qword_1ECD3F348, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136380675;
        v17 = v6;
        _os_log_error_impl(&dword_1CF7DA000, v11, OS_LOG_TYPE_ERROR, "Failed to issue sandbox extension to [%{private}s] for containermanagerd", buf, 0xCu);
      }
      v10 = 0;
      v9 = 0;
      *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = 90;
    }
    container_error_free(v10);
    free(v6);
    memset_s(&__s, 8uLL, 0, 8uLL);
    if (v7)
    {
      free(v7);
      memset_s(&v14, 8uLL, 0, 8uLL);
    }
  }
  else
  {
    container_error_free(0);
    v9 = 0;
  }
  if (v2)
    xpc_release(v2);
  if (v9)
    xpc_release(v9);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C87428](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C87438](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C87440](aBlock);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C87488](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C87D88]();
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x1E0C87500]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C87508]();
}

uint64_t __xpc_connection_set_logging()
{
  return MEMORY[0x1E0C88F80]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1E0C88E80](dso, description, activity, *(_QWORD *)&flags);
}

uint64_t _os_crash()
{
  return MEMORY[0x1E0C87548]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x1E0C87550]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C87CB0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C88E90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C88EA8](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C88EB0](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C88EB8](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1E0C88EC0]();
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C88ED0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C87608]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1E0C87620](a1, a2);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C87668](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C88018](*(_QWORD *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1E0C87680](a1);
}

uint64_t csops_audittoken()
{
  return MEMORY[0x1E0C88040]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C86F78](when, queue, block);
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
  MEMORY[0x1E0C86F80](iterations, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C86F98](queue, block);
}

void dispatch_barrier_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C86FB0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C87028](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C87100](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C87128](label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C87208](when, delta);
}

int dup(int a1)
{
  return MEMORY[0x1E0C88050](*(_QWORD *)&a1);
}

uint64_t dyld_get_active_platform()
{
  return MEMORY[0x1E0C87360]();
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1E0C87388]();
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1E0C88088](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C88090](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

DIR *__cdecl fdopendir(int a1)
{
  return (DIR *)MEMORY[0x1E0C876D0](*(_QWORD *)&a1);
}

int fls(int a1)
{
  return MEMORY[0x1E0C88BB0](*(_QWORD *)&a1);
}

int flsl(uint64_t a1)
{
  return MEMORY[0x1E0C88BB8](a1);
}

void free(void *a1)
{
  MEMORY[0x1E0C88920](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C88108](*(_QWORD *)&a1, a2);
}

int fstatat(int a1, const char *a2, stat *a3, int a4)
{
  return MEMORY[0x1E0C88110](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int fsync(int a1)
{
  return MEMORY[0x1E0C88120](*(_QWORD *)&a1);
}

gid_t getegid(void)
{
  return MEMORY[0x1E0C88150]();
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C88160]();
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C88190]();
}

int getpwnam_r(const char *a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x1E0C87CF8](a1, a2, a3, a4, a5);
}

int getpwuid_r(uid_t a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x1E0C87D08](*(_QWORD *)&a1, a2, a3, a4, a5);
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C881C0]();
}

kern_return_t host_get_multiuser_config_flags(host_t host, uint32_t *multiuser_flags)
{
  return MEMORY[0x1E0C881F8](*(_QWORD *)&host, multiuser_flags);
}

uint64_t kpersona_find()
{
  return MEMORY[0x1E0C88260]();
}

uint64_t kpersona_find_by_type()
{
  return MEMORY[0x1E0C88268]();
}

uint64_t kpersona_getpath()
{
  return MEMORY[0x1E0C88278]();
}

uint64_t kpersona_info()
{
  return MEMORY[0x1E0C88280]();
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1E0C882A0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C882A8](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C882B0]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1E0C882D8](*(_QWORD *)&error_value);
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1E0C88328]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C88970](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C88978](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C87830](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C87840](__b, *(_QWORD *)&__c, __len);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1E0C87848](__s, __smax, *(_QWORD *)&__c, __n);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C88A10](name, out_token, queue, handler);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C88528](a1, *(_QWORD *)&a2);
}

int openat(int a1, const char *a2, int a3, ...)
{
  return MEMORY[0x1E0C88540](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void os_activity_apply(os_activity_t activity, os_block_t block)
{
  MEMORY[0x1E0C88EE0](activity, block);
}

uint64_t os_log_copy_decorated_message()
{
  return MEMORY[0x1E0C88EF0]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C88EF8](subsystem, category);
}

uint64_t os_log_set_hook()
{
  return MEMORY[0x1E0C88F08]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C88F18](oslog, type);
}

uint64_t os_map_str_clear()
{
  return MEMORY[0x1E0C87B80]();
}

uint64_t os_map_str_count()
{
  return MEMORY[0x1E0C87B88]();
}

uint64_t os_map_str_delete()
{
  return MEMORY[0x1E0C87B90]();
}

uint64_t os_map_str_destroy()
{
  return MEMORY[0x1E0C87B98]();
}

uint64_t os_map_str_entry()
{
  return MEMORY[0x1E0C87BA0]();
}

uint64_t os_map_str_find()
{
  return MEMORY[0x1E0C87BA8]();
}

uint64_t os_map_str_foreach()
{
  return MEMORY[0x1E0C87BB0]();
}

uint64_t os_map_str_init()
{
  return MEMORY[0x1E0C87BB8]();
}

uint64_t os_map_str_insert()
{
  return MEMORY[0x1E0C87BC0]();
}

void os_release(void *object)
{
  MEMORY[0x1E0C87210](object);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C88F28](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1E0C88F30](log, ptr);
}

uint64_t os_trace_get_mode()
{
  return MEMORY[0x1E0C88F38]();
}

uint64_t os_trace_set_mode()
{
  return MEMORY[0x1E0C88F40]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C88BD0](lock);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1E0C88BE0]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C88BF0](lock);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C87C58]();
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1E0C885F0](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x1E0C88608](*(_QWORD *)&pid, *(_QWORD *)&flavor, arg, buffer, *(_QWORD *)&buffersize);
}

int proc_pidpath_audittoken(audit_token_t *audittoken, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C88610](audittoken, buffer, *(_QWORD *)&buffersize);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1E0C88D28](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1E0C88D40](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1E0C88DC8](a1, a2);
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
  MEMORY[0x1E0C878B0](__base, __nel, __width, __compar);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1E0C878C0](a1);
}

char *__cdecl rindex(const char *a1, int a2)
{
  return (char *)MEMORY[0x1E0C87908](a1, *(_QWORD *)&a2);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1E0C88E18]();
}

uint64_t sandbox_check_by_audit_token()
{
  return MEMORY[0x1E0C88E20]();
}

uint64_t sandbox_container_path_for_pid()
{
  return MEMORY[0x1E0C88E28]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1E0C88E30]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1E0C88E38]();
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return MEMORY[0x1E0C88E40]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1E0C88E48]();
}

uint64_t sandbox_get_container_expected()
{
  return MEMORY[0x1E0C88E50]();
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return MEMORY[0x1E0C87918](__name, __value, *(_QWORD *)&__overwrite);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C87990](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C879A8](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C879B0](*(_QWORD *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C879D0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C879D8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C879E8](__s1, __s2, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1E0C879F8](__s1, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1E0C87A00](__s1, __n);
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x1E0C87A88](*(_QWORD *)&a1);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C87A98](a1, a2, a3, a4, a5);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1E0C88778](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

kern_return_t task_name_for_pid(mach_port_name_t target_tport, int pid, mach_port_name_t *tn)
{
  return MEMORY[0x1E0C88788](*(_QWORD *)&target_tport, *(_QWORD *)&pid, tn);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x1E0C87AE8](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
  MEMORY[0x1E0C87AF0](dst, src);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1E0C87B00](uu);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1E0C87B08](in, uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x1E0C87B10](uu, out);
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x1E0C87B18](uu, out);
}

uint64_t voucher_get_current_persona()
{
  return MEMORY[0x1E0C87288]();
}

uint64_t voucher_get_current_persona_originator_info()
{
  return MEMORY[0x1E0C87290]();
}

uint64_t voucher_get_current_persona_proximate_info()
{
  return MEMORY[0x1E0C87298]();
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C888E0](*(_QWORD *)&__fd, __buf, __nbyte);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x1E0C89058](xarray, value);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1E0C89060](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C89068](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C89070](xarray);
}

xpc_object_t xpc_array_get_dictionary(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1E0C89080](xarray, index);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x1E0C89088](xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1E0C89090](xarray, index);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
  MEMORY[0x1E0C890A0](xarray, index, string);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1E0C890A8](xBOOL);
}

uint64_t xpc_bundle_create()
{
  return MEMORY[0x1E0C890B0]();
}

uint64_t xpc_bundle_get_error()
{
  return MEMORY[0x1E0C890C0]();
}

uint64_t xpc_bundle_get_property()
{
  return MEMORY[0x1E0C890D0]();
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C890D8](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C890E0](name, targetq, flags);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1E0C890E8](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C890F0](connection);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x1E0C89108](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C89110](connection, message);
}

void xpc_connection_set_context(xpc_connection_t connection, void *context)
{
  MEMORY[0x1E0C89118](connection, context);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C89120](connection, handler);
}

uint64_t xpc_connection_set_target_user_session_uid()
{
  return MEMORY[0x1E0C89138]();
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1E0C89148](object);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x1E0C89150]();
}

uint64_t xpc_create_from_plist()
{
  return MEMORY[0x1E0C89158]();
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1E0C89160](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1E0C89178](xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C891A0](keys, values, count);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C891B8](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C891C0](xdict, key);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x1E0C891C8](xdict);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1E0C891D0](xdict, key, length);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C891D8](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C891E0](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C891E8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C891F0](xdict, key);
}

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  return (const uint8_t *)MEMORY[0x1E0C891F8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C89200](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C89208](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C89220](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C89230](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C89238](xdict, key, value);
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
  MEMORY[0x1E0C89240](xdict, key, uuid);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C89248](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C89270](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x1E0C89278](value);
}

uint64_t xpc_is_system_session()
{
  return MEMORY[0x1E0C89288]();
}

uint64_t xpc_pipe_create()
{
  return MEMORY[0x1E0C89298]();
}

uint64_t xpc_pipe_routine()
{
  return MEMORY[0x1E0C892B0]();
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x1E0C892C0](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1E0C892C8](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1E0C892D8](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1E0C892E8](xstring);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return (xpc_object_t)MEMORY[0x1E0C892F0](value);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1E0C892F8](xuint);
}

