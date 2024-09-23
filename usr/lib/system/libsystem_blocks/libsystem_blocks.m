void *HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)4>(void *result, uint64_t a2, uint64_t a3)
{
  unsigned int v3;
  _QWORD *v4;
  const void **v5;
  _QWORD *v6;
  unsigned int v7;

  if (*((_DWORD *)result + 6))
    HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)3>((uint64_t)result, a2, a3);
  v3 = a2;
  if ((_DWORD)a2)
  {
    v4 = result;
    v6 = (_QWORD *)*((_QWORD *)result + 1);
    v5 = (const void **)*((_QWORD *)result + 2);
    do
    {
      result = _Block_copy(*v5);
      *v6 = result;
      v6 = (_QWORD *)(v4[1] + 8);
      v5 = (const void **)(v4[2] + 8);
      v4[1] = v6;
      v4[2] = v5;
      v7 = *((_DWORD *)v4 + 6) + 1;
      *((_DWORD *)v4 + 6) = v7;
    }
    while (v7 < v3);
  }
  return result;
}

uint64_t HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)5>(uint64_t result, uint64_t a2, uint64_t a3)
{
  unsigned int v3;
  uint64_t v4;
  const void **v5;
  unsigned int v6;

  if (*(_DWORD *)(result + 24))
    HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)3>(result, a2, a3);
  v3 = a2;
  if ((_DWORD)a2)
  {
    v4 = result;
    result = *(_QWORD *)(result + 8);
    v5 = *(const void ***)(v4 + 16);
    do
    {
      _Block_object_assign((void *)result, *v5, 8);
      result = *(_QWORD *)(v4 + 8) + 8;
      v5 = (const void **)(*(_QWORD *)(v4 + 16) + 8);
      *(_QWORD *)(v4 + 8) = result;
      *(_QWORD *)(v4 + 16) = v5;
      v6 = *(_DWORD *)(v4 + 24) + 1;
      *(_DWORD *)(v4 + 24) = v6;
    }
    while (v6 < v3);
  }
  return result;
}

uint64_t HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)6>(uint64_t result, uint64_t a2, uint64_t a3)
{
  unsigned int v3;
  uint64_t v4;
  id *v5;
  unsigned int v6;

  if (*(_DWORD *)(result + 24))
    HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)3>(result, a2, a3);
  v3 = a2;
  if ((_DWORD)a2)
  {
    v4 = result;
    result = *(_QWORD *)(result + 8);
    v5 = *(id **)(v4 + 16);
    do
    {
      objc_copyWeak((id *)result, v5);
      result = *(_QWORD *)(v4 + 8) + 8;
      v5 = (id *)(*(_QWORD *)(v4 + 16) + 8);
      *(_QWORD *)(v4 + 8) = result;
      *(_QWORD *)(v4 + 16) = v5;
      v6 = *(_DWORD *)(v4 + 24) + 1;
      *(_DWORD *)(v4 + 24) = v6;
    }
    while (v6 < v3);
  }
  return result;
}

BOOL HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)6>(uint64_t a1, unsigned int a2, id *a3)
{
  id *v6;
  _BOOL8 v7;
  unsigned int v8;

  if (*(_DWORD *)(a1 + 24) >= a2)
    return 0;
  v6 = *(id **)(a1 + 8);
  do
  {
    v7 = v6 == a3;
    if (v6 == a3)
      break;
    objc_destroyWeak(v6);
    v6 = (id *)(*(_QWORD *)(a1 + 8) + 8);
    *(_QWORD *)(a1 + 8) = v6;
    v8 = *(_DWORD *)(a1 + 24) + 1;
    *(_DWORD *)(a1 + 24) = v8;
  }
  while (v8 < a2);
  return v7;
}

id HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)3>(id result, uint64_t a2, uint64_t a3)
{
  unsigned int v3;
  _QWORD *v4;
  id *v5;
  unsigned int v6;

  if (*((_DWORD *)result + 6))
    HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)3>((uint64_t)result, a2, a3);
  v3 = a2;
  if ((_DWORD)a2)
  {
    v4 = result;
    v5 = (id *)*((_QWORD *)result + 2);
    do
    {
      result = *v5;
      v5 = (id *)(v4[2] + 8);
      v4[1] += 8;
      v4[2] = v5;
      v6 = *((_DWORD *)v4 + 6) + 1;
      *((_DWORD *)v4 + 6) = v6;
    }
    while (v6 < v3);
  }
  return result;
}

void HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)3>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0("copyCapture", "runtime.cpp", a3, "capcounter == 0 && \"capcounter expected to be zero\"");
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  char *v3;
  unsigned int v5;
  uint64_t v7;
  unsigned int *v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  char *v12;

  v3 = (char *)a2;
  v5 = a3 & 0x9F;
  if (v5 > 0x17)
  {
    if (v5 - 131 > 0x14 || ((1 << (v5 + 125)) & 0x110011) == 0)
    {
      if (v5 != 24)
        return;
      goto LABEL_12;
    }
LABEL_27:
    *(_QWORD *)a1 = v3;
    return;
  }
  switch(v5)
  {
    case 3u:
      _Block_retain_object(a2);
      goto LABEL_27;
    case 7u:
      v3 = (char *)_Block_copy(a2);
      goto LABEL_27;
    case 8u:
LABEL_12:
      v7 = *((_QWORD *)a2 + 1);
      v9 = *(_DWORD *)(v7 + 16);
      v8 = (unsigned int *)(v7 + 16);
      if ((v9 & 0xFFFE) != 0)
      {
        if ((*v8 & 0x1000000) != 0)
        {
          while (1)
          {
            v10 = *v8;
            if ((~*v8 & 0xFFFE) == 0)
              break;
            while (1)
            {
              v11 = __ldaxr(v8);
              if (v11 != v10)
                break;
              if (!__stlxr(v10 + 2, v8))
                goto LABEL_26;
            }
            __clrex();
          }
        }
      }
      else
      {
        v12 = (char *)malloc_type_malloc(*((unsigned int *)a2 + 5), 0x9B1279E0uLL);
        *(_QWORD *)v12 = 0;
        *((_DWORD *)v12 + 4) = *((_DWORD *)v3 + 4) | 0x1000004;
        *((_QWORD *)v12 + 1) = v12;
        *((_QWORD *)v3 + 1) = v12;
        *((_DWORD *)v12 + 5) = *((_DWORD *)v3 + 5);
        if ((*((_DWORD *)v3 + 4) & 0x2000000) != 0)
        {
          *(_OWORD *)(v12 + 24) = *(_OWORD *)(v3 + 24);
          if (*((_DWORD *)v3 + 4) >> 28 == 1)
            *((_QWORD *)v12 + 5) = *((_QWORD *)v3 + 5);
          (*((void (**)(void))v3 + 3))();
        }
        else
        {
          _platform_memmove();
        }
      }
LABEL_26:
      v3 = (char *)*((_QWORD *)v3 + 1);
      goto LABEL_27;
  }
}

BOOL HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)5>(uint64_t a1, unsigned int a2, const void **a3)
{
  const void **v6;
  _BOOL8 v7;
  unsigned int v8;

  if (*(_DWORD *)(a1 + 24) >= a2)
    return 0;
  v6 = *(const void ***)(a1 + 8);
  do
  {
    v7 = v6 == a3;
    if (v6 == a3)
      break;
    _Block_object_dispose(*v6, 8);
    v6 = (const void **)(*(_QWORD *)(a1 + 8) + 8);
    *(_QWORD *)(a1 + 8) = v6;
    v8 = *(_DWORD *)(a1 + 24) + 1;
    *(_DWORD *)(a1 + 24) = v8;
  }
  while (v8 < a2);
  return v7;
}

void _Block_object_dispose(const void *a1, const int a2)
{
  unsigned int v2;
  uint64_t v4;
  unsigned int *v5;
  unsigned int v6;
  int v7;
  int v9;
  unsigned int v10;
  unsigned int v11;

  v2 = a2 & 0x9F;
  if (v2 > 7)
  {
    if (v2 == 24 || v2 == 8)
    {
      v4 = *((_QWORD *)a1 + 1);
      v5 = (unsigned int *)(v4 + 16);
      if ((*(_DWORD *)(v4 + 16) & 0x1000000) != 0)
      {
        if ((*v5 & 0xFFFE) == 0)
          _Block_object_dispose_cold_1();
LABEL_12:
        v6 = *v5;
        v7 = *v5 & 0xFFFE;
        if (v7 && v7 != 65534)
        {
          if ((unsigned __int16)*v5 == 2)
            v9 = -1;
          else
            v9 = -2;
          v10 = v9 + v6;
          do
          {
            v11 = __ldaxr(v5);
            if (v11 != v6)
            {
              __clrex();
              goto LABEL_12;
            }
          }
          while (__stlxr(v10, v5));
          if ((unsigned __int16)v6 == 2)
          {
            if ((*v5 & 0x2000000) != 0)
              (*(void (**)(uint64_t))(v4 + 32))(v4);
            free((void *)v4);
          }
        }
      }
    }
  }
  else if (v2 == 3)
  {
    _Block_release_object(a1);
  }
  else if (v2 == 7)
  {
    _Block_release(a1);
  }
}

BOOL HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)4>(uint64_t a1, unsigned int a2, const void **a3)
{
  const void **v6;
  _BOOL8 v7;
  unsigned int v8;

  if (*(_DWORD *)(a1 + 24) >= a2)
    return 0;
  v6 = *(const void ***)(a1 + 8);
  do
  {
    v7 = v6 == a3;
    if (v6 == a3)
      break;
    _Block_release(*v6);
    v6 = (const void **)(*(_QWORD *)(a1 + 8) + 8);
    *(_QWORD *)(a1 + 8) = v6;
    v8 = *(_DWORD *)(a1 + 24) + 1;
    *(_DWORD *)(a1 + 24) = v8;
  }
  while (v8 < a2);
  return v7;
}

void _Block_release(const void *aBlock)
{
  unsigned int *v2;
  unsigned int v3;
  int v4;
  BOOL v5;
  int v6;
  unsigned int v7;
  unsigned int v8;

  if (aBlock)
  {
    v2 = (unsigned int *)((char *)aBlock + 8);
    if ((*((_DWORD *)aBlock + 2) & 0x10000000) == 0 && (*v2 & 0x1000000) != 0)
    {
LABEL_4:
      v3 = *v2;
      v4 = *v2 & 0xFFFE;
      if (v4)
        v5 = v4 == 65534;
      else
        v5 = 1;
      if (!v5)
      {
        if ((unsigned __int16)*v2 == 2)
          v6 = -1;
        else
          v6 = -2;
        v7 = v6 + v3;
        do
        {
          v8 = __ldaxr(v2);
          if (v8 != v3)
          {
            __clrex();
            goto LABEL_4;
          }
        }
        while (__stlxr(v7, v2));
        if ((unsigned __int16)v3 == 2)
        {
          if (**((_QWORD **)aBlock + 3))
            __asm { BR              X12 }
          _call_dispose_helpers_excp((uint64_t)aBlock, 0);
          _Block_destructInstance(aBlock);
          free((void *)aBlock);
        }
      }
    }
  }
}

