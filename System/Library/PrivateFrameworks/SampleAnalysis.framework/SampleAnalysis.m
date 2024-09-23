void sub_1B9BE1F8C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9BE2110(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9BE26D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

CFTypeRef SACFBundleCopyStringForKey(__CFBundle *a1, const __CFString *a2)
{
  CFTypeRef result;
  CFTypeID v3;
  id v4;

  result = CFBundleGetValueForInfoDictionaryKey(a1, a2);
  if (result)
  {
    v4 = (id)result;
    v3 = CFGetTypeID(result);
    if (v3 == CFStringGetTypeID())
      return v4;
    else
      return (CFTypeRef)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@"), v4);
  }
  return result;
}

void sub_1B9BE2FD0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9BE31FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void saos_printf_frame(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, void *a6)
{
  id v11;

  v11 = a1;
  _saos_printf_frame_base(v11, a2, a3, a4, a5, a6);
  objc_msgSend(v11, "appendString:", CFSTR("\n"));

}

void _saos_printf_frame_base(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, void *a6)
{
  id v11;
  id v12;

  v11 = a6;
  v12 = a1;
  _saos_printf_indent_and_count(v12, a2, a3, a4, a5);
  objc_msgSend(v12, "appendString:", v11);

}

void sub_1B9BE81BC(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x3A0], 8);
  _Block_object_dispose(&STACK[0x500], 8);
  _Block_object_dispose(&STACK[0x3C0], 8);
  _Block_object_dispose(&STACK[0x3F0], 8);
  _Unwind_Resume(a1);
}

void sub_1B9BF209C(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x470], 8);
  _Unwind_Resume(a1);
}

void sub_1B9BF2374(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9BF289C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SABinarySearchArray(void *a1, __int16 a2, uint64_t a3)
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t (*v9)(uint64_t);
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t (*v21)(uint64_t);
  BOOL v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int16 v28;
  uint64_t v29;
  id v30;

  v5 = objc_msgSend(a1, "count");
  v6 = (id)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  if (!v5)
  {
    if ((a2 & 0x400) != 0)
      return 0;
    else
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  v29 = a2 & 0x200;
  v30 = v6;
  if ((unint64_t)v5 >= 0x101)
  {
    v7 = v5 - 1;
    objc_msgSend(a1, "objectAtIndex:", v5 - 1);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = *(uint64_t (**)(uint64_t))(a3 + 16);
    if (v8 == v30)
    {
      v10 = v9(a3);
      if ((v10 & 0x8000000000000000) == 0)
      {
LABEL_5:
        if (v10 | a2 & 0x100)
        {
          objc_msgSend(a1, "objectAtIndex:", 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          v12 = (*(uint64_t (**)(uint64_t, void *))(a3 + 16))(a3, v11);
          if (v12 < 0)
          {
            v13 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else
          {
            v13 = v12 | v29;
            if (v12 | v29)
            {

              goto LABEL_9;
            }
          }
          if ((a2 & 0x400) != 0)
            v7 = 0;
          else
            v7 = v13;
          v8 = v11;
LABEL_54:

          return v7;
        }
LABEL_46:
        if ((a2 & 0x400) != 0)
          v7 = v5;
        goto LABEL_54;
      }
    }
    else
    {
      v10 = -((uint64_t (*)(uint64_t, id))v9)(a3, v8);
      if ((v10 & 0x8000000000000000) == 0)
        goto LABEL_5;
    }
    v7 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_46;
  }
LABEL_9:
  v28 = a2;
  v14 = a2 & 0x300;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v18 = 2 << flsl(v5);
  do
  {
    if (v18 >= 0)
      v19 = v18;
    else
      v19 = v18 + 1;
    v7 = v15 + (v19 >> 1);
    if (v7 < v5)
    {
      objc_msgSend(a1, "objectAtIndex:", v15 + (v19 >> 1));
      v20 = (id)objc_claimAutoreleasedReturnValue();
      v21 = *(uint64_t (**)(uint64_t))(a3 + 16);
      if (v20 == v30)
        v16 = v21(a3);
      else
        v16 = -((uint64_t (*)(uint64_t, id))v21)(a3, v20);
      if (!(v16 | v14))
      {

        return v7;
      }
      if (v16)
        v22 = 1;
      else
        v22 = v29 == 0;
      v17 |= v16 == 0;
      v23 = !v22 || v16 <= -1;
      if (v23)
        v15 += v19 >> 1;

    }
    v23 = v18 <= 1;
    v18 = v19 >> 1;
  }
  while (!v23);
  LODWORD(v24) = v29 != 0;
  if (v16)
    LODWORD(v24) = 0;
  if (v16 < 0)
    v24 = 1;
  else
    v24 = v24;
  v25 = v15 + v24;
  v26 = v15 + ((unint64_t)v16 >> 63);
  if ((v17 & 1) == 0)
    v26 = 0x7FFFFFFFFFFFFFFFLL;
  if ((v28 & 0x400) != 0)
    return v25;
  else
    return v26;
}

double SASecondsFromMachTimeUsingTimebase(uint64_t a1, uint64_t a2)
{
  unint64_t v2;

  v2 = 0;
  if ((_DWORD)a2 && HIDWORD(a2))
  {
    if ((_DWORD)a2 != HIDWORD(a2))
      a1 = __udivti3();
    v2 = a1;
  }
  return (double)v2 / 1000000000.0;
}

id SAFormattedSignedBytes(unint64_t a1, int a2, int a3)
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v6 = objc_alloc(MEMORY[0x1E0CB3940]);
  if ((a1 & 0x8000000000000000) != 0)
  {
    SAFormattedBytesEx(-(uint64_t)a1, a2, a3, 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithFormat:", CFSTR("-%@"), v7);
  }
  else
  {
    SAFormattedBytesEx(a1, a2, a3, 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithFormat:", CFSTR("+%@"), v7);
  }
  v9 = (void *)v8;

  return v9;
}

void sub_1B9BF3CE8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t _saos_printf_indent_and_count(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  id v9;
  int v10;

  v9 = a1;
  v10 = _saos_printf_indent_and_kernel_dot(v9, a2, a5, 0);
  LODWORD(a4) = objc_msgSend(v9, "printWithFormat:", CFSTR("%-*lu  "), a3, a4);

  return (a4 + v10);
}

uint64_t SAMachTimeFromNanosecondsUsingTimebase(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = 0;
  if ((_DWORD)a2 && HIDWORD(a2))
  {
    if (HIDWORD(a2) == (_DWORD)a2)
      return a1;
    else
      return __udivti3();
  }
  return v2;
}

void sub_1B9BF5634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B9BF5CC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  objc_sync_exit(obj);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

void sub_1B9BF5FD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B9BF6458(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t SANanosecondsFromMachTimeUsingTimebase(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = 0;
  if ((_DWORD)a2 && HIDWORD(a2))
  {
    if ((_DWORD)a2 == HIDWORD(a2))
      return a1;
    else
      return __udivti3();
  }
  return v2;
}

void sub_1B9BF6AB8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9BF97C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a72;
  uint64_t v72;

  _Block_object_dispose((const void *)(v72 - 208), 8);
  _Block_object_dispose(&STACK[0x2C0], 8);
  _Block_object_dispose((const void *)(v72 - 176), 8);
  _Block_object_dispose(&STACK[0xD60], 8);
  _Block_object_dispose(&a72, 8);
  _Block_object_dispose(&STACK[0x218], 8);
  _Block_object_dispose(&STACK[0x238], 8);
  _Block_object_dispose(&STACK[0x258], 8);
  _Unwind_Resume(a1);
}

id uuidForBytes(uint64_t a1)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", a1);
}

void sub_1B9BF9AC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

uint64_t SAMicrostackshotStateForFlagsTaskAndThreadState(int a1, void *a2, void *a3)
{
  id v5;
  int v6;
  int v7;
  id v8;
  unsigned int v9;
  int v10;
  uint64_t v11;

  v5 = a3;
  if ((a1 & 0x40) != 0)
    v6 = 16;
  else
    v6 = 20;
  if ((a1 & 0x80u) != 0)
    v6 |= 8u;
  if ((a1 & 0x20) == 0)
    v6 = 0;
  v7 = v6 | ~(8 * a1) & 0x80;
  v8 = a2;
  if (objc_msgSend(v8, "isSuppressed"))
    v9 = v7 | 0x20;
  else
    v9 = v7;
  v10 = objc_msgSend(v8, "isForeground");

  if (v10)
    v11 = v9 | 2;
  else
    v11 = v9;
  switch(objc_msgSend(v5, "threadQos"))
  {
    case 0u:
      v11 = v11 | 0x500;
      break;
    case 1u:
      v11 = v11 | 0x100;
      break;
    case 2u:
      v11 = v11 | 0x200;
      break;
    case 3u:
      v11 = v11 | 0x300;
      break;
    case 4u:
      v11 = v11 | 0x400;
      break;
    case 5u:
      v11 = v11 | 0x600;
      break;
    case 6u:
      v11 = v11 | 0x700;
      break;
    default:
      break;
  }
  switch(objc_msgSend(v5, "threadRequestedQos"))
  {
    case 0u:
      v11 = v11 | 0x2800;
      break;
    case 1u:
      v11 = v11 | 0x800;
      break;
    case 2u:
      v11 = v11 | 0x1000;
      break;
    case 3u:
      v11 = v11 | 0x1800;
      break;
    case 4u:
      v11 = v11 | 0x2000;
      break;
    case 5u:
      v11 = v11 | 0x3000;
      break;
    case 6u:
      v11 = v11 | 0x3800;
      break;
    default:
      break;
  }
  switch(objc_msgSend(v5, "threadRequestedQosOverride"))
  {
    case 0u:
      v11 = v11 | 0x14000;
      break;
    case 1u:
      v11 = v11 | 0x4000;
      break;
    case 2u:
      v11 = v11 | 0x8000;
      break;
    case 3u:
      v11 = v11 | 0xC000;
      break;
    case 4u:
      v11 = v11 | 0x10000;
      break;
    case 5u:
      v11 = v11 | 0x18000;
      break;
    case 6u:
      v11 = v11 | 0x1C000;
      break;
    default:
      break;
  }

  return v11;
}

void sub_1B9BFA3C4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

const __CFString *_CopyStringForTime(int a1, long double a2)
{
  size_t v4;
  unint64_t v5;
  long double v6;
  size_t v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  int v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  time_t v37;
  tm v38;
  uint8_t buf[4];
  char *v40;
  char __str[4];
  char *v42;
  char v43[64];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  memset(&v38, 0, sizeof(v38));
  v37 = (uint64_t)(*MEMORY[0x1E0C9ADF8] + a2);
  localtime_r(&v37, &v38);
  v4 = strftime(v43, 0x40uLL, "%Y-%m-%d %T", &v38);
  if (!v4)
    return &stru_1E714A250;
  v5 = v4;
  if (v4 >= 0x40)
  {
    v13 = *__error();
    _sa_logt();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__str = 136315138;
      v42 = v43;
      _os_log_error_impl(&dword_1B9BE0000, v14, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)__str, 0xCu);
    }

    *__error() = v13;
    _SASetCrashLogMessage(88, "%s", v15, v16, v17, v18, v19, v20, (char)v43);
    _os_crash();
    __break(1u);
    goto LABEL_15;
  }
  if (a1 >= 1)
  {
    v6 = fmod(a2, 1.0);
    snprintf(__str, 0x10uLL, "%0.*f", a1, (double)v6);
    v5 += strlcpy(&v43[v5], &__str[1], 64 - v5);
    if (v5 >= 0x40)
      goto LABEL_18;
  }
  v7 = strftime(&v43[v5], 64 - v5, " %z", &v38);
  if (!v7)
    v43[v5] = 0;
  if (v7 + v5 >= 0x40)
  {
LABEL_15:
    v21 = *__error();
    _sa_logt();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__str = 136315138;
      v42 = v43;
      _os_log_error_impl(&dword_1B9BE0000, v22, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)__str, 0xCu);
    }

    *__error() = v21;
    _SASetCrashLogMessage(116, "%s", v23, v24, v25, v26, v27, v28, (char)v43);
    _os_crash();
    __break(1u);
LABEL_18:
    v29 = *__error();
    _sa_logt();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v40 = v43;
      _os_log_error_impl(&dword_1B9BE0000, v30, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
    }

    *__error() = v29;
    _SASetCrashLogMessage(100, "%s", v31, v32, v33, v34, v35, v36, (char)v43);
    _os_crash();
    __break(1u);
  }
  SANSStringForCString(v43);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = &stru_1E714A250;
  if (v8)
    v10 = (__CFString *)v8;
  v11 = v10;

  return v11;
}

BOOL _AvoidSuspendingPid(_BOOL8 result)
{
  uint64_t buffer;
  __int16 v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (!result)
  {
    proc_name(result, &buffer, 0x21u);
    return buffer == 0x64796669746F6ELL || buffer == 0x676F646863746177 && v3 == 100;
  }
  return result;
}

void sub_1B9BFAF4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
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

void sub_1B9BFB7A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SAGetStackshotDataFromTailspinStackshotChunk(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v5;
  _QWORD *v6;
  unint64_t v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (v1 && (unint64_t)objc_msgSend(v1, "length") >= 0x10)
  {
    v5 = objc_retainAutorelease(v2);
    v6 = (_QWORD *)objc_msgSend(v5, "bytes");
    v7 = *v6 + 16;
    if (v7 <= objc_msgSend(v5, "length"))
    {
      objc_msgSend(v5, "subdataWithRange:", 16, *v6);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = *__error();
      _sa_logt();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *v6;
        v11 = 134218496;
        v12 = v10;
        v13 = 2048;
        v14 = 16;
        v15 = 2048;
        v16 = objc_msgSend(v5, "length");
        _os_log_impl(&dword_1B9BE0000, v9, OS_LOG_TYPE_DEFAULT, "WARNING: Malformed tailspin stackshot chunk: stackshot data is %llu bytes (+ %lu header), but chunk is only %lu bytes", (uint8_t *)&v11, 0x20u);
      }

      v3 = 0;
      *__error() = v8;
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id _sa_logt()
{
  if (qword_1ED1DD548 != -1)
    dispatch_once(&qword_1ED1DD548, &__block_literal_global_0);
  return (id)qword_1ED1DD540;
}

void ___sa_logt_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.sampleanalysis", "logging");
  v1 = (void *)qword_1ED1DD540;
  qword_1ED1DD540 = (uint64_t)v0;

}

void *SANSDictionaryCopyStringForKey(void *a1, uint64_t a2)
{
  void *v2;
  uint64_t v4;

  objc_msgSend(a1, "objectForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    return v2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@"), v2);

  return (void *)v4;
}

double ReduceToSignificantDigits(int a1, unsigned int *a2, double a3)
{
  double v4;
  BOOL v5;
  double v7;
  unsigned int v8;
  double v9;

  v4 = a3;
  v5 = a3 < 0.0;
  if (a3 == 0.0)
  {
    if (a2)
      *a2 = 0;
  }
  else
  {
    v7 = -a3;
    if (!v5)
      v7 = v4;
    v8 = vcvtpd_s64_f64(log10(v7));
    if (a2)
      *a2 = v8;
    v9 = __exp10((double)(int)(a1 - v8));
    return (double)(uint64_t)round(v9 * v4) / v9;
  }
  return v4;
}

id uuidForString(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  uint8_t buf[4];
  id v14;
  uuid_t uu;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  memset(uu, 0, sizeof(uu));
  v1 = objc_retainAutorelease(a1);
  if (!uuid_parse((const char *)objc_msgSend(v1, "UTF8String"), uu))
    goto LABEL_6;
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v1, "substringWithRange:", 0, 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "substringWithRange:", 8, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "substringWithRange:", 12, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "substringWithRange:", 16, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "substringWithRange:", 20, 12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("%@-%@-%@-%@-%@"), v3, v4, v5, v6, v7);

  v1 = objc_retainAutorelease(v8);
  if (uuid_parse((const char *)objc_msgSend(v1, "UTF8String"), uu))
  {
    v9 = *__error();
    _sa_logt();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v1;
      _os_log_error_impl(&dword_1B9BE0000, v10, OS_LOG_TYPE_ERROR, "Unable to parse uuid %@", buf, 0xCu);
    }

    v11 = 0;
    *__error() = v9;
  }
  else
  {
LABEL_6:
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", uu);
  }

  return v11;
}

uint64_t is_apple_internal_setting()
{
  if (qword_1ED1DD550 != -1)
    dispatch_once(&qword_1ED1DD550, &__block_literal_global_9);
  return _MergedGlobals_2;
}

uint64_t __is_apple_internal_setting_block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  _MergedGlobals_2 = result;
  return result;
}

uint64_t _SASetCrashLogMessage(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t result;

  result = snprintf(_SASetCrashLogMessage_crash_string, 0x400uLL, "%d ", a1);
  if ((result - 1) <= 0x3FE)
    result = vsnprintf(&_SASetCrashLogMessage_crash_string[result], 1024 - result, a2, &a9);
  qword_1EF23F2A8 = (uint64_t)_SASetCrashLogMessage_crash_string;
  return result;
}

void sub_1B9C01C30(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9C03050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B9C031B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B9C03990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B9C03C24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
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

void sub_1B9C0D874(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void KCLogIter(unsigned int *a1, unint64_t a2, int a3)
{
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  BOOL v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v15;
  unsigned int v16;
  int v17;
  int v18;
  NSObject *v19;
  int *v20;
  uint64_t v21;
  int v22;
  const char *v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  FILE *v31;
  int v32;
  const char *v33;
  const char *v34;
  unint64_t v35;
  uint64_t v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;
  unsigned int v40;
  int v41;
  FILE *v42;
  int v43;
  const char *v44;
  const char *v45;
  unsigned int v46;
  uint64_t v47;
  uint8_t buf[16];

  if (qword_1ED1DD5B8 != -1)
    dispatch_once(&qword_1ED1DD5B8, &__block_literal_global_1446);
  if (byte_1ED1DD559 == 1)
  {
    if ((*a1 & 0xFFFFFFF0) == 0x20)
      v6 = 17;
    else
      v6 = *a1;
    if ((v6 - 1) <= 5)
    {
      v7 = (const char *)(a1 + 4);
      v8 = (uint64_t)(a1 + 12);
      v9 = a1[1];
      v10 = a1[2] & 0xF;
      v11 = v9 >= v10;
      v12 = v9 - v10;
      if (!v11)
        v12 = 0;
      v13 = v12 - 32;
LABEL_31:
      if ((_DWORD)v6 != 17)
      {
        if ((_DWORD)v6 != 19)
        {
          if ((_DWORD)v6 == 20)
          {
            v17 = dword_1ED1DD55C - 2;
            if (dword_1ED1DD55C < 2)
            {
              v18 = *__error();
              _sa_logt();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl(&dword_1B9BE0000, v19, OS_LOG_TYPE_ERROR, "Invalid kcdata: end container at indent 0", buf, 2u);
              }

              v20 = __error();
              v17 = 0;
              *v20 = v18;
            }
            dword_1ED1DD55C = v17;
            v21 = *((_QWORD *)a1 + 1);
            v22 = *__error();
            v23 = " -- skipping";
            if (!a3)
              v23 = "";
            fprintf((FILE *)*MEMORY[0x1E0C80C20], "%*s%s: id %llu%s\n", dword_1ED1DD55C, "", v7, v21, v23);
            *__error() = v22;
          }
          else
          {
            KCLogItem(v6, v13, v8, v7, dword_1ED1DD55C, a3);
          }
          return;
        }
        if ((unint64_t)(a1 + 4) <= a2)
        {
          v27 = a1[1];
          if ((unint64_t)a1 + v27 + 16 <= a2 && v27 >= 4 && *a1 == 19)
          {
            v28 = *((_QWORD *)a1 + 1);
            v29 = a1[4];
            v30 = *__error();
            v31 = (FILE *)*MEMORY[0x1E0C80C20];
            v32 = dword_1ED1DD55C;
            v33 = DescriptionForKCDataType(v29);
            v34 = " -- skipping";
            if (!a3)
              v34 = "";
            fprintf(v31, "%*s%s: id %llu, type %s%s\n", v32, "", v7, v28, v33, v34);
            *__error() = v30;
            dword_1ED1DD55C += 2;
            return;
          }
        }
        v26 = *__error();
        fprintf((FILE *)*MEMORY[0x1E0C80C20], "%*s%s: (invalid container)%s\n");
LABEL_49:
        *__error() = v26;
        return;
      }
      if ((unint64_t)(a1 + 4) > a2
        || (v24 = a1[1], (unint64_t)a1 + v24 + 16 > a2)
        || (v25 = *a1, *a1 != 17) && (v25 & 0xFFFFFFF0) != 0x20)
      {
LABEL_45:
        v26 = *__error();
        fprintf((FILE *)*MEMORY[0x1E0C80C20], "%*s%s: (invalid array)%s\n");
        goto LABEL_49;
      }
      v35 = *((_QWORD *)a1 + 1);
      if ((_DWORD)v35)
      {
        if (v25 != 17)
        {
          v39 = *a1 & 0xF;
          v11 = v24 >= v39;
          v40 = v24 - v39;
          if (!v11)
            goto LABEL_45;
          if (v40 < v35)
            goto LABEL_45;
          v38 = v40 / v35;
          if (v40 % v35)
            goto LABEL_45;
          v36 = HIDWORD(v35);
          goto LABEL_95;
        }
        v36 = HIDWORD(v35);
        if (SHIDWORD(v35) <= 2310)
        {
          switch(HIDWORD(v35))
          {
            case 0x30:
              v37 = 20;
              break;
            case 0x31:
              v37 = 24;
              break;
            case 0x81A:
LABEL_75:
              v37 = 8;
              break;
            default:
              goto LABEL_45;
          }
        }
        else
        {
          switch(HIDWORD(v35))
          {
            case 0x907:
              v37 = 4;
              break;
            case 0x908:
            case 0x909:
              goto LABEL_45;
            case 0x90A:
            case 0x90C:
              goto LABEL_75;
            case 0x90B:
            case 0x90D:
              v37 = 16;
              break;
            default:
              if (HIDWORD(v35) != 2369)
                goto LABEL_45;
              v37 = 48;
              break;
          }
        }
        if (v24 / v37 < v35 || v24 % v35 >= 0x10)
          goto LABEL_45;
      }
      else
      {
        if ((_DWORD)v24)
          goto LABEL_45;
        v36 = HIDWORD(v35);
        if (v25 != 17)
          goto LABEL_66;
      }
      if ((int)v36 > 2310)
      {
        switch((int)v36)
        {
          case 2311:
            v38 = 4;
            break;
          case 2312:
          case 2313:
            goto LABEL_66;
          case 2314:
          case 2316:
            goto LABEL_89;
          case 2315:
          case 2317:
            v38 = 16;
            break;
          default:
            if ((_DWORD)v36 != 2369)
              goto LABEL_66;
            v38 = 48;
            break;
        }
        goto LABEL_95;
      }
      switch((_DWORD)v36)
      {
        case 0x30:
          v38 = 20;
          goto LABEL_95;
        case 0x31:
          v38 = 24;
          goto LABEL_95;
        case 0x81A:
LABEL_89:
          v38 = 8;
          goto LABEL_95;
      }
LABEL_66:
      v38 = 0;
LABEL_95:
      v41 = *__error();
      v42 = (FILE *)*MEMORY[0x1E0C80C20];
      v43 = dword_1ED1DD55C;
      v44 = DescriptionForKCDataType(v36);
      v45 = " -- skipping";
      if (!a3)
        v45 = "";
      fprintf(v42, "%*s%s: of type %s, count %u size %u%s\n", v43, "", v7, v44, v35, v38, v45);
      *__error() = v41;
      if ((_DWORD)v35)
      {
        v46 = 0;
        v47 = v35;
        do
        {
          KCLogItem(v36, v38, v8 + v46, 0, (dword_1ED1DD55C + 2), a3);
          v46 += v38;
          --v47;
        }
        while (v47);
      }
      return;
    }
    if ((int)v6 > 2309)
    {
      if ((_DWORD)v6 == 2310)
      {
        v15 = a1[1];
        if (v15 != 112)
          goto LABEL_27;
        if ((a1[2] & 0x8F) != 0)
        {
          v15 = 112;
          goto LABEL_27;
        }
        v13 = 104;
      }
      else
      {
        if ((_DWORD)v6 != 2312)
        {
LABEL_26:
          v15 = a1[1];
LABEL_27:
          v11 = v15 >= (a1[2] & 0xF);
          v16 = v15 - (a1[2] & 0xF);
          if (v11)
            v13 = v16;
          else
            v13 = 0;
          goto LABEL_30;
        }
        v15 = a1[1];
        if (v15 != 32)
          goto LABEL_27;
        if ((a1[2] & 0x8F) != 0)
        {
          v15 = 32;
          goto LABEL_27;
        }
        v13 = 24;
      }
    }
    else
    {
      if ((_DWORD)v6 != 17 && (_DWORD)v6 != 19)
        goto LABEL_26;
      v13 = a1[1];
    }
LABEL_30:
    v8 = (uint64_t)(a1 + 4);
    v7 = DescriptionForKCDataType(v6);
    goto LABEL_31;
  }
}

uint64_t SkipToContainerEnd(int **a1, int a2)
{
  int v2;
  int *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  int v7;
  BOOL v8;
  id v11;
  void *v12;
  NSObject *v13;
  unint64_t v14;
  char *v15;
  unsigned int *v16;
  unint64_t v17;
  int *v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  char v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = (unint64_t)a1[1];
  v5 = (unint64_t)(*a1 + 4);
  if (v5 > v4
    || (v6 = v3[1], v5 + v6 > v4)
    || ((v7 = *v3, v6 >= 4) ? (v8 = v7 == 19) : (v8 = 0), !v8 || (v7 & 0xFFFFFFF0) == 0x20))
  {
    v25 = *__error();
    _sa_logt();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B9BE0000, v13, OS_LOG_TYPE_ERROR, "invalid skipped container", buf, 2u);
    }

    *__error() = v25;
    _SASetCrashLogMessage(6538, "invalid skipped container", v28, v29, v30, v31, v32, v33, v36);
    _os_crash();
    __break(1u);
LABEL_28:
    -[NSObject firstObject](v13, "firstObject");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "unsignedLongLongValue");
    *(_DWORD *)buf = 134217984;
    v38 = v35;
    _os_log_fault_impl(&dword_1B9BE0000, (os_log_t)v25, OS_LOG_TYPE_FAULT, "Didn't find endof skipped container %llu", buf, 0xCu);

    goto LABEL_22;
  }
  v11 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)*a1 + 1));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "initWithObjects:", v12, 0);

  v14 = (unint64_t)a1[1];
  v15 = (char *)*a1 + (*a1)[1];
  v16 = (unsigned int *)(v15 + 16);
  *a1 = (int *)(v15 + 16);
  v17 = (unint64_t)(v15 + 32);
  if (v17 <= v14)
  {
    while (v17 + v16[1] <= v14 && *v16 != -242132755)
    {
      KCLogIter(v16, v14, a2);
      v18 = *a1;
      v19 = **a1;
      if ((v19 & 0xFFFFFFF0) == 0x20)
        v19 = 17;
      if (v19 == 20)
      {
        v21 = *((_QWORD *)v18 + 1);
        -[NSObject lastObject](v13, "lastObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "unsignedLongLongValue");

        if (v23 != v21)
        {
          v2 = *__error();
          _sa_logt();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134218240;
            v38 = v21;
            v39 = 2048;
            v40 = v23;
            _os_log_fault_impl(&dword_1B9BE0000, (os_log_t)v25, OS_LOG_TYPE_FAULT, "Unexpected end container %llu (expected %llu)", buf, 0x16u);
          }
          v26 = 1;
          goto LABEL_23;
        }
        if (-[NSObject count](v13, "count") == 1)
        {
          v26 = 0;
          goto LABEL_24;
        }
        -[NSObject removeLastObject](v13, "removeLastObject");
      }
      else if (v19 == 19)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)v18 + 1));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject addObject:](v13, "addObject:", v20);

      }
      v14 = (unint64_t)a1[1];
      v24 = (char *)*a1 + (*a1)[1];
      v16 = (unsigned int *)(v24 + 16);
      *a1 = (int *)(v24 + 16);
      v17 = (unint64_t)(v24 + 32);
      if (v17 > v14)
        break;
    }
  }
  v2 = *__error();
  _sa_logt();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_FAULT))
    goto LABEL_28;
LABEL_22:
  v26 = 2;
LABEL_23:

  *__error() = v2;
LABEL_24:

  return v26;
}

void sub_1B9C146F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B9C1705C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B9C19948(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getPreferredLanguages()
{
  void *v0;
  id v1;
  uint64_t v2;
  char v3;
  void *v4;
  char isKindOfClass;
  char v6;
  int v7;
  NSObject *v8;
  uint8_t v10[16];

  v0 = (void *)CFPreferencesCopyValue(CFSTR("AppleLanguages"), (CFStringRef)*MEMORY[0x1E0C9B228], CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
  if (!v0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_11:

    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    return v1;
  }
  v1 = v0;
  if (objc_msgSend(v1, "count"))
  {
    v2 = 0;
    v3 = 1;
    while (1)
    {
      objc_msgSend(v1, "objectAtIndexedSubscript:", v2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
        break;
      v6 = (v2 + 1 >= (unint64_t)objc_msgSend(v1, "count")) | ~v3;
      v2 = 1;
      v3 = 0;
      if ((v6 & 1) != 0)
        goto LABEL_7;
    }
    v7 = *__error();
    _sa_logt();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_fault_impl(&dword_1B9BE0000, v8, OS_LOG_TYPE_FAULT, "Found the preferred languages array but contents are not NSString", v10, 2u);
    }

    *__error() = v7;
    goto LABEL_11;
  }
LABEL_7:

  return v1;
}

void sub_1B9C1DE08(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x3D0], 8);
  _Unwind_Resume(a1);
}

void sub_1B9C219F4(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *context, uint64_t a17, uint64_t a18, _QWORD *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  id v25;
  void *v26;
  void *v27;
  FILE *v28;
  const char *v29;
  FILE *v30;

  if (a2 == 1)
  {
    v25 = objc_begin_catch(a1);
    if (a20 != 36)
    {
      v26 = v25;
      if (*(_QWORD *)(a25 + 480) && (v27 = *(void **)(a25 + 456)) != 0)
      {
        v28 = (FILE *)*MEMORY[0x1E0C80C10];
        objc_msgSend(v27, "UTF8String");
        objc_msgSend(*(id *)(a25 + 480), "UTF8String");
        if (a20 < 37)
          v29 = "Unable to decode binary format: Binary version %lu is no longer supported. Try %s build %s\n";
        else
          v29 = "Unable to decode binary format: Binary version %lu is newer than decoder version %lu. Try %s build %s or later\n";
        fprintf(v28, v29);
      }
      else
      {
        v30 = (FILE *)*MEMORY[0x1E0C80C10];
        if (a20 < 37)
          fprintf(v30, "Unable to decode binary format: Binary format version %lu is no longer supported. Try an older build\n");
        else
          fprintf(v30, "Unable to decode binary format: Binary version %lu is newer than decoder version %lu. Try a newer build\n");
      }
      *a19 = 0;
      *(_BYTE *)gSASerializationEncodedDataIsEmbedded() = 0;

      objc_end_catch();
      JUMPOUT(0x1B9C2093CLL);
    }
    objc_exception_rethrow();
  }
  _Unwind_Resume(a1);
}

void sub_1B9C21FDC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 88), 8);
  _Unwind_Resume(a1);
}

Class __getTRIAllocationStatusClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!qword_1ED1DD5C8)
  {
    qword_1ED1DD5C8 = _sl_dlopen();
    if (!qword_1ED1DD5C8)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("TRIAllocationStatus");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)abort_report_np();
    free(v3);
  }
  qword_1ED1DD5D0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __getDUSessionClass_block_invoke(uint64_t a1)
{
  DarwinupLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("DUSession");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_1ED1DD5E0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    DarwinupLibrary();
  }
}

void DarwinupLibrary()
{
  void *v0;

  if (!qword_1ED1DD5D8)
  {
    qword_1ED1DD5D8 = _sl_dlopen();
    if (!qword_1ED1DD5D8)
    {
      v0 = (void *)abort_report_np();
      free(v0);
    }
  }
}

Class __getDURootClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  DarwinupLibrary();
  result = objc_getClass("DURoot");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_1ED1DD5E8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = abort_report_np();
    return (Class)__getAutomatedDeviceGroup_block_invoke(v3);
  }
  return result;
}

void __getAutomatedDeviceGroup_block_invoke()
{
  dispatch_block_t v0;
  qos_class_t v1;
  NSObject *v2;
  dispatch_time_t v3;
  int v4;
  NSObject *v5;
  uint8_t v6[16];

  v0 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, &__block_literal_global_1484);
  v1 = qos_class_self();
  dispatch_get_global_queue(v1, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, v0);

  v3 = dispatch_time(0, 2000000000);
  if (dispatch_block_wait(v0, v3))
  {
    v4 = *__error();
    _sa_logt();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1B9BE0000, v5, OS_LOG_TYPE_DEFAULT, "WARNING: Timed out waiting for automated device group", v6, 2u);
    }

    *__error() = v4;
  }

}

void __getAutomatedDeviceGroup_block_invoke_2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  id obj;

  objc_msgSend(MEMORY[0x1E0D64EE0], "automatedDeviceGroup");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
  {
    obj = v0;
    v2 = objc_msgSend(v0, "length");
    v1 = obj;
    if (v2)
    {
      objc_storeStrong((id *)&qword_1ED1DD5F0, obj);
      v1 = obj;
    }
  }

}

void *__getSAModelGatherInfoSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (qword_1ED1DD600)
  {
    v2 = (void *)qword_1ED1DD600;
  }
  else
  {
    qword_1ED1DD600 = _sl_dlopen();
    v2 = (void *)qword_1ED1DD600;
    if (!qword_1ED1DD600)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "SAModelGatherInfo");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  off_1ED1DD608 = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

const char *DescriptionForKCDataType(uint64_t a1)
{
  const char *v1;
  id v2;
  uint64_t v3;

  if ((int)a1 <= 2304)
  {
    if ((int)a1 <= 18)
    {
      switch((_DWORD)a1)
      {
        case 0xDE17A59A:
          return "Begin delta stackshot";
        case 0xF19158ED:
          return "buffer end";
        case 0x11:
          return "Array";
        default:
LABEL_18:
          v2 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("UNKNOWN TYPE (0x%x)"), a1));
          v3 = objc_msgSend(v2, "UTF8String");
          if (v3)
            v1 = (const char *)v3;
          else
            v1 = "UNKNOWN TYPE";

          break;
      }
    }
    else
    {
      switch((int)a1)
      {
        case '0':
          return "load info 32-bit";
        case '1':
          return "load info 64-bit";
        case '2':
          return "mach timebase";
        case '3':
          return "machabstime";
        case '4':
          return "time val";
        case '5':
          return "usecs since epoch";
        case '6':
        case '7':
        case '8':
          goto LABEL_18;
        case '9':
          return "aot info";
        default:
          if ((_DWORD)a1 == 19)
          {
            v1 = "Container begin";
          }
          else
          {
            if ((_DWORD)a1 != 20)
              goto LABEL_18;
            v1 = "Container end";
          }
          break;
      }
    }
  }
  else
  {
    switch((int)a1)
    {
      case 2305:
        v1 = "iostats";
        break;
      case 2306:
        v1 = "memstats";
        break;
      case 2307:
        v1 = "task container";
        break;
      case 2308:
        v1 = "thread container";
        break;
      case 2309:
        v1 = "task snapshot";
        break;
      case 2310:
        v1 = "thread snapshot";
        break;
      case 2311:
        v1 = "donating pids";
        break;
      case 2312:
        v1 = "shared cache load info";
        break;
      case 2313:
        v1 = "thread name";
        break;
      case 2314:
        v1 = "stack kernel 32-bit";
        break;
      case 2315:
        v1 = "stack kernel 64-bit";
        break;
      case 2316:
        v1 = "stack user 32-bit";
        break;
      case 2317:
        v1 = "stack user 64-bit";
        break;
      case 2318:
        v1 = "boot args";
        break;
      case 2319:
        v1 = "os version";
        break;
      case 2320:
        v1 = "kernel page size";
        break;
      case 2321:
        v1 = "jetsam level";
        break;
      case 2322:
        v1 = "delta timestamp used";
        break;
      case 2323:
        v1 = "stack kernel lr 32-bit";
        break;
      case 2324:
        v1 = "stack kernel lr 64-bit";
        break;
      case 2325:
        v1 = "stack user lr 32-bit";
        break;
      case 2326:
        v1 = "stack user lr 64-bit";
        break;
      case 2327:
        v1 = "nonrunnable thread";
        break;
      case 2328:
        v1 = "nonrunnable task";
        break;
      case 2329:
        v1 = "cpu times";
        break;
      case 2330:
        v1 = "stackshot duration";
        break;
      case 2331:
      case 2334:
      case 2335:
      case 2340:
      case 2341:
      case 2342:
      case 2343:
      case 2359:
      case 2360:
      case 2361:
      case 2362:
      case 2363:
      case 2364:
      case 2365:
      case 2366:
      case 2367:
        goto LABEL_18;
      case 2332:
        v1 = "kernelcache_loadinfo";
        break;
      case 2333:
        v1 = "thread waitinfo";
        break;
      case 2336:
        v1 = "jetsam coalition snapshot";
        break;
      case 2337:
        v1 = "jetsam coalition";
        break;
      case 2338:
        v1 = "thread policy version";
        break;
      case 2339:
        v1 = "instruction cycles";
        break;
      case 2344:
        v1 = "dispatch queue label";
        break;
      case 2345:
        v1 = "thread turnstileinfo";
        break;
      case 2346:
        v1 = "architecture";
        break;
      case 2347:
        v1 = "latency info";
        break;
      case 2348:
        v1 = "latency info task";
        break;
      case 2349:
        v1 = "latency info thread";
        break;
      case 2350:
        v1 = "text exec load info";
        break;
      case 2351:
        v1 = "aot shared cache load info";
        break;
      case 2352:
        v1 = "task transitioning snapshot";
        break;
      case 2353:
        v1 = "task transitioning container";
        break;
      case 2354:
        v1 = "swift async start index";
        break;
      case 2355:
        v1 = "swift async stack";
        break;
      case 2356:
        v1 = "port label container";
        break;
      case 2357:
        v1 = "port label";
        break;
      case 2358:
        v1 = "port label name";
        break;
      case 2368:
        v1 = "task delta snapshot";
        break;
      case 2369:
        v1 = "thread delta snapshot";
        break;
      case 2370:
        v1 = "shared cache container";
        break;
      case 2371:
        v1 = "shared cache info";
        break;
      case 2372:
        v1 = "aot shared cache info";
        break;
      case 2373:
        v1 = "shared cache id";
        break;
      case 2374:
        v1 = "codesigning info";
        break;
      case 2375:
        v1 = "os build version";
        break;
      case 2376:
        v1 = "exclaves thread info";
        break;
      case 2377:
        v1 = "exclave container";
        break;
      case 2378:
        v1 = "exclaves scresult container";
        break;
      case 2379:
        v1 = "exclaves scresult info";
        break;
      case 2380:
        v1 = "exclaves ipc stack entry container";
        break;
      case 2381:
        v1 = "exclaves ipc stack entry info";
        break;
      case 2382:
        v1 = "exclaves ipc stack entry info ecstack";
        break;
      case 2383:
        v1 = "exclave address space container";
        break;
      case 2384:
        v1 = "exclave address space info";
        break;
      case 2385:
        v1 = "exclave address space name";
        break;
      case 2386:
        v1 = "exclaves text layout container";
        break;
      case 2387:
        v1 = "exclaves text layout info";
        break;
      case 2388:
        v1 = "exclaves text layout segments";
        break;
      default:
        if ((_DWORD)a1 != 1503811591)
          goto LABEL_18;
        v1 = "Begin stackshot";
        break;
    }
  }
  return v1;
}

