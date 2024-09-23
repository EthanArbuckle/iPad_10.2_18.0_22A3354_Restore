@implementation ZN25CellularUsagePolicyClient23setPolicyChangedHandlerEP16dispatch

const void **___ZN25CellularUsagePolicyClient23setPolicyChangedHandlerEP16dispatch_queue_sU13block_pointerFvPvE_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  const void *v6;
  const void **v7;
  BOOL *v8;
  const void **v9;
  const __CFBoolean *v10;
  xpc_object_t v11;
  xpc_object_t v12;
  uint64_t v13;
  xpc_object_t v14;
  void *v15;
  xpc_object_t v16;
  xpc_object_t v17;
  BOOL *v18;
  void *count;
  xpc_object_t v20;
  xpc_object_t v22;
  xpc_object_t v23[2];
  xpc_object_t v24[2];
  void *v25;
  xpc_object_t object;
  BOOL *v27;
  BOOL *v28;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    dispatch_retain(*(dispatch_object_t *)(a1 + 40));
  v4 = *(NSObject **)(v2 + 88);
  *(_QWORD *)(v2 + 88) = v3;
  if (v4)
    dispatch_release(v4);
  v5 = *(void **)(a1 + 48);
  if (v5)
    v5 = _Block_copy(v5);
  v6 = *(const void **)(v2 + 96);
  *(_QWORD *)(v2 + 96) = v5;
  if (v6)
    _Block_release(v6);
  v27 = 0;
  object = (xpc_object_t)MGCopyAnswer();
  v28 = 0;
  v7 = (const void **)ctu::cf::CFSharedRef<__CFBoolean const>::CFSharedRef<void const,void>(&v28, (CFTypeRef *)&object);
  v8 = v27;
  v27 = v28;
  v28 = v8;
  v9 = ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::~SharedRef(v7);
  LOBYTE(v28) = 0;
  ctu::cf::assign((ctu::cf *)v9, v27, v10);
  if ((_BYTE)v28)
  {
    if (!*(_BYTE *)(v2 + 128))
      return ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::~SharedRef((const void **)&v27);
    object = 0;
    v11 = xpc_array_create(0, 0);
    v12 = v11;
    v13 = MEMORY[0x24BDACF78];
    if (v11)
    {
      object = v11;
    }
    else
    {
      v12 = xpc_null_create();
      object = v12;
      if (!v12)
      {
        v17 = xpc_null_create();
        v12 = 0;
        goto LABEL_22;
      }
    }
    if (MEMORY[0x22E3268EC](v12) == v13)
    {
      xpc_retain(v12);
LABEL_23:
      xpc_release(v12);
      v18 = (BOOL *)object;
      v28 = (BOOL *)object;
      if (object)
        xpc_retain(object);
      else
        v28 = (BOOL *)xpc_null_create();
      xpc::array::iterator::iterator(v24, (void **)&v28, 0);
      xpc_release(v28);
      v28 = v18;
      if (v18)
        xpc_retain(v18);
      else
        v28 = (BOOL *)xpc_null_create();
      if (MEMORY[0x22E3268EC](v18) == v13)
        count = (void *)xpc_array_get_count(v18);
      else
        count = 0;
      xpc::array::iterator::iterator(v23, (void **)&v28, count);
      xpc_release(v28);
      std::copy[abi:ne180100]<xpc::array::iterator,std::back_insert_iterator<xpc::array>>(v24, v23, &object);
      xpc_release(v23[0]);
      v23[0] = 0;
      xpc_release(v24[0]);
      v24[0] = 0;
      v20 = object;
      v22 = object;
      if (object)
      {
        xpc_retain(object);
      }
      else
      {
        v20 = xpc_null_create();
        v22 = v20;
      }
      CellularUsagePolicyClient::dispatchClientCallback_sync((_QWORD *)v2, &v22);
      xpc_release(v20);
      v22 = 0;
      xpc_release(object);
      return ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::~SharedRef((const void **)&v27);
    }
    v17 = xpc_null_create();
LABEL_22:
    object = v17;
    goto LABEL_23;
  }
  v14 = xpc_null_create();
  v15 = v14;
  v25 = v14;
  if (v14)
  {
    xpc_retain(v14);
    v16 = v15;
  }
  else
  {
    v16 = xpc_null_create();
    v25 = v16;
  }
  CellularUsagePolicyClient::dispatchClientCallback_sync((_QWORD *)v2, &v25);
  xpc_release(v16);
  v25 = 0;
  xpc_release(v15);
  return ctu::SharedRef<__CFBoolean const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFBoolean const>::~SharedRef((const void **)&v27);
}

@end