uint64_t _call_dispose_helpers_excp(uint64_t a1, uint64_t a2)
{
  _QWORD v5[3];

  v5[1] = a1;
  v5[0] = 4;
  v5[2] = a2;
  _call_custom_dispose_helper(a1);
  if (a2)
  {
    LODWORD(v5[0]) = 3;
    _call_generic_destroy_helper(a1, a2);
  }
  LODWORD(v5[0]) = 0;
  return _cleanup_generic_captures(v5);
}

void sub_1DEE344A4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _cleanup_generic_captures((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t _call_custom_dispose_helper(uint64_t result)
{
  uint64_t (*v1)(void);

  if ((*(_DWORD *)(result + 8) & 0x2000000) != 0)
  {
    v1 = *(uint64_t (**)(void))(*(_QWORD *)(result + 24) + 24);
    if (v1)
      return v1();
  }
  return result;
}

void *__cdecl _Block_copy(const void *aBlock)
{
  unsigned int *v2;
  _DWORD *v3;
  unsigned int v5;
  unsigned int v6;

  if (!aBlock)
    return 0;
  v2 = (unsigned int *)((char *)aBlock + 8);
  if ((*((_DWORD *)aBlock + 2) & 0x1000000) != 0)
  {
    while (1)
    {
      v5 = *v2;
      if ((~*v2 & 0xFFFE) == 0)
        break;
      while (1)
      {
        v6 = __ldaxr(v2);
        if (v6 != v5)
          break;
        if (!__stlxr(v5 + 2, v2))
          return (void *)aBlock;
      }
      __clrex();
    }
    return (void *)aBlock;
  }
  if ((*v2 & 0x10000000) != 0)
    return (void *)aBlock;
  v3 = malloc_type_malloc(*(_QWORD *)(*((_QWORD *)aBlock + 3) + 8), 0x36549350uLL);
  if (v3)
  {
    if (!*((_QWORD *)aBlock + 2))
      _Block_copy_cold_1();
    _platform_memmove();
    v3[2] &= 0xFFFF0000;
    v3[2] |= 0x1000002u;
    if (**((_QWORD **)aBlock + 3))
      __asm { BR              X11 }
    _call_copy_helpers_excp((uint64_t)v3, (uint64_t)aBlock, 0);
    *(_QWORD *)v3 = OBJC_CLASS_____NSMallocBlock__;
  }
  return v3;
}

void _call_copy_helpers_excp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD v5[3];

  v5[0] = 0;
  v5[1] = a1;
  v5[2] = a3;
  if (a3)
  {
    LODWORD(v5[0]) = 1;
    _call_generic_copy_helper(a1, a2, a3);
  }
  _call_custom_copy_helper(a1, a2);
  LODWORD(v5[0]) = 0;
  _cleanup_generic_captures((uint64_t)v5);
}

void sub_1DEE34718(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _cleanup_generic_captures((uint64_t)va);
  _Unwind_Resume(a1);
}

void _cleanup_generic_captures(uint64_t a1)
{
  if (*(_DWORD *)a1)
  {
    if (*(_QWORD *)(a1 + 16))
      __asm { BR              X11 }
    free(*(void **)(a1 + 8));
  }
}

uint64_t _call_custom_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(void);
  uint64_t result;

  if ((*(_DWORD *)(a2 + 8) & 0x2000000) != 0)
  {
    v2 = *(uint64_t (**)(void))(*(_QWORD *)(a2 + 24) + 16);
    if (v2)
      return v2();
  }
  return result;
}

void _call_generic_copy_helper(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    __asm { BR              X12 }
  _call_generic_copy_helper_cold_1();
}

unint64_t HelperBase<GenericInline>::destroyBlock(GenericInline *this, uint64_t a2, int a3, id *a4)
{
  unint64_t result;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a3)
  {
    *((_DWORD *)this + 7) = *(_QWORD *)(*(_QWORD *)(a2 + 24) - 8);
    *((_DWORD *)this + 8) = 8;
    *((_DWORD *)this + 6) = 0;
    *((_QWORD *)this + 1) = a2 + 32;
  }
  while (2)
  {
    result = GenericInline::getNextOpcodeAndCount(this);
    v8 = HIDWORD(result);
    switch((int)result)
    {
      case 0:
        return result;
      case 1:
        v9 = *((_QWORD *)this + 1) + v8;
        goto LABEL_6;
      case 2:
        v9 = *((_QWORD *)this + 1) + (8 * HIDWORD(result));
LABEL_6:
        *((_QWORD *)this + 1) = v9;
        goto LABEL_14;
      case 3:
        result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)3>((uint64_t)this, HIDWORD(result), a4);
        if ((_DWORD)result)
          goto LABEL_15;
        goto LABEL_14;
      case 4:
        result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)4>((uint64_t)this, HIDWORD(result), (const void **)a4);
        if ((result & 1) != 0)
          goto LABEL_15;
        goto LABEL_14;
      case 5:
        result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)5>(this, v8, a4);
        if ((result & 1) != 0)
          goto LABEL_15;
        goto LABEL_14;
      case 6:
        result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)6>((uint64_t)this, HIDWORD(result), a4);
        if ((result & 1) == 0)
        {
LABEL_14:
          *((_DWORD *)this + 8) += 4;
          *((_DWORD *)this + 6) = 0;
          continue;
        }