int *KCLogItem(uint64_t a1, unsigned int a2, uint64_t a3, const char *a4, uint64_t a5, int a6)
{
  const char *v8;
  int v11;
  int v12;
  int v13;
  FILE *v14;
  int v15;
  FILE *v16;
  const unsigned __int8 *v17;
  unsigned int v18;
  unsigned int v19;
  BOOL v20;
  int v21;
  int v22;
  int v23;
  int v24;
  const char *v25;
  int *result;
  FILE *v27;
  unsigned int v28;
  unsigned int v29;
  int v30;
  const char *v31;
  int v32;
  const char *v33;
  unsigned int v34;
  unsigned int v35;
  int v36;
  int v37;
  unsigned int v38;
  unsigned int v39;
  int v40;
  int v41;
  FILE *v42;
  unsigned int v43;
  unsigned int v44;
  int v45;
  int v46;
  int v47;
  FILE *v48;
  const unsigned __int8 *v49;
  unsigned int v50;
  unsigned int v51;
  int v52;
  int v53;
  int v54;
  FILE *v55;
  FILE *v56;
  FILE *v57;
  unsigned int v58;
  FILE *v59;
  unsigned int v60;
  unsigned int v61;
  int v62;
  int v63;
  const unsigned __int8 *v64;
  unsigned int v65;
  unsigned int v66;
  FILE *v67;
  char *v68;
  unsigned int v69;
  unsigned int v70;
  int v71;
  int v72;
  int v73;
  char *v74;
  const char *v75;
  const char *v76;
  unsigned int v77;
  unsigned int v78;
  int v79;
  int v80;
  unsigned int v81;
  int v82;
  int v83;
  unsigned int v84;
  int v85;
  int v86;
  int v87;
  unsigned int v88;
  unsigned int v89;
  int v90;
  int v91;
  int v92;
  char *v93;
  const char *v94;
  const char *v95;
  char *v96;
  char *v97;
  const char *v98;
  const char *v99;
  uint64_t v100;
  const char *v101;
  FILE *v102;
  int v103;
  time_t v104;
  tm v105;
  char v106[32];
  uint64_t v107;

  v8 = a4;
  v11 = a1;
  v107 = *MEMORY[0x1E0C80C00];
  if (!a4)
    v8 = DescriptionForKCDataType(a1);
  switch(v11)
  {
    case 2309:
      v13 = *__error();
      fprintf((FILE *)*MEMORY[0x1E0C80C20], "%*s%s: %s [%d]%s\n");
      goto LABEL_107;
    case 2310:
      v30 = *__error();
      fprintf((FILE *)*MEMORY[0x1E0C80C20], "%*s%s: thread_v%d 0x%llx dispatch queue %lld%s\n", a5);
      goto LABEL_119;
    case 2311:
LABEL_19:
      v13 = *__error();
      fprintf((FILE *)*MEMORY[0x1E0C80C20], "%*s%s: %d%s\n");
      goto LABEL_107;
    case 2312:
      if (a2 < 0x28)
        goto LABEL_50;
      if (qword_1ED1DD5C0 != -1)
        dispatch_once(&qword_1ED1DD5C0, &__block_literal_global_1450);
      if ((byte_1ED1DD55A & 1) != 0)
      {
LABEL_50:
        v15 = *__error();
        v42 = (FILE *)*MEMORY[0x1E0C80C20];
        do
        {
          v43 = __ldxr(&uuid_string_index);
          v44 = v43 + 1;
        }
        while (__stxr(v44, &uuid_string_index));
        v20 = (-v44 & 0x80000000) != 0;
        v45 = -v44 & 3;
        v46 = v44 & 3;
        if (v20)
          v47 = v46;
        else
          v47 = -v45;
        uuid_unparse((const unsigned __int8 *)(a3 + 8), &uuid_string_string[37 * v47]);
        fprintf(v42, "%*s%s: %s slide 0x%llx%s\n");
      }
      else
      {
        v15 = *__error();
        v67 = (FILE *)*MEMORY[0x1E0C80C20];
        do
        {
          v88 = __ldxr(&uuid_string_index);
          v89 = v88 + 1;
        }
        while (__stxr(v89, &uuid_string_index));
        v20 = (-v89 & 0x80000000) != 0;
        v90 = -v89 & 3;
        v91 = v89 & 3;
        if (v20)
          v92 = v91;
        else
          v92 = -v90;
        v93 = &uuid_string_string[37 * v92];
        uuid_unparse((const unsigned __int8 *)(a3 + 8), v93);
        v94 = " -- skipping";
        if (!a6)
          v94 = "";
        v98 = *(const char **)a3;
        v99 = v94;
        v96 = v93;
        v97 = *(char **)(a3 + 32);
        v95 = v8;
        v76 = "%*s%s: %s slid base address 0x%llx, slide 0x%llx%s\n";
LABEL_91:
        fprintf(v67, v76, a5, "", v95, v96, v97, v98, v99, v100, v101);
      }
      goto LABEL_115;
    case 2313:
    case 2318:
    case 2319:
    case 2344:
    case 2358:
    case 2375:
    case 2385:
LABEL_4:
      v12 = *(unsigned __int8 *)(a3 + a2 - 1);
      v13 = *__error();
      v14 = (FILE *)*MEMORY[0x1E0C80C20];
      if (v12)
        fprintf(v14, "%*s%s: (invalid string)%s\n");
      else
        fprintf(v14, "%*s%s: %s%s\n");
      goto LABEL_107;
    case 2314:
    case 2316:
    case 2323:
    case 2325:
      v13 = *__error();
      fprintf((FILE *)*MEMORY[0x1E0C80C20], "%*s%s: 0x%x%s\n");
      goto LABEL_107;
    case 2315:
    case 2317:
    case 2324:
    case 2326:
    case 2327:
    case 2382:
      v13 = *__error();
      fprintf((FILE *)*MEMORY[0x1E0C80C20], "%*s%s: 0x%llx%s\n");
      goto LABEL_107;
    case 2320:
    case 2321:
    case 2338:
    case 2354:
    case 2373:
LABEL_14:
      v13 = *__error();
      fprintf((FILE *)*MEMORY[0x1E0C80C20], "%*s%s: %u%s\n");
      goto LABEL_107;
    case 2322:
    case 2337:
LABEL_15:
      v13 = *__error();
      fprintf((FILE *)*MEMORY[0x1E0C80C20], "%*s%s: %llu%s\n");
      goto LABEL_107;
    case 2328:
    case 2329:
    case 2330:
    case 2331:
    case 2334:
    case 2335:
    case 2340:
    case 2341:
    case 2342:
    case 2343:
    case 2347:
    case 2348:
    case 2349:
    case 2353:
    case 2355:
    case 2356:
    case 2359:
    case 2360:
    case 2361:
    case 2362:
    case 2363:
    case 2364:
    case 2365:
    case 2366:
    case 2367:
    case 2370:
    case 2377:
    case 2378:
    case 2380:
    case 2383:
    case 2386:
LABEL_20:
      v24 = *__error();
      v25 = " -- skipping";
      if (!a6)
        v25 = "";
      fprintf((FILE *)*MEMORY[0x1E0C80C20], "%*s%s: %s\n", a5, "", v8, v25);
      result = __error();
      *result = v24;
      return result;
    case 2332:
      v15 = *__error();
      v48 = (FILE *)*MEMORY[0x1E0C80C20];
      v49 = (const unsigned __int8 *)(a3 + 8);
      do
      {
        v50 = __ldxr(&uuid_string_index);
        v51 = v50 + 1;
      }
      while (__stxr(v51, &uuid_string_index));
      v20 = (-v51 & 0x80000000) != 0;
      v52 = -v51 & 3;
      v53 = v51 & 3;
      if (v20)
        v54 = v53;
      else
        v54 = -v52;
      uuid_unparse(v49, &uuid_string_string[37 * v54]);
      fprintf(v48, "%*s%s: 0x%llx %s%s\n");
      goto LABEL_115;
    case 2333:
      v30 = *__error();
      v55 = (FILE *)*MEMORY[0x1E0C80C20];
      if (a2 < 0x1F)
        fprintf(v55, "%*s%s: type:0x%x owner:0x%llx waiter:0x%llx context:0x%llx%s\n", a5, "");
      else
        fprintf(v55, "%*s%s: type:0x%x owner:0x%llx waiter:0x%llx context:0x%llx portlabel_id:%d flags:0x%x%s\n", a5, "", v8);
      goto LABEL_119;
    case 2336:
      v13 = *__error();
      fprintf((FILE *)*MEMORY[0x1E0C80C20], "%*s%s: id %llu, flags 0x%llx, thread_group %llu, leader uniquepid %llu%s\n", a5, "");
      goto LABEL_107;
    case 2339:
      v13 = *__error();
      fprintf((FILE *)*MEMORY[0x1E0C80C20], "%*s%s: %llu instructions, %llu cycles%s\n");
      goto LABEL_107;
    case 2345:
      v30 = *__error();
      v56 = (FILE *)*MEMORY[0x1E0C80C20];
      if (a2 < 0x1C)
        fprintf(v56, "%*s%s: flags:0x%llx waiter:0x%llx context:0x%llx priority:%d hops:%d%s\n", a5, "");
      else
        fprintf(v56, "%*s%s: flags:0x%llx waiter:0x%llx context:0x%llx priority:%d hops:%d portlabel_id:%d%s\n", a5, "", v8);
      goto LABEL_119;
    case 2346:
      v30 = *__error();
      v57 = (FILE *)*MEMORY[0x1E0C80C20];
      CSArchitectureGetFamilyName();
      fprintf(v57, "%*s%s: %s (0x%x, 0x%x)%s\n", a5);
      goto LABEL_119;
    case 2350:
      v15 = *__error();
      v27 = (FILE *)*MEMORY[0x1E0C80C20];
      a3 += 8;
      do
      {
        v58 = __ldxr(&uuid_string_index);
        v29 = v58 + 1;
      }
      while (__stxr(v29, &uuid_string_index));
      goto LABEL_111;
    case 2351:
      v103 = *__error();
      v59 = (FILE *)*MEMORY[0x1E0C80C20];
      do
      {
        v60 = __ldxr(&uuid_string_index);
        v61 = v60 + 1;
      }
      while (__stxr(v61, &uuid_string_index));
      v20 = (-v61 & 0x80000000) != 0;
      v62 = -v61 & 3;
      v63 = v61 & 3;
      if (!v20)
        v63 = -v62;
      uuid_unparse((const unsigned __int8 *)(a3 + 32), &uuid_string_string[37 * v63]);
      v64 = (const unsigned __int8 *)(a3 + 8);
      do
      {
        v65 = __ldxr(&uuid_string_index);
        v66 = v65 + 1;
      }
      while (__stxr(v66, &uuid_string_index));
      goto LABEL_98;
    case 2352:
      v13 = *__error();
      fprintf((FILE *)*MEMORY[0x1E0C80C20], "%*s%s: %s [%d] (transitioning 0x%llx)%s\n", a5);
      goto LABEL_107;
    case 2357:
      v13 = *__error();
      fprintf((FILE *)*MEMORY[0x1E0C80C20], "%*s%s: id:%d flags:0x%x domain:%d%s\n", a5);
      goto LABEL_107;
    case 2368:
      v13 = *__error();
      fprintf((FILE *)*MEMORY[0x1E0C80C20], "%*s%s: [%llu]%s\n");
      goto LABEL_107;
    case 2369:
      v30 = *__error();
      fprintf((FILE *)*MEMORY[0x1E0C80C20], "%*s%s: thread_delta_v%d 0x%llx%s\n");
LABEL_119:
      result = __error();
      *result = v30;
      return result;
    case 2371:
      v15 = *__error();
      v67 = (FILE *)*MEMORY[0x1E0C80C20];
      v68 = (char *)*(unsigned int *)(a3 + 40);
      do
      {
        v69 = __ldxr(&uuid_string_index);
        v70 = v69 + 1;
      }
      while (__stxr(v70, &uuid_string_index));
      v20 = (-v70 & 0x80000000) != 0;
      v71 = -v70 & 3;
      v72 = v70 & 3;
      if (v20)
        v73 = v72;
      else
        v73 = -v71;
      v74 = &uuid_string_string[37 * v73];
      uuid_unparse((const unsigned __int8 *)(a3 + 8), v74);
      v75 = " -- skipping";
      if (!a6)
        v75 = "";
      v100 = *(unsigned int *)(a3 + 44);
      v101 = v75;
      v98 = *(const char **)(a3 + 32);
      v99 = *(const char **)a3;
      v96 = v68;
      v97 = v74;
      v95 = v8;
      v76 = "%*s%s: id %d: %s slid base address 0x%llx, slide 0x%llx, flags 0x%x%s\n";
      goto LABEL_91;
    case 2372:
      v103 = *__error();
      v59 = (FILE *)*MEMORY[0x1E0C80C20];
      do
      {
        v77 = __ldxr(&uuid_string_index);
        v78 = v77 + 1;
      }
      while (__stxr(v78, &uuid_string_index));
      v20 = (-v78 & 0x80000000) != 0;
      v79 = -v78 & 3;
      v80 = v78 & 3;
      if (!v20)
        v80 = -v79;
      uuid_unparse((const unsigned __int8 *)(a3 + 32), &uuid_string_string[37 * v80]);
      v64 = (const unsigned __int8 *)(a3 + 8);
      do
      {
        v81 = __ldxr(&uuid_string_index);
        v66 = v81 + 1;
      }
      while (__stxr(v66, &uuid_string_index));
LABEL_98:
      v20 = (-v66 & 0x80000000) != 0;
      v82 = -v66 & 3;
      v83 = v66 & 3;
      if (!v20)
        v83 = -v82;
      uuid_unparse(v64, &uuid_string_string[37 * v83]);
      fprintf(v59, "%*s%s: 0x%llx %s -> 0x%llx %s%s\n", a5, "");
LABEL_101:
      result = __error();
      *result = v103;
      return result;
    case 2374:
      v13 = *__error();
      fprintf((FILE *)*MEMORY[0x1E0C80C20], "%*s%s: flags 0x%llx, trust level %u%s\n");
      goto LABEL_107;
    case 2376:
      v13 = *__error();
      fprintf((FILE *)*MEMORY[0x1E0C80C20], "%*s%s: scid %llu, thread offset %u, flags 0x%x%s\n", a5);
      goto LABEL_107;
    case 2379:
      v13 = *__error();
      fprintf((FILE *)*MEMORY[0x1E0C80C20], "%*s%s: id %llu, flags 0x%llx%s\n");
      goto LABEL_107;
    case 2381:
      v13 = *__error();
      fprintf((FILE *)*MEMORY[0x1E0C80C20], "%*s%s: asid 0x%llx, tnid %llu, invocationid %llu, flags 0x%llx%s\n", a5, "");
      goto LABEL_107;
    case 2384:
      v13 = *__error();
      fprintf((FILE *)*MEMORY[0x1E0C80C20], "%*s%s: id 0x%llx, flags 0x%llx, layoutid %llu, slide 0x%llx, %s\n", a5, "");
      goto LABEL_107;
    case 2387:
      v13 = *__error();
      fprintf((FILE *)*MEMORY[0x1E0C80C20], "%*s%s: layoutid %llu, flags 0x%llx%s\n");
LABEL_107:
      result = __error();
      *result = v13;
      return result;
    case 2388:
      v15 = *__error();
      v27 = (FILE *)*MEMORY[0x1E0C80C20];
      do
      {
        v84 = __ldxr(&uuid_string_index);
        v29 = v84 + 1;
      }
      while (__stxr(v29, &uuid_string_index));
LABEL_111:
      v20 = (-v29 & 0x80000000) != 0;
      v85 = -v29 & 3;
      v86 = v29 & 3;
      if (v20)
        v87 = v86;
      else
        v87 = -v85;
      uuid_unparse((const unsigned __int8 *)a3, &uuid_string_string[37 * v87]);
      fprintf(v27, "%*s%s: %#18llx %s%s\n");
LABEL_115:
      result = __error();
      *result = v15;
      return result;
    default:
      switch(v11)
      {
        case '0':
          v15 = *__error();
          v16 = (FILE *)*MEMORY[0x1E0C80C20];
          v17 = (const unsigned __int8 *)(a3 + 4);
          do
          {
            v18 = __ldxr(&uuid_string_index);
            v19 = v18 + 1;
          }
          while (__stxr(v19, &uuid_string_index));
          v20 = (-v19 & 0x80000000) != 0;
          v21 = -v19 & 3;
          v22 = v19 & 3;
          if (v20)
            v23 = v22;
          else
            v23 = -v21;
          uuid_unparse(v17, &uuid_string_string[37 * v23]);
          fprintf(v16, "%*s%s: %#18x %s%s\n");
          goto LABEL_115;
        case '1':
          v15 = *__error();
          v27 = (FILE *)*MEMORY[0x1E0C80C20];
          a3 += 8;
          do
          {
            v28 = __ldxr(&uuid_string_index);
            v29 = v28 + 1;
          }
          while (__stxr(v29, &uuid_string_index));
          goto LABEL_111;
        case '2':
          v13 = *__error();
          fprintf((FILE *)*MEMORY[0x1E0C80C20], "%*s%s: %d/%d%s\n");
          goto LABEL_107;
        case '3':
          goto LABEL_15;
        case '4':
          memset(&v105, 0, sizeof(v105));
          v104 = *(_QWORD *)a3;
          localtime_r(&v104, &v105);
          if (!strftime(v106, 0x20uLL, "%Y-%m-%d %T", &v105))
            v106[0] = 0;
          v30 = *__error();
          fprintf((FILE *)*MEMORY[0x1E0C80C20], "%*s%s: %s.%03llu%s\n");
          goto LABEL_119;
        case '5':
          v31 = *(const char **)a3;
          memset(&v105, 0, sizeof(v105));
          v104 = (unint64_t)v31 / 0xF4240;
          localtime_r(&v104, &v105);
          if (!strftime(v106, 0x20uLL, "%Y-%m-%d %T", &v105))
            v106[0] = 0;
          v32 = *__error();
          v33 = " -- skipping";
          if (!a6)
            v33 = "";
          fprintf((FILE *)*MEMORY[0x1E0C80C20], "%*s%s: %s.%03llu%s\n", a5, "", v8, v106, (unint64_t)v31 % 0xF4240 / 0x3E8, v33);
          result = __error();
          *result = v32;
          return result;
        case '6':
        case '7':
        case '8':
          goto LABEL_20;
        case '9':
          v103 = *__error();
          v102 = (FILE *)*MEMORY[0x1E0C80C20];
          do
          {
            v34 = __ldxr(&uuid_string_index);
            v35 = v34 + 1;
          }
          while (__stxr(v35, &uuid_string_index));
          v20 = (-v35 & 0x80000000) != 0;
          v36 = -v35 & 3;
          v37 = v35 & 3;
          if (!v20)
            v37 = -v36;
          uuid_unparse((const unsigned __int8 *)(a3 + 24), &uuid_string_string[37 * v37]);
          do
          {
            v38 = __ldxr(&uuid_string_index);
            v39 = v38 + 1;
          }
          while (__stxr(v39, &uuid_string_index));
          v20 = (-v39 & 0x80000000) != 0;
          v40 = -v39 & 3;
          v41 = v39 & 3;
          if (!v20)
            v41 = -v40;
          uuid_unparse((const unsigned __int8 *)(a3 + 40), &uuid_string_string[37 * v41]);
          fprintf(v102, "%*s%s: %#18llx - %#18llx -> %#18llx %s-%s%s\n", a5, "", v8);
          goto LABEL_101;
        default:
          switch(v11)
          {
            case 1:
              goto LABEL_4;
            case 2:
              goto LABEL_14;
            case 3:
              goto LABEL_15;
            case 4:
              goto LABEL_19;
            case 5:
              v13 = *__error();
              fprintf((FILE *)*MEMORY[0x1E0C80C20], "%*s%s: %lld%s\n");
              goto LABEL_107;
            default:
              goto LABEL_20;
          }
      }
  }
}

void sub_1B9C2413C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1B9C241F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B9C242B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B9C24378(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B9C24498(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B9C24558(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1B9C2461C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B9C247B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B9C24898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B9C24930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B9C249BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B9C24A80(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B9C24C60(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1B9C25058(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19, id a20)
{
  void *v20;
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_1B9C26ECC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,void *a44,void *a45,void *a46,uint64_t a47,uint64_t a48,void *a49,void *a50,uint64_t a51,uint64_t a52,uint64_t a53,void *a54,void *a55)
{
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;

  _Unwind_Resume(a1);
}

uint64_t *StringForKPDecodeContentBits(uint64_t *result)
{
  uint64_t v1;
  uint64_t *v2;
  char *v3;
  unint64_t v4;
  unint64_t v5;
  int v6;
  int v7;
  char *v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v1 = *result;
  if (!*result)
  {
    strcpy((char *)&qword_1ED1DD628, "empty");
    return result;
  }
  v2 = result;
  if ((v1 & 1) != 0)
  {
    strcpy((char *)&qword_1ED1DD628, "timestamp");
    v1 = *result;
    if ((*result & 2) == 0)
    {
      v3 = (char *)&word_1ED1DD630 + 1;
      if ((v1 & 4) == 0)
        goto LABEL_47;
LABEL_43:
      if (v3 == (char *)&qword_1ED1DD628)
        v3 = (char *)&qword_1ED1DD628;
      else
        v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
      goto LABEL_46;
    }
    v3 = (char *)&word_1ED1DD630
       + snprintf((char *)&word_1ED1DD630 + 1, _MergedGlobals_4 - ((char *)&word_1ED1DD630 + 1) + 536, ", ")
       + 1;
LABEL_42:
    result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "cpuno");
    v3 += (int)result;
    v1 = *v2;
    if ((*v2 & 4) == 0)
    {
LABEL_47:
      if ((v1 & 8) == 0)
      {
        if ((v1 & 0x10) != 0)
          goto LABEL_83;
        goto LABEL_49;
      }
      if (v3 == (char *)&qword_1ED1DD628)
        v3 = (char *)&qword_1ED1DD628;
      else
        v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
LABEL_82:
      result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "threadname");
      v3 += (int)result;
      v1 = *v2;
      if ((*v2 & 0x10) != 0)
      {
LABEL_83:
        if (v3 == (char *)&qword_1ED1DD628)
          v3 = (char *)&qword_1ED1DD628;
        else
          v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
LABEL_86:
        result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "kevent");
        v3 += (int)result;
        v1 = *v2;
        if ((*v2 & 0x20) != 0)
        {
LABEL_87:
          if (v3 == (char *)&qword_1ED1DD628)
            v3 = (char *)&qword_1ED1DD628;
          else
            v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
LABEL_90:
          result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "threadinfo");
          v3 += (int)result;
          v1 = *v2;
          if ((*v2 & 0x40) != 0)
          {
LABEL_91:
            if (v3 == (char *)&qword_1ED1DD628)
              v3 = (char *)&qword_1ED1DD628;
            else
              v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
LABEL_94:
            result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "kstack");
            v3 += (int)result;
            v1 = *v2;
            if ((*v2 & 0x80) != 0)
            {
LABEL_95:
              if (v3 == (char *)&qword_1ED1DD628)
                v3 = (char *)&qword_1ED1DD628;
              else
                v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
LABEL_98:
              result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "ustack");
              v3 += (int)result;
              v1 = *v2;
              if ((*v2 & 0x200000000) != 0)
              {
LABEL_99:
                if (v3 == (char *)&qword_1ED1DD628)
                  v3 = (char *)&qword_1ED1DD628;
                else
                  v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
LABEL_102:
                result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "exstack");
                v3 += (int)result;
                v1 = *v2;
                if ((*v2 & 0x100) != 0)
                {
LABEL_103:
                  if (v3 == (char *)&qword_1ED1DD628)
                    v3 = (char *)&qword_1ED1DD628;
                  else
                    v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
LABEL_106:
                  result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "trigger");
                  v3 += (int)result;
                  v1 = *v2;
                  if ((*v2 & 0x200) != 0)
                  {
LABEL_107:
                    if (v3 == (char *)&qword_1ED1DD628)
                      v3 = (char *)&qword_1ED1DD628;
                    else
                      v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
LABEL_110:
                    result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "pmc_thread");
                    v3 += (int)result;
                    v1 = *v2;
                    if ((*v2 & 0x400) != 0)
                    {
LABEL_111:
                      if (v3 == (char *)&qword_1ED1DD628)
                        v3 = (char *)&qword_1ED1DD628;
                      else
                        v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
LABEL_114:
                      result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "pmc_cpu");
                      v3 += (int)result;
                      v1 = *v2;
                      if ((*v2 & 0x800) != 0)
                      {
LABEL_115:
                        if (v3 == (char *)&qword_1ED1DD628)
                          v3 = (char *)&qword_1ED1DD628;
                        else
                          v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
LABEL_118:
                        result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "pmc_config");
                        v3 += (int)result;
                        v1 = *v2;
                        if ((*v2 & 0x1000) != 0)
                        {
LABEL_119:
                          if (v3 == (char *)&qword_1ED1DD628)
                            v3 = (char *)&qword_1ED1DD628;
                          else
                            v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
LABEL_122:
                          result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "meminfo");
                          v3 += (int)result;
                          v1 = *v2;
                          if ((*v2 & 0x2000) != 0)
                          {
LABEL_123:
                            if (v3 == (char *)&qword_1ED1DD628)
                              v3 = (char *)&qword_1ED1DD628;
                            else
                              v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
LABEL_126:
                            result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "sample");
                            v3 += (int)result;
                            v1 = *v2;
                            if ((*v2 & 0x4000) != 0)
                            {
LABEL_127:
                              if (v3 == (char *)&qword_1ED1DD628)
                                v3 = (char *)&qword_1ED1DD628;
                              else
                                v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
LABEL_130:
                              result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "cswitch");
                              v3 += (int)result;
                              v1 = *v2;
                              if ((*v2 & 0x8000) != 0)
                              {
LABEL_131:
                                if (v3 == (char *)&qword_1ED1DD628)
                                  v3 = (char *)&qword_1ED1DD628;
                                else
                                  v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
LABEL_134:
                                result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "config_ws");
                                v3 += (int)result;
                                v1 = *v2;
                                if ((*v2 & 0x10000) != 0)
                                {
LABEL_135:
                                  if (v3 == (char *)&qword_1ED1DD628)
                                    v3 = (char *)&qword_1ED1DD628;
                                  else
                                    v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
LABEL_138:
                                  result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "lost_evts");
                                  v3 += (int)result;
                                  v1 = *v2;
                                  if ((*v2 & 0x20000) != 0)
                                  {
LABEL_139:
                                    if (v3 == (char *)&qword_1ED1DD628)
                                      v3 = (char *)&qword_1ED1DD628;
                                    else
                                      v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
LABEL_142:
                                    result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "straggler");
                                    v3 += (int)result;
                                    v1 = *v2;
                                    if ((*v2 & 0x40000) != 0)
                                    {
LABEL_143:
                                      if (v3 == (char *)&qword_1ED1DD628)
                                        v3 = (char *)&qword_1ED1DD628;
                                      else
                                        v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
LABEL_146:
                                      result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "signpost");
                                      v3 += (int)result;
                                      v1 = *v2;
                                      if ((*v2 & 0x80000) != 0)
                                      {
LABEL_147:
                                        if (v3 == (char *)&qword_1ED1DD628)
                                          v3 = (char *)&qword_1ED1DD628;
                                        else
                                          v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
LABEL_150:
                                        result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "id_string");
                                        v3 += (int)result;
                                        v1 = *v2;
                                        if ((*v2 & 0x100000) != 0)
                                        {
LABEL_151:
                                          if (v3 == (char *)&qword_1ED1DD628)
                                            v3 = (char *)&qword_1ED1DD628;
                                          else
                                            v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
LABEL_154:
                                          result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "tinfo_sched");
                                          v3 += (int)result;
                                          v1 = *v2;
                                          if ((*v2 & 0x200000) != 0)
                                          {
LABEL_155:
                                            if (v3 == (char *)&qword_1ED1DD628)
                                              v3 = (char *)&qword_1ED1DD628;
                                            else
                                              v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
LABEL_158:
                                            result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "task_snapshot");
                                            v3 += (int)result;
                                            v1 = *v2;
                                            if ((*v2 & 0x400000) != 0)
                                            {
LABEL_159:
                                              if (v3 == (char *)&qword_1ED1DD628)
                                                v3 = (char *)&qword_1ED1DD628;
                                              else
                                                v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
LABEL_162:
                                              result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "thread_snapshot");
                                              v3 += (int)result;
                                              v1 = *v2;
                                              if ((*v2 & 0x1000000) != 0)
                                              {
LABEL_163:
                                                if (v3 == (char *)&qword_1ED1DD628)
                                                  v3 = (char *)&qword_1ED1DD628;
                                                else
                                                  v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
LABEL_166:
                                                result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "timer_fire");
                                                v3 += (int)result;
                                                v1 = *v2;
                                                if ((*v2 & 0x2000000) != 0)
                                                {
LABEL_167:
                                                  if (v3 == (char *)&qword_1ED1DD628)
                                                    v3 = (char *)&qword_1ED1DD628;
                                                  else
                                                    v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
LABEL_170:
                                                  result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "system_memory");
                                                  v3 += (int)result;
                                                  v1 = *v2;
                                                  if ((*v2 & 0x4000000) != 0)
                                                  {
LABEL_171:
                                                    if (v3 == (char *)&qword_1ED1DD628)
                                                      v3 = (char *)&qword_1ED1DD628;
                                                    else
                                                      v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
LABEL_174:
                                                    result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "thread_inscyc");
                                                    v3 += (int)result;
                                                    v1 = *v2;
                                                    if ((*v2 & 0x8000000) != 0)
                                                    {
LABEL_175:
                                                      if (v3 == (char *)&qword_1ED1DD628)
                                                        v3 = (char *)&qword_1ED1DD628;
                                                      else
                                                        v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
LABEL_178:
                                                      result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "tinfo_sched_v2");
                                                      v3 += (int)result;
                                                      v1 = *v2;
                                                      if ((*v2 & 0x10000000) != 0)
                                                      {
LABEL_179:
                                                        if (v3 == (char *)&qword_1ED1DD628)
                                                          v3 = (char *)&qword_1ED1DD628;
                                                        else
                                                          v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
LABEL_182:
                                                        result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "thread_dispatch_label");
                                                        v3 += (int)result;
                                                        v1 = *v2;
                                                        if ((*v2 & 0x20000000) != 0)
                                                        {
LABEL_183:
                                                          if (v3 == (char *)&qword_1ED1DD628)
                                                            v3 = (char *)&qword_1ED1DD628;
                                                          else
                                                            v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
LABEL_186:
                                                          result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "specific_thread_name");
                                                          v3 += (int)result;
                                                          v1 = *v2;
                                                          if ((*v2 & 0x40000000) != 0)
                                                          {
LABEL_187:
                                                            if (v3 == (char *)&qword_1ED1DD628)
                                                              v3 = (char *)&qword_1ED1DD628;
                                                            else
                                                              v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
LABEL_190:
                                                            result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "pmi");
                                                            v3 += (int)result;
                                                            v1 = *v2;
                                                            if ((*v2 & 0x80000000) != 0)
                                                            {
LABEL_191:
                                                              if (v3 == (char *)&qword_1ED1DD628)
                                                                v3 = (char *)&qword_1ED1DD628;
                                                              else
                                                                v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
                                                              goto LABEL_194;
                                                            }
LABEL_76:
                                                            if ((v1 & 0x100000000) != 0)
                                                              goto LABEL_195;
                                                            goto LABEL_77;
                                                          }
LABEL_75:
                                                          if ((v1 & 0x80000000) != 0)
                                                            goto LABEL_191;
                                                          goto LABEL_76;
                                                        }
LABEL_74:
                                                        if ((v1 & 0x40000000) != 0)
                                                          goto LABEL_187;
                                                        goto LABEL_75;
                                                      }
LABEL_73:
                                                      if ((v1 & 0x20000000) != 0)
                                                        goto LABEL_183;
                                                      goto LABEL_74;
                                                    }
LABEL_72:
                                                    if ((v1 & 0x10000000) != 0)
                                                      goto LABEL_179;
                                                    goto LABEL_73;
                                                  }
LABEL_71:
                                                  if ((v1 & 0x8000000) != 0)
                                                    goto LABEL_175;
                                                  goto LABEL_72;
                                                }
LABEL_70:
                                                if ((v1 & 0x4000000) != 0)
                                                  goto LABEL_171;
                                                goto LABEL_71;
                                              }
LABEL_69:
                                              if ((v1 & 0x2000000) != 0)
                                                goto LABEL_167;
                                              goto LABEL_70;
                                            }
LABEL_68:
                                            if ((v1 & 0x1000000) != 0)
                                              goto LABEL_163;
                                            goto LABEL_69;
                                          }
LABEL_67:
                                          if ((v1 & 0x400000) != 0)
                                            goto LABEL_159;
                                          goto LABEL_68;
                                        }
LABEL_66:
                                        if ((v1 & 0x200000) != 0)
                                          goto LABEL_155;
                                        goto LABEL_67;
                                      }
LABEL_65:
                                      if ((v1 & 0x100000) != 0)
                                        goto LABEL_151;
                                      goto LABEL_66;
                                    }
LABEL_64:
                                    if ((v1 & 0x80000) != 0)
                                      goto LABEL_147;
                                    goto LABEL_65;
                                  }
LABEL_63:
                                  if ((v1 & 0x40000) != 0)
                                    goto LABEL_143;
                                  goto LABEL_64;
                                }
LABEL_62:
                                if ((v1 & 0x20000) != 0)
                                  goto LABEL_139;
                                goto LABEL_63;
                              }
LABEL_61:
                              if ((v1 & 0x10000) != 0)
                                goto LABEL_135;
                              goto LABEL_62;
                            }
LABEL_60:
                            if ((v1 & 0x8000) != 0)
                              goto LABEL_131;
                            goto LABEL_61;
                          }
LABEL_59:
                          if ((v1 & 0x4000) != 0)
                            goto LABEL_127;
                          goto LABEL_60;
                        }
LABEL_58:
                        if ((v1 & 0x2000) != 0)
                          goto LABEL_123;
                        goto LABEL_59;
                      }
LABEL_57:
                      if ((v1 & 0x1000) != 0)
                        goto LABEL_119;
                      goto LABEL_58;
                    }
LABEL_56:
                    if ((v1 & 0x800) != 0)
                      goto LABEL_115;
                    goto LABEL_57;
                  }
LABEL_55:
                  if ((v1 & 0x400) != 0)
                    goto LABEL_111;
                  goto LABEL_56;
                }
