NSUInteger NSIntersectionRangeInclusive(NSRange a1, NSRange range1)
{
  if (a1.location != range1.location + range1.length)
  {
    if (a1.location + a1.length == range1.location)
      a1.location = range1.location;
    else
      a1.location = NSIntersectionRange(a1, range1).location;
  }
  return a1.location;
}

double TSURound(double a1)
{
  return round(a1);
}

uint64_t TSUDynamicCast(uint64_t a1, uint64_t a2)
{
  if (!a2)
    return 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return a2;
  return 0;
}

uint64_t TSUDeviceRGBColorSpace()
{
  if (TSUDeviceRGBColorSpace_sDeviceRGBDispatchOnce != -1)
    dispatch_once(&TSUDeviceRGBColorSpace_sDeviceRGBDispatchOnce, &__block_literal_global_3);
  return TSUDeviceRGBColorSpace_sDeviceRGBColorSpace;
}

uint64_t TSUDeviceGrayColorSpace()
{
  if (TSUDeviceGrayColorSpace_sDeviceGrayDispatchOnce != -1)
    dispatch_once(&TSUDeviceGrayColorSpace_sDeviceGrayDispatchOnce, &__block_literal_global_2);
  return TSUDeviceGrayColorSpace_sDeviceGrayColorSpace;
}

uint64_t TSUDeviceCMYKColorSpace()
{
  if (TSUDeviceCMYKColorSpace_sDeviceCMYKDispatchOnce != -1)
    dispatch_once(&TSUDeviceCMYKColorSpace_sDeviceCMYKDispatchOnce, &__block_literal_global_1);
  return TSUDeviceCMYKColorSpace_sDeviceCMYKColorSpace;
}

uint64_t TSUHasCJKLanguage(uint64_t result)
{
  void *v1;

  if (result)
  {
    v1 = (void *)result;
    if ((objc_msgSend((id)result, "hasPrefix:", CFSTR("ja")) & 1) != 0
      || (objc_msgSend(v1, "hasPrefix:", CFSTR("zh")) & 1) != 0)
    {
      return 1;
    }
    else
    {
      return objc_msgSend(v1, "hasPrefix:", CFSTR("ko"));
    }
  }
  return result;
}

void sub_216D4D3BC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_216D4D988(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x219A01ED0](v1, 0x1080C40DCAC275BLL);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromMemoryLevel(unsigned int a1)
{
  if (a1 > 3)
    return 0;
  else
    return off_24D61AB70[a1];
}

void sub_216D4E9EC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_216D4EA6C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_216D4EB88(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_216D4EC08(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t TSUFlushableObjectInfo::TSUFlushableObjectInfo(uint64_t a1, void *a2)
{
  *(_QWORD *)a1 = a2;
  *(_DWORD *)(a1 + 8) = 1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    *(_DWORD *)(a1 + 8) = objc_msgSend(a2, "reloadCost");
  *(_DWORD *)(a1 + 12) = 1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    *(_DWORD *)(a1 + 12) = objc_msgSend(a2, "flushCost");
  *(_DWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 16) = 1;
  return a1;
}

void std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::destroy(a1, *a2);
    std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t *std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerTimeStampLess,std::allocator<TSUFlushableObjectInfo *>>::__emplace_unique_key_args<TSUFlushableObjectInfo *,TSUFlushableObjectInfo * const&>(uint64_t **a1, uint64_t a2, uint64_t *a3)
{
  uint64_t *v5;
  uint64_t **v6;
  unsigned int v7;
  uint64_t **v8;
  unsigned int v9;
  uint64_t *v10;

  v6 = a1 + 1;
  v5 = a1[1];
  if (v5)
  {
    v7 = *(_DWORD *)(*(_QWORD *)a2 + 20);
    while (1)
    {
      while (1)
      {
        v8 = (uint64_t **)v5;
        v9 = *(_DWORD *)(v5[4] + 20);
        if (v7 >= v9)
          break;
        v5 = *v8;
        v6 = v8;
        if (!*v8)
          goto LABEL_10;
      }
      if (v9 >= v7)
        break;
      v5 = v8[1];
      if (!v5)
      {
        v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v8 = a1 + 1;
LABEL_10:
    v10 = (uint64_t *)operator new(0x28uLL);
    v10[4] = *a3;
    std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerTimeStampLess,std::allocator<TSUFlushableObjectInfo *>>::__insert_node_at(a1, (uint64_t)v8, v6, v10);
    return v10;
  }
  return (uint64_t *)v8;
}

uint64_t *std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerTimeStampLess,std::allocator<TSUFlushableObjectInfo *>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  uint64_t *v5;
  uint64_t *result;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24))
        return result;
      v3 = (uint64_t *)v2[2];
      v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            v9 = (uint64_t **)a2[2];
          }
          else
          {
            v9 = (uint64_t **)v2[1];
            v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = v9;
            *v9 = v2;
            v2[2] = (uint64_t)v9;
            v3 = v9[2];
            v2 = (uint64_t *)*v3;
          }
          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          v13 = v2[1];
          *v3 = v13;
          if (v13)
            *(_QWORD *)(v13 + 16) = v3;
          v2[2] = v3[2];
          *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          v11 = a2[1];
          *v2 = v11;
          if (v11)
          {
            *(_QWORD *)(v11 + 16) = v2;
            v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v2 = (uint64_t *)v3[1];
        v12 = *v2;
        v3[1] = *v2;
        if (v12)
          *(_QWORD *)(v12 + 16) = v3;
        v2[2] = v3[2];
        *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
        *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

uint64_t std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::__erase_unique<TSUFlushableObjectInfo *>(uint64_t **a1, const TSUFlushableObjectInfo **a2)
{
  uint64_t *v3;
  uint64_t *v4;

  v3 = (uint64_t *)std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::find<TSUFlushableObjectInfo *>((uint64_t)a1, a2);
  if (a1 + 1 == (uint64_t **)v3)
    return 0;
  v4 = v3;
  std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::__remove_node_pointer(a1, v3);
  operator delete(v4);
  return 1;
}

uint64_t std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::find<TSUFlushableObjectInfo *>(uint64_t a1, const TSUFlushableObjectInfo **a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  v2 = a1 + 8;
  v3 = *(_QWORD *)(a1 + 8);
  if (!v3)
    return v2;
  v5 = a1 + 8;
  do
  {
    v6 = TSUFlushableObjectInfo::compareFlushingOrder(*(TSUFlushableObjectInfo **)(v3 + 32), *a2);
    v7 = (uint64_t *)(v3 + 8);
    if (v6 != -1)
    {
      v7 = (uint64_t *)v3;
      v5 = v3;
    }
    v3 = *v7;
  }
  while (*v7);
  if (v5 == v2
    || TSUFlushableObjectInfo::compareFlushingOrder((TSUFlushableObjectInfo *)*a2, *(const TSUFlushableObjectInfo **)(v5 + 32)) == -1)
  {
    return v2;
  }
  return v5;
}

uint64_t TSUFlushableObjectInfo::compareFlushingOrder(TSUFlushableObjectInfo *this, const TSUFlushableObjectInfo *a2)
{
  int var3;
  int v3;
  int var1;
  float v5;
  float v6;
  int v7;
  float v8;
  float v9;
  float v11;
  float v12;

  if (this == a2)
    return 0;
  var3 = this->var3;
  v3 = a2->var3;
  if (var3 > v3)
    return -1;
  if (var3 < v3)
    return 1;
  var1 = this->var1;
  v5 = 1.0;
  if (var1 == 1)
    v6 = 1.5;
  else
    v6 = 1.0;
  if (!var1)
    v6 = 2.0;
  if (!this->var2)
    v6 = v6 * 1.5;
  v7 = a2->var1;
  if (v7 == 1)
    v5 = 1.5;
  if (!v7)
    v5 = 2.0;
  if (!a2->var2)
    v5 = v5 * 1.5;
  v8 = v6 * (float)this->var4[1];
  v9 = v5 * (float)a2->var4[1];
  if (v8 < v9)
    return -1;
  if (v8 > v9)
    return 1;
  v11 = v6 * (float)this->var4[0];
  v12 = v5 * (float)a2->var4[0];
  if (v11 >= v12)
    return v11 > v12;
  else
    return -1;
}

uint64_t *std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::__remove_node_pointer(uint64_t **a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  BOOL v5;
  uint64_t *v6;

  v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      v3 = v2;
      v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    v4 = a2;
    do
    {
      v3 = (uint64_t *)v4[2];
      v5 = *v3 == (_QWORD)v4;
      v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2)
    *a1 = v3;
  v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  std::__tree_remove[abi:nn180100]<std::__tree_node_base<void *> *>(v6, a2);
  return v3;
}

uint64_t *std::__tree_remove[abi:nn180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  int v5;
  uint64_t **v6;
  uint64_t *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t *v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v2 = *a2;
  v3 = a2;
  if (*a2)
  {
    v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      v3 = a2;
      goto LABEL_7;
    }
    do
    {
      v3 = v4;
      v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  v2 = v3[1];
  if (v2)
  {
LABEL_7:
    v5 = 0;
    *(_QWORD *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  v5 = 1;
LABEL_8:
  v6 = (uint64_t **)v3[2];
  v7 = *v6;
  if (*v6 == v3)
  {
    *v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      v7 = 0;
      result = (uint64_t *)v2;
    }
    else
    {
      v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    v9 = a2[2];
    v3[2] = v9;
    *(_QWORD *)(v9 + 8 * (*(_QWORD *)a2[2] != (_QWORD)a2)) = v3;
    v11 = *a2;
    v10 = a2[1];
    *(_QWORD *)(v11 + 16) = v3;
    *v3 = v11;
    v3[1] = v10;
    if (v10)
      *(_QWORD *)(v10 + 16) = v3;
    *((_BYTE *)v3 + 24) = *((_BYTE *)a2 + 24);
    if (result == a2)
      result = v3;
  }
  if (!v8 || !result)
    return result;
  if (!v5)
  {
    *(_BYTE *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    v12 = v7[2];
    if (*(uint64_t **)v12 == v7)
      break;
    if (!*((_BYTE *)v7 + 24))
    {
      *((_BYTE *)v7 + 24) = 1;
      *(_BYTE *)(v12 + 24) = 0;
      v13 = *(uint64_t **)(v12 + 8);
      v14 = *v13;
      *(_QWORD *)(v12 + 8) = *v13;
      if (v14)
        *(_QWORD *)(v14 + 16) = v12;
      v13[2] = *(_QWORD *)(v12 + 16);
      *(_QWORD *)(*(_QWORD *)(v12 + 16) + 8 * (**(_QWORD **)(v12 + 16) != v12)) = v13;
      *v13 = v12;
      *(_QWORD *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7)
        result = v7;
      v7 = *(uint64_t **)(*v7 + 8);
    }
    v15 = (_QWORD *)*v7;
    if (*v7 && !*((_BYTE *)v15 + 24))
    {
      v16 = (uint64_t *)v7[1];
      if (!v16)
        goto LABEL_56;
LABEL_55:
      if (*((_BYTE *)v16 + 24))
      {
LABEL_56:
        *((_BYTE *)v15 + 24) = 1;
        *((_BYTE *)v7 + 24) = 0;
        v22 = v15[1];
        *v7 = v22;
        if (v22)
          *(_QWORD *)(v22 + 16) = v7;
        v15[2] = v7[2];
        *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        v16 = v7;
      }
      else
      {
        v15 = v7;
      }
      v23 = v15[2];
      *((_BYTE *)v15 + 24) = *(_BYTE *)(v23 + 24);
      *(_BYTE *)(v23 + 24) = 1;
      *((_BYTE *)v16 + 24) = 1;
      v24 = *(uint64_t **)(v23 + 8);
      v25 = *v24;
      *(_QWORD *)(v23 + 8) = *v24;
      if (v25)
        *(_QWORD *)(v25 + 16) = v23;
      v24[2] = *(_QWORD *)(v23 + 16);
      *(_QWORD *)(*(_QWORD *)(v23 + 16) + 8 * (**(_QWORD **)(v23 + 16) != v23)) = v24;
      *v24 = v23;
      goto LABEL_72;
    }
    v16 = (uint64_t *)v7[1];
    if (v16 && !*((_BYTE *)v16 + 24))
      goto LABEL_55;
    *((_BYTE *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      v17 = result;
LABEL_53:
      *((_BYTE *)v17 + 24) = 1;
      return result;
    }
    if (!*((_BYTE *)v17 + 24))
      goto LABEL_53;
LABEL_49:
    v7 = *(uint64_t **)(v17[2] + 8 * (*(_QWORD *)v17[2] == (_QWORD)v17));
  }
  if (!*((_BYTE *)v7 + 24))
  {
    *((_BYTE *)v7 + 24) = 1;
    *(_BYTE *)(v12 + 24) = 0;
    v18 = v7[1];
    *(_QWORD *)v12 = v18;
    if (v18)
      *(_QWORD *)(v18 + 16) = v12;
    v7[2] = *(_QWORD *)(v12 + 16);
    *(_QWORD *)(*(_QWORD *)(v12 + 16) + 8 * (**(_QWORD **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(_QWORD *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12)
      result = v7;
    v7 = *(uint64_t **)v12;
  }
  v19 = (_QWORD *)*v7;
  if (*v7 && !*((_BYTE *)v19 + 24))
    goto LABEL_68;
  v20 = (uint64_t *)v7[1];
  if (!v20 || *((_BYTE *)v20 + 24))
  {
    *((_BYTE *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (*((_BYTE *)v17 + 24))
      v21 = v17 == result;
    else
      v21 = 1;
    if (v21)
      goto LABEL_53;
    goto LABEL_49;
  }
  if (v19 && !*((_BYTE *)v19 + 24))
  {
LABEL_68:
    v20 = v7;
  }
  else
  {
    *((_BYTE *)v20 + 24) = 1;
    *((_BYTE *)v7 + 24) = 0;
    v26 = *v20;
    v7[1] = *v20;
    if (v26)
      *(_QWORD *)(v26 + 16) = v7;
    v20[2] = v7[2];
    *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v20;
    *v20 = (uint64_t)v7;
    v7[2] = (uint64_t)v20;
    v19 = v7;
  }
  v23 = v20[2];
  *((_BYTE *)v20 + 24) = *(_BYTE *)(v23 + 24);
  *(_BYTE *)(v23 + 24) = 1;
  *((_BYTE *)v19 + 24) = 1;
  v24 = *(uint64_t **)v23;
  v27 = *(_QWORD *)(*(_QWORD *)v23 + 8);
  *(_QWORD *)v23 = v27;
  if (v27)
    *(_QWORD *)(v27 + 16) = v23;
  v24[2] = *(_QWORD *)(v23 + 16);
  *(_QWORD *)(*(_QWORD *)(v23 + 16) + 8 * (**(_QWORD **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(_QWORD *)(v23 + 16) = v24;
  return result;
}

uint64_t std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerTimeStampLess,std::allocator<TSUFlushableObjectInfo *>>::__erase_unique<TSUFlushableObjectInfo *>(uint64_t **a1, uint64_t a2)
{
  uint64_t *v3;
  uint64_t *v4;

  v3 = std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerTimeStampLess,std::allocator<TSUFlushableObjectInfo *>>::find<TSUFlushableObjectInfo *>((uint64_t)a1, a2);
  if (a1 + 1 == (uint64_t **)v3)
    return 0;
  v4 = v3;
  std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::__remove_node_pointer(a1, v3);
  operator delete(v4);
  return 1;
}

_QWORD *std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerTimeStampLess,std::allocator<TSUFlushableObjectInfo *>>::find<TSUFlushableObjectInfo *>(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  unsigned int v5;
  _QWORD *v6;
  unsigned int v7;
  BOOL v8;
  _QWORD *v9;

  v4 = *(_QWORD **)(a1 + 8);
  v2 = (_QWORD *)(a1 + 8);
  v3 = v4;
  if (!v4)
    return v2;
  v5 = *(_DWORD *)(*(_QWORD *)a2 + 20);
  v6 = v2;
  do
  {
    v7 = *(_DWORD *)(v3[4] + 20);
    v8 = v7 >= v5;
    if (v7 >= v5)
      v9 = v3;
    else
      v9 = v3 + 1;
    if (v8)
      v6 = v3;
    v3 = (_QWORD *)*v9;
  }
  while (*v9);
  if (v6 == v2 || v5 < *(_DWORD *)(v6[4] + 20))
    return v2;
  return v6;
}

uint64_t *std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::__emplace_unique_key_args<TSUFlushableObjectInfo *,TSUFlushableObjectInfo * const&>(uint64_t **a1, TSUFlushableObjectInfo **a2, uint64_t *a3)
{
  uint64_t *v5;
  uint64_t *v6;
  uint64_t **v7;
  uint64_t v9;

  v5 = std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::__find_equal<TSUFlushableObjectInfo *>((uint64_t)a1, &v9, a2);
  v6 = (uint64_t *)*v5;
  if (!*v5)
  {
    v7 = (uint64_t **)v5;
    v6 = (uint64_t *)operator new(0x28uLL);
    v6[4] = *a3;
    std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerTimeStampLess,std::allocator<TSUFlushableObjectInfo *>>::__insert_node_at(a1, v9, v7, v6);
  }
  return v6;
}

uint64_t *std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::__find_equal<TSUFlushableObjectInfo *>(uint64_t a1, _QWORD *a2, TSUFlushableObjectInfo **a3)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t *v7;

  v5 = (uint64_t *)(a1 + 8);
  v4 = *(uint64_t **)(a1 + 8);
  if (v4)
  {
    do
    {
      while (1)
      {
        v7 = v4;
        if (TSUFlushableObjectInfo::compareFlushingOrder(*a3, (const TSUFlushableObjectInfo *)v4[4]) != -1)
          break;
        v4 = (uint64_t *)*v7;
        v5 = v7;
        if (!*v7)
          goto LABEL_9;
      }
      if (TSUFlushableObjectInfo::compareFlushingOrder((TSUFlushableObjectInfo *)v7[4], *a3) != -1)
        break;
      v5 = v7 + 1;
      v4 = (uint64_t *)v7[1];
    }
    while (v4);
  }
  else
  {
    v7 = (uint64_t *)(a1 + 8);
  }
LABEL_9:
  *a2 = v7;
  return v5;
}

uint64_t TSUSupportsTextInteraction()
{
  if (TSUSupportsTextInteraction_onceToken != -1)
    dispatch_once(&TSUSupportsTextInteraction_onceToken, &__block_literal_global);
  return TSUSupportsTextInteraction_supportTextInteraction;
}

void *TSUFindFirstResponderView(void *a1)
{
  void *v1;
  char v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t ResponderView;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v1 = a1;
  v15 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(a1, "isFirstResponder");
  if (!v1 || (v2 & 1) == 0)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v3 = (void *)objc_msgSend(v1, "subviews", 0);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          ResponderView = TSUFindFirstResponderView(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i));
          if (ResponderView)
            return (void *)ResponderView;
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        v1 = 0;
        if (v5)
          continue;
        break;
      }
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

BOOL TSUPhoneUI()
{
  uint64_t v0;

  if (p_TSUIdiom_sIdiomInitialized == 1)
  {
    v0 = p_TSUIdiom_sIdiom;
  }
  else
  {
    v0 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom");
    p_TSUIdiom_sIdiom = v0;
    p_TSUIdiom_sIdiomInitialized = 1;
  }
  return v0 == 0;
}

BOOL TSUPadUI()
{
  uint64_t v0;

  if (p_TSUIdiom_sIdiomInitialized == 1)
  {
    v0 = p_TSUIdiom_sIdiom;
  }
  else
  {
    v0 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom");
    p_TSUIdiom_sIdiom = v0;
    p_TSUIdiom_sIdiomInitialized = 1;
  }
  return v0 == 1;
}

BOOL TSUPhoneUI568H()
{
  double v1;

  if (p_TSUIdiom_sIdiomInitialized == 1)
  {
    if (p_TSUIdiom_sIdiom)
      return 0;
  }
  else
  {
    p_TSUIdiom_sIdiom = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom");
    p_TSUIdiom_sIdiomInitialized = 1;
    if (p_TSUIdiom_sIdiom)
      return 0;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "bounds");
  return v1 == 568.0;
}

BOOL TSUPhoneUI480H()
{
  double v1;

  if (p_TSUIdiom_sIdiomInitialized == 1)
  {
    if (p_TSUIdiom_sIdiom)
      return 0;
  }
  else
  {
    p_TSUIdiom_sIdiom = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom");
    p_TSUIdiom_sIdiomInitialized = 1;
    if (p_TSUIdiom_sIdiom)
      return 0;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "bounds");
  return v1 == 480.0;
}

uint64_t TSUPadIsFirstGen()
{
  void *v0;
  void *v1;
  size_t size;

  if ((TSUPadIsFirstGen_sIsFirstGenInitialized & 1) == 0)
  {
    size = 0;
    sysctlbyname("hw.machine", 0, &size, 0, 0);
    v0 = malloc_type_malloc(size, 0x8E4D8B2BuLL);
    sysctlbyname("hw.machine", v0, &size, 0, 0);
    v1 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v0);
    free(v0);
    if (objc_msgSend(v1, "isEqualToString:", CFSTR("iPad1,1")))
      TSUPadIsFirstGen_sIsFirstGen = 1;
    TSUPadIsFirstGen_sIsFirstGenInitialized = 1;
  }
  return TSUPadIsFirstGen_sIsFirstGen;
}

double TSUStatusBarHeight()
{
  double v0;
  float v1;
  double v2;
  float v3;

  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "keyWindow"), "windowScene"), "statusBarManager"), "statusBarFrame");
  v1 = v0;
  v3 = v2;
  return fminf(v1, v3);
}

void TSUScreenScale()
{
  uint64_t v0;

  if (*(double *)&TSUScreenScale_screenScale < 0.0)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen", *(double *)&TSUScreenScale_screenScale), "scale");
    TSUScreenScale_screenScale = v0;
  }
}

const __CFString *NSStringFromUIGestureRecognizerState(unint64_t a1)
{
  if (a1 < 5)
    return off_24D61ABF0[a1];
  if (a1 == 5)
    return CFSTR("UIGestureRecognizerStateFailed");
  return CFSTR("#Unknown UIGestureRecognizerState#");
}

uint64_t NSStringFromCATransform3D(_QWORD *a1)
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[ %f %f %f %f; %f %f %f %f; %f %f %f %f; %f %f %f %f ]"),
           *a1,
           a1[1],
           a1[2],
           a1[3],
           a1[4],
           a1[5],
           a1[6],
           a1[7],
           a1[8],
           a1[9],
           a1[10],
           a1[11],
           a1[12],
           a1[13],
           a1[14],
           a1[15],
           0);
}

BOOL TSUStatusBarIsLandscape()
{
  return (unint64_t)(objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "keyWindow"), "windowScene"), "interfaceOrientation")- 3) < 2;
}

double TSUMaxTextureSize()
{
  if (TSUMaxTextureSize_s_maxTextureSizeOnce != -1)
    dispatch_once(&TSUMaxTextureSize_s_maxTextureSizeOnce, &__block_literal_global_28);
  return *(double *)&TSUMaxTextureSize_s_maxTextureSize;
}

void *TSUBuildIndexFromBuildVersion(void *a1)
{
  void *result;
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

  v16 = 0;
  result = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("([0-9]+)([A-Za-z])([0-9]+)([A-Za-z])?"), 1, &v16), "firstMatchInString:options:range:", a1, 0, 0, objc_msgSend(a1, "length"));
  if (result)
  {
    v3 = result;
    v4 = objc_msgSend(result, "rangeAtIndex:", 1);
    v6 = (int)objc_msgSend((id)objc_msgSend(a1, "substringWithRange:", v4, v5), "intValue");
    v7 = objc_msgSend(v3, "rangeAtIndex:", 2);
    v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "substringWithRange:", v7, v8), "uppercaseString"), "characterAtIndex:", 0);
    v10 = objc_msgSend(v3, "rangeAtIndex:", 3);
    v12 = (int)objc_msgSend((id)objc_msgSend(a1, "substringWithRange:", v10, v11), "intValue");
    v13 = objc_msgSend(v3, "rangeAtIndex:", 4);
    v15 = 0;
    if (v13 != 0x7FFFFFFFFFFFFFFFLL)
      v15 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "substringWithRange:", v13, v14), "uppercaseString"), "characterAtIndex:", 0)- 64;
    return (void *)(v15 | (32 * (((v9 << 14) - 0x100000) | (v6 << 19) | v12)));
  }
  return result;
}

void *TSUBuildIndexSetFromString(void *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _BYTE *v15;
  _BYTE *v16;
  uint64_t v17;
  void *v18;
  void *v20;
  uint64_t v21;

  v21 = 0;
  v2 = (void *)objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("([0-9A-Za-z]+)([-,])? *"), 1, &v21);
  v3 = objc_msgSend(a1, "length");
  v20 = (void *)objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  if (!v3)
    return v20;
  v4 = 0;
  v5 = 0;
  do
  {
    v6 = (void *)objc_msgSend(v2, "firstMatchInString:options:range:", a1, 0, v4, v3, v20);
    if (!v6)
      break;
    v7 = v6;
    v8 = objc_msgSend(v6, "rangeAtIndex:", 1);
    v10 = (void *)objc_msgSend(a1, "substringWithRange:", v8, v9);
    v11 = objc_msgSend(v7, "rangeAtIndex:", 2);
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend(0, "isEqualToString:", CFSTR("-")))
        goto LABEL_8;
    }
    else
    {
      v13 = (void *)objc_msgSend(a1, "substringWithRange:", v11, v12);
      if ((objc_msgSend(v13, "isEqualToString:", CFSTR("-")) & 1) != 0)
      {
LABEL_8:
        if (!v5)
          v5 = v10;
        goto LABEL_21;
      }
      if (v13 && !objc_msgSend(v13, "isEqualToString:", CFSTR(",")))
        goto LABEL_21;
    }
    if (v5)
    {
      v15 = TSUBuildIndexFromBuildVersion(v5);
      v16 = TSUBuildIndexFromBuildVersion(v10);
      v5 = 0;
      if (!v15 || !v16 || v16 < v15)
        goto LABEL_21;
      objc_msgSend(v20, "addIndexesInRange:", v15, v16 - v15 + 1);
    }
    else
    {
      v14 = TSUBuildIndexFromBuildVersion(v10);
      if (v14)
        objc_msgSend(v20, "addIndex:", v14);
    }
    v5 = 0;
LABEL_21:
    objc_msgSend(v7, "rangeAtIndex:", 0);
    v4 += v17;
    v3 -= v17;
  }
  while (v3);
  if (v5)
  {
    v18 = TSUBuildIndexFromBuildVersion(v5);
    if (v18)
      objc_msgSend(v20, "addIndexesInRange:", v18, 0x7FFFFFFFFFFFFFFELL - (_QWORD)v18);
  }
  return v20;
}

uint64_t TSUProductBuildVersion()
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "bundlePath"), "stringByAppendingPathComponent:", CFSTR("../../CoreServices/SystemVersion.plist")), "stringByStandardizingPath")), "objectForKey:", CFSTR("ProductBuildVersion")));
}

uint64_t TSUProductName()
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "bundlePath"), "stringByAppendingPathComponent:", CFSTR("../../CoreServices/SystemVersion.plist")), "stringByStandardizingPath")), "objectForKey:", CFSTR("ProductName")));
}

void *TSUProductBuildIndex()
{
  void *result;
  void *v1;

  result = (void *)TSUProductBuildIndex_s_buildIndex;
  if (!TSUProductBuildIndex_s_buildIndex)
  {
    v1 = (void *)TSUProductBuildVersion();
    result = TSUBuildIndexFromBuildVersion(v1);
    TSUProductBuildIndex_s_buildIndex = (uint64_t)result;
  }
  return result;
}

uint64_t TSUValidPlatformTags()
{
  uint64_t result;
  void *v1;
  uint64_t v2;
  const __CFString *v3;
  id v4;

  result = TSUValidPlatformTags_validPlatforms;
  if (!TSUValidPlatformTags_validPlatforms)
  {
    TSUValidPlatformTags_validPlatforms = objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObject:", CFSTR("ios"));
    p_appendPlatformComponent((void *)TSUValidPlatformTags_validPlatforms, (uint64_t)CFSTR("-arm"));
    v1 = (void *)TSUValidPlatformTags_validPlatforms;
    v2 = TSUScreenScale_screenScale;
    if (*(double *)&TSUScreenScale_screenScale < 0.0)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen", *(double *)&TSUScreenScale_screenScale), "scale");
      TSUScreenScale_screenScale = v2;
    }
    if (*(double *)&v2 == 2.0)
      v3 = CFSTR("@2x");
    else
      v3 = CFSTR("@1x");
    p_appendPlatformComponent(v1, (uint64_t)v3);
    objc_msgSend((id)TSUValidPlatformTags_validPlatforms, "addObject:", CFSTR("default"));
    v4 = (id)TSUValidPlatformTags_validPlatforms;
    return TSUValidPlatformTags_validPlatforms;
  }
  return result;
}

uint64_t p_appendPlatformComponent(void *a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(a1);
        objc_msgSend(v4, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++), a2));
      }
      while (v6 != v8);
      v6 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  return objc_msgSend(a1, "unionSet:", v4);
}

const __CFString *TSUPlatformTag()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __CFString *v4;
  uint64_t i;
  __CFString *v6;
  unint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v0 = (void *)TSUValidPlatformTags();
  v1 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (!v1)
    return &stru_24D61C228;
  v2 = v1;
  v3 = *(_QWORD *)v10;
  v4 = &stru_24D61C228;
  do
  {
    for (i = 0; i != v2; ++i)
    {
      if (*(_QWORD *)v10 != v3)
        objc_enumerationMutation(v0);
      v6 = *(__CFString **)(*((_QWORD *)&v9 + 1) + 8 * i);
      if ((-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("default"), (_QWORD)v9) & 1) == 0)
      {
        v7 = -[__CFString length](v6, "length");
        if (v7 > -[__CFString length](v4, "length"))
          v4 = v6;
      }
    }
    v2 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  }
  while (v2);
  return v4;
}

uint64_t TSUPlatformSpecificStringForBuildIndex(void *a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v28;

  v28 = 0;
  v4 = (void *)objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("(?:\\[(ios|ios-sim|ios-sim@1x|ios-sim@2x|ios-arm|ios@2x|mac|mac32|mac64|default)(?:\\:([^\\]]*))?\\])?([^\\[]*)"), 1, &v28);
  v5 = objc_msgSend(a1, "length");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    do
    {
      v8 = (void *)objc_msgSend(v4, "firstMatchInString:options:range:", a1, 0, v7, v6);
      if (!v8)
        break;
      v9 = v8;
      v10 = objc_msgSend(v8, "rangeAtIndex:", 1);
      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
        v12 = 0;
      else
        v12 = v10;
      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
        v13 = 0;
      else
        v13 = v11;
      v14 = (void *)objc_msgSend(a1, "substringWithRange:", v12, v13);
      v15 = objc_msgSend(v9, "rangeAtIndex:", 2);
      if (v15 == 0x7FFFFFFFFFFFFFFFLL)
        v17 = 0;
      else
        v17 = v15;
      if (v15 == 0x7FFFFFFFFFFFFFFFLL)
        v18 = 0;
      else
        v18 = v16;
      v19 = (void *)objc_msgSend(a1, "substringWithRange:", v17, v18);
      v20 = objc_msgSend(v9, "rangeAtIndex:", 3);
      if (v20 == 0x7FFFFFFFFFFFFFFFLL)
        v22 = 0;
      else
        v22 = v20;
      if (v20 == 0x7FFFFFFFFFFFFFFFLL)
        v23 = 0;
      else
        v23 = v21;
      v24 = objc_msgSend(a1, "substringWithRange:", v22, v23);
      if (!objc_msgSend(v14, "length")
        || objc_msgSend((id)TSUValidPlatformTags(), "containsObject:", v14))
      {
        if (!objc_msgSend(v19, "length"))
          return v24;
        v25 = TSUBuildIndexSetFromString(v19);
        if (v25)
        {
          if ((objc_msgSend(v25, "containsIndex:", a2) & 1) != 0)
            return v24;
        }
      }
      objc_msgSend(v9, "rangeAtIndex:", 0);
      v7 += v26;
      v6 -= v26;
    }
    while (v6);
  }
  return 0;
}

uint64_t TSUPlatformSpecificString(void *a1)
{
  void *v2;

  v2 = TSUProductBuildIndex();
  return TSUPlatformSpecificStringForBuildIndex(a1, (uint64_t)v2);
}

unint64_t NSExpandedRange(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  unint64_t v5;
  unint64_t v6;

  v5 = a4 + a5;
  if (a4 + a3 >= a1)
    v6 = a4;
  else
    v6 = a1 - a3;
  if (a1 + a2 + a3 < v5)
    v5 = a1 + a2 + a3;
  if (v6 >= v5)
    return v5;
  else
    return v6;
}

uint64_t TSUCompareWithComparators(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  result = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v9;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v9 != v6)
        objc_enumerationMutation(a3);
      result = (*(uint64_t (**)(void))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7) + 16))();
      if (result)
        break;
      if (v5 == ++v7)
      {
        result = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        v5 = result;
        if (result)
          goto LABEL_3;
        return result;
      }
    }
  }
  return result;
}

uint64_t SFUBundle()
{
  if (SFUBundle_onceToken != -1)
    dispatch_once(&SFUBundle_onceToken, &__block_literal_global_0);
  return SFUBundle_sSFUBundle;
}

uint64_t SFUMainBundle()
{
  uint64_t result;

  result = SFUMainBundle_sMainBundle;
  if (!SFUMainBundle_sMainBundle)
  {
    result = objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    SFUMainBundle_sMainBundle = result;
  }
  return result;
}

uint64_t TSUHash(char *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;

  for (result = 0xCBF29CE484222325; a2; --a2)
  {
    v4 = *a1++;
    result = 0x100000001B3 * (result ^ v4);
  }
  return result;
}

uint64_t TSUHashWithSeed(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  for (; a2; --a2)
  {
    v3 = *a1++;
    a3 = 0x100000001B3 * (a3 ^ v3);
  }
  return a3;
}

void sub_216D512D4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_216D51430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

uint64_t TSUMemoryUsed()
{
  task_name_t v0;
  mach_error_t v1;
  char *v2;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[8];
  __int128 v6;
  __int128 v7;
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
  uint64_t v36;

  MEMORY[0x24BDAC7A8]();
  v36 = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BDAEC58];
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
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
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  memset(task_info_out, 0, sizeof(task_info_out));
  task_info_outCnt = 10;
  v1 = task_info(v0, 0x12u, task_info_out, &task_info_outCnt);
  if (!v1)
    return *(_QWORD *)&task_info_out[3];
  v2 = mach_error_string(v1);
  NSLog((NSString *)CFSTR("Unable to get task information: %s"), v2);
  return 0;
}

uint64_t TSUMemoryUsedVirtual()
{
  task_name_t v0;
  mach_error_t v1;
  char *v2;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  __int128 v6;
  __int128 v7;
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
  uint64_t v37;

  MEMORY[0x24BDAC7A8]();
  v37 = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BDAEC58];
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
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  *(_OWORD *)task_info_out = 0u;
  v6 = 0u;
  task_info_outCnt = 10;
  v1 = task_info(v0, 0x12u, task_info_out, &task_info_outCnt);
  if (!v1)
    return *(_QWORD *)&task_info_out[1];
  v2 = mach_error_string(v1);
  NSLog((NSString *)CFSTR("Unable to get task information: %s"), v2);
  return 0;
}

vm_size_t TSUMemoryFree()
{
  host_t v0;
  mach_error_t v1;
  char *v2;
  integer_t host_info_out[4];
  __int128 v5;
  _DWORD v6[7];
  vm_size_t v7;
  mach_msg_type_number_t host_info_outCnt;

  v0 = MEMORY[0x219A022FC]();
  v7 = 0;
  host_info_outCnt = 15;
  host_page_size(v0, &v7);
  v5 = 0u;
  memset(v6, 0, sizeof(v6));
  *(_OWORD *)host_info_out = 0u;
  v1 = host_statistics(v0, 2, host_info_out, &host_info_outCnt);
  if (!v1)
    return v7 * host_info_out[0];
  v2 = mach_error_string(v1);
  NSLog((NSString *)CFSTR("Unable to get information: %s"), v2);
  return 0;
}

uint64_t localReader(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  *a4 = a2;
  return 0;
}

void processPointer(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t **v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  BOOL v18;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;

  if (a5)
  {
    v5 = 0;
    v6 = (_QWORD *)a2[1];
    v7 = (uint64_t *)a2[2];
    v8 = a2[5];
    v9 = (_QWORD *)a2[6];
    v11 = a2[3];
    v10 = a2[4];
    if (v11 <= 1)
      v12 = 1;
    else
      v12 = a2[3];
    v13 = a5;
    do
    {
      v14 = (uint64_t **)(a4 + 16 * v5);
      v15 = **v14;
      if (v15)
      {
        v16 = (uint64_t)v14[1];
        v17 = v16 < 33 || v15 < v10;
        v18 = !v17 && v15 <= v8;
        if (v18 && v11 >= 1)
        {
          v20 = v6;
          v21 = v7;
          v22 = v12;
          do
          {
            if (v15 == *v20 && v16 >= *v21)
              *v9 += (int)v16;
            ++v21;
            ++v20;
            --v22;
          }
          while (v22);
        }
      }
      ++v5;
    }
    while (v5 != v13);
  }
}

malloc_zone_t *TSULeaksOnCommonClasses()
{
  malloc_zone_t *result;
  malloc_zone_t *v1;
  malloc_introspection_t *introspect;
  uint64_t v3;
  objc_class *v4;
  objc_class *v5;
  objc_class *Class;
  uint64_t v9;
  _BYTE v10[144];
  _BYTE v11[144];
  _QWORD v12[8];

  v12[7] = *MEMORY[0x24BDAC8D0];
  v9 = 0;
  result = malloc_default_zone();
  if (result)
  {
    v1 = result;
    introspect = result->introspect;
    if (introspect)
    {
      v3 = 0;
      v4 = 0;
      v5 = 0;
      do
      {
        Class = objc_getClass((&TSULeaksOnCommonClasses_interestingNames)[v3]);
        *(_QWORD *)&v11[v3 * 8] = Class;
        if (Class)
        {
          if ((uint64_t)v4 > (uint64_t)Class || v4 == 0)
            v4 = Class;
          if ((uint64_t)v5 < (uint64_t)Class || v5 == 0)
            v5 = Class;
          Class = (objc_class *)class_getInstanceSize(Class);
        }
        *(_QWORD *)&v10[v3 * 8] = Class;
        ++v3;
      }
      while (v3 != 18);
      v12[0] = &TSULeaksOnCommonClasses_interestingNames;
      v12[1] = v11;
      v12[2] = v10;
      v12[3] = 18;
      v12[4] = v4;
      v12[5] = v5;
      v12[6] = &v9;
      ((void (*)(_QWORD, _QWORD *, uint64_t, malloc_zone_t *, uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD *), void (*)(uint64_t, _QWORD *, uint64_t, uint64_t, unsigned int)))introspect->enumerator)(*MEMORY[0x24BDAEC58], v12, 1, v1, localReader, processPointer);
      return (malloc_zone_t *)v9;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void TSUDateFormatterInit()
{
  if ((dateFormatterIsInitted & 1) == 0)
  {
    sDateFormatterCache = (uint64_t)objc_alloc_init(MEMORY[0x24BDBCED8]);
    sDateFormatterLocale = (uint64_t)TSUCopyCurrentLocaleWithGregorianCalendar();
    dateFormatterIsInitted = 1;
  }
}

CFLocaleRef TSUCopyCurrentLocaleWithGregorianCalendar()
{
  const __CFLocale *v0;
  const void *v1;
  const __CFString *Value;
  const void *v3;
  CFComparisonResult v4;
  const __CFAllocator *v5;
  const __CFString *v6;
  const __CFDictionary *ComponentsFromLocaleIdentifier;
  __CFDictionary *MutableCopy;
  const __CFString *LocaleIdentifierFromComponents;
  CFLocaleRef v10;

  v0 = CFLocaleCopyCurrent();
  v1 = (const void *)*MEMORY[0x24BDBD3C8];
  Value = (const __CFString *)CFLocaleGetValue(v0, (CFLocaleKey)*MEMORY[0x24BDBD3C8]);
  v3 = (const void *)*MEMORY[0x24BDBD3B8];
  v4 = CFStringCompare(Value, (CFStringRef)*MEMORY[0x24BDBD3B8], 0);
  v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v6 = (const __CFString *)MEMORY[0x219A01708](v0);
  if (v4)
  {
    ComponentsFromLocaleIdentifier = CFLocaleCreateComponentsFromLocaleIdentifier(v5, v6);
    MutableCopy = CFDictionaryCreateMutableCopy(v5, 0, ComponentsFromLocaleIdentifier);
    CFDictionarySetValue(MutableCopy, v1, v3);
    LocaleIdentifierFromComponents = CFLocaleCreateLocaleIdentifierFromComponents(v5, MutableCopy);
    v10 = CFLocaleCreate(v5, LocaleIdentifierFromComponents);
    CFRelease(v0);
    CFRelease(ComponentsFromLocaleIdentifier);
    CFRelease(MutableCopy);
    v0 = (const __CFLocale *)LocaleIdentifierFromComponents;
  }
  else
  {
    v10 = CFLocaleCreate(v5, v6);
  }
  CFRelease(v0);
  return v10;
}

void TSUDateFormatterShutdown()
{
  if (dateFormatterIsInitted == 1)
  {

    CFRelease((CFTypeRef)sDateFormatterLocale);
    dateFormatterIsInitted = 0;
  }
}

id TSUDateFormatterCopyDateTimeFormatInfoDictionaryForLocale(const __CFLocale *a1)
{
  CFLocaleRef v2;
  const __CFAllocator *v3;
  const __CFString *v4;
  __CFString *CanonicalLocaleIdentifierFromString;
  CFIndex Length;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  id v11;
  uint64_t v12;
  id v13;

  v2 = a1;
  if (!a1)
    v2 = CFLocaleCopyCurrent();
  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v4 = (const __CFString *)MEMORY[0x219A01708](v2);
  CanonicalLocaleIdentifierFromString = (__CFString *)CFLocaleCreateCanonicalLocaleIdentifierFromString(v3, v4);
  Length = -[__CFString rangeOfString:](CanonicalLocaleIdentifierFromString, "rangeOfString:", CFSTR("@"));
  if (Length == 0x7FFFFFFFFFFFFFFFLL)
    Length = CFStringGetLength(CanonicalLocaleIdentifierFromString);
  v7 = -[__CFString substringToIndex:](CanonicalLocaleIdentifierFromString, "substringToIndex:", Length);
  v8 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = objc_msgSend(v8, "pathForResource:ofType:inDirectory:", v7, CFSTR("plist"), CFSTR("DateTimeFormats"));
  CFRelease(CanonicalLocaleIdentifierFromString);
  if (!v9)
  {
    v10 = (const __CFString *)MEMORY[0x219A01708](v2);
    v9 = objc_msgSend(v8, "pathForResource:ofType:inDirectory:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("fallback-%@"), off_24D61AC60[TSUDateComponentOrderingForLocale(v10)]), CFSTR("plist"), CFSTR("DateTimeFormats"));
    if (!v9)
    {
      v11 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
      v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CFDictionaryRef TSUDateFormatterCopyDateTimeFormatInfoDictionaryForLocale(CFLocaleRef)");
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDateFormatter.m"), 124, CFSTR("Unable to find path for plist containing date time formats!"));
    }
  }
  v13 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v9);
  if (!a1)
    CFRelease(v2);
  return v13;
}

uint64_t TSUDateComponentOrderingForLocale(CFLocaleIdentifier localeIdentifier)
{
  const __CFAllocator *v1;
  const __CFLocale *v2;
  __CFDateFormatter *v3;
  const __CFString *CanonicalLocaleIdentifierFromString;
  const __CFLocale *v5;
  __CFDateFormatter *v6;
  const __CFString *Format;
  const __CFString *v8;
  CFTimeZoneRef v9;
  CFAbsoluteTime AbsoluteTime;
  __CFString *StringWithAbsoluteTime;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  BOOL v16;
  unsigned int v17;
  CFGregorianDate v18;

  v1 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v2 = CFLocaleCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], localeIdentifier);
  v3 = CFDateFormatterCreate(v1, v2, kCFDateFormatterShortStyle, kCFDateFormatterNoStyle);
  CFRelease(v2);
  CanonicalLocaleIdentifierFromString = CFLocaleCreateCanonicalLocaleIdentifierFromString(v1, CFSTR("en_US"));
  v5 = CFLocaleCreate(v1, CanonicalLocaleIdentifierFromString);
  CFRelease(CanonicalLocaleIdentifierFromString);
  v6 = CFDateFormatterCreate(v1, v5, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFRelease(v5);
  Format = CFDateFormatterGetFormat(v3);
  CFDateFormatterSetFormat(v6, Format);
  CFRelease(v3);
  v8 = (const __CFString *)*MEMORY[0x24BDBD340];
  v9 = TSUGetGMTTimeZone();
  CFDateFormatterSetProperty(v6, v8, v9);
  *(_QWORD *)&v18.year = 0x402000007CFLL;
  v18.second = 0.0;
  AbsoluteTime = CFGregorianDateGetAbsoluteTime(v18, 0);
  StringWithAbsoluteTime = (__CFString *)CFDateFormatterCreateStringWithAbsoluteTime(v1, v6, AbsoluteTime);
  CFRelease(v6);
  v12 = -[__CFString rangeOfString:](StringWithAbsoluteTime, "rangeOfString:", CFSTR("99"));
  v13 = -[__CFString rangeOfString:](StringWithAbsoluteTime, "rangeOfString:", CFSTR("2"));
  v14 = -[__CFString rangeOfString:](StringWithAbsoluteTime, "rangeOfString:", CFSTR("4"));
  CFRelease(StringWithAbsoluteTime);
  if (v13 >= v12)
  {
    if (v14 < v12)
      return 1;
    v16 = v14 > v13;
    v17 = 4;
  }
  else
  {
    if (v14 < v13)
      return 0;
    v16 = v14 > v12;
    v17 = 2;
  }
  if (v16)
    return v17 + 1;
  else
    return v17;
}

CFStringRef TSUDateFormatterCreateStringFromDateWithISO8601Format(const __CFDate *a1)
{
  const __CFAllocator *v2;
  const __CFLocale *v3;
  __CFDateFormatter *v4;
  const __CFString *v5;
  CFTimeZoneRef v6;
  CFStringRef StringWithDate;

  v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v3 = CFLocaleCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], CFSTR("en_US"));
  v4 = CFDateFormatterCreate(v2, v3, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFRelease(v3);
  CFDateFormatterSetFormat(v4, CFSTR("yyyy-MM-dd'T'HH:mm:ssZZ"));
  v5 = (const __CFString *)*MEMORY[0x24BDBD340];
  v6 = TSUGetGMTTimeZone();
  CFDateFormatterSetProperty(v4, v5, v6);
  StringWithDate = CFDateFormatterCreateStringWithDate(v2, v4, a1);
  CFRelease(v4);
  return StringWithDate;
}

CFTimeZoneRef TSUGetGMTTimeZone()
{
  CFTimeZoneRef result;
  id v1;
  uint64_t v2;

  result = (CFTimeZoneRef)TSUGetGMTTimeZone_sGMTTimeZone;
  if (!TSUGetGMTTimeZone_sGMTTimeZone)
  {
    result = CFTimeZoneCreateWithTimeIntervalFromGMT((CFAllocatorRef)*MEMORY[0x24BDBD240], 0.0);
    TSUGetGMTTimeZone_sGMTTimeZone = (uint64_t)result;
    if (!result)
    {
      v1 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
      v2 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CFTimeZoneRef TSUGetGMTTimeZone(void)");
      objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDateFormatter.m"), 268, CFSTR("GMTTimeZone() couldn't create time zone"));
      return (CFTimeZoneRef)TSUGetGMTTimeZone_sGMTTimeZone;
    }
  }
  return result;
}

CFDateRef TSUDateFormatterCreateDateFromStringWithISO8601Format(const __CFString *a1)
{
  const __CFAllocator *v2;
  const __CFLocale *v3;
  __CFDateFormatter *v4;
  CFIndex Length;
  CFDateRef v6;
  BOOL v7;
  char v8;
  int v9;
  CFDateRef result;
  CFRange v11;

  v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v3 = CFLocaleCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], CFSTR("en_US"));
  v4 = CFDateFormatterCreate(v2, v3, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFRelease(v3);
  CFDateFormatterSetFormat(v4, CFSTR("yyyy-MM-dd'T'HH:mm:ssZZ"));
  Length = CFStringGetLength(a1);
  v11.location = 0;
  v11.length = Length;
  v6 = CFDateFormatterCreateDateFromString(v2, v4, a1, &v11);
  CFRelease(v4);
  if (v6)
    v7 = v11.location == 0;
  else
    v7 = 0;
  v8 = v7;
  v9 = v8 & (v11.length == Length);
  if (v9)
    result = v6;
  else
    result = 0;
  if ((v9 & 1) == 0)
  {
    if (v6)
    {
      CFRelease(v6);
      return 0;
    }
  }
  return result;
}

__CFString *TSUDateFormatterCopyFormatStringForDateAndTimeStyles(CFDateFormatterStyle a1, CFDateFormatterStyle a2)
{
  const __CFLocale *v4;
  __CFDateFormatter *v5;
  __CFDateFormatter *v6;
  __CFString *Mutable;
  const __CFString *Format;
  const __CFString *v9;

  v4 = TSUCopyCurrentLocaleWithGregorianCalendar();
  v5 = CFDateFormatterCreate(0, v4, a1, kCFDateFormatterNoStyle);
  v6 = CFDateFormatterCreate(0, v4, kCFDateFormatterNoStyle, a2);
  CFRelease(v4);
  Mutable = CFStringCreateMutable(0, 200);
  Format = CFDateFormatterGetFormat(v5);
  v9 = CFDateFormatterGetFormat(v6);
  CFStringAppend(Mutable, Format);
  if (CFStringGetLength(Format) >= 1 && CFStringGetLength(v9) >= 1)
    CFStringAppend(Mutable, CFSTR(" "));
  CFStringAppend(Mutable, v9);
  CFRelease(v5);
  CFRelease(v6);
  return Mutable;
}

const __CFString *TSUDateFormatterStringFromDateWithFormat(const __CFDate *a1, const __CFString *a2)
{
  void *v4;
  __CFDateFormatter *v5;
  CFTimeZoneRef v6;
  const __CFString *v7;

  v4 = (void *)sDateFormatterCache;
  objc_sync_enter((id)sDateFormatterCache);
  v5 = (__CFDateFormatter *)objc_msgSend((id)sDateFormatterCache, "objectForKey:", a2);
  if (!v5)
  {
    v5 = CFDateFormatterCreate(0, (CFLocaleRef)sDateFormatterLocale, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
    v6 = TSUGetGMTTimeZone();
    CFDateFormatterSetProperty(v5, (CFStringRef)*MEMORY[0x24BDBD340], v6);
    CFDateFormatterSetFormat(v5, a2);
    objc_msgSend((id)sDateFormatterCache, "setObject:forKey:", v5, a2);
    CFRelease(v5);
  }
  v7 = (id)CFDateFormatterCreateStringWithDate(0, v5, a1);
  objc_sync_exit(v4);
  return v7;
}

void sub_216D52CD8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

CFStringRef TSUShortestCompleteDateTimeFormat()
{
  CFStringRef result;

  result = (CFStringRef)TSUShortestCompleteDateTimeFormat_sFormat;
  if (!TSUShortestCompleteDateTimeFormat_sFormat)
  {
    result = CFDateFormatterCreateDateFormatFromTemplate(0, CFSTR("yMdjms"), 0, (CFLocaleRef)sDateFormatterLocale);
    TSUShortestCompleteDateTimeFormat_sFormat = (uint64_t)result;
  }
  return result;
}

CFStringRef TSUShortestCompleteDateOnlyFormat()
{
  CFStringRef result;

  result = (CFStringRef)TSUShortestCompleteDateOnlyFormat_sFormat;
  if (!TSUShortestCompleteDateOnlyFormat_sFormat)
  {
    result = CFDateFormatterCreateDateFormatFromTemplate(0, CFSTR("yMd"), 0, (CFLocaleRef)sDateFormatterLocale);
    TSUShortestCompleteDateOnlyFormat_sFormat = (uint64_t)result;
  }
  return result;
}

uint64_t TSUDefaultDateTimeFormat()
{
  uint64_t result;
  void *v1;
  __CFString *v2;

  result = TSUDefaultDateTimeFormat_sFormat;
  if (!TSUDefaultDateTimeFormat_sFormat)
  {
    v1 = (void *)objc_opt_class();
    objc_sync_enter(v1);
    if (!TSUDefaultDateTimeFormat_sFormat)
    {
      v2 = TSUDateFormatterCopyFormatStringForDateAndTimeStyles(kCFDateFormatterShortStyle, kCFDateFormatterShortStyle);
      __dmb(0xBu);
      TSUDefaultDateTimeFormat_sFormat = (uint64_t)v2;
    }
    objc_sync_exit(v1);
    return TSUDefaultDateTimeFormat_sFormat;
  }
  return result;
}

void sub_216D52DCC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t TSUGregorianUnitsPresentInFormatString(void *a1)
{
  uint64_t v2;

  v2 = objc_msgSend(a1, "rangeOfString:", CFSTR("y")) != 0x7FFFFFFFFFFFFFFFLL;
  if (objc_msgSend(a1, "rangeOfString:", CFSTR("M")) != 0x7FFFFFFFFFFFFFFFLL)
    v2 |= 2uLL;
  if (objc_msgSend(a1, "rangeOfString:", CFSTR("d")) != 0x7FFFFFFFFFFFFFFFLL)
    v2 |= 4uLL;
  if (objc_msgSend(a1, "rangeOfString:options:", CFSTR("h"), 1) != 0x7FFFFFFFFFFFFFFFLL
    || objc_msgSend(a1, "rangeOfString:options:", CFSTR("k"), 1) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v2 |= 8uLL;
  }
  if (objc_msgSend(a1, "rangeOfString:", CFSTR("m")) != 0x7FFFFFFFFFFFFFFFLL)
    v2 |= 0x10uLL;
  if (objc_msgSend(a1, "rangeOfString:", CFSTR("s")) == 0x7FFFFFFFFFFFFFFFLL)
    return v2;
  else
    return v2 | 0x20;
}

CFDateRef TSUCreateDateWithGregorianUnitsSetToDefaultValue(uint64_t a1, void *a2)
{
  const __CFTimeZone *v4;
  CFAbsoluteTime v5;
  CFGregorianDate GregorianDate;
  uint64_t v7;
  uint64_t v8;
  CFAbsoluteTime Current;
  unint64_t v10;
  unint64_t v11;
  char v12;
  unsigned int year;
  id v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  CFGregorianDate v18;
  const __CFAllocator *v19;
  CFAbsoluteTime AbsoluteTime;
  CFDateRef v21;

  v4 = CFTimeZoneCopyDefault();
  v5 = MEMORY[0x219A015DC](a1);
  GregorianDate = CFAbsoluteTimeGetGregorianDate(v5, 0);
  v7 = HIDWORD(*(_QWORD *)&GregorianDate.year);
  v8 = *(_QWORD *)&GregorianDate.year >> 40;
  Current = CFAbsoluteTimeGetCurrent();
  v10 = *(_OWORD *)&CFAbsoluteTimeGetGregorianDate(Current, v4);
  v11 = TSUGregorianUnitsPresentInFormatString(a2);
  v12 = ~(_BYTE)v11;
  if ((v11 & 7) != 0)
  {
    if ((v11 & 1) != 0)
      year = GregorianDate.year;
    else
      year = v10;
    if ((~(_BYTE)v11 & 2) != 0)
      LOBYTE(v7) = 1;
    if ((~(_BYTE)v11 & 4) != 0)
      LOBYTE(v8) = 1;
  }
  else if (v11 >= 8)
  {
    if ((v11 & 1) != 0)
      year = GregorianDate.year;
    else
      year = v10;
    if ((~(_BYTE)v11 & 2) != 0)
      v7 = HIDWORD(v10);
    if ((~(_BYTE)v11 & 4) != 0)
      v8 = v10 >> 40;
  }
  else
  {
    v14 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CFDateRef TSUCreateDateWithGregorianUnitsSetToDefaultValue(CFDateRef, CFStringRef)");
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDateFormatter.m"), 380, CFSTR("this line must not be reached"));
    year = GregorianDate.year;
  }
  v16 = *(_QWORD *)&GregorianDate.year & 0xFF00000000000000;
  v17 = *(_QWORD *)&GregorianDate.year & 0xFF000000000000;
  if ((v12 & 0x10) != 0)
    v16 = 0;
  if ((v12 & 0x20) != 0)
    v18.second = 0.0;
  else
    v18.second = GregorianDate.second;
  v19 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  if ((v12 & 8) != 0)
    v17 = 0;
  *(_QWORD *)&v18.year = (v16 | v17) & 0xFFFF000000000000 | year | ((unint64_t)v7 << 32) & 0xFFFF00FFFFFFFFFFLL | ((unint64_t)v8 << 40);
  AbsoluteTime = CFGregorianDateGetAbsoluteTime(v18, 0);
  v21 = CFDateCreate(v19, AbsoluteTime);
  CFRelease(v4);
  return v21;
}

uint64_t TSUDateComponentOrderingForCurrentLocale()
{
  CFLocaleRef v0;
  const __CFString *v1;
  uint64_t v2;

  v0 = CFLocaleCopyCurrent();
  v1 = (const __CFString *)MEMORY[0x219A01708]();
  v2 = TSUDateComponentOrderingForLocale(v1);
  CFRelease(v0);
  return v2;
}

uint64_t TSUDateComponentOrderingForNonCachedCurrentLocale()
{
  id v0;
  const __CFString *v1;
  uint64_t v2;

  v0 = (id)objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v1 = (const __CFString *)MEMORY[0x219A01708]();
  v2 = TSUDateComponentOrderingForLocale(v1);
  CFRelease(v0);
  return v2;
}

id TSUCreateArrayOfDateFormatStringsForLocale(const __CFLocale *a1)
{
  id v1;
  id v2;

  v1 = TSUDateFormatterCopyDateTimeFormatInfoDictionaryForLocale(a1);
  v2 = (id)objc_msgSend(v1, "objectForKey:", TSUDateFormatterDateTimeFormatInfoAcceptedDateFormats);

  return v2;
}

id TSUCreateArrayOfTimeFormatStringsForLocale(const __CFLocale *a1)
{
  id v1;
  id v2;

  v1 = TSUDateFormatterCopyDateTimeFormatInfoDictionaryForLocale(a1);
  v2 = (id)objc_msgSend(v1, "objectForKey:", TSUDateFormatterDateTimeFormatInfoAcceptedTimeFormats);

  return v2;
}

uint64_t TSUCreateDateFromStringWithPreferredFormat(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  TSUDateParser *v9;
  uint64_t v10;
  void *v11;

  if (a2)
  {
    v9 = -[TSUDateParser initWithLocale:]([TSUDateParser alloc], "initWithLocale:", a2);
    v10 = -[TSUDateParser newDateFromString:preferredFormatString:successfulFormatString:tryAggressiveFormats:](v9, "newDateFromString:preferredFormatString:successfulFormatString:tryAggressiveFormats:", a1, a3, a4, a5);

  }
  else
  {
    v11 = (void *)objc_msgSend(+[TSUDateParserLibrary sharedDateParserLibrary](TSUDateParserLibrary, "sharedDateParserLibrary"), "checkoutDateParser");
    v10 = objc_msgSend(v11, "newDateFromString:preferredFormatString:successfulFormatString:tryAggressiveFormats:", a1, a3, a4, a5);
    objc_msgSend(+[TSUDateParserLibrary sharedDateParserLibrary](TSUDateParserLibrary, "sharedDateParserLibrary"), "returnDateParser:", v11);
  }
  return v10;
}

uint64_t TSUCreateDateFromString(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return TSUCreateDateFromStringWithPreferredFormat(a1, a2, 0, a3, 0);
}

void sub_216D54C5C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t TSUDurationFormatterStringFromTimeIntervalWithFormat(void *a1, double a2)
{
  return TSUDurationFormatterStringFromTimeIntervalWithFormatAndRoundingAndSingularOption(a1, 0, 0, a2);
}

uint64_t TSUDurationFormatterTimeIntervalFromStringWithCompactStyleStartUnit(void *a1, double *a2, int *a3, _DWORD *a4, int a5)
{
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  unsigned int v17;
  uint64_t v18;
  void *v19;
  char v20;
  char v21;
  unint64_t v22;
  unsigned int v23;
  double v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  int v34;
  int v35;
  uint64_t v36;
  int v38;
  uint64_t v39;
  uint64_t v40;
  __CFString *v41;
  __objc2_class **v42;
  void *v43;
  double v44;
  __CFString *v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  __CFString *v49;
  __objc2_class **v50;
  double *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unsigned int v55;
  id v56;
  uint64_t v57;
  double v58;
  int v59;
  id v60;
  double *v61;
  int v62;
  double v63;
  char v64;

  v64 = 0;
  v10 = objc_alloc_init(MEMORY[0x24BDD1460]);
  v11 = TSUDurationFormatterTokensFromString(a1, &v64);
  v12 = v11;

  if (!v11 || !objc_msgSend(v11, "count"))
  {
LABEL_38:

    return 0;
  }
  if (a3)
    *a3 = 0;
  if (v64)
  {
    if (a4)
      *a4 = 0;
    v13 = objc_msgSend(v11, "count");
    v14 = v13;
    v61 = a2;
    v59 = a5;
    if (v13)
    {
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = v13 - 2;
      do
      {
        v19 = (void *)objc_msgSend(v11, "objectAtIndex:", v15);
        objc_opt_class();
        v17 += objc_opt_isKindOfClass() & 1;
        v20 = objc_msgSend(v19, "isEqual:", CFSTR("."));
        if (v18 == v15)
          v21 = v20;
        else
          v21 = 0;
        v16 |= v21;
        ++v15;
      }
      while (v14 != v15);
    }
    else
    {
      v17 = 0;
      v16 = 0;
    }
    v35 = v17 - (v16 & 1);
    a2 = v61;
    v36 = v59;
    if (v35 > 5)
      goto LABEL_38;
    v38 = 5;
    if (v59 <= 7)
    {
      if (v59 == 2)
      {
        v38 = 4;
      }
      else if (v59 == 4)
      {
        v38 = 3;
      }
    }
    else
    {
      switch(v59)
      {
        case 8:
          v38 = 2;
          break;
        case 16:
          v38 = 1;
          break;
        case 32:
          v38 = 0;
          break;
      }
    }
    if (v59 && v17 <= v38 + (v16 & 1u))
    {
      if (v14)
      {
LABEL_54:
        v39 = 0;
        v40 = 0;
        v26 = 0.0;
        v41 = CFSTR("-");
        v42 = off_24D61A000;
        v27 = 0.0;
        v28 = 0.0;
        v29 = 0.0;
        v30 = 0.0;
        v24 = 0.0;
        while (1)
        {
          v43 = (void *)objc_msgSend(v11, "objectAtIndex:", v39);
          if ((-[__CFString isEqual:](v41, "isEqual:", v43) & 1) != 0)
          {
            v40 = 1;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v63 = 0.0;
              objc_msgSend((id)objc_msgSend(v43, "first"), "doubleValue");
              v63 = v44;
              if (v39
                && objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", v39 - 1), "isEqual:", CFSTR(".")))
              {
                v45 = (__CFString *)objc_msgSend(v43, "second");
                if ((unint64_t)-[__CFString length](v45, "length") <= 2)
                {
                  if (-[__CFString length](v45, "length") == 1)
                    v45 = (__CFString *)-[__CFString stringByAppendingString:](v45, "stringByAppendingString:", CFSTR("00"));
                  if (-[__CFString length](v45, "length") == 2)
                    v45 = (__CFString *)-[__CFString stringByAppendingString:](v45, "stringByAppendingString:", CFSTR("0"));
                  TSUGetNumberValueAndTypeFromString(v45, 0, (uint64_t)&v63, 0, 0, 0);
                }
                v26 = v63;
                if (!a3)
                  goto LABEL_86;
                v46 = *a3 | 0x20;
              }
              else
              {
                switch((int)v36)
                {
                  case 1:
                    v24 = v63;
                    if (a3)
                      *a3 |= 1u;
                    v36 = 2;
                    goto LABEL_86;
                  case 2:
                    v30 = v63;
                    if (a3)
                      *a3 |= 2u;
                    v36 = 4;
                    goto LABEL_86;
                  case 3:
                  case 5:
                  case 6:
                  case 7:
                    goto LABEL_76;
                  case 4:
                    v29 = v63;
                    if (a3)
                      *a3 |= 4u;
                    v36 = 8;
                    goto LABEL_86;
                  case 8:
                    v28 = v63;
                    if (a3)
                      *a3 |= 8u;
                    v36 = 16;
                    goto LABEL_86;
                  default:
                    if ((_DWORD)v36 != 16)
                    {
LABEL_76:
                      v60 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
                      v47 = v36;
                      v48 = v40;
                      v49 = v41;
                      v50 = v42;
                      v51 = a2;
                      v52 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL TSUDurationFormatterTimeIntervalFromStringWithCompactStyleStartUnit(NSString *, NSTimeInterval *, TSUDurationUnits *, TSUDurationStyle *, TSUDurationUnits)");
                      v53 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDurationFormatter.m");
                      v54 = v52;
                      a2 = v51;
                      v42 = v50;
                      v41 = v49;
                      v40 = v48;
                      v36 = v47;
                      objc_msgSend(v60, "handleFailureInFunction:file:lineNumber:description:", v54, v53, 604, CFSTR("Unexpected duration unit!"));
                      goto LABEL_86;
                    }
                    v27 = v63;
                    v36 = 0;
                    if (!a3)
                      goto LABEL_86;
                    v46 = *a3 | 0x10;
                    break;
                }
              }
              *a3 = v46;
            }
          }
LABEL_86:
          if (v14 == ++v39)
            goto LABEL_93;
        }
      }
    }
    else
    {
      v55 = v35 - 1;
      if (v55 >= 5)
      {
        v56 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
        v57 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL TSUDurationFormatterTimeIntervalFromStringWithCompactStyleStartUnit(NSString *, NSTimeInterval *, TSUDurationUnits *, TSUDurationStyle *, TSUDurationUnits)");
        objc_msgSend(v56, "handleFailureInFunction:file:lineNumber:description:", v57, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDurationFormatter.m"), 554, CFSTR("Unexpected duration unit count!"));
        v36 = 0;
        if (v14)
          goto LABEL_54;
      }
      else
      {
        v36 = dword_216DA5C50[v55];
        if (v14)
          goto LABEL_54;
      }
    }
    LOBYTE(v40) = 0;
    v24 = 0.0;
    v30 = 0.0;
    v29 = 0.0;
    v28 = 0.0;
    v27 = 0.0;
    v26 = 0.0;
LABEL_93:
    v23 = v40 & 1;
  }
  else
  {
    if (a4)
      *a4 = 1;
    v22 = objc_msgSend(v11, "count");
    v23 = objc_msgSend(CFSTR("-"), "isEqual:", objc_msgSend(v11, "objectAtIndex:", 0));
    v24 = 0.0;
    if (v22 > v23)
    {
      v25 = 0;
      v26 = 0.0;
      v27 = 0.0;
      v28 = 0.0;
      v29 = 0.0;
      v30 = 0.0;
      while (1)
      {
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", v23 + v25), "first"), "doubleValue");
        v32 = v31;
        v33 = objc_msgSend(v11, "objectAtIndex:", v23 + v25 + 1);
        v62 = 1;
        v34 = TSUDurationFormatterDurationUnitFromString(v33, &v62);
        if (a4 && !v25)
          *a4 = v62;
        switch(v34)
        {
          case 1:
            v24 = v32;
            goto LABEL_32;
          case 2:
            v30 = v32;
            goto LABEL_32;
          case 3:
          case 5:
          case 6:
          case 7:
            goto LABEL_38;
          case 4:
            v29 = v32;
            goto LABEL_32;
          case 8:
            v28 = v32;
            goto LABEL_32;
          default:
            if (v34 == 16)
            {
              v27 = v32;
LABEL_32:
              v32 = v26;
              if (a3)
                goto LABEL_33;
            }
            else
            {
              if (v34 != 32)
                goto LABEL_38;
              v26 = v32;
              if (a3)
              {
LABEL_33:
                *a3 |= v34;
                v26 = v32;
              }
            }
            v25 += 2;
            if ((unint64_t)v23 + v25 >= v22)
              goto LABEL_94;
            break;
        }
      }
    }
    v30 = 0.0;
    v29 = 0.0;
    v28 = 0.0;
    v27 = 0.0;
    v26 = 0.0;
  }
LABEL_94:
  if (a2)
  {
    v58 = v27 + v30 * 86400.0 + v24 * 604800.0 + v29 * 3600.0 + v28 * 60.0 + v26 / 1000.0;
    *a2 = v58;
    if (v23)
      *a2 = -v58;
  }

  return 1;
}

uint64_t TSUDurationFormatterDurationUnitFromString(uint64_t a1, int *a2)
{
  uint64_t result;
  int v5;

  SFTDurationFormatterInitializeStrings();
  if ((objc_msgSend((id)sWeekLongSingularString, "isEqualToString:", a1) & 1) != 0
    || objc_msgSend((id)sWeekLongPluralString, "isEqualToString:", a1))
  {
    result = 1;
    if (!a2)
      return result;
    goto LABEL_4;
  }
  if ((objc_msgSend((id)sWeekMediumSingularString, "isEqualToString:", a1) & 1) != 0
    || objc_msgSend((id)sWeekMediumPluralString, "isEqualToString:", a1))
  {
    result = 1;
    if (!a2)
      return result;
    goto LABEL_8;
  }
  if (!objc_msgSend((id)sWeekShortString, "isEqualToString:", a1))
  {
    if ((objc_msgSend((id)sDayLongSingularString, "isEqualToString:", a1) & 1) != 0
      || objc_msgSend((id)sDayLongPluralString, "isEqualToString:", a1))
    {
      v5 = 2;
      result = 2;
      if (a2)
        goto LABEL_9;
      return result;
    }
    if ((objc_msgSend((id)sDayMediumSingularString, "isEqualToString:", a1) & 1) != 0
      || objc_msgSend((id)sDayMediumPluralString, "isEqualToString:", a1))
    {
      result = 2;
      if (!a2)
        return result;
      goto LABEL_8;
    }
    if (objc_msgSend((id)sDayShortString, "isEqualToString:", a1))
    {
      result = 2;
      if (!a2)
        return result;
      goto LABEL_24;
    }
    if ((objc_msgSend((id)sHourLongSingularString, "isEqualToString:", a1) & 1) != 0
      || objc_msgSend((id)sHourLongPluralString, "isEqualToString:", a1))
    {
      result = 4;
      if (!a2)
        return result;
      goto LABEL_4;
    }
    if ((objc_msgSend((id)sHourMediumSingularString, "isEqualToString:", a1) & 1) != 0
      || objc_msgSend((id)sHourMediumPluralString, "isEqualToString:", a1))
    {
      result = 4;
      if (!a2)
        return result;
      goto LABEL_8;
    }
    if (objc_msgSend((id)sHourShortString, "isEqualToString:", a1))
    {
      result = 4;
      if (!a2)
        return result;
      goto LABEL_24;
    }
    if ((objc_msgSend((id)sMinuteLongSingularString, "isEqualToString:", a1) & 1) != 0
      || objc_msgSend((id)sMinuteLongPluralString, "isEqualToString:", a1))
    {
      result = 8;
      if (!a2)
        return result;
      goto LABEL_4;
    }
    if ((objc_msgSend((id)sMinuteMediumSingularString, "isEqualToString:", a1) & 1) != 0
      || objc_msgSend((id)sMinuteMediumPluralString, "isEqualToString:", a1))
    {
      result = 8;
      if (!a2)
        return result;
      goto LABEL_8;
    }
    if (objc_msgSend((id)sMinuteShortString, "isEqualToString:", a1))
    {
      result = 8;
      if (!a2)
        return result;
      goto LABEL_24;
    }
    if ((objc_msgSend((id)sSecondLongSingularString, "isEqualToString:", a1) & 1) != 0
      || objc_msgSend((id)sSecondLongPluralString, "isEqualToString:", a1))
    {
      result = 16;
      if (!a2)
        return result;
      goto LABEL_4;
    }
    if ((objc_msgSend((id)sSecondMediumSingularString, "isEqualToString:", a1) & 1) != 0
      || objc_msgSend((id)sSecondMediumPluralString, "isEqualToString:", a1))
    {
      result = 16;
      if (!a2)
        return result;
LABEL_8:
      v5 = 3;
      goto LABEL_9;
    }
    if (objc_msgSend((id)sSecondShortString, "isEqualToString:", a1))
    {
      result = 16;
      if (!a2)
        return result;
    }
    else
    {
      if ((objc_msgSend((id)sMillisecondLongSingularString, "isEqualToString:", a1) & 1) != 0
        || objc_msgSend((id)sMillisecondLongPluralString, "isEqualToString:", a1))
      {
        result = 32;
        if (!a2)
          return result;
LABEL_4:
        v5 = 2;
LABEL_9:
        *a2 = v5;
        return result;
      }
      result = objc_msgSend((id)sMillisecondShortString, "isEqualToString:", a1);
      if (!(_DWORD)result)
        return result;
      result = 32;
      if (!a2)
        return result;
    }
LABEL_24:
    v5 = 1;
    goto LABEL_9;
  }
  v5 = 1;
  result = 1;
  if (a2)
    goto LABEL_9;
  return result;
}

void SFTDurationFormatterInitializeStrings()
{
  void *v0;

  if ((sStringsInitialized & 1) == 0)
  {
    v0 = (void *)objc_opt_class();
    objc_sync_enter(v0);
    sWeekLongSingularString = (uint64_t)(id)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("week"), &stru_24D61C228, CFSTR("TSUtility"));
    sWeekLongPluralString = (uint64_t)(id)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("weeks"), &stru_24D61C228, CFSTR("TSUtility"));
    sWeekMediumSingularString = (uint64_t)(id)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("wk"), &stru_24D61C228, CFSTR("TSUtility"));
    sWeekMediumPluralString = (uint64_t)(id)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("wks"), &stru_24D61C228, CFSTR("TSUtility"));
    sWeekShortString = (uint64_t)(id)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("w"), &stru_24D61C228, CFSTR("TSUtility"));
    sDayLongSingularString = (uint64_t)(id)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("day"), &stru_24D61C228, CFSTR("TSUtility"));
    sDayLongPluralString = (uint64_t)(id)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("days"), &stru_24D61C228, CFSTR("TSUtility"));
    sDayMediumSingularString = (uint64_t)(id)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("day"), &stru_24D61C228, CFSTR("TSUtility"));
    sDayMediumPluralString = (uint64_t)(id)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("days"), &stru_24D61C228, CFSTR("TSUtility"));
    sDayShortString = (uint64_t)(id)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("d"), &stru_24D61C228, CFSTR("TSUtility"));
    sHourLongSingularString = (uint64_t)(id)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("hour"), &stru_24D61C228, CFSTR("TSUtility"));
    sHourLongPluralString = (uint64_t)(id)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("hours"), &stru_24D61C228, CFSTR("TSUtility"));
    sHourMediumSingularString = (uint64_t)(id)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("hr"), &stru_24D61C228, CFSTR("TSUtility"));
    sHourMediumPluralString = (uint64_t)(id)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("hrs"), &stru_24D61C228, CFSTR("TSUtility"));
    sHourShortString = (uint64_t)(id)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("h"), &stru_24D61C228, CFSTR("TSUtility"));
    sMinuteLongSingularString = (uint64_t)(id)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("minute"), &stru_24D61C228, CFSTR("TSUtility"));
    sMinuteLongPluralString = (uint64_t)(id)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("minutes"), &stru_24D61C228, CFSTR("TSUtility"));
    sMinuteMediumSingularString = (uint64_t)(id)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("min"), &stru_24D61C228, CFSTR("TSUtility"));
    sMinuteMediumPluralString = (uint64_t)(id)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("mins"), &stru_24D61C228, CFSTR("TSUtility"));
    sMinuteShortString = (uint64_t)(id)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("m"), &stru_24D61C228, CFSTR("TSUtility"));
    sSecondLongSingularString = (uint64_t)(id)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("second"), &stru_24D61C228, CFSTR("TSUtility"));
    sSecondLongPluralString = (uint64_t)(id)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("seconds"), &stru_24D61C228, CFSTR("TSUtility"));
    sSecondMediumSingularString = (uint64_t)(id)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("sec"), &stru_24D61C228, CFSTR("TSUtility"));
    sSecondMediumPluralString = (uint64_t)(id)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("secs"), &stru_24D61C228, CFSTR("TSUtility"));
    sSecondShortString = (uint64_t)(id)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("s"), &stru_24D61C228, CFSTR("TSUtility"));
    sMillisecondLongSingularString = (uint64_t)(id)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("millisecond"), &stru_24D61C228, CFSTR("TSUtility"));
    sMillisecondLongPluralString = (uint64_t)(id)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("milliseconds"), &stru_24D61C228, CFSTR("TSUtility"));
    sMillisecondShortString = (uint64_t)(id)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("ms"), &stru_24D61C228, CFSTR("TSUtility"));
    __dmb(0xBu);
    sStringsInitialized = 1;
    objc_sync_exit(v0);
  }
}

void sub_216D56A28(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

const __CFString *TSUDurationFormatterUnitString(int a1, int a2, double a3)
{
  return TSUDurationSingularPluralFormatterUnitString(a1, a2, 0, a3);
}

const __CFString *TSUDurationSingularPluralFormatterUnitString(int a1, int a2, int a3, double a4)
{
  int v8;
  const __CFString *result;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t *v12;

  SFTDurationFormatterInitializeStrings();
  if (a4 == 1.0)
    v8 = 1;
  else
    v8 = a3;
  result = &stru_24D61C228;
  switch(a1)
  {
    case 1:
      switch(a2)
      {
        case 3:
          v10 = &sWeekMediumSingularString;
          v11 = &sWeekMediumPluralString;
          goto LABEL_42;
        case 2:
          v10 = &sWeekLongSingularString;
          v11 = &sWeekLongPluralString;
          goto LABEL_42;
        case 1:
          return (const __CFString *)sWeekShortString;
      }
      return result;
    case 2:
      switch(a2)
      {
        case 3:
          v10 = &sDayMediumSingularString;
          v11 = &sDayMediumPluralString;
          goto LABEL_42;
        case 2:
          v10 = &sDayLongSingularString;
          v11 = &sDayLongPluralString;
          goto LABEL_42;
        case 1:
          return (const __CFString *)sDayShortString;
      }
      return result;
    case 3:
    case 5:
    case 6:
    case 7:
      return result;
    case 4:
      switch(a2)
      {
        case 3:
          v10 = &sHourMediumSingularString;
          v11 = &sHourMediumPluralString;
          goto LABEL_42;
        case 2:
          v10 = &sHourLongSingularString;
          v11 = &sHourLongPluralString;
          goto LABEL_42;
        case 1:
          return (const __CFString *)sHourShortString;
      }
      return result;
    case 8:
      switch(a2)
      {
        case 3:
          v10 = &sMinuteMediumSingularString;
          v11 = &sMinuteMediumPluralString;
          goto LABEL_42;
        case 2:
          v10 = &sMinuteLongSingularString;
          v11 = &sMinuteLongPluralString;
          goto LABEL_42;
        case 1:
          return (const __CFString *)sMinuteShortString;
      }
      return result;
    default:
      if (a1 != 16)
      {
        if (a1 != 32)
          return result;
        if (a2 == 3)
          return (const __CFString *)sMillisecondShortString;
        if (a2 != 2)
        {
          if (a2 != 1)
            return result;
          return (const __CFString *)sMillisecondShortString;
        }
        v10 = &sMillisecondLongSingularString;
        v11 = &sMillisecondLongPluralString;
        goto LABEL_42;
      }
      switch(a2)
      {
        case 3:
          v10 = &sSecondMediumSingularString;
          v11 = &sSecondMediumPluralString;
LABEL_42:
          if (v8)
            v12 = v10;
          else
            v12 = v11;
          return (const __CFString *)*v12;
        case 2:
          v10 = &sSecondLongSingularString;
          v11 = &sSecondLongPluralString;
          goto LABEL_42;
        case 1:
          return (const __CFString *)sSecondShortString;
      }
      return result;
  }
}

const __CFString *TSUDurationSingularFormatterUnitString(int a1, int a2, double a3)
{
  return TSUDurationSingularPluralFormatterUnitString(a1, a2, 1, a3);
}

uint64_t TSUDurationFormatterTimeIntervalFromString(void *a1, double *a2, int *a3, _DWORD *a4)
{
  return TSUDurationFormatterTimeIntervalFromStringWithCompactStyleStartUnit(a1, a2, a3, a4, 0);
}

void *TSUDurationFormatterTokensFromString(void *a1, _BYTE *a2)
{
  void *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *result;
  uint64_t *v15;
  uint64_t v16;
  int v17;
  char v18;
  _BYTE *v19;
  int v20;
  double v21;
  __CFString *v22;

  TSUDurationFormatterInitializeConstantSets();
  v4 = (void *)objc_msgSend(a1, "stringByTrimmingCharactersInSet:", sWhitespaceAndNewlineCharacterSet);
  v5 = (void *)objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v4);
  objc_msgSend(v5, "setCharactersToBeSkipped:", sEmptyCharacterSet);
  v22 = 0;
  if ((objc_msgSend(v5, "isAtEnd") & 1) != 0)
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    goto LABEL_3;
  }
  v19 = a2;
  v6 = 0;
  v20 = 0;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = -1;
  do
  {
    if (!v10)
      v10 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v12 = objc_msgSend(v4, "characterAtIndex:", objc_msgSend(v5, "scanLocation", v19));
    if (objc_msgSend((id)sAlphabeticCharacterSet, "characterIsMember:", v12))
    {
      if (((v8 | v6) & 1) != 0)
        return 0;
      v13 = objc_msgSend(v10, "count");
      result = 0;
      if ((v11 & 0xFFFFFFFD) == 1 || !v13)
        return result;
      objc_msgSend(v5, "scanCharactersFromSet:intoString:", sAlphabeticCharacterSet, &v22);
      objc_msgSend(v10, "addObject:", v22);
      v11 = 1;
    }
    else
    {
      if ((v8 & 1) != 0)
      {
        if ((objc_msgSend((id)sDecimalDigitCharacterSet, "characterIsMember:", v12) & 1) == 0)
          goto LABEL_19;
      }
      else if (!objc_msgSend((id)sDecimalDigitAndSeperatorsCharacterSet, "characterIsMember:", v12))
      {
LABEL_19:
        if (!objc_msgSend((id)sMinusSignCharacterSet, "characterIsMember:", v12)
          || objc_msgSend(v10, "count"))
        {
          return 0;
        }
        objc_msgSend(v5, "scanCharactersFromSet:intoString:", sMinusSignCharacterSet, 0);
        objc_msgSend(v10, "addObject:", CFSTR("-"));
        v11 = 3;
        v20 = 1;
        goto LABEL_28;
      }
      if (!v11)
        return 0;
      v15 = &sDecimalDigitCharacterSet;
      if ((v8 & 1) == 0)
        v15 = &sDecimalDigitAndSeperatorsCharacterSet;
      objc_msgSend(v5, "scanCharactersFromSet:intoString:", *v15, &v22);
      v21 = 0.0;
      if (!TSUGetNumberValueAndTypeFromString(v22, 0, (uint64_t)&v21, 0, 0, 0))
        return 0;
      v9 |= trunc(v21) != v21;
      v16 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
      objc_msgSend(v10, "addObject:", +[TSUPair pairWithFirst:second:](TSUPair, "pairWithFirst:second:", v16, v22));
      v11 = 0;
    }
LABEL_28:
    objc_msgSend(v5, "scanCharactersFromSet:intoString:", sWhitespaceCharacterSet, 0);
    v17 = objc_msgSend(v5, "scanCharactersFromSet:intoString:", sSeparatorPunctuationCharacterSet, &v22);
    v18 = v17;
    if (v17)
    {
      if ((objc_msgSend(v10, "count") == 0) | v6 & 1)
        return 0;
      objc_msgSend(v10, "addObject:", v22);
      v6 = -[__CFString isEqualToString:](v22, "isEqualToString:", CFSTR("."));
      v8 |= v6 ^ 1;
      v11 = 2;
    }
    objc_msgSend(v5, "scanCharactersFromSet:intoString:", sWhitespaceCharacterSet, 0);
  }
  while (!objc_msgSend(v5, "isAtEnd"));
  a2 = v19;
  v7 = v20;
  if ((v18 & 1) != 0)
    return 0;
LABEL_3:
  if (a2)
    *a2 = (v6 | v8) & 1;
  if ((v8 & v9 & 1) != 0)
    return 0;
  if (((v8 | v6) & 1) != 0)
  {
    if (!(v8 & 1 | ((v6 & 1) == 0)))
      return 0;
  }
  else if (((v7 ^ ((objc_msgSend(v10, "count") & 1) == 0)) & 1) == 0)
  {
    return 0;
  }
  if ((v7 & 1) != 0 && (unint64_t)objc_msgSend(v10, "count") < 2)
    return 0;
  else
    return v10;
}

uint64_t TSUDurationFormatterMaxValuesForCompactStyleDurationWithMaxUnit(int a1, int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;

  if (a1 == 32)
    v2 = 0;
  else
    v2 = 5;
  if (a1 == 16)
    v3 = 1;
  else
    v3 = v2;
  if (a1 == 8)
    v4 = 2;
  else
    v4 = v3;
  if (a1 == 4)
    v5 = 3;
  else
    v5 = 5;
  if (a1 == 2)
    v5 = 4;
  if (a1 > 7)
    v5 = v4;
  return (v5 + a2);
}

void TSUDurationFormatterInitializeConstantSets()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;

  if ((sSetsInitialized & 1) == 0)
  {
    v0 = (void *)objc_opt_class();
    objc_sync_enter(v0);
    if ((sSetsInitialized & 1) == 0)
    {
      sEmptyCharacterSet = (uint64_t)(id)objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", &stru_24D61C228);
      sSeparatorPunctuationCharacterSet = (uint64_t)(id)objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR(":."));
      sMinusSignCharacterSet = (uint64_t)(id)objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("-"));
      sAlphabeticCharacterSet = (uint64_t)(id)objc_msgSend(MEMORY[0x24BDD14A8], "letterCharacterSet");
      sDecimalDigitCharacterSet = (uint64_t)(id)objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
      v1 = (id)objc_msgSend(MEMORY[0x24BDD1690], "decimalDigitCharacterSet");
      sDecimalDigitAndSeperatorsCharacterSet = (uint64_t)v1;
      v2 = (void *)objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      objc_msgSend(v1, "addCharactersInString:", objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BDBCB00]));
      v3 = (void *)sDecimalDigitAndSeperatorsCharacterSet;
      v4 = (void *)objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      objc_msgSend(v3, "addCharactersInString:", objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDBCB10]));
      sWhitespaceCharacterSet = (uint64_t)(id)objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
      sWhitespaceAndNewlineCharacterSet = (uint64_t)(id)objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
      sSpecialDurationFormatCharacters = (uint64_t)(id)objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("wdhmsf"));
      __dmb(0xBu);
      sSetsInitialized = 1;
    }
    objc_sync_exit(v0);
  }
}

void sub_216D571E8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t TSUDurationFormatterStringFromTimeIntervalWithFormatAndRounding(void *a1, double a2)
{
  return TSUDurationFormatterStringFromTimeIntervalWithFormatAndRoundingAndSingularOption(a1, 0, 0, a2);
}

uint64_t TSUDurationSingularFormatterStringFromTimeIntervalWithFormat(void *a1, double a2)
{
  return TSUDurationFormatterStringFromTimeIntervalWithFormatAndRoundingAndSingularOption(a1, 1, 1, a2);
}

uint64_t TSUDurationFormatterStringFromTimeIntervalWithFormatAndRoundingAndSingularOption(void *a1, int a2, int a3, double a4)
{
  unint64_t v6;
  void *v7;
  void *v8;
  unsigned int v9;
  unint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int v15;
  unsigned int v16;
  unsigned int v17;
  int v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  int v23;
  int v24;
  int v25;
  _OWORD *v26;
  _BOOL4 v27;
  int v28;
  double v29;
  double v30;
  double v31;
  int v32;
  double v33;
  int v34;
  _BOOL4 v35;
  double v36;
  double v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  int v46;
  int v47;
  int v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  int v53;
  uint64_t v54;
  _OWORD *v55;
  uint64_t v56;
  int v57;
  int v58;
  int v59;
  double v60;
  id v61;
  uint64_t v62;
  int v63;
  unsigned __int16 v64;
  __CFString *v65;
  const __CFString *v66;
  __CFString *v67;
  double v68;
  int v69;
  int v70;
  __CFString *v71;
  const __CFString *v72;
  void *v74;
  int v76;
  unsigned int v77;
  int v78;
  char v80;
  _OWORD v81[6];
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  TSUDurationFormatterInitializeConstantSets();
  v6 = objc_msgSend(a1, "length");
  v7 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", v6);
  v8 = v7;
  if (a4 < 0.0)
  {
    objc_msgSend(v7, "appendString:", CFSTR("-"));
    a4 = fabs(a4);
  }
  v74 = v8;
  if (!v6)
  {
    v32 = 0;
    v80 = 0;
    v9 = 0;
    LOBYTE(v11) = 0;
    v27 = 1;
    v33 = 2.22507386e-308;
    v30 = 2.22507386e-308;
    v29 = 2.22507386e-308;
    v31 = 2.22507386e-308;
    goto LABEL_51;
  }
  v80 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  do
  {
    v12 = objc_msgSend(a1, "characterAtIndex:", v10);
    v13 = v12;
    v14 = v10 + 1;
    if (v10 + 1 >= v6)
    {
      if ((_DWORD)v12 == 39)
        goto LABEL_45;
    }
    else
    {
      v15 = objc_msgSend(a1, "characterAtIndex:", v10 + 1);
      if ((_DWORD)v13 == 39)
      {
        if (v15 == 39)
        {
          objc_msgSend(v8, "appendString:", CFSTR("'"));
          v14 = v10 + 2;
          goto LABEL_45;
        }
        while (1)
        {
          v16 = objc_msgSend(a1, "characterAtIndex:", v14);
          v17 = v16;
          if (v14 + 1 >= v6)
            break;
          v18 = objc_msgSend(a1, "characterAtIndex:", v14 + 1);
          if (v17 != 39)
            goto LABEL_14;
          if (v18 != 39)
            goto LABEL_30;
          objc_msgSend(v8, "appendString:", CFSTR("'"));
          v14 += 2;
LABEL_15:
          if (v14 >= v6)
            goto LABEL_45;
        }
        if (v16 == 39)
        {
LABEL_30:
          ++v14;
          goto LABEL_45;
        }
LABEL_14:
        objc_msgSend(v8, "appendFormat:", CFSTR("%C"), v17);
        ++v14;
        goto LABEL_15;
      }
    }
    if (!objc_msgSend((id)sSpecialDurationFormatCharacters, "characterIsMember:", v13))
    {
      objc_msgSend(v8, "appendFormat:", CFSTR("%C"), v13);
      goto LABEL_45;
    }
    v76 = v11;
    v77 = v9++;
    if (v9 >= 7)
    {
      v19 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
      v20 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *TSUDurationFormatterStringFromTimeIntervalWithFormatAndRoundingAndSingularOption(NSTimeInterval, NSString *, BOOL, BOOL)");
      v8 = v74;
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDurationFormatter.m"), 850, CFSTR("Too many placeholders in duration format string!"));
    }
    v21 = objc_msgSend(v8, "length");
    if (v14 >= v6)
    {
      v24 = 0;
    }
    else
    {
      v22 = v6 - v10;
      v23 = 1;
      while (objc_msgSend(a1, "characterAtIndex:", v14) == (_DWORD)v13)
      {
        ++v23;
        if (v6 == ++v14)
        {
          v14 = v6;
          v23 = v22;
          break;
        }
      }
      v24 = 0;
      switch(v23)
      {
        case 1:
          break;
        case 2:
          v24 = 1;
          break;
        case 3:
          v24 = 2;
          break;
        case 5:
          v24 = 2;
          goto LABEL_35;
        case 6:
          v24 = 4;
LABEL_35:
          v80 = 1;
          break;
        default:
          v24 = 3;
          break;
      }
    }
    v25 = 0;
    switch((int)v13)
    {
      case 'd':
        v25 = 2;
        break;
      case 'e':
      case 'g':
      case 'i':
      case 'j':
      case 'k':
      case 'l':
        break;
      case 'f':
        v25 = 32;
        break;
      case 'h':
        v25 = 4;
        break;
      case 'm':
        v25 = 8;
        break;
      default:
        v25 = v13 == 119;
        if ((_DWORD)v13 == 115)
          v25 = 16;
        break;
    }
    v26 = &v81[v77];
    *(_QWORD *)v26 = v21;
    v11 = v25 | v76;
    *((_DWORD *)v26 + 2) = v25;
    *((_DWORD *)v26 + 3) = v24;
LABEL_45:
    v10 = v14;
  }
  while (v14 < v6);
  v27 = (v11 & 1) == 0;
  if ((v11 & 1) != 0)
  {
    v29 = floor(a4 / 604800.0);
    a4 = a4 + v29 * -604800.0;
    v28 = 1;
    if ((v11 & 2) == 0)
      goto LABEL_55;
LABEL_48:
    v30 = floor(a4 / 86400.0);
    a4 = a4 + v30 * -86400.0;
    if ((v11 & 4) != 0)
      goto LABEL_49;
LABEL_56:
    v31 = 2.22507386e-308;
  }
  else
  {
    v28 = 0;
    v29 = 2.22507386e-308;
    if ((v11 & 2) != 0)
      goto LABEL_48;
LABEL_55:
    v30 = 2.22507386e-308;
    if ((v11 & 4) == 0)
      goto LABEL_56;
LABEL_49:
    v31 = floor(a4 / 3600.0);
    a4 = a4 + v31 * -3600.0;
  }
  v35 = (v11 & 8) == 0;
  if ((v11 & 8) != 0)
  {
    v33 = floor(a4 / 60.0);
    a4 = a4 + v33 * -60.0;
    if ((v11 & 0x10) == 0)
      goto LABEL_66;
LABEL_59:
    v37 = trunc(a4);
    a4 = a4 - v37;
    if ((v11 & 0x20) != 0)
      v36 = a4 * 1000.0;
    else
      v36 = 2.22507386e-308;
    v34 = 16;
    if ((v11 & 0x20) != 0)
      v32 = 32;
    else
      v32 = 16;
    goto LABEL_74;
  }
  v33 = 2.22507386e-308;
  if ((v11 & 0x10) != 0)
    goto LABEL_59;
LABEL_66:
  if ((v11 & 0x20) != 0)
  {
    v34 = v11 & 0x20;
    v36 = a4 * 1000.0;
    v32 = 32;
    v37 = 2.22507386e-308;
    goto LABEL_74;
  }
  if ((v11 & 8) != 0)
  {
    v35 = 0;
    v34 = 0;
    v32 = 8;
    goto LABEL_53;
  }
  if ((v11 & 2) != 0)
    v32 = 2;
  else
    v32 = v28;
  if ((v11 & 4) == 0)
  {
LABEL_51:
    v34 = 0;
    goto LABEL_52;
  }
  v34 = 0;
  v32 = 4;
LABEL_52:
  v35 = 1;
LABEL_53:
  v36 = 2.22507386e-308;
  v37 = 2.22507386e-308;
LABEL_74:
  if (a2)
  {
    switch(v32)
    {
      case 1:
        if (round(a4 / 604800.0) >= 1.0)
          v29 = v29 + 1.0;
        goto LABEL_106;
      case 2:
        if (round(a4 / 86400.0) >= 1.0)
          v30 = v30 + 1.0;
        goto LABEL_106;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_83;
      case 4:
        if (round(a4 / 3600.0) >= 1.0)
          v31 = v31 + 1.0;
        goto LABEL_106;
      case 8:
        if (round(a4 / 60.0) >= 1.0)
          v33 = v33 + 1.0;
        goto LABEL_106;
      default:
        if (v32 == 16)
        {
          if (round(a4) >= 1.0)
            v37 = v37 + 1.0;
          goto LABEL_106;
        }
        if (v32 == 32)
          goto LABEL_86;
LABEL_83:
        v38 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
        v39 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *TSUDurationFormatterStringFromTimeIntervalWithFormatAndRoundingAndSingularOption(NSTimeInterval, NSString *, BOOL, BOOL)");
        v8 = v74;
        v40 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDurationFormatter.m");
        v41 = v38;
        v42 = v39;
        v43 = 1000;
        break;
    }
  }
  else
  {
    switch(v32)
    {
      case 1:
        v29 = v29 + a4 / 604800.0;
        goto LABEL_106;
      case 2:
        v30 = v30 + a4 / 86400.0;
        goto LABEL_106;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_87;
      case 4:
        v31 = v31 + a4 / 3600.0;
        goto LABEL_106;
      case 8:
        v33 = v33 + a4 / 60.0;
        goto LABEL_106;
      default:
        if (v32 == 16)
        {
          v37 = v37 + a4;
          goto LABEL_106;
        }
        if (v32 == 32)
        {
LABEL_86:
          v36 = round(v36);
          goto LABEL_106;
        }
LABEL_87:
        v44 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
        v45 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *TSUDurationFormatterStringFromTimeIntervalWithFormatAndRoundingAndSingularOption(NSTimeInterval, NSString *, BOOL, BOOL)");
        v8 = v74;
        v40 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDurationFormatter.m");
        v41 = v44;
        v42 = v45;
        v43 = 1024;
        break;
    }
  }
  objc_msgSend(v41, "handleFailureInFunction:file:lineNumber:description:", v42, v40, v43, CFSTR("Unknown minimum unit!"));
LABEL_106:
  if (v27)
    v46 = 2;
  else
    v46 = 1;
  if ((v11 & 3) == 0)
    v46 = 4;
  if (v35)
    v47 = v34;
  else
    v47 = 8;
  if ((v11 & 7) != 0)
    v48 = v46;
  else
    v48 = v47;
  if (v48 != v32)
  {
    while (2)
    {
      switch(v32)
      {
        case 1:
          break;
        case 2:
          if (v30 >= 7.0)
          {
            v29 = v29 + 1.0;
            v32 = 1;
            v30 = 0.0;
            goto LABEL_132;
          }
          break;
        case 3:
        case 5:
        case 6:
        case 7:
          goto LABEL_125;
        case 4:
          if (v31 < 24.0)
            break;
          v30 = v30 + 1.0;
          v32 = 2;
          v31 = 0.0;
          goto LABEL_132;
        case 8:
          if (v33 < 60.0)
            break;
          v31 = v31 + 1.0;
          v32 = 4;
          v33 = 0.0;
          goto LABEL_132;
        default:
          if (v32 == 16)
          {
            if (v37 < 60.0)
              break;
            v33 = v33 + 1.0;
            v32 = 8;
            v37 = 0.0;
          }
          else if (v32 == 32)
          {
            if (v36 < 1000.0)
              break;
            v37 = v37 + 1.0;
            v32 = 16;
            v36 = 0.0;
          }
          else
          {
LABEL_125:
            v49 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
            v50 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *TSUDurationFormatterStringFromTimeIntervalWithFormatAndRoundingAndSingularOption(NSTimeInterval, NSString *, BOOL, BOOL)");
            v8 = v74;
            objc_msgSend(v49, "handleFailureInFunction:file:lineNumber:description:", v50, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDurationFormatter.m"), 1088, CFSTR("Unknown unit!"));
          }
LABEL_132:
          if (v48 == v32)
            break;
          continue;
      }
      break;
    }
  }
  if (v9)
  {
    v51 = 0;
    v52 = 0;
    v53 = 0;
    v78 = a2 ^ 1;
    v54 = v9;
    do
    {
      v55 = &v81[v51];
      v56 = *(_QWORD *)v55;
      v58 = *((_DWORD *)v55 + 2);
      v57 = *((_DWORD *)v55 + 3);
      v59 = 0;
      v60 = v29;
      switch(v58)
      {
        case 1:
          break;
        case 2:
          v59 = 0;
          v60 = v30;
          break;
        case 3:
        case 5:
        case 6:
        case 7:
          goto LABEL_140;
        case 4:
          v59 = 0;
          v60 = v31;
          break;
        case 8:
          v59 = 0;
          v60 = v33;
          break;
        default:
          if (v58 == 16)
          {
            v59 = 0;
            v60 = v37;
          }
          else if (v58 == 32)
          {
            v59 = 1;
            v60 = v36;
          }
          else
          {
LABEL_140:
            v61 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
            v62 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *TSUDurationFormatterStringFromTimeIntervalWithFormatAndRoundingAndSingularOption(NSTimeInterval, NSString *, BOOL, BOOL)");
            v8 = v74;
            objc_msgSend(v61, "handleFailureInFunction:file:lineNumber:description:", v62, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDurationFormatter.m"), 1125, CFSTR("Unknown duration unit!"));
            v59 = 0;
            v60 = 0.0;
          }
          break;
      }
      if ((v80 & (v60 == 0.0)) == 1 && v52 & 1 | (v51 + 1 != v54))
      {
        v63 = -1;
        ++v51;
      }
      else
      {
        if (a2)
          v64 = 0;
        else
          v64 = kTSUNumberFormatterDecimalPlacesAsManyAsNecessary;
        switch(v57)
        {
          case 0:
            if (v59)
              v65 = CFSTR("000");
            else
              v65 = CFSTR("0");
            goto LABEL_160;
          case 1:
            if (v59)
              v65 = CFSTR("000");
            else
              v65 = CFSTR("00");
LABEL_160:
            v67 = TSUNumberFormatterStringFromDoubleWithFormat(v65, v78, 0, v64, 0, 0, 0, v60);
            goto LABEL_163;
          case 2:
            v66 = TSUDurationSingularPluralFormatterUnitString(v58, 1, a3, v60);
            v67 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), TSUNumberFormatterStringFromDoubleWithFormat(CFSTR("0"), v78, 0, v64, 0, 0, 0, v60), v66);
            goto LABEL_163;
          case 3:
            v68 = v60;
            v69 = v58;
            v70 = 2;
            goto LABEL_162;
          case 4:
            v68 = v60;
            v69 = v58;
            v70 = 3;
LABEL_162:
            v72 = TSUDurationSingularPluralFormatterUnitString(v69, v70, a3, v68);
            v67 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), TSUNumberFormatterStringFromDoubleWithFormat(CFSTR("0"), v78, 0, v64, 0, 0, 0, v60), v72);
LABEL_163:
            v71 = v67;
            break;
          default:
            v71 = 0;
            break;
        }
        objc_msgSend(v8, "insertString:atIndex:", v71, v56 + v53);
        v63 = -[__CFString length](v71, "length");
        ++v51;
        v52 = 1;
      }
      v53 += v63;
    }
    while (v51 != v54);
  }
  if ((v80 & 1) != 0)
    return objc_msgSend(v8, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet"));
  else
    return (uint64_t)v8;
}

uint64_t TSUDurationUnroundedFormatterStringFromTimeIntervalWithFormat(void *a1, double a2)
{
  return TSUDurationFormatterStringFromTimeIntervalWithFormatAndRoundingAndSingularOption(a1, 0, 0, a2);
}

uint64_t TSUDurationFormatterMinDurationUnitInUnits(char a1)
{
  int v1;
  int v2;
  int v3;
  unsigned int v4;

  v1 = a1 & 1;
  if ((a1 & 2) != 0)
    v1 = 2;
  if ((a1 & 4) != 0)
    v2 = 4;
  else
    v2 = v1;
  if ((a1 & 8) != 0)
    v3 = 8;
  else
    v3 = v2;
  if ((a1 & 0x10) != 0)
    v4 = 16;
  else
    v4 = v3;
  if ((a1 & 0x20) != 0)
    return 32;
  else
    return v4;
}

uint64_t TSUDurationFormatterMaxDurationUnitInUnits(char a1)
{
  int v1;
  int v2;
  int v3;
  unsigned int v4;

  v1 = a1 & 0x20;
  if ((a1 & 0x10) != 0)
    v1 = 16;
  if ((a1 & 8) != 0)
    v2 = 8;
  else
    v2 = v1;
  if ((a1 & 4) != 0)
    v3 = 4;
  else
    v3 = v2;
  if ((a1 & 2) != 0)
    v4 = 2;
  else
    v4 = v3;
  if ((a1 & 1) != 0)
    return 1;
  else
    return v4;
}

uint64_t TSUDurationFormatterDurationUnitsInFormat(void *a1)
{
  unsigned int v2;

  v2 = 0;
  TSUDurationFormatterGetFormatInfo(a1, &v2, 0);
  return v2;
}

uint64_t TSUDurationFormatterGetFormatInfo(void *a1, _DWORD *a2, int *a3)
{
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;

  TSUDurationFormatterInitializeConstantSets();
  if (a2)
    *a2 = 0;
  result = objc_msgSend(a1, "length");
  if (result)
  {
    v7 = result;
    v8 = 0;
    while (1)
    {
      result = objc_msgSend(a1, "characterAtIndex:", v8);
      v9 = result;
      v10 = v8 + 1;
      if (v8 + 1 < v7)
        break;
      if ((_DWORD)result == 39)
        goto LABEL_31;
      result = objc_msgSend((id)sSpecialDurationFormatCharacters, "characterIsMember:", result);
      ++v8;
      if ((result & 1) != 0)
        goto LABEL_25;
LABEL_44:
      if (v8 >= v7)
        return result;
    }
    result = objc_msgSend(a1, "characterAtIndex:", v8 + 1);
    if ((_DWORD)v9 == 39)
    {
      if ((_DWORD)result == 39)
      {
        v8 += 2;
      }
      else
      {
        do
        {
          result = objc_msgSend(a1, "characterAtIndex:", v10);
          v11 = result;
          v8 = v10 + 1;
          if (v10 + 1 >= v7)
          {
            if ((_DWORD)result == 39)
              goto LABEL_44;
          }
          else
          {
            result = objc_msgSend(a1, "characterAtIndex:", v10 + 1);
            if (v11 == 39)
            {
              if ((_DWORD)result != 39)
                goto LABEL_44;
              v8 = v10 + 2;
            }
          }
          v10 = v8;
        }
        while (v8 < v7);
      }
      goto LABEL_44;
    }
    result = objc_msgSend((id)sSpecialDurationFormatCharacters, "characterIsMember:", v9);
    if ((result & 1) != 0)
    {
      v12 = v7 - v8;
      v13 = 1;
      while (1)
      {
        result = objc_msgSend(a1, "characterAtIndex:", v10);
        if ((_DWORD)result != (_DWORD)v9)
          break;
        ++v13;
        if (v7 == ++v10)
        {
          v10 = v7;
          v13 = v12;
          break;
        }
      }
      if ((v13 - 1) < 2)
      {
LABEL_25:
        if (a3)
        {
          v14 = 0;
          goto LABEL_27;
        }
LABEL_28:
        v8 = v10;
        v15 = 0;
        switch((int)v9)
        {
          case 'd':
            v15 = 2;
            if (a2)
              goto LABEL_43;
            goto LABEL_44;
          case 'e':
          case 'g':
          case 'i':
          case 'j':
          case 'k':
          case 'l':
            goto LABEL_42;
          case 'f':
            v15 = 32;
            if (!a2)
              goto LABEL_44;
            goto LABEL_43;
          case 'h':
            v15 = 4;
LABEL_42:
            if (a2)
              goto LABEL_43;
            goto LABEL_44;
          case 'm':
            v15 = 8;
            if (!a2)
              goto LABEL_44;
            goto LABEL_43;
          default:
            v15 = v9 == 119;
            if ((_DWORD)v9 == 115)
              v15 = 16;
            if (!a2)
              goto LABEL_44;
LABEL_43:
            *a2 |= v15;
            break;
        }
        goto LABEL_44;
      }
      if (v13 == 3)
      {
        if (!a3)
          goto LABEL_28;
        v14 = 1;
      }
      else
      {
        if (!a3)
          goto LABEL_28;
        v14 = 2;
      }
LABEL_27:
      *a3 = v14;
      goto LABEL_28;
    }
LABEL_31:
    ++v8;
    goto LABEL_44;
  }
  return result;
}

uint64_t TSUDurationFormatterDurationUnitCountInUnits(unsigned int a1)
{
  return (unsigned __int16)(vaddv_s16((int16x4_t)vand_s8((int8x8_t)vshl_u16((uint16x4_t)vdup_n_s16(a1), (uint16x4_t)0xFFFCFFFDFFFEFFFFLL), (int8x8_t)0x1000100010001))+ (a1 & 1)+ ((a1 >> 5) & 1));
}

void *TSUDurationFormatterFormatFromDurationUnits(unsigned int a1, unsigned int a2, int a3)
{
  void *v6;
  int16x4_t v7;
  unsigned __int32 v8;
  int v9;
  unsigned __int32 v10;
  id v11;
  uint64_t v12;
  unsigned __int32 v13;
  int v14;
  int v16;
  BOOL v17;
  __int16 v18;
  int v19;
  const __CFString *v20;
  __int16 v21;
  BOOL v22;
  const __CFString *v23;

  v6 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v7 = (int16x4_t)vand_s8((int8x8_t)vshl_u16((uint16x4_t)vdup_n_s16(a1), (uint16x4_t)0xFFFCFFFDFFFEFFFFLL), (int8x8_t)0x1000100010001);
  v7.i16[0] = vaddv_s16(v7);
  v8 = v7.i32[0] + (a1 & 1) + ((a1 >> 5) & 1);
  if (v7.i16[0] + (a1 & 1) + ((a1 >> 5) & 1))
  {
    if ((a1 & 1) == 0)
    {
LABEL_3:
      if ((a1 & 2) == 0)
      {
        v9 = 0;
        v10 = v8;
        if ((a1 & 4) != 0)
          goto LABEL_26;
        goto LABEL_22;
      }
      v14 = 1;
      v13 = v8;
      goto LABEL_18;
    }
  }
  else
  {
    v11 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *TSUDurationFormatterFormatFromDurationUnits(TSUDurationUnits, TSUDurationStyle, BOOL)");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDurationFormatter.m"), 1358, CFSTR("No units passed to TSUDurationFormatterFormatFromDurationUnits()!"));
    if ((a1 & 1) == 0)
      goto LABEL_3;
  }
  if (a2 <= 3)
    objc_msgSend(v6, "appendString:", off_24D61ACE0[a2]);
  v13 = v8 - 1;
  if ((a1 & 2) != 0)
  {
    v14 = 1;
  }
  else
  {
    v14 = 0;
    if ((_WORD)v8 == 1 && a3 == 0)
    {
      v10 = 0;
      goto LABEL_21;
    }
  }
LABEL_18:
  if (a2 <= 3)
    objc_msgSend(v6, "appendString:", off_24D61AD00[a2]);
  v10 = v13 - v14;
LABEL_21:
  v9 = 1;
  if ((a1 & 4) != 0)
    goto LABEL_26;
LABEL_22:
  if ((_WORD)v10)
    v16 = 1;
  else
    v16 = a3;
  if ((v9 & v16) != 1)
  {
    if ((a1 & 8) == 0)
    {
      if (!v9)
      {
        if ((a1 & 0x10) == 0)
        {
          v19 = 0;
          goto LABEL_63;
        }
        goto LABEL_44;
      }
      goto LABEL_29;
    }
LABEL_38:
    v18 = 1;
    goto LABEL_39;
  }
LABEL_26:
  if (a2 < 4)
    objc_msgSend(v6, "appendString:", off_24D61AD20[a2]);
  v10 -= (a1 & 4) >> 2;
  if ((a1 & 8) != 0)
    goto LABEL_38;
LABEL_29:
  if ((_WORD)v10)
    v17 = 0;
  else
    v17 = a3 == 0;
  if (v17)
  {
    LOWORD(v10) = 0;
    if ((a1 & 0x10) == 0)
      goto LABEL_49;
LABEL_44:
    v21 = 1;
LABEL_53:
    v23 = CFSTR("sss ");
    switch(a2)
    {
      case 0u:
        if ((v8 & 0xFFFE) != 0)
          v23 = CFSTR("ss:");
        else
          v23 = CFSTR("s:");
        goto LABEL_60;
      case 1u:
        goto LABEL_60;
      case 2u:
        v23 = CFSTR("ssss ");
        goto LABEL_60;
      case 3u:
        v23 = CFSTR("ssssss ");
LABEL_60:
        objc_msgSend(v6, "appendString:", v23);
        break;
      default:
        break;
    }
    LOWORD(v10) = v10 - v21;
    goto LABEL_62;
  }
  v18 = 0;
LABEL_39:
  v20 = CFSTR("mmm ");
  switch(a2)
  {
    case 0u:
      if ((v8 & 0xFFFE) != 0)
        v20 = CFSTR("mm:");
      else
        v20 = CFSTR("m:");
      goto LABEL_47;
    case 1u:
      goto LABEL_47;
    case 2u:
      v20 = CFSTR("mmmm ");
      goto LABEL_47;
    case 3u:
      v20 = CFSTR("mmmmmm ");
LABEL_47:
      objc_msgSend(v6, "appendString:", v20);
      break;
    default:
      break;
  }
  LOWORD(v10) = v10 - v18;
  if ((a1 & 0x10) != 0)
    goto LABEL_44;
LABEL_49:
  v21 = 0;
  if ((_WORD)v10)
    v22 = 0;
  else
    v22 = a3 == 0;
  if (!v22)
    goto LABEL_53;
  LOWORD(v10) = 0;
LABEL_62:
  v19 = 1;
LABEL_63:
  if (!(_WORD)v10)
    v19 = 0;
  if ((v19 | ((a1 & 0x20) >> 5)) == 1 && a2 <= 3)
    objc_msgSend(v6, "appendString:", off_24D61AD40[a2]);
  if (objc_msgSend(v6, "length"))
    objc_msgSend(v6, "deleteCharactersInRange:", objc_msgSend(v6, "length") - 1, 1);
  return v6;
}

uint64_t TSUDurationFormatterDurationUnitsNecessaryToFullyDisplayDuration(uint64_t result, int a2, double a3)
{
  double v3;
  int v4;
  uint64_t v5;
  int v6;
  double v7;
  double v8;
  int v9;
  unsigned int v10;
  id v11;
  uint64_t v12;

  if (a3 == 0.0)
    return result;
  v3 = fabs(a3);
  v4 = result;
  while (2)
  {
    v5 = v4 | result;
    v6 = 2;
    v7 = 604800.0;
    switch(v4)
    {
      case 1:
        goto LABEL_9;
      case 2:
        v6 = 4;
        v7 = 86400.0;
        goto LABEL_9;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_18;
      case 4:
        v6 = 8;
        v7 = 3600.0;
        goto LABEL_9;
      case 8:
        v6 = 16;
        v7 = 60.0;
        goto LABEL_9;
      default:
        if (v4 == 16)
        {
          v7 = 1.0;
          v6 = 32;
LABEL_9:
          v8 = floor(v3 / v7);
          v3 = v3 - v8 * v7;
          if (v8 == 0.0)
            v9 = a2;
          else
            v9 = 1;
          v10 = result & ~v4;
          if (v9)
            result = v5;
          else
            result = v10;
          v4 = v6;
          if (v3 <= 0.0)
            return result;
          continue;
        }
        if (v4 != 32)
        {
LABEL_18:
          v11 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", v3, 604800.0, 86400.0, 3600.0, 604800.0);
          v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "TSUDurationUnits TSUDurationFormatterDurationUnitsNecessaryToFullyDisplayDuration(NSTimeInterval, TSUDurationUnits, BOOL)");
          objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDurationFormatter.m"), 1521, CFSTR("Unknown duration unit!"));
        }
        return v5;
    }
  }
}

double TSUDurationFormatterSecondsInDurationUnit(char a1)
{
  double result;
  id v2;
  uint64_t v3;

  if ((a1 & 1) != 0)
    return 604800.0;
  if ((a1 & 2) != 0)
    return 86400.0;
  if ((a1 & 4) != 0)
    return 3600.0;
  if ((a1 & 8) != 0)
    return 60.0;
  result = 1.0;
  if ((a1 & 0x10) == 0)
  {
    if ((a1 & 0x20) != 0)
    {
      return 0.001;
    }
    else
    {
      v2 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", 1.0);
      v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "double TSUDurationFormatterSecondsInDurationUnit(TSUDurationUnits)");
      objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDurationFormatter.m"), 1584, CFSTR("Unknown duration unit in TSUDurationFormatterSecondsInDurationUnit!"));
      return -1.0;
    }
  }
  return result;
}

void sub_216D5878C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t TSURegisterLocaleChangeObserver(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = objc_msgSend(v2, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x24BDBD3F0], 0, 0, a1);
  v4 = objc_msgSend(v2, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x24BDBCA70], 0, 0, a1);
  return objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v3, v4, 0);
}

uint64_t TSURemoveLocaleChangeObserver(void *a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  result = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(a1);
        objc_msgSend(v2, "removeObserver:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      result = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

uint64_t TSUGetCurrentLocale()
{
  return objc_msgSend(+[TSUSharedLocale sharedLocale](TSUSharedLocale, "sharedLocale"), "currentLocale");
}

uint64_t TSUIsLocaleISO(const __CFLocale *a1)
{
  void *Value;

  Value = (void *)CFLocaleGetValue(a1, (CFLocaleKey)*MEMORY[0x24BDBD3D8]);
  if ((objc_msgSend(Value, "isEqualToString:", CFSTR("US")) & 1) != 0)
    return 0;
  else
    return objc_msgSend(Value, "isEqualToString:", CFSTR("CA")) ^ 1;
}

__CFString *TSUNumberFormatStringFromDouble(int a1, unsigned __int16 a2, unsigned __int16 a3, int a4, __CFString *a5, __CFString *a6, uint64_t a7, void *a8, double a9, double a10, void *a11, uint64_t a12, unsigned __int8 a13, char a14, unsigned __int16 a15, unsigned __int16 a16, unsigned __int8 a17, char a18, __int16 a19, unsigned __int8 a20,unsigned __int16 a21,unsigned __int8 a22,unsigned int a23)
{
  double v29;
  double v30;
  __CFString *v31;
  double v32;
  int v33;
  unsigned int v34;
  uint64_t v35;
  int v36;
  __CFString *v37;
  int v38;
  int v40;
  __CFString *v41;
  uint64_t v42;
  void *v43;
  double v44;
  double v45;
  __CFString *v46;
  double v47;
  unint64_t v48;
  unint64_t v49;
  int v50;
  unint64_t v51;
  void *v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v56;
  uint64_t v57;
  int v58;
  uint64_t v59;
  unint64_t v60;
  unsigned int v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unsigned int v65;
  int v66;
  BOOL v67;
  int v68;
  uint64_t v69;
  int64_t v70;
  int64_t v71;
  __CFString *v72;
  __CFString *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  int v79;
  int v80;
  unsigned int v81;
  uint64_t v82;
  unint64_t v83;
  __CFString *v84;
  double v85;
  id v86;
  uint64_t v87;
  id v88;
  TSUNumberFormat *v89;
  double v90;
  int v91;
  int v92;
  int v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v99;
  __CFString *v100;

  v29 = a9;
  if (__fpclassifyd(a9) == 3)
    v29 = 0.0;
  if ((a7 & 1) == 0)
  {
    a3 = TSUNumberOfDecimalPlacesInValue(v29);
    a2 = a3;
  }
  v30 = v29 * a10;
  if (a14)
  {
    v31 = CFSTR("#,##0");
    v32 = v30;
    v33 = 1;
    v34 = 2;
    v35 = 2;
    v36 = 1;
LABEL_7:
    v37 = 0;
    v38 = 0;
    return TSUNumberFormatterStringFromDoubleWithFormat(v31, v33, v34, v35, v36, v37, v38, v32);
  }
  v40 = a15 ^ 1;
  if ((v40 & 1) == 0 && (a15 & 0x100) == 0)
    return (__CFString *)TSUNumberFormatterStringByUnescapingFormatString(a5);
  v38 = a4 | a13;
  if (BYTE1(a12) | a12 || (a16 & HIBYTE(a16) & 1) != 0 || a8)
  {
    v44 = trunc(v30);
    if ((a16 & HIBYTE(a16)) != 0)
      v45 = v44;
    else
      v45 = v30;
    v46 = TSUNumberFormatterStringFromDoubleWithFormat(a5, v40, a3, a2, a17, a6, v38, v45);
    if (BYTE1(a12) | a12)
    {
      v47 = fabs(v45);
      v48 = HIWORD(a12);
      if (v47 >= 1.0)
        v49 = (unint64_t)log10(v47) + 1;
      else
        v49 = 0;
      v50 = (a16 & HIBYTE(a16));
      if (v49 <= BYTE2(a12))
        v51 = BYTE2(a12);
      else
        v51 = v49;
      if ((uint64_t)(a12 - v51) >= 1)
      {
        v52 = (void *)-[__CFString mutableCopy](v46, "mutableCopy");
        v53 = TSUNumberOfDecimalPlacesInValue(v30);
        v54 = -[__CFString length](v46, "length");
        if (BYTE5(a12) == BYTE4(a12) && v53 == 0)
          v56 = v54 + ~(v51 + HIWORD(a12)) + 1;
        else
          v56 = v54 + ~(v51 + HIWORD(a12));
        v57 = v53 - (BYTE5(a12) - BYTE4(a12));
        if (v57 <= 0)
          v58 = BYTE4(a12);
        else
          v58 = BYTE4(a12) - (_DWORD)v57;
        v59 = v56 + v58;
        if (v53 < BYTE5(a12))
          v60 = v59;
        else
          v60 = v54 + ~(v51 + HIWORD(a12));
        if (a17 && (v61 = TSUNumberFormatterGroupingSizeForLocale(0)) != 0)
        {
          v62 = vcvtpd_s64_f64((double)v51 / (double)v61);
          if (v62 <= 1)
            v62 = 1;
          v63 = v62 - 1;
        }
        else
        {
          v63 = 0;
        }
        v64 = v60 - v63;
        if (v64 >= 0)
        {
          v65 = 0;
          do
          {
            if (v64 >= (int)objc_msgSend(v52, "length"))
              break;
            v66 = objc_msgSend(v52, "characterAtIndex:", v64);
            if (v66 == 48)
              ++v65;
            if ((v66 - 58) <= 0xFFFFFFF6)
              objc_msgSend(v52, "replaceCharactersInRange:withString:", v64, 1, CFSTR(" "));
            if ((uint64_t)(a12 - v51) <= v65)
              break;
            v67 = v64-- <= 0;
          }
          while (!v67);
        }
        v68 = BYTE1(a12) - BYTE3(a12);
        if (BYTE1(a12) <= (int)BYTE3(a12))
          goto LABEL_74;
        if (v52)
        {
LABEL_69:
          v69 = -[__CFString length](v46, "length");
          v70 = BYTE3(a12) - (unint64_t)HIWORD(a12) + v69 + 1;
          if (v70 + v68 <= -[__CFString length](v46, "length"))
          {
            v71 = v69 + v68 + BYTE3(a12) - HIWORD(a12);
            do
            {
              if (objc_msgSend(v52, "characterAtIndex:", v71) != 48)
                break;
              objc_msgSend(v52, "replaceCharactersInRange:withString:", v71, 1, CFSTR(" "));
              v67 = v71-- <= v70;
            }
            while (!v67);
          }
LABEL_74:
          v50 = (a16 & HIBYTE(a16));
          v41 = v46;
          if (v52)
          {
            v72 = v52;
            v50 = (a16 & HIBYTE(a16));
            v41 = v72;
          }
          goto LABEL_76;
        }
LABEL_68:
        v52 = (void *)-[__CFString mutableCopy](v46, "mutableCopy");
        goto LABEL_69;
      }
      v68 = BYTE1(a12) - BYTE3(a12);
      v41 = v46;
      if (v68 >= 1)
        goto LABEL_68;
    }
    else
    {
      v41 = 0;
      v48 = HIWORD(a12);
      v50 = (a16 & HIBYTE(a16));
    }
LABEL_76:
    if (a8)
    {
      v100 = v46;
      if (v41)
        v73 = v41;
      else
        v73 = v46;
      v41 = (__CFString *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
      v99 = (void *)objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
      v74 = -[__CFString length](v73, "length");
      v75 = objc_msgSend(a11, "firstIndex");
      if (v74 - 1 < 0)
      {
        v79 = 0;
      }
      else
      {
        v76 = v75;
        v77 = v48;
        v78 = 0;
        v79 = 0;
        v80 = 0;
        do
        {
          if (v76 == v80 && v76 != 0x7FFFFFFFFFFFFFFFLL)
          {
            -[__CFString insertString:atIndex:](v41, "insertString:atIndex:", objc_msgSend(a8, "objectAtIndex:", v79), 0);
            v76 = objc_msgSend(a11, "indexGreaterThanIndex:", v76);
            ++v79;
          }
          v81 = -[__CFString characterAtIndex:](v73, "characterAtIndex:", --v74);
          v82 = -[__CFString characterAtIndex:](v100, "characterAtIndex:", v74);
          -[__CFString insertString:atIndex:](v41, "insertString:atIndex:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C"), v81), 0);
          if (v78 >= v77)
            v80 += objc_msgSend(v99, "characterIsMember:", v82);
          ++v78;
        }
        while (v74 > 0);
      }
      if (v79 >= (int)objc_msgSend(a8, "count"))
      {
        v50 = (a16 & HIBYTE(a16));
        v46 = v100;
      }
      else
      {
        v46 = v100;
        if (objc_msgSend(a8, "count") > (unint64_t)v79)
        {
          v83 = v79;
          do
            -[__CFString insertString:atIndex:](v41, "insertString:atIndex:", objc_msgSend(a8, "objectAtIndex:", v83++), 0);
          while (v83 < objc_msgSend(a8, "count"));
        }
        v50 = (a16 & HIBYTE(a16));
      }
    }
    if (!v50)
      return v41;
    if (v41)
      v84 = v41;
    else
      v84 = v46;
    v41 = (__CFString *)(id)-[__CFString mutableCopy](v84, "mutableCopy");
    v85 = fabs(v30);
    v42 = TSUNumberFormatFractionStringFromDouble(a23, v85 - floor(v85));
    v43 = (void *)MEMORY[0x24BDD17C8];
    goto LABEL_101;
  }
  if (HIBYTE(a16) && (a16 & 1) == 0)
  {
    v41 = (__CFString *)(id)objc_msgSend(TSUNumberFormatterStringByUnescapingFormatString(a5), "mutableCopy");
    if (a6)
      -[__CFString replaceOccurrencesOfString:withString:options:range:](v41, "replaceOccurrencesOfString:withString:options:range:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C"), 164), +[TSUNumberFormatter currencySymbolForCurrencyCode:](TSUNumberFormatter, "currencySymbolForCurrencyCode:", a6), 0, 0, -[__CFString length](v41, "length"));
    v42 = TSUNumberFormatFractionStringFromDouble(a23, v30);
    v43 = (void *)MEMORY[0x24BDD17C8];
LABEL_101:
    -[__CFString replaceOccurrencesOfString:withString:options:range:](v41, "replaceOccurrencesOfString:withString:options:range:", objc_msgSend(v43, "stringWithFormat:", CFSTR("%C"), (unsigned __int16)TSUCustomNumberFormatFractionReplacementCharacter), v42, 0, 0, -[__CFString length](v41, "length"));
    return v41;
  }
  if (a1 == 1)
  {
    if ((a18 & 1) == 0)
      goto LABEL_113;
    v86 = +[TSUNumberFormatter defaultFormatStringForValueType:negativeStyle:](TSUNumberFormatter, "defaultFormatStringForValueType:negativeStyle:", 0, 2);
    BYTE6(v96) = a22;
    WORD2(v96) = a21;
    BYTE2(v96) = a20;
    LOWORD(v96) = a19;
    HIBYTE(v95) = 1;
    BYTE6(v95) = a17;
    *(_DWORD *)((char *)&v95 + 2) = __PAIR32__(a16, a15);
    LOWORD(v95) = a13;
    v87 = TSUNumberFormatStringFromDouble(0, a2, a3, 0, v86, a6, a7, 0, v30, a10, a11, a12, v95, v96, a23);

    v88 = +[TSUNumberFormatter currencySymbolForCurrencyCode:](TSUNumberFormatter, "currencySymbolForCurrencyCode:", a6);
    return (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\t%@"), v88, v87);
  }
  else
  {
    if (a1 != 5)
    {
      if (a1 == 4)
        return (__CFString *)TSUNumberFormatFractionStringFromDouble(a23, v30);
      if (!a1)
      {
        if ((_BYTE)a19)
        {
          if ((a15 & 1) == 0)
          {
            v90 = fabs(v30);
            if (v90 > 1.0e12 || v90 < 0.0000001 && (v91 = __fpclassifyd(v30), v38 = a4 | a13, v91 != 3))
            {
              v31 = CFSTR("0E0");
              v32 = v30;
              v33 = 1;
              v34 = 0;
              v35 = 5;
              v36 = 0;
              goto LABEL_7;
            }
          }
        }
      }
LABEL_113:
      if (HIBYTE(a19) && (a15 & 1) == 0 && (v92 = v38, v93 = __fpclassifyd(v30), v38 = v92, v93 == 3))
      {
        v32 = v30;
        v31 = a5;
        v33 = 1;
        v34 = 0;
        v35 = 0;
      }
      else
      {
        v34 = a3;
        v35 = a2;
        v32 = v30;
        v31 = a5;
        v33 = a15 ^ 1;
      }
      v36 = a17;
      v37 = a6;
      return TSUNumberFormatterStringFromDoubleWithFormat(v31, v33, v34, v35, v36, v37, v38, v32);
    }
    v41 = (__CFString *)TSUNumberFormatBaseStringFromDouble(a20, a21, a22, v30);
    if (v41)
      return v41;
    HIDWORD(v94) = -3;
    LOBYTE(v94) = 1;
    v89 = +[TSUNumberFormat numberFormatWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:](TSUNumberFormat, "numberFormatWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:", 0, 0, 0, 0, 0, 0, v94);
    -[TSUNumberFormat setUseScientificFormattingAutomatically:](v89, "setUseScientificFormattingAutomatically:", 1);
    return (__CFString *)-[TSUNumberFormat stringFromDouble:](v89, "stringFromDouble:", v30);
  }
}

uint64_t TSUNumberFormatFractionStringFromDouble(unsigned int a1, double a2)
{
  double v2;
  double v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v20;
  uint64_t v21;

  v2 = fabs(a2);
  if (a2 >= 0.0)
    v3 = a2;
  else
    v3 = v2;
  if (a1 <= 0xFFFFFFFC)
  {
    v4 = (int)a1;
    v5 = (int)a1;
  }
  else
  {
    v4 = qword_216DA5CA0[a1 + 3];
    v5 = 2;
  }
  v6 = 0;
  v7 = 0;
  v8 = floor(v3);
  v9 = v3 - v8;
  v10 = v4 + 1;
  v11 = 1.79769313e308;
  do
  {
    v12 = v9 * (double)v5;
    v13 = vabdd_f64(v9, round(v12) / (double)v5);
    v14 = llround(v12);
    if (v13 < v11)
    {
      v7 = v14;
      v6 = v5;
      v11 = v13;
    }
    ++v5;
  }
  while (v10 != v5);
  if (a1 >= 0xFFFFFFFD)
  {
    v15 = v6;
    if (v7)
    {
      v16 = v7;
      v17 = v6;
      do
      {
        v15 = v16;
        v16 = v17 % v16;
        v17 = v15;
      }
      while (v16);
    }
    if (v15 >= 2)
    {
      v7 /= v15;
      v6 /= v15;
    }
  }
  if (v7 == v6)
  {
    v7 = 0;
    v8 = v8 + 1.0;
  }
  if (v8 == 0.0)
  {
    if (a2 < 0.0)
      v7 = -v7;
    if (v7)
      return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld/%ld"), v7, v6, v21);
    else
      return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("0"));
  }
  else
  {
    if (a2 >= 0.0)
      v18 = v8;
    else
      v18 = -v8;
    if (v7)
      return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.0f %ld/%ld"), *(_QWORD *)&v18, v7, v6);
    else
      return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.0f"), *(_QWORD *)&v18, v20, v21);
  }
}

void *TSUNumberFormatBaseStringFromDouble(uint64_t a1, unsigned int a2, int a3, double a4)
{
  id v8;
  uint64_t v9;
  void *v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unsigned __int16 v26;
  int v27;
  __int16 v28;
  signed int v29;
  int v30;
  uint64_t v31;
  int v32;

  if ((a1 - 1) >= 0x24)
  {
    v8 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *TSUNumberFormatBaseStringFromDouble(double, UInt8, UInt16, BOOL)");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUNumberFormat.m"), 1797, CFSTR("Trying to format a baseFormat cell with an illegal base number"));
  }
  if (a4 > 9.22337204e18 || a4 < -9.22337204e18)
    return 0;
  v12 = rint(a4);
  v13 = (uint64_t)v12;
  if ((uint64_t)v12 >= 0)
    v14 = (uint64_t)v12;
  else
    v14 = -v13;
  if ((uint64_t)v12 < 0)
    v15 = a3;
  else
    v15 = 0;
  if (v13 < 0 && (a3 & 1) == 0)
  {
    if (a1 > 0x10 || ((1 << a1) & 0x10104) == 0)
    {
      v16 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
      v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *TSUNumberFormatBaseStringFromDouble(double, UInt8, UInt16, BOOL)");
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUNumberFormat.m"), 1817, CFSTR("Trying to display two's-complement for unsupported base %d"), a1);
    }
    if ((unint64_t)v14 >= 0x80000001)
    {
      v18 = -32;
      v19 = 0x80000000;
      while (v18 != -50)
      {
        v20 = 2 * v19;
        --v18;
        v21 = v14 > (unint64_t)(2 * v19);
        v19 *= 2;
        if (!v21)
        {
          v22 = -v18;
          goto LABEL_26;
        }
      }
      return 0;
    }
    v20 = 0x80000000;
    v22 = 32;
LABEL_26:
    v14 = 2 * v20 - v14;
    LODWORD(v23) = (int)(log2((double)a1) * (double)a2);
    v23 = (int)v23 <= 32 ? 32 : v23;
    v21 = v23 > v22;
    v24 = v23 - v22;
    if (v21)
    {
      while (v20 <= 500000000000000)
      {
        v14 += 2 * v20;
        v20 *= 2;
        if (!--v24)
          goto LABEL_33;
      }
      return 0;
    }
  }
LABEL_33:
  v11 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v25 = 1;
  do
  {
    if ((_DWORD)a1 == 26)
    {
      v26 = v14 / v25 % 26 + 65;
    }
    else if ((_DWORD)a1 == 1)
    {
      v26 = 49;
    }
    else
    {
      v27 = v14 / v25 % a1;
      if (v27 <= 9)
        v28 = 48;
      else
        v28 = 55;
      v26 = v28 + v27;
    }
    objc_msgSend(v11, "tsu_insertCharacter:atIndex:", v26, 0);
    v25 = ((_DWORD)a1 == 1) + v25 * a1;
  }
  while (v25 && v14 / v25 > 0);
  if (a2)
  {
    v29 = (a2 - objc_msgSend(v11, "length")) << 24;
    if (v29 >= 1)
    {
      v30 = v29 >> 24;
      if ((_DWORD)a1 == 26)
        v31 = 65;
      else
        v31 = 48;
      if (v30 <= 1)
        v32 = 1;
      else
        v32 = v30;
      do
      {
        objc_msgSend(v11, "tsu_insertCharacter:atIndex:", v31, 0);
        --v32;
      }
      while (v32);
    }
  }
  if ((v13 & 0x8000000000000000) == 0
    && (a3 & 1) == 0
    && v14 >= 0x80000000
    && objc_msgSend(v11, "characterAtIndex:", 0) != 48)
  {
    objc_msgSend(v11, "tsu_insertCharacter:atIndex:", 48, 0);
  }
  if (v15)
    objc_msgSend(v11, "tsu_insertCharacter:atIndex:", 45, 0);
  return v11;
}

void *TSUNumberFormatCustomNumberFormatTokensFromTSUCustomFormatData(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  unsigned int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  unint64_t v21;
  int v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  unsigned int v33;
  unsigned int v34;
  int v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  int v40;
  uint64_t v41;
  int v42;
  int v43;
  int v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  BOOL v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  _BOOL4 v60;
  uint64_t v61;
  uint64_t v62;
  unsigned int v63;
  uint64_t v64;
  BOOL v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  _BOOL4 v69;
  uint64_t v70;
  unsigned int v71;
  BOOL v72;
  int v73;
  uint64_t v74;
  uint64_t v75;
  _BOOL4 v76;
  uint64_t v77;
  uint64_t v78;
  double v79;
  uint64_t v80;
  int v82;
  int v83;
  int v84;
  int v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  char v90;
  void *v91;
  uint64_t v92;

  if (a2 != 270)
  {
    if (a2 != 271)
      return 0;
    v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v5 = *(void **)(a1 + 8);
    v6 = objc_msgSend(v5, "length");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        v9 = objc_msgSend(v5, "characterAtIndex:", i);
        if (v9 == (unsigned __int16)TSUCustomNumberFormatTextReplacementCharacter)
        {
          if (objc_msgSend(v4, "length"))
            objc_msgSend(v3, "addObject:", v4);
          objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x24BDD16A8], "customNumberFormatTokenStringOfType:content:", 5, CFSTR("@")));
          v4 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
        }
        else
        {
          objc_msgSend(v4, "appendFormat:", CFSTR("%C"), v9);
        }
      }
    }
    if (objc_msgSend(v4, "length"))
    {
      v10 = v3;
      v11 = (uint64_t)v4;
LABEL_181:
      objc_msgSend(v10, "addObject:", v11);
      return v3;
    }
    return v3;
  }
  v12 = objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("+-,#@0123456789"));
  v13 = objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("#@0123456789"));
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v14 = *(void **)(a1 + 8);
  v15 = objc_msgSend(v14, "length");
  v16 = 0x24BDD1000uLL;
  if (v15)
  {
    v17 = v15;
    v86 = (void *)v13;
    v88 = (void *)v12;
    v18 = 0;
    v19 = 0;
    v90 = 0;
    v92 = a1;
    while (1)
    {
      v20 = objc_msgSend(v14, "characterAtIndex:", v18);
      v21 = v18 + 1;
      v22 = v18 + 1 >= v17 ? 0 : objc_msgSend(v14, "characterAtIndex:", v18 + 1);
      if ((_DWORD)v20 != 46)
        break;
      v19 = 1;
LABEL_50:
      v18 = v21;
      if (v21 >= v17)
        goto LABEL_165;
    }
    if ((_DWORD)v20 == 39)
    {
      v23 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
      v24 = v23;
      if (v22 == 39)
      {
        objc_msgSend(v23, "appendString:", CFSTR("'"));
        v25 = v18 + 2;
LABEL_43:
        if (objc_msgSend(v24, "length"))
          objc_msgSend(v3, "addObject:", v24);
        v21 = v25;
        goto LABEL_50;
      }
      v25 = v18 + 1;
      if (v21 >= v17)
        goto LABEL_43;
      while (2)
      {
        v33 = objc_msgSend(v14, "characterAtIndex:", v21);
        v34 = v33;
        v25 = v21 + 1;
        if (v21 + 1 >= v17)
        {
          if (v33 == 39)
            goto LABEL_43;
        }
        else
        {
          v35 = objc_msgSend(v14, "characterAtIndex:", v21 + 1);
          if (v34 == 39)
          {
            if (v35 != 39)
              goto LABEL_43;
            objc_msgSend(v24, "appendString:", CFSTR("'"));
            v25 = v21 + 2;
LABEL_42:
            v21 = v25;
            if (v25 >= v17)
              goto LABEL_43;
            continue;
          }
        }
        break;
      }
      objc_msgSend(v24, "appendFormat:", CFSTR("%C"), v34);
      goto LABEL_42;
    }
    if ((_DWORD)v20 == (unsigned __int16)TSUCustomNumberFormatSpaceNarrowCharacter
      || (_DWORD)v20 == (unsigned __int16)TSUCustomNumberFormatSpaceNormalCharacter
      || (_DWORD)v20 == (unsigned __int16)TSUCustomNumberFormatSpaceWideCharacter
      || (_DWORD)v20 == (unsigned __int16)TSUCustomNumberFormatSpaceFlexibleCharacter)
    {
      v29 = (void *)MEMORY[0x24BDD16A8];
      v30 = objc_msgSend(*(id *)(v16 + 1992), "stringWithFormat:", CFSTR("%C"), v20);
      v31 = v29;
      v32 = 4;
    }
    else if ((_DWORD)v20 == (unsigned __int16)TSUCustomNumberFormatFractionReplacementCharacter)
    {
      v36 = (void *)MEMORY[0x24BDD16A8];
      v30 = objc_msgSend(*(id *)(v16 + 1992), "stringWithFormat:", CFSTR("%d"), *(char *)(a1 + 48));
      v31 = v36;
      v32 = 6;
    }
    else
    {
      v38 = (v20 - 37);
      if (v38 <= 0x2F)
      {
        if (((1 << (v20 - 37)) & 0x814060000001) != 0)
        {
          objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x24BDD16A8], "customNumberFormatTokenStringOfType:content:", 0, objc_msgSend(*(id *)(v16 + 1992), "stringWithFormat:", CFSTR("%C%C"), v20, v20)));
LABEL_55:
          v90 = 1;
          goto LABEL_50;
        }
        if (v38 == 32)
        {
          objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x24BDD16A8], "customNumberFormatTokenStringOfType:content:", 0, objc_msgSend(*(id *)(v16 + 1992), "stringWithFormat:", CFSTR("%C"), 69)));
          if (v21 < v17)
          {
            while (objc_msgSend(v88, "characterIsMember:", objc_msgSend(v14, "characterAtIndex:", v21)))
            {
              if (v17 == ++v21)
                return v3;
            }
          }
          goto LABEL_55;
        }
      }
      if ((_DWORD)v20 != 164)
      {
        if (objc_msgSend(v88, "characterIsMember:", v20))
        {
          if ((v19 & 1) != 0)
          {
            if (v18 >= v17)
            {
              v40 = 0;
              v39 = 0;
            }
            else
            {
              v39 = 0;
              v40 = 0;
              while (1)
              {
                v41 = objc_msgSend(v14, "characterAtIndex:", v18);
                if (!objc_msgSend(v88, "characterIsMember:", v41))
                  break;
                v42 = objc_msgSend(v86, "characterIsMember:", v41);
                v40 += v42;
                if ((_DWORD)v41 == 48)
                  v43 = v42;
                else
                  v43 = 0;
                v39 += v43;
                if (v17 == ++v18)
                {
                  v18 = v17;
                  break;
                }
              }
            }
            v47 = *(unsigned __int8 *)(v92 + 52);
            if (*(_BYTE *)(v92 + 50))
            {
              v48 = (v39 - v47);
            }
            else
            {
              v39 = *(unsigned __int8 *)(v92 + 52);
              v48 = 0;
            }
            if (*(_BYTE *)(v92 + 52))
              objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(v16 + 1992), "customNumberFormatDecimalTokenRepresentedStringWithDigits:digitString:", v47, CFSTR("0")));
            if ((int)v48 >= 1)
              objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(v16 + 1992), "customNumberFormatDecimalTokenRepresentedStringWithDigits:digitString:", v48, CFSTR("?")));
            if (v40 - v39 >= 1)
              objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(v16 + 1992), "customNumberFormatDecimalTokenRepresentedStringWithDigits:digitString:"));
            v19 = 1;
            v21 = v18;
          }
          else
          {
            if (v18 >= v17)
            {
              v83 = 0;
              v21 = v18;
              v45 = 0x24BDBC000;
            }
            else
            {
              v44 = 0;
              v45 = 0x24BDBC000uLL;
              while (1)
              {
                v46 = objc_msgSend(v14, "characterAtIndex:", v18);
                if (!objc_msgSend(v88, "characterIsMember:", v46))
                  break;
                v44 += objc_msgSend(v86, "characterIsMember:", v46);
                if (v17 == ++v18)
                {
                  v83 = v44;
                  v21 = v17;
                  goto LABEL_92;
                }
              }
              v83 = v44;
              v21 = v18;
            }
LABEL_92:
            v91 = (void *)objc_msgSend(*(id *)(v45 + 3768), "array");
            v49 = *(unsigned __int8 *)(a1 + 51);
            v50 = *(unsigned __int8 *)(a1 + 49);
            v84 = v50;
            if (!*(_BYTE *)(a1 + 49))
              v50 = *(unsigned __int8 *)(a1 + 51);
            v85 = v50;
            v89 = *(void **)(a1 + 32);
            v51 = objc_msgSend(v89, "firstIndex");
            v52 = v51;
            v82 = v49;
            if (v49)
            {
              v87 = 0;
              v53 = 0;
              v54 = v51;
              v55 = v49;
              do
              {
                if (v89)
                  v56 = v54 == 0x7FFFFFFFFFFFFFFFLL;
                else
                  v56 = 1;
                v57 = !v56;
                v58 = v55;
                v59 = v54 - v53;
                if (v54 - v53 >= v58)
                  v59 = v58;
                v60 = v57 != 1 || v54 - v53 <= v58;
                if (v57 == 1)
                  v61 = v59;
                else
                  v61 = v58;
                objc_msgSend(v91, "insertObject:atIndex:", objc_msgSend(MEMORY[0x24BDD17C8], "customNumberFormatIntegerTokenRepresentedStringWithDigits:separator:digitString:", v61, *(_BYTE *)(v92 + 56) & 1, CFSTR("0")), 0);
                if (v57)
                {
                  if (v60)
                  {
                    objc_msgSend(v91, "insertObject:atIndex:", objc_msgSend(*(id *)(v92 + 24), "objectAtIndex:", v87++), 0);
                    v52 = objc_msgSend(*(id *)(v92 + 32), "indexGreaterThanIndex:", v54);
                  }
                  else
                  {
                    v52 = v54;
                    v54 = v61 + v53;
                  }
                }
                else
                {
                  v52 = v54;
                  v54 = v53;
                }
                v55 = v58 - v61;
                v62 = v54;
                v53 = v54;
                v54 = v52;
              }
              while (v55 > 0);
            }
            else
            {
              v62 = 0;
              v87 = 0;
            }
            if (v84)
            {
              v63 = v84 - v82;
              v64 = v52;
              if (v84 - v82 >= 1)
              {
                do
                {
                  if (v89)
                    v65 = v64 == 0x7FFFFFFFFFFFFFFFLL;
                  else
                    v65 = 1;
                  v66 = !v65;
                  v67 = v63;
                  v68 = v64 - v62;
                  if (v64 - v62 >= v67)
                    v68 = v67;
                  v69 = v66 != 1 || v64 - v62 <= v67;
                  if (v66 == 1)
                    v70 = v68;
                  else
                    v70 = v67;
                  objc_msgSend(v91, "insertObject:atIndex:", objc_msgSend(MEMORY[0x24BDD17C8], "customNumberFormatIntegerTokenRepresentedStringWithDigits:separator:digitString:", v70, *(_BYTE *)(v92 + 56) & 1, CFSTR("?")), 0);
                  if (v66)
                  {
                    if (v69)
                    {
                      objc_msgSend(v91, "insertObject:atIndex:", objc_msgSend(*(id *)(v92 + 24), "objectAtIndex:", v87++), 0);
                      v52 = objc_msgSend(*(id *)(v92 + 32), "indexGreaterThanIndex:", v64);
                    }
                    else
                    {
                      v52 = v64;
                      v64 = v70 + v62;
                    }
                  }
                  else
                  {
                    v52 = v64;
                    v64 = v62;
                  }
                  v63 = v67 - v70;
                  v62 = v64;
                  v64 = v52;
                }
                while ((int)v67 - (int)v70 > 0);
              }
            }
            v71 = v83 - v85;
            if (v83 - v85 >= 1)
            {
              do
              {
                if (v89)
                  v72 = v52 == 0x7FFFFFFFFFFFFFFFLL;
                else
                  v72 = 1;
                v73 = !v72;
                v74 = v71;
                v75 = v52 - v62;
                if (v52 - v62 >= v74)
                  v75 = v74;
                v76 = v73 != 1 || v52 - v62 <= v74;
                if (v73 == 1)
                  v77 = v75;
                else
                  v77 = v74;
                objc_msgSend(v91, "insertObject:atIndex:", objc_msgSend(MEMORY[0x24BDD17C8], "customNumberFormatIntegerTokenRepresentedStringWithDigits:separator:digitString:", v77, *(_BYTE *)(v92 + 56) & 1, CFSTR("#")), 0);
                if (v73)
                {
                  if (v76)
                  {
                    objc_msgSend(v91, "insertObject:atIndex:", objc_msgSend(*(id *)(v92 + 24), "objectAtIndex:", v87++), 0);
                    v78 = objc_msgSend(*(id *)(v92 + 32), "indexGreaterThanIndex:", v52);
                  }
                  else
                  {
                    v78 = v52;
                    v52 = v77 + v62;
                  }
                }
                else
                {
                  v78 = v52;
                  v52 = v62;
                }
                v71 = v74 - v77;
                v62 = v52;
                v52 = v78;
              }
              while ((int)v74 - (int)v77 > 0);
            }
            objc_msgSend(v3, "addObjectsFromArray:", v91);
            v19 = 0;
            v16 = 0x24BDD1000;
          }
          a1 = v92;
          goto LABEL_50;
        }
        v37 = objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("%C"), v20);
        goto LABEL_49;
      }
      v31 = (void *)MEMORY[0x24BDD16A8];
      v30 = *(_QWORD *)(a1 + 16);
      v32 = 3;
    }
    v37 = objc_msgSend(v31, "customNumberFormatTokenStringOfType:content:", v32, v30);
LABEL_49:
    objc_msgSend(v3, "addObject:", v37);
    goto LABEL_50;
  }
  v90 = 0;
LABEL_165:
  v79 = *(double *)(a1 + 40);
  if (v79 != 1.0 && (v90 & 1) == 0)
  {
    if (v79 == 100.0)
    {
      v80 = 37;
    }
    else if (v79 == 0.01)
    {
      v80 = 67;
    }
    else if (v79 == 0.001)
    {
      v80 = 75;
    }
    else if (v79 == 0.000001)
    {
      v80 = 77;
    }
    else if (v79 == 0.000000001)
    {
      v80 = 66;
    }
    else if (v79 == 1.0e-12)
    {
      v80 = 84;
    }
    else
    {
      v80 = 0;
    }
    v11 = objc_msgSend(MEMORY[0x24BDD16A8], "customNumberFormatTokenStringOfType:content:", 0, objc_msgSend(*(id *)(v16 + 1992), "stringWithFormat:", CFSTR("%C"), v80));
    v10 = v3;
    goto LABEL_181;
  }
  return v3;
}

uint64_t TSUNumberFormatStringApplyPrefixAndSuffix(void *a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a2)
  {
    v5 = a2;
    if (objc_msgSend(a2, "length"))
    {
      if (objc_msgSend(v5, "rangeOfString:", CFSTR("'")) != 0x7FFFFFFFFFFFFFFFLL)
        v5 = (void *)objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("'"), CFSTR("''"));
      if (objc_msgSend(a1, "length") && objc_msgSend(a1, "characterAtIndex:", 0) == 39)
      {
        v6 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("'%@"), v5);
        a1 = (void *)objc_msgSend(a1, "substringFromIndex:", 1);
      }
      else
      {
        v6 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("'%@'"), v5);
      }
      a1 = (void *)objc_msgSend(v6, "stringByAppendingString:", a1);
    }
  }
  if (!a3 || !objc_msgSend(a3, "length"))
    return (uint64_t)a1;
  if (objc_msgSend(a3, "rangeOfString:", CFSTR("'")) != 0x7FFFFFFFFFFFFFFFLL)
    a3 = (void *)objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("'"), CFSTR("''"));
  v7 = objc_msgSend(a1, "length");
  if (v7 && (v8 = v7 - 1, objc_msgSend(a1, "characterAtIndex:", v7 - 1) == 39))
  {
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@'"), a3);
    a1 = (void *)objc_msgSend(a1, "substringToIndex:", v8);
  }
  else
  {
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("'%@'"), a3);
  }
  return objc_msgSend(a1, "stringByAppendingString:", v9);
}

void sub_216D5D288(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t TSULocationInRanges(unint64_t a1, void *a2)
{
  uint64_t result;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  if (!a2)
    return 0;
  result = objc_msgSend(a2, "count");
  if (result)
  {
    v5 = result;
    v6 = objc_msgSend((id)objc_msgSend(a2, "objectAtIndex:", 0), "rangeValue");
    if (a1 < v6 || a1 - v6 >= v7)
    {
      v8 = 1;
      do
      {
        v9 = v8;
        if (v5 == v8)
          break;
        v10 = objc_msgSend((id)objc_msgSend(a2, "objectAtIndex:", v8), "rangeValue");
        v8 = v9 + 1;
      }
      while (a1 < v10 || a1 - v10 >= v11);
      return v9 < v5;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t TSUSearchCharacterSetForSeparatorCharacter(unsigned int a1)
{
  const __CFCharacterSet *v2;
  const __CFCharacterSet *v3;
  const __CFCharacterSet *v4;

  v2 = (const __CFCharacterSet *)objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR(",，"));
  v3 = (const __CFCharacterSet *)objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR(".．"));
  v4 = (const __CFCharacterSet *)objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("  "));
  if (CFCharacterSetIsCharacterMember(v3, a1))
    return (uint64_t)v3;
  v3 = v2;
  if (CFCharacterSetIsCharacterMember(v2, a1))
    return (uint64_t)v3;
  v3 = v4;
  if (CFCharacterSetIsCharacterMember(v4, a1))
    return (uint64_t)v3;
  else
    return objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C"), a1));
}

BOOL TSUNumberOfDigitsInStringAllowsPreciseDoubleParsing(void *a1)
{
  void *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  id v8;

  v2 = (void *)objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", a1);
  objc_msgSend(v2, "setCharactersToBeSkipped:", 0);
  v3 = 0;
  v7 = 0;
  v8 = 0;
  do
  {
    v4 = objc_msgSend(v2, "scanLocation", v7);
    v5 = objc_msgSend(a1, "length");
    if (v4 >= v5)
      break;
    objc_msgSend(v2, "scanCharactersFromSet:intoString:", objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet"), &v8);
    objc_msgSend(v2, "scanCharactersFromSet:intoString:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet"), "invertedSet"), &v7);
    v3 += objc_msgSend(v8, "length");
  }
  while (v3 <= kTSUNumberFormatterMaxDigitsForPreciseDoubleParsing);
  return v4 >= v5;
}

uint64_t TSUNumberOfDecimalPlacesInNumericString(const __CFString *a1, CFLocaleRef locale)
{
  const __CFLocale *v4;
  const __CFString *Value;
  unsigned int CharacterAtIndex;
  const __CFCharacterSet *v7;
  BOOL v8;
  uint64_t v10;
  const __CFCharacterSet *Predefined;
  uint64_t v12;
  CFIndex v13;
  CFIndex v14;
  UniChar v15;
  int IsCharacterMember;
  CFRange v18;
  CFRange v19;

  v4 = locale;
  if (!locale)
    v4 = CFLocaleCopyCurrent();
  Value = (const __CFString *)CFLocaleGetValue(v4, (CFLocaleKey)*MEMORY[0x24BDBD3F8]);
  CharacterAtIndex = CFStringGetCharacterAtIndex(Value, 0);
  v7 = (const __CFCharacterSet *)TSUSearchCharacterSetForSeparatorCharacter(CharacterAtIndex);
  v18.location = 0;
  v18.length = 0;
  v19.length = CFStringGetLength(a1);
  v19.location = 0;
  if (CFStringFindCharacterFromSet(a1, v7, v19, 4uLL, &v18))
    v8 = v18.length == 0;
  else
    v8 = 1;
  if (v8 || v18.location == -1)
  {
    v10 = 0;
  }
  else
  {
    Predefined = CFCharacterSetGetPredefined(kCFCharacterSetDecimalDigit);
    v12 = 0;
    v13 = v18.location + 1;
    do
    {
      v10 = v12;
      v14 = v13 + v12;
      if (v13 + v12 >= (unint64_t)CFStringGetLength(a1))
        break;
      v15 = CFStringGetCharacterAtIndex(a1, v14);
      IsCharacterMember = CFCharacterSetIsCharacterMember(Predefined, v15);
      v12 = v10 + 1;
    }
    while (IsCharacterMember);
  }
  if (!locale)
    CFRelease(v4);
  return v10;
}

BOOL TSUIsGroupingSeparatorUsedInNumericString(const __CFString *a1, CFLocaleRef locale)
{
  const __CFLocale *v4;
  const __CFString *Value;
  unsigned int CharacterAtIndex;
  const __CFCharacterSet *v7;
  BOOL v8;
  BOOL v9;
  CFCharacterSetRef Predefined;
  CFIndex location;
  CFIndex v12;
  const __CFCharacterSet *v13;
  UniChar v14;
  UniChar v15;
  _BOOL8 v16;
  CFRange v18;
  CFRange v19;

  v4 = locale;
  if (!locale)
    v4 = CFLocaleCopyCurrent();
  Value = (const __CFString *)CFLocaleGetValue(v4, (CFLocaleKey)*MEMORY[0x24BDBD408]);
  CharacterAtIndex = CFStringGetCharacterAtIndex(Value, 0);
  v7 = (const __CFCharacterSet *)TSUSearchCharacterSetForSeparatorCharacter(CharacterAtIndex);
  v18.location = 0;
  v18.length = 0;
  v19.length = CFStringGetLength(a1);
  v19.location = 0;
  if (CFStringFindCharacterFromSet(a1, v7, v19, 0, &v18))
    v8 = v18.length == 0;
  else
    v8 = 1;
  v9 = v8 || v18.location == -1;
  if (v9
    || (Predefined = CFCharacterSetGetPredefined(kCFCharacterSetDecimalDigit),
        location = v18.location,
        v12 = v18.location - 1,
        v18.location < 1)
    || (v13 = Predefined, location > CFStringGetLength(a1))
    || (v14 = CFStringGetCharacterAtIndex(a1, v12), !CFCharacterSetIsCharacterMember(v13, v14))
    || location + 1 >= CFStringGetLength(a1))
  {
    v16 = 0;
    if (!locale)
LABEL_17:
      CFRelease(v4);
  }
  else
  {
    v15 = CFStringGetCharacterAtIndex(a1, location + 1);
    v16 = CFCharacterSetIsCharacterMember(v13, v15) != 0;
    if (!locale)
      goto LABEL_17;
  }
  return v16;
}

unint64_t TSUNumberOfTrailingZerosInMantissaWhenFormattedAsScientific(uint64_t a1, double a2)
{
  CFAllocatorRef *v3;
  void *v4;
  const __CFAllocator *v5;
  const __CFString *CanonicalLocaleIdentifierFromString;
  const __CFLocale *v7;
  __CFNumberFormatter *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  int v18;
  double valuePtr;

  valuePtr = a2;
  v3 = (CFAllocatorRef *)MEMORY[0x24BDBD240];
  if (!TSUNumberOfTrailingZerosInMantissaWhenFormattedAsScientific_formatter)
  {
    v4 = (void *)objc_opt_class();
    objc_sync_enter(v4);
    if (!TSUNumberOfTrailingZerosInMantissaWhenFormattedAsScientific_formatter)
    {
      v5 = *v3;
      CanonicalLocaleIdentifierFromString = CFLocaleCreateCanonicalLocaleIdentifierFromString(*v3, CFSTR("en_US"));
      v7 = CFLocaleCreate(v5, CanonicalLocaleIdentifierFromString);
      CFRelease(CanonicalLocaleIdentifierFromString);
      v8 = CFNumberFormatterCreate(v5, v7, kCFNumberFormatterNoStyle);
      CFRelease(v7);
      CFNumberFormatterSetFormat(v8, CFSTR("#.##E+00"));
      __dmb(0xBu);
      TSUNumberOfTrailingZerosInMantissaWhenFormattedAsScientific_formatter = (uint64_t)v8;
    }
    objc_sync_exit(v4);
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", a1);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 1);
  objc_msgSend((id)gLockTSUNumberOfTrailingZerosInMantissaWhenFormattedAsScientific, "lock");
  CFNumberFormatterSetProperty((CFNumberFormatterRef)TSUNumberOfTrailingZerosInMantissaWhenFormattedAsScientific_formatter, (CFNumberFormatterKey)*MEMORY[0x24BDBD4C0], v9);
  CFNumberFormatterSetProperty((CFNumberFormatterRef)TSUNumberOfTrailingZerosInMantissaWhenFormattedAsScientific_formatter, (CFNumberFormatterKey)*MEMORY[0x24BDBD4A8], v9);
  CFNumberFormatterSetProperty((CFNumberFormatterRef)TSUNumberOfTrailingZerosInMantissaWhenFormattedAsScientific_formatter, (CFNumberFormatterKey)*MEMORY[0x24BDBD4C8], v10);
  v11 = (__CFString *)CFNumberFormatterCreateStringWithValue(*v3, (CFNumberFormatterRef)TSUNumberOfTrailingZerosInMantissaWhenFormattedAsScientific_formatter, kCFNumberDoubleType, &valuePtr);
  objc_msgSend((id)gLockTSUNumberOfTrailingZerosInMantissaWhenFormattedAsScientific, "unlock");

  v12 = -[__CFString rangeOfString:](v11, "rangeOfString:", CFSTR("."));
  v13 = -[__CFString rangeOfString:options:](v11, "rangeOfString:options:", CFSTR("E"), 1);
  v14 = 0;
  if (v12 != 0x7FFFFFFFFFFFFFFFLL && v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = v13 - v12;
    if (v13 > v12)
    {
      v14 = v13 + ~v12;
      v16 = v13 - 1;
      v17 = 1;
      while (v15 != v17)
      {
        v18 = -[__CFString characterAtIndex:](v11, "characterAtIndex:", v16);
        ++v17;
        --v16;
        if (v18 != 48)
        {
          v14 = v17 - 2;
          break;
        }
      }
    }
  }

  return v14;
}

void sub_216D5E18C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_216D5E1C4(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x216D5E0CCLL);
}

uint64_t TSUNumberOfDecimalPlacesInValue(double a1)
{
  uint64_t v1;
  __CFNumberFormatter *v2;
  CFAllocatorRef *v3;
  void *v4;
  const __CFAllocator *v5;
  const __CFString *CanonicalLocaleIdentifierFromString;
  const __CFLocale *v7;
  __CFNumberFormatter *v8;
  const void *v9;
  const void *v10;
  __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  double valuePtr;

  valuePtr = a1;
  if (floor(a1) == a1)
    return 0;
  v2 = (__CFNumberFormatter *)TSUNumberOfDecimalPlacesInValue_formatter;
  v3 = (CFAllocatorRef *)MEMORY[0x24BDBD240];
  if (!TSUNumberOfDecimalPlacesInValue_formatter)
  {
    v4 = (void *)objc_opt_class();
    objc_sync_enter(v4);
    if (!TSUNumberOfDecimalPlacesInValue_formatter)
    {
      v5 = *v3;
      CanonicalLocaleIdentifierFromString = CFLocaleCreateCanonicalLocaleIdentifierFromString(*v3, CFSTR("en_US"));
      v7 = CFLocaleCreate(v5, CanonicalLocaleIdentifierFromString);
      CFRelease(CanonicalLocaleIdentifierFromString);
      v8 = CFNumberFormatterCreate(v5, v7, kCFNumberFormatterNoStyle);
      CFRelease(v7);
      CFNumberFormatterSetFormat(v8, CFSTR("0"));
      v9 = (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
      CFNumberFormatterSetProperty(v8, (CFNumberFormatterKey)*MEMORY[0x24BDBD4C0], v9);
      v10 = (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0x7FFFFFFFLL);
      CFNumberFormatterSetProperty(v8, (CFNumberFormatterKey)*MEMORY[0x24BDBD4A8], v10);
      __dmb(0xBu);
      TSUNumberOfDecimalPlacesInValue_formatter = (uint64_t)v8;
    }
    objc_sync_exit(v4);
    v2 = (__CFNumberFormatter *)TSUNumberOfDecimalPlacesInValue_formatter;
  }
  v11 = (__CFString *)CFNumberFormatterCreateStringWithValue(*v3, v2, kCFNumberDoubleType, &valuePtr);
  v12 = -[__CFString rangeOfString:](v11, "rangeOfString:", CFSTR("."));
  if (v12 != 0x7FFFFFFFFFFFFFFFLL && v13 == 1)
    v1 = -[__CFString length](v11, "length") + ~v12;
  else
    v1 = 0;

  return v1;
}

void sub_216D5E35C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t TSUNumberOfDecimalPlacesNecessaryToDisplayFullPrecisionInScientificNotation(double a1)
{
  const __CFAllocator *v1;
  const __CFString *CanonicalLocaleIdentifierFromString;
  const __CFLocale *v3;
  __CFNumberFormatter *v4;
  __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL8 v18;
  double valuePtr;

  valuePtr = a1;
  v1 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  CanonicalLocaleIdentifierFromString = CFLocaleCreateCanonicalLocaleIdentifierFromString((CFAllocatorRef)*MEMORY[0x24BDBD240], CFSTR("en_US"));
  v3 = CFLocaleCreate(v1, CanonicalLocaleIdentifierFromString);
  CFRelease(CanonicalLocaleIdentifierFromString);
  v4 = CFNumberFormatterCreate(v1, v3, kCFNumberFormatterNoStyle);
  CFRelease(v3);
  CFNumberFormatterSetFormat(v4, CFSTR("0"));
  CFNumberFormatterSetProperty(v4, (CFNumberFormatterKey)*MEMORY[0x24BDBD4C0], (CFTypeRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0));
  CFNumberFormatterSetProperty(v4, (CFNumberFormatterKey)*MEMORY[0x24BDBD4A8], (CFTypeRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0x7FFFFFFFLL));
  v5 = (__CFString *)CFNumberFormatterCreateStringWithValue(v1, v4, kCFNumberDoubleType, &valuePtr);
  CFRelease(v4);
  v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("0.-")), "invertedSet");
  v7 = -[__CFString rangeOfCharacterFromSet:](v5, "rangeOfCharacterFromSet:", v6);
  v9 = 0;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL && v8 == 1)
  {
    v11 = v7;
    if (v7 != -[__CFString length](v5, "length") - 1
      && ((v12 = -[__CFString rangeOfCharacterFromSet:options:range:](v5, "rangeOfCharacterFromSet:options:range:", v6, 4, v11 + 1, -[__CFString length](v5, "length") - (v11 + 1)), v12 != 0x7FFFFFFFFFFFFFFFLL)? (v14 = v13 == 1): (v14 = 0), v14))
    {
      v15 = v12 - v11;
      v18 = -[__CFString rangeOfString:options:range:](v5, "rangeOfString:options:range:", CFSTR("."), 0, v11, v12 - v11 + 1) != 0x7FFFFFFFFFFFFFFFLL&& v16 == 1;
      v9 = v15 - v18;
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

uint64_t TSUNumberFormatterGroupingSizeForLocale(const __CFLocale *a1)
{
  __CFNumberFormatter *v1;
  const __CFNumber *v2;
  uint64_t result;
  void *v4;
  uint64_t v5;
  int v6;
  unsigned int valuePtr;

  if (a1)
  {
    v1 = CFNumberFormatterCreate(0, a1, kCFNumberFormatterDecimalStyle);
    v2 = (const __CFNumber *)CFNumberFormatterCopyProperty(v1, (CFNumberFormatterKey)*MEMORY[0x24BDBD488]);
    CFRelease(v1);
    valuePtr = 0;
    CFNumberGetValue(v2, kCFNumberIntType, &valuePtr);
    CFRelease(v2);
    return valuePtr;
  }
  else
  {
    result = TSUNumberFormatterGroupingSizeForLocale_sCurrentLocaleGroupingSize;
    if (TSUNumberFormatterGroupingSizeForLocale_sCurrentLocaleGroupingSize == -1)
    {
      v4 = (void *)objc_opt_class();
      objc_sync_enter(v4);
      v5 = TSUGetCurrentLocale();
      v6 = TSUNumberFormatterGroupingSizeForLocale(v5);
      __dmb(0xBu);
      TSUNumberFormatterGroupingSizeForLocale_sCurrentLocaleGroupingSize = v6;
      objc_sync_exit(v4);
      return TSUNumberFormatterGroupingSizeForLocale_sCurrentLocaleGroupingSize;
    }
  }
  return result;
}

void sub_216D5E5FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__CFString *TSUNumberFormatterStringFromDoubleWithFormat(__CFString *a1, int a2, unsigned int a3, uint64_t a4, int a5, __CFString *a6, int a7, double a8)
{
  if (a6 && -[__CFString length](a6, "length"))
    return TSUNumberFormatterStringFromDoubleWithFormatForCurrency(a1, a2, a3, a4, a5, a6, a7, a8);
  else
    return TSUNumberFormatterStringFromDoubleWithFormatForNumber(a1, a2, a3, a4, a5, a7, a8);
}

__CFString *TSUNumberFormatterStringFromDoubleWithFormatForCurrency(__CFString *a1, int a2, unsigned int a3, unsigned int a4, int a5, __CFString *a6, int a7, double a8)
{
  const __CFLocale *v11;
  CFAllocatorRef *v12;
  void *v13;
  __CFNumberFormatter *v14;
  const void *v15;
  void *v16;
  void *v17;
  __CFNumberFormatter *v18;
  const void *v19;
  void *v20;
  __CFNumberFormatter *v21;
  __CFNumberFormatter *v22;
  uint64_t v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  CFTypeRef *v30;
  __CFString *v31;
  double valuePtr;

  valuePtr = a8;
  v11 = (const __CFLocale *)TSUGetCurrentLocale();
  v12 = (CFAllocatorRef *)MEMORY[0x24BDBD240];
  if (!TSUNumberFormatterStringFromDoubleWithFormatForCurrency_formatter)
  {
    v13 = (void *)objc_opt_class();
    objc_sync_enter(v13);
    if (!TSUNumberFormatterStringFromDoubleWithFormatForCurrency_formatter)
    {
      v14 = CFNumberFormatterCreate(*v12, v11, kCFNumberFormatterNoStyle);
      v15 = (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 6);
      CFNumberFormatterSetProperty(v14, (CFNumberFormatterKey)*MEMORY[0x24BDBD540], v15);
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 1);
      CFNumberFormatterSetProperty(v14, (CFNumberFormatterKey)*MEMORY[0x24BDBD4C8], v16);

      __dmb(0xBu);
      TSUNumberFormatterStringFromDoubleWithFormatForCurrency_formatter = (uint64_t)v14;
    }
    objc_sync_exit(v13);
  }
  if (!TSUNumberFormatterStringFromDoubleWithFormatForCurrency_noMinusSignFormatter)
  {
    v17 = (void *)objc_opt_class();
    objc_sync_enter(v17);
    if (!TSUNumberFormatterStringFromDoubleWithFormatForCurrency_noMinusSignFormatter)
    {
      v18 = CFNumberFormatterCreate(*v12, v11, kCFNumberFormatterNoStyle);
      v19 = (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 6);
      CFNumberFormatterSetProperty(v18, (CFNumberFormatterKey)*MEMORY[0x24BDBD540], v19);
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 1);
      CFNumberFormatterSetProperty(v18, (CFNumberFormatterKey)*MEMORY[0x24BDBD4C8], v20);

      __dmb(0xBu);
      TSUNumberFormatterStringFromDoubleWithFormatForCurrency_noMinusSignFormatter = (uint64_t)v18;
    }
    objc_sync_exit(v17);
  }
  objc_msgSend((id)gLockTSUNumberFormatterStringFromDoubleWithFormat, "lock");
  v21 = (__CFNumberFormatter *)TSUNumberFormatterStringFromDoubleWithFormatForCurrency_noMinusSignFormatter;
  if (a7)
    v22 = (__CFNumberFormatter *)TSUNumberFormatterStringFromDoubleWithFormatForCurrency_noMinusSignFormatter;
  else
    v22 = (__CFNumberFormatter *)TSUNumberFormatterStringFromDoubleWithFormatForCurrency_formatter;
  v23 = (uint64_t)v22;
  if ((__CFNumberFormatter *)sActiveCurrencyFormatter != v22)
  {
    sActiveCurrencyFormatter = 0;

    sActiveCurrencyFormat = 0;
    v23 = sActiveCurrencyFormatter;
  }
  if (!v23
    || (__CFString *)sActiveCurrencyCode != a6
    && (objc_msgSend((id)sActiveCurrencyCode, "isEqualToString:", a6) & 1) == 0)
  {

    sActiveCurrencyFormat = 0;
    v24 = (const __CFString *)*MEMORY[0x24BDBD440];
    if (a6)
    {
      CFNumberFormatterSetProperty(v22, v24, a6);
      if (CFStringCompare(a6, CFSTR("CHF"), 0) == kCFCompareEqualTo)
      {
        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 0);
        CFNumberFormatterSetProperty(v22, (CFNumberFormatterKey)*MEMORY[0x24BDBD538], v25);

      }
    }
    else
    {
      CFNumberFormatterSetProperty(v22, v24, &stru_24D61C228);
      CFNumberFormatterSetProperty(v22, (CFNumberFormatterKey)*MEMORY[0x24BDBD458], &stru_24D61C228);
    }

    sActiveCurrencyCode = -[__CFString copy](a6, "copy");
  }
  if (!sActiveCurrencyFormat || CFStringCompare(a1, (CFStringRef)sActiveCurrencyFormat, 0))
  {
    CFNumberFormatterSetFormat(v22, a1);

    sActiveCurrencyFormat = a1;
  }
  if (a2)
  {
    if ((unsigned __int16)kTSUNumberFormatterDecimalPlacesAsManyAsNecessary == a4)
    {
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 0);
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 0x7FFFFFFFLL);
      CFNumberFormatterSetProperty(v22, (CFNumberFormatterKey)*MEMORY[0x24BDBD4C0], v26);
      CFNumberFormatterSetProperty(v22, (CFNumberFormatterKey)*MEMORY[0x24BDBD4A8], v27);

    }
    else
    {
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", a3);
      CFNumberFormatterSetProperty(v22, (CFNumberFormatterKey)*MEMORY[0x24BDBD4C0], v28);

      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", a4);
      CFNumberFormatterSetProperty(v22, (CFNumberFormatterKey)*MEMORY[0x24BDBD4A8], v29);

    }
  }
  if (a7)
    CFNumberFormatterSetProperty(v21, (CFNumberFormatterKey)*MEMORY[0x24BDBD4D8], &stru_24D61C228);
  v30 = (CFTypeRef *)MEMORY[0x24BDBD268];
  if (a5)
    v30 = (CFTypeRef *)MEMORY[0x24BDBD270];
  CFNumberFormatterSetProperty(v22, (CFNumberFormatterKey)*MEMORY[0x24BDBD550], *v30);
  v31 = (__CFString *)CFNumberFormatterCreateStringWithValue(*v12, v22, kCFNumberDoubleType, &valuePtr);
  sActiveCurrencyFormatter = (uint64_t)v22;
  objc_msgSend((id)gLockTSUNumberFormatterStringFromDoubleWithFormat, "unlock");
  return v31;
}

void sub_216D5EB4C(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x216D5EB0CLL);
}

__CFString *TSUNumberFormatterStringFromDoubleWithFormatForNumber(__CFString *a1, int a2, unsigned int a3, uint64_t a4, int a5, int a6, double a7)
{
  const __CFLocale *v12;
  void *v13;
  __CFNumberFormatter *v14;
  const void *v15;
  void *v16;
  void *v17;
  __CFNumberFormatter *v18;
  const void *v19;
  void *v20;
  __CFNumberFormatter *v21;
  __CFNumberFormatter *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  CFTypeRef *v27;
  __CFString *v28;
  double valuePtr;

  valuePtr = a7;
  v12 = (const __CFLocale *)TSUGetCurrentLocale();
  if (!TSUNumberFormatterStringFromDoubleWithFormatForNumber_formatter)
  {
    v13 = (void *)objc_opt_class();
    objc_sync_enter(v13);
    if (!TSUNumberFormatterStringFromDoubleWithFormatForNumber_formatter)
    {
      v14 = CFNumberFormatterCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v12, kCFNumberFormatterNoStyle);
      v15 = (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 6);
      CFNumberFormatterSetProperty(v14, (CFNumberFormatterKey)*MEMORY[0x24BDBD540], v15);
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 1);
      CFNumberFormatterSetProperty(v14, (CFNumberFormatterKey)*MEMORY[0x24BDBD4C8], v16);

      __dmb(0xBu);
      TSUNumberFormatterStringFromDoubleWithFormatForNumber_formatter = (uint64_t)v14;
    }
    objc_sync_exit(v13);
  }
  if (!TSUNumberFormatterStringFromDoubleWithFormatForNumber_noMinusSignFormatter)
  {
    v17 = (void *)objc_opt_class();
    objc_sync_enter(v17);
    if (!TSUNumberFormatterStringFromDoubleWithFormatForNumber_noMinusSignFormatter)
    {
      v18 = CFNumberFormatterCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v12, kCFNumberFormatterNoStyle);
      v19 = (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 6);
      CFNumberFormatterSetProperty(v18, (CFNumberFormatterKey)*MEMORY[0x24BDBD540], v19);
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 1);
      CFNumberFormatterSetProperty(v18, (CFNumberFormatterKey)*MEMORY[0x24BDBD4C8], v20);

      __dmb(0xBu);
      TSUNumberFormatterStringFromDoubleWithFormatForNumber_noMinusSignFormatter = (uint64_t)v18;
    }
    objc_sync_exit(v17);
  }
  objc_msgSend((id)gLockTSUNumberFormatterStringFromDoubleWithFormat, "lock");
  v21 = (__CFNumberFormatter *)TSUNumberFormatterStringFromDoubleWithFormatForNumber_noMinusSignFormatter;
  if (a6)
    v22 = (__CFNumberFormatter *)TSUNumberFormatterStringFromDoubleWithFormatForNumber_noMinusSignFormatter;
  else
    v22 = (__CFNumberFormatter *)TSUNumberFormatterStringFromDoubleWithFormatForNumber_formatter;
  if ((__CFNumberFormatter *)sActiveFormatter != v22)
  {
    sActiveFormatter = 0;

    sActiveFormat = 0;
LABEL_14:
    CFNumberFormatterSetFormat(v22, a1);

    sActiveFormat = a1;
    goto LABEL_15;
  }
  if (!sActiveFormat || CFStringCompare(a1, (CFStringRef)sActiveFormat, 0))
    goto LABEL_14;
LABEL_15:
  if (a2)
  {
    if ((unsigned __int16)kTSUNumberFormatterDecimalPlacesAsManyAsNecessary == (_DWORD)a4)
    {
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 0);
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", 0x7FFFFFFFLL);
      CFNumberFormatterSetProperty(v22, (CFNumberFormatterKey)*MEMORY[0x24BDBD4C0], v23);
      CFNumberFormatterSetProperty(v22, (CFNumberFormatterKey)*MEMORY[0x24BDBD4A8], v24);

    }
    else
    {
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", a3);
      CFNumberFormatterSetProperty(v22, (CFNumberFormatterKey)*MEMORY[0x24BDBD4C0], v25);

      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", a4);
      CFNumberFormatterSetProperty(v22, (CFNumberFormatterKey)*MEMORY[0x24BDBD4A8], v26);

    }
  }
  if (a6)
    CFNumberFormatterSetProperty(v21, (CFNumberFormatterKey)*MEMORY[0x24BDBD4D8], &stru_24D61C228);
  v27 = (CFTypeRef *)MEMORY[0x24BDBD268];
  if (a5)
    v27 = (CFTypeRef *)MEMORY[0x24BDBD270];
  CFNumberFormatterSetProperty(v22, (CFNumberFormatterKey)*MEMORY[0x24BDBD550], *v27);
  v28 = (__CFString *)CFNumberFormatterCreateStringWithValue((CFAllocatorRef)*MEMORY[0x24BDBD240], v22, kCFNumberDoubleType, &valuePtr);
  sActiveFormatter = (uint64_t)v22;
  objc_msgSend((id)gLockTSUNumberFormatterStringFromDoubleWithFormat, "unlock");
  return v28;
}

void sub_216D5EF54(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_216D5EFA4(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x216D5EF18);
}

void *TSUNumberFormatterStringFromStringWithCustomFormat(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;

  v2 = a1;
  if (a1 && a2)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", a2);
    objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C"), (unsigned __int16)TSUCustomNumberFormatTextReplacementCharacter), v2, 0, 0, objc_msgSend(v3, "length"));
    return v3;
  }
  return (void *)v2;
}

void TSUNumberFormatterSetBogusExponentSymbol(__CFNumberFormatter *a1)
{
  CFNumberFormatterSetProperty(a1, (CFNumberFormatterKey)*MEMORY[0x24BDBD470], CFSTR("xyzzyqghbv&q"));
}

uint64_t TSUDecimalSeparatorForCurrentLocale()
{
  uint64_t result;
  const __CFLocale *v1;
  id v2;

  result = TSUDecimalSeparatorForCurrentLocale_sDecimalSeparator;
  if (!TSUDecimalSeparatorForCurrentLocale_sDecimalSeparator)
  {
    v1 = CFLocaleCopyCurrent();
    TSUDecimalSeparatorForCurrentLocale_sDecimalSeparator = (uint64_t)CFLocaleGetValue(v1, (CFLocaleKey)*MEMORY[0x24BDBD3F8]);
    v2 = (id)TSUDecimalSeparatorForCurrentLocale_sDecimalSeparator;
    CFRelease(v1);
    return TSUDecimalSeparatorForCurrentLocale_sDecimalSeparator;
  }
  return result;
}

CFTypeRef TSUDecimalSeparatorForNonCachedCurrentLocale()
{
  const __CFLocale *v0;

  v0 = (const __CFLocale *)objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  return CFLocaleGetValue(v0, (CFLocaleKey)*MEMORY[0x24BDBD3F8]);
}

const __CFString *TSUListSeparatorForCurrentLocale()
{
  const __CFString *result;
  const __CFLocale *v1;
  void *Value;
  id v3;

  result = (const __CFString *)TSUListSeparatorForCurrentLocale_sListSeparator;
  if (!TSUListSeparatorForCurrentLocale_sListSeparator)
  {
    v1 = CFLocaleCopyCurrent();
    Value = (void *)CFLocaleGetValue(v1, (CFLocaleKey)*MEMORY[0x24BDBD3F8]);
    v3 = Value;
    CFRelease(v1);
    if (objc_msgSend(Value, "isEqualToString:", CFSTR(".")))
      result = CFSTR(",");
    else
      result = CFSTR(";");
    TSUListSeparatorForCurrentLocale_sListSeparator = (uint64_t)result;
  }
  return result;
}

void *TSUCurrencyCodesForLocale(const __CFLocale *a1, uint64_t a2)
{
  void *v4;
  CFTypeRef Value;
  CFTypeRef v6;

  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", +[TSUNumberFormatter userVisibleCurrencyCodes](TSUNumberFormatter, "userVisibleCurrencyCodes"));
  if (a1)
  {
    Value = CFLocaleGetValue(a1, (CFLocaleKey)*MEMORY[0x24BDBD3E0]);
    if (Value)
    {
      v6 = Value;
      if ((objc_msgSend(v4, "containsObject:", Value) & 1) == 0)
        objc_msgSend(v4, "insertObject:atIndex:", v6, 0);
    }
  }
  if (a2 && (objc_msgSend(v4, "containsObject:", a2) & 1) == 0)
    objc_msgSend(v4, "insertObject:atIndex:", a2, 0);
  return v4;
}

__CFArray *TSUCreateArrayOfDecimalFormattersForLocale(const __CFLocale *a1)
{
  __CFArray *Mutable;
  __CFNumberFormatter *v3;
  const __CFString *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __CFNumberFormatter *v9;

  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  v3 = CFNumberFormatterCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], a1, kCFNumberFormatterDecimalStyle);
  v4 = (const __CFString *)*MEMORY[0x24BDBD470];
  CFNumberFormatterSetProperty(v3, (CFNumberFormatterKey)*MEMORY[0x24BDBD470], CFSTR("xyzzyqghbv&q"));
  CFArrayAppendValue(Mutable, v3);
  CFRelease(v3);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", CFSTR("#,##0;- #,##0"),
                 CFSTR("#,##0;(#,##0)"),
                 CFSTR("#,##0;( #,##0)"),
                 0);
  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
    {
      v9 = CFNumberFormatterCreate(0, a1, kCFNumberFormatterNoStyle);
      CFNumberFormatterSetFormat(v9, (CFStringRef)objc_msgSend(v5, "objectAtIndex:", i));
      CFNumberFormatterSetProperty(v9, v4, CFSTR("xyzzyqghbv&q"));
      CFArrayAppendValue(Mutable, v9);
      CFRelease(v9);
    }
  }

  return Mutable;
}

__CFArray *TSUCreateArrayOfCurrencyFormattersForCurrencyCode(const __CFLocale *a1, const __CFArray *a2, const void *a3)
{
  __CFArray *Mutable;
  CFIndex Count;
  CFIndex v8;
  CFIndex v9;
  const __CFString *v10;
  const __CFString *v11;
  __CFNumberFormatter *v12;
  const __CFString *ValueAtIndex;

  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  Count = CFArrayGetCount(a2);
  if (Count >= 1)
  {
    v8 = Count;
    v9 = 0;
    v10 = (const __CFString *)*MEMORY[0x24BDBD440];
    v11 = (const __CFString *)*MEMORY[0x24BDBD470];
    do
    {
      v12 = CFNumberFormatterCreate(0, a1, kCFNumberFormatterNoStyle);
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a2, v9);
      CFNumberFormatterSetFormat(v12, ValueAtIndex);
      CFNumberFormatterSetProperty(v12, v10, a3);
      CFNumberFormatterSetProperty(v12, v11, CFSTR("xyzzyqghbv&q"));
      CFArrayAppendValue(Mutable, v12);
      CFRelease(v12);
      ++v9;
    }
    while (v8 != v9);
  }
  return Mutable;
}

__CFArray *TSUCreateArrayOfCurrencyFormattersForLocale(const __CFLocale *a1, const __CFArray *a2)
{
  __CFArray *Mutable;
  id v5;
  __CFNumberFormatter *v6;
  uint64_t v7;
  CFIndex Count;
  CFIndex v9;
  CFIndex i;
  const void *ValueAtIndex;
  __CFArray *v12;
  CFRange v14;

  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v6 = CFNumberFormatterCreate(0, a1, kCFNumberFormatterCurrencyStyle);
  CFNumberFormatterSetProperty(v6, (CFNumberFormatterKey)*MEMORY[0x24BDBD470], CFSTR("xyzzyqghbv&q"));
  v7 = objc_msgSend((id)-[__CFString positiveSubpatternOfNumberFormatPattern]((id)CFNumberFormatterGetFormat(v6), "positiveSubpatternOfNumberFormatPattern"), "numberPortionOfNumberFormatSubpattern");
  CFArrayAppendValue(Mutable, v6);
  CFRelease(v6);
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("¤%@"), v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("¤%@;- ¤%@"), v7, v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@¤"), v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@¤;- %@¤"), v7, v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("¤ %@"), v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("¤ %@;- ¤ %@"), v7, v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ ¤"), v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ ¤;- %@ ¤"), v7, v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("¤%@;¤-%@"), v7, v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("¤%@;¤ -%@"), v7, v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("¤%@;¤- %@"), v7, v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("¤%@;¤ - %@"), v7, v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("¤%@;(¤%@)"), v7, v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("¤%@;( ¤%@)"), v7, v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("¤%@;(¤%@)"), v7, v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("¤%@;(¤ %@)"), v7, v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("¤%@;( ¤ %@)"), v7, v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("¤%@;(¤ %@)"), v7, v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("¤%@;( ¤%@)"), v7, v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("¤%@;( ¤ %@)"), v7, v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("¤%@;¤(%@)"), v7, v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("¤%@;¤( %@)"), v7, v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("¤%@;¤(%@)"), v7, v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("¤%@;¤ (%@)"), v7, v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("¤%@;¤(%@)"), v7, v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("¤%@;¤ (%@)"), v7, v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("¤%@;¤( %@)"), v7, v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("¤%@;¤(%@)"), v7, v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@¤;(%@¤)"), v7, v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@¤;( %@¤)"), v7, v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@¤;(%@¤)"), v7, v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@¤;(%@ ¤)"), v7, v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@¤;( %@ ¤)"), v7, v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@¤;(%@ ¤)"), v7, v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@¤;( %@¤)"), v7, v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@¤;( %@ ¤)"), v7, v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@¤;(%@)¤"), v7, v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@¤;( %@)¤"), v7, v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@¤;(%@)¤"), v7, v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@¤;(%@) ¤"), v7, v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@¤;( %@) ¤"), v7, v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@¤;(%@) ¤"), v7, v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@¤;( %@)¤"), v7, v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@¤;( %@) ¤"), v7, v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("¤%@;¤%@-"), v7, v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("¤%@;¤%@ -"), v7, v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("¤%@;¤ %@-"), v7, v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("¤%@;¤ %@ -"), v7, v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@¤;%@¤-"), v7, v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@¤;%@¤ -"), v7, v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@¤;%@ ¤-"), v7, v7));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@¤;%@ ¤ -"), v7, v7));
  Count = CFArrayGetCount(a2);
  if (Count >= 1)
  {
    v9 = Count;
    for (i = 0; i != v9; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a2, i);
      v12 = TSUCreateArrayOfCurrencyFormattersForCurrencyCode(a1, (const __CFArray *)v5, ValueAtIndex);
      v14.length = CFArrayGetCount(v12);
      v14.location = 0;
      CFArrayAppendArray(Mutable, v12, v14);
      CFRelease(v12);
    }
  }

  return Mutable;
}

__CFArray *TSUCreateArrayOfPercentageFormattersForLocale(const __CFLocale *a1)
{
  __CFArray *Mutable;
  __CFNumberFormatter *v3;
  const __CFString *v4;
  __CFNumberFormatter *v5;
  __CFNumberFormatter *v6;

  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  v3 = CFNumberFormatterCreate(0, a1, kCFNumberFormatterPercentStyle);
  v4 = (const __CFString *)*MEMORY[0x24BDBD470];
  CFNumberFormatterSetProperty(v3, (CFNumberFormatterKey)*MEMORY[0x24BDBD470], CFSTR("xyzzyqghbv&q"));
  CFArrayAppendValue(Mutable, v3);
  CFRelease(v3);
  v5 = CFNumberFormatterCreate(0, a1, kCFNumberFormatterNoStyle);
  CFNumberFormatterSetFormat(v5, CFSTR("#,##0 %"));
  CFNumberFormatterSetProperty(v5, v4, CFSTR("xyzzyqghbv&q"));
  CFArrayAppendValue(Mutable, v5);
  CFRelease(v5);
  v6 = CFNumberFormatterCreate(0, a1, kCFNumberFormatterNoStyle);
  CFNumberFormatterSetFormat(v6, CFSTR("#,##0%"));
  CFNumberFormatterSetProperty(v6, v4, CFSTR("xyzzyqghbv&q"));
  CFArrayAppendValue(Mutable, v6);
  CFRelease(v6);
  return Mutable;
}

CFArrayRef TSUCreateArrayOfScientificFormattersForLocale(CFLocaleRef locale)
{
  CFArrayRef v1;
  void *values;

  values = CFNumberFormatterCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], locale, kCFNumberFormatterScientificStyle);
  v1 = CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x24BDBD690]);
  CFRelease(values);
  return v1;
}

uint64_t TSUImprovedCFNumberFormatterGetValueFromString(__CFNumberFormatter *a1, CFStringRef theString, double *a3)
{
  int ValueFromString;
  CFIndex length;
  int v8;
  uint64_t result;
  CFRange v10;

  v10.location = 0;
  v10.length = CFStringGetLength(theString);
  ValueFromString = CFNumberFormatterGetValueFromString(a1, theString, &v10, kCFNumberDoubleType, a3);
  if (a3 && ValueFromString)
  {
    if (v10.location || (length = v10.length, length != CFStringGetLength(theString)))
    {
      result = 0;
    }
    else
    {
      v8 = __fpclassifyd(*a3);
      result = 1;
      if (v8 != 3)
        return result;
    }
LABEL_10:
    *a3 = 0.0;
    return result;
  }
  result = 0;
  if (a3)
    goto LABEL_10;
  return result;
}

uint64_t TSUGetNumberValueAndTypeFromString(const __CFString *a1, uint64_t a2, uint64_t a3, int *a4, _QWORD *a5, uint64_t a6)
{
  return TSUGetNumberValueAndTypeFromStringWithCurrencyCode(a1, 0, a2, a3, a4, a5, a6);
}

uint64_t TSUGetNumberValueAndTypeFromStringWithCurrencyCode(const __CFString *a1, uint64_t a2, uint64_t a3, uint64_t a4, int *a5, _QWORD *a6, uint64_t a7)
{
  id v13;
  __CFString *MutableCopy;
  void *v15;
  uint64_t v16;
  int v17;

  if (a1)
  {
    if (a5)
      *a5 = -999;
    v13 = +[TSUNumberFormatter formatterForLocale:](TSUNumberFormatter, "formatterForLocale:");
    MutableCopy = CFStringCreateMutableCopy(0, 0, a1);
    CFStringTransform(MutableCopy, 0, (CFStringRef)*MEMORY[0x24BDBD608], 0);
    v15 = (void *)-[__CFString newStringBySubstitutingCharactersCFNumberFormatterDoesntUnderstand](MutableCopy, "newStringBySubstitutingCharactersCFNumberFormatterDoesntUnderstand");
    CFRelease(MutableCopy);
    if (objc_msgSend(v13, "decimalFromString:value:formatString:", v15, a4, a6))
    {
      if (a5)
        *a5 = 0;
      goto LABEL_18;
    }
    if (objc_msgSend(v13, "currencyFromString:additionalCurrencyCode:value:formatString:currencyCode:", v15, a2, a4, a6, a7))
    {
      v16 = 1;
      if (a5)
        *a5 = 1;
      goto LABEL_19;
    }
    if (objc_msgSend(v13, "percentageFromString:value:formatString:", v15, a4, a6))
    {
      if (a5)
      {
        v17 = 2;
LABEL_17:
        *a5 = v17;
      }
    }
    else if (objc_msgSend(v13, "scientificFromString:value:formatString:", v15, a4, a6))
    {
      if (a5)
      {
        v17 = 3;
        goto LABEL_17;
      }
    }
    else
    {
      if (!objc_msgSend(v13, "fractionFromString:value:", v15, a4))
      {
        v16 = 0;
        goto LABEL_19;
      }
      if (a5)
        *a5 = 4;
      if (a6)
        *a6 = 0;
    }
LABEL_18:
    v16 = 1;
LABEL_19:

    return v16;
  }
  return 0;
}

const __CFString *TSUNumberFormatterStringFromValueType(unsigned int a1)
{
  if (a1 > 5)
    return CFSTR("unknown");
  else
    return off_24D61AD80[a1];
}

const __CFString *TSUNumberFormatterStringFromNegativeStyle(unsigned int a1)
{
  if (a1 > 4)
    return CFSTR("unknown");
  else
    return off_24D61ADB0[a1];
}

__CFString *TSUNumberFormatterStringFromFractionAccuracy(uint64_t a1)
{
  if (a1 <= 0xFFFFFFFC)
    return (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("1/%d"), a1);
  else
    return off_24D61ADD8[(int)a1 + 3];
}

void *TSUNumberFormatterStringByUnescapingFormatString(void *a1)
{
  unint64_t v2;
  void *v3;
  unint64_t v4;
  unsigned int v5;
  unsigned int v6;
  unint64_t v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  int v11;

  v2 = objc_msgSend(a1, "length");
  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", v2);
  if (v2)
  {
    v4 = 0;
    while (1)
    {
      v5 = objc_msgSend(a1, "characterAtIndex:", v4);
      v6 = v5;
      v7 = v4 + 1;
      if (v4 + 1 >= v2)
      {
        if (v5 != 39)
LABEL_16:
          objc_msgSend(v3, "appendFormat:", CFSTR("%C"), v6);
        ++v4;
        goto LABEL_18;
      }
      v8 = objc_msgSend(a1, "characterAtIndex:", v4 + 1);
      if (v6 != 39)
        goto LABEL_16;
      if (v8 != 39)
        break;
      objc_msgSend(v3, "appendString:", CFSTR("'"));
      v4 += 2;
LABEL_18:
      if (v4 >= v2)
        return v3;
    }
    while (1)
    {
      v9 = objc_msgSend(a1, "characterAtIndex:", v7);
      v10 = v9;
      v4 = v7 + 1;
      if (v7 + 1 >= v2)
      {
        if (v9 == 39)
          goto LABEL_18;
      }
      else
      {
        v11 = objc_msgSend(a1, "characterAtIndex:", v7 + 1);
        if (v10 == 39)
        {
          if (v11 != 39)
            goto LABEL_18;
          objc_msgSend(v3, "appendString:", CFSTR("'"));
          v4 = v7 + 2;
          goto LABEL_13;
        }
      }
      objc_msgSend(v3, "appendFormat:", CFSTR("%C"), v10);
LABEL_13:
      v7 = v4;
      if (v4 >= v2)
        goto LABEL_18;
    }
  }
  return v3;
}

const __CFString *TSUNumberFormatterDisplayNSStringForFractionAccuracy(int a1)
{
  const __CFString *v1;

  v1 = CFSTR("Up to 1 digit (7/8)");
  switch(a1)
  {
    case -3:
      v1 = CFSTR("Up to 3 digits (445/553)");
      return (const __CFString *)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", v1, &stru_24D61C228, CFSTR("TSUtility"));
    case -2:
      v1 = CFSTR("Up to 2 digits (23/24)");
      return (const __CFString *)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", v1, &stru_24D61C228, CFSTR("TSUtility"));
    case -1:
      return (const __CFString *)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", v1, &stru_24D61C228, CFSTR("TSUtility"));
    case 0:
      v1 = CFSTR("Conflicting");
      return (const __CFString *)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", v1, &stru_24D61C228, CFSTR("TSUtility"));
    case 1:
    case 3:
    case 5:
    case 6:
    case 7:
    case 9:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
      return CFSTR("Unknown TSU fraction type");
    case 2:
      v1 = CFSTR("Halves");
      return (const __CFString *)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", v1, &stru_24D61C228, CFSTR("TSUtility"));
    case 4:
      v1 = CFSTR("Quarters");
      return (const __CFString *)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", v1, &stru_24D61C228, CFSTR("TSUtility"));
    case 8:
      v1 = CFSTR("Eighths");
      return (const __CFString *)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", v1, &stru_24D61C228, CFSTR("TSUtility"));
    case 10:
      v1 = CFSTR("Tenths");
      return (const __CFString *)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", v1, &stru_24D61C228, CFSTR("TSUtility"));
    case 16:
      v1 = CFSTR("Sixteenths");
      return (const __CFString *)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", v1, &stru_24D61C228, CFSTR("TSUtility"));
    default:
      if (a1 != 100)
        return CFSTR("Unknown TSU fraction type");
      v1 = CFSTR("Hundredths");
      return (const __CFString *)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", v1, &stru_24D61C228, CFSTR("TSUtility"));
  }
}

void sub_216D61094(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x216D61050);
}

void sub_216D61BF4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_216D61CBC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_216D61DB4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_216D61E2C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_216D61E90(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_216D61EF4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void *TSUSpecificCast(uint64_t a1, void *a2)
{
  if (!a2)
    return 0;
  if (objc_msgSend(a2, "isMemberOfClass:", a1))
    return a2;
  return 0;
}

void *TSUProtocolCast(uint64_t a1, void *a2)
{
  if (!a2)
    return 0;
  if (objc_msgSend(a2, "conformsToProtocol:", a1))
    return a2;
  return 0;
}

void *TSUClassAndProtocolCast(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;
  uint64_t *v11;
  uint64_t *v13;

  v9 = a1;
  if (a1)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return 0;
    v13 = &a9;
    if (a3)
    {
      while (1)
      {
        v11 = v13++;
        if ((objc_msgSend(v9, "conformsToProtocol:", *v11) & 1) == 0)
          break;
        if (!--a3)
          return v9;
      }
      return 0;
    }
  }
  return v9;
}

CFTypeRef TSUCFTypeCast(uint64_t a1, CFTypeRef cf)
{
  if (!cf)
    return 0;
  if (CFGetTypeID(cf) == a1)
    return cf;
  return 0;
}

uint64_t TSUCheckedDynamicCast(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;
  uint64_t v4;

  v2 = a2;
  if (a2 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v3 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "id TSUCheckedDynamicCast(Class, id<NSObject>)");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUCast.m"), 94, CFSTR("Unexpected object type in checked dynamic cast"));
    return 0;
  }
  return v2;
}

uint64_t TSUCheckedStaticCast(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;

  if (a2 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v3 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "id TSUCheckedStaticCast(Class, id<NSObject>)");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUCast.m"), 105, CFSTR("Unexpected object type in checked static cast.  This is a serious problem and could lead to a crash, or worse."));
  }
  return a2;
}

void *TSUCheckedProtocolCast(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;

  v2 = a2;
  if (a2 && (objc_msgSend(a2, "conformsToProtocol:", a1) & 1) == 0)
  {
    v3 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "id TSUCheckedProtocolCast(Protocol *, id<NSObject>)");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUCast.m"), 116, CFSTR("Unexpected object type in checked protocol cast"));
    return 0;
  }
  return v2;
}

void *TSUCheckedStaticProtocolCast(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  if (a2 && (objc_msgSend(a2, "conformsToProtocol:", a1) & 1) == 0)
  {
    v3 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "id TSUCheckedStaticProtocolCast(Protocol *, id<NSObject>)");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUCast.m"), 127, CFSTR("Unexpected object type in checked protocol cast. This is a serious problem and could lead to a crash, or worse."));
  }
  return a2;
}

void sub_216D640D8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

const __CFString *NSStringFromTSUError(int a1)
{
  const __CFString *result;
  const __CFString *v2;
  const __CFString *v3;

  if (a1 > 999)
  {
    v2 = CFSTR("Table has maximum number of cells");
    v3 = CFSTR("Table ID already used by another table registered with the calc engine");
    if (a1 != 1002)
      v3 = 0;
    if (a1 != 1001)
      v2 = v3;
    if (a1 == 1000)
      return CFSTR("Table cell is undefined");
    else
      return v2;
  }
  else
  {
    switch(a1)
    {
      case 0:
        result = CFSTR("No error");
        break;
      case 1:
        result = CFSTR("Unspecified error");
        break;
      case 2:
        result = CFSTR("Not found");
        break;
      case 3:
        result = CFSTR("Argument out of bounds");
        break;
      case 4:
        result = CFSTR("Function not implemented");
        break;
      default:
        result = 0;
        break;
    }
  }
  return result;
}

void TSULogErrorInMethod(const char *a1, objc_class *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v14;
  id v15;
  uint64_t v16;
  void *v17;
  NSString *v18;
  NSString *v19;

  v14 = (objc_class *)objc_opt_class();
  v15 = objc_alloc(MEMORY[0x24BDD17C8]);
  v18 = NSStringFromClass(v14);
  v19 = NSStringFromSelector(a1);
  v16 = 45;
  if (v14 == a2)
    v16 = 43;
  v17 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("%c[%@ %@]"), v16, v18, v19);
  TSULogErrorInLocation((uint64_t)v17, a3, a4, a5, (uint64_t)&a9);

}

void TSULogErrorInLocation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v8;
  uint64_t v9;
  id v10;

  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", a4, a5);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", a2);
  v9 = objc_msgSend(v8, "lastPathComponent");

  TSULogSink((uint64_t)CFSTR("Error"), (NSString *)CFSTR("*** Error: %@ %@:%ld %@"), a1, v9, a3, v10);
}

void TSULogErrorInFunction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v12;

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", a1);
  TSULogErrorInLocation((uint64_t)v12, a2, a3, a4, (uint64_t)&a9);

}

void TSULogBacktrace()
{
  TSULogSink((uint64_t)CFSTR("Error"), (NSString *)CFSTR("%@"), objc_msgSend(+[TSUBacktrace backtrace](TSUBacktrace, "backtrace"), "backtraceString"));
}

void TSULogOnceFn(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v11;
  _QWORD block[7];

  if (TSULogOnceFn_onceToken != -1)
    dispatch_once(&TSULogOnceFn_onceToken, &__block_literal_global_2);
  block[6] = &a9;
  v11 = objc_msgSend(MEMORY[0x24BDD17C8], "tsu_stringWithFormat:arguments:", a2, &a9);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __TSULogOnceFn_block_invoke_2;
  block[3] = &unk_24D61AE28;
  block[4] = a1;
  block[5] = v11;
  dispatch_sync((dispatch_queue_t)TSULogOnceFn_logOnceQueue, block);
}

unint64_t TSUNormalizeRanges(void *a1)
{
  unint64_t result;
  unsigned int v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t location;
  NSUInteger v7;
  NSUInteger length;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger i;
  NSRange v12;
  NSRange v13;
  NSRange v14;
  NSRange v15;
  NSRange v16;

  objc_msgSend(a1, "sortUsingFunction:context:", compareRangeValues, 0);
  result = objc_msgSend(a1, "count");
  if (result >= 2)
  {
    v3 = 0;
    v4 = 1;
    do
    {
      v5 = v3;
      v3 = v4;
      location = objc_msgSend((id)objc_msgSend(a1, "objectAtIndex:", v5), "rangeValue");
      length = v7;
LABEL_4:
      v9 = objc_msgSend((id)objc_msgSend(a1, "objectAtIndex:", v4), "rangeValue");
      for (i = v10; ; i = 0)
      {
        v13.location = location;
        v13.length = length;
        v15.location = v9;
        v15.length = i;
        if (!NSIntersectionRange(v13, v15).length)
          break;
        v14.location = location;
        v14.length = length;
        v16.location = v9;
        v16.length = i;
        v12 = NSUnionRange(v14, v16);
        location = v12.location;
        length = v12.length;
        objc_msgSend(a1, "replaceObjectAtIndex:withObject:", v5, objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v12.location, v12.length));
        objc_msgSend(a1, "removeObjectAtIndex:", v4);
        if (objc_msgSend(a1, "count") > v4)
          goto LABEL_4;
      }
      v4 = (v4 + 1);
      result = objc_msgSend(a1, "count");
    }
    while (result > v4);
  }
  return result;
}

uint64_t compareRangeValues(objc_object *a1, objc_object *a2, void *a3)
{
  unint64_t v4;
  unint64_t v5;

  v4 = -[objc_object rangeValue](a1, "rangeValue", a3);
  v5 = -[objc_object rangeValue](a2, "rangeValue");
  if (v4 < v5)
    return -1;
  else
    return v4 > v5;
}

void *TSUIntersectionLocations(void *a1, void *a2)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  void *v16;
  NSRange v17;
  void *v18;
  NSRange v20;
  NSRange v21;
  NSRange v22;
  NSRange v23;

  v4 = objc_msgSend(a1, "count");
  v5 = objc_msgSend(a2, "count");
  if (v4 <= v5)
    v6 = v5;
  else
    v6 = v4;
  v7 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v6);
  v8 = (void *)objc_msgSend(a1, "mutableCopy");
  v9 = (void *)objc_msgSend(a2, "mutableCopy");
  TSUNormalizeRanges(v8);
  TSUNormalizeRanges(v9);
  if (v4 && v5 && objc_msgSend(v8, "count"))
  {
    do
    {
      if (!objc_msgSend(v9, "count"))
        break;
      v10 = objc_msgSend((id)objc_msgSend(v8, "objectAtIndex:", 0), "rangeValue");
      v12 = v11;
      v13 = objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", 0), "rangeValue");
      v15 = v14;
      v20.location = v10;
      v20.length = v12;
      v22.location = v13;
      v22.length = v15;
      if (NSIntersectionRange(v20, v22).length)
      {
        v16 = (void *)MEMORY[0x24BDD1968];
        v21.location = v10;
        v21.length = v12;
        v23.location = v13;
        v23.length = v15;
        v17 = NSIntersectionRange(v21, v23);
        objc_msgSend(v7, "addObject:", objc_msgSend(v16, "valueWithRange:", v17.location, v17.length));
      }
      v18 = v10 >= v13 ? v9 : v8;
      objc_msgSend(v18, "removeObjectAtIndex:", 0);
    }
    while (objc_msgSend(v8, "count"));
  }

  return v7;
}

void *TSUUnionLocations(void *a1, void *a2)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  unint64_t v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger length;
  NSUInteger location;
  BOOL v20;
  NSRange v21;
  NSUInteger v22;
  NSRange v23;
  NSUInteger v24;
  NSRange v26;
  NSRange v27;
  NSRange v28;
  NSRange v29;
  NSRange v30;
  NSRange v31;
  NSRange v32;
  NSRange v33;

  v4 = objc_msgSend(a1, "count");
  v5 = objc_msgSend(a2, "count");
  if (v4 <= v5)
    v6 = v5;
  else
    v6 = v4;
  v7 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v6);
  v8 = (void *)objc_msgSend(a1, "mutableCopy");
  v9 = (void *)objc_msgSend(a2, "mutableCopy");
  TSUNormalizeRanges(v8);
  TSUNormalizeRanges(v9);
LABEL_5:
  if (objc_msgSend(v8, "count") && objc_msgSend(v9, "count"))
  {
    v10 = objc_msgSend((id)objc_msgSend(v8, "objectAtIndex:", 0), "rangeValue");
    v12 = v11;
    v13 = objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", 0), "rangeValue");
    v15 = v13;
    v16 = v14;
    if (v10 >= v13)
      v17 = v13;
    else
      v17 = v10;
    if (v10 >= v13)
      length = v14;
    else
      length = v12;
    while (1)
    {
      while (1)
      {
        if (!objc_msgSend(v8, "count") || !objc_msgSend(v9, "count"))
        {
LABEL_24:
          objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v17, length));
          goto LABEL_5;
        }
        v26.location = v10;
        v26.length = v12;
        v30.location = v17;
        v30.length = length;
        location = NSIntersectionRange(v26, v30).location;
        v20 = location != 0;
        if (location)
        {
          v27.location = v10;
          v27.length = v12;
          v31.location = v17;
          v31.length = length;
          v21 = NSUnionRange(v27, v31);
          v17 = v21.location;
          length = v21.length;
          objc_msgSend(v8, "removeObjectAtIndex:", 0);
          if (objc_msgSend(v8, "count"))
          {
            v10 = objc_msgSend((id)objc_msgSend(v8, "objectAtIndex:", 0), "rangeValue");
            v12 = v22;
          }
        }
        v28.location = v15;
        v28.length = v16;
        v32.location = v17;
        v32.length = length;
        if (NSIntersectionRange(v28, v32).location)
          break;
LABEL_21:
        if (!v20)
          goto LABEL_24;
      }
      v29.location = v15;
      v29.length = v16;
      v33.location = v17;
      v33.length = length;
      v23 = NSUnionRange(v29, v33);
      v17 = v23.location;
      length = v23.length;
      objc_msgSend(v9, "removeObjectAtIndex:", 0);
      if (!objc_msgSend(v9, "count"))
      {
        v20 = 1;
        goto LABEL_21;
      }
      v15 = objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", 0), "rangeValue");
      v16 = v24;
    }
  }
  objc_msgSend(v7, "addObjectsFromArray:", v8);
  objc_msgSend(v7, "addObjectsFromArray:", v9);

  return v7;
}

void *TSUComplementLocations(void *a1, void *a2)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  NSRange v17;
  NSRange v19;
  NSRange v20;

  v4 = objc_msgSend(a1, "count");
  v5 = objc_msgSend(a2, "count");
  if (v4 <= v5)
    v6 = v5;
  else
    v6 = v4;
  v7 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v6);
  v8 = (void *)objc_msgSend(a1, "mutableCopy");
  v9 = (void *)objc_msgSend(a2, "mutableCopy");
  TSUNormalizeRanges(v8);
  TSUNormalizeRanges(v9);
  v10 = objc_msgSend((id)objc_msgSend(v8, "objectAtIndex:", 0), "rangeValue");
  if (objc_msgSend(v8, "count"))
  {
    v11 = 0;
    do
    {
      if (!objc_msgSend(v9, "count"))
        break;
      v12 = objc_msgSend((id)objc_msgSend(v8, "objectAtIndex:", 0), "rangeValue");
      v14 = v13;
      v15 = objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", 0), "rangeValue");
      v20.length = v16;
      v19.location = v12;
      v19.length = v14;
      v20.location = v15;
      v17 = NSIntersectionRange(v19, v20);
      if (v17.location)
      {
        if (v17.location > v10)
          v11 = v17.location - v10;
        if (v11)
          objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v10, v11));
        if (v12 + v14 <= v17.location + v17.length)
          goto LABEL_16;
        objc_msgSend(v9, "removeObjectAtIndex:", 0);
        v11 = 0;
        v10 = v17.location + v17.length;
      }
      else
      {
        if (v15 > v12)
        {
          v11 = v12 + v14 - v10;
          objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", v10, v11));
LABEL_16:
          objc_msgSend(v8, "removeObjectAtIndex:", 0);
          if (objc_msgSend(v8, "count"))
          {
            v10 = objc_msgSend((id)objc_msgSend(v8, "objectAtIndex:", 0), "rangeValue");
            v11 = 0;
          }
          continue;
        }
        objc_msgSend(v9, "removeObjectAtIndex:", 0);
      }
    }
    while (objc_msgSend(v8, "count"));
  }

  return v7;
}

NSUInteger TSUIntersectionRangeWithEdge(NSRange a1, NSRange a2, int a3)
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v6;
  NSUInteger v7;
  NSRange v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;

  length = a2.length;
  location = a2.location;
  v6 = a1.length;
  v7 = a1.location;
  v8 = NSIntersectionRange(a1, a2);
  if (length)
    v9 = v6 == 0;
  else
    v9 = 1;
  if (v9)
    v10 = 0;
  else
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  if (v7 | location)
    v11 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v11 = v10;
  if (v8 == 0uLL)
    v12 = v11;
  else
    v12 = v8.location;
  if (location + length == v7)
    v13 = v7;
  else
    v13 = v12;
  if (v7 + v6 == location)
    v14 = location;
  else
    v14 = v13;
  if (a3)
    return v14;
  else
    return v12;
}

uint64_t TSUAdjustSelectionRangeForChangedRange(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v5;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  id v22;
  uint64_t v23;

  v5 = a1;
  if (a5)
  {
    if (a1 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
      v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSRange TSUAdjustSelectionRangeForChangedRange(NSRange, NSRange, NSInteger)");
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSURangeUtils.mm"), 280, CFSTR("Bad selectionRange passed to TSUAdjustSelectionRangeForChangedRange"));
      if (a3 != 0x7FFFFFFFFFFFFFFFLL)
        return 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_6;
    }
    if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_6:
      v9 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
      v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSRange TSUAdjustSelectionRangeForChangedRange(NSRange, NSRange, NSInteger)");
      v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSURangeUtils.mm");
      v12 = CFSTR("Bad changingRange passed to TSUAdjustSelectionRangeForChangedRange");
      v13 = v9;
      v14 = v10;
      v15 = 281;
LABEL_7:
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, v11, v15, v12);
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    if (-a4 > a5)
    {
      v18 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
      v19 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSRange TSUAdjustSelectionRangeForChangedRange(NSRange, NSRange, NSInteger)");
      v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSURangeUtils.mm");
      v12 = CFSTR("Bad delta passed to TSUAdjustSelectionRangeForChangedRange");
      v13 = v18;
      v14 = v19;
      v15 = 285;
      goto LABEL_7;
    }
    v20 = a1 + a2;
    if (a1 + a2 >= a3)
    {
      v21 = a3 + a4;
      if (a3 + a4 >= a1)
      {
        if ((a3 != a1 || a4 != a2) && (a1 > a3 || v20 < v21) && a3 <= a1)
        {
          if (v21 >= v20)
          {
            if (-a2 > a5 && a1 >= a4 + a5 + a3)
              return a4 + a5 + a3;
          }
          else
          {
            if (a1 <= a3)
            {
              v22 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
              v23 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSRange TSUAdjustSelectionRangeForChangedRange(NSRange, NSRange, NSInteger)");
              objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSURangeUtils.mm"), 326, CFSTR("expected selectionRange to start within changingRange"));
            }
            if (a3 > v5 + a5)
              return a3;
          }
        }
      }
      else
      {
        return a1 + a5;
      }
    }
  }
  return v5;
}

NSUInteger TSUUnionRangesIgnoringInvalid(NSRange a1, NSRange a2)
{
  if (a1.location != TSUInvalidRange || a1.length != *(_QWORD *)algn_254E51AE8)
  {
    if (a2.location != TSUInvalidRange || a2.length != *(_QWORD *)algn_254E51AE8)
      return NSUnionRange(a1, a2).location;
    a2.location = a1.location;
  }
  return a2.location;
}

uint64_t TSUCFUUIDEqual(const __CFUUID *a1, const __CFUUID *a2)
{
  CFUUIDBytes v3;
  CFUUIDBytes v4;
  _BOOL4 v6;

  if (a1 == a2)
    return 1;
  if (!a1 && a2)
    return 0;
  if (a1 && !a2)
    return 0;
  v3 = CFUUIDGetUUIDBytes(a1);
  v4 = CFUUIDGetUUIDBytes(a2);
  if (((*(_QWORD *)&v4.byte0 ^ *(_QWORD *)&v3.byte0) & 0xFFFFFFFFFFFFLL) != 0
    || ((*(_QWORD *)&v4.byte0 ^ *(_QWORD *)&v3.byte0) & 0xFF000000000000) != 0)
  {
    return 0;
  }
  v6 = ((*(_QWORD *)&v4.byte8 ^ *(_QWORD *)&v3.byte8) & 0xFFFFFFFFFFFFFFLL) == 0
    && HIBYTE(*(_QWORD *)&v3.byte8) == HIBYTE(*(_QWORD *)&v4.byte8);
  return HIBYTE(*(_QWORD *)&v3.byte0) == HIBYTE(*(_QWORD *)&v4.byte0) && v6;
}

void TSUCopyCFStringIntoStdString(CFStringRef theString, uint64_t a2)
{
  _BYTE v3[256];
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  TSUUTF8Converter<256>::TSUUTF8Converter((uint64_t)v3, theString);
  MEMORY[0x219A01EA0](a2, v5);
  if (v4)
    free(v4);
}

void sub_216D66520(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,void *a42)
{
  if (a42)
    free(a42);
  _Unwind_Resume(exception_object);
}

uint64_t TSUUTF8Converter<256>::TSUUTF8Converter(uint64_t a1, CFStringRef theString)
{
  const char *CStringPtr;
  uint64_t Length;
  UInt8 *v6;
  CFIndex usedBufLen;
  CFIndex maxBufLen;
  CFRange v10;
  CFRange v11;
  CFRange v12;

  *(_QWORD *)(a1 + 256) = 0;
  *(_QWORD *)(a1 + 264) = 0;
  CStringPtr = CFStringGetCStringPtr(theString, 0x8000100u);
  *(_QWORD *)(a1 + 264) = CStringPtr;
  if (!CStringPtr)
  {
    maxBufLen = 0;
    Length = CFStringGetLength(theString);
    if (Length <= 62
      && (v10.location = 0,
          v10.length = Length,
          CFStringGetBytes(theString, v10, 0x8000100u, 0, 0, (UInt8 *)a1, 255, &maxBufLen) == Length))
    {
      *(_BYTE *)(a1 + maxBufLen) = 0;
      *(_QWORD *)(a1 + 264) = a1;
    }
    else if (!*(_QWORD *)(a1 + 264))
    {
      maxBufLen = 0;
      v11.location = 0;
      v11.length = Length;
      if (CFStringGetBytes(theString, v11, 0x8000100u, 0, 0, 0, 0, &maxBufLen) == Length)
      {
        v6 = (UInt8 *)malloc_type_malloc(maxBufLen + 1, 0x2E3AE026uLL);
        *(_QWORD *)(a1 + 256) = v6;
        if (v6)
        {
          usedBufLen = 0;
          v12.location = 0;
          v12.length = Length;
          CFStringGetBytes(theString, v12, 0x8000100u, 0, 0, v6, maxBufLen, &usedBufLen);
          if (usedBufLen == maxBufLen)
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 256) + usedBufLen) = 0;
            *(_QWORD *)(a1 + 264) = *(_QWORD *)(a1 + 256);
          }
        }
      }
    }
  }
  return a1;
}

BOOL TSUHandleSqlite(int a1, _QWORD *a2, void *a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;

  if (a1)
  {
    v14 = a6
        ? (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", a6, &a9)
        : CFSTR("SQLite error");
    if (a1 != 101)
      sqlite3_errmsg((sqlite3 *)objc_msgSend(a3, "_sqliteDatabase"));
    TSULogErrorInMethod(a4, (objc_class *)a3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDatabase.m", a5, (uint64_t)CFSTR("%@: %s (%d)"), a6, a7, a8, (uint64_t)v14);
    if (a2)
    {
      if (!*a2)
      {
        v15 = 0;
        if (a1 > 265)
        {
          if (a1 == 266 || a1 == 522)
            goto LABEL_19;
          if (a1 != 778)
            goto LABEL_21;
        }
        else
        {
          if (a1 > 0x19)
          {
LABEL_21:
            *a2 = objc_msgSend(MEMORY[0x24BDD1540], "tsuErrorWithCode:", v15);
            return a1 == 0;
          }
          if (((1 << a1) & 0x27A0000) != 0)
          {
            v16 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", 0);
            v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL TSUHandleSqlite(int, NSError **, TSUDatabase *, SEL, long, NSString *, ...)");
            objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDatabase.m"), 415, CFSTR("SQLite misused"));
            v15 = 0;
            goto LABEL_21;
          }
          if (a1 != 13)
          {
            if (a1 != 14)
              goto LABEL_21;
LABEL_19:
            v15 = 1;
            goto LABEL_21;
          }
        }
        v15 = 2;
        goto LABEL_21;
      }
    }
  }
  return a1 == 0;
}

void sub_216D69DB4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id TSUCFArrayShortDescription(const __CFArray *a1)
{
  return -[TSUDescription descriptionString](+[TSUDescription descriptionWithCFType:format:](TSUDescription, "descriptionWithCFType:format:", a1, CFSTR("; count=%ld"),
             CFArrayGetCount(a1)),
           "descriptionString");
}

uint64_t TSUCFArrayDescription(const __CFArray *a1)
{
  TSUDescription *v2;
  CFIndex v3;

  v2 = +[TSUDescription descriptionWithCFType:format:](TSUDescription, "descriptionWithCFType:format:", a1, CFSTR("; count=%ld"),
         CFArrayGetCount(a1));
  if (CFArrayGetCount(a1) >= 1)
  {
    v3 = 0;
    do
    {
      -[TSUDescription addField:format:](v2, "addField:format:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%d]"), v3), CFSTR("%@"), CFArrayGetValueAtIndex(a1, v3));
      ++v3;
    }
    while (CFArrayGetCount(a1) > v3);
  }
  -[TSUDescription setFieldOptionCommaSeparated](v2, "setFieldOptionCommaSeparated");
  return (uint64_t)-[TSUDescription descriptionString](v2, "descriptionString");
}

uint64_t TSUCFDictionaryDescription(const __CFDictionary *a1)
{
  TSUDescription *v2;

  v2 = +[TSUDescription descriptionWithCFType:format:](TSUDescription, "descriptionWithCFType:format:", a1, &stru_24D61C228);
  CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)CFDictionaryDescriptionApplierFunction, v2);
  return (uint64_t)-[TSUDescription descriptionString](v2, "descriptionString");
}

uint64_t CFDictionaryDescriptionApplierFunction(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "addField:format:", a1, CFSTR("%@"), a2);
}

const __CFString *TSUObjectReferenceDescription(void *a1)
{
  const char *ClassName;
  int v3;
  void *v4;
  const char *v5;
  uint64_t v7;

  if (!a1)
    return CFSTR("<nil>");
  ClassName = object_getClassName(a1);
  v3 = strcmp(ClassName, "NSCFArray");
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = object_getClassName(a1);
  if (v3)
    return (const __CFString *)objc_msgSend(v4, "stringWithFormat:", CFSTR("(%s*)%p"), v5, a1, v7);
  else
    return (const __CFString *)objc_msgSend(v4, "stringWithFormat:", CFSTR("(%s*)%p; count=%ld"),
                                 v5,
                                 a1,
                                 CFArrayGetCount((CFArrayRef)a1));
}

const __CFString *TSUCGColorDescription(CGColor *a1)
{
  CGColorSpace *ColorSpace;
  size_t NumberOfComponents;
  CGColorSpaceModel Model;
  const CGFloat *v5;
  uint64_t v6;
  __CFString *v7;
  const CGFloat *Components;
  __CFString *v9;
  uint64_t v11;
  uint64_t v12;

  if (!a1)
    return CFSTR("CGColor(NULL)");
  ColorSpace = CGColorGetColorSpace(a1);
  NumberOfComponents = CGColorGetNumberOfComponents(a1);
  Model = CGColorSpaceGetModel(ColorSpace);
  if (Model == kCGColorSpaceModelRGB)
  {
    if (NumberOfComponents != 4)
    {
LABEL_10:
      v7 = (__CFString *)CFCopyDescription(a1);
      v9 = v7;
      return v7;
    }
    Components = CGColorGetComponents(a1);
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CGColor(%p) RGB (%g %g %g %g)"), a1, *(_QWORD *)Components, *((_QWORD *)Components + 1), *((_QWORD *)Components + 2), *((_QWORD *)Components + 3));
  }
  else
  {
    if (Model || NumberOfComponents != 2)
      goto LABEL_10;
    v5 = CGColorGetComponents(a1);
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CGColor(%p) Gray (%g %g)"), a1, *(_QWORD *)v5, *((_QWORD *)v5 + 1), v11, v12);
  }
  v7 = (__CFString *)v6;
  if (!v6)
    goto LABEL_10;
  return v7;
}

void *TSUStringArrayFromBitFields(void *a1, unint64_t a2)
{
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  if (objc_msgSend(a1, "count"))
  {
    v5 = 0;
    do
    {
      v6 = (void *)objc_msgSend(a1, "objectAtIndex:", v5);
      if (objc_msgSend(v6, "count"))
      {
        if (((a2 >> v5) & 1) >= objc_msgSend(v6, "count"))
          v7 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<Bad Value: %lu>"), (a2 >> v5) & 1);
        else
          v7 = (void *)objc_msgSend(v6, "objectAtIndex:", (a2 >> v5) & 1);
        v8 = v7;
        if (objc_msgSend(v7, "length"))
          objc_msgSend(v4, "addObject:", v8);
      }
      ++v5;
    }
    while (v5 < objc_msgSend(a1, "count"));
  }
  return v4;
}

BOOL TSUCGColorEqualToColorWithFloatTolerance(CGColor *a1, CGColor *a2)
{
  CGColorSpaceRef ColorSpace;
  CGColorSpaceRef v5;
  size_t NumberOfComponents;
  const CGFloat *Components;
  const CGFloat *v8;
  size_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v15;
  _BOOL8 v16;

  ColorSpace = CGColorGetColorSpace(a1);
  v5 = CGColorGetColorSpace(a2);
  if (!CFEqual(ColorSpace, v5))
    return CGColorEqualToColor(a1, a2);
  NumberOfComponents = CGColorGetNumberOfComponents(a1);
  Components = CGColorGetComponents(a1);
  v8 = CGColorGetComponents(a2);
  if (!NumberOfComponents)
    return 1;
  v9 = NumberOfComponents - 1;
  do
  {
    v10 = *Components++;
    v11 = v10;
    v12 = *v8++;
    v13 = vabdd_f64(v11, v12);
    v15 = v9-- != 0;
    v16 = v13 < 0.00999999978;
  }
  while (v13 < 0.00999999978 && v15);
  return v16;
}

uint64_t TSUGenericRGBColorSpace()
{
  if (TSUGenericRGBColorSpace_sGenericRGBDispatchOnce != -1)
    dispatch_once(&TSUGenericRGBColorSpace_sGenericRGBDispatchOnce, &__block_literal_global_3);
  return TSUGenericRGBColorSpace_sGenericRGBColorSpace;
}

uint64_t TSUGenericCMYKColorSpace()
{
  if (TSUGenericCMYKColorSpace_sGenericCMYKDispatchOnce != -1)
    dispatch_once(&TSUGenericCMYKColorSpace_sGenericCMYKDispatchOnce, &__block_literal_global_4);
  return TSUGenericCMYKColorSpace_sGenericCMYKColorSpace;
}

uint64_t TSUGenericGrayColorSpace()
{
  if (TSUGenericGrayColorSpace_sGenericGrayDispatchOnce != -1)
    dispatch_once(&TSUGenericGrayColorSpace_sGenericGrayDispatchOnce, &__block_literal_global_5);
  return TSUGenericGrayColorSpace_sGenericGrayColorSpace;
}

uint64_t TSUSRGBColorSpace()
{
  if (TSUSRGBColorSpace_sSRGBDispatchOnce != -1)
    dispatch_once(&TSUSRGBColorSpace_sSRGBDispatchOnce, &__block_literal_global_6);
  return TSUSRGBColorSpace_sSRGBColorSpace;
}

uint64_t TSUP3ColorSpace()
{
  if (TSUP3ColorSpace_sP3DispatchOnce != -1)
    dispatch_once(&TSUP3ColorSpace_sP3DispatchOnce, &__block_literal_global_7);
  return TSUP3ColorSpace_sP3ColorSpace;
}

CGImageRef TSUCGImageCreateCopyByApplyingGenericColorSpaceIfNeeded(CGImageRef image, const __CFDictionary *a2)
{
  const __CFString *Value;
  const __CFString *v5;
  uint64_t *v6;
  CGImageRef result;

  if (!a2)
    return CGImageRetain(image);
  if ((TSUCGImagePropertiesIncludeColorSpace(a2) & 1) != 0)
    return CGImageRetain(image);
  Value = (const __CFString *)CFDictionaryGetValue(a2, (const void *)*MEMORY[0x24BDD92D0]);
  if (!Value)
    return CGImageRetain(image);
  v5 = Value;
  if (CFStringCompare(Value, (CFStringRef)*MEMORY[0x24BDD92E8], 0))
  {
    if (CFStringCompare(v5, (CFStringRef)*MEMORY[0x24BDD92D8], 0))
    {
      if (CFStringCompare(v5, (CFStringRef)*MEMORY[0x24BDD92E0], 0))
        return CGImageRetain(image);
      if (TSUGenericGrayColorSpace_sGenericGrayDispatchOnce != -1)
        dispatch_once(&TSUGenericGrayColorSpace_sGenericGrayDispatchOnce, &__block_literal_global_5);
      v6 = &TSUGenericGrayColorSpace_sGenericGrayColorSpace;
    }
    else
    {
      if (TSUGenericCMYKColorSpace_sGenericCMYKDispatchOnce != -1)
        dispatch_once(&TSUGenericCMYKColorSpace_sGenericCMYKDispatchOnce, &__block_literal_global_4);
      v6 = &TSUGenericCMYKColorSpace_sGenericCMYKColorSpace;
    }
  }
  else
  {
    if (TSUGenericRGBColorSpace_sGenericRGBDispatchOnce != -1)
      dispatch_once(&TSUGenericRGBColorSpace_sGenericRGBDispatchOnce, &__block_literal_global_3);
    v6 = &TSUGenericRGBColorSpace_sGenericRGBColorSpace;
  }
  if (!*v6)
    return CGImageRetain(image);
  result = CGImageCreateCopyWithColorSpace(image, (CGColorSpaceRef)*v6);
  if (!result)
    return CGImageRetain(image);
  return result;
}

const __CFDictionary *TSUCGImagePropertiesIncludeColorSpace(const __CFDictionary *result)
{
  if (result)
  {
    result = (const __CFDictionary *)CFDictionaryGetValue(result, (const void *)*MEMORY[0x24BDD96D0]);
    if (result)
      return (const __CFDictionary *)(CFStringGetLength((CFStringRef)result) > 0);
  }
  return result;
}

CGColorRef TSUCGColorCreateWithUIColor(void *a1)
{
  return CGColorCreateCopy((CGColorRef)objc_msgSend(a1, "CGColor"));
}

CGColorRef TSUCGColorCreateDeviceRGB(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  CGFloat components[5];

  components[4] = *(CGFloat *)MEMORY[0x24BDAC8D0];
  components[0] = a1;
  components[1] = a2;
  components[2] = a3;
  components[3] = a4;
  if (TSUDeviceRGBColorSpace_sDeviceRGBDispatchOnce != -1)
    dispatch_once(&TSUDeviceRGBColorSpace_sDeviceRGBDispatchOnce, &__block_literal_global_3);
  return CGColorCreate((CGColorSpaceRef)TSUDeviceRGBColorSpace_sDeviceRGBColorSpace, components);
}

CGColorRef TSUCGColorCreateDeviceGray(CGFloat a1, CGFloat a2)
{
  CGFloat components[3];

  components[2] = *(CGFloat *)MEMORY[0x24BDAC8D0];
  components[0] = a1;
  components[1] = a2;
  if (TSUDeviceGrayColorSpace_sDeviceGrayDispatchOnce != -1)
    dispatch_once(&TSUDeviceGrayColorSpace_sDeviceGrayDispatchOnce, &__block_literal_global_2);
  return CGColorCreate((CGColorSpaceRef)TSUDeviceGrayColorSpace_sDeviceGrayColorSpace, components);
}

CGColorRef TSUCGColorCreateRandomRGB()
{
  double v0;
  double v1;
  double v2;

  v0 = TSURandom();
  v1 = TSURandom();
  v2 = TSURandom();
  return TSUCGColorCreateDeviceRGB(v0, v1, v2, 1.0);
}

CGPatternRef TSUCGPatternCreateWithImageAndTransform(CGImageRef image, __int128 *a2)
{
  id v4;
  uint64_t v5;
  CGFloat v6;
  CGFloat v7;
  size_t Width;
  size_t Height;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  CGAffineTransform v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  CGRect v18;

  if (!image)
  {
    v4 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CGPatternRef TSUCGPatternCreateWithImageAndTransform(CGImageRef, const CGAffineTransform *)");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUColorUtils.m"), 227, CFSTR("can't create an image pattern without an image"));
  }
  CGImageRetain(image);
  v6 = *MEMORY[0x24BDBEFB0];
  v7 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  Width = CGImageGetWidth(image);
  Height = CGImageGetHeight(image);
  if (a2)
  {
    v10 = a2[1];
    v15 = *a2;
    v16 = v10;
    v11 = a2[2];
  }
  else
  {
    v12 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    v15 = *MEMORY[0x24BDBD8B8];
    v16 = v12;
    v11 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  }
  v17 = v11;
  v18.size.height = (double)Height;
  v18.size.width = (double)Width;
  *(_OWORD *)&v14.a = v15;
  *(_OWORD *)&v14.c = v16;
  *(_OWORD *)&v14.tx = v11;
  v18.origin.x = v6;
  v18.origin.y = v7;
  return CGPatternCreate(image, v18, &v14, (double)Width, v18.size.height, kCGPatternTilingConstantSpacing, 1, &TSUCGPatternCreateWithImageAndTransform_sCallbacks);
}

void TSUDrawImageAtOriginInContext(CGImage *a1, CGContext *a2)
{
  CGFloat v4;
  CGFloat v5;
  CGFloat Width;
  CGRect v7;

  v4 = *MEMORY[0x24BDBEFB0];
  v5 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  Width = (double)CGImageGetWidth(a1);
  v7.size.height = (double)CGImageGetHeight(a1);
  v7.origin.x = v4;
  v7.origin.y = v5;
  v7.size.width = Width;
  CGContextDrawImage(a2, v7, a1);
}

CGPatternRef TSUCGPatternCreateWithImage(CGImage *a1)
{
  return TSUCGPatternCreateWithImageAndTransform(a1, 0);
}

CGColorRef TSUCGColorCreatePatternWithImageAndTransform(CGImage *a1, __int128 *a2)
{
  CGPattern *v2;
  CGColorSpace *Pattern;
  CGColorRef v4;
  CGFloat v6[2];

  v6[1] = *(CGFloat *)MEMORY[0x24BDAC8D0];
  v2 = TSUCGPatternCreateWithImageAndTransform(a1, a2);
  Pattern = CGColorSpaceCreatePattern(0);
  v6[0] = 1.0;
  v4 = CGColorCreateWithPattern(Pattern, v2, v6);
  CGColorSpaceRelease(Pattern);
  CGPatternRelease(v2);
  return v4;
}

CGColorRef TSUCGColorCreatePatternWithImage(CGImage *a1)
{
  return TSUCGColorCreatePatternWithImageAndTransform(a1, 0);
}

CGColorRef TSUCreateCGColorFromHSBInColorSpace(CGColorSpace *a1, double a2, double a3, double a4, double a5)
{
  CGFloat components;
  double v8;
  double v9[3];

  v9[2] = *(double *)MEMORY[0x24BDAC8D0];
  v9[1] = a5;
  TSUHSBToRGB(&components, &v8, v9, a2, a3, a4);
  if (!a1)
  {
    if (TSUDeviceRGBColorSpace_sDeviceRGBDispatchOnce != -1)
      dispatch_once(&TSUDeviceRGBColorSpace_sDeviceRGBDispatchOnce, &__block_literal_global_3);
    a1 = (CGColorSpace *)TSUDeviceRGBColorSpace_sDeviceRGBColorSpace;
  }
  return CGColorCreate(a1, &components);
}

double *TSUHSBToRGB(double *result, double *a2, double *a3, double a4, double a5, double a6)
{
  double v6;
  BOOL v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  v6 = a4 * 6.0;
  v7 = a4 == 1.0;
  v8 = 0.0;
  if (!v7)
    v8 = v6;
  v9 = (uint64_t)v8;
  v10 = v8 - (double)(uint64_t)v8;
  v11 = (1.0 - a5) * a6;
  v12 = (1.0 - a5 * v10) * a6;
  v13 = (1.0 - a5 * (1.0 - v10)) * a6;
  v14 = a6;
  v15 = v13;
  switch(v9)
  {
    case 0:
      goto LABEL_10;
    case 1:
      v14 = v12;
      v15 = a6;
      goto LABEL_10;
    case 2:
      v14 = v11;
      v15 = a6;
      v11 = v13;
      goto LABEL_10;
    case 3:
      v14 = v11;
      v15 = v12;
      goto LABEL_8;
    case 4:
      v14 = v13;
      v15 = v11;
LABEL_8:
      v11 = a6;
      goto LABEL_10;
    case 5:
      v14 = a6;
      v15 = v11;
      v11 = v12;
LABEL_10:
      *result = v14;
      *a2 = v15;
      *a3 = v11;
      break;
    default:
      return result;
  }
  return result;
}

CGColorRef TSUCreateCGColorFromHSB(double a1, double a2, double a3, double a4)
{
  return TSUCreateCGColorFromHSBInColorSpace(0, a1, a2, a3, a4);
}

uint64_t TSUHSBFromCGColorRef(CGColorRef color, double *a2, double *a3, double *a4, CGFloat *a5)
{
  id v10;
  uint64_t v11;
  CGColorSpace *ColorSpace;
  const CGFloat *Components;

  *a5 = 0.0;
  *a4 = 0.0;
  *a3 = 0.0;
  *a2 = 0.0;
  if (!color)
  {
    v10 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL TSUHSBFromCGColorRef(CGColorRef, CGFloat *, CGFloat *, CGFloat *, CGFloat *)");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUColorUtils.m"), 278, CFSTR("NULL color"));
  }
  ColorSpace = CGColorGetColorSpace(color);
  if (CGColorSpaceGetModel(ColorSpace) != kCGColorSpaceModelRGB || CGColorGetNumberOfComponents(color) != 4)
    return 0;
  *a5 = CGColorGetAlpha(color);
  Components = CGColorGetComponents(color);
  TSURGBToHSB(a2, a3, a4, *Components, Components[1], Components[2]);
  return 1;
}

double TSURGBToHSB(double *a1, double *a2, double *a3, double a4, double a5, double a6)
{
  double v7;
  double v8;
  BOOL v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double result;
  BOOL v18;
  double v19;

  if (a4 < a5 || a4 < a6)
  {
    if (a5 >= a4)
      v7 = a4;
    else
      v7 = a5;
    if (a4 >= a6)
      v8 = a6;
    else
      v8 = a4;
    v9 = a5 < a4 || a5 < a6;
    if (v9)
      v10 = a6;
    else
      v10 = a5;
    if (v9)
      v11 = v7;
    else
      v11 = v8;
  }
  else
  {
    if (a5 >= a6)
      v11 = a6;
    else
      v11 = a5;
    v10 = a4;
  }
  v12 = 0.0;
  if (v10 <= 0.0)
  {
    v14 = 0.0;
  }
  else
  {
    v13 = v10 - v11;
    v14 = (v10 - v11) / v10;
    if (v14 != 0.0)
    {
      v15 = (v10 - a5) / v13;
      v16 = (v10 - a6) / v13;
      if (v10 == a4)
      {
        if (v11 == a5)
          v12 = v16 + 5.0;
        else
          v12 = 1.0 - v15;
      }
      else
      {
        v18 = v10 == a5;
        v19 = (v10 - a4) / v13;
        if (v18)
        {
          if (v11 == a6)
            v12 = v19 + 1.0;
          else
            v12 = 3.0 - v16;
        }
        else if (v11 == a4)
        {
          v12 = v15 + 3.0;
        }
        else
        {
          v12 = 5.0 - v19;
        }
      }
    }
  }
  *a3 = v10;
  result = v12 / 6.0;
  *a1 = v12 / 6.0;
  *a2 = v14;
  return result;
}

double TSUCMYKToRGB(double *a1, double *a2, double *a3, double a4, double a5, double a6, double a7)
{
  double result;

  *a1 = 1.0 - fmin(a7 + a4 * (1.0 - a7), 1.0);
  *a2 = 1.0 - fmin(a7 + a5 * (1.0 - a7), 1.0);
  result = 1.0 - fmin(a7 + a6 * (1.0 - a7), 1.0);
  *a3 = result;
  return result;
}

BOOL TSUColorIsBlack(CGColor *a1)
{
  CGColorSpace *ColorSpace;
  CGColorSpaceModel Model;
  const CGFloat *Components;
  double v5;

  ColorSpace = CGColorGetColorSpace(a1);
  Model = CGColorSpaceGetModel(ColorSpace);
  Components = CGColorGetComponents(a1);
  v5 = 0.0;
  if (Model)
  {
    if (Model == kCGColorSpaceModelCMYK)
    {
      Components += 3;
      v5 = 1.0;
    }
    else
    {
      if (Model != kCGColorSpaceModelRGB || *Components != 0.0 || Components[1] != 0.0)
        return 0;
      Components += 2;
    }
  }
  return *Components == v5;
}

BOOL TSUColorIsClear(CGColor *a1)
{
  return CGColorGetAlpha(a1) == 0.0;
}

CGFloat TSUColorLightness(CGColor *a1)
{
  CGColorSpace *ColorSpace;
  CGColorSpaceModel Model;
  const CGFloat *v4;
  double v5;
  id v6;
  uint64_t v7;
  const CGFloat *Components;
  double v10;
  double v11;
  double v12;
  double v13;

  if (a1)
  {
    ColorSpace = CGColorGetColorSpace(a1);
    Model = CGColorSpaceGetModel(ColorSpace);
    switch(Model)
    {
      case kCGColorSpaceModelMonochrome:
        return *CGColorGetComponents(a1);
      case kCGColorSpaceModelCMYK:
        Components = CGColorGetComponents(a1);
        v10 = Components[3];
        v11 = 1.0 - fmin(v10 + *Components * (1.0 - v10), 1.0);
        v12 = 1.0 - fmin(v10 + Components[1] * (1.0 - v10), 1.0);
        v13 = 1.0 - fmin(v10 + Components[2] * (1.0 - v10), 1.0);
        v5 = fmax(fmax(v11, v12), v13) + fmin(fmin(v11, v12), v13);
        return v5 * 0.5;
      case kCGColorSpaceModelRGB:
        v4 = CGColorGetComponents(a1);
        v5 = fmax(fmax(*v4, v4[1]), v4[2]) + fmin(fmin(*v4, v4[1]), v4[2]);
        return v5 * 0.5;
    }
    NSLog((NSString *)CFSTR("WARNING: Testing lightness of unsupported color model"));
  }
  else
  {
    v6 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CGFloat TSUColorLightness(CGColorRef)");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUColorUtils.m"), 467, CFSTR("Trying to get lightness of a nil color"));
  }
  return 0.0;
}

CGFloat TSUColorAverageLightness(CGColor *a1)
{
  CGColorSpace *ColorSpace;
  CGColorSpaceModel Model;
  const CGFloat *v4;
  double v5;
  id v6;
  uint64_t v7;
  const CGFloat *Components;
  double v10;

  if (a1)
  {
    ColorSpace = CGColorGetColorSpace(a1);
    Model = CGColorSpaceGetModel(ColorSpace);
    switch(Model)
    {
      case kCGColorSpaceModelMonochrome:
        return *CGColorGetComponents(a1);
      case kCGColorSpaceModelCMYK:
        Components = CGColorGetComponents(a1);
        v10 = Components[3];
        v5 = 1.0
           - fmin(v10 + Components[2] * (1.0 - v10), 1.0)
           + 1.0
           - fmin(v10 + *Components * (1.0 - v10), 1.0)
           + 1.0
           - fmin(v10 + Components[1] * (1.0 - v10), 1.0);
        return v5 / 3.0;
      case kCGColorSpaceModelRGB:
        v4 = CGColorGetComponents(a1);
        v5 = *v4 + v4[1] + v4[2];
        return v5 / 3.0;
    }
    NSLog((NSString *)CFSTR("WARNING: Testing lightness of unsupported color model"));
  }
  else
  {
    v6 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CGFloat TSUColorAverageLightness(CGColorRef)");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUColorUtils.m"), 496, CFSTR("Trying to get lightness of a nil color"));
  }
  return 0.0;
}

CGContext *TSUCreateRGBABitmapContext(int a1, double a2, CGFloat a3, CGFloat a4)
{
  CGContext *v8;
  CGAffineTransform v10;
  CGAffineTransform transform;

  if (TSUDeviceRGBColorSpace_sDeviceRGBDispatchOnce != -1)
    dispatch_once(&TSUDeviceRGBColorSpace_sDeviceRGBDispatchOnce, &__block_literal_global_3);
  v8 = CGBitmapContextCreate(0, (unint64_t)(a2 * a4), (unint64_t)(a3 * a4), 8uLL, (4 * (unint64_t)(a2 * a4) + 31) & 0xFFFFFFFFFFFFFFE0, (CGColorSpaceRef)TSUDeviceRGBColorSpace_sDeviceRGBColorSpace, 0x2002u);
  CGAffineTransformMakeScale(&transform, a4, a4);
  CGContextConcatCTM(v8, &transform);
  if (a1)
  {
    CGContextTranslateCTM(v8, 0.0, a3);
    CGAffineTransformMakeScale(&v10, 1.0, -1.0);
    CGContextConcatCTM(v8, &v10);
  }
  return v8;
}

unint64_t TSUBitmapGetAlignedBytesPerRow(uint64_t a1)
{
  return (a1 + 31) & 0xFFFFFFFFFFFFFFE0;
}

CGColorRef TSUCreateCheckerBoardColor(CGColor *a1, CGColor *a2, CGFloat a3, CGFloat a4)
{
  return TSUCreateCheckerBoardColorWithTint(a1, a2, 0, a3, a4);
}

CGColorRef TSUCreateCheckerBoardColorWithTint(CGColor *a1, CGColor *a2, CGColor *a3, CGFloat a4, CGFloat a5)
{
  double v10;
  double v11;
  CGContext *v12;
  CGContext *v13;
  CGImage *Image;
  CGColorRef PatternWithImageAndTransform;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  v10 = a4 + a4;
  v11 = a5 + a5;
  v12 = TSUCreateRGBABitmapContext(0, a4 + a4, a5 + a5, 1.0);
  if (!v12)
    return 0;
  v13 = v12;
  CGContextSetFillColorWithColor(v12, a1);
  v17.origin.x = 0.0;
  v17.origin.y = 0.0;
  v17.size.width = v10;
  v17.size.height = v11;
  CGContextFillRect(v13, v17);
  CGContextSetFillColorWithColor(v13, a2);
  v18.origin.x = 0.0;
  v18.origin.y = 0.0;
  v18.size.width = a4;
  v18.size.height = a5;
  CGContextFillRect(v13, v18);
  v19.origin.x = a4;
  v19.origin.y = a5;
  v19.size.width = a4;
  v19.size.height = a5;
  CGContextFillRect(v13, v19);
  if (a3)
  {
    CGContextSetFillColorWithColor(v13, a3);
    v20.origin.x = 0.0;
    v20.origin.y = 0.0;
    v20.size.width = v10;
    v20.size.height = v11;
    CGContextFillRect(v13, v20);
  }
  Image = CGBitmapContextCreateImage(v13);
  CGContextRelease(v13);
  if (!Image)
    return 0;
  PatternWithImageAndTransform = TSUCGColorCreatePatternWithImageAndTransform(Image, 0);
  CGImageRelease(Image);
  return PatternWithImageAndTransform;
}

uint64_t TSUPatternColorFromGradient(CGGradient *a1, CGFloat a2, CGFloat a3)
{
  CGContext *v6;
  CGContext *v7;
  CGImage *Image;
  uint64_t v9;
  CGPoint v11;
  CGPoint v12;

  v6 = TSUCreateRGBABitmapContext(1, 1.0, a2, a3);
  if (!v6)
    return 0;
  v7 = v6;
  v11.x = 0.0;
  v11.y = 0.0;
  v12.x = 0.0;
  v12.y = a2;
  CGContextDrawLinearGradient(v6, a1, v11, v12, 0);
  Image = CGBitmapContextCreateImage(v7);
  CGContextRelease(v7);
  v9 = objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:scale:orientation:", Image, 0, a3);
  CGImageRelease(Image);
  if (v9)
    return objc_msgSend(MEMORY[0x24BDF6950], "colorWithPatternImage:", v9);
  else
    return 0;
}

double TSUFractionalPart(double a1)
{
  BOOL v1;
  double v2;
  double result;

  v1 = a1 <= 0.0;
  v2 = -(-a1 - floor(-a1));
  result = a1 - floor(a1);
  if (v1)
    return v2;
  return result;
}

double TSUClamp(double a1, double a2, double a3)
{
  if (a1 >= a2)
  {
    a2 = a1;
    if (a1 > a3)
      return a3;
  }
  return a2;
}

double TSUMix(double a1, double a2, double a3)
{
  return a1 + (a2 - a1) * a3;
}

double TSURandom()
{
  return (double)random() / 2147483650.0;
}

double TSURandomBetween(double a1, double a2)
{
  return a1 + (a2 - a1) * ((double)random() / 2147483650.0);
}

double TSUReverseSquare(double a1)
{
  return 1.0 - (1.0 - a1) * (1.0 - a1);
}

long double TSUSineMap(double a1)
{
  return (sin(a1 * 3.14159265 + -1.57079633) + 1.0) * 0.5;
}

uint64_t p_chunkIndexForCharacterIndex(unint64_t a1, _QWORD *a2)
{
  _QWORD **v2;
  unint64_t v3;
  unint64_t v4;
  _QWORD **v5;
  _QWORD **v6;
  _QWORD *v7;

  v2 = (_QWORD **)a2[1];
  if (v2 != (_QWORD **)*a2)
  {
    v3 = ((uint64_t)v2 - *a2) >> 4;
    v2 = (_QWORD **)*a2;
    do
    {
      v4 = v3 >> 1;
      v5 = &v2[2 * (v3 >> 1)];
      v7 = *v5;
      v6 = v5 + 2;
      v3 += ~(v3 >> 1);
      if (v7[2] + *v7 <= a1)
        v2 = v6;
      else
        v3 = v4;
    }
    while (v3);
  }
  return ((uint64_t)v2 - *a2) >> 4;
}

void sub_216D6EA30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::shared_ptr<TSUStringChunk>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

_QWORD *std::shared_ptr<TSUStringChunk>::operator=[abi:ne180100](_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;

  v4 = *a2;
  v3 = a2[1];
  if (v3)
  {
    v5 = (unint64_t *)(v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  v7 = (std::__shared_weak_count *)a1[1];
  *a1 = v4;
  a1[1] = v3;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  return a1;
}

uint64_t std::shared_ptr<TSUStringChunk>::operator=[abi:ne180100](uint64_t a1, __int128 *a2)
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

uint64_t std::vector<std::shared_ptr<TSUStringChunk>>::push_back[abi:ne180100](char **a1, __int128 *a2)
{
  uint64_t result;
  unint64_t v5;
  unint64_t v6;
  char *v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  __int128 v19;
  unint64_t *v20;
  unint64_t v21;
  char *v22;
  char *v23;
  char *v24;
  __int128 v25;
  int64x2_t v26;
  char *v27;
  uint64_t v28;
  int64x2_t v29;
  char *v30;
  uint64_t v31;

  v6 = (unint64_t)a1[2];
  result = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(result - 8);
  if ((unint64_t)v7 >= v6)
  {
    v12 = (v7 - *a1) >> 4;
    v13 = v12 + 1;
    if ((unint64_t)(v12 + 1) >> 60)
      std::vector<std::shared_ptr<TSUStringChunk>>::__throw_length_error[abi:ne180100]();
    v14 = v5 - (_QWORD)*a1;
    if (v14 >> 3 > v13)
      v13 = v14 >> 3;
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF0)
      v15 = 0xFFFFFFFFFFFFFFFLL;
    else
      v15 = v13;
    v31 = result;
    v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<TSUStringChunk>>>(result, v15);
    v18 = &v16[16 * v12];
    v19 = *a2;
    *(_OWORD *)v18 = *a2;
    if (*((_QWORD *)&v19 + 1))
    {
      v20 = (unint64_t *)(*((_QWORD *)&v19 + 1) + 8);
      do
        v21 = __ldxr(v20);
      while (__stxr(v21 + 1, v20));
    }
    v23 = *a1;
    v22 = a1[1];
    if (v22 == *a1)
    {
      v26 = vdupq_n_s64((unint64_t)v22);
      v24 = &v16[16 * v12];
    }
    else
    {
      v24 = &v16[16 * v12];
      do
      {
        v25 = *((_OWORD *)v22 - 1);
        v22 -= 16;
        *((_OWORD *)v24 - 1) = v25;
        v24 -= 16;
        *(_QWORD *)v22 = 0;
        *((_QWORD *)v22 + 1) = 0;
      }
      while (v22 != v23);
      v26 = *(int64x2_t *)a1;
    }
    v11 = v18 + 16;
    *a1 = v24;
    a1[1] = v18 + 16;
    v29 = v26;
    v27 = a1[2];
    a1[2] = &v16[16 * v17];
    v30 = v27;
    v28 = v26.i64[0];
    result = std::__split_buffer<std::shared_ptr<TSUStringChunk>>::~__split_buffer((uint64_t)&v28);
  }
  else
  {
    *(_QWORD *)v7 = *(_QWORD *)a2;
    v8 = *((_QWORD *)a2 + 1);
    *((_QWORD *)v7 + 1) = v8;
    if (v8)
    {
      v9 = (unint64_t *)(v8 + 8);
      do
        v10 = __ldxr(v9);
      while (__stxr(v10 + 1, v9));
    }
    v11 = v7 + 16;
  }
  a1[1] = v11;
  return result;
}

void sub_216D6F2E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  std::shared_ptr<TSUStringChunk>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t *std::vector<std::shared_ptr<TSUStringChunk>>::insert(_QWORD *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t *v4;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  __int128 v16;
  unint64_t *v17;
  unint64_t v18;
  uint64_t *v19;
  unint64_t v20;
  unint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  char *v29;
  int64x2_t v30;
  char *v31;
  uint64_t v32;
  unint64_t *v33;
  unint64_t v34;
  char *v36;
  __int128 v37;
  char *v38;
  _QWORD *v39;
  char *v40;
  int64x2_t v41;
  char *v42;
  uint64_t v43;

  v4 = (uint64_t *)a2;
  v6 = a1[1];
  v8 = (uint64_t)(a1 + 2);
  v7 = a1[2];
  if (v6 >= v7)
  {
    v9 = (uint64_t *)*a1;
    v10 = ((uint64_t)(v6 - *a1) >> 4) + 1;
    if (v10 >> 60)
      std::vector<std::shared_ptr<TSUStringChunk>>::__throw_length_error[abi:ne180100]();
    v11 = a2 - (_QWORD)v9;
    v12 = (a2 - (uint64_t)v9) >> 4;
    v13 = v7 - (_QWORD)v9;
    if (v13 >> 3 > v10)
      v10 = v13 >> 3;
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF0)
      v14 = 0xFFFFFFFFFFFFFFFLL;
    else
      v14 = v10;
    v39 = a1 + 2;
    if (v14)
      v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<TSUStringChunk>>>((uint64_t)(a1 + 2), v14);
    else
      v15 = 0;
    v19 = (uint64_t *)&v15[16 * v12];
    v36 = v15;
    *(_QWORD *)&v37 = v19;
    *((_QWORD *)&v37 + 1) = v19;
    v38 = &v15[16 * v14];
    if (v12 == v14)
    {
      if (v11 < 1)
      {
        if (v9 == v4)
          v21 = 1;
        else
          v21 = v11 >> 3;
        v43 = v8;
        v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<TSUStringChunk>>>(v8, v21);
        v24 = v37;
        v25 = *((_QWORD *)&v37 + 1) - v37;
        if (*((_QWORD *)&v37 + 1) == (_QWORD)v37)
        {
          v30 = vdupq_n_s64(v37);
          v27 = (unint64_t)&v22[16 * (v21 >> 2)];
        }
        else
        {
          v26 = v25 >> 4;
          v27 = (unint64_t)&v22[16 * (v21 >> 2) + (v25 & 0xFFFFFFFFFFFFFFF0)];
          v28 = 16 * v26;
          v29 = &v22[16 * (v21 >> 2)];
          do
          {
            *(_OWORD *)v29 = *(_OWORD *)v24;
            v29 += 16;
            *(_QWORD *)v24 = 0;
            *(_QWORD *)(v24 + 8) = 0;
            v24 += 16;
            v28 -= 16;
          }
          while (v28);
          v30 = (int64x2_t)v37;
        }
        v31 = v38;
        v40 = v36;
        v36 = v22;
        *(_QWORD *)&v37 = &v22[16 * (v21 >> 2)];
        v41 = v30;
        *((_QWORD *)&v37 + 1) = v27;
        v38 = &v22[16 * v23];
        v42 = v31;
        std::__split_buffer<std::shared_ptr<TSUStringChunk>>::~__split_buffer((uint64_t)&v40);
        v19 = (uint64_t *)*((_QWORD *)&v37 + 1);
      }
      else
      {
        v20 = v12 + 2;
        if (v12 >= -1)
          v20 = v12 + 1;
        v19 -= 2 * (v20 >> 1);
        *(_QWORD *)&v37 = v19;
        *((_QWORD *)&v37 + 1) = v19;
      }
    }
    *v19 = *a3;
    v32 = a3[1];
    v19[1] = v32;
    if (v32)
    {
      v33 = (unint64_t *)(v32 + 8);
      do
        v34 = __ldxr(v33);
      while (__stxr(v34 + 1, v33));
      v19 = (uint64_t *)*((_QWORD *)&v37 + 1);
    }
    *((_QWORD *)&v37 + 1) = v19 + 2;
    v4 = (uint64_t *)std::vector<std::shared_ptr<TSUStringChunk>>::__swap_out_circular_buffer(a1, &v36, v4);
    std::__split_buffer<std::shared_ptr<TSUStringChunk>>::~__split_buffer((uint64_t)&v36);
  }
  else if (a2 == v6)
  {
    v16 = *(_OWORD *)a3;
    *(_OWORD *)a2 = *(_OWORD *)a3;
    if (*((_QWORD *)&v16 + 1))
    {
      v17 = (unint64_t *)(*((_QWORD *)&v16 + 1) + 8);
      do
        v18 = __ldxr(v17);
      while (__stxr(v18 + 1, v17));
    }
    a1[1] = a2 + 16;
  }
  else
  {
    std::vector<std::shared_ptr<TSUStringChunk>>::__move_range((uint64_t)a1, a2, v6, (char *)(a2 + 16));
    if (v4 <= a3)
      a3 += 2 * (a1[1] > (unint64_t)a3);
    std::shared_ptr<TSUStringChunk>::operator=[abi:ne180100](v4, a3);
  }
  return v4;
}

void sub_216D6F568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__split_buffer<std::shared_ptr<TSUStringChunk>>::~__split_buffer((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_216D6FA9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  uint64_t v6;
  va_list va;
  uint64_t v8;
  va_list va1;

  va_start(va1, a5);
  va_start(va, a5);
  v6 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  std::shared_ptr<TSUStringChunk>::~shared_ptr[abi:ne180100]((uint64_t)va);
  std::shared_ptr<TSUStringChunk>::~shared_ptr[abi:ne180100]((uint64_t)va1);
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::shared_ptr<TSUStringChunk>>::erase(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (a2 != a3)
  {
    v5 = a3;
    v6 = *(_QWORD *)(a1 + 8);
    if (a3 == v6)
    {
      v8 = a2;
    }
    else
    {
      v7 = 16 * ((a3 - a2) >> 4);
      v8 = a2;
      do
      {
        std::shared_ptr<TSUStringChunk>::operator=[abi:ne180100](v8, (__int128 *)(v8 + v7));
        v8 += 16;
      }
      while (v8 + v7 != v6);
      v5 = *(_QWORD *)(a1 + 8);
    }
    while (v5 != v8)
      v5 = std::shared_ptr<TSUStringChunk>::~shared_ptr[abi:ne180100](v5 - 16);
    *(_QWORD *)(a1 + 8) = v8;
  }
  return a2;
}

void std::vector<std::shared_ptr<TSUStringChunk>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
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
    v5 = v2;
    if ((void *)v4 != v2)
    {
      do
        v4 = std::shared_ptr<TSUStringChunk>::~shared_ptr[abi:ne180100](v4 - 16);
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t std::shared_ptr<TSUStringChunk>::~shared_ptr[abi:ne180100](uint64_t a1)
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

_QWORD *std::shared_ptr<TSUStringChunk>::shared_ptr[abi:ne180100]<TSUStringChunk,void>(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;

  *a1 = a2;
  v4 = (_QWORD *)operator new();
  *v4 = &unk_24D61AF88;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_216D6FC74(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    MEMORY[0x219A01ED0](v1, 0x1000C401E2E008BLL);
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<TSUStringChunk *,std::shared_ptr<TSUStringChunk>::__shared_ptr_default_delete<TSUStringChunk,TSUStringChunk>,std::allocator<TSUStringChunk>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x219A01ED0);
}

uint64_t std::__shared_ptr_pointer<TSUStringChunk *,std::shared_ptr<TSUStringChunk>::__shared_ptr_default_delete<TSUStringChunk,TSUStringChunk>,std::allocator<TSUStringChunk>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    JUMPOUT(0x219A01ED0);
  return result;
}

void std::vector<std::shared_ptr<TSUStringChunk>>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
}

void sub_216D6FD38(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<TSUStringChunk>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(16 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

uint64_t std::__split_buffer<std::shared_ptr<TSUStringChunk>>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 16;
    std::shared_ptr<TSUStringChunk>::~shared_ptr[abi:ne180100](i - 16);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t std::vector<std::shared_ptr<TSUStringChunk>>::__move_range(uint64_t result, uint64_t a2, unint64_t a3, char *a4)
{
  char *v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(char **)(result + 8);
  v5 = (char *)(a2 + v4 - a4);
  v6 = v4;
  while ((unint64_t)v5 < a3)
  {
    *(_OWORD *)v6 = *(_OWORD *)v5;
    v6 += 16;
    *(_QWORD *)v5 = 0;
    *((_QWORD *)v5 + 1) = 0;
    v5 += 16;
  }
  *(_QWORD *)(result + 8) = v6;
  if (v4 != a4)
  {
    v7 = (uint64_t)(v4 - 16);
    v8 = 16 * ((v4 - a4) >> 4);
    v9 = a2 - 16;
    do
    {
      result = std::shared_ptr<TSUStringChunk>::operator=[abi:ne180100](v7, (__int128 *)(v9 + v8));
      v7 -= 16;
      v8 -= 16;
    }
    while (v8);
  }
  return result;
}

uint64_t std::vector<std::shared_ptr<TSUStringChunk>>::__swap_out_circular_buffer(_QWORD *a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t result;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  __int128 v8;
  _QWORD *v9;
  _OWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;

  result = a2[1];
  v5 = (_QWORD *)*a1;
  v6 = result;
  if ((_QWORD *)*a1 != a3)
  {
    v7 = a3;
    v6 = a2[1];
    do
    {
      v8 = *((_OWORD *)v7 - 1);
      v7 -= 2;
      *(_OWORD *)(v6 - 16) = v8;
      v6 -= 16;
      *v7 = 0;
      v7[1] = 0;
    }
    while (v7 != v5);
  }
  a2[1] = v6;
  v9 = (_QWORD *)a1[1];
  v10 = (_OWORD *)a2[2];
  if (v9 != a3)
  {
    do
    {
      *v10++ = *(_OWORD *)a3;
      *a3 = 0;
      a3[1] = 0;
      a3 += 2;
    }
    while (a3 != v9);
    v6 = a2[1];
  }
  a2[2] = v10;
  v11 = (_QWORD *)*a1;
  *a1 = v6;
  a2[1] = v11;
  v12 = a1[1];
  a1[1] = a2[2];
  a2[2] = v12;
  v13 = a1[2];
  a1[2] = a2[3];
  a2[3] = v13;
  *a2 = a2[1];
  return result;
}

void sub_216D6FF78(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_216D701A8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_216D70224(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_216D70278(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_216D702D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_216D70324(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_216D70378(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_216D703CC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_216D7048C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_216D704EC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_216D706C8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t TSUHasListLanguage(uint64_t result)
{
  void *v1;

  if (result)
  {
    v1 = (void *)result;
    if ((objc_msgSend((id)result, "hasPrefix:", CFSTR("ja")) & 1) != 0
      || (objc_msgSend(v1, "hasPrefix:", CFSTR("zh")) & 1) != 0
      || (objc_msgSend(v1, "hasPrefix:", CFSTR("ko")) & 1) != 0
      || (objc_msgSend(v1, "hasPrefix:", CFSTR("ar")) & 1) != 0)
    {
      return 1;
    }
    else
    {
      return objc_msgSend(v1, "hasPrefix:", CFSTR("he"));
    }
  }
  return result;
}

BOOL TSUHasBiDiLanguage(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BDBCEA0], "characterDirectionForLanguage:", a1) == 2;
}

void *TSULocalizedPList(void *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  const __CFString *v22;
  id v23;
  uint64_t v24;
  void *v26;

  do
  {
    v2 = a1;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v6 = (void *)objc_msgSend(a1, "objectEnumerator");
      v7 = v6;
      while (objc_msgSend(v6, "nextObject"))
      {
        objc_msgSend(v5, "addObject:", ((uint64_t (*)(void))TSULocalizedPList)());
        v6 = v7;
      }
      return v5;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return v2;
    v3 = objc_msgSend(a1, "objectForKey:", CFSTR("_LOCALIZABLE_"));
    if (!v3)
    {
      v5 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v8 = (void *)objc_msgSend(a1, "keyEnumerator");
      v9 = objc_msgSend(v8, "nextObject");
      if (v9)
      {
        v10 = v9;
        do
        {
          objc_msgSend(v5, "setObject:forKey:", TSULocalizedPList(objc_msgSend(v2, "objectForKey:", v10)), v10);
          v10 = objc_msgSend(v8, "nextObject");
        }
        while (v10);
      }
      return v5;
    }
    a1 = (void *)v3;
  }
  while (objc_msgSend(v2, "count") == 1);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = 0;
  }
  else
  {
    v11 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "id TSULocalizedPList(id)");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSULocalization.mm"), 79, CFSTR("TSULocalizedPList() - unexpected type"));
    v4 = 0;
LABEL_17:
    v26 = 0;
  }
  v13 = (void *)objc_msgSend(v2, "objectEnumerator");
  v14 = objc_msgSend(v13, "nextObject");
  if (v14)
  {
    while (2)
    {
      v15 = TSULocalizedPList(v14);
      if (v4)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v4, "addEntriesFromDictionary:", v15);
          goto LABEL_27;
        }
        v16 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
        v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "id TSULocalizedPList(id)");
        v18 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSULocalization.mm");
        v19 = v16;
        v20 = v17;
        v21 = 90;
        v22 = CFSTR("TSULocalizedPList() - expected dictionary");
LABEL_26:
        objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, v18, v21, v22);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v23 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
          v24 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "id TSULocalizedPList(id)");
          v18 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSULocalization.mm");
          v19 = v23;
          v20 = v24;
          v21 = 97;
          v22 = CFSTR("TSULocalizedPList() - expected array");
          goto LABEL_26;
        }
        objc_msgSend(v26, "addObjectsFromArray:", v15);
      }
LABEL_27:
      v14 = objc_msgSend(v13, "nextObject");
      if (!v14)
        break;
      continue;
    }
  }
  if (v4)
    return v4;
  else
    return v26;
}

NSMutableArray *p_arrayByAddingLanguage(NSString *a1, NSMutableArray *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (!a2)
    return (NSMutableArray *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", a1);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](a2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
LABEL_4:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v6)
        objc_enumerationMutation(a2);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "hasPrefix:", a1) & 1) != 0)
        break;
      if (v5 == ++v7)
      {
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](a2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v5)
          goto LABEL_4;
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    -[NSMutableArray addObject:](a2, "addObject:", a1);
  }
  return a2;
}

NSMutableArray *TSUFindInputLanguagesWithBlock(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t i;
  NSString *v8;
  NSString *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = (void *)objc_msgSend(MEMORY[0x24BDF6EB8], "activeInputModes", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v2);
        v8 = (NSString *)objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "primaryLanguage");
        if ((*(unsigned int (**)(uint64_t, NSString *))(a1 + 16))(a1, v8))
          v5 = p_arrayByAddingLanguage(v8, v5);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }
  v9 = (NSString *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages"), "firstObject");
  if ((*(unsigned int (**)(uint64_t, NSString *))(a1 + 16))(a1, v9))
    return p_arrayByAddingLanguage(v9, v5);
  return v5;
}

void sub_216D72640(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 135);
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 135);
}

uint64_t MOFullMethodName(uint64_t a1, const char *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v4 = objc_opt_class();
  v5 = (void *)MEMORY[0x24BDD17C8];
  if (v4 == a1)
    return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("+[%@ %@]"), a1, NSStringFromSelector(a2));
  v6 = objc_opt_class();
  return objc_msgSend(v5, "stringWithFormat:", CFSTR("-[%@ %@]"), v6, NSStringFromSelector(a2));
}

CFDataRef _createASCIIData(const __CFString *a1, UInt8 a2, CFIndex a3, CFIndex a4)
{
  const char *CStringPtr;
  __CFData *Mutable;
  UInt8 *MutableBytePtr;
  CFRange v12;

  CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
  if (CStringPtr)
    return CFDataCreateWithBytesNoCopy(0, (const UInt8 *)&CStringPtr[a3], a4, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
  if (a4 < 1)
    return 0;
  Mutable = CFDataCreateMutable(0, a4);
  CFDataSetLength(Mutable, a4);
  MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
  v12.location = a3;
  v12.length = a4;
  if (a4 != CFStringGetBytes(a1, v12, 0x600u, a2, 0, MutableBytePtr, a4, 0))
    NSLog((NSString *)CFSTR("*** %s: Unexpected string conversion error"), "NSData *_createASCIIData(CFStringRef, UInt8, CFRange)");
  return Mutable;
}

uint64_t TSUOperatorStringAddition()
{
  uint64_t result;

  result = TSUOperatorStringAddition_sOperatorString;
  if (!TSUOperatorStringAddition_sOperatorString)
  {
    result = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%C"), 43);
    TSUOperatorStringAddition_sOperatorString = result;
  }
  return result;
}

uint64_t TSUOperatorStringSubtraction()
{
  uint64_t result;

  result = TSUOperatorStringSubtraction_sOperatorString;
  if (!TSUOperatorStringSubtraction_sOperatorString)
  {
    result = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%C"), 8722);
    TSUOperatorStringSubtraction_sOperatorString = result;
  }
  return result;
}

uint64_t TSUOperatorStringMultiplication()
{
  uint64_t result;

  result = TSUOperatorStringMultiplication_sOperatorString;
  if (!TSUOperatorStringMultiplication_sOperatorString)
  {
    result = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%C"), 215);
    TSUOperatorStringMultiplication_sOperatorString = result;
  }
  return result;
}

uint64_t TSUOperatorStringDivision()
{
  uint64_t result;

  result = TSUOperatorStringDivision_sOperatorString;
  if (!TSUOperatorStringDivision_sOperatorString)
  {
    result = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%C"), 247);
    TSUOperatorStringDivision_sOperatorString = result;
  }
  return result;
}

uint64_t TSUOperatorStringPower()
{
  uint64_t result;

  result = TSUOperatorStringPower_sOperatorString;
  if (!TSUOperatorStringPower_sOperatorString)
  {
    result = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%C"), 94);
    TSUOperatorStringPower_sOperatorString = result;
  }
  return result;
}

uint64_t TSUOperatorStringConcatenation()
{
  uint64_t result;

  result = TSUOperatorStringConcatenation_sOperatorString;
  if (!TSUOperatorStringConcatenation_sOperatorString)
  {
    result = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%C"), 38);
    TSUOperatorStringConcatenation_sOperatorString = result;
  }
  return result;
}

uint64_t TSUOperatorStringGreaterThan()
{
  uint64_t result;

  result = TSUOperatorStringGreaterThan_sOperatorString;
  if (!TSUOperatorStringGreaterThan_sOperatorString)
  {
    result = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%C"), 62);
    TSUOperatorStringGreaterThan_sOperatorString = result;
  }
  return result;
}

uint64_t TSUOperatorStringGreaterThanOrEqualTo()
{
  uint64_t result;

  result = TSUOperatorStringGreaterThanOrEqualTo_sOperatorString;
  if (!TSUOperatorStringGreaterThanOrEqualTo_sOperatorString)
  {
    result = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%C"), 8805);
    TSUOperatorStringGreaterThanOrEqualTo_sOperatorString = result;
  }
  return result;
}

uint64_t TSUOperatorStringLessThan()
{
  uint64_t result;

  result = TSUOperatorStringLessThan_sOperatorString;
  if (!TSUOperatorStringLessThan_sOperatorString)
  {
    result = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%C"), 60);
    TSUOperatorStringLessThan_sOperatorString = result;
  }
  return result;
}

uint64_t TSUOperatorStringLessThanOrEqualTo()
{
  uint64_t result;

  result = TSUOperatorStringLessThanOrEqualTo_sOperatorString;
  if (!TSUOperatorStringLessThanOrEqualTo_sOperatorString)
  {
    result = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%C"), 8804);
    TSUOperatorStringLessThanOrEqualTo_sOperatorString = result;
  }
  return result;
}

uint64_t TSUOperatorStringEqualTo()
{
  uint64_t result;

  result = TSUOperatorStringEqualTo_sOperatorString;
  if (!TSUOperatorStringEqualTo_sOperatorString)
  {
    result = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%C"), 61);
    TSUOperatorStringEqualTo_sOperatorString = result;
  }
  return result;
}

uint64_t TSUOperatorStringNotEqualTo()
{
  uint64_t result;

  result = TSUOperatorStringNotEqualTo_sOperatorString;
  if (!TSUOperatorStringNotEqualTo_sOperatorString)
  {
    result = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%C"), 8800);
    TSUOperatorStringNotEqualTo_sOperatorString = result;
  }
  return result;
}

uint64_t TSUOperatorStringPercent()
{
  uint64_t result;

  result = TSUOperatorStringPercent_sOperatorString;
  if (!TSUOperatorStringPercent_sOperatorString)
  {
    result = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%C"), 37);
    TSUOperatorStringPercent_sOperatorString = result;
  }
  return result;
}

uint64_t TSUOperatorStringColon()
{
  uint64_t result;

  result = TSUOperatorStringColon_sOperatorString;
  if (!TSUOperatorStringColon_sOperatorString)
  {
    result = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%C"), 58);
    TSUOperatorStringColon_sOperatorString = result;
  }
  return result;
}

void sub_216D75048(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_216D754A0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_216D75510(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

_QWORD *TSUBlockCleanup::TSUBlockCleanup(_QWORD *a1, void *a2)
{
  id v3;

  *a1 = a2;
  v3 = a2;
  return a1;
}

{
  id v3;

  *a1 = a2;
  v3 = a2;
  return a1;
}

void TSUBlockCleanup::~TSUBlockCleanup(id *this)
{
  (*((void (**)(void))*this + 2))();

}

{
  (*((void (**)(void))*this + 2))();

}

void sub_216D75AF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t TSUImageSourceOrientation(CGImageSource *a1)
{
  CFDictionaryRef v1;
  int v2;
  uint64_t result;

  v1 = CGImageSourceCopyPropertiesAtIndex(a1, 0, 0);
  v2 = objc_msgSend((id)-[__CFDictionary objectForKey:](v1, "objectForKey:", *MEMORY[0x24BDD9698]), "intValue");

  result = 0;
  if ((v2 - 1) <= 7)
    return TSUImageSourceOrientation___orientationMapping[v2 - 1];
  return result;
}

uint64_t TSUImageOrientationApplyFlips(uint64_t result, int a2, int a3)
{
  if (!a2)
  {
    if (!a3)
      return result;
    return TSUImageOrientationApplyFlips_vFlippedOrientations[result];
  }
  result = TSUImageOrientationApplyFlips_hFlippedOrientations[result];
  if (a3)
    return TSUImageOrientationApplyFlips_vFlippedOrientations[result];
  return result;
}

CGAffineTransform *TSUImageOrientationTransform@<X0>(CGAffineTransform *result@<X0>, int a2@<W1>, uint64_t a3@<X8>, CGFloat a4@<D0>, CGFloat a5@<D1>, CGFloat a6@<D2>, CGFloat a7@<D3>)
{
  int v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  unint64_t v18;
  __int128 v19;
  CGFloat v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  CGFloat v27;
  CGFloat v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  double MidX;
  double MidY;
  __int128 v37;
  __int128 v38;
  CGAffineTransform v39;
  CGAffineTransform t1;
  CGAffineTransform v41;
  CGAffineTransform v42;
  CGRect v43;
  CGRect v44;

  if (!result)
  {
    v21 = MEMORY[0x24BDBD8B8];
    v22 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)a3 = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)(a3 + 16) = v22;
    v23 = *(_OWORD *)(v21 + 32);
LABEL_20:
    *(_OWORD *)(a3 + 32) = v23;
    return result;
  }
  v13 = dword_216DA5F48[(_QWORD)result];
  v14 = MEMORY[0x24BDBD8B8];
  v15 = *MEMORY[0x24BDBD8B8];
  v16 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)a3 = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)(a3 + 16) = v16;
  v17 = *(_OWORD *)(v14 + 32);
  *(_OWORD *)(a3 + 32) = v17;
  v18 = 0xCCuLL >> (char)result;
  if (((0xCCuLL >> (char)result) & 1) != 0)
  {
    *(_OWORD *)&v42.a = v15;
    *(_OWORD *)&v42.c = v16;
    *(_OWORD *)&v42.tx = v17;
    result = CGAffineTransformScale((CGAffineTransform *)a3, &v42, a6 / a7, a7 / a6);
  }
  switch(v13)
  {
    case 2:
      goto LABEL_8;
    case 3:
      v19 = *(_OWORD *)(a3 + 16);
      *(_OWORD *)&v41.a = *(_OWORD *)a3;
      *(_OWORD *)&v41.c = v19;
      *(_OWORD *)&v41.tx = *(_OWORD *)(a3 + 32);
      v20 = 3.14159265;
      goto LABEL_14;
    case 4:
      goto LABEL_11;
    case 5:
      v24 = *(_OWORD *)(a3 + 16);
      *(_OWORD *)&v41.a = *(_OWORD *)a3;
      *(_OWORD *)&v41.c = v24;
      *(_OWORD *)&v41.tx = *(_OWORD *)(a3 + 32);
      CGAffineTransformRotate(&v42, &v41, -1.57079633);
      v25 = *(_OWORD *)&v42.c;
      *(_OWORD *)a3 = *(_OWORD *)&v42.a;
      *(_OWORD *)(a3 + 16) = v25;
      *(_OWORD *)(a3 + 32) = *(_OWORD *)&v42.tx;
LABEL_8:
      v26 = *(_OWORD *)(a3 + 16);
      *(_OWORD *)&v41.a = *(_OWORD *)a3;
      *(_OWORD *)&v41.c = v26;
      *(_OWORD *)&v41.tx = *(_OWORD *)(a3 + 32);
      v27 = -1.0;
      v28 = 1.0;
      goto LABEL_12;
    case 6:
      v29 = *(_OWORD *)(a3 + 16);
      *(_OWORD *)&v41.a = *(_OWORD *)a3;
      *(_OWORD *)&v41.c = v29;
      *(_OWORD *)&v41.tx = *(_OWORD *)(a3 + 32);
      v20 = 1.57079633;
      goto LABEL_14;
    case 7:
      v30 = *(_OWORD *)(a3 + 16);
      *(_OWORD *)&v41.a = *(_OWORD *)a3;
      *(_OWORD *)&v41.c = v30;
      *(_OWORD *)&v41.tx = *(_OWORD *)(a3 + 32);
      CGAffineTransformRotate(&v42, &v41, -1.57079633);
      v31 = *(_OWORD *)&v42.c;
      *(_OWORD *)a3 = *(_OWORD *)&v42.a;
      *(_OWORD *)(a3 + 16) = v31;
      *(_OWORD *)(a3 + 32) = *(_OWORD *)&v42.tx;
LABEL_11:
      v32 = *(_OWORD *)(a3 + 16);
      *(_OWORD *)&v41.a = *(_OWORD *)a3;
      *(_OWORD *)&v41.c = v32;
      *(_OWORD *)&v41.tx = *(_OWORD *)(a3 + 32);
      v27 = 1.0;
      v28 = -1.0;
LABEL_12:
      result = CGAffineTransformScale(&v42, &v41, v27, v28);
      goto LABEL_15;
    case 8:
      v33 = *(_OWORD *)(a3 + 16);
      *(_OWORD *)&v41.a = *(_OWORD *)a3;
      *(_OWORD *)&v41.c = v33;
      *(_OWORD *)&v41.tx = *(_OWORD *)(a3 + 32);
      v20 = -1.57079633;
LABEL_14:
      result = CGAffineTransformRotate(&v42, &v41, v20);
LABEL_15:
      v34 = *(_OWORD *)&v42.c;
      *(_OWORD *)a3 = *(_OWORD *)&v42.a;
      *(_OWORD *)(a3 + 16) = v34;
      *(_OWORD *)(a3 + 32) = *(_OWORD *)&v42.tx;
      break;
    default:
      break;
  }
  if (a2)
  {
    v43.origin.x = a4;
    v43.origin.y = a5;
    v43.size.width = a6;
    v43.size.height = a7;
    MidX = CGRectGetMidX(v43);
    v44.origin.x = a4;
    v44.origin.y = a5;
    v44.size.width = a6;
    v44.size.height = a7;
    MidY = CGRectGetMidY(v44);
    memset(&v42, 0, sizeof(v42));
    CGAffineTransformMakeTranslation(&v42, MidX, MidY);
    if ((v18 & 1) != 0)
    {
      t1 = v42;
      CGAffineTransformRotate(&v41, &t1, 3.14159265);
      v42 = v41;
    }
    v37 = *(_OWORD *)(a3 + 16);
    *(_OWORD *)&t1.a = *(_OWORD *)a3;
    *(_OWORD *)&t1.c = v37;
    *(_OWORD *)&t1.tx = *(_OWORD *)(a3 + 32);
    v39 = v42;
    CGAffineTransformConcat(&v41, &t1, &v39);
    v42 = v41;
    t1 = v41;
    result = CGAffineTransformTranslate(&v41, &t1, -MidX, -MidY);
    v38 = *(_OWORD *)&v41.c;
    v23 = *(_OWORD *)&v41.tx;
    v42 = v41;
    *(_OWORD *)a3 = *(_OWORD *)&v41.a;
    *(_OWORD *)(a3 + 16) = v38;
    goto LABEL_20;
  }
  return result;
}

BOOL TSUCGImageIsEmpty(CGImage *a1)
{
  CGContext *v2;
  _OWORD data[4];
  uint64_t v5;
  CGRect v6;

  v5 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 1;
  memset(data, 0, sizeof(data));
  v2 = CGBitmapContextCreateWithData(data, 1uLL, 1uLL, 8uLL, 1uLL, 0, 7u, 0, 0);
  v6.origin.x = 0.0;
  v6.origin.y = 0.0;
  v6.size.width = 1.0;
  v6.size.height = 1.0;
  CGContextDrawImage(v2, v6, a1);
  CFRelease(v2);
  return LOBYTE(data[0]) == 0;
}

void TSUSplitRectIntoSlices(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CGSize v21;
  CGPoint v22;
  CGRect remainder;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect slice;
  CGRect v28;
  CGRect v29;
  uint64_t v30;
  CGRect v31;

  v30 = *MEMORY[0x24BDAC8D0];
  v21 = *(CGSize *)(MEMORY[0x24BDBF070] + 16);
  v22 = (CGPoint)*MEMORY[0x24BDBF070];
  remainder.origin = v22;
  remainder.size = v21;
  slice.origin = v22;
  slice.size = v21;
  v28.origin = v22;
  v28.size = v21;
  v29.origin = v22;
  v29.size = v21;
  v24.origin = v22;
  v24.size = v21;
  v25.origin = v22;
  v25.size = v21;
  v26.origin = v22;
  v26.size = v21;
  CGRectDivide(*(CGRect *)&a2, &slice, &remainder, a8, CGRectMinYEdge);
  CGRectDivide(remainder, &v29, &v28, a9, CGRectMaxYEdge);
  remainder.origin = v22;
  remainder.size = v21;
  v31.origin.x = a2;
  v31.origin.y = a3;
  v31.size.width = a4;
  v31.size.height = a5;
  CGRectDivide(v31, &v24, &remainder, a6, CGRectMinXEdge);
  CGRectDivide(remainder, &v26, &v25, a7, CGRectMaxXEdge);
  v17 = 0;
  v18 = a1 + 16;
  do
  {
    v19 = 0;
    v20 = v18;
    do
    {
      *(CGRect *)(v20 - 16) = CGRectIntersection(*(CGRect *)((char *)&slice + v19), *(&v24 + v17));
      v20 += 96;
      v19 += 32;
    }
    while (v19 != 96);
    ++v17;
    v18 += 32;
  }
  while (v17 != 3);
}

UIImage *TSUCGImagePNGRepresentationWithProperties(uint64_t a1)
{
  UIImage *result;
  UIImage *v2;
  NSData *v3;

  result = (UIImage *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithCGImage:", a1);
  if (result)
  {
    v2 = result;
    v3 = UIImagePNGRepresentation(result);

    return (UIImage *)v3;
  }
  return result;
}

UIImage *TSUCGImagePNGRepresentationWithOrientation(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BDD9698];
  if ((unint64_t)(a2 - 1) > 6)
    v3 = 1;
  else
    v3 = dword_216DA5F68[a2 - 1];
  v6[0] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  return TSUCGImagePNGRepresentationWithProperties(a1);
}

uint64_t TSUCGImageJPEGRepresentationWithProperties()
{
  return 0;
}

UIImage *TSUCGImageJPEGRepresentation(uint64_t a1, CGFloat a2)
{
  UIImage *result;
  UIImage *v4;
  NSData *v5;

  result = (UIImage *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithCGImage:", a1);
  if (result)
  {
    v4 = result;
    v5 = UIImageJPEGRepresentation(result, a2);

    return (UIImage *)v5;
  }
  return result;
}

uint64_t TSUCGImageJPEGRepresentationWithOrientation(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = *MEMORY[0x24BDD9220];
  v3 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
  v6[1] = *MEMORY[0x24BDD9698];
  v7[0] = v3;
  if ((unint64_t)(a2 - 1) > 6)
    v4 = 1;
  else
    v4 = dword_216DA5F68[a2 - 1];
  v7[1] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  return 0;
}

__CFData *TSUCGImageTIFFRepresentation(CGImage *a1)
{
  __CFData *v2;
  CGImageDestination *v3;
  _BOOL4 v4;

  v2 = (__CFData *)objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v3 = CGImageDestinationCreateWithData(v2, (CFStringRef)*MEMORY[0x24BDC1880], 1uLL, 0);
  CGImageDestinationAddImage(v3, a1, 0);
  v4 = CGImageDestinationFinalize(v3);
  if (v3)
    CFRelease(v3);
  if (v4)
    return v2;
  else
    return 0;
}

double TSDMultiplyPointScalar(double a1, double a2, double a3)
{
  return a1 * a3;
}

double TSUMultiplySizeScalar(double a1, double a2, double a3)
{
  return a1 * a3;
}

double TSUMultiplyRectScalar(double a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  double v9;
  CGRect v11;

  v9 = a1;
  if (!CGRectIsInfinite(*(CGRect *)&a1))
  {
    v11.origin.x = v9;
    v11.origin.y = a2;
    v11.size.width = a3;
    v11.size.height = a4;
    if (!CGRectIsNull(v11))
      return v9 * a5;
  }
  return v9;
}

double TSUFlooredPoint(double a1)
{
  return floor(a1);
}

double TSUFlooredSize(double a1)
{
  return floor(a1);
}

double TSURoundedRectForScale(double a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  double v11;
  double MinY;
  double v13;
  double MaxX;
  CGFloat v15;
  double MaxY;
  CGFloat v17;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  v19.origin.x = TSUMultiplyRectScalar(a1, a2, a3, a4, a5);
  x = v19.origin.x;
  y = v19.origin.y;
  width = v19.size.width;
  height = v19.size.height;
  MinX = CGRectGetMinX(v19);
  v11 = TSURound(MinX);
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  MinY = CGRectGetMinY(v20);
  v13 = TSURound(MinY);
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  MaxX = CGRectGetMaxX(v21);
  v15 = TSURound(MaxX) - v11;
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  MaxY = CGRectGetMaxY(v22);
  v17 = TSURound(MaxY) - v13;
  return TSUMultiplyRectScalar(v11, v13, v15, v17, 1.0 / a5);
}

double TSURectWithCenterAndSize(double a1, double a2, double a3)
{
  return a1 - a3 * 0.5;
}

double TSURectWithSize()
{
  return 0.0;
}

double TSUCenterOfRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double MidX;
  CGRect v10;

  MidX = CGRectGetMidX(*(CGRect *)&a1);
  v10.origin.x = a1;
  v10.origin.y = a2;
  v10.size.width = a3;
  v10.size.height = a4;
  CGRectGetMidY(v10);
  return MidX;
}

double TSURoundedRect(double a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  return TSURoundedRectForScale(a1, a2, a3, a4, 1.0);
}

BOOL TSUPointIsNearPoint(double a1, double a2, double a3, double a4, double a5)
{
  _BOOL4 v5;

  v5 = vabdd_f64(a1, a3) < a5;
  return vabdd_f64(a2, a4) < a5 && v5;
}

uint64_t TSUPointIsFinite(double a1, double a2)
{
  double v2;
  _BOOL4 v3;
  double v4;
  _BOOL4 v5;

  v2 = fabs(a1);
  v3 = v2 < INFINITY;
  if (v2 > INFINITY)
    v3 = 1;
  v4 = fabs(a2);
  v5 = v4 < INFINITY;
  if (v4 > INFINITY)
    v5 = 1;
  return v3 & v5;
}

double TSUPointFromNormalizedRect(double a1, double a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  double MinX;
  double v12;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  v14.origin.x = a3;
  v14.origin.y = a4;
  v14.size.width = a5;
  v14.size.height = a6;
  MinX = CGRectGetMinX(v14);
  v15.origin.x = a3;
  v15.origin.y = a4;
  v15.size.width = a5;
  v15.size.height = a6;
  v12 = MinX + a1 * CGRectGetWidth(v15);
  v16.origin.x = a3;
  v16.origin.y = a4;
  v16.size.width = a5;
  v16.size.height = a6;
  CGRectGetMinY(v16);
  v17.origin.x = a3;
  v17.origin.y = a4;
  v17.size.width = a5;
  v17.size.height = a6;
  CGRectGetHeight(v17);
  return v12;
}

double TSUScaleSizeWithinSize(double a1, double a2, double a3, double a4)
{
  if (a1 / a2 < a3 / a4)
    return a1 * (a4 / a2);
  return a3;
}

double TSUShrinkSizeToFitInSize(double result, double a2, double a3, double a4)
{
  BOOL v4;
  BOOL v5;

  if (result <= a3)
  {
    v4 = a2 == a4;
    v5 = a2 < a4;
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  if (!v5 && !v4)
  {
    if (result / a2 <= a3 / a4)
    {
      if (result / a2 < a3 / a4)
        return result * (a4 / a2);
      else
        return a3;
    }
    else
    {
      return a3;
    }
  }
  return result;
}

double TSUMixFloats(double a1, double a2, double a3)
{
  return a2 * a3 + a1 * (1.0 - a3);
}

double TSUMixPoints(double a1, double a2, double a3, double a4, double a5)
{
  return a3 * a5 + a1 * (1.0 - a5);
}

double TSUMixSizes(double a1, double a2, double a3, double a4, double a5)
{
  return a3 * a5 + a1 * (1.0 - a5);
}

double TSUMixRects(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  return a5 * a9 + a1 * (1.0 - a9);
}

double TSUSubtractPoints(double a1, double a2, double a3)
{
  return a1 - a3;
}

double TSUDistance(double a1, double a2, double a3, double a4)
{
  return sqrt((a2 - a4) * (a2 - a4) + (a1 - a3) * (a1 - a3));
}

BOOL isFormatTypeNumber(int a1)
{
  return (a1 & 0xFFFFFFFC) == 256;
}

uint64_t TSUFormat::isMergableWithFormatType(uint64_t a1, int a2)
{
  int v2;
  _BOOL4 v3;
  unsigned int v4;

  v2 = *(_DWORD *)(a1 + 8);
  if ((v2 & 0xFFFFFFFC) == 0x100)
    v3 = (a2 & 0xFFFFFFFC) == 256;
  else
    v3 = v2 == a2;
  v4 = v2 == 1 || v3;
  if (a2 == 1)
    return 1;
  else
    return v4;
}

void TSUFormat::TSUFormat(TSUFormat *this)
{
  *(_QWORD *)this = &unk_24D61B1F8;
  *((_DWORD *)this + 2) = 1;
  *((_BYTE *)this + 12) = 1;
  *((_QWORD *)this + 6) = 0;
}

{
  *(_QWORD *)this = &unk_24D61B1F8;
  *((_DWORD *)this + 2) = 1;
  *((_BYTE *)this + 12) = 1;
  *((_QWORD *)this + 6) = 0;
}

uint64_t TSUFormat::TSUFormat(uint64_t a1, int *a2)
{
  int v4;
  const __CFLocale *v5;
  __CFString *Value;
  __CFString *v7;
  int DecimalInfoForCurrencyCode;
  __CFString *v9;
  uint64_t v10;
  __CFString *v11;
  unsigned int v12;
  BOOL v13;
  int v14;
  id v16;
  uint64_t v17;
  int32_t defaultFractionDigits;

  *(_QWORD *)a1 = &unk_24D61B1F8;
  v4 = *a2;
  *(_DWORD *)(a1 + 8) = *a2;
  *(_BYTE *)(a1 + 12) = 1;
  if (v4 == 257)
  {
    v5 = (const __CFLocale *)TSUGetCurrentLocale();
    Value = (__CFString *)CFLocaleGetValue(v5, (CFLocaleKey)*MEMORY[0x24BDBD3E0]);
    if (Value)
      v7 = Value;
    else
      v7 = CFSTR("USD");
    defaultFractionDigits = 0;
    DecimalInfoForCurrencyCode = CFNumberFormatterGetDecimalInfoForCurrencyCode(v7, &defaultFractionDigits, 0);
    v9 = v7;
    v10 = defaultFractionDigits;
    if (!DecimalInfoForCurrencyCode)
      v10 = 2;
  }
  else
  {
    v9 = 0;
    v10 = 253;
  }
  *(_QWORD *)(a1 + 16) = v9;
  *(_QWORD *)(a1 + 24) = v10 & 0xFFFFFFFFFFFFF8FFLL;
  v11 = v9;
  *(_QWORD *)(a1 + 48) = 0;
  v12 = *a2 - 261;
  v13 = v12 > 8;
  v14 = (1 << v12) & 0x183;
  if (!v13 && v14 != 0)
  {
    v16 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "TSUFormat::TSUFormat(const TSUFormatType &)");
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormat.mm"), 62, CFSTR("Use the constructor for this type of struct instead of this one (unless you want a number struct value)."));
  }
  return a1;
}

uint64_t TSUFormat::TSUFormat(uint64_t a1, _DWORD *a2, _OWORD *a3)
{
  id v5;
  id v6;
  uint64_t v7;

  *(_QWORD *)a1 = &unk_24D61B1F8;
  *(_DWORD *)(a1 + 8) = *a2;
  *(_BYTE *)(a1 + 12) = 1;
  *(_OWORD *)(a1 + 16) = *a3;
  v5 = *(id *)(a1 + 16);
  *(_QWORD *)(a1 + 48) = 0;
  if ((*a2 & 0xFFFFFFFC) != 0x100)
  {
    v6 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "TSUFormat::TSUFormat(const TSUFormatType &, const TSUFormatStructNumber &)");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormat.mm"), 71, CFSTR("Creating a non-number formatType but initializing the numberStruct variable."));
  }
  return a1;
}

{
  id v5;
  uint64_t v6;
  __int128 v7;

  *(_QWORD *)a1 = &unk_24D61B1F8;
  *(_DWORD *)(a1 + 8) = *a2;
  *(_BYTE *)(a1 + 12) = 1;
  v5 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
  v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "TSUFormat::TSUFormat(const TSUFormatType &, const TSUFormatStructControl &)");
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormat.mm"), 142, CFSTR("Formula engine formats should never use stepper/sliders. Some caller needs to get the display format."));
  v7 = a3[1];
  *(_OWORD *)(a1 + 16) = *a3;
  *(_OWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 48) = 0;
  return a1;
}

uint64_t TSUFormat::TSUFormat(uint64_t a1, int *a2, char a3, uint64_t a4)
{
  int v5;
  void *v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;
  __int128 v13;

  *(_QWORD *)a1 = &unk_24D61B1F8;
  v5 = *a2;
  *(_DWORD *)(a1 + 8) = *a2;
  *(_BYTE *)(a1 + 12) = a3;
  *(_QWORD *)(a1 + 48) = a4;
  if (v5 != -999 && v5 != 1)
  {
    if ((v5 & 0xFFFFFFFC) == 0x100)
    {
      *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 2);
      v8 = *(void **)(a1 + 16);
LABEL_7:
      v9 = v8;
    }
    else
    {
      switch(v5)
      {
        case 261:
          *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 2);
          v8 = *(void **)(a1 + 24);
          goto LABEL_7;
        case 262:
          *(_DWORD *)(a1 + 16) = a2[2];
          return a1;
        case 268:
          goto LABEL_16;
        case 269:
          v10 = *((_WORD *)a2 + 4);
          *(_BYTE *)(a1 + 18) = *((_BYTE *)a2 + 10);
          *(_WORD *)(a1 + 16) = v10;
          return a1;
        default:
          if ((v5 - 270) <= 2)
            goto LABEL_16;
          if ((v5 - 264) >= 2)
          {
            if (v5 != 266)
              return a1;
LABEL_16:
            v13 = *(_OWORD *)(a2 + 2);
          }
          else
          {
            v11 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
            v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "TSUFormat::TSUFormat(const TSUFormatStruct &, BOOL, const TSUCustomFormat *)");
            objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormat.mm"), 100, CFSTR("Formula engine formats should never use stepper/sliders. Some caller needs to get the display format."));
            v13 = *(_OWORD *)(a2 + 2);
            *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 6);
          }
          *(_OWORD *)(a1 + 16) = v13;
          break;
      }
    }
  }
  return a1;
}

uint64_t TSUFormat::TSUFormat(uint64_t result, _DWORD *a2)
{
  *(_QWORD *)result = &unk_24D61B1F8;
  *(_DWORD *)(result + 8) = 262;
  *(_BYTE *)(result + 12) = 1;
  *(_DWORD *)(result + 16) = *a2;
  *(_QWORD *)(result + 48) = 0;
  return result;
}

{
  *(_QWORD *)result = &unk_24D61B1F8;
  *(_DWORD *)(result + 8) = 262;
  *(_BYTE *)(result + 12) = 1;
  *(_DWORD *)(result + 16) = *a2;
  *(_QWORD *)(result + 48) = 0;
  return result;
}

uint64_t TSUFormat::TSUFormat(uint64_t result, __int16 *a2)
{
  __int16 v2;

  *(_QWORD *)result = &unk_24D61B1F8;
  *(_DWORD *)(result + 8) = 269;
  *(_BYTE *)(result + 12) = 1;
  v2 = *a2;
  *(_BYTE *)(result + 18) = *((_BYTE *)a2 + 2);
  *(_WORD *)(result + 16) = v2;
  *(_QWORD *)(result + 48) = 0;
  return result;
}

{
  __int16 v2;

  *(_QWORD *)result = &unk_24D61B1F8;
  *(_DWORD *)(result + 8) = 269;
  *(_BYTE *)(result + 12) = 1;
  v2 = *a2;
  *(_BYTE *)(result + 18) = *((_BYTE *)a2 + 2);
  *(_WORD *)(result + 16) = v2;
  *(_QWORD *)(result + 48) = 0;
  return result;
}

uint64_t TSUFormat::TSUFormat(uint64_t a1, _OWORD *a2)
{
  id v3;

  *(_QWORD *)a1 = &unk_24D61B1F8;
  *(_DWORD *)(a1 + 8) = 261;
  *(_BYTE *)(a1 + 12) = 1;
  *(_OWORD *)(a1 + 16) = *a2;
  v3 = *(id *)(a1 + 24);
  *(_QWORD *)(a1 + 48) = 0;
  return a1;
}

{
  id v3;

  *(_QWORD *)a1 = &unk_24D61B1F8;
  *(_DWORD *)(a1 + 8) = 261;
  *(_BYTE *)(a1 + 12) = 1;
  *(_OWORD *)(a1 + 16) = *a2;
  v3 = *(id *)(a1 + 24);
  *(_QWORD *)(a1 + 48) = 0;
  return a1;
}

__n128 TSUFormat::TSUFormat(__n128 *a1, __n128 *a2)
{
  __n128 result;

  a1->n128_u64[0] = (unint64_t)&unk_24D61B1F8;
  a1->n128_u32[2] = 268;
  a1->n128_u8[12] = 1;
  result = *a2;
  a1[1] = *a2;
  a1[3].n128_u64[0] = 0;
  return result;
}

{
  __n128 result;

  a1->n128_u64[0] = (unint64_t)&unk_24D61B1F8;
  a1->n128_u32[2] = 268;
  a1->n128_u8[12] = 1;
  result = *a2;
  a1[1] = *a2;
  a1[3].n128_u64[0] = 0;
  return result;
}

{
  __n128 result;

  a1->n128_u64[0] = (unint64_t)&unk_24D61B1F8;
  a1->n128_u32[2] = 266;
  a1->n128_u8[12] = 1;
  result = *a2;
  a1[1] = *a2;
  a1[3].n128_u64[0] = 0;
  return result;
}

{
  __n128 result;

  a1->n128_u64[0] = (unint64_t)&unk_24D61B1F8;
  a1->n128_u32[2] = 266;
  a1->n128_u8[12] = 1;
  result = *a2;
  a1[1] = *a2;
  a1[3].n128_u64[0] = 0;
  return result;
}

uint64_t TSUFormat::TSUFormat(uint64_t a1, _DWORD *a2, _OWORD *a3, uint64_t a4)
{
  id v5;
  uint64_t v6;

  *(_QWORD *)a1 = &unk_24D61B1F8;
  *(_DWORD *)(a1 + 8) = *a2;
  *(_BYTE *)(a1 + 12) = 1;
  *(_QWORD *)(a1 + 48) = a4;
  *(_OWORD *)(a1 + 16) = *a3;
  if ((*a2 - 270) >= 3)
  {
    v5 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "TSUFormat::TSUFormat(const TSUFormatType &, const TSUFormatStructCustom &, const TSUCustomFormat *)");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormat.mm"), 137, CFSTR("Creating a non-custom formatType but initializing the customStruct variable."));
  }
  return a1;
}

void TSUFormat::TSUFormat(TSUFormat *this, const TSUFormat *a2)
{
  int v2;
  __int128 v3;
  id *v4;
  id v5;

  *(_QWORD *)this = &unk_24D61B1F8;
  v2 = *((_DWORD *)a2 + 2);
  *((_DWORD *)this + 2) = v2;
  *((_BYTE *)this + 12) = *((_BYTE *)a2 + 12);
  v3 = *((_OWORD *)a2 + 2);
  *((_OWORD *)this + 1) = *((_OWORD *)a2 + 1);
  *((_OWORD *)this + 2) = v3;
  *((_QWORD *)this + 6) = *((_QWORD *)a2 + 6);
  if ((v2 & 0xFFFFFFFC) == 0x100)
  {
    v4 = (id *)((char *)this + 16);
  }
  else
  {
    if (v2 != 261)
      return;
    v4 = (id *)((char *)this + 24);
  }
  v5 = *v4;
}

uint64_t TSUFormat::operator=(uint64_t a1, uint64_t a2)
{
  int v4;
  id *v5;
  id v6;
  int v7;
  id *v8;
  __int128 v9;

  if (a1 != a2)
  {
    v4 = *(_DWORD *)(a2 + 8);
    if ((v4 & 0xFFFFFFFC) == 0x100)
    {
      v5 = (id *)(a2 + 16);
    }
    else
    {
      if (v4 != 261)
        goto LABEL_7;
      v5 = (id *)(a2 + 24);
    }
    v6 = *v5;
LABEL_7:
    v7 = *(_DWORD *)(a1 + 8);
    if ((v7 & 0xFFFFFFFC) == 0x100)
    {
      v8 = (id *)(a1 + 16);
    }
    else
    {
      if (v7 != 261)
      {
LABEL_12:
        *(_BYTE *)(a1 + 12) = *(_BYTE *)(a2 + 12);
        v9 = *(_OWORD *)(a2 + 32);
        *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
        *(_OWORD *)(a1 + 32) = v9;
        *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
        *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
        return a1;
      }
      v8 = (id *)(a1 + 24);
    }

    goto LABEL_12;
  }
  return a1;
}

void TSUFormat::~TSUFormat(TSUFormat *this)
{
  int v1;
  id *v2;

  *(_QWORD *)this = &unk_24D61B1F8;
  v1 = *((_DWORD *)this + 2);
  if ((v1 & 0xFFFFFFFC) == 0x100)
  {
    v2 = (id *)((char *)this + 16);
  }
  else
  {
    if (v1 != 261)
      return;
    v2 = (id *)((char *)this + 24);
  }

  *v2 = 0;
}

{
  int v1;
  id *v2;

  *(_QWORD *)this = &unk_24D61B1F8;
  v1 = *((_DWORD *)this + 2);
  if ((v1 & 0xFFFFFFFC) == 0x100)
  {
    v2 = (id *)((char *)this + 16);
  }
  else
  {
    if (v1 != 261)
      return;
    v2 = (id *)((char *)this + 24);
  }

  *v2 = 0;
}

void TSUFormat::formatByMergingWithFormat(TSUFormat *this@<X0>, const TSUFormat *a2@<X1>, uint64_t a3@<X8>)
{
  int v4;
  const TSUFormat *v5;
  int v6;
  int v7;
  TSUFormat *v10;
  unsigned int v11;
  int v12;
  unsigned int v13;
  int v14;
  __int16 v15;
  __int16 v16;
  int v17;
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  void *v21;
  unsigned int v22;
  void *v23;
  char v24;
  id v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  __int16 v36;
  __int16 v37;
  __int16 v38;
  __int16 v39;
  __int16 v40;
  int v41;
  __int128 v42;
  int v43;

  v4 = *((_DWORD *)this + 2);
  if (v4 == 254)
    goto LABEL_3;
  v5 = a2;
  v6 = *((_DWORD *)a2 + 2);
  if (v6 == 254)
    goto LABEL_3;
  if (v4 != 1 && v6 != 1)
  {
    if ((v4 & 0xFFFFFFFC) == 0x100)
    {
      if ((v6 & 0xFFFFFFFC) == 0x100)
        goto LABEL_13;
    }
    else if (v4 == v6)
    {
      goto LABEL_13;
    }
LABEL_3:
    v7 = 254;
LABEL_4:
    LODWORD(v42) = v7;
    TSUFormat::TSUFormat(a3, (int *)&v42);
    return;
  }
LABEL_13:
  if (*((_BYTE *)this + 12))
  {
    if (!*((_BYTE *)a2 + 12))
      goto LABEL_19;
  }
  else if (*((_BYTE *)a2 + 12))
  {
    goto LABEL_45;
  }
  if (v4 == 1)
  {
    if (v6 != 271)
    {
LABEL_19:
      v10 = (TSUFormat *)a3;
LABEL_46:
      TSUFormat::TSUFormat(v10, a2);
      return;
    }
LABEL_22:
    v7 = 260;
    goto LABEL_4;
  }
  if (v6 == 1)
  {
    if (v4 == 271)
      goto LABEL_22;
LABEL_45:
    v10 = (TSUFormat *)a3;
    a2 = this;
    goto LABEL_46;
  }
  if ((v4 & 0xFFFFFFFC) == 0x100)
  {
    if (v4 != v6)
      v4 = 256;
    v43 = v4;
    v11 = *((unsigned __int16 *)this + 12);
    v12 = *((_WORD *)this + 12);
    v13 = *((unsigned __int16 *)a2 + 12);
    v14 = *((_WORD *)a2 + 12);
    if (v12 == v14)
      v15 = *((_WORD *)this + 12);
    else
      v15 = 255;
    if (v14 == 254)
      v15 = *((_WORD *)this + 12);
    if (v12 == 254)
      v16 = *((_WORD *)a2 + 12);
    else
      v16 = v15;
    v17 = (v11 >> 8) & 7;
    if (v17 == ((v13 >> 8) & 7))
      v18 = (_WORD)v17 << 8;
    else
      v18 = 0;
    v19 = v11 & 0x800;
    if (((v13 >> 11) & 1) == v19 >> 11)
      v20 = v19;
    else
      v20 = 0;
    v21 = (void *)*((_QWORD *)this + 2);
    if (v21 != *((void **)a2 + 2))
    {
      if (objc_msgSend(v21, "isEqualToString:"))
        v21 = (void *)*((_QWORD *)this + 2);
      else
        v21 = 0;
    }
    *(_QWORD *)&v42 = v21;
    v22 = *((_WORD *)this + 12) & 0x1000;
    if (((*((unsigned __int16 *)v5 + 12) >> 12) & 1) != v22 >> 12)
      LOWORD(v22) = 0;
    WORD4(v42) = v22 | v20 | v18 | v16;
    TSUFormat::TSUFormat(a3, &v43, &v42);
  }
  else
  {
    switch(v4)
    {
      case 261:
        v23 = (void *)*((_QWORD *)this + 3);
        if (v23 != *((void **)a2 + 3))
          v23 = (void *)TSUDefaultDateTimeFormat();
        v24 = *((_BYTE *)v5 + 16) & *((_BYTE *)this + 16) & 3;
        *(_QWORD *)a3 = &unk_24D61B1F8;
        *(_DWORD *)(a3 + 8) = 261;
        *(_BYTE *)(a3 + 12) = 1;
        *(_BYTE *)(a3 + 16) = v24;
        *(_QWORD *)(a3 + 24) = v23;
        v25 = v23;
        break;
      case 262:
        v26 = *((unsigned __int8 *)this + 16);
        if (v26 != *((unsigned __int8 *)a2 + 16))
          v26 = 0;
        *(_QWORD *)a3 = &unk_24D61B1F8;
        *(_DWORD *)(a3 + 8) = 262;
        *(_BYTE *)(a3 + 12) = 1;
        *(_DWORD *)(a3 + 16) = v26;
        break;
      case 268:
        v27 = *((_DWORD *)this + 5);
        v28 = *((_DWORD *)this + 6);
        v29 = *((_DWORD *)a2 + 5);
        v30 = *((_DWORD *)a2 + 6);
        if (v27 <= v29)
          v31 = *((_DWORD *)a2 + 5);
        else
          v31 = *((_DWORD *)this + 5);
        if (!v29)
          v31 = *((_DWORD *)this + 5);
        if (v27)
          v32 = v31;
        else
          v32 = *((_DWORD *)a2 + 5);
        if (v28 >= v30)
          v33 = *((_DWORD *)a2 + 6);
        else
          v33 = *((_DWORD *)this + 6);
        if (!v30)
          v33 = *((_DWORD *)this + 6);
        if (v28)
          v34 = v33;
        else
          v34 = *((_DWORD *)a2 + 6);
        v35 = *((_DWORD *)this + 7);
        if (v35 != *((_DWORD *)a2 + 7))
          v35 = 1;
        *(_QWORD *)a3 = &unk_24D61B1F8;
        *(_DWORD *)(a3 + 8) = 268;
        *(_BYTE *)(a3 + 12) = 1;
        *(_DWORD *)(a3 + 20) = v32;
        *(_DWORD *)(a3 + 24) = v34;
        *(_DWORD *)(a3 + 28) = v35;
        break;
      case 269:
        v36 = *((_WORD *)this + 8);
        v37 = *((_WORD *)a2 + 8) ^ v36;
        v38 = v36;
        if (*((_WORD *)a2 + 8) != v36)
          v38 = 255;
        v39 = v36 & 0xFF00;
        if ((v37 & 0xFF00) != 0)
          v39 = -256;
        v40 = v38 | v39;
        v41 = *((_BYTE *)this + 18) & 1;
        if (v41 != (*((_BYTE *)a2 + 18) & 1))
          v41 = kTSUDefaultBaseUseMinusSign != 0;
        *(_QWORD *)a3 = &unk_24D61B1F8;
        *(_DWORD *)(a3 + 8) = 269;
        *(_BYTE *)(a3 + 12) = 1;
        *(_WORD *)(a3 + 16) = v40;
        *(_BYTE *)(a3 + 18) = v41 != 0;
        break;
      case 270:
      case 272:
        if (*((_DWORD *)this + 4) == *((_DWORD *)a2 + 4))
          goto LABEL_45;
        goto LABEL_3;
      case 271:
        goto LABEL_22;
      default:
        goto LABEL_45;
    }
    *(_QWORD *)(a3 + 48) = 0;
  }
}

void TSUFormat::formatByUnsettingDecimalPlacesIfPresent(TSUFormat *this@<X0>, TSUFormat *a2@<X8>)
{
  int v4;
  __int128 v5;

  if (((**(uint64_t (***)(TSUFormat *))this)(this) & 0xFFFFFFFC) == 0x100)
  {
    v5 = *((_OWORD *)this + 1);
    BYTE8(v5) = -2;
    v4 = (**(uint64_t (***)(TSUFormat *))this)(this);
    TSUFormat::TSUFormat((uint64_t)a2, &v4, &v5);
  }
  else
  {
    TSUFormat::TSUFormat(a2, this);
  }
}

TSUCustomFormat *TSUFormat::customConditionalFormatStructForDouble@<X0>(TSUCustomFormat **this@<X0>, double a2@<D0>, uint64_t a3@<X8>)
{
  id v6;
  uint64_t v7;
  TSUCustomFormat *result;

  *(_QWORD *)(a3 + 32) = 0;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_DWORD *)a3 = -1;
  if ((*(unsigned int (**)(TSUCustomFormat **))*this)(this) != 270)
  {
    v6 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "TSUFormatStruct TSUFormat::customConditionalFormatStructForDouble(double) const");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormat.mm"), 338, CFSTR("This only works for Custom Numbers"));
  }
  result = (TSUCustomFormat *)(*(uint64_t (**)(TSUCustomFormat **))*this)(this);
  if ((_DWORD)result == 270)
  {
    result = this[6];
    if (result)
    {
      *(_DWORD *)a3 = *((_DWORD *)this + 2);
      *(_DWORD *)(a3 + 8) = *((_DWORD *)this + 4);
      result = (TSUCustomFormat *)TSUCustomFormat::formatByEvaluatingConditionsWithDouble(result, a2);
      *(_QWORD *)(a3 + 16) = result;
    }
  }
  return result;
}

uint64_t TSUFormat::isEqual(TSUFormat *this, const TSUFormat *a2)
{
  unsigned int v2;
  uint64_t result;
  int v6;
  int v7;
  id v8;
  uint64_t v9;
  char v10;
  _BOOL4 v11;
  BOOL v12;
  void *v13;
  __int16 v14;
  char v15;
  int v17;

  v2 = *((_DWORD *)this + 2);
  if (v2 != *((_DWORD *)a2 + 2))
    return 0;
  result = 1;
  switch(v2)
  {
    case 0xFEu:
      goto LABEL_19;
    case 0xFFu:
      goto LABEL_6;
    case 0x100u:
    case 0x102u:
      goto LABEL_15;
    case 0x101u:
      v13 = (void *)*((_QWORD *)this + 2);
      if (v13 != *((void **)a2 + 2))
      {
        result = objc_msgSend(v13, "isEqualToString:");
        if (!(_DWORD)result)
          return result;
      }
      if (((*((unsigned __int16 *)a2 + 12) ^ *((unsigned __int16 *)this + 12)) & 0x1000) != 0)
        return 0;
LABEL_15:
      v14 = *((_WORD *)a2 + 12) ^ *((_WORD *)this + 12);
      if ((v14 & 0xF00) != 0)
        return 0;
LABEL_18:
      if ((_BYTE)v14)
        return 0;
LABEL_19:
      result = 1;
      break;
    case 0x103u:
      v14 = *((_WORD *)a2 + 12) ^ *((_WORD *)this + 12);
      goto LABEL_18;
    case 0x104u:
    case 0x107u:
    case 0x10Bu:
      return result;
    case 0x105u:
      result = objc_msgSend(*((id *)this + 3), "isEqualToString:", *((_QWORD *)a2 + 3));
      if (!(_DWORD)result)
        return result;
      v15 = *((_BYTE *)a2 + 16) ^ *((_BYTE *)this + 16);
      v11 = (v15 & 2) == 0;
      v12 = (v15 & 1) == 0;
      return v12 && v11;
    case 0x106u:
      v6 = *((unsigned __int8 *)this + 16);
      v7 = *((unsigned __int8 *)a2 + 16);
      return v6 == v7;
    case 0x108u:
    case 0x109u:
      if (*((double *)this + 2) != *((double *)a2 + 2)
        || *((double *)this + 3) != *((double *)a2 + 3)
        || *((double *)this + 4) != *((double *)a2 + 4)
        || *((_DWORD *)this + 10) != *((_DWORD *)a2 + 10))
      {
        return 0;
      }
      v10 = *((_BYTE *)a2 + 44) ^ *((_BYTE *)this + 44);
      v11 = (v10 & 0xC) == 0;
      v12 = (v10 & 3) == 0;
      return v12 && v11;
    case 0x10Au:
      if (*((_DWORD *)this + 4) != *((_DWORD *)a2 + 4))
        return 0;
      v6 = *((_DWORD *)this + 5);
      v7 = *((_DWORD *)a2 + 5);
      return v6 == v7;
    case 0x10Cu:
      if (*((_DWORD *)this + 5) != *((_DWORD *)a2 + 5) || *((_DWORD *)this + 6) != *((_DWORD *)a2 + 6))
        return 0;
      v6 = *((_DWORD *)this + 7);
      v7 = *((_DWORD *)a2 + 7);
      return v6 == v7;
    case 0x10Du:
      v17 = *((unsigned __int16 *)a2 + 8);
      if ((unsigned __int16)v17 != *((_WORD *)this + 8))
        return 0;
      return (((v17 | (*((unsigned __int8 *)a2 + 18) << 16)) ^ (*((unsigned __int16 *)this + 8) | (*((unsigned __int8 *)this + 18) << 16))) & 0x10000) == 0;
    case 0x10Eu:
    case 0x10Fu:
    case 0x110u:
      v6 = *((_DWORD *)this + 4);
      v7 = *((_DWORD *)a2 + 4);
      return v6 == v7;
    default:
      if (v2 < 2 || v2 == -999)
        return result;
LABEL_6:
      v8 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
      v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL TSUFormat::isEqual(const TSUFormat &) const");
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormat.mm"), 412, CFSTR("We should have dealt with any types earlier."));
      return 0;
  }
  return result;
}

uint64_t TSUFormat::numberStruct(TSUFormat *this)
{
  id v2;
  uint64_t v3;

  if ((*((_DWORD *)this + 2) & 0xFFFFFFFC) != 0x100)
  {
    v2 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "TSUFormatStructNumber TSUFormat::numberStruct() const");
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormat.mm"), 423, CFSTR("Format is not of this type.  Can't return this."));
  }
  return *((_QWORD *)this + 2);
}

uint64_t TSUFormat::fractionFormatStruct(TSUFormat *this)
{
  id v2;
  uint64_t v3;

  if (*((_DWORD *)this + 2) != 262)
  {
    v2 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "TSUFormatStructFraction TSUFormat::fractionFormatStruct() const");
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormat.mm"), 429, CFSTR("Format is not of this type.  Can't return this."));
  }
  return *((unsigned int *)this + 4);
}

uint64_t TSUFormat::baseFormatStruct(TSUFormat *this)
{
  id v2;
  uint64_t v3;

  if (*((_DWORD *)this + 2) != 269)
  {
    v2 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "TSUFormatStructBase TSUFormat::baseFormatStruct() const");
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormat.mm"), 436, CFSTR("Format is not of this type.  Can't return this."));
  }
  return *((unsigned __int16 *)this + 8) | (*((unsigned __int8 *)this + 18) << 16);
}

uint64_t TSUFormat::dateFormatStruct(TSUFormat *this)
{
  id v2;
  uint64_t v3;
  id v4;

  if (*((_DWORD *)this + 2) != 261)
  {
    v2 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "TSUFormatStructDate TSUFormat::dateFormatStruct() const");
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormat.mm"), 443, CFSTR("Format is not of this type.  Can't return this."));
  }
  v4 = *((id *)this + 3);
  return *((_QWORD *)this + 2);
}

uint64_t TSUFormat::durationFormatStruct(TSUFormat *this)
{
  id v2;
  uint64_t v3;

  if (*((_DWORD *)this + 2) != 268)
  {
    v2 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "TSUFormatStructDuration TSUFormat::durationFormatStruct() const");
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormat.mm"), 451, CFSTR("Format is not of this type.  Can't return this."));
  }
  return *((_QWORD *)this + 2);
}

uint64_t TSUFormat::customFormatStruct(TSUFormat *this)
{
  id v2;
  uint64_t v3;

  if ((*((_DWORD *)this + 2) - 270) >= 3)
  {
    v2 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "TSUFormatStructCustom TSUFormat::customFormatStruct() const");
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormat.mm"), 457, CFSTR("Format is not of this type.  Can't return this."));
  }
  return *((_QWORD *)this + 2);
}

__n128 TSUFormat::controlFormatStruct@<Q0>(__n128 *this@<X0>, __n128 *a2@<X8>)
{
  id v4;
  uint64_t v5;
  __n128 result;
  __n128 v7;

  if (this->n128_u32[2] - 263 >= 5)
  {
    v4 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "TSUFormatStructControl TSUFormat::controlFormatStruct() const");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormat.mm"), 463, CFSTR("Format is not of this type.  Can't return this."));
  }
  result = this[1];
  v7 = this[2];
  *a2 = result;
  a2[1] = v7;
  return result;
}

uint64_t TSUFormat::multipleChoiceListStruct(TSUFormat *this)
{
  id v2;
  uint64_t v3;

  if (*((_DWORD *)this + 2) != 266)
  {
    v2 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "TSUFormatStructMultipleChoiceList TSUFormat::multipleChoiceListStruct() const");
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormat.mm"), 469, CFSTR("Format is not of this type.  Can't return this."));
  }
  return *((_QWORD *)this + 2);
}

__n128 TSUFormat::formatStruct@<Q0>(__n128 *this@<X0>, uint64_t a2@<X8>)
{
  __n128 result;
  unsigned __int32 v3;
  __n128 v4;

  result.n128_u64[0] = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  v3 = this->n128_u32[2];
  *(_DWORD *)a2 = v3;
  if ((v3 & 0xFFFFFFFC) == 0x100)
  {
LABEL_3:
    result = this[1];
    *(__n128 *)(a2 + 8) = result;
  }
  else
  {
    switch(v3)
    {
      case 0x105u:
      case 0x10Cu:
        goto LABEL_3;
      case 0x106u:
        *(_DWORD *)(a2 + 8) = this[1].n128_u32[0];
        break;
      case 0x10Du:
        *(_WORD *)(a2 + 8) = this[1].n128_u16[0];
        *(_BYTE *)(a2 + 10) = this[1].n128_u8[2];
        break;
      default:
        if (v3 - 270 <= 2)
          goto LABEL_3;
        if (v3 - 263 <= 4)
        {
          result = this[1];
          v4 = this[2];
          *(__n128 *)(a2 + 8) = result;
          *(__n128 *)(a2 + 24) = v4;
        }
        break;
    }
  }
  return result;
}

uint64_t TSUFormat::formatType(TSUFormat *this)
{
  return *((unsigned int *)this + 2);
}

uint64_t TSUFormat::setFormatType(uint64_t result, int a2)
{
  *(_DWORD *)(result + 8) = a2;
  return result;
}

void TSUFormatStructRelease(_DWORD *a1)
{
  int v1;
  id *v2;

  v1 = *a1;
  if ((*a1 & 0xFFFFFFFC) == 0x100)
  {
    v2 = (id *)(a1 + 2);
LABEL_6:

    return;
  }
  if (v1 == 266 || v1 == 261)
  {
    v2 = (id *)(a1 + 4);
    goto LABEL_6;
  }
}

_DWORD *TSUFormatStructRetain(_DWORD *result)
{
  int v1;
  id *v2;

  v1 = *result;
  if ((*result & 0xFFFFFFFC) == 0x100)
  {
    v2 = (id *)(result + 2);
    return *v2;
  }
  if (v1 == 266 || v1 == 261)
  {
    v2 = (id *)(result + 4);
    return *v2;
  }
  return result;
}

const __CFString *NSStringForTSUFormatType(int a1)
{
  int v1;
  const __CFString *result;

  if (a1 <= 0)
  {
    if (a1 == -999)
    {
      return CFSTR("TSUFormatTypeUnknown");
    }
    else if (a1 == -1)
    {
      return CFSTR("TSUFormatTypeInvalid");
    }
    else if (a1)
    {
      return CFSTR("Unknown TSU format type");
    }
    else
    {
      return CFSTR("TSUFormatTypeUnsupported");
    }
  }
  else
  {
    v1 = a1 - 254;
    result = CFSTR("TSUFormatTypeDecimal");
    switch(v1)
    {
      case 0:
        result = CFSTR("TSUFormatTypeConflicting");
        break;
      case 1:
        return CFSTR("Unknown TSU format type");
      case 2:
        return result;
      case 3:
        result = CFSTR("TSUFormatTypeCurrency");
        break;
      case 4:
        result = CFSTR("TSUFormatTypePercent");
        break;
      case 5:
        result = CFSTR("TSUFormatTypeScientific");
        break;
      case 6:
        result = CFSTR("TSUFormatTypeText");
        break;
      case 7:
        result = CFSTR("TSUFormatTypeDateTime");
        break;
      case 8:
        result = CFSTR("TSUFormatTypeFraction");
        break;
      case 9:
        result = CFSTR("TSUFormatTypeCheckbox");
        break;
      case 10:
        result = CFSTR("TSUFormatTypeStepper");
        break;
      case 11:
        result = CFSTR("TSUFormatTypeSlider");
        break;
      case 12:
        result = CFSTR("TSUFormatTypeMultipleChoiceList");
        break;
      case 13:
        result = CFSTR("TSUFormatTypeRating");
        break;
      case 14:
        result = CFSTR("TSUFormatTypeDuration");
        break;
      case 15:
        result = CFSTR("TSUFormatTypeBase");
        break;
      case 16:
        result = CFSTR("TSUFormatTypeCustomNumber");
        break;
      case 17:
        result = CFSTR("TSUFormatTypeCustomText");
        break;
      case 18:
        result = CFSTR("TSUFormatTypeCustomDateTime");
        break;
      default:
        if (CFSTR("TSUFormatTypeDecimal") != 1)
          return CFSTR("Unknown TSU format type");
        result = CFSTR("TSUFormatTypeNotSet");
        break;
    }
  }
  return result;
}

const __CFString *DisplayNSStringForTSUFormatType(int a1)
{
  const __CFString *v1;

  if (a1 <= 0)
  {
    if (a1 == -999)
    {
      v1 = CFSTR("Unknown");
    }
    else if (a1 == -1)
    {
      v1 = CFSTR("Invalid");
    }
    else
    {
      if (a1)
        return CFSTR("Unknown TSU format type");
      v1 = CFSTR("Unsupported");
    }
  }
  else
  {
    v1 = CFSTR("Number");
    switch(a1)
    {
      case 254:
        v1 = CFSTR("Conflicting");
        return (const __CFString *)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", v1, &stru_24D61C228, CFSTR("TSUtility"));
      case 255:
        v1 = CFSTR("Automatic");
        return (const __CFString *)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", v1, &stru_24D61C228, CFSTR("TSUtility"));
      case 256:
        return (const __CFString *)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", v1, &stru_24D61C228, CFSTR("TSUtility"));
      case 257:
        v1 = CFSTR("Currency");
        return (const __CFString *)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", v1, &stru_24D61C228, CFSTR("TSUtility"));
      case 258:
        v1 = CFSTR("Percentage");
        return (const __CFString *)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", v1, &stru_24D61C228, CFSTR("TSUtility"));
      case 259:
        v1 = CFSTR("Scientific");
        return (const __CFString *)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", v1, &stru_24D61C228, CFSTR("TSUtility"));
      case 260:
        v1 = CFSTR("Text");
        return (const __CFString *)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", v1, &stru_24D61C228, CFSTR("TSUtility"));
      case 261:
        v1 = CFSTR("Date & Time");
        return (const __CFString *)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", v1, &stru_24D61C228, CFSTR("TSUtility"));
      case 262:
        v1 = CFSTR("Fraction");
        return (const __CFString *)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", v1, &stru_24D61C228, CFSTR("TSUtility"));
      case 263:
        v1 = CFSTR("Checkbox");
        return (const __CFString *)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", v1, &stru_24D61C228, CFSTR("TSUtility"));
      case 264:
        v1 = CFSTR("Stepper");
        return (const __CFString *)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", v1, &stru_24D61C228, CFSTR("TSUtility"));
      case 265:
        v1 = CFSTR("Slider");
        return (const __CFString *)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", v1, &stru_24D61C228, CFSTR("TSUtility"));
      case 266:
        v1 = CFSTR("Pop-Up Menu");
        return (const __CFString *)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", v1, &stru_24D61C228, CFSTR("TSUtility"));
      case 267:
        v1 = CFSTR("Star Rating");
        return (const __CFString *)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", v1, &stru_24D61C228, CFSTR("TSUtility"));
      case 268:
        v1 = CFSTR("Duration");
        return (const __CFString *)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", v1, &stru_24D61C228, CFSTR("TSUtility"));
      case 269:
        v1 = CFSTR("Numeral System");
        return (const __CFString *)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", v1, &stru_24D61C228, CFSTR("TSUtility"));
      case 270:
      case 271:
      case 272:
        v1 = CFSTR("Custom");
        return (const __CFString *)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", v1, &stru_24D61C228, CFSTR("TSUtility"));
      default:
        if (a1 != 1)
          return CFSTR("Unknown TSU format type");
        v1 = CFSTR("Not Set");
        break;
    }
  }
  return (const __CFString *)objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", v1, &stru_24D61C228, CFSTR("TSUtility"));
}

uint64_t TSUFormatTypeForDisplayNSString(void *a1)
{
  if ((objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("Number"), &stru_24D61C228, CFSTR("TSUtility"))) & 1) != 0|| (objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("Number"), &stru_24D61C228, CFSTR("TSUtility"))) & 1) != 0)
  {
    return 256;
  }
  if ((objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("Scientific"), &stru_24D61C228, CFSTR("TSUtility"))) & 1) != 0)return 259;
  if ((objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("Fraction"), &stru_24D61C228, CFSTR("TSUtility"))) & 1) != 0)return 262;
  if ((objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("Currency"), &stru_24D61C228, CFSTR("TSUtility"))) & 1) != 0)return 257;
  if ((objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("Percentage"), &stru_24D61C228, CFSTR("TSUtility"))) & 1) != 0)return 258;
  if ((objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("Date & Time"), &stru_24D61C228, CFSTR("TSUtility"))) & 1) != 0)return 261;
  if ((objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("Duration"), &stru_24D61C228, CFSTR("TSUtility"))) & 1) != 0)return 268;
  if ((objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("Text"), &stru_24D61C228, CFSTR("TSUtility"))) & 1) != 0)return 260;
  if ((objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("Unknown"), &stru_24D61C228, CFSTR("TSUtility"))) & 1) != 0)return 4294966297;
  if ((objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("Not Set"), &stru_24D61C228, CFSTR("TSUtility"))) & 1) != 0)return 1;
  if ((objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("Invalid"), &stru_24D61C228, CFSTR("TSUtility"))) & 1) != 0)return 0xFFFFFFFFLL;
  if ((objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("Conflicting"), &stru_24D61C228, CFSTR("TSUtility"))) & 1) != 0)return 254;
  if ((objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("Unsupported"), &stru_24D61C228, CFSTR("TSUtility"))) & 1) != 0)return 0;
  if ((objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("Checkbox"), &stru_24D61C228, CFSTR("TSUtility"))) & 1) != 0)return 263;
  if ((objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("Stepper"), &stru_24D61C228, CFSTR("TSUtility"))) & 1) != 0)return 264;
  if ((objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("Slider"), &stru_24D61C228, CFSTR("TSUtility"))) & 1) != 0)return 265;
  if ((objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("Pop-Up Menu"), &stru_24D61C228, CFSTR("TSUtility"))) & 1) != 0)return 266;
  if ((objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("Star Rating"), &stru_24D61C228, CFSTR("TSUtility"))) & 1) != 0)return 267;
  if ((objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("Numeral System"), &stru_24D61C228, CFSTR("TSUtility"))) & 1) != 0)return 269;
  if ((objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("Custom"), &stru_24D61C228, CFSTR("TSUtility"))) & 1) != 0)return 270;
  if ((objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("Custom"), &stru_24D61C228, CFSTR("TSUtility"))) & 1) != 0)return 271;
  if ((objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("Custom"), &stru_24D61C228, CFSTR("TSUtility"))) & 1) != 0)return 272;
  if (objc_msgSend(a1, "isEqualToString:", objc_msgSend((id)SFUBundle(), "localizedStringForKey:value:table:", CFSTR("Automatic"), &stru_24D61C228, CFSTR("TSUtility"))))return 255;
  return 4294966297;
}

uint64_t TSUFormatStructEquals(int *a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  void *v5;
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;

  v2 = *a1;
  if (*a1 != *(_DWORD *)a2)
    return 0;
  if ((v2 & 0xFFFFFFFC) != 0x100)
  {
    switch(v2)
    {
      case 261:
        if (((*(_DWORD *)(a2 + 8) ^ a1[2]) & 3) != 0)
          return 0;
        v6 = *(_QWORD *)(a2 + 16);
        v5 = (void *)*((_QWORD *)a1 + 2);
        return objc_msgSend(v5, "isEqual:", v6);
      case 262:
        return *(unsigned __int8 *)(a2 + 8) == *((unsigned __int8 *)a1 + 8);
      case 268:
        if (a1[3] != *(_DWORD *)(a2 + 12))
          return 0;
        v9 = *((_QWORD *)a1 + 2);
        v10 = *(_QWORD *)(a2 + 16);
        return (_DWORD)v9 == (_DWORD)v10 && HIDWORD(v9) == HIDWORD(v10);
      case 269:
        return (((*(unsigned __int16 *)(a2 + 8) | (*(unsigned __int8 *)(a2 + 10) << 16)) ^ (*((unsigned __int16 *)a1 + 4) | (*((unsigned __int8 *)a1 + 10) << 16))) & 0x1FFFF) == 0;
      default:
        if ((v2 - 270) <= 2)
          return a1[2] == *(_DWORD *)(a2 + 8);
        if ((v2 - 263) > 4)
          return 1;
        if (*((double *)a1 + 1) == *(double *)(a2 + 8)
          && *((double *)a1 + 2) == *(double *)(a2 + 16)
          && *((double *)a1 + 3) == *(double *)(a2 + 24)
          && a1[8] == *(_DWORD *)(a2 + 32))
        {
          return ((*((_BYTE *)a1 + 36) ^ *(_BYTE *)(a2 + 36)) & 3) == 0
              && ((*((_BYTE *)a1 + 36) ^ *(_BYTE *)(a2 + 36)) & 0xC) == 0;
        }
        break;
    }
    return 0;
  }
  v3 = *(_QWORD *)(a2 + 16) ^ *((_QWORD *)a1 + 2);
  if ((v3 & 0x1800) != 0)
    return 0;
  if (*(_BYTE *)(a2 + 16) != *((_BYTE *)a1 + 16) || (v3 & 0x700) != 0)
    return 0;
  v5 = (void *)*((_QWORD *)a1 + 1);
  v6 = *(_QWORD *)(a2 + 8);
  return objc_msgSend(v5, "isEqual:", v6);
}

uint64_t TSUFormatStructNumberEquals(void *a1, int a2, uint64_t a3, int a4)
{
  if (((a4 ^ a2) & 0x1800) != 0
    || a4 != a2
    || (((unsigned __int16)a4 ^ (unsigned __int16)a2) & 0x700) != 0)
  {
    return 0;
  }
  else
  {
    return objc_msgSend(a1, "isEqual:");
  }
}

BOOL TSUFormatStructFractionEquals(char a1, char a2)
{
  return a2 == a1;
}

BOOL TSUFormatStructBaseEquals(unsigned int a1, int a2)
{
  return ((a2 ^ a1) & 0x1FFFFLL) == 0;
}

uint64_t TSUFormatStructDateEquals(unsigned int a1, void *a2, int a3, uint64_t a4)
{
  if (((a3 ^ a1) & 3) != 0)
    return 0;
  else
    return objc_msgSend(a2, "isEqual:", a4);
}

BOOL TSUFormatStructDurationEquals(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return HIDWORD(a1) == HIDWORD(a3) && (_DWORD)a2 == (_DWORD)a4 && HIDWORD(a2) == HIDWORD(a4);
}

BOOL TSUFormatStructCustomEquals(int a1, uint64_t a2, int a3)
{
  return a1 == a3;
}

BOOL TSUFormatStructControlEquals(uint64_t a1, uint64_t a2)
{
  if (*(double *)a1 != *(double *)a2
    || *(double *)(a1 + 8) != *(double *)(a2 + 8)
    || *(double *)(a1 + 16) != *(double *)(a2 + 16)
    || *(_DWORD *)(a1 + 24) != *(_DWORD *)(a2 + 24))
  {
    return 0;
  }
  if (((*(_BYTE *)(a2 + 28) ^ *(_BYTE *)(a1 + 28)) & 3) != 0)
    return 0;
  return ((*(_BYTE *)(a2 + 28) ^ *(_BYTE *)(a1 + 28)) & 0xC) == 0;
}

uint64_t TSUFormatStructMultipleChoiceListEquals(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  if (a1 == a3)
    return objc_msgSend((id)objc_msgSend(a2, "choices"), "isEqual:", objc_msgSend(a4, "choices"));
  else
    return 0;
}

uint64_t TSUFormatStructHash(unsigned int *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  __int128 v7;
  unint64_t v8;
  uint64_t v9;
  _OWORD v10[2];

  v1 = *a1;
  if ((v1 & 0xFFFFFFFC) == 0x100)
  {
    v2 = (*((_QWORD *)a1 + 2) >> 6) & 0x1CLL | (32 * *((_QWORD *)a1 + 2)) | (*((_QWORD *)a1 + 2) >> 10) & 2 | (*((_QWORD *)a1 + 2) >> 12) & 1;
    return objc_msgSend(*((id *)a1 + 1), "hash") ^ v1 ^ v2;
  }
  else
  {
    switch((int)v1)
    {
      case 261:
        v1 = __rbit32(a1[2]) >> 30;
        v4 = objc_msgSend(*((id *)a1 + 2), "hash") ^ 0x105;
        goto LABEL_11;
      case 262:
        v5 = *((char *)a1 + 8);
        v6 = 262;
        goto LABEL_7;
      case 268:
        v5 = (4 * (a1[3] | *((_QWORD *)a1 + 2))) | HIDWORD(*((_QWORD *)a1 + 2));
        v6 = 268;
        goto LABEL_7;
      case 269:
        return ((*((unsigned __int16 *)a1 + 4) << 9) & 0x1FFFE | (*((unsigned __int16 *)a1 + 4) >> 7) & 0x1FFFEu | (unint64_t)(*((_BYTE *)a1 + 10) & 1)) ^ 0x10D;
      default:
        if ((v1 - 270) > 2)
        {
          if ((v1 - 264) >= 2)
          {
            if ((_DWORD)v1 == 266)
            {
              v8 = *((_QWORD *)a1 + 1);
              v9 = objc_msgSend((id)objc_msgSend(*((id *)a1 + 2), "choices"), "hash");
              v5 = v8 ^ HIDWORD(v8);
              v6 = v9 ^ 0x10A;
LABEL_7:
              result = v5 ^ v6;
            }
            else
            {
              result = (int)v1;
            }
          }
          else
          {
            v7 = *(_OWORD *)(a1 + 6);
            v10[0] = *(_OWORD *)(a1 + 2);
            v10[1] = v7;
            result = TSUFormatStructControlHash((uint64_t)v10) ^ v1;
          }
        }
        else
        {
          v4 = a1[2];
LABEL_11:
          result = v4 ^ v1;
        }
        break;
    }
  }
  return result;
}

uint64_t TSUFormatStructNumberHash(void *a1, unint64_t a2)
{
  return objc_msgSend(a1, "hash") ^ ((a2 >> 6) & 0x1C | (32 * a2) | (a2 >> 10) & 2 | (a2 >> 12) & 1);
}

uint64_t TSUFormatStructFractionHash(uint64_t result)
{
  return (char)result;
}

unint64_t TSUFormatStructBaseHash(unint64_t a1)
{
  return (a1 >> 7) & 0x1FE | ((unint64_t)a1 << 9) | (a1 >> 16) & 1;
}

uint64_t TSUFormatStructDateHash(unsigned int a1, void *a2)
{
  return objc_msgSend(a2, "hash") ^ (__rbit32(a1) >> 30);
}

unint64_t TSUFormatStructDurationHash(uint64_t a1, unint64_t a2)
{
  return (4 * (HIDWORD(a1) | a2)) | HIDWORD(a2);
}

uint64_t TSUFormatStructCustomHash(uint64_t result)
{
  return result;
}

unint64_t TSUFormatStructControlHash(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = TSUHash((char *)a1, 8);
  v3 = TSUHash((char *)(a1 + 8), 8) ^ v2;
  return v3 ^ TSUHash((char *)(a1 + 16), 8) ^ *(int *)(a1 + 24) ^ (((unint64_t)*(unsigned __int8 *)(a1 + 28) >> 2) & 3 | (4 * (*(_BYTE *)(a1 + 28) & 3)));
}

uint64_t TSUFormatStructMultipleChoiceListHash(unint64_t a1, void *a2)
{
  return a1 ^ HIDWORD(a1) ^ objc_msgSend((id)objc_msgSend(a2, "choices"), "hash");
}

void TSUFormatInit(void)
{
  const __CFLocale *v0;
  __CFNumberFormatter *v1;
  __CFNumberFormatter *v2;
  __CFNumberFormatter *v3;
  __CFNumberFormatter *v4;

  if ((sTSUFormatIsInitted & 1) == 0)
  {
    v0 = CFLocaleCopyCurrent();
    v1 = CFNumberFormatterCreate(0, v0, kCFNumberFormatterCurrencyStyle);
    sTSUFormatCurrencyString = -[__CFString copy]((id)CFNumberFormatterGetFormat(v1), "copy");
    CFRelease(v1);
    sTSUFormatCurrencyStringMinus = objc_msgSend(+[TSUNumberFormatter formatString:transformedForNegativeStyle:](TSUNumberFormatter, "formatString:transformedForNegativeStyle:", sTSUFormatCurrencyString, 0), "copy");
    sTSUFormatCurrencyStringRedOnly = objc_msgSend(+[TSUNumberFormatter formatString:transformedForNegativeStyle:](TSUNumberFormatter, "formatString:transformedForNegativeStyle:", sTSUFormatCurrencyString, 1), "copy");
    sTSUFormatCurrencyStringWithParens = objc_msgSend(+[TSUNumberFormatter formatString:transformedForNegativeStyle:](TSUNumberFormatter, "formatString:transformedForNegativeStyle:", sTSUFormatCurrencyString, 2), "copy");
    v2 = CFNumberFormatterCreate(0, v0, kCFNumberFormatterPercentStyle);
    sTSUFormatPercentageString = -[__CFString copy]((id)CFNumberFormatterGetFormat(v2), "copy");
    CFRelease(v2);
    sTSUFormatPercentageStringMinus = objc_msgSend(+[TSUNumberFormatter formatString:transformedForNegativeStyle:](TSUNumberFormatter, "formatString:transformedForNegativeStyle:", sTSUFormatPercentageString, 0), "copy");
    sTSUFormatPercentageStringRedOnly = objc_msgSend(+[TSUNumberFormatter formatString:transformedForNegativeStyle:](TSUNumberFormatter, "formatString:transformedForNegativeStyle:", sTSUFormatPercentageString, 1), "copy");
    sTSUFormatPercentageStringWithParens = objc_msgSend(+[TSUNumberFormatter formatString:transformedForNegativeStyle:](TSUNumberFormatter, "formatString:transformedForNegativeStyle:", sTSUFormatPercentageString, 2), "copy");
    v3 = CFNumberFormatterCreate(0, v0, kCFNumberFormatterNoStyle);
    CFNumberFormatterSetFormat(v3, CFSTR("#.##E+00"));
    sTSUFormatScientificString = -[__CFString copy]((id)CFNumberFormatterGetFormat(v3), "copy");
    CFRelease(v3);
    sTSUFormatScientificStringMinus = objc_msgSend(+[TSUNumberFormatter formatString:transformedForNegativeStyle:](TSUNumberFormatter, "formatString:transformedForNegativeStyle:", sTSUFormatScientificString, 0), "copy");
    sTSUFormatScientificStringRedOnly = objc_msgSend(+[TSUNumberFormatter formatString:transformedForNegativeStyle:](TSUNumberFormatter, "formatString:transformedForNegativeStyle:", sTSUFormatScientificString, 1), "copy");
    sTSUFormatScientificStringWithParens = objc_msgSend(+[TSUNumberFormatter formatString:transformedForNegativeStyle:](TSUNumberFormatter, "formatString:transformedForNegativeStyle:", sTSUFormatScientificString, 2), "copy");
    v4 = CFNumberFormatterCreate(0, v0, kCFNumberFormatterDecimalStyle);
    sTSUFormatDecimalString = -[__CFString copy]((id)CFNumberFormatterGetFormat(v4), "copy");
    CFRelease(v4);
    sTSUFormatDecimalStringMinus = objc_msgSend(+[TSUNumberFormatter formatString:transformedForNegativeStyle:](TSUNumberFormatter, "formatString:transformedForNegativeStyle:", sTSUFormatDecimalString, 0), "copy");
    sTSUFormatDecimalStringRedOnly = objc_msgSend(+[TSUNumberFormatter formatString:transformedForNegativeStyle:](TSUNumberFormatter, "formatString:transformedForNegativeStyle:", sTSUFormatDecimalString, 1), "copy");
    sTSUFormatDecimalStringWithParens = objc_msgSend(+[TSUNumberFormatter formatString:transformedForNegativeStyle:](TSUNumberFormatter, "formatString:transformedForNegativeStyle:", sTSUFormatDecimalString, 2), "copy");
    sTSUFormatIsInitted = 1;
    CFRelease(v0);
    TSUDateFormatterInit();
  }
}

uint64_t TSUFormatDefaultFormatStringForValueType(int a1, int a2)
{
  int v2;
  uint64_t result;

  v2 = a1 - 257;
  result = 0;
  switch(v2)
  {
    case 0:
      if ((a2 - 2) < 2)
      {
        result = sTSUFormatCurrencyStringWithParens;
      }
      else if (a2 == 1)
      {
        result = sTSUFormatCurrencyStringRedOnly;
      }
      else if (a2)
      {
        result = sTSUFormatCurrencyString;
      }
      else
      {
        result = sTSUFormatCurrencyStringMinus;
      }
      break;
    case 1:
      if ((a2 - 2) < 2)
      {
        result = sTSUFormatPercentageStringWithParens;
      }
      else if (a2 == 1)
      {
        result = sTSUFormatPercentageStringRedOnly;
      }
      else if (a2)
      {
        result = sTSUFormatPercentageString;
      }
      else
      {
        result = sTSUFormatPercentageStringMinus;
      }
      break;
    case 2:
      if ((a2 - 2) < 2)
      {
        result = sTSUFormatScientificStringWithParens;
      }
      else if (a2 == 1)
      {
        result = sTSUFormatScientificStringRedOnly;
      }
      else if (a2)
      {
        result = sTSUFormatScientificString;
      }
      else
      {
        result = sTSUFormatScientificStringMinus;
      }
      break;
    case 4:
      return result;
    default:
      if ((a2 - 2) < 2)
      {
        result = sTSUFormatDecimalStringWithParens;
      }
      else if (a2 == 1)
      {
        result = sTSUFormatDecimalStringRedOnly;
      }
      else if (a2)
      {
        result = sTSUFormatDecimalString;
      }
      else
      {
        result = sTSUFormatDecimalStringMinus;
      }
      break;
  }
  return result;
}

uint64_t TSUFormatTypeToTSUNumberValueType(int a1)
{
  if ((a1 - 256) > 0xE)
    return 4294966297;
  else
    return dword_216DA603C[a1 - 256];
}

uint64_t TSUFormatTypeFromTSUNumberValueType(unsigned int a1)
{
  if (a1 > 5)
    return 4294966297;
  else
    return dword_216DA6078[a1];
}

uint64_t TSUFormatFractionStringFromDouble(char *a1, double a2)
{
  return TSUNumberFormatFractionStringFromDouble(*a1, a2);
}

void *TSUFormatBaseStringFromDouble(uint64_t a1, double a2)
{
  return TSUNumberFormatBaseStringFromDouble(*(_WORD *)a1, HIBYTE(*(_WORD *)a1), *(_BYTE *)(a1 + 2) & 1, a2);
}

__CFString *TSUFormatStructStringFromDouble(uint64_t a1, double a2)
{
  int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned __int16 v8;
  int v9;
  _BOOL4 v10;
  int v11;
  int v13;
  __CFString *v14;

  v4 = *(_DWORD *)a1;
  v5 = *(_DWORD *)a1 & 0xFFFFFFFC;
  if (v5 == 256)
  {
    v6 = *(unsigned __int16 *)(a1 + 16);
    if (*(_WORD *)(a1 + 16) == 253 || (~v6 & 0xFE) == 0)
      v8 = kTSUNumberFormatterDecimalPlacesAsManyAsNecessary;
    else
      v8 = *(_WORD *)(a1 + 16);
    v9 = (v6 >> 8) & 7;
    v10 = v9 != 0;
  }
  else
  {
    v8 = 0;
    v10 = 0;
    v9 = 0;
  }
  v11 = TSUFormatTypeToTSUNumberValueType(*(_DWORD *)a1);
  if (v11 == -999)
    return &stru_24D61C228;
  v13 = v11;
  v14 = (__CFString *)TSUFormatDefaultFormatStringForValueType(v4, v9);
  return TSUNumberFormatStringFromDouble(v13, v8, v8, v10, v14, *(__CFString **)(a1 + 8), v5 == 256, 0, a2, 1.0, 0, 0, v10, 0, 0, 0, (*(_WORD *)(a1 + 16) & 0x800) != 0, (*(_WORD *)(a1 + 16) & 0x1000) != 0, 0,
           *(_QWORD *)(a1 + 8),
           BYTE1(*(_QWORD *)(a1 + 8)),
           WORD1(*(_QWORD *)(a1 + 8)) & 1,
           (char)*(_QWORD *)(a1 + 8));
}

const __CFString *TSUFormatCustomStringFromDouble(uint64_t a1, double a2)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  unsigned int v19;
  int v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  double v24;
  int v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  __CFString *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  int v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  __CFString *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  double v49;
  int v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  unsigned __int16 v54;

  if (*(_DWORD *)a1 == 270)
  {
    v4 = (uint64_t *)(a1 + 16);
    v5 = *(_QWORD *)(a1 + 16);
    v6 = v5;
  }
  else
  {
    v7 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *TSUFormatCustomStringFromDouble(TSUFormatStruct *, double)");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormatUtilities.mm"), 289, CFSTR("Not a custom number format."));
    v4 = (uint64_t *)(a1 + 16);
    v6 = *(_QWORD *)(a1 + 16);
    if ((*(_DWORD *)a1 - 270) >= 3)
    {
      v9 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
      v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "const TSUCustomFormatDataStruct *TSUFormatGetCustomFormatData(const TSUFormatStruct)");
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormatTypes.h"), 579, CFSTR("Accessor requires a custom format."));
      v5 = *(_QWORD *)(a1 + 16);
      if ((*(_DWORD *)a1 - 270) >= 3)
      {
        v11 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
        v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *TSUFormatGetCustomFormatString(const TSUFormatStruct)");
        objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormatTypes.h"), 592, CFSTR("Accessor requires a custom format."));
      }
    }
    else
    {
      v5 = *(_QWORD *)(a1 + 16);
    }
  }
  if (v5)
  {
    v13 = *(void **)(v5 + 8);
  }
  else
  {
    v14 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *TSUFormatGetCustomFormatString(const TSUFormatStruct)");
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormatTypes.h"), 593, CFSTR("Custom format is not correctly populated."));
    v13 = 0;
  }
  if (!objc_msgSend(v13, "length"))
    return (const __CFString *)v13;
  if (objc_msgSend(v13, "characterAtIndex:", 0) == 39
    && objc_msgSend(v13, "characterAtIndex:", objc_msgSend(v13, "length") - 1) == 39)
  {
    v16 = (void *)objc_msgSend(v13, "substringFromIndex:", 1);
    v17 = objc_msgSend(v16, "rangeOfString:", CFSTR("'"));
    if (v17 == objc_msgSend(v16, "length") - 1)
      return (const __CFString *)(id)objc_msgSend(v16, "substringToIndex:", objc_msgSend(v16, "length") - 1);
  }
  v19 = *(unsigned __int8 *)(v6 + 56);
  v20 = *(_DWORD *)a1;
  if ((v19 & 0x20) != 0)
  {
    v25 = TSUFormatTypeToTSUNumberValueType(v20);
    if (v25 != -999)
    {
      HIBYTE(v54) = (v19 & 4) != 0;
      LOBYTE(v54) = (v19 & 0x10) != 0;
      HIWORD(v53) = *(unsigned __int8 *)(v6 + 53);
      WORD2(v53) = *(_WORD *)(v6 + 54);
      LODWORD(v53) = *(_DWORD *)(v6 + 49);
      return TSUNumberFormatStringFromDouble(v25, 0, 0, (v19 >> 3) & 1, *(__CFString **)(v6 + 8), *(__CFString **)(v6 + 16), 1, *(void **)(v6 + 24), a2, *(double *)(v6 + 40), *(void **)(v6 + 32), v53, (v19 & 8) != 0, 0, 0x101u, v54, v19 & 1, (v19 & 2) != 0, 0,
               0,
               0,
               0,
               *(char *)(v6 + 48));
    }
    return &stru_24D61C228;
  }
  v21 = *v4;
  if (v20 != 270)
  {
    v22 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v23 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "double TSUFormatGetCustomNumberFormatScaleFactor(const TSUFormatStruct)");
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormatTypes.h"), 614, CFSTR("Accessor requires a custom number format."));
  }
  if (v21)
  {
    v24 = *(double *)(v21 + 40);
  }
  else
  {
    v26 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v27 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "double TSUFormatGetCustomNumberFormatScaleFactor(const TSUFormatStruct)");
    objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormatTypes.h"), 615, CFSTR("Custom format is not correctly populated."));
    v24 = 1.0;
  }
  v28 = *(_QWORD *)(a1 + 16);
  if ((*(_DWORD *)a1 - 270) >= 3)
  {
    v29 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v30 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *TSUFormatGetCustomFormatString(const TSUFormatStruct)");
    objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormatTypes.h"), 592, CFSTR("Accessor requires a custom format."));
  }
  if (v28)
  {
    v31 = *(__CFString **)(v28 + 8);
  }
  else
  {
    v32 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v33 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *TSUFormatGetCustomFormatString(const TSUFormatStruct)");
    objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormatTypes.h"), 593, CFSTR("Custom format is not correctly populated."));
    v31 = 0;
  }
  v34 = *(_QWORD *)(a1 + 16);
  if (*(_DWORD *)a1 != 270)
  {
    v35 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v36 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL TSUFormatGetCustomNumberFormatShowThousandsSeparator(const TSUFormatStruct)");
    objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormatTypes.h"), 624, CFSTR("Accessor requires a custom number format."));
  }
  if (v34)
  {
    v37 = *(_BYTE *)(v34 + 56) & 1;
  }
  else
  {
    v38 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v39 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL TSUFormatGetCustomNumberFormatShowThousandsSeparator(const TSUFormatStruct)");
    objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", v39, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormatTypes.h"), 625, CFSTR("Custom format is not correctly populated."));
    v37 = 0;
  }
  v40 = *(_QWORD *)(a1 + 16);
  if (*(_DWORD *)a1 != 270)
  {
    v41 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v42 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *TSUFormatGetCustomNumberFormatCurrencyCode(const TSUFormatStruct)");
    objc_msgSend(v41, "handleFailureInFunction:file:lineNumber:description:", v42, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormatTypes.h"), 603, CFSTR("Accessor requires a custom number format."));
  }
  if (v40)
  {
    v43 = *(__CFString **)(v40 + 16);
  }
  else
  {
    v44 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v45 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *TSUFormatGetCustomNumberFormatCurrencyCode(const TSUFormatStruct)");
    objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v45, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormatTypes.h"), 604, CFSTR("Custom format is not correctly populated."));
    v43 = 0;
  }
  v46 = *(_QWORD *)(a1 + 16);
  if (*(_DWORD *)a1 != 270)
  {
    v47 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v48 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL TSUFormatGetCustomNumberFormatIsConditional(const TSUFormatStruct)");
    objc_msgSend(v47, "handleFailureInFunction:file:lineNumber:description:", v48, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormatTypes.h"), 664, CFSTR("Accessor requires a custom number format."));
  }
  v49 = v24 * a2;
  if (v46)
  {
    v50 = (*(unsigned __int8 *)(v46 + 56) >> 3) & 1;
  }
  else
  {
    v51 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v52 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL TSUFormatGetCustomNumberFormatIsConditional(const TSUFormatStruct)");
    objc_msgSend(v51, "handleFailureInFunction:file:lineNumber:description:", v52, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFormatTypes.h"), 665, CFSTR("Custom format is not correctly populated."));
    v50 = 0;
  }
  return TSUNumberFormatterStringFromDoubleWithFormat(v31, 0, 0, 0, v37, v43, v50, v49);
}

TSUNumberFormat *TSUFormatStructNumberToTSUNumberFormat(int a1, uint64_t a2)
{
  unsigned __int16 v4;
  TSUNumberFormat *v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v9;

  if (*(unsigned __int8 *)(a2 + 8) - 253 >= 2)
    v4 = *(unsigned __int8 *)(a2 + 8);
  else
    v4 = kTSUNumberFormatterDecimalPlacesAsManyAsNecessary;
  v5 = [TSUNumberFormat alloc];
  v6 = TSUFormatTypeToTSUNumberValueType(a1);
  v7 = *(unsigned __int16 *)(a2 + 8);
  HIDWORD(v9) = -3;
  LOBYTE(v9) = (v7 & 0x800) != 0;
  return -[TSUNumberFormat initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:](v5, "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:", v6, 0, v4, *(_QWORD *)a2, (v7 >> 12) & 1, (v7 >> 8) & 7, v9);
}

TSUNumberFormat *TSUFormatStructFractionToTSUNumberFormat(int a1, char *a2)
{
  TSUNumberFormat *v4;
  uint64_t v5;
  uint64_t v7;

  v4 = [TSUNumberFormat alloc];
  v5 = TSUFormatTypeToTSUNumberValueType(a1);
  HIDWORD(v7) = *a2;
  LOBYTE(v7) = 0;
  return -[TSUNumberFormat initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:](v4, "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:", v5, 0, 0, 0, 0, 0, v7);
}

TSUNumberFormat *TSUFormatStructBaseToTSUNumberFormat(int a1, uint64_t a2)
{
  TSUNumberFormat *v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  v4 = [TSUNumberFormat alloc];
  v5 = TSUFormatTypeToTSUNumberValueType(a1);
  BYTE4(v8) = *(_BYTE *)(a2 + 2) & 1;
  WORD1(v8) = HIBYTE(*(_WORD *)a2);
  LOBYTE(v8) = *(_WORD *)a2;
  HIDWORD(v7) = -3;
  LOBYTE(v7) = 0;
  return -[TSUNumberFormat initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:base:basePlaces:baseUseMinusSign:](v4, "initWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:base:basePlaces:baseUseMinusSign:", v5, 0, 0, 0, 0, 0, v7, v8);
}

TSUDateFormat *TSUFormatStructDateToTSUDateFormat(uint64_t a1)
{
  return -[TSUDateFormat initWithFormat:name:]([TSUDateFormat alloc], "initWithFormat:name:", *(_QWORD *)(a1 + 8), &stru_24D61C228);
}

TSUDurationFormat *TSUFormatStructDurationToTSUDurationFormat(uint64_t a1)
{
  return -[TSUDurationFormat initWithFormat:name:]([TSUDurationFormat alloc], "initWithFormat:name:", TSUDurationFormatterFormatFromDurationUnits(*(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12), 1), &stru_24D61C228);
}

void sub_216D7BC0C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_216D7BC80(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_216D7BCE4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_216D7BD40(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void TSUCustomFormat::TSUCustomFormat(TSUCustomFormat *this)
{
  id v1;
  uint64_t v2;

  *(_QWORD *)this = 0;
  *((_QWORD *)this + 10) = 0;
  *((_DWORD *)this + 2) = 1;
  *((_QWORD *)this + 11) = 0;
  *((_QWORD *)this + 12) = 0;
  v1 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
  v2 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "TSUCustomFormat::TSUCustomFormat()");
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUCustomFormat.mm"), 17, CFSTR("Using default constructor for TSUCustomFormat. Use TSUCustomFormat(NSString* name, TSUFormatType formatType, NSString* format)."));
}

void sub_216D7BF98(_Unwind_Exception *a1)
{
  uint64_t v1;
  void **v2;
  void *v4;

  v4 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 88) = v4;
    operator delete(v4);
  }

  _Unwind_Resume(a1);
}

uint64_t TSUCustomFormat::TSUCustomFormat(uint64_t a1, void *a2, int a3, __int128 *a4)
{
  id v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;

  *(_QWORD *)a1 = a2;
  v7 = a2;
  *(_DWORD *)(a1 + 8) = a3;
  v8 = a4[2];
  v9 = a4[3];
  v11 = *a4;
  v10 = a4[1];
  *(_QWORD *)(a1 + 80) = 0;
  *(_OWORD *)(a1 + 48) = v8;
  *(_OWORD *)(a1 + 64) = v9;
  *(_OWORD *)(a1 + 16) = v11;
  *(_OWORD *)(a1 + 32) = v10;
  *(_QWORD *)(a1 + 88) = 0;
  *(_QWORD *)(a1 + 96) = 0;
  if ((a3 - 270) >= 3)
  {
    v12 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "TSUCustomFormat::TSUCustomFormat(NSString *, TSUFormatType, TSUCustomFormatDataStruct)");
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUCustomFormat.mm"), 23, CFSTR("Creating a custom format without a correct custom format type."));
  }
  v14 = (void *)*((_QWORD *)a4 + 1);
  if (!v14)
  {
    v15 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "TSUCustomFormat::TSUCustomFormat(NSString *, TSUFormatType, TSUCustomFormatDataStruct)");
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUCustomFormat.mm"), 25, CFSTR("Creating a custom format with null format."));
    v14 = (void *)*((_QWORD *)a4 + 1);
  }
  v17 = v14;
  v18 = *((id *)a4 + 2);
  v19 = *((id *)a4 + 3);
  v20 = *((id *)a4 + 4);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)a1;
  *(_BYTE *)(a1 + 72) &= ~8u;
  return a1;
}

void sub_216D7C110(_Unwind_Exception *a1)
{
  uint64_t v1;
  void **v2;
  void *v4;

  v4 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 88) = v4;
    operator delete(v4);
  }

  _Unwind_Resume(a1);
}

BOOL TSUCustomFormat::formatTypeIsOK(uint64_t a1, int a2)
{
  return a2 == 272 || (a2 & 0xFFFFFFFE) == 270;
}

void TSUCustomFormat::TSUCustomFormat(TSUCustomFormat *this, const TSUCustomFormat *a2)
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  double v23;
  __int128 v24;
  __int128 v25;
  __int128 v26[4];

  *(_QWORD *)this = 0;
  *((_QWORD *)this + 10) = 0;
  *((_QWORD *)this + 11) = 0;
  *((_QWORD *)this + 12) = 0;
  if ((*((_DWORD *)a2 + 2) - 270) >= 3)
  {
    v4 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "TSUCustomFormat::TSUCustomFormat(const TSUCustomFormat &)");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUCustomFormat.mm"), 36, CFSTR("Creating a custom format without a correct custom format type."));
  }
  if (!*((_QWORD *)a2 + 3))
  {
    v6 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "TSUCustomFormat::TSUCustomFormat(const TSUCustomFormat &)");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUCustomFormat.mm"), 38, CFSTR("Creating a custom format with nullformat."));
  }
  SFUtility::ObjcSharedPtr<NSString>::reset((void **)this, *(void **)a2);
  *((_DWORD *)this + 2) = *((_DWORD *)a2 + 2);
  v8 = *((_OWORD *)a2 + 4);
  v10 = *((_OWORD *)a2 + 1);
  v9 = *((_OWORD *)a2 + 2);
  *((_OWORD *)this + 3) = *((_OWORD *)a2 + 3);
  *((_OWORD *)this + 4) = v8;
  *((_OWORD *)this + 1) = v10;
  *((_OWORD *)this + 2) = v9;
  v11 = *((id *)this + 3);
  v12 = *((id *)this + 4);
  v13 = *((id *)this + 5);
  v14 = *((id *)this + 6);
  *((_QWORD *)this + 2) = *(_QWORD *)this;
  v15 = *((_QWORD *)a2 + 11) - *((_QWORD *)a2 + 10);
  if (v15)
  {
    v16 = 0;
    v17 = 0;
    v18 = v15 / 80;
    if (v18 <= 1)
      v19 = 1;
    else
      v19 = v18;
    do
    {
      v20 = *((_QWORD *)a2 + 10);
      if (0xCCCCCCCCCCCCCCCDLL * ((*((_QWORD *)a2 + 11) - v20) >> 4) <= v17)
        abort();
      v21 = v20 + v16;
      v22 = *(_DWORD *)v21;
      v23 = *(double *)(v21 + 8);
      v24 = *(_OWORD *)(v21 + 32);
      v26[0] = *(_OWORD *)(v21 + 16);
      v26[1] = v24;
      v25 = *(_OWORD *)(v21 + 64);
      v26[2] = *(_OWORD *)(v21 + 48);
      v26[3] = v25;
      TSUCustomFormat::addConditionalFormat((uint64_t)this, v22, v26, v23);
      ++v17;
      v16 += 80;
    }
    while (v19 != v17);
  }
}

void sub_216D7C344(_Unwind_Exception *a1)
{
  uint64_t v1;
  void **v2;
  void *v4;

  v4 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 88) = v4;
    operator delete(v4);
  }

  _Unwind_Resume(a1);
}

uint64_t TSUCustomFormat::addConditionalFormat(uint64_t a1, int a2, __int128 *a3, double a4)
{
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char *v23;
  unint64_t v24;
  char *v25;
  char *v26;
  char *v27;
  char *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  uint64_t v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;

  *(_DWORD *)(a1 + 8) = 270;
  v8 = (void *)*((_QWORD *)a3 + 1);
  if (!v8)
  {
    v9 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSInteger TSUCustomFormat::addConditionalFormat(TSUCustomFormatNumberFormatConditionType, double, TSUCustomFormatDataStruct)");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUCustomFormat.mm"), 156, CFSTR("Tried to set a null format."));
    if (*(_DWORD *)(a1 + 8) != 270)
      return -1;
    v8 = (void *)*((_QWORD *)a3 + 1);
  }
  *(_QWORD *)a3 = *(_QWORD *)a1;
  v11 = v8;
  v12 = *((id *)a3 + 2);
  v13 = *((id *)a3 + 3);
  v14 = *((id *)a3 + 4);
  *((_BYTE *)a3 + 56) |= 8u;
  v35 = *a3;
  v36 = a3[1];
  v37 = a3[2];
  v38 = a3[3];
  v15 = *(_QWORD *)(a1 + 96);
  v16 = *(_QWORD *)(a1 + 88);
  if (v16 >= v15)
  {
    v18 = *(_QWORD *)(a1 + 80);
    v19 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v16 - v18) >> 4);
    v20 = v19 + 1;
    if (v19 + 1 > 0x333333333333333)
      abort();
    v21 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v15 - v18) >> 4);
    if (2 * v21 > v20)
      v20 = 2 * v21;
    if (v21 >= 0x199999999999999)
      v22 = 0x333333333333333;
    else
      v22 = v20;
    if (v22)
      v23 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<TSUCustomFormatCondition>>(a1 + 96, v22);
    else
      v23 = 0;
    v25 = &v23[80 * v19];
    v26 = &v23[80 * v22];
    *(_DWORD *)v25 = a2;
    *((_DWORD *)v25 + 1) = 0;
    *((double *)v25 + 1) = a4;
    *((_OWORD *)v25 + 1) = v35;
    *((_OWORD *)v25 + 2) = v36;
    *((_OWORD *)v25 + 3) = v37;
    *((_OWORD *)v25 + 4) = v38;
    v17 = v25 + 80;
    v28 = *(char **)(a1 + 80);
    v27 = *(char **)(a1 + 88);
    if (v27 != v28)
    {
      do
      {
        *((_OWORD *)v25 - 5) = *((_OWORD *)v27 - 5);
        v29 = *((_OWORD *)v27 - 4);
        v30 = *((_OWORD *)v27 - 3);
        v31 = *((_OWORD *)v27 - 1);
        *((_OWORD *)v25 - 2) = *((_OWORD *)v27 - 2);
        *((_OWORD *)v25 - 1) = v31;
        *((_OWORD *)v25 - 4) = v29;
        *((_OWORD *)v25 - 3) = v30;
        v25 -= 80;
        v27 -= 80;
      }
      while (v27 != v28);
      v27 = *(char **)(a1 + 80);
    }
    *(_QWORD *)(a1 + 80) = v25;
    *(_QWORD *)(a1 + 88) = v17;
    *(_QWORD *)(a1 + 96) = v26;
    if (v27)
      operator delete(v27);
  }
  else
  {
    *(_DWORD *)v16 = a2;
    *(_DWORD *)(v16 + 4) = 0;
    *(double *)(v16 + 8) = a4;
    *(_OWORD *)(v16 + 16) = v35;
    *(_OWORD *)(v16 + 32) = v36;
    v17 = (char *)(v16 + 80);
    *(_OWORD *)(v16 + 48) = v37;
    *(_OWORD *)(v16 + 64) = v38;
  }
  *(_QWORD *)(a1 + 88) = v17;
  v24 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)&v17[-*(_QWORD *)(a1 + 80)] >> 4);
  if (v24 >= 0x7FFFFFFFFFFFFFFFLL)
  {
    v32 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v33 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSInteger TSUCustomFormat::addConditionalFormat(TSUCustomFormatNumberFormatConditionType, double, TSUCustomFormatDataStruct)");
    objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUCustomFormat.mm"), 168, CFSTR("condition list size overflow"));
  }
  return v24;
}

uint64_t TSUCustomFormat::operator=(uint64_t a1, uint64_t a2)
{
  id v4;
  id v5;
  id v6;
  id v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  double v27;
  __int128 v28;
  __int128 v29;
  __int128 v31[4];

  if (a1 != a2)
  {
    SFUtility::ObjcSharedPtr<NSString>::reset((void **)a1, *(void **)a2);
    *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
    v4 = *(id *)(a2 + 24);
    v5 = *(id *)(a2 + 32);
    v6 = *(id *)(a2 + 40);
    v7 = *(id *)(a2 + 48);

    *(_QWORD *)(a1 + 24) = 0;
    *(_QWORD *)(a1 + 32) = 0;

    *(_QWORD *)(a1 + 40) = 0;
    *(_QWORD *)(a1 + 48) = 0;
    v8 = *(_OWORD *)(a2 + 64);
    v10 = *(_OWORD *)(a2 + 16);
    v9 = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 64) = v8;
    *(_OWORD *)(a1 + 16) = v10;
    *(_OWORD *)(a1 + 32) = v9;
    *(_QWORD *)(a1 + 16) = *(_QWORD *)a1;
    v11 = *(_QWORD *)(a1 + 88);
    v12 = v11 - *(_QWORD *)(a1 + 80);
    if (v12)
    {
      v13 = 0;
      v14 = 0;
      if ((unint64_t)(v12 / 80) <= 1)
        v15 = 1;
      else
        v15 = v12 / 80;
      do
      {
        v16 = *(_QWORD *)(a1 + 80);
        if (0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(a1 + 88) - v16) >> 4) <= v14)
          goto LABEL_16;
        v17 = v16 + v13;
        v18 = *(void **)(v17 + 32);

        ++v14;
        v13 += 80;
      }
      while (v15 != v14);
      v11 = *(_QWORD *)(a1 + 80);
    }
    *(_QWORD *)(a1 + 88) = v11;
    v19 = *(_QWORD *)(a2 + 88) - *(_QWORD *)(a2 + 80);
    if (v19)
    {
      v20 = 0;
      v21 = 0;
      v22 = v19 / 80;
      if (v22 <= 1)
        v23 = 1;
      else
        v23 = v22;
      while (1)
      {
        v24 = *(_QWORD *)(a2 + 80);
        if (0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(a2 + 88) - v24) >> 4) <= v21)
          break;
        v25 = v24 + v20;
        v26 = *(_DWORD *)v25;
        v27 = *(double *)(v25 + 8);
        v28 = *(_OWORD *)(v25 + 32);
        v31[0] = *(_OWORD *)(v25 + 16);
        v31[1] = v28;
        v29 = *(_OWORD *)(v25 + 64);
        v31[2] = *(_OWORD *)(v25 + 48);
        v31[3] = v29;
        TSUCustomFormat::addConditionalFormat(a1, v26, v31, v27);
        ++v21;
        v20 += 80;
        if (v23 == v21)
          return a1;
      }
LABEL_16:
      abort();
    }
  }
  return a1;
}

void TSUCustomFormat::~TSUCustomFormat(id *this)
{
  _BYTE *v2;
  _BYTE *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  char *v8;
  _BYTE *v9;
  char *v10;
  _BYTE *v11;
  char *v12;

  this[3] = 0;
  this[4] = 0;

  this[5] = 0;
  this[6] = 0;
  v3 = this[10];
  v2 = this[11];
  if (v2 != v3)
  {
    v4 = 0;
    v5 = 0;
    if ((unint64_t)((v2 - v3) / 80) <= 1)
      v6 = 1;
    else
      v6 = (v2 - v3) / 80;
    do
    {
      if (0xCCCCCCCCCCCCCCCDLL * ((v2 - v3) >> 4) <= v5)
        goto LABEL_15;

      v7 = this[10];
      if (0xCCCCCCCCCCCCCCCDLL * (((_BYTE *)this[11] - v7) >> 4) <= v5)
        goto LABEL_15;
      v8 = &v7[v4];
      *((_QWORD *)v8 + 3) = 0;

      v9 = this[10];
      if (0xCCCCCCCCCCCCCCCDLL * (((_BYTE *)this[11] - v9) >> 4) <= v5)
        goto LABEL_15;
      v10 = &v9[v4];
      *((_QWORD *)v10 + 4) = 0;

      v11 = this[10];
      if (0xCCCCCCCCCCCCCCCDLL * (((_BYTE *)this[11] - v11) >> 4) <= v5
        || (v12 = &v11[v4],
            *((_QWORD *)v12 + 5) = 0,
            *((id *)v12 + 6),
            v3 = this[10],
            v2 = this[11],
            0xCCCCCCCCCCCCCCCDLL * ((v2 - v3) >> 4) <= v5))
      {
LABEL_15:
        abort();
      }
      *(_QWORD *)&v3[v4 + 48] = 0;
      ++v5;
      v4 += 80;
    }
    while (v6 != v5);
    this[11] = v3;
    v2 = v3;
    goto LABEL_13;
  }
  if (v2)
  {
LABEL_13:
    this[11] = v2;
    operator delete(v2);
  }

}

void sub_216D7C95C(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)(v1 + 80);
  if (v3)
  {
    *(_QWORD *)(v1 + 88) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(a1);
}

void TSUCustomFormat::setFormatName(void **this, id a2)
{
  id v3;

  v3 = a2;
  SFUtility::ObjcSharedPtr<NSString>::reset(this, a2);

}

uint64_t TSUCustomFormat::defaultFormatData(TSUCustomFormat *this)
{
  return (uint64_t)this + 16;
}

uint64_t TSUCustomFormat::formatName(TSUCustomFormat *this)
{
  return *(_QWORD *)this;
}

unint64_t TSUCustomFormat::conditionCount(TSUCustomFormat *this)
{
  return 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((_QWORD *)this + 11) - *((_QWORD *)this + 10)) >> 4);
}

uint64_t TSUCustomFormat::type(TSUCustomFormat *this)
{
  return *((unsigned int *)this + 2);
}

BOOL TSUCustomFormat::conditionalFormatAtIndex(uint64_t a1, unint64_t a2, _DWORD *a3, _QWORD *a4, int **a5)
{
  uint64_t v5;
  unint64_t v6;
  int *v7;
  int v8;
  uint64_t v9;
  int *v10;
  _BOOL8 result;

  v5 = *(_QWORD *)(a1 + 80);
  v6 = 0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(a1 + 88) - v5) >> 4);
  if (v6 <= a2)
  {
    v8 = 0;
    v10 = 0;
    v9 = 0;
  }
  else
  {
    v7 = (int *)(v5 + 80 * a2);
    v8 = *v7;
    v9 = *((_QWORD *)v7 + 1);
    v10 = v7 + 4;
  }
  *a3 = v8;
  result = v6 > a2;
  *a4 = v9;
  *a5 = v10;
  return result;
}

uint64_t TSUCustomFormat::formatByEvaluatingConditionsWithDouble(TSUCustomFormat *this, double a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  double v9;
  id v10;
  uint64_t v11;

  if (*((_DWORD *)this + 2) != 270)
    return 0;
  v3 = *((_QWORD *)this + 10);
  v4 = *((_QWORD *)this + 11);
  if (v4 != v3)
  {
    v6 = 0;
    v7 = 1;
    while (2)
    {
      v8 = v3 + 80 * v6;
      v9 = *(double *)(v8 + 8);
      switch(*(_DWORD *)v8)
      {
        case 0:
          if (vabdd_f64(a2, v9) >= 1.0e-14)
            goto LABEL_15;
          return v3 + 80 * v6 + 16;
        case 1:
          if (v9 > a2)
            return v3 + 80 * v6 + 16;
          goto LABEL_15;
        case 2:
          if (v9 >= a2)
            return v3 + 80 * v6 + 16;
          goto LABEL_15;
        case 3:
          if (v9 < a2)
            return v3 + 80 * v6 + 16;
          goto LABEL_15;
        case 4:
          if (v9 > a2)
            goto LABEL_15;
          return v3 + 80 * v6 + 16;
        default:
          v10 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", v9);
          v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "const TSUCustomFormatDataStruct *TSUCustomFormat::formatByEvaluatingConditionsWithDouble(double) const");
          objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUCustomFormat.mm"), 243, CFSTR("Unexpected condition type in conditional number format!"));
          v3 = *((_QWORD *)this + 10);
          v4 = *((_QWORD *)this + 11);
LABEL_15:
          v6 = v7;
          if (0xCCCCCCCCCCCCCCCDLL * ((v4 - v3) >> 4) <= v7++)
            return (uint64_t)this + 16;
          continue;
      }
    }
  }
  return (uint64_t)this + 16;
}

BOOL TSUCustomFormat::customFormatIsEqual(TSUCustomFormat *this, TSUCustomFormat *a2)
{
  void *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _BOOL8 result;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  BOOL v23;

  if (*((_DWORD *)this + 2) != *((_DWORD *)a2 + 2)
    || *((_QWORD *)this + 11) - *((_QWORD *)this + 10) != *((_QWORD *)a2 + 11) - *((_QWORD *)a2 + 10))
  {
    return 0;
  }
  v4 = *(void **)this;
  if (*(_QWORD *)this && *(_QWORD *)a2)
  {
    v5 = objc_msgSend(v4, "length");
    v6 = objc_msgSend(*(id *)a2, "length");
    v7 = v5 >= v6 ? v6 : v5;
    v4 = (void *)objc_msgSend(*(id *)this, "compare:options:range:", *(_QWORD *)a2, 0, 0, v7);
    if (v4)
      return 0;
  }
  result = TSUCustomFormat::customFormatDataIsEqual((uint64_t)v4, (uint64_t)this + 16, (uint64_t)a2 + 16);
  if (result)
  {
    v9 = *((_QWORD *)this + 11) - *((_QWORD *)this + 10);
    if (!v9)
      return 1;
    v10 = 0;
    v11 = 0;
    v12 = v9 / 80;
    if (v12 <= 1)
      v13 = 1;
    else
      v13 = v12;
    while (1)
    {
      v14 = *((_QWORD *)a2 + 10);
      v15 = 0xCCCCCCCCCCCCCCCDLL * ((*((_QWORD *)a2 + 11) - v14) >> 4);
      if (v15 > v11)
      {
        v19 = v14 + v10;
        v16 = *(_DWORD *)(v14 + v10);
        v18 = *(double *)(v19 + 8);
        v17 = v19 + 16;
      }
      else
      {
        v16 = 0;
        v17 = 0;
        v18 = 0.0;
      }
      v20 = *((_QWORD *)this + 10);
      if (0xCCCCCCCCCCCCCCCDLL * ((*((_QWORD *)this + 11) - v20) >> 4) <= v11)
        break;
      v21 = v20 + v10;
      v22 = v15 > v11 && *(_DWORD *)v21 == v16;
      v23 = v22 && *(double *)(v21 + 8) == v18;
      if (!v23 || !TSUCustomFormat::customFormatDataIsEqual(result, v21 + 16, v17))
        break;
      ++v11;
      v10 += 80;
      result = 1;
      if (v13 == v11)
        return result;
    }
    return 0;
  }
  return result;
}

BOOL TSUCustomFormat::customFormatDataIsEqual(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  if (((*(_BYTE *)(a3 + 56) ^ *(_BYTE *)(a2 + 56)) & 0x3F) != 0
    || *(unsigned __int8 *)(a2 + 48) != *(unsigned __int8 *)(a3 + 48)
    || *(unsigned __int8 *)(a2 + 49) != *(unsigned __int8 *)(a3 + 49)
    || *(unsigned __int8 *)(a2 + 50) != *(unsigned __int8 *)(a3 + 50)
    || *(unsigned __int8 *)(a2 + 51) != *(unsigned __int8 *)(a3 + 51)
    || *(unsigned __int8 *)(a2 + 52) != *(unsigned __int8 *)(a3 + 52)
    || *(unsigned __int8 *)(a2 + 53) != *(unsigned __int8 *)(a3 + 53)
    || *(unsigned __int8 *)(a2 + 54) != *(unsigned __int8 *)(a3 + 54)
    || *(unsigned __int8 *)(a2 + 55) != *(unsigned __int8 *)(a3 + 55)
    || *(double *)(a2 + 40) != *(double *)(a3 + 40))
  {
    return 0;
  }
  v6 = *(void **)(a2 + 8);
  v7 = *(_QWORD *)(a3 + 8);
  if (v6)
  {
    if ((objc_msgSend(v6, "isEqualToString:", v7) & 1) == 0)
      return 0;
  }
  else if (v7)
  {
    return 0;
  }
  v8 = *(void **)(a2 + 16);
  v9 = *(_QWORD *)(a3 + 16);
  if (v8)
  {
    if ((objc_msgSend(v8, "isEqualToString:", v9) & 1) == 0)
      return 0;
  }
  else if (v9)
  {
    return 0;
  }
  v10 = *(void **)(a2 + 24);
  v11 = *(_QWORD *)(a3 + 24);
  if (v10)
  {
    if ((objc_msgSend(v10, "isEqualToArray:", v11) & 1) == 0)
      return 0;
  }
  else if (v11)
  {
    return 0;
  }
  v12 = *(void **)(a2 + 32);
  v13 = *(_QWORD *)(a3 + 32);
  if (v12)
    return (objc_msgSend(v12, "isEqualToIndexSet:", v13) & 1) != 0;
  return !v13;
}

uint64_t TSUCustomFormat::customFormatNameIsEqual(void **this, TSUCustomFormat *a2)
{
  void *v2;

  if (a2 && (v2 = *this) != 0)
    return objc_msgSend(v2, "isEqualToString:", *(_QWORD *)a2);
  else
    return 0;
}

uint64_t TSUCustomFormat::hash(id *this)
{
  return objc_msgSend(this[3], "hash") ^ *((int *)this + 2);
}

uint64_t TSUCustomFormat_TestCode(void)
{
  TSUCustomFormat *v0;
  id *v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  unint64_t v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id *v22;
  id *v23;
  __int128 v25[2];
  uint64_t v26;
  uint64_t v27;
  char v28;
  _BYTE v29[7];
  char v30;
  _BYTE v31[7];
  __int128 v32[2];
  uint64_t v33;
  uint64_t v34;
  char v35;
  _BYTE v36[7];
  char v37;
  _BYTE v38[7];
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  _BYTE v45[15];
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  _BYTE v52[15];
  __int128 v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  _BYTE v59[15];
  __int128 v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  _BYTE v66[15];
  _DWORD v67[2];
  _DWORD v68[2];
  __int128 v69;
  uint64_t v70;

  v70 = 0;
  v69 = 0uLL;
  v67[0] = 0;
  *(_DWORD *)((char *)v67 + 3) = 0;
  v68[0] = 0;
  *(_DWORD *)((char *)v68 + 3) = 0;
  v0 = (TSUCustomFormat *)operator new();
  TSUCustomFormat::TSUCustomFormat(v0);
  TSUCustomFormat::~TSUCustomFormat((id *)v0);
  MEMORY[0x219A01ED0]();
  v1 = (id *)operator new();
  *(_QWORD *)&v60 = 0;
  *((_QWORD *)&v60 + 1) = CFSTR("'test '#,###.##");
  v61 = 0;
  v62 = 0;
  v63 = 0;
  v64 = 0x3FF0000000000000;
  v65 = -3;
  memset(v66, 0, 7);
  v66[7] = 16;
  memset(&v66[8], 0, 7);
  TSUCustomFormat::TSUCustomFormat((uint64_t)v1, CFSTR("Bad Custom Format"), 257, &v60);
  TSUCustomFormat::~TSUCustomFormat(v1);
  MEMORY[0x219A01ED0]();
  v2 = operator new();
  *(_QWORD *)&v53 = 0;
  *((_QWORD *)&v53 + 1) = CFSTR("'test '#,###.##");
  v54 = 0;
  v55 = 0;
  v56 = 0;
  v57 = 0x3FF0000000000000;
  v58 = -3;
  memset(v59, 0, 7);
  v59[7] = 16;
  memset(&v59[8], 0, 7);
  TSUCustomFormat::TSUCustomFormat(v2, CFSTR("Good Custom Number Format"), 270, &v53);
  v3 = *(id *)v2;
  *(_QWORD *)&v46 = 0;
  *((_QWORD *)&v46 + 1) = CFSTR("'test2 '####");
  v47 = 0;
  v48 = 0;
  v49 = 0;
  v50 = 0x3FF0000000000000;
  v51 = -3;
  memset(v52, 0, 7);
  v52[7] = 16;
  memset(&v52[8], 0, 7);
  TSUCustomFormat::addConditionalFormat(v2, 0, &v46, 3.0);
  *(_QWORD *)&v39 = 0;
  *((_QWORD *)&v39 + 1) = CFSTR("'test3 '00.000");
  v40 = 0;
  v41 = 0;
  v42 = 0;
  v43 = 0x3FF0000000000000;
  v44 = -3;
  memset(v45, 0, 7);
  v45[7] = 16;
  memset(&v45[8], 0, 7);
  TSUCustomFormat::addConditionalFormat(v2, 3, &v39, 3.0);
  v4 = *(_QWORD *)(v2 + 88) - *(_QWORD *)(v2 + 80);
  v5 = 0xCCCCCCCCCCCCCCCDLL * (v4 >> 4);
  if (v4 == 160
    || (v6 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"),
        v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL TSUCustomFormat_TestCode()"),
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUCustomFormat.mm"), 418, CFSTR("two conditions expected")), v8 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(_QWORD *)(v2 + 88) - *(_QWORD *)(v2 + 80)) >> 4), v8 <= v5))
  {
    v9 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL TSUCustomFormat_TestCode()");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUCustomFormat.mm"), 426, CFSTR("Tested a non-existent condition."));
    v8 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(_QWORD *)(v2 + 88) - *(_QWORD *)(v2 + 80)) >> 4);
  }
  if (v8 > v5 - 1)
  {
    v11 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL TSUCustomFormat_TestCode()");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUCustomFormat.mm"), 429, CFSTR("Tested a non-existent condition."));
  }
  v13 = TSUCustomFormat::formatByEvaluatingConditionsWithDouble((TSUCustomFormat *)v2, 3.0);
  if (!v13 || (objc_msgSend(*(id *)(v13 + 8), "isEqualToString:", CFSTR("'test2 '####")) & 1) == 0)
  {
    v14 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL TSUCustomFormat_TestCode()");
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUCustomFormat.mm"), 432, CFSTR("Failed equals 3 test"));
  }
  v16 = TSUCustomFormat::formatByEvaluatingConditionsWithDouble((TSUCustomFormat *)v2, 5.0);
  if (!v16 || (objc_msgSend(*(id *)(v16 + 8), "isEqualToString:", CFSTR("'test3 '00.000")) & 1) == 0)
  {
    v17 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v18 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL TSUCustomFormat_TestCode()");
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUCustomFormat.mm"), 434, CFSTR("Failed greater than 3 test"));
  }
  v19 = TSUCustomFormat::formatByEvaluatingConditionsWithDouble((TSUCustomFormat *)v2, 0.0);
  if (!v19 || (objc_msgSend(*(id *)(v19 + 8), "isEqualToString:", CFSTR("'test '#,###.##")) & 1) == 0)
  {
    v20 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v21 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL TSUCustomFormat_TestCode()");
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUCustomFormat.mm"), 436, CFSTR("Failed default test"));
  }
  TSUCustomFormat::~TSUCustomFormat((id *)v2);
  MEMORY[0x219A01ED0]();

  v22 = (id *)operator new();
  *(_QWORD *)&v32[0] = 0;
  *((_QWORD *)&v32[0] + 1) = CFSTR("'test3 '00.000");
  v32[1] = v69;
  v33 = v70;
  v34 = 0x3FF0000000000000;
  v35 = -3;
  *(_DWORD *)v36 = v68[0];
  *(_DWORD *)&v36[3] = *(_DWORD *)((char *)v68 + 3);
  v37 = 16;
  *(_DWORD *)v38 = v67[0];
  *(_DWORD *)&v38[3] = *(_DWORD *)((char *)v67 + 3);
  TSUCustomFormat::TSUCustomFormat((uint64_t)v22, CFSTR("Good Custom Date Format"), 272, v32);
  TSUCustomFormat::~TSUCustomFormat(v22);
  MEMORY[0x219A01ED0]();
  v23 = (id *)operator new();
  *(_QWORD *)&v25[0] = 0;
  *((_QWORD *)&v25[0] + 1) = CFSTR("'test3 '00.000");
  v25[1] = v69;
  v26 = v70;
  v27 = 0x3FF0000000000000;
  v28 = -3;
  *(_DWORD *)v29 = v68[0];
  *(_DWORD *)&v29[3] = *(_DWORD *)((char *)v68 + 3);
  v30 = 16;
  *(_DWORD *)v31 = v67[0];
  *(_DWORD *)&v31[3] = *(_DWORD *)((char *)v67 + 3);
  TSUCustomFormat::TSUCustomFormat((uint64_t)v23, CFSTR("Good Custom Text Format"), 271, v25);
  TSUCustomFormat::~TSUCustomFormat(v23);
  MEMORY[0x219A01ED0]();
  return 1;
}

void sub_216D7D4C0(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x219A01ED0](v1, 0x10A0C40ADE6F494);
  _Unwind_Resume(a1);
}

void SFUtility::ObjcSharedPtr<NSString>::reset(void **a1, void *a2)
{
  id v4;
  void *v5;

  if (*a1 != a2)
  {
    v4 = a2;
    v5 = *a1;
    *a1 = a2;

  }
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<TSUCustomFormatCondition>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x333333333333334)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(80 * a2);
}

void std::__throw_bad_array_new_length[abi:nn180100]()
{
  abort();
}

void sub_216D7DA04(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_216D7E030(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_216D7E2A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_216D7E4C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t TSUCustomNumberFormatTokenIdentifierCharacterForTokenType(unsigned int a1)
{
  __int16 *v1;
  id v2;
  uint64_t v3;

  if (a1 >= 7)
  {
    v2 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "unichar TSUCustomNumberFormatTokenIdentifierCharacterForTokenType(TSUCustomNumberFormatTokenType)");
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUCustomFormatNumberTokenDelegate.m"), 59, CFSTR("Invalid custom number format token type!"));
    v1 = &TSUCustomNumberFormatTokenScaleIdentifierCharacter;
  }
  else
  {
    v1 = (&off_24D61B2E8)[a1];
  }
  return (unsigned __int16)*v1;
}

uint64_t TSUPerformBlockOnNextRunloop(void *a1)
{
  return objc_msgSend((id)objc_msgSend(a1, "copy"), "performSelector:withObject:afterDelay:", sel_tsu_runBlock, 0, 0.0);
}

void sub_216D7FB2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

uint64_t AMOFullMethodName(uint64_t a1, const char *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v4 = objc_opt_class();
  v5 = (void *)MEMORY[0x24BDD17C8];
  if (v4 == a1)
    return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("+[%@ %@]"), a1, NSStringFromSelector(a2));
  v6 = objc_opt_class();
  return objc_msgSend(v5, "stringWithFormat:", CFSTR("-[%@ %@]"), v6, NSStringFromSelector(a2));
}

BOOL SFUEqualCryptoKeys(unint64_t a1, unint64_t a2)
{
  _BOOL8 result;
  BOOL v5;
  _BOOL4 v6;
  size_t v7;

  if (!(a1 | a2))
    return 1;
  result = 0;
  v5 = a1 != 0;
  if (a2)
    v6 = a1 != 0;
  else
    v6 = 1;
  if (a2)
    v5 = 0;
  if (!v5 && v6)
  {
    v7 = objc_msgSend((id)a1, "keyLength");
    return v7 == objc_msgSend((id)a2, "keyLength")
        && memcmp((const void *)objc_msgSend((id)a1, "keyData"), (const void *)objc_msgSend((id)a2, "keyData"), v7) == 0;
  }
  return result;
}

void sub_216D821AC(_Unwind_Exception *exception_object, int a2)
{
  void *v2;

  if (a2 == 1)
  {
    objc_begin_catch(exception_object);

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

uint64_t SFUDeriveAes128Key(uint64_t a1, unint64_t a2, unsigned int a3, char *a4, uint64_t a5, void *a6, size_t a7)
{
  BOOL v7;
  BOOL v10;
  int v11;
  unsigned int v14;
  uint64_t v19;
  char *v20;

  if (a4)
    v7 = a5 == 16;
  else
    v7 = 0;
  v10 = v7 && a1 != 0 && a3 >= 0x3E8 && HIDWORD(a2) == 0;
  v11 = !v10;
  if (v10)
  {
    v14 = a5;
    v19 = a7 + 4;
    if (a7 + 4 <= 0x14)
      v19 = 20;
    v20 = (char *)malloc_type_calloc(1uLL, v19 + 40, 0x236D5F05uLL);
    pbkdf2((uint64_t (*)(uint64_t, uint64_t, char *, uint64_t, char *))hmacsha1, 20, a1, a2, a6, a7, a3, a4, v14, v20);
    free(v20);
  }
  return v11 ^ 1u;
}

void hmacsha1(const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
  CCHmac(0, key, keyLength, data, dataLength, macOut);
}

void sub_216D849E8()
{
  __break(1u);
}

void sub_216D84A70()
{
  objc_end_catch();
  JUMPOUT(0x216D84A48);
}

uint64_t SFUXmlReaderIORead(void *a1, uint64_t a2, int a3)
{
  uint64_t v3;
  id v4;
  uint64_t v5;

  v3 = objc_msgSend(a1, "readToBuffer:size:", a2, a3);
  if (v3 >= 0x80000000)
  {
    v4 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "int SFUXmlReaderIORead(void *, char *, int)");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUDataRepresentation.m"), 557, CFSTR("Overflow in SFUXmlReaderIORead"));
  }
  return v3;
}

uint64_t SFUXmlReaderIOClose(void *a1)
{
  objc_msgSend(a1, "close");

  return 0;
}

void sub_216D84E74(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;

  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    v11 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SFUDataRepresentation readIntoData:]");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUDataRepresentation.m"), 283, CFSTR("Caught exception trying to read storage into NSMutableData: %@"));
    objc_msgSend(v9, "setLength:", v10);
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_216D8502C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_216D850E8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t SFUCGDataProviderGetBytes(void *a1, const char *a2, uint64_t a3)
{
  return objc_msgSend(a1, "readToBuffer:size:", a2, a3);
}

uint64_t SFUCGDataProviderSkipForward(void *a1, uint64_t a2)
{
  uint64_t v4;

  v4 = objc_msgSend(a1, "offset");
  objc_msgSend(a1, "seekToOffset:", v4 + a2);
  return objc_msgSend(a1, "offset") - v4;
}

uint64_t SFUCGDataProviderRewind(void *a1, const char *a2)
{
  return objc_msgSend(a1, "seekToOffset:", 0);
}

void SFUCGDataProviderReleaseInfo(void *a1)
{
  objc_msgSend(a1, "closeLocalStream");

}

void sub_216D8575C(_Unwind_Exception *exception_object, int a2)
{
  void *v2;

  if (a2 == 1)
  {
    objc_begin_catch(exception_object);

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_216D859FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_216D85DA0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

FILE *SFUFileOpen(void *a1, const char *a2)
{
  FILE *v3;

  v3 = fopen((const char *)objc_msgSend(a1, "fileSystemRepresentation"), a2);
  if (!v3)
    objc_msgSend(MEMORY[0x24BDBCE88], "errnoRaise:format:", CFSTR("SFUFileOpenError"), CFSTR("Could not open %@"), a1);
  return v3;
}

FILE *SFUFdOpen(uint64_t a1, const char *a2)
{
  FILE *v3;

  v3 = fdopen(a1, a2);
  if (!v3)
    objc_msgSend(MEMORY[0x24BDBCE88], "errnoRaise:format:", CFSTR("SFUFdOpenError"), CFSTR("Could not fdopen %d"), a1);
  return v3;
}

uint64_t SFUOpen(void *a1, int a2, unsigned int a3)
{
  uint64_t v4;

  v4 = open((const char *)objc_msgSend(a1, "fileSystemRepresentation"), a2, a3);
  if ((_DWORD)v4 == -1)
    objc_msgSend(MEMORY[0x24BDBCE88], "errnoRaise:format:", CFSTR("SFUOpenError"), CFSTR("Could not open %@"), a1);
  return v4;
}

uint64_t SFUDup(uint64_t a1)
{
  uint64_t v2;

  v2 = dup(a1);
  if ((_DWORD)v2 == -1)
    objc_msgSend(MEMORY[0x24BDBCE88], "errnoRaise:format:", CFSTR("SFUDupError"), CFSTR("Could not dup %d"), a1);
  return v2;
}

void sub_216D86D4C(_Unwind_Exception *exception_object, int a2)
{
  void *v2;

  if (a2 == 1)
  {
    objc_begin_catch(exception_object);

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_216D8720C(_Unwind_Exception *exception_object, int a2)
{
  void *v2;
  void *v3;

  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    free(v3);

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

uint64_t TSUStandardizedAPFSPath(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v1 = (void *)objc_msgSend((id)objc_msgSend(a1, "stringByStandardizingPath"), "pathComponents");
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v1, "count"));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v1);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (!objc_msgSend(v7, "isEqualToString:", CFSTR("/")))
        {
          if (!objc_msgSend(v7, "fileSystemRepresentation"))
            continue;
          if (APFSMakeCompatibleName())
            continue;
          v7 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", 0);
          if (!objc_msgSend(v7, "length"))
            continue;
        }
        objc_msgSend(v2, "addObject:", v7);
      }
      v4 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  v8 = objc_msgSend(v2, "count");
  if (v8 == objc_msgSend(v1, "count"))
    return objc_msgSend(MEMORY[0x24BDD17C8], "pathWithComponents:", v2);
  else
    return 0;
}

uint64_t TSUOpen(void *a1, int a2, unsigned int a3)
{
  const char *v6;
  uint64_t result;
  const char *v8;

  v6 = (const char *)objc_msgSend((id)objc_msgSend(a1, "stringByStandardizingPath"), "fileSystemRepresentation");
  if (!v6 || (result = open(v6, a2, a3), (_DWORD)result == -1))
  {
    if (*__error() == 92
      && (v8 = (const char *)objc_msgSend((id)TSUStandardizedAPFSPath(a1), "fileSystemRepresentation")) != 0)
    {
      return open(v8, a2, a3);
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t TSULink(void *a1, void *a2)
{
  const char *v4;
  const char *v5;
  uint64_t result;
  const char *v7;
  const char *v8;

  v4 = (const char *)objc_msgSend((id)objc_msgSend(a1, "stringByStandardizingPath"), "fileSystemRepresentation");
  v5 = (const char *)objc_msgSend((id)objc_msgSend(a2, "stringByStandardizingPath"), "fileSystemRepresentation");
  if (!v4 || !v5 || (result = link(v4, v5), (_DWORD)result == -1))
  {
    if (*__error() == 92)
    {
      v7 = (const char *)objc_msgSend((id)TSUStandardizedAPFSPath(a1), "fileSystemRepresentation");
      v8 = (const char *)objc_msgSend((id)TSUStandardizedAPFSPath(a2), "fileSystemRepresentation");
      result = 0xFFFFFFFFLL;
      if (v7)
      {
        if (v8)
          return link(v7, v8);
      }
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t TSUMkdir(void *a1, mode_t a2)
{
  const char *v4;
  uint64_t result;
  const char *v6;

  v4 = (const char *)objc_msgSend((id)objc_msgSend(a1, "stringByStandardizingPath"), "fileSystemRepresentation");
  if (!v4 || (result = mkdir(v4, a2), (_DWORD)result == -1))
  {
    if (*__error() == 92
      && (v6 = (const char *)objc_msgSend((id)TSUStandardizedAPFSPath(a1), "fileSystemRepresentation")) != 0)
    {
      return mkdir(v6, a2);
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

void sub_216D87B6C(void *a1)
{
  void *v1;

  objc_begin_catch(a1);
  free(v1);
  objc_exception_rethrow();
}

void sub_216D87B80(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_216D88880(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_216D888A0(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x216D88824);
}

void sub_216D8893C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_216D8895C(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x216D88910);
}

void sub_216D88AB0(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_216D89078(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x216D8902CLL);
  }
  _Unwind_Resume(a1);
}

void sub_216D8929C(_Unwind_Exception *exception_object)
{
  int v1;

  if (v1)
    objc_end_catch();
  _Unwind_Resume(exception_object);
}

void sub_216D89EE0(void *a1)
{
  objc_begin_catch(a1);
  objc_end_catch();
  JUMPOUT(0x216D89E6CLL);
}

uint64_t SFUZipCurrentDosTime()
{
  tm *v0;
  int tm_year;
  int v2;
  time_t v4;

  v4 = time(0);
  v0 = localtime(&v4);
  tm_year = v0->tm_year;
  v2 = (tm_year << 25) + 1610612736;
  if (tm_year <= 81)
    v2 = 0x2000000;
  return v2 | ((v0->tm_mon << 21) + 0x200000) | (v0->tm_mday << 16) | (v0->tm_hour << 11) | (32 * v0->tm_min) | (v0->tm_sec >> 1);
}

void sub_216D8B388(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_216D8B3A8(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x216D8B360);
}

uint64_t SFUSimpleXmlOutputWriteCallback(void *a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(a1, "writeBuffer:size:", a2, (int)a3);
  return a3;
}

uint64_t SFUSimpleXmlOutputCloseCallback()
{
  return 0;
}

void sub_216D8C770(_Unwind_Exception *exception_object, int a2)
{
  void *v2;

  if (a2 == 1)
  {
    objc_begin_catch(exception_object);

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_216D8CBA8(_Unwind_Exception *exception_object, int a2)
{
  void *v2;

  if (a2 == 1)
  {
    objc_begin_catch(exception_object);

    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_216D8D138(void *a1)
{
  FILE *v1;

  objc_begin_catch(a1);
  fclose(v1);
  objc_exception_rethrow();
}

void sub_216D8D150(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_216D8D78C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_216D8D84C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_216D8F478(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t SFUHash(char *a1, uint64_t a2)
{
  return SFUHashWithSeed(a1, a2, 2166136261);
}

uint64_t SFUHashWithSeed(char *a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4;
  id v5;
  uint64_t v6;

  if (a2)
  {
    do
    {
      v4 = *a1++;
      a3 = (16777619 * (_DWORD)a3) ^ v4;
      --a2;
    }
    while (a2);
  }
  else
  {
    v5 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "unsigned int SFUHashWithSeed(const char *, size_t, unsigned int)");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUHash.m"), 24, CFSTR("SFUHash must have at least one byte of input."));
  }
  return a3;
}

void SFUStopwatch::SFUStopwatch(SFUStopwatch *this, const char *a2, int a3)
{
  *((_QWORD *)this + 1) = 0;
  *((_DWORD *)this + 8) = 0;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  *((_QWORD *)this + 5) = 0;
  *((_QWORD *)this + 6) = 0;
  *(_QWORD *)this = a2;
  if (!SFUStopwatch::smInitialized)
    SFUStopwatch::Initialize(this);
  if (a3)
  {
    if (!*((_DWORD *)this + 8))
    {
      *((double *)this + 5) = SFUStopwatch::GetMicroseconds(this);
      *((_DWORD *)this + 8) = 1;
    }
  }
}

void sub_216D9088C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  void *v4;

  v4 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 16) = v4;
    operator delete(v4);
  }
  _Unwind_Resume(exception_object);
}

double SFUStopwatch::Initialize(SFUStopwatch *this)
{
  SFUStopwatch *v1;
  unint64_t v2;
  unint64_t v3;
  double Microseconds;
  SFUStopwatch *v5;
  double result;
  mach_timebase_info info;

  v1 = (SFUStopwatch *)mach_timebase_info(&info);
  LODWORD(v3) = info.numer;
  LODWORD(v2) = info.denom;
  *(double *)&SFUStopwatch::smDivisor = (double)v2 / (double)v3 * 1000.0;
  SFUStopwatch::smInitialized = 1;
  Microseconds = SFUStopwatch::GetMicroseconds(v1);
  result = (SFUStopwatch::GetMicroseconds(v5) - Microseconds) / 10.0;
  SFUStopwatch::smMethodCallOverhead = *(_QWORD *)&result;
  return result;
}

void SFUStopwatch::Start(SFUStopwatch *this)
{
  if (!*((_DWORD *)this + 8))
  {
    *((double *)this + 5) = SFUStopwatch::GetMicroseconds(this);
    *((_DWORD *)this + 8) = 1;
  }
}

void SFUStopwatch::~SFUStopwatch(SFUStopwatch *this)
{
  void *v2;

  if (*((_DWORD *)this + 8) == 1)
  {
    *((double *)this + 6) = SFUStopwatch::GetMicroseconds(this);
    *((_DWORD *)this + 8) = 2;
  }
  v2 = (void *)*((_QWORD *)this + 1);
  if (v2)
  {
    *((_QWORD *)this + 2) = v2;
    operator delete(v2);
  }
}

void sub_216D909A4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)(v1 + 8);
  if (v3)
  {
    *(_QWORD *)(v1 + 16) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void SFUStopwatch::Stop(SFUStopwatch *this)
{
  if (*((_DWORD *)this + 8) == 1)
  {
    *((double *)this + 6) = SFUStopwatch::GetMicroseconds(this);
    *((_DWORD *)this + 8) = 2;
  }
}

double SFUStopwatch::GetMicroseconds(SFUStopwatch *this)
{
  SFUStopwatch *v1;
  unint64_t v2;

  v1 = (SFUStopwatch *)mach_absolute_time();
  v2 = (unint64_t)v1;
  if (!SFUStopwatch::smInitialized)
    SFUStopwatch::Initialize(v1);
  return (double)v2 / *(double *)&SFUStopwatch::smDivisor;
}

uint64_t SFUStopwatch::Reset(uint64_t this)
{
  *(_DWORD *)(this + 32) = 0;
  *(_QWORD *)(this + 40) = 0;
  *(_QWORD *)(this + 48) = 0;
  return this;
}

void SFUStopwatch::Lap(double **this)
{
  double Microseconds;
  double v3;
  unint64_t v4;
  double *v5;
  double *v6;
  double *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  double *v13;
  double *v14;
  uint64_t v15;

  Microseconds = SFUStopwatch::GetMicroseconds((SFUStopwatch *)this);
  if (*((_DWORD *)this + 8) == 1)
  {
    v3 = Microseconds;
    v4 = (unint64_t)this[3];
    v5 = this[2];
    if ((unint64_t)v5 >= v4)
    {
      v7 = this[1];
      v8 = v5 - v7;
      v9 = v8 + 1;
      if ((unint64_t)(v8 + 1) >> 61)
        abort();
      v10 = v4 - (_QWORD)v7;
      if (v10 >> 2 > v9)
        v9 = v10 >> 2;
      if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8)
        v11 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v11 = v9;
      if (v11)
      {
        v12 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<double>>((uint64_t)(this + 3), v11);
        v7 = this[1];
        v5 = this[2];
      }
      else
      {
        v12 = 0;
      }
      v13 = (double *)&v12[8 * v8];
      v14 = (double *)&v12[8 * v11];
      *v13 = v3;
      v6 = v13 + 1;
      while (v5 != v7)
      {
        v15 = *((_QWORD *)v5-- - 1);
        *((_QWORD *)v13-- - 1) = v15;
      }
      this[1] = v13;
      this[2] = v6;
      this[3] = v14;
      if (v7)
        operator delete(v7);
    }
    else
    {
      *v5 = Microseconds;
      v6 = v5 + 1;
    }
    this[2] = v6;
  }
}

double SFUStopwatch::StartTime(SFUStopwatch *this)
{
  if (*((int *)this + 8) < 1)
    return -1.0;
  else
    return *((double *)this + 5);
}

double SFUStopwatch::StopTime(SFUStopwatch *this)
{
  if (*((int *)this + 8) < 1)
    return -1.0;
  else
    return *((double *)this + 6);
}

double SFUStopwatch::ElapsedTime(SFUStopwatch *this)
{
  double v1;
  double result;

  v1 = -1.0;
  if (*((_DWORD *)this + 8) == 2)
    v1 = *((double *)this + 6) - *((double *)this + 5);
  result = v1 - *(double *)&SFUStopwatch::smMethodCallOverhead;
  if (result < 0.0)
    return 0.0;
  return result;
}

uint64_t SFUStopwatch::Laps(SFUStopwatch *this)
{
  return (uint64_t)(*((_QWORD *)this + 2) - *((_QWORD *)this + 1)) >> 3;
}

double SFUStopwatch::LapTime(SFUStopwatch *this, unint64_t a2)
{
  uint64_t v2;
  double result;

  v2 = *((_QWORD *)this + 1);
  result = -1.0;
  if (a2 <= (*((_QWORD *)this + 2) - v2) >> 3)
    return *(double *)(v2 + 8 * a2 - 8);
  return result;
}

void SFUStopwatch::LogElapsedTime(SFUStopwatch *this)
{
  double v1;
  double v2;
  double v3;
  uint64_t v4;
  double v5;

  v1 = -1.0;
  if (*((_DWORD *)this + 8) == 2)
    v1 = *((double *)this + 6) - *((double *)this + 5);
  v2 = v1 - *(double *)&SFUStopwatch::smMethodCallOverhead;
  if (v2 < 0.0)
    v3 = 0.0;
  else
    v3 = v2;
  v4 = v3 > 1000.0;
  v5 = v3 / 1000.0;
  if (v3 <= 1000.0)
    v5 = v3;
  if (v5 > 1000.0)
  {
    v4 = 2;
    if (v3 <= 1000.0)
      v4 = 1;
    v5 = v5 / 1000.0;
  }
  NSLog((NSString *)CFSTR("%s: %p [ %f %s ]"), *(_QWORD *)this, this, *(_QWORD *)&v5, off_24D61B420[v4]);
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<double>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(8 * a2);
}

uint64_t (*pbkdf2(uint64_t (*result)(uint64_t, uint64_t, char *, uint64_t, char *), uint64_t a2, uint64_t a3, uint64_t a4, void *__src, size_t __n, unsigned int a7, char *a8, unsigned int a9, char *a10))(uint64_t, uint64_t, char *, uint64_t, char *)
{
  uint64_t (*v16)(uint64_t, uint64_t, char *, uint64_t, char *);
  uint64_t v17;
  char *v18;
  unsigned int v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  size_t v24;
  uint64_t v25;
  char *v26;

  v16 = result;
  v17 = a9 / a2;
  v18 = &a10[a2];
  v24 = a9 % a2;
  if (a2 <= a9)
  {
    v25 = a2;
    v19 = 1;
    do
    {
      v26 = a8;
      v23 = a8;
      v20 = a2;
      v21 = v18;
      v22 = v17;
      result = (uint64_t (*)(uint64_t, uint64_t, char *, uint64_t, char *))F(v16, a2, a3, a4, __src, __n, a7, v19, v23, v18);
      v17 = v22;
      v18 = v21;
      a2 = v20;
      a8 = &v26[v25];
      ++v19;
    }
    while (v19 <= v17);
  }
  else
  {
    v19 = 1;
  }
  if ((_DWORD)v24)
  {
    F(v16, a2, a3, a4, __src, __n, a7, v19, a10, v18);
    return (uint64_t (*)(uint64_t, uint64_t, char *, uint64_t, char *))memcpy(a8, a10, v24);
  }
  return result;
}

void *F(uint64_t (*a1)(uint64_t, uint64_t, char *, uint64_t, char *), uint64_t a2, uint64_t a3, uint64_t a4, void *__src, size_t __n, unsigned int a7, int a8, void *a9, char *a10)
{
  int v11;
  size_t v16;
  char *v17;
  char *v18;
  size_t v19;
  void *result;
  unsigned int v21;
  char *v22;
  size_t v23;
  _BYTE *v24;
  char *v25;
  char v26;

  v11 = __n;
  v16 = a2;
  v17 = a10;
  v18 = &a10[a2];
  memcpy(v18, __src, __n);
  v18[v11] = HIBYTE(a8);
  v18[v11 + 1] = BYTE2(a8);
  v18[v11 + 2] = BYTE1(a8);
  v18[v11 + 3] = a8;
  a1(a3, a4, v18, (v11 + 4), a10);
  v19 = v16;
  result = memcpy(a9, a10, v16);
  if (a7 >= 2)
  {
    v21 = 2;
    do
    {
      v22 = v18;
      result = (void *)a1(a3, a4, v17, a2, v18);
      if ((_DWORD)a2)
      {
        v23 = v19;
        v24 = a9;
        v25 = v18;
        do
        {
          v26 = *v25++;
          *v24++ ^= v26;
          --v23;
        }
        while (v23);
      }
      ++v21;
      v18 = v17;
      v17 = v22;
    }
    while (v21 <= a7);
  }
  return result;
}

double TSUCPUUsed(mach_msg_type_number_t *a1)
{
  mach_error_t v2;
  char *v3;
  double v4;
  mach_msg_type_number_t v5;
  unint64_t v6;
  mach_msg_type_number_t thread_info_outCnt;
  mach_msg_type_number_t act_listCnt;
  thread_act_array_t act_list;
  integer_t thread_info_out[4];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  act_list = 0;
  act_listCnt = 0;
  v2 = task_threads(*MEMORY[0x24BDAEC58], &act_list, &act_listCnt);
  if (v2)
  {
    v3 = mach_error_string(v2);
    NSLog((NSString *)CFSTR("Unable to get threads: %s"), v3);
    return 0.0;
  }
  v5 = act_listCnt;
  if (!act_listCnt)
  {
    v4 = 0.0;
    if (!a1)
      return v4;
    goto LABEL_10;
  }
  v6 = 0;
  v4 = 0.0;
  do
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    *(_OWORD *)thread_info_out = 0u;
    v12 = 0u;
    thread_info_outCnt = 32;
    if (!thread_info(act_list[v6], 3u, thread_info_out, &thread_info_outCnt) && (BYTE12(v12) & 2) == 0)
      v4 = v4 + (double)(int)v12 / 1000.0 * 100.0;
    ++v6;
    v5 = act_listCnt;
  }
  while (v6 < act_listCnt);
  if (a1)
LABEL_10:
    *a1 = v5;
  return v4;
}

void TSULogSink(uint64_t a1, NSString *format, ...)
{
  va_list va;

  va_start(va, format);
  if (g_logSinkBlock)
    (*(void (**)(void))(g_logSinkBlock + 16))();
  else
    NSLogv(format, va);
}

void *TSULogSinkSetBlock(void *aBlock)
{
  void *result;

  result = (void *)g_logSinkBlock;
  if ((void *)g_logSinkBlock != aBlock)
  {
    if (g_logSinkBlock)
      _Block_release((const void *)g_logSinkBlock);
    if (aBlock)
      result = _Block_copy(aBlock);
    else
      result = 0;
    g_logSinkBlock = (uint64_t)result;
  }
  return result;
}

void sub_216D951AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
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

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void sub_216D968E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_216D9735C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
  _Block_object_dispose(&a40, 8);
  _Unwind_Resume(a1);
}

void sub_216D97780(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_216D97DAC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_216D9C2EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v10;
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v10 - 128), 8);
  _Block_object_dispose((const void *)(v10 - 96), 8);
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

void sub_216D9D008(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t APFSMakeCompatibleName()
{
  return MEMORY[0x24BDFD290]();
}

BOOL CATransform3DEqualToTransform(CATransform3D *a, CATransform3D *b)
{
  return MEMORY[0x24BDE5588](a, b);
}

CCCryptorStatus CCCryptorCreate(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x24BDAC110](*(_QWORD *)&op, *(_QWORD *)&alg, *(_QWORD *)&options, key, keyLength, iv, cryptorRef);
}

CCCryptorStatus CCCryptorFinal(CCCryptorRef cryptorRef, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x24BDAC130](cryptorRef, dataOut, dataOutAvailable, dataOutMoved);
}

size_t CCCryptorGetOutputLength(CCCryptorRef cryptorRef, size_t inputLength, BOOL final)
{
  return MEMORY[0x24BDAC178](cryptorRef, inputLength, final);
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return MEMORY[0x24BDAC188](cryptorRef);
}

CCCryptorStatus CCCryptorUpdate(CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x24BDAC198](cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

void CCHmac(CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
  MEMORY[0x24BDAC238](*(_QWORD *)&algorithm, key, keyLength, data, dataLength, macOut);
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x24BDAC308](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x24BDAC310](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC318](c, data, *(_QWORD *)&len);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x24BDAC328](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x24BDAC330](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC338](c, data, *(_QWORD *)&len);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC360](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC368](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC370](c, data, *(_QWORD *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CFGregorianDate CFAbsoluteTimeGetGregorianDate(CFAbsoluteTime at, CFTimeZoneRef tz)
{
  uint64_t v2;
  double v3;
  CFGregorianDate result;

  v2 = MEMORY[0x24BDBB788](tz, at);
  result.second = v3;
  result.year = v2;
  result.month = BYTE4(v2);
  result.day = BYTE5(v2);
  result.hour = BYTE6(v2);
  result.minute = HIBYTE(v2);
  return result;
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
  MEMORY[0x24BDBB7C0](theArray, otherArray, otherRange.location, otherRange.length);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x24BDBBC20](theSetIdentifier);
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return MEMORY[0x24BDBBC30](theSet, theChar);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x24BDBBC58](cf);
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x24BDBBC80](type_id);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x24BDBBCB0](allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x24BDBBCC0](allocator, bytes, length, bytesDeallocator);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x24BDBBD00](theData);
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
  MEMORY[0x24BDBBD20](theData, length);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x24BDBBD30](allocator, at);
}

CFTypeRef CFDateFormatterCopyProperty(CFDateFormatterRef formatter, CFDateFormatterKey key)
{
  return (CFTypeRef)MEMORY[0x24BDBBD38](formatter, key);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x24BDBBD40](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateDateFormatFromTemplate(CFAllocatorRef allocator, CFStringRef tmplate, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringRef)MEMORY[0x24BDBBD48](allocator, tmplate, options, locale);
}

CFDateRef CFDateFormatterCreateDateFromString(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFStringRef string, CFRange *rangep)
{
  return (CFDateRef)MEMORY[0x24BDBBD50](allocator, formatter, string, rangep);
}

CFStringRef CFDateFormatterCreateStringWithAbsoluteTime(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFAbsoluteTime at)
{
  return (CFStringRef)MEMORY[0x24BDBBD60](allocator, formatter, at);
}

CFStringRef CFDateFormatterCreateStringWithDate(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFDateRef date)
{
  return (CFStringRef)MEMORY[0x24BDBBD68](allocator, formatter, date);
}

Boolean CFDateFormatterGetAbsoluteTimeFromString(CFDateFormatterRef formatter, CFStringRef string, CFRange *rangep, CFAbsoluteTime *atp)
{
  return MEMORY[0x24BDBBD70](formatter, string, rangep, atp);
}

CFStringRef CFDateFormatterGetFormat(CFDateFormatterRef formatter)
{
  return (CFStringRef)MEMORY[0x24BDBBD78](formatter);
}

CFLocaleRef CFDateFormatterGetLocale(CFDateFormatterRef formatter)
{
  return (CFLocaleRef)MEMORY[0x24BDBBD80](formatter);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
  MEMORY[0x24BDBBD88](formatter, formatString);
}

void CFDateFormatterSetProperty(CFDateFormatterRef formatter, CFStringRef key, CFTypeRef value)
{
  MEMORY[0x24BDBBD90](formatter, key, value);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBBD98](theDate);
  return result;
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x24BDBBDB8](theDict, applier, context);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x24BDBBDC0](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x24BDBBE00](theDict);
}

CFIndex CFDictionaryGetCountOfKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x24BDBBE08](theDict, key);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x24BDBBE10](theDict, keys, values);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x24BDBBE38](theDict, key, value);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
  MEMORY[0x24BDBBE40](theDict);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x24BDBBE48](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFAbsoluteTime CFGregorianDateGetAbsoluteTime(CFGregorianDate gdate, CFTimeZoneRef tz)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBBF08](*(_QWORD *)&gdate.year, *(_QWORD *)&gdate.second, tz);
  return result;
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x24BDBBF10](cf);
}

CFArrayRef CFLocaleCopyCommonISOCurrencyCodes(void)
{
  return (CFArrayRef)MEMORY[0x24BDBBF20]();
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x24BDBBF28]();
}

CFStringRef CFLocaleCopyDisplayNameForPropertyValue(CFLocaleRef displayLocale, CFLocaleKey key, CFStringRef value)
{
  return (CFStringRef)MEMORY[0x24BDBBF30](displayLocale, key, value);
}

CFArrayRef CFLocaleCopyISOCurrencyCodes(void)
{
  return (CFArrayRef)MEMORY[0x24BDBBF38]();
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x24BDBBF48](allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleCreateCanonicalLocaleIdentifierFromString(CFAllocatorRef allocator, CFStringRef localeIdentifier)
{
  return (CFLocaleIdentifier)MEMORY[0x24BDBBF58](allocator, localeIdentifier);
}

CFDictionaryRef CFLocaleCreateComponentsFromLocaleIdentifier(CFAllocatorRef allocator, CFLocaleIdentifier localeID)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBF60](allocator, localeID);
}

CFLocaleIdentifier CFLocaleCreateLocaleIdentifierFromComponents(CFAllocatorRef allocator, CFDictionaryRef dictionary)
{
  return (CFLocaleIdentifier)MEMORY[0x24BDBBF70](allocator, dictionary);
}

CFLocaleIdentifier CFLocaleGetIdentifier(CFLocaleRef locale)
{
  return (CFLocaleIdentifier)MEMORY[0x24BDBBF78](locale);
}

CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFLocaleKey key)
{
  return (CFTypeRef)MEMORY[0x24BDBBF98](locale, key);
}

CFTypeRef CFMakeCollectable(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBBFE8](cf);
}

CFTypeRef CFNumberFormatterCopyProperty(CFNumberFormatterRef formatter, CFNumberFormatterKey key)
{
  return (CFTypeRef)MEMORY[0x24BDBC0B0](formatter, key);
}

CFNumberFormatterRef CFNumberFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFNumberFormatterStyle style)
{
  return (CFNumberFormatterRef)MEMORY[0x24BDBC0B8](allocator, locale, style);
}

CFStringRef CFNumberFormatterCreateStringWithValue(CFAllocatorRef allocator, CFNumberFormatterRef formatter, CFNumberType numberType, const void *valuePtr)
{
  return (CFStringRef)MEMORY[0x24BDBC0D0](allocator, formatter, numberType, valuePtr);
}

Boolean CFNumberFormatterGetDecimalInfoForCurrencyCode(CFStringRef currencyCode, int32_t *defaultFractionDigits, double *roundingIncrement)
{
  return MEMORY[0x24BDBC0D8](currencyCode, defaultFractionDigits, roundingIncrement);
}

CFStringRef CFNumberFormatterGetFormat(CFNumberFormatterRef formatter)
{
  return (CFStringRef)MEMORY[0x24BDBC0E0](formatter);
}

Boolean CFNumberFormatterGetValueFromString(CFNumberFormatterRef formatter, CFStringRef string, CFRange *rangep, CFNumberType numberType, void *valuePtr)
{
  return MEMORY[0x24BDBC0F0](formatter, string, rangep, numberType, valuePtr);
}

void CFNumberFormatterSetFormat(CFNumberFormatterRef formatter, CFStringRef formatString)
{
  MEMORY[0x24BDBC0F8](formatter, formatString);
}

void CFNumberFormatterSetProperty(CFNumberFormatterRef formatter, CFNumberFormatterKey key, CFTypeRef value)
{
  MEMORY[0x24BDBC100](formatter, key, value);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x24BDBC3C0](theSet, value);
}

CFSetRef CFSetCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFSetCallBacks *callBacks)
{
  return (CFSetRef)MEMORY[0x24BDBC3D8](allocator, values, numValues, callBacks);
}

CFSetRef CFSetCreateCopy(CFAllocatorRef allocator, CFSetRef theSet)
{
  return (CFSetRef)MEMORY[0x24BDBC3E0](allocator, theSet);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x24BDBC3E8](allocator, capacity, callBacks);
}

CFMutableSetRef CFSetCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFSetRef theSet)
{
  return (CFMutableSetRef)MEMORY[0x24BDBC3F0](allocator, capacity, theSet);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x24BDBC3F8](theSet);
}

Boolean CFSetGetValueIfPresent(CFSetRef theSet, const void *candidate, const void **value)
{
  return MEMORY[0x24BDBC410](theSet, candidate, value);
}

void CFSetGetValues(CFSetRef theSet, const void **values)
{
  MEMORY[0x24BDBC418](theSet, values);
}

void CFSetRemoveAllValues(CFMutableSetRef theSet)
{
  MEMORY[0x24BDBC420](theSet);
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x24BDBC428](theSet, value);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x24BDBC4A8](theString, appendedString);
}

void CFStringAppendCharacters(CFMutableStringRef theString, const UniChar *chars, CFIndex numChars)
{
  MEMORY[0x24BDBC4B8](theString, chars, numChars);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

unint64_t CFStringConvertEncodingToNSStringEncoding(CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC4F0](*(_QWORD *)&encoding);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x24BDBC520](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC538](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC540](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x24BDBC5B0](alloc, str, range.location, range.length);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3;
  CFIndex v4;
  CFRange result;

  v3 = MEMORY[0x24BDBC5D0](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

Boolean CFStringFindCharacterFromSet(CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x24BDBC5E0](theString, theSet, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

Boolean CFStringFindWithOptions(CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x24BDBC5E8](theString, stringToFind, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x24BDBC5F8](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x24BDBC618](theString, idx);
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

CFStringEncoding CFStringGetSystemEncoding(void)
{
  return MEMORY[0x24BDBC690]();
}

void CFStringReplace(CFMutableStringRef theString, CFRange range, CFStringRef replacement)
{
  MEMORY[0x24BDBC6E0](theString, range.location, range.length, replacement);
}

Boolean CFStringTransform(CFMutableStringRef string, CFRange *range, CFStringRef transform, Boolean reverse)
{
  return MEMORY[0x24BDBC730](string, range, transform, reverse);
}

void CFStringTrimWhitespace(CFMutableStringRef theString)
{
  MEMORY[0x24BDBC740](theString);
}

CFTimeZoneRef CFTimeZoneCopyDefault(void)
{
  return (CFTimeZoneRef)MEMORY[0x24BDBC758]();
}

CFTimeZoneRef CFTimeZoneCreateWithTimeIntervalFromGMT(CFAllocatorRef allocator, CFTimeInterval ti)
{
  return (CFTimeZoneRef)MEMORY[0x24BDBC770](allocator, ti);
}

CFStringRef CFURLCreateStringByAddingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveUnescaped, CFStringRef legalURLCharactersToBeEscaped, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC838](allocator, originalString, charactersToLeaveUnescaped, legalURLCharactersToBeEscaped, *(_QWORD *)&encoding);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8D0](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x24BDBC8E8](alloc, uuid);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1;
  uint64_t v2;
  CFUUIDBytes result;

  v1 = MEMORY[0x24BDBC908](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8A0](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8F8](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD900](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD908](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x24BDBD920](context);
}

CGContextRef CGBitmapContextCreateWithData(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo, CGBitmapContextReleaseDataCallback releaseCallback, void *releaseInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD930](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo, releaseCallback);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x24BDBDA78](space, components);
}

CGColorRef CGColorCreateCopy(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x24BDBDA80](color);
}

CGColorRef CGColorCreateCopyWithAlpha(CGColorRef color, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x24BDBDA90](color, alpha);
}

CGColorRef CGColorCreateWithPattern(CGColorSpaceRef space, CGPatternRef pattern, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x24BDBDAB8](space, pattern, components);
}

BOOL CGColorEqualToColor(CGColorRef color1, CGColorRef color2)
{
  return MEMORY[0x24BDBDAC0](color1, color2);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  CGFloat result;

  MEMORY[0x24BDBDAE8](color);
  return result;
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDAF0](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x24BDBDAF8](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x24BDBDB08](color);
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x24BDBDB40](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceCMYK(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB78]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB80]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

CGColorSpaceRef CGColorSpaceCreatePattern(CGColorSpaceRef baseSpace)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBA0](baseSpace);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBB8](name);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x24BDBDC10](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x24BDBDCE0](c, path);
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
  MEMORY[0x24BDBDD50](c, transform);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x24BDBDDD8](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
  MEMORY[0x24BDBDDF8](c, gradient, *(_QWORD *)&options, (__n128)startPoint, *(__n128 *)&startPoint.y, (__n128)endPoint, *(__n128 *)&endPoint.y);
}

void CGContextFillPath(CGContextRef c)
{
  MEMORY[0x24BDBDE68](c);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE70](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x24BDBDF30](c);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x24BDBDF58](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x24BDBDF70](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x24BDBDF78](c, sx, sy);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBDFD8](c, color);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x24BDBE130](c, tx, ty);
}

CGDataProviderRef CGDataProviderCreateSequential(void *info, const CGDataProviderSequentialCallbacks *callbacks)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE178](info, callbacks);
}

CGDataProviderRef CGDataProviderCreateWithURL(CFURLRef url)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE1A0](url);
}

CGImageRef CGImageCreateCopyWithColorSpace(CGImageRef image, CGColorSpaceRef space)
{
  return (CGImageRef)MEMORY[0x24BDBE5F0](image, space);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x24BDBE5F8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x24BDD9048](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x24BDD9078](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x24BDD9090](idst);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x24BDBE778](image);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x24BDD9148](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x24BDD9158](isrc, index, options);
}

CGPatternRef CGPatternCreate(void *info, CGRect bounds, CGAffineTransform *matrix, CGFloat xStep, CGFloat yStep, CGPatternTiling tiling, BOOL isColored, const CGPatternCallbacks *callbacks)
{
  return (CGPatternRef)MEMORY[0x24BDBEF58](info, matrix, *(_QWORD *)&tiling, isColored, callbacks, (__n128)bounds.origin, *(__n128 *)&bounds.origin.y, (__n128)bounds.size, *(__n128 *)&bounds.size.height, xStep, yStep);
}

void CGPatternRelease(CGPatternRef pattern)
{
  MEMORY[0x24BDBEF88](pattern);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBEFB8](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
  MEMORY[0x24BDBEFD8](slice, remainder, *(_QWORD *)&edge, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, amount);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF040]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x24BDBF058]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x24BDBF060]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF088]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CFStringRef CTFontCopyFamilyName(CTFontRef font)
{
  return (CFStringRef)MEMORY[0x24BDC4700](font);
}

CFStringRef CTFontCopyPostScriptName(CTFontRef font)
{
  return (CFStringRef)MEMORY[0x24BDC4748](font);
}

CTFontRef CTFontCreateCopyWithAttributes(CTFontRef font, CGFloat size, const CGAffineTransform *matrix, CTFontDescriptorRef attributes)
{
  return (CTFontRef)MEMORY[0x24BDC4788](font, matrix, attributes, size);
}

CTFontRef CTFontCreateCopyWithSymbolicTraits(CTFontRef font, CGFloat size, const CGAffineTransform *matrix, CTFontSymbolicTraits symTraitValue, CTFontSymbolicTraits symTraitMask)
{
  return (CTFontRef)MEMORY[0x24BDC4790](font, matrix, *(_QWORD *)&symTraitValue, *(_QWORD *)&symTraitMask, size);
}

CTFontRef CTFontCreateWithName(CFStringRef name, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x24BDC47C8](name, matrix, size);
}

CGFloat CTFontGetAscent(CTFontRef font)
{
  CGFloat result;

  MEMORY[0x24BDC48B8](font);
  return result;
}

CGFloat CTFontGetCapHeight(CTFontRef font)
{
  CGFloat result;

  MEMORY[0x24BDC48D0](font);
  return result;
}

CGFloat CTFontGetDescent(CTFontRef font)
{
  CGFloat result;

  MEMORY[0x24BDC48E0](font);
  return result;
}

CGFloat CTFontGetSize(CTFontRef font)
{
  CGFloat result;

  MEMORY[0x24BDC4908](font);
  return result;
}

CGFloat CTFontGetXHeight(CTFontRef font)
{
  CGFloat result;

  MEMORY[0x24BDC4960](font);
  return result;
}

void NSDeallocateObject(id object)
{
  MEMORY[0x24BDD0B98](object);
}

const char *__cdecl NSGetSizeAndAlignment(const char *typePtr, NSUInteger *sizep, NSUInteger *alignp)
{
  return (const char *)MEMORY[0x24BDBCAA0](typePtr, sizep, alignp);
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

void NSLogv(NSString *format, va_list args)
{
  MEMORY[0x24BDD1008](format, args);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x24BDD13D8](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void NSZoneFree(NSZone *zone, void *ptr)
{
  MEMORY[0x24BDD1418](zone, ptr);
}

void *__cdecl NSZoneMalloc(NSZone *zone, NSUInteger size)
{
  return (void *)MEMORY[0x24BDD1420](zone, size);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x24BDF5760](allocator, address);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithName(CFAllocatorRef allocator, const char *nodename)
{
  return (SCNetworkReachabilityRef)MEMORY[0x24BDF5770](allocator, nodename);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x24BDF5790](target, flags);
}

void UIGraphicsBeginImageContext(CGSize size)
{
  MEMORY[0x24BDF78C0]((__n128)size, *(__n128 *)&size.height);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BDF78C8](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BDF78D0]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x24BDF78D8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BDF78E0]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x24BDF7920](image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x24BDF7928](image);
}

void UIRectFill(CGRect rect)
{
  MEMORY[0x24BDF7CC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return MEMORY[0x24BDC15A8](inUTI, inConformsToUTI);
}

CFStringRef UTTypeCopyPreferredTagWithClass(CFStringRef inUTI, CFStringRef inTagClass)
{
  return (CFStringRef)MEMORY[0x24BDC15D0](inUTI, inTagClass);
}

CFArrayRef UTTypeCreateAllIdentifiersForTag(CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI)
{
  return (CFArrayRef)MEMORY[0x24BDC15D8](inTagClass, inTag, inConformingToUTI);
}

CFStringRef UTTypeCreatePreferredIdentifierForTag(CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI)
{
  return (CFStringRef)MEMORY[0x24BDC15E0](inTagClass, inTag, inConformingToUTI);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x24BDAC728](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC58](this, __s);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

void operator delete(void *__p)
{
  off_24D61A298(__p);
}

uint64_t operator delete()
{
  return off_24D61A2A0();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24D61A2A8(__sz);
}

uint64_t operator new()
{
  return off_24D61A2B0();
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x24BEDB940](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

int __fpclassifyd(double a1)
{
  return MEMORY[0x24BDAC7F0](a1);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x24BDAD288](a1, *(_QWORD *)&a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return (char **)MEMORY[0x24BDAD2A0](a1, *(_QWORD *)&a2);
}

Ivar *__cdecl class_copyIvarList(Class cls, unsigned int *outCount)
{
  return (Ivar *)MEMORY[0x24BEDCE68](cls, outCount);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x24BEDCEA0](cls, name);
}

size_t class_getInstanceSize(Class cls)
{
  return MEMORY[0x24BEDCEA8](cls);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x24BEDCEC0](cls);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x24BEDCED0](cls);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return MEMORY[0x24BEDF1C0](crc, buf, *(_QWORD *)&len);
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x24BEDF1C8](strm, *(_QWORD *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x24BEDF1D8](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x24BEDF1E0](strm, *(_QWORD *)&level, *(_QWORD *)&method, *(_QWORD *)&windowBits, *(_QWORD *)&memLevel, *(_QWORD *)&strategy, version, *(_QWORD *)&stream_size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

BOOL dispatch_data_apply(dispatch_data_t data, dispatch_data_applier_t applier)
{
  return MEMORY[0x24BDADD48](data, applier);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x24BDADD60](buffer, size, queue, destructor);
}

dispatch_data_t dispatch_data_create_concat(dispatch_data_t data1, dispatch_data_t data2)
{
  return (dispatch_data_t)MEMORY[0x24BDADD70](data1, data2);
}

dispatch_data_t dispatch_data_create_map(dispatch_data_t data, const void **buffer_ptr, size_t *size_ptr)
{
  return (dispatch_data_t)MEMORY[0x24BDADD78](data, buffer_ptr, size_ptr);
}

dispatch_data_t dispatch_data_create_subrange(dispatch_data_t data, size_t offset, size_t length)
{
  return (dispatch_data_t)MEMORY[0x24BDADD80](data, offset, length);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x24BDADD90](data);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDB8](group, queue, block);
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_io_barrier(dispatch_io_t channel, dispatch_block_t barrier)
{
  MEMORY[0x24BDADDF8](channel, barrier);
}

void dispatch_io_close(dispatch_io_t channel, dispatch_io_close_flags_t flags)
{
  MEMORY[0x24BDADE00](channel, flags);
}

dispatch_io_t dispatch_io_create(dispatch_io_type_t type, dispatch_fd_t fd, dispatch_queue_t queue, void *cleanup_handler)
{
  return (dispatch_io_t)MEMORY[0x24BDADE08](type, *(_QWORD *)&fd, queue, cleanup_handler);
}

dispatch_io_t dispatch_io_create_with_io(dispatch_io_type_t type, dispatch_io_t io, dispatch_queue_t queue, void *cleanup_handler)
{
  return (dispatch_io_t)MEMORY[0x24BDADE10](type, io, queue, cleanup_handler);
}

void dispatch_io_read(dispatch_io_t channel, off_t offset, size_t length, dispatch_queue_t queue, dispatch_io_handler_t io_handler)
{
  MEMORY[0x24BDADE28](channel, offset, length, queue, io_handler);
}

void dispatch_io_set_low_water(dispatch_io_t channel, size_t low_water)
{
  MEMORY[0x24BDADE30](channel, low_water);
}

void dispatch_io_write(dispatch_io_t channel, off_t offset, dispatch_data_t data, dispatch_queue_t queue, dispatch_io_handler_t io_handler)
{
  MEMORY[0x24BDADE38](channel, offset, data, queue, io_handler);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x24BDAE058](a1, a2);
}

int dup(int a1)
{
  return MEMORY[0x24BDAE0B8](*(_QWORD *)&a1);
}

char *__cdecl ether_ntoa(const ether_addr *a1)
{
  return (char *)MEMORY[0x24BDAE1E0](a1);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x24BDAE300](*(_QWORD *)&a1, a2);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE448](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fseeko(FILE *__stream, off_t a2, int __whence)
{
  return MEMORY[0x24BDAE4E0](__stream, a2, *(_QWORD *)&__whence);
}

int fsync(int a1)
{
  return MEMORY[0x24BDAE528](*(_QWORD *)&a1);
}

off_t ftello(FILE *__stream)
{
  return MEMORY[0x24BDAE538](__stream);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x24BDAE548](*(_QWORD *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

int gzclose(gzFile file)
{
  return MEMORY[0x24BEDF200](file);
}

gzFile gzdopen(int fd, const char *mode)
{
  return (gzFile)MEMORY[0x24BEDF210](*(_QWORD *)&fd, mode);
}

int gzread(gzFile file, voidp buf, unsigned int len)
{
  return MEMORY[0x24BEDF248](file, buf, *(_QWORD *)&len);
}

int gzwrite(gzFile file, voidpc buf, unsigned int len)
{
  return MEMORY[0x24BEDF258](file, buf, *(_QWORD *)&len);
}

kern_return_t host_page_size(host_t a1, vm_size_t *a2)
{
  return MEMORY[0x24BDAE800](*(_QWORD *)&a1, a2);
}

kern_return_t host_statistics(host_t host_priv, host_flavor_t flavor, host_info_t host_info_out, mach_msg_type_number_t *host_info_outCnt)
{
  return MEMORY[0x24BDAE820](*(_QWORD *)&host_priv, *(_QWORD *)&flavor, host_info_out, host_info_outCnt);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x24BEDF260](strm, *(_QWORD *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x24BEDF268](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x24BEDF270](strm, *(_QWORD *)&windowBits, version, *(_QWORD *)&stream_size);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x24BDAE8C8](*(_QWORD *)&a1, a2);
}

int link(const char *a1, const char *a2)
{
  return MEMORY[0x24BDAEA70](a1, a2);
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x24BDAEA98](a1);
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAB0](__x);
  return result;
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAD8](__x);
  return result;
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x24BDAEB20](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x24BDAEB58](*(_QWORD *)&error_value);
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x24BDAEB68]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

malloc_zone_t *malloc_default_zone(void)
{
  return (malloc_zone_t *)MEMORY[0x24BDAED20]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE70](__s, *(_QWORD *)&__c, __n);
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

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAEF28](a1, a2);
}

int mkstemp(char *a1)
{
  return MEMORY[0x24BDAEF70](a1);
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x24BEDD0D8](location);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD110](a1, a2);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3F0](self, _cmd, newValue, offset);
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x24BEDD460](a1);
}

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x24BEDD468](a1);
}

id object_getIvar(id a1, Ivar a2)
{
  return (id)MEMORY[0x24BEDD480](a1, a2);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x24BDAF698](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

int rand(void)
{
  return MEMORY[0x24BDAFA38]();
}

uint64_t random(void)
{
  return MEMORY[0x24BDAFA48]();
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x24BDAFAC0](a1, a2);
}

int regcomp(regex_t *a1, const char *a2, int a3)
{
  return MEMORY[0x24BDAFAF8](a1, a2, *(_QWORD *)&a3);
}

int regexec(const regex_t *a1, const char *a2, size_t a3, regmatch_t __pmatch[], int a5)
{
  return MEMORY[0x24BDAFB08](a1, a2, a3, __pmatch, *(_QWORD *)&a5);
}

void regfree(regex_t *a1)
{
  MEMORY[0x24BDAFB10](a1);
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x24BDAFE18](__x);
  return result;
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x24BDAFE50](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x24BEDDF98](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x24BEDE010](a1);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE050](a1, *(_QWORD *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x24BEDE068](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x24BEDE108](a1);
}

int sqlite3_extended_result_codes(sqlite3 *a1, int onoff)
{
  return MEMORY[0x24BEDE130](a1, *(_QWORD *)&onoff);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE140](pStmt);
}

sqlite3_stmt *__cdecl sqlite3_next_stmt(sqlite3 *pDb, sqlite3_stmt *pStmt)
{
  return (sqlite3_stmt *)MEMORY[0x24BEDE1B0](pDb, pStmt);
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

const char *__cdecl sqlite3_sql(sqlite3_stmt *pStmt)
{
  return (const char *)MEMORY[0x24BEDE2A0](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x24BEDE2A8](a1);
}

void srand(unsigned int a1)
{
  MEMORY[0x24BDAFE80](*(_QWORD *)&a1);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFEA0](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x24BDB00F8](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x24BDB0180](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

kern_return_t task_threads(task_inspect_t target_task, thread_act_array_t *act_list, mach_msg_type_number_t *act_listCnt)
{
  return MEMORY[0x24BDB01C8](*(_QWORD *)&target_task, act_list, act_listCnt);
}

kern_return_t thread_info(thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return MEMORY[0x24BDB0210](*(_QWORD *)&target_act, *(_QWORD *)&flavor, thread_info_out, thread_info_outCnt);
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x24BDB02B0](a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x24BDB0558](*(_QWORD *)&__fd, __buf, __nbyte);
}

xmlParserCtxtPtr xmlCreatePushParserCtxt(xmlSAXHandlerPtr sax, void *user_data, const char *chunk, int size, const char *filename)
{
  return (xmlParserCtxtPtr)MEMORY[0x24BEDE6B8](sax, user_data, chunk, *(_QWORD *)&size, filename);
}

void xmlFreeDoc(xmlDocPtr cur)
{
  MEMORY[0x24BEDE760](cur);
}

void xmlFreeParserCtxt(xmlParserCtxtPtr ctxt)
{
  MEMORY[0x24BEDE798](ctxt);
}

int xmlParseChunk(xmlParserCtxtPtr ctxt, const char *chunk, int size, int terminate)
{
  return MEMORY[0x24BEDEAB0](ctxt, chunk, *(_QWORD *)&size, *(_QWORD *)&terminate);
}

xmlTextReaderPtr xmlReaderForIO(xmlInputReadCallback ioread, xmlInputCloseCallback ioclose, void *ioctx, const char *URL, const char *encoding, int options)
{
  return (xmlTextReaderPtr)MEMORY[0x24BEDEB08](ioread, ioclose, ioctx, URL, encoding, *(_QWORD *)&options);
}