LABEL_15:
        if (!a4)
          HelperBase<ExtendedOutOfLine>::destroyBlock(result, v10, v11);
        return result;
      default:
        HelperBase<ExtendedOutOfLine>::destroyBlock(result, v8, v7);
    }
  }
}

unint64_t HelperBase<GenericInline>::copyBlock(GenericInline *this, uint64_t a2, uint64_t a3)
{
  unint64_t result;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *((_DWORD *)this + 7) = *(_QWORD *)(*(_QWORD *)(a2 + 24) - 8);
  *((_DWORD *)this + 8) = 8;
  *((_DWORD *)this + 6) = 0;
  *((_QWORD *)this + 1) = a2 + 32;
  *((_QWORD *)this + 2) = a3 + 32;
  while (1)
  {
    result = GenericInline::getNextOpcodeAndCount(this);
    v6 = HIDWORD(result);
    switch((int)result)
    {
      case 0:
        return result;
      case 1:
        v7 = *((_QWORD *)this + 2) + v6;
        *((_QWORD *)this + 1) += v6;
        *((_QWORD *)this + 2) = v7;
        break;
      case 2:
        v8 = (8 * HIDWORD(result));
        v9 = *((_QWORD *)this + 1) + v8;
        v10 = *((_QWORD *)this + 2) + v8;
        *((_QWORD *)this + 1) = v9;
        *((_QWORD *)this + 2) = v10;
        break;
      case 3:
        HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)3>(this, v6, v5);
        break;
      case 4:
        HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)4>(this, v6, v5);
        break;
      case 5:
        HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)5>((uint64_t)this, v6, v5);
        break;
      case 6:
        HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)6>((uint64_t)this, v6, v5);
        break;
      default:
        HelperBase<ExtendedOutOfLine>::copyBlock(result, v6, v5);
    }
    *((_DWORD *)this + 8) += 4;
    *((_DWORD *)this + 6) = 0;
  }
}

unint64_t GenericInline::getNextOpcodeAndCount(GenericInline *this)
{
  int v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v1 = *((_DWORD *)this + 8);
  HIDWORD(v2) = v1;
  LODWORD(v2) = v1 - 8;
  v3 = 0;
  v4 = 3;
  switch((v2 >> 2))
  {
    case 0u:
      goto LABEL_5;
    case 1u:
      v4 = 4;
      goto LABEL_5;
    case 2u:
      v4 = 5;
      goto LABEL_5;
    case 3u:
      v4 = 6;
LABEL_5:
      v3 = v4 | ((unint64_t)((*((_DWORD *)this + 7) >> v1) & 0xF) << 32);
      break;
    case 4u:
      return v3;
    default:
      GenericInline::getNextOpcodeAndCount();
  }
  return v3;
}

void _call_generic_destroy_helper(uint64_t a1, uint64_t a2)
{
  if (a2)
    __asm { BR              X12 }
  _call_generic_destroy_helper_cold_1();
}

BOOL HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)3>(uint64_t a1, unsigned int a2, id *a3)
{
  id *v6;
  _BOOL8 v7;
  unsigned int v8;

  if (*(_DWORD *)(a1 + 24) >= a2)
    return 0;
  v6 = *(id **)(a1 + 8);
  do
  {
    v7 = v6 == a3;
    if (v6 == a3)
      break;

    v6 = (id *)(*(_QWORD *)(a1 + 8) + 8);
    *(_QWORD *)(a1 + 8) = v6;
    v8 = *(_DWORD *)(a1 + 24) + 1;
    *(_DWORD *)(a1 + 24) = v8;
  }
  while (v8 < a2);
  return v7;
}

uint64_t HelperBase<GenericOutOfLine>::copyBlock(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unsigned __int8 *v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = result;
  v4 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 1);
  *(_QWORD *)(result + 32) = v4;
  *(_DWORD *)(result + 24) = 0;
  *(_QWORD *)(result + 8) = a2 + 32;
  *(_QWORD *)(result + 16) = a3 + 32;
  while (1)
  {
    v5 = *v4;
    v6 = (v5 & 0xF) + 1;
    switch(v5 >> 4)
    {
      case 0u:
        return result;
      case 1u:
        v7 = *(_QWORD *)(v3 + 16) + v6;
        *(_QWORD *)(v3 + 8) += v6;
        *(_QWORD *)(v3 + 16) = v7;
        break;
      case 2u:
        v8 = (8 * v6);
        v9 = *(_QWORD *)(v3 + 8) + v8;
        v10 = *(_QWORD *)(v3 + 16) + v8;
        *(_QWORD *)(v3 + 8) = v9;
        *(_QWORD *)(v3 + 16) = v10;
        break;
      case 3u:
        result = (uint64_t)HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)3>((id)v3, v6, a3);
        break;
      case 4u:
        result = (uint64_t)HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)4>((void *)v3, v6, a3);
        break;
      case 5u:
        result = HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)5>(v3, v6, a3);
        break;
      case 6u:
        result = HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)6>(v3, v6, a3);
        break;
      default:
        HelperBase<ExtendedOutOfLine>::copyBlock(result, v6, a3);
    }
    v4 = (unsigned __int8 *)(*(_QWORD *)(v3 + 32) + 1);
    *(_QWORD *)(v3 + 32) = v4;
    *(_DWORD *)(v3 + 24) = 0;
  }
}

