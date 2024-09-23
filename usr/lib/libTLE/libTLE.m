void TLE::andDeserializer(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X2>, uint64_t a4@<X8>)
{
  __int128 v5;
  const char *v6;
  _QWORD *v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD **v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *exception;
  der_vm_context v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  if (*a3)
  {
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
    *(_DWORD *)a4 = 6;
    *(_QWORD *)(a4 + 8) = "$and operator disallowed for active fact";
    *(_QWORD *)(a4 + 16) = 40;
    return;
  }
  v22 = 0;
  v20 = 0u;
  v21 = 0u;
  v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&v19.runtime = *(_OWORD *)a2;
  *(_OWORD *)&v19.lookup.index_count = v5;
  *(_OWORD *)&v19.sorted = *(_OWORD *)(a2 + 32);
  v19.var0.ccstate.der_end = *(char **)(a2 + 48);
  TLE::Executor::getDependentOpsFromDictionary(a1, &v19, (uint64_t)&v20);
  if ((_DWORD)v20)
  {
    *(_OWORD *)a4 = v20;
    v7 = (_QWORD *)*((_QWORD *)&v21 + 1);
    *(_QWORD *)(a4 + 16) = v21;
    *(_QWORD *)(a4 + 24) = 0;
    if (!v7)
      return;
  }
  else
  {
    if ((_DWORD)v22 != 1)
    {
      v16 = operator new();
      *(_QWORD *)(v16 + 16) = 0;
      *(_QWORD *)(v16 + 24) = 0;
      *(_QWORD *)v16 = &off_24E06E9E0;
      *(_QWORD *)(v16 + 8) = 1;
      *(_QWORD *)(v16 + 32) = *((_QWORD *)&v21 + 1);
      *(_DWORD *)(v16 + 40) = v22;
      *(_QWORD *)a4 = 0;
      *(_QWORD *)(a4 + 8) = 0;
      *(_QWORD *)(a4 + 16) = 0;
      *(_QWORD *)(a4 + 24) = v16;
      return;
    }
    v7 = (_QWORD *)*((_QWORD *)&v21 + 1);
    if (!*((_QWORD *)&v21 + 1))
      goto LABEL_26;
    v8 = 8 * v22;
    if (*((_QWORD *)&v21 + 1) + v8 < *((_QWORD *)&v21 + 1) || HIDWORD(v8))
      os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range", v6);
    if ((v8 & 0xFFFFFFF8) == 0)
LABEL_26:
      os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outside of the bounds set originally", v6);
    *(_QWORD *)a4 = 0;
    *(_QWORD *)(a4 + 8) = 0;
    v9 = (_QWORD *)*v7;
    *(_QWORD *)(a4 + 16) = 0;
    *(_QWORD *)(a4 + 24) = v9;
    if (v9)
    {
      v10 = v9[1];
      if (v10 < 1)
      {
        exception = __cxa_allocate_exception(8uLL);
        *exception = "Attempted resurection of an object";
        __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
      }
      v9[1] = v10 + 1;
    }
  }
  if ((_DWORD)v22)
  {
    v11 = 8 * v22;
    v12 = (_QWORD **)v7;
    do
    {
      v13 = *v12;
      if (*v12)
      {
        v14 = v13[1];
        if (v14 <= 0)
        {
          v17 = __cxa_allocate_exception(8uLL);
          *v17 = "Over-release of an object";
          __cxa_throw(v17, MEMORY[0x24BEDB718], 0);
        }
        v15 = v14 - 1;
        v13[1] = v15;
        if (!v15)
          (*(void (**)(_QWORD *))(*v13 + 8))(v13);
      }
      *v12++ = 0;
      v11 -= 8;
    }
    while (v11);
  }
  free(v7);
}

void sub_21C68C00C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  TLE::Tuple<TLE::Error,libkern::safe_allocation<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>,os_detail::IOKit_typed_allocator<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>,os_detail::panic_trapping_policy>>::~Tuple((uint64_t)va);
  _Unwind_Resume(a1);
}

void TLE::orDeserializer(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X2>, uint64_t a4@<X8>)
{
  __int128 v5;
  const char *v6;
  _QWORD *v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD **v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *exception;
  der_vm_context v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  if (*a3)
  {
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
    *(_DWORD *)a4 = 6;
    *(_QWORD *)(a4 + 8) = "$or operator disallowed for active fact";
    *(_QWORD *)(a4 + 16) = 39;
    return;
  }
  v22 = 0;
  v20 = 0u;
  v21 = 0u;
  v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&v19.runtime = *(_OWORD *)a2;
  *(_OWORD *)&v19.lookup.index_count = v5;
  *(_OWORD *)&v19.sorted = *(_OWORD *)(a2 + 32);
  v19.var0.ccstate.der_end = *(char **)(a2 + 48);
  TLE::Executor::getDependentOpsFromDictionary(a1, &v19, (uint64_t)&v20);
  if ((_DWORD)v20)
  {
    *(_OWORD *)a4 = v20;
    v7 = (_QWORD *)*((_QWORD *)&v21 + 1);
    *(_QWORD *)(a4 + 16) = v21;
    *(_QWORD *)(a4 + 24) = 0;
    if (!v7)
      return;
  }
  else
  {
    if ((_DWORD)v22 != 1)
    {
      v16 = operator new();
      *(_QWORD *)(v16 + 16) = 0;
      *(_QWORD *)(v16 + 24) = 0;
      *(_QWORD *)v16 = &off_24E06E9B0;
      *(_QWORD *)(v16 + 8) = 1;
      *(_QWORD *)(v16 + 32) = *((_QWORD *)&v21 + 1);
      *(_DWORD *)(v16 + 40) = v22;
      *(_QWORD *)a4 = 0;
      *(_QWORD *)(a4 + 8) = 0;
      *(_QWORD *)(a4 + 16) = 0;
      *(_QWORD *)(a4 + 24) = v16;
      return;
    }
    v7 = (_QWORD *)*((_QWORD *)&v21 + 1);
    if (!*((_QWORD *)&v21 + 1))
      goto LABEL_26;
    v8 = 8 * v22;
    if (*((_QWORD *)&v21 + 1) + v8 < *((_QWORD *)&v21 + 1) || HIDWORD(v8))
      os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range", v6);
    if ((v8 & 0xFFFFFFF8) == 0)
LABEL_26:
      os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outside of the bounds set originally", v6);
    *(_QWORD *)a4 = 0;
    *(_QWORD *)(a4 + 8) = 0;
    v9 = (_QWORD *)*v7;
    *(_QWORD *)(a4 + 16) = 0;
    *(_QWORD *)(a4 + 24) = v9;
    if (v9)
    {
      v10 = v9[1];
      if (v10 < 1)
      {
        exception = __cxa_allocate_exception(8uLL);
        *exception = "Attempted resurection of an object";
        __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
      }
      v9[1] = v10 + 1;
    }
  }
  if ((_DWORD)v22)
  {
    v11 = 8 * v22;
    v12 = (_QWORD **)v7;
    do
    {
      v13 = *v12;
      if (*v12)
      {
        v14 = v13[1];
        if (v14 <= 0)
        {
          v17 = __cxa_allocate_exception(8uLL);
          *v17 = "Over-release of an object";
          __cxa_throw(v17, MEMORY[0x24BEDB718], 0);
        }
        v15 = v14 - 1;
        v13[1] = v15;
        if (!v15)
          (*(void (**)(_QWORD *))(*v13 + 8))(v13);
      }
      *v12++ = 0;
      v11 -= 8;
    }
    while (v11);
  }
  free(v7);
}

void sub_21C68C248(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  TLE::Tuple<TLE::Error,libkern::safe_allocation<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>,os_detail::IOKit_typed_allocator<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>,os_detail::panic_trapping_policy>>::~Tuple((uint64_t)va);
  _Unwind_Resume(a1);
}

void TLE::inDeserializer(__int128 *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  const char *v10;
  uint64_t v11;

  if (*(_DWORD *)a2 > 6u || ((1 << *(_DWORD *)a2) & 0x58) == 0)
  {
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_DWORD *)a3 = 3;
    v10 = "Got an unexpected type (not an integer, string or data) when trying to generate an In operation.";
    v11 = 96;
  }
  else
  {
    if (der_vm_CEType_from_context() == 2)
    {
      v7 = operator new();
      v8 = *a1;
      v9 = a1[2];
      *(_OWORD *)(v7 + 48) = a1[1];
      *(_OWORD *)(v7 + 64) = v9;
      *(_QWORD *)(v7 + 80) = *((_QWORD *)a1 + 6);
      *(_QWORD *)v7 = &off_24E06E980;
      *(_QWORD *)(v7 + 8) = 1;
      *(_OWORD *)(v7 + 16) = *(_OWORD *)(a2 + 8);
      *(_OWORD *)(v7 + 32) = v8;
      *(_QWORD *)a3 = 0;
      *(_QWORD *)(a3 + 8) = 0;
      *(_QWORD *)(a3 + 16) = 0;
      *(_QWORD *)(a3 + 24) = v7;
      return;
    }
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_DWORD *)a3 = 3;
    v10 = "Got an unexpected type (not a sequence) when trying to read the array of matches.";
    v11 = 81;
  }
  *(_QWORD *)(a3 + 8) = v10;
  *(_QWORD *)(a3 + 16) = v11;
}

double _ZN3TLE17intOpDeserializerINS_11BinaryIntOpIxXtlNS_3__0EEEEEEENS_5TupleINS_5ErrorEN7libkern20intrusive_shared_ptrINS_9OperationENS_14RefCountPolicyEEEEERNS_8ExecutorER14der_vm_contextRKNS_14FactDefinitionE@<D0>(uint64_t a1@<X2>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;

  if (*(_DWORD *)a1 == 3 && der_vm_CEType_from_context() == 3)
  {
    v4 = der_vm_integer_from_context();
    v5 = operator new();
    *(_QWORD *)v5 = &off_24E06E5C8;
    *(_QWORD *)(v5 + 8) = 1;
    *(_QWORD *)(v5 + 32) = v4;
    v6 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(v5 + 16) = v6;
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
    a2[3] = v5;
  }
  else
  {
    *(_QWORD *)&v6 = 0;
    *(_OWORD *)a2 = 0u;
    *((_OWORD *)a2 + 1) = 0u;
    *(_DWORD *)a2 = 3;
    a2[1] = "Got an unexpected type (not an integer) when trying to generate an integer operation.";
    a2[2] = 85;
  }
  return *(double *)&v6;
}

double _ZN3TLE17intOpDeserializerINS_11BinaryIntOpIxXtlNS_3__1EEEEEEENS_5TupleINS_5ErrorEN7libkern20intrusive_shared_ptrINS_9OperationENS_14RefCountPolicyEEEEERNS_8ExecutorER14der_vm_contextRKNS_14FactDefinitionE@<D0>(uint64_t a1@<X2>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;

  if (*(_DWORD *)a1 == 3 && der_vm_CEType_from_context() == 3)
  {
    v4 = der_vm_integer_from_context();
    v5 = operator new();
    *(_QWORD *)v5 = &off_24E06E950;
    *(_QWORD *)(v5 + 8) = 1;
    *(_QWORD *)(v5 + 32) = v4;
    v6 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(v5 + 16) = v6;
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
    a2[3] = v5;
  }
  else
  {
    *(_QWORD *)&v6 = 0;
    *(_OWORD *)a2 = 0u;
    *((_OWORD *)a2 + 1) = 0u;
    *(_DWORD *)a2 = 3;
    a2[1] = "Got an unexpected type (not an integer) when trying to generate an integer operation.";
    a2[2] = 85;
  }
  return *(double *)&v6;
}

double _ZN3TLE17intOpDeserializerINS_11BinaryIntOpIxXtlNS_3__2EEEEEEENS_5TupleINS_5ErrorEN7libkern20intrusive_shared_ptrINS_9OperationENS_14RefCountPolicyEEEEERNS_8ExecutorER14der_vm_contextRKNS_14FactDefinitionE@<D0>(uint64_t a1@<X2>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;

  if (*(_DWORD *)a1 == 3 && der_vm_CEType_from_context() == 3)
  {
    v4 = der_vm_integer_from_context();
    v5 = operator new();
    *(_QWORD *)v5 = &off_24E06E5F8;
    *(_QWORD *)(v5 + 8) = 1;
    *(_QWORD *)(v5 + 32) = v4;
    v6 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(v5 + 16) = v6;
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
    a2[3] = v5;
  }
  else
  {
    *(_QWORD *)&v6 = 0;
    *(_OWORD *)a2 = 0u;
    *((_OWORD *)a2 + 1) = 0u;
    *(_DWORD *)a2 = 3;
    a2[1] = "Got an unexpected type (not an integer) when trying to generate an integer operation.";
    a2[2] = 85;
  }
  return *(double *)&v6;
}

double _ZN3TLE17intOpDeserializerINS_11BinaryIntOpIxXtlNS_3__3EEEEEEENS_5TupleINS_5ErrorEN7libkern20intrusive_shared_ptrINS_9OperationENS_14RefCountPolicyEEEEERNS_8ExecutorER14der_vm_contextRKNS_14FactDefinitionE@<D0>(uint64_t a1@<X2>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;

  if (*(_DWORD *)a1 == 3 && der_vm_CEType_from_context() == 3)
  {
    v4 = der_vm_integer_from_context();
    v5 = operator new();
    *(_QWORD *)v5 = &off_24E06E628;
    *(_QWORD *)(v5 + 8) = 1;
    *(_QWORD *)(v5 + 32) = v4;
    v6 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(v5 + 16) = v6;
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
    a2[3] = v5;
  }
  else
  {
    *(_QWORD *)&v6 = 0;
    *(_OWORD *)a2 = 0u;
    *((_OWORD *)a2 + 1) = 0u;
    *(_DWORD *)a2 = 3;
    a2[1] = "Got an unexpected type (not an integer) when trying to generate an integer operation.";
    a2[2] = 85;
  }
  return *(double *)&v6;
}

double _ZN3TLE17intOpDeserializerINS_11BinaryIntOpIxXtlNS_3__4EEEEEEENS_5TupleINS_5ErrorEN7libkern20intrusive_shared_ptrINS_9OperationENS_14RefCountPolicyEEEEERNS_8ExecutorER14der_vm_contextRKNS_14FactDefinitionE@<D0>(uint64_t a1@<X2>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;

  if (*(_DWORD *)a1 == 3 && der_vm_CEType_from_context() == 3)
  {
    v4 = der_vm_integer_from_context();
    v5 = operator new();
    *(_QWORD *)v5 = &off_24E06E658;
    *(_QWORD *)(v5 + 8) = 1;
    *(_QWORD *)(v5 + 32) = v4;
    v6 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(v5 + 16) = v6;
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
    a2[3] = v5;
  }
  else
  {
    *(_QWORD *)&v6 = 0;
    *(_OWORD *)a2 = 0u;
    *((_OWORD *)a2 + 1) = 0u;
    *(_DWORD *)a2 = 3;
    a2[1] = "Got an unexpected type (not an integer) when trying to generate an integer operation.";
    a2[2] = 85;
  }
  return *(double *)&v6;
}

