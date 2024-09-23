void *CEContextQuery(__int128 *a1, size_t *a2, uint64_t a3)
{
  uint64_t v3;
  __int128 v4;
  int v5;
  size_t *v7;
  _UNKNOWN **v8;
  _OWORD v10[2];
  char v11;
  char v12;
  _BYTE v13[22];
  _OWORD v14[2];
  char v15;
  unsigned __int8 v16;
  _BYTE v17[22];
  _OWORD v18[2];
  __int128 v19;
  __int128 v20;
  char v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return &unk_1EA97EC10;
  v3 = a3;
  v4 = a1[1];
  v19 = *a1;
  v20 = v4;
  v21 = *((_BYTE *)a1 + 32);
  v5 = *((unsigned __int8 *)a1 + 33);
  v18[0] = *(__int128 *)((char *)a1 + 34);
  for (*(_QWORD *)((char *)v18 + 14) = *((_QWORD *)a1 + 6); v3; --v3)
  {
    v10[0] = v19;
    v10[1] = v20;
    v11 = v21;
    v12 = v5;
    *(_OWORD *)v13 = v18[0];
    *(_QWORD *)&v13[14] = *(_QWORD *)((char *)v18 + 14);
    if (a2)
      v7 = a2;
    else
      v7 = 0;
    der_vm_execute_nocopy((unint64_t)v10, v7, (uint64_t)v14);
    v19 = v14[0];
    v20 = v14[1];
    v21 = v15;
    v5 = v16;
    v18[0] = *(_OWORD *)v17;
    a2 += 32;
    *(_QWORD *)((char *)v18 + 14) = *(_QWORD *)&v17[14];
  }
  if (v5)
    v8 = &kCENoError;
  else
    v8 = &kCEQueryCannotBeSatisfied;
  return *v8;
}

void *CESizeDeserialization(uint64_t a1, _QWORD *a2)
{
  __int128 v2;
  _OWORD v4[3];
  uint64_t v5;
  _QWORD v6[5];

  *a2 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 0x40000000;
  v6[2] = __CESizeDeserialization_block_invoke;
  v6[3] = &__block_descriptor_tmp_60;
  v6[4] = a2;
  v2 = *(_OWORD *)(a1 + 16);
  v4[0] = *(_OWORD *)a1;
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 48);
  return emitSerializationElement((unint64_t)v4, (uint64_t)v6);
}

void *CEDeserialize(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v3;
  void *v4;
  _OWORD v6[3];
  uint64_t v7;
  _QWORD v8[8];
  _QWORD v9[4];

  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2000000000;
  v9[3] = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 0x40000000;
  v8[2] = __CEDeserialize_block_invoke;
  v8[3] = &unk_1EA97ECA8;
  v8[4] = v9;
  v8[5] = a3;
  v8[6] = a1;
  v8[7] = a2;
  v3 = *(_OWORD *)(a1 + 16);
  v6[0] = *(_OWORD *)a1;
  v6[1] = v3;
  v6[2] = *(_OWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 48);
  v4 = emitSerializationElement((unint64_t)v6, (uint64_t)v8);
  _Block_object_dispose(v9, 8);
  return v4;
}

_QWORD **CEReleaseManagedContext(_QWORD **result)
{
  _QWORD *v1;
  unint64_t *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  BOOL v6;
  _UNKNOWN **v7;
  void (*v8)(unint64_t, const char *, ...);
  const char *v9;

  if (!result)
    goto LABEL_22;
  v1 = result;
  v2 = *result;
  if (!*result)
  {
LABEL_14:
    v7 = &kCENoError;
    return (_QWORD **)*v7;
  }
  v3 = *v2;
  v4 = *v2 + 64;
  if (!*(_QWORD *)(*v2 + 16))
  {
    v8 = *(void (**)(unint64_t, const char *, ...))(v3 + 24);
    if (v8)
    {
      if (v3 >= v4)
        goto LABEL_24;
      v9 = "This context's runtime does not support freeing";
      goto LABEL_21;
    }
LABEL_22:
    v7 = &kCEAPIMisuse;
    return (_QWORD **)*v7;
  }
  if (!*((_BYTE *)v2 + 56))
  {
    v8 = *(void (**)(unint64_t, const char *, ...))(v3 + 24);
    if (v8)
    {
      if (v3 >= v4)
        goto LABEL_24;
      v9 = "Trying to release an unmanaged context";
LABEL_21:
      v8(v3, "[%s]: %s\n", "CEReleaseManagedContext", v9);
      goto LABEL_22;
    }
    goto LABEL_22;
  }
  if (v2 < v2 + 8)
  {
    v5 = v2[2];
    if (v5)
    {
      if (v3)
        v6 = v3 >= v4;
      else
        v6 = 0;
      if (v6)
        goto LABEL_24;
      result = (_QWORD **)(*(uint64_t (**)(unint64_t, unint64_t, unint64_t))(v3 + 56))(*v2, v2[1], 8 * v5);
      v2[1] = 0;
      v2[2] = 0;
    }
    if (v3 < v4)
    {
      (*(void (**)(unint64_t, unint64_t *))(v3 + 16))(v3, v2);
      *v1 = 0;
      goto LABEL_14;
    }
  }
LABEL_24:
  __break(0x5519u);
  return result;
}

void ce_free(int a1, void *a2)
{
  free(a2);
}

uint64_t CEManagedContextFromCFData(_QWORD *a1, CFDataRef theData, _QWORD *a3)
{
  const UInt8 *BytePtr;
  uint64_t result;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;

  v10 = 0uLL;
  v11 = 0;
  BytePtr = CFDataGetBytePtr(theData);
  result = CFDataGetLength(theData);
  LOBYTE(v8) = 0;
  if (result < 0)
  {
    __break(0x5519u);
  }
  else
  {
    result = (uint64_t)CEValidateWithOptions(a1, &v8, &v10, (unint64_t)BytePtr, (unint64_t)&BytePtr[result]);
    if ((_QWORD *)result == Errors)
    {
      v8 = v10;
      v9 = v11;
      return (uint64_t)CEAcquireManagedContext((uint64_t)a1, &v8, a3);
    }
  }
  return result;
}

_QWORD *CEAcquireManagedContext(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  _QWORD *result;
  _OWORD *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  void (*v10)(uint64_t, const char *, ...);
  const char *v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  if (!a3 || !*a2 || !a2[1] || !a2[2])
  {
    v10 = *(void (**)(uint64_t, const char *, ...))(a1 + 24);
    if (!v10)
      return &unk_1EA97EC00;
    v11 = "The passed in arguments are invalid";
LABEL_11:
    v10(a1, "[%s]: %s\n", "CEAcquireManagedContext", v11);
    return &unk_1EA97EC00;
  }
  if (!*(_QWORD *)(a1 + 8))
  {
    v10 = *(void (**)(uint64_t, const char *, ...))(a1 + 24);
    if (!v10)
      return &unk_1EA97EC00;
    v11 = "This context's runtime does not support allocating";
    goto LABEL_11;
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = *(_OWORD *)a2;
  v13 = a2[2];
  result = (_QWORD *)CEAcquireUnmanagedContext(a1, &v12, (uint64_t)&v14);
  if (result == Errors)
  {
    BYTE8(v17) = 1;
    v6 = (_OWORD *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(a1, 64);
    *a3 = v6;
    if (v6)
    {
      v7 = v14;
      v8 = v15;
      v9 = v17;
      v6[2] = v16;
      v6[3] = v9;
      *v6 = v7;
      v6[1] = v8;
      return Errors;
    }
    else
    {
      return (_QWORD *)&unk_1EA97EC20;
    }
  }
  return result;
}

uint64_t CEAcquireUnmanagedContext(uint64_t result, _QWORD *a2, uint64_t a3)
{
  unint64_t v4;
  unint64_t v5;
  __int128 v6;
  __int128 v7;
  _UNKNOWN **v8;
  _OWORD v9[3];
  uint64_t v10;
  _OWORD v11[3];
  unint64_t v12;

  if (!a3 || !*a2 || !a2[1] || !a2[2])
  {
    v8 = &kCEInvalidArgument;
    return (uint64_t)*v8;
  }
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)(a3 + 48) = 0u;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  v5 = a2[1];
  v4 = a2[2];
  if (*a2 == 2)
  {
    if (v5 <= v4)
    {
      *(_QWORD *)(a3 + 8) = 0;
      *(_QWORD *)(a3 + 16) = 0;
      *(_QWORD *)a3 = result;
      *(_OWORD *)(a3 + 24) = xmmword_1DF077390;
      *(_QWORD *)(a3 + 40) = v5;
      *(_QWORD *)(a3 + 48) = v4;
      v6 = *(_OWORD *)(a3 + 16);
      v9[0] = *(_OWORD *)a3;
      v9[1] = v6;
      v9[2] = *(_OWORD *)(a3 + 32);
      v10 = *(_QWORD *)(a3 + 48);
      der_vm_execute_nocopy((unint64_t)v9, (size_t *)CESelectValueOperation, (uint64_t)v11);
      v7 = v11[1];
      *(_OWORD *)a3 = v11[0];
      *(_OWORD *)(a3 + 16) = v7;
      *(_OWORD *)(a3 + 32) = v11[2];
      v4 = v12;
LABEL_12:
      *(_QWORD *)(a3 + 48) = v4;
      v8 = &kCENoError;
      return (uint64_t)*v8;
    }
  }
  else if (v5 <= v4)
  {
    *(_QWORD *)(a3 + 8) = 0;
    *(_QWORD *)(a3 + 16) = 0;
    *(_QWORD *)a3 = result;
    *(_OWORD *)(a3 + 24) = xmmword_1DF077380;
    *(_QWORD *)(a3 + 40) = v5;
    goto LABEL_12;
  }
  __break(0x5519u);
  return result;
}

uint64_t CEQueryContextToCFDictionary(uint64_t a1, _QWORD *a2)
{
  void *v4;
  __int128 v5;
  uint64_t *v6;
  uint64_t v7;
  _OWORD v9[3];
  uint64_t v10;
  _QWORD v11[6];

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_OWORD *)(a1 + 16);
  v9[0] = *(_OWORD *)a1;
  v9[1] = v5;
  v9[2] = *(_OWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 48);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 0x40000000;
  v11[2] = __der_vm_iterate_block_invoke;
  v11[3] = &__block_descriptor_tmp_156;
  v11[4] = v4;
  v11[5] = manufacturingCallback;
  if ((_QWORD *)der_vm_iterate_b((uint64_t)v9, (uint64_t)v11) == Errors)
  {
    *a2 = v4;
    v6 = (uint64_t *)&kCENoError;
  }
  else
  {
    v6 = (uint64_t *)&kCEMalformedEntitlements;
  }
  v7 = *v6;

  return v7;
}

_QWORD *CEValidateWithOptions(_QWORD *result, _BYTE *a2, _QWORD *a3, unint64_t a4, unint64_t a5)
{
  _QWORD *v5;
  BOOL v10;
  void (*v11)(_QWORD *, const char *, ...);
  const char *v12;
  void (*v13)(_QWORD *, const char *, ...);
  _UNKNOWN **v14;
  const char *v15;
  void (*v16)(_QWORD *, const char *, ...);
  void (*v17)(_QWORD *, const char *, ...);
  uint64_t v18[3];
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  __int128 v25;

  v5 = result;
  if (!a3)
    goto LABEL_16;
  *a3 = 0;
  if (a4 > a5)
  {
    __break(0x5519u);
    return result;
  }
  a3[1] = a4;
  a3[2] = a5;
  if (a4 && a4 < a5)
  {
    if (a5 - a4 >= 5 && (*(_DWORD *)a4 == 1836597052 ? (v10 = *(_BYTE *)(a4 + 4) == 108) : (v10 = 0), v10))
    {
      v16 = (void (*)(_QWORD *, const char *, ...))result[3];
      if (v16)
        v16(result, "[%s]: %s\n", "CEValidateWithOptions", "xml-looking blob was passed in");
      return &unk_1EA97EC00;
    }
    else
    {
      v18[1] = a5;
      v18[2] = 0;
      v18[0] = a4;
      if (ccder_blob_decode_tl())
      {
        v25 = 0uLL;
        if ((ccder_blob_decode_range() & 1) != 0)
        {
          v19 = 0;
          v20 = 0;
          if ((ccder_blob_decode_range() & 1) != 0)
          {
            if ((unint64_t)(v20 - (_QWORD)v19) < 9)
            {
              v17 = (void (*)(_QWORD *, const char *, ...))v5[3];
              if (v17)
                v17(v5, "[%s]: entitlements blob has unexpected version %lld\n", "validate_VNext", 0);
              return &unk_1EA97EC30;
            }
            v11 = (void (*)(_QWORD *, const char *, ...))v5[3];
            if (v11)
            {
              v12 = "number too large";
LABEL_31:
              v15 = "der_decode_number";
              goto LABEL_32;
            }
          }
          else
          {
            v11 = (void (*)(_QWORD *, const char *, ...))v5[3];
            if (v11)
            {
              v12 = "unknown number encoding";
              goto LABEL_31;
            }
          }
          return &unk_1EA97EC30;
        }
        v11 = (void (*)(_QWORD *, const char *, ...))v5[3];
        if (!v11)
          return &unk_1EA97EC30;
        v12 = "entitlements blob does not have CCDER_ENTITLEMENTS coding";
        v15 = "validate_VNext";
LABEL_32:
        v11(v5, "[%s]: %s\n", v15, v12);
        return &unk_1EA97EC30;
      }
      v25 = 0uLL;
      v23 = a4;
      v24 = a5;
      if ((ccder_blob_decode_range() & 1) == 0)
      {
        v11 = (void (*)(_QWORD *, const char *, ...))v5[3];
        if (!v11)
          return &unk_1EA97EC30;
        v12 = "entitlements blob does not have CCDER_CONSTRUCTED_SET coding";
        v15 = "validate_V0";
        goto LABEL_32;
      }
      v21 = 0;
      v22 = 0;
      v19 = v5;
      v20 = 0x2000000000000011;
      LOBYTE(v22) = *a2;
      if (recursivelyValidateEntitlements((uint64_t)&v19, v18))
      {
        *a3 = 1;
        v14 = &kCENoError;
      }
      else
      {
        v14 = &kCEMalformedEntitlements;
      }
      return *v14;
    }
  }
  else
  {
LABEL_16:
    v13 = (void (*)(_QWORD *, const char *, ...))result[3];
    if (v13)
      v13(result, "[%s]: %s\n", "CEValidateWithOptions", "invalid arguments passed in");
    return &unk_1EA97EC10;
  }
}

BOOL __emitSerializationElement_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __int128 v4;
  _OWORD v6[3];
  uint64_t v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_OWORD *)(a2 + 72);
  v6[0] = *(_OWORD *)(a2 + 56);
  v6[1] = v4;
  v6[2] = *(_OWORD *)(a2 + 88);
  v7 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = emitSerializationElement(v6, v3);
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == (_QWORD)Errors;
}

void *emitSerializationElement(unint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  void (*v6)(uint64_t, __int128 *);
  void (*v7)(uint64_t, __int128 *);
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  void (*v12)(uint64_t, __int128 *);
  __int128 v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, __int128 *);
  void (*v19)(unint64_t, const char *, ...);
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  _QWORD v26[6];
  _QWORD v27[6];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  _QWORD *v31;
  __int128 v32;

  if (!*(_BYTE *)(a1 + 33))
    return &unk_1EA97EC10;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2000000000;
  v31 = Errors;
  *(_QWORD *)&v32 = 0;
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 24);
  v22 = *(_OWORD *)(a1 + 40);
  if (!der_decode_next(v4, &v32, 0, 0, (uint64_t *)&v22))
    goto LABEL_19;
  if (v5 == (_QWORD)v32)
    goto LABEL_4;
  if ((uint64_t)v32 <= 11)
  {
    switch((_QWORD)v32)
    {
      case 0xA000000000000010:
LABEL_4:
        v23 = 0uLL;
        v6 = *(void (**)(uint64_t, __int128 *))(a2 + 16);
        v22 = 7uLL;
        v6(a2, &v22);
        if (a1 + 56 >= a1)
        {
          v27[0] = MEMORY[0x1E0C809B0];
          v27[1] = 0x40000000;
          v27[2] = __emitSerializationElement_block_invoke;
          v27[3] = &unk_1EA97ECD0;
          v27[4] = a2;
          v27[5] = &v28;
          der_vm_iterate_b(a1, (uint64_t)v27);
          v23 = 0uLL;
          v7 = *(void (**)(uint64_t, __int128 *))(a2 + 16);
          v8 = 8;
LABEL_17:
          v22 = (unint64_t)v8;
LABEL_18:
          v7(a2, &v22);
          break;
        }
        goto LABEL_29;
      case 1:
        v14 = *(_OWORD *)(a1 + 16);
        v22 = *(_OWORD *)a1;
        v23 = v14;
        v24 = *(_OWORD *)(a1 + 32);
        v25 = *(_QWORD *)(a1 + 48);
        v15 = der_vm_BOOL_from_context((unint64_t *)&v22);
        v7 = *(void (**)(uint64_t, __int128 *))(a2 + 16);
        *(_QWORD *)&v22 = 1;
        *((_QWORD *)&v22 + 1) = v15;
        goto LABEL_22;
      case 2:
        v10 = *(_OWORD *)(a1 + 16);
        v22 = *(_OWORD *)a1;
        v23 = v10;
        v24 = *(_OWORD *)(a1 + 32);
        v25 = *(_QWORD *)(a1 + 48);
        v11 = der_vm_integer_from_context((unint64_t *)&v22);
        v7 = *(void (**)(uint64_t, __int128 *))(a2 + 16);
        *(_QWORD *)&v22 = 4;
        *((_QWORD *)&v22 + 1) = v11;
LABEL_22:
        *(_QWORD *)&v23 = 0;
        BYTE8(v23) = 0;
        goto LABEL_18;
    }
LABEL_19:
    v9 = v29[3];
    _Block_object_dispose(&v28, 8);
    return (void *)v9;
  }
  if ((_QWORD)v32 != 12)
  {
    if ((_QWORD)v32 != 0x2000000000000010 && (_QWORD)v32 != 0x6000000000000010)
      goto LABEL_19;
    v23 = 0uLL;
    v12 = *(void (**)(uint64_t, __int128 *))(a2 + 16);
    v22 = 5uLL;
    v12(a2, &v22);
    if (a1 + 56 >= a1)
    {
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 0x40000000;
      v26[2] = __emitSerializationElement_block_invoke_2;
      v26[3] = &unk_1EA97ECF8;
      v26[4] = a2;
      v26[5] = &v28;
      der_vm_iterate_b(a1, (uint64_t)v26);
      v23 = 0uLL;
      v7 = *(void (**)(uint64_t, __int128 *))(a2 + 16);
      v8 = 6;
      goto LABEL_17;
    }
    goto LABEL_29;
  }
  v5 = *(_QWORD *)a1;
  v32 = *(_OWORD *)(a1 + 40);
  v22 = 0uLL;
  if ((ccder_blob_decode_range() & 1) != 0)
  {
    v16 = v22;
    v17 = *((_QWORD *)&v22 + 1) - v22;
    v18 = *(void (**)(uint64_t, __int128 *))(a2 + 16);
    *(_QWORD *)&v22 = 2;
    *((_QWORD *)&v22 + 1) = v16;
    *(_QWORD *)&v23 = v17;
    BYTE8(v23) = 0;
    v18(a2, &v22);
    goto LABEL_19;
  }
  v19 = *(void (**)(unint64_t, const char *, ...))(v5 + 24);
  if (v19)
    v19(v5, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
  if (v5 && v5 >= v5 + 64)
LABEL_29:
    __break(0x5519u);
  v20 = (*(uint64_t (**)(unint64_t, const char *, ...))(v5 + 32))(v5, "[%s]: %s\n", "der_vm_string_from_context", "Attempting to select a string value from a non-string DER object");
  return (void *)der_vm_iterate_b(v20, v21);
}

uint64_t der_vm_iterate_b(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t result;
  int v7;
  void (*v8)(unint64_t, const char *, ...);
  const char *v9;
  int v10;
  __int128 v11;
  __int128 v12;
  void (*v13)(unint64_t, const char *, ...);
  _OWORD v14[3];
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  __int128 v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD v26[2];

  if (!a2 || !*(_BYTE *)(a1 + 33))
    return (uint64_t)&unk_1EA97EC10;
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)a1 + 64;
  v25 = 0;
  v26[0] = 0;
  v24 = 0;
  v23 = *(_OWORD *)(a1 + 40);
  result = der_decode_next(v4, v26, 0, &v24, (uint64_t *)&v23);
  if ((result & 1) == 0)
  {
    v8 = *(void (**)(unint64_t, const char *, ...))(v4 + 24);
    if (!v8)
      return (uint64_t)&unk_1EA97EC30;
    if (v4 && v4 >= v5)
      goto LABEL_40;
    v9 = "iterable decoding failure";
LABEL_33:
    v8(v4, "[%s]: %s\n", "der_vm_iterate_b", v9);
    return (uint64_t)&unk_1EA97EC30;
  }
  if (*(_QWORD *)(a1 + 24) == v26[0])
  {
LABEL_8:
    v7 = 1;
    goto LABEL_16;
  }
  v7 = 2;
  if (v26[0] == 0x6000000000000010 || v26[0] == 0x2000000000000010)
  {
    while (1)
    {
LABEL_16:
      if (v24 >= v25)
        return (uint64_t)Errors;
      v11 = *(_OWORD *)(a1 + 16);
      v12 = *(_OWORD *)(a1 + 32);
      v14[0] = *(_OWORD *)a1;
      v14[1] = v11;
      v14[2] = v12;
      v15 = *(_QWORD *)(a1 + 48);
      v16 = v14[0];
      v17 = v11;
      v18 = v12;
      v19 = v15;
      v20 = v7;
      v21 = 0;
      v22 = 0;
      result = der_decode_next(*(_QWORD *)a1, v26, (_QWORD *)&v18 + 1, 0, (uint64_t *)&v24);
      if ((result & 1) == 0)
        break;
      if (*((_QWORD *)&v17 + 1) == v26[0])
      {
        v10 = 1;
      }
      else if (v26[0] > 0x200000000000000FLL)
      {
        if (v26[0] == 0x6000000000000010 || v26[0] == 0x2000000000000010)
          v10 = 2;
        else
LABEL_25:
          v10 = 0;
      }
      else
      {
        v10 = 5;
        switch(v26[0])
        {
          case 1:
            break;
          case 2:
            v10 = 3;
            break;
          case 4:
            v10 = 6;
            break;
          case 0xCLL:
            v10 = 4;
            break;
          default:
            goto LABEL_25;
        }
      }
      v21 = v10;
      if (((*(uint64_t (**)(uint64_t, _OWORD *))(a2 + 16))(a2, v14) & 1) == 0)
        return (uint64_t)Errors;
    }
    v8 = *(void (**)(unint64_t, const char *, ...))(v4 + 24);
    if (!v8)
      return (uint64_t)&unk_1EA97EC30;
    if (v4 && v4 >= v5)
      goto LABEL_40;
    v9 = "encountered invalid element in an iterable";
    goto LABEL_33;
  }
  if (v26[0] == 0xA000000000000010)
    goto LABEL_8;
  v13 = *(void (**)(unint64_t, const char *, ...))(v4 + 24);
  if (!v13)
    return (uint64_t)&unk_1EA97EC10;
  if (!v4 || v4 < v5)
  {
    v13(v4, "[%s]: %s\n", "der_vm_iterate_b", "iteration over a non-iterable type");
    return (uint64_t)&unk_1EA97EC10;
  }
LABEL_40:
  __break(0x5519u);
  return result;
}

uint64_t __der_vm_iterate_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_OWORD *);
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v8[8];

  *(_QWORD *)(a2 + 120) = *(_QWORD *)(a1 + 32);
  v2 = *(uint64_t (**)(_OWORD *))(a1 + 40);
  v3 = *(_OWORD *)(a2 + 80);
  v8[4] = *(_OWORD *)(a2 + 64);
  v8[5] = v3;
  v4 = *(_OWORD *)(a2 + 112);
  v8[6] = *(_OWORD *)(a2 + 96);
  v8[7] = v4;
  v5 = *(_OWORD *)(a2 + 16);
  v8[0] = *(_OWORD *)a2;
  v8[1] = v5;
  v6 = *(_OWORD *)(a2 + 48);
  v8[2] = *(_OWORD *)(a2 + 32);
  v8[3] = v6;
  return v2(v8);
}