uint64_t HelperBase<GenericOutOfLine>::destroyBlock(uint64_t result, uint64_t a2, uint64_t a3, id *a4)
{
  uint64_t v5;
  unsigned __int8 *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 1);
    *(_QWORD *)(result + 32) = v6;
    *(_DWORD *)(result + 24) = 0;
    *(_QWORD *)(result + 8) = a2 + 32;
  }
  else
  {
    v6 = *(unsigned __int8 **)(result + 32);
  }
  while (2)
  {
    v7 = *v6;
    v8 = (v7 & 0xF) + 1;
    switch(v7 >> 4)
    {
      case 0u:
        return result;
      case 1u:
        v9 = *(_QWORD *)(v5 + 8) + v8;
        goto LABEL_7;
      case 2u:
        v9 = *(_QWORD *)(v5 + 8) + (8 * v8);
LABEL_7:
        *(_QWORD *)(v5 + 8) = v9;
        goto LABEL_15;
      case 3u:
        result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)3>(v5, v8, a4);
        if ((_DWORD)result)
          goto LABEL_16;
        goto LABEL_15;
      case 4u:
        result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)4>(v5, v8, (const void **)a4);
        if ((result & 1) != 0)
          goto LABEL_16;
        goto LABEL_15;
      case 5u:
        result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)5>(v5, v8, a4);
        if ((result & 1) != 0)
          goto LABEL_16;
        goto LABEL_15;
      case 6u:
        result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)6>(v5, v8, a4);
        if ((result & 1) == 0)
        {
LABEL_15:
          v6 = (unsigned __int8 *)(*(_QWORD *)(v5 + 32) + 1);
          *(_QWORD *)(v5 + 32) = v6;
          *(_DWORD *)(v5 + 24) = 0;
          continue;
        }
LABEL_16:
        if (!a4)
          HelperBase<ExtendedOutOfLine>::destroyBlock(result, v10, a3);
        return result;
      default:
        HelperBase<ExtendedOutOfLine>::destroyBlock(result, v8, a3);
    }
  }
}

const char *__cdecl _Block_signature(void *aBlock)
{
  uint64_t v2;

  if ((*((_DWORD *)aBlock + 2) & 0x40000000) == 0)
    return 0;
  v2 = 32;
  if ((*((_DWORD *)aBlock + 2) & 0x2000000) == 0)
    v2 = 16;
  return *(const char **)(*((_QWORD *)aBlock + 3) + v2);
}

BOOL _Block_isDeallocating(const void *aBlock)
{
  return *((_DWORD *)aBlock + 2) & 1;
}

BOOL _Block_tryRetain(const void *aBlock)
{
  unsigned int *v1;
  unsigned int v2;
  BOOL result;
  unsigned int v5;

  v1 = (unsigned int *)((char *)aBlock + 8);
  while (1)
  {
    v2 = *v1;
    result = (*v1 & 1) == 0;
    if ((~*v1 & 0xFFFE) == 0 || (*v1 & 1) != 0)
      break;
    while (1)
    {
      v5 = __ldaxr(v1);
      if (v5 != v2)
        break;
      if (!__stlxr(v2 + 2, v1))
        return 1;
    }
    __clrex();
  }
  return result;
}

BOOL _Block_has_signature(void *aBlock)
{
  uint64_t v2;

  if ((*((_DWORD *)aBlock + 2) & 0x40000000) == 0)
    return 0;
  v2 = 32;
  if ((*((_DWORD *)aBlock + 2) & 0x2000000) == 0)
    v2 = 16;
  return *(_QWORD *)(*((_QWORD *)aBlock + 3) + v2) != 0;
}

void _Block_use_RR2(const Block_callbacks_RR *callbacks)
{
  void (__cdecl *release)(const void *);

  release = callbacks->release;
  _Block_retain_object = (uint64_t (*)(const void *))callbacks->retain;
  _Block_release_object = (uint64_t (*)(const void *))release;
  _Block_destructInstance = (uint64_t (*)(const void *))callbacks->destructInstance;
}

unint64_t HelperBase<ExtendedOutOfLine>::copyBlock(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  HelperBase<ExtendedOutOfLine>::initState(a1, a2);
  *(_QWORD *)(a1 + 16) = a3 + 32;
  while (1)
  {
    result = ExtendedOutOfLine::getNextOpcodeAndCount((ExtendedOutOfLine *)a1);
    v7 = HIDWORD(result);
    switch((int)result)
    {
      case 0:
        return result;
      case 1:
        v8 = *(_QWORD *)(a1 + 16) + v7;
        *(_QWORD *)(a1 + 8) += v7;
        *(_QWORD *)(a1 + 16) = v8;
        break;
      case 2:
        v9 = (8 * HIDWORD(result));
        v10 = *(_QWORD *)(a1 + 8) + v9;
        v11 = *(_QWORD *)(a1 + 16) + v9;
        *(_QWORD *)(a1 + 8) = v10;
        *(_QWORD *)(a1 + 16) = v11;
        break;
      case 3:
        HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)3>((id)a1, v7, v6);
        break;
      case 4:
        HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)4>((void *)a1, v7, v6);
        break;
      case 5:
        HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)5>(a1, v7, v6);
        break;
      case 6:
        HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)6>(a1, v7, v6);
        break;
      default:
        HelperBase<ExtendedOutOfLine>::copyBlock(result, v7, v6);
    }
    ++*(_QWORD *)(a1 + 32);
    *(_DWORD *)(a1 + 24) = 0;
  }
}