void TLE::optionalOpDeserializer(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  __int128 v4;
  const char *v5;
  _QWORD **v6;
  _QWORD *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD **v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *exception;
  der_vm_context v16;
  __int128 v17;
  void *v18[2];
  uint64_t v19;

  v19 = 0;
  v17 = 0u;
  *(_OWORD *)v18 = 0u;
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&v16.runtime = *(_OWORD *)a2;
  *(_OWORD *)&v16.lookup.index_count = v4;
  *(_OWORD *)&v16.sorted = *(_OWORD *)(a2 + 32);
  v16.var0.ccstate.der_end = *(char **)(a2 + 48);
  TLE::Executor::getDependentOpsFromDictionary(a1, &v16, (uint64_t)&v17);
  if ((_DWORD)v17)
  {
    *(_OWORD *)a3 = v17;
    *(void **)(a3 + 16) = v18[0];
    *(_QWORD *)(a3 + 24) = 0;
    v6 = (_QWORD **)v18[1];
    if (!v18[1])
      return;
    goto LABEL_12;
  }
  if ((_DWORD)v19 != 1)
  {
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_DWORD *)a3 = 6;
    *(_QWORD *)(a3 + 8) = "$optional only supports a single dependent operation";
    *(_QWORD *)(a3 + 16) = 52;
    v6 = (_QWORD **)v18[1];
    if (!v18[1])
      return;
    goto LABEL_12;
  }
  v7 = v18[1];
  if (!v18[1])
    goto LABEL_23;
  v8 = 8 * v19;
  if ((char *)v18[1] + v8 < v18[1] || HIDWORD(v8))
    os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range", v5);
  if ((v8 & 0xFFFFFFF8) == 0)
LABEL_23:
    os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outside of the bounds set originally", v5);
  v9 = operator new();
  *(_QWORD *)(v9 + 16) = 0;
  *(_QWORD *)(v9 + 24) = 0;
  *(_QWORD *)v9 = &off_24E06EA40;
  *(_QWORD *)(v9 + 8) = 1;
  *(_QWORD *)(v9 + 32) = *v7;
  *v7 = 0;
  *(_BYTE *)(v9 + 40) = 0;
  *(_QWORD *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  *(_QWORD *)(a3 + 24) = v9;
  v6 = (_QWORD **)v18[1];
  if (v18[1])
  {
LABEL_12:
    if ((_DWORD)v19)
    {
      v10 = 8 * v19;
      v11 = v6;
      do
      {
        v12 = *v11;
        if (*v11)
        {
          v13 = v12[1];
          if (v13 <= 0)
          {
            exception = __cxa_allocate_exception(8uLL);
            *exception = "Over-release of an object";
            __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
          }
          v14 = v13 - 1;
          v12[1] = v14;
          if (!v14)
            (*(void (**)(_QWORD *))(*v12 + 8))(v12);
        }
        *v11++ = 0;
        v10 -= 8;
      }
      while (v10);
    }
    free(v6);
  }
}

void sub_21C68CA0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  TLE::Tuple<TLE::Error,libkern::safe_allocation<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>,os_detail::IOKit_typed_allocator<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>,os_detail::panic_trapping_policy>>::~Tuple((uint64_t)va);
  _Unwind_Resume(a1);
}

void TLE::queryOpDeserializer(__int128 *a1@<X1>, uint64_t a2@<X2>, _QWORD *a3@<X8>)
{
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  if (*(_DWORD *)a2 == 1)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2000000000;
    v12 = 1;
    der_vm_iterate_b();
    if (*((_BYTE *)v10 + 24))
    {
      v6 = operator new();
      v7 = *a1;
      v8 = a1[2];
      *(_OWORD *)(v6 + 48) = a1[1];
      *(_OWORD *)(v6 + 64) = v8;
      *(_QWORD *)(v6 + 80) = *((_QWORD *)a1 + 6);
      *(_QWORD *)v6 = &off_24E06EA10;
      *(_QWORD *)(v6 + 8) = 1;
      *(_OWORD *)(v6 + 16) = *(_OWORD *)(a2 + 8);
      *(_OWORD *)(v6 + 32) = v7;
      *a3 = 0;
      a3[1] = 0;
      a3[2] = 0;
      a3[3] = v6;
    }
    else
    {
      *(_OWORD *)a3 = 0u;
      *((_OWORD *)a3 + 1) = 0u;
      *(_DWORD *)a3 = 6;
      a3[1] = "$query deserialization failed since it has an invalid query definition";
      a3[2] = 70;
    }
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    *(_OWORD *)a3 = 0u;
    *((_OWORD *)a3 + 1) = 0u;
    *(_DWORD *)a3 = 3;
    a3[1] = "Got an unexpected type (not a dictionary) when trying to generate a query operation.";
    a3[2] = 84;
  }
}

void sub_21C68CB6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void TLE::andArrayOpDeserializer(const der_vm_context *a1@<X1>, _DWORD *a2@<X2>, uint64_t a3@<X8>)
{
  const char *v4;
  _QWORD *v5;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD **v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *exception;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = 0;
  v17 = 0u;
  v18 = 0u;
  TLE::opArrayOpDeserializer(a1, a2, (uint64_t)&v17);
  if ((_DWORD)v17)
  {
    *(_OWORD *)a3 = v17;
    v5 = (_QWORD *)*((_QWORD *)&v18 + 1);
    *(_QWORD *)(a3 + 16) = v18;
    *(_QWORD *)(a3 + 24) = 0;
    if (!v5)
      return;
  }
  else
  {
    if ((_DWORD)v19 != 1)
    {
      v14 = operator new();
      *(_QWORD *)(v14 + 16) = 0;
      *(_QWORD *)(v14 + 24) = 0;
      *(_QWORD *)v14 = &off_24E06E9E0;
      *(_QWORD *)(v14 + 8) = 1;
      *(_QWORD *)(v14 + 32) = *((_QWORD *)&v18 + 1);
      *(_DWORD *)(v14 + 40) = v19;
      *(_QWORD *)a3 = 0;
      *(_QWORD *)(a3 + 8) = 0;
      *(_QWORD *)(a3 + 16) = 0;
      *(_QWORD *)(a3 + 24) = v14;
      return;
    }
    v5 = (_QWORD *)*((_QWORD *)&v18 + 1);
    if (!*((_QWORD *)&v18 + 1))
      goto LABEL_24;
    v6 = 8 * v19;
    if (*((_QWORD *)&v18 + 1) + v6 < *((_QWORD *)&v18 + 1) || HIDWORD(v6))
      os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range", v4);
    if ((v6 & 0xFFFFFFF8) == 0)
LABEL_24:
      os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outside of the bounds set originally", v4);
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
    v7 = (_QWORD *)*v5;
    *(_QWORD *)(a3 + 16) = 0;
    *(_QWORD *)(a3 + 24) = v7;
    if (v7)
    {
      v8 = v7[1];
      if (v8 < 1)
      {
        exception = __cxa_allocate_exception(8uLL);
        *exception = "Attempted resurection of an object";
        __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
      }
      v7[1] = v8 + 1;
    }
  }
  if ((_DWORD)v19)
  {
    v9 = 8 * v19;
    v10 = (_QWORD **)v5;
    do
    {
      v11 = *v10;
      if (*v10)
      {
        v12 = v11[1];
        if (v12 <= 0)
        {
          v15 = __cxa_allocate_exception(8uLL);
          *v15 = "Over-release of an object";
          __cxa_throw(v15, MEMORY[0x24BEDB718], 0);
        }
        v13 = v12 - 1;
        v11[1] = v13;
        if (!v13)
          (*(void (**)(_QWORD *))(*v11 + 8))(v11);
      }
      *v10++ = 0;
      v9 -= 8;
    }
    while (v9);
  }
  free(v5);
}

void sub_21C68CD4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  TLE::Tuple<TLE::Error,libkern::safe_allocation<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>,os_detail::IOKit_typed_allocator<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>,os_detail::panic_trapping_policy>>::~Tuple((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void TLE::orArrayOpDeserializer(uint64_t a1@<X8>)
{
  const char *v2;
  _QWORD *v3;
  unint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD **v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *exception;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = 0;
  v15 = 0u;
  v16 = 0u;
  TLE::opArrayOpDeserializer(&v15);
  if ((_DWORD)v15)
  {
    *(_OWORD *)a1 = v15;
    v3 = (_QWORD *)*((_QWORD *)&v16 + 1);
    *(_QWORD *)(a1 + 16) = v16;
    *(_QWORD *)(a1 + 24) = 0;
    if (!v3)
      return;
  }
  else
  {
    if ((_DWORD)v17 != 1)
    {
      v12 = operator new();
      *(_QWORD *)(v12 + 16) = 0;
      *(_QWORD *)(v12 + 24) = 0;
      *(_QWORD *)v12 = &off_24E06E9B0;
      *(_QWORD *)(v12 + 8) = 1;
      *(_QWORD *)(v12 + 32) = *((_QWORD *)&v16 + 1);
      *(_DWORD *)(v12 + 40) = v17;
      *(_QWORD *)a1 = 0;
      *(_QWORD *)(a1 + 8) = 0;
      *(_QWORD *)(a1 + 16) = 0;
      *(_QWORD *)(a1 + 24) = v12;
      return;
    }
    v3 = (_QWORD *)*((_QWORD *)&v16 + 1);
    if (!*((_QWORD *)&v16 + 1))
      goto LABEL_24;
    v4 = 8 * v17;
    if (*((_QWORD *)&v16 + 1) + v4 < *((_QWORD *)&v16 + 1) || HIDWORD(v4))
      os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range", v2);
    if ((v4 & 0xFFFFFFF8) == 0)
LABEL_24:
      os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outside of the bounds set originally", v2);
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
    v5 = (_QWORD *)*v3;
    *(_QWORD *)(a1 + 16) = 0;
    *(_QWORD *)(a1 + 24) = v5;
    if (v5)
    {
      v6 = v5[1];
      if (v6 < 1)
      {
        exception = __cxa_allocate_exception(8uLL);
        *exception = "Attempted resurection of an object";
        __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
      }
      v5[1] = v6 + 1;
    }
  }
  if ((_DWORD)v17)
  {
    v7 = 8 * v17;
    v8 = (_QWORD **)v3;
    do
    {
      v9 = *v8;
      if (*v8)
      {
        v10 = v9[1];
        if (v10 <= 0)
        {
          v13 = __cxa_allocate_exception(8uLL);
          *v13 = "Over-release of an object";
          __cxa_throw(v13, MEMORY[0x24BEDB718], 0);
        }
        v11 = v10 - 1;
        v9[1] = v11;
        if (!v11)
          (*(void (**)(_QWORD *))(*v9 + 8))(v9);
      }
      *v8++ = 0;
      v7 -= 8;
    }
    while (v7);
  }
  free(v3);
}

void sub_21C68CF34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  TLE::Tuple<TLE::Error,libkern::safe_allocation<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>,os_detail::IOKit_typed_allocator<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>,os_detail::panic_trapping_policy>>::~Tuple((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void TLE::opArrayOpDeserializer(const der_vm_context *a1@<X1>, _DWORD *a2@<X2>, uint64_t a3@<X8>)
{
  const char *v4;
  uint64_t v5;
  __int128 v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  _QWORD *v11;
  __int128 v12;
  void *v13;
  uint64_t v14;
  _QWORD **v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *exception;
  _QWORD v20[4];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  __n128 (*v24)(uint64_t, uint64_t);
  uint64_t (*v25)();
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  char *der_end;

  if (*a2)
  {
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_DWORD *)(a3 + 32) = 0;
    *(_DWORD *)a3 = 6;
    v4 = "factless operator disallowed for active fact";
    v5 = 44;
LABEL_11:
    *(_QWORD *)(a3 + 8) = v4;
    *(_QWORD *)(a3 + 16) = v5;
    return;
  }
  v7 = *(_OWORD *)&a1->lookup.index_count;
  v31 = *(_OWORD *)&a1->runtime;
  v32 = v7;
  v33 = *(_OWORD *)&a1->sorted;
  der_end = a1->var0.ccstate.der_end;
  if (der_vm_CEType_from_context() != 2)
  {
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_DWORD *)(a3 + 32) = 0;
    *(_DWORD *)a3 = 3;
    v4 = "Got an unexpected type (not a sequence) when trying to read the array of matches.";
    v5 = 81;
    goto LABEL_11;
  }
  v8 = count_ce_elements(a1);
  if (!v8)
  {
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_DWORD *)(a3 + 32) = 0;
    *(_DWORD *)a3 = 4;
    v4 = "The array of dependent operations is empty.";
    v5 = 43;
    goto LABEL_11;
  }
  v9 = v8;
  v30 = 0;
  if (HIDWORD(v8))
  {
    v10 = 0;
    LODWORD(v9) = 0;
  }
  else
  {
    v10 = malloc_type_malloc(8 * v8, 0x61F7200BuLL);
    bzero(v10, 8 * v9);
  }
  v29 = v10;
  LODWORD(v30) = v9;
  v21 = 0;
  v22 = &v21;
  v23 = 0x4002000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v27 = 0;
  v28 = 0;
  v26 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2000000000;
  v20[3] = 0;
  der_vm_iterate_b();
  v11 = v22 + 5;
  if (*((_DWORD *)v22 + 10))
  {
    *(_DWORD *)(a3 + 32) = 0;
    *(_QWORD *)(a3 + 24) = 0;
    v12 = *(_OWORD *)v11;
    *(_QWORD *)(a3 + 16) = v11[2];
    *(_OWORD *)a3 = v12;
  }
  else
  {
    TLE::Tuple<TLE::Error,libkern::safe_allocation<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>,os_detail::IOKit_typed_allocator<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>,os_detail::panic_trapping_policy>>::Tuple(a3, (uint64_t)&v29);
  }
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(&v21, 8);
  v13 = v29;
  if (v29)
  {
    if ((_DWORD)v30)
    {
      v14 = 8 * v30;
      v15 = (_QWORD **)v29;
      do
      {
        v16 = *v15;
        if (*v15)
        {
          v17 = v16[1];
          if (v17 <= 0)
          {
            exception = __cxa_allocate_exception(8uLL);
            *exception = "Over-release of an object";
            __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
          }
          v18 = v17 - 1;
          v16[1] = v18;
          if (!v18)
            (*(void (**)(_QWORD *))(*v16 + 8))(v16);
        }
        *v15++ = 0;
        v14 -= 8;
      }
      while (v14);
    }
    free(v13);
  }
}

void sub_21C68D1FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  libkern::safe_allocation<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>,os_detail::IOKit_typed_allocator<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>,os_detail::panic_trapping_policy>::~safe_allocation(v11 - 144);
  _Unwind_Resume(a1);
}