uint64_t manufacturingCallback(unint64_t a1)
{
  unint64_t v1;
  void (**v2)(_QWORD, const char *, ...);
  id v3;
  id v4;
  int v5;
  __int128 v6;
  void *v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  void (*v16)(unint64_t, const char *, ...);
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  _BYTE v22[56];
  _OWORD v23[4];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  _OWORD v28[16];
  uint64_t v29;

  v1 = a1;
  v29 = *MEMORY[0x1E0C80C00];
  v2 = *(void (***)(_QWORD, const char *, ...))a1;
  v3 = *(id *)(a1 + 120);
  v4 = *(id *)(v1 + 120);
  v5 = *(_DWORD *)(v1 + 116);
  if (v5 != 2)
  {
    if (v5)
    {
      if (*(_DWORD *)(v1 + 112) == 2)
      {
        v6 = *(_OWORD *)(v1 + 72);
        v28[0] = *(_OWORD *)(v1 + 56);
        v28[1] = v6;
        v28[2] = *(_OWORD *)(v1 + 88);
        *(_QWORD *)&v28[3] = *(_QWORD *)(v1 + 104);
        objectForActiveContext((uint64_t)v28);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v7);

LABEL_10:
        return 1;
      }
      v2[4](v2, "[%s]: %s\n", "manufacturingCallback", "CoreEntitlements: not a sequence");
    }
    else
    {
      v2[4](v2, "[%s]: %s\n", "manufacturingCallback", "CoreEntitlements: unknown DER type");
    }
    goto LABEL_19;
  }
  if (*(_DWORD *)(v1 + 112) != 1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_OWORD *)(v1 + 72);
    v28[0] = *(_OWORD *)(v1 + 56);
    v28[1] = v14;
    v28[2] = *(_OWORD *)(v1 + 88);
    *(_QWORD *)&v28[3] = *(_QWORD *)(v1 + 104);
    *(_QWORD *)&v24 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v24 + 1) = 0x40000000;
    *(_QWORD *)&v25 = __der_vm_iterate_block_invoke;
    *((_QWORD *)&v25 + 1) = &__block_descriptor_tmp_156;
    *(_QWORD *)&v26 = v13;
    *((_QWORD *)&v26 + 1) = manufacturingCallback;
    if ((_QWORD *)der_vm_iterate_b((uint64_t)v28, (uint64_t)&v24) == Errors)
    {
      objc_msgSend(v4, "addObject:", v13);

      goto LABEL_10;
    }
    goto LABEL_18;
  }
  v18 = *(_OWORD *)(v1 + 56);
  v19 = *(_OWORD *)(v1 + 72);
  v20 = *(_OWORD *)(v1 + 88);
  v21 = *(_QWORD *)(v1 + 104);
  memset(v23, 0, 56);
  memset((char *)v28 + 8, 0, 248);
  v8 = *(_OWORD *)(v1 + 72);
  v24 = *(_OWORD *)(v1 + 56);
  v25 = v8;
  v26 = *(_OWORD *)(v1 + 88);
  v27 = *(_QWORD *)(v1 + 104);
  *(_QWORD *)&v28[0] = 2;
  v2 = (void (**)(_QWORD, const char *, ...))v3;
  der_vm_execute_nocopy((unint64_t)&v24, (size_t *)v28, (uint64_t)v23);
  v1 = *(_QWORD *)&v23[0];
  v24 = *(_OWORD *)((char *)&v23[2] + 8);
  v28[0] = 0uLL;
  if ((ccder_blob_decode_range() & 1) != 0)
  {
    v9 = *(_QWORD *)&v28[0];
    v10 = *((_QWORD *)&v28[0] + 1) - *(_QWORD *)&v28[0];
    v24 = v18;
    v25 = v19;
    v26 = v20;
    v27 = v21;
    v28[0] = xmmword_1DF0773C0;
    memset(&v28[1], 0, 240);
    der_vm_execute_nocopy((unint64_t)&v24, (size_t *)v28, (uint64_t)v22);
    objectForActiveContext((uint64_t)v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v9, v10, 4);
    objc_msgSend(v2, "setObject:forKey:", v11, v12);

    goto LABEL_10;
  }
  v16 = *(void (**)(unint64_t, const char *, ...))(v1 + 24);
  if (v16)
    v16(v1, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
  if (v1 && v1 >= v1 + 64)
  {
    __break(0x5519u);
LABEL_18:
    v2[4](v2, "[%s]: %s\n", "manufacturingCallback", "CoreEntitlements: Couldn't iterate over DER entitlements\n");
  }
LABEL_19:
  v17 = (*(uint64_t (**)(unint64_t, const char *, ...))(v1 + 32))(v1, "[%s]: %s\n", "der_vm_string_from_context", "Attempting to select a string value from a non-string DER object");
  return (uint64_t)objectForActiveContext(v17);
}

id objectForActiveContext(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  int v4;
  __n128 v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  int v10;
  void *v11;
  id v12;
  __int128 v13;
  void (*v15)(unint64_t, const char *, ...);
  void (*v16)(unint64_t, const char *, ...);
  __n128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void *v23;
  uint64_t v24;
  uint64_t (*v25)();

  v2 = *(_QWORD *)a1;
  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(unsigned __int8 *)(a1 + 33);
  v5 = *(__n128 *)(a1 + 40);
  *(_QWORD *)&v21 = 0;
  if (v4)
  {
    v1 = a1;
    v17 = v5;
    if (der_decode_next(v2, &v21, 0, 0, (uint64_t *)&v17))
    {
      if (v3 == (_QWORD)v21)
      {
LABEL_4:
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
        v6 = objc_claimAutoreleasedReturnValue();
LABEL_5:
        v7 = (void *)v6;
        v8 = *(_OWORD *)(v1 + 16);
        v17 = *(__n128 *)v1;
        v18 = v8;
        v19 = *(_OWORD *)(v1 + 32);
        v20 = *(_QWORD *)(v1 + 48);
        *(_QWORD *)&v21 = MEMORY[0x1E0C809B0];
        *((_QWORD *)&v21 + 1) = 0x40000000;
        v22 = __der_vm_iterate_block_invoke;
        v23 = &__block_descriptor_tmp_156;
        v24 = v6;
        v25 = manufacturingCallback;
        der_vm_iterate_b((uint64_t)&v17, (uint64_t)&v21);
        return v7;
      }
      if ((uint64_t)v21 > 0x200000000000000FLL)
      {
        if ((_QWORD)v21 == 0x6000000000000010 || (_QWORD)v21 == 0x2000000000000010)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
          v6 = objc_claimAutoreleasedReturnValue();
          goto LABEL_5;
        }
      }
      else
      {
        switch((uint64_t)v21)
        {
          case 1:
            v9 = *(_OWORD *)(v1 + 16);
            v17 = *(__n128 *)v1;
            v18 = v9;
            v19 = *(_OWORD *)(v1 + 32);
            v20 = *(_QWORD *)(v1 + 48);
            v10 = der_vm_BOOL_from_context(v17.n128_u64);
            v11 = (void *)MEMORY[0x1E0C9AAA0];
            if (v10)
              v11 = (void *)MEMORY[0x1E0C9AAB0];
            v12 = v11;
            goto LABEL_21;
          case 2:
            goto LABEL_16;
          case 3:
          case 5:
          case 6:
          case 7:
          case 8:
          case 9:
          case 10:
          case 11:
            break;
          case 4:
            v2 = *(_QWORD *)v1;
            v21 = *(_OWORD *)(v1 + 40);
            v17 = 0uLL;
            if ((ccder_blob_decode_range() & 1) != 0)
            {
              v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v17.n128_u64[0], v17.n128_u64[1] - v17.n128_u64[0]);
              goto LABEL_21;
            }
            v16 = *(void (**)(unint64_t, const char *, ...))(v2 + 24);
            if (v16)
              v16(v2, "[%s]: %s\n", "der_decode_data", "Unknown data encoding");
            if (v2 && v2 >= v2 + 64)
              goto LABEL_32;
            break;
          case 12:
            v2 = *(_QWORD *)v1;
            v21 = *(_OWORD *)(v1 + 40);
            v17 = 0uLL;
            if ((ccder_blob_decode_range() & 1) != 0)
            {
              v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v17.n128_u64[0], v17.n128_u64[1] - v17.n128_u64[0], 4);
              goto LABEL_21;
            }
            v15 = *(void (**)(unint64_t, const char *, ...))(v2 + 24);
            if (v15)
              v15(v2, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
            if (v2 && v2 >= v2 + 64)
LABEL_32:
              __break(0x5519u);
            break;
          default:
            if ((_QWORD)v21 != 0xA000000000000010)
              break;
            goto LABEL_4;
        }
      }
    }
  }
  (*(void (**)(unint64_t, const char *, __n128))(v2 + 32))(v2, "[%s]: %s\n", v5);
LABEL_16:
  v13 = *(_OWORD *)(v1 + 16);
  v17 = *(__n128 *)v1;
  v18 = v13;
  v19 = *(_OWORD *)(v1 + 32);
  v20 = *(_QWORD *)(v1 + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", der_vm_integer_from_context(v17.n128_u64));
  v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:
  v7 = v12;
  return v7;
}

