void sub_19214AAA8()
{
  objc_end_catch();
  JUMPOUT(0x19214AAB0);
}

void sub_19214AE18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t TRIPBCodedInputStreamReadTag(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 == *(_QWORD *)(a1 + 8) || v2 == *(_QWORD *)(a1 + 24))
  {
    result = 0;
    *(_DWORD *)(a1 + 32) = 0;
  }
  else
  {
    result = ReadRawVarint64((uint64_t *)a1);
    *(_DWORD *)(a1 + 32) = result;
    if ((~(_DWORD)result & 6) == 0)
    {
      RaiseException(-103, CFSTR("Invalid wireformat in tag."));
      result = *(unsigned int *)(a1 + 32);
    }
    if (result <= 7)
    {
      RaiseException(-103, CFSTR("A zero field number on the wire is invalid."));
      return *(unsigned int *)(a1 + 32);
    }
  }
  return result;
}

uint64_t ReadRawVarint64(uint64_t *a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = 0;
  v3 = 0;
  while (v2 <= 0x3F)
  {
    CheckSize((uint64_t)a1, 1);
    v4 = *a1;
    v5 = a1[2];
    a1[2] = v5 + 1;
    LOBYTE(v4) = *(_BYTE *)(v4 + v5);
    v3 |= (v4 & 0x7F) << v2;
    v2 += 7;
    if ((v4 & 0x80) == 0)
      return v3;
  }
  RaiseException(-105, CFSTR("Invalid VarInt64"));
  return 0;
}

uint64_t CheckSize(uint64_t result, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v2 = (_QWORD *)result;
  v3 = *(_QWORD *)(result + 16);
  v4 = v3 + a2;
  if (__CFADD__(v3, a2))
    result = RaiseException(-100, CFSTR("Buffer size overflow"));
  if (v4 > v2[1])
    result = RaiseException(-100, 0);
  v5 = v2[3];
  if (v4 > v5)
  {
    v2[2] = v5;
    return RaiseException(-101, 0);
  }
  return result;
}

void *TRIPBBecomeVisibleToAutocreator(_QWORD *a1)
{
  void *result;

  result = (void *)a1[4];
  if (result)
  {
    if (a1[5])
      return (void *)TRIPBSetRetainedObjectIvarWithFieldInternal(a1[4], a1[5], a1, objc_msgSend((id)objc_msgSend((id)objc_msgSend(result, "descriptor"), "file"), "syntax"));
    else
      return (void *)objc_msgSend(result, "setExtension:value:", a1[6], a1);
  }
  return result;
}

void *TRIPBSetRetainedObjectIvarWithFieldInternal(_QWORD *a1, uint64_t a2, void *a3, int a4)
{
  uint64_t v8;
  int v9;
  unsigned int v10;
  int v11;
  uint64_t v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  void *v18;

  if (!a1[8])
  {
    v18 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void TRIPBSetRetainedObjectIvarWithFieldInternal(TRIPBMessage *, TRIPBFieldDescriptor *, id, TRIPBFileSyntax)"), CFSTR("TRIPBUtilities.m"), 507, CFSTR("%@: All messages should have storage (from init)"), objc_opt_class());
  }
  v8 = *(_QWORD *)(a2 + 8);
  v9 = *(unsigned __int8 *)(v8 + 30);
  v10 = v9 - 15;
  v11 = *(_WORD *)(v8 + 28) & 0xF02;
  if ((*(_WORD *)(v8 + 28) & 0xF02) == 0)
  {
    v12 = *(_QWORD *)(a2 + 16);
    if (v12)
      TRIPBMaybeClearOneof((uint64_t)a1, *(void **)(a2 + 16), *(unsigned int *)(v8 + 20), *(_DWORD *)(v8 + 16));
    v13 = a3 != 0;
    if (a4 == 3 && v10 >= 2 && !objc_msgSend(a3, "length"))
    {
      if (a3 && v12)
      {
        v13 = 1;
      }
      else
      {

        a3 = 0;
        v13 = 0;
      }
    }
    TRIPBSetHasIvar((uint64_t)a1, *(_DWORD *)(*(_QWORD *)(a2 + 8) + 20), *(_DWORD *)(*(_QWORD *)(a2 + 8) + 16), v13);
    v8 = *(_QWORD *)(a2 + 8);
  }
  v14 = a1[8];
  v15 = *(unsigned int *)(v8 + 24);
  v16 = *(_QWORD **)(v14 + v15);
  *(_QWORD *)(v14 + v15) = a3;
  if (v16)
  {
    if (!v11)
    {
      if (v10 <= 1 && (_QWORD *)v16[4] == a1)
        TRIPBClearMessageAutocreator((uint64_t)v16);
      goto LABEL_30;
    }
    if (objc_msgSend((id)a2, "fieldType") == 1)
    {
      if ((v9 - 13) <= 3)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
LABEL_26:
          if ((_QWORD *)v16[1] == a1)
            v16[1] = 0;
        }
LABEL_30:

        return TRIPBBecomeVisibleToAutocreator(a1);
      }
    }
    else if (objc_msgSend((id)a2, "mapKeyDataType") == 14 && (v9 - 13) <= 3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_26;
      goto LABEL_30;
    }
    if ((_QWORD *)v16[1] == a1)
      v16[1] = 0;
    goto LABEL_30;
  }
  return TRIPBBecomeVisibleToAutocreator(a1);
}

uint64_t TRIPBSetHasIvar(uint64_t result, unsigned int a2, int a3, int a4)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  int v9;
  int v10;
  int v12;
  void *v13;
  void *v14;

  v6 = result;
  if ((a2 & 0x80000000) != 0)
  {
    if (!a3)
    {
      v14 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      result = objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void TRIPBSetHasIvar(TRIPBMessage *, int32_t, uint32_t, BOOL)"), CFSTR("TRIPBUtilities.m"), 313, CFSTR("Invalid field number."));
    }
    if (a4)
      v12 = a3;
    else
      v12 = 0;
    *(_DWORD *)(*(_QWORD *)(v6 + 64) + 4 * -a2) = v12;
  }
  else
  {
    if (a2 == 0x7FFFFFFF)
    {
      v13 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      result = objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void TRIPBSetHasIvar(TRIPBMessage *, int32_t, uint32_t, BOOL)"), CFSTR("TRIPBUtilities.m"), 317, CFSTR("Invalid has bit."));
    }
    v7 = *(_QWORD *)(v6 + 64);
    v8 = a2 >> 5;
    v9 = 1 << a2;
    if (a4)
      v10 = *(_DWORD *)(v7 + 4 * v8) | v9;
    else
      v10 = *(_DWORD *)(v7 + 4 * v8) & ~v9;
    *(_DWORD *)(v7 + 4 * v8) = v10;
  }
  return result;
}

uint64_t TRIPBGetObjectIvarWithField(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  _QWORD *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  void *v10;

  v4 = a2[1];
  if ((*(_WORD *)(v4 + 28) & 0xF02) != 0)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id TRIPBGetObjectIvarWithField(TRIPBMessage *, TRIPBFieldDescriptor *)"), CFSTR("TRIPBMessage.m"), 3304, CFSTR("Shouldn't get here"));
    v4 = a2[1];
  }
  if (TRIPBGetHasIvar(a1, *(_DWORD *)(v4 + 20), *(_DWORD *)(v4 + 16)))
    return *(_QWORD *)(*(_QWORD *)(a1 + 64) + *(unsigned int *)(a2[1] + 24));
  if (*(unsigned __int8 *)(a2[1] + 30) - 15 >= 2)
    return objc_msgSend(a2, "defaultValue");
  TRIPBPrepareReadOnlySemaphore(a1);
  v6 = atomic_load((unint64_t *)(a1 + 56));
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v7 = *(_QWORD *)(a1 + 64);
  if (!v7 || (v5 = *(_QWORD **)(v7 + *(unsigned int *)(a2[1] + 24))) == 0)
  {
    v5 = objc_alloc_init((Class)objc_msgSend(a2, "msgClass"));
    v5[4] = a1;
    v5[5] = a2;
    TRIPBSetAutocreatedRetainedObjectIvarWithField(a1, (uint64_t)a2, (uint64_t)v5);
  }
  v8 = atomic_load((unint64_t *)(a1 + 56));
  dispatch_semaphore_signal(v8);
  return (uint64_t)v5;
}

BOOL TRIPBGetHasIvar(uint64_t a1, unsigned int a2, int a3)
{
  void *v7;
  void *v8;
  void *v9;

  if (*(_QWORD *)(a1 + 64))
  {
    if ((a2 & 0x80000000) == 0)
    {
LABEL_3:
      if (a2 == 0x7FFFFFFF)
      {
        v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL TRIPBGetHasIvar(TRIPBMessage *, int32_t, uint32_t)"), CFSTR("TRIPBUtilities.m"), 294, CFSTR("Invalid has bit."));
      }
      return (*(_DWORD *)(*(_QWORD *)(a1 + 64) + 4 * (a2 >> 5)) >> a2) & 1;
    }
  }
  else
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL TRIPBGetHasIvar(TRIPBMessage *, int32_t, uint32_t)"), CFSTR("TRIPBUtilities.m"), 288, CFSTR("%@: All messages should have storage (from init)"), objc_opt_class());
    if ((a2 & 0x80000000) == 0)
      goto LABEL_3;
  }
  if (!a3)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL TRIPBGetHasIvar(TRIPBMessage *, int32_t, uint32_t)"), CFSTR("TRIPBUtilities.m"), 290, CFSTR("Invalid field number."));
  }
  return *(_DWORD *)(*(_QWORD *)(a1 + 64) + 4 * -a2) == a3;
}

void TRIPBClearAutocreatedMessageIvarWithField(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  if (!TRIPBGetHasIvar(a1, *(_DWORD *)(*(_QWORD *)(a2 + 8) + 20), *(_DWORD *)(*(_QWORD *)(a2 + 8) + 16)))
  {
    v4 = *(_QWORD *)(a1 + 64);
    v5 = *(unsigned int *)(*(_QWORD *)(a2 + 8) + 24);
    v6 = *(_QWORD *)(v4 + v5);
    v7 = (id)v6;
    *(_QWORD *)(v4 + v5) = 0;
    TRIPBClearMessageAutocreator(v6);

  }
}

void TRIPBClearMessageAutocreator(uint64_t a1)
{
  if (a1)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      *(_QWORD *)(a1 + 32) = 0;

      *(_QWORD *)(a1 + 40) = 0;
      *(_QWORD *)(a1 + 48) = 0;
    }
  }
}

void *CloneExtensionMap(void *a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a1, "count"))
    return 0;
  v4 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E08], "allocWithZone:", a2), "initWithCapacity:", objc_msgSend(a1, "count"));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v29;
    v21 = *(_QWORD *)v29;
    v22 = v4;
    do
    {
      v8 = 0;
      v23 = v6;
      do
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(a1);
        v9 = *(_QWORD **)(*((_QWORD *)&v28 + 1) + 8 * v8);
        v10 = (void *)objc_msgSend(a1, "objectForKey:", v9);
        v11 = *(unsigned __int8 *)(v9[1] + 44) - 15;
        if (objc_msgSend(v9, "isRepeated"))
        {
          if (v11 > 1)
          {
            v18 = objc_msgSend(v10, "mutableCopyWithZone:", a2);
            goto LABEL_20;
          }
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "count"));
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v25;
            do
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v25 != v15)
                  objc_enumerationMutation(v10);
                v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "copyWithZone:", a2);
                objc_msgSend(v12, "addObject:", v17);

              }
              v14 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            }
            while (v14);
          }
          v4 = v22;
          objc_msgSend(v22, "setObject:forKey:", v12, v9);

          v7 = v21;
          v6 = v23;
        }
        else
        {
          if (v11 <= 1)
          {
            v18 = objc_msgSend(v10, "copyWithZone:", a2);
LABEL_20:
            v19 = (void *)v18;
            objc_msgSend(v4, "setObject:forKey:", v18, v9);

            goto LABEL_22;
          }
          objc_msgSend(v4, "setObject:forKey:", v10, v9);
        }
LABEL_22:
        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v6);
  }
  return v4;
}

const __CFString *TRIPBCodedInputStreamReadRetainedString(uint64_t *a1)
{
  int RawVarint64;
  int v3;
  const __CFString *result;

  RawVarint64 = ReadRawVarint64(a1);
  v3 = RawVarint64;
  if (RawVarint64 < 0)
  {
    RaiseException(-104, CFSTR("Field delimited with negative length"));
  }
  else if (!RawVarint64)
  {
    return &stru_1E2E9CC90;
  }
  CheckSize((uint64_t)a1, v3);
  result = (const __CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", *a1 + a1[2], v3, 4);
  a1[2] += v3;
  if (!result)
  {
    NSLog(CFSTR("UTF-8 failure, is some field type 'string' when it should be 'bytes'?"));
    RaiseException(-104, 0);
    return 0;
  }
  return result;
}

void *TRIPBSetInt32IvarWithFieldInternal(_QWORD *a1, uint64_t a2, int a3, int a4)
{
  void *v8;
  _BOOL4 v9;

  v8 = *(void **)(a2 + 16);
  if (v8)
    TRIPBMaybeClearOneof((uint64_t)a1, v8, *(unsigned int *)(*(_QWORD *)(a2 + 8) + 20), *(_DWORD *)(*(_QWORD *)(a2 + 8) + 16));
  *(_DWORD *)(a1[8] + *(unsigned int *)(*(_QWORD *)(a2 + 8) + 24)) = a3;
  v9 = 1;
  if (!a3 && a4 != 2)
    v9 = *(_QWORD *)(a2 + 16) != 0;
  TRIPBSetHasIvar((uint64_t)a1, *(_DWORD *)(*(_QWORD *)(a2 + 8) + 20), *(_DWORD *)(*(_QWORD *)(a2 + 8) + 16), v9);
  return TRIPBBecomeVisibleToAutocreator(a1);
}

void MergeRepeatedNotPackedFieldFromCodedInputStream(_QWORD *a1, _QWORD *a2, int a3, uint64_t *a4, uint64_t a5)
{
  TRIPBAutocreatedArray *ArrayIvarWithField;
  uint64_t *v11;
  double v12;
  TRIPBAutocreatedArray *v13;
  uint64_t v14;
  uint64_t RetainedBytes;
  TRIPBAutocreatedArray *v16;
  id v17;
  uint64_t RawVarint64;
  uint64_t v19;
  id v20;

  ArrayIvarWithField = GetOrCreateArrayIvarWithField(a1, a2, a3);
  v11 = a4 + 1;
  switch(*(_BYTE *)(a2[1] + 30))
  {
    case 0:
      ReadRawVarint64(v11);
      goto LABEL_9;
    case 1:
    case 2:
      CheckSize((uint64_t)v11, 4);
      a4[3] += 4;
      goto LABEL_9;
    case 3:
      CheckSize((uint64_t)v11, 4);
      v14 = a4[3];
      LODWORD(v12) = *(_DWORD *)(a4[1] + v14);
      a4[3] = v14 + 4;
      v13 = ArrayIvarWithField;
      goto LABEL_7;
    case 4:
    case 5:
      CheckSize((uint64_t)v11, 8);
      a4[3] += 8;
      goto LABEL_12;
    case 6:
      CheckSize((uint64_t)v11, 8);
      v19 = a4[3];
      v12 = *(double *)(a4[1] + v19);
      a4[3] = v19 + 8;
      v13 = ArrayIvarWithField;
      goto LABEL_7;
    case 7:
    case 0xB:
      ReadRawVarint64(v11);
      v13 = ArrayIvarWithField;
      goto LABEL_7;
    case 8:
    case 0xA:
    case 0xC:
      ReadRawVarint64(v11);
LABEL_12:
      v13 = ArrayIvarWithField;
      goto LABEL_7;
    case 9:
      ReadRawVarint64(v11);
LABEL_9:
      v13 = ArrayIvarWithField;
LABEL_7:
      -[TRIPBAutocreatedArray addValue:](v13, "addValue:", v12);
      return;
    case 0xD:
      RetainedBytes = TRIPBCodedInputStreamReadRetainedBytes(v11);
      goto LABEL_22;
    case 0xE:
      RetainedBytes = (uint64_t)TRIPBCodedInputStreamReadRetainedString(v11);
LABEL_22:
      v17 = (id)RetainedBytes;
      v20 = (id)RetainedBytes;
      v16 = ArrayIvarWithField;
      goto LABEL_23;
    case 0xF:
      v20 = objc_alloc_init((Class)objc_msgSend(a2, "msgClass"));
      objc_msgSend(a4, "readMessage:extensionRegistry:", v20, a5);
      goto LABEL_16;
    case 0x10:
      v20 = objc_alloc_init((Class)objc_msgSend(a2, "msgClass"));
      objc_msgSend(a4, "readGroup:message:extensionRegistry:", *(unsigned int *)(a2[1] + 16), v20, a5);
LABEL_16:
      v16 = ArrayIvarWithField;
      v17 = v20;
LABEL_23:
      -[TRIPBAutocreatedArray addObject:](v16, "addObject:", v17);

      break;
    case 0x11:
      RawVarint64 = ReadRawVarint64(v11);
      if (a3 == 3 || objc_msgSend(a2, "isValidEnumValue:", RawVarint64))
        -[TRIPBAutocreatedArray addRawValue:](ArrayIvarWithField, "addRawValue:", RawVarint64);
      else
        objc_msgSend((id)GetOrMakeUnknownFields(a1), "mergeVarintField:value:", *(unsigned int *)(a2[1] + 16), RawVarint64);
      break;
    default:
      return;
  }
}

TRIPBAutocreatedArray *GetOrCreateArrayIvarWithField(_QWORD *a1, _QWORD *a2, int a3)
{
  uint64_t v6;
  TRIPBAutocreatedArray *ArrayForField;

  v6 = a1[8];
  if (!v6 || (ArrayForField = *(TRIPBAutocreatedArray **)(v6 + *(unsigned int *)(a2[1] + 24))) == 0)
  {
    ArrayForField = CreateArrayForField(a2, 0);
    TRIPBSetRetainedObjectIvarWithFieldInternal(a1, (uint64_t)a2, ArrayForField, a3);
  }
  return ArrayForField;
}

uint64_t TRINamespace_NamespaceId_IsValidValue(int a1)
{
  uint64_t result;
  unsigned int v3;
  uint64_t v4;
  unsigned __int16 v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;

  result = 1;
  if (a1 <= 799)
  {
    if (a1 > 300)
    {
      if (a1 <= 560)
      {
        switch(a1)
        {
          case 301:
          case 311:
          case 312:
          case 313:
          case 314:
          case 321:
          case 322:
          case 331:
          case 332:
          case 333:
          case 334:
          case 335:
          case 336:
          case 337:
          case 341:
          case 342:
          case 351:
          case 352:
          case 353:
          case 354:
          case 361:
          case 371:
          case 372:
          case 373:
          case 374:
          case 375:
          case 381:
          case 391:
          case 392:
          case 393:
          case 394:
          case 395:
          case 401:
          case 402:
          case 403:
          case 404:
          case 405:
          case 406:
          case 407:
          case 408:
          case 409:
          case 411:
          case 412:
          case 413:
          case 414:
          case 415:
          case 416:
          case 417:
          case 421:
          case 422:
          case 423:
          case 424:
          case 425:
          case 426:
          case 427:
          case 431:
            return result;
          case 302:
          case 303:
          case 304:
          case 305:
          case 306:
          case 307:
          case 308:
          case 309:
          case 310:
          case 315:
          case 316:
          case 317:
          case 318:
          case 319:
          case 320:
          case 323:
          case 324:
          case 325:
          case 326:
          case 327:
          case 328:
          case 329:
          case 330:
          case 338:
          case 339:
          case 340:
          case 343:
          case 344:
          case 345:
          case 346:
          case 347:
          case 348:
          case 349:
          case 350:
          case 355:
          case 356:
          case 357:
          case 358:
          case 359:
          case 360:
          case 362:
          case 363:
          case 364:
          case 365:
          case 366:
          case 367:
          case 368:
          case 369:
          case 370:
          case 376:
          case 377:
          case 378:
          case 379:
          case 380:
          case 382:
          case 383:
          case 384:
          case 385:
          case 386:
          case 387:
          case 388:
          case 389:
          case 390:
          case 396:
          case 397:
          case 398:
          case 399:
          case 400:
          case 410:
          case 418:
          case 419:
          case 420:
          case 428:
          case 429:
          case 430:
            return 0;
          default:
            v12 = a1 - 501;
            if (v12 > 0x32)
              return 0;
            v4 = 1 << v12;
            v7 = -1070564349;
            goto LABEL_47;
        }
      }
      switch(a1)
      {
        case 561:
        case 562:
        case 563:
        case 564:
        case 565:
        case 566:
        case 567:
        case 568:
        case 569:
        case 570:
        case 571:
        case 581:
        case 582:
        case 583:
        case 584:
        case 585:
        case 586:
        case 587:
        case 588:
        case 589:
        case 591:
        case 592:
        case 593:
        case 601:
        case 602:
        case 603:
        case 604:
        case 605:
        case 611:
        case 621:
        case 631:
        case 641:
        case 642:
          return result;
        case 572:
        case 573:
        case 574:
        case 575:
        case 576:
        case 577:
        case 578:
        case 579:
        case 580:
        case 590:
        case 594:
        case 595:
        case 596:
        case 597:
        case 598:
        case 599:
        case 600:
        case 606:
        case 607:
        case 608:
        case 609:
        case 610:
        case 612:
        case 613:
        case 614:
        case 615:
        case 616:
        case 617:
        case 618:
        case 619:
        case 620:
        case 622:
        case 623:
        case 624:
        case 625:
        case 626:
        case 627:
        case 628:
        case 629:
        case 630:
        case 632:
        case 633:
        case 634:
        case 635:
        case 636:
        case 637:
        case 638:
        case 639:
        case 640:
          return 0;
        default:
          if ((a1 - 750) < 0xF)
            return result;
          v10 = a1 - 651;
          if (v10 > 0x36)
            return 0;
          v4 = 1 << v10;
          v9 = 0x7E000000000001;
          break;
      }
LABEL_52:
      if ((v4 & v9) != 0)
        return result;
      return 0;
    }
    if (a1 <= 99)
    {
      if (((a1 - 11) > 0x3C || ((1 << (a1 - 11)) & 0x100E0F806018020FLL) == 0)
        && a1 >= 2)
      {
        return 0;
      }
    }
    else
    {
      switch(a1)
      {
        case 100:
        case 101:
        case 102:
        case 103:
        case 104:
        case 105:
        case 106:
        case 107:
        case 108:
        case 109:
        case 110:
        case 120:
        case 130:
        case 150:
        case 151:
        case 152:
        case 153:
        case 154:
        case 155:
        case 156:
        case 157:
        case 158:
        case 159:
        case 160:
        case 161:
        case 162:
        case 163:
        case 164:
        case 165:
        case 166:
        case 167:
        case 168:
        case 169:
        case 170:
        case 171:
        case 180:
        case 181:
        case 182:
        case 190:
        case 191:
        case 200:
        case 201:
        case 210:
        case 211:
        case 212:
        case 213:
        case 214:
        case 215:
          return result;
        case 111:
        case 112:
        case 113:
        case 114:
        case 115:
        case 116:
        case 117:
        case 118:
        case 119:
        case 121:
        case 122:
        case 123:
        case 124:
        case 125:
        case 126:
        case 127:
        case 128:
        case 129:
        case 131:
        case 132:
        case 133:
        case 134:
        case 135:
        case 136:
        case 137:
        case 138:
        case 139:
        case 140:
        case 141:
        case 142:
        case 143:
        case 144:
        case 145:
        case 146:
        case 147:
        case 148:
        case 149:
        case 172:
        case 173:
        case 174:
        case 175:
        case 176:
        case 177:
        case 178:
        case 179:
        case 183:
        case 184:
        case 185:
        case 186:
        case 187:
        case 188:
        case 189:
        case 192:
        case 193:
        case 194:
        case 195:
        case 196:
        case 197:
        case 198:
        case 199:
        case 202:
        case 203:
        case 204:
        case 205:
        case 206:
        case 207:
        case 208:
        case 209:
          return 0;
        default:
          if ((a1 - 251) >= 8)
            return 0;
          break;
      }
    }
  }
  else if (a1 > 1289)
  {
    if (a1 > 1579)
    {
      if (a1 > 1719)
      {
        if (((a1 - 1720) > 0x3C || ((1 << (a1 + 72)) & 0x1004030040300403) == 0)
          && ((a1 - 1790) > 0x3C || ((1 << (a1 + 2)) & 0x1004010040100401) == 0))
        {
          v11 = a1 - 1860;
          if (v11 > 0x14 || ((1 << v11) & 0x100401) == 0)
            return 0;
        }
      }
      else if ((a1 - 1580) > 0x3C || ((1 << (a1 - 44)) & 0x101C030040F00401) == 0)
      {
        v8 = a1 - 1650;
        if (v8 > 0x3C)
          return 0;
        v4 = 1 << v8;
        v9 = 0x101C010040300401;
        goto LABEL_52;
      }
    }
    else if (a1 > 1489)
    {
      switch(a1)
      {
        case 1490:
        case 1491:
        case 1500:
        case 1510:
        case 1511:
        case 1512:
        case 1513:
        case 1520:
        case 1521:
        case 1530:
        case 1540:
        case 1541:
        case 1542:
        case 1543:
        case 1544:
        case 1545:
        case 1546:
        case 1547:
        case 1548:
        case 1549:
        case 1550:
        case 1551:
        case 1552:
        case 1553:
        case 1554:
        case 1555:
        case 1556:
        case 1557:
        case 1558:
        case 1559:
        case 1560:
        case 1570:
        case 1571:
          return result;
        default:
          return 0;
      }
    }
    else if (((a1 - 1290) > 0x3C || ((1 << (a1 - 10)) & 0x103C03FFC0100407) == 0)
           && ((a1 - 1360) > 0x3C || ((1 << (a1 - 80)) & 0x100C010040100401) == 0))
    {
      v3 = a1 - 1430;
      if (v3 > 0x32)
        return 0;
      v4 = 1 << v3;
      v5 = 3075;
      goto LABEL_23;
    }
  }
  else
  {
    if (a1 <= 1089)
    {
      switch(a1)
      {
        case 800:
        case 801:
        case 802:
        case 803:
        case 804:
        case 805:
        case 810:
        case 811:
        case 812:
        case 813:
        case 814:
        case 815:
        case 816:
        case 817:
        case 818:
        case 819:
        case 820:
        case 821:
        case 822:
        case 823:
        case 824:
        case 825:
        case 830:
        case 831:
        case 832:
        case 833:
        case 834:
        case 835:
        case 836:
        case 837:
        case 838:
        case 839:
        case 840:
        case 841:
        case 842:
        case 843:
        case 844:
        case 845:
        case 846:
        case 847:
        case 848:
        case 849:
        case 850:
        case 851:
        case 852:
        case 860:
        case 861:
        case 862:
        case 863:
        case 870:
        case 871:
        case 872:
        case 873:
        case 874:
        case 880:
        case 890:
        case 900:
        case 910:
        case 920:
        case 921:
        case 922:
        case 923:
        case 924:
        case 930:
        case 940:
        case 950:
        case 960:
        case 961:
        case 962:
        case 963:
        case 970:
          return result;
        case 806:
        case 807:
        case 808:
        case 809:
        case 826:
        case 827:
        case 828:
        case 829:
        case 853:
        case 854:
        case 855:
        case 856:
        case 857:
        case 858:
        case 859:
        case 864:
        case 865:
        case 866:
        case 867:
        case 868:
        case 869:
        case 875:
        case 876:
        case 877:
        case 878:
        case 879:
        case 881:
        case 882:
        case 883:
        case 884:
        case 885:
        case 886:
        case 887:
        case 888:
        case 889:
        case 891:
        case 892:
        case 893:
        case 894:
        case 895:
        case 896:
        case 897:
        case 898:
        case 899:
        case 901:
        case 902:
        case 903:
        case 904:
        case 905:
        case 906:
        case 907:
        case 908:
        case 909:
        case 911:
        case 912:
        case 913:
        case 914:
        case 915:
        case 916:
        case 917:
        case 918:
        case 919:
        case 925:
        case 926:
        case 927:
        case 928:
        case 929:
        case 931:
        case 932:
        case 933:
        case 934:
        case 935:
        case 936:
        case 937:
        case 938:
        case 939:
        case 941:
        case 942:
        case 943:
        case 944:
        case 945:
        case 946:
        case 947:
        case 948:
        case 949:
        case 951:
        case 952:
        case 953:
        case 954:
        case 955:
        case 956:
        case 957:
        case 958:
        case 959:
        case 964:
        case 965:
        case 966:
        case 967:
        case 968:
        case 969:
          return 0;
        default:
          v13 = a1 - 980;
          if (v13 > 0x3F)
            return 0;
          v4 = 1 << v13;
          v9 = 0xF004010040100401;
          goto LABEL_52;
      }
    }
    if (((a1 - 1150) > 0x3C || ((1 << (a1 - 126)) & 0x101C030040101C1FLL) == 0)
      && ((a1 - 1220) > 0x3C || ((1 << (a1 + 60)) & 0x10040701C0300C03) == 0))
    {
      v6 = a1 - 1090;
      if (v6 > 0x32)
        return 0;
      v4 = 1 << v6;
      v5 = 3073;
LABEL_23:
      v7 = v5 | 0x40100000;
LABEL_47:
      v9 = v7 | 0x4010000000000;
      goto LABEL_52;
    }
  }
  return result;
}

uint64_t TRIFactor_FactorType_IsValidValue(unsigned int a1)
{
  uint64_t result;
  unsigned int v3;

  result = 1;
  if (a1 > 0x10 || ((1 << a1) & 0x1FC01) == 0)
  {
    v3 = a1 - 100;
    if (v3 > 4 || ((1 << v3) & 0x13) == 0)
      return 0;
  }
  return result;
}

uint64_t TRIPBMaybeClearOneof(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  unsigned int v5;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v5 = a3;
  result = TRIPBGetHasOneof(a1, a3);
  if ((_DWORD)result != a4)
  {
    v9 = result;
    if ((_DWORD)result)
    {
      v10 = objc_msgSend(a2, "fieldWithNumber:", result);
      if (v10)
      {
        v11 = *(_QWORD *)(v10 + 8);
        if ((*(_WORD *)(v11 + 28) & 0xF02) != 0 || *(unsigned __int8 *)(v11 + 30) - 13 <= 3)
        {
          v12 = *(_QWORD *)(a1 + 64);
          v13 = *(unsigned int *)(v11 + 24);

          *(_QWORD *)(v12 + v13) = 0;
        }
      }
      else
      {
        v14 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void TRIPBMaybeClearOneof(TRIPBMessage *, TRIPBOneofDescriptor *, int32_t, uint32_t)"), CFSTR("TRIPBUtilities.m"), 342, CFSTR("%@: oneof set to something (%u) not in the oneof?"), objc_opt_class(), v9);
      }
      return TRIPBSetHasIvar(a1, v5, 1, 0);
    }
  }
  return result;
}

uint64_t TRIPBGetHasOneof(uint64_t a1, uint64_t a2)
{
  void *v5;

  if ((a2 & 0x80000000) == 0)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "uint32_t TRIPBGetHasOneof(TRIPBMessage *, int32_t)"), CFSTR("TRIPBUtilities.m"), 305, CFSTR("%@: invalid index (%d) for oneof."), objc_opt_class(), a2);
  }
  return *(unsigned int *)(*(_QWORD *)(a1 + 64) - 4 * (int)a2);
}