LABEL_54:
                if ((v1 & 0x200) != 0)
                  goto LABEL_107;
                goto LABEL_55;
              }
LABEL_53:
              if ((v1 & 0x100) != 0)
                goto LABEL_103;
              goto LABEL_54;
            }
LABEL_52:
            if ((v1 & 0x200000000) != 0)
              goto LABEL_99;
            goto LABEL_53;
          }
LABEL_51:
          if ((v1 & 0x80) != 0)
            goto LABEL_95;
          goto LABEL_52;
        }
LABEL_50:
        if ((v1 & 0x40) != 0)
          goto LABEL_91;
        goto LABEL_51;
      }
LABEL_49:
      if ((v1 & 0x20) != 0)
        goto LABEL_87;
      goto LABEL_50;
    }
    goto LABEL_43;
  }
  v3 = (char *)&qword_1ED1DD628;
  if ((v1 & 2) != 0)
    goto LABEL_42;
  if ((v1 & 4) != 0)
  {
LABEL_46:
    result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "tid");
    v3 += (int)result;
    v1 = *v2;
    goto LABEL_47;
  }
  if ((v1 & 8) != 0)
    goto LABEL_82;
  if ((v1 & 0x10) != 0)
    goto LABEL_86;
  if ((v1 & 0x20) != 0)
    goto LABEL_90;
  if ((v1 & 0x40) != 0)
    goto LABEL_94;
  if ((v1 & 0x80) != 0)
    goto LABEL_98;
  if ((v1 & 0x200000000) != 0)
    goto LABEL_102;
  if ((v1 & 0x100) != 0)
    goto LABEL_106;
  if ((v1 & 0x200) != 0)
    goto LABEL_110;
  if ((v1 & 0x400) != 0)
    goto LABEL_114;
  if ((v1 & 0x800) != 0)
    goto LABEL_118;
  if ((v1 & 0x1000) != 0)
    goto LABEL_122;
  if ((v1 & 0x2000) != 0)
    goto LABEL_126;
  if ((v1 & 0x4000) != 0)
    goto LABEL_130;
  if ((v1 & 0x8000) != 0)
    goto LABEL_134;
  if ((v1 & 0x10000) != 0)
    goto LABEL_138;
  if ((v1 & 0x20000) != 0)
    goto LABEL_142;
  if ((v1 & 0x40000) != 0)
    goto LABEL_146;
  if ((v1 & 0x80000) != 0)
    goto LABEL_150;
  if ((v1 & 0x100000) != 0)
    goto LABEL_154;
  if ((v1 & 0x200000) != 0)
    goto LABEL_158;
  if ((v1 & 0x400000) != 0)
    goto LABEL_162;
  if ((v1 & 0x1000000) != 0)
    goto LABEL_166;
  if ((v1 & 0x2000000) != 0)
    goto LABEL_170;
  if ((v1 & 0x4000000) != 0)
    goto LABEL_174;
  if ((v1 & 0x8000000) != 0)
    goto LABEL_178;
  if ((v1 & 0x10000000) != 0)
    goto LABEL_182;
  if ((v1 & 0x20000000) != 0)
    goto LABEL_186;
  if ((v1 & 0x40000000) != 0)
    goto LABEL_190;
  if ((v1 & 0x80000000) == 0)
  {
    if ((v1 & 0x100000000) == 0)
    {
      if ((v1 & 0x8000000000000000) == 0)
        goto LABEL_203;
      goto LABEL_202;
    }
    goto LABEL_198;
  }
LABEL_194:
  result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "system_memory_status");
  v3 += (int)result;
  v1 = *v2;
  if ((*v2 & 0x100000000) != 0)
  {
LABEL_195:
    if (v3 == (char *)&qword_1ED1DD628)
      v3 = (char *)&qword_1ED1DD628;
    else
      v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
LABEL_198:
    result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "async_stack");
    v3 += (int)result;
    v1 = *v2;
    if ((*v2 & 0x8000000000000000) == 0)
      goto LABEL_203;
    goto LABEL_199;
  }
LABEL_77:
  if ((v1 & 0x8000000000000000) == 0)
    goto LABEL_203;
LABEL_199:
  if (v3 == (char *)&qword_1ED1DD628)
    v3 = (char *)&qword_1ED1DD628;
  else
    v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
LABEL_202:
  result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "malformed");
  v3 += (int)result;
  v1 = *v2;
LABEL_203:
  v4 = v1 & 0x7FFFFFFC00000000;
  v17 = v1 & 0x7FFFFFFC00000000;
  if ((v1 & 0x7FFFFFFC00000000) != 0)
  {
    do
    {
      v5 = __clz(__rbit64(v4));
      v6 = buf[(v5 >> 3) - 8];
      v7 = 1 << (v5 & 7);
      if ((v7 & v6) == 0)
      {
        v9 = *__error();
        _sa_logt();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109376;
          v19 = v5;
          v20 = 2048;
          v21 = v4;
          _os_log_error_impl(&dword_1B9BE0000, v10, OS_LOG_TYPE_ERROR, "bitNum %d unset, but contents 0x%llx", buf, 0x12u);
        }

        *__error() = v9;
        _SASetCrashLogMessage(567, "bitNum %d unset, but contents 0x%llx", v11, v12, v13, v14, v15, v16, v5);
        _os_crash();
        __break(1u);
      }
      buf[(v5 >> 3) - 8] = v6 & ~(_BYTE)v7;
      if (v3 == (char *)&qword_1ED1DD628)
        v8 = (char *)&qword_1ED1DD628;
      else
        v8 = &v3[snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ")];
      result = (uint64_t *)snprintf(v8, _MergedGlobals_4 - v8 + 536, "UNKNOWN(%d)", v5);
      v3 = &v8[(int)result];
      v4 = v17;
    }
    while (v17);
  }
  return result;
}

void sub_1B9C288D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,void *a26)
{
  void *v26;
  void *v27;

  _Unwind_Resume(a1);
}

void sub_1B9C298E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,void *a37,void *a38,void *a39,void *a40,void *a41,void *a42,void *a43,void *a44,void *a45)
{
  void *v45;
  void *v46;
  void *v47;
  void *v48;

  _Unwind_Resume(a1);
}

id KTraceStringFromArguments(uint64_t a1, uint64_t a2, unsigned int a3)
{
  int is_kernel_64_bit;
  uint64_t v6;
  uint64_t v7;
  _DWORD *v8;
  _DWORD *v9;
  void *v10;
  _DWORD *v11;
  int32x2_t *v12;
  uint64_t v13;
  void *v14;

  is_kernel_64_bit = ktrace_is_kernel_64_bit();
  v6 = 5 - a3;
  if (is_kernel_64_bit)
  {
    v7 = 8 * v6;
    v8 = (_DWORD *)(a2 + 24);
    if (a3 == 1)
      v8 = (_DWORD *)(a2 + 8);
    if (a3 == 2)
      v9 = (_DWORD *)(a2 + 16);
    else
      v9 = v8;
    v10 = 0;
    goto LABEL_13;
  }
  v7 = 4 * v6;
  v11 = malloc_type_calloc(4 * v6, 1uLL, 0xB0F01E6AuLL);
  v9 = v11;
  if (a3 <= 1)
  {
    *v11 = *(_QWORD *)(a2 + 8);
    v12 = (int32x2_t *)(v11 + 1);
LABEL_11:
    v12->i32[0] = *(_QWORD *)(a2 + 16);
    v12 = (int32x2_t *)((char *)v12 + 4);
    goto LABEL_12;
  }
  v12 = (int32x2_t *)v11;
  if (a3 == 2)
    goto LABEL_11;
LABEL_12:
  *v12 = vmovn_s64(*(int64x2_t *)(a2 + 24));
  v10 = v11;
LABEL_13:
  v13 = 0;
  while (*((_BYTE *)v9 + v13))
  {
    if (v7 == ++v13)
    {
      v13 = v7;
      break;
    }
  }
  if (!v13)
  {
    v14 = 0;
    if (!v10)
      return v14;
    goto LABEL_19;
  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithBytes:length:encoding:", v9, v13, 4);
  if (v10)
LABEL_19:
    free(v10);
  return v14;
}

void sub_1B9C2A0B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1B9C2A514(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B9C2AC9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,void *a46,void *a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,void *a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,void *a62,uint64_t a63)
{
  void *a64;
  void *a71;
  uint64_t v71;

  _Block_object_dispose((const void *)(v71 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1B9C2ADA8()
{
  JUMPOUT(0x1B9C2ACE4);
}

void sub_1B9C2ADB0()
{
  JUMPOUT(0x1B9C2ACECLL);
}

void sub_1B9C2ADB8()
{
  JUMPOUT(0x1B9C2ACFCLL);
}

void sub_1B9C2ADC0()
{
  JUMPOUT(0x1B9C2AD0CLL);
}

void sub_1B9C2ADC8()
{
  JUMPOUT(0x1B9C2AD1CLL);
}

void sub_1B9C2ADD0()
{
  JUMPOUT(0x1B9C2AD44);
}

void sub_1B9C2AE1C()
{
  JUMPOUT(0x1B9C2AD7CLL);
}

void sub_1B9C2B144(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B9C2B248(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B9C2B71C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B9C2BAA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B9C2BCCC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B9C2C188(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, id a18)
{
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1B9C2C574(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, id a17)
{
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  _Unwind_Resume(a1);
}

void sub_1B9C2C8D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1B9C2CABC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B9C2D49C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1B9C2D6CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B9C2D950(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B9C2F1F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,void *a40,uint64_t a41,uint64_t a42,void *a43)
{
  void *v43;

  _Unwind_Resume(a1);
}

void sub_1B9C33134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,void *a40)
{
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;

  _Unwind_Resume(a1);
}

void sub_1B9C33804(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1B9C34D9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,void *a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,void *a55,void *a56)
{
  void *v56;
  void *v57;
  uint64_t v58;

  _Block_object_dispose(&STACK[0x520], 8);
  _Block_object_dispose((const void *)(v58 - 256), 8);

  _Block_object_dispose(&STACK[0x410], 8);
  _Block_object_dispose(&STACK[0x440], 8);
  _Block_object_dispose(&STACK[0x460], 8);
  _Block_object_dispose(&STACK[0x480], 8);
  _Block_object_dispose(&STACK[0x4A0], 8);
  _Block_object_dispose(&STACK[0x4C0], 8);

  _Block_object_dispose(&STACK[0x4F0], 8);
  _Unwind_Resume(a1);
}

void sub_1B9C35170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1B9C353E8(_Unwind_Exception *a1)
{
  void *v1;

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

void sub_1B9C354E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id DictForChunkViaNSPropertyList()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;

  v0 = ktrace_chunk_size();
  v1 = ktrace_chunk_map_data();
  if (!v1)
    goto LABEL_5;
  v2 = (void *)MEMORY[0x1E0CB38B0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v1, v0, 0);
  objc_msgSend(v2, "propertyListWithData:options:format:error:", v3, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  ktrace_chunk_unmap_data();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

LABEL_5:
      v4 = 0;
    }
  }
  return v4;
}

void sub_1B9C355CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B9C35E3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
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

void sub_1B9C36C90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20,uint64_t a21,void *a22)
{
  void *v22;

  _Unwind_Resume(a1);
}

void sub_1B9C36F38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B9C375A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_1B9C376F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B9C37840(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B9C378B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id DictForChunkViaNSUnarchiver()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v13;
  id v14;

  v0 = ktrace_chunk_size();
  v1 = ktrace_chunk_map_data();
  if (v1)
  {
    v2 = v1;
    v13 = (void *)MEMORY[0x1E0CB3710];
    v3 = objc_alloc(MEMORY[0x1E0C99E60]);
    v4 = objc_opt_class();
    v5 = objc_opt_class();
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = (void *)objc_msgSend(v3, "initWithObjects:", v4, v5, v6, v7, objc_opt_class(), 0);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v2, v0, 0);
    v14 = 0;
    objc_msgSend(v13, "unarchivedObjectOfClasses:fromData:error:", v8, v9, &v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v14;

    ktrace_chunk_unmap_data();
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v10 = 0;
      }
    }

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

void sub_1B9C37A88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B9C384E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13)
{

  _Unwind_Resume(a1);
}

void sub_1B9C38898(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1B9C38BC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1B9C38CF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B9C38DF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_1B9C38EC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B9C3951C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B9C398AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B9C39C30(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B9C39F5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_1B9C3A888(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, _Unwind_Exception *exception_object, void *a15, void *a16, void *a17, id a18)
{
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  _Unwind_Resume(a1);
}

void sub_1B9C3BA24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  _Unwind_Resume(a1);
}

void sub_1B9C3C124(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  _Unwind_Resume(a1);
}

void sub_1B9C3C23C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B9C3C414(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B9C3C4B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

uint64_t flatbuffers::Verifier::VerifyOffset(flatbuffers::Verifier *this, unint64_t a2)
{
  unint64_t v2;
  uint64_t v4;

  if ((a2 & 3) != 0 && *((_BYTE *)this + 40))
    return 0;
  v2 = *((_QWORD *)this + 1);
  if (v2 < 5 || v2 - 4 < a2)
    return 0;
  v4 = *(unsigned int *)(*(_QWORD *)this + a2);
  if ((int)v4 < 1)
    return 0;
  if (v2 - 1 >= v4 + a2)
    return v4;
  return 0;
}

BOOL flatbuffers::Table::VerifyOffset(flatbuffers::Table *this, const flatbuffers::Verifier *a2, unsigned int a3)
{
  unsigned __int16 *v3;
  uint64_t v4;

  v3 = (unsigned __int16 *)((char *)this - *(int *)this);
  return *v3 <= a3
      || (v4 = *(unsigned __int16 *)((char *)v3 + a3)) == 0
      || flatbuffers::Verifier::VerifyOffset(a2, (unint64_t)this + v4 - *(_QWORD *)a2) != 0;
}

BOOL flatbuffers::Verifier::VerifyTableStart(flatbuffers::Verifier *this, const unsigned __int8 *a2)
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

  v2 = *(_QWORD *)this;
  v3 = (unint64_t)&a2[-*(_QWORD *)this];
  if ((v3 & 3) != 0 && *((_BYTE *)this + 40))
    return 0;
  v4 = *((_QWORD *)this + 1);
  v5 = v4 >= 5 && v4 - 4 >= v3;
  if (!v5)
    return 0;
  v6 = *(int *)a2;
  v7 = *((_DWORD *)this + 5);
  v8 = *((_DWORD *)this + 4) + 1;
  *((_DWORD *)this + 4) = v8;
  v9 = *((_DWORD *)this + 6) + 1;
  *((_DWORD *)this + 6) = v9;
  if (v8 > v7 || v9 > *((_DWORD *)this + 7))
    return 0;
  v10 = v3 - v6;
  if ((v10 & 1) != 0)
  {
    v11 = 0;
    if (*((_BYTE *)this + 40) || v4 - 2 < v10)
      return v11;
  }
  else if (v4 - 2 < v10)
  {
    return 0;
  }
  v12 = *(unsigned __int16 *)(v2 + v10);
  if ((v12 & 1) != 0 && *((_BYTE *)this + 40))
    return 0;
  v5 = v4 >= v12;
  v14 = v4 - v12;
  return v14 != 0 && v5 && v14 >= v10;
}

BOOL flatbuffers::Verifier::VerifyVectorOrString(flatbuffers::Verifier *this, const unsigned __int8 *a2, unint64_t a3, unint64_t *a4)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  unint64_t v10;

  v4 = (unint64_t)&a2[-*(_QWORD *)this];
  if ((v4 & 3) != 0 && *((_BYTE *)this + 40))
    return 0;
  v5 = *((_QWORD *)this + 1);
  if (v5 < 5 || v5 - 4 < v4)
    return 0;
  v7 = *(unsigned int *)a2;
  if (0x7FFFFFFF / a3 <= v7)
    return 0;
  v8 = v7 * a3 + 4;
  if (a4)
  {
    *a4 = v8 + v4;
    v5 = *((_QWORD *)this + 1);
  }
  v9 = v5 > v8;
  v10 = v5 - v8;
  return v9 && v10 >= v4;
}

BOOL flatbuffers::Verifier::VerifyString(flatbuffers::Verifier *a1, const unsigned __int8 *a2)
{
  _BOOL8 result;
  unint64_t v4;
  unint64_t v6;

  if (!a2)
    return 1;
  v6 = 0;
  result = flatbuffers::Verifier::VerifyVectorOrString(a1, a2, 1uLL, &v6);
  if (result)
  {
    v4 = *((_QWORD *)a1 + 1);
    return v4 >= 2 && v4 - 1 >= v6 && *(_BYTE *)(*(_QWORD *)a1 + v6) == 0;
  }
  return result;
}

BOOL FlatbufferSymbols::MachoMetadata::Verify(FlatbufferSymbols::MachoMetadata *this, flatbuffers::Verifier *a2)
{
  _BOOL8 result;
  unsigned __int16 *v5;
  uint64_t v6;
  const unsigned __int8 *v7;
  unsigned __int16 *v8;
  uint64_t v9;
  const unsigned __int8 *v10;
  unsigned __int16 *v11;
  unsigned int v12;
  unint64_t v13;
  unint64_t v14;
  unsigned __int16 *v15;
  uint64_t v16;
  const unsigned __int8 *v17;
  unsigned __int16 *v18;
  uint64_t v19;
  const unsigned __int8 *v20;
  unsigned __int16 *v21;
  uint64_t v22;
  const unsigned __int8 *v23;
  unsigned __int16 *v24;
  uint64_t v25;
  const unsigned __int8 *v26;
  unsigned __int16 *v27;
  uint64_t v28;
  const unsigned __int8 *v29;
  unsigned __int16 *v30;
  uint64_t v31;
  const unsigned __int8 *v32;

  result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (v6 = v5[2]) != 0)
        v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      else
        v7 = 0;
      result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          v8 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v8 >= 7u && (v9 = v8[3]) != 0)
            v10 = (const unsigned __int8 *)this + v9 + *(unsigned int *)((char *)this + v9);
          else
            v10 = 0;
          result = flatbuffers::Verifier::VerifyString(a2, v10);
          if (result)
          {
            v11 = (unsigned __int16 *)((char *)this - *(int *)this);
            v12 = *v11;
            if (v12 < 9
              || (!v11[4]
               || (result = 0, v13 = *((_QWORD *)a2 + 1), v13 >= 9)
               && v13 - 8 >= (unint64_t)this + v11[4] - *(_QWORD *)a2)
              && (v12 < 0xB
               || !v11[5]
               || (result = 0, v14 = *((_QWORD *)a2 + 1), v14 >= 9)
               && v14 - 8 >= (unint64_t)this + v11[5] - *(_QWORD *)a2))
            {
              result = flatbuffers::Table::VerifyOffset(this, a2, 0xCu);
              if (result
                && (v12 < 0xD
                 || !v11[6]
                 || (result = FlatbufferSymbols::CPUArchitecture::Verify((FlatbufferSymbols::MachoMetadata *)((char *)this+ v11[6]+ *(unsigned int *)((char *)this + v11[6])), a2))))
              {
                result = flatbuffers::Table::VerifyOffset(this, a2, 0xEu);
                if (result)
                {
                  v15 = (unsigned __int16 *)((char *)this - *(int *)this);
                  if (*v15 >= 0xFu && (v16 = v15[7]) != 0)
                    v17 = (const unsigned __int8 *)this + v16 + *(unsigned int *)((char *)this + v16);
                  else
                    v17 = 0;
                  result = flatbuffers::Verifier::VerifyString(a2, v17);
                  if (result)
                  {
                    result = flatbuffers::Table::VerifyOffset(this, a2, 0x10u);
                    if (result)
                    {
                      v18 = (unsigned __int16 *)((char *)this - *(int *)this);
                      if (*v18 >= 0x11u && (v19 = v18[8]) != 0)
                        v20 = (const unsigned __int8 *)this + v19 + *(unsigned int *)((char *)this + v19);
                      else
                        v20 = 0;
                      result = flatbuffers::Verifier::VerifyString(a2, v20);
                      if (result)
                      {
                        result = flatbuffers::Table::VerifyOffset(this, a2, 0x12u);
                        if (result)
                        {
                          v21 = (unsigned __int16 *)((char *)this - *(int *)this);
                          if (*v21 >= 0x13u && (v22 = v21[9]) != 0)
                            v23 = (const unsigned __int8 *)this + v22 + *(unsigned int *)((char *)this + v22);
                          else
                            v23 = 0;
                          result = flatbuffers::Verifier::VerifyString(a2, v23);
                          if (result)
                          {
                            result = flatbuffers::Table::VerifyOffset(this, a2, 0x14u);
                            if (result)
                            {
                              v24 = (unsigned __int16 *)((char *)this - *(int *)this);
                              if (*v24 >= 0x15u && (v25 = v24[10]) != 0)
                                v26 = (const unsigned __int8 *)this + v25 + *(unsigned int *)((char *)this + v25);
                              else
                                v26 = 0;
                              result = flatbuffers::Verifier::VerifyString(a2, v26);
                              if (result)
                              {
                                result = flatbuffers::Table::VerifyOffset(this, a2, 0x16u);
                                if (result)
                                {
                                  v27 = (unsigned __int16 *)((char *)this - *(int *)this);
                                  if (*v27 >= 0x17u && (v28 = v27[11]) != 0)
                                    v29 = (const unsigned __int8 *)this + v28 + *(unsigned int *)((char *)this + v28);
                                  else
                                    v29 = 0;
                                  result = flatbuffers::Verifier::VerifyString(a2, v29);
                                  if (result)
                                  {
                                    result = flatbuffers::Table::VerifyOffset(this, a2, 0x18u);
                                    if (result)
                                    {
                                      v30 = (unsigned __int16 *)((char *)this - *(int *)this);
                                      if (*v30 >= 0x19u && (v31 = v30[12]) != 0)
                                        v32 = (const unsigned __int8 *)this
                                            + v31
                                            + *(unsigned int *)((char *)this + v31);
                                      else
                                        v32 = 0;
                                      result = flatbuffers::Verifier::VerifyString(a2, v32);
                                      if (result)
                                      {
                                        --*((_DWORD *)a2 + 4);
                                        return 1;
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
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL FlatbufferSymbols::CPUArchitecture::Verify(FlatbufferSymbols::CPUArchitecture *this, flatbuffers::Verifier *a2)
{
  _BOOL8 result;
  unsigned __int16 *v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;

  result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    v5 = (unsigned __int16 *)((char *)this - *(int *)this);
    v6 = *v5;
    if (v6 < 5
      || (!v5[2]
       || (result = 0, v7 = *((_QWORD *)a2 + 1), v7 >= 5) && v7 - 4 >= (unint64_t)this + v5[2] - *(_QWORD *)a2)
      && (v6 < 7
       || (!v5[3]
        || (result = 0, v8 = *((_QWORD *)a2 + 1), v8 >= 5) && v8 - 4 >= (unint64_t)this + v5[3] - *(_QWORD *)a2)
       && (v6 < 9
        || (v9 = v5[4]) == 0
        || (result = 0, v10 = *((_QWORD *)a2 + 1), v10 >= 5) && v10 - 4 >= (unint64_t)this + v9 - *(_QWORD *)a2)))
    {
      --*((_DWORD *)a2 + 4);
      return 1;
    }
  }
  return result;
}

BOOL FlatbufferSymbols::DyldSharedCacheMetadata::Verify(FlatbufferSymbols::DyldSharedCacheMetadata *this, flatbuffers::Verifier *a2)
{
  _BOOL8 result;
  unsigned __int16 *v5;
  uint64_t v6;
  const unsigned __int8 *v7;
  unsigned __int16 *v8;
  uint64_t v9;
  const unsigned __int8 *v10;
  unsigned __int16 *v11;
  unsigned int v12;
  unint64_t v13;
  unint64_t v14;
  unsigned __int16 *v15;
  uint64_t v16;
  const unsigned __int8 *v17;
  unsigned __int16 *v18;
  uint64_t v19;
  const unsigned __int8 *v20;
  unsigned __int16 *v21;
  uint64_t v22;
  const unsigned __int8 *v23;
  unsigned __int16 *v24;
  uint64_t v25;
  unint64_t v26;

  result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (v6 = v5[2]) != 0)
        v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      else
        v7 = 0;
      result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          v8 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v8 >= 7u && (v9 = v8[3]) != 0)
            v10 = (const unsigned __int8 *)this + v9 + *(unsigned int *)((char *)this + v9);
          else
            v10 = 0;
          result = flatbuffers::Verifier::VerifyString(a2, v10);
          if (result)
          {
            v11 = (unsigned __int16 *)((char *)this - *(int *)this);
            v12 = *v11;
            if (v12 < 9
              || (!v11[4]
               || (result = 0, v13 = *((_QWORD *)a2 + 1), v13 >= 9)
               && v13 - 8 >= (unint64_t)this + v11[4] - *(_QWORD *)a2)
              && (v12 < 0xB
               || !v11[5]
               || (result = 0, v14 = *((_QWORD *)a2 + 1), v14 >= 9)
               && v14 - 8 >= (unint64_t)this + v11[5] - *(_QWORD *)a2))
            {
              result = flatbuffers::Table::VerifyOffset(this, a2, 0xCu);
              if (result
                && (v12 < 0xD
                 || !v11[6]
                 || (result = FlatbufferSymbols::CPUArchitecture::Verify((FlatbufferSymbols::DyldSharedCacheMetadata *)((char *)this+ v11[6]+ *(unsigned int *)((char *)this + v11[6])), a2))))
              {
                result = flatbuffers::Table::VerifyOffset(this, a2, 0xEu);
                if (result)
                {
                  v15 = (unsigned __int16 *)((char *)this - *(int *)this);
                  if (*v15 >= 0xFu && (v16 = v15[7]) != 0)
                    v17 = (const unsigned __int8 *)this + v16 + *(unsigned int *)((char *)this + v16);
                  else
                    v17 = 0;
                  result = flatbuffers::Verifier::VerifyString(a2, v17);
                  if (result)
                  {
                    result = flatbuffers::Table::VerifyOffset(this, a2, 0x10u);
                    if (result)
                    {
                      v18 = (unsigned __int16 *)((char *)this - *(int *)this);
                      if (*v18 >= 0x11u && (v19 = v18[8]) != 0)
                        v20 = (const unsigned __int8 *)this + v19 + *(unsigned int *)((char *)this + v19);
                      else
                        v20 = 0;
                      result = flatbuffers::Verifier::VerifyString(a2, v20);
                      if (result)
                      {
                        result = flatbuffers::Table::VerifyOffset(this, a2, 0x12u);
                        if (result)
                        {
                          v21 = (unsigned __int16 *)((char *)this - *(int *)this);
                          if (*v21 >= 0x13u && (v22 = v21[9]) != 0)
                            v23 = (const unsigned __int8 *)this + v22 + *(unsigned int *)((char *)this + v22);
                          else
                            v23 = 0;
                          result = flatbuffers::Verifier::VerifyString(a2, v23);
                          if (result)
                          {
                            v24 = (unsigned __int16 *)((char *)this - *(int *)this);
                            if (*v24 < 0x15u
                              || (v25 = v24[10]) == 0
                              || (result = 0, v26 = *((_QWORD *)a2 + 1), v26 >= 9)
                              && v26 - 8 >= (unint64_t)this + v25 - *(_QWORD *)a2)
                            {
                              --*((_DWORD *)a2 + 4);
                              return 1;
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
  }
  return result;
}

uint64_t flatbuffers::Verifier::VerifyVectorOfTables<FlatbufferSymbols::SymbolNameEntry>(flatbuffers::Verifier *this, _DWORD *a2)
{
  uint64_t v4;
  unint64_t v5;
  _DWORD *v6;
  uint64_t v7;
  const unsigned __int8 *v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;

  if (!a2)
    return 1;
  if (!*a2)
    return 1;
  v4 = 0;
  v5 = 0;
  v6 = a2 + 1;
  while (1)
  {
    v7 = a2[v4 + 1];
    v8 = (const unsigned __int8 *)&a2[v4] + v7;
    result = flatbuffers::Verifier::VerifyTableStart(this, v8 + 4);
    if (!(_DWORD)result)
      break;
    v10 = v7 - *((int *)v8 + 1);
    if (*(unsigned __int16 *)((char *)&a2[v4 + 1] + v10) < 5u)
      return 0;
    v11 = *(unsigned __int16 *)((char *)&a2[v4 + 2] + v10);
    if (!v11)
      return 0;
    v12 = v7 + v11;
    result = flatbuffers::Verifier::VerifyOffset(this, (unint64_t)&v6[v4] + v7 + v11 - *(_QWORD *)this);
    if (!(_DWORD)result)
      return result;
    result = flatbuffers::Verifier::VerifyString(this, (const unsigned __int8 *)&a2[v4 + 1] + v12 + *(unsigned int *)((char *)&a2[v4 + 1] + v12));
    if (!(_DWORD)result)
      return result;
    result = flatbuffers::Table::VerifyOffset((flatbuffers::Table *)(v8 + 4), this, 6u);
    if (!(_DWORD)result)
      return result;
    v13 = (char *)&a2[v4] + v7 - *((int *)v8 + 1);
    if (*((unsigned __int16 *)v13 + 2) >= 7u)
    {
      v14 = *((unsigned __int16 *)v13 + 5);
      if (v14)
      {
        if ((FlatbufferSymbols::Symbol::Verify((FlatbufferSymbols::Symbol *)((char *)&a2[v4 + 1]+ v7+ v14+ *(unsigned int *)((char *)&a2[v4 + 1] + v7 + v14)), this) & 1) == 0)return 0;
      }
    }
    --*((_DWORD *)this + 4);
    ++v5;
    ++v4;
    if (v5 >= *a2)
      return 1;
  }
  return result;
}

uint64_t FlatbufferSymbols::Symbol::Verify(FlatbufferSymbols::Symbol *this, flatbuffers::Verifier *a2)
{
  uint64_t result;
  unsigned __int16 *v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  const unsigned __int8 *v9;
  unsigned __int16 *v10;
  uint64_t v11;
  const unsigned __int8 *v12;
  _DWORD *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int16 *v16;
  uint64_t v17;
  _DWORD *v18;
  uint64_t v19;
  uint64_t v20;
  unsigned __int16 *v21;
  uint64_t v22;
  unint64_t v23;

  result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if ((_DWORD)result)
  {
    v5 = (unsigned __int16 *)((char *)this - *(int *)this);
    v6 = *v5;
    if (v6 < 5
      || (!v5[2]
       || (result = 0, v7 = *((_QWORD *)a2 + 1), v7 >= 9) && v7 - 8 >= (unint64_t)this + v5[2] - *(_QWORD *)a2)
      && (v6 < 7
       || !v5[3]
       || (result = 0, v8 = *((_QWORD *)a2 + 1), v8 >= 9) && v8 - 8 >= (unint64_t)this + v5[3] - *(_QWORD *)a2))
    {
      result = flatbuffers::Table::VerifyOffset(this, a2, 8u);
      if ((_DWORD)result)
      {
        v9 = v6 >= 9 && v5[4] ? (const unsigned __int8 *)this + v5[4] + *(unsigned int *)((char *)this + v5[4]) : 0;
        result = flatbuffers::Verifier::VerifyString(a2, v9);
        if ((_DWORD)result)
        {
          result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
          if ((_DWORD)result)
          {
            v10 = (unsigned __int16 *)((char *)this - *(int *)this);
            if (*v10 >= 0xBu && (v11 = v10[5]) != 0)
              v12 = (const unsigned __int8 *)this + v11 + *(unsigned int *)((char *)this + v11);
            else
              v12 = 0;
            result = flatbuffers::Verifier::VerifyString(a2, v12);
            if ((_DWORD)result)
            {
              result = flatbuffers::Table::VerifyOffset(this, a2, 0xCu);
              if ((_DWORD)result)
              {
                v13 = 0;
                v14 = *(int *)this;
                if (*(unsigned __int16 *)((char *)this - v14) >= 0xDu)
                {
                  if (!*(_WORD *)((char *)this - v14 + 12))
                    goto LABEL_27;
                  result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v14 + 12)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v14 + 12)), 4uLL, 0);
                  if (!(_DWORD)result)
                    return result;
                  v13 = 0;
                  v14 = *(int *)this;
                  if (*(unsigned __int16 *)((char *)this - v14) >= 0xDu)
                  {
LABEL_27:
                    v15 = *(unsigned __int16 *)((char *)this - v14 + 12);
                    if (v15)
                      v13 = (_DWORD *)((char *)this + v15 + *(unsigned int *)((char *)this + v15));
                    else
                      v13 = 0;
                  }
                }
                result = flatbuffers::Verifier::VerifyVectorOfTables<FlatbufferSymbols::SourceInfo>(a2, v13);
                if ((_DWORD)result)
                {
                  result = flatbuffers::Table::VerifyOffset(this, a2, 0xEu);
                  if ((_DWORD)result)
                  {
                    v16 = (unsigned __int16 *)((char *)this - *(int *)this);
                    if (*v16 < 0xFu
                      || (v17 = v16[7]) == 0
                      || (result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this + v17 + *(unsigned int *)((char *)this + v17), 1uLL, 0), (_DWORD)result))
                    {
                      result = flatbuffers::Table::VerifyOffset(this, a2, 0x10u);
                      if ((_DWORD)result)
                      {
                        v18 = 0;
                        v19 = *(int *)this;
                        if (*(unsigned __int16 *)((char *)this - v19) >= 0x11u)
                        {
                          if (!*(_WORD *)((char *)this - v19 + 16))
                            goto LABEL_40;
                          result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v19 + 16)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v19 + 16)), 4uLL, 0);
                          if (!(_DWORD)result)
                            return result;
                          v18 = 0;
                          v19 = *(int *)this;
                          if (*(unsigned __int16 *)((char *)this - v19) >= 0x11u)
                          {
LABEL_40:
                            v20 = *(unsigned __int16 *)((char *)this - v19 + 16);
                            if (v20)
                              v18 = (_DWORD *)((char *)this + v20 + *(unsigned int *)((char *)this + v20));
                            else
                              v18 = 0;
                          }
                        }
                        result = flatbuffers::Verifier::VerifyVectorOfTables<FlatbufferSymbols::InlineSymbol>((uint64_t)a2, v18);
                        if ((_DWORD)result)
                        {
                          v21 = (unsigned __int16 *)((char *)this - *(int *)this);
                          if (*v21 < 0x13u
                            || (v22 = v21[9]) == 0
                            || (result = 0, v23 = *((_QWORD *)a2 + 1), v23 >= 9)
                            && v23 - 8 >= (unint64_t)this + v22 - *(_QWORD *)a2)
                          {
                            --*((_DWORD *)a2 + 4);
                            return 1;
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
  return result;
}

BOOL flatbuffers::Verifier::VerifyVectorOfTables<FlatbufferSymbols::SourceInfo>(flatbuffers::Verifier *a1, _DWORD *a2)
{
  unint64_t v4;
  unsigned int *v5;
  _BOOL8 result;

  if (!a2)
    return 1;
  if (!*a2)
    return 1;
  v4 = 0;
  v5 = a2 + 1;
  do
  {
    result = FlatbufferSymbols::SourceInfo::Verify((FlatbufferSymbols::SourceInfo *)((char *)v5 + *v5), a1);
    if (!result)
      break;
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

uint64_t flatbuffers::Verifier::VerifyVectorOfTables<FlatbufferSymbols::InlineSymbol>(uint64_t a1, _DWORD *a2)
{
  uint64_t v4;
  unint64_t v5;
  _DWORD *v6;
  uint64_t v7;
  const unsigned __int8 *v8;
  uint64_t result;
  uint64_t v10;
  unsigned int v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  const unsigned __int8 *v15;
  char *v16;
  uint64_t v17;
  const unsigned __int8 *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  unint64_t v28;

  if (!a2)
    return 1;
  if (!*a2)
    return 1;
  v4 = 0;
  v5 = 0;
  v6 = a2 + 1;
  while (1)
  {
    v7 = a2[v4 + 1];
    v8 = (const unsigned __int8 *)&a2[v4] + v7;
    result = flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)a1, v8 + 4);
    if (!(_DWORD)result)
      return result;
    v10 = v7 - *((int *)v8 + 1);
    v11 = *(unsigned __int16 *)((char *)&a2[v4 + 1] + v10);
    if (v11 >= 5)
    {
      if (*(_WORD *)((char *)&a2[v4 + 2] + v10))
      {
        result = 0;
        v12 = *(_QWORD *)(a1 + 8);
        if (v12 < 9
          || v12 - 8 < (unint64_t)&v6[v4] + v7 + *(unsigned __int16 *)((char *)&a2[v4 + 2] + v10) - *(_QWORD *)a1)
        {
          return result;
        }
      }
      if (v11 >= 7)
      {
        if (*(_WORD *)((char *)&a2[v4 + 2] + v10 + 2))
        {
          result = 0;
          v13 = *(_QWORD *)(a1 + 8);
          if (v13 < 9
            || v13 - 8 < (unint64_t)&v6[v4]
                       + v7
                       + *(unsigned __int16 *)((char *)&a2[v4 + 2] + v10 + 2)
                       - *(_QWORD *)a1)
          {
            return result;
          }
        }
      }
    }
    result = flatbuffers::Table::VerifyOffset((flatbuffers::Table *)(v8 + 4), (const flatbuffers::Verifier *)a1, 8u);
    if (!(_DWORD)result)
      return result;
    if (v11 >= 9 && *(_WORD *)((char *)&a2[v4 + 3] + v10))
    {
      v14 = v7 + *(unsigned __int16 *)((char *)&a2[v4 + 3] + v10);
      v15 = (const unsigned __int8 *)&a2[v4 + 1] + v14 + *(unsigned int *)((char *)&a2[v4 + 1] + v14);
    }
    else
    {
      v15 = 0;
    }
    result = flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)a1, v15);
    if (!(_DWORD)result)
      return result;
    result = flatbuffers::Table::VerifyOffset((flatbuffers::Table *)(v8 + 4), (const flatbuffers::Verifier *)a1, 0xAu);
    if (!(_DWORD)result)
      return result;
    v16 = (char *)&a2[v4] + v7 - *((int *)v8 + 1);
    if (*((unsigned __int16 *)v16 + 2) >= 0xBu && (v17 = *((unsigned __int16 *)v16 + 7)) != 0)
      v18 = (const unsigned __int8 *)&a2[v4 + 1] + v7 + v17 + *(unsigned int *)((char *)&a2[v4 + 1] + v7 + v17);
    else
      v18 = 0;
    result = flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)a1, v18);
    if (!(_DWORD)result)
      return result;
    result = flatbuffers::Table::VerifyOffset((flatbuffers::Table *)(v8 + 4), (const flatbuffers::Verifier *)a1, 0xCu);
    if (!(_DWORD)result)
      return result;
    v19 = (char *)&a2[v4] + v7 - *((int *)v8 + 1);
    if (*((unsigned __int16 *)v19 + 2) >= 0xDu)
    {
      v20 = *((unsigned __int16 *)v19 + 8);
      if (v20)
      {
        result = FlatbufferSymbols::SourceInfo::Verify((FlatbufferSymbols::SourceInfo *)((char *)&a2[v4 + 1]+ v7+ v20+ *(unsigned int *)((char *)&a2[v4 + 1] + v7 + v20)), (flatbuffers::Verifier *)a1);
        if (!(_DWORD)result)
          return result;
      }
    }
    result = flatbuffers::Table::VerifyOffset((flatbuffers::Table *)(v8 + 4), (const flatbuffers::Verifier *)a1, 0xEu);
    if (!(_DWORD)result)
      return result;
    v21 = 0;
    v22 = *((int *)v8 + 1);
    v23 = (char *)&a2[v4] + v7 - v22;
    if (*((unsigned __int16 *)v23 + 2) >= 0xFu)
    {
      v24 = *((unsigned __int16 *)v23 + 9);
      if (!v24)
        goto LABEL_34;
      result = flatbuffers::Verifier::VerifyVectorOrString((flatbuffers::Verifier *)a1, (const unsigned __int8 *)&a2[v4 + 1] + v7 + v24 + *(unsigned int *)((char *)&a2[v4 + 1] + v7 + v24), 4uLL, 0);
      if (!(_DWORD)result)
        return result;
      v21 = 0;
      v22 = *((int *)v8 + 1);
      if (*(unsigned __int16 *)((char *)&a2[v4 + 1] + v7 - v22) >= 0xFu)
      {
LABEL_34:
        v25 = *(unsigned __int16 *)((char *)a2 + v7 + v4 * 4 - v22 + 18);
        if (v25)
          v21 = (uint64_t)&a2[v4 + 1] + v7 + v25 + *(unsigned int *)((char *)&a2[v4 + 1] + v7 + v25);
        else
          v21 = 0;
      }
    }
    result = flatbuffers::Verifier::VerifyVectorOfTables<FlatbufferSymbols::InlineSymbol>(a1, v21);
    if (!(_DWORD)result)
      return result;
    v26 = (char *)&a2[v4] + v7 - *((int *)v8 + 1);
    if (*((unsigned __int16 *)v26 + 2) >= 0x11u)
    {
      v27 = *((unsigned __int16 *)v26 + 10);
      if (v27)
      {
        result = 0;
        v28 = *(_QWORD *)(a1 + 8);
        if (v28 < 9 || v28 - 8 < (unint64_t)&v6[v4] + v7 + v27 - *(_QWORD *)a1)
          return result;
      }
    }
    --*(_DWORD *)(a1 + 16);
    ++v5;
    ++v4;
    if (v5 >= *a2)
      return 1;
  }
}

BOOL FlatbufferSymbols::SourceInfo::Verify(FlatbufferSymbols::SourceInfo *this, flatbuffers::Verifier *a2)
{
  _BOOL8 result;
  unsigned __int16 *v5;
  uint64_t v6;
  const unsigned __int8 *v7;
  unsigned __int16 *v8;
  unsigned int v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;

  result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (v6 = v5[2]) != 0)
        v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      else
        v7 = 0;
      result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        v8 = (unsigned __int16 *)((char *)this - *(int *)this);
        v9 = *v8;
        if (v9 < 7)
          goto LABEL_28;
        if (!v8[3]
          || (result = 0, v10 = *((_QWORD *)a2 + 1), v10 >= 5)
          && v10 - 4 >= (unint64_t)this + v8[3] - *(_QWORD *)a2)
        {
          if (v9 < 9)
            goto LABEL_28;
          if (!v8[4]
            || (result = 0, v11 = *((_QWORD *)a2 + 1), v11 >= 5)
            && v11 - 4 >= (unint64_t)this + v8[4] - *(_QWORD *)a2)
          {
            if (v9 < 0xB
              || (!v8[5]
               || (result = 0, v12 = *((_QWORD *)a2 + 1), v12 >= 5)
               && v12 - 4 >= (unint64_t)this + v8[5] - *(_QWORD *)a2)
              && (v9 < 0xD
               || (!v8[6]
                || (result = 0, v13 = *((_QWORD *)a2 + 1), v13 >= 9)
                && v13 - 8 >= (unint64_t)this + v8[6] - *(_QWORD *)a2)
               && (v9 < 0xF
                || (v14 = v8[7]) == 0
                || (result = 0, v15 = *((_QWORD *)a2 + 1), v15 >= 5)
                && v15 - 4 >= (unint64_t)this + v14 - *(_QWORD *)a2)))
            {
LABEL_28:
              --*((_DWORD *)a2 + 4);
              return 1;
            }
          }
        }
      }
    }
  }
  return result;
}

id CopyCleanSegmentName(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = a1;
  if (objc_msgSend(v1, "hasSuffix:", CFSTR(" SEGMENT")))
  {
    os_unfair_lock_lock(&stru_1ED1DD82C);
    v2 = (void *)qword_1ED1DD838;
    if (!qword_1ED1DD838)
    {
      v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 8);
      v4 = (void *)qword_1ED1DD838;
      qword_1ED1DD838 = v3;

      v2 = (void *)qword_1ED1DD838;
    }
    objc_msgSend(v2, "objectForKeyedSubscript:", v1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" SEGMENT"), &stru_1E714A250);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      SACachedNSString(v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)qword_1ED1DD838, "setObject:forKeyedSubscript:", v5, v1);
    }
    os_unfair_lock_unlock(&stru_1ED1DD82C);
  }
  else
  {
    SACachedNSString(v1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

void sub_1B9C3DBFC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9C3E2CC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9C3F0FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9C3F620(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1B9C3FD58(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9C3FFA8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9C402F4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9C406B4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9C40E04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  void *v36;
  uint64_t v37;

  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a26, 8);
  objc_sync_exit(v36);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose((const void *)(v37 - 184), 8);
  _Block_object_dispose((const void *)(v37 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_1B9C417CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  void *v19;

  objc_sync_exit(v19);
  _Unwind_Resume(a1);
}

void sub_1B9C41B30(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9C41E1C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9C41EDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B9C42160(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B9C4233C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B9C42418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B9C4266C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B9C42A74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B9C42CE8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9C4368C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9C4381C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9C438F8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9C4396C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9C43BD4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9C449D8(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  _Block_object_dispose((const void *)(v2 - 176), 8);
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9C44CBC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9C44E40(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9C45268(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9C45888(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  void *v31;

  objc_sync_exit(v31);
  _Unwind_Resume(a1);
}

void sub_1B9C45AEC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9C45D08(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9C4600C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1B9C46148(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9C468BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id obj, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  void *v37;

  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a37, 8);
  objc_sync_exit(v37);
  _Unwind_Resume(a1);
}

void sub_1B9C46B48(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9C47F6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  uint64_t v35;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 192), 8);
  _Unwind_Resume(a1);
}

id _SABinaryCreateLoadInfoArrayFromDyldImageInfos(uint64_t a1, unsigned int a2, void *a3, NSObject *a4, unsigned int a5, int a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint8_t buf[4];
  unsigned int v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  if (a1 && a2)
  {
    if (a4 || !a5)
      goto LABEL_12;
    a6 = *__error();
    _sa_logt();
    a4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(a4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v42 = a5;
      _os_log_error_impl(&dword_1B9BE0000, a4, OS_LOG_TYPE_ERROR, "%d text exec load infos, but NULL pointer", buf, 8u);
    }

    *__error() = a6;
    _SASetCrashLogMessage(3125, "%d text exec load infos, but NULL pointer", v11, v12, v13, v14, v15, v16, a5);
    _os_crash();
    __break(1u);
  }
  v17 = 0;
  if (!a4 || !a5)
    goto LABEL_28;
  if (!a1 && a2)
  {
    v32 = *__error();
    _sa_logt();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v42 = a2;
      _os_log_error_impl(&dword_1B9BE0000, v33, OS_LOG_TYPE_ERROR, "%d load infos, but NULL pointer", buf, 8u);
    }

    *__error() = v32;
    _SASetCrashLogMessage(3124, "%d load infos, but NULL pointer", v34, v35, v36, v37, v38, v39, a2);
    _os_crash();
    __break(1u);
  }
LABEL_12:
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a5 + a2);
  if (a2)
  {
    v19 = 0;
    v20 = 24 * a2;
    do
    {
      uuidForBytes(a1 + v19 + 8);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      if (!v19 && (a6 & 1) == 0)
      {
        if (objc_msgSend(v40, "isAbsolutePath"))
          v22 = v40;
        else
          v22 = 0;
      }
      +[SABinary binaryWithUUID:absolutePath:](SABinary, "binaryWithUUID:absolutePath:", v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[SABinaryLoadInfo binaryLoadInfoWithBinary:loadAddress:isInKernelAddressSpace:exclave:]((uint64_t)SABinaryLoadInfo, v23, *(_QWORD *)(a1 + v19), a6, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v24);

      v19 += 24;
    }
    while (v20 != v19);
  }
  if (a5)
  {
    v25 = a5;
    v26 = (uint64_t)&a4[1];
    do
    {
      uuidForBytes(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[SABinary binaryWithUUID:absolutePath:](SABinary, "binaryWithUUID:absolutePath:", v27, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[SABinary segmentWithCleanName:](v28, CFSTR("__TEXT_EXEC"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v29)
      {
        +[SASegment segmentWithBinary:name:length:]((uint64_t)SASegment, v28, CFSTR("__TEXT_EXEC"), 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[SABinary addSegment:](v28, v29);
      }
      +[SABinaryLoadInfo binaryLoadInfoWithSegment:loadAddress:isInKernelAddressSpace:exclave:](SABinaryLoadInfo, v29, *(_QWORD *)(v26 - 8), a6, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v30);

      v26 += 24;
      --v25;
    }
    while (v25);
  }
  if ((a6 & 1) != 0)
    objc_msgSend(v18, "sortUsingComparator:", &__block_literal_global_665);
  v17 = (void *)objc_msgSend(v18, "copy");

LABEL_28:
  return v17;
}

void sub_1B9C48C00(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9C48D20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B9C49528(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9C495FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9C49708(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1B9C49EB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_1B9C4A04C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1B9C4AD3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1B9C4B904(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1B9C4D150(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9C4D2E0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id SAFormattedBytes(unint64_t a1, int a2, int a3)
{
  return SAFormattedBytesEx(a1, a2, a3, 1, 0);
}

id SAFormattedBytesEx(unint64_t a1, int a2, int a3, int a4, unint64_t a5)
{
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  const char *v11;
  id v13;
  const char *v14;
  const char *v15;
  void *v16;
  unint64_t v17;
  id v18;
  const char *v19;
  double v20;
  id v21;
  const char *v22;

  v8 = 1000;
  if (a2)
  {
    v8 = 1024;
    v9 = 0x100000;
  }
  else
  {
    v9 = 1000000;
  }
  if (a2)
    v10 = 0x40000000;
  else
    v10 = 1000000000;
  if (a3)
    v11 = "i";
  else
    v11 = "";
  if (10 * v8 <= a1 || v8 <= a5)
  {
    if (10 * v9 <= a1 || v9 <= a5)
    {
      v20 = (double)a1;
      v21 = objc_alloc(MEMORY[0x1E0CB3940]);
      v22 = " ";
      if (!a4)
        v22 = "";
      if (10 * v10 <= a1 || v10 <= a5)
      {
        if (floor(v20 / (double)v10) == v20 / (double)v10)
          v16 = (void *)objc_msgSend(v21, "initWithFormat:", CFSTR("%.0f%sG%sB"), v20 / (double)v10, v22, v11);
        else
          v16 = (void *)objc_msgSend(v21, "initWithFormat:", CFSTR("%.2f%sG%sB"), v20 / (double)v10, v22, v11);
      }
      else if (floor(v20 / (double)v9) == v20 / (double)v9)
      {
        v16 = (void *)objc_msgSend(v21, "initWithFormat:", CFSTR("%.0f%sM%sB"), v20 / (double)v9, v22, v11);
      }
      else
      {
        v16 = (void *)objc_msgSend(v21, "initWithFormat:", CFSTR("%.2f%sM%sB"), v20 / (double)v9, v22, v11);
      }
    }
    else
    {
      v17 = a1 / v8;
      v18 = objc_alloc(MEMORY[0x1E0CB3940]);
      v19 = " ";
      if (!a4)
        v19 = "";
      v16 = (void *)objc_msgSend(v18, "initWithFormat:", CFSTR("%lld%sK%sB"), v17, v19, v11);
    }
  }
  else
  {
    v13 = objc_alloc(MEMORY[0x1E0CB3940]);
    v14 = "  ";
    if (!a4)
      v14 = "";
    v15 = " ";
    if ((a4 & a3) == 0)
      v15 = "";
    v16 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("%lld%s%sB"), a1, v14, v15);
  }
  return v16;
}

id SAFormattedBytesDouble(int a1, int a2, double a3)
{
  double v4;
  double v5;
  double v6;
  const char *v7;
  double v9;
  id v10;
  const char *v11;
  void *v12;
  double v13;
  id v14;
  id v15;

  v4 = 1000.0;
  if (a1)
  {
    v4 = 1024.0;
    v5 = 1048576.0;
  }
  else
  {
    v5 = 1000000.0;
  }
  if (a1)
    v6 = 1073741820.0;
  else
    v6 = 1000000000.0;
  if (a2)
    v7 = "i";
  else
    v7 = "";
  if (v4 * 10.0 <= a3)
  {
    if (v5 * 10.0 <= a3)
    {
      v15 = objc_alloc(MEMORY[0x1E0CB3940]);
      if (v6 * 10.0 <= a3)
      {
        if (floor(a3 / v6) == a3 / v6)
          v12 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("%.0f G%sB"), a3 / v6, v7);
        else
          v12 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("%.2f G%sB"), a3 / v6, v7);
      }
      else if (floor(a3 / v5) == a3 / v5)
      {
        v12 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("%.0f M%sB"), a3 / v5, v7);
      }
      else
      {
        v12 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("%.2f M%sB"), a3 / v5, v7);
      }
    }
    else
    {
      v13 = a3 / v4;
      v14 = objc_alloc(MEMORY[0x1E0CB3940]);
      if (floor(v13) == v13)
        v12 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("%.0f K%sB"), *(_QWORD *)&v13, v7);
      else
        v12 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("%.2f K%sB"), *(_QWORD *)&v13, v7);
    }
  }
  else
  {
    v9 = floor(a3);
    v10 = objc_alloc(MEMORY[0x1E0CB3940]);
    v11 = " ";
    if (!a2)
      v11 = "";
    if (v9 == a3)
      v12 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("%.0f  %sB"), *(_QWORD *)&a3, v11);
    else
      v12 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("%.2f  %sB"), *(_QWORD *)&a3, v11);
  }
  return v12;
}

uint64_t CopyLoadInfosForLiveProcess(_BOOL8 a1, uint64_t a2, id *a3, _QWORD *a4, id *a5, _QWORD *a6, uint64_t *a7, int a8)
{
  id *v12;
  void *v14;
  uint64_t v15;
  int InfosForDyldSnapshot;
  int v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  int v22;
  NSObject *v23;
  uint64_t result;
  uint64_t v25;
  char v26;
  int v27;
  NSObject *v28;
  NSObject *v29;
  int *v30;
  uint64_t SymbolicatorForLiveProcess;
  uint64_t v32;
  uint64_t v33;
  int v34;
  int v35;
  NSObject *v36;
  NSObject *v37;
  int v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t AOutSymbolOwner;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  char v70;
  int v71;
  NSObject *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  int v79;
  NSObject *v80;
  int v81;
  NSObject *v82;
  char *v83;
  void *v84;
  char *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  int v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  char v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  uint8_t buf[4];
  int v104;
  __int16 v105;
  char *v106;
  __int16 v107;
  void *v108;
  __int16 v109;
  void *v110;
  __int16 v111;
  void *v112;
  __int16 v113;
  void *v114;
  uint64_t v115;

  v12 = a3;
  v14 = (void *)a1;
  v115 = *MEMORY[0x1E0C80C00];
  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = 0;
  if (a5)
    *a5 = 0;
  if (a6)
    *a6 = 0;
  if (a7)
    *a7 = 0;
  if (!a1)
    goto LABEL_27;
  v15 = CopyDyldSnapshotForPid(a1);
  if (!v15)
  {
    v22 = kill((pid_t)v14, 0);
    v17 = *__error();
    _sa_logt();
    v23 = objc_claimAutoreleasedReturnValue();
    v18 = v23;
    if (v22)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        v104 = (int)v14;
        _os_log_debug_impl(&dword_1B9BE0000, v18, OS_LOG_TYPE_DEBUG, "[%d]: Process no longer alive, unable to inspect for load infos", buf, 8u);
      }

      *__error() = v17;
      return 4294967294;
    }
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    *(_DWORD *)buf = 67109120;
    v104 = (int)v14;
    v19 = "[%d]: Process alive, but unable to inspect for load infos via dyld introspection, trying CoreSymbolication";
    v20 = v18;
    v21 = 8;
    goto LABEL_73;
  }
  InfosForDyldSnapshot = _CopyLoadInfosForDyldSnapshot(v15, (int)v14, 0, a2, v12, a5, a6, a7);
  dyld_process_snapshot_dispose();
  if (InfosForDyldSnapshot)
  {
    v17 = *__error();
    _sa_logt();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
LABEL_26:

      *__error() = v17;
LABEL_27:
      SymbolicatorForLiveProcess = CreateSymbolicatorForLiveProcess((_BOOL8)v14, a8);
      v33 = v32;
      if (!CSIsNull())
      {
        v38 = *__error();
        _sa_logt();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          v104 = (int)v14;
          _os_log_debug_impl(&dword_1B9BE0000, v39, OS_LOG_TYPE_DEBUG, "[%d]: Inspected live process via CS", buf, 8u);
        }

        *__error() = v38;
        if (a5)
        {
          +[SASharedCache sharedCacheWithCSSymbolicator:]();
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        if (v12)
        {
          v40 = objc_opt_self();
          +[SABinaryLoadInfo binaryLoadInfoForSymbolicator:isKernel:dataGatheringOptions:excludeRange:ignoreSharedCache:](v40, SymbolicatorForLiveProcess, v33, (_DWORD)v14 == 0, a2);
          *v12 = (id)objc_claimAutoreleasedReturnValue();
        }
        if (a7)
          *a7 = CSSymbolicatorGetArchitecture();
        if (a6)
        {
          AOutSymbolOwner = CSSymbolicatorGetAOutSymbolOwner();
          v43 = v42;
          if ((CSIsNull() & 1) == 0)
          {
            +[SABinary binaryWithSymbolOwner:fromDisk:]((uint64_t)SABinary, AOutSymbolOwner, v43, 0);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = v44;
            if (v44)
              *a6 = objc_retainAutorelease(v44);

          }
        }
        goto LABEL_44;
      }
      v34 = kill((pid_t)v14, 0);
      v35 = *__error();
      _sa_logt();
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = v36;
      if (v34)
      {
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          v104 = (int)v14;
          _os_log_debug_impl(&dword_1B9BE0000, v37, OS_LOG_TYPE_DEBUG, "[%d]: Process no longer alive, unable to inspect for load infos", buf, 8u);
        }
      }
      else if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v104 = (int)v14;
        _os_log_error_impl(&dword_1B9BE0000, v37, OS_LOG_TYPE_ERROR, "[%d]: Process alive, but unable to inspect for load infos via CoreSymbolication", buf, 8u);
      }

      *__error() = v35;
      return 0xFFFFFFFFLL;
    }
    *(_DWORD *)buf = 67109376;
    v104 = (int)v14;
    v105 = 1024;
    LODWORD(v106) = InfosForDyldSnapshot;
    v19 = "[%d]: Failed to get load infos via dyld introspection (%d), trying CoreSymbolication";
    v20 = v18;
    v21 = 14;
LABEL_73:
    _os_log_error_impl(&dword_1B9BE0000, v20, OS_LOG_TYPE_ERROR, v19, buf, v21);
    goto LABEL_26;
  }
  if ((int)SACompareDyldToCSLevel() < 1)
    return 0;
  v91 = CreateSymbolicatorForLiveProcess((_BOOL8)v14, a8);
  v92 = v25;
  v26 = CSIsNull();
  v27 = *__error();
  _sa_logt();
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if ((v26 & 1) != 0)
  {
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v104 = (int)v14;
      _os_log_error_impl(&dword_1B9BE0000, v29, OS_LOG_TYPE_ERROR, "[%d]: Unable to inspect live process via CS to compare to dyld", buf, 8u);
    }

    v30 = __error();
    result = 0;
    *v30 = v27;
    return result;
  }
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    v104 = (int)v14;
    _os_log_debug_impl(&dword_1B9BE0000, v29, OS_LOG_TYPE_DEBUG, "[%d]: Inspected live process via CS to compare to dyld", buf, 8u);
  }

  *__error() = v27;
  v90 = (int)v14;
  if (a5)
  {
    +[SASharedCache sharedCacheWithCSSymbolicator:]();
    v46 = (id)objc_claimAutoreleasedReturnValue();
    if (v46 != *a5)
    {
      v79 = *__error();
      _sa_logt();
      v80 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v46, "debugDescription");
        v83 = (char *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*a5, "debugDescription");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109634;
        v104 = (int)v14;
        v105 = 2112;
        v106 = v83;
        v107 = 2112;
        v108 = v84;
        _os_log_fault_impl(&dword_1B9BE0000, v80, OS_LOG_TYPE_FAULT, "[%d]: CS shared cache %@ vs dyld shared cache %@", buf, 0x1Cu);

      }
      *__error() = v79;
    }

  }
  if (!v12)
    goto LABEL_44;
  v47 = objc_opt_self();
  +[SABinaryLoadInfo binaryLoadInfoForSymbolicator:isKernel:dataGatheringOptions:excludeRange:ignoreSharedCache:](v47, v91, v92, 0, a2);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "count");
  if (v49 != objc_msgSend(*v12, "count"))
  {
    v81 = *__error();
    _sa_logt();
    v82 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v48, "debugDescription");
      v85 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*v12, "debugDescription");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109634;
      v104 = (int)v14;
      v105 = 2112;
      v106 = v85;
      v107 = 2112;
      v108 = v86;
      _os_log_fault_impl(&dword_1B9BE0000, v82, OS_LOG_TYPE_FAULT, "[%d]: CS load infos %@ vs dyld load infos %@", buf, 0x1Cu);

    }
    *__error() = v81;
  }
  v50 = objc_msgSend(v48, "count");
  if (v50 != objc_msgSend(*v12, "count") || !objc_msgSend(v48, "count"))
    goto LABEL_78;
  v51 = 0;
  v88 = v48;
  while (1)
  {
    objc_msgSend(v48, "objectAtIndexedSubscript:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "loadAddress");
    objc_msgSend(*v12, "objectAtIndexedSubscript:", v51);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (v53 != objc_msgSend(v54, "loadAddress"))
      break;
    objc_msgSend(v48, "objectAtIndexedSubscript:", v51);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "binary");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "uuid");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v12, "objectAtIndexedSubscript:", v51);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "binary");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "uuid");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v56, "isEqual:"))
    {
      objc_msgSend(v48, "objectAtIndexedSubscript:", v51);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "segment");
      v98 = objc_claimAutoreleasedReturnValue();
      if (v98
        || (objc_msgSend(*v12, "objectAtIndexedSubscript:", v51),
            v87 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v87, "segment"),
            (v89 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        objc_msgSend(v48, "objectAtIndexedSubscript:", v51);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "segment");
        v96 = v54;
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "name");
        v95 = v55;
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*v12, "objectAtIndexedSubscript:", v51);
        v94 = v56;
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "segment");
        v61 = v14;
        v62 = v12;
        v63 = v52;
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "name");
        v65 = v57;
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v97 = objc_msgSend(v59, "isEqual:", v66);

        v57 = v65;
        v52 = v63;
        v12 = v62;
        v14 = v61;

        v48 = v88;
        v56 = v94;

        v55 = v95;
        v54 = v96;

        v67 = (void *)v98;
        if (!v98)
        {
LABEL_66:
          v68 = v48;
          v69 = v67;

          v67 = v69;
          v48 = v68;
        }

        LODWORD(v14) = v90;
        v70 = v97;
        goto LABEL_68;
      }
      v89 = 0;
      v97 = 1;
      v67 = 0;
      goto LABEL_66;
    }
    v70 = 0;