void os_detail::panic_trapping_policy::trap(os_detail::panic_trapping_policy *this, const char *a2)
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
  *exception = this;
  __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t TLE::Tuple<TLE::Error,libkern::safe_allocation<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>,os_detail::IOKit_typed_allocator<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>,os_detail::panic_trapping_policy>>::~Tuple(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD **v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *exception;

  v2 = *(void **)(a1 + 24);
  if (v2)
  {
    v3 = *(unsigned int *)(a1 + 32);
    if ((_DWORD)v3)
    {
      v4 = 8 * v3;
      v5 = *(_QWORD ***)(a1 + 24);
      do
      {
        v6 = *v5;
        if (*v5)
        {
          v7 = v6[1];
          if (v7 <= 0)
          {
            exception = __cxa_allocate_exception(8uLL);
            *exception = "Over-release of an object";
            __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
          }
          v8 = v7 - 1;
          v6[1] = v8;
          if (!v8)
            (*(void (**)(_QWORD *))(*v6 + 8))(v6);
        }
        *v5++ = 0;
        v4 -= 8;
      }
      while (v4);
    }
    free(v2);
  }
  return a1;
}

uint64_t count_ce_elements(const der_vm_context *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2000000000;
  v6 = 0;
  der_vm_iterate_b();
  v1 = v4[3];
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_21C68D3A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(__n128 *)(a1 + 40) = result;
  return result;
}

void sub_21C68D628(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  TLE::Tuple<TLE::Error,libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>::~Tuple((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t libkern::safe_allocation<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>,os_detail::IOKit_typed_allocator<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>,os_detail::panic_trapping_policy>::~safe_allocation(uint64_t a1)
{
  _QWORD **v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD **v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *exception;

  v2 = *(_QWORD ***)a1;
  if (*(_QWORD *)a1)
  {
    v3 = *(unsigned int *)(a1 + 8);
    if ((_DWORD)v3)
    {
      v4 = 8 * v3;
      v5 = *(_QWORD ***)a1;
      do
      {
        v6 = *v5;
        if (*v5)
        {
          v7 = v6[1];
          if (v7 <= 0)
          {
            exception = __cxa_allocate_exception(8uLL);
            *exception = "Over-release of an object";
            __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
          }
          v8 = v7 - 1;
          v6[1] = v8;
          if (!v8)
            (*(void (**)(_QWORD *))(*v6 + 8))(v6);
        }
        *v5++ = 0;
        v4 -= 8;
      }
      while (v4);
    }
    free(v2);
  }
  return a1;
}

uint64_t TLE::Tuple<TLE::Error,libkern::safe_allocation<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>,os_detail::IOKit_typed_allocator<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>,os_detail::panic_trapping_policy>>::Tuple(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(result + 32) = 0;
  *(_OWORD *)result = 0u;
  *(_OWORD *)(result + 16) = 0u;
  if (result + 24 != a2)
  {
    *(_QWORD *)(result + 24) = *(_QWORD *)a2;
    *(_DWORD *)(result + 32) = *(_DWORD *)(a2 + 8);
    *(_QWORD *)a2 = 0;
    *(_DWORD *)(a2 + 8) = 0;
  }
  return result;
}

void TLE::opTupleDeserializer(uint64_t a1@<X0>, const der_vm_context *a2@<X1>, _DWORD *a3@<X2>, uint64_t a4@<X8>)
{
  const char *v5;
  uint64_t v6;
  __int128 v10;
  _OWORD v11[3];
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  char *der_end;

  if (*a3)
  {
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
    *(_DWORD *)a4 = 6;
    v5 = "factless operator disallowed for active fact";
    v6 = 44;
  }
  else
  {
    v10 = *(_OWORD *)&a2->lookup.index_count;
    v16 = *(_OWORD *)&a2->runtime;
    v17 = v10;
    v18 = *(_OWORD *)&a2->sorted;
    der_end = a2->var0.ccstate.der_end;
    if (der_vm_CEType_from_context() == 2)
    {
      if (count_ce_elements(a2) == 2)
      {
        v15 = 0;
        v13 = 0u;
        v14 = 0u;
        TLE::keyForContext(&v13);
        if ((_DWORD)v13)
        {
          *(_OWORD *)a4 = v13;
          *(_QWORD *)(a4 + 16) = v14;
          *(_QWORD *)(a4 + 24) = 0;
          return;
        }
        v12 = 0;
        memset(v11, 0, sizeof(v11));
        der_vm_execute_nocopy();
        if (der_vm_CEType_from_context() == 1)
        {
          if (!CEBuffer_cmp())
          {
            TLE::andDeserializer(a1, (uint64_t)v11, a3, a4);
            return;
          }
          if (!CEBuffer_cmp())
          {
            TLE::orDeserializer(a1, (uint64_t)v11, a3, a4);
            return;
          }
          if (!CEBuffer_cmp())
          {
            TLE::optionalOpDeserializer(a1, (uint64_t)v11, a4);
            return;
          }
        }
        else
        {
          if (der_vm_CEType_from_context() != 2)
          {
            *(_OWORD *)a4 = 0u;
            *(_OWORD *)(a4 + 16) = 0u;
            *(_DWORD *)a4 = 3;
            v5 = "Unexpected type in Array tuple";
            v6 = 30;
            goto LABEL_9;
          }
          if (!CEBuffer_cmp())
          {
            TLE::andArrayOpDeserializer(a1, v11, a3);
            return;
          }
          if (!CEBuffer_cmp())
          {
            TLE::orArrayOpDeserializer(a4);
            return;
          }
        }
        *(_OWORD *)a4 = 0u;
        *(_OWORD *)(a4 + 16) = 0u;
        *(_DWORD *)a4 = 9;
        v5 = "Unexpected operator in Array tuple";
        v6 = 34;
      }
      else
      {
        *(_OWORD *)a4 = 0u;
        *(_OWORD *)(a4 + 16) = 0u;
        *(_DWORD *)a4 = 6;
        v5 = "Incorrect number of elements in operator Array tuple";
        v6 = 52;
      }
    }
    else
    {
      *(_OWORD *)a4 = 0u;
      *(_OWORD *)(a4 + 16) = 0u;
      *(_DWORD *)a4 = 6;
      v5 = "Non array element found in operator Array";
      v6 = 41;
    }
  }
LABEL_9:
  *(_QWORD *)(a4 + 8) = v5;
  *(_QWORD *)(a4 + 16) = v6;
}

uint64_t TLE::Tuple<TLE::Error,libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>::~Tuple(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *exception;

  v2 = *(_QWORD **)(a1 + 24);
  if (v2)
  {
    v3 = v2[1];
    if (v3 <= 0)
    {
      exception = __cxa_allocate_exception(8uLL);
      *exception = "Over-release of an object";
      __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
    }
    v4 = v3 - 1;
    v2[1] = v4;
    if (!v4)
      (*(void (**)(_QWORD *))(*v2 + 8))(v2);
  }
  *(_QWORD *)(a1 + 24) = 0;
  return a1;
}

double TLE::keyForContext@<D0>(_QWORD *a1@<X8>)
{
  uint64_t v4;
  double result;
  uint64_t v6;

  der_vm_execute_nocopy();
  if (der_vm_CEType_from_context() == 4)
  {
    v4 = der_vm_string_from_context();
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
    a1[3] = v4;
    a1[4] = v6;
  }
  else
  {
    result = 0.0;
    *(_OWORD *)a1 = 0u;
    *((_OWORD *)a1 + 1) = 0u;
    a1[4] = 0;
    *(_DWORD *)a1 = 3;
    a1[1] = "Expected operator string in Array tuple";
    a1[2] = 39;
  }
  return result;
}

uint64_t ___ZL17count_ce_elementsRK14der_vm_context_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  int v7;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(_QWORD *)(v1 + 24);
  v3 = __CFADD__(v2, 1);
  v4 = v2 + 1;
  v5 = v3;
  v6 = v5 << 63 >> 63 != v5 || v5 << 63 >> 63 == -1;
  v7 = v6;
  if (!v6)
    *(_QWORD *)(v1 + 24) = v4;
  return v7 ^ 1u;
}

uint64_t ___ZN3TLE19queryOpDeserializerERNS_8ExecutorER14der_vm_contextRKNS_14FactDefinitionE_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (*(_DWORD *)(a2 + 116) == 2 && count_ce_elements((const der_vm_context *)(a2 + 56)) == 2)
    return 1;
  result = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  return result;
}

void TLE::Executor::getDependentOpsFromDictionary(uint64_t a1@<X0>, const der_vm_context *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  __int128 v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  _QWORD *v13;
  int v14;
  __int128 v15;
  void *v16;
  uint64_t v17;
  _QWORD **v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *exception;
  _QWORD v23[4];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  __n128 (*v27)(uint64_t, uint64_t);
  uint64_t (*v28)();
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  char *der_end;

  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v5 + 1;
  if ((unint64_t)(v5 + 1) >= 6)
  {
    *(_QWORD *)(a1 + 8) = v5;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_DWORD *)(a3 + 32) = 0;
    *(_DWORD *)a3 = 8;
    v6 = "Constraint is too deeply nested. Failing to avoid recursion overflow";
    v7 = 68;
LABEL_11:
    *(_QWORD *)(a3 + 8) = v6;
    *(_QWORD *)(a3 + 16) = v7;
    return;
  }
  v9 = *(_OWORD *)&a2->lookup.index_count;
  v34 = *(_OWORD *)&a2->runtime;
  v35 = v9;
  v36 = *(_OWORD *)&a2->sorted;
  der_end = a2->var0.ccstate.der_end;
  if (der_vm_CEType_from_context() != 1)
  {
    --*(_QWORD *)(a1 + 8);
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_DWORD *)(a3 + 32) = 0;
    *(_DWORD *)a3 = 3;
    v6 = "Got an unexpected type (not a dictionary) when trying to generate dependent operations for evaluation.";
    v7 = 102;
    goto LABEL_11;
  }
  v10 = count_ce_elements(a2);
  if (!v10)
  {
    --*(_QWORD *)(a1 + 8);
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_DWORD *)(a3 + 32) = 0;
    *(_DWORD *)a3 = 4;
    v6 = "The dictionary of dependent operations is empty.";
    v7 = 48;
    goto LABEL_11;
  }
  v11 = v10;
  v33 = 0;
  if (HIDWORD(v10))
  {
    v12 = 0;
    LODWORD(v11) = 0;
  }
  else
  {
    v12 = malloc_type_malloc(8 * v10, 0x61F7200BuLL);
    bzero(v12, 8 * v11);
  }
  v32 = v12;
  LODWORD(v33) = v11;
  v24 = 0;
  v25 = &v24;
  v26 = 0x4002000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v30 = 0;
  v31 = 0;
  v29 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2000000000;
  v23[3] = 0;
  der_vm_iterate_b();
  v13 = v25 + 5;
  v14 = *((_DWORD *)v25 + 10);
  --*(_QWORD *)(a1 + 8);
  if (v14)
  {
    *(_DWORD *)(a3 + 32) = 0;
    *(_QWORD *)(a3 + 24) = 0;
    v15 = *(_OWORD *)v13;
    *(_QWORD *)(a3 + 16) = v13[2];
    *(_OWORD *)a3 = v15;
  }
  else
  {
    TLE::Tuple<TLE::Error,libkern::safe_allocation<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>,os_detail::IOKit_typed_allocator<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>,os_detail::panic_trapping_policy>>::Tuple(a3, (uint64_t)&v32);
  }
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v24, 8);
  v16 = v32;
  if (v32)
  {
    if ((_DWORD)v33)
    {
      v17 = 8 * v33;
      v18 = (_QWORD **)v32;
      do
      {
        v19 = *v18;
        if (*v18)
        {
          v20 = v19[1];
          if (v20 <= 0)
          {
            exception = __cxa_allocate_exception(8uLL);
            *exception = "Over-release of an object";
            __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
          }
          v21 = v20 - 1;
          v19[1] = v21;
          if (!v21)
            (*(void (**)(_QWORD *))(*v19 + 8))(v19);
        }
        *v18++ = 0;
        v17 -= 8;
      }
      while (v17);
    }
    free(v16);
  }
}