unint64_t der_vm_execute_nocopy@<X0>(unint64_t result@<X0>, size_t *a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  size_t v8;
  uint64_t (*v9)(unint64_t, const char *, ...);
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  size_t v14;
  uint64_t v15;
  __int128 v16;
  int v17;
  BOOL v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  _BOOL4 v22;
  uint64_t v23;
  __int128 v25;
  __int128 v26;
  _QWORD *v27;
  size_t *v28;
  __int128 v29;
  __int128 v30;
  const void *v31;
  void **v32;
  __int128 v33;
  size_t *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD *v39;
  size_t *v40;
  __int128 v41;
  __int128 v42;
  uint64_t (*v43)(unint64_t, const char *, ...);
  const char *v44;
  __int128 v45;
  __int128 v46;
  const void *v47;
  size_t *v48;
  _QWORD *v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  __int128 v53;
  uint64_t (*v54)(unint64_t, const char *, ...);
  const char *v55;
  const char *v56;
  size_t v57;
  const void *v58;
  uint64_t (*v59)(unint64_t, const char *, ...);
  size_t v60;
  uint64_t v61;
  __int128 v62;
  uint64_t v63;
  unint64_t v64;
  BOOL v65;
  char v66;
  unint64_t v67;
  unint64_t v68;
  const void *v69;
  size_t v70;
  int v71;
  int v73;
  uint64_t (*v74)(unint64_t, const char *, ...);
  const char *v75;
  size_t v76;
  uint64_t v77;
  __int128 v78;
  size_t v79;
  uint64_t v80;
  __int128 v81;
  size_t v82;
  size_t v83;
  uint64_t (*v85)(unint64_t, const char *, ...);
  char *v87;
  char *v88;
  const void *v89;
  char *v90;
  _BYTE *v91;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  unsigned __int8 *v96;
  uint64_t (*v97)(unint64_t, const char *, ...);
  const char *v98;
  __int128 v99;
  uint64_t (*v100)(uint64_t *);
  __int128 v101;
  uint64_t (*v102)(unint64_t, const char *, ...);
  const char *v103;
  size_t v104;
  char v105;
  __int128 v106;
  unint64_t v107;
  unint64_t v108;
  __int128 v110;
  _BYTE *v111;
  size_t *v112;
  size_t v113;
  void (*v114)(unint64_t, const char *, ...);
  void (*v115)(unint64_t, const char *, ...);
  __int128 v116;
  uint64_t v117;
  uint64_t v118;
  unsigned __int8 *v119;
  BOOL v120;
  void (*v121)(unint64_t, const char *, ...);
  uint64_t v122;
  uint64_t v123;
  void *__s1;
  __int128 v125;
  void *__s2;
  size_t v127;
  __int128 v128;
  void *v129[2];
  __int128 v130;
  __int128 v131;
  __int128 v132;
  uint64_t v133;
  _BYTE v134[24];
  void *v135;
  void **v136;
  uint64_t (*v137)(uint64_t *);
  uint64_t v138;

  v3 = result;
  v138 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(result + 33))
  {
LABEL_6:
    v10 = *(_OWORD *)(v3 + 16);
    *(_OWORD *)a3 = *(_OWORD *)v3;
    *(_OWORD *)(a3 + 16) = v10;
    *(_OWORD *)(a3 + 32) = *(_OWORD *)(v3 + 32);
    v11 = *(_QWORD *)(v3 + 48);
LABEL_7:
    *(_QWORD *)(a3 + 48) = v11;
    return result;
  }
  v6 = *(_QWORD *)result;
  v7 = *(_QWORD *)result + 64;
  v8 = *a2;
  switch(*a2 & 0xBFFFFFFFFFFFFFFFLL)
  {
    case 0uLL:
      v9 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
      if (!v9)
        goto LABEL_6;
      if (v6 >= v7)
        goto LABEL_317;
      result = v9(v6, "[%s]: %s\n", "der_vm_execute_nocopy", "noop");
      goto LABEL_6;
    case 1uLL:
      if (result + 56 < result)
        goto LABEL_317;
      v33 = *(_OWORD *)(result + 16);
      v130 = *(_OWORD *)result;
      v131 = v33;
      LOBYTE(v132) = *(_BYTE *)(result + 32);
      *(_OWORD *)v134 = *(_OWORD *)(result + 34);
      *(_QWORD *)&v134[14] = *(_QWORD *)(result + 48);
      *((_QWORD *)&v130 + 1) = 0;
      *(_QWORD *)&v131 = 0;
      if ((v8 & 0x4000000000000000) != 0)
      {
        __s1 = (void *)a2[1];
        v34 = a2 + 2;
      }
      else
      {
        __s1 = a2 + 1;
        v34 = a2 + 31;
      }
      v60 = *v34;
      v61 = *(_QWORD *)(result + 16);
      if (v61)
      {
        v6 = 0;
        v62 = *(_OWORD *)(result + 32);
        *(_OWORD *)(a3 + 16) = *(_OWORD *)(result + 16);
        *(_OWORD *)(a3 + 32) = v62;
        *(_OWORD *)a3 = *(_OWORD *)result;
        v63 = *(_QWORD *)(result + 40);
        *(_QWORD *)(a3 + 48) = *(_QWORD *)(result + 48);
        *(_BYTE *)(a3 + 33) = 0;
        v64 = v61 - 1;
        *(_QWORD *)(a3 + 8) = 0;
        *(_QWORD *)(a3 + 16) = 0;
        if (__s1)
          v65 = v60 == 0;
        else
          v65 = 1;
        v66 = v65;
        v122 = *(_QWORD *)(result + 8);
        v123 = v63;
        while (1)
        {
          v67 = (v6 + v64) >> 1;
          if ((v66 & 1) != 0)
            goto LABEL_325;
          v68 = *(_QWORD *)(v122 + 8 * v67);
          v69 = (const void *)(v123 + v68);
          if (!v69)
            goto LABEL_86;
          if (v60 >= HIDWORD(v68))
            v70 = HIDWORD(v68);
          else
            v70 = v60;
          if (v60 < HIDWORD(v68))
            v71 = -1;
          else
            v71 = 1;
          result = memcmp(__s1, v69, v70);
          if (v60 != HIDWORD(v68) && (_DWORD)result == 0)
            v73 = v71;
          else
            v73 = result;
          if (!v73)
          {
            *(_BYTE *)(a3 + 33) = 1;
            v107 = *(_QWORD *)(a3 + 40);
            v108 = v107 + (HIDWORD(v68) + v68);
            if (v108 <= *(_QWORD *)(a3 + 48) && v107 <= v108)
            {
              *(_QWORD *)(a3 + 40) = v108;
              return result;
            }
            while (1)
            {
              do
              {
LABEL_317:
                __break(0x5519u);
LABEL_318:
                v121 = *(void (**)(unint64_t, const char *, ...))(v6 + 24);
                if (v121)
                  v121(v6, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
              }
              while (v6 && v6 >= v6 + 64);
              (*(void (**)(unint64_t, const char *, ...))(v6 + 32))(v6, "[%s]: %s\n", "der_vm_string_from_context", "Attempting to select a string value from a non-string DER object");
LABEL_316:
              v129[0] = 0;
              v129[1] = 0;
            }
          }
          if (v73 < 0)
          {
LABEL_325:
            if (v6 + v64 < 2)
              return result;
            v64 = v67 - 1;
            if (v6 > v67 - 1)
              return result;
          }
          else
          {
LABEL_86:
            v6 = v67 + 1;
            if (v67 + 1 > v64)
              return result;
          }
        }
      }
      v129[0] = 0;
      v129[1] = 0;
      v128 = *(_OWORD *)(result + 40);
      result = der_decode_next(v6, 0, 0, v129, (uint64_t *)&v128);
      if ((result & 1) != 0)
      {
        if (v60)
        {
          if (v129[0] < v129[1])
          {
            if (v6 && v6 >= v7)
              goto LABEL_317;
            while (1)
            {
              __s2 = 0;
              v127 = 0;
              v125 = 0uLL;
              result = der_decode_key_value(v6, &__s2, &v125, v129);
              if (!(_DWORD)result)
                break;
              if (__s1 && __s2)
              {
                v82 = v127;
                v83 = v60 >= v127 ? v127 : v60;
                result = memcmp(__s1, __s2, v83);
                if (!(_DWORD)result && v60 == v82)
                {
                  *(_OWORD *)&v134[6] = v125;
                  LOBYTE(v85) = 1;
                  goto LABEL_294;
                }
              }
              if (v129[0] >= v129[1])
                goto LABEL_254;
            }
            v85 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
            if (v85)
            {
              result = v85(v6, "[%s]: %s\n", "der_vm_execute_select_key", "invalid dictionary element");
              LOBYTE(v85) = 0;
            }
LABEL_294:
            v116 = v131;
            *(_OWORD *)a3 = v130;
            *(_OWORD *)(a3 + 16) = v116;
            *(_BYTE *)(a3 + 32) = v132;
            *(_BYTE *)(a3 + 33) = (_BYTE)v85;
            goto LABEL_255;
          }
LABEL_254:
          v110 = v131;
          *(_OWORD *)a3 = v130;
          *(_OWORD *)(a3 + 16) = v110;
          *(_BYTE *)(a3 + 32) = v132;
          *(_BYTE *)(a3 + 33) = 0;
LABEL_255:
          *(_OWORD *)(a3 + 34) = *(_OWORD *)v134;
          v11 = *(_QWORD *)&v134[14];
          goto LABEL_7;
        }
        v102 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (!v102)
          goto LABEL_254;
        if (v6 && v6 >= v7)
          goto LABEL_317;
        v103 = "key length is invalid";
      }
      else
      {
        v102 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (!v102)
          goto LABEL_254;
        if (v6 && v6 >= v7)
          goto LABEL_317;
        v103 = "dictionary decoding failure";
      }
      result = v102(v6, "[%s]: %s\n", "der_vm_execute_select_key", v103);
      goto LABEL_254;
    case 2uLL:
      if (result + 56 < result)
        goto LABEL_317;
      v19 = *(_OWORD *)(result + 32);
      v20 = *(_OWORD *)result;
      *(_OWORD *)(a3 + 16) = *(_OWORD *)(result + 16);
      *(_OWORD *)(a3 + 32) = v19;
      *(_OWORD *)a3 = v20;
      *(_QWORD *)(a3 + 48) = *(_QWORD *)(result + 48);
      *(_BYTE *)(a3 + 33) = 0;
      *(_QWORD *)(a3 + 8) = 0;
      *(_QWORD *)(a3 + 16) = 0;
      v21 = a2[1];
      v130 = 0uLL;
      *(_OWORD *)v134 = *(_OWORD *)(result + 40);
      result = der_decode_next(v6, 0, 0, &v130, (uint64_t *)v134);
      if (!(_DWORD)result)
      {
        v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (!v54)
          return result;
        if (v6 && v6 >= v7)
          goto LABEL_317;
        v55 = "array decoding failure";
        goto LABEL_229;
      }
      v22 = (unint64_t)v130 < *((_QWORD *)&v130 + 1);
      if ((unint64_t)v130 < *((_QWORD *)&v130 + 1) && v21 >= 1)
      {
        while (1)
        {
          result = der_decode_next(v6, 0, 0, 0, (uint64_t *)&v130);
          if ((result & 1) == 0)
            break;
          v23 = v21 - 1;
          v22 = (unint64_t)v130 < *((_QWORD *)&v130 + 1);
          if ((unint64_t)v130 >= *((_QWORD *)&v130 + 1) || v21-- <= 1)
            goto LABEL_148;
        }
        v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (!v54)
          return result;
        if (v6 && v6 >= v7)
          goto LABEL_317;
        v55 = "encountered invalid element in an array";
LABEL_229:
        v56 = "der_vm_execute_select_index";
        return v54(v6, "[%s]: %s\n", v56, v55);
      }
      v23 = v21;
LABEL_148:
      if (v22 && v23 == 0)
      {
        if (!v6 || v6 < v7)
        {
          result = der_decode_next(v6, 0, (_QWORD *)(a3 + 40), 0, (uint64_t *)&v130);
          *(_BYTE *)(a3 + 33) = result;
          return result;
        }
        goto LABEL_317;
      }
      return result;
    case 3uLL:
      if (result + 56 < result)
        goto LABEL_317;
      return der_vm_execute_match_string(a3, (__int128 *)result, (uint64_t)a2);
    case 4uLL:
      if (result + 56 < result)
        goto LABEL_317;
      v25 = *(_OWORD *)(result + 32);
      v26 = *(_OWORD *)result;
      *(_OWORD *)(a3 + 16) = *(_OWORD *)(result + 16);
      *(_OWORD *)(a3 + 32) = v25;
      *(_OWORD *)a3 = v26;
      *(_QWORD *)(a3 + 48) = *(_QWORD *)(result + 48);
      *(_BYTE *)(a3 + 33) = 0;
      *(_QWORD *)(a3 + 8) = 0;
      *(_QWORD *)(a3 + 16) = 0;
      if ((v8 & 0x4000000000000000) != 0)
      {
        v27 = (_QWORD *)a2[1];
        v28 = a2 + 2;
      }
      else
      {
        v27 = a2 + 1;
        v28 = a2 + 31;
      }
      v57 = *v28;
      *(_OWORD *)v134 = *(_OWORD *)(result + 40);
      v130 = 0uLL;
      result = ccder_blob_decode_range();
      if ((result & 1) != 0)
      {
        if (!v57)
          goto LABEL_308;
        v58 = (const void *)v130;
        if (v57 > *((_QWORD *)&v130 + 1) - (_QWORD)v130)
        {
LABEL_63:
          *(_BYTE *)(a3 + 33) = 0;
          return result;
        }
        result = (unint64_t)v27;
        v104 = v57;
        goto LABEL_224;
      }
      v59 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
      if (!v59)
        return result;
      result = v59(v6, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
      v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
      if (!v54)
        return result;
      if (v6 && v6 >= v7)
        goto LABEL_317;
      v55 = "string decode failure";
      v56 = "der_vm_execute_match_string_prefix";
      return v54(v6, "[%s]: %s\n", v56, v55);
    case 5uLL:
      if (result + 56 < result)
        goto LABEL_317;
      v35 = *(_OWORD *)(result + 32);
      v36 = *(_OWORD *)result;
      *(_OWORD *)(a3 + 16) = *(_OWORD *)(result + 16);
      *(_OWORD *)(a3 + 32) = v35;
      *(_OWORD *)a3 = v36;
      *(_QWORD *)(a3 + 48) = *(_QWORD *)(result + 48);
      *(_BYTE *)(a3 + 33) = 0;
      *(_QWORD *)(a3 + 8) = 0;
      *(_QWORD *)(a3 + 16) = 0;
      *(_OWORD *)v134 = *(_OWORD *)(result + 40);
      v130 = 0uLL;
      result = ccder_blob_decode_range();
      if ((result & 1) == 0)
      {
        v74 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (!v74)
          goto LABEL_187;
        v75 = "Unknown BOOLean encoding";
        goto LABEL_186;
      }
      if (*((_QWORD *)&v130 + 1) - (_QWORD)v130 == 1)
      {
        if ((unint64_t)v130 >= *((_QWORD *)&v130 + 1))
          goto LABEL_317;
        v18 = a2[1] == (*(_BYTE *)v130 != 0);
        goto LABEL_235;
      }
      v74 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
      if (v74)
      {
        v75 = "BOOLean should be exactly 1 byte";
LABEL_186:
        result = v74(v6, "[%s]: %s\n", "der_decode_BOOLean", v75);
      }
LABEL_187:
      v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
      if (!v54)
        return result;
      if (v6 && v6 >= v7)
        goto LABEL_317;
      v55 = "BOOL decode failure";
      v56 = "der_vm_execute_match_BOOL";
      return v54(v6, "[%s]: %s\n", v56, v55);
    case 6uLL:
      if (result + 56 < result)
        goto LABEL_317;
      v37 = *(_OWORD *)(result + 32);
      v38 = *(_OWORD *)result;
      *(_OWORD *)(a3 + 16) = *(_OWORD *)(result + 16);
      *(_OWORD *)(a3 + 32) = v37;
      *(_OWORD *)a3 = v38;
      *(_QWORD *)(a3 + 48) = *(_QWORD *)(result + 48);
      *(_BYTE *)(a3 + 33) = 0;
      *(_QWORD *)(a3 + 8) = 0;
      *(_QWORD *)(a3 + 16) = 0;
      if ((v8 & 0x4000000000000000) != 0)
      {
        v39 = (_QWORD *)a2[1];
        v40 = a2 + 2;
      }
      else
      {
        v39 = a2 + 1;
        v40 = a2 + 31;
      }
      v76 = *v40;
      v77 = *(_QWORD *)(result + 24);
      v78 = *(_OWORD *)(result + 40);
      *(_QWORD *)v134 = 0;
      v130 = v78;
      result = der_decode_next(v6, v134, 0, 0, (uint64_t *)&v130);
      if (!(_DWORD)result || v77 == *(_QWORD *)v134)
        goto LABEL_112;
      if (*(_QWORD *)v134 != 12)
      {
        if (*(_QWORD *)v134 == 0x2000000000000010 || *(_QWORD *)v134 == 0x6000000000000010)
        {
          v129[0] = (void *)a3;
          v129[1] = a2;
          v99 = *(_OWORD *)(v3 + 16);
          v130 = *(_OWORD *)v3;
          v131 = v99;
          v132 = *(_OWORD *)(v3 + 32);
          v133 = *(_QWORD *)(v3 + 48);
          *(_QWORD *)v134 = MEMORY[0x1E0C809B0];
          *(_QWORD *)&v134[8] = 0x40000000;
          *(_QWORD *)&v134[16] = __der_vm_iterate_block_invoke;
          v135 = &__block_descriptor_tmp_156;
          v100 = string_value_allowed_iterate;
LABEL_239:
          v136 = v129;
          v137 = v100;
          return der_vm_iterate_b((uint64_t)&v130, (uint64_t)v134);
        }
LABEL_112:
        v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (v54)
        {
          if (v6 >= v7)
            goto LABEL_317;
          v55 = "Unexpected type to match against";
          v56 = "der_vm_execute_string_value_allowed";
          return v54(v6, "[%s]: %s\n", v56, v55);
        }
        return result;
      }
      result = der_vm_execute_match_string((uint64_t)&v130, (__int128 *)v3, (uint64_t)a2);
      if (BYTE1(v132))
        goto LABEL_308;
      v6 = *(_QWORD *)v3;
      *(_OWORD *)v129 = *(_OWORD *)(v3 + 40);
      *(_OWORD *)v134 = 0uLL;
      if ((ccder_blob_decode_range() & 1) == 0)
        goto LABEL_318;
      result = *(_QWORD *)v134;
      if (*(_QWORD *)&v134[8] == *(_QWORD *)v134)
        return result;
      v111 = (_BYTE *)(*(_QWORD *)&v134[8] - 1);
      if (!*(_QWORD *)&v134[8] || (unint64_t)v111 < *(_QWORD *)v134)
        goto LABEL_317;
      if (*v111 != 42)
        return result;
      v104 = ~*(_QWORD *)v134 + *(_QWORD *)&v134[8];
      if (!v104)
        goto LABEL_308;
      if (v104 > v76)
        goto LABEL_63;
      v58 = v39;
      goto LABEL_224;
    case 7uLL:
      if (result + 56 < result)
        goto LABEL_317;
      v41 = *(_OWORD *)(result + 32);
      v42 = *(_OWORD *)result;
      *(_OWORD *)(a3 + 16) = *(_OWORD *)(result + 16);
      *(_OWORD *)(a3 + 32) = v41;
      *(_OWORD *)a3 = v42;
      *(_QWORD *)(a3 + 48) = *(_QWORD *)(result + 48);
      *(_BYTE *)(a3 + 33) = 0;
      *(_QWORD *)(a3 + 8) = 0;
      *(_QWORD *)(a3 + 16) = 0;
      *(_OWORD *)v134 = *(_OWORD *)(result + 40);
      v130 = 0uLL;
      result = ccder_blob_decode_range();
      if ((result & 1) == 0)
      {
        v43 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (!v43)
          goto LABEL_118;
        v44 = "unknown number encoding";
        goto LABEL_117;
      }
      if (*((_QWORD *)&v130 + 1) - (_QWORD)v130 < 9uLL)
      {
        if ((unint64_t)v130 >= *((_QWORD *)&v130 + 1))
        {
          v95 = 0;
        }
        else
        {
          v94 = 0;
          v95 = 0;
          do
          {
            if (!v94 && *(char *)v130 < 0)
              v95 = -1;
            v96 = (unsigned __int8 *)(v130 + v94);
            if ((unint64_t)(v130 + v94) >= *((_QWORD *)&v130 + 1)
              || (unint64_t)v96 < (unint64_t)v130)
            {
              goto LABEL_317;
            }
            v95 = *v96 | (unint64_t)(v95 << 8);
            ++v94;
          }
          while (*((_QWORD *)&v130 + 1) - (_QWORD)v130 != v94);
        }
        v18 = v95 == a2[1];
        goto LABEL_235;
      }
      v43 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
      if (v43)
      {
        v44 = "number too large";
LABEL_117:
        result = v43(v6, "[%s]: %s\n", "der_decode_number", v44);
      }
LABEL_118:
      v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
      if (!v54)
        return result;
      if (v6 && v6 >= v7)
        goto LABEL_317;
LABEL_121:
      v55 = "BOOL decode failure";
      v56 = "der_vm_execute_match_integer";
      return v54(v6, "[%s]: %s\n", v56, v55);
    case 8uLL:
      if (result + 56 < result)
        goto LABEL_317;
      v45 = *(_OWORD *)(result + 32);
      v46 = *(_OWORD *)result;
      *(_OWORD *)(a3 + 16) = *(_OWORD *)(result + 16);
      *(_OWORD *)(a3 + 32) = v45;
      *(_OWORD *)a3 = v46;
      *(_QWORD *)(a3 + 48) = *(_QWORD *)(result + 48);
      *(_BYTE *)(a3 + 33) = 0;
      v47 = a2 + 1;
      *(_QWORD *)(a3 + 8) = 0;
      *(_QWORD *)(a3 + 16) = 0;
      if ((v8 & 0x4000000000000000) != 0)
      {
        v49 = (_QWORD *)a2[1];
        v48 = a2 + 2;
      }
      else
      {
        v48 = a2 + 31;
        v49 = a2 + 1;
      }
      v79 = *v48;
      v80 = *(_QWORD *)(result + 24);
      v81 = *(_OWORD *)(result + 40);
      *(_QWORD *)v134 = 0;
      v130 = v81;
      result = der_decode_next(v6, v134, 0, 0, (uint64_t *)&v130);
      if (!(_DWORD)result || v80 == *(_QWORD *)v134)
        goto LABEL_125;
      if (*(_QWORD *)v134 != 12)
      {
        if (*(_QWORD *)v134 == 0x2000000000000010 || *(_QWORD *)v134 == 0x6000000000000010)
        {
          v129[0] = (void *)a3;
          v129[1] = a2;
          v101 = *(_OWORD *)(v3 + 16);
          v130 = *(_OWORD *)v3;
          v131 = v101;
          v132 = *(_OWORD *)(v3 + 32);
          v133 = *(_QWORD *)(v3 + 48);
          *(_QWORD *)v134 = MEMORY[0x1E0C809B0];
          *(_QWORD *)&v134[8] = 0x40000000;
          *(_QWORD *)&v134[16] = __der_vm_iterate_block_invoke;
          v135 = &__block_descriptor_tmp_156;
          v100 = string_prefix_allowed_iterate;
          goto LABEL_239;
        }
LABEL_125:
        v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (v54)
        {
          if (v6 >= v7)
            goto LABEL_317;
          v55 = "Unexpected type to match against";
          v56 = "der_vm_execute_string_prefix_value_allowed";
          return v54(v6, "[%s]: %s\n", v56, v55);
        }
        return result;
      }
      if ((*((_BYTE *)a2 + 7) & 0x40) != 0)
      {
        v47 = (const void *)a2[1];
        v112 = a2 + 2;
      }
      else
      {
        v112 = a2 + 31;
      }
      v6 = *(_QWORD *)v3;
      v113 = *v112;
      *(_OWORD *)v134 = *(_OWORD *)(v3 + 40);
      v130 = 0uLL;
      result = ccder_blob_decode_range();
      if ((result & 1) != 0)
      {
        if (!v113)
          goto LABEL_308;
        if (v113 <= *((_QWORD *)&v130 + 1) - (_QWORD)v130)
        {
          result = memcmp(v47, (const void *)v130, v113);
          if (!(_DWORD)result)
            goto LABEL_308;
        }
      }
      else
      {
        v114 = *(void (**)(unint64_t, const char *, ...))(v6 + 24);
        if (v114)
        {
          v114(v6, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
          v115 = *(void (**)(unint64_t, const char *, ...))(v6 + 24);
          if (v115)
          {
            if (v6 && v6 >= v6 + 64)
              goto LABEL_317;
            v115(v6, "[%s]: %s\n", "der_vm_execute_match_string_prefix", "string decode failure");
          }
        }
      }
      v6 = *(_QWORD *)v3;
      *(_OWORD *)v134 = *(_OWORD *)(v3 + 40);
      v130 = 0uLL;
      result = ccder_blob_decode_range();
      if ((result & 1) == 0)
        goto LABEL_318;
      if (v79)
      {
        v58 = (const void *)v130;
        if (v79 > *((_QWORD *)&v130 + 1) - (_QWORD)v130)
          goto LABEL_63;
        result = (unint64_t)v49;
        v104 = v79;
LABEL_224:
        result = memcmp((const void *)result, v58, v104);
        v18 = (_DWORD)result == 0;
LABEL_235:
        v105 = v18;
        goto LABEL_309;
      }
      goto LABEL_308;
    case 9uLL:
      if (result + 56 < result)
        goto LABEL_317;
      v29 = *(_OWORD *)(result + 32);
      v30 = *(_OWORD *)result;
      *(_OWORD *)(a3 + 16) = *(_OWORD *)(result + 16);
      *(_OWORD *)(a3 + 32) = v29;
      *(_OWORD *)a3 = v30;
      *(_QWORD *)(a3 + 48) = *(_QWORD *)(result + 48);
      *(_BYTE *)(a3 + 33) = 0;
      *(_QWORD *)(a3 + 8) = 0;
      *(_QWORD *)(a3 + 16) = 0;
      v130 = 0uLL;
      *(_OWORD *)v134 = *(_OWORD *)(result + 40);
      result = der_decode_next(v6, 0, 0, &v130, (uint64_t *)v134);
      if ((result & 1) == 0)
      {
        v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (!v54)
          return result;
        if (v6 && v6 >= v7)
          goto LABEL_317;
        v55 = "dictionary decoding failure";
        goto LABEL_247;
      }
      if ((*((_BYTE *)a2 + 7) & 0x40) != 0)
      {
        v31 = (const void *)a2[1];
        v32 = (void **)(a2 + 2);
      }
      else
      {
        v31 = a2 + 1;
        v32 = (void **)(a2 + 31);
      }
      v87 = (char *)*v32;
      if (!*v32)
      {
        v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (!v54)
          return result;
        if (v6 && v6 >= v7)
          goto LABEL_317;
        v55 = "key length is invalid";
        goto LABEL_247;
      }
      if ((unint64_t)v130 >= *((_QWORD *)&v130 + 1))
        return result;
      if (v6 && v6 >= v7)
        goto LABEL_316;
      while (2)
      {
        v129[0] = 0;
        v129[1] = 0;
        v128 = 0uLL;
        result = der_decode_key_value(v6, v129, &v128, &v130);
        if ((_DWORD)result)
        {
          v88 = (char *)v129[1];
          if (v129[1])
          {
            v89 = v129[0];
            v90 = (char *)v129[1] - 1;
            v91 = (char *)v129[0] + (unint64_t)v129[1] - 1;
            if (v91 < v129[0] || v91 >= (char *)v129[0] + (unint64_t)v129[1])
              goto LABEL_317;
            if (*v91 == 42)
            {
              if (v129[1] == (void *)1 || v90 <= v87 && (result = memcmp(v129[0], v31, (size_t)v90), !(_DWORD)result))
              {
LABEL_162:
                *(_BYTE *)(a3 + 33) = 1;
                *(_OWORD *)(a3 + 40) = v128;
              }
LABEL_163:
              if ((unint64_t)v130 >= *((_QWORD *)&v130 + 1))
                return result;
              continue;
            }
          }
          else
          {
            v89 = v129[0];
          }
          if (v31 && v89)
          {
            v93 = v87 >= v129[1] ? v129[1] : v87;
            result = memcmp(v31, v89, (size_t)v93);
            if (v87 == v88 && !(_DWORD)result)
              goto LABEL_162;
          }
          goto LABEL_163;
        }
        break;
      }
      v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
      if (!v54)
        return result;
      v55 = "invalid dictionary element";
LABEL_247:
      v56 = "der_vm_execute_select_longest_matching_key";
      return v54(v6, "[%s]: %s\n", v56, v55);
    case 0xAuLL:
      if (result + 56 < result)
        goto LABEL_317;
      v50 = *(_OWORD *)(result + 32);
      v51 = *(_OWORD *)result;
      *(_OWORD *)(a3 + 16) = *(_OWORD *)(result + 16);
      *(_OWORD *)(a3 + 32) = v50;
      *(_OWORD *)a3 = v51;
      *(_QWORD *)(a3 + 48) = *(_QWORD *)(result + 48);
      *(_BYTE *)(a3 + 33) = 0;
      *(_QWORD *)(a3 + 8) = 0;
      *(_QWORD *)(a3 + 16) = 0;
      v52 = *(_QWORD *)(result + 24);
      v53 = *(_OWORD *)(result + 40);
      *(_QWORD *)v134 = 0;
      v130 = v53;
      result = der_decode_next(v6, v134, 0, 0, (uint64_t *)&v130);
      if (!(_DWORD)result || v52 == *(_QWORD *)v134)
        goto LABEL_56;
      if (*(_QWORD *)v134 == 0x6000000000000010 || *(_QWORD *)v134 == 0x2000000000000010)
      {
        v129[0] = (void *)a3;
        v129[1] = a2;
        v106 = *(_OWORD *)(v3 + 16);
        v130 = *(_OWORD *)v3;
        v131 = v106;
        v132 = *(_OWORD *)(v3 + 32);
        v133 = *(_QWORD *)(v3 + 48);
        *(_QWORD *)v134 = MEMORY[0x1E0C809B0];
        *(_QWORD *)&v134[8] = 0x40000000;
        *(_QWORD *)&v134[16] = __der_vm_iterate_block_invoke;
        v135 = &__block_descriptor_tmp_156;
        v100 = integer_allowed_iterate;
        goto LABEL_239;
      }
      if (*(_QWORD *)v134 != 2)
      {
LABEL_56:
        v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (!v54)
          return result;
        if (v6 >= v7)
          goto LABEL_317;
        v55 = "Unexpected type to match against";
        v56 = "der_vm_execute_integer_value_allowed";
        return v54(v6, "[%s]: %s\n", v56, v55);
      }
      v6 = *(_QWORD *)v3;
      *(_OWORD *)v134 = *(_OWORD *)(v3 + 40);
      v130 = 0uLL;
      result = ccder_blob_decode_range();
      if ((result & 1) == 0)
      {
        v97 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (v97)
        {
          v98 = "unknown number encoding";
          goto LABEL_272;
        }
LABEL_273:
        v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (!v54)
          return result;
        if (v6 && v6 >= v6 + 64)
          goto LABEL_317;
        goto LABEL_121;
      }
      if (*((_QWORD *)&v130 + 1) - (_QWORD)v130 >= 9uLL)
      {
        v97 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (v97)
        {
          v98 = "number too large";
LABEL_272:
          result = v97(v6, "[%s]: %s\n", "der_decode_number", v98);
          goto LABEL_273;
        }
        goto LABEL_273;
      }
      if ((unint64_t)v130 >= *((_QWORD *)&v130 + 1))
      {
        v118 = 0;
      }
      else
      {
        v117 = 0;
        v118 = 0;
        do
        {
          if (!v117 && *(char *)v130 < 0)
            v118 = -1;
          v119 = (unsigned __int8 *)(v130 + v117);
          if ((unint64_t)(v130 + v117) >= *((_QWORD *)&v130 + 1)
            || (unint64_t)v119 < (unint64_t)v130)
          {
            goto LABEL_317;
          }
          v118 = *v119 | (unint64_t)(v118 << 8);
          ++v117;
        }
        while (*((_QWORD *)&v130 + 1) - (_QWORD)v130 != v117);
      }
      if (v118 != a2[1])
        return result;
LABEL_308:
      v105 = 1;
LABEL_309:
      *(_BYTE *)(a3 + 33) = v105;
      return result;
    case 0xBuLL:
      if (result + 56 < result)
        goto LABEL_317;
      v12 = *(_OWORD *)(result + 32);
      v13 = *(_OWORD *)result;
      *(_OWORD *)(a3 + 16) = *(_OWORD *)(result + 16);
      *(_OWORD *)(a3 + 32) = v12;
      *(_OWORD *)a3 = v13;
      *(_QWORD *)(a3 + 48) = *(_QWORD *)(result + 48);
      *(_BYTE *)(a3 + 33) = 0;
      *(_QWORD *)(a3 + 8) = 0;
      *(_QWORD *)(a3 + 16) = 0;
      v14 = a2[1];
      if (v14 - 7 < 0xFFFFFFFFFFFFFFFALL)
        return result;
      v15 = *(_QWORD *)(result + 24);
      v16 = *(_OWORD *)(result + 40);
      *(_QWORD *)v134 = 0;
      v130 = v16;
      result = der_decode_next(v6, v134, 0, 0, (uint64_t *)&v130);
      if (!(_DWORD)result)
        return result;
      if (v15 == *(_QWORD *)v134)
      {
        v17 = 1;
LABEL_13:
        v18 = v17 == (_DWORD)v14;
        goto LABEL_235;
      }
      if (*(uint64_t *)v134 > 0x200000000000000FLL)
      {
        if (*(_QWORD *)v134 == 0x6000000000000010 || *(_QWORD *)v134 == 0x2000000000000010)
        {
          v17 = 2;
          goto LABEL_13;
        }
      }
      else
      {
        v17 = 5;
        switch(*(_QWORD *)v134)
        {
          case 1:
            goto LABEL_13;
          case 2:
            v17 = 3;
            goto LABEL_13;
          case 4:
            v17 = 6;
            goto LABEL_13;
          case 0xCLL:
            v17 = 4;
            goto LABEL_13;
          default:
            return result;
        }
      }
      return result;
    default:
      if (v6)
        v120 = v6 >= v7;
      else
        v120 = 0;
      if (v120)
        goto LABEL_317;
      (*(void (**)(unint64_t, const char *, ...))(v6 + 32))(v6, "[%s]: %s\n", "der_vm_execute_nocopy", "unhandled opcode");
      goto LABEL_316;
  }
}

uint64_t recursivelyValidateEntitlements(uint64_t result, uint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;
  void (*v4)(unint64_t, const char *);
  BOOL v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  const void *v9;
  size_t v10;
  size_t v11;
  const void *v12;
  size_t v13;
  BOOL v14;
  int v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  void *v24;
  size_t v25;
  char *v26;
  unint64_t v27;

  v2 = *(_QWORD *)result;
  v3 = *(_QWORD *)result + 64;
  if (*(int *)(result + 20) > 12)
  {
    v4 = *(void (**)(unint64_t, const char *))(v2 + 24);
    if (v4)
    {
      if (v2 < v3)
        goto LABEL_33;
      goto LABEL_95;
    }
    return 0;
  }
  v21 = 0;
  v22 = 0;
  v20 = 0;
  if (v2)
    v5 = v2 >= v3;
  else
    v5 = 0;
  if (v5)
  {
LABEL_95:
    __break(0x5519u);
    return result;
  }
  v6 = result;
  if ((der_decode_next(v2, &v22, &v20, 0, a2) & 1) == 0)
  {
    v4 = *(void (**)(unint64_t, const char *))(v2 + 24);
    if (v4)
    {
LABEL_33:
      v16 = v2;
LABEL_34:
      v4(v16, "[%s]: %s\n");
      return 0;
    }
    return 0;
  }
  if (v22 != *(_QWORD *)(v6 + 8))
  {
    switch(v22)
    {
      case 1:
        v26 = 0;
        v27 = 0;
        if ((ccder_blob_decode_range() & 1) != 0)
        {
          if (v27 - (_QWORD)v26 == 1)
            goto LABEL_89;
          v4 = *(void (**)(unint64_t, const char *))(v2 + 24);
          if (!v4)
            return 0;
        }
        else
        {
          v4 = *(void (**)(unint64_t, const char *))(v2 + 24);
          if (!v4)
            return 0;
        }
        goto LABEL_33;
      case 2:
        v26 = 0;
        v27 = 0;
        result = ccder_blob_decode_range();
        if ((result & 1) == 0)
        {
          v4 = *(void (**)(unint64_t, const char *))(v2 + 24);
          if (!v4)
            return 0;
          goto LABEL_33;
        }
        v18 = v27 - (_QWORD)v26;
        if (v27 - (unint64_t)v26 >= 9)
        {
          v4 = *(void (**)(unint64_t, const char *))(v2 + 24);
          if (!v4)
            return 0;
          goto LABEL_33;
        }
        if ((unint64_t)v26 >= v27)
          goto LABEL_89;
        v19 = v26;
        while ((unint64_t)v19 < v27 && v19 >= v26)
        {
          ++v19;
          if (!--v18)
            goto LABEL_89;
        }
        goto LABEL_95;
      case 3:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
        goto LABEL_51;
      case 4:
        if (*(_BYTE *)(v6 + 24))
        {
          v26 = 0;
          v27 = 0;
          if ((der_decode_data(v2, &v26) & 1) == 0)
            return 0;
          goto LABEL_89;
        }
        v4 = *(void (**)(unint64_t, const char *))(v2 + 24);
        if (!v4)
          return 0;
        goto LABEL_33;
      case 12:
        v26 = 0;
        v27 = 0;
        if ((ccder_blob_decode_range() & 1) != 0)
        {
          if (!memchr(v26, 0, v27 - (_QWORD)v26))
            goto LABEL_89;
          v4 = *(void (**)(unint64_t, const char *))(v2 + 24);
          if (!v4)
            return 0;
        }
        else
        {
          v4 = *(void (**)(unint64_t, const char *))(v2 + 24);
          if (!v4)
            return 0;
        }
        goto LABEL_33;
      default:
        if (v22 != 0x2000000000000010)
        {
LABEL_51:
          v4 = *(void (**)(unint64_t, const char *))(v2 + 24);
          if (!v4)
            return 0;
          goto LABEL_33;
        }
        v7 = *(_QWORD *)v6;
        v17 = *(_QWORD *)v6 + 64;
        v26 = 0;
        v27 = 0;
        result = ccder_blob_decode_sequence_tl();
        if ((_DWORD)result)
        {
          do
          {
            if ((unint64_t)v26 >= v27)
              goto LABEL_89;
            ++*(_DWORD *)(v6 + 20);
            result = recursivelyValidateEntitlements(v6, &v26);
            --*(_DWORD *)(v6 + 20);
          }
          while ((result & 1) != 0);
          v4 = *(void (**)(unint64_t, const char *))(v7 + 24);
          if (!v4)
            return 0;
          if (v7 >= v17)
            goto LABEL_95;
        }
        else
        {
          v4 = *(void (**)(unint64_t, const char *))(v7 + 24);
          if (!v4)
            return 0;
          if (v7 >= v17)
            goto LABEL_95;
        }
        break;
    }
    goto LABEL_43;
  }
  v7 = *(_QWORD *)v6;
  v8 = *(_QWORD *)v6 + 64;
  v26 = 0;
  v27 = 0;
  result = ccder_blob_decode_range();
  if (!(_DWORD)result)
  {
    v4 = *(void (**)(unint64_t, const char *))(v7 + 24);
    if (!v4)
      return 0;
    if (v7 >= v8)
      goto LABEL_95;
LABEL_43:
    v16 = v7;
    goto LABEL_34;
  }
  if ((unint64_t)v26 < v27)
  {
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v24 = 0;
      v25 = 0;
      v23 = 0uLL;
      result = der_decode_key_value(v7, &v24, &v23, &v26);
      if ((result & 1) == 0)
      {
        v4 = *(void (**)(unint64_t, const char *))(v7 + 24);
        if (!v4)
          return 0;
        if (v7 >= v8)
          goto LABEL_95;
        goto LABEL_43;
      }
      v12 = v24;
      v11 = v25;
      result = (uint64_t)memchr(v24, 0, v25);
      if (result)
      {
        v4 = *(void (**)(unint64_t, const char *))(v7 + 24);
        if (!v4)
          return 0;
        if (v7 >= v8)
          goto LABEL_95;
        goto LABEL_43;
      }
      if (*(_BYTE *)(v6 + 16) && v9 && v10)
      {
        if (!v12)
          break;
        v13 = v10 >= v11 ? v11 : v10;
        result = memcmp(v9, v12, v13);
        v14 = v10 != v11 && (_DWORD)result == 0;
        v15 = (v10 < v11) << 31;
        if (!v14)
          v15 = result;
        if ((v15 & 0x80000000) == 0)
          break;
      }
      ++*(_DWORD *)(v6 + 20);
      result = recursivelyValidateEntitlements(v6, &v23);
      --*(_DWORD *)(v6 + 20);
      if ((result & 1) == 0)
      {
        v4 = *(void (**)(unint64_t, const char *))(v7 + 24);
        if (!v4)
          return 0;
        if (v7 >= v8)
          goto LABEL_95;
        goto LABEL_43;
      }
      v9 = v24;
      v10 = v25;
      if ((unint64_t)v26 >= v27)
        goto LABEL_89;
    }
    v4 = *(void (**)(unint64_t, const char *))(v7 + 24);
    if (!v4)
      return 0;
    if (v7 < v8)
      goto LABEL_43;
    goto LABEL_95;
  }
LABEL_89:
  if (v20 != v21)
  {
    v4 = *(void (**)(unint64_t, const char *))(v2 + 24);
    if (!v4)
      return 0;
    goto LABEL_33;
  }
  return 1;
}

uint64_t der_decode_next(uint64_t a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, uint64_t *a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, const char *, ...);
  const char *v14;

  v11 = *a5;
  v10 = a5[1];
  if ((ccder_blob_decode_tag() & 1) == 0)
  {
    v13 = *(void (**)(uint64_t, const char *, ...))(a1 + 24);
    if (v13)
    {
      v14 = "could not decode tag for next DER sub-sequence";
LABEL_8:
      v13(a1, "[%s]: %s\n", "der_decode_next", v14);
    }
    return 0;
  }
  if ((ccder_blob_decode_len() & 1) == 0)
  {
    v13 = *(void (**)(uint64_t, const char *, ...))(a1 + 24);
    if (v13)
    {
      v14 = "could not decode size for next DER sub-sequence";
      goto LABEL_8;
    }
    return 0;
  }
  v12 = *a5;
  if (a2)
    *a2 = 0;
  if (a3)
  {
    *a3 = v11;
    a3[1] = v12;
  }
  if (a4)
  {
    *a4 = v12;
    a4[1] = v12;
  }
  *a5 = v12;
  a5[1] = v10;
  return 1;
}