TRIPBAutocreatedArray *CreateArrayForField(_QWORD *a1, TRIPBMessage *a2)
{
  int v3;
  TRIPBAutocreatedArray *result;
  __objc2_class *v5;

  v3 = *(unsigned __int8 *)(a1[1] + 30);
  switch(*(_BYTE *)(a1[1] + 30))
  {
    case 0:
      v5 = TRIPBBoolArray;
      goto LABEL_14;
    case 1:
    case 0xB:
      v5 = TRIPBUInt32Array;
      goto LABEL_14;
    case 2:
    case 7:
    case 9:
      v5 = TRIPBInt32Array;
      goto LABEL_14;
    case 3:
      v5 = TRIPBFloatArray;
      goto LABEL_14;
    case 4:
    case 0xC:
      v5 = TRIPBUInt64Array;
      goto LABEL_14;
    case 5:
    case 8:
    case 0xA:
      v5 = TRIPBInt64Array;
      goto LABEL_14;
    case 6:
      v5 = TRIPBDoubleArray;
LABEL_14:
      result = (TRIPBAutocreatedArray *)objc_alloc_init(v5);
      if (a2)
        goto LABEL_15;
      return result;
    case 0xD:
    case 0xE:
    case 0xF:
    case 0x10:
      if (a2)
      {
        result = objc_alloc_init(TRIPBAutocreatedArray);
LABEL_16:
        result->_autocreator = a2;
      }
      else
      {
        result = (TRIPBAutocreatedArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      }
      break;
    case 0x11:
      result = -[TRIPBEnumArray initWithValidationFunction:]([TRIPBEnumArray alloc], "initWithValidationFunction:", objc_msgSend((id)objc_msgSend(a1, "enumDescriptor"), "enumVerifier"));
      if (!a2)
        return result;
      goto LABEL_15;
    default:
      result = 0;
      if (!a2)
        return result;
LABEL_15:
      if ((v3 - 13) <= 3)
        goto LABEL_16;
      result->_autocreator = a2;
      break;
  }
  return result;
}

TRIPBAutocreatedDictionary *GetOrCreateMapIvarWithField(_QWORD *a1, _QWORD *a2, int a3)
{
  uint64_t v6;
  TRIPBAutocreatedDictionary *MapForField;

  v6 = a1[8];
  if (!v6 || (MapForField = *(TRIPBAutocreatedDictionary **)(v6 + *(unsigned int *)(a2[1] + 24))) == 0)
  {
    MapForField = CreateMapForField(a2, 0);
    TRIPBSetRetainedObjectIvarWithFieldInternal(a1, (uint64_t)a2, MapForField, a3);
  }
  return MapForField;
}

TRIPBAutocreatedDictionary *CreateMapForField(_QWORD *a1, TRIPBMessage *a2)
{
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  TRIPBAutocreatedDictionary *result;
  __objc2_class *v11;
  uint64_t v12;
  __objc2_class *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = objc_msgSend(a1, "mapKeyDataType");
  v5 = *(unsigned __int8 *)(a1[1] + 30);
  switch(v4)
  {
    case 0:
      switch(*(_BYTE *)(a1[1] + 30))
      {
        case 0:
          v11 = TRIPBBoolBoolDictionary;
          goto LABEL_72;
        case 1:
        case 0xB:
          v11 = TRIPBBoolUInt32Dictionary;
          goto LABEL_72;
        case 2:
        case 7:
        case 9:
          v11 = TRIPBBoolInt32Dictionary;
          goto LABEL_72;
        case 3:
          v11 = TRIPBBoolFloatDictionary;
          goto LABEL_72;
        case 4:
        case 0xC:
          v11 = TRIPBBoolUInt64Dictionary;
          goto LABEL_72;
        case 5:
        case 8:
        case 0xA:
          v11 = TRIPBBoolInt64Dictionary;
          goto LABEL_72;
        case 6:
          v11 = TRIPBBoolDoubleDictionary;
          goto LABEL_72;
        case 0xD:
        case 0xE:
        case 0xF:
          v11 = TRIPBBoolObjectDictionary;
          goto LABEL_72;
        case 0x10:
          v17 = objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id CreateMapForField(TRIPBFieldDescriptor *, TRIPBMessage *)");
          v8 = (void *)v17;
          v9 = 307;
          goto LABEL_3;
        case 0x11:
          v13 = TRIPBBoolEnumDictionary;
          goto LABEL_80;
        default:
          goto LABEL_16;
      }
    case 1:
    case 11:
      switch(*(_BYTE *)(a1[1] + 30))
      {
        case 0:
          v11 = TRIPBUInt32BoolDictionary;
          goto LABEL_72;
        case 1:
        case 0xB:
          v11 = TRIPBUInt32UInt32Dictionary;
          goto LABEL_72;
        case 2:
        case 7:
        case 9:
          v11 = TRIPBUInt32Int32Dictionary;
          goto LABEL_72;
        case 3:
          v11 = TRIPBUInt32FloatDictionary;
          goto LABEL_72;
        case 4:
        case 0xC:
          v11 = TRIPBUInt32UInt64Dictionary;
          goto LABEL_72;
        case 5:
        case 8:
        case 0xA:
          v11 = TRIPBUInt32Int64Dictionary;
          goto LABEL_72;
        case 6:
          v11 = TRIPBUInt32DoubleDictionary;
          goto LABEL_72;
        case 0xD:
        case 0xE:
        case 0xF:
          v11 = TRIPBUInt32ObjectDictionary;
          goto LABEL_72;
        case 0x10:
          v15 = objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id CreateMapForField(TRIPBFieldDescriptor *, TRIPBMessage *)");
          v8 = (void *)v15;
          v9 = 351;
          goto LABEL_3;
        case 0x11:
          v13 = TRIPBUInt32EnumDictionary;
          goto LABEL_80;
        default:
          goto LABEL_16;
      }
    case 2:
    case 7:
    case 9:
      switch(*(_BYTE *)(a1[1] + 30))
      {
        case 0:
          v11 = TRIPBInt32BoolDictionary;
          goto LABEL_72;
        case 1:
        case 0xB:
          v11 = TRIPBInt32UInt32Dictionary;
          goto LABEL_72;
        case 2:
        case 7:
        case 9:
          v11 = TRIPBInt32Int32Dictionary;
          goto LABEL_72;
        case 3:
          v11 = TRIPBInt32FloatDictionary;
          goto LABEL_72;
        case 4:
        case 0xC:
          v11 = TRIPBInt32UInt64Dictionary;
          goto LABEL_72;
        case 5:
        case 8:
        case 0xA:
          v11 = TRIPBInt32Int64Dictionary;
          goto LABEL_72;
        case 6:
          v11 = TRIPBInt32DoubleDictionary;
          goto LABEL_72;
        case 0xD:
        case 0xE:
        case 0xF:
          v11 = TRIPBInt32ObjectDictionary;
          goto LABEL_72;
        case 0x10:
          v12 = objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id CreateMapForField(TRIPBFieldDescriptor *, TRIPBMessage *)");
          v8 = (void *)v12;
          v9 = 396;
          goto LABEL_3;
        case 0x11:
          v13 = TRIPBInt32EnumDictionary;
          goto LABEL_80;
        default:
          goto LABEL_16;
      }
    case 3:
    case 6:
    case 13:
    case 15:
    case 16:
    case 17:
      v6 = objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id CreateMapForField(TRIPBFieldDescriptor *, TRIPBMessage *)");
      v8 = (void *)v6;
      v9 = 543;
LABEL_3:
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("TRIPBMessage.m"), v9, CFSTR("shouldn't happen"));
      result = 0;
      break;
    case 4:
    case 12:
      switch(*(_BYTE *)(a1[1] + 30))
      {
        case 0:
          v11 = TRIPBUInt64BoolDictionary;
          goto LABEL_72;
        case 1:
        case 0xB:
          v11 = TRIPBUInt64UInt32Dictionary;
          goto LABEL_72;
        case 2:
        case 7:
        case 9:
          v11 = TRIPBUInt64Int32Dictionary;
          goto LABEL_72;
        case 3:
          v11 = TRIPBUInt64FloatDictionary;
          goto LABEL_72;
        case 4:
        case 0xC:
          v11 = TRIPBUInt64UInt64Dictionary;
          goto LABEL_72;
        case 5:
        case 8:
        case 0xA:
          v11 = TRIPBUInt64Int64Dictionary;
          goto LABEL_72;
        case 6:
          v11 = TRIPBUInt64DoubleDictionary;
          goto LABEL_72;
        case 0xD:
        case 0xE:
        case 0xF:
          v11 = TRIPBUInt64ObjectDictionary;
          goto LABEL_72;
        case 0x10:
          v16 = objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id CreateMapForField(TRIPBFieldDescriptor *, TRIPBMessage *)");
          v8 = (void *)v16;
          v9 = 440;
          goto LABEL_3;
        case 0x11:
          v13 = TRIPBUInt64EnumDictionary;
          goto LABEL_80;
        default:
          goto LABEL_16;
      }
    case 5:
    case 8:
    case 10:
      switch(*(_BYTE *)(a1[1] + 30))
      {
        case 0:
          v11 = TRIPBInt64BoolDictionary;
          goto LABEL_72;
        case 1:
        case 0xB:
          v11 = TRIPBInt64UInt32Dictionary;
          goto LABEL_72;
        case 2:
        case 7:
        case 9:
          v11 = TRIPBInt64Int32Dictionary;
          goto LABEL_72;
        case 3:
          v11 = TRIPBInt64FloatDictionary;
          goto LABEL_72;
        case 4:
        case 0xC:
          v11 = TRIPBInt64UInt64Dictionary;
          goto LABEL_72;
        case 5:
        case 8:
        case 0xA:
          v11 = TRIPBInt64Int64Dictionary;
          goto LABEL_72;
        case 6:
          v11 = TRIPBInt64DoubleDictionary;
          goto LABEL_72;
        case 0xD:
        case 0xE:
        case 0xF:
          v11 = TRIPBInt64ObjectDictionary;
          goto LABEL_72;
        case 0x10:
          v14 = objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id CreateMapForField(TRIPBFieldDescriptor *, TRIPBMessage *)");
          v8 = (void *)v14;
          v9 = 485;
          goto LABEL_3;
        case 0x11:
          v13 = TRIPBInt64EnumDictionary;
          goto LABEL_80;
        default:
          goto LABEL_16;
      }
    case 14:
      switch(*(_BYTE *)(a1[1] + 30))
      {
        case 0:
          v11 = TRIPBStringBoolDictionary;
          goto LABEL_72;
        case 1:
        case 0xB:
          v11 = TRIPBStringUInt32Dictionary;
          goto LABEL_72;
        case 2:
        case 7:
        case 9:
          v11 = TRIPBStringInt32Dictionary;
          goto LABEL_72;
        case 3:
          v11 = TRIPBStringFloatDictionary;
          goto LABEL_72;
        case 4:
        case 0xC:
          v11 = TRIPBStringUInt64Dictionary;
          goto LABEL_72;
        case 5:
        case 8:
        case 0xA:
          v11 = TRIPBStringInt64Dictionary;
          goto LABEL_72;
        case 6:
          v11 = TRIPBStringDoubleDictionary;
LABEL_72:
          result = (TRIPBAutocreatedDictionary *)objc_alloc_init(v11);
          if (a2)
            goto LABEL_73;
          return result;
        case 0xD:
        case 0xE:
        case 0xF:
          if (a2)
          {
            result = objc_alloc_init(TRIPBAutocreatedDictionary);
            goto LABEL_75;
          }
          result = (TRIPBAutocreatedDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
          break;
        case 0x10:
          v18 = objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id CreateMapForField(TRIPBFieldDescriptor *, TRIPBMessage *)");
          v8 = (void *)v18;
          v9 = 532;
          goto LABEL_3;
        case 0x11:
          v13 = TRIPBStringEnumDictionary;
LABEL_80:
          result = (TRIPBAutocreatedDictionary *)objc_msgSend([v13 alloc], "initWithValidationFunction:", objc_msgSend((id)objc_msgSend(a1, "enumDescriptor"), "enumVerifier"));
          if (a2)
            goto LABEL_73;
          return result;
        default:
          goto LABEL_16;
      }
      break;
    default:
LABEL_16:
      result = 0;
      if (a2)
      {
LABEL_73:
        if (v4 == 14 && (v5 - 13) <= 3)
LABEL_75:
          result->_autocreator = a2;
        else
          result->_autocreator = a2;
      }
      break;
  }
  return result;
}

void *TRIPBSetInt64IvarWithFieldInternal(_QWORD *a1, uint64_t a2, uint64_t a3, int a4)
{
  void *v8;
  _BOOL4 v9;

  v8 = *(void **)(a2 + 16);
  if (v8)
    TRIPBMaybeClearOneof((uint64_t)a1, v8, *(unsigned int *)(*(_QWORD *)(a2 + 8) + 20), *(_DWORD *)(*(_QWORD *)(a2 + 8) + 16));
  *(_QWORD *)(a1[8] + *(unsigned int *)(*(_QWORD *)(a2 + 8) + 24)) = a3;
  v9 = 1;
  if (!a3 && a4 != 2)
    v9 = *(_QWORD *)(a2 + 16) != 0;
  TRIPBSetHasIvar((uint64_t)a1, *(_DWORD *)(*(_QWORD *)(a2 + 8) + 20), *(_DWORD *)(*(_QWORD *)(a2 + 8) + 16), v9);
  return TRIPBBecomeVisibleToAutocreator(a1);
}

void *TRIPBSetBoolIvarWithFieldInternal(_QWORD *a1, uint64_t a2, int a3, int a4)
{
  void *v8;
  uint64_t v9;
  _BOOL4 v10;

  v9 = *(_QWORD *)(a2 + 8);
  v8 = *(void **)(a2 + 16);
  if (v8)
    TRIPBMaybeClearOneof((uint64_t)a1, v8, *(unsigned int *)(v9 + 20), *(_DWORD *)(v9 + 16));
  TRIPBSetHasIvar((uint64_t)a1, *(_DWORD *)(v9 + 24), *(_DWORD *)(v9 + 16), a3);
  v10 = 1;
  if (a4 != 2 && (a3 & 1) == 0)
    v10 = *(_QWORD *)(a2 + 16) != 0;
  TRIPBSetHasIvar((uint64_t)a1, *(_DWORD *)(*(_QWORD *)(a2 + 8) + 20), *(_DWORD *)(*(_QWORD *)(a2 + 8) + 16), v10);
  return TRIPBBecomeVisibleToAutocreator(a1);
}

void *TRIPBSetDoubleIvarWithFieldInternal(_QWORD *a1, uint64_t a2, int a3, double a4)
{
  void *v8;
  int v10;

  v8 = *(void **)(a2 + 16);
  if (v8)
    TRIPBMaybeClearOneof((uint64_t)a1, v8, *(unsigned int *)(*(_QWORD *)(a2 + 8) + 20), *(_DWORD *)(*(_QWORD *)(a2 + 8) + 16));
  *(double *)(a1[8] + *(unsigned int *)(*(_QWORD *)(a2 + 8) + 24)) = a4;
  v10 = a4 != 0.0 || a3 == 2 || *(_QWORD *)(a2 + 16) != 0;
  TRIPBSetHasIvar((uint64_t)a1, *(_DWORD *)(*(_QWORD *)(a2 + 8) + 20), *(_DWORD *)(*(_QWORD *)(a2 + 8) + 16), v10);
  return TRIPBBecomeVisibleToAutocreator(a1);
}

void sub_19214E3DC(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_19214E3FC(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x19214E3BCLL);
}

TRIPBFileDescriptor *TRITrifactorRoot_FileDescriptor()
{
  TRIPBFileDescriptor *result;

  result = (TRIPBFileDescriptor *)TRITrifactorRoot_FileDescriptor_descriptor;
  if (!TRITrifactorRoot_FileDescriptor_descriptor)
  {
    result = -[TRIPBFileDescriptor initWithPackage:objcPrefix:syntax:]([TRIPBFileDescriptor alloc], "initWithPackage:objcPrefix:syntax:", CFSTR("TRI"), CFSTR("TRI"), 2);
    TRITrifactorRoot_FileDescriptor_descriptor = (uint64_t)result;
  }
  return result;
}

TRIPBFileDescriptor *TRITrifactorTypesRoot_FileDescriptor()
{
  TRIPBFileDescriptor *result;

  result = (TRIPBFileDescriptor *)TRITrifactorTypesRoot_FileDescriptor_descriptor;
  if (!TRITrifactorTypesRoot_FileDescriptor_descriptor)
  {
    result = -[TRIPBFileDescriptor initWithPackage:objcPrefix:syntax:]([TRIPBFileDescriptor alloc], "initWithPackage:objcPrefix:syntax:", CFSTR("TRI"), CFSTR("TRI"), 2);
    TRITrifactorTypesRoot_FileDescriptor_descriptor = (uint64_t)result;
  }
  return result;
}

uint64_t TRISubjectReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  void *v18;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v17;

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

char *TRIPBMessageEncodingForSelector(const char *a1, BOOL a2)
{
  Protocol *Protocol;
  objc_method_description MethodDescription;
  BOOL v6;
  void *v8;
  void *v9;

  Protocol = objc_getProtocol("TRIPBMessageSignatureProtocol");
  if (!Protocol)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "const char *TRIPBMessageEncodingForSelector(SEL, BOOL)"), CFSTR("TRIPBUtilities.m"), 1491, CFSTR("Missing TRIPBMessageSignatureProtocol"));
  }
  MethodDescription = protocol_getMethodDescription(Protocol, a1, 0, a2);
  if (MethodDescription.name)
    v6 = MethodDescription.types == 0;
  else
    v6 = 1;
  if (v6)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "const char *TRIPBMessageEncodingForSelector(SEL, BOOL)"), CFSTR("TRIPBUtilities.m"), 1495, CFSTR("Missing method for selector %@"), NSStringFromSelector(a1));
  }
  return MethodDescription.types;
}

void TRIPBDictionaryReadEntry(void *a1, uint64_t *a2, uint64_t a3, _QWORD *a4, void *a5)
{
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t Tag;
  id *v15;
  uint64_t *v16;
  int v17;
  uint64_t v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;

  v10 = objc_msgSend(a4, "mapKeyDataType");
  v11 = *(unsigned __int8 *)(a4[1] + 30);
  v22 = 0;
  v23 = 0;
  if (v11 == 17)
    v22 = (__CFString *)objc_msgSend(a4, "defaultValue");
  v12 = TRIPBWireFormatForType_format[v10] | 8;
  v13 = TRIPBWireFormatForType_format[v11] | 0x10;
  while (1)
  {
    while (1)
    {
      Tag = TRIPBCodedInputStreamReadTag((uint64_t)(a2 + 1));
      if ((_DWORD)Tag == v12)
      {
        v15 = (id *)&v23;
        v16 = a2;
        v17 = v10;
        goto LABEL_8;
      }
      v18 = Tag;
      if ((_DWORD)Tag != v13)
        break;
      v15 = (id *)&v22;
      v16 = a2;
      v17 = v11;
LABEL_8:
      ReadValue(v16, v15, v17, a3, a4);
    }
    if (!(_DWORD)Tag)
      break;
    if ((objc_msgSend(a2, "skipField:", Tag) & 1) == 0)
      goto LABEL_32;
  }
  v19 = v23;
  if ((_DWORD)v10 == 14 && !v23)
  {
    v19 = &stru_1E2E9CC90;
    v23 = v19;
  }
  v20 = v22;
  if ((v11 - 13) > 3u || v22)
    goto LABEL_25;
  switch((_DWORD)v11)
  {
    case 0xD:
      v21 = (__CFString *)(id)TRIPBEmptyNSData();
LABEL_23:
      v20 = v21;
      v22 = v21;
      goto LABEL_25;
    case 0xF:
      v21 = (__CFString *)objc_alloc_init((Class)objc_msgSend(a4, "msgClass", v18));
      goto LABEL_23;
    case 0xE:
      v21 = &stru_1E2E9CC90;
      goto LABEL_23;
  }
  v20 = 0;
LABEL_25:
  if ((_DWORD)v10 == 14 && (v11 - 13) <= 3u)
  {
    objc_msgSend(a1, "setObject:forKey:", v20, v19);
    goto LABEL_34;
  }
  if ((_DWORD)v11 != 17
    || objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "descriptor", v18), "file"), "syntax") == 3
    || objc_msgSend(a4, "isValidEnumValue:", v20))
  {
    objc_msgSend(a1, "setTRIPBGenericValue:forTRIPBGenericValueKey:", &v22, &v23);
  }
  else
  {
    objc_msgSend(a5, "addUnknownMapEntry:value:", *(unsigned int *)(a4[1] + 16), objc_msgSend(a1, "serializedDataForUnknownValue:forKey:keyDataType:", v20, &v23, v10));
  }
LABEL_32:
  if ((v10 - 13) > 3u)
    goto LABEL_35;
  v19 = v23;
LABEL_34:

LABEL_35:
  if ((v11 - 13) <= 3u)

}

void ReadValue(uint64_t *a1, id *a2, int a3, uint64_t a4, void *a5)
{
  uint64_t v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t RawVarint64;
  uint64_t v12;
  int v13;
  uint64_t v14;
  void *v15;
  unsigned int v16;
  unint64_t v17;
  id v19;
  void *v20;

  switch(a3)
  {
    case 0:
      *(_BYTE *)a2 = ReadRawVarint64(a1 + 1) != 0;
      return;
    case 1:
    case 2:
      CheckSize((uint64_t)(a1 + 1), 4);
      v7 = a1[3];
      v8 = *(_DWORD *)(a1[1] + v7);
      a1[3] = v7 + 4;
      goto LABEL_10;
    case 3:
      CheckSize((uint64_t)(a1 + 1), 4);
      v12 = a1[3];
      v13 = *(_DWORD *)(a1[1] + v12);
      a1[3] = v12 + 4;
      *(_DWORD *)a2 = v13;
      return;
    case 4:
    case 5:
      CheckSize((uint64_t)(a1 + 1), 8);
      v9 = a1[3];
      v10 = *(void **)(a1[1] + v9);
      a1[3] = v9 + 8;
      goto LABEL_12;
    case 6:
      CheckSize((uint64_t)(a1 + 1), 8);
      v14 = a1[3];
      v15 = *(void **)(a1[1] + v14);
      a1[3] = v14 + 8;
      *a2 = v15;
      return;
    case 7:
    case 11:
    case 17:
      *(_DWORD *)a2 = ReadRawVarint64(a1 + 1);
      return;
    case 8:
    case 12:
      RawVarint64 = ReadRawVarint64(a1 + 1);
      goto LABEL_15;
    case 9:
      v16 = ReadRawVarint64(a1 + 1);
      v8 = -(v16 & 1) ^ (v16 >> 1);
LABEL_10:
      *(_DWORD *)a2 = v8;
      return;
    case 10:
      v17 = ReadRawVarint64(a1 + 1);
      v10 = (void *)(-(uint64_t)(v17 & 1) ^ (v17 >> 1));
LABEL_12:
      *a2 = v10;
      return;
    case 13:

      RawVarint64 = TRIPBCodedInputStreamReadRetainedBytes(a1 + 1);
      goto LABEL_15;
    case 14:

      RawVarint64 = (uint64_t)TRIPBCodedInputStreamReadRetainedString(a1 + 1);
LABEL_15:
      *a2 = (id)RawVarint64;
      break;
    case 15:
      v19 = objc_alloc_init((Class)objc_msgSend(a5, "msgClass"));
      objc_msgSend(a1, "readMessage:extensionRegistry:", v19, a4);

      *a2 = v19;
      break;
    case 16:
      v20 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void ReadValue(TRIPBCodedInputStream *, TRIPBGenericValue *, TRIPBDataType, TRIPBExtensionRegistry *, TRIPBFieldDescriptor *)"), CFSTR("TRIPBDictionary.m"), 445, CFSTR("Can't happen"));
      break;
    default:
      return;
  }
}

TRIPBFileDescriptor *TRITrinamespaceRoot_FileDescriptor()
{
  TRIPBFileDescriptor *result;

  result = (TRIPBFileDescriptor *)TRITrinamespaceRoot_FileDescriptor_descriptor;
  if (!TRITrinamespaceRoot_FileDescriptor_descriptor)
  {
    result = -[TRIPBFileDescriptor initWithPackage:objcPrefix:syntax:]([TRIPBFileDescriptor alloc], "initWithPackage:objcPrefix:syntax:", CFSTR("TRI"), CFSTR("TRI"), 2);
    TRITrinamespaceRoot_FileDescriptor_descriptor = (uint64_t)result;
  }
  return result;
}

TRIPBFileDescriptor *TRITriclientExperimentRoot_FileDescriptor()
{
  TRIPBFileDescriptor *result;

  result = (TRIPBFileDescriptor *)TRITriclientExperimentRoot_FileDescriptor_descriptor;
  if (!TRITriclientExperimentRoot_FileDescriptor_descriptor)
  {
    result = -[TRIPBFileDescriptor initWithPackage:objcPrefix:syntax:]([TRIPBFileDescriptor alloc], "initWithPackage:objcPrefix:syntax:", CFSTR("TRI"), CFSTR("TRI"), 2);
    TRITriclientExperimentRoot_FileDescriptor_descriptor = (uint64_t)result;
  }
  return result;
}

SEL SelFromStrings(char *__s, char *str, const char *a3, int a4)
{
  size_t v9;
  size_t v10;
  uint64_t v11;
  size_t v12;
  size_t v13;
  size_t v14;
  uint64_t v15;
  size_t v16;
  uint64_t v17;
  const char *v18;
  char *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  if (!__s && !a3 && (a4 & 1) == 0)
    return sel_getUid(str);
  if (__s)
    v9 = strlen(__s);
  else
    v9 = 0;
  v10 = strlen(str);
  v12 = v10;
  if (a3)
  {
    v10 = strlen(a3);
    v13 = v10;
  }
  else
  {
    v13 = 0;
  }
  v20[0] = v20;
  v14 = v12 + v9 + v13;
  v15 = 1;
  if (a4)
    v15 = 2;
  v16 = v14 + v15;
  MEMORY[0x1E0C80A78](v10, v11);
  v18 = (char *)v20 - v17;
  v19 = (char *)v20 - v17;
  if (!__s)
  {
    memcpy(v19, str, v12);
    if (!a3)
      goto LABEL_16;
    goto LABEL_15;
  }
  memcpy(v19, __s, v9);
  memcpy((void *)&v18[v9], str, v12);
  v18[v9] = __toupper(v18[v9]);
  if (a3)
LABEL_15:
    memcpy((void *)&v18[v9 + v12], a3, v13);
LABEL_16:
  if (a4)
    v18[v14] = 58;
  v18[v16 - 1] = 0;
  return sel_getUid(v18);
}

unint64_t TRINamespace_NamespaceId_EnumDescriptor()
{
  id v1;

  if (!atomic_load(&TRINamespace_NamespaceId_EnumDescriptor_descriptor))
  {
    v1 = +[TRIPBEnumDescriptor allocDescriptorForName:valueNames:values:count:enumVerifier:extraTextFormatInfo:](TRIPBEnumDescriptor, "allocDescriptorForName:valueNames:values:count:enumVerifier:extraTextFormatInfo:", CFSTR("TRINamespace_NamespaceId"), "UnknownNamespace", &TRINamespace_NamespaceId_EnumDescriptor_values, 432, TRINamespace_NamespaceId_IsValidValue, &unk_1921A85A0);
    while (!__ldaxr(&TRINamespace_NamespaceId_EnumDescriptor_descriptor))
    {
      if (!__stlxr((unint64_t)v1, &TRINamespace_NamespaceId_EnumDescriptor_descriptor))
        return atomic_load(&TRINamespace_NamespaceId_EnumDescriptor_descriptor);
    }
    __clrex();

  }
  return atomic_load(&TRINamespace_NamespaceId_EnumDescriptor_descriptor);
}

unint64_t TRIFactor_FactorType_EnumDescriptor()
{
  id v1;

  if (!atomic_load(&TRIFactor_FactorType_EnumDescriptor_descriptor))
  {
    v1 = +[TRIPBEnumDescriptor allocDescriptorForName:valueNames:values:count:enumVerifier:](TRIPBEnumDescriptor, "allocDescriptorForName:valueNames:values:count:enumVerifier:", CFSTR("TRIFactor_FactorType"), "Unknown", &TRIFactor_FactorType_EnumDescriptor_values, 11, TRIFactor_FactorType_IsValidValue);
    while (!__ldaxr(&TRIFactor_FactorType_EnumDescriptor_descriptor))
    {
      if (!__stlxr((unint64_t)v1, &TRIFactor_FactorType_EnumDescriptor_descriptor))
        return atomic_load(&TRIFactor_FactorType_EnumDescriptor_descriptor);
    }
    __clrex();

  }
  return atomic_load(&TRIFactor_FactorType_EnumDescriptor_descriptor);
}

uint64_t TRIPBDecodeTextFormatName(char *a1, int a2, void *a3)
{
  void *v3;
  int v6;
  int v7;
  int v8;
  char *v9;
  char *v10;
  char v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  char *v23;

  v3 = 0;
  if (a1 && a3)
  {
    v23 = a1;
    v6 = ReadRawVarint32FromData(&v23);
    if (v6 < 1)
    {
      return 0;
    }
    else
    {
      v7 = v6;
      while (1)
      {
        v8 = ReadRawVarint32FromData(&v23);
        v9 = v23;
        if (v8 == a2)
          break;
        v10 = v23 + 1;
        while (*v10++)
          ;
        v23 = v10;
        if (v7-- < 2)
          return 0;
      }
      if (*v23)
      {
        v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", objc_msgSend(a3, "length"));
        v14 = *v9;
        if (*v9)
        {
          v15 = 0;
          while (1)
          {
            if (v14 < 0)
            {
              objc_msgSend(v3, "appendString:", CFSTR("_"));
              v14 = *v9;
            }
            v16 = v14 & 0x1F;
            v17 = v14 & 0x60;
            if (v17 == 32)
              break;
            if (v17 == 64)
            {
              v18 = __toupper((char)objc_msgSend(a3, "characterAtIndex:", v15));
LABEL_21:
              objc_msgSend(v3, "appendFormat:", CFSTR("%c"), v18);
              ++v15;
              --v16;
            }
            if (v16 >= 1)
            {
              v19 = v16;
              v20 = v15;
              do
              {
                v21 = objc_msgSend(a3, "characterAtIndex:", v20);
                if (v17 == 96)
                  objc_msgSend(v3, "appendFormat:", CFSTR("%c"), __toupper((char)v21));
                else
                  objc_msgSend(v3, "appendFormat:", CFSTR("%C"), v21);
                ++v20;
                --v19;
              }
              while (v19);
            }
            v15 += v16;
            v22 = *++v9;
            v14 = v22;
            if (!v22)
              return (uint64_t)v3;
          }
          v18 = __tolower((char)objc_msgSend(a3, "characterAtIndex:", v15));
          goto LABEL_21;
        }
      }
      else
      {
        return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v23 + 1);
      }
    }
  }
  return (uint64_t)v3;
}

uint64_t ReadRawVarint32FromData(char **a1)
{
  char *v1;
  uint64_t v2;
  unsigned int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v9;
  uint64_t v10;
  int v11;

  v1 = *a1;
  v2 = *(*a1)++;
  if ((v2 & 0x80000000) != 0)
  {
    v3 = v2 & 0x7F;
    v4 = v1[1];
    *a1 = v1 + 2;
    v5 = v4 << 7;
    if ((v4 & 0x80000000) == 0)
      return v5 | v3;
    v3 |= v5 & 0x3F80;
    v6 = v1[2];
    *a1 = v1 + 3;
    v5 = v6 << 14;
    if ((v6 & 0x80000000) == 0)
      return v5 | v3;
    v3 |= v5 & 0x1FC000;
    v7 = v1[3];
    *a1 = v1 + 4;
    v5 = v7 << 21;
    if (v7 < 0)
    {
      v9 = v1[4];
      *a1 = v1 + 5;
      v2 = v5 & 0xFE00000 | (v9 << 28) | v3;
      if (v9 < 0)
      {
        v10 = 0;
        while (1)
        {
          v11 = v1[v10 + 5];
          *a1 = &v1[v10 + 6];
          if ((v11 & 0x80000000) == 0)
            break;
          if ((_DWORD)++v10 == 5)
          {
            objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2FF0], CFSTR("Unable to read varint32"));
            return v2;
          }
        }
      }
    }
    else
    {
      return v5 | v3;
    }
  }
  return v2;
}

void sub_1921513D8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t TRIPBGetMessageEnumField(void *a1, _QWORD *a2)
{
  int v4;
  uint64_t v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "descriptor"), "file"), "syntax");
  v5 = TRIPBGetMessageInt32Field((uint64_t)a1, a2);
  if (v4 == 3)
  {
    if (objc_msgSend(a2, "isValidEnumValue:", v5))
      return v5;
    else
      return 4222467823;
  }
  return v5;
}

uint64_t TRIPBGetMessageInt32Field(uint64_t a1, _QWORD *a2)
{
  if (TRIPBGetHasIvar(a1, *(_DWORD *)(a2[1] + 20), *(_DWORD *)(a2[1] + 16)))
    return *(unsigned int *)(*(_QWORD *)(a1 + 64) + *(unsigned int *)(a2[1] + 24));
  else
    return objc_msgSend(a2, "defaultValue");
}

BOOL TRIPBGetMessageBoolField(uint64_t a1, _QWORD *a2)
{
  if (TRIPBGetHasIvar(a1, *(_DWORD *)(a2[1] + 20), *(_DWORD *)(a2[1] + 16)))
    return TRIPBGetHasIvar(a1, *(_DWORD *)(a2[1] + 24), *(_DWORD *)(a2[1] + 16));
  else
    return objc_msgSend(a2, "defaultValue") & 1;
}

uint64_t TRIPBGetMessageInt64Field(uint64_t a1, _QWORD *a2)
{
  if (TRIPBGetHasIvar(a1, *(_DWORD *)(a2[1] + 20), *(_DWORD *)(a2[1] + 16)))
    return *(_QWORD *)(*(_QWORD *)(a1 + 64) + *(unsigned int *)(a2[1] + 24));
  else
    return objc_msgSend(a2, "defaultValue");
}

double TRIPBGetMessageDoubleField(uint64_t a1, _QWORD *a2)
{
  if (TRIPBGetHasIvar(a1, *(_DWORD *)(a2[1] + 20), *(_DWORD *)(a2[1] + 16)))
    return *(double *)(*(_QWORD *)(a1 + 64) + *(unsigned int *)(a2[1] + 24));
  else
    return COERCE_DOUBLE(objc_msgSend(a2, "defaultValue"));
}

BOOL TRIProject_ProjectId_IsValidValue(unsigned int a1)
{
  _BOOL8 result;

  result = 1;
  if (a1 - 230 >= 0x75 && a1 - 100 >= 0x26 && (a1 - 200 > 0x1A || ((1 << (a1 + 56)) & 0x7F00C03) == 0))
    return a1 < 5;
  return result;
}

void *TRIPBSetUInt64IvarWithFieldInternal(_QWORD *a1, uint64_t a2, uint64_t a3, int a4)
{
  void *v8;
  _BOOL4 v9;

  v8 = *(void **)(a2 + 16);
  if (v8)
    TRIPBMaybeClearOneof((uint64_t)a1, v8, *(unsigned int *)(*(_QWORD *)(a2 + 8) + 20), *(_DWORD *)(*(_QWORD *)(a2 + 8) + 16));
  *(_QWORD *)(a1[8] + *(unsigned int *)(*(_QWORD *)(a2 + 8) + 24)) = a3;
  v9 = 1;
  if (!a3 && a4 != 2)
    v9 = *(_QWORD *)(a2 + 16) != 0;
  TRIPBSetHasIvar((uint64_t)a1, *(_DWORD *)(*(_QWORD *)(a2 + 8) + 20), *(_DWORD *)(*(_QWORD *)(a2 + 8) + 16), v9);
  return TRIPBBecomeVisibleToAutocreator(a1);
}

void *TRIPBSetEnumIvarWithFieldInternal(_QWORD *a1, void *a2, uint64_t a3, int a4)
{
  if ((objc_msgSend(a2, "isValidEnumValue:") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@.%@: Attempt to set an unknown enum value (%d)"), objc_opt_class(), objc_msgSend(a2, "name"), a3);
  return TRIPBSetInt32IvarWithFieldInternal(a1, (uint64_t)a2, a3, a4);
}

uint64_t TRIPBSetAutocreatedRetainedObjectIvarWithField(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = *(_QWORD *)(result + 64);
  v5 = *(unsigned int *)(*(_QWORD *)(a2 + 8) + 24);
  if (*(_QWORD *)(v4 + v5))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    result = objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void TRIPBSetAutocreatedRetainedObjectIvarWithField(TRIPBMessage *, TRIPBFieldDescriptor *, id)"), CFSTR("TRIPBUtilities.m"), 467, CFSTR("Can't set autocreated object more than once."));
  }
  *(_QWORD *)(v4 + v5) = a3;
  return result;
}

void TRIPBPrepareReadOnlySemaphore(uint64_t a1)
{
  unint64_t *v1;
  NSObject *v3;

  v1 = (unint64_t *)(a1 + 56);
  if (!atomic_load((unint64_t *)(a1 + 56)))
  {
    v3 = dispatch_semaphore_create(1);
    while (!__ldaxr(v1))
    {
      if (!__stlxr((unint64_t)v3, v1))
        return;
    }
    __clrex();
    dispatch_release(v3);
  }
}

uint64_t TRIPBFieldTag(uint64_t a1)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(a1 + 8);
  if ((*(_WORD *)(v1 + 28) & 0xF04) != 0)
    v2 = 2;
  else
    v2 = TRIPBWireFormatForType_format[*(unsigned __int8 *)(v1 + 30)];
  return v2 | (8 * *(_DWORD *)(v1 + 16));
}

BOOL TRITrialExperimentFieldsReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 3)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 8;
LABEL_22:
        v19 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_24:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 16;
    goto LABEL_22;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t TRILogContextReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  uint64_t v24;
  void *v25;
  TRILogTime *v26;
  uint64_t v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 48) |= 2u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_42;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_44;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_42:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_44:
        *(_DWORD *)(a1 + 32) = v19;
        goto LABEL_49;
      case 2u:
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = *(void **)(a1 + 40);
        *(_QWORD *)(a1 + 40) = v24;

        goto LABEL_49;
      case 3u:
        v26 = objc_alloc_init(TRILogTime);
        v27 = 16;
        goto LABEL_31;
      case 4u:
        v26 = objc_alloc_init(TRILogTime);
        v27 = 24;
LABEL_31:
        objc_storeStrong((id *)(a1 + v27), v26);
        if (PBReaderPlaceMark() && (TRILogTimeReadFrom((uint64_t)v26, a2) & 1) != 0)
        {
          PBReaderRecallMark();

LABEL_49:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 5u:
        v28 = 0;
        v29 = 0;
        v30 = 0;
        *(_BYTE *)(a1 + 48) |= 1u;
        while (2)
        {
          v31 = *v3;
          v32 = *(_QWORD *)(a2 + v31);
          if (v32 == -1 || v32 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v33 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v32);
            *(_QWORD *)(a2 + v31) = v32 + 1;
            v30 |= (unint64_t)(v33 & 0x7F) << v28;
            if (v33 < 0)
            {
              v28 += 7;
              v14 = v29++ >= 9;
              if (v14)
              {
                v30 = 0;
                goto LABEL_48;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v30 = 0;
LABEL_48:
        *(_QWORD *)(a1 + 8) = v30;
        goto LABEL_49;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_49;
    }
  }
}

unint64_t TRICloudKitSupport_Container_EnumDescriptor()
{
  id v1;

  if (!atomic_load(&TRICloudKitSupport_Container_EnumDescriptor_descriptor))
  {
    v1 = +[TRIPBEnumDescriptor allocDescriptorForName:valueNames:values:count:enumVerifier:](TRIPBEnumDescriptor, "allocDescriptorForName:valueNames:values:count:enumVerifier:", CFSTR("TRICloudKitSupport_Container"), "UnknownContainer", &TRICloudKitSupport_Container_EnumDescriptor_values, 3, TRICloudKitSupport_Container_IsValidValue);
    while (!__ldaxr(&TRICloudKitSupport_Container_EnumDescriptor_descriptor))
    {
      if (!__stlxr((unint64_t)v1, &TRICloudKitSupport_Container_EnumDescriptor_descriptor))
        return atomic_load(&TRICloudKitSupport_Container_EnumDescriptor_descriptor);
    }
    __clrex();

  }
  return atomic_load(&TRICloudKitSupport_Container_EnumDescriptor_descriptor);
}

BOOL TRICloudKitSupport_Container_IsValidValue(unsigned int a1)
{
  return a1 < 3;
}

unint64_t TRICloudKitSupport_NotificationPriority_EnumDescriptor()
{
  id v1;

  if (!atomic_load(&TRICloudKitSupport_NotificationPriority_EnumDescriptor_descriptor))
  {
    v1 = +[TRIPBEnumDescriptor allocDescriptorForName:valueNames:values:count:enumVerifier:](TRIPBEnumDescriptor, "allocDescriptorForName:valueNames:values:count:enumVerifier:", CFSTR("TRICloudKitSupport_NotificationPriority"), "Default", &TRICloudKitSupport_NotificationPriority_EnumDescriptor_values, 3, TRICloudKitSupport_NotificationPriority_IsValidValue);
    while (!__ldaxr(&TRICloudKitSupport_NotificationPriority_EnumDescriptor_descriptor))
    {
      if (!__stlxr((unint64_t)v1, &TRICloudKitSupport_NotificationPriority_EnumDescriptor_descriptor))
        return atomic_load(&TRICloudKitSupport_NotificationPriority_EnumDescriptor_descriptor);
    }
    __clrex();

  }
  return atomic_load(&TRICloudKitSupport_NotificationPriority_EnumDescriptor_descriptor);
}

BOOL TRICloudKitSupport_NotificationPriority_IsValidValue(unsigned int a1)
{
  return a1 < 3;
}

unint64_t TRICloudKitSupport_NotificationStatus_EnumDescriptor()
{
  id v1;

  if (!atomic_load(&TRICloudKitSupport_NotificationStatus_EnumDescriptor_descriptor))
  {
    v1 = +[TRIPBEnumDescriptor allocDescriptorForName:valueNames:values:count:enumVerifier:](TRIPBEnumDescriptor, "allocDescriptorForName:valueNames:values:count:enumVerifier:", CFSTR("TRICloudKitSupport_NotificationStatus"), "Inactive", &TRICloudKitSupport_NotificationStatus_EnumDescriptor_values, 2, TRICloudKitSupport_NotificationStatus_IsValidValue);
    while (!__ldaxr(&TRICloudKitSupport_NotificationStatus_EnumDescriptor_descriptor))
    {
      if (!__stlxr((unint64_t)v1, &TRICloudKitSupport_NotificationStatus_EnumDescriptor_descriptor))
        return atomic_load(&TRICloudKitSupport_NotificationStatus_EnumDescriptor_descriptor);
    }
    __clrex();

  }
  return atomic_load(&TRICloudKitSupport_NotificationStatus_EnumDescriptor_descriptor);
}

BOOL TRICloudKitSupport_NotificationStatus_IsValidValue(unsigned int a1)
{
  return a1 < 2;
}

unint64_t TRICloudKitSupport_NotificationType_EnumDescriptor()
{
  id v1;

  if (!atomic_load(&TRICloudKitSupport_NotificationType_EnumDescriptor_descriptor))
  {
    v1 = +[TRIPBEnumDescriptor allocDescriptorForName:valueNames:values:count:enumVerifier:](TRIPBEnumDescriptor, "allocDescriptorForName:valueNames:values:count:enumVerifier:", CFSTR("TRICloudKitSupport_NotificationType"), "Unknown", &TRICloudKitSupport_NotificationType_EnumDescriptor_values, 8, TRICloudKitSupport_NotificationType_IsValidValue);
    while (!__ldaxr(&TRICloudKitSupport_NotificationType_EnumDescriptor_descriptor))
    {
      if (!__stlxr((unint64_t)v1, &TRICloudKitSupport_NotificationType_EnumDescriptor_descriptor))
        return atomic_load(&TRICloudKitSupport_NotificationType_EnumDescriptor_descriptor);
    }
    __clrex();

  }
  return atomic_load(&TRICloudKitSupport_NotificationType_EnumDescriptor_descriptor);
}

BOOL TRICloudKitSupport_NotificationType_IsValidValue(unsigned int a1)
{
  return a1 < 6;
}

unint64_t TRICloudKitSupport_CloudKitEnvironment_EnumDescriptor()
{
  id v1;

  if (!atomic_load(&TRICloudKitSupport_CloudKitEnvironment_EnumDescriptor_descriptor))
  {
    v1 = +[TRIPBEnumDescriptor allocDescriptorForName:valueNames:values:count:enumVerifier:](TRIPBEnumDescriptor, "allocDescriptorForName:valueNames:values:count:enumVerifier:", CFSTR("TRICloudKitSupport_CloudKitEnvironment"), "UnknownEnvironment", &TRICloudKitSupport_CloudKitEnvironment_EnumDescriptor_values, 3, TRICloudKitSupport_CloudKitEnvironment_IsValidValue);
    while (!__ldaxr(&TRICloudKitSupport_CloudKitEnvironment_EnumDescriptor_descriptor))
    {
      if (!__stlxr((unint64_t)v1, &TRICloudKitSupport_CloudKitEnvironment_EnumDescriptor_descriptor))
        return atomic_load(&TRICloudKitSupport_CloudKitEnvironment_EnumDescriptor_descriptor);
    }
    __clrex();

  }
  return atomic_load(&TRICloudKitSupport_CloudKitEnvironment_EnumDescriptor_descriptor);
}

BOOL TRICloudKitSupport_CloudKitEnvironment_IsValidValue(unsigned int a1)
{
  return a1 < 3;
}

void TRIPBExtensionMergeFromInputStream(_QWORD *a1, int a2, uint64_t *a3, uint64_t a4, void *a5)
{
  uint64_t v9;
  int RawVarint64;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  __CFString *v14;
  void *v15;
  void *v16;
  __CFString *v17;

  v9 = a1[1];
  if (a2)
  {
    if ((*(_BYTE *)(v9 + 45) & 1) == 0)
    {
      v16 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void TRIPBExtensionMergeFromInputStream(TRIPBExtensionDescriptor *, BOOL, TRIPBCodedInputStream *, TRIPBExtensionRegistry *, TRIPBMessage *)"), CFSTR("TRIPBExtensionInternals.m"), 282, CFSTR("How was it packed if it isn't repeated?"));
    }
    RawVarint64 = ReadRawVarint64(a3 + 1);
    v11 = a3[3];
    v12 = a3[4];
    v13 = v11 + RawVarint64;
    if (v13 > v12)
    {
      RaiseException(-102, 0);
      v11 = a3[3];
    }
    a3[4] = v13;
    if (v13 != v11)
    {
      do
      {
        v14 = (__CFString *)NewSingleValueFromInputStream(a1, a3, a4, 0);
        objc_msgSend(a5, "addExtension:value:", a1, v14);

      }
      while (a3[4] != a3[3]);
    }
    a3[4] = v12;
  }
  else
  {
    if ((*(_BYTE *)(v9 + 45) & 1) != 0)
    {
      v17 = (__CFString *)NewSingleValueFromInputStream(a1, a3, a4, 0);
      objc_msgSend(a5, "addExtension:value:", a1);
    }
    else
    {
      if (*(unsigned __int8 *)(v9 + 44) - 15 > 1)
        v15 = 0;
      else
        v15 = (void *)objc_msgSend(a5, "getExistingExtension:", a1);
      v17 = (__CFString *)NewSingleValueFromInputStream(a1, a3, a4, v15);
      objc_msgSend(a5, "setExtension:value:", a1);
    }

  }
}

const __CFString *NewSingleValueFromInputStream(_QWORD *a1, uint64_t *a2, uint64_t a3, void *a4)
{
  uint64_t v4;
  uint64_t *v6;
  id v7;
  uint64_t RawVarint64;
  void *v9;
  id v11;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  double v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  unint64_t v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  double v36;
  id v37;
  unsigned int v38;
  id v39;

  v4 = a1[1];
  v6 = a2 + 1;
  switch(*(_BYTE *)(v4 + 44))
  {
    case 0:
      return (const __CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", ReadRawVarint64(v6) != 0);
    case 1:
      v13 = objc_alloc(MEMORY[0x1E0CB37E8]);
      CheckSize((uint64_t)v6, 4);
      v14 = a2[3];
      v15 = *(unsigned int *)(a2[1] + v14);
      a2[3] = v14 + 4;
      v16 = v13;
      return (const __CFString *)objc_msgSend(v16, "initWithUnsignedInt:", v15);
    case 2:
      v17 = objc_alloc(MEMORY[0x1E0CB37E8]);
      CheckSize((uint64_t)v6, 4);
      v18 = a2[3];
      RawVarint64 = *(unsigned int *)(a2[1] + v18);
      a2[3] = v18 + 4;
      v9 = v17;
      return (const __CFString *)objc_msgSend(v9, "initWithInt:", RawVarint64);
    case 3:
      v19 = objc_alloc(MEMORY[0x1E0CB37E8]);
      CheckSize((uint64_t)v6, 4);
      v20 = a2[3];
      LODWORD(v21) = *(_DWORD *)(a2[1] + v20);
      a2[3] = v20 + 4;
      return (const __CFString *)objc_msgSend(v19, "initWithFloat:", v21);
    case 4:
      v22 = objc_alloc(MEMORY[0x1E0CB37E8]);
      CheckSize((uint64_t)v6, 8);
      v23 = a2[3];
      v24 = *(_QWORD *)(a2[1] + v23);
      a2[3] = v23 + 8;
      v25 = v22;
      return (const __CFString *)objc_msgSend(v25, "initWithUnsignedLongLong:", v24);
    case 5:
      v26 = objc_alloc(MEMORY[0x1E0CB37E8]);
      CheckSize((uint64_t)v6, 8);
      v27 = a2[3];
      v28 = *(_QWORD *)(a2[1] + v27);
      a2[3] = v27 + 8;
      v29 = v26;
      return (const __CFString *)objc_msgSend(v29, "initWithLongLong:", v28);
    case 6:
      v34 = objc_alloc(MEMORY[0x1E0CB37E8]);
      CheckSize((uint64_t)v6, 8);
      v35 = a2[3];
      v36 = *(double *)(a2[1] + v35);
      a2[3] = v35 + 8;
      return (const __CFString *)objc_msgSend(v34, "initWithDouble:", v36);
    case 7:
    case 0x11:
      v7 = objc_alloc(MEMORY[0x1E0CB37E8]);
      RawVarint64 = ReadRawVarint64(v6);
      v9 = v7;
      return (const __CFString *)objc_msgSend(v9, "initWithInt:", RawVarint64);
    case 8:
      v30 = objc_alloc(MEMORY[0x1E0CB37E8]);
      v28 = ReadRawVarint64(v6);
      goto LABEL_13;
    case 9:
      v37 = objc_alloc(MEMORY[0x1E0CB37E8]);
      v38 = ReadRawVarint64(v6);
      RawVarint64 = -(v38 & 1) ^ (v38 >> 1);
      v9 = v37;
      return (const __CFString *)objc_msgSend(v9, "initWithInt:", RawVarint64);
    case 0xA:
      v30 = objc_alloc(MEMORY[0x1E0CB37E8]);
      v31 = ReadRawVarint64(v6);
      v28 = -(uint64_t)(v31 & 1) ^ (v31 >> 1);
LABEL_13:
      v29 = v30;
      return (const __CFString *)objc_msgSend(v29, "initWithLongLong:", v28);
    case 0xB:
      v32 = objc_alloc(MEMORY[0x1E0CB37E8]);
      v15 = ReadRawVarint64(v6);
      v16 = v32;
      return (const __CFString *)objc_msgSend(v16, "initWithUnsignedInt:", v15);
    case 0xC:
      v39 = objc_alloc(MEMORY[0x1E0CB37E8]);
      v24 = ReadRawVarint64(v6);
      v25 = v39;
      return (const __CFString *)objc_msgSend(v25, "initWithUnsignedLongLong:", v24);
    case 0xD:
      return (const __CFString *)TRIPBCodedInputStreamReadRetainedBytes(a2 + 1);
    case 0xE:
      return TRIPBCodedInputStreamReadRetainedString(a2 + 1);
    case 0xF:
    case 0x10:
      if (a4)
        v11 = a4;
      else
        v11 = objc_alloc_init((Class)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "msgClass"), "descriptor"), "messageClass"));
      v33 = v11;
      if (*(_BYTE *)(v4 + 44) == 16)
      {
        objc_msgSend(a2, "readGroup:message:extensionRegistry:", *(unsigned int *)(v4 + 40), v11, a3);
      }
      else if ((*(_BYTE *)(v4 + 45) & 4) != 0)
      {
        objc_msgSend(v11, "mergeFromCodedInputStream:extensionRegistry:", a2, a3);
      }
      else
      {
        objc_msgSend(a2, "readMessage:extensionRegistry:", v11, a3);
      }
      return (const __CFString *)v33;
    default:
      return 0;
  }
}

void *TRIPBWriteExtensionValueToOutputStream(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *result;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  void *v19;
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
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 8);
  if ((*(_BYTE *)(v5 + 45) & 1) == 0)
    return WriteObjectIncludingTagToCodedOutputStream(a2, v5, a3);
  if ((*(_BYTE *)(v5 + 45) & 2) != 0)
  {
    objc_msgSend(a3, "writeTag:format:", *(unsigned int *)(v5 + 40), 2);
    v10 = *(char *)(v5 + 44);
    if (v10 > 6)
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v13 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (v13)
      {
        v14 = v13;
        v12 = 0;
        v15 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v25 != v15)
              objc_enumerationMutation(a2);
            v12 += ComputePBSerializedSizeNoTagOfObject(*(unsigned __int8 *)(v5 + 44), *(void **)(*((_QWORD *)&v24 + 1) + 8 * i));
          }
          v14 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        }
        while (v14);
      }
      else
      {
        v12 = 0;
      }
    }
    else
    {
      v11 = qword_1921A42A0[v10];
      v12 = objc_msgSend(a2, "count") * v11;
    }
    objc_msgSend(a3, "writeRawVarintSizeTAs32:", v12);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    result = (void *)objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v20, &v28, 16);
    if (result)
    {
      v17 = result;
      v18 = *(_QWORD *)v21;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v21 != v18)
            objc_enumerationMutation(a2);
          switch(*(_BYTE *)(v5 + 44))
          {
            case 0:
              objc_msgSend(a3, "writeBoolNoTag:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "BOOLValue"));
              break;
            case 1:
              objc_msgSend(a3, "writeFixed32NoTag:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "unsignedIntValue"));
              break;
            case 2:
              objc_msgSend(a3, "writeSFixed32NoTag:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "intValue"));
              break;
            case 3:
              objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "floatValue");
              objc_msgSend(a3, "writeFloatNoTag:");
              break;
            case 4:
              objc_msgSend(a3, "writeFixed64NoTag:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "unsignedLongLongValue"));
              break;
            case 5:
              objc_msgSend(a3, "writeSFixed64NoTag:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "longLongValue"));
              break;
            case 6:
              objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "doubleValue");
              objc_msgSend(a3, "writeDoubleNoTag:");
              break;
            case 7:
              objc_msgSend(a3, "writeInt32NoTag:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "intValue"));
              break;
            case 8:
              objc_msgSend(a3, "writeInt64NoTag:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "longLongValue"));
              break;
            case 9:
              objc_msgSend(a3, "writeSInt32NoTag:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "intValue"));
              break;
            case 0xA:
              objc_msgSend(a3, "writeSInt64NoTag:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "longLongValue"));
              break;
            case 0xB:
              objc_msgSend(a3, "writeUInt32NoTag:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "unsignedIntValue"));
              break;
            case 0xC:
              objc_msgSend(a3, "writeUInt64NoTag:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "unsignedLongLongValue"));
              break;
            case 0xD:
              objc_msgSend(a3, "writeBytesNoTag:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19));
              break;
            case 0xE:
              objc_msgSend(a3, "writeStringNoTag:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19));
              break;
            case 0xF:
              objc_msgSend(a3, "writeMessageNoTag:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19));
              break;
            case 0x10:
              objc_msgSend(a3, "writeGroupNoTag:value:", *(unsigned int *)(v5 + 40), *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19));
              break;
            case 0x11:
              objc_msgSend(a3, "writeEnumNoTag:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "intValue"));
              break;
            default:
              break;
          }
          v19 = (char *)v19 + 1;
        }
        while (v17 != v19);
        result = (void *)objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v20, &v28, 16);
        v17 = result;
      }
      while (result);
    }
  }
  else
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    result = (void *)objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (result)
    {
      v7 = result;
      v8 = *(_QWORD *)v29;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v29 != v8)
            objc_enumerationMutation(a2);
          WriteObjectIncludingTagToCodedOutputStream(*(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v9), v5, a3);
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        result = (void *)objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        v7 = result;
      }
      while (result);
    }
  }
  return result;
}

void *WriteObjectIncludingTagToCodedOutputStream(void *result, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  switch(*(_BYTE *)(a2 + 44))
  {
    case 0:
      result = (void *)objc_msgSend(a3, "writeBool:value:", *(unsigned int *)(a2 + 40), objc_msgSend(result, "BOOLValue"));
      break;
    case 1:
      result = (void *)objc_msgSend(a3, "writeFixed32:value:", *(unsigned int *)(a2 + 40), objc_msgSend(result, "unsignedIntValue"));
      break;
    case 2:
      result = (void *)objc_msgSend(a3, "writeSFixed32:value:", *(unsigned int *)(a2 + 40), objc_msgSend(result, "intValue"));
      break;
    case 3:
      v4 = *(unsigned int *)(a2 + 40);
      objc_msgSend(result, "floatValue");
      result = (void *)objc_msgSend(a3, "writeFloat:value:", v4);
      break;
    case 4:
      result = (void *)objc_msgSend(a3, "writeFixed64:value:", *(unsigned int *)(a2 + 40), objc_msgSend(result, "unsignedLongLongValue"));
      break;
    case 5:
      result = (void *)objc_msgSend(a3, "writeSFixed64:value:", *(unsigned int *)(a2 + 40), objc_msgSend(result, "longLongValue"));
      break;
    case 6:
      v5 = *(unsigned int *)(a2 + 40);
      objc_msgSend(result, "doubleValue");
      result = (void *)objc_msgSend(a3, "writeDouble:value:", v5);
      break;
    case 7:
      result = (void *)objc_msgSend(a3, "writeInt32:value:", *(unsigned int *)(a2 + 40), objc_msgSend(result, "intValue"));
      break;
    case 8:
      result = (void *)objc_msgSend(a3, "writeInt64:value:", *(unsigned int *)(a2 + 40), objc_msgSend(result, "longLongValue"));
      break;
    case 9:
      result = (void *)objc_msgSend(a3, "writeSInt32:value:", *(unsigned int *)(a2 + 40), objc_msgSend(result, "intValue"));
      break;
    case 0xA:
      result = (void *)objc_msgSend(a3, "writeSInt64:value:", *(unsigned int *)(a2 + 40), objc_msgSend(result, "longLongValue"));
      break;
    case 0xB:
      result = (void *)objc_msgSend(a3, "writeUInt32:value:", *(unsigned int *)(a2 + 40), objc_msgSend(result, "unsignedIntValue"));
      break;
    case 0xC:
      result = (void *)objc_msgSend(a3, "writeUInt64:value:", *(unsigned int *)(a2 + 40), objc_msgSend(result, "unsignedLongLongValue"));
      break;
    case 0xD:
      result = (void *)objc_msgSend(a3, "writeBytes:value:", *(unsigned int *)(a2 + 40), result);
      break;
    case 0xE:
      result = (void *)objc_msgSend(a3, "writeString:value:", *(unsigned int *)(a2 + 40), result);
      break;
    case 0xF:
      v6 = *(unsigned int *)(a2 + 40);
      if ((*(_BYTE *)(a2 + 45) & 4) != 0)
        result = (void *)objc_msgSend(a3, "writeMessageSetExtension:value:", v6, result);
      else
        result = (void *)objc_msgSend(a3, "writeMessage:value:", v6, result);
      break;
    case 0x10:
      result = (void *)objc_msgSend(a3, "writeGroup:value:", *(unsigned int *)(a2 + 40), result);
      break;
    case 0x11:
      result = (void *)objc_msgSend(a3, "writeEnum:value:", *(unsigned int *)(a2 + 40), objc_msgSend(result, "intValue"));
      break;
    default:
      return result;
  }
  return result;
}

uint64_t TRIPBComputeExtensionSerializedSizeIncludingTag(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 8);
  if ((*(_BYTE *)(v3 + 45) & 1) == 0)
    return ComputeSerializedSizeIncludingTagOfObject(*(_QWORD *)(a1 + 8), a2);
  if ((*(_BYTE *)(v3 + 45) & 2) != 0)
  {
    v10 = *(char *)(v3 + 44);
    if (v10 > 6)
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v13 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v13)
      {
        v14 = v13;
        v12 = 0;
        v15 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v26 != v15)
              objc_enumerationMutation(a2);
            v12 += ComputePBSerializedSizeNoTagOfObject(*(unsigned __int8 *)(v3 + 44), *(void **)(*((_QWORD *)&v25 + 1) + 8 * i));
          }
          v14 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v14);
      }
      else
      {
        v12 = 0;
      }
    }
    else
    {
      v11 = qword_1921A42A0[v10];
      v12 = objc_msgSend(a2, "count") * v11;
    }
    v17 = 8 * *(_DWORD *)(v3 + 40);
    if (v17 >= 0x80)
    {
      if (v17 >= 0x4000)
      {
        v19 = 4;
        if (v17 >> 28)
          v19 = 5;
        if (v17 >= 0x200000)
          v18 = v19;
        else
          v18 = 3;
      }
      else
      {
        v18 = 2;
      }
    }
    else
    {
      v18 = 1;
    }
    v20 = v18 + v12;
    v21 = 1;
    v22 = 2;
    v23 = 3;
    v24 = 4;
    if (v12 >> 28)
      v24 = 5;
    if (v12 >= 0x200000)
      v23 = v24;
    if (v12 >= 0x4000)
      v22 = v23;
    if (v12 >= 0x80)
      v21 = v22;
    return v20 + v21;
  }
  else
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v5 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v6; ++j)
        {
          if (*(_QWORD *)v26 != v8)
            objc_enumerationMutation(a2);
          v7 += ComputeSerializedSizeIncludingTagOfObject(v3, *(void **)(*((_QWORD *)&v25 + 1) + 8 * j));
        }
        v6 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v6);
    }
    else
    {
      return 0;
    }
  }
  return v7;
}

uint64_t ComputeSerializedSizeIncludingTagOfObject(uint64_t result, void *a2)
{
  int v2;
  unsigned int v3;
  int v4;
  int v5;
  int v6;
  unint64_t v7;
  char v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;

  switch(*(_BYTE *)(result + 44))
  {
    case 0:
      v2 = *(_DWORD *)(result + 40);
      objc_msgSend(a2, "BOOLValue");
      v3 = 8 * v2;
      if ((8 * v2) < 0x80)
        return 2;
      if (v3 < 0x4000)
        return 3;
      if (v3 >= 0x200000)
      {
        v20 = v3 >> 28 == 0;
        v21 = 5;
        goto LABEL_62;
      }
      return 4;
    case 1:
      v4 = *(_DWORD *)(result + 40);
      objc_msgSend(a2, "unsignedIntValue");
      goto LABEL_17;
    case 2:
      v4 = *(_DWORD *)(result + 40);
      objc_msgSend(a2, "intValue");
      goto LABEL_17;
    case 3:
      v4 = *(_DWORD *)(result + 40);
      objc_msgSend(a2, "floatValue");
LABEL_17:
      v12 = 8 * v4;
      if ((8 * v4) < 0x80)
        return 5;
      if (v12 < 0x4000)
        return 6;
      if (v12 < 0x200000)
        return 7;
      v20 = v12 >> 28 == 0;
      v21 = 8;
      goto LABEL_62;
    case 4:
      v5 = *(_DWORD *)(result + 40);
      objc_msgSend(a2, "unsignedLongLongValue");
      goto LABEL_23;
    case 5:
      v5 = *(_DWORD *)(result + 40);
      objc_msgSend(a2, "longLongValue");
      goto LABEL_23;
    case 6:
      v5 = *(_DWORD *)(result + 40);
      objc_msgSend(a2, "doubleValue");
LABEL_23:
      v13 = 8 * v5;
      if ((8 * v5) < 0x80)
        return 9;
      if (v13 < 0x4000)
        return 10;
      if (v13 < 0x200000)
        return 11;
      v20 = v13 >> 28 == 0;
      v21 = 12;
LABEL_62:
      if (v20)
        return v21;
      else
        return v21 + 1;
    case 7:
      return TRIPBComputeInt32Size(*(_DWORD *)(result + 40), objc_msgSend(a2, "intValue"));
    case 8:
      v6 = *(_DWORD *)(result + 40);
      v7 = objc_msgSend(a2, "longLongValue");
      goto LABEL_28;
    case 9:
      return TRIPBComputeSInt32Size(*(_DWORD *)(result + 40), objc_msgSend(a2, "intValue"));
    case 0xA:
      return TRIPBComputeSInt64Size(*(_DWORD *)(result + 40), objc_msgSend(a2, "longLongValue"));
    case 0xB:
      return TRIPBComputeUInt32Size(*(_DWORD *)(result + 40), objc_msgSend(a2, "unsignedIntValue"));
    case 0xC:
      v6 = *(_DWORD *)(result + 40);
      v7 = objc_msgSend(a2, "unsignedLongLongValue");
LABEL_28:
      v14 = 8 * v6;
      if ((8 * v6) >= 0x80)
      {
        v15 = 3;
        v16 = 4;
        if (v14 >> 28)
          v16 = 5;
        if (v14 >= 0x200000)
          v15 = v16;
        if (v14 >= 0x4000)
          v11 = v15;
        else
          v11 = 2;
      }
      else
      {
        v11 = 1;
      }
      v17 = TRIPBComputeRawVarint64Size(v7);
      return v17 + v11;
    case 0xD:
      return TRIPBComputeBytesSize(*(_DWORD *)(result + 40), a2);
    case 0xE:
      return TRIPBComputeStringSize(*(_DWORD *)(result + 40), a2);
    case 0xF:
      v8 = *(_BYTE *)(result + 45);
      v9 = *(_DWORD *)(result + 40);
      if ((v8 & 4) != 0)
        return TRIPBComputeMessageSetExtensionSize(v9, a2);
      else
        return TRIPBComputeMessageSize(v9, a2);
    case 0x10:
      v10 = 8 * *(_DWORD *)(result + 40);
      if (v10 >= 0x80)
      {
        v18 = 6;
        v19 = 10;
        if (!(v10 >> 28))
          v19 = 8;
        if (v10 >= 0x200000)
          v18 = v19;
        if (v10 >= 0x4000)
          v11 = v18;
        else
          v11 = 4;
      }
      else
      {
        v11 = 2;
      }
      v17 = objc_msgSend(a2, "serializedSize");
      return v17 + v11;
    case 0x11:
      return TRIPBComputeEnumSize(*(_DWORD *)(result + 40), objc_msgSend(a2, "intValue"));
    default:
      return result;
  }
}