void sub_21C68DF04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  uint64_t v15;
  va_list va;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v15 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  libkern::safe_allocation<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>,os_detail::IOKit_typed_allocator<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>,os_detail::panic_trapping_policy>::~safe_allocation(v13 - 160);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3TLE8Executor29getDependentOpsFromDictionaryE14der_vm_contextRKNS_14FactDefinitionEbmPK8CEBuffer_block_invoke(uint64_t a1, uint64_t a2)
{
  __int128 *v3;
  uint64_t result;
  uint64_t v5;
  __int128 v6;
  const char *v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  char **v11;
  char **v12;
  unint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  unint64_t *v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  BOOL v41;
  unint64_t v42;
  unint64_t *v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  _QWORD *v48;
  const char *v49;
  unint64_t *v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  BOOL v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  uint64_t v66;
  _QWORD *exception;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;
  uint64_t v73;
  BOOL v74;
  char *v75;
  _QWORD **v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD *v79;
  _QWORD *v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t *v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  unint64_t v87;
  unint64_t v88;
  unint64_t v89;
  uint64_t v90;
  BOOL v91;
  uint64_t v92;
  uint64_t v93;
  _QWORD *v94;
  uint64_t v95;
  const char *v96;
  unint64_t *v97;
  uint64_t v98;
  unint64_t v99;
  unint64_t v100;
  unint64_t v101;
  unint64_t v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  _BOOL4 v113;
  uint64_t v114;
  unint64_t *v115;
  uint64_t v116;
  unint64_t v117;
  unint64_t v118;
  unint64_t v119;
  unint64_t v120;
  unint64_t v121;
  uint64_t v122;
  BOOL v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  _QWORD **v127;
  uint64_t v128;
  unint64_t v129;
  uint64_t v130;
  char *v131;
  uint64_t v132;
  _QWORD **v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  _BOOL4 v138;
  uint64_t v139;
  _QWORD *v140;
  _QWORD *v141;
  _QWORD *v142;
  _QWORD *v143;
  uint64_t v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  uint64_t v149;
  _OWORD v150[3];
  uint64_t v151;
  _OWORD v152[3];
  _OWORD v153[2];
  uint64_t v154;

  v154 = *MEMORY[0x24BDAC8D0];
  v143 = *(_QWORD **)(a1 + 48);
  memset(v152, 0, 40);
  v3 = (__int128 *)(a2 + 56);
  TLE::keyForContext(v152);
  if (LODWORD(v152[0]))
  {
    result = 0;
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    *(_OWORD *)(v5 + 40) = v152[0];
    *(_QWORD *)(v5 + 56) = *(_QWORD *)&v152[1];
    return result;
  }
  v151 = 0;
  memset(v150, 0, sizeof(v150));
  v6 = v3[1];
  v146 = *v3;
  v147 = v6;
  v148 = v3[2];
  v149 = *((_QWORD *)v3 + 6);
  der_vm_execute_nocopy();
  v8 = *(_QWORD *)(a1 + 56);
  if (v8)
  {
    v9 = (_BYTE *)*((_QWORD *)&v152[1] + 1);
    v10 = *(_QWORD *)(a1 + 64) + 8;
    while (1)
    {
      result = CEBuffer_cmp();
      if (!(_DWORD)result)
        break;
      v10 += 16;
      if (!--v8)
        goto LABEL_9;
    }
    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    *(_DWORD *)(v28 + 40) = 6;
    v29 = "Unexpected key for parsing context";
    v30 = 34;
    goto LABEL_48;
  }
  v9 = (_BYTE *)*((_QWORD *)&v152[1] + 1);
LABEL_9:
  if (*v9 != 36)
  {
    if (!*(_BYTE *)(a1 + 88))
    {
      result = 0;
      v28 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      *(_DWORD *)(v28 + 40) = 6;
      v29 = "Fact not allowed in context";
      v30 = 27;
LABEL_48:
      *(_QWORD *)(v28 + 48) = v29;
      *(_QWORD *)(v28 + 56) = v30;
      return result;
    }
    v24 = *(_QWORD *)&v152[2];
    if (((*(uint64_t (**)(_QWORD, _BYTE *, _QWORD))(*(_QWORD *)*v143 + 32))(*v143, v9, *(_QWORD *)&v152[2]) & 1) == 0)
    {
      *(_OWORD *)((char *)v153 + 4) = *(_OWORD *)((char *)&v152[1] + 8);
      v36 = operator new();
      *(_DWORD *)(v36 + 32) = 5;
      *(_OWORD *)(v36 + 36) = v153[0];
      *(_DWORD *)(v36 + 52) = v153[1];
      *(_QWORD *)(v36 + 16) = 0;
      *(_QWORD *)(v36 + 24) = 0;
      *(_QWORD *)v36 = &off_24E06EA70;
      *(_QWORD *)(v36 + 8) = 1;
      v144 = v36;
      v37 = *(unint64_t **)(a1 + 80);
      v38 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v39 = *v37;
      if (*v37)
      {
        v40 = v39 + 8 * *((unsigned int *)v37 + 2);
        v41 = v40 >= v39;
        v42 = v40 - v39;
        if (!v41 || HIDWORD(v42))
          os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range", v35);
      }
      else
      {
        LODWORD(v42) = 0;
      }
      if (v38 >= 0)
        v55 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      else
        v55 = -v38;
      v56 = ((unint64_t)v38 >> 63) + 0x7FFFFFFFFFFFFFFFLL;
      if (v38 >= 0)
        v57 = 8 * v55;
      else
        v57 = -8 * v55;
      if (v55 >> 61)
        v58 = 1;
      else
        v58 = 8 * v55 > v56;
      if (v58)
      {
        v59 = "bounded_ptr<T>::operator+=(n): Calculating the number of bytes to add to the offset (n * sizeof(T)) would "
              "trigger an overflow";
      }
      else if (v57 == (int)v57)
      {
        v59 = "bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outside of the bounds set originally";
        if ((v57 & 0x80000000) == 0 && (int)v57 + 8 <= v42)
        {
          v60 = (int)v57;
          v61 = (uint64_t)(int)v57 >> 63;
          v62 = (uint64_t *)(v39 + v60);
          v63 = __CFADD__(v39, v60) ? v61 + 1 : v61;
          v64 = v63 << 63 >> 63;
          v59 = "This bounded_ptr is pointing to memory outside of what can be represented by a native pointer.";
          if (v64 == v63 && (v64 & 0x8000000000000000) == 0)
          {
            v65 = (_QWORD *)*v62;
            if (*v62)
            {
              v66 = v65[1];
              if (v66 <= 0)
              {
                exception = __cxa_allocate_exception(8uLL);
                *exception = "Over-release of an object";
                __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
              }
              goto LABEL_161;
            }
LABEL_163:
            *v62 = v36;
            v108 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v109 = *(_QWORD *)(v108 + 24);
            v110 = v109 + 1;
            v111 = v109 == -1;
            v113 = v111 << 63 >> 63 != v111 || v111 << 63 >> 63 == -1;
            if (v113)
            {
              v114 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
              *(_DWORD *)(v114 + 40) = 10;
              *(_QWORD *)(v114 + 48) = "Too many elements in dictionary";
              *(_QWORD *)(v114 + 56) = 31;
              return 0;
            }
            else
            {
              *(_QWORD *)(v108 + 24) = v110;
              return !v113;
            }
          }
        }
      }
      else
      {
        v59 = "bounded_ptr<T>::operator+=(n): Adding the specified number of bytes to the offset representing the current"
              " position would overflow.";
      }
      os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)v59, v35);
    }
    v144 = 0;
    v145 = 0uLL;
    (*(void (**)(uint64_t *__return_ptr, _QWORD, _BYTE *, uint64_t))(*(_QWORD *)*v143 + 16))(&v144, *v143, v9, v24);
    v25 = der_vm_CEType_from_context();
    if (v25 == 1)
    {
      memset(v153, 0, sizeof(v153));
      TLE::factOpDeserializer((uint64_t)v143, (uint64_t)v150, (uint64_t)&v144, (uint64_t)v153);
      if (LODWORD(v153[0]))
      {
        v27 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        *(_OWORD *)(v27 + 40) = v153[0];
        *(_QWORD *)(v27 + 56) = *(_QWORD *)&v153[1];
        TLE::Tuple<TLE::Error,libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>::~Tuple((uint64_t)v153);
        return 0;
      }
      v115 = *(unint64_t **)(a1 + 80);
      v116 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v117 = *v115;
      if (*v115)
      {
        v118 = v117 + 8 * *((unsigned int *)v115 + 2);
        v41 = v118 >= v117;
        v119 = v118 - v117;
        if (!v41 || HIDWORD(v119))
          os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range", v26);
      }
      else
      {
        LODWORD(v119) = 0;
      }
      if (v116 >= 0)
        v120 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      else
        v120 = -v116;
      v121 = ((unint64_t)v116 >> 63) + 0x7FFFFFFFFFFFFFFFLL;
      if (v116 >= 0)
        v122 = 8 * v120;
      else
        v122 = -8 * v120;
      if (v120 >> 61)
        v123 = 1;
      else
        v123 = 8 * v120 > v121;
      if (v123)
      {
        v124 = "bounded_ptr<T>::operator+=(n): Calculating the number of bytes to add to the offset (n * sizeof(T)) would"
               " trigger an overflow";
      }
      else if (v122 == (int)v122)
      {
        v124 = "bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outside of the bounds set originally";
        if ((v122 & 0x80000000) == 0 && (int)v122 + 8 <= v119)
        {
          v125 = (int)v122;
          v126 = (uint64_t)(int)v122 >> 63;
          v41 = __CFADD__(v117, v125);
          v127 = (_QWORD **)(v117 + v125);
          if (v41)
            ++v126;
          v128 = v126 << 63 >> 63;
          v124 = "This bounded_ptr is pointing to memory outside of what can be represented by a native pointer.";
          if (v128 == v126 && (v128 & 0x8000000000000000) == 0)
          {
            libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>::operator=(v127, (_QWORD *)&v153[1] + 1);
            TLE::Tuple<TLE::Error,libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>::~Tuple((uint64_t)v153);
LABEL_215:
            v84 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v85 = *(_QWORD *)(v84 + 24);
            goto LABEL_216;
          }
        }
      }
      else
      {
        v124 = "bounded_ptr<T>::operator+=(n): Adding the specified number of bytes to the offset representing the curren"
               "t position would overflow.";
      }
      os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)v124, v26);
    }
    if (v25 == (_DWORD)v144)
    {
      v48 = TLE::opForContext(v25);
      if (v48)
      {
        *((_OWORD *)v48 + 1) = v145;
        *(_QWORD *)&v153[0] = v48;
        v50 = *(unint64_t **)(a1 + 80);
        v51 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
        v52 = *v50;
        if (*v50)
        {
          v53 = v52 + 8 * *((unsigned int *)v50 + 2);
          v41 = v53 >= v52;
          v54 = v53 - v52;
          if (!v41 || HIDWORD(v54))
            os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range", v49);
        }
        else
        {
          LODWORD(v54) = 0;
        }
        if (v51 >= 0)
          v129 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
        else
          v129 = -v51;
        if (v51 >= 0)
          v130 = 8 * v129;
        else
          v130 = -8 * v129;
        v131 = "bounded_ptr<T>::operator+=(n): Calculating the number of bytes to add to the offset (n * sizeof(T)) would"
               " trigger an overflow";
        if (!(v129 >> 61) && 8 * v129 <= ((unint64_t)v51 >> 63) + 0x7FFFFFFFFFFFFFFFLL)
        {
          if (v130 == (int)v130)
          {
            v131 = "bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outside of the bounds set originally";
            if ((v130 & 0x80000000) == 0 && (int)v130 + 8 <= v54)
            {
              v132 = (uint64_t)(int)v130 >> 63;
              v41 = __CFADD__(v52, (int)v130);
              v133 = (_QWORD **)(v52 + (int)v130);
              if (v41)
                ++v132;
              v134 = v132 << 63 >> 63;
              v131 = "This bounded_ptr is pointing to memory outside of what can be represented by a native pointer.";
              if (v134 == v132 && (v134 & 0x8000000000000000) == 0)
              {
                libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>::operator=(v133, v153);
                libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>::~intrusive_shared_ptr((_QWORD **)v153);
                goto LABEL_215;
              }
            }
          }
          else
          {
            v131 = "bounded_ptr<T>::operator+=(n): Adding the specified number of bytes to the offset representing the cu"
                   "rrent position would overflow.";
          }
        }
        os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)v131, v49);
      }
      v68 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      *(_DWORD *)(v68 + 40) = 3;
      v69 = "Unexpected type of an fact declaration.";
      v70 = 39;
    }
    else
    {
      v68 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      *(_DWORD *)(v68 + 40) = 3;
      v69 = "Unexpected type of an operation declaration.";
      v70 = 44;
    }
    *(_QWORD *)(v68 + 48) = v69;
    *(_QWORD *)(v68 + 56) = v70;
    return 0;
  }
  v11 = TLE::operations;
  v12 = &TLE::operations[3 * dword_25529AD80];
  if (v12 < TLE::operations || (24 * (unint64_t)dword_25529AD80) >> 32)
    os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range", v7);
  v14 = (unint64_t)((unint64_t)v12 - (unsigned __int128)(unint64_t)TLE::operations) >> 64;
  v13 = 24 * dword_25529AD80;
  if (v13 >= 0xFFFFFFFF80000000)
    LOBYTE(v14) = v14 + 1;
  if (v14 & 1 | ((v13 + 0x80000000) >> 32))
    os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"The offset of the pointer inside its valid memory range can't be represented using int32_t", v7);
  v15 = (char *)TLE::operations + (int)v13;
  if (__CFADD__(TLE::operations, (int)v13))
    v16 = ((uint64_t)(int)v13 >> 63) + 1;
  else
    v16 = (uint64_t)(int)v13 >> 63;
  v17 = v16 << 63 >> 63;
  v18 = v17 ^ v16;
  if (v17 < 0 || v18 != 0)
    os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"This bounded_ptr is pointing to memory outside of what can be represented by a native pointer.", v7);
  for (i = (24 * dword_25529AD80); ; i += 0x1800000000)
  {
    v21 = (char *)v11 + (i >> 32);
    if (__CFADD__(v11, i >> 32))
      v22 = (i >> 63) + 1;
    else
      v22 = i >> 63;
    v23 = v22 << 63 >> 63;
    if (v23 != v22 || v23 < 0)
      os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"This bounded_ptr is pointing to memory outside of what can be represented by a native pointer.", v7);
    if (v21 == v15)
      goto LABEL_113;
    if (i < 0 || HIDWORD(i) + 24 > i)
      os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outside of the bounds set originally", v7);
    if (!CEBuffer_cmp())
      break;
    if ((unint64_t)((i >> 32) - 2147483624) < 0xFFFFFFFF00000000)
      os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator+=(n): Adding the specified number of bytes to the offset representing the current position would overflow.", v7);
  }
  memset(v153, 0, sizeof(v153));
  (*((void (**)(_OWORD *__return_ptr, _QWORD *, _OWORD *, _QWORD))v21 + 2))(v153, v143, v150, *(_QWORD *)(a1 + 72));
  if (!LODWORD(v153[0]))
  {
    v43 = *(unint64_t **)(a1 + 80);
    v44 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v45 = *v43;
    if (*v43)
    {
      v46 = v45 + 8 * *((unsigned int *)v43 + 2);
      v41 = v46 >= v45;
      v47 = v46 - v45;
      if (!v41 || HIDWORD(v47))
        os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range", v7);
    }
    else
    {
      LODWORD(v47) = 0;
    }
    if (v44 >= 0)
      v71 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    else
      v71 = -v44;
    v72 = ((unint64_t)v44 >> 63) + 0x7FFFFFFFFFFFFFFFLL;
    if (v44 >= 0)
      v73 = 8 * v71;
    else
      v73 = -8 * v71;
    if (v71 >> 61)
      v74 = 1;
    else
      v74 = 8 * v71 > v72;
    if (v74)
    {
      v75 = "bounded_ptr<T>::operator+=(n): Calculating the number of bytes to add to the offset (n * sizeof(T)) would tr"
            "igger an overflow";
    }
    else if (v73 == (int)v73)
    {
      v75 = "bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outside of the bounds set originally";
      if ((v73 & 0x80000000) == 0 && (int)v73 + 8 <= v47)
      {
        v76 = (_QWORD **)(v45 + (int)v73);
        v77 = __CFADD__(v45, (int)v73) ? ((uint64_t)(int)v73 >> 63) + 1 : (uint64_t)(int)v73 >> 63;
        v78 = v77 << 63 >> 63;
        v75 = "This bounded_ptr is pointing to memory outside of what can be represented by a native pointer.";
        if (v78 == v77 && (v78 & 0x8000000000000000) == 0)
        {
          v79 = (_QWORD *)*((_QWORD *)&v153[1] + 1);
          v80 = *v76;
          if (*v76)
          {
            v81 = v80[1];
            if (v81 <= 0)
            {
              v142 = __cxa_allocate_exception(8uLL);
              *v142 = "Over-release of an object";
              __cxa_throw(v142, MEMORY[0x24BEDB718], 0);
            }
            v82 = v81 - 1;
            v80[1] = v82;
            if (!v82)
              (*(void (**)(_QWORD *))(*v80 + 8))(v80);
          }
          *v76 = v79;
LABEL_113:
          v83 = *(unint64_t **)(a1 + 80);
          v84 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v85 = *(_QWORD *)(v84 + 24);
          v86 = *v83;
          if (*v83)
          {
            v87 = v86 + 8 * *((unsigned int *)v83 + 2);
            v41 = v87 >= v86;
            v88 = v87 - v86;
            if (!v41 || HIDWORD(v88))
              os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range", v7);
          }
          else
          {
            LODWORD(v88) = 0;
          }
          if (v85 >= 0)
            v89 = *(_QWORD *)(v84 + 24);
          else
            v89 = -v85;
          if (v85 >= 0)
            v90 = 8 * v89;
          else
            v90 = -8 * v89;
          if (v89 >> 61)
            v91 = 1;
          else
            v91 = 8 * v89 > ((unint64_t)v85 >> 63) + 0x7FFFFFFFFFFFFFFFLL;
          if (v91)
            os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator+=(n): Calculating the number of bytes to add to the offset (n * sizeof(T)) would trigger an overflow", v7);
          if (v90 != (int)v90)
            os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator+=(n): Adding the specified number of bytes to the offset representing the current position would overflow.", v7);
          if ((v90 & 0x80000000) != 0 || (int)v90 + 8 > v88)
            os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outside of the bounds set originally", v7);
          v92 = (int)v90;
          v93 = (uint64_t)(int)v90 >> 63;
          v41 = __CFADD__(v86, v92);
          v94 = (_QWORD *)(v86 + v92);
          if (v41)
            ++v93;
          v95 = v93 << 63 >> 63;
          if (v95 != v93 || v95 < 0)
            os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"This bounded_ptr is pointing to memory outside of what can be represented by a native pointer.", v7);
          if (!*v94)
          {
            *(_OWORD *)((char *)v153 + 4) = *(_OWORD *)((char *)&v152[1] + 8);
            v36 = operator new();
            *(_DWORD *)(v36 + 32) = 1;
            *(_OWORD *)(v36 + 36) = v153[0];
            *(_DWORD *)(v36 + 52) = v153[1];
            *(_QWORD *)(v36 + 16) = 0;
            *(_QWORD *)(v36 + 24) = 0;
            *(_QWORD *)v36 = &off_24E06EA70;
            *(_QWORD *)(v36 + 8) = 1;
            v144 = v36;
            v97 = *(unint64_t **)(a1 + 80);
            v98 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
            v99 = *v97;
            if (*v97)
            {
              v100 = v99 + 8 * *((unsigned int *)v97 + 2);
              v41 = v100 >= v99;
              v101 = v100 - v99;
              if (!v41 || HIDWORD(v101))
                os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range", v96);
            }
            else
            {
              LODWORD(v101) = 0;
            }
            if (v98 >= 0)
              v102 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
            else
              v102 = -v98;
            if (v98 >= 0)
              v103 = 8 * v102;
            else
              v103 = -8 * v102;
            v104 = "bounded_ptr<T>::operator+=(n): Calculating the number of bytes to add to the offset (n * sizeof(T)) w"
                   "ould trigger an overflow";
            if (!(v102 >> 61) && 8 * v102 <= ((unint64_t)v98 >> 63) + 0x7FFFFFFFFFFFFFFFLL)
            {
              if (v103 == (int)v103)
              {
                v104 = "bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outside of the bounds set originally";
                if ((v103 & 0x80000000) == 0 && (int)v103 + 8 <= v101)
                {
                  v62 = (uint64_t *)(v99 + (int)v103);
                  v105 = __CFADD__(v99, (int)v103) ? ((uint64_t)(int)v103 >> 63) + 1 : (uint64_t)(int)v103 >> 63;
                  v106 = v105 << 63 >> 63;
                  v104 = "This bounded_ptr is pointing to memory outside of what can be represented by a native pointer.";
                  if (v106 == v105 && (v106 & 0x8000000000000000) == 0)
                  {
                    v65 = (_QWORD *)*v62;
                    if (*v62)
                    {
                      v66 = v65[1];
                      if (v66 <= 0)
                      {
                        v141 = __cxa_allocate_exception(8uLL);
                        *v141 = "Over-release of an object";
                        __cxa_throw(v141, MEMORY[0x24BEDB718], 0);
                      }
LABEL_161:
                      v107 = v66 - 1;
                      v65[1] = v107;
                      if (!v107)
                        (*(void (**)(_QWORD *))(*v65 + 8))(v65);
                      goto LABEL_163;
                    }
                    goto LABEL_163;
                  }
                }
              }
              else
              {
                v104 = "bounded_ptr<T>::operator+=(n): Adding the specified number of bytes to the offset representing th"
                       "e current position would overflow.";
              }
            }
            os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)v104, v96);
          }
LABEL_216:
          v135 = v85 + 1;
          v136 = v85 == -1;
          v138 = v136 << 63 >> 63 != v136 || v136 << 63 >> 63 == -1;
          if (v138)
          {
            v139 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
            *(_DWORD *)(v139 + 40) = 10;
            *(_QWORD *)(v139 + 48) = "Too many elements in dictionary";
            *(_QWORD *)(v139 + 56) = 31;
          }
          else
          {
            *(_QWORD *)(v84 + 24) = v135;
          }
          return !v138;
        }
      }
    }
    else
    {
      v75 = "bounded_ptr<T>::operator+=(n): Adding the specified number of bytes to the offset representing the current p"
            "osition would overflow.";
    }
    os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)v75, v7);
  }
  v31 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_OWORD *)(v31 + 40) = v153[0];
  v32 = (_QWORD *)*((_QWORD *)&v153[1] + 1);
  *(_QWORD *)(v31 + 56) = *(_QWORD *)&v153[1];
  if (v32)
  {
    v33 = v32[1];
    if (v33 <= 0)
    {
      v140 = __cxa_allocate_exception(8uLL);
      *v140 = "Over-release of an object";
      __cxa_throw(v140, MEMORY[0x24BEDB718], 0);
    }
    v34 = v33 - 1;
    v32[1] = v34;
    if (!v34)
      (*(void (**)(_QWORD *))(*v32 + 8))(v32);
  }
  return 0;
}