uint64_t der_decode_key_value(uint64_t a1, _QWORD *a2, _OWORD *a3, _QWORD *a4)
{
  void (*v8)(uint64_t, const char *, ...);
  const char *v9;
  void (*v10)(uint64_t, const char *, ...);

  if ((ccder_blob_decode_sequence_tl() & 1) != 0)
  {
    if ((ccder_blob_decode_range() & 1) != 0)
    {
      if (a2)
      {
        *a2 = 0;
        a2[1] = 0;
      }
      else if (MEMORY[8])
      {
        if ((ccder_blob_decode_tag() & 1) == 0)
        {
          v8 = *(void (**)(uint64_t, const char *, ...))(a1 + 24);
          if (!v8)
            return 0;
          v9 = "unable to decode value tag for key-value pair";
          goto LABEL_12;
        }
        if ((ccder_blob_decode_len() & 1) == 0)
        {
          v8 = *(void (**)(uint64_t, const char *, ...))(a1 + 24);
          if (!v8)
            return 0;
          v9 = "unable to decode value size for key-value pair";
          goto LABEL_12;
        }
        if (!*a4)
        {
          *a3 = 0uLL;
          return 1;
        }
        v8 = *(void (**)(uint64_t, const char *, ...))(a1 + 24);
        if (v8)
        {
          v9 = "key-value pair contains extra elements";
          goto LABEL_12;
        }
        return 0;
      }
    }
    else
    {
      v10 = *(void (**)(uint64_t, const char *, ...))(a1 + 24);
      if (v10)
        v10(a1, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
    }
    v8 = *(void (**)(uint64_t, const char *, ...))(a1 + 24);
    if (v8)
    {
      v9 = "dictionary key is not a valid string";
      goto LABEL_12;
    }
  }
  else
  {
    v8 = *(void (**)(uint64_t, const char *, ...))(a1 + 24);
    if (v8)
    {
      v9 = "key / value decoding failure";
LABEL_12:
      v8(a1, "[%s]: %s\n", "der_decode_key_value", v9);
    }
  }
  return 0;
}

uint64_t der_vm_BOOL_from_context(unint64_t *a1)
{
  unint64_t v1;
  void (*v2)(unint64_t, const char *, ...);
  const char *v3;
  uint64_t v4;

  v1 = *a1;
  if ((ccder_blob_decode_range() & 1) != 0)
  {
    v2 = *(void (**)(unint64_t, const char *, ...))(v1 + 24);
    if (v2)
    {
      v3 = "BOOLean should be exactly 1 byte";
      goto LABEL_6;
    }
  }
  else
  {
    v2 = *(void (**)(unint64_t, const char *, ...))(v1 + 24);
    if (v2)
    {
      v3 = "Unknown BOOLean encoding";
LABEL_6:
      v2(v1, "[%s]: %s\n", "der_decode_BOOLean", v3);
    }
  }
  if (v1 && v1 >= v1 + 64)
    __break(0x5519u);
  v4 = (*(uint64_t (**)(unint64_t, const char *, ...))(v1 + 32))(v1, "[%s]: %s\n", "der_vm_BOOL_from_context", "Attempting to select a BOOLean value from a non-BOOLean DER object");
  return __CESizeDeserialization_block_invoke(v4);
}

void *ce_malloc(int a1, size_t size)
{
  return malloc_type_malloc(size, 0x89ED1610uLL);
}

uint64_t der_vm_integer_from_context(unint64_t *a1)
{
  unint64_t v1;
  void (*v3)(unint64_t, const char *, ...);
  uint64_t v4;

  v1 = *a1;
  if ((ccder_blob_decode_range() & 1) != 0)
    return 0;
  v3 = *(void (**)(unint64_t, const char *, ...))(v1 + 24);
  if (v3)
    v3(v1, "[%s]: %s\n", "der_decode_number", "unknown number encoding");
  if (v1)
  {
    if (v1 >= v1 + 64)
      __break(0x5519u);
  }
  v4 = (*(uint64_t (**)(unint64_t, const char *, ...))(v1 + 32))(v1, "[%s]: %s\n", "der_vm_integer_from_context", "Attempting to select an integer value from a non-integer DER object");
  return __emitSerializationElement_block_invoke(v4);
}

uint64_t __emitSerializationElement_block_invoke(uint64_t a1, uint64_t a2)
{
  void (*v4)(void);
  __int128 v5;
  unint64_t v6;
  __int128 *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  __int128 v11;
  uint64_t v12;
  _QWORD *v13;
  void (*v14)(void);
  void (*v16)(unint64_t, const char *, ...);
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  _OWORD v28[2];

  v4 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  v26 = 5uLL;
  v27 = 0uLL;
  v4();
  v27 = 0u;
  memset(v28, 0, 24);
  v26 = 0u;
  v5 = *(_OWORD *)(a2 + 72);
  v22 = *(_OWORD *)(a2 + 56);
  v23 = v5;
  v24 = *(_OWORD *)(a2 + 88);
  v25 = *(_QWORD *)(a2 + 104);
  der_vm_execute_nocopy((unint64_t)&v22, (size_t *)CESelectKeyOperation, (uint64_t)&v26);
  v6 = v26;
  v18 = *(_OWORD *)((char *)v28 + 8);
  v22 = 0uLL;
  if ((ccder_blob_decode_range() & 1) != 0)
  {
    v7 = (__int128 *)(a2 + 56);
    v8 = v22;
    v9 = *((_QWORD *)&v22 + 1) - v22;
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    *(_QWORD *)&v22 = 3;
    *((_QWORD *)&v22 + 1) = v8;
    *(_QWORD *)&v23 = v9;
    BYTE8(v23) = 0;
    v10();
    v25 = 0;
    v23 = 0u;
    v24 = 0u;
    v22 = 0u;
    v11 = v7[1];
    v18 = *v7;
    v19 = v11;
    v20 = v7[2];
    v21 = *((_QWORD *)v7 + 6);
    der_vm_execute_nocopy((unint64_t)&v18, (size_t *)CESelectValueOperation, (uint64_t)&v22);
    v12 = *(_QWORD *)(a1 + 32);
    v18 = v22;
    v19 = v23;
    v20 = v24;
    v21 = v25;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = emitSerializationElement(&v18, v12);
    v13 = *(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    if (v13 == Errors)
    {
      v14 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
      v18 = 6uLL;
      v19 = 0uLL;
      v14();
    }
    return v13 == Errors;
  }
  else
  {
    v16 = *(void (**)(unint64_t, const char *, ...))(v6 + 24);
    if (v16)
      v16(v6, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
    if (v6 && v6 >= v6 + 64)
      __break(0x5519u);
    v17 = (*(uint64_t (**)(unint64_t, const char *, ...))(v6 + 32))(v6, "[%s]: %s\n", "der_vm_string_from_context", "Attempting to select a string value from a non-string DER object");
    return CESizeXMLSerialization(v17);
  }
}

_QWORD *CESizeXMLSerialization(_QWORD *result, unint64_t a2, _QWORD *a3)
{
  unint64_t v3;
  _QWORD *v4;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;

  *a3 = 0;
  v8 = 0;
  if (a2 <= 1 || *result != 7)
    return &unk_1EA97EC10;
  v3 = (unint64_t)&result[4 * a2];
  v4 = (_QWORD *)(v3 - 32);
  if (v3 < 0x20 || v4 < result)
  {
    __break(0x5519u);
    return result;
  }
  if (*v4 != 8)
    return &unk_1EA97EC10;
  v6 = result + 4;
  v7 = &result[4 * a2];
  result = xml_size_dictionary(result, (unint64_t *)&v6, &v8);
  if (result == Errors)
  {
    if (v6 == v7)
      *a3 = v8 + 171;
    else
      return &unk_1EA97EC30;
  }
  return result;
}

_QWORD *xml_size_dictionary(_QWORD *result, unint64_t *a2, _QWORD *a3)
{
  _QWORD *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  unint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v5 = result;
  v6 = 0;
  v8 = *a2;
  v7 = a2[1];
  if (*a2 >= v7)
    return &unk_1EA97EC30;
LABEL_2:
  v9 = (_QWORD *)(v8 + 32);
  if (v8 + 32 > v7 || v8 > (unint64_t)v9)
    goto LABEL_35;
  *a2 = (unint64_t)v9;
  if (v8)
  {
    if (*(_QWORD *)v8 != 5)
    {
      if (*(_QWORD *)v8 == 8)
      {
        *a3 = v6 + 13;
        v5[2] = v6;
        return Errors;
      }
      return &unk_1EA97EC30;
    }
    *(_BYTE *)(v8 + 24) = 1;
    if ((unint64_t)v9 < v7)
    {
      v10 = v8 + 64;
      if (v8 + 64 <= v7 && (unint64_t)v9 <= v10)
      {
        *a2 = v10;
        if (v8 != -32 && *v9 == 3)
        {
          v11 = *(_QWORD *)(v8 + 48);
          if (v11)
          {
            if ((unint64_t)v9 < v10)
            {
              v12 = 0;
              v13 = *(_BYTE **)(v8 + 40);
              v14 = (unint64_t)&v13[v11];
              v15 = v13;
              while ((unint64_t)v15 < v14 && v15 >= v13)
              {
                v16 = 5;
                switch(*v15)
                {
                  case '"':
                  case '\'':
                    v16 = 6;
                    break;
                  case '&':
                    break;
                  case '<':
                  case '>':
                    v16 = 4;
                    break;
                  default:
                    v16 = 1;
                    break;
                }
                v12 += v16;
                ++v15;
                if (!--v11)
                {
                  result = 0;
                  v21 = 0;
                  if (v10 < v7)
                  {
                    v17 = v8 + 96;
                    if (v8 + 96 > v7 || v10 > v17)
                      goto LABEL_35;
                    *a2 = v17;
                    result = (_QWORD *)(v8 + 64);
                  }
                  result = xml_size_element(result, (uint64_t)a2, &v21);
                  if (result != Errors)
                    return result;
                  v18 = *a2;
                  v7 = a2[1];
                  v19 = *a2 + 32;
                  if (v19 <= v7 && v18 <= v19)
                  {
                    *a2 = v19;
                    if (*(_QWORD *)v18 == 6)
                    {
                      *(_BYTE *)(v18 + 24) = 1;
                      v20 = v12 + 11 + v21;
                      *(_QWORD *)(v8 + 16) = v20;
                      v6 += v20;
                      v8 = v19;
                      if (v19 < v7)
                        goto LABEL_2;
                    }
                    return &unk_1EA97EC30;
                  }
                  goto LABEL_35;
                }
              }
            }
            goto LABEL_35;
          }
        }
        return &unk_1EA97EC30;
      }
LABEL_35:
      __break(0x5519u);
      return result;
    }
  }
  return &unk_1EA97EC30;
}

_QWORD *xml_size_element(_QWORD *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  unint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  _QWORD *result;
  int v14;
  uint64_t v15;
  _QWORD *v16;
  unint64_t v17;
  _QWORD *v18;
  char __str[32];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  switch(*a1)
  {
    case 1:
      v6 = 7;
      if (!a1[1])
        v6 = 8;
      a1[2] = v6;
      goto LABEL_31;
    case 2:
      v7 = a1[2];
      if (v7)
      {
        v8 = 0;
        v9 = (_BYTE *)a1[1];
        v10 = (unint64_t)&v9[v7];
        v11 = v9;
        do
        {
          if ((unint64_t)v11 >= v10 || v11 < v9)
            goto LABEL_34;
          v12 = 5;
          switch(*v11)
          {
            case '"':
            case '\'':
              v12 = 6;
              break;
            case '&':
              break;
            case '<':
            case '>':
              v12 = 4;
              break;
            default:
              v12 = 1;
              break;
          }
          v8 += v12;
          ++v11;
          --v7;
        }
        while (v7);
        v6 = v8 + 17;
      }
      else
      {
        v6 = 17;
      }
LABEL_31:
      *a3 = v6;
      result = Errors;
      break;
    case 4:
      v14 = snprintf(__str, 0x20uLL, "%lld", a1[1]);
      a1[2] = v14;
      v6 = v14 + 19;
      goto LABEL_31;
    case 5:
      v15 = 0;
      while (2)
      {
        v16 = *(_QWORD **)a2;
        v17 = *(_QWORD *)(a2 + 8);
        if (*(_QWORD *)a2 >= v17)
          goto LABEL_29;
        v18 = v16 + 4;
        if ((unint64_t)(v16 + 4) > v17 || v16 >= v18)
          goto LABEL_34;
        *(_QWORD *)a2 = v18;
        if (v16)
        {
          if (*v16 == 6)
          {
            *a3 = v15 + 15;
            a1[2] = v15;
            result = Errors;
          }
          else
          {
            *(_QWORD *)__str = 0;
            if (v16 >= v18)
LABEL_34:
              __break(0x5519u);
            result = (_QWORD *)xml_size_element();
            if (result == Errors)
            {
              v15 += *(_QWORD *)__str;
              continue;
            }
          }
        }
        else
        {
LABEL_29:
          result = &unk_1EA97EC30;
        }
        break;
      }
      break;
    case 7:
      return (_QWORD *)xml_size_dictionary(a1, a2, a3);
    default:
      return &unk_1EA97EC10;
  }
  return result;
}

_QWORD *CESerializeXML(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5)
{
  int *v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int v10;
  int *v11;
  char *v12;
  int *v13;
  char *v14;
  unsigned int v15;
  unsigned int v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE *v20;
  char *v21;
  unint64_t v23;
  uint64_t v24;
  unint64_t *v25;
  unint64_t v26;
  int *v27;
  unint64_t v28;
  char __str[8];
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (a4 > a5)
    goto LABEL_94;
  v26 = a4;
  v28 = a5;
  if (a5 - a4 <= 0xA1)
    return &unk_1EA97EC10;
  qmemcpy((void *)(a4 + 32), "F-8\"?><!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"https://www.apple.com/DTDs/PropertyList-1.0.dtd\"><plist version=\"1.0\">", 130);
  v5 = (int *)(a4 + 162);
  qmemcpy((void *)a4, "<?xml version=\"1.0\" encoding=\"UT", 32);
  if (a4 + 162 > a5 || (unint64_t)v5 < a4)
    goto LABEL_94;
  v27 = (int *)(a4 + 162);
  if (a4 < a5)
  {
    v7 = a3;
    if (a3)
    {
      v8 = a2 + 32 * a3;
      v9 = a2 + 32;
      while (v9 <= v8)
      {
        switch(*(_QWORD *)(v9 - 32))
        {
          case 1:
            if (*(_QWORD *)(v9 - 24))
            {
              if (a5 - (unint64_t)v5 < 7)
                return &unk_1EA97EC10;
              if ((unint64_t)v5 > a5 || a4 > (unint64_t)v5)
                goto LABEL_94;
              *(int *)((char *)v5 + 3) = 1043293557;
              v10 = 1970435132;
LABEL_70:
              *v5 = v10;
LABEL_71:
              v5 = (int *)((char *)v5 + 7);
LABEL_72:
              if ((unint64_t)v5 > a5 || a4 > (unint64_t)v5)
                goto LABEL_94;
            }
            else
            {
              if (a5 - (unint64_t)v5 < 8)
                return &unk_1EA97EC10;
              if ((unint64_t)v5 > a5 || a4 > (unint64_t)v5)
                goto LABEL_94;
              v19 = 0x3E2F65736C61663CLL;
LABEL_79:
              *(_QWORD *)v5 = v19;
              a5 = v28;
              v5 = v27 + 2;
              if ((unint64_t)(v27 + 2) > v28)
                goto LABEL_94;
              a4 = v26;
              if (v26 > (unint64_t)v5)
                goto LABEL_94;
            }
            v27 = v5;
LABEL_9:
            v9 += 32;
            if (!--v7)
              goto LABEL_82;
            break;
          case 2:
            if (a5 - (unint64_t)v5 < 8)
              return &unk_1EA97EC10;
            if ((unint64_t)v5 > a5)
              goto LABEL_94;
            if (a4 > (unint64_t)v5)
              goto LABEL_94;
            *(_QWORD *)v5 = 0x3E676E697274733CLL;
            if ((unint64_t)(v27 + 2) > v28 || v26 > (unint64_t)(v27 + 2))
              goto LABEL_94;
            v27 += 2;
            if ((xml_copy_string_to_buffer(*(_QWORD *)(v9 - 24), *(_QWORD *)(v9 - 16), &v26) & 1) == 0)
              return &unk_1EA97EC10;
            v11 = v27;
            a5 = v28;
            if (v28 - (unint64_t)v27 < 9)
              return &unk_1EA97EC10;
            if ((unint64_t)v27 > v28)
              goto LABEL_94;
            a4 = v26;
            if (v26 > (unint64_t)v27)
              goto LABEL_94;
            *((_BYTE *)v27 + 8) = 62;
            *(_QWORD *)v11 = *(_QWORD *)"</string>";
            v5 = (int *)((char *)v11 + 9);
            goto LABEL_72;
          case 3:
            if (a5 - (unint64_t)v5 < 5)
              return &unk_1EA97EC10;
            if ((unint64_t)v5 > a5)
              goto LABEL_94;
            if (a4 > (unint64_t)v5)
              goto LABEL_94;
            *((_BYTE *)v5 + 4) = 62;
            *v5 = 2036689724;
            v12 = (char *)v5 + 5;
            if ((unint64_t)v12 > a5 || a4 > (unint64_t)v12)
              goto LABEL_94;
            v27 = (int *)v12;
            if ((xml_copy_string_to_buffer(*(_QWORD *)(v9 - 24), *(_QWORD *)(v9 - 16), &v26) & 1) == 0)
              return &unk_1EA97EC10;
            v13 = v27;
            a5 = v28;
            if (v28 - (unint64_t)v27 < 6)
              return &unk_1EA97EC10;
            if ((unint64_t)v27 > v28)
              goto LABEL_94;
            a4 = v26;
            if (v26 > (unint64_t)v27)
              goto LABEL_94;
            *((_WORD *)v27 + 2) = 15993;
            *v13 = 1701523260;
            v5 = (int *)((char *)v13 + 6);
            goto LABEL_72;
          case 4:
            *(_QWORD *)__str = 0;
            v30 = 0;
            v31 = 0;
            if (a5 - (unint64_t)v5 < 9)
              return &unk_1EA97EC10;
            if ((unint64_t)v5 > a5)
              goto LABEL_94;
            if (a4 > (unint64_t)v5)
              goto LABEL_94;
            *((_BYTE *)v5 + 8) = 62;
            *(_QWORD *)v5 = *(_QWORD *)"<integer>";
            v14 = (char *)v5 + 9;
            if ((unint64_t)v14 > a5)
              goto LABEL_94;
            if (a4 > (unint64_t)v14)
              goto LABEL_94;
            v27 = (int *)v14;
            v15 = snprintf(__str, 0x18uLL, "%lld", *(_QWORD *)(v9 - 24));
            if (v15 > 0x18)
              goto LABEL_94;
            v16 = v15;
            v17 = (char *)v27;
            a5 = v28;
            if (!v16)
              goto LABEL_49;
            v18 = v16;
            if (v28 - (unint64_t)v27 < v16)
              return &unk_1EA97EC10;
            if ((unint64_t)v27 > v28)
              goto LABEL_94;
            if (v26 > (unint64_t)v27)
              goto LABEL_94;
            memcpy(v27, __str, v16);
            a5 = v28;
            v17 = (char *)v27 + v18;
            if ((unint64_t)v27 + v18 > v28 || v26 > (unint64_t)v17)
              goto LABEL_94;
LABEL_49:
            if (a5 - (unint64_t)v17 < 0xA)
              return &unk_1EA97EC10;
            if ((unint64_t)v17 > a5)
              goto LABEL_94;
            a4 = v26;
            if (v26 > (unint64_t)v17)
              goto LABEL_94;
            *((_WORD *)v17 + 4) = 15986;
            *(_QWORD *)v17 = *(_QWORD *)"</integer>";
            v5 = (int *)(v17 + 10);
            goto LABEL_72;
          case 5:
            if (*(_BYTE *)(v9 - 8))
              goto LABEL_9;
            if (a5 - (unint64_t)v5 < 7)
              return &unk_1EA97EC10;
            if ((unint64_t)v5 > a5 || a4 > (unint64_t)v5)
              goto LABEL_94;
            *(int *)((char *)v5 + 3) = 1048142194;
            v10 = 1920098620;
            goto LABEL_70;
          case 6:
            if (*(_BYTE *)(v9 - 8))
              goto LABEL_9;
            if (a5 - (unint64_t)v5 < 8)
              return &unk_1EA97EC10;
            if ((unint64_t)v5 > a5 || a4 > (unint64_t)v5)
              goto LABEL_94;
            v19 = 0x3E79617272612F3CLL;
            goto LABEL_79;
          case 7:
            if (a5 - (unint64_t)v5 < 6)
              return &unk_1EA97EC10;
            if ((unint64_t)v5 > a5 || a4 > (unint64_t)v5)
              goto LABEL_94;
            *((_WORD *)v5 + 2) = 15988;
            *v5 = 1667851324;
            v5 = (int *)((char *)v5 + 6);
            goto LABEL_72;
          case 8:
            if (a5 - (unint64_t)v5 < 7)
              return &unk_1EA97EC10;
            if ((unint64_t)v5 > a5 || a4 > (unint64_t)v5)
              goto LABEL_94;
            *(int *)((char *)v5 + 3) = 1047815017;
            *v5 = 1768173372;
            goto LABEL_71;
          default:
            goto LABEL_9;
        }
      }
LABEL_94:
      __break(0x5519u);
    }
  }
LABEL_82:
  if (a5 - (unint64_t)v5 < 8)
    return &unk_1EA97EC10;
  if ((unint64_t)v5 > a5)
    goto LABEL_94;
  if (a4 > (unint64_t)v5)
    goto LABEL_94;
  *(_QWORD *)v5 = 0x3E7473696C702F3CLL;
  v20 = v27 + 2;
  if ((unint64_t)(v27 + 2) > v28 || v26 > (unint64_t)v20)
    goto LABEL_94;
  v27 += 2;
  if ((_BYTE *)v28 == v20)
    return &unk_1EA97EC10;
  *v20 = 0;
  v21 = (char *)v27 + 1;
  if ((unint64_t)v27 + 1 > v28 || v26 > (unint64_t)v21)
    goto LABEL_94;
  if (v21 == (char *)v28)
    return Errors;
  v23 = (*(uint64_t (**)(uint64_t, const char *, ...))(a1 + 32))(a1, "[%s]: %s\n", "CESerializeXML", "critical failure during xml serialization, start != end");
  return (_QWORD *)xml_copy_string_to_buffer(v23, v24, v25);
}

unint64_t xml_copy_string_to_buffer(unint64_t result, uint64_t a2, unint64_t *a3)
{
  unint64_t v3;
  _BYTE *v4;
  unint64_t v5;
  unint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  _DWORD *v15;
  unint64_t v16;
  _DWORD *v17;
  unint64_t v18;

  if (!a2)
    return 1;
  v3 = result + a2;
  v4 = (_BYTE *)result;
  while ((unint64_t)v4 < v3 && (unint64_t)v4 >= result)
  {
    switch(*v4)
    {
      case '"':
        v5 = a3[1];
        v6 = a3[2];
        if (v6 - v5 < 6)
          return 0;
        if (v5 > v6 || *a3 > v5)
          goto LABEL_37;
        *(_WORD *)(v5 + 4) = 15220;
        *(_DWORD *)v5 = 1869967654;
        goto LABEL_22;
      case '&':
        v11 = a3[1];
        v12 = a3[2];
        if (v12 - v11 < 5)
          return 0;
        if (v11 > v12 || *a3 > v11)
          goto LABEL_37;
        *(_BYTE *)(v11 + 4) = 59;
        *(_DWORD *)v11 = 1886216486;
        v9 = a3[2];
        v10 = a3[1] + 5;
        goto LABEL_32;
      case '\'':
        v13 = a3[1];
        v14 = a3[2];
        if (v14 - v13 < 6)
          return 0;
        if (v13 > v14 || *a3 > v13)
          goto LABEL_37;
        *(_WORD *)(v13 + 4) = 15219;
        *(_DWORD *)v13 = 1869635878;
LABEL_22:
        v9 = a3[2];
        v10 = a3[1] + 6;
        goto LABEL_32;
      case '<':
        v15 = (_DWORD *)a3[1];
        v16 = a3[2];
        if (v16 - (unint64_t)v15 < 4)
          return 0;
        if ((unint64_t)v15 > v16 || *a3 > (unint64_t)v15)
          goto LABEL_37;
        *v15 = 997485606;
        goto LABEL_31;
      case '>':
        v17 = (_DWORD *)a3[1];
        v18 = a3[2];
        if (v18 - (unint64_t)v17 < 4)
          return 0;
        if ((unint64_t)v17 > v18 || *a3 > (unint64_t)v17)
          goto LABEL_37;
        *v17 = 997484326;
LABEL_31:
        v9 = a3[2];
        v10 = a3[1] + 4;
        goto LABEL_32;
      default:
        v7 = (_BYTE *)a3[1];
        v8 = (_BYTE *)a3[2];
        if (v8 == v7)
          return 0;
        if (v7 > v8 || *a3 > (unint64_t)v7)
          goto LABEL_37;
        *v7 = *v4;
        v9 = a3[2];
        v10 = a3[1] + 1;
LABEL_32:
        if (v10 > v9 || *a3 > v10)
          goto LABEL_37;
        a3[1] = v10;
        ++v4;
        if (!--a2)
          return 1;
        break;
    }
  }
LABEL_37:
  __break(0x5519u);
  return result;
}

uint64_t CEIndexSizeForContext(unint64_t *a1, _QWORD *a2)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  uint64_t v10;
  _QWORD v11[9];
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = *a1;
  v5 = *a1 + 64;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2000000000;
  v6 = MEMORY[0x1E0C809B0];
  v20 = 0;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 0x40000000;
  v14 = (uint64_t)__count_keys_block_invoke;
  v15 = &unk_1EA97EB30;
  v16 = &v17;
  der_vm_iterate_b((uint64_t)a1, (uint64_t)&v12);
  v7 = v18[3];
  _Block_object_dispose(&v17, 8);
  v12 = 0;
  v13 = (uint64_t)&v12;
  v14 = 0x2000000000;
  v15 = Errors;
  v11[0] = v6;
  v11[1] = 0x40000000;
  v11[2] = __CEIndexSizeForContext_block_invoke;
  v11[3] = &unk_1EA97EB08;
  v11[6] = v5;
  v11[7] = v4;
  v11[4] = &v12;
  v11[5] = v4;
  v11[8] = a1;
  der_vm_iterate_b((uint64_t)a1, (uint64_t)v11);
  v8 = *(_QWORD **)(v13 + 24);
  if (v8 != Errors)
    goto LABEL_6;
  *a2 = 8 * v7;
  if (!(v7 >> 61))
  {
    if (v7 > 1)
      v8 = Errors;
    else
      v8 = qword_1EA97EC50;
LABEL_6:
    _Block_object_dispose(&v12, 8);
    return (uint64_t)v8;
  }
  if (v4 && v4 >= v5)
    __break(0x5519u);
  v10 = (*(uint64_t (**)(unint64_t, const char *, ...))(v4 + 32))(v4, "[%s]: %s\n", "CEIndexSizeForContext", "index size overflow");
  return __count_keys_block_invoke(v10);
}

uint64_t __count_keys_block_invoke(uint64_t a1)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return 1;
}

void CEBuildIndexForContext(unint64_t *a1)
{
  _QWORD *v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(_QWORD *, const char *, ...);
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  const void *v20;
  unint64_t v22;
  unint64_t v23;
  const void *v24;
  size_t v25;
  int v26;
  int v27;
  BOOL v28;
  int v29;
  unint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __int128 *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;

  v1 = (_QWORD *)*a1;
  v2 = *a1 + 64;
  if (*(_QWORD *)*a1 < 2uLL || !v1[6] || !v1[7])
  {
    v14 = (void (*)(_QWORD *, const char *, ...))v1[3];
    if (!v14)
      return;
    if ((unint64_t)v1 < v2)
    {
      v14(v1, "[%s]: %s\n", "CEBuildIndexForContext", "runtime doesn't support acceleration");
      return;
    }
    goto LABEL_48;
  }
  v3 = (uint64_t)a1;
  v37 = 0;
  if ((_QWORD *)CEIndexSizeForContext(a1, &v37) != Errors)
    return;
  v48 = 0;
  v49 = &v48;
  v50 = 0x2000000000;
  v4 = MEMORY[0x1E0C809B0];
  v51 = 0;
  v38 = MEMORY[0x1E0C809B0];
  v39 = 0x40000000;
  v40 = __count_keys_block_invoke;
  v41 = &unk_1EA97EB30;
  v42 = &v48;
  der_vm_iterate_b(v3, (uint64_t)&v38);
  v5 = v49[3];
  _Block_object_dispose(&v48, 8);
  if ((unint64_t)v1 >= v2)
    goto LABEL_48;
  v6 = v37;
  v7 = ((uint64_t (*)(_QWORD *, uint64_t))v1[6])(v1, v37);
  if (!v7)
    return;
  if (v7 > v7 + v6 || v5 > v6 >> 3)
  {
LABEL_48:
    __break(0x5519u);
    return;
  }
  *(_QWORD *)&v36 = v7;
  *((_QWORD *)&v36 + 1) = v5;
  v9 = *(_QWORD *)v3;
  v10 = *(_QWORD *)v3 + 64;
  v48 = 0;
  v49 = &v48;
  v50 = 0x2000000000;
  v51 = 0;
  v38 = v4;
  v39 = 0x40000000;
  v40 = __copy_keys_to_accelerator_block_invoke;
  v41 = &unk_1EA97EB58;
  v44 = v10;
  v45 = v9;
  v46 = v3;
  v47 = &v36;
  v42 = &v48;
  v43 = v9;
  der_vm_iterate_b(v3, (uint64_t)&v38);
  _Block_object_dispose(&v48, 8);
  if (*((_QWORD *)&v36 + 1) >= 2uLL)
  {
    v11 = 0;
    v12 = 1;
    v13 = 8;
    v35 = v3;
    do
    {
      v33 = v12;
      v34 = v11;
      v32 = v13;
      while (1)
      {
        v16 = *((_QWORD *)&v36 + 1);
        v15 = v36;
        v17 = *(_QWORD *)(v36 + 8 * v11);
        v18 = *(_QWORD *)(v3 + 40);
        v19 = HIDWORD(v17);
        v20 = (const void *)(v18 + v17);
        if (!v20 || v19 == 0)
          break;
        v22 = v36 + v13 - 8;
        v23 = *(_QWORD *)(v36 + v13);
        v24 = (const void *)(v18 + v23);
        if (v24)
        {
          v25 = v19 >= HIDWORD(v23) ? HIDWORD(v23) : HIDWORD(v17);
          v26 = v19 < HIDWORD(v23) ? -1 : 1;
          v27 = memcmp(v20, v24, v25);
          v28 = v19 != HIDWORD(v23) && v27 == 0;
          v29 = v28 ? v26 : v27;
          v3 = v35;
          if (v29 < 1)
            break;
        }
        if (v22 >= v15 + 8 * v16 || v22 < v15)
          goto LABEL_48;
        *(_QWORD *)(v15 + 8 * v11) = v23;
        v31 = (unint64_t *)(v36 + v13);
        if ((uint64_t)v36 + v13 >= (unint64_t)(v36 + 8 * *((_QWORD *)&v36 + 1))
          || (unint64_t)v31 < (unint64_t)v36)
        {
          goto LABEL_48;
        }
        *v31 = v17;
        v13 -= 8;
        if (--v11 == -1)
        {
          v16 = *((_QWORD *)&v36 + 1);
          break;
        }
      }
      v12 = v33 + 1;
      v13 = v32 + 8;
      v11 = v34 + 1;
    }
    while (v33 + 1 < v16);
  }
  *(_OWORD *)(v3 + 8) = v36;
}

char *__copy_keys_to_accelerator_block_invoke(_QWORD *a1, uint64_t a2)
{
  unint64_t v3;
  BOOL v4;
  unint64_t *v5;
  unint64_t v6;
  unint64_t v7;
  _DWORD *v8;
  int v10;
  unint64_t v12;
  BOOL v13;
  char **v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;

  v17 = 0;
  v18 = 0;
  v3 = a1[5];
  if (!v3 || (v3 < a1[6] ? (v4 = v3 >= a1[7]) : (v4 = 0), v4))
  {
    v15 = *(_OWORD *)(a2 + 96);
    v3 = der_decode_key_value(v3, &v17, &v16, &v15);
    if ((v3 & 1) != 0)
    {
      v5 = (unint64_t *)a1[9];
      v6 = *v5;
      v7 = *v5 + 8 * v5[1];
      v8 = (_DWORD *)(*v5 + 8 * *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24));
      if ((unint64_t)v8 < v7 && (unint64_t)v8 >= v6)
      {
        v10 = v18;
        *v8 = v17 - *(_QWORD *)(a1[8] + 40);
        v8[1] = v10;
        ++*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
        return (char *)1;
      }
    }
    else
    {
      v3 = a1[5];
      v12 = a1[6];
      v13 = v3 + 64 > v12 || a1[7] > v3;
      if (!v13 && (!v3 || v3 < v12))
        goto LABEL_21;
    }
  }
  __break(0x5519u);
LABEL_21:
  v14 = (char **)(*(uint64_t (**)(unint64_t, const char *, ...))(v3 + 32))(v3, "[%s]: %s\n", "copy_keys_to_accelerator_block_invoke", "fatal error when decoding key/value pair");
  return CEFreeIndexForContext(v14);
}

char *CEFreeIndexForContext(char **a1)
{
  char *v1;
  char *result;
  BOOL v4;

  v1 = a1[2];
  if (!v1)
    return (char *)&Errors;
  result = *a1;
  if (result)
    v4 = result >= result + 64;
  else
    v4 = 0;
  if (!v4)
  {
    (*((void (**)(char *, char *, uint64_t))result + 7))(result, a1[1], 8 * (_QWORD)v1);
    a1[1] = 0;
    a1[2] = 0;
    return (char *)&Errors;
  }
  __break(0x5519u);
  return result;
}

BOOL CEContextIsAccelerated(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16) != 0;
}