uint64_t ComputePBSerializedSizeNoTagOfObject(uint64_t result, void *a2)
{
  unsigned int v2;
  unint64_t v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  switch((int)result)
  {
    case 0:
      objc_msgSend(a2, "BOOLValue");
      return 1;
    case 1:
      objc_msgSend(a2, "unsignedIntValue");
      return 4;
    case 2:
      objc_msgSend(a2, "intValue");
      return 4;
    case 3:
      objc_msgSend(a2, "floatValue");
      return 4;
    case 4:
      objc_msgSend(a2, "unsignedLongLongValue");
      return 8;
    case 5:
      objc_msgSend(a2, "longLongValue");
      return 8;
    case 6:
      objc_msgSend(a2, "doubleValue");
      return 8;
    case 7:
      v5 = objc_msgSend(a2, "intValue");
      v6 = 1;
      v7 = 2;
      v8 = 3;
      v9 = 4;
      if (v5 >> 28)
        v9 = 5;
      if (v5 >= 0x200000)
        v8 = v9;
      if (v5 >= 0x4000)
        v7 = v8;
      if (v5 >= 0x80)
        v6 = v7;
      if ((v5 & 0x80000000) == 0)
        return v6;
      else
        return 10;
    case 8:
      v3 = objc_msgSend(a2, "longLongValue");
      return TRIPBComputeRawVarint64Size(v3);
    case 9:
      v10 = objc_msgSend(a2, "intValue");
      v11 = (2 * v10) ^ (v10 >> 31);
      if (v11 < 0x80)
        return 1;
      if (v11 < 0x4000)
        return 2;
      v20 = 4;
      if (v11 >> 28)
        v20 = 5;
      if (v11 >= 0x200000)
        return v20;
      else
        return 3;
    case 10:
      v12 = objc_msgSend(a2, "longLongValue");
      v3 = (2 * v12) ^ (v12 >> 63);
      return TRIPBComputeRawVarint64Size(v3);
    case 11:
      v2 = objc_msgSend(a2, "unsignedIntValue");
      goto LABEL_43;
    case 12:
      v3 = objc_msgSend(a2, "unsignedLongLongValue");
      return TRIPBComputeRawVarint64Size(v3);
    case 13:
      v4 = objc_msgSend(a2, "length");
      goto LABEL_33;
    case 14:
      v4 = objc_msgSend(a2, "lengthOfBytesUsingEncoding:", 4);
      goto LABEL_33;
    case 15:
      v4 = objc_msgSend(a2, "serializedSize");
LABEL_33:
      v13 = 1;
      v14 = 2;
      v15 = 3;
      v16 = 4;
      if (v4 >> 28)
        v16 = 5;
      if (v4 >= 0x200000)
        v15 = v16;
      if (v4 >= 0x4000)
        v14 = v15;
      if (v4 >= 0x80)
        v13 = v14;
      result = v13 + v4;
      break;
    case 16:
      result = objc_msgSend(a2, "serializedSize");
      break;
    case 17:
      v2 = objc_msgSend(a2, "intValue");
LABEL_43:
      v17 = 2;
      v18 = 3;
      v19 = 4;
      if (v2 >> 28)
        v19 = 5;
      if (v2 >= 0x200000)
        v18 = v19;
      if (v2 >= 0x4000)
        v17 = v18;
      if (v2 >= 0x80)
        result = v17;
      else
        result = 1;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t TRILogTreatmentReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  int v16;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t result;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  TRILogNamespace *v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char v40;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    v16 = v10 & 7;
    if (v15 || v16 == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 40;
        goto LABEL_23;
      case 2u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 64;
LABEL_23:
        v20 = *(void **)(a1 + v19);
        *(_QWORD *)(a1 + v19) = v18;

        goto LABEL_64;
      case 3u:
        if (v16 == 2)
        {
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
          {
            v22 = 0;
            v23 = 0;
            v24 = 0;
            while (1)
            {
              v25 = *v3;
              v26 = *(_QWORD *)(a2 + v25);
              if (v26 == -1 || v26 >= *(_QWORD *)(a2 + *v4))
                break;
              v27 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v26);
              *(_QWORD *)(a2 + v25) = v26 + 1;
              v24 |= (unint64_t)(v27 & 0x7F) << v22;
              if (v27 < 0)
              {
                v22 += 7;
                v14 = v23++ >= 9;
                if (!v14)
                  continue;
              }
              goto LABEL_36;
            }
            *(_BYTE *)(a2 + *v5) = 1;
LABEL_36:
            PBRepeatedUInt32Add();
          }
          PBReaderRecallMark();
        }
        else
        {
          v35 = 0;
          v36 = 0;
          v37 = 0;
          while (1)
          {
            v38 = *v3;
            v39 = *(_QWORD *)(a2 + v38);
            if (v39 == -1 || v39 >= *(_QWORD *)(a2 + *v4))
              break;
            v40 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v39);
            *(_QWORD *)(a2 + v38) = v39 + 1;
            v37 |= (unint64_t)(v40 & 0x7F) << v35;
            if (v40 < 0)
            {
              v35 += 7;
              v14 = v36++ >= 9;
              if (!v14)
                continue;
            }
            goto LABEL_63;
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_63:
          PBRepeatedUInt32Add();
        }
        goto LABEL_64;
      case 4u:
        v28 = 0;
        v29 = 0;
        v30 = 0;
        *(_BYTE *)(a1 + 72) |= 1u;
        while (2)
        {
          v31 = *v3;
          v32 = *(_QWORD *)(a2 + v31);
          if (v32 == -1 || v32 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v33 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v32);
            *(_QWORD *)(a2 + v31) = v32 + 1;
            v30 |= (unint64_t)(v33 & 0x7F) << v28;
            if (v33 < 0)
            {
              v28 += 7;
              v14 = v29++ >= 9;
              if (v14)
              {
                LODWORD(v30) = 0;
                goto LABEL_53;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v30) = 0;
LABEL_53:
        *(_DWORD *)(a1 + 32) = v30;
        goto LABEL_64;
      case 5u:
        PBReaderReadString();
        v34 = (TRILogNamespace *)objc_claimAutoreleasedReturnValue();
        if (v34)
          objc_msgSend((id)a1, "addNamespaceName:", v34);
        goto LABEL_49;
      case 6u:
        v34 = objc_alloc_init(TRILogNamespace);
        objc_msgSend((id)a1, "addNamespace:", v34);
        if (PBReaderPlaceMark() && (TRILogNamespaceReadFrom((uint64_t)v34, a2) & 1) != 0)
        {
          PBReaderRecallMark();
LABEL_49:

LABEL_64:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_64;
    }
  }
}

uint64_t TRITrialSystemTelemetryReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  TRITrialExperimentFields *v19;
  uint64_t result;
  void *v21;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 48;
        goto LABEL_56;
      case 2u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 40;
        goto LABEL_56;
      case 3u:
        v19 = objc_alloc_init(TRITrialExperimentFields);
        objc_storeStrong((id *)(a1 + 80), v19);
        if (!PBReaderPlaceMark() || !TRITrialExperimentFieldsReadFrom((uint64_t)v19, a2))
          goto LABEL_77;
        goto LABEL_69;
      case 4u:
        v19 = objc_alloc_init(TRITrialRolloutFields);
        objc_storeStrong((id *)(a1 + 160), v19);
        if (!PBReaderPlaceMark() || (TRITrialRolloutFieldsReadFrom((uint64_t)v19, a2) & 1) == 0)
          goto LABEL_77;
        goto LABEL_69;
      case 5u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 24;
        goto LABEL_56;
      case 6u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 168;
        goto LABEL_56;
      case 7u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 144;
        goto LABEL_56;
      case 8u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 112;
        goto LABEL_56;
      case 9u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 136;
        goto LABEL_56;
      case 0xAu:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 152;
        goto LABEL_56;
      case 0xBu:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 32;
        goto LABEL_56;
      case 0xDu:
        v19 = objc_alloc_init(TRITrialFactorFields);
        objc_storeStrong((id *)(a1 + 88), v19);
        if (!PBReaderPlaceMark() || !TRITrialFactorFieldsReadFrom((uint64_t)v19, a2))
          goto LABEL_77;
        goto LABEL_69;
      case 0xEu:
        v19 = objc_alloc_init(TRITrialDownloadSettingsFields);
        objc_storeStrong((id *)(a1 + 64), v19);
        if (!PBReaderPlaceMark() || (TRITrialDownloadSettingsFieldsReadFrom((uint64_t)v19, a2) & 1) == 0)
          goto LABEL_77;
        goto LABEL_69;
      case 0xFu:
        v19 = objc_alloc_init(TRITrialCloudKitContainerOriginFields);
        objc_storeStrong((id *)(a1 + 56), v19);
        if (!PBReaderPlaceMark() || !TRITrialCloudKitContainerOriginFieldsReadFrom((uint64_t)v19, a2))
          goto LABEL_77;
        goto LABEL_69;
      case 0x10u:
        v19 = objc_alloc_init(TRITrialAssetPurgeFields);
        objc_storeStrong((id *)(a1 + 8), v19);
        if (!PBReaderPlaceMark() || (TRITrialAssetPurgeFieldsReadFrom((uint64_t)v19, a2) & 1) == 0)
          goto LABEL_77;
        goto LABEL_69;
      case 0x11u:
        v19 = objc_alloc_init(TRITrialDownloadStatusFields);
        objc_storeStrong((id *)(a1 + 72), v19);
        if (!PBReaderPlaceMark() || (TRITrialDownloadStatusFieldsReadFrom((uint64_t)v19, a2) & 1) == 0)
          goto LABEL_77;
        goto LABEL_69;
      case 0x12u:
        v19 = objc_alloc_init(TRITrialOnDemandFactorFields);
        objc_storeStrong((id *)(a1 + 104), v19);
        if (!PBReaderPlaceMark() || !TRITrialOnDemandFactorFieldsReadFrom((uint64_t)v19, a2))
          goto LABEL_77;
        goto LABEL_69;
      case 0x13u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 128;
        goto LABEL_56;
      case 0x14u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 120;
LABEL_56:
        v21 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_70;
      case 0x15u:
        v22 = 0;
        v23 = 0;
        v24 = 0;
        *(_BYTE *)(a1 + 180) |= 1u;
        while (2)
        {
          v25 = *v3;
          v26 = *(_QWORD *)(a2 + v25);
          if (v26 == -1 || v26 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v27 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v26);
            *(_QWORD *)(a2 + v25) = v26 + 1;
            v24 |= (unint64_t)(v27 & 0x7F) << v22;
            if (v27 < 0)
            {
              v22 += 7;
              v14 = v23++ >= 9;
              if (v14)
              {
                v24 = 0;
                goto LABEL_75;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v24 = 0;
LABEL_75:
        *(_BYTE *)(a1 + 176) = v24 != 0;
        goto LABEL_70;
      case 0x16u:
        v19 = objc_alloc_init(TRITrialMobileAssetOriginFields);
        objc_storeStrong((id *)(a1 + 96), v19);
        if (!PBReaderPlaceMark() || (TRITrialMobileAssetOriginFieldsReadFrom((uint64_t)v19, a2) & 1) == 0)
          goto LABEL_77;
        goto LABEL_69;
      case 0x17u:
        v19 = objc_alloc_init(TRITrialBMLTFields);
        objc_storeStrong((id *)(a1 + 16), v19);
        if (PBReaderPlaceMark() && (TRITrialBMLTFieldsReadFrom((uint64_t)v19, a2) & 1) != 0)
        {
LABEL_69:
          PBReaderRecallMark();

LABEL_70:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_77:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_70;
    }
  }
}

BOOL TRITrialCloudKitContainerOriginFieldsReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  BOOL v23;
  int *v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  char v29;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 16) |= 2u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
          {
            v24 = &OBJC_IVAR___TRITrialCloudKitContainerOriginFields__ckEnvironment;
            goto LABEL_38;
          }
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            break;
          v17 += 7;
          v23 = v18++ > 8;
          if (v23)
          {
            LODWORD(v19) = 0;
            v24 = &OBJC_IVAR___TRITrialCloudKitContainerOriginFields__ckEnvironment;
            goto LABEL_41;
          }
        }
        v24 = &OBJC_IVAR___TRITrialCloudKitContainerOriginFields__ckEnvironment;
LABEL_39:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_41:
        *(_DWORD *)(a1 + *v24) = v19;
        goto LABEL_42;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_42:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v25 = 0;
    v26 = 0;
    v19 = 0;
    *(_BYTE *)(a1 + 16) |= 1u;
    while (1)
    {
      v27 = *v3;
      v28 = *(_QWORD *)(a2 + v27);
      if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
        break;
      v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
      *(_QWORD *)(a2 + v27) = v28 + 1;
      v19 |= (unint64_t)(v29 & 0x7F) << v25;
      if ((v29 & 0x80) == 0)
      {
        v24 = &OBJC_IVAR___TRITrialCloudKitContainerOriginFields__ckContainer;
        goto LABEL_39;
      }
      v25 += 7;
      v23 = v26++ > 8;
      if (v23)
      {
        LODWORD(v19) = 0;
        v24 = &OBJC_IVAR___TRITrialCloudKitContainerOriginFields__ckContainer;
        goto LABEL_41;
      }
    }
    v24 = &OBJC_IVAR___TRITrialCloudKitContainerOriginFields__ckContainer;
LABEL_38:
    *(_BYTE *)(a2 + *v5) = 1;
    goto LABEL_39;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t TRIPBEmptyNSData()
{
  if (_MergedGlobals_6 != -1)
    dispatch_once(&_MergedGlobals_6, &__block_literal_global);
  return qword_1ECF0E630;
}

uint64_t TRIPBMessageDropUnknownFieldsRecursively(uint64_t result)
{
  void *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  _QWORD *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  int v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", result);
    result = objc_msgSend(v1, "count");
    if (result)
    {
      v2 = MEMORY[0x1E0C809B0];
      do
      {
        v3 = (_QWORD *)objc_msgSend(v1, "lastObject");
        objc_msgSend(v1, "removeLastObject");
        objc_msgSend(v3, "setUnknownFields:", 0);
        v4 = objc_msgSend((id)objc_opt_class(), "descriptor");
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v5 = *(void **)(v4 + 8);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v39;
          do
          {
            for (i = 0; i != v7; ++i)
            {
              if (*(_QWORD *)v39 != v8)
                objc_enumerationMutation(v5);
              v10 = *(_QWORD **)(*((_QWORD *)&v38 + 1) + 8 * i);
              if (*(unsigned __int8 *)(v10[1] + 30) - 15 <= 1)
              {
                v11 = objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "fieldType");
                if (v11 == 2)
                {
                  v16 = v3[8];
                  if (v16)
                    v17 = *(void **)(v16 + *(unsigned int *)(v10[1] + 24));
                  else
                    v17 = 0;
                  switch(objc_msgSend(v10, "mapKeyDataType"))
                  {
                    case 0u:
                      v37[0] = v2;
                      v37[1] = 3221225472;
                      v37[2] = __TRIPBMessageDropUnknownFieldsRecursively_block_invoke;
                      v37[3] = &unk_1E2E9B3F8;
                      v37[4] = v1;
                      v19 = v37;
                      goto LABEL_34;
                    case 1u:
                    case 0xBu:
                      v36[0] = v2;
                      v36[1] = 3221225472;
                      v36[2] = __TRIPBMessageDropUnknownFieldsRecursively_block_invoke_2;
                      v36[3] = &unk_1E2E9B420;
                      v36[4] = v1;
                      v19 = v36;
                      goto LABEL_34;
                    case 2u:
                    case 7u:
                    case 9u:
                      v35[0] = v2;
                      v35[1] = 3221225472;
                      v35[2] = __TRIPBMessageDropUnknownFieldsRecursively_block_invoke_3;
                      v35[3] = &unk_1E2E9B448;
                      v35[4] = v1;
                      v19 = v35;
                      goto LABEL_34;
                    case 3u:
                    case 6u:
                    case 0xDu:
                    case 0xFu:
                    case 0x10u:
                    case 0x11u:
                      v18 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                      objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void TRIPBMessageDropUnknownFieldsRecursively(TRIPBMessage * _Nonnull)"), CFSTR("TRIPBUtilities.m"), 168, CFSTR("Aren't valid key types."));
                      continue;
                    case 4u:
                    case 0xCu:
                      v34[0] = v2;
                      v34[1] = 3221225472;
                      v34[2] = __TRIPBMessageDropUnknownFieldsRecursively_block_invoke_4;
                      v34[3] = &unk_1E2E9B470;
                      v34[4] = v1;
                      v19 = v34;
                      goto LABEL_34;
                    case 5u:
                    case 8u:
                    case 0xAu:
                      v33[0] = v2;
                      v33[1] = 3221225472;
                      v33[2] = __TRIPBMessageDropUnknownFieldsRecursively_block_invoke_5;
                      v33[3] = &unk_1E2E9B498;
                      v33[4] = v1;
                      v19 = v33;
                      goto LABEL_34;
                    case 0xEu:
                      v32[0] = v2;
                      v32[1] = 3221225472;
                      v32[2] = __TRIPBMessageDropUnknownFieldsRecursively_block_invoke_6;
                      v32[3] = &unk_1E2E9B4C0;
                      v32[4] = v1;
                      v19 = v32;
LABEL_34:
                      objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v19);
                      break;
                    default:
                      continue;
                  }
                }
                else if (v11 == 1)
                {
                  v14 = v3[8];
                  if (v14)
                    v15 = *(void **)(v14 + *(unsigned int *)(v10[1] + 24));
                  else
                    v15 = 0;
                  if (objc_msgSend(v15, "count"))
                    objc_msgSend(v1, "addObjectsFromArray:", v15);
                }
                else if (!v11 && TRIPBGetHasIvar((uint64_t)v3, *(_DWORD *)(v10[1] + 20), *(_DWORD *)(v10[1] + 16)))
                {
                  v12 = v3[8];
                  if (v12)
                    v13 = *(_QWORD *)(v12 + *(unsigned int *)(v10[1] + 24));
                  else
                    v13 = 0;
                  objc_msgSend(v1, "addObject:", v13);
                }
              }
            }
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
          }
          while (v7);
        }
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        v20 = (void *)objc_msgSend(v3, "extensionsCurrentlySet", 0);
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v42, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v29;
          do
          {
            for (j = 0; j != v22; ++j)
            {
              if (*(_QWORD *)v29 != v23)
                objc_enumerationMutation(v20);
              v25 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
              if (objc_msgSend(v25, "dataType") - 15 <= 1)
              {
                v26 = objc_msgSend(v25, "isRepeated");
                v27 = objc_msgSend(v3, "getExtension:", v25);
                if (v26)
                  objc_msgSend(v1, "addObjectsFromArray:", v27);
                else
                  objc_msgSend(v1, "addObject:", v27);
              }
            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v42, 16);
          }
          while (v22);
        }
        result = objc_msgSend(v1, "count");
      }
      while (result);
    }
  }
  return result;
}

uint64_t TRIPBGetObjectIvarWithFieldNoAutocreate(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 64);
  if (v2)
    return *(_QWORD *)(v2 + *(unsigned int *)(*(_QWORD *)(a2 + 8) + 24));
  else
    return 0;
}

uint64_t TRIPBCheckRuntimeVersionSupport(uint64_t result)
{
  if ((int)result >= 30003)
    return objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Linked to ProtocolBuffer runtime version %d, but code compiled needing atleast %d!"), 30002, result);
  if ((int)result <= 30000)
    return objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Proto generation source compiled against runtime version %d, but this version of the runtime only supports back to %d!"), result, 30001);
  return result;
}

uint64_t TRIPBCheckRuntimeVersionInternal(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  if ((_DWORD)result != 30001)
    return objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Linked to ProtocolBuffer runtime version %d, but code compiled with version %d!"), 30001, result, v1, v2);
  return result;
}

BOOL TRIPBMessageHasFieldNumberSet(void *a1, uint64_t a2)
{
  return TRIPBMessageHasFieldSet((uint64_t)a1, objc_msgSend((id)objc_msgSend(a1, "descriptor"), "fieldWithNumber:", a2));
}

BOOL TRIPBMessageHasFieldSet(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = 0;
  if (a1 && a2)
  {
    v3 = *(_QWORD *)(a2 + 8);
    if ((*(_WORD *)(v3 + 28) & 0xF02) == 0)
      return TRIPBGetHasIvar(a1, *(_DWORD *)(v3 + 20), *(_DWORD *)(v3 + 16));
    v4 = *(_QWORD *)(a1 + 64);
    if (v4)
      v5 = *(void **)(v4 + *(unsigned int *)(v3 + 24));
    else
      v5 = 0;
    return objc_msgSend(v5, "count") != 0;
  }
  return v2;
}

uint64_t TRIPBClearMessageField(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = TRIPBGetHasIvar(a1, *(_DWORD *)(*(_QWORD *)(a2 + 8) + 20), *(_DWORD *)(*(_QWORD *)(a2 + 8) + 16));
  if ((_DWORD)result)
  {
    v5 = *(_QWORD *)(a2 + 8);
    if ((*(_WORD *)(v5 + 28) & 0xF02) != 0 || *(unsigned __int8 *)(v5 + 30) - 13 <= 3)
    {
      v6 = *(_QWORD *)(a1 + 64);
      v7 = *(unsigned int *)(v5 + 24);

      *(_QWORD *)(v6 + v7) = 0;
      v5 = *(_QWORD *)(a2 + 8);
    }
    return TRIPBSetHasIvar(a1, *(_DWORD *)(v5 + 20), *(_DWORD *)(v5 + 16), 0);
  }
  return result;
}

void *TRIPBSetObjectIvarWithFieldInternal(_QWORD *a1, uint64_t a2, void *a3, int a4)
{
  return TRIPBSetRetainedObjectIvarWithFieldInternal(a1, a2, a3, a4);
}

uint64_t TRIPBGetEnumIvarWithFieldInternal(uint64_t a1, _QWORD *a2, int a3)
{
  uint64_t v5;

  v5 = TRIPBGetMessageInt32Field(a1, a2);
  if (a3 == 3)
  {
    if (objc_msgSend(a2, "isValidEnumValue:", v5))
      return v5;
    else
      return 4222467823;
  }
  return v5;
}

void *TRIPBSetMessageEnumField(_QWORD *a1, uint64_t a2, int a3)
{
  return TRIPBSetInt32IvarWithFieldInternal(a1, a2, a3, objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "descriptor"), "file"), "syntax"));
}

void *TRIPBSetMessageRawEnumField(_QWORD *a1, uint64_t a2, int a3)
{
  return TRIPBSetInt32IvarWithFieldInternal(a1, a2, a3, objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "descriptor"), "file"), "syntax"));
}

_QWORD *TRIPBSetMessageBoolField(_QWORD *result, uint64_t a2, int a3)
{
  if (result)
  {
    if (a2)
      return TRIPBSetBoolIvarWithFieldInternal(result, a2, a3, objc_msgSend((id)objc_msgSend((id)objc_msgSend(result, "descriptor"), "file"), "syntax"));
  }
  return result;
}

_QWORD *TRIPBSetMessageInt32Field(_QWORD *result, uint64_t a2, int a3)
{
  if (result)
  {
    if (a2)
      return TRIPBSetInt32IvarWithFieldInternal(result, a2, a3, objc_msgSend((id)objc_msgSend((id)objc_msgSend(result, "descriptor"), "file"), "syntax"));
  }
  return result;
}

uint64_t TRIPBGetMessageUInt32Field(uint64_t a1, _QWORD *a2)
{
  if (TRIPBGetHasIvar(a1, *(_DWORD *)(a2[1] + 20), *(_DWORD *)(a2[1] + 16)))
    return *(unsigned int *)(*(_QWORD *)(a1 + 64) + *(unsigned int *)(a2[1] + 24));
  else
    return objc_msgSend(a2, "defaultValue");
}

_QWORD *TRIPBSetMessageUInt32Field(_QWORD *result, uint64_t a2, int a3)
{
  if (result)
  {
    if (a2)
      return TRIPBSetUInt32IvarWithFieldInternal(result, a2, a3, objc_msgSend((id)objc_msgSend((id)objc_msgSend(result, "descriptor"), "file"), "syntax"));
  }
  return result;
}

void *TRIPBSetUInt32IvarWithFieldInternal(_QWORD *a1, uint64_t a2, int a3, int a4)
{
  void *v8;
  _BOOL4 v9;

  v8 = *(void **)(a2 + 16);
  if (v8)
    TRIPBMaybeClearOneof((uint64_t)a1, v8, *(unsigned int *)(*(_QWORD *)(a2 + 8) + 20), *(_DWORD *)(*(_QWORD *)(a2 + 8) + 16));
  *(_DWORD *)(a1[8] + *(unsigned int *)(*(_QWORD *)(a2 + 8) + 24)) = a3;
  v9 = 1;
  if (!a3 && a4 != 2)
    v9 = *(_QWORD *)(a2 + 16) != 0;
  TRIPBSetHasIvar((uint64_t)a1, *(_DWORD *)(*(_QWORD *)(a2 + 8) + 20), *(_DWORD *)(*(_QWORD *)(a2 + 8) + 16), v9);
  return TRIPBBecomeVisibleToAutocreator(a1);
}

_QWORD *TRIPBSetMessageInt64Field(_QWORD *result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    if (a2)
      return TRIPBSetInt64IvarWithFieldInternal(result, a2, a3, objc_msgSend((id)objc_msgSend((id)objc_msgSend(result, "descriptor"), "file"), "syntax"));
  }
  return result;
}

uint64_t TRIPBGetMessageUInt64Field(uint64_t a1, _QWORD *a2)
{
  if (TRIPBGetHasIvar(a1, *(_DWORD *)(a2[1] + 20), *(_DWORD *)(a2[1] + 16)))
    return *(_QWORD *)(*(_QWORD *)(a1 + 64) + *(unsigned int *)(a2[1] + 24));
  else
    return objc_msgSend(a2, "defaultValue");
}

_QWORD *TRIPBSetMessageUInt64Field(_QWORD *result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    if (a2)
      return TRIPBSetUInt64IvarWithFieldInternal(result, a2, a3, objc_msgSend((id)objc_msgSend((id)objc_msgSend(result, "descriptor"), "file"), "syntax"));
  }
  return result;
}

float TRIPBGetMessageFloatField(uint64_t a1, _QWORD *a2)
{
  float result;

  if (TRIPBGetHasIvar(a1, *(_DWORD *)(a2[1] + 20), *(_DWORD *)(a2[1] + 16)))
    return *(float *)(*(_QWORD *)(a1 + 64) + *(unsigned int *)(a2[1] + 24));
  LODWORD(result) = objc_msgSend(a2, "defaultValue");
  return result;
}

_QWORD *TRIPBSetMessageFloatField(_QWORD *result, uint64_t a2, float a3)
{
  if (result)
  {
    if (a2)
      return TRIPBSetFloatIvarWithFieldInternal(result, a2, objc_msgSend((id)objc_msgSend((id)objc_msgSend(result, "descriptor"), "file"), "syntax"), a3);
  }
  return result;
}

void *TRIPBSetFloatIvarWithFieldInternal(_QWORD *a1, uint64_t a2, int a3, float a4)
{
  void *v8;
  int v10;

  v8 = *(void **)(a2 + 16);
  if (v8)
    TRIPBMaybeClearOneof((uint64_t)a1, v8, *(unsigned int *)(*(_QWORD *)(a2 + 8) + 20), *(_DWORD *)(*(_QWORD *)(a2 + 8) + 16));
  *(float *)(a1[8] + *(unsigned int *)(*(_QWORD *)(a2 + 8) + 24)) = a4;
  v10 = a4 != 0.0 || a3 == 2 || *(_QWORD *)(a2 + 16) != 0;
  TRIPBSetHasIvar((uint64_t)a1, *(_DWORD *)(*(_QWORD *)(a2 + 8) + 20), *(_DWORD *)(*(_QWORD *)(a2 + 8) + 16), v10);
  return TRIPBBecomeVisibleToAutocreator(a1);
}

_QWORD *TRIPBSetMessageDoubleField(_QWORD *result, uint64_t a2, double a3)
{
  if (result)
  {
    if (a2)
      return TRIPBSetDoubleIvarWithFieldInternal(result, a2, objc_msgSend((id)objc_msgSend((id)objc_msgSend(result, "descriptor"), "file"), "syntax"), a3);
  }
  return result;
}

_QWORD *TRIPBSetObjectIvarWithField(_QWORD *result, uint64_t a2, void *a3)
{
  if (result)
  {
    if (a2)
      return TRIPBSetRetainedObjectIvarWithFieldInternal(result, a2, a3, objc_msgSend((id)objc_msgSend((id)objc_msgSend(result, "descriptor"), "file"), "syntax"));
  }
  return result;
}

__CFString *TRIPBTextFormatForMessage(void *a1, __CFString *a2)
{
  __CFString *v2;
  __CFString *v4;

  v2 = &stru_1E2E9CC90;
  if (a1)
  {
    if (a2)
      v4 = a2;
    else
      v4 = &stru_1E2E9CC90;
    v2 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    AppendTextFormatForMessage(a1, v2, v4);
  }
  return v2;
}

uint64_t AppendTextFormatForMessage(void *a1, void *a2, __CFString *a3)
{
  _QWORD *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t *v18;
  int v19;
  int v20;
  _BOOL4 HasIvar;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  float v43;
  double v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  const __CFString *v50;
  void *v51;
  uint64_t v52;
  __CFString *v53;
  uint64_t result;
  uint64_t v55;
  uint64_t v56;
  __CFString *v57;
  void *v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  void *v63;
  unint64_t v64;
  _QWORD *v65;
  _QWORD *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, void *, void *);
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  __CFString *v76;
  _QWORD *v77;
  _QWORD *v78;
  _QWORD *v79;
  char v80;
  char v81;
  _QWORD v82[3];
  char v83;

  v6 = (_QWORD *)objc_msgSend(a1, "descriptor");
  v7 = (void *)v6[1];
  v8 = objc_msgSend(v7, "count");
  v9 = objc_msgSend(v6, "extensionRanges");
  v10 = objc_msgSend(v6, "extensionRangesCount");
  v66 = a1;
  v11 = objc_msgSend((id)objc_msgSend(a1, "extensionsCurrentlySet"), "sortedArrayUsingSelector:", sel_compareByFieldNumber_);
  if (v8)
    v12 = 0;
  else
    v12 = v10 == 0;
  if (!v12)
  {
    v13 = (void *)v11;
    v14 = 0;
    v15 = 0;
    v16 = v10;
    v58 = (void *)v11;
    v59 = v9;
    v60 = v8;
    v61 = v10;
    v63 = v7;
    v57 = a3;
    do
    {
      if (v15 == v8)
      {
        AppendTextFormatForMessageExtensionRange(v66, v13, *(_QWORD *)(v9 + 8 * v14), a2, a3);
        v15 = v8;
        ++v14;
        continue;
      }
      if (v14 == v16
        || (v17 = objc_msgSend(v7, "objectAtIndexedSubscript:", v15),
            v18 = (unint64_t *)(v9 + 8 * v14),
            *(_DWORD *)(*(_QWORD *)(v17 + 8) + 16) < *(_DWORD *)v18))
      {
        v64 = v15 + 1;
        v65 = (_QWORD *)objc_msgSend(v7, "objectAtIndexedSubscript:", v15);
        v19 = objc_msgSend(v65, "fieldType");
        v20 = v19;
        if (v19 == 2 || v19 == 1)
        {
          v24 = v66[8];
          if (v24)
            v22 = *(void **)(v24 + *(unsigned int *)(v65[1] + 24));
          else
            v22 = 0;
          v23 = objc_msgSend(v22, "count");
          if (v23)
          {
LABEL_24:
            v25 = (void *)objc_msgSend(v65, "textFormatName");
            if (objc_msgSend(v25, "length"))
            {
              v26 = &stru_1E2E9CC90;
            }
            else
            {
              v25 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), *(unsigned int *)(v65[1] + 16));
              if (v23 < 2)
              {
                v26 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("  # %@"), objc_msgSend(v65, "name"));
              }
              else
              {
                objc_msgSend(a2, "appendFormat:", CFSTR("%@# %@\n"), a3, objc_msgSend(v65, "name"));
                v26 = &stru_1E2E9CC90;
              }
            }
            v62 = v14;
            if (v20 == 2)
            {
              v27 = objc_msgSend(v65, "mapKeyDataType");
              v28 = *(unsigned __int8 *)(v65[1] + 30);
              v56 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@ {%@\n"), a3, v25, v26);
              v29 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@ {\n"), a3, v25);
              v30 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@}\n"), a3);
              v31 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@  key: "), a3);
              v32 = ":";
              if ((v28 - 15) < 2)
                v32 = "";
              v33 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@  value%s "), a3, v32);
              v82[0] = 0;
              v82[1] = v82;
              v82[2] = 0x2020000000;
              v83 = 1;
              if (v27 == 14 && (v28 - 13) <= 3)
              {
                v67 = MEMORY[0x1E0C809B0];
                v68 = 3221225472;
                v69 = __AppendTextFormatForMapMessageField_block_invoke;
                v70 = &unk_1E2E9B538;
                v71 = a2;
                v72 = v56;
                v73 = v29;
                v74 = v31;
                LOBYTE(v79) = v28;
                v75 = v33;
                v76 = a3;
                v77 = (_QWORD *)v30;
                v78 = v82;
                objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", &v67);
              }
              else
              {
                v67 = MEMORY[0x1E0C809B0];
                v68 = 3221225472;
                v69 = __AppendTextFormatForMapMessageField_block_invoke_2;
                v70 = &unk_1E2E9B560;
                v78 = (_QWORD *)v30;
                v79 = v82;
                v71 = a2;
                v72 = v56;
                v80 = v27;
                v73 = v29;
                v74 = v31;
                v81 = v28;
                v75 = v33;
                v76 = a3;
                v77 = v65;
                objc_msgSend(v22, "enumerateForTextFormat:", &v67);
              }
              _Block_object_dispose(v82, 8);
              v7 = v63;
              v15 = v64;
              v9 = v59;
              v8 = v60;
              v13 = v58;
              v16 = v61;
            }
            else
            {
              v34 = 0;
              v35 = *(unsigned __int8 *)(v65[1] + 30);
              if ((v35 - 15) >= 2)
                v36 = ":";
              else
                v36 = "";
              do
              {
                objc_msgSend(a2, "appendFormat:", CFSTR("%@%@%s "), a3, v25, v36);
                switch(v35)
                {
                  case 0:
                    if (v22)
                      v42 = objc_msgSend(v22, "valueAtIndex:", v34);
                    else
                      v42 = TRIPBGetMessageBoolField((uint64_t)v66, v65);
                    if (v42)
                      v50 = CFSTR("true");
                    else
                      v50 = CFSTR("false");
                    objc_msgSend(a2, "appendString:", v50);
                    break;
                  case 1:
                  case 11:
                    if (v22)
                      v39 = objc_msgSend(v22, "valueAtIndex:", v34);
                    else
                      v39 = TRIPBGetMessageUInt32Field((uint64_t)v66, v65);
                    objc_msgSend(a2, "appendFormat:", CFSTR("%u"), v39, v55);
                    break;
                  case 2:
                  case 7:
                  case 9:
                    if (v22)
                      v37 = objc_msgSend(v22, "valueAtIndex:", v34);
                    else
                      v37 = TRIPBGetMessageInt32Field((uint64_t)v66, v65);
                    objc_msgSend(a2, "appendFormat:", CFSTR("%d"), v37, v55);
                    break;
                  case 3:
                    if (v22)
                      objc_msgSend(v22, "valueAtIndex:", v34);
                    else
                      v43 = TRIPBGetMessageFloatField((uint64_t)v66, v65);
                    objc_msgSend(a2, "appendFormat:", CFSTR("%.*g"), 6, v43);
                    break;
                  case 4:
                  case 12:
                    if (v22)
                      v40 = objc_msgSend(v22, "valueAtIndex:", v34);
                    else
                      v40 = TRIPBGetMessageUInt64Field((uint64_t)v66, v65);
                    objc_msgSend(a2, "appendFormat:", CFSTR("%llu"), v40, v55);
                    break;
                  case 5:
                  case 8:
                  case 10:
                    if (v22)
                      v38 = objc_msgSend(v22, "valueAtIndex:", v34);
                    else
                      v38 = TRIPBGetMessageInt64Field((uint64_t)v66, v65);
                    objc_msgSend(a2, "appendFormat:", CFSTR("%lld"), v38, v55);
                    break;
                  case 6:
                    if (v22)
                      objc_msgSend(v22, "valueAtIndex:", v34);
                    else
                      v44 = TRIPBGetMessageDoubleField((uint64_t)v66, v65);
                    objc_msgSend(a2, "appendFormat:", CFSTR("%.*lg"), 15, *(_QWORD *)&v44);
                    break;
                  case 13:
                    if (v22)
                      v45 = (void *)objc_msgSend(v22, "objectAtIndex:", v34);
                    else
                      v45 = (void *)TRIPBGetObjectIvarWithField((uint64_t)v66, v65);
                    AppendBufferAsString(v45, a2);
                    break;
                  case 14:
                    if (v22)
                      v46 = (void *)objc_msgSend(v22, "objectAtIndex:", v34);
                    else
                      v46 = (void *)TRIPBGetObjectIvarWithField((uint64_t)v66, v65);
                    AppendStringEscaped(v46, a2);
                    break;
                  case 15:
                  case 16:
                    if (v22)
                      v41 = objc_msgSend(v22, "objectAtIndex:", v34);
                    else
                      v41 = TRIPBGetObjectIvarWithField((uint64_t)v66, v65);
                    v49 = v41;
                    objc_msgSend(a2, "appendFormat:", CFSTR("{%@\n"), v26);
                    AppendTextFormatForMessage(v49, a2, -[__CFString stringByAppendingString:](a3, "stringByAppendingString:", CFSTR("  ")));
                    objc_msgSend(a2, "appendFormat:", CFSTR("%@}"), a3);
                    v26 = &stru_1E2E9CC90;
                    break;
                  case 17:
                    if (v22)
                    {
                      v47 = objc_msgSend(v22, "rawValueAtIndex:", v34);
                      v48 = v65;
                    }
                    else
                    {
                      v48 = v65;
                      v47 = TRIPBGetMessageInt32Field((uint64_t)v66, v65);
                    }
                    v51 = (void *)objc_msgSend(v48, "enumDescriptor");
                    if (v51 && (v52 = objc_msgSend(v51, "textFormatNameForValue:", v47)) != 0)
                      objc_msgSend(a2, "appendString:", v52);
                    else
                      objc_msgSend(a2, "appendFormat:", CFSTR("%d"), v47);
                    a3 = v57;
                    break;
                  default:
                    break;
                }
                objc_msgSend(a2, "appendFormat:", CFSTR("%@\n"), v26);
                ++v34;
              }
              while (v23 != v34);
              v7 = v63;
              v15 = v64;
              v9 = v59;
              v8 = v60;
              v13 = v58;
              v16 = v61;
              v14 = v62;
            }
            continue;
          }
          goto LABEL_17;
        }
        if (!v19)
        {
          HasIvar = TRIPBGetHasIvar((uint64_t)v66, *(_DWORD *)(v65[1] + 20), *(_DWORD *)(v65[1] + 16));
          v22 = 0;
          v23 = HasIvar;
          if (HasIvar)
            goto LABEL_24;
LABEL_17:
          v7 = v63;
          v15 = v64;
          v16 = v61;
          continue;
        }
        v7 = v63;
        ++v15;
      }
      else
      {
        ++v14;
        AppendTextFormatForMessageExtensionRange(v66, v13, *v18, a2, a3);
      }
    }
    while (v15 < v8 || v14 < v16);
  }
  v53 = TRIPBTextFormatForUnknownFieldSet((void *)objc_msgSend(v66, "unknownFields"), a3);
  result = -[__CFString length](v53, "length");
  if (result)
  {
    objc_msgSend(a2, "appendFormat:", CFSTR("%@# --- Unknown fields ---\n"), a3);
    return objc_msgSend(a2, "appendString:", v53);
  }
  return result;
}