LABEL_68:

    if ((v70 & 1) == 0)
      goto LABEL_75;
    if ((unint64_t)++v51 >= objc_msgSend(v48, "count"))
      goto LABEL_78;
  }

LABEL_75:
  v71 = *__error();
  _sa_logt();
  v72 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v72, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v48, "objectAtIndexedSubscript:", v51);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "debugDescription");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v12, "objectAtIndexedSubscript:", v51);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "debugDescription");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "debugDescription");
    v76 = v48;
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v12, "debugDescription");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67110402;
    v104 = (int)v14;
    v105 = 2048;
    v106 = v51;
    v107 = 2112;
    v108 = v73;
    v109 = 2112;
    v110 = v75;
    v111 = 2112;
    v112 = v77;
    v113 = 2112;
    v114 = v78;
    _os_log_fault_impl(&dword_1B9BE0000, v72, OS_LOG_TYPE_FAULT, "[%d]: index %lu CS load info %@ vs dyld %@\n%@\nvs\n%@", buf, 0x3Au);

    v48 = v76;
  }

  *__error() = v71;
LABEL_78:

LABEL_44:
  CSRelease();
  return 0;
}

uint64_t CreateSymbolicatorForLiveProcess(_BOOL8 a1, int a2)
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void (**v8)(void);
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  uint64_t v18;
  _QWORD block[6];
  _BOOL4 v20;
  int v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double *v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[4];
  _BOOL4 v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  int v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  double v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v28 = 0;
  v29 = (double *)&v28;
  v30 = 0x2020000000;
  v31 = 0;
  if (qword_1ED1DD8D0 != -1)
    dispatch_once(&qword_1ED1DD8D0, &__block_literal_global_5);
  v4 = (id)qword_1ED1DD8C8;
  objc_sync_enter(v4);
  v5 = qword_1ED1DD8C8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend((id)v5, "containsObject:", v6);

  objc_sync_exit(v4);
  if ((v5 & 1) != 0 || _AvoidSuspendingPid(a1))
  {
    v7 = 0;
  }
  else
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x3010000000;
    v26 = 0;
    v27 = 0;
    v25 = &unk_1B9CEFD9F;
    if (a1)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __CreateSymbolicatorForLiveProcess_block_invoke_2;
      block[3] = &unk_1E7148910;
      v20 = a1;
      v21 = a2 | 0x80000;
      block[4] = &v22;
      block[5] = &v28;
      v8 = (void (**)(void))dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, block);
      v8[2]();

    }
    else
    {
      v9 = CSSymbolicatorCreateWithMachKernelFlagsAndNotification();
      v10 = v23;
      v23[4] = v9;
      v10[5] = v11;
    }
    if (CSIsNull())
    {
      v12 = (id)qword_1ED1DD8C8;
      objc_sync_enter(v12);
      v13 = (void *)qword_1ED1DD8C8;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v14);

      objc_sync_exit(v12);
    }
    else if (a1)
    {
      ++_MergedGlobals_6;
      *(double *)&qword_1ED1DD8D8 = v29[3] + *(double *)&qword_1ED1DD8D8;
      v15 = *__error();
      _sa_logt();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v18 = *((_QWORD *)v29 + 3);
        *(_DWORD *)buf = 67110144;
        v33 = a1;
        v34 = 2048;
        v35 = v18;
        v36 = 1024;
        v37 = _MergedGlobals_6;
        v38 = 2048;
        v39 = qword_1ED1DD8D8;
        v40 = 2048;
        v41 = *(double *)&qword_1ED1DD8D8 / (double)_MergedGlobals_6;
        _os_log_debug_impl(&dword_1B9BE0000, v16, OS_LOG_TYPE_DEBUG, "[%d]: Inspected live process via cs introspection in %fs (%d totaling %fs, %fs avg)", buf, 0x2Cu);
      }

      *__error() = v15;
    }
    v7 = v23[4];
    _Block_object_dispose(&v22, 8);
  }
  _Block_object_dispose(&v28, 8);
  return v7;
}

void sub_1B9C57480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t CreateSymbolOwnerForUUIDAtPath(void *a1, void *a2, int a3)
{
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  id v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t j;
  void *v29;
  char v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  char v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  int v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  NSObject *v55;
  uint64_t v56;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t (**v73)(_QWORD, _QWORD);
  void *v74;
  void *v75;
  uint64_t v76;
  id v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  id v83;
  id v84;
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
  _QWORD v97[4];
  int v98;
  __int128 v99;
  __int128 v100;
  _BYTE v101[128];
  uint64_t v102;
  uint8_t buf[4];
  void *v104;
  __int16 v105;
  id v106;
  _BYTE v107[128];
  uint64_t v108;
  _BYTE v109[128];
  _BYTE v110[128];
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v100 = 0uLL;
  objc_msgSend(a1, "getUUIDBytes:", &v100);
  v97[0] = MEMORY[0x1E0C809B0];
  v97[1] = 3221225472;
  v97[2] = __CreateSymbolOwnerForUUIDAtPath_block_invoke;
  v97[3] = &__block_descriptor_52_e32___CSTypeRef_QQ_16__0__NSString_8l;
  v98 = a3 | 0x80000;
  v99 = v100;
  v73 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x1BCCCC450](v97);
  v6 = ((uint64_t (**)(_QWORD, id))v73)[2](v73, v5);
  if ((CSIsNull() & 1) != 0)
  {
    if (objc_msgSend(v5, "isAbsolutePath"))
    {
      objc_msgSend(v5, "substringFromIndex:", 1);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = v5;
    }
    v75 = v7;
    SAGetHomeDirectoryURL();
    v8 = objc_claimAutoreleasedReturnValue();
    v64 = (void *)v8;
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:relativeToURL:", CFSTR("Library"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "absoluteURL");
      v10 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "URLsForDirectory:inDomains:", 5, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
    {
      v95 = 0u;
      v96 = 0u;
      v93 = 0u;
      v94 = 0u;
      v13 = v11;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v93, v110, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v94;
        while (2)
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v94 != v16)
              objc_enumerationMutation(v13);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v93 + 1) + 8 * i), "isEqual:", v10) & 1) != 0)
            {
              v12 = v13;
              goto LABEL_19;
            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v93, v110, 16);
          if (v15)
            continue;
          break;
        }
      }

      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v13, "count") + 1);
      objc_msgSend(v12, "addObject:", v10);
      objc_msgSend(v12, "addObjectsFromArray:", v13);
LABEL_19:

    }
    v63 = (void *)v10;
    v65 = v5;
    v91 = 0u;
    v92 = 0u;
    v89 = 0u;
    v90 = 0u;
    v18 = v12;
    v59 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v89, v109, 16);
    if (v59)
    {
      v19 = *(_QWORD *)v90;
      v20 = *MEMORY[0x1E0C99A90];
      v76 = *MEMORY[0x1E0C999D0];
      v21 = 0x1E0C99000uLL;
      v22 = 0x1E0C99000uLL;
      v61 = *MEMORY[0x1E0C99A90];
      v62 = v18;
      v58 = *(_QWORD *)v90;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v90 != v19)
            objc_enumerationMutation(v18);
          v60 = v23;
          objc_msgSend(*(id *)(v22 + 3736), "fileURLWithPath:isDirectory:relativeToURL:", CFSTR("Developer/Xcode"), 1, *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * v23));
          v24 = objc_claimAutoreleasedReturnValue();
          v108 = v20;
          objc_msgSend(*(id *)(v21 + 3360), "arrayWithObjects:count:", &v108, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = (void *)v24;
          objc_msgSend(v74, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v24, v25, 1, 0);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          v87 = 0u;
          v88 = 0u;
          v85 = 0u;
          v86 = 0u;
          v27 = v26;
          v72 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v85, v107, 16);
          if (v72)
          {
            v71 = *(_QWORD *)v86;
            v67 = v27;
            do
            {
              for (j = 0; j != v72; ++j)
              {
                if (*(_QWORD *)v86 != v71)
                  objc_enumerationMutation(v27);
                v29 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * j);
                v83 = 0;
                v84 = 0;
                v30 = objc_msgSend(v29, "getResourceValue:forKey:error:", &v84, v20, &v83);
                v31 = v84;
                v32 = v83;
                if ((v30 & 1) != 0)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0
                    && objc_msgSend(v31, "containsString:", CFSTR("DeviceSupport")))
                  {
                    v69 = v31;
                    v70 = v32;
                    v68 = j;
                    v102 = v76;
                    objc_msgSend(*(id *)(v21 + 3360), "arrayWithObjects:count:", &v102, 1);
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v74, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v29, v33, 1, 0);
                    v34 = (void *)objc_claimAutoreleasedReturnValue();

                    v81 = 0u;
                    v82 = 0u;
                    v79 = 0u;
                    v80 = 0u;
                    v35 = v34;
                    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v79, v101, 16);
                    if (v36)
                    {
                      v37 = v36;
                      v38 = *(_QWORD *)v80;
                      do
                      {
                        v39 = 0;
                        do
                        {
                          if (*(_QWORD *)v80 != v38)
                            objc_enumerationMutation(v35);
                          v40 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v39);
                          v77 = 0;
                          v78 = 0;
                          v41 = objc_msgSend(v40, "getResourceValue:forKey:error:", &v78, v76, &v77);
                          v42 = v78;
                          v43 = v77;
                          if ((v41 & 1) != 0)
                          {
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v42, "BOOLValue"))
                            {
                              objc_msgSend(*(id *)(v22 + 3736), "fileURLWithPath:relativeToURL:", v75, v40);
                              v44 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v44, "path");
                              v45 = (void *)objc_claimAutoreleasedReturnValue();

                              if (v45 && objc_msgSend(v74, "fileExistsAtPath:", v45))
                              {
                                v6 = ((uint64_t (**)(_QWORD, void *))v73)[2](v73, v45);
                                if ((CSIsNull() & 1) == 0)
                                  goto LABEL_68;
                              }
                              else
                              {
                                v48 = (void *)MEMORY[0x1E0C99E98];
                                objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:relativeToURL:", CFSTR("Symbols"), v40);
                                v49 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v48, "fileURLWithPath:relativeToURL:", v75, v49);
                                v50 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v50, "path");
                                v51 = objc_claimAutoreleasedReturnValue();

                                if (v51)
                                {
                                  if (objc_msgSend(v74, "fileExistsAtPath:", v51))
                                  {
                                    v6 = v73[2](v73, v51);
                                    if (!CSIsNull())
                                    {
                                      v45 = (void *)v51;
LABEL_68:

                                      v18 = v62;
                                      goto LABEL_69;
                                    }
                                  }
                                  v45 = (void *)v51;
                                }
                                else
                                {
                                  v45 = 0;
                                }
                              }

                              v22 = 0x1E0C99000;
                            }
                          }
                          else
                          {
                            v46 = *__error();
                            _sa_logt();
                            v47 = objc_claimAutoreleasedReturnValue();
                            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                            {
                              *(_DWORD *)buf = 138412546;
                              v104 = v40;
                              v105 = 2112;
                              v106 = v43;
                              _os_log_error_impl(&dword_1B9BE0000, v47, OS_LOG_TYPE_ERROR, "Error getting isDir for %@: %@", buf, 0x16u);
                            }

                            *__error() = v46;
                          }

                          ++v39;
                        }
                        while (v37 != v39);
                        v52 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v79, v101, 16);
                        v37 = v52;
                      }
                      while (v52);
                    }

                    v20 = v61;
                    v21 = 0x1E0C99000;
                    v27 = v67;
                    j = v68;
                    v31 = v69;
                    v32 = v70;
                  }
                }
                else
                {
                  v53 = j;
                  v54 = *__error();
                  _sa_logt();
                  v55 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    v104 = v29;
                    v105 = 2112;
                    v106 = v32;
                    _os_log_error_impl(&dword_1B9BE0000, v55, OS_LOG_TYPE_ERROR, "Error getting name for %@: %@", buf, 0x16u);
                  }

                  *__error() = v54;
                  j = v53;
                }

              }
              v72 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v85, v107, 16);
            }
            while (v72);
          }

          v23 = v60 + 1;
          v18 = v62;
          v19 = v58;
        }
        while (v60 + 1 != v59);
        v56 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v89, v109, 16);
        v19 = v58;
        v6 = 0;
        v59 = v56;
      }
      while (v56);
    }
    else
    {
      v6 = 0;
    }