void sub_21C68EB74(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

_QWORD **libkern::intrusive_shared_ptr<TLE::ConstErrorOperation,TLE::RefCountPolicy>::~intrusive_shared_ptr(_QWORD **a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *exception;

  v2 = *a1;
  if (v2)
  {
    v3 = v2[1];
    if (v3 <= 0)
    {
      exception = __cxa_allocate_exception(8uLL);
      *exception = "Over-release of an object";
      __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
    }
    v4 = v3 - 1;
    v2[1] = v4;
    if (!v4)
      (*(void (**)(_QWORD *))(*v2 + 8))(v2);
  }
  *a1 = 0;
  return a1;
}

__n128 TLE::factOpDeserializer@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  __int128 v5;
  const char *v6;
  __n128 result;
  _QWORD **v8;
  uint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD **v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *exception;
  _OWORD v20[3];
  uint64_t v21;
  __n128 v22;
  void *v23[2];
  uint64_t v24;

  v24 = 0;
  v22 = 0u;
  *(_OWORD *)v23 = 0u;
  v5 = *(_OWORD *)(a2 + 16);
  v20[0] = *(_OWORD *)a2;
  v20[1] = v5;
  v20[2] = *(_OWORD *)(a2 + 32);
  v21 = *(_QWORD *)(a2 + 48);
  TLE::Executor::getDependentOpsFromDictionary(&v22, a1, v20, a3, 0, 0, 0);
  if (v22.n128_u32[0])
  {
    result = v22;
    *(__n128 *)a4 = v22;
    *(void **)(a4 + 16) = v23[0];
    *(_QWORD *)(a4 + 24) = 0;
    v8 = (_QWORD **)v23[1];
    if (!v23[1])
      return result;
    goto LABEL_13;
  }
  if ((_DWORD)v24 != 1)
  {
    result = 0uLL;
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
    *(_DWORD *)a4 = 6;
    *(_QWORD *)(a4 + 8) = "There should only be one operation to match a fact";
    *(_QWORD *)(a4 + 16) = 50;
    v8 = (_QWORD **)v23[1];
    if (!v23[1])
      return result;
    goto LABEL_13;
  }
  v9 = (uint64_t *)v23[1];
  if (!v23[1])
    goto LABEL_27;
  v10 = 8 * v24;
  if ((char *)v23[1] + v10 < v23[1] || HIDWORD(v10))
    os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range", v6);
  if ((v10 & 0xFFFFFFF8) == 0)
LABEL_27:
    os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outside of the bounds set originally", v6);
  *(_QWORD *)a4 = 0;
  *(_QWORD *)(a4 + 8) = 0;
  v11 = *v9;
  *(_QWORD *)(a4 + 16) = 0;
  *(_QWORD *)(a4 + 24) = v11;
  if (v11)
  {
    v12 = *(_QWORD *)(v11 + 8);
    if (v12 < 1)
    {
      exception = __cxa_allocate_exception(8uLL);
      *exception = "Attempted resurection of an object";
      __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
    }
    *(_QWORD *)(v11 + 8) = v12 + 1;
  }
  v8 = (_QWORD **)v23[1];
  if (v23[1])
  {
LABEL_13:
    if ((_DWORD)v24)
    {
      v13 = 8 * v24;
      v14 = v8;
      do
      {
        v15 = *v14;
        if (*v14)
        {
          v16 = v15[1];
          if (v16 <= 0)
          {
            v18 = __cxa_allocate_exception(8uLL);
            *v18 = "Over-release of an object";
            __cxa_throw(v18, MEMORY[0x24BEDB718], 0);
          }
          v17 = v16 - 1;
          v15[1] = v17;
          if (!v17)
            (*(void (**)(_QWORD *))(*v15 + 8))(v15);
        }
        *v14++ = 0;
        v13 -= 8;
      }
      while (v13);
    }
    free(v8);
  }
  return result;
}

void sub_21C68EE58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  TLE::Tuple<TLE::Error,libkern::safe_allocation<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>,os_detail::IOKit_typed_allocator<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>,os_detail::panic_trapping_policy>>::~Tuple((uint64_t)va);
  _Unwind_Resume(a1);
}

_QWORD **libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>::operator=(_QWORD **a1, _QWORD *a2)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *exception;

  v4 = (_QWORD *)*a2;
  v5 = *a1;
  if (v5)
  {
    v6 = v5[1];
    if (v6 <= 0)
    {
      exception = __cxa_allocate_exception(8uLL);
      *exception = "Over-release of an object";
      __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
    }
    v7 = v6 - 1;
    v5[1] = v7;
    if (!v7)
      (*(void (**)(_QWORD *))(*v5 + 8))(v5);
  }
  *a1 = v4;
  *a2 = 0;
  return a1;
}

_QWORD *TLE::opForContext(int a1)
{
  _QWORD *v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (**v6)();

  switch(a1)
  {
    case 3:
      v1 = (_QWORD *)operator new();
      v2 = der_vm_integer_from_context();
      v1[2] = 0;
      v1[3] = 0;
      *v1 = &off_24E06E688;
      v1[1] = 1;
      v1[4] = v2;
      break;
    case 4:
      v1 = (_QWORD *)operator new();
      v4 = der_vm_string_from_context();
      v1[2] = 0;
      v1[3] = 0;
      v6 = &off_24E06E6B8;
      goto LABEL_7;
    case 5:
      v1 = (_QWORD *)operator new();
      v3 = der_vm_BOOL_from_context();
      v1[2] = 0;
      v1[3] = 0;
      *v1 = &off_24E06E598;
      v1[1] = 1;
      *((_BYTE *)v1 + 32) = v3;
      break;
    case 6:
      v1 = (_QWORD *)operator new();
      v4 = der_vm_data_from_context();
      v1[2] = 0;
      v1[3] = 0;
      v6 = &off_24E06E6E8;
LABEL_7:
      *v1 = v6;
      v1[1] = 1;
      v1[4] = v4;
      v1[5] = v5;
      break;
    default:
      v1 = 0;
      break;
  }
  return v1;
}

void sub_21C68F0B8(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x220780794](v1, 0x10D1C40478F9E52);
  _Unwind_Resume(a1);
}

_QWORD **libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>::~intrusive_shared_ptr(_QWORD **a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *exception;

  v2 = *a1;
  if (v2)
  {
    v3 = v2[1];
    if (v3 <= 0)
    {
      exception = __cxa_allocate_exception(8uLL);
      *exception = "Over-release of an object";
      __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
    }
    v4 = v3 - 1;
    v2[1] = v4;
    if (!v4)
      (*(void (**)(_QWORD *))(*v2 + 8))(v2);
  }
  *a1 = 0;
  return a1;
}

_QWORD *_ZN3TLE12BinaryDataOpI8CEBufferXtlNS_3__8EEEED1Ev(_QWORD *result)
{
  _QWORD *exception;

  *result = &off_24E06E930;
  if (result[1])
  {
    exception = __cxa_allocate_exception(8uLL);
    *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
  }
  return result;
}

void _ZN3TLE12BinaryDataOpI8CEBufferXtlNS_3__8EEEED0Ev(_QWORD *a1)
{
  _QWORD *exception;

  *a1 = &off_24E06E930;
  if (a1[1])
  {
    exception = __cxa_allocate_exception(8uLL);
    *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
  }
  JUMPOUT(0x220780794);
}

_QWORD *_ZN3TLE12BinaryDataOpI8CEBufferXtlNS_3__8EEEE7ExecuteERNS_12EncyclopediaE@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  _QWORD *result;
  _OWORD v5[2];
  uint64_t v6;

  v6 = 0;
  memset(v5, 0, sizeof(v5));
  result = (*(_QWORD *(**)(_OWORD *__return_ptr, uint64_t, _QWORD, _QWORD))(*(_QWORD *)a2 + 24))(v5, a2, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
  if (LODWORD(v5[0]) == 6)
  {
    result = (_QWORD *)CEBuffer_cmp();
    *(_QWORD *)(a3 + 8) = 0;
    *(_QWORD *)(a3 + 16) = 0;
    *(_QWORD *)a3 = 0;
    *(_BYTE *)(a3 + 24) = (_DWORD)result == 0;
  }
  else
  {
    *(_BYTE *)(a3 + 24) = 0;
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = "Invalid fact type for this operation (expected data)";
    *(_DWORD *)a3 = 3;
    *(_QWORD *)(a3 + 16) = 52;
  }
  return result;
}

uint64_t TLE::Operation::shouldIgnore(TLE::Operation *this)
{
  return 0;
}

void TLE::RefCounted::~RefCounted(TLE::RefCounted *this)
{
  _QWORD *exception;

  *(_QWORD *)this = &off_24E06E930;
  if (*((_QWORD *)this + 1))
  {
    exception = __cxa_allocate_exception(8uLL);
    *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
  }
}

{
  _QWORD *exception;

  *(_QWORD *)this = &off_24E06E930;
  if (*((_QWORD *)this + 1))
  {
    exception = __cxa_allocate_exception(8uLL);
    *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
  }
  JUMPOUT(0x220780794);
}

_QWORD *_ZN3TLE11BinaryStrOpI8CEBufferXtlNS_3__7EEEED1Ev(_QWORD *result)
{
  _QWORD *exception;

  *result = &off_24E06E930;
  if (result[1])
  {
    exception = __cxa_allocate_exception(8uLL);
    *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
  }
  return result;
}