void sub_19215A6E8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

__CFString *TRIPBTextFormatForUnknownFieldSet(void *a1, const __CFString *a2)
{
  __CFString *v2;
  __CFString *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  id obj;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[6];
  int v39;
  _QWORD v40[6];
  int v41;
  _QWORD v42[6];
  int v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v2 = &stru_1E2E9CC90;
  if (a1)
  {
    v4 = a2 ? (__CFString *)a2 : &stru_1E2E9CC90;
    v2 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    obj = (id)objc_msgSend(a1, "sortedFields");
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    if (v27)
    {
      v26 = *(_QWORD *)v45;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v45 != v26)
            objc_enumerationMutation(obj);
          v29 = v5;
          v6 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v5);
          v7 = objc_msgSend(v6, "number");
          v8 = (void *)objc_msgSend(v6, "varintList");
          v9 = MEMORY[0x1E0C809B0];
          v42[0] = MEMORY[0x1E0C809B0];
          v42[1] = 3221225472;
          v42[2] = __TRIPBTextFormatForUnknownFieldSet_block_invoke;
          v42[3] = &unk_1E2E9B4E8;
          v42[4] = v2;
          v42[5] = v4;
          v43 = v7;
          objc_msgSend(v8, "enumerateValuesWithBlock:", v42);
          v10 = (void *)objc_msgSend(v6, "fixed32List");
          v40[0] = v9;
          v40[1] = 3221225472;
          v40[2] = __TRIPBTextFormatForUnknownFieldSet_block_invoke_2;
          v40[3] = &unk_1E2E9B510;
          v40[4] = v2;
          v40[5] = v4;
          v41 = v7;
          objc_msgSend(v10, "enumerateValuesWithBlock:", v40);
          v11 = (void *)objc_msgSend(v6, "fixed64List");
          v38[0] = v9;
          v38[1] = 3221225472;
          v38[2] = __TRIPBTextFormatForUnknownFieldSet_block_invoke_3;
          v38[3] = &unk_1E2E9B4E8;
          v38[4] = v2;
          v38[5] = v4;
          v39 = v7;
          objc_msgSend(v11, "enumerateValuesWithBlock:", v38);
          v36 = 0u;
          v37 = 0u;
          v34 = 0u;
          v35 = 0u;
          v28 = v6;
          v12 = (void *)objc_msgSend(v6, "lengthDelimitedList");
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v49, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v35;
            do
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v35 != v15)
                  objc_enumerationMutation(v12);
                v17 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
                -[__CFString appendFormat:](v2, "appendFormat:", CFSTR("%@%d: "), v4, v7);
                AppendBufferAsString(v17, v2);
                -[__CFString appendString:](v2, "appendString:", CFSTR("\n"));
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v49, 16);
            }
            while (v14);
          }
          v32 = 0u;
          v33 = 0u;
          v30 = 0u;
          v31 = 0u;
          v18 = (void *)objc_msgSend(v28, "groupList");
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v48, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v31;
            do
            {
              for (j = 0; j != v20; ++j)
              {
                if (*(_QWORD *)v31 != v21)
                  objc_enumerationMutation(v18);
                v23 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
                -[__CFString appendFormat:](v2, "appendFormat:", CFSTR("%@%d: {\n"), v4, v7);
                -[__CFString appendString:](v2, "appendString:", TRIPBTextFormatForUnknownFieldSet(v23, -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", CFSTR("  "))));
                -[__CFString appendFormat:](v2, "appendFormat:", CFSTR("%@}\n"), v4);
              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v48, 16);
            }
            while (v20);
          }
          v5 = v29 + 1;
        }
        while (v29 + 1 != v27);
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
      }
      while (v27);
    }
  }
  return v2;
}

uint64_t AppendBufferAsString(void *a1, void *a2)
{
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;

  v4 = (char *)objc_msgSend(a1, "bytes");
  v5 = objc_msgSend(a1, "length");
  objc_msgSend(a2, "appendString:", CFSTR("\""));
  if (v5 >= 1)
  {
    v6 = &v4[v5];
    do
    {
      v7 = *v4;
      if ((int)v7 > 33)
      {
        switch((_DWORD)v7)
        {
          case '"':
            v8 = a2;
            v9 = CFSTR("\\\"");
            goto LABEL_16;
          case '\'':
            v8 = a2;
            v9 = CFSTR("\\'");
            goto LABEL_16;
          case '\\':
            v8 = a2;
            v9 = CFSTR("\\\\");
            goto LABEL_16;
        }
      }
      else
      {
        switch((_DWORD)v7)
        {
          case 9:
            v8 = a2;
            v9 = CFSTR("\\t");
            goto LABEL_16;
          case 0xA:
            v8 = a2;
            v9 = CFSTR("\\n");
            goto LABEL_16;
          case 0xD:
            v8 = a2;
            v9 = CFSTR("\\r");
LABEL_16:
            objc_msgSend(v8, "appendString:", v9);
            goto LABEL_17;
        }
      }
      if ((v7 & 0x80000000) != 0)
      {
        if (!__maskrune(*v4, 0x40000uLL))
        {
LABEL_23:
          objc_msgSend(a2, "appendFormat:", CFSTR("\\%03o"), v7);
          goto LABEL_17;
        }
      }
      else if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v7 + 60) & 0x40000) == 0)
      {
        goto LABEL_23;
      }
      objc_msgSend(a2, "appendFormat:", CFSTR("%c"), v7);
LABEL_17:
      ++v4;
    }
    while (v4 < v6);
  }
  return objc_msgSend(a2, "appendString:", CFSTR("\""));
}

BOOL TRIPBClassHasSel(objc_class *a1, const char *a2)
{
  Method *v3;
  unint64_t i;
  SEL Name;
  _BOOL8 v6;
  unsigned int outCount;

  outCount = 0;
  v3 = class_copyMethodList(a1, &outCount);
  if (outCount)
  {
    for (i = 0; i < outCount; ++i)
    {
      Name = method_getName(v3[i]);
      v6 = Name == a2;
      if (Name == a2)
        break;
    }
  }
  else
  {
    v6 = 0;
  }
  free(v3);
  return v6;
}

uint64_t AppendTextFormatForMessageExtensionRange(void *a1, void *a2, unint64_t a3, void *a4, void *a5)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  uint64_t v23;
  float v24;
  const __CFString *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  unint64_t v31;
  uint64_t v32;
  uint64_t v34;
  const __CFString *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (result)
  {
    v9 = result;
    v31 = HIDWORD(a3);
    v10 = *(_QWORD *)v37;
    v28 = *(_QWORD *)v37;
    v29 = a3;
    do
    {
      v11 = 0;
      v32 = v9;
      do
      {
        if (*(_QWORD *)v37 != v10)
          objc_enumerationMutation(a2);
        v12 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v11);
        result = objc_msgSend(v12, "fieldNumber");
        if (result >= a3)
        {
          v13 = result;
          if (result > v31)
            return result;
          v14 = (void *)objc_msgSend(a1, "getExtension:", v12);
          v15 = objc_msgSend(v12, "isRepeated");
          v34 = v11;
          if ((v15 & 1) != 0)
          {
            v16 = objc_msgSend(v14, "count");
            v17 = objc_msgSend(v12, "singletonName");
            if (v16 != 1)
            {
              objc_msgSend(a4, "appendFormat:", CFSTR("%@# [%@]\n"), a5, v17);
              v18 = objc_msgSend(v12, "dataType");
              if (v16)
              {
                v19 = v18;
                v35 = &stru_1E2E9CC90;
                goto LABEL_14;
              }
              v35 = &stru_1E2E9CC90;
LABEL_38:
              objc_msgSend(a4, "appendFormat:", CFSTR("%@\n"), v35);
              v10 = v28;
              LODWORD(a3) = v29;
              v9 = v32;
              v11 = v34;
              goto LABEL_39;
            }
          }
          else
          {
            v17 = objc_msgSend(v12, "singletonName");
          }
          v35 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("  # [%@]"), v17);
          v19 = objc_msgSend(v12, "dataType");
          v16 = 1;
LABEL_14:
          v20 = 0;
          if ((v19 - 15) >= 2)
            v21 = ":";
          else
            v21 = "";
          do
          {
            v22 = v14;
            if (v15)
              v22 = (void *)objc_msgSend(v14, "objectAtIndex:", v20);
            objc_msgSend(a4, "appendFormat:", CFSTR("%@%u%s "), a5, v13, v21);
            switch(v19)
            {
              case 0:
                if (objc_msgSend(v22, "BOOLValue"))
                  v25 = CFSTR("true");
                else
                  v25 = CFSTR("false");
                objc_msgSend(a4, "appendString:", v25);
                break;
              case 1:
              case 11:
                objc_msgSend(a4, "appendFormat:", CFSTR("%u"), objc_msgSend(v22, "unsignedIntValue"), v27);
                break;
              case 2:
                v23 = objc_msgSend(v22, "unsignedIntValue");
                goto LABEL_32;
              case 3:
                objc_msgSend(v22, "floatValue");
                objc_msgSend(a4, "appendFormat:", CFSTR("%.*g"), 6, v24);
                break;
              case 4:
              case 12:
                objc_msgSend(a4, "appendFormat:", CFSTR("%llu"), objc_msgSend(v22, "unsignedLongLongValue"), v27);
                break;
              case 5:
              case 8:
              case 10:
                objc_msgSend(a4, "appendFormat:", CFSTR("%lld"), objc_msgSend(v22, "longLongValue"), v27);
                break;
              case 6:
                objc_msgSend(v22, "doubleValue");
                objc_msgSend(a4, "appendFormat:", CFSTR("%.*lg"), 15, v26);
                break;
              case 7:
              case 9:
              case 17:
                v23 = objc_msgSend(v22, "intValue");
LABEL_32:
                objc_msgSend(a4, "appendFormat:", CFSTR("%d"), v23, v27);
                break;
              case 13:
                AppendBufferAsString(v22, a4);
                break;
              case 14:
                AppendStringEscaped(v22, a4);
                break;
              case 15:
              case 16:
                objc_msgSend(a4, "appendFormat:", CFSTR("{%@\n"), v35);
                AppendTextFormatForMessage(v22, a4, objc_msgSend(a5, "stringByAppendingString:", CFSTR("  ")));
                objc_msgSend(a4, "appendFormat:", CFSTR("%@}"), a5);
                v35 = &stru_1E2E9CC90;
                break;
              default:
                break;
            }
            ++v20;
          }
          while (v16 != v20);
          goto LABEL_38;
        }
LABEL_39:
        ++v11;
      }
      while (v11 != v9);
      result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      v9 = result;
    }
    while (result);
  }
  return result;
}

uint64_t AppendStringEscaped(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  uint64_t v11;
  uint64_t v12;

  objc_msgSend(a2, "appendString:", CFSTR("\""));
  v4 = objc_msgSend(a1, "length");
  if (v4)
  {
    v5 = v4;
    for (i = 0; v5 != i; ++i)
    {
      v7 = objc_msgSend(a1, "characterAtIndex:", i);
      if ((int)v7 > 33)
      {
        switch((_DWORD)v7)
        {
          case '"':
            v8 = a2;
            v9 = CFSTR("\\\"");
            break;
          case '\'':
            v8 = a2;
            v9 = CFSTR("\\'");
            break;
          case '\\':
            v8 = a2;
            v9 = CFSTR("\\\\");
            break;
          default:
LABEL_19:
            if (v7 > 0x1F)
              objc_msgSend(a2, "appendFormat:", CFSTR("%C"), v7, v11, v12);
            else
              objc_msgSend(a2, "appendFormat:", CFSTR("\\%d%d%d"), 0, v7 >> 3, v7 & 7);
            continue;
        }
      }
      else
      {
        switch((_DWORD)v7)
        {
          case 9:
            v8 = a2;
            v9 = CFSTR("\\t");
            break;
          case 0xA:
            v8 = a2;
            v9 = CFSTR("\\n");
            break;
          case 0xD:
            v8 = a2;
            v9 = CFSTR("\\r");
            break;
          default:
            goto LABEL_19;
        }
      }
      objc_msgSend(v8, "appendString:", v9);
    }
  }
  return objc_msgSend(a2, "appendString:", CFSTR("\""));
}

_QWORD *TRIPBCreateMessageWithAutocreator(objc_class *a1, uint64_t a2, void *a3)
{
  _QWORD *v5;

  v5 = objc_alloc_init(a1);
  v5[4] = a2;
  v5[5] = a3;
  return v5;
}

BOOL TRIPBWasMessageAutocreatedBy(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) == a2;
}

void *TRIPBAutocreatedArrayModified(_QWORD *a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  int *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = *(void **)(objc_msgSend((id)objc_opt_class(), "descriptor") + 8);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v9, "fieldType") == 1)
        {
          v10 = a1[8];
          if (v10)
            v10 = *(_QWORD *)(v10 + *(unsigned int *)(v9[1] + 24));
          if (v10 == a2)
          {
            if (*(unsigned __int8 *)(v9[1] + 30) - 13 >= 4)
              v13 = &OBJC_IVAR___TRIPBInt32Array__autocreator;
            else
              v13 = &OBJC_IVAR___TRIPBAutocreatedArray__autocreator;
            *(_QWORD *)(a2 + *v13) = 0;
            return TRIPBBecomeVisibleToAutocreator(a1);
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  return (void *)objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void TRIPBAutocreatedArrayModified(TRIPBMessage *, id)"), CFSTR("TRIPBMessage.m"), 699, CFSTR("Unknown autocreated %@ for %@."), objc_opt_class(), a1);
}

void *TRIPBAutocreatedDictionaryModified(_QWORD *a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  int *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = *(void **)(objc_msgSend((id)objc_opt_class(), "descriptor") + 8);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v9, "fieldType") == 2)
        {
          v10 = a1[8];
          if (v10)
            v10 = *(_QWORD *)(v10 + *(unsigned int *)(v9[1] + 24));
          if (v10 == a2)
          {
            if (objc_msgSend(v9, "mapKeyDataType") == 14
              && *(unsigned __int8 *)(v9[1] + 30) - 13 < 4)
            {
              v13 = &OBJC_IVAR___TRIPBAutocreatedDictionary__autocreator;
            }
            else
            {
              v13 = &OBJC_IVAR___TRIPBInt32Int32Dictionary__autocreator;
            }
            *(_QWORD *)(a2 + *v13) = 0;
            return TRIPBBecomeVisibleToAutocreator(a1);
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  return (void *)objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void TRIPBAutocreatedDictionaryModified(TRIPBMessage *, id)"), CFSTR("TRIPBMessage.m"), 722, CFSTR("Unknown autocreated %@ for %@."), objc_opt_class(), a1);
}

uint64_t ErrorFromException(void *a1)
{
  uint64_t result;
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend((id)objc_msgSend(a1, "name"), "isEqual:", CFSTR("TRIPBCodedInputStreamException"))
    || (result = objc_msgSend((id)objc_msgSend(a1, "userInfo"), "objectForKeyedSubscript:", CFSTR("TRIPBCodedInputStreamUnderlyingErrorKey"))) == 0)
  {
    v3 = (void *)objc_msgSend(a1, "reason");
    if (objc_msgSend(v3, "length"))
    {
      v5 = CFSTR("Reason");
      v6[0] = v3;
      v4 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
    }
    else
    {
      v4 = 0;
    }
    return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIPBMessageErrorDomain"), -100, v4);
  }
  return result;
}

void sub_19215BBC8()
{
  objc_end_catch();
  JUMPOUT(0x19215BBD0);
}

uint64_t CheckExtension(uint64_t a1, void *a2)
{
  uint64_t result;

  objc_msgSend(a2, "containingMessageClass");
  result = objc_opt_isKindOfClass();
  if ((result & 1) == 0)
    return objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Extension %@ used on wrong class (%@ instead of %@)"), objc_msgSend(a2, "singletonName"), objc_opt_class(), objc_msgSend(a2, "containingMessageClass"));
  return result;
}

void sub_19215D524()
{
  objc_end_catch();
  JUMPOUT(0x19215D52CLL);
}

uint64_t GetOrMakeUnknownFields(_QWORD *a1)
{
  uint64_t result;

  result = a1[1];
  if (!result)
  {
    a1[1] = objc_alloc_init(TRIPBUnknownFieldSet);
    TRIPBBecomeVisibleToAutocreator(a1);
    return a1[1];
  }
  return result;
}

uint64_t MergeRepeatedPackedFieldFromCodedInputStream(_QWORD *a1, _QWORD *a2, int a3, _QWORD *a4)
{
  int v7;
  uint64_t *v8;
  TRIPBAutocreatedArray *ArrayIvarWithField;
  uint64_t result;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t RawVarint64;
  uint64_t v17;
  uint64_t v18;
  TRIPBAutocreatedArray *v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  double v23;
  unsigned int v24;
  unint64_t v25;
  uint64_t v26;

  v7 = *(unsigned __int8 *)(a2[1] + 30);
  v8 = a4 + 1;
  ArrayIvarWithField = GetOrCreateArrayIvarWithField(a1, a2, a3);
  result = ReadRawVarint64(v8);
  v11 = a4[3];
  v12 = a4[4];
  v13 = v11 + (int)result;
  if (v13 > v12)
  {
    result = RaiseException(-102, 0);
    v11 = a4[3];
  }
  a4[4] = v13;
  if (v13 != v11)
  {
    do
    {
      switch(v7)
      {
        case 0:
          RawVarint64 = ReadRawVarint64(v8) != 0;
          goto LABEL_15;
        case 1:
        case 2:
          CheckSize((uint64_t)v8, 4);
          v15 = a4[3];
          RawVarint64 = *(unsigned int *)(a4[1] + v15);
          a4[3] = v15 + 4;
          goto LABEL_15;
        case 3:
          CheckSize((uint64_t)v8, 4);
          v20 = a4[3];
          LODWORD(v21) = *(_DWORD *)(a4[1] + v20);
          a4[3] = v20 + 4;
          result = -[TRIPBAutocreatedArray addValue:](ArrayIvarWithField, "addValue:", v21);
          break;
        case 4:
        case 5:
          CheckSize((uint64_t)v8, 8);
          v17 = a4[3];
          v18 = *(_QWORD *)(a4[1] + v17);
          a4[3] = v17 + 8;
          goto LABEL_18;
        case 6:
          CheckSize((uint64_t)v8, 8);
          v22 = a4[3];
          v23 = *(double *)(a4[1] + v22);
          a4[3] = v22 + 8;
          result = -[TRIPBAutocreatedArray addValue:](ArrayIvarWithField, "addValue:", v23);
          break;
        case 7:
        case 11:
          RawVarint64 = ReadRawVarint64(v8);
          v19 = ArrayIvarWithField;
          goto LABEL_16;
        case 8:
        case 12:
          v18 = ReadRawVarint64(v8);
          goto LABEL_18;
        case 9:
          v24 = ReadRawVarint64(v8);
          RawVarint64 = -(v24 & 1) ^ (v24 >> 1);
LABEL_15:
          v19 = ArrayIvarWithField;
LABEL_16:
          result = -[TRIPBAutocreatedArray addValue:](v19, "addValue:", RawVarint64);
          break;
        case 10:
          v25 = ReadRawVarint64(v8);
          v18 = -(uint64_t)(v25 & 1) ^ (v25 >> 1);
LABEL_18:
          result = -[TRIPBAutocreatedArray addValue:](ArrayIvarWithField, "addValue:", v18);
          break;
        case 13:
        case 14:
        case 15:
        case 16:
          v14 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          result = objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void MergeRepeatedPackedFieldFromCodedInputStream(TRIPBMessage *, TRIPBFieldDescriptor *, TRIPBFileSyntax, TRIPBCodedInputStream *)"), CFSTR("TRIPBMessage.m"), 2234, CFSTR("Non primitive types can't be packed"));
          break;
        case 17:
          v26 = ReadRawVarint64(v8);
          if (a3 == 3 || objc_msgSend(a2, "isValidEnumValue:", v26))
            result = -[TRIPBAutocreatedArray addRawValue:](ArrayIvarWithField, "addRawValue:", v26);
          else
            result = objc_msgSend((id)GetOrMakeUnknownFields(a1), "mergeVarintField:value:", *(unsigned int *)(a2[1] + 16), v26);
          break;
        default:
          break;
      }
    }
    while (a4[4] != a4[3]);
  }
  a4[4] = v12;
  return result;
}

void sub_19215F170(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x3C0], 8);
  _Unwind_Resume(a1);
}

TRIPBAutocreatedArray *TRIPBGetMessageRepeatedField(_QWORD *a1, _QWORD *a2)
{
  int v4;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "descriptor"), "file"), "syntax");
  return GetOrCreateArrayIvarWithField(a1, a2, v4);
}

TRIPBAutocreatedDictionary *TRIPBGetMessageMapField(_QWORD *a1, _QWORD *a2)
{
  int v4;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "descriptor"), "file"), "syntax");
  return GetOrCreateMapIvarWithField(a1, a2, v4);
}

TRIPBFileDescriptor *TRITrishadowEvaluationRoot_FileDescriptor()
{
  TRIPBFileDescriptor *result;

  result = (TRIPBFileDescriptor *)TRITrishadowEvaluationRoot_FileDescriptor_descriptor;
  if (!TRITrishadowEvaluationRoot_FileDescriptor_descriptor)
  {
    result = -[TRIPBFileDescriptor initWithPackage:objcPrefix:syntax:]([TRIPBFileDescriptor alloc], "initWithPackage:objcPrefix:syntax:", CFSTR("TRI"), CFSTR("TRI"), 2);
    TRITrishadowEvaluationRoot_FileDescriptor_descriptor = (uint64_t)result;
  }
  return result;
}

uint64_t TRIShadowEvaluation_ClearTypeOneOfCase(void *a1)
{
  return TRIPBMaybeClearOneof((uint64_t)a1, (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "descriptor"), "oneofs"), "objectAtIndex:", 0), 0xFFFFFFFFLL, 0);
}

unint64_t TRIMLRuntimeSchedulingPolicy_QOS_EnumDescriptor()
{
  id v1;

  if (!atomic_load(&TRIMLRuntimeSchedulingPolicy_QOS_EnumDescriptor_descriptor))
  {
    v1 = +[TRIPBEnumDescriptor allocDescriptorForName:valueNames:values:count:enumVerifier:](TRIPBEnumDescriptor, "allocDescriptorForName:valueNames:values:count:enumVerifier:", CFSTR("TRIMLRuntimeSchedulingPolicy_QOS"), "Background", &TRIMLRuntimeSchedulingPolicy_QOS_EnumDescriptor_values, 2, TRIMLRuntimeSchedulingPolicy_QOS_IsValidValue);
    while (!__ldaxr(&TRIMLRuntimeSchedulingPolicy_QOS_EnumDescriptor_descriptor))
    {
      if (!__stlxr((unint64_t)v1, &TRIMLRuntimeSchedulingPolicy_QOS_EnumDescriptor_descriptor))
        return atomic_load(&TRIMLRuntimeSchedulingPolicy_QOS_EnumDescriptor_descriptor);
    }
    __clrex();

  }
  return atomic_load(&TRIMLRuntimeSchedulingPolicy_QOS_EnumDescriptor_descriptor);
}

BOOL TRIMLRuntimeSchedulingPolicy_QOS_IsValidValue(unsigned int a1)
{
  return a1 < 2;
}

TRIPBFileDescriptor *TRITriclientBackgroundMltaskRoot_FileDescriptor()
{
  TRIPBFileDescriptor *result;

  result = (TRIPBFileDescriptor *)TRITriclientBackgroundMltaskRoot_FileDescriptor_descriptor;
  if (!TRITriclientBackgroundMltaskRoot_FileDescriptor_descriptor)
  {
    result = -[TRIPBFileDescriptor initWithPackage:objcPrefix:syntax:]([TRIPBFileDescriptor alloc], "initWithPackage:objcPrefix:syntax:", CFSTR("TRI"), CFSTR("TRI"), 2);
    TRITriclientBackgroundMltaskRoot_FileDescriptor_descriptor = (uint64_t)result;
  }
  return result;
}

void CopyWorker(uint64_t a1, void *a2, void *a3)
{
  id v4;

  v4 = (id)objc_msgSend(a2, "copy");
  objc_msgSend(a3, "addField:", v4);

}

uint64_t TRIPBUnknownFieldSetSerializedSize(uint64_t a1, void *a2, _QWORD *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "serializedSize");
  *a3 += result;
  return result;
}

uint64_t TRIPBUnknownFieldSetWriteAsMessageSetTo(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "writeAsMessageSetExtensionToOutput:");
}

uint64_t TRIPBUnknownFieldSetSerializedSizeAsMessageSet(uint64_t a1, void *a2, _QWORD *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "serializedSizeAsMessageSetExtension");
  *a3 += result;
  return result;
}

void TRIPBUnknownFieldSetMergeUnknownFields(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;

  v5 = objc_msgSend(a2, "number");
  if (!(_DWORD)v5)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Zero is not a valid field number."));
  v6 = (void *)objc_msgSend(a3, "mutableFieldForNumber:create:", v5, 0);
  if (v6)
  {
    objc_msgSend(v6, "mergeFromField:", a2);
  }
  else
  {
    v7 = (id)objc_msgSend(a2, "copy");
    objc_msgSend(a3, "addField:", v7);

  }
}

uint64_t TRILogTimeReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  uint64_t result;
  uint64_t v36;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v24 = 0;
        v25 = 0;
        v26 = 0;
        *(_BYTE *)(a1 + 24) |= 2u;
        while (1)
        {
          v27 = *v3;
          v28 = *(_QWORD *)(a2 + v27);
          if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
            break;
          v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
          *(_QWORD *)(a2 + v27) = v28 + 1;
          v26 |= (unint64_t)(v29 & 0x7F) << v24;
          if ((v29 & 0x80) == 0)
            goto LABEL_49;
          v24 += 7;
          v14 = v25++ >= 9;
          if (v14)
          {
            LODWORD(v26) = 0;
            goto LABEL_51;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_49:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v26) = 0;
LABEL_51:
        v36 = 16;
      }
      else
      {
        if ((_DWORD)v17 != 2)
        {
          if ((_DWORD)v17 == 1)
          {
            v18 = 0;
            v19 = 0;
            v20 = 0;
            *(_BYTE *)(a1 + 24) |= 1u;
            while (1)
            {
              v21 = *v3;
              v22 = *(_QWORD *)(a2 + v21);
              if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
                break;
              v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
              *(_QWORD *)(a2 + v21) = v22 + 1;
              v20 |= (unint64_t)(v23 & 0x7F) << v18;
              if ((v23 & 0x80) == 0)
                goto LABEL_45;
              v18 += 7;
              v14 = v19++ >= 9;
              if (v14)
              {
                v20 = 0;
                goto LABEL_47;
              }
            }
            *(_BYTE *)(a2 + *v5) = 1;
LABEL_45:
            if (*(_BYTE *)(a2 + *v5))
              v20 = 0;
LABEL_47:
            *(_QWORD *)(a1 + 8) = v20;
          }
          else
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
          }
          continue;
        }
        v30 = 0;
        v31 = 0;
        v26 = 0;
        *(_BYTE *)(a1 + 24) |= 4u;
        while (1)
        {
          v32 = *v3;
          v33 = *(_QWORD *)(a2 + v32);
          if (v33 == -1 || v33 >= *(_QWORD *)(a2 + *v4))
            break;
          v34 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v33);
          *(_QWORD *)(a2 + v32) = v33 + 1;
          v26 |= (unint64_t)(v34 & 0x7F) << v30;
          if ((v34 & 0x80) == 0)
            goto LABEL_53;
          v30 += 7;
          v14 = v31++ >= 9;
          if (v14)
          {
            LODWORD(v26) = 0;
            goto LABEL_55;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_53:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v26) = 0;
LABEL_55:
        v36 = 20;
      }
      *(_DWORD *)(a1 + v36) = v26;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t TRIPBFieldAlternateTag(uint64_t a1)
{
  uint64_t v1;
  __int16 v2;
  int v3;
  void *v4;

  v1 = *(_QWORD *)(a1 + 8);
  v2 = *(_WORD *)(v1 + 28);
  if ((v2 & 2) == 0)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "uint32_t TRIPBFieldAlternateTag(TRIPBFieldDescriptor *)"), CFSTR("TRIPBDescriptor.m"), 455, CFSTR("Only valid on repeated fields"));
    if ((*(_WORD *)(v1 + 28) & 4) == 0)
      goto LABEL_3;
LABEL_5:
    v3 = TRIPBWireFormatForType_format[*(unsigned __int8 *)(v1 + 30)];
    return v3 | (8 * *(_DWORD *)(v1 + 16));
  }
  if ((v2 & 4) != 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2;
  return v3 | (8 * *(_DWORD *)(v1 + 16));
}

void CopyKeyValue(void *key, void *value, CFMutableDictionaryRef theDict)
{
  CFDictionarySetValue(theDict, key, value);
}

uint64_t TRILevel_ClearLevelOneOfCase(void *a1)
{
  return TRIPBMaybeClearOneof((uint64_t)a1, (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "descriptor"), "oneofs"), "objectAtIndex:", 0), 0xFFFFFFFFLL, 0);
}

