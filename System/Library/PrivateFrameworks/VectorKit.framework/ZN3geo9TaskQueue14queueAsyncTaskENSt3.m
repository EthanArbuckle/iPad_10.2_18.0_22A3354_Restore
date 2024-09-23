@implementation ZN3geo9TaskQueue14queueAsyncTaskENSt3

NSObject *___ZN3geo9TaskQueue14queueAsyncTaskENSt3__110shared_ptrINS_4TaskEEEPU28objcproto17OS_dispatch_group8NSObject_block_invoke(uint64_t a1)
{
  NSObject *v2;
  unsigned __int8 v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *result;

  v2 = *(NSObject **)(a1 + 32);
  if (v2 && !*(_BYTE *)(a1 + 64))
    dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
  v3 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 48) + 32));
  if ((v3 & 1) == 0)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 24);
    if (!v4)
    {
      std::__throw_bad_function_call[abi:nn180100]();
      return std::__function::__func<md::CartographicRenderLayer::frame(md::LayoutContext const&)::$_0,std::allocator<md::CartographicRenderLayer::frame(md::LayoutContext const&)::$_0>,void ()(void)>::operator()();
    }
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 48))(v4);
    atomic_store(1u, (unsigned __int8 *)(*(_QWORD *)(a1 + 48) + 33));
  }
  v5 = *(NSObject **)(a1 + 40);
  if (v5 && *(_BYTE *)(a1 + 64))
    dispatch_group_leave(v5);
  result = *(NSObject **)(a1 + 32);
  if (result)
    return dispatch_semaphore_signal(result);
  return result;
}

NSObject *___ZN3geo9TaskQueue14queueAsyncTaskENSt3__110shared_ptrINS_4TaskEEEP16dispatch_group_s_block_invoke(uint64_t a1)
{
  NSObject *v2;
  unsigned __int8 v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *result;

  v2 = *(NSObject **)(a1 + 32);
  if (v2 && !*(_BYTE *)(a1 + 64))
    dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
  v3 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 32));
  if ((v3 & 1) == 0)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24);
    if (!v4)
    {
      std::__throw_bad_function_call[abi:nn180100]();
      return gdc::LayerDataSource::updateLayerData();
    }
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 48))(v4);
    atomic_store(1u, (unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 33));
  }
  v5 = *(NSObject **)(a1 + 56);
  if (v5 && *(_BYTE *)(a1 + 64))
    dispatch_group_leave(v5);
  result = *(NSObject **)(a1 + 32);
  if (result)
    return dispatch_semaphore_signal(result);
  return result;
}

@end