void _ZN3TLE11BinaryStrOpI8CEBufferXtlNS_3__7EEEED0Ev(_QWORD *a1)
{
  _QWORD *exception;

  *a1 = &off_24E06E930;
  if (a1[1])
  {
    exception = __cxa_allocate_exception(8uLL);
    *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
  }
  JUMPOUT(0x220780794);
}

_QWORD *_ZN3TLE11BinaryStrOpI8CEBufferXtlNS_3__7EEEE7ExecuteERNS_12EncyclopediaE@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  _QWORD *result;
  _OWORD v5[2];
  uint64_t v6;

  v6 = 0;
  memset(v5, 0, sizeof(v5));
  result = (*(_QWORD *(**)(_OWORD *__return_ptr, uint64_t, _QWORD, _QWORD))(*(_QWORD *)a2 + 24))(v5, a2, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
  if (LODWORD(v5[0]) == 4)
  {
    result = (_QWORD *)CEBuffer_cmp();
    *(_QWORD *)(a3 + 8) = 0;
    *(_QWORD *)(a3 + 16) = 0;
    *(_QWORD *)a3 = 0;
    *(_BYTE *)(a3 + 24) = (_DWORD)result == 0;
  }
  else
  {
    *(_BYTE *)(a3 + 24) = 0;
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = "Invalid fact type for this operation (expected a string)";
    *(_DWORD *)a3 = 3;
    *(_QWORD *)(a3 + 16) = 56;
  }
  return result;
}

_QWORD *_ZN3TLE11BinaryIntOpIxXtlNS_3__6EEEED1Ev(_QWORD *result)
{
  _QWORD *exception;

  *result = &off_24E06E930;
  if (result[1])
  {
    exception = __cxa_allocate_exception(8uLL);
    *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
  }
  return result;
}

void _ZN3TLE11BinaryIntOpIxXtlNS_3__6EEEED0Ev(_QWORD *a1)
{
  _QWORD *exception;

  *a1 = &off_24E06E930;
  if (a1[1])
  {
    exception = __cxa_allocate_exception(8uLL);
    *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
  }
  JUMPOUT(0x220780794);
}

_QWORD *_ZN3TLE11BinaryIntOpIxXtlNS_3__6EEEE7ExecuteERNS_12EncyclopediaE@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  _QWORD *result;
  BOOL v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v10 = 0;
  v8 = 0u;
  v9 = 0u;
  result = (*(_QWORD *(**)(__int128 *__return_ptr, uint64_t, _QWORD, _QWORD))(*(_QWORD *)a2 + 24))(&v8, a2, a1[2], a1[3]);
  if ((_DWORD)v8 == 3 || (_DWORD)v8 == 5)
  {
    v7 = *((_QWORD *)&v9 + 1) == a1[4];
    *(_QWORD *)(a3 + 8) = 0;
    *(_QWORD *)(a3 + 16) = 0;
    *(_QWORD *)a3 = 0;
    *(_BYTE *)(a3 + 24) = v7;
  }
  else
  {
    *(_BYTE *)(a3 + 24) = 0;
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = "Invalid fact type for this operation (expected an integer or BOOL)";
    *(_DWORD *)a3 = 3;
    *(_QWORD *)(a3 + 16) = 66;
  }
  return result;
}

_QWORD *_ZN3TLE11BinaryIntOpIbXtlNS_3__5EEEED1Ev(_QWORD *result)
{
  _QWORD *exception;

  *result = &off_24E06E930;
  if (result[1])
  {
    exception = __cxa_allocate_exception(8uLL);
    *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
  }
  return result;
}

void _ZN3TLE11BinaryIntOpIbXtlNS_3__5EEEED0Ev(_QWORD *a1)
{
  _QWORD *exception;

  *a1 = &off_24E06E930;
  if (a1[1])
  {
    exception = __cxa_allocate_exception(8uLL);
    *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
  }
  JUMPOUT(0x220780794);
}

_QWORD *_ZN3TLE11BinaryIntOpIbXtlNS_3__5EEEE7ExecuteERNS_12EncyclopediaE@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  _QWORD *result;
  BOOL v7;
  BOOL v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v11 = 0;
  v9 = 0u;
  v10 = 0u;
  result = (*(_QWORD *(**)(__int128 *__return_ptr, uint64_t, _QWORD, _QWORD))(*(_QWORD *)a2 + 24))(&v9, a2, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
  if ((_DWORD)v9 == 3 || (_DWORD)v9 == 5)
  {
    v7 = *((_QWORD *)&v10 + 1) == 0;
    v8 = *(_BYTE *)(a1 + 32) != 0;
    *(_QWORD *)(a3 + 8) = 0;
    *(_QWORD *)(a3 + 16) = 0;
    *(_QWORD *)a3 = 0;
    *(_BYTE *)(a3 + 24) = v7 ^ v8;
  }
  else
  {
    *(_BYTE *)(a3 + 24) = 0;
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = "Invalid fact type for this operation (expected an integer or BOOL)";
    *(_DWORD *)a3 = 3;
    *(_QWORD *)(a3 + 16) = 66;
  }
  return result;
}

void TLE::ConstErrorOperation::~ConstErrorOperation(TLE::ConstErrorOperation *this)
{
  _QWORD *exception;

  *(_QWORD *)this = &off_24E06E930;
  if (*((_QWORD *)this + 1))
  {
    exception = __cxa_allocate_exception(8uLL);
    *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
  }
}

{
  _QWORD *exception;

  *(_QWORD *)this = &off_24E06E930;
  if (*((_QWORD *)this + 1))
  {
    exception = __cxa_allocate_exception(8uLL);
    *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
  }
  JUMPOUT(0x220780794);
}

__n128 TLE::ConstErrorOperation::Execute@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 result;

  a2[1].n128_u8[8] = 0;
  result = a1[2];
  *a2 = result;
  a2[1].n128_u64[0] = a1[3].n128_u64[0];
  return result;
}

_QWORD *_ZN3TLE11BinaryIntOpIxXtlNS_3__4EEEED1Ev(_QWORD *result)
{
  _QWORD *exception;

  *result = &off_24E06E930;
  if (result[1])
  {
    exception = __cxa_allocate_exception(8uLL);
    *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
  }
  return result;
}

void _ZN3TLE11BinaryIntOpIxXtlNS_3__4EEEED0Ev(_QWORD *a1)
{
  _QWORD *exception;

  *a1 = &off_24E06E930;
  if (a1[1])
  {
    exception = __cxa_allocate_exception(8uLL);
    *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
  }
  JUMPOUT(0x220780794);
}

_QWORD *_ZN3TLE11BinaryIntOpIxXtlNS_3__4EEEE7ExecuteERNS_12EncyclopediaE@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  _QWORD *result;
  BOOL v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v10 = 0;
  v8 = 0u;
  v9 = 0u;
  result = (*(_QWORD *(**)(__int128 *__return_ptr, uint64_t, _QWORD, _QWORD))(*(_QWORD *)a2 + 24))(&v8, a2, a1[2], a1[3]);
  if ((_DWORD)v8 == 3 || (_DWORD)v8 == 5)
  {
    v7 = (a1[4] & ~*((_QWORD *)&v9 + 1)) == 0;
    *(_QWORD *)(a3 + 8) = 0;
    *(_QWORD *)(a3 + 16) = 0;
    *(_QWORD *)a3 = 0;
    *(_BYTE *)(a3 + 24) = v7;
  }
  else
  {
    *(_BYTE *)(a3 + 24) = 0;
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = "Invalid fact type for this operation (expected an integer or BOOL)";
    *(_DWORD *)a3 = 3;
    *(_QWORD *)(a3 + 16) = 66;
  }
  return result;
}

_QWORD *_ZN3TLE11BinaryIntOpIxXtlNS_3__3EEEED1Ev(_QWORD *result)
{
  _QWORD *exception;

  *result = &off_24E06E930;
  if (result[1])
  {
    exception = __cxa_allocate_exception(8uLL);
    *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
  }
  return result;
}

void _ZN3TLE11BinaryIntOpIxXtlNS_3__3EEEED0Ev(_QWORD *a1)
{
  _QWORD *exception;

  *a1 = &off_24E06E930;
  if (a1[1])
  {
    exception = __cxa_allocate_exception(8uLL);
    *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
  }
  JUMPOUT(0x220780794);
}

_QWORD *_ZN3TLE11BinaryIntOpIxXtlNS_3__3EEEE7ExecuteERNS_12EncyclopediaE@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  _QWORD *result;
  BOOL v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v10 = 0;
  v8 = 0u;
  v9 = 0u;
  result = (*(_QWORD *(**)(__int128 *__return_ptr, uint64_t, _QWORD, _QWORD))(*(_QWORD *)a2 + 24))(&v8, a2, a1[2], a1[3]);
  if ((_DWORD)v8 == 3 || (_DWORD)v8 == 5)
  {
    v7 = *((_QWORD *)&v9 + 1) >= a1[4];
    *(_QWORD *)(a3 + 8) = 0;
    *(_QWORD *)(a3 + 16) = 0;
    *(_QWORD *)a3 = 0;
    *(_BYTE *)(a3 + 24) = v7;
  }
  else
  {
    *(_BYTE *)(a3 + 24) = 0;
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = "Invalid fact type for this operation (expected an integer or BOOL)";
    *(_DWORD *)a3 = 3;
    *(_QWORD *)(a3 + 16) = 66;
  }
  return result;
}

_QWORD *_ZN3TLE11BinaryIntOpIxXtlNS_3__2EEEED1Ev(_QWORD *result)
{
  _QWORD *exception;

  *result = &off_24E06E930;
  if (result[1])
  {
    exception = __cxa_allocate_exception(8uLL);
    *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
  }
  return result;
}

void _ZN3TLE11BinaryIntOpIxXtlNS_3__2EEEED0Ev(_QWORD *a1)
{
  _QWORD *exception;

  *a1 = &off_24E06E930;
  if (a1[1])
  {
    exception = __cxa_allocate_exception(8uLL);
    *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
  }
  JUMPOUT(0x220780794);
}

_QWORD *_ZN3TLE11BinaryIntOpIxXtlNS_3__2EEEE7ExecuteERNS_12EncyclopediaE@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  _QWORD *result;
  BOOL v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v10 = 0;
  v8 = 0u;
  v9 = 0u;
  result = (*(_QWORD *(**)(__int128 *__return_ptr, uint64_t, _QWORD, _QWORD))(*(_QWORD *)a2 + 24))(&v8, a2, a1[2], a1[3]);
  if ((_DWORD)v8 == 3 || (_DWORD)v8 == 5)
  {
    v7 = *((_QWORD *)&v9 + 1) > a1[4];
    *(_QWORD *)(a3 + 8) = 0;
    *(_QWORD *)(a3 + 16) = 0;
    *(_QWORD *)a3 = 0;
    *(_BYTE *)(a3 + 24) = v7;
  }
  else
  {
    *(_BYTE *)(a3 + 24) = 0;
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = "Invalid fact type for this operation (expected an integer or BOOL)";
    *(_DWORD *)a3 = 3;
    *(_QWORD *)(a3 + 16) = 66;
  }
  return result;
}

_QWORD *_ZN3TLE11BinaryIntOpIxXtlNS_3__1EEEED1Ev(_QWORD *result)
{
  _QWORD *exception;

  *result = &off_24E06E930;
  if (result[1])
  {
    exception = __cxa_allocate_exception(8uLL);
    *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
  }
  return result;
}

void _ZN3TLE11BinaryIntOpIxXtlNS_3__1EEEED0Ev(_QWORD *a1)
{
  _QWORD *exception;

  *a1 = &off_24E06E930;
  if (a1[1])
  {
    exception = __cxa_allocate_exception(8uLL);
    *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
  }
  JUMPOUT(0x220780794);
}

_QWORD *_ZN3TLE11BinaryIntOpIxXtlNS_3__1EEEE7ExecuteERNS_12EncyclopediaE@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  _QWORD *result;
  BOOL v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v10 = 0;
  v8 = 0u;
  v9 = 0u;
  result = (*(_QWORD *(**)(__int128 *__return_ptr, uint64_t, _QWORD, _QWORD))(*(_QWORD *)a2 + 24))(&v8, a2, a1[2], a1[3]);
  if ((_DWORD)v8 == 3 || (_DWORD)v8 == 5)
  {
    v7 = *((_QWORD *)&v9 + 1) <= a1[4];
    *(_QWORD *)(a3 + 8) = 0;
    *(_QWORD *)(a3 + 16) = 0;
    *(_QWORD *)a3 = 0;
    *(_BYTE *)(a3 + 24) = v7;
  }
  else
  {
    *(_BYTE *)(a3 + 24) = 0;
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = "Invalid fact type for this operation (expected an integer or BOOL)";
    *(_DWORD *)a3 = 3;
    *(_QWORD *)(a3 + 16) = 66;
  }
  return result;
}

_QWORD *_ZN3TLE11BinaryIntOpIxXtlNS_3__0EEEED1Ev(_QWORD *result)
{
  _QWORD *exception;

  *result = &off_24E06E930;
  if (result[1])
  {
    exception = __cxa_allocate_exception(8uLL);
    *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
  }
  return result;
}

void _ZN3TLE11BinaryIntOpIxXtlNS_3__0EEEED0Ev(_QWORD *a1)
{
  _QWORD *exception;

  *a1 = &off_24E06E930;
  if (a1[1])
  {
    exception = __cxa_allocate_exception(8uLL);
    *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
  }
  JUMPOUT(0x220780794);
}

_QWORD *_ZN3TLE11BinaryIntOpIxXtlNS_3__0EEEE7ExecuteERNS_12EncyclopediaE@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  _QWORD *result;
  BOOL v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v10 = 0;
  v8 = 0u;
  v9 = 0u;
  result = (*(_QWORD *(**)(__int128 *__return_ptr, uint64_t, _QWORD, _QWORD))(*(_QWORD *)a2 + 24))(&v8, a2, a1[2], a1[3]);
  if ((_DWORD)v8 == 3 || (_DWORD)v8 == 5)
  {
    v7 = *((_QWORD *)&v9 + 1) < a1[4];
    *(_QWORD *)(a3 + 8) = 0;
    *(_QWORD *)(a3 + 16) = 0;
    *(_QWORD *)a3 = 0;
    *(_BYTE *)(a3 + 24) = v7;
  }
  else
  {
    *(_BYTE *)(a3 + 24) = 0;
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = "Invalid fact type for this operation (expected an integer or BOOL)";
    *(_DWORD *)a3 = 3;
    *(_QWORD *)(a3 + 16) = 66;
  }
  return result;
}

BOOL TLE::getLowestCompatibleVersionFor(uint64_t a1)
{
  return a1 == 1;
}

uint64_t TLE::LWCR::LWCR(uint64_t this)
{
  *(_BYTE *)(this + 80) = 0;
  *(_BYTE *)(this + 57) = 0;
  *(_QWORD *)(this + 8) = 0;
  *(_QWORD *)(this + 16) = 0;
  *(_QWORD *)this = 0;
  return this;
}