uint64_t TRITrialDownloadSettingsFieldsReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  uint64_t result;
  BOOL v37;
  uint64_t v38;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v24 = 0;
        v25 = 0;
        v26 = 0;
        *(_BYTE *)(a1 + 16) |= 1u;
        while (1)
        {
          v27 = *v3;
          v28 = *(_QWORD *)(a2 + v27);
          if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
            break;
          v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
          *(_QWORD *)(a2 + v27) = v28 + 1;
          v26 |= (unint64_t)(v29 & 0x7F) << v24;
          if ((v29 & 0x80) == 0)
            goto LABEL_49;
          v24 += 7;
          v14 = v25++ >= 9;
          if (v14)
          {
            LODWORD(v26) = 0;
            goto LABEL_51;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_49:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v26) = 0;
LABEL_51:
        *(_DWORD *)(a1 + 8) = v26;
      }
      else
      {
        if ((_DWORD)v17 == 2)
        {
          v30 = 0;
          v31 = 0;
          v32 = 0;
          *(_BYTE *)(a1 + 16) |= 4u;
          while (1)
          {
            v33 = *v3;
            v34 = *(_QWORD *)(a2 + v33);
            if (v34 == -1 || v34 >= *(_QWORD *)(a2 + *v4))
              break;
            v35 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v34);
            *(_QWORD *)(a2 + v33) = v34 + 1;
            v32 |= (unint64_t)(v35 & 0x7F) << v30;
            if ((v35 & 0x80) == 0)
              goto LABEL_53;
            v30 += 7;
            v14 = v31++ >= 9;
            if (v14)
            {
              v32 = 0;
              goto LABEL_55;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_53:
          if (*(_BYTE *)(a2 + *v5))
            v32 = 0;
LABEL_55:
          v37 = v32 != 0;
          v38 = 13;
        }
        else
        {
          if ((_DWORD)v17 != 1)
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
            continue;
          }
          v18 = 0;
          v19 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 16) |= 2u;
          while (1)
          {
            v21 = *v3;
            v22 = *(_QWORD *)(a2 + v21);
            if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
              break;
            v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
            *(_QWORD *)(a2 + v21) = v22 + 1;
            v20 |= (unint64_t)(v23 & 0x7F) << v18;
            if ((v23 & 0x80) == 0)
              goto LABEL_45;
            v18 += 7;
            v14 = v19++ >= 9;
            if (v14)
            {
              v20 = 0;
              goto LABEL_47;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_45:
          if (*(_BYTE *)(a2 + *v5))
            v20 = 0;
LABEL_47:
          v37 = v20 != 0;
          v38 = 12;
        }
        *(_BYTE *)(a1 + v38) = v37;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL TRIMLRuntimeDimensionsReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
        break;
      if ((_DWORD)v17 == 2)
      {
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 16;
        goto LABEL_24;
      }
      if ((_DWORD)v17 == 1)
      {
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 24;
LABEL_24:
        v20 = *(void **)(a1 + v19);
        *(_QWORD *)(a1 + v19) = v18;

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_26:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = 8;
    goto LABEL_24;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t TRILogNamespaceReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  void *v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
          goto LABEL_31;
        case 2u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 8;
          goto LABEL_31;
        case 3u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 40) |= 2u;
          while (2)
          {
            v23 = *v3;
            v24 = *(_QWORD *)(a2 + v23);
            if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
              *(_QWORD *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                v14 = v21++ >= 9;
                if (v14)
                {
                  v22 = 0;
                  goto LABEL_42;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v22 = 0;
LABEL_42:
          *(_BYTE *)(a1 + 36) = v22 != 0;
          continue;
        case 4u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
LABEL_31:
          v26 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        case 5u:
          v27 = 0;
          v28 = 0;
          v29 = 0;
          *(_BYTE *)(a1 + 40) |= 1u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v30 = *v3;
        v31 = *(_QWORD *)(a2 + v30);
        if (v31 == -1 || v31 >= *(_QWORD *)(a2 + *v4))
          break;
        v32 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v31);
        *(_QWORD *)(a2 + v30) = v31 + 1;
        v29 |= (unint64_t)(v32 & 0x7F) << v27;
        if ((v32 & 0x80) == 0)
          goto LABEL_44;
        v27 += 7;
        v14 = v28++ >= 9;
        if (v14)
        {
          LODWORD(v29) = 0;
          goto LABEL_46;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_44:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v29) = 0;
LABEL_46:
      *(_DWORD *)(a1 + 32) = v29;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL TRILogEventReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  unint64_t v17;
  TRILogContext *v18;
  uint64_t v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 10)
        break;
      if ((_DWORD)v17 == 2)
      {
        PBReaderReadString();
        v19 = objc_claimAutoreleasedReturnValue();
        v18 = *(TRILogContext **)(a1 + 24);
        *(_QWORD *)(a1 + 24) = v19;
        goto LABEL_28;
      }
      if ((_DWORD)v17 == 1)
      {
        v18 = objc_alloc_init(TRILogContext);
        objc_storeStrong((id *)(a1 + 8), v18);
        if (!PBReaderPlaceMark() || (TRILogContextReadFrom((uint64_t)v18, a2) & 1) == 0)
          goto LABEL_33;
        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_30:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v18 = objc_alloc_init(TRIDenormalizedEvent);
    objc_storeStrong((id *)(a1 + 16), v18);
    if (!PBReaderPlaceMark() || !TRIDenormalizedEventReadFrom((id *)&v18->super.super.isa, a2))
    {
LABEL_33:

      return 0;
    }
LABEL_26:
    PBReaderRecallMark();
LABEL_28:

    goto LABEL_30;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL TRITrialOnDemandFactorFieldsReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 8;
LABEL_22:
        v19 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_24:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 16;
    goto LABEL_22;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1921674B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
  _Block_object_dispose(&a44, 8);
  _Unwind_Resume(a1);
}

uint64_t TRITrialDownloadStatusFieldsReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 12) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_29;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_31;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_29:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_31:
        *(_DWORD *)(a1 + 8) = v19;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

unint64_t TRIProject_ProjectId_EnumDescriptor()
{
  id v1;

  if (!atomic_load(&TRIProject_ProjectId_EnumDescriptor_descriptor))
  {
    v1 = +[TRIPBEnumDescriptor allocDescriptorForName:valueNames:values:count:enumVerifier:extraTextFormatInfo:](TRIPBEnumDescriptor, "allocDescriptorForName:valueNames:values:count:enumVerifier:extraTextFormatInfo:", CFSTR("TRIProject_ProjectId"), "UnknownClient", &TRIProject_ProjectId_EnumDescriptor_values, 171, TRIProject_ProjectId_IsValidValue, &unk_1921A52B4);
    while (!__ldaxr(&TRIProject_ProjectId_EnumDescriptor_descriptor))
    {
      if (!__stlxr((unint64_t)v1, &TRIProject_ProjectId_EnumDescriptor_descriptor))
        return atomic_load(&TRIProject_ProjectId_EnumDescriptor_descriptor);
    }
    __clrex();

  }
  return atomic_load(&TRIProject_ProjectId_EnumDescriptor_descriptor);
}

TRIPBFileDescriptor *TRICoreMlassignmentRoot_FileDescriptor()
{
  TRIPBFileDescriptor *result;

  result = (TRIPBFileDescriptor *)TRICoreMlassignmentRoot_FileDescriptor_descriptor;
  if (!TRICoreMlassignmentRoot_FileDescriptor_descriptor)
  {
    result = -[TRIPBFileDescriptor initWithPackage:objcPrefix:syntax:]([TRIPBFileDescriptor alloc], "initWithPackage:objcPrefix:syntax:", CFSTR("TRI"), CFSTR("TRI"), 2);
    TRICoreMlassignmentRoot_FileDescriptor_descriptor = (uint64_t)result;
  }
  return result;
}

double TRIPBCodedInputStreamReadDouble(_QWORD *a1)
{
  uint64_t v2;
  double result;

  CheckSize((uint64_t)a1, 8);
  v2 = a1[2];
  result = *(double *)(*a1 + v2);
  a1[2] = v2 + 8;
  return result;
}

float TRIPBCodedInputStreamReadFloat(_QWORD *a1)
{
  uint64_t v2;
  float result;

  CheckSize((uint64_t)a1, 4);
  v2 = a1[2];
  result = *(float *)(*a1 + v2);
  a1[2] = v2 + 4;
  return result;
}

uint64_t TRIPBCodedInputStreamReadUInt32(uint64_t *a1)
{
  return ReadRawVarint64(a1);
}

uint64_t TRIPBCodedInputStreamReadInt32(uint64_t *a1)
{
  return ReadRawVarint64(a1);
}

uint64_t TRIPBCodedInputStreamReadFixed64(_QWORD *a1)
{
  uint64_t v2;
  uint64_t result;

  CheckSize((uint64_t)a1, 8);
  v2 = a1[2];
  result = *(_QWORD *)(*a1 + v2);
  a1[2] = v2 + 8;
  return result;
}

uint64_t TRIPBCodedInputStreamReadFixed32(_QWORD *a1)
{
  uint64_t v2;
  uint64_t result;

  CheckSize((uint64_t)a1, 4);
  v2 = a1[2];
  result = *(unsigned int *)(*a1 + v2);
  a1[2] = v2 + 4;
  return result;
}

uint64_t TRIPBCodedInputStreamReadEnum(uint64_t *a1)
{
  return ReadRawVarint64(a1);
}

uint64_t TRIPBCodedInputStreamReadSFixed32(_QWORD *a1)
{
  uint64_t v2;
  uint64_t result;

  CheckSize((uint64_t)a1, 4);
  v2 = a1[2];
  result = *(unsigned int *)(*a1 + v2);
  a1[2] = v2 + 4;
  return result;
}

uint64_t TRIPBCodedInputStreamReadSFixed64(_QWORD *a1)
{
  uint64_t v2;
  uint64_t result;

  CheckSize((uint64_t)a1, 8);
  v2 = a1[2];
  result = *(_QWORD *)(*a1 + v2);
  a1[2] = v2 + 8;
  return result;
}

uint64_t TRIPBCodedInputStreamReadSInt32(uint64_t *a1)
{
  unsigned int RawVarint64;

  RawVarint64 = ReadRawVarint64(a1);
  return -(RawVarint64 & 1) ^ (RawVarint64 >> 1);
}

unint64_t TRIPBCodedInputStreamReadSInt64(uint64_t *a1)
{
  unint64_t RawVarint64;

  RawVarint64 = ReadRawVarint64(a1);
  return -(uint64_t)(RawVarint64 & 1) ^ (RawVarint64 >> 1);
}

BOOL TRIPBCodedInputStreamReadBool(uint64_t *a1)
{
  return ReadRawVarint64(a1) != 0;
}

BOOL TRIPBCodedInputStreamIsAtEnd(_QWORD *a1)
{
  uint64_t v1;

  v1 = a1[2];
  return v1 == a1[1] || v1 == a1[3];
}

uint64_t RaiseException(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  const __CFString *v7;
  uint64_t v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "length"))
  {
    v9 = CFSTR("Reason");
    v10[0] = a2;
    v4 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  }
  else
  {
    v4 = 0;
  }
  v7 = CFSTR("TRIPBCodedInputStreamUnderlyingErrorKey");
  v8 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TRIPBCodedInputStreamErrorDomain"), a1, v4);
  v5 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("TRIPBCodedInputStreamException"), a2, v5), "raise");
}

uint64_t TRIPBCodedInputStreamReadRetainedBytes(uint64_t *a1)
{
  unsigned int RawVarint64;
  uint64_t result;

  RawVarint64 = ReadRawVarint64(a1);
  if ((RawVarint64 & 0x80000000) != 0)
    return 0;
  CheckSize((uint64_t)a1, RawVarint64);
  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", *a1 + a1[2], RawVarint64);
  a1[2] += RawVarint64;
  return result;
}

uint64_t TRIPBCodedInputStreamReadRetainedBytesNoCopy(uint64_t *a1)
{
  unsigned int RawVarint64;
  uint64_t result;

  RawVarint64 = ReadRawVarint64(a1);
  if ((RawVarint64 & 0x80000000) != 0)
    return 0;
  CheckSize((uint64_t)a1, RawVarint64);
  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", *a1 + a1[2], RawVarint64, 0);
  a1[2] += RawVarint64;
  return result;
}

unint64_t TRIPBCodedInputStreamPushLimit(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 16) + a2;
  if (v4 > v3)
    RaiseException(-102, 0);
  *(_QWORD *)(a1 + 24) = v4;
  return v3;
}

uint64_t TRIPBCodedInputStreamPopLimit(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 24) = a2;
  return result;
}

uint64_t TRIPBCodedInputStreamBytesUntilLimit(uint64_t a1)
{
  return *(_QWORD *)(a1 + 24) - *(_QWORD *)(a1 + 16);
}

uint64_t TRIPBCodedInputStreamCheckLastTagWas(uint64_t result, int a2)
{
  if (*(_DWORD *)(result + 32) != a2)
    return RaiseException(-103, CFSTR("Unexpected tag read"));
  return result;
}

TRIPBFileDescriptor *TRITriclientFactorPackRoot_FileDescriptor()
{
  TRIPBFileDescriptor *result;

  result = (TRIPBFileDescriptor *)TRITriclientFactorPackRoot_FileDescriptor_descriptor;
  if (!TRITriclientFactorPackRoot_FileDescriptor_descriptor)
  {
    result = -[TRIPBFileDescriptor initWithPackage:objcPrefix:syntax:]([TRIPBFileDescriptor alloc], "initWithPackage:objcPrefix:syntax:", CFSTR("TRI"), CFSTR("TRI"), 2);
    TRITriclientFactorPackRoot_FileDescriptor_descriptor = (uint64_t)result;
  }
  return result;
}

uint64_t TRIMetricReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  void *v31;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 32;
          goto LABEL_34;
        case 2u:
          *(_BYTE *)(a1 + 48) |= 1u;
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v23 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v22);
            *(_QWORD *)(a2 + v21) = v22 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v23 = 0;
          }
          *(_QWORD *)(a1 + 8) = v23;
          continue;
        case 3u:
          v24 = 0;
          v25 = 0;
          v26 = 0;
          *(_BYTE *)(a1 + 48) |= 2u;
          break;
        case 4u:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 24;
          goto LABEL_34;
        case 5u:
          PBReaderReadData();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 40;
LABEL_34:
          v31 = *(void **)(a1 + v19);
          *(_QWORD *)(a1 + v19) = v18;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v27 = *v3;
        v28 = *(_QWORD *)(a2 + v27);
        v29 = v28 + 1;
        if (v28 == -1 || v29 > *(_QWORD *)(a2 + *v4))
          break;
        v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
        *(_QWORD *)(a2 + v27) = v29;
        v26 |= (unint64_t)(v30 & 0x7F) << v24;
        if ((v30 & 0x80) == 0)
          goto LABEL_36;
        v24 += 7;
        v15 = v25++ >= 9;
        if (v15)
        {
          v26 = 0;
          goto LABEL_38;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_36:
      if (*(_BYTE *)(a2 + *v5))
        v26 = 0;
LABEL_38:
      *(_QWORD *)(a1 + 16) = v26;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t TRITrialAssetPurgeFieldsReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 12) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_29;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_31;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_29:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_31:
        *(_DWORD *)(a1 + 8) = v19;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t TRIPBRootExtensionKeyRetain(uint64_t a1, uint64_t a2)
{
  return a2;
}

CFStringRef TRIPBRootExtensionCopyKeyDescription(char *cStr)
{
  return CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], cStr, 0x8000100u);
}

BOOL TRIPBRootExtensionKeyEqual(const char *a1, const char *a2)
{
  return strcmp(a1, a2) == 0;
}

uint64_t TRIPBRootExtensionKeyHash(_BYTE *a1)
{
  int v1;
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;

  LOBYTE(v1) = *a1;
  if (*a1)
  {
    v2 = 0;
    v3 = 1;
    do
    {
      v2 = (1025 * (v2 + (char)v1)) ^ ((1025 * (v2 + (char)v1)) >> 6);
      v1 = a1[v3++];
    }
    while (v1);
    v4 = 9 * v2;
  }
  else
  {
    v4 = 0;
  }
  return 32769 * (v4 ^ (v4 >> 11));
}

uint64_t TRIPBResolveExtensionClassMethod(objc_class *a1, const char *a2)
{
  uint64_t result;
  uint64_t v5;
  char *v6;
  const char *Name;
  objc_class *MetaClass;
  void (*v9)(void);
  _QWORD block[5];

  result = (uint64_t)ExtensionForName(a1, a2);
  if (result)
  {
    v5 = result;
    v6 = TRIPBMessageEncodingForSelector(sel_getClassValue, 0);
    Name = class_getName(a1);
    MetaClass = objc_getMetaClass(Name);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __TRIPBResolveExtensionClassMethod_block_invoke;
    block[3] = &unk_1E2E9BB30;
    block[4] = v5;
    v9 = imp_implementationWithBlock(block);
    return class_addMethod(MetaClass, a2, v9, v6) || TRIPBClassHasSel(MetaClass, a2);
  }
  return result;
}

const void *ExtensionForName(objc_class *a1, SEL sel)
{
  const char *Name;
  int v5;
  const void *Value;
  const char *v7;
  uint64_t v8;
  const char *v9;
  size_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  Name = sel_getName(sel);
  v5 = *(unsigned __int8 *)Name;
  if (v5 == 95)
    return 0;
  v7 = Name;
  v8 = 1;
  if (*Name)
  {
    while (v5 != 58)
    {
      v5 = Name[v8++];
      if (!v5)
        goto LABEL_6;
    }
    return 0;
  }
LABEL_6:
  v9 = class_getName(a1);
  v10 = strlen(v9);
  MEMORY[0x1E0C80A78](v10, v11);
  v13 = (char *)v15 - v12;
  memcpy((char *)v15 - v12, v9, v10);
  v13[v10] = 95;
  memcpy(&v13[v10 + 1], v7, v8 - 1);
  v13[v10 + v8] = 0;
  if (!_MergedGlobals_16)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel, a1, CFSTR("TRIPBRootObject.m"), 190, CFSTR("Startup order broken!"));
  dispatch_semaphore_wait((dispatch_semaphore_t)qword_1ECF0E6D0, 0xFFFFFFFFFFFFFFFFLL);
  Value = CFDictionaryGetValue((CFDictionaryRef)_MergedGlobals_16, v13);
  dispatch_semaphore_signal((dispatch_semaphore_t)qword_1ECF0E6D0);
  return Value;
}

uint64_t TRITrialMobileAssetOriginFieldsReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 12) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_29;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            v19 = 0;
            goto LABEL_31;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_29:
        if (*(_BYTE *)(a2 + *v5))
          v19 = 0;
LABEL_31:
        *(_BYTE *)(a1 + 8) = v19 != 0;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t TRITrialRolloutFieldsReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  void *v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
          goto LABEL_24;
        case 2u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 8;
          goto LABEL_24;
        case 4u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
LABEL_24:
          v20 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        case 5u:
          v21 = 0;
          v22 = 0;
          v23 = 0;
          *(_BYTE *)(a1 + 36) |= 1u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v24 = *v3;
        v25 = *(_QWORD *)(a2 + v24);
        if (v25 == -1 || v25 >= *(_QWORD *)(a2 + *v4))
          break;
        v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
        *(_QWORD *)(a2 + v24) = v25 + 1;
        v23 |= (unint64_t)(v26 & 0x7F) << v21;
        if ((v26 & 0x80) == 0)
          goto LABEL_33;
        v21 += 7;
        v14 = v22++ >= 9;
        if (v14)
        {
          LODWORD(v23) = 0;
          goto LABEL_35;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_33:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v23) = 0;
LABEL_35:
      *(_DWORD *)(a1 + 32) = v23;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t TRITrialBMLTFieldsReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  void *v26;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 6)
      {
        v20 = 0;
        v21 = 0;
        v22 = 0;
        *(_BYTE *)(a1 + 28) |= 1u;
        while (1)
        {
          v23 = *v3;
          v24 = *(_QWORD *)(a2 + v23);
          if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            break;
          v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
          *(_QWORD *)(a2 + v23) = v24 + 1;
          v22 |= (unint64_t)(v25 & 0x7F) << v20;
          if ((v25 & 0x80) == 0)
            goto LABEL_34;
          v20 += 7;
          v14 = v21++ >= 9;
          if (v14)
          {
            LODWORD(v22) = 0;
            goto LABEL_36;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_34:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v22) = 0;
LABEL_36:
        *(_DWORD *)(a1 + 24) = v22;
      }
      else
      {
        if ((_DWORD)v17 == 5)
        {
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 8;
        }
        else
        {
          if ((_DWORD)v17 != 1)
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
            continue;
          }
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 16;
        }
        v26 = *(void **)(a1 + v19);
        *(_QWORD *)(a1 + v19) = v18;

      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL ArrayDefault_IsValidValue(int a1)
{
  return a1 != -72499473;
}

TRIPBFileDescriptor *TRIPBWrappersRoot_FileDescriptor()
{
  TRIPBFileDescriptor *result;

  result = (TRIPBFileDescriptor *)TRIPBWrappersRoot_FileDescriptor_descriptor;
  if (!TRIPBWrappersRoot_FileDescriptor_descriptor)
  {
    result = -[TRIPBFileDescriptor initWithPackage:objcPrefix:syntax:]([TRIPBFileDescriptor alloc], "initWithPackage:objcPrefix:syntax:", CFSTR("google.protobuf"), CFSTR("TRIPB"), 3);
    TRIPBWrappersRoot_FileDescriptor_descriptor = (uint64_t)result;
  }
  return result;
}

uint64_t TRIPBDictionaryComputeSizeInternalHelper(void *a1, uint64_t a2)
{
  unsigned int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(a2 + 8) + 30);
  v4 = (void *)objc_msgSend(a1, "keyEnumerator");
  v5 = objc_msgSend(v4, "nextObject");
  if (v5)
  {
    v6 = (void *)v5;
    v7 = 0;
    do
    {
      v8 = (void *)objc_msgSend(a1, "objectForKeyedSubscript:", v6);
      v9 = objc_msgSend(v6, "lengthOfBytesUsingEncoding:", 4);
      if (v9 >> 28)
        v10 = 5;
      else
        v10 = 4;
      if (v9 < 0x200000)
        v10 = 3;
      if (v9 < 0x4000)
        v10 = 2;
      if (v9 < 0x80)
        v10 = 1;
      v11 = v9 + v10 + ComputeDictObjectFieldSize(v8, v3) + 1;
      if (v11 >> 28)
        v12 = 5;
      else
        v12 = 4;
      if (v11 < 0x200000)
        v12 = 3;
      if (v11 < 0x4000)
        v12 = 2;
      if (v11 < 0x80)
        v12 = 1;
      v7 += v11 + v12;
      v6 = (void *)objc_msgSend(v4, "nextObject");
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }
  v13 = 8 * *(_DWORD *)(*(_QWORD *)(a2 + 8) + 16);
  if (v13 >= 0x80)
  {
    if (v13 >= 0x4000)
    {
      if (v13 >= 0x200000)
      {
        if (v13 >> 28)
          v14 = 5;
        else
          v14 = 4;
      }
      else
      {
        v14 = 3;
      }
    }
    else
    {
      v14 = 2;
    }
  }
  else
  {
    v14 = 1;
  }
  return v7 + objc_msgSend(a1, "count") * v14;
}

uint64_t ComputeDictObjectFieldSize(void *a1, unsigned int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;

  switch(a2)
  {
    case 0xDu:
      v3 = objc_msgSend(a1, "length");
      break;
    case 0xEu:
      v3 = objc_msgSend(a1, "lengthOfBytesUsingEncoding:", 4);
      break;
    case 0xFu:
      v3 = objc_msgSend(a1, "serializedSize");
      break;
    default:
      v9 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "size_t ComputeDictObjectFieldSize(id, uint32_t, TRIPBDataType)"), CFSTR("TRIPBDictionary.m"), 311, CFSTR("Unexpected type %d"), a2);
      return 0;
  }
  v4 = 1;
  v5 = 2;
  v6 = 3;
  v7 = 4;
  if (v3 >> 28)
    v7 = 5;
  if (v3 >= 0x200000)
    v6 = v7;
  if (v3 >= 0x4000)
    v5 = v6;
  if (v3 >= 0x80)
    v4 = v5;
  return v3 + v4 + 1;
}

uint64_t TRIPBDictionaryWriteToStreamInternalHelper(void *a1, void *a2, _QWORD *a3)
{
  uint64_t v6;
  unsigned int v7;
  int v8;
  void *v9;
  uint64_t result;
  void *v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  int v15;
  void *v16;

  if (objc_msgSend(a3, "mapKeyDataType") != 14)
  {
    v16 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void TRIPBDictionaryWriteToStreamInternalHelper(TRIPBCodedOutputStream *, NSDictionary *, TRIPBFieldDescriptor *)"), CFSTR("TRIPBDictionary.m"), 349, CFSTR("Unexpected key type"));
  }
  v6 = a3[1];
  v7 = *(unsigned __int8 *)(v6 + 30);
  v8 = *(_DWORD *)(v6 + 16);
  v9 = (void *)objc_msgSend(a2, "keyEnumerator");
  result = objc_msgSend(v9, "nextObject");
  if (result)
  {
    v11 = (void *)result;
    v12 = (8 * v8) | 2u;
    do
    {
      v13 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", v11);
      objc_msgSend(a1, "writeInt32NoTag:", v12);
      v14 = objc_msgSend(v11, "lengthOfBytesUsingEncoding:", 4);
      v15 = 4;
      if (v14 >> 28)
        v15 = 5;
      if (v14 < 0x200000)
        v15 = 3;
      if (v14 < 0x4000)
        v15 = 2;
      if (v14 < 0x80)
        v15 = 1;
      objc_msgSend(a1, "writeInt32NoTag:", v14 + v15 + ComputeDictObjectFieldSize(v13, v7) + 1);
      objc_msgSend(a1, "writeString:value:", 1, v11);
      WriteDictObjectField(a1, (uint64_t)v13, v7);
      result = objc_msgSend(v9, "nextObject");
      v11 = (void *)result;
    }
    while (result);
  }
  return result;
}

uint64_t WriteDictObjectField(void *a1, uint64_t a2, unsigned int a3)
{
  void *v5;

  switch(a3)
  {
    case 0xDu:
      return objc_msgSend(a1, "writeBytes:value:", 2, a2);
    case 0xEu:
      return objc_msgSend(a1, "writeString:value:", 2, a2);
    case 0xFu:
      return objc_msgSend(a1, "writeMessage:value:", 2, a2);
  }
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  return objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void WriteDictObjectField(TRIPBCodedOutputStream *, id, uint32_t, TRIPBDataType)"), CFSTR("TRIPBDictionary.m"), 324, CFSTR("Unexpected type %d"), a3);
}

BOOL TRIPBDictionaryIsInitializedInternalHelper(void *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;

  if (objc_msgSend(a2, "mapKeyDataType") != 14)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL TRIPBDictionaryIsInitializedInternalHelper(NSDictionary *, TRIPBFieldDescriptor *)"), CFSTR("TRIPBDictionary.m"), 370, CFSTR("Unexpected key type"));
  }
  if (*(_BYTE *)(a2[1] + 30) != 15)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL TRIPBDictionaryIsInitializedInternalHelper(NSDictionary *, TRIPBFieldDescriptor *)"), CFSTR("TRIPBDictionary.m"), 371, CFSTR("Unexpected value type"));
  }
  v4 = (void *)objc_msgSend(a1, "objectEnumerator");
  do
  {
    v5 = (void *)objc_msgSend(v4, "nextObject");
    v6 = v5;
  }
  while (v5 && (objc_msgSend(v5, "isInitialized") & 1) != 0);
  return v6 == 0;
}

uint64_t ComputeDictUInt32FieldSize(unsigned int a1, int a2, unsigned int a3)
{
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  if (a3 == 1)
  {
    v5 = 8 * a2;
    v6 = 6;
    v7 = 7;
    v8 = 8;
    if ((8 * a2) >> 28)
      v8 = 9;
    if (v5 >= 0x200000)
      v7 = v8;
    if (v5 >= 0x4000)
      v6 = v7;
    if (v5 >= 0x80)
      return v6;
    else
      return 5;
  }
  else if (a3 == 11)
  {
    return TRIPBComputeUInt32Size(a2, a1);
  }
  else
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "size_t ComputeDictUInt32FieldSize(uint32_t, uint32_t, TRIPBDataType)"), CFSTR("TRIPBDictionary.m"), 182, CFSTR("Unexpected type %d"), a3);
    return 0;
  }
}

uint64_t WriteDictUInt32Field(void *a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  void *v6;

  if (a4 == 1)
    return objc_msgSend(a1, "writeFixed32:value:", a3, a2);
  if (a4 == 11)
    return objc_msgSend(a1, "writeUInt32:value:", a3, a2);
  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  return objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void WriteDictUInt32Field(TRIPBCodedOutputStream *, uint32_t, uint32_t, TRIPBDataType)"), CFSTR("TRIPBDictionary.m"), 193, CFSTR("Unexpected type %d"), a4);
}

uint64_t ComputeDictInt32FieldSize(unsigned int a1, int a2, unsigned int a3)
{
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  switch(a3)
  {
    case 2u:
      v5 = 8 * a2;
      v6 = 6;
      v7 = 7;
      v8 = 8;
      if ((8 * a2) >> 28)
        v8 = 9;
      if (v5 >= 0x200000)
        v7 = v8;
      if (v5 >= 0x4000)
        v6 = v7;
      if (v5 >= 0x80)
        return v6;
      else
        return 5;
    case 9u:
      return TRIPBComputeSInt32Size(a2, a1);
    case 7u:
      return TRIPBComputeInt32Size(a2, a1);
    default:
      v9 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "size_t ComputeDictInt32FieldSize(int32_t, uint32_t, TRIPBDataType)"), CFSTR("TRIPBDictionary.m"), 159, CFSTR("Unexpected type %d"), a3);
      return 0;
  }
}

uint64_t WriteDictInt32Field(void *a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  void *v6;

  switch(a4)
  {
    case 2u:
      return objc_msgSend(a1, "writeSFixed32:value:", a3, a2);
    case 9u:
      return objc_msgSend(a1, "writeSInt32:value:", a3, a2);
    case 7u:
      return objc_msgSend(a1, "writeInt32:value:", a3, a2);
  }
  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  return objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void WriteDictInt32Field(TRIPBCodedOutputStream *, int32_t, uint32_t, TRIPBDataType)"), CFSTR("TRIPBDictionary.m"), 172, CFSTR("Unexpected type %d"), a4);
}

uint64_t ComputeDictUInt64FieldSize(unint64_t a1, int a2, unsigned int a3)
{
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  if (a3 == 4)
  {
    v10 = 8 * a2;
    v11 = 10;
    v12 = 11;
    v13 = 12;
    if ((8 * a2) >> 28)
      v13 = 13;
    if (v10 >= 0x200000)
      v12 = v13;
    if (v10 >= 0x4000)
      v11 = v12;
    if (v10 >= 0x80)
      return v11;
    else
      return 9;
  }
  else if (a3 == 12)
  {
    v4 = 8 * a2;
    v5 = 2;
    v6 = 3;
    v7 = 4;
    if ((8 * a2) >> 28)
      v7 = 5;
    if (v4 >= 0x200000)
      v6 = v7;
    if (v4 >= 0x4000)
      v5 = v6;
    if (v4 >= 0x80)
      v8 = v5;
    else
      v8 = 1;
    return TRIPBComputeRawVarint64Size(a1) + v8;
  }
  else
  {
    v14 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "size_t ComputeDictUInt64FieldSize(uint64_t, uint32_t, TRIPBDataType)"), CFSTR("TRIPBDictionary.m"), 228, CFSTR("Unexpected type %d"), a3);
    return 0;
  }
}

uint64_t WriteDictUInt64Field(void *a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  void *v6;

  if (a4 == 4)
    return objc_msgSend(a1, "writeFixed64:value:", a3, a2);
  if (a4 == 12)
    return objc_msgSend(a1, "writeUInt64:value:", a3, a2);
  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  return objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void WriteDictUInt64Field(TRIPBCodedOutputStream *, uint64_t, uint32_t, TRIPBDataType)"), CFSTR("TRIPBDictionary.m"), 239, CFSTR("Unexpected type %d"), a4);
}

uint64_t ComputeDictInt64FieldSize(unint64_t a1, int a2, unsigned int a3)
{
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  switch(a3)
  {
    case 5u:
      v10 = 8 * a2;
      v11 = 10;
      v12 = 11;
      v13 = 12;
      if ((8 * a2) >> 28)
        v13 = 13;
      if (v10 >= 0x200000)
        v12 = v13;
      if (v10 >= 0x4000)
        v11 = v12;
      if (v10 >= 0x80)
        return v11;
      else
        return 9;
    case 0xAu:
      return TRIPBComputeSInt64Size(a2, a1);
    case 8u:
      v4 = 8 * a2;
      v5 = 2;
      v6 = 3;
      v7 = 4;
      if ((8 * a2) >> 28)
        v7 = 5;
      if (v4 >= 0x200000)
        v6 = v7;
      if (v4 >= 0x4000)
        v5 = v6;
      if (v4 >= 0x80)
        v8 = v5;
      else
        v8 = 1;
      return TRIPBComputeRawVarint64Size(a1) + v8;
    default:
      v14 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "size_t ComputeDictInt64FieldSize(int64_t, uint32_t, TRIPBDataType)"), CFSTR("TRIPBDictionary.m"), 205, CFSTR("Unexpected type %d"), a3);
      return 0;
  }
}

uint64_t WriteDictInt64Field(void *a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  void *v6;

  switch(a4)
  {
    case 5u:
      return objc_msgSend(a1, "writeSFixed64:value:", a3, a2);
    case 0xAu:
      return objc_msgSend(a1, "writeSInt64:value:", a3, a2);
    case 8u:
      return objc_msgSend(a1, "writeInt64:value:", a3, a2);
  }
  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  return objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void WriteDictInt64Field(TRIPBCodedOutputStream *, int64_t, uint32_t, TRIPBDataType)"), CFSTR("TRIPBDictionary.m"), 218, CFSTR("Unexpected type %d"), a4);
}

uint64_t ComputeDictBoolFieldSize(int a1, unsigned int a2)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v9;

  if (a2)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "size_t ComputeDictBoolFieldSize(BOOL, uint32_t, TRIPBDataType)"), CFSTR("TRIPBDictionary.m"), 244, CFSTR("bad type: %d"), a2);
  }
  v3 = 8 * a1;
  v4 = 3;
  v5 = 4;
  v6 = 5;
  if ((8 * a1) >> 28)
    v6 = 6;
  if (v3 >= 0x200000)
    v5 = v6;
  if (v3 >= 0x4000)
    v4 = v5;
  if (v3 >= 0x80)
    return v4;
  else
    return 2;
}

uint64_t WriteDictBoolField(void *a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  void *v9;

  if (a4)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void WriteDictBoolField(TRIPBCodedOutputStream *, BOOL, uint32_t, TRIPBDataType)"), CFSTR("TRIPBDictionary.m"), 250, CFSTR("bad type: %d"), a4);
  }
  return objc_msgSend(a1, "writeBool:value:", a3, a2);
}

uint64_t ComputeDictFloatFieldSize(unsigned int a1)
{
  void *v3;

  if (a1 != 3)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "size_t ComputeDictFloatFieldSize(float, uint32_t, TRIPBDataType)"), CFSTR("TRIPBDictionary.m"), 268, CFSTR("bad type: %d"), a1);
  }
  return 5;
}

uint64_t WriteDictFloatField(void *a1, unsigned int a2, double a3)
{
  int v3;
  void *v7;

  v3 = LODWORD(a3);
  if (a2 != 3)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void WriteDictFloatField(TRIPBCodedOutputStream *, float, uint32_t, TRIPBDataType)"), CFSTR("TRIPBDictionary.m"), 274, CFSTR("bad type: %d"), a2);
  }
  LODWORD(a3) = v3;
  return objc_msgSend(a1, "writeFloat:value:", 2, a3);
}

uint64_t ComputeDictDoubleFieldSize(unsigned int a1)
{
  void *v3;

  if (a1 != 6)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "size_t ComputeDictDoubleFieldSize(double, uint32_t, TRIPBDataType)"), CFSTR("TRIPBDictionary.m"), 280, CFSTR("bad type: %d"), a1);
  }
  return 9;
}

uint64_t WriteDictDoubleField(void *a1, unsigned int a2, double a3)
{
  void *v7;

  if (a2 != 6)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void WriteDictDoubleField(TRIPBCodedOutputStream *, double, uint32_t, TRIPBDataType)"), CFSTR("TRIPBDictionary.m"), 286, CFSTR("bad type: %d"), a2);
  }
  return objc_msgSend(a1, "writeDouble:value:", 2, a3);
}

BOOL DictDefault_IsValidValue(int a1)
{
  return a1 != -72499473;
}

uint64_t ComputeDictEnumFieldSize(unsigned int a1, unsigned int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v8;

  if (a2 != 17)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "size_t ComputeDictEnumFieldSize(int32_t, uint32_t, TRIPBDataType)"), CFSTR("TRIPBDictionary.m"), 256, CFSTR("bad type: %d"), a2);
  }
  v3 = 3;
  v4 = 4;
  v5 = 5;
  if (a1 >> 28)
    v5 = 6;
  if (a1 >= 0x200000)
    v4 = v5;
  if (a1 >= 0x4000)
    v3 = v4;
  if (a1 >= 0x80)
    return v3;
  else
    return 2;
}

uint64_t WriteDictEnumField(void *a1, uint64_t a2, unsigned int a3)
{
  void *v7;

  if (a3 != 17)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void WriteDictEnumField(TRIPBCodedOutputStream *, int32_t, uint32_t, TRIPBDataType)"), CFSTR("TRIPBDictionary.m"), 262, CFSTR("bad type: %d"), a3);
  }
  return objc_msgSend(a1, "writeEnum:value:", 2, a2);
}

uint64_t ComputeDictStringFieldSize(void *a1, unsigned int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v10;

  if (a2 != 14)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "size_t ComputeDictStringFieldSize(NSString *, uint32_t, TRIPBDataType)"), CFSTR("TRIPBDictionary.m"), 292, CFSTR("bad type: %d"), a2);
  }
  v3 = objc_msgSend(a1, "lengthOfBytesUsingEncoding:", 4);
  v4 = 1;
  v5 = 2;
  v6 = 3;
  v7 = 4;
  if (v3 >> 28)
    v7 = 5;
  if (v3 >= 0x200000)
    v6 = v7;
  if (v3 >= 0x4000)
    v5 = v6;
  if (v3 >= 0x80)
    v4 = v5;
  return v3 + v4 + 1;
}

uint64_t WriteDictStringField(void *a1, uint64_t a2, unsigned int a3)
{
  void *v7;

  if (a3 != 14)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void WriteDictStringField(TRIPBCodedOutputStream *, NSString *, uint32_t, TRIPBDataType)"), CFSTR("TRIPBDictionary.m"), 298, CFSTR("bad type: %d"), a3);
  }
  return objc_msgSend(a1, "writeString:value:", 1, a2);
}