LABEL_69:

    v5 = v65;
  }

  return v6;
}

void sub_1B9C57ED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SAGetHomeDirectoryURL()
{
  void *v0;
  void *v1;

  NSHomeDirectoryForUser(CFSTR("mobile"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v0, 1);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = 0;
  }

  return v1;
}

uint64_t CreateSymbolOwnerForArchitectureAtPath(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t SymbolOwner;
  int v7;
  NSObject *v8;
  id v9;
  id v10;
  int v11;
  NSObject *v12;
  int v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;
  uint8_t v19[4];
  id v20;
  __int16 v21;
  int v22;
  _BYTE buf[24];
  void *FamilyName;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = objc_retainAutorelease(v3);
    objc_msgSend(v5, "UTF8String");
    CSSymbolicatorCreateWithPathArchitectureFlagsAndNotification();
    SymbolOwner = CSSymbolicatorGetSymbolOwner();
    if ((CSIsNull() & 1) != 0)
    {
      v7 = *__error();
      _sa_logt();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v5;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = CSSymbolicatorGetSymbolOwnerCountAtTime();
        *(_WORD *)&buf[22] = 2082;
        FamilyName = (void *)CSArchitectureGetFamilyName();
        _os_log_fault_impl(&dword_1B9BE0000, v8, OS_LOG_TYPE_FAULT, "No symbol owner at %@: %zu exist for arch %{public}s", buf, 0x20u);
      }

      *__error() = v7;
    }
    else
    {
      SymbolOwner = CSRetain();
    }
    CSRelease();
  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3010000000;
    v25 = 0;
    v26 = 0;
    FamilyName = &unk_1B9CEFD9F;
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    v9 = objc_retainAutorelease(v3);
    objc_msgSend(v9, "UTF8String");
    v10 = v9;
    CSSymbolicatorForeachSymbolicatorWithPathFlagsAndNotification();
    if (*((_DWORD *)v16 + 6) != 1)
    {
      v11 = *__error();
      _sa_logt();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v14 = *((_DWORD *)v16 + 6);
        *(_DWORD *)v19 = 138412546;
        v20 = v10;
        v21 = 1024;
        v22 = v14;
        _os_log_error_impl(&dword_1B9BE0000, v12, OS_LOG_TYPE_ERROR, "Unable to uniquely identify symbol owner at %@: %d symbol owners exist", v19, 0x12u);
      }

      *__error() = v11;
    }
    SymbolOwner = *(_QWORD *)(*(_QWORD *)&buf[8] + 32);

    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(buf, 8);
  }

  return SymbolOwner;
}

void sub_1B9C582A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t CreateSymbolOwnerForExclaveUUID(void *a1)
{
  uint64_t SymbolOwner;
  _QWORD v3[2];

  v3[0] = 0;
  v3[1] = 0;
  objc_msgSend(a1, "getUUIDBytes:", v3);
  CSSymbolicatorCreateWithExclaveUUIDAndFlags();
  SymbolOwner = 0;
  if ((CSIsNull() & 1) == 0)
  {
    SymbolOwner = CSSymbolicatorGetSymbolOwner();
    if ((CSIsNull() & 1) == 0)
      CSRetain();
    CSRelease();
  }
  return SymbolOwner;
}

uint64_t SASpawnPlatformBinary(const char *a1, char *const *a2, char *const *a3, cpu_type_t *a4, int a5, _DWORD *a6, char a7, _DWORD *a8, char a9, _DWORD *a10)
{
  return _SASpawnPlatformBinaryWithSigningIdentifier(a1, 0, a2, a3, a4, 0, a5, a6, a7, a8, a9, a10);
}

uint64_t _SASpawnPlatformBinaryWithSigningIdentifier(const char *a1, void *a2, char *const *a3, char *const *a4, cpu_type_t *a5, void *a6, int a7, _DWORD *a8, char a9, _DWORD *a10, char a11, _DWORD *a12)
{
  BOOL v17;
  BOOL v18;
  int v19;
  int v20;
  int v21;
  NSObject *v22;
  int v23;
  int v24;
  NSObject *v25;
  const char *v26;
  int v27;
  uint64_t v28;
  int v29;
  int v30;
  NSObject *v31;
  int v32;
  int v33;
  int v34;
  NSObject *v35;
  const char *v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v45;
  int v46;
  NSObject *v47;
  __int16 v48;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  int v54;
  int v55;
  NSObject *v56;
  int v57;
  NSObject *v58;
  int v59;
  NSObject *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  NSObject *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  NSObject *v83;
  int v84;
  const char *v85;
  void *v86;
  char v87;
  pid_t v91;
  id v92;
  posix_spawnattr_t v93;
  posix_spawn_file_actions_t v94;
  uint8_t buf[4];
  void *v96;
  int v97[2];
  int v98[2];
  int v99[2];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)v99 = -1;
  *(_QWORD *)v97 = -1;
  *(_QWORD *)v98 = -1;
  if (a8 && a7)
  {
    v59 = *__error();
    _sa_logt();
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B9BE0000, v60, OS_LOG_TYPE_ERROR, "Cannot specify inheritStdout and provide stdout_out", buf, 2u);
    }

    *__error() = v59;
    _SASetCrashLogMessage(607, "Cannot specify inheritStdout and provide stdout_out", v61, v62, v63, v64, v65, v66, v87);
    _os_crash();
    __break(1u);
    goto LABEL_112;
  }
  if (a10)
    v17 = a9 == 0;
  else
    v17 = 1;
  if (!v17)
  {
LABEL_112:
    v67 = *__error();
    _sa_logt();
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B9BE0000, v68, OS_LOG_TYPE_ERROR, "Cannot specify inheritStderr and provide stderr_out", buf, 2u);
    }

    *__error() = v67;
    _SASetCrashLogMessage(608, "Cannot specify inheritStderr and provide stderr_out", v69, v70, v71, v72, v73, v74, v87);
    _os_crash();
    __break(1u);
    goto LABEL_115;
  }
  if (a12)
    v18 = a11 == 0;
  else
    v18 = 1;
  if (!v18)
  {
LABEL_115:
    v75 = *__error();
    _sa_logt();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B9BE0000, (os_log_t)v28, OS_LOG_TYPE_ERROR, "Cannot specify inheritStdin and provide stdin_out", buf, 2u);
    }

    *__error() = v75;
    _SASetCrashLogMessage(609, "Cannot specify inheritStdin and provide stdin_out", v76, v77, v78, v79, v80, v81, v87);
    _os_crash();
    __break(1u);
    goto LABEL_118;
  }
  v94 = 0;
  v19 = posix_spawn_file_actions_init(&v94);
  if (v19)
  {
    v20 = v19;
    v21 = *__error();
    _sa_logt();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v96) = v20;
      _os_log_error_impl(&dword_1B9BE0000, v22, OS_LOG_TYPE_ERROR, "Unable to create posix file actions: %{errno}d", buf, 8u);
    }

    *__error() = v21;
LABEL_74:
    if ((v99[0] & 0x80000000) == 0)
      close(v99[0]);
    if ((v99[1] & 0x80000000) == 0)
      close(v99[1]);
    if ((v98[0] & 0x80000000) == 0)
      close(v98[0]);
    if ((v98[1] & 0x80000000) == 0)
      close(v98[1]);
    v43 = v97[0];
    if (v97[0] < 0)
      goto LABEL_84;
    goto LABEL_83;
  }
  if (a7)
  {
    v23 = posix_spawn_file_actions_addinherit_np(&v94, 1);
    if (v23)
    {
      v20 = v23;
      v24 = *__error();
      _sa_logt();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v96) = v20;
        v26 = "Unable to inherit stdout: %{errno}d";
LABEL_43:
        _os_log_error_impl(&dword_1B9BE0000, v25, OS_LOG_TYPE_ERROR, v26, buf, 8u);
        goto LABEL_44;
      }
      goto LABEL_44;
    }
LABEL_32:
    LODWORD(v28) = -1;
    goto LABEL_33;
  }
  if (a8)
  {
    if (pipe(v99))
    {
      v20 = *__error();
      v24 = *__error();
      _sa_logt();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v96) = v20;
        v26 = "Unable to open pipe: %{errno}d";
        goto LABEL_43;
      }
LABEL_44:

      *__error() = v24;
      posix_spawn_file_actions_destroy(&v94);
      goto LABEL_74;
    }
    v32 = posix_spawn_file_actions_adddup2(&v94, v99[1], 1);
    if (v32)
    {
      v20 = v32;
      v24 = *__error();
      _sa_logt();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v96) = v20;
        v26 = "Unable to set posix file dup2: %{errno}d";
        goto LABEL_43;
      }
      goto LABEL_44;
    }
    goto LABEL_32;
  }
  v27 = open("/dev/null", 1);
  if (v27 < 0)
  {
    v20 = *__error();
    v24 = *__error();
    _sa_logt();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v96) = v20;
      v26 = "Unable to open /dev/null: %{errno}d";
      goto LABEL_43;
    }
    goto LABEL_44;
  }
  LODWORD(v28) = v27;
  v29 = posix_spawn_file_actions_adddup2(&v94, v27, 1);
  if (v29)
  {
    v20 = v29;
    v30 = *__error();
    _sa_logt();
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      goto LABEL_49;
    *(_DWORD *)buf = 67109120;
    LODWORD(v96) = v20;
    goto LABEL_105;
  }
LABEL_33:
  if (a9)
  {
    v33 = posix_spawn_file_actions_addinherit_np(&v94, 2);
    if (v33)
    {
      v20 = v33;
      v34 = *__error();
      _sa_logt();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v96) = v20;
        v36 = "Unable to inherit stderr: %{errno}d";
LABEL_70:
        _os_log_error_impl(&dword_1B9BE0000, v35, OS_LOG_TYPE_ERROR, v36, buf, 8u);
        goto LABEL_71;
      }
      goto LABEL_71;
    }
    goto LABEL_53;
  }
  if (!a10)
  {
    if ((v28 & 0x80000000) != 0)
    {
      LODWORD(v28) = open("/dev/null", 1);
      if ((v28 & 0x80000000) != 0)
      {
        v20 = *__error();
        v24 = *__error();
        _sa_logt();
        v25 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          goto LABEL_44;
        *(_DWORD *)buf = 67109120;
        LODWORD(v96) = v20;
        v26 = "Unable to open /dev/null: %{errno}d";
        goto LABEL_43;
      }
    }
    v37 = posix_spawn_file_actions_adddup2(&v94, v28, 2);
    if (!v37)
      goto LABEL_53;
    v20 = v37;
    v30 = *__error();
    _sa_logt();
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
LABEL_49:

      *__error() = v30;
      posix_spawn_file_actions_destroy(&v94);
LABEL_73:
      close(v28);
      goto LABEL_74;
    }
    *(_DWORD *)buf = 67109120;
    LODWORD(v96) = v20;
LABEL_105:
    _os_log_error_impl(&dword_1B9BE0000, v31, OS_LOG_TYPE_ERROR, "Unable to set posix file dup2: %{errno}d", buf, 8u);
    goto LABEL_49;
  }
  if (pipe(v98))
  {
    v20 = *__error();
    v34 = *__error();
    _sa_logt();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v96) = v20;
      v36 = "Unable to open pipe: %{errno}d";
      goto LABEL_70;
    }
LABEL_71:

    *__error() = v34;
    goto LABEL_72;
  }
  v38 = posix_spawn_file_actions_adddup2(&v94, v98[1], 2);
  if (v38)
  {
    v20 = v38;
    v34 = *__error();
    _sa_logt();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v96) = v20;
      v36 = "Unable to set posix file dup2: %{errno}d";
      goto LABEL_70;
    }
    goto LABEL_71;
  }
LABEL_53:
  if (a11)
  {
    v39 = posix_spawn_file_actions_addinherit_np(&v94, 0);
    if (v39)
    {
      v20 = v39;
      v34 = *__error();
      _sa_logt();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v96) = v20;
        v36 = "Unable to inherit stdin: %{errno}d";
        goto LABEL_70;
      }
      goto LABEL_71;
    }
  }
  else if (a12)
  {
    if (pipe(v97))
    {
      v20 = *__error();
      v34 = *__error();
      _sa_logt();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v96) = v20;
        v36 = "Unable to open pipe: %{errno}d";
        goto LABEL_70;
      }
      goto LABEL_71;
    }
    v41 = posix_spawn_file_actions_adddup2(&v94, v97[0], 0);
    if (v41)
    {
      v20 = v41;
      v34 = *__error();
      _sa_logt();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v96) = v20;
        v36 = "Unable to set posix file dup2: %{errno}d";
        goto LABEL_70;
      }
      goto LABEL_71;
    }
  }
  else
  {
    v40 = posix_spawn_file_actions_addclose(&v94, 0);
    if (v40)
    {
      v20 = v40;
      v34 = *__error();
      _sa_logt();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v96) = v20;
        v36 = "Unable to set posix close: %{errno}d";
        goto LABEL_70;
      }
      goto LABEL_71;
    }
  }
  v93 = 0;
  v42 = posix_spawnattr_init(&v93);
  if (v42)
  {
    v20 = v42;
    v34 = *__error();
    _sa_logt();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v96) = v20;
      v36 = "Unable to create posix attr: %{errno}d";
      goto LABEL_70;
    }
    goto LABEL_71;
  }
  if (a5)
  {
    v45 = posix_spawnattr_setbinpref_np(&v93, 1uLL, a5, 0);
    if (v45)
    {
      v20 = v45;
      v46 = *__error();
      _sa_logt();
      v47 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
LABEL_90:

        *__error() = v46;
LABEL_121:
        posix_spawnattr_destroy(&v93);
LABEL_72:
        posix_spawn_file_actions_destroy(&v94);
        if ((v28 & 0x80000000) != 0)
          goto LABEL_74;
        goto LABEL_73;
      }
      *(_DWORD *)buf = 67109120;
      LODWORD(v96) = v20;
      v85 = "Unable to set posix arch preference: %{errno}d";
LABEL_143:
      _os_log_error_impl(&dword_1B9BE0000, v47, OS_LOG_TYPE_ERROR, v85, buf, 8u);
      goto LABEL_90;
    }
  }
  if ((_DWORD)a6)
    v48 = 16449;
  else
    v48 = 16385;
  a6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", &unk_1E71677E0, CFSTR("validation-category"), 0);
  if (a2)
  {
    SANSStringForCString(a2);
    v49 = objc_claimAutoreleasedReturnValue();
    if (!v49)
    {
LABEL_118:
      v82 = *__error();
      _sa_logt();
      v83 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v96 = a2;
        _os_log_error_impl(&dword_1B9BE0000, v83, OS_LOG_TYPE_ERROR, "Unable to create NSString for signing identifier %s", buf, 0xCu);
      }

      *__error() = v82;
      v20 = 22;
      goto LABEL_121;
    }
    v50 = (void *)v49;
    objc_msgSend(a6, "setObject:forKey:", v49, CFSTR("signing-identifier"));

  }
  v92 = 0;
  objc_msgSend(MEMORY[0x1E0DE2F28], "withVersion:withConstraintCategory:withRequirements:withError:", 1, 0, a6, &v92);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v92;
  if (!v51)
  {
    v57 = *__error();
    _sa_logt();
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v52, "description");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v96 = v86;
      _os_log_error_impl(&dword_1B9BE0000, v58, OS_LOG_TYPE_ERROR, "Unable to set code requirement: %@", buf, 0xCu);

    }
    *__error() = v57;

    v20 = 76;
    goto LABEL_121;
  }
  objc_msgSend(v51, "externalRepresentation");
  v53 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v53, "bytes");
  objc_msgSend(v53, "length");
  v54 = amfi_launch_constraint_set_spawnattr();
  if (v54)
  {
    v20 = v54;
    v55 = *__error();
    _sa_logt();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v96) = v20;
      _os_log_error_impl(&dword_1B9BE0000, v56, OS_LOG_TYPE_ERROR, "Unable to set amfi posix launch constraint: %{errno}d", buf, 8u);
    }

    *__error() = v55;
    goto LABEL_121;
  }

  v84 = posix_spawnattr_setflags(&v93, v48);
  if (v84)
  {
    v20 = v84;
    v46 = *__error();
    _sa_logt();
    v47 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      goto LABEL_90;
    *(_DWORD *)buf = 67109120;
    LODWORD(v96) = v20;
    v85 = "Unable to set posix flags: %{errno}d";
    goto LABEL_143;
  }
  v91 = -1;
  v20 = posix_spawn(&v91, a1, &v94, &v93, a3, a4);
  posix_spawnattr_destroy(&v93);
  posix_spawn_file_actions_destroy(&v94);
  if ((v28 & 0x80000000) == 0)
    close(v28);
  if ((v99[1] & 0x80000000) == 0)
  {
    close(v99[1]);
    v99[1] = -1;
  }
  if ((v98[1] & 0x80000000) == 0)
  {
    close(v98[1]);
    v98[1] = -1;
  }
  if ((v97[0] & 0x80000000) == 0)
  {
    close(v97[0]);
    v97[0] = -1;
  }
  if (v20 || v91 < 1)
  {
    if ((v99[0] & 0x80000000) == 0)
      close(v99[0]);
    v43 = v98[0];
    if (v98[0] < 0)
      goto LABEL_84;
LABEL_83:
    close(v43);
LABEL_84:
    if ((v97[1] & 0x80000000) == 0)
      close(v97[1]);
    *__error() = v20;
    return 0xFFFFFFFFLL;
  }
  if (a8)
    *a8 = v99[0];
  if (a10)
    *a10 = v98[0];
  if (a12)
    *a12 = v97[1];
  *__error() = 0;
  return v91;
}

uint64_t SASpawnPlatformBinaryWithSigningIdentifier(const char *a1, void *a2, char *const *a3, char *const *a4, cpu_type_t *a5, int a6, _DWORD *a7, char a8, _DWORD *a9, char a10, _DWORD *a11)
{
  uint64_t result;
  int v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint8_t buf[16];

  if (a2)
    return _SASpawnPlatformBinaryWithSigningIdentifier(a1, a2, a3, a4, a5, 0, a6, a7, a8, a9, a10, a11);
  v12 = *__error();
  _sa_logt();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1B9BE0000, v13, OS_LOG_TYPE_ERROR, "SASpawnPlatformBinaryWithSigningIdentifier requires a signing identifier", buf, 2u);
  }

  *__error() = v12;
  _SASetCrashLogMessage(901, "SASpawnPlatformBinaryWithSigningIdentifier requires a signing identifier", v14, v15, v16, v17, v18, v19, v20);
  result = _os_crash();
  __break(1u);
  return result;
}

uint64_t SAExecPlatformBinaryWithSigningIdentifier(const char *a1, void *a2, char *const *a3, char *const *a4, cpu_type_t *a5)
{
  _SASpawnPlatformBinaryWithSigningIdentifier(a1, a2, a3, a4, a5, (void *)1, 1, 0, 1, 0, 1, 0);
  return *__error();
}

BOOL SAShouldIgnoreSegmentWithCName(char *a1)
{
  return strstr(a1, "PAGEZERO") || strstr(a1, "LINKEDIT") || strstr(a1, "DWARF") || strstr(a1, "UNICODE") != 0;
}

void SASymbolOwnerForeachSegment(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  CSSymbolOwnerForeachSegment();

}

BOOL SASymbolOwnerIsContiguous(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  uint64_t BaseAddress;
  int v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t Name;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[8];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  BaseAddress = CSSymbolOwnerGetBaseAddress();
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = -1;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __SASymbolOwnerIsContiguous_block_invoke;
  v18[3] = &unk_1E71489D0;
  v18[4] = &v31;
  v18[5] = &v23;
  v18[6] = &v27;
  v18[7] = &v19;
  SASymbolOwnerForeachSegment(a1, a2, v18);
  if (BaseAddress && BaseAddress != v28[3])
  {
    v9 = *__error();
    _sa_logt();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      Name = CSSymbolOwnerGetName();
      v16 = v28[3];
      CSSymbolOwnerGetSegmentWithAddress();
      v17 = CSRegionGetName();
      *(_DWORD *)buf = 136315906;
      v36 = Name;
      v37 = 2048;
      v38 = BaseAddress;
      v39 = 2048;
      v40 = v16;
      v41 = 2080;
      v42 = v17;
      _os_log_debug_impl(&dword_1B9BE0000, v10, OS_LOG_TYPE_DEBUG, "SymbolOwner %s base address 0x%llx != start address 0x%llx for segment %s", buf, 0x2Au);
    }

    *__error() = v9;
  }
  if (a3)
  {
    v11 = v28[3];
    v12 = v24[3] - v11;
    *a3 = v11;
    a3[1] = v12;
  }
  if (a4)
    *a4 = v32[3];
  v13 = BaseAddress == v28[3] && v20[3] == v24[3] - BaseAddress;
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
  return v13;
}

void sub_1B9C597AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Unwind_Resume(exception_object);
}

id SACopySanitizedString(void *a1, int a2, unint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = a1;
  v6 = v5;
  if (v5)
  {
    if (a2 && objc_msgSend(v5, "rangeOfString:options:", CFSTR("[^\\S ]"), 1024) != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("[^\\S ]"), CFSTR(" "), 1024, 0, objc_msgSend(v6, "length"));
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7;
    }
    if (a3 && objc_msgSend(v6, "length") > a3)
    {
      objc_msgSend(v6, "substringWithRange:", 0, a3);
      v8 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v8;
    }
  }
  return v6;
}

id SACachedNSString(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  int v5;
  NSObject *v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (qword_1ED1DD8E8 != -1)
    dispatch_once(&qword_1ED1DD8E8, &__block_literal_global_84);
  os_unfair_lock_lock(&stru_1ED1DD8C4);
  objc_msgSend((id)qword_1ED1DD8E0, "member:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = objc_msgSend(v1, "copy");
    if (!v3)
    {
      v5 = *__error();
      _sa_logt();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v15 = objc_msgSend(objc_retainAutorelease(v1), "UTF8String");
        _os_log_error_impl(&dword_1B9BE0000, v6, OS_LOG_TYPE_ERROR, "Unable to copy %s", buf, 0xCu);
      }

      *__error() = v5;
      v7 = objc_msgSend(objc_retainAutorelease(v1), "UTF8String");
      _SASetCrashLogMessage(1334, "Unable to copy %s", v8, v9, v10, v11, v12, v13, v7);
      _os_crash();
      __break(1u);
    }
    v2 = (void *)v3;
    objc_msgSend((id)qword_1ED1DD8E0, "addObject:", v3);
  }
  os_unfair_lock_unlock(&stru_1ED1DD8C4);

  return v2;
}

id SANSStringForCString(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v1 = a1;
  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", a1);
  v3 = v2;
  if (v2)
  {
    SACachedNSString(v2);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v1)
  {
    v4 = *__error();
    _sa_logt();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315138;
      v8 = v1;
      _os_log_error_impl(&dword_1B9BE0000, v5, OS_LOG_TYPE_ERROR, "Unable to get NSString for cstr '%s'", (uint8_t *)&v7, 0xCu);
    }

    v1 = 0;
    *__error() = v4;
  }

  return v1;
}

uint64_t SAArchitectureForTranslatedTask(uint64_t a1)
{
  uint64_t v1;
  _QWORD block[5];

  v1 = a1;
  if (a1)
  {
    if ((CSArchitectureIsArm64() & 1) != 0)
    {
      return 0x301000007;
    }
    else if ((CSArchitectureIsX86_64() & 1) == 0)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __SAArchitectureForTranslatedTask_block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = v1;
      if (SAArchitectureForTranslatedTask_onceToken != -1)
        dispatch_once(&SAArchitectureForTranslatedTask_onceToken, block);
      return 0;
    }
  }
  return v1;
}

id _DictGet(void *a1, uint64_t a2)
{
  void *v2;
  id v3;

  objc_msgSend(a1, "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

id DictGetDict(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a2;
  v4 = a1;
  objc_opt_class();
  _DictGet(v4, (uint64_t)v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id DictGetString(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a2;
  v4 = a1;
  objc_opt_class();
  _DictGet(v4, (uint64_t)v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id DictGetNumber(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a2;
  v4 = a1;
  objc_opt_class();
  _DictGet(v4, (uint64_t)v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id DictGetArray(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a2;
  v4 = a1;
  objc_opt_class();
  _DictGet(v4, (uint64_t)v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id DictGetDictOfClasses(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  int v11;
  id v12;
  _QWORD v14[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v7 = a2;
  v8 = a1;
  objc_opt_class();
  _DictGet(v8, (uint64_t)v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_4;
  v10 = v9;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __DictDoAllClassesMatch_block_invoke;
  v14[3] = &unk_1E7148A18;
  v14[5] = a3;
  v14[6] = a4;
  v14[4] = &v15;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v14);
  v11 = *((unsigned __int8 *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  if (v11)
    v12 = v10;
  else
LABEL_4:
    v12 = 0;

  return v12;
}

void sub_1B9C5A184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id DictGetArrayOfClass(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = a1;
  objc_opt_class();
  _DictGet(v4, (uint64_t)v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            goto LABEL_12;
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          continue;
        break;
      }
    }

    v11 = v6;
  }
  else
  {
LABEL_12:
    v11 = 0;
  }

  return v11;
}

uint64_t SAResampleThreads(pid_t a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(id, _QWORD, uint64_t, uint64_t);
  uint64_t v7;
  int v8;
  NSObject *v9;
  int v10;
  NSObject *v11;
  int *v12;
  NSObject *v13;
  unint64_t v15;
  mach_port_name_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  dispatch_block_t v20;
  NSObject *v21;
  dispatch_time_t v22;
  int v23;
  NSObject *v24;
  unsigned __int8 *v25;
  unsigned __int8 v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  NSObject *v30;
  int v31;
  mach_vm_size_t v32;
  NSObject *oslog;
  char v34;
  void *v35;
  void *context;
  _QWORD block[4];
  id v38;
  uint8_t *v39;
  uint64_t *v40;
  mach_port_name_t v41;
  task_inspect_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;
  mach_msg_type_number_t thread_info_outCnt;
  integer_t thread_info_out[2];
  uint64_t v49;
  uint64_t v50;
  mach_msg_type_number_t act_listCnt;
  thread_act_array_t act_list;
  task_inspect_t target_task;
  uint8_t buf[4];
  uint8_t *v55;
  __int16 v56;
  pid_t v57;
  __int16 v58;
  uint64_t v59;
  uint8_t buffer[48];
  uint8_t v61[8];
  uint8_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (getpid() != a1)
  {
    if ((SAResampleThreads_timedOut & 1) != 0)
    {
      v7 = 49;
      goto LABEL_22;
    }
    context = (void *)MEMORY[0x1BCCCC288]();
    target_task = 0;
    v7 = task_read_for_pid();
    if ((_DWORD)v7)
    {
      if (!kill(a1, 0))
      {
        v8 = *__error();
        _sa_logt();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v61 = 67109376;
          *(_DWORD *)&v61[4] = a1;
          LOWORD(v62) = 1024;
          *(_DWORD *)((char *)&v62 + 2) = v7;
          _os_log_error_impl(&dword_1B9BE0000, v9, OS_LOG_TYPE_ERROR, "[%d] task_read_for_pid failed: %d", v61, 0xEu);
        }

        *__error() = v8;
      }
      goto LABEL_21;
    }
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAFED8]), "initWithTask:options:", target_task, 96);
    if (v35)
    {
      act_list = 0;
      act_listCnt = 0;
      v7 = task_threads(target_task, &act_list, &act_listCnt);
      if (!(_DWORD)v7)
      {
        if (act_listCnt)
        {
          v15 = 0;
          v7 = 0;
          v34 = 1;
          do
          {
            v16 = act_list[v15];
            if (SAResampleThreads_timedOut == 1)
            {
              mach_port_deallocate(*MEMORY[0x1E0C83DA0], act_list[v15]);
            }
            else
            {
              *(_QWORD *)thread_info_out = 0;
              v49 = 0;
              v50 = 0;
              thread_info_outCnt = 6;
              if (thread_info(v16, 4u, thread_info_out, &thread_info_outCnt)
                || (v17 = *(_QWORD *)thread_info_out,
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)thread_info_out),
                    v18 = (void *)objc_claimAutoreleasedReturnValue(),
                    v19 = objc_msgSend(v5, "containsObject:", v18),
                    v18,
                    !v19))
              {
                mach_port_deallocate(*MEMORY[0x1E0C83DA0], v16);
              }
              else
              {
                *(_QWORD *)v61 = 0;
                v62 = v61;
                v63 = 0x3032000000;
                v64 = __Block_byref_object_copy__3;
                v65 = __Block_byref_object_dispose__3;
                v66 = 0;
                v43 = 0;
                v44 = &v43;
                v45 = 0x2020000000;
                v46 = 0;
                block[0] = MEMORY[0x1E0C809B0];
                block[1] = 3221225472;
                block[2] = __SAResampleThreads_block_invoke;
                block[3] = &unk_1E7148A40;
                v39 = v61;
                v38 = v35;
                v40 = &v43;
                v41 = v16;
                v42 = target_task;
                v20 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, block);
                dispatch_get_global_queue(33, 0);
                v21 = objc_claimAutoreleasedReturnValue();
                dispatch_async(v21, v20);

                v22 = dispatch_time(0, 1000000000);
                if (dispatch_block_wait(v20, v22))
                {
                  SAResampleThreads_timedOut = 1;
                  proc_name(a1, buffer, 0x21u);
                  v23 = *__error();
                  _sa_logt();
                  v24 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315650;
                    v55 = buffer;
                    v56 = 1024;
                    v57 = a1;
                    v58 = 2048;
                    v59 = v17;
                    _os_log_error_impl(&dword_1B9BE0000, v24, OS_LOG_TYPE_ERROR, "Timed out resampling %s [%d] thread 0x%llx", buf, 0x1Cu);
                  }

                  *__error() = v23;
                  v25 = (unsigned __int8 *)(v44 + 3);
                  do
                    v26 = __ldxr(v25);
                  while (__stxr(1u, v25));
                  if ((v26 & 1) != 0)
                  {
                    v29 = *__error();
                    _sa_logt();
                    v30 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_error_impl(&dword_1B9BE0000, v30, OS_LOG_TYPE_ERROR, "Timed out sampler, but lost race", buf, 2u);
                    }

                    *__error() = v29;
                    mach_port_deallocate(*MEMORY[0x1E0C83DA0], v16);
                  }
                  else
                  {
                    v34 = 0;
                  }
                  v7 = 49;
                }
                else
                {
                  if ((v44[3] & 1) == 0)
                  {
                    v31 = *__error();
                    _sa_logt();
                    oslog = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
                    {
                      *(_WORD *)buffer = 0;
                      _os_log_fault_impl(&dword_1B9BE0000, oslog, OS_LOG_TYPE_FAULT, "racebit not true", buffer, 2u);
                    }

                    *__error() = v31;
                  }
                  mach_port_deallocate(*MEMORY[0x1E0C83DA0], v16);
                  v27 = objc_msgSend(*((id *)v62 + 5), "backtrace");
                  v28 = objc_msgSend(*((id *)v62 + 5), "backtraceLength");
                  if (v27 && (_DWORD)v28)
                    v6[2](v6, v17, v27, v28);
                }

                _Block_object_dispose(&v43, 8);
                _Block_object_dispose(v61, 8);

              }
            }
            ++v15;
          }
          while (v15 < act_listCnt);
          v32 = 4 * act_listCnt;
        }
        else
        {
          v7 = 0;
          v32 = 0;
          v34 = 1;
        }
        mach_vm_deallocate(*MEMORY[0x1E0C83DA0], (mach_vm_address_t)act_list, v32);
        if ((v34 & 1) == 0)
          goto LABEL_20;
        goto LABEL_19;
      }
      v10 = *__error();
      _sa_logt();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v61 = 67109376;
        *(_DWORD *)&v61[4] = a1;
        LOWORD(v62) = 1024;
        *(_DWORD *)((char *)&v62 + 2) = v7;
        _os_log_error_impl(&dword_1B9BE0000, v11, OS_LOG_TYPE_ERROR, "[%d] task_threads failed: %d", v61, 0xEu);
      }

      v12 = __error();
    }
    else
    {
      v10 = *__error();
      _sa_logt();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v61 = 67109120;
        *(_DWORD *)&v61[4] = a1;
        _os_log_error_impl(&dword_1B9BE0000, v13, OS_LOG_TYPE_ERROR, "[%d] unable to create VMUSampler", v61, 8u);
      }

      v12 = __error();
      v7 = 0;
    }
    *v12 = v10;
LABEL_19:
    mach_port_deallocate(*MEMORY[0x1E0C83DA0], target_task);
LABEL_20:

LABEL_21:
    objc_autoreleasePoolPop(context);
    goto LABEL_22;
  }
  v7 = 16;
LABEL_22:

  return v7;
}

void sub_1B9C5A9E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  uint64_t v16;
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v16 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

id SAExecutablePath(int a1, const char *a2)
{
  const char *v3;
  void *v5;
  size_t v6;
  int v7;
  char *v8;
  const char *v9;
  size_t v10;
  int v11;
  NSObject *v12;
  void *v13;
  int v14;
  NSObject *v15;
  int v16;
  int v17;
  _BYTE v18[10];
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a1 < 1)
    return 0;
  if (a2)
  {
    if (*a2)
      v3 = a2;
    else
      v3 = 0;
  }
  else
  {
    v3 = 0;
  }
  v5 = 0;
  LODWORD(v6) = 0;
  do
  {
    if ((_DWORD)v6)
      v6 = (2 * v6);
    else
      v6 = 1024;
    if (v5)
      free(v5);
    v5 = malloc_type_calloc(v6, 1uLL, 0x9CE85D66uLL);
    v7 = proc_pidpath(a1, v5, v6);
  }
  while (v7 >= (int)v6);
  if (!v7)
  {
    if (kill(a1, 0))
    {
      v13 = 0;
    }
    else
    {
      v14 = *__error();
      _sa_logt();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = *__error();
        v17 = 67109376;
        *(_DWORD *)v18 = a1;
        *(_WORD *)&v18[4] = 1024;
        *(_DWORD *)&v18[6] = v16;
        _os_log_error_impl(&dword_1B9BE0000, v15, OS_LOG_TYPE_ERROR, "unable to get path for %d: %{errno}d", (uint8_t *)&v17, 0xEu);
      }

      v13 = 0;
      *__error() = v14;
    }
    goto LABEL_30;
  }
  if (v3)
  {
    v8 = rindex((const char *)v5, 47);
    if (!v8)
    {
      v11 = *__error();
      _sa_logt();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v17 = 136315650;
        *(_QWORD *)v18 = v3;
        *(_WORD *)&v18[8] = 1024;
        v19 = a1;
        v20 = 2080;
        v21 = v5;
        _os_log_error_impl(&dword_1B9BE0000, v12, OS_LOG_TYPE_ERROR, "%s [%d] path %s has no path components", (uint8_t *)&v17, 0x1Cu);
      }
      goto LABEL_26;
    }
    v9 = v8 + 1;
    v10 = strlen(v3);
    if (strncmp(v3, v9, v10))
    {
      v11 = *__error();
      _sa_logt();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v17 = 136315650;
        *(_QWORD *)v18 = v3;
        *(_WORD *)&v18[8] = 1024;
        v19 = a1;
        v20 = 2080;
        v21 = v5;
        _os_log_debug_impl(&dword_1B9BE0000, v12, OS_LOG_TYPE_DEBUG, "%s [%d] exec'ed into %s", (uint8_t *)&v17, 0x1Cu);
      }
LABEL_26:

      v13 = 0;
      *__error() = v11;
      goto LABEL_30;
    }
  }
  SANSStringForCString(v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_30:
  free(v5);
  return v13;
}

_BYTE *SAFilepathForCString(_BYTE *a1)
{
  _BYTE *v1;
  const char *v2;
  int v3;
  int v4;
  int v6;
  NSObject *v7;
  int *v8;
  int v9;
  _BYTE *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return a1;
  v1 = a1;
  if (!*a1)
    return 0;
  if (*a1 == 47 && a1[1])
    goto LABEL_10;
  v2 = a1 - 1;
  do
  {
    v4 = *(unsigned __int8 *)++v2;
    v3 = v4;
  }
  while ((v4 - 48) > 0xFFFFFFFD);
  if (!v3)
  {
    v6 = *__error();
    _sa_logt();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v9 = 136315138;
      v10 = v1;
      _os_log_debug_impl(&dword_1B9BE0000, v7, OS_LOG_TYPE_DEBUG, "%s is not a filepath", (uint8_t *)&v9, 0xCu);
    }

    v8 = __error();
    a1 = 0;
    *v8 = v6;
    return a1;
  }
  if (!strcmp(v2, "<unknown>"))
    return 0;
  a1 = v2;
