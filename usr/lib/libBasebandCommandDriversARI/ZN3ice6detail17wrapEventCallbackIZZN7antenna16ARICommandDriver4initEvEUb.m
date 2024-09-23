@implementation ZN3ice6detail17wrapEventCallbackIZZN7antenna16ARICommandDriver4initEvEUb

_QWORD *___ZN3ice6detail17wrapEventCallbackIZZN7antenna16ARICommandDriver4initEvEUb_E3__1vEEN8dispatch5blockIU13block_pointerFiP16dispatch_group_sEEENSt3__117integral_constantIiLi0EEEOT__block_invoke(_QWORD *result)
{
  uint64_t *v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t v4[16];

  v1 = (uint64_t *)result[4];
  if (v1)
  {
    v2 = *v1;
    v3 = *(NSObject **)(*v1 + 40);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v4 = 0;
      _os_log_debug_impl(&dword_227A72000, v3, OS_LOG_TYPE_DEBUG, "#D ICE Client has been stopped!", v4, 2u);
      result = *(_QWORD **)(v2 + 144);
      if (!result)
        return result;
    }
    else
    {
      result = *(_QWORD **)(v2 + 144);
      if (!result)
        return result;
    }
    return (_QWORD *)(*(uint64_t (**)(_QWORD *, _QWORD, uint64_t))(*result + 16))(result, 0, 4);
  }
  return result;
}

@end
