uint64_t _boot_ephemeral_enforceable(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t result;
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
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t name;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v4 = *(_QWORD *)(a2 + 16);
  result = odometer_policy_get_chip_property(a1, v4);
  if (!result)
  {
    v25 = *(_QWORD *)a2;
    name = chip_get_name(*(_QWORD *)(a2 + 16));
    v24 = 1;
    expert_log(v25, 1uLL, (uint64_t)"odometer[%s:%s]: chip has no property for policy", v27, v28, v29, v30, v31, name);
    return v24;
  }
  if (*(_QWORD *)(v4 + 208))
  {
    if (manifest_get_restore_info(*(_QWORD *)(a2 + 8), v6, v7, v8, v9, v10, v11, v12))
    {
      v17 = *(_QWORD *)a2;
      v42 = chip_get_name(*(_QWORD *)(a2 + 16));
      v23 = "odometer[%s:%s]: boot object has restore info";
    }
    else if (*(_WORD *)(a2 + 960))
    {
      if (*(_WORD *)(a2 + 864))
      {
        v32 = odometer_enforce_property((uint64_t *)a2, a1, *(_QWORD *)(v4 + 208), (unsigned __int8 *)(a2 + 760), v13, v14, v15, v16);
        v17 = *(_QWORD *)a2;
        v33 = chip_get_name(*(_QWORD *)(a2 + 16));
        if (!v32)
        {
          expert_log(v17, 1uLL, (uint64_t)"odometer[%s:%s]: policy is enforceable", v18, v19, v20, v21, v22, v33);
          return 0;
        }
        v42 = v33;
        v23 = "odometer[%s:%s]: switch constraint not satisfied";
      }
      else
      {
        v17 = *(_QWORD *)a2;
        v42 = chip_get_name(*(_QWORD *)(a2 + 16));
        v23 = "odometer[%s:%s]: no manifest constraint for policy selection";
      }
    }
    else
    {
      v17 = *(_QWORD *)a2;
      v42 = chip_get_name(*(_QWORD *)(a2 + 16));
      v23 = "odometer[%s:%s]: manifest has no constraint for policy";
    }
    v24 = 1;
    expert_log(v17, 1uLL, (uint64_t)v23, v18, v19, v20, v21, v22, v42);
    return v24;
  }
  if (v4 < v4 + 264)
  {
    v34 = chip_get_name(v4);
    __panic_npx("panic: illegal chip configuration: %s", v35, v36, v37, v38, v39, v40, v41, v34);
  }
  __break(0x5519u);
  return result;
}

uint64_t _boot_ephemeral_enforce(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t chip_property;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t live_nonce;
  uint64_t v17;
  uint64_t v18;
  uint64_t name;
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
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
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
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  _OWORD v60[5];
  _QWORD v61[3];
  _QWORD v62[4];

  v62[3] = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)a2;
  chip_property = odometer_policy_get_chip_property(a1, *(_QWORD *)(a2 + 16));
  if (!*(_WORD *)(a2 + 960))
    __panic_npx("panic: optional not set", v6, v7, v8, v9, v10, v11, v12, v59);
  v13 = chip_property;
  v14 = *(_QWORD **)(a2 + 16);
  v15 = *(unsigned int *)(a2 + 872);
  memset(v62, 0, 24);
  memset(v61, 0, sizeof(v61));
  memset(v60, 0, sizeof(v60));
  live_nonce = odometer_query_live_nonce(a2, a1, v15, v62, v9, v10, v11, v12);
  if ((_DWORD)live_nonce)
  {
    v17 = live_nonce;
    v18 = *(_QWORD *)a2;
    name = chip_get_name(*(_QWORD *)(a2 + 16));
    expert_log(v18, 0, (uint64_t)"odometer[%s:%s]: failed to query nonce: %d", v20, v21, v22, v23, v24, name);
  }
  else
  {
    v32 = expert_entangle_nonce(v4, (uint64_t)v14, v15, (uint64_t)v62, (uint64_t)v61);
    if ((_DWORD)v32)
    {
      v17 = v32;
      v33 = *(_QWORD *)a2;
      v34 = chip_get_name(*(_QWORD *)(a2 + 16));
      expert_log(v33, 0, (uint64_t)"odometer[%s:%s]: failed to entangle nonce: %d", v35, v36, v37, v38, v39, v34);
    }
    else
    {
      odometer_compute_nonce_hash(v4, v14, (uint64_t)v61, (uint64_t)v60);
      if (!property_constrain_digest(v13, v4, a2 + 880, (unint64_t)v60, v40, v41, v42, v43))
      {
        v52 = *(_QWORD *)a2;
        v53 = chip_get_name(*(_QWORD *)(a2 + 16));
        expert_log(v52, 1uLL, (uint64_t)"odometer[%s:%s]: manifest is current", v54, v55, v56, v57, v58, v53);
        return 0;
      }
      v17 = *(unsigned int *)(a1 + 24);
      v44 = *(_QWORD *)a2;
      v45 = chip_get_name(*(_QWORD *)(a2 + 16));
      expert_log(v44, 0, (uint64_t)"odometer[%s:%s]: anti-replay violation: %d", v46, v47, v48, v49, v50, v45);
    }
  }
  if (v17 >= 0x6A)
    __panic_npx("panic: error not set to valid posix code: %d", v25, v26, v27, v28, v29, v30, v31, v17);
  return v17;
}

void __panic_npx(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  char __str[2048];
  char *v11;

  v11 = (char *)0xAAAAAAAAAAAAAAAALL;
  bzero(__str, 0x800uLL);
  v11 = &a9;
  vsnprintf(__str, 0x800uLL, a1, &a9);
  _os_crash();
  __break(1u);
}

unint64_t darwin_read_iokit_node(io_registry_entry_t a1, const char *a2, void *a3, size_t *a4)
{
  unint64_t v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFData *CFProperty;
  const __CFData *v11;
  CFTypeID v12;
  unint64_t Length;
  uint64_t v14;
  unint64_t result;
  size_t v16;

  v7 = *a4;
  v8 = CFStringCreateWithCString(0, a2, 0x8000100u);
  if (!v8)
    return 12;
  v9 = v8;
  CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(a1, v8, 0, 0);
  if (!CFProperty)
  {
    v14 = 2;
LABEL_10:
    CFRelease(v9);
    return v14;
  }
  v11 = CFProperty;
  v12 = CFGetTypeID(CFProperty);
  if (v12 != CFDataGetTypeID())
  {
    v14 = 96;
    goto LABEL_9;
  }
  Length = CFDataGetLength(v11);
  if (HIDWORD(Length))
  {
    v14 = 34;
LABEL_9:
    CFRelease(v11);
    goto LABEL_10;
  }
  v16 = Length;
  if (v7 < Length)
  {
    v14 = 84;
    goto LABEL_9;
  }
  result = (unint64_t)CFDataGetBytePtr(v11);
  if (result <= result + v7 && v16 <= *a4)
  {
    result = (unint64_t)memcpy(a3, (const void *)result, v16);
    if (v16 <= *a4)
    {
      v14 = 0;
      *a4 = v16;
      goto LABEL_9;
    }
  }
  __break(0x5519u);
  return result;
}

unint64_t darwin_read_iokit_BOOL(io_registry_entry_t a1, const char *a2, BOOL *a3)
{
  char v4;
  unint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  size_t v14;
  int v15;

  v4 = (char)a2;
  v15 = 0;
  v14 = 4;
  result = darwin_read_iokit_node(a1, a2, &v15, &v14);
  v13 = 0;
  if ((_DWORD)result != 2)
  {
    if ((_DWORD)result)
      __panic_npx("panic: failed to read property: %s: %d", v6, v7, v8, v9, v10, v11, v12, v4);
    v13 = v15 != 0;
  }
  *a3 = v13;
  return result;
}

unint64_t darwin_read_iokit_u32(io_registry_entry_t a1, const char *a2, _DWORD *a3)
{
  char v4;
  unint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  size_t v14;
  int v15;

  v4 = (char)a2;
  v15 = 0;
  v14 = 4;
  result = darwin_read_iokit_node(a1, a2, &v15, &v14);
  v13 = 0;
  if ((_DWORD)result != 2)
  {
    if ((_DWORD)result)
      __panic_npx("panic: failed to read property: %s: %d", v6, v7, v8, v9, v10, v11, v12, v4);
    v13 = v15;
  }
  *a3 = v13;
  return result;
}

unint64_t darwin_read_iokit_u64(io_registry_entry_t a1, const char *a2, _QWORD *a3)
{
  char v4;
  unint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  size_t v14;
  uint64_t v15;

  v4 = (char)a2;
  v14 = 8;
  v15 = 0;
  result = darwin_read_iokit_node(a1, a2, &v15, &v14);
  v13 = 0;
  if ((_DWORD)result != 2)
  {
    if ((_DWORD)result)
      __panic_npx("panic: failed to read property: %s: %d", v6, v7, v8, v9, v10, v11, v12, v4);
    v13 = v15;
  }
  *a3 = v13;
  return result;
}

size_t darwin_read_iokit_cstr(io_registry_entry_t a1, const char *a2, char *a3)
{
  char v4;
  size_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  char __source[16];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v4 = (char)a2;
  v18 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  *(_OWORD *)__source = 0u;
  v15 = 0u;
  v13 = 64;
  result = darwin_read_iokit_node(a1, a2, __source, &v13);
  if ((_DWORD)result == 2)
  {
    *a3 = 0;
  }
  else
  {
    if ((_DWORD)result)
      __panic_npx("panic: failed to read property: %s: %d", v6, v7, v8, v9, v10, v11, v12, v4);
    return strlcpy(a3, __source, 0x40uLL);
  }
  return result;
}

uint64_t _null_enforceable(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t name;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *a2;
  name = chip_get_name(a2[2]);
  expert_log(v2, 1uLL, (uint64_t)"odometer[%s:%s]: policy is enforceable", v4, v5, v6, v7, v8, name);
  return 0;
}

uint64_t _null_enforce(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

void _prepare(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t nonce_digest;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  size_t __n;
  _OWORD v13[5];
  _OWORD v14[4];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(*(_QWORD *)a3 + 24);
  v5 = *(_QWORD *)(v4 + 8);
  memset(v14, 0, sizeof(v14));
  __n = 0;
  memset(v13, 0, sizeof(v13));
  nonce_digest = image4_environment_callout_query_nonce_digest(v4, (uint64_t)v14, (uint64_t)&__n);
  if ((_DWORD)nonce_digest)
  {
    if ((_DWORD)nonce_digest != 45)
      expert_log(v5, 0, (uint64_t)"failed to get nonce digest from callback: %d", v7, v8, v9, v10, v11, nonce_digest);
  }
  else if (__n > 0x40)
  {
    __break(0x5519u);
  }
  else
  {
    digest_init((uint64_t)v13, v14, __n, v7, v8, v9, v10, v11);
    odometer_prepare_nonce_hash(a2, (uint64_t)v13);
  }
}

uint64_t _get_constraint_mask()
{
  return 0;
}

uint64_t _extract_payload()
{
  return 0;
}

uint64_t _chain_future_enforceable(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t name;
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

  if (odometer_policy_get_chip_property(a1, *(_QWORD *)(a2 + 16)))
  {
    v3 = *(unsigned __int16 *)(a2 + 528);
    v4 = *(_QWORD *)a2;
    name = chip_get_name(*(_QWORD *)(a2 + 16));
    if (v3)
    {
      expert_log(v4, 1uLL, (uint64_t)"odometer[%s:%s]: policy is enforceable", v6, v7, v8, v9, v10, name);
      return 0;
    }
    else
    {
      v11 = 1;
      expert_log(v4, 1uLL, (uint64_t)"odometer[%s:%s]: no caller-supplied boot manifest hash", v6, v7, v8, v9, v10, name);
    }
  }
  else
  {
    v12 = *(_QWORD *)a2;
    v13 = chip_get_name(*(_QWORD *)(a2 + 16));
    v11 = 1;
    expert_log(v12, 1uLL, (uint64_t)"odometer[%s:%s]: chip has no property for policy", v14, v15, v16, v17, v18, v13);
  }
  return v11;
}

uint64_t _chain_future_enforce(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t chip_property;
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
  uint64_t name;
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
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v43;
  _OWORD v44[5];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(_QWORD *)(a2 + 16);
  chip_property = odometer_policy_get_chip_property(a1, v6);
  memset(v44, 0, sizeof(v44));
  if (!*(_WORD *)(a2 + 528))
    __panic_npx("panic: optional not set", v8, v9, v10, v11, v12, v13, v14, v43);
  v15 = chip_property;
  manifest_measure(v5, v6, (uint64_t)v44);
  if (property_constrain_digest(v15, v4, (unint64_t)v44, a2 + 448, v16, v17, v18, v19))
  {
    v20 = *(unsigned int *)(a1 + 24);
    v21 = *(_QWORD *)a2;
    name = chip_get_name(*(_QWORD *)(a2 + 16));
    expert_log(v21, 0, (uint64_t)"odometer[%s:%s]: boot chain integrity violation: %d", v23, v24, v25, v26, v27, name);
    if (v20 >= 0x6A)
      __panic_npx("panic: error not set to valid posix code: %d", v28, v29, v30, v31, v32, v33, v34, v20);
  }
  else
  {
    v35 = *(_QWORD *)a2;
    v36 = chip_get_name(*(_QWORD *)(a2 + 16));
    expert_log(v35, 1uLL, (uint64_t)"odometer[%s:%s]: manifest is consistent with boot chain", v37, v38, v39, v40, v41, v36);
    return 0;
  }
  return v20;
}

char *property_get_from_identifier(char *result)
{
  char **v1;

  v1 = &property_get_from_identifier_p_map[(_QWORD)result];
  if (v1 < &_property_stng && v1 >= property_get_from_identifier_p_map)
    return *v1;
  __break(0x5519u);
  return result;
}

uint64_t image4_environment_resolve(uint64_t a1)
{
  return image4_coprocessor_select(*(_QWORD *)(a1 + 16), 0, a1);
}

unint64_t image4_environment_get_secure_boot(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t result;
  int secure_boot;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = 0;
  result = *(_QWORD *)(a1 + 40);
  if (result >= 5)
    __panic_npx("panic: invalid secure boot level: actual = %llu, expected <= %llu", a2, a3, a4, a5, a6, a7, a8, result);
  if (result == 4)
  {
    secure_boot = expert_get_secure_boot(*(_QWORD *)(a1 + 8), (uint64_t)&v18);
    if (secure_boot)
      __panic_npx("panic: failed to get secure boot level: %d", v11, v12, v13, v14, v15, v16, v17, secure_boot);
    return v18;
  }
  return result;
}

unint64_t image4_environment_get_nonce_domain(uint64_t a1)
{
  uint64_t v2;
  unint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  unsigned int v13;

  v2 = *(_QWORD *)(a1 + 8);
  v13 = 0;
  result = *(unsigned int *)(a1 + 48);
  if ((_DWORD)result == -1)
  {
    result = image4_coprocessor_select(*(_QWORD *)(a1 + 16), 0, a1);
    if (!result)
      __panic_npx("panic: could not resolve chip for environment", v4, v5, v6, v7, v8, v9, v10, v12);
    v11 = *(_QWORD *)(result + 200);
    if (v11)
    {
      if (result >= result + 264)
      {
        __break(0x5519u);
      }
      else if (expert_query_property_uint32(v2, result, v11, &v13))
      {
        return 0xFFFFFFFFLL;
      }
      else
      {
        return v13;
      }
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t image4_environment_callout_query_boot_nonce(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t, _QWORD);

  v3 = *(_QWORD *)(a1 + 56);
  if (v3 && (v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v3 + 8)) != 0)
    return v4(a1, a2, a3, *(_QWORD *)(a1 + 64));
  else
    return 45;
}

uint64_t image4_environment_callout_query_nonce_digest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t, _QWORD);

  v3 = *(_QWORD *)(a1 + 56);
  if (v3 && (v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v3 + 16)) != 0)
    return v4(a1, a2, a3, *(_QWORD *)(a1 + 64));
  else
    return 45;
}

uint64_t _image4_environment_init(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v12;

  if (a3 == 0xFFFF)
    __panic_npx("panic: null coprocessor handle", a2, 0xFFFFLL, a4, a5, a6, a7, a8, v12);
  if (a3 >= 0xC)
    __panic_npx("panic: invalid coprocessor handle: actual = %llu, expected < %u", a2, a3, a4, a5, a6, a7, a8, a3);
  if ((_DWORD)a4)
    __panic_npx("panic: unsupported struct version: actual = %hu, expected <= %u", a2, a3, a4, a5, a6, a7, a8, a4);
  *(_QWORD *)(a1 + 64) = 0;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_QWORD *)(a1 + 8) = generic_expert_current();
  *(_QWORD *)(a1 + 16) = a2;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 4;
  *(_DWORD *)(a1 + 48) = -1;
  *(_QWORD *)(a1 + 24) = a3;
  return a1;
}

uint64_t image4_environment_new(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = generic_expert_current();
  result = _expert_alloc_type(v4, (uint64_t)&_image4_type_environment);
  if (result)
  {
    result = _image4_environment_init(result, a1, a2, 0, v6, v7, v8, v9);
    *(_QWORD *)(result + 32) = &_image4_type_environment;
  }
  return result;
}

uint64_t image4_environment_set_secure_boot(uint64_t result, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2 > 3)
    __panic_npx("panic: unreachable case: %s = 0x%llx", a2, a3, a4, a5, a6, a7, a8, (char)"secure_boot");
  *(_QWORD *)(result + 40) = a2;
  return result;
}

uint64_t image4_environment_set_nonce_domain(uint64_t result, int a2)
{
  *(_DWORD *)(result + 48) = a2;
  return result;
}

uint64_t image4_environment_set_callbacks(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(result + 56) = a2;
  *(_QWORD *)(result + 64) = a3;
  return result;
}

uint64_t image4_environment_identify(uint64_t a1)
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
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t constraint;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  void (*v24)(uint64_t, _QWORD *, _QWORD, _QWORD);
  void (*v25)(uint64_t, _QWORD *, uint64_t, _QWORD);
  uint64_t v26;
  void (*v27)(uint64_t, _QWORD *, char *, uint64_t, _QWORD);
  char v28;
  _OWORD v29[4];
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  char __s[16];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  unint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v2 = generic_expert_current();
  v30 = xmmword_251CCE7F0;
  v31 = -1;
  v3 = image4_coprocessor_select(*(_QWORD *)(a1 + 16), 0, a1);
  if (!v3)
    __panic_npx("panic: could not resolve chip for environment", v4, v5, v6, v7, v8, v9, v10, v28);
  v11 = v3;
  result = (uint64_t)property_iterator_next((uint64_t)&v30, v4, v5, v6, v7, v8, v9, v10);
  if (result)
  {
    v13 = result;
    memset(v29, 170, sizeof(v29));
    do
    {
      v32 = 0;
      v35 = v29[3];
      v36 = v29[2];
      v37 = v29[1];
      v38 = v29[0];
      *(_OWORD *)__s = xmmword_24BA98520;
      v34 = xmmword_24BA98530;
      v39 = 0xAAAAAAAAAAAAAAAALL;
      constraint = chip_get_constraint(v11, v13, 0);
      v22 = image4_identifier_init(&v32, constraint);
      if (constraint != *(_QWORD *)(v11 + 200) || *(_DWORD *)(a1 + 48) == -1)
      {
        switch(**(_QWORD **)(constraint + 40))
        {
          case 0:
            if (!expert_query_property_BOOL(v2, v11, constraint, (unsigned __int8 *)__s))
              goto LABEL_15;
            goto LABEL_27;
          case 1:
            if (!expert_query_property_uint32(v2, v11, constraint, __s))
              goto LABEL_15;
            goto LABEL_27;
          case 2:
            if (!expert_query_property_uint64(v2, v11, constraint, __s))
              goto LABEL_15;
            goto LABEL_27;
          case 3:
            goto LABEL_27;
          case 4:
            if (!expert_query_property_version(v2, v11, constraint, (uint64_t)__s))
              goto LABEL_15;
            goto LABEL_27;
          default:
            __panic_npx("panic: version property iterated during identification: p = %s, fourcc = %s", v15, v16, v17, v18, v19, v20, v21, *(_QWORD *)constraint);
        }
      }
      *(_DWORD *)__s = *(_DWORD *)(a1 + 48);
LABEL_15:
      v23 = *(_QWORD **)(a1 + 56);
      if (v23)
      {
        switch(**(_QWORD **)(*v22 + 40))
        {
          case 0:
            v24 = (void (*)(uint64_t, _QWORD *, _QWORD, _QWORD))v23[3];
            if (v24)
              v24(a1, v22, __s[0], *(_QWORD *)(a1 + 64));
            break;
          case 1:
            v25 = (void (*)(uint64_t, _QWORD *, uint64_t, _QWORD))v23[4];
            if (!v25)
              break;
            v26 = *(unsigned int *)__s;
            goto LABEL_23;
          case 2:
            v25 = (void (*)(uint64_t, _QWORD *, uint64_t, _QWORD))v23[4];
            if (!v25)
              break;
            v26 = *(_QWORD *)__s;
LABEL_23:
            v25(a1, v22, v26, *(_QWORD *)(a1 + 64));
            break;
          case 4:
            v27 = (void (*)(uint64_t, _QWORD *, char *, uint64_t, _QWORD))v23[5];
            if (!v27)
              break;
            result = strlen(__s);
            if (result < 1)
            {
              __break(0x5519u);
              return result;
            }
            v27(a1, v22, __s, v37 + 1, *(_QWORD *)(a1 + 64));
            break;
          default:
            __panic_npx("panic: unreachable case: %s = 0x%llx", v15, v16, v17, v18, v19, v20, v21, (char)"id4->id_p->p_type->pt_switchable");
        }
      }
LABEL_27:
      result = (uint64_t)property_iterator_next((uint64_t)&v30, v15, v16, v17, v18, v19, v20, v21);
      v13 = result;
    }
    while (result);
  }
  return result;
}

uint64_t image4_environment_get_digest_info(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char vars0;

  v1 = image4_coprocessor_select(*(_QWORD *)(a1 + 16), 0, a1);
  if (!v1)
    __panic_npx("panic: could not resolve chip for environment", v2, v3, v4, v5, v6, v7, v8, vars0);
  return (*(uint64_t (**)(void))(v1 + 48))();
}

uint64_t *image4_environment_destroy(uint64_t *result)
{
  if (*result)
    return (uint64_t *)_expert_dealloc_type(*(_QWORD *)(*result + 8), *(_QWORD *)(*result + 32), result);
  return result;
}

uint64_t _BootPolicyClosureComputeDigest(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t *v9;

  v9 = **(unint64_t ***)(*(_QWORD *)(a5 + 32) + 16);
  if (*v9 > a4)
    __panic_npx_0((uint64_t)v9, a2, a1, a4, a5, a6, a7, a8, a4);
  ccdigest();
  return 0;
}

uint64_t _BootPolicyClosureVerifyChain()
{
  return 0;
}

uint64_t _BootPolicyClosureVerifySignature()
{
  return 0;
}

uint64_t _BootPolicyClosureEvaluateCertificateProperties()
{
  return 0;
}

void __panic_npx_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  char __str[2048];
  char *v10;

  v10 = (char *)0xAAAAAAAAAAAAAAAALL;
  bzero(__str, 0x800uLL);
  v10 = &a9;
  vsnprintf(__str, 0x800uLL, "panic: digest buffer overflow: actual = %lu, expected >= %lu", &a9);
  _os_crash();
  __break(1u);
}

uint64_t _BootPolicyClosureComputeDigest_0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t *v9;

  v9 = **(unint64_t ***)(*(_QWORD *)(a5 + 32) + 16);
  if (*v9 > a4)
    __panic_npx_0((uint64_t)v9, a2, a1, a4, a5, a6, a7, a8, a4);
  ccdigest();
  return 0;
}

uint64_t _BootPolicyClosureVerifyChain_0()
{
  return 0;
}

uint64_t _BootPolicyClosureVerifySignature_0()
{
  return 0;
}

uint64_t _BootPolicyClosureEvaluateCertificateProperties_0()
{
  return 0;
}

void _prepare_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t boot_nonce;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t nonce_digest;
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
  size_t v24;
  size_t __n;
  _OWORD v26[5];
  _OWORD v27[4];
  _QWORD v28[3];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(*(_QWORD *)a3 + 24);
  v5 = *(_QWORD *)(v4 + 8);
  v29[0] = 0;
  v29[1] = 0;
  v24 = 0;
  __n = 0;
  memset(v28, 0, sizeof(v28));
  memset(v27, 0, sizeof(v27));
  memset(v26, 0, sizeof(v26));
  boot_nonce = image4_environment_callout_query_boot_nonce(v4, (uint64_t)v29, (uint64_t)&__n);
  if (!(_DWORD)boot_nonce)
  {
    if (__n <= 0x10)
    {
      nonce_init(v28, v29, __n, v7, v8, v9, v10, v11);
      odometer_prepare_nonce(a2, v28, v18, v19, v20, v21, v22, v23);
      return;
    }
    goto LABEL_12;
  }
  if ((_DWORD)boot_nonce != 45)
  {
    expert_log(v5, 0, (uint64_t)"failed to get boot nonce from callback: %d", v7, v8, v9, v10, v11, boot_nonce);
    return;
  }
  nonce_digest = image4_environment_callout_query_nonce_digest(v4, (uint64_t)v27, (uint64_t)&v24);
  if ((_DWORD)nonce_digest != 45)
  {
    if (!(_DWORD)nonce_digest)
    {
      if (v24 <= 0x40)
      {
        digest_init((uint64_t)v26, v27, v24, v13, v14, v15, v16, v17);
        odometer_prepare_nonce_hash(a2, (uint64_t)v26);
        return;
      }
LABEL_12:
      __break(0x5519u);
      return;
    }
    expert_log(v5, 0, (uint64_t)"failed to get nonce digest from callback: %d", v13, v14, v15, v16, v17, nonce_digest);
  }
}

void *_get_constraint_mask_0()
{
  return &_sign_constraints;
}

uint64_t _extract_payload_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  int v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD v12[5];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v7 = *(unsigned __int16 *)(a3 + 528);
  memset(&v12[3], 0, 32);
  if (v7)
    v8 = a3 + 528;
  else
    v8 = 0;
  memset(&v12[1], 0, 32);
  if (v7)
    v9 = a3 + 72;
  else
    v9 = 0;
  v12[0] = 0uLL;
  v10 = manifest_measure(a3, a2, (uint64_t)v12);
  *a5 = *(_QWORD *)(*(uint64_t (**)(uint64_t))(a2 + 48))(v10);
  if (v9 + 456 > v8)
    __break(0x5519u);
  return v9 + 328;
}

_QWORD *nonce_init(_QWORD *a1, const void *a2, size_t __n, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (__n >= 0x11)
    __panic_npx("panic: nonce too large: actual = %lu, expected <= %ld", (uint64_t)a2, __n, a4, a5, a6, a7, a8, __n);
  memcpy(a1, a2, __n);
  a1[2] = __n;
  return a1;
}

_QWORD *nonce_init_copy(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v8;

  v8 = a2[2];
  if (v8 < 0x11)
    return nonce_init(result, a2, v8, a4, a5, a6, a7, a8);
  __break(0x5519u);
  return result;
}

uint64_t nonce_compare(_QWORD *a1, _QWORD *a2)
{
  size_t v2;

  v2 = a1[2];
  if (v2 == a2[2])
    return memcmp(a1, a2, v2);
  else
    return 0xFFFFFFFFLL;
}

uint64_t nonce_compare_buff(_QWORD *a1, const void *a2, size_t a3)
{
  if (a1[2] == a3)
    return memcmp(a1, a2, a3);
  else
    return 0xFFFFFFFFLL;
}

void *nonce_copy_out(_QWORD *__src, void *__dst, size_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v9;
  size_t v10;
  void *result;

  v9 = *a3;
  v10 = __src[2];
  if (v9 < v10)
LABEL_6:
    __panic_npx("panic: nonce length overflow: actual = %lu, expected >= %lu", (uint64_t)__dst, v10, a4, a5, a6, a7, a8, v9);
  if (v10 > 0x10 || (result = memcpy(__dst, __src, v10), v9 = __src[2], v9 > *a3))
  {
    __break(0x5519u);
    goto LABEL_6;
  }
  *a3 = v9;
  return result;
}

_QWORD *nonce_init_uint64(_QWORD *result, unint64_t a2)
{
  *result = bswap64(a2);
  result[2] = 8;
  return result;
}

unint64_t nonce_get_uint64(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1[2] >= 9)
    __panic_npx("panic: nonce cannot fit into 64-bit integer: actual = %lu, expected <= %lu", a2, a3, a4, a5, a6, a7, a8, a1[2]);
  return bswap64(*a1);
}

uint64_t nonce_print_cstr(uint64_t result, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t *v8;
  unint64_t v9;
  unint64_t v10;
  _BYTE *v11;
  unint64_t v12;
  char *v13;
  char *v15;
  char *v16;
  BOOL v17;
  BOOL v18;
  BOOL v19;
  BOOL v20;
  char v21[24];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  strcpy(v21, "0123456789abcdef");
  v8 = (unint64_t *)(result + 16);
  v9 = *(_QWORD *)(result + 16);
  if (v9 > 0x21)
LABEL_30:
    __panic_npx("panic: bogus nonce length: actual = %lu, expected <= %lu", a2, a3, a4, a5, a6, a7, a8, v9);
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  if (!*v8)
    goto LABEL_27;
  v9 = 0;
  v10 = a2 + 33;
  v11 = (_BYTE *)a2;
  do
  {
    if (result + v9 >= (unint64_t)v8)
      goto LABEL_29;
    v12 = *(unsigned __int8 *)(result + v9);
    v13 = (char *)((unint64_t)v21 | (v12 >> 4));
    if (v13 >= &v21[17] || v13 < v21)
      goto LABEL_29;
    *v11 = *v13;
    v15 = v11 + 1;
    v16 = (char *)((unint64_t)v21 | v12 & 0xF);
    v17 = v16 >= &v21[17] || v16 < v21;
    v18 = v17 || (unint64_t)v15 >= v10;
    v19 = !v18 && (unint64_t)v15 >= a2;
    if (!v19
      || ((*v15 = *v16, v11 = v15 + 1, (unint64_t)v11 < v10) ? (v20 = (unint64_t)v11 >= a2) : (v20 = 0),
          !v20))
    {
LABEL_29:
      __break(0x5519u);
      goto LABEL_30;
    }
    *v11 = 0;
    ++v9;
  }
  while (v9 < *v8);
  if (!*v8)
LABEL_27:
    strcpy((char *)a2, "null");
  return result;
}

unint64_t sprintdgst_npx(unint64_t result, unsigned __int8 *a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8;
  _BYTE *v9;
  char v10;
  unsigned int v11;
  char *v12;
  char *v14;
  char *v15;
  BOOL v16;
  BOOL v17;
  char v20[24];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  strcpy(v20, "0123456789abcdef");
  if (a3 > 0x40)
    goto LABEL_28;
  *(_BYTE *)(result + 128) = 0;
  *(_OWORD *)(result + 96) = 0u;
  *(_OWORD *)(result + 112) = 0u;
  *(_OWORD *)(result + 64) = 0u;
  *(_OWORD *)(result + 80) = 0u;
  *(_OWORD *)(result + 32) = 0u;
  *(_OWORD *)(result + 48) = 0u;
  *(_OWORD *)result = 0u;
  *(_OWORD *)(result + 16) = 0u;
  if (a3)
  {
    v8 = result + 129;
    v9 = (_BYTE *)result;
    while (1)
    {
      v11 = *a2++;
      v10 = v11;
      v12 = (char *)((unint64_t)v20 | ((unint64_t)v11 >> 4));
      if (v12 >= &v20[17] || v12 < v20)
        break;
      *v9 = *v12;
      v14 = v9 + 1;
      v15 = (char *)((unint64_t)v20 | v10 & 0xF);
      v16 = v15 >= &v20[17] || v15 < v20;
      v17 = v16 || (unint64_t)v14 >= v8;
      if (v17 || (unint64_t)v14 < result)
        break;
      *v14 = *v15;
      v9 = v14 + 1;
      if ((unint64_t)v9 >= v8 || (unint64_t)v9 < result)
        break;
      *v9 = 0;
      if (!--a3)
        return result;
    }
    __break(0x5519u);
LABEL_28:
    __panic_npx_1(result, (uint64_t)a2, a3, a4, a5, a6, a7, a8, a3);
  }
  strcpy((char *)result, "null");
  return result;
}

void __panic_npx_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  char __str[2048];
  char *v10;

  v10 = (char *)0xAAAAAAAAAAAAAAAALL;
  bzero(__str, 0x800uLL);
  v10 = &a9;
  vsnprintf(__str, 0x800uLL, "panic: bogus digest length: %lu", &a9);
  _os_crash();
  __break(1u);
}

uint64_t _chain_pivot_enforceable(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t name;
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

  if (odometer_policy_get_chip_property(a1, *(_QWORD *)(a2 + 16)))
  {
    v3 = *(unsigned __int16 *)(a2 + 432);
    v4 = *(_QWORD *)a2;
    name = chip_get_name(*(_QWORD *)(a2 + 16));
    if (v3)
    {
      expert_log(v4, 1uLL, (uint64_t)"odometer[%s:%s]: policy is enforceable", v6, v7, v8, v9, v10, name);
      return 0;
    }
    else
    {
      v11 = 1;
      expert_log(v4, 1uLL, (uint64_t)"odometer[%s:%s]: manifest has no pivot constraint", v6, v7, v8, v9, v10, name);
    }
  }
  else
  {
    v12 = *(_QWORD *)a2;
    v13 = chip_get_name(*(_QWORD *)(a2 + 16));
    v11 = 1;
    expert_log(v12, 1uLL, (uint64_t)"odometer[%s:%s]: chip has no property for policy", v14, v15, v16, v17, v18, v13);
  }
  return v11;
}

uint64_t _chain_pivot_enforce(uint64_t a1, unint64_t a2)
{
  uint64_t chip_property;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 *v9;
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
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
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
  uint64_t name;
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

  chip_property = odometer_policy_get_chip_property(a1, *(_QWORD *)(a2 + 16));
  if (*(_WORD *)(a2 + 432))
    v9 = (unsigned __int8 *)(a2 + 328);
  else
    v9 = 0;
  v10 = odometer_enforce_property((uint64_t *)a2, a1, chip_property, v9, v5, v6, v7, v8);
  if (!(_DWORD)v10)
    goto LABEL_13;
  v17 = v10;
  if ((_DWORD)v10 == 2)
  {
    if (!odometer_check_fuse(a2, (uint64_t)&_odometer_cylinder_production_status, v11, v12, v13, v14, v15, v16))
    {
      v24 = "odometer[%s:%s]: development silicon; not enforcing policy";
      goto LABEL_12;
    }
    if (odometer_check_fuse(a2, (uint64_t)&_odometer_cylinder_internal_use, v18, v19, v20, v21, v22, v23))
    {
      v24 = "odometer[%s:%s]: internal unit; not enforcing policy";
LABEL_12:
      v40 = *(_QWORD *)a2;
      name = chip_get_name(*(_QWORD *)(a2 + 16));
      expert_log(v40, 1uLL, (uint64_t)v24, v42, v43, v44, v45, v46, name);
LABEL_13:
      v47 = *(_QWORD *)a2;
      v48 = chip_get_name(*(_QWORD *)(a2 + 16));
      expert_log(v47, 1uLL, (uint64_t)"odometer[%s:%s]: manifest is consistent with boot chain", v49, v50, v51, v52, v53, v48);
      return 0;
    }
  }
  v25 = *(_QWORD *)a2;
  v26 = chip_get_name(*(_QWORD *)(a2 + 16));
  v32 = expert_log(v25, 0, (uint64_t)"odometer[%s:%s]: boot chain integrity violation: %d", v27, v28, v29, v30, v31, v26);
  if (v17 >= 0x6A)
    __panic_npx_2(v32, v33, v34, v35, v36, v37, v38, v39, v17);
  return v17;
}

void __panic_npx_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  char __str[2048];
  char *v10;

  v10 = (char *)0xAAAAAAAAAAAAAAAALL;
  bzero(__str, 0x800uLL);
  v10 = &a9;
  vsnprintf(__str, 0x800uLL, "panic: error not set to valid posix code: %d", &a9);
  _os_crash();
  __break(1u);
}

uint64_t __handle_absence(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  *a3 = 0;
  return 0;
}

uint64_t expert_map(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1[1] <= 0x11FuLL)
    __panic_npx("panic: insufficient memory for expert: actual = %lu, expected >= %lu", a2, a3, a4, a5, a6, a7, a8, a1[1]);
  return *a1;
}

uint64_t _expert_assert(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)(result + 8) != (_DWORD)a2)
    __panic_npx("panic: unexpected expert: op = %s, actual = %s, expected = %s", a2, a3, a4, a5, a6, a7, a8, a3);
  return result;
}

char *expert_log_level_cstr_lower(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 >= 4)
    __panic_npx("panic: unreachable case: %s = 0x%llx", a2, a3, a4, a5, a6, a7, a8, (char)"lvl");
  return off_251CCF4D0[a1];
}

char *expert_log_level_cstr_upper(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 >= 4)
    __panic_npx("panic: unreachable case: %s = 0x%llx", a2, a3, a4, a5, a6, a7, a8, (char)"lvl");
  return off_251CCF4F0[a1];
}

uint64_t expert_init(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t expert_boot(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 40))();
}

uint64_t _expert_alloc_type(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  char v13;

  (*(void (**)(void))(a1 + 240))();
  if (!type_get_size(a2))
    __panic_npx("panic: type not available", v4, v5, v6, v7, v8, v9, v10, v13);
  v11 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 64);
  if (v11)
    return v11(a1, a2);
  else
    return 0;
}

uint64_t expert_runtime_entry(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 240))();
}

uint64_t _expert_dealloc_type(uint64_t result, uint64_t a2, uint64_t *a3)
{
  uint64_t v4;
  uint64_t (*v5)(void);
  BOOL v6;

  if (a2)
  {
    v4 = *a3;
    v5 = *(uint64_t (**)(void))(result + 72);
    if (v5)
      v6 = v4 == 0;
    else
      v6 = 1;
    if (!v6)
      result = v5();
  }
  *a3 = 0;
  return result;
}

uint64_t expert_alloc_data(uint64_t a1, uint64_t a2)
{
  uint64_t (*v4)(uint64_t, uint64_t);

  (*(void (**)(void))(a1 + 240))();
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 80);
  if (v4)
    return v4(a1, a2);
  else
    return 0;
}

uint64_t expert_dealloc_data(uint64_t result, uint64_t a2, uint64_t *a3)
{
  uint64_t v4;
  uint64_t (*v5)(void);
  BOOL v6;

  v4 = *a3;
  v5 = *(uint64_t (**)(void))(result + 88);
  if (v5)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    result = v5();
    *a3 = 0;
  }
  return result;
}

uint64_t expert_dump(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
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
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t);
  uint64_t v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t);
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  char *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  _QWORD *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t result;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  unint64_t v112;
  __int128 v113;
  uint64_t v114;
  char __source[16];
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  uint64_t v121;
  _OWORD v122[5];
  __int128 __str;
  __int128 v124;
  _BYTE v125[19];
  _QWORD v126[2];
  _QWORD v127[3];
  _QWORD v128[3];
  char __dst[3];
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  _BYTE v136[30];
  uint64_t v137;

  v137 = *MEMORY[0x24BDAC8D0];
  v113 = xmmword_251CCF4A0;
  v114 = -1;
  v112 = 0;
  __str = xmmword_24BA9858D;
  v124 = unk_24BA9859D;
  (*(void (**)(void))(a1 + 240))();
  (*(void (**)(uint64_t))(a1 + 240))(a1);
  if ((*(unsigned int (**)(uint64_t, unint64_t *))(a1 + 120))(a1, &v112))
  {
    v112 = 3;
  }
  else
  {
    v9 = v112;
    if (v112 >= 3)
    {
      if (v112 != 3)
      {
        v111 = "sb";
        goto LABEL_41;
      }
      v9 = 3;
    }
    snprintf((char *)&__str, 0x20uLL, "0x%llx", v9);
  }
  v10 = bswap32(*(_DWORD *)(a1 + 8));
  BYTE4(__str) = 0;
  LODWORD(__str) = v10;
  expert_log(a1, 1uLL, (uint64_t)"%6s  %-36s : %s", v4, v5, v6, v7, v8, (uint64_t)&unk_24BAA271F);
  expert_log(a1, 1uLL, (uint64_t)"%6s  %-36s : %s", v11, v12, v13, v14, v15, (uint64_t)&unk_24BAA271F);
  expert_log(a1, 1uLL, (uint64_t)"%s %-36s : 0x%x", v16, v17, v18, v19, v20, (uint64_t)"  🔥🌸 ");
  expert_log(a1, 1uLL, (uint64_t)"%6s  %-36s : 0x%llx", v21, v22, v23, v24, v25, (uint64_t)&unk_24BAA271F);
  expert_log(a1, 1uLL, (uint64_t)"%6s  %-36s : 0x%llx", v26, v27, v28, v29, v30, (uint64_t)&unk_24BAA271F);
  expert_log(a1, 1uLL, (uint64_t)"%6s  %-36s : 0x%llx", v31, v32, v33, v34, v35, (uint64_t)&unk_24BAA271F);
  v36 = v112;
  (*(void (**)(uint64_t))(a1 + 240))(a1);
  v37 = (*(uint64_t (**)(uint64_t, unint64_t))(a1 + 128))(a1, v36);
  chip_get_name(v37);
  expert_log(a1, 1uLL, (uint64_t)"%6s  %-36s : %s", v38, v39, v40, v41, v42, (uint64_t)&unk_24BAA271F);
  (*(void (**)(uint64_t))(a1 + 240))(a1);
  v48 = *(uint64_t (**)(uint64_t))(a1 + 104);
  if (v48 && (unint64_t)v48(a1) >= 7
    || (expert_log(a1, 1uLL, (uint64_t)"%6s  %-36s : %s", v43, v44, v45, v46, v47, (uint64_t)&unk_24BAA271F),
        (*(void (**)(uint64_t))(a1 + 240))(a1),
        (v51 = *(uint64_t (**)(uint64_t))(a1 + 112)) != 0)
    && (unint64_t)v51(a1) >= 7)
  {
    __panic_npx("panic: unreachable case: %s = 0x%llx", v49, v50, v43, v44, v45, v46, v47, (char)"lvl");
  }
  expert_log(a1, 1uLL, (uint64_t)"%6s  %-36s : %s", v43, v44, v45, v46, v47, (uint64_t)&unk_24BAA271F);
  v59 = property_iterator_next((uint64_t)&v113, v52, v53, v54, v55, v56, v57, v58);
  if (v59)
  {
    v60 = v59;
    while (1)
    {
      v135 = 0u;
      memset(v136, 0, sizeof(v136));
      v133 = 0u;
      v134 = 0u;
      v131 = 0u;
      v132 = 0u;
      v130 = 0u;
      qmemcpy(__dst, "n/a", sizeof(__dst));
      LOBYTE(v127[0]) = 0;
      LODWORD(v128[0]) = 0;
      *(_QWORD *)v125 = 0;
      memset(v122, 0, sizeof(v122));
      v121 = 0x3E800000000;
      v119 = 0u;
      v120 = 0u;
      v117 = 0u;
      v118 = 0u;
      *(_OWORD *)__source = 0u;
      v116 = 0u;
      v61 = v60 + 104;
      switch(**((_QWORD **)v60 + 5))
      {
        case 0:
          if (v60 >= v61)
            goto LABEL_39;
          if (!expert_query_property_BOOL(a1, v37, (uint64_t)v60, (unsigned __int8 *)v127))
            goto LABEL_23;
          goto LABEL_30;
        case 1:
          if (v60 >= v61)
            goto LABEL_39;
          if (!expert_query_property_uint32(a1, v37, (uint64_t)v60, v128))
LABEL_23:
            snprintf(__dst, 0x81uLL, "%#x");
          goto LABEL_30;
        case 2:
          if (v60 >= v61)
            goto LABEL_39;
          if (!expert_query_property_uint64(a1, v37, (uint64_t)v60, v125))
            snprintf(__dst, 0x81uLL, "%#llx");
          goto LABEL_30;
        case 3:
          if (v60 >= v61)
            goto LABEL_39;
          if (!expert_query_property_digest(a1, v37, (uint64_t)v60, (uint64_t)v122))
            digest_print_cstr((unint64_t)v122, (unint64_t)__dst, v67, v62, v63, v64, v65, v66);
          goto LABEL_30;
        case 4:
          if (v60 >= v61)
          {
LABEL_39:
            __break(0x5519u);
LABEL_40:
            v111 = "pi->p_type->pt_switchable";
LABEL_41:
            __panic_npx("panic: unreachable case: %s = 0x%llx", v2, v3, v4, v5, v6, v7, v8, (char)v111);
          }
          if (!expert_query_property_version(a1, v37, (uint64_t)v60, (uint64_t)__source))
            version_copyout(__source, __dst);
LABEL_30:
          expert_log(a1, 1uLL, (uint64_t)"%6s  %-36s : %s", v62, v63, v64, v65, v66, (uint64_t)(v60 + 28));
          v60 = property_iterator_next((uint64_t)&v113, v68, v69, v70, v71, v72, v73, v74);
          if (!v60)
            goto LABEL_31;
          break;
        default:
          goto LABEL_40;
      }
    }
  }
LABEL_31:
  memset(v128, 0, sizeof(v128));
  memset(v127, 0, sizeof(v127));
  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  *(_OWORD *)__source = 0u;
  *(_QWORD *)((char *)v122 + 11) = 0;
  BYTE4(v122[0]) = 0;
  *(_WORD *)((char *)v122 + 5) = 0;
  *(_DWORD *)((char *)v122 + 7) = 0;
  *(_QWORD *)((char *)&v122[1] + 9) = 0;
  *(_QWORD *)((char *)&v122[1] + 3) = 0;
  strcpy((char *)v122, "n/a");
  *(_QWORD *)&v125[11] = 0;
  v125[4] = 0;
  *(_WORD *)&v125[5] = 0;
  *(_DWORD *)&v125[7] = 0;
  *(_QWORD *)((char *)v126 + 6) = 0;
  v126[0] = 0;
  strcpy(v125, "n/a");
  memset(v136, 0, sizeof(v136));
  v135 = 0u;
  v134 = 0u;
  v133 = 0u;
  v132 = 0u;
  v131 = 0u;
  v130 = 0u;
  qmemcpy(__dst, "n/a", sizeof(__dst));
  (*(void (**)(uint64_t))(a1 + 240))(a1);
  if (!(*(unsigned int (**)(uint64_t, _QWORD, _QWORD, _QWORD *))(a1 + 144))(a1, 0, 0, v128))
  {
    nonce_print_cstr((uint64_t)v128, (unint64_t)v122, v75, v76, v77, v78, v79, v80);
    (*(void (**)(uint64_t))(a1 + 240))(a1);
    if (!(*(unsigned int (**)(uint64_t, _QWORD, _QWORD, _QWORD *, _QWORD *))(a1 + 152))(a1, 0, 0, v128, v127))
    {
      nonce_print_cstr((uint64_t)v127, (unint64_t)v125, v81, v76, v77, v78, v79, v80);
      (*(void (**)(uint64_t))(a1 + 240))(a1);
      v82 = (_QWORD *)(*(uint64_t (**)(uint64_t, _QWORD))(a1 + 128))(a1, 0);
      odometer_compute_nonce_hash(a1, v82, (uint64_t)v127, (uint64_t)__source);
      digest_print_cstr((unint64_t)__source, (unint64_t)__dst, v83, v84, v85, v86, v87, v88);
    }
  }
  expert_log(a1, 2uLL, (uint64_t)"%6s  %-36s : %s", v76, v77, v78, v79, v80, (uint64_t)&unk_24BAA271F);
  expert_log(a1, 2uLL, (uint64_t)"%6s  %-36s : %s", v89, v90, v91, v92, v93, (uint64_t)&unk_24BAA271F);
  expert_log(a1, 2uLL, (uint64_t)"%6s  %-36s : %s", v94, v95, v96, v97, v98, (uint64_t)&unk_24BAA271F);
  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  *(_OWORD *)__source = 0u;
  memset(v136, 0, sizeof(v136));
  v135 = 0u;
  v134 = 0u;
  v133 = 0u;
  v132 = 0u;
  v131 = 0u;
  v130 = 0u;
  qmemcpy(__dst, "n/a", sizeof(__dst));
  if (!expert_query_property_digest(a1, 0, (uint64_t)&_property_bmfh, (uint64_t)__source))
    digest_print_cstr((unint64_t)__source, (unint64_t)__dst, v99, v100, v101, v102, v103, v104);
  result = expert_log(a1, 1uLL, (uint64_t)"%6s  %-36s : %s", v100, v101, v102, v103, v104, (uint64_t)&unk_24BAA271F);
  if (*(_QWORD *)(a1 + 56))
  {
    expert_log(a1, 1uLL, (uint64_t)"%s %-36s", v106, v107, v108, v109, v110, (uint64_t)&unk_24BAA271F);
    return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 56))(a1, 1);
  }
  return result;
}

uint64_t expert_get_secure_boot(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(a1 + 240))();
  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 120))(a1, a2);
}

uint64_t expert_log(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a2 >= 3)
  {
    if (a2 != 3)
      __panic_npx("panic: unreachable case: %s = 0x%llx", a2, a3, a4, a5, a6, a7, a8, (char)"level");
  }
  else
  {
    (*(void (**)(uint64_t))(a1 + 240))(a1);
  }
  return (*(uint64_t (**)(uint64_t, unint64_t, uint64_t, uint64_t *))(a1 + 48))(a1, a2, a3, &a9);
}

uint64_t expert_query_chip(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(a1 + 240))();
  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 128))(a1, a2);
}

uint64_t expert_get_exception_level(uint64_t a1)
{
  uint64_t (*v2)(uint64_t);

  (*(void (**)(void))(a1 + 240))();
  v2 = *(uint64_t (**)(uint64_t))(a1 + 104);
  if (v2)
    return v2(a1);
  else
    return 0;
}

uint64_t expert_get_unprivileged_limit(uint64_t a1)
{
  uint64_t (*v2)(uint64_t);

  (*(void (**)(void))(a1 + 240))();
  v2 = *(uint64_t (**)(uint64_t))(a1 + 112);
  if (v2)
    return v2(a1);
  else
    return 6;
}

uint64_t expert_query_property_BOOL(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4)
{
  unint64_t v8;
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
  uint64_t (*v29)(uint64_t, uint64_t, unsigned __int8 *);
  uint64_t (*v30)(uint64_t, uint64_t, unsigned __int8 *);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned __int8 v38;
  unsigned __int8 v40;
  unsigned __int8 v41;
  char __str[3];
  __int128 v43;
  __int128 v44;
  _BYTE v45[29];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v40 = 0;
  (*(void (**)(void))(a1 + 240))();
  _expert_query_resolve_debug(a1, a2, a3);
  v8 = chip_select_property_expert(a2, (_QWORD *)a3, a1);
  expert_log(a1, 2uLL, (uint64_t)"selected property expert: property = %s, selected = %s, base = %s", v9, v10, v11, v12, v13, a3 + 28);
  if (v8 >= v8 + 288)
    __break(0x5519u);
  v14 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t, unsigned __int8 *))(v8 + 200))(v8, a2, a3, &v40);
  v20 = v14;
  if ((int)v14 > 18)
  {
    if ((_DWORD)v14 != 45 && (_DWORD)v14 != 19)
      goto LABEL_5;
LABEL_11:
    expert_log(a1, 2uLL, (uint64_t)"property not present: %s: %d", v15, v16, v17, v18, v19, *(_QWORD *)a3);
    goto LABEL_12;
  }
  if ((_DWORD)v14)
  {
    if ((_DWORD)v14 != 2)
    {
LABEL_5:
      expert_log(a1, 0, (uint64_t)"failed to query property: %s: %d", v15, v16, v17, v18, v19, *(_QWORD *)a3);
      goto LABEL_13;
    }
    goto LABEL_11;
  }
LABEL_12:
  expert_log(a1, 2uLL, (uint64_t)"queried property: %s => 0x%x", v15, v16, v17, v18, v19, a3 + 28);
LABEL_13:
  v29 = *(uint64_t (**)(uint64_t, uint64_t, unsigned __int8 *))(a3 + 88);
  memset(v45, 0, sizeof(v45));
  v44 = 0u;
  v43 = 0u;
  qmemcpy(__str, "n/a", sizeof(__str));
  v41 = v40;
  if (*(_UNKNOWN **)(a3 + 48) == &_property_constraint_un)
    v30 = _expert_post_process_unconstrain_BOOL;
  else
    v30 = v29;
  if ((_DWORD)v20 != 2)
  {
    if ((_DWORD)v20)
      goto LABEL_22;
    v30 = *(uint64_t (**)(uint64_t, uint64_t, unsigned __int8 *))(a3 + 96);
    snprintf(__str, 0x40uLL, "0x%x", v40);
  }
  if (v30)
  {
    v31 = v30(a3, a2, &v41);
    if ((_DWORD)v31)
    {
      v37 = v31;
      expert_log(a1, 1uLL, (uint64_t)"transform not applied: p = %s, kind = %s: %d", v32, v33, v34, v35, v36, a3 + 28);
      v20 = v37;
      goto LABEL_23;
    }
    expert_log(a1, 2uLL, (uint64_t)"applied transform: p = %s, type = %s, xf kind = %s, value = [%s => 0x%x], error = [%d => %d]", v32, v33, v34, v35, v36, a3 + 28);
    v38 = v41;
LABEL_27:
    v20 = 0;
    *a4 = v38;
    return v20;
  }
LABEL_22:
  if (!(_DWORD)v20)
  {
    v38 = v40;
    goto LABEL_27;
  }
LABEL_23:
  if (v20 >= 0x6A)
    __panic_npx("panic: error not set to valid posix code: %d", v21, v22, v23, v24, v25, v26, v27, v20);
  return v20;
}

uint64_t expert_query_property_uint32(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  unint64_t v8;
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
  uint64_t (*v29)(uint64_t, uint64_t, int *);
  uint64_t (*v30)(uint64_t, uint64_t, int *);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  int v40;
  int v41;
  char __str[3];
  __int128 v43;
  __int128 v44;
  _BYTE v45[29];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v40 = 0;
  (*(void (**)(void))(a1 + 240))();
  _expert_query_resolve_debug(a1, a2, a3);
  v8 = chip_select_property_expert(a2, (_QWORD *)a3, a1);
  expert_log(a1, 2uLL, (uint64_t)"selected property expert: property = %s, selected = %s, base = %s", v9, v10, v11, v12, v13, a3 + 28);
  if (v8 >= v8 + 288)
    __break(0x5519u);
  v14 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t, int *))(v8 + 208))(v8, a2, a3, &v40);
  v20 = v14;
  if ((int)v14 > 18)
  {
    if ((_DWORD)v14 != 45 && (_DWORD)v14 != 19)
      goto LABEL_5;
LABEL_11:
    expert_log(a1, 2uLL, (uint64_t)"property not present: %s: %d", v15, v16, v17, v18, v19, *(_QWORD *)a3);
    goto LABEL_12;
  }
  if ((_DWORD)v14)
  {
    if ((_DWORD)v14 != 2)
    {
LABEL_5:
      expert_log(a1, 0, (uint64_t)"failed to query property: %s: %d", v15, v16, v17, v18, v19, *(_QWORD *)a3);
      goto LABEL_13;
    }
    goto LABEL_11;
  }
LABEL_12:
  expert_log(a1, 2uLL, (uint64_t)"queried property: %s => 0x%x", v15, v16, v17, v18, v19, a3 + 28);
LABEL_13:
  v29 = *(uint64_t (**)(uint64_t, uint64_t, int *))(a3 + 88);
  memset(v45, 0, sizeof(v45));
  v44 = 0u;
  v43 = 0u;
  qmemcpy(__str, "n/a", sizeof(__str));
  v41 = v40;
  if (*(_UNKNOWN **)(a3 + 48) == &_property_constraint_un)
    v30 = _expert_post_process_unconstrain_uint32;
  else
    v30 = v29;
  if ((_DWORD)v20 != 2)
  {
    if ((_DWORD)v20)
      goto LABEL_22;
    v30 = *(uint64_t (**)(uint64_t, uint64_t, int *))(a3 + 96);
    snprintf(__str, 0x40uLL, "0x%x", v40);
  }
  if (v30)
  {
    v31 = v30(a3, a2, &v41);
    if ((_DWORD)v31)
    {
      v37 = v31;
      expert_log(a1, 1uLL, (uint64_t)"transform not applied: p = %s, kind = %s: %d", v32, v33, v34, v35, v36, a3 + 28);
      v20 = v37;
      goto LABEL_23;
    }
    expert_log(a1, 2uLL, (uint64_t)"applied transform: p = %s, type = %s, xf kind = %s, value = [%s => 0x%x], error = [%d => %d]", v32, v33, v34, v35, v36, a3 + 28);
    v38 = v41;
LABEL_27:
    v20 = 0;
    *a4 = v38;
    return v20;
  }
LABEL_22:
  if (!(_DWORD)v20)
  {
    v38 = v40;
    goto LABEL_27;
  }
LABEL_23:
  if (v20 >= 0x6A)
    __panic_npx("panic: error not set to valid posix code: %d", v21, v22, v23, v24, v25, v26, v27, v20);
  return v20;
}

uint64_t expert_query_property_uint64(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  unint64_t v8;
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
  uint64_t (*v29)(uint64_t, uint64_t, uint64_t *);
  uint64_t (*v30)(uint64_t, uint64_t, uint64_t *);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;
  char __str[3];
  __int128 v43;
  __int128 v44;
  _BYTE v45[29];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v40 = 0;
  (*(void (**)(void))(a1 + 240))();
  _expert_query_resolve_debug(a1, a2, a3);
  v8 = chip_select_property_expert(a2, (_QWORD *)a3, a1);
  expert_log(a1, 2uLL, (uint64_t)"selected property expert: property = %s, selected = %s, base = %s", v9, v10, v11, v12, v13, a3 + 28);
  if (v8 >= v8 + 288)
    __break(0x5519u);
  v14 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t, uint64_t *))(v8 + 216))(v8, a2, a3, &v40);
  v20 = v14;
  if ((int)v14 > 18)
  {
    if ((_DWORD)v14 != 45 && (_DWORD)v14 != 19)
      goto LABEL_5;
LABEL_11:
    expert_log(a1, 2uLL, (uint64_t)"property not present: %s: %d", v15, v16, v17, v18, v19, *(_QWORD *)a3);
    goto LABEL_12;
  }
  if ((_DWORD)v14)
  {
    if ((_DWORD)v14 != 2)
    {
LABEL_5:
      expert_log(a1, 0, (uint64_t)"failed to query property: %s: %d", v15, v16, v17, v18, v19, *(_QWORD *)a3);
      goto LABEL_13;
    }
    goto LABEL_11;
  }
LABEL_12:
  expert_log(a1, 2uLL, (uint64_t)"queried property: %s => 0x%llx", v15, v16, v17, v18, v19, a3 + 28);
LABEL_13:
  v29 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t *))(a3 + 88);
  memset(v45, 0, sizeof(v45));
  v44 = 0u;
  v43 = 0u;
  qmemcpy(__str, "n/a", sizeof(__str));
  v41 = v40;
  if (*(_UNKNOWN **)(a3 + 48) == &_property_constraint_un)
    v30 = _expert_post_process_unconstrain_uint64;
  else
    v30 = v29;
  if ((_DWORD)v20 != 2)
  {
    if ((_DWORD)v20)
      goto LABEL_22;
    v30 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t *))(a3 + 96);
    snprintf(__str, 0x40uLL, "0x%llx", v40);
  }
  if (v30)
  {
    v31 = v30(a3, a2, &v41);
    if ((_DWORD)v31)
    {
      v37 = v31;
      expert_log(a1, 1uLL, (uint64_t)"transform not applied: p = %s, kind = %s: %d", v32, v33, v34, v35, v36, a3 + 28);
      v20 = v37;
      goto LABEL_23;
    }
    expert_log(a1, 2uLL, (uint64_t)"applied transform: p = %s, type = %s, xf kind = %s, value = [%s => 0x%llx], error = [%d => %d]", v32, v33, v34, v35, v36, a3 + 28);
    v38 = v41;
LABEL_27:
    v20 = 0;
    *a4 = v38;
    return v20;
  }
LABEL_22:
  if (!(_DWORD)v20)
  {
    v38 = v40;
    goto LABEL_27;
  }
LABEL_23:
  if (v20 >= 0x6A)
    __panic_npx("panic: error not set to valid posix code: %d", v21, v22, v23, v24, v25, v26, v27, v20);
  return v20;
}

uint64_t expert_query_property_digest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8;
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
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _OWORD v46[8];
  char v47;
  _OWORD v48[5];
  _OWORD v49[8];
  char v50;
  _OWORD v51[5];
  _BYTE v52[3];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[30];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  memset(v48, 0, sizeof(v48));
  v47 = 0;
  memset(v46, 0, sizeof(v46));
  (*(void (**)(void))(a1 + 240))();
  _expert_query_resolve_debug(a1, a2, a3);
  v8 = chip_select_property_expert(a2, (_QWORD *)a3, a1);
  expert_log(a1, 2uLL, (uint64_t)"selected property expert: property = %s, selected = %s, base = %s", v9, v10, v11, v12, v13, a3 + 28);
  if (v8 >= v8 + 288)
    __break(0x5519u);
  v14 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t, _OWORD *))(v8 + 224))(v8, a2, a3, v48);
  v21 = v14;
  if ((int)v14 > 18)
  {
    if ((_DWORD)v14 != 45 && (_DWORD)v14 != 19)
      goto LABEL_10;
    goto LABEL_8;
  }
  if (!(_DWORD)v14)
  {
LABEL_9:
    digest_print_cstr((unint64_t)v48, (unint64_t)v46, v15, v16, v17, v18, v19, v20);
    expert_log(a1, 2uLL, (uint64_t)"queried property: %s => %s", v22, v23, v24, v25, v26, a3 + 28);
    goto LABEL_11;
  }
  if ((_DWORD)v14 == 2)
  {
LABEL_8:
    expert_log(a1, 2uLL, (uint64_t)"property not present: %s: %d", v16, v17, v18, v19, v20, *(_QWORD *)a3);
    goto LABEL_9;
  }
LABEL_10:
  expert_log(a1, 0, (uint64_t)"failed to query property: %s: %d", v16, v17, v18, v19, v20, *(_QWORD *)a3);
LABEL_11:
  memset(v59, 0, sizeof(v59));
  v58 = 0u;
  v57 = 0u;
  v56 = 0u;
  v55 = 0u;
  v54 = 0u;
  v53 = 0u;
  qmemcpy(v52, "n/a", sizeof(v52));
  v50 = 0;
  memset(v49, 0, sizeof(v49));
  if ((_DWORD)v21 == 2)
  {
    if (*(_UNKNOWN **)(a3 + 48) != &_property_constraint_un)
      return 2;
    memset(v51, 0, sizeof(v51));
    digest_print_cstr((unint64_t)v48, (unint64_t)v49, v28, v29, v30, v31, v32, v33);
    expert_log(a1, 2uLL, (uint64_t)"applied transform: p = %s, type = %s, xf kind = %s, value = [%s => %s], error = [%d => %d]", v34, v35, v36, v37, v38, a3 + 28);
    digest_copy((uint64_t)v48, (uint64_t)v51, v39, v40, v41, v42, v43, v44);
LABEL_18:
    digest_copy(a4, (uint64_t)v48, v28, v29, v30, v31, v32, v33);
    return 0;
  }
  if (!(_DWORD)v21)
    goto LABEL_18;
  if (v21 >= 0x6A)
    __panic_npx("panic: error not set to valid posix code: %d", v27, v28, v29, v30, v31, v32, v33, v21);
  return v21;
}

uint64_t expert_query_property_version(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8;
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
  __int128 v29[6];
  uint64_t v30;
  __int128 v31[6];
  uint64_t v32;
  _BYTE v33[3];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[30];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v30 = 0x3E800000000;
  memset(v29, 0, sizeof(v29));
  (*(void (**)(void))(a1 + 240))();
  _expert_query_resolve_debug(a1, a2, a3);
  v8 = chip_select_property_expert(a2, (_QWORD *)a3, a1);
  expert_log(a1, 2uLL, (uint64_t)"selected property expert: property = %s, selected = %s, base = %s", v9, v10, v11, v12, v13, a3 + 28);
  if (v8 >= v8 + 288)
    __break(0x5519u);
  v14 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t, __int128 *))(v8 + 232))(v8, a2, a3, v29);
  v20 = v14;
  if ((int)v14 > 18)
  {
    if ((_DWORD)v14 != 45 && (_DWORD)v14 != 19)
      goto LABEL_10;
    goto LABEL_8;
  }
  if (!(_DWORD)v14)
  {
LABEL_9:
    expert_log(a1, 2uLL, (uint64_t)"queried property: %s => %s", v15, v16, v17, v18, v19, a3 + 28);
    goto LABEL_11;
  }
  if ((_DWORD)v14 == 2)
  {
LABEL_8:
    expert_log(a1, 2uLL, (uint64_t)"property not present: %s: %d", v15, v16, v17, v18, v19, *(_QWORD *)a3);
    goto LABEL_9;
  }
LABEL_10:
  expert_log(a1, 0, (uint64_t)"failed to query property: %s: %d", v15, v16, v17, v18, v19, *(_QWORD *)a3);
LABEL_11:
  memset(v40, 0, sizeof(v40));
  v39 = 0u;
  v38 = 0u;
  v37 = 0u;
  v36 = 0u;
  v35 = 0u;
  v34 = 0u;
  qmemcpy(v33, "n/a", sizeof(v33));
  if ((_DWORD)v20 == 2)
  {
    if (*(_UNKNOWN **)(a3 + 48) != &_property_constraint_un)
      return 2;
    v32 = 0x3E800000000;
    memset(v31, 0, sizeof(v31));
    expert_log(a1, 2uLL, (uint64_t)"applied transform: p = %s, type = %s, xf kind = %s, value = [%s => %s], error = [%d => %d]", v23, v24, v25, v26, v27, a3 + 28);
    version_copy((uint64_t)v29, v31);
LABEL_18:
    version_copy(a4, v29);
    return 0;
  }
  if (!(_DWORD)v20)
    goto LABEL_18;
  if (v20 >= 0x6A)
    __panic_npx("panic: error not set to valid posix code: %d", v21, v22, v23, v24, v25, v26, v27, v20);
  return v20;
}

uint64_t expert_get_digest_info(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(a1 + 240))();
  if (!a2)
  {
    (*(void (**)(uint64_t))(a1 + 240))(a1);
    a2 = (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 128))(a1, 0);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 96))(a1, a2, a3);
}

uint64_t expert_query_chip_boot(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(a1 + 240))();
  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 136))(a1, a2);
}

uint64_t expert_query_nonce(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  (*(void (**)(void))(a1 + 240))();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 144))(a1, a2, a3, a4);
}

uint64_t expert_entangle_nonce(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  (*(void (**)(void))(a1 + 240))();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 152))(a1, a2, a3, a4, a5);
}

uint64_t expert_read_boot_manifest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  (*(void (**)(void))(a1 + 240))();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 160))(a1, a2, a3, a4);
}

uint64_t expert_query_trust_store(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  (*(void (**)(void))(a1 + 240))();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 168))(a1, a2, a3, a4, a5);
}

uint64_t expert_read_storage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  (*(void (**)(void))(a1 + 240))();
  result = (*(uint64_t (**)(uint64_t))(a1 + 248))(a1);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 176))(a1, a2, a3, a4);
  return result;
}

uint64_t expert_runtime_boot(uint64_t a1)
{
  (*(void (**)(void))(a1 + 240))();
  return (*(uint64_t (**)(uint64_t))(a1 + 248))(a1);
}

uint64_t expert_write_storage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  (*(void (**)(void))(a1 + 240))();
  result = (*(uint64_t (**)(uint64_t))(a1 + 248))(a1);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 184))(a1, a2, a3, a4);
  return result;
}

uint64_t expert_sync_storage(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  (*(void (**)(void))(a1 + 240))();
  result = (*(uint64_t (**)(uint64_t))(a1 + 248))(a1);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 192))(a1, a2);
  return result;
}

uint64_t _expert_query_resolve_debug(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a2)
  {
    v5 = result;
    result = chip_expert(a2);
    if (result)
    {
      chip_get_name(a2);
      return expert_log(v5, 2uLL, (uint64_t)"querying property with chip expert resolution: p = %s, chip = %s, chip type = 0x%llx, chip expert authority >= 0x%llx", v6, v7, v8, v9, v10, a3 + 28);
    }
  }
  return result;
}

uint64_t expert_boot_once(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 248))();
}

uint64_t expert_read_random(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(a1 + 240))();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 256))(a1, a2, a3);
}

uint64_t expert_syscall(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (!*(_QWORD *)(a1 + 264))
    return 78;
  (*(void (**)(void))(a1 + 240))();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 264))(a1, a2, a3, a4, a5, a6);
}

uint64_t expert_lock(uint64_t a1)
{
  (*(void (**)(void))(a1 + 272))();
  return a1;
}

unint64_t expert_unlock(unint64_t *a1)
{
  unint64_t result;

  result = *a1;
  if (result)
  {
    if (result >= result + 288)
    {
      __break(0x5519u);
    }
    else
    {
      result = (*(uint64_t (**)(void))(result + 280))();
      *a1 = 0;
    }
  }
  return result;
}

uint64_t expert_get_boot_nonce_hash(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  memset(v6, 0, 24);
  memset(v5, 0, sizeof(v5));
  (*(void (**)(void))(a1 + 240))();
  result = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD *))(a1 + 144))(a1, 0, 0, v6);
  if (!(_DWORD)result)
  {
    (*(void (**)(uint64_t))(a1 + 240))(a1);
    result = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD *, _QWORD *))(a1 + 152))(a1, 0, 0, v6, v5);
    if (!(_DWORD)result)
    {
      odometer_compute_nonce_hash(a1, 0, (uint64_t)v5, a2);
      return 0;
    }
  }
  return result;
}

BOOL expert_compute_data_only(uint64_t a1)
{
  uint64_t (*v2)(uint64_t);
  unint64_t v3;
  uint64_t (*v4)(uint64_t);
  unint64_t v5;

  (*(void (**)(void))(a1 + 240))();
  v2 = *(uint64_t (**)(uint64_t))(a1 + 104);
  if (v2)
    v3 = v2(a1);
  else
    v3 = 0;
  (*(void (**)(uint64_t))(a1 + 240))(a1);
  v4 = *(uint64_t (**)(uint64_t))(a1 + 112);
  if (v4)
    v5 = v4(a1);
  else
    v5 = 6;
  return v3 < v5;
}

uint64_t expert_compute_udid(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;

  v14 = 0;
  v15 = 0;
  result = expert_query_property_uint32(a1, a2, (uint64_t)&_property_CHIP, (_DWORD *)&v14 + 1);
  if ((_DWORD)result || (result = expert_query_property_uint64(a1, a2, (uint64_t)&_property_ECID, &v15), (_DWORD)result))
  {
    if (result >= 0x6A)
      __panic_npx("panic: error not set to valid posix code: %d", v7, v8, v9, v10, v11, v12, v13, result);
  }
  else
  {
    LODWORD(v14) = 0;
    HIDWORD(v14) = bswap32(HIDWORD(v14));
    v15 = bswap64(v15);
    digest_init(a3, &v14, 0x10uLL, v9, v10, v11, v12, v13);
    return 0;
  }
  return result;
}

uint64_t expert_compute_eieiou(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v6;
  int v7;
  char *v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int8 v18;

  v6 = 0;
  v7 = 0;
  while (1)
  {
    v8 = expert_compute_eieiou_ps[v6];
    v18 = 0;
    result = expert_query_property_BOOL(a1, a2, (uint64_t)v8, &v18);
    if (result > 0x2D || ((1 << result) & 0x200000000005) == 0)
      break;
    v7 += v18;
    if (++v6 == 3)
    {
      result = 0;
      *a3 = v7;
      return result;
    }
  }
  if (result >= 0x6A)
    __panic_npx("panic: error not set to valid posix code: %d", v10, v11, v12, v13, v14, v15, v16, result);
  return result;
}

uint64_t expert_compute_eieiou_BOOL(uint64_t a1, uint64_t a2, BOOL *a3)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;

  v12 = 0;
  result = expert_compute_eieiou(a1, a2, &v12);
  if ((_DWORD)result)
  {
    if (result >= 0x6A)
      __panic_npx("panic: error not set to valid posix code: %d", v5, v6, v7, v8, v9, v10, v11, result);
  }
  else
  {
    *a3 = v12 != 0;
  }
  return result;
}

uint64_t _expert_post_process_unconstrain_BOOL(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  *a3 = 0;
  return 0;
}

uint64_t _expert_post_process_unconstrain_uint32(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  *a3 = 0;
  return 0;
}

uint64_t _expert_post_process_unconstrain_uint64(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  *a3 = 0;
  return 0;
}

uint64_t _boot_precomp_enforceable(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t name;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v21;

  if (!odometer_policy_get_chip_property(a1, *(_QWORD *)(a2 + 16)))
  {
    v12 = *(_QWORD *)a2;
    name = chip_get_name(*(_QWORD *)(a2 + 16));
    v11 = 1;
    expert_log(v12, 1uLL, (uint64_t)"odometer[%s:%s]: chip has no property for policy", v14, v15, v16, v17, v18, name);
    return v11;
  }
  if (!*(_WORD *)(a2 + 144))
  {
    v4 = *(_QWORD *)a2;
    v21 = chip_get_name(*(_QWORD *)(a2 + 16));
    v19 = "odometer[%s:%s]: manifest has no constraint for policy";
LABEL_8:
    v11 = 1;
    expert_log(v4, 1uLL, (uint64_t)v19, v6, v7, v8, v9, v10, v21);
    return v11;
  }
  v3 = *(unsigned __int16 *)(a2 + 232);
  v4 = *(_QWORD *)a2;
  v5 = chip_get_name(*(_QWORD *)(a2 + 16));
  if (!v3)
  {
    v21 = v5;
    v19 = "odometer[%s:%s]: no caller-supplied nonce hash";
    goto LABEL_8;
  }
  expert_log(v4, 1uLL, (uint64_t)"odometer[%s:%s]: policy is enforceable", v6, v7, v8, v9, v10, v5);
  return 0;
}

uint64_t _boot_precomp_enforce(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t chip_property;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t name;
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
  uint64_t v34;

  v4 = *(_QWORD *)a2;
  chip_property = odometer_policy_get_chip_property(a1, *(_QWORD *)(a2 + 16));
  if (*(_WORD *)(a2 + 232))
    v10 = a2 + 152;
  else
    v10 = 0;
  if (*(_WORD *)(a2 + 144))
    v11 = a2 + 64;
  else
    v11 = 0;
  if (property_constrain_digest(chip_property, v4, v11, v10, v6, v7, v8, v9))
  {
    v12 = *(unsigned int *)(a1 + 24);
    v13 = *(_QWORD *)a2;
    name = chip_get_name(*(_QWORD *)(a2 + 16));
    v20 = expert_log(v13, 0, (uint64_t)"odometer[%s:%s]: anti-replay violation: %d", v15, v16, v17, v18, v19, name);
    if (v12 >= 0x6A)
      __panic_npx_2(v20, v21, v22, v23, v24, v25, v26, v27, v12);
  }
  else
  {
    v28 = *(_QWORD *)a2;
    v29 = chip_get_name(*(_QWORD *)(a2 + 16));
    expert_log(v28, 1uLL, (uint64_t)"odometer[%s]: manifest is current", v30, v31, v32, v33, v34, v29);
    return 0;
  }
  return v12;
}

uint64_t _boot_sideload_enforceable(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  int v4;
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
  char name;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v3 = *(_QWORD *)(a2 + 16);
  if (odometer_policy_get_chip_property(a1, v3))
  {
    if (*(_QWORD *)(v3 + 160))
    {
      if (v3 && v3 >= v3 + 264)
        __break(0x5519u);
      name = chip_get_name(v3);
      __panic_npx("panic: illegal chip definition: anti-reply and sideload policies defined: %s", v22, v23, v24, v25, v26, v27, v28, name);
    }
    v4 = *(unsigned __int16 *)(a2 + 144);
    v5 = *(_QWORD *)a2;
    v6 = chip_get_name(*(_QWORD *)(a2 + 16));
    if (v4)
    {
      expert_log(v5, 1uLL, (uint64_t)"odometer[%s:%s]: policy is enforceable", v7, v8, v9, v10, v11, v6);
      return 0;
    }
    else
    {
      v12 = 1;
      expert_log(v5, 1uLL, (uint64_t)"odometer[%s:%s]: manifest has no constraint for policy", v7, v8, v9, v10, v11, v6);
    }
  }
  else
  {
    v13 = *(_QWORD *)a2;
    v14 = chip_get_name(*(_QWORD *)(a2 + 16));
    v12 = 1;
    expert_log(v13, 1uLL, (uint64_t)"odometer[%s:%s]: chip has no property for policy", v15, v16, v17, v18, v19, v14);
  }
  return v12;
}

uint64_t _boot_sideload_enforce(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t chip_property;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t name;
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
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
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
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v67;
  _QWORD v68[14];

  v68[13] = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)a2;
  chip_property = odometer_policy_get_chip_property(a1, *(_QWORD *)(a2 + 16));
  if (!*(_WORD *)(a2 + 144))
    __panic_npx("panic: optional not set", v6, v7, v8, v9, v10, v11, v12, v67);
  v13 = chip_property;
  if (*(_WORD *)(a2 + 232))
  {
    v14 = *(_QWORD *)a2;
    name = chip_get_name(*(_QWORD *)(a2 + 16));
    expert_log(v14, 1uLL, (uint64_t)"odometer[%s:%s]: using caller-provided nonce hash", v16, v17, v18, v19, v20, name);
    if (property_constrain_digest(v13, v4, a2 + 64, a2 + 152, v21, v22, v23, v24))
    {
      v25 = *(unsigned int *)(a1 + 24);
      v26 = *(_QWORD *)a2;
      v27 = chip_get_name(*(_QWORD *)(a2 + 16));
      expert_log(v26, 0, (uint64_t)"odometer[%s:%s]: anti-replay violation: %d", v28, v29, v30, v31, v32, v27);
      goto LABEL_7;
    }
LABEL_9:
    v59 = *(_QWORD *)a2;
    v60 = chip_get_name(*(_QWORD *)(a2 + 16));
    expert_log(v59, 1uLL, (uint64_t)"odometer[%s:%s]: manifest is current", v61, v62, v63, v64, v65, v60);
    return 0;
  }
  *(_OWORD *)v68 = xmmword_24BA98650;
  memset(&v68[2], 170, 88);
  digest_copy((uint64_t)v68, a2 + 64, v7, v8, v9, v10, v11, v12);
  v40 = *(_QWORD *)a2;
  v41 = chip_get_name(*(_QWORD *)(a2 + 16));
  expert_log(v40, 1uLL, (uint64_t)"odometer[%s:%s]: enforcing nonce hash directly", v42, v43, v44, v45, v46, v41);
  v51 = odometer_enforce_property((uint64_t *)a2, a1, v13, (unsigned __int8 *)v68, v47, v48, v49, v50);
  if (!(_DWORD)v51)
    goto LABEL_9;
  v25 = v51;
  v52 = *(_QWORD *)a2;
  v53 = chip_get_name(*(_QWORD *)(a2 + 16));
  expert_log(v52, 0, (uint64_t)"odometer[%s:%s]: anti-replay violation: %d", v54, v55, v56, v57, v58, v53);
LABEL_7:
  if (v25 >= 0x6A)
    __panic_npx("panic: error not set to valid posix code: %d", v33, v34, v35, v36, v37, v38, v39, v25);
  return v25;
}

uint64_t image4_trust_evaluate_leaf(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  _QWORD v37[2];
  _OWORD v38[3];
  uint64_t v39;

  if (!*(_WORD *)(a1 + 744))
LABEL_23:
    __panic_npx("panic: optional not set", a2, a3, a4, a5, a6, a7, a8, v36);
  v11 = *(_QWORD *)(a1 + 24);
  v10 = *(_QWORD *)(a1 + 32);
  v12 = (uint64_t *)(a1 + 752);
  v13 = *(unsigned __int16 *)(a1 + 1320);
  if (*(_WORD *)(a1 + 1320))
    v14 = a1 + 752;
  else
    v14 = 0;
  v38[0] = xmmword_251CCFDC0;
  v38[1] = *(_OWORD *)&off_251CCFDD0;
  v38[2] = xmmword_251CCFDE0;
  v39 = 0;
  v37[0] = a1;
  v37[1] = a3;
  expert_log(a2, 2uLL, (uint64_t)"performing leaf trust evaluation: coprocessor = %s, handle = %llx, evaluation type = %s", a4, a5, a6, a7, a8, **(_QWORD **)(v11 + 16));
  if (v11 && v11 >= v11 + 72)
  {
LABEL_22:
    __break(0x5519u);
    goto LABEL_23;
  }
  v15 = image4_environment_resolve(v11);
  if (!v15)
  {
    v33 = 45;
    expert_log(a2, 0, (uint64_t)"environment not supported: coprocessor = %s, handle = %llx: %d", a4, a5, a6, a7, a8, **(_QWORD **)(v11 + 16));
    return v33;
  }
  v16 = v15;
  if (!v13 || (v17 = payload_parse(v12), !(_DWORD)v17))
  {
LABEL_13:
    if (v10 < v10 + 48)
    {
      image4_trust_evaluation_prepare_manifest_callbacks(v10, (uint64_t)v38);
      manifest_set_callbacks(a1 + 152, (uint64_t)v37, (uint64_t)v38);
      v19 = manifest_parse(a1 + 152);
      if ((_DWORD)v19)
      {
        v25 = v19;
        expert_log(a2, 0, (uint64_t)"failed to parse manifest: %d", v20, v21, v22, v23, v24, v19);
        v33 = v25;
      }
      else
      {
        v34 = img4_runtime_alloc(v10);
        v33 = manifest_impose((uint64_t *)(a1 + 152), v16, v14, v34);
        if (!(_DWORD)v33)
        {
          _image4_trust_post_properties(a1, v26, v27, v28, v29, v30, v31, v32);
          return v33;
        }
      }
      goto LABEL_20;
    }
    goto LABEL_22;
  }
  v18 = v17;
  if ((_DWORD)v17 == 92 || (_DWORD)v17 == 33)
  {
    expert_log(a2, 1uLL, (uint64_t)"treating payload as non-Image4 wrapped", a4, a5, a6, a7, a8, v36);
    goto LABEL_13;
  }
  expert_log(a2, 0, (uint64_t)"failed to parse payload: %d", a4, a5, a6, a7, a8, v17);
  v33 = v18;
LABEL_20:
  if (v33 >= 0x6A)
    __panic_npx("panic: error not set to valid posix code: %d", v26, v27, v28, v29, v30, v31, v32, v33);
  return v33;
}

uint64_t _image4_trust_property_callback_BOOL(uint64_t *a1, unsigned int *a2, uint64_t a3, char a4, uint64_t *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;

  result = _image4_trust_find_record(*a5, a3, 1, *a2, (uint64_t)a5, a6, a7, a8);
  if (!result)
    return expert_log(*a1, 2uLL, (uint64_t)"no BOOLean record for tag: %s", v12, v13, v14, v15, v16, (uint64_t)(a2 + 1));
  **(_BYTE **)(result + 24) = a4;
  v17 = *(_QWORD **)(result + 40);
  if (v17)
    *v17 = *(_QWORD *)(result + 24);
  return result;
}

uint64_t _image4_trust_property_callback_integer(uint64_t *a1, unsigned int *a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;

  result = _image4_trust_find_record(*a5, a3, 2, *a2, (uint64_t)a5, a6, a7, a8);
  if (!result)
    return expert_log(*a1, 2uLL, (uint64_t)"no integer record for tag: %s", v12, v13, v14, v15, v16, (uint64_t)(a2 + 1));
  **(_QWORD **)(result + 24) = a4;
  v17 = *(_QWORD **)(result + 40);
  if (v17)
    *v17 = *(_QWORD *)(result + 24);
  return result;
}

uint64_t _image4_trust_property_callback_data(uint64_t *a1, unsigned int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  result = _image4_trust_find_record(*a6, a3, 4, *a2, a5, (uint64_t)a6, a7, a8);
  if (!result)
    return expert_log(*a1, 2uLL, (uint64_t)"no data record for tag: %s", v13, v14, v15, v16, v17, (uint64_t)(a2 + 1));
  if (a4 && !a5)
  {
    __break(0x5519u);
  }
  else
  {
    **(_QWORD **)(result + 24) = a4;
    **(_QWORD **)(result + 32) = a5;
  }
  return result;
}

void _image4_trust_violation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char name;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((*(_BYTE *)(*(_QWORD *)a4 + 8) & 1) != 0)
  {
    name = chip_get_name(a2);
    __panic_npx("panic: critical trust evaluation failure: chip = %s, p = %s, payload = %s", v5, v6, v7, v8, v9, v10, v11, name);
  }
}

uint64_t _image4_trust_post_properties(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  _QWORD v30[2];

  v9 = 0;
  v27 = a1 + 152;
  v30[1] = *MEMORY[0x24BDAC8D0];
  v10 = a1 + 1912;
  v30[0] = 0x500000004;
  v11 = 1;
  do
  {
    if (!*(_WORD *)(a1 + 744))
      __panic_npx("panic: optional not set", a2, a3, a4, a5, a6, a7, a8, v24);
    v26 = v11;
    v12 = *((unsigned int *)v30 + v9);
    v13 = *(_QWORD *)(a1 + 16);
    expert_log(v13, 2uLL, (uint64_t)"posting properties for container: 0x%x", a4, a5, a6, a7, a8, (int)v12);
    if (v12 >= 6)
LABEL_16:
      __panic_npx("panic: unreachable case: %s = 0x%llx", a2, a3, a4, a5, a6, a7, a8, (char)"p_where");
    v14 = qword_24BA986F0[(int)v12];
    Img4DecodeGetQueryForContainer(v12, a2, a3, a4, a5, a6, a7, a8);
    for (i = 0; i != 576; i += 48)
    {
      v16 = a1 + i;
      if (a1 + i + 1384 > v10)
      {
        __break(0x5519u);
LABEL_15:
        __panic_npx("panic: unsupported container for posting", a2, a3, a4, a5, a6, a7, a8, v24);
      }
      v17 = *(unsigned int *)(v16 + 1336);
      v18 = *(_DWORD *)(v16 + 1352);
      v29 = 0;
      v28 = 0;
      result = fourcc_init((uint64_t)&v28, v18);
      if (*(_QWORD *)(v16 + 1344) == v14)
      {
        v20 = 0;
        switch((int)v12)
        {
          case 0:
          case 1:
          case 2:
          case 3:
            goto LABEL_15;
          case 4:
            goto LABEL_10;
          case 5:
            if (!*(_WORD *)(a1 + 1320))
              continue;
            v20 = *(_QWORD *)(a1 + 856);
LABEL_10:
            expert_log(v13, 2uLL, (uint64_t)"posting property callback: container = %x, type = %x, tag = %s", a4, a5, a6, a7, a8, (int)v12);
            result = manifest_post_property_callback(v27, v12, v20, v17, (unsigned int *)&v28, v21, v22, v23, v25);
            break;
          case 6:
            continue;
          default:
            goto LABEL_16;
        }
      }
    }
    v11 = 0;
    v9 = 1;
  }
  while ((v26 & 1) != 0);
  return result;
}

uint64_t image4_trust_evaluate_audit(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
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
  uint64_t v40;
  _QWORD v41[2];
  _OWORD v42[3];
  uint64_t (*v43)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  if (!*(_WORD *)(a1 + 744))
LABEL_22:
    __panic_npx("panic: optional not set", a2, a3, a4, a5, a6, a7, a8, v40);
  v11 = *(_QWORD *)(a1 + 24);
  v10 = *(_QWORD *)(a1 + 32);
  v12 = (uint64_t *)(a1 + 752);
  v13 = *(unsigned __int16 *)(a1 + 1320);
  if (*(_WORD *)(a1 + 1320))
    v14 = a1 + 752;
  else
    v14 = 0;
  v42[0] = xmmword_251CCFD88;
  v42[1] = *(_OWORD *)&off_251CCFD98;
  v42[2] = xmmword_251CCFDA8;
  v43 = _image4_trust_audit;
  v41[0] = a1;
  v41[1] = a3;
  expert_log(a2, 2uLL, (uint64_t)"performing audit trust evaluation: coprocessor = %s, handle = %llx, secure boot level = %llx, evaluation type = %s", a4, a5, a6, a7, a8, **(_QWORD **)(v11 + 16));
  if (v11 && v11 >= v11 + 72)
  {
LABEL_21:
    __break(0x5519u);
    goto LABEL_22;
  }
  v15 = image4_environment_resolve(v11);
  if (!v15)
  {
    v33 = 45;
    expert_log(a2, 0, (uint64_t)"environment not supported: coprocessor = %s, handle = %llx: %d", a4, a5, a6, a7, a8, **(_QWORD **)(v11 + 16));
    return v33;
  }
  v16 = v15;
  if (!v13 || (v17 = payload_parse(v12), !(_DWORD)v17))
  {
LABEL_12:
    if (v10 < v10 + 48)
    {
      image4_trust_evaluation_prepare_manifest_callbacks(v10, (uint64_t)v42);
      manifest_set_callbacks(a1 + 152, (uint64_t)v41, (uint64_t)v42);
      v19 = manifest_parse(a1 + 152);
      if ((_DWORD)v19)
      {
        v25 = v19;
        expert_log(a2, 0, (uint64_t)"failed to parse manifest: %d", v20, v21, v22, v23, v24, v19);
        v33 = v25;
      }
      else
      {
        v33 = manifest_audit((uint64_t *)(a1 + 152), v16, v14);
        if (!(_DWORD)v33)
        {
          _image4_trust_post_properties(a1, v26, v27, v28, v29, v30, v31, v32);
          expert_log(a2, 1uLL, (uint64_t)"forcing failure after audit completion: %d", v34, v35, v36, v37, v38, 0);
          return 35;
        }
      }
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  v18 = v17;
  if ((_DWORD)v17 == 92)
  {
    expert_log(a2, 1uLL, (uint64_t)"treating payload as non-Image4 wrapped", a4, a5, a6, a7, a8, v40);
    goto LABEL_12;
  }
  expert_log(a2, 0, (uint64_t)"failed to parse payload: %d", a4, a5, a6, a7, a8, v17);
  v33 = v18;
LABEL_19:
  if (v33 >= 0x6A)
    __panic_npx("panic: error not set to valid posix code: %d", v26, v27, v28, v29, v30, v31, v32, v33);
  return v33;
}

uint64_t _image4_trust_override_decode(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return image4_auditor_interpose_decode(*(_QWORD *)(*(_QWORD *)a3 + 48), a2);
}

uint64_t _image4_trust_audit(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return image4_auditor_post(*(_QWORD *)(*(_QWORD *)a6 + 48), a2, a3, a4, a5, a6, a7, a8);
}

uint64_t image4_trust_evaluate_boot(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v10;
  unint64_t v11;
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
  uint64_t name;
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
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v47;
  _QWORD v48[2];
  _OWORD v49[3];
  uint64_t v50;

  if (!*(_WORD *)(a1 + 744))
LABEL_13:
    __panic_npx("panic: optional not set", a2, a3, a4, a5, a6, a7, a8, v47);
  v11 = *(_QWORD *)(a1 + 24);
  v10 = *(_QWORD *)(a1 + 32);
  v49[0] = xmmword_251CCFDC0;
  v49[1] = *(_OWORD *)&off_251CCFDD0;
  v49[2] = xmmword_251CCFDE0;
  v50 = 0;
  v48[0] = a1;
  v48[1] = a3;
  expert_log(a2, 2uLL, (uint64_t)"performing boot trust evaluation: coprocessor = %s, type = %s", a4, a5, a6, a7, a8, **(_QWORD **)(v11 + 16));
  if (v11 && v11 >= v11 + 72)
    goto LABEL_12;
  v12 = image4_environment_resolve(v11);
  if (!v12)
  {
    v26 = 45;
    expert_log(a2, 0, (uint64_t)"booter environment not supported: %s: %d", a4, a5, a6, a7, a8, **(_QWORD **)(v11 + 16));
    return v26;
  }
  if (v10 >= v10 + 48)
  {
LABEL_12:
    __break(0x5519u);
    goto LABEL_13;
  }
  v13 = v12;
  image4_trust_evaluation_prepare_manifest_callbacks(v10, (uint64_t)v49);
  manifest_set_callbacks(a1 + 152, (uint64_t)v48, (uint64_t)v49);
  v26 = boot_expert_boot_manifest(a2, v13, (uint64_t *)(a1 + 152), v14, v15, v16, v17, v18);
  if ((_DWORD)v26)
  {
    name = chip_get_name(v13);
    expert_log(a2, 0, (uint64_t)"manifest boot failed: %s: %d", v28, v29, v30, v31, v32, name);
    if (v26 >= 0x6A)
      __panic_npx("panic: error not set to valid posix code: %d", v33, v34, v35, v36, v37, v38, v39, v26);
  }
  else
  {
    _image4_trust_post_properties(a1, v19, v20, v21, v22, v23, v24, v25);
    v40 = chip_get_name(v13);
    expert_log(a2, 1uLL, (uint64_t)"manifest boot succeeded: %s", v41, v42, v43, v44, v45, v40);
    expert_dump(a2);
  }
  return v26;
}

uint64_t image4_trust_evaluate_normalize(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
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
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v42;
  char v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  _OWORD v47[4];
  _QWORD v48[2];
  _OWORD v49[3];
  uint64_t v50;
  __int128 *v51;

  if (!*(_WORD *)(a1 + 744))
LABEL_18:
    __panic_npx("panic: optional not set", a2, a3, a4, a5, a6, a7, a8, v43);
  v11 = *(_QWORD *)(a1 + 24);
  v10 = *(_QWORD *)(a1 + 32);
  v49[0] = xmmword_251CCFDC0;
  v49[1] = *(_OWORD *)&off_251CCFDD0;
  v49[2] = xmmword_251CCFDE0;
  v50 = 0;
  v48[0] = a1;
  v48[1] = a3;
  memset(v47, 0, sizeof(v47));
  v46 = 0;
  v44 = 0u;
  v45 = 0u;
  expert_log(a2, 2uLL, (uint64_t)"performing normalization trust evaluation: coprocessor = %s, handle = %llx, evaluation type = %s", a4, a5, a6, a7, a8, **(_QWORD **)(v11 + 16));
  if (v11 && v11 >= v11 + 72)
    goto LABEL_17;
  v12 = image4_environment_resolve(v11);
  if (!v12)
  {
    v20 = 45;
    expert_log(a2, 0, (uint64_t)"environment not supported: coprocessor = %s, handle = %llx: %d", a4, a5, a6, a7, a8, **(_QWORD **)(v11 + 16));
LABEL_9:
    v51 = &v44;
    buff_destroy(&v51);
    return v20;
  }
  if (v10 >= v10 + 48)
  {
LABEL_17:
    __break(0x5519u);
    goto LABEL_18;
  }
  v13 = v12;
  image4_trust_evaluation_prepare_manifest_callbacks(v10, (uint64_t)v49);
  manifest_set_callbacks(a1 + 152, (uint64_t)v48, (uint64_t)v49);
  v14 = manifest_parse(a1 + 152);
  if ((_DWORD)v14)
  {
    v20 = v14;
    expert_log(a2, 0, (uint64_t)"failed to parse manifest: %d", v15, v16, v17, v18, v19, v14);
    goto LABEL_12;
  }
  v21 = (_QWORD *)closure_init((uint64_t)v47, (_QWORD *)(a1 + 152), v13);
  _closure_set_unique_tags(v21, (uint64_t)"HCNBOPECDICEDIDUhcncylpenonsfunsnvrs", 9);
  v27 = closure_compute((uint64_t)v21, &v44, 0, v22, v23, v24, v25, v26);
  if (!(_DWORD)v27)
  {
    if (*(_DWORD *)(a2 + 8) == 1651470196)
      boot_expert_boot_closure(a2, (uint64_t)v21, (uint64_t)&v44);
    v20 = 0;
    *(_QWORD *)(a1 + 728) = v46;
    v42 = v45;
    *(_OWORD *)(a1 + 696) = v44;
    *(_OWORD *)(a1 + 712) = v42;
    *(_WORD *)(a1 + 736) = 1;
    *(_QWORD *)&v45 = &_buff_destructor_null;
    goto LABEL_9;
  }
  v33 = v27;
  expert_log(a2, 0, (uint64_t)"failed to compute closure: %d", v28, v29, v30, v31, v32, v27);
  v20 = v33;
LABEL_12:
  v51 = &v44;
  buff_destroy(&v51);
  if (v20 >= 0x6A)
    __panic_npx("panic: error not set to valid posix code: %d", v34, v35, v36, v37, v38, v39, v40, v20);
  return v20;
}

void image4_trust_new_buff(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  unint64_t v3;
  uint64_t v4;

  v3 = *a3;
  v4 = a3[1];
  if (v3 > v3 + v4)
    __break(0x5519u);
  else
    image4_trust_new(a1, a2, v3, v4, 0);
}

void image4_trust_new(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _WORD *v10;
  uint64_t v11;
  uint64_t v12;

  v10 = (_WORD *)_expert_alloc_type(*(_QWORD *)(a1 + 8), (uint64_t)&_image4_type_trust);
  if (v10)
  {
    _image4_trust_init(v10, a1, a2, a3, a4, a5, 1, v11);
    *(_QWORD *)(v12 + 40) = &_image4_type_trust;
  }
}

uint64_t image4_trust_set_auditor(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 48) = a2;
  return result;
}

void _image4_trust_init(_WORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 v8;
  uint64_t v9;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _OWORD v22[2];
  uint64_t v23;
  uint64_t *inited;

  v8 = a7;
  v9 = *(_QWORD *)(a2 + 8);
  v23 = 0;
  memset(v22, 0, sizeof(v22));
  if (a7 >= 2)
    __panic_npx("panic: unsupported struct version: actual = %hu, expected <= %u", a2, a3, a4, a5, a6, a7, a8, a7);
  bzero(a1, 0x788uLL);
  *a1 = v8;
  *((_QWORD *)a1 + 1) = a6;
  *((_QWORD *)a1 + 2) = v9;
  *((_QWORD *)a1 + 3) = a2;
  *((_QWORD *)a1 + 4) = a3;
  *((_QWORD *)a1 + 7) = 0;
  if (a1 + 964 < a1)
  {
    __break(0x5519u);
  }
  else
  {
    _image4_trust_add_link((uint64_t)a1, (uint64_t)a1, v16, v17, v18, v19, v20, v21);
    inited = buff_init_wrap(v22, a4, a5);
    manifest_init((uint64_t)(a1 + 76), v9, &inited);
    a1[372] = 1;
  }
}

uint64_t _image4_trust_add_link(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  BOOL v11;

  v8 = result + 144;
  v9 = *(_QWORD *)(result + 144);
  if (v9 > 4)
LABEL_9:
    __panic_npx("panic: trust chain length exceeded: %lu", a2, a3, a4, a5, a6, a7, a8, 5);
  v10 = (_QWORD *)(result + 64 + 16 * v9);
  *(_QWORD *)(result + 144) = v9 + 1;
  v11 = result + 64 > (unint64_t)v10 || (unint64_t)(v10 + 2) > v8;
  if (v11 || (*v10 = *(_QWORD *)(result + 56), v10[1] = a2, (unint64_t)v10 >= v8))
  {
    __break(0x5519u);
    goto LABEL_9;
  }
  *(_QWORD *)(result + 56) = v10;
  return result;
}

uint64_t image4_trust_set_payload(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t result;
  _OWORD v9[2];
  uint64_t v10;
  uint64_t *inited;
  uint64_t v12;
  int v13;

  v7 = *(_QWORD *)(a1 + 16);
  v13 = 0;
  v12 = 0;
  v10 = 0;
  memset(v9, 0, sizeof(v9));
  fourcc_init((uint64_t)&v12, a2);
  inited = buff_init_wrap(v9, a3, a4);
  result = payload_init(a1 + 752, v7, (unsigned int *)&v12, &inited);
  *(_WORD *)(a1 + 1320) = 1;
  return result;
}

uint64_t image4_trust_set_booter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;

  v8 = *(_QWORD **)(a1 + 32);
  if (v8[1] != *(_QWORD *)(a2 + 32))
    __panic_npx("panic: trust chaining not supported for evaluation: %s", a2, a3, a4, a5, a6, a7, a8, *v8);
  return _image4_trust_add_link(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t image4_trust_set_result_buffer(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!*(_WORD *)result)
    __panic_npx("panic: operation not supported on this structure version: actual = %hu, expected >= %hu", a2, a3, a4, a5, a6, a7, a8, 0);
  *(_QWORD *)(result + 1912) = a2;
  *(_QWORD *)(result + 1920) = a3;
  return result;
}

uint64_t image4_trust_record_property_BOOL(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;

  result = _image4_trust_init_next_record(a1, a2, 1, a3, a5, a6, a7, a8);
  *(_QWORD *)(result + 24) = a4;
  *(_QWORD *)(result + 40) = a5;
  return result;
}

uint64_t _image4_trust_init_next_record(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8;
  unint64_t v9;
  _DWORD *v10;
  BOOL v11;
  uint64_t v12;
  char vars0;

  v8 = *(_QWORD *)(a1 + 1328);
  if (v8 > 0xB)
LABEL_9:
    __panic_npx("panic: no more property record slots", a2, a3, a4, a5, a6, a7, a8, vars0);
  v9 = a1 + 1912;
  v10 = (_DWORD *)(a1 + 1336 + 48 * v8);
  v11 = a1 + 1336 > (unint64_t)v10 || (unint64_t)(v10 + 12) > v9;
  if (v11
    || (v12 = a1 + 1336 + 48 * v8,
        *(_QWORD *)(v12 + 8) = a2,
        *v10 = a3,
        *(_DWORD *)(v12 + 16) = a4,
        *(_QWORD *)(a1 + 1328) = v8 + 1,
        (unint64_t)v10 >= v9))
  {
    __break(0x5519u);
    goto LABEL_9;
  }
  return a1 + 1336 + 48 * v8;
}

uint64_t image4_trust_record_property_integer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;

  result = _image4_trust_init_next_record(a1, a2, 2, a3, a5, a6, a7, a8);
  *(_QWORD *)(result + 24) = a4;
  *(_QWORD *)(result + 40) = a5;
  return result;
}

_QWORD *image4_trust_record_property_data(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *result;

  result = (_QWORD *)_image4_trust_init_next_record(a1, a2, 4, a3, a5, a6, a7, a8);
  result[3] = a4;
  result[4] = a5;
  result[5] = 0;
  return result;
}

_QWORD *image4_trust_evaluate(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, const void *, size_t, uint64_t, uint64_t))
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  int v25;
  const void *v26;
  size_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  void *v32;
  _QWORD *result;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  _QWORD v42[8];
  __int128 v43;
  __int128 v44;
  uint64_t (*v45)(uint64_t, uint64_t, uint64_t);
  uint64_t v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  uint64_t (*v49)(uint64_t, uint64_t);
  uint64_t (*v50)(uint64_t, uint64_t);
  uint64_t (*v51)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t (*v52)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t (*v53)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t (*v54)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t (*v55)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t (*v56)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t (*v57)(uint64_t, uint64_t);
  uint64_t (*v58)(uint64_t, uint64_t, uint64_t, BOOL *, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t (*v59)(uint64_t, uint64_t, uint64_t, _DWORD *, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t (*v60)(uint64_t, uint64_t, uint64_t, _QWORD *, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t (*v61)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t (*v62)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t (*v63)();
  uint64_t (*v64)();
  uint64_t (*v65)(uint64_t, uint64_t, uint64_t);
  uint64_t (*v66)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t (*v67)();
  uint64_t (*v68)();
  _QWORD *v69;
  uint64_t v70;
  uint64_t v71;
  size_t v72[2];

  v7 = *(_QWORD **)(a1 + 16);
  v6 = *(_QWORD *)(a1 + 24);
  bzero(&v70, 0xE70uLL);
  v69 = v7;
  v42[0] = "boot";
  v42[1] = 0xAAAAAAAA626F6F74;
  v42[2] = &v69;
  v42[3] = &v69;
  v42[4] = _boot_expert_init;
  v42[5] = _boot_expert_boot;
  v42[6] = _boot_expert_logv;
  v42[7] = _boot_expert_dump;
  v43 = 0u;
  v44 = 0u;
  v45 = _boot_expert_get_digest_info;
  v46 = 0;
  v47 = 0;
  v48 = _boot_expert_get_secure_boot;
  v49 = _boot_expert_query_chip;
  v50 = _boot_expert_query_chip_boot;
  v51 = _boot_expert_query_nonce;
  v52 = _boot_expert_entangle_nonce;
  v53 = _boot_expert_read_boot_manifest;
  v54 = _boot_expert_query_trust_store;
  v55 = _boot_expert_read_storage;
  v56 = _boot_expert_write_storage;
  v57 = _boot_expert_sync_storage;
  v58 = _boot_expert_query_property_BOOL;
  v59 = _boot_expert_query_property_uint32;
  v60 = _boot_expert_query_property_uint64;
  v61 = _boot_expert_query_property_digest;
  v62 = _boot_expert_query_property_version;
  v63 = _boot_expert_init_once;
  v64 = _boot_expert_boot_once;
  v65 = _boot_expert_read_random;
  v66 = _boot_expert_syscall;
  v67 = _boot_expert_lock;
  v68 = _boot_expert_unlock;
  v15 = image4_environment_resolve(v6);
  if (v15)
  {
    if (*(_QWORD *)(a1 + 144) > 1uLL)
      v7 = v42;
    v16 = *(_QWORD **)(a1 + 56);
    if (v16)
    {
      v17 = 1;
      while (1)
      {
        v18 = v16[1];
        v19 = *(_QWORD *)(v18 + 32);
        if (v7 == v42)
        {
          if (!*(_WORD *)(v18 + 744))
            goto LABEL_38;
          v20 = *(unsigned __int16 *)(v18 + 1320);
          *(_QWORD *)(v18 + 152) = v42;
          if (v20)
            *(_QWORD *)(v18 + 752) = v42;
        }
        if (v18 >= v18 + 1928)
          goto LABEL_37;
        v21 = (*(uint64_t (**)(void))(v19 + 40))();
        if ((_DWORD)v21)
          break;
        v16 = (_QWORD *)*v16;
        ++v17;
        if (!v16)
        {
          v22 = 0;
          goto LABEL_17;
        }
      }
      v22 = v21;
      expert_log((uint64_t)v7, 0, (uint64_t)"trust evaluation failed: coprocessor = %s, sequence number = %lu, chain length = %lu: %d", v10, v11, v12, v13, v14, **(_QWORD **)(v6 + 16));
    }
    else
    {
      v22 = 0xFFFFFFFFLL;
    }
  }
  else
  {
    v22 = 45;
    expert_log((uint64_t)v7, 0, (uint64_t)"environment not supported: coprocessor = %s, handle = %llx: %d", v10, v11, v12, v13, v14, **(_QWORD **)(v6 + 16));
  }
LABEL_17:
  v23 = *(_QWORD *)(a1 + 32);
  if (*(_WORD *)(a1 + 744))
    v24 = a1 + 152;
  else
    v24 = 0;
  v25 = *(unsigned __int16 *)(a1 + 1320);
  v71 = 0;
  v72[0] = 0;
  if ((_DWORD)v22)
  {
    v26 = 0;
    v27 = 0;
    v28 = v22;
    goto LABEL_35;
  }
  if (v25)
    v29 = a1 + 752;
  else
    v29 = 0;
  v30 = image4_trust_evaluation_get_result(v23, v15, v24, v29, (uint64_t *)v72);
  v27 = v72[0];
  if (v30 > v30 + v72[0])
    goto LABEL_37;
  v26 = (const void *)v30;
  v31 = v24 + 544;
  if (!*(_WORD *)(v24 + 584))
    v31 = 0;
  v71 = v31;
  *(_WORD *)(v24 + 584) = 0;
  if (!v30 || (v32 = *(void **)(a1 + 1912)) == 0)
  {
    v28 = 0;
    goto LABEL_35;
  }
  if (*(_QWORD *)(a1 + 1920) < v27)
  {
    v26 = 0;
    v27 = 0;
    v28 = 7;
    goto LABEL_35;
  }
  memcpy(v32, v26, v27);
  if (v27 > *(_QWORD *)(a1 + 1920))
  {
LABEL_37:
    __break(0x5519u);
LABEL_38:
    __panic_npx("panic: optional not set", v8, v9, v10, v11, v12, v13, v14, v41);
  }
  v28 = 0;
  v26 = *(const void **)(a1 + 1912);
LABEL_35:
  a3(a1, v26, v27, v28, a2);
  result = buff_destroy(&v71);
  if (v22 >= 0x6A)
    __panic_npx("panic: error not set to valid posix code: %d", v34, v35, v36, v37, v38, v39, v40, v22);
  return result;
}

uint64_t *image4_trust_destroy(uint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;

  v8 = *result;
  if (*result)
  {
    if (!*(_WORD *)(v8 + 744))
      __panic_npx("panic: optional not set", a2, a3, a4, a5, a6, a7, a8, v12);
    v9 = result;
    v10 = *(_QWORD *)(v8 + 16);
    v11 = v8 + 752;
    if (!*(_WORD *)(v8 + 1320))
      v11 = 0;
    v12 = v11;
    v13 = v8 + 152;
    manifest_destroy(&v13, a2, a3, a4, a5, a6, a7, a8);
    payload_destroy(&v12);
    return (uint64_t *)_expert_dealloc_type(v10, *(_QWORD *)(v8 + 40), v9);
  }
  return result;
}

uint64_t _image4_trust_find_record(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = 1;
  switch((int)a2)
  {
    case 0:
      goto LABEL_5;
    case 1:
      v9 = 2;
      goto LABEL_5;
    case 2:
    case 3:
      return v8;
    case 4:
      v9 = 3;
      goto LABEL_5;
    case 5:
      v9 = 4;
LABEL_5:
      v10 = 0;
      break;
    default:
      goto LABEL_15;
  }
  while (1)
  {
    v11 = a1 + v10;
    if (a1 + v10 + 1384 > (unint64_t)(a1 + 1912))
    {
      __break(0x5519u);
LABEL_15:
      __panic_npx("panic: unreachable case: %s = 0x%llx", a2, a3, a4, a5, a6, a7, a8, (char)"p_where");
    }
    if (*(_DWORD *)(v11 + 1352) == (_DWORD)a4
      && *(_QWORD *)(a1 + v10 + 1344) == v9
      && *(_DWORD *)(v11 + 1336) == (_DWORD)a3)
    {
      break;
    }
    v10 += 48;
    if (v10 == 576)
      return 0;
  }
  return a1 + v10 + 1336;
}

_QWORD *image4_identifier_init(_QWORD *result, uint64_t a2)
{
  *result = a2;
  return result;
}

uint64_t image4_identifier_get_constraint(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8;

  v8 = **(_QWORD **)(*(_QWORD *)a1 + 48);
  if (v8 >= 9)
    __panic_npx_3(a1, a2, a3, a4, a5, a6, a7, a8, (char)"id4->id_p->p_constraint->pc_code");
  return qword_24BA98720[v8];
}

void __panic_npx_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  char __str[2048];
  char *v10;

  v10 = (char *)0xAAAAAAAAAAAAAAAALL;
  bzero(__str, 0x800uLL);
  v10 = &a9;
  vsnprintf(__str, 0x800uLL, "panic: unreachable case: %s = 0x%llx", &a9);
  _os_crash();
  __break(1u);
}

uint64_t image4_identifier_get_constraint_cstr(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 48) + 8);
}

uint64_t image4_identifier_get_fourcc(uint64_t a1)
{
  return *(unsigned int *)(*(_QWORD *)a1 + 24);
}

uint64_t image4_identifier_get_fourcc_cstr(_QWORD *a1)
{
  return *a1 + 28;
}

char **dylib_expert()
{
  return &__del0;
}

uint64_t dylib_expert_get_kmod_connect(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _expert_assert(a1, 1684368432, (uint64_t)"get kmod connection", a4, a5, a6, a7, a8);
  return *(unsigned int *)(*(_QWORD *)(a1 + 16) + 28);
}

size_t _darwin_el0_init(uint64_t a1)
{
  unint64_t v2;
  io_registry_entry_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  io_registry_entry_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  io_registry_entry_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  io_registry_entry_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  const __CFDictionary *v34;
  io_service_t MatchingService;
  uint64_t v36;
  const char *v37;
  int v38;
  int *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  size_t v76;
  size_t v77;
  _QWORD v78[2];
  _OWORD v79[4];
  char v80[512];
  char v81[512];
  char path[512];
  char __dst[512];
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 24);
  memcpy(__dst, "IODeviceTree:/chosen", sizeof(__dst));
  memcpy(path, "IODeviceTree:/product", sizeof(path));
  memcpy(v81, "IODeviceTree:/chosen/manifest-properties", sizeof(v81));
  memcpy(v80, "IODeviceTree:/chosen/asmb", sizeof(v80));
  v76 = 64;
  v77 = 64;
  memset(v79, 0, sizeof(v79));
  v78[0] = 0;
  v78[1] = 0;
  *(_QWORD *)v2 = os_log_create("com.apple.security.libimage4", "darwin-user");
  v3 = IORegistryEntryFromPath(0, __dst);
  *(_DWORD *)(v2 + 12) = v3;
  if (!v3)
LABEL_34:
    __panic_npx("panic: failed to get chosen node", v4, v5, v6, v7, v8, v9, v10, v75);
  v11 = IORegistryEntryFromPath(0, path);
  *(_DWORD *)(v2 + 16) = v11;
  if (!v11)
    __panic_npx("panic: failed to get product node", v12, v13, v14, v15, v16, v17, v18, v75);
  v19 = IORegistryEntryFromPath(0, v81);
  *(_DWORD *)(v2 + 20) = v19;
  if (!v19)
    __panic_npx("panic: failed to get manifest properties", v20, v21, v22, v23, v24, v25, v26, v75);
  v27 = IORegistryEntryFromPath(0, v80);
  *(_DWORD *)(v2 + 24) = v27;
  if (!v27)
    expert_log(a1, 3uLL, (uint64_t)"no asmb", v28, v29, v30, v31, v32, v75);
  v33 = v2 + 304;
  v34 = IOServiceMatching("AppleImage4");
  MatchingService = IOServiceGetMatchingService(0, v34);
  if (MatchingService)
  {
    if (v2 >= v33)
    {
LABEL_33:
      __break(0x5519u);
      goto LABEL_34;
    }
    v36 = IOServiceOpen(MatchingService, *MEMORY[0x24BDAEC58], 0, (io_connect_t *)(v2 + 28));
    if ((_DWORD)v36)
    {
      expert_log(a1, 3uLL, (uint64_t)"IOServiceOpen: %d", v6, v7, v8, v9, v10, v36);
      goto LABEL_13;
    }
    v37 = "IOServiceOpen: success";
  }
  else
  {
    v37 = "IOServiceGetMatchingService failed";
  }
  expert_log(a1, 3uLL, (uint64_t)v37, v6, v7, v8, v9, v10, v75);
LABEL_13:
  if (v2 >= v33)
    goto LABEL_33;
  if ((sysctlbyname("kern.osreleasetype", (void *)(v2 + 144), &v77, 0, 0) & 0x80000000) == 0)
    *__error() = 0;
  v38 = *__error();
  if (v38 != 2)
  {
    if (v38)
    {
      v39 = __error();
      expert_log(a1, 3uLL, (uint64_t)"sysctlbyname[kern.osreleasetype]: %d", v40, v41, v42, v43, v44, *v39);
    }
    else
    {
      *(_WORD *)(v2 + 208) = 1;
    }
  }
  if ((sysctlbyname("kern.bootsessionuuid", v79, &v76, 0, 0) & 0x80000000) == 0)
    *__error() = 0;
  v45 = *__error();
  if (v45 != 2)
  {
    if (v45)
    {
      v51 = __error();
      expert_log(a1, 3uLL, (uint64_t)"sysctlbyname[kern.bootsessionuuid]: %d", v52, v53, v54, v55, v56, *v51);
    }
    else
    {
      if (darwin_uuid_parse(v79, (unsigned __int8 *)v78))
      {
        expert_log(a1, 3uLL, (uint64_t)"failed to parse boot session uuid: %s: %d", v46, v47, v48, v49, v50, (uint64_t)v79);
        return dylib_expert_state_init(v2 + 32);
      }
      digest_init(v2 + 216, v78, 0x10uLL, v46, v47, v48, v49, v50);
      *(_WORD *)(v2 + 296) = 1;
    }
  }
  v57 = getenv("IMAGE4_LOG_FD");
  if (v57)
  {
    v58 = v57;
    *__error() = 0;
    v59 = strtol(v58, 0, 0);
    if (*__error())
      __panic_npx("panic: invalid log file descriptor", v60, v61, v62, v63, v64, v65, v66, v75);
    if (v59 >= getdtablesize())
    {
      getdtablesize();
      __panic_npx("panic: invalid log file descriptor: actual = %ld, expected <= %d", v68, v69, v70, v71, v72, v73, v74, v59);
    }
    *(_DWORD *)(v2 + 8) = v59;
  }
  return dylib_expert_state_init(v2 + 32);
}

uint64_t _darwin_el0_boot()
{
  return 0;
}

uint64_t _darwin_el0_logv(uint64_t a1, unint64_t a2, char *a3, va_list a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t result;
  int v11;
  const char *v12;
  char *v13[3];
  va_list v14;
  uint64_t v15;
  _OWORD v16[5];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v14 = a4;
  v9 = *(_QWORD *)(a1 + 16);
  if (*(_BYTE *)(v9 + 32) || *(_QWORD *)(v9 + 48))
    return dylib_restoreos_logv(a2, a3, a4, (uint64_t)a4, a5, a6, a7, a8);
  if ((*(_DWORD *)(v9 + 8) & 0x80000000) == 0)
  {
    memset(v13, 0, sizeof(v13));
    if (vasprintf(v13, a3, v14) < 0)
      _darwin_el0_logv_cold_1(&v15, v16);
    v11 = *(_DWORD *)(v9 + 8);
    v12 = getprogname();
    dprintf(v11, "%s: %s\n", v12, v13[0]);
    free(v13[0]);
  }
  switch(a2)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
      result = os_log_with_args();
      break;
    default:
      __panic_npx("panic: unreachable case: %s = 0x%llx", 16, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, (char)"lvl");
  }
  return result;
}

uint64_t _darwin_el0_dump(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  int v11;
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
  _BYTE v28[3];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _WORD v35[15];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v10 = *(_QWORD *)(a1 + 16);
  v11 = *(unsigned __int16 *)(v10 + 296);
  memset(v35, 0, sizeof(v35));
  v34 = 0u;
  v33 = 0u;
  v32 = 0u;
  v31 = 0u;
  v30 = 0u;
  v29 = 0u;
  qmemcpy(v28, "n/a", sizeof(v28));
  if (v11)
    digest_print_cstr(v10 + 216, (unint64_t)v28, a3, a4, a5, a6, a7, a8);
  expert_log(a1, a2, (uint64_t)"%6s  %-36s : 0x%llx", a4, a5, a6, a7, a8, (uint64_t)&unk_24BAA271F);
  expert_log(a1, a2, (uint64_t)"%6s  %-36s : 0x%llx", v12, v13, v14, v15, v16, (uint64_t)&unk_24BAA271F);
  expert_log(a1, a2, (uint64_t)"%6s  %-36s : %s", v17, v18, v19, v20, v21, (uint64_t)&unk_24BAA271F);
  return expert_log(a1, a2, (uint64_t)"%6s  %-36s : %s", v22, v23, v24, v25, v26, (uint64_t)&unk_24BAA271F);
}

void *_darwin_el0_alloc_type(uint64_t a1, uint64_t a2)
{
  uint64_t handle;
  uint64_t size;
  int64_t v5;
  void *result;
  uint64_t v7;
  _OWORD v8[5];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  handle = type_get_handle(a2);
  size = type_get_size(a2);
  if (!handle)
    return 0;
  v5 = size;
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      result = malloc_type_calloc(1uLL, v5, 0x1B044E25uLL);
      if (result)
        break;
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    result = malloc_type_calloc(1uLL, v5, 0x61D5536CuLL);
    if (result && v5 <= 0)
      goto LABEL_10;
    if (!result)
      goto LABEL_11;
  }
  if (v5 < 1)
  {
LABEL_10:
    __break(0x5519u);
LABEL_11:
    _darwin_el0_alloc_type_cold_1(&v7, v8);
  }
  return result;
}

void _darwin_el0_dealloc_type(int a1, int a2, void *a3)
{
  free(a3);
}

void *_darwin_el0_alloc_data(uint64_t a1, int64_t a2)
{
  void *result;
  uint64_t v4;
  _OWORD v5[5];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      result = malloc_type_calloc(1uLL, a2, 0x1B044E25uLL);
      if (result)
        break;
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    result = malloc_type_calloc(1uLL, a2, 0x61D5536CuLL);
    if (a2 <= 0 && result)
LABEL_8:
      __break(0x5519u);
    if (!result)
      _darwin_el0_alloc_type_cold_1(&v4, v5);
  }
  if (a2 < 1)
    goto LABEL_8;
  return result;
}

void _darwin_el0_dealloc_data(int a1, int a2, void *a3)
{
  free(a3);
}

uint64_t _darwin_el0_get_digest_info(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t _darwin_el0_get_exception_level()
{
  return 1;
}

uint64_t _darwin_el0_get_unprivileged_limit()
{
  return 6;
}

uint64_t _darwin_el0_get_secure_boot(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  io_registry_entry_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;

  v10 = *(_DWORD *)(*(_QWORD *)(a1 + 16) + 24);
  v20 = 0;
  if (v10)
  {
    darwin_read_iokit_u32(v10, "lp-smb0", (_DWORD *)&v20 + 1);
    darwin_read_iokit_u32(v10, "lp-smb1", &v20);
    v11 = (v20 + HIDWORD(v20));
    expert_log(a1, 2uLL, (uint64_t)"secure boot state: smb0 = %#x, smb1 = %#x, secure boot = %#x", v12, v13, v14, v15, v16, HIDWORD(v20));
    if (v11 >= 3)
      __panic_npx("panic: invalid secure boot state: %#x", v17, v18, a4, a5, a6, a7, a8, v11);
  }
  else
  {
    v11 = 0;
  }
  expert_log(a1, 2uLL, (uint64_t)"returning secure boot state: %#llx", a4, a5, a6, a7, a8, v11);
  *a2 = v11;
  return 0;
}

uint64_t _darwin_el0_query_chip(uint64_t a1, uint64_t a2)
{
  io_registry_entry_t v4;
  __int128 v5;
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
  const char *v18;
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
  char *v34;
  BOOL v36;
  __int16 v37;
  _OWORD v38[4];
  _OWORD v39[2];
  _QWORD v40[2];

  v40[1] = *MEMORY[0x24BDAC8D0];
  v4 = *(_DWORD *)(*(_QWORD *)(a1 + 16) + 12);
  v39[0] = xmmword_251CCFE60;
  v39[1] = *(_OWORD *)&off_251CCFE70;
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v38[2] = v5;
  v38[3] = v5;
  v38[0] = v5;
  v38[1] = v5;
  v37 = 0;
  v36 = 0;
  darwin_read_iokit_cstr(v4, "crypto-hash-method", (char *)v38);
  expert_log(a1, 2uLL, (uint64_t)"crypto method: %s", v6, v7, v8, v9, v10, (uint64_t)v38);
  if (LODWORD(v38[0]) == 828467315)
  {
    v18 = 0;
  }
  else
  {
    if (*(_QWORD *)&v38[0] != 0x3438332D32616873)
      __panic_npx("panic: non-sensical crypto hash method: %s", v11, v12, v13, v14, v15, v16, v17, (char)v38);
    v18 = "2spa";
  }
  *(_QWORD *)&v39[0] = v18;
  darwin_read_iokit_BOOL(v4, "use-ddi-secure-boot", (BOOL *)&v37 + 1);
  if (HIBYTE(v37))
  {
    expert_log(a1, 2uLL, (uint64_t)"%s: %#x", v19, v20, v21, v22, v23, (uint64_t)"use-ddi-secure-boot");
    *(_QWORD *)&v39[0] = "2amv";
  }
  darwin_read_iokit_BOOL(v4, "allow-ecid-mismatch", (BOOL *)&v37);
  if ((_BYTE)v37)
  {
    expert_log(a1, 2uLL, (uint64_t)"%s: %#x", v24, v25, v26, v27, v28, (uint64_t)"allow-ecid-mismatch");
    *(_QWORD *)&v39[0] = "namv";
  }
  darwin_read_iokit_BOOL(v4, "uses-avp-root-ca", &v36);
  if (v36)
  {
    expert_log(a1, 2uLL, (uint64_t)"%s: %#x", v29, v30, v31, v32, v33, (uint64_t)"uses-avp-root-ca");
    *(_QWORD *)&v39[0] = "3amv";
  }
  v34 = (char *)v39 + 8 * a2;
  if (v34 >= (char *)v40 || v34 < (char *)v39)
    __break(0x5519u);
  return *(_QWORD *)v34;
}

uint64_t _darwin_el0_query_chip_boot(uint64_t a1, uint64_t a2)
{
  return chip_bin_check((uint64_t)&_darwin_el0_query_chip_boot_bin, a2, 0x2Du);
}

uint64_t _darwin_el0_query_nonce()
{
  return 2;
}

uint64_t _darwin_el0_entangle_nonce()
{
  return 78;
}

unint64_t _darwin_el0_read_boot_manifest(uint64_t a1, const char *a2, void *a3, size_t *a4)
{
  return darwin_read_iokit_node(*(_DWORD *)(*(_QWORD *)(a1 + 16) + 20), a2, a3, a4);
}

void _darwin_el0_query_trust_store(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, _QWORD *a5)
{
  unint64_t v5;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _WORD *v14;
  _QWORD *v15;
  unint64_t v16;
  uint64_t v17;
  unsigned int v19;
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
  uint64_t *v33;
  _OWORD v34[2];
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  _OWORD v39[5];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(a1 + 24);
  v36 = 0x4000;
  v35 = 0;
  memset(v34, 0, sizeof(v34));
  v33 = 0;
  if (a2)
  {
    *(_QWORD *)&v39[0] = v34;
    buff_destroy(v39);
    return;
  }
  v9 = malloc_type_malloc(0x4000uLL, 0x18EC0261uLL);
  if (!v9)
    _darwin_el0_query_trust_store_cold_1(&v38, v39);
  v37 = v9;
  buff_init_xfer(v34, (uint64_t *)&v37, 0x4000, (uint64_t)&_buff_destructor_free, 0);
  os_unfair_lock_lock((os_unfair_lock_t)(v5 + 92));
  v14 = (_WORD *)(v5 + 136);
  v15 = (_QWORD *)(v5 + 96);
  if (*(_WORD *)(v5 + 136))
    goto LABEL_5;
  v20 = darwin_syscall_image_copy_active(a1, 0, (uint64_t *)v34, &v36, v10, v11, v12, v13);
  if (!(_DWORD)v20)
  {
    v33 = (uint64_t *)v34;
    if (v5 >= v5 + 304)
      goto LABEL_18;
    v15 = buff_xfer((_QWORD *)(v5 + 96), &v33);
    *v14 = 1;
    v14 = v15 + 5;
LABEL_5:
    v16 = *v15;
    v17 = v15[1];
    if (v15 + 5 <= (_QWORD *)v14 && v16 <= *v15 + v17)
    {
      v19 = 0;
      *a4 = v16;
      *a5 = v17;
      goto LABEL_12;
    }
LABEL_18:
    __break(0x5519u);
    return;
  }
  v19 = v20;
  expert_log(a1, 0, (uint64_t)"failed to copy active cryptex0 root: %d", v21, v22, v23, v24, v25, v20);
LABEL_12:
  os_unfair_lock_assert_owner((const os_unfair_lock *)(v5 + 92));
  os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 92));
  *(_QWORD *)&v39[0] = v34;
  buff_destroy(v39);
  if (v19 >= 0x6A)
    __panic_npx("panic: error not set to valid posix code: %d", v26, v27, v28, v29, v30, v31, v32, v19);
}

uint64_t _darwin_el0_read_storage()
{
  return 78;
}

uint64_t _darwin_el0_write_storage()
{
  return 78;
}

uint64_t _darwin_el0_sync_storage()
{
  return 78;
}

unint64_t _darwin_el0_query_property_BOOL(uint64_t a1, uint64_t a2, uint64_t a3, BOOL *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  io_registry_entry_t v10;
  uint64_t v11;
  int v13;
  const char *v14;
  _BOOL4 v15;
  unint64_t result;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  size_t v25;
  _BOOL4 v26;

  v10 = *(_DWORD *)(*(_QWORD *)(a1 + 16) + 12);
  v26 = 0;
  v25 = 4;
  v11 = *(_QWORD *)(a3 + 16);
  v13 = 0;
  v14 = "certificate-production-status";
  switch(v11)
  {
    case 5:
      goto LABEL_14;
    case 6:
      v13 = 0;
      v14 = "certificate-security-mode";
      goto LABEL_14;
    case 7:
      v13 = 0;
      v14 = "effective-production-status-ap";
      goto LABEL_14;
    case 8:
      v13 = 0;
      v14 = "effective-security-mode-ap";
      goto LABEL_14;
    case 9:
    case 10:
    case 16:
    case 17:
      goto LABEL_22;
    case 11:
      v14 = "mix-n-match-prevention-status";
      v13 = 1;
      goto LABEL_14;
    case 12:
      result = expert_compute_eieiou(a1, a2, &v26);
      if ((_DWORD)result)
        goto LABEL_15;
      v15 = v26;
      goto LABEL_19;
    case 13:
      v13 = 0;
      v14 = "internal-use-only-unit";
      goto LABEL_14;
    case 14:
      v13 = 0;
      v14 = "engineering-use-only-unit";
      goto LABEL_14;
    case 15:
      v13 = 0;
      v14 = "factory-prerelease-global-trust";
      goto LABEL_14;
    case 18:
      v13 = 0;
      v14 = "research-enabled";
LABEL_14:
      result = darwin_read_iokit_node(v10, v14, &v26, &v25);
      if ((_DWORD)result)
      {
LABEL_15:
        if (result >= 0x6A)
          __panic_npx("panic: error not set to valid posix code: %d", v17, v18, v19, v20, v21, v22, v23, result);
      }
      else
      {
        v15 = v26;
        if (v13)
          v24 = !v26;
        else
LABEL_19:
          v24 = v15;
        result = 0;
        *a4 = v24;
      }
      return result;
    default:
      if (v11 != 32)
LABEL_22:
        __panic_npx("panic: illegal %s property: %s", (uint64_t)"certificate-production-status", a3, (uint64_t)a4, a5, a6, a7, a8, *(_QWORD *)(*(_QWORD *)(a3 + 40) + 8));
      v15 = expert_compute_data_only(a1);
      goto LABEL_19;
  }
}

unint64_t _darwin_el0_query_property_uint32(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  unint64_t result;
  io_registry_entry_t *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  size_t v21;
  int v22;

  v22 = 0;
  v21 = 4;
  v9 = *(_QWORD *)(a3 + 16);
  result = 45;
  switch(v9)
  {
    case 0:
      v12 = (io_registry_entry_t *)(*(_QWORD *)(a1 + 16) + 12);
      v13 = "chip-epoch";
      goto LABEL_10;
    case 1:
      v12 = (io_registry_entry_t *)(*(_QWORD *)(a1 + 16) + 12);
      v13 = "board-id";
      goto LABEL_10;
    case 2:
      v12 = (io_registry_entry_t *)(*(_QWORD *)(a1 + 16) + 12);
      v13 = "chip-id";
      goto LABEL_10;
    case 3:
      v12 = (io_registry_entry_t *)(*(_QWORD *)(a1 + 16) + 12);
      v13 = "security-domain";
      goto LABEL_10;
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
      goto LABEL_4;
    case 19:
      v12 = (io_registry_entry_t *)(*(_QWORD *)(a1 + 16) + 12);
      v13 = "esdm-fuses";
      goto LABEL_10;
    case 20:
    case 21:
    case 22:
    case 24:
      return result;
    case 23:
      v12 = (io_registry_entry_t *)(*(_QWORD *)(a1 + 16) + 16);
      v13 = "cryptex1-product-class";
LABEL_10:
      result = darwin_read_iokit_node(*v12, v13, &v22, &v21);
      if ((_DWORD)result)
      {
        if (result >= 0x6A)
          __panic_npx("panic: error not set to valid posix code: %d", v14, v15, v16, v17, v18, v19, v20, result);
      }
      else
      {
        *a4 = v22;
      }
      return result;
    default:
      if (v9 != 29)
LABEL_4:
        __panic_npx("panic: illegal %s property: %s", a2, a3, (uint64_t)a4, a5, a6, a7, a8, *(_QWORD *)(*(_QWORD *)(a3 + 40) + 8));
      return result;
  }
  return result;
}

unint64_t _darwin_el0_query_property_uint64(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  io_registry_entry_t *v10;
  const char *v11;
  unint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  size_t v20;
  uint64_t v21;

  v20 = 8;
  v21 = 0;
  v9 = *(_QWORD *)(a3 + 16);
  if (v9 == 27)
  {
    v10 = (io_registry_entry_t *)(*(_QWORD *)(a1 + 16) + 24);
    v11 = "lp-stng";
  }
  else
  {
    if (v9 != 4)
      __panic_npx("panic: illegal %s property: %s", a2, a3, (uint64_t)a4, a5, a6, a7, a8, *(_QWORD *)(*(_QWORD *)(a3 + 40) + 8));
    v10 = (io_registry_entry_t *)(*(_QWORD *)(a1 + 16) + 12);
    v11 = "unique-chip-id";
  }
  result = darwin_read_iokit_node(*v10, v11, &v21, &v20);
  if ((_DWORD)result)
  {
    if (result >= 0x6A)
      __panic_npx("panic: error not set to valid posix code: %d", v13, v14, v15, v16, v17, v18, v19, result);
  }
  else
  {
    *a4 = v21;
  }
  return result;
}

unint64_t _darwin_el0_query_property_digest(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11;
  io_registry_entry_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  size_t v24;
  uint64_t v25;
  unint64_t result;
  size_t v27;
  size_t __n;
  _QWORD v29[2];
  _OWORD v30[3];
  _OWORD v31[5];
  _OWORD v32[4];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v11 = *(_QWORD *)(a1 + 16);
  v12 = *(_DWORD *)(v11 + 12);
  memset(v32, 0, sizeof(v32));
  __n = 64;
  v29[0] = 0;
  memset(v31, 0, sizeof(v31));
  memset(v30, 0, 38);
  v27 = 38;
  v29[1] = 0;
  v13 = *(_QWORD *)(a3 + 16);
  if (v13 > 24)
  {
    v14 = 45;
    switch(v13)
    {
      case 25:
        v12 = *(_DWORD *)(v11 + 24);
        v15 = "lp-spih";
        goto LABEL_18;
      case 26:
        return v14;
      case 28:
        v25 = darwin_copy_kcinstall_nonce_hash(a1, a2);
        if (!(_DWORD)v25)
          goto LABEL_25;
        v14 = v25;
        if ((_DWORD)v25 == 96)
        {
          result = darwin_syscall_nonce_copy_hash(a1, (int *)a2, -1, v32, &__n);
          goto LABEL_19;
        }
        expert_log(a1, 0, (uint64_t)"failed to copy kcinstall nonce hash: %d", v18, v19, v20, v21, v22, v25);
        if (!(_DWORD)v14)
          goto LABEL_25;
        goto LABEL_20;
      case 30:
        if (*(_WORD *)(v11 + 296))
        {
          digest_copy((uint64_t)v31, v11 + 216, a3, a4, a5, a6, a7, a8);
          goto LABEL_25;
        }
        v14 = 2;
        break;
      default:
        goto LABEL_30;
    }
    return v14;
  }
  if (v13 == 9)
  {
    v14 = expert_compute_udid(a1, (uint64_t)a2, (uint64_t)v31);
    if (!(_DWORD)v14)
      goto LABEL_25;
    goto LABEL_20;
  }
  if (v13 != 10)
  {
    if (v13 != 16)
LABEL_30:
      __panic_npx("panic: illegal %s property: %s", (uint64_t)a2, a3, a4, a5, a6, a7, a8, *(_QWORD *)(*(_QWORD *)(a3 + 40) + 8));
    v14 = darwin_read_iokit_node(v12, "apfs-preboot-uuid", v30, &v27);
    if (!(_DWORD)v14)
    {
      v14 = darwin_uuid_parse(v30, (unsigned __int8 *)v29);
      if (!(_DWORD)v14)
      {
        v23 = v29;
        v24 = 16;
LABEL_24:
        digest_init((uint64_t)v31, v23, v24, v18, v19, v20, v21, v22);
LABEL_25:
        digest_copy(a4, (uint64_t)v31, v17, v18, v19, v20, v21, v22);
        return 0;
      }
    }
LABEL_20:
    if (v14 >= 0x6A)
      __panic_npx("panic: error not set to valid posix code: %d", v16, v17, v18, v19, v20, v21, v22, v14);
    return v14;
  }
  v15 = "boot-manifest-hash";
LABEL_18:
  result = darwin_read_iokit_node(v12, v15, v32, &__n);
LABEL_19:
  v14 = result;
  if ((_DWORD)result)
    goto LABEL_20;
  v24 = __n;
  if (__n <= 0x40)
  {
    v23 = v32;
    goto LABEL_24;
  }
  __break(0x5519u);
  return result;
}

uint64_t _darwin_el0_query_property_version(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t boot_manifest;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  size_t v19;
  __int128 v20[6];
  uint64_t v21;
  char v22[72];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  memset(v22, 0, 64);
  v19 = 64;
  v21 = 0x3E800000000;
  memset(v20, 0, sizeof(v20));
  if (*(_QWORD *)(a3 + 16) != 17)
    __panic_npx("panic: illegal %s property: %s", a2, a3, a4, a5, a6, a7, a8, *(_QWORD *)(*(_QWORD *)(a3 + 40) + 8));
  boot_manifest = expert_read_boot_manifest(a1, (uint64_t)"love", (uint64_t)v22, (uint64_t)&v19);
  v17 = boot_manifest;
  if ((_DWORD)boot_manifest)
  {
    if (boot_manifest >= 0x6A)
      __panic_npx("panic: error not set to valid posix code: %d", v10, v11, v12, v13, v14, v15, v16, boot_manifest);
  }
  else
  {
    version_init((uint64_t)v20, v22, v19);
    version_copy(a4, v20);
  }
  return v17;
}

uint64_t _darwin_el0_init_once(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = result;
  v3 = 0;
  if (_darwin_el0_init_once_once != -1)
  {
    v1 = result;
    dispatch_once_f(&_darwin_el0_init_once_once, &v2, (dispatch_function_t)_darwin_el0_init_once_tramp);
    result = v3;
    if (v3)
    {
      expert_init(v3);
      return expert_dump(v1);
    }
  }
  return result;
}

uint64_t _darwin_el0_boot_once(uint64_t a1)
{
  if (_darwin_el0_boot_once_once != -1)
    dispatch_once_f(&_darwin_el0_boot_once_once, &__del0, (dispatch_function_t)_darwin_el0_boot_once_tramp);
  return *(unsigned int *)(*(_QWORD *)(a1 + 16) + 88);
}

uint64_t _darwin_el0_syscall(uint64_t a1, uint64_t a2, void *a3, size_t a4, void *a5, size_t *a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
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
  size_t v28;

  v27 = *(_QWORD *)a2;
  v28 = *a6;
  result = expert_log(a1, 2uLL, (uint64_t)"syscall: %s", a4, (uint64_t)a5, (uint64_t)a6, a7, a8, v27);
  if (v28 > *a6)
  {
    __break(0x5519u);
  }
  else
  {
    if (!sysctl((int *)(a2 + 12), *(_DWORD *)(a2 + 32), a5, &v28, a3, a4))
      return 0;
    v15 = *__error();
    dylib_expert_record_trap_error(a1, a2, (uint64_t)"sysctl", v15, v16, v17, v18, v19);
    if (v15 >= 0x6A)
      __panic_npx("panic: error not set to valid posix code: %d", v20, v21, v22, v23, v24, v25, v26, v15);
    return v15;
  }
  return result;
}

uint64_t _darwin_el0_init_once_tramp(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  a1[1] = (uint64_t)generic_expert();
  return dylib_init(v1);
}

uint64_t _darwin_el0_boot_once_tramp(uint64_t a1)
{
  uint64_t result;

  result = expert_boot(a1);
  *(_DWORD *)(*(_QWORD *)(a1 + 24) + 88) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_0()
{
  return _os_log_send_and_compose_impl();
}

uint64_t OUTLINED_FUNCTION_2()
{
  return _os_crash_msg();
}

double OUTLINED_FUNCTION_3(_QWORD *a1, _OWORD *a2)
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

BOOL OUTLINED_FUNCTION_4(NSObject *a1)
{
  return os_log_type_enabled(a1, OS_LOG_TYPE_ERROR);
}

char *OUTLINED_FUNCTION_5(int *a1)
{
  return strerror(*a1);
}

uint64_t OUTLINED_FUNCTION_6()
{
  return _os_log_send_and_compose_impl();
}

void _prepare_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t boot_nonce;
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
  size_t __n;
  _QWORD v19[3];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(*(_QWORD *)a3 + 24);
  v5 = *(_QWORD *)(v4 + 8);
  v20[0] = 0;
  v20[1] = 0;
  __n = 0;
  memset(v19, 0, sizeof(v19));
  boot_nonce = image4_environment_callout_query_boot_nonce(v4, (uint64_t)v20, (uint64_t)&__n);
  if ((_DWORD)boot_nonce)
  {
    if ((_DWORD)boot_nonce != 45)
      expert_log(v5, 0, (uint64_t)"failed to get nonce digest from callback: %d", v7, v8, v9, v10, v11, boot_nonce);
  }
  else if (__n > 0x10)
  {
    __break(0x5519u);
  }
  else
  {
    nonce_init(v19, v20, __n, v7, v8, v9, v10, v11);
    odometer_prepare_nonce(a2, v19, v12, v13, v14, v15, v16, v17);
  }
}

uint64_t _get_constraint_mask_1()
{
  return 0;
}

uint64_t _extract_payload_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t result;
  _OWORD v7[2];
  uint64_t v8;

  v8 = 0;
  memset(v7, 0, sizeof(v7));
  payload_get_decoded_bytes(a4, (uint64_t)v7);
  result = *(_QWORD *)&v7[0];
  *a5 = *((_QWORD *)&v7[0] + 1);
  return result;
}

uint64_t img4_chip_init_from_buff(uint64_t a1, unint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  result = img4_runtime_get_expert(_img4_runtime_default);
  if (a2 == 384)
  {
    v12 = result;
    v13 = _expert_alloc_type(result, (uint64_t)&_image4_type_custom_chip);
    if (!v13)
      goto LABEL_8;
    a1 = v13;
    *(_QWORD *)(v13 + 720) = v12;
    return a1;
  }
  if (a2)
  {
    *(_QWORD *)(a1 + 720) = 0;
    if (a2 <= 0x2D7)
LABEL_8:
      __panic_npx("panic: object overflows buffer: object = chip, length = %lu, required = %lu", v5, v6, v7, v8, v9, v10, v11, a2);
    return a1;
  }
  __break(0x5519u);
  return result;
}

uint64_t img4_chip_select_categorized_ap()
{
  return 0;
}

unint64_t img4_chip_select_cryptex1_boot()
{
  unint64_t result;
  uint64_t v1;
  char name;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  result = img4_chip_select_effective_ap();
  v1 = *(_QWORD *)(result + 104);
  if (v1)
    return *(_QWORD *)v1;
  if (result < result + 264)
  {
    name = chip_get_name(result);
    __panic_npx("panic: no cryptex1 guests for %s", v3, v4, v5, v6, v7, v8, v9, name);
  }
  __break(0x5519u);
  return result;
}

unint64_t img4_chip_select_cryptex1_preboot()
{
  unint64_t result;
  uint64_t v1;
  char name;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  result = img4_chip_select_effective_ap();
  v1 = *(_QWORD *)(result + 104);
  if (v1)
    return *(_QWORD *)(v1 + 16);
  if (result < result + 264)
  {
    name = chip_get_name(result);
    __panic_npx("panic: no cryptex1 guests for %s", v3, v4, v5, v6, v7, v8, v9, name);
  }
  __break(0x5519u);
  return result;
}

unint64_t img4_chip_get_cryptex1_boot(unint64_t result)
{
  uint64_t v1;
  char name;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = *(_QWORD *)(result + 104);
  if (v1)
    return *(_QWORD *)v1;
  if (result + 264 >= result)
  {
    name = chip_get_name(result);
    __panic_npx("panic: no cryptex1 guests for %s", v3, v4, v5, v6, v7, v8, v9, name);
  }
  __break(0x5519u);
  return result;
}

unint64_t img4_chip_get_cryptex1_boot_proposal(unint64_t result)
{
  uint64_t v1;
  char name;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = *(_QWORD *)(result + 104);
  if (v1)
    return *(_QWORD *)(v1 + 8);
  if (result + 264 >= result)
  {
    name = chip_get_name(result);
    __panic_npx("panic: no cryptex1 guests for %s", v3, v4, v5, v6, v7, v8, v9, name);
  }
  __break(0x5519u);
  return result;
}

uint64_t img4_chip_instantiate(uint64_t a1, uint64_t a2)
{
  uint64_t expert;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char **v13;
  uint64_t v14;
  char **v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _OWORD v19[5];
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  expert = img4_runtime_get_expert(_img4_runtime_default);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  memset(v19, 0, sizeof(v19));
  v16 = 0u;
  v17 = 0u;
  result = expert_runtime_boot(expert);
  if ((_DWORD)result
    || (result = chip_instance_instantiate((unint64_t)&v16, expert, a1, v8, v9, v10, v11, v12), (_DWORD)result))
  {
    if (result >= 0x6A)
      __panic_npx("panic: error not set to valid posix code: %d", v6, v7, v8, v9, v10, v11, v12, result);
  }
  else
  {
    *(_QWORD *)(a2 + 8) = a1;
    *(_QWORD *)(a2 + 16) = 0;
    *(_OWORD *)(a2 + 24) = v17;
    *(_QWORD *)(a2 + 40) = v18;
    *(_DWORD *)(a2 + 48) = DWORD2(v18);
    img4_dgst_init_from_digest(a2 + 64, (uint64_t)v19, v7, v8, v9, v10, v11, v12);
    v13 = 0;
    *(_OWORD *)(a2 + 128) = v20;
    *(_BYTE *)(a2 + 52) = BYTE12(v21);
    *(_BYTE *)(a2 + 54) = BYTE13(v21);
    *(_BYTE *)(a2 + 60) = BYTE14(v21);
    *(_DWORD *)(a2 + 56) = DWORD2(v21);
    *(_BYTE *)(a2 + 53) = HIBYTE(v21);
    do
    {
      v14 = __omit_map[(_QWORD)v13];
      if (v14)
      {
        v15 = property_find_from_expert(v13);
        if (!v15 || ((unint64_t)v15[9] & *((_QWORD *)&v16 + 1)) == 0)
          *(_QWORD *)(a2 + 16) = v14;
      }
      v13 = (char **)((char *)v13 + 1);
    }
    while (v13 != (char **)34);
    return 0;
  }
  return result;
}

uint64_t img4_chip_custom(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const void *v8;
  size_t v9;
  unint64_t v12;
  unint64_t v13;
  char **v14;
  uint64_t v15;
  char **v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = *(const void **)(a1 + 8);
  memset(&v24[8], 0, 120);
  v22 = (unint64_t)v8;
  v23 = *(_OWORD *)(a1 + 24);
  *(_QWORD *)v24 = *(_QWORD *)(a1 + 40);
  *(_DWORD *)&v24[8] = *(_DWORD *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 72);
  if (v9 >= 0x31)
    goto LABEL_10;
  v12 = a2 + 264;
  v13 = a2 + 720;
  digest_init((uint64_t)&v24[16], (const void *)(a1 + 80), v9, a4, a5, a6, a7, a8);
  v14 = 0;
  *(_OWORD *)&v24[96] = *(_OWORD *)(a1 + 128);
  v24[124] = *(_BYTE *)(a1 + 52);
  v24[125] = *(_BYTE *)(a1 + 54);
  v24[126] = *(_BYTE *)(a1 + 60);
  *(_DWORD *)&v24[120] = *(_DWORD *)(a1 + 56);
  v24[127] = *(_BYTE *)(a1 + 53);
  do
  {
    v15 = __omit_map[(_QWORD)v14];
    if (v15)
    {
      v16 = property_find_from_expert(v14);
      if (v16)
      {
        if ((*(_QWORD *)(a1 + 16) & v15) == 0)
          *((_QWORD *)&v22 + 1) |= (unint64_t)v16[9];
      }
    }
    v14 = (char **)((char *)v14 + 1);
  }
  while (v14 != (char **)34);
  memcpy((void *)a2, v8, 0x108uLL);
  *(_QWORD *)(a2 + 16) = 3;
  if (v12 >= v13)
LABEL_10:
    __break(0x5519u);
  *(_QWORD *)(a2 + 264) = "custom chip";
  *(_DWORD *)(a2 + 272) = 1667787120;
  *(_QWORD *)(a2 + 280) = a2 + 712;
  *(_QWORD *)(a2 + 288) = a2 + 712;
  *(_QWORD *)(a2 + 296) = _chip_expert_init;
  *(_QWORD *)(a2 + 304) = _chip_expert_boot;
  *(_QWORD *)(a2 + 312) = _chip_expert_logv;
  *(_QWORD *)(a2 + 320) = _chip_expert_dump;
  *(_OWORD *)(a2 + 328) = 0u;
  *(_OWORD *)(a2 + 344) = 0u;
  *(_QWORD *)(a2 + 360) = _chip_expert_get_digest_info;
  *(_QWORD *)(a2 + 368) = 0;
  *(_QWORD *)(a2 + 376) = 0;
  *(_QWORD *)(a2 + 384) = _chip_expert_get_secure_boot;
  *(_QWORD *)(a2 + 392) = _chip_expert_query_chip;
  *(_QWORD *)(a2 + 400) = _chip_expert_query_chip_boot;
  *(_QWORD *)(a2 + 408) = _chip_expert_query_nonce;
  *(_QWORD *)(a2 + 416) = _chip_expert_entangle_nonce;
  *(_QWORD *)(a2 + 424) = _chip_expert_read_boot_manifest;
  *(_QWORD *)(a2 + 432) = _chip_expert_query_trust_store;
  *(_QWORD *)(a2 + 440) = _chip_expert_read_storage;
  *(_QWORD *)(a2 + 448) = _chip_expert_write_storage;
  *(_QWORD *)(a2 + 456) = _chip_expert_sync_storage;
  *(_QWORD *)(a2 + 464) = _chip_expert_query_property_BOOL;
  *(_QWORD *)(a2 + 472) = _chip_expert_query_property_uint32;
  *(_QWORD *)(a2 + 480) = _chip_expert_query_property_uint64;
  *(_QWORD *)(a2 + 488) = _chip_expert_query_property_digest;
  *(_QWORD *)(a2 + 496) = _chip_expert_query_property_version;
  *(_QWORD *)(a2 + 504) = _chip_expert_init_once;
  *(_QWORD *)(a2 + 512) = _chip_expert_boot_once;
  *(_QWORD *)(a2 + 520) = _chip_expert_read_random;
  *(_QWORD *)(a2 + 528) = _chip_expert_syscall;
  *(_QWORD *)(a2 + 536) = _chip_expert_lock;
  *(_QWORD *)(a2 + 544) = _chip_expert_unlock;
  *(_OWORD *)(a2 + 552) = v22;
  *(_OWORD *)(a2 + 568) = v23;
  v17 = *(_OWORD *)&v24[48];
  *(_OWORD *)(a2 + 616) = *(_OWORD *)&v24[32];
  *(_OWORD *)(a2 + 632) = v17;
  v18 = *(_OWORD *)&v24[16];
  *(_OWORD *)(a2 + 584) = *(_OWORD *)v24;
  *(_OWORD *)(a2 + 600) = v18;
  v19 = *(_OWORD *)&v24[112];
  *(_OWORD *)(a2 + 680) = *(_OWORD *)&v24[96];
  *(_OWORD *)(a2 + 696) = v19;
  v20 = *(_OWORD *)&v24[80];
  *(_OWORD *)(a2 + 648) = *(_OWORD *)&v24[64];
  *(_OWORD *)(a2 + 664) = v20;
  *(_QWORD *)(a2 + 712) = a2 + 552;
  *(_QWORD *)(a2 + 112) = v12;
  return a2;
}

uint64_t img4_chip_select_personalized_ap()
{
  uint64_t v0;

  v0 = generic_expert_specialist();
  return expert_query_chip(v0, 0);
}

uint64_t img4_chip_select_personalized_sep()
{
  return 0;
}

uint64_t img4_chip_select_effective_ap()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;

  v0 = generic_expert_specialist();
  v3 = 0;
  if (expert_get_secure_boot(v0, (uint64_t)&v3))
  {
    v1 = 0;
    v3 = 0;
  }
  else
  {
    v1 = v3;
  }
  return expert_query_chip(v0, v1);
}

_QWORD *img4_buff_dealloc(_QWORD *result)
{
  uint64_t (*v1)(void *);
  BOOL v2;

  if (result)
  {
    v1 = (uint64_t (*)(void *))result[3];
    if (v1)
    {
      if (result[2])
        v2 = 1;
      else
        v2 = result[1] == 0;
      if (v2)
        return (_QWORD *)v1(&_img4_runtime_default);
      else
        __break(0x5519u);
    }
  }
  return result;
}

uint64_t img4_runtime_execute_object(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 104))();
}

uint64_t img4_runtime_copy_object(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 112))();
}

void *img4_runtime_find_object_spec(int a1)
{
  void *v1;

  v1 = &_img4_runtime_object_spec_local_policy;
  if (a1 != 1819307884)
    v1 = 0;
  if (a1 == 1634756974)
    return &_img4_runtime_object_spec_supplemental_root;
  else
    return v1;
}

uint64_t img4_buff_init_from_buff(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  *(_WORD *)result = 0;
  v2 = a2[1];
  if (*a2 > (unint64_t)(*a2 + v2))
  {
    __break(0x5519u);
  }
  else
  {
    *(_QWORD *)(result + 8) = *a2;
    *(_QWORD *)(result + 16) = v2;
    *(_QWORD *)(result + 24) = 0;
  }
  return result;
}

__n128 img4_buff_steal(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  *(_QWORD *)(a2 + 24) = 0;
  return result;
}

uint64_t img4_buff_dealloc_internal(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t (*v3)(void);
  BOOL v5;
  uint64_t result;

  v2 = (_QWORD *)*a2;
  if (*a2)
  {
    v3 = (uint64_t (*)(void))v2[3];
    if (v3)
    {
      if (v2[2])
        v5 = 1;
      else
        v5 = v2[1] == 0;
      if (v5)
      {
        result = v3();
        *a2 = 0;
      }
      else
      {
        __break(0x5519u);
      }
    }
  }
  return result;
}

uint64_t img4_nonce_init_from_digest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_WORD *)a1 = 0;
  *(_DWORD *)(a1 + 52) = 48;
  digest_copy_out32(a2, (void *)(a1 + 2), (_DWORD *)(a1 + 52), a4, a5, a6, a7, a8);
  return a1;
}

uint64_t digest_init_from_img4_dgst(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v8;

  v8 = *(_QWORD *)(a2 + 8);
  if (v8 < 0x31)
    return digest_init(result, (const void *)(a2 + 16), v8, a4, a5, a6, a7, a8);
  __break(0x5519u);
  return result;
}

uint64_t digest_init_from_img4_nonce(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v8;

  v8 = *(unsigned int *)(a2 + 52);
  if (v8 < 0x31)
    return digest_init(result, (const void *)(a2 + 2), v8, a4, a5, a6, a7, a8);
  __break(0x5519u);
  return result;
}

uint64_t img4_dgst_init_from_digest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_WORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 48;
  digest_copy_out(a2, (void *)(a1 + 16), (size_t *)(a1 + 8), a4, a5, a6, a7, a8);
  return a1;
}

_QWORD *buff_init_from_img4_buff(_QWORD *a1, uint64_t a2)
{
  return buff_init_wrap(a1, *(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 16));
}

uint64_t img4_runtime_init(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

uint64_t img4_runtime_alloc(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 24))();
}

uint64_t img4_runtime_dealloc(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t img4_runtime_log_handle(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 48))();
}

uint64_t img4_runtime_get_identifier_BOOL(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 56))();
}

uint64_t img4_runtime_get_identifier_uint32(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 64))();
}

uint64_t img4_runtime_get_identifier_uint64(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 72))();
}

uint64_t img4_runtime_get_identifier_digest(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 80))();
}

uint64_t img4_runtime_get_identifier_cstr(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 96))();
}

uint64_t img4_runtime_alloc_type(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 120))();
}

uint64_t img4_runtime_dealloc_type(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 128))();
}

uint64_t img4_runtime_set_nonce(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 136))();
}

uint64_t img4_runtime_roll_nonce(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 144))();
}

uint64_t img4_runtime_copy_nonce(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 152))();
}

void _darwin_runtime_init(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __panic_npx("panic: function should never be called: %s", a2, a3, a4, a5, a6, a7, a8, (char)"_darwin_runtime_init");
}

void *_darwin_runtime_alloc(uint64_t a1, int64_t a2)
{
  void *result;
  uint64_t v4;
  _OWORD v5[5];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      result = malloc_type_calloc(1uLL, a2, 0x1B044E25uLL);
      if (result)
        break;
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    result = malloc_type_calloc(1uLL, a2, 0x61D5536CuLL);
    if (a2 <= 0 && result)
LABEL_8:
      __break(0x5519u);
    if (!result)
      _darwin_runtime_alloc_cold_1(&v4, v5);
  }
  if (a2 < 1)
    goto LABEL_8;
  return result;
}

void _darwin_runtime_dealloc(int a1, void *a2)
{
  free(a2);
}

void _darwin_runtime_log(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __panic_npx("panic: function should never be called: %s", a2, a3, a4, a5, a6, a7, a8, (char)"_darwin_runtime_log");
}

void _darwin_runtime_log_handle(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __panic_npx("panic: function should never be called: %s", a2, a3, a4, a5, a6, a7, a8, (char)"_darwin_runtime_log_handle");
}

uint64_t _darwin_runtime_get_identifier_BOOL()
{
  return 0;
}

void _darwin_runtime_get_identifier_uint32(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __panic_npx("panic: function should never be called: %s", a2, a3, a4, a5, a6, a7, a8, (char)"_darwin_runtime_get_identifier_uint32");
}

void _darwin_runtime_get_identifier_uint64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __panic_npx("panic: function should never be called: %s", a2, a3, a4, a5, a6, a7, a8, (char)"_darwin_runtime_get_identifier_uint64");
}

uint64_t _darwin_runtime_get_identifier_digest()
{
  return 0;
}

void _darwin_runtime_get_identifier_cstr(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __panic_npx("panic: function should never be called: %s", a2, a3, a4, a5, a6, a7, a8, (char)"_darwin_runtime_get_identifier_cstr");
}

uint64_t _darwin_runtime_execute_object(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  char **v7;
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
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  size_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  _QWORD v39[3];
  _OWORD v40[2];
  uint64_t v41;
  _OWORD v42[2];
  uint64_t v43;

  v7 = dylib_expert();
  v43 = 0;
  memset(v42, 0, sizeof(v42));
  v41 = 0;
  memset(v40, 0, sizeof(v40));
  v37 = 2;
  v38 = *a2;
  memset(v39, 170, sizeof(v39));
  v32 = 2;
  v33 = v38;
  v34 = 0;
  v36 = 0;
  v35 = 0;
  v31 = 33;
  buff_init_from_img4_buff(v42, a3);
  if (a4)
    v8 = a4;
  else
    v8 = a3;
  buff_init_from_img4_buff(v40, v8);
  v39[0] = *(_QWORD *)&v42[0];
  LODWORD(v39[1]) = buff_get_length_uint32((uint64_t)v42, v9, v10, v11, v12, v13, v14, v15);
  *(_QWORD *)((char *)&v39[1] + 4) = *(_QWORD *)&v40[0];
  HIDWORD(v39[2]) = buff_get_length_uint32((uint64_t)v40, v16, v17, v18, v19, v20, v21, v22);
  result = dylib_expert_call_method((uint64_t)v7, 0xDuLL, &v37, 0x21uLL, &v32, &v31);
  if (result >= 0x6A)
    __panic_npx("panic: error not set to valid posix code: %d", v24, v25, v26, v27, v28, v29, v30, result);
  return result;
}

uint64_t _darwin_runtime_copy_object(uint64_t a1, uint64_t *a2, uint64_t a3, _QWORD *a4)
{
  char **v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  BOOL v17;
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
  size_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  int v42;

  v7 = dylib_expert();
  v39 = 1;
  v15 = *a2;
  v40 = *a2;
  v16 = *(_QWORD *)(a3 + 16);
  if (v16)
    v17 = 1;
  else
    v17 = *(_QWORD *)(a3 + 8) == 0;
  if (!v17)
  {
    __break(0x5519u);
    goto LABEL_13;
  }
  v41 = *(_QWORD *)(a3 + 8);
  if (HIDWORD(v16))
LABEL_13:
    __panic_npx("panic: integer cast overflow: v = %s, actual = %llu, expected <= %llu", v8, v9, v10, v11, v12, v13, v14, (char)"payload->i4b_len");
  v18 = (uint64_t)v7;
  v42 = v16;
  v35 = 1;
  v36 = v15;
  v37 = 0;
  v38 = 0;
  v34 = 21;
  v19 = expert_runtime_boot((uint64_t)v7);
  if ((_DWORD)v19)
  {
    v25 = v19;
    expert_log(v18, 3uLL, (uint64_t)"failed to boot expert for syscall: %d", v20, v21, v22, v23, v24, v19);
  }
  else
  {
    v25 = dylib_expert_call_method(v18, 0xFuLL, &v39, 0x15uLL, &v35, &v34);
    if (!(_DWORD)v25)
    {
      *a4 = v38;
      return v25;
    }
  }
  if (v25 >= 0x6A)
    __panic_npx("panic: error not set to valid posix code: %d", v26, v27, v28, v29, v30, v31, v32, v25);
  return v25;
}

void _darwin_runtime_alloc_type(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __panic_npx("panic: function should never be called: %s", a2, a3, a4, a5, a6, a7, a8, (char)"_darwin_runtime_alloc_type");
}

void _darwin_runtime_dealloc_type(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __panic_npx("panic: function should never be called: %s", a2, a3, a4, a5, a6, a7, a8, (char)"_darwin_runtime_dealloc_type");
}

void _darwin_runtime_set_nonce(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __panic_npx("panic: function should never be called: %s", a2, a3, a4, a5, a6, a7, a8, (char)"_darwin_runtime_set_nonce");
}

void _darwin_runtime_roll_nonce(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __panic_npx("panic: function should never be called: %s", a2, a3, a4, a5, a6, a7, a8, (char)"_darwin_runtime_roll_nonce");
}

void _darwin_runtime_copy_nonce(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __panic_npx("panic: function should never be called: %s", a2, a3, a4, a5, a6, a7, a8, (char)"_darwin_runtime_copy_nonce");
}

uint64_t darwin_copy_kcinstall_nonce_hash(uint64_t a1, char *a2)
{
  uint64_t result;

  if (a2 != "ckpa")
    return 96;
  __break(0x5519u);
  return result;
}

uint64_t chip_bin_find_entry(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  int v7;

  v4 = 0;
  for (i = 0; ; ++i)
  {
    v6 = *(_QWORD *)(a1 + v4);
    if (!v6)
      return 0;
    if (*(_QWORD *)(a2 + 16) == 3)
    {
      v7 = strcmp(*(const char **)(a2 + 8), *(const char **)(v6 + 8));
      if (v6 == a2 || v7 == 0)
        return a1 + v4;
      goto LABEL_11;
    }
    if (v6 == a2)
      break;
LABEL_11:
    v4 += 24;
    if (v4 == 576)
      return 0;
  }
  return a1 + 24 * i;
}

_DWORD *chip_bin_find_by_fourcc(uint64_t a1, int a2)
{
  uint64_t v2;
  _DWORD *v3;

  v2 = 0;
  while (1)
  {
    v3 = *(_DWORD **)(a1 + v2);
    if (!v3 || *v3 == a2)
      break;
    v2 += 24;
    if (v2 == 576)
      return 0;
  }
  return v3;
}

uint64_t chip_bin_find_by_name(uint64_t a1, char *__s2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = 0;
  while (1)
  {
    v5 = *(_QWORD *)(a1 + v4);
    if (!v5 || !strcmp(*(const char **)(v5 + 8), __s2))
      break;
    v4 += 24;
    if (v4 == 576)
      return 0;
  }
  return v5;
}

uint64_t chip_bin_find_by_handle(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = 0;
  while (1)
  {
    v3 = *(_QWORD *)(a1 + v2);
    if (!v3 || *(_QWORD *)(a1 + v2 + 8) == a2)
      break;
    v2 += 24;
    if (v2 == 576)
      return 0;
  }
  return v3;
}

uint64_t chip_bin_check(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (chip_bin_find_entry(a1, a2))
    return 0;
  else
    return a3;
}

uint64_t _chip_bin_get_data(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = chip_bin_find_entry(a1, a2);
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

uint64_t _manifest_impose_internal(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (**a5)(unsigned int a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))
{
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  unint64_t alloc_preference;
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
  char *v26;
  const char *v27;
  uint64_t size;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  size_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t *, uint64_t, uint64_t);
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  size_t v65;
  uint64_t *v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v112;
  uint64_t v113;
  _QWORD v114[5];
  uint64_t v115;
  uint64_t *v116;
  uint64_t (*v117)(uint64_t, _QWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  unint64_t v118;
  uint64_t v119;

  v119 = *MEMORY[0x24BDAC8D0];
  v114[0] = a1;
  v114[1] = a2;
  v114[2] = a3;
  v114[3] = a4;
  v114[4] = a5;
  v115 = 0;
  v116 = 0;
  v117 = _manifest_evaluate_trust_payload;
  v118 = 0xAAAAAAAAFFFFFFFFLL;
  v112 = 0;
  v113 = 0;
  v8 = *a1;
  v9 = a1[1];
  if (a3)
  {
    v10 = "payload";
  }
  else
  {
    v117 = _manifest_evaluate_trust_manifest;
    v10 = "manifest";
  }
  alloc_preference = _type_get_alloc_preference((uint64_t)&_image4_type_decode_context);
  if (alloc_preference <= 1)
    v19 = 1;
  else
    v19 = alloc_preference;
  if (v19 == 1)
    goto LABEL_11;
  if (v19 != 2)
    goto LABEL_48;
  v20 = _expert_alloc_type(v8, (uint64_t)&_image4_type_decode_context);
  if (!v20)
  {
LABEL_11:
    size = type_get_size((uint64_t)&_image4_type_decode_context);
    v36 = MEMORY[0x24BDAC7A8](size, v29, v30, v31, v32, v33, v34, v35);
    v26 = (char *)&v112 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v36 >= 0x31)
      v37 = v36 - 48;
    else
      v37 = 0;
    memset(v26 + 48, 170, v37);
    *(_OWORD *)v26 = 0u;
    *((_OWORD *)v26 + 1) = 0u;
    *((_OWORD *)v26 + 2) = 0u;
    v27 = "stack";
  }
  else
  {
    v26 = (char *)v20;
    v112 = v20;
    v27 = "heap";
  }
  *((_OWORD *)v26 + 1) = 0u;
  *((_OWORD *)v26 + 2) = 0u;
  *(_OWORD *)v26 = 0u;
  expert_log(*a1, 1uLL, (uint64_t)"decode context allocated on %s", v21, v22, v23, v24, v25, (uint64_t)v27);
  v38 = chip_select_decode(a2);
  v115 = v38;
  if (!v38)
  {
    v85 = *a1;
    v84 = 82;
    expert_log(v85, 0, (uint64_t)"chip environment not booted: %s: %d", v39, v40, v41, v42, v43, *(_QWORD *)(a2 + 8));
    goto LABEL_44;
  }
  if (v9)
  {
    v44 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v9 + 40);
    if (v44)
    {
      v45 = v44(a1, v38, a1[2]);
      if (v45)
      {
        v115 = v45;
        *(_QWORD *)v26 = v45;
      }
    }
  }
  v46 = _type_get_alloc_preference((uint64_t)&_image4_type_odometer);
  if (v46 <= 1)
    v47 = 1;
  else
    v47 = v46;
  if (v47 == 1)
    goto LABEL_27;
  if (v47 != 2)
LABEL_48:
    __panic_npx("panic: unreachable case: %s = 0x%llx", v12, v13, v14, v15, v16, v17, v18, (char)"_t_preference");
  v48 = _expert_alloc_type(v8, (uint64_t)&_image4_type_odometer);
  if (v48)
  {
    v54 = (char *)v48;
    v113 = v48;
    v55 = "heap";
    goto LABEL_31;
  }
LABEL_27:
  v56 = type_get_size((uint64_t)&_image4_type_odometer);
  v64 = MEMORY[0x24BDAC7A8](v56, v57, v58, v59, v60, v61, v62, v63);
  v54 = (char *)&v112 - ((v64 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v64 >= 0x3D1)
    v65 = v64 - 976;
  else
    v65 = 0;
  memset(v54 + 976, 170, v65);
  bzero(v54, 0x3D0uLL);
  v55 = "stack";
LABEL_31:
  expert_log(*a1, 1uLL, (uint64_t)"odometer allocated on %s", v49, v50, v51, v52, v53, (uint64_t)v55);
  odometer_init((uint64_t)v54, *a1, (uint64_t)a1, a2);
  v67 = v66;
  v116 = v66;
  v75 = odometer_prepare(v66, v68, v69, v70, v71, v72, v73, v74);
  if ((_DWORD)v75)
  {
    v83 = v75;
    expert_log(*a1, 0, (uint64_t)"failed to prepare anti-replay: %d", v78, v79, v80, v81, v82, v75);
    v84 = v83;
    goto LABEL_44;
  }
  if (v9 && *(_QWORD *)(v9 + 32))
  {
    expert_log(*a1, 2uLL, (uint64_t)"calling out to manifest prepare function", v78, v79, v80, v81, v82, v112);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 32))(a1, v67, a1[2]);
  }
  *((_QWORD *)v26 + 5) = v114;
  v86 = *a1;
  if (*a5 != _manifest_validate_property && *a5 != _manifest_audit_property)
    __panic_npx("panic: unreachable", v76, v77, v78, v79, v80, v81, v82, v112);
  chip_get_name(a2);
  expert_log(v86, 1uLL, (uint64_t)"performing trust evaluation: type = %s %s, chip = %s, chip type = 0x%llx, chip expert = %s, payload = %s", v87, v88, v89, v90, v91, (uint64_t)v10);
  if (((unsigned int (*)(uint64_t *, _QWORD *, char *))v117)(a1, v114, v26))
  {
    v97 = v118;
    expert_log(*a1, 0, (uint64_t)"trust evaluation failed: %d", v92, v93, v94, v95, v96, v118);
LABEL_43:
    v84 = v97;
    goto LABEL_44;
  }
  v97 = odometer_enforce((unint64_t)v116);
  v103 = *a1;
  if ((_DWORD)v97)
  {
    expert_log(v103, 0, (uint64_t)"manifest replay denied: %d", v98, v99, v100, v101, v102, v97);
    goto LABEL_43;
  }
  expert_log(v103, 2uLL, (uint64_t)"trust evaluation succeeded; manifest is live", v98, v99, v100, v101, v102, v112);
  v84 = 0;
LABEL_44:
  _expert_dealloc_type(v8, (uint64_t)&_image4_type_decode_context, &v112);
  _expert_dealloc_type(v8, (uint64_t)&_image4_type_odometer, &v113);
  if (v84 >= 0x6A)
    __panic_npx("panic: error not set to valid posix code: %d", v104, v105, v106, v107, v108, v109, v110, v84);
  return v84;
}

uint64_t _manifest_evaluate_trust_payload(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
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
  char v25;

  if (!*(_WORD *)(a1 + 528))
    __panic_npx("panic: optional not set", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v25);
  Img4DecodePerformTrustEvaluatationWithCallbacks(**(_DWORD **)(a2[2] + 8), a1 + 72, a2[4], a2[5], a3);
  v17 = v16;
  v18 = *(_QWORD *)a1;
  if ((_DWORD)v17)
    expert_log(v18, 0, (uint64_t)"Img4DecodePerformTrustEvaluationWithCallbacks: %d", v11, v12, v13, v14, v15, v17);
  else
    expert_log(v18, 2uLL, (uint64_t)"trust evaluation succeeded for payload: %s", v11, v12, v13, v14, v15, *(_QWORD *)(a2[2] + 8) + 4);
  _manifest_record_trust_evaluation_error((uint64_t *)a1, v17, a3, v19, v20, v21, v22, v23);
  return v17;
}

uint64_t _manifest_evaluate_trust_manifest(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
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
  const char *v24;
  uint64_t v26;

  if (!*(_WORD *)(a1 + 528))
    __panic_npx("panic: optional not set", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v26);
  Img4DecodePerformManifestTrustEvaluationWithCallbacks(a1 + 72, a2[4], a2[5], a3);
  v17 = v11;
  if ((_DWORD)v11)
  {
    expert_log(*(_QWORD *)a1, 0, (uint64_t)"Img4DecodePerformManifestTrustEvaluationWithCallbacks: %d", v12, v13, v14, v15, v16, v11);
  }
  else
  {
    v23 = a2[2];
    if (v23)
    {
      v26 = *(_QWORD *)(v23 + 8) + 4;
      v24 = "manifest trust evaluation succeeded: %s";
    }
    else
    {
      v24 = "manifest trust evaluation succeeded";
    }
    expert_log(*(_QWORD *)a1, 2uLL, (uint64_t)v24, v12, v13, v14, v15, v16, v26);
  }
  _manifest_record_trust_evaluation_error((uint64_t *)a1, v17, a3, v18, v19, v20, v21, v22);
  return v17;
}

uint64_t manifest_init(uint64_t a1, uint64_t a2, uint64_t **a3)
{
  if (!a2)
    a2 = generic_expert_specialist();
  *(_QWORD *)a1 = a2;
  bzero((void *)(a1 + 8), 0x218uLL);
  buff_xfer((_QWORD *)(a1 + 24), a3);
  *(_WORD *)(a1 + 64) = 1;
  return a1;
}

uint64_t manifest_init_borrow(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  if (!a2)
    a2 = generic_expert_specialist();
  *(_QWORD *)a1 = a2;
  bzero((void *)(a1 + 8), 0x210uLL);
  *(_QWORD *)(a1 + 536) = a3;
  buff_borrow((_QWORD *)(a1 + 24), a3);
  *(_WORD *)(a1 + 64) = 1;
  return a1;
}

uint64_t manifest_init_wrap(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  if (!a2)
    a2 = generic_expert_specialist();
  *(_QWORD *)a1 = a2;
  bzero((void *)(a1 + 8), 0x218uLL);
  buff_init_alias((_QWORD *)(a1 + 24), a3);
  *(_WORD *)(a1 + 64) = 1;
  return a1;
}

uint64_t manifest_set_callbacks(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(result + 8) = a3;
  *(_QWORD *)(result + 16) = a2;
  return result;
}

unint64_t manifest_parse(uint64_t a1)
{
  unint64_t v2;
  unint64_t *v3;
  unint64_t result;
  uint64_t v5;
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

  v2 = a1 + 64;
  if (*(_WORD *)(a1 + 64))
  {
    v3 = (unint64_t *)(a1 + 24);
  }
  else
  {
    v2 = 0;
    v3 = 0;
  }
  result = *v3;
  v5 = v3[1];
  if ((unint64_t)(v3 + 5) > v2 || result > *v3 + v5)
  {
    __break(0x5519u);
  }
  else
  {
    Img4DecodeInitAsManifest(result, v5, a1 + 72);
    if ((_DWORD)v7)
    {
      v8 = v7;
      v9 = posixdr(v7);
      expert_log(*(_QWORD *)a1, 0, (uint64_t)"Img4DecodeInitAsManifest: %d", v10, v11, v12, v13, v14, v8);
      if (v9 >= 0x6A)
        __panic_npx("panic: error not set to valid posix code: %d", v15, v16, v17, v18, v19, v20, v21, v9);
    }
    else
    {
      v9 = 0;
      *(_WORD *)(a1 + 528) = 1;
    }
    return v9;
  }
  return result;
}

uint64_t manifest_get_restore_info(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;
  char v19;

  if (!*(_WORD *)(a1 + 528))
    __panic_npx("panic: optional not set", a2, a3, a4, a5, a6, a7, a8, v18);
  v8 = a1 + 72;
  v19 = 0;
  v9 = Img4DecodeRestoreInfoExists((_QWORD *)(a1 + 72), &v19);
  if (v9)
    __panic_npx("panic: Img4DecodeRestoreInfoExists: %d", v10, v11, v12, v13, v14, v15, v16, v9);
  if (v19)
    return v8;
  else
    return 0;
}

_QWORD *manifest_get_bytes(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  int Manifest;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  unsigned int v14;

  if (*(_WORD *)(a1 + 528))
    v3 = a1 + 72;
  else
    v3 = 0;
  v14 = 0;
  v13 = 0;
  Manifest = Img4DecodeGetManifest(v3, &v13, &v14);
  if (Manifest)
    __panic_npx("panic: Img4DecodeGetManifest: %d", v5, v6, v7, v8, v9, v10, v11, Manifest);
  return buff_init_wrap(a2, v13, v14);
}

uint64_t manifest_impose(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __int128 v5;
  uint64_t v6;

  v5 = xmmword_251CD1070;
  v6 = 0;
  return _manifest_impose_internal(a1, a2, a3, a4, (uint64_t (**)(unsigned int, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))&v5);
}

uint64_t _manifest_validate_property(unsigned int a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v9;

  if (a3 >= 7)
    __panic_npx("panic: bogus property container input: actual = %u, expected < %u", (uint64_t)a2, a3, a4, a5, a6, a7, a8, a3);
  if ((_DWORD)a3 == 1)
    return _manifest_validate_property_object(a1, a2, a3, a4);
  if ((_DWORD)a3)
    __panic_npx("panic: unreachable", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v9);
  return _manifest_validate_property_manifest(a1, a2, 0, a4);
}

uint64_t manifest_property_callback(uint64_t *a1, uint64_t a2, unsigned int a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int PropertyBoolean;
  uint64_t v23;
  const char *v24;
  int PropertyData;
  int PropertyInteger64;
  unint64_t v28;
  char *v29;
  uint64_t v30;
  unsigned int v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  int v35;

  v10 = a1[1];
  v35 = 0;
  v34 = 0;
  v33 = 0;
  v32 = 0;
  v31 = 0;
  v30 = 0;
  if (!v10)
    return expert_log(*a1, 2uLL, (uint64_t)"no callbacks present", (uint64_t)a4, a5, a6, a7, a8, a9);
  fourcc_init((uint64_t)&v34, a3);
  v21 = a4[2];
  if (v21 == 4)
  {
    if (*(_QWORD *)(v10 + 16))
    {
      PropertyData = Img4DecodeGetPropertyData(a4, a3, &v30, &v31);
      v23 = *a1;
      if (!PropertyData)
      {
        expert_log(v23, 2uLL, (uint64_t)"property callback: tag = %s, type = %d, asn1 type = %s, v length = 0x%x", v16, v17, v18, v19, v20, (uint64_t)&v34 + 4);
        return (*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t, uint64_t, _QWORD, uint64_t))(v10 + 16))(a1, &v34, a2, v30, v31, a1[2]);
      }
      v29 = (char *)&v34 + 4;
      v24 = "Img4DecodeGetPropertyData: %s: %d";
      goto LABEL_15;
    }
    v23 = *a1;
    v24 = "no data property callback";
LABEL_19:
    v28 = 2;
    return expert_log(v23, v28, (uint64_t)v24, v16, v17, v18, v19, v20, (uint64_t)v29);
  }
  if (v21 == 2)
  {
    if (*(_QWORD *)(v10 + 8))
    {
      PropertyInteger64 = Img4DecodeGetPropertyInteger64((uint64_t)a4, a3, &v32);
      v23 = *a1;
      if (!PropertyInteger64)
      {
        expert_log(v23, 2uLL, (uint64_t)"property callback: tag = %s, type = %d, asn1 type = %s, v = 0x%llx", v16, v17, v18, v19, v20, (uint64_t)&v34 + 4);
        return (*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t, unint64_t, uint64_t))(v10 + 8))(a1, &v34, a2, v32, a1[2]);
      }
      v29 = (char *)&v34 + 4;
      v24 = "Img4DecodeGetPropertyInteger64: %s: %d";
      goto LABEL_15;
    }
    v23 = *a1;
    v24 = "no integer property callback";
    goto LABEL_19;
  }
  if (v21 != 1)
    __panic_npx("panic: unreachable case: %s = 0x%llx", v14, v15, v16, v17, v18, v19, v20, (char)"i4p->type");
  if (!*(_QWORD *)v10)
  {
    v23 = *a1;
    v24 = "no BOOLean property callback";
    goto LABEL_19;
  }
  PropertyBoolean = Img4DecodeGetPropertyBoolean((uint64_t)a4, a3, &v33);
  v23 = *a1;
  if (!PropertyBoolean)
  {
    expert_log(v23, 2uLL, (uint64_t)"property callback: tag = %s, type = %d, asn1 type = %s, v = 0x%x", v16, v17, v18, v19, v20, (uint64_t)&v34 + 4);
    return (*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t, BOOL, uint64_t))v10)(a1, &v34, a2, v33, a1[2]);
  }
  v29 = (char *)&v34 + 4;
  v24 = "Img4DecodeGetPropertyBoolean: %s: %d";
LABEL_15:
  v28 = 0;
  return expert_log(v23, v28, (uint64_t)v24, v16, v17, v18, v19, v20, (uint64_t)v29);
}

uint64_t manifest_post_property_callback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10;
  uint64_t v11;
  int v13;
  uint64_t v14;
  uint64_t QueryForContainer;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t *v36;
  int PropertyData;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unsigned __int8 v43;

  v10 = *(_QWORD *)(a1 + 8);
  v11 = *a5;
  v43 = 0;
  v41 = 0;
  v42 = 0;
  v40 = 0;
  if (v10)
  {
    v13 = a4;
    v14 = a3;
    if (!a3)
    {
      if (!*(_WORD *)(a1 + 528))
        __panic_npx("panic: optional not set", a2, 0, a4, (uint64_t)a5, a6, a7, a8, v38);
      v14 = a1 + 72;
    }
    QueryForContainer = Img4DecodeGetQueryForContainer(a2, a2, a3, a4, (uint64_t)a5, a6, a7, a8);
    if (!QueryForContainer)
      __panic_npx("panic: unsupported container for posting: %u", v17, v18, v19, v20, v21, v22, v23, a2);
    v24 = (uint64_t *)QueryForContainer;
    if (Img4DecodeContainerExists(QueryForContainer, v14, (uint64_t)&v43))
    {
      v39 = *v24;
      v32 = "failed to check for %s: %d";
      v33 = *(_QWORD *)a1;
LABEL_8:
      v34 = 0;
      return expert_log(v33, v34, (uint64_t)v32, v27, v28, v29, v30, v31, v39);
    }
    if (!v43)
    {
      v33 = *(_QWORD *)a1;
      v39 = *v24;
      v32 = "%s does not exist";
      goto LABEL_8;
    }
    v36 = v24 + 6;
    switch(v13)
    {
      case 4:
        if (v24 < v36)
        {
          PropertyData = Img4DecodeQueryPropertyData((uint64_t)v24, v14, v11, (uint64_t)&v40, (uint64_t)&v41);
          if (!PropertyData)
          {
            if (*(_QWORD *)(v10 + 16))
            {
              expert_log(*(_QWORD *)a1, 2uLL, (uint64_t)"property callback: tag = %s, type = %d, asn1 type = %s, v length = %lu", v27, v28, v29, v30, v31, (uint64_t)(a5 + 1));
              (*(void (**)(uint64_t, unsigned int *, uint64_t, uint64_t, uint64_t, _QWORD))(v10 + 16))(a1, a5, a2, v40, v41, *(_QWORD *)(a1 + 16));
            }
            goto LABEL_31;
          }
          goto LABEL_26;
        }
        break;
      case 2:
        if (v24 < v36)
        {
          PropertyData = Img4DecodeQueryPropertyInteger64((uint64_t)v24, v14, v11, (uint64_t)&v42);
          if (!PropertyData)
          {
            if (*(_QWORD *)(v10 + 8))
            {
              expert_log(*(_QWORD *)a1, 2uLL, (uint64_t)"property callback: tag = %s, type = %d, asn1 type = %s, v = 0x%llx", v27, v28, v29, v30, v31, (uint64_t)(a5 + 1));
              (*(void (**)(uint64_t, unsigned int *, uint64_t, uint64_t, _QWORD))(v10 + 8))(a1, a5, a2, v42, *(_QWORD *)(a1 + 16));
            }
            goto LABEL_31;
          }
LABEL_26:
          v33 = *(_QWORD *)a1;
          if (PropertyData != 1)
          {
            v39 = *v24;
            v32 = "failed to decode property: container = %s, type = %x, p = %s: %d";
            goto LABEL_8;
          }
          v39 = *v24;
          v32 = "property does not exist: container = %s, type = %x, p = %s";
LABEL_32:
          v34 = 2;
          return expert_log(v33, v34, (uint64_t)v32, v27, v28, v29, v30, v31, v39);
        }
        break;
      case 1:
        if (v24 < v36)
        {
          PropertyData = Img4DecodeQueryPropertyBool((uint64_t)v24, v14, v11, (uint64_t)&v43);
          if (!PropertyData)
          {
            if (*(_QWORD *)v10)
            {
              expert_log(*(_QWORD *)a1, 2uLL, (uint64_t)"property callback: tag = %s, type = %d, asn1 type = %s, v = 0x%x", v27, v28, v29, v30, v31, (uint64_t)(a5 + 1));
              (*(void (**)(uint64_t, unsigned int *, uint64_t, _QWORD, _QWORD))v10)(a1, a5, a2, v43, *(_QWORD *)(a1 + 16));
            }
LABEL_31:
            v33 = *(_QWORD *)a1;
            v39 = *v24;
            v32 = "posted property: container = %s, type = %x, p = %s";
            goto LABEL_32;
          }
          goto LABEL_26;
        }
        break;
      default:
        goto LABEL_36;
    }
    __break(0x5519u);
LABEL_36:
    __panic_npx("panic: unreachable case: %s = 0x%llx", v25, v26, v27, v28, v29, v30, v31, (char)"asn1type");
  }
  return expert_log(*(_QWORD *)a1, 2uLL, (uint64_t)"no callbacks present", a4, (uint64_t)a5, a6, a7, a8, a9);
}

uint64_t manifest_audit(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;

  v4 = xmmword_251CD1088;
  v5 = 0;
  return _manifest_impose_internal(a1, a2, a3, 0, (uint64_t (**)(unsigned int, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))&v4);
}

uint64_t _manifest_audit_property(unsigned int a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a3 >= 7)
    __panic_npx("panic: bogus property container input: actual = %u, expected < %u", (uint64_t)a2, a3, a4, a5, a6, a7, a8, a3);
  v8 = **(uint64_t ***)(a4 + 40);
  if ((_DWORD)a3 == 1)
  {
    v9 = _manifest_validate_property_object(a1, a2, a3, a4);
    if (!(_DWORD)v9)
      return 0;
LABEL_7:
    expert_log(*v8, 1uLL, (uint64_t)"auditing manifest; ignoring validation result: %d", v10, v11, v12, v13, v14, v9);
    return 0;
  }
  if (!(_DWORD)a3)
  {
    v9 = _manifest_validate_property_manifest(a1, a2, 0, a4);
    if ((_DWORD)v9)
      goto LABEL_7;
  }
  return 0;
}

uint64_t manifest_measure(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t alloc_preference;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _OWORD *v17;
  uint64_t size;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  size_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  size_t *v37;
  size_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v45;
  uint64_t v46;
  _OWORD __dst[4];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)a1;
  memset(__dst, 0, sizeof(__dst));
  if (*(_WORD *)(a1 + 528))
    v6 = a1 + 72;
  else
    v6 = 0;
  v46 = 0;
  alloc_preference = _type_get_alloc_preference((uint64_t)&_image4_type_decode_context);
  if (alloc_preference <= 1)
    v15 = 1;
  else
    v15 = alloc_preference;
  if (v15 == 1)
    goto LABEL_11;
  if (v15 != 2)
    __panic_npx("panic: unreachable case: %s = 0x%llx", v8, v9, v10, v11, v12, v13, v14, (char)"_t_preference");
  v16 = _expert_alloc_type(v5, (uint64_t)&_image4_type_decode_context);
  if (!v16)
  {
LABEL_11:
    size = type_get_size((uint64_t)&_image4_type_decode_context);
    v26 = MEMORY[0x24BDAC7A8](size, v19, v20, v21, v22, v23, v24, v25);
    v17 = (_OWORD *)((char *)&v45 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0));
    if (v26 >= 0x31)
      v27 = v26 - 48;
    else
      v27 = 0;
    memset(v17 + 3, 170, v27);
    *v17 = 0u;
    v17[1] = 0u;
    v17[2] = 0u;
  }
  else
  {
    v17 = (_OWORD *)v16;
    v46 = v16;
  }
  v17[1] = 0u;
  v17[2] = 0u;
  *v17 = 0u;
  v28 = chip_select_decode(a2);
  if (!v28)
    __panic_npx("panic: no decode implementation available for chip: %s", v29, v30, v31, v32, v33, v34, v35, *(_QWORD *)(a2 + 8));
  v36 = v28;
  v37 = *(size_t **)(v28 + 32);
  v38 = *v37;
  if (*v37 > 0x40)
  {
    __break(0x5519u);
LABEL_21:
    __panic_npx("panic: Img4DecodeCopyManifestDigest: %d", v29, v30, v36, v32, v33, v34, v35, v28);
  }
  LODWORD(v28) = Img4DecodeCopyManifestDigest(v6, __dst, *v37, (uint64_t (**)(uint64_t, _QWORD, _OWORD *, size_t, _QWORD))v28);
  if ((_DWORD)v28)
    goto LABEL_21;
  _expert_dealloc_type(v5, (uint64_t)&_image4_type_decode_context, &v46);
  return digest_init(a3, __dst, v38, v39, v40, v41, v42, v43);
}

_QWORD *manifest_destroy(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v8 = *result;
  if (*result)
  {
    if (!*(_WORD *)(v8 + 64))
      __panic_npx("panic: optional not set", a2, a3, a4, a5, a6, a7, a8, v12);
    v9 = result;
    v13 = (_QWORD *)(v8 + 24);
    v10 = *(_QWORD *)(v8 + 536);
    if (v10)
      buff_return(v10, &v13);
    v11 = v8 + 544;
    if (!*(_WORD *)(v8 + 584))
      v11 = 0;
    v12 = v11;
    buff_destroy(&v12);
    *(_WORD *)(v8 + 64) = 0;
    result = buff_destroy(&v13);
    *v9 = 0;
  }
  return result;
}

uint64_t *_manifest_record_trust_evaluation_error(uint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  if ((_DWORD)a2)
  {
    v9 = result;
    v10 = *(_QWORD *)(a3 + 40);
    if (*(_DWORD *)(v10 + 64) == -1)
    {
      expert_log(*result, 1uLL, (uint64_t)"certificate trust evaluation failed", a4, a5, a6, a7, a8, v11);
      *(_DWORD *)(v10 + 64) = 80;
    }
    return (uint64_t *)expert_log(*v9, 0, (uint64_t)"trust evaluation: dr = %d, ct = 0x%x, error = %d", a4, a5, a6, a7, a8, a2);
  }
  return result;
}

uint64_t _manifest_validate_property_manifest(unsigned int a1, uint64_t *a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
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
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  void (*v42)(uint64_t *, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t);
  uint64_t v43;
  uint64_t v45;
  int v46;

  v6 = *(_QWORD *)(a4 + 40);
  v7 = *(_QWORD *)(v6 + 48);
  v8 = *(uint64_t **)v6;
  v9 = *(_QWORD *)(v6 + 8);
  v46 = 0;
  v45 = 0;
  v10 = (uint64_t *)fourcc_init((uint64_t)&v45, a1);
  result = expert_log(*v8, 1uLL, (uint64_t)"manifest property: %s", v11, v12, v13, v14, v15, (uint64_t)v10 + 4);
  if (v10 && v10 >= (uint64_t *)((char *)v10 + 12))
    goto LABEL_19;
  v23 = v8 + 74;
  result = property_find_from_fourcc(v10, 0, v17, v18, v19, v20, v21, v22);
  if (!result)
  {
    if (v8 >= v23)
      goto LABEL_19;
    _manifest_audit_pseudo_callback((uint64_t)v8, v10, a3);
    v40 = "unrecognized manifest property: %s";
LABEL_15:
    result = expert_log(*v8, 1uLL, (uint64_t)v40, v30, v31, v32, v33, v34, (uint64_t)v10 + 4);
    goto LABEL_16;
  }
  v29 = result;
  result = odometer_update(v7, result, (uint64_t)a2, v24, v25, v26, v27, v28);
  if (!(_DWORD)result)
  {
    if (v8 >= v23)
      goto LABEL_19;
    v41 = v8[1];
    if (v41)
    {
      v42 = *(void (**)(uint64_t *, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t))(v41 + 48);
      if (v42)
        v42(v8, v29, 2, 0, 0, v8[2]);
    }
    v40 = "anti-replay property consumed by odometer: %s";
    goto LABEL_15;
  }
  if (v8 >= v23)
  {
LABEL_19:
    __break(0x5519u);
    return result;
  }
  result = _manifest_impose_property(v8, v29, v9, a2, v6);
  if ((_DWORD)result)
  {
    *(_DWORD *)(v6 + 64) = result;
    expert_log(*v8, 0, (uint64_t)"property failed to impose on environment: %s: %d", v35, v36, v37, v38, v39, (uint64_t)v10 + 4);
    return 3;
  }
LABEL_16:
  if (v8 >= v23)
    goto LABEL_19;
  manifest_property_callback(v8, a3, a1, a2, v36, v37, v38, v39, v43);
  return 0;
}

uint64_t _manifest_validate_property_object(unsigned int a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
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
  uint64_t v34;
  uint64_t v35;
  int v36;

  v7 = *(_QWORD *)(a4 + 40);
  v8 = *(uint64_t **)v7;
  v9 = *(_QWORD *)(v7 + 8);
  v36 = 0;
  v35 = 0;
  v10 = (uint64_t *)fourcc_init((uint64_t)&v35, a1);
  result = expert_log(*v8, 1uLL, (uint64_t)"object property: %s", v11, v12, v13, v14, v15, (uint64_t)v10 + 4);
  if (v10 && v10 >= (uint64_t *)((char *)v10 + 12))
    goto LABEL_12;
  v23 = v8 + 74;
  result = property_find_from_fourcc(v10, 1, v17, v18, v19, v20, v21, v22);
  if (!result)
  {
    if (v8 < v23)
    {
      _manifest_audit_pseudo_callback((uint64_t)v8, v10, a3);
      result = expert_log(*v8, 1uLL, (uint64_t)"unrecognized object property: %s", v29, v30, v31, v32, v33, (uint64_t)v10 + 4);
      goto LABEL_9;
    }
LABEL_12:
    __break(0x5519u);
    return result;
  }
  if (v8 >= v23)
    goto LABEL_12;
  result = _manifest_impose_property(v8, result, v9, a2, v7);
  if ((_DWORD)result)
  {
    *(_DWORD *)(v7 + 64) = result;
    expert_log(*v8, 0, (uint64_t)"object property failed to impose on environment: %d", v24, v25, v26, v27, v28, result);
    return 3;
  }
LABEL_9:
  if (v8 >= v23)
    goto LABEL_12;
  manifest_property_callback(v8, a3, a1, a2, v25, v26, v27, v28, v34);
  return 0;
}

uint64_t _manifest_audit_pseudo_callback(uint64_t result, uint64_t *a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, _QWORD *, uint64_t, _QWORD, _QWORD, _QWORD);
  _QWORD v6[4];
  int v7;
  void *v8;
  void *v9;
  int v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = *(_QWORD *)(result + 8);
  v6[0] = (char *)a2 + 4;
  v6[1] = 0;
  v4 = *a2;
  v6[2] = 33;
  v6[3] = v4;
  v7 = *((_DWORD *)a2 + 2);
  v8 = &_property_type_BOOL;
  v9 = &_property_constraint_na;
  v10 = a3;
  v11 = xmmword_24BA992A0;
  v13 = 0;
  v14 = 0;
  v12 = 4;
  if (v3)
  {
    v5 = *(uint64_t (**)(uint64_t, _QWORD *, uint64_t, _QWORD, _QWORD, _QWORD))(v3 + 48);
    if (v5)
      return v5(result, v6, 3, 0, 0, *(_QWORD *)(result + 16));
  }
  return result;
}

uint64_t _manifest_impose_property(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  uint64_t v10;
  char **digest;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t constraint;
  int v21;
  uint64_t v22;
  const char *v23;
  uint64_t PropertyBoolean;
  uint64_t v25;
  uint64_t property_BOOL;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t *, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t);
  uint64_t PropertyInteger;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t PropertyInteger64;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t PropertyData;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void (*v72)(uint64_t *, uint64_t, uint64_t, uint64_t);
  uint64_t v73;
  void (*v74)(uint64_t *, uint64_t, uint64_t, _OWORD *, _OWORD *, uint64_t);
  const char *v76;
  uint64_t v77;
  int v78[2];
  unsigned int __n;
  _OWORD __n_4[7];
  _OWORD v81[7];
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  v10 = *a1;
  digest = chip_get_digest(a3);
  v81[0] = xmmword_24BA992B8;
  memset(&v81[1], 170, 88);
  __n_4[0] = xmmword_24BA992B8;
  memset(&__n_4[1], 170, 88);
  v12 = *(unsigned int *)(a2 + 24);
  __n = 0;
  *(_QWORD *)v78 = 0;
  constraint = chip_get_constraint(a3, a2, *(_QWORD *)(a5 + 24));
  if (constraint != a2)
    expert_log(*a1, 1uLL, (uint64_t)"chip has custom constraint for property: %s", v15, v16, v17, v18, v19, a2 + 28);
  v21 = *(_DWORD *)(constraint + 56);
  if (v21)
  {
    if (v21 == 6)
    {
      property_BOOL = 0;
      goto LABEL_46;
    }
    if (v21 != 1)
    {
      v76 = "p->p_container";
LABEL_54:
      __panic_npx("panic: unreachable case: %s = 0x%llx", v13, v14, v15, v16, v17, v18, v19, (char)v76);
    }
    v22 = 85;
    v23 = "object";
  }
  else
  {
    v22 = 13;
    v23 = "manifest";
  }
  if (property_imposable(constraint, a3))
  {
    switch(**(_QWORD **)(constraint + 40))
    {
      case 0:
        PropertyBoolean = Img4DecodeGetPropertyBoolean((uint64_t)a4, v12, (BOOL *)v81);
        if ((_DWORD)PropertyBoolean)
        {
          v25 = PropertyBoolean;
          property_BOOL = posixdr(PropertyBoolean);
          expert_log(*a1, 0, (uint64_t)"Img4DecodeGetPropertyBoolean: %d", v27, v28, v29, v30, v31, v25);
          goto LABEL_26;
        }
        property_BOOL = expert_query_property_BOOL(v10, a3, constraint, (unsigned __int8 *)__n_4);
        if ((_DWORD)property_BOOL)
          goto LABEL_43;
        if (!property_constrain_BOOL(constraint, v10, (unsigned __int8 *)v81, (unsigned __int8 *)__n_4, v16, v17, v18, v19))goto LABEL_39;
        goto LABEL_42;
      case 1:
        PropertyInteger = Img4DecodeGetPropertyInteger((uint64_t)a4, v12, v81);
        if ((_DWORD)PropertyInteger)
        {
          v35 = PropertyInteger;
          property_BOOL = posixdr(PropertyInteger);
          expert_log(*a1, 0, (uint64_t)"Img4DecodeGetPropertyInteger: %d", v36, v37, v38, v39, v40, v35);
          goto LABEL_26;
        }
        property_BOOL = expert_query_property_uint32(v10, a3, constraint, __n_4);
        if ((_DWORD)property_BOOL)
          goto LABEL_43;
        if (!property_constrain_uint32(constraint, v10, (unsigned int *)v81, (unsigned int *)__n_4, v16, v17, v18, v19))goto LABEL_39;
        goto LABEL_42;
      case 2:
        PropertyInteger64 = Img4DecodeGetPropertyInteger64((uint64_t)a4, v12, (unint64_t *)v81);
        if ((_DWORD)PropertyInteger64)
        {
          v42 = PropertyInteger64;
          property_BOOL = posixdr(PropertyInteger64);
          expert_log(*a1, 0, (uint64_t)"Img4DecodeGetPropertyInteger64: %d", v43, v44, v45, v46, v47, v42);
          goto LABEL_26;
        }
        property_BOOL = expert_query_property_uint64(v10, a3, constraint, __n_4);
        if ((_DWORD)property_BOOL)
          goto LABEL_43;
        if (!property_constrain_uint64(constraint, v10, (unint64_t *)v81, (unint64_t *)__n_4, v16, v17, v18, v19))goto LABEL_39;
        goto LABEL_42;
      case 3:
        PropertyData = Img4DecodeGetPropertyData(a4, v12, v78, &__n);
        if ((_DWORD)PropertyData)
          goto LABEL_25;
        digest_init((uint64_t)v81, *(const void **)v78, __n, v49, v50, v51, v52, v53);
        if (property_equal(constraint, (uint64_t)digest))
        {
          expert_log(*a1, 1uLL, (uint64_t)"imposing object digest", v54, v55, v56, v57, v58, v77);
          payload_measure(*(_QWORD *)(a5 + 16), a3, (uint64_t)__n_4);
        }
        else
        {
          property_BOOL = expert_query_property_digest(v10, a3, constraint, (uint64_t)__n_4);
          if ((_DWORD)property_BOOL)
            goto LABEL_43;
        }
        if (property_constrain_digest(constraint, v10, (unint64_t)v81, (unint64_t)__n_4, v16, v17, v18, v19))
        {
          goto LABEL_42;
        }
        goto LABEL_39;
      case 4:
        PropertyData = Img4DecodeGetPropertyData(a4, v12, v78, &__n);
        if ((_DWORD)PropertyData)
        {
LABEL_25:
          v59 = PropertyData;
          property_BOOL = posixdr(PropertyData);
          expert_log(*a1, 0, (uint64_t)"Img4DecodeGetPropertyData: %d", v60, v61, v62, v63, v64, v59);
LABEL_26:
          if (!(_DWORD)property_BOOL)
          {
LABEL_46:
            v70 = 1;
LABEL_47:
            v73 = a1[1];
            if (v73)
            {
              v74 = *(void (**)(uint64_t *, uint64_t, uint64_t, _OWORD *, _OWORD *, uint64_t))(v73 + 48);
              if (v74)
                v74(a1, constraint, v70, v81, __n_4, a1[2]);
            }
            if (property_BOOL >= 0x6A)
              __panic_npx("panic: error not set to valid posix code: %d", v13, v70, v15, v16, v17, v18, v19, property_BOOL);
            return property_BOOL;
          }
        }
        else
        {
          version_init((uint64_t)v81, *(char **)v78, __n);
          property_BOOL = expert_query_property_version(v10, a3, constraint, (uint64_t)__n_4);
          if (!(_DWORD)property_BOOL)
          {
            if (!property_constrain_version(constraint, v10, (uint64_t)v81, (uint64_t)__n_4, v16, v17, v18, v19))
            {
LABEL_39:
              expert_log(*a1, 2uLL, (uint64_t)"%s constraint satisfied: property = %s, type = %s", v65, v66, v67, v68, v69, (uint64_t)v23);
              property_BOOL = 0;
              v70 = 0;
              goto LABEL_47;
            }
LABEL_42:
            expert_log(*a1, 0, (uint64_t)"%s constraint violated: property = %s, type = %s: %d", v65, v66, v67, v68, v69, (uint64_t)v23);
            property_BOOL = v22;
          }
        }
LABEL_43:
        v71 = a1[1];
        if (v71)
        {
          v72 = *(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(v71 + 24);
          if (v72)
            v72(a1, a3, constraint, a1[2]);
        }
        goto LABEL_46;
      default:
        v76 = "p->p_type->pt_switchable";
        goto LABEL_54;
    }
  }
  expert_log(*a1, 1uLL, (uint64_t)"%s property not imposable on chip: %s", v15, v16, v17, v18, v19, (uint64_t)v23);
  v32 = a1[1];
  if (v32)
  {
    v33 = *(void (**)(uint64_t *, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t))(v32 + 48);
    if (v33)
      v33(a1, constraint, 3, 0, 0, a1[2]);
  }
  return 0;
}

_QWORD *img4_firmware_new(char *a1, __n128 *a2, unsigned int a3, uint64_t a4, uint64_t a5)
{
  uint64_t expert;
  _QWORD *v11;
  _QWORD *v12;

  expert = img4_runtime_get_expert(a1);
  v11 = (_QWORD *)_expert_alloc_type(expert, (uint64_t)&_image4_type_firmware);
  v12 = v11;
  if (v11)
  {
    img4_firmware_init(v11, a1, a2, a3, a4, a5);
    v12[2] = &_image4_type_firmware;
  }
  return v12;
}

__n128 img4_firmware_init(_QWORD *a1, char *a2, __n128 *a3, unsigned int a4, uint64_t a5, uint64_t a6)
{
  uint64_t expert;
  unint64_t v13;
  __n128 result;
  uint64_t *inited;
  _OWORD v16[2];
  uint64_t v17;
  uint64_t v18;
  int v19;

  expert = img4_runtime_get_expert(a2);
  v19 = 0;
  v18 = 0;
  v17 = 0;
  memset(v16, 0, sizeof(v16));
  bzero(a1, 0x508uLL);
  *a1 = a6;
  a1[1] = a2;
  a1[2] = 0;
  a1[6] = 0;
  a1[78] = 0;
  img4_buff_steal(a1 + 153, a5);
  inited = buff_init_wrap(v16, *(_QWORD *)(a5 + 8), *(_QWORD *)(a5 + 16));
  fourcc_init((uint64_t)&v18, a4);
  a1[6] = payload_init((uint64_t)(a1 + 7), expert, (unsigned int *)&v18, &inited);
  v13 = a3[1].n128_u64[0];
  result = *a3;
  *(__n128 *)(a1 + 3) = *a3;
  a1[5] = v13;
  return result;
}

void img4_firmware_init_from_buff(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2 <= 0x507)
    __panic_npx("panic: object overflows buffer: object = firmware, length = %lu, required = %lu", a2, a3, a4, a5, a6, a7, a8, a2);
}

void img4_firmware_init_sentinel(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  bzero(a1, 0x508uLL);
  *a1 = a3;
  a1[1] = a2;
  a1[2] = 0;
  a1[6] = 0;
  a1[78] = 0;
}

uint64_t img4_firmware_attach_manifest(uint64_t a1, uint64_t a2)
{
  uint64_t expert;
  uint64_t result;
  uint64_t *inited;
  _OWORD v7[2];
  uint64_t v8;

  expert = img4_runtime_get_expert(*(char **)(a1 + 8));
  if (!expert)
    expert = generic_expert_specialist();
  v8 = 0;
  memset(v7, 0, sizeof(v7));
  img4_buff_steal((_OWORD *)(a1 + 1256), a2);
  inited = buff_init_wrap(v7, *(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 16));
  result = manifest_init(a1 + 632, expert, &inited);
  *(_QWORD *)(a1 + 624) = result;
  return result;
}

uint64_t img4_firmware_select_chip(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t expert;
  const char *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t name;
  uint64_t v27;
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
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;
  _OWORD v53[28];
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  expert = img4_runtime_get_expert(*(char **)(a1 + 8));
  if (!expert)
    expert = generic_expert_specialist();
  v54 = 0;
  memset(v53, 0, sizeof(v53));
  if ((*(_BYTE *)a1 & 4) == 0)
  {
    v14 = "cannot select chip with first-stage boots";
LABEL_5:
    v15 = expert;
    v16 = 0;
LABEL_14:
    expert_log(v15, v16, (uint64_t)v14, v8, v9, v10, v11, v12, v49);
    return 0;
  }
  v17 = *(_QWORD *)(a1 + 624);
  if (!v17)
  {
    v20 = *(_QWORD *)(a1 + 48);
    if (!v20)
    {
      v14 = "no manifest with which to select chip";
      goto LABEL_5;
    }
    v18 = v20 + 88;
    if (*(_WORD *)(v20 + 88))
    {
      v19 = (uint64_t *)(v20 + 48);
      goto LABEL_12;
    }
LABEL_31:
    __panic_npx("panic: optional not set", v6, v7, v8, v9, v10, v11, v12, v49);
  }
  v18 = v17 + 64;
  if (!*(_WORD *)(v17 + 64))
    goto LABEL_31;
  v19 = (uint64_t *)(v17 + 24);
LABEL_12:
  result = expert_runtime_boot(expert);
  if ((_DWORD)result)
  {
    v49 = result;
    v14 = "failed to boot expert for chip selection: %d";
    v15 = expert;
    v16 = 3;
    goto LABEL_14;
  }
  if ((unint64_t)v19 >= v18
    || (unint64_t)(v19 + 5) > v18
    || (result = *v19, v23 = v19[1], *v19 > (unint64_t)(*v19 + v23)))
  {
    __break(0x5519u);
    return result;
  }
  Img4DecodeInitAsManifest(result, v23, (uint64_t)v53);
  if ((_DWORD)v24)
  {
    v49 = v24;
    v14 = "Img4DecodeInitAsManifest: %d";
    goto LABEL_5;
  }
  if (!a3)
    return 0;
  while (1)
  {
    v22 = *a2;
    v51 = xmmword_251CD10A0;
    v52 = 0;
    v25 = *(_QWORD *)(v22 + 32);
    name = chip_get_name(v22);
    expert_log(expert, 1uLL, (uint64_t)"trying chip: %s", v27, v28, v29, v30, v31, name);
    if (!v25)
    {
      v50 = chip_get_name(v22);
      expert_log(expert, 0, (uint64_t)"chip has no static decode implementation: %s", v38, v39, v40, v41, v42, v50);
      goto LABEL_28;
    }
    Img4DecodePerformManifestTrustEvaluationWithCallbacks((uint64_t)v53, (uint64_t)&v51, v25, 0);
    if (!(_DWORD)v32)
      break;
    expert_log(expert, 1uLL, (uint64_t)"Img4DecodePerformManifestTrustEvaluationWithCallbacks: %d", v33, v34, v35, v36, v37, v32);
LABEL_28:
    v22 = 0;
    ++a2;
    if (!--a3)
      return v22;
  }
  v43 = chip_get_name(v22);
  expert_log(expert, 2uLL, (uint64_t)"manifest matches chip: %s", v44, v45, v46, v47, v48, v43);
  return v22;
}

uint64_t _img4_firmware_select_chip_callback()
{
  return 0;
}

uint64_t img4_firmware_execute(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _OWORD v17[3];
  uint64_t v18;
  _QWORD *v19;

  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 624);
  v18 = 0;
  memset(v17, 0, sizeof(v17));
  result = img4_firmware_evaluate(a1, (uint64_t)a2, a3);
  v8 = result;
  v9 = 0;
  if (!(_DWORD)result)
  {
    if (*(_WORD *)(v5 + 88))
    {
      if (v5 >= v5 + 568)
      {
        __break(0x5519u);
        return result;
      }
      v9 = img4_image_init(v17, v5, v6, *(_QWORD *)a1);
    }
    else
    {
      v9 = 0;
    }
  }
  result = (*(uint64_t (**)(uint64_t, _QWORD *, uint64_t, _QWORD))(a1 + 32))(a1, v9, v8, *(_QWORD *)(a1 + 40));
  if (a2[2] == 3 && (_QWORD *)a2[14] == a2 + 33)
  {
    result = a2[90];
    if (result)
    {
      v19 = a2;
      result = _expert_dealloc_type(result, (uint64_t)&_image4_type_custom_chip, (uint64_t *)&v19);
    }
  }
  if (v8 >= 0x6A)
    __panic_npx("panic: error not set to valid posix code: %d", v10, v11, v12, v13, v14, v15, v16, v8);
  return result;
}

uint64_t img4_firmware_evaluate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t expert;
  uint64_t v14;
  uint64_t *v15;
  uint64_t inited;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v25;
  _OWORD v26[3];
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[15];

  v29[14] = *MEMORY[0x24BDAC8D0];
  expert = img4_runtime_get_expert(*(char **)(a1 + 8));
  if (!expert)
    expert = generic_expert_specialist();
  v28 = 0;
  v29[0] = a1;
  memset(v26, 0, 32);
  v26[2] = xmmword_251CD10D8;
  v27 = 0;
  v29[1] = a2;
  memset(&v29[2], 0, 88);
  v29[13] = 0xAAAAAAAAFFFFFFFFLL;
  if (!expert)
    __panic_npx("panic: failed to resolve expert for runtime", v6, v7, v8, v9, v10, v11, v12, v25);
  if (!*(_QWORD *)(a1 + 48) || (*(_BYTE *)a1 & 2) != 0 || (v14 = payload_parse_relax(), !(_DWORD)v14))
  {
    v15 = *(uint64_t **)(a1 + 624);
    if (v15)
    {
      inited = 0;
    }
    else
    {
      v17 = *(_QWORD *)(a1 + 48);
      if (!*(_WORD *)(v17 + 88))
        __panic_npx("panic: optional not set", v6, v7, v8, v9, v10, v11, v12, v25);
      inited = manifest_init_borrow(a1 + 632, expert, (_QWORD *)(v17 + 48));
      v28 = inited;
      v15 = (uint64_t *)inited;
    }
    manifest_set_callbacks((uint64_t)v15, (uint64_t)v29, (uint64_t)v26);
    if (a3)
    {
      digest_init_from_img4_nonce((uint64_t)&v29[3], a3, v18, v19, v20, v21, v22, v23);
      v29[2] = &v29[3];
    }
    if (manifest_parse((uint64_t)v15))
    {
      v14 = 79;
      if (!inited)
        goto LABEL_16;
      goto LABEL_15;
    }
    v14 = manifest_impose(v15, a2, *(_QWORD *)(a1 + 48), 0);
    if (inited)
LABEL_15:
      manifest_destroy(&v28, v6, v7, v8, v9, v10, v11, v12);
  }
LABEL_16:
  if ((_DWORD)v14 == 85)
    return 8;
  if (v14 >= 0x6A)
    __panic_npx("panic: error not set to valid posix code: %d", v6, v7, v8, v9, v10, v11, v12, v14);
  return v14;
}

void _img4_firmware_prepare(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t expert;
  _QWORD *v12;
  uint64_t v13;
  uint64_t name;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t identifier_BOOL;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t identifier_digest;
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
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _OWORD v66[8];
  char v67;
  _OWORD v68[5];
  _OWORD v69[4];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v5 = *(uint64_t **)a3;
  expert = img4_runtime_get_expert(*(char **)(*(_QWORD *)a3 + 8));
  if (!expert)
    expert = generic_expert_specialist();
  v12 = *(_QWORD **)(a3 + 8);
  v13 = *v5;
  if ((*v5 & 4) != 0)
  {
    if (v5 < v5 + 161)
    {
      v20 = (char *)v5[1];
      v21 = img4_runtime_get_expert(v20);
      if (!v21)
        v21 = generic_expert_specialist();
      LOBYTE(v66[0]) = 0;
      if (img4_runtime_check_custom_BOOL((uint64_t)v20))
      {
        expert_log(v21, 2uLL, (uint64_t)"querying custom runtime for mix-n-match policy", v22, v23, v24, v25, v26, v63);
        identifier_BOOL = img4_runtime_get_identifier_BOOL((uint64_t)v20);
        if ((_DWORD)identifier_BOOL)
        {
          expert_log(v21, 0, (uint64_t)"failed to query mix-n-match identifier: %d", v28, v29, v30, v31, v32, identifier_BOOL);
        }
        else
        {
          expert_log(v21, 2uLL, (uint64_t)"preparing mix-n-match policy: 0x%x", v28, v29, v30, v31, v32, LOBYTE(v66[0]));
          odometer_prepare_mixn_match(a2, v66[0]);
        }
      }
      else
      {
        expert_log(v21, 2uLL, (uint64_t)"stock runtime; not querying for mix-n-match policy",
          v22,
          v23,
          v24,
          v25,
          v26,
          v63);
      }
      v33 = (char *)v5[1];
      v34 = img4_runtime_get_expert(v33);
      if (!v34)
        v34 = generic_expert_specialist();
      memset(v69, 0, sizeof(v69));
      memset(v68, 0, sizeof(v68));
      v67 = 0;
      memset(v66, 0, sizeof(v66));
      if (img4_runtime_check_custom_digest((uint64_t)v33))
      {
        expert_log(v34, 2uLL, (uint64_t)"querying custom runtime for boot manifest hash", v35, v36, v37, v38, v39, v64);
        identifier_digest = img4_runtime_get_identifier_digest((uint64_t)v33);
        if ((_DWORD)identifier_digest)
        {
          expert_log(v34, 0, (uint64_t)"failed to query manifest hash identifier: %d", v42, v43, v44, v45, v46, identifier_digest);
        }
        else
        {
          digest_init_from_img4_dgst((uint64_t)v68, (uint64_t)v69, v41, v42, v43, v44, v45, v46);
          digest_print_cstr((unint64_t)v68, (unint64_t)v66, v52, v53, v54, v55, v56, v57);
          expert_log(v34, 2uLL, (uint64_t)"preparing custom boot manifest hash: %s", v58, v59, v60, v61, v62, (uint64_t)v66);
          odometer_prepare_notarized_manifest_hash(a2, (uint64_t)v68);
        }
      }
      else
      {
        expert_log(v34, 2uLL, (uint64_t)"stock runtime; not querying for boot manifest hash",
          v35,
          v36,
          v37,
          v38,
          v39,
          v64);
      }
      expert_log(expert, 2uLL, (uint64_t)"forcing sideload anti-replay policy due to subsequent stage firmware evaluation", v47, v48, v49, v50, v51, v65);
      odometer_prepare_sideload_mixn_match(a2);
      goto LABEL_30;
    }
    goto LABEL_36;
  }
  if (*(_QWORD *)(a3 + 16))
  {
    expert_log(expert, 2uLL, (uint64_t)"prepared custom nonce hash", v6, v7, v8, v9, v10, v63);
    odometer_prepare_nonce_hash(a2, *(_QWORD *)(a3 + 16));
    v13 = *v5;
  }
  if ((v13 & 8) != 0)
  {
    expert_log(expert, 2uLL, (uint64_t)"forcing sideload anti-replay policy", v6, v7, v8, v9, v10, v63);
    odometer_prepare_sideload_mixn_match(a2);
  }
  if (v12[3] != 1 || v12[2] != 1)
    goto LABEL_30;
  if (v12 >= v12 + 33)
  {
LABEL_36:
    __break(0x5519u);
    return;
  }
  name = chip_get_name((uint64_t)v12);
  expert_log(expert, 1uLL, (uint64_t)"%s: simulating chip boot for reduced-security virtual chip policy", v15, v16, v17, v18, v19, name);
  odometer_prepare_mixn_match(a2, 1);
LABEL_30:
  if (!v5[6] && (*(_BYTE *)v5 & 0x20) == 0)
  {
    expert_log(expert, 2uLL, (uint64_t)"manifest-only evaluation; permitting replay", v6, v7, v8, v9, v10, v63);
    odometer_prepare_mixn_match(a2, 1);
  }
  if (!v12[25])
    odometer_prepare_mix_n_match_god_mode(a2);
  *(_DWORD *)(a3 + 104) = 0;
}

uint64_t *img4_firmware_destroy(uint64_t *result)
{
  unint64_t *v1;
  uint64_t *v2;
  char *v3;
  uint64_t expert;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;

  v1 = (unint64_t *)*result;
  if (*result)
  {
    v2 = result;
    v3 = (char *)v1[1];
    expert = img4_runtime_get_expert(v3);
    v12 = v1 + 157;
    v13 = v1 + 153;
    manifest_destroy(v1 + 78, v5, v6, v7, v8, v9, v10, v11);
    payload_destroy(v1 + 6);
    img4_buff_dealloc_internal((uint64_t)v3, &v13);
    img4_buff_dealloc_internal((uint64_t)v3, &v12);
    return (uint64_t *)_expert_dealloc_type(expert, v1[2], v2);
  }
  return result;
}

uint64_t _property_filter_all()
{
  return 0;
}

uint64_t _property_filter_constraint(uint64_t a1)
{
  if (*(_UNKNOWN **)(a1 + 48) == &_property_constraint_na)
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t _property_filter_anti_replay(uint64_t a1)
{
  if (*(_UNKNOWN **)(a1 + 48) == &_property_constraint_rp)
    return 0;
  else
    return 0xFFFFFFFFLL;
}

uint64_t _property_filter_manifest(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 56))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t _property_filter_object(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 56) == 1)
    return 0;
  else
    return 0xFFFFFFFFLL;
}

uint64_t _property_filter_chip_instance(uint64_t a1)
{
  return *(uint64_t *)(a1 + 64) >> 63;
}

uint64_t _property_filter_expert(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 16) == 33)
    return 0xFFFFFFFFLL;
  else
    return 0;
}

char *property_iterator_next(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  char **v9;
  char *v10;
  uint64_t (*v12)();
  uint64_t v13;
  uint64_t v14;

  v8 = *(_QWORD *)(a1 + 16);
  v9 = (char **)(v8 + 1);
  if (v8 == 37)
    return 0;
  if (v8 < -1)
LABEL_18:
    __panic_npx("panic: iteration underflow: idx = 0x%lx, %ld", a2, a3, a4, a5, a6, a7, a8, (char)v9);
  if ((unint64_t)v9 >= 0x27)
    __panic_npx("panic: iteration overflow: idx = 0x%lx, %lu", a2, a3, a4, a5, a6, a7, a8, v8 + 1);
  if (*(_QWORD *)a1)
    v12 = *(uint64_t (**)())a1;
  else
    v12 = _property_filter_all;
  v13 = v8;
  while (1)
  {
    v9 = &__all[v13 + 1];
    if (v9 < __all)
    {
      __break(0x5519u);
      goto LABEL_18;
    }
    v10 = __all[v8 + 1];
    if (!((unsigned int (*)(char *))v12)(v10))
      break;
    ++v8;
    ++v13;
    if ((unint64_t)v8 >= 0x25)
    {
      v14 = v8 + 1;
      goto LABEL_14;
    }
  }
  v14 = v8 + 1;
  if (!v10)
LABEL_14:
    v10 = 0;
  *(_QWORD *)(a1 + 8) = v10;
  *(_QWORD *)(a1 + 16) = v14;
  return v10;
}

uint64_t property_iterator_reset(uint64_t result)
{
  *(_QWORD *)(result + 8) = 0;
  *(_QWORD *)(result + 16) = -1;
  return result;
}

double Img4DecodeInitAsPayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double result;
  int v7;

  result = Img4DecodeInit(a1, a2, a3);
  if (v7 == 2)
    return Img4DecodeInitPayload(a1, a2, a3);
  return result;
}

void Img4DecodeInitAsManifest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6;

  Img4DecodeInit(a1, a2, a3);
  if (v6 == 2)
    Img4DecodeInitManifest(a1, a2, a3);
}

uint64_t Img4DecodeGetQueryForContainer(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 >= 6)
    __panic_npx("panic: unreachable case: %s = 0x%llx", a2, a3, a4, a5, a6, a7, a8, (char)"pc");
  return qword_251CD15D8[a1];
}

uint64_t Img4DecodeContainerExists(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(a2, a3);
}

uint64_t Img4DecodeQueryPropertyBool(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;

  v7 = (*(uint64_t (**)(uint64_t))(a1 + 16))(a3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 24))(a2, v7, a4);
}

uint64_t Img4DecodeQueryPropertyInteger64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;

  v7 = (*(uint64_t (**)(uint64_t))(a1 + 16))(a3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 32))(a2, v7, a4);
}

uint64_t Img4DecodeQueryPropertyData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;

  v9 = (*(uint64_t (**)(uint64_t))(a1 + 16))(a3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 40))(a2, v9, a4, a5);
}

uint64_t Img4DecodeIterateObjectItems(unint64_t *a1, unsigned int *a2, uint64_t (**a3)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a4)
{
  uint64_t result;
  unsigned int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _DWORD v17[2];
  _OWORD v18[3];
  uint64_t v19;
  _QWORD v20[2];
  unint64_t v21[2];
  _QWORD __dst[59];

  __dst[57] = *MEMORY[0x24BDAC8D0];
  v21[0] = 0;
  v21[1] = 0;
  v19 = 0;
  v20[0] = 0;
  v20[1] = 0;
  result = (uint64_t)DERDecodeSeqContentInit(a1 + 5, v21);
  if (!(_DWORD)result)
  {
    for (LODWORD(result) = DERDecodeSeqNext(v21, (unint64_t *)&v19);
          !(_DWORD)result;
          LODWORD(result) = DERDecodeSeqNext(v21, (unint64_t *)&v19))
    {
      v9 = v19;
      memset(v18, 0, sizeof(v18));
      v10 = memcpy(__dst, a1, 0x1C8uLL);
      memset(v17, 170, 5);
      v11 = log_expert(v10);
      if (v9 == 1296125520)
      {
        strcpy((char *)v17, "MANP");
        expert_log(v11, 2uLL, (uint64_t)"found %s; skipping", v12, v13, v14, v15, v16, (uint64_t)v17);
      }
      else
      {
        LOBYTE(v17[1]) = 0;
        v17[0] = bswap32(v9);
        expert_log(v11, 2uLL, (uint64_t)"found object: %s", v12, v13, v14, v15, v16, (uint64_t)v17);
        result = DERImg4DecodePropertyWithItem((uint64_t)v20, v19, 0x2000000000000011uLL, (unint64_t)v18);
        if ((_DWORD)result)
          return result;
        *a2 = v9;
        *(_OWORD *)&__dst[9] = *(_OWORD *)((char *)&v18[1] + 8);
        result = Img4DecodeEvaluateObjectProperties((uint64_t)__dst, *a3, a4);
        if ((_DWORD)result)
          return result;
        *a2 = 0;
      }
    }
    if ((_DWORD)result == 1)
      return 0;
    else
      return result;
  }
  return result;
}

void Img4DecodeCheckAuthority(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  uint64_t v3;
  uint64_t (*v4)();
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  v7 = xmmword_251CD15C0;
  v8 = 0;
  v2 = *a2;
  v3 = *((_QWORD *)a2 + 2);
  v4 = _CheckAuthorityEvalCertProperties;
  v5 = a2[2];
  v6 = *((_QWORD *)a2 + 6);
  Img4DecodePerformManifestTrustEvaluationWithCallbacks(a1, (uint64_t)&v7, (uint64_t)&v2, 0);
}

uint64_t _CheckAuthorityManifestPropertyCallback()
{
  return 0;
}

uint64_t _CheckAuthorityEvalCertProperties()
{
  return 0;
}

unint64_t DERImg4DecodePrintProperty(unint64_t result, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  const char *v10;
  unint64_t v11;
  unint64_t v12;
  BOOL v13;

  v13 = 0;
  v12 = 0;
  v9 = *(_QWORD *)(result + 40);
  if (v9 <= 0)
  {
    if (v9 != 0xA000000000000000)
    {
      if (v9 != 0xA000000000000001)
        return result;
      v10 = "MUST NOT EXIST";
      goto LABEL_16;
    }
    strcpy((char *)a2, "MUST EXIST");
  }
  else
  {
    switch(v9)
    {
      case 4:
        if (*(_QWORD *)(result + 32) >= 0x40uLL)
          v11 = 64;
        else
          v11 = *(_QWORD *)(result + 32);
        return sprintdgst_npx(a2, *(unsigned __int8 **)(result + 24), v11, a4, a5, a6, a7, a8);
      case 2:
        result = DERParseInteger64((char **)(result + 24), &v12);
        if ((_DWORD)result)
        {
LABEL_15:
          v10 = "decode failure";
LABEL_16:
          *(_QWORD *)a2 = *(_QWORD *)v10;
          *(_QWORD *)(a2 + 7) = *(_QWORD *)(v10 + 7);
          return result;
        }
        return snprintf((char *)a2, 0x81uLL, "0x%llx");
      case 1:
        result = DERParseBoolean((unsigned __int8 **)(result + 24), &v13);
        if (!(_DWORD)result)
          return snprintf((char *)a2, 0x81uLL, "%s");
        goto LABEL_15;
      default:
        return result;
    }
  }
  return result;
}

uint64_t CTImg4GetDigestType(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;

  v9 = *(_QWORD *)(a1 + 8);
  if (v9 == 5 && !memcmp(*(const void **)a1, &_oidSha1, 5uLL))
    return 1;
  if (v9 == 9 && !memcmp(*(const void **)a1, &_oidSha224, 9uLL))
    return 2;
  if (v9 == 9 && !memcmp(*(const void **)a1, &_oidSha256, 9uLL))
    return 4;
  if (v9 == 9 && !memcmp(*(const void **)a1, &_oidSha384, 9uLL))
    return 8;
  if (v9 != 9 || memcmp(*(const void **)a1, &_oidSha512, 9uLL))
    __panic_npx("panic: unsupported digest type: oid len = %lu", a2, a3, a4, a5, a6, a7, a8, v9);
  return 16;
}

uint64_t (**CTImg4GetDecodeImplementation(const DERItem *a1))()
{
  uint64_t (**v1)();
  uint64_t (**v2)();
  uint64_t (**v3)();
  uint64_t (**v4)();
  uint64_t (**v5)();

  if (a1 == &oidSha1Rsa)
    return _ctImg4RsaSha1Impl;
  if (a1 == &oidSha224Rsa)
    return 0;
  if (a1 == &oidSha256Rsa)
    return _ctImg4RsaSha256Impl;
  if (a1 == &oidSha384Rsa)
    return _ctImg4RsaSha384Impl;
  v1 = _ctImg4EcdsaSha1Impl;
  v2 = _ctImg4EcdsaSha256Impl;
  v3 = _ctImg4EcdsaSha384Impl;
  if (a1 == &oidSha512Ecdsa)
    v4 = _ctImg4EcdsaSha512Impl;
  else
    v4 = 0;
  if (a1 != &oidSha384Ecdsa)
    v3 = v4;
  if (a1 != &oidSha256Ecdsa)
    v2 = v3;
  if (a1 == &oidSha224Ecdsa)
    v5 = 0;
  else
    v5 = v2;
  if (a1 != &oidSha1Ecdsa)
    v1 = v5;
  if (a1 == &oidSha512Rsa)
    return _ctImg4RsaSha512Impl;
  else
    return v1;
}

unint64_t _Img4DecodePayloadPropertiesGetTag(uint64_t a1)
{
  return a1 | 0xE000000000000000;
}

uint64_t _chip_decode_select_static(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;

  expert_log(a2, 2uLL, (uint64_t)"%s: decode selection: static", a4, a5, a6, a7, a8, *(_QWORD *)(a1 + 8));
  result = *(_QWORD *)(a1 + 32);
  if (!result)
    __panic_npx("panic: illegal chip definition: no static decode implementation: %s", v9, v10, v11, v12, v13, v14, v15, *(_QWORD *)(a1 + 8));
  return result;
}

uint64_t chip_get_name(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

uint64_t _chip_decode_select_trust_store(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
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
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unsigned __int8 *v29;
  unint64_t v30;
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
  int DigestType;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  unsigned __int8 *v60;
  unint64_t v61;
  _QWORD v62[2];
  unint64_t v63;
  uint64_t v64;
  _OWORD v65[8];
  char v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v63 = 0;
  v64 = 0;
  v59 = 0;
  v60 = 0;
  v61 = 0;
  v66 = 0;
  memset(v65, 0, sizeof(v65));
  expert_log(a2, 2uLL, (uint64_t)"%s: decode selection: trust store [0x%llx]", a4, a5, a6, a7, a8, *(_QWORD *)(a1 + 8));
  if (*(_QWORD *)(a1 + 32))
    __panic_npx("panic: illegal chip definition: trust store cannot override static decode implementation: %s", v11, v12, v13, v14, v15, v16, v17, *(_QWORD *)(a1 + 8));
  if (expert_query_trust_store(a2, *(_QWORD *)(a1 + 56), a1, (uint64_t)&v63, (uint64_t)&v64))
  {
    expert_log(a2, 0, (uint64_t)"%s: failed to query anchor: 0x%llx: %d", v18, v19, v20, v21, v22, *(_QWORD *)(a1 + 8));
  }
  else
  {
    result = (*(uint64_t (**)(void))(a1 + 48))();
    v30 = *(_QWORD *)(result + 24);
    v29 = *(unsigned __int8 **)(result + 32);
    if (v29 > &v29[v30])
    {
      __break(0x5519u);
      return result;
    }
    v62[0] = *(_QWORD *)(result + 32);
    v62[1] = v30;
    sprintdgst_npx((unint64_t)v65, v29, v30, v24, v25, v26, v27, v28);
    expert_log(a2, 1uLL, (uint64_t)"%s: retrieved pinned root from trust store: type = 0x%llx, length = %lu, oid = %s, oid length = %lu", v31, v32, v33, v34, v35, *(_QWORD *)(a1 + 8));
    if (DERDecodeItem((uint64_t)v62, &v59))
    {
      expert_log(a2, 0, (uint64_t)"%s: DERDecodeItem: %d", v36, v37, v38, v39, v40, *(_QWORD *)(a1 + 8));
    }
    else
    {
      sprintdgst_npx((unint64_t)v65, v60, v61, v36, v37, v38, v39, v40);
      expert_log(a2, 1uLL, (uint64_t)"%s: finding digest algorithm for oid: %s", v41, v42, v43, v44, v45, *(_QWORD *)(a1 + 8));
      DigestType = CTImg4GetDigestType((uint64_t)&v60, v46, v47, v48, v49, v50, v51, v52);
      if (!CTImg4CreateContext(v63, v64, DigestType, 0, a3))
        return *(_QWORD *)a3;
      expert_log(a2, 0, (uint64_t)"%s: failed to parse root: %d", v54, v55, v56, v57, v58, *(_QWORD *)(a1 + 8));
    }
  }
  return 0;
}

uint64_t chip_dump(uint64_t a1, mach_header_64 *mhp, unint64_t a3)
{
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t size;

  size = 0xAAAAAAAAAAAAAAAALL;
  v6 = getsectdatafromheader_64(mhp, "__DATA_CONST", "__image4_chp", &size);
  v7 = (uint64_t)&v6[_dyld_get_image_slide()];
  size = 0xAAAAAAAAAAAAAAAALL;
  v8 = getsectdatafromheader_64(mhp, "__DATA_CONST", "__image4_chp", &size);
  result = _dyld_get_image_slide();
  if (v7 < (unint64_t)&v8[result + size])
  {
    do
    {
      v7 += 8;
      expert_log(a1, a3, (uint64_t)"%6s  %-36s : %s", v10, v11, v12, v13, v14, (uint64_t)&unk_24BAA271F);
      size = 0xAAAAAAAAAAAAAAAALL;
      v15 = getsectdatafromheader_64(mhp, "__DATA_CONST", "__image4_chp", &size);
      result = _dyld_get_image_slide();
    }
    while (v7 < (unint64_t)&v15[result + size]);
  }
  return result;
}

unint64_t chip_get_property_expert(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;

  v4 = chip_expert(a1);
  v5 = v4;
  if (!v4)
    return v5;
  v6 = v4 + 288;
  v7 = chip_expert_instance(a1);
  v15 = *(_QWORD *)(a1 + 16);
  if (v15 - 2 >= 2 && v15 != 0)
  {
    if (v15 != 1)
      goto LABEL_16;
    if (!chip_instance_check(v7, a2, v9, v10, v11, v12, v13, v14))
    {
      v6 = 0;
      v5 = 0;
    }
    v15 = *(_QWORD *)(a1 + 16);
  }
  if (v15 < a2[10])
    return 0;
  if (v5 && v5 >= v6)
  {
    __break(0x5519u);
LABEL_16:
    __panic_npx("panic: unreachable case: %s = 0x%llx", v8, v9, v10, v11, v12, v13, v14, (char)"chp->chp_type");
  }
  return v5;
}

unint64_t chip_select_property_expert(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  char **v6;
  unint64_t property_expert;

  if (a1)
  {
    if (*(_QWORD *)(a1 + 256))
      v6 = *(char ***)(a1 + 256);
    else
      v6 = &_property_DGST;
    if (!property_equal((uint64_t)a2, (uint64_t)v6))
    {
      property_expert = chip_get_property_expert(a1, a2);
      if (property_expert)
        return property_expert;
    }
  }
  return a3;
}

char **chip_get_digest(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 256))
    return *(char ***)(a1 + 256);
  else
    return &_property_DGST;
}

uint64_t chip_get_constraint(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t *v5;
  uint64_t *v7;

  v3 = *(_QWORD *)(a2 + 16);
  if (v3 == 33)
    return a2;
  v4 = *(_QWORD *)(result + 64);
  if (!v4)
    goto LABEL_17;
  v5 = (uint64_t *)(v4 + 8 * v3);
  if ((unint64_t)v5 >= v4 + 264 || (unint64_t)v5 < v4)
    goto LABEL_19;
  result = *v5;
  if (!*v5)
  {
LABEL_17:
    if (!a3)
      return a2;
    v7 = (uint64_t *)(a3 + 8 * v3);
    if ((unint64_t)v7 >= a3 + 264 || (unint64_t)v7 < a3)
    {
LABEL_19:
      __break(0x5519u);
      return result;
    }
    result = *v7;
    if (!*v7)
      return a2;
  }
  return result;
}

uint64_t chip_select_decode(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 40))();
}

uint64_t chip_check_entitlement(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = 0;
  v4 = a1 + 120;
  while (1)
  {
    v5 = *(_QWORD *)(v4 + v3);
    if (!v5)
      return 0xFFFFFFFFLL;
    if (property_equal(a2, v5))
      break;
    v3 += 8;
    if (v3 == 40)
      return 0xFFFFFFFFLL;
  }
  return 0;
}

uint64_t chip_get_anti_replay(uint64_t a1)
{
  return *(_QWORD *)(a1 + 160);
}

uint64_t chip_get_pivot(uint64_t a1)
{
  return *(_QWORD *)(a1 + 192);
}

uint64_t chip_get_anti_replay_sideload(uint64_t a1)
{
  return *(_QWORD *)(a1 + 176);
}

uint64_t chip_get_mix_n_match(uint64_t a1)
{
  return *(_QWORD *)(a1 + 184);
}

uint64_t chip_get_notary(uint64_t a1)
{
  return *(_QWORD *)(a1 + 248);
}

uint64_t __handle_absence_0(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  *a3 = 0;
  return 0;
}

void _prepare_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t boot_nonce;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t nonce_digest;
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
  size_t v24;
  size_t __n;
  _OWORD v26[5];
  _OWORD v27[4];
  _QWORD v28[3];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(*(_QWORD *)a3 + 24);
  v5 = *(_QWORD *)(v4 + 8);
  v29[0] = 0;
  v29[1] = 0;
  v24 = 0;
  __n = 0;
  memset(v28, 0, sizeof(v28));
  memset(v27, 0, sizeof(v27));
  memset(v26, 0, sizeof(v26));
  boot_nonce = image4_environment_callout_query_boot_nonce(v4, (uint64_t)v29, (uint64_t)&__n);
  if (!(_DWORD)boot_nonce)
  {
    if (__n <= 0x10)
    {
      nonce_init(v28, v29, __n, v7, v8, v9, v10, v11);
      odometer_prepare_nonce(a2, v28, v18, v19, v20, v21, v22, v23);
      return;
    }
    goto LABEL_12;
  }
  if ((_DWORD)boot_nonce != 45)
  {
    expert_log(v5, 0, (uint64_t)"failed to get boot nonce from callback: %d", v7, v8, v9, v10, v11, boot_nonce);
    return;
  }
  nonce_digest = image4_environment_callout_query_nonce_digest(v4, (uint64_t)v27, (uint64_t)&v24);
  if ((_DWORD)nonce_digest != 45)
  {
    if (!(_DWORD)nonce_digest)
    {
      if (v24 <= 0x40)
      {
        digest_init((uint64_t)v26, v27, v24, v13, v14, v15, v16, v17);
        odometer_prepare_nonce_hash(a2, (uint64_t)v26);
        return;
      }
LABEL_12:
      __break(0x5519u);
      return;
    }
    expert_log(v5, 0, (uint64_t)"failed to get nonce digest from callback: %d", v13, v14, v15, v16, v17, nonce_digest);
  }
}

uint64_t _get_constraint_mask_2()
{
  return 0;
}

uint64_t _extract_payload_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  int v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD v12[5];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v7 = *(unsigned __int16 *)(a3 + 528);
  memset(&v12[3], 0, 32);
  if (v7)
    v8 = a3 + 528;
  else
    v8 = 0;
  memset(&v12[1], 0, 32);
  if (v7)
    v9 = a3 + 72;
  else
    v9 = 0;
  v12[0] = 0uLL;
  v10 = manifest_measure(a3, a2, (uint64_t)v12);
  *a5 = *(_QWORD *)(*(uint64_t (**)(uint64_t))(a2 + 48))(v10);
  if (v9 + 456 > v8)
    __break(0x5519u);
  return v9 + 328;
}

_QWORD *_payload_img4_get_measured_bytes(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  unint64_t v9;
  char vars0;

  if (!*((_WORD *)result + 44))
    __panic_npx("panic: optional not set", (uint64_t)a2, a3, a4, a5, a6, a7, a8, vars0);
  v9 = result[6];
  v8 = result[7];
  if (v9 <= v9 + v8)
    return buff_init_wrap(a2, v9, v8);
  __break(0x5519u);
  return result;
}

uint64_t payload_init(uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t **a4)
{
  _payload_init(a1, a3, a2);
  buff_xfer((_QWORD *)(a1 + 48), a4);
  *(_WORD *)(a1 + 88) = 1;
  return a1;
}

double _payload_init(uint64_t a1, unsigned int *a2, uint64_t a3)
{
  double result;

  if (!a3)
    a3 = generic_expert_specialist();
  *(_QWORD *)a1 = a3;
  *(_QWORD *)(a1 + 8) = fourcc_copy(a1 + 16, a2);
  *(_QWORD *)(a1 + 32) = _payload_callbacks_bare;
  *(_QWORD *)(a1 + 40) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  return result;
}

uint64_t payload_init_borrow(uint64_t a1, uint64_t a2, unsigned int *a3, _QWORD *a4)
{
  _payload_init(a1, a3, a2);
  buff_borrow((_QWORD *)(a1 + 48), a4);
  *(_QWORD *)(a1 + 96) = a4;
  *(_WORD *)(a1 + 88) = 1;
  return a1;
}

uint64_t payload_init_wrap(uint64_t a1, uint64_t a2, unsigned int *a3, _QWORD *a4)
{
  _payload_init(a1, a3, a2);
  buff_init_alias((_QWORD *)(a1 + 48), a4);
  *(_WORD *)(a1 + 88) = 1;
  return a1;
}

uint64_t payload_init_empty(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  _payload_init(a1, a3, a2);
  return a1;
}

uint64_t payload_set_callbacks(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(result + 32) = a2;
  *(_QWORD *)(result + 40) = a3;
  return result;
}

uint64_t payload_parse(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unsigned int PayloadType;
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
  _DWORD *v22;
  int v23;

  v23 = 0;
  v9 = _payload_parse_internal((uint64_t)a1);
  if (!(_DWORD)v9)
  {
    PayloadType = Img4DecodeGetPayloadType((uint64_t)(a1 + 14), &v23);
    if (!PayloadType)
    {
      v22 = (_DWORD *)a1[1];
      if (*v22 == v23)
        return 0;
      expert_log(*a1, 0, (uint64_t)"%s: unexpected payload type: actual = %s, expected = %s", v11, v12, v13, v14, v15, (uint64_t)(v22 + 1));
      return 79;
    }
    v9 = posixdr(PayloadType);
    expert_log(*a1, 0, (uint64_t)"%s: Img4DecodeGetPayloadType: %d", v16, v17, v18, v19, v20, a1[1] + 4);
  }
  if (v9 >= 0x6A)
    __panic_npx("panic: error not set to valid posix code: %d", v2, v3, v4, v5, v6, v7, v8, v9);
  return v9;
}

unint64_t _payload_parse_internal(uint64_t a1)
{
  unint64_t result;
  uint64_t v3;
  unsigned int v4;
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

  if (!*(_WORD *)(a1 + 88))
    return 0;
  result = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  if (result <= result + v3)
  {
    Img4DecodeInitAsPayload(result, v3, a1 + 112);
    if (v4)
    {
      v5 = posixdr(v4);
      expert_log(*(_QWORD *)a1, 0, (uint64_t)"%s: Img4DecodeInitAsPayload: %d", v6, v7, v8, v9, v10, *(_QWORD *)(a1 + 8) + 4);
      if (v5 >= 0x6A)
        __panic_npx("panic: error not set to valid posix code: %d", v11, v12, v13, v14, v15, v16, v17, v5);
      return v5;
    }
    *(_QWORD *)(a1 + 104) = a1 + 112;
    if (*(uint64_t (***)())(a1 + 32) == _payload_callbacks_bare)
    {
      v5 = 0;
      *(_QWORD *)(a1 + 32) = _payload_callbacks_im4p;
      return v5;
    }
    return 0;
  }
  __break(0x5519u);
  return result;
}

uint64_t payload_measure(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 32))(a1, a2, a3, *(_QWORD *)(a1 + 40));
}

uint64_t payload_get_decoded_bytes(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 8))(a1, a2, *(_QWORD *)(a1 + 40));
}

_QWORD *payload_get_encoded_bytes(uint64_t a1, _QWORD *a2)
{
  return buff_init_wrap(a2, *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8), *(_QWORD *)(*(_QWORD *)(a1 + 104) + 16));
}

unint64_t *payload_destroy(unint64_t *result)
{
  unint64_t v1;
  unint64_t *v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = *result;
  if (*result)
  {
    v2 = result;
    v3 = (_QWORD *)(v1 + 48);
    if (!*(_WORD *)(v1 + 88))
      v3 = 0;
    v5 = v3;
    v4 = *(_QWORD *)(v1 + 96);
    if (v4)
      buff_return(v4, &v5);
    result = buff_destroy(&v5);
    *(_WORD *)(v1 + 88) = 0;
    if (v1 >= v1 + 568)
    {
      __break(0x5519u);
    }
    else
    {
      result = (unint64_t *)(*(uint64_t (**)(unint64_t, _QWORD))(*(_QWORD *)(v1 + 32) + 16))(v1, *(_QWORD *)(v1 + 40));
      *v2 = 0;
    }
  }
  return result;
}

uint64_t _payload_im4p_measure(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t alloc_preference;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t size;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  _OWORD *v26;
  size_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  size_t *v37;
  size_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v45;
  uint64_t v46;
  _OWORD v47[4];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v6 = *a1;
  v46 = 0;
  memset(v47, 0, sizeof(v47));
  alloc_preference = _type_get_alloc_preference((uint64_t)&_image4_type_decode_context);
  if (alloc_preference <= 1)
    v15 = 1;
  else
    v15 = alloc_preference;
  if (v15 == 1)
    goto LABEL_8;
  if (v15 != 2)
    __panic_npx("panic: unreachable case: %s = 0x%llx", v8, v9, v10, v11, v12, v13, v14, (char)"_t_preference");
  v16 = _expert_alloc_type(v6, (uint64_t)&_image4_type_decode_context);
  if (!v16)
  {
LABEL_8:
    size = type_get_size((uint64_t)&_image4_type_decode_context);
    v25 = MEMORY[0x24BDAC7A8](size, v18, v19, v20, v21, v22, v23, v24);
    v26 = (_OWORD *)((char *)&v45 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
    if (v25 >= 0x31)
      v27 = v25 - 48;
    else
      v27 = 0;
    memset(v26 + 3, 170, v27);
    *v26 = 0u;
    v26[1] = 0u;
    v26[2] = 0u;
  }
  else
  {
    v46 = v16;
  }
  v28 = chip_select_decode(a2);
  if (!v28)
    __panic_npx("panic: no decode implementation available for chip: %s", v29, v30, v31, v32, v33, v34, v35, *(_QWORD *)(a2 + 8));
  v36 = v28;
  v37 = *(size_t **)(v28 + 32);
  v38 = *v37;
  if (*v37 > 0x40)
  {
    __break(0x5519u);
LABEL_18:
    __panic_npx("panic: Img4DecodeCopyPayloadDigest: %d", v29, v30, v36, v32, v33, v34, v35, v28);
  }
  LODWORD(v28) = Img4DecodeCopyPayloadDigest(a1[13], v47, *v37, (uint64_t (**)(_QWORD, _QWORD, _OWORD *, size_t, _QWORD))v28);
  if ((_DWORD)v28)
    goto LABEL_18;
  _expert_dealloc_type(v6, (uint64_t)&_image4_type_decode_context, &v46);
  return digest_init(a3, v47, v38, v39, v40, v41, v42, v43);
}

_QWORD *_payload_bare_measure(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v17;

  if (!*(_WORD *)(a1 + 88))
    __panic_npx("panic: optional not set", a2, (uint64_t)a3, a4, a5, a6, a7, a8, v17);
  v10 = (_QWORD *)(*(uint64_t (**)(void))(a2 + 48))();
  return digest_init_measure(a3, v10, a1 + 48, v11, v12, v13, v14, v15);
}

_QWORD *_payload_bare_get_measured_bytes(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  unint64_t v9;
  char vars0;

  if (!*((_WORD *)result + 44))
    __panic_npx("panic: optional not set", (uint64_t)a2, a3, a4, a5, a6, a7, a8, vars0);
  v9 = result[6];
  v8 = result[7];
  if (v9 <= v9 + v8)
    return buff_init_wrap(a2, v9, v8);
  __break(0x5519u);
  return result;
}

_QWORD *_payload_im4p_get_measured_bytes(uint64_t a1, _QWORD *a2)
{
  int Payload;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;

  v12 = 0;
  v13 = 0;
  Payload = Img4DecodeGetPayload(*(_QWORD *)(a1 + 104), (uint64_t)&v12);
  if (Payload)
    __panic_npx("panic: Img4DecodeGetPayload: %d", v4, v5, v6, v7, v8, v9, v10, Payload);
  return buff_init_wrap(a2, v12, v13);
}

uint64_t darwin_uuid_parse(_BYTE *a1, unsigned __int8 *a2)
{
  __int128 v3;
  __int128 v5;
  _BYTE v6[21];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (!*a1)
    return 2;
  *(_QWORD *)&v6[13] = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v5 = v3;
  *(_OWORD *)v6 = v3;
  __strlcpy_chk();
  if (uuid_parse((const char *)&v5, a2))
    return 22;
  else
    return 0;
}

uint64_t image4_auditor_post(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _OWORD v10[17];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v11 = 0;
  memset(v10, 0, sizeof(v10));
  image4_audit_event_init((uint64_t *)v10, a2, a3, a4, a5, a6, a7, a8);
  return (*(uint64_t (**)(uint64_t, _OWORD *, _QWORD))(*(_QWORD *)(a1 + 80) + 8))(a1, v10, *(_QWORD *)(a1 + 88));
}

uint64_t *image4_audit_event_init(uint64_t *a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v8;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  *a1 = a2;
  v8 = *(_DWORD *)(a2 + 56);
  if (v8 >= 4)
    __panic_npx("panic: unreachable case: %s = 0x%llx", a2, a3, a4, a5, a6, a7, a8, (char)"p->p_container");
  a1[34] = qword_24BA99608[v8];
  if (a3 >= 4)
    __panic_npx("panic: unreachable case: %s = 0x%llx", a2, a3, a4, a5, a6, a7, a8, (char)"mfr");
  a1[33] = a3;
  if (a4)
  {
    a1[1] = image4_audit_value_init((uint64_t)(a1 + 2), a2, a4, a4, a5, a6, a7, a8);
    a1[17] = image4_audit_value_init((uint64_t)(a1 + 18), a2, a5, v12, v13, v14, v15, v16);
  }
  return a1;
}

uint64_t image4_auditor_interpose_decode(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  __int128 v3;
  uint64_t result;

  v2 = *(_QWORD *)(a2 + 48);
  v3 = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 16) = _AuditorComputeDigest;
  *(_QWORD *)(a1 + 24) = _AuditorVerifyChain;
  result = a1 + 16;
  *(_QWORD *)(result + 16) = _AuditorVerifySignature;
  *(_QWORD *)(result + 24) = _AuditorEvaluateCertificateProperties;
  *(_OWORD *)(result + 32) = v3;
  *(_QWORD *)(result - 8) = result;
  *(_QWORD *)(result + 48) = v2;
  *(_QWORD *)(result + 56) = a2;
  return result;
}

uint64_t _AuditorComputeDigest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v10 = __current();
  result = (**(uint64_t (***)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 72))(a1, a2, a3, a4, a5);
  if ((_DWORD)result)
    __panic_npx("panic: digest computation failed: %d", v12, v13, v14, v15, v16, v17, v18, result);
  return result;
}

uint64_t _AuditorVerifyChain(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v16 = __current();
  v17 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 + 72) + 8))(a1, a2, a3, a4, a5, a6, a7, a8);
  v23 = v17;
  if ((_DWORD)v17)
    _auerr(v16, v17, "certificate chain verification failed: %d", v18, v19, v20, v21, v22, v17);
  return v23;
}

uint64_t _AuditorVerifySignature(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v16 = __current();
  v17 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 + 72) + 16))(a1, a2, a3, a4, a5, a6, a7, a8);
  v23 = v17;
  if ((_DWORD)v17)
    _auerr(v16, v17, "signature verification failed: %d", v18, v19, v20, v21, v22, v17);
  return v23;
}

uint64_t _AuditorEvaluateCertificateProperties(_QWORD *a1)
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  int v17;
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
  _OWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
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
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v69;
  _OWORD v70[3];
  __int128 __s2;
  _OWORD v72[2];
  __int128 v73;
  unint64_t v74[2];
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint64_t v78;
  const void *v79;
  size_t v80;
  unint64_t v81[3];
  uint64_t v82;
  int v83;
  uint64_t v84;
  _QWORD v85[2];
  uint64_t v86;
  unint64_t v87[3];

  v2 = __current();
  v8 = v2;
  v87[0] = 0;
  v87[1] = 0;
  v85[1] = 0;
  v86 = 0;
  v84 = 0;
  v85[0] = 0;
  if (!a1[40])
  {
    _auerr(v2, 0, "certificate properties invalid length: actual = %lu, expected > 0", v3, v4, v5, v6, v7, 0);
    return 3;
  }
  v9 = DERDecodeSeqInit((uint64_t)(a1 + 39), &v86, v87);
  if ((_DWORD)v9)
  {
    v15 = v9;
    _auerr(v8, v9, "DERDecodeSeqInit: %d", v10, v11, v12, v13, v14, v9);
    return v15;
  }
  if (v86 != 0x2000000000000011)
  {
    _auerr(v8, 0, "bad certificate tag: actual = 0x%llx, expected = 0x%llx", v10, v11, v12, v13, v14, v86);
    return 2;
  }
  v16 = v85;
LABEL_7:
  while (2)
  {
    v17 = DERDecodeSeqNext(v87, (unint64_t *)&v84);
    if (v17)
    {
      if (v17 != 1)
        __panic_npx("panic: exited enforcement loop with bogus value: dr = %d", v18, v19, v20, v21, v22, v23, v24, v17);
      return 0;
    }
    v83 = 0;
    v82 = 0;
    *(_OWORD *)v81 = 0uLL;
    v78 = 0;
    v79 = 0;
    v80 = 0;
    v76 = 0u;
    v77 = 0u;
    v75 = 0u;
    v74[0] = 0;
    v74[1] = 0;
    v73 = 0u;
    memset(v72, 0, sizeof(v72));
    __s2 = 0uLL;
    fourcc_init((uint64_t)&v82, v84);
    v30 = a1 + 7;
    switch(v84)
    {
      case 0xE00000004D414E50:
        goto LABEL_12;
      case 0xE00000004F424A50:
        v30 = a1 + 9;
        if (!a1[9])
        {
          v30 = a1 + 9;
          if (!a1[10])
            continue;
        }
LABEL_12:
        *(_OWORD *)v81 = *v30;
        v31 = v16;
        v32 = DERImg4DecodeProperty(v16, v84, (uint64_t)&v75);
        if ((_DWORD)v32)
        {
          v67 = v32;
          _auerr(v8, v32, "DERImg4DecodeProperty: %d", v33, v34, v35, v36, v37, v32);
          return v67;
        }
        if (*((_QWORD *)&v77 + 1) != 0x2000000000000011)
        {
          _auerr(v8, 0, "unexpected certificate dictionary type: actual = 0x%llx, expected = 0x%llx", v33, v34, v35, v36, v37, SBYTE8(v77));
          return 2;
        }
        v38 = DERDecodeSeqContentInit((unint64_t *)&v76 + 1, v74);
        if ((_DWORD)v38)
        {
          v67 = (uint64_t)v38;
          _auerr(v8, (uint64_t)v38, "DERDecodeSeqContentInit: %d", v39, v40, v41, v42, v43, (char)v38);
          return v67;
        }
        while (1)
        {
          v44 = DERDecodeSeqNext(v74, (unint64_t *)&v78);
          if (v44)
          {
            v16 = v31;
            if (v44 != 1)
              __panic_npx("panic: bogus exit from enforcement loop: pdr = %d", v45, v46, v47, v48, v49, v50, v51, v44);
            goto LABEL_7;
          }
          memset(v70, 0, sizeof(v70));
          fourcc_init((uint64_t)&v82, v78);
          v52 = DERImg4DecodeProperty(&v79, v78, (uint64_t)v72);
          if ((_DWORD)v52)
            goto LABEL_33;
          v58 = *((_QWORD *)&v73 + 1) == 0xA000000000000001;
          DERImg4DecodeContentFindItemWithTag(v81, v78, &__s2);
          if (v64 != v58)
            break;
          if (*((_QWORD *)&v73 + 1) <= 4uLL && ((1 << SBYTE8(v73)) & 0x16) != 0)
          {
            v52 = DERImg4DecodeProperty(&__s2, v78, (uint64_t)v70);
            if ((_DWORD)v52)
            {
LABEL_33:
              v67 = v52;
              _auerr(v8, v52, "DERImg4DecodeProperty: %s: %d", v53, v54, v55, v56, v57, (char)&v82 + 4);
              return v67;
            }
            if (v80 == *((_QWORD *)&__s2 + 1) && !memcmp(v79, (const void *)__s2, v80))
              aupost(v8, (uint64_t)&v82, 0, (uint64_t)v72, (uint64_t)v70, v55, v56, v57);
            else
              aupost(v8, (uint64_t)&v82, 1, (uint64_t)v72, (uint64_t)v70, v55, v56, v57);
          }
          else
          {
            if ((unint64_t)(*((_QWORD *)&v73 + 1) + 0x6000000000000000) >= 2)
            {
              _auerr(v8, 0, "unexpected certificate property type: tag = %s, type = 0x%llx", v59, v60, v61, v62, v63, (char)&v82 + 4);
              return 2;
            }
            v65 = v8;
            v66 = 0;
LABEL_27:
            aupost(v65, (uint64_t)&v82, v66, (uint64_t)v72, 0, v61, v62, v63);
          }
        }
        v65 = v8;
        v66 = 1;
        goto LABEL_27;
      case 0xE00000006D616E78:
        _auerr(v8, 0, "manx section constraints not implemented", v25, v26, v27, v28, v29, v69);
        return 4;
    }
  }
  _auerr(v8, 0, "unexpected section tag: %s", v25, v26, v27, v28, v29, (char)&v82 + 4);
  return 2;
}

uint64_t image4_audit_value_init(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  unint64_t v13;

  *(_QWORD *)result = a2;
  v8 = *(_OWORD *)a3;
  v9 = *(_OWORD *)(a3 + 32);
  *(_OWORD *)(result + 32) = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(result + 48) = v9;
  *(_OWORD *)(result + 16) = v8;
  v10 = *(_OWORD *)(a3 + 48);
  v11 = *(_OWORD *)(a3 + 64);
  v12 = *(_OWORD *)(a3 + 80);
  *(_QWORD *)(result + 112) = *(_QWORD *)(a3 + 96);
  *(_OWORD *)(result + 80) = v11;
  *(_OWORD *)(result + 96) = v12;
  *(_OWORD *)(result + 64) = v10;
  v13 = **(_QWORD **)(a2 + 40);
  if (v13 >= 5)
    __panic_npx("panic: unreachable case: %s = 0x%llx", a2, a3, a4, a5, a6, a7, a8, (char)"p->p_type->pt_switchable");
  *(_QWORD *)(result + 8) = qword_24BA99628[v13];
  return result;
}

uint64_t image4_auditor_new(uint64_t (**a1)(void), uint64_t a2)
{
  uint64_t v4;
  uint64_t result;

  v4 = generic_expert_specialist();
  result = _expert_alloc_type(v4, (uint64_t)&_image4_type_auditor);
  if (result)
  {
    *(_QWORD *)(result + 80) = a1;
    *(_QWORD *)(result + 88) = a2;
    __current = *a1;
  }
  return result;
}

uint64_t *image4_auditor_destroy(uint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  char vars0;

  if (*result)
  {
    v8 = *(_QWORD *)*result;
    if (!*(_WORD *)(v8 + 744))
      __panic_npx("panic: optional not set", a2, a3, a4, a5, a6, a7, a8, vars0);
    return (uint64_t *)_expert_dealloc_type(*(_QWORD *)(v8 + 152), (uint64_t)&_image4_type_auditor, result);
  }
  return result;
}

uint64_t image4_audit_event_get_section(uint64_t a1)
{
  return *(_QWORD *)(a1 + 272);
}

uint64_t image4_audit_event_get_result(uint64_t a1)
{
  return *(_QWORD *)(a1 + 264);
}

uint64_t image4_audit_event_get_imposed_value(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

uint64_t image4_audit_event_get_constrained_value(uint64_t a1)
{
  return *(_QWORD *)(a1 + 136);
}

uint64_t image4_audit_value_get_type(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

char *image4_audit_value_print(uint64_t *a1, char *__str, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return property_print_value(*a1, (unint64_t)(a1 + 2), __str, a4, a5, a6, a7, a8);
}

uint64_t _auerr(uint64_t a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  char __str[16];
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
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
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
  *(_OWORD *)__str = 0u;
  v13 = 0u;
  vsnprintf(__str, 0x100uLL, a3, &a9);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(a1 + 80) + 16))(a1, __str, a2);
}

uint64_t aupost(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13;
  void *v14;
  uint64_t *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  _OWORD *v19;
  _OWORD *v20;
  unint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t *v28;
  void *v29;
  int v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  _OWORD v36[7];
  _OWORD v37[7];
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
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v37[0] = xmmword_24BA995A0;
  memset(&v37[1], 170, 88);
  v36[0] = xmmword_24BA995A0;
  memset(&v36[1], 170, 88);
  v35 = 0;
  v13 = *(_QWORD *)(a4 + 40);
  if (v13 <= 0)
  {
    if (v13 == 0xA000000000000000)
    {
      v14 = &_property_constraint_ex;
    }
    else
    {
      if (v13 != 0xA000000000000001)
        goto LABEL_20;
      v14 = &_property_constraint_nx;
    }
LABEL_14:
    v15 = (uint64_t *)&_property_type_BOOL;
    goto LABEL_15;
  }
  if (v13 == 1)
  {
    v14 = &_property_constraint_eq;
    goto LABEL_14;
  }
  if (v13 != 2)
  {
    if (v13 == 4)
    {
      v14 = &_property_constraint_eq;
      v15 = &_property_type_digest;
LABEL_15:
      v23 = a2 + 4;
      v24 = 0;
      v18 = *(_QWORD *)a2;
      v25 = 33;
      v26 = v18;
      v27 = *(_DWORD *)(a2 + 8);
      goto LABEL_16;
    }
LABEL_20:
    __panic_npx("panic: unreachable case: %s = 0x%llx", a2, a3, a4, a5, a6, a7, a8, (char)"constraint->type");
  }
  v16 = DERParseInteger((char **)(a4 + 24), &v35);
  v23 = a2 + 4;
  v24 = 0;
  v17 = *(_QWORD *)a2;
  v25 = 33;
  v26 = v17;
  v27 = *(_DWORD *)(a2 + 8);
  v15 = &_property_type_uint32;
  if (v16)
    v15 = &_property_type_uint64;
  v14 = &_property_constraint_eq;
LABEL_16:
  v28 = v15;
  v29 = v14;
  v30 = 2;
  v31 = xmmword_24BA992A0;
  v33 = 0;
  v34 = 0;
  v32 = 4;
  if (a5)
  {
    _property_value_init_with_DERImg4(v37, a4);
    _property_value_init_with_DERImg4(v36, a5);
    v55 = 0;
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
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v38 = 0u;
    v19 = v37;
    v20 = v36;
    v21 = a3;
  }
  else
  {
    v55 = 0;
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
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v38 = 0u;
    v21 = a3;
    v19 = 0;
    v20 = 0;
  }
  image4_audit_event_init((uint64_t *)&v38, (uint64_t)&v23, v21, (uint64_t)v19, (uint64_t)v20, a6, a7, a8);
  return (*(uint64_t (**)(uint64_t, __int128 *, _QWORD))(*(_QWORD *)(a1 + 80) + 8))(a1, &v38, *(_QWORD *)(a1 + 88));
}

uint64_t _property_value_init_with_DERImg4(_QWORD *a1, uint64_t a2)
{
  char **v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int v12;
  BOOL v13;

  v13 = 0;
  v12 = 0;
  v11 = 0;
  v4 = (char **)(a2 + 24);
  result = DERParseBoolean((unsigned __int8 **)(a2 + 24), &v13);
  if ((_DWORD)result)
  {
    result = DERParseInteger(v4, &v12);
    if ((_DWORD)result)
    {
      result = DERParseInteger64(v4, &v11);
      if ((_DWORD)result)
      {
        if (a1 && a1 + 10 < a1)
          __break(0x5519u);
        else
          return digest_init((uint64_t)a1, *(const void **)(a2 + 24), *(_QWORD *)(a2 + 32), v6, v7, v8, v9, v10);
      }
      else
      {
        *a1 = v11;
      }
    }
    else
    {
      *(_DWORD *)a1 = v12;
    }
  }
  else
  {
    *(_BYTE *)a1 = v13;
  }
  return result;
}

uint64_t _chain_manifest_enforceable(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t name;
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

  if (odometer_policy_get_chip_property(a1, *(_QWORD *)(a2 + 16)))
  {
    v3 = *(unsigned __int16 *)(a2 + 320);
    v4 = *(_QWORD *)a2;
    name = chip_get_name(*(_QWORD *)(a2 + 16));
    if (v3)
    {
      expert_log(v4, 1uLL, (uint64_t)"odometer[%s:%s]: policy is enforceable", v6, v7, v8, v9, v10, name);
      return 0;
    }
    else
    {
      v11 = 1;
      expert_log(v4, 1uLL, (uint64_t)"odometer[%s:%s]: manifest has no chained hash constraint", v6, v7, v8, v9, v10, name);
    }
  }
  else
  {
    v12 = *(_QWORD *)a2;
    v13 = chip_get_name(*(_QWORD *)(a2 + 16));
    v11 = 1;
    expert_log(v12, 1uLL, (uint64_t)"odometer[%s:%s]: chip has no property for policy", v14, v15, v16, v17, v18, v13);
  }
  return v11;
}

uint64_t _chain_manifest_enforce(uint64_t a1, uint64_t a2)
{
  uint64_t chip_property;
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
  uint64_t name;
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
  char v33;
  _QWORD v34[14];

  v34[13] = *MEMORY[0x24BDAC8D0];
  chip_property = odometer_policy_get_chip_property(a1, *(_QWORD *)(a2 + 16));
  if (!*(_WORD *)(a2 + 320))
    __panic_npx("panic: optional not set", v5, v6, v7, v8, v9, v10, v11, v33);
  v12 = chip_property;
  *(_OWORD *)v34 = xmmword_24BA99650;
  memset(&v34[2], 170, 88);
  digest_copy((uint64_t)v34, a2 + 240, v6, v7, v8, v9, v10, v11);
  v17 = odometer_enforce_property((uint64_t *)a2, a1, v12, (unsigned __int8 *)v34, v13, v14, v15, v16);
  v18 = *(_QWORD *)a2;
  name = chip_get_name(*(_QWORD *)(a2 + 16));
  if ((_DWORD)v17)
  {
    expert_log(v18, 0, (uint64_t)"odometer[%s:%s]: boot chain integrity violation: %d", v20, v21, v22, v23, v24, name);
    if (v17 >= 0x6A)
      __panic_npx("panic: error not set to valid posix code: %d", v25, v26, v27, v28, v29, v30, v31, v17);
  }
  else
  {
    expert_log(v18, 1uLL, (uint64_t)"odometer[%s:%s]: manifest is consistent with boot chain", v20, v21, v22, v23, v24, name);
  }
  return v17;
}

uint64_t image4_trust_evaluation_prepare_manifest_callbacks(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 16);
  if (v2)
    *(_QWORD *)(a2 + 32) = v2;
  return result;
}

unint64_t image4_trust_evaluation_get_result(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  v8 = *a5;
  if (v8
    || (result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t *))(result + 32))(result, a2, a3, a4, &v8), v6 = v8, result > result + v8)|| ((*a5 = v8, result) ? (v7 = v6 == 0) : (v7 = 0), v7))
  {
    __break(0x5519u);
  }
  return result;
}

uint64_t darwin_syscall_init(uint64_t a1)
{
  uint64_t i;
  char **v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  size_t v25;

  for (i = 0; i != 80; i += 5)
  {
    v3 = &(&__traps)[i];
    v25 = 5;
    if ((sysctlnametomib((&__traps)[i], (int *)&__traps + 2 * i + 3, &v25) & 0x80000000) == 0)
      *__error() = 0;
    v9 = *__error();
    if ((v9 - 1) >= 2)
    {
      if (v9)
      {
        v17 = (&__traps)[i];
        __error();
        __panic_npx("panic: sysctlnametomib: %s%d", v18, v19, v20, v21, v22, v23, v24, (char)v17);
      }
      result = expert_log(a1, 3uLL, (uint64_t)"initialized trap: %s", v4, v5, v6, v7, v8, (uint64_t)(&__traps)[i]);
      LODWORD((&__traps)[i + 4]) = v25;
    }
    else
    {
      v10 = (uint64_t)*v3;
      __error();
      result = expert_log(a1, 3uLL, (uint64_t)"trap not present trap: %s: %d", v11, v12, v13, v14, v15, v10);
      *((_DWORD *)v3 + 3) = -1;
    }
  }
  return result;
}

char **darwin_syscall_get(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char **v8;

  if (a1 > 0xF)
    __panic_npx("panic: invalid trap number: actual = %#llx, expected < %#llx", a2, a3, a4, a5, a6, a7, a8, a1);
  v8 = &(&__traps)[5 * a1];
  if (v8 < &__traps || v8 + 5 > (char **)&__plat4_mem)
    goto LABEL_8;
  if (!LODWORD((&__traps)[5 * a1 + 4]))
    return 0;
  if (v8 >= (char **)&__plat4_mem)
  {
LABEL_8:
    __break(0x5519u);
    return 0;
  }
  return v8;
}

uint64_t darwin_syscall_kmod_copy_abi_version(uint64_t a1, _BYTE *a2)
{
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int16 v25;

  v25 = 0;
  v24 = 1;
  v4 = expert_runtime_boot(a1);
  if ((_DWORD)v4)
  {
    v10 = v4;
    expert_log(a1, 3uLL, (uint64_t)"failed to boot expert for syscall: %d", v5, v6, v7, v8, v9, v4);
  }
  else
  {
    if (!dword_2544DC200)
      return 78;
    v10 = expert_syscall(a1, (uint64_t)&__traps, (uint64_t)&v25 + 1, 1, (uint64_t)&v25, (uint64_t)&v24);
    if (!(_DWORD)v10)
    {
      *a2 = v25;
      return v10;
    }
    expert_log(a1, 0, (uint64_t)"trap failed: %s: %d", v19, v20, v21, v22, v23, (uint64_t)__traps);
  }
  if (v10 >= 0x6A)
    __panic_npx("panic: error not set to valid posix code: %d", v11, v12, v13, v14, v15, v16, v17, v10);
  return v10;
}

uint64_t darwin_syscall_kmod_copy_version(uint64_t a1, char *a2)
{
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  _OWORD v26[32];
  char v27;
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
  v43 = 0u;
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
  v29 = 0u;
  v28 = 0u;
  v27 = 1;
  memset(v26, 0, sizeof(v26));
  v25 = 1;
  v24 = 513;
  v4 = expert_runtime_boot(a1);
  if ((_DWORD)v4)
  {
    v10 = v4;
    expert_log(a1, 3uLL, (uint64_t)"failed to boot expert for syscall: %d", v5, v6, v7, v8, v9, v4);
  }
  else
  {
    if (!dword_2544DC228)
      return 78;
    v10 = expert_syscall(a1, (uint64_t)&qword_2544DC208, (uint64_t)&v27, 513, (uint64_t)&v25, (uint64_t)&v24);
    if (!(_DWORD)v10)
    {
      strlcpy(a2, (const char *)v26, 0x200uLL);
      return v10;
    }
    expert_log(a1, 0, (uint64_t)"trap failed: %s: %d", v19, v20, v21, v22, v23, qword_2544DC208);
  }
  if (v10 >= 0x6A)
    __panic_npx("panic: error not set to valid posix code: %d", v11, v12, v13, v14, v15, v16, v17, v10);
  return v10;
}

uint64_t darwin_syscall_nonce_copy_hash(uint64_t a1, int *a2, int a3, void *a4, _QWORD *a5)
{
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
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  int v31;
  int v32;
  _OWORD v33[4];
  unsigned int v34;
  char v35;
  int v36;
  int v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v42 = 0;
  v41 = 0u;
  v40 = 0u;
  v39 = 0u;
  v38 = 0u;
  v35 = 1;
  v36 = *a2;
  v37 = a3;
  v34 = 0;
  memset(v33, 0, sizeof(v33));
  v30 = 1;
  v31 = v36;
  v32 = a3;
  v29 = 77;
  v8 = expert_runtime_boot(a1);
  if ((_DWORD)v8)
  {
    v14 = v8;
    expert_log(a1, 3uLL, (uint64_t)"failed to boot expert for syscall: %d", v9, v10, v11, v12, v13, v8);
    goto LABEL_3;
  }
  if (!dword_2544DC318)
    return 78;
  result = expert_syscall(a1, (uint64_t)&qword_2544DC2F8, (uint64_t)&v35, 77, (uint64_t)&v30, (uint64_t)&v29);
  if ((_DWORD)result)
  {
    v14 = result;
    expert_log(a1, 0, (uint64_t)"trap failed: %s: %d", v23, v24, v25, v26, v27, qword_2544DC2F8);
LABEL_3:
    if (v14 >= 0x6A)
      __panic_npx("panic: error not set to valid posix code: %d", v15, v16, v17, v18, v19, v20, v21, v14);
    return v14;
  }
  v28 = v34;
  if (v34 <= 0x40)
  {
    memcpy(a4, v33, v34);
    v14 = 0;
    *a5 = v28;
    return v14;
  }
  __break(0x5519u);
  return result;
}

uint64_t darwin_syscall_nonce_peek_hash(uint64_t a1, int *a2, int a3, void *a4, _QWORD *a5)
{
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
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  int v31;
  int v32;
  _OWORD v33[4];
  unsigned int v34;
  char v35;
  int v36;
  int v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v42 = 0;
  v41 = 0u;
  v40 = 0u;
  v39 = 0u;
  v38 = 0u;
  v35 = 1;
  v36 = *a2;
  v37 = a3;
  v34 = 0;
  memset(v33, 0, sizeof(v33));
  v30 = 1;
  v31 = v36;
  v32 = a3;
  v29 = 77;
  v8 = expert_runtime_boot(a1);
  if ((_DWORD)v8)
  {
    v14 = v8;
    expert_log(a1, 3uLL, (uint64_t)"failed to boot expert for syscall: %d", v9, v10, v11, v12, v13, v8);
    goto LABEL_3;
  }
  if (!dword_2544DC340)
    return 78;
  result = expert_syscall(a1, (uint64_t)&qword_2544DC320, (uint64_t)&v35, 77, (uint64_t)&v30, (uint64_t)&v29);
  if ((_DWORD)result)
  {
    v14 = result;
    expert_log(a1, 0, (uint64_t)"trap failed: %s: %d", v23, v24, v25, v26, v27, qword_2544DC320);
LABEL_3:
    if (v14 >= 0x6A)
      __panic_npx("panic: error not set to valid posix code: %d", v15, v16, v17, v18, v19, v20, v21, v14);
    return v14;
  }
  v28 = v34;
  if (v34 <= 0x40)
  {
    memcpy(a4, v33, v34);
    v14 = 0;
    *a5 = v28;
    return v14;
  }
  __break(0x5519u);
  return result;
}

uint64_t darwin_syscall_nonce_roll(uint64_t a1, int *a2, int a3)
{
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  int v26;
  int v27;
  char v28;
  int v29;
  int v30;

  v28 = 1;
  v29 = *a2;
  v30 = a3;
  v25 = 1;
  v26 = v29;
  v27 = a3;
  v24 = 9;
  v4 = expert_runtime_boot(a1);
  if ((_DWORD)v4)
  {
    v10 = v4;
    expert_log(a1, 3uLL, (uint64_t)"failed to boot expert for syscall: %d", v5, v6, v7, v8, v9, v4);
    goto LABEL_3;
  }
  if (!dword_2544DC368)
    return 78;
  v10 = expert_syscall(a1, (uint64_t)&qword_2544DC348, (uint64_t)&v28, 9, (uint64_t)&v25, (uint64_t)&v24);
  if ((_DWORD)v10)
  {
    expert_log(a1, 0, (uint64_t)"trap failed: %s: %d", v19, v20, v21, v22, v23, qword_2544DC348);
LABEL_3:
    if (v10 >= 0x6A)
      __panic_npx("panic: error not set to valid posix code: %d", v11, v12, v13, v14, v15, v16, v17, v10);
  }
  return v10;
}

uint64_t darwin_syscall_nonce_unroll(uint64_t a1, int *a2, int a3)
{
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  int v26;
  int v27;
  char v28;
  int v29;
  int v30;

  v28 = 1;
  v29 = *a2;
  v30 = a3;
  v25 = 1;
  v26 = v29;
  v27 = a3;
  v24 = 9;
  v4 = expert_runtime_boot(a1);
  if ((_DWORD)v4)
  {
    v10 = v4;
    expert_log(a1, 3uLL, (uint64_t)"failed to boot expert for syscall: %d", v5, v6, v7, v8, v9, v4);
    goto LABEL_3;
  }
  if (!dword_2544DC390)
    return 78;
  v10 = expert_syscall(a1, (uint64_t)&qword_2544DC370, (uint64_t)&v28, 9, (uint64_t)&v25, (uint64_t)&v24);
  if ((_DWORD)v10)
  {
    expert_log(a1, 0, (uint64_t)"trap failed: %s: %d", v19, v20, v21, v22, v23, qword_2544DC370);
LABEL_3:
    if (v10 >= 0x6A)
      __panic_npx("panic: error not set to valid posix code: %d", v11, v12, v13, v14, v15, v16, v17, v10);
  }
  return v10;
}

uint64_t darwin_syscall_nonce_generate_proposal(uint64_t a1, _DWORD *a2, int a3, void *a4, _QWORD *a5, char *a6, unint64_t *a7)
{
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
  _BOOL4 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char *v39;
  BOOL v40;
  unint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  int v45;
  int v46;
  _OWORD v47[4];
  __int128 v48;
  uint64_t v49;
  char v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v51 = 0u;
  v57 = 0;
  v56 = 0u;
  v55 = 0u;
  v54 = 0u;
  v53 = 0u;
  v52 = 0u;
  v50 = 1;
  DWORD2(v51) = *a2;
  HIDWORD(v51) = a3;
  v44 = 0;
  v49 = 0;
  v48 = 0u;
  memset(v47, 0, sizeof(v47));
  v43 = 1;
  v45 = DWORD2(v51);
  v46 = a3;
  v42 = 105;
  v12 = expert_runtime_boot(a1);
  if ((_DWORD)v12)
  {
    v18 = v12;
    expert_log(a1, 3uLL, (uint64_t)"failed to boot expert for syscall: %d", v13, v14, v15, v16, v17, v12);
    goto LABEL_3;
  }
  if (!dword_2544DC3B8)
    return 78;
  v27 = a6 != 0;
  if (a7 && a6 && *a7)
  {
    v27 = 1;
    *(_QWORD *)&v51 = 1;
  }
  v28 = expert_syscall(a1, (uint64_t)&qword_2544DC398, (uint64_t)&v50, 105, (uint64_t)&v43, (uint64_t)&v42);
  if (!(_DWORD)v28)
  {
    v37 = v48;
    if (v48 <= 0x40)
    {
      memcpy(a4, v47, v48);
      *a5 = v37;
      v38 = HIDWORD(v49);
      if (!HIDWORD(v49))
        return 0;
      v36 = *a7;
      if (*a7 <= 0xF)
LABEL_27:
        __panic_npx("panic: insufficient nonce buffer length: actual = %lu, expected >= %lu", v29, v30, v31, v32, v33, v34, v35, v36);
      v39 = a6 + 16;
      if (!v27)
        v39 = 0;
      v40 = v39 >= a6;
      v41 = v39 - a6;
      if (v40 && v36 <= v41 && HIDWORD(v49) <= 0x10 && v36 >= HIDWORD(v49))
      {
        memcpy(a6, (char *)&v48 + 4, HIDWORD(v49));
        v18 = 0;
        *a7 = v38;
        return v18;
      }
    }
    __break(0x5519u);
    goto LABEL_27;
  }
  v18 = v28;
  expert_log(a1, 0, (uint64_t)"trap failed: %s: %d", v31, v32, v33, v34, v35, qword_2544DC398);
LABEL_3:
  if (v18 >= 0x6A)
    __panic_npx("panic: error not set to valid posix code: %d", v19, v20, v21, v22, v23, v24, v25, v18);
  return v18;
}

uint64_t darwin_syscall_nonce_verify(uint64_t a1, int *a2, int a3, uint64_t a4, uint64_t a5, unint64_t a6, _OWORD *a7, unint64_t a8)
{
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
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  int v37;
  int v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  int v47;
  int v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _DWORD v53[6];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  memset(v53, 0, sizeof(v53));
  v52 = 0u;
  v51 = 0u;
  v50 = 0u;
  v49 = 0u;
  v45 = 1;
  v46 = a4;
  v47 = *a2;
  v48 = a3;
  v44 = 0;
  v43 = 0u;
  v42 = 0u;
  v41 = 0u;
  v40 = 0u;
  v39 = 0u;
  v35 = 1;
  v36 = a4;
  v37 = v47;
  v38 = a3;
  v34 = 105;
  v12 = expert_runtime_boot(a1);
  if ((_DWORD)v12)
  {
    v20 = v12;
    expert_log(a1, 3uLL, (uint64_t)"failed to boot expert for syscall: %d", v15, v16, v17, v18, v19, v12);
    goto LABEL_3;
  }
  if (!dword_2544DC3E0)
    return 78;
  if (a6 > 0x40)
    goto LABEL_16;
  __memcpy_chk();
  v53[0] = a6;
  if (!a7 || !a8)
    goto LABEL_12;
  if (a8 <= 0xF)
LABEL_17:
    __panic_npx("panic: insufficient nonce buffer length: actual = %lu, expected >= %lu", v13, v14, v15, v16, v17, v18, v19, a8);
  if (a8 != 16)
  {
LABEL_16:
    __break(0x5519u);
    goto LABEL_17;
  }
  *(_OWORD *)&v53[1] = *a7;
  v53[5] = 16;
LABEL_12:
  v20 = expert_syscall(a1, (uint64_t)&qword_2544DC3C0, (uint64_t)&v45, 105, (uint64_t)&v35, (uint64_t)&v34);
  if (!(_DWORD)v20)
    return v20;
  expert_log(a1, 0, (uint64_t)"trap failed: %s: %d", v29, v30, v31, v32, v33, qword_2544DC3C0);
LABEL_3:
  if (v20 >= 0x6A)
    __panic_npx("panic: error not set to valid posix code: %d", v21, v22, v23, v24, v25, v26, v27, v20);
  return v20;
}

uint64_t darwin_syscall_image_activate(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
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
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  int length_uint32;
  uint64_t v49;
  int v50;

  v45 = 2;
  v11 = *a3;
  v46 = a2;
  v47 = v11;
  length_uint32 = buff_get_length_uint32((uint64_t)a3, a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8);
  v49 = *a4;
  v50 = buff_get_length_uint32((uint64_t)a4, v12, v13, v14, v15, v16, v17, v18);
  v40 = 2;
  v41 = a2;
  v42 = 0;
  v44 = 0;
  v43 = 0;
  v39 = 33;
  v19 = expert_runtime_boot(a1);
  if ((_DWORD)v19)
  {
    v25 = v19;
    expert_log(a1, 3uLL, (uint64_t)"failed to boot expert for syscall: %d", v20, v21, v22, v23, v24, v19);
    goto LABEL_3;
  }
  if (!dword_2544DC408)
    return 78;
  v25 = expert_syscall(a1, (uint64_t)&qword_2544DC3E8, (uint64_t)&v45, 33, (uint64_t)&v40, (uint64_t)&v39);
  if ((_DWORD)v25)
  {
    expert_log(a1, 0, (uint64_t)"trap failed: %s: %d", v34, v35, v36, v37, v38, qword_2544DC3E8);
LABEL_3:
    if (v25 >= 0x6A)
      __panic_npx("panic: error not set to valid posix code: %d", v26, v27, v28, v29, v30, v31, v32, v25);
  }
  return v25;
}

uint64_t darwin_syscall_image_dfu(uint64_t a1, int *a2, uint64_t *a3, void *a4, _QWORD *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
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
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  char v39;
  unsigned int v40;
  char v41;
  int v42;
  uint64_t v43;
  int length_uint32;
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v41 = 0;
  v42 = *a2;
  v43 = *a3;
  length_uint32 = buff_get_length_uint32((uint64_t)a3, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8);
  v46 = 0;
  v45 = 0;
  v47 = 0;
  v39 = 0;
  v37 = 0u;
  v38 = 0u;
  *(_DWORD *)((char *)&v37 + 1) = *a2;
  v40 = 16;
  v36 = 37;
  v12 = expert_runtime_boot(a1);
  if ((_DWORD)v12)
  {
    v18 = v12;
    expert_log(a1, 3uLL, (uint64_t)"failed to boot expert for syscall: %d", v13, v14, v15, v16, v17, v12);
    goto LABEL_3;
  }
  if (!dword_2544DC430)
    return 78;
  v27 = expert_syscall(a1, (uint64_t)&qword_2544DC410, (uint64_t)&v41, 37, (uint64_t)&v37, (uint64_t)&v36);
  if ((_DWORD)v27)
  {
    v18 = v27;
    expert_log(a1, 0, (uint64_t)"trap failed: %s: %d", v30, v31, v32, v33, v34, qword_2544DC410);
LABEL_3:
    if (v18 >= 0x6A)
      __panic_npx("panic: error not set to valid posix code: %d", v19, v20, v21, v22, v23, v24, v25, v18);
    return v18;
  }
  v35 = v40;
  if (v40 >= 0x11)
    __panic_npx("panic: kernel nonce overflows bounds: actual = %u, expected <= %u", v28, v29, v30, v31, v32, v33, v34, v40);
  memcpy(a4, (char *)&v38 + 1, v40);
  v18 = 0;
  *a5 = v35;
  return v18;
}

uint64_t darwin_syscall_image_copy_active(uint64_t a1, uint64_t a2, uint64_t *a3, _QWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
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
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  int length_uint32;

  v36 = 1;
  v37 = a2;
  v38 = *a3;
  length_uint32 = buff_get_length_uint32((uint64_t)a3, a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8);
  v32 = 1;
  v33 = a2;
  v34 = 0;
  v35 = 0;
  v31 = 21;
  v11 = expert_runtime_boot(a1);
  if ((_DWORD)v11)
  {
    v17 = v11;
    expert_log(a1, 3uLL, (uint64_t)"failed to boot expert for syscall: %d", v12, v13, v14, v15, v16, v11);
  }
  else
  {
    if (!dword_2544DC458)
      return 78;
    v17 = expert_syscall(a1, (uint64_t)&qword_2544DC438, (uint64_t)&v36, 21, (uint64_t)&v32, (uint64_t)&v31);
    if (!(_DWORD)v17)
    {
      *a4 = v35;
      return v17;
    }
    expert_log(a1, 0, (uint64_t)"trap failed: %s: %d", v26, v27, v28, v29, v30, qword_2544DC438);
  }
  if (v17 >= 0x6A)
    __panic_npx("panic: error not set to valid posix code: %d", v18, v19, v20, v21, v22, v23, v24, v17);
  return v17;
}

uint64_t posixdr(unsigned int a1)
{
  if (a1 > 7)
    return 14;
  else
    return dword_24BA99758[a1];
}

const char *strdr(unsigned int a1)
{
  if (a1 > 7)
    return "generic error";
  else
    return off_251CD2A50[a1];
}

uint64_t _chain_sideload_enforceable(uint64_t result, uint64_t *a2)
{
  _QWORD *v3;
  _QWORD *v4;
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
  char name;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v3 = (_QWORD *)a2[2];
  v4 = v3 + 33;
  if (v3[24] && v3[22])
  {
    if (v3 < v4)
    {
      name = chip_get_name(a2[2]);
      __panic_npx("panic: illegal chip definition: sideload and pivot policies defined: %s", v22, v23, v24, v25, v26, v27, v28, name);
    }
    goto LABEL_12;
  }
  if (v3 >= v4)
  {
LABEL_12:
    __break(0x5519u);
    return result;
  }
  if (odometer_policy_get_chip_property(result, a2[2]))
  {
    v5 = v3[31];
    v6 = *a2;
    v7 = chip_get_name(a2[2]);
    if (v5)
    {
      expert_log(v6, 1uLL, (uint64_t)"odometer[%s:%s]: policy is enforceable", v8, v9, v10, v11, v12, v7);
      return 0;
    }
    else
    {
      v13 = 1;
      expert_log(v6, 1uLL, (uint64_t)"odometer[%s:%s]: sideload chip has no notary", v8, v9, v10, v11, v12, v7);
    }
  }
  else
  {
    v14 = *a2;
    v15 = chip_get_name(a2[2]);
    v13 = 1;
    expert_log(v14, 1uLL, (uint64_t)"odometer[%s:%s]: chip has no property for policy", v16, v17, v18, v19, v20, v15);
  }
  return v13;
}

uint64_t _chain_sideload_enforce(uint64_t a1, uint64_t a2)
{
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
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t name;
  _QWORD v33[14];

  v33[13] = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  *(_OWORD *)v33 = xmmword_24BA99778;
  memset(&v33[2], 170, 88);
  if (*(_BYTE *)(a2 + 440))
  {
    v6 = *(_QWORD *)a2;
    name = chip_get_name(v5);
    expert_log(v6, 1uLL, (uint64_t)"odometer[%s:%s]: manifest self-entitled for mix-n-match; relaxing chain integrity policy",
      v7,
      v8,
      v9,
      v10,
      v11,
      name);
    return 0;
  }
  manifest_measure(v4, v5, (uint64_t)v33);
  v12 = odometer_enforce_property((uint64_t *)a2, a1, (uint64_t)&_property_bmfh, (unsigned __int8 *)v33, v13, v14, v15, v16);
  v17 = *(_QWORD *)a2;
  v18 = chip_get_name(*(_QWORD *)(a2 + 16));
  if (!(_DWORD)v12)
  {
    expert_log(v17, 1uLL, (uint64_t)"odometer[%s:%s]: manifest is consistent with boot chain", v19, v20, v21, v22, v23, v18);
    return 0;
  }
  expert_log(v17, 0, (uint64_t)"odometer[%s:%s]: boot chain integrity violation: %d", v19, v20, v21, v22, v23, v18);
  if (v12 >= 0x6A)
    __panic_npx("panic: error not set to valid posix code: %d", v24, v25, v26, v27, v28, v29, v30, v12);
  return v12;
}

uint64_t digest_check_buff(uint64_t a1, unint64_t a2)
{
  if (a2 <= 0x40)
    return 0;
  else
    return 84;
}

uint64_t digest_init(uint64_t a1, const void *a2, size_t __n, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (__n >= 0x41)
    __panic_npx("panic: digest length overflow: actual = %lu, expected <= %lu", (uint64_t)a2, __n, a4, a5, a6, a7, a8, __n);
  memcpy((void *)(a1 + 8), a2, __n);
  *(_QWORD *)(a1 + 72) = __n;
  return a1;
}

_QWORD *digest_init_measure(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*a2 >= 0x41uLL)
    __panic_npx("panic: digest length overflow: actual = %lu, expected <= %lu", (uint64_t)a2, a3, a4, a5, a6, a7, a8, *a2);
  ccdigest();
  a1[9] = *a2;
  *a1 = a2;
  return a1;
}

uint64_t digest_copy(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v8;

  v8 = *(_QWORD *)(a2 + 72);
  if (v8 < 0x41)
    return digest_init(result, (const void *)(a2 + 8), v8, a4, a5, a6, a7, a8);
  __break(0x5519u);
  return result;
}

uint64_t digest_compare(uint64_t a1, uint64_t a2)
{
  size_t v2;

  v2 = *(_QWORD *)(a1 + 72);
  if (v2 == *(_QWORD *)(a2 + 72))
    return memcmp((const void *)(a1 + 8), (const void *)(a2 + 8), v2);
  else
    return 1;
}

uint64_t digest_compare_buff(uint64_t a1, const void *a2, size_t a3)
{
  if (*(_QWORD *)(a1 + 72) == a3)
    return memcmp((const void *)(a1 + 8), a2, a3);
  else
    return 1;
}

unint64_t digest_print_cstr(unint64_t result, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8;

  v8 = *(_QWORD *)(result + 72);
  if (v8 < 0x41)
    return sprintdgst_npx(a2, (unsigned __int8 *)(result + 8), v8, a4, a5, a6, a7, a8);
  __break(0x5519u);
  return result;
}

void *digest_copy_out(uint64_t a1, void *__dst, size_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v9;
  size_t v10;
  void *result;

  v9 = *a3;
  v10 = *(_QWORD *)(a1 + 72);
  if (v9 < v10)
LABEL_6:
    __panic_npx("panic: digest length overflow: actual = %lu, expected >= %lu", (uint64_t)__dst, v10, a4, a5, a6, a7, a8, v9);
  if (v10 > 0x40 || (result = memcpy(__dst, (const void *)(a1 + 8), v10), v9 = *(_QWORD *)(a1 + 72), v9 > *a3))
  {
    __break(0x5519u);
    goto LABEL_6;
  }
  *a3 = v9;
  return result;
}

void *digest_copy_out32(uint64_t a1, void *__dst, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v9;
  size_t v10;
  void *result;

  v9 = *a3;
  v10 = *(_QWORD *)(a1 + 72);
  if (v10 > v9)
LABEL_7:
    __panic_npx("panic: digest length overflow: actual = %u, expected >= %lu", (uint64_t)__dst, v10, a4, a5, a6, a7, a8, v9);
  if (v10 > 0x40)
    goto LABEL_6;
  result = memcpy(__dst, (const void *)(a1 + 8), v10);
  v9 = *(_QWORD *)(a1 + 72);
  if (HIDWORD(v9))
    __panic_npx("panic: integer cast overflow: v = %s, actual = %llu, expected <= %llu", (uint64_t)__dst, v10, a4, a5, a6, a7, a8, (char)"d->d_len");
  if (v9 > *a3)
  {
LABEL_6:
    __break(0x5519u);
    goto LABEL_7;
  }
  *a3 = v9;
  return result;
}

uint64_t __select_ap(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t result;
  _QWORD v7[6];

  v5 = *(_QWORD *)(a3 + 8);
  v7[0] = "AP-SECURE-BOOT";
  v7[1] = 1;
  v7[2] = expert_query_chip(v5, 0);
  v7[3] = "drpa";
  v7[4] = "drpa";
  v7[5] = 0;
  result = image4_coprocessor_select_digest(a1, (uint64_t)&__select_ap_digest_map);
  if (!result)
    return image4_coprocessor_select_secure_boot(a1, (uint64_t)v7, a3);
  return result;
}

uint64_t __select_ap_pdi(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  _OWORD v5[3];
  _OWORD v6[3];

  v6[0] = xmmword_251CD2FF8;
  v6[1] = *(_OWORD *)&off_251CD3008;
  v6[2] = xmmword_251CD3018;
  v5[0] = xmmword_251CD3028;
  v5[1] = *(_OWORD *)algn_251CD3038;
  v5[2] = xmmword_251CD3048;
  result = image4_coprocessor_select(a1, v6, a3);
  if (!result)
    return image4_coprocessor_select_digest(a1, (uint64_t)v5);
  return result;
}

uint64_t __select_ap_ddi(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  _OWORD v5[3];
  _OWORD v6[3];

  v6[0] = xmmword_251CD3058;
  v6[1] = *(_OWORD *)&off_251CD3068;
  v6[2] = xmmword_251CD3078;
  v5[0] = xmmword_251CD3088;
  v5[1] = *(_OWORD *)algn_251CD3098;
  v5[2] = xmmword_251CD30A8;
  result = image4_coprocessor_select(a1, v6, a3);
  if (!result)
    return image4_coprocessor_select_digest(a1, (uint64_t)v5);
  return result;
}

uint64_t fourcc_init(uint64_t result, unsigned int a2)
{
  *(_DWORD *)result = a2;
  if (result + 4 > (unint64_t)(result + 9))
  {
    __break(0x5519u);
  }
  else
  {
    *(_BYTE *)(result + 8) = 0;
    *(_DWORD *)(result + 4) = 0;
    *(_DWORD *)(result + 4) = bswap32(a2);
  }
  return result;
}

size_t fourcc_init_cstring(uint64_t a1, char *__s)
{
  size_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  result = strlen(__s);
  if (result != 4)
    __panic_npx_4(result, v5, v6, v7, v8, v9, v10, v11, result);
  if (__s + 5 < __s)
  {
    __break(0x5519u);
  }
  else
  {
    *(_DWORD *)a1 = bswap32(*(_DWORD *)__s);
    strlcpy((char *)(a1 + 4), __s, 5uLL);
    return a1;
  }
  return result;
}

void __panic_npx_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  char __str[2048];
  char *v10;

  v10 = (char *)0xAAAAAAAAAAAAAAAALL;
  bzero(__str, 0x800uLL);
  v10 = &a9;
  vsnprintf(__str, 0x800uLL, "panic: cstring is not a fourcc: length = %lu", &a9);
  _os_crash();
  __break(1u);
}

uint64_t fourcc_get_cstring(uint64_t a1)
{
  return a1 + 4;
}

uint64_t fourcc_copy(uint64_t a1, unsigned int *a2)
{
  return fourcc_init(a1, *a2);
}

BOOL fourcc_equal(_DWORD *a1, _DWORD *a2)
{
  return a2 && *a1 == *a2;
}

uint64_t __handle_absence_1(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  *a3 = 0;
  return 0;
}

const char *__select_pdi(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t chip;

  chip = expert_query_chip(*(_QWORD *)(a3 + 8), 0);
  if (!*(_QWORD *)(chip + 72))
    return 0;
  if (*(_QWORD *)(chip + 64))
    return "ndpv";
  return "idpv";
}

const char *__select_ddi(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t chip;

  chip = expert_query_chip(*(_QWORD *)(a3 + 8), 0);
  if (!*(_QWORD *)(chip + 72))
    return 0;
  if (*(_QWORD *)(chip + 64))
    return "nddv";
  return "iddv";
}

uint64_t zcmp_npx(uint64_t result, uint64_t a2)
{
  char *v2;
  int v3;
  int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  v2 = (char *)result;
  while (1)
  {
    v4 = *v2++;
    v3 = v4;
    v5 = v4 < 0 ? -1 : result;
    result = v3 >= 1 ? 1 : v5;
    if ((_BYTE)v3)
      break;
    if (!--a2)
      return 0;
  }
  return result;
}

unint64_t strtou32_npx(const char *a1, char **a2, int a3)
{
  unint64_t result;
  char *__endptr;

  __endptr = 0;
  *__error() = 0;
  result = strtoul(a1, &__endptr, a3);
  if (__endptr && *__endptr)
  {
    result = 0;
    if (a2)
      *a2 = __endptr;
  }
  else if (HIDWORD(result))
  {
    *__error() = 34;
    return 0xFFFFFFFFLL;
  }
  return result;
}

const char *strsuf_npx(const char *a1, const char *a2)
{
  size_t v4;
  const char *v5;

  v4 = strlen(a1);
  v5 = &a1[v4 - strlen(a2)];
  if (v5 < a1 || strcmp(v5, a2))
    return 0;
  return v5;
}

uint64_t _boot_flash_secondary_enforceable(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
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
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v28;
  uint64_t v29;
  uint64_t name;
  uint64_t v31;

  if (odometer_policy_get_chip_property(a1, *(_QWORD *)(a2 + 16)))
  {
    v10 = *(_QWORD *)(a2 + 16);
    if (*(_QWORD *)(v10 + 80))
    {
      if (!*(_QWORD *)(v10 + 88))
      {
        if (manifest_get_restore_info(*(_QWORD *)(a2 + 8), v3, v4, v5, v6, v7, v8, v9))
        {
          v28 = *(unsigned __int16 *)(a2 + 144);
          v29 = *(_QWORD *)a2;
          name = chip_get_name(*(_QWORD *)(a2 + 16));
          if (v28)
          {
            expert_log(v29, 1uLL, (uint64_t)"odometer[%s:%s]: policy is enforceable", v12, v13, v14, v15, v16, name);
            return 0;
          }
          v31 = name;
          v17 = "odometer[%s:%s]: manifest has no constraint for policy";
        }
        else
        {
          v29 = *(_QWORD *)a2;
          v31 = chip_get_name(*(_QWORD *)(a2 + 16));
          v17 = "odometer[%s:%s]: boot object has no restore info";
        }
        v20 = 1;
        v26 = v29;
        goto LABEL_8;
      }
      v11 = *(_QWORD *)a2;
      v31 = chip_get_name(v10);
      v17 = "odometer[%s:%s]: chip is not secondary-stage dfu policy";
    }
    else
    {
      v11 = *(_QWORD *)a2;
      v31 = chip_get_name(v10);
      v17 = "odometer[%s:%s]: chip has no associated dfu policy";
    }
    v20 = 1;
    v26 = v11;
LABEL_8:
    expert_log(v26, 1uLL, (uint64_t)v17, v12, v13, v14, v15, v16, v31);
    return v20;
  }
  v18 = *(_QWORD *)a2;
  v19 = chip_get_name(*(_QWORD *)(a2 + 16));
  v20 = 1;
  expert_log(v18, 1uLL, (uint64_t)"odometer[%s:%s]: chip has no property for policy", v21, v22, v23, v24, v25, v19);
  return v20;
}

uint64_t _boot_flash_secondary_enforce(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t restore_info;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t restore_info_nonce;
  uint64_t v24;
  uint64_t v25;
  uint64_t name;
  uint64_t v27;
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
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  _OWORD v67[5];
  _QWORD v68[3];
  _QWORD v69[4];

  v69[3] = *MEMORY[0x24BDAC8D0];
  if (!*(_WORD *)(a2 + 144))
    __panic_npx("panic: optional not set", a2, a3, a4, a5, a6, a7, a8, v66);
  v10 = *(_QWORD *)(a2 + 8);
  v11 = *(_QWORD **)(a2 + 16);
  v12 = v11[20];
  v13 = *(unsigned int *)(a2 + 24);
  memset(v69, 0, 24);
  memset(v68, 0, sizeof(v68));
  memset(v67, 0, sizeof(v67));
  v14 = *(_QWORD *)a2;
  restore_info = manifest_get_restore_info(v10, a2, a3, a4, a5, a6, a7, a8);
  if (!restore_info)
    __panic_npx("panic: boot object has no restore info", v16, v17, v18, v19, v20, v21, v22, v66);
  restore_info_nonce = odometer_query_restore_info_nonce((uint64_t *)a2, restore_info, v69);
  if ((_DWORD)restore_info_nonce)
  {
    v24 = restore_info_nonce;
    v25 = *(_QWORD *)a2;
    name = chip_get_name(*(_QWORD *)(a2 + 16));
    expert_log(v25, 0, (uint64_t)"odometer[%s:%s]: failed to query restore info nonce: %d", v27, v28, v29, v30, v31, name);
  }
  else
  {
    v39 = expert_entangle_nonce(v14, (uint64_t)v11, v13, (uint64_t)v69, (uint64_t)v68);
    if ((_DWORD)v39)
    {
      v24 = v39;
      v40 = *(_QWORD *)a2;
      v41 = chip_get_name(*(_QWORD *)(a2 + 16));
      expert_log(v40, 0, (uint64_t)"odometer[%s:%s]: failed to entangle nonce: %d", v42, v43, v44, v45, v46, v41);
    }
    else
    {
      odometer_compute_nonce_hash(v14, v11, (uint64_t)v68, (uint64_t)v67);
      if (!property_constrain_digest(v12, v14, a2 + 64, (unint64_t)v67, v47, v48, v49, v50))
      {
        v59 = *(_QWORD *)a2;
        v60 = chip_get_name(*(_QWORD *)(a2 + 16));
        expert_log(v59, 1uLL, (uint64_t)"odometer[%s:%s]: manifest is current", v61, v62, v63, v64, v65, v60);
        return 0;
      }
      v24 = *(unsigned int *)(a1 + 24);
      v51 = *(_QWORD *)a2;
      v52 = chip_get_name(*(_QWORD *)(a2 + 16));
      expert_log(v51, 0, (uint64_t)"odometer[%s:%s]: manifest inconsistent with restore info: %d", v53, v54, v55, v56, v57, v52);
    }
  }
  if (v24 >= 0x6A)
    __panic_npx("panic: error not set to valid posix code: %d", v32, v33, v34, v35, v36, v37, v38, v24);
  return v24;
}

uint64_t closure_init(uint64_t result, _QWORD *a2, uint64_t a3)
{
  *(_QWORD *)result = a2;
  *(_QWORD *)(result + 8) = a3;
  *(_QWORD *)(result + 16) = *a2;
  strcpy((char *)(result + 24), "qinuuniq");
  *(_QWORD *)(result + 48) = 0;
  *(_QWORD *)(result + 56) = 0;
  *(_QWORD *)(result + 40) = 0;
  return result;
}

_QWORD *_closure_set_unique_tags(_QWORD *result, uint64_t a2, uint64_t a3)
{
  result[5] = a2;
  result[6] = a3;
  result[7] = _unique_entry_get_tag;
  return result;
}

uint64_t _unique_entry_get_tag(unsigned int *a1)
{
  return *a1;
}

uint64_t closure_measure(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD v25[2];
  uint64_t v26;
  uint64_t v27;
  _OWORD *v28;

  v27 = 0;
  v26 = 0;
  memset(v25, 0, sizeof(v25));
  v10 = _closure_compute_internal(a1, v25, &v27, a4, a5, a6, a7, a8);
  if ((_DWORD)v10)
  {
    v28 = v25;
    buff_destroy(&v28);
    if (v10 >= 0x6A)
      __panic_npx("panic: error not set to valid posix code: %d", v11, v12, v13, v14, v15, v16, v17, v10);
  }
  else
  {
    v18 = (_QWORD *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 48))();
    digest_init_measure(a2, v18, v27, v19, v20, v21, v22, v23);
    v28 = v25;
    buff_destroy(&v28);
  }
  return v10;
}

uint64_t closure_compute(uint64_t a1, _QWORD *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v9;

  if (!a3)
    a3 = &v9;
  return _closure_compute_internal(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t _closure_compute_internal(uint64_t a1, _QWORD *a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  int v10;
  unint64_t alloc_preference;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t size;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  size_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
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
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t i;
  unint64_t v69;
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;
  uint64_t *v73;
  int v74;
  _QWORD **Single;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t *v81;
  __int128 *v82;
  int v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t Image4Dictionary;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  __int128 v115;
  uint64_t v116;
  uint64_t v117;
  unsigned int v118;
  uint64_t v119;
  uint64_t **v120;
  uint64_t **v121;
  _QWORD **v122;
  __int128 v123;
  uint64_t v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  uint64_t v129;
  uint64_t v130[3];

  v130[1] = *MEMORY[0x24BDAC8D0];
  v8 = *(_QWORD *)(a1 + 16);
  v9 = *(_QWORD *)a1;
  v10 = *(unsigned __int16 *)(*(_QWORD *)a1 + 528);
  v129 = 0;
  v130[0] = 0;
  v127 = 0u;
  v128 = 0u;
  v125 = 0u;
  v126 = 0u;
  v123 = xmmword_251CD4170;
  v124 = 0;
  v121 = 0;
  v122 = 0;
  v119 = 0;
  v120 = 0;
  v118 = 0;
  v117 = 0;
  if (!v10)
LABEL_82:
    __panic_npx("panic: closure measurement requires a parsed manifest", (uint64_t)a2, (uint64_t)a3, a4, a5, a6, a7, a8, v115);
  alloc_preference = _type_get_alloc_preference((uint64_t)&_image4_type_decode_context);
  if (alloc_preference <= 1)
    v22 = 1;
  else
    v22 = alloc_preference;
  if (v22 == 1)
    goto LABEL_9;
  if (v22 != 2)
    __panic_npx("panic: unreachable case: %s = 0x%llx", v15, v16, v17, v18, v19, v20, v21, (char)"_t_preference");
  v23 = _expert_alloc_type(v8, (uint64_t)&_image4_type_decode_context);
  if (!v23)
  {
LABEL_9:
    size = type_get_size((uint64_t)&_image4_type_decode_context);
    v33 = MEMORY[0x24BDAC7A8](size, v26, v27, v28, v29, v30, v31, v32);
    v24 = (char *)&v115 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v33 >= 0x31)
      v34 = v33 - 48;
    else
      v34 = 0;
    memset(v24 + 48, 170, v34);
    *(_OWORD *)v24 = 0u;
    *((_OWORD *)v24 + 1) = 0u;
    *((_OWORD *)v24 + 2) = 0u;
  }
  else
  {
    v24 = (char *)v23;
    v130[0] = v23;
  }
  *((_OWORD *)v24 + 1) = 0u;
  *((_OWORD *)v24 + 2) = 0u;
  *(_OWORD *)v24 = 0u;
  v35 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)&v115 = *(_QWORD *)"PNAMMANP";
  DWORD2(v115) = 0;
  v125 = (unint64_t)a1;
  *(_QWORD *)&v126 = chip_select_decode(v35);
  if (!(_QWORD)v126)
  {
    v50 = 82;
    expert_log(*(_QWORD *)(a1 + 16), 0, (uint64_t)"chip environment not booted: %s: %d", v36, v37, v38, v39, v40, *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8));
LABEL_19:
    expert_log(*(_QWORD *)(a1 + 16), 0, (uint64_t)"failed to initialize compute context: %d", v56, v57, v58, v59, v60, v50);
    _expert_dealloc_type(v8, (uint64_t)&_image4_type_decode_context, v130);
    goto LABEL_68;
  }
  v41 = (_QWORD *)closure_node_new_item(a1, (unsigned int *)&v115);
  if (!v41)
  {
    v50 = 12;
    expert_log(*(_QWORD *)(a1 + 16), 0, (uint64_t)"failed to add MANP node: %d", v43, v44, v45, v46, v47, 12);
    goto LABEL_19;
  }
  *((_QWORD *)v24 + 5) = &v125;
  *(_QWORD *)&v128 = 0;
  *((_QWORD *)&v128 + 1) = &v128;
  *(_QWORD *)&v127 = 0;
  *((_QWORD *)&v127 + 1) = v41;
  *((_QWORD *)&v126 + 1) = 0;
  LODWORD(v129) = -1;
  closure_node_add(v41, (uint64_t)&v128, v42, v43, v44, v45, v46, v47);
  Img4DecodePerformManifestTrustEvaluationWithCallbacks(v9 + 72, (uint64_t)&v123, v126, (uint64_t)v24);
  if ((_DWORD)v48)
  {
    v49 = v48;
    v50 = posixdr(v48);
    expert_log(*(_QWORD *)(a1 + 16), 0, (uint64_t)"Img4DecodePerformManifestTrustEvaluation: %d", v51, v52, v53, v54, v55, v49);
    goto LABEL_67;
  }
  v61 = Img4DecodeIterateObjectItems((unint64_t *)(v9 + 72), (unsigned int *)&v125 + 2, (uint64_t (**)(unint64_t, uint64_t *, uint64_t, uint64_t))&v123, (uint64_t)v24);
  if ((_DWORD)v61)
  {
    v62 = v61;
    v50 = posixdr(v61);
    expert_log(*(_QWORD *)(a1 + 16), 0, (uint64_t)"Img4DecodeIterateObjectItems: %d", v63, v64, v65, v66, v67, v62);
    goto LABEL_67;
  }
  for (i = v128; i; i = *(_QWORD *)i)
  {
    v115 = *(_OWORD *)(i + 40);
    v116 = *(_QWORD *)(i + 56);
    v69 = v127;
    if ((_QWORD)v127)
    {
      v70 = *((_QWORD *)&v126 + 1);
      if (!*((_QWORD *)&v126 + 1))
        goto LABEL_33;
    }
    else
    {
      v69 = *(_QWORD *)(a1 + 40);
      v70 = *(_QWORD *)(a1 + 48);
      if (!v70)
      {
LABEL_33:
        expert_log(*(_QWORD *)(*(_QWORD *)(i + 8) + 16), 2uLL, (uint64_t)"%s: tag not in unique list", a4, a5, a6, a7, a8, i + 28);
LABEL_34:
        v73 = 0;
        goto LABEL_35;
      }
    }
    v71 = v69 + 4 * v70;
    v72 = v69;
    while (1)
    {
      if (v72 && (v72 >= v71 || v72 < v69))
        goto LABEL_81;
      if ((*(unsigned int (**)(unint64_t))(a1 + 56))(v72) == *(_DWORD *)(i + 24))
        break;
      v72 += 4;
      if (!--v70)
        goto LABEL_33;
    }
    expert_log(*(_QWORD *)(*(_QWORD *)(i + 8) + 16), 2uLL, (uint64_t)"%s: found unique tag", a4, a5, a6, a7, a8, i + 28);
    if (!v72)
      goto LABEL_34;
    if (v72 >= v71 || v72 < v69)
    {
LABEL_81:
      __break(0x5519u);
      goto LABEL_82;
    }
    v116 = 5;
    v73 = (uint64_t *)&v115;
LABEL_35:
    v74 = closure_node_encode_property(i, v73);
    if (v74)
    {
      switch(v74)
      {
        case 1:
          v50 = 22;
          break;
        case 2:
          v50 = 12;
          break;
        case 3:
          v50 = 104;
          break;
        default:
          v50 = 14;
          break;
      }
      expert_log(*(_QWORD *)(*(_QWORD *)(i + 8) + 16), 0, (uint64_t)"%s: failed to encode property node: %d", a4, a5, a6, a7, a8, i + 28);
      goto LABEL_67;
    }
  }
  Single = (_QWORD **)DEREncoderCreateSingle(0);
  v122 = Single;
  if (Single)
  {
    v81 = (uint64_t *)Single;
    v82 = &v128;
    while (1)
    {
      v82 = *(__int128 **)v82;
      if (!v82)
        break;
      v83 = closure_node_encode_item((uint64_t)v82, v81);
      if (v83)
      {
        switch(v83)
        {
          case 1:
            v50 = 22;
            break;
          case 2:
            v50 = 12;
            break;
          case 3:
            v50 = 104;
            break;
          default:
            v50 = 14;
            break;
        }
        expert_log(*(_QWORD *)(*((_QWORD *)v82 + 1) + 16), 0, (uint64_t)"%s: failed to encode item node: %d", v84, v85, v86, v87, v88, (uint64_t)v82 + 28);
        goto LABEL_67;
      }
    }
    Image4Dictionary = DEREncoderCreateImage4Dictionary("MANB", (uint64_t **)v81, (uint64_t **)&v121);
    v50 = 22;
    switch((int)Image4Dictionary)
    {
      case 0:
        v50 = 22;
        switch(_closure_create_image4_manifest(a1, v121, &v120))
        {
          case 0u:
            v95 = DEREncoderCreateEncodedBuffer(v120, &v119, &v118);
            v50 = 22;
            switch((int)v95)
            {
              case 0:
                v117 = v119;
                v50 = 0;
                *a3 = buff_init_xfer(a2, &v117, v118, (uint64_t)&_buff_destructor_free, 0);
                goto LABEL_67;
              case 1:
                goto LABEL_80;
              case 2:
                v50 = 12;
                goto LABEL_80;
              case 3:
                v50 = 104;
                goto LABEL_80;
              default:
                v50 = 14;
LABEL_80:
                expert_log(*(_QWORD *)(a1 + 16), 0, (uint64_t)"DEREncoderCreateEncodedBuffer: %d", v96, v97, v98, v99, v100, v95);
                break;
            }
            break;
          case 1u:
            goto LABEL_67;
          case 2u:
            v50 = 12;
            break;
          case 3u:
            v50 = 104;
            break;
          default:
            v50 = 14;
            break;
        }
        break;
      case 1:
        goto LABEL_73;
      case 2:
        v50 = 12;
        goto LABEL_73;
      case 3:
        v50 = 104;
        goto LABEL_73;
      default:
        v50 = 14;
LABEL_73:
        expert_log(*(_QWORD *)(a1 + 16), 0, (uint64_t)"DEREncoderCreateImage4Dictionary: %d", v90, v91, v92, v93, v94, Image4Dictionary);
        break;
    }
  }
  else
  {
    v50 = 12;
    expert_log(*(_QWORD *)(a1 + 16), 0, (uint64_t)"failed to allocate item sequence encoder: %d", v76, v77, v78, v79, v80, 12);
  }
LABEL_67:
  _expert_dealloc_type(v8, (uint64_t)&_image4_type_decode_context, v130);
  closure_node_list_destroy(a1, (uint64_t *)&v128, v101, v102, v103, v104, v105, v106);
LABEL_68:
  DEREncoderDestroyAndZero(&v122);
  DEREncoderDestroyAndZero(&v121);
  DEREncoderDestroyAndZero(&v120);
  if (v50 >= 0x6A)
    __panic_npx("panic: error not set to valid posix code: %d", v107, v108, v109, v110, v111, v112, v113, v50);
  return v50;
}

uint64_t _closure_manifest_property_callback(unsigned int a1, uint64_t *a2, int a3, uint64_t a4)
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t result;
  uint64_t PropertyData;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  int v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  unsigned int v62;

  v58 = 0;
  v57 = 0;
  v56 = 0;
  v55 = 0;
  v7 = *(_QWORD *)(a4 + 40);
  v8 = *(_QWORD *)v7;
  fourcc_init((uint64_t)&v57, a1);
  if (a3 == 1)
    fourcc_init((uint64_t)&v55, *(_DWORD *)(v7 + 8));
  v14 = v8 + 64;
  result = expert_log(*(_QWORD *)(v8 + 16), 2uLL, (uint64_t)"recording property for closure computation: %s%s%s", v9, v10, v11, v12, v13, (uint64_t)&v55 + 4);
  if (*(_DWORD *)(v8 + 24) == a1)
  {
    if (v8 >= v14)
      goto LABEL_33;
    v62 = 0;
    v61 = 0;
    PropertyData = Img4DecodeGetPropertyData(a2, a1, &v61, &v62);
    if ((_DWORD)PropertyData)
    {
      expert_log(*(_QWORD *)(v8 + 16), 0, (uint64_t)"Img4DecodeGetPropertyData: %d", v17, v18, v19, v20, v21, PropertyData);
      v22 = 96;
LABEL_31:
      *(_DWORD *)(v7 + 64) = v22;
      return 0xFFFFFFFFLL;
    }
    v23 = v62;
    if ((v62 & 3) != 0)
    {
      expert_log(*(_QWORD *)(v8 + 16), 0, (uint64_t)"invalid unique tag list: actual length = %u, expected %% %lu == 0", v17, v18, v19, v20, v21, v62);
      v22 = 94;
      goto LABEL_31;
    }
    v54 = a2;
    v24 = (unint64_t)v62 >> 2;
    result = expert_log(*(_QWORD *)(v8 + 16), 1uLL, (uint64_t)"found unique tag list: cnt = %u", v17, v18, v19, v20, v21, v24);
    if ((v23 >> 2) > v62 >> 2)
      goto LABEL_33;
    v25 = v61;
    *(_QWORD *)(v7 + 24) = v24;
    *(_QWORD *)(v7 + 32) = v25;
    *(_QWORD *)(v8 + 56) = _unique_entry_get_tag_swapped;
    if (v23 >= 4)
    {
      v26 = 0;
      v27 = 0;
      if (v24 <= 1)
        v28 = 1;
      else
        v28 = v23 >> 2;
      do
      {
        v29 = *(_QWORD *)(v7 + 32);
        v30 = v29 + 4 * *(_QWORD *)(v7 + 24);
        v60 = 0;
        v59 = 0;
        if (v29 > v29 + v26 || v29 + v26 + 4 > v30)
          goto LABEL_33;
        fourcc_init((uint64_t)&v59, bswap32(*(_DWORD *)(v29 + 4 * v27)));
        result = expert_log(*(_QWORD *)(v8 + 16), 2uLL, (uint64_t)"unique tag entry[%zu] = %s", v32, v33, v34, v35, v36, v27++);
        v26 += 4;
      }
      while (v28 != v27);
    }
    a2 = v54;
  }
  if (*(_DWORD *)(v7 + 8) != *(_DWORD *)(v7 + 12))
  {
    if (v8 >= v14)
    {
LABEL_33:
      __break(0x5519u);
      return result;
    }
    v37 = (_QWORD *)closure_node_new_item(v8, (unsigned int *)&v55);
    if (!v37)
    {
      v22 = 12;
      goto LABEL_31;
    }
    v44 = v37;
    result = closure_node_add(v37, v7 + 48, v38, v39, v40, v41, v42, v43);
    *(_DWORD *)(v7 + 12) = *(_DWORD *)(v7 + 8);
    *(_QWORD *)(v7 + 40) = v44;
  }
  if (v8 >= v14)
    goto LABEL_33;
  v45 = closure_node_new(*(_QWORD *)(v7 + 40), v8, (unsigned int *)&v57, (uint64_t)a2);
  if (!v45)
  {
    *(_DWORD *)(v7 + 64) = 12;
    expert_log(*(_QWORD *)(v8 + 16), 0, (uint64_t)"failed to allocate closure node", v47, v48, v49, v50, v51, v53);
    return 0xFFFFFFFFLL;
  }
  v52 = v45;
  if (!a3)
    manifest_property_callback(*(uint64_t **)v8, 0, a1, a2, v48, v49, v50, v51, v53);
  closure_node_add(v52, v7 + 48, v46, v47, v48, v49, v50, v51);
  return 0;
}

uint64_t _closure_create_image4_manifest(uint64_t a1, uint64_t **a2, _QWORD *a3)
{
  _QWORD **Single;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
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
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD **v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD **v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD **v50;
  _QWORD **v51;

  v50 = 0;
  Single = (_QWORD **)DEREncoderCreateSingle(0);
  v51 = Single;
  if (Single)
  {
    v12 = (uint64_t *)Single;
    v13 = DEREncoderAddImage4Tag((uint64_t *)Single, "IM4M");
    if ((_DWORD)v13)
    {
      v19 = v13;
      expert_log(*(_QWORD *)(a1 + 16), 0, (uint64_t)"DEREncoderAddImage4Tag: IM4M: %d", v14, v15, v16, v17, v18, v13);
LABEL_7:
      v21 = v19;
      goto LABEL_8;
    }
    v22 = DEREncoderAddUInt(v12, 0);
    if ((_DWORD)v22)
    {
      v19 = v22;
      expert_log(*(_QWORD *)(a1 + 16), 0, (uint64_t)"DEREncoderAddUInt: manifest version: %d", v23, v24, v25, v26, v27, v22);
      goto LABEL_7;
    }
    v29 = DEREncoderAddSetFromEncoder(a2, v12);
    if ((_DWORD)v29)
    {
      v35 = v29;
      expert_log(*(_QWORD *)(a1 + 16), 0, (uint64_t)"DEREncoderAddSetFromEncoder: %d", v30, v31, v32, v33, v34, v29);
      v21 = v35;
    }
    else
    {
      v36 = (_QWORD **)DEREncoderCreateSingle(v29);
      v50 = v36;
      if (v36)
      {
        v42 = v36;
        v43 = DEREncoderAddSequenceFromEncoder((uint64_t **)v12, (uint64_t *)v36);
        if ((_DWORD)v43)
        {
          v49 = v43;
          expert_log(*(_QWORD *)(a1 + 16), 0, (uint64_t)"DEREncoderAddSequenceFromEncoder: %d", v44, v45, v46, v47, v48, v43);
          v21 = v49;
        }
        else
        {
          v21 = 0;
          *a3 = v42;
          v50 = 0;
        }
      }
      else
      {
        expert_log(*(_QWORD *)(a1 + 16), 0, (uint64_t)"DEREncoderCreate: %d", v37, v38, v39, v40, v41, 0);
        v21 = 0;
      }
    }
  }
  else
  {
    v20 = *(_QWORD *)(a1 + 16);
    v21 = 2;
    expert_log(v20, 0, (uint64_t)"DEREncoderCreate: %d", v7, v8, v9, v10, v11, 2);
  }
LABEL_8:
  DEREncoderDestroyAndZero(&v51);
  DEREncoderDestroyAndZero(&v50);
  return v21;
}

uint64_t _unique_entry_get_tag_swapped(unsigned int *a1)
{
  return bswap32(*a1);
}

uint64_t __handle_absence_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  *a3 = 0;
  return 0;
}

uint64_t img4_nonce_domain_get_from_handle(unsigned int a1)
{
  if (a1 > 4)
    return 0;
  else
    return _cryptex1_domains[a1];
}

uint64_t chip_expert(uint64_t a1)
{
  return *(_QWORD *)(a1 + 112);
}

uint64_t chip_expert_instance(uint64_t a1)
{
  return **(_QWORD **)(*(_QWORD *)(a1 + 112) + 16);
}

uint64_t _chip_expert_boot()
{
  return 78;
}

uint64_t _chip_expert_get_digest_info(uint64_t a1)
{
  return (*(uint64_t (**)(void))(***(_QWORD ***)(a1 + 16) + 48))();
}

uint64_t _chip_expert_get_secure_boot(uint64_t a1, _QWORD *a2)
{
  *a2 = *(_QWORD *)(***(_QWORD ***)(a1 + 16) + 24);
  return 0;
}

uint64_t _chip_expert_query_chip(uint64_t a1)
{
  return ***(_QWORD ***)(a1 + 16);
}

uint64_t _chip_expert_query_chip_boot()
{
  return 45;
}

uint64_t _chip_expert_query_nonce()
{
  return 78;
}

uint64_t _chip_expert_entangle_nonce()
{
  return 78;
}

uint64_t _chip_expert_read_boot_manifest()
{
  return 78;
}

uint64_t _chip_expert_query_trust_store()
{
  return 78;
}

uint64_t _chip_expert_read_storage()
{
  return 78;
}

uint64_t _chip_expert_write_storage()
{
  return 78;
}

uint64_t _chip_expert_sync_storage()
{
  return 78;
}

uint64_t _chip_expert_query_property_BOOL(uint64_t a1, uint64_t a2, char **a3, BOOL *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (a3 == &_property_iuob)
    return expert_compute_eieiou_BOOL(a1, a2, a4);
  v10 = **(_BYTE ***)(a1 + 16);
  if (!chip_instance_check((unint64_t)v10, a3, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8))
    return 2;
  chip_instance_get_BOOL(v10, (uint64_t)a3, a4, v11, v12, v13, v14, v15);
  return 0;
}

uint64_t _chip_expert_query_property_uint32(uint64_t a1, uint64_t a2, _QWORD *a3, _DWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _DWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v10 = **(_DWORD ***)(a1 + 16);
  if (!chip_instance_check((unint64_t)v10, a3, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8))
    return 2;
  chip_instance_get_uint32(v10, (uint64_t)a3, a4, v11, v12, v13, v14, v15);
  return 0;
}

uint64_t _chip_expert_query_property_uint64(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v10 = **(_QWORD ***)(a1 + 16);
  if (!chip_instance_check((unint64_t)v10, a3, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8))
    return 2;
  chip_instance_get_uint64(v10, (uint64_t)a3, a4, v11, v12, v13, v14, v15);
  return 0;
}

uint64_t _chip_expert_query_property_digest(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v10 = **(_QWORD **)(a1 + 16);
  if (!chip_instance_check(v10, a3, (uint64_t)a3, a4, a5, a6, a7, a8))
    return 2;
  chip_instance_get_digest(v10, (uint64_t)a3, a4, v11, v12, v13, v14, v15);
  return 0;
}

uint64_t _chip_expert_query_property_version(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v10 = **(_QWORD **)(a1 + 16);
  if (!chip_instance_check(v10, a3, (uint64_t)a3, a4, a5, a6, a7, a8))
    return 2;
  chip_instance_get_version(v10, (uint64_t)a3, a4, v11, v12, v13, v14, v15);
  return 0;
}

uint64_t _chip_expert_boot_once()
{
  return 0;
}

void _chip_expert_read_random(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char vars0;

  __panic_npx_5(a1, a2, a3, a4, a5, a6, a7, a8, vars0);
}

void __panic_npx_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  char __str[2048];
  char *v10;

  v10 = (char *)0xAAAAAAAAAAAAAAAALL;
  bzero(__str, 0x800uLL);
  v10 = &a9;
  vsnprintf(__str, 0x800uLL, "panic: should never be called", &a9);
  _os_crash();
  __break(1u);
}

void _chip_expert_syscall(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char vars0;

  __panic_npx_5(a1, a2, a3, a4, a5, a6, a7, a8, vars0);
}

const char *__select_cryptex1_mobile_asset_ap()
{
  return "am1c";
}

uint64_t *closure_node_list_destroy(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t *result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  result = (uint64_t *)*a2;
  v18 = (uint64_t)result;
  if (result)
  {
    do
    {
      v10 = *result;
      closure_node_remove(result, a2, a3, a4, a5, a6, a7, a8);
      closure_node_destroy(&v18, v11, v12, v13, v14, v15, v16, v17);
      v18 = v10;
      result = (uint64_t *)v10;
    }
    while (v10);
  }
  return result;
}

uint64_t closure_node_remove(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  result = expert_log(*(_QWORD *)(a1[1] + 16), 2uLL, (uint64_t)"%s: removing node", a4, a5, a6, a7, a8, (uint64_t)a1 + 28);
  v11 = (uint64_t *)*a2;
  if ((uint64_t *)*a2 == a1)
  {
    v14 = *a1;
    *a2 = *a1;
    v12 = a2;
    if (v14)
      goto LABEL_5;
    goto LABEL_4;
  }
  do
  {
    v12 = v11;
    v11 = (uint64_t *)*v11;
  }
  while (v11 != a1);
  v13 = *a1;
  *v12 = *a1;
  if (!v13)
LABEL_4:
    a2[1] = (uint64_t)v12;
LABEL_5:
  *a1 = 0;
  return result;
}

uint64_t *closure_node_destroy(uint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;

  v8 = *result;
  v12 = v8;
  if (v8)
  {
    if (*(_QWORD *)v8)
      __panic_npx("panic: closure node deallocated while still in list", a2, a3, a4, a5, a6, a7, a8, v11);
    v9 = result;
    v10 = *(_QWORD *)(*(_QWORD *)(v8 + 8) + 16);
    DEREncoderDestroyAndZero((_QWORD ***)(v8 + 64));
    result = (uint64_t *)_expert_dealloc_type(v10, (uint64_t)&_image4_type_closure_node, &v12);
    *v9 = 0;
  }
  return result;
}

_QWORD *closure_node_new(uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t a4)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v17;

  v8 = (_QWORD *)_expert_alloc_type(*(_QWORD *)(a2 + 16), (uint64_t)&_image4_type_closure_node);
  v14 = v8;
  if (v8)
  {
    *v8 = 0;
    v8[1] = a2;
    v8[2] = a1;
    fourcc_copy((uint64_t)(v8 + 3), a3);
    v15 = *(_QWORD *)(a4 + 16);
    *(_OWORD *)(v14 + 5) = *(_OWORD *)a4;
    v14[7] = v15;
    v14[8] = 0;
  }
  else
  {
    expert_log(*(_QWORD *)(a2 + 16), 0, (uint64_t)"failed to allocate node", v9, v10, v11, v12, v13, v17);
  }
  return v14;
}

uint64_t closure_node_new_item(uint64_t a1, unsigned int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD **Single;
  _QWORD **v13;
  const char *v14;
  _QWORD **v16;
  uint64_t v17;

  v4 = *(_QWORD *)(a1 + 16);
  v16 = 0;
  v5 = _expert_alloc_type(v4, (uint64_t)&_image4_type_closure_node);
  v17 = v5;
  if (!v5)
  {
    v14 = "failed to allocate item node";
LABEL_6:
    expert_log(*(_QWORD *)(a1 + 16), 0, (uint64_t)v14, v6, v7, v8, v9, v10, (uint64_t)v16);
    _expert_dealloc_type(v4, (uint64_t)&_image4_type_closure_node, &v17);
    DEREncoderDestroyAndZero(&v16);
    return v17;
  }
  v11 = (_QWORD *)v5;
  Single = (_QWORD **)DEREncoderCreateSingle(1);
  v16 = Single;
  if (!Single)
  {
    v14 = "failed to allocate DER encoder";
    goto LABEL_6;
  }
  v13 = Single;
  v11[1] = a1;
  v11[2] = 0;
  fourcc_copy((uint64_t)(v11 + 3), a2);
  v11[5] = 0;
  v11[6] = 0;
  v11[7] = 0;
  v11[8] = v13;
  return (uint64_t)v11;
}

uint64_t closure_node_add(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  _OWORD v17[16];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (a1[2])
  {
    *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v17[14] = v10;
    v17[15] = v10;
    v17[12] = v10;
    v17[13] = v10;
    v17[10] = v10;
    v17[11] = v10;
    v17[8] = v10;
    v17[9] = v10;
    v17[6] = v10;
    v17[7] = v10;
    v17[4] = v10;
    v17[5] = v10;
    v17[2] = v10;
    v17[3] = v10;
    v17[0] = v10;
    v17[1] = v10;
    _closure_node_get_value_string((uint64_t)a1, 0, (char *)v17, a4, a5, a6, a7, a8);
    result = expert_log(*(_QWORD *)(a1[1] + 16), 2uLL, (uint64_t)"%s: inserting node: %s", v11, v12, v13, v14, v15, (uint64_t)a1 + 28);
  }
  else
  {
    result = expert_log(*(_QWORD *)(a1[1] + 16), 2uLL, (uint64_t)"%s: inserting item node", a4, a5, a6, a7, a8, (uint64_t)a1 + 28);
  }
  *a1 = 0;
  **(_QWORD **)(a2 + 8) = a1;
  *(_QWORD *)(a2 + 8) = a1;
  return result;
}

char *_closure_node_get_value_string(uint64_t a1, uint64_t *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27[2];
  unsigned int __n;
  _OWORD __n_4[5];
  _QWORD v30[14];

  v30[13] = *MEMORY[0x24BDAC8D0];
  v9 = *(unsigned int *)(a1 + 24);
  *(_OWORD *)v30 = xmmword_24BA99B20;
  memset(&v30[2], 170, 88);
  __n = 0;
  *(_QWORD *)v27 = 0;
  memset(&__n_4[1], 0, 64);
  if (a2)
    v10 = a2;
  else
    v10 = (uint64_t *)(a1 + 40);
  v11 = v10[2];
  __n_4[0] = 0uLL;
  switch(v11)
  {
    case 1:
      if (Img4DecodeGetPropertyBoolean((uint64_t)v10, v9, (BOOL *)v30))
        snprintf(a3, 0x100uLL, "[error decoding BOOL %d]");
      else
        snprintf(a3, 0x100uLL, "%d");
      break;
    case 2:
      if (Img4DecodeGetPropertyInteger64((uint64_t)v10, v9, v30))
        snprintf(a3, 0x100uLL, "[error decoding uint %d]");
      else
        snprintf(a3, 0x100uLL, "0x%llx");
      break;
    case 4:
      if (Img4DecodeGetPropertyData(v10, v9, v27, &__n))
      {
        snprintf(a3, 0x100uLL, "[error decoding data %d]");
      }
      else if (__n < 0x41)
      {
        digest_init((uint64_t)__n_4, *(const void **)v27, __n, v13, v14, v15, v16, v17);
        digest_print_cstr((unint64_t)__n_4, (unint64_t)a3, v21, v22, v23, v24, v25, v26);
      }
      else
      {
        snprintf(a3, 0x100uLL, "<data: %u bytes>");
      }
      break;
    case 5:
      strcpy(a3, "<null>");
      break;
    default:
      __panic_npx("panic: unreachable case: %s = 0x%llx", v9, (uint64_t)a3, a4, a5, a6, a7, a8, (char)"i4p->type");
  }
  v18 = 0;
  do
  {
    if (v18 == 256)
      __break(0x5519u);
  }
  while (a3[v18++]);
  return a3;
}

uint64_t closure_node_encode_property(uint64_t a1, uint64_t *a2)
{
  uint64_t cstring;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  __int128 v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _OWORD v19[16];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  cstring = fourcc_get_cstring(a1 + 24);
  if (!*(_QWORD *)(a1 + 16))
    return 0;
  v10 = (char *)cstring;
  *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v19[14] = v11;
  v19[15] = v11;
  v19[12] = v11;
  v19[13] = v11;
  v19[10] = v11;
  v19[11] = v11;
  v19[8] = v11;
  v19[9] = v11;
  v19[6] = v11;
  v19[7] = v11;
  v19[4] = v11;
  v19[5] = v11;
  v19[2] = v11;
  v19[3] = v11;
  if (!a2)
    a2 = (uint64_t *)(a1 + 40);
  v19[0] = v11;
  v19[1] = v11;
  _closure_node_get_value_string(a1, a2, (char *)v19, v5, v6, v7, v8, v9);
  v12 = *(uint64_t **)(*(_QWORD *)(a1 + 16) + 64);
  expert_log(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 16), 2uLL, (uint64_t)"%s: encoding closure property: p = %s, item = %s, type = %llx, val = %s", v13, v14, v15, v16, v17, a1 + 28);
  return DEREncoderAddImage4Property(v12, v10, a2);
}

size_t closure_node_encode_item(uint64_t a1, uint64_t *a2)
{
  uint64_t cstring;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v11;

  cstring = fourcc_get_cstring(a1 + 24);
  if (*(_QWORD *)(a1 + 16))
    return 0;
  v11 = (char *)cstring;
  expert_log(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 16), 2uLL, (uint64_t)"%s: encoding closure item: %s", v5, v6, v7, v8, v9, a1 + 28);
  return DEREncoderEncodeImage4Dictionary(a2, v11, *(uint64_t ***)(a1 + 64));
}

uint64_t odometer_policy_get_chip_property(uint64_t result, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;

  v2 = *(_QWORD *)(result + 16);
  if (v2 < 0)
    return 0;
  v3 = a2 + v2;
  if (v3 < a2 + 264 && v3 >= a2)
    return *(_QWORD *)v3;
  __break(0x5519u);
  return result;
}

uint64_t odometer_policy_enforceable(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t odometer_policy_enforce(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t name;

  v10 = *(_QWORD *)(a1 + 8);
  if (v10)
  {
    if (v10 == 2)
    {
      if (*(_BYTE *)(a2 + 440) && *(_BYTE *)(a2 + 968))
      {
        v11 = *(_QWORD *)a2;
        name = chip_get_name(*(_QWORD *)(a2 + 16));
        v17 = "odometer[%s:%s]: manifest has mix-n-match entitlement and environment allows mix-n-match; relaxing chain integrity policy";
        goto LABEL_11;
      }
      if (expert_query_chip_boot(*(_QWORD *)a2, *(_QWORD *)(a2 + 16)))
      {
        v11 = *(_QWORD *)a2;
        name = chip_get_name(*(_QWORD *)(a2 + 16));
        v17 = "odometer[%s:%s]: expert does not boot chip; relaxing chain integrity policy";
        goto LABEL_11;
      }
    }
    else
    {
      if (v10 != 1)
        __panic_npx_3(a1, a2, a3, a4, a5, a6, a7, a8, (char)"odp->odp_type");
      if (odometer_check_fuse(a2, (uint64_t)&_odometer_cylinder_mixn_match, a3, a4, a5, a6, a7, a8))
      {
        v11 = *(_QWORD *)a2;
        name = chip_get_name(*(_QWORD *)(a2 + 16));
        v17 = "odometer[%s:%s]: environment allows mix-n-match; relaxing chain integrity policy";
LABEL_11:
        v18 = v11;
LABEL_20:
        expert_log(v18, 1uLL, (uint64_t)v17, v12, v13, v14, v15, v16, name);
        return 0;
      }
    }
  }
  if (*(_BYTE *)(a2 + 441))
  {
    if ((odometer_check_fuse(a2, (uint64_t)&_odometer_cylinder_mixn_match, a3, a4, a5, a6, a7, a8) & 1) != 0)
    {
      v19 = "odometer[%s:%s]: environment allows mix-n-match; relaxing all odometer policy";
LABEL_19:
      v21 = *(_QWORD *)a2;
      name = chip_get_name(*(_QWORD *)(a2 + 16));
      v18 = v21;
      v17 = v19;
      goto LABEL_20;
    }
    if (*(_BYTE *)(a2 + 442) && *(_BYTE *)(a2 + 440))
    {
      v19 = "odometer[%s:%s]: manifest self-entitled for mix-n-match; relaxing all odometer policy";
      goto LABEL_19;
    }
    v20 = "odometer[%s:%s]: enforcing strict mix-n-match behavior";
  }
  else
  {
    v20 = "odometer[%s:%s]: mix-n-match god mode not set; enforcing strict mix-n-match behavior";
  }
  v23 = *(_QWORD *)a2;
  v24 = chip_get_name(*(_QWORD *)(a2 + 16));
  expert_log(v23, 1uLL, (uint64_t)v20, v25, v26, v27, v28, v29, v24);
  return (*(uint64_t (**)(uint64_t, unint64_t))(a1 + 40))(a1, a2);
}

void _buff_destructor_panic_call(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char vars0;

  __panic_npx("panic: attempt to destroy already destroyed buffer", a2, a3, a4, a5, a6, a7, a8, vars0);
}

void _buff_destructor_static_call(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char vars0;

  __panic_npx("panic: attempt to deallocate static buffer", a2, a3, a4, a5, a6, a7, a8, vars0);
}

uint64_t _buff_destructor_free_prepare(void *a1, rsize_t __n)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  result = memset_s(a1, __n, 0, __n);
  if ((_DWORD)result)
    __panic_npx("panic: memset_s: %d", v3, v4, v5, v6, v7, v8, v9, result);
  return result;
}

_QWORD *buff_init_xfer(_QWORD *result, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  v5 = *a2;
  *a2 = 0;
  *result = v5;
  result[1] = a3;
  result[2] = a4;
  result[4] = a5;
  *a2 = *(_QWORD *)(a4 + 8);
  return result;
}

_QWORD *buff_init_wrap(_QWORD *result, uint64_t a2, uint64_t a3)
{
  *result = a2;
  result[1] = a3;
  result[2] = &_buff_destructor_wrap;
  result[4] = 0;
  return result;
}

_QWORD *buff_init_alias(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  result[1] = a2[1];
  result[2] = &_buff_destructor_null;
  result[4] = 0;
  return result;
}

_QWORD *buff_init_xfer_signed(_QWORD *result, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;

  if (a3 < 0)
    __panic_npx("panic: integer cast underflow: v = %s, actual = %lld, expected >= 0", (uint64_t)a2, a3, a4, a5, a6, a7, a8, (char)"len");
  v8 = *a2;
  *a2 = 0;
  *result = v8;
  result[1] = a3;
  result[2] = a4;
  result[4] = a5;
  *a2 = *(_QWORD *)(a4 + 8);
  return result;
}

uint64_t *buff_init_wrap_signed(uint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a3 < 0)
    __panic_npx("panic: integer cast underflow: v = %s, actual = %lld, expected >= 0", a2, a3, a4, a5, a6, a7, a8, (char)"len");
  *result = a2;
  result[1] = a3;
  result[2] = (uint64_t)&_buff_destructor_wrap;
  result[4] = 0;
  return result;
}

_QWORD *buff_xfer(_QWORD *result, uint64_t **a2)
{
  uint64_t *v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *a2;
  if (*a2)
    v3 = v2 >= *a2 + 1;
  else
    v3 = 0;
  if (v3)
  {
    __break(0x5519u);
  }
  else
  {
    v5 = v2[1];
    v4 = v2[2];
    v6 = v2[4];
    v7 = *v2;
    *v2 = 0;
    *result = v7;
    result[1] = v5;
    result[2] = v4;
    result[4] = v6;
    *v2 = *(_QWORD *)(v4 + 8);
    v2[2] = 0;
    *a2 = 0;
  }
  return result;
}

_QWORD *buff_borrow(_QWORD *result, _QWORD *a2)
{
  uint64_t v2;

  *result = *a2;
  result[2] = &_buff_destructor_loanee;
  v2 = a2[2];
  result[1] = a2[1];
  a2[2] = &_buff_destructor_loan;
  a2[3] = v2;
  return result;
}

uint64_t buff_return(uint64_t result, _QWORD **a2)
{
  _QWORD *v2;

  v2 = *a2;
  *(_QWORD *)(result + 16) = *(_QWORD *)(result + 24);
  *(_QWORD *)(result + 24) = 0;
  *v2 = 0;
  v2[1] = 0;
  v2[2] = &_buff_destructor_null;
  *a2 = 0;
  return result;
}

unint64_t buff_lockdown(unint64_t **a1, uint64_t a2)
{
  unint64_t *v4;
  unint64_t result;
  __int128 v6;
  __int128 v7;

  v4 = *a1;
  result = **a1;
  if (result > result + v4[1]
    || (result = (*(uint64_t (**)(void))(v4[2] + 16))(), v4[2] = (unint64_t)&_buff_destructor_static, v4 >= v4 + 5))
  {
    __break(0x5519u);
  }
  else
  {
    v6 = *(_OWORD *)v4;
    v7 = *((_OWORD *)v4 + 1);
    *(_QWORD *)(a2 + 32) = v4[4];
    *(_OWORD *)a2 = v6;
    *(_OWORD *)(a2 + 16) = v7;
    *a1 = 0;
    return (unint64_t)v4;
  }
  return result;
}

_QWORD *buff_copy_out(_QWORD *result, void *__dst, size_t *a3)
{
  size_t v4;
  size_t v5;
  void *v6;
  _QWORD *v7;
  size_t v8;

  v4 = *a3;
  v5 = result[1];
  if (v4 < v5)
    return 0;
  v6 = __dst;
  v7 = result;
  if (*result <= *result + v5)
  {
    result = memcpy(__dst, (const void *)*result, v5);
    v8 = v7[1];
    if (v8 <= *a3)
    {
      *a3 = v8;
      if (v8)
        return v6;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t buff_get_length_signed(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result < 0)
    __panic_npx("panic: length not expressible as ssize_t: %lu", a2, a3, a4, a5, a6, a7, a8, result);
  return result;
}

unint64_t buff_get_length_uint32(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (HIDWORD(result))
    __panic_npx("panic: length not expressible as unsigned 32-bit integer: %lu", a2, a3, a4, a5, a6, a7, a8, result);
  return result;
}

_QWORD *buff_destroy(_QWORD *result)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = (_QWORD *)*result;
  if (*result)
  {
    if (v1 < v1 + 5)
    {
      v2 = result;
      v3 = v1[2];
      if (!v3)
      {
LABEL_6:
        *v2 = 0;
        return result;
      }
      v5 = *v1;
      v4 = v1[1];
      if (*v1 <= (unint64_t)(*v1 + v4))
      {
        v6 = v1[4];
        (*(void (**)(_QWORD, _QWORD, uint64_t))(v3 + 24))(*v1, v1[1], v6);
        result = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1[2] + 32))(v5, v4, v6);
        v1[2] = &_buff_destructor_panic;
        goto LABEL_6;
      }
    }
    __break(0x5519u);
  }
  return result;
}

void _buff_destructor_loanee_call(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char vars0;

  __panic_npx("panic: attempt to deallocate loaned buffer", a2, a3, a4, a5, a6, a7, a8, vars0);
}

void _buff_destructor_loan_call(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char vars0;

  __panic_npx("panic: attempt to deallocate loaned buffer without returning", a2, a3, a4, a5, a6, a7, a8, vars0);
}

void _restore_runtime_init(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __panic_npx_6(a1, a2, a3, a4, a5, a6, a7, a8, (char)"_restore_runtime_init");
}

void *_restore_runtime_alloc(uint64_t a1, int64_t a2)
{
  void *result;
  uint64_t v4;
  _OWORD v5[5];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      result = malloc_type_calloc(1uLL, a2, 0x1B044E25uLL);
      if (result)
        break;
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    result = malloc_type_calloc(1uLL, a2, 0x61D5536CuLL);
    if (a2 <= 0 && result)
LABEL_8:
      __break(0x5519u);
    if (!result)
      _darwin_runtime_alloc_cold_1(&v4, v5);
  }
  if (a2 < 1)
    goto LABEL_8;
  return result;
}

void _restore_runtime_dealloc(int a1, void *a2)
{
  free(a2);
}

void _restore_runtime_log(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __panic_npx_6(a1, a2, a3, a4, a5, a6, a7, a8, (char)"_restore_runtime_log");
}

void _restore_runtime_log_handle(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __panic_npx_6(a1, a2, a3, a4, a5, a6, a7, a8, (char)"_restore_runtime_log_handle");
}

void _restore_runtime_get_identifier_BOOL(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __panic_npx_6(a1, a2, a3, a4, a5, a6, a7, a8, (char)"_restore_runtime_get_identifier_BOOL");
}

void _restore_runtime_get_identifier_uint32(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __panic_npx_6(a1, a2, a3, a4, a5, a6, a7, a8, (char)"_restore_runtime_get_identifier_uint32");
}

void _restore_runtime_get_identifier_uint64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __panic_npx_6(a1, a2, a3, a4, a5, a6, a7, a8, (char)"_restore_runtime_get_identifier_uint64");
}

void _restore_runtime_get_identifier_digest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __panic_npx_6(a1, a2, a3, a4, a5, a6, a7, a8, (char)"_restore_runtime_get_identifier_digest");
}

void _restore_runtime_get_identifier_cstr(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __panic_npx_6(a1, a2, a3, a4, a5, a6, a7, a8, (char)"_restore_runtime_get_identifier_cstr");
}

uint64_t _restore_runtime_execute_object(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return _darwin_runtime_execute_object(a1, a2, a3, a4);
}

uint64_t _restore_runtime_copy_object(uint64_t a1, uint64_t *a2, uint64_t a3, _QWORD *a4)
{
  return _darwin_runtime_copy_object(a1, a2, a3, a4);
}

void _restore_runtime_alloc_type(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __panic_npx_6(a1, a2, a3, a4, a5, a6, a7, a8, (char)"_restore_runtime_alloc_type");
}

void _restore_runtime_dealloc_type(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __panic_npx_6(a1, a2, a3, a4, a5, a6, a7, a8, (char)"_restore_runtime_dealloc_type");
}

void _restore_runtime_set_nonce(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __panic_npx_6(a1, a2, a3, a4, a5, a6, a7, a8, (char)"_restore_runtime_set_nonce");
}

void _restore_runtime_roll_nonce(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __panic_npx_6(a1, a2, a3, a4, a5, a6, a7, a8, (char)"_restore_runtime_roll_nonce");
}

void _restore_runtime_copy_nonce(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __panic_npx_6(a1, a2, a3, a4, a5, a6, a7, a8, (char)"_restore_runtime_copy_nonce");
}

void __panic_npx_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  char __str[2048];
  char *v10;

  v10 = (char *)0xAAAAAAAAAAAAAAAALL;
  bzero(__str, 0x800uLL);
  v10 = &a9;
  vsnprintf(__str, 0x800uLL, "panic: function should never be called: %s", &a9);
  _os_crash();
  __break(1u);
}

uint64_t __handle_absence_3(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  *a3 = 0;
  return 0;
}

uint64_t __fallback_to_sdk(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  *a3 = 242;
  return 0;
}

uint64_t _BootPolicyClosureComputeDigest_1(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t *v9;

  v9 = **(unint64_t ***)(*(_QWORD *)(a5 + 32) + 16);
  if (*v9 > a4)
    __panic_npx_0((uint64_t)v9, a2, a1, a4, a5, a6, a7, a8, a4);
  ccdigest();
  return 0;
}

uint64_t _BootPolicyClosureVerifyChain_1()
{
  return 0;
}

uint64_t _BootPolicyClosureVerifySignature_1()
{
  return 0;
}

uint64_t _BootPolicyClosureEvaluateCertificateProperties_1()
{
  return 0;
}

uint64_t img4_nonce_domain_copy_nonce(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;
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
  int v20;
  size_t v21;
  _BYTE v22[77];
  char v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[28];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = generic_expert_specialist();
  v24 = 0u;
  memset(v27, 0, sizeof(v27));
  v26 = 0u;
  v25 = 0u;
  v23 = 1;
  DWORD1(v24) = *(_DWORD *)(a1 + 8);
  memset(&v22[1], 0, 76);
  v22[0] = 1;
  *(_DWORD *)&v22[5] = DWORD1(v24);
  v21 = 77;
  result = dylib_expert_call_method(v4, 7uLL, &v23, 0x4DuLL, v22, &v21);
  if ((_DWORD)result)
  {
    if ((_DWORD)result == 45)
      v11 = 19;
    else
      v11 = result;
    v12 = expert_log(v4, 0, (uint64_t)"img4_nonce_domain_copy_nonce: %d", v6, v7, v8, v9, v10, v11);
    if (v11 >= 0x6A)
      __panic_npx_2(v12, v13, v14, v15, v16, v17, v18, v19, v11);
    return v11;
  }
  *(_WORD *)a2 = 0;
  v20 = *(_DWORD *)&v22[73];
  if (*(_DWORD *)&v22[73] <= 0x30u)
  {
    memcpy((void *)(a2 + 2), &v22[9], *(unsigned int *)&v22[73]);
    v11 = 0;
    *(_DWORD *)(a2 + 52) = v20;
    return v11;
  }
  __break(0x5519u);
  return result;
}

uint64_t img4_nonce_domain_roll_nonce(uint64_t a1)
{
  uint64_t v2;
  int v3;
  unsigned int v4;
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
  size_t v20;
  char v21;
  int v22;
  int v23;
  char v24;
  int v25;
  int v26;

  v2 = generic_expert_specialist();
  v24 = 1;
  v3 = *(_DWORD *)(a1 + 8);
  v25 = 0;
  v26 = v3;
  v21 = 1;
  v22 = 0;
  v23 = v3;
  v20 = 9;
  v4 = dylib_expert_call_method(v2, 9uLL, &v24, 9uLL, &v21, &v20);
  if (!v4)
    return 0;
  if (v4 == 45)
    v10 = 19;
  else
    v10 = v4;
  v11 = expert_log(v2, 0, (uint64_t)"img4_nonce_domain_roll_nonce: %d", v5, v6, v7, v8, v9, v10);
  if (v10 >= 0x6A)
    __panic_npx_2(v11, v12, v13, v14, v15, v16, v17, v18, v10);
  return v10;
}

uint64_t img4_nonce_domain_preroll_nonce(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;
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
  int v20;
  size_t v21;
  char v22;
  __int128 v23;
  _OWORD v24[4];
  __int128 v25;
  uint64_t v26;
  char v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = generic_expert_specialist();
  v28 = 0u;
  v34 = 0;
  v33 = 0u;
  v32 = 0u;
  v31 = 0u;
  v30 = 0u;
  v29 = 0u;
  v27 = 1;
  HIDWORD(v28) = *(_DWORD *)(a1 + 8);
  v23 = 0u;
  v26 = 0;
  v25 = 0u;
  memset(v24, 0, sizeof(v24));
  v22 = 1;
  HIDWORD(v23) = HIDWORD(v28);
  v21 = 105;
  result = dylib_expert_call_method(v4, 0xBuLL, &v27, 0x69uLL, &v22, &v21);
  if ((_DWORD)result)
  {
    if ((_DWORD)result == 45)
      v11 = 19;
    else
      v11 = result;
    v12 = expert_log(v4, 0, (uint64_t)"img4_nonce_domain_preroll_nonce: %d", v6, v7, v8, v9, v10, v11);
    if (v11 >= 0x6A)
      __panic_npx_2(v12, v13, v14, v15, v16, v17, v18, v19, v11);
    return v11;
  }
  *(_WORD *)a2 = 0;
  v20 = v25;
  if (v25 <= 0x30)
  {
    memcpy((void *)(a2 + 2), v24, v25);
    v11 = 0;
    *(_DWORD *)(a2 + 52) = v20;
    return v11;
  }
  __break(0x5519u);
  return result;
}

uint64_t img4_nonce_domain_peek_nonce(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;
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
  int v20;
  size_t v21;
  _BYTE v22[77];
  char v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[28];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = generic_expert_specialist();
  v24 = 0u;
  memset(v27, 0, sizeof(v27));
  v26 = 0u;
  v25 = 0u;
  v23 = 1;
  DWORD1(v24) = *(_DWORD *)(a1 + 8);
  memset(&v22[1], 0, 76);
  v22[0] = 1;
  *(_DWORD *)&v22[5] = DWORD1(v24);
  v21 = 77;
  result = dylib_expert_call_method(v4, 8uLL, &v23, 0x4DuLL, v22, &v21);
  if ((_DWORD)result)
  {
    if ((_DWORD)result == 45)
      v11 = 19;
    else
      v11 = result;
    v12 = expert_log(v4, 0, (uint64_t)"img4_nonce_domain_peek_nonce: %d", v6, v7, v8, v9, v10, v11);
    if (v11 >= 0x6A)
      __panic_npx_2(v12, v13, v14, v15, v16, v17, v18, v19, v11);
    return v11;
  }
  *(_WORD *)a2 = 0;
  v20 = *(_DWORD *)&v22[73];
  if (*(_DWORD *)&v22[73] <= 0x30u)
  {
    memcpy((void *)(a2 + 2), &v22[9], *(unsigned int *)&v22[73]);
    v11 = 0;
    *(_DWORD *)(a2 + 52) = v20;
    return v11;
  }
  __break(0x5519u);
  return result;
}

char *image4_environment_get_firmware_chip(unsigned int a1, uint64_t a2)
{
  char *result;

  if (a1 > 0x7CF)
    return 0;
  result = (char *)image4_environment_resolve(a2);
  if (result == "nupa" || result == 0)
    return 0;
  return result;
}

char **property_find_from_expert(char **result)
{
  char ***v1;

  v1 = &__expert_properties[(_QWORD)result];
  if (v1 < (char ***)&xmmword_251CD5CE8 && v1 >= __expert_properties)
    return *v1;
  __break(0x5519u);
  return result;
}

uint64_t property_find_entitlement(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char *v9;
  unint64_t v10;
  uint64_t result;
  __int128 v12;
  uint64_t v13;

  v12 = xmmword_251CD5CE8;
  v13 = -1;
  do
  {
    v9 = property_iterator_next((uint64_t)&v12, a2, a3, a4, a5, a6, a7, a8);
    v10 = (unint64_t)v9;
    if (!v9)
      return v10;
    result = _property_filter_expert((uint64_t)v9);
  }
  while ((_DWORD)result || *(_DWORD *)(v10 + 24) != *a1);
  if (v10 < v10 + 104)
    return v10;
  __break(0x5519u);
  return result;
}

uint64_t property_find_from_fourcc(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v9)(uint64_t);
  char *v10;
  unint64_t v11;
  uint64_t result;
  __int128 v13;
  uint64_t v14;

  v13 = xmmword_24BA99C10;
  v14 = -1;
  if ((_DWORD)a2 == 1)
  {
    v9 = _property_filter_object;
  }
  else
  {
    if ((_DWORD)a2)
      goto LABEL_6;
    v9 = _property_filter_manifest;
  }
  *(_QWORD *)&v13 = v9;
  while (1)
  {
LABEL_6:
    v10 = property_iterator_next((uint64_t)&v13, a2, a3, a4, a5, a6, a7, a8);
    v11 = (unint64_t)v10;
    if (!v10)
      return v11;
    result = _property_filter_constraint((uint64_t)v10);
    if ((_DWORD)result)
    {
      result = _property_filter_anti_replay(v11);
      if ((_DWORD)result)
        continue;
    }
    if (*(_DWORD *)(v11 + 24) == *a1)
      break;
  }
  if (v11 < v11 + 104)
    return v11;
  __break(0x5519u);
  return result;
}

BOOL property_equal(uint64_t a1, uint64_t a2)
{
  if (!a2)
    return 0;
  if (a1 == a2 || *(_QWORD *)(a1 + 8) == a2 || *(_QWORD *)(a2 + 8) == a1)
    return 1;
  return *(_DWORD *)(a2 + 24) == *(_DWORD *)(a1 + 24);
}

BOOL property_equal_fourcc(_BOOL8 result, int a2)
{
  if (result)
    return *(_DWORD *)(result + 24) == a2;
  return result;
}

BOOL property_imposable(uint64_t a1, uint64_t a2)
{
  char **digest;

  digest = chip_get_digest(a2);
  if (digest
    && (digest == (char **)a1
     || *(char ***)(a1 + 8) == digest
     || digest[1] == (char *)a1
     || *((_DWORD *)digest + 6) == *(_DWORD *)(a1 + 24)))
  {
    return 1;
  }
  if (*(_QWORD *)(a1 + 16) == 33 || *(_UNKNOWN **)(a1 + 48) == &_property_constraint_rp)
    return 0;
  return chip_check_entitlement(a2, a1) != 0;
}

uint64_t property_constrain_BOOL(uint64_t a1, uint64_t a2, unsigned __int8 *a3, unsigned __int8 *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  int v11;
  int v12;
  const char *v14;

  v8 = *a3;
  v9 = *a4;
  switch(**(_QWORD **)(a1 + 48))
  {
    case 0:
      v10 = v8 != v9;
      if (v8 == v9)
        goto LABEL_22;
      goto LABEL_15;
    case 1:
      if (v8 < v9)
        v10 = 0;
      else
        v10 = 0xFFFFFFFFLL;
      if (!(_DWORD)v10)
        goto LABEL_22;
      goto LABEL_15;
    case 2:
      if (v8 <= v9)
        v10 = 0;
      else
        v10 = 0xFFFFFFFFLL;
      if (!(_DWORD)v10)
        goto LABEL_22;
      goto LABEL_15;
    case 3:
      v10 = v8 <= v9;
      if (v8 <= v9)
        goto LABEL_15;
      goto LABEL_22;
    case 4:
      v10 = v8 < v9;
      if (v8 >= v9)
        goto LABEL_22;
      goto LABEL_15;
    case 5:
      v10 = v8 == v9;
      if (v8 != v9)
        goto LABEL_22;
LABEL_15:
      v11 = *(_DWORD *)(a1 + 56);
      switch(v11)
      {
        case 0:
        case 1:
        case 6:
          goto LABEL_26;
        case 2:
        case 3:
          if (v11 != 2 && v11 != 3)
            goto LABEL_29;
LABEL_26:
          expert_log(a2, 0, (uint64_t)"%s: enforcing[%s %s %s]: 0x%x %s 0x%x: %d", (uint64_t)a4, a5, a6, a7, a8, a1 + 28);
          return v10;
        default:
LABEL_29:
          v14 = "p->p_container";
          goto LABEL_30;
      }
    case 6:
LABEL_22:
      v12 = *(_DWORD *)(a1 + 56);
      switch(v12)
      {
        case 0:
        case 1:
        case 6:
          goto LABEL_27;
        case 2:
        case 3:
          if (v12 != 2 && v12 != 3)
            goto LABEL_29;
LABEL_27:
          expert_log(a2, 1uLL, (uint64_t)"%s: enforcing[%s %s %s]: 0x%x %s 0x%x: success", (uint64_t)a4, a5, a6, a7, a8, a1 + 28);
          v10 = 0;
          break;
        default:
          goto LABEL_29;
      }
      return v10;
    case 8:
      __panic_npx("panic: property is not constrainable: %s", a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, *(_QWORD *)a1);
    default:
      v14 = "p->p_constraint->pc_code";
LABEL_30:
      __panic_npx("panic: unreachable case: %s = 0x%llx", a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, (char)v14);
  }
}

uint64_t property_constrain_uint32(uint64_t a1, uint64_t a2, unsigned int *a3, unsigned int *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  int v11;
  int v12;
  const char *v14;

  v8 = *a3;
  v9 = *a4;
  switch(**(_QWORD **)(a1 + 48))
  {
    case 0:
      v10 = v8 != v9;
      if (v8 == v9)
        goto LABEL_22;
      goto LABEL_15;
    case 1:
      if (v8 < v9)
        v10 = 0;
      else
        v10 = 0xFFFFFFFFLL;
      if (!(_DWORD)v10)
        goto LABEL_22;
      goto LABEL_15;
    case 2:
      if (v8 <= v9)
        v10 = 0;
      else
        v10 = 0xFFFFFFFFLL;
      if (!(_DWORD)v10)
        goto LABEL_22;
      goto LABEL_15;
    case 3:
      v10 = v8 <= v9;
      if (v8 <= v9)
        goto LABEL_15;
      goto LABEL_22;
    case 4:
      v10 = v8 < v9;
      if (v8 >= v9)
        goto LABEL_22;
      goto LABEL_15;
    case 5:
      v10 = v8 == v9;
      if (v8 != v9)
        goto LABEL_22;
LABEL_15:
      v11 = *(_DWORD *)(a1 + 56);
      switch(v11)
      {
        case 0:
        case 1:
        case 6:
          goto LABEL_26;
        case 2:
        case 3:
          if (v11 != 2 && v11 != 3)
            goto LABEL_29;
LABEL_26:
          expert_log(a2, 0, (uint64_t)"%s: enforcing[%s %s %s]: 0x%x %s 0x%x: %d", (uint64_t)a4, a5, a6, a7, a8, a1 + 28);
          return v10;
        default:
LABEL_29:
          v14 = "p->p_container";
          goto LABEL_30;
      }
    case 6:
LABEL_22:
      v12 = *(_DWORD *)(a1 + 56);
      switch(v12)
      {
        case 0:
        case 1:
        case 6:
          goto LABEL_27;
        case 2:
        case 3:
          if (v12 != 2 && v12 != 3)
            goto LABEL_29;
LABEL_27:
          expert_log(a2, 1uLL, (uint64_t)"%s: enforcing[%s %s %s]: 0x%x %s 0x%x: success", (uint64_t)a4, a5, a6, a7, a8, a1 + 28);
          v10 = 0;
          break;
        default:
          goto LABEL_29;
      }
      return v10;
    case 8:
      __panic_npx("panic: property is not constrainable: %s", a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, *(_QWORD *)a1);
    default:
      v14 = "p->p_constraint->pc_code";
LABEL_30:
      __panic_npx("panic: unreachable case: %s = 0x%llx", a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, (char)v14);
  }
}

uint64_t property_constrain_uint64(uint64_t a1, uint64_t a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  const char *v14;

  v8 = *a3;
  v9 = *a4;
  switch(**(_QWORD **)(a1 + 48))
  {
    case 0:
      v10 = v8 != v9;
      if (v8 == v9)
        goto LABEL_22;
      goto LABEL_15;
    case 1:
      if (v8 < v9)
        v10 = 0;
      else
        v10 = 0xFFFFFFFFLL;
      if (!(_DWORD)v10)
        goto LABEL_22;
      goto LABEL_15;
    case 2:
      if (v8 <= v9)
        v10 = 0;
      else
        v10 = 0xFFFFFFFFLL;
      if (!(_DWORD)v10)
        goto LABEL_22;
      goto LABEL_15;
    case 3:
      v10 = v8 <= v9;
      if (v8 <= v9)
        goto LABEL_15;
      goto LABEL_22;
    case 4:
      v10 = v8 < v9;
      if (v8 >= v9)
        goto LABEL_22;
      goto LABEL_15;
    case 5:
      v10 = v8 == v9;
      if (v8 != v9)
        goto LABEL_22;
LABEL_15:
      v11 = *(_DWORD *)(a1 + 56);
      switch(v11)
      {
        case 0:
        case 1:
        case 6:
          goto LABEL_26;
        case 2:
        case 3:
          if (v11 != 2 && v11 != 3)
            goto LABEL_29;
LABEL_26:
          expert_log(a2, 0, (uint64_t)"%s: enforcing[%s %s %s]: 0x%llx %s 0x%llx: %d", (uint64_t)a4, a5, a6, a7, a8, a1 + 28);
          return v10;
        default:
LABEL_29:
          v14 = "p->p_container";
          goto LABEL_30;
      }
    case 6:
LABEL_22:
      v12 = *(_DWORD *)(a1 + 56);
      switch(v12)
      {
        case 0:
        case 1:
        case 6:
          goto LABEL_27;
        case 2:
        case 3:
          if (v12 != 2 && v12 != 3)
            goto LABEL_29;
LABEL_27:
          expert_log(a2, 1uLL, (uint64_t)"%s: enforcing[%s %s %s]: 0x%llx %s 0x%llx: success", (uint64_t)a4, a5, a6, a7, a8, a1 + 28);
          v10 = 0;
          break;
        default:
          goto LABEL_29;
      }
      return v10;
    case 8:
      __panic_npx("panic: property is not constrainable: %s", a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, *(_QWORD *)a1);
    default:
      v14 = "p->p_constraint->pc_code";
LABEL_30:
      __panic_npx("panic: unreachable case: %s = 0x%llx", a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, (char)v14);
  }
}

BOOL property_constrain_digest(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
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
  _BOOL8 v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  int v30;
  int v31;
  const char *v33;
  _OWORD v34[8];
  char v35;
  _OWORD v36[8];
  char v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v37 = 0;
  memset(v36, 0, sizeof(v36));
  v35 = 0;
  memset(v34, 0, sizeof(v34));
  digest_print_cstr(a3, (unint64_t)v36, a3, a4, a5, a6, a7, a8);
  digest_print_cstr(a4, (unint64_t)v34, v12, v13, v14, v15, v16, v17);
  v18 = digest_compare(a3, a4);
  v26 = 0;
  v27 = *(_QWORD *)(a3 + 72);
  v28 = *(_QWORD *)(a4 + 72);
  switch(**(_QWORD **)(a1 + 48))
  {
    case 0:
      v26 = v18;
      if (v27 != v28)
        goto LABEL_3;
      goto LABEL_8;
    case 1:
    case 2:
    case 3:
    case 4:
      __panic_npx("panic: non-sensical property digest specification: %s", v19, v20, v21, v22, v23, v24, v25, *(_QWORD *)a1);
    case 5:
      v26 = (_DWORD)v18 == 0;
      if (v27 != v28)
        goto LABEL_8;
LABEL_3:
      v29 = *(_DWORD *)(a1 + 56);
      switch(v29)
      {
        case 0:
        case 1:
        case 6:
          goto LABEL_12;
        case 2:
        case 3:
          if (v29 != 2 && v29 != 3)
            goto LABEL_26;
LABEL_12:
          expert_log(a2, 0, (uint64_t)"%s: enforcing length[%s %s %s]: %lu %s %lu: %d", v21, v22, v23, v24, v25, a1 + 28);
          break;
        default:
          goto LABEL_26;
      }
LABEL_13:
      v31 = *(_DWORD *)(a1 + 56);
      if (!v26)
      {
        switch(v31)
        {
          case 0:
          case 1:
          case 6:
            goto LABEL_23;
          case 2:
          case 3:
            if (v31 != 2 && v31 != 3)
              goto LABEL_27;
LABEL_23:
            expert_log(a2, 1uLL, (uint64_t)"%s: enforcing[%s %s %s]: %s %s %s: success", v21, v22, v23, v24, v25, a1 + 28);
            return v26;
          default:
LABEL_27:
            v33 = "p->p_container";
            goto LABEL_30;
        }
      }
      switch(v31)
      {
        case 0:
        case 1:
        case 6:
          goto LABEL_22;
        case 2:
        case 3:
          if (v31 != 2 && v31 != 3)
            goto LABEL_27;
LABEL_22:
          expert_log(a2, 0, (uint64_t)"%s: enforcing[%s %s %s]: %s %s %s: %d", v21, v22, v23, v24, v25, a1 + 28);
          break;
        default:
          goto LABEL_27;
      }
      return v26;
    case 6:
LABEL_8:
      v30 = *(_DWORD *)(a1 + 56);
      switch(v30)
      {
        case 0:
        case 1:
        case 6:
          goto LABEL_11;
        case 2:
        case 3:
          if (v30 != 2 && v30 != 3)
            goto LABEL_26;
LABEL_11:
          expert_log(a2, 1uLL, (uint64_t)"%s: enforcing length[%s %s %s]: %lu %s %lu: success", v21, v22, v23, v24, v25, a1 + 28);
          goto LABEL_13;
        default:
LABEL_26:
          v33 = "p->p_container";
          goto LABEL_30;
      }
    case 8:
      __panic_npx("panic: property is not constrainable: %s", v19, v20, v21, v22, v23, v24, v25, *(_QWORD *)a1);
    default:
      v33 = "p->p_constraint->pc_code";
LABEL_30:
      __panic_npx("panic: unreachable case: %s = 0x%llx", v19, v20, v21, v22, v23, v24, v25, (char)v33);
  }
}

uint64_t property_constrain_version(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  int v23;

  v9 = **(_QWORD **)(a1 + 48);
  v11 = 0;
  v12 = 1;
  switch(v9)
  {
    case 0:
      break;
    case 1:
      v11 = 0;
      goto LABEL_4;
    case 2:
      v11 = 1;
LABEL_4:
      v12 = -1;
      v9 = 2;
      break;
    case 3:
      v11 = 0;
      v9 = 1;
      v12 = 1;
      break;
    case 4:
      v12 = 1;
      v11 = 1;
      v9 = 1;
      break;
    case 5:
      v11 = 0;
      v12 = 1;
      v9 = 3;
      break;
    case 6:
      v12 = 0;
      v11 = 0;
      v9 = 0;
      break;
    default:
      __panic_npx("panic: illegal property definition: %s", a2, a3, a4, a5, a6, a7, a8, *(_QWORD *)a1);
  }
  v13 = version_compare(a3, a4);
  if (v13)
    v21 = 0;
  else
    v21 = v11;
  if (v13 == v9)
    v21 = 1;
  if (v21)
    v22 = 0;
  else
    v22 = v12;
  v23 = *(_DWORD *)(a1 + 56);
  if ((_DWORD)v22)
  {
    switch(v23)
    {
      case 0:
      case 1:
      case 6:
        goto LABEL_26;
      case 2:
      case 3:
        if (v23 != 2 && v23 != 3)
          goto LABEL_29;
LABEL_26:
        expert_log(a2, 0, (uint64_t)"%s: enforcing[%s %s %s]: %s %s %s: %d", v16, v17, v18, v19, v20, a1 + 28);
        break;
      default:
        goto LABEL_29;
    }
  }
  else
  {
    switch(v23)
    {
      case 0:
      case 1:
      case 6:
        goto LABEL_27;
      case 2:
      case 3:
        if (v23 != 2 && v23 != 3)
          goto LABEL_29;
LABEL_27:
        expert_log(a2, 1uLL, (uint64_t)"%s: enforcing[%s %s %s]: %s %s %s: success", v16, v17, v18, v19, v20, a1 + 28);
        break;
      default:
LABEL_29:
        __panic_npx("panic: unreachable case: %s = 0x%llx", v14, v15, v16, v17, v18, v19, v20, (char)"p->p_container");
    }
  }
  return v22;
}

char *property_print_value(uint64_t a1, unint64_t a2, char *__str, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;

  switch(**(_QWORD **)(a1 + 40))
  {
    case 0:
    case 1:
      snprintf(__str, 0x80uLL, "0x%x");
      goto LABEL_7;
    case 2:
      snprintf(__str, 0x80uLL, "0x%llx");
      goto LABEL_7;
    case 3:
      if (a2 + 80 < a2)
        goto LABEL_11;
      digest_print_cstr(a2, (unint64_t)__str, (uint64_t)__str, a4, a5, a6, a7, a8);
LABEL_7:
      v9 = 0;
      do
      {
        if (v9 == 256)
        {
LABEL_11:
          __break(0x5519u);
LABEL_12:
          __panic_npx("panic: unreachable case: %s = 0x%llx", a2, (uint64_t)__str, a4, a5, a6, a7, a8, (char)"p->p_type->pt_switchable");
        }
      }
      while (__str[v9++]);
      return __str;
    case 4:
      snprintf(__str, 0x80uLL, "%s");
      goto LABEL_7;
    default:
      goto LABEL_12;
  }
}

uint64_t _chain_enforceable(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int chip_boot;
  uint64_t v19;
  uint64_t name;

  if (odometer_policy_get_chip_property(a1, *(_QWORD *)(a2 + 16)))
  {
    if (*(_WORD *)(a2 + 528))
    {
      v3 = *(_QWORD *)a2;
      name = chip_get_name(*(_QWORD *)(a2 + 16));
      v9 = "odometer[%s:%s]: boot manifest hash is caller-supplied";
    }
    else
    {
      chip_boot = odometer_query_chip_boot(a2);
      v3 = *(_QWORD *)a2;
      v19 = chip_get_name(*(_QWORD *)(a2 + 16));
      if (chip_boot)
      {
        expert_log(v3, 1uLL, (uint64_t)"odometer[%s:%s]: policy is enforceable", v4, v5, v6, v7, v8, v19);
        return 0;
      }
      name = v19;
      v9 = "odometer[%s:%s]: environment is a first-stage booter";
    }
    v10 = 1;
    expert_log(v3, 1uLL, (uint64_t)v9, v4, v5, v6, v7, v8, name);
  }
  else
  {
    v11 = *(_QWORD *)a2;
    v12 = chip_get_name(*(_QWORD *)(a2 + 16));
    v10 = 1;
    expert_log(v11, 1uLL, (uint64_t)"odometer[%s:%s]: chip has no property for policy", v13, v14, v15, v16, v17, v12);
  }
  return v10;
}

uint64_t _chain_enforce(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t chip_property;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t name;
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
  _QWORD v28[14];

  v28[13] = *MEMORY[0x24BDAC8D0];
  v4 = a2[1];
  v5 = a2[2];
  chip_property = odometer_policy_get_chip_property(a1, v5);
  *(_OWORD *)v28 = xmmword_24BA99C28;
  memset(&v28[2], 170, 88);
  manifest_measure(v4, v5, (uint64_t)v28);
  v11 = odometer_enforce_property(a2, a1, chip_property, (unsigned __int8 *)v28, v7, v8, v9, v10);
  v12 = *a2;
  name = chip_get_name(a2[2]);
  if ((_DWORD)v11)
  {
    v19 = expert_log(v12, 0, (uint64_t)"odometer[%s:%s]: boot chain integrity violation: %d", v14, v15, v16, v17, v18, name);
    if (v11 >= 0x6A)
      __panic_npx_2(v19, v20, v21, v22, v23, v24, v25, v26, v11);
  }
  else
  {
    expert_log(v12, 1uLL, (uint64_t)"odometer[%s:%s]: manifest is consistent with boot chain", v14, v15, v16, v17, v18, name);
  }
  return v11;
}

uint64_t generic_expert_specialist()
{
  uint64_t bootstrap;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  char vars0;

  bootstrap = expert_get_bootstrap();
  expert_runtime_entry(bootstrap);
  result = __plat4_mem;
  if (!__plat4_mem)
    __panic_npx("panic: specialist not set after runtime entry", v1, v2, v3, v4, v5, v6, v7, vars0);
  return result;
}

uint64_t generic_expert_current()
{
  if (off_2544DC470)
    return off_2544DC470();
  else
    return generic_expert_specialist();
}

uint64_t generic_expert_supervisor()
{
  return qword_2544DC468;
}

char **generic_expert()
{
  return &__genx_mem;
}

uint64_t generic_expert_set_specialist(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v10;
  uint64_t result;

  v10 = *(_QWORD **)(a1 + 24);
  result = _expert_assert(a1, 1734700664, (uint64_t)"set specialist", a4, a5, a6, a7, a8);
  *v10 = a2;
  v10[3] = a3;
  return result;
}

uint64_t generic_expert_set_current_resolver(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t result;

  v9 = *(_QWORD *)(a1 + 24);
  result = _expert_assert(a1, 1734700664, (uint64_t)"set resolver", a4, a5, a6, a7, a8);
  *(_QWORD *)(v9 + 16) = a2;
  return result;
}

uint64_t generic_expert_set_supervisor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t result;

  v9 = *(_QWORD *)(a1 + 24);
  result = _expert_assert(a1, 1734700664, (uint64_t)"set supervisor", a4, a5, a6, a7, a8);
  *(_QWORD *)(v9 + 8) = a2;
  return result;
}

uint64_t generic_expert_get_chip_instance(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _expert_assert(a1, 1734700664, (uint64_t)"get chip instance", a4, a5, a6, a7, a8);
  return *(_QWORD *)(*(_QWORD *)(a1 + 16) + 32);
}

char *_generic_expert_init(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  char *result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int property_digest;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  unsigned __int8 v33;
  __int128 v34[6];
  uint64_t v35;
  _OWORD v36[5];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v8 = *(_QWORD *)(a1 + 16);
  v9 = *(_QWORD *)(a1 + 24);
  v10 = *(_QWORD *)(v8 + 24);
  v29 = xmmword_251CD5F60;
  v30 = -1;
  v11 = *(uint64_t **)v8;
  result = property_iterator_next((uint64_t)&v29, a2, a3, a4, a5, a6, a7, a8);
  if (result)
  {
    v20 = (uint64_t)result;
    do
    {
      v33 = 0;
      v32 = 0;
      v31 = 0;
      memset(v36, 0, sizeof(v36));
      v35 = 0x3E800000000;
      memset(v34, 0, sizeof(v34));
      switch(**(_QWORD **)(v20 + 40))
      {
        case 0:
          property_digest = expert_query_property_BOOL((uint64_t)v11, v10, v20, &v33);
          break;
        case 1:
          property_digest = expert_query_property_uint32((uint64_t)v11, v10, v20, &v32);
          break;
        case 2:
          property_digest = expert_query_property_uint64((uint64_t)v11, v10, v20, &v31);
          break;
        case 3:
          property_digest = expert_query_property_digest((uint64_t)v11, v10, v20, (uint64_t)v36);
          break;
        case 4:
          property_digest = expert_query_property_version((uint64_t)v11, v10, v20, (uint64_t)v34);
          break;
        default:
LABEL_26:
          __panic_npx("panic: unreachable case: %s = 0x%llx", v13, v14, v15, v16, v17, v18, v19, (char)"p->p_type->pt_switchable");
      }
      if (property_digest > 18)
      {
        if (property_digest != 45 && property_digest != 19)
          goto LABEL_25;
      }
      else
      {
        if (!property_digest)
        {
          switch(**(_QWORD **)(v20 + 40))
          {
            case 0:
              chip_instance_set_BOOL(v9 + 40, v20, &v33, v15, v16, v17, v18, v19);
              goto LABEL_16;
            case 1:
              chip_instance_set_uint32(v9 + 40, v20, &v32, v15, v16, v17, v18, v19);
              goto LABEL_16;
            case 2:
              chip_instance_set_uint64(v9 + 40, v20, &v31, v15, v16, v17, v18, v19);
              goto LABEL_16;
            case 3:
              chip_instance_set_digest(v9 + 40, v20, (uint64_t)v36, v15, v16, v17, v18, v19);
              goto LABEL_16;
            case 4:
              chip_instance_set_version(v9 + 40, v20, v34, v15, v16, v17, v18, v19);
              goto LABEL_16;
            default:
              goto LABEL_26;
          }
        }
        if (property_digest != 2)
LABEL_25:
          __panic_npx("panic: failed to query expert: expert = %s, p = %s, fourcc = %s, code = %llu: %d", v13, v14, v15, v16, v17, v18, v19, *v11);
      }
      expert_log((uint64_t)v11, 2uLL, (uint64_t)"failed to query expert: expert = %s, p = %s, fourcc = %s, code = %llu: %d", v15, v16, v17, v18, v19, *v11);
LABEL_16:
      result = property_iterator_next((uint64_t)&v29, v22, v23, v24, v25, v26, v27, v28);
      v20 = (uint64_t)result;
    }
    while (result);
  }
  *(_QWORD *)(v9 + 32) = v9 + 40;
  return result;
}

uint64_t _generic_expert_boot()
{
  return 0;
}

uint64_t _generic_expert_get_digest_info(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 24) + 48))();
}

uint64_t _generic_expert_get_secure_boot()
{
  return 78;
}

uint64_t _generic_expert_query_chip(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 16) + 24);
}

uint64_t _generic_expert_query_chip_boot()
{
  return 45;
}

uint64_t _generic_expert_query_nonce()
{
  return 78;
}

uint64_t _generic_expert_entangle_nonce()
{
  return 78;
}

uint64_t _generic_expert_read_boot_manifest()
{
  return 78;
}

uint64_t _generic_expert_query_trust_store()
{
  return 78;
}

uint64_t _generic_expert_read_storage()
{
  return 78;
}

uint64_t _generic_expert_write_storage()
{
  return 78;
}

uint64_t _generic_expert_sync_storage()
{
  return 78;
}

uint64_t _generic_expert_query_property_BOOL(uint64_t a1, uint64_t a2, _QWORD *a3, _BYTE *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v10 = *(_BYTE **)(*(_QWORD *)(a1 + 16) + 32);
  if (!chip_instance_check((unint64_t)v10, a3, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8))
    return 2;
  chip_instance_get_BOOL(v10, (uint64_t)a3, a4, v11, v12, v13, v14, v15);
  return 0;
}

uint64_t _generic_expert_query_property_uint32(uint64_t a1, uint64_t a2, _QWORD *a3, _DWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _DWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v10 = *(_DWORD **)(*(_QWORD *)(a1 + 16) + 32);
  if (!chip_instance_check((unint64_t)v10, a3, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8))
    return 2;
  chip_instance_get_uint32(v10, (uint64_t)a3, a4, v11, v12, v13, v14, v15);
  return 0;
}

uint64_t _generic_expert_query_property_uint64(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v10 = *(_QWORD **)(*(_QWORD *)(a1 + 16) + 32);
  if (!chip_instance_check((unint64_t)v10, a3, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8))
    return 2;
  chip_instance_get_uint64(v10, (uint64_t)a3, a4, v11, v12, v13, v14, v15);
  return 0;
}

uint64_t _generic_expert_query_property_digest(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 32);
  if (!chip_instance_check(v10, a3, (uint64_t)a3, a4, a5, a6, a7, a8))
    return 2;
  chip_instance_get_digest(v10, (uint64_t)a3, a4, v11, v12, v13, v14, v15);
  return 0;
}

uint64_t _generic_expert_query_property_version(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 32);
  if (!chip_instance_check(v10, a3, (uint64_t)a3, a4, a5, a6, a7, a8))
    return 2;
  chip_instance_get_version(v10, (uint64_t)a3, a4, v11, v12, v13, v14, v15);
  return 0;
}

uint64_t _generic_expert_boot_once()
{
  return 0;
}

void _generic_expert_read_random(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char vars0;

  __panic_npx("panic: should never be called", a2, a3, a4, a5, a6, a7, a8, vars0);
}

void _generic_expert_syscall(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char vars0;

  __panic_npx("panic: should never be called", a2, a3, a4, a5, a6, a7, a8, vars0);
}

uint64_t img4_runtime_get_expert(char *a1)
{
  uint64_t (**v2)(void);
  char *v3;

  if (a1 == (char *)&_img4_runtime_default || a1 == (char *)&_img4_runtime_restore)
  {
    v2 = (uint64_t (**)(void))(a1 + 88);
  }
  else
  {
    v3 = (char *)*((_QWORD *)a1 + 1);
    if (v3 == "darwin userspace")
    {
      v2 = &off_251CD0C50;
    }
    else
    {
      if (v3 != "restoreOS")
        return 0;
      v2 = &off_251CD54E8;
    }
  }
  return (*v2)();
}

uint64_t img4_runtime_check_custom_BOOL(uint64_t a1)
{
  uint64_t v1;
  char v2;
  char v3;

  v1 = 0;
  v2 = 1;
  while (*(_QWORD *)(a1 + 56) != *((_QWORD *)(&off_251CD5F78)[v1] + 7))
  {
    v3 = v2;
    v2 = 0;
    v1 = 1;
    if ((v3 & 1) == 0)
      return *(_QWORD *)(a1 + 80);
  }
  return 0;
}

uint64_t img4_runtime_check_custom_digest(uint64_t a1)
{
  char v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;

  v1 = 0;
  v2 = 0;
  v3 = *(_QWORD *)(a1 + 80);
  do
  {
    v4 = v1;
    v5 = *(_QWORD *)&(*(&off_251CD5F78)[v2])[80];
    if (v3 == v5)
      break;
    v1 = 1;
    v2 = 1;
  }
  while ((v4 & 1) == 0);
  if (v3 == v5)
    return 0;
  else
    return *(_QWORD *)(a1 + 80);
}

uint64_t version_init(uint64_t a1, char *a2, size_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v17;
  char *__stringp;
  _OWORD v19[4];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  memset(v19, 0, sizeof(v19));
  __stringp = (char *)v19;
  cstring_init_with_buff(a1, a2, a3);
  *(_QWORD *)(a1 + 96) = 0xFADE2DED00000000;
  *(_OWORD *)(a1 + 80) = xmmword_24BA99CB0;
  cstring_get_string(a1);
  __strlcpy_chk();
  v17 = strsep_npx(&__stringp, ",");
  if (__stringp)
    *(_DWORD *)(a1 + 100) = _strtou_bounded(__stringp, 0, 0, v4, v5, v6, v7, v8);
  for (i = 0; i != 5; ++i)
  {
    v10 = strsep_npx(&v17, ".");
    if (!v10)
      break;
    *(_DWORD *)(a1 + i * 4 + 80) = _strtou_bounded(v10, *(unsigned int *)((char *)&xmmword_24BA99CB0 + i * 4), dword_24BA99CC4[i], v11, v12, v13, v14, v15);
  }
  if (!strcmp((const char *)a1, "0.0.0.0.0,0"))
    *(_DWORD *)(a1 + 80) = 0;
  return a1;
}

uint64_t _strtou_bounded(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  char *v14;

  v8 = a3;
  v9 = a2;
  v14 = 0;
  if (a2 > a3)
    __panic_npx_7((uint64_t)a1, a2, a3, a4, a5, a6, a7, a8, a2);
  v10 = strtou32_npx(a1, &v14, 10);
  if (v14 && *v14)
    v10 = v9;
  if (v10 <= v9)
    v11 = v9;
  else
    v11 = v10;
  if (v11 <= v8 || v8 == 0)
    return v11;
  else
    return v9;
}

uint64_t version_compare_xgroup(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  unsigned int v5;
  unsigned int v6;

  v2 = a1 + 80;
  if (!*(_DWORD *)(a1 + 80))
    return 0;
  v3 = 0;
  result = 1;
  while (1)
  {
    v5 = *(_DWORD *)(v2 + v3);
    v6 = *(_DWORD *)(a2 + 80 + v3);
    if (v5 > v6)
      break;
    if (v5 < v6)
      return 2;
    v3 += 4;
    if (v3 == 20)
      return 0;
  }
  return result;
}

uint64_t version_compare(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  unsigned int v5;
  unsigned int v6;

  v2 = a1 + 80;
  if (!*(_DWORD *)(a1 + 80))
    return 0;
  if (*(_DWORD *)(a1 + 100) != *(_DWORD *)(a2 + 100))
    return 3;
  v3 = 0;
  result = 1;
  while (1)
  {
    v5 = *(_DWORD *)(v2 + v3);
    v6 = *(_DWORD *)(a2 + 80 + v3);
    if (v5 > v6)
      break;
    if (v5 < v6)
      return 2;
    v3 += 4;
    if (v3 == 20)
      return 0;
  }
  return result;
}

__n128 version_copy(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __n128 result;
  __int128 v5;
  __int128 v6;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  result = (__n128)a2[3];
  v5 = a2[4];
  v6 = a2[5];
  *(_QWORD *)(a1 + 96) = *((_QWORD *)a2 + 12);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

char *version_copyout(char *__source, char *__dst)
{
  char *result;
  uint64_t v4;

  result = (char *)strlcpy(__dst, __source, 0x40uLL);
  v4 = 0;
  while (v4 != 64)
  {
    if (!__dst[v4++])
      return __dst;
  }
  __break(0x5519u);
  return result;
}

void __panic_npx_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  char __str[2048];
  char *v10;

  v10 = (char *)0xAAAAAAAAAAAAAAAALL;
  bzero(__str, 0x800uLL);
  v10 = &a9;
  vsnprintf(__str, 0x800uLL, "panic: invalid min/max: min = %u, max = %u", &a9);
  _os_crash();
  __break(1u);
}

uint64_t _UnsupportedApComputeDigest()
{
  return 4;
}

uint64_t _UnsupportedApVerifyChain()
{
  return 4;
}

uint64_t _UnsupportedApVerifySignature()
{
  return 4;
}

uint64_t _UnsupportedApEvaluateCertificateProperties()
{
  return 4;
}

uint64_t type_get_handle(uint64_t a1)
{
  uint64_t v1;

  v1 = a1;
  if (*(_DWORD *)(a1 + 8) && dyld_program_minos_at_least())
    return 0;
  return v1;
}

uint64_t type_get_size(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t _type_get_alloc_preference(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

uint64_t _image4_coprocessor_select_internal(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t name;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  switch(*(_QWORD *)(a2 + 8))
  {
    case 0:
      v9 = image4_coprocessor_select_digest(a1, a2);
      goto LABEL_7;
    case 1:
      v9 = image4_coprocessor_select_secure_boot(a1, a2, a3);
      goto LABEL_7;
    case 3:
      v10 = *(_QWORD *)(a2 + 16);
      if (!v10)
        return v10;
      goto LABEL_8;
    case 4:
      v9 = (*(uint64_t (**)(void))(a2 + 16))();
LABEL_7:
      v10 = v9;
      if (v9)
      {
LABEL_8:
        name = chip_get_name(v10);
        expert_log(a4, 2uLL, (uint64_t)"resolved: %s", v12, v13, v14, v15, v16, name);
      }
      return v10;
    default:
      __panic_npx("panic: unreachable case: %s = 0x%llx", a2, a3, a4, a5, a6, a7, a8, (char)"cps->cps_type");
  }
}

uint64_t image4_coprocessor_select_digest(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  v3 = generic_expert_current();
  v4 = *(_QWORD *)expert_get_digest_info(v3, 0, 0);
  if (v4 == 48)
  {
    v6 = a2 + 24;
  }
  else
  {
    result = 0;
    if (v4 != 20)
      return result;
    v6 = a2 + 16;
  }
  return *(_QWORD *)v6;
}

uint64_t image4_coprocessor_select_secure_boot(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, a3);
  v12 = a2 + 16;
  switch(v4)
  {
    case 0:
      return *(_QWORD *)v12;
    case 1:
      v12 = a2 + 24;
      break;
    case 2:
      v12 = a2 + 32;
      break;
    case 3:
      v12 = a2 + 40;
      break;
    default:
      __panic_npx("panic: unreachable case: %s = 0x%llx", v5, v6, v7, v8, v9, v10, v11, (char)"sb");
  }
  return *(_QWORD *)v12;
}

uint64_t image4_coprocessor_get_handle(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 24);
}

uint64_t image4_coprocessor_get_handle_host()
{
  return 0;
}

unint64_t image4_coprocessor_get_secure_boot(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return image4_environment_get_secure_boot(a2, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t image4_coprocessor_get_secure_boot_host(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int secure_boot;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v2 = *(_QWORD *)(a2 + 8);
  v12 = 0;
  secure_boot = expert_get_secure_boot(v2, (uint64_t)&v12);
  if (secure_boot)
    __panic_npx("panic: failed to get secure boot: %d", v4, v5, v6, v7, v8, v9, v10, secure_boot);
  return v12;
}

uint64_t image4_coprocessor_select(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  _QWORD *v27;
  BOOL v28;
  int v29;

  v5 = a1;
  v6 = *(_QWORD *)(a3 + 8);
  v7 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 16))(a1, a3);
  v15 = v7;
  if (v7 >= *(_QWORD *)(v5 + 608))
    __panic_npx("panic: incomplete coprocessor map: handle = %lld, expected < %lld", v8, v9, v10, v11, v12, v13, v14, v7);
  (*(void (**)(uint64_t, uint64_t))(v5 + 24))(v5, a3);
  result = expert_log(v6, 2uLL, (uint64_t)"resolving environment: coproc = %s, handle = %llx, secure boot = %llx", v16, v17, v18, v19, v20, *(_QWORD *)v5);
  v26 = v5 + 32 + 48 * v15;
  if (a2)
    v27 = a2;
  else
    v27 = (_QWORD *)(v5 + 32 + 48 * v15);
  if (!v27 || (v26 < v5 + 608 ? (v28 = v26 >= v5 + 32) : (v28 = 0), !v28 ? (v29 = 0) : (v29 = 1), a2 || v29))
  {
    if (v27[1] != 2)
      return _image4_coprocessor_select_internal(v5, (uint64_t)v27, a3, v6, v22, v23, v24, v25);
    v5 = v27[2];
    v27 = (_QWORD *)(v5 + 32 + 48 * v27[3]);
    if (!v27)
      return _image4_coprocessor_select_internal(v5, (uint64_t)v27, a3, v6, v22, v23, v24, v25);
    if ((unint64_t)v27 < v5 + 608 && (unint64_t)v27 >= v5 + 32)
      return _image4_coprocessor_select_internal(v5, (uint64_t)v27, a3, v6, v22, v23, v24, v25);
  }
  __break(0x5519u);
  return result;
}

uint64_t *image4_coprocessor_resolve_from_manifest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  __int128 v44;
  char v45;
  uint64_t v46;
  _OWORD v47[28];
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v6 = generic_expert_current();
  v48 = 0;
  memset(v47, 0, sizeof(v47));
  v7 = expert_runtime_boot(v6);
  if ((_DWORD)v7)
  {
    *(_QWORD *)&v44 = v7;
    v13 = "failed to boot expert for chip selection: %d";
    v14 = v6;
    v15 = 3;
    goto LABEL_5;
  }
  Img4DecodeInitAsManifest(a1, a2, (uint64_t)v47);
  if ((_DWORD)v16)
  {
    *(_QWORD *)&v44 = v16;
    v13 = "Img4DecodeInitAsManifest: %d";
    v14 = v6;
    v15 = 0;
LABEL_5:
    expert_log(v14, v15, (uint64_t)v13, v8, v9, v10, v11, v12, v44);
    return 0;
  }
  v19 = 0;
  while (1)
  {
    v17 = *(uint64_t **)(a3 + v19);
    v46 = 0;
    if (v17)
    {
      v20 = v17 + 77;
      v21 = image4_environment_new((uint64_t)v17, 0);
      v46 = v21;
      if (!v21)
      {
        MEMORY[0x24BDAC7A8](0, v22, v23, v24, v25, v26, v27, v28);
        *(_QWORD *)&v36 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v36 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *((_OWORD *)&v45 - 2) = v36;
        v44 = v36;
        *((_OWORD *)&v45 - 4) = v36;
        *((_OWORD *)&v45 - 3) = v36;
        *((_OWORD *)&v45 - 6) = v36;
        *((_OWORD *)&v45 - 5) = v36;
        *((_OWORD *)&v45 - 8) = v36;
        *((_OWORD *)&v45 - 7) = v36;
        *((_OWORD *)&v45 - 10) = v36;
        *((_OWORD *)&v45 - 9) = v36;
        *((_OWORD *)&v45 - 12) = v36;
        *((_OWORD *)&v45 - 11) = v36;
        *((_OWORD *)&v45 - 14) = v36;
        *((_OWORD *)&v45 - 13) = v36;
        *((_OWORD *)&v45 - 16) = v36;
        *((_OWORD *)&v45 - 15) = v36;
        if (v17 >= v20)
          goto LABEL_19;
        v21 = _image4_environment_init((uint64_t)(&v45 - 256), (uint64_t)v17, 0, 0, v32, v33, v34, v35);
        v46 = v21;
      }
      v37 = image4_environment_resolve(v21);
      if (v37)
      {
        v29 = *(__int128 **)(v37 + 32);
        if (!v29)
          goto LABEL_20;
        Img4DecodeCheckAuthority((uint64_t)v47, v29);
        if (!v43)
          break;
      }
    }
    image4_environment_destroy(&v46);
    v19 += 8;
    if (v19 == 24)
      return 0;
  }
  expert_log(v6, 2uLL, (uint64_t)"manifest matches coproc: %s", v38, v39, v40, v41, v42, *v17);
  image4_environment_destroy(&v46);
  if (v17 >= v20)
  {
LABEL_19:
    __break(0x5519u);
LABEL_20:
    __panic_npx("panic: illegal coprocessor map: canonical handle has no static decode implementation", (uint64_t)v29, v30, v31, v32, v33, v34, v35, v45);
  }
  return v17;
}

uint64_t img4_image_get_bytes(uint64_t a1)
{
  uint64_t v2;
  uint64_t encoded_bytes;
  unint64_t *v4;
  uint64_t result;
  unint64_t v6;
  unint64_t v7;
  _OWORD v8[2];
  uint64_t v9;

  v9 = 0;
  memset(v8, 0, sizeof(v8));
  v2 = *(_QWORD *)(a1 + 40);
  if ((*(_BYTE *)a1 & 0x10) != 0)
    encoded_bytes = (uint64_t)payload_get_encoded_bytes(v2, v8);
  else
    encoded_bytes = payload_get_decoded_bytes(v2, (uint64_t)v8);
  v4 = (unint64_t *)encoded_bytes;
  *(_WORD *)(a1 + 8) = 0;
  result = a1 + 8;
  v7 = *v4;
  v6 = v4[1];
  if (v7 > v7 + v6)
  {
    __break(0x5519u);
  }
  else
  {
    *(_QWORD *)(a1 + 16) = v7;
    *(_QWORD *)(a1 + 24) = v6;
    *(_QWORD *)(a1 + 32) = 0;
  }
  return result;
}

BOOL *img4_image_get_property_BOOL(uint64_t a1, unsigned int a2, BOOL *a3)
{
  if (Img4DecodeGetObjectPropertyBoolean(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 104), **(unsigned int **)(*(_QWORD *)(a1 + 40) + 8), a2, a3))return 0;
  else
    return a3;
}

_DWORD *img4_image_get_property_uint32(uint64_t a1, unsigned int a2, _DWORD *a3)
{
  int v4;

  Img4DecodeGetObjectPropertyInteger(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 104), **(unsigned int **)(*(_QWORD *)(a1 + 40) + 8), a2, a3);
  if (v4)
    return 0;
  else
    return a3;
}

unint64_t *img4_image_get_property_uint64(uint64_t a1, unsigned int a2, unint64_t *a3)
{
  int v4;

  Img4DecodeGetObjectPropertyInteger64(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 104), **(unsigned int **)(*(_QWORD *)(a1 + 40) + 8), a2, a3);
  if (v4)
    return 0;
  else
    return a3;
}

uint64_t img4_image_get_property_data(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(v4 + 104);
  v6 = **(unsigned int **)(v4 + 8);
  v11 = 0;
  v12 = 0;
  Img4DecodeGetObjectPropertyData(v5, v6, a2, &v11, &v12);
  v8 = v7;
  result = 0;
  if (!v8)
  {
    *(_WORD *)a3 = 0;
    v10 = v12;
    *(_QWORD *)(a3 + 8) = v11;
    *(_QWORD *)(a3 + 16) = v10;
    *(_QWORD *)(a3 + 24) = 0;
    return a3;
  }
  return result;
}

BOOL *img4_image_get_entitlement_BOOL(uint64_t a1, unsigned int a2, BOOL *a3)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a1 + 48);
  if (*(_WORD *)(v4 + 528))
    v5 = v4 + 72;
  else
    v5 = 0;
  if (Img4DecodeGetBooleanFromSection(v5, 0, a2, a3))
    return 0;
  else
    return a3;
}

_DWORD *img4_image_get_entitlement_uint32(uint64_t a1, unsigned int a2, _DWORD *a3)
{
  uint64_t v4;
  uint64_t v5;
  int v6;

  v4 = *(_QWORD *)(a1 + 48);
  if (*(_WORD *)(v4 + 528))
    v5 = v4 + 72;
  else
    v5 = 0;
  Img4DecodeGetIntegerFromSection(v5, 0, a2, a3);
  if (v6)
    return 0;
  else
    return a3;
}

unint64_t *img4_image_get_entitlement_uint64(uint64_t a1, unsigned int a2, unint64_t *a3)
{
  uint64_t v4;
  uint64_t v5;
  int v6;

  v4 = *(_QWORD *)(a1 + 48);
  if (*(_WORD *)(v4 + 528))
    v5 = v4 + 72;
  else
    v5 = 0;
  Img4DecodeGetInteger64FromSection(v5, 0, a2, a3);
  if (v6)
    return 0;
  else
    return a3;
}

uint64_t img4_image_get_entitlement_data(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = *(_QWORD *)(a1 + 48);
  if (*(_WORD *)(v4 + 528))
    v5 = v4 + 72;
  else
    v5 = 0;
  v10 = 0;
  v11 = 0;
  Img4DecodeGetDataFromSection(v5, 0, a2, &v10, &v11);
  v7 = v6;
  result = 0;
  if (!v7)
  {
    *(_WORD *)a3 = 0;
    v9 = v11;
    *(_QWORD *)(a3 + 8) = v10;
    *(_QWORD *)(a3 + 16) = v9;
    *(_QWORD *)(a3 + 24) = 0;
    return a3;
  }
  return result;
}

_QWORD *img4_image_init(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *result = a4;
  result[5] = a2;
  result[6] = a3;
  return result;
}

uint64_t boot_expert_boot_manifest(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
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
  uint64_t result;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  unint64_t v42;
  unint64_t *v43;
  uint64_t v44;
  _QWORD v45[2];
  uint64_t v46;
  uint64_t v47;
  _OWORD v48[3];
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[72];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v48[0] = xmmword_251CD6750;
  v48[1] = *(_OWORD *)&off_251CD6760;
  v48[2] = xmmword_251CD6770;
  v49 = 0;
  v45[0] = a1;
  v45[1] = a2;
  v46 = 0;
  v47 = 0;
  memset(v52, 170, sizeof(v52));
  v50 = xmmword_24BA99E48;
  v51 = unk_24BA99E58;
  _expert_assert(a1, 1651470196, (uint64_t)"boot manifest", a4, a5, a6, a7, a8);
  if (a3[1])
  {
    v11 = a3[2];
    v46 = a3[1];
    v47 = v11;
  }
  manifest_set_callbacks((uint64_t)a3, (uint64_t)v45, (uint64_t)v48);
  v12 = manifest_parse((uint64_t)a3);
  if ((_DWORD)v12)
  {
    v18 = v12;
    expert_log(a1, 0, (uint64_t)"failed to parse manifest for boot: %d", v13, v14, v15, v16, v17, v12);
    goto LABEL_7;
  }
  v26 = manifest_impose(a3, a2, 0, 0);
  if ((_DWORD)v26)
  {
    v18 = v26;
    expert_log(a1, 0, (uint64_t)"failed to impose manifest for boot: %d", v27, v28, v29, v30, v31, v26);
LABEL_7:
    if (v18 >= 0x6A)
      __panic_npx("panic: error not set to valid posix code: %d", v19, v20, v21, v22, v23, v24, v25, v18);
    return v18;
  }
  if (!*(_QWORD *)(a2 + 248))
  {
LABEL_15:
    expert_log(a1, 2uLL, (uint64_t)"booted manifest", v27, v28, v29, v30, v31, v44);
    return 0;
  }
  result = manifest_measure((uint64_t)a3, a2, (uint64_t)&v50);
  v33 = *(_QWORD *)(a1 + 24);
  v34 = *(_QWORD *)(*(_QWORD *)(a2 + 248) + 16);
  v35 = v33 + 272;
  v36 = v33 + 272 + 104 * v34;
  if (v36 < v33 + 3704 && v36 >= v35)
  {
    v37 = v50;
    v38 = *(_OWORD *)v52;
    *(_OWORD *)(v36 + 16) = v51;
    *(_OWORD *)(v36 + 32) = v38;
    *(_OWORD *)v36 = v37;
    v39 = *(_OWORD *)&v52[16];
    v40 = *(_OWORD *)&v52[32];
    v41 = *(_OWORD *)&v52[48];
    *(_QWORD *)(v36 + 96) = *(_QWORD *)&v52[64];
    *(_OWORD *)(v36 + 64) = v40;
    *(_OWORD *)(v36 + 80) = v41;
    *(_OWORD *)(v36 + 48) = v39;
    v42 = v33 + 8;
    v43 = (unint64_t *)(v33 + 8 + 8 * v34);
    if ((unint64_t)v43 < v35 && (unint64_t)v43 >= v42)
    {
      *v43 = v36;
      goto LABEL_15;
    }
  }
  __break(0x5519u);
  return result;
}

unint64_t _boot_expert_property_BOOL(uint64_t a1, _DWORD *a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t (**v11)(uint64_t, _DWORD *, uint64_t, uint64_t, uint64_t);
  unint64_t result;
  uint64_t v13;
  unint64_t v14;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  unint64_t v26;
  unint64_t *v27;

  v9 = *a5;
  v11 = (uint64_t (**)(uint64_t, _DWORD *, uint64_t, uint64_t, uint64_t))a5[2];
  v10 = a5[3];
  result = _boot_expert_find_entitlement(*a5, a2, a3, a5[1], (uint64_t)&_property_type_BOOL);
  if (result)
  {
    v13 = *(_QWORD *)(v9 + 24);
    v14 = v13 + 272 + 104 * *(_QWORD *)(result + 16);
    if (v14)
    {
      if (v14 >= v13 + 3704 || v14 < v13 + 272)
        goto LABEL_23;
    }
    *(_BYTE *)v14 = a4;
    v16 = *(_QWORD *)(v9 + 24);
    v17 = *(_QWORD *)(result + 16);
    v18 = v16 + 272;
    v19 = v16 + 272 + 104 * v17;
    if (v19 >= v16 + 3704 || v19 < v18)
      goto LABEL_23;
    v21 = *(_OWORD *)v14;
    v22 = *(_OWORD *)(v14 + 32);
    *(_OWORD *)(v19 + 16) = *(_OWORD *)(v14 + 16);
    *(_OWORD *)(v19 + 32) = v22;
    *(_OWORD *)v19 = v21;
    v23 = *(_OWORD *)(v14 + 48);
    v24 = *(_OWORD *)(v14 + 64);
    v25 = *(_OWORD *)(v14 + 80);
    *(_QWORD *)(v19 + 96) = *(_QWORD *)(v14 + 96);
    *(_OWORD *)(v19 + 64) = v24;
    *(_OWORD *)(v19 + 80) = v25;
    *(_OWORD *)(v19 + 48) = v23;
    v26 = v16 + 8;
    v27 = (unint64_t *)(v26 + 8 * v17);
    if ((unint64_t)v27 >= v18 || (unint64_t)v27 < v26)
    {
LABEL_23:
      __break(0x5519u);
      return result;
    }
    *v27 = v19;
  }
  if (v11)
  {
    if (*v11)
      return (*v11)(a1, a2, a3, a4, v10);
  }
  return result;
}

unint64_t _boot_expert_property_integer(uint64_t a1, _DWORD *a2, uint64_t a3, unint64_t a4, uint64_t *a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  _QWORD *v15;
  unint64_t result;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  BOOL v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  unint64_t v38;
  unint64_t *v39;
  uint64_t (*v41)(uint64_t, _DWORD *, uint64_t, unint64_t, uint64_t);

  v8 = 0;
  v9 = *a5;
  v10 = a5[1];
  v12 = a5[2];
  v11 = a5[3];
  v13 = 1;
  do
  {
    v14 = v13;
    v15 = (_QWORD *)off_251CD6788[v8];
    result = _boot_expert_find_entitlement(v9, a2, a3, v10, (uint64_t)v15);
    if (result)
    {
      v24 = *(_QWORD *)(v9 + 24);
      v25 = v24 + 272 + 104 * *(_QWORD *)(result + 16);
      if (!v25 || (v25 < v24 + 3704 ? (v26 = v25 >= v24 + 272) : (v26 = 0), v26))
      {
        if (*v15 == 2)
        {
          *(_QWORD *)v25 = a4;
        }
        else
        {
          if (*v15 != 1)
            goto LABEL_36;
          if (HIDWORD(a4))
            __panic_npx("panic: integer cast overflow: v = %s, actual = %llu, expected <= %llu", v17, v18, v19, v20, v21, v22, v23, (char)"v");
          *(_DWORD *)v25 = a4;
        }
        if (v25)
          v27 = v25 >= v25 + 104;
        else
          v27 = 0;
        if (!v27)
        {
          v28 = *(_QWORD *)(v9 + 24);
          v29 = *(_QWORD *)(result + 16);
          v30 = v28 + 272;
          v31 = v28 + 272 + 104 * v29;
          if (v31 < v28 + 3704 && v31 >= v30)
          {
            v33 = *(_OWORD *)v25;
            v34 = *(_OWORD *)(v25 + 32);
            *(_OWORD *)(v31 + 16) = *(_OWORD *)(v25 + 16);
            *(_OWORD *)(v31 + 32) = v34;
            *(_OWORD *)v31 = v33;
            v35 = *(_OWORD *)(v25 + 48);
            v36 = *(_OWORD *)(v25 + 64);
            v37 = *(_OWORD *)(v25 + 80);
            *(_QWORD *)(v31 + 96) = *(_QWORD *)(v25 + 96);
            *(_OWORD *)(v31 + 64) = v36;
            *(_OWORD *)(v31 + 80) = v37;
            *(_OWORD *)(v31 + 48) = v35;
            v38 = v28 + 8;
            v39 = (unint64_t *)(v38 + 8 * v29);
            if ((unint64_t)v39 < v30 && (unint64_t)v39 >= v38)
            {
              *v39 = v31;
              if (v12)
                goto LABEL_32;
              return result;
            }
          }
        }
      }
      __break(0x5519u);
LABEL_36:
      __panic_npx("panic: unreachable case: %s = 0x%llx", v17, v18, v19, v20, v21, v22, v23, (char)"pti->pt_switchable");
    }
    v13 = 0;
    v8 = 1;
  }
  while ((v14 & 1) != 0);
  if (!v12)
    return result;
LABEL_32:
  v41 = *(uint64_t (**)(uint64_t, _DWORD *, uint64_t, unint64_t, uint64_t))(v12 + 8);
  if (v41)
    return v41(a1, a2, a3, a4, v11);
  return result;
}

uint64_t _boot_expert_property_data(uint64_t a1, _DWORD *a2, uint64_t a3, char *a4, size_t a5, uint64_t *a6)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  _QWORD *v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v28;
  BOOL v29;
  BOOL v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  unint64_t v42;
  unint64_t *v43;
  uint64_t (*v45)(uint64_t, _DWORD *, uint64_t, char *, size_t, uint64_t);
  uint64_t v46;

  v9 = 0;
  v10 = *a6;
  v11 = a6[1];
  v12 = a6[2];
  v46 = a6[3];
  v13 = 1;
  do
  {
    v14 = v13;
    v15 = (_QWORD *)off_251CD6798[v9];
    result = _boot_expert_find_entitlement(v10, a2, a3, v11, (uint64_t)v15);
    if (result)
    {
      v24 = result;
      v25 = *(_QWORD *)(v10 + 24);
      v26 = v25 + 272 + 104 * *(_QWORD *)(result + 16);
      if (v26)
      {
        if (v26 >= v25 + 3704 || v26 < v25 + 272)
          goto LABEL_42;
      }
      v28 = v26 + 104;
      if (*v15 == 4)
      {
        if (v26)
          v30 = v26 >= v28;
        else
          v30 = 0;
        if (!v30)
        {
          result = version_init(v26, a4, a5);
LABEL_24:
          if (v26)
            v31 = v26 >= v28;
          else
            v31 = 0;
          if (!v31)
          {
            v32 = *(_QWORD *)(v10 + 24);
            v33 = *(_QWORD *)(v24 + 16);
            v34 = v32 + 272;
            v35 = v32 + 272 + 104 * v33;
            if (v35 < v32 + 3704 && v35 >= v34)
            {
              v37 = *(_OWORD *)v26;
              v38 = *(_OWORD *)(v26 + 32);
              *(_OWORD *)(v35 + 16) = *(_OWORD *)(v26 + 16);
              *(_OWORD *)(v35 + 32) = v38;
              *(_OWORD *)v35 = v37;
              v39 = *(_OWORD *)(v26 + 48);
              v40 = *(_OWORD *)(v26 + 64);
              v41 = *(_OWORD *)(v26 + 80);
              *(_QWORD *)(v35 + 96) = *(_QWORD *)(v26 + 96);
              *(_OWORD *)(v35 + 64) = v40;
              *(_OWORD *)(v35 + 80) = v41;
              *(_OWORD *)(v35 + 48) = v39;
              v42 = v32 + 8;
              v43 = (unint64_t *)(v32 + 8 + 8 * v33);
              if ((unint64_t)v43 < v34 && (unint64_t)v43 >= v42)
              {
                *v43 = v35;
                if (v12)
                  goto LABEL_39;
                return result;
              }
            }
          }
        }
      }
      else
      {
        if (*v15 != 3)
          goto LABEL_43;
        if (v26)
          v29 = v26 >= v26 + 80;
        else
          v29 = 0;
        if (!v29)
        {
          result = digest_init(v26, a4, a5, v19, v20, v21, v22, v23);
          goto LABEL_24;
        }
      }
LABEL_42:
      __break(0x5519u);
LABEL_43:
      __panic_npx("panic: unreachable case: %s = 0x%llx", v17, v18, v19, v20, v21, v22, v23, (char)"pti->pt_switchable");
    }
    v13 = 0;
    v9 = 1;
  }
  while ((v14 & 1) != 0);
  if (!v12)
    return result;
LABEL_39:
  v45 = *(uint64_t (**)(uint64_t, _DWORD *, uint64_t, char *, size_t, uint64_t))(v12 + 16);
  if (v45)
    return v45(a1, a2, a3, a4, a5, v46);
  return result;
}

uint64_t _boot_expert_odometer_prepare(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, _QWORD);

  v3 = *(_QWORD *)(a3 + 16);
  if (v3)
  {
    v4 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v3 + 32);
    if (v4)
      return v4(result, a2, *(_QWORD *)(a3 + 24));
  }
  return result;
}

_QWORD *boot_expert_boot_closure(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *result;
  uint64_t v12;
  unint64_t v13;
  __int128 *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  unint64_t v21;
  __int128 **v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[72];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  memset(v25, 170, sizeof(v25));
  v23 = xmmword_24BA99E48;
  v24 = unk_24BA99E58;
  v5 = (_QWORD *)(*(uint64_t (**)(void))(*(_QWORD *)(a2 + 8) + 48))();
  result = digest_init_measure(&v23, v5, a3, v6, v7, v8, v9, v10);
  v12 = *(_QWORD *)(a1 + 24);
  v13 = v12 + 272;
  v14 = (__int128 *)(v12 + 3496);
  if (v12 + 3496 >= (unint64_t)(v12 + 3704) || (unint64_t)v14 < v13)
    goto LABEL_9;
  v16 = v23;
  v17 = *(_OWORD *)v25;
  *(_OWORD *)(v12 + 3512) = v24;
  *(_OWORD *)(v12 + 3528) = v17;
  *v14 = v16;
  v18 = *(_OWORD *)&v25[16];
  v19 = *(_OWORD *)&v25[32];
  v20 = *(_OWORD *)&v25[48];
  *(_QWORD *)(v12 + 3592) = *(_QWORD *)&v25[64];
  *(_OWORD *)(v12 + 3560) = v19;
  *(_OWORD *)(v12 + 3576) = v20;
  *(_OWORD *)(v12 + 3544) = v18;
  v21 = v12 + 8;
  v22 = (__int128 **)(v12 + 256);
  if ((unint64_t)v22 >= v13 || (unint64_t)v22 < v21)
LABEL_9:
    __break(0x5519u);
  *v22 = v14;
  return result;
}

uint64_t _boot_expert_boot()
{
  return 0;
}

_QWORD *_boot_expert_logv(uint64_t a1)
{
  return (*(_QWORD *(**)(_QWORD *__return_ptr))(**(_QWORD **)(a1 + 16) + 48))(*(_QWORD **)(a1 + 16));
}

uint64_t _boot_expert_get_digest_info(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return expert_get_digest_info(**(_QWORD **)(a1 + 16), a2, a3);
}

uint64_t _boot_expert_get_secure_boot(uint64_t a1, uint64_t a2)
{
  return expert_get_secure_boot(**(_QWORD **)(a1 + 16), a2);
}

uint64_t _boot_expert_query_chip(uint64_t a1, uint64_t a2)
{
  return expert_query_chip(**(_QWORD **)(a1 + 16), a2);
}

uint64_t _boot_expert_query_chip_boot(uint64_t a1, uint64_t a2)
{
  return expert_query_chip_boot(**(_QWORD **)(a1 + 16), a2);
}

uint64_t _boot_expert_query_nonce(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return expert_query_nonce(**(_QWORD **)(a1 + 16), a2, a3, a4);
}

uint64_t _boot_expert_entangle_nonce(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return expert_entangle_nonce(**(_QWORD **)(a1 + 16), a2, a3, a4, a5);
}

uint64_t _boot_expert_read_boot_manifest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return expert_read_boot_manifest(**(_QWORD **)(a1 + 16), a2, a3, a4);
}

uint64_t _boot_expert_query_trust_store(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return expert_query_trust_store(**(_QWORD **)(a1 + 16), a2, a3, a4, a5);
}

uint64_t _boot_expert_read_storage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return expert_read_storage(**(_QWORD **)(a1 + 16), a2, a3, a4);
}

uint64_t _boot_expert_write_storage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return expert_write_storage(**(_QWORD **)(a1 + 16), a2, a3, a4);
}

uint64_t _boot_expert_sync_storage(uint64_t a1, uint64_t a2)
{
  return expert_sync_storage(**(_QWORD **)(a1 + 16), a2);
}

uint64_t _boot_expert_query_property_BOOL(uint64_t result, uint64_t a2, uint64_t a3, BOOL *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  BOOL **v14;
  BOOL *v16;
  uint64_t v17;

  if ((char **)a3 == &_property_iuob)
    return expert_compute_eieiou_BOOL(result, a2, a4);
  v11 = *(_QWORD *)(result + 24);
  v12 = v11 + 8;
  v13 = v11 + 272;
  v14 = (BOOL **)(v11 + 8 + 8 * *(_QWORD *)(a3 + 16));
  if ((unint64_t)v14 < v13 && (unint64_t)v14 >= v12)
  {
    v16 = *v14;
    if (v16)
    {
      *a4 = *v16;
      return 0;
    }
    else
    {
      v17 = **(_QWORD **)(result + 16);
      expert_log(result, 2uLL, (uint64_t)"falling back to base expert for property: %s", (uint64_t)a4, a5, a6, a7, a8, a3 + 28);
      return expert_query_property_BOOL(v17, a2, a3, (unsigned __int8 *)a4);
    }
  }
  else
  {
    __break(0x5519u);
  }
  return result;
}

uint64_t _boot_expert_query_property_uint32(uint64_t result, uint64_t a2, uint64_t a3, _DWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _DWORD **v11;
  _DWORD *v14;
  uint64_t v17;

  v8 = *(_QWORD *)(result + 24);
  v9 = v8 + 8;
  v10 = v8 + 272;
  v11 = (_DWORD **)(v8 + 8 + 8 * *(_QWORD *)(a3 + 16));
  if ((unint64_t)v11 < v10 && (unint64_t)v11 >= v9)
  {
    v14 = *v11;
    if (v14)
    {
      *a4 = *v14;
      return 0;
    }
    else
    {
      v17 = **(_QWORD **)(result + 16);
      expert_log(result, 2uLL, (uint64_t)"falling back to base expert for property: %s", (uint64_t)a4, a5, a6, a7, a8, a3 + 28);
      return expert_query_property_uint32(v17, a2, a3, a4);
    }
  }
  else
  {
    __break(0x5519u);
  }
  return result;
}

uint64_t _boot_expert_query_property_uint64(uint64_t result, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD **v11;
  _QWORD *v14;
  uint64_t v17;

  v8 = *(_QWORD *)(result + 24);
  v9 = v8 + 8;
  v10 = v8 + 272;
  v11 = (_QWORD **)(v8 + 8 + 8 * *(_QWORD *)(a3 + 16));
  if ((unint64_t)v11 < v10 && (unint64_t)v11 >= v9)
  {
    v14 = *v11;
    if (v14)
    {
      *a4 = *v14;
      return 0;
    }
    else
    {
      v17 = **(_QWORD **)(result + 16);
      expert_log(result, 2uLL, (uint64_t)"falling back to base expert for property: %s", (uint64_t)a4, a5, a6, a7, a8, a3 + 28);
      return expert_query_property_uint64(v17, a2, a3, a4);
    }
  }
  else
  {
    __break(0x5519u);
  }
  return result;
}

uint64_t _boot_expert_query_property_digest(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t *v11;
  unint64_t v15;
  uint64_t v17;

  v8 = *(_QWORD *)(result + 24);
  v9 = v8 + 8;
  v10 = v8 + 272;
  v11 = (unint64_t *)(v8 + 8 + 8 * *(_QWORD *)(a3 + 16));
  if ((unint64_t)v11 < v10 && (unint64_t)v11 >= v9)
  {
    v15 = *v11;
    if (!*v11)
    {
      v17 = **(_QWORD **)(result + 16);
      expert_log(result, 2uLL, (uint64_t)"falling back to base expert for property: %s", a4, a5, a6, a7, a8, a3 + 28);
      return expert_query_property_digest(v17, a2, a3, a4);
    }
    if (v15 < v15 + 80)
    {
      digest_copy(a4, v15, a3, a4, a5, a6, a7, a8);
      return 0;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t _boot_expert_query_property_version(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  __int128 **v11;
  __int128 *v15;
  uint64_t v17;

  v8 = *(_QWORD *)(result + 24);
  v9 = v8 + 8;
  v10 = v8 + 272;
  v11 = (__int128 **)(v8 + 8 + 8 * *(_QWORD *)(a3 + 16));
  if ((unint64_t)v11 < v10 && (unint64_t)v11 >= v9)
  {
    v15 = *v11;
    if (!*v11)
    {
      v17 = **(_QWORD **)(result + 16);
      expert_log(result, 2uLL, (uint64_t)"falling back to base expert for property: %s", a4, a5, a6, a7, a8, a3 + 28);
      return expert_query_property_version(v17, a2, a3, a4);
    }
    if (v15 < (__int128 *)((char *)v15 + 104))
    {
      version_copy(a4, v15);
      return 0;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t _boot_expert_boot_once()
{
  return 0;
}

uint64_t _boot_expert_read_random(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3)
    return expert_read_random(**(_QWORD **)(result + 16), a2, a3);
  __break(0x5519u);
  return result;
}

uint64_t _boot_expert_syscall(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return expert_syscall(**(_QWORD **)(a1 + 16), a2, a3, a4, a5, a6);
}

unint64_t _boot_expert_find_entitlement(uint64_t a1, _DWORD *a2, int a3, uint64_t a4, uint64_t a5)
{
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
  const char *v23;
  unint64_t result;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v10 = (uint64_t)(a2 + 1);
  chip_get_name(a4);
  expert_log(a1, 2uLL, (uint64_t)"finding entitlement for chip: entitlement = %s, chip = %s", v11, v12, v13, v14, v15, v10);
  if (a3)
  {
    v23 = "not a manifest property";
LABEL_11:
    expert_log(a1, 2uLL, (uint64_t)v23, v18, v19, v20, v21, v22, v27);
    return 0;
  }
  result = property_find_entitlement(a2, v16, v17, v18, v19, v20, v21, v22);
  if (!result || (v25 = result, *(_QWORD *)(result + 16) == 33))
  {
    v23 = "not an expert property";
    goto LABEL_11;
  }
  v26 = *(_QWORD *)(result + 40);
  if (v26 != a5)
  {
    expert_log(a1, 2uLL, (uint64_t)"unexpected type: actual = %s, expected = %s", v18, v19, v20, v21, v22, *(_QWORD *)(v26 + 8));
    return 0;
  }
  if (result < result + 104)
  {
    if (!chip_check_entitlement(a4, result))
    {
      expert_log(a1, 2uLL, (uint64_t)"entitlement present for chip", v18, v19, v20, v21, v22, v27);
      return v25;
    }
    v23 = "entitlement not present in chip";
    goto LABEL_11;
  }
  __break(0x5519u);
  return result;
}

uint64_t odometer_compute_nonce_hash(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *chip;
  uint64_t v7;
  uint64_t v8;
  uint64_t digest_info;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  size_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
  uint64_t name;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _OWORD v38[4];
  uint64_t v39;

  chip = a2;
  v39 = *MEMORY[0x24BDAC8D0];
  memset(v38, 0, sizeof(v38));
  if (!a2)
    chip = (_QWORD *)expert_query_chip(a1, 0);
  if (!chip[25] || (v7 = chip[21]) != 0)
    v7 = 1;
  if (chip[22])
    v8 = 0;
  else
    v8 = v7;
  digest_info = expert_get_digest_info(a1, (uint64_t)chip, v8);
  MEMORY[0x24BDAC7A8](digest_info, v10, (*(_QWORD *)(digest_info + 8) + *(_QWORD *)(digest_info + 16) + 19) & 0xFFFFFFFFFFFFFFF8, v11, v12, v13, v14, v15);
  v24 = (char *)v38 - v23;
  if (v25 >= 8)
    memset((char *)v38 - v23, 170, v17);
  if (*(_QWORD *)digest_info >= 0x41uLL)
    __panic_npx("panic: buffer not large enough for digest: actual = %lu, expected >= %lu", v16, v17, v18, v19, v20, v21, v22, 64);
  name = chip_get_name((uint64_t)chip);
  expert_log(a1, 2uLL, (uint64_t)"computing nonce digest: chip = %s, digest length = %lu", v27, v28, v29, v30, v31, name);
  ccdigest_init();
  ccdigest_update();
  (*(void (**)(uint64_t, char *, _OWORD *))(digest_info + 56))(digest_info, v24, v38);
  if (*(_QWORD *)digest_info > 0x40uLL)
    __break(0x5519u);
  return digest_init(a4, v38, *(_QWORD *)digest_info, v32, v33, v34, v35, v36);
}

uint64_t odometer_derive_nonce_hash(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
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
  _QWORD v23[4];

  v23[3] = *MEMORY[0x24BDAC8D0];
  memset(v23, 0, 24);
  v8 = expert_entangle_nonce(a1, (uint64_t)a2, a3, a4, (uint64_t)v23);
  v14 = v8;
  if ((_DWORD)v8)
  {
    expert_log(a1, 0, (uint64_t)"failed to entangle nonce: %d", v9, v10, v11, v12, v13, v8);
    if (v14 >= 0x6A)
      __panic_npx("panic: error not set to valid posix code: %d", v15, v16, v17, v18, v19, v20, v21, v14);
  }
  else
  {
    odometer_compute_nonce_hash(a1, a2, (uint64_t)v23, a5);
  }
  return v14;
}

unint64_t odometer_check_fuse(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  unsigned __int8 *v9;

  v8 = *(_QWORD *)(a2 + 8);
  if (v8 < 0)
    __panic_npx("panic: invalid offset: %lld", a2, a3, a4, a5, a6, a7, a8, *(_QWORD *)(a2 + 8));
  v9 = (unsigned __int8 *)(result + v8);
  if ((unint64_t)v9 < result + 976 && (unint64_t)v9 >= result)
    return *v9;
  __break(0x5519u);
  return result;
}

uint64_t odometer_query_chip_boot(uint64_t a1)
{
  uint64_t v2;
  uint64_t chip_boot;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t name;
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

  v2 = *(_QWORD *)(a1 + 16);
  chip_boot = expert_query_chip_boot(*(_QWORD *)a1, v2);
  if (!(_DWORD)chip_boot)
  {
    v12 = "odometer[%s]: expert boots chip";
LABEL_6:
    v13 = *(_QWORD *)a1;
    name = chip_get_name(*(_QWORD *)(a1 + 16));
    expert_log(v13, 1uLL, (uint64_t)v12, v15, v16, v17, v18, v19, name);
    return 0;
  }
  v4 = chip_boot;
  if ((_DWORD)chip_boot == 45)
  {
    v5 = *(_QWORD *)a1;
    v6 = chip_get_name(*(_QWORD *)(a1 + 16));
    expert_log(v5, 1uLL, (uint64_t)"odometer[%s]: expert does not boot chip", v7, v8, v9, v10, v11, v6);
    if (*(_WORD *)(a1 + 56))
    {
      v12 = "odometer[%s]: nonce supplied; simulating first-stage boot";
    }
    else
    {
      if (!*(_WORD *)(a1 + 232))
        return 45;
      v12 = "odometer[%s]: nonce hash supplied; simulating first-stage boot";
    }
    goto LABEL_6;
  }
  v20 = *(_QWORD *)a1;
  v21 = chip_get_name(*(_QWORD *)(a1 + 16));
  chip_get_name(v2);
  expert_log(v20, 0, (uint64_t)"odometer[%s]: failed to query chip boot: %s: %d", v22, v23, v24, v25, v26, v21);
  if (v4 >= 0x6A)
    __panic_npx("panic: error not set to valid posix code: %d", v27, v28, v29, v30, v31, v32, v33, v4);
  return v4;
}

uint64_t odometer_query_live_nonce(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  uint64_t v11;

  if (*(_WORD *)(a1 + 56))
  {
    nonce_init_copy(a4, (_QWORD *)(a1 + 32), a3, (uint64_t)a4, a5, a6, a7, a8);
    return 0;
  }
  else
  {
    v10 = *(_QWORD *)a1;
    if ((_DWORD)a3 == -1)
      v11 = 0;
    else
      v11 = *(_QWORD *)(a1 + 16);
    return expert_query_nonce(v10, v11, a3, (uint64_t)a4);
  }
}

uint64_t odometer_query_restore_info_nonce(uint64_t *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t name;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t result;
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
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v58[2];
  size_t __n;

  v6 = a1[2];
  v7 = *(unsigned int *)(*(_QWORD *)(v6 + 96) + 24);
  *(_QWORD *)v58 = 0;
  __n = 0;
  v8 = *a1;
  name = chip_get_name(v6);
  expert_log(v8, 1uLL, (uint64_t)"odometer[%s]: querying restore info for boot nonce: %s", v10, v11, v12, v13, v14, name);
  Img4DecodeGetRestoreInfoData(a2, v7, v58, &__n);
  if (v15 == 1)
  {
    v30 = *a1;
    v31 = chip_get_name(a1[2]);
    expert_log(v30, 0, (uint64_t)"odometer[%s]: restore info has no boot nonce", v32, v33, v34, v35, v36, v31);
    return 2;
  }
  else
  {
    v21 = v15;
    if (v15)
    {
      v37 = *a1;
      v38 = chip_get_name(a1[2]);
      expert_log(v37, 0, (uint64_t)"odometer[%s]: failed to query restore info for boot nonce: %d", v39, v40, v41, v42, v43, v38);
      result = posixdr(v21);
      if (result >= 0x6A)
        __panic_npx("panic: error not set to valid posix code: %d", v44, v45, v46, v47, v48, v49, v50, result);
    }
    else if (__n < 0x11)
    {
      nonce_init(a3, *(const void **)v58, __n, v16, v17, v18, v19, v20);
      v51 = *a1;
      v52 = chip_get_name(a1[2]);
      expert_log(v51, 1uLL, (uint64_t)"odometer[%s]: fetched boot nonce from restore info", v53, v54, v55, v56, v57, v52);
      return 0;
    }
    else
    {
      v22 = *a1;
      v23 = chip_get_name(a1[2]);
      expert_log(v22, 1uLL, (uint64_t)"odometer[%s]: restore info nonce too large: actual = %lu, expected <= %lu", v24, v25, v26, v27, v28, v23);
      return 84;
    }
  }
  return result;
}

uint64_t odometer_enforce_property(uint64_t *a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t property_BOOL;
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
  uint64_t name;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t property_version;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t (*v95)(uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD v96[14];

  v96[13] = *MEMORY[0x24BDAC8D0];
  v8 = *(unsigned int *)(a2 + 24);
  v9 = *a1;
  v10 = a1[2];
  *(_OWORD *)v96 = xmmword_24BA99EC0;
  memset(&v96[2], 170, 88);
  switch(**(_QWORD **)(a3 + 40))
  {
    case 0:
      property_BOOL = expert_query_property_BOOL(v9, v10, a3, (unsigned __int8 *)v96);
      if ((_DWORD)property_BOOL)
        goto LABEL_18;
      if (a4 && a4 + 1 < a4)
        goto LABEL_45;
      if (property_constrain_BOOL(a3, v9, a4, (unsigned __int8 *)v96, a5, a6, a7, a8))
        goto LABEL_6;
      return 0;
    case 1:
      property_BOOL = expert_query_property_uint32(v9, v10, a3, v96);
      if ((_DWORD)property_BOOL)
        goto LABEL_18;
      if (a4 && a4 + 4 < a4)
        goto LABEL_45;
      if (!property_constrain_uint32(a3, v9, (unsigned int *)a4, (unsigned int *)v96, a5, a6, a7, a8))
        return 0;
      goto LABEL_6;
    case 2:
      property_BOOL = expert_query_property_uint64(v9, v10, a3, v96);
      if ((_DWORD)property_BOOL)
        goto LABEL_18;
      if (a4 && a4 + 8 < a4)
        goto LABEL_45;
      if (!property_constrain_uint64(a3, v9, (unint64_t *)a4, v96, a5, a6, a7, a8))
        return 0;
      goto LABEL_6;
    case 3:
      property_BOOL = expert_query_property_digest(v9, v10, a3, (uint64_t)v96);
      if ((_DWORD)property_BOOL)
      {
LABEL_18:
        v29 = property_BOOL;
        v30 = *a1;
        name = chip_get_name(a1[2]);
        expert_log(v30, 0, (uint64_t)"odometer[%s:%s]: failed to query expert: p = %s: %d", v32, v33, v34, v35, v36, name);
        v8 = v29;
        goto LABEL_19;
      }
      if (a4 && a4 + 80 < a4)
        goto LABEL_45;
      if (!property_constrain_digest(a3, v9, (unint64_t)a4, (unint64_t)v96, a5, a6, a7, a8))
        return 0;
      goto LABEL_6;
    case 4:
      if (odometer_check_fuse((unint64_t)a1, (uint64_t)&_odometer_cylinder_mixn_match, a3, (uint64_t)a4, a5, a6, a7, a8))
      {
        v44 = *a1;
        v45 = chip_get_name(a1[2]);
        v46 = 1;
        expert_log(v44, 1uLL, (uint64_t)"odometer[%s:%s]: allowing cross-group policy: mix-n-match", v47, v48, v49, v50, v51, v45);
      }
      else
      {
        v46 = 0;
      }
      if ((odometer_check_fuse((unint64_t)a1, (uint64_t)&_odometer_cylinder_production_status, v38, v39, v40, v41, v42, v43) & 1) == 0)
      {
        v58 = *a1;
        v59 = chip_get_name(a1[2]);
        expert_log(v58, 1uLL, (uint64_t)"odometer[%s:%s]: allowing cross-group policy: production status", v60, v61, v62, v63, v64, v59);
        ++v46;
      }
      if (odometer_check_fuse((unint64_t)a1, (uint64_t)&_odometer_cylinder_engineering_use, v52, v53, v54, v55, v56, v57))
      {
        v65 = *a1;
        v66 = chip_get_name(a1[2]);
        expert_log(v65, 1uLL, (uint64_t)"odometer[%s:%s]: allowing cross-group policy: engineering use", v67, v68, v69, v70, v71, v66);
        ++v46;
      }
      if (!*(_QWORD *)(v10 + 24))
      {
        v72 = *a1;
        v73 = chip_get_name(a1[2]);
        v46 = 1;
        expert_log(v72, 1uLL, (uint64_t)"odometer[%s:%s]: allowing cross-group policy: full security", v74, v75, v76, v77, v78, v73);
      }
      if (v10 >= v10 + 264)
        goto LABEL_45;
      property_version = expert_query_property_version(v9, v10, a3, (uint64_t)v96);
      if (!(_DWORD)property_version)
      {
        if (v46)
        {
          v88 = *a1;
          v89 = chip_get_name(a1[2]);
          expert_log(v88, 1uLL, (uint64_t)"odometer[%s:%s]: allowing cross-group version comparison", v90, v91, v92, v93, v94, v89);
          v95 = _odometer_enforce_version_xgroup;
          if (!a4)
            goto LABEL_42;
        }
        else
        {
          v95 = _odometer_enforce_version;
          if (!a4)
            goto LABEL_42;
        }
        if (a4 + 104 < a4)
        {
LABEL_45:
          __break(0x5519u);
LABEL_46:
          __panic_npx("panic: unreachable case: %s = 0x%llx", a2, a3, (uint64_t)a4, a5, a6, a7, a8, (char)"p->p_type->pt_switchable");
        }
LABEL_42:
        if (!v95(a1, a3, (uint64_t)a4, (uint64_t)v96, a5, a6, a7, a8))
          return 0;
LABEL_6:
        v15 = *a1;
        v16 = chip_get_name(a1[2]);
        expert_log(v15, 0, (uint64_t)"odometer[%s:%s]: constraint violation: %s: %d", v17, v18, v19, v20, v21, v16);
        goto LABEL_19;
      }
      v80 = property_version;
      v81 = *a1;
      v82 = chip_get_name(a1[2]);
      expert_log(v81, 0, (uint64_t)"odometer[%s:%s]: failed to query expert: p = %s: %d", v83, v84, v85, v86, v87, v82);
      v8 = v80;
LABEL_19:
      if (v8 >= 0x6A)
        __panic_npx("panic: error not set to valid posix code: %d", v22, v23, v24, v25, v26, v27, v28, v8);
      return v8;
    default:
      goto LABEL_46;
  }
}

uint64_t _odometer_enforce_version(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return property_constrain_version(a2, *a1, a3, a4, a5, a6, a7, a8);
}

uint64_t _odometer_enforce_version_xgroup(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t name;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v11 = property_constrain_version(a2, *a1, a3, a4, a5, a6, a7, a8);
  if ((_DWORD)v11)
  {
    if (*(_DWORD *)(a3 + 100) == *(_DWORD *)(a4 + 100))
    {
      v12 = *a1;
      name = chip_get_name(a1[2]);
      expert_log(v12, 1uLL, (uint64_t)"odometer[%s]: versions directly comparable; allowing enforcement decision to stand",
        v14,
        v15,
        v16,
        v17,
        v18,
        name);
    }
    else
    {
      return 0;
    }
  }
  return v11;
}

double odometer_init(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  double result;

  *(_QWORD *)a1 = a2;
  *(_QWORD *)(a1 + 8) = a3;
  *(_QWORD *)(a1 + 16) = a4;
  *(_DWORD *)(a1 + 24) = -1;
  result = 0.0;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_QWORD *)(a1 + 144) = 0;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_OWORD *)(a1 + 168) = 0u;
  *(_OWORD *)(a1 + 184) = 0u;
  *(_OWORD *)(a1 + 200) = 0u;
  *(_OWORD *)(a1 + 216) = 0u;
  *(_QWORD *)(a1 + 232) = 0;
  *(_QWORD *)(a1 + 320) = 0;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_OWORD *)(a1 + 304) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_BYTE *)(a1 + 440) = 0;
  *(_BYTE *)(a1 + 442) = 0;
  *(_OWORD *)(a1 + 448) = 0u;
  *(_OWORD *)(a1 + 464) = 0u;
  *(_OWORD *)(a1 + 480) = 0u;
  *(_OWORD *)(a1 + 496) = 0u;
  *(_OWORD *)(a1 + 512) = 0u;
  *(_QWORD *)(a1 + 528) = 0;
  *(_OWORD *)(a1 + 328) = 0u;
  *(_OWORD *)(a1 + 344) = 0u;
  *(_OWORD *)(a1 + 360) = 0u;
  *(_OWORD *)(a1 + 376) = 0u;
  *(_OWORD *)(a1 + 392) = 0u;
  *(_OWORD *)(a1 + 408) = 0u;
  *(_OWORD *)(a1 + 424) = 0u;
  *(_OWORD *)(a1 + 616) = 0u;
  *(_OWORD *)(a1 + 632) = 0u;
  *(_OWORD *)(a1 + 584) = 0u;
  *(_OWORD *)(a1 + 600) = 0u;
  *(_OWORD *)(a1 + 552) = 0u;
  *(_OWORD *)(a1 + 568) = 0u;
  *(_OWORD *)(a1 + 536) = 0u;
  *(_OWORD *)(a1 + 840) = 0u;
  *(_OWORD *)(a1 + 856) = 0u;
  *(_OWORD *)(a1 + 808) = 0u;
  *(_OWORD *)(a1 + 824) = 0u;
  *(_OWORD *)(a1 + 776) = 0u;
  *(_OWORD *)(a1 + 792) = 0u;
  *(_OWORD *)(a1 + 760) = 0u;
  *(_DWORD *)(a1 + 872) = -1;
  *(_WORD *)(a1 + 972) = 0;
  *(_DWORD *)(a1 + 968) = 0;
  return result;
}

uint64_t odometer_prepare(uint64_t *a1, uint64_t a2, uint64_t constraint, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 *v14;
  uint64_t property_BOOL;
  uint64_t v18;
  uint64_t name;
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

  v9 = 0;
  v10 = a1 + 122;
  while (1)
  {
    v11 = (uint64_t *)_cylinders[v9];
    v12 = v11[1];
    if (v12 < 0)
      goto LABEL_20;
    v13 = *v11;
    v14 = (unsigned __int8 *)a1 + v12;
    constraint = chip_get_constraint(a1[2], *v11, 0);
    a2 = a1[2];
    if (v14)
    {
      if (v14 >= (unsigned __int8 *)v10 || v14 < (unsigned __int8 *)a1)
      {
LABEL_19:
        __break(0x5519u);
LABEL_20:
        __panic_npx("panic: invalid offset: %lld", a2, constraint, a4, a5, a6, a7, a8, v12);
      }
    }
    property_BOOL = expert_query_property_BOOL(*a1, a2, constraint, v14);
    if ((_DWORD)property_BOOL)
      break;
    if (v14 >= (unsigned __int8 *)v10 || v14 < (unsigned __int8 *)a1)
      goto LABEL_19;
    expert_log(*a1, 2uLL, (uint64_t)"queried cylinder: p = %s, v = 0x%x", a4, a5, a6, a7, a8, v13 + 28);
    if (++v9 == 6)
      return property_BOOL;
  }
  v18 = *a1;
  name = chip_get_name(a1[2]);
  expert_log(v18, 0, (uint64_t)"odometer[%s]: failed to query odometer cylinder: %s: %d", v20, v21, v22, v23, v24, name);
  if (property_BOOL >= 0x6A)
    __panic_npx("panic: error not set to valid posix code: %d", v25, v26, v27, v28, v29, v30, v31, property_BOOL);
  return property_BOOL;
}

double odometer_prepare_nonce(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  double result;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v10 = 0uLL;
  v11 = 0;
  nonce_init_copy(&v10, a2, a3, a4, a5, a6, a7, a8);
  result = *(double *)&v10;
  *(_OWORD *)(a1 + 32) = v10;
  *(_QWORD *)(a1 + 48) = v11;
  *(_WORD *)(a1 + 56) = 1;
  return result;
}

__n128 odometer_prepare_nonce_hash(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)(a1 + 152) = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 200) = v4;
  *(_OWORD *)(a1 + 184) = v3;
  *(__n128 *)(a1 + 168) = result;
  *(_WORD *)(a1 + 232) = 1;
  return result;
}

uint64_t odometer_prepare_mix_n_match_god_mode(uint64_t result)
{
  *(_BYTE *)(result + 441) = 1;
  return result;
}

uint64_t odometer_prepare_sideload_mixn_match(uint64_t result)
{
  *(_BYTE *)(result + 442) = 1;
  return result;
}

__n128 odometer_prepare_notarized_manifest_hash(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)(a1 + 448) = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 496) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 512) = v4;
  *(__n128 *)(a1 + 464) = result;
  *(_OWORD *)(a1 + 480) = v3;
  *(_WORD *)(a1 + 528) = 1;
  return result;
}

uint64_t odometer_prepare_mixn_match(uint64_t result, char a2)
{
  *(_BYTE *)(result + 968) = a2;
  return result;
}

uint64_t odometer_update(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t *v16;
  char v18;

  v10 = result;
  for (i = 0; i != 80; i += 8)
  {
    v12 = *(uint64_t *)((char *)&_property_consumers + i);
    v13 = *(_QWORD *)v12;
    v14 = *(_QWORD *)(v12 + 8);
    if (*(_QWORD *)v12)
    {
      if ((v14 & 0x8000000000000000) == 0)
        __panic_npx("panic: illegal odometer consumption configuration", v13, a3, a4, a5, a6, a7, a8, v18);
    }
    else if (v14 < 0)
    {
      v13 = 0;
    }
    else
    {
      v15 = *(_QWORD *)(v10 + 16);
      v16 = (uint64_t *)(v15 + v14);
      if ((unint64_t)v16 >= v15 + 264 || (unint64_t)v16 < v15)
      {
        __break(0x5519u);
        return result;
      }
      v13 = *v16;
    }
    result = property_equal(a2, v13);
    if ((result & 1) != 0 || !*(_QWORD *)v12 && (*(_QWORD *)(v12 + 8) & 0x8000000000000000) != 0)
    {
      result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 16))(v12, v10, a2, a3);
      if (!(_DWORD)result)
        return result;
    }
  }
  return 1;
}

uint64_t odometer_enforce(unint64_t a1)
{
  int chip_boot;
  uint64_t v3;
  uint64_t name;
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
  uint64_t v26;
  uint64_t v27;
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
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;

  chip_boot = odometer_query_chip_boot(a1);
  v3 = *(_QWORD *)a1;
  name = chip_get_name(*(_QWORD *)(a1 + 16));
  if (chip_boot)
  {
    expert_log(v3, 1uLL, (uint64_t)"odometer[%s]: expert does not boot chip", v5, v6, v7, v8, v9, name);
  }
  else
  {
    expert_log(v3, 1uLL, (uint64_t)"odometer[%s]: enforcing anti-replay", v5, v6, v7, v8, v9, name);
    __odometer_select_policy(a1, (unint64_t)_anti_replay_policies, 7, v38, v39, v40, v41, v42);
    v50 = odometer_policy_enforce(v43, a1, v44, v45, v46, v47, v48, v49);
    if ((_DWORD)v50)
    {
      v23 = v50;
      v51 = *(_QWORD *)a1;
      v52 = chip_get_name(*(_QWORD *)(a1 + 16));
      expert_log(v51, 0, (uint64_t)"odometer[%s:%s]: anti-replay violation: %d", v53, v54, v55, v56, v57, v52);
      goto LABEL_8;
    }
  }
  __odometer_select_policy(a1, (unint64_t)_chain_integrity_policies, 5, v10, v11, v12, v13, v14);
  v22 = odometer_policy_enforce(v15, a1, v16, v17, v18, v19, v20, v21);
  if ((_DWORD)v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)a1;
    v25 = chip_get_name(*(_QWORD *)(a1 + 16));
    expert_log(v24, 0, (uint64_t)"odometer[%s:%s]: boot chain integrity violation: %d", v26, v27, v28, v29, v30, v25);
  }
  else
  {
    if (odometer_policy_enforceable((uint64_t)&_odometer_policy_chain_manifest)
      || (v72 = odometer_policy_enforce((uint64_t)&_odometer_policy_chain_manifest, a1, v58, v59, v60, v61, v62, v63),
          !(_DWORD)v72))
    {
      v64 = *(_QWORD *)a1;
      v65 = chip_get_name(*(_QWORD *)(a1 + 16));
      expert_log(v64, 1uLL, (uint64_t)"odometer[%s]: manifest is live and boot chain is intact", v66, v67, v68, v69, v70, v65);
      return 0;
    }
    v23 = v72;
    v73 = *(_QWORD *)a1;
    v79 = chip_get_name(*(_QWORD *)(a1 + 16));
    expert_log(v73, 0, (uint64_t)"odometer[%s:%s]: boot chain integrity violation: %d", v74, v75, v76, v77, v78, v79);
  }
LABEL_8:
  if ((_DWORD)v23 == 31 && *(_BYTE *)(a1 + 441))
    return 70;
  if (v23 >= 0x6A)
    __panic_npx("panic: error not set to valid posix code: %d", v31, v32, v33, v34, v35, v36, v37, v23);
  return v23;
}

void __odometer_select_policy(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  if (!a3)
    goto LABEL_7;
  v8 = a3;
  v10 = a2 + 8 * a3;
  v11 = (uint64_t *)a2;
  while (1)
  {
    if ((unint64_t)v11 >= v10 || (unint64_t)v11 < a2)
    {
      __break(0x5519u);
      return;
    }
    v12 = *v11;
    if (!odometer_policy_enforceable(*v11))
      break;
    ++v11;
    if (!--v8)
      goto LABEL_7;
  }
  if (!v12)
LABEL_7:
    __panic_npx("panic: no anti-replay policy selected", a2, a3, a4, a5, a6, a7, a8, v13);
}

__n128 _odometer_consume_nonce_hash(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t name;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __n128 result;
  __int128 v19;
  int v20[2];
  _DWORD __n[5];
  __n128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = *(unsigned int *)(a3 + 24);
  memset(__n, 0, sizeof(__n));
  *(_QWORD *)v20 = 0;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  if (Img4DecodeGetPropertyData(a4, v5, v20, __n))
  {
    v11 = *(_QWORD *)a2;
    name = chip_get_name(*(_QWORD *)(a2 + 16));
    expert_log(v11, 0, (uint64_t)"odometer[%s]: Img4DecodeGetPropertyData: %d", v13, v14, v15, v16, v17, name);
  }
  else
  {
    digest_init((uint64_t)&__n[1], *(const void **)v20, __n[0], v6, v7, v8, v9, v10);
    v19 = v24;
    *(_OWORD *)(a2 + 96) = v23;
    *(_OWORD *)(a2 + 112) = v19;
    *(_OWORD *)(a2 + 128) = v25;
    result = v22;
    *(_OWORD *)(a2 + 64) = *(_OWORD *)&__n[1];
    *(__n128 *)(a2 + 80) = result;
    *(_WORD *)(a2 + 144) = 1;
  }
  return result;
}

uint64_t _odometer_consume_nonce_domain(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t name;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;

  v5 = *(unsigned int *)(a3 + 24);
  v14 = 0;
  result = Img4DecodeGetPropertyInteger(a4, v5, &v14);
  if ((_DWORD)result)
  {
    v7 = *(_QWORD *)a2;
    name = chip_get_name(*(_QWORD *)(a2 + 16));
    expert_log(v7, 0, (uint64_t)"odometer[%s]: Img4DecodeGetPropertyInteger: %d", v9, v10, v11, v12, v13, name);
    return 0xFFFFFFFFLL;
  }
  else
  {
    *(_DWORD *)(a2 + 24) = v14;
  }
  return result;
}

uint64_t _odometer_consume_ephemeral_switch(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;

  result = _odometer_decode_property((uint64_t *)a2, a3, a4, (BOOL *)(a2 + 760), a5, a6, a7, a8);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  *(_WORD *)(a2 + 864) = 1;
  return result;
}

uint64_t _odometer_decode_property(uint64_t *a1, uint64_t a2, uint64_t *a3, BOOL *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t PropertyBoolean;
  uint64_t v13;
  uint64_t name;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
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
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48[2];
  size_t __n;

  v9 = *(unsigned int *)(a2 + 24);
  LODWORD(__n) = 0;
  *(_QWORD *)v48 = 0;
  switch(**(_QWORD **)(a2 + 40))
  {
    case 0:
      PropertyBoolean = Img4DecodeGetPropertyBoolean((uint64_t)a3, v9, a4);
      if ((_DWORD)PropertyBoolean)
      {
        v13 = *a1;
        name = chip_get_name(a1[2]);
        expert_log(v13, 0, (uint64_t)"odometer[%s]: Img4DecodeGetPropertyBoolean: %d", v15, v16, v17, v18, v19, name);
      }
      return PropertyBoolean;
    case 1:
      PropertyBoolean = Img4DecodeGetPropertyInteger((uint64_t)a3, v9, a4);
      if ((_DWORD)PropertyBoolean)
      {
        v21 = *a1;
        v46 = chip_get_name(a1[2]);
        expert_log(v21, 0, (uint64_t)"odometer[%s]: Img4DecodeGetPropertyInteger: %d", v22, v23, v24, v25, v26, v46);
      }
      return PropertyBoolean;
    case 2:
      PropertyBoolean = Img4DecodeGetPropertyInteger64((uint64_t)a3, v9, (unint64_t *)a4);
      if ((_DWORD)PropertyBoolean)
      {
        v27 = *a1;
        v47 = chip_get_name(a1[2]);
        expert_log(v27, 0, (uint64_t)"odometer[%s]: Img4DecodeGetPropertyInteger64: %d", v28, v29, v30, v31, v32, v47);
      }
      return PropertyBoolean;
    case 3:
      result = Img4DecodeGetPropertyData(a3, v9, v48, &__n);
      if ((_DWORD)result)
        goto LABEL_14;
      if (a4 && a4 + 80 < a4)
        goto LABEL_21;
      digest_init((uint64_t)a4, *(const void **)v48, __n, v33, v34, v35, v36, v37);
      return 0;
    case 4:
      result = Img4DecodeGetPropertyData(a3, v9, v48, &__n);
      if ((_DWORD)result)
      {
LABEL_14:
        v38 = result;
        v39 = *a1;
        v40 = chip_get_name(a1[2]);
        expert_log(v39, 0, (uint64_t)"odometer[%s]: Img4DecodeGetPropertyData: %d", v41, v42, v43, v44, v45, v40);
        return v38;
      }
      if (!a4 || a4 + 104 >= a4)
      {
        version_init((uint64_t)a4, *(char **)v48, __n);
        return 0;
      }
LABEL_21:
      __break(0x5519u);
      return result;
    default:
      __panic_npx("panic: unreachable case: %s = 0x%llx", v9, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, (char)"p->p_type->pt_switchable");
  }
}

uint64_t _odometer_consume_ephemeral_nonce_domain(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t name;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;

  v5 = *(unsigned int *)(a3 + 24);
  v14 = 0;
  result = Img4DecodeGetPropertyInteger(a4, v5, &v14);
  if ((_DWORD)result)
  {
    v7 = *(_QWORD *)a2;
    name = chip_get_name(*(_QWORD *)(a2 + 16));
    expert_log(v7, 0, (uint64_t)"odometer[%s]: Img4DecodeGetPropertyInteger: %d", v9, v10, v11, v12, v13, name);
    return 0xFFFFFFFFLL;
  }
  else
  {
    *(_DWORD *)(a2 + 872) = v14;
  }
  return result;
}

__n128 _odometer_consume_ephemeral_nonce_hash(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t name;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __n128 result;
  __int128 v19;
  int v20[2];
  _DWORD __n[5];
  __n128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = *(unsigned int *)(a3 + 24);
  memset(__n, 0, sizeof(__n));
  *(_QWORD *)v20 = 0;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  if (Img4DecodeGetPropertyData(a4, v5, v20, __n))
  {
    v11 = *(_QWORD *)a2;
    name = chip_get_name(*(_QWORD *)(a2 + 16));
    expert_log(v11, 0, (uint64_t)"odometer[%s]: Img4DecodeGetPropertyData: %d", v13, v14, v15, v16, v17, name);
  }
  else
  {
    digest_init((uint64_t)&__n[1], *(const void **)v20, __n[0], v6, v7, v8, v9, v10);
    v19 = v24;
    *(_OWORD *)(a2 + 912) = v23;
    *(_OWORD *)(a2 + 928) = v19;
    *(_OWORD *)(a2 + 944) = v25;
    result = v22;
    *(_OWORD *)(a2 + 880) = *(_OWORD *)&__n[1];
    *(__n128 *)(a2 + 896) = result;
    *(_WORD *)(a2 + 960) = 1;
  }
  return result;
}

uint64_t _odometer_consume_chain_hash(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t name;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  int v19[2];
  size_t __n;

  v5 = *(unsigned int *)(a3 + 24);
  LODWORD(__n) = 0;
  *(_QWORD *)v19 = 0;
  if (Img4DecodeGetPropertyData(a4, v5, v19, &__n))
  {
    v11 = *(_QWORD *)a2;
    name = chip_get_name(*(_QWORD *)(a2 + 16));
    expert_log(v11, 0, (uint64_t)"odometer[%s]: Img4DecodeGetPropertyData: %d", v13, v14, v15, v16, v17, name);
    return 0xFFFFFFFFLL;
  }
  else
  {
    digest_init(a2 + 240, *(const void **)v19, __n, v6, v7, v8, v9, v10);
    result = 0;
    *(_WORD *)(a2 + 320) = 1;
  }
  return result;
}

uint64_t _odometer_consume_mixn_match(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t name;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;

  v5 = *(unsigned int *)(a3 + 24);
  v14 = 0;
  result = Img4DecodeGetPropertyBoolean(a4, v5, &v14);
  if ((_DWORD)result)
  {
    v7 = *(_QWORD *)a2;
    name = chip_get_name(*(_QWORD *)(a2 + 16));
    expert_log(v7, 0, (uint64_t)"odometer[%s]: Img4DecodeGetPropertyBoolean: %d", v9, v10, v11, v12, v13, name);
    return 0xFFFFFFFFLL;
  }
  else
  {
    *(_BYTE *)(a2 + 440) = v14;
  }
  return result;
}

uint64_t _odometer_consume_pivot(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;

  result = _odometer_decode_property((uint64_t *)a2, a3, a4, (BOOL *)(a2 + 328), a5, a6, a7, a8);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  *(_WORD *)(a2 + 432) = 1;
  return result;
}

uint64_t _odometer_consume_static_lifetime(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7;
  uint64_t v8;
  char i;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;

  v7 = 0;
  v8 = a2[2] + 232;
  for (i = 1; ; i = 0)
  {
    v10 = i;
    if (property_equal(a3, *(_QWORD *)(v8 + 8 * v7)))
      break;
    v7 = 1;
    if ((v10 & 1) == 0)
      return 0xFFFFFFFFLL;
  }
  result = _odometer_decode_property(a2, a3, a4, (BOOL *)&a2[14 * v7 + 67], v11, v12, v13, v14);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  LOWORD(a2[14 * v7 + 80]) = 1;
  return result;
}

uint64_t DEREncoderAddImage4Tag(uint64_t *a1, char *__s)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (strlen(__s) != 4)
    __panic_npx("panic: invalid Image4 tag: %s", v4, v5, v6, v7, v8, v9, v10, (char)__s);
  return DEREncoderAddData(a1, 0, 0x16u, __s, 4u, 0);
}

uint64_t DEREncoderAddUInt(uint64_t *a1, unint64_t a2)
{
  return DEREncoderAddUInt64(a1, 0, 2u, a2);
}

uint64_t DEREncoderAddString(uint64_t *a1, char *__s)
{
  unsigned int v4;

  v4 = strlen(__s);
  return DEREncoderAddData(a1, 0, 0x16u, __s, v4, 0);
}

uint64_t DEREncoderAddOctetString(uint64_t *a1, const void *a2, unsigned int a3)
{
  return DEREncoderAddDataNoCopy(a1, 0, 4u, a2, a3, 0);
}

uint64_t DEREncoderAddSequence(uint64_t *a1, const void *a2, unsigned int a3)
{
  return DEREncoderAddData(a1, 0, 0x10u, a2, a3, 1);
}

uint64_t DEREncoderAddContextual(uint64_t *a1, unsigned int a2, const void *a3, unsigned int a4)
{
  return DEREncoderAddData(a1, 2u, a2, a3, a4, 1);
}

uint64_t DEREncoderAddNull(uint64_t *a1)
{
  return DEREncoderAddData(a1, 0, 5u, 0, 0, 0);
}

uint64_t DEREncoderAddImage4Property(uint64_t *a1, char *__s, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t *v14;
  uint64_t *v15;
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
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t PropertyBoolean;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t PropertyData;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t PropertyInteger64;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char v99;
  const void *v100;
  unsigned int v101;
  unint64_t v102;
  BOOL v103;

  v103 = 0;
  v102 = 0;
  v101 = 0;
  v100 = 0;
  if (strlen(__s) != 4)
LABEL_31:
    __panic_npx("panic: four-character codes must be four characters long", v6, v7, v8, v9, v10, v11, v12, v99);
  if (__s + 5 < __s)
  {
LABEL_30:
    __break(0x5519u);
    goto LABEL_31;
  }
  v13 = *(_DWORD *)__s;
  v14 = (uint64_t *)DEREncoderCreate(0);
  if (v14)
  {
    v15 = v14;
    v16 = DEREncoderAddImage4Tag(v14, __s);
    if ((_DWORD)v16)
    {
      v24 = v16;
      v25 = log_expert(v16);
      expert_log(v25, 2uLL, (uint64_t)"DEREncoderAddImage4TagUInt32: %d", v26, v27, v28, v29, v30, v24);
LABEL_28:
      DEREncoderDestroy((_QWORD **)v15);
      return v24;
    }
    v37 = bswap32(v13);
    switch(a3[2])
    {
      case 1:
        PropertyBoolean = Img4DecodeGetPropertyBoolean((uint64_t)a3, v37, &v103);
        if ((_DWORD)PropertyBoolean)
        {
          v39 = PropertyBoolean;
          v40 = log_expert(PropertyBoolean);
          expert_log(v40, 2uLL, (uint64_t)"Img4DecodeGetPropertyBoolean: %d", v41, v42, v43, v44, v45, v39);
          goto LABEL_16;
        }
        v70 = DEREncoderAddBoolean(v15, v103);
        if (!(_DWORD)v70)
          goto LABEL_26;
        v55 = v70;
        v71 = log_expert(v70);
        expert_log(v71, 2uLL, (uint64_t)"DEREncoderAddBoolean: %d", v72, v73, v74, v75, v76, v55);
        goto LABEL_25;
      case 2:
        PropertyInteger64 = Img4DecodeGetPropertyInteger64((uint64_t)a3, v37, &v102);
        if ((_DWORD)PropertyInteger64)
        {
          v63 = PropertyInteger64;
          v64 = log_expert(PropertyInteger64);
          expert_log(v64, 2uLL, (uint64_t)"Img4DecodeGetPropertyInteger64: %d", v65, v66, v67, v68, v69, v63);
          goto LABEL_16;
        }
        v84 = DEREncoderAddUInt64(v15, 0, 2u, v102);
        if (!(_DWORD)v84)
          goto LABEL_26;
        v55 = v84;
        v85 = log_expert(v84);
        expert_log(v85, 2uLL, (uint64_t)"DEREncoderAddUInt64: %d", v86, v87, v88, v89, v90, v55);
        goto LABEL_25;
      case 4:
        PropertyData = Img4DecodeGetPropertyData(a3, v37, &v100, &v101);
        if ((_DWORD)PropertyData)
        {
          v47 = PropertyData;
          v48 = log_expert(PropertyData);
          expert_log(v48, 2uLL, (uint64_t)"Img4DecodeGetPropertyData: %d", v49, v50, v51, v52, v53, v47);
LABEL_16:
          v24 = 3;
          goto LABEL_28;
        }
        v8 = (uint64_t)v100;
        v9 = v101;
        if (!v100 || v101)
        {
          v77 = DEREncoderAddDataNoCopy(v15, 0, 4u, v100, v101, 0);
          if ((_DWORD)v77)
          {
            v55 = v77;
            v78 = log_expert(v77);
            expert_log(v78, 2uLL, (uint64_t)"DEREncoderAddOctetString: %d", v79, v80, v81, v82, v83, v55);
LABEL_25:
            v24 = v55;
          }
          else
          {
LABEL_26:
            v91 = DEREncoderAddPrivateFromEncoder((uint64_t **)v15, a1, v37);
            v24 = v91;
            if ((_DWORD)v91)
            {
              v92 = log_expert(v91);
              expert_log(v92, 2uLL, (uint64_t)"DEREncoderAddPrivateFromEncoder: %d", v93, v94, v95, v96, v97, v24);
            }
          }
          goto LABEL_28;
        }
        break;
      case 5:
        v54 = DEREncoderAddData(v15, 0, 5u, 0, 0, 0);
        if (!(_DWORD)v54)
          goto LABEL_26;
        v55 = v54;
        v56 = log_expert(v54);
        expert_log(v56, 2uLL, (uint64_t)"DEREncoderAddNull: %d", v57, v58, v59, v60, v61, v55);
        goto LABEL_25;
      default:
        __panic_npx("panic: unreachable", v17, v18, v19, v20, v21, v22, v23, v99);
    }
    goto LABEL_30;
  }
  v31 = log_expert(0);
  v24 = 2;
  expert_log(v31, 2uLL, (uint64_t)"DEREncoderCreate: %d", v32, v33, v34, v35, v36, 2);
  return v24;
}

void DEREncoderDestroyAndZero(_QWORD ***a1)
{
  _QWORD **v2;

  v2 = *a1;
  if (v2)
  {
    DEREncoderDestroy(v2);
    *a1 = 0;
  }
}

size_t DEREncoderEncodeImage4Dictionary(uint64_t *a1, char *__s, uint64_t **a3)
{
  size_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  result = strlen(__s);
  if (result != 4)
    __panic_npx("panic: four-character codes must be four characters long", v7, v8, v9, v10, v11, v12, v13, v18);
  if (__s + 5 < __s)
  {
    __break(0x5519u);
  }
  else
  {
    v14 = *(_DWORD *)__s;
    v15 = (uint64_t *)DEREncoderCreate(0);
    if (!v15)
      return 2;
    v16 = v15;
    v17 = DEREncoderAddImage4Tag(v15, __s);
    if (!(_DWORD)v17)
    {
      v17 = DEREncoderAddSetFromEncoder(a3, v16);
      if (!(_DWORD)v17)
        v17 = DEREncoderAddPrivateFromEncoder((uint64_t **)v16, a1, bswap32(v14));
    }
    DEREncoderDestroy((_QWORD **)v16);
    return v17;
  }
  return result;
}

uint64_t DEREncoderCreateImage4Dictionary(char *a1, uint64_t **a2, uint64_t **a3)
{
  uint64_t *v6;
  uint64_t *v7;
  size_t v8;

  v6 = (uint64_t *)DEREncoderCreate(0);
  if (!v6)
    return 2;
  v7 = v6;
  v8 = DEREncoderEncodeImage4Dictionary(v6, a1, a2);
  if ((_DWORD)v8)
    DEREncoderDestroy((_QWORD **)v7);
  else
    *a3 = v7;
  return v8;
}

size_t cstring_init_with_string(uint64_t a1, char *__s)
{
  size_t result;
  size_t v5;
  size_t v6;
  uint64_t v7;

  result = strlen(__s);
  if (&__s[result + 1] < __s)
  {
    __break(0x5519u);
  }
  else
  {
    v5 = strnlen(__s, result + 1);
    v6 = v5;
    if (v5 >= 0x3F)
      v7 = 63;
    else
      v7 = v5;
    strlcpy((char *)a1, __s, v7 + 1);
    *(_QWORD *)(a1 + 64) = v7;
    *(_QWORD *)(a1 + 72) = v6;
    return a1;
  }
  return result;
}

uint64_t cstring_init_with_buff(uint64_t a1, char *__s1, size_t __n)
{
  size_t v5;
  size_t v6;
  uint64_t v7;

  v5 = strnlen(__s1, __n);
  v6 = v5;
  if (v5 >= 0x3F)
    v7 = 63;
  else
    v7 = v5;
  strlcpy((char *)a1, __s1, v7 + 1);
  *(_QWORD *)(a1 + 64) = v7;
  *(_QWORD *)(a1 + 72) = v6;
  return a1;
}

unint64_t _boot_static_enforceable(uint64_t a1, uint64_t *a2)
{
  unint64_t result;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t name;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  result = a2[2];
  if (!*(_QWORD *)(result + 232))
  {
    v3 = 1;
    v4 = "odometer[%s:%s]: chip has no properties for policy";
    goto LABEL_5;
  }
  if (!*(_QWORD *)(result + 160))
  {
    v3 = 0;
    v4 = "odometer[%s:%s]: policy is enforceable";
LABEL_5:
    v5 = *a2;
    name = chip_get_name(result);
    expert_log(v5, 1uLL, (uint64_t)v4, v7, v8, v9, v10, v11, name);
    return v3;
  }
  if (result < result + 264)
  {
    v12 = chip_get_name(result);
    __panic_npx("panic: illegal chip definition: anti-replay and static lifetime policies defined: %s", v13, v14, v15, v16, v17, v18, v19, v12);
  }
  __break(0x5519u);
  return result;
}

uint64_t _boot_static_enforce(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t name;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v10 = a2[2];
  if ((odometer_check_fuse((unint64_t)a2, (uint64_t)&_odometer_cylinder_internal_use, a3, a4, a5, a6, a7, a8) & 1) != 0)
  {
    v15 = "odometer[%s:%s]: internal use-only unit entitlement found";
LABEL_13:
    v25 = *a2;
    name = chip_get_name(a2[2]);
    expert_log(v25, 1uLL, (uint64_t)v15, v27, v28, v29, v30, v31, name);
    return 0;
  }
  else
  {
    v16 = 0;
    v17 = v10 + 232;
    v18 = 1;
    v15 = "odometer[%s:%s]: manifest is current";
    while (1)
    {
      v19 = *(_QWORD *)(v17 + 8 * v16);
      v20 = v18;
      v21 = (uint64_t)&a2[14 * v16 + 67];
      v22 = !v19 || *(_WORD *)(v21 + 104) == 0;
      if (!v22 && v21 != 0)
      {
        v24 = odometer_enforce_property(a2, a1, v19, (unsigned __int8 *)v21, v11, v12, v13, v14);
        if ((_DWORD)v24)
          break;
      }
      v18 = 0;
      v16 = 1;
      if ((v20 & 1) == 0)
        goto LABEL_13;
    }
    v32 = v24;
    v34 = *a2;
    v35 = chip_get_name(a2[2]);
    expert_log(v34, 0, (uint64_t)"odometer[%s:%s]: anti-replay violation: %d", v36, v37, v38, v39, v40, v35);
    if (v32 >= 0x6A)
      __panic_npx("panic: error not set to valid posix code: %d", v41, v42, v43, v44, v45, v46, v47, v32);
  }
  return v32;
}

uint64_t _boot_live_enforceable(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t name;
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

  if (odometer_policy_get_chip_property(a1, *(_QWORD *)(a2 + 16)))
  {
    v3 = *(unsigned __int16 *)(a2 + 144);
    v4 = *(_QWORD *)a2;
    name = chip_get_name(*(_QWORD *)(a2 + 16));
    if (v3)
    {
      expert_log(v4, 1uLL, (uint64_t)"odometer[%s:%s]: policy is enforceable", v6, v7, v8, v9, v10, name);
      return 0;
    }
    else
    {
      v11 = 1;
      expert_log(v4, 1uLL, (uint64_t)"odometer[%s:%s]: manifest has no constraint for policy", v6, v7, v8, v9, v10, name);
    }
  }
  else
  {
    v12 = *(_QWORD *)a2;
    v13 = chip_get_name(*(_QWORD *)(a2 + 16));
    v11 = 1;
    expert_log(v12, 1uLL, (uint64_t)"odometer[%s:%s]: chip has no property for policy", v14, v15, v16, v17, v18, v13);
  }
  return v11;
}

uint64_t _boot_live_enforce(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t chip_property;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t live_nonce;
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
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t result;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t name;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char v86;
  char v87;
  size_t __n;
  _OWORD v89[5];
  _QWORD v90[3];
  _QWORD v91[4];

  v91[3] = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)a2;
  chip_property = odometer_policy_get_chip_property(a1, *(_QWORD *)(a2 + 16));
  if (!*(_WORD *)(a2 + 144))
    __panic_npx("panic: optional not set", v6, v7, v8, v9, v10, v11, v12, v86);
  v13 = chip_property;
  v14 = *(_QWORD **)(a2 + 16);
  v15 = *(unsigned int *)(a2 + 24);
  memset(v91, 0, 24);
  memset(v90, 0, sizeof(v90));
  memset(v89, 0, sizeof(v89));
  __n = 64;
  live_nonce = odometer_query_live_nonce(a2, a1, v15, v91, v9, v10, v11, v12);
  if ((_DWORD)live_nonce != 6)
  {
    v17 = live_nonce;
    if ((_DWORD)live_nonce)
    {
      v61 = *(_QWORD *)a2;
      name = chip_get_name(*(_QWORD *)(a2 + 16));
      expert_log(v61, 0, (uint64_t)"odometer[%s:%s]: failed to query nonce: %d", v63, v64, v65, v66, v67, name);
      goto LABEL_16;
    }
    v18 = expert_entangle_nonce(v4, (uint64_t)v14, v15, (uint64_t)v91, (uint64_t)v90);
    if ((_DWORD)v18)
    {
      v17 = v18;
      v19 = *(_QWORD *)a2;
      v20 = chip_get_name(*(_QWORD *)(a2 + 16));
      expert_log(v19, 0, (uint64_t)"odometer[%s:%s]: failed to entangle nonce: %d", v21, v22, v23, v24, v25, v20);
      goto LABEL_16;
    }
    odometer_compute_nonce_hash(v4, v14, (uint64_t)v90, (uint64_t)v89);
LABEL_14:
    if (!property_constrain_digest(v13, v4, a2 + 64, (unint64_t)v89, v68, v69, v70, v71))
    {
      v79 = *(_QWORD *)a2;
      v80 = chip_get_name(*(_QWORD *)(a2 + 16));
      expert_log(v79, 1uLL, (uint64_t)"odometer[%s:%s]: manifest is current", v81, v82, v83, v84, v85, v80);
      return 0;
    }
    v17 = *(unsigned int *)(a1 + 24);
    v72 = *(_QWORD *)a2;
    v73 = chip_get_name(*(_QWORD *)(a2 + 16));
    expert_log(v72, 0, (uint64_t)"odometer[%s:%s]: anti-replay violation: %d", v74, v75, v76, v77, v78, v73);
LABEL_16:
    if (v17 >= 0x6A)
      __panic_npx("panic: error not set to valid posix code: %d", v26, v27, v28, v29, v30, v31, v32, v17);
    return v17;
  }
  v33 = *(_QWORD *)a2;
  v34 = chip_get_name(*(_QWORD *)(a2 + 16));
  expert_log(v33, 1uLL, (uint64_t)"odometer[%s:%s]: nonce is bootstrapping; using boot nonce hash",
    v35,
    v36,
    v37,
    v38,
    v39,
    v34);
  v47 = v14[21];
  if (!v47)
    __panic_npx("panic: illegal chip/expert configuration", v40, v41, v42, v43, v44, v45, v46, v87);
  result = expert_read_boot_manifest(v4, v47 + 28, (uint64_t)v89 + 8, (uint64_t)&__n);
  if ((_DWORD)result)
  {
    v17 = result;
    v54 = *(_QWORD *)a2;
    v55 = chip_get_name(*(_QWORD *)(a2 + 16));
    expert_log(v54, 0, (uint64_t)"odometer[%s:%s]: failed to query boot nonce hash: %d", v56, v57, v58, v59, v60, v55);
    goto LABEL_16;
  }
  if (__n <= 0x40)
  {
    digest_init((uint64_t)v89, (char *)v89 + 8, __n, v49, v50, v51, v52, v53);
    goto LABEL_14;
  }
  __break(0x5519u);
  return result;
}

uint64_t image4_environment_copy_nonce_digest(uint64_t a1, void *a2, size_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int *v13;
  int nonce_domain;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  size_t v24;
  size_t __n;
  _OWORD __src[4];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = *(_QWORD *)(a1 + 8);
  memset(__src, 0, sizeof(__src));
  __n = 64;
  v7 = image4_environment_resolve(a1);
  if (v7)
  {
    v13 = (int *)v7;
    nonce_domain = image4_environment_get_nonce_domain(a1);
    v15 = darwin_syscall_nonce_copy_hash(v6, v13, nonce_domain, __src, &__n);
    if ((_DWORD)v15)
    {
      v23 = v15;
      if (v15 >= 0x6A)
        __panic_npx_2(v15, v16, v17, v18, v19, v20, v21, v22, v15);
    }
    else
    {
      v24 = __n;
      if (__n <= 0x40)
      {
        memcpy(a2, __src, __n);
        v23 = 0;
        *a3 = v24;
      }
      else
      {
        return 84;
      }
    }
  }
  else
  {
    v23 = 45;
    expert_log(v6, 0, (uint64_t)"failed to resolve chip environment: %d", v8, v9, v10, v11, v12, 45);
  }
  return v23;
}

uint64_t image4_environment_roll_nonce(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  int nonce_domain;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = image4_environment_resolve(a1);
  if (v3)
  {
    v9 = (int *)v3;
    nonce_domain = image4_environment_get_nonce_domain(a1);
    v11 = darwin_syscall_nonce_roll(v2, v9, nonce_domain);
    v19 = v11;
    if (v11 >= 0x6A)
      __panic_npx_2(v11, v12, v13, v14, v15, v16, v17, v18, v11);
  }
  else
  {
    v19 = 45;
    expert_log(v2, 0, (uint64_t)"failed to resolve chip environment: %d", v4, v5, v6, v7, v8, 45);
  }
  return v19;
}

uint64_t image4_environment_generate_nonce_proposal(uint64_t a1, void *a2, size_t *a3, char *a4, unint64_t *a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _DWORD *v17;
  int nonce_domain;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  size_t v28;
  size_t __n;
  _OWORD __src[4];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v10 = *(_QWORD *)(a1 + 8);
  memset(__src, 0, sizeof(__src));
  __n = 64;
  v11 = image4_environment_resolve(a1);
  if (v11)
  {
    v17 = (_DWORD *)v11;
    nonce_domain = image4_environment_get_nonce_domain(a1);
    v19 = darwin_syscall_nonce_generate_proposal(v10, v17, nonce_domain, __src, &__n, a4, a5);
    if ((_DWORD)v19)
    {
      v27 = v19;
      if (v19 >= 0x6A)
        __panic_npx_2(v19, v20, v21, v22, v23, v24, v25, v26, v19);
    }
    else
    {
      v28 = __n;
      if (__n <= 0x40)
      {
        memcpy(a2, __src, __n);
        v27 = 0;
        *a3 = v28;
      }
      else
      {
        return 84;
      }
    }
  }
  else
  {
    v27 = 45;
    expert_log(v10, 0, (uint64_t)"failed to resolve chip environment: %d", v12, v13, v14, v15, v16, 45);
  }
  return v27;
}

uint64_t image4_environment_commit_nonce_proposal(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  int nonce_domain;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  _OWORD v22[4];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 8);
  memset(v22, 0, sizeof(v22));
  v21 = 64;
  v3 = image4_environment_resolve(a1);
  if (v3)
  {
    v9 = (int *)v3;
    nonce_domain = image4_environment_get_nonce_domain(a1);
    v11 = darwin_syscall_nonce_peek_hash(v2, v9, nonce_domain, v22, &v21);
    v19 = v11;
    if (!(_DWORD)v11)
    {
      v11 = darwin_syscall_nonce_roll(v2, v9, nonce_domain);
      v19 = v11;
    }
    if (v19 >= 0x6A)
      __panic_npx_2(v11, v12, v13, v14, v15, v16, v17, v18, v19);
  }
  else
  {
    v19 = 45;
    expert_log(v2, 0, (uint64_t)"failed to resolve chip environment: %d", v4, v5, v6, v7, v8, 45);
  }
  return v19;
}

unint64_t image4_environment_flash(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, size_t *a5)
{
  uint64_t v9;
  unint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
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
  uint64_t name;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  size_t v34;
  size_t __n;
  _OWORD v36[2];
  uint64_t v37;
  _QWORD __src[3];

  __src[2] = *MEMORY[0x24BDAC8D0];
  v9 = *(_QWORD *)(a1 + 8);
  v37 = 0;
  __src[0] = 0;
  memset(v36, 0, sizeof(v36));
  __src[1] = 0;
  __n = 16;
  result = image4_environment_resolve(a1);
  if (!result)
  {
    v27 = 45;
    expert_log(v9, 0, (uint64_t)"failed to resolve chip environment: %d", v11, v12, v13, v14, v15, 45);
    return v27;
  }
  v16 = result;
  if (!*(_QWORD *)(result + 80))
  {
    if (result >= result + 264)
      goto LABEL_14;
    name = chip_get_name(result);
    v27 = 45;
    expert_log(v9, 0, (uint64_t)"%s: chip has no associated dfu policy: %d", v29, v30, v31, v32, v33, name);
    return v27;
  }
  buff_init_wrap(v36, a2, a3);
  result = darwin_syscall_image_dfu(v9, *(int **)(v16 + 80), (uint64_t *)v36, __src, &__n, v17, v18, v19);
  if ((_DWORD)result)
  {
    v27 = result;
    if (result >= 0x6A)
      __panic_npx_2(result, v20, v21, v22, v23, v24, v25, v26, result);
    return v27;
  }
  if (!a4)
    return 0;
  v34 = __n;
  if (__n <= 0x10)
  {
    memcpy(a4, __src, __n);
    v27 = 0;
    *a5 = v34;
    return v27;
  }
LABEL_14:
  __break(0x5519u);
  return result;
}

uint64_t img4_firmware_new_from_fd_4MSM(char *a1, uint64_t a2, unsigned int a3, int *a4, uint64_t a5)
{
  uint64_t expert;
  uint64_t v11;
  uint64_t v12;
  uint64_t inited;
  uint64_t v14;
  uint64_t v16;
  int v17;

  expert = img4_runtime_get_expert(a1);
  v17 = 0;
  v16 = 0;
  v11 = *a4;
  v12 = _expert_alloc_type(expert, (uint64_t)&_image4_type_firmware);
  img4_firmware_init_sentinel((_QWORD *)v12, (uint64_t)a1, a5);
  fourcc_init((uint64_t)&v16, a3);
  *(_QWORD *)(v12 + 16) = &_image4_type_firmware;
  inited = payload_init_empty(v12 + 56, expert, (unsigned int *)&v16);
  *(_QWORD *)(v12 + 48) = inited;
  v14 = *(_QWORD *)(a2 + 16);
  *(_OWORD *)(v12 + 24) = *(_OWORD *)a2;
  *(_QWORD *)(v12 + 40) = v14;
  payload_set_callbacks(inited, (uint64_t)img4_firmware_new_from_fd_4MSM_callbacks, v11);
  *a4 = -1;
  return v12;
}

uint64_t _fd_measure(uint64_t *a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  size_t v14;
  uint64_t v15;
  char *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  size_t v30;
  uint64_t v31;
  unint64_t v33;
  unint64_t st_size;
  size_t v35;
  ssize_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  ssize_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t length_signed;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80[6];
  stat v81;
  _OWORD v82[4];
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v7 = (*(uint64_t (**)(void))(a2 + 48))();
  memset(&v81, 0, sizeof(v81));
  memset(v82, 0, sizeof(v82));
  MEMORY[0x24BDAC7A8](v7, v8, (*(_QWORD *)(v7 + 8) + *(_QWORD *)(v7 + 16) + 19) & 0xFFFFFFFFFFFFFFF8, v9, v10, v11, v12, v13);
  v16 = (char *)&v76 - v15;
  if (v17 >= 8)
    memset((char *)&v76 - v15, 170, v14);
  ccdigest_init();
  v78 = a3;
  v79 = &v76;
  if (a4 < 0)
  {
    v30 = 0;
    v23 = 0;
    goto LABEL_9;
  }
  v23 = malloc_type_malloc(0x40000uLL, 0xC6E5252DuLL);
  if (v23)
  {
    if (fstat(a4, &v81))
    {
      v24 = *__error();
      expert_log(*a1, 0, (uint64_t)"%s: fstat: %d", v25, v26, v27, v28, v29, a1[1] + 4);
      if (v24)
        goto LABEL_7;
    }
    else
    {
      v33 = 0;
      v77 = 0;
      st_size = v81.st_size;
      while (1)
      {
        while (1)
        {
          memset(v80, 0, 40);
          if (st_size >= 0x40000)
            v35 = 0x40000;
          else
            v35 = st_size;
          v36 = read(a4, v23, v35);
          if (v36 < 0)
            goto LABEL_26;
          v42 = v36;
          if (v36 > 0x40000)
            goto LABEL_25;
          buff_init_wrap_signed(v80, (uint64_t)v23, v36, v37, v38, v39, v40, v41);
          if (v42 != v35)
            break;
          length_signed = buff_get_length_signed((uint64_t)v80, v43, v44, v45, v46, v47, v48, v49);
          st_size -= v80[1];
          expert_log(*a1, 2uLL, (uint64_t)"%s: left to read = %lu", v51, v52, v53, v54, v55, a1[1] + 4);
          v56 = *a1;
          v57 = a1[1] + 4;
          v77 += length_signed;
          expert_log(v56, 2uLL, (uint64_t)"%s: cur offset = %lld", v58, v59, v60, v61, v62, v57);
          ccdigest_update();
          v33 = 0;
          if (!st_size)
            goto LABEL_23;
        }
        if (v42)
        {
          v70 = 5;
          expert_log(*a1, 0, (uint64_t)"%s: read: bad read: actual = %ld, requested = %lu, chunk length = %lu: %d", v45, v46, v47, v48, v49, a1[1] + 4);
          goto LABEL_29;
        }
        expert_log(*a1, 2uLL, (uint64_t)"%s: stall while reading file", v45, v46, v47, v48, v49, a1[1] + 4);
        if (v33 >= 3)
          break;
        ++v33;
        if (!st_size)
        {
LABEL_23:
          if (*(_QWORD *)v7 >= 0x41uLL)
            __panic_npx("panic: buffer not sufficient for digest: actual = %lu, expected >= %lu", v63, v64, v65, v66, v67, v68, v69, 64);
          (*(void (**)(uint64_t, char *, _OWORD *))(v7 + 56))(v7, v16, v82);
          v30 = *(_QWORD *)v7;
          if (*(_QWORD *)v7 < 0x41uLL)
            goto LABEL_9;
LABEL_25:
          __break(0x5519u);
LABEL_26:
          v70 = *__error();
          expert_log(*a1, 0, (uint64_t)"%s: read: %d", v71, v72, v73, v74, v75, a1[1] + 4);
          goto LABEL_29;
        }
      }
      v70 = 5;
      expert_log(*a1, 0, (uint64_t)"%s: stalled out: %d", v65, v66, v67, v68, v69, a1[1] + 4);
LABEL_29:
      if (v70)
        goto LABEL_7;
    }
    v31 = 0;
    goto LABEL_10;
  }
LABEL_7:
  v30 = 0;
LABEL_9:
  v31 = digest_init(v78, v82, v30, v18, v19, v20, v21, v22);
LABEL_10:
  free(v23);
  return v31;
}

uint64_t _fd_get_measured_bytes()
{
  return 0;
}

uint64_t _fd_dealloc(int a1, int a2)
{
  uint64_t result;
  int *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  result = close(a2);
  if ((_DWORD)result)
  {
    v3 = __error();
    __panic_npx("panic: close%d", v4, v5, v6, v7, v8, v9, v10, *v3);
  }
  return result;
}

uint64_t _prepare_3(uint64_t a1, uint64_t a2)
{
  return odometer_prepare_mixn_match(a2, 1);
}

uint64_t _get_constraint_mask_3()
{
  return 0;
}

uint64_t _extract_payload_3()
{
  return 0;
}

uint64_t _BootPolicyClosureComputeDigest_2(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t *v9;

  v9 = **(unint64_t ***)(*(_QWORD *)(a5 + 32) + 16);
  if (*v9 > a4)
    __panic_npx_0((uint64_t)v9, a2, a1, a4, a5, a6, a7, a8, a4);
  ccdigest();
  return 0;
}

uint64_t _BootPolicyClosureVerifyChain_2()
{
  return 0;
}

uint64_t _BootPolicyClosureVerifySignature_2()
{
  return 0;
}

uint64_t _BootPolicyClosureEvaluateCertificateProperties_2()
{
  return 0;
}

uint64_t _get_constraint_mask_4()
{
  return 0;
}

uint64_t _extract_payload_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char vars0;

  if (!*(_WORD *)(a3 + 584))
    __panic_npx_8(a1, a2, a3, a4, (uint64_t)a5, a6, a7, a8, vars0);
  *a5 = *(_QWORD *)(a3 + 552);
  return *(_QWORD *)(a3 + 544);
}

void __panic_npx_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  char __str[2048];
  char *v10;

  v10 = (char *)0xAAAAAAAAAAAAAAAALL;
  bzero(__str, 0x800uLL);
  v10 = &a9;
  vsnprintf(__str, 0x800uLL, "panic: optional not set", &a9);
  _os_crash();
  __break(1u);
}

uint64_t dylib_init(uint64_t a1)
{
  char **v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = generic_expert();
  expert_init(a1);
  darwin_syscall_init(a1);
  return generic_expert_set_specialist((uint64_t)v2, a1, 0, v3, v4, v5, v6, v7);
}

size_t dylib_expert_state_init(uint64_t a1)
{
  size_t result;
  _OWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  memset(v3, 0, sizeof(v3));
  if (os_parse_boot_arg_int())
    *(_BYTE *)a1 = 1;
  result = os_parse_boot_arg_string();
  if ((_DWORD)result)
  {
    if (LODWORD(v3[0]) == 3171437)
      *(_QWORD *)(a1 + 16) = a1 + 24;
    result = strlcpy((char *)(a1 + 24), (const char *)v3, 0x20uLL);
    *(_QWORD *)(a1 + 8) = a1 + 24;
  }
  return result;
}

uint64_t dylib_expert_call_method(uint64_t a1, unint64_t a2, const void *a3, size_t a4, void *a5, size_t *a6)
{
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
  char **v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t result;
  mach_port_t kmod_connect;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *outputStruct;
  void *outputStructa;

  v12 = expert_runtime_boot(a1);
  if ((_DWORD)v12)
  {
    v20 = v12;
    expert_log(a1, 3uLL, (uint64_t)"failed to boot expert for user client call: %d", v15, v16, v17, v18, v19, v12);
    goto LABEL_3;
  }
  v28 = darwin_syscall_get(a2, v13, v14, v15, v16, v17, v18, v19);
  if (!v28)
    return 78;
  v36 = (unint64_t)v28;
  if (*((_DWORD *)v28 + 9) == 6)
    return 78;
  kmod_connect = dylib_expert_get_kmod_connect(a1, v29, v30, v31, v32, v33, v34, v35);
  if (!kmod_connect)
  {
    expert_log(a1, 1uLL, (uint64_t)"user client not supported on this target", v39, v40, v41, v42, v43, (uint64_t)outputStruct);
    return 45;
  }
  result = IOConnectCallMethod(kmod_connect, *(_DWORD *)(v36 + 36), 0, 0, a3, a4, 0, 0, a5, a6);
  if (!(_DWORD)result)
  {
    expert_log(a1, 2uLL, (uint64_t)"user client method success", v44, v45, v46, v47, v48, (uint64_t)outputStructa);
    return 0;
  }
  if (((result >> 14) & 0xFFF) != 3)
  {
    expert_log(a1, 0, (uint64_t)"user client method failed: v = %hx, trap = %s, kr = %#x, sys = %#x, sub = %#x, code = %#x", v44, v45, v46, v47, v48, *(unsigned __int8 *)(v36 + 8));
    return 64;
  }
  if (v36 < v36 + 40)
  {
    v20 = result & 0x3FFF;
    dylib_expert_record_trap_error(a1, v36, (uint64_t)"iokit", v20, v45, v46, v47, v48);
LABEL_3:
    if (v20 >= 0x6A)
      __panic_npx("panic: error not set to valid posix code: %d", v21, v22, v23, v24, v25, v26, v27, v20);
    return v20;
  }
  __break(0x5519u);
  return result;
}

uint64_t dylib_expert_record_trap_error(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  switch((_DWORD)a4)
  {
    case 'T':
      return expert_log(a1, 0, (uint64_t)"bad argument vector provided to kext: v = %hx, how = %s, trap = %s: %d", a4, a5, a6, a7, a8, *(unsigned __int8 *)(a2 + 8));
    case 'W':
      return expert_log(a1, 0, (uint64_t)"kext and dylib are out of sync: v = %hx, how = %s, trap = %s: %d", a4, a5, a6, a7, a8, *(unsigned __int8 *)(a2 + 8));
      return expert_log(a1, 0, (uint64_t)"kext cannot parse argument vector: v = %hx, how = %s, trap = %s: %d", a4, a5, a6, a7, a8, *(unsigned __int8 *)(a2 + 8));
  }
  return expert_log(a1, 0, (uint64_t)"trap failed: v = %hx, how = %s, trap = %s: %d", a4, a5, a6, a7, a8, *(unsigned __int8 *)(a2 + 8));
}

uint64_t dylib_restoreos_logv(unint64_t a1, const char *a2, va_list a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const char *v9;
  FILE *v10;
  const char *v11;
  uint64_t result;
  FILE *v13;
  FILE *v14;
  const char *v15;
  uint64_t v18;
  _OWORD v19[5];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (a1 >= 4)
    __panic_npx("panic: unreachable case: %s = 0x%llx", (uint64_t)a2, (uint64_t)a3, a4, a5, a6, a7, a8, (char)"lvl");
  v9 = off_251CD81B8[a1];
  os_unfair_lock_lock((os_unfair_lock_t)&dylib_restoreos_logv_rd_log);
  v10 = _restore_log_state_file_locked();
  os_unfair_lock_unlock((os_unfair_lock_t)&dylib_restoreos_logv_rd_log);
  v11 = getprogname();
  if (fprintf(v10, "%s: AppleImage4 %s", v11, v9) < 0
    || vfprintf(v10, a2, a3) < 0
    || (result = fprintf(v10, "\n"), (result & 0x80000000) != 0))
  {
    os_unfair_lock_lock((os_unfair_lock_t)&dylib_restoreos_logv_rd_log);
    v13 = (FILE *)qword_2579BA268;
    qword_2579BA268 = 0;
    v14 = _restore_log_state_file_locked();
    os_unfair_lock_unlock((os_unfair_lock_t)&dylib_restoreos_logv_rd_log);
    v15 = getprogname();
    fprintf(v14, "%s: AppleImage4 %s", v15, v9);
    vfprintf(v14, a2, a3);
    result = fputc(10, v14);
    if (v13 && v13 != (FILE *)*MEMORY[0x24BDAC8D8])
    {
      result = fclose(v13);
      if ((_DWORD)result == -1)
        dylib_restoreos_logv_cold_1(&v18, v19);
    }
  }
  return result;
}

FILE *_restore_log_state_file_locked()
{
  FILE *result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  BOOL v10;
  BOOL v11;
  char v12;

  result = (FILE *)qword_2579BA268;
  if (qword_2579BA268)
    return result;
  result = fopen("/dev/console", "w");
  if (result && result >= &result[1])
    goto LABEL_22;
  qword_2579BA268 = (uint64_t)result;
  if (result)
    return result;
  v8 = *__error();
  if (v8 == 1 || v8 == 13)
  {
    result = (FILE *)*MEMORY[0x24BDAC8D8];
    if (*MEMORY[0x24BDAC8D8])
      v10 = (unint64_t)result >= *MEMORY[0x24BDAC8D8] + 152;
    else
      v10 = 0;
    if (v10)
      goto LABEL_22;
    qword_2579BA268 = *MEMORY[0x24BDAC8D8];
  }
  else
  {
    if (v8 == 22)
      goto LABEL_23;
    result = (FILE *)*MEMORY[0x24BDAC8D8];
  }
  if (result)
    v11 = result >= &result[1];
  else
    v11 = 0;
  if (v11)
  {
LABEL_22:
    __break(0x5519u);
LABEL_23:
    __panic_npx("panic: invalid mode trying to open console", v1, v2, v3, v4, v5, v6, v7, v12);
  }
  return result;
}

uint64_t chip_instance_instantiate(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t constraint;
  uint64_t v22;
  uint64_t v23;
  unsigned __int8 *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t result;
  BOOL v36;
  __int128 v37;
  uint64_t v38;

  v37 = xmmword_251CD8530;
  v38 = -1;
  v11 = property_iterator_next((uint64_t)&v37, a2, a3, a4, a5, a6, a7, a8);
  if (!v11)
  {
    LOBYTE(result) = -1;
    goto LABEL_56;
  }
  v19 = (uint64_t)v11;
  v20 = a1 + 160;
  while (1)
  {
    constraint = chip_get_constraint(a3, v19, 0);
    v29 = constraint;
    v30 = constraint + 104;
    switch(**(_QWORD **)(constraint + 40))
    {
      case 0:
        v31 = *(_QWORD *)(constraint + 64);
        if (v31 < 0)
          goto LABEL_53;
        if (constraint >= v30)
          goto LABEL_52;
        v24 = (unsigned __int8 *)(a1 + v31);
        if (a1 + v31)
        {
          if ((unint64_t)v24 >= v20 || (unint64_t)v24 < a1)
            goto LABEL_52;
        }
        result = expert_query_property_BOOL(a2, a3, constraint, v24);
        break;
      case 1:
        v31 = *(_QWORD *)(constraint + 64);
        if (v31 < 0)
          goto LABEL_53;
        if (constraint >= v30)
          goto LABEL_52;
        v24 = (unsigned __int8 *)(a1 + v31);
        if (a1 + v31)
        {
          if ((unint64_t)v24 >= v20 || (unint64_t)v24 < a1)
            goto LABEL_52;
        }
        result = expert_query_property_uint32(a2, a3, constraint, v24);
        break;
      case 2:
        v31 = *(_QWORD *)(constraint + 64);
        if (v31 < 0)
          goto LABEL_53;
        if (constraint >= v30)
          goto LABEL_52;
        v24 = (unsigned __int8 *)(a1 + v31);
        if (a1 + v31)
        {
          if ((unint64_t)v24 >= v20 || (unint64_t)v24 < a1)
            goto LABEL_52;
        }
        result = expert_query_property_uint64(a2, a3, constraint, v24);
        break;
      case 3:
        v31 = *(_QWORD *)(constraint + 64);
        if (v31 < 0)
          goto LABEL_53;
        if (constraint >= v30
          || (v24 = (unsigned __int8 *)(a1 + v31)) != 0
          && ((unint64_t)v24 < v20 ? (v36 = (unint64_t)v24 >= a1) : (v36 = 0), !v36))
        {
LABEL_52:
          __break(0x5519u);
LABEL_53:
          __panic_npx("panic: invalid offset: %lld", v22, v23, (uint64_t)v24, v25, v26, v27, v28, v31);
        }
        result = expert_query_property_digest(a2, a3, constraint, (uint64_t)v24);
        break;
      default:
        __panic_npx("panic: version property iterated during instantiation: p = %s, fourcc = %s", v22, v23, (uint64_t)v24, v25, v26, v27, v28, *(_QWORD *)constraint);
    }
    if ((int)result <= 18)
    {
      if ((_DWORD)result)
      {
        if ((_DWORD)result != 2)
          break;
      }
      else
      {
        *(_QWORD *)(a1 + 8) |= *(_QWORD *)(v29 + 72);
      }
      goto LABEL_48;
    }
    if ((_DWORD)result != 19 && (_DWORD)result != 45)
      break;
LABEL_48:
    result = (uint64_t)property_iterator_next((uint64_t)&v37, v12, v13, v14, v15, v16, v17, v18);
    v19 = result;
    if (!result)
      return result;
  }
  if (result >= 0x6A)
LABEL_56:
    __panic_npx("panic: error not set to valid posix code: %d", v12, v13, v14, v15, v16, v17, v18, result);
  return result;
}

unint64_t chip_instance_check(unint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v8 = a2[8];
  if (v8 < 0)
    return 0;
  v9 = a2[9];
  if (!v9)
    __panic_npx("panic: illegal property definition: %s", (uint64_t)a2, a3, a4, a5, a6, a7, a8, *a2);
  if ((*(_QWORD *)(a1 + 8) & v9) == 0)
    return 0;
  v10 = a1 + v8;
  if (v10)
  {
    if (v10 >= a1 + 160 || v10 < a1)
    {
      __break(0x5519u);
      return 0;
    }
  }
  return v10;
}

unint64_t chip_instance_set_BOOL(unint64_t result, uint64_t a2, _BYTE *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _BYTE *v9;

  if (*(_UNKNOWN **)(a2 + 40) != &_property_type_BOOL)
    __panic_npx("panic: non-%s property set: property = %s, type = %s", a2, (uint64_t)a3, a4, a5, a6, a7, a8, 5);
  v8 = *(_QWORD *)(a2 + 64);
  if (v8 < 0)
    __panic_npx("panic: property not present in chip instance: %s", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(_QWORD *)a2);
  v9 = (_BYTE *)(result + v8);
  *(_QWORD *)(result + 8) |= *(_QWORD *)(a2 + 72);
  if ((unint64_t)v9 < result + 160 && (unint64_t)v9 >= result)
    *v9 = *a3;
  else
    __break(0x5519u);
  return result;
}

unint64_t chip_instance_set_uint32(unint64_t result, uint64_t a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _DWORD *v9;

  if (*(uint64_t **)(a2 + 40) != &_property_type_uint32)
    __panic_npx("panic: non-%s property set: property = %s, type = %s", a2, (uint64_t)a3, a4, a5, a6, a7, a8, 95);
  v8 = *(_QWORD *)(a2 + 64);
  if (v8 < 0)
    __panic_npx("panic: property not present in chip instance: %s", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(_QWORD *)a2);
  v9 = (_DWORD *)(result + v8);
  *(_QWORD *)(result + 8) |= *(_QWORD *)(a2 + 72);
  if ((unint64_t)v9 < result + 160 && (unint64_t)v9 >= result)
    *v9 = *a3;
  else
    __break(0x5519u);
  return result;
}

unint64_t chip_instance_set_uint64(unint64_t result, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v9;

  if (*(uint64_t **)(a2 + 40) != &_property_type_uint64)
    __panic_npx("panic: non-%s property set: property = %s, type = %s", a2, (uint64_t)a3, a4, a5, a6, a7, a8, 102);
  v8 = *(_QWORD *)(a2 + 64);
  if (v8 < 0)
    __panic_npx("panic: property not present in chip instance: %s", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(_QWORD *)a2);
  v9 = (_QWORD *)(result + v8);
  *(_QWORD *)(result + 8) |= *(_QWORD *)(a2 + 72);
  if ((unint64_t)v9 < result + 160 && (unint64_t)v9 >= result)
    *v9 = *a3;
  else
    __break(0x5519u);
  return result;
}

unint64_t chip_instance_set_digest(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  unint64_t v9;

  if (*(uint64_t **)(a2 + 40) != &_property_type_digest)
    __panic_npx("panic: non-%s property set: property = %s, type = %s", a2, a3, a4, a5, a6, a7, a8, 109);
  v8 = *(_QWORD *)(a2 + 64);
  if (v8 < 0)
    __panic_npx("panic: property not present in chip instance: %s", a2, a3, a4, a5, a6, a7, a8, *(_QWORD *)a2);
  *(_QWORD *)(result + 8) |= *(_QWORD *)(a2 + 72);
  v9 = result + v8;
  if (!v9)
    return digest_copy(v9, a3, a3, a4, a5, a6, a7, a8);
  if (v9 < result + 160 && v9 >= result)
    return digest_copy(v9, a3, a3, a4, a5, a6, a7, a8);
  __break(0x5519u);
  return result;
}

void chip_instance_set_version(unint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  unint64_t v9;
  BOOL v10;

  if (*(uint64_t **)(a2 + 40) != &_property_type_version)
    __panic_npx("panic: non-%s property set: property = %s, type = %s", a2, (uint64_t)a3, a4, a5, a6, a7, a8, 116);
  v8 = *(_QWORD *)(a2 + 64);
  if (v8 < 0)
    __panic_npx("panic: property not present in chip instance: %s", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(_QWORD *)a2);
  *(_QWORD *)(a1 + 8) |= *(_QWORD *)(a2 + 72);
  v9 = a1 + v8;
  if (!v9 || (v9 < a1 + 160 ? (v10 = v9 >= a1) : (v10 = 0), v10))
    version_copy(v9, a3);
  else
    __break(0x5519u);
}

_BYTE *chip_instance_get_BOOL(_BYTE *result, uint64_t a2, _BYTE *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _BYTE *v9;

  if (*(_UNKNOWN **)(a2 + 40) != &_property_type_BOOL)
    __panic_npx("panic: non-%s property set: property = %s, type = %s", a2, (uint64_t)a3, a4, a5, a6, a7, a8, 5);
  v8 = *(_QWORD *)(a2 + 64);
  if (v8 < 0)
    __panic_npx("panic: property not present in chip instance: %s", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(_QWORD *)a2);
  if ((*(_QWORD *)(a2 + 72) & *((_QWORD *)result + 1)) == 0)
    return 0;
  v9 = &result[v8];
  if (v9 >= result + 160 || v9 < result)
  {
    __break(0x5519u);
    return result;
  }
  *a3 = *v9;
  return v9;
}

_DWORD *chip_instance_get_uint32(_DWORD *result, uint64_t a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _DWORD *v9;

  if (*(uint64_t **)(a2 + 40) != &_property_type_uint32)
    __panic_npx("panic: non-%s property set: property = %s, type = %s", a2, (uint64_t)a3, a4, a5, a6, a7, a8, 95);
  v8 = *(_QWORD *)(a2 + 64);
  if (v8 < 0)
    __panic_npx("panic: property not present in chip instance: %s", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(_QWORD *)a2);
  if ((*(_QWORD *)(a2 + 72) & *((_QWORD *)result + 1)) == 0)
    return 0;
  v9 = (_DWORD *)((char *)result + v8);
  if (v9 >= result + 40 || v9 < result)
  {
    __break(0x5519u);
    return result;
  }
  *a3 = *v9;
  return v9;
}

_QWORD *chip_instance_get_uint64(_QWORD *result, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v9;

  if (*(uint64_t **)(a2 + 40) != &_property_type_uint64)
    __panic_npx("panic: non-%s property set: property = %s, type = %s", a2, (uint64_t)a3, a4, a5, a6, a7, a8, 102);
  v8 = *(_QWORD *)(a2 + 64);
  if (v8 < 0)
    __panic_npx("panic: property not present in chip instance: %s", a2, (uint64_t)a3, a4, a5, a6, a7, a8, *(_QWORD *)a2);
  if ((*(_QWORD *)(a2 + 72) & result[1]) == 0)
    return 0;
  v9 = (_QWORD *)((char *)result + v8);
  if (v9 >= result + 20 || v9 < result)
  {
    __break(0x5519u);
    return result;
  }
  *a3 = *v9;
  return v9;
}

unint64_t chip_instance_get_digest(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  unint64_t v9;

  if (*(uint64_t **)(a2 + 40) != &_property_type_digest)
    __panic_npx("panic: non-%s property set: property = %s, type = %s", a2, a3, a4, a5, a6, a7, a8, 109);
  v8 = *(_QWORD *)(a2 + 64);
  if (v8 < 0)
    __panic_npx("panic: property not present in chip instance: %s", a2, a3, a4, a5, a6, a7, a8, *(_QWORD *)a2);
  if ((*(_QWORD *)(a2 + 72) & *(_QWORD *)(result + 8)) == 0)
    return 0;
  v9 = result + v8;
  if (!(result + v8))
    return digest_copy(a3, v9, a3, a4, a5, a6, a7, a8);
  if (v9 < result + 160 && v9 >= result)
    return digest_copy(a3, v9, a3, a4, a5, a6, a7, a8);
  __break(0x5519u);
  return result;
}

void chip_instance_get_version(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  __int128 *v9;
  BOOL v10;

  if (*(uint64_t **)(a2 + 40) != &_property_type_version)
    __panic_npx("panic: non-%s property set: property = %s, type = %s", a2, a3, a4, a5, a6, a7, a8, 116);
  v8 = *(_QWORD *)(a2 + 64);
  if (v8 < 0)
    __panic_npx("panic: property not present in chip instance: %s", a2, a3, a4, a5, a6, a7, a8, *(_QWORD *)a2);
  if ((*(_QWORD *)(a2 + 72) & *(_QWORD *)(a1 + 8)) != 0)
  {
    v9 = (__int128 *)(a1 + v8);
    if (!(a1 + v8) || ((unint64_t)v9 < a1 + 160 ? (v10 = (unint64_t)v9 >= a1) : (v10 = 0), v10))
      version_copy(a3, v9);
    else
      __break(0x5519u);
  }
}

uint64_t X509PolicySetFlagsForCommonNames(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  unint64_t v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v4[0] = 0xAAAAAAAAAAAAAAAALL;
  v4[1] = 0xAAAAAAAAAAAAAAAALL;
  result = X509CertificateSubjectNameGetCommonName((unint64_t *)(a1 + 104), v4);
  if (!(_DWORD)result)
  {
    result = compare_octet_string((uint64_t)&iPhoneCAName, (uint64_t)v4);
    if ((_DWORD)result)
    {
      result = compare_octet_string((uint64_t)&CodeSigningCAName, (uint64_t)v4);
      if ((_DWORD)result)
      {
        result = compare_octet_string_partial((uint64_t)&MFi4AccessoryCAName, (uint64_t)v4);
        if ((_DWORD)result)
        {
          result = compare_octet_string_partial((uint64_t)&MFi4AttestationCAName, (uint64_t)v4);
          if ((_DWORD)result)
          {
            result = compare_octet_string_partial((uint64_t)&MFi4ProvisioningCAName, (uint64_t)v4);
            if ((_DWORD)result)
              return result;
            v3 = 0x1000000000;
          }
          else
          {
            v3 = 0x800000000;
          }
        }
        else
        {
          v3 = 0x400000000;
        }
      }
      else
      {
        v3 = 8;
      }
    }
    else
    {
      v3 = 3840;
    }
    *(_QWORD *)(a1 + 240) |= v3;
  }
  return result;
}

double X509PolicySetFlagsForMFI(uint64_t a1)
{
  double result;
  time_t v3;
  tm v4;
  time_t v5;
  unint64_t v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = 0xAAAAAAAAAAAAAAAALL;
  v6[1] = 0xAAAAAAAAAAAAAAAALL;
  if (!X509CertificateSubjectNameGetCommonName((unint64_t *)(a1 + 104), v6))
  {
    if (compare_octet_string_partial((uint64_t)&MFICommonNamePrefix, (uint64_t)v6))
      goto LABEL_3;
    v5 = 0;
    if (!X509CertificateGetNotBefore(a1, &v5))
    {
      memset(&v4, 0, sizeof(v4));
      strptime("2006-05-31", "%F", &v4);
      v3 = timegm(&v4);
      result = difftime(v3, v5);
      if (result < 0.0)
      {
        *(_QWORD *)(a1 + 240) |= 0x8000000uLL;
LABEL_3:
        if (!compare_octet_string_partial((uint64_t)&MFi4ProvisioningHostNamePrefix, (uint64_t)v6))
          *(_QWORD *)(a1 + 240) |= 0x1000000000uLL;
      }
    }
  }
  return result;
}

uint64_t X509PolicySetFlagsForRoots(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (!result)
    return result;
  v3 = result;
  if (*(_BYTE *)(result + 16))
  {
    result = compare_octet_string(a2 + 88, (uint64_t)&AppleRootCASPKI);
    if (!(_DWORD)result
      || (result = compare_octet_string(a2 + 88, (uint64_t)&AppleRootG2SPKI), !(_DWORD)result)
      || (result = compare_octet_string(a2 + 88, (uint64_t)&AppleRootG3SPKI), !(_DWORD)result))
    {
      v5 = *(_QWORD *)(a2 + 240) | 0x58E30653FFF8;
      goto LABEL_11;
    }
  }
  v4 = *(_QWORD *)(v3 + 8);
  if ((v4 & 0x1000000) != 0)
  {
    result = compare_octet_string(a2 + 88, (uint64_t)&UcrtRootSpki);
    if (!(_DWORD)result)
    {
      v5 = *(_QWORD *)(a2 + 240) | 0x1000000;
      goto LABEL_11;
    }
LABEL_13:
    if (*(_BYTE *)(v3 + 17))
      result = X509PolicySetFlagsForTestAnchor((_QWORD *)v3, a2);
    goto LABEL_15;
  }
  if ((v4 & 0x1C00000000) == 0)
    goto LABEL_15;
  result = compare_octet_string(a2 + 88, (uint64_t)&MFi4RootSpki);
  if ((_DWORD)result)
    goto LABEL_13;
  v5 = *(_QWORD *)(a2 + 240) | 0x1C00000000;
LABEL_11:
  *(_QWORD *)(a2 + 240) = v5;
LABEL_15:
  if (*(_BYTE *)(v3 + 16))
  {
    if (*(_BYTE *)(v3 + 17))
    {
      result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootCASPKI);
      if (!(_DWORD)result
        || (result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootG2SPKI), !(_DWORD)result)
        || (result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootG3SPKI), !(_DWORD)result))
      {
        *(_QWORD *)(a2 + 240) |= 0x58E30653FFF8uLL;
      }
    }
    if (*(_BYTE *)(v3 + 16) && *(_BYTE *)(v3 + 17))
    {
      result = compare_octet_string(a2 + 88, (uint64_t)&TestAppleRootECCSPKI);
      if (!(_DWORD)result)
        *(_QWORD *)(a2 + 240) |= 0x6400000uLL;
    }
  }
  return result;
}

uint64_t X509PolicySetFlagsForTestAnchor(_QWORD *a1, uint64_t a2)
{
  uint64_t result;
  _QWORD v5[2];
  unint64_t v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = 0;
  v6[1] = 0;
  v5[0] = 0;
  v5[1] = 0;
  result = X509CertificateParseSPKI((unint64_t *)(a2 + 88), v6, 0, v5);
  if (!(_DWORD)result)
  {
    result = compare_octet_string(a1[4], (uint64_t)v6);
    if (!(_DWORD)result)
    {
      result = compare_octet_string(a1[3], (uint64_t)v5);
      if (!(_DWORD)result)
        *(_QWORD *)(a2 + 240) |= a1[1];
    }
  }
  return result;
}

uint64_t X509PolicyCheckForBlockedKeys(uint64_t a1)
{
  uint64_t result;

  result = compare_octet_string(a1 + 88, (uint64_t)&BlockedYonkersSPKI);
  if (!(_DWORD)result)
    *(_QWORD *)(a1 + 240) &= 0xFFFFFFFFFFF3FFFFLL;
  return result;
}

uint64_t CTImg4VerifyChain(uint64_t result, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, unint64_t *a6, uint64_t a7, uint64_t a8)
{
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  __int128 v17;
  unint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  __int128 *v22;
  __int128 *v23;
  int v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _OWORD v36[14];
  unint64_t v37[2];
  unint64_t v38[5];

  v38[4] = *MEMORY[0x24BDAC8D0];
  if (!a8)
    return 6;
  v14 = result;
  memset(v38, 170, 32);
  v37[0] = 0xAAAAAAAAAAAAAAAALL;
  v37[1] = 0xAAAAAAAAAAAAAAAALL;
  v15 = *(_QWORD *)(a8 + 8);
  if (!v15)
    goto LABEL_10;
  v16 = *(_QWORD *)(a8 + 16);
  if (!v16)
    goto LABEL_10;
  *(_QWORD *)&v17 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v36[12] = v17;
  v36[13] = v17;
  v36[10] = v17;
  v36[11] = v17;
  v36[8] = v17;
  v36[9] = v17;
  v36[6] = v17;
  v36[7] = v17;
  v36[4] = v17;
  v36[5] = v17;
  v36[2] = v17;
  v36[3] = v17;
  v36[0] = v17;
  v36[1] = v17;
  v34 = v17;
  v35 = v17;
  v32 = v17;
  v33 = v17;
  v31 = v17;
  v29 = 0xAAAAAAAAAAAAAAAALL;
  v30 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(v15, v16))
  {
    __break(0x5513u);
    goto LABEL_27;
  }
  v18 = v15 + v16;
  if (v15 > v18)
  {
LABEL_27:
    __break(0x5519u);
    return result;
  }
  v29 = v15;
  v30 = v18;
  v19 = X509CertificateParse((unint64_t *)&v31, &v29);
  if (v19 || (v19 = X509CertificateParseSPKI((unint64_t *)v36 + 1, &v38[2], v37, v38)) != 0)
  {
    *(_DWORD *)(a8 + 32) = v19;
    return 3;
  }
LABEL_10:
  v20 = *(_QWORD *)(a8 + 24);
  v21 = 0x80000000;
  if (v20)
    v21 = *(_QWORD *)(a8 + 24);
  *(_QWORD *)&v31 = 0;
  *((_QWORD *)&v31 + 1) = v21;
  *((_QWORD *)&v32 + 1) = v38;
  *(_QWORD *)&v33 = &v38[2];
  *((_QWORD *)&v33 + 1) = v37;
  *(_QWORD *)&v32 = 0xAAAAAAAA01000000;
  *(_QWORD *)&v34 = &null_octet;
  v29 = 0xAAAAAAAAAAAAAAAALL;
  v30 = 0xAAAAAAAAAAAAAAAALL;
  v27 = 0;
  v28 = 0;
  v22 = (__int128 *)((unint64_t)&X509PolicyBAAUser & (v20 << 21 >> 63));
  if ((v20 & 0x800000) != 0)
    v22 = (__int128 *)&X509PolicyBAASystem;
  if ((v20 & 0x40000800000) != 0)
    v23 = v22;
  else
    v23 = &v31;
  v24 = CTEvaluateCertsForPolicy(v14, a2, 0, 0, &v27, &v28, 0, 0, 0, &v29, v23);
  if (v24)
  {
    *(_DWORD *)(a8 + 32) = v24;
    return 0xFFFFFFFFLL;
  }
  else
  {
    if (a5 && a6)
    {
      v25 = v30;
      *a5 = v29;
      *a6 = v25;
    }
    result = 0;
    if (a3)
    {
      if (a4)
      {
        result = 0;
        v26 = v28;
        *a3 = v27;
        *a4 = v26;
      }
    }
  }
  return result;
}

uint64_t CTImg4VerifySignatureWithPublicKey(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v13;
  __int128 v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  unint64_t (*v21)(unint64_t, uint64_t, uint64_t, uint64_t, _QWORD *);
  _QWORD v22[2];
  __int128 v23;
  _OWORD v24[2];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  if (!a8)
    return 6;
  v13 = 655617;
  *(_QWORD *)&v14 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v31 = v14;
  v32 = v14;
  v29 = v14;
  v30 = v14;
  v27 = v14;
  v28 = v14;
  v25 = v14;
  v26 = v14;
  v24[0] = v14;
  v24[1] = v14;
  v23 = v14;
  v15 = *(_QWORD **)(a7 + 48);
  v16 = *(_QWORD *)(*(_QWORD *)(a7 + 40) + 8);
  *((_QWORD *)&v25 + 1) = **(_QWORD **)(a7 + 40);
  *(_QWORD *)&v26 = v16;
  *((_QWORD *)&v27 + 1) = a3;
  *(_QWORD *)&v28 = a4;
  v17 = v15[1];
  v22[0] = *v15;
  v22[1] = v17;
  if ((find_digestOID_for_signingOID((uint64_t)&v25 + 8, (_QWORD *)v24 + 1) & 1) == 0)
  {
    v13 = 656640;
    goto LABEL_8;
  }
  result = compare_octet_string((uint64_t)v22, (uint64_t)&rsaEncryption);
  if (!(_DWORD)result)
  {
    v19 = 0;
    v20 = 0;
    v21 = validateSignatureRSA;
    goto LABEL_12;
  }
  if (compare_octet_string((uint64_t)v22, (uint64_t)&ecPublicKey))
  {
LABEL_8:
    result = 4;
    goto LABEL_9;
  }
  result = (uint64_t)oidForPubKeyLength();
  v20 = *(_QWORD *)result;
  v19 = *(_QWORD *)(result + 8);
  v21 = (unint64_t (*)(unint64_t, uint64_t, uint64_t, uint64_t, _QWORD *))validateSignatureEC;
LABEL_12:
  *((_QWORD *)&v26 + 1) = v20;
  *(_QWORD *)&v27 = v19;
  if (a1 && !a2 || a5 && !a6)
  {
    __break(0x5519u);
    return result;
  }
  if ((v21(a1, a2, a5, a6, &v23) & 1) != 0)
    return 0;
  v13 = 655648;
  result = 0xFFFFFFFFLL;
LABEL_9:
  *(_DWORD *)(a8 + 32) = v13;
  return result;
}

unint64_t CTImg4CreateContext(unint64_t result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  unint64_t v10;
  __int128 v11;
  int v12;
  uint64_t v13;
  _QWORD *v14;
  unint64_t v15;
  int v16;
  uint64_t (**v17)();
  _QWORD v18[2];
  unint64_t v19[2];
  _OWORD v20[5];
  _OWORD v21[14];
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = 786435;
  if (!a5)
    return 786433;
  v10 = result;
  *(_OWORD *)(a5 + 16) = 0u;
  *(_OWORD *)(a5 + 32) = 0u;
  *(_OWORD *)a5 = 0u;
  v22 = 0xAAAAAAAAAAAAAAAALL;
  v23 = 0xAAAAAAAAAAAAAAAALL;
  if (!a2 || !result)
  {
    if ((a4 | 0x80000000) == 0x80000000)
      return v5;
    if ((a4 & 0x40000800000) == 0)
      return 786436;
    v14 = (_QWORD *)((unint64_t)&X509PolicyBAAUser & (a4 << 21 >> 63));
    if ((a4 & 0x800000) != 0)
      v14 = &X509PolicyBAASystem;
    v15 = *(_QWORD *)(v14[4] + 8);
    v22 = *(_QWORD *)v14[4];
    v23 = v15;
    goto LABEL_14;
  }
  *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v21[12] = v11;
  v21[13] = v11;
  v21[10] = v11;
  v21[11] = v11;
  v21[8] = v11;
  v21[9] = v11;
  v21[6] = v11;
  v21[7] = v11;
  v21[4] = v11;
  v21[5] = v11;
  v21[2] = v11;
  v21[3] = v11;
  v21[0] = v11;
  v21[1] = v11;
  v20[3] = v11;
  v20[4] = v11;
  v20[1] = v11;
  v20[2] = v11;
  v20[0] = v11;
  if (__CFADD__(result, a2))
  {
    __break(0x5513u);
  }
  else if (result + a2 >= result)
  {
    v19[0] = result;
    v19[1] = result + a2;
    v12 = X509CertificateParse((unint64_t *)v20, v19);
    v13 = 786435;
    if (v12)
      return v13;
    v18[0] = 0xAAAAAAAAAAAAAAAALL;
    v18[1] = 0xAAAAAAAAAAAAAAAALL;
    v13 = X509CertificateParseSPKI((unint64_t *)v21 + 1, &v22, 0, v18);
    if ((_DWORD)v13)
      return v13;
LABEL_14:
    if (compare_octet_string((uint64_t)&rsaEncryption, (uint64_t)&v22))
    {
      if (compare_octet_string((uint64_t)&ecPublicKey, (uint64_t)&v22))
        return 655617;
      v16 = 2;
    }
    else
    {
      v16 = 1;
    }
    v5 = 786434;
    if (a3 > 7)
    {
      if (a3 == 8)
      {
        if (v16 == 1)
          v17 = _ctImg4RsaSha384Impl;
        else
          v17 = _ctImg4EcdsaSha384Impl;
      }
      else
      {
        if (a3 != 16)
          return v5;
        if (v16 == 1)
          v17 = _ctImg4RsaSha512Impl;
        else
          v17 = _ctImg4EcdsaSha512Impl;
      }
    }
    else if (a3 == 1)
    {
      if (v16 == 1)
        v17 = _ctImg4RsaSha1Impl;
      else
        v17 = _ctImg4EcdsaSha1Impl;
    }
    else
    {
      if (a3 != 4)
        return v5;
      if (v16 == 1)
        v17 = _ctImg4RsaSha256Impl;
      else
        v17 = _ctImg4EcdsaSha256Impl;
    }
    *(_QWORD *)a5 = v17;
    v5 = 0;
    *(_QWORD *)(a5 + 8) = v10;
    *(_QWORD *)(a5 + 16) = a2;
    *(_QWORD *)(a5 + 24) = a4;
    return v5;
  }
  __break(0x5519u);
  return result;
}

int *find_digest(uint64_t a1)
{
  unint64_t v2;
  int *result;

  v2 = 0;
  while (1)
  {
    result = (int *)compare_octet_string_raw((uint64_t)&digests[v2 / 4 + 2], *(const void **)a1, *(_QWORD *)(a1 + 8));
    if (!(_DWORD)result)
      break;
    v2 += 32;
    if (v2 == 160)
      return 0;
  }
  if (v2 <= ~(unint64_t)digests)
    return &digests[v2 / 4];
  __break(0x5513u);
  return result;
}

int *find_digest_by_type(int *result)
{
  unint64_t v1;

  v1 = 0;
  while (digests[v1 / 4] != (_DWORD)result)
  {
    v1 += 32;
    if (v1 == 160)
      return 0;
  }
  if (v1 <= ~(unint64_t)digests)
    return &digests[v1 / 4];
  __break(0x5513u);
  return result;
}

uint64_t find_digestOID_for_signingOID(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  void *v6;

  if (!compare_octet_string_raw(a1, &sha1WithRSA_oid, 9uLL)
    || !compare_octet_string_raw(a1, &sha1WithECDSA_oid, 7uLL))
  {
    v6 = &CTOidSha1;
    v4 = 5;
    goto LABEL_11;
  }
  v4 = 9;
  if (!compare_octet_string_raw(a1, &sha256WithRSA_oid, 9uLL))
  {
    v6 = &CTOidSha256;
    goto LABEL_11;
  }
  if (!compare_octet_string_raw(a1, &sha256WithECDSA_oid, 8uLL))
  {
    v6 = &CTOidSha256;
LABEL_18:
    v4 = 9;
    goto LABEL_11;
  }
  v4 = 9;
  if (!compare_octet_string_raw(a1, &sha384WithRSA_oid, 9uLL))
  {
    v6 = &CTOidSha384;
    goto LABEL_11;
  }
  if (!compare_octet_string_raw(a1, &sha384WithECDSA_oid, 8uLL))
  {
    v6 = &CTOidSha384;
    goto LABEL_18;
  }
  v4 = 9;
  if (compare_octet_string_raw(a1, &sha512WithRSA_oid, 9uLL))
  {
    if (compare_octet_string_raw(a1, &sha512WithECDSA_oid, 8uLL))
      return 0;
    v6 = &CTOidSha512;
    goto LABEL_18;
  }
  v6 = &CTOidSha512;
LABEL_11:
  *a2 = v6;
  a2[1] = v4;
  return 1;
}

unint64_t validateSignatureRSA(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  unint64_t result;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t *v23;
  unint64_t v24;
  __int128 v25;
  unint64_t *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t vars0;

  result = 0;
  v34 = *MEMORY[0x24BDAC8D0];
  v30 = 0;
  if (a1)
  {
    if (a2)
    {
      result = 0;
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            result = compare_octet_string((uint64_t)&rsaEncryption, (uint64_t)(a5 + 7));
            if (!(_DWORD)result
              || (result = validateOIDs((uint64_t)&rsaAlgs, (uint64_t)(a5 + 3), (uint64_t)(a5 + 7)), (_DWORD)result))
            {
              v28 = 0xAAAAAAAAAAAAAAAALL;
              v29 = 0xAAAAAAAAAAAAAAAALL;
              v10 = a5[9];
              v9 = a5[10];
              if (__CFADD__(v10, v9))
                goto LABEL_31;
              if (v10 > v10 + v9)
                goto LABEL_32;
              v28 = a5[9];
              v29 = v10 + v9;
              if (!v9 || (result = ccder_blob_check_null(), (_DWORD)result))
              {
                if (!__CFADD__(a1, a2))
                {
                  if (a1 + a2 >= a1)
                  {
                    result = ccder_decode_rsa_pub_n();
                    if (!result)
                      return result;
                    v11 = result;
                    if (result >> 58)
                    {
LABEL_33:
                      __break(0x550Cu);
                      return result;
                    }
                    v12 = result << 6;
                    if (result << 6 < 0x400)
                      return 0;
                    v32 = 0xAAAAAAAAAAAAAAAALL;
                    v33 = -21846;
                    v31 = 6;
                    if (&vars0 != (uint64_t *)82)
                    {
                      v13 = a5[4];
                      LOBYTE(v32) = v13;
                      if ((unint64_t)&v31 <= 0xFFFFFFFFFFFFFFFDLL)
                      {
                        if (v13 <= 9)
                        {
                          v14 = __memcpy_chk();
                          if (v12 > 0x1068)
                            return 0;
                          result = MEMORY[0x24BDAC7A8](v14, v15, v16, v17, v18, v19, v20, v21);
                          v23 = (unint64_t *)((char *)&v27 - v22);
                          v24 = 0;
                          *(_QWORD *)&v25 = 0xAAAAAAAAAAAAAAAALL;
                          *((_QWORD *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
                          do
                          {
                            v26 = &v23[v24 / 8];
                            *(_OWORD *)v26 = v25;
                            *((_OWORD *)v26 + 1) = v25;
                            v24 += 32;
                          }
                          while (v22 != v24);
                          if (v22 >= 1)
                          {
                            *v23 = v11;
                            if (ccrsa_import_pub())
                              return 0;
                            if (!ccrsa_verify_pkcs1v15_allowshortsigs())
                              return v30 != 0;
                            result = 0;
                            v30 = 0;
                            return result;
                          }
                        }
                        goto LABEL_32;
                      }
                    }
                    goto LABEL_31;
                  }
LABEL_32:
                  __break(0x5519u);
                  goto LABEL_33;
                }
LABEL_31:
                __break(0x5513u);
                goto LABEL_32;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL validateOIDs(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;
  BOOL v7;

  v6 = 0;
  v7 = 1;
  do
  {
    if (!compare_octet_string(a1, a2) && !compare_octet_string(a1 + 16, a3))
      break;
    v7 = v6 < 3;
    a1 += 32;
    ++v6;
  }
  while (v6 != 4);
  return v7;
}

_UNKNOWN **oidForPubKeyLength()
{
  uint64_t v0;
  int is_supported;
  _UNKNOWN **v2;
  _UNKNOWN **v3;
  _UNKNOWN **v4;

  v0 = ccec_x963_import_pub_size();
  is_supported = ccec_keysize_is_supported();
  v2 = &CTOidSECP256r1;
  v3 = &CTOidSECP521r1;
  v4 = &CTOidSECP384r1;
  if (v0 != 384)
    v4 = 0;
  if (v0 != 521)
    v3 = v4;
  if (v0 != 256)
    v2 = v3;
  if (is_supported)
    return v2;
  else
    return 0;
}

uint64_t validateSignatureEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t *v21;
  unint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  result = 0;
  v25 = *MEMORY[0x24BDAC8D0];
  HIBYTE(v24) = 0;
  if (a1)
  {
    if (a2)
    {
      result = 0;
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            if (!compare_octet_string((uint64_t)&ecPublicKey, a5 + 56)
              || (result = validateOIDs((uint64_t)&ecAlgs, a5 + 24, a5 + 56), (_DWORD)result))
            {
              result = ccec_cp_for_oid((int **)(a5 + 72));
              if (result)
              {
                v15 = *(_QWORD *)result;
                if (*(_QWORD *)result >> 61 || !is_mul_ok(8 * v15, 3uLL))
                {
                  __break(0x550Cu);
                }
                else
                {
                  v16 = 24 * v15;
                  v17 = __CFADD__(v16, 16);
                  v18 = v16 + 16;
                  if (!v17 && v18 < 0xFFFFFFFFFFFFFFF0)
                  {
                    result = MEMORY[0x24BDAC7A8](result, v8, v9, v10, v11, v12, v13, v14);
                    v21 = (uint64_t *)((char *)&v24 - v19);
                    v22 = 0;
                    do
                    {
                      v23 = &v21[v22 / 8];
                      *v23 = 0xAAAAAAAAAAAAAAAALL;
                      v23[1] = 0xAAAAAAAAAAAAAAAALL;
                      v22 += 16;
                    }
                    while (v19 != v22);
                    if (v20 >= 0x10)
                    {
                      *v21 = result;
                      if (v19 >= 1)
                      {
                        if (!ccec_import_pub())
                        {
                          result = ccec_x963_import_pub_size();
                          if (result == 256 && *(_QWORD *)(a5 + 96) == 64)
                          {
                            if (*(_QWORD *)(a5 + 88) < 0xFFFFFFFFFFFFFFE0)
                            {
                              if (!ccec_verify_composite())
                                return HIBYTE(v24) != 0;
                              goto LABEL_24;
                            }
LABEL_31:
                            __break(0x5513u);
                            return result;
                          }
                          if (ccec_verify())
LABEL_24:
                            HIBYTE(v24) = 0;
                        }
                        return HIBYTE(v24) != 0;
                      }
LABEL_30:
                      __break(0x5519u);
                      goto LABEL_31;
                    }
LABEL_29:
                    __break(1u);
                    goto LABEL_30;
                  }
                }
                __break(0x5500u);
                goto LABEL_29;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t ccec_cp_for_oid(int **a1)
{
  int *v1;
  int *v3;
  int v5;
  int v6;

  if (!a1)
    return 0;
  v1 = a1[1];
  if (v1 != (int *)7)
  {
    if (v1 == (int *)10 && *(_QWORD *)*a1 == 0x33DCE48862A0806 && *((_WORD *)*a1 + 4) == 1793)
      JUMPOUT(0x24BD2D1D4);
    return 0;
  }
  v3 = *a1;
  if (**a1 == -2127887098 && *(int *)((char *)*a1 + 3) == 570426497)
    JUMPOUT(0x24BD2D1E0);
  v5 = *v3;
  v6 = *(int *)((char *)v3 + 3);
  if (v5 != -2127887098 || v6 != 587203713)
    return 0;
  return ccec_cp_521();
}

uint64_t compressECPublicKey(uint64_t a1, int **a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  unint64_t v18;
  uint64_t result;
  uint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  unint64_t v23;
  _QWORD *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v6 = (_QWORD *)ccec_cp_for_oid(a2);
  if (!v6)
    return 655366;
  v14 = v6;
  v15 = *v6;
  if (*v6 >> 61 || !is_mul_ok(8 * v15, 3uLL))
  {
    __break(0x550Cu);
    goto LABEL_19;
  }
  v16 = 24 * v15;
  v17 = __CFADD__(v16, 16);
  v18 = v16 + 16;
  if (v17 || v18 >= 0xFFFFFFFFFFFFFFF0)
LABEL_19:
    __break(0x5500u);
  result = MEMORY[0x24BDAC7A8](v6, v7, v8, v9, v10, v11, v12, v13);
  v22 = (_QWORD *)((char *)v25 - v20);
  v23 = 0;
  do
  {
    v24 = &v22[v23 / 8];
    *v24 = 0xAAAAAAAAAAAAAAAALL;
    v24[1] = 0xAAAAAAAAAAAAAAAALL;
    v23 += 16;
  }
  while (v20 != v23);
  if (v21 < 0x10)
    goto LABEL_21;
  *v22 = v14;
  if (v20 < 1)
  {
LABEL_20:
    __break(0x5519u);
LABEL_21:
    __break(1u);
    return result;
  }
  result = ccec_import_pub();
  if (!(_DWORD)result)
  {
    result = ccec_compressed_x962_export_pub_size();
    if (result == a4)
    {
      if (!a3 || a4)
        return ccec_compressed_x962_export_pub();
      goto LABEL_20;
    }
    return 393220;
  }
  return result;
}

unint64_t decompressECPublicKey(uint64_t a1, int **a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  unint64_t v17;
  unint64_t result;
  uint64_t v19;
  unint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  unint64_t *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v6 = (uint64_t *)ccec_cp_for_oid(a2);
  if (!v6)
    return 655366;
  v14 = *v6;
  if ((unint64_t)*v6 >> 61 || !is_mul_ok(8 * v14, 3uLL))
LABEL_22:
    __break(0x550Cu);
  v15 = 24 * v14;
  v16 = __CFADD__(v15, 16);
  v17 = v15 + 16;
  if (v16 || v17 >= 0xFFFFFFFFFFFFFFF0)
  {
LABEL_21:
    __break(0x5500u);
    goto LABEL_22;
  }
  result = MEMORY[0x24BDAC7A8](v6, v7, v8, v9, v10, v11, v12, v13);
  v21 = (_QWORD *)((char *)v25 - v19);
  v22 = 0;
  do
  {
    v23 = &v21[v22 / 8];
    *v23 = 0xAAAAAAAAAAAAAAAALL;
    v23[1] = 0xAAAAAAAAAAAAAAAALL;
    v22 += 16;
  }
  while (v19 != v22);
  if (v20 < 0x10)
    goto LABEL_24;
  *v21 = result;
  if (v19 >= 1)
  {
    v24 = ccec_compressed_x962_import_pub();
    if (!(_DWORD)v24)
    {
      result = cczp_bitlen();
      if (result < 0xFFFFFFFFFFFFFFF9)
      {
        if (!a3 || a4)
        {
          if ((((result + 7) >> 2) | 1) == a4)
            v24 = 0;
          else
            v24 = 393220;
          ccec_export_pub();
          return v24;
        }
        goto LABEL_23;
      }
      goto LABEL_21;
    }
    return v24;
  }
LABEL_23:
  __break(0x5519u);
LABEL_24:
  __break(1u);
  return result;
}

uint64_t CMSParseContentInfoSignedDataWithOptions(char *a1, uint64_t a2, unint64_t *a3, char a4)
{
  int v4;
  int v7;
  uint64_t result;
  uint64_t v9;
  _QWORD *v10;
  char *v11;
  int v12;
  char *v13;
  char *v15;
  int v16;
  char *v17;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  char *v25;
  size_t v26;
  __int16 v27;
  char *v28;
  char *v29;
  unint64_t v30[3];
  __int16 v31;
  char *v32;
  unint64_t v33;
  size_t v34;
  unsigned __int8 v35;
  unsigned __int8 v36;
  char *v37;
  char *v38;
  unint64_t v39;
  unsigned __int8 v40;
  unint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v28 = (char *)0xAAAAAAAAAAAAAAAALL;
  v29 = (char *)0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(a1, a2))
    goto LABEL_114;
  if (&a1[a2] < a1)
    goto LABEL_112;
  v4 = 65537;
  v28 = a1;
  v29 = &a1[a2];
  v27 = 0;
  v26 = 0xAAAAAAAAAAAAAAAALL;
  v7 = ccder_blob_decode_ber_tl((uint64_t)&v28, 0x2000000000000010, (_BYTE *)&v27 + 1, &v26);
  result = 65537;
  if (v7)
  {
    v24 = (char *)0xAAAAAAAAAAAAAAAALL;
    v25 = (char *)0xAAAAAAAAAAAAAAAALL;
    if (__CFADD__(v28, v26))
      goto LABEL_114;
    if (v28 > &v28[v26] || &v28[v26] > v29)
      goto LABEL_112;
    v24 = v28;
    v25 = &v28[v26];
    if (ccder_blob_decode_tl())
    {
      if (v25 < v24 || v26 > v25 - v24)
        goto LABEL_112;
      if (compare_octet_string_raw((uint64_t)&pkcs7_signedData_oid, v24, v26))
        return 65539;
      if (__CFADD__(v24, v26))
        goto LABEL_114;
      if (v24 > &v24[v26] || &v24[v26] > v25)
        goto LABEL_112;
      v24 += v26;
      if (!ccder_blob_decode_ber_tl((uint64_t)&v24, 0xA000000000000000, &v27, &v26))
        return 65540;
      v22 = (char *)0xAAAAAAAAAAAAAAAALL;
      v23 = (char *)0xAAAAAAAAAAAAAAAALL;
      if (__CFADD__(v24, v26))
        goto LABEL_114;
      if (v24 > &v24[v26] || &v24[v26] > v25)
        goto LABEL_112;
      v22 = v24;
      v23 = &v24[v26];
      v31 = 0;
      memset(v30, 170, sizeof(v30));
      if ((ccder_blob_decode_ber_tl((uint64_t)&v22, 0x2000000000000010, (_BYTE *)&v31 + 1, v30) & 1) == 0)
        return 131073;
      if (__CFADD__(v22, v30[0]))
        goto LABEL_114;
      v9 = 131080;
      if (&v22[v30[0]] != v23)
        return 131082;
      v10 = a3 + 11;
      if (!ccder_blob_decode_uint64())
        return 131074;
      result = 131092;
      if (*v10 <= 4uLL && ((1 << *v10) & 0x1A) != 0)
      {
        if (!ccder_blob_eat_ber_inner((unint64_t *)&v22, 0x2000000000000011, 0, 125))
          return 131075;
        v35 = 0;
        v34 = 0;
        if ((ccder_blob_decode_ber_tl((uint64_t)&v22, 0x2000000000000010, &v35, &v34) & 1) == 0)
          return 131076;
        v32 = (char *)0xAAAAAAAAAAAAAAAALL;
        v33 = 0xAAAAAAAAAAAAAAAALL;
        if (__CFADD__(v22, v34))
          goto LABEL_114;
        if (v22 > &v22[v34] || &v22[v34] > v23)
          goto LABEL_112;
        v32 = v22;
        v33 = (unint64_t)&v22[v34];
        if (!ccder_blob_decode_tl())
          return 131077;
        if (v33 < (unint64_t)v32 || v34 > v33 - (unint64_t)v32)
          goto LABEL_112;
        if (compare_octet_string_raw((uint64_t)&pkcs7_data_oid, v32, v34))
          return 131078;
        if (__CFADD__(v32, v34))
          goto LABEL_114;
        v11 = &v32[v34];
        if (v32 > &v32[v34] || (unint64_t)v11 > v33)
          goto LABEL_112;
        v32 += v34;
        v12 = v35;
        if (v11 != (char *)v33 || v35)
        {
          v40 = 0;
          v38 = (char *)v33;
          v39 = 0;
          v37 = v11;
          if (ccder_blob_decode_ber_tl((uint64_t)&v37, 0xA000000000000000, &v40, &v39))
          {
            if (!v12)
            {
              if (__CFADD__(v37, v39))
                goto LABEL_114;
              if (&v37[v39] != (char *)v33)
                return v9;
            }
            if (v37 > v38)
              goto LABEL_112;
            v32 = v37;
            v33 = (unint64_t)v38;
            v36 = 0;
            v16 = v40;
            if (v40 && !ccder_blob_decode_ber_tl((uint64_t)&v32, 0x2000000000000004, &v36, &v39))
              return 131079;
            v41 = 0;
            if (!ccder_blob_decode_tl())
              return 131090;
            v17 = v32;
            v18 = v33;
            if (v33 < (unint64_t)v32)
              goto LABEL_112;
            v19 = v41;
            if (v41 > v33 - (unint64_t)v32)
              goto LABEL_112;
            a3[9] = (unint64_t)v32;
            a3[10] = v19;
            if (__CFADD__(v17, v19))
            {
LABEL_114:
              __break(0x5513u);
              return 0;
            }
            v20 = &v17[v19];
            if ((unint64_t)v20 > v18 || v17 > v20)
              goto LABEL_112;
            v32 = v20;
            if ((ccder_blob_decode_eoc((unint64_t *)&v32, v36) & 1) == 0)
              return 131089;
          }
          else
          {
            if (!v12)
              return v9;
            v16 = v40;
          }
          if ((ccder_blob_decode_eoc((unint64_t *)&v32, v16 != 0) & 1) == 0)
            return 131088;
          v11 = v32;
        }
        if (v11 > v23 || v22 > v11)
          goto LABEL_112;
        v22 = v11;
        if ((ccder_blob_decode_eoc((unint64_t *)&v22, v12 != 0) & 1) == 0)
          return 131081;
        v37 = (char *)0xAAAAAAAAAAAAAAAALL;
        v38 = (char *)0xAAAAAAAAAAAAAAAALL;
        if (v22 > v23)
          goto LABEL_112;
        v37 = v22;
        v38 = v23;
        if ((ccder_blob_decode_ber_tl((uint64_t)&v37, 0xA000000000000000, &v31, v30) & 1) == 0)
        {
          v13 = v22;
          v15 = v23;
          goto LABEL_86;
        }
        v32 = (char *)0xAAAAAAAAAAAAAAAALL;
        v33 = 0xAAAAAAAAAAAAAAAALL;
        if (!__CFADD__(v37, v30[0]))
        {
          if (v37 > &v37[v30[0]] || &v37[v30[0]] > v38)
            goto LABEL_112;
          v32 = v37;
          v33 = (unint64_t)&v37[v30[0]];
          if (!CMSParseImplicitCertificateSet((unint64_t *)&v32, a3[1], *a3, a3 + 3, a3 + 2))
            return 131085;
          if (!ccder_blob_decode_eoc((unint64_t *)&v32, v31))
            return 131086;
          v13 = v32;
          if (v32 - v37 >= 0 ? v32 >= v37 : v32 < v37)
          {
            if (v37 > v32)
              goto LABEL_112;
            v15 = v38;
            if (v32 > v38)
              goto LABEL_112;
            v22 = v32;
            v23 = v38;
LABEL_86:
            if (v13 <= v15)
            {
              v37 = v13;
              v38 = v15;
              if (ccder_blob_eat_ber_inner((unint64_t *)&v37, 0xA000000000000001, 0, 125))
              {
                if (v37 > v38)
                  goto LABEL_112;
                v22 = v37;
                v23 = v38;
              }
              if (!ccder_blob_eat_ber_inner((unint64_t *)&v22, 0x2000000000000011, &v30[1], 125))
                return 131083;
              if (v30[2] >= v30[1])
              {
                v21 = &v22[-v30[1]];
                if ((unint64_t)&v22[-v30[1]] <= v30[2] - v30[1])
                {
                  a3[5] = v30[1];
                  a3[6] = (unint64_t)v21;
                  if ((ccder_blob_decode_eoc((unint64_t *)&v22, HIBYTE(v31)) & 1) == 0)
                    return 131084;
                  if (!ccder_blob_decode_eoc((unint64_t *)&v22, v27))
                    return 65541;
                  if (v22 <= v25 && v24 <= v22)
                  {
                    v24 = v22;
                    if (ccder_blob_decode_eoc((unint64_t *)&v24, HIBYTE(v27)))
                    {
                      if ((a4 & 1) == 0 && v24 != v29)
                        return 65543;
                      return 0;
                    }
                    return (v4 + 5);
                  }
                }
              }
            }
LABEL_112:
            __break(0x5519u);
            return (v4 + 5);
          }
        }
        goto LABEL_114;
      }
    }
    else
    {
      return 65538;
    }
  }
  return result;
}

uint64_t ccder_blob_decode_ber_tl(uint64_t a1, uint64_t a2, _BYTE *a3, unint64_t *a4)
{
  int v8;
  uint64_t result;

  v8 = ccder_blob_decode_tag();
  result = 0;
  if (v8)
  {
    if (a2 == 0xAAAAAAAAAAAAAAAALL)
      return ccder_blob_decode_ber_len(a1, a3, a4);
  }
  return result;
}

uint64_t ccder_blob_decode_eoc(unint64_t *a1, int a2)
{
  uint64_t result;
  unint64_t v4;
  unint64_t v5;

  if (!a2)
    return 1;
  result = ccder_blob_decode_tl();
  if (!(_DWORD)result)
    return result;
  v4 = *a1;
  if (*a1 >= 0x5555555555555556)
  {
    __break(0x5513u);
LABEL_12:
    __break(0x5519u);
    return result;
  }
  v5 = v4 - 0x5555555555555556;
  if (v4 > v4 - 0x5555555555555556 || v5 > a1[1])
    goto LABEL_12;
  *a1 = v5;
  return 1;
}

uint64_t CMSParseContentInfoSignedData(char *a1, uint64_t a2, unint64_t *a3)
{
  return CMSParseContentInfoSignedDataWithOptions(a1, a2, a3, 0);
}

uint64_t CMSParseSignerInfos(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, __int128 *))
{
  uint64_t v3;
  unint64_t v4;
  unsigned int v6;
  int v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int *digest;
  int *v14;
  unsigned int v15;
  uint64_t result;
  unint64_t v17;
  unsigned int v18;
  uint64_t v19;
  _OWORD *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  int v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  int *v33;
  unsigned int v34;
  unint64_t v35;
  _OWORD *v36;
  unint64_t v37;
  BOOL v38;
  unint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  unsigned int v48;
  int v49;
  uint64_t v50;
  _OWORD *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  unsigned __int8 v60;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unsigned __int8 v71;
  unint64_t v72;
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
  __int128 v83;
  unint64_t v84;
  unint64_t v85;
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  v84 = 0xAAAAAAAAAAAAAAAALL;
  v85 = 0xAAAAAAAAAAAAAAAALL;
  v4 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  if (__CFADD__(v4, v3))
    goto LABEL_93;
  if (v4 > v4 + v3)
    goto LABEL_92;
  v84 = *(_QWORD *)(a1 + 40);
  v85 = v4 + v3;
  v72 = 0xAAAAAAAAAAAAAAAALL;
  if (v4 >= v4 + v3)
  {
    v48 = 0;
    result = 0;
    if (v3)
      return (v48 << 8) | 0x30008;
    return result;
  }
  v6 = 0;
  v60 = 0;
  v7 = 256;
  while (1)
  {
    v71 = 0;
    v82 = 0u;
    v83 = 0u;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    DWORD2(v83) = 327681;
    LOBYTE(v82) = v6 + 1;
    if ((ccder_blob_decode_ber_tl((uint64_t)&v84, 0x2000000000000010, &v71, &v72) & 1) == 0)
    {
      v49 = 196609;
      return v7 | v49;
    }
    v69 = 0xAAAAAAAAAAAAAAAALL;
    v70 = 0xAAAAAAAAAAAAAAAALL;
    if (__CFADD__(v84, v72))
      goto LABEL_93;
    if (v84 > v84 + v72 || v84 + v72 > v85)
      goto LABEL_92;
    v69 = v84;
    v70 = v84 + v72;
    if ((ccder_blob_decode_uint64() & 1) == 0)
    {
      v49 = 196610;
      return v7 | v49;
    }
    v9 = v69;
    v8 = v70;
    v67 = 0xAAAAAAAAAAAAAAAALL;
    v68 = 0xAAAAAAAAAAAAAAAALL;
    if (v69 > v70)
      goto LABEL_92;
    v67 = v69;
    v68 = v70;
    v65 = v69;
    v66 = v70;
    if (!ccder_blob_decode_tl())
      break;
    v10 = v69;
LABEL_19:
    if (__CFADD__(v72, v10 - v9))
      goto LABEL_94;
    if (v72 + v10 - v9 > v8 - v9)
      goto LABEL_92;
    *((_QWORD *)&v73 + 1) = v9;
    *(_QWORD *)&v74 = v72 + v10 - v9;
    if (__CFADD__(v10, v72))
      goto LABEL_93;
    if (v10 > v10 + v72 || v10 + v72 > v70)
      goto LABEL_92;
    v69 = v10 + v72;
    if (!ccder_blob_decode_AlgorithmIdentifierNULL(&v69, (unint64_t *)&v74 + 1))
    {
      v49 = 196612;
      return v7 | v49;
    }
    v63 = 0xAAAAAAAAAAAAAAAALL;
    v64 = 0xAAAAAAAAAAAAAAAALL;
    if (v69 > v70)
      goto LABEL_92;
    v63 = v69;
    v64 = v70;
    if (ccder_blob_decode_tl())
    {
      if (v64 < v63 || v72 > v64 - v63)
        goto LABEL_92;
      *((_QWORD *)&v75 + 1) = v63;
      *(_QWORD *)&v76 = v72;
      if (__CFADD__(v63, v72))
        goto LABEL_93;
      if (v63 > v63 + v72 || v63 + v72 > v64)
        goto LABEL_92;
      v69 = v63 + v72;
      v70 = v64;
    }
    else
    {
      *((_QWORD *)&v75 + 1) = 0;
      *(_QWORD *)&v76 = 0;
    }
    if ((ccder_blob_decode_AlgorithmIdentifierNULL(&v69, (unint64_t *)&v76 + 1) & 1) == 0)
    {
      v49 = 196613;
      return v7 | v49;
    }
    if ((ccder_blob_decode_tl() & 1) == 0)
    {
      v49 = 196614;
      return v7 | v49;
    }
    if (v70 < v69 || v72 > v70 - v69)
      goto LABEL_92;
    *((_QWORD *)&v78 + 1) = v69;
    *(_QWORD *)&v79 = v72;
    if (__CFADD__(v69, v72))
      goto LABEL_93;
    v12 = v69 + v72;
    if (v69 > v69 + v72 || v12 > v70)
      goto LABEL_92;
    v69 += v72;
    v63 = v12;
    v64 = v70;
    if (ccder_blob_eat_ber_inner(&v63, 0xA000000000000001, 0, 125))
    {
      if (v63 > v64)
        goto LABEL_92;
      v69 = v63;
      v70 = v64;
    }
    if ((ccder_blob_decode_eoc(&v69, v71) & 1) == 0)
    {
      v49 = 196615;
      return v7 | v49;
    }
    digest = find_digest((uint64_t)&v74 + 8);
    if (digest)
    {
      v14 = digest;
      v15 = *(_DWORD *)(a1 + 96);
      if (!v15 || *digest <= v15)
      {
        result = a3(a2, a1, &v73);
        if ((_DWORD)result != 327710)
        {
          if ((_DWORD)result)
            return result;
          v17 = *(_QWORD *)(a1 + 64);
          if (v17 <= v60)
          {
            if (v17)
            {
              v29 = v60 - 1;
              v30 = *(_QWORD *)(a1 + 56);
              v31 = 176 * v29;
              if (__CFADD__(v30, v31))
                goto LABEL_93;
              v32 = v30 + 176 * v29;
              if (v32 >= v30 + 176 * v17 || v32 < v30)
                goto LABEL_92;
              v33 = find_digest(v30 + 176 * v29 + 24);
              if (v33)
              {
                if (*v14 > *v33)
                {
                  v34 = *(_DWORD *)(a1 + 96);
                  if (!v34 || *v14 <= v34)
                  {
                    v35 = *(_QWORD *)(a1 + 56);
                    if (__CFADD__(v35, v31))
                      goto LABEL_93;
                    v36 = (_OWORD *)(v35 + 176 * v29);
                    v37 = v35 + 176 * *(_QWORD *)(a1 + 64);
                    v38 = v37 >= (unint64_t)v36;
                    v39 = v37 - (_QWORD)v36;
                    if (!v38 || v35 > (unint64_t)v36 || v39 < 0xB0)
                      goto LABEL_92;
                    v40 = v73;
                    v41 = v75;
                    v36[1] = v74;
                    v36[2] = v41;
                    *v36 = v40;
                    v42 = v76;
                    v43 = v77;
                    v44 = v79;
                    v36[5] = v78;
                    v36[6] = v44;
                    v36[3] = v42;
                    v36[4] = v43;
                    v45 = v80;
                    v46 = v81;
                    v47 = v83;
                    v36[9] = v82;
                    v36[10] = v47;
                    v36[7] = v45;
                    v36[8] = v46;
                  }
                }
              }
            }
          }
          else
          {
            v18 = *(_DWORD *)(a1 + 96);
            if (!v18 || *v14 <= v18)
            {
              v19 = *(_QWORD *)(a1 + 56);
              if (__CFADD__(v19, 176 * (char)v60))
                goto LABEL_93;
              v20 = (_OWORD *)(v19 + 176 * v60);
              if (176 * v17 - 176 * v60 < 0xB0)
                goto LABEL_92;
              v21 = v73;
              v22 = v75;
              v20[1] = v74;
              v20[2] = v22;
              *v20 = v21;
              v23 = v76;
              v24 = v77;
              v25 = v79;
              v20[5] = v78;
              v20[6] = v25;
              v20[3] = v23;
              v20[4] = v24;
              v26 = v80;
              v27 = v81;
              v28 = v83;
              v20[9] = v82;
              v20[10] = v28;
              v20[7] = v26;
              v20[8] = v27;
              if (v60 == 0xFF)
              {
                __break(0x5507u);
                return result;
              }
              ++v60;
            }
          }
        }
      }
    }
    if (v69 > v85 || v84 > v69)
      goto LABEL_92;
    v84 = v69;
    v48 = v6 + 1;
    if (v6 <= 6)
    {
      v7 += 256;
      ++v6;
      if (v69 < v85)
        continue;
    }
    if (v69 == v85)
    {
      if (v60)
        return 0;
      v50 = *(_QWORD *)(a1 + 64);
      if (!v50)
        return 0;
      if ((unint64_t)(176 * v50) >= 0xB0)
      {
        result = 0;
        v51 = *(_OWORD **)(a1 + 56);
        v52 = v73;
        v53 = v75;
        v51[1] = v74;
        v51[2] = v53;
        *v51 = v52;
        v54 = v76;
        v55 = v77;
        v56 = v79;
        v51[5] = v78;
        v51[6] = v56;
        v51[3] = v54;
        v51[4] = v55;
        v57 = v80;
        v58 = v81;
        v59 = v83;
        v51[9] = v82;
        v51[10] = v59;
        v51[7] = v57;
        v51[8] = v58;
        return result;
      }
LABEL_92:
      __break(0x5519u);
LABEL_93:
      __break(0x5513u);
LABEL_94:
      __break(0x5500u);
    }
    return (v48 << 8) | 0x30008;
  }
  if ((ccder_blob_decode_tl() & 1) != 0)
  {
    v10 = v67;
    v11 = v68;
LABEL_17:
    if (v10 > v11)
      goto LABEL_92;
    v69 = v10;
    v70 = v11;
    goto LABEL_19;
  }
  if (ccder_blob_decode_tl())
  {
    v10 = v65;
    v11 = v66;
    goto LABEL_17;
  }
  v49 = 196611;
  return v7 | v49;
}

uint64_t CMSBuildPath(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t CertificateUsingKeyIdentifier;
  uint64_t v13;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v20 = 0xAAAAAAAAAAAAAAAALL;
  v21 = 0xAAAAAAAAAAAAAAAALL;
  v3 = *(_QWORD *)(a3 + 8);
  v4 = *(_QWORD *)(a3 + 16);
  if (__CFADD__(v3, v4))
LABEL_49:
    __break(0x5513u);
  v5 = v3 + v4;
  if (v3 > v5)
    goto LABEL_48;
  v20 = *(_QWORD *)(a3 + 8);
  v21 = v5;
  v19 = 0xAAAAAAAAAAAAAAAALL;
  if (*(_QWORD *)a3 != 3)
  {
    if (*(_QWORD *)a3 != 1)
      return 524289;
    v8 = 524293;
    if (!ccder_blob_decode_tl())
      return 524290;
    if (!ccder_blob_decode_tl())
      return 524291;
    if (v21 >= v20 && v19 <= v21 - v20)
    {
      v15 = v20;
      v16 = v19;
      if (__CFADD__(v20, v19))
        goto LABEL_49;
      if (v20 <= v20 + v19 && v20 + v19 <= v21)
      {
        v20 += v19;
        if (!ccder_blob_decode_tl())
          return 524292;
        if (v21 >= v20 && v19 <= v21 - v20)
        {
          v17 = v20;
          v18 = v19;
          if (__CFADD__(v20, v19))
            goto LABEL_49;
          if (v20 <= v20 + v19 && v20 + v19 <= v21)
          {
            v20 += v19;
            v9 = *(_QWORD **)(a2 + 24);
            if (!v9)
              return v8;
            while (compare_octet_string((uint64_t)&v15, (uint64_t)(v9 + 15))
                 || compare_octet_string((uint64_t)&v17, (uint64_t)(v9 + 17)))
            {
              v9 = (_QWORD *)v9[34];
              if (!v9)
                return v8;
            }
            goto LABEL_36;
          }
        }
      }
    }
    goto LABEL_48;
  }
  if (*(_QWORD *)(a2 + 88) == 1)
    return 524298;
  v15 = v3;
  v16 = v5;
  if (ccder_blob_decode_tl())
  {
    v11 = v20;
    v10 = v21;
    goto LABEL_29;
  }
  v8 = 524294;
  if (!ccder_blob_decode_tl() || !ccder_blob_decode_tl())
    return v8;
  v11 = v15;
  v10 = v16;
  if (v15 > v16)
  {
LABEL_48:
    __break(0x5519u);
    goto LABEL_49;
  }
  v20 = v15;
  v21 = v16;
LABEL_29:
  if (v10 < v11 || v19 > v10 - v11)
    goto LABEL_48;
  v17 = v11;
  v18 = v19;
  if (__CFADD__(v11, v19))
    goto LABEL_49;
  if (v11 > v11 + v19 || v11 + v19 > v10)
    goto LABEL_48;
  v20 = v11 + v19;
  CertificateUsingKeyIdentifier = X509ChainGetCertificateUsingKeyIdentifier((uint64_t *)(a2 + 24), (uint64_t)&v17);
  if (!CertificateUsingKeyIdentifier)
    return 524295;
  v9 = (_QWORD *)CertificateUsingKeyIdentifier;
LABEL_36:
  if (v20 != v21)
    return 524543;
  v13 = X509ChainBuildPath(v9, (uint64_t *)(a2 + 24), (_QWORD *)(a3 + 152));
  v8 = v13;
  if (*(_DWORD *)(a3 + 168) == 327681)
    *(_DWORD *)(a3 + 168) = v13;
  return v8;
}

uint64_t validateSignerInfo(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  __int128 *v6;
  int *digest;
  unint64_t *v8;
  unint64_t *v9;
  _OWORD *v10;
  unint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t result;
  _QWORD *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int v20;
  uint64_t v21;
  int v22;
  int v23;
  unsigned int v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28[2];
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  _OWORD v34[4];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = (__int128 *)(a3 + 24);
  digest = find_digest(a3 + 24);
  if (!digest)
    return 327682;
  v8 = (unint64_t *)(*((uint64_t (**)(void))digest + 3))();
  v9 = v8;
  memset(v34, 0, sizeof(v34));
  v10 = (_OWORD *)a2[13];
  v11 = a2[14];
  if (v10)
    v12 = v11 == 0;
  else
    v12 = 1;
  if (v12)
  {
    if (a2[9] && a2[10])
    {
      v10 = v34;
      v13 = ccdigest();
      v11 = *v9;
      if (*v9 >= 0x41)
        goto LABEL_55;
      goto LABEL_16;
    }
    if (!v10)
      goto LABEL_31;
  }
  if (*v8 != v11)
  {
LABEL_31:
    *(_DWORD *)(a3 + 168) = 327710;
    return 327710;
  }
  if (v11 > 0x40)
    goto LABEL_55;
  v13 = __memcpy_chk();
LABEL_16:
  *(_QWORD *)(a3 + 128) = v10;
  *(_QWORD *)(a3 + 136) = v11;
  v15 = (_QWORD *)(a3 + 128);
  v16 = *(_QWORD *)(a3 + 48);
  if (!v16)
  {
    result = CMSBuildPath(v13, (uint64_t)a2, a3);
    switch((int)result)
    {
      case 524293:
      case 524295:
        *(_DWORD *)(a3 + 168) = result;
        return 0;
      case 524294:
        goto LABEL_52;
      case 524296:
        if (*(_DWORD *)(a3 + 168) != 458753)
          goto LABEL_43;
        v20 = 524296;
LABEL_42:
        *(_DWORD *)(a3 + 168) = v20;
LABEL_43:
        v21 = *v9;
        if (*v9 > 0x40)
          goto LABEL_55;
        v28[0] = (uint64_t)v34;
        v28[1] = v21;
        result = X509CertificateCheckSignatureDigest(29, *(_QWORD *)(a3 + 152), v28, v6, (__int128 *)(a3 + 88));
        if (!(_DWORD)result || (_DWORD)result == 655648 || (_DWORD)result == 655632)
        {
          v22 = *(_DWORD *)(a3 + 168);
          if (!v22 || v22 == 458753 || v22 == 327681)
            *(_DWORD *)(a3 + 168) = result;
          result = 0;
        }
        break;
      case 524297:
        v20 = 524297;
        goto LABEL_42;
      default:
        if ((_DWORD)result)
          goto LABEL_52;
        goto LABEL_43;
    }
    goto LABEL_52;
  }
  v25 = a1;
  v32 = 0xAAAAAAAAAAAAAAAALL;
  v33 = 0xAAAAAAAAAAAAAAAALL;
  v17 = *(_QWORD *)(a3 + 40);
  if (__CFADD__(v17, v16))
LABEL_56:
    __break(0x5513u);
  v18 = v17 + v16;
  if (v17 > v18)
    goto LABEL_55;
  v32 = *(_QWORD *)(a3 + 40);
  v33 = v18;
  v31 = 0xAAAAAAAAAAAAAAAALL;
  if (v17 >= v18)
  {
    result = 262156;
    goto LABEL_52;
  }
  v27 = 0x2000000000000010;
  v24 = 262146;
  v26 = 262147;
  v23 = 458754;
  if (!ccder_blob_decode_tl())
  {
    result = 262145;
    goto LABEL_52;
  }
  if (__CFADD__(v32, v31))
    goto LABEL_56;
  v30 = 0xAAAAAAAAAAAAAAAALL;
  v29 = 0xAAAAAAAAAAAAAAAALL;
  if (v32 > v32 + v31 || v32 + v31 > v33)
  {
LABEL_55:
    __break(0x5519u);
    goto LABEL_56;
  }
  v29 = v32;
  v30 = v32 + v31;
  if (ccder_blob_decode_tl())
  {
    if (__CFADD__(v29, v31))
      goto LABEL_56;
    if (v29 <= v29 + v31 && v29 + v31 <= v30)
    {
      v29 += v31;
      result = 262150;
      goto LABEL_52;
    }
    goto LABEL_55;
  }
  result = v24;
LABEL_52:
  if ((_OWORD *)*v15 == v34)
  {
    *v15 = 0;
    *(_QWORD *)(a3 + 136) = 0;
  }
  return result;
}

uint64_t validateSignerInfoAndChain(uint64_t *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  int v7;

  v5 = validateSignerInfo((uint64_t)a1, a2, a3);
  if (!(_DWORD)v5)
  {
    v7 = X509ChainCheckPath(29, (uint64_t *)(a3 + 152), *a1);
    if (v7)
    {
      if (!*(_DWORD *)(a3 + 168))
        *(_DWORD *)(a3 + 168) = v7;
    }
  }
  return v5;
}

uint64_t CMSVerifySignedDataWithLeaf(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6, _QWORD *a7)
{
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v8 = 0;
  v9[0] = 0;
  return CMSVerify(a1, a2, a3, a4, a5, a6, a7, &v8, v9);
}

uint64_t CMSVerify(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6, _QWORD *a7, _QWORD *a8, _QWORD *a9)
{
  uint64_t result;
  uint64_t v18;
  _OWORD v19[9];
  __int128 v20;
  __int128 v21;
  unint64_t v22[2];
  __int128 v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  _OWORD *v27;
  _OWORD v28[3];
  uint64_t v29;
  _QWORD v30[2];
  _BYTE __b[1216];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v29 = 0;
  v30[0] = 0;
  memset(v28, 0, sizeof(v28));
  v26 = 0;
  v25 = 0;
  v23 = 0u;
  v24 = (char *)&v23 + 8;
  v30[1] = 0;
  memset(__b, 170, sizeof(__b));
  v22[0] = 4;
  v22[1] = (unint64_t)__b;
  v20 = 0u;
  v21 = 0u;
  memset(v19, 0, sizeof(v19));
  v27 = v19;
  *(_QWORD *)&v28[0] = 1;
  DWORD2(v21) = 327681;
  if (a2 < 0)
    goto LABEL_19;
  result = CMSParseContentInfoSignedDataWithOptions(a1, a2, v22, 0);
  if ((_DWORD)result)
    return result;
  if (!a4)
    goto LABEL_7;
  result = 131091;
  if (*(_OWORD *)((char *)v28 + 8) != 0)
    return result;
  if (a4 < 0)
LABEL_19:
    __break(0x5519u);
  *((_QWORD *)&v28[0] + 1) = a3;
  *(_QWORD *)&v28[1] = a4;
LABEL_7:
  v30[0] = a5;
  DWORD2(v21) = 458753;
  result = CMSParseSignerInfos((uint64_t)v22, (uint64_t)v30, (uint64_t (*)(uint64_t, uint64_t, __int128 *))validateSignerInfoAndChain);
  if (!(_DWORD)result)
  {
    result = DWORD2(v21);
    if (!DWORD2(v21))
    {
      if (a6 && a7)
        result = X509CertificateParseKey(*((uint64_t *)&v20 + 1), a6, a7);
      if (!a4)
      {
        if (a8)
        {
          if (a9)
          {
            v18 = *(_QWORD *)&v28[1];
            if (*(_QWORD *)&v28[1])
            {
              if (*((_QWORD *)&v28[0] + 1))
              {
                *a8 = *((_QWORD *)&v28[0] + 1);
                *a9 = v18;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t CMSVerifySignedData(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v6 = 0;
  v7 = 0;
  v9[0] = 0;
  v8 = 0;
  return CMSVerify(a1, a2, a3, a4, a5, &v6, &v7, &v8, v9);
}

uint64_t CMSVerifyAndReturnSignedData(char *a1, uint64_t a2, _QWORD *a3, _QWORD *a4, uint64_t a5)
{
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6 = 0;
  v7[0] = 0;
  return CMSVerify(a1, a2, 0, 0, a5, &v6, v7, a3, a4);
}

uint64_t ccder_blob_decode_ber_len(uint64_t result, _BYTE *a2, unint64_t *a3)
{
  unsigned __int8 *v3;
  unint64_t v4;
  unsigned __int8 *v5;
  unint64_t v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  unint64_t v10;
  uint64_t v11;

  *a2 = 0;
  v3 = *(unsigned __int8 **)result;
  if (!*(_QWORD *)result)
    return 0;
  v4 = *(_QWORD *)(result + 8);
  if ((unint64_t)v3 >= v4)
    return 0;
  if (v3 == (unsigned __int8 *)-1)
    goto LABEL_42;
  v5 = v3 + 1;
  if (v3 >= v3 + 1 || (unint64_t)v5 > v4)
  {
LABEL_41:
    __break(0x5519u);
LABEL_42:
    __break(0x5513u);
    return result;
  }
  *(_QWORD *)result = v5;
  v7 = *v3;
  if ((char)*v3 < 0)
  {
    switch(*v3)
    {
      case 0x80u:
        v7 = v4 - (_QWORD)v5;
        *a2 = 1;
        break;
      case 0x81u:
        if ((uint64_t)(v4 - (_QWORD)v5) < 1)
          return 0;
        if (v3 == (unsigned __int8 *)-2)
          goto LABEL_42;
        v8 = v3 + 2;
        if (v5 > v8 || (unint64_t)v8 > v4)
          goto LABEL_41;
        *(_QWORD *)result = v8;
        v7 = *v5;
        v5 = v8;
        break;
      case 0x82u:
        if ((uint64_t)(v4 - (_QWORD)v5) < 2)
          return 0;
        if ((unint64_t)v5 >= v4)
          goto LABEL_41;
        if (v3 == (unsigned __int8 *)-2)
          goto LABEL_42;
        if (v3 + 2 < v5 || (unint64_t)(v3 + 2) >= v4)
          goto LABEL_41;
        if ((unint64_t)v5 > 0xFFFFFFFFFFFFFFFDLL)
          goto LABEL_42;
        v9 = v3 + 3;
        if (v5 > v3 + 3 || (unint64_t)v9 > v4)
          goto LABEL_41;
        v10 = (unint64_t)v3[1] << 8;
        v11 = v3[2];
        goto LABEL_40;
      case 0x83u:
        if ((uint64_t)(v4 - (_QWORD)v5) < 3)
          return 0;
        if ((unint64_t)v5 >= v4)
          goto LABEL_41;
        if (v3 == (unsigned __int8 *)-2)
          goto LABEL_42;
        if (v3 + 2 < v5 || (unint64_t)(v3 + 2) >= v4)
          goto LABEL_41;
        if ((unint64_t)v5 > 0xFFFFFFFFFFFFFFFDLL)
          goto LABEL_42;
        if (v3 + 3 < v5 || (unint64_t)(v3 + 3) >= v4)
          goto LABEL_41;
        if ((unint64_t)v5 > 0xFFFFFFFFFFFFFFFCLL)
          goto LABEL_42;
        v9 = v3 + 4;
        if (v5 > v3 + 4 || (unint64_t)v9 > v4)
          goto LABEL_41;
        v10 = ((unint64_t)v3[1] << 16) | ((unint64_t)v3[2] << 8);
        v11 = v3[3];
LABEL_40:
        v7 = v10 | v11;
        *(_QWORD *)result = v9;
        v5 = v9;
        break;
      default:
        return 0;
    }
  }
  if (v4 - (unint64_t)v5 < v7)
    return 0;
  *a3 = v7;
  return 1;
}

uint64_t CMSParseImplicitCertificateSet(unint64_t *a1, unint64_t a2, unint64_t a3, unint64_t *a4, unint64_t *a5)
{
  unint64_t v5;
  unint64_t v6;
  BOOL v7;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  BOOL v16;
  unint64_t *v17;
  unint64_t v18;
  unint64_t **v19;
  unint64_t **v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t *v23;
  unint64_t v25;
  unint64_t **v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v31 = 0xAAAAAAAAAAAAAAAALL;
  v32 = 0xAAAAAAAAAAAAAAAALL;
  *a4 = 0;
  a4[1] = 0;
  v30 = 0xAAAAAAAAAAAAAAAALL;
  v5 = *a1;
  v6 = a1[1];
  if (*a1 > v6)
  {
LABEL_43:
    __break(0x5519u);
LABEL_44:
    __break(0x5513u);
  }
  v30 = *a1;
  v31 = v6;
  v7 = v5 >= v6 || a3 == 0;
  if (v7)
  {
    v12 = 0;
LABEL_8:
    if (a5)
      *a5 = v12;
    return 1;
  }
  else
  {
    v12 = 0;
    v13 = 304 * a3;
    v14 = a2 + 304 * a3;
    v25 = ~a2;
    v27 = (unint64_t **)(a4 + 1);
    v23 = (unint64_t *)(a2 + 272);
    v15 = a2;
    while (1)
    {
      v29 = 0;
      if (!ccder_blob_decode_tag())
        return 0;
      if (!v32)
        goto LABEL_8;
      if (!ccder_blob_decode_ber_len((uint64_t)&v30, &v29, &v28) || v29 || v32 != 0x2000000000000010)
        return 0;
      if ((unsigned __int128)((uint64_t)v12 * (__int128)304) >> 64 != (uint64_t)(304 * v12) >> 63 || 304 * v12 > v25)
        goto LABEL_44;
      if (v15 > v14)
        goto LABEL_43;
      if (v15 < a2)
        goto LABEL_43;
      v16 = v13 >= 0x130;
      v13 -= 304;
      if (!v16)
        goto LABEL_43;
      *(_OWORD *)(v15 + 272) = 0u;
      *(_OWORD *)(v15 + 288) = 0u;
      *(_OWORD *)(v15 + 240) = 0u;
      *(_OWORD *)(v15 + 256) = 0u;
      *(_OWORD *)(v15 + 208) = 0u;
      *(_OWORD *)(v15 + 224) = 0u;
      *(_OWORD *)(v15 + 176) = 0u;
      *(_OWORD *)(v15 + 192) = 0u;
      *(_OWORD *)(v15 + 144) = 0u;
      *(_OWORD *)(v15 + 160) = 0u;
      *(_OWORD *)(v15 + 112) = 0u;
      *(_OWORD *)(v15 + 128) = 0u;
      *(_OWORD *)(v15 + 80) = 0u;
      *(_OWORD *)(v15 + 96) = 0u;
      *(_OWORD *)(v15 + 48) = 0u;
      *(_OWORD *)(v15 + 64) = 0u;
      *(_OWORD *)(v15 + 16) = 0u;
      *(_OWORD *)(v15 + 32) = 0u;
      *(_OWORD *)v15 = 0u;
      if (v12)
      {
        if (v15 + 304 > v14)
          goto LABEL_43;
        *(_QWORD *)(v15 + 272) = 0;
        v17 = *v27;
        *(_QWORD *)(v15 + 280) = *v27;
        if (v15)
        {
          if (v15 >= v14)
            goto LABEL_43;
        }
        *v17 = v15;
        *v27 = (unint64_t *)(v15 + 272);
      }
      else
      {
        if (v15 + 304 > v14)
          goto LABEL_43;
        v18 = *a4;
        *v23 = *a4;
        v19 = (unint64_t **)(v18 + 280);
        v7 = v18 == 0;
        v20 = v27;
        if (!v7)
          v20 = v19;
        *v20 = v23;
        if (v15)
        {
          if (v15 >= v14)
            goto LABEL_43;
        }
        *a4 = v15;
        *(_QWORD *)(a2 + 280) = a4;
      }
      if (X509CertificateParseImplicit(v15, &v30, 0, 0))
        return 0;
      if (v6 < v5)
        goto LABEL_43;
      v21 = v30;
      v22 = v30 - v5;
      if (v30 - v5 > v6 - v5)
        goto LABEL_43;
      if (v15 + 304 > v14)
        goto LABEL_43;
      *(_QWORD *)v15 = v5;
      *(_QWORD *)(v15 + 8) = v22;
      v6 = v31;
      if (v21 > v31)
        goto LABEL_43;
      *a1 = v21;
      a1[1] = v6;
      ++v12;
      if (v21 < v6)
      {
        v15 += 304;
        v5 = v21;
        if (v12 < a3)
          continue;
      }
      goto LABEL_8;
    }
  }
}

uint64_t ccder_blob_eat_ber_inner(unint64_t *a1, uint64_t a2, unint64_t *a3, int a4)
{
  int v8;
  uint64_t result;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v15 = 0;
  v14 = 0xAAAAAAAAAAAAAAAALL;
  v8 = ccder_blob_decode_tag();
  result = 0;
  if (v8 && v14 == a2)
  {
    v13 = 0xAAAAAAAAAAAAAAAALL;
    result = ccder_blob_decode_ber_len((uint64_t)a1, &v15, &v13);
    if ((result & 1) == 0)
      return 0;
    if (a3)
    {
      v10 = a1[1];
      if (*a1 > v10)
        goto LABEL_18;
      *a3 = *a1;
      a3[1] = v10;
    }
    if (v15)
    {
      if (a4 >= 1)
      {
        result = ccder_blob_eat_ber_inner(a1, 0, 0, (char)(a4 - 1));
        if (!(_DWORD)result)
          return result;
        return (ccder_blob_decode_eoc(a1, 1) & 1) != 0;
      }
      return 0;
    }
    v11 = *a1;
    if (__CFADD__(*a1, v13))
    {
LABEL_19:
      __break(0x5513u);
      return result;
    }
    v12 = v11 + v13;
    if (v11 <= v11 + v13 && v12 <= a1[1])
    {
      *a1 = v12;
      return 1;
    }
LABEL_18:
    __break(0x5519u);
    goto LABEL_19;
  }
  return result;
}

uint64_t compare_octet_string(uint64_t a1, uint64_t a2)
{
  size_t v2;
  size_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  if (v2 == v3)
    return memcmp(*(const void **)a1, *(const void **)a2, v2);
  if (v2 > v3)
    return 0xFFFFFFFFLL;
  return 1;
}

uint64_t compare_octet_string_raw(uint64_t a1, const void *a2, size_t a3)
{
  size_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  if (v3 == a3)
    return memcmp(*(const void **)a1, a2, a3);
  if (v3 > a3)
    return 0xFFFFFFFFLL;
  return 1;
}

uint64_t compare_octet_string_partial(uint64_t a1, uint64_t a2)
{
  size_t v2;

  v2 = *(_QWORD *)(a1 + 8);
  if (v2 <= *(_QWORD *)(a2 + 8))
    return memcmp(*(const void **)a2, *(const void **)a1, v2);
  else
    return 0xFFFFFFFFLL;
}

uint64_t ccder_blob_decode_AlgorithmIdentifierNULL(unint64_t *a1, unint64_t *a2)
{
  uint64_t result;
  unint64_t v5;
  unint64_t v6;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    if (*a1 > a1[1])
      goto LABEL_20;
    v5 = *a1;
    v6 = *a1;
    result = ccder_blob_decode_tl();
    if (!(_DWORD)result)
      return result;
    if (a2)
    {
      if (v6 < v5)
        goto LABEL_20;
      *a2 = v5;
      a2[1] = 0;
    }
    if (v5 == v6)
    {
      if (v5 <= a1[1] && *a1 <= v5)
      {
        *a1 = v5;
        return 1;
      }
    }
    else if (v5 <= v6)
    {
      result = ccder_blob_decode_tl();
      if (!(_DWORD)result)
        return result;
      if (v5 != v6)
        return 0;
      if (v5 <= a1[1] && *a1 <= v5)
      {
        *a1 = v5;
        return 1;
      }
    }
LABEL_20:
    __break(0x5519u);
  }
  return result;
}

uint64_t ccder_blob_decode_Time(_QWORD *a1)
{
  if (*a1 > a1[1])
    goto LABEL_6;
  if ((ccder_blob_decode_tl() & 1) != 0)
    return 0;
  if (*a1 > a1[1])
LABEL_6:
    __break(0x5519u);
  ccder_blob_decode_tl();
  return 0;
}

uint64_t ccder_blob_decode_GeneralName(unint64_t *a1, int *a2, unint64_t *a3)
{
  uint64_t result;
  unint64_t v7;
  int v8;
  int v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;

  result = 0;
  if (a2 && a3)
  {
    *a3 = 0;
    a3[1] = 0;
    if (*a1 > a1[1])
      goto LABEL_42;
    v10 = *a1;
    if (ccder_blob_decode_tl())
    {
      *a2 = 0;
LABEL_6:
      v7 = v10;
LABEL_16:
      if (v7 <= a1[1] && *a1 <= v7)
      {
        *a1 = v7;
        return 1;
      }
LABEL_42:
      __break(0x5519u);
    }
    if (*a1 > a1[1])
      goto LABEL_42;
    v11 = *a1;
    v16 = a1[1];
    if (ccder_blob_decode_tl())
    {
      v7 = v11;
      if (v16 < v11)
        goto LABEL_42;
      *a3 = v11;
      a3[1] = 0;
      v8 = 1;
LABEL_15:
      *a2 = v8;
      goto LABEL_16;
    }
    if (*a1 > a1[1])
      goto LABEL_42;
    v12 = *a1;
    v17 = a1[1];
    if (ccder_blob_decode_tl())
    {
      v7 = v12;
      if (v17 < v12)
        goto LABEL_42;
      *a3 = v12;
      a3[1] = 0;
      v8 = 2;
      goto LABEL_15;
    }
    if (*a1 > a1[1])
      goto LABEL_42;
    v10 = *a1;
    if (ccder_blob_decode_tl())
    {
      v9 = 3;
LABEL_23:
      *a2 = v9;
      goto LABEL_6;
    }
    if (*a1 > a1[1])
      goto LABEL_42;
    v13 = *a1;
    v18 = a1[1];
    if (ccder_blob_decode_tl())
    {
      v7 = v13;
      if (v18 < v13)
        goto LABEL_42;
      *a3 = v13;
      a3[1] = 0;
      v8 = 4;
      goto LABEL_15;
    }
    if (*a1 > a1[1])
      goto LABEL_42;
    v10 = *a1;
    if (ccder_blob_decode_tl())
    {
      v9 = 5;
      goto LABEL_23;
    }
    if (*a1 > a1[1])
      goto LABEL_42;
    v14 = *a1;
    v19 = a1[1];
    if (ccder_blob_decode_tl())
    {
      v7 = v14;
      if (v19 < v14)
        goto LABEL_42;
      *a3 = v14;
      a3[1] = 0;
      v8 = 6;
      goto LABEL_15;
    }
    if (*a1 > a1[1])
      goto LABEL_42;
    v15 = *a1;
    v20 = a1[1];
    if (ccder_blob_decode_tl())
    {
      v7 = v15;
      if (v20 < v15)
        goto LABEL_42;
      *a3 = v15;
      a3[1] = 0;
      v8 = 7;
      goto LABEL_15;
    }
    if (*a1 > a1[1])
      goto LABEL_42;
    v10 = *a1;
    result = ccder_blob_decode_tl();
    if ((_DWORD)result)
    {
      v9 = 8;
      goto LABEL_23;
    }
  }
  return result;
}

uint64_t ccder_blob_check_null()
{
  return ccder_blob_decode_tl();
}

uint64_t CTParseCertificateSet(unint64_t a1, unint64_t a2, _OWORD *a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  _OWORD *v10;
  unint64_t v11;
  __int128 v12;
  uint64_t result;
  unint64_t v15;
  unint64_t v16;
  _OWORD v17[19];
  uint64_t v18;

  v6 = 0;
  v18 = *MEMORY[0x24BDAC8D0];
  if (a1 < a2 && a4)
  {
    v8 = 0;
    v9 = a4 - 1;
    v10 = a3;
    v11 = (unint64_t)&a3[a4];
    while (1)
    {
      *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v17[17] = v12;
      v17[18] = v12;
      v17[15] = v12;
      v17[16] = v12;
      v17[13] = v12;
      v17[14] = v12;
      v17[11] = v12;
      v17[12] = v12;
      v17[9] = v12;
      v17[10] = v12;
      v17[7] = v12;
      v17[8] = v12;
      v17[5] = v12;
      v17[6] = v12;
      v17[3] = v12;
      v17[4] = v12;
      v17[1] = v12;
      v17[2] = v12;
      v17[0] = v12;
      v15 = a1;
      v16 = a2;
      result = X509CertificateParse((unint64_t *)v17, &v15);
      if ((_DWORD)result)
        break;
      a1 = v15;
      a2 = v16;
      if (v15 > v16 || (unint64_t)v10 >= v11 || v10 < a3)
        __break(0x5519u);
      *v10 = v17[0];
      v6 = v8 + 1;
      if (a1 < a2)
      {
        ++v10;
        if (v9 != v8++)
          continue;
      }
      goto LABEL_11;
    }
  }
  else
  {
LABEL_11:
    result = 0;
    if (a5)
      *a5 = v6;
  }
  return result;
}

uint64_t CTParseExtensionValue(unint64_t a1, uint64_t a2, const void *a3, size_t a4, _QWORD *a5, _QWORD *a6)
{
  uint64_t result;
  uint64_t v9;
  unint64_t v10[2];
  _OWORD v11[15];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  memset(v11, 0, sizeof(v11));
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5519u);
  }
  if (a1 + a2 < a1)
    goto LABEL_11;
  v10[0] = a1;
  v10[1] = a1 + a2;
  result = X509CertificateParseWithExtension((unint64_t *)v11, v10, a3, a4);
  if (!(_DWORD)result)
  {
    result = 720914;
    if (*((_QWORD *)&v12 + 1))
    {
      v9 = v13;
      if ((_QWORD)v13)
      {
        result = 0;
        if (a5)
        {
          if (a6)
          {
            result = 0;
            *a5 = *((_QWORD *)&v12 + 1);
            *a6 = v9;
          }
        }
      }
    }
  }
  return result;
}

uint64_t CTParseKey(unint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  uint64_t result;
  unint64_t v7[2];
  _OWORD v8[19];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  memset(v8, 0, sizeof(v8));
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_7:
    __break(0x5519u);
  }
  if (a1 + a2 < a1)
    goto LABEL_7;
  v7[0] = a1;
  v7[1] = a1 + a2;
  result = X509CertificateParse((unint64_t *)v8, v7);
  if (!(_DWORD)result)
    return X509CertificateParseKey((uint64_t)v8, a3, a4);
  return result;
}

uint64_t CTEvaluateSavageCertsWithUID(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5, _QWORD *a6, _BYTE *a7, uint64_t a8, BOOL *a9)
{
  return CTEvaluateCertifiedChip(a1, a2, a3, a4, a5, a6, a7, a8, 0, 0, a9, (uint64_t)&X509PolicySavage, 2);
}

uint64_t CTEvaluateCertifiedChip(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5, _QWORD *a6, _BYTE *a7, uint64_t a8, const void *a9, size_t a10, BOOL *a11, uint64_t a12, uint64_t a13)
{
  uint64_t result;
  uint64_t *v22;
  uint64_t v23;
  __int128 *v24;
  unint64_t v25;
  int v26;
  unint64_t v27[2];
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33[4];
  _QWORD __b[154];

  __b[152] = *MEMORY[0x24BDAC8D0];
  result = (uint64_t)memset(__b, 170, 0x4C0uLL);
  memset(v33, 170, sizeof(v33));
  v31 = 0xAAAAAAAAAAAAAAAALL;
  v32 = 0;
  v30 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(a1, a2))
    goto LABEL_34;
  if (a1 + a2 < a1)
    goto LABEL_35;
  v30 = a1;
  v31 = a1 + a2;
  result = (uint64_t)X509ChainParseCertificateSet(&v30, (unint64_t)__b, 4, &v33[2], &v32);
  if ((_DWORD)result)
    return result;
  result = 327690;
  if (v30 != v31)
    return result;
  if (v32 != 2)
    return 327692;
  X509ChainResetChain(v33, &v33[2]);
  __b[74] = v33[0];
  v22 = v33[0] ? (uint64_t *)(v33[0] + 296) : &v33[1];
  *v22 = (uint64_t)&__b[74];
  if ((_QWORD *)((char *)&__b[38] + 1) != 0 && (unint64_t)__b >= 0xFFFFFFFFFFFFFECFLL)
LABEL_34:
    __break(0x5513u);
  v33[0] = (uint64_t)&__b[38];
  __b[75] = v33;
  __b[36] = 0;
  __b[37] = v33[1];
  *(_QWORD *)v33[1] = __b;
  v33[1] = (uint64_t)&__b[36];
  result = X509ChainCheckPathWithOptions(12, v33, a12, 0);
  if ((_DWORD)result)
    return result;
  v23 = **(_QWORD **)(v33[1] + 8);
  v28 = 0xAAAAAAAAAAAAAAAALL;
  v29 = 0xAAAAAAAAAAAAAAAALL;
  if ((a4 & 0x8000000000000000) != 0)
    goto LABEL_35;
  v28 = a3;
  v29 = a4;
  v24 = (__int128 *)oidForPubKeyLength();
  result = X509CertificateCheckSignatureWithPublicKey(&v28, (uint64_t)&ecPublicKey, v24, v23 + 16, (__int128 *)(v23 + 40), (__int128 *)(v23 + 56));
  if ((_DWORD)result)
    return result;
  if (a9 && a10)
  {
    if ((a10 & 0x8000000000000000) != 0)
      goto LABEL_35;
    if (compare_octet_string_raw(v23 + 248, a9, a10))
      return 590085;
  }
  v25 = v33[0];
  LODWORD(result) = X509CertificateParseKey(v33[0], a5, a6);
  v26 = result;
  if ((_DWORD)result)
    result = result;
  else
    result = 327691;
  if (!v25 || v26)
    return result;
  if (a11)
    *a11 = (*(_QWORD *)(v25 + 240) & a13) != 0;
  if (!a7 || !a8)
    return 0;
  v27[0] = 0;
  v27[1] = 0;
  if (v25 >= v25 + 304)
    goto LABEL_35;
  result = X509CertificateSubjectNameGetCommonName((unint64_t *)(v25 + 104), v27);
  if ((_DWORD)result)
    return result;
  if (a8 < 0)
  {
LABEL_35:
    __break(0x5519u);
    return result;
  }
  result = CTCopyUID((uint64_t)v27, a7, a8);
  if (!(_DWORD)result)
    return 0;
  return result;
}

uint64_t CTEvaluateSavageCerts(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5, _QWORD *a6, BOOL *a7)
{
  return CTEvaluateCertifiedChip(a1, a2, a3, a4, a5, a6, 0, 0, 0, 0, a7, (uint64_t)&X509PolicySavage, 2);
}

uint64_t CTEvaluateYonkersCerts(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5, _QWORD *a6, _BYTE *a7, uint64_t a8, BOOL *a9)
{
  return CTEvaluateCertifiedChip(a1, a2, a3, a4, a5, a6, a7, a8, 0, 0, a9, (uint64_t)&X509PolicyYonkers, 0x80000);
}

uint64_t CTEvaluateSensorCerts(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, const void *a5, size_t a6, _QWORD *a7, _QWORD *a8, _BYTE *a9, uint64_t a10, BOOL *a11)
{
  return CTEvaluateCertifiedChip(a1, a2, a3, a4, a7, a8, a9, a10, a5, a6, a11, (uint64_t)&X509PolicySensor, 0x10000000000);
}

unint64_t CTCopyDeviceIdentifiers(unint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v5;
  uint64_t v6;
  int v7;
  char v8;
  _QWORD v9[2];
  unint64_t v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = 327696;
  if (!result || !a2)
    return v3;
  v11 = 0;
  v12[0] = 0;
  v10 = 0;
  if (__CFADD__(result, a2))
  {
    __break(0x5513u);
  }
  else if (result + a2 >= result)
  {
    v9[0] = result;
    v9[1] = result + a2;
    v5 = CTConvertDashTerminatedHexstringTo64BitInteger((uint64_t)v9, v12);
    v6 = 327697;
    if (!v5 && !HIDWORD(v12[0]))
    {
      if (CTConvertDashTerminatedHexstringTo64BitInteger((uint64_t)v9, &v11))
      {
        return 327698;
      }
      else
      {
        v7 = CTConvertDashTerminatedHexstringTo64BitInteger((uint64_t)v9, &v10);
        v6 = 327699;
        if (!v7)
        {
          v8 = v10;
          if (v10 <= 0xFF)
          {
            v6 = 0;
            if (a3)
            {
              *(_DWORD *)a3 = v12[0];
              *(_QWORD *)(a3 + 8) = v11;
              *(_BYTE *)(a3 + 16) = (v8 & 8) != 0;
              *(_BYTE *)(a3 + 17) = (v8 & 4) != 0;
              *(_BYTE *)(a3 + 18) = v8 & 3;
              *(_QWORD *)(a3 + 24) = 0;
              *(_QWORD *)(a3 + 32) = 0;
            }
          }
        }
      }
    }
    return v6;
  }
  __break(0x5519u);
  return result;
}

uint64_t CTConvertDashTerminatedHexstringTo64BitInteger(uint64_t result, _QWORD *a2)
{
  unsigned __int8 *v2;
  unint64_t v3;
  _QWORD *v4;
  unsigned __int8 *v5;
  unint64_t v6;
  unsigned __int8 *v7;
  char v8;
  unsigned __int8 *v9;
  uint64_t v10;
  signed int v11;
  char v12;
  uint64_t v13;
  char v14;
  unsigned int v15;
  unint64_t v16;
  unsigned __int8 *v17;
  BOOL v18;
  unsigned __int8 *v19;
  unsigned __int8 *v21;
  unsigned int v22;
  unint64_t v23;

  v2 = *(unsigned __int8 **)result;
  v3 = *(_QWORD *)(result + 8);
  if (*(_QWORD *)result > v3)
    goto LABEL_50;
  v4 = (_QWORD *)result;
  v5 = *(unsigned __int8 **)result;
  if (*(_QWORD *)result < v3)
  {
    v6 = v3 - (_QWORD)v2;
    v5 = *(unsigned __int8 **)result;
    while (*v5 != 45)
    {
      v7 = v5 + 1;
      if ((unint64_t)(v5 + 1) > v3 || v5 > v7)
        goto LABEL_50;
      *(_QWORD *)result = v7;
      ++v5;
      if (!--v6)
      {
        v5 = (unsigned __int8 *)v3;
        break;
      }
    }
  }
  if ((unint64_t)v5 > v3 || v2 > v5)
    goto LABEL_50;
  result = 327708;
  if (v5 == (unsigned __int8 *)v3)
    return result;
  v8 = (_BYTE)v5 - (_BYTE)v2;
  if (v5 - v2 > 16)
    return result;
  if (v5 == (unsigned __int8 *)-1)
    goto LABEL_51;
  v9 = v5 + 1;
  if ((unint64_t)(v5 + 1) > v3 || v5 > v9)
  {
LABEL_50:
    __break(0x5519u);
LABEL_51:
    __break(0x5513u);
LABEL_52:
    __break(0x5500u);
    return result;
  }
  v10 = 0;
  *v4 = v9;
  if (v2 >= v5 || (v11 = v8 + 1 + (((v8 + 1) & 0x8000u) >> 15), v11 << 23 >> 24 < 1))
  {
LABEL_46:
    result = 0;
    if (a2)
      *a2 = v10;
  }
  else
  {
    v12 = 0;
    v10 = 0;
    v13 = v11 >> 1;
    v14 = 8 * v13 - 8;
    while (1)
    {
      if ((v8 & 1) == 0 || (v12 & 1) != 0)
      {
        v16 = *v2;
        if (v16 > ~(unint64_t)asciiNibbleToByte)
          goto LABEL_51;
        v17 = &asciiNibbleToByte[v16];
        v18 = v17 < byte_24BA9B28A && v17 >= asciiNibbleToByte;
        if (!v18)
          goto LABEL_50;
        if (v2 == (unsigned __int8 *)-1)
          goto LABEL_51;
        if (v2 + 1 > v5 || v2 > v2 + 1)
          goto LABEL_50;
        v15 = *v17;
        ++v2;
      }
      else
      {
        v15 = 0;
      }
      if (v2 >= v5)
        return 327703;
      v19 = &asciiNibbleToByte[*v2];
      if (v19 >= byte_24BA9B28A || v19 < asciiNibbleToByte)
        goto LABEL_50;
      v21 = v2 + 1;
      if (v2 + 1 > v5 || v2 > v21)
        goto LABEL_50;
      if (v15 > 0xF)
        return 327703;
      v22 = *v19;
      if (v22 > 0xF)
        return 327703;
      v23 = (unint64_t)(v22 | (16 * v15)) << (v14 & 0xF8);
      v18 = __CFADD__(v10, v23);
      v10 += v23;
      if (v18)
        goto LABEL_52;
      if (v21 < v5)
      {
        v14 -= 8;
        v12 = 1;
        v2 = v21;
        if (v13-- > 1)
          continue;
      }
      goto LABEL_46;
    }
  }
  return result;
}

uint64_t CTEvaluateCertsForPolicy(unint64_t a1, uint64_t a2, char a3, int a4, _QWORD *a5, _QWORD *a6, uint64_t a7, uint64_t a8, _QWORD *a9, _QWORD *a10, __int128 *a11)
{
  uint64_t result;
  uint64_t v20;
  uint64_t *v21;
  _BYTE *v22;
  BOOL v23;
  __int128 v24;
  char v25;
  uint64_t v26;
  _UNKNOWN **v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  __int128 v31;
  _BYTE v32[32];
  uint64_t v33;
  _QWORD v34[2];
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38[4];
  _BYTE v39[272];
  uint64_t v40;
  _QWORD v41[117];

  v41[116] = *MEMORY[0x24BDAC8D0];
  memset(v38, 170, sizeof(v38));
  bzero(v39, 0x4C0uLL);
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_42:
    __break(0x5519u);
  }
  if (a1 + a2 < a1)
    goto LABEL_42;
  v36 = a1 + a2;
  v37 = 0xAAAAAAAAAAAAAAAALL;
  v35 = a1;
  result = (uint64_t)X509ChainParseCertificateSet(&v35, (unint64_t)v39, 4, &v38[2], &v37);
  if ((_DWORD)result)
    return result;
  if (v35 != v36)
    return 327690;
  if ((a4 & 1) == 0 && !v40)
  {
    X509ChainResetChain(v38, &v38[2]);
    v20 = v38[0];
    v21 = (uint64_t *)(v38[0] + 296);
    if (!v38[0])
      v21 = &v38[1];
    *v21 = (uint64_t)v41;
    v38[0] = (uint64_t)v39;
    v41[0] = v20;
    v41[1] = v38;
LABEL_20:
    v34[0] = a7;
    v34[1] = a8;
    if (a7)
      v23 = a8 == 0;
    else
      v23 = 1;
    *(_QWORD *)&v24 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)v32 = v24;
    *(_OWORD *)&v32[16] = v24;
    v31 = *a11;
    v32[0] = *((_BYTE *)a11 + 16);
    if (v23)
      v25 = a3;
    else
      v25 = 1;
    v32[1] = v25;
    *(_WORD *)&v32[2] = *((_WORD *)a11 + 9);
    if (v23)
    {
      *(_OWORD *)&v32[8] = *(__int128 *)((char *)a11 + 24);
      v27 = (_UNKNOWN **)*((_QWORD *)a11 + 5);
    }
    else
    {
      v26 = *((_QWORD *)a11 + 4);
      *(_QWORD *)&v32[8] = v34;
      *(_QWORD *)&v32[16] = v26;
      v27 = oidForPubKeyLength();
    }
    v28 = *((_QWORD *)a11 + 6);
    *(_QWORD *)&v32[24] = v27;
    v33 = v28;
    result = X509ChainCheckPathWithOptions(12, v38, (uint64_t)&v31, 0);
    if (!(_DWORD)result)
    {
      v29 = (_QWORD *)v38[0];
      if (!a5 || !a6 || !v38[0] || (result = X509CertificateParseKey(v38[0], a5, a6), !(_DWORD)result))
      {
        if (a10 && v29)
        {
          v30 = v29[32];
          *a10 = v29[31];
          a10[1] = v30;
        }
        result = 0;
        if (a9)
        {
          if (v29)
          {
            result = 0;
            *a9 = v29[30];
          }
        }
      }
    }
    return result;
  }
  if (v39[265])
  {
    if (v38[2])
    {
      v22 = (_BYTE *)v38[2];
      while (v22[265])
      {
        v22 = (_BYTE *)*((_QWORD *)v22 + 34);
        if (!v22)
        {
          v22 = (_BYTE *)v38[2];
          break;
        }
      }
    }
    else
    {
      v22 = 0;
    }
  }
  else
  {
    v22 = v39;
  }
  result = X509ChainBuildPathPartial(v22, &v38[2], v38, a4 ^ 1u);
  if (!(_DWORD)result)
    goto LABEL_20;
  return result;
}

uint64_t CTEvaluateSatori(unint64_t a1, uint64_t a2, char a3, _QWORD *a4, _QWORD *a5)
{
  return CTEvaluateCertsForPolicy(a1, a2, a3, 1, a4, a5, 0, 0, 0, 0, X509PolicySatori);
}

uint64_t CTEvaluateBAASystem(unint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  return CTEvaluateCertsForPolicy(a1, a2, 0, 1, a3, a4, 0, 0, 0, 0, X509PolicyBAASystem_0);
}

unint64_t CTEvaluateBAASystemWithId(unint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, uint64_t a5)
{
  unint64_t result;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v8 = 0;
  v9 = 0;
  v7 = 0;
  result = CTEvaluateCertsForPolicy(a1, a2, 0, 1, a3, a4, 0, 0, &v7, &v8, X509PolicyBAASystem_0);
  if (!(_DWORD)result)
    return CTFillBAAIdentity(v7, v8, v9, a5);
  return result;
}

unint64_t CTFillBAAIdentity(int a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t result;

  if ((a1 & 0x800000) != 0 && a4)
  {
    result = CTCopyDeviceIdentifiers(a2, a3, a4);
    if ((_DWORD)result)
      return result;
  }
  else if (!a4)
  {
    return 0;
  }
  result = 0;
  if (a1 < 0 && a3)
  {
    if (a2)
    {
      *(_QWORD *)(a4 + 32) = 0;
      *(_OWORD *)a4 = 0u;
      *(_OWORD *)(a4 + 16) = 0u;
      result = 0;
      *(_QWORD *)(a4 + 24) = a2;
      *(_QWORD *)(a4 + 32) = a3;
      return result;
    }
    return 0;
  }
  return result;
}

unint64_t CTEvaluateBAASystemTestRoot(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  unint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v10 = 0;
  v11 = 0;
  v9 = 0;
  result = CTEvaluateCertsForPolicy(a1, a2, 1, 1, a5, a6, a3, a4, &v9, &v10, X509PolicyBAASystem_0);
  if (!(_DWORD)result)
    return CTFillBAAIdentity(v9, v10, v11, a7);
  return result;
}

unint64_t CTEvaluateBAAUser(unint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, uint64_t a5)
{
  unint64_t result;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v8 = 0;
  v9 = 0;
  v7 = 0;
  result = CTEvaluateCertsForPolicy(a1, a2, 0, 1, a3, a4, 0, 0, &v7, &v8, X509PolicyBAAUser_0);
  if (!(_DWORD)result)
    return CTFillBAAIdentity(v7, v8, v9, a5);
  return result;
}

unint64_t CTEvaluateBAAUserTestRoot(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  unint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v10 = 0;
  v11 = 0;
  v9 = 0;
  result = CTEvaluateCertsForPolicy(a1, a2, 1, 1, a5, a6, a3, a4, &v9, &v10, X509PolicyBAAUser_0);
  if (!(_DWORD)result)
    return CTFillBAAIdentity(v9, v10, v11, a7);
  return result;
}

unint64_t CTEvaluateBAASepApp(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  unint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v10 = 0;
  v11 = 0;
  v9 = 0;
  result = CTEvaluateCertsForPolicy(a1, a2, 1, 1, a5, a6, a3, a4, &v9, &v10, X509PolicyBAASepApp);
  if (!(_DWORD)result)
    return CTFillBAAIdentity(v9, v10, v11, a7);
  return result;
}

uint64_t CTEvaluateBAA(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6, _QWORD *a7, _QWORD *a8, _QWORD *a9, uint64_t a10)
{
  uint64_t result;

  switch(a1)
  {
    case 1:
      result = CTEvaluateBAASystemTestRoot(a2, a3, a4, a5, a6, a7, a10);
      break;
    case 2:
      result = CTEvaluateBAAUserTestRoot(a2, a3, a4, a5, a6, a7, a10);
      break;
    case 3:
      result = CTEvaluateBAAAccessory(a2, a3, a4, a5, a6, a7, a8, a9);
      break;
    case 4:
      result = CTEvaluateBAASepApp(a2, a3, a4, a5, a6, a7, a10);
      break;
    default:
      result = 327712;
      break;
  }
  return result;
}

uint64_t CTEvaluateBAAAccessory(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, _QWORD *a6, _QWORD *a7, _QWORD *a8)
{
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v12 = 0;
  v13 = 0;
  result = CTEvaluateCertsForPolicy(a1, a2, 0, 1, a5, a6, a3, a4, 0, &v12, X509PolicyMFi4Attestation);
  if (!(_DWORD)result && a7)
  {
    if (a8)
    {
      v11 = v13;
      *a7 = v12;
      *a8 = v11;
    }
  }
  return result;
}

uint64_t CTGetBAARootType(unint64_t a1, uint64_t a2)
{
  unint64_t v3[2];
  _OWORD v4[19];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  memset(v4, 0, sizeof(v4));
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_14:
    __break(0x5519u);
  }
  if (a1 + a2 < a1)
    goto LABEL_14;
  v3[0] = a1;
  v3[1] = a1 + a2;
  if (X509CertificateParse((unint64_t *)v4, v3))
    return 0;
  if (!compare_octet_string((uint64_t)&v4[5] + 8, (uint64_t)&BASystemRootSPKI))
    return 1;
  if (!compare_octet_string((uint64_t)&v4[5] + 8, (uint64_t)&BAUserRootSPKI))
    return 2;
  if (compare_octet_string((uint64_t)&v4[5] + 8, (uint64_t)&MFi4RootSpki))
    return 4 * (compare_octet_string((uint64_t)&v4[5] + 8, (uint64_t)&BASepAppRootSPKI) == 0);
  return 3;
}

uint64_t CTGetBAASubCAType(unint64_t a1, uint64_t a2)
{
  unint64_t v3[2];
  _OWORD v4[19];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  memset(v4, 0, sizeof(v4));
  if (__CFADD__(a1, a2))
  {
    __break(0x5513u);
LABEL_14:
    __break(0x5519u);
  }
  if (a1 + a2 < a1)
    goto LABEL_14;
  v3[0] = a1;
  v3[1] = a1 + a2;
  if (X509CertificateParse((unint64_t *)v4, v3))
    return 0;
  if (!compare_octet_string((uint64_t)&v4[10] + 8, (uint64_t)&BASystemRootSKID))
    return 1;
  if (!compare_octet_string((uint64_t)&v4[10] + 8, (uint64_t)&BAUserRootSKID))
    return 2;
  if (compare_octet_string((uint64_t)&v4[10] + 8, (uint64_t)&MFi4RootSKID))
    return 4 * (compare_octet_string((uint64_t)&v4[10] + 8, (uint64_t)&BASepAppRootSKID) == 0);
  return 3;
}

uint64_t CTEvaluateDAK(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  unint64_t v7;
  uint64_t result;
  __int128 v12;
  unint64_t v13;
  _BYTE *v14;
  int v15;
  unint64_t v16[2];
  uint64_t v17;
  _QWORD v18[2];
  uint64_t v19;
  unint64_t v20;
  _QWORD v21[2];
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  _OWORD v27[19];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a1 + a2;
  if (a1 + a2 < a1)
    goto LABEL_31;
  result = CTEvaluateBAAUserTestRoot(a1, a2, a3, a4, a5, a6, a7);
  if ((_DWORD)result)
    return result;
  *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v27[17] = v12;
  v27[18] = v12;
  v27[15] = v12;
  v27[16] = v12;
  v27[13] = v12;
  v27[14] = v12;
  v27[11] = v12;
  v27[12] = v12;
  v27[9] = v12;
  v27[10] = v12;
  v27[7] = v12;
  v27[8] = v12;
  v27[5] = v12;
  v27[6] = v12;
  v27[3] = v12;
  v27[4] = v12;
  v27[1] = v12;
  v27[2] = v12;
  v27[0] = v12;
  v18[0] = 0xAAAAAAAAAAAAAAAALL;
  v18[1] = 0xAAAAAAAAAAAAAAAALL;
  v17 = 0;
  if (__CFADD__(a1, a2))
    goto LABEL_32;
  v16[0] = a1;
  v16[1] = v7;
  result = (uint64_t)X509ChainParseCertificateSet(v16, (unint64_t)v27, 1, v18, &v17);
  if (!(_DWORD)result)
  {
    if (!v18[0])
      return 327691;
    v25 = 0;
    v26 = 0;
    result = CTParseExtensionValue(*(_QWORD *)v18[0], *(_QWORD *)(v18[0] + 8), &CTOidAppleFDRIdentity, 9uLL, &v25, &v26);
    if (!(_DWORD)result)
    {
      v23 = 0xAAAAAAAAAAAAAAAALL;
      v24 = 0xAAAAAAAAAAAAAAAALL;
      if (!__CFADD__(v25, v26))
      {
        if (v25 > v25 + v26)
          goto LABEL_31;
        v23 = v25;
        v24 = v25 + v26;
        v22 = v26;
        result = ccder_blob_decode_tl();
        if (!(_DWORD)result)
          return 720929;
        if (v24 < v23)
          goto LABEL_31;
        v13 = v22;
        if (v22 > v24 - v23)
          goto LABEL_31;
        v25 = v23;
        v26 = v22;
        if (!__CFADD__(v23, v22))
        {
          v14 = (_BYTE *)v23;
          if (v23 < v23 + v22)
          {
            do
            {
              if ((unint64_t)v14 < v23)
                goto LABEL_31;
              if (*v14 == 45)
                goto LABEL_19;
              ++v14;
              --v13;
            }
            while (v13);
            v14 = (_BYTE *)(v23 + v22);
          }
LABEL_19:
          if (v14 != (_BYTE *)-1)
          {
            if ((unint64_t)(v14 + 1) >= v23 + v22)
              return 327711;
            if (v23 <= (unint64_t)(v14 + 1))
            {
              v21[0] = v14 + 1;
              v21[1] = v23 + v22;
              v19 = 0;
              v20 = 0;
              v15 = CTConvertDashTerminatedHexstringTo64BitInteger((uint64_t)v21, &v20);
              result = 327697;
              if (!v15 && !HIDWORD(v20))
              {
                if (CTConvertDashTerminatedHexstringTo64BitInteger((uint64_t)v21, &v19))
                {
                  return 327698;
                }
                else
                {
                  result = 0;
                  if (a7)
                  {
                    *(_DWORD *)a7 = v20;
                    *(_QWORD *)(a7 + 8) = v19;
                  }
                }
              }
              return result;
            }
LABEL_31:
            __break(0x5519u);
          }
        }
      }
LABEL_32:
      __break(0x5513u);
    }
  }
  return result;
}

uint64_t CTEvaluateAcrt(unint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  return CTEvaluateCertsForPolicy(a1, a2, 0, 0, a3, a4, 0, 0, 0, 0, X509PolicyACRT);
}

uint64_t CTEvaluateUcrt(unint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  return CTEvaluateCertsForPolicy(a1, a2, 0, 1, a3, a4, 0, 0, 0, 0, X509PolicyUcrt);
}

uint64_t CTEvaluateUcrtTestRoot(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, _QWORD *a6)
{
  return CTEvaluateCertsForPolicy(a1, a2, 1, 1, a5, a6, a3, a4, 0, 0, X509PolicyUcrt);
}

uint64_t CTParseFlagsForAccessoryCerts(uint64_t result)
{
  uint64_t v1;
  unsigned __int8 *v2;
  uint64_t v3;

  v1 = result;
  if (!result || (result = *(_QWORD *)(result + 240)) == 0)
  {
    v3 = v1 + 136;
    v2 = *(unsigned __int8 **)(v1 + 136);
    if (*(_QWORD *)(v3 + 8) != 15 || v2 == 0)
      return 0;
    if ((unint64_t)v2 < 0xFFFFFFFFFFFFFFFELL)
    {
      if (v2[2] != 170)
        return 0;
      if ((unint64_t)v2 <= 0xFFFFFFFFFFFFFFF9)
      {
        if (v2[6] != 170)
          return 0;
        if ((unint64_t)v2 <= 0xFFFFFFFFFFFFFFF7)
        {
          if (v2[8] == 170)
          {
            if ((unint64_t)v2 <= 0xFFFFFFFFFFFFFFF4)
            {
              if (v2[11] == 170)
                return 0x8000000;
              return 0;
            }
            goto LABEL_17;
          }
          return 0;
        }
      }
    }
LABEL_17:
    __break(0x5513u);
  }
  return result;
}

uint64_t CTParseAccessoryCerts(char *a1, uint64_t a2, _QWORD *a3, _QWORD *a4, char **a5, unint64_t *a6, uint64_t *a7)
{
  char *v14;
  uint64_t result;
  _BYTE *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  unint64_t *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char *v27;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  BOOL v34;
  uint64_t v35;
  unint64_t v36[4];
  unint64_t v37;
  unint64_t v38[2];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  _BYTE v46[1216];
  _QWORD v47[2];

  v47[0] = *MEMORY[0x24BDAC8D0];
  bzero(v46, 0x4C0uLL);
  v45 = 0;
  v44 = 0u;
  v43 = 0u;
  v42 = 0u;
  v41 = 0u;
  v40 = 0u;
  v39 = 0u;
  v38[0] = 4;
  v38[1] = (unint64_t)v46;
  v14 = &a1[a2];
  v37 = 0;
  result = CMSParseContentInfoSignedDataWithOptions(a1, a2, v38, 1);
  if ((_DWORD)result)
  {
    memset(v36, 170, sizeof(v36));
    if (__CFADD__(a1, a2))
      goto LABEL_65;
    v36[0] = (unint64_t)a1;
    v36[1] = (unint64_t)&a1[a2];
    result = (uint64_t)X509ChainParseCertificateSet(v36, (unint64_t)v46, 4, &v36[2], &v37);
    if ((_DWORD)result)
      return result;
    if (v36[0] != v36[1])
      return 327690;
  }
  else
  {
    v37 = v39;
  }
  if (!v46[265])
  {
    if (v37 < 2)
    {
      v20 = 0;
      v17 = 0;
      v16 = v46;
      goto LABEL_19;
    }
    v18 = v37 - 1;
    if (__OFSUB__(v37, 1))
    {
LABEL_67:
      __break(0x5515u);
      return result;
    }
    v17 = 0;
    v16 = v46;
    v20 = 1;
    v19 = 1;
    goto LABEL_20;
  }
  v16 = v46;
  if (!v37)
  {
    v20 = 0;
    v17 = 0;
    goto LABEL_19;
  }
  if (v37 > 5)
  {
LABEL_66:
    __break(0x5512u);
    goto LABEL_67;
  }
  v17 = 304 * v37 - 304;
  if (__CFADD__(v46, v17))
  {
LABEL_65:
    __break(0x5513u);
    goto LABEL_66;
  }
  v16 = &v46[v17];
  v18 = v37 - 2;
  if (v37 < 2)
  {
    v20 = 0;
LABEL_19:
    v18 = -1;
    v19 = -1;
    goto LABEL_20;
  }
  v19 = 0;
  v20 = 1;
LABEL_20:
  if (a5 && a6)
  {
    v21 = v20 ^ 1;
    if (v18 < 0)
      v21 = 1;
    if ((v21 & 1) != 0)
    {
      v27 = 0;
      v26 = 0;
LABEL_47:
      *a5 = v27;
      *a6 = v26;
      goto LABEL_48;
    }
    v22 = (unint64_t *)&v46[304 * (int)v19];
    if (v22 >= v47 || v22 < (unint64_t *)v46)
      goto LABEL_63;
    v23 = 304 * (int)v19;
    if (v23 > 0x4BF)
      goto LABEL_64;
    v24 = v23 | 8;
    if ((v23 | 8) > 0x4C0)
      goto LABEL_64;
    v25 = *v22;
    if (v19 <= v18)
    {
      v26 = 0;
      while (1)
      {
        if (&v46[v24 - 8] >= (_BYTE *)v47 || &v46[v24 - 8] < v46)
          goto LABEL_63;
        if (v24 > 0x4C0)
          goto LABEL_64;
        v29 = *(_QWORD *)&v46[v24];
        v30 = __CFADD__(v26, v29);
        v26 += v29;
        if (v30)
          break;
        v31 = v19 + 1;
        if (__OFADD__(v19, 1))
          break;
        v24 += 304;
        ++v19;
        if (v31 > v18)
          goto LABEL_41;
      }
      __break(0x5500u);
      goto LABEL_63;
    }
    v26 = 0;
LABEL_41:
    v32 = v25 - (_QWORD)a1;
    v33 = v25 >= (unint64_t)a1;
    v34 = v25 < (unint64_t)a1;
    if (v32 < 0)
      v33 = v34;
    if (v33)
    {
      v27 = &a1[v32];
      if (v14 < v27 || v27 < a1 || v26 > v14 - v27)
        goto LABEL_63;
      goto LABEL_47;
    }
    goto LABEL_65;
  }
LABEL_48:
  if (a7 && v16)
  {
    if (v16 >= (_BYTE *)v47 || v16 < v46)
      goto LABEL_63;
    *a7 = CTParseFlagsForAccessoryCerts((uint64_t)v16);
  }
  result = 0;
  if (a3 && a4 && v16)
  {
    if (v46 <= v16 && v16 + 304 <= (_BYTE *)v47)
    {
      if (v17 <= 0x4BF && (v17 | 8) <= 0x4C0)
      {
        result = 0;
        v35 = *((_QWORD *)v16 + 1);
        *a3 = *(_QWORD *)v16;
        *a4 = v35;
        return result;
      }
LABEL_64:
      __break(1u);
    }
LABEL_63:
    __break(0x5519u);
    goto LABEL_64;
  }
  return result;
}

uint64_t CTEvaluateAccessoryCert(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7, _QWORD *a8, _QWORD *a9, _QWORD *a10, _QWORD *a11)
{
  uint64_t result;
  uint64_t v20;
  uint64_t **v21;
  unint64_t v22;
  uint64_t *v23;
  uint64_t *v24;
  BOOL v25;
  unint64_t v26;
  char v27;
  char v28;
  char v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  __int16 v34;
  char v35;
  char v36;
  int v37;
  unint64_t *v38;
  unint64_t *v39;
  unint64_t *v40;
  uint64_t v41;
  unint64_t v42[2];
  unint64_t v43[4];
  unint64_t v44;
  unint64_t v45;
  unint64_t v46[4];
  unint64_t *v47;
  uint64_t *v48;
  _BYTE v49[272];
  uint64_t v50;
  unint64_t v51[34];
  _QWORD v52[4];
  unint64_t v53[11];
  unint64_t v54[19];
  uint64_t v55;
  _QWORD v56[44];

  v56[42] = *MEMORY[0x24BDAC8D0];
  bzero(v51, 0x390uLL);
  v47 = 0;
  v48 = 0;
  memset(v46, 170, sizeof(v46));
  if (__CFADD__(a1, a2))
    goto LABEL_56;
  if (a1 + a2 < a1)
    goto LABEL_57;
  v46[0] = a1;
  v46[1] = a1 + a2;
  result = X509CertificateParse(v51, v46);
  if ((_DWORD)result)
    return result;
  v20 = (uint64_t)v47;
  v21 = &v48;
  if (v47)
    v21 = (uint64_t **)(v47 + 35);
  *v21 = v52;
  v47 = v51;
  v52[0] = v20;
  v52[1] = &v47;
  v44 = 0xAAAAAAAAAAAAAAAALL;
  v45 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(a5, a6))
    goto LABEL_56;
  if (a5 + a6 < a5)
    goto LABEL_57;
  v44 = a5;
  v45 = a5 + a6;
  if ((unint64_t *)((char *)v53 + 1) != 0 && (unint64_t)v51 >= 0xFFFFFFFFFFFFFECFLL)
    goto LABEL_56;
  result = X509CertificateParse(v53, &v44);
  if ((_DWORD)result)
    return result;
  v56[0] = 0;
  v56[1] = v48;
  *v48 = (uint64_t)v53;
  v48 = v56;
  bzero(v49, 0x390uLL);
  if (!a3 || !a4)
  {
LABEL_22:
    result = X509ChainBuildPath(v51, (uint64_t *)&v47, &v46[2]);
    if ((_DWORD)result)
      return result;
    v26 = 0;
    v27 = 0;
    v28 = 28;
    result = 327700;
    if (a7 <= 0x1FFFFFFF)
    {
      if (a7 <= 0x7FFFFFF)
      {
        if (a7)
        {
          v29 = 0;
          if (a7 != 4)
            return result;
        }
        else
        {
          v27 = 0;
          v26 = 0;
          v29 = 1;
        }
        goto LABEL_44;
      }
      if (a7 == 0x8000000)
      {
        v26 = 0;
        v29 = 0;
        v28 = 29;
        v27 = 1;
        goto LABEL_44;
      }
      if (a7 != 0x10000000)
        return result;
    }
    else
    {
      if (a7 > 0x3FFFFFFFFLL)
      {
        if (a7 == 0x400000000 || a7 == 0x800000000)
        {
          v29 = 0;
        }
        else
        {
          v29 = 0;
          if (a7 != 0x1000000000)
            return result;
        }
        goto LABEL_44;
      }
      if (a7 != 0x20000000)
      {
        if (a7 != 0x40000000)
          return result;
        v27 = 0;
        v29 = 0;
        v26 = 3;
        goto LABEL_44;
      }
      v27 = 1;
    }
    v29 = v27;
    v26 = 2;
    v27 = 0;
LABEL_44:
    if (!v55)
      v55 = a7;
    memset(v43, 170, sizeof(v43));
    v42[0] = 0xAAAAAAAAAAAAAAAALL;
    v42[1] = 0xAAAAAAAAAAAAAAAALL;
    X509CertificateParseSPKI(v54, &v43[2], v42, v43);
    v32 = v26;
    v33 = a7;
    v37 = -1431655766;
    v38 = v43;
    v34 = 0;
    v35 = v29;
    v36 = v27;
    v39 = &v43[2];
    v40 = v42;
    v41 = 0;
    result = X509ChainCheckPath(v28, (uint64_t *)&v46[2], (uint64_t)&v32);
    if (!(_DWORD)result)
    {
      v30 = v46[2];
      if (!a8 || !a9 || !v46[2] || (result = X509CertificateParseKey(v46[2], a8, a9), !(_DWORD)result))
      {
        result = 0;
        if (a10 && a11)
        {
          if (v30)
          {
            result = 0;
            v31 = *(_QWORD *)(v30 + 256);
            *a10 = *(_QWORD *)(v30 + 248);
            *a11 = v31;
          }
        }
      }
    }
    return result;
  }
  if (__CFADD__(a3, a4))
  {
LABEL_56:
    __break(0x5513u);
LABEL_57:
    __break(0x5519u);
  }
  if (a3 + a4 < a3)
    goto LABEL_57;
  v32 = a3;
  v33 = a3 + a4;
  if (a3 + a4 <= a3)
    goto LABEL_22;
  v22 = 0;
  v23 = &v50;
  while (1)
  {
    result = X509CertificateParse((unint64_t *)v23 - 34, &v32);
    if ((_DWORD)result)
      return result;
    v24 = v48;
    *v23 = 0;
    v23[1] = (uint64_t)v24;
    *v24 = (uint64_t)(v23 - 34);
    v48 = v23;
    v25 = v32 >= v33 || v22++ > 1;
    v23 += 38;
    if (v25)
      goto LABEL_22;
  }
}

uint64_t CTEvaluatePragueSignatureCMS(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, _QWORD *a6, _QWORD *a7)
{
  __int128 v8;
  unint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v9 = 0xAAAAAAAA0000AA01;
  v8 = xmmword_24BA9B340;
  BYTE1(v9) = a5;
  v10 = 0u;
  v11 = 0u;
  return CMSVerifySignedDataWithLeaf(a1, a2, a3, a4, (uint64_t)&v8, a6, a7);
}

uint64_t CTEvaluateKDLSignatureCMS(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, _QWORD *a6, _QWORD *a7)
{
  __int128 v8;
  unint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v9 = 0xAAAAAAAA0000AA01;
  v8 = xmmword_24BA9B350;
  BYTE1(v9) = a5;
  v10 = 0u;
  v11 = 0u;
  return CMSVerifySignedDataWithLeaf(a1, a2, a3, a4, (uint64_t)&v8, a6, a7);
}

uint64_t CTVerifyAppleMarkerExtension(_QWORD *a1, uint64_t a2)
{
  uint64_t result;
  unint64_t v4;
  unint64_t v5;
  BOOL v6;
  uint64_t v7;
  unint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  unint64_t v14;
  BOOL v15;
  unsigned __int8 *v16;
  uint64_t v17;
  int v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;

  result = 327700;
  v4 = a1[31];
  v5 = a1[32];
  if (v4)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (v6)
    return 327707;
  v7 = a1[30];
  if ((v7 & 0x100000000) == 0)
  {
    if ((v7 & 0x200000000) == 0)
      return result;
    if (!__CFADD__(v4, v5))
    {
      v11 = v4 + v5;
      if (v4 + v5 != -1)
      {
        if (v5 > 0x13)
          return 327704;
        v16 = (unsigned __int8 *)(v11 - 1);
        if (v11 - 1 >= v4)
        {
          v10 = 0;
          v17 = 0;
          while ((unint64_t)v16 < v11)
          {
            v18 = *v16;
            if ((v18 - 58) < 0xFFFFFFF6)
              return 327705;
            if (v17 == 20)
              break;
            if ((v17 & 0x1FFFFFFFFFFFFFFFLL) == 0x14)
              goto LABEL_39;
            v19 = (v18 - 48);
            v20 = powersOfTen[v17];
            if (!is_mul_ok(v19, v20))
              goto LABEL_40;
            v21 = v19 * v20;
            v15 = __CFADD__(v10, v21);
            v10 += v21;
            if (v15)
              goto LABEL_38;
            ++v17;
            if ((unint64_t)--v16 < v4)
              goto LABEL_23;
          }
LABEL_37:
          __break(0x5519u);
LABEL_38:
          __break(0x5500u);
LABEL_39:
          __break(1u);
LABEL_40:
          __break(0x550Cu);
          goto LABEL_41;
        }
        goto LABEL_13;
      }
    }
LABEL_41:
    __break(0x5513u);
    return result;
  }
  if (__CFADD__(v4, v5))
    goto LABEL_41;
  v8 = v4 + v5;
  if (v4 + v5 == -1)
    goto LABEL_41;
  v9 = (_BYTE *)(v8 - 1);
  if (v8 - 1 >= v4)
  {
    v12 = 0;
    v13 = 0;
    v10 = 0;
    while ((unint64_t)v9 < v8)
    {
      v14 = (unint64_t)(*v9 & 0x7F) << v12;
      v15 = __CFADD__(v10, v14);
      v10 += v14;
      if (v15)
        goto LABEL_38;
      if (v13 <= 7)
      {
        ++v13;
        --v9;
        v12 += 7;
        if ((unint64_t)v9 >= v4)
          continue;
      }
      goto LABEL_23;
    }
    goto LABEL_37;
  }
LABEL_13:
  v10 = 0;
LABEL_23:
  if (v10 == a2)
    return 0;
  else
    return 589829;
}

uint64_t CTVerifyHostname(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  _QWORD v7[2];
  unint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 327702;
  if (*(_QWORD *)(a1 + 232) && *(_QWORD *)(a1 + 224))
  {
    v7[1] = a3;
    v8 = 0xAAAAAAAAAAAAAA00;
    v7[0] = a2;
    v4 = X509CertificateParseGeneralNamesContent(a1, (uint64_t (*)(_QWORD, int *, uint64_t))CTCompareGeneralNameToHostname, (uint64_t)v7);
    if ((_BYTE)v8)
      v5 = 0;
    else
      v5 = 327706;
    if (v4)
      return v4;
    else
      return v5;
  }
  return v3;
}

uint64_t CTCompareGeneralNameToHostname(uint64_t result, _QWORD *a2, unint64_t a3)
{
  char *v4;
  size_t v5;
  size_t v6;
  char *v7;
  char *v8;
  BOOL v9;
  int v11;
  size_t v12;
  unint64_t v13;
  _BYTE *v14;
  const void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  size_t v19;
  char *v20;
  size_t v22;
  size_t v23;

  if ((_DWORD)result != 2)
    return 1;
  v4 = *(char **)a3;
  v5 = *(_QWORD *)(a3 + 8);
  v6 = ~*(_QWORD *)a3;
  if (v5 > v6)
    goto LABEL_50;
  v7 = &v4[v5];
  if (&v4[v5] == (char *)-1)
    goto LABEL_50;
  v8 = v7 - 1;
  if (v7)
    v9 = v8 >= v4;
  else
    v9 = 0;
  if (!v9 || a3 + 24 < a3)
    goto LABEL_49;
  v11 = *v8;
  result = compare_octet_string((uint64_t)a2, a3);
  if (!(_DWORD)result)
    goto LABEL_48;
  if (v11 != 46)
    goto LABEL_15;
  v12 = v5 - 1;
  if (v5)
  {
    if (v12 <= v5)
    {
      result = compare_octet_string_raw((uint64_t)a2, v4, v12);
      if ((_DWORD)result)
      {
LABEL_15:
        v13 = a2[1];
        if (v13 < 3)
          return 1;
        v14 = (_BYTE *)*a2;
        if (*(_BYTE *)*a2 != 42)
          return 1;
        if (v14 != (_BYTE *)-1)
        {
          v15 = v14 + 1;
          if (v14[1] == 46)
          {
            v16 = -2;
            if ((unint64_t)v14 < 0xFFFFFFFFFFFFFFFELL)
              v16 = (uint64_t)v14;
            v17 = -v16;
            v18 = 2;
            result = 1;
            while (v17 != v18)
            {
              if (&v14[v18] < v14)
                goto LABEL_49;
              if (v14[v18] == 46)
              {
                if (v13 == v18)
                  return 1;
                v19 = 0;
                if (v5)
                {
                  while (1)
                  {
                    v20 = &v4[v19];
                    if (&v4[v19] >= v7 || v20 < v4)
                      goto LABEL_49;
                    if (*v20 == 46)
                      break;
                    if (v5 == ++v19)
                    {
                      v19 = v5;
                      break;
                    }
                  }
                }
                v22 = v13 - 1;
                v9 = v5 >= v19;
                v23 = v5 - v19;
                if (!v9)
                  goto LABEL_51;
                if (v22 == v23)
                {
                  if (v19 > v6)
                    goto LABEL_50;
                  result = memcmp(v15, &v4[v19], v13 - 1);
                  if (!(_DWORD)result)
                    goto LABEL_48;
                }
                if (v11 != 46)
                  return 1;
                if (!v23)
                  goto LABEL_51;
                if (v22 != v23 - 1)
                  return 1;
                if (v19 <= v6)
                {
                  if (!memcmp(v15, &v4[v19], v22))
                    goto LABEL_48;
                  return 1;
                }
                goto LABEL_50;
              }
              if (v13 == ++v18)
                return result;
            }
            goto LABEL_50;
          }
          return 1;
        }
LABEL_50:
        __break(0x5513u);
        goto LABEL_51;
      }
LABEL_48:
      result = 0;
      *(_BYTE *)(a3 + 16) = 1;
      return result;
    }
LABEL_49:
    __break(0x5519u);
    goto LABEL_50;
  }
LABEL_51:
  __break(0x5515u);
  return result;
}

uint64_t CTEvaluateAppleSSLWithOptionalTemporalCheck(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, char a7)
{
  uint64_t result;
  __int128 v13;
  unint64_t v14[2];
  _QWORD v15[3];
  _OWORD v16[19];
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  unint64_t v20;
  __int128 *v21;
  __int128 *v22;
  __int128 *v23;
  _UNKNOWN **v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v20 = 0xAAAAAAAA00AAAA01;
  v21 = &null_octet;
  v19 = xmmword_24BA9B360;
  BYTE1(v20) = a6;
  BYTE2(v20) = a7;
  v22 = &null_octet;
  v23 = &null_octet;
  v24 = &CTOctetServerAuthEKU;
  v17 = 0;
  v18 = 0;
  result = CTEvaluateCertsForPolicy(a1, a2, a6, 1, &v17, &v18, 0, 0, 0, 0, &v19);
  if (!(_DWORD)result)
  {
    *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v16[17] = v13;
    v16[18] = v13;
    v16[15] = v13;
    v16[16] = v13;
    v16[13] = v13;
    v16[14] = v13;
    v16[11] = v13;
    v16[12] = v13;
    v16[9] = v13;
    v16[10] = v13;
    v16[7] = v13;
    v16[8] = v13;
    v16[6] = v13;
    v16[4] = v13;
    v16[5] = v13;
    v16[2] = v13;
    v16[3] = v13;
    v16[0] = v13;
    v16[1] = v13;
    memset(v15, 170, sizeof(v15));
    if (__CFADD__(a1, a2))
    {
      __break(0x5513u);
    }
    else
    {
      v14[0] = a1;
      v14[1] = a1 + a2;
      result = (uint64_t)X509ChainParseCertificateSet(v14, (unint64_t)v16, 1, &v15[1], v15);
      if (!(_DWORD)result)
      {
        result = CTVerifyAppleMarkerExtension(v16, a5);
        if (!(_DWORD)result)
          return CTVerifyHostname((uint64_t)v16, a3, a4);
      }
    }
  }
  return result;
}

uint64_t CTEvaluateAppleSSL(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  return CTEvaluateAppleSSLWithOptionalTemporalCheck(a1, a2, a3, a4, a5, a6, 1);
}

uint64_t CTCopyUID(uint64_t result, _BYTE *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  _BYTE *v10;
  unsigned __int8 *v11;
  unsigned __int8 *v12;
  unsigned __int8 *v14;
  unsigned int v15;
  unsigned int v16;

  v5 = *(_QWORD *)result;
  v4 = *(_QWORD *)(result + 8);
  if (__CFADD__(*(_QWORD *)result, v4))
    goto LABEL_31;
  v6 = v5 + v4;
  v7 = *(unsigned __int8 **)result;
  if (v5 < v6)
  {
    while ((unint64_t)v7 >= v5)
    {
      v3 = *v7;
      if (v3 != 45 && (unint64_t)++v7 < v6)
        continue;
      goto LABEL_6;
    }
    goto LABEL_34;
  }
LABEL_6:
  if (v7 == (unsigned __int8 *)-1)
    goto LABEL_31;
  v8 = v7 + 1;
  v3 = 327693;
  result = 327693;
  if ((unint64_t)(v7 + 1) >= v6)
    return result;
  if (a3 < 0 || v5 > (unint64_t)v8)
  {
LABEL_34:
    __break(0x5519u);
    return result;
  }
  if (__CFADD__(v8, v6 - (_QWORD)v8))
    goto LABEL_31;
  if (v6 - (_QWORD)v8 != 2 * a3)
    return (v3 + 1);
  if (__CFADD__(a2, a3) || v7 == (unsigned __int8 *)-2)
  {
LABEL_31:
    __break(0x5513u);
    return (v3 + 1);
  }
  v9 = v7 + 2;
  v10 = a2;
  while (1)
  {
    result = 0;
    if ((unint64_t)v9 >= v6 || v10 >= &a2[a3])
      return result;
    v11 = v9 - 1;
    if ((unint64_t)(v9 - 1) >= v6 || v11 < v8)
      goto LABEL_34;
    v12 = &asciiNibbleToByte[*v11];
    result = (uint64_t)byte_24BA9B28A;
    if (v12 >= byte_24BA9B28A || v12 < asciiNibbleToByte)
      goto LABEL_34;
    if (v11 < v7)
      goto LABEL_34;
    v14 = &asciiNibbleToByte[*v9];
    result = (uint64_t)byte_24BA9B28A;
    if (v14 >= byte_24BA9B28A || v14 < asciiNibbleToByte)
      goto LABEL_34;
    v15 = *v12;
    result = 327695;
    if (v15 > 0xF)
      return result;
    v16 = *v14;
    if (v16 > 0xF)
      return result;
    if (v10 < a2)
      goto LABEL_34;
    *v10++ = v16 | (16 * v15);
    v9 += 2;
    if (!v9)
      goto LABEL_31;
  }
}

uint64_t X509CertificateParseImplicit(uint64_t a1, unint64_t *a2, const void *a3, size_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  BOOL v39;
  int v40;
  int v41;
  unint64_t v43;
  unint64_t v51;
  unint64_t v52;
  unsigned __int8 v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  char v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  uint64_t v69;
  _OWORD v70[10];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v68 = 0;
  v69 = 0;
  v66 = 0xAAAAAAAAAAAAAAAALL;
  v67 = 0xAAAAAAAAAAAAAAAALL;
  v4 = *a2;
  v5 = a2[1];
  if (*a2 > v5)
    goto LABEL_186;
  v10 = 720915;
  v66 = *a2;
  v67 = v5;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  result = ccder_blob_decode_tl();
  if (!(_DWORD)result)
    return v10;
  v12 = v69;
  v13 = v66;
  v14 = v69 + v66 - v4;
  if (__CFADD__(v69, v66 - v4))
    goto LABEL_188;
  if (v14 > v5 - v4)
    goto LABEL_186;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v14;
  v64 = 0xAAAAAAAAAAAAAAAALL;
  v65 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(v13, v12))
    goto LABEL_187;
  v15 = v13 + v12;
  if (v13 > v15 || v15 > v67)
    goto LABEL_186;
  v64 = v13;
  v65 = v15;
  v62 = v13;
  v63 = v15;
  if (ccder_blob_decode_tl())
  {
    if (__CFADD__(v62, v68))
      goto LABEL_187;
    v16 = 720916;
    if (ccder_blob_decode_uint64() && v62 == v62 + v68)
    {
      if (v62 + v68 > v63)
        goto LABEL_186;
      v64 = v62 + v68;
      v65 = v63;
      goto LABEL_14;
    }
    return v16;
  }
LABEL_14:
  if (!ccder_blob_decode_tl())
    return 720917;
  v18 = v64;
  v17 = v65;
  if (v65 < v64)
    goto LABEL_186;
  v19 = v68;
  if (v68 > v65 - v64)
    goto LABEL_186;
  *(_QWORD *)(a1 + 136) = v64;
  *(_QWORD *)(a1 + 144) = v19;
  if (__CFADD__(v18, v19))
    goto LABEL_187;
  v20 = v18 + v19;
  if (v18 > v20 || v20 > v17)
    goto LABEL_186;
  v64 = v20;
  if (!ccder_blob_decode_AlgorithmIdentifierNULL(&v64, (unint64_t *)(a1 + 152)))
    return 720918;
  if (!ccder_blob_decode_tl())
    return 720919;
  v22 = v64;
  v21 = v65;
  if (v65 < v64)
    goto LABEL_186;
  v23 = v68;
  if (v68 > v65 - v64)
    goto LABEL_186;
  *(_QWORD *)(a1 + 120) = v64;
  *(_QWORD *)(a1 + 128) = v23;
  if (__CFADD__(v22, v23))
    goto LABEL_187;
  v24 = v22 + v23;
  if (v22 > v24 || v24 > v21)
    goto LABEL_186;
  v64 = v24;
  if (!ccder_blob_decode_tl())
    return 720920;
  v26 = v64;
  v25 = v65;
  if (v65 < v64)
    goto LABEL_186;
  v27 = v68;
  if (v68 > v65 - v64)
    goto LABEL_186;
  *(_QWORD *)(a1 + 72) = v64;
  *(_QWORD *)(a1 + 80) = v27;
  if (__CFADD__(v26, v27))
    goto LABEL_187;
  v28 = v26 + v27;
  if (v26 > v28 || v28 > v25)
    goto LABEL_186;
  v64 = v28;
  if (!ccder_blob_decode_tl())
    return 720921;
  v29 = v64;
  v30 = v65;
  if (v65 < v64)
    goto LABEL_186;
  v31 = v68;
  if (v68 > v65 - v64)
    goto LABEL_186;
  *(_QWORD *)(a1 + 104) = v64;
  *(_QWORD *)(a1 + 112) = v31;
  if (__CFADD__(v29, v31))
    goto LABEL_187;
  v32 = v29 + v31;
  if (v29 > v29 + v31 || v32 > v30)
    goto LABEL_186;
  v64 = v29 + v31;
  result = ccder_blob_decode_tl();
  if (!(_DWORD)result)
    return 720922;
  v33 = v64;
  v34 = v68;
  v35 = v64 - v32 + v68;
  if (!__CFADD__(v64 - v32, v68))
  {
    if (v35 > v30 - v32)
      goto LABEL_186;
    *(_QWORD *)(a1 + 88) = v32;
    *(_QWORD *)(a1 + 96) = v35;
    if (__CFADD__(v33, v34))
      goto LABEL_187;
    v36 = v33 + v34;
    if (v33 > v36 || v36 > v65)
      goto LABEL_186;
    v63 = v65;
    v64 = v36;
    v62 = v36;
    if ((ccder_blob_decode_tl() & 1) != 0)
      return 720923;
    if (v64 > v65)
      goto LABEL_186;
    v62 = v64;
    v63 = v65;
    if ((ccder_blob_decode_tl() & 1) != 0)
      return 720924;
    if (v64 > v65)
      goto LABEL_186;
    v62 = v64;
    v63 = v65;
    if (ccder_blob_decode_tl())
    {
      v60 = 0xAAAAAAAAAAAAAAAALL;
      v61 = 0xAAAAAAAAAAAAAAAALL;
      if (__CFADD__(v62, v68))
        goto LABEL_187;
      if (v62 > v62 + v68 || v62 + v68 > v63)
        goto LABEL_186;
      v60 = v62;
      v61 = v62 + v68;
      if (!ccder_blob_decode_tl() || !v68)
        return 720925;
      v37 = v60;
      if (__CFADD__(v60, v68))
LABEL_187:
        __break(0x5513u);
      v38 = v60 + v68;
      if (v60 > v60 + v68 || v38 > v61)
        goto LABEL_186;
      v61 = v60 + v68;
      *(_BYTE *)(a1 + 266) = 0;
      memset(&v70[2], 0, 128);
      if (a3)
        v39 = a4 == 0;
      else
        v39 = 1;
      v40 = !v39;
      memset(v70, 0, 32);
      if (v37 < v38)
      {
        v53 = 0;
        v41 = 0;
        do
        {
          v58 = 0xAAAAAAAAAAAAAAAALL;
          v59 = 0xAAAAAAAAAAAAAAAALL;
          v57 = 0;
          v56 = 0;
          if ((ccder_blob_decode_tl() & 1) == 0)
            return 720926;
          v54 = 0xAAAAAAAAAAAAAAAALL;
          v55 = 0xAAAAAAAAAAAAAAAALL;
          if (__CFADD__(v60, v56))
            goto LABEL_187;
          if (v60 > v60 + v56 || v60 + v56 > v61)
            goto LABEL_186;
          v54 = v60;
          v55 = v60 + v56;
          if (!ccder_blob_decode_tl())
            return 720927;
          if (v55 < v54 || v68 > v55 - v54)
            goto LABEL_186;
          v58 = v54;
          v59 = v68;
          if (__CFADD__(v54, v68))
            goto LABEL_187;
          if (v54 > v54 + v68 || v54 + v68 > v55)
            goto LABEL_186;
          v54 += v68;
          if (!der_get_BOOLean(&v54, 1, &v57))
            return 720928;
          if (!ccder_blob_decode_tl())
            return 720929;
          if (__CFADD__(v54, v68))
            goto LABEL_187;
          if (v55 != v54 + v68)
            return 720929;
          if (v40 && !compare_octet_string_raw((uint64_t)&v58, a3, a4))
          {
            if (v55 < v54)
              goto LABEL_186;
            v43 = v68;
            if (v68 > v55 - v54)
              goto LABEL_186;
            *(_QWORD *)(a1 + 248) = v54;
            *(_QWORD *)(a1 + 256) = v43;
          }
          if (v59 == 3)
          {
            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 15)
            {
              v16 = 720930;
              if ((v41 & 1) != 0 || (X509ExtensionParseKeyUsage() & 1) == 0)
                return v16;
              v41 |= 1u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 19)
            {
              v16 = 720931;
              if ((v41 & 2) != 0
                || (X509ExtensionParseBasicConstraints(&v54, (_QWORD *)(a1 + 200), (_BYTE *)(a1 + 265)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 2u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 35)
            {
              v16 = 720932;
              if ((v41 & 4) != 0
                || (X509ExtensionParseAuthorityKeyIdentifier(&v54, (unint64_t *)(a1 + 168), (_QWORD *)(a1 + 176)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 4u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 14)
            {
              v16 = 720933;
              if ((v41 & 8) != 0
                || (X509ExtensionParseSubjectKeyIdentifier(&v54, (unint64_t *)(a1 + 184), (_QWORD *)(a1 + 192)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 8u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 37)
            {
              v16 = 720934;
              if ((v41 & 0x10) != 0
                || (X509ExtensionParseExtendedKeyUsage(&v54, (unint64_t *)(a1 + 208), (_QWORD *)(a1 + 216)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 0x10u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(_BYTE *)(v58 + 2) == 17)
            {
              v16 = 720935;
              if ((v41 & 0x20) != 0
                || (X509ExtensionParseSubjectAltName(&v54, (unint64_t *)(a1 + 224), (_QWORD *)(a1 + 232)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 0x20u;
              goto LABEL_155;
            }
          }
          else if (v59 >= 8 && *(_DWORD *)v58 == -2042067414 && *(_DWORD *)(v58 + 3) == 1684273030)
          {
            v16 = 720936;
            if (!X509CertificateVerifyOnlyOneAppleExtension((uint64_t)&v58, (uint64_t)v70, v53))
              return v16;
            result = X509ExtensionParseAppleExtension((uint64_t)&v54, v58, v59, (uint64_t *)(a1 + 240), (unint64_t *)(a1 + 248), v40);
            if (!(_DWORD)result)
              return v16;
            if (v53 == 0xFF)
              goto LABEL_189;
            ++v53;
            goto LABEL_155;
          }
          if (__CFADD__(v54, v68))
            goto LABEL_187;
          if (v54 > v54 + v68 || v54 + v68 > v55)
            goto LABEL_186;
          v54 += v68;
          if (v57)
            *(_BYTE *)(a1 + 266) = 1;
LABEL_155:
          if (v54 != v55)
            return 720926;
          if (__CFADD__(v60, v56))
            goto LABEL_187;
          v37 = v60 + v56;
          if (v60 > v60 + v56)
            goto LABEL_186;
          v38 = v61;
          if (v37 > v61)
            goto LABEL_186;
          v60 += v56;
        }
        while (v37 < v61);
      }
      if (v37 != v38)
        return 720925;
      if (v37 > v65 || v64 > v37)
        goto LABEL_186;
      v64 = v37;
    }
    if (*(_QWORD *)(a1 + 32) < 3uLL)
    {
      v16 = 720915;
      if (v64 != v65)
        return v16;
LABEL_170:
      if (__CFADD__(v66, v69))
        goto LABEL_187;
      if (v66 > v66 + v69 || v66 + v69 > v67)
        goto LABEL_186;
      v66 += v69;
      if (!ccder_blob_decode_AlgorithmIdentifierNULL(&v66, (unint64_t *)(a1 + 40)))
        return 720937;
      *(_QWORD *)&v70[0] = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v70[0] + 1) = 0xAAAAAAAAAAAAAAAALL;
      v60 = 0;
      result = ccder_blob_decode_bitstring();
      if (!(_DWORD)result)
        return 720938;
      if (v60 < 0xFFFFFFFFFFFFFFF9)
      {
        if (*((_QWORD *)&v70[0] + 1) >= *(_QWORD *)&v70[0])
        {
          v51 = (v60 + 7) >> 3;
          if (v51 <= *((_QWORD *)&v70[0] + 1) - *(_QWORD *)&v70[0])
          {
            *(_QWORD *)(a1 + 56) = *(_QWORD *)&v70[0];
            *(_QWORD *)(a1 + 64) = v51;
            v52 = v67;
            if (v66 <= v67)
            {
              v16 = 0;
              *a2 = v66;
              a2[1] = v52;
              return v16;
            }
          }
        }
        goto LABEL_186;
      }
      goto LABEL_188;
    }
    if (v65 <= a2[1] && *a2 <= v65)
    {
      *a2 = v65;
      goto LABEL_170;
    }
LABEL_186:
    __break(0x5519u);
    goto LABEL_187;
  }
LABEL_188:
  __break(0x5500u);
LABEL_189:
  __break(0x5507u);
  return result;
}

uint64_t der_get_BOOLean(_QWORD *a1, int a2, _BYTE *a3)
{
  if (*a1 > a1[1])
    __break(0x5519u);
  if ((ccder_blob_decode_tl() & 1) != 0 || !a2)
    return 0;
  if (a3)
    *a3 = 0;
  return 1;
}

uint64_t X509ExtensionParseKeyUsage()
{
  uint64_t result;

  result = ccder_blob_decode_bitstring();
  if ((_DWORD)result)
    return 0;
  return result;
}

uint64_t X509ExtensionParseBasicConstraints(_QWORD *a1, _QWORD *a2, _BYTE *a3)
{
  uint64_t result;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    result = der_get_BOOLean(a1, 1, a3);
    if ((_DWORD)result)
    {
      if (ccder_blob_decode_uint64())
      {
        if (!*a3)
          return 0;
        *a2 = 0xAAAAAAAAAAAAAAAALL;
        *a2 = 0xAAAAAAAAAAAAAAABLL;
      }
      return 1;
    }
  }
  return result;
}

uint64_t X509ExtensionParseAuthorityKeyIdentifier(unint64_t *a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    v7 = *a1;
    if (*a1 >= 0x5555555555555556)
      goto LABEL_15;
    if (v7 - 0x5555555555555556 != a1[1])
      return 0;
    if (v7 > v7 - 0x5555555555555556)
      goto LABEL_16;
    v10 = *a1;
    v11 = v7 - 0x5555555555555556;
    result = ccder_blob_decode_tl();
    if ((_DWORD)result)
    {
      if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL)
        goto LABEL_16;
      *a2 = v10;
      *a3 = 0xAAAAAAAAAAAAAAAALL;
    }
    v8 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
LABEL_15:
      __break(0x5513u);
    }
    else
    {
      v9 = v8 - 0x5555555555555556;
      if (v8 <= v8 - 0x5555555555555556 && v9 <= a1[1])
      {
        *a1 = v9;
        return 1;
      }
    }
LABEL_16:
    __break(0x5519u);
  }
  return result;
}

uint64_t X509ExtensionParseSubjectKeyIdentifier(unint64_t *a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  unint64_t v7;
  BOOL v8;
  unint64_t v9;
  unint64_t v11;
  unint64_t v12;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    v7 = a1[1];
    v8 = v7 >= *a1;
    v9 = v7 - *a1;
    if (!v8 || v9 < 0xAAAAAAAAAAAAAAAALL)
      goto LABEL_13;
    *a2 = *a1;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    v11 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      return result;
    }
    v12 = v11 - 0x5555555555555556;
    if (v11 > v11 - 0x5555555555555556 || v12 > a1[1])
LABEL_13:
      __break(0x5519u);
    *a1 = v12;
  }
  return result;
}

uint64_t X509ExtensionParseExtendedKeyUsage(unint64_t *a1, unint64_t *a2, _QWORD *a3)
{
  int v6;
  uint64_t result;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v6 = ccder_blob_decode_tl();
  result = 0;
  if (v6)
  {
    if (*a1 > a1[1])
      goto LABEL_11;
    v10 = *a1;
    v11 = a1[1];
    result = ccder_blob_decode_tl();
    if (!(_DWORD)result)
      return result;
    if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL)
      goto LABEL_11;
    *a2 = v10;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    v8 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      return result;
    }
    v9 = v8 - 0x5555555555555556;
    if (v8 > v8 - 0x5555555555555556 || v9 > a1[1])
LABEL_11:
      __break(0x5519u);
    *a1 = v9;
  }
  return result;
}

uint64_t X509ExtensionParseSubjectAltName(unint64_t *a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  unint64_t v7;
  BOOL v8;
  unint64_t v9;
  unint64_t v11;
  unint64_t v12;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result == 1)
  {
    v7 = a1[1];
    v8 = v7 >= *a1;
    v9 = v7 - *a1;
    if (!v8 || v9 < 0xAAAAAAAAAAAAAAAALL)
      goto LABEL_13;
    *a2 = *a1;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    v11 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      return result;
    }
    v12 = v11 - 0x5555555555555556;
    if (v11 > v11 - 0x5555555555555556 || v12 > a1[1])
LABEL_13:
      __break(0x5519u);
    *a1 = v12;
  }
  return result;
}

uint64_t X509CertificateVerifyOnlyOneAppleExtension(uint64_t result, uint64_t a2, unsigned int a3)
{
  _QWORD *v5;
  unsigned __int8 v6;
  unint64_t v7;
  uint64_t v9;
  _QWORD *v10;

  if (a3 > 9)
    return 0;
  v5 = (_QWORD *)result;
  v6 = 0;
  v7 = ~a2;
  while (v7 >= 16 * (char)v6)
  {
    result = compare_octet_string((uint64_t)v5, a2 + 16 * v6);
    if (!(_DWORD)result)
      return result;
    if (a3 <= v6++)
    {
      v9 = v5[1];
      v10 = (_QWORD *)(a2 + 16 * a3);
      *v10 = *v5;
      v10[1] = v9;
      return 1;
    }
  }
  __break(0x5513u);
  return result;
}

uint64_t X509ExtensionParseAppleExtension(uint64_t result, unint64_t a2, unint64_t a3, uint64_t *a4, unint64_t *a5, int a6)
{
  uint64_t v24;
  int v44;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  if (a6)
    a5 = 0;
  if (a3 == 11)
  {
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x10901066463F786)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x400000000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x10301066463F786)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x200;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x10601066463F786)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x800;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x11801066463F786)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x2000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x12401066463F786)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x100000000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x11901066463F786)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x4000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x21901066463F786)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x8000;
      goto LABEL_261;
    }
LABEL_157:
    v44 = 0;
LABEL_158:
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 27)
      return X509ExtensionParseServerAuthMarker(result, a2, a3, a4, a5);
    if (!v44)
      goto LABEL_232;
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 832)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x400000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3586)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v54 = *a4;
      v55 = 37748736;
    }
    else
    {
      if (*(_QWORD *)a2 != 0x66463F78648862ALL || *(_WORD *)(a2 + 8) != 4354)
      {
        if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 327)
          return (uint64_t)X509ExtensionParseMFI4Properties((unint64_t *)result, a4, a5);
        if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3841)
        {
          v52 = *(_QWORD *)result;
          v51 = *(_QWORD *)(result + 8);
          if (a5)
          {
            if (v52 > v51)
              goto LABEL_265;
            *a5 = v52;
            a5[1] = v51 - v52;
          }
          *a4 |= 0x80000000uLL;
LABEL_233:
          if (v52 <= v51)
          {
            *(_QWORD *)result = v51;
            return 1;
          }
LABEL_265:
          __break(0x5519u);
          return result;
        }
        goto LABEL_232;
      }
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v54 = *a4;
      v55 = 0x8004000000;
    }
LABEL_201:
    v24 = v54 | v55;
    goto LABEL_261;
  }
  if (a3 == 10)
  {
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 5122)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x100000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 258)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v54 = *a4;
      v55 = 0x58600003F0D0;
      goto LABEL_201;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1538)
      goto LABEL_203;
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 4610)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0xF00;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3073)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x10;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1793)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x20000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3329)
    {
LABEL_203:
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x20;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 2305)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x40;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 513)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x80;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1025)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x10000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 769)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x100;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1537)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x400;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 6145)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x1000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 9217)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x80000000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8193)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x2000000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8705)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x4000000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 315)
      return X509ExtensionParseMFISWAuth((unint64_t *)result, a4, a5);
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3074)
    {
      result = ccder_blob_check_null();
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x300000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 304)
      return X509ExtensionParseGenericSSLMarker();
    v44 = 1;
    goto LABEL_158;
  }
  if (a3 != 9)
  {
    if (a3 < 0xA)
      goto LABEL_232;
    goto LABEL_157;
  }
  if (*(_QWORD *)a2 == 0xB6463F78648862ALL && *(_BYTE *)(a2 + 8) == 1)
    return X509ExtensionParseComponentAuth((unint64_t *)result, a4, a5);
  if (*(_QWORD *)a2 != 0x66463F78648862ALL || *(_BYTE *)(a2 + 8) != 49)
  {
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 44)
      return X509ExtensionParseCertifiedChipIntermediate((unint64_t *)result, a4, a5);
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 36)
      return X509ExtensionParseMFIAuthv3Leaf((unint64_t *)result);
    if (*(_QWORD *)a2 != 0x66463F78648862ALL || *(_BYTE *)(a2 + 8) != 22)
    {
      if (*(_QWORD *)a2 == 0xC6463F78648862ALL && *(_BYTE *)(a2 + 8) == 19)
      {
        result = ccder_blob_check_null();
        if (!(_DWORD)result)
          return result;
        v24 = *a4 | 0x8000000000;
        goto LABEL_261;
      }
      if (*(_QWORD *)a2 != 0xA6463F78648862ALL || *(_BYTE *)(a2 + 8) != 1)
      {
        if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 29)
        {
          result = ccder_blob_check_null();
          if (!(_DWORD)result)
            return result;
          v24 = *a4 | 0x2000000;
        }
        else
        {
          if (*(_QWORD *)a2 != 0xC6463F78648862ALL || *(_BYTE *)(a2 + 8) != 14)
          {
            if (*(_QWORD *)a2 == 0x86463F78648862ALL && *(_BYTE *)(a2 + 8) == 3)
              return X509ExtensionParseDeviceAttestationIdentity((unint64_t *)result, a4, a5);
            goto LABEL_232;
          }
          result = ccder_blob_check_null();
          if (!(_DWORD)result)
            return result;
          v24 = *a4 | 0x4000000;
        }
LABEL_261:
        *a4 = v24;
        return 1;
      }
      *a4 |= 0x1000000uLL;
LABEL_232:
      v52 = *(_QWORD *)result;
      v51 = *(_QWORD *)(result + 8);
      goto LABEL_233;
    }
    result = ccder_blob_check_null();
    if (!(_DWORD)result)
      return result;
    v54 = *a4;
    v55 = 1048584;
    goto LABEL_201;
  }
  v56 = 0;
  result = der_get_BOOLean((_QWORD *)result, 0, &v56);
  if ((_DWORD)result)
  {
    v53 = 0x10000080002;
    if (!v56)
      v53 = 0x20000040001;
    *a4 |= v53;
  }
  return result;
}

uint64_t X509CertificateParseWithExtension(unint64_t *a1, unint64_t *a2, const void *a3, size_t a4)
{
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t result;
  unint64_t v13;

  v8 = 720939;
  v9 = *a2;
  v10 = a2[1];
  if (!ccder_blob_decode_tl())
    return v8;
  v11 = *a2;
  result = X509CertificateParseImplicit((uint64_t)a1, a2, a3, a4);
  v8 = result;
  if ((_DWORD)result)
    return v8;
  if (v11 >= 0x5555555555555556)
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5500u);
    goto LABEL_12;
  }
  v8 = 720939;
  if (*a2 != v11 - 0x5555555555555556)
    return v8;
  v13 = v11 - v9 - 0x5555555555555556;
  if (v11 - v9 >= 0x5555555555555556)
    goto LABEL_11;
  if (v10 >= v9 && v13 <= v10 - v9)
  {
    *a1 = v9;
    a1[1] = v13;
    X509PolicyCheckForBlockedKeys((uint64_t)a1);
    return 0;
  }
LABEL_12:
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateParse(unint64_t *a1, unint64_t *a2)
{
  return X509CertificateParseWithExtension(a1, a2, 0, 0);
}

uint64_t X509CertificateParseSPKI(unint64_t *a1, unint64_t *a2, unint64_t *a3, _QWORD *a4)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v10;
  unint64_t v11;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v4 = *a1;
  v5 = a1[1];
  if (__CFADD__(*a1, v5))
    goto LABEL_31;
  v6 = v4 + v5;
  if (v4 > v6)
    goto LABEL_30;
  v10 = 655361;
  v14 = *a1;
  v15 = v6;
  if (!ccder_blob_decode_tl())
    return v10;
  if (!ccder_blob_decode_tl())
    return 655363;
  if (v14 >= 0x5555555555555556)
LABEL_31:
    __break(0x5513u);
  if (v14 > v14 - 0x5555555555555556 || v14 - 0x5555555555555556 > v15)
    goto LABEL_30;
  v13 = v14 - 0x5555555555555556;
  if (!ccder_blob_decode_tl())
    return 655362;
  if (a2)
  {
    if (v13 >= v14)
    {
      *a2 = v14;
      a2[1] = 0xAAAAAAAAAAAAAAAALL;
      goto LABEL_12;
    }
LABEL_30:
    __break(0x5519u);
    goto LABEL_31;
  }
LABEL_12:
  v11 = v14 - 0x5555555555555556;
  if (v14 > v14 - 0x5555555555555556 || v11 > v13)
    goto LABEL_30;
  if (v11 == v13)
  {
    if (a3)
    {
      *a3 = 0;
      a3[1] = 0;
    }
  }
  else if (a3)
  {
    *a3 = v11;
    a3[1] = v13 - v11;
  }
  if (v13 > v15 || v14 > v13)
    goto LABEL_30;
  if (!ccder_blob_decode_bitstring())
    return 655364;
  *a4 = 0;
  a4[1] = 0;
  if (v13 == v15)
    return 0;
  else
    return 655365;
}

uint64_t X509CertificateParseKey(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  result = 327691;
  if (a1)
  {
    if (*(_QWORD *)(a1 + 96))
    {
      v8 = 0;
      v9 = 0;
      result = X509CertificateParseSPKI((unint64_t *)(a1 + 88), 0, 0, &v8);
      if (!(_DWORD)result)
      {
        if (a2)
        {
          if (a3)
          {
            v7 = v9;
            *a2 = v8;
            *a3 = v7;
          }
        }
      }
    }
  }
  return result;
}

uint64_t X509CertificateCheckSignatureDigest(char a1, uint64_t a2, uint64_t *a3, __int128 *a4, __int128 *a5)
{
  uint64_t v9;
  uint64_t result;
  unsigned int (*v11)(unint64_t, uint64_t, uint64_t, uint64_t, _QWORD *);
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[3];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v28 = 0uLL;
  v27 = 0uLL;
  v25 = 0;
  v26 = 0;
  v24 = 0;
  v23 = 0u;
  v22 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = X509CertificateParseSPKI((unint64_t *)(a2 + 88), (unint64_t *)&v28, (unint64_t *)&v27, &v25);
  if ((_DWORD)v9)
    return v9;
  v9 = 655632;
  if (compare_octet_string((uint64_t)&v28, (uint64_t)&rsaEncryption))
  {
    if (compare_octet_string((uint64_t)&v28, (uint64_t)&ecPublicKey))
      return 655617;
    v11 = (unsigned int (*)(unint64_t, uint64_t, uint64_t, uint64_t, _QWORD *))validateSignatureEC;
  }
  else
  {
    v11 = (unsigned int (*)(unint64_t, uint64_t, uint64_t, uint64_t, _QWORD *))validateSignatureRSA;
  }
  memset(v14, 0, sizeof(v14));
  v19 = *a5;
  v15 = *a4;
  v17 = v28;
  v18 = v27;
  if (((a1 & 1) == 0 || compare_octet_string_raw((uint64_t)a4, &CTOidSha1, 5uLL))
    && ((a1 & 4) == 0 || compare_octet_string_raw((uint64_t)a4, &CTOidSha256, 9uLL))
    && ((a1 & 8) == 0 || compare_octet_string_raw((uint64_t)a4, &CTOidSha384, 9uLL))
    && ((a1 & 0x10) == 0 || compare_octet_string_raw((uint64_t)a4, &CTOidSha512, 9uLL)))
  {
    return v9;
  }
  result = v25;
  if (v26 || !v25)
  {
    v12 = *a3;
    v13 = a3[1];
    if (v13 || !v12)
    {
      if (v11(v25, v26, v12, v13, v14))
        return 0;
      else
        return 655648;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateCheckSignature(char a1, uint64_t a2, uint64_t a3, uint64_t a4, __int128 *a5)
{
  __int128 v8;
  uint64_t result;
  __int128 v10;
  uint64_t v11[2];
  _OWORD v12[4];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v12[2] = v8;
  v12[3] = v8;
  v12[0] = v8;
  v12[1] = v8;
  v11[0] = (uint64_t)v12;
  v11[1] = 64;
  v10 = 0uLL;
  result = X509MatchSignatureAlgorithm(a3, a4, (uint64_t)v11, &v10);
  if (!(_DWORD)result)
    return X509CertificateCheckSignatureDigest(a1, a2, v11, &v10, a5);
  return result;
}

uint64_t X509MatchSignatureAlgorithm(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t result;

  result = compare_octet_string_raw(a2, &sha1WithRSA_oid, 9uLL);
  if (!(_DWORD)result)
    goto LABEL_8;
  result = compare_octet_string_raw(a2, &sha256WithRSA_oid, 9uLL);
  if (!(_DWORD)result)
  {
LABEL_10:
    *a4 = &CTOidSha256;
    a4[1] = 9;
    if (*(_QWORD *)(a3 + 8) < 0x20uLL)
      goto LABEL_15;
    *(_QWORD *)(a3 + 8) = 32;
    ccsha256_di();
    goto LABEL_14;
  }
  result = compare_octet_string_raw(a2, &sha384WithRSA_oid, 9uLL);
  if (!(_DWORD)result)
    goto LABEL_12;
  result = compare_octet_string_raw(a2, &sha1WithECDSA_oid, 7uLL);
  if (!(_DWORD)result)
  {
LABEL_8:
    *a4 = &CTOidSha1;
    a4[1] = 5;
    if (*(_QWORD *)(a3 + 8) < 0x14uLL)
      goto LABEL_15;
    *(_QWORD *)(a3 + 8) = 20;
    ccsha1_di();
LABEL_14:
    ccdigest();
    return 0;
  }
  result = compare_octet_string_raw(a2, &sha256WithECDSA_oid, 8uLL);
  if (!(_DWORD)result)
    goto LABEL_10;
  result = compare_octet_string_raw(a2, &sha384WithECDSA_oid, 8uLL);
  if ((_DWORD)result)
    return 656640;
LABEL_12:
  *a4 = &CTOidSha384;
  a4[1] = 9;
  if (*(_QWORD *)(a3 + 8) >= 0x30uLL)
  {
    *(_QWORD *)(a3 + 8) = 48;
    ccsha384_di();
    goto LABEL_14;
  }
LABEL_15:
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateCheckSignatureWithPublicKey(uint64_t *a1, uint64_t a2, __int128 *a3, uint64_t a4, __int128 *a5, __int128 *a6)
{
  __int128 v11;
  uint64_t matched;
  unsigned int (*v13)(unint64_t, uint64_t, uint64_t, uint64_t, _QWORD *);
  __int128 v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
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
  uint64_t v28;
  __int128 v29;
  _OWORD *v30;
  uint64_t v31;
  _OWORD v32[4];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v32[2] = v11;
  v32[3] = v11;
  v32[0] = v11;
  v32[1] = v11;
  v30 = v32;
  v31 = 64;
  v29 = 0uLL;
  matched = X509MatchSignatureAlgorithm(a4, (uint64_t)a5, (uint64_t)&v30, &v29);
  if ((_DWORD)matched)
    return matched;
  matched = 655617;
  if (compare_octet_string(a2, (uint64_t)&rsaEncryption))
  {
    if (compare_octet_string(a2, (uint64_t)&ecPublicKey))
      return matched;
    v13 = (unsigned int (*)(unint64_t, uint64_t, uint64_t, uint64_t, _QWORD *))validateSignatureEC;
  }
  else
  {
    v13 = (unsigned int (*)(unint64_t, uint64_t, uint64_t, uint64_t, _QWORD *))validateSignatureRSA;
  }
  v28 = 0;
  v27 = 0u;
  v26 = 0u;
  v25 = 0u;
  v24 = 0u;
  v22 = 0u;
  v20 = 0u;
  v18 = 0u;
  v21 = *a5;
  v17 = 0;
  v23 = *a6;
  v19 = v29;
  if (a3)
    v14 = *a3;
  else
    v14 = null_octet;
  v22 = v14;
  result = *a1;
  v16 = a1[1];
  if ((v16 || !result) && (!v30 || v31))
  {
    if (v13(result, v16, (uint64_t)v30, v31, &v17))
      return 0;
    else
      return 655648;
  }
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateParseGeneralNamesContent(uint64_t a1, uint64_t (*a2)(_QWORD, int *, uint64_t), uint64_t a3)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int v9[5];
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 224);
  v4 = *(_QWORD *)(a1 + 232);
  if (__CFADD__(v3, v4))
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5519u);
  }
  v5 = v3 + v4;
  if (v3 > v5)
    goto LABEL_11;
  v10 = *(_QWORD *)(a1 + 224);
  v11 = v5;
  while (1)
  {
    if (v10 >= v11)
      return 0;
    memset(v9, 170, sizeof(v9));
    if ((ccder_blob_decode_GeneralName(&v10, v9, (unint64_t *)&v9[1]) & 1) == 0)
      break;
    if ((a2(v9[0], &v9[1], a3) & 1) == 0)
      return 0;
  }
  return 720912;
}

uint64_t X509CertificateSubjectNameGetCommonName(unint64_t *a1, unint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v6;
  unint64_t v7;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;

  v2 = *a1;
  v3 = a1[1];
  v20 = v3;
  if (__CFADD__(*a1, v3))
    goto LABEL_59;
  v4 = v2 + v3;
  if (v2 > v4)
  {
LABEL_58:
    __break(0x5519u);
    goto LABEL_59;
  }
  v6 = 720901;
  v18 = *a1;
  v19 = v4;
  *a2 = 0;
  a2[1] = 0;
  if (v2 < v4)
  {
    while (1)
    {
      if (!ccder_blob_decode_tl() || !v20)
        return 720898;
      v2 = v18;
      if (__CFADD__(v18, v20))
        break;
      v7 = v18 + v20;
      if (v18 > v18 + v20 || v7 > v19)
        goto LABEL_58;
      v16 = v18;
      v17 = v18 + v20;
      while (v2 < v7)
      {
        if (!ccder_blob_decode_tl())
          return 720899;
        if (__CFADD__(v16, v20))
          goto LABEL_59;
        if (v16 > v16 + v20 || v16 + v20 > v17)
          goto LABEL_58;
        v15 = v16 + v20;
        if (!ccder_blob_decode_tl())
          return 720900;
        v2 = v16 + v20;
        if (v16 > v15)
          goto LABEL_58;
        if (__CFADD__(v16, v20))
          goto LABEL_59;
        if (v16 > v16 + v20)
          goto LABEL_58;
        v14 = v16 + v20;
        if (v20 == 3 && *(_WORD *)v16 == 1109 && *(_BYTE *)(v16 + 2) == 3)
        {
          v12 = v16 + v20;
          v13 = v16 + v20;
          if ((ccder_blob_decode_tl() & 1) == 0)
          {
            if (v14 > v15)
              goto LABEL_58;
            v12 = v16 + v20;
            v13 = v16 + v20;
            if ((ccder_blob_decode_tl() & 1) == 0)
            {
              if (v14 > v15)
                goto LABEL_58;
              v12 = v16 + v20;
              v13 = v16 + v20;
              if (!ccder_blob_decode_tl())
                return v6;
            }
          }
          if (__CFADD__(v12, v20))
            goto LABEL_59;
          v2 = v12 + v20;
          if (v15 != v12 + v20)
            return 720902;
          if (v13 < v12 || v20 > v13 - v12)
            goto LABEL_58;
          *a2 = v12;
          a2[1] = v20;
        }
        v7 = v18 + v20;
        if (v2 > v17 || v16 > v2)
          goto LABEL_58;
        v16 = v2;
      }
      if (v2 != v7)
        return 720903;
      v4 = v19;
      if (v2 > v19 || v18 > v2)
        goto LABEL_58;
      v18 = v2;
      if (v2 >= v19)
        goto LABEL_46;
    }
LABEL_59:
    __break(0x5513u);
  }
LABEL_46:
  if (v2 != v4)
    return 720904;
  if (a2[1] && *a2)
    return 0;
  *a2 = 0;
  a2[1] = 0;
  return 720905;
}

BOOL X509CertificateValidAtTime(uint64_t a1, time_t a2)
{
  _BOOL8 result;
  time_t v5;
  time_t v6[2];

  result = 0;
  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = 0;
  v6[0] = 0;
  if (a1 && a2 != -1)
    return !X509CertificateGetNotBefore(a1, v6)
        && !X509CertificateGetNotAfter(a1, &v5)
        && difftime(a2, v6[0]) >= 0.0
        && difftime(a2, v5) <= 0.0;
  return result;
}

uint64_t X509CertificateGetNotBefore(uint64_t a1, time_t *a2)
{
  uint64_t result;
  const char *v4[3];

  v4[2] = *(const char **)MEMORY[0x24BDAC8D0];
  v4[0] = (const char *)0xAAAAAAAAAAAAAAAALL;
  v4[1] = (const char *)0xAAAAAAAAAAAAAAAALL;
  result = X509CertificateParseValidity(a1);
  if (!(_DWORD)result)
    return X509TimeConvert(v4, a2);
  return result;
}

uint64_t X509CertificateGetNotAfter(uint64_t a1, time_t *a2)
{
  uint64_t result;
  const char *v4[3];

  v4[2] = *(const char **)MEMORY[0x24BDAC8D0];
  v4[0] = (const char *)0xAAAAAAAAAAAAAAAALL;
  v4[1] = (const char *)0xAAAAAAAAAAAAAAAALL;
  result = X509CertificateParseValidity(a1);
  if (!(_DWORD)result)
    return X509TimeConvert(v4, a2);
  return result;
}

BOOL X509CertificateIsValid(uint64_t a1)
{
  time_t v2;

  v2 = time(0);
  return X509CertificateValidAtTime(a1, v2);
}

uint64_t X509CertificateParseValidity(uint64_t result)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v1 = 720906;
  if (!result)
    return v1;
  v2 = *(_QWORD *)(result + 72);
  v3 = *(_QWORD *)(result + 80);
  if (!v2 || v3 == 0)
    return v1;
  if (__CFADD__(v2, v3))
  {
    __break(0x5513u);
  }
  else
  {
    v5 = v2 + v3;
    if (v2 <= v5)
    {
      v6[0] = *(_QWORD *)(result + 72);
      v6[1] = v5;
      if (!ccder_blob_decode_Time(v6))
        return 720907;
      if (ccder_blob_decode_Time(v6))
        return 0;
      return 720908;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t X509TimeConvert(const char **a1, time_t *a2)
{
  uint64_t v2;
  const char *v4;
  __int128 v6;
  const char *v7;
  uint64_t result;
  const char *v9;
  time_t v10;
  tm v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = 720909;
  if (!a1)
    return v2;
  v4 = a1[1];
  if (((unint64_t)v4 | 2) != 0xF)
    return v2;
  v11.tm_zone = (char *)0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v11.tm_mon = v6;
  *(_OWORD *)&v11.tm_isdst = v6;
  *(_OWORD *)&v11.tm_sec = v6;
  v7 = *a1;
  if (v4 == (const char *)13)
  {
    result = (uint64_t)strptime(v7, "%y%m%d%H%M%SZ", &v11);
    if (result && v11.tm_year >= 150)
      v11.tm_year -= 100;
  }
  else
  {
    result = (uint64_t)strptime(v7, "%Y%m%d%H%M%SZ", &v11);
  }
  v9 = a1[1];
  if (!__CFADD__(*a1, v9))
  {
    if ((const char *)result != &v9[(_QWORD)*a1])
      return 720910;
    v10 = timegm(&v11);
    if (v10 == -1)
      return 720911;
    v2 = 0;
    if (a2)
      *a2 = v10;
    return v2;
  }
  __break(0x5513u);
  return result;
}

BOOL X509ExtensionParseComponentAuth(unint64_t *a1, _QWORD *a2, unint64_t *a3)
{
  unint64_t v3;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1[1];
  if (*a1 > v3)
    goto LABEL_19;
  v12 = *a1;
  v13 = a1[1];
  v11 = v3 - *a1;
  if ((ccder_blob_decode_tl() & 1) != 0)
    goto LABEL_5;
  if (*a1 > a1[1])
    goto LABEL_19;
  v12 = *a1;
  v13 = a1[1];
  if (ccder_blob_decode_tl())
  {
LABEL_5:
    v8 = v12;
    v7 = v13;
    if (v12 > v13)
      goto LABEL_19;
    *a1 = v12;
    a1[1] = v13;
    v9 = v11;
  }
  else
  {
    v8 = *a1;
    v7 = a1[1];
    v9 = v7 - *a1;
  }
  if (__CFADD__(v8, v9))
    goto LABEL_20;
  if (v7 == v8 + v9)
  {
    if (!v9)
      goto LABEL_16;
    if (!a3)
    {
LABEL_15:
      *a2 |= 0x40000000uLL;
LABEL_16:
      if (v8 <= v7)
      {
        *a1 = v7;
        return v7 == v8 + v9;
      }
      goto LABEL_19;
    }
    if (v8 <= v7 && v9 <= v7 - v8)
    {
      *a3 = v8;
      a3[1] = v9;
      goto LABEL_15;
    }
LABEL_19:
    __break(0x5519u);
LABEL_20:
    __break(0x5513u);
  }
  return v7 == v8 + v9;
}

uint64_t X509ExtensionParseCertifiedChipIntermediate(unint64_t *a1, _QWORD *a2, unint64_t *a3)
{
  uint64_t result;
  unint64_t v7;
  unint64_t v8;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    v7 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      goto LABEL_12;
    }
    v8 = v7 - 0x5555555555555556;
    if (a1[1] != v7 - 0x5555555555555556)
      return 0;
    *a2 |= 0x30000000000uLL;
    if (a3)
    {
      if (v7 > v8)
        goto LABEL_12;
      *a3 = v7;
      a3[1] = 0xAAAAAAAAAAAAAAAALL;
    }
    if (v7 <= v8)
    {
      *a1 = v8;
      return 1;
    }
LABEL_12:
    __break(0x5519u);
  }
  return result;
}

uint64_t X509ExtensionParseMFIAuthv3Leaf(unint64_t *a1)
{
  uint64_t result;
  unint64_t v3;
  unint64_t v4;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    v3 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
    }
    else
    {
      v4 = a1[1];
      if (v4 != v3 - 0x5555555555555556)
        return 0;
      if (v3 <= v4)
      {
        *a1 = v4;
        return 1;
      }
    }
    __break(0x5519u);
  }
  return result;
}

uint64_t X509ExtensionParseMFISWAuth(unint64_t *a1, _QWORD *a2, unint64_t *a3)
{
  uint64_t result;
  unint64_t v7;
  unint64_t v8;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    v7 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
    }
    else
    {
      v8 = a1[1];
      if (v8 != v7 - 0x5555555555555556)
        return 0;
      if (a3)
      {
        if (v8 < v7 || v8 - v7 < 0xAAAAAAAAAAAAAAAALL)
          goto LABEL_13;
        *a3 = v7;
        a3[1] = 0xAAAAAAAAAAAAAAAALL;
      }
      *a2 |= 0x30000000uLL;
      if (v7 <= v8)
      {
        *a1 = v8;
        return 1;
      }
    }
LABEL_13:
    __break(0x5519u);
  }
  return result;
}

uint64_t X509ExtensionParseGenericSSLMarker()
{
  ccder_blob_decode_tl();
  return 0;
}

uint64_t X509ExtensionParseServerAuthMarker(uint64_t a1, unint64_t a2, uint64_t a3, _QWORD *a4, unint64_t *a5)
{
  uint64_t result;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  BOOL v13;
  _BOOL4 v14;
  int v15;

  result = ccder_blob_check_null();
  if ((_DWORD)result)
  {
    if (a2 > 0xFFFFFFFFFFFFFFF6)
      goto LABEL_26;
    if (__CFADD__(a2, a3))
      goto LABEL_26;
    v10 = a2 + a3;
    if (a2 + a3 == -1)
      goto LABEL_26;
    v11 = a2 + 9;
    v12 = (char *)(a2 + 9);
    while (1)
    {
      v13 = (unint64_t)v12 < v10 && (unint64_t)v12 >= a2;
      v14 = v13;
      if ((unint64_t)v12 >= v10 - 1)
        break;
      if (!v14)
        goto LABEL_25;
      v15 = *v12++;
      if ((v15 & 0x80000000) == 0)
        return 0;
    }
    if (!v14)
    {
LABEL_25:
      __break(0x5519u);
LABEL_26:
      __break(0x5513u);
      return result;
    }
    if ((*v12 & 0x80000000) == 0)
    {
      if (!a5)
      {
LABEL_22:
        *a4 |= 0x100000000uLL;
        return 1;
      }
      if (v11 >= a2 && v11 <= v10)
      {
        *a5 = v11;
        a5[1] = a3 - 9;
        goto LABEL_22;
      }
      goto LABEL_25;
    }
    return 0;
  }
  return result;
}

uint64_t X509ExtensionParseDeviceAttestationIdentity(unint64_t *a1, _QWORD *a2, unint64_t *a3)
{
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  result = ccder_blob_decode_tl();
  if ((_DWORD)result)
  {
    v7 = *a1;
    if (*a1 >= 0x5555555555555556)
      goto LABEL_17;
    if (a1[1] != v7 - 0x5555555555555556)
      return 0;
    if (v7 > v7 - 0x5555555555555556)
      goto LABEL_18;
    v10 = *a1;
    v11 = v7 - 0x5555555555555556;
    result = ccder_blob_decode_tl();
    if ((_DWORD)result)
    {
      result = ccder_blob_decode_tl();
      if ((_DWORD)result)
      {
        if (a3)
        {
          if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL)
            goto LABEL_18;
          *a3 = v10;
          a3[1] = 0xAAAAAAAAAAAAAAAALL;
        }
        *a2 |= 0x240000800000uLL;
        v8 = *a1;
        if (*a1 < 0x5555555555555556)
        {
          v9 = v8 - 0x5555555555555556;
          if (v8 <= v8 - 0x5555555555555556 && v9 <= a1[1])
          {
            *a1 = v9;
            return 1;
          }
LABEL_18:
          __break(0x5519u);
          return result;
        }
LABEL_17:
        __break(0x5513u);
        goto LABEL_18;
      }
    }
  }
  return result;
}

unint64_t *X509ExtensionParseMFI4Properties(unint64_t *result, _QWORD *a2, unint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v4 = *result;
  v3 = result[1];
  v5 = v3 - *result;
  if (v5 != 32)
    return (unint64_t *)(v5 == 32);
  if (a3)
  {
    if (v4 > v3)
    {
LABEL_12:
      __break(0x5519u);
      goto LABEL_13;
    }
    *a3 = v4;
    a3[1] = 32;
  }
  *a2 |= 0xC00000000uLL;
  if (v4 < 0xFFFFFFFFFFFFFFE0)
  {
    v6 = v4 + 32;
    if (v4 + 32 <= v3 && v4 <= v6)
    {
      *result = v6;
      return (unint64_t *)(v5 == 32);
    }
    goto LABEL_12;
  }
LABEL_13:
  __break(0x5513u);
  return result;
}

unint64_t *X509ChainParseCertificateSet(unint64_t *result, unint64_t a2, uint64_t a3, _QWORD *a4, _QWORD *a5)
{
  uint64_t v5;
  BOOL v6;
  unint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  unint64_t *v19;
  unint64_t v21;

  v5 = 0;
  *a4 = 0;
  a4[1] = 0;
  v6 = *result >= result[1] || a3 == 0;
  if (v6)
  {
LABEL_6:
    if (a5)
    {
      result = 0;
      *a5 = v5;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v9 = result;
    v10 = 0;
    v11 = a2 + 304 * a3;
    v12 = ~a2;
    v13 = a4 + 1;
    v14 = (_QWORD *)(a2 + 272);
    v15 = a3 - 1;
    v21 = a2 + 272;
    while ((unsigned __int128)(v10 * (__int128)304) >> 64 == (304 * v10) >> 63 && 304 * v10 <= v12)
    {
      v16 = v14 - 34;
      if (v14 != (_QWORD *)272 && ((unint64_t)v16 >= v11 || (unint64_t)v16 < a2))
      {
LABEL_30:
        __break(0x5519u);
        break;
      }
      result = (unint64_t *)X509CertificateParse(v14 - 34, v9);
      if ((_DWORD)result)
        return result;
      if (v10)
      {
        if ((unint64_t)v16 < a2)
          goto LABEL_30;
        if ((unint64_t)(v14 + 4) > v11)
          goto LABEL_30;
        v17 = (_QWORD *)*v13;
        *v14 = 0;
        v14[1] = v17;
        if (v14 != (_QWORD *)272 && (unint64_t)v16 >= v11)
          goto LABEL_30;
        *v17 = v16;
        *v13 = (unint64_t)v14;
      }
      else
      {
        v18 = *a4;
        *(_QWORD *)(a2 + 272) = *a4;
        if (v18)
          v19 = (unint64_t *)(v18 + 280);
        else
          v19 = v13;
        *v19 = v21;
        *a4 = v16;
        *(_QWORD *)(a2 + 280) = a4;
      }
      v5 = v10 + 1;
      if (*v9 < v9[1])
      {
        v14 += 38;
        v6 = v15 == v10++;
        if (!v6)
          continue;
      }
      goto LABEL_6;
    }
    __break(0x5513u);
  }
  return result;
}

uint64_t X509ChainGetCertificateUsingKeyIdentifier(uint64_t *a1, uint64_t a2)
{
  uint64_t i;

  for (i = *a1; i; i = *(_QWORD *)(i + 272))
  {
    if (*(_QWORD *)(i + 192) && !compare_octet_string(a2, i + 184))
      break;
  }
  return i;
}

_QWORD *X509ChainResetChain(_QWORD *result, _QWORD *a2)
{
  _QWORD *v2;

  *result = 0;
  result[1] = result;
  v2 = (_QWORD *)*a2;
  if (*a2)
  {
    do
    {
      v2[36] = 0;
      v2[37] = 0;
      v2 = (_QWORD *)v2[34];
    }
    while (v2);
  }
  return result;
}

uint64_t X509ChainBuildPathPartial(_QWORD *a1, uint64_t *a2, _QWORD *a3, int a4)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t CertificateUsingKeyIdentifier;
  _QWORD *v12;
  _QWORD *v13;
  int v14;
  uint64_t BAARootUsingKeyIdentifier;
  unsigned int v16;

  if (!a1)
    return 327691;
  v7 = a1;
  *a3 = a1;
  a3[1] = a1 + 36;
  a1[36] = 0;
  a1[37] = a3;
  v8 = (uint64_t)(a1 + 15);
  result = compare_octet_string((uint64_t)(a1 + 15), (uint64_t)(a1 + 13));
  if ((_DWORD)result)
  {
    while (1)
    {
      v10 = (uint64_t)(v7 + 21);
      if (!v7[22]
        || (CertificateUsingKeyIdentifier = X509ChainGetCertificateUsingKeyIdentifier(a2, (uint64_t)(v7 + 21))) == 0
        || (v7 = (_QWORD *)CertificateUsingKeyIdentifier,
            compare_octet_string(CertificateUsingKeyIdentifier + 104, v8)))
      {
        v7 = (_QWORD *)*a2;
        if (!*a2)
        {
LABEL_16:
          if (X509ChainGetAppleRootUsingKeyIdentifier(v10, 1))
            return 0;
          BAARootUsingKeyIdentifier = X509ChainGetBAARootUsingKeyIdentifier(v10);
          if (a4)
            v16 = 0;
          else
            v16 = 524296;
          if (BAARootUsingKeyIdentifier)
            return 0;
          else
            return v16;
        }
        while (compare_octet_string(v8, (uint64_t)(v7 + 13)))
        {
          v7 = (_QWORD *)v7[34];
          if (!v7)
            goto LABEL_16;
        }
      }
      v12 = (_QWORD *)*a3;
      if (*a3)
        break;
LABEL_13:
      v13 = (_QWORD *)a3[1];
      v7[36] = 0;
      v7[37] = v13;
      *v13 = v7;
      a3[1] = v7 + 36;
      v8 = (uint64_t)(v7 + 15);
      v14 = compare_octet_string((uint64_t)(v7 + 15), (uint64_t)(v7 + 13));
      result = 0;
      if (!v14)
        return result;
    }
    while (v12 != v7)
    {
      v12 = (_QWORD *)v12[36];
      if (!v12)
        goto LABEL_13;
    }
    return 524297;
  }
  return result;
}

uint64_t X509ChainGetAppleRootUsingKeyIdentifier(uint64_t result, int a2)
{
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *i;
  uint64_t v7;

  v2 = &numAppleRoots;
  if (!a2)
    v2 = &numAppleProdRoots;
  v3 = *v2;
  if (*v2)
  {
    v4 = result;
    for (i = (uint64_t *)&AppleRoots; i < (uint64_t *)&BlockedYonkersSPKI && i >= (uint64_t *)&AppleRoots; ++i)
    {
      v7 = *i;
      result = compare_octet_string(v4, *i + 184);
      if (!(_DWORD)result)
        return v7;
      if (!--v3)
        return 0;
    }
    __break(0x5519u);
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t X509ChainGetBAARootUsingKeyIdentifier(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *i;
  uint64_t v5;

  v1 = numBAARoots;
  if (numBAARoots)
  {
    v2 = result;
    for (i = (uint64_t *)&BAARoots; i < X509PolicyImg4 && i >= (uint64_t *)&BAARoots; ++i)
    {
      v5 = *i;
      result = compare_octet_string(v2, *i + 184);
      if (!(_DWORD)result)
        return v5;
      if (!--v1)
        return 0;
    }
    __break(0x5519u);
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t X509ChainBuildPath(_QWORD *a1, uint64_t *a2, _QWORD *a3)
{
  return X509ChainBuildPathPartial(a1, a2, a3, 0);
}

uint64_t X509ChainCheckPathWithOptions(char a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  unint64_t v11;
  int v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char v16;
  unint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t AppleRootUsingKeyIdentifier;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t *v31;
  uint64_t *v32;
  char v33;
  unint64_t v34[2];
  unint64_t v35[5];

  v6 = a2;
  v35[4] = *MEMORY[0x24BDAC8D0];
  v8 = *a2;
  if (a3)
  {
    v9 = *(_QWORD *)(a3 + 48);
    if (v9)
    {
      if (*(_QWORD *)(v9 + 8))
      {
        if (compare_octet_string(v9, v8 + 208))
          return 327701;
        v8 = *v6;
      }
    }
  }
  if (v8)
  {
    v31 = v6;
    v32 = a4;
    v11 = 0;
    v12 = 0;
    v33 = 0;
    v13 = -1;
    while (1)
    {
      v14 = *(_QWORD *)(v8 + 288);
      v15 = v14 + 304;
      if (v14)
      {
LABEL_10:
        v16 = 0;
        goto LABEL_11;
      }
      if (!compare_octet_string(v8 + 120, v8 + 104))
      {
        v16 = 0;
        v15 = v8 + 304;
        v14 = v8;
        goto LABEL_11;
      }
      if (!a3)
        return v12 | 0x9000Du;
      if (*(_BYTE *)(a3 + 16))
      {
        AppleRootUsingKeyIdentifier = X509ChainGetAppleRootUsingKeyIdentifier(v8 + 168, *(unsigned __int8 *)(a3 + 17));
      }
      else
      {
        if (!*(_QWORD *)(a3 + 24))
          goto LABEL_58;
        AppleRootUsingKeyIdentifier = X509ChainGetBAARootUsingKeyIdentifier(v8 + 168);
      }
      v14 = AppleRootUsingKeyIdentifier;
      v33 |= AppleRootUsingKeyIdentifier != 0;
      v15 = AppleRootUsingKeyIdentifier + 304;
      if (AppleRootUsingKeyIdentifier)
        goto LABEL_10;
LABEL_58:
      if (!*(_BYTE *)(a3 + 19))
        return v12 | 0x9000Du;
      v14 = 0;
      v16 = 1;
LABEL_11:
      if (v11 && *(_QWORD *)(v8 + 32) >= 2uLL)
      {
        if (!*(_BYTE *)(v8 + 265))
        {
          v30 = 589825;
          return v12 | v30;
        }
        if ((*(_BYTE *)(v8 + 264) & 4) == 0)
        {
          v30 = 589826;
          return v12 | v30;
        }
      }
      v17 = *(_QWORD *)(v8 + 200);
      if (v17)
        v18 = v17 >= v11;
      else
        v18 = 1;
      if (!v18)
      {
        v30 = 589827;
        return v12 | v30;
      }
      if (*(_BYTE *)(v8 + 266))
      {
        v30 = 589831;
        return v12 | v30;
      }
      if (compare_octet_string(v8 + 40, v8 + 152))
      {
        v30 = 589828;
        return v12 | v30;
      }
      if ((v16 & 1) == 0 && *(_QWORD *)(v8 + 168) && *(_QWORD *)(v8 + 176))
      {
        if (v14 >= v15)
          goto LABEL_100;
        if (compare_octet_string(v8 + 168, v14 + 184))
          return v12 | 0x9000Au;
      }
      if (a3 && v11 && (*(_QWORD *)(v8 + 240) & *(_QWORD *)(a3 + 8)) == 0)
        X509PolicySetFlagsForCommonNames(v8);
      if (v14 == v8 && !*(_QWORD *)(v8 + 240))
      {
        X509PolicySetFlagsForRoots(a3, v8);
        if (a3)
        {
LABEL_34:
          if (*(_BYTE *)(a3 + 18) && !X509CertificateIsValid(v8))
            return v12 | 0x90009u;
          v19 = *(_QWORD *)(a3 + 8);
          if (!v11 && (*(_QWORD *)(v8 + 240) & v19) == 0)
          {
            X509PolicySetFlagsForMFI(v8);
            v19 = *(_QWORD *)(a3 + 8);
          }
          v13 &= *(_QWORD *)(v8 + 240);
          if (v19 && (v19 & v13) == 0)
          {
            v30 = 589829;
            return v12 | v30;
          }
          goto LABEL_49;
        }
      }
      else if (a3)
      {
        goto LABEL_34;
      }
      v13 &= *(_QWORD *)(v8 + 240);
LABEL_49:
      a1 |= v14 == v8;
      if ((v16 & 1) == 0)
      {
        if (v14 >= v15)
          goto LABEL_100;
        result = X509CertificateCheckSignature(a1, v14, v8 + 16, v8 + 40, (__int128 *)(v8 + 56));
        if ((_DWORD)result)
          return result;
      }
      v21 = v11 + 1;
      if (v11 == -1)
        goto LABEL_99;
      v8 = *(_QWORD *)(v8 + 288);
      v12 += 256;
      ++v11;
      if (!v8)
      {
        v6 = v31;
        a4 = v32;
        LOBYTE(v8) = v33;
        if (a3)
          goto LABEL_61;
        goto LABEL_87;
      }
    }
  }
  v21 = 0;
  v13 = -1;
  if (!a3)
    goto LABEL_87;
LABEL_61:
  if (*(_QWORD *)a3)
  {
    v22 = v21;
    if ((v8 & 1) != 0)
    {
      v22 = v21 + 1;
      if (v21 == -1)
      {
LABEL_99:
        __break(0x5500u);
LABEL_100:
        __break(0x5519u);
      }
    }
    if (*(_QWORD *)a3 != v22)
      return ((_DWORD)v22 << 8) | 0x90006u;
  }
  v23 = *(_QWORD *)(a3 + 24);
  if (!v23 || !*(_QWORD *)(v23 + 8))
  {
    if (!*(_BYTE *)(a3 + 16))
      goto LABEL_87;
    v24 = (_DWORD)v21 << 8;
    v25 = **(_QWORD **)(v6[1] + 8);
LABEL_75:
    v27 = 184;
    if ((v8 & 1) != 0)
      v27 = 168;
    v28 = X509ChainGetAppleRootUsingKeyIdentifier(v25 + v27, *(unsigned __int8 *)(a3 + 17));
    if (!v28)
      return v24 | 0x9000Bu;
    v29 = v28;
    if ((v8 & 1) == 0 && !compare_octet_string(v25 + 88, v28 + 88)
      || !X509CertificateCheckSignature(29, v29, v25 + 16, v25 + 40, (__int128 *)(v25 + 56)))
    {
      goto LABEL_87;
    }
    v26 = 589836;
    return v24 | v26;
  }
  v24 = (_DWORD)v21 << 8;
  v25 = **(_QWORD **)(v6[1] + 8);
  if (*(_BYTE *)(a3 + 16))
    goto LABEL_75;
  memset(v35, 170, 32);
  v34[0] = 0xAAAAAAAAAAAAAAAALL;
  v34[1] = 0xAAAAAAAAAAAAAAAALL;
  if (X509CertificateParseSPKI((unint64_t *)(v25 + 88), &v35[2], v34, v35))
  {
LABEL_72:
    v26 = 589832;
    return v24 | v26;
  }
  if (compare_octet_string((uint64_t)&v35[2], *(_QWORD *)(a3 + 32))
    || compare_octet_string((uint64_t)v35, *(_QWORD *)(a3 + 24)))
  {
    if (X509CertificateCheckSignatureWithPublicKey(*(uint64_t **)(a3 + 24), *(_QWORD *)(a3 + 32), *(__int128 **)(a3 + 40), v25 + 16, (__int128 *)(v25 + 40), (__int128 *)(v25 + 56)))goto LABEL_72;
  }
  else if (!compare_octet_string(*(_QWORD *)(a3 + 32), (uint64_t)&ecPublicKey))
  {
    compare_octet_string((uint64_t)v34, *(_QWORD *)(a3 + 40));
  }
LABEL_87:
  result = 0;
  if (a4)
    *a4 = v13;
  return result;
}

uint64_t X509ChainCheckPath(char a1, uint64_t *a2, uint64_t a3)
{
  return X509ChainCheckPathWithOptions(a1, a2, a3, 0);
}

uint64_t DERDecodeItem(uint64_t a1, unint64_t *a2)
{
  return DERDecodeItemPartialBufferGetLength(a1, a2, 0);
}

uint64_t DERDecodeItemPartialBufferGetLength(uint64_t result, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3;
  _BYTE *v4;
  _BYTE *v5;
  unsigned __int8 *v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int v9;
  BOOL v10;
  unint64_t v11;
  char *v12;
  unsigned __int8 v13;
  _BYTE *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unsigned int v24;
  BOOL v25;
  char v26;
  unint64_t v27;
  _BYTE *v28;

  v3 = *(_QWORD *)(result + 8);
  if (v3 < 2)
    return 3;
  v4 = *(_BYTE **)result;
  if (*(_QWORD *)result == -1)
    goto LABEL_68;
  v5 = &v4[v3];
  v6 = v4 + 1;
  v7 = v3 - 1;
  v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4)
        goto LABEL_69;
      v14 = v12 + 1;
      v15 = *v12;
      v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        if (a3 || v16 >= v15)
        {
          if (v16 >= v15)
            v17 = *v12;
          else
            v17 = v7 - 1;
          v10 = v5 >= v14;
          v18 = v5 - v14;
          if (v10 && v4 <= v14 && v17 <= v18)
          {
            a2[1] = (unint64_t)v14;
            a2[2] = v17;
            if (!a3)
              return 0;
LABEL_34:
            result = 0;
            *a3 = v15;
            return result;
          }
LABEL_69:
          __break(0x5519u);
LABEL_70:
          __break(0x5515u);
          return result;
        }
        return 3;
      }
      v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8)
        return 3;
      if ((v15 & 0x7F) == 0 || v16 < v19)
        return 3;
      if (v14 >= v5 || v14 < v4)
        goto LABEL_69;
      if (!*v14)
        return 3;
      v15 = 0;
      v21 = (v19 - 1);
      v22 = v7 - v21 - 2;
      v23 = (unint64_t)&v12[v21 + 2];
      while (v14 != (_BYTE *)-1)
      {
        if (v14 >= v5)
          goto LABEL_69;
        v10 = v16-- != 0;
        if (!v10)
          goto LABEL_70;
        v24 = *v14++;
        v15 = (v15 << 8) | v24;
        LODWORD(v19) = v19 - 1;
        if (!(_DWORD)v19)
        {
          if (a3)
            v25 = 0;
          else
            v25 = v15 > v22;
          v26 = v25;
          result = 3;
          if (v15 < 0x80 || (v26 & 1) != 0)
            return result;
          if (v15 >= v22)
            v27 = v22;
          else
            v27 = v15;
          v10 = (unint64_t)v5 >= v23;
          v28 = &v5[-v23];
          if (!v10 || (unint64_t)v4 > v23 || v27 > (unint64_t)v28)
            goto LABEL_69;
          a2[1] = v23;
          a2[2] = v27;
          if (a3)
            goto LABEL_34;
          return 0;
        }
      }
    }
LABEL_68:
    __break(0x5513u);
    goto LABEL_69;
  }
  v9 = *v6;
  v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10)
    return 3;
  v8 = 0;
  result = 3;
  while (v7 >= 2)
  {
    v11 = v8;
    if (v8 >> 57)
      break;
    if (v6 == (unsigned __int8 *)-1)
      goto LABEL_68;
    if (v6 >= v5 || v6 < v4)
      goto LABEL_69;
    v12 = (char *)(v6 + 1);
    --v7;
    v13 = *v6;
    v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54)
        return 3;
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t DERDecodeItemPartialBuffer(uint64_t result, unint64_t *a2, int a3)
{
  unint64_t v3;
  _BYTE *v4;
  _BYTE *v5;
  unsigned __int8 *v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int v9;
  BOOL v10;
  unint64_t v11;
  char *v12;
  unsigned __int8 v13;
  _BYTE *v14;
  unint64_t v15;
  unint64_t v16;
  BOOL v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v21;
  unint64_t v22;
  unsigned int v23;
  char v24;

  v3 = *(_QWORD *)(result + 8);
  if (v3 < 2)
    return 3;
  v4 = *(_BYTE **)result;
  if (*(_QWORD *)result == -1)
    goto LABEL_54;
  v5 = &v4[v3];
  v6 = v4 + 1;
  v7 = v3 - 1;
  v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4)
        goto LABEL_55;
      v14 = v12 + 1;
      v15 = *v12;
      v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        v17 = v16 < v15 && a3 == 0;
        v18 = (unint64_t)(v12 + 1);
        if (v17)
          return 3;
LABEL_28:
        if (v15 > (~v18 & 0x7FFFFFFFFFFFFFFFLL))
          return 7;
        if (v18 <= v18 + v15)
        {
          result = 0;
          a2[1] = v18;
          a2[2] = v15;
          return result;
        }
        goto LABEL_55;
      }
      v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8)
        return 3;
      if ((v15 & 0x7F) == 0 || v16 < v19)
        return 3;
      if (v14 >= v5 || v14 < v4)
      {
LABEL_55:
        __break(0x5519u);
LABEL_56:
        __break(0x5515u);
        return result;
      }
      if (!*v14)
        return 3;
      v15 = 0;
      v21 = (v19 - 1);
      v22 = v7 - v21 - 2;
      v18 = (unint64_t)&v12[v21 + 2];
      while (v14 != (_BYTE *)-1)
      {
        if (v14 >= v5)
          goto LABEL_55;
        v10 = v16-- != 0;
        if (!v10)
          goto LABEL_56;
        v23 = *v14++;
        v15 = (v15 << 8) | v23;
        LODWORD(v19) = v19 - 1;
        if (!(_DWORD)v19)
        {
          if (v15 <= v22)
            v24 = 1;
          else
            v24 = a3;
          result = 3;
          if (v15 >= 0x80 && (v24 & 1) != 0)
            goto LABEL_28;
          return result;
        }
      }
    }
LABEL_54:
    __break(0x5513u);
    goto LABEL_55;
  }
  v9 = *v6;
  v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10)
    return 3;
  v8 = 0;
  result = 3;
  while (v7 >= 2)
  {
    v11 = v8;
    if (v8 >> 57)
      break;
    if (v6 == (unsigned __int8 *)-1)
      goto LABEL_54;
    if (v6 >= v5 || v6 < v4)
      goto LABEL_55;
    v12 = (char *)(v6 + 1);
    --v7;
    v13 = *v6;
    v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54)
        return 3;
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t DERParseBitString(uint64_t result, unint64_t *a2, _BYTE *a3)
{
  unsigned int v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unsigned __int8 *v8;
  unint64_t v10;

  *a3 = 0;
  *a2 = 0;
  a2[1] = 0;
  if (!*(_QWORD *)(result + 8))
    return 3;
  v3 = **(unsigned __int8 **)result;
  *a3 = v3;
  v4 = *(_QWORD *)(result + 8);
  if (v4 != 1)
  {
    if (v3 <= 7)
    {
      v5 = v4 - 1;
      if (!v4)
      {
LABEL_20:
        __break(0x5515u);
        goto LABEL_21;
      }
      v6 = *(_QWORD *)result;
      v7 = *(_QWORD *)result + v4;
      v8 = (unsigned __int8 *)(*(_QWORD *)result + v5);
      if ((unint64_t)v8 >= v7 || (unint64_t)v8 < v6)
      {
LABEL_19:
        __break(0x5519u);
        goto LABEL_20;
      }
      if (((0xFFu >> (8 - v3)) & *v8) == 0)
      {
        if (v6 == -1)
        {
LABEL_21:
          __break(0x5513u);
          return result;
        }
        v10 = v6 + 1;
        if (v6 + 1 <= v7 && v6 <= v10)
        {
          result = 0;
          *a2 = v10;
          a2[1] = v5;
          return result;
        }
        goto LABEL_19;
      }
    }
    return 3;
  }
  if (v3)
    return 3;
  else
    return 0;
}

uint64_t DERParseBoolean(unsigned __int8 **a1, BOOL *a2)
{
  int v2;
  uint64_t result;

  if (a1[1] != (unsigned __int8 *)1)
    return 3;
  v2 = **a1;
  if (v2 != 255 && v2 != 0)
    return 3;
  result = 0;
  *a2 = v2 != 0;
  return result;
}

uint64_t DERParseBooleanWithDefault(unsigned __int8 **a1, BOOL a2, BOOL *a3)
{
  unsigned __int8 *v3;
  int v4;
  uint64_t result;

  v3 = a1[1];
  if (!v3)
    goto LABEL_9;
  if (v3 == (unsigned __int8 *)1)
  {
    v4 = **a1;
    if (v4 == 255 || v4 == 0)
    {
      a2 = v4 != 0;
LABEL_9:
      result = 0;
      *a3 = a2;
      return result;
    }
  }
  return 3;
}

uint64_t DERParseInteger(char **a1, _DWORD *a2)
{
  uint64_t result;
  unint64_t v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v4[0] = 0xAAAAAAAAAAAAAAAALL;
  result = DERParseInteger64(a1, v4);
  if (!(_DWORD)result)
  {
    if (HIDWORD(v4[0]))
    {
      return 7;
    }
    else
    {
      result = 0;
      *a2 = v4[0];
    }
  }
  return result;
}

uint64_t DERParseInteger64(char **a1, unint64_t *a2)
{
  unint64_t v2;
  unsigned __int8 *v3;
  uint64_t result;
  unint64_t v5;
  unsigned int v6;

  v2 = (unint64_t)a1[1];
  if (!v2)
    return 3;
  v3 = (unsigned __int8 *)*a1;
  if (**a1 < 0)
    return 3;
  if (**a1)
  {
    if (v2 > 8)
      return 7;
    goto LABEL_10;
  }
  if (v2 >= 2)
  {
    if (((char)v3[1] & 0x80000000) == 0)
      return 3;
    if (v2 > 9)
      return 7;
  }
LABEL_10:
  v5 = 0;
  do
  {
    v6 = *v3++;
    v5 = v6 | (v5 << 8);
    --v2;
  }
  while (v2);
  result = 0;
  *a2 = v5;
  return result;
}

uint64_t DERDecodeSeqInit(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t result;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  memset(v8, 170, 24);
  result = DERDecodeItemPartialBufferGetLength(a1, v8, 0);
  if (!(_DWORD)result)
  {
    v6 = v8[0];
    *a2 = v8[0];
    if (v6 >> 1 == 0x1000000000000008)
    {
      if (__CFADD__(v8[1], v8[2]))
      {
        __break(0x5513u);
      }
      else
      {
        v7 = v8[1] + v8[2];
        if (v8[1] <= v8[1] + v8[2])
        {
          result = 0;
          *a3 = v8[1];
          a3[1] = v7;
          return result;
        }
      }
      __break(0x5519u);
    }
    else
    {
      return 2;
    }
  }
  return result;
}

unint64_t *DERDecodeSeqContentInit(unint64_t *result, unint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = *result;
  v3 = result[1];
  if (__CFADD__(*result, v3))
  {
    __break(0x5513u);
  }
  else
  {
    v4 = v2 + v3;
    if (v2 <= v4)
    {
      *a2 = v2;
      a2[1] = v4;
      return 0;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSeqNext(unint64_t *a1, unint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v10[0] = 0;
  v2 = *a1;
  v3 = a1[1];
  if (*a1 >= v3)
    return 1;
  v10[0] = *a1;
  v10[1] = v3 - v2;
  result = DERDecodeItemPartialBufferGetLength((uint64_t)v10, a2, 0);
  if (!(_DWORD)result)
  {
    v8 = a2[1];
    v7 = a2[2];
    if (!__CFADD__(v8, v7))
    {
      v9 = v8 + v7;
      if (v9 <= a1[1] && *a1 <= v9)
      {
        result = 0;
        *a1 = v9;
        return result;
      }
      __break(0x5519u);
    }
    __break(0x5513u);
  }
  return result;
}

uint64_t DERParseSequenceToObject(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  uint64_t result;
  unint64_t v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  memset(v12, 170, 24);
  result = DERDecodeItemPartialBufferGetLength(a1, v12, 0);
  if (!(_DWORD)result)
  {
    if (v12[0] == 0x2000000000000010)
      return DERParseSequenceContentToObject(&v12[1], a2, a3, a4, a5, a6);
    else
      return 2;
  }
  return result;
}

uint64_t DERParseSequenceContentToObject(unint64_t *a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned __int16 v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;
  unsigned __int16 v17;
  __int16 v18;
  unint64_t v19;
  char *v21;
  uint64_t v23;
  unint64_t v24;
  __int16 *v25;
  unint64_t v26;
  __int16 v27;
  unint64_t v28;
  char *v29;
  unint64_t v31[3];
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v32 = 0;
  if (a6)
  {
    if (a6 > a5)
      goto LABEL_59;
    bzero((void *)a4, a6);
  }
  v10 = *a1;
  v11 = a1[1];
  if (__CFADD__(*a1, v11))
    goto LABEL_58;
  v12 = v10 + v11;
  if (v10 > v12)
LABEL_59:
    __break(0x5519u);
  v32 = *a1;
  v33 = v12;
  if (a2)
  {
    v13 = 0;
    v29 = (char *)(a4 + a5);
    while (1)
    {
      memset(v31, 170, sizeof(v31));
      v15 = v32;
      v14 = v33;
      result = DERDecodeSeqNext(&v32, v31);
      if ((_DWORD)result)
        break;
      if (a2 <= v13)
        return 2;
      while (1)
      {
        if (24 * (__int16)v13 > (unint64_t)~a3)
          goto LABEL_58;
        v17 = v13;
        v18 = *(_WORD *)(a3 + 24 * v13 + 16);
        if ((v18 & 2) != 0 || v31[0] == *(_QWORD *)(a3 + 24 * v13 + 8))
          break;
        result = 2;
        if ((v18 & 1) != 0)
        {
          ++v13;
          if (a2 > (unsigned __int16)(v17 + 1))
            continue;
        }
        return result;
      }
      if ((v18 & 4) == 0)
      {
        v19 = *(_QWORD *)(a3 + 24 * v13);
        if (v19 > 0xFFFFFFFFFFFFFFEFLL || v19 + 16 > a5)
          return 7;
        if (v19 > ~a4)
          goto LABEL_58;
        v21 = (char *)(a4 + v19);
        if (v21 >= v29 || (unint64_t)v21 < a4)
          goto LABEL_59;
        *(_OWORD *)v21 = *(_OWORD *)&v31[1];
        if ((v18 & 8) != 0)
        {
          if (v15 >= v31[1])
          {
            if (v21 + 16 <= v29 && v14 >= v15 && *((_QWORD *)v21 + 1) <= v14 - v15)
            {
              *(_QWORD *)v21 = v15;
              return 3;
            }
            goto LABEL_59;
          }
          if (v21 + 16 > v29)
            goto LABEL_59;
          v23 = *((_QWORD *)v21 + 1);
          v24 = v23 + v31[1] - v15;
          if (__CFADD__(v23, v31[1] - v15))
          {
            __break(0x5500u);
            return result;
          }
          if (v14 < v15 || v24 > v14 - v15)
            goto LABEL_59;
          *(_QWORD *)v21 = v15;
          *((_QWORD *)v21 + 1) = v24;
        }
      }
      ++v13;
      if (a2 == (unsigned __int16)(v17 + 1))
      {
        if (!__CFADD__(v31[1], v31[2]))
        {
          v28 = a1[1];
          if (!__CFADD__(*a1, v28))
          {
            v10 = v31[1] + v31[2];
            v12 = *a1 + v28;
            goto LABEL_47;
          }
        }
LABEL_58:
        __break(0x5513u);
        goto LABEL_59;
      }
      if (a2 <= (unsigned __int16)(v17 + 1))
      {
        v10 = v32;
        v12 = v33;
        goto LABEL_47;
      }
    }
    if ((_DWORD)result == 1)
    {
      if (a2 <= v13)
      {
        return 0;
      }
      else
      {
        v25 = (__int16 *)(a3 + 24 * v13 + 16);
        v26 = a2 - (unint64_t)v13;
        result = 0;
        while (1)
        {
          v27 = *v25;
          v25 += 12;
          if ((v27 & 1) == 0)
            break;
          if (!--v26)
            return result;
        }
        return 5;
      }
    }
  }
  else
  {
LABEL_47:
    if (v10 == v12)
      return 0;
    else
      return 3;
  }
  return result;
}

uint64_t DERParseSequence(uint64_t result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4)
    return DERParseSequenceToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  __break(0x5519u);
  return result;
}

unint64_t *DERParseSequenceContent(unint64_t *result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4)
    return (unint64_t *)DERParseSequenceContentToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSequenceWithBlock(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  unint64_t v4[4];

  v4[3] = *MEMORY[0x24BDAC8D0];
  memset(v4, 170, 24);
  result = DERDecodeItemPartialBufferGetLength(a1, v4, 0);
  if (!(_DWORD)result)
  {
    if (v4[0] - 0x2000000000000012 >= 0xFFFFFFFFFFFFFFFELL)
      return DERDecodeSequenceContentWithBlock(&v4[1], a2);
    else
      return 2;
  }
  return result;
}

uint64_t DERDecodeSequenceContentWithBlock(unint64_t *a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t result;
  char v7;
  unint64_t v8[3];
  unint64_t v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v9[0] = 0;
  v2 = *a1;
  v3 = a1[1];
  if (__CFADD__(*a1, v3))
  {
    __break(0x5513u);
LABEL_13:
    __break(0x5519u);
  }
  v4 = v2 + v3;
  if (v2 > v4)
    goto LABEL_13;
  v9[0] = *a1;
  v9[1] = v4;
  memset(v8, 170, sizeof(v8));
  v7 = 0;
  while (1)
  {
    LODWORD(result) = DERDecodeSeqNext(v9, v8);
    if ((_DWORD)result)
      break;
    LODWORD(result) = (*(uint64_t (**)(uint64_t, unint64_t *, char *))(a2 + 16))(a2, v8, &v7);
    if ((_DWORD)result)
      break;
    if (v7)
      return 0;
  }
  if (result <= 1)
    return 0;
  else
    return result;
}

BOOL DEROidCompare(uint64_t a1, uint64_t a2)
{
  _BOOL8 result;
  size_t v4;

  result = 0;
  if (a1 && a2)
  {
    v4 = *(_QWORD *)(a1 + 8);
    return v4 == *(_QWORD *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, v4) == 0;
  }
  return result;
}

uint64_t Img4DecodeSecureBootRsa4kSha384IM4C(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7, uint64_t a8)
{
  return Img4DecodeVerifyChainIM4C((uint64_t)&SecureBoot_root_rsa4k_pub, 526, a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t Img4DecodeLocalRsa4kSha384IM4C(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7, uint64_t a8)
{
  return Img4DecodeVerifyChainIM4C((uint64_t)&Local_root_rsa4k_pub, 526, a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t Img4DecodeShamRsa4kSha384IM4C(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7, uint64_t a8)
{
  return Img4DecodeVerifyChainIM4C((uint64_t)&Sham_root_rsa4k_pub, 526, a1, a2, a3, a4, a5, a6, a7, a8);
}

void Img4DecodeEvaluateTrust(unsigned int a1, uint64_t a2, uint64_t (*a3)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a4)
{
  Img4DecodeEvaluateTrustWithCallbacks(a1, a2, a3, (unsigned int (*)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))img4_verify_signature_with_chain, (unsigned int (*)(uint64_t, uint64_t))Img4DecodeEvaluateCertificateProperties, (void (*)(_QWORD, _QWORD, uint64_t))sha1_digest, a4);
}

double Img4DecodeCopyPayloadHash(uint64_t a1, uint64_t a2, int a3)
{
  return Img4DecodeCopyPayloadHashWithCallback(a1, (void (*)(_QWORD, _QWORD, __int128 *))sha1_digest, a2, a3);
}

double Img4DecodeCopyManifestHash(uint64_t a1, uint64_t a2, int a3)
{
  return Img4DecodeCopyManifestHashWithCallback(a1, (void (*)(void))sha1_digest, a2, a3);
}

double DERImg4DecodeFindInSequence(unint64_t *a1, uint64_t a2, _OWORD *a3)
{
  double result;
  unint64_t v7;
  __int128 v8;

  v7 = 0;
  v8 = 0uLL;
  while (!DERDecodeSeqNext(a1, &v7))
  {
    if (v7 == a2)
    {
      result = *(double *)&v8;
      *a3 = v8;
      return result;
    }
  }
  return result;
}

double DERImg4DecodeContentFindItemWithTag(unint64_t *a1, uint64_t a2, _OWORD *a3)
{
  double result;
  unint64_t v6[2];

  v6[0] = 0;
  v6[1] = 0;
  if (!DERDecodeSeqContentInit(a1, v6))
    return DERImg4DecodeFindInSequence(v6, a2, a3);
  return result;
}

uint64_t DERImg4DecodeTagCompare(uint64_t a1, unsigned int a2)
{
  unint64_t v2;
  unsigned int v5;

  v2 = *(_QWORD *)(a1 + 8);
  if (v2 < 4)
    return 0xFFFFFFFFLL;
  if (v2 != 4)
    return 1;
  v5 = 0;
  if (DERParseInteger((char **)a1, &v5))
    return 4294967294;
  if (v5 < a2)
    return 0xFFFFFFFFLL;
  return v5 > a2;
}

uint64_t DERImg4Decode(_QWORD *a1, unint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  result = 6;
  if (a1)
  {
    if (a2)
    {
      v6 = 0;
      v7 = 0;
      v8 = 0;
      result = DERDecodeItem((uint64_t)a1, &v6);
      if (!(_DWORD)result)
      {
        if (v6 == 0x2000000000000010)
        {
          v5 = a1[1];
          if (__CFADD__(*a1, v5) || __CFADD__(v7, v8))
          {
            __break(0x5513u);
          }
          else if (*a1 + v5 == v7 + v8)
          {
            result = DERParseSequenceContentToObject(&v7, 4u, (uint64_t)&DERImg4ItemSpecs, a2, 0x40uLL, 0);
            if (!(_DWORD)result)
              return 2 * (DERImg4DecodeTagCompare(a2, 0x494D4734u) != 0);
          }
          else
          {
            return 7;
          }
        }
        else
        {
          return 2;
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePayloadCompression(unint64_t *a1, char **a2)
{
  uint64_t result;
  unsigned int v5;

  v5 = 2;
  result = 6;
  if (a1)
  {
    if (a2)
    {
      result = DERParseSequenceContentToObject(a1, 2u, (uint64_t)&DERImg4CompressionItemSpecs, (unint64_t)a2, 0x20uLL, 0);
      if (!(_DWORD)result)
      {
        result = DERParseInteger(a2, &v5);
        if (!(_DWORD)result)
        {
          if (v5 <= 1)
            return 0;
          else
            return 6;
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePayloadWithProperties(uint64_t a1, unint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;

  result = 6;
  if (a1)
  {
    if (a2)
    {
      result = DERParseSequenceToObject(a1, 7u, (uint64_t)&DERImg4PayloadWithPropertiesItemSpecs, a2, 0xA0uLL, 0);
      if (!(_DWORD)result)
      {
        if (DERImg4DecodeTagCompare(a2, 0x494D3450u))
        {
          return 2;
        }
        else if (!*(_QWORD *)(a2 + 80)
               || (v7 = 0u,
                   v8 = 0u,
                   result = DERImg4DecodePayloadCompression((unint64_t *)(a2 + 80), (char **)&v7),
                   !(_DWORD)result))
        {
          v6 = *(_QWORD *)(a2 + 96);
          v5 = a2 + 96;
          if (!v6)
            return 0;
          v7 = 0u;
          v8 = 0u;
          result = DERImg4DecodePayloadProperties(v5, (unint64_t)&v7);
          if (!(_DWORD)result)
            return 0;
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePayloadProperties(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (!a2)
      return 6;
    if (*(_QWORD *)result && *(_QWORD *)(result + 8))
    {
      result = DERParseSequenceToObject(result, 2u, (uint64_t)&DERImg4PayloadPropertiesItemSpecs, a2, 0x20uLL, 0);
      if ((_DWORD)result)
        return result;
      if (DERImg4DecodeTagCompare(a2, 0x50415950u))
        return 2;
    }
    return 0;
  }
  return result;
}

uint64_t DERImg4DecodePayload(uint64_t a1, unint64_t a2)
{
  uint64_t result;
  unint64_t *v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[2];
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
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  result = 6;
  if (a1 && a2)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    result = DERImg4DecodePayloadWithProperties(a1, (unint64_t)&v11);
    if ((_DWORD)result)
    {
      result = DERParseSequenceToObject(a1, 6u, (uint64_t)&DERImg4PayloadItemSpecs, a2, 0x90uLL, 0);
      if (!(_DWORD)result)
      {
        if (DERImg4DecodeTagCompare(a2, 0x494D3450u))
        {
          return 2;
        }
        else
        {
          v6 = *(_QWORD *)(a2 + 80);
          v5 = (unint64_t *)(a2 + 80);
          if (!v6)
            return 0;
          memset(v10, 0, sizeof(v10));
          result = DERImg4DecodePayloadCompression(v5, (char **)v10);
          if (!(_DWORD)result)
            return 0;
        }
      }
    }
    else
    {
      v7 = v12;
      *(_OWORD *)a2 = v11;
      *(_OWORD *)(a2 + 16) = v7;
      v8 = v14;
      *(_OWORD *)(a2 + 32) = v13;
      *(_OWORD *)(a2 + 48) = v8;
      v9 = v16;
      *(_OWORD *)(a2 + 64) = v15;
      *(_OWORD *)(a2 + 80) = v9;
    }
  }
  return result;
}

uint64_t DERImg4DecodeManifest(_QWORD *a1, unint64_t a2)
{
  return DERImg4DecodeManifestCommon(a1, 5uLL, (uint64_t)&DERImg4ManifestItemSpecs, a2, 0x494D344Du);
}

uint64_t DERImg4DecodeManifestCommon(_QWORD *a1, unint64_t a2, uint64_t a3, unint64_t a4, unsigned int a5)
{
  uint64_t result;
  unsigned int v9;

  result = 6;
  if (a1 && a4)
  {
    if (!*a1 || !a1[1])
      return 0;
    if (a2 >= 0x10000)
    {
      __break(0x5507u);
      return result;
    }
    result = DERParseSequenceToObject((uint64_t)a1, (unsigned __int16)a2, a3, a4, 0xC0uLL, 0);
    if (!(_DWORD)result)
    {
      if (DERImg4DecodeTagCompare(a4, a5))
        return 2;
      v9 = 0;
      result = DERParseInteger((char **)(a4 + 16), &v9);
      if ((_DWORD)result)
        return result;
      if (v9 > 2)
        return 2;
      return 0;
    }
  }
  return result;
}

uint64_t DERImg4DecodeUnsignedManifest(_QWORD *a1, unint64_t a2)
{
  return DERImg4DecodeManifestCommon(a1, 3uLL, (uint64_t)&DERImg4UnsignedManifestItemSpecs, a2, 0x494D344Du);
}

uint64_t DERImg4DecodeCertificate(_QWORD *a1, unint64_t a2)
{
  return DERImg4DecodeManifestCommon(a1, 4uLL, (uint64_t)&DERImg4CertificateItemSpecs, a2, 0x494D3443u);
}

uint64_t DERImg4DecodeUnsignedCertificate(_QWORD *a1, unint64_t a2)
{
  return DERImg4DecodeManifestCommon(a1, 3uLL, (uint64_t)&DERImg4UnsignedManifestItemSpecs, a2, 0x494D3443u);
}

uint64_t DERImg4DecodeCertificatePropertiesAndPubKey(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6)
{
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD v21[2];

  v18 = 0;
  v19 = 0;
  v20 = 0;
  result = 6;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            if (a6)
            {
              v21[0] = a1;
              v21[1] = a2;
              v16 = 0u;
              v17 = 0u;
              v14 = 0u;
              v15 = 0u;
              result = DERDecodeItem((uint64_t)v21, &v18);
              if (!(_DWORD)result)
              {
                if (v18 != 0x2000000000000011)
                  return 2;
                if (!DERParseSequenceContentToObject(&v19, 2u, (uint64_t)&DERIM4CItemSpecs, (unint64_t)&v16, 0x20uLL, 0))
                {
                  result = DERDecodeItem((uint64_t)&v16, &v18);
                  if ((_DWORD)result)
                    return result;
                  if (v18 != 0x2000000000000010)
                    return 2;
                  if (!DERParseSequenceContentToObject(&v19, 2u, (uint64_t)&DERCRTPSequenceItemSpecs, (unint64_t)&v14, 0x20uLL, 0))
                  {
                    v12 = *((_QWORD *)&v15 + 1);
                    *a3 = v15;
                    *a4 = v12;
                    result = DERDecodeItem((uint64_t)&v17, &v18);
                    if ((_DWORD)result)
                      return result;
                    if (v18 == 4)
                    {
                      result = 0;
                      v13 = v20;
                      *a5 = v19;
                      *a6 = v13;
                      return result;
                    }
                    return 2;
                  }
                }
                return 0xFFFFFFFFLL;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodeRestoreInfo(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (!a2)
      return 6;
    if (*(_QWORD *)result && *(_QWORD *)(result + 8))
    {
      result = DERParseSequenceToObject(result, 2u, (uint64_t)&DERImg4RestoreInfoItemSpecs, a2, 0x20uLL, 0);
      if ((_DWORD)result)
        return result;
      if (DERImg4DecodeTagCompare(a2, 0x494D3452u))
        return 2;
    }
    return 0;
  }
  return result;
}

uint64_t DERImg4DecodeProperty(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  __int128 v13;
  unint64_t v14;
  __int128 v15;

  result = 6;
  if (a1)
  {
    if (a3)
    {
      v14 = 0;
      v15 = 0uLL;
      v13 = 0uLL;
      v11 = 0;
      v12 = 0;
      v9 = 0;
      v10 = 0;
      v8 = 0;
      result = DERDecodeSeqInit((uint64_t)a1, &v9, &v10);
      if (!(_DWORD)result)
      {
        if (v9 != 0x2000000000000010)
          return 2;
        result = DERDecodeSeqNext(&v10, &v14);
        if ((_DWORD)result)
          return result;
        if (v14 != 22)
          return 2;
        result = DERParseInteger((char **)&v15, &v8);
        if ((_DWORD)result)
          return result;
        if ((v8 | 0xE000000000000000) != a2)
          return 2;
        *(_OWORD *)a3 = v15;
        result = DERDecodeSeqNext(&v10, &v12);
        if ((_DWORD)result)
          return result;
        *(_QWORD *)(a3 + 40) = v12;
        *(_OWORD *)(a3 + 24) = v13;
        result = DERDecodeSeqNext(&v10, &v12);
        if ((_DWORD)result != 1)
          return 2;
        v7 = a1[1];
        if (__CFADD__(*a1, v7))
        {
          __break(0x5513u);
        }
        else if (v11 == *a1 + v7)
        {
          return 0;
        }
        else
        {
          return 7;
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePropertyWithItem(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t result;
  unsigned int v8;
  _QWORD v9[4];
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v8 = 0;
  v9[0] = 0;
  v9[2] = 0;
  v9[1] = 22;
  v9[3] = 24;
  v10 = a3;
  result = DERParseSequenceToObject(a1, 2u, (uint64_t)v9, a4, 0x30uLL, 0);
  if (!(_DWORD)result)
  {
    result = DERParseInteger((char **)a4, &v8);
    if (!(_DWORD)result)
    {
      if ((v8 | 0xE000000000000000) == a2)
      {
        result = 0;
        *(_QWORD *)(a4 + 16) = a2 | 0xE000000000000000;
        *(_QWORD *)(a4 + 40) = a3;
      }
      else
      {
        return 2;
      }
    }
  }
  return result;
}

void DERImg4DecodeFindPropertyInSequence(unint64_t *a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  int v7;
  __int128 v8;

  v8 = 0uLL;
  DERImg4DecodeFindInSequence(a1, a2, &v8);
  if (!v7)
    DERImg4DecodePropertyWithItem((uint64_t)&v8, a2, a3, a4);
}

void DERImg4DecodeFindProperty(unint64_t *a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7[2];

  v7[0] = 0;
  v7[1] = 0;
  if (!DERDecodeSeqContentInit(a1, v7))
    DERImg4DecodeFindPropertyInSequence(v7, a2, a3, a4);
}

void DERImg4DecodeParseManifestProperties(uint64_t a1, unint64_t a2, unint64_t a3)
{
  DERImg4DecodeParseManifestPropertiesInternal(a1, a2, a3, 0x4D414E42u);
}

void DERImg4DecodeParseManifestPropertiesInternal(uint64_t a1, unint64_t a2, unint64_t a3, unsigned int a4)
{
  unint64_t v8;
  int v9;
  int v10;
  int v11;
  _OWORD v12[3];
  _OWORD v13[3];
  unint64_t v14;
  unint64_t v15[2];

  v11 = 0;
  if (a1)
  {
    if (a2 | a3)
    {
      v14 = 0;
      v15[0] = 0;
      v15[1] = 0;
      memset(v13, 0, sizeof(v13));
      memset(v12, 0, sizeof(v12));
      if (!DERDecodeItem(a1 + 264, &v14)
        && v14 == 0x2000000000000011
        && !DERParseInteger((char **)(a1 + 248), &v11))
      {
        v8 = v11 == 2 ? 0x2000000000000010 : 0x2000000000000011;
        DERImg4DecodeFindProperty(v15, a4 | 0xE000000000000000, v8, (unint64_t)v13);
        if (!v9)
        {
          if (a2)
            *(_OWORD *)a2 = *(_OWORD *)((char *)&v13[1] + 8);
          DERImg4DecodeFindProperty((unint64_t *)&v13[1] + 1, 0xE00000004D414E50, 0x2000000000000011uLL, (unint64_t)v12);
          if (a3)
          {
            if (!v10)
              *(_OWORD *)a3 = *(_OWORD *)((char *)&v12[1] + 8);
          }
        }
      }
    }
  }
}

void DERImg4DecodeParseCertificateProperties(uint64_t a1, unint64_t a2, unint64_t a3)
{
  DERImg4DecodeParseManifestPropertiesInternal(a1, a2, a3, 0x43525450u);
}

uint64_t Img4DecodeParseLengthFromBufferWithTag(uint64_t a1, uint64_t a2, unsigned int a3, _QWORD *a4)
{
  uint64_t result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD v14[2];
  unint64_t v15;
  _QWORD v16[2];
  _QWORD v17[2];

  v11 = 0;
  v12 = 0;
  v16[0] = 0;
  v16[1] = 0;
  v14[1] = 0;
  v15 = 0;
  result = 0xFFFFFFFFLL;
  v13 = 0;
  v14[0] = 0;
  if (a1)
  {
    if (a4)
    {
      v17[0] = a1;
      v17[1] = a2;
      result = DERDecodeItemPartialBufferGetLength((uint64_t)v17, &v15, &v12);
      if (!(_DWORD)result)
      {
        if (v12)
        {
          if (v15 != 0x2000000000000010)
            return 2;
          result = DERDecodeItemPartialBufferGetLength((uint64_t)v16, &v13, &v11);
          if ((_DWORD)result)
            return result;
          if (v11)
          {
            result = DERImg4DecodeTagCompare((uint64_t)v14, a3);
            if (!(_DWORD)result)
            {
              v8 = v16[0] - a1;
              if (v12 >= ~(v16[0] - a1))
                return 7;
              v9 = __CFADD__(v12, v8);
              v10 = v12 + v8;
              if (v9)
              {
                __break(0x5500u);
              }
              else
              {
                result = 0;
                *a4 = v10;
              }
              return result;
            }
            return 2;
          }
        }
        return 3;
      }
    }
  }
  return result;
}

uint64_t Img4DecodeParseLengthFromBuffer(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  return Img4DecodeParseLengthFromBufferWithTag(a1, a2, 0x494D4734u, a3);
}

uint64_t Img4DecodePayloadExists(uint64_t a1, BOOL *a2)
{
  uint64_t result;
  BOOL v4;

  result = 6;
  if (a1 && a2)
  {
    if (*(_QWORD *)(a1 + 136))
      v4 = *(_QWORD *)(a1 + 144) != 0;
    else
      v4 = 0;
    result = 0;
    *a2 = v4;
  }
  return result;
}

uint64_t Img4DecodeGetPayload(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  BOOL v5;

  if (a1 && a2)
  {
    v5 = 0;
    result = Img4DecodePayloadExists(a1, &v5);
    if (!(_DWORD)result)
    {
      if (v5)
      {
        result = 0;
        *(_OWORD *)a2 = *(_OWORD *)(a1 + 136);
        return result;
      }
      result = 1;
    }
    goto LABEL_9;
  }
  result = 6;
  if (a2)
  {
LABEL_9:
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
  }
  return result;
}

uint64_t Img4DecodeGetPayloadType(uint64_t a1, _DWORD *a2)
{
  uint64_t result;
  BOOL v5;

  v5 = 0;
  result = 6;
  if (!a1 || !a2 || (result = Img4DecodePayloadExists(a1, &v5), (_DWORD)result))
  {
LABEL_6:
    if (!a2)
      return result;
    goto LABEL_7;
  }
  if (v5)
  {
    result = DERParseInteger((char **)(a1 + 104), a2);
    goto LABEL_6;
  }
  result = 1;
  if (!a2)
    return result;
LABEL_7:
  if ((_DWORD)result)
    *a2 = 0;
  return result;
}

uint64_t Img4DecodeGetPayloadVersion(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  BOOL v5;

  if (a1 && a2)
  {
    v5 = 0;
    result = Img4DecodePayloadExists(a1, &v5);
    if (!(_DWORD)result)
    {
      if (v5)
      {
        result = 0;
        *(_OWORD *)a2 = *(_OWORD *)(a1 + 120);
        return result;
      }
      result = 1;
    }
    goto LABEL_9;
  }
  result = 6;
  if (a2)
  {
LABEL_9:
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
  }
  return result;
}

uint64_t Img4DecodePayloadKeybagExists(uint64_t a1, BOOL *a2)
{
  uint64_t result;
  BOOL v4;

  result = 6;
  if (a1 && a2)
  {
    if (*(_QWORD *)(a1 + 152))
      v4 = *(_QWORD *)(a1 + 160) != 0;
    else
      v4 = 0;
    result = 0;
    *a2 = v4;
  }
  return result;
}

uint64_t Img4DecodeGetPayloadKeybag(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  BOOL v5;

  if (a1 && a2)
  {
    v5 = 0;
    result = Img4DecodePayloadExists(a1, &v5);
    if (!(_DWORD)result)
    {
      if (v5)
      {
        result = 0;
        *(_OWORD *)a2 = *(_OWORD *)(a1 + 152);
        return result;
      }
      result = 1;
    }
    goto LABEL_9;
  }
  result = 6;
  if (a2)
  {
LABEL_9:
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
  }
  return result;
}

uint64_t Img4DecodePayloadCompressionInfoExists(uint64_t a1, BOOL *a2)
{
  uint64_t result;
  BOOL v4;

  result = 6;
  if (a1 && a2)
  {
    if (*(_QWORD *)(a1 + 168))
      v4 = *(_QWORD *)(a1 + 176) != 0;
    else
      v4 = 0;
    result = 0;
    *a2 = v4;
  }
  return result;
}

uint64_t Img4DecodeGetPayloadCompressionInfo(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t result;
  unint64_t *v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  BOOL v11;

  v11 = 0;
  result = 6;
  if (!a1)
    goto LABEL_14;
  if (!a2)
    goto LABEL_14;
  if (!a3)
    goto LABEL_14;
  result = Img4DecodePayloadExists(a1, &v11);
  if ((_DWORD)result)
    goto LABEL_14;
  if (!v11)
    goto LABEL_13;
  result = Img4DecodePayloadCompressionInfoExists(a1, &v11);
  if ((_DWORD)result)
    goto LABEL_14;
  if (!v11)
  {
LABEL_13:
    result = 1;
    goto LABEL_14;
  }
  v9 = 0u;
  v10 = 0u;
  v8 = *(_QWORD *)(a1 + 168);
  v7 = (unint64_t *)(a1 + 168);
  if (!v8)
  {
    result = 0xFFFFFFFFLL;
    if (!a2)
      return result;
LABEL_15:
    if (a3)
    {
      *a2 = -1;
      *a3 = -1;
    }
    return result;
  }
  result = DERParseSequenceContentToObject(v7, 2u, (uint64_t)&DERImg4CompressionItemSpecs, (unint64_t)&v9, 0x20uLL, 0);
  if ((_DWORD)result
    || (result = DERParseInteger((char **)&v9, a2), (_DWORD)result)
    || (result = DERParseInteger((char **)&v10, a3), (_DWORD)result))
  {
LABEL_14:
    if (!a2)
      return result;
    goto LABEL_15;
  }
  return result;
}

double Img4DecodeCopyPayloadHashWithCallback(uint64_t a1, void (*a2)(_QWORD, _QWORD, __int128 *), uint64_t a3, int a4)
{
  __int128 v7;
  BOOL v9;
  __int128 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (!a1 || a4 != 20 || !a3)
  {
    if (!a3)
      return *(double *)&v7;
LABEL_9:
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
    return *(double *)&v7;
  }
  v9 = 0;
  if (Img4DecodePayloadExists(a1, &v9) || !v9)
    goto LABEL_9;
  if (*(_BYTE *)a1)
  {
    v7 = *(_OWORD *)(a1 + 184);
    *(_DWORD *)(a3 + 16) = *(_DWORD *)(a1 + 200);
    *(_OWORD *)a3 = v7;
  }
  else
  {
    v10 = 0uLL;
    v11 = 0;
    a2(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), &v10);
    *(_QWORD *)&v7 = v10;
    *(_OWORD *)a3 = v10;
    *(_DWORD *)(a3 + 16) = v11;
  }
  return *(double *)&v7;
}

uint64_t Img4DecodeCopyPayloadDigest(uint64_t a1, void *a2, size_t a3, uint64_t (**a4)(_QWORD, _QWORD, _OWORD *, size_t, _QWORD))
{
  uint64_t v4;
  BOOL v10;
  _OWORD __src[3];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = 6;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          v10 = 0;
          if (*a4)
          {
            if (!Img4DecodePayloadExists(a1, &v10))
            {
              if (v10)
              {
                if (a3 > 0x30)
                {
                  return 7;
                }
                else if (*(_BYTE *)a1)
                {
                  memcpy(a2, (const void *)(a1 + 184), a3);
                  return 0;
                }
                else
                {
                  memset(__src, 0, sizeof(__src));
                  v4 = (*a4)(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), __src, a3, a4);
                  if (!(_DWORD)v4)
                    memcpy(a2, __src, a3);
                }
              }
              else
              {
                return 1;
              }
            }
          }
        }
      }
    }
  }
  return v4;
}

uint64_t Img4DecodeManifestExists(uint64_t a1, BOOL *a2)
{
  uint64_t result;

  result = 6;
  if (a1)
  {
    if (a2)
    {
      result = 0;
      *a2 = *(_QWORD *)(a1 + 24) != 0;
    }
  }
  return result;
}

double Img4DecodeCopyManifestHashWithCallback(uint64_t a1, void (*a2)(void), uint64_t a3, int a4)
{
  __int128 v5;

  if (!a1 || a4 != 20 || !a3)
  {
    if (!a3)
      return *(double *)&v5;
LABEL_8:
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
    return *(double *)&v5;
  }
  if (!*(_QWORD *)(a1 + 24))
    goto LABEL_8;
  if (*(_BYTE *)(a1 + 1))
  {
    v5 = *(_OWORD *)(a1 + 328);
    *(_DWORD *)(a3 + 16) = *(_DWORD *)(a1 + 344);
    *(_OWORD *)a3 = v5;
  }
  else
  {
    a2();
    *(_QWORD *)&v5 = 0;
    *(_OWORD *)a3 = 0uLL;
    *(_DWORD *)(a3 + 16) = 0;
  }
  return *(double *)&v5;
}

uint64_t Img4DecodeCopyManifestDigest(uint64_t a1, void *__dst, size_t __n, uint64_t (**a4)(uint64_t, _QWORD, _OWORD *, size_t, _QWORD))
{
  uint64_t v4;
  uint64_t (*v7)(uint64_t, _QWORD, _OWORD *, size_t, _QWORD);
  uint64_t v8;
  _OWORD v10[3];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = 6;
  if (a1)
  {
    if (__dst)
    {
      if (__n)
      {
        if (a4)
        {
          v7 = *a4;
          if (*a4)
          {
            v8 = *(_QWORD *)(a1 + 24);
            if (v8)
            {
              if (__n > 0x30)
              {
                return 7;
              }
              else if (*(_BYTE *)(a1 + 1))
              {
                memcpy(__dst, (const void *)(a1 + 328), __n);
                return 0;
              }
              else
              {
                memset(v10, 0, sizeof(v10));
                v4 = v7(v8, *(_QWORD *)(a1 + 32), v10, __n, a4);
                if (!(_DWORD)v4)
                  memcpy(__dst, v10, __n);
              }
            }
            else
            {
              return 1;
            }
          }
        }
      }
    }
  }
  return v4;
}

uint64_t Img4DecodeGetManifest(uint64_t a1, _QWORD *a2, _DWORD *a3)
{
  uint64_t result;
  uint64_t v5;
  int v6;
  BOOL v7;
  int v8;

  result = 6;
  if (a1 && a2 && a3)
  {
    v5 = *(_QWORD *)(a1 + 24);
    *a2 = v5;
    v6 = *(_DWORD *)(a1 + 32);
    *a3 = v6;
    if (v5)
      v7 = v6 == 0;
    else
      v7 = 1;
    v8 = v7;
    return (v8 << 31 >> 31);
  }
  return result;
}

uint64_t Img4DecodeSectionExists(_QWORD *a1, unsigned int a2, char *a3)
{
  uint64_t v3;
  char v4;

  v3 = 6;
  if (a2 <= 1 && a1 && a3)
  {
    if (a2 == 1)
    {
      if (!a1[55] || !a1[56])
        goto LABEL_11;
    }
    else if (!a1[33] || !a1[34])
    {
LABEL_11:
      v4 = 0;
      goto LABEL_12;
    }
    v4 = 1;
LABEL_12:
    v3 = 0;
    *a3 = v4;
  }
  return v3;
}

uint64_t Img4DecodeRestoreInfoExists(_QWORD *a1, char *a2)
{
  return Img4DecodeSectionExists(a1, 1u, a2);
}

uint64_t Img4DecodeGetRestoreInfoBoolean(uint64_t a1, uint64_t a2, BOOL *a3)
{
  return Img4DecodeGetBooleanFromSection(a1, 1u, a2, a3);
}

uint64_t Img4DecodeGetBooleanFromSection(uint64_t a1, unsigned int a2, uint64_t a3, BOOL *a4)
{
  uint64_t v4;
  uint64_t v6;
  _OWORD v8[3];

  memset(v8, 0, sizeof(v8));
  v4 = 6;
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000, 1uLL, v8);
      v4 = v6;
      if (!(_DWORD)v6)
        return DERParseBoolean((unsigned __int8 **)&v8[1] + 1, a4);
    }
  }
  return v4;
}

void Img4DecodeGetRestoreInfoInteger(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  Img4DecodeGetIntegerFromSection(a1, 1u, a2, a3);
}

void Img4DecodeGetIntegerFromSection(uint64_t a1, unsigned int a2, uint64_t a3, _DWORD *a4)
{
  int v5;
  _OWORD v6[3];

  memset(v6, 0, sizeof(v6));
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000, 2uLL, v6);
      if (!v5)
      {
        if (DERParseInteger((char **)&v6[1] + 1, a4))
          *a4 = 0;
      }
    }
  }
}

void Img4DecodeGetRestoreInfoInteger64(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  Img4DecodeGetInteger64FromSection(a1, 1u, a2, a3);
}

void Img4DecodeGetInteger64FromSection(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t *a4)
{
  int v5;
  _OWORD v6[3];

  memset(v6, 0, sizeof(v6));
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000, 2uLL, v6);
      if (!v5)
      {
        if (DERParseInteger64((char **)&v6[1] + 1, a4))
          *a4 = 0;
      }
    }
  }
}

void Img4DecodeGetRestoreInfoData(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  Img4DecodeGetDataFromSection(a1, 1u, a2, a3, a4);
}

void Img4DecodeGetDataFromSection(uint64_t a1, unsigned int a2, uint64_t a3, _QWORD *a4, _QWORD *a5)
{
  int v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  if (a1 && a4 && a5)
  {
    Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000, 4uLL, &v9);
    if (v7)
    {
      *a5 = 0;
      *a4 = 0;
    }
    else
    {
      v8 = v11;
      *a4 = *((_QWORD *)&v10 + 1);
      *a5 = v8;
    }
  }
}

uint64_t Img4DecodePayloadPropertiesExists(uint64_t a1, BOOL *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  _OWORD v7[6];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 6;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  result = 6;
  memset(v7, 0, sizeof(v7));
  if (a2)
  {
    v6 = *(_QWORD *)(a1 + 8);
    v5 = a1 + 8;
    if (v6)
    {
      result = DERImg4DecodePayloadWithProperties(v5, (unint64_t)v7);
      if (!(_DWORD)result)
        *a2 = (_QWORD)v8 != 0;
    }
  }
  return result;
}

void Img4DecodePayloadProperty(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  int v7;
  int v8;
  __int128 v9;
  __int128 v10;
  _OWORD v11[6];
  _OWORD v12[4];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    if (a4)
    {
      if (*(_QWORD *)(a1 + 8))
      {
        v10 = 0uLL;
        v9 = 0uLL;
        memset(v11, 0, sizeof(v11));
        memset(v12, 0, sizeof(v12));
        if (!DERImg4DecodePayloadWithProperties(a1 + 8, (unint64_t)v11))
        {
          if (*(_QWORD *)&v12[0])
          {
            DERImg4DecodeContentFindItemWithTag((unint64_t *)v12, 0x2000000000000010, &v10);
            if (!v7)
            {
              DERImg4DecodeContentFindItemWithTag((unint64_t *)&v10, 0x2000000000000011, &v9);
              if (!v8)
                DERImg4DecodeFindProperty((unint64_t *)&v9, a2, a3, a4);
            }
          }
        }
      }
    }
  }
}

void Img4DecodePayloadPropertyExistsByTag(uint64_t a1, uint64_t a2, BOOL *a3)
{
  int v5;
  int v6;
  int v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
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
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v10 = 0uLL;
    v9 = 0uLL;
    v8 = 0uLL;
    if (a3)
    {
      if (*(_QWORD *)(a1 + 8))
      {
        v19 = 0uLL;
        v20 = 0uLL;
        v17 = 0uLL;
        v18 = 0uLL;
        v15 = 0uLL;
        v16 = 0uLL;
        v13 = 0uLL;
        v14 = 0uLL;
        v11 = 0uLL;
        v12 = 0uLL;
        if (!DERImg4DecodePayloadWithProperties(a1 + 8, (unint64_t)&v11))
        {
          if ((_QWORD)v17)
          {
            DERImg4DecodeContentFindItemWithTag((unint64_t *)&v17, 0x2000000000000010, &v10);
            if (!v5)
            {
              DERImg4DecodeContentFindItemWithTag((unint64_t *)&v10, 0x2000000000000011, &v9);
              if (!v6)
              {
                DERImg4DecodeContentFindItemWithTag((unint64_t *)&v9, a2, &v8);
                if (!v7)
                  *a3 = (_QWORD)v8 != 0;
              }
            }
          }
        }
      }
    }
  }
}

uint64_t Img4DecodeGetPayloadProperties(uint64_t a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _OWORD v8[6];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 6;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  result = 6;
  memset(v8, 0, sizeof(v8));
  if (a2)
  {
    v6 = *(_QWORD *)(a1 + 8);
    v5 = a1 + 8;
    if (v6)
    {
      result = DERImg4DecodePayloadWithProperties(v5, (unint64_t)v8);
      if (!(_DWORD)result)
      {
        if ((_QWORD)v9)
        {
          result = 0;
          v7 = *((_QWORD *)&v9 + 1);
          *a2 = v9;
          a2[1] = v7;
          return result;
        }
        return 6;
      }
    }
  }
  return result;
}

uint64_t Img4DecodeCopyPayloadPropertiesDigest(_QWORD *a1, void *a2, size_t a3, uint64_t (**a4)(_QWORD, _QWORD, _OWORD *, size_t, _QWORD))
{
  uint64_t result;
  uint64_t (*v8)(_QWORD, _QWORD, _OWORD *, size_t, _QWORD);
  _OWORD v9[3];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  result = 6;
  if (a1 && a2 && a3)
  {
    if (a3 > 0x30)
    {
      return 7;
    }
    else if (a4)
    {
      v8 = *a4;
      if (*a4)
      {
        memset(v9, 0, sizeof(v9));
        result = v8(*a1, a1[1], v9, a3, a4);
        if (!(_DWORD)result)
        {
          memcpy(a2, v9, a3);
          return 0;
        }
      }
    }
  }
  return result;
}

void Img4DecodePayloadPropertiesFindItemWithTag(unint64_t *a1, unsigned int a2, _QWORD *a3)
{
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17[3];
  unint64_t v18;
  unint64_t v19[2];
  unint64_t v20;
  _QWORD v21[2];
  unint64_t v22[2];
  unint64_t v23[2];

  if (a1)
  {
    v23[0] = 0;
    v23[1] = 0;
    v22[0] = 0;
    v22[1] = 0;
    v21[0] = 0;
    v21[1] = 0;
    v20 = 0;
    v19[0] = 0;
    v19[1] = 0;
    v18 = 0;
    memset(v17, 0, sizeof(v17));
    v15 = 0;
    v16 = 0;
    v14 = 0;
    v13 = 0uLL;
    v12 = 0uLL;
    v11 = 0uLL;
    if (a3)
    {
      if (*a1)
      {
        DERImg4DecodeContentFindItemWithTag(a1, 0x2000000000000010, &v11);
        if (!v5)
        {
          if ((_QWORD)v11)
          {
            DERImg4DecodeContentFindItemWithTag((unint64_t *)&v11, 22, &v13);
            if (!v6 && !DERImg4DecodeTagCompare((uint64_t)&v13, 0x50415950u))
            {
              DERImg4DecodeContentFindItemWithTag((unint64_t *)&v11, 0x2000000000000011, &v12);
              if (!v7 && !DERDecodeSeqContentInit((unint64_t *)&v12, v23))
              {
                while (1)
                {
                  do
                  {
                    while (1)
                    {
                      v8 = DERDecodeSeqNext(v23, &v20);
                      if (!v8)
                        break;
                      if (v8 == 1)
                        return;
                    }
                  }
                  while (DERDecodeItem((uint64_t)v21, &v18));
                  DERImg4DecodeContentFindItemWithTag(v19, 22, &v13);
                  if (v9)
                    break;
                  if (!DERImg4DecodeTagCompare((uint64_t)&v13, a2)
                    && !DERDecodeSeqContentInit(v19, v22)
                    && !DERDecodeSeqNext(v22, v17)
                    && v17[0] == 22
                    && !DERDecodeSeqNext(v22, &v14))
                  {
                    if (v15)
                    {
                      v10 = v16;
                      *a3 = v15;
                      a3[1] = v10;
                    }
                    return;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

void Img4DecodeGetPayloadPropertiesBoolean(uint64_t a1, uint64_t a2, BOOL *a3)
{
  int v4;
  _OWORD v5[3];

  memset(v5, 0, sizeof(v5));
  Img4DecodePayloadProperty(a1, a2, 1uLL, (unint64_t)v5);
  if (!v4)
    DERParseBoolean((unsigned __int8 **)&v5[1] + 1, a3);
}

void Img4DecodeGetPayloadPropertiesInteger(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  int v4;
  _OWORD v5[3];

  memset(v5, 0, sizeof(v5));
  Img4DecodePayloadProperty(a1, a2, 2uLL, (unint64_t)v5);
  if (!v4)
    DERParseInteger((char **)&v5[1] + 1, a3);
}

void Img4DecodeGetPayloadPropertiesInteger64(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  int v4;
  _OWORD v5[3];

  memset(v5, 0, sizeof(v5));
  Img4DecodePayloadProperty(a1, a2, 2uLL, (unint64_t)v5);
  if (!v4)
    DERParseInteger64((char **)&v5[1] + 1, a3);
}

void Img4DecodeGetPayloadPropertiesData(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  int v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v9 = 0u;
  v10 = 0u;
  v8 = 0u;
  Img4DecodePayloadProperty(a1, a2, 4uLL, (unint64_t)&v8);
  if (!v6)
  {
    v7 = v10;
    *a3 = *((_QWORD *)&v9 + 1);
    *a4 = v7;
  }
}

double Img4DecodeGetObjectProperty(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, _OWORD *a5)
{
  double result;
  int v10;
  int v11;
  int v12;
  _OWORD v13[3];
  unint64_t v14[2];

  v14[0] = 0;
  v14[1] = 0;
  result = 0.0;
  memset(v13, 0, sizeof(v13));
  if (a1)
  {
    if (a5)
    {
      DERImg4DecodeParseManifestProperties(a1, (unint64_t)v14, 0);
      if (v10
        || (DERImg4DecodeFindProperty(v14, a2 | 0xE000000000000000, 0x2000000000000011uLL, (unint64_t)v13), v11)
        || (DERImg4DecodeFindProperty((unint64_t *)&v13[1] + 1, a3, a4, (unint64_t)a5), v12))
      {
        result = 0.0;
        a5[1] = 0u;
        a5[2] = 0u;
        *a5 = 0u;
      }
    }
  }
  return result;
}

uint64_t Img4DecodeGetObjectPropertyBoolean(uint64_t a1, uint64_t a2, uint64_t a3, BOOL *a4)
{
  uint64_t v4;
  uint64_t v6;
  _OWORD v8[3];

  memset(v8, 0, sizeof(v8));
  v4 = 6;
  if (a1 && a4)
  {
    Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 1uLL, v8);
    if (!(_DWORD)v6)
      return DERParseBoolean((unsigned __int8 **)&v8[1] + 1, a4);
    return v6;
  }
  return v4;
}

void Img4DecodeGetObjectPropertyInteger(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  int v5;
  _OWORD v6[3];

  memset(v6, 0, sizeof(v6));
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 2uLL, v6);
      if (v5 || DERParseInteger((char **)&v6[1] + 1, a4))
        *a4 = 0;
    }
  }
}

void Img4DecodeGetObjectPropertyInteger64(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  int v5;
  _OWORD v6[3];

  memset(v6, 0, sizeof(v6));
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 2uLL, v6);
      if (v5 || DERParseInteger64((char **)&v6[1] + 1, a4))
        *a4 = 0;
    }
  }
}

void Img4DecodeGetObjectPropertyData(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, _QWORD *a5)
{
  int v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  if (a1 && a4 && a5)
  {
    Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 4uLL, &v9);
    if (v7)
    {
      v8 = 0;
      *a4 = 0;
    }
    else
    {
      v8 = v11;
      *a4 = *((_QWORD *)&v10 + 1);
    }
    *a5 = v8;
  }
}

void Img4DecodeGetObjectPropertyString(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, _QWORD *a5)
{
  int v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  if (a1 && a4 && a5)
  {
    Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 0x16uLL, &v9);
    if (v7)
    {
      v8 = 0;
      *a4 = 0;
    }
    else
    {
      v8 = v11;
      *a4 = *((_QWORD *)&v10 + 1);
    }
    *a5 = v8;
  }
}

void Img4DecodeGetPayloadVersionPropertyString(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  int v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _OWORD v13[3];
  uint64_t v14;
  _QWORD v15[2];

  if (a3 && a4)
  {
    v14 = 0;
    v15[0] = 0;
    v15[1] = 0;
    memset(v13, 0, sizeof(v13));
    v12 = 0uLL;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    if (DERDecodeItem(a1, (unint64_t *)&v14)
      || DERImg4DecodeProperty(v15, v14, (uint64_t)v13)
      || (DERImg4DecodeContentFindItemWithTag((unint64_t *)&v13[1] + 1, a2, &v12), v7)
      || DERImg4DecodeProperty(&v12, a2, (uint64_t)&v9))
    {
      v8 = 0;
      *a3 = 0;
    }
    else
    {
      v8 = v11;
      *a3 = *((_QWORD *)&v10 + 1);
    }
    *a4 = v8;
  }
}

double Img4DecodeGetPropertyFromSection(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, _OWORD *a5)
{
  int v10;
  double result;
  int v12;
  unint64_t v13[3];
  char v14;

  *(_OWORD *)v13 = 0uLL;
  if (a2 <= 1 && a1 && a5)
  {
    v14 = 0;
    if (!Img4DecodeSectionExists((_QWORD *)a1, a2, &v14) && v14)
    {
      if (a2)
      {
        *(_OWORD *)v13 = *(_OWORD *)(a1 + 440);
        goto LABEL_9;
      }
      DERImg4DecodeParseManifestProperties(a1, 0, (unint64_t)v13);
      if (!v10)
      {
LABEL_9:
        DERImg4DecodeFindProperty(v13, a3, a4, (unint64_t)a5);
        if (!v12)
          return result;
      }
    }
    result = 0.0;
    a5[1] = 0u;
    a5[2] = 0u;
    *a5 = 0u;
  }
  return result;
}

uint64_t Img4DecodeGetPropertyInteger(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v4;
  uint64_t result;
  _QWORD v6[2];
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v8 = 0u;
  v9 = 0u;
  v7 = 0u;
  v4 = *(unsigned int *)(a1 + 8);
  v6[0] = *(_QWORD *)a1;
  v6[1] = v4;
  result = DERImg4DecodeProperty(v6, a2 | 0xE000000000000000, (uint64_t)&v7);
  if (!(_DWORD)result)
  {
    if (*((_QWORD *)&v9 + 1) != 2)
    {
      result = 2;
      if (!a3)
        return result;
      goto LABEL_6;
    }
    if (!a3)
      return 6;
    result = DERParseInteger((char **)&v8 + 1, a3);
  }
  if (!a3)
    return result;
LABEL_6:
  if ((_DWORD)result)
    *a3 = 0;
  return result;
}

uint64_t Img4DecodeGetPropertyInteger64(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  uint64_t v4;
  uint64_t result;
  _QWORD v6[2];
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v8 = 0u;
  v9 = 0u;
  v7 = 0u;
  v4 = *(unsigned int *)(a1 + 8);
  v6[0] = *(_QWORD *)a1;
  v6[1] = v4;
  result = DERImg4DecodeProperty(v6, a2 | 0xE000000000000000, (uint64_t)&v7);
  if (!(_DWORD)result)
  {
    if (*((_QWORD *)&v9 + 1) != 2)
    {
      result = 2;
      if (!a3)
        return result;
      goto LABEL_6;
    }
    if (!a3)
      return 6;
    result = DERParseInteger64((char **)&v8 + 1, a3);
  }
  if (!a3)
    return result;
LABEL_6:
  if ((_DWORD)result)
    *a3 = 0;
  return result;
}

uint64_t Img4DecodeGetPropertyBoolean(uint64_t a1, uint64_t a2, BOOL *a3)
{
  uint64_t v4;
  uint64_t result;
  _QWORD v6[2];
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v4 = *(unsigned int *)(a1 + 8);
  v6[0] = *(_QWORD *)a1;
  v6[1] = v4;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  result = DERImg4DecodeProperty(v6, a2 | 0xE000000000000000, (uint64_t)&v7);
  if (!(_DWORD)result)
  {
    if (*((_QWORD *)&v9 + 1) == 1)
    {
      if (a3)
        return DERParseBoolean((unsigned __int8 **)&v8 + 1, a3);
      else
        return 6;
    }
    else
    {
      return 2;
    }
  }
  return result;
}

uint64_t Img4DecodeGetPropertyData(uint64_t *a1, uint64_t a2, _QWORD *a3, _DWORD *a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  int v10;
  _QWORD v11[2];
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v13 = 0u;
  v14 = 0u;
  v12 = 0u;
  result = 6;
  if (a3 && a4)
  {
    v8 = *a1;
    v9 = *((unsigned int *)a1 + 2);
    v11[0] = v8;
    v11[1] = v9;
    result = DERImg4DecodeProperty(v11, a2 | 0xE000000000000000, (uint64_t)&v12);
    if (!(_DWORD)result)
    {
      if (*((_QWORD *)&v14 + 1) == 4)
      {
        result = 0;
        *a3 = *((_QWORD *)&v13 + 1);
        v10 = v14;
LABEL_6:
        *a4 = v10;
        return result;
      }
      result = 2;
    }
    v10 = 0;
    *a3 = 0;
    goto LABEL_6;
  }
  return result;
}

void Img4DecodeEvaluateCertificateProperties(_QWORD *a1)
{
  Img4DecodeEvaluateCertificatePropertiesInternal(a1, 0);
}

void Img4DecodeEvaluateCertificatePropertiesInternal(_QWORD *a1, _OWORD *a2)
{
  __int128 *v4;
  int v5;
  int v6;
  __int128 v7;
  __int128 __s2;
  _OWORD v9[2];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  void *__s1;
  size_t __n;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  unint64_t v20[2];
  unint64_t v21[3];

  v21[0] = 0;
  v21[1] = 0;
  v20[0] = 0;
  v20[1] = 0;
  v19 = 0;
  v18 = 0uLL;
  __n = 0;
  v17 = 0;
  v14 = 0;
  __s1 = 0;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  memset(v9, 0, sizeof(v9));
  __s2 = 0uLL;
  v7 = 0uLL;
  if (a1 && a1[40] && !DERDecodeSeqInit((uint64_t)(a1 + 39), &v19, v21) && v19 == 0x2000000000000011)
  {
    while (1)
    {
      if (DERDecodeSeqNext(v21, (unint64_t *)&v17))
        return;
      v4 = (__int128 *)(a1 + 7);
      switch(v17)
      {
        case 0xE00000004D414E50:
LABEL_11:
          v7 = *v4;
          if (DERImg4DecodeProperty(&v18, v17, (uint64_t)&v11)
            || *((_QWORD *)&v13 + 1) != 0x2000000000000011
            || DERDecodeSeqContentInit((unint64_t *)&v12 + 1, v20))
          {
            return;
          }
          while (1)
          {
            v5 = DERDecodeSeqNext(v20, (unint64_t *)&v14);
            if (v5)
              break;
            if (DERImg4DecodeProperty(&__s1, v14, (uint64_t)v9))
              return;
            DERImg4DecodeContentFindItemWithTag((unint64_t *)&v7, v14, &__s2);
            if (*((_QWORD *)&v10 + 1) <= 4uLL && ((1 << SBYTE8(v10)) & 0x16) != 0)
            {
              if (v6)
                return;
              if (__n != *((_QWORD *)&__s2 + 1))
                return;
              v6 = memcmp(__s1, (const void *)__s2, __n);
              if (v6)
                return;
            }
            else if (*((_QWORD *)&v10 + 1) != 0xA000000000000000)
            {
              if (*((_QWORD *)&v10 + 1) != 0xA000000000000001 || v6 != 1)
                return;
              v6 = 0;
            }
            if (v6)
              return;
          }
          if (v5 != 1)
            return;
          break;
        case 0xE00000006D616E78:
          if (a2)
            *a2 = v18;
          break;
        case 0xE00000004F424A50:
          v4 = (__int128 *)(a1 + 9);
          if (a1[9])
            goto LABEL_11;
          v4 = (__int128 *)(a1 + 9);
          if (a1[10])
            goto LABEL_11;
          break;
        default:
          return;
      }
    }
  }
}

void Img4DecodeCopyManifestTrustedBootPolicyMeasurement(_QWORD *a1, uint64_t a2, uint64_t a3, void *a4, size_t a5)
{
  int v9;
  _QWORD v10[3];
  _QWORD v11[3];
  _BYTE *v12;
  __int128 v13;
  uint64_t v14;
  _QWORD *v15;
  _BYTE v16[48];
  _BYTE v17[208];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    if (a5)
    {
      if (a5 <= 0x30)
      {
        memset(v17, 0, sizeof(v17));
        memset(v16, 0, sizeof(v16));
        v10[0] = Img4DecodeDigestInit;
        v10[1] = Img4DecodeDigestUpdate;
        v10[2] = Img4DecodeDigestReturnHash;
        *(_QWORD *)&v13 = &default_manifest_property_exclude;
        *((_QWORD *)&v13 + 1) = 156;
        v14 = a3;
        v15 = v10;
        Img4DecodeEvaluateCertificatePropertiesInternal(a1, &v13);
        if (!v9)
        {
          if (a1)
          {
            if (a2)
            {
              v11[0] = &v13;
              v11[1] = a2;
              v11[2] = a1;
              v12 = v17;
              if (!((unsigned int (*)(_QWORD, _BYTE **))*v15)(*(_QWORD *)(v14 + 32), &v12)
                && !Img4DecodeEvaluateDictionaryProperties(a1 + 7, 0, (uint64_t (*)(unint64_t, uint64_t *, uint64_t, uint64_t))_Img4DecodeValidateManifestPropertyInterposer, (uint64_t)v11)&& !((unsigned int (*)(_QWORD, _BYTE **, uint64_t, _BYTE *))v15[2])(*(_QWORD *)(v14 + 32), &v12, 48, v16))
              {
                memcpy(a4, v16, a5);
              }
            }
          }
        }
      }
    }
  }
}

uint64_t Img4DecodeEvaluateManifestProperties(uint64_t a1, uint64_t (*a2)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a3)
{
  return Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a1 + 56), 0, a2, a3);
}

uint64_t Img4DecodeEvaluateDictionaryProperties(unint64_t *a1, uint64_t a2, uint64_t (*a3)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a4)
{
  uint64_t result;
  _OWORD v8[2];
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13[2];
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;

  v15 = 0;
  v16 = 0;
  v14 = 0;
  v13[0] = 0;
  v13[1] = 0;
  v11 = 0;
  v12 = 0;
  v10 = 0;
  memset(v8, 0, sizeof(v8));
  v9 = 0u;
  if (!a3)
    return 6;
  result = (uint64_t)DERDecodeSeqContentInit(a1, v13);
  if (!(_DWORD)result)
  {
    while (1)
    {
      result = DERDecodeSeqNext(v13, &v14);
      if ((_DWORD)result == 1)
        return 0;
      if ((_DWORD)result)
        return result;
      result = DERImg4DecodeProperty(&v15, v14, (uint64_t)v8);
      if ((_DWORD)result)
        return result;
      result = 2;
      if (*((_QWORD *)&v9 + 1) > 0x16uLL
        || ((1 << SBYTE8(v9)) & 0x400016) == 0
        || !(v14 >> 62)
        || (v14 & 0x2000000000000000) == 0)
      {
        return result;
      }
      if (HIDWORD(v16))
        break;
      v10 = v15;
      LODWORD(v11) = v16;
      v12 = *((_QWORD *)&v9 + 1);
      result = a3(v14, &v10, a2, a4);
      if ((_DWORD)result)
        return result;
    }
    return 7;
  }
  return result;
}

uint64_t Img4DecodeEvaluateObjectProperties(uint64_t a1, uint64_t (*a2)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a3)
{
  return Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a1 + 72), 1, a2, a3);
}

double Img4DecodeInit(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _QWORD v9[2];

  if (a1)
  {
    if (a3)
    {
      v9[0] = a1;
      v9[1] = a2;
      v7 = 0u;
      v8 = 0u;
      v5 = 0u;
      v6 = 0u;
      *(_OWORD *)a3 = 0u;
      *(_OWORD *)(a3 + 16) = 0u;
      *(_OWORD *)(a3 + 32) = 0u;
      *(_OWORD *)(a3 + 48) = 0u;
      *(_OWORD *)(a3 + 64) = 0u;
      *(_OWORD *)(a3 + 80) = 0u;
      *(_OWORD *)(a3 + 96) = 0u;
      *(_OWORD *)(a3 + 112) = 0u;
      *(_OWORD *)(a3 + 128) = 0u;
      *(_OWORD *)(a3 + 144) = 0u;
      *(_OWORD *)(a3 + 160) = 0u;
      *(_OWORD *)(a3 + 176) = 0u;
      *(_OWORD *)(a3 + 192) = 0u;
      *(_OWORD *)(a3 + 208) = 0u;
      *(_OWORD *)(a3 + 224) = 0u;
      *(_OWORD *)(a3 + 240) = 0u;
      *(_OWORD *)(a3 + 256) = 0u;
      *(_OWORD *)(a3 + 272) = 0u;
      *(_OWORD *)(a3 + 288) = 0u;
      *(_OWORD *)(a3 + 304) = 0u;
      *(_OWORD *)(a3 + 320) = 0u;
      *(_OWORD *)(a3 + 336) = 0u;
      *(_OWORD *)(a3 + 352) = 0u;
      *(_OWORD *)(a3 + 368) = 0u;
      *(_OWORD *)(a3 + 384) = 0u;
      *(_OWORD *)(a3 + 400) = 0u;
      *(_OWORD *)(a3 + 416) = 0u;
      *(_OWORD *)(a3 + 432) = 0u;
      *(_QWORD *)(a3 + 448) = 0;
      if (!DERImg4Decode(v9, (unint64_t)&v5)
        && !DERImg4DecodePayload((uint64_t)&v6, a3 + 88)
        && !DERImg4DecodeManifest(&v7, a3 + 232)
        && !DERImg4DecodeRestoreInfo((uint64_t)&v8, a3 + 424))
      {
        *(_OWORD *)(a3 + 8) = v6;
        result = *(double *)&v7;
        *(_OWORD *)(a3 + 24) = v7;
      }
    }
  }
  return result;
}

double Img4DecodeInitPayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double result;
  __int128 v5;

  if (a1 && a3)
  {
    *(_QWORD *)&v5 = a1;
    *((_QWORD *)&v5 + 1) = a2;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_OWORD *)(a3 + 32) = 0u;
    *(_OWORD *)(a3 + 48) = 0u;
    *(_OWORD *)(a3 + 64) = 0u;
    *(_OWORD *)(a3 + 80) = 0u;
    *(_OWORD *)(a3 + 96) = 0u;
    *(_OWORD *)(a3 + 112) = 0u;
    *(_OWORD *)(a3 + 128) = 0u;
    *(_OWORD *)(a3 + 144) = 0u;
    *(_OWORD *)(a3 + 160) = 0u;
    *(_OWORD *)(a3 + 176) = 0u;
    *(_OWORD *)(a3 + 192) = 0u;
    *(_OWORD *)(a3 + 208) = 0u;
    *(_OWORD *)(a3 + 224) = 0u;
    *(_OWORD *)(a3 + 240) = 0u;
    *(_OWORD *)(a3 + 256) = 0u;
    *(_OWORD *)(a3 + 272) = 0u;
    *(_OWORD *)(a3 + 288) = 0u;
    *(_OWORD *)(a3 + 304) = 0u;
    *(_OWORD *)(a3 + 320) = 0u;
    *(_OWORD *)(a3 + 336) = 0u;
    *(_OWORD *)(a3 + 352) = 0u;
    *(_OWORD *)(a3 + 368) = 0u;
    *(_OWORD *)(a3 + 384) = 0u;
    *(_OWORD *)(a3 + 400) = 0u;
    *(_OWORD *)(a3 + 416) = 0u;
    *(_OWORD *)(a3 + 432) = 0u;
    *(_QWORD *)(a3 + 448) = 0;
    if (!DERImg4DecodePayload((uint64_t)&v5, a3 + 88))
    {
      result = *(double *)&v5;
      *(_OWORD *)(a3 + 8) = v5;
    }
  }
  return result;
}

uint64_t Img4DecodeInitManifest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Img4DecodeInitManifestCommon(a1, a2, 1, a3, 1229796429);
}

uint64_t Img4DecodeInitManifestCommon(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  uint64_t result;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  result = 6;
  if (a1 && a4)
  {
    v15 = a1;
    v16 = a2;
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
    *(_OWORD *)(a4 + 32) = 0u;
    *(_OWORD *)(a4 + 48) = 0u;
    *(_OWORD *)(a4 + 64) = 0u;
    *(_OWORD *)(a4 + 80) = 0u;
    *(_OWORD *)(a4 + 96) = 0u;
    *(_OWORD *)(a4 + 112) = 0u;
    *(_OWORD *)(a4 + 128) = 0u;
    *(_OWORD *)(a4 + 144) = 0u;
    *(_OWORD *)(a4 + 160) = 0u;
    *(_OWORD *)(a4 + 176) = 0u;
    *(_OWORD *)(a4 + 192) = 0u;
    *(_OWORD *)(a4 + 208) = 0u;
    *(_OWORD *)(a4 + 224) = 0u;
    *(_OWORD *)(a4 + 240) = 0u;
    *(_OWORD *)(a4 + 256) = 0u;
    *(_OWORD *)(a4 + 272) = 0u;
    *(_OWORD *)(a4 + 288) = 0u;
    *(_OWORD *)(a4 + 304) = 0u;
    *(_OWORD *)(a4 + 320) = 0u;
    *(_OWORD *)(a4 + 336) = 0u;
    *(_OWORD *)(a4 + 352) = 0u;
    *(_OWORD *)(a4 + 368) = 0u;
    *(_OWORD *)(a4 + 384) = 0u;
    *(_OWORD *)(a4 + 400) = 0u;
    *(_OWORD *)(a4 + 416) = 0u;
    *(_OWORD *)(a4 + 432) = 0u;
    *(_QWORD *)(a4 + 448) = 0;
    if (a5 == 1229796419)
    {
      v10 = a4 + 232;
      if (a3)
        result = DERImg4DecodeCertificate(&v15, v10);
      else
        result = DERImg4DecodeUnsignedCertificate(&v15, v10);
    }
    else
    {
      if (a5 != 1229796429)
        return 2;
      v9 = a4 + 232;
      if (a3)
        result = DERImg4DecodeManifest(&v15, v9);
      else
        result = DERImg4DecodeUnsignedManifest(&v15, v9);
    }
    if (!(_DWORD)result)
    {
      if (*(_QWORD *)(a4 + 264))
      {
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = a1;
        v16 = a2;
        result = DERDecodeItemPartialBufferGetLength((uint64_t)&v15, &v12, 0);
        if (!(_DWORD)result)
        {
          *(_QWORD *)(a4 + 24) = a1;
          v11 = v14 + v13 - a1;
          if (__CFADD__(v14, v13 - a1))
          {
            __break(0x5500u);
          }
          else
          {
            *(_QWORD *)(a4 + 32) = v11;
            if (v11 == a2)
              return 0;
            else
              return 7;
          }
        }
      }
      else
      {
        return 3;
      }
    }
  }
  return result;
}

uint64_t Img4DecodeInitUnsignedManifest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Img4DecodeInitManifestCommon(a1, a2, 0, a3, 1229796429);
}

uint64_t Img4DecodeInitCertificate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Img4DecodeInitManifestCommon(a1, a2, 1, a3, 1229796419);
}

uint64_t Img4DecodeInitUnsignedCertificate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Img4DecodeInitManifestCommon(a1, a2, 0, a3, 1229796419);
}

uint64_t Img4DecodeEvaluateCertificateChain(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t result;
  void (*v9)(uint64_t);

  result = 6;
  if (a1 && a2 && a3 && a4 && a7 && a6)
  {
    v9 = *(void (**)(uint64_t))(a4 + 8);
    if (v9)
    {
      v9(a1);
      return 3;
    }
  }
  return result;
}

void Img4DecodeEvaluateTrustWithCallbacks(unsigned int a1, uint64_t a2, uint64_t (*a3)(unint64_t, uint64_t *, uint64_t, uint64_t), unsigned int (*a4)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), unsigned int (*a5)(uint64_t, uint64_t), void (*a6)(_QWORD, _QWORD, uint64_t), uint64_t a7)
{
  int v14;
  int v15;
  BOOL v16;
  _OWORD v17[3];

  memset(v17, 0, sizeof(v17));
  if (a2)
  {
    if (a3)
    {
      if (*(_QWORD *)(a2 + 24))
      {
        v16 = 0;
        a6(*(_QWORD *)(a2 + 264), *(_QWORD *)(a2 + 272), a2 + 376);
        if (!a4(*(_QWORD *)(a2 + 296), *(unsigned int *)(a2 + 304), *(_QWORD *)(a2 + 280), *(unsigned int *)(a2 + 288), a2 + 376, 20, a2 + 312, a2 + 320, a7))
        {
          DERImg4DecodeParseManifestProperties(a2, a2 + 40, a2 + 56);
          if (!v14)
          {
            DERImg4DecodeFindProperty((unint64_t *)(a2 + 40), a1 | 0xE000000000000000, 0x2000000000000011uLL, (unint64_t)v17);
            if (!v15)
            {
              *(_OWORD *)(a2 + 72) = *(_OWORD *)((char *)&v17[1] + 8);
              if (!a5(a2, a7) && !Img4DecodePayloadExists(a2, &v16))
              {
                if (v16)
                {
                  a6(*(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 16), a2 + 184);
                  *(_BYTE *)a2 = 1;
                }
                if (!Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 56), 0, a3, a7)
                  && !Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 72), 1, a3, a7))
                {
                  a6(*(_QWORD *)(a2 + 24), *(_QWORD *)(a2 + 32), a2 + 328);
                  *(_BYTE *)(a2 + 1) = 1;
                }
              }
            }
          }
        }
      }
    }
  }
}

void Img4DecodePerformTrustEvaluation(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v5[3];

  v5[1] = 0;
  v5[2] = 0;
  v5[0] = a3;
  _Img4DecodePerformTrustEvaluationWithCallbacksInternal(a1, a2, (uint64_t)v5, a4, 0, a5);
}

void Img4DecodePerformTrustEvaluatationWithCallbacks(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _Img4DecodePerformTrustEvaluationWithCallbacksInternal(a1, a2, a3, a4, 0, a5);
}

uint64_t Img4DecodeVerifyChainIM4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, _QWORD *a6, _QWORD *a7, _QWORD *a8, uint64_t a9, uint64_t a10)
{
  uint64_t result;
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
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _OWORD v40[5];
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v41 = 0;
  v39 = 0u;
  memset(v40, 0, sizeof(v40));
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  result = 6;
  v17 = 0u;
  v18 = 0u;
  if (a3 && a4 && a5 && a6 && a7 && a8 && a9)
  {
    if (Img4DecodeInitManifestCommon(a3, a4, 1, (uint64_t)&v17, 1229796419)
      || (*(unsigned int (**)(_QWORD, _QWORD, char *, _QWORD, uint64_t))a9)(*((_QWORD *)&v33 + 1), v34, (char *)v40 + 8, **(_QWORD **)(a9 + 32), a9)|| (*(unsigned int (**)(uint64_t, uint64_t, _QWORD, _QWORD, char *, _QWORD, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a9 + 16))(a1, a2, *((_QWORD *)&v34 + 1), v35, (char *)v40 + 8, **(_QWORD **)(a9 + 32), a9, a10, v17, *((_QWORD *)&v17 + 1), v18, *((_QWORD *)&v18 + 1), v19,
           *((_QWORD *)&v19 + 1),
           v20,
           *((_QWORD *)&v20 + 1),
           v21,
           *((_QWORD *)&v21 + 1),
           v22,
           *((_QWORD *)&v22 + 1),
           v23,
           *((_QWORD *)&v23 + 1),
           v24,
           *((_QWORD *)&v24 + 1),
           v25,
           *((_QWORD *)&v25 + 1),
           v26,
           *((_QWORD *)&v26 + 1),
           v27,
           *((_QWORD *)&v27 + 1),
           v28,
           *((_QWORD *)&v28 + 1),
           v29,
           *((_QWORD *)&v29 + 1),
           v30,
           *((_QWORD *)&v30 + 1),
           v31,
           *((_QWORD *)&v31 + 1),
           v32,
           *((_QWORD *)&v32 + 1),
           v33))
    {
      return 0xFFFFFFFFLL;
    }
    else if (DERImg4DecodeCertificatePropertiesAndPubKey(*((uint64_t *)&v33 + 1), v34, a7, a8, a5, a6))
    {
      return 0xFFFFFFFFLL;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void _Img4DecodePerformTrustEvaluationWithCallbacksInternal(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  _QWORD *v9;
  uint64_t (*v13)(uint64_t, uint64_t);
  const void *v14;
  int v15;
  int v16;
  unsigned int (*v17)(unint64_t *, unint64_t, uint64_t, _OWORD *, uint64_t);
  unint64_t v18;
  unint64_t *v19;
  int v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD v24[3];

  v22 = 0;
  v23 = 0;
  memset(v24, 0, sizeof(v24));
  if (a2)
  {
    if (a3)
    {
      v21 = 0;
      if (a4)
      {
        if (*(_QWORD *)a3)
        {
          if (*(_QWORD *)a4)
          {
            if (*(_QWORD *)(a4 + 24))
            {
              if (*(_QWORD *)(a4 + 8))
              {
                if (*(_QWORD *)(a4 + 16))
                {
                  v9 = *(_QWORD **)(a4 + 32);
                  if (v9)
                  {
                    if (*(_QWORD *)(a2 + 24) && *v9 <= 0x30uLL && !(*(unsigned int (**)(void))a4)())
                    {
                      *(_BYTE *)(a2 + 1) = 1;
                      v13 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 8);
                      if (v13
                        && (v14 = (const void *)v13(a2, a6)) != 0
                        && !memcmp((const void *)(a2 + 328), v14, **(_QWORD **)(a4 + 32)))
                      {
                        v15 = 0;
                      }
                      else
                      {
                        if ((*(unsigned int (**)(_QWORD, _QWORD, uint64_t *, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))(a4 + 8))(*(_QWORD *)(a2 + 296), *(_QWORD *)(a2 + 304), &v22, &v23, a2 + 312, a2 + 320, a4, a6)|| **(_QWORD **)(a4 + 32) > 0x30uLL|| (*(unsigned int (**)(_QWORD, _QWORD, uint64_t))a4)(*(_QWORD *)(a2 + 264), *(_QWORD *)(a2 + 272), a2 + 376)|| (*(unsigned int (**)(uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, _QWORD, uint64_t, uint64_t))(a4 + 16))(v22, v23, *(_QWORD *)(a2 + 280), *(_QWORD *)(a2 + 288), a2 + 376,
                               **(_QWORD **)(a4 + 32),
                               a4,
                               a6))
                        {
                          return;
                        }
                        v15 = 1;
                      }
                      DERImg4DecodeParseManifestProperties(a2, a2 + 40, a2 + 56);
                      if (v16)
                        return;
                      if ((a5 & 1) == 0)
                      {
                        v17 = *(unsigned int (**)(unint64_t *, unint64_t, uint64_t, _OWORD *, uint64_t))(a3 + 16);
                        v18 = a1 | 0xE000000000000000;
                        v19 = (unint64_t *)(a2 + 40);
                        if (v17)
                        {
                          if (v17(v19, v18, 0x2000000000000011, v24, a6))
                            return;
                        }
                        else
                        {
                          DERImg4DecodeFindProperty(v19, v18, 0x2000000000000011uLL, (unint64_t)v24);
                          if (v20)
                            return;
                        }
                        *(_OWORD *)(a2 + 72) = *(_OWORD *)((char *)&v24[1] + 8);
                      }
                      if ((!v15 || !(*(unsigned int (**)(uint64_t, uint64_t))(a4 + 24))(a2, a6))
                        && **(_QWORD **)(a4 + 32) <= 0x30uLL
                        && !Img4DecodePayloadExists(a2, &v21))
                      {
                        if (v21)
                        {
                          if ((*(unsigned int (**)(_QWORD, _QWORD, uint64_t, _QWORD, uint64_t))a4)(*(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 16), a2 + 184, **(_QWORD **)(a4 + 32), a4))
                          {
                            return;
                          }
                          *(_BYTE *)a2 = 1;
                        }
                        if (!Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 56), 0, *(uint64_t (**)(unint64_t, uint64_t *, uint64_t, uint64_t))a3, a6)&& (a5 & 1) == 0)
                        {
                          Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 72), 1, *(uint64_t (**)(unint64_t, uint64_t *, uint64_t, uint64_t))a3, a6);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

void Img4DecodePerformManifestTrustEvaluationWithCallbacks(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _Img4DecodePerformTrustEvaluationWithCallbacksInternal(0, a1, a2, a3, 1, a4);
}

uint64_t _Img4DecodeValidateManifestPropertyInterposer(unsigned int a1, uint64_t a2, int a3, uint64_t a4)
{
  _QWORD *v8;
  unint64_t v9;
  unsigned int v10;
  unint64_t v11[3];
  unint64_t v12[2];
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v10 = a1;
  if (a3)
    return 0xFFFFFFFFLL;
  v8 = *(_QWORD **)a4;
  v14 = 0u;
  v15 = 0u;
  v13 = 0u;
  v12[0] = 0;
  v12[1] = 0;
  memset(v11, 0, sizeof(v11));
  if (v8
    && !DERImg4DecodeProperty(v8, 0xE00000006D616E78, (uint64_t)&v13)
    && *((_QWORD *)&v15 + 1) == 0x2000000000000011
    && !DERDecodeSeqContentInit((unint64_t *)&v14 + 1, v12))
  {
    v9 = a1 | 0xE000000000000000;
    while (!DERDecodeSeqNext(v12, v11))
    {
      if (v11[0] == v9)
      {
        (*(void (**)(_QWORD, uint64_t, uint64_t, unsigned int *))(*(_QWORD *)(*(_QWORD *)a4 + 24) + 8))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)a4 + 16) + 32), a4 + 24, 4, &v10);
        return 0;
      }
    }
  }
  (*(void (**)(_QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)a4 + 24) + 8))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)a4 + 16) + 32), a4 + 24, *(unsigned int *)(a2 + 8), *(_QWORD *)a2);
  return 0;
}

uint64_t sha1_digest()
{
  return ccdigest();
}

uint64_t verify_signature_rsa3k(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD **v9;
  _QWORD *v10;
  uint64_t result;
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];

  v14[0] = a1;
  v14[1] = a2;
  v13[0] = a3;
  v13[1] = a4;
  v12[0] = a5;
  v12[1] = a6;
  if (!a1)
    return 0xFFFFFFFFLL;
  if (!a2)
    return 0xFFFFFFFFLL;
  if (!a3)
    return 0xFFFFFFFFLL;
  if (!a4)
    return 0xFFFFFFFFLL;
  if (!a5)
    return 0xFFFFFFFFLL;
  if (!a6)
    return 0xFFFFFFFFLL;
  if (!a7)
    return 0xFFFFFFFFLL;
  v8 = *(_QWORD *)(a7 + 32);
  if (!v8)
    return 0xFFFFFFFFLL;
  v9 = *(_QWORD ***)(v8 + 16);
  if (!v9)
    return 0xFFFFFFFFLL;
  v10 = *v9;
  if (!v10)
    return 0xFFFFFFFFLL;
  if (*v10 != a6)
    return 0xFFFFFFFFLL;
  result = verify_pkcs1_sig((uint64_t)v14, v10[4], (uint64_t)v12, (uint64_t)v13, 3072, a6, a7, a8);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  return result;
}

uint64_t verify_pkcs1_sig(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v9;
  size_t v10;
  unint64_t *v11;
  uint64_t v12;
  uint64_t result;
  unint64_t v14;
  _BYTE *i;
  unint64_t v16;
  BOOL v17;
  int v18;
  int v19;
  _OWORD v20[2];
  _QWORD v21[5];

  v21[4] = *MEMORY[0x24BDAC8D0];
  if (a5 != 4096 && a5 != 3072)
    return 0xFFFFFFFFLL;
  v21[2] = 0;
  v21[3] = 0;
  v9 = (unint64_t)(a5 + 63) >> 6;
  MEMORY[0x24BDAC7A8](a1, (24 * v9 + 71) & 0x7FFFFFFFFFFFFFE0, a3, a4, a5, a6, a7, a8);
  v11 = (unint64_t *)((char *)v20 - v10);
  bzero((char *)v20 - v10, v10);
  *v11 = v9;
  v12 = *(unsigned int *)(a1 + 8);
  v21[0] = *(_QWORD *)a1;
  v21[1] = v12;
  memset(v20, 0, sizeof(v20));
  result = DERParseSequenceToObject((uint64_t)v21, (unsigned __int16)DERNumRSAPubKeyPKCS1ItemSpecs, (uint64_t)&DERRSAPubKeyPKCS1ItemSpecs, (unint64_t)v20, 0x20uLL, 0x20uLL);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  v14 = *((_QWORD *)&v20[0] + 1);
  for (i = *(_BYTE **)&v20[0]; v14; --v14)
  {
    if (*i)
      break;
    if (i == (_BYTE *)-1)
      __break(0x5513u);
    ++i;
  }
  if (v14 >= 0xFFFFFFFFFFFFFFF8)
  {
    __break(0x5500u);
    return result;
  }
  v16 = (v14 + 7) >> 3;
  if (v16 > *v11)
    return 0xFFFFFFFFLL;
  *v11 = v16;
  if (ccrsa_make_pub())
    return 0xFFFFFFFFLL;
  if (MEMORY[0x24BDAD800])
    v17 = MEMORY[0x24BDAC2C0] == 0;
  else
    v17 = 1;
  if (!v17)
  {
    v19 = ccrsa_verify_pkcs1v15_digest();
    if (!v19 && !cc_cmp_safe())
      return 0;
    return 0xFFFFFFFFLL;
  }
  LOBYTE(v20[0]) = 0;
  v18 = ccrsa_verify_pkcs1v15();
  result = 0xFFFFFFFFLL;
  if (!v18 && LOBYTE(v20[0]))
    return 0;
  return result;
}

uint64_t verify_signature_rsa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD **v9;
  _QWORD *v10;
  uint64_t result;
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];

  v14[0] = a1;
  v14[1] = a2;
  v13[0] = a3;
  v13[1] = a4;
  v12[0] = a5;
  v12[1] = a6;
  if (!a1)
    return 0xFFFFFFFFLL;
  if (!a2)
    return 0xFFFFFFFFLL;
  if (!a3)
    return 0xFFFFFFFFLL;
  if (!a4)
    return 0xFFFFFFFFLL;
  if (!a5)
    return 0xFFFFFFFFLL;
  if (!a6)
    return 0xFFFFFFFFLL;
  if (!a7)
    return 0xFFFFFFFFLL;
  v8 = *(_QWORD *)(a7 + 32);
  if (!v8)
    return 0xFFFFFFFFLL;
  v9 = *(_QWORD ***)(v8 + 16);
  if (!v9)
    return 0xFFFFFFFFLL;
  v10 = *v9;
  if (!v10)
    return 0xFFFFFFFFLL;
  if (*v10 != a6)
    return 0xFFFFFFFFLL;
  result = verify_pkcs1_sig((uint64_t)v14, v10[4], (uint64_t)v12, (uint64_t)v13, 4096, a6, a7, a8);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  return result;
}

void verify_signature_ecdsa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;

  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            if (a6)
            {
              if (a7)
              {
                v7 = *(_QWORD **)(a7 + 32);
                if (v7)
                {
                  if (v7[2] && *(_QWORD *)(a7 + 48) && *v7 == a6)
                    verify_ecdsa_sig();
                }
              }
            }
          }
        }
      }
    }
  }
}

void verify_ecdsa_sig()
{
  _QWORD *cp;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  size_t v14;
  _QWORD *v15;
  _BYTE v16[8];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v16[7] = 0;
  ccec_x963_import_pub_size();
  if (ccec_keysize_is_supported())
  {
    cp = (_QWORD *)ccec_get_cp();
    v7 = *cp;
    if (*cp >> 61 || !is_mul_ok(8 * v7, 3uLL))
    {
      __break(0x550Cu);
    }
    else
    {
      v8 = 24 * v7;
      v9 = __CFADD__(v8, 16);
      v10 = v8 + 16;
      if (!v9)
      {
        v9 = __CFADD__(v10, 16);
        v11 = v10 + 16;
        if (!v9)
        {
          v12 = cp;
          v13 = v11 - 1;
          MEMORY[0x24BDAC7A8](cp, (v11 - 1) & 0xFFFFFFFFFFFFFFF0, v1, v2, v3, v4, v5, v6);
          v15 = &v16[-v14];
          bzero(&v16[-v14], v14);
          if (v13 < 0x10)
          {
            __break(1u);
          }
          else
          {
            *v15 = v12;
            if (!ccec_import_pub())
              ccec_verify();
          }
          return;
        }
      }
    }
    __break(0x5500u);
  }
}

uint64_t verify_chain_img4_v1(unint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  uint64_t result;
  unsigned int v9;
  uint64_t v15;
  const void **v16;
  uint64_t *v17;
  const void **v18;
  unint64_t *v19;
  size_t v20;
  const void *v21;
  int v22;
  uint64_t v23;
  _QWORD *v24;
  __int128 v25;
  unint64_t v26[2];
  _QWORD v27[2];
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE v31[216];
  _BYTE v32[24];
  unint64_t v33[30];
  _OWORD v34[2];
  uint64_t v35;
  uint64_t v36;
  _BYTE v37[32];
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41[2];
  unint64_t v42[2];
  __int128 v43;
  __int128 v44;
  unint64_t v45;
  unint64_t v46[2];
  unint64_t v47[3];

  result = 0xFFFFFFFFLL;
  if (a1)
  {
    v9 = a2;
    if (a2)
    {
      if (a3 && a4)
      {
        bzero(&v28, 0x2F0uLL);
        v26[0] = a1;
        v26[1] = v9;
        v27[0] = &ROOT_CA_CERTIFICATE;
        v27[1] = 1215;
        if (!_crack_chain_with_anchor(v26, (uint64_t)v27, 3u)
          && !parse_chain((uint64_t)v27, 3u, (uint64_t)&v29, (uint64_t)v31, (uint64_t)v34, (uint64_t)v37))
        {
          v24 = a6;
          v15 = 0;
          v16 = (const void **)v32;
          v17 = &v30;
          v18 = (const void **)v32;
          while (1)
          {
            v19 = &v26[20 * v15];
            v20 = v19[37];
            v21 = *v18;
            v18 += 20;
            if ((const void *)v20 != v21)
              break;
            if (memcmp((const void *)v19[36], *(v16 - 1), v20))
              break;
            result = verify_chain_signatures(&v34[v15], v17, a7);
            if ((_DWORD)result)
              break;
            v17 += 6;
            ++v15;
            v16 = v18;
            if (v15 == 2)
            {
              v25 = 0uLL;
              if ((unint64_t)v31 > 0xFFFFFFFFFFFFFF5FLL)
              {
LABEL_34:
                __break(0x5513u);
                return result;
              }
              v42[0] = 0;
              v42[1] = 0;
              v40 = 0;
              v41[0] = 0;
              v41[1] = 0;
              if (DERDecodeSeqContentInit(v33, v42))
                return 0xFFFFFFFFLL;
LABEL_14:
              if (!DERDecodeSeqNext(v42, &v40) && v40 == 0x2000000000000011)
              {
                v47[0] = 0;
                v47[1] = 0;
                v45 = 0;
                v46[0] = 0;
                v46[1] = 0;
                v43 = 0u;
                v44 = 0u;
                if (!DERDecodeSeqContentInit(v41, v47))
                {
                  do
                  {
                    v22 = DERDecodeSeqNext(v47, &v45);
                    if (v22)
                    {
                      if (v22 == 1)
                        goto LABEL_14;
                      return 0xFFFFFFFFLL;
                    }
                    if (v45 != 0x2000000000000010
                      || DERParseSequenceContentToObject(v46, (unsigned __int16)DERNumAttributeTypeAndValueItemSpecs, (uint64_t)&DERAttributeTypeAndValueItemSpecs, (unint64_t)&v43, 0x20uLL, 0x20uLL))
                    {
                      return 0xFFFFFFFFLL;
                    }
                  }
                  while (!DEROidCompare((uint64_t)&oidCommonName, (uint64_t)&v43));
                  v25 = v44;
                  result = DEROidCompare((uint64_t)&verify_chain_img4_v1_sboot_item, (uint64_t)&v25);
                  if (!(_DWORD)result)
                    return 0xFFFFFFFFLL;
                  if ((unint64_t)v34 > 0xFFFFFFFFFFFFFFDFLL)
                    goto LABEL_34;
                  *a3 = v35;
                  *a4 = v36;
                  if ((unint64_t)v37 > 0xFFFFFFFFFFFFFFDFLL)
                    goto LABEL_34;
                  if (!v38)
                    return 0;
                  v23 = v39;
                  if (!v39)
                    return 0;
                  result = 0;
                  if (a5)
                  {
                    if (v24)
                    {
                      result = 0;
                      *a5 = v38;
                      *v24 = v23;
                    }
                  }
                  return result;
                }
              }
              return 0xFFFFFFFFLL;
            }
          }
        }
        return 0xFFFFFFFFLL;
      }
    }
  }
  return result;
}

uint64_t parse_chain(uint64_t result, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v17;
  unint64_t v18;
  __int128 v19;
  __int128 v20;
  char v21;
  __int128 v22;
  __int128 v23;

  if (!a2)
    return 0;
  v8 = 0;
  v15 = result;
  v18 = ~result;
  v17 = ~a3;
  v14 = ~a4;
  v13 = ~a5;
  v11 = ~a6;
  v10 = a2;
  while (1)
  {
    v9 = 16 * v8;
    if (16 * v8 > v18 || 48 * v8 > v17)
      break;
    result = DERParseSequenceToObject(v15 + 16 * v8, (unsigned __int16)DERNumSignedCertCrlItemSpecs, (uint64_t)&DERSignedCertCrlItemSpecs, a3 + 48 * v8, 0x30uLL, 0x30uLL);
    if ((_DWORD)result)
      return 0xFFFFFFFFLL;
    if (160 * v8 > v14)
      break;
    result = DERParseSequenceToObject(a3 + 48 * v8, (unsigned __int16)DERNumTBSCertItemSpecs, (uint64_t)&DERTBSCertItemSpecs, a4 + 160 * v8, 0xA0uLL, 0xA0uLL);
    if ((_DWORD)result)
      return 0xFFFFFFFFLL;
    if (v9 > v13)
      break;
    v22 = 0u;
    v23 = 0u;
    v21 = 0;
    v19 = 0u;
    v20 = 0u;
    if (DERParseSequenceContentToObject((unint64_t *)(a4 + 160 * v8 + 96), (unsigned __int16)DERNumSubjPubKeyInfoItemSpecs, (uint64_t)&DERSubjPubKeyInfoItemSpecs, (unint64_t)&v22, 0x20uLL, 0x20uLL))return 0xFFFFFFFFLL;
    if (DERParseSequenceContentToObject((unint64_t *)&v22, (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, (unint64_t)&v19, 0x20uLL, 0x20uLL))return 0xFFFFFFFFLL;
    result = DEROidCompare((uint64_t)&v19, (uint64_t)&oidRsa);
    if (!(_DWORD)result)
      return 0xFFFFFFFFLL;
    if (*((_QWORD *)&v20 + 1))
    {
      if (*((_QWORD *)&v20 + 1) != 2 || *(_BYTE *)v20 != 5)
        return 0xFFFFFFFFLL;
      if ((_QWORD)v20 == -1)
        break;
      if (*(_BYTE *)(v20 + 1))
        return 0xFFFFFFFFLL;
    }
    result = DERParseBitString((uint64_t)&v23, (unint64_t *)(a5 + 16 * v8), &v21);
    if ((_DWORD)result || v21)
      return 0xFFFFFFFFLL;
    if (v9 > v11)
      break;
    result = parse_extensions(a4 + 160 * v8, (_QWORD *)(a6 + 16 * v8));
    if ((_DWORD)result)
      return 0xFFFFFFFFLL;
    if (++v8 == v10)
      return 0;
  }
  __break(0x5513u);
  return result;
}

uint64_t verify_chain_signatures(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v5;
  uint64_t result;
  unint64_t v8;
  uint64_t v9;
  char v10;
  __int128 v11;
  __int128 v12;
  _OWORD v13[3];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0xFFFFFFFFLL;
  if (!a2)
    return 0xFFFFFFFFLL;
  if (!a3)
    return 0xFFFFFFFFLL;
  v11 = 0u;
  v12 = 0u;
  v10 = 0;
  memset(v13, 0, sizeof(v13));
  v8 = 0;
  v9 = 0;
  v5 = *(_QWORD **)(a3 + 32);
  if (!v5
    || !v5[2]
    || !*(_QWORD *)a3
    || !*(_QWORD *)(a3 + 40)
    || *v5 > 0x30uLL
    || DERParseSequenceContentToObject(a2 + 2, (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, (unint64_t)&v11, 0x20uLL, 0x20uLL))
  {
    return 0xFFFFFFFFLL;
  }
  if (*((_QWORD *)&v12 + 1))
  {
    result = DEROidCompare((uint64_t)&v11, (uint64_t)&oidEcPubKey);
    if ((result & 1) == 0)
    {
      if (*((_QWORD *)&v12 + 1) != 2 || *(_BYTE *)v12 != 5)
        return 0xFFFFFFFFLL;
      if ((_QWORD)v12 == -1)
      {
        __break(0x5513u);
        return result;
      }
      if (*(_BYTE *)(v12 + 1))
        return 0xFFFFFFFFLL;
    }
  }
  if (!DEROidCompare((uint64_t)&v11, *(_QWORD *)(a3 + 40)))
    return 0xFFFFFFFFLL;
  if ((*(unsigned int (**)(_QWORD, _QWORD, _OWORD *, _QWORD, uint64_t))a3)(*a2, a2[1], v13, **(_QWORD **)(a3 + 32), a3))
  {
    return 0xFFFFFFFFLL;
  }
  if (DERParseBitString((uint64_t)(a2 + 4), &v8, &v10))
    return 0xFFFFFFFFLL;
  if (v10)
    return 0xFFFFFFFFLL;
  result = (*(uint64_t (**)(_QWORD, _QWORD, unint64_t, uint64_t, _OWORD *, _QWORD, uint64_t, _QWORD))(a3 + 16))(*a1, a1[1], v8, v9, v13, **(_QWORD **)(a3 + 32), a3, 0);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  return result;
}

uint64_t verify_chain_img4_x86(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))crack_chain_rsa4k_sha384_x86);
}

uint64_t verify_chain_img4_v2_with_crack_callback(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7, unsigned int (*a8)(_QWORD *, _BYTE *, uint64_t))
{
  uint64_t result;
  unsigned int v10;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD v21[2];
  _BYTE v22[48];
  _OWORD v23[9];
  uint64_t v24;
  void *__s1;
  size_t __n;
  _QWORD v27[6];
  _BYTE v28[16];
  uint64_t v29;
  uint64_t v30;

  result = 0xFFFFFFFFLL;
  if (a1)
  {
    v10 = a2;
    if (a2)
    {
      if (a3 && a4)
      {
        bzero(v22, 0x300uLL);
        v21[0] = a1;
        v21[1] = v10;
        if (a8(v21, v22, 2))
          return 0xFFFFFFFFLL;
        result = parse_chain((uint64_t)v22, 2u, (uint64_t)v23, (uint64_t)&v24, (uint64_t)v27, (uint64_t)v28);
        if ((_DWORD)result)
        {
          return 0xFFFFFFFFLL;
        }
        else
        {
          v16 = 1;
          v17 = 1;
          while ((v16 & 1) != 0)
          {
            v18 = &v21[20 * v17];
            if (__n == v18[33] && !memcmp(__s1, (const void *)v18[32], __n))
            {
              result = verify_chain_signatures(v27, &v23[3 * v17], a7);
              v16 = 0;
              v17 = 2;
              if (!(_DWORD)result)
                continue;
            }
            return 0xFFFFFFFFLL;
          }
          if ((unint64_t)v27 > 0xFFFFFFFFFFFFFFEFLL
            || (*a3 = v27[2], *a4 = v27[3], (unint64_t)v28 > 0xFFFFFFFFFFFFFFEFLL))
          {
            __break(0x5513u);
          }
          else if (v29 && (v19 = v30) != 0)
          {
            result = 0;
            if (a5 && a6)
            {
              result = 0;
              *a5 = v29;
              *a6 = v19;
            }
          }
          else
          {
            return 0;
          }
        }
      }
    }
  }
  return result;
}

uint64_t crack_chain_rsa4k_sha384_x86(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_X86_ROOT_CA_CERTIFICATE;
  a2[1] = 1382;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_ddi(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))crack_chain_rsa4k_sha384_ddi);
}

uint64_t crack_chain_rsa4k_sha384_ddi(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_ROOT_CA_CERTIFICATE;
  a2[1] = 1394;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_ddi_global(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))crack_chain_rsa4k_sha384_ddi_global);
}

uint64_t crack_chain_rsa4k_sha384_ddi_global(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_GLOBAL_ROOT_CA_CERTIFICATE;
  a2[1] = 1404;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_ddi_fake(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))crack_chain_rsa4k_sha384_ddi_fake);
}

uint64_t crack_chain_rsa4k_sha384_ddi_fake(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_FAKE_ROOT_CA_CERTIFICATE;
  a2[1] = 1425;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_ddi_fake_global(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))crack_chain_rsa4k_sha384_ddi_fake_global);
}

uint64_t crack_chain_rsa4k_sha384_ddi_fake_global(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_FAKE_GLOBAL_ROOT_CA_CERTIFICATE;
  a2[1] = 1435;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_avp(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))crack_chain_rsa4k_sha384_avp);
}

uint64_t crack_chain_rsa4k_sha384_avp(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_AVP_ROOT_CA_CERTIFICATE;
  a2[1] = 1431;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_tatsu_local_policy(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))crack_chain_rsa4k_sha384_tatsu_local_policy);
}

uint64_t crack_chain_rsa4k_sha384_tatsu_local_policy(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_LP_ROOT_CA_CERTIFICATE;
  a2[1] = 1382;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_tatsu_local_policy_hacktivate(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))crack_chain_rsa4k_sha384_tatsu_local_policy_hacktivate);
}

uint64_t crack_chain_rsa4k_sha384_tatsu_local_policy_hacktivate(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &LOCAL_RSA4K_SHA384_LP_ROOT_CA_CERTIFICATE;
  a2[1] = 1442;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_v2_rsa3k(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))crack_chain_rsa3k_sha384);
}

uint64_t crack_chain_rsa3k_sha384(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &RSA3K_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 1118;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_v2(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))crack_chain_rsa4k_sha384);
}

uint64_t crack_chain_rsa4k_sha384(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 1374;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_v2_AWG1(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))crack_chain_rsa4k_sha384_AWG1);
}

uint64_t crack_chain_rsa4k_sha384_AWG1(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_ROOT_CA_CERTIFICATE_AWG1;
  a2[1] = 1404;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_v2_PED(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))crack_chain_rsa4k_sha384_PED);
}

uint64_t crack_chain_rsa4k_sha384_PED(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_PED_ROOT_CA_CERTIFICATE;
  a2[1] = 1400;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_ec_v1(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7, unsigned int (*a8)(_QWORD *, _BYTE *, uint64_t))
{
  uint64_t result;
  unsigned int v10;
  uint64_t v15;
  const void **v16;
  uint64_t *v17;
  const void **v18;
  _QWORD *v19;
  size_t v20;
  const void *v21;
  uint64_t v22;
  _QWORD *v25;
  _QWORD v26[2];
  _BYTE v27[48];
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE v31[264];
  _OWORD v32[2];
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE v36[32];
  uint64_t v37;
  uint64_t v38;

  result = 0xFFFFFFFFLL;
  if (a1)
  {
    v10 = a2;
    if (a2)
    {
      if (a3 && a4)
      {
        bzero(v27, 0x330uLL);
        v26[0] = a1;
        v26[1] = v10;
        if (!a8(v26, v27, 3)
          && !parse_ec_chain((uint64_t)v27, 3u, (uint64_t)&v28, (uint64_t)&v30, (unint64_t)v32, (unint64_t)&v35, (uint64_t)v36))
        {
          v25 = a4;
          v15 = 0;
          v16 = (const void **)v31;
          v17 = &v29;
          v18 = (const void **)v31;
          while (1)
          {
            v19 = &v26[20 * v15];
            v20 = v19[37];
            v21 = *v18;
            v18 += 20;
            if ((const void *)v20 != v21)
              break;
            if (memcmp((const void *)v19[36], *(v16 - 1), v20))
              break;
            result = verify_chain_signatures(&v32[v15], v17, a7);
            if ((_DWORD)result)
              break;
            v17 += 6;
            ++v15;
            v16 = v18;
            if (v15 == 2)
            {
              if ((unint64_t)v32 > 0xFFFFFFFFFFFFFFDFLL
                || (*a3 = v33, *v25 = v34, (unint64_t)v36 > 0xFFFFFFFFFFFFFFDFLL))
              {
                __break(0x5513u);
              }
              else if (v37 && (v22 = v38) != 0)
              {
                result = 0;
                if (a5)
                {
                  if (a6)
                  {
                    result = 0;
                    *a5 = v37;
                    *a6 = v22;
                  }
                }
              }
              else
              {
                return 0;
              }
              return result;
            }
          }
        }
        return 0xFFFFFFFFLL;
      }
    }
  }
  return result;
}

uint64_t parse_ec_chain(uint64_t result, unsigned int a2, uint64_t a3, uint64_t a4, unint64_t a5, unint64_t a6, uint64_t a7)
{
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  char v30;
  __int128 v31;
  __int128 v32;

  if (!a2)
    return 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v21 = result;
  v24 = ~result;
  v23 = ~a3;
  v20 = ~a4;
  if (a5 <= a6)
    v12 = a6;
  else
    v12 = a5;
  v19 = ~v12;
  v16 = ~a7;
  v15 = 16 * a2;
  while (v11 <= v24 && v10 <= v23)
  {
    result = DERParseSequenceToObject(v21 + v11, (unsigned __int16)DERNumSignedCertCrlItemSpecs, (uint64_t)&DERSignedCertCrlItemSpecs, a3 + v10, 0x30uLL, 0x30uLL);
    if ((_DWORD)result)
      return 0xFFFFFFFFLL;
    if (v9 > v20)
      break;
    result = DERParseSequenceToObject(a3 + v10, (unsigned __int16)DERNumTBSCertItemSpecs, (uint64_t)&DERTBSCertItemSpecs, a4 + v9, 0xA0uLL, 0xA0uLL);
    if ((_DWORD)result)
      return 0xFFFFFFFFLL;
    if (v11 > v19)
      break;
    v31 = 0u;
    v32 = 0u;
    v30 = 0;
    v28 = 0u;
    v29 = 0u;
    if (DERParseSequenceContentToObject((unint64_t *)(a4 + v9 + 96), (unsigned __int16)DERNumSubjPubKeyInfoItemSpecs, (uint64_t)&DERSubjPubKeyInfoItemSpecs, (unint64_t)&v31, 0x20uLL, 0x20uLL))return 0xFFFFFFFFLL;
    if (DERParseSequenceContentToObject((unint64_t *)&v31, (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, (unint64_t)&v28, 0x20uLL, 0x20uLL))return 0xFFFFFFFFLL;
    if (!DEROidCompare((uint64_t)&v28, (uint64_t)&oidEcPubKey))
      return 0xFFFFFFFFLL;
    if (DERParseBitString((uint64_t)&v32, (unint64_t *)(a5 + v11), &v30))
      return 0xFFFFFFFFLL;
    if (v30)
      return 0xFFFFFFFFLL;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    result = DERDecodeItem((uint64_t)&v29, &v25);
    if ((_DWORD)result)
      return 0xFFFFFFFFLL;
    v13 = (_QWORD *)(a6 + v11);
    v14 = v27;
    *v13 = v26;
    v13[1] = v14;
    if (v11 > v16)
      break;
    result = parse_extensions(a4 + v9, (_QWORD *)(a7 + v11));
    if ((_DWORD)result)
      return 0xFFFFFFFFLL;
    v11 += 16;
    v10 += 48;
    v9 += 160;
    if (v15 == v11)
      return 0;
  }
  __break(0x5513u);
  return result;
}

uint64_t verify_chain_img4_ecdsa256(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v2(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))crack_chain_ecdsa256_sha256);
}

uint64_t verify_chain_img4_ec_v2(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7, unsigned int (*a8)(_QWORD *, _BYTE *, uint64_t))
{
  uint64_t result;
  unsigned int v10;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[2];
  _BYTE v20[32];
  _BYTE v21[48];
  _QWORD v22[6];
  _BYTE v23[80];
  void *__s1;
  size_t __n;
  void *__s2;
  uint64_t v27;
  _QWORD v28[4];
  uint64_t v29;
  _BYTE v30[16];
  uint64_t v31;
  uint64_t v32;

  result = 0xFFFFFFFFLL;
  if (!a1)
    return result;
  v10 = a2;
  if (!a2 || !a3 || !a4)
    return result;
  bzero(v20, 0x220uLL);
  v19[0] = a1;
  v19[1] = v10;
  if (a8(v19, v20, 2))
    return 0xFFFFFFFFLL;
  result = parse_ec_chain((uint64_t)v20, 2u, (uint64_t)v21, (uint64_t)v23, (unint64_t)v28, (unint64_t)&v29, (uint64_t)v30);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  if ((unint64_t)v23 > 0xFFFFFFFFFFFFFF5FLL)
    goto LABEL_22;
  if (__n != v27)
    return 0xFFFFFFFFLL;
  result = memcmp(__s1, __s2, __n);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  if ((unint64_t)v21 > 0xFFFFFFFFFFFFFFCFLL)
  {
LABEL_22:
    __break(0x5513u);
    return result;
  }
  result = verify_chain_signatures(v28, v22, a7);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  if ((unint64_t)v28 > 0xFFFFFFFFFFFFFFEFLL)
    goto LABEL_22;
  v16 = v28[3];
  *a3 = v28[2];
  *a4 = v16;
  if ((unint64_t)v30 > 0xFFFFFFFFFFFFFFEFLL)
    goto LABEL_22;
  if (!v31)
    return 0;
  v17 = v32;
  if (!v32)
    return 0;
  result = 0;
  if (a5)
  {
    if (a6)
    {
      result = 0;
      *a5 = v31;
      *a6 = v17;
    }
  }
  return result;
}

uint64_t crack_chain_ecdsa256_sha256(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &LOCAL_EC256_SHA256_ROOT_CA_CERTIFICATE;
  a2[1] = 551;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_ecdsa384(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v2(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))crack_chain_ecdsa384_sha384_hacktivate);
}

uint64_t crack_chain_ecdsa384_sha384_hacktivate(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &LOCAL_EC384_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 610;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_ecdsa384_local_policy(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v1(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))crack_chain_ecdsa384_sha384);
}

uint64_t crack_chain_ecdsa384_sha384(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &EC384_SHA384_LP_ROOT_CA_CERTIFICATE;
  a2[1] = 542;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_ecdsa384_hacktivate(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v1(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))crack_chain_ecdsa384_sha384_hacktivate);
}

uint64_t verify_chain_img4_ecdsa384_qa(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v1(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))crack_chain_ecdsa384_sha384_qa);
}

uint64_t crack_chain_ecdsa384_sha384_qa(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &QA_EC384_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 540;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t Img4DecodeDigestInit(uint64_t a1)
{
  _QWORD *v1;

  if (!a1)
    return 0xFFFFFFFFLL;
  v1 = *(_QWORD **)(a1 + 16);
  if (!v1 || !*v1)
    return 0xFFFFFFFFLL;
  ccdigest_init();
  return 0;
}

uint64_t Img4DecodeDigestUpdate(uint64_t a1)
{
  if (!a1)
    return 0xFFFFFFFFLL;
  if (!**(_QWORD **)(a1 + 16))
    return 0xFFFFFFFFLL;
  ccdigest_update();
  return 0;
}

uint64_t Img4DecodeDigestReturnHash(uint64_t a1, _QWORD *a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;

  if (!a1)
    return 0xFFFFFFFFLL;
  v4 = **(_QWORD **)(a1 + 16);
  if (!v4 || *(_QWORD *)v4 > a3)
    return 0xFFFFFFFFLL;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v4 + 56))(v4, *a2, a4);
  return 0;
}

uint64_t Img4DecodeDigestFinal(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  unint64_t *v3;

  if (a1 && (v3 = **(unint64_t ***)(a1 + 16)) != 0)
    return Img4DecodeDigestReturnHash(a1, a2, *v3, a3);
  else
    return 0xFFFFFFFFLL;
}

uint64_t Img4DecodeComputeDigest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;
  _QWORD *v8;
  _QWORD *v9;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3 && a5)
  {
    v8 = *(_QWORD **)(a5 + 32);
    if (v8 && (v9 = (_QWORD *)v8[2]) != 0 && *v8 == a4 && *v9 && *(_QWORD *)*v9 == a4)
    {
      ccdigest();
      return 0;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t img4_verify_signature_with_chain(unint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, _QWORD *a7, _QWORD *a8)
{
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v18 = 0;
  v19 = 0;
  v16 = 0;
  v17 = 0;
  if (verify_chain_img4_v1(a1, a2, &v18, &v19, &v16, &v17, (uint64_t)kImg4DecodeSecureBootRsa1kSha1))
    return 0xFFFFFFFFLL;
  *a7 = v16;
  *a8 = v17;
  result = verify_signature_rsa(v18, v19, a3, a4, a5, a6, (uint64_t)kImg4DecodeSecureBootRsa1kSha1, v14);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  return result;
}

uint64_t _crack_chain_with_anchor(unint64_t *a1, uint64_t a2, unsigned int a3)
{
  unint64_t v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t result;
  unint64_t v10;
  unint64_t v11;
  BOOL v12;
  unint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;

  v18 = 0;
  v19 = 0;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v5 = ~a2;
  v6 = 1;
  v7 = *a1;
  v8 = a1[1];
  while (1)
  {
    v18 = v7;
    v19 = v8;
    result = DERDecodeItem((uint64_t)&v18, &v15);
    if ((_DWORD)result)
      return 0xFFFFFFFFLL;
    if (__CFADD__(v16, v17))
      break;
    v10 = v16 + v17;
    v11 = v16 + v17 - v7;
    v12 = !(v11 >> 17) && v8 >= v11;
    if (!v12 || v6 >= a3)
      return 0xFFFFFFFFLL;
    if (v5 < 16 * (unint64_t)v6)
      break;
    v14 = (unint64_t *)(a2 + 16 * v6);
    *v14 = v7;
    v14[1] = v11;
    if (v10 < v7)
      break;
    v12 = v8 >= v11;
    v8 -= v11;
    if (!v12)
      goto LABEL_21;
    ++v6;
    v7 = v10;
    if (!v8)
    {
      if (v6 == a3)
        return 0;
      return 0xFFFFFFFFLL;
    }
  }
  __break(0x5513u);
LABEL_21:
  __break(0x5515u);
  return result;
}

uint64_t parse_extensions(uint64_t a1, _QWORD *a2)
{
  char v3;
  int v4;
  _OWORD v6[2];
  __int128 v7;
  unint64_t v8;
  unint64_t v9[2];
  uint64_t v10;
  unint64_t v11[2];
  unint64_t v12[3];

  v11[0] = 0;
  v11[1] = 0;
  v9[1] = 0;
  v10 = 0;
  v8 = 0;
  v9[0] = 0;
  v7 = 0u;
  memset(v6, 0, sizeof(v6));
  *a2 = 0;
  a2[1] = 0;
  if (!*(_QWORD *)(a1 + 152))
    return 0;
  if (DERDecodeSeqInit(a1 + 144, &v10, v11) || v10 != 0x2000000000000010)
    return 0xFFFFFFFFLL;
  v3 = 1;
  while (1)
  {
    v4 = DERDecodeSeqNext(v11, &v8);
    if (v4)
      break;
    if (v8 != 0x2000000000000010
      || DERParseSequenceContentToObject(v9, (unsigned __int16)DERNumExtensionItemSpecs, (uint64_t)&DERExtensionItemSpecs, (unint64_t)v6, 0x30uLL, 0x30uLL))
    {
      return 0xFFFFFFFFLL;
    }
    v3 = 0;
    if (DEROidCompare((uint64_t)&oidAppleImg4ManifestCertSpec, (uint64_t)v6))
    {
      memset(v12, 0, sizeof(v12));
      if (DERDecodeItem((uint64_t)&v7, v12) || v12[0] != 0x2000000000000011)
        return 0xFFFFFFFFLL;
      v3 = 0;
      *(_OWORD *)a2 = v7;
    }
  }
  if (v4 != 1 || (v3 & 1) != 0)
    return 0xFFFFFFFFLL;
  else
    return 0;
}

_DWORD *DEREncoderCreate(int a1)
{
  _DWORD *result;

  result = calloc(1uLL, 0x10uLL);
  if (result)
    result[3] = a1;
  return result;
}

void DEREncoderDestroy(_QWORD **a1)
{
  _QWORD *v2;
  _QWORD *v3;

  if (a1)
  {
    v2 = *a1;
    if (v2)
    {
      do
      {
        v3 = (_QWORD *)*v2;
        _EncodedDataRelease((uint64_t)v2);
        v2 = v3;
      }
      while (v3);
    }
    free(a1);
  }
}

uint64_t DEREncoderAddData(uint64_t *a1, unsigned int a2, unsigned int a3, const void *a4, unsigned int a5, int a6)
{
  char *v7;

  v7 = _EncodedDataCreate(a2, a3, a4, a5, a6, 3);
  return _DEREncoderAddEncodedData(a1, (uint64_t)v7);
}

uint64_t _DEREncoderAddEncodedData(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  int v4;
  uint64_t v5;
  int v6;
  BOOL v7;
  int v8;
  int v9;
  uint64_t *v10;
  uint64_t *v11;
  int v12;
  uint64_t *v13;
  unint64_t v14;
  unint64_t v15;
  int v16;
  unsigned int v17;
  unsigned int v18;
  size_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;

  v2 = a2;
  if (!a1)
  {
    v22 = 1;
    if (!a2)
      return v22;
    goto LABEL_30;
  }
  if (!a2)
    return 2;
  v4 = *((_DWORD *)a1 + 2);
  v5 = a2;
  do
  {
    v6 = *(_DWORD *)(v5 + 20);
    v7 = __CFADD__(v4, v6);
    v8 = v4 + v6;
    if (v7 || (v9 = *(_DWORD *)(v5 + 24), v4 = v8 + v9, __CFADD__(v8, v9)))
    {
      v22 = 2;
      do
      {
LABEL_30:
        v23 = *(_QWORD *)v2;
        _EncodedDataRelease(v2);
        v2 = v23;
      }
      while (v23);
      return v22;
    }
    v5 = *(_QWORD *)v5;
  }
  while (v5);
  v10 = (uint64_t *)*a1;
  v11 = a1;
  if (!*a1)
    goto LABEL_26;
  v12 = *((_DWORD *)a1 + 3);
  v11 = a1;
  while (2)
  {
    v13 = v11;
    v11 = v10;
    if (!v12)
      goto LABEL_20;
    v14 = bswap64(*(_QWORD *)(v2 + 28));
    v15 = bswap64(*(uint64_t *)((char *)v11 + 28));
    if (v14 != v15 || (v14 = bswap64(*(_QWORD *)(v2 + 36)), v15 = bswap64(*(uint64_t *)((char *)v11 + 36)), v14 != v15))
    {
      if (v14 < v15)
        v16 = -1;
      else
        v16 = 1;
LABEL_19:
      if (v16 < 0)
        break;
      goto LABEL_20;
    }
    v17 = *(_DWORD *)(v2 + 24);
    v18 = *((_DWORD *)v11 + 6);
    if (v17 >= v18)
      v19 = v18;
    else
      v19 = v17;
    v16 = memcmp(*(const void **)(v2 + 8), (const void *)v11[1], v19);
    if (v16)
      goto LABEL_19;
    if (v17 >= v18)
    {
LABEL_20:
      v10 = (uint64_t *)*v11;
      if (!*v11)
        goto LABEL_26;
      continue;
    }
    break;
  }
  v20 = (_QWORD *)v2;
  do
  {
    v21 = v20;
    v20 = (_QWORD *)*v20;
  }
  while (v20);
  *v21 = v11;
  v11 = v13;
LABEL_26:
  v22 = 0;
  *v11 = v2;
  *((_DWORD *)a1 + 2) = v4;
  return v22;
}

char *_EncodedDataCreate(unsigned int a1, unsigned int a2, const void *a3, unsigned int a4, int a5, int a6)
{
  char *v12;
  char *v13;
  char *v14;
  int v15;
  int v16;
  uint64_t v17;
  BOOL v18;
  _BYTE *v19;
  uint64_t v20;
  int v21;
  char *v22;
  _BYTE *v23;
  uint64_t v24;
  unsigned int v25;
  int v26;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  if (!a3 && a4 && a6)
    return 0;
  v12 = (char *)calloc(1uLL, 0x38uLL);
  v13 = v12;
  if (!v12)
    return v13;
  *((_DWORD *)v12 + 4) = 1;
  v14 = v12 + 28;
  if (a1 == 259)
  {
    v15 = 0;
    goto LABEL_7;
  }
  if (a1 > 3)
    goto LABEL_40;
  if (a2 > 0x1E)
  {
    v17 = 0;
    v28[0] = 0;
    do
    {
      *((_BYTE *)v28 + v17++) = a2 & 0x7F;
      v18 = a2 > 0x7F;
      a2 >>= 7;
    }
    while (v18);
    v16 = (_DWORD)v13 + 28;
    if ((v17 & 0xFFFFFFF0) == 0)
    {
      v13[28] = ((_BYTE)a1 << 6) | (32 * (a5 != 0)) | 0x1F;
      v19 = v13 + 29;
      if (v17 >= 2)
      {
        v20 = v17 - 1;
        do
          *v19++ = *((_BYTE *)v28 + v20--) | 0x80;
        while ((_DWORD)v20);
      }
      *v19 = v28[0];
      v16 = (_DWORD)v19 + 1;
    }
  }
  else
  {
    v13[28] = ((_BYTE)a1 << 6) | (32 * (a5 != 0)) | a2;
    v16 = (_DWORD)v13 + 29;
  }
  v21 = v16 - (_DWORD)v14;
  if (!v21)
    goto LABEL_40;
  v22 = &v14[v21];
  if (a4 > 0x7F)
  {
    v24 = 0;
    v28[0] = 0;
    v25 = a4;
    do
    {
      *((_BYTE *)v28 + v24++) = v25;
      v18 = v25 > 0xFF;
      v25 >>= 8;
    }
    while (v18);
    if (16 - v21 <= v24)
    {
      LODWORD(v23) = (_DWORD)v14 + v21;
    }
    else
    {
      *v22 = v24 | 0x80;
      v23 = v22 + 1;
      if ((_DWORD)v24)
      {
        do
          *v23++ = *((_BYTE *)&v28[-1] + v24-- + 7);
        while (v24);
      }
    }
  }
  else
  {
    LODWORD(v23) = (_DWORD)v14 + v21;
    if (v21 != 16)
    {
      *v22 = a4;
      LODWORD(v23) = (_DWORD)v22 + 1;
    }
  }
  v26 = (_DWORD)v23 - (_DWORD)v22;
  if ((_DWORD)v23 == (_DWORD)v22)
  {
LABEL_40:
    free(v13);
    return 0;
  }
  v14 = &v22[v26];
  v15 = v21 + v26;
LABEL_7:
  *((_DWORD *)v13 + 5) = v15;
  switch(a6)
  {
    case 0:
      *((_QWORD *)v13 + 1) = 0;
      *((_QWORD *)v13 + 6) = 0;
      *((_DWORD *)v13 + 6) = 0;
      return v13;
    case 1:
      *((_QWORD *)v13 + 1) = a3;
      *((_QWORD *)v13 + 6) = 0;
      goto LABEL_25;
    case 2:
      *((_QWORD *)v13 + 1) = a3;
      *((_QWORD *)v13 + 6) = v13;
LABEL_25:
      *((_DWORD *)v13 + 6) = a4;
      return v13;
    case 3:
      if (v13 + 56 - v14 >= a4)
      {
        *((_QWORD *)v13 + 1) = v14;
        *((_DWORD *)v13 + 6) = a4;
      }
      else
      {
        v14 = (char *)malloc(a4);
        *((_QWORD *)v13 + 1) = v14;
        *((_QWORD *)v13 + 6) = v13;
        *((_DWORD *)v13 + 6) = a4;
        if (!v14)
          goto LABEL_40;
      }
      memcpy(v14, a3, a4);
      break;
    default:
      return v13;
  }
  return v13;
}

uint64_t DEREncoderAddDataNoCopy(uint64_t *a1, unsigned int a2, unsigned int a3, const void *a4, unsigned int a5, int a6)
{
  char *v7;

  v7 = _EncodedDataCreate(a2, a3, a4, a5, a6, 1);
  return _DEREncoderAddEncodedData(a1, (uint64_t)v7);
}

uint64_t DEREncoderAddUInt32(uint64_t *a1, unsigned int a2, unsigned int a3, unsigned int a4)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  char *v8;
  unsigned int v10;
  char v11;
  unsigned int v12;
  uint64_t v13;

  v5 = 0;
  v13 = *MEMORY[0x24BDAC8D0];
  v10 = bswap32(a4);
  v11 = 0;
  v12 = v10;
  while (!*((_BYTE *)&v10 + v5))
  {
    if (++v5 == 4)
    {
      v6 = 0;
      goto LABEL_6;
    }
  }
  v6 = ((unint64_t)*((unsigned __int8 *)&v10 + v5) >> 7) - v5 + 4;
LABEL_6:
  if (v6 <= 1)
    v7 = 1;
  else
    v7 = v6;
  v8 = _EncodedDataCreate(a2, a3, &v11 - v7 + 5, v7, 0, 3);
  return _DEREncoderAddEncodedData(a1, (uint64_t)v8);
}

uint64_t DEREncoderAddUInt64(uint64_t *a1, unsigned int a2, unsigned int a3, unint64_t a4)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  char *v8;
  unint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;

  v5 = 0;
  v13 = *MEMORY[0x24BDAC8D0];
  v10 = bswap64(a4);
  v11 = 0;
  v12 = v10;
  while (!*((_BYTE *)&v10 + v5))
  {
    if (++v5 == 8)
    {
      v6 = 0;
      goto LABEL_6;
    }
  }
  v6 = ((unint64_t)*((unsigned __int8 *)&v10 + v5) >> 7) - v5 + 8;
LABEL_6:
  if (v6 <= 1)
    v7 = 1;
  else
    v7 = v6;
  v8 = _EncodedDataCreate(a2, a3, &v11 - v7 + 9, v7, 0, 3);
  return _DEREncoderAddEncodedData(a1, (uint64_t)v8);
}

uint64_t DEREncoderAddInt32AsData(uint64_t *a1, unsigned int a2, unsigned int a3, int a4)
{
  char *v5;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v5 = _EncodedDataCreate(a2, a3, &v7, 4u, 0, 3);
  return _DEREncoderAddEncodedData(a1, (uint64_t)v5);
}

uint64_t DEREncoderAddInt64AsData(uint64_t *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  char *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v7[0] = a4;
  v5 = _EncodedDataCreate(a2, a3, v7, 8u, 0, 3);
  return _DEREncoderAddEncodedData(a1, (uint64_t)v5);
}

uint64_t DEREncoderAddIA5String(uint64_t *a1, const void *a2, unsigned int a3)
{
  char *v4;

  v4 = _EncodedDataCreate(0, 0x16u, a2, a3, 0, 3);
  return _DEREncoderAddEncodedData(a1, (uint64_t)v4);
}

uint64_t DEREncoderAddBoolean(uint64_t *a1, int a2)
{
  char *v3;
  char *v4;
  char v6;
  char v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v7 = -1;
  v6 = 0;
  if (a2)
    v3 = &v7;
  else
    v3 = &v6;
  v4 = _EncodedDataCreate(0, 1u, v3, 1u, 0, 3);
  return _DEREncoderAddEncodedData(a1, (uint64_t)v4);
}

uint64_t DEREncoderCreateEncodedBuffer(uint64_t **a1, _QWORD *a2, unsigned int *a3)
{
  unsigned int v6;
  char *v7;
  void *v8;
  uint64_t **v9;
  char *v10;
  char *v11;
  uint64_t result;

  if (!a1)
    return 1;
  v6 = *((_DWORD *)a1 + 2);
  v7 = (char *)malloc(v6);
  if (!v7)
    return 2;
  v8 = v7;
  v9 = (uint64_t **)*a1;
  if (*a1)
  {
    v10 = v7;
    do
    {
      memcpy(v10, (char *)v9 + 28, *((unsigned int *)v9 + 5));
      v11 = &v10[*((unsigned int *)v9 + 5)];
      memcpy(v11, v9[1], *((unsigned int *)v9 + 6));
      v10 = &v11[*((unsigned int *)v9 + 6)];
      v9 = (uint64_t **)*v9;
    }
    while (v9);
  }
  if (a3)
    *a3 = v6;
  if (a2)
  {
    result = 0;
    *a2 = v8;
  }
  else
  {
    free(v8);
    return 0;
  }
  return result;
}

uint64_t DEREncoderAddDataFromEncoder(uint64_t **a1, uint64_t *a2, unsigned int a3, unsigned int a4)
{
  if (a1 && a2)
    return _DEREncoderAddDataFromEncoderByEncoding(a1, a2, a3, a4, 1);
  else
    return 1;
}

uint64_t _DEREncoderAddDataFromEncoderByEncoding(uint64_t **a1, uint64_t *a2, unsigned int a3, unsigned int a4, int a5)
{
  uint64_t v9;
  char *v10;
  void *v12;
  unsigned int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v13 = 0;
  v12 = 0;
  v9 = DEREncoderCreateEncodedBuffer(a1, &v12, &v13);
  if (!(_DWORD)v9)
  {
    v9 = 2;
    v10 = _EncodedDataCreate(a3, a4, v12, v13, a5, 2);
    if (v10)
    {
      v12 = 0;
      v9 = _DEREncoderAddEncodedData(a2, (uint64_t)v10);
    }
  }
  if (v12)
    free(v12);
  return v9;
}

uint64_t DEREncoderAddDataFromEncoderNoCopy(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, int a5)
{
  uint64_t result;
  char *v8;
  char *v9;
  uint64_t *v10;
  _QWORD *i;
  _QWORD *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  unint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  char *v20;
  _QWORD *v21;

  result = 1;
  if (!a1 || !a2)
    return result;
  if (*(_DWORD *)(a2 + 12))
    return _DEREncoderAddDataFromEncoderByEncoding((uint64_t **)a1, (uint64_t *)a2, a3, a4, a5);
  v8 = _EncodedDataCreate(a3, a4, 0, *(_DWORD *)(a1 + 8), 1, 0);
  if (!v8)
    return 2;
  v9 = v8;
  v10 = *(uint64_t **)a1;
  v21 = 0;
  for (i = &v21; ; i = v12)
  {
    if (!v10)
    {
      v19 = v21;
      *(_QWORD *)v9 = v21;
      if (!v19)
        goto LABEL_20;
      return _DEREncoderAddEncodedData((uint64_t *)a2, (uint64_t)v9);
    }
    v12 = malloc(0x38uLL);
    if (!v12)
      break;
    v13 = v10[6];
    v15 = *((_OWORD *)v10 + 1);
    v14 = *((_OWORD *)v10 + 2);
    *(_OWORD *)v12 = *(_OWORD *)v10;
    *((_OWORD *)v12 + 1) = v15;
    v12[6] = v13;
    *((_OWORD *)v12 + 2) = v14;
    *v12 = 0;
    *((_DWORD *)v12 + 4) = 1;
    v16 = v10[1];
    if ((unint64_t)v10 + 28 > v16 || v16 >= (unint64_t)(v10 + 7))
    {
      if (v13)
        ++*(_DWORD *)(v13 + 16);
    }
    else
    {
      v12[1] = (char *)v12 + v16 - (_QWORD)v10;
    }
    *i = v12;
    v10 = (uint64_t *)*v10;
  }
  v17 = v21;
  if (v21)
  {
    do
    {
      v18 = (_QWORD *)*v17;
      _EncodedDataRelease((uint64_t)v17);
      v17 = v18;
    }
    while (v18);
  }
  *(_QWORD *)v9 = 0;
LABEL_20:
  if (!*(_QWORD *)a1)
    return _DEREncoderAddEncodedData((uint64_t *)a2, (uint64_t)v9);
  do
  {
    v20 = *(char **)v9;
    _EncodedDataRelease((uint64_t)v9);
    v9 = v20;
  }
  while (v20);
  return 2;
}

uint64_t DEREncoderAddSequenceFromEncoder(uint64_t **a1, uint64_t *a2)
{
  if (a1 && a2)
    return _DEREncoderAddDataFromEncoderByEncoding(a1, a2, 0, 0x10u, 1);
  else
    return 1;
}

uint64_t DEREncoderAddSetFromEncoder(uint64_t **a1, uint64_t *a2)
{
  if (a1 && a2)
    return _DEREncoderAddDataFromEncoderByEncoding(a1, a2, 0, 0x11u, 1);
  else
    return 1;
}

uint64_t DEREncoderAddPrivateFromEncoder(uint64_t **a1, uint64_t *a2, unsigned int a3)
{
  uint64_t **v6;
  uint64_t **v7;
  uint64_t v8;

  v6 = (uint64_t **)calloc(1uLL, 0x10uLL);
  v7 = v6;
  if (!v6)
  {
    v8 = 0xFFFFFFFFLL;
    goto LABEL_8;
  }
  *((_DWORD *)v6 + 3) = 0;
  if (!a1)
    goto LABEL_7;
  v8 = _DEREncoderAddDataFromEncoderByEncoding(a1, (uint64_t *)v6, 0, 0x10u, 1);
  if (!(_DWORD)v8)
  {
    if (a2)
    {
      v8 = _DEREncoderAddDataFromEncoderByEncoding(v7, a2, 3u, a3, 1);
      goto LABEL_8;
    }
LABEL_7:
    v8 = 1;
  }
LABEL_8:
  DEREncoderDestroy(v7);
  return v8;
}

void _EncodedDataRelease(uint64_t a1)
{
  int v1;
  void *v3;
  uint64_t v4;

  v1 = *(_DWORD *)(a1 + 16) - 1;
  *(_DWORD *)(a1 + 16) = v1;
  if (!v1)
  {
    v3 = *(void **)(a1 + 8);
    if (v3)
    {
      v4 = *(_QWORD *)(a1 + 48);
      if (((unint64_t)v3 >= a1 + 56 || a1 + 28 > (unint64_t)v3) && v4 != 0)
      {
        if (v4 == a1)
          free(v3);
        else
          _EncodedDataRelease(*(_QWORD *)(a1 + 48));
      }
    }
    free((void *)a1);
  }
}

void _darwin_el0_logv_cold_1(_QWORD *a1, _OWORD *a2)
{
  int *v2;

  OUTLINED_FUNCTION_3(a1, a2);
  OUTLINED_FUNCTION_4(MEMORY[0x24BDACB70]);
  v2 = __error();
  OUTLINED_FUNCTION_5(v2);
  OUTLINED_FUNCTION_6();
  _os_crash_msg();
  __break(1u);
}

void _darwin_el0_alloc_type_cold_1(_QWORD *a1, _OWORD *a2)
{
  int *v2;

  OUTLINED_FUNCTION_3(a1, a2);
  OUTLINED_FUNCTION_4(MEMORY[0x24BDACB70]);
  v2 = __error();
  OUTLINED_FUNCTION_5(v2);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

void _darwin_el0_query_trust_store_cold_1(_QWORD *a1, _OWORD *a2)
{
  int *v2;

  OUTLINED_FUNCTION_3(a1, a2);
  OUTLINED_FUNCTION_4(MEMORY[0x24BDACB70]);
  v2 = __error();
  OUTLINED_FUNCTION_5(v2);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

void _darwin_runtime_alloc_cold_1(_QWORD *a1, _OWORD *a2)
{
  int *v2;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  v2 = __error();
  strerror(*v2);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void dylib_restoreos_logv_cold_1(_QWORD *a1, _OWORD *a2)
{
  const __CFData *v2;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  __error();
  _os_log_send_and_compose_impl();
  v2 = (const __CFData *)_os_crash_msg();
  __break(1u);
  CFDataGetBytePtr(v2);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EF8](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x24BDD88C0](*(_QWORD *)&mainPort, path);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
}

uint64_t __os_temporary_resource_shortage()
{
  return MEMORY[0x24BDAC868]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

uint64_t _dispatch_is_multithreaded()
{
  return MEMORY[0x24BDAC9B0]();
}

uint64_t _dyld_get_image_slide()
{
  return MEMORY[0x24BDACA48]();
}

uint64_t _os_crash()
{
  return MEMORY[0x24BDACB50]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x24BDACB58]();
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x24BDACBA8]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x24BDAD328](__count, __size);
}

uint64_t cc_cmp_safe()
{
  return MEMORY[0x24BDAD350]();
}

uint64_t ccder_blob_decode_bitstring()
{
  return MEMORY[0x24BDAD400]();
}

uint64_t ccder_blob_decode_tag()
{
  return MEMORY[0x24BDAD428]();
}

uint64_t ccder_blob_decode_tl()
{
  return MEMORY[0x24BDAD430]();
}

uint64_t ccder_blob_decode_uint64()
{
  return MEMORY[0x24BDAD438]();
}

uint64_t ccder_blob_encode_tl()
{
  return MEMORY[0x24BDAD460]();
}

uint64_t ccder_decode_rsa_pub_n()
{
  return MEMORY[0x24BDAD478]();
}

uint64_t ccder_sizeof_len()
{
  return MEMORY[0x24BDAD500]();
}

uint64_t ccder_sizeof_tag()
{
  return MEMORY[0x24BDAD518]();
}

uint64_t ccdigest()
{
  return MEMORY[0x24BDAD538]();
}

uint64_t ccdigest_init()
{
  return MEMORY[0x24BDAD540]();
}

uint64_t ccdigest_update()
{
  return MEMORY[0x24BDAD548]();
}

uint64_t ccec_compressed_x962_export_pub()
{
  return MEMORY[0x24BDAD568]();
}

uint64_t ccec_compressed_x962_export_pub_size()
{
  return MEMORY[0x24BDAD570]();
}

uint64_t ccec_compressed_x962_import_pub()
{
  return MEMORY[0x24BDAD578]();
}

uint64_t ccec_cp_256()
{
  return MEMORY[0x24BDAD590]();
}

uint64_t ccec_cp_384()
{
  return MEMORY[0x24BDAD598]();
}

uint64_t ccec_cp_521()
{
  return MEMORY[0x24BDAD5A0]();
}

uint64_t ccec_export_pub()
{
  return MEMORY[0x24BDAD5B0]();
}

uint64_t ccec_get_cp()
{
  return MEMORY[0x24BDAD5C8]();
}

uint64_t ccec_import_pub()
{
  return MEMORY[0x24BDAD5D0]();
}

uint64_t ccec_keysize_is_supported()
{
  return MEMORY[0x24BDAD5D8]();
}

uint64_t ccec_verify()
{
  return MEMORY[0x24BDAD5F0]();
}

uint64_t ccec_verify_composite()
{
  return MEMORY[0x24BDAD5F8]();
}

uint64_t ccec_x963_import_pub_size()
{
  return MEMORY[0x24BDAD618]();
}

uint64_t ccrsa_import_pub()
{
  return MEMORY[0x24BDAD7D0]();
}

uint64_t ccrsa_make_pub()
{
  return MEMORY[0x24BDAD7E0]();
}

uint64_t ccrsa_verify_pkcs1v15()
{
  return MEMORY[0x24BDAD7F0]();
}

uint64_t ccrsa_verify_pkcs1v15_allowshortsigs()
{
  return MEMORY[0x24BDAD7F8]();
}

uint64_t ccrsa_verify_pkcs1v15_digest()
{
  return MEMORY[0x24BDAD800]();
}

uint64_t ccsha1_di()
{
  return MEMORY[0x24BDAD818]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x24BDAD828]();
}

uint64_t ccsha384_di()
{
  return MEMORY[0x24BDAD838]();
}

uint64_t cczp_bitlen()
{
  return MEMORY[0x24BDAD928]();
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

double difftime(time_t a1, time_t a2)
{
  double result;

  MEMORY[0x24BDADC30](a1, a2);
  return result;
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x24BDADEA0](predicate, context, function);
}

int dprintf(int a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE0A8](*(_QWORD *)&a1, a2);
}

uint64_t dyld_program_minos_at_least()
{
  return MEMORY[0x24BDAE140]();
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x24BDAE438](*(_QWORD *)&a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDAE508](*(_QWORD *)&a1, a2);
}

int getdtablesize(void)
{
  return MEMORY[0x24BDAE5E0]();
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x24BDAE6E8]();
}

char *__cdecl getsectdatafromheader_64(const mach_header_64 *mhp, const char *segname, const char *sectname, uint64_t *size)
{
  return (char *)MEMORY[0x24BDAE740](mhp, segname, sectname, size);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x24BDAEEC8](__s, __smax, *(_QWORD *)&__c, __n);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_log_with_args()
{
  return MEMORY[0x24BDAF3A0]();
}

uint64_t os_parse_boot_arg_int()
{
  return MEMORY[0x24BDAF3D8]();
}

uint64_t os_parse_boot_arg_string()
{
  return MEMORY[0x24BDAF3E0]();
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x24BDAF458](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF38](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x24BDAFF80](__s1, __n);
}

char *__cdecl strptime(const char *a1, const char *a2, tm *a3)
{
  return (char *)MEMORY[0x24BDAFF98](a1, a2, a3);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x24BDAFFB0](__stringp, __delim);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0000](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0030](__str, __endptr, *(_QWORD *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x24BDB00F8](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

int sysctlnametomib(const char *a1, int *a2, size_t *a3)
{
  return MEMORY[0x24BDB0108](a1, a2, a3);
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

time_t timegm(tm *const a1)
{
  return MEMORY[0x24BDB0248](a1);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x24BDB0330](in, uu);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x24BDB0358](a1, a2, a3);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return MEMORY[0x24BDB0370](a1, a2, a3);
}