unint64_t HelperBase<ExtendedInline>::copyBlock(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  HelperBase<ExtendedInline>::initState(a1, a2);
  *(_QWORD *)(a1 + 16) = a3 + 32;
  while (1)
  {
    result = ExtendedInline::getNextOpcodeAndCount((ExtendedInline *)a1);
    v7 = HIDWORD(result);
    switch((int)result)
    {
      case 0:
        return result;
      case 1:
        v8 = *(_QWORD *)(a1 + 16) + v7;
        *(_QWORD *)(a1 + 8) += v7;
        *(_QWORD *)(a1 + 16) = v8;
        break;
      case 2:
        v9 = (8 * HIDWORD(result));
        v10 = *(_QWORD *)(a1 + 8) + v9;
        v11 = *(_QWORD *)(a1 + 16) + v9;
        *(_QWORD *)(a1 + 8) = v10;
        *(_QWORD *)(a1 + 16) = v11;
        break;
      case 3:
        HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)3>((id)a1, v7, v6);
        break;
      case 4:
        HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)4>((void *)a1, v7, v6);
        break;
      case 5:
        HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)5>(a1, v7, v6);
        break;
      case 6:
        HelperBase<ExtendedOutOfLine>::copyCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)6>(a1, v7, v6);
        break;
      default:
        HelperBase<ExtendedOutOfLine>::copyBlock(result, v7, v6);
    }
    *(_DWORD *)(a1 + 32) -= 4;
    *(_DWORD *)(a1 + 24) = 0;
  }
}

unint64_t HelperBase<ExtendedOutOfLine>::destroyBlock(ExtendedOutOfLine *this, uint64_t a2, int a3, id *a4)
{
  unint64_t result;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a3)
    HelperBase<ExtendedOutOfLine>::initState((uint64_t)this, a2);
  while (2)
  {
    result = ExtendedOutOfLine::getNextOpcodeAndCount(this);
    v8 = HIDWORD(result);
    switch((int)result)
    {
      case 0:
        return result;
      case 1:
        v9 = *((_QWORD *)this + 1) + v8;
        goto LABEL_6;
      case 2:
        v9 = *((_QWORD *)this + 1) + (8 * HIDWORD(result));
LABEL_6:
        *((_QWORD *)this + 1) = v9;
        goto LABEL_14;
      case 3:
        result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)3>((uint64_t)this, HIDWORD(result), a4);
        if ((_DWORD)result)
          goto LABEL_15;
        goto LABEL_14;
      case 4:
        result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)4>((uint64_t)this, HIDWORD(result), (const void **)a4);
        if ((result & 1) != 0)
          goto LABEL_15;
        goto LABEL_14;
      case 5:
        result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)5>((uint64_t)this, HIDWORD(result), (const void **)a4);
        if ((result & 1) != 0)
          goto LABEL_15;
        goto LABEL_14;
      case 6:
        result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)6>((uint64_t)this, HIDWORD(result), a4);
        if ((result & 1) == 0)
        {
LABEL_14:
          ++*((_QWORD *)this + 4);
          *((_DWORD *)this + 6) = 0;
          continue;
        }
LABEL_15:
        if (!a4)
          HelperBase<ExtendedOutOfLine>::destroyBlock(result, v10, v11);
        return result;
      default:
        HelperBase<ExtendedOutOfLine>::destroyBlock(result, v8, v7);
    }
  }
}

unint64_t HelperBase<ExtendedInline>::destroyBlock(ExtendedInline *this, uint64_t a2, int a3, id *a4)
{
  unint64_t result;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a3)
    HelperBase<ExtendedInline>::initState((uint64_t)this, a2);
  while (2)
  {
    result = ExtendedInline::getNextOpcodeAndCount(this);
    v8 = HIDWORD(result);
    switch((int)result)
    {
      case 0:
        return result;
      case 1:
        v9 = *((_QWORD *)this + 1) + v8;
        goto LABEL_6;
      case 2:
        v9 = *((_QWORD *)this + 1) + (8 * HIDWORD(result));
LABEL_6:
        *((_QWORD *)this + 1) = v9;
        goto LABEL_14;
      case 3:
        result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)3>((uint64_t)this, HIDWORD(result), a4);
        if ((_DWORD)result)
          goto LABEL_15;
        goto LABEL_14;
      case 4:
        result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)4>((uint64_t)this, HIDWORD(result), (const void **)a4);
        if ((result & 1) != 0)
          goto LABEL_15;
        goto LABEL_14;
      case 5:
        result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)5>(this, v8, a4);
        if ((result & 1) != 0)
          goto LABEL_15;
        goto LABEL_14;
      case 6:
        result = HelperBase<ExtendedOutOfLine>::disposeCapture<(HelperBase<ExtendedOutOfLine>::BlockCaptureKind)6>((uint64_t)this, HIDWORD(result), a4);
        if ((result & 1) == 0)
        {
LABEL_14:
          *((_DWORD *)this + 8) -= 4;
          *((_DWORD *)this + 6) = 0;
          continue;
        }
LABEL_15:
        if (!a4)
          HelperBase<ExtendedOutOfLine>::destroyBlock(result, v10, v11);
        return result;
      default:
        HelperBase<ExtendedOutOfLine>::destroyBlock(result, v8, v7);
    }
  }
}

unint64_t HelperBase<ExtendedOutOfLine>::cleanup_captures(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  id *v5;

  switch(*(_DWORD *)a2)
  {
    case 1:
      v3 = *(_QWORD *)(a2 + 8);
      v5 = *(id **)(a1 + 8);
      v4 = 1;
      return HelperBase<ExtendedOutOfLine>::destroyBlock((ExtendedOutOfLine *)a1, v3, v4, v5);
    case 2:
    case 4:
      v3 = *(_QWORD *)(a2 + 8);
      v4 = 1;
      goto LABEL_5;
    case 3:
      *(_QWORD *)(a1 + 8) += 8;
      ++*(_DWORD *)(a1 + 24);
      v3 = *(_QWORD *)(a2 + 8);
      v4 = 0;
LABEL_5:
      v5 = 0;
      return HelperBase<ExtendedOutOfLine>::destroyBlock((ExtendedOutOfLine *)a1, v3, v4, v5);
    default:
      HelperBase<ExtendedOutOfLine>::cleanup_captures(a1, a2, a3);
  }
}