_QWORD *CEValidate(_QWORD *result, _QWORD *a2, unint64_t a3, unint64_t a4)
{
  char v4;

  v4 = 0;
  if (a3 <= a4)
    return CEValidateWithOptions(result, &v4, a2, a3, a4);
  __break(0x5519u);
  return result;
}

__n128 CEConjureContextFromDER@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __int128 v2;
  __n128 result;

  v2 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v2;
  result = *(__n128 *)(a1 + 32);
  *(__n128 *)(a2 + 32) = result;
  *(_QWORD *)(a2 + 48) = *(_QWORD *)(a1 + 48);
  *(_BYTE *)(a2 + 56) = 0;
  return result;
}

uint64_t CEPrepareQuery(__int16 a1, unint64_t *a2, unint64_t a3)
{
  unint64_t *v4;
  uint64_t v5;
  BOOL v6;
  _UNKNOWN **v7;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  BOOL v13;
  uint64_t v14;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;

  if (!a3)
    goto LABEL_13;
  v4 = a2;
  if ((a1 & 1) == 0)
  {
    v5 = 0;
    if ((a1 & 0x100) != 0)
    {
      v22 = a2 + 2;
      v6 = 1;
      v7 = &kCENoError;
      while (1)
      {
        v23 = *(v22 - 2);
        if ((v23 & 0x4000000000000000) != 0)
        {
          v24 = v23 & 0xBFFFFFFFFFFFFFFFLL;
          v13 = v24 > 9;
          v25 = (1 << v24) & 0x35A;
          if (v13 || v25 == 0)
            goto LABEL_12;
          if (*v22 > 0xEFuLL)
            goto LABEL_41;
        }
        v6 = ++v5 < a3;
        v22 += 32;
        if (a3 == v5)
          return (uint64_t)*v7;
      }
    }
    v6 = 1;
    v7 = &kCENoError;
    while ((*v4 & 0x4000000000000000) == 0
         || (*v4 & 0xBFFFFFFFFFFFFFFFLL) <= 9 && ((1 << *(_BYTE *)v4) & 0x35A) != 0)
    {
      v4 += 32;
      v6 = ++v5 < a3;
      if (a3 == v5)
        return (uint64_t)*v7;
    }
LABEL_12:
    if (!v6)
      goto LABEL_13;
LABEL_42:
    v7 = &kCEInvalidArgument;
    return (uint64_t)*v7;
  }
  v10 = 0;
  v6 = 1;
  v7 = &kCENoError;
  if ((a1 & 0x100) != 0)
  {
    while (1)
    {
      v17 = *v4;
      if ((*v4 & 0x4000000000000000) != 0)
      {
        v18 = v17 & 0xBFFFFFFFFFFFFFFFLL;
        v13 = (v17 & 0xBFFFFFFFFFFFFFFFLL) > 9;
        v19 = (1 << v17) & 0x35A;
        if (v13 || v19 == 0)
          goto LABEL_12;
        v21 = v4[2];
        if (v21 >= 0xF0)
          goto LABEL_41;
        memcpy(v4 + 1, (const void *)v4[1], v4[2]);
        v4[31] = v21;
        *v4 = v18;
      }
      v6 = ++v10 < a3;
      v4 += 32;
      if (a3 == v10)
        return (uint64_t)*v7;
    }
  }
  while (1)
  {
    v11 = *v4;
    if ((*v4 & 0x4000000000000000) != 0)
      break;
LABEL_17:
    v6 = ++v10 < a3;
    v4 += 32;
    if (a3 == v10)
      return (uint64_t)*v7;
  }
  v12 = v11 & 0xBFFFFFFFFFFFFFFFLL;
  v13 = (v11 & 0xBFFFFFFFFFFFFFFFLL) > 9;
  v14 = (1 << v11) & 0x35A;
  if (v13 || v14 == 0)
    goto LABEL_12;
  v16 = v4[2];
  if (v16 <= 0xEF)
  {
    memcpy(v4 + 1, (const void *)v4[1], v4[2]);
    v4[31] = v16;
    *v4 = v12;
    goto LABEL_17;
  }
LABEL_41:
  if (v6)
    goto LABEL_42;
LABEL_13:
  v7 = &kCENoError;
  return (uint64_t)*v7;
}

_QWORD *CESizeSerialization(_QWORD *result, unint64_t a2, uint64_t *a3)
{
  unint64_t v3;
  _QWORD *v4;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;

  *a3 = 0;
  v9 = 0;
  if (a2 <= 1 || *result != 7)
    return &unk_1EA97EC10;
  v3 = (unint64_t)&result[4 * a2];
  v4 = (_QWORD *)(v3 - 32);
  if (v3 >= 0x20 && v4 >= result)
  {
    if (*v4 == 8)
    {
      v7 = result + 4;
      v8 = &result[4 * a2];
      v6 = (_QWORD *)der_size_dictionary((uint64_t)result, (unint64_t *)&v7, &v9);
      if (v6 == Errors)
      {
        if (v7 == v8)
        {
          ccder_sizeof();
          *a3 = ccder_sizeof();
        }
        else
        {
          return &unk_1EA97EC30;
        }
      }
      return v6;
    }
    return &unk_1EA97EC10;
  }
  __break(0x5519u);
  return result;
}

uint64_t CESerializeWithOptions(uint64_t result, _BYTE *a2, unint64_t a3, uint64_t a4, unint64_t a5, unint64_t a6)
{
  _QWORD *v6;
  unint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  int v14;
  _QWORD *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;

  v15 = (_QWORD *)result;
  v20 = 0;
  v21 = 0;
  if (a5 <= a6)
  {
    v20 = a5;
    v21 = a6;
    if (a6 > a5)
    {
      v11 = a3 + 32 * a4;
      v12 = (_QWORD *)(v11 - 32);
      v13 = a4;
      while (2)
      {
        if ((--v13 & 0x8000000000000000) == 0)
        {
          if ((unint64_t)(v12 + 4) <= v11 && (unint64_t)v12 >= a3)
          {
            v14 = 4;
            switch(*v12)
            {
              case 1:
                v17 = 0;
                v18 = 0;
                result = ccder_blob_reserve_tl();
                v6 = &unk_1EA97EC10;
                v14 = 1;
                goto LABEL_6;
              case 2:
              case 3:
                if ((unint64_t)v12 >= v11 || v12[1] + v12[2] < v12[1])
                  goto LABEL_30;
                result = ccder_blob_encode_body_tl();
                if ((result & 1) == 0)
                  return (uint64_t)&unk_1EA97EC10;
                goto LABEL_5;
              case 4:
                result = der_encode_number();
                if ((result & 1) != 0)
                  goto LABEL_5;
                return (uint64_t)&unk_1EA97EC10;
              case 5:
              case 7:
                result = ccder_blob_encode_tl();
                if ((result & 1) == 0)
                  return (uint64_t)&unk_1EA97EC10;
LABEL_5:
                v14 = 4;
                goto LABEL_6;
              case 9:
                if ((unint64_t)v12 >= v11 || v12[1] + v12[2] < v12[1])
                  goto LABEL_30;
                v14 = 4;
                result = ccder_blob_encode_body_tl();
                if ((result & 1) != 0)
                  goto LABEL_6;
                return (uint64_t)&unk_1EA97EC10;
              default:
LABEL_6:
                v12 -= 4;
                if (v14 == 4)
                  continue;
                return (uint64_t)v6;
            }
          }
          goto LABEL_30;
        }
        break;
      }
    }
    v17 = 0;
    v18 = 0;
    result = ccder_blob_reserve_tl();
    if ((result & 1) == 0)
      return (uint64_t)&unk_1EA97EC30;
    if (a4)
    {
      ccder_sizeof();
      ccder_sizeof();
      if ((ccder_blob_encode_tl() & 1) != 0)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        v6 = CEValidateWithOptions(v15, a2, &v17, a5, a6);
        if (v6 != Errors)
          cc_clear();
        return (uint64_t)v6;
      }
      return (uint64_t)&unk_1EA97EC30;
    }
  }
LABEL_30:
  __break(0x5519u);
  return result;
}

uint64_t CESerialize(uint64_t result, unint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5)
{
  char v5;

  v5 = 0;
  if (a4 <= a5)
    return CESerializeWithOptions(result, &v5, a2, a3, a4, a5);
  __break(0x5519u);
  return result;
}

void *CEContextIsSubset(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  _UNKNOWN **v4;
  int v6;
  _OWORD v7[2];
  __int128 v8;
  uint64_t v9;
  _OWORD v10[2];
  __int128 v11;
  uint64_t v12;
  _QWORD v13[13];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  _OWORD v18[16];
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  if (!a1 || !a2)
    return &unk_1EA97EC10;
  v2 = *(_OWORD *)(a1 + 32);
  v10[1] = *(_OWORD *)(a1 + 16);
  v11 = v2;
  v10[0] = *(_OWORD *)a1;
  v12 = *(_QWORD *)(a1 + 48);
  v3 = *(_OWORD *)(a2 + 32);
  v7[1] = *(_OWORD *)(a2 + 16);
  v8 = v3;
  v7[0] = *(_OWORD *)a2;
  v9 = *(_QWORD *)(a2 + 48);
  if (!BYTE1(v11) || !BYTE1(v8))
    return &unk_1EA97EC40;
  memset(v18, 0, sizeof(v18));
  v14 = 0;
  v15 = &v14;
  v16 = 0x2000000000;
  v17 = 1;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 0x40000000;
  v13[2] = __valuesAreAllowed_block_invoke;
  v13[3] = &unk_1EA97EB80;
  v13[6] = v18;
  v13[7] = v19;
  v13[8] = v18;
  v13[9] = *(_QWORD *)&v10[0];
  v13[10] = *(_QWORD *)&v10[0] + 64;
  v13[11] = *(_QWORD *)&v10[0];
  v13[4] = &v14;
  v13[5] = v7;
  v13[12] = v18;
  if ((_QWORD *)der_vm_iterate_b((uint64_t)v10, (uint64_t)v13) == Errors)
  {
    v6 = *((unsigned __int8 *)v15 + 24);
    _Block_object_dispose(&v14, 8);
    if (v6)
    {
      v4 = &kCENoError;
      return *v4;
    }
  }
  else
  {
    *((_BYTE *)v15 + 24) = 0;
    _Block_object_dispose(&v14, 8);
  }
  v4 = &kCEQueryCannotBeSatisfied;
  return *v4;
}

uint64_t __valuesAreAllowed_block_invoke(_QWORD *a1, uint64_t a2)
{
  __int128 v4;
  unint64_t v5;
  __int128 v6;
  size_t *v7;
  __int128 *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  unint64_t v21;
  unint64_t v22;
  void (*v23)(unint64_t, const char *, uint64_t, uint64_t, uint64_t);
  const char *v24;
  int v25;
  int v26;
  char v27;
  int v28;
  int v29;
  int v30;
  unint64_t v31;
  int v32;
  int v33;
  int v34;
  int v35;
  size_t *v36;
  size_t v37;
  size_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  void (*v44)(unint64_t, const char *, uint64_t, uint64_t, uint64_t);
  const char *v45;
  unint64_t v46;
  char v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  void (*v54)(unint64_t, const char *, ...);
  _QWORD *v55;
  uint64_t v56;
  int v57;
  int v58;
  int v59;
  int v60;
  size_t v61;
  _BYTE v62[56];
  _BYTE v63[56];
  _BYTE v64[56];
  __int128 v65;
  __int128 v66;
  _OWORD v67[2];
  __int128 v68;
  __int128 v69;
  _BYTE v70[24];
  unint64_t v71[5];
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint64_t v76;
  __int128 v77;
  uint64_t v78;
  char v79;

  v4 = *(_OWORD *)(a2 + 72);
  v73 = *(_OWORD *)(a2 + 56);
  v74 = v4;
  v75 = *(_OWORD *)(a2 + 88);
  v76 = *(_QWORD *)(a2 + 104);
  der_vm_execute_nocopy((unint64_t)&v73, (size_t *)CESelectKeyOperation, (uint64_t)v71);
  v5 = v71[0];
  v68 = v72;
  v73 = 0uLL;
  if ((ccder_blob_decode_range() & 1) == 0)
    goto LABEL_96;
  v5 = *((_QWORD *)&v73 + 1);
  v61 = v73;
  v69 = 0u;
  memset(v70, 0, sizeof(v70));
  v68 = 0u;
  v6 = *(_OWORD *)(a2 + 72);
  v73 = *(_OWORD *)(a2 + 56);
  v74 = v6;
  v75 = *(_OWORD *)(a2 + 88);
  v76 = *(_QWORD *)(a2 + 104);
  der_vm_execute_nocopy((unint64_t)&v73, (size_t *)CESelectValueOperation, (uint64_t)&v68);
  v66 = 0u;
  memset(v67, 0, 24);
  v65 = 0u;
  v7 = (size_t *)a1[6];
  if ((unint64_t)v7 >= a1[7] || (unint64_t)v7 < a1[8])
    goto LABEL_100;
  v8 = (__int128 *)a1[5];
  *v7 = 0x4000000000000009;
  v7[1] = v61;
  v7[2] = v5 - v61;
  v9 = *v8;
  v10 = v8[1];
  v11 = v8[2];
  v76 = *((_QWORD *)v8 + 6);
  v74 = v10;
  v75 = v11;
  v73 = v9;
  der_vm_execute_nocopy((unint64_t)&v73, v7, (uint64_t)&v65);
  if (!BYTE1(v67[0]))
  {
    v21 = a1[9];
    v22 = a1[10];
    if (v21 + 64 > v22 || a1[11] > v21)
      goto LABEL_100;
    v23 = *(void (**)(unint64_t, const char *, uint64_t, uint64_t, uint64_t))(v21 + 24);
    if (!v23)
      goto LABEL_14;
    if (v21 >= v22)
      goto LABEL_100;
    v24 = "[%s]: subset validation failed, key not found in the superset '%.*s'\n";
LABEL_13:
    v23(v21, v24, v12, v13, v14);
LABEL_14:
    v5 = 0;
    *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 0;
    return v5;
  }
  v15 = *((_QWORD *)&v66 + 1);
  *(_QWORD *)&v77 = 0;
  v73 = *(_OWORD *)((char *)v67 + 8);
  if (!der_decode_next(v65, &v77, 0, 0, (uint64_t *)&v73))
    goto LABEL_22;
  if (v15 == (_QWORD)v77)
  {
LABEL_7:
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 1;
    v20 = 1;
    goto LABEL_23;
  }
  if ((uint64_t)v77 > 0x200000000000000FLL)
  {
    if ((_QWORD)v77 == 0x6000000000000010 || (_QWORD)v77 == 0x2000000000000010)
    {
      v16 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 2;
      v17 = 1;
      goto LABEL_23;
    }
LABEL_22:
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    goto LABEL_23;
  }
  v16 = 0;
  v17 = 0;
  v19 = 0;
  v20 = 5;
  v18 = 1;
  switch((uint64_t)v77)
  {
    case 1:
      break;
    case 2:
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 3;
      break;
    case 3:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
      goto LABEL_22;
    case 4:
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 6;
      break;
    case 12:
      v17 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 4;
      v16 = 1;
      break;
    default:
      if ((_QWORD)v77 != 0xA000000000000010)
        goto LABEL_22;
      goto LABEL_7;
  }
LABEL_23:
  v59 = v18;
  v60 = v17;
  v5 = *((_QWORD *)&v69 + 1);
  *(_QWORD *)&v77 = 0;
  v58 = v20;
  v57 = v19;
  if (!v70[1])
    goto LABEL_36;
  v73 = *(_OWORD *)&v70[8];
  if (!der_decode_next(v68, &v77, 0, 0, (uint64_t *)&v73))
    goto LABEL_36;
  if (v5 != (_QWORD)v77)
  {
    if ((uint64_t)v77 <= 0x200000000000000FLL)
    {
      v25 = 0;
      v27 = 0;
      v28 = 0;
      v29 = 0;
      v30 = 5;
      v26 = 1;
      switch((uint64_t)v77)
      {
        case 1:
          goto LABEL_37;
        case 2:
          v25 = 0;
          v26 = 0;
          v28 = 0;
          v29 = 0;
          v30 = 3;
          v27 = 1;
          break;
        case 3:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:
        case 11:
          goto LABEL_36;
        case 4:
          v25 = 0;
          v26 = 0;
          v27 = 0;
          v28 = 0;
          v29 = 0;
          v30 = 6;
          break;
        case 12:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          v29 = 0;
          v30 = 4;
          v25 = 1;
          break;
        default:
          if ((_QWORD)v77 != 0xA000000000000010)
            goto LABEL_36;
          goto LABEL_26;
      }
      goto LABEL_37;
    }
    if ((_QWORD)v77 == 0x6000000000000010 || (_QWORD)v77 == 0x2000000000000010)
    {
      v25 = 0;
      v26 = 0;
      v27 = 0;
      v29 = 0;
      v30 = 2;
      v28 = 1;
      goto LABEL_37;
    }
LABEL_36:
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v29 = 0;
    v30 = 0;
    goto LABEL_37;
  }
LABEL_26:
  v25 = 0;
  v26 = 0;
  v27 = 0;
  v28 = 0;
  v29 = 1;
  v30 = 1;
LABEL_37:
  if (v16)
  {
    v31 = a1[6];
    if (v31 >= a1[7] || v31 < a1[8])
      goto LABEL_100;
    v32 = v25;
    v33 = v16;
    v34 = v26;
    *(_QWORD *)v31 = 3;
    *(_BYTE *)(v31 + 8) = 42;
    v5 = 1;
    *(_QWORD *)(v31 + 248) = 1;
    v73 = v65;
    v74 = v66;
    v75 = v67[0];
    v76 = *(_QWORD *)&v67[1];
    v35 = v30;
    der_vm_execute_nocopy((unint64_t)&v73, (size_t *)v31, (uint64_t)v64);
    v30 = v35;
    v26 = v34;
    v16 = v33;
    v25 = v32;
    if (v64[33])
      return v5;
  }
  if (((v60 | v16) & v25) != 1)
  {
    if ((v59 & v26) == 1)
    {
      v73 = v65;
      v74 = v66;
      v75 = v67[0];
      v76 = *(_QWORD *)&v67[1];
      v5 = der_vm_BOOL_from_context((unint64_t *)&v73);
      v73 = v68;
      v74 = v69;
      v75 = *(_OWORD *)v70;
      v76 = *(_QWORD *)&v70[16];
      *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = v5 ^ der_vm_BOOL_from_context((unint64_t *)&v73) ^ 1;
      if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
      {
        v42 = a1[9];
        v46 = a1[10];
        if (v42 + 64 > v46 || a1[11] > v42)
          goto LABEL_100;
        v44 = *(void (**)(unint64_t, const char *, uint64_t, uint64_t, uint64_t))(v42 + 24);
        if (v44)
        {
          if (v42 < v46)
          {
            v45 = "[%s]: subset validation failed, BOOL value of key '%.*s' not allowed\n";
            goto LABEL_92;
          }
          goto LABEL_100;
        }
        return 0;
      }
      return 1;
    }
    v47 = v27 ^ 1;
    if ((v58 & 6) != 2)
      v47 = 1;
    if ((v47 & 1) == 0)
    {
      v5 = a1[6];
      if (v5 && (v5 >= a1[7] || v5 < a1[8]))
        goto LABEL_100;
      v73 = v68;
      v74 = v69;
      v75 = *(_OWORD *)v70;
      v76 = *(_QWORD *)&v70[16];
      v48 = der_vm_integer_from_context((unint64_t *)&v73);
      *(_QWORD *)v5 = 10;
      *(_QWORD *)(v5 + 8) = v48;
      v73 = v65;
      v74 = v66;
      v75 = v67[0];
      v76 = *(_QWORD *)&v67[1];
      der_vm_execute_nocopy((unint64_t)&v73, (size_t *)v5, (uint64_t)v62);
      *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = v62[33];
      if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
      {
        v42 = a1[9];
        v49 = a1[10];
        if (v42 + 64 > v49 || a1[11] > v42)
          goto LABEL_100;
        v44 = *(void (**)(unint64_t, const char *, uint64_t, uint64_t, uint64_t))(v42 + 24);
        if (v44)
        {
          if (v42 < v49)
          {
            v45 = "[%s]: subset validation failed, integer value of key '%.*s' not allowed\n";
            goto LABEL_92;
          }
          goto LABEL_100;
        }
        return 0;
      }
      return 1;
    }
    if ((v60 & v28) == 1)
    {
      v50 = a1[12];
      *(_QWORD *)&v77 = 0;
      *((_QWORD *)&v77 + 1) = &v77;
      v78 = 0x2000000000;
      v79 = 1;
      *(_QWORD *)&v73 = MEMORY[0x1E0C809B0];
      *((_QWORD *)&v73 + 1) = 0x40000000;
      *(_QWORD *)&v74 = __valueArrayIsAllowed_block_invoke;
      *((_QWORD *)&v74 + 1) = &unk_1EA97EBD0;
      *(_QWORD *)&v75 = &v77;
      *((_QWORD *)&v75 + 1) = &v65;
      v76 = v50;
      if ((_QWORD *)der_vm_iterate_b((uint64_t)&v68, (uint64_t)&v73) == Errors)
      {
        v5 = *(unsigned __int8 *)(*((_QWORD *)&v77 + 1) + 24) != 0;
      }
      else
      {
        v5 = 0;
        *(_BYTE *)(*((_QWORD *)&v77 + 1) + 24) = 0;
      }
      _Block_object_dispose(&v77, 8);
      *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = v5;
      if (!*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
      {
        v42 = a1[9];
        v52 = a1[10];
        if (v42 + 64 > v52 || a1[11] > v42)
          goto LABEL_100;
        v44 = *(void (**)(unint64_t, const char *, uint64_t, uint64_t, uint64_t))(v42 + 24);
        if (v44)
        {
          if (v42 < v52)
          {
            v45 = "[%s]: subset validation failed, string array of key '%.*s' not allowed\n";
            goto LABEL_92;
          }
          goto LABEL_100;
        }
        return 0;
      }
      return 1;
    }
    if ((v57 & v29) == 1)
    {
      *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = valuesAreAllowed((uint64_t *)&v68, (uint64_t)&v65, a1[12]);
      return *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) != 0;
    }
    if (v58 == v30)
      goto LABEL_14;
    v21 = a1[9];
    v51 = a1[10];
    if (v21 + 64 > v51 || a1[11] > v21)
      goto LABEL_100;
    v23 = *(void (**)(unint64_t, const char *, uint64_t, uint64_t, uint64_t))(v21 + 24);
    if (!v23)
      goto LABEL_14;
    if (v21 >= v51)
      goto LABEL_100;
    v24 = "[%s]: subset validation failed, type mismatch for key '%.*s' %lu != %lu \n";
    goto LABEL_13;
  }
  v5 = v68;
  v77 = *(_OWORD *)&v70[8];
  v73 = 0uLL;
  if ((ccder_blob_decode_range() & 1) == 0)
    goto LABEL_96;
  v36 = (size_t *)a1[6];
  if ((unint64_t)v36 >= a1[7] || (unint64_t)v36 < a1[8])
    goto LABEL_100;
  v37 = v73;
  v38 = *((_QWORD *)&v73 + 1) - v73;
  *v36 = 0x4000000000000006;
  v36[1] = v37;
  v36[2] = v38;
  v73 = v65;
  v74 = v66;
  v75 = v67[0];
  v76 = *(_QWORD *)&v67[1];
  der_vm_execute_nocopy((unint64_t)&v73, v36, (uint64_t)v63);
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = v63[33];
  if (*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
    return *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) != 0;
  v5 = v68;
  v77 = *(_OWORD *)&v70[8];
  v73 = 0uLL;
  if ((ccder_blob_decode_range() & 1) == 0)
  {
LABEL_96:
    v54 = *(void (**)(unint64_t, const char *, ...))(v5 + 24);
    if (v54)
      v54(v5, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
    if (!v5 || v5 < v5 + 64)
      goto LABEL_101;
    goto LABEL_100;
  }
  v42 = a1[9];
  v43 = a1[10];
  if (v42 + 64 <= v43 && a1[11] <= v42)
  {
    v44 = *(void (**)(unint64_t, const char *, uint64_t, uint64_t, uint64_t))(v42 + 24);
    if (v44)
    {
      if (v42 < v43)
      {
        v45 = "[%s]: subset validation failed, key %.*s with value '%.*s' not allowed\n";
LABEL_92:
        v44(v42, v45, v39, v40, v41);
        return *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) != 0;
      }
      goto LABEL_100;
    }
    return *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) != 0;
  }
