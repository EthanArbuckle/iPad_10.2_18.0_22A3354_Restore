@implementation ZN3TLE21opArrayOpDeserializerERNS

_QWORD *___ZN3TLE21opArrayOpDeserializerERNS_8ExecutorER14der_vm_contextRKNS_14FactDefinitionE_block_invoke(uint64_t a1, const der_vm_context *a2)
{
  const char *v3;
  uint64_t v4;
  _QWORD *result;
  uint64_t v6;
  uint64_t v7;
  unint64_t *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  BOOL v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  BOOL v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD **v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _BOOL4 v33;
  uint64_t v34;
  _QWORD *exception;
  _QWORD *v36;
  __int128 v37;
  __int128 v38;

  v37 = 0u;
  v38 = 0u;
  TLE::opTupleDeserializer(*(_QWORD *)(a1 + 48), a2 + 1, *(_DWORD **)(a1 + 56), (uint64_t)&v37);
  if ((_DWORD)v37)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    *(_OWORD *)(v4 + 40) = v37;
    result = (_QWORD *)*((_QWORD *)&v38 + 1);
    *(_QWORD *)(v4 + 56) = v38;
    if (result)
    {
      v6 = result[1];
      if (v6 <= 0)
      {
        exception = __cxa_allocate_exception(8uLL);
        *exception = "Over-release of an object";
        __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
      }
      v7 = v6 - 1;
      result[1] = v7;
      if (!v7)
        (*(void (**)(_QWORD *))(*result + 8))(result);
      return 0;
    }
    return result;
  }
  v8 = *(unint64_t **)(a1 + 64);
  v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v10 = *v8;
  if (*v8)
  {
    v11 = v10 + 8 * *((unsigned int *)v8 + 2);
    v12 = v11 >= v10;
    v13 = v11 - v10;
    if (!v12 || HIDWORD(v13))
      os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range", v3);
  }
  else
  {
    LODWORD(v13) = 0;
  }
  if (v9 >= 0)
    v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  else
    v14 = -v9;
  v15 = ((unint64_t)v9 >> 63) + 0x7FFFFFFFFFFFFFFFLL;
  if (v9 >= 0)
    v16 = 8 * v14;
  else
    v16 = -8 * v14;
  if (v14 >> 61)
    v17 = 1;
  else
    v17 = 8 * v14 > v15;
  if (v17)
  {
    v18 = "bounded_ptr<T>::operator+=(n): Calculating the number of bytes to add to the offset (n * sizeof(T)) would trigger an overflow";
    goto LABEL_48;
  }
  if (v16 != (int)v16)
  {
    v18 = "bounded_ptr<T>::operator+=(n): Adding the specified number of bytes to the offset representing the current pos"
          "ition would overflow.";
    goto LABEL_48;
  }
  v18 = "bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outside of the bounds set originally";
  if ((v16 & 0x80000000) != 0
    || (int)v16 + 8 > v13
    || ((v19 = (int)v16, v20 = (uint64_t)(int)v16 >> 63, v21 = (_QWORD **)(v10 + v19), !__CFADD__(v10, v19))
      ? (v22 = v20)
      : (v22 = v20 + 1),
        (v23 = v22 << 63 >> 63,
         v18 = "This bounded_ptr is pointing to memory outside of what can be represented by a native pointer.",
         v23 ^ v22)
     || v23 < 0))
  {
LABEL_48:
    os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)v18, v3);
  }
  v24 = (_QWORD *)*((_QWORD *)&v38 + 1);
  v25 = *v21;
  if (*v21)
  {
    v26 = v25[1];
    if (v26 <= 0)
    {
      v36 = __cxa_allocate_exception(8uLL);
      *v36 = "Over-release of an object";
      __cxa_throw(v36, MEMORY[0x24BEDB718], 0);
    }
    v27 = v26 - 1;
    v25[1] = v27;
    if (!v27)
      (*(void (**)(_QWORD *))(*v25 + 8))(v25);
  }
  *v21 = v24;
  v28 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v29 = *(_QWORD *)(v28 + 24);
  v30 = v29 + 1;
  v31 = v29 == -1;
  v33 = v31 << 63 >> 63 != v31 || v31 << 63 >> 63 == -1;
  if (v33)
  {
    v34 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    *(_DWORD *)(v34 + 40) = 10;
    *(_QWORD *)(v34 + 48) = "Array contains too many elements";
    *(_QWORD *)(v34 + 56) = 32;
  }
  else
  {
    *(_QWORD *)(v28 + 24) = v30;
  }
  return (_QWORD *)!v33;
}

@end