BOOL TRIDenormalizedEventReadFrom(id *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  TRISubject *v17;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v17 = objc_alloc_init(TRISubject);
        objc_storeStrong(a1 + 3, v17);
        if (PBReaderPlaceMark() && (TRISubjectReadFrom((uint64_t)v17, a2) & 1) != 0)
          goto LABEL_41;
        goto LABEL_45;
      case 2u:
        v17 = objc_alloc_init(TRILogTreatment);
        objc_msgSend(a1, "addTreatment:", v17);
        if (!PBReaderPlaceMark() || (TRILogTreatmentReadFrom((uint64_t)v17, a2) & 1) == 0)
          goto LABEL_45;
        goto LABEL_41;
      case 3u:
        v17 = objc_alloc_init(TRISystemDimensions);
        objc_storeStrong(a1 + 4, v17);
        if (!PBReaderPlaceMark() || (TRISystemDimensionsReadFrom(v17, a2) & 1) == 0)
          goto LABEL_45;
        goto LABEL_41;
      case 4u:
        v17 = objc_alloc_init(TRIUserDimension);
        objc_msgSend(a1, "addUserDimension:", v17);
        if (!PBReaderPlaceMark() || !TRIUserDimensionReadFrom((uint64_t)v17, a2))
          goto LABEL_45;
        goto LABEL_41;
      case 5u:
        v17 = objc_alloc_init(TRIMetric);
        objc_msgSend(a1, "addMetric:", v17);
        if (!PBReaderPlaceMark() || (TRIMetricReadFrom((uint64_t)v17, a2) & 1) == 0)
          goto LABEL_45;
        goto LABEL_41;
      case 6u:
        v17 = objc_alloc_init(TRITrialSystemTelemetry);
        objc_storeStrong(a1 + 6, v17);
        if (!PBReaderPlaceMark() || (TRITrialSystemTelemetryReadFrom((uint64_t)v17, a2) & 1) == 0)
          goto LABEL_45;
        goto LABEL_41;
      case 7u:
        v17 = objc_alloc_init(TRIMLRuntimeDimensions);
        objc_storeStrong(a1 + 2, v17);
        if (PBReaderPlaceMark() && TRIMLRuntimeDimensionsReadFrom((uint64_t)v17, a2))
        {
LABEL_41:
          PBReaderRecallMark();

LABEL_42:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_45:

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_42;
    }
  }
}

TRIPBFileDescriptor *TRITripushNotificationRoot_FileDescriptor()
{
  TRIPBFileDescriptor *result;

  result = (TRIPBFileDescriptor *)TRITripushNotificationRoot_FileDescriptor_descriptor;
  if (!TRITripushNotificationRoot_FileDescriptor_descriptor)
  {
    result = -[TRIPBFileDescriptor initWithPackage:objcPrefix:syntax:]([TRIPBFileDescriptor alloc], "initWithPackage:objcPrefix:syntax:", CFSTR("TRI"), CFSTR("TRI"), 2);
    TRITripushNotificationRoot_FileDescriptor_descriptor = (uint64_t)result;
  }
  return result;
}

uint64_t TRIPushNotification_ClearNotificationOneOfCase(void *a1)
{
  return TRIPBMaybeClearOneof((uint64_t)a1, (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "descriptor"), "oneofs"), "objectAtIndex:", 0), 0xFFFFFFFFLL, 0);
}

unint64_t TRINotificationProcessingPolicy_AssetDownloadPolicy_EnumDescriptor()
{
  id v1;

  if (!atomic_load(&TRINotificationProcessingPolicy_AssetDownloadPolicy_EnumDescriptor_descriptor))
  {
    v1 = +[TRIPBEnumDescriptor allocDescriptorForName:valueNames:values:count:enumVerifier:](TRIPBEnumDescriptor, "allocDescriptorForName:valueNames:values:count:enumVerifier:", CFSTR("TRINotificationProcessingPolicy_AssetDownloadPolicy"), "UnknownDownloadPolicy", &TRINotificationProcessingPolicy_AssetDownloadPolicy_EnumDescriptor_values, 3, TRINotificationProcessingPolicy_AssetDownloadPolicy_IsValidValue);
    while (!__ldaxr(&TRINotificationProcessingPolicy_AssetDownloadPolicy_EnumDescriptor_descriptor))
    {
      if (!__stlxr((unint64_t)v1, &TRINotificationProcessingPolicy_AssetDownloadPolicy_EnumDescriptor_descriptor))return atomic_load(&TRINotificationProcessingPolicy_AssetDownloadPolicy_EnumDescriptor_descriptor);
    }
    __clrex();

  }
  return atomic_load(&TRINotificationProcessingPolicy_AssetDownloadPolicy_EnumDescriptor_descriptor);
}

BOOL TRINotificationProcessingPolicy_AssetDownloadPolicy_IsValidValue(unsigned int a1)
{
  return a1 < 3;
}

BOOL TRIPopulationReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v6;
  int v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v15;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  v6 = (int *)MEMORY[0x1E0D82BB8];
  while (1)
  {
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
      return v7 == 0;
    if (*(_BYTE *)(a2 + *v5))
    {
      v7 = 1;
      return v7 == 0;
    }
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      LOBYTE(v10) = 0;
LABEL_14:
    if (v7)
      v15 = 1;
    else
      v15 = (v10 & 7) == 4;
    if (v15)
      return v7 == 0;
    if ((PBReaderSkipValueWithTag() & 1) == 0)
      return 0;
  }
}

BOOL TRIUserDimensionReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 8;
LABEL_22:
        v19 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_24:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 16;
    goto LABEL_22;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t TRISystemDimensionsReadFrom(_DWORD *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  unint64_t v7;
  unint64_t v8;
  int *v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  BOOL v16;
  int v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  unint64_t v34;
  unint64_t v35;
  void *v36;
  char v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  char v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  void *v49;
  char v50;
  unsigned int v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  BOOL v56;
  uint64_t v57;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = 0x1EE24E000uLL;
    v8 = 0x1EE24E000uLL;
    v9 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      while (1)
      {
        v13 = *v3;
        v14 = *(_QWORD *)(a2 + v13);
        if (v14 == -1 || v14 >= *(_QWORD *)(a2 + *v4))
          break;
        v15 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v14);
        *(_QWORD *)(a2 + v13) = v14 + 1;
        v12 |= (unint64_t)(v15 & 0x7F) << v10;
        if ((v15 & 0x80) == 0)
          goto LABEL_12;
        v10 += 7;
        v16 = v11++ >= 9;
        if (v16)
        {
          v12 = 0;
          v17 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v17 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v12 = 0;
LABEL_14:
      if (v17 || (v12 & 7) == 4)
        break;
      switch((v12 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = *(int *)(v7 + 1624);
          goto LABEL_61;
        case 2u:
          v22 = 0;
          v23 = 0;
          v24 = 0;
          *((_BYTE *)a1 + *(int *)(v8 + 1628)) |= 0x10u;
          while (2)
          {
            v25 = *v3;
            v26 = *(_QWORD *)(a2 + v25);
            if (v26 == -1 || v26 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v27 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v26);
              *(_QWORD *)(a2 + v25) = v26 + 1;
              v24 |= (unint64_t)(v27 & 0x7F) << v22;
              if (v27 < 0)
              {
                v22 += 7;
                v16 = v23++ >= 9;
                if (v16)
                {
                  v24 = 0;
                  goto LABEL_72;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v24 = 0;
LABEL_72:
          v56 = v24 != 0;
          v57 = 99;
          goto LABEL_89;
        case 3u:
          v28 = 0;
          v29 = 0;
          v30 = 0;
          *((_BYTE *)a1 + *(int *)(v8 + 1628)) |= 8u;
          while (2)
          {
            v31 = *v3;
            v32 = *(_QWORD *)(a2 + v31);
            if (v32 == -1 || v32 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v33 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v32);
              *(_QWORD *)(a2 + v31) = v32 + 1;
              v30 |= (unint64_t)(v33 & 0x7F) << v28;
              if (v33 < 0)
              {
                v28 += 7;
                v16 = v29++ >= 9;
                if (v16)
                {
                  v30 = 0;
                  goto LABEL_76;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v30 = 0;
LABEL_76:
          v56 = v30 != 0;
          v57 = 98;
          goto LABEL_89;
        case 4u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 88;
          goto LABEL_61;
        case 5u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 40;
          goto LABEL_61;
        case 6u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 72;
          goto LABEL_61;
        case 7u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 80;
          goto LABEL_61;
        case 8u:
          v34 = v8;
          v35 = v7;
          PBReaderReadString();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (v36)
            objc_msgSend(a1, "addUserKeyboardEnabledInputModeIdentifiers:", v36);

          v7 = v35;
          v8 = v34;
          continue;
        case 9u:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 64;
          goto LABEL_61;
        case 0xAu:
          v37 = 0;
          v38 = 0;
          v39 = 0;
          *((_BYTE *)a1 + *(int *)(v8 + 1628)) |= 1u;
          while (2)
          {
            v40 = *v3;
            v41 = *(_QWORD *)(a2 + v40);
            if (v41 == -1 || v41 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v42 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v41);
              *(_QWORD *)(a2 + v40) = v41 + 1;
              v39 |= (unint64_t)(v42 & 0x7F) << v37;
              if (v42 < 0)
              {
                v37 += 7;
                v16 = v38++ >= 9;
                if (v16)
                {
                  LODWORD(v39) = 0;
                  goto LABEL_80;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v39) = 0;
LABEL_80:
          a1[12] = v39;
          continue;
        case 0xBu:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 24;
          goto LABEL_61;
        case 0xCu:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 16;
          goto LABEL_61;
        case 0xDu:
          v43 = 0;
          v44 = 0;
          v45 = 0;
          *((_BYTE *)a1 + *(int *)(v8 + 1628)) |= 2u;
          while (2)
          {
            v46 = *v3;
            v47 = *(_QWORD *)(a2 + v46);
            if (v47 == -1 || v47 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v48 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v47);
              *(_QWORD *)(a2 + v46) = v47 + 1;
              v45 |= (unint64_t)(v48 & 0x7F) << v43;
              if (v48 < 0)
              {
                v43 += 7;
                v16 = v44++ >= 9;
                if (v16)
                {
                  v45 = 0;
                  goto LABEL_84;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v45 = 0;
LABEL_84:
          v56 = v45 != 0;
          v57 = 96;
          goto LABEL_89;
        case 0xEu:
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 8;
LABEL_61:
          v49 = *(void **)((char *)a1 + v20);
          *(_QWORD *)((char *)a1 + v20) = v19;

          continue;
        case 0xFu:
          v50 = 0;
          v51 = 0;
          v52 = 0;
          *((_BYTE *)a1 + *(int *)(v8 + 1628)) |= 4u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v53 = *v3;
        v54 = *(_QWORD *)(a2 + v53);
        if (v54 == -1 || v54 >= *(_QWORD *)(a2 + *v4))
          break;
        v55 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v54);
        *(_QWORD *)(a2 + v53) = v54 + 1;
        v52 |= (unint64_t)(v55 & 0x7F) << v50;
        if ((v55 & 0x80) == 0)
          goto LABEL_86;
        v50 += 7;
        v16 = v51++ >= 9;
        if (v16)
        {
          v52 = 0;
          goto LABEL_88;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_86:
      if (*(_BYTE *)(a2 + *v5))
        v52 = 0;
LABEL_88:
      v56 = v52 != 0;
      v57 = 97;
LABEL_89:
      *((_BYTE *)a1 + v57) = v56;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

unint64_t TRIDeploymentEnvironment_EnumDescriptor()
{
  id v1;

  if (!atomic_load(&TRIDeploymentEnvironment_EnumDescriptor_descriptor))
  {
    v1 = +[TRIPBEnumDescriptor allocDescriptorForName:valueNames:values:count:enumVerifier:](TRIPBEnumDescriptor, "allocDescriptorForName:valueNames:values:count:enumVerifier:", CFSTR("TRIDeploymentEnvironment"), "DeploymentEnvironmentDevice", &TRIDeploymentEnvironment_EnumDescriptor_values, 4, TRIDeploymentEnvironment_IsValidValue);
    while (!__ldaxr(&TRIDeploymentEnvironment_EnumDescriptor_descriptor))
    {
      if (!__stlxr((unint64_t)v1, &TRIDeploymentEnvironment_EnumDescriptor_descriptor))
        return atomic_load(&TRIDeploymentEnvironment_EnumDescriptor_descriptor);
    }
    __clrex();

  }
  return atomic_load(&TRIDeploymentEnvironment_EnumDescriptor_descriptor);
}

BOOL TRIDeploymentEnvironment_IsValidValue(unsigned int a1)
{
  return a1 < 4;
}

uint64_t TRIPBWriteRawLittleEndian64(uint64_t result, uint64_t a2)
{
  uint64_t *v3;
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

  v3 = (uint64_t *)result;
  v4 = *(_QWORD *)(result + 16);
  if (v4 == *(_QWORD *)(result + 8))
  {
    result = TRIPBRefreshBuffer(result);
    v4 = v3[2];
  }
  v5 = *v3;
  v3[2] = v4 + 1;
  *(_BYTE *)(v5 + v4) = a2;
  v6 = v3[2];
  if (v6 == v3[1])
  {
    result = TRIPBRefreshBuffer((uint64_t)v3);
    v6 = v3[2];
  }
  v7 = *v3;
  v3[2] = v6 + 1;
  *(_BYTE *)(v7 + v6) = BYTE1(a2);
  v8 = v3[2];
  if (v8 == v3[1])
  {
    result = TRIPBRefreshBuffer((uint64_t)v3);
    v8 = v3[2];
  }
  v9 = *v3;
  v3[2] = v8 + 1;
  *(_BYTE *)(v9 + v8) = BYTE2(a2);
  v10 = v3[2];
  if (v10 == v3[1])
  {
    result = TRIPBRefreshBuffer((uint64_t)v3);
    v10 = v3[2];
  }
  v11 = *v3;
  v3[2] = v10 + 1;
  *(_BYTE *)(v11 + v10) = BYTE3(a2);
  v12 = v3[2];
  if (v12 == v3[1])
  {
    result = TRIPBRefreshBuffer((uint64_t)v3);
    v12 = v3[2];
  }
  v13 = *v3;
  v3[2] = v12 + 1;
  *(_BYTE *)(v13 + v12) = BYTE4(a2);
  v14 = v3[2];
  if (v14 == v3[1])
  {
    result = TRIPBRefreshBuffer((uint64_t)v3);
    v14 = v3[2];
  }
  v15 = *v3;
  v3[2] = v14 + 1;
  *(_BYTE *)(v15 + v14) = BYTE5(a2);
  v16 = v3[2];
  if (v16 == v3[1])
  {
    result = TRIPBRefreshBuffer((uint64_t)v3);
    v16 = v3[2];
  }
  v17 = *v3;
  v3[2] = v16 + 1;
  *(_BYTE *)(v17 + v16) = BYTE6(a2);
  v18 = v3[2];
  if (v18 == v3[1])
  {
    result = TRIPBRefreshBuffer((uint64_t)v3);
    v18 = v3[2];
  }
  v19 = *v3;
  v3[2] = v18 + 1;
  *(_BYTE *)(v19 + v18) = HIBYTE(a2);
  return result;
}

uint64_t TRIPBWriteRawLittleEndian32(uint64_t result, int a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = (uint64_t *)result;
  v4 = *(_QWORD *)(result + 16);
  if (v4 == *(_QWORD *)(result + 8))
  {
    result = TRIPBRefreshBuffer(result);
    v4 = v3[2];
  }
  v5 = *v3;
  v3[2] = v4 + 1;
  *(_BYTE *)(v5 + v4) = a2;
  v6 = v3[2];
  if (v6 == v3[1])
  {
    result = TRIPBRefreshBuffer((uint64_t)v3);
    v6 = v3[2];
  }
  v7 = *v3;
  v3[2] = v6 + 1;
  *(_BYTE *)(v7 + v6) = BYTE1(a2);
  v8 = v3[2];
  if (v8 == v3[1])
  {
    result = TRIPBRefreshBuffer((uint64_t)v3);
    v8 = v3[2];
  }
  v9 = *v3;
  v3[2] = v8 + 1;
  *(_BYTE *)(v9 + v8) = BYTE2(a2);
  v10 = v3[2];
  if (v10 == v3[1])
  {
    result = TRIPBRefreshBuffer((uint64_t)v3);
    v10 = v3[2];
  }
  v11 = *v3;
  v3[2] = v10 + 1;
  *(_BYTE *)(v11 + v10) = HIBYTE(a2);
  return result;
}

uint64_t TRIPBWriteRawVarint64(uint64_t result, unint64_t a2)
{
  unint64_t v2;
  uint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  v3 = (uint64_t *)result;
  if (a2 >= 0x80)
  {
    do
    {
      v5 = v3[2];
      if (v5 == v3[1])
      {
        result = TRIPBRefreshBuffer((uint64_t)v3);
        v5 = v3[2];
      }
      v6 = *v3;
      v3[2] = v5 + 1;
      *(_BYTE *)(v6 + v5) = v2 | 0x80;
      v4 = v2 >> 7;
      v7 = v2 >= 0x4000;
      v2 >>= 7;
    }
    while (v7);
  }
  else
  {
    LOBYTE(v4) = a2;
  }
  v8 = v3[2];
  if (v8 == v3[1])
  {
    result = TRIPBRefreshBuffer((uint64_t)v3);
    v8 = v3[2];
  }
  v9 = *v3;
  v3[2] = v8 + 1;
  *(_BYTE *)(v9 + v8) = v4;
  return result;
}

uint64_t TRIPBWriteInt32NoTag(uint64_t result, unsigned int a2)
{
  if ((a2 & 0x80000000) != 0)
    return TRIPBWriteRawVarint64(result, (int)a2);
  else
    return TRIPBWriteRawVarint32(result, a2);
}

uint64_t TRIPBWriteRawVarint32(uint64_t result, unsigned int a2)
{
  unsigned int v2;
  uint64_t *v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  v3 = (uint64_t *)result;
  if (a2 >= 0x80)
  {
    do
    {
      v5 = v3[2];
      if (v5 == v3[1])
      {
        result = TRIPBRefreshBuffer((uint64_t)v3);
        v5 = v3[2];
      }
      v6 = *v3;
      v3[2] = v5 + 1;
      *(_BYTE *)(v6 + v5) = v2 | 0x80;
      v4 = v2 >> 7;
      v7 = v2 >= 0x4000;
      v2 >>= 7;
    }
    while (v7);
  }
  else
  {
    LOBYTE(v4) = a2;
  }
  v8 = v3[2];
  if (v8 == v3[1])
  {
    result = TRIPBRefreshBuffer((uint64_t)v3);
    v8 = v3[2];
  }
  v9 = *v3;
  v3[2] = v8 + 1;
  *(_BYTE *)(v9 + v8) = v4;
  return result;
}

void sub_192195400(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t TRIPBComputeDoubleSizeNoTag()
{
  return 8;
}

void sub_192195594(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t TRIPBComputeFloatSizeNoTag()
{
  return 4;
}

void sub_192195728(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1921958E0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_192195A98(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t TRIPBComputeInt32SizeNoTag(unsigned int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = 1;
  v2 = 2;
  v3 = 3;
  v4 = 4;
  if (a1 >> 28)
    v4 = 5;
  if (a1 >= 0x200000)
    v3 = v4;
  if (a1 >= 0x4000)
    v2 = v3;
  if (a1 >= 0x80)
    v1 = v2;
  if ((a1 & 0x80000000) == 0)
    return v1;
  else
    return 10;
}

void sub_192195CB0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t TRIPBComputeUInt32SizeNoTag(unsigned int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = 2;
  v2 = 3;
  v3 = 4;
  if (a1 >> 28)
    v3 = 5;
  if (a1 >= 0x200000)
    v2 = v3;
  if (a1 >= 0x4000)
    v1 = v2;
  if (a1 >= 0x80)
    return v1;
  else
    return 1;
}

void sub_192195EB0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t TRIPBComputeFixed64SizeNoTag()
{
  return 8;
}

void sub_19219604C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t TRIPBComputeFixed32SizeNoTag()
{
  return 4;
}

void sub_1921961E8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t TRIPBComputeSInt32SizeNoTag(int a1)
{
  unsigned int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = (2 * a1) ^ (a1 >> 31);
  v2 = 2;
  v3 = 3;
  v4 = 4;
  if (v1 >> 28)
    v4 = 5;
  if (v1 >= 0x200000)
    v3 = v4;
  if (v1 >= 0x4000)
    v2 = v3;
  if (v1 >= 0x80)
    return v2;
  else
    return 1;
}

void sub_1921963F8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t TRIPBComputeSInt64SizeNoTag(uint64_t a1)
{
  return TRIPBComputeRawVarint64Size((2 * a1) ^ (a1 >> 63));
}

void sub_1921965BC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t TRIPBComputeSFixed64SizeNoTag()
{
  return 8;
}

void sub_192196758(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t TRIPBComputeSFixed32SizeNoTag()
{
  return 4;
}

void sub_1921968F4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t TRIPBComputeBoolSizeNoTag()
{
  return 1;
}

void sub_192196A90(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t TRIPBComputeEnumSizeNoTag(unsigned int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = 2;
  v2 = 3;
  v3 = 4;
  if (a1 >> 28)
    v3 = 5;
  if (a1 >= 0x200000)
    v2 = v3;
  if (a1 >= 0x4000)
    v1 = v2;
  if (a1 >= 0x80)
    return v1;
  else
    return 1;
}

uint64_t TRIPBRefreshBuffer(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if (!*(_QWORD *)(result + 24))
    result = objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("OutOfSpace"), &stru_1E2E9CC90);
  if (*(_QWORD *)(v1 + 16))
  {
    result = objc_msgSend(*(id *)(v1 + 24), "write:maxLength:", *(_QWORD *)v1);
    if (result != *(_QWORD *)(v1 + 16))
      result = objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("WriteFailed"), &stru_1E2E9CC90);
    *(_QWORD *)(v1 + 16) = 0;
  }
  return result;
}

uint64_t TRIPBComputeRawVarint64Size(unint64_t a1)
{
  uint64_t v2;

  if (a1 < 0x80)
    return 1;
  if (a1 < 0x4000)
    return 2;
  if (a1 < 0x200000)
    return 3;
  if (!(a1 >> 28))
    return 4;
  if (!(a1 >> 35))
    return 5;
  if (!(a1 >> 42))
    return 6;
  if (!(a1 >> 49))
    return 7;
  v2 = 9;
  if ((a1 & 0x8000000000000000) != 0)
    v2 = 10;
  if (HIBYTE(a1))
    return v2;
  else
    return 8;
}

uint64_t TRIPBComputeRawVarint32Size(unsigned int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = 2;
  v2 = 3;
  v3 = 4;
  if (a1 >> 28)
    v3 = 5;
  if (a1 >= 0x200000)
    v2 = v3;
  if (a1 >= 0x4000)
    v1 = v2;
  if (a1 >= 0x80)
    return v1;
  else
    return 1;
}

uint64_t TRIPBComputeSizeTSizeAsInt32NoTag(unsigned int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = 1;
  v2 = 2;
  v3 = 3;
  v4 = 4;
  if (a1 >> 28)
    v4 = 5;
  if (a1 >= 0x200000)
    v3 = v4;
  if (a1 >= 0x4000)
    v2 = v3;
  if (a1 >= 0x80)
    v1 = v2;
  if ((a1 & 0x80000000) == 0)
    return v1;
  else
    return 10;
}

uint64_t TRIPBComputeStringSizeNoTag(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = objc_msgSend(a1, "lengthOfBytesUsingEncoding:", 4);
  v2 = 1;
  v3 = 2;
  v4 = 3;
  v5 = 4;
  if (v1 >> 28)
    v5 = 5;
  if (v1 >= 0x200000)
    v4 = v5;
  if (v1 >= 0x4000)
    v3 = v4;
  if (v1 >= 0x80)
    v2 = v3;
  return v2 + v1;
}

uint64_t TRIPBComputeRawVarint32SizeForInteger(unsigned int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = 2;
  v2 = 3;
  v3 = 4;
  if (a1 >> 28)
    v3 = 5;
  if (a1 >= 0x200000)
    v2 = v3;
  if (a1 >= 0x4000)
    v1 = v2;
  if (a1 >= 0x80)
    return v1;
  else
    return 1;
}

uint64_t TRIPBComputeMessageSizeNoTag(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = objc_msgSend(a1, "serializedSize");
  v2 = 1;
  v3 = 2;
  v4 = 3;
  v5 = 4;
  if (v1 >> 28)
    v5 = 5;
  if (v1 >= 0x200000)
    v4 = v5;
  if (v1 >= 0x4000)
    v3 = v4;
  if (v1 >= 0x80)
    v2 = v3;
  return v2 + v1;
}

uint64_t TRIPBComputeBytesSizeNoTag(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = objc_msgSend(a1, "length");
  v2 = 1;
  v3 = 2;
  v4 = 3;
  v5 = 4;
  if (v1 >> 28)
    v5 = 5;
  if (v1 >= 0x200000)
    v4 = v5;
  if (v1 >= 0x4000)
    v3 = v4;
  if (v1 >= 0x80)
    v2 = v3;
  return v2 + v1;
}

uint64_t TRIPBComputeDoubleSize(int a1)
{
  unsigned int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = 8 * a1;
  v2 = 10;
  v3 = 11;
  v4 = 12;
  if ((8 * a1) >> 28)
    v4 = 13;
  if (v1 >= 0x200000)
    v3 = v4;
  if (v1 >= 0x4000)
    v2 = v3;
  if (v1 >= 0x80)
    return v2;
  else
    return 9;
}

uint64_t TRIPBComputeTagSize(int a1)
{
  unsigned int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = 8 * a1;
  v2 = 2;
  v3 = 3;
  v4 = 4;
  if ((8 * a1) >> 28)
    v4 = 5;
  if (v1 >= 0x200000)
    v3 = v4;
  if (v1 >= 0x4000)
    v2 = v3;
  if (v1 >= 0x80)
    return v2;
  else
    return 1;
}

uint64_t TRIPBComputeFloatSize(int a1)
{
  unsigned int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = 8 * a1;
  v2 = 6;
  v3 = 7;
  v4 = 8;
  if ((8 * a1) >> 28)
    v4 = 9;
  if (v1 >= 0x200000)
    v3 = v4;
  if (v1 >= 0x4000)
    v2 = v3;
  if (v1 >= 0x80)
    return v2;
  else
    return 5;
}

uint64_t TRIPBComputeUInt64Size(int a1, unint64_t a2)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = 8 * a1;
  v3 = 2;
  v4 = 3;
  v5 = 4;
  if ((8 * a1) >> 28)
    v5 = 5;
  if (v2 >= 0x200000)
    v4 = v5;
  if (v2 >= 0x4000)
    v3 = v4;
  if (v2 >= 0x80)
    v6 = v3;
  else
    v6 = 1;
  return TRIPBComputeRawVarint64Size(a2) + v6;
}

uint64_t TRIPBComputeInt64Size(int a1, unint64_t a2)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = 8 * a1;
  v3 = 2;
  v4 = 3;
  v5 = 4;
  if ((8 * a1) >> 28)
    v5 = 5;
  if (v2 >= 0x200000)
    v4 = v5;
  if (v2 >= 0x4000)
    v3 = v4;
  if (v2 >= 0x80)
    v6 = v3;
  else
    v6 = 1;
  return TRIPBComputeRawVarint64Size(a2) + v6;
}

uint64_t TRIPBComputeInt32Size(int a1, unsigned int a2)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = 8 * a1;
  v3 = 2;
  v4 = 3;
  v5 = 4;
  if ((8 * a1) >> 28)
    v5 = 5;
  if (v2 >= 0x200000)
    v4 = v5;
  if (v2 >= 0x4000)
    v3 = v4;
  if (v2 >= 0x80)
    v6 = v3;
  else
    v6 = 1;
  v7 = 10;
  v8 = 1;
  v9 = 2;
  v10 = 3;
  v11 = 4;
  if (a2 >> 28)
    v11 = 5;
  if (a2 >= 0x200000)
    v10 = v11;
  if (a2 >= 0x4000)
    v9 = v10;
  if (a2 >= 0x80)
    v8 = v9;
  if ((a2 & 0x80000000) == 0)
    v7 = v8;
  return v7 + v6;
}

uint64_t TRIPBComputeFixed64Size(int a1)
{
  unsigned int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = 8 * a1;
  v2 = 10;
  v3 = 11;
  v4 = 12;
  if ((8 * a1) >> 28)
    v4 = 13;
  if (v1 >= 0x200000)
    v3 = v4;
  if (v1 >= 0x4000)
    v2 = v3;
  if (v1 >= 0x80)
    return v2;
  else
    return 9;
}

uint64_t TRIPBComputeFixed32Size(int a1)
{
  unsigned int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = 8 * a1;
  v2 = 6;
  v3 = 7;
  v4 = 8;
  if ((8 * a1) >> 28)
    v4 = 9;
  if (v1 >= 0x200000)
    v3 = v4;
  if (v1 >= 0x4000)
    v2 = v3;
  if (v1 >= 0x80)
    return v2;
  else
    return 5;
}

uint64_t TRIPBComputeBoolSize(int a1)
{
  unsigned int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = 8 * a1;
  v2 = 3;
  v3 = 4;
  v4 = 5;
  if ((8 * a1) >> 28)
    v4 = 6;
  if (v1 >= 0x200000)
    v3 = v4;
  if (v1 >= 0x4000)
    v2 = v3;
  if (v1 >= 0x80)
    return v2;
  else
    return 2;
}

uint64_t TRIPBComputeStringSize(int a1, void *a2)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = 8 * a1;
  v3 = 2;
  v4 = 3;
  v5 = 4;
  if ((8 * a1) >> 28)
    v5 = 5;
  if (v2 >= 0x200000)
    v4 = v5;
  if (v2 >= 0x4000)
    v3 = v4;
  if (v2 >= 0x80)
    v6 = v3;
  else
    v6 = 1;
  v7 = objc_msgSend(a2, "lengthOfBytesUsingEncoding:", 4);
  v8 = 1;
  v9 = 2;
  v10 = 3;
  v11 = 4;
  if (v7 >> 28)
    v11 = 5;
  if (v7 >= 0x200000)
    v10 = v11;
  if (v7 >= 0x4000)
    v9 = v10;
  if (v7 >= 0x80)
    v8 = v9;
  return v7 + v6 + v8;
}

uint64_t TRIPBComputeGroupSize(int a1, void *a2)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = 8 * a1;
  v3 = 4;
  v4 = 6;
  v5 = 10;
  if (!((8 * a1) >> 28))
    v5 = 8;
  if (v2 >= 0x200000)
    v4 = v5;
  if (v2 >= 0x4000)
    v3 = v4;
  if (v2 >= 0x80)
    v6 = v3;
  else
    v6 = 2;
  return objc_msgSend(a2, "serializedSize") + v6;
}

uint64_t TRIPBComputeUnknownGroupSize(int a1, void *a2)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = 8 * a1;
  v3 = 4;
  v4 = 6;
  v5 = 10;
  if (!((8 * a1) >> 28))
    v5 = 8;
  if (v2 >= 0x200000)
    v4 = v5;
  if (v2 >= 0x4000)
    v3 = v4;
  if (v2 >= 0x80)
    v6 = v3;
  else
    v6 = 2;
  return objc_msgSend(a2, "serializedSize") + v6;
}

uint64_t TRIPBComputeMessageSize(int a1, void *a2)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = 8 * a1;
  v3 = 2;
  v4 = 3;
  v5 = 4;
  if ((8 * a1) >> 28)
    v5 = 5;
  if (v2 >= 0x200000)
    v4 = v5;
  if (v2 >= 0x4000)
    v3 = v4;
  if (v2 >= 0x80)
    v6 = v3;
  else
    v6 = 1;
  v7 = objc_msgSend(a2, "serializedSize");
  v8 = 1;
  v9 = 2;
  v10 = 3;
  v11 = 4;
  if (v7 >> 28)
    v11 = 5;
  if (v7 >= 0x200000)
    v10 = v11;
  if (v7 >= 0x4000)
    v9 = v10;
  if (v7 >= 0x80)
    v8 = v9;
  return v7 + v6 + v8;
}

uint64_t TRIPBComputeBytesSize(int a1, void *a2)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = 8 * a1;
  v3 = 2;
  v4 = 3;
  v5 = 4;
  if ((8 * a1) >> 28)
    v5 = 5;
  if (v2 >= 0x200000)
    v4 = v5;
  if (v2 >= 0x4000)
    v3 = v4;
  if (v2 >= 0x80)
    v6 = v3;
  else
    v6 = 1;
  v7 = objc_msgSend(a2, "length");
  v8 = 1;
  v9 = 2;
  v10 = 3;
  v11 = 4;
  if (v7 >> 28)
    v11 = 5;
  if (v7 >= 0x200000)
    v10 = v11;
  if (v7 >= 0x4000)
    v9 = v10;
  if (v7 >= 0x80)
    v8 = v9;
  return v7 + v6 + v8;
}

uint64_t TRIPBComputeUInt32Size(int a1, unsigned int a2)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = 8 * a1;
  v3 = 2;
  v4 = 3;
  v5 = 4;
  if ((8 * a1) >> 28)
    v5 = 5;
  if (v2 >= 0x200000)
    v4 = v5;
  if (v2 >= 0x4000)
    v3 = v4;
  if (v2 >= 0x80)
    v6 = v3;
  else
    v6 = 1;
  v7 = 1;
  v8 = 2;
  v9 = 3;
  v10 = 4;
  if (a2 >> 28)
    v10 = 5;
  if (a2 >= 0x200000)
    v9 = v10;
  if (a2 >= 0x4000)
    v8 = v9;
  if (a2 >= 0x80)
    v7 = v8;
  return v7 + v6;
}

uint64_t TRIPBComputeEnumSize(int a1, unsigned int a2)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = 8 * a1;
  v3 = 2;
  v4 = 3;
  v5 = 4;
  if ((8 * a1) >> 28)
    v5 = 5;
  if (v2 >= 0x200000)
    v4 = v5;
  if (v2 >= 0x4000)
    v3 = v4;
  if (v2 >= 0x80)
    v6 = v3;
  else
    v6 = 1;
  v7 = 1;
  v8 = 2;
  v9 = 3;
  v10 = 4;
  if (a2 >> 28)
    v10 = 5;
  if (a2 >= 0x200000)
    v9 = v10;
  if (a2 >= 0x4000)
    v8 = v9;
  if (a2 >= 0x80)
    v7 = v8;
  return v7 + v6;
}

uint64_t TRIPBComputeSFixed32Size(int a1)
{
  unsigned int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = 8 * a1;
  v2 = 6;
  v3 = 7;
  v4 = 8;
  if ((8 * a1) >> 28)
    v4 = 9;
  if (v1 >= 0x200000)
    v3 = v4;
  if (v1 >= 0x4000)
    v2 = v3;
  if (v1 >= 0x80)
    return v2;
  else
    return 5;
}

uint64_t TRIPBComputeSFixed64Size(int a1)
{
  unsigned int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = 8 * a1;
  v2 = 10;
  v3 = 11;
  v4 = 12;
  if ((8 * a1) >> 28)
    v4 = 13;
  if (v1 >= 0x200000)
    v3 = v4;
  if (v1 >= 0x4000)
    v2 = v3;
  if (v1 >= 0x80)
    return v2;
  else
    return 9;
}

uint64_t TRIPBComputeSInt32Size(int a1, int a2)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = 8 * a1;
  v3 = 2;
  v4 = 3;
  v5 = 4;
  if ((8 * a1) >> 28)
    v5 = 5;
  if (v2 >= 0x200000)
    v4 = v5;
  if (v2 >= 0x4000)
    v3 = v4;
  if (v2 >= 0x80)
    v6 = v3;
  else
    v6 = 1;
  v7 = (2 * a2) ^ (a2 >> 31);
  v8 = 2;
  v9 = 3;
  v10 = 4;
  if (v7 >> 28)
    v10 = 5;
  if (v7 >= 0x200000)
    v9 = v10;
  if (v7 >= 0x4000)
    v8 = v9;
  if (v7 >= 0x80)
    v11 = v8;
  else
    v11 = 1;
  return v11 + v6;
}

uint64_t TRIPBComputeSInt64Size(int a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = 8 * a1;
  v3 = 2;
  v4 = 3;
  v5 = 4;
  if ((8 * a1) >> 28)
    v5 = 5;
  if (v2 >= 0x200000)
    v4 = v5;
  if (v2 >= 0x4000)
    v3 = v4;
  if (v2 >= 0x80)
    v6 = v3;
  else
    v6 = 1;
  return TRIPBComputeRawVarint64Size((2 * a2) ^ (a2 >> 63)) + v6;
}

uint64_t TRIPBComputeMessageSetExtensionSize(unsigned int a1, void *a2)
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

  v2 = 6;
  v3 = 7;
  v4 = 8;
  if (a1 >> 28)
    v4 = 9;
  if (a1 >= 0x200000)
    v3 = v4;
  if (a1 >= 0x4000)
    v2 = v3;
  if (a1 >= 0x80)
    v5 = v2;
  else
    v5 = 5;
  v6 = objc_msgSend(a2, "serializedSize");
  v7 = 1;
  v8 = 2;
  v9 = 3;
  v10 = 4;
  if (v6 >> 28)
    v10 = 5;
  if (v6 >= 0x200000)
    v9 = v10;
  if (v6 >= 0x4000)
    v8 = v9;
  if (v6 >= 0x80)
    v7 = v8;
  return v5 + v6 + v7;
}

uint64_t TRIPBComputeRawMessageSetExtensionSize(unsigned int a1, void *a2)
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

  v2 = 6;
  v3 = 7;
  v4 = 8;
  if (a1 >> 28)
    v4 = 9;
  if (a1 >= 0x200000)
    v3 = v4;
  if (a1 >= 0x4000)
    v2 = v3;
  if (a1 >= 0x80)
    v5 = v2;
  else
    v5 = 5;
  v6 = objc_msgSend(a2, "length");
  v7 = 1;
  v8 = 2;
  v9 = 3;
  v10 = 4;
  if (v6 >> 28)
    v10 = 5;
  if (v6 >= 0x200000)
    v9 = v10;
  if (v6 >= 0x4000)
    v8 = v9;
  if (v6 >= 0x80)
    v7 = v8;
  return v5 + v6 + v7;
}

uint64_t TRIPBComputeWireFormatTagSize(int a1, int a2)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = 8 * a1;
  v3 = 2;
  v4 = 3;
  v5 = 4;
  if ((8 * a1) >> 28)
    v5 = 5;
  if (v2 >= 0x200000)
    v4 = v5;
  if (v2 >= 0x4000)
    v3 = v4;
  if (v2 >= 0x80)
    v6 = v3;
  else
    v6 = 1;
  return v6 << (a2 == 16);
}

BOOL TRITrialFactorFieldsReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 8;
LABEL_22:
        v19 = *(void **)(a1 + v18);
        *(_QWORD *)(a1 + v18) = v17;

        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_24:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadString();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 16;
    goto LABEL_22;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t TRIPBWireFormatMakeTag(int a1, int a2)
{
  return a2 | (8 * a1);
}

uint64_t TRIPBWireFormatGetTagWireType(char a1)
{
  return a1 & 7;
}

uint64_t TRIPBWireFormatGetTagFieldNumber(unsigned int a1)
{
  return a1 >> 3;
}

BOOL TRIPBWireFormatIsValidTag(int a1)
{
  return (~a1 & 6) != 0;
}

uint64_t TRIPBWireFormatForType(int a1, char a2)
{
  if ((a2 & 1) != 0)
    return 2;
  else
    return TRIPBWireFormatForType_format[a1];
}

TRIPBFileDescriptor *TRITriassignmentRoot_FileDescriptor()
{
  TRIPBFileDescriptor *result;

  result = (TRIPBFileDescriptor *)TRITriassignmentRoot_FileDescriptor_descriptor;
  if (!TRITriassignmentRoot_FileDescriptor_descriptor)
  {
    result = -[TRIPBFileDescriptor initWithPackage:objcPrefix:syntax:]([TRIPBFileDescriptor alloc], "initWithPackage:objcPrefix:syntax:", CFSTR("TRI"), CFSTR("TRI"), 2);
    TRITriassignmentRoot_FileDescriptor_descriptor = (uint64_t)result;
  }
  return result;
}

uint64_t TRIAssignment_ClearLanguageOneOfCase(void *a1)
{
  return TRIPBMaybeClearOneof((uint64_t)a1, (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "descriptor"), "oneofs"), "objectAtIndex:", 0), 0xFFFFFFFFLL, 0);
}

unint64_t TRIPBSyntax_EnumDescriptor()
{
  id v1;

  if (!atomic_load(&TRIPBSyntax_EnumDescriptor_descriptor))
  {
    v1 = +[TRIPBEnumDescriptor allocDescriptorForName:valueNames:values:count:enumVerifier:](TRIPBEnumDescriptor, "allocDescriptorForName:valueNames:values:count:enumVerifier:", CFSTR("TRIPBSyntax"), "SyntaxProto2", &TRIPBSyntax_EnumDescriptor_values, 2, TRIPBSyntax_IsValidValue);
    while (!__ldaxr(&TRIPBSyntax_EnumDescriptor_descriptor))
    {
      if (!__stlxr((unint64_t)v1, &TRIPBSyntax_EnumDescriptor_descriptor))
        return atomic_load(&TRIPBSyntax_EnumDescriptor_descriptor);
    }
    __clrex();

  }
  return atomic_load(&TRIPBSyntax_EnumDescriptor_descriptor);
}

BOOL TRIPBSyntax_IsValidValue(unsigned int a1)
{
  return a1 < 2;
}

TRIPBFileDescriptor *TRIPBTypeRoot_FileDescriptor()
{
  TRIPBFileDescriptor *result;

  result = (TRIPBFileDescriptor *)TRIPBTypeRoot_FileDescriptor_descriptor;
  if (!TRIPBTypeRoot_FileDescriptor_descriptor)
  {
    result = -[TRIPBFileDescriptor initWithPackage:objcPrefix:syntax:]([TRIPBFileDescriptor alloc], "initWithPackage:objcPrefix:syntax:", CFSTR("google.protobuf"), CFSTR("TRIPB"), 3);
    TRIPBTypeRoot_FileDescriptor_descriptor = (uint64_t)result;
  }
  return result;
}

uint64_t TRIPBType_Syntax_RawValue(uint64_t a1)
{
  return TRIPBGetMessageInt32Field(a1, (_QWORD *)objc_msgSend(+[TRIPBType descriptor](TRIPBType, "descriptor"), "fieldWithNumber:", 6));
}

void *SetTRIPBType_Syntax_RawValue(_QWORD *a1, int a2)
{
  id v4;

  v4 = +[TRIPBType descriptor](TRIPBType, "descriptor");
  return TRIPBSetInt32IvarWithFieldInternal(a1, objc_msgSend(v4, "fieldWithNumber:", 6), a2, objc_msgSend((id)objc_msgSend(v4, "file"), "syntax"));
}

unint64_t TRIPBField_Kind_EnumDescriptor()
{
  id v1;

  if (!atomic_load(&TRIPBField_Kind_EnumDescriptor_descriptor))
  {
    v1 = +[TRIPBEnumDescriptor allocDescriptorForName:valueNames:values:count:enumVerifier:](TRIPBEnumDescriptor, "allocDescriptorForName:valueNames:values:count:enumVerifier:", CFSTR("TRIPBField_Kind"), "TypeUnknown", &TRIPBField_Kind_EnumDescriptor_values, 19, TRIPBField_Kind_IsValidValue);
    while (!__ldaxr(&TRIPBField_Kind_EnumDescriptor_descriptor))
    {
      if (!__stlxr((unint64_t)v1, &TRIPBField_Kind_EnumDescriptor_descriptor))
        return atomic_load(&TRIPBField_Kind_EnumDescriptor_descriptor);
    }
    __clrex();

  }
  return atomic_load(&TRIPBField_Kind_EnumDescriptor_descriptor);
}

unint64_t TRIPBField_Cardinality_EnumDescriptor()
{
  id v1;

  if (!atomic_load(&TRIPBField_Cardinality_EnumDescriptor_descriptor))
  {
    v1 = +[TRIPBEnumDescriptor allocDescriptorForName:valueNames:values:count:enumVerifier:](TRIPBEnumDescriptor, "allocDescriptorForName:valueNames:values:count:enumVerifier:", CFSTR("TRIPBField_Cardinality"), "CardinalityUnknown", &TRIPBField_Cardinality_EnumDescriptor_values, 4, TRIPBField_Cardinality_IsValidValue);
    while (!__ldaxr(&TRIPBField_Cardinality_EnumDescriptor_descriptor))
    {
      if (!__stlxr((unint64_t)v1, &TRIPBField_Cardinality_EnumDescriptor_descriptor))
        return atomic_load(&TRIPBField_Cardinality_EnumDescriptor_descriptor);
    }
    __clrex();

  }
  return atomic_load(&TRIPBField_Cardinality_EnumDescriptor_descriptor);
}

uint64_t TRIPBField_Kind_RawValue(uint64_t a1)
{
  return TRIPBGetMessageInt32Field(a1, (_QWORD *)objc_msgSend(+[TRIPBField descriptor](TRIPBField, "descriptor"), "fieldWithNumber:", 1));
}

void *SetTRIPBField_Kind_RawValue(_QWORD *a1, int a2)
{
  id v4;

  v4 = +[TRIPBField descriptor](TRIPBField, "descriptor");
  return TRIPBSetInt32IvarWithFieldInternal(a1, objc_msgSend(v4, "fieldWithNumber:", 1), a2, objc_msgSend((id)objc_msgSend(v4, "file"), "syntax"));
}

uint64_t TRIPBField_Cardinality_RawValue(uint64_t a1)
{
  return TRIPBGetMessageInt32Field(a1, (_QWORD *)objc_msgSend(+[TRIPBField descriptor](TRIPBField, "descriptor"), "fieldWithNumber:", 2));
}

void *SetTRIPBField_Cardinality_RawValue(_QWORD *a1, int a2)
{
  id v4;

  v4 = +[TRIPBField descriptor](TRIPBField, "descriptor");
  return TRIPBSetInt32IvarWithFieldInternal(a1, objc_msgSend(v4, "fieldWithNumber:", 2), a2, objc_msgSend((id)objc_msgSend(v4, "file"), "syntax"));
}

BOOL TRIPBField_Kind_IsValidValue(unsigned int a1)
{
  return a1 < 0x13;
}

BOOL TRIPBField_Cardinality_IsValidValue(unsigned int a1)
{
  return a1 < 4;
}

uint64_t TRIPBEnum_Syntax_RawValue(uint64_t a1)
{
  return TRIPBGetMessageInt32Field(a1, (_QWORD *)objc_msgSend(+[TRIPBEnum descriptor](TRIPBEnum, "descriptor"), "fieldWithNumber:", 5));
}

void *SetTRIPBEnum_Syntax_RawValue(_QWORD *a1, int a2)
{
  id v4;

  v4 = +[TRIPBEnum descriptor](TRIPBEnum, "descriptor");
  return TRIPBSetInt32IvarWithFieldInternal(a1, objc_msgSend(v4, "fieldWithNumber:", 5), a2, objc_msgSend((id)objc_msgSend(v4, "file"), "syntax"));
}

TRIPBFileDescriptor *TRIPBDescriptorRoot_FileDescriptor()
{
  TRIPBFileDescriptor *result;

  result = (TRIPBFileDescriptor *)TRIPBDescriptorRoot_FileDescriptor_descriptor;
  if (!TRIPBDescriptorRoot_FileDescriptor_descriptor)
  {
    result = -[TRIPBFileDescriptor initWithPackage:objcPrefix:syntax:]([TRIPBFileDescriptor alloc], "initWithPackage:objcPrefix:syntax:", CFSTR("google.protobuf"), CFSTR("TRIPB"), 2);
    TRIPBDescriptorRoot_FileDescriptor_descriptor = (uint64_t)result;
  }
  return result;
}

unint64_t TRIPBFieldDescriptorProto_Label_EnumDescriptor()
{
  id v1;

  if (!atomic_load(&TRIPBFieldDescriptorProto_Label_EnumDescriptor_descriptor))
  {
    v1 = +[TRIPBEnumDescriptor allocDescriptorForName:valueNames:values:count:enumVerifier:](TRIPBEnumDescriptor, "allocDescriptorForName:valueNames:values:count:enumVerifier:", CFSTR("TRIPBFieldDescriptorProto_Label"), "LabelOptional", &TRIPBFieldDescriptorProto_Label_EnumDescriptor_values, 3, TRIPBFieldDescriptorProto_Label_IsValidValue);
    while (!__ldaxr(&TRIPBFieldDescriptorProto_Label_EnumDescriptor_descriptor))
    {
      if (!__stlxr((unint64_t)v1, &TRIPBFieldDescriptorProto_Label_EnumDescriptor_descriptor))
        return atomic_load(&TRIPBFieldDescriptorProto_Label_EnumDescriptor_descriptor);
    }
    __clrex();

  }
  return atomic_load(&TRIPBFieldDescriptorProto_Label_EnumDescriptor_descriptor);
}

unint64_t TRIPBFieldDescriptorProto_Type_EnumDescriptor()
{
  id v1;

  if (!atomic_load(&TRIPBFieldDescriptorProto_Type_EnumDescriptor_descriptor))
  {
    v1 = +[TRIPBEnumDescriptor allocDescriptorForName:valueNames:values:count:enumVerifier:](TRIPBEnumDescriptor, "allocDescriptorForName:valueNames:values:count:enumVerifier:", CFSTR("TRIPBFieldDescriptorProto_Type"), "TypeDouble", &TRIPBFieldDescriptorProto_Type_EnumDescriptor_values, 18, TRIPBFieldDescriptorProto_Type_IsValidValue);
    while (!__ldaxr(&TRIPBFieldDescriptorProto_Type_EnumDescriptor_descriptor))
    {
      if (!__stlxr((unint64_t)v1, &TRIPBFieldDescriptorProto_Type_EnumDescriptor_descriptor))
        return atomic_load(&TRIPBFieldDescriptorProto_Type_EnumDescriptor_descriptor);
    }
    __clrex();

  }
  return atomic_load(&TRIPBFieldDescriptorProto_Type_EnumDescriptor_descriptor);
}

BOOL TRIPBFieldDescriptorProto_Type_IsValidValue(int a1)
{
  return (a1 - 1) < 0x12;
}

BOOL TRIPBFieldDescriptorProto_Label_IsValidValue(int a1)
{
  return (a1 - 1) < 3;
}

unint64_t TRIPBFileOptions_OptimizeMode_EnumDescriptor()
{
  id v1;

  if (!atomic_load(&TRIPBFileOptions_OptimizeMode_EnumDescriptor_descriptor))
  {
    v1 = +[TRIPBEnumDescriptor allocDescriptorForName:valueNames:values:count:enumVerifier:](TRIPBEnumDescriptor, "allocDescriptorForName:valueNames:values:count:enumVerifier:", CFSTR("TRIPBFileOptions_OptimizeMode"), "Speed", &TRIPBFileOptions_OptimizeMode_EnumDescriptor_values, 3, TRIPBFileOptions_OptimizeMode_IsValidValue);
    while (!__ldaxr(&TRIPBFileOptions_OptimizeMode_EnumDescriptor_descriptor))
    {
      if (!__stlxr((unint64_t)v1, &TRIPBFileOptions_OptimizeMode_EnumDescriptor_descriptor))
        return atomic_load(&TRIPBFileOptions_OptimizeMode_EnumDescriptor_descriptor);
    }
    __clrex();

  }
  return atomic_load(&TRIPBFileOptions_OptimizeMode_EnumDescriptor_descriptor);
}

BOOL TRIPBFileOptions_OptimizeMode_IsValidValue(int a1)
{
  return (a1 - 1) < 3;
}

unint64_t TRIPBFieldOptions_CType_EnumDescriptor()
{
  id v1;

  if (!atomic_load(&TRIPBFieldOptions_CType_EnumDescriptor_descriptor))
  {
    v1 = +[TRIPBEnumDescriptor allocDescriptorForName:valueNames:values:count:enumVerifier:](TRIPBEnumDescriptor, "allocDescriptorForName:valueNames:values:count:enumVerifier:", CFSTR("TRIPBFieldOptions_CType"), "String", &TRIPBFieldOptions_CType_EnumDescriptor_values, 3, TRIPBFieldOptions_CType_IsValidValue);
    while (!__ldaxr(&TRIPBFieldOptions_CType_EnumDescriptor_descriptor))
    {
      if (!__stlxr((unint64_t)v1, &TRIPBFieldOptions_CType_EnumDescriptor_descriptor))
        return atomic_load(&TRIPBFieldOptions_CType_EnumDescriptor_descriptor);
    }
    __clrex();

  }
  return atomic_load(&TRIPBFieldOptions_CType_EnumDescriptor_descriptor);
}

unint64_t TRIPBFieldOptions_JSType_EnumDescriptor()
{
  id v1;

  if (!atomic_load(&TRIPBFieldOptions_JSType_EnumDescriptor_descriptor))
  {
    v1 = +[TRIPBEnumDescriptor allocDescriptorForName:valueNames:values:count:enumVerifier:](TRIPBEnumDescriptor, "allocDescriptorForName:valueNames:values:count:enumVerifier:", CFSTR("TRIPBFieldOptions_JSType"), "JsNormal", &TRIPBFieldOptions_JSType_EnumDescriptor_values, 3, TRIPBFieldOptions_JSType_IsValidValue);
    while (!__ldaxr(&TRIPBFieldOptions_JSType_EnumDescriptor_descriptor))
    {
      if (!__stlxr((unint64_t)v1, &TRIPBFieldOptions_JSType_EnumDescriptor_descriptor))
        return atomic_load(&TRIPBFieldOptions_JSType_EnumDescriptor_descriptor);
    }
    __clrex();

  }
  return atomic_load(&TRIPBFieldOptions_JSType_EnumDescriptor_descriptor);
}

BOOL TRIPBFieldOptions_CType_IsValidValue(unsigned int a1)
{
  return a1 < 3;
}

BOOL TRIPBFieldOptions_JSType_IsValidValue(unsigned int a1)
{
  return a1 < 3;
}

unint64_t TRIPBMethodOptions_IdempotencyLevel_EnumDescriptor()
{
  id v1;

  if (!atomic_load(&TRIPBMethodOptions_IdempotencyLevel_EnumDescriptor_descriptor))
  {
    v1 = +[TRIPBEnumDescriptor allocDescriptorForName:valueNames:values:count:enumVerifier:](TRIPBEnumDescriptor, "allocDescriptorForName:valueNames:values:count:enumVerifier:", CFSTR("TRIPBMethodOptions_IdempotencyLevel"), "IdempotencyUnknown", &TRIPBMethodOptions_IdempotencyLevel_EnumDescriptor_values, 3, TRIPBMethodOptions_IdempotencyLevel_IsValidValue);
    while (!__ldaxr(&TRIPBMethodOptions_IdempotencyLevel_EnumDescriptor_descriptor))
    {
      if (!__stlxr((unint64_t)v1, &TRIPBMethodOptions_IdempotencyLevel_EnumDescriptor_descriptor))
        return atomic_load(&TRIPBMethodOptions_IdempotencyLevel_EnumDescriptor_descriptor);
    }
    __clrex();

  }
  return atomic_load(&TRIPBMethodOptions_IdempotencyLevel_EnumDescriptor_descriptor);
}

BOOL TRIPBMethodOptions_IdempotencyLevel_IsValidValue(unsigned int a1)
{
  return a1 < 3;
}

unint64_t TRIPBNullValue_EnumDescriptor()
{
  id v1;

  if (!atomic_load(&TRIPBNullValue_EnumDescriptor_descriptor))
  {
    v1 = +[TRIPBEnumDescriptor allocDescriptorForName:valueNames:values:count:enumVerifier:](TRIPBEnumDescriptor, "allocDescriptorForName:valueNames:values:count:enumVerifier:", CFSTR("TRIPBNullValue"), "NullValue", &TRIPBNullValue_EnumDescriptor_values, 1, TRIPBNullValue_IsValidValue);
    while (!__ldaxr(&TRIPBNullValue_EnumDescriptor_descriptor))
    {
      if (!__stlxr((unint64_t)v1, &TRIPBNullValue_EnumDescriptor_descriptor))
        return atomic_load(&TRIPBNullValue_EnumDescriptor_descriptor);
    }
    __clrex();

  }
  return atomic_load(&TRIPBNullValue_EnumDescriptor_descriptor);
}

BOOL TRIPBNullValue_IsValidValue(int a1)
{
  return a1 == 0;
}

TRIPBFileDescriptor *TRIPBStructRoot_FileDescriptor()
{
  TRIPBFileDescriptor *result;

  result = (TRIPBFileDescriptor *)TRIPBStructRoot_FileDescriptor_descriptor;
  if (!TRIPBStructRoot_FileDescriptor_descriptor)
  {
    result = -[TRIPBFileDescriptor initWithPackage:objcPrefix:syntax:]([TRIPBFileDescriptor alloc], "initWithPackage:objcPrefix:syntax:", CFSTR("google.protobuf"), CFSTR("TRIPB"), 3);
    TRIPBStructRoot_FileDescriptor_descriptor = (uint64_t)result;
  }
  return result;
}

uint64_t TRIPBValue_NullValue_RawValue(uint64_t a1)
{
  return TRIPBGetMessageInt32Field(a1, (_QWORD *)objc_msgSend(+[TRIPBValue descriptor](TRIPBValue, "descriptor"), "fieldWithNumber:", 1));
}

void *SetTRIPBValue_NullValue_RawValue(_QWORD *a1, int a2)
{
  id v4;

  v4 = +[TRIPBValue descriptor](TRIPBValue, "descriptor");
  return TRIPBSetInt32IvarWithFieldInternal(a1, objc_msgSend(v4, "fieldWithNumber:", 1), a2, objc_msgSend((id)objc_msgSend(v4, "file"), "syntax"));
}

uint64_t TRIPBValue_ClearKindOneOfCase(void *a1)
{
  return TRIPBMaybeClearOneof((uint64_t)a1, (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "descriptor"), "oneofs"), "objectAtIndex:", 0), 0xFFFFFFFFLL, 0);
}

unint64_t TRIAllocationUnitType_EnumDescriptor()
{
  id v1;

  if (!atomic_load(&TRIAllocationUnitType_EnumDescriptor_descriptor))
  {
    v1 = +[TRIPBEnumDescriptor allocDescriptorForName:valueNames:values:count:enumVerifier:](TRIPBEnumDescriptor, "allocDescriptorForName:valueNames:values:count:enumVerifier:", CFSTR("TRIAllocationUnitType"), "Default", &TRIAllocationUnitType_EnumDescriptor_values, 4, TRIAllocationUnitType_IsValidValue);
    while (!__ldaxr(&TRIAllocationUnitType_EnumDescriptor_descriptor))
    {
      if (!__stlxr((unint64_t)v1, &TRIAllocationUnitType_EnumDescriptor_descriptor))
        return atomic_load(&TRIAllocationUnitType_EnumDescriptor_descriptor);
    }
    __clrex();

  }
  return atomic_load(&TRIAllocationUnitType_EnumDescriptor_descriptor);
}

BOOL TRIAllocationUnitType_IsValidValue(unsigned int a1)
{
  return a1 < 4;
}

TRIPBFileDescriptor *TRIUiassignmentRoot_FileDescriptor()
{
  TRIPBFileDescriptor *result;

  result = (TRIPBFileDescriptor *)TRIUiassignmentRoot_FileDescriptor_descriptor;
  if (!TRIUiassignmentRoot_FileDescriptor_descriptor)
  {
    result = -[TRIPBFileDescriptor initWithPackage:objcPrefix:syntax:]([TRIPBFileDescriptor alloc], "initWithPackage:objcPrefix:syntax:", CFSTR("TRI"), CFSTR("TRI"), 2);
    TRIUiassignmentRoot_FileDescriptor_descriptor = (uint64_t)result;
  }
  return result;
}

unint64_t TRIPredicate_SystemVariable_EnumDescriptor()
{
  id v1;

  if (!atomic_load(&TRIPredicate_SystemVariable_EnumDescriptor_descriptor))
  {
    v1 = +[TRIPBEnumDescriptor allocDescriptorForName:valueNames:values:count:enumVerifier:](TRIPBEnumDescriptor, "allocDescriptorForName:valueNames:values:count:enumVerifier:", CFSTR("TRIPredicate_SystemVariable"), &unk_1921A8B9C, &TRIPredicate_SystemVariable_EnumDescriptor_values, 18, TRIPredicate_SystemVariable_IsValidValue);
    while (!__ldaxr(&TRIPredicate_SystemVariable_EnumDescriptor_descriptor))
    {
      if (!__stlxr((unint64_t)v1, &TRIPredicate_SystemVariable_EnumDescriptor_descriptor))
        return atomic_load(&TRIPredicate_SystemVariable_EnumDescriptor_descriptor);
    }
    __clrex();

  }
  return atomic_load(&TRIPredicate_SystemVariable_EnumDescriptor_descriptor);
}

unint64_t TRIPredicate_Operation_EnumDescriptor()
{
  id v1;

  if (!atomic_load(&TRIPredicate_Operation_EnumDescriptor_descriptor))
  {
    v1 = +[TRIPBEnumDescriptor allocDescriptorForName:valueNames:values:count:enumVerifier:](TRIPBEnumDescriptor, "allocDescriptorForName:valueNames:values:count:enumVerifier:", CFSTR("TRIPredicate_Operation"), "Equals", &TRIPredicate_Operation_EnumDescriptor_values, 15, TRIPredicate_Operation_IsValidValue);
    while (!__ldaxr(&TRIPredicate_Operation_EnumDescriptor_descriptor))
    {
      if (!__stlxr((unint64_t)v1, &TRIPredicate_Operation_EnumDescriptor_descriptor))
        return atomic_load(&TRIPredicate_Operation_EnumDescriptor_descriptor);
    }
    __clrex();

  }
  return atomic_load(&TRIPredicate_Operation_EnumDescriptor_descriptor);
}

uint64_t TRIPredicate_SystemVariable_IsValidValue(unsigned int a1)
{
  return (a1 < 0x13) & (0x7FFBFu >> a1);
}

BOOL TRIPredicate_Operation_IsValidValue(unsigned int a1)
{
  return a1 < 0xF;
}

uint64_t TRIUIAssignment_ClearBucketingOneOfCase(void *a1)
{
  return TRIPBMaybeClearOneof((uint64_t)a1, (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "descriptor"), "oneofs"), "objectAtIndex:", 0), 0xFFFFFFFFLL, 0);
}