LABEL_100:
  __break(0x5519u);
LABEL_101:
  v55 = (_QWORD *)(*(uint64_t (**)(unint64_t, const char *, ...))(v5 + 32))(v5, "[%s]: %s\n", "der_vm_string_from_context", "Attempting to select a string value from a non-string DER object");
  return __valueArrayIsAllowed_block_invoke(v55, v56);
}

uint64_t __valueArrayIsAllowed_block_invoke(_QWORD *a1, uint64_t a2)
{
  int v3;
  unint64_t v4;
  size_t v5;
  size_t v6;
  size_t *v7;
  __int128 *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  size_t *v17;
  __int128 *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t result;
  void (*v23)(unint64_t, const char *, ...);
  uint64_t v24;
  _QWORD v25[7];
  _BYTE v26[56];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  _BYTE v31[56];
  __int128 v32;

  v3 = *(_DWORD *)(a2 + 116);
  switch(v3)
  {
    case 1:
      *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 0;
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 0x40000000;
      v25[2] = __valueArrayIsAllowed_block_invoke_2;
      v25[3] = &unk_1EA97EBA8;
      v13 = a1[5];
      v14 = a1[6];
      v25[5] = a2;
      v25[6] = v14;
      v25[4] = a1[4];
      der_vm_iterate_b(v13, (uint64_t)v25);
      return *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) != 0;
    case 3:
      v15 = *(_OWORD *)(a2 + 72);
      v27 = *(_OWORD *)(a2 + 56);
      v28 = v15;
      v29 = *(_OWORD *)(a2 + 88);
      v30 = *(_QWORD *)(a2 + 104);
      v16 = der_vm_integer_from_context((unint64_t *)&v27);
      v18 = (__int128 *)a1[5];
      v17 = (size_t *)a1[6];
      *v17 = 10;
      v17[1] = v16;
      v19 = *v18;
      v20 = v18[1];
      v21 = v18[2];
      v30 = *((_QWORD *)v18 + 6);
      v28 = v20;
      v29 = v21;
      v27 = v19;
      der_vm_execute_nocopy((unint64_t)&v27, v17, (uint64_t)v26);
      v12 = v26[33];
      goto LABEL_8;
    case 4:
      v4 = *(_QWORD *)(a2 + 56);
      v32 = *(_OWORD *)(a2 + 96);
      v27 = 0uLL;
      if ((ccder_blob_decode_range() & 1) != 0)
      {
        v5 = v27;
        v6 = *((_QWORD *)&v27 + 1) - v27;
        v8 = (__int128 *)a1[5];
        v7 = (size_t *)a1[6];
        *v7 = 0x4000000000000006;
        v7[1] = v5;
        v7[2] = v6;
        v9 = *v8;
        v10 = v8[1];
        v11 = v8[2];
        v30 = *((_QWORD *)v8 + 6);
        v28 = v10;
        v29 = v11;
        v27 = v9;
        der_vm_execute_nocopy((unint64_t)&v27, v7, (uint64_t)v31);
        v12 = v31[33];
LABEL_8:
        *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = v12;
        return *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) != 0;
      }
      v23 = *(void (**)(unint64_t, const char *, ...))(v4 + 24);
      if (v23)
        v23(v4, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
      if (v4)
      {
        if (v4 >= v4 + 64)
          __break(0x5519u);
      }
      v24 = (*(uint64_t (**)(unint64_t, const char *, ...))(v4 + 32))(v4, "[%s]: %s\n", "der_vm_string_from_context", "Attempting to select a string value from a non-string DER object");
      return valuesAreAllowed(v24);
    default:
      result = 0;
      *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 0;
      break;
  }
  return result;
}

BOOL valuesAreAllowed(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _BOOL8 v5;
  _QWORD v7[13];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v3 = *a1;
  v4 = *a1 + 64;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2000000000;
  v11 = 1;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 0x40000000;
  v7[2] = __valuesAreAllowed_block_invoke;
  v7[3] = &unk_1EA97EB80;
  v7[6] = a3;
  v7[7] = a3 + 256;
  v7[8] = a3;
  v7[9] = v3;
  v7[10] = v4;
  v7[11] = v3;
  v7[4] = &v8;
  v7[5] = a2;
  v7[12] = a3;
  if ((_QWORD *)der_vm_iterate_b((uint64_t)a1, (uint64_t)v7) == Errors)
  {
    v5 = *((unsigned __int8 *)v9 + 24) != 0;
  }
  else
  {
    v5 = 0;
    *((_BYTE *)v9 + 24) = 0;
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __valueArrayIsAllowed_block_invoke_2(_QWORD *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  _QWORD v8[13];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  result = 1;
  if (*(_DWORD *)(a2 + 116) == 1)
  {
    v4 = a1[5];
    v5 = a1[6];
    v6 = *(_QWORD *)(v4 + 56);
    v9 = 0;
    v10 = &v9;
    v11 = 0x2000000000;
    v12 = 1;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 0x40000000;
    v8[2] = __valuesAreAllowed_block_invoke;
    v8[3] = &unk_1EA97EB80;
    v8[6] = v5;
    v8[7] = v5 + 256;
    v8[8] = v5;
    v8[9] = v6;
    v8[10] = v6 + 64;
    v8[11] = v6;
    v8[4] = &v9;
    v8[5] = a2 + 56;
    v8[12] = v5;
    if ((_QWORD *)der_vm_iterate_b(v4 + 56, (uint64_t)v8) == Errors)
    {
      v7 = *((unsigned __int8 *)v10 + 24);
      _Block_object_dispose(&v9, 8);
      result = 1;
      if (v7)
      {
        *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 1;
        return 0;
      }
    }
    else
    {
      *((_BYTE *)v10 + 24) = 0;
      _Block_object_dispose(&v9, 8);
      return 1;
    }
  }
  return result;
}

const char *CEGetErrorString(_QWORD *a1)
{
  BOOL v1;
  BOOL v2;

  if (a1 >= Errors)
  {
    v1 = a1 >= qword_1EA97EC50;
    v2 = a1 == qword_1EA97EC50;
  }
  else
  {
    v1 = 1;
    v2 = 0;
  }
  if (!v2 && v1)
    return "Not a CoreEntitlements error!";
  else
    return (const char *)a1[1];
}

_QWORD *CECreateStringOpInplace(_QWORD *a1, uint64_t a2, void *__src, size_t __n)
{
  _QWORD *v5;
  _QWORD *v6;

  v5 = a1;
  *a1 = a2;
  if ((a2 & 0x4000000000000000) != 0)
  {
    a1[1] = __src;
    v6 = a1 + 2;
  }
  else
  {
    if (__n > 0xEF)
      return 0;
    memcpy(a1 + 1, __src, __n);
    v6 = v5 + 31;
  }
  *v6 = __n;
  return v5;
}

_QWORD *CECreateNumericOpInplace(_QWORD *result, uint64_t a2, uint64_t a3)
{
  *result = a2;
  result[1] = a3;
  return result;
}

uint64_t der_vm_block_trampoline(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, _OWORD *);
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v8[8];

  v1 = *(_QWORD *)(a1 + 120);
  v2 = *(uint64_t (**)(uint64_t, _OWORD *))(v1 + 16);
  v3 = *(_OWORD *)(a1 + 80);
  v8[4] = *(_OWORD *)(a1 + 64);
  v8[5] = v3;
  v4 = *(_OWORD *)(a1 + 112);
  v8[6] = *(_OWORD *)(a1 + 96);
  v8[7] = v4;
  v5 = *(_OWORD *)(a1 + 16);
  v8[0] = *(_OWORD *)a1;
  v8[1] = v5;
  v6 = *(_OWORD *)(a1 + 48);
  v8[2] = *(_OWORD *)(a1 + 32);
  v8[3] = v6;
  return v2(v1, v8);
}

uint64_t der_decode_data(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, const char *, ...);

  v4 = ccder_blob_decode_range();
  if ((v4 & 1) != 0)
  {
    if (a2)
    {
      *a2 = 0;
      a2[1] = 0;
    }
  }
  else
  {
    v5 = *(void (**)(uint64_t, const char *, ...))(a1 + 24);
    if (v5)
      v5(a1, "[%s]: %s\n", "der_decode_data", "Unknown data encoding");
  }
  return v4;
}