{
  *(_BYTE *)(this + 80) = 0;
  *(_BYTE *)(this + 57) = 0;
  *(_QWORD *)(this + 8) = 0;
  *(_QWORD *)(this + 16) = 0;
  *(_QWORD *)this = 0;
  return this;
}

char *TLE::LWCR::requirements(TLE::LWCR *this)
{
  char *v1;

  v1 = (char *)this + 24;
  if (der_vm_context_is_valid())
    return v1;
  else
    return 0;
}

uint64_t TLE::LWCR::version(TLE::LWCR *this)
{
  return *(_QWORD *)this;
}

uint64_t TLE::LWCR::compatVersion(TLE::LWCR *this)
{
  return *((_QWORD *)this + 1);
}

uint64_t TLE::LWCR::constraintCategory(TLE::LWCR *this)
{
  return *((_QWORD *)this + 2);
}

uint64_t TLE::LWCR::loadFromCE@<X0>(TLE::LWCR *this@<X0>, CEQueryContext *a2@<X1>, uint64_t a3@<X8>)
{
  CERuntime *runtime;
  uint64_t result;
  const char *v7;
  uint64_t v8;
  uint64_t (*v9)(CERuntime *, const char *, ...);
  _QWORD *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  runtime = a2->der_context.runtime;
  result = der_vm_select_int_for_key();
  if (!(_DWORD)result || (result = der_vm_select_int_for_key(), (result & 1) == 0))
  {
    v9 = (uint64_t (*)(CERuntime *, const char *, ...))*((_QWORD *)runtime + 3);
    if (v9)
      result = v9(runtime, "[%s]: %s\n", "loadFromCE", "LWCR: invalid version / compatible version fields");
    *(_DWORD *)a3 = 7;
    v7 = "LWCRs are not encoded correctly";
    v8 = 31;
    goto LABEL_8;
  }
  if (*((uint64_t *)this + 1) >= 2)
  {
    *(_DWORD *)a3 = 6;
    v7 = "This LWCR is not compatible with this runtime";
    v8 = 45;
LABEL_8:
    *(_QWORD *)(a3 + 8) = v7;
    *(_QWORD *)(a3 + 16) = v8;
    return result;
  }
  v10 = (_QWORD *)((char *)this + 16);
  result = der_vm_select_int_for_key();
  if ((_DWORD)result && (*v10 & 0x8000000000000000) != 0)
  {
    *(_DWORD *)a3 = 7;
    v7 = "LWCRs constraint category cannot be less that zero";
    v8 = 50;
    goto LABEL_8;
  }
  der_vm_execute_nocopy();
  if (der_vm_context_is_valid())
  {
    result = der_vm_CEType_from_context();
    if ((_DWORD)result != 1)
    {
      *(_DWORD *)a3 = 7;
      v7 = "LWCRs 'requirements' field is not a dictionary";
      v8 = 46;
      goto LABEL_8;
    }
  }
  if (!*v10)
  {
    result = der_vm_context_is_valid();
    if ((result & 1) == 0)
    {
      *(_DWORD *)a3 = 7;
      v7 = "LWCRs do not specify a constraint category or explicit requirements";
      v8 = 67;
      goto LABEL_8;
    }
  }
  result = der_vm_context_is_valid();
  if ((_DWORD)result)
  {
    result = CEConjureContextFromDER();
    *(_OWORD *)((char *)this + 24) = v11;
    *(_OWORD *)((char *)this + 40) = v12;
    *(_OWORD *)((char *)this + 56) = v13;
    *(_OWORD *)((char *)this + 72) = v14;
  }
  *(_DWORD *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  return result;
}

void TLE::Executor::getOperationsFromCE(TLE::Executor *this@<X0>, CEQueryContext *a2@<X1>, uint64_t a3@<X8>)
{
  __int128 v4;
  const char *v5;
  _QWORD *v6;
  unint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD **v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *exception;
  der_vm_context v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  if (!a2)
  {
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_DWORD *)a3 = 2;
    *(_QWORD *)(a3 + 8) = "Null query context";
    *(_QWORD *)(a3 + 16) = 18;
    return;
  }
  v4 = *(_OWORD *)&a2->der_context.lookup.index_count;
  *(_OWORD *)&v18.runtime = *(_OWORD *)&a2->der_context.runtime;
  *(_OWORD *)&v18.lookup.index_count = v4;
  *(_OWORD *)&v18.sorted = *(_OWORD *)&a2->der_context.sorted;
  v18.var0.ccstate.der_end = a2->der_context.var0.ccstate.der_end;
  v21 = 0;
  v19 = 0u;
  v20 = 0u;
  TLE::Executor::getDependentOpsFromDictionary((uint64_t)this, &v18, (uint64_t)&v19);
  if ((_DWORD)v19)
  {
    *(_OWORD *)a3 = v19;
    v6 = (_QWORD *)*((_QWORD *)&v20 + 1);
    *(_QWORD *)(a3 + 16) = v20;
    *(_QWORD *)(a3 + 24) = 0;
    if (!v6)
      return;
  }
  else
  {
    if ((_DWORD)v21 != 1)
    {
      v15 = operator new();
      *(_QWORD *)(v15 + 16) = 0;
      *(_QWORD *)(v15 + 24) = 0;
      *(_QWORD *)v15 = &off_24E06E9E0;
      *(_QWORD *)(v15 + 8) = 1;
      *(_QWORD *)(v15 + 32) = *((_QWORD *)&v20 + 1);
      *(_DWORD *)(v15 + 40) = v21;
      *(_QWORD *)a3 = 0;
      *(_QWORD *)(a3 + 8) = 0;
      *(_QWORD *)(a3 + 16) = 0;
      *(_QWORD *)(a3 + 24) = v15;
      return;
    }
    v6 = (_QWORD *)*((_QWORD *)&v20 + 1);
    if (!*((_QWORD *)&v20 + 1))
      goto LABEL_26;
    v7 = 8 * v21;
    if (*((_QWORD *)&v20 + 1) + v7 < *((_QWORD *)&v20 + 1) || HIDWORD(v7))
      os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range", v5);
    if ((v7 & 0xFFFFFFF8) == 0)
LABEL_26:
      os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outside of the bounds set originally", v5);
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
    v8 = (_QWORD *)*v6;
    *(_QWORD *)(a3 + 16) = 0;
    *(_QWORD *)(a3 + 24) = v8;
    if (v8)
    {
      v9 = v8[1];
      if (v9 < 1)
      {
        exception = __cxa_allocate_exception(8uLL);
        *exception = "Attempted resurection of an object";
        __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
      }
      v8[1] = v9 + 1;
    }
  }
  if ((_DWORD)v21)
  {
    v10 = 8 * v21;
    v11 = (_QWORD **)v6;
    do
    {
      v12 = *v11;
      if (*v11)
      {
        v13 = v12[1];
        if (v13 <= 0)
        {
          v16 = __cxa_allocate_exception(8uLL);
          *v16 = "Over-release of an object";
          __cxa_throw(v16, MEMORY[0x24BEDB718], 0);
        }
        v14 = v13 - 1;
        v12[1] = v14;
        if (!v14)
          (*(void (**)(_QWORD *))(*v12 + 8))(v12);
      }
      *v11++ = 0;
      v10 -= 8;
    }
    while (v10);
  }
  free(v6);
}

void sub_21C690450(_Unwind_Exception *a1)
{
  uint64_t v1;

  TLE::Tuple<TLE::Error,libkern::safe_allocation<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>,os_detail::IOKit_typed_allocator<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>,os_detail::panic_trapping_policy>>::~Tuple(v1 - 80);
  _Unwind_Resume(a1);
}

BOOL TLE::matchRestrictList(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  _BOOL8 result;
  BOOL v7;

  if (!a2)
    return 0;
  v3 = a2 - 1;
  v4 = a3 + 8;
  do
  {
    v5 = CEBuffer_cmp();
    result = v5 == 0;
    if (v5)
      v7 = v3 == 0;
    else
      v7 = 1;
    --v3;
    v4 += 16;
  }
  while (!v7);
  return result;
}

void TLE::AndOperation::~AndOperation(TLE::AndOperation *this)
{
  TLE::AndOperation::~AndOperation(this);
  JUMPOUT(0x220780794);
}

{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD **v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *exception;
  _QWORD *v10;

  *(_QWORD *)this = &off_24E06E9E0;
  v2 = (void *)*((_QWORD *)this + 4);
  if (v2)
  {
    v3 = *((unsigned int *)this + 10);
    if ((_DWORD)v3)
    {
      v4 = 8 * v3;
      v5 = (_QWORD **)*((_QWORD *)this + 4);
      do
      {
        v6 = *v5;
        if (*v5)
        {
          v7 = v6[1];
          if (v7 <= 0)
          {
            exception = __cxa_allocate_exception(8uLL);
            *exception = "Over-release of an object";
            __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
          }
          v8 = v7 - 1;
          v6[1] = v8;
          if (!v8)
            (*(void (**)(_QWORD *))(*v6 + 8))(v6);
        }
        *v5++ = 0;
        v4 -= 8;
      }
      while (v4);
    }
    free(v2);
  }
  *(_QWORD *)this = &off_24E06E930;
  if (*((_QWORD *)this + 1))
  {
    v10 = __cxa_allocate_exception(8uLL);
    *v10 = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(v10, MEMORY[0x24BEDB718], 0);
  }
}

_QWORD *TLE::AndOperation::Execute@<X0>(_QWORD *result@<X0>, const char *a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _BOOL4 v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;

  v5 = result[4];
  if (v5)
  {
    v6 = v5 + 8 * *((unsigned int *)result + 10);
    if (v6 < v5 || (8 * (unint64_t)*((unsigned int *)result + 10)) >> 32)
      os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range", a2);
    v8 = (v6 - (unsigned __int128)v5) >> 64;
    v7 = 8 * *((unsigned int *)result + 10);
    if ((v8 & 1) != (unint64_t)(int)v7 >> 63 || v7 != (int)v7)
      os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"The offset of the pointer inside its valid memory range can't be represented using int32_t", a2);
    v10 = (8 * *((_DWORD *)result + 10));
  }
  else
  {
    v10 = 0;
    LODWORD(v7) = 0;
  }
  v11 = (int)v7;
  v12 = (uint64_t)(int)v7 >> 63;
  v13 = (_QWORD *)(v5 + v11);
  if (__CFADD__(v5, v11))
    v14 = v12 + 1;
  else
    v14 = v12;
  v16 = v14 << 63 >> 63 != v14 || v14 << 63 >> 63 == -1;
  while (1)
  {
    v17 = (_QWORD *)(v5 + (v10 >> 32));
    if (__CFADD__(v5, v10 >> 32))
      v18 = (v10 >> 63) + 1;
    else
      v18 = v10 >> 63;
    v19 = v18 << 63 >> 63;
    if (v19 != v18 || v19 < 0 || v16)
      os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"This bounded_ptr is pointing to memory outside of what can be represented by a native pointer.", a2);
    if (v17 == v13)
    {
      *(_QWORD *)a3 = 0;
      *(_QWORD *)(a3 + 8) = 0;
      *(_QWORD *)(a3 + 16) = 0;
      *(_BYTE *)(a3 + 24) = 1;
      return result;
    }
    if (v10 < 0 || HIDWORD(v10) + 8 > v10)
      os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outside of the bounds set originally", a2);
    v20 = 0u;
    v21 = 0u;
    result = (*(_QWORD *(**)(__int128 *__return_ptr, _QWORD, const char *))(*(_QWORD *)*v17 + 16))(&v20, *v17, a2);
    if ((_DWORD)v20)
    {
      *(_BYTE *)(a3 + 24) = 0;
      *(_OWORD *)a3 = v20;
      *(_QWORD *)(a3 + 16) = v21;
      return result;
    }
    if (!BYTE8(v21))
      break;
    if ((unint64_t)((v10 >> 32) - 2147483640) < 0xFFFFFFFF00000000)
      os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator+=(n): Adding the specified number of bytes to the offset representing the current position would overflow.", a2);
    v10 += 0x800000000;
  }
  *(_QWORD *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  *(_BYTE *)(a3 + 24) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  return result;
}

void TLE::OrOperation::~OrOperation(TLE::OrOperation *this)
{
  TLE::OrOperation::~OrOperation(this);
  JUMPOUT(0x220780794);
}

{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD **v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *exception;
  _QWORD *v10;

  *(_QWORD *)this = &off_24E06E9B0;
  v2 = (void *)*((_QWORD *)this + 4);
  if (v2)
  {
    v3 = *((unsigned int *)this + 10);
    if ((_DWORD)v3)
    {
      v4 = 8 * v3;
      v5 = (_QWORD **)*((_QWORD *)this + 4);
      do
      {
        v6 = *v5;
        if (*v5)
        {
          v7 = v6[1];
          if (v7 <= 0)
          {
            exception = __cxa_allocate_exception(8uLL);
            *exception = "Over-release of an object";
            __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
          }
          v8 = v7 - 1;
          v6[1] = v8;
          if (!v8)
            (*(void (**)(_QWORD *))(*v6 + 8))(v6);
        }
        *v5++ = 0;
        v4 -= 8;
      }
      while (v4);
    }
    free(v2);
  }
  *(_QWORD *)this = &off_24E06E930;
  if (*((_QWORD *)this + 1))
  {
    v10 = __cxa_allocate_exception(8uLL);
    *v10 = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(v10, MEMORY[0x24BEDB718], 0);
  }
}

uint64_t TLE::OrOperation::Execute@<X0>(uint64_t result@<X0>, const char *a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _BOOL4 v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;

  v5 = *(_QWORD *)(result + 32);
  if (v5)
  {
    v6 = v5 + 8 * *(unsigned int *)(result + 40);
    if (v6 < v5 || (8 * (unint64_t)*(unsigned int *)(result + 40)) >> 32)
      os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range", a2);
    v8 = (v6 - (unsigned __int128)v5) >> 64;
    v7 = 8 * *(unsigned int *)(result + 40);
    if ((v8 & 1) != (unint64_t)(int)v7 >> 63 || v7 != (int)v7)
      os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"The offset of the pointer inside its valid memory range can't be represented using int32_t", a2);
    v10 = (8 * *(_DWORD *)(result + 40));
  }
  else
  {
    v10 = 0;
    LODWORD(v7) = 0;
  }
  v11 = (int)v7;
  v12 = (uint64_t)(int)v7 >> 63;
  v13 = (_QWORD *)(v5 + v11);
  if (__CFADD__(v5, v11))
    v14 = v12 + 1;
  else
    v14 = v12;
  v16 = v14 << 63 >> 63 != v14 || v14 << 63 >> 63 == -1;
  while (1)
  {
    v17 = (_QWORD *)(v5 + (v10 >> 32));
    if (__CFADD__(v5, v10 >> 32))
      v18 = (v10 >> 63) + 1;
    else
      v18 = v10 >> 63;
    v19 = v18 << 63 >> 63;
    if (v19 != v18 || v19 < 0 || v16)
      os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"This bounded_ptr is pointing to memory outside of what can be represented by a native pointer.", a2);
    if (v17 == v13)
    {
      *(_QWORD *)a3 = 0;
      *(_QWORD *)(a3 + 8) = 0;
      *(_BYTE *)(a3 + 24) = 0;
      *(_QWORD *)(a3 + 16) = 0;
      return result;
    }
    if (v10 < 0 || HIDWORD(v10) + 8 > v10)
      os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outside of the bounds set originally", a2);
    v20 = 0u;
    v21 = 0u;
    result = (uint64_t)(*(_QWORD *(**)(__int128 *__return_ptr, _QWORD, const char *))(*(_QWORD *)*v17 + 16))(&v20, *v17, a2);
    if ((_DWORD)v20)
    {
      *(_BYTE *)(a3 + 24) = 0;
      *(_OWORD *)a3 = v20;
      *(_QWORD *)(a3 + 16) = v21;
      return result;
    }
    result = (*(uint64_t (**)(_QWORD))(*(_QWORD *)*v17 + 24))(*v17);
    if ((result & 1) == 0)
    {
      if (BYTE8(v21))
        break;
    }
    if ((unint64_t)((v10 >> 32) - 2147483640) < 0xFFFFFFFF00000000)
      os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator+=(n): Adding the specified number of bytes to the offset representing the current position would overflow.", a2);
    v10 += 0x800000000;
  }
  *(_QWORD *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  *(_BYTE *)(a3 + 24) = 1;
  return result;
}