LABEL_10:
  SANSStringForCString(a1);
  a1 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  return a1;
}

uint64_t SAFilepathMatches(void *a1, void *a2, _BYTE *a3)
{
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;

  v5 = a1;
  v6 = a2;
  if (!v5)
  {
LABEL_5:
    v8 = 1;
    if (a3)
      *a3 = 1;
    goto LABEL_10;
  }
  if (!objc_msgSend(v5, "isAbsolutePath"))
  {
    v7 = objc_msgSend(v6, "length");
    if (v7 > objc_msgSend(v5, "length"))
    {
      if (!objc_msgSend(v6, "hasSuffix:", v5))
      {
        v8 = 0;
        goto LABEL_10;
      }
      goto LABEL_5;
    }
  }
  if (a3)
    *a3 = 0;
  v8 = objc_msgSend(v5, "hasSuffix:", v6);
LABEL_10:

  return v8;
}

uint64_t SAIsEmbeddedPlatform(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  v2 = v1;
  if (!v1
    || (objc_msgSend(v1, "containsString:", CFSTR("macOS")) & 1) != 0
    || (objc_msgSend(v2, "containsString:", CFSTR("Mac")) & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v3 = objc_msgSend(v2, "containsString:", CFSTR("OS X")) ^ 1;
  }

  return v3;
}

double SATimeOfBootForLiveMachine()
{
  if (qword_1ED1DD8F8 != -1)
    dispatch_once(&qword_1ED1DD8F8, &__block_literal_global_105);
  return *(double *)&qword_1ED1DD8F0;
}

void SAComplainAboutUnknownThreadPolicyVersion(int a1)
{
  _QWORD block[4];
  int v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __SAComplainAboutUnknownThreadPolicyVersion_block_invoke;
  block[3] = &__block_descriptor_36_e5_v8__0l;
  v2 = a1;
  if (SAComplainAboutUnknownThreadPolicyVersion_onceToken != -1)
    dispatch_once(&SAComplainAboutUnknownThreadPolicyVersion_onceToken, block);
}

uint64_t SASerializableIndexForPointerFromSerializationDictionary(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const __CFString *v15;
  id v16;

  v3 = a1;
  v4 = a2;
  if (!v4)
  {
    v15 = CFSTR("nil serialization dictionary");
    goto LABEL_11;
  }
  v5 = v4;
  if (!v3)
  {
    v13 = -1;
    goto LABEL_7;
  }
  objc_msgSend((id)objc_opt_class(), "classDictionaryKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v7;
  if (!v8)
  {
    v15 = CFSTR("Invalid pointer-to-index dictionary");
    goto LABEL_11;
  }
  v9 = v8;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLongLong:", v3);
  objc_msgSend(v9, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v15 = CFSTR("Could not find index for pointer");
LABEL_11:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), v15, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v16);
  }
  v12 = v11;
  v13 = objc_msgSend(v11, "longLongValue");

LABEL_7:
  return v13;
}

char *_pointerInBufferForIndexWithClass(void *a1, unint64_t a2)
{
  unint64_t v2;
  _QWORD *v3;
  unint64_t v4;
  id v6;
  id v7;
  unint64_t *v8;
  unint64_t v9;
  char *v10;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  NSObject *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint8_t buf[4];
  unint64_t v39;
  __int16 v40;
  unint64_t v41;
  __int16 v42;
  unint64_t v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a1;
  if (a2 == -1)
  {
    v12 = *__error();
    _sa_logt();
    a2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B9BE0000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "null index", buf, 2u);
    }

    *__error() = v12;
    _SASetCrashLogMessage(107, "null index", v13, v14, v15, v16, v17, v18, v37);
    _os_crash();
    __break(1u);
    goto LABEL_11;
  }
  v7 = objc_retainAutorelease(v6);
  v8 = (unint64_t *)objc_msgSend(v7, "bytes");
  v4 = *v8;
  if (*v8 <= a2)
  {
LABEL_11:
    v19 = *__error();
    _sa_logt();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v39 = a2;
      v40 = 2048;
      v41 = v4;
      _os_log_error_impl(&dword_1B9BE0000, v20, OS_LOG_TYPE_ERROR, "index %llu < numInstances %llu", buf, 0x16u);
    }

    *__error() = v19;
    _SASetCrashLogMessage(112, "index %llu < numInstances %llu", v21, v22, v23, v24, v25, v26, a2);
    _os_crash();
    __break(1u);
    goto LABEL_14;
  }
  v3 = v8 + 1;
  v9 = v8[a2 + 1];
  v10 = (char *)&v8[v4 + 1] + v9;
  if (v4 - 1 > a2)
  {
    v2 = a2 + 1;
    if (v3[a2 + 1] > v9)
      goto LABEL_7;
LABEL_14:
    v27 = *__error();
    _sa_logt();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = v3[v2];
      v30 = v3[a2];
      *(_DWORD *)buf = 134218752;
      v39 = v2;
      v40 = 2048;
      v41 = v29;
      v42 = 2048;
      v43 = a2;
      v44 = 2048;
      v45 = v30;
      _os_log_error_impl(&dword_1B9BE0000, v28, OS_LOG_TYPE_ERROR, "index %llu (%llu) <= index %llu (%llu)", buf, 0x2Au);
    }

    *__error() = v27;
    _SASetCrashLogMessage(121, "index %llu (%llu) <= index %llu (%llu)", v31, v32, v33, v34, v35, v36, v2);
    _os_crash();
    __break(1u);
  }
  objc_msgSend(v7, "length");
LABEL_7:

  return v10;
}

BOOL SASerializableAddInstanceToSerializationDictionaryWithClassKey(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  SAObjectListEntry *v18;
  const char *v19;
  SAObjectListEntry *v20;
  const __CFString *v22;
  id v23;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (!v5 || !v6 || (v8 = v7) == 0)
  {
    v22 = CFSTR("Invalid arguments");
    goto LABEL_15;
  }
  objc_msgSend(v5, "objectForKey:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v10 = v8;
    v11 = v5;
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v9, "setObject:forKey:", v12, CFSTR("AddedObjectList"));

    objc_msgSend(v11, "setObject:forKey:", v9, v10);
    if (!v9)
    {
      v22 = CFSTR("Failed to add new pointer-to-index dictionary");
      goto LABEL_15;
    }
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLongLong:", v6);
  objc_msgSend(v9, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    goto LABEL_11;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLongLong:", objc_msgSend(v9, "count") - 1);
  objc_msgSend(v9, "setObject:forKey:", v15, v13);
  objc_msgSend(v9, "objectForKey:", CFSTR("AddedObjectList"));
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    v22 = CFSTR("No ordering list");
LABEL_15:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), v22, 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v23);
  }
  v17 = (void *)v16;
  v18 = objc_alloc_init(SAObjectListEntry);
  v20 = v18;
  if (v18)
  {
    objc_setProperty_atomic(v18, v19, v6, 8);
    v20->_size = objc_msgSend(v6, "sizeInBytesForSerializedVersion");
  }
  else
  {
    objc_msgSend(v6, "sizeInBytesForSerializedVersion");
  }
  objc_msgSend(v17, "addObject:", v20);

LABEL_11:
  return v14 == 0;
}

id SASerializableNewDataBufferDictionaryFromSerializationDictionary(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  size_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  const char *v25;
  void *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  void *v30;
  const __CFString *v32;
  id v33;
  id obj;
  uint64_t v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;
  id v43;
  _QWORD *v44;
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
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v36 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v37 = v1;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  objc_msgSend(v1, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
  if (v38)
  {
    v35 = *(_QWORD *)v46;
    do
    {
      v2 = 0;
      do
      {
        if (*(_QWORD *)v46 != v35)
          objc_enumerationMutation(obj);
        v3 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v2);
        objc_msgSend(v37, "objectForKey:", v3);
        v4 = (id)objc_claimAutoreleasedReturnValue();
        v43 = v37;
        if (!v4)
        {
          v32 = CFSTR("Invalid pointer-to-index dictionary");
          goto LABEL_39;
        }
        objc_msgSend(v4, "objectForKey:", CFSTR("AddedObjectList"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v5)
        {
          v32 = CFSTR("Could not get order added list");
          goto LABEL_39;
        }
        v6 = v5;
        if (!objc_msgSend(v5, "count"))
        {
          v32 = CFSTR("No elements in order added list");
          goto LABEL_39;
        }
        v7 = objc_msgSend(v6, "count") + 1;
        if (v7 != objc_msgSend(v4, "count"))
        {
          v32 = CFSTR("Mismatched order added list length and pointer-to-index dictionary entry count");
          goto LABEL_39;
        }
        v39 = v3;
        v40 = v2;
        v8 = 8 * objc_msgSend(v6, "count") + 8;
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v9 = v6;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v54;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v54 != v12)
                objc_enumerationMutation(v9);
              v14 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
              if (v14)
                v14 = *(_QWORD *)(v14 + 16);
              v8 += v14;
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
          }
          while (v11);
        }
        v41 = v4;

        v44 = malloc_type_calloc(1uLL, v8, 0x91958CD7uLL);
        *v44 = objc_msgSend(v9, "count");
        v15 = objc_msgSend(v9, "count");
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v42 = v9;
        v16 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
        if (v16)
        {
          v17 = v16;
          v18 = 0;
          v19 = 0;
          v20 = (unint64_t)&v44[v15 + 1];
          v21 = *(_QWORD *)v50;
          do
          {
            v22 = 0;
            do
            {
              if (*(_QWORD *)v50 != v21)
                objc_enumerationMutation(v42);
              v23 = *(_QWORD **)(*((_QWORD *)&v49 + 1) + 8 * v22);
              v24 = MEMORY[0x1BCCCC288]();
              if (v20 >= (unint64_t)v44 + v8)
              {
                free(v44);
                v32 = CFSTR("Overran the end of the buffer");
                goto LABEL_39;
              }
              v26 = (void *)v24;
              v44[v19 + 1] = v18;
              if (v23)
              {
                if (!objc_msgSend(objc_getProperty(v23, v25, 8, 1), "addSelfToBuffer:bufferLength:withCompletedSerializationDictionary:", v20, v23[2], v43))goto LABEL_38;
                v27 = v23[2];
                v20 += v27;
              }
              else
              {
                v28 = objc_msgSend(0, "addSelfToBuffer:bufferLength:withCompletedSerializationDictionary:", v20, 0, v43);
                v27 = 0;
                if ((v28 & 1) == 0)
                {
LABEL_38:
                  free(v44);
                  v32 = CFSTR("Error when trying to serialize");
                  goto LABEL_39;
                }
              }
              v18 += v27;
              ++v19;
              objc_autoreleasePoolPop(v26);
              ++v22;
            }
            while (v17 != v22);
            v29 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
            v17 = v29;
          }
          while (v29);
        }

        v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v44, v8, 1);
        if (!v30)
        {
          v32 = CFSTR("Ran into error trying to serialize class");
LABEL_39:
          +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), v32, 0);
          v33 = (id)objc_claimAutoreleasedReturnValue();
          objc_exception_throw(v33);
        }
        objc_msgSend(v36, "setObject:forKey:", v30, v39);

        v2 = v40 + 1;
      }
      while (v40 + 1 != v38);
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
    }
    while (v38);
  }

  return v36;
}

id _indexToInstanceDictionaryFromDeserializationDictionary(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v8;

  v3 = a1;
  v4 = a2;
  if (!v3 || (v5 = v4) == 0)
  {
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Invalid arguments"), 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  objc_msgSend(v3, "objectForKey:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v3, "setObject:forKey:", v6, v5);
  }

  return v6;
}

char *SASerializableBufferForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(unint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char *v13;
  const __CFString *v15;
  id v16;

  v7 = a2;
  v8 = a3;
  objc_msgSend(a4, "classDictionaryKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _indexToInstanceDictionaryFromDeserializationDictionary(v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v15 = CFSTR("Could not get index-to-instance dictionary");
    goto LABEL_6;
  }
  objc_msgSend(a4, "classDictionaryKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v15 = CFSTR("Could not get buffer for class");
LABEL_6:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), v15, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v16);
  }
  v13 = _pointerInBufferForIndexWithClass(v12, a1);

  return v13;
}

id _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(unint64_t a1, void *a2, void *a3, void *a4, char a5)
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  SASerializeableInstance *v16;
  const char *v17;
  void *v18;
  void *v19;
  const char *v20;
  char *v21;
  uint64_t v22;
  id v23;
  void *v24;
  SASerializeableInstance *v25;
  SASerializeableInstance *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  SEL v34;
  void *v35;
  SEL v36;
  const __CFString *v38;
  const __CFString *v39;
  id v40;
  void *context;
  char *v42;
  char v43;
  id v44;
  const char *v45;
  objc_super v46;

  v9 = a2;
  v10 = a3;
  v11 = v10;
  if (a1 != -1)
  {
    if (v9 && v10 && a4)
    {
      objc_msgSend(a4, "classDictionaryKey");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      _indexToInstanceDictionaryFromDeserializationDictionary(v9, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v14 = v13;
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLongLong:", a1);
        objc_msgSend(v14, "objectForKey:", v15);
        v16 = (SASerializeableInstance *)objc_claimAutoreleasedReturnValue();

        if (v16 && v16->_populated)
        {
          v23 = objc_getProperty(v16, v17, 16, 1);
LABEL_30:

          goto LABEL_31;
        }
        objc_msgSend(a4, "classDictionaryKey");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          v21 = _pointerInBufferForIndexWithClass(v19, a1);
          v45 = v20;
          if (v16)
          {
LABEL_26:
            if (!v16->_populated && (a5 & 1) == 0)
            {
              v35 = (void *)MEMORY[0x1BCCCC288]();
              v16->_populated = 1;
              objc_msgSend(objc_getProperty(v16, v36, 16, 1), "populateReferencesUsingBuffer:bufferLength:andDeserializationDictionary:andDataBufferDictionary:", v21, v45, v9, v11);
              objc_autoreleasePoolPop(v35);
            }
            v23 = objc_getProperty(v16, v20, 16, 1);

            goto LABEL_30;
          }
          context = (void *)MEMORY[0x1BCCCC288]();
          v42 = v21;
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v22 = objc_msgSend(a4, "newInstanceWithoutReferencesFromSerializedBuffer:bufferLength:andDeserializationDictionary:andDataBufferDictionary:", v21, v45, v9, v11);
          else
            v22 = objc_msgSend(a4, "newInstanceWithoutReferencesFromSerializedBuffer:bufferLength:", v21, v45);
          v24 = (void *)v22;
          v25 = [SASerializeableInstance alloc];
          v44 = v24;
          v43 = a5;
          if (v25)
          {
            v46.receiver = v25;
            v46.super_class = (Class)SASerializeableInstance;
            v26 = (SASerializeableInstance *)objc_msgSendSuper2(&v46, sel_init);
            v25 = v26;
            if (v26)
              objc_storeStrong((id *)&v26->_instance, v24);
          }

          objc_msgSend(a4, "classDictionaryKey");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v9;
          v16 = v25;
          v29 = v27;
          if (v16 && (v30 = v29) != 0)
          {
            objc_msgSend(v28, "objectForKey:", v29);
            v31 = (id)objc_claimAutoreleasedReturnValue();
            if (!v31)
            {
              v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
              objc_msgSend(v28, "setObject:forKey:", v31, v30);
            }
            v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLongLong:", a1);
            objc_msgSend(v31, "objectForKey:", v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v33)
            {
              objc_msgSend(v31, "setObject:forKey:", v16, v32);

              objc_getProperty(v16, v34, 16, 1);
              if ((objc_opt_respondsToSelector() & 1) == 0)
                v16->_populated = 1;

              objc_autoreleasePoolPop(context);
              a5 = v43;
              v21 = v42;
              goto LABEL_26;
            }

            v38 = CFSTR("Decoding failure");
            v39 = CFSTR("Failed to add new instance to the deserialization dictionary");
          }
          else
          {
            v38 = CFSTR("Encoding failure");
            v39 = CFSTR("Invalid arguments");
          }
        }
        else
        {
          v38 = CFSTR("Decoding failure");
          v39 = CFSTR("Could not get buffer for class");
        }
      }
      else
      {
        v38 = CFSTR("Decoding failure");
        v39 = CFSTR("Could not get index-to-instance dictionary");
      }
    }
    else
    {
      v38 = CFSTR("Decoding failure");
      v39 = CFSTR("Invalid args");
    }
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", v38, v39, 0);
    v40 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v40);
  }
  v23 = 0;
LABEL_31:

  return v23;
}

id SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(unint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v12;

  v7 = a2;
  v8 = a3;
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(a1, v7, v8, a4, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Trying to deserialize nonnull index that is null"), 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v12);
  }
  v10 = (void *)v9;

  return v10;
}

id SASerializablePartiallyDecodedNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(unint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v12;

  v7 = a2;
  v8 = a3;
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(a1, v7, v8, a4, 1);
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Trying to partially deserialize nonnull index that is null"), 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v12);
  }
  v10 = (void *)v9;

  return v10;
}

uint64_t SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances(void *a1, unint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  int v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const __CFString *v28;
  id v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  unint64_t v36;
  __int16 v37;
  unint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (a2)
  {
    v30 = a1;
    if (a1 && v7 && v8)
    {
      v10 = malloc_type_malloc(8 * a2, 0xEBFA48B9uLL);
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v11 = v7;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      if (!v12)
        goto LABEL_16;
      v13 = v12;
      v14 = 0;
      v15 = *(_QWORD *)v32;
      while (1)
      {
        v16 = 0;
        if (a2 >= v14)
          v17 = a2 - v14;
        else
          v17 = 0;
        do
        {
          if (*(_QWORD *)v32 != v15)
            objc_enumerationMutation(v11);
          if (v17 == v16)
          {
            v20 = *__error();
            _sa_logt();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              v36 = v14;
              v37 = 2048;
              v38 = a2;
              _os_log_error_impl(&dword_1B9BE0000, v21, OS_LOG_TYPE_ERROR, "i %llu >= numIndices %llu", buf, 0x16u);
            }

            *__error() = v20;
            _SASetCrashLogMessage(452, "i %llu >= numIndices %llu", v22, v23, v24, v25, v26, v27, v14);
            _os_crash();
            __break(1u);
LABEL_21:
            free(v10);
            v28 = CFSTR("Got bad index");
LABEL_22:
            +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), v28, 0);
            v29 = (id)objc_claimAutoreleasedReturnValue();
            objc_exception_throw(v29);
          }
          v18 = SASerializableIndexForPointerFromSerializationDictionary(*(void **)(*((_QWORD *)&v31 + 1) + 8 * v16), v9);
          *((_QWORD *)v10 + v14) = v18;
          if (v18 == -1)
            goto LABEL_21;
          ++v14;
          ++v16;
        }
        while (v13 != v16);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (!v13)
        {
LABEL_16:

          memcpy(v30, v10, 8 * a2);
          free(v10);
          goto LABEL_17;
        }
      }
    }
    v28 = CFSTR("Invalid arguments");
    goto LABEL_22;
  }
LABEL_17:

  return 1;
}

id _newMutableCollectionFromIndexList(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  NSObject *v19;
  id v21;
  int v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  if (!a1 || !v11 || (v13 = v12) == 0 || !a5)
  {
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Invalid args"), 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  v14 = (void *)objc_msgSend((id)objc_msgSend(a6, "alloc"), "initWithCapacity:", a2);
  if (a2)
  {
    v15 = 0;
    while (1)
    {
      _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(*(_QWORD *)(a1 + 8 * v15), v11, v13, a5, 0);
      v16 = objc_claimAutoreleasedReturnValue();
      if (!v16)
        break;
      v17 = (void *)v16;
      objc_msgSend(v14, "addObject:", v16);

      if (a2 == ++v15)
        goto LABEL_13;
    }
    v18 = *__error();
    _sa_logt();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v22 = 134217984;
      v23 = v15;
      _os_log_error_impl(&dword_1B9BE0000, v19, OS_LOG_TYPE_ERROR, "Could not deserialize item %llu", (uint8_t *)&v22, 0xCu);
    }

    *__error() = v18;
  }
LABEL_13:

  return v14;
}

id SASerializableNewMutableArrayFromIndexList(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  void *v11;
  void *v12;

  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_opt_class();
  _newMutableCollectionFromIndexList(a1, a2, v10, v9, a5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id SASerializableNewMutableSetFromIndexList(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  void *v11;
  void *v12;

  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_opt_class();
  _newMutableCollectionFromIndexList(a1, a2, v10, v9, a5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id SASerializableNewMutableDictionaryFromIndexList(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  void *v13;
  id v14;
  unint64_t *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v21;
  id v22;

  v11 = a3;
  v12 = a4;
  if (!a6 || !a5 || (v13 = v12) == 0 || !a2 || !a1 || !v11)
  {
    v21 = CFSTR("Invalid args");
LABEL_16:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), v21, 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v22);
  }
  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v15 = (unint64_t *)(a1 + 16);
  do
  {
    if (*(v15 - 2) != 2557891634)
    {
      v21 = CFSTR("Bad SASerializedIndexKeyValuePair magic");
      goto LABEL_16;
    }
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(*(v15 - 1), v11, v13, a5, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      v21 = CFSTR("Could not deserialize key");
      goto LABEL_16;
    }
    v17 = (void *)v16;
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(*v15, v11, v13, a6, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      v21 = CFSTR("Could not deserialize value");
      goto LABEL_16;
    }
    v19 = (void *)v18;
    objc_msgSend(v14, "setObject:forKey:", v18, v17);

    v15 += 3;
    --a2;
  }
  while (a2);

  return v14;
}

id SASerializableNewMutableDictionaryOfArraysFromIndexList(_QWORD *a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const __CFString *v20;
  id v21;
  id v22;

  v9 = a3;
  v10 = a4;
  if (!a6 || !a5 || (v11 = v10) == 0 || !a2 || !a1 || !v9)
  {
    v20 = CFSTR("Invalid args");
    goto LABEL_17;
  }
  v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v12 = 0;
  do
  {
    if (*a1 != 4277001967)
    {
      v20 = CFSTR("Bad SASerializedIndexKeyArrayLengthPair magic");
      goto LABEL_17;
    }
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(a1[1], v9, v11, a5, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v20 = CFSTR("Could not deserialize key for header");
      goto LABEL_17;
    }
    v14 = (void *)v13;
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (a1[2])
    {
      v16 = 0;
      while (1)
      {
        _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(a1[v16 + 3], v9, v11, a6, 0);
        v17 = objc_claimAutoreleasedReturnValue();
        if (!v17)
          break;
        v18 = (void *)v17;
        objc_msgSend(v15, "addObject:", v17);

        if ((unint64_t)++v16 >= a1[2])
          goto LABEL_14;
      }
      v20 = CFSTR("Could not deserialize value");
LABEL_17:
      +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), v20, 0);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v21);
    }
LABEL_14:
    objc_msgSend(v22, "setObject:forKey:", v15, v14);
    a1 += a1[2] + 3;

    ++v12;
  }
  while (v12 != a2);

  return v22;
}

id FilterArrayToCallTreeFrames(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v1 = a1;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v21;
    while (2)
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v21 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v5);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v6, "isTruncatedLeafCallstack") & 1) != 0)
        {

          v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v1, "count") - 1);
          v16 = 0u;
          v17 = 0u;
          v18 = 0u;
          v19 = 0u;
          v9 = v1;
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v17;
            do
            {
              v13 = 0;
              do
              {
                if (*(_QWORD *)v17 != v12)
                  objc_enumerationMutation(v9);
                v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v13);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0
                  && (objc_msgSend(v14, "isTruncatedLeafCallstack", (_QWORD)v16) & 1) == 0)
                {
                  objc_msgSend(v8, "addObject:", v14);
                }
                ++v13;
              }
              while (v11 != v13);
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
            }
            while (v11);
          }

          v7 = (void *)objc_msgSend(v8, "copy");
          goto LABEL_22;
        }
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v3)
        continue;
      break;
    }
  }

  v7 = (void *)objc_msgSend(v1, "copy");
LABEL_22:

  return v7;
}

char *init_io_histograms()
{
  char *v0;
  char *v1;
  uint64_t i;
  uint64_t v3;
  uint64_t v4;
  char *v5;

  v0 = (char *)malloc_type_malloc(0xF38uLL, 0x10000403AFA9047uLL);
  v1 = v0;
  if (v0)
  {
    bzero(v0, 0xF38uLL);
    for (i = 0; i != 2912; i += 728)
    {
      *(_DWORD *)&v1[i + 984] = 29;
      bzero(&v1[i + 992], 0x2B8uLL);
      memmove(&v1[i + 992], &io_latency_histogram_template, 0x2B8uLL);
    }
    v3 = 0;
    *(_DWORD *)v1 = 9;
    *(_OWORD *)(v1 + 8) = 0u;
    *(_OWORD *)(v1 + 24) = 0u;
    *(_OWORD *)(v1 + 40) = 0u;
    *(_OWORD *)(v1 + 56) = 0u;
    *(_OWORD *)(v1 + 72) = 0u;
    *(_OWORD *)(v1 + 88) = 0u;
    *(_OWORD *)(v1 + 104) = 0u;
    *(_OWORD *)(v1 + 120) = 0u;
    *(_OWORD *)(v1 + 136) = 0u;
    *(_OWORD *)(v1 + 152) = 0u;
    *(_OWORD *)(v1 + 168) = 0u;
    *(_OWORD *)(v1 + 184) = 0u;
    *(_OWORD *)(v1 + 200) = 0u;
    *((_QWORD *)v1 + 27) = 0;
    v4 = 4096;
    *((_QWORD *)v1 + 2) = 4096;
    do
    {
      v5 = &v1[v3];
      *((_QWORD *)v5 + 4) = v4;
      v4 *= 2;
      *((_QWORD *)v5 + 5) = v4;
      v3 += 24;
    }
    while (v3 != 192);
  }
  return v1;
}

uint64_t print_io_histograms(unsigned int *a1, char *a2, const char *a3)
{
  uint64_t result;
  _DWORD *v5;
  const char *v6;
  _DWORD *v7;
  const char *v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  unsigned int v13;
  _DWORD *v14;
  const char *v15;
  uint64_t v16;
  unsigned int *i;
  _DWORD *v18;
  const char *v19;
  _DWORD *v20;
  const char *v21;
  unsigned int *v22;
  unint64_t v23;
  uint64_t v24;
  unsigned int *v25;
  unint64_t v26;
  unsigned int v27;
  uint64_t v28;
  _QWORD *j;
  _DWORD *v30;
  const char *v31;
  _DWORD *v32;
  const char *v33;
  char *v34;
  int v35;

  v35 = (int)a3;
  v34 = a2;
  result = 0xFFFFFFFFLL;
  if (a1 && a3 >= 0x2000)
  {
    if ((safe_snprintf(&v34, a2, a3, &v35, "IO Size Histogram:\n") & 0x80000000) == 0
      && (safe_snprintf(&v34, v5, v6, &v35, "     %s      %s            %s                     %s\n", "Begin", "End", "Frequency", "CDF") & 0x80000000) == 0)
    {
      if (*a1)
      {
        v9 = 0;
        v10 = 0;
        v11 = a1 + 4;
        do
        {
          v10 += v11[1];
          if ((safe_snprintf(&v34, v7, v8, &v35, "%*lluKB%*lluKB\t\t%*llu\t\t%*llu\n", 8, *(v11 - 1) >> 10, 8, *v11 >> 10, 8, v11[1], 8, v10) & 0x80000000) != 0)return 0xFFFFFFFFLL;
          v11 += 3;
          ++v9;
          v12 = *a1;
        }
        while (v9 < v12);
        v13 = v12 - 1;
      }
      else
      {
        v10 = 0;
        v13 = -1;
      }
      if ((safe_snprintf(&v34, v7, v8, &v35, "%*s%*lluKB\t\t%*llu\t\t%*llu\n", 10, ">", 8, *(_QWORD *)&a1[6 * v13 + 4] >> 10, 8, *((_QWORD *)a1 + 90), 8, *((_QWORD *)a1 + 90) + v10) & 0x80000000) == 0)
      {
        v16 = 0;
        for (i = a1 + 252; ; i += 182)
        {
          if (*(_QWORD *)&a1[16 * v16 + 182])
          {
            if ((safe_snprintf(&v34, v14, v15, &v35, "Tier %u Latency Histogram:\n", v16) & 0x80000000) != 0
              || (safe_snprintf(&v34, v18, v19, &v35, "      %s        %s                %s                    %s\n", "Begin", "End", "Freq", "CDF") & 0x80000000) != 0)
            {
              return 0xFFFFFFFFLL;
            }
            v22 = &a1[182 * v16 + 246];
            if (*v22)
            {
              v23 = 0;
              v24 = 0;
              v25 = i;
              while (1)
              {
                v24 += *(_QWORD *)v25;
                if ((safe_snprintf(&v34, v20, v21, &v35, "%*lluus%*lluus\t\t%*llu\t\t%*llu\n", 9, *((_QWORD *)v25 - 2), 9, *((_QWORD *)v25 - 1), 9, *(_QWORD *)v25, 9, v24) & 0x80000000) != 0)return 0xFFFFFFFFLL;
                v25 += 6;
                ++v23;
                v26 = *v22;
                if (v23 >= v26)
                {
                  v27 = v26 - 1;
                  goto LABEL_22;
                }
              }
            }
            v24 = 0;
            v27 = -1;
LABEL_22:
            if ((safe_snprintf(&v34, v20, v21, &v35, "%*s%*lluus\t\t%*llu\t\t%*llu\n", 10, ">", 9, *(_QWORD *)&a1[182 * v16 + 250 + 6 * v27], 9, *(_QWORD *)&a1[182 * v16 + 426], 9, *(_QWORD *)&a1[182 * v16 + 426] + v24) & 0x80000000) != 0)return 0xFFFFFFFFLL;
          }
          if (++v16 == 4)
          {
            v28 = 0;
            for (j = a1 + 182;
                  !*j
               || (safe_snprintf(&v34, v14, v15, &v35, "Tier %u Aggregate Stats:\n", v28) & 0x80000000) == 0
               && (safe_snprintf(&v34, v30, v31, &v35, "\tNum IOs %llu Latency Mean %lluus Max Latency %lluus Latency SD %lluus\n", *j, j[1] / *j, j[3], (unint64_t)sqrt((double)(unint64_t)(j[2] / *j - j[1] / *j * (j[1] / *j)))) & 0x80000000) == 0&& (safe_snprintf(&v34, v32, v33, &v35, "\tReads %llu (%llu KB) Writes %llu (%llu KB)\n", j[4], j[5] >> 10, j[6], j[7] >> 10) & 0x80000000) == 0;
                  j += 8)
            {
              result = 0;
              if (++v28 == 4)
                return result;
            }
            return 0xFFFFFFFFLL;
          }
        }
      }
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t safe_snprintf(char **a1, _DWORD *a2, const char *a3, ...)
{
  unsigned int v4;
  unsigned int v5;
  BOOL v6;
  unsigned int v7;
  uint64_t result;
  va_list va;

  va_start(va, a3);
  v4 = vsnprintf(*a1, *a2, a3, va);
  if ((v4 & 0x80000000) != 0)
    return 0xFFFFFFFFLL;
  v5 = v4;
  v7 = *a2 - v4;
  v6 = *a2 > v4;
  if (*a2 < v4)
    v7 = 0;
  *a2 = v7;
  if (!v6)
    return 0xFFFFFFFFLL;
  result = 0;
  *a1 += v5;
  return result;
}

unsigned int *update_histograms_stats(unsigned int *result, unsigned int a2, unint64_t a3, unint64_t a4, int a5)
{
  unsigned int *v5;
  unsigned int *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int *v10;
  uint64_t v11;
  _QWORD *v12;

  if (result)
  {
    v5 = &result[16 * (unint64_t)a2];
    ++*((_QWORD *)v5 + 91);
    *((_QWORD *)v5 + 92) += a4;
    *((_QWORD *)v5 + 93) += a4 * a4;
    if (*((_QWORD *)v5 + 94) < a4)
      *((_QWORD *)v5 + 94) = a4;
    v6 = &result[16 * (unint64_t)a2];
    if (a5)
    {
      *((_QWORD *)v6 + 96) += a3;
      v7 = v6 + 190;
    }
    else
    {
      *((_QWORD *)v6 + 98) += a3;
      v7 = v6 + 194;
    }
    ++*v7;
    v8 = result[182 * a2 + 246];
    if ((_DWORD)v8)
    {
      v9 = 0;
      v10 = &result[182 * a2 + 252];
      while (*((_QWORD *)v10 - 1) < a4)
      {
        ++v9;
        v10 += 6;
        if (v8 == v9)
          goto LABEL_15;
      }
      ++*(_QWORD *)v10;
    }
    else
    {
      LODWORD(v9) = 0;
    }
    if ((_DWORD)v9 == (_DWORD)v8)
LABEL_15:
      ++*(_QWORD *)&result[182 * a2 + 426];
    v11 = *result;
    if ((_DWORD)v11)
    {
      v12 = result + 6;
      while (*(v12 - 1) < a3)
      {
        v12 += 3;
        if (!--v11)
          goto LABEL_20;
      }
    }
    else
    {
LABEL_20:
      v12 = result + 180;
    }
    ++*v12;
  }
  return result;
}

double SACFAbsoluteTimeFromTimespec(uint64_t a1)
{
  return (double)*(uint64_t *)a1 - *MEMORY[0x1E0C9ADF8] + (double)*(unint64_t *)(a1 + 8) / 1000000000.0;
}

void sub_1B9C7133C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
  uint64_t v44;

  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose(&a44, 8);
  _Block_object_dispose((const void *)(v44 - 232), 8);
  _Block_object_dispose((const void *)(v44 - 200), 8);
  _Unwind_Resume(a1);
}

uint64_t SAMachTimeFromSecondsUsingTimebase(uint64_t a1, double a2)
{
  uint64_t result;

  result = 0;
  if ((_DWORD)a1 && HIDWORD(a1))
  {
    result = (unint64_t)(a2 * 1000000000.0);
    if (HIDWORD(a1) != (_DWORD)a1)
      return __udivti3();
  }
  return result;
}

double SASecondsFromMachTimeUsingLiveTimebase(uint64_t a1)
{
  BOOL v2;

  if (_MergedGlobals_7 != -1)
    dispatch_once(&_MergedGlobals_7, &__block_literal_global_9);
  if ((_DWORD)qword_1ED1DD908)
    v2 = HIDWORD(qword_1ED1DD908) == 0;
  else
    v2 = 1;
  if (v2)
  {
    a1 = 0;
  }
  else if ((_DWORD)qword_1ED1DD908 != HIDWORD(qword_1ED1DD908))
  {
    a1 = __udivti3();
  }
  return (double)(unint64_t)a1 / 1000000000.0;
}

uint64_t SAMachTimeFromSecondsUsingLiveTimebase(double a1)
{
  BOOL v2;
  uint64_t result;

  if (_MergedGlobals_7 != -1)
    dispatch_once(&_MergedGlobals_7, &__block_literal_global_9);
  if ((_DWORD)qword_1ED1DD908)
    v2 = HIDWORD(qword_1ED1DD908) == 0;
  else
    v2 = 1;
  if (v2)
    return 0;
  result = (unint64_t)(a1 * 1000000000.0);
  if (HIDWORD(qword_1ED1DD908) != (_DWORD)qword_1ED1DD908)
    return __udivti3();
  return result;
}

uint64_t SANanosecondsFromMachTimeUsingLiveTimebase(uint64_t a1)
{
  BOOL v2;

  if (_MergedGlobals_7 != -1)
    dispatch_once(&_MergedGlobals_7, &__block_literal_global_9);
  if ((_DWORD)qword_1ED1DD908)
    v2 = HIDWORD(qword_1ED1DD908) == 0;
  else
    v2 = 1;
  if (v2)
    return 0;
  if ((_DWORD)qword_1ED1DD908 != HIDWORD(qword_1ED1DD908))
    return __udivti3();
  return a1;
}

uint64_t SAMachTimeFromNanosecondsUsingLiveTimebase(uint64_t a1)
{
  BOOL v2;

  if (_MergedGlobals_7 != -1)
    dispatch_once(&_MergedGlobals_7, &__block_literal_global_9);
  if ((_DWORD)qword_1ED1DD908)
    v2 = HIDWORD(qword_1ED1DD908) == 0;
  else
    v2 = 1;
  if (v2)
    return 0;
  if (HIDWORD(qword_1ED1DD908) != (_DWORD)qword_1ED1DD908)
    return __udivti3();
  return a1;
}

double SAMachAbsTimeSecondsGetCurrent()
{
  uint64_t v0;

  v0 = mach_absolute_time();
  return SASecondsFromMachTimeUsingLiveTimebase(v0);
}

double SAMachContTimeSecondsGetCurrent()
{
  uint64_t v0;

  v0 = mach_continuous_time();
  return SASecondsFromMachTimeUsingLiveTimebase(v0);
}

uint64_t CopyDyldSnapshotForPid(_BOOL8 a1)
{
  uint64_t v2;
  double v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  int v7;
  NSObject *v8;
  void (**v9)(void);
  BOOL v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v15;
  _QWORD block[6];
  _BOOL4 v17;
  _BOOL4 v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double *v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[4];
  _BOOL4 v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  int v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  double v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  v24 = (double *)&v23;
  v25 = 0x2020000000;
  v26 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if (getpid() == a1)
  {
    v2 = mach_absolute_time();
    v3 = SASecondsFromMachTimeUsingLiveTimebase(v2);
    if (!dyld_process_create_for_current_task())
    {
      v7 = *__error();
      _sa_logt();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1B9BE0000, v8, OS_LOG_TYPE_FAULT, "Unable to get dyld process for current process", buf, 2u);
      }
      goto LABEL_17;
    }
    v18 = 0;
    v4 = dyld_process_snapshot_create_for_process();
    v20[3] = v4;
    if (v4)
    {
      v5 = mach_absolute_time();
      v6 = SASecondsFromMachTimeUsingLiveTimebase(v5);
      v24[3] = v6 - v3;
    }
    dyld_process_dispose();
    if (!v20[3])
    {
      v7 = *__error();
      _sa_logt();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        v28 = v18;
        _os_log_fault_impl(&dword_1B9BE0000, v8, OS_LOG_TYPE_FAULT, "Unable to get dyld process snapshot for current process: %d", buf, 8u);
      }
LABEL_17:

      v13 = 0;
      *__error() = v7;
      goto LABEL_18;
    }
  }
  else
  {
    if (_AvoidSuspendingPid(a1))
      goto LABEL_14;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __CopyDyldSnapshotForPid_block_invoke;
    block[3] = &unk_1E7148D40;
    v17 = a1;
    block[4] = &v19;
    block[5] = &v23;
    v9 = (void (**)(void))dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, block);
    v9[2]();
    v10 = v20[3] == 0;

    if (v10)
    {
LABEL_14:
      v13 = 0;
      goto LABEL_18;
    }
  }
  ++_MergedGlobals_8;
  *(double *)&qword_1ED1DD918 = v24[3] + *(double *)&qword_1ED1DD918;
  v11 = *__error();
  _sa_logt();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v15 = *((_QWORD *)v24 + 3);
    *(_DWORD *)buf = 67110144;
    v28 = a1;
    v29 = 2048;
    v30 = v15;
    v31 = 1024;
    v32 = _MergedGlobals_8;
    v33 = 2048;
    v34 = qword_1ED1DD918;
    v35 = 2048;
    v36 = *(double *)&qword_1ED1DD918 / (double)_MergedGlobals_8;
    _os_log_debug_impl(&dword_1B9BE0000, v12, OS_LOG_TYPE_DEBUG, "[%d]: Inspected live process via dyld introspection in %fs (%d totaling %fs, %fs avg)", buf, 0x2Cu);
  }

  *__error() = v11;
  v13 = v20[3];