uint64_t CEBuffer_cmp(void *__s1, size_t a2, void *__s2, size_t a4)
{
  uint64_t result;
  size_t v8;
  unsigned int v9;

  result = 0xFFFFFFFFLL;
  if (__s1 && a2)
  {
    if (__s2)
    {
      if (a2 >= a4)
        v8 = a4;
      else
        v8 = a2;
      if (a2 < a4)
        v9 = -1;
      else
        v9 = 1;
      LODWORD(result) = memcmp(__s1, __s2, v8);
      if (a2 != a4 && (_DWORD)result == 0)
        return v9;
      else
        return result;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

_QWORD *der_size_element(_QWORD *a1, uint64_t a2, uint64_t *a3)
{
  _QWORD *result;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  uint64_t v14;

  if (!a1)
    return &unk_1EA97EC10;
  switch(*a1)
  {
    case 1:
      a1[2] = 1;
      goto LABEL_28;
    case 2:
    case 9:
LABEL_28:
      *a3 = ccder_sizeof();
      return Errors;
    case 4:
      v7 = a1[1];
      v8 = HIBYTE(v7);
      if ((HIBYTE(v7) + 1) > 1u)
      {
        v14 = 8;
      }
      else
      {
        if ((_DWORD)v8 == BYTE6(v7))
        {
          if ((_DWORD)v8 == BYTE5(v7))
          {
            if ((_DWORD)v8 == BYTE4(v7))
            {
              if ((_DWORD)v8 == BYTE3(v7))
              {
                if ((_DWORD)v8 == BYTE2(v7))
                {
                  if (BYTE1(v7) == (_DWORD)v8)
                    v9 = 2;
                  else
                    v9 = 3;
                  v10 = 1;
                  if (BYTE1(v7) != (_DWORD)v8)
                    v10 = 2;
                }
                else
                {
                  v10 = 3;
                  v9 = 4;
                }
              }
              else
              {
                v10 = 4;
                v9 = 5;
              }
            }
            else
            {
              v10 = 5;
              v9 = 6;
            }
          }
          else
          {
            v10 = 6;
            v9 = 7;
          }
        }
        else
        {
          v10 = 7;
          v9 = 8;
        }
        if ((((v7 >> (8 * v10 - 8)) ^ v8) & 0x80) != 0)
          v14 = v9;
        else
          v14 = v10;
      }
      *a3 = ccder_sizeof();
      a1[2] = v14;
      return Errors;
    case 5:
      goto LABEL_17;
    case 7:
      return (_QWORD *)der_size_dictionary(a1, a2, a3);
    default:
      return &unk_1EA97EC10;
  }
  while (1)
  {
LABEL_17:
    result = *(_QWORD **)a2;
    v11 = *(_QWORD *)(a2 + 8);
    if (*(_QWORD *)a2 >= v11)
      return &unk_1EA97EC30;
    v12 = result + 4;
    if ((unint64_t)(result + 4) > v11 || result >= v12)
      break;
    *(_QWORD *)a2 = v12;
    if (!result)
      return &unk_1EA97EC30;
    if (*result == 6)
    {
      *a3 = ccder_sizeof();
      a1[2] = 0;
      return Errors;
    }
    if (result >= v12)
      break;
    result = (_QWORD *)der_size_element();
    if (result != Errors)
      return result;
  }
  __break(0x5519u);
  return result;
}

uint64_t der_size_dictionary(uint64_t result, unint64_t *a2, uint64_t *a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;

  v5 = result;
  v6 = 0;
  v7 = *a2;
  v8 = a2[1];
  if (*a2 >= v8)
    return (uint64_t)&unk_1EA97EC30;
  while (1)
  {
    v9 = (_QWORD *)(v7 + 32);
    if (v7 + 32 > v8 || v7 > (unint64_t)v9)
    {
LABEL_28:
      __break(0x5519u);
      return result;
    }
    *a2 = (unint64_t)v9;
    if (!v7)
      return (uint64_t)&unk_1EA97EC30;
    if (*(_QWORD *)v7 != 5)
      break;
    *(_BYTE *)(v7 + 24) = 1;
    if ((unint64_t)v9 >= v8)
      return (uint64_t)&unk_1EA97EC30;
    v10 = v7 + 64;
    if (v7 + 64 > v8 || (unint64_t)v9 > v10)
      goto LABEL_28;
    *a2 = v10;
    if (v7 == -32 || *v9 != 3 || !*(_QWORD *)(v7 + 48))
      return (uint64_t)&unk_1EA97EC30;
    v11 = ccder_sizeof();
    result = 0;
    v15 = 0;
    if (v10 < v8)
    {
      v12 = v7 + 96;
      if (v7 + 96 > v8 || v10 > v12)
        goto LABEL_28;
      *a2 = v12;
      result = v7 + 64;
    }
    result = (uint64_t)der_size_element((_QWORD *)result, (uint64_t)a2, &v15);
    if ((_QWORD *)result != Errors)
      return result;
    v13 = *a2;
    v8 = a2[1];
    if (*a2 >= v8)
      return (uint64_t)&unk_1EA97EC30;
    v14 = v13 + 32;
    if (v13 + 32 > v8 || v13 > v14)
      goto LABEL_28;
    *a2 = v14;
    if (v13)
    {
      if (*(_QWORD *)v13 == 6)
      {
        *(_BYTE *)(v13 + 24) = 1;
        *(_QWORD *)(v7 + 16) = v15 + v11;
        result = ccder_sizeof();
        v6 += result;
        v7 = v14;
        if (v14 < v8)
          continue;
      }
    }
    return (uint64_t)&unk_1EA97EC30;
  }
  if (*(_QWORD *)v7 != 8)
    return (uint64_t)&unk_1EA97EC30;
  *a3 = ccder_sizeof();
  *(_QWORD *)(v5 + 16) = v6;
  return (uint64_t)Errors;
}

uint64_t der_encode_number()
{
  return ccder_blob_reserve_tl();
}

uint64_t der_vm_execute_match_string(uint64_t a1, __int128 *a2, uint64_t a3)
{
  unint64_t v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t result;
  char v11;
  uint64_t (*v12)(unint64_t, const char *, ...);
  uint64_t (*v13)(unint64_t, const char *, ...);

  v4 = *(_QWORD *)a2;
  v5 = a2[2];
  v6 = *a2;
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v5;
  *(_OWORD *)a1 = v6;
  *(_QWORD *)(a1 + 48) = *((_QWORD *)a2 + 6);
  *(_BYTE *)(a1 + 33) = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  if ((*(_BYTE *)(a3 + 7) & 0x40) != 0)
  {
    v7 = *(_QWORD *)(a3 + 8);
    v8 = (uint64_t *)(a3 + 16);
  }
  else
  {
    v7 = a3 + 8;
    v8 = (uint64_t *)(a3 + 248);
  }
  v9 = *v8;
  result = ccder_blob_decode_range();
  if ((result & 1) != 0)
  {
    v11 = 0;
    if (v7 && v9)
      v11 = 0;
    if (!v9)
      v11 = 1;
    *(_BYTE *)(a1 + 33) = v11;
  }
  else
  {
    v12 = *(uint64_t (**)(unint64_t, const char *, ...))(v4 + 24);
    if (v12)
    {
      result = v12(v4, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
      v13 = *(uint64_t (**)(unint64_t, const char *, ...))(v4 + 24);
      if (v13)
      {
        if (v4 && v4 >= v4 + 64)
          __break(0x5519u);
        else
          return v13(v4, "[%s]: %s\n", "der_vm_execute_match_string", "string decode failure");
      }
    }
  }
  return result;
}

uint64_t string_value_allowed_iterate(uint64_t *a1)
{
  _QWORD *v2;
  uint64_t v3;
  const void *v4;
  size_t *v5;
  size_t v6;
  uint64_t result;
  uint64_t v8;
  void (*v9)(uint64_t, const char *, ...);
  unint64_t v10;
  size_t v11;
  _BYTE *v12;
  int v14;
  void (*v15)(unint64_t, const char *, ...);
  uint64_t v16;
  _BYTE v17[56];
  __int128 v18;
  _BYTE *v19;
  unint64_t v20;

  v2 = (_QWORD *)a1[15];
  v3 = v2[1];
  if ((*(_BYTE *)(v3 + 7) & 0x40) != 0)
  {
    v4 = *(const void **)(v3 + 8);
    v5 = (size_t *)(v3 + 16);
  }
  else
  {
    v4 = (const void *)(v3 + 8);
    v5 = (size_t *)(v3 + 248);
  }
  if (*((_DWORD *)a1 + 29) != 4)
  {
    v8 = *a1;
    v9 = *(void (**)(uint64_t, const char *, ...))(*a1 + 24);
    if (v9)
      v9(v8, "[%s]: %s\n", "string_value_allowed_iterate", "Unexpected type to match against during iteration");
    return 1;
  }
  v6 = *v5;
  der_vm_execute_match_string((uint64_t)v17, (__int128 *)(a1 + 7), v3);
  if (v17[33])
  {
    result = 0;
    *(_BYTE *)(*v2 + 33) = 1;
    return result;
  }
  v10 = a1[7];
  v18 = *((_OWORD *)a1 + 6);
  v19 = 0;
  v20 = 0;
  if ((ccder_blob_decode_range() & 1) == 0)
  {
    v15 = *(void (**)(unint64_t, const char *, ...))(v10 + 24);
    if (v15)
      v15(v10, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
    if (!v10 || v10 < v10 + 64)
      goto LABEL_27;
    goto LABEL_26;
  }
  if (v20 - (unint64_t)v19 < 2)
    return 1;
  v11 = v20 - (_QWORD)v19 - 1;
  v12 = (_BYTE *)(v20 - 1);
  if (v20 - 1 >= v20 || v12 < v19)
  {
LABEL_26:
    __break(0x5519u);
LABEL_27:
    v16 = (*(uint64_t (**)(unint64_t, const char *, ...))(v10 + 32))(v10, "[%s]: %s\n", "der_vm_string_from_context", "Attempting to select a string value from a non-string DER object");
    return string_prefix_allowed_iterate(v16);
  }
  if (*v12 != 42 || v11 > v6)
    return 1;
  v14 = memcmp(v19, v4, v11);
  result = 1;
  if (!v14)
  {
    *(_BYTE *)(*v2 + 33) = 1;
    return 0;
  }
  return result;
}

uint64_t string_prefix_allowed_iterate(uint64_t *a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  void (*v8)(uint64_t, const char *, ...);
  void (*v9)(unint64_t, const char *, ...);
  void (*v10)(unint64_t, const char *, ...);
  uint64_t result;
  void (*v12)(unint64_t, const char *, ...);
  uint64_t v13;

  v2 = *a1;
  v3 = (_QWORD *)a1[15];
  v4 = v3[1];
  v5 = *((_DWORD *)a1 + 29);
  if ((*(_BYTE *)(v4 + 7) & 0x40) == 0)
  {
    if (v5 == 4)
    {
      v6 = *(_QWORD *)(v4 + 248);
      goto LABEL_6;
    }
LABEL_9:
    v8 = *(void (**)(uint64_t, const char *, ...))(v2 + 24);
    if (v8)
      v8(v2, "[%s]: %s\n", "string_prefix_allowed_iterate", "Unexpected type to match against during iteration");
    return 1;
  }
  if (v5 != 4)
    goto LABEL_9;
  v6 = *(_QWORD *)(v4 + 16);
LABEL_6:
  v7 = a1[7];
  if ((ccder_blob_decode_range() & 1) != 0)
  {
    if (!v6)
    {
LABEL_19:
      result = 0;
      *(_BYTE *)(*v3 + 33) = 1;
      return result;
    }
  }
  else
  {
    v9 = *(void (**)(unint64_t, const char *, ...))(v7 + 24);
    if (v9)
    {
      v9(v7, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
      v10 = *(void (**)(unint64_t, const char *, ...))(v7 + 24);
      if (v10)
      {
        if (v7 && v7 >= v7 + 64)
        {
LABEL_24:
          __break(0x5519u);
          goto LABEL_25;
        }
        v10(v7, "[%s]: %s\n", "der_vm_execute_match_string_prefix", "string decode failure");
      }
    }
  }
  v7 = a1[7];
  if ((ccder_blob_decode_range() & 1) != 0)
  {
    if (v6)
      return 1;
    goto LABEL_19;
  }
  v12 = *(void (**)(unint64_t, const char *, ...))(v7 + 24);
  if (v12)
    v12(v7, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
  if (v7 && v7 >= v7 + 64)
    goto LABEL_24;
LABEL_25:
  v13 = (*(uint64_t (**)(unint64_t, const char *, ...))(v7 + 32))(v7, "[%s]: %s\n", "der_vm_string_from_context", "Attempting to select a string value from a non-string DER object");
  return integer_allowed_iterate(v13);
}

uint64_t integer_allowed_iterate(uint64_t *a1)
{
  _QWORD *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t result;
  uint64_t v5;
  void (*v6)(uint64_t, const char *, ...);
  uint64_t (*v7)(unint64_t, const char *, ...);
  void (*v8)(unint64_t, const char *, ...);

  if (*((_DWORD *)a1 + 29) != 3)
  {
    v5 = *a1;
    v6 = *(void (**)(uint64_t, const char *, ...))(v5 + 24);
    if (v6)
      v6(v5, "[%s]: %s\n", "integer_allowed_iterate", "Unexpected type to match against during iteration");
    return 0;
  }
  v1 = (_QWORD *)a1[15];
  v2 = v1[1];
  v3 = a1[7];
  result = ccder_blob_decode_range();
  if ((result & 1) != 0)
  {
    result = 1;
    if (!*(_QWORD *)(v2 + 8))
    {
      *(_BYTE *)(*v1 + 33) = 1;
      return 0;
    }
  }
  else
  {
    v7 = *(uint64_t (**)(unint64_t, const char *, ...))(v3 + 24);
    if (v7)
      result = v7(v3, "[%s]: %s\n", "der_decode_number", "unknown number encoding");
    v8 = *(void (**)(unint64_t, const char *, ...))(v3 + 24);
    if (v8)
    {
      if (v3 && v3 >= v3 + 64)
      {
        __break(0x5519u);
        return result;
      }
      v8(v3, "[%s]: %s\n", "der_vm_execute_match_integer", "BOOL decode failure");
    }
    return 1;
  }
  return result;
}

uint64_t der_vm_context_create@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, unint64_t a4@<X3>, unint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  *a6 = result;
  a6[3] = a2;
  a6[4] = 256;
  *((_BYTE *)a6 + 32) = a3;
  if (a4 > a5)
  {
    __break(0x5519u);
  }
  else
  {
    a6[5] = a4;
    a6[6] = a5;
    a6[1] = 0;
    a6[2] = 0;
  }
  return result;
}

unint64_t der_vm_execute@<X0>(unint64_t result@<X0>, size_t *a2@<X1>, uint64_t a3@<X8>)
{
  __int128 v3;
  _OWORD v4[3];
  uint64_t v5;

  if (a2 && a2 + 32 < a2)
  {
    __break(0x5519u);
  }
  else
  {
    v3 = *(_OWORD *)(result + 16);
    v4[0] = *(_OWORD *)result;
    v4[1] = v3;
    v4[2] = *(_OWORD *)(result + 32);
    v5 = *(_QWORD *)(result + 48);
    return der_vm_execute_nocopy((unint64_t)v4, a2, a3);
  }
  return result;
}

double der_vm_execute_seq_nocopy@<D0>(uint64_t a1@<X0>, size_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  size_t *v9;
  __int128 v10;
  __int128 v11;
  _OWORD v13[3];
  uint64_t v14;
  _OWORD v15[2];
  __int128 v16;
  uint64_t v17;

  v5 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a4 = *(_OWORD *)a1;
  *(_OWORD *)(a4 + 16) = v5;
  v6 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a4 + 32) = v6;
  *(_QWORD *)(a4 + 48) = *(_QWORD *)(a1 + 48);
  if (a3)
  {
    v7 = a3;
    do
    {
      v11 = *(_OWORD *)(a4 + 16);
      v13[0] = *(_OWORD *)a4;
      v13[1] = v11;
      v13[2] = *(_OWORD *)(a4 + 32);
      v14 = *(_QWORD *)(a4 + 48);
      if (a2)
        v9 = a2;
      else
        v9 = 0;
      der_vm_execute_nocopy((unint64_t)v13, v9, (uint64_t)v15);
      v10 = v15[1];
      *(_OWORD *)a4 = v15[0];
      *(_OWORD *)(a4 + 16) = v10;
      *(_QWORD *)&v6 = v16;
      *(_OWORD *)(a4 + 32) = v16;
      *(_QWORD *)(a4 + 48) = v17;
      a2 += 32;
      --v7;
    }
    while (v7);
  }
  return *(double *)&v6;
}

uint64_t der_vm_context_is_valid(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 33);
}

uint64_t der_vm_CEType_from_ccder_tag(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (*(_QWORD *)(a1 + 24) == a2)
    return 1;
  if (a2 > 0x200000000000000FLL)
  {
    if (a2 == 0x6000000000000010 || a2 == 0x2000000000000010)
      return 2;
    else
      return 0;
  }
  else
  {
    result = 5;
    switch(a2)
    {
      case 1:
        return result;
      case 2:
        result = 3;
        break;
      case 3:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
        return 0;
      case 4:
        result = 6;
        break;
      case 12:
        result = 4;
        break;
      default:
        return a2 == 0xA000000000000010;
    }
  }
  return result;
}

uint64_t der_vm_CEType_from_context(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  v8 = 0;
  if (!*(_BYTE *)(a1 + 33))
    return 0;
  v4 = *(_QWORD *)a1;
  v7 = *(_OWORD *)(a1 + 40);
  result = der_decode_next(v4, &v8, 0, 0, (uint64_t *)&v7);
  if (!(_DWORD)result)
    return result;
  v6 = v8;
  if (a2)
    *a2 = v8;
  if (*(_QWORD *)(a1 + 24) == v6)
    return 1;
  if (v6 > 0x200000000000000FLL)
  {
    if (v6 == 0x6000000000000010 || v6 == 0x2000000000000010)
      return 2;
    return 0;
  }
  result = 5;
  switch(v6)
  {
    case 1:
      return result;
    case 2:
      result = 3;
      break;
    case 3:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
      return 0;
    case 4:
      result = 6;
      break;
    case 12:
      result = 4;
      break;
    default:
      return v6 == 0xA000000000000010;
  }
  return result;
}

unint64_t der_vm_iterate(unint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[8];

  if (result && result + 56 < result)
  {
    __break(0x5519u);
  }
  else
  {
    v5[6] = v3;
    v5[7] = v4;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 0x40000000;
    v5[2] = __der_vm_iterate_block_invoke;
    v5[3] = &__block_descriptor_tmp_156;
    v5[4] = a2;
    v5[5] = a3;
    return der_vm_iterate_b(result, (uint64_t)v5);
  }
  return result;
}

uint64_t der_vm_iterate_nocopy(uint64_t a1, uint64_t a2, uint64_t (*a3)(_OWORD *))
{
  unint64_t v6;
  unint64_t v7;
  uint64_t result;
  int v9;
  void (*v10)(unint64_t, const char *, ...);
  const char *v11;
  int v12;
  __int128 v13;
  __int128 v14;
  void (*v15)(unint64_t, const char *, ...);
  _OWORD v16[3];
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  int v22;
  int v23;
  uint64_t v24;
  __int128 v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD v28[2];

  if (!a3 || !*(_BYTE *)(a1 + 33))
    return (uint64_t)&unk_1EA97EC10;
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)a1 + 64;
  v27 = 0;
  v28[0] = 0;
  v26 = 0;
  v25 = *(_OWORD *)(a1 + 40);
  result = der_decode_next(v6, v28, 0, &v26, (uint64_t *)&v25);
  if ((result & 1) == 0)
  {
    v10 = *(void (**)(unint64_t, const char *, ...))(v6 + 24);
    if (!v10)
      return (uint64_t)&unk_1EA97EC30;
    if (v6 && v6 >= v7)
      goto LABEL_40;
    v11 = "iterable decoding failure";
LABEL_33:
    v10(v6, "[%s]: %s\n", "der_vm_iterate_nocopy", v11);
    return (uint64_t)&unk_1EA97EC30;
  }
  if (*(_QWORD *)(a1 + 24) == v28[0])
  {
LABEL_8:
    v9 = 1;
    goto LABEL_16;
  }
  v9 = 2;
  if (v28[0] == 0x6000000000000010 || v28[0] == 0x2000000000000010)
  {
    while (1)
    {
LABEL_16:
      if (v26 >= v27)
        return (uint64_t)Errors;
      v13 = *(_OWORD *)(a1 + 16);
      v14 = *(_OWORD *)(a1 + 32);
      v16[0] = *(_OWORD *)a1;
      v16[1] = v13;
      v16[2] = v14;
      v17 = *(_QWORD *)(a1 + 48);
      v18 = v16[0];
      v19 = v13;
      v20 = v14;
      v21 = v17;
      v22 = v9;
      v23 = 0;
      v24 = a2;
      result = der_decode_next(*(_QWORD *)a1, v28, (_QWORD *)&v20 + 1, 0, (uint64_t *)&v26);
      if ((result & 1) == 0)
        break;
      if (*((_QWORD *)&v19 + 1) == v28[0])
      {
        v12 = 1;
      }
      else if (v28[0] > 0x200000000000000FLL)
      {
        if (v28[0] == 0x6000000000000010 || v28[0] == 0x2000000000000010)
          v12 = 2;
        else
LABEL_25:
          v12 = 0;
      }
      else
      {
        v12 = 5;
        switch(v28[0])
        {
          case 1:
            break;
          case 2:
            v12 = 3;
            break;
          case 4:
            v12 = 6;
            break;
          case 0xCLL:
            v12 = 4;
            break;
          default:
            goto LABEL_25;
        }
      }
      v23 = v12;
      if ((a3(v16) & 1) == 0)
        return (uint64_t)Errors;
    }
    v10 = *(void (**)(unint64_t, const char *, ...))(v6 + 24);
    if (!v10)
      return (uint64_t)&unk_1EA97EC30;
    if (v6 && v6 >= v7)
      goto LABEL_40;
    v11 = "encountered invalid element in an iterable";
    goto LABEL_33;
  }
  if (v28[0] == 0xA000000000000010)
    goto LABEL_8;
  v15 = *(void (**)(unint64_t, const char *, ...))(v6 + 24);
  if (!v15)
    return (uint64_t)&unk_1EA97EC10;
  if (!v6 || v6 < v7)
  {
    v15(v6, "[%s]: %s\n", "der_vm_iterate_nocopy", "iteration over a non-iterable type");
    return (uint64_t)&unk_1EA97EC10;
  }
LABEL_40:
  __break(0x5519u);
  return result;
}

uint64_t der_vm_string_from_context(unint64_t *a1)
{
  unint64_t v1;
  void (*v3)(unint64_t, const char *, ...);
  uint64_t v4;

  v1 = *a1;
  if ((ccder_blob_decode_range() & 1) != 0)
    return 0;
  v3 = *(void (**)(unint64_t, const char *, ...))(v1 + 24);
  if (v3)
    v3(v1, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
  if (v1)
  {
    if (v1 >= v1 + 64)
      __break(0x5519u);
  }
  v4 = (*(uint64_t (**)(unint64_t, const char *, ...))(v1 + 32))(v1, "[%s]: %s\n", "der_vm_string_from_context", "Attempting to select a string value from a non-string DER object");
  return der_vm_data_from_context(v4);
}

uint64_t der_vm_data_from_context(unint64_t *a1)
{
  unint64_t v1;
  void (*v3)(unint64_t, const char *, ...);
  uint64_t v4;

  v1 = *a1;
  if ((ccder_blob_decode_range() & 1) != 0)
    return 0;
  v3 = *(void (**)(unint64_t, const char *, ...))(v1 + 24);
  if (v3)
    v3(v1, "[%s]: %s\n", "der_decode_data", "Unknown data encoding");
  if (v1)
  {
    if (v1 >= v1 + 64)
      __break(0x5519u);
  }
  v4 = (*(uint64_t (**)(unint64_t, const char *, ...))(v1 + 32))(v1, "[%s]: %s\n", "der_vm_data_from_context", "Attempting to select a data value from a non-data DER object");
  return der_vm_buffer_from_context(v4);
}

uint64_t der_vm_buffer_from_context(uint64_t a1)
{
  unint64_t v1;
  uint64_t result;
  BOOL v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)a1;
  v5 = 0;
  v6 = 0;
  v4 = *(_OWORD *)(a1 + 40);
  result = der_decode_next(v1, 0, 0, &v5, (uint64_t *)&v4);
  if ((result & 1) != 0)
  {
    if (v6 == v5)
      return 0;
    else
      return v5;
  }
  else
  {
    if (v1)
      v3 = v1 >= v1 + 64;
    else
      v3 = 0;
    if (!v3)
      result = (*(uint64_t (**)(unint64_t, const char *, ...))(v1 + 32))(v1, "[%s]: %s\n", "der_vm_buffer_from_context", "Failed during buffer decoding");
    __break(0x5519u);
  }
  return result;
}

uint64_t der_vm_select_BOOL_for_key(uint64_t a1, char *__s, BOOL *a3)
{
  unint64_t v3;
  char v6;
  unint64_t v7;
  void (*v9)(unint64_t, const char *, ...);
  const char *v10;
  int v11;
  char *v12;
  _BYTE v13[33];
  char v14;
  int v15;
  __int16 v16;
  __int128 v17;
  _BYTE *v18;
  _BYTE v19[25];
  char v20;
  int v21;
  __int16 v22;
  __int128 v23;
  size_t v24[3];
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
  uint64_t v39;
  _OWORD v40[16];
  uint64_t v41;

  v3 = (unint64_t)__s;
  v41 = *MEMORY[0x1E0C80C00];
  if (!__s)
    return v3;
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
  v24[0] = 0x4000000000000001;
  v24[1] = (size_t)__s;
  v39 = 0;
  v24[2] = strlen(__s);
  v40[0] = xmmword_1DF0773A0;
  memset(&v40[1], 0, 240);
  v6 = *(_BYTE *)(a1 + 33);
  *(_QWORD *)v13 = *(_QWORD *)a1;
  *(_OWORD *)&v13[8] = *(_OWORD *)(a1 + 8);
  *(_OWORD *)&v13[17] = *(_OWORD *)(a1 + 17);
  v14 = v6;
  v15 = *(_DWORD *)(a1 + 34);
  v16 = *(_WORD *)(a1 + 38);
  v17 = *(_OWORD *)(a1 + 40);
  der_vm_execute_nocopy((unint64_t)v13, v24, (uint64_t)&v18);
  *(_OWORD *)&v13[8] = *(_OWORD *)v19;
  *(_OWORD *)&v13[17] = *(_OWORD *)&v19[9];
  v15 = v21;
  v16 = v22;
  *(_QWORD *)v13 = v18;
  v14 = v20;
  v17 = v23;
  der_vm_execute_nocopy((unint64_t)v13, (size_t *)v40, (uint64_t)&v18);
  v3 = v20 != 0;
  if (!a3 || !v20)
    return v3;
  v7 = (unint64_t)v18;
  *(_OWORD *)v13 = v23;
  v18 = 0;
  *(_QWORD *)v19 = 0;
  if ((ccder_blob_decode_range() & 1) == 0)
  {
    v9 = *(void (**)(unint64_t, const char *, ...))(v7 + 24);
    if (v9)
    {
      v10 = "Unknown BOOLean encoding";
LABEL_13:
      v9(v7, "[%s]: %s\n", "der_decode_BOOLean", v10);
    }
LABEL_14:
    if (!v7 || v7 < v7 + 64)
      goto LABEL_17;
    goto LABEL_16;
  }
  if (*(_QWORD *)v19 - (_QWORD)v18 != 1)
  {
    v9 = *(void (**)(unint64_t, const char *, ...))(v7 + 24);
    if (v9)
    {
      v10 = "BOOLean should be exactly 1 byte";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if ((unint64_t)v18 < *(_QWORD *)v19)
  {
    *a3 = *v18 != 0;
    return v3;
  }
LABEL_16:
  __break(0x5519u);
LABEL_17:
  v11 = (*(uint64_t (**)(unint64_t, const char *, ...))(v7 + 32))(v7, "[%s]: %s\n", "der_vm_BOOL_from_context", "Attempting to select a BOOLean value from a non-BOOLean DER object");
  return der_vm_select_int_for_key(v11, v12);
}

uint64_t der_vm_select_int_for_key(uint64_t a1, char *__s, uint64_t *a3)
{
  char v5;
  _BOOL8 v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 *v10;
  void (*v12)(unint64_t, const char *, ...);
  const char *v13;
  int v14;
  char *v15;
  _BYTE v16[33];
  char v17;
  int v18;
  __int16 v19;
  __int128 v20;
  unsigned __int8 *v21;
  _BYTE v22[25];
  char v23;
  int v24;
  __int16 v25;
  __int128 v26;
  size_t v27[3];
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
  uint64_t v42;
  _OWORD v43[16];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (!__s)
    return 0;
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
  v27[0] = 0x4000000000000001;
  v27[1] = (size_t)__s;
  v42 = 0;
  v27[2] = strlen(__s);
  v43[0] = xmmword_1DF0773B0;
  memset(&v43[1], 0, 240);
  v5 = *(_BYTE *)(a1 + 33);
  *(_QWORD *)v16 = *(_QWORD *)a1;
  *(_OWORD *)&v16[8] = *(_OWORD *)(a1 + 8);
  *(_OWORD *)&v16[17] = *(_OWORD *)(a1 + 17);
  v17 = v5;
  v18 = *(_DWORD *)(a1 + 34);
  v19 = *(_WORD *)(a1 + 38);
  v20 = *(_OWORD *)(a1 + 40);
  der_vm_execute_nocopy((unint64_t)v16, v27, (uint64_t)&v21);
  *(_OWORD *)&v16[8] = *(_OWORD *)v22;
  *(_OWORD *)&v16[17] = *(_OWORD *)&v22[9];
  v18 = v24;
  v19 = v25;
  *(_QWORD *)v16 = v21;
  v17 = v23;
  v20 = v26;
  der_vm_execute_nocopy((unint64_t)v16, (size_t *)v43, (uint64_t)&v21);
  v6 = v23 != 0;
  if (!a3 || !v23)
    return v6;
  v7 = (unint64_t)v21;
  *(_OWORD *)v16 = v26;
  v21 = 0;
  *(_QWORD *)v22 = 0;
  if ((ccder_blob_decode_range() & 1) == 0)
  {
    v12 = *(void (**)(unint64_t, const char *, ...))(v7 + 24);
    if (v12)
    {
      v13 = "unknown number encoding";
LABEL_23:
      v12(v7, "[%s]: %s\n", "der_decode_number", v13);
    }
LABEL_24:
    if (!v7 || v7 < v7 + 64)
      goto LABEL_27;
    goto LABEL_26;
  }
  if (*(_QWORD *)v22 - (_QWORD)v21 >= 9uLL)
  {
    v12 = *(void (**)(unint64_t, const char *, ...))(v7 + 24);
    if (v12)
    {
      v13 = "number too large";
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  if ((unint64_t)v21 >= *(_QWORD *)v22)
  {
    v9 = 0;
LABEL_17:
    *a3 = v9;
    return v6;
  }
  v8 = 0;
  v9 = 0;
  while (1)
  {
    if (!v8 && (*v21 & 0x80u) != 0)
      v9 = -1;
    v10 = &v21[v8];
    if ((unint64_t)&v21[v8] >= *(_QWORD *)v22 || v10 < v21)
      break;
    v9 = *v10 | (unint64_t)(v9 << 8);
    if (*(_QWORD *)v22 - (_QWORD)v21 == ++v8)
      goto LABEL_17;
  }
LABEL_26:
  __break(0x5519u);
LABEL_27:
  v14 = (*(uint64_t (**)(unint64_t, const char *, ...))(v7 + 32))(v7, "[%s]: %s\n", "der_vm_integer_from_context", "Attempting to select an integer value from a non-integer DER object");
  return der_vm_string_is_allowed_for_key(v14, v15);
}

BOOL der_vm_string_is_allowed_for_key(__int128 *a1, char *__s, const char *a3)
{
  _BOOL8 result;
  char v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int16 v10;
  _BYTE v11[22];
  _OWORD v12[2];
  __int16 v13;
  _BYTE v14[22];
  size_t v15[3];
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
  uint64_t v30;
  size_t v31[3];
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
  uint64_t v46;
  uint64_t v47;

  result = 0;
  v47 = *MEMORY[0x1E0C80C00];
  if (__s)
  {
    if (a3)
    {
      v29 = 0u;
      v28 = 0u;
      v27 = 0u;
      v26 = 0u;
      v25 = 0u;
      v24 = 0u;
      v23 = 0u;
      v22 = 0u;
      v21 = 0u;
      v20 = 0u;
      v19 = 0u;
      v18 = 0u;
      v17 = 0u;
      v16 = 0u;
      v15[0] = 0x4000000000000001;
      v15[1] = (size_t)__s;
      v15[2] = strlen(__s);
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v30 = 0;
      v31[0] = 0x4000000000000006;
      v31[1] = (size_t)a3;
      v31[2] = strlen(a3);
      v46 = 0;
      v6 = *((_BYTE *)a1 + 33);
      v7 = a1[1];
      v8 = *a1;
      v9 = v7;
      LOBYTE(v10) = *((_BYTE *)a1 + 32);
      HIBYTE(v10) = v6;
      *(_OWORD *)v11 = *(__int128 *)((char *)a1 + 34);
      *(_QWORD *)&v11[14] = *((_QWORD *)a1 + 6);
      der_vm_execute_nocopy((unint64_t)&v8, v15, (uint64_t)v12);
      v8 = v12[0];
      v9 = v12[1];
      v10 = v13;
      *(_OWORD *)v11 = *(_OWORD *)v14;
      *(_QWORD *)&v11[14] = *(_QWORD *)&v14[14];
      der_vm_execute_nocopy((unint64_t)&v8, v31, (uint64_t)v12);
      return HIBYTE(v13) != 0;
    }
  }
  return result;
}

BOOL der_vm_type_for_key(uint64_t a1, char *__s, int *a3)
{
  __int128 v5;
  _BOOL8 v6;
  uint64_t v7;
  int v8;
  _OWORD v10[3];
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  _OWORD v14[2];
  uint64_t v15;
  size_t v16[3];
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
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (!__s)
    return 0;
  v30 = 0u;
  v29 = 0u;
  v28 = 0u;
  v27 = 0u;
  v26 = 0u;
  v25 = 0u;
  v24 = 0u;
  v23 = 0u;
  v22 = 0u;
  v21 = 0u;
  v20 = 0u;
  v19 = 0u;
  v18 = 0u;
  v17 = 0u;
  v16[0] = 0x4000000000000001;
  v16[1] = (size_t)__s;
  v31 = 0;
  v16[2] = strlen(__s);
  v13 = 0u;
  memset(v14, 0, 24);
  v12 = 0u;
  v5 = *(_OWORD *)(a1 + 16);
  v10[0] = *(_OWORD *)a1;
  v10[1] = v5;
  v10[2] = *(_OWORD *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 48);
  der_vm_execute_nocopy((unint64_t)v10, v16, (uint64_t)&v12);
  v6 = BYTE1(v14[0]) != 0;
  if (a3 && BYTE1(v14[0]))
  {
    v7 = *((_QWORD *)&v13 + 1);
    v15 = 0;
    v10[0] = *(_OWORD *)((char *)v14 + 8);
    if (der_decode_next(v12, &v15, 0, 0, (uint64_t *)v10))
    {
      if (v7 == v15)
      {
        v8 = 1;
LABEL_15:
        *a3 = v8;
        return v6;
      }
      if (v15 <= 0x200000000000000FLL)
      {
        v8 = 5;
        switch(v15)
        {
          case 1:
            goto LABEL_15;
          case 2:
            v8 = 3;
            break;
          case 4:
            v8 = 6;
            break;
          case 12:
            v8 = 4;
            break;
          default:
            goto LABEL_14;
        }
        goto LABEL_15;
      }
      if (v15 == 0x6000000000000010 || v15 == 0x2000000000000010)
      {
        v8 = 2;
        goto LABEL_15;
      }
    }
LABEL_14:
    v8 = 0;
    goto LABEL_15;
  }
  return v6;
}

BOOL der_vm_key_is_present(uint64_t a1, char *__s)
{
  __int128 v3;
  _OWORD v5[3];
  uint64_t v6;
  _OWORD v7[2];
  __int128 v8;
  uint64_t v9;
  size_t v10[3];
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
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!__s)
    return 0;
  v24 = 0u;
  v23 = 0u;
  v22 = 0u;
  v21 = 0u;
  v20 = 0u;
  v19 = 0u;
  v18 = 0u;
  v17 = 0u;
  v16 = 0u;
  v15 = 0u;
  v14 = 0u;
  v13 = 0u;
  v12 = 0u;
  v11 = 0u;
  v10[0] = 0x4000000000000001;
  v10[1] = (size_t)__s;
  v25 = 0;
  v10[2] = strlen(__s);
  v9 = 0;
  v8 = 0u;
  memset(v7, 0, sizeof(v7));
  v3 = *(_OWORD *)(a1 + 16);
  v5[0] = *(_OWORD *)a1;
  v5[1] = v3;
  v5[2] = *(_OWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  der_vm_execute_nocopy((unint64_t)v5, v10, (uint64_t)v7);
  return BYTE1(v8) != 0;
}

_QWORD *serializeId(void *a1, _QWORD *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  id v11;
  CFTypeID v12;
  unsigned int v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  id v27;
  unint64_t v28;
  char *v29;
  _QWORD *v30;
  char *v31;
  char *v32;
  __int128 v33;
  char *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char *v46;
  id v47;
  unint64_t v48;
  char *v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  unint64_t v53;
  char *v54;
  char *v55;
  char *v56;
  char *v57;
  __int128 v58;
  __int128 v59;
  char *v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  unint64_t v64;
  char *v65;
  char *v66;
  __int128 v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t i;
  uint64_t v72;
  unint64_t v73;
  char *v74;
  _QWORD *v75;
  char *v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  unint64_t v80;
  char *v81;
  __int128 v82;
  char *v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_retainAutorelease(v3);
    v5 = objc_msgSend(v4, "UTF8String");
    v6 = objc_msgSend(v4, "lengthOfBytesUsingEncoding:", 4);
    v8 = (char *)a2[1];
    v7 = a2[2];
    if ((unint64_t)v8 < v7)
    {
      v9 = 2;
LABEL_4:
      *(_QWORD *)v8 = v9;
      *((_QWORD *)v8 + 1) = v5;
      *((_QWORD *)v8 + 2) = v6;
      v8[24] = 0;
      v10 = v8 + 32;
LABEL_32:
      a2[1] = v10;
      goto LABEL_33;
    }
    v17 = (char *)*a2;
    v18 = (uint64_t)&v8[-*a2] >> 5;
    v19 = v18 + 1;
    if ((unint64_t)(v18 + 1) >> 59)
      std::vector<CESerializedElement>::__throw_length_error[abi:ne180100]();
    v20 = v7 - (_QWORD)v17;
    if (v20 >> 4 > v19)
      v19 = v20 >> 4;
    if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFE0)
      v21 = 0x7FFFFFFFFFFFFFFLL;
    else
      v21 = v19;
    if (v21)
    {
      if (v21 >> 59)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v22 = (char *)operator new(32 * v21);
    }
    else
    {
      v22 = 0;
    }
    v31 = &v22[32 * v18];
    *(_QWORD *)v31 = 2;
    *((_QWORD *)v31 + 1) = v5;
    v32 = &v22[32 * v21];
    *((_QWORD *)v31 + 2) = v6;
    v31[24] = 0;
    v10 = v31 + 32;
    if (v8 != v17)
    {
      do
      {
        v33 = *((_OWORD *)v8 - 1);
        *((_OWORD *)v31 - 2) = *((_OWORD *)v8 - 2);
        *((_OWORD *)v31 - 1) = v33;
        v31 -= 32;
        v8 -= 32;
      }
      while (v8 != v17);
LABEL_29:
      v8 = (char *)*a2;
      goto LABEL_30;
    }
    goto LABEL_30;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v3;
    v12 = CFGetTypeID(v11);
    if (v12 == CFBooleanGetTypeID())
    {
      v13 = objc_msgSend(v11, "BOOLValue");
      v14 = v13;
      v16 = (char *)a2[1];
      v15 = a2[2];
      if ((unint64_t)v16 < v15)
      {
        *(_QWORD *)v16 = 1;
        *((_QWORD *)v16 + 1) = v13;
LABEL_22:
        *((_QWORD *)v16 + 2) = 0;
        v16[24] = 0;
        a2[1] = v16 + 32;
LABEL_33:

LABEL_34:
        v23 = Errors;
        goto LABEL_35;
      }
      v35 = (char *)*a2;
      v36 = (uint64_t)&v16[-*a2] >> 5;
      v37 = v36 + 1;
      if ((unint64_t)(v36 + 1) >> 59)
        std::vector<CESerializedElement>::__throw_length_error[abi:ne180100]();
      v38 = v15 - (_QWORD)v35;
      if (v38 >> 4 > v37)
        v37 = v38 >> 4;
      if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFE0)
        v39 = 0x7FFFFFFFFFFFFFFLL;
      else
        v39 = v37;
      if (v39)
      {
        if (v39 >> 59)
          std::__throw_bad_array_new_length[abi:ne180100]();
        v40 = (char *)operator new(32 * v39);
      }
      else
      {
        v40 = 0;
      }
      v55 = &v40[32 * v36];
      *(_QWORD *)v55 = 1;
      *((_QWORD *)v55 + 1) = v14;
      v56 = &v40[32 * v39];
      *((_QWORD *)v55 + 2) = 0;
      v55[24] = 0;
      v57 = v55 + 32;
      if (v16 != v35)
      {
        do
        {
          v58 = *((_OWORD *)v16 - 1);
          *((_OWORD *)v55 - 2) = *((_OWORD *)v16 - 2);
          *((_OWORD *)v55 - 1) = v58;
          v55 -= 32;
          v16 -= 32;
        }
        while (v16 != v35);
LABEL_74:
        v16 = (char *)*a2;
      }
    }
    else
    {
      v24 = objc_msgSend(v11, "longLongValue");
      v25 = v24;
      v16 = (char *)a2[1];
      v26 = a2[2];
      if ((unint64_t)v16 < v26)
      {
        *(_QWORD *)v16 = 4;
        *((_QWORD *)v16 + 1) = v24;
        goto LABEL_22;
      }
      v41 = (char *)*a2;
      v42 = (uint64_t)&v16[-*a2] >> 5;
      v43 = v42 + 1;
      if ((unint64_t)(v42 + 1) >> 59)
        std::vector<CESerializedElement>::__throw_length_error[abi:ne180100]();
      v44 = v26 - (_QWORD)v41;
      if (v44 >> 4 > v43)
        v43 = v44 >> 4;
      if ((unint64_t)v44 >= 0x7FFFFFFFFFFFFFE0)
        v45 = 0x7FFFFFFFFFFFFFFLL;
      else
        v45 = v43;
      if (v45)
      {
        if (v45 >> 59)
          std::__throw_bad_array_new_length[abi:ne180100]();
        v46 = (char *)operator new(32 * v45);
      }
      else
      {
        v46 = 0;
      }
      v55 = &v46[32 * v42];
      *(_QWORD *)v55 = 4;
      *((_QWORD *)v55 + 1) = v25;
      v56 = &v46[32 * v45];
      *((_QWORD *)v55 + 2) = 0;
      v55[24] = 0;
      v57 = v55 + 32;
      if (v16 != v41)
      {
        do
        {
          v59 = *((_OWORD *)v16 - 1);
          *((_OWORD *)v55 - 2) = *((_OWORD *)v16 - 2);
          *((_OWORD *)v55 - 1) = v59;
          v55 -= 32;
          v16 -= 32;
        }
        while (v16 != v41);
        goto LABEL_74;
      }
    }
    *a2 = v55;
    a2[1] = v57;
    a2[2] = v56;
    if (v16)
      operator delete(v16);
    a2[1] = v57;
    goto LABEL_33;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = v3;
      v29 = (char *)a2[1];
      v28 = a2[2];
      if ((unint64_t)v29 >= v28)
      {
        v49 = (char *)*a2;
        v50 = (uint64_t)&v29[-*a2] >> 5;
        v51 = v50 + 1;
        if ((unint64_t)(v50 + 1) >> 59)
          std::vector<CESerializedElement>::__throw_length_error[abi:ne180100]();
        v52 = v28 - (_QWORD)v49;
        if (v52 >> 4 > v51)
          v51 = v52 >> 4;
        if ((unint64_t)v52 >= 0x7FFFFFFFFFFFFFE0)
          v53 = 0x7FFFFFFFFFFFFFFLL;
        else
          v53 = v51;
        if (v53)
        {
          if (v53 >> 59)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v54 = (char *)operator new(32 * v53);
        }
        else
        {
          v54 = 0;
        }
        v66 = &v54[32 * v50];
        *(_QWORD *)v66 = 5;
        *((_QWORD *)v66 + 1) = 0;
        *((_QWORD *)v66 + 2) = 0;
        *((_QWORD *)v66 + 3) = 0;
        v30 = v66 + 32;
        if (v29 != v49)
        {
          do
          {
            v67 = *((_OWORD *)v29 - 1);
            *((_OWORD *)v66 - 2) = *((_OWORD *)v29 - 2);
            *((_OWORD *)v66 - 1) = v67;
            v66 -= 32;
            v29 -= 32;
          }
          while (v29 != v49);
          v29 = (char *)*a2;
        }
        *a2 = v66;
        a2[1] = v30;
        a2[2] = &v54[32 * v53];
        if (v29)
          operator delete(v29);
      }
      else
      {
        *(_QWORD *)v29 = 5;
        *((_QWORD *)v29 + 1) = 0;
        *((_QWORD *)v29 + 2) = 0;
        *((_QWORD *)v29 + 3) = 0;
        v30 = v29 + 32;
      }
      a2[1] = v30;
      v85 = 0u;
      v86 = 0u;
      v87 = 0u;
      v88 = 0u;
      v68 = v27;
      v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v85, v89, 16);
      if (v69)
      {
        v70 = *(_QWORD *)v86;
        while (2)
        {
          for (i = 0; i != v69; ++i)
          {
            if (*(_QWORD *)v86 != v70)
              objc_enumerationMutation(v68);
            v72 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * i);
            if (!v72 || (_QWORD *)serializeId(v72, a2) != Errors)
            {

              goto LABEL_125;
            }
          }
          v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v85, v89, 16);
          if (v69)
            continue;
          break;
        }
      }

      v74 = (char *)a2[1];
      v73 = a2[2];
      if ((unint64_t)v74 >= v73)
      {
        v76 = (char *)*a2;
        v77 = (uint64_t)&v74[-*a2] >> 5;
        v78 = v77 + 1;
        if ((unint64_t)(v77 + 1) >> 59)
          std::vector<CESerializedElement>::__throw_length_error[abi:ne180100]();
        v79 = v73 - (_QWORD)v76;
        if (v79 >> 4 > v78)
          v78 = v79 >> 4;
        if ((unint64_t)v79 >= 0x7FFFFFFFFFFFFFE0)
          v80 = 0x7FFFFFFFFFFFFFFLL;
        else
          v80 = v78;
        if (v80)
        {
          if (v80 >> 59)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v81 = (char *)operator new(32 * v80);
        }
        else
        {
          v81 = 0;
        }
        v83 = &v81[32 * v77];
        *(_QWORD *)v83 = 6;
        *((_QWORD *)v83 + 1) = 0;
        *((_QWORD *)v83 + 2) = 0;
        *((_QWORD *)v83 + 3) = 0;
        v75 = v83 + 32;
        if (v74 != v76)
        {
          do
          {
            v84 = *((_OWORD *)v74 - 1);
            *((_OWORD *)v83 - 2) = *((_OWORD *)v74 - 2);
            *((_OWORD *)v83 - 1) = v84;
            v83 -= 32;
            v74 -= 32;
          }
          while (v74 != v76);
          v74 = (char *)*a2;
        }
        *a2 = v83;
        a2[1] = v75;
        a2[2] = &v81[32 * v80];
        if (v74)
          operator delete(v74);
      }
      else
      {
        *(_QWORD *)v74 = 6;
        *((_QWORD *)v74 + 1) = 0;
        *((_QWORD *)v74 + 2) = 0;
        *((_QWORD *)v74 + 3) = 0;
        v75 = v74 + 32;
      }
      a2[1] = v75;
LABEL_125:

      goto LABEL_34;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v23 = &unk_1EA97EC30;
      goto LABEL_35;
    }
    v47 = objc_retainAutorelease(v3);
    v5 = objc_msgSend(v47, "bytes");
    v6 = objc_msgSend(v47, "length");
    v8 = (char *)a2[1];
    v48 = a2[2];
    if ((unint64_t)v8 < v48)
    {
      v9 = 9;
      goto LABEL_4;
    }
    v60 = (char *)*a2;
    v61 = (uint64_t)&v8[-*a2] >> 5;
    v62 = v61 + 1;
    if ((unint64_t)(v61 + 1) >> 59)
      std::vector<CESerializedElement>::__throw_length_error[abi:ne180100]();
    v63 = v48 - (_QWORD)v60;
    if (v63 >> 4 > v62)
      v62 = v63 >> 4;
    if ((unint64_t)v63 >= 0x7FFFFFFFFFFFFFE0)
      v64 = 0x7FFFFFFFFFFFFFFLL;
    else
      v64 = v62;
    if (v64)
    {
      if (v64 >> 59)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v65 = (char *)operator new(32 * v64);
    }
    else
    {
      v65 = 0;
    }
    v31 = &v65[32 * v61];
    *(_QWORD *)v31 = 9;
    *((_QWORD *)v31 + 1) = v5;
    v32 = &v65[32 * v64];
    *((_QWORD *)v31 + 2) = v6;
    v31[24] = 0;
    v10 = v31 + 32;
    if (v8 != v60)
    {
      do
      {
        v82 = *((_OWORD *)v8 - 1);
        *((_OWORD *)v31 - 2) = *((_OWORD *)v8 - 2);
        *((_OWORD *)v31 - 1) = v82;
        v31 -= 32;
        v8 -= 32;
      }
      while (v8 != v60);
      goto LABEL_29;
    }
LABEL_30:
    *a2 = v31;
    a2[1] = v10;
    a2[2] = v32;
    if (v8)
      operator delete(v8);
    goto LABEL_32;
  }
  v23 = (_QWORD *)serializeDict(v3, a2);
LABEL_35:

  return v23;
}

