@implementation ZNK3ctu20SharedSynchronizableI19QMITransportServiceE20execute

_QWORD *___ZNK3ctu20SharedSynchronizableI19QMITransportServiceE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke(uint64_t a1)
{
  return (*(_QWORD *(**)(_QWORD *__return_ptr))(**(_QWORD **)(a1 + 40) + 16))(*(_QWORD **)(a1 + 40));
}

uint8_t *___ZNK3ctu20SharedSynchronizableI19QMITransportServiceE20execute_wrapped_syncIZNS1_6engageEvE3__0EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS5__block_invoke(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  NSObject *v3;
  _QWORD *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  dispatch_object_t *v10;
  NSObject *v11;
  char *v12;
  uint8_t *result;
  uint64_t v14;
  __int128 v15;
  uint8_t buf[24];
  uint8_t *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v1 = *(uint64_t **)(a1 + 40);
  v2 = *v1;
  v3 = *(NSObject **)(*v1 + 40);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BF335000, v3, OS_LOG_TYPE_DEFAULT, "#I ----------------- Engaging ----------------", buf, 2u);
  }
  v4 = *(_QWORD **)(v2 + 144);
  v5 = (uint64_t *)v1[1];
  v7 = *v5;
  v6 = v5[1];
  if (v6)
  {
    v8 = (unint64_t *)(v6 + 16);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  v10 = (dispatch_object_t *)v1[2];
  v11 = *v10;
  if (*v10)
  {
    dispatch_retain(*v10);
    dispatch_group_enter(v11);
  }
  v15 = *(_OWORD *)(v1 + 3);
  v12 = (char *)operator new(0x38uLL);
  *(_QWORD *)v12 = &off_1E790C3F8;
  *((_QWORD *)v12 + 1) = v2;
  *((_QWORD *)v12 + 2) = v7;
  *((_QWORD *)v12 + 3) = v6;
  *((_QWORD *)v12 + 4) = v11;
  *(_OWORD *)(v12 + 40) = v15;
  v17 = (uint8_t *)v12;
  RouterIPCController::engage(v4, buf);
  result = v17;
  if (v17 == buf)
  {
    v14 = 4;
    result = buf;
  }
  else
  {
    if (!v17)
      return result;
    v14 = 5;
  }
  return (uint8_t *)(*(uint64_t (**)(void))(*(_QWORD *)result + 8 * v14))();
}

std::string *___ZNK3ctu20SharedSynchronizableI19QMITransportServiceE20execute_wrapped_syncIZZZNS1_6engageEvENK3__0clEvENKUlbNSt3__112basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEEE_clEbSB_EUlvE_EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOSE__block_invoke(std::string *result)
{
  std::string::size_type v1;
  int v2;
  uint64_t v3;
  int v4;
  const std::string::value_type *v5;
  std::string::size_type v6;

  v1 = result[1].__r_.__value_.__r.__words[2];
  v2 = **(unsigned __int8 **)(v1 + 8);
  **(_BYTE **)v1 = v2;
  if (!v2)
  {
    std::string::append(*(std::string **)(v1 + 16), "Engage failure: ", 0x10uLL);
    v3 = *(_QWORD *)(v1 + 24);
    v4 = *(char *)(v3 + 23);
    if (v4 >= 0)
      v5 = *(const std::string::value_type **)(v1 + 24);
    else
      v5 = *(const std::string::value_type **)v3;
    if (v4 >= 0)
      v6 = *(unsigned __int8 *)(v3 + 23);
    else
      v6 = *(_QWORD *)(v3 + 8);
    return std::string::append(*(std::string **)(v1 + 16), v5, v6);
  }
  return result;
}

@end