LABEL_18:
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  return v13;
}

void sub_1B9C73648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t _CopyLoadInfosForDyldSnapshot(uint64_t a1, int a2, int a3, uint64_t a4, _QWORD *a5, _QWORD *a6, _QWORD *a7, _QWORD *a8)
{
  uint64_t shared_cache;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  id v22;
  int v23;
  NSObject *v24;
  _QWORD v26[3];
  char v27;
  uint8_t v28[4];
  int v29;
  uint8_t buf[8];
  uint8_t *v31;
  uint64_t v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (a5)
    *a5 = 0;
  if (a6)
    *a6 = 0;
  if (a7)
    *a7 = 0;
  if (a8)
    *a8 = 0;
  shared_cache = dyld_process_snapshot_get_shared_cache();
  if (shared_cache)
  {
    v15 = shared_cache;
    MEMORY[0x1BCCCBD9C]();
    MEMORY[0x1BCCCBDA8](v15);
    if (a6 || a3)
    {
      +[SASharedCache sharedCacheWithDyldSharedCache:]((uint64_t)SASharedCache, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (a6)
        *a6 = objc_retainAutorelease(v16);

    }
    if (a5)
      goto LABEL_26;
  }
  else
  {
    if (a2)
    {
      v18 = *__error();
      _sa_logt();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = a2;
        _os_log_impl(&dword_1B9BE0000, v19, OS_LOG_TYPE_INFO, "[%d] No shared cache", buf, 8u);
      }

      *__error() = v18;
    }
    if (a5)
      goto LABEL_26;
  }
  if (!a7 && (a3 & 1) == 0 && !a8)
    return 0;
LABEL_26:
  if (a5)
    v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  else
    v21 = 0;
  *(_QWORD *)buf = 0;
  v31 = buf;
  v32 = 0x2020000000;
  v33 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v27 = 0;
  v22 = v21;
  dyld_process_snapshot_for_each_image();
  v20 = *((unsigned int *)v31 + 6);
  if (!(_DWORD)v20 && a5)
  {
    if (objc_msgSend(v22, "count"))
    {
      +[SABinaryLoadInfo sortBinaryLoadInfos:]((uint64_t)SABinaryLoadInfo, v22);
    }
    else
    {
      v23 = *__error();
      _sa_logt();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)v28 = 67109120;
        v29 = a2;
        _os_log_fault_impl(&dword_1B9BE0000, v24, OS_LOG_TYPE_FAULT, "No non-shared cache load infos for [%d]", v28, 8u);
      }

      *__error() = v23;
    }
    *a5 = (id)objc_msgSend(v22, "copy");
  }

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(buf, 8);

  return v20;
}

void sub_1B9C73CA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t DyldImageEnumerateSegments(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  int v5;
  int v6;
  unsigned int v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  int v17;

  v3 = a2;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __DyldImageEnumerateSegments_block_invoke;
  v10[3] = &unk_1E7148D68;
  v12 = &v14;
  v13 = a1;
  v4 = v3;
  v11 = v4;
  v5 = MEMORY[0x1BCCCBD00](a1, v10);
  v6 = *((_DWORD *)v15 + 6);
  if (v6 > 0)
    v7 = -v6;
  else
    v7 = 0x80000000;
  if (v5)
    v8 = v6;
  else
    v8 = v7;

  _Block_object_dispose(&v14, 8);
  return v8;
}

void sub_1B9C73D98(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t SACompareDyldToCSLevel()
{
  if (qword_1ED1DD920 != -1)
    dispatch_once(&qword_1ED1DD920, &__block_literal_global_10);
  return dword_1ED1DD914;
}

const char *DyldImagePath(uint64_t a1)
{
  const char *v2;
  const char *v3;
  const char *v4;
  const char *v5;
  int v6;
  NSObject *v7;
  const char *v8;
  const char *v9;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (const char *)MEMORY[0x1BCCCBD18]();
  v3 = v2;
  if (!v2)
  {
    v8 = (const char *)MEMORY[0x1BCCCBD0C](a1);
    if (v8)
      goto LABEL_14;
LABEL_20:
    v6 = *__error();
    _sa_logt();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v11 = 136315138;
      v12 = v3;
      _os_log_impl(&dword_1B9BE0000, v7, OS_LOG_TYPE_INFO, "No absolute path from dyld: %s", (uint8_t *)&v11, 0xCu);
    }
LABEL_22:
    v8 = v3;
LABEL_23:

    *__error() = v6;
    return v8;
  }
  if (*v2 == 47)
  {
    if (qword_1ED1DD920 != -1)
      dispatch_once(&qword_1ED1DD920, &__block_literal_global_10);
    if (dword_1ED1DD914 < 2)
      return v3;
    v4 = (const char *)MEMORY[0x1BCCCBD0C](a1);
    if (!v4)
      return v3;
    v5 = v4;
    if (!strcmp(v3, v4))
      return v3;
    v6 = *__error();
    _sa_logt();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v11 = 136315394;
      v12 = v3;
      v13 = 2080;
      v14 = v5;
      _os_log_debug_impl(&dword_1B9BE0000, v7, OS_LOG_TYPE_DEBUG, "preferring dyld installname %s vs file_path %s", (uint8_t *)&v11, 0x16u);
    }
    goto LABEL_22;
  }
  v9 = (const char *)MEMORY[0x1BCCCBD0C](a1);
  if (!v9)
    goto LABEL_20;
  v8 = v9;
  if (*v9 != 47)
    goto LABEL_20;
LABEL_14:
  if (qword_1ED1DD920 == -1)
  {
    if (!v3)
      return v8;
  }
  else
  {
    dispatch_once(&qword_1ED1DD920, &__block_literal_global_10);
    if (!v3)
      return v8;
  }
  if (dword_1ED1DD914 >= 2 && strcmp(v3, v8))
  {
    v6 = *__error();
    _sa_logt();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v11 = 136315394;
      v12 = v8;
      v13 = 2080;
      v14 = v3;
      _os_log_debug_impl(&dword_1B9BE0000, v7, OS_LOG_TYPE_DEBUG, "preferring dyld file_path %s vs installname %s", (uint8_t *)&v11, 0x16u);
    }
    goto LABEL_23;
  }
  return v8;
}

void sub_1B9C74534(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _saos_printf_frame_timerange(void *a1, unint64_t a2, unint64_t a3)
{
  id v5;
  id v6;

  v5 = a1;
  if (a2 <= a3)
  {
    v6 = v5;
    objc_msgSend(v5, "printWithFormat:", CFSTR(" %lu"), a2);
    v5 = v6;
    if (a2 != a3)
    {
      objc_msgSend(v6, "printWithFormat:", CFSTR("-%lu"), a3);
      v5 = v6;
    }
  }

}

uint64_t _saos_printf_state_appended_noparens(void *a1, uint64_t a2, uint64_t *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  unint64_t v15;
  _BOOL4 v16;
  const __CFString *v17;
  char v18;
  int v19;
  const __CFString *v20;
  uint64_t v22;

  v7 = a1;
  v8 = a4;
  v9 = v8;
  if (!a3)
  {
    v11 = v8 != 0;
    if (a2 || v8)
    {
      if ((a2 & 1) != 0)
      {
        v13 = objc_msgSend(v7, "appendString:", CFSTR("suspended"));
        if ((a2 & 4) == 0)
          goto LABEL_27;
      }
      else
      {
        v13 = 0;
        if ((a2 & 4) == 0)
          goto LABEL_27;
      }
      goto LABEL_20;
    }
LABEL_9:
    v13 = 0;
    goto LABEL_81;
  }
  v10 = *a3;
  v11 = v8 != 0;
  if (!v8 && v10 == a2)
    goto LABEL_9;
  LOBYTE(v12) = v10 ^ a2;
  if (((v10 ^ a2) & 1) == 0)
  {
    v13 = 0;
    if (((v10 ^ a2) & 4) != 0)
      goto LABEL_20;
LABEL_17:
    if ((a2 & 4) != 0)
      goto LABEL_26;
LABEL_25:
    if (!(v10 & 4 | v12 & 2))
    {
LABEL_26:
      v15 = a2 & 0x7F8;
      v16 = v15 != 0;
      goto LABEL_38;
    }
    goto LABEL_30;
  }
  if ((a2 & 1) != 0)
    v14 = CFSTR("suspended");
  else
    v14 = CFSTR("unsuspended");
  v13 = objc_msgSend(v7, "appendString:", v14);
  v10 = *a3;
  v12 = *a3 ^ a2;
  if ((v12 & 4) == 0)
    goto LABEL_17;
LABEL_20:
  if ((int)v13 >= 1)
    LODWORD(v13) = objc_msgSend(v7, "appendString:", CFSTR(", ")) + v13;
  if ((a2 & 4) == 0)
  {
    v13 = objc_msgSend(v7, "appendString:", CFSTR("not running")) + v13;
    if (a3)
    {
      v10 = *a3;
      v12 = *a3 ^ a2;
      goto LABEL_25;
    }
LABEL_27:
    if ((a2 & 2) == 0)
    {
      LODWORD(v15) = a2 & 0x7F8;
      if ((a2 & 0x7F8) == 0)
        goto LABEL_59;
      goto LABEL_45;
    }
LABEL_30:
    if ((int)v13 >= 1)
      LODWORD(v13) = objc_msgSend(v7, "appendString:", CFSTR(", ")) + v13;
    if ((a2 & 2) != 0)
      v17 = CFSTR("runnable");
    else
      v17 = CFSTR("not runnable");
    goto LABEL_36;
  }
  v17 = CFSTR("running");
LABEL_36:
  v13 = objc_msgSend(v7, "appendString:", v17) + v13;
  v15 = a2 & 0x7F8;
  v16 = v15 != 0;
  if (!a3)
  {
    if ((a2 & 0x7F8) == 0)
      goto LABEL_59;
    goto LABEL_45;
  }
  v10 = *a3;
LABEL_38:
  if (((v16 ^ ((v10 & 0x7F8) != 0)) & 1) != 0)
    goto LABEL_46;
  v18 = !v16;
  if ((v10 & 0x7F8) == 0)
    v18 = 1;
  if ((v18 & 1) == 0 && (v15 >> 3) != (v10 >> 3))
  {
LABEL_45:
    v16 = 1;
LABEL_46:
    if ((int)v13 >= 1)
      LODWORD(v13) = objc_msgSend(v7, "appendString:", CFSTR(", ")) + v13;
    if (v16)
      v19 = objc_msgSend(v7, "printWithFormat:", CFSTR("on cpu %u"), ((v15 >> 3) - 1));
    else
      v19 = objc_msgSend(v7, "printWithFormat:", CFSTR("on cpu UNKNOWN"), v22);
    v13 = (v19 + v13);
    if (a3)
    {
      v10 = *a3;
      goto LABEL_53;
    }
LABEL_59:
    if ((a2 & 0x800) == 0)
      goto LABEL_70;
    goto LABEL_60;
  }
LABEL_53:
  LOWORD(v10) = v10 ^ a2;
  if ((v10 & 0x800) == 0)
    goto LABEL_64;
  if ((a2 & 0x800) != 0)
  {
LABEL_60:
    if ((int)v13 >= 1)
      LODWORD(v13) = objc_msgSend(v7, "appendString:", CFSTR(", ")) + v13;
    v13 = objc_msgSend(v7, "printWithFormat:", CFSTR("e-core")) + v13;
    if (a3)
      goto LABEL_63;
LABEL_70:
    if ((a2 & 0x1000) == 0)
      goto LABEL_71;
LABEL_73:
    if ((int)v13 >= 1)
      LODWORD(v13) = objc_msgSend(v7, "appendString:", CFSTR(", ")) + v13;
    v20 = CFSTR("p-core");
    goto LABEL_76;
  }
  if ((a2 & 0x1000) == 0)
  {
    if ((int)v13 >= 1)
      LODWORD(v13) = objc_msgSend(v7, "appendString:", CFSTR(", ")) + v13;
    v13 = objc_msgSend(v7, "printWithFormat:", CFSTR("not e-core")) + v13;
  }
LABEL_63:
  v10 = *a3 ^ a2;
LABEL_64:
  if ((v10 & 0x1000) == 0)
    goto LABEL_77;
  if ((a2 & 0x1000) != 0)
    goto LABEL_73;
  if ((a2 & 0x800) == 0)
  {
    if ((int)v13 >= 1)
      LODWORD(v13) = objc_msgSend(v7, "appendString:", CFSTR(", ")) + v13;
    v20 = CFSTR("not p-core");
LABEL_76:
    v13 = objc_msgSend(v7, "printWithFormat:", v20) + v13;
LABEL_77:
    if (!v11)
      goto LABEL_81;
    goto LABEL_78;
  }
LABEL_71:
  if (!v11)
    goto LABEL_81;
LABEL_78:
  if ((int)v13 >= 1)
    LODWORD(v13) = objc_msgSend(v7, "appendString:", CFSTR(", ")) + v13;
  v13 = objc_msgSend(v7, "printWithFormat:", CFSTR("blocked by %@"), v9) + v13;
LABEL_81:

  return v13;
}

void _saos_printf_state_appended(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  if (a2 || a3)
  {
    v5 = a3;
    v6 = a1;
    objc_msgSend(v6, "appendString:", CFSTR(" ("));
    _saos_printf_state_appended_noparens(v6, a2, 0, v5);

    objc_msgSend(v6, "appendString:", CFSTR(")"));
  }
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void sub_1B9C76668(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1B9C781B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t TaskHasSwallowedAnExceptionNotedByHIException(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v1 = a1;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  objc_msgSend(v1, "threads");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __TaskHasSwallowedAnExceptionNotedByHIException_block_invoke;
  v5[3] = &unk_1E7147860;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v5);

  v3 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);

  return v3;
}

void sub_1B9C78500(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *_shared_cache_display_string(void *a1)
{
  _DWORD *v1;
  _DWORD *v2;
  __CFString *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v11;
  uint64_t v12;

  v1 = a1;
  if (!v1
    || (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
        v2 = (_DWORD *)objc_claimAutoreleasedReturnValue(),
        v2,
        v2 == v1))
  {
    v3 = CFSTR("None");
    goto LABEL_15;
  }
  v3 = (__CFString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = objc_msgSend(v1, "slidBaseAddress");
  v5 = objc_msgSend(v1, "slide");
  objc_msgSend(v1, "uuid");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v4 == -1)
  {
    if (v5 == -1)
      -[__CFString appendFormat:](v3, "appendFormat:", CFSTR("%@"), v6, v11, v12);
    else
      -[__CFString appendFormat:](v3, "appendFormat:", CFSTR("%@ slide 0x%llx"), v6, objc_msgSend(v1, "slide"), v12);
  }
  else
  {
    v8 = objc_msgSend(v1, "slidBaseAddress");
    if (v5 == -1)
      -[__CFString appendFormat:](v3, "appendFormat:", CFSTR("%@ slid base address 0x%llx"), v7, v8, v12);
    else
      -[__CFString appendFormat:](v3, "appendFormat:", CFSTR("%@ slid base address 0x%llx, slide 0x%llx"), v7, v8, objc_msgSend(v1, "slide"));
  }

  v9 = v1[7];
  if ((v9 & 1) == 0)
  {
    if ((v9 & 2) == 0)
      goto LABEL_13;
LABEL_17:
    -[__CFString appendFormat:](v3, "appendFormat:", CFSTR(" (DriverKit)"));
    if ((v1[7] & 4) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  -[__CFString appendFormat:](v3, "appendFormat:", CFSTR(" (System Primary)"));
  v9 = v1[7];
  if ((v9 & 2) != 0)
    goto LABEL_17;
LABEL_13:
  if ((v9 & 4) != 0)
LABEL_14:
    -[__CFString appendFormat:](v3, "appendFormat:", CFSTR(" (Rosetta)"));
LABEL_15:

  return v3;
}

void sub_1B9C7971C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

id seconds_string_for_nanoseconds(unint64_t a1)
{
  unint64_t v1;
  const char *v2;

  if (a1 <= 0x989680)
    v1 = 10000000;
  else
    v1 = a1;
  if (a1 >= 0x989680)
    v2 = "";
  else
    v2 = "<";
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s%.*fs"), v2, 2, (double)v1 / 1000000000.0);
}

uint64_t saos_printf_seconds(void *a1, unint64_t a2, uint64_t a3)
{
  id v5;
  unint64_t v6;
  int v7;
  uint64_t v8;

  v5 = a1;
  v6 = (unint64_t)__exp10((double)(9 - a3));
  if (v6 <= a2)
  {
    v7 = 0;
  }
  else
  {
    v7 = objc_msgSend(v5, "appendString:", CFSTR("<"));
    a2 = v6;
  }
  v8 = objc_msgSend(v5, "printWithFormat:", CFSTR("%.*fs"), a3, (double)a2 / 1000000000.0) + v7;

  return v8;
}

uint64_t saos_printf_time_scaled(void *a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  const char *v7;
  BOOL v8;
  const char *v9;

  v4 = a2 / 0x3B9ACA00;
  if (a2 % 0x3B9ACA00)
  {
    v4 = a2 / 0xF4240;
    v5 = a2 % 0xF4240;
    v6 = a2 / 0x3E8;
    if (a2 % 0x3E8)
      v7 = "n";
    else
      v7 = "u";
    if (a2 % 0x3E8)
      v6 = a2;
    v8 = v5 == 0;
    if (v5)
      v9 = v7;
    else
      v9 = "m";
    if (!v8)
      v4 = v6;
  }
  else
  {
    v9 = "";
  }
  return objc_msgSend(a1, "printWithFormat:", CFSTR("%llu%ss"), v4, v9, v2, v3);
}

uint64_t saos_printf_cycles_instructions(void *a1, unint64_t a2, unint64_t a3, int a4)
{
  double v4;
  double v5;
  double v6;
  const char *v7;
  double v9;
  double v10;
  double v11;
  const char *v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;

  if (a4)
  {
    if (a3)
      v4 = (double)a2 / (double)a3;
    else
      v4 = 0.0;
    return objc_msgSend(a1, "printWithFormat:", CFSTR(" (%llu cycles, %llu instructions, %fc/i)"), a2, a3, *(_QWORD *)&v4, v15, v16);
  }
  v5 = (double)a2;
  if (a2 > 0x71AFD498D0000)
  {
    v6 = 1.0e15;
    v7 = "P";
LABEL_14:
    v9 = v5 / v6;
    goto LABEL_15;
  }
  if (a2 > 0x1D1A94A2000)
  {
    v6 = 1.0e12;
    v7 = "T";
    goto LABEL_14;
  }
  if (a2 > 0x77359400)
  {
    v6 = 1000000000.0;
    v7 = "G";
    goto LABEL_14;
  }
  if (a2 > 0x1E8480)
  {
    v6 = 1000000.0;
    v7 = "M";
    goto LABEL_14;
  }
  v9 = v5 / 1000.0;
  if (a2 <= 0x7D0)
    v9 = (double)a2;
  v7 = "";
  if (a2 > 0x7D0)
    v7 = "K";
LABEL_15:
  v10 = (double)a3;
  if (a3 <= 0x71AFD498D0000)
  {
    if (a3 <= 0x1D1A94A2000)
    {
      if (a3 <= 0x77359400)
      {
        if (a3 <= 0x1E8480)
        {
          v13 = v10 / 1000.0;
          if (a3 <= 0x7D0)
            v13 = (double)a3;
          v12 = "";
          if (a3 > 0x7D0)
            v12 = "K";
          goto LABEL_24;
        }
        v11 = 1000000.0;
        v12 = "M";
      }
      else
      {
        v11 = 1000000000.0;
        v12 = "G";
      }
    }
    else
    {
      v11 = 1.0e12;
      v12 = "T";
    }
  }
  else
  {
    v11 = 1.0e15;
    v12 = "P";
  }
  v13 = v10 / v11;
LABEL_24:
  v14 = v5 / v10;
  if (!a3)
    v14 = 0.0;
  return objc_msgSend(a1, "printWithFormat:", CFSTR(" (%.1f%s cycles, %.1f%s instructions, %.2fc/i)"), *(_QWORD *)&v9, v7, *(_QWORD *)&v13, v12, *(_QWORD *)&v14);
}

void saos_printf_seconds_sigfig(void *a1, double a2)
{
  id v3;
  double v4;
  unsigned int v5;

  v5 = 0;
  v3 = a1;
  v4 = ReduceToSignificantDigits(2, &v5, a2);
  objc_msgSend(v3, "printWithFormat:", CFSTR("%.*fs"), (2 - v5) & ~((int)(2 - v5) >> 31), *(_QWORD *)&v4);

}

void sub_1B9C7DEBC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose(&STACK[0x260], 8);
  _Block_object_dispose(&STACK[0x280], 8);
  _Block_object_dispose(&STACK[0x2A0], 8);
  _Block_object_dispose(&STACK[0x2C0], 8);
  _Block_object_dispose(&STACK[0x2F0], 8);
  _Block_object_dispose(&STACK[0x320], 8);
  _Block_object_dispose(&STACK[0x340], 8);
  _Block_object_dispose(&STACK[0x370], 8);
  _Block_object_dispose(&STACK[0x3A0], 8);
  _Block_object_dispose(&STACK[0x3D0], 8);
  _Block_object_dispose((const void *)(v1 - 240), 8);
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1B9C7E700(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1B9C8111C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B9C81210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B9C812D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B9C84C00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose(&STACK[0x2C0], 8);
  _Unwind_Resume(a1);
}

void sub_1B9C850C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1B9C87510(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Block_object_dispose(&STACK[0x758], 8);
  _Block_object_dispose(&STACK[0x778], 8);
  _Block_object_dispose(&STACK[0x798], 8);
  _Block_object_dispose(&STACK[0x7C8], 8);
  _Block_object_dispose(&STACK[0x7F8], 8);
  _Block_object_dispose(&STACK[0x818], 8);
  _Block_object_dispose(&STACK[0x838], 8);
  _Block_object_dispose(&STACK[0x858], 8);
  _Block_object_dispose(&STACK[0x878], 8);
  _Block_object_dispose(&STACK[0x898], 8);
  _Block_object_dispose(&STACK[0x8B8], 8);
  _Block_object_dispose(&STACK[0x8D8], 8);
  _Unwind_Resume(a1);
}

uint64_t saos_printf_microstackshot_state(void *a1, uint64_t a2, int a3, int a4, int a5)
{
  id v9;
  void *v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  int v15;
  const __CFString *v16;
  int v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  unsigned int v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  unsigned int v27;
  uint64_t v28;
  const char *v29;

  v9 = a1;
  v10 = v9;
  if (a4)
  {
    v11 = objc_msgSend(v9, "printWithFormat:", CFSTR("state 0x%x"), a2);
    goto LABEL_71;
  }
  if ((a2 & 2) != (a3 & 2))
  {
    if ((a2 & 2) != 0)
      v16 = CFSTR("Frontmost App");
    else
      v16 = CFSTR("Non-Frontmost App");
    v11 = objc_msgSend(v9, "appendString:", v16);
    v12 = a2 & 0x20;
    if (v12 == (a3 & 0x20))
      goto LABEL_18;
    v17 = objc_msgSend(v10, "appendString:", CFSTR(", ")) + v11;
LABEL_14:
    if (v12)
      v18 = CFSTR("Suppressed");
    else
      v18 = CFSTR("Non-Suppressed");
    v11 = objc_msgSend(v10, "appendString:", v18) + v17;
LABEL_18:
    v15 = a2 & 0x80;
    if (v15 == (a3 & 0x80))
      goto LABEL_24;
    v13 = objc_msgSend(v10, "appendString:", CFSTR(", ")) + v11;
LABEL_20:
    if (v15)
      v19 = CFSTR("Kernel mode");
    else
      v19 = CFSTR("User mode");
    v11 = objc_msgSend(v10, "appendString:", v19) + v13;
LABEL_24:
    v14 = 1;
    if (!a5)
      goto LABEL_48;
LABEL_25:
    if ((a2 & 0x10) == 0)
    {
      if ((a3 & 0x10) == 0)
        goto LABEL_48;
      if (v14)
        LODWORD(v11) = objc_msgSend(v10, "appendString:", CFSTR(", ")) + v11;
      v20 = CFSTR("Unknown User Activity, Unknown Power Source");
      goto LABEL_46;
    }
    if ((a3 & 0x10) == 0 || ((a3 ^ a2) & 4) != 0)
    {
      if (v14)
        LODWORD(v11) = objc_msgSend(v10, "appendString:", CFSTR(", ")) + v11;
      if ((a2 & 4) != 0)
        v21 = CFSTR("User Idle");
      else
        v21 = CFSTR("User Active");
      v11 = objc_msgSend(v10, "appendString:", v21) + v11;
      if ((a3 & 0x10) != 0 && ((a3 ^ a2) & 8) == 0)
        goto LABEL_47;
    }
    else
    {
      if (((a3 ^ a2) & 8) == 0)
        goto LABEL_48;
      if (!v14)
        goto LABEL_43;
    }
    LODWORD(v11) = objc_msgSend(v10, "appendString:", CFSTR(", ")) + v11;
LABEL_43:
    if ((a2 & 8) != 0)
      v20 = CFSTR("On Battery");
    else
      v20 = CFSTR("On AC");
LABEL_46:
    v11 = objc_msgSend(v10, "appendString:", v20) + v11;
LABEL_47:
    v14 = 1;
    goto LABEL_48;
  }
  v12 = a2 & 0x20;
  if (v12 != (a3 & 0x20))
  {
    v17 = 0;
    goto LABEL_14;
  }
  v13 = 0;
  v11 = 0;
  v14 = 0;
  v15 = a2 & 0x80;
  if (v15 != (a3 & 0x80))
    goto LABEL_20;
  if (a5)
    goto LABEL_25;
LABEL_48:
  if ((a2 & 0x700) == (a3 & 0x700))
  {
    v22 = a2 & 0x3800;
    if (v22 == (a3 & 0x3800))
      goto LABEL_64;
    if (!v14)
      goto LABEL_59;
  }
  else
  {
    if (v14)
      LODWORD(v11) = objc_msgSend(v10, "appendString:", CFSTR(", ")) + v11;
    v23 = ((unsigned __int16)(a2 & 0x700) >> 8) - 1;
    if (v23 >= 7)
      v24 = "Thread QoS Unknown";
    else
      v24 = off_1E7149BF0[v23];
    v11 = objc_msgSend(v10, "printWithFormat:", CFSTR("Effective %s"), v24) + v11;
    v22 = a2 & 0x3800;
    if (v22 == (a3 & 0x3800))
      goto LABEL_63;
  }
  LODWORD(v11) = objc_msgSend(v10, "appendString:", CFSTR(", ")) + v11;
LABEL_59:
  v25 = (v22 >> 11) - 1;
  if (v25 > 6)
    v26 = "Thread QoS Unknown";
  else
    v26 = off_1E7149BF0[v25];
  v11 = objc_msgSend(v10, "printWithFormat:", CFSTR("Requested %s"), v26) + v11;
LABEL_63:
  v14 = 1;
LABEL_64:
  v27 = a2 & 0x1C000;
  if (v27 != (a3 & 0x1C000))
  {
    if (v14)
      LODWORD(v11) = objc_msgSend(v10, "appendString:", CFSTR(", ")) + v11;
    v28 = (v27 >> 14) - 1;
    if (v28 > 6)
      v29 = "Thread QoS Unknown";
    else
      v29 = off_1E7149BF0[v28];
    v11 = objc_msgSend(v10, "printWithFormat:", CFSTR("Override %s"), v29) + v11;
  }
LABEL_71:

  return v11;
}

void sub_1B9C8D1C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B9C8F4C8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose(&STACK[0x2D0], 8);
  _Block_object_dispose(&STACK[0x2F0], 8);
  _Block_object_dispose(&STACK[0x310], 8);
  _Block_object_dispose(&STACK[0x340], 8);
  _Block_object_dispose(&STACK[0x370], 8);
  _Block_object_dispose(&STACK[0x390], 8);
  _Block_object_dispose(&STACK[0x3B0], 8);
  _Block_object_dispose(&STACK[0x3D0], 8);
  _Block_object_dispose(&STACK[0x3F0], 8);
  _Block_object_dispose(&STACK[0x410], 8);
  _Block_object_dispose(&STACK[0x430], 8);
  _Block_object_dispose(&STACK[0x450], 8);
  _Block_object_dispose(&STACK[0x470], 8);
  _Block_object_dispose(&STACK[0x490], 8);
  _Block_object_dispose(&STACK[0x4B0], 8);
  _Block_object_dispose(&STACK[0x4D0], 8);
  _Block_object_dispose(&STACK[0x4F0], 8);
  _Block_object_dispose(&STACK[0x510], 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Block_object_dispose(&STACK[0x540], 8);
  _Block_object_dispose(&STACK[0x560], 8);
  _Block_object_dispose(&STACK[0x580], 8);
  _Unwind_Resume(a1);
}

void sub_1B9C93B38(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 240), 8);
  _Unwind_Resume(a1);
}

__CFString *StringForThreadQoS(unsigned int a1)
{
  uint64_t v1;
  __CFString *v3;

  v1 = a1;
  v3 = CFSTR("user interactive");
  switch(a1)
  {
    case 0u:
      v3 = CFSTR("unspecified");
      break;
    case 1u:
      v3 = CFSTR("maintenance");
      break;
    case 2u:
      v3 = CFSTR("background");
      break;
    case 3u:
      v3 = CFSTR("utility");
      break;
    case 4u:
      v3 = CFSTR("default");
      break;
    case 5u:
      v3 = CFSTR("user initiated");
      break;
    case 6u:
      return v3;
    default:
      if (CFSTR("user interactive") == 125)
        v3 = CFSTR("unavailable");
      else
        v3 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unknown (0x%x)"), v1);
      break;
  }
  return v3;
}

void sub_1B9C9BFF4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void saos_printf_timeline_frame(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, void *a6, unint64_t a7)
{
  id v13;

  v13 = a1;
  _saos_printf_frame_base(v13, a2, a3, a4, a5, a6);
  _saos_printf_frame_timerange(v13, a7 - a4 + 1, a7);
  objc_msgSend(v13, "appendString:", CFSTR("\n"));

}

void saos_printf_frame_noindent(void *a1, uint64_t a2, uint64_t a3, int a4, void *a5)
{
  id v9;

  v9 = a1;
  _saos_printf_frame_base_noindent(v9, a2, a3, a4, a5);
  objc_msgSend(v9, "appendString:", CFSTR("\n"));

}

void saos_printf_timeline_frame_noindent(void *a1, uint64_t a2, uint64_t a3, int a4, void *a5, unint64_t a6)
{
  id v11;

  v11 = a1;
  _saos_printf_frame_base_noindent(v11, a2, a3, a4, a5);
  _saos_printf_frame_timerange(v11, a6 - a3 + 1, a6);
  objc_msgSend(v11, "appendString:", CFSTR("\n"));

}

BOOL _microstackshot_state_has_change_to_display(int a1, int a2, char a3, int a4)
{
  BOOL v5;
  _BOOL8 result;
  int v7;
  BOOL v8;

  v5 = a1 == a2;
  result = a1 != a2;
  if (v5 || (a3 & 1) != 0)
    return result;
  v7 = a2 ^ a1;
  if (!a4)
  {
    if ((v7 & 0x3FA2) == 0)
      return (v7 & 0x1C000) != 0;
    return 1;
  }
  if ((v7 & 0x10) != 0)
    return 1;
  v8 = (a1 & a2 & 0x10) == 0;
  if ((v7 & 0xC) == 0)
    v8 = 1;
  result = 1;
  if ((v7 & 0x3FA2) == 0 && v8)
    return (v7 & 0x1C000) != 0;
  return result;
}

void saos_printf_frame_with_state(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, void *a6, uint64_t a7, void *a8)
{
  id v15;
  id v16;

  v15 = a8;
  v16 = a1;
  _saos_printf_frame_base(v16, a2, a3, a4, a5, a6);
  _saos_printf_state_appended(v16, a7, v15);

  objc_msgSend(v16, "appendString:", CFSTR("\n"));
}

void saos_printf_microstackshot_state_as_frame(void *a1, uint64_t a2, unsigned int a3, uint64_t a4, int a5, uint64_t a6, uint64_t *a7, unsigned int a8, int a9, char a10, unsigned __int8 a11, char a12, void *a13)
{
  id v20;

  v20 = a1;
  _saos_printf_microstackshot_state_as_frame_base(v20, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
  objc_msgSend(v20, "appendString:", CFSTR("\n"));

}

void saos_printf_timeline_frame_with_state(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, void *a6, uint64_t a7, void *a8, unint64_t a9)
{
  id v16;
  id v17;

  v16 = a8;
  v17 = a1;
  _saos_printf_frame_base(v17, a2, a3, a4, a5, a6);
  _saos_printf_state_appended(v17, a7, v16);

  _saos_printf_frame_timerange(v17, a9 - a4 + 1, a9);
  objc_msgSend(v17, "appendString:", CFSTR("\n"));

}

void saos_printf_microstackshot_state_as_timeline_frame(void *a1, uint64_t a2, unsigned int a3, uint64_t a4, int a5, uint64_t a6, uint64_t *a7, unsigned int a8, int a9, char a10, unsigned __int8 a11, unint64_t a12, char a13, void *a14)
{
  id v21;

  v21 = a1;
  _saos_printf_microstackshot_state_as_frame_base(v21, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a13, a14);
  _saos_printf_frame_timerange(v21, a12 - a4 + 1, a12);
  objc_msgSend(v21, "appendString:", CFSTR("\n"));

}

void saos_printf_call_tree_node_noindent(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;

  v7 = a4;
  v8 = a1;
  _saos_printf_indent_and_count_noindent(v8, a2, a3, 0);
  objc_msgSend(v8, "printWithFormat:", CFSTR("%@\n"), v7);

}

void saos_printf_call_tree_node_without_count(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;

  v7 = a4;
  v8 = a1;
  _saos_printf_indent_and_kernel_dot(v8, a2, 0, 0);
  objc_msgSend(v8, "printWithFormat:", CFSTR("%*s  "), a3, "");
  objc_msgSend(v8, "printWithFormat:", CFSTR("<%@>\n"), v7);

}

uint64_t _saos_printf_indent_and_kernel_dot(void *a1, uint64_t a2, int a3, int a4)
{
  id v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  int v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[4];
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  if (a2 >= 0x7FFFFFFF)
  {
    v14 = *__error();
    _sa_logt();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v23 = a2;
      _os_log_error_impl(&dword_1B9BE0000, v15, OS_LOG_TYPE_ERROR, "indent %u", buf, 8u);
    }

    *__error() = v14;
    _SASetCrashLogMessage(282, "indent %u", v16, v17, v18, v19, v20, v21, a2);
    _os_crash();
    __break(1u);
  }
  v8 = v7;
  if (a4)
  {
    v9 = "";
    if (a3)
      v9 = "*";
    v10 = objc_msgSend(v7, "printWithFormat:", CFSTR("%d%s "), (a2 >> 1) - 1, v9);
  }
  else
  {
    v11 = "";
    if (a3)
      v11 = "*";
    v10 = objc_msgSend(v7, "printWithFormat:", CFSTR("%*s"), a2, v11);
  }
  v12 = v10;

  return v12;
}

void _saos_printf_frame_base_noindent(void *a1, uint64_t a2, uint64_t a3, int a4, void *a5)
{
  id v9;
  id v10;

  v9 = a5;
  v10 = a1;
  _saos_printf_indent_and_count_noindent(v10, a2, a3, a4);
  objc_msgSend(v10, "appendString:", v9);

}

uint64_t _saos_printf_indent_and_count_noindent(void *a1, uint64_t a2, uint64_t a3, int a4)
{
  id v7;
  int v8;

  v7 = a1;
  v8 = _saos_printf_indent_and_kernel_dot(v7, a2, a4, 1);
  LODWORD(a3) = objc_msgSend(v7, "printWithFormat:", CFSTR("%lu "), a3);

  return (a3 + v8);
}

void _saos_printf_microstackshot_state_as_frame_base(void *a1, uint64_t a2, unsigned int a3, uint64_t a4, int a5, uint64_t a6, uint64_t *a7, uint64_t a8, int a9, char a10, unsigned __int8 a11, char a12, void *a13)
{
  id v18;
  _BOOL4 v19;
  _BOOL4 v20;
  int v21;
  BOOL v22;
  int v23;
  int v24;
  int v25;
  int v26;
  void *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v31;
  id v33;

  v33 = a1;
  v18 = a13;
  v29 = a8;
  v19 = _microstackshot_state_has_change_to_display(a8, a9, a10, a11);
  v20 = v19;
  v28 = a7;
  v31 = a6;
  if ((a10 & 1) != 0)
  {
    v21 = 0;
  }
  else
  {
    if (a7)
      v22 = *a7 == a6;
    else
      v22 = a6 == 0;
    v21 = !v22;
  }
  if (v18)
    v23 = 1;
  else
    v23 = v19;
  if ((v23 & 1) != 0 || v21)
  {
    if (a12)
      v24 = _saos_printf_indent_and_count_noindent(v33, a2, a4, a5);
    else
      v24 = _saos_printf_indent_and_count(v33, a2, a3, a4, a5);
    if ((a10 & 1) != 0)
    {
      if (v23)
      {
        objc_msgSend(v33, "printWithFormat:", CFSTR("state 0x%x"), v29);
        if (v18)
          objc_msgSend(v33, "printWithFormat:", CFSTR(", on behalf of %@"), v18);
      }
    }
    else
    {
      v25 = objc_msgSend(v33, "appendString:", CFSTR("<")) + v24;
      if (v18)
        v26 = objc_msgSend(v33, "printWithFormat:", CFSTR("on behalf of %@"), v18) + v25;
      else
        v26 = v25;
      if (v20)
      {
        if (v26 > v25)
          v26 += objc_msgSend(v33, "appendString:", CFSTR(", "));
        v26 += saos_printf_microstackshot_state(v33, v29, a9, 0, a11);
      }
      if (v21)
      {
        v27 = v33;
        if (v26 > v25)
        {
          objc_msgSend(v33, "appendString:", CFSTR(", "));
          v27 = v33;
        }
        _saos_printf_state_appended_noparens(v27, v31, v28, 0);
      }
      objc_msgSend(v33, "appendString:", CFSTR(">"));
    }
  }

}

void sub_1B9CA1D34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1B9CA2118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void FreeMountStatusData(char *a1)
{
  void **v2;
  void ***v3;
  void **v4;

  if (a1)
  {
    v2 = *(void ***)a1;
    if (v2)
    {
      v3 = (void ***)(a1 + 8);
      do
      {
        if (v2[1])
        {
          free(v2[1]);
          v2 = *(v3 - 1);
        }
        free(v2);
        v4 = *v3++;
        v2 = v4;
      }
      while (v4);
    }
    free(a1);
  }
}

char *CopyMountStatusData()
{
  char *v0;
  uint64_t v1;
  unsigned int *v2;
  dispatch_semaphore_t v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_time_t v6;
  unsigned int v7;
  _QWORD block[4];
  NSObject *v10;
  char *v11;
  unsigned int *v12;

  if (qword_1ED1DD948 != -1)
    dispatch_once(&qword_1ED1DD948, &__block_literal_global_40);
  if (!_MergedGlobals_9)
    return 0;
  v0 = 0;
  if (!dispatch_semaphore_wait((dispatch_semaphore_t)qword_1ED1DD938, 0))
  {
    v0 = (char *)malloc_type_malloc((8 * (_MergedGlobals_9 + 1)) | 4, 0x5764AB8FuLL);
    v1 = (_MergedGlobals_9 + 1);
    bzero(v0, 8 * v1);
    v2 = (unsigned int *)&v0[8 * v1];
    *v2 = 2;
    v3 = dispatch_semaphore_create(0);
    v4 = qword_1ED1DD940;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __CopyMountStatusData_block_invoke_42;
    block[3] = &unk_1E7149CC0;
    v11 = v0;
    v12 = v2;
    v5 = v3;
    v10 = v5;
    dispatch_async(v4, block);
    v6 = dispatch_time(0, 1000000000);
    if (dispatch_semaphore_wait(v5, v6))
    {
      do
        v7 = __ldxr(v2);
      while (__stxr(v7 - 1, v2));
      if (v7 == 1)
        free(v0);
      v0 = 0;
    }

  }
  return v0;
}

uint64_t sysctl_fsid(_QWORD *a1, void *a2, size_t *a3)
{
  int v6;
  int v8;
  NSObject *v9;
  int v10;
  int *v11;
  char *v12;
  size_t v13;
  uint8_t buf[4];
  _BYTE v15[36];
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  int v19[14];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v13 = 14;
  if (sysctlnametomib("vfs.generic.ctlbyfsid", v19, &v13) == -1)
  {
    v8 = *__error();
    _sa_logt();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *__error();
      v11 = __error();
      v12 = strerror(*v11);
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)v15 = "vfs.generic.ctlbyfsid";
      *(_WORD *)&v15[8] = 1024;
      *(_DWORD *)&v15[10] = v10;
      *(_WORD *)&v15[14] = 2080;
      *(_QWORD *)&v15[16] = v12;
      _os_log_error_impl(&dword_1B9BE0000, v9, OS_LOG_TYPE_ERROR, "sysctlnametomib %s failed: %d %s", buf, 0x1Cu);
    }

    *__error() = v8;
    return 0xFFFFFFFFLL;
  }
  else
  {
    v6 = v13;
    v19[v13] = 65546;
    memset(&v15[4], 0, 32);
    v16 = 0u;
    v17 = 0u;
    v18 = 0;
    *(_DWORD *)buf = 1;
    *(_QWORD *)v15 = *a1;
    *(_QWORD *)&v15[12] = 0;
    *(_QWORD *)&v15[20] = 0;
    return sysctl(v19, v6 + 1, a2, a3, buf, 0x50uLL);
  }
}