unint64_t TRICustomPredicate_KeyType_EnumDescriptor()
{
  id v1;

  if (!atomic_load(&TRICustomPredicate_KeyType_EnumDescriptor_descriptor))
  {
    v1 = +[TRIPBEnumDescriptor allocDescriptorForName:valueNames:values:count:enumVerifier:](TRIPBEnumDescriptor, "allocDescriptorForName:valueNames:values:count:enumVerifier:", CFSTR("TRICustomPredicate_KeyType"), "String", &TRICustomPredicate_KeyType_EnumDescriptor_values, 4, TRICustomPredicate_KeyType_IsValidValue);
    while (!__ldaxr(&TRICustomPredicate_KeyType_EnumDescriptor_descriptor))
    {
      if (!__stlxr((unint64_t)v1, &TRICustomPredicate_KeyType_EnumDescriptor_descriptor))
        return atomic_load(&TRICustomPredicate_KeyType_EnumDescriptor_descriptor);
    }
    __clrex();

  }
  return atomic_load(&TRICustomPredicate_KeyType_EnumDescriptor_descriptor);
}

BOOL TRICustomPredicate_KeyType_IsValidValue(int a1)
{
  return (a1 - 1) < 4;
}

unint64_t TRIGroupedPredicate_LogicalOperator_EnumDescriptor()
{
  id v1;

  if (!atomic_load(&TRIGroupedPredicate_LogicalOperator_EnumDescriptor_descriptor))
  {
    v1 = +[TRIPBEnumDescriptor allocDescriptorForName:valueNames:values:count:enumVerifier:](TRIPBEnumDescriptor, "allocDescriptorForName:valueNames:values:count:enumVerifier:", CFSTR("TRIGroupedPredicate_LogicalOperator"), &unk_1921A8E38, &TRIGroupedPredicate_LogicalOperator_EnumDescriptor_values, 2, TRIGroupedPredicate_LogicalOperator_IsValidValue);
    while (!__ldaxr(&TRIGroupedPredicate_LogicalOperator_EnumDescriptor_descriptor))
    {
      if (!__stlxr((unint64_t)v1, &TRIGroupedPredicate_LogicalOperator_EnumDescriptor_descriptor))
        return atomic_load(&TRIGroupedPredicate_LogicalOperator_EnumDescriptor_descriptor);
    }
    __clrex();

  }
  return atomic_load(&TRIGroupedPredicate_LogicalOperator_EnumDescriptor_descriptor);
}

BOOL TRIGroupedPredicate_LogicalOperator_IsValidValue(int a1)
{
  return (a1 - 1) < 2;
}

TRIPBFileDescriptor *TRIPBApiRoot_FileDescriptor()
{
  TRIPBFileDescriptor *result;

  result = (TRIPBFileDescriptor *)TRIPBApiRoot_FileDescriptor_descriptor;
  if (!TRIPBApiRoot_FileDescriptor_descriptor)
  {
    result = -[TRIPBFileDescriptor initWithPackage:objcPrefix:syntax:]([TRIPBFileDescriptor alloc], "initWithPackage:objcPrefix:syntax:", CFSTR("google.protobuf"), CFSTR("TRIPB"), 3);
    TRIPBApiRoot_FileDescriptor_descriptor = (uint64_t)result;
  }
  return result;
}

uint64_t TRIPBApi_Syntax_RawValue(uint64_t a1)
{
  return TRIPBGetMessageInt32Field(a1, (_QWORD *)objc_msgSend(+[TRIPBApi descriptor](TRIPBApi, "descriptor"), "fieldWithNumber:", 7));
}

void *SetTRIPBApi_Syntax_RawValue(_QWORD *a1, int a2)
{
  id v4;

  v4 = +[TRIPBApi descriptor](TRIPBApi, "descriptor");
  return TRIPBSetInt32IvarWithFieldInternal(a1, objc_msgSend(v4, "fieldWithNumber:", 7), a2, objc_msgSend((id)objc_msgSend(v4, "file"), "syntax"));
}

uint64_t TRIPBMethod_Syntax_RawValue(uint64_t a1)
{
  return TRIPBGetMessageInt32Field(a1, (_QWORD *)objc_msgSend(+[TRIPBMethod descriptor](TRIPBMethod, "descriptor"), "fieldWithNumber:", 7));
}

void *SetTRIPBMethod_Syntax_RawValue(_QWORD *a1, int a2)
{
  id v4;

  v4 = +[TRIPBMethod descriptor](TRIPBMethod, "descriptor");
  return TRIPBSetInt32IvarWithFieldInternal(a1, objc_msgSend(v4, "fieldWithNumber:", 7), a2, objc_msgSend((id)objc_msgSend(v4, "file"), "syntax"));
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80368](data, *(_QWORD *)&len, md);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98508](theDict, applier, context);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98558](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1E0C98570](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x1E0C985A0](theDict, keys, values);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1E0C98758](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x1E0C990C0](theString, range.location, range.length, buffer);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1E0C990C8](theString);
}

id NSAllocateObject(Class aClass, NSUInteger extraBytes, NSZone *zone)
{
  return (id)MEMORY[0x1E0CB2868](aClass, extraBytes, zone);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSZone *__cdecl NSZoneFromPointer(void *ptr)
{
  return (NSZone *)MEMORY[0x1E0CB3460](ptr);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1E0D82C10]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1E0D82C28]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1E0D82C38]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1E0D82C58]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x1E0D82C68]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1E0D82C98]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1E0D82CB0]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1E0D82CB8]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x1E0D82CC0]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1E0D82CE0]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1E0D82CF0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1E0D82D00]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1E0D82D10]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1E0D82D28]();
}

uint64_t PBRepeatedUInt32Add()
{
  return MEMORY[0x1E0D82E48]();
}

uint64_t PBRepeatedUInt32Clear()
{
  return MEMORY[0x1E0D82E50]();
}

uint64_t PBRepeatedUInt32Copy()
{
  return MEMORY[0x1E0D82E58]();
}

uint64_t PBRepeatedUInt32Hash()
{
  return MEMORY[0x1E0D82E60]();
}

uint64_t PBRepeatedUInt32IsEqual()
{
  return MEMORY[0x1E0D82E68]();
}

uint64_t PBRepeatedUInt32NSArray()
{
  return MEMORY[0x1E0D82E70]();
}

uint64_t PBRepeatedUInt32Set()
{
  return MEMORY[0x1E0D82E78]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C80C70](*(_QWORD *)&a1);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C80C78](*(_QWORD *)&a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x1E0DE7A50](cls, name, imp, types);
}

Method *__cdecl class_copyMethodList(Class cls, unsigned int *outCount)
{
  return (Method *)MEMORY[0x1E0DE7A78](cls, outCount);
}

size_t class_getInstanceSize(Class cls)
{
  return MEMORY[0x1E0DE7AB0](cls);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1E0DE7AC8](cls);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
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

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

IMP imp_implementationWithBlock(id block)
{
  return (IMP)MEMORY[0x1E0DE7B10](block);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
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

SEL method_getName(Method m)
{
  return (SEL)MEMORY[0x1E0DE7B70](m);
}

long double modf(long double __x, long double *__y)
{
  long double result;

  MEMORY[0x1E0C841E0](__y, __x);
  return result;
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

Class objc_getMetaClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CC8](name);
}

Protocol *__cdecl objc_getProtocol(const char *name)
{
  return (Protocol *)MEMORY[0x1E0DE7CD8](name);
}

Class objc_lookUpClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7D10](name);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  const char *v4;
  char *v5;
  objc_method_description result;

  v4 = (const char *)MEMORY[0x1E0DE80A8](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
  MEMORY[0x1E0C84F90](__base, __nel, __width, __compar);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1E0C85030](__ptr, __size);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1E0DE80C8](sel);
}

SEL sel_getUid(const char *str)
{
  return (SEL)MEMORY[0x1E0DE80D0](str);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

