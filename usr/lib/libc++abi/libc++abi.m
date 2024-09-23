void __cxa_bad_cast(void)
{
  std::bad_cast *exception;
  std::bad_cast *v1;

  exception = (std::bad_cast *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_cast::bad_cast(exception);
}

void __cxa_bad_typeid(void)
{
  std::bad_typeid *exception;
  std::bad_typeid *v1;

  exception = (std::bad_typeid *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_typeid::bad_typeid(exception);
}

void __cxa_throw_bad_array_new_length(void)
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void demangling_terminate_handler(void)
{
  const _Unwind_Exception **globals_fast;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const _Unwind_Exception *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (__cdecl *exception_cleanup)(_Unwind_Reason_Code, _Unwind_Exception *);
  const __cxxabiv1::__shim_type_info *private_1;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  void *v34;

  globals_fast = (const _Unwind_Exception **)__cxa_get_globals_fast();
  if (!globals_fast || (v8 = *globals_fast) == 0)
    abort_message("terminating", v1, v2, v3, v4, v5, v6, v7, v33);
  if (__cxxabiv1::__isOurExceptionClass(v8 + 3))
  {
    if (__cxxabiv1::__getExceptionClass(v8 + 3) == 0x434C4E47432B2B01)
      exception_cleanup = v8->exception_cleanup;
    else
      exception_cleanup = (void (__cdecl *)(_Unwind_Reason_Code, _Unwind_Exception *))&v8[4];
    v34 = exception_cleanup;
    private_1 = (const __cxxabiv1::__shim_type_info *)v8->private_1;
    __cxa_demangle((const char *)(*((_QWORD *)private_1 + 1) & 0x7FFFFFFFFFFFFFFFLL), 0, 0, 0);
    {
      v25 = cause;
      (*(void (**)(void *))(*(_QWORD *)v34 + 16))(v34);
      abort_message("terminating due to %s exception of type %s: %s", v26, v27, v28, v29, v30, v31, v32, v25);
    }
    abort_message("terminating due to %s exception of type %s", v18, v19, v20, v21, v22, v23, v24, cause);
  }
  abort_message("terminating due to %s foreign exception", v9, v10, v11, v12, v13, v14, v15, cause);
}

void sub_1DED51AAC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void (*v2)(uint64_t);

  if (v1)
    v2(v1);
  _Unwind_Resume(exception_object);
}

void demangling_unexpected_handler(void)
{
  cause = (uint64_t)"unexpected";
  std::terminate();
}

std::unexpected_handler std::set_unexpected(std::unexpected_handler a1)
{
  std::unexpected_handler v1;
  std::unexpected_handler result;

  v1 = (std::unexpected_handler)demangling_unexpected_handler;
  if (a1)
    v1 = a1;
  do
    result = (std::unexpected_handler)__ldaxr((unint64_t *)&__cxa_unexpected_handler);
  while (__stlxr((unint64_t)v1, (unint64_t *)&__cxa_unexpected_handler));
  return result;
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

std::terminate_handler std::set_terminate(std::terminate_handler a1)
{
  void *v1;
  std::terminate_handler result;

  v1 = demangling_terminate_handler;
  if (a1)
    v1 = a1;
  do
    result = (std::terminate_handler)__ldaxr((unint64_t *)&__cxa_terminate_handler);
  while (__stlxr((unint64_t)v1, (unint64_t *)&__cxa_terminate_handler));
  return result;
}

std::new_handler std::set_new_handler(std::new_handler a1)
{
  void (*v1)(void);

  do
    v1 = (void (*)(void))__ldaxr(&__cxa_new_handler);
  while (__stlxr((unint64_t)a1, &__cxa_new_handler));
  return v1;
}

char *__cxa_demangle(const char *lpmangled, char *lpout, size_t *lpoutlen, int *lpstatus)
{
  const char *v4;
  _QWORD *v5;
  uint64_t *v6;
  int *v7;
  int *v8;
  uint64_t *v9;
  _QWORD *v10;
  unsigned __int8 *v11;
  char *v12;
  size_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  void **v32;
  void **v33;
  uint64_t v35;
  _QWORD *v36;
  unsigned __int8 *v37;
  _QWORD *v38;
  uint64_t v39;
  unsigned __int8 *v40;
  BOOL v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  unsigned __int8 *v50;
  unsigned __int8 *v51;
  void *v52;
  _OWORD *v53;
  void **v54;
  _OWORD v55[16];
  void *v56[3];
  _BYTE v57[256];
  void *v58[3];
  _BYTE v59[64];
  void *v60[3];
  _BYTE v61[32];
  void *v62;
  _BYTE *v63;
  __int16 *v64;
  _BYTE v65[32];
  __int16 v66;
  char v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  _OWORD v71[256];
  void *v72;
  uint64_t v73;

  v4 = (const char *)MEMORY[0x1E0C80A78](lpmangled, lpout, lpoutlen, lpstatus);
  v8 = v7;
  v73 = *MEMORY[0x1E0C80C00];
  if (!v4 || (v9 = v6, v10 = v5, v11 = (unsigned __int8 *)v4, v5) && !v6)
  {
    v12 = 0;
    if (v7)
      *v7 = -3;
    return v12;
  }
  v13 = strlen(v4);
  v50 = v11;
  v51 = &v11[v13];
  v52 = v55;
  v53 = v55;
  v54 = v56;
  memset(v55, 0, sizeof(v55));
  v56[0] = v57;
  v56[1] = v57;
  memset(v57, 0, sizeof(v57));
  memset(v59, 0, sizeof(v59));
  v58[0] = v59;
  v58[1] = v59;
  v56[2] = v58;
  v58[2] = v60;
  v60[0] = v61;
  v60[1] = v61;
  v60[2] = &v62;
  memset(v61, 0, sizeof(v61));
  memset(v65, 0, sizeof(v65));
  v62 = v65;
  v63 = v65;
  v64 = &v66;
  v66 = 1;
  v67 = 0;
  v68 = -1;
  v70 = 0;
  v69 = 0;
  v71[0] = 0u;
  v72 = v71;
  if (v13 < 2)
  {
LABEL_20:
    if (v51 != v50)
      goto LABEL_21;
    goto LABEL_63;
  }
  if (*(_WORD *)v11 == 23135)
  {
    v35 = 2;
  }
  else
  {
    if (v13 < 3)
      goto LABEL_20;
    if (*(_WORD *)v11 != 24415 || v11[2] != 90)
    {
      if (v13 < 4)
        goto LABEL_20;
      if (*(_DWORD *)v11 == 1516199775)
      {
        v39 = 4;
      }
      else
      {
        if (v13 < 5)
          goto LABEL_20;
        if (*(_DWORD *)v11 != 1600085855 || v11[4] != 90)
          goto LABEL_20;
        v39 = 5;
      }
      v50 = &v11[v39];
      if (!v45
        || (v40 = v50, (unint64_t)(v51 - v50) < 0xD)
        || (*(_QWORD *)v50 == 0x695F6B636F6C625FLL ? (v41 = *(_QWORD *)(v50 + 5) == 0x656B6F766E695F6BLL) : (v41 = 0),
            !v41))
      {
LABEL_53:
        v36 = 0;
        goto LABEL_64;
      }
      v50 += 13;
      if (v40 + 13 == v51 || v40[13] != 95)
      {
      }
      else
      {
        v50 = v40 + 14;
        if (!v24)
          goto LABEL_53;
      }
      if (v51 != v50)
      {
        if (*v50 != 46)
          goto LABEL_53;
        v50 = v51;
      }
LABEL_63:
      v36 = v23;
LABEL_64:
      if (v36)
      {
LABEL_65:
        if (v10)
          v42 = *v9;
        else
          v42 = 0;
        v45 = v10;
        v46 = 0;
        v47 = v42;
        v48 = -1;
        v49 = 1;
        if (v62 != v63)
          abort_message("%s:%d: %s", v24, v25, v26, v27, v28, v29, v30, (char)"/Library/Caches/com.apple.xbs/Sources/libcxx_os/libcxxabi/src/cxa_demangle.cpp");
        (*(void (**)(_QWORD *, _QWORD **))(*v36 + 32))(v36, &v45);
        if ((*(_WORD *)((_BYTE *)v36 + 9) & 0xC0) != 0x40)
          (*(void (**)(_QWORD *, _QWORD **))(*v36 + 40))(v36, &v45);
        v43 = v46++;
        *((_BYTE *)v45 + v43) = 0;
        if (v9)
          *v9 = v46;
        v31 = 0;
        v12 = (char *)v45;
        if (!v8)
          goto LABEL_23;
        goto LABEL_22;
      }
      goto LABEL_21;
    }
    v35 = 3;
  }
  v50 = &v11[v35];
  if (v36)
  {
    v37 = v50;
    if (v51 == v50)
      goto LABEL_65;
    v44 = v51 - v50;
    if (*v50 == 46)
    {
      *((_BYTE *)v38 + 8) = 1;
      *(_WORD *)((char *)v38 + 9) = *(_WORD *)((_BYTE *)v38 + 9) & 0xF000 | 0x540;
      *v38 = off_1EA950DD0;
      v38[2] = v36;
      v38[3] = v37;
      v38[4] = v44;
      v50 = v51;
      v36 = v38;
      goto LABEL_65;
    }
  }
LABEL_21:
  v12 = 0;
  v31 = -2;
  if (v8)
LABEL_22:
    *v8 = v31;
LABEL_23:
  v32 = (void **)v72;
  if (v72)
  {
    do
    {
      while (1)
      {
        v33 = (void **)*v32;
        v72 = *v32;
        if (v32 == (void **)v71)
          break;
        free(v32);
        v32 = (void **)v72;
        if (!v72)
          goto LABEL_28;
      }
      v32 = v33;
    }
    while (v33);
  }
LABEL_28:
  v71[0] = 0uLL;
  v72 = v71;
  if (v62 != v65)
    free(v62);
  if (v60[0] != v61)
    free(v60[0]);
  if (v58[0] != v59)
    free(v58[0]);
  if (v56[0] != v57)
    free(v56[0]);
  if (v52 != v55)
    free(v52);
  return v12;
}

void sub_1DED520C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Unwind_Resume(a1);
}

_QWORD *`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>::~ManglingParser(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;

  v2 = a1 + 101;
  v3 = (_QWORD *)a1[613];
  if (v3)
  {
    do
    {
      while (1)
      {
        v4 = (_QWORD *)*v3;
        a1[613] = *v3;
        if (v3 == v2)
          break;
        free(v3);
        v3 = (_QWORD *)a1[613];
        if (!v3)
          goto LABEL_6;
      }
      v3 = v4;
    }
    while (v4);
  }
LABEL_6:
  *v2 = 0;
  v2[1] = 0;
  a1[613] = v2;
  v5 = (_QWORD *)a1[90];
  if (v5 != a1 + 93)
    free(v5);
  v6 = (_QWORD *)a1[83];
  if (v6 != a1 + 86)
    free(v6);
  v7 = (_QWORD *)a1[72];
  if (v7 != a1 + 75)
    free(v7);
  v8 = (_QWORD *)a1[37];
  if (v8 != a1 + 40)
    free(v8);
  v9 = (_QWORD *)a1[2];
  if (v9 != a1 + 5)
    free(v9);
  return a1;
}

_QWORD *`anonymous namespace'::itanium_demangle::OutputBuffer::grow(_QWORD *this, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  _QWORD *v4;
  size_t v5;
  unint64_t v6;
  size_t v7;

  v2 = this[2];
  v3 = this[1] + a2;
  if (v3 > v2)
  {
    v4 = this;
    v5 = v3 + 992;
    v6 = 2 * v2;
    if (v6 <= v5)
      v7 = v5;
    else
      v7 = v6;
    this[2] = v7;
    this = malloc_type_realloc((void *)*this, v7, 0x4D9D93A4uLL);
    *v4 = this;
    if (!this)
      abort();
  }
  return this;
}

uint64_t `anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::consumeIf(const void **a1, const void *a2, size_t a3)
{
  char *v3;

  v3 = (char *)*a1;
  if (a3 > (_BYTE *)a1[1] - (_BYTE *)*a1 || memcmp(*a1, a2, a3))
    return 0;
  *a1 = &v3[a3];
  return 1;
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::parseEncoding(unsigned __int8 **a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  unint64_t v11;
  int v12;
  _QWORD *v13;
  _QWORD *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unsigned __int8 *v25;
  unint64_t v26;
  unsigned __int8 *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  int v33;
  unsigned __int8 *v34;
  unsigned __int8 *v35;
  unsigned int v36;
  BOOL v37;
  uint64_t v38;
  BOOL v40;
  _QWORD *v41;
  _QWORD *v42;
  unsigned __int8 *v43;
  unsigned __int8 *v44;
  _QWORD *v45;
  uint64_t v46;
  unsigned __int8 *v47;
  int v48;
  unsigned __int8 *v49;
  char v50;
  char v51;
  unint64_t v52;
  _QWORD *v53;
  BOOL v54;
  _QWORD *v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  unsigned __int8 *v63;
  _BOOL4 v64;
  _anonymous_namespace_::BumpPointerAllocator *v65;
  _QWORD *v66;
  int v67;
  char v68;
  _QWORD *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unsigned __int8 *v77;
  _QWORD *v78;
  unsigned __int8 *v79;
  unint64_t v80;
  _QWORD *v82;
  uint64_t v83;
  uint64_t v84;
  _QWORD *v85;
  _QWORD *v86;
  _QWORD *v87;
  char v88;
  unint64_t v89;
  char v90;
  _QWORD v91[20];

  v9 = *a1;
  v10 = a1[1];
  v11 = v10 - *a1;
  if (v10 == *a1)
    goto LABEL_9;
  v12 = *v9;
  if (v12 == 71)
  {
    if (v11 < 2)
      goto LABEL_116;
    v33 = (char)v9[1];
    switch(v33)
    {
      case 'I':
        *a1 = v9 + 2;
        v87 = 0;
        v13 = v87;
        if (v87)
          v51 = v50;
        else
          v51 = 1;
        if ((v51 & 1) != 0)
          goto LABEL_116;
        *((_BYTE *)v14 + 8) = 21;
        *(_WORD *)((char *)v14 + 9) = *(_WORD *)((_BYTE *)v14 + 9) & 0xF000 | 0x540;
        *v14 = off_1EA94EB40;
        v15 = "initializer for module ";
        v16 = 23;
        break;
      case 'R':
        *a1 = v9 + 2;
        if (v13)
        {
          v49 = *a1;
          if (*a1 == a1[1] || *v49 != 95)
          {
            if (!v48)
              goto LABEL_116;
          }
          else
          {
            *a1 = v49 + 1;
          }
          *((_BYTE *)v14 + 8) = 21;
          *(_WORD *)((char *)v14 + 9) = *(_WORD *)((_BYTE *)v14 + 9) & 0xF000 | 0x540;
          *v14 = off_1EA94EB40;
          v15 = "reference temporary for ";
          v16 = 24;
          break;
        }
LABEL_116:
        v14 = 0;
        goto LABEL_117;
      case 'V':
        *a1 = v9 + 2;
        if (!v13)
          goto LABEL_116;
        *((_BYTE *)v14 + 8) = 21;
        *(_WORD *)((char *)v14 + 9) = *(_WORD *)((_BYTE *)v14 + 9) & 0xF000 | 0x540;
        *v14 = off_1EA94EB40;
        v15 = "guard variable for ";
        v16 = 19;
        break;
      default:
        goto LABEL_116;
    }
LABEL_107:
    v14[2] = v15;
    v14[3] = v16;
    v14[4] = v13;
    goto LABEL_117;
  }
  if (v12 != 84)
  {
LABEL_9:
    LOWORD(v87) = 0;
    HIDWORD(v87) = 0;
    v88 = 0;
    v89 = (a1[91] - a1[90]) >> 3;
    v90 = 0;
    if (!v14)
      goto LABEL_117;
    v24 = v89;
    v25 = a1[90];
    v26 = (a1[91] - v25) >> 3;
    if (v89 < v26)
    {
      v27 = a1[83];
      if (v27 == a1[84])
        goto LABEL_116;
      if (!*(_QWORD *)v27)
        goto LABEL_116;
      v28 = *(_QWORD *)&v25[8 * v89];
      v29 = *(_QWORD *)(v28 + 16);
      v30 = **(_QWORD **)v27;
      if (v29 >= (*(_QWORD *)(*(_QWORD *)v27 + 8) - v30) >> 3)
        goto LABEL_116;
      v31 = v89 + 1;
      while (1)
      {
        *(_QWORD *)(v28 + 24) = *(_QWORD *)(v30 + 8 * v29);
        if (v26 == v31)
          break;
        v32 = v31;
        if (*(_QWORD *)v27)
        {
          v28 = *(_QWORD *)&v25[8 * v31];
          v29 = *(_QWORD *)(v28 + 16);
          v30 = **(_QWORD **)v27;
          ++v31;
          if (v29 < (*(_QWORD *)(*(_QWORD *)v27 + 8) - v30) >> 3)
            continue;
        }
        if (v32 >= v26)
          goto LABEL_28;
        goto LABEL_116;
      }
    }
    if (v26 < v24)
      abort_message("%s:%d: %s", v17, v18, v19, v20, v21, v22, v23, (char)"/Library/Caches/com.apple.xbs/Sources/libcxx_os/libcxxabi/src/demangle/ItaniumDemangle.h");
    a1[91] = &v25[8 * v24];
LABEL_28:
    v35 = *a1;
    v34 = a1[1];
    if (v34 == *a1)
      goto LABEL_117;
    v36 = *v35 - 46;
    v37 = v36 > 0x31;
    v38 = (1 << v36) & 0x2000000800001;
    if (!v37 && v38 != 0)
      goto LABEL_117;
    if ((unint64_t)(v34 - *a1) >= 0xD
      && (*(_QWORD *)v35 == 0x6C62616E65396155 ? (v40 = *(_QWORD *)(v35 + 5) == 0x4966695F656C6261) : (v40 = 0), v40))
    {
      v79 = v35 + 13;
      *a1 = v79;
      v80 = (a1[3] - a1[2]) >> 3;
      while (v79 == v34 || *v79 != 69)
      {
        if (!v86)
          goto LABEL_116;
        v79 = *a1;
        v34 = a1[1];
      }
      *a1 = v79 + 1;
      v84 = v83;
      *((_BYTE *)v41 + 8) = 10;
      *(_WORD *)((char *)v41 + 9) = *(_WORD *)((_BYTE *)v41 + 9) & 0xF000 | 0x540;
      *v41 = off_1EA950C80;
      v41[2] = v82;
      v41[3] = v84;
    }
    else
    {
      v41 = 0;
    }
    v42 = 0;
    if ((_BYTE)v87
      || !BYTE1(v87)
    {
      v44 = *a1;
      v43 = a1[1];
      if (*a1 == v43 || *v44 != 118)
      {
        v85 = v41;
        v52 = (a1[3] - a1[2]) >> 3;
        while (1)
        {
          v86 = v53;
          if (!v53)
            goto LABEL_116;
          if (v90)
            v54 = v52 == (a1[3] - a1[2]) >> 3;
          else
            v54 = 0;
          if (v54)
          {
            *((_BYTE *)v55 + 8) = 87;
            *(_WORD *)((char *)v55 + 9) = *(_WORD *)((_BYTE *)v55 + 9) & 0xF000 | 0x540;
            *v55 = off_1EA950CF0;
            v55[2] = v53;
            v86 = v55;
          }
          if (a1[1] != *a1)
          {
            v56 = **a1 - 46;
            v37 = v56 > 0x31;
            v57 = (1 << v56) & 0x2000800800001;
            if (v37 || v57 == 0)
              continue;
          }
          v46 = v59;
          v47 = *a1;
          v43 = a1[1];
          v41 = v85;
          goto LABEL_72;
        }
      }
      v45 = 0;
      v46 = 0;
      v47 = v44 + 1;
      *a1 = v47;
LABEL_72:
      if (v47 == v43 || *v47 != 81)
      {
        v62 = 0;
      }
      else
      {
        *a1 = v47 + 1;
        v60 = *((_BYTE *)a1 + 778);
        *((_BYTE *)a1 + 778) = 1;
        v62 = v61;
        *((_BYTE *)a1 + 778) = v60;
        if (!v61)
          goto LABEL_116;
      }
      v67 = HIDWORD(v87);
      v68 = v88;
      *((_BYTE *)v66 + 8) = 19;
      *(_WORD *)((char *)v66 + 9) = *(_WORD *)((_BYTE *)v66 + 9) & 0xF000 | 0x100;
      *v66 = off_1EA950D60;
      v66[2] = v42;
      v66[3] = v14;
      v66[4] = v45;
      v66[5] = v46;
      v66[6] = v41;
      v66[7] = v62;
      *((_DWORD *)v66 + 16) = v67;
      *((_BYTE *)v66 + 68) = v68;
LABEL_110:
      v14 = v66;
      goto LABEL_117;
    }
    goto LABEL_116;
  }
  if (v11 >= 2)
  {
    switch(v9[1])
    {
      case 'A':
        *a1 = v9 + 2;
        if (!v13)
          goto LABEL_116;
        *((_BYTE *)v14 + 8) = 21;
        *(_WORD *)((char *)v14 + 9) = *(_WORD *)((_BYTE *)v14 + 9) & 0xF000 | 0x540;
        *v14 = off_1EA94EB40;
        v15 = "template parameter object for ";
        v16 = 30;
        goto LABEL_107;
      case 'B':
      case 'D':
      case 'E':
      case 'F':
      case 'G':
        break;
      case 'C':
        *a1 = v9 + 2;
        if (!v69)
          goto LABEL_116;
        if (!v70)
          goto LABEL_116;
        v77 = *a1;
        if (*a1 == a1[1])
          goto LABEL_116;
        if (*v77 != 95)
          goto LABEL_116;
        *a1 = v77 + 1;
        if (!v78)
          goto LABEL_116;
        *((_BYTE *)v14 + 8) = 22;
        *(_WORD *)((char *)v14 + 9) = *(_WORD *)((_BYTE *)v14 + 9) & 0xF000 | 0x540;
        *v14 = off_1EA94EBC0;
        v14[2] = v78;
        v14[3] = v69;
        goto LABEL_117;
      case 'H':
        *a1 = v9 + 2;
        if (!v13)
          goto LABEL_116;
        *((_BYTE *)v14 + 8) = 21;
        *(_WORD *)((char *)v14 + 9) = *(_WORD *)((_BYTE *)v14 + 9) & 0xF000 | 0x540;
        *v14 = off_1EA94EB40;
        v15 = "thread-local initialization routine for ";
        v16 = 40;
        goto LABEL_107;
      case 'I':
        *a1 = v9 + 2;
        if (!v13)
          goto LABEL_116;
        *((_BYTE *)v14 + 8) = 21;
        *(_WORD *)((char *)v14 + 9) = *(_WORD *)((_BYTE *)v14 + 9) & 0xF000 | 0x540;
        *v14 = off_1EA94EB40;
        v15 = "typeinfo for ";
        v16 = 13;
        goto LABEL_107;
      default:
        switch(v9[1])
        {
          case 'S':
            *a1 = v9 + 2;
            if (!v13)
              goto LABEL_116;
            *((_BYTE *)v14 + 8) = 21;
            *(_WORD *)((char *)v14 + 9) = *(_WORD *)((_BYTE *)v14 + 9) & 0xF000 | 0x540;
            *v14 = off_1EA94EB40;
            v15 = "typeinfo name for ";
            v16 = 18;
            goto LABEL_107;
          case 'T':
            *a1 = v9 + 2;
            if (!v13)
              goto LABEL_116;
            *((_BYTE *)v14 + 8) = 21;
            *(_WORD *)((char *)v14 + 9) = *(_WORD *)((_BYTE *)v14 + 9) & 0xF000 | 0x540;
            *v14 = off_1EA94EB40;
            v15 = "VTT for ";
            v16 = 8;
            goto LABEL_107;
          case 'U':
            goto LABEL_81;
          case 'V':
            *a1 = v9 + 2;
            if (!v13)
              goto LABEL_116;
            *((_BYTE *)v14 + 8) = 21;
            *(_WORD *)((char *)v14 + 9) = *(_WORD *)((_BYTE *)v14 + 9) & 0xF000 | 0x540;
            *v14 = off_1EA94EB40;
            v15 = "vtable for ";
            v16 = 11;
            goto LABEL_107;
          case 'W':
            *a1 = v9 + 2;
            if (!v87)
              goto LABEL_116;
            goto LABEL_110;
          default:
            if (v9[1] != 99)
              goto LABEL_81;
            *a1 = v9 + 2;
              goto LABEL_116;
              goto LABEL_116;
            if (!v13)
              goto LABEL_116;
            *((_BYTE *)v14 + 8) = 21;
            *(_WORD *)((char *)v14 + 9) = *(_WORD *)((_BYTE *)v14 + 9) & 0xF000 | 0x540;
            *v14 = off_1EA94EB40;
            v15 = "covariant return thunk to ";
            v16 = 26;
            break;
        }
        goto LABEL_107;
    }
  }
LABEL_81:
  v63 = v9 + 1;
  *a1 = v63;
  v64 = v10 != v63 && *v63 == 118;
    goto LABEL_116;
  if (!v13)
    goto LABEL_116;
  v65 = (_anonymous_namespace_::BumpPointerAllocator *)(a1 + 101);
  if (v64)
  {
    *((_BYTE *)v14 + 8) = 21;
    *(_WORD *)((char *)v14 + 9) = *(_WORD *)((_BYTE *)v14 + 9) & 0xF000 | 0x540;
    *v14 = off_1EA94EB40;
    v15 = "virtual thunk to ";
    v16 = 17;
    goto LABEL_107;
  }
  *((_BYTE *)v14 + 8) = 21;
  *(_WORD *)((char *)v14 + 9) = *(_WORD *)((_BYTE *)v14 + 9) & 0xF000 | 0x540;
  *v14 = off_1EA94EB40;
  v14[2] = "non-virtual thunk to ";
  v14[3] = 21;
  v14[4] = v13;
LABEL_117:
  return v14;
}

void sub_1DED52D24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Unwind_Resume(a1);
}

char *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::parseNumber(char **a1, int a2)
{
  char *result;
  char *v4;
  char *v5;
  uint64_t v6;

  result = *a1;
  v4 = a1[1];
  v5 = result;
  if (a2)
  {
    if (result == v4)
      return 0;
    v5 = result;
    if (*result == 110)
    {
      v5 = result + 1;
      *a1 = result + 1;
    }
  }
  if (v4 == v5)
    return 0;
  if (*v5 < 0)
    return 0;
  v6 = MEMORY[0x1E0C80978];
  if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * *v5 + 60) & 0x400) == 0)
    return 0;
  do
  {
    if (*v5 < 0)
      break;
    if ((*(_DWORD *)(v6 + 4 * *v5 + 60) & 0x400) == 0)
      break;
    *a1 = ++v5;
  }
  while (v5 != v4);
  return result;
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::make<`anonymous namespace'::itanium_demangle::SpecialName,char const(&)[34],`anonymous namespace'::itanium_demangle::Node *&>(uint64_t a1, const char *a2, uint64_t *a3)
{
  _QWORD *v5;
  size_t v6;
  uint64_t v7;

  v6 = strlen(a2);
  v7 = *a3;
  *((_BYTE *)v5 + 8) = 21;
  *(_WORD *)((char *)v5 + 9) = *(_WORD *)((_BYTE *)v5 + 9) & 0xF000 | 0x540;
  *v5 = off_1EA94EB40;
  v5[2] = a2;
  v5[3] = v6;
  v5[4] = v7;
  return v5;
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::parseType(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  unint64_t v11;
  int v12;
  unint64_t v13;
  int v14;
  unint64_t v15;
  int v16;
  unint64_t v17;
  BOOL v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  unsigned __int8 *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  int v28;
  BOOL v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  unsigned int v41;
  int v42;
  const char *v45;
  const char *v46;
  _QWORD *v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  const char *v51;
  const char *v52;
  const char *v53;
  const char *v54;
  const char *v55;
  unsigned __int8 *v56;
  uint64_t v57;
  unsigned __int8 *v58;
  uint64_t v59;
  unsigned __int8 *v60;
  uint64_t v61;
  unsigned __int8 *v62;
  uint64_t v63;
  const char *v64;
  const char *v65;
  unsigned int v66;
  uint64_t v67;
  _QWORD *v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  unsigned __int8 *v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD *v76;
  _QWORD *v77;
  _QWORD *v78;
  _QWORD *v79;
  _QWORD *v80;
  int32x2_t v81;
  int64x2_t v82;
  int8x16_t v83;
  int8x16_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  _QWORD *v88;
  unsigned __int8 *v89;
  _QWORD *v90;
  uint64_t v91;
  uint64_t v92;
  _QWORD *v93;
  _QWORD *v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  unsigned __int8 *v98;
  _QWORD *v99;
  uint64_t v100;
  uint64_t v101;

  v99 = 0;
  v9 = *(unsigned __int8 **)a1;
  v10 = *(unsigned __int8 **)(a1 + 8);
  v11 = (unint64_t)&v10[-*(_QWORD *)a1];
  if (v10 == *(unsigned __int8 **)a1)
  {
LABEL_63:
LABEL_64:
    v26 = v19;
    v99 = v19;
    goto LABEL_65;
  }
  v12 = *v9;
  switch(*v9)
  {
    case 'A':
      if (v12 != 65)
        goto LABEL_127;
      *(_QWORD *)a1 = v9 + 1;
      if (v10 == v9 + 1)
      {
        if ((*(_BYTE *)(MEMORY[0x1E0C80978] + 61) & 4) == 0)
          goto LABEL_119;
        goto LABEL_121;
      }
      v20 = (char)v9[1];
      if (v20 < 0)
        goto LABEL_119;
      if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v20 + 60) & 0x400) != 0)
      {
LABEL_121:
        v72 = v71;
        *((_BYTE *)v69 + 8) = 8;
        *(_WORD *)((char *)v69 + 9) = *(_WORD *)((_BYTE *)v69 + 9) & 0xF000 | 0x540;
        *v69 = off_1EA94EC30;
        v69[2] = v70;
        v69[3] = v72;
        goto LABEL_122;
      }
      if ((_DWORD)v20 == 95)
      {
        v21 = 0;
        v22 = v9 + 2;
        goto LABEL_125;
      }
LABEL_119:
      if (!v69)
        goto LABEL_127;
LABEL_122:
      v73 = *(unsigned __int8 **)a1;
      if (*(_QWORD *)a1 == *(_QWORD *)(a1 + 8) || *v73 != 95)
        goto LABEL_127;
      v21 = v69;
      v22 = v73 + 1;
LABEL_125:
      *(_QWORD *)a1 = v22;
      if (v74)
      {
        v75 = v74;
        *((_BYTE *)v26 + 8) = 15;
        *(_WORD *)((char *)v26 + 9) = *(_WORD *)((_BYTE *)v26 + 9) & 0xF000 | 0x400;
        *v26 = off_1EA951380;
        v26[2] = v75;
        v26[3] = v21;
        goto LABEL_128;
      }
LABEL_127:
      v26 = 0;
LABEL_128:
      v99 = v26;
LABEL_65:
      if (v26)
LABEL_66:
      return v26;
    case 'C':
      *(_QWORD *)a1 = v9 + 1;
      if (!v23)
        return 0;
      v24 = v23;
      v26 = v25;
      *((_BYTE *)v25 + 8) = 5;
      *(_WORD *)((char *)v25 + 9) = *(_WORD *)((_BYTE *)v25 + 9) & 0xF000 | 0x540;
      *v25 = off_1EA951230;
      v25[2] = v24;
      v25[3] = " complex";
      v27 = 8;
      goto LABEL_36;
    case 'D':
      if (v11 < 2)
        return 0;
      v26 = 0;
      v28 = v9[1];
      switch(v9[1])
      {
        case 'B':
        case 'U':
          v29 = v28 == 66;
          v30 = (unint64_t)(v9 + 2);
          *(_QWORD *)a1 = v30;
          if (v10 == (unsigned __int8 *)v30)
          {
            v30 = 0;
          }
          else
          {
            LODWORD(v30) = *(char *)v30;
            if ((v30 & 0x80000000) != 0)
              goto LABEL_156;
            v30 = v30;
          }
          if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v30 + 60) & 0x400) != 0)
          {
            v97 = v96;
            *((_BYTE *)v94 + 8) = 8;
            *(_WORD *)((char *)v94 + 9) = *(_WORD *)((_BYTE *)v94 + 9) & 0xF000 | 0x540;
            *v94 = off_1EA94EC30;
            v94[2] = v95;
            v94[3] = v97;
            goto LABEL_159;
          }
LABEL_156:
          v94 = v93;
          if (!v93)
            return 0;
LABEL_159:
          v98 = *(unsigned __int8 **)a1;
          if (*(_QWORD *)a1 == *(_QWORD *)(a1 + 8) || *v98 != 95)
            return 0;
          *(_QWORD *)a1 = v98 + 1;
          *((_BYTE *)v26 + 8) = 32;
          *(_WORD *)((char *)v26 + 9) = *(_WORD *)((_BYTE *)v26 + 9) & 0xF000 | 0x540;
          *v26 = off_1EA9511C0;
          v26[2] = v94;
          *((_BYTE *)v26 + 24) = v29;
          break;
        case 'F':
          *(_QWORD *)a1 = v9 + 2;
          v87 = v86;
          *((_BYTE *)v88 + 8) = 8;
          *(_WORD *)((char *)v88 + 9) = *(_WORD *)((_BYTE *)v88 + 9) & 0xF000 | 0x540;
          *v88 = off_1EA94EC30;
          v88[2] = v85;
          v88[3] = v87;
          v89 = *(unsigned __int8 **)a1;
          if (*(_QWORD *)a1 == *(_QWORD *)(a1 + 8) || *v89 != 95)
            return 0;
          v90 = v88;
          *(_QWORD *)a1 = v89 + 1;
          *((_BYTE *)v26 + 8) = 31;
          *(_WORD *)((char *)v26 + 9) = *(_WORD *)((_BYTE *)v26 + 9) & 0xF000 | 0x540;
          *v26 = off_1EA951150;
          v26[2] = v90;
          return v26;
        case 'K':
        case 'k':
          *(_QWORD *)a1 = v9 + 2;
          if (!v79)
            return 0;
          v80 = v79;
          *((_BYTE *)v26 + 8) = 5;
          *(_WORD *)((char *)v26 + 9) = *(_WORD *)((_BYTE *)v26 + 9) & 0xF000 | 0x540;
          *v26 = off_1EA951230;
          v26[2] = v80;
          v81 = vdup_n_s32(v28 == 107);
          v82.i64[0] = v81.u32[0];
          v82.i64[1] = v81.u32[1];
          v83 = (int8x16_t)vdupq_n_s64(0xFuLL);
          v83.i64[0] = (uint64_t)" decltype(auto)";
          v84 = (int8x16_t)vdupq_n_s64(5uLL);
          v84.i64[0] = (uint64_t)" auto";
          *(int8x16_t *)(v26 + 3) = vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v82, 0x3FuLL)), v84, v83);
          return v26;
        case 'O':
        case 'o':
        case 'w':
        case 'x':
          goto LABEL_117;
        case 'T':
        case 't':
          goto LABEL_64;
        case 'a':
          *(_QWORD *)a1 = v9 + 2;
          v46 = "auto";
        case 'c':
          *(_QWORD *)a1 = v9 + 2;
          v55 = "decltype(auto)";
        case 'd':
          *(_QWORD *)a1 = v9 + 2;
          v65 = "decimal64";
        case 'e':
          *(_QWORD *)a1 = v9 + 2;
          v51 = "decimal128";
        case 'f':
          *(_QWORD *)a1 = v9 + 2;
          v65 = "decimal32";
        case 'h':
          *(_QWORD *)a1 = v9 + 2;
          v46 = "half";
        case 'i':
          *(_QWORD *)a1 = v9 + 2;
          v54 = "char32_t";
        case 'n':
          *(_QWORD *)a1 = v9 + 2;
          v55 = "std::nullptr_t";
        case 'p':
          *(_QWORD *)a1 = v9 + 2;
          if (!v91)
            return 0;
          v92 = v91;
          v26 = v25;
          *((_BYTE *)v25 + 8) = 42;
          *(_WORD *)((char *)v25 + 9) = *(_WORD *)((_BYTE *)v25 + 9) & 0xF000 | 0x540;
          *v25 = off_1EA94FE80;
          v25[2] = v92;
          goto LABEL_49;
        case 's':
          *(_QWORD *)a1 = v9 + 2;
          v54 = "char16_t";
        case 'u':
          *(_QWORD *)a1 = v9 + 2;
          v64 = "char8_t";
        case 'v':
          goto LABEL_64;
        default:
          return v26;
      }
      return v26;
    case 'F':
      goto LABEL_117;
    case 'G':
      *(_QWORD *)a1 = v9 + 1;
      if (!v31)
        return 0;
      v32 = v31;
      v26 = v25;
      *((_BYTE *)v25 + 8) = 5;
      *(_WORD *)((char *)v25 + 9) = *(_WORD *)((_BYTE *)v25 + 9) & 0xF000 | 0x540;
      *v25 = off_1EA951230;
      v25[2] = v32;
      v25[3] = " imaginary";
      v27 = 10;
LABEL_36:
      v25[4] = v27;
      goto LABEL_49;
    case 'K':
    case 'V':
    case 'r':
      v13 = v12 == 114;
      if (v11 > v13)
      {
        v14 = v12 == 114 ? 2 : 1;
        if (v9[v13] == 86)
          LODWORD(v13) = v14;
      }
      v15 = v13;
      if (v11 > v13)
      {
        if (v9[v13] == 75)
          v15 = (v13 + 1);
        else
          v15 = v13;
        LODWORD(v13) = v15;
      }
      if (v11 <= v15)
        goto LABEL_20;
      v16 = v9[v15];
      if (v16 != 70)
      {
        v17 = v13 + 1;
        v18 = v16 == 68 && v11 > v17;
        if (!v18)
          goto LABEL_20;
        v66 = v9[v17] - 79;
        v18 = v66 > 0x29;
        v67 = (1 << v66) & 0x30100000001;
        if (v18 || v67 == 0)
          goto LABEL_20;
      }
LABEL_117:
      goto LABEL_64;
    case 'M':
      if (v12 != 77)
        goto LABEL_127;
      *(_QWORD *)a1 = v9 + 1;
      if (!v101)
        goto LABEL_127;
      if (!v100)
        goto LABEL_127;
      goto LABEL_128;
    case 'O':
      *(_QWORD *)a1 = v9 + 1;
      if (!v101)
        return 0;
      LODWORD(v100) = 1;
      goto LABEL_47;
    case 'P':
      *(_QWORD *)a1 = v9 + 1;
      if (!v101)
        return 0;
      goto LABEL_48;
    case 'R':
      *(_QWORD *)a1 = v9 + 1;
      if (!v101)
        return 0;
      LODWORD(v100) = 0;
LABEL_47:
LABEL_48:
      v26 = v25;
      goto LABEL_49;
    case 'S':
      if (v11 >= 2 && v9[1] == 116)
        goto LABEL_63;
      LOBYTE(v101) = 0;
      v99 = v33;
      if (!v33)
        return 0;
      v26 = v33;
      if (*(_QWORD *)(a1 + 8) == *(_QWORD *)a1)
      {
        v40 = v101;
      }
      else
      {
        v40 = v101;
        if (**(_BYTE **)a1 == 73)
        {
          if ((_BYTE)v101)
          {
            if (!*(_BYTE *)(a1 + 776))
              return v26;
          }
          else
          {
          }
LABEL_133:
          if (v76)
          {
            v77 = v76;
            *((_BYTE *)v78 + 8) = 45;
            *(_WORD *)((char *)v78 + 9) = *(_WORD *)((_BYTE *)v78 + 9) & 0xF000 | 0x540;
            *v78 = off_1EA950B30;
            v78[2] = v26;
            v78[3] = v77;
            v99 = v78;
            v26 = v78;
            goto LABEL_66;
          }
          return 0;
        }
      }
      if (v40)
        return v26;
      goto LABEL_66;
    case 'T':
      if (v11 >= 2)
      {
        v41 = v9[1] - 101;
        v18 = v41 > 0x10;
        v42 = (1 << v41) & 0x14001;
        if (!v18 && v42 != 0)
          goto LABEL_63;
      }
      v99 = v26;
      if (!v26)
        return v26;
      if (*(_BYTE *)(a1 + 776) && *(_QWORD *)(a1 + 8) != *(_QWORD *)a1 && **(_BYTE **)a1 == 73)
        goto LABEL_133;
      goto LABEL_66;
    case 'U':
LABEL_20:
      goto LABEL_64;
    case 'a':
      *(_QWORD *)a1 = v9 + 1;
      v45 = "signed char";
    case 'b':
      *(_QWORD *)a1 = v9 + 1;
      v46 = "BOOL";
    case 'c':
      *(_QWORD *)a1 = v9 + 1;
      v46 = "char";
    case 'd':
      *(_QWORD *)a1 = v9 + 1;
      v26 = v47;
      *((_BYTE *)v47 + 8) = 8;
      *(_WORD *)((char *)v47 + 9) = *(_WORD *)((_BYTE *)v47 + 9) & 0xF000 | 0x540;
      *v47 = off_1EA94EC30;
      v48 = "double";
      v49 = 6;
      goto LABEL_104;
    case 'e':
      *(_QWORD *)a1 = v9 + 1;
      v45 = "long double";
    case 'f':
      *(_QWORD *)a1 = v9 + 1;
      v50 = "float";
    case 'g':
      *(_QWORD *)a1 = v9 + 1;
      v51 = "__float128";
    case 'h':
      *(_QWORD *)a1 = v9 + 1;
      v52 = "unsigned char";
    case 'i':
      *(_QWORD *)a1 = v9 + 1;
      v53 = "int";
    case 'j':
      *(_QWORD *)a1 = v9 + 1;
      v26 = v47;
      *((_BYTE *)v47 + 8) = 8;
      *(_WORD *)((char *)v47 + 9) = *(_WORD *)((_BYTE *)v47 + 9) & 0xF000 | 0x540;
      *v47 = off_1EA94EC30;
      v48 = "unsigned int";
      v49 = 12;
      goto LABEL_104;
    case 'l':
      *(_QWORD *)a1 = v9 + 1;
      v46 = "long";
    case 'm':
      *(_QWORD *)a1 = v9 + 1;
      v52 = "unsigned long";
    case 'n':
      *(_QWORD *)a1 = v9 + 1;
      v54 = "__int128";
    case 'o':
      *(_QWORD *)a1 = v9 + 1;
      v26 = v47;
      *((_BYTE *)v47 + 8) = 8;
      *(_WORD *)((char *)v47 + 9) = *(_WORD *)((_BYTE *)v47 + 9) & 0xF000 | 0x540;
      *v47 = off_1EA94EC30;
      v48 = "unsigned __int128";
      v49 = 17;
      goto LABEL_104;
    case 's':
      *(_QWORD *)a1 = v9 + 1;
      v50 = "short";
    case 't':
      *(_QWORD *)a1 = v9 + 1;
      v55 = "unsigned short";
    case 'u':
      *(_QWORD *)a1 = v9 + 1;
      if (!v57)
        return 0;
      v58 = v56;
      v59 = v57;
      v60 = *(unsigned __int8 **)a1;
      if (*(_QWORD *)a1 == *(_QWORD *)(a1 + 8) || *v60 != 73)
      {
        v26 = v25;
        *((_BYTE *)v25 + 8) = 8;
        *(_WORD *)((char *)v25 + 9) = *(_WORD *)((_BYTE *)v25 + 9) & 0xF000 | 0x540;
        *v25 = off_1EA94EC30;
        v25[2] = v58;
        v25[3] = v59;
      }
      else
      {
        *(_QWORD *)a1 = v60 + 1;
        if (!v61)
          return 0;
        v62 = *(unsigned __int8 **)a1;
        if (*(_QWORD *)a1 == *(_QWORD *)(a1 + 8) || *v62 != 69)
          return 0;
        v63 = v61;
        *(_QWORD *)a1 = v62 + 1;
        v26 = v25;
        *((_BYTE *)v25 + 8) = 7;
        *(_WORD *)((char *)v25 + 9) = *(_WORD *)((_BYTE *)v25 + 9) & 0xF000 | 0x540;
        *v25 = off_1EA9510E0;
        v25[2] = v58;
        v25[3] = v59;
        v25[4] = v63;
      }
LABEL_49:
      v99 = v25;
      goto LABEL_66;
    case 'v':
      *(_QWORD *)a1 = v9 + 1;
      v46 = "void";
    case 'w':
      *(_QWORD *)a1 = v9 + 1;
      v64 = "wchar_t";
    case 'x':
      *(_QWORD *)a1 = v9 + 1;
      v65 = "long long";
    case 'y':
      *(_QWORD *)a1 = v9 + 1;
      v26 = v47;
      *((_BYTE *)v47 + 8) = 8;
      *(_WORD *)((char *)v47 + 9) = *(_WORD *)((_BYTE *)v47 + 9) & 0xF000 | 0x540;
      *v47 = off_1EA94EC30;
      v48 = "unsigned long long";
      v49 = 18;
LABEL_104:
      v47[2] = v48;
      v47[3] = v49;
      return v26;
    case 'z':
      *(_QWORD *)a1 = v9 + 1;
      v53 = "...";
    default:
      goto LABEL_63;
  }
}

uint64_t `anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::SaveTemplateParams::SaveTemplateParams(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;

  *(_QWORD *)a1 = a2;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_QWORD *)(a1 + 8) = a1 + 32;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_QWORD *)(a1 + 64) = a1 + 88;
  *(_QWORD *)(a1 + 16) = a1 + 32;
  *(_QWORD *)(a1 + 24) = a1 + 64;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_QWORD *)(a1 + 72) = a1 + 88;
  *(_QWORD *)(a1 + 80) = a1 + 152;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  v3 = *(_QWORD **)a1;
  v3[84] = *(_QWORD *)(*(_QWORD *)a1 + 664);
  v3[73] = v3[72];
  return a1;
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::parseName(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const char *v10;
  const char *v11;
  int v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  const char *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  _QWORD *v29;
  int v30;
  int v31;
  char v32;
  unint64_t v33;
  _QWORD *v34;
  unsigned int v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD *v38;
  _QWORD *v39;
  const char *v40;
  uint64_t v41;
  const char *v43;
  const char *v44;
  uint64_t v45;
  _QWORD *v46;
  const char *v47;
  char v48;
  uint64_t v49[20];

  v10 = *(const char **)a1;
  v11 = *(const char **)(a1 + 8);
  if (v11 == *(const char **)a1)
    goto LABEL_8;
  v12 = *(unsigned __int8 *)v10;
  if (v12 == 90)
  {
    *(_QWORD *)a1 = v10 + 1;
    if (!v24)
      return 0;
    v27 = *(const char **)a1;
    v26 = *(const char **)(a1 + 8);
    if (*(const char **)a1 == v26 || *v27 != 69)
      return 0;
    v28 = v24;
    *(_QWORD *)a1 = v27 + 1;
    if (v27 + 1 != v26 && v27[1] == 115)
    {
      *(_QWORD *)a1 = v27 + 2;
      *((_BYTE *)v20 + 8) = 26;
      *(_WORD *)((char *)v20 + 9) = *(_WORD *)((_BYTE *)v20 + 9) & 0xF000 | 0x540;
      *v20 = off_1EA9509E0;
      v20[2] = v28;
      v20[3] = v29;
      return v20;
    }
    v43 = *(const char **)a1;
    if (*(_QWORD *)a1 == *(_QWORD *)(a1 + 8) || *v43 != 100)
    {
      if (v45)
      {
        goto LABEL_86;
      }
    }
    else
    {
      *(_QWORD *)a1 = v43 + 1;
      v44 = *(const char **)a1;
      if (*(_QWORD *)a1 != *(_QWORD *)(a1 + 8) && *v44 == 95)
      {
        *(_QWORD *)a1 = v44 + 1;
        if (v45)
        {
LABEL_86:
          v20 = v46;
          *((_BYTE *)v46 + 8) = 26;
          *(_WORD *)((char *)v46 + 9) = *(_WORD *)((_BYTE *)v46 + 9) & 0xF000 | 0x540;
          *v46 = off_1EA9509E0;
          v46[2] = v28;
          v46[3] = v45;
LABEL_88:
          return v20;
        }
      }
    }
    v20 = 0;
    goto LABEL_88;
  }
  if (v12 == 78)
  {
    *(_QWORD *)a1 = v10 + 1;
    if (v10 + 1 != v11 && v10[1] == 72)
    {
      v13 = v10 + 2;
      *(_QWORD *)a1 = v13;
      if (a2)
        *(_BYTE *)(a2 + 24) = 1;
      goto LABEL_37;
    }
    if (a2)
      *(_DWORD *)(a2 + 4) = v30;
    v13 = *(const char **)a1;
    v11 = *(const char **)(a1 + 8);
    if (*(const char **)a1 != v11)
    {
      v31 = *(unsigned __int8 *)v13;
      if (v31 == 82)
      {
        *(_QWORD *)a1 = ++v13;
        if (a2)
        {
          v32 = 1;
          goto LABEL_36;
        }
LABEL_37:
        v20 = 0;
        v49[0] = 0;
        while (1)
        {
          while (1)
          {
            if (v13 != v11 && *v13 == 69)
            {
              *(_QWORD *)a1 = v13 + 1;
              if (v20)
              {
                v41 = *(_QWORD *)(a1 + 304);
                if (*(_QWORD *)(a1 + 296) != v41)
                {
                  *(_QWORD *)(a1 + 304) = v41 - 8;
                  return v20;
                }
                return 0;
              }
              return v20;
            }
            if (a2)
              *(_BYTE *)(a2 + 1) = 0;
            v33 = v11 - v13;
            if (!v33)
              goto LABEL_60;
            v34 = 0;
            v35 = *(unsigned __int8 *)v13;
            if (v35 > 0x52)
              break;
            if (v35 == 68)
            {
              if (v33 >= 2 && (*((unsigned __int8 *)v13 + 1) | 0x20) == 0x74)
              {
                if (v20)
                  return 0;
LABEL_62:
                v20 = v39;
                v49[0] = (uint64_t)v39;
                if (!v39)
                  return v20;
                goto LABEL_63;
              }
LABEL_60:
              v34 = 0;
              goto LABEL_61;
            }
            if (v35 != 73)
              goto LABEL_61;
            if (!v20)
              return v20;
            if (!v36 || *((_BYTE *)v20 + 8) == 45)
              return 0;
            v37 = v36;
            if (a2)
              *(_BYTE *)(a2 + 1) = 1;
            *((_BYTE *)v38 + 8) = 45;
            *(_WORD *)((char *)v38 + 9) = *(_WORD *)((_BYTE *)v38 + 9) & 0xF000 | 0x540;
            *v38 = off_1EA950B30;
            v38[2] = v20;
            v38[3] = v37;
            v49[0] = (uint64_t)v38;
            v20 = v38;
LABEL_63:
            v13 = *(const char **)a1;
            v40 = *(const char **)(a1 + 8);
            v11 = *(const char **)a1;
            if (*(const char **)a1 != v40)
            {
              v11 = *(const char **)(a1 + 8);
              if (*v13 == 77)
              {
                *(_QWORD *)a1 = ++v13;
                v11 = v40;
              }
            }
          }
          if (v35 != 83)
          {
            if (v35 == 84)
            {
              if (v20)
                return 0;
              goto LABEL_62;
            }
LABEL_61:
            goto LABEL_62;
          }
          if (v33 >= 2 && v13[1] == 116)
          {
            *(_QWORD *)a1 = v13 + 2;
          }
          else
          {
            if (!v34)
              return 0;
          }
          if (*((_BYTE *)v34 + 8) == 27)
            goto LABEL_61;
          if (v20)
            return 0;
          v49[0] = (uint64_t)v34;
          v20 = v34;
          v13 = *(const char **)a1;
          v11 = *(const char **)(a1 + 8);
        }
      }
      if (v31 == 79)
      {
        *(_QWORD *)a1 = ++v13;
        if (a2)
        {
          v32 = 2;
LABEL_36:
          *(_BYTE *)(a2 + 8) = v32;
          goto LABEL_37;
        }
        goto LABEL_37;
      }
    }
    if (a2)
      *(_BYTE *)(a2 + 8) = 0;
    goto LABEL_37;
  }
LABEL_8:
  v48 = 0;
  v49[0] = (uint64_t)v20;
  if (v20)
  {
    if (*(_QWORD *)(a1 + 8) == *(_QWORD *)a1 || **(_BYTE **)a1 != 73)
    {
      if (!v48)
        return v20;
      return 0;
    }
    if (!v48)
    if (!v21)
      return 0;
    v22 = v21;
    if (a2)
      *(_BYTE *)(a2 + 1) = 1;
    *((_BYTE *)v23 + 8) = 45;
    *(_WORD *)((char *)v23 + 9) = *(_WORD *)((_BYTE *)v23 + 9) & 0xF000 | 0x540;
    *v23 = off_1EA950B30;
    v23[2] = v20;
    v23[3] = v22;
    return v23;
  }
  return v20;
}

void sub_1DED541F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Unwind_Resume(a1);
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::parseTemplateArg(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char *v9;
  char *v10;
  int v11;
  unint64_t v12;
  char *v13;
  unint64_t v14;
  _QWORD *result;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t (**v18)();
  char *v19;
  _QWORD *v20;
  _QWORD *v21;

  v10 = *(char **)a1;
  v9 = *(char **)(a1 + 8);
  if (v9 == *(char **)a1)
    v11 = 0;
  else
    v11 = *v10;
  HIDWORD(v12) = v11;
  LODWORD(v12) = v11 - 74;
  switch((v12 >> 1))
  {
    case 0u:
      v13 = v10 + 1;
      *(_QWORD *)a1 = v13;
      v14 = (uint64_t)(*(_QWORD *)(a1 + 24) - *(_QWORD *)(a1 + 16)) >> 3;
      while (1)
      {
        if (v13 != v9 && *v13 == 69)
        {
          *(_QWORD *)a1 = v13 + 1;
          v17 = v20;
          *((_BYTE *)result + 8) = 41;
          *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
          v18 = off_1EA950BA0;
          goto LABEL_26;
        }
        v21 = result;
        if (!result)
          break;
        v13 = *(char **)a1;
        v9 = *(char **)(a1 + 8);
      }
      break;
    case 1u:
      if ((unint64_t)&v9[-*(_QWORD *)a1] >= 2 && v10[1] == 90)
      {
        *(_QWORD *)a1 = v10 + 2;
        if (result)
          goto LABEL_20;
      }
      else
      {
      }
      break;
    case 5u:
        goto LABEL_18;
      if (result)
      {
        v16 = result;
        if (result)
        {
          v17 = result;
          *((_BYTE *)result + 8) = 34;
          *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
          v18 = off_1EA950C10;
LABEL_26:
          *result = v18;
          result[2] = v16;
          result[3] = v17;
        }
      }
      break;
    case 7u:
      *(_QWORD *)a1 = v10 + 1;
      if (result)
      {
LABEL_20:
        v19 = *(char **)a1;
        if (*(_QWORD *)a1 == *(_QWORD *)(a1 + 8) || *v19 != 69)
          result = 0;
        else
          *(_QWORD *)a1 = v19 + 1;
      }
      break;
    default:
LABEL_18:
      break;
  }
  return result;
}

const void **`anonymous namespace'::itanium_demangle::PODSmallVector<`anonymous namespace'::itanium_demangle::Node *,32ul>::push_back(const void **result, uint64_t *size)
{
  const void **v3;
  char *v4;
  void *v5;
  uint64_t v6;
  const void **v7;
  _BYTE *v8;
  uint64_t v9;

  v3 = result;
  v4 = (char *)result[1];
  if (v4 == result[2])
  {
    v5 = (void *)*result;
    v6 = v4 - (_BYTE *)*v3;
    if (*v3 == v3 + 3)
    {
      result = (const void **)malloc_type_malloc(2 * v6, 0x2004093837F09uLL);
      if (!result)
        goto LABEL_11;
      v7 = result;
      v8 = v3[1];
      if (v8 != *v3)
        result = (const void **)memmove(result, *v3, v8 - (_BYTE *)*v3);
      *v3 = v7;
    }
    else
    {
      result = (const void **)malloc_type_realloc(v5, 2 * v6, 0x2004093837F09uLL);
      v7 = result;
      *v3 = result;
      if (!result)
LABEL_11:
        abort();
    }
    v4 = (char *)&v7[v6 >> 3];
    v3[1] = v4;
    v3[2] = &v7[v6 >> 2];
  }
  v9 = *size;
  v3[1] = v4 + 8;
  *(_QWORD *)v4 = v9;
  return result;
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::popTrailingNodeArray(_QWORD *a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  const void *v12;
  _QWORD *v13;
  _QWORD *v14;
  size_t v15;
  uint64_t v16;

  v8 = a1[2];
  v9 = a1[3];
  if (a2 > (v9 - v8) >> 3)
    goto LABEL_6;
  v12 = (const void *)(v8 + 8 * a2);
  v14 = v13;
  v15 = v9 - (_QWORD)v12;
  if (v15)
    memmove(v13, v12, v15);
  v16 = a1[2];
  if (a2 > (a1[3] - v16) >> 3)
LABEL_6:
    abort_message("%s:%d: %s", a2, a3, a4, a5, a6, a7, a8, (char)"/Library/Caches/com.apple.xbs/Sources/libcxx_os/libcxxabi/src/demangle/ItaniumDemangle.h");
  a1[3] = v16 + 8 * a2;
  return v14;
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::SaveTemplateParams::~SaveTemplateParams(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;

  v2 = (_QWORD *)a1[8];
  if (v2 != a1 + 11)
    free(v2);
  v3 = (_QWORD *)a1[1];
  if (v3 != a1 + 4)
    free(v3);
  return a1;
}

char *`anonymous namespace'::itanium_demangle::PODSmallVector<`anonymous namespace'::itanium_demangle::PODSmallVector<`anonymous namespace'::itanium_demangle::Node *,8ul> *,4ul>::operator=(char *__dst, uint64_t a2)
{
  _BYTE *v4;
  _BYTE *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  _BYTE *v11;

  v5 = (_BYTE *)(a2 + 24);
  v4 = *(_BYTE **)a2;
  v7 = __dst + 24;
  v6 = *(char **)__dst;
  if (v4 == v5)
  {
    if (v6 != v7)
    {
      free(v6);
      *(_QWORD *)__dst = v7;
      *((_QWORD *)__dst + 1) = v7;
      *((_QWORD *)__dst + 2) = __dst + 56;
      v4 = *(_BYTE **)a2;
    }
    v10 = *(_BYTE **)(a2 + 8);
    if (v10 == v4)
    {
      v11 = v4;
    }
    else
    {
      memmove(v7, v4, v10 - v4);
      v4 = *(_BYTE **)a2;
      v11 = *(_BYTE **)(a2 + 8);
    }
    *((_QWORD *)__dst + 1) = &v7[v11 - v4];
    *(_QWORD *)(a2 + 8) = v4;
  }
  else
  {
    *(_QWORD *)__dst = v4;
    if (v6 == v7)
    {
      *(_OWORD *)(__dst + 8) = *(_OWORD *)(a2 + 8);
      *(_QWORD *)a2 = v5;
      *(_QWORD *)(a2 + 8) = v5;
      *(_QWORD *)(a2 + 16) = a2 + 56;
    }
    else
    {
      *(_QWORD *)a2 = v6;
      v8 = *((_QWORD *)__dst + 1);
      *((_QWORD *)__dst + 1) = *(_QWORD *)(a2 + 8);
      *(_QWORD *)(a2 + 8) = v8;
      v9 = *((_QWORD *)__dst + 2);
      *((_QWORD *)__dst + 2) = *(_QWORD *)(a2 + 16);
      *(_QWORD *)(a2 + 8) = *(_QWORD *)a2;
      *(_QWORD *)(a2 + 16) = v9;
    }
  }
  return __dst;
}

char *`anonymous namespace'::itanium_demangle::PODSmallVector<`anonymous namespace'::itanium_demangle::Node *,8ul>::operator=(char *__dst, uint64_t a2)
{
  _BYTE *v4;
  _BYTE *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  _BYTE *v11;

  v5 = (_BYTE *)(a2 + 24);
  v4 = *(_BYTE **)a2;
  v7 = __dst + 24;
  v6 = *(char **)__dst;
  if (v4 == v5)
  {
    if (v6 != v7)
    {
      free(v6);
      *(_QWORD *)__dst = v7;
      *((_QWORD *)__dst + 1) = v7;
      *((_QWORD *)__dst + 2) = __dst + 88;
      v4 = *(_BYTE **)a2;
    }
    v10 = *(_BYTE **)(a2 + 8);
    if (v10 == v4)
    {
      v11 = v4;
    }
    else
    {
      memmove(v7, v4, v10 - v4);
      v4 = *(_BYTE **)a2;
      v11 = *(_BYTE **)(a2 + 8);
    }
    *((_QWORD *)__dst + 1) = &v7[v11 - v4];
    *(_QWORD *)(a2 + 8) = v4;
  }
  else
  {
    *(_QWORD *)__dst = v4;
    if (v6 == v7)
    {
      *(_OWORD *)(__dst + 8) = *(_OWORD *)(a2 + 8);
      *(_QWORD *)a2 = v5;
      *(_QWORD *)(a2 + 8) = v5;
      *(_QWORD *)(a2 + 16) = a2 + 88;
    }
    else
    {
      *(_QWORD *)a2 = v6;
      v8 = *((_QWORD *)__dst + 1);
      *((_QWORD *)__dst + 1) = *(_QWORD *)(a2 + 8);
      *(_QWORD *)(a2 + 8) = v8;
      v9 = *((_QWORD *)__dst + 2);
      *((_QWORD *)__dst + 2) = *(_QWORD *)(a2 + 16);
      *(_QWORD *)(a2 + 8) = *(_QWORD *)a2;
      *(_QWORD *)(a2 + 16) = v9;
    }
  }
  return __dst;
}

uint64_t `anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::parseCallOffset(uint64_t a1)
{
  char *v1;
  int v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;
  char *v9;

  v1 = *(char **)a1;
  if (*(_QWORD *)a1 == *(_QWORD *)(a1 + 8))
    return 1;
  v3 = *v1;
  if (v3 != 118)
  {
    if (v3 == 104)
    {
      *(_QWORD *)a1 = v1 + 1;
      v4 = 1;
      goto LABEL_5;
    }
    return 1;
  }
  *(_QWORD *)a1 = v1 + 1;
  v4 = 1;
  if (!v8)
    return v4;
  v9 = *(char **)a1;
  if (*(_QWORD *)a1 == *(_QWORD *)(a1 + 8) || *v9 != 95)
    return v4;
  *(_QWORD *)a1 = v9 + 1;
LABEL_5:
  if (v5)
  {
    v6 = *(char **)a1;
    if (*(_QWORD *)a1 != *(_QWORD *)(a1 + 8) && *v6 == 95)
    {
      v4 = 0;
      *(_QWORD *)a1 = v6 + 1;
    }
  }
  return v4;
}

uint64_t `anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::parseSeqId(unsigned __int8 **a1, uint64_t *a2)
{
  char *v2;
  unsigned __int8 *v3;
  unsigned int v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v3 = *a1;
  v2 = (char *)a1[1];
  if (v2 == (char *)*a1 || (char)*v3 < 48)
    return 1;
  v4 = *v3;
  if (v4 >= 0x3A && v4 - 65 > 0x19)
    return 1;
  v6 = 0;
  do
  {
    if ((char)*v3 < 48)
      break;
    if (*v3 >= 0x3Au)
    {
      if (*v3 - 65 >= 0x1A)
        break;
      v7 = -55;
    }
    else
    {
      v7 = -48;
    }
    v6 = v7 + 36 * v6 + *v3++;
    *a1 = v3;
  }
  while (v3 != (unsigned __int8 *)v2);
  result = 0;
  *a2 = v6;
  return result;
}

uint64_t `anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::parseModuleNameOpt(_QWORD *a1, uint64_t *a2)
{
  _BYTE *v2;
  _BYTE *v3;
  _anonymous_namespace_::BumpPointerAllocator *v6;
  const void **v7;
  char v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v14;

  v2 = (_BYTE *)*a1;
  v3 = (_BYTE *)a1[1];
  if ((_BYTE *)*a1 != v3)
  {
    v6 = (_anonymous_namespace_::BumpPointerAllocator *)(a1 + 101);
    v7 = (const void **)(a1 + 37);
    while (*v2 == 87)
    {
      *a1 = v2 + 1;
      if (v2 + 1 == v3 || v2[1] != 80)
      {
        v8 = 0;
      }
      else
      {
        *a1 = v2 + 2;
        v8 = 1;
      }
      if (!v9)
        return 1;
      v10 = v9;
      v12 = *a2;
      *((_BYTE *)v11 + 8) = 27;
      *(_WORD *)((char *)v11 + 9) = *(_WORD *)((_BYTE *)v11 + 9) & 0xF000 | 0x540;
      *v11 = off_1EA94ECA0;
      v11[2] = v12;
      v11[3] = v10;
      *((_BYTE *)v11 + 32) = v8;
      *a2 = (uint64_t)v11;
      v14 = v11;
      v2 = (_BYTE *)*a1;
      v3 = (_BYTE *)a1[1];
      if ((_BYTE *)*a1 == v3)
        return 0;
    }
  }
  return 0;
}

_QWORD *`anonymous namespace'::BumpPointerAllocator::allocate(_anonymous_namespace_::BumpPointerAllocator *this, int a2)
{
  unint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;

  v3 = (a2 + 15) & 0xFFFFFFF0;
  v4 = (_QWORD *)*((_QWORD *)this + 512);
  v5 = v4[1];
  if (v5 + v3 >= 0xFF0)
  {
    if (v3 >= 0xFF1)
    {
      v6 = malloc_type_malloc(v3 + 16, 0x4F7E35AFuLL);
      if (v6)
      {
        v7 = (_QWORD *)*((_QWORD *)this + 512);
        *v6 = *v7;
        v6[1] = 0;
        *v7 = v6;
        return v6 + 2;
      }
LABEL_8:
      std::terminate();
    }
    v4 = malloc_type_malloc(0x1000uLL, 0x6ADE0C5BuLL);
    if (!v4)
      goto LABEL_8;
    v5 = 0;
    *v4 = *((_QWORD *)this + 512);
    v4[1] = 0;
    *((_QWORD *)this + 512) = v4;
  }
  v4[1] = v5 + v3;
  return (_QWORD *)((char *)v4 + v5 + 16);
}

uint64_t `anonymous namespace'::itanium_demangle::Node::hasRHSComponentSlow()
{
  return 0;
}

uint64_t `anonymous namespace'::itanium_demangle::Node::hasArraySlow()
{
  return 0;
}

uint64_t `anonymous namespace'::itanium_demangle::Node::hasFunctionSlow()
{
  return 0;
}

uint64_t `anonymous namespace'::itanium_demangle::SpecialName::printLeft(_QWORD *a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  size_t v4;
  const void *v5;
  uint64_t v6;
  uint64_t result;

  v4 = a1[3];
  if (v4)
  {
    v5 = (const void *)a1[2];
    memcpy((void *)(*(_QWORD *)this + *((_QWORD *)this + 1)), v5, v4);
    *((_QWORD *)this + 1) += v4;
  }
  v6 = a1[4];
  result = (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v6 + 32))(v6, this);
  if ((*(_WORD *)(v6 + 9) & 0xC0) != 0x40)
    return (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v6 + 40))(v6, this);
  return result;
}

uint64_t `anonymous namespace'::itanium_demangle::Node::getBaseName(_anonymous_namespace_::itanium_demangle::Node *this)
{
  return 0;
}

void `anonymous namespace'::itanium_demangle::SpecialName::~SpecialName(_anonymous_namespace_::itanium_demangle::SpecialName *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

uint64_t `anonymous namespace'::itanium_demangle::CtorVtableSpecialName::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  qmemcpy((void *)(*(_QWORD *)this + *((_QWORD *)this + 1)), "construction vtable for ", 24);
  *((_QWORD *)this + 1) += 24;
  v4 = *(_QWORD *)(a1 + 16);
  (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v4 + 32))(v4, this);
  if ((*(_WORD *)(v4 + 9) & 0xC0) != 0x40)
    (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v4 + 40))(v4, this);
  *(_DWORD *)(*(_QWORD *)this + *((_QWORD *)this + 1)) = 762210605;
  *((_QWORD *)this + 1) += 4;
  v5 = *(_QWORD *)(a1 + 24);
  result = (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v5 + 32))(v5, this);
  if ((*(_WORD *)(v5 + 9) & 0xC0) != 0x40)
    return (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v5 + 40))(v5, this);
  return result;
}

void `anonymous namespace'::itanium_demangle::CtorVtableSpecialName::~CtorVtableSpecialName(_anonymous_namespace_::itanium_demangle::CtorVtableSpecialName *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::parseSourceName(uint64_t a1)
{
  char v2;
  _QWORD *result;
  unsigned __int8 *v4;
  unint64_t v5;
  unint64_t v7;

  v7 = 0;
  result = 0;
  if ((v2 & 1) == 0)
  {
    v4 = *(unsigned __int8 **)a1;
    v5 = v7;
    if (v7 - 1 >= *(_QWORD *)(a1 + 8) - *(_QWORD *)a1)
    {
      return 0;
    }
    else
    {
      *(_QWORD *)a1 = &v4[v7];
      if (v5 >= 0xA && *(_QWORD *)v4 == 0x5F4C41424F4C475FLL && *((_WORD *)v4 + 4) == 20063)
      {
        v4 = "(anonymous namespace)";
        v5 = 21;
      }
      *((_BYTE *)result + 8) = 8;
      *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
      *result = off_1EA94EC30;
      result[2] = v4;
      result[3] = v5;
    }
  }
  return result;
}

uint64_t `anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::parsePositiveInteger(unsigned __int8 **a1, uint64_t *a2)
{
  unsigned __int8 *v2;
  unsigned __int8 *v3;
  int v4;
  uint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  int v9;

  *a2 = 0;
  v3 = *a1;
  v2 = a1[1];
  if (v2 == *a1)
    return 1;
  v4 = *v3;
  if ((v4 - 58) < 0xFFFFFFF6)
    return 1;
  if ((v4 - 48) <= 9)
  {
    v6 = 0;
    v7 = v3 + 1;
    do
    {
      v8 = 5 * v6;
      *a2 = 2 * v8;
      *a1 = v7;
      v6 = (char)*(v7 - 1) + 2 * v8 - 48;
      *a2 = v6;
      if (v7 == v2)
        break;
      v9 = *v7++;
    }
    while ((v9 - 48) <= 9);
  }
  return 0;
}

_QWORD *`anonymous namespace'::itanium_demangle::NameType::printLeft(_QWORD *result, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  size_t v2;
  const void *v4;

  v2 = result[3];
  if (v2)
  {
    v4 = (const void *)result[2];
    result = memcpy((void *)(*(_QWORD *)this + *((_QWORD *)this + 1)), v4, v2);
    *((_QWORD *)this + 1) += v2;
  }
  return result;
}

uint64_t `anonymous namespace'::itanium_demangle::NameType::getBaseName(_anonymous_namespace_::itanium_demangle::NameType *this)
{
  return *((_QWORD *)this + 2);
}

void `anonymous namespace'::itanium_demangle::NameType::~NameType(_anonymous_namespace_::itanium_demangle::NameType *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

uint64_t `anonymous namespace'::itanium_demangle::ModuleName::printLeft(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
    goto LABEL_8;
  (*(void (**)(_QWORD, uint64_t *))(*(_QWORD *)v4 + 32))(*(_QWORD *)(a1 + 16), a2);
  if ((*(_WORD *)(v4 + 9) & 0xC0) != 0x40)
    (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v4 + 40))(v4, a2);
  if (*(_QWORD *)(a1 + 16))
  {
    if (*(_BYTE *)(a1 + 32))
      v5 = 58;
    else
      v5 = 46;
  }
  else
  {
LABEL_8:
    if (!*(_BYTE *)(a1 + 32))
      goto LABEL_11;
    v5 = 58;
  }
  v6 = *a2;
  v7 = a2[1];
  a2[1] = v7 + 1;
  *(_BYTE *)(v6 + v7) = v5;
LABEL_11:
  v8 = *(_QWORD *)(a1 + 24);
  result = (*(uint64_t (**)(uint64_t, uint64_t *))(*(_QWORD *)v8 + 32))(v8, a2);
  if ((*(_WORD *)(v8 + 9) & 0xC0) != 0x40)
    return (*(uint64_t (**)(uint64_t, uint64_t *))(*(_QWORD *)v8 + 40))(v8, a2);
  return result;
}

void `anonymous namespace'::itanium_demangle::ModuleName::~ModuleName(_anonymous_namespace_::itanium_demangle::ModuleName *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::parseUnscopedName(_QWORD *a1, _BYTE *a2, _BYTE *a3)
{
  _WORD *v6;
  _WORD *v7;
  _QWORD *v8;
  _QWORD *result;
  uint64_t v10;

  v6 = (_WORD *)*a1;
  v7 = (_WORD *)a1[1];
  if ((unint64_t)v7 - *a1 >= 2 && *v6 == 29779)
  {
    *a1 = v6 + 1;
    v6 = (_WORD *)*a1;
    v7 = (_WORD *)a1[1];
  }
  else
  {
    v8 = 0;
  }
  if (v7 == v6 || *(_BYTE *)v6 != 83)
  {
    v10 = 0;
  }
  if (!result)
    return result;
  v10 = (uint64_t)result;
  if (*((_BYTE *)result + 8) == 27)
  result = 0;
  if (a3)
  {
    if (!v8)
    {
      *a3 = 1;
      return (_QWORD *)v10;
    }
  }
  return result;
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::parseTemplateArgs(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _BYTE *v8;
  _BYTE *v9;
  int v10;
  _BYTE *v12;
  _anonymous_namespace_::BumpPointerAllocator *v13;
  _QWORD *result;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  __int16 v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  _QWORD *v33;
  _QWORD *v34;

  v8 = *(_BYTE **)a1;
  v9 = *(_BYTE **)(a1 + 8);
  if (*(_BYTE **)a1 == v9 || *v8 != 73)
    return 0;
  v10 = a2;
  v12 = v8 + 1;
  *(_QWORD *)a1 = v12;
  if ((_DWORD)a2)
  {
    *(_QWORD *)(a1 + 672) = *(_QWORD *)(a1 + 664);
    v34 = (_QWORD *)(a1 + 576);
    *(_QWORD *)(a1 + 584) = *(_QWORD *)(a1 + 576);
    v12 = *(_BYTE **)a1;
    v9 = *(_BYTE **)(a1 + 8);
  }
  v32 = (uint64_t)(*(_QWORD *)(a1 + 24) - *(_QWORD *)(a1 + 16)) >> 3;
  v13 = (_anonymous_namespace_::BumpPointerAllocator *)(a1 + 808);
  do
  {
    if (v12 != v9 && *v12 == 69)
    {
      v28 = 0;
LABEL_39:
      *(_QWORD *)a1 = v12 + 1;
      v31 = v30;
      *((_BYTE *)result + 8) = 43;
      *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
      *result = off_1EA950AC0;
      result[2] = v29;
      result[3] = v31;
      result[4] = v28;
      return result;
    }
    if (v10)
    {
      v34 = result;
      if (!result)
        return result;
      v15 = (uint64_t)result;
      v33 = (_QWORD *)v15;
      v16 = *(unsigned __int8 *)(v15 + 8);
      if (v16 == 41)
      {
        v17 = *(_QWORD *)(v15 + 16);
        v18 = *(_QWORD *)(v15 + 24);
        *((_BYTE *)v19 + 8) = 40;
        v20 = *(_WORD *)((_BYTE *)v19 + 9) & 0xF000;
        *v19 = off_1EA950A50;
        v19[2] = v17;
        v19[3] = v18;
        v21 = v20 | 0xA80;
        *(_WORD *)((char *)v19 + 9) = v20 | 0xA80;
        v22 = 8 * v18;
        if (v18)
        {
          v23 = 8 * v18;
          v24 = v17;
          while ((*(_WORD *)(*(_QWORD *)v24 + 9) & 0x300) == 0x100)
          {
            v24 += 8;
            v23 -= 8;
            if (!v23)
              goto LABEL_19;
          }
        }
        else
        {
LABEL_19:
          v21 = v20 | 0x980;
          *(_WORD *)((char *)v19 + 9) = v20 | 0x980;
        }
        if (v18)
        {
          v25 = 8 * v18;
          v26 = v17;
          while ((*(_WORD *)(*(_QWORD *)v26 + 9) & 0xC00) == 0x400)
          {
            v26 += 8;
            v25 -= 8;
            if (!v25)
              goto LABEL_24;
          }
        }
        else
        {
LABEL_24:
          v21 = v21 & 0xF3FF | 0x400;
          *(_WORD *)((char *)v19 + 9) = v21;
        }
        if (v18)
        {
          while ((*(_WORD *)(*(_QWORD *)v17 + 9) & 0xC0) == 0x40)
          {
            v17 += 8;
            v22 -= 8;
            if (!v22)
              goto LABEL_28;
          }
        }
        else
        {
LABEL_28:
          *(_WORD *)((char *)v19 + 9) = v21 & 0xFF3F | 0x40;
        }
        v33 = v19;
      }
      else if (v16 == 34)
      {
        v33 = *(_QWORD **)(v15 + 24);
      }
    }
    else
    {
      v34 = result;
      if (!result)
        return result;
    }
    v12 = *(_BYTE **)a1;
    v9 = *(_BYTE **)(a1 + 8);
  }
  while (*(_BYTE **)a1 == v9 || *v12 != 81);
  *(_QWORD *)a1 = v12 + 1;
  v27 = *(_BYTE *)(a1 + 778);
  *(_BYTE *)(a1 + 778) = 1;
  *(_BYTE *)(a1 + 778) = v27;
  if (v28)
  {
    v12 = *(_BYTE **)a1;
    if (*(_QWORD *)a1 != *(_QWORD *)(a1 + 8) && *v12 == 69)
      goto LABEL_39;
  }
  return 0;
}

void sub_1DED553B4(_Unwind_Exception *a1)
{
  uint64_t v1;
  char v2;

  *(_BYTE *)(v1 + 778) = v2;
  _Unwind_Resume(a1);
}

uint64_t `anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::parseCVQualifiers(uint64_t a1)
{
  _BYTE *v1;
  _BYTE *v2;
  uint64_t v3;

  v1 = *(_BYTE **)a1;
  v2 = *(_BYTE **)(a1 + 8);
  if (*(_BYTE **)a1 == v2 || *v1 != 114)
  {
    v3 = 0;
  }
  else
  {
    *(_QWORD *)a1 = ++v1;
    v3 = 4;
  }
  if (v1 != v2)
  {
    if (*v1 == 86)
    {
      *(_QWORD *)a1 = ++v1;
      v3 = v3 | 2;
    }
    if (v1 != v2 && *v1 == 75)
    {
      *(_QWORD *)a1 = v1 + 1;
      return v3 | 1;
    }
  }
  return v3;
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::parseTemplateParam(uint64_t a1)
{
  unsigned __int8 *v1;
  unsigned __int8 *v2;
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  unint64_t v6;
  unint64_t v7;
  int64_t v8;
  _QWORD *v9;
  char *v11;
  _BYTE *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  char *v21;
  _BYTE *v22;
  _BYTE *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v2 = *(unsigned __int8 **)a1;
  v1 = *(unsigned __int8 **)(a1 + 8);
  if (*(unsigned __int8 **)a1 == v1 || *v2 != 84)
    return 0;
  v4 = v2 + 1;
  *(_QWORD *)a1 = v2 + 1;
  v26 = 0;
  if (v2 + 1 == v1)
  {
    v6 = 0;
    v25 = 0;
  }
  else
  {
    if (*v4 == 76)
    {
      *(_QWORD *)a1 = v2 + 2;
      v5 = *(unsigned __int8 **)a1;
      v1 = *(unsigned __int8 **)(a1 + 8);
      if (*(unsigned __int8 **)a1 == v1 || *v5 != 95)
        return 0;
      v6 = v26 + 1;
      v4 = v5 + 1;
      *(_QWORD *)a1 = v4;
    }
    else
    {
      v6 = 0;
    }
    v25 = 0;
    if (v4 != v1 && *v4 == 95)
    {
      v7 = 0;
      goto LABEL_18;
    }
  }
  v4 = *(unsigned __int8 **)a1;
  if (*(_QWORD *)a1 == *(_QWORD *)(a1 + 8) || *v4 != 95)
    return 0;
  v7 = v25 + 1;
LABEL_18:
  *(_QWORD *)a1 = v4 + 1;
  if (*(_BYTE *)(a1 + 778))
  {
    v8 = v4 - v2;
    *((_BYTE *)v9 + 8) = 8;
    *(_WORD *)((char *)v9 + 9) = *(_WORD *)((_BYTE *)v9 + 9) & 0xF000 | 0x540;
    *v9 = off_1EA94EC30;
    v9[2] = v2;
    v9[3] = v8;
    return v9;
  }
  if (*(_BYTE *)(a1 + 777) && !v6)
  {
    *((_BYTE *)v9 + 8) = 44;
    *(_WORD *)((char *)v9 + 9) = *(_WORD *)((_BYTE *)v9 + 9) & 0xF000 | 0xA80;
    *v9 = off_1EA94ED10;
    v9[2] = v7;
    v9[3] = 0;
    *((_BYTE *)v9 + 32) = 0;
    v11 = *(char **)(a1 + 728);
    if (v11 == *(char **)(a1 + 736))
    {
      v12 = *(_BYTE **)(a1 + 720);
      v13 = v11 - v12;
      if (v12 == (_BYTE *)(a1 + 744))
      {
        v21 = (char *)malloc_type_malloc(2 * v13, 0x2004093837F09uLL);
        if (!v21)
          goto LABEL_43;
        v14 = v21;
        v22 = *(_BYTE **)(a1 + 720);
        v23 = *(_BYTE **)(a1 + 728);
        if (v23 != v22)
          memmove(v21, v22, v23 - v22);
        *(_QWORD *)(a1 + 720) = v14;
      }
      else
      {
        v14 = (char *)malloc_type_realloc(v12, 2 * (v11 - v12), 0x2004093837F09uLL);
        *(_QWORD *)(a1 + 720) = v14;
        if (!v14)
LABEL_43:
          abort();
      }
      v11 = &v14[8 * (v13 >> 3)];
      *(_QWORD *)(a1 + 736) = &v14[8 * (v13 >> 2)];
    }
    *(_QWORD *)(a1 + 728) = v11 + 8;
    *(_QWORD *)v11 = v9;
    return v9;
  }
  v15 = *(_QWORD *)(a1 + 664);
  v16 = *(_QWORD *)(a1 + 672) - v15;
  if (v6 < v16 >> 3)
  {
    v17 = *(_QWORD **)(v15 + 8 * v6);
    if (v17)
    {
      v19 = v17;
      v18 = *v17;
      if (v7 < (v19[1] - v18) >> 3)
        return *(_QWORD **)(v18 + 8 * v7);
    }
  }
  v9 = 0;
  v20 = v16 >> 3;
  if (v6 <= v20 && *(_QWORD *)(a1 + 784) == v6)
  {
    if (v6 == v20)
    {
      v24 = 0;
    }
  }
  return v9;
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::parseDecltype(uint64_t a1)
{
  _BYTE *v1;
  _BYTE *v2;
  _QWORD *result;
  _BYTE *v5;
  _QWORD *v6;

  v1 = *(_BYTE **)a1;
  v2 = *(_BYTE **)(a1 + 8);
  if (*(_BYTE **)a1 == v2)
    return 0;
  if (*v1 != 68)
    return 0;
  *(_QWORD *)a1 = v1 + 1;
  if (v1 + 1 == v2 || (v1[1] | 0x20) != 0x74)
    return 0;
  *(_QWORD *)a1 = v1 + 2;
  if (!result)
    return result;
  v5 = *(_BYTE **)a1;
  if (*(_QWORD *)a1 == *(_QWORD *)(a1 + 8) || *v5 != 69)
    return 0;
  v6 = result;
  *(_QWORD *)a1 = v5 + 1;
  *((_BYTE *)result + 8) = 60;
  *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
  *result = off_1EA94F630;
  result[2] = "decltype";
  result[3] = 8;
  result[5] = 0;
  result[6] = 0;
  result[4] = v6;
  return result;
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::make<`anonymous namespace'::itanium_demangle::NameType,char const(&)[4]>(uint64_t a1, const char *a2)
{
  _QWORD *v3;
  size_t v4;

  v4 = strlen(a2);
  *((_BYTE *)v3 + 8) = 8;
  *(_WORD *)((char *)v3 + 9) = *(_WORD *)((_BYTE *)v3 + 9) & 0xF000 | 0x540;
  *v3 = off_1EA94EC30;
  v3[2] = a2;
  v3[3] = v4;
  return v3;
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::parseSubstitution(uint64_t a1)
{
  unsigned __int8 *v1;
  unsigned __int8 *v2;
  unsigned int v4;
  _QWORD *v5;
  int v6;
  uint64_t v7;
  unsigned __int8 *v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;

  v1 = *(unsigned __int8 **)a1;
  v2 = *(unsigned __int8 **)(a1 + 8);
  if (*(unsigned __int8 **)a1 == v2 || *v1 != 83)
    return 0;
  *(_QWORD *)a1 = v1 + 1;
  if (v2 == v1 + 1)
    goto LABEL_11;
  v4 = v1[1];
  if ((char)v1[1] < 97)
  {
    if (v4 == 95)
    {
      *(_QWORD *)a1 = v1 + 2;
      v7 = *(_QWORD *)(a1 + 296);
      if (v7 != *(_QWORD *)(a1 + 304))
        return *(_QWORD **)v7;
      return 0;
    }
LABEL_11:
    v14 = 0;
    v5 = 0;
    v8 = *(unsigned __int8 **)a1;
    if (*(_QWORD *)a1 != *(_QWORD *)(a1 + 8) && *v8 == 95)
    {
      v9 = (unint64_t)v14 + 1;
      *(_QWORD *)a1 = v8 + 1;
      v10 = *(_QWORD *)(a1 + 296);
      if (v9 < (*(_QWORD *)(a1 + 304) - v10) >> 3)
        return *(_QWORD **)(v10 + 8 * v9);
    }
    return 0;
  }
  if (v4 > 0x7A)
    goto LABEL_11;
  v5 = 0;
  v6 = 0;
  switch(v1[1])
  {
    case 'a':
      goto LABEL_24;
    case 'b':
      v6 = 1;
      goto LABEL_24;
    case 'c':
    case 'e':
    case 'f':
    case 'g':
    case 'h':
      return v5;
    case 'd':
      v6 = 5;
      goto LABEL_24;
    case 'i':
      v6 = 3;
      goto LABEL_24;
    default:
      if (v4 == 111)
      {
        v6 = 4;
      }
      else
      {
        if (v4 != 115)
          return v5;
        v6 = 2;
      }
LABEL_24:
      *(_QWORD *)a1 = v1 + 2;
      *((_BYTE *)v5 + 8) = 48;
      *(_WORD *)((char *)v5 + 9) = *(_WORD *)((_BYTE *)v5 + 9) & 0xF000 | 0x540;
      *((_DWORD *)v5 + 3) = v6;
      *v5 = off_1EA950660;
      v14 = v12;
      if (v12 != v5)
      {
        v13 = v12;
        v5 = v13;
      }
      break;
  }
  return v5;
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::parseUnqualifiedName(uint64_t a1, _BYTE *a2, _QWORD *a3, uint64_t a4)
{
  _QWORD *v7;
  char *v8;
  unsigned __int8 *v9;
  char v10;
  unint64_t v11;
  unsigned int v12;
  _QWORD *v13;
  char v14;
  _QWORD *v15;
  int v16;
  int v17;
  unsigned __int8 *v18;
  int v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  char v24;
  _QWORD *v25;
  uint64_t (**v26)();
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int v41;
  unsigned int v42;
  _QWORD *v43;
  int v44;
  _QWORD *v45;
  uint64_t v46;

  v46 = a4;
  v8 = *(char **)a1;
  v9 = *(unsigned __int8 **)(a1 + 8);
  if (!a3)
    goto LABEL_7;
  if (v8 == (char *)v9)
  {
    v11 = 0;
    v14 = 1;
    v9 = *(unsigned __int8 **)a1;
    v10 = 1;
    goto LABEL_21;
  }
  if (*v8 == 70)
  {
    v10 = 0;
    *(_QWORD *)a1 = ++v8;
  }
  else
  {
LABEL_7:
    v10 = 1;
  }
  if (v8 == (char *)v9)
  {
    v11 = 0;
    v14 = 1;
    v8 = (char *)v9;
  }
  else
  {
    if (*v8 == 76)
      *(_QWORD *)a1 = ++v8;
    v11 = v9 - (unsigned __int8 *)v8;
    if (v9 == (unsigned __int8 *)v8)
    {
      v14 = 1;
    }
    else
    {
      if (*v8 >= 49)
      {
        v12 = *v8;
        if (v12 <= 0x39)
        {
LABEL_35:
          v20 = v13;
          goto LABEL_36;
        }
        if (v12 == 85)
        {
          goto LABEL_35;
        }
      }
      v14 = 0;
    }
  }
LABEL_21:
  if (v11 >= 2 && *(_WORD *)v8 == 17220)
  {
    *(_QWORD *)a1 = v8 + 2;
    v28 = *(_QWORD *)(a1 + 16);
    v29 = *(_QWORD *)(a1 + 24);
    if (!v45)
      return 0;
    v30 = (v29 - v28) >> 3;
    while (1)
    {
      v37 = *(char **)a1;
      if (*(_QWORD *)a1 != *(_QWORD *)(a1 + 8) && *v37 == 69)
        break;
      if (!v45)
        return 0;
    }
    *(_QWORD *)a1 = v37 + 1;
    v40 = v39;
    *((_BYTE *)v20 + 8) = 53;
    *(_WORD *)((char *)v20 + 9) = *(_WORD *)((_BYTE *)v20 + 9) & 0xF000 | 0x540;
    *v20 = off_1EA9507B0;
    v20[2] = v38;
    v20[3] = v40;
  }
  else
  {
    if ((v14 & 1) != 0 || *v8 - 67 > 1)
    {
      goto LABEL_35;
    }
    v7 = 0;
    if (!a3 || v46)
      return v7;
    if (*((_BYTE *)a3 + 8) == 48)
    {
      v16 = *((_DWORD *)a3 + 3);
      *((_BYTE *)v15 + 8) = 47;
      *(_WORD *)((char *)v15 + 9) = *(_WORD *)((_BYTE *)v15 + 9) & 0xF000 | 0x540;
      *v15 = off_1EA9506E8;
      *((_DWORD *)v15 + 3) = v16;
      v8 = *(char **)a1;
      v9 = *(unsigned __int8 **)(a1 + 8);
      a3 = v15;
    }
    if (v8 == (char *)v9)
      return 0;
    v17 = *v8;
    if (v17 == 67)
    {
      v18 = (unsigned __int8 *)(v8 + 1);
      *(_QWORD *)a1 = v8 + 1;
      if (v8 + 1 == (char *)v9)
      {
        v19 = 0;
        v18 = v9;
      }
      else if (*v18 == 73)
      {
        v18 = (unsigned __int8 *)(v8 + 2);
        *(_QWORD *)a1 = v8 + 2;
        v19 = 1;
      }
      else
      {
        v19 = 0;
      }
      if (v9 == v18)
        return 0;
      v44 = *v18;
      if ((v44 - 49) > 4)
        return 0;
      *(_QWORD *)a1 = v18 + 1;
      if (a2)
        *a2 = 1;
      if (v19
      {
        return 0;
      }
      v42 = v44 - 48;
      v20 = v43;
      *((_BYTE *)v43 + 8) = 49;
      *(_WORD *)((char *)v43 + 9) = *(_WORD *)((_BYTE *)v43 + 9) & 0xF000 | 0x540;
      *v43 = off_1EA950820;
      v43[2] = a3;
      *((_BYTE *)v43 + 24) = 0;
    }
    else
    {
      v7 = 0;
      if ((unint64_t)(v9 - (unsigned __int8 *)v8) < 2)
        return v7;
      if (v17 != 68)
        return v7;
      v7 = 0;
      v41 = v8[1];
      if (v41 > 0x35 || ((1 << v41) & 0x37000000000000) == 0)
        return v7;
      v42 = v41 - 48;
      *(_QWORD *)a1 = v8 + 2;
      if (a2)
        *a2 = 1;
      v20 = v43;
      *((_BYTE *)v43 + 8) = 49;
      *(_WORD *)((char *)v43 + 9) = *(_WORD *)((_BYTE *)v43 + 9) & 0xF000 | 0x540;
      *v43 = off_1EA950820;
      v43[2] = a3;
      *((_BYTE *)v43 + 24) = 1;
    }
    *((_DWORD *)v43 + 7) = v42;
  }
LABEL_36:
  if (!v20 || (v21 = v46) == 0)
  {
    if (v20)
      goto LABEL_40;
    return 0;
  }
  *((_BYTE *)v22 + 8) = 28;
  *(_WORD *)((char *)v22 + 9) = *(_WORD *)((_BYTE *)v22 + 9) & 0xF000 | 0x540;
  *v22 = off_1EA950890;
  v22[2] = v21;
  v22[3] = v20;
  v20 = v22;
LABEL_40:
  v7 = v23;
  if (v23)
    v24 = v10;
  else
    v24 = 1;
  if ((v24 & 1) == 0)
  {
    *((_BYTE *)v25 + 8) = 25;
    *(_WORD *)((char *)v25 + 9) = *(_WORD *)((_BYTE *)v25 + 9) & 0xF000 | 0x540;
    v26 = off_1EA950900;
    goto LABEL_48;
  }
  if (a3 && v23)
  {
    *((_BYTE *)v25 + 8) = 24;
    *(_WORD *)((char *)v25 + 9) = *(_WORD *)((_BYTE *)v25 + 9) & 0xF000 | 0x540;
    v26 = off_1EA950970;
LABEL_48:
    *v25 = v26;
    v25[2] = a3;
    v25[3] = v7;
    return v25;
  }
  return v7;
}

const void **`anonymous namespace'::itanium_demangle::PODSmallVector<`anonymous namespace'::itanium_demangle::PODSmallVector<`anonymous namespace'::itanium_demangle::Node *,8ul> *,4ul>::push_back(const void **result, uint64_t *size)
{
  const void **v3;
  char *v4;
  void *v5;
  uint64_t v6;
  const void **v7;
  _BYTE *v8;
  uint64_t v9;

  v3 = result;
  v4 = (char *)result[1];
  if (v4 == result[2])
  {
    v5 = (void *)*result;
    v6 = v4 - (_BYTE *)*v3;
    if (*v3 == v3 + 3)
    {
      result = (const void **)malloc_type_malloc(2 * v6, 0x2004093837F09uLL);
      if (!result)
        goto LABEL_11;
      v7 = result;
      v8 = v3[1];
      if (v8 != *v3)
        result = (const void **)memmove(result, *v3, v8 - (_BYTE *)*v3);
      *v3 = v7;
    }
    else
    {
      result = (const void **)malloc_type_realloc(v5, 2 * v6, 0x2004093837F09uLL);
      v7 = result;
      *v3 = result;
      if (!result)
LABEL_11:
        abort();
    }
    v4 = (char *)&v7[v6 >> 3];
    v3[1] = v4;
    v3[2] = &v7[v6 >> 2];
  }
  v9 = *size;
  v3[1] = v4 + 8;
  *(_QWORD *)v4 = v9;
  return result;
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::make<`anonymous namespace'::itanium_demangle::NameType,char const(&)[5]>(uint64_t a1, const char *a2)
{
  _QWORD *v3;
  size_t v4;

  v4 = strlen(a2);
  *((_BYTE *)v3 + 8) = 8;
  *(_WORD *)((char *)v3 + 9) = *(_WORD *)((_BYTE *)v3 + 9) & 0xF000 | 0x540;
  *v3 = off_1EA94EC30;
  v3[2] = a2;
  v3[3] = v4;
  return v3;
}

uint64_t `anonymous namespace'::itanium_demangle::ForwardTemplateReference::hasRHSComponentSlow(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  unsigned int v4;

  if (*(_BYTE *)(a1 + 32))
    return 0;
  *(_BYTE *)(a1 + 32) = 1;
  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(unsigned __int8 *)(v3 + 9);
  if ((v4 & 0xC0) == 0x80)
    result = (**(uint64_t (***)(uint64_t))v3)(v3);
  else
    result = v4 < 0x40;
  *(_BYTE *)(a1 + 32) = 0;
  return result;
}

void sub_1DED56088(_Unwind_Exception *a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 32) = 0;
  _Unwind_Resume(a1);
}

uint64_t `anonymous namespace'::itanium_demangle::ForwardTemplateReference::hasArraySlow(uint64_t a1)
{
  uint64_t result;
  _BYTE *v3;
  int v4;

  if (*(_BYTE *)(a1 + 32))
    return 0;
  *(_BYTE *)(a1 + 32) = 1;
  v3 = *(_BYTE **)(a1 + 24);
  v4 = v3[10] & 3;
  if (v4 == 2)
    result = (*(uint64_t (**)(_BYTE *))(*(_QWORD *)v3 + 8))(v3);
  else
    result = v4 == 0;
  *(_BYTE *)(a1 + 32) = 0;
  return result;
}

void sub_1DED560F4(_Unwind_Exception *a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 32) = 0;
  _Unwind_Resume(a1);
}

uint64_t `anonymous namespace'::itanium_demangle::ForwardTemplateReference::hasFunctionSlow(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  int v4;

  if (*(_BYTE *)(a1 + 32))
    return 0;
  *(_BYTE *)(a1 + 32) = 1;
  v3 = *(_QWORD *)(a1 + 24);
  v4 = (*(unsigned __int16 *)(v3 + 9) >> 10) & 3;
  if (v4 == 2)
    result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 16))(v3);
  else
    result = v4 == 0;
  *(_BYTE *)(a1 + 32) = 0;
  return result;
}

void sub_1DED56160(_Unwind_Exception *a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 32) = 0;
  _Unwind_Resume(a1);
}

uint64_t `anonymous namespace'::itanium_demangle::ForwardTemplateReference::getSyntaxNode(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = a1;
  if (!*(_BYTE *)(a1 + 32))
  {
    *(_BYTE *)(a1 + 32) = 1;
    v2 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 24) + 24))(*(_QWORD *)(a1 + 24));
    *(_BYTE *)(v1 + 32) = 0;
    return v2;
  }
  return v1;
}

void sub_1DED561B0(_Unwind_Exception *a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 32) = 0;
  _Unwind_Resume(a1);
}

uint64_t `anonymous namespace'::itanium_demangle::ForwardTemplateReference::printLeft(uint64_t result)
{
  uint64_t v1;

  if (!*(_BYTE *)(result + 32))
  {
    v1 = result;
    *(_BYTE *)(result + 32) = 1;
    result = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(result + 24) + 32))(*(_QWORD *)(result + 24));
    *(_BYTE *)(v1 + 32) = 0;
  }
  return result;
}

void sub_1DED561F8(_Unwind_Exception *a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 32) = 0;
  _Unwind_Resume(a1);
}

uint64_t `anonymous namespace'::itanium_demangle::ForwardTemplateReference::printRight(uint64_t result)
{
  uint64_t v1;

  if (!*(_BYTE *)(result + 32))
  {
    v1 = result;
    *(_BYTE *)(result + 32) = 1;
    result = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(result + 24) + 40))(*(_QWORD *)(result + 24));
    *(_BYTE *)(v1 + 32) = 0;
  }
  return result;
}

void sub_1DED56240(_Unwind_Exception *a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 32) = 0;
  _Unwind_Resume(a1);
}

void `anonymous namespace'::itanium_demangle::ForwardTemplateReference::~ForwardTemplateReference(_anonymous_namespace_::itanium_demangle::ForwardTemplateReference *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

void `anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::parseExpr(uint64_t a1)
{
  unsigned __int8 *v2;
  int v3;
  unsigned __int8 *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 *v11;
  uint64_t v12;
  unsigned __int8 *v13;
  char *v14;
  unint64_t v15;
  int v16;
  char *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned __int8 *v27;
  unint64_t v28;
  unsigned __int8 *v29;
  int v30;
  int v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  int v36;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t (**v40)();
  unsigned __int8 *v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unsigned __int8 *v57;
  const char *Symbol;
  uint64_t v59;
  uint64_t v60;
  _QWORD *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  unsigned __int8 *v71;
  _QWORD *v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD *v75;
  uint64_t v76;
  unsigned __int8 *v77;
  _QWORD *v78;
  _QWORD *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unsigned __int8 *v88;
  _QWORD *v89;
  uint64_t v90;
  uint64_t v91;
  _QWORD *v92;
  unint64_t v93;
  unsigned __int8 *v94;
  int v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98[2];
  char v99;
  uint64_t v100;
  __n128 v101;

  v2 = *(unsigned __int8 **)a1;
  if (*(_QWORD *)(a1 + 8) - *(_QWORD *)a1 >= 2uLL && *(_WORD *)v2 == 29543)
  {
    *(_QWORD *)a1 = v2 + 2;
    v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  v99 = v3;
  if (v4)
  {
    v11 = v4;
    v98[1] = v12;
    __asm { BR              X10 }
  }
  v13 = *(unsigned __int8 **)a1;
  v14 = *(char **)(a1 + 8);
  v15 = (unint64_t)&v14[-*(_QWORD *)a1];
  if (v15 < 2)
    return;
  v16 = *v13;
  switch(v16)
  {
    case 'f':
      v17 = (char *)(v13 + 1);
      v18 = v13[1];
      if (v18 != 112)
      {
        if (v18 != 76)
          goto LABEL_36;
        if (v15 < 3)
        {
          v19 = 0;
        }
        else
        {
          if ((char)v13[2] < 0)
            goto LABEL_36;
          v19 = v13[2];
        }
        if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v19 + 60) & 0x400) == 0)
        {
LABEL_36:
          if (v13 != (unsigned __int8 *)v14)
          {
            *(_QWORD *)a1 = v17;
            if (v14 != v17)
            {
              v30 = *v17;
              if (v30 > 107)
              {
                if (v30 == 108)
                {
                  v36 = 0;
                  v31 = 1;
                }
                else
                {
                  if (v30 != 114)
                    return;
                  v31 = 0;
                  v36 = 0;
                }
              }
              else
              {
                if (v30 == 76)
                {
                  v31 = 1;
                }
                else
                {
                  if (v30 != 82)
                    return;
                  v31 = 0;
                }
                v36 = 1;
              }
              *(_QWORD *)a1 = v13 + 2;
              if (v41)
              {
                v42 = (uint64_t)v41;
                v43 = v41[2];
                if (v43 == 2
                  || v43 == 4 && *(_BYTE *)(strlen(*((const char **)v41 + 1)) + *((_QWORD *)v41 + 1) - 1) == 42)
                {
                  if (v44)
                  {
                    v45 = v44;
                    if (v36)
                    {
                      if (!v46)
                        return;
                      if (v31)
                        v47 = v45;
                      else
                        v47 = v46;
                      if (v31)
                        v45 = v46;
                    }
                    else
                    {
                      v47 = 0;
                    }
                    v60 = v59;
                    *((_BYTE *)v61 + 8) = 71;
                    *(_WORD *)((char *)v61 + 9) = *(_WORD *)((_BYTE *)v61 + 9) & 0xF000 | 0x540;
                    *v61 = off_1EA94FE10;
                    v61[2] = v45;
                    v61[3] = v47;
                    v61[4] = Symbol;
                    v61[5] = v60;
                    *((_BYTE *)v61 + 48) = v31;
                    return;
                  }
                }
              }
            }
          }
          return;
        }
      }
      return;
    case 'T':
      return;
    case 'L':
      return;
  }
  if (*(_WORD *)v13 == 27753)
  {
    v27 = v13 + 2;
    *(_QWORD *)a1 = v27;
    v28 = (uint64_t)(*(_QWORD *)(a1 + 24) - *(_QWORD *)(a1 + 16)) >> 3;
    while (v27 == (unsigned __int8 *)v14 || *v27 != 69)
    {
      if (!v101.n128_u64[0])
        return;
      v27 = *(unsigned __int8 **)a1;
      v14 = *(char **)(a1 + 8);
    }
    *(_QWORD *)a1 = v27 + 1;
    v34 = v33;
    *((_BYTE *)v35 + 8) = 70;
    *(_WORD *)((char *)v35 + 9) = *(_WORD *)((_BYTE *)v35 + 9) & 0xF000 | 0x540;
    *v35 = off_1EA94FFD0;
    v35[2] = 0;
    v35[3] = v32;
    v35[4] = v34;
  }
  else
  {
    if (*(_WORD *)v13 == 25453)
    {
      *(_QWORD *)a1 = v13 + 2;
      return;
    }
    {
      if (v101.n128_u64[0])
      {
        LODWORD(v98[0]) = 2;
      }
      return;
    }
    v29 = *(unsigned __int8 **)a1;
    if (*(_QWORD *)(a1 + 8) - *(_QWORD *)a1 >= 2uLL && *v29 == 114 && (v29[1] | 0x20) == 0x71)
    {
      return;
    }
    {
      return;
    }
    {
      if (!v37)
        return;
      v38 = (_QWORD *)v37;
      *((_BYTE *)v39 + 8) = 42;
      *(_WORD *)((char *)v39 + 9) = *(_WORD *)((_BYTE *)v39 + 9) & 0xF000 | 0x540;
      v40 = off_1EA94FE80;
      goto LABEL_52;
    }
    {
      if (*(_QWORD *)(a1 + 8) != *(_QWORD *)a1 && **(_BYTE **)a1 == 84)
      {
        if (!v48)
          return;
        v38 = v48;
        *((_BYTE *)v39 + 8) = 62;
        *(_WORD *)((char *)v39 + 9) = *(_WORD *)((_BYTE *)v39 + 9) & 0xF000 | 0x540;
        v40 = off_1EA9502E0;
        goto LABEL_52;
      }
      if (!v101.n128_u64[0])
        return;
LABEL_94:
      return;
    }
    {
      v56 = (uint64_t)(*(_QWORD *)(a1 + 24) - *(_QWORD *)(a1 + 16)) >> 3;
      while (1)
      {
        v57 = *(unsigned __int8 **)a1;
        if (*(_QWORD *)a1 != *(_QWORD *)(a1 + 8) && *v57 == 69)
          break;
        if (!v101.n128_u64[0])
          return;
      }
      *(_QWORD *)a1 = v57 + 1;
      v74 = v73;
      *((_BYTE *)v75 + 8) = 0;
      *(_WORD *)((char *)v75 + 9) = *(_WORD *)((_BYTE *)v75 + 9) & 0xF000 | 0x540;
      *v75 = off_1EA950350;
      v75[2] = v72;
      v75[3] = v74;
      v101.n128_u64[0] = (unint64_t)v75;
      goto LABEL_94;
    }
    {
      if (v62)
      {
        v69 = v62;
        v70 = (uint64_t)(*(_QWORD *)(a1 + 24) - *(_QWORD *)(a1 + 16)) >> 3;
        while (1)
        {
          v71 = *(unsigned __int8 **)a1;
          if (*(_QWORD *)a1 != *(_QWORD *)(a1 + 8) && *v71 == 69)
            break;
          if (!v101.n128_u64[0])
            return;
        }
        *(_QWORD *)a1 = v71 + 1;
        v91 = v90;
        *((_BYTE *)v92 + 8) = 70;
        *(_WORD *)((char *)v92 + 9) = *(_WORD *)((_BYTE *)v92 + 9) & 0xF000 | 0x540;
        *v92 = off_1EA94FFD0;
        v92[2] = v69;
        v92[3] = v89;
        v92[4] = v91;
      }
      return;
    }
    {
      return;
    }
    {
      if (!v76)
        return;
      v38 = (_QWORD *)v76;
      *((_BYTE *)v39 + 8) = 72;
      *(_WORD *)((char *)v39 + 9) = *(_WORD *)((_BYTE *)v39 + 9) & 0xF000 | 0x540;
      v40 = off_1EA9503C0;
LABEL_52:
      *v39 = v40;
      v39[2] = v38;
      return;
    }
    v77 = *(unsigned __int8 **)a1;
    if (*(_QWORD *)a1 == *(_QWORD *)(a1 + 8) || *v77 != 117)
    {
      return;
    }
    *(_QWORD *)a1 = v77 + 1;
    v98[0] = (uint64_t)v78;
    if (v78)
    {
      v79 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v78 + 48))(v78);
      if (v80 == 8 && *v79 == 0x666F646975755F5FLL)
      {
        v94 = *(unsigned __int8 **)a1;
        if (*(_QWORD *)a1 != *(_QWORD *)(a1 + 8))
        {
          v95 = *v94;
          if (v95 == 122)
          {
            *(_QWORD *)a1 = v94 + 1;
            goto LABEL_117;
          }
          if (v95 == 116)
          {
            *(_QWORD *)a1 = v94 + 1;
LABEL_117:
            v97 = v96;
            if (!v96)
              return;
            v87 = *(_QWORD *)(a1 + 24) - *(_QWORD *)(a1 + 16);
LABEL_111:
            v101.n128_u64[1] = v93;
            LODWORD(v100) = 1;
            return;
          }
        }
      }
      v87 = *(_QWORD *)(a1 + 24) - *(_QWORD *)(a1 + 16);
      while (1)
      {
        v88 = *(unsigned __int8 **)a1;
        if (*(_QWORD *)a1 != *(_QWORD *)(a1 + 8) && *v88 == 69)
          break;
        if (!v101.n128_u64[0])
          return;
      }
      *(_QWORD *)a1 = v88 + 1;
      goto LABEL_111;
    }
  }
}

void sub_1DED570F8(_Unwind_Exception *a1)
{
  uint64_t v1;
  char v2;

  *(_BYTE *)(v1 + 776) = v2;
  _Unwind_Resume(a1);
}

unsigned __int8 *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::parseOperatorEncoding(unsigned __int8 **a1)
{
  unsigned __int8 *v1;
  unint64_t v2;
  int v3;
  uint64_t v4;
  unint64_t v5;
  char *v6;
  unsigned __int8 *v7;

  v1 = *a1;
  if ((unint64_t)(a1[1] - *a1) < 2)
    return 0;
  v2 = 0;
  v3 = *v1;
  v4 = 61;
  do
  {
    v5 = (v4 + v2) >> 1;
       + 16 * v5;
    if (*v6 >= (char)v3)
    {
      if (*v6 == v3)
      {
        if (v6[1] >= (char)v1[1])
          v4 = (v4 + v2) >> 1;
        else
          v2 = v5 + 1;
      }
      else
      {
        v4 = (v4 + v2) >> 1;
      }
    }
    else
    {
      v2 = v5 + 1;
    }
  }
  while (v4 != v2);
     + 16 * v2;
  if (*v7 != v3 || v7[1] != v1[1])
    return 0;
  *a1 = v1 + 2;
  return v7;
}

const char *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::OperatorInfo::getSymbol(uint64_t a1)
{
  const char *v2;
  size_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  size_t v10;
  const char *result;

  v2 = *(const char **)(a1 + 8);
  v3 = strlen(v2);
  v10 = v3;
  if (*(unsigned __int8 *)(a1 + 2) > 0xAu)
    return v2;
  if (v3 < 8 || *(_QWORD *)v2 != 0x726F74617265706FLL)
    abort_message("%s:%d: %s", v3, v4, v5, v6, v7, v8, v9, (char)"/Library/Caches/com.apple.xbs/Sources/libcxx_os/libcxxabi/src/demangle/ItaniumDemangle.h");
  result = v2 + 8;
  if (v10 != 8 && *result == 32)
    return v2 + 9;
  return result;
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::parsePrefixExpr(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *result;
  _QWORD *v9;

  if (result)
  {
    v9 = result;
    *((_BYTE *)result + 8) = 66;
    *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | a4 & 0x3F | 0x540;
    *result = off_1EA94F1D0;
    result[2] = a2;
    result[3] = a3;
    result[4] = v9;
  }
  return result;
}

__n128 `anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::make<`anonymous namespace'::itanium_demangle::MemberExpr,`anonymous namespace'::itanium_demangle::Node *&,std::string_view &,`anonymous namespace'::itanium_demangle::Node *&,`anonymous namespace'::itanium_demangle::Node::Prec>(uint64_t a1, uint64_t *a2, __n128 *a3, uint64_t *a4, _WORD *a5)
{
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  __int16 v13;
  __n128 result;

  v10 = *a2;
  v11 = *a4;
  v12 = *a5;
  *((_BYTE *)v9 + 8) = 58;
  v13 = *(_WORD *)((_BYTE *)v9 + 9) & 0xF000 | v12 & 0x3F | 0x540;
  *v9 = off_1EA94F320;
  result = *a3;
  *(_WORD *)((char *)v9 + 9) = v13;
  v9[2] = v10;
  *(__n128 *)(v9 + 3) = result;
  v9[5] = v11;
  return result;
}

__n128 `anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::make<`anonymous namespace'::itanium_demangle::NewExpr,`anonymous namespace'::itanium_demangle::NodeArray &,`anonymous namespace'::itanium_demangle::Node *&,`anonymous namespace'::itanium_demangle::NodeArray &,BOOL &,BOOL,`anonymous namespace'::itanium_demangle::Node::Prec>(uint64_t a1, __n128 *a2, uint64_t *a3, __int128 *a4, char *a5, char *a6, _WORD *a7)
{
  _QWORD *v13;
  uint64_t v14;
  char v15;
  char v16;
  char v17;
  __int16 v18;
  __n128 result;
  __int128 v20;

  v14 = *a3;
  v15 = *a5;
  v16 = *a6;
  v17 = *a7;
  *((_BYTE *)v13 + 8) = 64;
  v18 = *(_WORD *)((_BYTE *)v13 + 9) & 0xF000 | v17 & 0x3F | 0x540;
  *v13 = off_1EA94F390;
  result = *a2;
  v20 = *a4;
  *(_WORD *)((char *)v13 + 9) = v18;
  *((__n128 *)v13 + 1) = result;
  v13[4] = v14;
  *(_OWORD *)(v13 + 5) = v20;
  *((_BYTE *)v13 + 56) = v15;
  *((_BYTE *)v13 + 57) = v16;
  return result;
}

__n128 `anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::make<`anonymous namespace'::itanium_demangle::CallExpr,`anonymous namespace'::itanium_demangle::Node *&,`anonymous namespace'::itanium_demangle::NodeArray,`anonymous namespace'::itanium_demangle::Node::Prec>(uint64_t a1, uint64_t *a2, __n128 *a3, _WORD *a4)
{
  _QWORD *v7;
  uint64_t v8;
  char v9;
  __int16 v10;
  __n128 result;

  v8 = *a2;
  v9 = *a4;
  *((_BYTE *)v7 + 8) = 63;
  v10 = *(_WORD *)((_BYTE *)v7 + 9) & 0xF000 | v9 & 0x3F | 0x540;
  *v7 = off_1EA94F470;
  result = *a3;
  *(_WORD *)((char *)v7 + 9) = v10;
  v7[2] = v8;
  *(__n128 *)(v7 + 3) = result;
  return result;
}

__n128 `anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::make<`anonymous namespace'::itanium_demangle::ConversionExpr,`anonymous namespace'::itanium_demangle::Node *&,`anonymous namespace'::itanium_demangle::NodeArray &,`anonymous namespace'::itanium_demangle::Node::Prec>(uint64_t a1, uint64_t *a2, __n128 *a3, _WORD *a4)
{
  _QWORD *v7;
  uint64_t v8;
  char v9;
  __int16 v10;
  __n128 result;

  v8 = *a2;
  v9 = *a4;
  *((_BYTE *)v7 + 8) = 68;
  v10 = *(_WORD *)((_BYTE *)v7 + 9) & 0xF000 | v9 & 0x3F | 0x540;
  *v7 = off_1EA94F4E0;
  result = *a3;
  *(_WORD *)((char *)v7 + 9) = v10;
  v7[2] = v8;
  *(__n128 *)(v7 + 3) = result;
  return result;
}

__n128 `anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::make<`anonymous namespace'::itanium_demangle::CastExpr,std::string_view &,`anonymous namespace'::itanium_demangle::Node *&,`anonymous namespace'::itanium_demangle::Node *&,`anonymous namespace'::itanium_demangle::Node::Prec>(uint64_t a1, __n128 *a2, uint64_t *a3, uint64_t *a4, _WORD *a5)
{
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  __int16 v13;
  __n128 result;

  v10 = *a3;
  v11 = *a4;
  v12 = *a5;
  *((_BYTE *)v9 + 8) = 61;
  v13 = *(_WORD *)((_BYTE *)v9 + 9) & 0xF000 | v12 & 0x3F | 0x540;
  *v9 = off_1EA94F5C0;
  result = *a2;
  *(_WORD *)((char *)v9 + 9) = v13;
  *((__n128 *)v9 + 1) = result;
  v9[4] = v10;
  v9[5] = v11;
  return result;
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::parseExprPrimary(uint64_t a1)
{
  char *v1;
  char *v2;
  _WORD *v4;
  unint64_t v5;
  _QWORD *result;
  char *v7;
  _QWORD *v8;
  uint64_t (**v9)();
  _QWORD *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  BOOL v19;
  int *v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  int v33;
  int v34;

  v1 = *(char **)a1;
  v2 = *(char **)(a1 + 8);
  if (*(char **)a1 != v2 && *v1 == 76)
  {
    v4 = v1 + 1;
    *(_QWORD *)a1 = v1 + 1;
    v5 = v2 - (v1 + 1);
    if (v2 == v1 + 1)
    {
LABEL_10:
      if (!result)
        return result;
      v10 = result;
      if (v12)
      {
        v13 = *(char **)a1;
        if (*(_QWORD *)a1 != *(_QWORD *)(a1 + 8) && *v13 == 69)
        {
          v14 = v11;
          v15 = v12;
          *(_QWORD *)a1 = v13 + 1;
          *((_BYTE *)result + 8) = 76;
          *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
          *result = off_1EA94FD30;
          result[2] = v10;
          result[3] = v14;
          result[4] = v15;
          return result;
        }
      }
    }
    else
    {
      result = 0;
      switch(*(_BYTE *)v4)
      {
        case 'A':
          if (!result)
            return result;
          v7 = *(char **)a1;
          if (*(_QWORD *)a1 == *(_QWORD *)(a1 + 8) || *v7 != 69)
            return 0;
          v8 = result;
          *(_QWORD *)a1 = v7 + 1;
          *((_BYTE *)result + 8) = 74;
          *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
          v9 = off_1EA94F8D0;
          goto LABEL_9;
        case 'D':
          if (v5 < 2)
            return 0;
          if (*v4 != 28228)
            return 0;
          v16 = v1 + 3;
          *(_QWORD *)a1 = v1 + 3;
          if (v1 + 3 == v2)
            return 0;
          if (*v16 == 48)
          {
            v16 = v1 + 4;
            *(_QWORD *)a1 = v1 + 4;
          }
          if (v16 == v2 || *v16 != 69)
            return 0;
          *(_QWORD *)a1 = v16 + 1;
        case 'T':
          return result;
        case 'U':
          if (v5 < 2 || v1[2] != 108)
            return 0;
          if (!result)
            return result;
          v17 = *(char **)a1;
          if (*(_QWORD *)a1 == *(_QWORD *)(a1 + 8) || *v17 != 69)
            return 0;
          v8 = result;
          *(_QWORD *)a1 = v17 + 1;
          *((_BYTE *)result + 8) = 75;
          *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
          v9 = off_1EA94FCC0;
LABEL_9:
          *result = v9;
          result[2] = v8;
          return result;
        case '_':
          if (v5 < 2 || *v4 != 23135)
            return 0;
          *(_QWORD *)a1 = v1 + 3;
          if (!result)
            return result;
          v18 = *(char **)a1;
          if (*(_QWORD *)a1 == *(_QWORD *)(a1 + 8) || *v18 != 69)
            return 0;
          *(_QWORD *)a1 = v18 + 1;
          return result;
        case 'a':
          *(_QWORD *)a1 = v1 + 2;
        case 'b':
          if (v5 >= 3 && (*v4 == 12386 ? (v19 = v1[3] == 69) : (v19 = 0), v19))
          {
            *(_QWORD *)a1 = v1 + 4;
            v34 = 0;
            v20 = &v34;
          }
          else
          {
            v33 = 1;
            v20 = &v33;
          }
        case 'c':
          *(_QWORD *)a1 = v1 + 2;
        case 'd':
          v21 = v1 + 2;
          *(_QWORD *)a1 = v1 + 2;
          if ((unint64_t)(v2 - (v1 + 2)) < 0x11)
            return 0;
          v22 = 0;
          v23 = v1 + 18;
          while ((v21[v22] & 0x80000000) == 0
               && (*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v21[v22] + 60) & 0x10000) != 0)
          {
            if (++v22 == 16)
            {
              *(_QWORD *)a1 = v23;
              if (v23 != v2 && *v23 == 69)
              {
                *(_QWORD *)a1 = v1 + 19;
                *((_BYTE *)result + 8) = 79;
                *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
                *result = off_1EA94F7F0;
                v24 = 16;
                goto LABEL_86;
              }
              return 0;
            }
          }
          return 0;
        case 'e':
          v25 = v1 + 2;
          *(_QWORD *)a1 = v1 + 2;
          if ((unint64_t)(v2 - (v1 + 2)) < 0x21)
            return 0;
          v26 = 0;
          v27 = v1 + 34;
          while ((v25[v26] & 0x80000000) == 0
               && (*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v25[v26] + 60) & 0x10000) != 0)
          {
            if (++v26 == 32)
            {
              *(_QWORD *)a1 = v27;
              if (v27 != v2 && *v27 == 69)
              {
                *(_QWORD *)a1 = v1 + 35;
                *((_BYTE *)result + 8) = 80;
                *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
                *result = off_1EA94F860;
                result[2] = v25;
                result[3] = 32;
                return result;
              }
              return 0;
            }
          }
          return 0;
        case 'f':
          v21 = v1 + 2;
          *(_QWORD *)a1 = v1 + 2;
          if ((unint64_t)(v2 - (v1 + 2)) < 9)
            return 0;
          v31 = 0;
          v32 = v1 + 10;
          break;
        case 'h':
          *(_QWORD *)a1 = v1 + 2;
        case 'i':
          *(_QWORD *)a1 = v1 + 2;
        case 'j':
          *(_QWORD *)a1 = v1 + 2;
          v28 = "u";
          goto LABEL_67;
        case 'l':
          *(_QWORD *)a1 = v1 + 2;
          v28 = "l";
LABEL_67:
          v29 = a1;
          v30 = 1;
        case 'm':
          *(_QWORD *)a1 = v1 + 2;
          v28 = "ul";
          goto LABEL_75;
        case 'n':
          *(_QWORD *)a1 = v1 + 2;
        case 'o':
          *(_QWORD *)a1 = v1 + 2;
        case 's':
          *(_QWORD *)a1 = v1 + 2;
        case 't':
          *(_QWORD *)a1 = v1 + 2;
        case 'w':
          *(_QWORD *)a1 = v1 + 2;
        case 'x':
          *(_QWORD *)a1 = v1 + 2;
          v28 = "ll";
LABEL_75:
          v29 = a1;
          v30 = 2;
        case 'y':
          *(_QWORD *)a1 = v1 + 2;
          v28 = "ull";
          v29 = a1;
          v30 = 3;
        default:
          goto LABEL_10;
      }
      while ((v21[v31] & 0x80000000) == 0
           && (*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v21[v31] + 60) & 0x10000) != 0)
      {
        if (++v31 == 8)
        {
          *(_QWORD *)a1 = v32;
          if (v32 == v2 || *v32 != 69)
            return 0;
          *(_QWORD *)a1 = v1 + 11;
          *((_BYTE *)result + 8) = 78;
          *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
          *result = off_1EA94F780;
          v24 = 8;
LABEL_86:
          result[2] = v21;
          result[3] = v24;
          return result;
        }
      }
    }
  }
  return 0;
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::parseFunctionParam(uint64_t a1)
{
  char *v2;
  unint64_t v3;
  uint64_t v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  _QWORD *result;

  v2 = *(char **)a1;
  v3 = *(_QWORD *)(a1 + 8) - *(_QWORD *)a1;
  if (v3 < 3)
  {
    if (v3 != 2)
      return 0;
LABEL_8:
    if (*(_WORD *)v2 == 28774)
    {
      v7 = v2 + 2;
    }
    else
    {
      if (*(_WORD *)v2 != 19558)
        return 0;
      *(_QWORD *)a1 = v2 + 2;
      if (!v5)
        return 0;
      v6 = *(char **)a1;
      if (*(_QWORD *)a1 == *(_QWORD *)(a1 + 8) || *v6 != 112)
        return 0;
      v7 = v6 + 1;
    }
    *(_QWORD *)a1 = v7;
    v10 = *(char **)a1;
    if (*(_QWORD *)a1 != *(_QWORD *)(a1 + 8) && *v10 == 95)
    {
      v11 = v8;
      v12 = v9;
      *(_QWORD *)a1 = v10 + 1;
      *((_BYTE *)result + 8) = 67;
      *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
      *result = off_1EA94FDA0;
      result[2] = v11;
      result[3] = v12;
      return result;
    }
    return 0;
  }
  if (*(_WORD *)v2 != 28774 || v2[2] != 84)
    goto LABEL_8;
  *(_QWORD *)a1 = v2 + 3;
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::parseBracedExpr(_QWORD *a1)
{
  _BYTE *v2;
  int v3;
  _QWORD *result;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;

  v2 = (_BYTE *)*a1;
  if (a1[1] - *a1 < 2uLL || *v2 != 100)
  v3 = (char)v2[1];
  switch(v3)
  {
    case 'X':
      *a1 = v2 + 2;
      if (result)
      {
        v7 = result;
        if (result)
        {
          v8 = result;
          if (result)
          {
            v9 = result;
            *((_BYTE *)result + 8) = 82;
            *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
            *result = off_1EA94FF60;
            result[2] = v7;
            result[3] = v8;
            result[4] = v9;
          }
        }
      }
      break;
    case 'x':
      *a1 = v2 + 2;
      if (result)
      {
        v10 = result;
        if (result)
        {
          v11 = result;
          *((_BYTE *)result + 8) = 81;
          *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
          *result = off_1EA94FEF0;
          result[2] = v10;
          result[3] = v11;
          *((_BYTE *)result + 32) = 1;
        }
      }
      break;
    case 'i':
      *a1 = v2 + 2;
      if (result)
      {
        v5 = result;
        if (result)
        {
          v6 = result;
          *((_BYTE *)result + 8) = 81;
          *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
          *result = off_1EA94FEF0;
          result[2] = v5;
          result[3] = v6;
          *((_BYTE *)result + 32) = 0;
        }
      }
      return result;
    default:
  }
  return result;
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::parsePointerToMemberConversionExpr(uint64_t a1)
{
  _QWORD *result;
  _QWORD *v3;
  _QWORD *v4;
  char *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  if (result)
  {
    v3 = result;
    if (result)
    {
      v4 = result;
      v7 = *(char **)a1;
      if (*(_QWORD *)a1 == *(_QWORD *)(a1 + 8) || *v7 != 69)
      {
        return 0;
      }
      else
      {
        v8 = v5;
        v9 = v6;
        *(_QWORD *)a1 = v7 + 1;
        *((_BYTE *)result + 8) = 69;
        *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x542;
        *result = off_1EA950040;
        result[2] = v3;
        result[3] = v4;
        result[4] = v8;
        result[5] = v9;
      }
    }
  }
  return result;
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::make<`anonymous namespace'::itanium_demangle::EnclosingExpr,char const(&)[10],`anonymous namespace'::itanium_demangle::Node *&,`anonymous namespace'::itanium_demangle::Node::Prec>(uint64_t a1, uint64_t *a2, _WORD *a3)
{
  _QWORD *result;
  uint64_t v6;
  char v7;

  v6 = *a2;
  v7 = *a3;
  *((_BYTE *)result + 8) = 60;
  *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | v7 & 0x3F | 0x540;
  *result = off_1EA94F630;
  result[2] = "noexcept ";
  result[3] = 9;
  result[5] = 0;
  result[6] = 0;
  result[4] = v6;
  return result;
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::parseRequiresExpr(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _WORD *v8;
  _BYTE *v9;
  _BYTE *v11;
  _BYTE *v12;
  unint64_t v13;
  _QWORD *result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _anonymous_namespace_::BumpPointerAllocator *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  _BYTE *v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE *v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  _QWORD *v43;

  v8 = *(_WORD **)a1;
  v9 = *(_BYTE **)(a1 + 8);
  if ((unint64_t)&v9[-*(_QWORD *)a1] < 2)
    return 0;
  if (*v8 == 20850)
  {
    v12 = v8 + 1;
    *(_QWORD *)a1 = v12;
    v13 = (uint64_t)(*(_QWORD *)(a1 + 24) - *(_QWORD *)(a1 + 16)) >> 3;
    while (v12 == v9 || *v12 != 95)
    {
      v43 = result;
      if (!result)
        return result;
      v12 = *(_BYTE **)a1;
      v9 = *(_BYTE **)(a1 + 8);
    }
    *(_QWORD *)a1 = v12 + 1;
    v42 = v15;
    v11 = *(_BYTE **)a1;
    v9 = *(_BYTE **)(a1 + 8);
  }
  else
  {
    if (*v8 != 29042)
      return 0;
    v41 = 0;
    v42 = 0;
    v11 = v8 + 1;
    *(_QWORD *)a1 = v11;
  }
  v16 = *(_QWORD *)(a1 + 16);
  v17 = *(_QWORD *)(a1 + 24);
  v43 = 0;
  if (v11 != v9)
  {
    v40 = (v17 - v16) >> 3;
    v18 = (_anonymous_namespace_::BumpPointerAllocator *)(a1 + 808);
    while (1)
    {
      v19 = *v11;
      if (v19 == 81)
        break;
      if (v19 == 84)
      {
        *(_QWORD *)a1 = v11 + 1;
        if (!v28)
          return 0;
        v26 = v28;
        *((_BYTE *)v27 + 8) = 85;
        *(_WORD *)((char *)v27 + 9) = *(_WORD *)((_BYTE *)v27 + 9) & 0xF000 | 0x540;
        *v27 = off_1EA950120;
        goto LABEL_24;
      }
      if (v19 != 88)
        return 0;
      *(_QWORD *)a1 = v11 + 1;
      if (!v20)
        return 0;
      v21 = v20;
      v22 = *(_BYTE **)a1;
      v23 = *(_BYTE **)(a1 + 8);
      if (*(_BYTE **)a1 == v23 || *v22 != 78)
      {
        v24 = 0;
      }
      else
      {
        *(_QWORD *)a1 = ++v22;
        v24 = 1;
      }
      if (v22 == v23 || *v22 != 82)
      {
        v29 = 0;
      }
      else
      {
        *(_QWORD *)a1 = v22 + 1;
        if (!v29)
          return 0;
      }
      *((_BYTE *)v27 + 8) = 84;
      *(_WORD *)((char *)v27 + 9) = *(_WORD *)((_BYTE *)v27 + 9) & 0xF000 | 0x540;
      *v27 = off_1EA9500B0;
      v27[2] = v21;
      *((_BYTE *)v27 + 24) = v24;
      v27[4] = v29;
LABEL_32:
      v43 = v27;
      v11 = *(_BYTE **)a1;
      v36 = *(_BYTE **)(a1 + 8);
      if (*(_BYTE **)a1 != v36 && *v11 == 69)
      {
        *(_QWORD *)a1 = v11 + 1;
        v39 = v38;
        *((_BYTE *)result + 8) = 83;
        *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
        *result = off_1EA950200;
        result[2] = v41;
        result[3] = v42;
        result[4] = v37;
        result[5] = v39;
        return result;
      }
      v43 = 0;
      if (v11 == v36)
        return 0;
    }
    *(_QWORD *)a1 = v11 + 1;
    if (!v25)
      return 0;
    v26 = v25;
    *((_BYTE *)v27 + 8) = 86;
    *(_WORD *)((char *)v27 + 9) = *(_WORD *)((_BYTE *)v27 + 9) & 0xF000 | 0x540;
    *v27 = off_1EA950190;
LABEL_24:
    v27[2] = v26;
    goto LABEL_32;
  }
  return 0;
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::parseSubobjectExpr(uint64_t a1)
{
  _QWORD *result;
  _QWORD *v3;
  _QWORD *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _anonymous_namespace_::BumpPointerAllocator *v19;
  int v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  BOOL v25;
  char v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  _QWORD *v34;

  if (result)
  {
    v3 = result;
    if (result)
    {
      v4 = result;
      v13 = *(char **)a1;
      v14 = *(char **)(a1 + 8);
      if (*(char **)a1 != v14)
      {
        v15 = v5;
        v16 = v6;
        v17 = *(_QWORD *)(a1 + 16);
        v18 = *(_QWORD *)(a1 + 24);
        v19 = (_anonymous_namespace_::BumpPointerAllocator *)(a1 + 808);
        v20 = *v13;
        if (v20 == 95)
        {
          v30 = *(_QWORD *)(a1 + 24);
          v31 = *(_QWORD *)(a1 + 16);
          v32 = v6;
          v33 = v5;
          while (1)
          {
            *(_QWORD *)a1 = v13 + 1;
            v23 = v22;
            *((_BYTE *)v24 + 8) = 8;
            *(_WORD *)((char *)v24 + 9) = *(_WORD *)((_BYTE *)v24 + 9) & 0xF000 | 0x540;
            *v24 = off_1EA94EC30;
            v24[2] = v21;
            v24[3] = v23;
            v34 = v24;
            v13 = *(char **)a1;
            v14 = *(char **)(a1 + 8);
            if (*(char **)a1 == v14)
              break;
            v20 = *v13;
            if (v20 != 95)
            {
              v16 = v32;
              v15 = v33;
              v18 = v30;
              v17 = v31;
              goto LABEL_9;
            }
          }
        }
        else
        {
LABEL_9:
          v25 = v13 != v14 && v20 == 112;
          v26 = v25;
          if (v25)
            *(_QWORD *)a1 = ++v13;
          if (v13 != v14 && *v13 == 69)
          {
            *(_QWORD *)a1 = v13 + 1;
            v29 = v28;
            *((_BYTE *)result + 8) = 59;
            *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
            *result = off_1EA950270;
            result[2] = v3;
            result[3] = v4;
            result[4] = v15;
            result[5] = v16;
            result[6] = v27;
            result[7] = v29;
            *((_BYTE *)result + 64) = v26;
            return result;
          }
        }
      }
      return 0;
    }
  }
  return result;
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::make<`anonymous namespace'::itanium_demangle::EnclosingExpr,char const(&)[11],`anonymous namespace'::itanium_demangle::Node *&>(uint64_t a1, uint64_t *a2)
{
  _QWORD *result;
  uint64_t v4;

  v4 = *a2;
  *((_BYTE *)result + 8) = 60;
  *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
  *result = off_1EA94F630;
  result[2] = "sizeof... ";
  result[3] = 10;
  result[4] = v4;
  result[5] = 0;
  result[6] = 0;
  return result;
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::make<`anonymous namespace'::itanium_demangle::NameType,char const(&)[6]>(uint64_t a1, const char *a2)
{
  _QWORD *v3;
  size_t v4;

  v4 = strlen(a2);
  *((_BYTE *)v3 + 8) = 8;
  *(_WORD *)((char *)v3 + 9) = *(_WORD *)((_BYTE *)v3 + 9) & 0xF000 | 0x540;
  *v3 = off_1EA94EC30;
  v3[2] = a2;
  v3[3] = v4;
  return v3;
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::parseUnresolvedName(uint64_t a1, int a2)
{
  char *v4;
  char *v5;
  unint64_t v6;
  _QWORD *v8;
  _QWORD *v9;
  unint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  _anonymous_namespace_::BumpPointerAllocator *v22;
  char *v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD *v38;
  _QWORD *v39;
  char *v40;
  _QWORD *v41;
  _QWORD *v42;
  _QWORD *v43;
  _QWORD *v44;

  v4 = *(char **)a1;
  v5 = *(char **)(a1 + 8);
  v6 = (unint64_t)&v5[-*(_QWORD *)a1];
  if (v6 >= 3)
  {
    if (*(_WORD *)v4 == 29299 && v4[2] == 78)
    {
      *(_QWORD *)a1 = v4 + 3;
      if (v11)
      {
        v18 = v11;
        if (*(_QWORD *)(a1 + 8) != *(_QWORD *)a1 && **(_BYTE **)a1 == 73)
        {
          if (!v19)
            return 0;
          v20 = v19;
          *((_BYTE *)v21 + 8) = 45;
          *(_WORD *)((char *)v21 + 9) = *(_WORD *)((_BYTE *)v21 + 9) & 0xF000 | 0x540;
          *v21 = off_1EA950B30;
          v21[2] = v18;
          v21[3] = v20;
          v18 = v21;
        }
        v22 = (_anonymous_namespace_::BumpPointerAllocator *)(a1 + 808);
        while (1)
        {
          v23 = *(char **)a1;
          if (*(_QWORD *)a1 != *(_QWORD *)(a1 + 8) && *v23 == 69)
            break;
          if (!v8)
            return v8;
          *((_BYTE *)v24 + 8) = 23;
          *(_WORD *)((char *)v24 + 9) = *(_WORD *)((_BYTE *)v24 + 9) & 0xF000 | 0x540;
          *v24 = off_1EA950430;
          v24[2] = v18;
          v24[3] = v8;
          v18 = v24;
        }
        *(_QWORD *)a1 = v23 + 1;
        if (v41)
        {
          v42 = v41;
          *((_BYTE *)v8 + 8) = 23;
          *(_WORD *)((char *)v8 + 9) = *(_WORD *)((_BYTE *)v8 + 9) & 0xF000 | 0x540;
          *v8 = off_1EA950430;
          v8[2] = v18;
          v8[3] = v42;
          return v8;
        }
      }
      return 0;
    }
  }
  else if (v6 != 2)
  {
    goto LABEL_9;
  }
  if (*(_WORD *)v4 == 29299)
  {
    v10 = (unint64_t)(v4 + 2);
    *(_QWORD *)a1 = v10;
    if (v5 == (char *)v10)
    {
      v10 = 0;
    }
    else
    {
      LODWORD(v10) = *(char *)v10;
      if ((v10 & 0x80000000) != 0)
        goto LABEL_27;
      v10 = v10;
    }
    if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v10 + 60) & 0x400) == 0)
    {
LABEL_27:
      if (v25)
      {
        v32 = v25;
        if (*(_QWORD *)(a1 + 8) == *(_QWORD *)a1 || **(_BYTE **)a1 != 73)
        {
LABEL_47:
          if (v43)
          {
            v44 = v43;
            *((_BYTE *)v8 + 8) = 23;
            *(_WORD *)((char *)v8 + 9) = *(_WORD *)((_BYTE *)v8 + 9) & 0xF000 | 0x540;
            *v8 = off_1EA950430;
            v8[2] = v32;
            v8[3] = v44;
            return v8;
          }
        }
        else
        {
          if (v33)
          {
            v34 = v33;
            *((_BYTE *)v35 + 8) = 45;
            *(_WORD *)((char *)v35 + 9) = *(_WORD *)((_BYTE *)v35 + 9) & 0xF000 | 0x540;
            *v35 = off_1EA950B30;
            v35[2] = v32;
            v35[3] = v34;
            v32 = v35;
            goto LABEL_47;
          }
        }
      }
      return 0;
    }
    if (!v36)
      return 0;
    v37 = v36;
    v32 = 0;
    while (1)
    {
      if (v32)
      {
        *((_BYTE *)v38 + 8) = 23;
        *(_WORD *)((char *)v38 + 9) = *(_WORD *)((_BYTE *)v38 + 9) & 0xF000 | 0x540;
        *v38 = off_1EA950430;
        v38[2] = v32;
        v39 = v38 + 3;
        v32 = v38;
      }
      else
      {
        if (!a2)
        {
          v32 = v37;
          goto LABEL_39;
        }
        *((_BYTE *)v32 + 8) = 46;
        *(_WORD *)((char *)v32 + 9) = *(_WORD *)((_BYTE *)v32 + 9) & 0xF000 | 0x540;
        *v32 = off_1EA9505F0;
        v39 = v32 + 2;
      }
      *v39 = v37;
LABEL_39:
      v40 = *(char **)a1;
      if (*(_QWORD *)a1 != *(_QWORD *)(a1 + 8) && *v40 == 69)
      {
        *(_QWORD *)a1 = v40 + 1;
        goto LABEL_47;
      }
      if (!v37)
        return 0;
    }
  }
LABEL_9:
  if (v8 && a2)
  {
    *((_BYTE *)v9 + 8) = 46;
    *(_WORD *)((char *)v9 + 9) = *(_WORD *)((_BYTE *)v9 + 9) & 0xF000 | 0x540;
    *v9 = off_1EA9505F0;
    v9[2] = v8;
    return v9;
  }
  return v8;
}

__n128 `anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::make<`anonymous namespace'::itanium_demangle::BinaryExpr,`anonymous namespace'::itanium_demangle::Node *&,std::string_view &,`anonymous namespace'::itanium_demangle::Node *&,`anonymous namespace'::itanium_demangle::Node::Prec &>(uint64_t a1, uint64_t *a2, __n128 *a3, uint64_t *a4, _WORD *a5)
{
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  __int16 v13;
  __n128 result;

  v10 = *a2;
  v11 = *a4;
  v12 = *a5;
  *((_BYTE *)v9 + 8) = 54;
  v13 = *(_WORD *)((_BYTE *)v9 + 9) & 0xF000 | v12 & 0x3F | 0x540;
  *v9 = off_1EA94F160;
  result = *a3;
  *(_WORD *)((char *)v9 + 9) = v13;
  v9[2] = v10;
  *(__n128 *)(v9 + 3) = result;
  v9[5] = v11;
  return result;
}

_QWORD *`anonymous namespace'::itanium_demangle::BinaryExpr::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  int v4;
  int v5;
  __int16 v6;
  int v7;
  int v8;
  int v9;
  size_t v10;
  const void *v11;
  _QWORD *result;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (*((_DWORD *)this + 8))
    goto LABEL_2;
  v15 = *(_BYTE **)(a1 + 24);
  v16 = *(_QWORD *)(a1 + 32);
  if (v16 != 2)
  {
    if (v16 == 1 && *v15 == 62)
      goto LABEL_19;
LABEL_2:
    v4 = 0;
    goto LABEL_3;
  }
  if (memcmp(v15, ">>", 2uLL))
    goto LABEL_2;
LABEL_19:
  v4 = 1;
  *((_DWORD *)this + 8) = 1;
  v17 = *(_QWORD *)this;
  v18 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v18 + 1;
  *(_BYTE *)(v17 + v18) = 40;
LABEL_3:
  v5 = *(unsigned __int16 *)(a1 + 9);
  v6 = (_WORD)v5 << 10;
  v7 = (unsigned __int16)((_WORD)v5 << 10);
  v8 = v5 << 26 >> 26;
  if (v7 == 17408)
    v9 = 15;
  else
    v9 = v8;
  if (*(_QWORD *)(a1 + 32) == 1 && **(_BYTE **)(a1 + 24) == 44)
  {
    v10 = 1;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)this + (*((_QWORD *)this + 1))++) = 32;
    v10 = *(_QWORD *)(a1 + 32);
    if (!v10)
      goto LABEL_11;
  }
  v11 = *(const void **)(a1 + 24);
  memcpy((void *)(*(_QWORD *)this + *((_QWORD *)this + 1)), v11, v10);
  *((_QWORD *)this + 1) += v10;
LABEL_11:
  *(_BYTE *)(*(_QWORD *)this + (*((_QWORD *)this + 1))++) = 32;
  if (v4)
  {
    --*((_DWORD *)this + 8);
    v13 = *(_QWORD *)this;
    v14 = *((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v14 + 1;
    *(_BYTE *)(v13 + v14) = 41;
  }
  return result;
}

void `anonymous namespace'::itanium_demangle::BinaryExpr::~BinaryExpr(_anonymous_namespace_::itanium_demangle::BinaryExpr *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

_QWORD *`anonymous namespace'::itanium_demangle::Node::printAsOperand(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this, int a3, int a4)
{
  _QWORD *result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a4 + a3 <= (*(unsigned __int16 *)(a1 + 9) << 26 >> 26))
  {
    ++*((_DWORD *)this + 8);
    v7 = *(_QWORD *)this;
    v8 = *((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v8 + 1;
    *(_BYTE *)(v7 + v8) = 40;
    (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)a1 + 32))(a1, this);
    if ((*(_WORD *)(a1 + 9) & 0xC0) != 0x40)
      (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)a1 + 40))(a1, this);
    --*((_DWORD *)this + 8);
    v9 = *(_QWORD *)this;
    v10 = *((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v10 + 1;
    *(_BYTE *)(v9 + v10) = 41;
  }
  else
  {
    result = (_QWORD *)(*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)a1 + 32))(a1, this);
    if ((*(_WORD *)(a1 + 9) & 0xC0) != 0x40)
      return (_QWORD *)(*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)a1 + 40))(a1, this);
  }
  return result;
}

_QWORD *`anonymous namespace'::itanium_demangle::PrefixExpr::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  size_t v4;
  const void *v5;

  v4 = *(_QWORD *)(a1 + 24);
  if (v4)
  {
    v5 = *(const void **)(a1 + 16);
    memcpy((void *)(*(_QWORD *)this + *((_QWORD *)this + 1)), v5, v4);
    *((_QWORD *)this + 1) += v4;
  }
}

void `anonymous namespace'::itanium_demangle::PrefixExpr::~PrefixExpr(_anonymous_namespace_::itanium_demangle::PrefixExpr *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

void *`anonymous namespace'::itanium_demangle::PostfixExpr::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *a2)
{
  void *result;
  size_t v5;
  const void *v6;

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v6 = *(const void **)(a1 + 24);
    result = memcpy((void *)(*(_QWORD *)a2 + *((_QWORD *)a2 + 1)), v6, v5);
    *((_QWORD *)a2 + 1) += v5;
  }
  return result;
}

void `anonymous namespace'::itanium_demangle::PostfixExpr::~PostfixExpr(_anonymous_namespace_::itanium_demangle::PostfixExpr *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

_QWORD *`anonymous namespace'::itanium_demangle::ArraySubscriptExpr::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *result;
  uint64_t v7;
  uint64_t v8;

  ++*((_DWORD *)a2 + 8);
  v4 = *(_QWORD *)a2;
  v5 = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v5 + 1;
  *(_BYTE *)(v4 + v5) = 91;
  --*((_DWORD *)a2 + 8);
  v7 = *(_QWORD *)a2;
  v8 = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v8 + 1;
  *(_BYTE *)(v7 + v8) = 93;
  return result;
}

void `anonymous namespace'::itanium_demangle::ArraySubscriptExpr::~ArraySubscriptExpr(_anonymous_namespace_::itanium_demangle::ArraySubscriptExpr *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

_QWORD *`anonymous namespace'::itanium_demangle::MemberExpr::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *a2)
{
  size_t v4;
  const void *v5;

  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = *(const void **)(a1 + 24);
    memcpy((void *)(*(_QWORD *)a2 + *((_QWORD *)a2 + 1)), v5, v4);
    *((_QWORD *)a2 + 1) += v4;
  }
}

void `anonymous namespace'::itanium_demangle::MemberExpr::~MemberExpr(_anonymous_namespace_::itanium_demangle::MemberExpr *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

_QWORD *`anonymous namespace'::itanium_demangle::NewExpr::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (*(_BYTE *)(a1 + 56))
  {
    *(_WORD *)(*(_QWORD *)this + *((_QWORD *)this + 1)) = 14906;
    *((_QWORD *)this + 1) += 2;
  }
  v4 = *(_QWORD *)this + *((_QWORD *)this + 1);
  *(_BYTE *)(v4 + 2) = 119;
  *(_WORD *)v4 = 25966;
  *((_QWORD *)this + 1) += 3;
  if (*(_BYTE *)(a1 + 57))
  {
    *(_WORD *)(*(_QWORD *)this + *((_QWORD *)this + 1)) = 23899;
    *((_QWORD *)this + 1) += 2;
  }
  if (*(_QWORD *)(a1 + 24))
  {
    ++*((_DWORD *)this + 8);
    v5 = *(_QWORD *)this;
    v6 = *((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v6 + 1;
    *(_BYTE *)(v5 + v6) = 40;
    --*((_DWORD *)this + 8);
    v7 = *(_QWORD *)this;
    v8 = *((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v8 + 1;
    *(_BYTE *)(v7 + v8) = 41;
  }
  *(_BYTE *)(*(_QWORD *)this + (*((_QWORD *)this + 1))++) = 32;
  v9 = *(_QWORD *)(a1 + 32);
  result = (_QWORD *)(*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v9 + 32))(v9, this);
  if ((*(_WORD *)(v9 + 9) & 0xC0) != 0x40)
    result = (_QWORD *)(*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v9 + 40))(v9, this);
  if (*(_QWORD *)(a1 + 48))
  {
    ++*((_DWORD *)this + 8);
    v11 = *(_QWORD *)this;
    v12 = *((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v12 + 1;
    *(_BYTE *)(v11 + v12) = 40;
    --*((_DWORD *)this + 8);
    v13 = *(_QWORD *)this;
    v14 = *((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v14 + 1;
    *(_BYTE *)(v13 + v14) = 41;
  }
  return result;
}

void `anonymous namespace'::itanium_demangle::NewExpr::~NewExpr(_anonymous_namespace_::itanium_demangle::NewExpr *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

_QWORD *`anonymous namespace'::itanium_demangle::NodeArray::printWithComma(_QWORD *result, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;

  if (result[1])
  {
    v3 = result;
    v4 = 0;
    v5 = *((_QWORD *)this + 1);
    v6 = 1;
    do
    {
      v7 = v5;
      if ((v6 & 1) == 0)
      {
        *(_WORD *)(*(_QWORD *)this + *((_QWORD *)this + 1)) = 8236;
        v7 = *((_QWORD *)this + 1) + 2;
        *((_QWORD *)this + 1) = v7;
      }
      if (v7 == *((_QWORD *)this + 1))
      {
        *((_QWORD *)this + 1) = v5;
      }
      else
      {
        v6 = 0;
        v5 = *((_QWORD *)this + 1);
      }
      ++v4;
    }
    while (v4 != v3[1]);
  }
  return result;
}

uint64_t `anonymous namespace'::itanium_demangle::DeleteExpr::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  if (*(_BYTE *)(a1 + 24))
  {
    *(_WORD *)(*(_QWORD *)this + *((_QWORD *)this + 1)) = 14906;
    *((_QWORD *)this + 1) += 2;
  }
  v4 = *(_QWORD *)this + *((_QWORD *)this + 1);
  *(_WORD *)(v4 + 4) = 25972;
  *(_DWORD *)v4 = 1701602660;
  *((_QWORD *)this + 1) += 6;
  if (*(_BYTE *)(a1 + 25))
  {
    *(_WORD *)(*(_QWORD *)this + *((_QWORD *)this + 1)) = 23899;
    *((_QWORD *)this + 1) += 2;
  }
  v5 = *(_QWORD *)this;
  v6 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v6 + 1;
  *(_BYTE *)(v5 + v6) = 32;
  v7 = *(_QWORD *)(a1 + 16);
  result = (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v7 + 32))(v7, this);
  if ((*(_WORD *)(v7 + 9) & 0xC0) != 0x40)
    return (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v7 + 40))(v7, this);
  return result;
}

void `anonymous namespace'::itanium_demangle::DeleteExpr::~DeleteExpr(_anonymous_namespace_::itanium_demangle::DeleteExpr *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

_QWORD *`anonymous namespace'::itanium_demangle::CallExpr::printLeft(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *result;
  uint64_t v8;
  uint64_t v9;

  v4 = *(_QWORD *)(a1 + 16);
  (*(void (**)(uint64_t))(*(_QWORD *)v4 + 32))(v4);
  if ((*(_WORD *)(v4 + 9) & 0xC0) != 0x40)
    (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v4 + 40))(v4, a2);
  ++*((_DWORD *)a2 + 8);
  v5 = *a2;
  v6 = a2[1];
  a2[1] = v6 + 1;
  *(_BYTE *)(v5 + v6) = 40;
  --*((_DWORD *)a2 + 8);
  v8 = *a2;
  v9 = a2[1];
  a2[1] = v9 + 1;
  *(_BYTE *)(v8 + v9) = 41;
  return result;
}

void `anonymous namespace'::itanium_demangle::CallExpr::~CallExpr(_anonymous_namespace_::itanium_demangle::CallExpr *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

_QWORD *`anonymous namespace'::itanium_demangle::ConversionExpr::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *result;
  uint64_t v12;
  uint64_t v13;

  ++*((_DWORD *)this + 8);
  v4 = *(_QWORD *)this;
  v5 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v5 + 1;
  *(_BYTE *)(v4 + v5) = 40;
  v6 = *(_QWORD *)(a1 + 16);
  (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v6 + 32))(v6, this);
  if ((*(_WORD *)(v6 + 9) & 0xC0) != 0x40)
    (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v6 + 40))(v6, this);
  --*((_DWORD *)this + 8);
  v7 = *(_QWORD *)this;
  v8 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v8 + 1;
  *(_BYTE *)(v7 + v8) = 41;
  ++*((_DWORD *)this + 8);
  v9 = *(_QWORD *)this;
  v10 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v10 + 1;
  *(_BYTE *)(v9 + v10) = 40;
  --*((_DWORD *)this + 8);
  v12 = *(_QWORD *)this;
  v13 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v13 + 1;
  *(_BYTE *)(v12 + v13) = 41;
  return result;
}

void `anonymous namespace'::itanium_demangle::ConversionExpr::~ConversionExpr(_anonymous_namespace_::itanium_demangle::ConversionExpr *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

_QWORD *`anonymous namespace'::itanium_demangle::ConditionalExpr::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)a2 + *((_QWORD *)a2 + 1);
  *(_BYTE *)(v4 + 2) = 32;
  *(_WORD *)v4 = 16160;
  *((_QWORD *)a2 + 1) += 3;
  v5 = *(_QWORD *)a2 + *((_QWORD *)a2 + 1);
  *(_BYTE *)(v5 + 2) = 32;
  *(_WORD *)v5 = 14880;
  *((_QWORD *)a2 + 1) += 3;
}

void `anonymous namespace'::itanium_demangle::ConditionalExpr::~ConditionalExpr(_anonymous_namespace_::itanium_demangle::ConditionalExpr *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

_QWORD *`anonymous namespace'::itanium_demangle::CastExpr::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  size_t v4;
  const void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *result;
  uint64_t v10;
  uint64_t v11;

  v4 = *(_QWORD *)(a1 + 24);
  if (v4)
  {
    v5 = *(const void **)(a1 + 16);
    memcpy((void *)(*(_QWORD *)this + *((_QWORD *)this + 1)), v5, v4);
    *((_QWORD *)this + 1) += v4;
  }
  v6 = *((_DWORD *)this + 8);
  *((_DWORD *)this + 8) = 0;
  *(_BYTE *)(*(_QWORD *)this + (*((_QWORD *)this + 1))++) = 60;
  (*(void (**)(_QWORD, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(**(_QWORD **)(a1 + 32) + 32))(*(_QWORD *)(a1 + 32), this);
  *(_BYTE *)(*(_QWORD *)this + (*((_QWORD *)this + 1))++) = 62;
  *((_DWORD *)this + 8) = v6 + 1;
  v7 = *(_QWORD *)this;
  v8 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v8 + 1;
  *(_BYTE *)(v7 + v8) = 40;
  --*((_DWORD *)this + 8);
  v10 = *(_QWORD *)this;
  v11 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v11 + 1;
  *(_BYTE *)(v10 + v11) = 41;
  return result;
}

void sub_1DED59810(_Unwind_Exception *a1)
{
  uint64_t v1;
  int v2;

  *(_DWORD *)(v1 + 32) = v2;
  _Unwind_Resume(a1);
}

void `anonymous namespace'::itanium_demangle::CastExpr::~CastExpr(_anonymous_namespace_::itanium_demangle::CastExpr *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

void *`anonymous namespace'::itanium_demangle::EnclosingExpr::printLeft(_QWORD *a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  size_t v4;
  const void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *result;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  const void *v13;

  v4 = a1[3];
  if (v4)
  {
    v5 = (const void *)a1[2];
    memcpy((void *)(*(_QWORD *)this + *((_QWORD *)this + 1)), v5, v4);
    *((_QWORD *)this + 1) += v4;
  }
  ++*((_DWORD *)this + 8);
  v6 = *(_QWORD *)this;
  v7 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v7 + 1;
  *(_BYTE *)(v6 + v7) = 40;
  v8 = a1[4];
  (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v8 + 32))(v8, this);
  if ((*(_WORD *)(v8 + 9) & 0xC0) != 0x40)
    (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v8 + 40))(v8, this);
  --*((_DWORD *)this + 8);
  v10 = *(_QWORD *)this;
  v11 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v11 + 1;
  *(_BYTE *)(v10 + v11) = 41;
  v12 = a1[6];
  if (v12)
  {
    v13 = (const void *)a1[5];
    result = memcpy((void *)(*(_QWORD *)this + *((_QWORD *)this + 1)), v13, v12);
    *((_QWORD *)this + 1) += v12;
  }
  return result;
}

void `anonymous namespace'::itanium_demangle::EnclosingExpr::~EnclosingExpr(_anonymous_namespace_::itanium_demangle::EnclosingExpr *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::parseIntegerLiteral(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  _QWORD *result;

  if (!v7)
    return 0;
  v8 = *(char **)a1;
  if (*(_QWORD *)a1 == *(_QWORD *)(a1 + 8) || *v8 != 69)
    return 0;
  v9 = v6;
  v10 = v7;
  *(_QWORD *)a1 = v8 + 1;
  *((_BYTE *)result + 8) = 77;
  *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
  *result = off_1EA94F6A0;
  result[2] = a2;
  result[3] = a3;
  result[4] = v9;
  result[5] = v10;
  return result;
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::make<`anonymous namespace'::itanium_demangle::BoolExpr,int>(uint64_t a1, _DWORD *a2)
{
  _QWORD *result;
  BOOL v4;

  v4 = *a2 != 0;
  *((_BYTE *)result + 8) = 73;
  *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
  *result = off_1EA94F710;
  *((_BYTE *)result + 11) = v4;
  return result;
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::make<`anonymous namespace'::itanium_demangle::NameType,char const(&)[8]>(uint64_t a1, const char *a2)
{
  _QWORD *v3;
  size_t v4;

  v4 = strlen(a2);
  *((_BYTE *)v3 + 8) = 8;
  *(_WORD *)((char *)v3 + 9) = *(_WORD *)((_BYTE *)v3 + 9) & 0xF000 | 0x540;
  *v3 = off_1EA94EC30;
  v3[2] = a2;
  v3[3] = v4;
  return v3;
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::parseUnnamedTypeName(unsigned __int8 **a1, uint64_t a2)
{
  char *v3;
  _QWORD *v4;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  unsigned __int8 *v12;
  unsigned __int8 *v13;
  unsigned __int8 *v14;
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
  unint64_t v28;
  unint64_t v29;
  unsigned __int8 *v30;
  char *v31;
  unsigned __int8 *v32;
  char v33;
  uint64_t v34;
  int v35;
  char *v36;
  unsigned __int8 *v37;
  char v38;
  uint64_t v39;
  char *v40;
  _QWORD *v41;
  __int128 v42;
  uint64_t v43;
  __int128 v44;
  uint64_t v45;
  __n128 v46;
  _QWORD v47[2];
  const void *v48;

  if (a2)
    a1[84] = a1[83];
  v3 = (char *)*a1;
  if ((unint64_t)(a1[1] - *a1) < 2)
    return 0;
  switch(*(_WORD *)v3)
  {
    case 0x7455:
      *a1 = (unsigned __int8 *)(v3 + 2);
      v9 = (char *)*a1;
      if (*a1 != a1[1] && *v9 == 95)
      {
        v10 = v7;
        v11 = v8;
        *a1 = (unsigned __int8 *)(v9 + 1);
        *((_BYTE *)v4 + 8) = 51;
        *(_WORD *)((char *)v4 + 9) = *(_WORD *)((_BYTE *)v4 + 9) & 0xF000 | 0x540;
        *v4 = off_1EA94F940;
        v4[2] = v10;
        v4[3] = v11;
        return v4;
      }
      return 0;
    case 0x6C55:
      *a1 = (unsigned __int8 *)(v3 + 2);
      v12 = a1[98];
      a1[98] = (unsigned __int8 *)((a1[84] - a1[83]) >> 3);
      v13 = a1[2];
      v14 = a1[3];
      {
        if (!v46.n128_u64[0])
          goto LABEL_43;
      }
      v28 = (v14 - v13) >> 3;
      v46.n128_u64[1] = v29;
      if (!v29)
      {
        v30 = a1[84];
        if (v30 == a1[83])
          abort_message("%s:%d: %s", 0, v22, v23, v24, v25, v26, v27, (char)"/Library/Caches/com.apple.xbs/Sources/libcxx_os/libcxxabi/src/demangle/ItaniumDemangle.h");
        a1[84] = v30 - 8;
      }
      v45 = 0;
      v31 = (char *)*a1;
      v32 = a1[1];
      if (*a1 == v32)
      {
LABEL_28:
        while (1)
        {
          if (!(_QWORD)v44)
            goto LABEL_43;
          if (a1[1] == *a1)
          {
            v35 = 0;
          }
          else
          {
            v35 = **a1;
            if (v35 == 69)
              goto LABEL_34;
          }
          if (v35 == 81)
            goto LABEL_34;
        }
      }
      if (*v31 == 81)
      {
        *a1 = (unsigned __int8 *)(v31 + 1);
        v33 = *((_BYTE *)a1 + 778);
        *((_BYTE *)a1 + 778) = 1;
        *((_BYTE *)a1 + 778) = v33;
        v45 = v34;
        if (!v34)
          goto LABEL_43;
        v31 = (char *)*a1;
        v32 = a1[1];
      }
      if (v32 == (unsigned __int8 *)v31 || *v31 != 118)
        goto LABEL_28;
      *a1 = (unsigned __int8 *)(v31 + 1);
LABEL_34:
      *((_QWORD *)&v44 + 1) = v21;
      v43 = 0;
      v36 = (char *)*a1;
      v37 = a1[1];
      if (*a1 == v37)
        goto LABEL_43;
      if (*v36 == 81)
      {
        *a1 = (unsigned __int8 *)(v36 + 1);
        v38 = *((_BYTE *)a1 + 778);
        *((_BYTE *)a1 + 778) = 1;
        *((_BYTE *)a1 + 778) = v38;
        v43 = v39;
        if (!v39)
          goto LABEL_43;
        v36 = (char *)*a1;
        v37 = a1[1];
      }
      if (v36 != (char *)v37 && *v36 == 69)
      {
        *a1 = (unsigned __int8 *)(v36 + 1);
        *((_QWORD *)&v42 + 1) = v21;
        v40 = (char *)*a1;
        if (*a1 != a1[1] && *v40 == 95)
        {
          *a1 = (unsigned __int8 *)(v40 + 1);
          v4 = v41;
LABEL_44:
          a1[98] = v12;
          return v4;
        }
      }
LABEL_43:
      v4 = 0;
      goto LABEL_44;
    case 0x6255:
      *a1 = (unsigned __int8 *)(v3 + 2);
      v6 = (char *)*a1;
      if (*a1 != a1[1] && *v6 == 95)
      {
        *a1 = (unsigned __int8 *)(v6 + 1);
        *((_BYTE *)v4 + 8) = 8;
        *(_WORD *)((char *)v4 + 9) = *(_WORD *)((_BYTE *)v4 + 9) & 0xF000 | 0x540;
        *v4 = off_1EA94EC30;
        v4[2] = "'block-literal'";
        v4[3] = 15;
        return v4;
      }
      break;
  }
  return 0;
}

void sub_1DED59ED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, ...)
{
  uint64_t v19;
  uint64_t v20;
  va_list va;

  va_start(va, a19);
  *(_QWORD *)(v19 + 784) = v20;
  _Unwind_Resume(a1);
}

_QWORD *`anonymous namespace'::itanium_demangle::IntegerLiteral::printLeft(_QWORD *result, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  const void *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  size_t v15;
  uint64_t v16;
  uint64_t v17;
  size_t v18;
  const void *v19;

  v3 = result;
  if (result[3] >= 4uLL)
  {
    ++*((_DWORD *)this + 8);
    v4 = *(_QWORD *)this;
    v5 = *((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v5 + 1;
    *(_BYTE *)(v4 + v5) = 40;
    v6 = v3[3];
    if (v6)
    {
      v7 = (const void *)v3[2];
      memcpy((void *)(*(_QWORD *)this + *((_QWORD *)this + 1)), v7, v6);
      *((_QWORD *)this + 1) += v6;
    }
    --*((_DWORD *)this + 8);
    v8 = *(_QWORD *)this;
    v9 = *((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v9 + 1;
    *(_BYTE *)(v8 + v9) = 41;
  }
  v10 = (_BYTE *)v3[4];
  if (*v10 == 110)
  {
    v11 = *(_QWORD *)this;
    v13 = (_QWORD *)((char *)this + 8);
    v12 = *((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v12 + 1;
    *(_BYTE *)(v11 + v12) = 45;
    v14 = v3[5];
    v15 = v14 - 1;
    if (v14 == 1)
      goto LABEL_11;
    v10 = (_BYTE *)(v3[4] + 1);
    v16 = *(_QWORD *)this;
    v17 = *((_QWORD *)this + 1);
  }
  else
  {
    v15 = v3[5];
    if (!v15)
      goto LABEL_11;
    v16 = *(_QWORD *)this;
    v13 = (_QWORD *)((char *)this + 8);
    v17 = *((_QWORD *)this + 1);
  }
  result = memcpy((void *)(v16 + v17), v10, v15);
  *v13 += v15;
LABEL_11:
  v18 = v3[3];
  if (v18 - 4 >= 0xFFFFFFFFFFFFFFFDLL)
  {
    v19 = (const void *)v3[2];
    result = memcpy((void *)(*(_QWORD *)this + *((_QWORD *)this + 1)), v19, v18);
    *((_QWORD *)this + 1) += v18;
  }
  return result;
}

void `anonymous namespace'::itanium_demangle::IntegerLiteral::~IntegerLiteral(_anonymous_namespace_::itanium_demangle::IntegerLiteral *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

void *`anonymous namespace'::itanium_demangle::BoolExpr::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  size_t v3;
  const char *v4;
  void *result;

  if (*(_BYTE *)(a1 + 11))
    v3 = 4;
  else
    v3 = 5;
  if (*(_BYTE *)(a1 + 11))
    v4 = "true";
  else
    v4 = "false";
  result = memcpy((void *)(*(_QWORD *)this + *((_QWORD *)this + 1)), v4, v3);
  *((_QWORD *)this + 1) += v3;
  return result;
}

void `anonymous namespace'::itanium_demangle::BoolExpr::~BoolExpr(_anonymous_namespace_::itanium_demangle::BoolExpr *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

void *`anonymous namespace'::itanium_demangle::FloatLiteralImpl<float>::printLeft(void *result, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  _BYTE *v11;
  char v12;
  int v14;
  size_t v15;
  _BYTE v16[5];
  char __str[8];
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (*((_QWORD *)result + 3) >= 8uLL)
  {
    v3 = 0;
    v4 = *((_QWORD *)result + 2);
    v5 = v16;
    v6 = MEMORY[0x1E0C80978];
    do
    {
      v7 = *(unsigned __int8 *)(v4 + v3);
      if ((*(char *)(v4 + v3) & 0x80000000) == 0 && (*(_DWORD *)(v6 + 4 * v7 + 60) & 0x400) != 0)
        v8 = -48;
      else
        v8 = -87;
      v9 = *(unsigned __int8 *)(v4 + v3 + 1);
      if ((*(char *)(v4 + v3 + 1) & 0x80000000) == 0 && (*(_DWORD *)(v6 + 4 * v9 + 60) & 0x400) != 0)
        v10 = -48;
      else
        v10 = -87;
      *++v5 = v9 + v10 + 16 * (v7 + v8);
      v3 += 2;
    }
    while (v3 != 8);
    if (v5 > &v16[1])
    {
      v11 = &v16[2];
      do
      {
        v12 = *(v11 - 1);
        *(v11 - 1) = *v5;
        *v5-- = v12;
      }
      while (v11++ < v5);
    }
    *(_QWORD *)__str = 0;
    v18 = 0;
    v19 = 0;
    result = (void *)snprintf(__str, 0x18uLL, "%af", *(float *)&v16[1]);
    if ((_DWORD)result)
    {
      v14 = (int)result;
      v15 = (int)result;
      result = memcpy((void *)(*a2 + a2[1]), __str, v15);
      a2[1] += v14;
    }
  }
  return result;
}

void `anonymous namespace'::itanium_demangle::FloatLiteralImpl<float>::~FloatLiteralImpl()
{
  JUMPOUT(0x1DF0EF2D4);
}

void *`anonymous namespace'::itanium_demangle::FloatLiteralImpl<double>::printLeft(void *result, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  char *v11;
  char v12;
  int v14;
  size_t v15;
  uint64_t v16;
  double v17;
  char __str[16];
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (*((_QWORD *)result + 3) >= 0x10uLL)
  {
    v3 = 0;
    v4 = *((_QWORD *)result + 2);
    v5 = (char *)&v16 + 7;
    v6 = MEMORY[0x1E0C80978];
    do
    {
      v7 = *(unsigned __int8 *)(v4 + v3);
      if ((*(char *)(v4 + v3) & 0x80000000) == 0 && (*(_DWORD *)(v6 + 4 * v7 + 60) & 0x400) != 0)
        v8 = -48;
      else
        v8 = -87;
      v9 = *(unsigned __int8 *)(v4 + v3 + 1);
      if ((*(char *)(v4 + v3 + 1) & 0x80000000) == 0 && (*(_DWORD *)(v6 + 4 * v9 + 60) & 0x400) != 0)
        v10 = -48;
      else
        v10 = -87;
      *++v5 = v9 + v10 + 16 * (v7 + v8);
      v3 += 2;
    }
    while (v3 != 16);
    if (v5 > (char *)&v17)
    {
      v11 = (char *)&v17 + 1;
      do
      {
        v12 = *(v11 - 1);
        *(v11 - 1) = *v5;
        *v5-- = v12;
      }
      while (v11++ < v5);
    }
    *(_OWORD *)__str = 0u;
    v19 = 0u;
    result = (void *)snprintf(__str, 0x20uLL, "%a", v17);
    if ((_DWORD)result)
    {
      v14 = (int)result;
      v15 = (int)result;
      result = memcpy((void *)(*a2 + a2[1]), __str, v15);
      a2[1] += v14;
    }
  }
  return result;
}

void `anonymous namespace'::itanium_demangle::FloatLiteralImpl<double>::~FloatLiteralImpl()
{
  JUMPOUT(0x1DF0EF2D4);
}

void *`anonymous namespace'::itanium_demangle::FloatLiteralImpl<long double>::printLeft(void *result, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  char *v11;
  char v12;
  int v14;
  size_t v15;
  uint64_t v16;
  long double v17;
  char __str[16];
  _WORD v19[13];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (*((_QWORD *)result + 3) >= 0x20uLL)
  {
    v3 = 0;
    v4 = *((_QWORD *)result + 2);
    v5 = (char *)&v16 + 7;
    v6 = MEMORY[0x1E0C80978];
    do
    {
      v7 = *(unsigned __int8 *)(v4 + v3);
      if ((*(char *)(v4 + v3) & 0x80000000) == 0 && (*(_DWORD *)(v6 + 4 * v7 + 60) & 0x400) != 0)
        v8 = -48;
      else
        v8 = -87;
      v9 = *(unsigned __int8 *)(v4 + v3 + 1);
      if ((*(char *)(v4 + v3 + 1) & 0x80000000) == 0 && (*(_DWORD *)(v6 + 4 * v9 + 60) & 0x400) != 0)
        v10 = -48;
      else
        v10 = -87;
      *++v5 = v9 + v10 + 16 * (v7 + v8);
      v3 += 2;
    }
    while (v3 != 32);
    if (v5 > (char *)&v17)
    {
      v11 = (char *)&v17 + 1;
      do
      {
        v12 = *(v11 - 1);
        *(v11 - 1) = *v5;
        *v5-- = v12;
      }
      while (v11++ < v5);
    }
    *(_OWORD *)__str = 0u;
    memset(v19, 0, sizeof(v19));
    result = (void *)snprintf(__str, 0x2AuLL, "%LaL", v17);
    if ((_DWORD)result)
    {
      v14 = (int)result;
      v15 = (int)result;
      result = memcpy((void *)(*a2 + a2[1]), __str, v15);
      a2[1] += v14;
    }
  }
  return result;
}

void `anonymous namespace'::itanium_demangle::FloatLiteralImpl<long double>::~FloatLiteralImpl()
{
  JUMPOUT(0x1DF0EF2D4);
}

_QWORD *`anonymous namespace'::itanium_demangle::StringLiteral::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4;
  _QWORD *result;

  *(_WORD *)(*(_QWORD *)this + *((_QWORD *)this + 1)) = 15394;
  *((_QWORD *)this + 1) += 2;
  v4 = *(_QWORD *)(a1 + 16);
  (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v4 + 32))(v4, this);
  if ((*(_WORD *)(v4 + 9) & 0xC0) != 0x40)
    (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v4 + 40))(v4, this);
  *(_WORD *)(*(_QWORD *)this + *((_QWORD *)this + 1)) = 8766;
  *((_QWORD *)this + 1) += 2;
  return result;
}

void `anonymous namespace'::itanium_demangle::StringLiteral::~StringLiteral(_anonymous_namespace_::itanium_demangle::StringLiteral *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

uint64_t `anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::ScopedTemplateParamList::ScopedTemplateParamList(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v5;

  v3 = (uint64_t)(*(_QWORD *)(a2 + 672) - *(_QWORD *)(a2 + 664)) >> 3;
  *(_QWORD *)a1 = a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_QWORD *)(a1 + 16) = a1 + 40;
  *(_QWORD *)(a1 + 24) = a1 + 40;
  *(_QWORD *)(a1 + 32) = a1 + 104;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  v5 = a1 + 16;
  return a1;
}

void sub_1DED5A760(_Unwind_Exception *exception_object)
{
  void *v1;
  void **v2;

  if (*v2 != v1)
    free(*v2);
  _Unwind_Resume(exception_object);
}

BOOL `anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::isTemplateParamDecl(uint64_t a1)
{
  _BYTE *v1;
  unint64_t v2;
  int v3;
  _BYTE *v5;
  BOOL v6;

  v1 = *(_BYTE **)a1;
  v2 = *(_QWORD *)(a1 + 8) - *(_QWORD *)a1;
  if (!v2 || *v1 != 84)
    return 0;
  if (v2 < 2)
    v3 = 0;
  else
    v3 = (char)v1[1];
  v5 = memchr("yptnk", v3, 5uLL);
  if (v5)
    v6 = v5 - "yptnk" == -1;
  else
    v6 = 1;
  return !v6;
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::parseTemplateParamDecl(uint64_t a1, const void **a2)
{
  _WORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  int v8;
  _anonymous_namespace_::BumpPointerAllocator *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  _anonymous_namespace_::BumpPointerAllocator *v14;
  _QWORD *v15;
  int v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  _QWORD *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE *v29;
  _BYTE *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39[2];
  uint64_t v40;

  v2 = *(_WORD **)a1;
  if (*(_QWORD *)(a1 + 8) - *(_QWORD *)a1 < 2uLL)
    return 0;
  if (*v2 == 31060)
  {
    *(_QWORD *)a1 = v2 + 1;
    v8 = *(_DWORD *)(a1 + 792);
    *(_DWORD *)(a1 + 792) = v8 + 1;
    v9 = (_anonymous_namespace_::BumpPointerAllocator *)(a1 + 808);
    *((_BYTE *)v10 + 8) = 33;
    *(_WORD *)((char *)v10 + 9) = *(_WORD *)((_BYTE *)v10 + 9) & 0xF000 | 0x540;
    *v10 = off_1EA94F9B0;
    *((_DWORD *)v10 + 3) = 0;
    *((_DWORD *)v10 + 4) = v8;
    v39[0] = (uint64_t)v10;
    if (a2)
    *((_BYTE *)v3 + 8) = 35;
    *(_WORD *)((char *)v3 + 9) = *(_WORD *)((_BYTE *)v3 + 9) & 0xF000 | 0x500;
    *v3 = off_1EA94FA20;
    v3[2] = v10;
  }
  else if (*v2 == 27476)
  {
    *(_QWORD *)a1 = v2 + 1;
    if (!v11)
      return 0;
    v12 = v11;
    v13 = *(_DWORD *)(a1 + 792);
    *(_DWORD *)(a1 + 792) = v13 + 1;
    v14 = (_anonymous_namespace_::BumpPointerAllocator *)(a1 + 808);
    *((_BYTE *)v15 + 8) = 33;
    *(_WORD *)((char *)v15 + 9) = *(_WORD *)((_BYTE *)v15 + 9) & 0xF000 | 0x540;
    *v15 = off_1EA94F9B0;
    *((_DWORD *)v15 + 3) = 0;
    *((_DWORD *)v15 + 4) = v13;
    v39[0] = (uint64_t)v15;
    if (a2)
    *((_BYTE *)v3 + 8) = 36;
    *(_WORD *)((char *)v3 + 9) = *(_WORD *)((_BYTE *)v3 + 9) & 0xF000 | 0x500;
    *v3 = off_1EA94FA90;
    v3[2] = v12;
    v3[3] = v15;
  }
  else
  {
    if (*v2 == 28244)
    {
      *(_QWORD *)a1 = v2 + 1;
      v16 = *(_DWORD *)(a1 + 796);
      *(_DWORD *)(a1 + 796) = v16 + 1;
      *((_BYTE *)v17 + 8) = 33;
      *(_WORD *)((char *)v17 + 9) = *(_WORD *)((_BYTE *)v17 + 9) & 0xF000 | 0x540;
      *v17 = off_1EA94F9B0;
      *((_DWORD *)v17 + 3) = 1;
      *((_DWORD *)v17 + 4) = v16;
      v39[0] = (uint64_t)v17;
      if (a2)
      if (v18)
      {
        v19 = v18;
        *((_BYTE *)v3 + 8) = 37;
        *(_WORD *)((char *)v3 + 9) = *(_WORD *)((_BYTE *)v3 + 9) & 0xF000 | 0x500;
        *v3 = off_1EA94FB00;
        v3[2] = v17;
        v3[3] = v19;
        return v3;
      }
      return 0;
    }
    if (*v2 != 29780)
    {
      if (*v2 == 28756)
      {
        *(_QWORD *)a1 = v2 + 1;
        if (v6)
        {
          v7 = v6;
          *((_BYTE *)v3 + 8) = 39;
          *(_WORD *)((char *)v3 + 9) = *(_WORD *)((_BYTE *)v3 + 9) & 0xF000 | 0x500;
          *v3 = off_1EA94FBE0;
          v3[2] = v7;
          return v3;
        }
      }
      return 0;
    }
    *(_QWORD *)a1 = v2 + 1;
    v20 = *(_DWORD *)(a1 + 800);
    *(_DWORD *)(a1 + 800) = v20 + 1;
    *((_BYTE *)v21 + 8) = 33;
    *(_WORD *)((char *)v21 + 9) = *(_WORD *)((_BYTE *)v21 + 9) & 0xF000 | 0x540;
    *v21 = off_1EA94F9B0;
    *((_DWORD *)v21 + 3) = 2;
    *((_DWORD *)v21 + 4) = v20;
    v39[0] = (uint64_t)v21;
    if (a2)
    v22 = (uint64_t)(*(_QWORD *)(a1 + 24) - *(_QWORD *)(a1 + 16)) >> 3;
    v29 = *(_BYTE **)a1;
    v30 = *(_BYTE **)(a1 + 8);
    do
    {
      if (v29 != v30 && *v29 == 69)
      {
        v33 = 0;
        goto LABEL_34;
      }
      if (!v38)
        goto LABEL_32;
      v29 = *(_BYTE **)a1;
      v30 = *(_BYTE **)(a1 + 8);
    }
    while (*(_BYTE **)a1 == v30 || *v29 != 81);
    *(_QWORD *)a1 = v29 + 1;
    v32 = *(_BYTE *)(a1 + 778);
    *(_BYTE *)(a1 + 778) = 1;
    *(_BYTE *)(a1 + 778) = v32;
    if (!v33 || (v29 = *(_BYTE **)a1, *(_QWORD *)a1 == *(_QWORD *)(a1 + 8)) || *v29 != 69)
    {
LABEL_32:
      v3 = 0;
      goto LABEL_35;
    }
LABEL_34:
    *(_QWORD *)a1 = v29 + 1;
    v36 = v35;
    *((_BYTE *)v3 + 8) = 38;
    *(_WORD *)((char *)v3 + 9) = *(_WORD *)((_BYTE *)v3 + 9) & 0xF000 | 0x500;
    *v3 = off_1EA94FB70;
    v3[2] = v21;
    v3[3] = v34;
    v3[4] = v36;
    v3[5] = v33;
LABEL_35:
  }
  return v3;
}

void sub_1DED5ACA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  char v10;
  va_list va;

  va_start(va, a9);
  *(_BYTE *)(v9 + 778) = v10;
  _Unwind_Resume(a1);
}

__n128 `anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::make<`anonymous namespace'::itanium_demangle::ClosureTypeName,`anonymous namespace'::itanium_demangle::NodeArray &,`anonymous namespace'::itanium_demangle::Node *&,`anonymous namespace'::itanium_demangle::NodeArray &,`anonymous namespace'::itanium_demangle::Node *&,std::string_view &>(uint64_t a1, __n128 *a2, uint64_t *a3, __int128 *a4, uint64_t *a5, __int128 *a6)
{
  _QWORD *v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __n128 result;
  __int128 v16;
  __int128 v17;

  v12 = *a3;
  *((_BYTE *)v11 + 8) = 52;
  v13 = *(_WORD *)((_BYTE *)v11 + 9) & 0xF000 | 0x540;
  v14 = *a5;
  *v11 = off_1EA94FC50;
  result = *a2;
  v16 = *a4;
  v17 = *a6;
  *(_WORD *)((char *)v11 + 9) = v13;
  *((__n128 *)v11 + 1) = result;
  v11[4] = v12;
  *(_OWORD *)(v11 + 5) = v16;
  v11[7] = v14;
  *((_OWORD *)v11 + 4) = v17;
  return result;
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::ScopedTemplateParamList::~ScopedTemplateParamList(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8;
  uint64_t v9;
  _QWORD *v11;

  v8 = a1[1];
  v9 = *(_QWORD *)(*a1 + 664);
  if (v8 > (*(_QWORD *)(*a1 + 672) - v9) >> 3)
    abort_message("%s:%d: %s", a2, a3, a4, a5, a6, a7, a8, (char)"/Library/Caches/com.apple.xbs/Sources/libcxx_os/libcxxabi/src/demangle/ItaniumDemangle.h");
  *(_QWORD *)(*a1 + 672) = v9 + 8 * v8;
  v11 = (_QWORD *)a1[2];
  if (v11 != a1 + 5)
    free(v11);
  return a1;
}

_QWORD *`anonymous namespace'::itanium_demangle::UnnamedTypeName::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  size_t v4;
  const void *v5;
  _QWORD *result;

  *(_QWORD *)(*(_QWORD *)this + *((_QWORD *)this + 1)) = 0x64656D616E6E7527;
  *((_QWORD *)this + 1) += 8;
  v4 = *(_QWORD *)(a1 + 24);
  if (v4)
  {
    v5 = *(const void **)(a1 + 16);
    memcpy((void *)(*(_QWORD *)this + *((_QWORD *)this + 1)), v5, v4);
    *((_QWORD *)this + 1) += v4;
  }
  *(_BYTE *)(*(_QWORD *)this + (*((_QWORD *)this + 1))++) = 39;
  return result;
}

void `anonymous namespace'::itanium_demangle::UnnamedTypeName::~UnnamedTypeName(_anonymous_namespace_::itanium_demangle::UnnamedTypeName *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

const void **`anonymous namespace'::itanium_demangle::PODSmallVector<`anonymous namespace'::itanium_demangle::Node *,8ul>::push_back(const void **result, uint64_t *size)
{
  const void **v3;
  char *v4;
  void *v5;
  uint64_t v6;
  const void **v7;
  _BYTE *v8;
  uint64_t v9;

  v3 = result;
  v4 = (char *)result[1];
  if (v4 == result[2])
  {
    v5 = (void *)*result;
    v6 = v4 - (_BYTE *)*v3;
    if (*v3 == v3 + 3)
    {
      result = (const void **)malloc_type_malloc(2 * v6, 0x2004093837F09uLL);
      if (!result)
        goto LABEL_11;
      v7 = result;
      v8 = v3[1];
      if (v8 != *v3)
        result = (const void **)memmove(result, *v3, v8 - (_BYTE *)*v3);
      *v3 = v7;
    }
    else
    {
      result = (const void **)malloc_type_realloc(v5, 2 * v6, 0x2004093837F09uLL);
      v7 = result;
      *v3 = result;
      if (!result)
LABEL_11:
        abort();
    }
    v4 = (char *)&v7[v6 >> 3];
    v3[1] = v4;
    v3[2] = &v7[v6 >> 2];
  }
  v9 = *size;
  v3[1] = v4 + 8;
  *(_QWORD *)v4 = v9;
  return result;
}

_DWORD *`anonymous namespace'::itanium_demangle::SyntheticTemplateParamName::printLeft(_DWORD *result, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  _DWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  unint64_t v13;
  BOOL v14;
  BOOL v15;
  _BYTE v16[21];
  uint64_t v17;

  v3 = result;
  v17 = *MEMORY[0x1E0C80C00];
  v4 = result[3];
  if (v4 == 2)
  {
    v5 = 3;
    v7 = (_QWORD *)((char *)this + 8);
    v10 = *(_QWORD *)this + *((_QWORD *)this + 1);
    *(_BYTE *)(v10 + 2) = 84;
    *(_WORD *)v10 = 21540;
  }
  else
  {
    if (v4 == 1)
    {
      v5 = 2;
      v6 = *(_QWORD *)this;
      v7 = (_QWORD *)((char *)this + 8);
      v8 = *((_QWORD *)this + 1);
      v9 = 20004;
    }
    else
    {
      if (v4)
        goto LABEL_9;
      v5 = 2;
      v6 = *(_QWORD *)this;
      v7 = (_QWORD *)((char *)this + 8);
      v8 = *((_QWORD *)this + 1);
      v9 = 21540;
    }
    *(_WORD *)(v6 + v8) = v9;
  }
  *v7 += v5;
LABEL_9:
  v11 = v3[4];
  if (v11)
  {
    v12 = 0;
    v13 = (v11 - 1);
    do
    {
      v16[v12-- + 20] = (v13 % 0xA) | 0x30;
      v14 = v13 >= 9;
      v15 = v13 == 9;
      v13 /= 0xAuLL;
    }
    while (!v15 && v14);
    if (v12)
    {
      result = memcpy((void *)(*(_QWORD *)this + *((_QWORD *)this + 1)), &v16[v12 + 21], -v12);
      *((_QWORD *)this + 1) -= v12;
    }
  }
  return result;
}

void `anonymous namespace'::itanium_demangle::SyntheticTemplateParamName::~SyntheticTemplateParamName(_anonymous_namespace_::itanium_demangle::SyntheticTemplateParamName *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

_QWORD *`anonymous namespace'::itanium_demangle::TypeTemplateParamDecl::printLeft(int a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  _QWORD *result;
  uint64_t v4;

  v4 = *(_QWORD *)this + *((_QWORD *)this + 1);
  *(_QWORD *)v4 = *(_QWORD *)"typename ";
  *(_BYTE *)(v4 + 8) = 32;
  *((_QWORD *)this + 1) += 9;
  return result;
}

uint64_t `anonymous namespace'::itanium_demangle::TypeTemplateParamDecl::printRight(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 16);
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 32))(v3);
  if ((*(_WORD *)(v3 + 9) & 0xC0) != 0x40)
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v3 + 40))(v3, a2);
  return result;
}

void `anonymous namespace'::itanium_demangle::TypeTemplateParamDecl::~TypeTemplateParamDecl(_anonymous_namespace_::itanium_demangle::TypeTemplateParamDecl *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

_QWORD *`anonymous namespace'::itanium_demangle::ConstrainedTypeTemplateParamDecl::printLeft(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  _QWORD *result;

  v3 = *(_QWORD *)(a1 + 16);
  (*(void (**)(uint64_t))(*(_QWORD *)v3 + 32))(v3);
  if ((*(_WORD *)(v3 + 9) & 0xC0) != 0x40)
    (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v3 + 40))(v3, a2);
  *(_BYTE *)(*a2 + a2[1]++) = 32;
  return result;
}

uint64_t `anonymous namespace'::itanium_demangle::ConstrainedTypeTemplateParamDecl::printRight(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 24);
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 32))(v3);
  if ((*(_WORD *)(v3 + 9) & 0xC0) != 0x40)
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v3 + 40))(v3, a2);
  return result;
}

void `anonymous namespace'::itanium_demangle::ConstrainedTypeTemplateParamDecl::~ConstrainedTypeTemplateParamDecl(_anonymous_namespace_::itanium_demangle::ConstrainedTypeTemplateParamDecl *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

uint64_t `anonymous namespace'::itanium_demangle::NonTypeTemplateParamDecl::printLeft(uint64_t a1, _QWORD *a2)
{
  uint64_t result;
  unsigned int v5;

  (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 24) + 32))(*(_QWORD *)(a1 + 24));
  result = *(_QWORD *)(a1 + 24);
  v5 = *(unsigned __int8 *)(result + 9);
  if ((v5 & 0xC0) != 0x80)
  {
    if (v5 < 0x40)
      return result;
    goto LABEL_5;
  }
  result = (**(uint64_t (***)(uint64_t, _QWORD *))result)(result, a2);
  if ((result & 1) == 0)
  {
LABEL_5:
    *(_BYTE *)(*a2 + a2[1]++) = 32;
  }
  return result;
}

uint64_t `anonymous namespace'::itanium_demangle::NonTypeTemplateParamDecl::printRight(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 16);
  (*(void (**)(uint64_t))(*(_QWORD *)v4 + 32))(v4);
  if ((*(_WORD *)(v4 + 9) & 0xC0) != 0x40)
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v4 + 40))(v4, a2);
  return (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), a2);
}

void `anonymous namespace'::itanium_demangle::NonTypeTemplateParamDecl::~NonTypeTemplateParamDecl(_anonymous_namespace_::itanium_demangle::NonTypeTemplateParamDecl *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

_QWORD *`anonymous namespace'::itanium_demangle::TemplateTemplateParamDecl::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  int v4;
  uint64_t v5;
  _QWORD *result;
  uint64_t v7;

  v4 = *((_DWORD *)this + 8);
  *((_DWORD *)this + 8) = 0;
  v5 = *(_QWORD *)this + *((_QWORD *)this + 1);
  *(_QWORD *)v5 = *(_QWORD *)"template<";
  *(_BYTE *)(v5 + 8) = 60;
  *((_QWORD *)this + 1) += 9;
  v7 = *(_QWORD *)this + *((_QWORD *)this + 1);
  *(_QWORD *)v7 = *(_QWORD *)"> typename ";
  *(_DWORD *)(v7 + 7) = 543518049;
  *((_QWORD *)this + 1) += 11;
  *((_DWORD *)this + 8) = v4;
  return result;
}

void sub_1DED5B498(_Unwind_Exception *a1)
{
  uint64_t v1;
  int v2;

  *(_DWORD *)(v1 + 32) = v2;
  _Unwind_Resume(a1);
}

uint64_t `anonymous namespace'::itanium_demangle::TemplateTemplateParamDecl::printRight(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a1 + 16);
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 32))(v4);
  if ((*(_WORD *)(v4 + 9) & 0xC0) != 0x40)
    result = (*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)v4 + 40))(v4, a2);
  if (*(_QWORD *)(a1 + 40))
  {
    v6 = *a2 + a2[1];
    *(_QWORD *)v6 = *(_QWORD *)" requires ";
    *(_WORD *)(v6 + 8) = 8307;
    a2[1] += 10;
    v7 = *(_QWORD *)(a1 + 40);
    result = (*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)v7 + 32))(v7, a2);
    if ((*(_WORD *)(v7 + 9) & 0xC0) != 0x40)
      return (*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)v7 + 40))(v7, a2);
  }
  return result;
}

void `anonymous namespace'::itanium_demangle::TemplateTemplateParamDecl::~TemplateTemplateParamDecl(_anonymous_namespace_::itanium_demangle::TemplateTemplateParamDecl *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

_QWORD *`anonymous namespace'::itanium_demangle::TemplateParamPackDecl::printLeft(uint64_t a1, _QWORD *a2)
{
  _QWORD *result;
  uint64_t v4;

  (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 16) + 32))(*(_QWORD *)(a1 + 16));
  v4 = *a2 + a2[1];
  *(_BYTE *)(v4 + 2) = 46;
  *(_WORD *)v4 = 11822;
  a2[1] += 3;
  return result;
}

uint64_t `anonymous namespace'::itanium_demangle::TemplateParamPackDecl::printRight(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 16) + 40))(*(_QWORD *)(a1 + 16));
}

void `anonymous namespace'::itanium_demangle::TemplateParamPackDecl::~TemplateParamPackDecl(_anonymous_namespace_::itanium_demangle::TemplateParamPackDecl *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

_QWORD *`anonymous namespace'::itanium_demangle::ClosureTypeName::printLeft(_QWORD *a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  _DWORD *v4;
  size_t v5;
  const void *v6;

  v4 = (_DWORD *)(*(_QWORD *)this + *((_QWORD *)this + 1));
  *(_DWORD *)((char *)v4 + 3) = 1633968749;
  *v4 = 1835101223;
  *((_QWORD *)this + 1) += 7;
  v5 = a1[9];
  if (v5)
  {
    v6 = (const void *)a1[8];
    memcpy((void *)(*(_QWORD *)this + *((_QWORD *)this + 1)), v6, v5);
    *((_QWORD *)this + 1) += v5;
  }
  *(_BYTE *)(*(_QWORD *)this + (*((_QWORD *)this + 1))++) = 39;
}

void `anonymous namespace'::itanium_demangle::ClosureTypeName::~ClosureTypeName(_anonymous_namespace_::itanium_demangle::ClosureTypeName *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

_QWORD *`anonymous namespace'::itanium_demangle::ClosureTypeName::printDeclarator(_QWORD *a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (a1[3])
  {
    v4 = *((_DWORD *)this + 8);
    *((_DWORD *)this + 8) = 0;
    *(_BYTE *)(*(_QWORD *)this + (*((_QWORD *)this + 1))++) = 60;
    *(_BYTE *)(*(_QWORD *)this + (*((_QWORD *)this + 1))++) = 62;
    *((_DWORD *)this + 8) = v4;
  }
  if (a1[4])
  {
    v5 = *(_QWORD *)this + *((_QWORD *)this + 1);
    *(_QWORD *)v5 = *(_QWORD *)" requires ";
    *(_WORD *)(v5 + 8) = 8307;
    *((_QWORD *)this + 1) += 10;
    v6 = a1[4];
    (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v6 + 32))(v6, this);
    if ((*(_WORD *)(v6 + 9) & 0xC0) != 0x40)
      (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v6 + 40))(v6, this);
    *(_BYTE *)(*(_QWORD *)this + (*((_QWORD *)this + 1))++) = 32;
  }
  ++*((_DWORD *)this + 8);
  v7 = *(_QWORD *)this;
  v8 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v8 + 1;
  *(_BYTE *)(v7 + v8) = 40;
  --*((_DWORD *)this + 8);
  v10 = *(_QWORD *)this;
  v11 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v11 + 1;
  *(_BYTE *)(v10 + v11) = 41;
  if (a1[7])
  {
    v12 = *(_QWORD *)this + *((_QWORD *)this + 1);
    *(_QWORD *)v12 = *(_QWORD *)" requires ";
    *(_WORD *)(v12 + 8) = 8307;
    *((_QWORD *)this + 1) += 10;
    v13 = a1[7];
    result = (_QWORD *)(*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v13 + 32))(v13, this);
    if ((*(_WORD *)(v13 + 9) & 0xC0) != 0x40)
      return (_QWORD *)(*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v13 + 40))(v13, this);
  }
  return result;
}

void sub_1DED5B914(_Unwind_Exception *a1)
{
  uint64_t v1;
  int v2;

  *(_DWORD *)(v1 + 32) = v2;
  _Unwind_Resume(a1);
}

_QWORD *`anonymous namespace'::itanium_demangle::LambdaExpr::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4;
  _QWORD *result;
  uint64_t v6;

  *(_WORD *)(*(_QWORD *)this + *((_QWORD *)this + 1)) = 23899;
  *((_QWORD *)this + 1) += 2;
  v4 = *(_QWORD *)(a1 + 16);
  if (*(_BYTE *)(v4 + 8) == 52)
  v6 = *(_QWORD *)this + *((_QWORD *)this + 1);
  *(_BYTE *)(v6 + 4) = 125;
  *(_DWORD *)v6 = 774778491;
  *((_QWORD *)this + 1) += 5;
  return result;
}

void `anonymous namespace'::itanium_demangle::LambdaExpr::~LambdaExpr(_anonymous_namespace_::itanium_demangle::LambdaExpr *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

void *`anonymous namespace'::itanium_demangle::EnumLiteral::printLeft(_QWORD *a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *result;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  size_t v14;
  uint64_t v15;
  void *v16;
  const void *v17;

  ++*((_DWORD *)this + 8);
  v4 = *(_QWORD *)this;
  v5 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v5 + 1;
  *(_BYTE *)(v4 + v5) = 40;
  v6 = a1[2];
  (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v6 + 32))(v6, this);
  if ((*(_WORD *)(v6 + 9) & 0xC0) != 0x40)
    (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v6 + 40))(v6, this);
  --*((_DWORD *)this + 8);
  v8 = *(_QWORD *)this;
  v9 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v9 + 1;
  *(_BYTE *)(v8 + v9) = 41;
  v10 = (_BYTE *)a1[3];
  if (*v10 == 110)
  {
    v11 = *(_QWORD *)this;
    v12 = *((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v12 + 1;
    *(_BYTE *)(v11 + v12) = 45;
    v13 = a1[4];
    v14 = v13 - 1;
    if (v13 == 1)
      return result;
    v15 = a1[3] + 1;
    v16 = (void *)(*(_QWORD *)this + *((_QWORD *)this + 1));
    v17 = (const void *)v15;
  }
  else
  {
    v14 = a1[4];
    if (!v14)
      return result;
    v16 = (void *)(*(_QWORD *)this + *((_QWORD *)this + 1));
    v17 = v10;
  }
  result = memcpy(v16, v17, v14);
  *((_QWORD *)this + 1) += v14;
  return result;
}

void `anonymous namespace'::itanium_demangle::EnumLiteral::~EnumLiteral(_anonymous_namespace_::itanium_demangle::EnumLiteral *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

void *`anonymous namespace'::itanium_demangle::FunctionParam::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  void *result;
  size_t v5;
  const void *v6;

  *(_WORD *)(*(_QWORD *)this + *((_QWORD *)this + 1)) = 28774;
  *((_QWORD *)this + 1) += 2;
  v5 = *(_QWORD *)(a1 + 24);
  if (v5)
  {
    v6 = *(const void **)(a1 + 16);
    result = memcpy((void *)(*(_QWORD *)this + *((_QWORD *)this + 1)), v6, v5);
    *((_QWORD *)this + 1) += v5;
  }
  return result;
}

void `anonymous namespace'::itanium_demangle::FunctionParam::~FunctionParam(_anonymous_namespace_::itanium_demangle::FunctionParam *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

_QWORD *`anonymous namespace'::itanium_demangle::FoldExpr::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  const void *v13;
  uint64_t v14;
  size_t v15;
  const void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *result;
  uint64_t v23;
  uint64_t v24;
  uint64_t (**v25)();
  char v26;
  __int16 v27;
  uint64_t v28;

  ++*((_DWORD *)this + 8);
  v4 = *(_QWORD *)this;
  v5 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v5 + 1;
  *(_BYTE *)(v4 + v5) = 40;
  if (*(_BYTE *)(a1 + 48))
  {
    v6 = *(_QWORD *)(a1 + 24);
    if (!v6)
      goto LABEL_8;
  }
  else
  {
    ++*((_DWORD *)this + 8);
    v7 = *(_QWORD *)this;
    v8 = *((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v8 + 1;
    *(_BYTE *)(v7 + v8) = 40;
    v9 = *(_QWORD *)(a1 + 16);
    v26 = 42;
    v27 = 1344;
    v25 = off_1EA94FE80;
    v28 = v9;
    --*((_DWORD *)this + 8);
    v10 = *(_QWORD *)this;
    v11 = *((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v11 + 1;
    *(_BYTE *)(v10 + v11) = 41;
  }
  *(_BYTE *)(*(_QWORD *)this + (*((_QWORD *)this + 1))++) = 32;
  v12 = *(_QWORD *)(a1 + 40);
  if (v12)
  {
    v13 = *(const void **)(a1 + 32);
    memcpy((void *)(*(_QWORD *)this + *((_QWORD *)this + 1)), v13, v12);
    *((_QWORD *)this + 1) += v12;
  }
  *(_BYTE *)(*(_QWORD *)this + (*((_QWORD *)this + 1))++) = 32;
LABEL_8:
  v14 = *(_QWORD *)this + *((_QWORD *)this + 1);
  *(_BYTE *)(v14 + 2) = 46;
  *(_WORD *)v14 = 11822;
  *((_QWORD *)this + 1) += 3;
  if (*(_BYTE *)(a1 + 48) || *(_QWORD *)(a1 + 24))
  {
    *(_BYTE *)(*(_QWORD *)this + (*((_QWORD *)this + 1))++) = 32;
    v15 = *(_QWORD *)(a1 + 40);
    if (v15)
    {
      v16 = *(const void **)(a1 + 32);
      memcpy((void *)(*(_QWORD *)this + *((_QWORD *)this + 1)), v16, v15);
      *((_QWORD *)this + 1) += v15;
    }
    *(_BYTE *)(*(_QWORD *)this + (*((_QWORD *)this + 1))++) = 32;
    if (*(_BYTE *)(a1 + 48))
    {
      ++*((_DWORD *)this + 8);
      v17 = *(_QWORD *)this;
      v18 = *((_QWORD *)this + 1);
      *((_QWORD *)this + 1) = v18 + 1;
      *(_BYTE *)(v17 + v18) = 40;
      v19 = *(_QWORD *)(a1 + 16);
      v26 = 42;
      v27 = 1344;
      v25 = off_1EA94FE80;
      v28 = v19;
      --*((_DWORD *)this + 8);
      v20 = *(_QWORD *)this;
      v21 = *((_QWORD *)this + 1);
      *((_QWORD *)this + 1) = v21 + 1;
      *(_BYTE *)(v20 + v21) = 41;
    }
    else
    {
    }
  }
  --*((_DWORD *)this + 8);
  v23 = *(_QWORD *)this;
  v24 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v24 + 1;
  *(_BYTE *)(v23 + v24) = 41;
  return result;
}

void `anonymous namespace'::itanium_demangle::FoldExpr::~FoldExpr(_anonymous_namespace_::itanium_demangle::FoldExpr *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

_QWORD *`anonymous namespace'::itanium_demangle::ParameterPackExpansion::printLeft(uint64_t a1, uint64_t a2)
{
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *result;
  unsigned int v9;
  int i;
  uint64_t v11;
  uint64_t v12;

  v4 = *(_DWORD *)(a2 + 24);
  v5 = *(_DWORD *)(a2 + 28);
  *(_QWORD *)(a2 + 24) = -1;
  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a1 + 16);
  result = (_QWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v7 + 32))(v7);
  if ((*(_WORD *)(v7 + 9) & 0xC0) != 0x40)
    result = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v7 + 40))(v7, a2);
  v9 = *(_DWORD *)(a2 + 28);
  if (v9 == -1)
  {
    v12 = *(_QWORD *)a2 + *(_QWORD *)(a2 + 8);
    *(_BYTE *)(v12 + 2) = 46;
    *(_WORD *)v12 = 11822;
    v6 = *(_QWORD *)(a2 + 8) + 3;
    goto LABEL_12;
  }
  if (!v9)
  {
LABEL_12:
    *(_QWORD *)(a2 + 8) = v6;
    goto LABEL_13;
  }
  if (v9 >= 2)
  {
    for (i = 1; i != v9; ++i)
    {
      *(_WORD *)(*(_QWORD *)a2 + *(_QWORD *)(a2 + 8)) = 8236;
      *(_QWORD *)(a2 + 8) += 2;
      *(_DWORD *)(a2 + 24) = i;
      v11 = *(_QWORD *)(a1 + 16);
      result = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v11 + 32))(v11, a2);
      if ((*(_WORD *)(v11 + 9) & 0xC0) != 0x40)
        result = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v11 + 40))(v11, a2);
    }
  }
LABEL_13:
  *(_DWORD *)(a2 + 24) = v4;
  *(_DWORD *)(a2 + 28) = v5;
  return result;
}

void sub_1DED5C040(_Unwind_Exception *a1)
{
  uint64_t v1;
  int v2;
  int v3;

  *(_DWORD *)(v1 + 24) = v2;
  *(_DWORD *)(v1 + 28) = v3;
  _Unwind_Resume(a1);
}

void `anonymous namespace'::itanium_demangle::ParameterPackExpansion::~ParameterPackExpansion(_anonymous_namespace_::itanium_demangle::ParameterPackExpansion *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

uint64_t `anonymous namespace'::itanium_demangle::BracedExpr::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;

  v4 = *(unsigned __int8 *)(a1 + 32);
  v5 = *(_QWORD *)this;
  v6 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v6 + 1;
  if (v4)
  {
    *(_BYTE *)(v5 + v6) = 91;
    v7 = *(_QWORD *)(a1 + 16);
    (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v7 + 32))(v7, this);
    if ((*(_WORD *)(v7 + 9) & 0xC0) != 0x40)
      (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v7 + 40))(v7, this);
    v8 = *(_QWORD *)this;
    v9 = *((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v9 + 1;
    *(_BYTE *)(v8 + v9) = 93;
  }
  else
  {
    *(_BYTE *)(v5 + v6) = 46;
    v10 = *(_QWORD *)(a1 + 16);
    (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v10 + 32))(v10, this);
    if ((*(_WORD *)(v10 + 9) & 0xC0) != 0x40)
      (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v10 + 40))(v10, this);
  }
  v11 = *(_QWORD *)(a1 + 24);
  if (*(unsigned __int8 *)(v11 + 8) - 81 >= 2)
  {
    v12 = *(_QWORD *)this + *((_QWORD *)this + 1);
    *(_BYTE *)(v12 + 2) = 32;
    *(_WORD *)v12 = 15648;
    *((_QWORD *)this + 1) += 3;
    v11 = *(_QWORD *)(a1 + 24);
  }
  result = (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v11 + 32))(v11, this);
  if ((*(_WORD *)(v11 + 9) & 0xC0) != 0x40)
    return (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v11 + 40))(v11, this);
  return result;
}

void `anonymous namespace'::itanium_demangle::BracedExpr::~BracedExpr(_anonymous_namespace_::itanium_demangle::BracedExpr *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

uint64_t `anonymous namespace'::itanium_demangle::BracedRangeExpr::printLeft(_QWORD *a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
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
  uint64_t result;

  v4 = *(_QWORD *)this;
  v5 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v5 + 1;
  *(_BYTE *)(v4 + v5) = 91;
  v6 = a1[2];
  (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v6 + 32))(v6, this);
  if ((*(_WORD *)(v6 + 9) & 0xC0) != 0x40)
    (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v6 + 40))(v6, this);
  v7 = *(_QWORD *)this + *((_QWORD *)this + 1);
  *(_BYTE *)(v7 + 4) = 32;
  *(_DWORD *)v7 = 774778400;
  *((_QWORD *)this + 1) += 5;
  v8 = a1[3];
  (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v8 + 32))(v8, this);
  if ((*(_WORD *)(v8 + 9) & 0xC0) != 0x40)
    (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v8 + 40))(v8, this);
  v9 = *(_QWORD *)this;
  v10 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v10 + 1;
  *(_BYTE *)(v9 + v10) = 93;
  v11 = a1[4];
  if (*(unsigned __int8 *)(v11 + 8) - 81 >= 2)
  {
    v12 = *(_QWORD *)this + *((_QWORD *)this + 1);
    *(_BYTE *)(v12 + 2) = 32;
    *(_WORD *)v12 = 15648;
    *((_QWORD *)this + 1) += 3;
    v11 = a1[4];
  }
  result = (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v11 + 32))(v11, this);
  if ((*(_WORD *)(v11 + 9) & 0xC0) != 0x40)
    return (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v11 + 40))(v11, this);
  return result;
}

void `anonymous namespace'::itanium_demangle::BracedRangeExpr::~BracedRangeExpr(_anonymous_namespace_::itanium_demangle::BracedRangeExpr *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

_QWORD *`anonymous namespace'::itanium_demangle::InitListExpr::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *result;
  uint64_t v8;
  uint64_t v9;

  v4 = *(_QWORD *)(a1 + 16);
  if (v4)
  {
    (*(void (**)(_QWORD, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v4 + 32))(*(_QWORD *)(a1 + 16), this);
    if ((*(_WORD *)(v4 + 9) & 0xC0) != 0x40)
      (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v4 + 40))(v4, this);
  }
  v5 = *(_QWORD *)this;
  v6 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v6 + 1;
  *(_BYTE *)(v5 + v6) = 123;
  v8 = *(_QWORD *)this;
  v9 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v9 + 1;
  *(_BYTE *)(v8 + v9) = 125;
  return result;
}

void `anonymous namespace'::itanium_demangle::InitListExpr::~InitListExpr(_anonymous_namespace_::itanium_demangle::InitListExpr *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

_QWORD *`anonymous namespace'::itanium_demangle::PointerToMemberConversionExpr::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *result;
  uint64_t v13;
  uint64_t v14;

  ++*((_DWORD *)this + 8);
  v4 = *(_QWORD *)this;
  v5 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v5 + 1;
  *(_BYTE *)(v4 + v5) = 40;
  v6 = *(_QWORD *)(a1 + 16);
  (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v6 + 32))(v6, this);
  if ((*(_WORD *)(v6 + 9) & 0xC0) != 0x40)
    (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v6 + 40))(v6, this);
  --*((_DWORD *)this + 8);
  v7 = *(_QWORD *)this;
  v8 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v8 + 1;
  *(_BYTE *)(v7 + v8) = 41;
  ++*((_DWORD *)this + 8);
  v9 = *(_QWORD *)this;
  v10 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v10 + 1;
  *(_BYTE *)(v9 + v10) = 40;
  v11 = *(_QWORD *)(a1 + 24);
  (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v11 + 32))(v11, this);
  if ((*(_WORD *)(v11 + 9) & 0xC0) != 0x40)
    (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v11 + 40))(v11, this);
  --*((_DWORD *)this + 8);
  v13 = *(_QWORD *)this;
  v14 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v14 + 1;
  *(_BYTE *)(v13 + v14) = 41;
  return result;
}

void `anonymous namespace'::itanium_demangle::PointerToMemberConversionExpr::~PointerToMemberConversionExpr(_anonymous_namespace_::itanium_demangle::PointerToMemberConversionExpr *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

_QWORD *`anonymous namespace'::itanium_demangle::ExprRequirement::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *result;
  uint64_t v12;
  uint64_t v13;

  *(_BYTE *)(*(_QWORD *)this + (*((_QWORD *)this + 1))++) = 32;
  if (*(_BYTE *)(a1 + 24) || *(_QWORD *)(a1 + 32))
  {
    ++*((_DWORD *)this + 8);
    v4 = *(_QWORD *)this;
    v5 = *((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v5 + 1;
    *(_BYTE *)(v4 + v5) = 123;
  }
  v6 = *(_QWORD *)(a1 + 16);
  (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v6 + 32))(v6, this);
  if ((*(_WORD *)(v6 + 9) & 0xC0) != 0x40)
    (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v6 + 40))(v6, this);
  if (*(_BYTE *)(a1 + 24) || *(_QWORD *)(a1 + 32))
  {
    --*((_DWORD *)this + 8);
    v7 = *(_QWORD *)this;
    v8 = *((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v8 + 1;
    *(_BYTE *)(v7 + v8) = 125;
    if (*(_BYTE *)(a1 + 24))
    {
      v9 = *(_QWORD *)this + *((_QWORD *)this + 1);
      *(_QWORD *)v9 = *(_QWORD *)" noexcept";
      *(_BYTE *)(v9 + 8) = 116;
      *((_QWORD *)this + 1) += 9;
    }
  }
  if (*(_QWORD *)(a1 + 32))
  {
    *(_DWORD *)(*(_QWORD *)this + *((_QWORD *)this + 1)) = 540945696;
    *((_QWORD *)this + 1) += 4;
    v10 = *(_QWORD *)(a1 + 32);
    (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v10 + 32))(v10, this);
    if ((*(_WORD *)(v10 + 9) & 0xC0) != 0x40)
      (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v10 + 40))(v10, this);
  }
  v12 = *(_QWORD *)this;
  v13 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v13 + 1;
  *(_BYTE *)(v12 + v13) = 59;
  return result;
}

void `anonymous namespace'::itanium_demangle::ExprRequirement::~ExprRequirement(_anonymous_namespace_::itanium_demangle::ExprRequirement *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

_QWORD *`anonymous namespace'::itanium_demangle::TypeRequirement::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *result;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_QWORD *)this + *((_QWORD *)this + 1);
  *(_QWORD *)v4 = *(_QWORD *)" typename ";
  *(_WORD *)(v4 + 8) = 8293;
  *((_QWORD *)this + 1) += 10;
  v5 = *(_QWORD *)(a1 + 16);
  (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v5 + 32))(v5, this);
  if ((*(_WORD *)(v5 + 9) & 0xC0) != 0x40)
    (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v5 + 40))(v5, this);
  v7 = *(_QWORD *)this;
  v8 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v8 + 1;
  *(_BYTE *)(v7 + v8) = 59;
  return result;
}

void `anonymous namespace'::itanium_demangle::TypeRequirement::~TypeRequirement(_anonymous_namespace_::itanium_demangle::TypeRequirement *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

_QWORD *`anonymous namespace'::itanium_demangle::NestedRequirement::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *result;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_QWORD *)this + *((_QWORD *)this + 1);
  *(_QWORD *)v4 = *(_QWORD *)" requires ";
  *(_WORD *)(v4 + 8) = 8307;
  *((_QWORD *)this + 1) += 10;
  v5 = *(_QWORD *)(a1 + 16);
  (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v5 + 32))(v5, this);
  if ((*(_WORD *)(v5 + 9) & 0xC0) != 0x40)
    (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v5 + 40))(v5, this);
  v7 = *(_QWORD *)this;
  v8 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v8 + 1;
  *(_BYTE *)(v7 + v8) = 59;
  return result;
}

void `anonymous namespace'::itanium_demangle::NestedRequirement::~NestedRequirement(_anonymous_namespace_::itanium_demangle::NestedRequirement *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

_QWORD *`anonymous namespace'::itanium_demangle::RequiresExpr::printLeft(_QWORD *a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
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
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *result;
  uint64_t v21;
  uint64_t v22;

  *(_QWORD *)(*(_QWORD *)this + *((_QWORD *)this + 1)) = 0x7365726975716572;
  *((_QWORD *)this + 1) += 8;
  if (a1[3])
  {
    v4 = *(_QWORD *)this;
    v5 = *((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v5 + 1;
    *(_BYTE *)(v4 + v5) = 32;
    ++*((_DWORD *)this + 8);
    v6 = *(_QWORD *)this;
    v7 = *((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v7 + 1;
    *(_BYTE *)(v6 + v7) = 40;
    --*((_DWORD *)this + 8);
    v8 = *(_QWORD *)this;
    v9 = *((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v9 + 1;
    *(_BYTE *)(v8 + v9) = 41;
  }
  v10 = *(_QWORD *)this;
  v11 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v11 + 1;
  *(_BYTE *)(v10 + v11) = 32;
  ++*((_DWORD *)this + 8);
  v12 = *(_QWORD *)this;
  v13 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v13 + 1;
  *(_BYTE *)(v12 + v13) = 123;
  v14 = a1[5];
  if (v14)
  {
    v15 = (_QWORD *)a1[4];
    v16 = 8 * v14;
    do
    {
      v17 = *v15;
      (*(void (**)(_QWORD, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)*v15 + 32))(*v15, this);
      if ((*(_WORD *)(v17 + 9) & 0xC0) != 0x40)
        (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v17 + 40))(v17, this);
      ++v15;
      v16 -= 8;
    }
    while (v16);
  }
  v18 = *(_QWORD *)this;
  v19 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v19 + 1;
  *(_BYTE *)(v18 + v19) = 32;
  --*((_DWORD *)this + 8);
  v21 = *(_QWORD *)this;
  v22 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v22 + 1;
  *(_BYTE *)(v21 + v22) = 125;
  return result;
}

void `anonymous namespace'::itanium_demangle::RequiresExpr::~RequiresExpr(_anonymous_namespace_::itanium_demangle::RequiresExpr *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

_QWORD *`anonymous namespace'::itanium_demangle::SubobjectExpr::printLeft(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  size_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const void *v12;
  _QWORD *result;

  v4 = a1[3];
  (*(void (**)(uint64_t))(*(_QWORD *)v4 + 32))(v4);
  if ((*(_WORD *)(v4 + 9) & 0xC0) != 0x40)
    (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v4 + 40))(v4, a2);
  *(_WORD *)(*a2 + a2[1]) = 15406;
  a2[1] += 2;
  v5 = a1[2];
  (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v5 + 32))(v5, a2);
  if ((*(_WORD *)(v5 + 9) & 0xC0) != 0x40)
    (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v5 + 40))(v5, a2);
  v6 = *a2 + a2[1];
  *(_QWORD *)v6 = *(_QWORD *)" at offset ";
  *(_DWORD *)(v6 + 7) = 544499059;
  a2[1] += 11;
  v7 = a1[5];
  if (!v7)
  {
    v7 = 1;
    *(_BYTE *)(*a2 + a2[1]) = 48;
LABEL_12:
    a2[1] += v7;
    goto LABEL_13;
  }
  v8 = (_BYTE *)a1[4];
  if (*v8 != 110)
  {
    v11 = (void *)(*a2 + a2[1]);
    v12 = v8;
    goto LABEL_11;
  }
  *(_BYTE *)(*a2 + a2[1]++) = 45;
  v9 = a1[5];
  v7 = v9 - 1;
  if (v9 != 1)
  {
    v10 = a1[4] + 1;
    v11 = (void *)(*a2 + a2[1]);
    v12 = (const void *)v10;
LABEL_11:
    memcpy(v11, v12, v7);
    goto LABEL_12;
  }
LABEL_13:
  *(_BYTE *)(*a2 + a2[1]++) = 62;
  return result;
}

void `anonymous namespace'::itanium_demangle::SubobjectExpr::~SubobjectExpr(_anonymous_namespace_::itanium_demangle::SubobjectExpr *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

_QWORD *`anonymous namespace'::itanium_demangle::SizeofParamPackExpr::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (**v11)();
  char v12;
  __int16 v13;
  uint64_t v14;

  v4 = *(_QWORD *)this + *((_QWORD *)this + 1);
  *(_QWORD *)v4 = *(_QWORD *)"sizeof...";
  *(_BYTE *)(v4 + 8) = 46;
  *((_QWORD *)this + 1) += 9;
  ++*((_DWORD *)this + 8);
  v5 = *(_QWORD *)this;
  v6 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v6 + 1;
  *(_BYTE *)(v5 + v6) = 40;
  v7 = *(_QWORD *)(a1 + 16);
  v12 = 42;
  v13 = 1344;
  v11 = off_1EA94FE80;
  v14 = v7;
  --*((_DWORD *)this + 8);
  v9 = *(_QWORD *)this;
  v10 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v10 + 1;
  *(_BYTE *)(v9 + v10) = 41;
  return result;
}

void `anonymous namespace'::itanium_demangle::SizeofParamPackExpr::~SizeofParamPackExpr(_anonymous_namespace_::itanium_demangle::SizeofParamPackExpr *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

_QWORD *`anonymous namespace'::itanium_demangle::NodeArrayNode::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *a2)
{
}

void `anonymous namespace'::itanium_demangle::NodeArrayNode::~NodeArrayNode(_anonymous_namespace_::itanium_demangle::NodeArrayNode *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

uint64_t `anonymous namespace'::itanium_demangle::ThrowExpr::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v4 = *(_QWORD *)this + *((_QWORD *)this + 1);
  *(_WORD *)(v4 + 4) = 8311;
  *(_DWORD *)v4 = 1869768820;
  *((_QWORD *)this + 1) += 6;
  v5 = *(_QWORD *)(a1 + 16);
  result = (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v5 + 32))(v5, this);
  if ((*(_WORD *)(v5 + 9) & 0xC0) != 0x40)
    return (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v5 + 40))(v5, this);
  return result;
}

void `anonymous namespace'::itanium_demangle::ThrowExpr::~ThrowExpr(_anonymous_namespace_::itanium_demangle::ThrowExpr *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::parseUnresolvedType(const void **a1)
{
  int v2;
  _QWORD *v3;
  _QWORD *v5;
  _QWORD *v6;

  if (a1[1] == *a1)
  v2 = *(unsigned __int8 *)*a1;
  if (v2 == 68)
  {
    goto LABEL_7;
  }
  if (v2 != 84)
LABEL_7:
  v5 = v3;
  v6 = v3;
  if (v3)
  return v5;
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::parseSimpleId(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;

  if (v8 && a1[1] != *a1 && *(_BYTE *)*a1 == 73)
  {
    if (v9)
    {
      v10 = v9;
      *((_BYTE *)v11 + 8) = 45;
      *(_WORD *)((char *)v11 + 9) = *(_WORD *)((_BYTE *)v11 + 9) & 0xF000 | 0x540;
      *v11 = off_1EA950B30;
      v11[2] = v8;
      v11[3] = v10;
      return v11;
    }
    else
    {
      return 0;
    }
  }
  return v8;
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::parseBaseUnresolvedName(const void **a1)
{
  _WORD *v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  unint64_t v16;
  _QWORD *v17;
  _QWORD *v18;

  v2 = *a1;
  v3 = (char *)a1[1];
  if (v3 == *a1)
  {
    v4 = 0;
  }
  else
  {
    if (*(char *)v2 < 0)
      goto LABEL_6;
    v4 = *(unsigned __int8 *)v2;
  }
  if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v4 + 60) & 0x400) != 0)
LABEL_6:
  if ((unint64_t)(v3 - (_BYTE *)*a1) < 2)
    goto LABEL_10;
  if (*v2 == 28260)
  {
    v16 = (unint64_t)(v2 + 1);
    *a1 = (const void *)v16;
    if (v3 == (char *)v16)
    {
      v16 = 0;
    }
    else
    {
      LODWORD(v16) = *(char *)v16;
      if ((v16 & 0x80000000) != 0)
        goto LABEL_21;
      v16 = v16;
    }
    if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v16 + 60) & 0x400) != 0)
    {
LABEL_23:
      v18 = v17;
      if (v17)
      {
        *((_BYTE *)v11 + 8) = 50;
        *(_WORD *)((char *)v11 + 9) = *(_WORD *)((_BYTE *)v11 + 9) & 0xF000 | 0x540;
        *v11 = off_1EA9504A0;
        v11[2] = v18;
        return v11;
      }
      return 0;
    }
LABEL_21:
    goto LABEL_23;
  }
  if (*v2 == 28271)
    *a1 = v2 + 1;
LABEL_10:
  if (!v11 || a1[1] == *a1 || *(_BYTE *)*a1 != 73)
    return v11;
  if (!v12)
    return 0;
  v13 = v12;
  *((_BYTE *)v14 + 8) = 45;
  *(_WORD *)((char *)v14 + 9) = *(_WORD *)((_BYTE *)v14 + 9) & 0xF000 | 0x540;
  *v14 = off_1EA950B30;
  v14[2] = v11;
  v14[3] = v13;
  return v14;
}

uint64_t `anonymous namespace'::itanium_demangle::QualifiedName::printLeft(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v4 = *(_QWORD *)(a1 + 16);
  (*(void (**)(uint64_t))(*(_QWORD *)v4 + 32))(v4);
  if ((*(_WORD *)(v4 + 9) & 0xC0) != 0x40)
    (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v4 + 40))(v4, a2);
  *(_WORD *)(*a2 + a2[1]) = 14906;
  a2[1] += 2;
  v5 = *(_QWORD *)(a1 + 24);
  result = (*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)v5 + 32))(v5, a2);
  if ((*(_WORD *)(v5 + 9) & 0xC0) != 0x40)
    return (*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)v5 + 40))(v5, a2);
  return result;
}

uint64_t `anonymous namespace'::itanium_demangle::QualifiedName::getBaseName(_anonymous_namespace_::itanium_demangle::QualifiedName *this)
{
  return (*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 3) + 48))(*((_QWORD *)this + 3));
}

void `anonymous namespace'::itanium_demangle::QualifiedName::~QualifiedName(_anonymous_namespace_::itanium_demangle::QualifiedName *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::parseOperatorName(uint64_t a1, _BYTE *a2)
{
  unsigned __int8 *v4;
  unsigned int v5;
  char v6;
  int v7;
  BOOL v8;
  char v9;
  uint64_t v10;
  _QWORD *result;
  unsigned __int8 *v12;
  unsigned __int8 *v13;
  _QWORD *v14;
  uint64_t (**v15)();
  const char *v16;
  size_t v17;

  if (!v4)
  {
    v12 = *(unsigned __int8 **)a1;
    v13 = *(unsigned __int8 **)(a1 + 8);
    if ((unint64_t)&v13[-*(_QWORD *)a1] >= 2 && *(_WORD *)v12 == 26988)
    {
      *(_QWORD *)a1 = v12 + 2;
      if (!result)
        return result;
      v14 = result;
      *((_BYTE *)result + 8) = 20;
      *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
      v15 = off_1EA950580;
    }
    else
    {
      if (v12 == v13)
        return 0;
      if (*v12 != 118)
        return 0;
      *(_QWORD *)a1 = v12 + 1;
      if (v13 == v12 + 1 || v12[1] - 48 > 9)
        return 0;
      *(_QWORD *)a1 = v12 + 2;
      if (!result)
        return result;
      v14 = result;
      *((_BYTE *)result + 8) = 4;
      *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
      v15 = off_1EA950510;
    }
    *result = v15;
    result[2] = v14;
    return result;
  }
  v5 = v4[2];
  if (v5 != 8)
  {
    if (v5 <= 0xA && (v5 != 4 || (v4[3] & 1) != 0))
    {
      v16 = (const char *)*((_QWORD *)v4 + 1);
      v17 = strlen(v16);
      *((_BYTE *)result + 8) = 8;
      *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
      *result = off_1EA94EC30;
      result[2] = v16;
      result[3] = v17;
      return result;
    }
    return 0;
  }
  v6 = *(_BYTE *)(a1 + 776);
  *(_BYTE *)(a1 + 776) = 0;
  v7 = *(unsigned __int8 *)(a1 + 777);
  if (a2)
    v8 = 0;
  else
    v8 = v7 == 0;
  v9 = !v8;
  *(_BYTE *)(a1 + 777) = v9;
  if (v10)
  {
    if (a2)
      *a2 = 1;
    *((_BYTE *)result + 8) = 4;
    *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
    *result = off_1EA950510;
    result[2] = v10;
  }
  else
  {
    result = 0;
  }
  *(_BYTE *)(a1 + 777) = v7;
  *(_BYTE *)(a1 + 776) = v6;
  return result;
}

void sub_1DED5D504(_Unwind_Exception *a1)
{
  uint64_t v1;
  char v2;
  char v3;

  *(_BYTE *)(v1 + 777) = v3;
  *(_BYTE *)(v1 + 776) = v2;
  _Unwind_Resume(a1);
}

uint64_t `anonymous namespace'::itanium_demangle::DtorName::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  *(_BYTE *)(*(_QWORD *)this + (*((_QWORD *)this + 1))++) = 126;
  return (*(uint64_t (**)(_QWORD, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(**(_QWORD **)(a1 + 16) + 32))(*(_QWORD *)(a1 + 16), this);
}

void `anonymous namespace'::itanium_demangle::DtorName::~DtorName(_anonymous_namespace_::itanium_demangle::DtorName *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

uint64_t `anonymous namespace'::itanium_demangle::ConversionOperatorType::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v4 = *(_QWORD *)this + *((_QWORD *)this + 1);
  *(_QWORD *)v4 = *(_QWORD *)"operator ";
  *(_BYTE *)(v4 + 8) = 32;
  *((_QWORD *)this + 1) += 9;
  v5 = *(_QWORD *)(a1 + 16);
  result = (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v5 + 32))(v5, this);
  if ((*(_WORD *)(v5 + 9) & 0xC0) != 0x40)
    return (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v5 + 40))(v5, this);
  return result;
}

void `anonymous namespace'::itanium_demangle::ConversionOperatorType::~ConversionOperatorType(_anonymous_namespace_::itanium_demangle::ConversionOperatorType *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

uint64_t `anonymous namespace'::itanium_demangle::LiteralOperator::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v4 = *(_QWORD *)this + *((_QWORD *)this + 1);
  *(_QWORD *)v4 = *(_QWORD *)"operator\"\" ";
  *(_DWORD *)(v4 + 7) = 539107954;
  *((_QWORD *)this + 1) += 11;
  v5 = *(_QWORD *)(a1 + 16);
  result = (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v5 + 32))(v5, this);
  if ((*(_WORD *)(v5 + 9) & 0xC0) != 0x40)
    return (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v5 + 40))(v5, this);
  return result;
}

void `anonymous namespace'::itanium_demangle::LiteralOperator::~LiteralOperator(_anonymous_namespace_::itanium_demangle::LiteralOperator *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

uint64_t `anonymous namespace'::itanium_demangle::GlobalQualifiedName::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4;
  uint64_t result;

  *(_WORD *)(*(_QWORD *)this + *((_QWORD *)this + 1)) = 14906;
  *((_QWORD *)this + 1) += 2;
  v4 = *(_QWORD *)(a1 + 16);
  result = (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v4 + 32))(v4, this);
  if ((*(_WORD *)(v4 + 9) & 0xC0) != 0x40)
    return (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v4 + 40))(v4, this);
  return result;
}

uint64_t `anonymous namespace'::itanium_demangle::GlobalQualifiedName::getBaseName(_anonymous_namespace_::itanium_demangle::GlobalQualifiedName *this)
{
  return (*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 2) + 48))(*((_QWORD *)this + 2));
}

void `anonymous namespace'::itanium_demangle::GlobalQualifiedName::~GlobalQualifiedName(_anonymous_namespace_::itanium_demangle::GlobalQualifiedName *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::parseAbiTags(_QWORD *a1, _QWORD *a2)
{
  _BYTE *v3;
  _anonymous_namespace_::BumpPointerAllocator *v5;
  unsigned __int8 *v6;
  uint64_t v7;
  unsigned __int8 *v8;
  uint64_t v9;
  _QWORD *result;
  __int16 v11;

  v3 = (_BYTE *)*a1;
  if (*a1 != a1[1])
  {
    v5 = (_anonymous_namespace_::BumpPointerAllocator *)(a1 + 101);
    while (*v3 == 66)
    {
      *a1 = v3 + 1;
      if (!v7)
        return 0;
      v8 = v6;
      v9 = v7;
      v11 = *(_WORD *)((char *)a2 + 9);
      *((_BYTE *)result + 8) = 9;
      *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | v11 & 0xFC0;
      *result = off_1EA950740;
      result[2] = a2;
      result[3] = v8;
      result[4] = v9;
      v3 = (_BYTE *)*a1;
      a2 = result;
      if (*a1 == a1[1])
        return result;
    }
  }
  return a2;
}

void `anonymous namespace'::itanium_demangle::SpecialSubstitution::printLeft(_anonymous_namespace_::itanium_demangle::SpecialSubstitution *a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4;
  const void *v5;
  uint64_t v6;
  const void *v7;
  size_t v8;

  v4 = *(_QWORD *)this + *((_QWORD *)this + 1);
  *(_BYTE *)(v4 + 4) = 58;
  *(_DWORD *)v4 = 979661939;
  *((_QWORD *)this + 1) += 5;
  if (v6)
  {
    v7 = v5;
    v8 = v6;
    memcpy((void *)(*(_QWORD *)this + *((_QWORD *)this + 1)), v7, v8);
    *((_QWORD *)this + 1) += v8;
  }
}

void `anonymous namespace'::itanium_demangle::SpecialSubstitution::getBaseName(_anonymous_namespace_::itanium_demangle::SpecialSubstitution *this)
{
  __asm { BR              X12 }
}

const char *sub_1DED5D940()
{
  return "basic_string";
}

void `anonymous namespace'::itanium_demangle::SpecialSubstitution::~SpecialSubstitution(_anonymous_namespace_::itanium_demangle::SpecialSubstitution *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

void *`anonymous namespace'::itanium_demangle::ExpandedSpecialSubstitution::printLeft(_DWORD *a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4;
  void *result;
  uint64_t v6;
  const void *v7;
  size_t v8;

  v4 = *(_QWORD *)this + *((_QWORD *)this + 1);
  *(_BYTE *)(v4 + 4) = 58;
  *(_DWORD *)v4 = 979661939;
  *((_QWORD *)this + 1) += 5;
  result = (void *)(*(uint64_t (**)(_DWORD *))(*(_QWORD *)a1 + 48))(a1);
  if (v6)
  {
    v7 = result;
    v8 = v6;
    result = memcpy((void *)(*(_QWORD *)this + *((_QWORD *)this + 1)), v7, v8);
    *((_QWORD *)this + 1) += v8;
  }
  if (a1[3] >= 2u)
  {
    qmemcpy((void *)(*(_QWORD *)this + *((_QWORD *)this + 1)), "<char, std::char_traits<char>", 29);
    *((_QWORD *)this + 1) += 29;
    if (a1[3] == 2)
    {
      qmemcpy((void *)(*(_QWORD *)this + *((_QWORD *)this + 1)), ", std::allocator<char>", 22);
      *((_QWORD *)this + 1) += 22;
    }
    *(_BYTE *)(*(_QWORD *)this + (*((_QWORD *)this + 1))++) = 62;
  }
  return result;
}

char *`anonymous namespace'::itanium_demangle::ExpandedSpecialSubstitution::getBaseName(_anonymous_namespace_::itanium_demangle::ExpandedSpecialSubstitution *this)
{
  return off_1EA9515A0[*((int *)this + 3)];
}

void `anonymous namespace'::itanium_demangle::ExpandedSpecialSubstitution::~ExpandedSpecialSubstitution(_anonymous_namespace_::itanium_demangle::ExpandedSpecialSubstitution *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

unsigned __int8 *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::parseBareSourceName(uint64_t a1)
{
  char v2;
  unsigned __int8 *result;
  unint64_t v4;

  v4 = 0;
  result = 0;
  if ((v2 & 1) == 0)
  {
    result = *(unsigned __int8 **)a1;
    if (*(_QWORD *)(a1 + 8) - *(_QWORD *)a1 >= v4)
      *(_QWORD *)a1 = &result[v4];
    else
      return 0;
  }
  return result;
}

_QWORD *`anonymous namespace'::itanium_demangle::AbiTagAttr::printLeft(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  size_t v5;
  const void *v6;
  _QWORD *result;

  (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 16) + 32))(*(_QWORD *)(a1 + 16));
  v4 = *a2 + a2[1];
  *(_BYTE *)(v4 + 4) = 58;
  *(_DWORD *)v4 = 1768055131;
  a2[1] += 5;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v6 = *(const void **)(a1 + 24);
    memcpy((void *)(*a2 + a2[1]), v6, v5);
    a2[1] += v5;
  }
  *(_BYTE *)(*a2 + a2[1]++) = 93;
  return result;
}

uint64_t `anonymous namespace'::itanium_demangle::AbiTagAttr::getBaseName(_anonymous_namespace_::itanium_demangle::AbiTagAttr *this)
{
  return (*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 2) + 48))(*((_QWORD *)this + 2));
}

void `anonymous namespace'::itanium_demangle::AbiTagAttr::~AbiTagAttr(_anonymous_namespace_::itanium_demangle::AbiTagAttr *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

_QWORD *`anonymous namespace'::itanium_demangle::StructuredBindingName::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *result;
  uint64_t v7;
  uint64_t v8;

  ++*((_DWORD *)this + 8);
  v4 = *(_QWORD *)this;
  v5 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v5 + 1;
  *(_BYTE *)(v4 + v5) = 91;
  --*((_DWORD *)this + 8);
  v7 = *(_QWORD *)this;
  v8 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v8 + 1;
  *(_BYTE *)(v7 + v8) = 93;
  return result;
}

void `anonymous namespace'::itanium_demangle::StructuredBindingName::~StructuredBindingName(_anonymous_namespace_::itanium_demangle::StructuredBindingName *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

void *`anonymous namespace'::itanium_demangle::CtorDtorName::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  void *result;
  uint64_t v5;
  const void *v6;
  size_t v7;

  if (*(_BYTE *)(a1 + 24))
  {
    *(_BYTE *)(*(_QWORD *)this + (*((_QWORD *)this + 1))++) = 126;
  }
  result = (void *)(*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 16) + 48))(*(_QWORD *)(a1 + 16));
  if (v5)
  {
    v6 = result;
    v7 = v5;
    result = memcpy((void *)(*(_QWORD *)this + *((_QWORD *)this + 1)), v6, v7);
    *((_QWORD *)this + 1) += v7;
  }
  return result;
}

void `anonymous namespace'::itanium_demangle::CtorDtorName::~CtorDtorName(_anonymous_namespace_::itanium_demangle::CtorDtorName *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

uint64_t `anonymous namespace'::itanium_demangle::ModuleEntity::printLeft(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v4 = *(_QWORD *)(a1 + 24);
  (*(void (**)(uint64_t))(*(_QWORD *)v4 + 32))(v4);
  if ((*(_WORD *)(v4 + 9) & 0xC0) != 0x40)
    (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v4 + 40))(v4, a2);
  v5 = *a2;
  v6 = a2[1];
  a2[1] = v6 + 1;
  *(_BYTE *)(v5 + v6) = 64;
  v7 = *(_QWORD *)(a1 + 16);
  result = (*(uint64_t (**)(uint64_t, uint64_t *))(*(_QWORD *)v7 + 32))(v7, a2);
  if ((*(_WORD *)(v7 + 9) & 0xC0) != 0x40)
    return (*(uint64_t (**)(uint64_t, uint64_t *))(*(_QWORD *)v7 + 40))(v7, a2);
  return result;
}

uint64_t `anonymous namespace'::itanium_demangle::ModuleEntity::getBaseName(_anonymous_namespace_::itanium_demangle::ModuleEntity *this)
{
  return (*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 3) + 48))(*((_QWORD *)this + 3));
}

void `anonymous namespace'::itanium_demangle::ModuleEntity::~ModuleEntity(_anonymous_namespace_::itanium_demangle::ModuleEntity *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

uint64_t `anonymous namespace'::itanium_demangle::MemberLikeFriendName::printLeft(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  v4 = *(_QWORD *)(a1 + 16);
  (*(void (**)(uint64_t))(*(_QWORD *)v4 + 32))(v4);
  if ((*(_WORD *)(v4 + 9) & 0xC0) != 0x40)
    (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v4 + 40))(v4, a2);
  v5 = *a2 + a2[1];
  *(_QWORD *)v5 = *(_QWORD *)"::friend ";
  *(_BYTE *)(v5 + 8) = 32;
  a2[1] += 9;
  v6 = *(_QWORD *)(a1 + 24);
  result = (*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)v6 + 32))(v6, a2);
  if ((*(_WORD *)(v6 + 9) & 0xC0) != 0x40)
    return (*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)v6 + 40))(v6, a2);
  return result;
}

uint64_t `anonymous namespace'::itanium_demangle::MemberLikeFriendName::getBaseName(_anonymous_namespace_::itanium_demangle::MemberLikeFriendName *this)
{
  return (*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 3) + 48))(*((_QWORD *)this + 3));
}

void `anonymous namespace'::itanium_demangle::MemberLikeFriendName::~MemberLikeFriendName(_anonymous_namespace_::itanium_demangle::MemberLikeFriendName *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

uint64_t `anonymous namespace'::itanium_demangle::NestedName::printLeft(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v4 = *(_QWORD *)(a1 + 16);
  (*(void (**)(uint64_t))(*(_QWORD *)v4 + 32))(v4);
  if ((*(_WORD *)(v4 + 9) & 0xC0) != 0x40)
    (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v4 + 40))(v4, a2);
  *(_WORD *)(*a2 + a2[1]) = 14906;
  a2[1] += 2;
  v5 = *(_QWORD *)(a1 + 24);
  result = (*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)v5 + 32))(v5, a2);
  if ((*(_WORD *)(v5 + 9) & 0xC0) != 0x40)
    return (*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)v5 + 40))(v5, a2);
  return result;
}

uint64_t `anonymous namespace'::itanium_demangle::NestedName::getBaseName(_anonymous_namespace_::itanium_demangle::NestedName *this)
{
  return (*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 3) + 48))(*((_QWORD *)this + 3));
}

void `anonymous namespace'::itanium_demangle::NestedName::~NestedName(_anonymous_namespace_::itanium_demangle::NestedName *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

const char *`anonymous namespace'::itanium_demangle::parse_discriminator(const char *this, const char *a2, const char *a3)
{
  uint64_t v3;
  const char *v4;
  uint64_t v6;
  const char *v7;
  int v8;

  if (this != a2)
  {
    v3 = *(unsigned __int8 *)this;
    if (v3 == 95)
    {
      if (this + 1 != a2 && (this[1] & 0x80000000) == 0)
      {
        if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * *((unsigned __int8 *)this + 1) + 60) & 0x400) != 0)
        {
          this += 2;
        }
        else
        {
          v4 = this + 2;
          if (this[1] == 95 && v4 != a2)
          {
            while (1)
            {
              v6 = *(unsigned __int8 *)v4;
              if (*v4 < 0 || (*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v6 + 60) & 0x400) == 0)
                break;
              if (++v4 == a2)
                return this;
            }
            if ((_DWORD)v6 == 95)
              return v4 + 1;
          }
        }
      }
    }
    else if ((v3 & 0x80) == 0 && (*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v3 + 60) & 0x400) != 0)
    {
      v7 = this + 1;
      while (v7 != a2)
      {
        v8 = *v7;
        if ((v8 & 0x80000000) == 0)
        {
          ++v7;
          if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v8 + 60) & 0x400) != 0)
            continue;
        }
        return this;
      }
      return a2;
    }
  }
  return this;
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::make<`anonymous namespace'::itanium_demangle::NameType,char const(&)[15]>(uint64_t a1, const char *a2)
{
  _QWORD *v3;
  size_t v4;

  v4 = strlen(a2);
  *((_BYTE *)v3 + 8) = 8;
  *(_WORD *)((char *)v3 + 9) = *(_WORD *)((_BYTE *)v3 + 9) & 0xF000 | 0x540;
  *v3 = off_1EA94EC30;
  v3[2] = a2;
  v3[3] = v4;
  return v3;
}

uint64_t `anonymous namespace'::itanium_demangle::LocalName::printLeft(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v4 = *(_QWORD *)(a1 + 16);
  (*(void (**)(uint64_t))(*(_QWORD *)v4 + 32))(v4);
  if ((*(_WORD *)(v4 + 9) & 0xC0) != 0x40)
    (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v4 + 40))(v4, a2);
  *(_WORD *)(*a2 + a2[1]) = 14906;
  a2[1] += 2;
  v5 = *(_QWORD *)(a1 + 24);
  result = (*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)v5 + 32))(v5, a2);
  if ((*(_WORD *)(v5 + 9) & 0xC0) != 0x40)
    return (*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)v5 + 40))(v5, a2);
  return result;
}

void `anonymous namespace'::itanium_demangle::LocalName::~LocalName(_anonymous_namespace_::itanium_demangle::LocalName *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

uint64_t `anonymous namespace'::itanium_demangle::ParameterPack::hasRHSComponentSlow(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unsigned int v5;

  if (*(_DWORD *)(a2 + 28) == -1)
  {
    v2 = 0;
    v3 = *(_QWORD *)(a1 + 24);
    *(_DWORD *)(a2 + 24) = 0;
    *(_DWORD *)(a2 + 28) = v3;
  }
  else
  {
    v2 = *(unsigned int *)(a2 + 24);
    v3 = *(_QWORD *)(a1 + 24);
  }
  if (v3 <= v2)
    return 0;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8 * v2);
  v5 = *(unsigned __int8 *)(v4 + 9);
  if ((v5 & 0xC0) == 0x80)
    return (**(uint64_t (***)(uint64_t))v4)(v4);
  else
    return v5 < 0x40;
}

uint64_t `anonymous namespace'::itanium_demangle::ParameterPack::hasArraySlow(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  _BYTE *v4;
  int v5;

  if (*(_DWORD *)(a2 + 28) == -1)
  {
    v2 = 0;
    v3 = *(_QWORD *)(a1 + 24);
    *(_DWORD *)(a2 + 24) = 0;
    *(_DWORD *)(a2 + 28) = v3;
  }
  else
  {
    v2 = *(unsigned int *)(a2 + 24);
    v3 = *(_QWORD *)(a1 + 24);
  }
  if (v3 <= v2)
    return 0;
  v4 = *(_BYTE **)(*(_QWORD *)(a1 + 16) + 8 * v2);
  v5 = v4[10] & 3;
  if (v5 == 2)
    return (*(uint64_t (**)(_BYTE *))(*(_QWORD *)v4 + 8))(v4);
  else
    return v5 == 0;
}

uint64_t `anonymous namespace'::itanium_demangle::ParameterPack::hasFunctionSlow(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  int v5;

  if (*(_DWORD *)(a2 + 28) == -1)
  {
    v2 = 0;
    v3 = *(_QWORD *)(a1 + 24);
    *(_DWORD *)(a2 + 24) = 0;
    *(_DWORD *)(a2 + 28) = v3;
  }
  else
  {
    v2 = *(unsigned int *)(a2 + 24);
    v3 = *(_QWORD *)(a1 + 24);
  }
  if (v3 <= v2)
    return 0;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8 * v2);
  v5 = (*(unsigned __int16 *)(v4 + 9) >> 10) & 3;
  if (v5 == 2)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 16))(v4);
  else
    return v5 == 0;
}

uint64_t `anonymous namespace'::itanium_demangle::ParameterPack::getSyntaxNode(uint64_t result, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (*(_DWORD *)(a2 + 28) == -1)
  {
    v2 = 0;
    v3 = *(_QWORD *)(result + 24);
    *(_DWORD *)(a2 + 24) = 0;
    *(_DWORD *)(a2 + 28) = v3;
  }
  else
  {
    v2 = *(unsigned int *)(a2 + 24);
    v3 = *(_QWORD *)(result + 24);
  }
  if (v3 > v2)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(result + 16) + 8 * v2);
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 24))(v4);
  }
  return result;
}

uint64_t `anonymous namespace'::itanium_demangle::ParameterPack::printLeft(uint64_t result, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (*(_DWORD *)(a2 + 28) == -1)
  {
    v2 = 0;
    v3 = *(_QWORD *)(result + 24);
    *(_DWORD *)(a2 + 24) = 0;
    *(_DWORD *)(a2 + 28) = v3;
  }
  else
  {
    v2 = *(unsigned int *)(a2 + 24);
    v3 = *(_QWORD *)(result + 24);
  }
  if (v3 > v2)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(result + 16) + 8 * v2);
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 32))(v4);
  }
  return result;
}

uint64_t `anonymous namespace'::itanium_demangle::ParameterPack::printRight(uint64_t result, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (*(_DWORD *)(a2 + 28) == -1)
  {
    v2 = 0;
    v3 = *(_QWORD *)(result + 24);
    *(_DWORD *)(a2 + 24) = 0;
    *(_DWORD *)(a2 + 28) = v3;
  }
  else
  {
    v2 = *(unsigned int *)(a2 + 24);
    v3 = *(_QWORD *)(result + 24);
  }
  if (v3 > v2)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(result + 16) + 8 * v2);
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 40))(v4);
  }
  return result;
}

void `anonymous namespace'::itanium_demangle::ParameterPack::~ParameterPack(_anonymous_namespace_::itanium_demangle::ParameterPack *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

_QWORD *`anonymous namespace'::itanium_demangle::TemplateArgs::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  int v4;
  _QWORD *result;

  v4 = *((_DWORD *)this + 8);
  *((_DWORD *)this + 8) = 0;
  *(_BYTE *)(*(_QWORD *)this + (*((_QWORD *)this + 1))++) = 60;
  *(_BYTE *)(*(_QWORD *)this + (*((_QWORD *)this + 1))++) = 62;
  *((_DWORD *)this + 8) = v4;
  return result;
}

void sub_1DED5E5B8(_Unwind_Exception *a1)
{
  uint64_t v1;
  int v2;

  *(_DWORD *)(v1 + 32) = v2;
  _Unwind_Resume(a1);
}

void `anonymous namespace'::itanium_demangle::TemplateArgs::~TemplateArgs(_anonymous_namespace_::itanium_demangle::TemplateArgs *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

uint64_t `anonymous namespace'::itanium_demangle::NameWithTemplateArgs::printLeft(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v4 = *(_QWORD *)(a1 + 16);
  (*(void (**)(uint64_t))(*(_QWORD *)v4 + 32))(v4);
  if ((*(_WORD *)(v4 + 9) & 0xC0) != 0x40)
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v4 + 40))(v4, a2);
  v5 = *(_QWORD *)(a1 + 24);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v5 + 32))(v5, a2);
  if ((*(_WORD *)(v5 + 9) & 0xC0) != 0x40)
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v5 + 40))(v5, a2);
  return result;
}

uint64_t `anonymous namespace'::itanium_demangle::NameWithTemplateArgs::getBaseName(_anonymous_namespace_::itanium_demangle::NameWithTemplateArgs *this)
{
  return (*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 2) + 48))(*((_QWORD *)this + 2));
}

void `anonymous namespace'::itanium_demangle::NameWithTemplateArgs::~NameWithTemplateArgs(_anonymous_namespace_::itanium_demangle::NameWithTemplateArgs *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

_QWORD *`anonymous namespace'::itanium_demangle::TemplateArgumentPack::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *a2)
{
}

void `anonymous namespace'::itanium_demangle::TemplateArgumentPack::~TemplateArgumentPack(_anonymous_namespace_::itanium_demangle::TemplateArgumentPack *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

uint64_t `anonymous namespace'::itanium_demangle::TemplateParamQualifiedArg::printLeft(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 24);
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 32))(v3);
  if ((*(_WORD *)(v3 + 9) & 0xC0) != 0x40)
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v3 + 40))(v3, a2);
  return result;
}

void `anonymous namespace'::itanium_demangle::TemplateParamQualifiedArg::~TemplateParamQualifiedArg(_anonymous_namespace_::itanium_demangle::TemplateParamQualifiedArg *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

_QWORD *`anonymous namespace'::itanium_demangle::EnableIfAttr::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4;
  _QWORD *result;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)this + *((_QWORD *)this + 1);
  *(_QWORD *)v4 = *(_QWORD *)" [enable_if:";
  *(_DWORD *)(v4 + 8) = 979790175;
  *((_QWORD *)this + 1) += 12;
  v6 = *(_QWORD *)this;
  v7 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v7 + 1;
  *(_BYTE *)(v6 + v7) = 93;
  return result;
}

void `anonymous namespace'::itanium_demangle::EnableIfAttr::~EnableIfAttr(_anonymous_namespace_::itanium_demangle::EnableIfAttr *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

uint64_t `anonymous namespace'::itanium_demangle::ExplicitObjectParameter::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v4 = *(_QWORD *)this + *((_QWORD *)this + 1);
  *(_BYTE *)(v4 + 4) = 32;
  *(_DWORD *)v4 = 1936287860;
  *((_QWORD *)this + 1) += 5;
  v5 = *(_QWORD *)(a1 + 16);
  result = (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v5 + 32))(v5, this);
  if ((*(_WORD *)(v5 + 9) & 0xC0) != 0x40)
    return (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v5 + 40))(v5, this);
  return result;
}

void `anonymous namespace'::itanium_demangle::ExplicitObjectParameter::~ExplicitObjectParameter(_anonymous_namespace_::itanium_demangle::ExplicitObjectParameter *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

uint64_t `anonymous namespace'::itanium_demangle::FunctionEncoding::hasRHSComponentSlow()
{
  return 1;
}

uint64_t `anonymous namespace'::itanium_demangle::FunctionEncoding::hasFunctionSlow()
{
  return 1;
}

uint64_t `anonymous namespace'::itanium_demangle::FunctionEncoding::printLeft(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t result;

  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
    goto LABEL_7;
  (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v4 + 32))(v4, a2);
  v5 = *(_QWORD *)(a1 + 16);
  v6 = *(unsigned __int8 *)(v5 + 9);
  if ((v6 & 0xC0) != 0x80)
  {
    if (v6 < 0x40)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (((**(uint64_t (***)(uint64_t, _QWORD *))v5)(v5, a2) & 1) == 0)
  {
LABEL_6:
    *(_BYTE *)(*a2 + a2[1]++) = 32;
  }
LABEL_7:
  v7 = *(_QWORD *)(a1 + 24);
  result = (*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)v7 + 32))(v7, a2);
  if ((*(_WORD *)(v7 + 9) & 0xC0) != 0x40)
    return (*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)v7 + 40))(v7, a2);
  return result;
}

_QWORD *`anonymous namespace'::itanium_demangle::FunctionEncoding::printRight(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *result;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  ++*((_DWORD *)this + 8);
  v4 = *(_QWORD *)this;
  v5 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v5 + 1;
  *(_BYTE *)(v4 + v5) = 40;
  --*((_DWORD *)this + 8);
  v6 = *(_QWORD *)this;
  v7 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v7 + 1;
  *(_BYTE *)(v6 + v7) = 41;
  result = *(_QWORD **)(a1 + 16);
  if (result)
    result = (_QWORD *)(*(uint64_t (**)(_QWORD *, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*result + 40))(result, this);
  v9 = *(_DWORD *)(a1 + 64);
  if ((v9 & 1) != 0)
  {
    v13 = *(_QWORD *)this + *((_QWORD *)this + 1);
    *(_WORD *)(v13 + 4) = 29811;
    *(_DWORD *)v13 = 1852793632;
    *((_QWORD *)this + 1) += 6;
    v9 = *(_DWORD *)(a1 + 64);
    if ((v9 & 2) == 0)
    {
LABEL_5:
      if ((v9 & 4) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((v9 & 2) == 0)
  {
    goto LABEL_5;
  }
  v14 = *(_QWORD *)this + *((_QWORD *)this + 1);
  *(_QWORD *)v14 = *(_QWORD *)" volatile";
  *(_BYTE *)(v14 + 8) = 101;
  *((_QWORD *)this + 1) += 9;
  if ((*(_DWORD *)(a1 + 64) & 4) != 0)
  {
LABEL_6:
    v10 = *(_QWORD *)this + *((_QWORD *)this + 1);
    *(_QWORD *)v10 = *(_QWORD *)" restrict";
    *(_BYTE *)(v10 + 8) = 116;
    *((_QWORD *)this + 1) += 9;
  }
LABEL_7:
  v11 = *(unsigned __int8 *)(a1 + 68);
  if (v11 == 2)
  {
    v12 = 3;
    v15 = *(_QWORD *)this + *((_QWORD *)this + 1);
    *(_BYTE *)(v15 + 2) = 38;
    *(_WORD *)v15 = 9760;
    goto LABEL_14;
  }
  if (v11 == 1)
  {
    v12 = 2;
    *(_WORD *)(*(_QWORD *)this + *((_QWORD *)this + 1)) = 9760;
LABEL_14:
    *((_QWORD *)this + 1) += v12;
  }
  v16 = *(_QWORD *)(a1 + 48);
  if (v16)
  {
    result = (_QWORD *)(*(uint64_t (**)(_QWORD, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v16 + 32))(*(_QWORD *)(a1 + 48), this);
    if ((*(_WORD *)(v16 + 9) & 0xC0) != 0x40)
      result = (_QWORD *)(*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v16 + 40))(v16, this);
  }
  if (*(_QWORD *)(a1 + 56))
  {
    v17 = *(_QWORD *)this + *((_QWORD *)this + 1);
    *(_QWORD *)v17 = *(_QWORD *)" requires ";
    *(_WORD *)(v17 + 8) = 8307;
    *((_QWORD *)this + 1) += 10;
    v18 = *(_QWORD *)(a1 + 56);
    result = (_QWORD *)(*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v18 + 32))(v18, this);
    if ((*(_WORD *)(v18 + 9) & 0xC0) != 0x40)
      return (_QWORD *)(*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v18 + 40))(v18, this);
  }
  return result;
}

void `anonymous namespace'::itanium_demangle::FunctionEncoding::~FunctionEncoding(_anonymous_namespace_::itanium_demangle::FunctionEncoding *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

_QWORD *`anonymous namespace'::itanium_demangle::DotSuffix::printLeft(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  size_t v5;
  const void *v6;
  _QWORD *result;

  v4 = a1[2];
  (*(void (**)(uint64_t))(*(_QWORD *)v4 + 32))(v4);
  if ((*(_WORD *)(v4 + 9) & 0xC0) != 0x40)
    (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v4 + 40))(v4, a2);
  *(_WORD *)(*a2 + a2[1]) = 10272;
  a2[1] += 2;
  v5 = a1[4];
  if (v5)
  {
    v6 = (const void *)a1[3];
    memcpy((void *)(*a2 + a2[1]), v6, v5);
    a2[1] += v5;
  }
  *(_BYTE *)(*a2 + a2[1]++) = 41;
  return result;
}

void `anonymous namespace'::itanium_demangle::DotSuffix::~DotSuffix(_anonymous_namespace_::itanium_demangle::DotSuffix *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

void `anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::parseFunctionType(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  _BYTE *v9;
  _WORD *v10;
  _QWORD *v11;
  _BYTE *v12;
  unint64_t v13;
  _WORD *v14;
  _WORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  _WORD *v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  _BYTE *v30;
  uint64_t v31;
  char v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v10 = *(_WORD **)a1;
  v9 = *(_BYTE **)(a1 + 8);
  if ((unint64_t)&v9[-*(_QWORD *)a1] < 2)
  {
LABEL_2:
    v11 = 0;
    goto LABEL_12;
  }
  if (*v10 != 28484)
  {
    if (*v10 == 20292)
    {
      *(_QWORD *)a1 = v10 + 1;
      if (!v29)
        return;
      v30 = *(_BYTE **)a1;
      if (*(_QWORD *)a1 == *(_QWORD *)(a1 + 8) || *v30 != 69)
        return;
      v31 = v29;
      *(_QWORD *)a1 = v30 + 1;
      *((_BYTE *)v11 + 8) = 17;
      *(_WORD *)((char *)v11 + 9) = *(_WORD *)((_BYTE *)v11 + 9) & 0xF000 | 0x540;
      *v11 = off_1EA950E40;
      v11[2] = v31;
      goto LABEL_12;
    }
    if (*v10 == 30532)
    {
      v12 = v10 + 1;
      *(_QWORD *)a1 = v12;
      v13 = (uint64_t)(*(_QWORD *)(a1 + 24) - *(_QWORD *)(a1 + 16)) >> 3;
      while (v12 == v9 || *v12 != 69)
      {
        if (!v40)
          return;
        v12 = *(_BYTE **)a1;
        v9 = *(_BYTE **)(a1 + 8);
      }
      *(_QWORD *)a1 = v12 + 1;
      v39 = v38;
      *((_BYTE *)v11 + 8) = 18;
      *(_WORD *)((char *)v11 + 9) = *(_WORD *)((_BYTE *)v11 + 9) & 0xF000 | 0x540;
      *v11 = off_1EA950EB0;
      v11[2] = v37;
      v11[3] = v39;
      goto LABEL_12;
    }
    goto LABEL_2;
  }
  *(_QWORD *)a1 = v10 + 1;
LABEL_12:
  v14 = *(_WORD **)a1;
  v15 = *(_WORD **)(a1 + 8);
  if ((unint64_t)v15 - *(_QWORD *)a1 >= 2 && *v14 == 30788)
    *(_QWORD *)a1 = ++v14;
  if (v14 == v15 || *(_BYTE *)v14 != 70)
    return;
  *(_QWORD *)a1 = (char *)v14 + 1;
  if ((_WORD *)((char *)v14 + 1) != v15 && *((_BYTE *)v14 + 1) == 89)
    *(_QWORD *)a1 = v14 + 1;
  if (!v16)
    return;
  v23 = v16;
  v24 = (uint64_t)(*(_QWORD *)(a1 + 24) - *(_QWORD *)(a1 + 16)) >> 3;
  v25 = 1;
  while (1)
  {
    while (1)
    {
      v26 = *(_WORD **)a1;
      v27 = *(_QWORD *)(a1 + 8);
      if (*(_QWORD *)a1 == v27)
        goto LABEL_25;
      v28 = *(unsigned __int8 *)v26;
      if (v28 != 118)
        break;
      *(_QWORD *)a1 = (char *)v26 + 1;
    }
    if (v28 == 69)
    {
      v32 = 0;
      goto LABEL_39;
    }
LABEL_25:
    if ((unint64_t)(v27 - (_QWORD)v26) >= 2)
    {
      if (*v26 == 17746)
      {
        v32 = 1;
        v25 = 2;
        goto LABEL_39;
      }
      if (*v26 == 17743)
        break;
    }
    if (!v40)
      return;
  }
  v25 = 2;
  v32 = 2;
LABEL_39:
  *(_QWORD *)a1 = (char *)v26 + v25;
  v35 = v34;
  *((_BYTE *)v36 + 8) = 16;
  *(_WORD *)((char *)v36 + 9) = *(_WORD *)((_BYTE *)v36 + 9) & 0xF000 | 0x100;
  *v36 = off_1EA950F20;
  v36[2] = v23;
  v36[3] = v33;
  v36[4] = v35;
  *((_DWORD *)v36 + 10) = v8;
  *((_BYTE *)v36 + 44) = v32;
  v36[6] = v11;
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::parseQualifiedType(_QWORD *a1)
{
  _BYTE *v2;
  unsigned __int8 *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 *v11;
  unint64_t v12;
  BOOL v13;
  _QWORD *v14;
  int v15;
  _QWORD *v16;
  _QWORD *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;
  unsigned __int8 *v21;
  uint64_t v22;
  unsigned __int8 *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v28;

  v2 = (_BYTE *)*a1;
  if (*a1 == a1[1] || *v2 != 85)
  {
    if (v16 && v15)
    {
      v18 = *(_WORD *)((char *)v16 + 9);
      *((_BYTE *)v17 + 8) = 3;
      *(_WORD *)((char *)v17 + 9) = *(_WORD *)((_BYTE *)v17 + 9) & 0xF000 | v18 & 0xFC0;
      *v17 = off_1EA951070;
      *((_DWORD *)v17 + 3) = v15;
      v17[2] = v16;
      return v17;
    }
  }
  else
  {
    *a1 = v2 + 1;
    if (!v4)
      return 0;
    v11 = v3;
    v12 = v4;
    if (v4 < 9 || (*(_QWORD *)v3 == 0x746F7270636A626FLL ? (v13 = v3[8] == 111) : (v13 = 0), !v13))
    {
      if (a1[1] == *a1 || *(_BYTE *)*a1 != 73)
      {
        v14 = 0;
      }
      else
      {
        if (!v14)
          return 0;
      }
      if (v19)
      {
        v20 = v19;
        *((_BYTE *)v16 + 8) = 2;
        *(_WORD *)((char *)v16 + 9) = *(_WORD *)((_BYTE *)v16 + 9) & 0xF000 | 0x540;
        *v16 = off_1EA951000;
        v16[2] = v20;
        v16[3] = v11;
        v16[4] = v12;
        v16[5] = v14;
        return v16;
      }
      return 0;
    }
    v28 = *(_OWORD *)a1;
    *a1 = v3 + 9;
    a1[1] = &v3[v4];
    *(_OWORD *)a1 = v28;
    if (!v22)
      return 0;
    v23 = v21;
    v24 = v22;
    if (!v25)
      return 0;
    v26 = v25;
    *((_BYTE *)v16 + 8) = 11;
    *(_WORD *)((char *)v16 + 9) = *(_WORD *)((_BYTE *)v16 + 9) & 0xF000 | 0x540;
    *v16 = off_1EA950F90;
    v16[2] = v26;
    v16[3] = v23;
    v16[4] = v24;
  }
  return v16;
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::make<`anonymous namespace'::itanium_demangle::NameType,char const(&)[12]>(uint64_t a1, const char *a2)
{
  _QWORD *v3;
  size_t v4;

  v4 = strlen(a2);
  *((_BYTE *)v3 + 8) = 8;
  *(_WORD *)((char *)v3 + 9) = *(_WORD *)((_BYTE *)v3 + 9) & 0xF000 | 0x540;
  *v3 = off_1EA94EC30;
  v3[2] = a2;
  v3[3] = v4;
  return v3;
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::make<`anonymous namespace'::itanium_demangle::NameType,char const(&)[14]>(uint64_t a1, const char *a2)
{
  _QWORD *v3;
  size_t v4;

  v4 = strlen(a2);
  *((_BYTE *)v3 + 8) = 8;
  *(_WORD *)((char *)v3 + 9) = *(_WORD *)((_BYTE *)v3 + 9) & 0xF000 | 0x540;
  *v3 = off_1EA94EC30;
  v3[2] = a2;
  v3[3] = v4;
  return v3;
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::make<`anonymous namespace'::itanium_demangle::NameType,char const(&)[10]>(uint64_t a1, const char *a2)
{
  _QWORD *v3;
  size_t v4;

  v4 = strlen(a2);
  *((_BYTE *)v3 + 8) = 8;
  *(_WORD *)((char *)v3 + 9) = *(_WORD *)((_BYTE *)v3 + 9) & 0xF000 | 0x540;
  *v3 = off_1EA94EC30;
  v3[2] = a2;
  v3[3] = v4;
  return v3;
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::make<`anonymous namespace'::itanium_demangle::NameType,char const(&)[9]>(uint64_t a1, const char *a2)
{
  _QWORD *v3;
  size_t v4;

  v4 = strlen(a2);
  *((_BYTE *)v3 + 8) = 8;
  *(_WORD *)((char *)v3 + 9) = *(_WORD *)((_BYTE *)v3 + 9) & 0xF000 | 0x540;
  *v3 = off_1EA94EC30;
  v3[2] = a2;
  v3[3] = v4;
  return v3;
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::make<`anonymous namespace'::itanium_demangle::NameType,char const(&)[11]>(uint64_t a1, const char *a2)
{
  _QWORD *v3;
  size_t v4;

  v4 = strlen(a2);
  *((_BYTE *)v3 + 8) = 8;
  *(_WORD *)((char *)v3 + 9) = *(_WORD *)((_BYTE *)v3 + 9) & 0xF000 | 0x540;
  *v3 = off_1EA94EC30;
  v3[2] = a2;
  v3[3] = v4;
  return v3;
}

void `anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::parseVectorType(uint64_t a1)
{
  char *v1;
  char *v2;
  unsigned int v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _anonymous_namespace_::BumpPointerAllocator *v8;
  _QWORD *v9;
  char *v10;
  char *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;

  v1 = *(char **)a1;
  v2 = *(char **)(a1 + 8);
  if ((unint64_t)&v2[-*(_QWORD *)a1] < 2 || *(_WORD *)v1 != 30276)
    return;
  *(_QWORD *)a1 = v1 + 2;
  if (v2 == v1 + 2 || v1[2] < 49)
    goto LABEL_15;
  v4 = v1[2];
  if (v4 <= 0x39)
  {
    v7 = v6;
    v8 = (_anonymous_namespace_::BumpPointerAllocator *)(a1 + 808);
    *((_BYTE *)v9 + 8) = 8;
    *(_WORD *)((char *)v9 + 9) = *(_WORD *)((_BYTE *)v9 + 9) & 0xF000 | 0x540;
    *v9 = off_1EA94EC30;
    v9[2] = v5;
    v9[3] = v7;
    v10 = *(char **)a1;
    v11 = *(char **)(a1 + 8);
    if (*(char **)a1 != v11 && *v10 == 95)
    {
      v12 = v9;
      *(_QWORD *)a1 = v10 + 1;
      if (v10 + 1 == v11 || v10[1] != 112)
      {
        if (v23)
        {
          v24 = v23;
          *((_BYTE *)v25 + 8) = 29;
          *(_WORD *)((char *)v25 + 9) = *(_WORD *)((_BYTE *)v25 + 9) & 0xF000 | 0x540;
          *v25 = off_1EA951310;
          v25[2] = v24;
          v25[3] = v12;
        }
      }
      else
      {
        *(_QWORD *)a1 = v10 + 2;
        *((_BYTE *)v13 + 8) = 30;
        *(_WORD *)((char *)v13 + 9) = *(_WORD *)((_BYTE *)v13 + 9) & 0xF000 | 0x540;
        *v13 = off_1EA9512A0;
        v13[2] = v12;
      }
    }
    return;
  }
  if (v4 != 95)
  {
LABEL_15:
    if (v17)
    {
      v18 = *(char **)a1;
      if (*(_QWORD *)a1 != *(_QWORD *)(a1 + 8) && *v18 == 95)
      {
        v19 = v17;
        *(_QWORD *)a1 = v18 + 1;
        if (v20)
        {
          v21 = v20;
          *((_BYTE *)v22 + 8) = 29;
          *(_WORD *)((char *)v22 + 9) = *(_WORD *)((_BYTE *)v22 + 9) & 0xF000 | 0x540;
          *v22 = off_1EA951310;
          v22[2] = v21;
          v22[3] = v19;
        }
      }
    }
  }
  else
  {
    *(_QWORD *)a1 = v1 + 3;
    if (v14)
    {
      v15 = v14;
      *((_BYTE *)v16 + 8) = 29;
      *(_WORD *)((char *)v16 + 9) = *(_WORD *)((_BYTE *)v16 + 9) & 0xF000 | 0x540;
      *v16 = off_1EA951310;
      v16[2] = v15;
      v16[3] = 0;
    }
  }
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::parseClassEnumType(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _WORD *v9;
  _QWORD *result;
  const char *v11;
  uint64_t v12;
  _QWORD *v13;

  v9 = (_WORD *)*a1;
  if (a1[1] - *a1 < 2uLL)
  switch(*v9)
  {
    case 0x7354:
      v11 = "struct";
      v12 = 6;
      break;
    case 0x7554:
      v11 = "union";
      v12 = 5;
      break;
    case 0x6554:
      v11 = "enum";
      v12 = 4;
      break;
    default:
  }
  *a1 = v9 + 1;
  if (result)
  {
    v13 = result;
    *((_BYTE *)result + 8) = 6;
    *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
    *result = off_1EA951460;
    result[2] = v11;
    result[3] = v12;
    result[4] = v13;
  }
  return result;
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::make<`anonymous namespace'::itanium_demangle::PointerType,`anonymous namespace'::itanium_demangle::Node *&>(uint64_t a1, uint64_t *a2)
{
  _QWORD *result;
  uint64_t v4;
  char v5;

  v4 = *a2;
  v5 = *(_WORD *)(*a2 + 9);
  *((_BYTE *)result + 8) = 12;
  *(_WORD *)((char *)result + 9) = v5 & 0xC0 | *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x500;
  *result = off_1EA9514D0;
  result[2] = v4;
  return result;
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::make<`anonymous namespace'::itanium_demangle::ReferenceType,`anonymous namespace'::itanium_demangle::Node *&,`anonymous namespace'::itanium_demangle::ReferenceKind>(uint64_t a1, uint64_t *a2, int *a3)
{
  _QWORD *result;
  uint64_t v6;
  int v7;
  char v8;

  v6 = *a2;
  v7 = *a3;
  v8 = *(_WORD *)(*a2 + 9);
  *((_BYTE *)result + 8) = 13;
  *(_WORD *)((char *)result + 9) = v8 & 0xC0 | *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x500;
  *result = off_1EA951540;
  result[2] = v6;
  *((_DWORD *)result + 6) = v7;
  *((_BYTE *)result + 28) = 0;
  return result;
}

_QWORD *`anonymous namespace'::itanium_demangle::NoexceptSpec::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *result;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)(*(_QWORD *)this + *((_QWORD *)this + 1)) = 0x7470656378656F6ELL;
  *((_QWORD *)this + 1) += 8;
  ++*((_DWORD *)this + 8);
  v4 = *(_QWORD *)this;
  v5 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v5 + 1;
  *(_BYTE *)(v4 + v5) = 40;
  --*((_DWORD *)this + 8);
  v7 = *(_QWORD *)this;
  v8 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v8 + 1;
  *(_BYTE *)(v7 + v8) = 41;
  return result;
}

void `anonymous namespace'::itanium_demangle::NoexceptSpec::~NoexceptSpec(_anonymous_namespace_::itanium_demangle::NoexceptSpec *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

_QWORD *`anonymous namespace'::itanium_demangle::DynamicExceptionSpec::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *result;
  uint64_t v8;
  uint64_t v9;

  v4 = *(_QWORD *)this + *((_QWORD *)this + 1);
  *(_BYTE *)(v4 + 4) = 119;
  *(_DWORD *)v4 = 1869768820;
  *((_QWORD *)this + 1) += 5;
  ++*((_DWORD *)this + 8);
  v5 = *(_QWORD *)this;
  v6 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v6 + 1;
  *(_BYTE *)(v5 + v6) = 40;
  --*((_DWORD *)this + 8);
  v8 = *(_QWORD *)this;
  v9 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v9 + 1;
  *(_BYTE *)(v8 + v9) = 41;
  return result;
}

void `anonymous namespace'::itanium_demangle::DynamicExceptionSpec::~DynamicExceptionSpec(_anonymous_namespace_::itanium_demangle::DynamicExceptionSpec *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

uint64_t `anonymous namespace'::itanium_demangle::FunctionType::hasRHSComponentSlow()
{
  return 1;
}

uint64_t `anonymous namespace'::itanium_demangle::FunctionType::hasFunctionSlow()
{
  return 1;
}

_QWORD *`anonymous namespace'::itanium_demangle::FunctionType::printLeft(uint64_t a1, _QWORD *a2)
{
  _QWORD *result;

  (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 16) + 32))(*(_QWORD *)(a1 + 16));
  *(_BYTE *)(*a2 + a2[1]++) = 32;
  return result;
}

_QWORD *`anonymous namespace'::itanium_demangle::FunctionType::printRight(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *result;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  ++*((_DWORD *)this + 8);
  v4 = *(_QWORD *)this;
  v5 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v5 + 1;
  *(_BYTE *)(v4 + v5) = 40;
  --*((_DWORD *)this + 8);
  v6 = *(_QWORD *)this;
  v7 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v7 + 1;
  *(_BYTE *)(v6 + v7) = 41;
  result = (_QWORD *)(*(uint64_t (**)(_QWORD, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(**(_QWORD **)(a1 + 16) + 40))(*(_QWORD *)(a1 + 16), this);
  v9 = *(_DWORD *)(a1 + 40);
  if ((v9 & 1) != 0)
  {
    v13 = *(_QWORD *)this + *((_QWORD *)this + 1);
    *(_WORD *)(v13 + 4) = 29811;
    *(_DWORD *)v13 = 1852793632;
    *((_QWORD *)this + 1) += 6;
    v9 = *(_DWORD *)(a1 + 40);
    if ((v9 & 2) == 0)
    {
LABEL_3:
      if ((v9 & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((v9 & 2) == 0)
  {
    goto LABEL_3;
  }
  v14 = *(_QWORD *)this + *((_QWORD *)this + 1);
  *(_QWORD *)v14 = *(_QWORD *)" volatile";
  *(_BYTE *)(v14 + 8) = 101;
  *((_QWORD *)this + 1) += 9;
  if ((*(_DWORD *)(a1 + 40) & 4) != 0)
  {
LABEL_4:
    v10 = *(_QWORD *)this + *((_QWORD *)this + 1);
    *(_QWORD *)v10 = *(_QWORD *)" restrict";
    *(_BYTE *)(v10 + 8) = 116;
    *((_QWORD *)this + 1) += 9;
  }
LABEL_5:
  v11 = *(unsigned __int8 *)(a1 + 44);
  if (v11 == 2)
  {
    v12 = 3;
    v15 = *(_QWORD *)this + *((_QWORD *)this + 1);
    *(_BYTE *)(v15 + 2) = 38;
    *(_WORD *)v15 = 9760;
  }
  else
  {
    if (v11 != 1)
      goto LABEL_13;
    v12 = 2;
    *(_WORD *)(*(_QWORD *)this + *((_QWORD *)this + 1)) = 9760;
  }
  *((_QWORD *)this + 1) += v12;
LABEL_13:
  if (*(_QWORD *)(a1 + 48))
  {
    v16 = *(_QWORD *)this;
    v17 = *((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v17 + 1;
    *(_BYTE *)(v16 + v17) = 32;
    v18 = *(_QWORD *)(a1 + 48);
    result = (_QWORD *)(*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v18 + 32))(v18, this);
    if ((*(_WORD *)(v18 + 9) & 0xC0) != 0x40)
      return (_QWORD *)(*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v18 + 40))(v18, this);
  }
  return result;
}

void `anonymous namespace'::itanium_demangle::FunctionType::~FunctionType(_anonymous_namespace_::itanium_demangle::FunctionType *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

_QWORD *`anonymous namespace'::itanium_demangle::ObjCProtoName::printLeft(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  size_t v5;
  const void *v6;
  _QWORD *result;

  v4 = a1[2];
  (*(void (**)(uint64_t))(*(_QWORD *)v4 + 32))(v4);
  if ((*(_WORD *)(v4 + 9) & 0xC0) != 0x40)
    (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v4 + 40))(v4, a2);
  *(_BYTE *)(*a2 + a2[1]++) = 60;
  v5 = a1[4];
  if (v5)
  {
    v6 = (const void *)a1[3];
    memcpy((void *)(*a2 + a2[1]), v6, v5);
    a2[1] += v5;
  }
  *(_BYTE *)(*a2 + a2[1]++) = 62;
  return result;
}

void `anonymous namespace'::itanium_demangle::ObjCProtoName::~ObjCProtoName(_anonymous_namespace_::itanium_demangle::ObjCProtoName *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

void *`anonymous namespace'::itanium_demangle::VendorExtQualType::printLeft(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  void *result;
  size_t v6;
  const void *v7;
  uint64_t v8;

  v4 = a1[2];
  (*(void (**)(uint64_t))(*(_QWORD *)v4 + 32))(v4);
  if ((*(_WORD *)(v4 + 9) & 0xC0) != 0x40)
    (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v4 + 40))(v4, a2);
  *(_BYTE *)(*a2 + a2[1]++) = 32;
  v6 = a1[4];
  if (v6)
  {
    v7 = (const void *)a1[3];
    result = memcpy((void *)(*a2 + a2[1]), v7, v6);
    a2[1] += v6;
  }
  v8 = a1[5];
  if (v8)
  {
    result = (void *)(*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)v8 + 32))(v8, a2);
    if ((*(_WORD *)(v8 + 9) & 0xC0) != 0x40)
      return (void *)(*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)v8 + 40))(v8, a2);
  }
  return result;
}

void `anonymous namespace'::itanium_demangle::VendorExtQualType::~VendorExtQualType(_anonymous_namespace_::itanium_demangle::VendorExtQualType *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

uint64_t `anonymous namespace'::itanium_demangle::QualType::hasRHSComponentSlow(uint64_t a1)
{
  uint64_t v1;
  unsigned int v2;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = *(unsigned __int8 *)(v1 + 9);
  if ((v2 & 0xC0) == 0x80)
    return (**(uint64_t (***)(uint64_t))v1)(v1);
  else
    return v2 < 0x40;
}

uint64_t `anonymous namespace'::itanium_demangle::QualType::hasArraySlow(uint64_t a1)
{
  _BYTE *v1;
  int v2;

  v1 = *(_BYTE **)(a1 + 16);
  v2 = v1[10] & 3;
  if (v2 == 2)
    return (*(uint64_t (**)(_BYTE *))(*(_QWORD *)v1 + 8))(v1);
  else
    return v2 == 0;
}

uint64_t `anonymous namespace'::itanium_demangle::QualType::hasFunctionSlow(uint64_t a1)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = (*(unsigned __int16 *)(v1 + 9) >> 10) & 3;
  if (v2 == 2)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 16))(v1);
  else
    return v2 == 0;
}

_QWORD *`anonymous namespace'::itanium_demangle::QualType::printLeft(uint64_t a1, _QWORD *a2)
{
  _QWORD *result;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = (_QWORD *)(*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 16) + 32))(*(_QWORD *)(a1 + 16));
  v5 = *(_DWORD *)(a1 + 12);
  if ((v5 & 1) != 0)
  {
    v7 = *a2 + a2[1];
    *(_WORD *)(v7 + 4) = 29811;
    *(_DWORD *)v7 = 1852793632;
    a2[1] += 6;
    v5 = *(_DWORD *)(a1 + 12);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        return result;
      goto LABEL_4;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  v8 = *a2 + a2[1];
  *(_QWORD *)v8 = *(_QWORD *)" volatile";
  *(_BYTE *)(v8 + 8) = 101;
  a2[1] += 9;
  if ((*(_DWORD *)(a1 + 12) & 4) == 0)
    return result;
LABEL_4:
  v6 = *a2 + a2[1];
  *(_QWORD *)v6 = *(_QWORD *)" restrict";
  *(_BYTE *)(v6 + 8) = 116;
  a2[1] += 9;
  return result;
}

uint64_t `anonymous namespace'::itanium_demangle::QualType::printRight(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 16) + 40))(*(_QWORD *)(a1 + 16));
}

void `anonymous namespace'::itanium_demangle::QualType::~QualType(_anonymous_namespace_::itanium_demangle::QualType *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

_QWORD *`anonymous namespace'::itanium_demangle::TransformedType::printLeft(_QWORD *a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  size_t v4;
  const void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *result;
  uint64_t v10;
  uint64_t v11;

  v4 = a1[3];
  if (v4)
  {
    v5 = (const void *)a1[2];
    memcpy((void *)(*(_QWORD *)this + *((_QWORD *)this + 1)), v5, v4);
    *((_QWORD *)this + 1) += v4;
  }
  v6 = *(_QWORD *)this;
  v7 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v7 + 1;
  *(_BYTE *)(v6 + v7) = 40;
  v8 = a1[4];
  (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v8 + 32))(v8, this);
  if ((*(_WORD *)(v8 + 9) & 0xC0) != 0x40)
    (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v8 + 40))(v8, this);
  v10 = *(_QWORD *)this;
  v11 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v11 + 1;
  *(_BYTE *)(v10 + v11) = 41;
  return result;
}

void `anonymous namespace'::itanium_demangle::TransformedType::~TransformedType(_anonymous_namespace_::itanium_demangle::TransformedType *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

uint64_t `anonymous namespace'::itanium_demangle::BinaryFPType::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v4 = *(_QWORD *)this + *((_QWORD *)this + 1);
  *(_WORD *)(v4 + 4) = 29793;
  *(_DWORD *)v4 = 1869366879;
  *((_QWORD *)this + 1) += 6;
  v5 = *(_QWORD *)(a1 + 16);
  result = (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v5 + 32))(v5, this);
  if ((*(_WORD *)(v5 + 9) & 0xC0) != 0x40)
    return (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v5 + 40))(v5, this);
  return result;
}

void `anonymous namespace'::itanium_demangle::BinaryFPType::~BinaryFPType(_anonymous_namespace_::itanium_demangle::BinaryFPType *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

_QWORD *`anonymous namespace'::itanium_demangle::BitIntType::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4;
  _DWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *result;
  uint64_t v9;
  uint64_t v10;

  if (!*(_BYTE *)(a1 + 24))
  {
    v4 = *(_QWORD *)this + *((_QWORD *)this + 1);
    *(_QWORD *)v4 = *(_QWORD *)"unsigned ";
    *(_BYTE *)(v4 + 8) = 32;
    *((_QWORD *)this + 1) += 9;
  }
  v5 = (_DWORD *)(*(_QWORD *)this + *((_QWORD *)this + 1));
  *(_DWORD *)((char *)v5 + 3) = 1953384820;
  *v5 = 1953055327;
  *((_QWORD *)this + 1) += 7;
  ++*((_DWORD *)this + 8);
  v6 = *(_QWORD *)this;
  v7 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v7 + 1;
  *(_BYTE *)(v6 + v7) = 40;
  --*((_DWORD *)this + 8);
  v9 = *(_QWORD *)this;
  v10 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v10 + 1;
  *(_BYTE *)(v9 + v10) = 41;
  return result;
}

void `anonymous namespace'::itanium_demangle::BitIntType::~BitIntType(_anonymous_namespace_::itanium_demangle::BitIntType *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

void *`anonymous namespace'::itanium_demangle::PostfixQualifiedType::printLeft(uint64_t a1, _QWORD *a2)
{
  void *result;
  size_t v5;
  const void *v6;

  result = (void *)(*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 16) + 32))(*(_QWORD *)(a1 + 16));
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v6 = *(const void **)(a1 + 24);
    result = memcpy((void *)(*a2 + a2[1]), v6, v5);
    a2[1] += v5;
  }
  return result;
}

void `anonymous namespace'::itanium_demangle::PostfixQualifiedType::~PostfixQualifiedType(_anonymous_namespace_::itanium_demangle::PostfixQualifiedType *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

_QWORD *`anonymous namespace'::itanium_demangle::PixelVectorType::printLeft(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4;
  _QWORD *result;

  qmemcpy((void *)(*(_QWORD *)this + *((_QWORD *)this + 1)), "pixel vector[", 13);
  *((_QWORD *)this + 1) += 13;
  v4 = *(_QWORD *)(a1 + 16);
  (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v4 + 32))(v4, this);
  if ((*(_WORD *)(v4 + 9) & 0xC0) != 0x40)
    (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v4 + 40))(v4, this);
  *(_BYTE *)(*(_QWORD *)this + (*((_QWORD *)this + 1))++) = 93;
  return result;
}

void `anonymous namespace'::itanium_demangle::PixelVectorType::~PixelVectorType(_anonymous_namespace_::itanium_demangle::PixelVectorType *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

_QWORD *`anonymous namespace'::itanium_demangle::VectorType::printLeft(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *result;

  v4 = *(_QWORD *)(a1 + 16);
  (*(void (**)(uint64_t))(*(_QWORD *)v4 + 32))(v4);
  if ((*(_WORD *)(v4 + 9) & 0xC0) != 0x40)
    (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v4 + 40))(v4, a2);
  *(_QWORD *)(*a2 + a2[1]) = 0x5B726F7463657620;
  a2[1] += 8;
  v5 = *(_QWORD *)(a1 + 24);
  if (v5)
  {
    (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v5 + 32))(v5, a2);
    if ((*(_WORD *)(v5 + 9) & 0xC0) != 0x40)
      (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v5 + 40))(v5, a2);
  }
  *(_BYTE *)(*a2 + a2[1]++) = 93;
  return result;
}

void `anonymous namespace'::itanium_demangle::VectorType::~VectorType(_anonymous_namespace_::itanium_demangle::VectorType *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

uint64_t `anonymous namespace'::itanium_demangle::ArrayType::hasRHSComponentSlow()
{
  return 1;
}

uint64_t `anonymous namespace'::itanium_demangle::ArrayType::hasArraySlow()
{
  return 1;
}

uint64_t `anonymous namespace'::itanium_demangle::ArrayType::printLeft(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 16) + 32))(*(_QWORD *)(a1 + 16));
}

uint64_t `anonymous namespace'::itanium_demangle::ArrayType::printRight(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v11;

  v8 = *((_QWORD *)this + 1);
  if (!v8)
    abort_message("%s:%d: %s", (uint64_t)this, a3, a4, a5, a6, a7, a8, (char)"/Library/Caches/com.apple.xbs/Sources/libcxx_os/libcxxabi/src/demangle/Utility.h");
  if (*(_BYTE *)(v8 + *(_QWORD *)this - 1) != 93)
  {
    *(_BYTE *)(*(_QWORD *)this + (*((_QWORD *)this + 1))++) = 32;
  }
  *(_BYTE *)(*(_QWORD *)this + (*((_QWORD *)this + 1))++) = 91;
  v11 = *(_QWORD *)(a1 + 24);
  if (v11)
  {
    (*(void (**)(_QWORD, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v11 + 32))(*(_QWORD *)(a1 + 24), this);
    if ((*(_WORD *)(v11 + 9) & 0xC0) != 0x40)
      (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v11 + 40))(v11, this);
  }
  *(_BYTE *)(*(_QWORD *)this + (*((_QWORD *)this + 1))++) = 93;
  return (*(uint64_t (**)(_QWORD, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(**(_QWORD **)(a1 + 16) + 40))(*(_QWORD *)(a1 + 16), this);
}

void `anonymous namespace'::itanium_demangle::ArrayType::~ArrayType(_anonymous_namespace_::itanium_demangle::ArrayType *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

_QWORD *`anonymous namespace'::itanium_demangle::AbstractManglingParser<`anonymous namespace'::itanium_demangle::ManglingParser<`anonymous namespace'::DefaultAllocator>,`anonymous namespace'::DefaultAllocator>::make<`anonymous namespace'::itanium_demangle::PointerToMemberType,`anonymous namespace'::itanium_demangle::Node *&,`anonymous namespace'::itanium_demangle::Node *&>(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  _QWORD *result;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v6 = *a2;
  v7 = *a3;
  v8 = *(_WORD *)(*a3 + 9);
  *((_BYTE *)result + 8) = 14;
  *(_WORD *)((char *)result + 9) = v8 & 0xC0 | *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x500;
  *result = off_1EA9513F0;
  result[2] = v6;
  result[3] = v7;
  return result;
}

uint64_t `anonymous namespace'::itanium_demangle::PointerToMemberType::hasRHSComponentSlow(uint64_t a1)
{
  uint64_t v1;
  unsigned int v2;

  v1 = *(_QWORD *)(a1 + 24);
  v2 = *(unsigned __int8 *)(v1 + 9);
  if ((v2 & 0xC0) == 0x80)
    return (**(uint64_t (***)(uint64_t))v1)(v1);
  else
    return v2 < 0x40;
}

_QWORD *`anonymous namespace'::itanium_demangle::PointerToMemberType::printLeft(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  unsigned int v5;
  int v6;
  int v7;
  char v8;
  uint64_t v9;
  _QWORD *result;
  uint64_t v11;

  (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 24) + 32))(*(_QWORD *)(a1 + 24));
  v4 = *(_QWORD *)(a1 + 24);
  v5 = *(unsigned __int16 *)(v4 + 9);
  v6 = (v5 >> 8) & 3;
  if (!v6)
    goto LABEL_8;
  if (v6 == 2)
  {
    if (((*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)v4 + 8))(v4, a2) & 1) != 0)
    {
LABEL_8:
      v8 = 40;
      goto LABEL_10;
    }
    v4 = *(_QWORD *)(a1 + 24);
    v5 = *(unsigned __int16 *)(v4 + 9);
  }
  v7 = (v5 >> 10) & 3;
  if (!v7 || v7 == 2 && ((*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)v4 + 16))(v4, a2) & 1) != 0)
    goto LABEL_8;
  v8 = 32;
LABEL_10:
  *(_BYTE *)(*a2 + a2[1]++) = v8;
  v9 = *(_QWORD *)(a1 + 16);
  (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v9 + 32))(v9, a2);
  if ((*(_WORD *)(v9 + 9) & 0xC0) != 0x40)
    (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v9 + 40))(v9, a2);
  v11 = *a2 + a2[1];
  *(_BYTE *)(v11 + 2) = 42;
  *(_WORD *)v11 = 14906;
  a2[1] += 3;
  return result;
}

uint64_t `anonymous namespace'::itanium_demangle::PointerToMemberType::printRight(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4;
  unsigned int v5;
  int v6;
  int v7;

  v4 = *(_QWORD *)(a1 + 24);
  v5 = *(unsigned __int16 *)(v4 + 9);
  v6 = (v5 >> 8) & 3;
  if (!v6)
    goto LABEL_8;
  if (v6 == 2)
  {
    if (((*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v4 + 8))(v4, this) & 1) != 0)
    {
LABEL_8:
      *(_BYTE *)(*(_QWORD *)this + (*((_QWORD *)this + 1))++) = 41;
      return (*(uint64_t (**)(_QWORD, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), this);
    }
    v4 = *(_QWORD *)(a1 + 24);
    v5 = *(unsigned __int16 *)(v4 + 9);
  }
  v7 = (v5 >> 10) & 3;
  if (!v7
    || v7 == 2
    && (*(unsigned int (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v4 + 16))(v4, this))
  {
    goto LABEL_8;
  }
  return (*(uint64_t (**)(_QWORD, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), this);
}

void `anonymous namespace'::itanium_demangle::PointerToMemberType::~PointerToMemberType(_anonymous_namespace_::itanium_demangle::PointerToMemberType *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

uint64_t `anonymous namespace'::itanium_demangle::ElaboratedTypeSpefType::printLeft(_QWORD *a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  size_t v4;
  const void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  v4 = a1[3];
  if (v4)
  {
    v5 = (const void *)a1[2];
    memcpy((void *)(*(_QWORD *)this + *((_QWORD *)this + 1)), v5, v4);
    *((_QWORD *)this + 1) += v4;
  }
  v6 = *(_QWORD *)this;
  v7 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v7 + 1;
  *(_BYTE *)(v6 + v7) = 32;
  v8 = a1[4];
  result = (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v8 + 32))(v8, this);
  if ((*(_WORD *)(v8 + 9) & 0xC0) != 0x40)
    return (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v8 + 40))(v8, this);
  return result;
}

void `anonymous namespace'::itanium_demangle::ElaboratedTypeSpefType::~ElaboratedTypeSpefType(_anonymous_namespace_::itanium_demangle::ElaboratedTypeSpefType *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

uint64_t `anonymous namespace'::itanium_demangle::PointerType::hasRHSComponentSlow(uint64_t a1)
{
  uint64_t v1;
  unsigned int v2;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = *(unsigned __int8 *)(v1 + 9);
  if ((v2 & 0xC0) == 0x80)
    return (**(uint64_t (***)(uint64_t))v1)(v1);
  else
    return v2 < 0x40;
}

_QWORD *`anonymous namespace'::itanium_demangle::PointerType::printLeft(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  const void *v7;
  _QWORD *result;
  char v9;
  _BYTE *v10;
  uint64_t v11;
  unsigned int v12;
  int v13;
  int v14;

  v4 = *(_QWORD *)(a1 + 16);
  if (*(_BYTE *)(v4 + 8) != 11
  {
    (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v4 + 32))(v4, a2);
    v10 = *(_BYTE **)(a1 + 16);
    if ((v10[10] & 3) == 0
      || (v10[10] & 3) == 2 && (*(unsigned int (**)(_BYTE *, _QWORD *))(*(_QWORD *)v10 + 8))(v10, a2))
    {
      *(_BYTE *)(*a2 + a2[1]++) = 32;
    }
    v11 = *(_QWORD *)(a1 + 16);
    v12 = *(unsigned __int16 *)(v11 + 9);
    v13 = (v12 >> 8) & 3;
    if (v13)
    {
      if (v13 != 2)
      {
LABEL_14:
        v14 = (v12 >> 10) & 3;
        if (v14 && (v14 != 2 || !(*(unsigned int (**)(uint64_t, _QWORD *))(*(_QWORD *)v11 + 16))(v11, a2)))
          goto LABEL_18;
        goto LABEL_17;
      }
      if (((*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)v11 + 8))(v11, a2) & 1) == 0)
      {
        v11 = *(_QWORD *)(a1 + 16);
        v12 = *(unsigned __int16 *)(v11 + 9);
        goto LABEL_14;
      }
    }
LABEL_17:
    *(_BYTE *)(*a2 + a2[1]++) = 40;
LABEL_18:
    v9 = 42;
    goto LABEL_19;
  }
  v5 = *a2 + a2[1];
  *(_BYTE *)(v5 + 2) = 60;
  *(_WORD *)v5 = 25705;
  a2[1] += 3;
  v6 = *(_QWORD *)(v4 + 32);
  if (v6)
  {
    v7 = *(const void **)(v4 + 24);
    memcpy((void *)(*a2 + a2[1]), v7, v6);
    a2[1] += v6;
  }
  v9 = 62;
LABEL_19:
  *(_BYTE *)(*a2 + a2[1]++) = v9;
  return result;
}

uint64_t `anonymous namespace'::itanium_demangle::PointerType::printRight(uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  _BYTE *v4;
  uint64_t result;
  unsigned int v6;
  int v7;
  int v8;

  v4 = *(_BYTE **)(a1 + 16);
  if (v4[8] != 11
        (result & 1) == 0))
  {
    v6 = *(unsigned __int16 *)(v4 + 9);
    v7 = (v6 >> 8) & 3;
    if (v7)
    {
      if (v7 != 2)
      {
LABEL_7:
        v8 = (v6 >> 10) & 3;
        if (v8
          && (v8 != 2
           || !(*(unsigned int (**)(_BYTE *, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v4 + 16))(v4, this)))
        {
          return (*(uint64_t (**)(_QWORD, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(**(_QWORD **)(a1 + 16) + 40))(*(_QWORD *)(a1 + 16), this);
        }
        goto LABEL_10;
      }
      if (((*(uint64_t (**)(_BYTE *, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(_QWORD *)v4 + 8))(v4, this) & 1) == 0)
      {
        v4 = *(_BYTE **)(a1 + 16);
        v6 = *(unsigned __int16 *)(v4 + 9);
        goto LABEL_7;
      }
    }
LABEL_10:
    *(_BYTE *)(*(_QWORD *)this + (*((_QWORD *)this + 1))++) = 41;
    return (*(uint64_t (**)(_QWORD, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(**(_QWORD **)(a1 + 16) + 40))(*(_QWORD *)(a1 + 16), this);
  }
  return result;
}

void `anonymous namespace'::itanium_demangle::PointerType::~PointerType(_anonymous_namespace_::itanium_demangle::PointerType *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

BOOL `anonymous namespace'::itanium_demangle::ObjCProtoName::isObjCObject(_anonymous_namespace_::itanium_demangle::ObjCProtoName *this)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *((_QWORD *)this + 2);
  if (*(_BYTE *)(v1 + 8) != 8 || *(_QWORD *)(v1 + 24) != 11)
    return 0;
  v2 = *(uint64_t **)(v1 + 16);
  v3 = *v2;
  v4 = *(uint64_t *)((char *)v2 + 3);
  return v3 == 0x6A626F5F636A626FLL && v4 == 0x7463656A626F5F63;
}

uint64_t `anonymous namespace'::itanium_demangle::ReferenceType::hasRHSComponentSlow(uint64_t a1)
{
  uint64_t v1;
  unsigned int v2;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = *(unsigned __int8 *)(v1 + 9);
  if ((v2 & 0xC0) == 0x80)
    return (**(uint64_t (***)(uint64_t))v1)(v1);
  else
    return v2 < 0x40;
}

uint64_t `anonymous namespace'::itanium_demangle::ReferenceType::printLeft(uint64_t result, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v9;
  uint64_t v10;
  size_t v11;
  const char *v12;

  if (!*(_BYTE *)(result + 28))
  {
    v3 = result;
    *(_BYTE *)(result + 28) = 1;
    v5 = v4;
    if (!v4)
    {
LABEL_22:
      *(_BYTE *)(v3 + 28) = 0;
      return result;
    }
    v6 = result;
    (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v4 + 32))(v4, a2);
    if ((*(_BYTE *)(v5 + 10) & 3) == 0
      || (*(_BYTE *)(v5 + 10) & 3) == 2
      && (*(unsigned int (**)(uint64_t, _QWORD *))(*(_QWORD *)v5 + 8))(v5, a2))
    {
      *(_BYTE *)(*a2 + a2[1]++) = 32;
    }
    v7 = *(unsigned __int16 *)(v5 + 9);
    v8 = (v7 >> 8) & 3;
    if (!v8)
      goto LABEL_14;
    if (v8 == 2)
    {
      if (((*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)v5 + 8))(v5, a2) & 1) != 0)
        goto LABEL_14;
      v7 = *(unsigned __int16 *)(v5 + 9);
    }
    v9 = (v7 >> 10) & 3;
    if (v9 && (v9 != 2 || !(*(unsigned int (**)(uint64_t, _QWORD *))(*(_QWORD *)v5 + 16))(v5, a2)))
    {
LABEL_15:
      v10 = v6;
      if (v6)
        v11 = 2;
      else
        v11 = 1;
      if (v10)
        v12 = "&&";
      else
        v12 = "&";
      result = (uint64_t)memcpy((void *)(*a2 + a2[1]), v12, v11);
      a2[1] += v11;
      goto LABEL_22;
    }
LABEL_14:
    *(_BYTE *)(*a2 + a2[1]++) = 40;
    goto LABEL_15;
  }
  return result;
}

void sub_1DED60FC8(_Unwind_Exception *a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 28) = 0;
  _Unwind_Resume(a1);
}

uint64_t `anonymous namespace'::itanium_demangle::ReferenceType::printRight(uint64_t result, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  int v7;
  int v8;

  if (!*(_BYTE *)(result + 28))
  {
    v3 = result;
    *(_BYTE *)(result + 28) = 1;
    v5 = v4;
    if (!v4)
    {
LABEL_12:
      *(_BYTE *)(v3 + 28) = 0;
      return result;
    }
    v6 = *(unsigned __int16 *)(v4 + 9);
    v7 = (v6 >> 8) & 3;
    if (v7)
    {
      if (v7 != 2)
      {
LABEL_7:
        v8 = (v6 >> 10) & 3;
        if (v8 && (v8 != 2 || !(*(unsigned int (**)(uint64_t, _QWORD *))(*(_QWORD *)v5 + 16))(v5, a2)))
          goto LABEL_11;
        goto LABEL_10;
      }
      if (((*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)v4 + 8))(v4, a2) & 1) == 0)
      {
        v6 = *(unsigned __int16 *)(v5 + 9);
        goto LABEL_7;
      }
    }
LABEL_10:
    *(_BYTE *)(*a2 + a2[1]++) = 41;
LABEL_11:
    result = (*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)v5 + 40))(v5, a2);
    goto LABEL_12;
  }
  return result;
}

void sub_1DED610AC(_Unwind_Exception *a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 28) = 0;
  _Unwind_Resume(a1);
}

void `anonymous namespace'::itanium_demangle::ReferenceType::~ReferenceType(_anonymous_namespace_::itanium_demangle::ReferenceType *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

uint64_t `anonymous namespace'::itanium_demangle::ReferenceType::collapse(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  size_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char *ptr;
  char *v23;
  char *v24;
  _OWORD v25[4];
  uint64_t v26;

  v3 = *(_DWORD *)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 16);
  ptr = (char *)v25;
  v23 = (char *)v25;
  v24 = (char *)&v26;
  memset(v25, 0, sizeof(v25));
  while (1)
  {
    v5 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v4 + 24))(v4, a2);
    if (*(_BYTE *)(v5 + 8) != 13)
      break;
    v4 = *(_QWORD *)(v5 + 16);
    if (*(_DWORD *)(v5 + 24) < (signed int)v3)
      v3 = *(_DWORD *)(v5 + 24);
    v13 = v23;
    if (v23 == v24)
    {
      v14 = v23 - ptr;
      if (ptr == (char *)v25)
      {
        v16 = (char *)malloc_type_malloc(2 * (v23 - ptr), 0x6004044C4A2DFuLL);
        v15 = v16;
        if (!v16)
LABEL_23:
          abort();
        v6 = (uint64_t)ptr;
        v7 = v23 - ptr;
        if (v23 != ptr)
          memmove(v16, ptr, v7);
        ptr = v15;
      }
      else
      {
        v15 = (char *)malloc_type_realloc(ptr, 2 * (v23 - ptr), 0x6004044C4A2DFuLL);
        ptr = v15;
        if (!v15)
          goto LABEL_23;
      }
      v13 = &v15[8 * (v14 >> 3)];
      v24 = &v15[8 * (v14 >> 2)];
    }
    v23 = v13 + 8;
    *(_QWORD *)v13 = v4;
    v17 = ptr;
    v18 = v23 - ptr;
    if ((unint64_t)(v23 - ptr) >= 9)
    {
      v19 = v18 >> 3;
      v20 = (v18 >> 3) - 1;
      if (v19 <= v20 >> 1)
        abort_message("%s:%d: %s", v6, v7, v8, v9, v10, v11, v12, (char)"/Library/Caches/com.apple.xbs/Sources/libcxx_os/libcxxabi/src/demangle/ItaniumDemangle.h");
      if (v4 == *(_QWORD *)&ptr[8 * (v20 >> 1)])
        goto LABEL_19;
    }
  }
  v17 = ptr;
LABEL_19:
  if (v17 != (char *)v25)
    free(v17);
  return v3;
}

void sub_1DED61278(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;

  if (a12 != v12)
    free(a12);
  _Unwind_Resume(exception_object);
}

void *__cxa_get_globals()
{
  void *globals_fast;
  void *v1;
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
  char v17;

  globals_fast = __cxa_get_globals_fast();
  if (!globals_fast)
  {
    v1 = __cxxabiv1::__calloc_with_fallback(1uLL, 0x10uLL);
    if (!v1)
      abort_message("cannot allocate __cxa_eh_globals", v2, v3, v4, v5, v6, v7, v8, v17);
    globals_fast = v1;
      abort_message("std::__libcpp_tls_set failure in __cxa_get_globals()", v9, v10, v11, v12, v13, v14, v15, v17);
  }
  return globals_fast;
}

void *__cxa_get_globals_fast()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char vars0;

  {
    abort_message("execute once failure in __cxa_get_globals_fast()", v0, v1, v2, v3, v4, v5, v6, vars0);
  }
}

uint64_t __cxxabiv1::`anonymous namespace'::construct_(__cxxabiv1::_anonymous_namespace_ *this)
{
  uint64_t result;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char vars0;

  if ((_DWORD)result)
    abort_message("cannot create thread specific key for __cxa_get_globals()", v2, v3, v4, v5, v6, v7, v8, vars0);
  return result;
}

uint64_t __cxxabiv1::`anonymous namespace'::destruct_(__cxxabiv1::_anonymous_namespace_ *this, void *a2)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char vars0;

  __cxxabiv1::__free_with_fallback(this, a2);
  if ((_DWORD)result)
    abort_message("cannot zero out thread value for __cxa_get_globals()", v3, v4, v5, v6, v7, v8, v9, vars0);
  return result;
}

_QWORD *__cxxabiv1::`anonymous namespace'::InitByteGlobalMutex<__cxxabiv1::`anonymous namespace'::LibcppMutex,__cxxabiv1::`anonymous namespace'::LibcppCondVar,__cxxabiv1::`anonymous namespace'::GlobalStatic<__cxxabiv1::`anonymous namespace'::LibcppMutex>::instance,__cxxabiv1::`anonymous namespace'::GlobalStatic<__cxxabiv1::`anonymous namespace'::LibcppCondVar>::instance,&__cxxabiv1::`anonymous namespace'::PlatformThreadID>::LockGuard::~LockGuard(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (pthread_mutex_unlock(&stru_1ECCE7F60))
    abort_message("%s failed to release mutex", v2, v3, v4, v5, v6, v7, v8, *a1);
  return a1;
}

_QWORD *OUTLINED_FUNCTION_1(uint64_t a1, ...)
{
  va_list va;

  va_start(va, a1);
}

std::unexpected_handler std::get_unexpected(void)
{
  return (std::unexpected_handler)atomic_load((unint64_t *)&__cxa_unexpected_handler);
}

void std::terminate(void)
{
  uint64_t *globals_fast;
  uint64_t v1;
  void (*terminate)(void);

  globals_fast = (uint64_t *)__cxa_get_globals_fast();
  if (globals_fast)
  {
    v1 = *globals_fast;
    if (*globals_fast)
    {
      if (__cxxabiv1::__isOurExceptionClass((const _Unwind_Exception *)(v1 + 96)))
        std::__terminate(*(void (**)(void))(v1 + 40));
    }
  }
  terminate = std::get_terminate();
  std::__terminate(terminate);
}

void std::__unexpected(void (*a1)(void))
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char vars0;

  a1();
  abort_message("unexpected_handler unexpectedly returned", v1, v2, v3, v4, v5, v6, v7, vars0);
}

void std::unexpected(void)
{
  void (*v0)(void);

  v0 = (void (*)(void))atomic_load((unint64_t *)&__cxa_unexpected_handler);
  std::__unexpected(v0);
}

std::terminate_handler std::get_terminate(void)
{
  return (std::terminate_handler)atomic_load((unint64_t *)&__cxa_terminate_handler);
}

void std::__terminate(void (*a1)(void))
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char vars0;

  a1();
  abort_message("terminate_handler unexpectedly returned", v1, v2, v3, v4, v5, v6, v7, vars0);
}

void sub_1DED614B4()
{
  __break(1u);
}

std::new_handler std::get_new_handler(void)
{
  return (std::new_handler)atomic_load(&__cxa_new_handler);
}

void *__cxa_vec_new(size_t element_count, size_t element_size, size_t padding_size, __cxa_cdtor_type constructor, __cxa_cdtor_type destructor)
{
  size_t v7;
  BOOL v8;
  char *v11;
  char *v12;

  if (!is_mul_ok(element_count, element_size)
    || (v7 = element_count,
        v8 = __CFADD__(element_count * element_size, padding_size),
        element_count = element_count * element_size + padding_size,
        v8))
  {
  }
  v11 = (char *)operator new[](element_count);
  v12 = v11;
  if (padding_size)
  {
    v12 = &v11[padding_size];
    *(_QWORD *)&v11[padding_size - 8] = v7;
  }
  __cxa_vec_ctor(v12, v7, element_size, constructor, destructor);
  return v12;
}

void sub_1DED61574(_Unwind_Exception *a1)
{
  void *v1;

  operator delete[](v1);
  _Unwind_Resume(a1);
}

void *__cxa_vec_new2(size_t element_count, size_t element_size, size_t padding_size, __cxa_cdtor_type constructor, __cxa_cdtor_type destructor, void *(*alloc)(size_t), void (*dealloc)(void *))
{
  size_t v9;
  BOOL v10;
  char *v13;
  char *v14;

  if (!is_mul_ok(element_count, element_size)
    || (v9 = element_count,
        v10 = __CFADD__(element_count * element_size, padding_size),
        element_count = element_count * element_size + padding_size,
        v10))
  {
  }
  v13 = (char *)alloc(element_count);
  if (!v13)
    return 0;
  v14 = v13;
  if (padding_size)
  {
    v14 = &v13[padding_size];
    *(_QWORD *)&v13[padding_size - 8] = v9;
  }
  __cxa_vec_ctor(v14, v9, element_size, constructor, destructor);
  return v14;
}

void sub_1DED6162C(_Unwind_Exception *a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1(v2);
  _Unwind_Resume(a1);
}

__cxa_vec_ctor_return_type __cxa_vec_ctor(void *array_address, size_t element_count, size_t element_size, __cxa_cdtor_type constructor, __cxa_cdtor_type destructor)
{
  char *v7;
  _QWORD v9[4];
  char v10;
  size_t i;

  if (constructor)
  {
    v7 = (char *)array_address;
    v9[0] = array_address;
    v9[1] = &i;
    v9[2] = element_size;
    v9[3] = destructor;
    v10 = 1;
    for (i = 0; i < element_count; v7 += element_size)
    {
      constructor(v7);
      ++i;
    }
    v10 = 0;
  }
}

void sub_1DED616C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Unwind_Resume(a1);
}

void *__cxa_vec_new3(size_t element_count, size_t element_size, size_t padding_size, __cxa_cdtor_type constructor, __cxa_cdtor_type destructor, void *(*alloc)(size_t), void (*dealloc)(void *, size_t))
{
  char *v12;
  char *v13;

  if (!is_mul_ok(element_count, element_size) || __CFADD__(element_count * element_size, padding_size))
  v12 = (char *)alloc(element_count * element_size + padding_size);
  if (!v12)
    return 0;
  v13 = v12;
  if (padding_size)
  {
    v13 = &v12[padding_size];
    *(_QWORD *)&v12[padding_size - 8] = element_count;
  }
  __cxa_vec_ctor(v13, element_count, element_size, constructor, destructor);
  return v13;
}

void sub_1DED6178C(_Unwind_Exception *a1)
{
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1(v3, v2);
  _Unwind_Resume(a1);
}

__cxa_vec_ctor_return_type __cxa_vec_cctor(void *dest_array, void *src_array, size_t element_count, size_t element_size, __cxa_cdtor_return_type (*constructor)(void *, void *), __cxa_cdtor_type destructor)
{
  uint64_t v11;
  _QWORD v12[4];
  char v13;
  size_t v14;

  if (constructor)
  {
    v12[0] = dest_array;
    v12[1] = &v14;
    v12[2] = element_size;
    v12[3] = destructor;
    v13 = 1;
    v14 = 0;
    if (element_count)
    {
      v11 = 0;
      do
      {
        constructor((char *)dest_array + v11, (char *)src_array + v11);
        ++v14;
        v11 += element_size;
      }
      while (v14 < element_count);
    }
    v13 = 0;
  }
}

void sub_1DED61840(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Unwind_Resume(a1);
}

void __cxxabiv1::`anonymous namespace'::st_cxa_cleanup::~st_cxa_cleanup(__cxxabiv1::_anonymous_namespace_::st_cxa_cleanup *this)
{
  void (*v1)(void);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;

  if (*((_BYTE *)this + 32))
  {
    v1 = (void (*)(void))*((_QWORD *)this + 3);
    if (v1)
    {
      v2 = *((_QWORD *)this + 2);
      v3 = **((_QWORD **)this + 1);
      v4 = -v2;
      v5 = v3 + 1;
      for (i = *(_QWORD *)this + v2 * (v3 - 1); --v5; i = v7)
      {
        v7 = i + v4;
        v1();
      }
    }
  }
}

void __cxa_vec_dtor(void *array_address, size_t element_count, size_t element_size, __cxa_cdtor_type destructor)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *i;
  char *v15;
  _QWORD v16[4];
  char v17;
  size_t v18;

  if (destructor)
  {
    v18 = element_count;
    v16[0] = array_address;
    v16[1] = &v18;
    v16[2] = element_size;
    v16[3] = destructor;
    v17 = 1;
    __cxa_uncaught_exception();
    v12 = -(uint64_t)element_size;
    for (i = (char *)array_address + element_size * (element_count - 1); v18--; i = v15)
    {
      v15 = &i[v12];
      ((void (*)(char *, uint64_t, uint64_t, uint64_t, uint64_t))destructor)(i, v8, v9, v10, v11);
    }
    v17 = 0;
  }
}

void sub_1DED61968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  int v9;

  if (v9)
    std::terminate();
  _Unwind_Resume(a1);
}

void __cxa_vec_cleanup(void *array_address, size_t element_count, size_t s, __cxa_cdtor_type destructor)
{
  uint64_t v5;
  size_t v6;
  char *i;
  char *v8;

  if (destructor)
  {
    v5 = -(uint64_t)s;
    v6 = element_count + 1;
    for (i = (char *)array_address + s * (element_count - 1); --v6; i = v8)
    {
      v8 = &i[v5];
      ((void (*)(void))destructor)();
    }
  }
}

void __cxa_vec_delete(void *array_address, size_t element_size, size_t padding_size, __cxa_cdtor_type destructor)
{
  char *v4;

  if (array_address)
  {
    v4 = (char *)array_address - padding_size;
    if (padding_size)
    {
      if (destructor)
        __cxa_vec_dtor(array_address, *((_QWORD *)array_address - 1), element_size, destructor);
    }
    operator delete[](v4);
  }
}

void sub_1DED61A20(_Unwind_Exception *a1)
{
  void *v1;

  operator delete[](v1);
  _Unwind_Resume(a1);
}

void __cxa_vec_delete2(void *array_address, size_t element_size, size_t padding_size, __cxa_cdtor_type destructor, void (*dealloc)(void *))
{
  char *v6;

  if (array_address)
  {
    v6 = (char *)array_address - padding_size;
    if (padding_size)
    {
      if (destructor)
        __cxa_vec_dtor(array_address, *((_QWORD *)array_address - 1), element_size, destructor);
    }
    ((void (*)(char *, size_t))dealloc)(v6, element_size);
  }
}

void sub_1DED61A80(_Unwind_Exception *a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1(v2);
  _Unwind_Resume(a1);
}

void __cxa_vec_delete3(void *array_address, size_t element_size, size_t padding_size, __cxa_cdtor_type destructor, void (*dealloc)(void *, size_t))
{
  char *v6;
  size_t v8;
  size_t v9;

  if (array_address)
  {
    v6 = (char *)array_address - padding_size;
    if (padding_size)
    {
      v8 = *((_QWORD *)array_address - 1);
      v9 = padding_size + v8 * element_size;
      if (destructor)
        __cxa_vec_dtor(array_address, v8, element_size, destructor);
    }
    else
    {
      v9 = 0;
    }
    dealloc(v6, v9);
  }
}

void sub_1DED61AF8(_Unwind_Exception *a1)
{
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1(v2, v3);
  _Unwind_Resume(a1);
}

void __cxxabiv1::`anonymous namespace'::throw_bad_array_new_length(__cxxabiv1::_anonymous_namespace_ *this)
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v2;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v2 = std::bad_array_new_length::bad_array_new_length(exception);
}

void __cxa_pure_virtual(void)
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char vars0;

  abort_message("Pure virtual function called!", v0, v1, v2, v3, v4, v5, v6, vars0);
}

void __cxa_deleted_virtual(void)
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char vars0;

  abort_message("Deleted virtual function called!", v0, v1, v2, v3, v4, v5, v6, vars0);
}

void std::exception::~exception(std::exception *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

const char *__cdecl std::exception::what(const std::exception *this)
{
  return "std::exception";
}

void std::bad_exception::~bad_exception(std::bad_exception *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

const char *__cdecl std::bad_exception::what(const std::bad_exception *this)
{
  return "std::bad_exception";
}

std::bad_alloc *__cdecl std::bad_alloc::bad_alloc(std::bad_alloc *this)
{
  this->__vftable = (std::bad_alloc_vtbl *)&off_1EA9515E0;
  return this;
}

{
  this->__vftable = (std::bad_alloc_vtbl *)&off_1EA9515E0;
  return this;
}

void std::bad_alloc::~bad_alloc(std::bad_alloc *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

const char *__cdecl std::bad_alloc::what(const std::bad_alloc *this)
{
  return "std::bad_alloc";
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  this->__vftable = (std::bad_array_new_length_vtbl *)&off_1EA951608;
  return this;
}

{
  this->__vftable = (std::bad_array_new_length_vtbl *)&off_1EA951608;
  return this;
}

void std::bad_array_new_length::~bad_array_new_length(std::bad_array_new_length *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

const char *__cdecl std::bad_array_new_length::what(const std::bad_array_new_length *this)
{
  return "bad_array_new_length";
}

void std::logic_error::~logic_error(std::logic_error *this)
{
  const char *imp;
  unsigned __int8 v3;
  const char *v4;
  unsigned int *v5;
  unsigned int v6;
  signed int v7;
  void *v8;
  void *v9;
  uint64_t v10;

  this->__vftable = (std::logic_error_vtbl *)&off_1EA9516D8;
  imp = this->__imp_.__imp_;
  if ((v3 & 1) == 0
  {
    v8 = dlopen("/usr/lib/libstdc++.6.dylib", 16);
    if (v8)
    {
      v9 = dlsym(v8, "_ZNSs4_Rep20_S_empty_rep_storageE");
      v10 = (uint64_t)v9 + 24;
      if (!v9)
        v10 = 0;
    }
    else
    {
      v10 = 0;
    }
  }
  {
    v4 = this->__imp_.__imp_;
    v5 = (unsigned int *)(v4 - 8);
    do
    {
      v6 = __ldaxr(v5);
      v7 = v6 - 1;
    }
    while (__stlxr(v7, v5));
    if (v7 < 0)
      operator delete((void *)(v4 - 24));
  }
  std::exception::~exception(this);
}

{
  std::logic_error::~logic_error(this);
  JUMPOUT(0x1DF0EF2D4);
}

const char *__cdecl std::logic_error::what(const std::logic_error *this)
{
  return this->__imp_.__imp_;
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
  const char *imp;
  unsigned __int8 v3;
  const char *v4;
  unsigned int *v5;
  unsigned int v6;
  signed int v7;
  void *v8;
  void *v9;
  uint64_t v10;

  this->__vftable = (std::runtime_error_vtbl *)&off_1EA951700;
  imp = this->__imp_.__imp_;
  if ((v3 & 1) == 0
  {
    v8 = dlopen("/usr/lib/libstdc++.6.dylib", 16);
    if (v8)
    {
      v9 = dlsym(v8, "_ZNSs4_Rep20_S_empty_rep_storageE");
      v10 = (uint64_t)v9 + 24;
      if (!v9)
        v10 = 0;
    }
    else
    {
      v10 = 0;
    }
  }
  {
    v4 = this->__imp_.__imp_;
    v5 = (unsigned int *)(v4 - 8);
    do
    {
      v6 = __ldaxr(v5);
      v7 = v6 - 1;
    }
    while (__stlxr(v7, v5));
    if (v7 < 0)
      operator delete((void *)(v4 - 24));
  }
  std::exception::~exception(this);
}

{
  std::runtime_error::~runtime_error(this);
  JUMPOUT(0x1DF0EF2D4);
}

const char *__cdecl std::runtime_error::what(const std::runtime_error *this)
{
  return this->__imp_.__imp_;
}

void std::domain_error::~domain_error(std::domain_error *this)
{
  std::logic_error::~logic_error(this);
  JUMPOUT(0x1DF0EF2D4);
}

void std::invalid_argument::~invalid_argument(std::invalid_argument *this)
{
  std::logic_error::~logic_error(this);
  JUMPOUT(0x1DF0EF2D4);
}

void std::length_error::~length_error(std::length_error *this)
{
  std::logic_error::~logic_error(this);
  JUMPOUT(0x1DF0EF2D4);
}

void std::out_of_range::~out_of_range(std::out_of_range *this)
{
  std::logic_error::~logic_error(this);
  JUMPOUT(0x1DF0EF2D4);
}

void std::range_error::~range_error(std::range_error *this)
{
  std::runtime_error::~runtime_error(this);
  JUMPOUT(0x1DF0EF2D4);
}

void std::overflow_error::~overflow_error(std::overflow_error *this)
{
  std::runtime_error::~runtime_error(this);
  JUMPOUT(0x1DF0EF2D4);
}

void std::underflow_error::~underflow_error(std::underflow_error *this)
{
  std::runtime_error::~runtime_error(this);
  JUMPOUT(0x1DF0EF2D4);
}

void std::type_info::~type_info(std::type_info *this)
{
  JUMPOUT(0x1DF0EF2D4);
}

std::bad_cast *__cdecl std::bad_cast::bad_cast(std::bad_cast *this)
{
  this->__vftable = (std::bad_cast_vtbl *)&off_1EA951918;
  return this;
}

{
  this->__vftable = (std::bad_cast_vtbl *)&off_1EA951918;
  return this;
}

void std::bad_cast::~bad_cast(std::bad_cast *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x1DF0EF2D4);
}

const char *__cdecl std::bad_cast::what(const std::bad_cast *this)
{
  return "std::bad_cast";
}

std::bad_typeid *__cdecl std::bad_typeid::bad_typeid(std::bad_typeid *this)
{
  this->__vftable = (std::bad_typeid_vtbl *)&off_1EA951940;
  return this;
}

{
  this->__vftable = (std::bad_typeid_vtbl *)&off_1EA951940;
  return this;
}

void std::bad_typeid::~bad_typeid(std::bad_typeid *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x1DF0EF2D4);
}

const char *__cdecl std::bad_typeid::what(const std::bad_typeid *this)
{
  return "std::bad_typeid";
}

void abort_message(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  FILE **v10;
  char *v11;

  v10 = (FILE **)MEMORY[0x1E0C80C10];
  fwrite("libc++abi: ", 0xBuLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
  v11 = &a9;
  vfprintf(*v10, a1, &a9);
  fputc(10, *v10);
  v11 = 0;
  vasprintf(&v11, a1, &a9);
  qword_1F044CBB8 = (uint64_t)v11;
  abort();
}

int *__cxxabiv1::__aligned_malloc_with_fallback(unint64_t a1)
{
  unint64_t v1;
  size_t v2;
  int *result;

  if (a1 <= 1)
    v1 = 1;
  else
    v1 = a1;
  if (((v1 + 15) & 0xFFFFFFFFFFFFFFF0) <= v1)
    v2 = v1;
  else
    v2 = (v1 + 15) & 0xFFFFFFFFFFFFFFF0;
  result = (int *)malloc_type_aligned_alloc(0x10uLL, v2, 0x76A2E741uLL);
  if (!result)
  return result;
}

int *`anonymous namespace'::fallback_malloc(_anonymous_namespace_ *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  int *v10;
  unint64_t v11;
  unint64_t v12;
  int *v13;
  int *v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unsigned __int16 *v19;
  uint64_t v20;

  {
    v9 = &dword_1F044CC1C;
    dword_1F044CC1C = 8192128;
  }
  {
LABEL_11:
    v13 = 0;
  }
  else
  {
    v10 = 0;
    v11 = ((unint64_t)this + 3) >> 2;
    v12 = v11 + 1;
    while (1)
    {
      v13 = v9 + 1;
      if (((unint64_t)(v9 + 1) & 0xF) != 0)
        abort_message("%s:%d: %s", v2, v3, v4, v5, v6, v7, v8, (char)"/Library/Caches/com.apple.xbs/Sources/libcxx_os/libcxxabi/src/fallback_malloc.cpp");
      v14 = v9;
      v15 = *((unsigned __int16 *)v9 + 1);
      v16 = ((_BYTE)v15 - (_BYTE)v12) & 3;
      if (v12 >= v15)
        v16 = 0;
      v17 = v16 + v12;
      if (v17 < v15)
        break;
      if (v11 < v15)
      {
        v20 = *(unsigned __int16 *)v14;
        if (v10)
          *(_WORD *)v10 = v20;
        else
        *(_WORD *)v14 = 0;
        goto LABEL_18;
      }
      v18 = 4 * *(unsigned __int16 *)v14;
      v10 = v14;
      if (v18 == 512)
        goto LABEL_11;
    }
    *((_WORD *)v14 + 1) = v15 - v17;
    v19 = (unsigned __int16 *)&v14[(unsigned __int16)(v15 - v17)];
    *v19 = 0;
    v19[1] = v17;
    v13 = (int *)(v19 + 2);
    if (((unint64_t)(v19 + 2) & 0xF) != 0)
      abort_message("%s:%d: %s", v2, v3, v4, v5, v6, v7, v8, (char)"/Library/Caches/com.apple.xbs/Sources/libcxx_os/libcxxabi/src/fallback_malloc.cpp");
  }
LABEL_18:
  return v13;
}

void sub_1DED622A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *__cxxabiv1::__calloc_with_fallback(size_t a1, size_t a2)
{
  void *v4;
  size_t v5;
  int *v6;

  v4 = malloc_type_calloc(a1, a2, 0x6119B3B9uLL);
  if (!v4)
  {
    v5 = a2 * a1;
    v4 = v6;
    if (v6)
      bzero(v6, v5);
  }
  return v4;
}

void __cxxabiv1::__aligned_free_with_fallback(void *a1, void *a2)
{
  {
    free(a1);
  }
  else
  {
  }
}

uint64_t `anonymous namespace'::fallback_free(_anonymous_namespace_ *this, void *a2)
{
  unsigned __int16 *v3;
  BOOL v4;
  unsigned __int16 *v5;
  uint64_t v6;
  unsigned __int16 *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = (unsigned __int16 *)((char *)this - 4);
  else
    v4 = 1;
  if (v4)
  {
LABEL_9:
  }
  else
  {
    v5 = 0;
    v6 = *((unsigned __int16 *)this - 1);
    while (1)
    {
      v8 = v7[1];
      if (&v7[2 * v8] == v3)
      {
        v7[1] = v6 + v8;
      }
      if (&v3[2 * v6] == v7)
        break;
      v9 = 4 * *v7;
      v5 = v7;
      if (v9 == 512)
        goto LABEL_9;
    }
    *((_WORD *)this - 1) = v6 + v8;
    if (v5)
    {
    }
    else
    {
      *v3 = *v7;
    }
  }
}

void __cxxabiv1::__free_with_fallback(void *a1, void *a2)
{
  {
    free(a1);
  }
  else
  {
  }
}

void __cxxabiv1::__fundamental_type_info::~__fundamental_type_info(std::type_info *this)
{
  std::type_info::~type_info(this);
  JUMPOUT(0x1DF0EF2D4);
}

void __cxxabiv1::__array_type_info::~__array_type_info(std::type_info *this)
{
  std::type_info::~type_info(this);
  JUMPOUT(0x1DF0EF2D4);
}

void __cxxabiv1::__function_type_info::~__function_type_info(std::type_info *this)
{
  std::type_info::~type_info(this);
  JUMPOUT(0x1DF0EF2D4);
}

void __cxxabiv1::__enum_type_info::~__enum_type_info(std::type_info *this)
{
  std::type_info::~type_info(this);
  JUMPOUT(0x1DF0EF2D4);
}

void __cxxabiv1::__class_type_info::~__class_type_info(std::type_info *this)
{
  std::type_info::~type_info(this);
  JUMPOUT(0x1DF0EF2D4);
}

void __cxxabiv1::__si_class_type_info::~__si_class_type_info(std::type_info *this)
{
  std::type_info::~type_info(this);
  JUMPOUT(0x1DF0EF2D4);
}

void __cxxabiv1::__vmi_class_type_info::~__vmi_class_type_info(std::type_info *this)
{
  std::type_info::~type_info(this);
  JUMPOUT(0x1DF0EF2D4);
}

void __cxxabiv1::__pbase_type_info::~__pbase_type_info(std::type_info *this)
{
  std::type_info::~type_info(this);
  JUMPOUT(0x1DF0EF2D4);
}

void __cxxabiv1::__pointer_type_info::~__pointer_type_info(std::type_info *this)
{
  std::type_info::~type_info(this);
  JUMPOUT(0x1DF0EF2D4);
}

void __cxxabiv1::__pointer_to_member_type_info::~__pointer_to_member_type_info(std::type_info *this)
{
  std::type_info::~type_info(this);
  JUMPOUT(0x1DF0EF2D4);
}

BOOL is_equal(const std::type_info *a1, const std::type_info *a2, char a3)
{
  if ((a3 & 1) == 0)
    return std::type_info::operator==[abi:ne180100]((uint64_t)a1, (uint64_t)a2);
  if (a1 == a2)
    return 1;
  return strcmp((const char *)(a1->__type_name & 0x7FFFFFFFFFFFFFFFLL), (const char *)(a2->__type_name & 0x7FFFFFFFFFFFFFFFLL)) == 0;
}

uint64_t __cxxabiv1::__array_type_info::can_catch(__cxxabiv1::__array_type_info *this, const __cxxabiv1::__shim_type_info *a2, void **a3)
{
  return 0;
}

uint64_t __cxxabiv1::__function_type_info::can_catch(__cxxabiv1::__function_type_info *this, const __cxxabiv1::__shim_type_info *a2, void **a3)
{
  return 0;
}

const __cxxabiv1::__shim_type_info *__cxxabiv1::__class_type_info::can_catch(__cxxabiv1::__class_type_info *this, const __cxxabiv1::__shim_type_info *a2, void **a3)
{
  const __cxxabiv1::__shim_type_info *result;
  _QWORD v7[4];
  __int128 v8;
  _BYTE v9[31];
  char v10;
  uint64_t v11;

  if (std::type_info::operator==[abi:ne180100]((uint64_t)this, (uint64_t)a2))
    return (const __cxxabiv1::__shim_type_info *)1;
  result = __cxxabiv1::is_class_type(a2);
  if (result)
  {
    v7[0] = result;
    v7[1] = 0;
    v7[2] = this;
    v7[3] = -1;
    v8 = 0u;
    memset(v9, 0, sizeof(v9));
    v10 = 1;
    v11 = 0;
    *(_DWORD *)&v9[24] = 1;
    (*(void (**)(const __cxxabiv1::__shim_type_info *, _QWORD *, _QWORD, uint64_t))(*(_QWORD *)result + 56))(result, v7, *a3, 1);
    result = (const __cxxabiv1::__shim_type_info *)(*(_DWORD *)v9 == 1);
    if (*(_DWORD *)v9 == 1)
      *a3 = (void *)v8;
  }
  return result;
}

const __cxxabiv1::__shim_type_info *__cxxabiv1::is_class_type(const __cxxabiv1::__shim_type_info *a1)
{
  const __cxxabiv1::__shim_type_info *v1;

  if (!a1)
    __cxa_bad_typeid();
  v1 = a1;
  {
    return 0;
  }
  return v1;
}

void __cxxabiv1::__class_type_info::process_found_base_class(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v4;
  uint64_t v5;

  v4 = *(_DWORD *)(a2 + 60);
  if (v4)
  {
    if (*(_QWORD *)(a2 + 40) == *(_QWORD *)(a2 + 80) && *(_QWORD *)(a2 + 32) == a3)
    {
      if (*(_DWORD *)(a2 + 48) == 2)
        *(_DWORD *)(a2 + 48) = a4;
    }
    else
    {
      *(_DWORD *)(a2 + 60) = v4 + 1;
      *(_DWORD *)(a2 + 48) = 2;
      *(_BYTE *)(a2 + 78) = 1;
    }
  }
  else
  {
    *(_DWORD *)(a2 + 48) = a4;
    v5 = *(_QWORD *)(a2 + 80);
    *(_QWORD *)(a2 + 32) = a3;
    *(_QWORD *)(a2 + 40) = v5;
    *(_DWORD *)(a2 + 60) = 1;
  }
}

void __cxxabiv1::__class_type_info::has_unambiguous_public_base(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  _BOOL8 v7;

  v7 = std::type_info::operator==[abi:ne180100](a1, *(_QWORD *)(a2 + 16));
  if (v7)
    __cxxabiv1::__class_type_info::process_found_base_class(v7, a2, a3, a4);
}

void __cxxabiv1::__si_class_type_info::has_unambiguous_public_base(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _BOOL8 v8;

  v8 = std::type_info::operator==[abi:ne180100](a1, *(_QWORD *)(a2 + 16));
  if (v8)
    __cxxabiv1::__class_type_info::process_found_base_class(v8, a2, a3, a4);
  else
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(**(_QWORD **)(a1 + 16) + 56))(*(_QWORD *)(a1 + 16), a2, a3, a4);
}

uint64_t __cxxabiv1::__base_class_type_info::has_unambiguous_public_base(_QWORD *a1, uint64_t a2)
{
  if (!*(_BYTE *)(a2 + 79) && (a1[1] & 1) != 0)
    *(_QWORD *)(a2 + 80) = *(_QWORD *)(*a1 + 8) & 0x7FFFFFFFFFFFFFFFLL;
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)*a1 + 56))(*a1);
}

void __cxxabiv1::__vmi_class_type_info::has_unambiguous_public_base(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  _BOOL8 v8;
  unint64_t v9;
  unint64_t v10;
  BOOL v11;

  v8 = std::type_info::operator==[abi:ne180100](a1, *(_QWORD *)(a2 + 16));
  if (v8)
  {
    __cxxabiv1::__class_type_info::process_found_base_class(v8, a2, a3, a4);
  }
  else
  {
    v9 = a1 + 24 + 16 * *(unsigned int *)(a1 + 20);
    __cxxabiv1::__base_class_type_info::has_unambiguous_public_base((_QWORD *)(a1 + 24), a2);
    if (a1 + 40 < v9)
    {
      v10 = a1 + 56;
      do
      {
        __cxxabiv1::__base_class_type_info::has_unambiguous_public_base((_QWORD *)(v10 - 16), a2);
        if (*(_BYTE *)(a2 + 78))
          v11 = 1;
        else
          v11 = v10 >= v9;
        v10 += 16;
      }
      while (!v11);
    }
  }
}

uint64_t __cxxabiv1::__pbase_type_info::can_catch(__cxxabiv1::__pbase_type_info *this, const __cxxabiv1::__shim_type_info *lpsrc, void **a3)
{
  uint64_t result;

  if ((*((_BYTE *)this + 16) & 0x18) == 0)
  {
    if (!lpsrc)
      return 0;
    if (!result)
      return result;
    if ((*(_BYTE *)(result + 16) & 0x18) == 0)
      return std::type_info::operator==[abi:ne180100]((uint64_t)this, (uint64_t)lpsrc);
  }
  return this == lpsrc
      || strcmp((const char *)(*((_QWORD *)this + 1) & 0x7FFFFFFFFFFFFFFFLL), (const char *)(*((_QWORD *)lpsrc + 1) & 0x7FFFFFFFFFFFFFFFLL)) == 0;
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  std::type_info *v8;
  _BOOL4 v9;
  void *v10;
  void *result;
  void *v12;
  std::type_info *v13;
  __cxxabiv1::__class_type_info *v14;

  v8 = v13;
  v9 = is_equal(v13, (const std::type_info *)lpdtype, 0);
  v10 = v12;
  if (v9)
  if (!result)
  return result;
}

uint64_t __cxxabiv1::__pointer_type_info::can_catch(__cxxabiv1::__pointer_type_info *this, const __cxxabiv1::__shim_type_info *a2, void ***a3)
{
  void **v6;
  uint64_t result;
  int v8;
  int v9;
  const void *v10;
  const void *v11;
  __cxxabiv1::__pointer_type_info *v12;
  __cxxabiv1::__pointer_to_member_type_info *v13;
  uint64_t v14;
  void **v15;
  BOOL v16;
  void **v17;
  _QWORD v18[4];
  __int128 v19;
  _BYTE v20[31];
  BOOL v21;
  uint64_t v22;

  {
    *a3 = 0;
    return 1;
  }
  if (__cxxabiv1::__pbase_type_info::can_catch(this, a2, v6))
  {
    if (*a3)
      *a3 = (void **)**a3;
    return 1;
  }
  if (!a2)
    __cxa_bad_typeid();
  if ((_DWORD)result)
  {
    if (*a3)
      *a3 = (void **)**a3;
    v8 = *((_DWORD *)a2 + 4);
    v9 = *((_DWORD *)this + 4);
    if ((v8 & ~(_BYTE)v9 & 7) != 0
      || (v9 & ~(_BYTE)v8 & 0x60) != 0)
    {
      return 0;
    }
    if (std::type_info::operator==[abi:ne180100](*((_QWORD *)this + 3), *((_QWORD *)a2 + 3)))
      return 1;
    {
      v10 = (const void *)*((_QWORD *)a2 + 3);
      if (v10)
      return 1;
    }
    v11 = (const void *)*((_QWORD *)this + 3);
    if (v11)
    {
      if (v12)
      {
        if ((*((_BYTE *)this + 16) & 1) != 0)
          return __cxxabiv1::__pointer_type_info::can_catch_nested(v12, *((const __cxxabiv1::__shim_type_info **)a2 + 3));
        return 0;
      }
      if (v13)
      {
        if ((*((_BYTE *)this + 16) & 1) != 0)
          return __cxxabiv1::__pointer_to_member_type_info::can_catch_nested(v13, *((const __cxxabiv1::__shim_type_info **)a2 + 3));
        return 0;
      }
    }
    result = (uint64_t)__cxxabiv1::is_class_type((const __cxxabiv1::__shim_type_info *)v11);
    if (result)
    {
      v14 = result;
      result = (uint64_t)__cxxabiv1::is_class_type(*((const __cxxabiv1::__shim_type_info **)a2 + 3));
      if (result)
      {
        v15 = *a3;
        v16 = *a3 != 0;
        v18[0] = result;
        v18[1] = 0;
        v18[2] = v14;
        v18[3] = -1;
        v19 = 0u;
        memset(v20, 0, sizeof(v20));
        v21 = v16;
        v22 = 0;
        *(_DWORD *)&v20[24] = 1;
        (*(void (**)(uint64_t, _QWORD *, void **, uint64_t))(*(_QWORD *)result + 56))(result, v18, v15, 1);
        result = *(_DWORD *)v20 == 1;
        if (*(_DWORD *)v20 == 1)
        {
          v17 = (void **)v19;
          if (!v15)
            v17 = 0;
          *a3 = v17;
        }
      }
    }
  }
  return result;
}

uint64_t __cxxabiv1::__pointer_type_info::can_catch_nested(__cxxabiv1::__pointer_type_info *this, const __cxxabiv1::__shim_type_info *lpsrc)
{
  uint64_t result;
  uint64_t v4;
  const void *v5;
  __cxxabiv1::__pointer_type_info *v6;

  if (!lpsrc)
    return 0;
  while (1)
  {
    if (!result)
      break;
    v4 = result;
    if ((*(_DWORD *)(result + 16) & ~*((_DWORD *)this + 4)) != 0)
      return 0;
    if (std::type_info::operator==[abi:ne180100](*((_QWORD *)this + 3), *(_QWORD *)(result + 24)))
      return 1;
    if ((*((_BYTE *)this + 16) & 1) == 0)
      return 0;
    v5 = (const void *)*((_QWORD *)this + 3);
    if (!v5)
      return 0;
    if (!v6)
    {
      if (result)
        return __cxxabiv1::__pointer_to_member_type_info::can_catch_nested((__cxxabiv1::__pointer_to_member_type_info *)result, *(const __cxxabiv1::__shim_type_info **)(v4 + 24));
      return result;
    }
    this = v6;
    lpsrc = *(const __cxxabiv1::__shim_type_info **)(v4 + 24);
    if (!lpsrc)
      return 0;
  }
  return result;
}

BOOL __cxxabiv1::__pointer_to_member_type_info::can_catch_nested(__cxxabiv1::__pointer_to_member_type_info *this, const __cxxabiv1::__shim_type_info *lpsrc)
{
  uint64_t *v3;
  uint64_t *v4;

  if (lpsrc
  {
    return std::type_info::operator==[abi:ne180100](*((_QWORD *)this + 4), v4[4]);
  }
  else
  {
    return 0;
  }
}

uint64_t __cxxabiv1::__pointer_to_member_type_info::can_catch(__cxxabiv1::__pointer_to_member_type_info *this, const __cxxabiv1::__shim_type_info *a2, void **a3)
{
  void **v6;
  const void *v7;
  void *v8;
  uint64_t result;
  uint64_t v10;
  int v11;
  int v12;

  {
    v7 = (const void *)*((_QWORD *)this + 3);
    if (v7
    {
      v8 = &__cxxabiv1::__pointer_to_member_type_info::can_catch(__cxxabiv1::__shim_type_info const*,void *&)const::null_ptr_rep;
    }
    else
    {
      v8 = &__cxxabiv1::__pointer_to_member_type_info::can_catch(__cxxabiv1::__shim_type_info const*,void *&)const::null_ptr_rep;
    }
    *a3 = v8;
    return 1;
  }
  if ((__cxxabiv1::__pbase_type_info::can_catch(this, a2, v6) & 1) != 0)
    return 1;
  if (!a2)
    return 0;
  if (!result)
    return result;
  v10 = result;
  v11 = *(_DWORD *)(result + 16);
  v12 = *((_DWORD *)this + 4);
  if ((v11 & ~(_BYTE)v12 & 7) != 0
    || (v12 & ~(_BYTE)v11 & 0x60) != 0)
  {
    return 0;
  }
  result = std::type_info::operator==[abi:ne180100](*((_QWORD *)this + 3), *(_QWORD *)(result + 24));
  if ((_DWORD)result)
    return std::type_info::operator==[abi:ne180100](*((_QWORD *)this + 4), *(_QWORD *)(v10 + 32));
  return result;
}

_QWORD *__cxxabiv1::`anonymous namespace'::dyn_cast_get_derived_info(_QWORD *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  v3 = *(_QWORD *)(*a2 - 16);
  *result = (char *)a2 + v3;
  result[1] = *(_QWORD *)(v2 - 8);
  result[2] = v3;
  return result;
}

const void *__cxxabiv1::`anonymous namespace'::dyn_cast_to_derived(__cxxabiv1::_anonymous_namespace_ *this, const void *a2, _QWORD *a3, const __cxxabiv1::__class_type_info *a4, const __cxxabiv1::__class_type_info *a5, uint64_t a6)
{
  BOOL v8;
  int v13;
  unint64_t v14;
  const __cxxabiv1::__class_type_info *v15;
  __cxxabiv1::_anonymous_namespace_ *v16;
  _QWORD *v17;
  uint64_t v18;
  __int128 v19;
  _BYTE v20[32];
  uint64_t v21;

  if (a6 < 0)
  {
    if (a6 == -2)
      return 0;
    v15 = a4;
    v16 = this;
    v17 = a3;
    v18 = a6;
    v19 = 0u;
    memset(v20, 0, 24);
    *(_DWORD *)&v20[24] = 1;
    *(_DWORD *)&v20[28] = 0x1000000;
    v21 = 0;
    (*(void (**)(const __cxxabiv1::__class_type_info *, const __cxxabiv1::__class_type_info **, const void *, const void *, uint64_t, _QWORD))(*(_QWORD *)a4 + 40))(a4, &v15, a2, a2, 1, 0);
    v13 = *(_DWORD *)v20;
    if (!*(_DWORD *)v20)
    {
      do
      if ((v14 & (v14 - 1)) == 0)
        syslog(3, "dynamic_cast error 1: Both of the following type_info's should have public visibility. At least one of them is hidden. %s, %s.\n", (const char *)(a3[1] & 0x7FFFFFFFFFFFFFFFLL), (const char *)(*((_QWORD *)a4 + 1) & 0x7FFFFFFFFFFFFFFFLL));
      v15 = a4;
      v16 = this;
      v17 = a3;
      v18 = a6;
      v19 = 0u;
      memset(v20, 0, 31);
      v20[31] = 1;
      v21 = 0;
      *(_DWORD *)&v20[24] = 1;
      (*(void (**)(const __cxxabiv1::__class_type_info *, const __cxxabiv1::__class_type_info **, const void *, const void *, uint64_t, uint64_t))(*(_QWORD *)a4 + 40))(a4, &v15, a2, a2, 1, 1);
      v13 = *(_DWORD *)v20;
    }
    v8 = v13 == 1;
  }
  else
  {
    v8 = (const __cxxabiv1::__class_type_info *)((char *)a5 + a6) == 0;
  }
  if (v8)
    return a2;
  else
    return 0;
}

char *__cxxabiv1::`anonymous namespace'::dyn_cast_try_downcast(__cxxabiv1::_anonymous_namespace_ *this, uint64_t a2, const void *a3, const __cxxabiv1::__class_type_info *a4, unint64_t a5)
{
  char *v5;
  _QWORD v7[4];
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;

  if ((a5 & 0x8000000000000000) != 0)
    return 0;
  v5 = (char *)this - a5;
  if ((uint64_t)((uint64_t)this - a5) < a2)
    return 0;
  v7[0] = a4;
  v7[1] = (char *)this - a5;
  v7[2] = a3;
  v7[3] = a5;
  v8 = 0u;
  v9 = 0u;
  v10 = 0;
  v11 = 1;
  v12 = 0x1000000;
  v13 = 0;
  (*(void (**)(const __cxxabiv1::__class_type_info *, _QWORD *, uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)a4 + 40))(a4, v7, a2, a2, 1, 0);
  if ((_DWORD)v9)
    return v5;
  else
    return 0;
}

uint64_t __cxxabiv1::`anonymous namespace'::dyn_cast_slow(__cxxabiv1::_anonymous_namespace_ *this, const void *a2, _QWORD *a3, const __cxxabiv1::__class_type_info *a4, const __cxxabiv1::__class_type_info *a5, const __cxxabiv1::__class_type_info *a6)
{
  unint64_t v12;
  uint64_t result;
  const __cxxabiv1::__class_type_info *v16;
  __cxxabiv1::_anonymous_namespace_ *v17;
  _QWORD *v18;
  const __cxxabiv1::__class_type_info *v19;
  __int128 v20;
  _BYTE v21[31];
  char v22;
  uint64_t v23;

  v16 = a4;
  v17 = this;
  v18 = a3;
  v19 = a6;
  memset(v21, 0, sizeof(v21));
  v20 = 0u;
  v22 = 1;
  v23 = 0;
  (*(void (**)(const __cxxabiv1::__class_type_info *, const __cxxabiv1::__class_type_info **, const void *, uint64_t, _QWORD))(*(_QWORD *)a5 + 48))(a5, &v16, a2, 1, 0);
  if (!*(_QWORD *)v21)
  {
    do
    if ((v12 & (v12 - 1)) == 0)
      syslog(3, "dynamic_cast error 2: One or more of the following type_info's has hidden visibility or is defined in more than one translation unit. They should all have public visibility. %s, %s, %s.\n", (const char *)(a3[1] & 0x7FFFFFFFFFFFFFFFLL), (const char *)(*((_QWORD *)a5 + 1) & 0x7FFFFFFFFFFFFFFFLL), (const char *)(*((_QWORD *)a4 + 1) & 0x7FFFFFFFFFFFFFFFLL));
    v16 = a4;
    v17 = this;
    v18 = a3;
    v19 = a6;
    v20 = 0u;
    memset(v21, 0, sizeof(v21));
    v22 = 1;
    v23 = 0;
    (*(void (**)(const __cxxabiv1::__class_type_info *, const __cxxabiv1::__class_type_info **, const void *, uint64_t, uint64_t))(*(_QWORD *)a5 + 48))(a5, &v16, a2, 1, 1);
  }
  if (*(_DWORD *)&v21[12] == 1)
  {
    if (*(_DWORD *)v21 == 1)
      return v20;
    result = 0;
    if (!*(_DWORD *)&v21[16] && *(_QWORD *)&v21[4] == 0x100000001)
      return v20;
  }
  else if (*(_DWORD *)&v21[12])
  {
    return 0;
  }
  else if (*(_DWORD *)&v21[8] == 1 && *(_DWORD *)&v21[4] == 1 && *(_DWORD *)&v21[16] == 1)
  {
    return *((_QWORD *)&v20 + 1);
  }
  else
  {
    return 0;
  }
  return result;
}

void __cxxabiv1::__class_type_info::process_static_type_above_dst(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v5;
  int v6;

  *(_BYTE *)(a2 + 77) = 1;
  if (*(_QWORD *)(a2 + 8) != a4)
    return;
  *(_BYTE *)(a2 + 76) = 1;
  v5 = *(_QWORD *)(a2 + 32);
  if (!v5)
  {
    *(_QWORD *)(a2 + 32) = a3;
    *(_DWORD *)(a2 + 48) = a5;
    *(_DWORD *)(a2 + 60) = 1;
    if (a5 != 1)
      return;
    v6 = *(_DWORD *)(a2 + 72);
    goto LABEL_11;
  }
  if (v5 != a3)
  {
    ++*(_DWORD *)(a2 + 60);
    goto LABEL_12;
  }
  v6 = *(_DWORD *)(a2 + 48);
  if (v6 == 2)
  {
    *(_DWORD *)(a2 + 48) = a5;
    v6 = a5;
  }
  if (*(_DWORD *)(a2 + 72) == 1)
  {
LABEL_11:
    if (v6 != 1)
      return;
LABEL_12:
    *(_BYTE *)(a2 + 78) = 1;
  }
}

void __cxxabiv1::__class_type_info::process_static_type_below_dst(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if (*(_QWORD *)(a2 + 8) == a3 && *(_DWORD *)(a2 + 52) != 1)
    *(_DWORD *)(a2 + 52) = a4;
}

uint64_t __cxxabiv1::__vmi_class_type_info::search_below_dst(uint64_t result, uint64_t a2, char *a3, unsigned int a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  _QWORD *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
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
  int v42;

  v9 = result;
  v10 = *(_QWORD *)(a2 + 16);
  if ((a5 & 1) != 0)
  {
    if (v10 != result)
    {
      v11 = (const char *)(*(_QWORD *)(result + 8) & 0x7FFFFFFFFFFFFFFFLL);
      result = strcmp(v11, (const char *)(*(_QWORD *)(v10 + 8) & 0x7FFFFFFFFFFFFFFFLL));
      if ((_DWORD)result)
      {
        if (*(_QWORD *)a2 != v9)
        {
          result = strcmp(v11, (const char *)(*(_QWORD *)(*(_QWORD *)a2 + 8) & 0x7FFFFFFFFFFFFFFFLL));
          if ((_DWORD)result)
            goto LABEL_6;
        }
        goto LABEL_27;
      }
    }
LABEL_23:
    if (*(char **)(a2 + 8) == a3 && *(_DWORD *)(a2 + 52) != 1)
      *(_DWORD *)(a2 + 52) = a4;
    return result;
  }
  result = std::type_info::operator==[abi:ne180100](result, v10);
  if ((result & 1) != 0)
    goto LABEL_23;
  result = std::type_info::operator==[abi:ne180100](v9, *(_QWORD *)a2);
  if ((result & 1) == 0)
  {
LABEL_6:
    v12 = v9 + 16 * *(unsigned int *)(v9 + 20) + 24;
    v13 = *(_QWORD *)(v9 + 32);
    v14 = v13 >> 8;
    if ((v13 & 1) != 0)
      v14 = *(_QWORD *)(*(_QWORD *)a3 + v14);
    if ((v13 & 2) != 0)
      v15 = a4;
    else
      v15 = 2;
    result = (*(uint64_t (**)(_QWORD, uint64_t, char *, uint64_t, uint64_t))(**(_QWORD **)(v9 + 24) + 48))(*(_QWORD *)(v9 + 24), a2, &a3[v14], v15, a5);
    v16 = (uint64_t *)(v9 + 40);
    if (v9 + 40 < v12)
    {
      v17 = *(_DWORD *)(v9 + 16);
      if ((v17 & 2) != 0 || *(_DWORD *)(a2 + 60) == 1)
      {
        do
        {
          if (*(_BYTE *)(a2 + 78))
            break;
          v18 = v16[1];
          v19 = v18 >> 8;
          if ((v18 & 1) != 0)
            v19 = *(_QWORD *)(*(_QWORD *)a3 + v19);
          v21 = *v16;
          v16 += 2;
          v20 = v21;
          v22 = (v18 & 2) != 0 ? a4 : 2;
          result = (*(uint64_t (**)(uint64_t, uint64_t, char *, uint64_t, uint64_t))(*(_QWORD *)v20 + 48))(v20, a2, &a3[v19], v22, a5);
        }
        while ((unint64_t)v16 < v12);
      }
      else if ((v17 & 1) != 0)
      {
        do
        {
          if (*(_BYTE *)(a2 + 78) || *(_DWORD *)(a2 + 60) == 1 && *(_DWORD *)(a2 + 48) == 1)
            break;
          v37 = v16[1];
          v38 = v37 >> 8;
          if ((v37 & 1) != 0)
            v38 = *(_QWORD *)(*(_QWORD *)a3 + v38);
          v40 = *v16;
          v16 += 2;
          v39 = v40;
          v41 = (v37 & 2) != 0 ? a4 : 2;
          result = (*(uint64_t (**)(uint64_t, uint64_t, char *, uint64_t, uint64_t))(*(_QWORD *)v39 + 48))(v39, a2, &a3[v38], v41, a5);
        }
        while ((unint64_t)v16 < v12);
      }
      else
      {
        do
        {
          if (*(_BYTE *)(a2 + 78) || *(_DWORD *)(a2 + 60) == 1)
            break;
          v32 = v16[1];
          v33 = v32 >> 8;
          if ((v32 & 1) != 0)
            v33 = *(_QWORD *)(*(_QWORD *)a3 + v33);
          v35 = *v16;
          v16 += 2;
          v34 = v35;
          v36 = (v32 & 2) != 0 ? a4 : 2;
          result = (*(uint64_t (**)(uint64_t, uint64_t, char *, uint64_t, uint64_t))(*(_QWORD *)v34 + 48))(v34, a2, &a3[v33], v36, a5);
        }
        while ((unint64_t)v16 < v12);
      }
    }
    return result;
  }
LABEL_27:
  if (*(char **)(a2 + 32) == a3 || *(char **)(a2 + 40) == a3)
  {
    if (a4 == 1)
      *(_DWORD *)(a2 + 56) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 56) = a4;
  if (*(_DWORD *)(a2 + 68) == 4)
  {
LABEL_73:
    *(_QWORD *)(a2 + 40) = a3;
    v42 = *(_DWORD *)(a2 + 60);
    ++*(_DWORD *)(a2 + 64);
    if (v42 == 1 && *(_DWORD *)(a2 + 48) == 2)
      *(_BYTE *)(a2 + 78) = 1;
    return result;
  }
  v23 = *(unsigned int *)(v9 + 20);
  if (!(_DWORD)v23)
  {
    *(_DWORD *)(a2 + 68) = 4;
    goto LABEL_73;
  }
  v24 = 0;
  v25 = 0;
  v26 = (_QWORD *)(v9 + 24);
  v27 = v9 + 24 + 16 * v23;
  do
  {
    *(_WORD *)(a2 + 76) = 0;
    v28 = v26[1];
    v29 = v28 >> 8;
    if ((v28 & 1) != 0)
      v29 = *(_QWORD *)(*(_QWORD *)a3 + v29);
    v30 = (v28 & 2) != 0 ? 1 : 2;
    result = (*(uint64_t (**)(_QWORD, uint64_t, char *, char *, uint64_t, uint64_t))(*(_QWORD *)*v26 + 40))(*v26, a2, a3, &a3[v29], v30, a5);
    if (*(_BYTE *)(a2 + 78))
      break;
    if (*(_BYTE *)(a2 + 77))
    {
      if (*(_BYTE *)(a2 + 76))
      {
        v25 = 1;
        if (*(_DWORD *)(a2 + 48) == 1)
          goto LABEL_47;
        v24 = 1;
        if ((*(_BYTE *)(v9 + 16) & 2) == 0)
          goto LABEL_47;
      }
      else
      {
        if ((*(_BYTE *)(v9 + 16) & 1) == 0)
          goto LABEL_47;
        v24 = 1;
      }
    }
    v26 += 2;
  }
  while ((unint64_t)v26 < v27);
  if ((v24 & 1) != 0)
  {
LABEL_47:
    v31 = 3;
    goto LABEL_72;
  }
  v31 = 4;
LABEL_72:
  *(_DWORD *)(a2 + 68) = v31;
  if ((v25 & 1) == 0)
    goto LABEL_73;
  return result;
}

uint64_t __cxxabiv1::__base_class_type_info::search_above_dst(uint64_t *a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;

  v5 = a1[1];
  v6 = v5 >> 8;
  if ((v5 & 1) != 0)
    v6 = *(_QWORD *)(*a4 + v6);
  v7 = *a1;
  v8 = (char *)a4 + v6;
  if ((v5 & 2) != 0)
    a5 = a5;
  else
    a5 = 2;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *, uint64_t))(*(_QWORD *)v7 + 40))(v7, a2, a3, v8, a5);
}

uint64_t __cxxabiv1::__base_class_type_info::search_below_dst(uint64_t *a1, uint64_t a2, _QWORD *a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;

  v4 = a1[1];
  v5 = v4 >> 8;
  if ((v4 & 1) != 0)
    v5 = *(_QWORD *)(*a3 + v5);
  v6 = *a1;
  v7 = (char *)a3 + v5;
  if ((v4 & 2) != 0)
    a4 = a4;
  else
    a4 = 2;
  return (*(uint64_t (**)(uint64_t, uint64_t, char *, uint64_t))(*(_QWORD *)v6 + 48))(v6, a2, v7, a4);
}

uint64_t __cxxabiv1::__si_class_type_info::search_below_dst(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  int v12;
  int v13;

  v9 = result;
  v10 = *(_QWORD *)(a2 + 16);
  if ((a5 & 1) != 0)
  {
    if (v10 != result)
    {
      v11 = (const char *)(*(_QWORD *)(result + 8) & 0x7FFFFFFFFFFFFFFFLL);
      result = strcmp(v11, (const char *)(*(_QWORD *)(v10 + 8) & 0x7FFFFFFFFFFFFFFFLL));
      if ((_DWORD)result)
      {
        if (*(_QWORD *)a2 != v9)
        {
          result = strcmp(v11, (const char *)(*(_QWORD *)(*(_QWORD *)a2 + 8) & 0x7FFFFFFFFFFFFFFFLL));
          if ((_DWORD)result)
            return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(**(_QWORD **)(v9 + 16) + 48))(*(_QWORD *)(v9 + 16), a2, a3, a4, a5);
        }
        goto LABEL_12;
      }
    }
LABEL_8:
    if (*(_QWORD *)(a2 + 8) == a3 && *(_DWORD *)(a2 + 52) != 1)
      *(_DWORD *)(a2 + 52) = a4;
    return result;
  }
  result = std::type_info::operator==[abi:ne180100](result, v10);
  if ((result & 1) != 0)
    goto LABEL_8;
  result = std::type_info::operator==[abi:ne180100](v9, *(_QWORD *)a2);
  if ((result & 1) == 0)
    return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(**(_QWORD **)(v9 + 16) + 48))(*(_QWORD *)(v9 + 16), a2, a3, a4, a5);
LABEL_12:
  if (*(_QWORD *)(a2 + 32) == a3 || *(_QWORD *)(a2 + 40) == a3)
  {
    if ((_DWORD)a4 == 1)
      *(_DWORD *)(a2 + 56) = 1;
  }
  else
  {
    *(_DWORD *)(a2 + 56) = a4;
    if (*(_DWORD *)(a2 + 68) != 4)
    {
      *(_WORD *)(a2 + 76) = 0;
      result = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(_QWORD **)(v9 + 16)
                                                                                              + 40))(*(_QWORD *)(v9 + 16), a2, a3, a3, 1, a5);
      if (*(_BYTE *)(a2 + 77))
      {
        v12 = *(unsigned __int8 *)(a2 + 76);
        *(_DWORD *)(a2 + 68) = 3;
        if (v12)
          return result;
      }
      else
      {
        *(_DWORD *)(a2 + 68) = 4;
      }
    }
    *(_QWORD *)(a2 + 40) = a3;
    v13 = *(_DWORD *)(a2 + 60);
    ++*(_DWORD *)(a2 + 64);
    if (v13 == 1 && *(_DWORD *)(a2 + 48) == 2)
      *(_BYTE *)(a2 + 78) = 1;
  }
  return result;
}

uint64_t __cxxabiv1::__class_type_info::search_below_dst(uint64_t result, uint64_t *a2, uint64_t a3, int a4, char a5)
{
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  int v11;

  v8 = result;
  v9 = a2[2];
  if ((a5 & 1) != 0)
  {
    if (v9 != result)
    {
      v10 = (const char *)(*(_QWORD *)(result + 8) & 0x7FFFFFFFFFFFFFFFLL);
      result = strcmp(v10, (const char *)(*(_QWORD *)(v9 + 8) & 0x7FFFFFFFFFFFFFFFLL));
      if ((_DWORD)result)
      {
        if (*a2 != v8)
        {
          result = strcmp(v10, (const char *)(*(_QWORD *)(*a2 + 8) & 0x7FFFFFFFFFFFFFFFLL));
          if ((_DWORD)result)
            return result;
        }
        goto LABEL_12;
      }
    }
  }
  else
  {
    result = std::type_info::operator==[abi:ne180100](result, v9);
    if ((result & 1) == 0)
    {
      result = std::type_info::operator==[abi:ne180100](v8, *a2);
      if ((result & 1) == 0)
        return result;
LABEL_12:
      if (a2[4] == a3 || a2[5] == a3)
      {
        if (a4 == 1)
          *((_DWORD *)a2 + 14) = 1;
      }
      else
      {
        *((_DWORD *)a2 + 14) = a4;
        a2[5] = a3;
        v11 = *((_DWORD *)a2 + 15);
        ++*((_DWORD *)a2 + 16);
        if (v11 == 1 && *((_DWORD *)a2 + 12) == 2)
          *((_BYTE *)a2 + 78) = 1;
        *((_DWORD *)a2 + 17) = 4;
      }
      return result;
    }
  }
  if (a2[1] == a3 && *((_DWORD *)a2 + 13) != 1)
    *((_DWORD *)a2 + 13) = a4;
  return result;
}

void __cxxabiv1::__vmi_class_type_info::search_above_dst(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, unsigned int a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  int v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v11 = a1;
  v12 = *(_QWORD *)(a2 + 16);
  if ((a6 & 1) == 0)
  {
    a1 = std::type_info::operator==[abi:ne180100](a1, v12);
    if ((a1 & 1) == 0)
      goto LABEL_4;
LABEL_25:
    __cxxabiv1::__class_type_info::process_static_type_above_dst(a1, a2, a3, (uint64_t)a4, a5);
    return;
  }
  if (v12 == a1)
    goto LABEL_25;
  a1 = strcmp((const char *)(*(_QWORD *)(a1 + 8) & 0x7FFFFFFFFFFFFFFFLL), (const char *)(*(_QWORD *)(v12 + 8) & 0x7FFFFFFFFFFFFFFFLL));
  if (!(_DWORD)a1)
    goto LABEL_25;
LABEL_4:
  v13 = *(unsigned __int8 *)(a2 + 76);
  v14 = *(unsigned __int8 *)(a2 + 77);
  v15 = v11 + 16 * *(unsigned int *)(v11 + 20) + 24;
  *(_WORD *)(a2 + 76) = 0;
  v16 = *(_QWORD *)(v11 + 32);
  v17 = v16 >> 8;
  if ((v16 & 1) != 0)
    v17 = *(_QWORD *)(*(_QWORD *)a4 + v17);
  if ((v16 & 2) != 0)
    v18 = a5;
  else
    v18 = 2;
  (*(void (**)(_QWORD, uint64_t, uint64_t, char *, uint64_t, uint64_t))(**(_QWORD **)(v11 + 24) + 40))(*(_QWORD *)(v11 + 24), a2, a3, &a4[v17], v18, a6);
  v19 = *(unsigned __int8 *)(a2 + 76);
  v20 = v19 | v13;
  v21 = *(unsigned __int8 *)(a2 + 77);
  v22 = v21 | v14;
  v23 = (uint64_t *)(v11 + 40);
  while ((unint64_t)v23 < v15 && !*(_BYTE *)(a2 + 78))
  {
    if (v19)
    {
      if (*(_DWORD *)(a2 + 48) == 1 || (*(_BYTE *)(v11 + 16) & 2) == 0)
        break;
    }
    else if (v21 && (*(_BYTE *)(v11 + 16) & 1) == 0)
    {
      break;
    }
    *(_WORD *)(a2 + 76) = 0;
    v24 = v23[1];
    v25 = v24 >> 8;
    if ((v24 & 1) != 0)
      v25 = *(_QWORD *)(*(_QWORD *)a4 + v25);
    v27 = *v23;
    v23 += 2;
    v26 = v27;
    if ((v24 & 2) != 0)
      v28 = a5;
    else
      v28 = 2;
    (*(void (**)(uint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t))(*(_QWORD *)v26 + 40))(v26, a2, a3, &a4[v25], v28, a6);
    v19 = *(unsigned __int8 *)(a2 + 76);
    v20 |= v19;
    v21 = *(unsigned __int8 *)(a2 + 77);
    v22 |= v21;
  }
  *(_BYTE *)(a2 + 76) = v20 != 0;
  *(_BYTE *)(a2 + 77) = v22 != 0;
}

void __cxxabiv1::__si_class_type_info::search_above_dst(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;

  v11 = a1;
  v12 = *(_QWORD *)(a2 + 16);
  if ((a6 & 1) != 0)
  {
    if (v12 != a1)
    {
      a1 = strcmp((const char *)(*(_QWORD *)(a1 + 8) & 0x7FFFFFFFFFFFFFFFLL), (const char *)(*(_QWORD *)(v12 + 8) & 0x7FFFFFFFFFFFFFFFLL));
      if ((_DWORD)a1)
        goto LABEL_4;
    }
  }
  else
  {
    a1 = std::type_info::operator==[abi:ne180100](a1, v12);
    if ((a1 & 1) == 0)
    {
LABEL_4:
      (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(_QWORD **)(v11 + 16) + 40))(*(_QWORD *)(v11 + 16), a2, a3, a4, a5, a6);
      return;
    }
  }
  __cxxabiv1::__class_type_info::process_static_type_above_dst(a1, a2, a3, a4, a5);
}

void __cxxabiv1::__class_type_info::search_above_dst(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, char a6)
{
  uint64_t v10;

  v10 = *(_QWORD *)(a2 + 16);
  if ((a6 & 1) == 0)
  {
    a1 = std::type_info::operator==[abi:ne180100](a1, v10);
    if ((a1 & 1) == 0)
      return;
LABEL_6:
    __cxxabiv1::__class_type_info::process_static_type_above_dst(a1, a2, a3, a4, a5);
    return;
  }
  if (v10 == a1)
    goto LABEL_6;
  a1 = strcmp((const char *)(*(_QWORD *)(a1 + 8) & 0x7FFFFFFFFFFFFFFFLL), (const char *)(*(_QWORD *)(v10 + 8) & 0x7FFFFFFFFFFFFFFFLL));
  if (!(_DWORD)a1)
    goto LABEL_6;
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  if (v2 == v3)
    return 1;
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3))
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  return 0;
}

void *__cdecl operator new(size_t __sz, std::align_val_t a2, const std::nothrow_t *a3)
{
  return operator new(__sz, a2);
}

void sub_1DED63ED8(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x1DED63ED0);
}

void *__cdecl operator new[](size_t __sz, std::align_val_t a2, const std::nothrow_t *a3)
{
  return operator new(__sz, a2);
}

void sub_1DED63F00(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x1DED63EF8);
}

void operator delete(void *__p, size_t __sz, std::align_val_t a3)
{
  JUMPOUT(0x1DF0EF2C8);
}

void operator delete[](void *__p, size_t __sz, std::align_val_t a3)
{
  JUMPOUT(0x1DF0EF298);
}

void operator new(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __vtable(a1, a2, (uint64_t)__vtable, a4, a5, a6, a7, a8);
}

{
  __vtable(a1, a2, a3, a4, a5, a6, a7, a8);
}

void operator new[](uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __vtable(a1, a2, (uint64_t)__vtable, a4, a5, a6, a7, a8);
}

{
  __vtable(a1, a2, a3, a4, a5, a6, a7, a8);
}

void (*$_0::operator()(void)const::{lambda(unsigned long,std::__type_descriptor_t)#2}::__invoke(unint64_t a1, malloc_type_id_t a2))(void)
{
  void (*result)(void);
  std::bad_alloc *exception;
  std::bad_alloc *v4;

  result = __typed_operator_new_impl[abi:ne180100](a1, a2);
  if (!result)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    v4 = std::bad_alloc::bad_alloc(exception);
  }
  return result;
}

void (*__typed_operator_new_impl[abi:ne180100](unint64_t a1, malloc_type_id_t a2))(void)
{
  malloc_type_id_t v2;
  uint64_t v3;
  size_t v4;
  void (*result)(void);

  v2 = a2;
  if (a1 <= 1)
    v3 = 1;
  else
    v3 = a1;
  v4 = v3;
  while (1)
  {
    result = (void (*)(void))malloc_type_malloc(v4, a2);
    if (result)
      break;
    result = std::get_new_handler();
    if (!result)
      break;
    result();
    v4 = v3;
    a2 = v2;
  }
  return result;
}

void (*$_0::operator()(void)const::{lambda(unsigned long,std::__type_descriptor_t)#4}::__invoke(unint64_t a1, malloc_type_id_t a2))(void)
{
  void (*result)(void);
  std::bad_alloc *exception;
  std::bad_alloc *v4;

  result = __typed_operator_new_impl[abi:ne180100](a1, a2);
  if (!result)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    v4 = std::bad_alloc::bad_alloc(exception);
  }
  return result;
}

void (*$_0::operator()(void)const::{lambda(unsigned long,std::nothrow_t const&,std::__type_descriptor_t)#2}::__invoke(unint64_t a1, uint64_t a2, malloc_type_id_t a3))(void)
{
  return __typed_operator_new_impl[abi:ne180100](a1, a3);
}

void (*$_0::operator()(void)const::{lambda(unsigned long,std::nothrow_t const&,std::__type_descriptor_t)#4}::__invoke(unint64_t a1, uint64_t a2, malloc_type_id_t a3))(void)
{
  return __typed_operator_new_impl[abi:ne180100](a1, a3);
}

void $_1::__invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char vars0;

  abort_message("Terminating due to typed operator new being invoked before its static initializer in libcxx has been executed. This is likely happening in code with -ftyped-cxx-new-delete enabled and statically linking against libc++abi. If that is the case, and you cannot avoid invoking operator new in a static initializer, please try disabling TMO for that code with -fno-typed-cxx-new-delete. Otherwise, please file a bug report against libc++.", a2, a3, a4, a5, a6, a7, a8, vars0);
}

void $_2::__invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char vars0;

  abort_message("Terminating due to typed operator new being invoked before its static initializer in libcxx has been executed. This is likely happening in code with -ftyped-cxx-new-delete enabled and statically linking against libc++abi. If that is the case, and you cannot avoid invoking operator new in a static initializer, please try disabling TMO for that code with -fno-typed-cxx-new-delete. Otherwise, please file a bug report against libc++.", a2, a3, a4, a5, a6, a7, a8, vars0);
}

void $_3::__invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char vars0;

  abort_message("Terminating due to typed operator new being invoked before its static initializer in libcxx has been executed. This is likely happening in code with -ftyped-cxx-new-delete enabled and statically linking against libc++abi. If that is the case, and you cannot avoid invoking operator new in a static initializer, please try disabling TMO for that code with -fno-typed-cxx-new-delete. Otherwise, please file a bug report against libc++.", a2, a3, a4, a5, a6, a7, a8, vars0);
}

void $_4::__invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char vars0;

  abort_message("Terminating due to typed operator new being invoked before its static initializer in libcxx has been executed. This is likely happening in code with -ftyped-cxx-new-delete enabled and statically linking against libc++abi. If that is the case, and you cannot avoid invoking operator new in a static initializer, please try disabling TMO for that code with -fno-typed-cxx-new-delete. Otherwise, please file a bug report against libc++.", a2, a3, a4, a5, a6, a7, a8, vars0);
}

void _GLOBAL__sub_I_stdlib_typed_new_cpp()
{
  _BOOL4 v1;
  int v2;
  void (*v3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  _BOOL4 v5;
  BOOL v6;
  int v7;
  int v8;
  void (*v9)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  void (*v10)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  void (*v11)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v1 = (unint64_t)operator new[] < (unint64_t)operator new
    || (unint64_t)operator new[] > (unint64_t)_Unwind_DeleteException;
  v2 = (unint64_t)operator new > (unint64_t)_Unwind_DeleteException || v1;
  v3 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))$_0::operator()(void)const::{lambda(unsigned long,std::__type_descriptor_t)#4}::__invoke;
  if (v2)
    v3 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))$_0::operator()(void)const::{lambda(unsigned long,std::__type_descriptor_t)#3}::__invoke;
  v5 = (unint64_t)operator new[] < (unint64_t)operator new
    || (unint64_t)operator new[] > (unint64_t)_Unwind_DeleteException;
  v6 = (unint64_t)operator new < (unint64_t)operator new
    || (unint64_t)operator new > (unint64_t)_Unwind_DeleteException;
  v7 = v6 || v5;
  v8 = v6;
  if (v7)
    v9 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))$_0::operator()(void)const::{lambda(unsigned long,std::nothrow_t const&,std::__type_descriptor_t)#3}::__invoke;
  else
    v9 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))$_0::operator()(void)const::{lambda(unsigned long,std::nothrow_t const&,std::__type_descriptor_t)#4}::__invoke;
  if (v8)
    v10 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))$_0::operator()(void)const::{lambda(unsigned long,std::nothrow_t const&,std::__type_descriptor_t)#1}::__invoke;
  else
    v10 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))$_0::operator()(void)const::{lambda(unsigned long,std::nothrow_t const&,std::__type_descriptor_t)#2}::__invoke;
  v11 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))$_0::operator()(void)const::{lambda(unsigned long,std::__type_descriptor_t)#2}::__invoke;
  if ((unint64_t)operator new > (unint64_t)_Unwind_DeleteException)
    v11 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))$_0::operator()(void)const::{lambda(unsigned long,std::__type_descriptor_t)#1}::__invoke;
  __vtable = v11;
  __vtable = v3;
  __vtable = v10;
  __vtable = v9;
}

_QWORD *__cxxabiv1::__setExceptionClass(_QWORD *result, uint64_t a2)
{
  *result = a2;
  return result;
}

_Unwind_Exception_Class __cxxabiv1::__getExceptionClass(const _Unwind_Exception *a1)
{
  return a1->exception_class;
}

BOOL __cxxabiv1::__isOurExceptionClass(const _Unwind_Exception *a1)
{
  return a1->exception_class >> 8 == 0x434C4E47432B2BLL;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  size_t v1;
  int *v2;
  int *v3;

  v1 = (thrown_size + 143) & 0xFFFFFFFFFFFFFFF0;
  v2 = __cxxabiv1::__aligned_malloc_with_fallback(v1);
  v3 = v2;
  if (!v2)
    std::terminate();
  bzero(v2, v1);
  return v3 + 32;
}

void *__cxa_begin_catch(void *a1)
{
  _BOOL4 isOurExceptionClass;
  uintptr_t *globals;
  _Unwind_Exception *v4;
  int private_2;

  isOurExceptionClass = __cxxabiv1::__isOurExceptionClass((const _Unwind_Exception *)a1);
  globals = (uintptr_t *)__cxa_get_globals();
  v4 = __cxxabiv1::cxa_exception_from_exception_unwind_exception((_Unwind_Exception *)a1);
  if (isOurExceptionClass)
  {
    private_2 = v4[1].private_2;
    if (private_2 < 0)
      private_2 = -private_2;
    LODWORD(v4[1].private_2) = private_2 + 1;
    if (v4 != (_Unwind_Exception *)*globals)
    {
      v4[1].private_1 = *globals;
      *globals = (uintptr_t)v4;
    }
    --*((_DWORD *)globals + 2);
    return (void *)v4[2].private_2;
  }
  else
  {
    if (*globals)
      std::terminate();
    *globals = (uintptr_t)v4;
    return (char *)a1 + 32;
  }
}

void __cxa_free_exception(void *a1)
{
  void *v1;

  __cxxabiv1::__aligned_free_with_fallback((char *)a1 - 128, v1);
}

uint64_t __cxa_init_primary_exception(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = a1 - 128;
  *(_QWORD *)(a1 - 120) = 0;
  *(_QWORD *)(a1 - 96) = std::get_unexpected();
  *(_QWORD *)(a1 - 88) = std::get_terminate();
  *(_QWORD *)(a1 - 112) = a2;
  *(_QWORD *)(a1 - 104) = a3;
  *(_QWORD *)(a1 - 32) = 0x434C4E47432B2B00;
  *(_QWORD *)(a1 - 24) = __cxxabiv1::exception_cleanup_func;
  return v6;
}

void __cxxabiv1::exception_cleanup_func(_Unwind_Reason_Code a1, _Unwind_Exception *a2)
{
  if (a1 != _URC_FOREIGN_EXCEPTION_CAUGHT)
    std::__terminate((void (*)(void))a2[-2].exception_cleanup);
  __cxa_decrement_exception_refcount(&a2[1]);
}

double __cxa_allocate_dependent_exception()
{
  int *v0;
  double result;

  v0 = __cxxabiv1::__aligned_malloc_with_fallback(0x80uLL);
  if (!v0)
    std::terminate();
  result = 0.0;
  *((_OWORD *)v0 + 6) = 0u;
  *((_OWORD *)v0 + 7) = 0u;
  *((_OWORD *)v0 + 4) = 0u;
  *((_OWORD *)v0 + 5) = 0u;
  *((_OWORD *)v0 + 2) = 0u;
  *((_OWORD *)v0 + 3) = 0u;
  *(_OWORD *)v0 = 0u;
  *((_OWORD *)v0 + 1) = 0u;
  return result;
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  _DWORD *globals;
  _Unwind_Exception *inited;

  globals = __cxa_get_globals();
  ++globals[2];
  inited = (_Unwind_Exception *)__cxa_init_primary_exception((uint64_t)a1, (uint64_t)lptinfo, (uint64_t)a3);
  inited->exception_cleanup = (void (__cdecl *)(_Unwind_Reason_Code, _Unwind_Exception *))1;
  _Unwind_RaiseException(inited + 3);
  __cxxabiv1::failed_throw((uint64_t)inited);
}

void __cxxabiv1::failed_throw(uint64_t a1)
{
  __cxa_begin_catch((void *)(a1 + 96));
  std::__terminate(*(void (**)(void))(a1 + 40));
}

void *__cxa_get_exception_ptr(void *a1)
{
  return (void *)*((_QWORD *)a1 - 1);
}

_Unwind_Exception *__cxxabiv1::cxa_exception_from_exception_unwind_exception(_Unwind_Exception *a1)
{
  return a1 - 3;
}

void __cxa_end_catch(void)
{
  void *v0;
  uint64_t *globals_fast;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t v5;

  globals_fast = (uint64_t *)__cxa_get_globals_fast();
  v2 = *globals_fast;
  if (*globals_fast)
  {
    if (*(_QWORD *)(v2 + 96) >> 8 == 0x434C4E47432B2BLL)
    {
      v3 = *(_DWORD *)(v2 + 56);
      if (v3 < 0)
      {
        *(_DWORD *)(v2 + 56) = v3 + 1;
        if (v3 == -1)
          *globals_fast = *(_QWORD *)(v2 + 48);
      }
      else
      {
        v4 = v3 - 1;
        *(_DWORD *)(v2 + 56) = v4;
        if (!v4)
        {
          *globals_fast = *(_QWORD *)(v2 + 48);
          if (*(_BYTE *)(v2 + 96) == 1)
          {
            v5 = *(_QWORD *)(v2 + 8) - 128;
            __cxxabiv1::__aligned_free_with_fallback((void *)v2, v0);
            v2 = v5;
          }
          __cxa_decrement_exception_refcount((void *)(v2 + 128));
        }
      }
    }
    else
    {
      _Unwind_DeleteException((_Unwind_Exception *)(v2 + 96));
      *globals_fast = 0;
    }
  }
}

void __cxa_decrement_exception_refcount(void *primary_exception)
{
  void *v1;
  char *v2;
  unint64_t *v3;
  unint64_t v4;
  unint64_t v5;
  void (*v6)(void);

  if (primary_exception)
  {
    v2 = (char *)primary_exception - 128;
    v3 = (unint64_t *)((char *)primary_exception - 120);
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      v6 = (void (*)(void))*((_QWORD *)primary_exception - 13);
      if (v6)
        v6();
      __cxxabiv1::__aligned_free_with_fallback(v2, v1);
    }
  }
}

struct type_info *__cxa_current_exception_type(void)
{
  struct type_info *result;
  uint64_t v1;

  result = (struct type_info *)__cxa_get_globals_fast();
  if (result)
  {
    v1 = *(_QWORD *)result;
    if (*(_QWORD *)result && *(_QWORD *)(v1 + 96) >> 8 == 0x434C4E47432B2BLL)
      return *(struct type_info **)(v1 + 16);
    else
      return 0;
  }
  return result;
}

void __cxa_rethrow(void)
{
  _DWORD *globals;
  uint64_t v1;
  unint64_t v2;

  globals = __cxa_get_globals();
  v1 = *(_QWORD *)globals;
  if (*(_QWORD *)globals)
  {
    v2 = *(_QWORD *)(v1 + 96) & 0xFFFFFFFFFFFFFF00;
    if (v2 == 0x434C4E47432B2B00)
    {
      *(_DWORD *)(v1 + 56) = -*(_DWORD *)(v1 + 56);
      ++globals[2];
    }
    else
    {
      *(_QWORD *)globals = 0;
    }
    _Unwind_RaiseException((_Unwind_Exception *)(v1 + 96));
    __cxa_begin_catch((void *)(v1 + 96));
    if (v2 == 0x434C4E47432B2B00)
      std::__terminate(*(void (**)(void))(v1 + 40));
  }
  std::terminate();
}

void __cxa_increment_exception_refcount(void *primary_exception)
{
  unint64_t *v1;
  unint64_t v2;

  if (primary_exception)
  {
    v1 = (unint64_t *)((char *)primary_exception - 120);
    do
      v2 = __ldaxr(v1);
    while (__stlxr(v2 + 1, v1));
  }
}

void *__cxa_current_primary_exception(void)
{
  void *result;
  _QWORD *v1;
  unint64_t *v2;
  unint64_t v3;

  result = __cxa_get_globals_fast();
  if (result)
  {
    v1 = *(_QWORD **)result;
    if (*(_QWORD *)result && v1[12] >> 8 == 0x434C4E47432B2BLL)
    {
      if (v1[12] == 1)
        v1 = (_QWORD *)(v1[1] - 128);
      result = v1 + 16;
      v2 = v1 + 1;
      do
        v3 = __ldaxr(v2);
      while (__stlxr(v3 + 1, v2));
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void __cxa_rethrow_primary_exception(void *primary_exception)
{
  _Unwind_Exception *v2;
  _Unwind_Exception *v3;
  unint64_t *v4;
  unint64_t v5;
  std::terminate_handler terminate;
  _Unwind_Exception *v7;
  _DWORD *globals;

  if (primary_exception)
  {
    __cxa_allocate_dependent_exception();
    v3 = v2;
    v2->exception_cleanup = (void (__cdecl *)(_Unwind_Reason_Code, _Unwind_Exception *))primary_exception;
    v4 = (unint64_t *)((char *)primary_exception - 120);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 + 1, v4));
    v2->private_1 = *((_QWORD *)primary_exception - 14);
    v2[1].exception_class = (_Unwind_Exception_Class)std::get_unexpected();
    terminate = std::get_terminate();
    v3[3].exception_class = 0x434C4E47432B2B01;
    v7 = v3 + 3;
    v7[-2].exception_cleanup = (void (__cdecl *)(_Unwind_Reason_Code, _Unwind_Exception *))terminate;
    globals = __cxa_get_globals();
    ++globals[2];
    v7->exception_cleanup = (void (__cdecl *)(_Unwind_Reason_Code, _Unwind_Exception *))__cxxabiv1::dependent_exception_cleanup;
    _Unwind_RaiseException(v7);
    __cxa_begin_catch(v7);
  }
}

void __cxxabiv1::dependent_exception_cleanup(_Unwind_Reason_Code a1, _Unwind_Exception *a2)
{
  _Unwind_Exception *v2;
  void *v3;

  if (a1 != _URC_FOREIGN_EXCEPTION_CAUGHT)
    std::__terminate((void (*)(void))a2[-2].exception_cleanup);
  v2 = a2 - 3;
  __cxa_decrement_exception_refcount(a2[-3].exception_cleanup);
  __cxxabiv1::__aligned_free_with_fallback(v2, v3);
}

BOOL __cxa_uncaught_exception(void)
{
  return __cxa_uncaught_exceptions() != 0;
}

unsigned int __cxa_uncaught_exceptions(void)
{
  _DWORD *globals_fast;

  globals_fast = __cxa_get_globals_fast();
  if (globals_fast)
    LODWORD(globals_fast) = globals_fast[2];
  return globals_fast;
}

uint64_t __gxx_personality_v0(int a1, int a2, uint64_t a3, _Unwind_Exception *new_value, _Unwind_Context *context)
{
  uint64_t result;
  char v9;
  unint64_t v10;
  int private_2_high;
  __int128 v12;
  _BOOL4 v13;
  uintptr_t LanguageSpecificData;
  unsigned __int8 *v15;
  uintptr_t IP;
  uintptr_t RegionStart;
  uintptr_t v18;
  unsigned int v19;
  unsigned __int8 *v20;
  unsigned int v21;
  unsigned __int8 *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unsigned __int8 *v30;
  unsigned int v31;
  char v32;
  unsigned __int8 *v33;
  unsigned __int8 *v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unsigned __int8 *v45;
  unsigned int v46;
  unsigned int v47;
  _BOOL4 v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t shim_type_info;
  unint64_t v52;
  _Unwind_Exception_Class ExceptionClass;
  void (__cdecl *exception_cleanup)(_Unwind_Reason_Code, _Unwind_Exception *);
  uintptr_t private_1;
  uint64_t v56;
  void (__cdecl *v57)(_Unwind_Reason_Code, _Unwind_Exception *);
  const __cxxabiv1::__shim_type_info *v58;
  _BOOL4 can_catch;
  uint64_t v60;
  unint64_t v61;
  unsigned __int8 *v62;
  unsigned int v63;
  unsigned int v64;
  _BOOL4 v65;
  uint64_t v66;
  uint64_t v67;
  void (__cdecl *v68)(_Unwind_Reason_Code, _Unwind_Exception *);
  uint64_t v69;
  __int128 v70;
  uint64_t v71;
  int v72;
  unint64_t v73;
  char *EncodedPointer;
  void (__cdecl *v75)(_Unwind_Reason_Code, _Unwind_Exception *);
  unsigned __int8 *v76;
  char v77;
  _BYTE v78[40];
  int v79;
  void (__cdecl *v80)(_Unwind_Reason_Code, _Unwind_Exception *);
  unsigned __int8 *v81;
  unsigned __int8 *v82;

  result = 3;
  if (a1 != 1 || !new_value || !context)
    return result;
  v9 = a2;
  v10 = a3 & 0xFFFFFFFFFFFFFF00;
  if (a2 == 6 && v10 == 0x434C4E47432B2B00)
  {
    private_2_high = HIDWORD(new_value[-2].private_2);
    *(_QWORD *)v78 = private_2_high;
    v12 = *(_OWORD *)&new_value[-1].private_1;
    *(_OWORD *)&v78[8] = *(_OWORD *)&new_value[-1].exception_class;
    *(_OWORD *)&v78[24] = v12;
    __cxxabiv1::set_registers((uintptr_t)new_value, context, (uintptr_t *)v78);
    if (private_2_high < 0)
      goto LABEL_7;
    return 7;
  }
  memset(v78, 0, sizeof(v78));
  v79 = 3;
  v13 = (a2 & 1) == 0;
  if ((a2 & 1) != 0)
  {
    if ((a2 & 0xE) != 0)
      return result;
  }
  else
  {
    if ((a2 & 2) == 0)
      return result;
    if ((~a2 & 0xC) == 0)
    {
      v79 = 2;
      __cxxabiv1::set_registers((uintptr_t)new_value, context, (uintptr_t *)v78);
      return 7;
    }
  }
  LanguageSpecificData = _Unwind_GetLanguageSpecificData(context);
  if (!LanguageSpecificData)
    return 8;
  v15 = (unsigned __int8 *)LanguageSpecificData;
  v72 = v13;
  *(_QWORD *)&v78[16] = LanguageSpecificData;
  IP = _Unwind_GetIP(context);
  RegionStart = _Unwind_GetRegionStart(context);
  v18 = RegionStart;
  v21 = *v15;
  v20 = v15 + 1;
  v19 = v21;
  v82 = v20;
  if (v21 == 255)
  {
    EncodedPointer = (char *)RegionStart;
  }
  else
  {
    EncodedPointer = (char *)__cxxabiv1::readEncodedPointer((const unsigned __int8 **)&v82, v19, 0);
    v20 = v82;
  }
  v23 = *v20;
  v22 = v20 + 1;
  v82 = v22;
  v77 = v23;
  if (v23 == 255)
  {
    v76 = 0;
  }
  else
  {
    v24 = 0;
    v25 = 0;
    do
    {
      v26 = *v22++;
      v24 |= (unint64_t)(v26 & 0x7F) << v25;
      v25 += 7;
    }
    while (v26 < 0);
    v76 = &v22[v24];
  }
  v73 = v10;
  v27 = 0;
  v28 = 0;
  v29 = IP + ~v18;
  v30 = v22 + 1;
  v82 = v22 + 1;
  v31 = *v22;
  do
  {
    v32 = *v30++;
    v27 |= (unint64_t)(v32 & 0x7F) << v28;
    v28 += 7;
  }
  while (v32 < 0);
  v81 = v30;
  v82 = v30;
  v71 = v27;
  v33 = &v30[v27];
  v34 = v30;
  while (1)
  {
    if (v34 >= v33)
LABEL_32:
      __cxxabiv1::call_terminate(v73 == 0x434C4E47432B2B00, new_value);
    v35 = __cxxabiv1::readEncodedPointer((const unsigned __int8 **)&v81, v31, 0);
    v36 = __cxxabiv1::readEncodedPointer((const unsigned __int8 **)&v81, v31, 0);
    v37 = __cxxabiv1::readEncodedPointer((const unsigned __int8 **)&v81, v31, 0);
    v38 = 0;
    v39 = 0;
    v34 = v81;
    do
    {
      v40 = *v34++;
      v38 |= (unint64_t)(v40 & 0x7F) << v39;
      v39 += 7;
    }
    while (v40 < 0);
    v81 = v34;
    if (v35 <= v29 && v29 < v36 + v35)
      break;
    if (v29 < v35)
      goto LABEL_32;
  }
  if (!v37)
    return 8;
  *(_QWORD *)&v78[24] = &EncodedPointer[v37];
  if (!v38)
  {
LABEL_66:
    if (v72)
      result = 6;
    else
      result = 8;
    v79 = result;
    if (v72)
      goto LABEL_77;
    return result;
  }
  v41 = 0;
  v42 = (uint64_t)&v30[v71 - 1 + v38];
  v75 = (void (__cdecl *)(_Unwind_Reason_Code, _Unwind_Exception *))&new_value[1];
  while (1)
  {
    v43 = 0;
    v44 = 0;
    v45 = (unsigned __int8 *)v42;
    do
    {
      v47 = *v45++;
      v46 = v47;
      v43 |= (unint64_t)(v47 & 0x7F) << v44;
      v44 += 7;
    }
    while ((v47 & 0x80) != 0);
    v48 = v44 < 0x40;
    v49 = -1 << v44;
    if ((v48 & (v46 >> 6)) == 0)
      v49 = 0;
    v50 = v43 | v49;
    if ((v43 | v49) >= 1)
    {
      shim_type_info = __cxxabiv1::get_shim_type_info(v43 | v49, v76, v77, v73 == 0x434C4E47432B2B00, new_value, 0);
      if (!shim_type_info)
        goto LABEL_71;
      if (v73 != 0x434C4E47432B2B00)
        goto LABEL_48;
      v52 = shim_type_info;
      v80 = 0;
      ExceptionClass = __cxxabiv1::__getExceptionClass(new_value);
      exception_cleanup = (void (__cdecl *)(_Unwind_Reason_Code, _Unwind_Exception *))&new_value[1];
      if (ExceptionClass == 0x434C4E47432B2B01)
        exception_cleanup = new_value[-3].exception_cleanup;
      v80 = exception_cleanup;
      if (!exception_cleanup)
        goto LABEL_84;
      private_1 = new_value[-3].private_1;
      if (!private_1)
        goto LABEL_84;
      if (!(*(unsigned int (**)(unint64_t, uintptr_t, void (__cdecl **)(_Unwind_Reason_Code, _Unwind_Exception *)))(*(_QWORD *)v52 + 32))(v52, private_1, &v80))
      {
LABEL_48:
        v56 = v41;
        goto LABEL_57;
      }
      *(_QWORD *)v78 = v50;
      *(_QWORD *)&v78[8] = v42;
      v68 = v80;
LABEL_75:
      *(_QWORD *)&v78[32] = v68;
      goto LABEL_76;
    }
    v56 = (v50 == 0) | v41;
    if ((v9 & 8) == 0 && v50)
    {
      if (v73 != 0x434C4E47432B2B00)
      {
LABEL_71:
        *(_QWORD *)v78 = v50;
        *(_QWORD *)&v78[8] = v42;
        if (__cxxabiv1::__getExceptionClass(new_value) == 0x434C4E47432B2B01)
          v75 = new_value[-3].exception_cleanup;
        v68 = v75;
        goto LABEL_75;
      }
      v57 = (void (__cdecl *)(_Unwind_Reason_Code, _Unwind_Exception *))&new_value[1];
      if (__cxxabiv1::__getExceptionClass(new_value) == 0x434C4E47432B2B01)
        v57 = new_value[-3].exception_cleanup;
      if (!v57 || (v58 = (const __cxxabiv1::__shim_type_info *)new_value[-3].private_1) == 0)
      {
LABEL_84:
        __cxa_begin_catch(new_value);
        std::__terminate((void (*)(void))new_value[-2].exception_cleanup);
      }
      can_catch = __cxxabiv1::exception_spec_can_catch(v50, v76, v77, v58, v57, new_value, 0);
      v56 = v41;
      if (can_catch)
        break;
    }
LABEL_57:
    v60 = 0;
    v61 = 0;
    v62 = v45;
    do
    {
      v64 = *v62++;
      v63 = v64;
      v60 |= (unint64_t)(v64 & 0x7F) << v61;
      v61 += 7;
    }
    while ((v64 & 0x80) != 0);
    v65 = v61 < 0x40;
    v66 = -1 << v61;
    if ((v65 & (v63 >> 6)) == 0)
      v66 = 0;
    v67 = v60 | v66;
    if (!v67)
    {
      v72 = v56 & ((v9 & 2) >> 1);
      goto LABEL_66;
    }
    v42 = (uint64_t)&v45[v67];
    v41 = v56;
  }
  *(_QWORD *)v78 = v50;
  *(_QWORD *)&v78[8] = v42;
  *(_QWORD *)&v78[32] = v57;
LABEL_76:
  v79 = 6;
LABEL_77:
  if ((v9 & 1) != 0)
  {
    if (v73 == 0x434C4E47432B2B00)
    {
      HIDWORD(new_value[-2].private_2) = *(_DWORD *)v78;
      v70 = *(_OWORD *)&v78[24];
      *(_OWORD *)&new_value[-1].exception_class = *(_OWORD *)&v78[8];
      *(_OWORD *)&new_value[-1].private_1 = v70;
    }
    return 6;
  }
  else
  {
    v69 = *(_QWORD *)v78;
    __cxxabiv1::set_registers((uintptr_t)new_value, context, (uintptr_t *)v78);
    if (v69 < 0)
LABEL_7:
      new_value[-1].private_1 = 0;
    return 7;
  }
}

void __cxxabiv1::set_registers(uintptr_t new_value, _Unwind_Context *context, uintptr_t *a3)
{
  _Unwind_SetGR(context, 0, new_value);
  _Unwind_SetGR(context, 1, *a3);
  _Unwind_SetIP(context, a3[3]);
}

void __cxa_call_unexpected(void *a1)
{
  void (*unexpected)(void);

  if (!a1)
  {
    __cxa_begin_catch(0);
    std::terminate();
  }
  __cxa_begin_catch(a1);
  if (__cxxabiv1::__isOurExceptionClass((const _Unwind_Exception *)a1))
  {
    unexpected = (void (*)(void))*((_QWORD *)a1 - 8);
  }
  else
  {
    std::get_terminate();
    unexpected = std::get_unexpected();
  }
  std::__unexpected(unexpected);
}

void sub_1DED64DA0(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *a10, std::bad_exception a11, unsigned __int8 *a12)
{
  __break(1u);
}

void sub_1DED64F20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::bad_exception a11)
{
  std::bad_exception::~bad_exception(&a11);
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

void __cxxabiv1::call_terminate(int a1, _Unwind_Exception *a2)
{
  __cxa_begin_catch(a2);
  if (a1)
    std::__terminate((void (*)(void))a2[-2].exception_cleanup);
  std::terminate();
}

unint64_t __cxxabiv1::readEncodedPointer(const unsigned __int8 **a1, unsigned int a2, uint64_t a3)
{
  const unsigned __int8 *v3;
  unint64_t v4;
  const unsigned __int8 *v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  unint64_t v9;
  unsigned int v10;
  unsigned int v11;
  _BOOL4 v12;
  uint64_t v13;
  int v14;

  if (a2 != 255)
  {
    v3 = *a1;
    switch(a2 & 0xF)
    {
      case 0u:
      case 4u:
      case 0xCu:
        v5 = v3 + 8;
        v4 = *(_QWORD *)v3;
        goto LABEL_17;
      case 1u:
        v4 = 0;
        v6 = 0;
        v5 = *a1;
        do
        {
          v7 = *v5++;
          v4 |= (unint64_t)(v7 & 0x7F) << v6;
          v6 += 7;
        }
        while (v7 < 0);
        goto LABEL_17;
      case 2u:
        v5 = v3 + 2;
        v4 = *(unsigned __int16 *)v3;
        goto LABEL_17;
      case 3u:
        v5 = v3 + 4;
        v4 = *(unsigned int *)v3;
        goto LABEL_17;
      case 9u:
        v8 = 0;
        v9 = 0;
        v5 = *a1;
        do
        {
          v11 = *v5++;
          v10 = v11;
          v8 |= (unint64_t)(v11 & 0x7F) << v9;
          v9 += 7;
        }
        while ((v11 & 0x80) != 0);
        v12 = v9 < 0x40;
        v13 = -1 << v9;
        if ((v12 & (v10 >> 6)) == 0)
          v13 = 0;
        v4 = v8 | v13;
        goto LABEL_17;
      case 0xAu:
        v5 = v3 + 2;
        v4 = *(__int16 *)v3;
        goto LABEL_17;
      case 0xBu:
        v5 = v3 + 4;
        v4 = *(int *)v3;
LABEL_17:
        v14 = (a2 >> 4) & 7;
        switch(v14)
        {
          case 0:
            goto LABEL_22;
          case 3:
            if (!v4)
              goto LABEL_28;
            v4 += a3;
            if (!v4)
              goto LABEL_28;
            break;
          case 1:
            if (!v4)
              goto LABEL_28;
            v4 += (unint64_t)v3;
LABEL_22:
            if (!v4)
            {
LABEL_28:
              *a1 = v5;
              return v4;
            }
            break;
          default:
LABEL_30:
            abort();
        }
        if ((a2 & 0x80) != 0)
          v4 = *(_QWORD *)v4;
        goto LABEL_28;
      default:
        goto LABEL_30;
    }
  }
  return 0;
}

BOOL __cxxabiv1::exception_spec_can_catch(uint64_t a1, const unsigned __int8 *a2, char a3, const __cxxabiv1::__shim_type_info *a4, void *a5, _Unwind_Exception *a6, uint64_t a7)
{
  uint64_t v13;
  char v14;
  uint64_t i;
  unint64_t shim_type_info;
  void *v18;

  if (!a2)
  {
    __cxa_begin_catch(a6);
    std::terminate();
  }
  v13 = 0;
  v14 = 0;
  for (i = ~a1; ; ++i)
  {
    v13 |= (unint64_t)(a2[i] & 0x7F) << v14;
    if ((a2[i] & 0x80) == 0)
      break;
    v14 += 7;
LABEL_8:
    ;
  }
  if (v13)
  {
    shim_type_info = __cxxabiv1::get_shim_type_info(v13, a2, a3, 1, a6, a7);
    v18 = a5;
    if (!(*(unsigned int (**)(unint64_t, const __cxxabiv1::__shim_type_info *, void **))(*(_QWORD *)shim_type_info + 32))(shim_type_info, a4, &v18))
    {
      v13 = 0;
      v14 = 0;
      goto LABEL_8;
    }
  }
  return v13 == 0;
}

unint64_t __cxxabiv1::get_shim_type_info(uint64_t a1, const unsigned __int8 *a2, char a3, int a4, _Unwind_Exception *a5, uint64_t a6)
{
  unsigned __int8 *v7;

  if (!a2 || (a3 & 0xFu) >= 0xD || ((0x1C1Du >> (a3 & 0xF)) & 1) == 0)
    __cxxabiv1::call_terminate(a4, a5);
  v7 = (unsigned __int8 *)&a2[qword_1DED68628[a3 & 0xF] * a1];
  return __cxxabiv1::readEncodedPointer((const unsigned __int8 **)&v7, a3, a6);
}

int __cxa_guard_acquire(__guard *a1)
{
  _BOOL4 v2;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  int v14;
  _opaque_pthread_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  _opaque_pthread_t *v24;
  char v26;

  if (atomic_load((unsigned __int8 *)a1))
    return 0;
  v4 = "__cxa_guard_acquire";
  v5 = pthread_mutex_lock(&stru_1ECCE7F60);
  if ((_DWORD)v5)
    abort_message("%s failed to acquire mutex", v6, v7, v8, v9, v10, v11, v12, (char)"__cxa_guard_acquire");
  v13 = *((_BYTE *)a1 + 1);
  if ((v13 & 2) != 0)
  {
    v14 = *((_DWORD *)a1 + 1);
    v15 = pthread_self();
    v5 = pthread_mach_thread_np(v15);
    LODWORD(v4) = v5;
    if (v14 == (_DWORD)v5)
      abort_message("__cxa_guard_acquire detected recursive initialization: do you have a function-local static variable whose initialization depends on that function?", v16, v17, v18, v19, v20, v21, v22, v26);
  }
  while (1)
  {
    v23 = *((unsigned __int8 *)a1 + 1);
    if ((v23 & 2) == 0)
      break;
    *((_BYTE *)a1 + 1) = v23 | 4;
    v5 = pthread_cond_wait(&_MergedGlobals, &stru_1ECCE7F60);
  }
  if (v23 != 1)
  {
    if ((v13 & 2) == 0)
    {
      v24 = pthread_self();
      v5 = pthread_mach_thread_np(v24);
      LODWORD(v4) = v5;
    }
    *((_DWORD *)a1 + 1) = (_DWORD)v4;
    *((_BYTE *)a1 + 1) = 2;
  }
  v2 = v23 != 1;
  OUTLINED_FUNCTION_1(v5);
  return v2;
}

void sub_1DED652EC(_Unwind_Exception *a1)
{
  OUTLINED_FUNCTION_1((uint64_t)a1);
  _Unwind_Resume(a1);
}

void __cxa_guard_release(__guard *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  atomic_store(1u, (unsigned __int8 *)a1);
  v2 = pthread_mutex_lock(&stru_1ECCE7F60);
  if ((_DWORD)v2)
    abort_message("%s failed to acquire mutex", v3, v4, v5, v6, v7, v8, v9, (char)"__cxa_guard_release");
  v10 = *((_BYTE *)a1 + 1);
  *((_BYTE *)a1 + 1) = 1;
  OUTLINED_FUNCTION_1(v2);
  if ((v10 & 4) != 0 && pthread_cond_broadcast(&_MergedGlobals))
    abort_message("%s failed to broadcast", v11, v12, v13, v14, v15, v16, v17, (char)"__cxa_guard_release");
  OUTLINED_FUNCTION_0();
}

void __cxa_guard_abort(__guard *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v2 = pthread_mutex_lock(&stru_1ECCE7F60);
  if ((_DWORD)v2)
    abort_message("%s failed to acquire mutex", v3, v4, v5, v6, v7, v8, v9, (char)"__cxa_guard_abort");
  *((_DWORD *)a1 + 1) = 0;
  v10 = *((_BYTE *)a1 + 1);
  *((_BYTE *)a1 + 1) = 0;
  OUTLINED_FUNCTION_1(v2);
  if ((v10 & 4) != 0 && pthread_cond_broadcast(&_MergedGlobals))
    abort_message("%s failed to broadcast", v11, v12, v13, v14, v15, v16, v17, (char)"__cxa_guard_abort");
  OUTLINED_FUNCTION_0();
}

void *__cdecl operator new(size_t __sz)
{
  unint64_t v1;
  size_t v2;
  void *result;
  void (*new_handler)(void);
  std::bad_alloc *exception;
  std::bad_alloc *v6;

  if (__sz <= 1)
    v2 = 1;
  else
    v2 = __sz;
  while (1)
  {
    result = malloc_type_malloc(v2, (v1 >> 2) | 0xC0000000000);
    if (result)
      break;
    new_handler = std::get_new_handler();
    if (!new_handler)
    {
      exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
      v6 = std::bad_alloc::bad_alloc(exception);
    }
    new_handler();
  }
  return result;
}

{
  return __Znwm(__sz);
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  return operator new(__sz);
}

{
  return __ZnwmRKSt9nothrow_t(__sz, a2);
}

void sub_1DED65480(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x1DED65478);
}

void *__cdecl operator new[](size_t __sz, const std::nothrow_t *a2)
{
  return operator new[](__sz);
}

{
  return __ZnamRKSt9nothrow_t(__sz, a2);
}

void sub_1DED654AC(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x1DED654A4);
}

void *__cdecl operator new(size_t __sz, std::align_val_t a2)
{
  size_t v2;
  std::align_val_t v3;
  size_t v4;
  void *result;
  void (*new_handler)(void);
  std::bad_alloc *exception;
  std::bad_alloc *v8;

  if (__sz <= 1)
    v2 = 1;
  else
    v2 = __sz;
  if (a2 <= 8)
    v3 = 8;
  else
    v3 = a2;
  if (((v2 + v3 - 1) & -(uint64_t)v3) <= v2)
    v4 = v2;
  else
    v4 = (v2 + v3 - 1) & -(uint64_t)v3;
  while (1)
  {
    result = malloc_type_aligned_alloc(v3, v4, 0x76A2E741uLL);
    if (result)
      break;
    new_handler = std::get_new_handler();
    if (!new_handler)
    {
      exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
      v8 = std::bad_alloc::bad_alloc(exception);
    }
    new_handler();
  }
  return result;
}

{
  return __ZnwmSt11align_val_t(__sz, a2);
}

void _Unwind_DeleteException(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C809F0](exception_object);
}

uintptr_t _Unwind_GetIP(_Unwind_Context *context)
{
  return MEMORY[0x1E0C80A00](context);
}

uintptr_t _Unwind_GetLanguageSpecificData(_Unwind_Context *context)
{
  return MEMORY[0x1E0C80A08](context);
}

uintptr_t _Unwind_GetRegionStart(_Unwind_Context *context)
{
  return MEMORY[0x1E0C80A10](context);
}

_Unwind_Reason_Code _Unwind_RaiseException(_Unwind_Exception *exception_object)
{
  return MEMORY[0x1E0C80A18](exception_object);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void _Unwind_SetGR(_Unwind_Context *context, int index, uintptr_t new_value)
{
  MEMORY[0x1E0C80A28](context, *(_QWORD *)&index, new_value);
}

void _Unwind_SetIP(_Unwind_Context *a1, uintptr_t new_value)
{
  MEMORY[0x1E0C80A30](a1, new_value);
}

void operator delete[](void *__p)
{
  __ZdaPv(__p);
}

void operator delete[](void *__p, const std::nothrow_t *a2)
{
  __ZdaPvRKSt9nothrow_t(__p, a2);
}

void operator delete[](void *__p, std::align_val_t a2)
{
  __ZdaPvSt11align_val_t(__p, a2);
}

void operator delete[](void *__p, size_t __sz)
{
  __ZdaPvm(__p, __sz);
}

void operator delete(void *__p)
{
  __ZdlPv(__p);
}

{
  __ZdlPvSt19__type_descriptor_t(__p);
}

void operator delete(void *__p, const std::nothrow_t *a2)
{
  __ZdlPvRKSt9nothrow_t(__p, a2);
}

void operator delete(void *__p, std::align_val_t a2)
{
  __ZdlPvSt11align_val_t(__p, a2);
}

void operator delete(void *__p, size_t __sz)
{
  __ZdlPvm(__p, __sz);
}

void *__cdecl operator new[](size_t __sz)
{
  return __Znam(__sz);
}

void *__cdecl operator new[](size_t __sz, std::align_val_t a2)
{
  return __ZnamSt11align_val_t(__sz, a2);
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1E0C83488](*(_QWORD *)&a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

void *__cdecl malloc_type_aligned_alloc(size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF0](alignment, size, type_id);
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

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x1E0C84D18](a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1E0C84D48](a1, a2);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1E0C84DC0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1E0C84DE0](a1, a2);
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x1E0C84E00](a1);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1E0C84E68](a1, a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1E0C84ED8]();
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1E0C84F18](a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x1E0C857D0](*(_QWORD *)&a1, a2);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x1E0C85A58](a1, a2, a3);
}