unint64_t HelperBase<ExtendedInline>::cleanup_captures(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  id *v5;

  switch(*(_DWORD *)a2)
  {
    case 1:
      v3 = *(_QWORD *)(a2 + 8);
      v5 = *(id **)(a1 + 8);
      v4 = 1;
      return HelperBase<ExtendedInline>::destroyBlock((ExtendedInline *)a1, v3, v4, v5);
    case 2:
    case 4:
      v3 = *(_QWORD *)(a2 + 8);
      v4 = 1;
      goto LABEL_5;
    case 3:
      *(_QWORD *)(a1 + 8) += 8;
      ++*(_DWORD *)(a1 + 24);
      v3 = *(_QWORD *)(a2 + 8);
      v4 = 0;
LABEL_5:
      v5 = 0;
      return HelperBase<ExtendedInline>::destroyBlock((ExtendedInline *)a1, v3, v4, v5);
    default:
      HelperBase<ExtendedOutOfLine>::cleanup_captures(a1, a2, a3);
  }
}

unint64_t HelperBase<GenericInline>::cleanup_captures(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  id *v5;

  switch(*(_DWORD *)a2)
  {
    case 1:
      v3 = *(_QWORD *)(a2 + 8);
      v5 = *(id **)(a1 + 8);
      v4 = 1;
      return HelperBase<GenericInline>::destroyBlock((GenericInline *)a1, v3, v4, v5);
    case 2:
    case 4:
      v3 = *(_QWORD *)(a2 + 8);
      v4 = 1;
      goto LABEL_5;
    case 3:
      *(_QWORD *)(a1 + 8) += 8;
      ++*(_DWORD *)(a1 + 24);
      v3 = *(_QWORD *)(a2 + 8);
      v4 = 0;
LABEL_5:
      v5 = 0;
      return HelperBase<GenericInline>::destroyBlock((GenericInline *)a1, v3, v4, v5);
    default:
      HelperBase<ExtendedOutOfLine>::cleanup_captures(a1, a2, a3);
  }
}

uint64_t HelperBase<GenericOutOfLine>::cleanup_captures(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  id *v5;

  switch(*(_DWORD *)a2)
  {
    case 1:
      v3 = *(_QWORD *)(a2 + 8);
      v5 = *(id **)(a1 + 8);
      v4 = 1;
      return HelperBase<GenericOutOfLine>::destroyBlock(a1, v3, v4, v5);
    case 2:
    case 4:
      v3 = *(_QWORD *)(a2 + 8);
      v4 = 1;
      goto LABEL_5;
    case 3:
      *(_QWORD *)(a1 + 8) += 8;
      ++*(_DWORD *)(a1 + 24);
      v3 = *(_QWORD *)(a2 + 8);
      v4 = 0;
LABEL_5:
      v5 = 0;
      return HelperBase<GenericOutOfLine>::destroyBlock(a1, v3, v4, v5);
    default:
      HelperBase<ExtendedOutOfLine>::cleanup_captures(a1, a2, a3);
  }
}

size_t Block_size(void *aBlock)
{
  return *(_QWORD *)(*((_QWORD *)aBlock + 3) + 8);
}

BOOL _Block_use_stret(void *aBlock)
{
  return (~*((_DWORD *)aBlock + 2) & 0x60000000) == 0;
}

const char *__cdecl _Block_layout(void *aBlock)
{
  uint64_t v2;

  if ((*((_DWORD *)aBlock + 2) & 0x80000000) != 0 || (*((_DWORD *)aBlock + 2) & 0x40000000) == 0)
    return 0;
  v2 = 32;
  if ((*((_DWORD *)aBlock + 2) & 0x2000000) == 0)
    v2 = 16;
  return *(const char **)(*((_QWORD *)aBlock + 3) + v2 + 8);
}

const char *__cdecl _Block_extended_layout(void *aBlock)
{
  uint64_t v2;

  if ((*((_DWORD *)aBlock + 2) & 0x80000000) == 0 || (*((_DWORD *)aBlock + 2) & 0x40000000) == 0)
    return 0;
  v2 = 32;
  if ((*((_DWORD *)aBlock + 2) & 0x2000000) == 0)
    v2 = 16;
  if (*(_QWORD *)(*((_QWORD *)aBlock + 3) + v2 + 8))
    return *(const char **)(*((_QWORD *)aBlock + 3) + v2 + 8);
  else
    return (const char *)&unk_1DEE35C0B;
}

unint64_t ExtendedOutOfLine::getNextOpcodeAndCount(ExtendedOutOfLine *this)
{
  unint64_t v1;

  v1 = **((unsigned __int8 **)this + 4);
  if (v1 >= 0x70)
    ExtendedOutOfLine::getNextOpcodeAndCount();
  return *(_QWORD *)((char *)&unk_1DEE35AC0 + ((v1 >> 1) & 0x78)) | ((unint64_t)((v1 & 0xF) + 1) << 32);
}