void TLE::InOperation::~InOperation(TLE::InOperation *this)
{
  _QWORD *exception;

  *(_QWORD *)this = &off_24E06E930;
  if (*((_QWORD *)this + 1))
  {
    exception = __cxa_allocate_exception(8uLL);
    *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
  }
}

{
  _QWORD *exception;

  *(_QWORD *)this = &off_24E06E930;
  if (*((_QWORD *)this + 1))
  {
    exception = __cxa_allocate_exception(8uLL);
    *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
  }
  JUMPOUT(0x220780794);
}

void TLE::InOperation::Execute(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v4;
  _OWORD v5[2];
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2000000000;
  v10 = 0;
  v6 = 0;
  memset(v5, 0, sizeof(v5));
  (*(void (**)(_OWORD *__return_ptr, uint64_t, _QWORD, _QWORD))(*(_QWORD *)a2 + 24))(v5, a2, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
  if (LODWORD(v5[0]) == 3 || LODWORD(v5[0]) == 4 || LODWORD(v5[0]) == 6)
  {
    der_vm_iterate_b();
    v4 = v8;
    *(_QWORD *)(a3 + 8) = 0;
    *(_QWORD *)(a3 + 16) = 0;
    *(_QWORD *)a3 = 0;
    *(_BYTE *)(a3 + 24) = *((_BYTE *)v4 + 24);
  }
  else
  {
    *(_BYTE *)(a3 + 24) = 0;
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = "In Operation expected the Fact to be an integer, string or data";
    *(_DWORD *)a3 = 3;
    *(_QWORD *)(a3 + 16) = 63;
  }
  _Block_object_dispose(&v7, 8);
}

void sub_21C690D34(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3TLE11InOperation7ExecuteERNS_12EncyclopediaE_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;

  if (*(_DWORD *)(a2 + 116) != 3)
    return 1;
  v3 = der_vm_integer_from_context();
  result = 1;
  if (v3 == *(_QWORD *)(a1 + 40))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    return 0;
  }
  return result;
}

uint64_t ___ZN3TLE11InOperation7ExecuteERNS_12EncyclopediaE_block_invoke_2(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t result;

  if (*(_DWORD *)(a2 + 116) != 4)
    return 1;
  der_vm_string_from_context();
  v3 = CEBuffer_cmp();
  result = 1;
  if (!v3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    return 0;
  }
  return result;
}

uint64_t ___ZN3TLE11InOperation7ExecuteERNS_12EncyclopediaE_block_invoke_3(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t result;

  if (*(_DWORD *)(a2 + 116) != 6)
    return 1;
  der_vm_data_from_context();
  v3 = CEBuffer_cmp();
  result = 1;
  if (!v3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    return 0;
  }
  return result;
}

void TLE::QueryOperation::~QueryOperation(TLE::QueryOperation *this)
{
  _QWORD *exception;

  *(_QWORD *)this = &off_24E06E930;
  if (*((_QWORD *)this + 1))
  {
    exception = __cxa_allocate_exception(8uLL);
    *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
  }
}

{
  _QWORD *exception;

  *(_QWORD *)this = &off_24E06E930;
  if (*((_QWORD *)this + 1))
  {
    exception = __cxa_allocate_exception(8uLL);
    *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
  }
  JUMPOUT(0x220780794);
}

void TLE::QueryOperation::Execute(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  char is_valid;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  __n128 (*v13)(uint64_t, uint64_t);
  uint64_t (*v14)();
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[5];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
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
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v25 = 0;
  v23 = 0u;
  v24 = 0u;
  (*(void (**)(__int128 *__return_ptr, uint64_t, _QWORD, _QWORD))(*(_QWORD *)a2 + 24))(&v23, a2, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
  if ((_DWORD)v23 == 1)
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
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
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x6002000000;
    v18[3] = __Block_byref_object_copy__33;
    v18[4] = __Block_byref_object_dispose__34;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0;
    v5 = *(_OWORD *)(*((_QWORD *)&v24 + 1) + 16);
    v4 = *(_OWORD *)(*((_QWORD *)&v24 + 1) + 32);
    v6 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 48);
    v19 = **((_OWORD **)&v24 + 1);
    v22 = v6;
    v21 = v4;
    v20 = v5;
    v10 = 0;
    v11 = &v10;
    v12 = 0x4002000000;
    v13 = __Block_byref_object_copy__5;
    v14 = __Block_byref_object_dispose__6;
    v16 = 0;
    v17 = 0;
    v15 = 0;
    v7 = der_vm_iterate_b();
    v8 = v11 + 5;
    if (*((_DWORD *)v11 + 10))
    {
      *(_BYTE *)(a3 + 24) = 0;
      *(_OWORD *)a3 = *(_OWORD *)v8;
      *(_QWORD *)(a3 + 16) = v8[2];
    }
    else if (v7 == *MEMORY[0x24BED3CF0])
    {
      is_valid = der_vm_context_is_valid();
      *(_QWORD *)a3 = 0;
      *(_QWORD *)(a3 + 8) = 0;
      *(_QWORD *)(a3 + 16) = 0;
      *(_BYTE *)(a3 + 24) = is_valid;
    }
    else
    {
      *(_BYTE *)(a3 + 24) = 0;
      *(_QWORD *)a3 = 0;
      *(_QWORD *)(a3 + 8) = "Attempted to execute a non-iterable query";
      *(_DWORD *)a3 = 6;
      *(_QWORD *)(a3 + 16) = 41;
    }
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(v18, 8);
  }
  else
  {
    *(_BYTE *)(a3 + 24) = 0;
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = "Query Operation expected the Fact to be a CoreEntitlements dictionary";
    *(_DWORD *)a3 = 3;
    *(_QWORD *)(a3 + 16) = 69;
  }
}

void sub_21C691208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__33(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)(a2 + 40);
  v3 = *(_OWORD *)(a2 + 56);
  v4 = *(_OWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 72) = v4;
  *(_OWORD *)(a1 + 56) = v3;
  *(__n128 *)(a1 + 40) = result;
  return result;
}

__n128 __Block_byref_object_copy__5(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(__n128 *)(a1 + 40) = result;
  return result;
}

uint64_t ___ZN3TLE14QueryOperation7ExecuteERNS_12EncyclopediaE_block_invoke(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  der_vm_execute_nocopy();
  der_vm_execute_nocopy();
  v2 = der_vm_integer_from_context() & 0xBFFFFFFFFFFFFFFFLL;
  **(_QWORD **)(a1 + 48) = v2;
  if (v2 > 0xB)
    goto LABEL_12;
  if (((1 << v2) & 0x35A) == 0)
  {
    if (((1 << v2) & 0xC80) != 0)
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) = der_vm_integer_from_context();
      goto LABEL_8;
    }
    if (v2 == 5)
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) = der_vm_BOOL_from_context();
      goto LABEL_8;
    }
LABEL_12:
    result = 0;
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    *(_DWORD *)(v8 + 40) = 1;
    *(_QWORD *)(v8 + 48) = "Attempted to execute unknown CoreEntitlements operation";
    *(_QWORD *)(v8 + 56) = 55;
    return result;
  }
  v3 = der_vm_string_from_context();
  v4 = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(v4 + 8) = v3;
  *(_QWORD *)(v4 + 16) = v5;
  **(_QWORD **)(a1 + 48) |= 0x4000000000000000uLL;
LABEL_8:
  if (der_vm_context_is_valid())
  {
    der_vm_execute_nocopy();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(_OWORD *)(v6 + 40) = v9;
    *(_OWORD *)(v6 + 56) = v10;
    *(_OWORD *)(v6 + 72) = v11;
    *(_QWORD *)(v6 + 88) = v12;
  }
  return 1;
}

void TLE::OptionalOperation::~OptionalOperation(TLE::OptionalOperation *this)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *exception;

  *(_QWORD *)this = &off_24E06EA40;
  v2 = (_QWORD *)*((_QWORD *)this + 4);
  if (v2)
  {
    v3 = v2[1];
    if (v3 <= 0)
    {
      exception = __cxa_allocate_exception(8uLL);
      *exception = "Over-release of an object";
      __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
    }
    v4 = v3 - 1;
    v2[1] = v4;
    if (!v4)
      (*(void (**)(_QWORD *))(*v2 + 8))(v2);
  }
  *((_QWORD *)this + 4) = 0;
  *(_QWORD *)this = &off_24E06E930;
  if (*((_QWORD *)this + 1))
  {
    v5 = __cxa_allocate_exception(8uLL);
    *v5 = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(v5, MEMORY[0x24BEDB718], 0);
  }
}

{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *exception;

  *(_QWORD *)this = &off_24E06EA40;
  v2 = (_QWORD *)*((_QWORD *)this + 4);
  if (v2)
  {
    v3 = v2[1];
    if (v3 <= 0)
    {
      exception = __cxa_allocate_exception(8uLL);
      *exception = "Over-release of an object";
      __cxa_throw(exception, MEMORY[0x24BEDB718], 0);
    }
    v4 = v3 - 1;
    v2[1] = v4;
    if (!v4)
      (*(void (**)(_QWORD *))(*v2 + 8))(v2);
  }
  *((_QWORD *)this + 4) = 0;
  *(_QWORD *)this = &off_24E06E930;
  if (*((_QWORD *)this + 1))
  {
    v5 = __cxa_allocate_exception(8uLL);
    *v5 = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(v5, MEMORY[0x24BEDB718], 0);
  }
  JUMPOUT(0x220780794);
}

double TLE::OptionalOperation::Execute@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double result;
  char v6;
  __int128 v7;
  __int128 v8;

  v7 = 0u;
  v8 = 0u;
  (*(void (**)(__int128 *__return_ptr))(**(_QWORD **)(a1 + 32) + 16))(&v7);
  if ((_DWORD)v7)
  {
    if ((_DWORD)v7 != 5 && (_DWORD)v7 != 1)
    {
      *(_BYTE *)(a2 + 24) = 0;
      result = *(double *)&v7;
      *(_OWORD *)a2 = v7;
      *(_QWORD *)(a2 + 16) = v8;
      return result;
    }
    v6 = 1;
    *(_BYTE *)(a1 + 40) = 1;
    *(_QWORD *)(a2 + 8) = 0;
    *(_QWORD *)(a2 + 16) = 0;
    *(_QWORD *)a2 = 0;
  }
  else
  {
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    *(_QWORD *)(a2 + 16) = 0;
    v6 = BYTE8(v8);
  }
  *(_BYTE *)(a2 + 24) = v6;
  return result;
}

uint64_t TLE::OptionalOperation::shouldIgnore(TLE::OptionalOperation *this)
{
  return *((unsigned __int8 *)this + 40);
}

void sub_21C6917B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)LWCR;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_21C691AF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_21C691D3C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21C691DF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)LWCRFact;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_21C691E78(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21C691F50(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21C691FE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21C6920C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21C692154(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21C6923A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id a30)
{
  void *v30;
  void *v31;
  uint64_t v32;

  TLE::Tuple<TLE::Error,libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>::~Tuple((uint64_t)&a9);
  TLE::CallbackEncyclopedia::~CallbackEncyclopedia((id *)(v32 - 160));

  _Unwind_Resume(a1);
}

void sub_21C692484(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21C69252C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21C6925AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void TLE::CallbackEncyclopedia::~CallbackEncyclopedia(id *this)
{

}

{

  JUMPOUT(0x220780794);
}

uint64_t TLE::CallbackEncyclopedia::getFact(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

uint64_t TLE::CallbackEncyclopedia::resolveFact(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 16) + 16))();
}

uint64_t TLE::CallbackEncyclopedia::hasFactFor(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 24) + 16))();
}

uint64_t CEBuffer_cmp()
{
  return MEMORY[0x24BED3C38]();
}

uint64_t CEConjureContextFromDER()
{
  return MEMORY[0x24BED3C48]();
}

uint64_t CEManagedContextFromCFData()
{
  return MEMORY[0x24BED3C50]();
}

uint64_t CEManagedContextFromCFDataWithOptions()
{
  return MEMORY[0x24BED3C58]();
}

uint64_t CEQueryContextToCFDictionary()
{
  return MEMORY[0x24BED3C60]();
}

uint64_t CEReleaseManagedContext()
{
  return MEMORY[0x24BED3C68]();
}

uint64_t CESerializeCFDictionary()
{
  return MEMORY[0x24BED3C80]();
}

uint64_t CESerializeCFDictionaryWithOptions()
{
  return MEMORY[0x24BED3C88]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete()
{
  return off_24E06E340();
}

uint64_t operator new()
{
  return off_24E06E348();
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

uint64_t der_vm_CEType_from_context()
{
  return MEMORY[0x24BED3C98]();
}

uint64_t der_vm_BOOL_from_context()
{
  return MEMORY[0x24BED3CA0]();
}

uint64_t der_vm_context_is_valid()
{
  return MEMORY[0x24BED3CA8]();
}

uint64_t der_vm_data_from_context()
{
  return MEMORY[0x24BED3CB0]();
}

uint64_t der_vm_execute_nocopy()
{
  return MEMORY[0x24BED3CC0]();
}

uint64_t der_vm_integer_from_context()
{
  return MEMORY[0x24BED3CC8]();
}

uint64_t der_vm_iterate_b()
{
  return MEMORY[0x24BED3CD8]();
}

uint64_t der_vm_select_int_for_key()
{
  return MEMORY[0x24BED3CE0]();
}

uint64_t der_vm_string_from_context()
{
  return MEMORY[0x24BED3CE8]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