void sub_1B9CA8468(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9CA9BD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
  _Block_object_dispose(&a55, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void sub_1B9CAC9D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B9CAD350(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 256), 8);
  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1B9CB3350(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9CB3C08(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void SAJSONWriteDictionaryEntry(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a2;
  v7 = a1;
  objc_msgSend(v7, "appendString:", CFSTR(","));
  SAJSONWriteDictionaryFirstEntry(v7, (uint64_t)v6, v5);

}

void SAJSONWriteDictionaryFirstEntry(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a1;
  objc_msgSend(v6, "printWithFormat:", CFSTR("\"%@\":"), a2);
  SAJSONWriteItem(v6, v5);

}

void SAJSONWriteItem(void *a1, void *a2)
{
  id v3;
  const __CFString *v4;
  void *v5;
  int v6;
  NSObject *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  const char *ClassName;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v15 = a1;
  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EF2408D8))
  {
    objc_msgSend(v15, "appendString:", CFSTR("{"));
    objc_msgSend(v3, "writeJSONDictionaryEntriesToStream:", v15);
    v4 = CFSTR("}");
LABEL_3:
    objc_msgSend(v15, "appendString:", v4);
LABEL_11:

    return;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    SAJSONWriteArray(v15, v3);
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\""), CFSTR("\\\""));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "printWithFormat:", CFSTR("\"%@\""), v5);
LABEL_10:

    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "appendString:", v5);
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = CFSTR("null");
    goto LABEL_3;
  }
  v6 = *__error();
  _sa_logt();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    ClassName = object_getClassName(v3);
    _os_log_error_impl(&dword_1B9BE0000, v7, OS_LOG_TYPE_ERROR, "Not a json-compatible type: %s", buf, 0xCu);
  }

  *__error() = v6;
  v8 = object_getClassName(v3);
  _SASetCrashLogMessage(50, "Not a json-compatible type: %s", v9, v10, v11, v12, v13, v14, v8);
  _os_crash();
  __break(1u);
}

void SAJSONWriteArray(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "appendString:", CFSTR("["));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    v9 = 1;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((v9 & 1) == 0)
          objc_msgSend(v3, "appendString:", CFSTR(","), (_QWORD)v12);
        SAJSONWriteItem(v3, v11);
        v9 = 0;
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v9 = 0;
    }
    while (v7);
  }

  objc_msgSend(v3, "appendString:", CFSTR("]"));
}

void sub_1B9CB4570(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

uint64_t HIDEventTimestampForKTraceEvent(uint64_t a1)
{
  uint64_t result;
  int v3;
  unsigned int v5;
  BOOL v6;
  int v7;
  uint64_t v10;

  result = 0;
  v3 = *(_DWORD *)(a1 + 48);
  if (v3 > 736428035)
  {
    if ((v3 - 736428036) <= 0x1C && ((1 << (v3 - 4)) & 0x11111111) != 0)
      goto LABEL_24;
    v5 = v3 - 736493572;
    v6 = v5 > 0xC;
    v7 = (1 << v5) & 0x1111;
    if (!v6 && v7 != 0)
      goto LABEL_24;
    return result;
  }
  if (v3 <= 730268055)
  {
    if (v3 != 730267892 && v3 != 730267896)
    {
      if (v3 != 730267908)
        return result;
      v10 = a1 + 32;
      return *(_QWORD *)v10;
    }
LABEL_23:
    v10 = a1 + 16;
    return *(_QWORD *)v10;
  }
  if ((v3 - 735576101) < 2)
  {
LABEL_24:
    v10 = a1 + 8;
    return *(_QWORD *)v10;
  }
  if (v3 == 730268056 || v3 == 730268060)
    goto LABEL_23;
  return result;
}

const char *EventTypeString(int a1)
{
  if ((a1 - 1) > 0xB)
    return "???";
  else
    return off_1E714A1C8[a1 - 1];
}

const char *TracePointString(int a1)
{
  if (a1 > 736428047)
  {
    if (a1 <= 736428063)
    {
      if (a1 > 736428055)
      {
        if (a1 == 736428056)
          return "CGXFilterEventToConnection";
        if (a1 == 736428060)
          return "post_event_tap_data";
      }
      else
      {
        if (a1 == 736428048)
          return "sPostContinuation";
        if (a1 == 736428052)
          return "sAnnotatedContinuation";
      }
    }
    else if (a1 <= 736493575)
    {
      if (a1 == 736428064)
        return "decode_and_forward";
      if (a1 == 736493572)
        return "PushToCGEventQueue";
    }
    else
    {
      switch(a1)
      {
        case 736493576:
          return "CreateAndPostEventWithCGEvent";
        case 736493580:
          return "PullEventsFromWindowServerOnConnection";
        case 736493584:
          return "ReceiveNextEventCommon (for the next event)";
      }
    }
  }
  else if (a1 <= 735576100)
  {
    if (a1 > 730268055)
    {
      if (a1 == 730268056)
        return "Keyboard event start";
      if (a1 == 730268060)
        return "Keyboard event stop";
    }
    else
    {
      if (a1 == 730267892)
        return "Event dispatch begin";
      if (a1 == 730267896)
        return "Event dispatch end";
    }
  }
  else if (a1 <= 736428035)
  {
    if (a1 == 735576101)
      return "Entry to NSApplication sendEvent";
    if (a1 == 735576102)
      return "Return from NSApplication sendEvent";
  }
  else
  {
    switch(a1)
    {
      case 736428036:
        return "hid_translation_state_append_wrapped_nxevent";
      case 736428040:
        return "CGXGetNextEvent";
      case 736428044:
        return "sHIDContinuation";
    }
  }
  return "???";
}

void _getIndexRangeForTimestamps(unint64_t *a1, _QWORD *a2, void *a3, unint64_t a4, double a5, double a6)
{
  void *v11;
  void *v12;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  unint64_t v25;
  void *v26;

  objc_msgSend(a3, "sampleTimestamps");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  *a1 = -1;
  *a2 = 0;
  if (a5 < a6 && v11 != 0)
  {
    v26 = v11;
    v14 = objc_msgSend(v11, "count");
    v12 = v26;
    if (v14)
    {
      if (a4 == -1)
        a4 = 0;
      while (1)
      {
        v15 = objc_msgSend(v12, "count");
        v12 = v26;
        if (a4 >= v15)
          break;
        objc_msgSend(v26, "objectAtIndexedSubscript:", a4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "machAbsTimeSeconds");
        if (v17 >= a5)
        {

          v20 = objc_msgSend(v26, "count");
          v12 = v26;
          if (a4 < v20)
          {
            v21 = 0;
            while (1)
            {
              objc_msgSend(v12, "objectAtIndexedSubscript:", a4 + v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "machAbsTimeSeconds");
              v24 = v23;

              if (v24 >= a6)
                break;
              ++v21;
              v25 = objc_msgSend(v26, "count");
              v12 = v26;
              if (v21 + a4 >= v25)
                goto LABEL_18;
            }
            v12 = v26;
LABEL_18:
            if (v21)
            {
              *a1 = a4;
              *a2 = v21;
            }
          }
          break;
        }
        objc_msgSend(v16, "machAbsTimeSeconds");
        v19 = v18;

        v12 = v26;
        if (v19 >= a6)
          break;
        ++a4;
      }
    }
  }

}

void _printSampleRangeForIndices(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t buf[16];

  v7 = a1;
  objc_msgSend(v7, "appendString:", CFSTR("["));
  if ((a2 == -1 || a3) && (a2 != -1 || !a3))
  {
    if (a2 == -1 || (v10 = a4 + a2, a4 + a2 + a3 <= 0))
    {
      objc_msgSend(v7, "printWithFormat:", CFSTR("%11s"), "No samples", v12);
    }
    else
    {
      if (v10 <= 1)
        v11 = 1;
      else
        v11 = a4 + a2;
      if (a3 == 1)
        objc_msgSend(v7, "printWithFormat:", CFSTR("%7lu%4s"), v11, "");
      else
        objc_msgSend(v7, "printWithFormat:", CFSTR("%5lu-%-5lu"), v11, a3 + v10 - 1);
    }
  }
  else
  {
    v8 = *__error();
    _sa_logt();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B9BE0000, v9, OS_LOG_TYPE_DEFAULT, "WARNING: Non-sensical indices.", buf, 2u);
    }

    *__error() = v8;
    objc_msgSend(v7, "appendString:", CFSTR("ERROR"));
  }
  objc_msgSend(v7, "appendString:", CFSTR("]"));

}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1E0C98000](bundle);
}

CFURLRef CFBundleCopyExecutableURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1E0C98020](bundle);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1E0C98120](bundle);
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1E0C98180](bundle, key);
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x1E0C98380](type_id);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x1E0C989D0](number);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

uint64_t CSArchitectureGetArchitectureForName()
{
  return MEMORY[0x1E0D19F40]();
}

uint64_t CSArchitectureGetCurrent()
{
  return MEMORY[0x1E0D19F48]();
}

uint64_t CSArchitectureGetFamily()
{
  return MEMORY[0x1E0D19F50]();
}

uint64_t CSArchitectureGetFamilyName()
{
  return MEMORY[0x1E0D19F60]();
}

uint64_t CSArchitectureIs32Bit()
{
  return MEMORY[0x1E0D19F68]();
}

uint64_t CSArchitectureIs64Bit()
{
  return MEMORY[0x1E0D19F70]();
}

uint64_t CSArchitectureIsArm64()
{
  return MEMORY[0x1E0D19F88]();
}

uint64_t CSArchitectureIsX86_64()
{
  return MEMORY[0x1E0D19FA0]();
}

uint64_t CSArchitectureMatchesArchitecture()
{
  return MEMORY[0x1E0D19FA8]();
}

uint64_t CSIsNull()
{
  return MEMORY[0x1E0D19FB8]();
}

uint64_t CSRangeContainsRange()
{
  return MEMORY[0x1E0D19FD0]();
}

uint64_t CSRangeIntersectsRange()
{
  return MEMORY[0x1E0D19FD8]();
}

uint64_t CSRegionForeachSymbol()
{
  return MEMORY[0x1E0D19FE0]();
}

uint64_t CSRegionGetName()
{
  return MEMORY[0x1E0D19FE8]();
}

uint64_t CSRegionGetRange()
{
  return MEMORY[0x1E0D1A000]();
}

uint64_t CSRelease()
{
  return MEMORY[0x1E0D1A018]();
}

uint64_t CSRetain()
{
  return MEMORY[0x1E0D1A028]();
}

uint64_t CSSourceInfoGetColumn()
{
  return MEMORY[0x1E0D1A030]();
}

uint64_t CSSourceInfoGetLineNumber()
{
  return MEMORY[0x1E0D1A050]();
}

uint64_t CSSourceInfoGetPath()
{
  return MEMORY[0x1E0D1A058]();
}

uint64_t CSSourceInfoGetRange()
{
  return MEMORY[0x1E0D1A060]();
}

uint64_t CSSymbolForeachInlineRange()
{
  return MEMORY[0x1E0D1A068]();
}

uint64_t CSSymbolForeachSourceInfo()
{
  return MEMORY[0x1E0D1A070]();
}

uint64_t CSSymbolGetName()
{
  return MEMORY[0x1E0D1A088]();
}

uint64_t CSSymbolGetRange()
{
  return MEMORY[0x1E0D1A090]();
}

uint64_t CSSymbolIsUnnamed()
{
  return MEMORY[0x1E0D1A0A8]();
}

uint64_t CSSymbolOwnerForEachStackFrameAtAddress()
{
  return MEMORY[0x1E0D1A0C0]();
}

uint64_t CSSymbolOwnerForeachSegment()
{
  return MEMORY[0x1E0D1A0D0]();
}

uint64_t CSSymbolOwnerGetBaseAddress()
{
  return MEMORY[0x1E0D1A100]();
}

uint64_t CSSymbolOwnerGetCFUUIDBytes()
{
  return MEMORY[0x1E0D1A108]();
}

uint64_t CSSymbolOwnerGetName()
{
  return MEMORY[0x1E0D1A130]();
}

uint64_t CSSymbolOwnerGetPath()
{
  return MEMORY[0x1E0D1A140]();
}

uint64_t CSSymbolOwnerGetSegmentWithAddress()
{
  return MEMORY[0x1E0D1A150]();
}

uint64_t CSSymbolOwnerGetVersion()
{
  return MEMORY[0x1E0D1A188]();
}

uint64_t CSSymbolOwnerIsDsym()
{
  return MEMORY[0x1E0D1A198]();
}

uint64_t CSSymbolOwnerIsDyldSharedCache()
{
  return MEMORY[0x1E0D1A1B0]();
}

uint64_t CSSymbolicatorCreateWithExclaveUUIDAndFlags()
{
  return MEMORY[0x1E0D1A1F8]();
}

uint64_t CSSymbolicatorCreateWithMachKernelFlagsAndNotification()
{
  return MEMORY[0x1E0D1A210]();
}

uint64_t CSSymbolicatorCreateWithPathArchitectureFlagsAndNotification()
{
  return MEMORY[0x1E0D1A220]();
}

uint64_t CSSymbolicatorCreateWithPidFlagsAndNotification()
{
  return MEMORY[0x1E0D1A238]();
}

uint64_t CSSymbolicatorForeachSymbolOwnerAtTime()
{
  return MEMORY[0x1E0D1A280]();
}

uint64_t CSSymbolicatorForeachSymbolicatorWithPathFlagsAndNotification()
{
  return MEMORY[0x1E0D1A2B0]();
}

uint64_t CSSymbolicatorGetAOutSymbolOwner()
{
  return MEMORY[0x1E0D1A2C0]();
}

uint64_t CSSymbolicatorGetArchitecture()
{
  return MEMORY[0x1E0D1A2C8]();
}

uint64_t CSSymbolicatorGetSharedCacheUUID()
{
  return MEMORY[0x1E0D1A2F8]();
}

uint64_t CSSymbolicatorGetSymbolOwner()
{
  return MEMORY[0x1E0D1A318]();
}

uint64_t CSSymbolicatorGetSymbolOwnerCountAtTime()
{
  return MEMORY[0x1E0D1A320]();
}

uint64_t CSSymbolicatorGetSymbolOwnerWithCFUUIDBytesAtTime()
{
  return MEMORY[0x1E0D1A338]();
}

CFDictionaryRef IOCopySystemLoadAdvisoryDetailed(void)
{
  return (CFDictionaryRef)MEMORY[0x1E0CBAE00]();
}

uint64_t IOPMGetLastWakeTime()
{
  return MEMORY[0x1E0CBB7B8]();
}

uint64_t IOReportChannelGetChannelName()
{
  return MEMORY[0x1E0DE0290]();
}

uint64_t IOReportChannelGetFormat()
{
  return MEMORY[0x1E0DE0298]();
}

uint64_t IOReportChannelGetGroup()
{
  return MEMORY[0x1E0DE02A0]();
}

uint64_t IOReportCopyChannelsForDrivers()
{
  return MEMORY[0x1E0DE02C8]();
}

uint64_t IOReportCreateSamples()
{
  return MEMORY[0x1E0DE02F8]();
}

uint64_t IOReportCreateSubscription()
{
  return MEMORY[0x1E0DE0310]();
}

uint64_t IOReportGetChannelCount()
{
  return MEMORY[0x1E0DE0318]();
}

uint64_t IOReportIterate()
{
  return MEMORY[0x1E0DE0338]();
}

uint64_t IOReportSimpleGetIntegerValue()
{
  return MEMORY[0x1E0DE0360]();
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA00](name);
}

uint64_t MGCopyAnswerWithError()
{
  return MEMORY[0x1E0DE2B38]();
}

NSString *__cdecl NSHomeDirectoryForUser(NSString *userName)
{
  return (NSString *)MEMORY[0x1E0CB2C08](userName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

uint64_t OSLogLookupPathWithUUID()
{
  return MEMORY[0x1E0D446D8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFBundleCreateWithExecutableURLIfLooksLikeBundle()
{
  return MEMORY[0x1E0C99FF8]();
}

uint64_t _CFCopySupplementalVersionDictionary()
{
  return MEMORY[0x1E0C9A0C8]();
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1E0C9A0D0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x1E0C80AC8](a1);
  return result;
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

uint64_t __udivti3()
{
  return MEMORY[0x1E0C80C80]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1E0C81000]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

uint64_t amfi_launch_constraint_set_spawnattr()
{
  return MEMORY[0x1E0CFDF20]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1E0C81608](a1, a2);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

int compress(Bytef *dest, uLongf *destLen, const Bytef *source, uLong sourceLen)
{
  return MEMORY[0x1E0DE9298](dest, destLen, source, sourceLen);
}

uLong compressBound(uLong sourceLen)
{
  return MEMORY[0x1E0DE92A8](sourceLen);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C68](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82C98](block, timeout);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

uint64_t dscsym_iterate()
{
  return MEMORY[0x1E0DE57C8]();
}

uint64_t dscsym_iterate_buffer()
{
  return MEMORY[0x1E0DE57D0]();
}

uint64_t dyld_for_each_installed_shared_cache()
{
  return MEMORY[0x1E0C83090]();
}

uint64_t dyld_image_content_for_segment()
{
  return MEMORY[0x1E0C830D0]();
}

uint64_t dyld_image_copy_uuid()
{
  return MEMORY[0x1E0C830D8]();
}

uint64_t dyld_image_for_each_segment_info()
{
  return MEMORY[0x1E0C830E0]();
}

uint64_t dyld_image_get_file_path()
{
  return MEMORY[0x1E0C830E8]();
}

uint64_t dyld_image_get_installname()
{
  return MEMORY[0x1E0C830F0]();
}

uint64_t dyld_process_create_for_current_task()
{
  return MEMORY[0x1E0C83110]();
}

uint64_t dyld_process_create_for_task()
{
  return MEMORY[0x1E0C83118]();
}

uint64_t dyld_process_dispose()
{
  return MEMORY[0x1E0C83120]();
}

uint64_t dyld_process_snapshot_create_for_process()
{
  return MEMORY[0x1E0C83130]();
}

uint64_t dyld_process_snapshot_dispose()
{
  return MEMORY[0x1E0C83138]();
}

uint64_t dyld_process_snapshot_for_each_image()
{
  return MEMORY[0x1E0C83140]();
}

uint64_t dyld_process_snapshot_get_shared_cache()
{
  return MEMORY[0x1E0C83148]();
}

uint64_t dyld_shared_cache_copy_uuid()
{
  return MEMORY[0x1E0C83160]();
}

uint64_t dyld_shared_cache_file_path()
{
  return MEMORY[0x1E0C83168]();
}

uint64_t dyld_shared_cache_for_each_image()
{
  return MEMORY[0x1E0C83178]();
}

uint64_t dyld_shared_cache_get_base_address()
{
  return MEMORY[0x1E0C83188]();
}

uint64_t dyld_shared_cache_get_mapped_size()
{
  return MEMORY[0x1E0C83190]();
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x1E0C83318](*(_QWORD *)&a1, a2);
}

int ferror(FILE *a1)
{
  return MEMORY[0x1E0C83348](a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x1E0C833A0](a1, *(_QWORD *)&a2, a3);
}

int flsl(uint64_t a1)
{
  return MEMORY[0x1E0C83420](a1);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1E0C83528](a1, a2, a3, *(_QWORD *)&a4);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x1E0C83580](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1E0C83610](a1, a2, a3, a4, *(_QWORD *)&a5);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C83668]();
}

int getmntinfo(statfs **a1, int a2)
{
  return MEMORY[0x1E0C836F8](a1, *(_QWORD *)&a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

int gzclose(gzFile file)
{
  return MEMORY[0x1E0DE9310](file);
}

gzFile gzdopen(int fd, const char *mode)
{
  return (gzFile)MEMORY[0x1E0DE9320](*(_QWORD *)&fd, mode);
}

const char *__cdecl gzerror(gzFile file, int *errnum)
{
  return (const char *)MEMORY[0x1E0DE9338](file, errnum);
}

int gzread(gzFile file, voidp buf, unsigned int len)
{
  return MEMORY[0x1E0DE9370](file, buf, *(_QWORD *)&len);
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x1E0C83A48](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

uint64_t ktrace_chunk_copy_cfdata()
{
  return MEMORY[0x1E0DDC470]();
}

uint64_t ktrace_chunk_map_data()
{
  return MEMORY[0x1E0DDC488]();
}

uint64_t ktrace_chunk_size()
{
  return MEMORY[0x1E0DDC4A0]();
}

uint64_t ktrace_chunk_tag()
{
  return MEMORY[0x1E0DDC4B0]();
}

uint64_t ktrace_chunk_unmap_data()
{
  return MEMORY[0x1E0DDC4C0]();
}

uint64_t ktrace_chunks()
{
  return MEMORY[0x1E0DDC4D0]();
}

uint64_t ktrace_config_create()
{
  return MEMORY[0x1E0DDC4D8]();
}

uint64_t ktrace_config_destroy()
{
  return MEMORY[0x1E0DDC4E8]();
}

uint64_t ktrace_config_get_reason()
{
  return MEMORY[0x1E0DDC500]();
}

uint64_t ktrace_config_kperf_get_action_samplers()
{
  return MEMORY[0x1E0DDC510]();
}

uint64_t ktrace_config_kperf_get_pet_mode()
{
  return MEMORY[0x1E0DDC518]();
}

uint64_t ktrace_config_kperf_get_pet_timer_id()
{
  return MEMORY[0x1E0DDC520]();
}

uint64_t ktrace_config_kperf_get_timer_action_id()
{
  return MEMORY[0x1E0DDC528]();
}

uint64_t ktrace_config_kperf_get_timer_count()
{
  return MEMORY[0x1E0DDC530]();
}

uint64_t ktrace_config_kperf_get_timer_period_ns()
{
  return MEMORY[0x1E0DDC538]();
}

uint64_t ktrace_convert_absolute_to_walltime()
{
  return MEMORY[0x1E0DDC548]();
}

uint64_t ktrace_convert_timestamp_to_walltime()
{
  return MEMORY[0x1E0DDC550]();
}

uint64_t ktrace_dumpbuffer_address_space_pid()
{
  return MEMORY[0x1E0DDC558]();
}

uint64_t ktrace_end()
{
  return MEMORY[0x1E0DDC568]();
}

uint64_t ktrace_events_all()
{
  return MEMORY[0x1E0DDC570]();
}

uint64_t ktrace_events_range()
{
  return MEMORY[0x1E0DDC578]();
}

uint64_t ktrace_events_single()
{
  return MEMORY[0x1E0DDC588]();
}

uint64_t ktrace_get_absolute_from_timestamp()
{
  return MEMORY[0x1E0DDC5D8]();
}

uint64_t ktrace_get_continuous_from_absolute()
{
  return MEMORY[0x1E0DDC5E0]();
}

uint64_t ktrace_get_continuous_from_timestamp()
{
  return MEMORY[0x1E0DDC5E8]();
}

uint64_t ktrace_get_execname_for_pid()
{
  return MEMORY[0x1E0DDC5F0]();
}

uint64_t ktrace_get_execname_for_thread()
{
  return MEMORY[0x1E0DDC5F8]();
}

uint64_t ktrace_get_machine()
{
  return MEMORY[0x1E0DDC600]();
}

uint64_t ktrace_get_name_for_thread()
{
  return MEMORY[0x1E0DDC608]();
}

uint64_t ktrace_get_ns_from_timestamp()
{
  return MEMORY[0x1E0DDC610]();
}

uint64_t ktrace_get_pid_for_thread()
{
  return MEMORY[0x1E0DDC618]();
}

uint64_t ktrace_is_kernel_64_bit()
{
  return MEMORY[0x1E0DDC628]();
}

uint64_t ktrace_kperf()
{
  return MEMORY[0x1E0DDC630]();
}

uint64_t ktrace_machine_active_cpus()
{
  return MEMORY[0x1E0DDC640]();
}

uint64_t ktrace_machine_cluster_flags()
{
  return MEMORY[0x1E0DDC648]();
}

uint64_t ktrace_machine_cpu_cluster()
{
  return MEMORY[0x1E0DDC650]();
}

uint64_t ktrace_machine_cpu_subtype()
{
  return MEMORY[0x1E0DDC658]();
}

uint64_t ktrace_machine_cpu_type()
{
  return MEMORY[0x1E0DDC660]();
}

uint64_t ktrace_machine_create_current()
{
  return MEMORY[0x1E0DDC668]();
}

uint64_t ktrace_machine_destroy()
{
  return MEMORY[0x1E0DDC670]();
}

uint64_t ktrace_machine_hw_page_size()
{
  return MEMORY[0x1E0DDC678]();
}

uint64_t ktrace_machine_model()
{
  return MEMORY[0x1E0DDC680]();
}

uint64_t ktrace_machine_os_build()
{
  return MEMORY[0x1E0DDC688]();
}

uint64_t ktrace_machine_os_name()
{
  return MEMORY[0x1E0DDC690]();
}

uint64_t ktrace_machine_os_version()
{
  return MEMORY[0x1E0DDC698]();
}

uint64_t ktrace_machine_os_version_extra()
{
  return MEMORY[0x1E0DDC6A0]();
}

uint64_t ktrace_machine_vm_page_size()
{
  return MEMORY[0x1E0DDC6A8]();
}

uint64_t ktrace_session_create()
{
  return MEMORY[0x1E0DDC6B0]();
}

uint64_t ktrace_session_destroy()
{
  return MEMORY[0x1E0DDC6C8]();
}

uint64_t ktrace_session_set_event_names_enabled()
{
  return MEMORY[0x1E0DDC6D0]();
}

uint64_t ktrace_set_collection_qos()
{
  return MEMORY[0x1E0DDC6E0]();
}

uint64_t ktrace_set_completion_handler()
{
  return MEMORY[0x1E0DDC6F0]();
}

uint64_t ktrace_set_execnames_enabled()
{
  return MEMORY[0x1E0DDC700]();
}

uint64_t ktrace_set_file()
{
  return MEMORY[0x1E0DDC710]();
}

uint64_t ktrace_start()
{
  return MEMORY[0x1E0DDC768]();
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1E0C83BB0](a1, a2);
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
}

uint64_t mach_get_times()
{
  return MEMORY[0x1E0C83C88]();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1E0C83CF8](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x1E0C83DD0](*(_QWORD *)&target, address, size);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

int mergesort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
  return MEMORY[0x1E0C840E0](__base, __nel, __width, __compar);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C84160](a1, a2);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x1E0DE7C30](dest, src, size, atomic, hasStrong);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x1E0DE8000](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

int pipe(int a1[2])
{
  return MEMORY[0x1E0C84B10](a1);
}

int posix_spawn(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return MEMORY[0x1E0C84B38](a1, a2, a3, a4, __argv, __envp);
}

int posix_spawn_file_actions_addclose(posix_spawn_file_actions_t *a1, int a2)
{
  return MEMORY[0x1E0C84B40](a1, *(_QWORD *)&a2);
}

int posix_spawn_file_actions_adddup2(posix_spawn_file_actions_t *a1, int a2, int a3)
{
  return MEMORY[0x1E0C84B48](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int posix_spawn_file_actions_addinherit_np(posix_spawn_file_actions_t *a1, int a2)
{
  return MEMORY[0x1E0C84B50](a1, *(_QWORD *)&a2);
}

int posix_spawn_file_actions_destroy(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x1E0C84B60](a1);
}

int posix_spawn_file_actions_init(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x1E0C84B68](a1);
}

int posix_spawnattr_destroy(posix_spawnattr_t *a1)
{
  return MEMORY[0x1E0C84B70](a1);
}

int posix_spawnattr_init(posix_spawnattr_t *a1)
{
  return MEMORY[0x1E0C84B78](a1);
}

int posix_spawnattr_setbinpref_np(posix_spawnattr_t *a1, size_t a2, cpu_type_t *a3, size_t *a4)
{
  return MEMORY[0x1E0C84B88](a1, a2, a3, a4);
}

int posix_spawnattr_setflags(posix_spawnattr_t *a1, __int16 a2)
{
  return MEMORY[0x1E0C84B90](a1, a2);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

int proc_get_dirty(pid_t pid, uint32_t *flags)
{
  return MEMORY[0x1E0C84BF8](*(_QWORD *)&pid, flags);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C20](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x1E0C84C40](*(_QWORD *)&pid, *(_QWORD *)&flavor, arg, buffer, *(_QWORD *)&buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C50](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1E0C84F80]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1E0C85030](__ptr, __size);
}

char *__cdecl rindex(const char *a1, int a2)
{
  return (char *)MEMORY[0x1E0C85130](a1, *(_QWORD *)&a2);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1E0C85178]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1E0C854E0](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1E0C85558](a1, a2, a3, a4);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85570](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1E0C85610](__s1, __s2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85658](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C856A8](__str, __endptr, *(_QWORD *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

int sysctlnametomib(const char *a1, int *a2, size_t *a3)
{
  return MEMORY[0x1E0C857B0](a1, a2, a3);
}

uint64_t task_read_for_pid()
{
  return MEMORY[0x1E0C85858]();
}

kern_return_t task_threads(task_inspect_t target_task, thread_act_array_t *act_list, mach_msg_type_number_t *act_listCnt)
{
  return MEMORY[0x1E0C858A0](*(_QWORD *)&target_task, act_list, act_listCnt);
}

kern_return_t thread_info(thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return MEMORY[0x1E0C858F8](*(_QWORD *)&target_act, *(_QWORD *)&flavor, thread_info_out, thread_info_outCnt);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

int uname(utsname *a1)
{
  return MEMORY[0x1E0C859A0](a1);
}

int uncompress(Bytef *dest, uLongf *destLen, const Bytef *source, uLong sourceLen)
{
  return MEMORY[0x1E0DE93F8](dest, destLen, source, sourceLen);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

void uuid_clear(uuid_t uu)
{
  MEMORY[0x1E0C85A00](uu);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x1E0C85A08](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
  MEMORY[0x1E0C85A10](dst, src);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1E0C85A30](uu);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1E0C85A38](in, uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x1E0C85A40](uu, out);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1E0C85B98](__str, __size, __format, a4);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return MEMORY[0x1E0C85BD0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

uint64_t xpc_coalition_copy_info()
{
  return MEMORY[0x1E0C85F48]();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