uint64_t HelperBase<ExtendedOutOfLine>::initState(uint64_t result, uint64_t a2)
{
  void *v2;
  uint64_t v3;

  if ((*(_DWORD *)(a2 + 8) & 0x80000000) != 0 && (*(_DWORD *)(a2 + 8) & 0x40000000) != 0)
  {
    v3 = 32;
    if ((*(_DWORD *)(a2 + 8) & 0x2000000) == 0)
      v3 = 16;
    v2 = *(void **)(*(_QWORD *)(a2 + 24) + v3 + 8);
    if (!v2)
      v2 = &unk_1DEE35C0B;
  }
  else
  {
    v2 = 0;
  }
  *(_QWORD *)(result + 32) = v2;
  *(_DWORD *)(result + 24) = 0;
  *(_QWORD *)(result + 8) = a2 + 32;
  return result;
}

uint64_t ExtendedInline::getNextOpcodeAndCount(ExtendedInline *this)
{
  int v2;
  uint64_t result;
  unint64_t v4;

  v2 = *((_DWORD *)this + 8);
  HIDWORD(v4) = v2;
  LODWORD(v4) = v2 + 4;
  result = (v4 >> 2);
  switch((int)result)
  {
    case 0:
      return result;
    case 1:
      result = 6;
      return result | ((unint64_t)((*((unsigned __int16 *)this + 14) >> v2) & 0xF) << 32);
    case 2:
      result = 5;
      return result | ((unint64_t)((*((unsigned __int16 *)this + 14) >> v2) & 0xF) << 32);
    case 3:
      return result | ((unint64_t)((*((unsigned __int16 *)this + 14) >> v2) & 0xF) << 32);
    default:
      ExtendedInline::getNextOpcodeAndCount();
  }
}

uint64_t HelperBase<ExtendedInline>::initState(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_DWORD *)(a2 + 8) & 0x80000000) != 0 && (*(_DWORD *)(a2 + 8) & 0x40000000) != 0)
  {
    v3 = 32;
    if ((*(_DWORD *)(a2 + 8) & 0x2000000) == 0)
      v3 = 16;
    v2 = *(_QWORD *)(*(_QWORD *)(a2 + 24) + v3 + 8);
    if (!v2)
      LOWORD(v2) = (unsigned __int16)&unk_1DEE35C0B;
  }
  else
  {
    LOWORD(v2) = 0;
  }
  *(_WORD *)(result + 28) = v2;
  *(_DWORD *)(result + 32) = 8;
  *(_DWORD *)(result + 24) = 0;
  *(_QWORD *)(result + 8) = a2 + 32;
  return result;
}

void OUTLINED_FUNCTION_0(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
  __assert_rtn(a1, a2, 306, a4);
}

void OUTLINED_FUNCTION_1(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
  __assert_rtn(a1, a2, 521, a4);
}

void OUTLINED_FUNCTION_2(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
  __assert_rtn(a1, a2, 491, a4);
}

void OUTLINED_FUNCTION_3(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
  __assert_rtn(a1, a2, 485, a4);
}

void OUTLINED_FUNCTION_4(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
  __assert_rtn(a1, a2, 393, a4);
}

void _call_generic_copy_helper_cold_1()
{
  __assert_rtn("_call_generic_copy_helper", "runtime.cpp", 709, "helper && \"helper is expected to be non-null\"");
}

void _call_generic_copy_helper_cold_2()
{
  __assert_rtn("_call_generic_copy_helper", "runtime.cpp", 712, "false && \"unexpected helper kind\"");
}

void HelperBase<ExtendedOutOfLine>::copyBlock(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_4("copyBlock", "runtime.cpp", a3, "false && \"unexpected opcode\"");
}

void _call_generic_destroy_helper_cold_1()
{
  __assert_rtn("_call_generic_destroy_helper", "runtime.cpp", 732, "helper && \"helper is expected to be non-null\"");
}

void _call_generic_destroy_helper_cold_2()
{
  __assert_rtn("_call_generic_destroy_helper", "runtime.cpp", 735, "false && \"unexpected helper kind\"");
}

void HelperBase<ExtendedOutOfLine>::destroyBlock(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_3("destroyBlock", "runtime.cpp", a3, "false && \"unexpected opcode\"");
}

{
  OUTLINED_FUNCTION_2("destroyBlock", "runtime.cpp", a3, "endptr && \"endptr isn't expected to be null\"");
}

void _cleanup_generic_captures_cold_1()
{
  __assert_rtn("_cleanup_generic_captures", "runtime.cpp", 765, "false && \"helper should be null in this case\"");
}

void HelperBase<ExtendedOutOfLine>::cleanup_captures(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_1("cleanup_captures", "runtime.cpp", a3, "info->state == EXCP_DESTROY_GENERIC");
}

void _Block_object_dispose_cold_1()
{
  _os_assert_log();
  _os_crash();
  __break(1u);
}

void ExtendedOutOfLine::getNextOpcodeAndCount()
{
  __assert_rtn("getNextOpcodeAndCount", "runtime.cpp", 681, "false && \"unexpected opcode\"");
}

void ExtendedInline::getNextOpcodeAndCount()
{
  __assert_rtn("getNextOpcodeAndCount", "runtime.cpp", 626, "false");
}

void GenericInline::getNextOpcodeAndCount()
{
  __assert_rtn("getNextOpcodeAndCount", "runtime.cpp", 564, "false");
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C88F60](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C87488](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t _os_assert_log()
{
  return MEMORY[0x1E0C87528]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1E0C87548]();
}

uint64_t _platform_memmove()
{
  return MEMORY[0x1E0C88AE0]();
}

void abort(void)
{
  MEMORY[0x1E0C87558]();
}

void free(void *a1)
{
  MEMORY[0x1E0C88920](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C88978](size, type_id);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