void sub_1DF076670(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void std::vector<CESerializedElement>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]();
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E0DE4E98], MEMORY[0x1E0DE4390]);
}

_QWORD *serializeDict(void *a1, char **a2)
{
  unint64_t v3;
  char *v4;
  char *v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  char *v12;
  __int128 v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  char *v29;
  char *v30;
  __int128 v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char *v37;
  char *v38;
  char *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char *v44;
  char *v45;
  char *v46;
  __int128 v47;
  char *v48;
  void *v49;
  void *v50;
  _QWORD *v51;
  unint64_t v52;
  char *v53;
  char *v54;
  char *v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;
  char *v60;
  char *v61;
  char *v62;
  __int128 v63;
  char *v64;
  unint64_t v65;
  char *v66;
  char *v67;
  char *v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  unint64_t v72;
  char *v73;
  char *v74;
  __int128 v75;
  id obj;
  uint64_t v78;
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v79 = a1;
  v4 = a2[1];
  v3 = (unint64_t)a2[2];
  if ((unint64_t)v4 >= v3)
  {
    v6 = *a2;
    v7 = (v4 - *a2) >> 5;
    v8 = v7 + 1;
    if ((unint64_t)(v7 + 1) >> 59)
      std::vector<CESerializedElement>::__throw_length_error[abi:ne180100]();
    v9 = v3 - (_QWORD)v6;
    if (v9 >> 4 > v8)
      v8 = v9 >> 4;
    if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFE0)
      v10 = 0x7FFFFFFFFFFFFFFLL;
    else
      v10 = v8;
    if (v10)
    {
      if (v10 >> 59)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v11 = (char *)operator new(32 * v10);
    }
    else
    {
      v11 = 0;
    }
    v12 = &v11[32 * v7];
    *(_QWORD *)v12 = 7;
    *((_QWORD *)v12 + 1) = 0;
    *((_QWORD *)v12 + 2) = 0;
    *((_QWORD *)v12 + 3) = 0;
    v5 = v12 + 32;
    if (v4 != v6)
    {
      do
      {
        v13 = *((_OWORD *)v4 - 1);
        *((_OWORD *)v12 - 2) = *((_OWORD *)v4 - 2);
        *((_OWORD *)v12 - 1) = v13;
        v12 -= 32;
        v4 -= 32;
      }
      while (v4 != v6);
      v4 = *a2;
    }
    *a2 = v12;
    a2[1] = v5;
    a2[2] = &v11[32 * v10];
    if (v4)
      operator delete(v4);
  }
  else
  {
    *(_QWORD *)v4 = 7;
    *((_QWORD *)v4 + 1) = 0;
    *((_QWORD *)v4 + 2) = 0;
    *((_QWORD *)v4 + 3) = 0;
    v5 = v4 + 32;
  }
  a2[1] = v5;
  v14 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v79, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "arrayWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "sortUsingSelector:", sel_compare_, v16);
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  obj = v16;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v84, 16);
  if (v17)
  {
    v78 = *(_QWORD *)v81;
LABEL_20:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v81 != v78)
        objc_enumerationMutation(obj);
      v19 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * v18);
      v21 = a2[1];
      v20 = (unint64_t)a2[2];
      if ((unint64_t)v21 >= v20)
      {
        v23 = *a2;
        v24 = (v21 - *a2) >> 5;
        v25 = v24 + 1;
        if ((unint64_t)(v24 + 1) >> 59)
          std::vector<CESerializedElement>::__throw_length_error[abi:ne180100]();
        v26 = v20 - (_QWORD)v23;
        if (v26 >> 4 > v25)
          v25 = v26 >> 4;
        v27 = (unint64_t)v26 >= 0x7FFFFFFFFFFFFFE0 ? 0x7FFFFFFFFFFFFFFLL : v25;
        if (v27)
        {
          if (v27 >> 59)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v28 = (char *)operator new(32 * v27);
        }
        else
        {
          v28 = 0;
        }
        v29 = &v28[32 * v24];
        *(_QWORD *)v29 = 5;
        *((_QWORD *)v29 + 1) = 0;
        *((_QWORD *)v29 + 2) = 0;
        *((_QWORD *)v29 + 3) = 0;
        v30 = v29;
        if (v21 != v23)
        {
          do
          {
            v31 = *((_OWORD *)v21 - 1);
            *((_OWORD *)v30 - 2) = *((_OWORD *)v21 - 2);
            *((_OWORD *)v30 - 1) = v31;
            v30 -= 32;
            v21 -= 32;
          }
          while (v21 != v23);
          v21 = *a2;
        }
        v22 = v29 + 32;
        *a2 = v30;
        a2[1] = v29 + 32;
        a2[2] = &v28[32 * v27];
        if (v21)
          operator delete(v21);
      }
      else
      {
        *(_QWORD *)v21 = 5;
        *((_QWORD *)v21 + 1) = 0;
        v22 = v21 + 32;
        *((_QWORD *)v21 + 2) = 0;
        *((_QWORD *)v21 + 3) = 0;
      }
      a2[1] = v22;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
      v32 = objc_retainAutorelease(v19);
      v33 = objc_msgSend(v32, "UTF8String");
      v34 = objc_msgSend(v32, "lengthOfBytesUsingEncoding:", 4);
      v35 = v34;
      v37 = a2[1];
      v36 = (unint64_t)a2[2];
      if ((unint64_t)v37 >= v36)
      {
        v39 = *a2;
        v40 = (v37 - *a2) >> 5;
        v41 = v40 + 1;
        if ((unint64_t)(v40 + 1) >> 59)
          std::vector<CESerializedElement>::__throw_length_error[abi:ne180100]();
        v42 = v36 - (_QWORD)v39;
        if (v42 >> 4 > v41)
          v41 = v42 >> 4;
        if ((unint64_t)v42 >= 0x7FFFFFFFFFFFFFE0)
          v43 = 0x7FFFFFFFFFFFFFFLL;
        else
          v43 = v41;
        if (v43)
        {
          if (v43 >> 59)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v44 = (char *)operator new(32 * v43);
        }
        else
        {
          v44 = 0;
        }
        v45 = &v44[32 * v40];
        *(_QWORD *)v45 = 3;
        *((_QWORD *)v45 + 1) = v33;
        *((_QWORD *)v45 + 2) = v35;
        v45[24] = 0;
        v46 = v45;
        if (v37 != v39)
        {
          do
          {
            v47 = *((_OWORD *)v37 - 1);
            *((_OWORD *)v46 - 2) = *((_OWORD *)v37 - 2);
            *((_OWORD *)v46 - 1) = v47;
            v46 -= 32;
            v37 -= 32;
          }
          while (v37 != v39);
          v37 = *a2;
        }
        v48 = &v44[32 * v43];
        v38 = v45 + 32;
        *a2 = v46;
        a2[1] = v45 + 32;
        a2[2] = v48;
        if (v37)
          operator delete(v37);
      }
      else
      {
        *(_QWORD *)v37 = 3;
        *((_QWORD *)v37 + 1) = v33;
        *((_QWORD *)v37 + 2) = v34;
        v38 = v37 + 32;
        v37[24] = 0;
      }
      a2[1] = v38;
      objc_msgSend(v79, "objectForKeyedSubscript:", v32);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v49;
      if (!v49)
      {
        v51 = &unk_1EA97EC30;
LABEL_83:

LABEL_84:
        goto LABEL_101;
      }
      v51 = serializeId(v49, a2);
      if (v51 != Errors)
        goto LABEL_83;
      v53 = a2[1];
      v52 = (unint64_t)a2[2];
      if ((unint64_t)v53 >= v52)
      {
        v55 = *a2;
        v56 = (v53 - *a2) >> 5;
        v57 = v56 + 1;
        if ((unint64_t)(v56 + 1) >> 59)
          std::vector<CESerializedElement>::__throw_length_error[abi:ne180100]();
        v58 = v52 - (_QWORD)v55;
        if (v58 >> 4 > v57)
          v57 = v58 >> 4;
        if ((unint64_t)v58 >= 0x7FFFFFFFFFFFFFE0)
          v59 = 0x7FFFFFFFFFFFFFFLL;
        else
          v59 = v57;
        if (v59)
        {
          if (v59 >> 59)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v60 = (char *)operator new(32 * v59);
        }
        else
        {
          v60 = 0;
        }
        v61 = &v60[32 * v56];
        *(_QWORD *)v61 = 6;
        *((_QWORD *)v61 + 1) = 0;
        *((_QWORD *)v61 + 2) = 0;
        *((_QWORD *)v61 + 3) = 0;
        v62 = v61;
        if (v53 != v55)
        {
          do
          {
            v63 = *((_OWORD *)v53 - 1);
            *((_OWORD *)v62 - 2) = *((_OWORD *)v53 - 2);
            *((_OWORD *)v62 - 1) = v63;
            v62 -= 32;
            v53 -= 32;
          }
          while (v53 != v55);
          v53 = *a2;
        }
        v64 = &v60[32 * v59];
        v54 = v61 + 32;
        *a2 = v62;
        a2[1] = v61 + 32;
        a2[2] = v64;
        if (v53)
          operator delete(v53);
      }
      else
      {
        *(_QWORD *)v53 = 6;
        *((_QWORD *)v53 + 1) = 0;
        v54 = v53 + 32;
        *((_QWORD *)v53 + 2) = 0;
        *((_QWORD *)v53 + 3) = 0;
      }
      a2[1] = v54;

      if (++v18 == v17)
      {
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v84, 16);
        if (v17)
          goto LABEL_20;
        goto LABEL_79;
      }
    }
    v51 = &unk_1EA97EC30;
    goto LABEL_84;
  }
LABEL_79:

  v66 = a2[1];
  v65 = (unint64_t)a2[2];
  if ((unint64_t)v66 >= v65)
  {
    v68 = *a2;
    v69 = (v66 - *a2) >> 5;
    v70 = v69 + 1;
    if ((unint64_t)(v69 + 1) >> 59)
      std::vector<CESerializedElement>::__throw_length_error[abi:ne180100]();
    v71 = v65 - (_QWORD)v68;
    if (v71 >> 4 > v70)
      v70 = v71 >> 4;
    if ((unint64_t)v71 >= 0x7FFFFFFFFFFFFFE0)
      v72 = 0x7FFFFFFFFFFFFFFLL;
    else
      v72 = v70;
    if (v72)
    {
      if (v72 >> 59)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v73 = (char *)operator new(32 * v72);
    }
    else
    {
      v73 = 0;
    }
    v74 = &v73[32 * v69];
    *(_QWORD *)v74 = 8;
    *((_QWORD *)v74 + 1) = 0;
    *((_QWORD *)v74 + 2) = 0;
    *((_QWORD *)v74 + 3) = 0;
    v67 = v74 + 32;
    if (v66 != v68)
    {
      do
      {
        v75 = *((_OWORD *)v66 - 1);
        *((_OWORD *)v74 - 2) = *((_OWORD *)v66 - 2);
        *((_OWORD *)v74 - 1) = v75;
        v74 -= 32;
        v66 -= 32;
      }
      while (v66 != v68);
      v66 = *a2;
    }
    *a2 = v74;
    a2[1] = v67;
    a2[2] = &v73[32 * v72];
    if (v66)
      operator delete(v66);
  }
  else
  {
    *(_QWORD *)v66 = 8;
    *((_QWORD *)v66 + 1) = 0;
    *((_QWORD *)v66 + 2) = 0;
    *((_QWORD *)v66 + 3) = 0;
    v67 = v66 + 32;
  }
  a2[1] = v67;
  v51 = Errors;
LABEL_101:

  return v51;
}

void sub_1DF076D60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, void *a12)
{

  _Unwind_Resume(a1);
}

void std::__throw_length_error[abi:ne180100]()
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception);
  __cxa_throw(exception, (struct type_info *)off_1EA97E908, MEMORY[0x1E0DE42D0]);
}

void sub_1DF076E20(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, "vector");
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5020] + 16);
  return result;
}

_QWORD *CESerializeCFDictionaryWithOptions(uint64_t a1, _BYTE *a2, void *a3, _QWORD *a4)
{
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  unint64_t v12;
  id v13;
  uint64_t v15;
  void *__p;
  uint64_t v17;
  uint64_t v18;

  __p = 0;
  v17 = 0;
  v18 = 0;
  v7 = serializeDict(a3, (char **)&__p);
  v8 = __p;
  if (v7 == Errors)
  {
    v15 = 0;
    v9 = (v17 - (uint64_t)__p) >> 5;
    v7 = CESizeSerialization(__p, v9, &v15);
    if (v7 == Errors)
    {
      v10 = v15;
      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v15);
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v12 = objc_msgSend(v11, "bytes");
      v13 = objc_retainAutorelease(v11);
      v7 = (_QWORD *)CESerializeWithOptions(a1, a2, (unint64_t)v8, v9, v12, objc_msgSend(v13, "bytes") + v10);
      if (v7 == Errors)
      {
        *a4 = v13;
        v7 = Errors;
      }

    }
  }
  if (v8)
    operator delete(v8);
  return v7;
}

void sub_1DF076F8C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  void *v10;

  if (v10)
    operator delete(v10);
  _Unwind_Resume(exception_object);
}

_QWORD *CESerializeCFDictionary(uint64_t a1, void *a2, _QWORD *a3)
{
  char v4;

  v4 = 0;
  return CESerializeCFDictionaryWithOptions(a1, &v4, a2, a3);
}

void ce_log(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  vsyslog(7, a2, &a9);
}

void ce_abort(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  vsyslog(2, a2, &a9);
  abort();
}

_QWORD *CEManagedContextFromCFDataWithOptions(_QWORD *a1, _BYTE *a2, CFDataRef theData, _QWORD *a4)
{
  const UInt8 *BytePtr;
  CFIndex Length;
  _QWORD *result;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;

  v13 = 0uLL;
  v14 = 0;
  BytePtr = CFDataGetBytePtr(theData);
  Length = CFDataGetLength(theData);
  result = CEValidateWithOptions(a1, a2, &v13, (unint64_t)BytePtr, (unint64_t)&BytePtr[Length]);
  if (result == Errors)
  {
    v11 = v13;
    v12 = v14;
    return CEAcquireManagedContext((uint64_t)a1, &v11, a4);
  }
  return result;
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

void operator delete(void *__p)
{
  off_1EA97E920(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1EA97E928(__sz);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

uint64_t cc_clear()
{
  return MEMORY[0x1E0C81868]();
}

uint64_t ccder_blob_decode_len()
{
  return MEMORY[0x1E0C819F0]();
}

uint64_t ccder_blob_decode_range()
{
  return MEMORY[0x1E0C819F8]();
}

uint64_t ccder_blob_decode_sequence_tl()
{
  return MEMORY[0x1E0C81A00]();
}

uint64_t ccder_blob_decode_tag()
{
  return MEMORY[0x1E0C81A08]();
}

uint64_t ccder_blob_decode_tl()
{
  return MEMORY[0x1E0C81A10]();
}

uint64_t ccder_blob_encode_body_tl()
{
  return MEMORY[0x1E0C81A28]();
}

uint64_t ccder_blob_encode_tl()
{
  return MEMORY[0x1E0C81A40]();
}

uint64_t ccder_blob_reserve_tl()
{
  return MEMORY[0x1E0C81A48]();
}

uint64_t ccder_sizeof()
{
  return MEMORY[0x1E0C81B18]();
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

void vsyslog(int a1, const char *a2, __darwin_va_list a3)
{
  MEMORY[0x1E0C85BB8](*(_QWORD *)&a1, a2, a3);
}

