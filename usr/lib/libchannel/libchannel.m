double CASPage::allocate(CASPage *this)
{
  kern_return_t v1;
  mach_error_t v2;
  double result;
  _OWORD *v4;
  mach_vm_address_t address;

  address = 0;
  v1 = mach_vm_allocate(*MEMORY[0x24BDAEC58], &address, *MEMORY[0x24BDB03C8], 1);
  if (v1)
  {
    v2 = v1;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      CASPage::allocate(v2);
  }
  else
  {
    v4 = (_OWORD *)address;
    result = 0.0;
    *(_OWORD *)address = 0u;
    v4[1] = 0u;
    v4[2] = 0u;
    v4[3] = 0u;
    v4[4] = 0u;
    v4[5] = 0u;
    v4[6] = 0u;
    v4[7] = 0u;
    v4[8] = 0u;
    v4[9] = 0u;
    v4[10] = 0u;
    v4[11] = 0u;
    v4[12] = 0u;
    v4[13] = 0u;
    v4[14] = 0u;
    v4[15] = 0u;
  }
  return result;
}

uint64_t CASPage::free(mach_vm_address_t address)
{
  return mach_vm_deallocate(*MEMORY[0x24BDAEC58], address, *MEMORY[0x24BDB03C8]);
}

unint64_t AbsTime::nano_time(AbsTime *this)
{
  mach_timebase_info info;

  mach_timebase_info(&info);
  return *(_QWORD *)this * (unint64_t)info.numer / info.denom;
}

unint64_t AbsTime::nano_time(AbsTime *this, mach_timebase_info a2)
{
  return *(_QWORD *)this * (unint64_t)a2.numer / a2.denom;
}

void *channel_retain(void *object)
{
  if (object)
    return os_retain(object);
  return object;
}

void channel_release(void *object)
{
  if (object)
    os_release(object);
}

void AssertableValue::AssertableValue(AssertableValue *this)
{
  *(_QWORD *)this = 0;
}

void AssertableValue::AssertableValue(AssertableValue *this, uint64_t a2)
{
  *(_QWORD *)this = a2;
}

uint64_t AssertableValue::is_wait_asserted(AssertableValue *this)
{
  return *(_DWORD *)this & 1;
}

unint64_t AssertableValue::value(AssertableValue *this)
{
  return *(_QWORD *)this & 0xFFFFFFFFFFFFFFFELL;
}

uint64_t AssertableValue::assert_wait(AssertableValue *this)
{
  return *(_QWORD *)this | 1;
}

uint64_t assert_wait(unint64_t *a1, unint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t result;

  v2 = *a2;
  v3 = *a2 | 1;
  while (1)
  {
    v4 = __ldaxr(a1);
    if (v4 != v2)
      break;
    if (!__stlxr(v3, a1))
    {
      result = 1;
      goto LABEL_6;
    }
  }
  result = 0;
  __clrex();
LABEL_6:
  if (!(_DWORD)result)
    v3 = v4;
  *a2 = v3;
  return result;
}

uint64_t release_wait(unint64_t *a1, unint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t result;

  v2 = *a2;
  v3 = *a2 & 0xFFFFFFFFFFFFFFFELL;
  while (1)
  {
    v4 = __ldaxr(a1);
    if (v4 != v2)
      break;
    if (!__stlxr(v3, a1))
    {
      result = 1;
      goto LABEL_6;
    }
  }
  result = 0;
  __clrex();
LABEL_6:
  if (!(_DWORD)result)
    v3 = v4;
  *a2 = v3;
  return result;
}

uint64_t channel_endpoint_obj_alloc()
{
  objc_opt_class();
  return _os_object_alloc();
}

uint64_t channel_endpoint_class()
{
  return objc_opt_class();
}

uint64_t channel_obj_alloc()
{
  objc_opt_class();
  return _os_object_alloc();
}

uint64_t channel_class()
{
  return objc_opt_class();
}

uint64_t channel_dispatch_obj_alloc()
{
  objc_opt_class();
  return _os_object_alloc();
}

uint64_t channel_dispatch_class()
{
  return objc_opt_class();
}

uint64_t channel_rt_obj_alloc()
{
  objc_opt_class();
  return _os_object_alloc();
}

uint64_t channel_rt_class()
{
  return objc_opt_class();
}

uint64_t DispatchChannel::DispatchChannel(uint64_t a1, int a2, uint64_t a3, __int128 *a4, uint64_t a5, int a6, int a7, int a8, int a9, void *a10, uint64_t a11)
{
  id v19;
  uint64_t v20;
  NSObject *v21;
  uintptr_t v22;
  const dispatch_source_type_s *v23;
  dispatch_source_t v24;
  void *v25;
  dispatch_source_t v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  unint64_t v30;
  unint64_t v32;
  _QWORD handler[10];
  int v34;
  __int128 v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;

  v19 = a10;
  v37 = *(_OWORD *)a3;
  v38 = *(_QWORD *)(a3 + 16);
  v35 = *a4;
  v36 = *((_QWORD *)a4 + 2);
  v20 = a5;
  LODWORD(a5) = a7;
  Channel::Channel(a1, a2, &v37, (uint64_t)&v35, v20, a6, a7, a8, a9);
  v21 = v19;
  *(_QWORD *)(a1 + 88) = v21;
  *(_QWORD *)(a1 + 96) = 0;
  *(_QWORD *)(a1 + 104) = 0;
  *(_QWORD *)(a1 + 112) = a11;
  *(_WORD *)(a1 + 120) = 0;
  v22 = atomic_load((unsigned int *)(a1 + 72));
  v23 = (const dispatch_source_type_s *)MEMORY[0x24BDAC9E0];
  v24 = dispatch_source_create(MEMORY[0x24BDAC9E0], v22, 0, v21);
  v25 = *(void **)(a1 + 96);
  *(_QWORD *)(a1 + 96) = v24;

  v26 = dispatch_source_create(v23, *(unsigned int *)(a1 + 84), 0, *(dispatch_queue_t *)(a1 + 88));
  v27 = *(void **)(a1 + 104);
  *(_QWORD *)(a1 + 104) = v26;

  object_retain_internal(*(_QWORD *)(a1 + 112));
  v28 = MEMORY[0x24BDAC760];
  handler[5] = MEMORY[0x24BDAC760];
  handler[6] = 3321888768;
  handler[7] = ___ZN15DispatchChannelC2Eb17MessageRingBufferS0_P7CASPagejjjjPU28objcproto17OS_dispatch_queue8NSObjectPv_block_invoke;
  handler[8] = &__block_descriptor_48_ea8_32c111_ZTSKZN15DispatchChannelC1Eb17MessageRingBufferS0_P7CASPagejjjjPU28objcproto17OS_dispatch_queue8NSObjectPvE3__0_e5_v8__0l;
  handler[9] = a1;
  v34 = a5;
  dispatch_source_set_mandatory_cancel_handler();
  v29 = *(NSObject **)(a1 + 96);
  handler[0] = v28;
  handler[1] = 3321888768;
  handler[2] = ___ZN15DispatchChannelC2Eb17MessageRingBufferS0_P7CASPagejjjjPU28objcproto17OS_dispatch_queue8NSObjectPv_block_invoke_1;
  handler[3] = &__block_descriptor_40_ea8_32c111_ZTSKZN15DispatchChannelC1Eb17MessageRingBufferS0_P7CASPagejjjjPU28objcproto17OS_dispatch_queue8NSObjectPvE3__1_e5_v8__0l;
  handler[4] = a1;
  dispatch_source_set_event_handler(v29, handler);
  object_retain_internal(*(_QWORD *)(a1 + 112));
  DispatchChannel::set_msg_source_mandatory_cancel_handler(a1, 0);
  AssertableValue::AssertableValue((AssertableValue *)&v32);
  do
  {
    v30 = atomic_load(*(unint64_t **)(a1 + 64));
    v32 = v30;
  }
  while (!assert_wait(*(unint64_t **)(a1 + 64), &v32));

  return a1;
}

{
  return DispatchChannel::DispatchChannel(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t ___ZN15DispatchChannelC2Eb17MessageRingBufferS0_P7CASPagejjjjPU28objcproto17OS_dispatch_queue8NSObjectPv_block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  mach_port_mod_refs(*MEMORY[0x24BDAEC58], *(_DWORD *)(a1 + 40), 1u, -1);
  return object_release_internal(*(_QWORD *)(v1 + 112));
}

uint64_t __copy_helper_block_ea8_32c111_ZTSKZN15DispatchChannelC1Eb17MessageRingBufferS0_P7CASPagejjjjPU28objcproto17OS_dispatch_queue8NSObjectPvE3__0(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 32);
  *(_DWORD *)(result + 40) = *(_DWORD *)(a2 + 40);
  *(_QWORD *)(result + 32) = v2;
  return result;
}

void ___ZN15DispatchChannelC2Eb17MessageRingBufferS0_P7CASPagejjjjPU28objcproto17OS_dispatch_queue8NSObjectPv_block_invoke_1(uint64_t a1)
{
  dispatch_source_t *v1;

  v1 = *(dispatch_source_t **)(a1 + 32);
  if (Channel::poll_dead_name_notification((Channel *)v1))
    DispatchChannel::cancel(v1);
}

uint64_t __copy_helper_block_ea8_32c111_ZTSKZN15DispatchChannelC1Eb17MessageRingBufferS0_P7CASPagejjjjPU28objcproto17OS_dispatch_queue8NSObjectPvE3__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 32) = *(_QWORD *)(a2 + 32);
  return result;
}

void DispatchChannel::set_msg_source_mandatory_cancel_handler(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x24BD2CCE8](a2);
  v3 = (void *)MEMORY[0x24BD2CCE8]();
  dispatch_source_set_mandatory_cancel_handler();

}

uint64_t ___ZN15DispatchChannel39set_msg_source_mandatory_cancel_handlerEU13block_pointerFvvE_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  mach_port_mod_refs(*MEMORY[0x24BDAEC58], *(_DWORD *)(v2 + 84), 1u, -1);
  object_release_internal(*(_QWORD *)(v2 + 112));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __copy_helper_block_ea8_32c91_ZTSKZN15DispatchChannel39set_msg_source_mandatory_cancel_handlerEU13block_pointerFvvEE3__0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;

  v3 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  result = MEMORY[0x24BD2CCE8](v3);
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_ea8_32c91_ZTSKZN15DispatchChannel39set_msg_source_mandatory_cancel_handlerEU13block_pointerFvvEE3__0(uint64_t a1)
{

}

void DispatchChannel::cancel(dispatch_source_t *this)
{
  unsigned int *v2;

  v2 = (unsigned int *)(this + 9);
  do
    __ldaxr(v2);
  while (__stlxr(0, v2));
  dispatch_source_cancel(this[12]);
  dispatch_source_cancel(this[13]);
  dispatch_activate(this[12]);
  dispatch_activate(this[13]);
}

void DispatchChannel::activate_no_check(dispatch_object_t *this)
{
  dispatch_activate(this[12]);
  dispatch_activate(this[13]);
}

void DispatchChannel::try_activate(dispatch_object_t *this)
{
  if (*((_BYTE *)this + 120))
  {
    if (*((_BYTE *)this + 121))
    {
      dispatch_activate(this[12]);
      dispatch_activate(this[13]);
    }
  }
}

uint64_t DispatchChannel::set_message_handler(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  uint64_t v3;
  NSObject *v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  if (a2)
    v2 = *(_BYTE *)(a1 + 120) == 0;
  else
    v2 = 0;
  v3 = v2;
  if (v2)
  {
    *(_BYTE *)(a1 + 120) = 1;
    v5 = *(NSObject **)(a1 + 104);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3321888768;
    v8[2] = ___ZN15DispatchChannel19set_message_handlerEU13block_pointerFvPvmjE_block_invoke;
    v8[3] = &__block_descriptor_48_ea8_32c74_ZTSKZN15DispatchChannel19set_message_handlerEU13block_pointerFvPvmjEE3__0_e5_v8__0l;
    v6 = (void *)MEMORY[0x24BD2CCE8](a2);
    v8[4] = a1;
    v9 = (id)MEMORY[0x24BD2CCE8]();
    dispatch_source_set_event_handler(v5, v8);

  }
  return v3;
}

void ___ZN15DispatchChannel19set_message_handlerEU13block_pointerFvPvmjE_block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v5;
  char v6;
  BOOL v7;
  unint64_t v8;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = Channel::msg_wait((Channel *)v2, 0);
  if (v3 != 14 && v3 != 37)
  {
    AssertableValue::AssertableValue((AssertableValue *)&v8);
    while (1)
    {
      v7 = 0;
      while (1)
      {
        Channel::receive_message((Channel *)v2, (AssertableValue *)&v8, &v7, (uint64_t)&v5);
        if (!v6)
          break;
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        if (!atomic_load((unsigned int *)(v2 + 72)))
          return;
      }
      if (v7)
        break;
      if (assert_wait(*(unint64_t **)(v2 + 64), &v8))
        return;
    }
    DispatchChannel::cancel((dispatch_source_t *)v2);
  }
}

uint64_t __copy_helper_block_ea8_32c74_ZTSKZN15DispatchChannel19set_message_handlerEU13block_pointerFvPvmjEE3__0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;

  v3 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  result = MEMORY[0x24BD2CCE8](v3);
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_ea8_32c74_ZTSKZN15DispatchChannel19set_message_handlerEU13block_pointerFvPvmjEE3__0(uint64_t a1)
{

}

uint64_t DispatchChannel::set_close_handler(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  uint64_t v3;

  if (a2)
    v2 = *(_BYTE *)(a1 + 121) == 0;
  else
    v2 = 0;
  v3 = v2;
  if (v2)
  {
    *(_BYTE *)(a1 + 121) = 1;
    DispatchChannel::set_msg_source_mandatory_cancel_handler(a1, a2);
  }
  return v3;
}

BOOL channel_seqlock_read_try_start(unint64_t *a1, unint64_t *a2)
{
  unint64_t v2;

  v2 = atomic_load(a1);
  if ((v2 & 1) == 0)
    *a2 = v2;
  return (v2 & 1) == 0;
}

BOOL channel_seqlock_read_try_end(unint64_t *a1, uint64_t a2)
{
  unint64_t v2;

  v2 = atomic_load(a1);
  return v2 == a2;
}

unint64_t channel_seqlock_write_start(unint64_t *a1)
{
  unint64_t result;

  do
    result = __ldaxr(a1);
  while (__stlxr(result + 1, a1));
  return result;
}

unint64_t *channel_seqlock_write_end(unint64_t *result)
{
  unint64_t v1;

  do
    v1 = __ldaxr(result);
  while (__stlxr(v1 + 1, result));
  return result;
}

void RTChannel::~RTChannel(RTChannel *this)
{
  RTChannel::close((uint64_t)this);
  Channel::~Channel(this);
}

uint64_t RTChannel::close(uint64_t this)
{
  uint64_t v1;
  unsigned int *v2;
  mach_port_name_t v3;
  ipc_space_t v4;

  v1 = this;
  v2 = (unsigned int *)(this + 72);
  do
    v3 = __ldaxr(v2);
  while (__stlxr(0, v2));
  if (v3)
  {
    realtime_runtime_check_push_authorization();
    v4 = *MEMORY[0x24BDAEC58];
    mach_port_mod_refs(*MEMORY[0x24BDAEC58], v3, 1u, -1);
    mach_port_mod_refs(v4, *(_DWORD *)(v1 + 84), 1u, -1);
    return realtime_runtime_check_pop_authorization();
  }
  return this;
}

void sub_24BA61E0C(_Unwind_Exception *a1)
{
  realtime_runtime_check_pop_authorization();
  _Unwind_Resume(a1);
}

uint64_t RTChannel::pop_message@<X0>(RTChannel *this@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;
  BOOL v5;
  _BYTE v6[8];

  AssertableValue::AssertableValue((AssertableValue *)v6);
  v5 = 0;
  result = Channel::receive_message(this, (AssertableValue *)v6, &v5, (uint64_t)a2);
  if (!a2[24])
  {
    if (v5)
      result = RTChannel::close((uint64_t)this);
    *a2 = 0;
    a2[24] = 0;
  }
  return result;
}

unint64_t RTChannel::receive_message@<X0>(unint64_t **this@<X0>, int a2@<W1>, _BYTE *a3@<X8>)
{
  unint64_t v3;
  unint64_t result;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  unint64_t v12;

  LODWORD(v3) = a2;
  AssertableValue::AssertableValue((AssertableValue *)&v12);
  v11 = 0;
  result = Channel::receive_message((Channel *)this, (AssertableValue *)&v12, &v11, (uint64_t)a3);
  if (!a3[24])
  {
    if (v11)
    {
LABEL_3:
      result = RTChannel::close((uint64_t)this);
    }
    else if ((_DWORD)v3)
    {
      v7 = AbsTime::now();
      v10 = 1000000 * v3;
      result = NanoTime::abs_time((NanoTime *)&v10);
      v8 = result + v7;
      if (v7 < result + v7)
      {
        do
        {
          if (assert_wait(this[8], &v12))
          {
            if (Channel::msg_wait((Channel *)this, v3) == 14)
              RTChannel::close((uint64_t)this);
            result = release_wait(this[8], &v12);
            if ((result & 1) != 0)
              break;
          }
          result = Channel::receive_message((Channel *)this, (AssertableValue *)&v12, &v11, (uint64_t)a3);
          if (a3[24])
            return result;
          if (v11)
            goto LABEL_3;
          v9 = AbsTime::now();
          v10 = v8 - v9;
          result = AbsTime::nano_time((AbsTime *)&v10);
          v3 = result / 0xF4240;
        }
        while (v8 > v9);
      }
    }
    *a3 = 0;
    a3[24] = 0;
  }
  return result;
}

BOOL RTChannel::probe_message(unint64_t **this)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v5;

  Channel::assert_recv_sane((Channel *)this);
  v2 = this[2][32];
  v3 = atomic_load(this[8]);
  v5 = v3;
  return v2 < AssertableValue::value((AssertableValue *)&v5);
}

uint64_t RTChannel::wait_message(RTChannel *this, int a2)
{
  unint64_t v2;
  unint64_t v4;
  unint64_t v5;
  uint64_t result;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;

  LODWORD(v2) = a2;
  Channel::assert_recv_sane(this);
  v4 = *(_QWORD *)(*((_QWORD *)this + 2) + 256);
  v5 = atomic_load(*((unint64_t **)this + 8));
  v16 = v5;
  if (v4 < AssertableValue::value((AssertableValue *)&v16))
    return 1;
  if ((_DWORD)v2)
  {
    v7 = AbsTime::now();
    v15 = 1000000 * v2;
    v8 = NanoTime::abs_time((NanoTime *)&v15);
    v9 = v8 + v7;
    if (v7 < v8 + v7)
    {
      while (atomic_load((unsigned int *)this + 18))
      {
        if (assert_wait(*((unint64_t **)this + 8), &v16))
        {
          v11 = Channel::msg_wait(this, v2);
          if (v11 == 14)
            RTChannel::close((uint64_t)this);
          if ((release_wait(*((unint64_t **)this + 8), &v16) & 1) != 0)
            return 0;
        }
        else
        {
          v11 = 0;
        }
        v12 = atomic_load(*((unint64_t **)this + 8));
        v16 = v12;
        if (v4 < AssertableValue::value((AssertableValue *)&v16))
          return 1;
        result = 0;
        if (v11 != 14 && v11 != 37)
        {
          v13 = AbsTime::now();
          v15 = v9 - v13;
          v14 = AbsTime::nano_time((AbsTime *)&v15);
          result = 0;
          v2 = v14 / 0xF4240;
          if (v9 > v13)
            continue;
        }
        return result;
      }
    }
  }
  return 0;
}

BOOL RTChannel::poll_closed(RTChannel *this)
{
  unsigned int *v1;
  unsigned int v2;
  unsigned int v4;

  v1 = (unsigned int *)((char *)this + 72);
  v2 = atomic_load((unsigned int *)this + 18);
  if (v2 && Channel::poll_dead_name_notification(this))
    RTChannel::close((uint64_t)this);
  v4 = atomic_load(v1);
  return v4 == 0;
}

BOOL RTChannel::wire(const void **this)
{
  _BOOL8 result;

  result = MessageRingBuffer::wire(this);
  if (result)
  {
    if (MessageRingBuffer::wire(this + 3))
    {
      return 1;
    }
    else
    {
      MessageRingBuffer::unwire(this);
      return 0;
    }
  }
  return result;
}

uint64_t RTChannel::unwire(const void **this)
{
  _BOOL4 v2;

  v2 = MessageRingBuffer::unwire(this);
  return v2 & MessageRingBuffer::unwire(this + 3);
}

unint64_t NanoTime::abs_time(NanoTime *this)
{
  mach_timebase_info info;

  mach_timebase_info(&info);
  return *(_QWORD *)this * (unint64_t)info.denom / info.numer;
}

_QWORD *MessageRingBuffer::allocate(MessageRingBuffer *this)
{
  unsigned int v1;
  _QWORD *result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = this;
  result = MessageRingBufferSharedMemory::allocate(this);
  if (result)
  {
    v3 = result;
    v4 = *MEMORY[0x24BDB03C8] * ((2 * v1) | 1);
    v5 = *MEMORY[0x24BDB03C8] * v1;
    result = (_QWORD *)operator new();
    *result = v4;
    result[1] = v5;
    result[2] = v3;
  }
  return result;
}

_QWORD *MessageRingBufferSharedMemory::allocate(MessageRingBufferSharedMemory *this)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  mach_vm_size_t v11;
  mach_vm_size_t v12;
  _BOOL4 v13;
  vm_map_t *v14;
  kern_return_t v15;
  mach_error_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *result;
  mach_vm_address_t v25;
  kern_return_t v26;
  mach_error_t v27;
  vm_prot_t cur_protection[2];
  mach_vm_address_t target_address;
  mach_vm_address_t address;

  v2 = (_QWORD *)MEMORY[0x24BDB03C8];
  v3 = *MEMORY[0x24BDB03C8];
  if (!is_mul_ok(this, *MEMORY[0x24BDB03C8]))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      MessageRingBufferSharedMemory::allocate((uint64_t)this, v4, v5, v6, v7, v8, v9, v10);
    return 0;
  }
  v11 = this * v3;
  v12 = v3 + 2 * v11;
  v13 = __CFADD__(v3, 2 * v11);
  if ((v11 & 0x8000000000000000) != 0 || v13)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      MessageRingBufferSharedMemory::allocate((uint64_t)this, v17, v18, v19, v20, v21, v22, v23);
    return 0;
  }
  address = 0;
  v14 = (vm_map_t *)MEMORY[0x24BDAEC58];
  v15 = mach_vm_allocate(*MEMORY[0x24BDAEC58], &address, v12, 1);
  if (v15)
  {
    v16 = v15;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      MessageRingBufferSharedMemory::allocate(v16, v12);
    return 0;
  }
  v25 = *v2 + address;
  *(_QWORD *)cur_protection = 0;
  target_address = v25 + v11;
  v26 = mach_vm_remap(*v14, &target_address, v11, 0, 0x4000, *v14, v25, 0, &cur_protection[1], cur_protection, 2u);
  if (v26)
  {
    v27 = v26;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      MessageRingBufferSharedMemory::allocate(v27);
    mach_vm_deallocate(*v14, address, v12);
    return 0;
  }
  result = (_QWORD *)address;
  *(_QWORD *)address = 0xFEAB12399321BEAFLL;
  result[16] = 0;
  result[32] = 0;
  result[48] = 0;
  return result;
}

_QWORD *MessageRingBuffer::from_xpc(void *a1)
{
  id v1;
  void *v2;
  char *v3;
  _QWORD *v4;
  void *region;

  v1 = a1;
  v2 = v1;
  if (!v1)
    goto LABEL_6;
  region = 0;
  v3 = (char *)xpc_shmem_map(v1, &region);
  v4 = 0;
  if (v3)
  {
    if (region)
    {
      v4 = MessageRingBuffer::from_shared_region((MessageRingBuffer *)region, v3);
      if (!v4)
      {
        mach_vm_deallocate(*MEMORY[0x24BDAEC58], (mach_vm_address_t)region, (mach_vm_size_t)v3);
LABEL_6:
        v4 = 0;
      }
    }
  }

  return v4;
}

void sub_24BA624F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

_QWORD *MessageRingBuffer::from_shared_region(MessageRingBuffer *this, char *a2)
{
  _QWORD *result;
  unint64_t v4;
  unint64_t v5;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  result = 0;
  v4 = *MEMORY[0x24BDB03C8];
  v5 = (unint64_t)&a2[-*MEMORY[0x24BDB03C8]];
  if ((unint64_t)a2 >= *MEMORY[0x24BDB03C8] && (unint64_t)a2 >= 0x280 && v4 >= 0x280)
  {
    if ((v5 & 1) != 0)
      return 0;
    if (v5 % v4)
      return 0;
    if (((v4 - 1) & (unint64_t)this) != 0)
      return 0;
    if (*(_QWORD *)this != 0xFEAB12399321BEAFLL)
      return 0;
    v7 = atomic_load((unint64_t *)this + 16);
    v8 = atomic_load((unint64_t *)this + 32);
    if (v7 > v8)
      return 0;
    v9 = atomic_load((unint64_t *)this + 32);
    v10 = atomic_load((unint64_t *)this + 48);
    if (v9 > v10)
    {
      return 0;
    }
    else
    {
      v11 = v5 >> 1;
      result = (_QWORD *)operator new();
      *result = a2;
      result[1] = v11;
      result[2] = this;
    }
  }
  return result;
}

BOOL MessageRingBufferSharedMemory::is_valid(MessageRingBufferSharedMemory *this)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v4;
  unint64_t v5;

  if (((*MEMORY[0x24BDB03C8] - 1) & (unint64_t)this) != 0)
    return 0;
  if (*(_QWORD *)this != 0xFEAB12399321BEAFLL)
    return 0;
  v1 = atomic_load((unint64_t *)this + 16);
  v2 = atomic_load((unint64_t *)this + 32);
  if (v1 > v2)
    return 0;
  v4 = atomic_load((unint64_t *)this + 32);
  v5 = atomic_load((unint64_t *)this + 48);
  return v4 <= v5;
}

void MessageRingBuffer::free(mach_vm_size_t *a1)
{
  mach_vm_deallocate(*MEMORY[0x24BDAEC58], a1[2], *a1);
  a1[2] = 0;
  JUMPOUT(0x24BD2CB08);
}

uint64_t MessageRingBuffer::free_shared_memory(MessageRingBuffer *this)
{
  uint64_t result;

  result = mach_vm_deallocate(*MEMORY[0x24BDAEC58], *((_QWORD *)this + 2), *(_QWORD *)this);
  *((_QWORD *)this + 2) = 0;
  return result;
}

BOOL MessageRingBuffer::wire(const void **this)
{
  return mlock(this[2], (size_t)*this) == 0;
}

BOOL MessageRingBuffer::unwire(const void **this)
{
  return munlock(this[2], (size_t)*this) == 0;
}

void MessageRingBufferSharedMemory::MessageRingBufferSharedMemory(MessageRingBufferSharedMemory *this)
{
  *(_QWORD *)this = 0xFEAB12399321BEAFLL;
  *((_QWORD *)this + 16) = 0;
  *((_QWORD *)this + 32) = 0;
  *((_QWORD *)this + 48) = 0;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

uint64_t Channel::Channel(uint64_t result, int a2, __int128 *a3, uint64_t a4, uint64_t a5, int a6, int a7, int a8, int a9)
{
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v9 = *a3;
  *(_QWORD *)(result + 16) = *((_QWORD *)a3 + 2);
  *(_OWORD *)result = v9;
  v10 = *(_QWORD *)(a4 + 16);
  *(_OWORD *)(result + 24) = *(_OWORD *)a4;
  *(_QWORD *)(result + 40) = v10;
  *(_QWORD *)(result + 48) = a5;
  *(_DWORD *)(result + 72) = a7;
  *(_DWORD *)(result + 76) = a6;
  *(_DWORD *)(result + 80) = a8;
  *(_DWORD *)(result + 84) = a9;
  v11 = a5 + 128;
  if (a2)
    v12 = a5;
  else
    v12 = a5 + 128;
  if (!a2)
    v11 = a5;
  *(_QWORD *)(result + 56) = v12;
  *(_QWORD *)(result + 64) = v11;
  return result;
}

void Channel::~Channel(Channel *this)
{
  ipc_space_t *v2;

  MessageRingBuffer::free_shared_memory(this);
  MessageRingBuffer::free_shared_memory((Channel *)((char *)this + 24));
  CASPage::free(*((_QWORD *)this + 6));
  disarm_deadname_notification(*((_DWORD *)this + 19));
  disarm_deadname_notification(*((_DWORD *)this + 20));
  v2 = (ipc_space_t *)MEMORY[0x24BDAEC58];
  mach_port_deallocate(*MEMORY[0x24BDAEC58], *((_DWORD *)this + 19));
  mach_port_deallocate(*v2, *((_DWORD *)this + 20));
}

uint64_t disarm_deadname_notification(mach_port_name_t name)
{
  ipc_space_t *v2;
  mach_port_name_t v3;
  mach_port_t previous;

  previous = 0;
  v2 = (ipc_space_t *)MEMORY[0x24BDAEC58];
  mach_port_request_notification(*MEMORY[0x24BDAEC58], name, 72, 0, 0, 0x15u, &previous);
  if (previous)
    v3 = previous;
  else
    v3 = name;
  return mach_port_deallocate(*v2, v3);
}

unint64_t Channel::receive_message@<X0>(Channel *this@<X0>, AssertableValue *a2@<X1>, BOOL *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t result;
  unsigned int *v15;
  int v16;
  unsigned int v17;
  unint64_t v18;
  unint64_t v19;
  BOOL v20;
  unsigned int v22;
  int v24;
  char v25;
  _BYTE v26[7];
  _BYTE v27[7];

  v7 = *MEMORY[0x24BDB03C8];
  v8 = *((_QWORD *)this + 4);
  v9 = *((_QWORD *)this + 5);
  v10 = *((_QWORD *)this + 2);
  v11 = *(_QWORD *)(v10 + 128);
  v12 = *(_QWORD *)(v10 + 256);
  v13 = atomic_load(*((unint64_t **)this + 8));
  *(_QWORD *)a2 = v13;
  result = AssertableValue::value(a2);
  if (v11 <= v12)
    v18 = v12;
  else
    v18 = v11;
  if (v12 >= result)
  {
    v25 = 0;
    LOBYTE(v19) = 0;
    v24 = 0;
LABEL_20:
    *(_QWORD *)(*((_QWORD *)this + 2) + 256) = v12;
    atomic_store(v18, (unint64_t *)(*((_QWORD *)this + 2) + 128));
    *a3 = 0;
    *(_DWORD *)a4 = v24 | v19;
    *(_DWORD *)(a4 + 4) = v16;
    *(_BYTE *)(a4 + 8) = v17;
    *(_DWORD *)(a4 + 9) = *(_DWORD *)v27;
    *(_DWORD *)(a4 + 12) = *(_DWORD *)&v27[3];
    *(_QWORD *)(a4 + 16) = v15;
    *(_BYTE *)(a4 + 24) = v25;
    *(_DWORD *)(a4 + 25) = *(_DWORD *)v26;
    *(_DWORD *)(a4 + 28) = *(_DWORD *)&v26[3];
  }
  else
  {
    while (1)
    {
      v15 = (unsigned int *)(v7 + v9 + v12 % v8);
      v19 = *v15;
      v20 = v19 >= 8 && v8 >= v19;
      v12 += v19;
      if (!v20 || v12 > result)
        break;
      v22 = v15[1];
      v16 = v22 & 0x3FFFFFFF;
      v17 = v22 >> 30;
      if (v17 != 3 && v16 != 0)
      {
        v24 = v19 & 0xFFFFFF00;
        v25 = 1;
        goto LABEL_20;
      }
      v18 += v19;
      if (v12 >= result)
      {
        v25 = 0;
        v24 = v19 & 0xFFFFFF00;
        goto LABEL_20;
      }
    }
    *a3 = 1;
    *(_BYTE *)a4 = 0;
    *(_BYTE *)(a4 + 24) = 0;
  }
  return result;
}

_DWORD *Channel::reserve_message(Channel *this, int a2, uint64_t a3, uint64_t a4)
{
  _DWORD *result;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _DWORD *v13;
  uint64_t v14;
  unint64_t v15;
  _DWORD *v16;
  unint64_t v17;
  uint64_t v18;

  if (!atomic_load((unsigned int *)this + 18))
    return 0;
  result = 0;
  v7 = *(_QWORD *)(*((_QWORD *)this + 2) + 384);
  v8 = atomic_load((unint64_t *)(*((_QWORD *)this + 5) + 128));
  v11 = (char *)this + 8;
  v9 = *((_QWORD *)this + 1);
  v10 = *((_QWORD *)v11 + 1);
  v12 = *MEMORY[0x24BDB03C8] + v10;
  v13 = (_DWORD *)(v7 % v9 + v12);
  v14 = ((unint64_t)v13 + a4 + 7) & -a4;
  v15 = (a3 + v14 + 7) & 0xFFFFFFFFFFFFFFF8;
  if (v15 - (unint64_t)v13 <= v8 - v7 + v9)
  {
    v16 = (_DWORD *)(v14 - 8);
    if (v16 != v13)
    {
      *v13 = (_DWORD)v16 - (_DWORD)v13;
      v13[1] = 0x40000000;
    }
    *v16 = v15 - (_DWORD)v16;
    v16[1] = a2 & 0x3FFFFFFF;
    v17 = v12 + v9;
    v18 = (uint64_t)v16 - v9;
    if ((unint64_t)v16 <= v17)
      result = v16;
    else
      result = (_DWORD *)v18;
    *(_QWORD *)(v10 + 384) = v15 - (_QWORD)v13 + v7;
  }
  return result;
}

unint64_t Channel::advance_commit_assert_head(Channel *this)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unsigned int *v8;
  unsigned int v9;
  unint64_t result;
  unint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  unint64_t v19;
  int v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;

  v2 = *MEMORY[0x24BDB03C8];
  v3 = *((_QWORD *)this + 1);
  v4 = *((_QWORD *)this + 2);
  v5 = atomic_load(*((unint64_t **)this + 7));
  v23 = v5;
  v6 = AssertableValue::value((AssertableValue *)&v23);
  v7 = *(_QWORD *)(*((_QWORD *)this + 2) + 384);
  while (v6 < v7)
  {
    v8 = (unsigned int *)(v2 + v4 + v6 % v3);
    v9 = v8[1] >> 30;
    if (v9 == 1 || v9 == 3)
    {
      v6 += *v8;
    }
    else if (!v9)
    {
      break;
    }
  }
  result = AssertableValue::value((AssertableValue *)&v23);
  if (v6 > result)
  {
    v12 = AssertableValue::value((AssertableValue *)&v23);
    AssertableValue::AssertableValue((AssertableValue *)&v22, v12);
    AssertableValue::AssertableValue((AssertableValue *)&v21, v6);
    v13 = (unint64_t *)*((_QWORD *)this + 7);
    v14 = v21;
    v15 = v22;
    while (1)
    {
      v16 = __ldaxr(v13);
      if (v16 != v15)
        break;
      if (!__stlxr(v14, v13))
        goto LABEL_22;
    }
    __clrex();
    do
    {
      v22 = v16;
      v17 = (unint64_t *)*((_QWORD *)this + 7);
      v18 = v21;
      while (1)
      {
        v19 = __ldaxr(v17);
        if (v19 != v16)
          break;
        if (!__stlxr(v18, v17))
        {
          v20 = 1;
          goto LABEL_21;
        }
      }
      v20 = 0;
      __clrex();
LABEL_21:
      v16 = v19;
    }
    while (!v20);
LABEL_22:
    result = AssertableValue::is_wait_asserted((AssertableValue *)&v22);
    if ((_DWORD)result)
      return Channel::msg_notify(this);
  }
  return result;
}

uint64_t Channel::msg_notify(Channel *this)
{
  uint64_t v1;
  mach_msg_header_t msg;

  *(_QWORD *)&msg.msgh_bits = 0x1800000013;
  msg.msgh_remote_port = *((_DWORD *)this + 20);
  msg.msgh_local_port = 0;
  *(_QWORD *)&msg.msgh_voucher_port = 0;
  realtime_runtime_check_push_authorization();
  v1 = mach_msg(&msg, 17, 0x18u, 0, 0, 0, 0);
  realtime_runtime_check_pop_authorization();
  return v1;
}

void sub_24BA62C5C(_Unwind_Exception *a1)
{
  realtime_runtime_check_pop_authorization();
  _Unwind_Resume(a1);
}

unint64_t Channel::commit_message(Channel *this, uint64_t a2)
{
  *(_DWORD *)(a2 + 4) = *(_DWORD *)(a2 + 4) & 0x3FFFFFFF | 0x40000000;
  return Channel::advance_commit_assert_head(this);
}

unint64_t Channel::abandon_message(Channel *this, uint64_t a2)
{
  *(_DWORD *)(a2 + 4) |= 0xC0000000;
  return Channel::advance_commit_assert_head(this);
}

uint64_t Channel::msg_wait(Channel *this, mach_msg_timeout_t a2)
{
  mach_msg_return_t v4;
  mach_msg_header_t msg;

  realtime_runtime_check_push_authorization();
  v4 = mach_msg(&msg, 258, 0, 0x30u, *((_DWORD *)this + 21), a2, 0);
  realtime_runtime_check_pop_authorization();
  if (v4 > 268451842)
    return 0;
  if (v4)
  {
    if (v4 == 268451842)
      return 37;
    return 0;
  }
  if (msg.msgh_id == 72)
    return 14;
  else
    return 0;
}

void sub_24BA62D58(_Unwind_Exception *a1)
{
  realtime_runtime_check_pop_authorization();
  _Unwind_Resume(a1);
}

uint64_t Channel::poll_dead_name_notification(Channel *this)
{
  mach_port_name_t v1;
  mach_msg_return_t v2;
  uint64_t result;
  uint64_t v4;
  mach_msg_header_t msg;
  int v6;
  mach_msg_return_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v1 = *((_DWORD *)this + 18);
  if (!v1)
    return 1;
  realtime_runtime_check_push_authorization();
  v2 = mach_msg(&msg, 258, 0, 0x2Cu, v1, 0, 0);
  realtime_runtime_check_pop_authorization();
  result = 1;
  if ((v2 - 268451842) <= 7 && ((1 << (v2 - 2)) & 0x93) != 0)
    return 0;
  if (v2)
  {
    realtime_runtime_check_push_authorization();
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v8 = 0u;
    os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    v6 = 67109120;
    v7 = v2;
    _os_log_send_and_compose_impl();
    v4 = _os_crash_msg();
    Channel::poll_dead_name_notification(v4);
  }
  return result;
}

void sub_24BA62EE8(_Unwind_Exception *a1)
{
  realtime_runtime_check_pop_authorization();
  _Unwind_Resume(a1);
}

void Endpoint::Endpoint(Endpoint *this, MessageRingBuffer *a2, int a3)
{
  CASPage *v4;
  uint64_t v5;

  *(_BYTE *)this = 1;
  *((_DWORD *)this + 1) = a3;
  v4 = (CASPage *)MessageRingBuffer::allocate(a2);
  *((_QWORD *)this + 1) = v4;
  *((_QWORD *)this + 2) = 0;
  CASPage::allocate(v4);
  *((_QWORD *)this + 3) = v5;
  *((_DWORD *)this + 8) = 0;
  *((_DWORD *)this + 9) = allocate_recv_right();
  *((_BYTE *)this + 40) = 0;
  *((_DWORD *)this + 11) = allocate_recv_right();
  *((_DWORD *)this + 12) = 0;
}

uint64_t allocate_recv_right(void)
{
  kern_return_t v0;
  mach_error_t v1;
  mach_port_name_t name;

  name = 0;
  v0 = mach_port_allocate(*MEMORY[0x24BDAEC58], 1u, &name);
  if (v0)
  {
    v1 = v0;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      allocate_recv_right(v1);
  }
  return name;
}

uint64_t Endpoint::Endpoint(uint64_t a1, void *a2)
{
  id v3;
  MessageRingBuffer *uint64;
  void *v5;
  uint64_t v6;
  void *v7;
  vm_map_t *v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  char v19;
  size_t v21;
  mach_port_t previous;
  void *region;

  v3 = a2;
  if (!xpc_dictionary_get_BOOL(v3, "CHChannelEndpointRequestV2"))
  {
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
    Endpoint::release((Endpoint *)a1);
    goto LABEL_15;
  }
  *(_BYTE *)a1 = 0;
  uint64 = (MessageRingBuffer *)xpc_dictionary_get_uint64(v3, "CHChannelEndpointRingBufferPagesV2");
  *(_DWORD *)(a1 + 4) = (_DWORD)uint64;
  *(_QWORD *)(a1 + 8) = MessageRingBuffer::allocate(uint64);
  xpc_dictionary_get_value(v3, "CHChannelEndpointRingBufferV2");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(a1 + 16) = MessageRingBuffer::from_xpc(v5);

  xpc_dictionary_get_value(v3, "CHChannelEndpointCASPageV2");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = (vm_map_t *)MEMORY[0x24BDAEC58];
  if (v6)
  {
    if (MEMORY[0x24BD2CDCC](v6) == MEMORY[0x24BDACFE8])
    {
      region = 0;
      v21 = xpc_shmem_map(v7, &region);
      if (v21)
      {
        if (v21 >= 0x100 && v21 == *MEMORY[0x24BDB03C8])
        {
          v17 = region;
          goto LABEL_7;
        }
        mach_vm_deallocate(*v8, (mach_vm_address_t)region, v21);
      }
    }
    else
    {
      v9 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v9)
        Endpoint::Endpoint(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  v17 = 0;
LABEL_7:

  *(_QWORD *)(a1 + 24) = v17;
  *(_DWORD *)(a1 + 36) = allocate_recv_right();
  *(_DWORD *)(a1 + 32) = xpc_dictionary_copy_mach_send();
  *(_DWORD *)(a1 + 44) = allocate_recv_right();
  *(_DWORD *)(a1 + 48) = xpc_dictionary_copy_mach_send();
  previous = 0;
  *(_BYTE *)(a1 + 40) = mach_port_request_notification(*v8, *(_DWORD *)(a1 + 32), 72, 1u, *(_DWORD *)(a1 + 36), 0x15u, &previous) == 0;
  if (mach_port_request_notification(*v8, *(_DWORD *)(a1 + 48), 72, 1u, *(_DWORD *)(a1 + 44), 0x15u, &previous))
    v18 = 1;
  else
    v18 = *(_BYTE *)(a1 + 40) == 0;
  v19 = !v18;
  *(_BYTE *)(a1 + 40) = v19;
LABEL_15:

  return a1;
}

void sub_24BA631DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t Endpoint::release(Endpoint *this)
{
  uint64_t v2;
  uint64_t result;

  *(_BYTE *)this = 0;
  v2 = *((_QWORD *)this + 1);
  if (v2)
    MEMORY[0x24BD2CB08](v2, 0x1020C403ED2C137);
  result = *((_QWORD *)this + 2);
  *((_QWORD *)this + 1) = 0;
  *((_DWORD *)this + 1) = 0;
  if (result)
    result = MEMORY[0x24BD2CB08](result, 0x1020C403ED2C137);
  *((_DWORD *)this + 11) = 0;
  *((_DWORD *)this + 12) = 0;
  *((_QWORD *)this + 3) = 0;
  *((_QWORD *)this + 4) = 0;
  *((_QWORD *)this + 2) = 0;
  *((_BYTE *)this + 40) = 0;
  return result;
}

void Endpoint::Endpoint(uint64_t a1, Endpoint *this)
{
  *(_BYTE *)a1 = *(_BYTE *)this;
  *(_DWORD *)(a1 + 4) = *((_DWORD *)this + 1);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)((char *)this + 8);
  *(_QWORD *)(a1 + 24) = *((_QWORD *)this + 3);
  *(_QWORD *)(a1 + 32) = *((_QWORD *)this + 4);
  *(_BYTE *)(a1 + 40) = *((_BYTE *)this + 40);
  *(_QWORD *)(a1 + 44) = *(_QWORD *)((char *)this + 44);
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  Endpoint::release(this);
}

void Endpoint::~Endpoint(Endpoint *this)
{
  mach_vm_size_t *v2;
  mach_vm_size_t *v3;
  mach_vm_address_t v4;
  mach_port_name_t v5;
  ipc_space_t *v6;
  mach_port_name_t v7;
  mach_port_name_t v8;
  mach_port_name_t v9;

  v2 = (mach_vm_size_t *)*((_QWORD *)this + 1);
  if (v2)
    MessageRingBuffer::free(v2);
  v3 = (mach_vm_size_t *)*((_QWORD *)this + 2);
  if (v3)
    MessageRingBuffer::free(v3);
  v4 = *((_QWORD *)this + 3);
  if (v4)
    CASPage::free(v4);
  v5 = *((_DWORD *)this + 9);
  v6 = (ipc_space_t *)MEMORY[0x24BDAEC58];
  if (v5)
    mach_port_mod_refs(*MEMORY[0x24BDAEC58], v5, 1u, -1);
  v7 = *((_DWORD *)this + 8);
  if (v7)
    mach_port_deallocate(*v6, v7);
  v8 = *((_DWORD *)this + 11);
  if (v8)
    mach_port_mod_refs(*v6, v8, 1u, -1);
  v9 = *((_DWORD *)this + 12);
  if (v9)
    mach_port_deallocate(*v6, v9);
}

uint64_t Endpoint::encode(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  BOOL v6;
  void *readonly;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  BOOL v18;

  v3 = a2;
  if (!*(_BYTE *)a1)
  {
    if (is_open((Endpoint *)a1))
    {
      readonly = (void *)xpc_shmem_create_readonly();
      v8 = (void *)xpc_mach_send_create_with_disposition();
      v16 = xpc_mach_send_create_with_disposition();
      v9 = (void *)v16;
      if (readonly)
        v17 = v8 == 0;
      else
        v17 = 1;
      v18 = v17 || v16 == 0;
      v15 = !v18;
      if (!v18)
      {
        xpc_dictionary_set_BOOL(v3, "CHChannelEndpointReplyV2", 1);
        xpc_dictionary_set_value(v3, "CHChannelEndpointRingBufferV2", readonly);
        xpc_dictionary_set_value(v3, "CHChannelEndpointDeadNameNotifyPortV2", v8);
        xpc_dictionary_set_value(v3, "CHChannelEndpointMsgNotifyPortV2", v9);
        v15 = 1;
      }
      goto LABEL_40;
    }
LABEL_41:
    v15 = 0;
    goto LABEL_42;
  }
  if (*(_DWORD *)(a1 + 4))
    v4 = *(_QWORD *)(a1 + 8) == 0;
  else
    v4 = 1;
  v6 = v4 || *(_QWORD *)(a1 + 24) == 0 || *(_DWORD *)(a1 + 36) == 0;
  if (v6 || !*(_DWORD *)(a1 + 44))
    goto LABEL_41;
  readonly = (void *)xpc_shmem_create_readonly();
  v8 = xpc_shmem_create(*(void **)(a1 + 24), *MEMORY[0x24BDB03C8]);
  v9 = (void *)xpc_mach_send_create_with_disposition();
  v10 = xpc_mach_send_create_with_disposition();
  v11 = (void *)v10;
  if (readonly)
    v12 = v8 == 0;
  else
    v12 = 1;
  v14 = v12 || v9 == 0 || v10 == 0;
  v15 = !v14;
  if (!v14)
  {
    xpc_dictionary_set_BOOL(v3, "CHChannelEndpointRequestV2", 1);
    xpc_dictionary_set_value(v3, "CHChannelEndpointRingBufferV2", readonly);
    xpc_dictionary_set_uint64(v3, "CHChannelEndpointRingBufferPagesV2", *(unsigned int *)(a1 + 4));
    xpc_dictionary_set_value(v3, "CHChannelEndpointCASPageV2", v8);
    xpc_dictionary_set_value(v3, "CHChannelEndpointDeadNameNotifyPortV2", v9);
    xpc_dictionary_set_value(v3, "CHChannelEndpointMsgNotifyPortV2", v11);
  }

LABEL_40:
LABEL_42:

  return v15;
}

void sub_24BA635A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

BOOL is_open(Endpoint *a1)
{
  BOOL v1;
  BOOL v4;
  uint64_t v5;
  BOOL v6;

  if (*((_DWORD *)a1 + 1))
    v1 = *((_QWORD *)a1 + 1) == 0;
  else
    v1 = 1;
  v4 = v1 || *((_QWORD *)a1 + 3) == 0 || *((_DWORD *)a1 + 9) == 0 || *((_DWORD *)a1 + 11) == 0;
  v5 = 0;
  if (!v4)
  {
    if (*((_QWORD *)a1 + 2))
      v6 = *((_DWORD *)a1 + 8) == 0;
    else
      v6 = 1;
    if (!v6 && *((_BYTE *)a1 + 40) != 0)
      return *((_DWORD *)a1 + 12) != 0;
  }
  return v5;
}

BOOL Endpoint::decode_reply(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  ipc_space_t *v6;
  BOOL v7;
  char v8;
  _BOOL8 v9;
  mach_port_t previous;

  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)a1 && xpc_dictionary_get_BOOL(v3, "CHChannelEndpointReplyV2"))
  {
    xpc_dictionary_get_value(v4, "CHChannelEndpointRingBufferV2");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(a1 + 16) = MessageRingBuffer::from_xpc(v5);

    *(_DWORD *)(a1 + 32) = xpc_dictionary_copy_mach_send();
    *(_DWORD *)(a1 + 48) = xpc_dictionary_copy_mach_send();
    previous = 0;
    v6 = (ipc_space_t *)MEMORY[0x24BDAEC58];
    *(_BYTE *)(a1 + 40) = mach_port_request_notification(*MEMORY[0x24BDAEC58], *(_DWORD *)(a1 + 32), 72, 1u, *(_DWORD *)(a1 + 36), 0x15u, &previous) == 0;
    if (mach_port_request_notification(*v6, *(_DWORD *)(a1 + 48), 72, 1u, *(_DWORD *)(a1 + 44), 0x15u, &previous))
      v7 = 1;
    else
      v7 = *(_BYTE *)(a1 + 40) == 0;
    v8 = !v7;
    *(_BYTE *)(a1 + 40) = v8;
  }
  v9 = is_open((Endpoint *)a1);

  return v9;
}

void sub_24BA63778(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void channel_endpoint_dispose(uint64_t a1)
{
  Endpoint::~Endpoint((Endpoint *)(a1 + 16));
}

void channel_rt_dispose(uint64_t a1)
{
  RTChannel::~RTChannel((RTChannel *)(a1 + 24));
}

void channel_dispatch_dispose(id *a1)
{
  Channel *v2;

  v2 = (Channel *)(a1 + 3);

  Channel::~Channel(v2);
}

void channel_dispatch_xref_dispose(uint64_t a1)
{
  DispatchChannel::cancel((dispatch_source_t *)(a1 + 24));
}

uint64_t channel_create_asymmetric_endpoint_and_request(unsigned int a1, unsigned int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  _BYTE v9[56];

  v5 = a3;
  v6 = v5;
  v7 = 0;
  if (a1 && a2 && v5)
  {
    if (MEMORY[0x24BD2CDCC](v5) == MEMORY[0x24BDACFA0])
    {
      Endpoint::Endpoint((Endpoint *)v9, a1, a2);
      if ((Endpoint::encode((uint64_t)v9, v6) & 1) != 0)
      {
        v7 = channel_endpoint_obj_alloc();
        Endpoint::Endpoint(v7 + 16, v9);
      }
      else
      {
        v7 = 0;
      }
      Endpoint::~Endpoint((Endpoint *)v9);
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

void sub_24BA638BC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);
  Endpoint::~Endpoint((Endpoint *)va);

  _Unwind_Resume(a1);
}

uint64_t channel_rt_create_from_request(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  uint64_t v11;
  _BYTE v12[8];
  uint64_t v13;
  __int128 *v14;
  uint64_t v15;
  int v16;
  int v17;
  int v18;
  int v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;

  v3 = a1;
  v4 = a2;
  if (!v3)
    goto LABEL_10;
  v5 = MEMORY[0x24BD2CDCC](v3);
  v6 = 0;
  if (!v4)
    goto LABEL_9;
  v7 = MEMORY[0x24BDACFA0];
  if (v5 != MEMORY[0x24BDACFA0])
    goto LABEL_9;
  if (MEMORY[0x24BD2CDCC](v4) != v7)
  {
LABEL_10:
    v6 = 0;
    goto LABEL_9;
  }
  Endpoint::Endpoint(v12, v3);
  if ((Endpoint::encode((uint64_t)v12, v4) & 1) != 0)
  {
    v6 = channel_rt_obj_alloc();
    v8 = *(_QWORD *)(v13 + 16);
    v10 = *v14;
    v11 = *((_QWORD *)v14 + 2);
    v22 = *(_OWORD *)v13;
    v23 = v8;
    v20 = v10;
    v21 = v11;
    *(_QWORD *)(v6 + 16) = Channel::Channel(v6 + 24, 0, &v22, (uint64_t)&v20, v15, v16, v17, v19, v18);
    Endpoint::release((Endpoint *)v12);
  }
  else
  {
    v6 = 0;
  }
  Endpoint::~Endpoint((Endpoint *)v12);
LABEL_9:

  return v6;
}

void sub_24BA63A0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  void *v10;
  void *v11;
  va_list va;

  va_start(va, a10);
  Endpoint::~Endpoint((Endpoint *)va);

  _Unwind_Resume(a1);
}

uint64_t channel_rt_create_from_reply(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 *v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;

  v3 = a2;
  v4 = v3;
  v5 = 0;
  if (a1 && v3)
  {
    if (MEMORY[0x24BD2CDCC](v3) == MEMORY[0x24BDACFA0] && Endpoint::decode_reply(a1 + 16, v4))
    {
      v5 = channel_rt_obj_alloc();
      v6 = *(_QWORD *)(a1 + 24);
      v7 = *(__int128 **)(a1 + 32);
      v15 = *(_QWORD *)(v6 + 16);
      v13 = *v7;
      v14 = *((_QWORD *)v7 + 2);
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(_DWORD *)(a1 + 48);
      v10 = *(_DWORD *)(a1 + 52);
      LODWORD(v7) = *(_DWORD *)(a1 + 60);
      v11 = *(_DWORD *)(a1 + 64);
      v18 = *(_OWORD *)v6;
      v19 = v15;
      v16 = v13;
      v17 = v14;
      *(_QWORD *)(v5 + 16) = Channel::Channel(v5 + 24, 1, &v18, (uint64_t)&v16, v8, v9, v10, v11, (int)v7);
      Endpoint::release((Endpoint *)(a1 + 16));
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

void sub_24BA63B2C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void channel_dispatch_cancel(uint64_t a1)
{
  DispatchChannel::cancel((dispatch_source_t *)(a1 + 24));
}

uint64_t channel_rt_close(uint64_t a1)
{
  return RTChannel::close(a1 + 24);
}

BOOL channel_rt_poll_closed(uint64_t a1)
{
  return RTChannel::poll_closed((RTChannel *)(a1 + 24));
}

BOOL channel_dispatch_is_closed(uint64_t a1)
{
  unsigned int v1;

  v1 = atomic_load((unsigned int *)(a1 + 96));
  return v1 == 0;
}

BOOL channel_rt_receive_message(uint64_t a1, int a2, _QWORD *a3, _QWORD *a4, _DWORD *a5)
{
  int v8;
  uint64_t v9;
  int v10;
  _BOOL8 result;
  _DWORD v12[4];
  uint64_t v13;
  unsigned __int8 v14;

  RTChannel::receive_message((unint64_t **)(a1 + 24), a2, v12);
  v8 = v14;
  if (v14)
  {
    v9 = v13 + 8;
    v10 = v12[1];
    *a4 = (v12[0] - 8);
    *a5 = v10;
  }
  else
  {
    v9 = 0;
  }
  result = v8 != 0;
  *a3 = v9;
  return result;
}

BOOL channel_rt_pop_message(uint64_t a1, _QWORD *a2, _QWORD *a3, _DWORD *a4)
{
  int v7;
  uint64_t v8;
  int v9;
  _BOOL8 result;
  _DWORD v11[4];
  uint64_t v12;
  unsigned __int8 v13;

  RTChannel::pop_message((RTChannel *)(a1 + 24), v11);
  v7 = v13;
  if (v13)
  {
    v8 = v12 + 8;
    v9 = v11[1];
    *a3 = (v11[0] - 8);
    *a4 = v9;
  }
  else
  {
    v8 = 0;
  }
  result = v7 != 0;
  *a2 = v8;
  return result;
}

uint64_t channel_rt_wait_message(uint64_t a1, int a2)
{
  return RTChannel::wait_message((RTChannel *)(a1 + 24), a2);
}

BOOL channel_rt_probe_message(uint64_t a1)
{
  return RTChannel::probe_message((unint64_t **)(a1 + 24));
}

BOOL channel_rt_wire(uint64_t a1)
{
  return RTChannel::wire((const void **)(a1 + 24));
}

uint64_t channel_rt_unwire(uint64_t a1)
{
  return RTChannel::unwire((const void **)(a1 + 24));
}

_DWORD *channel_reserve_aligned_message(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  _DWORD *v5;

  if ((a2 - 0x40000000) < 0xC0000400 || a4 == 0)
    return 0;
  v5 = Channel::reserve_message(*(Channel **)(a1 + 16), a2, a3, a4);
  if (v5)
    return v5 + 2;
  else
    return 0;
}

unint64_t channel_commit_message(uint64_t a1, uint64_t a2)
{
  return Channel::commit_message(*(Channel **)(a1 + 16), a2 - 8);
}

unint64_t channel_abandon_message(uint64_t a1, uint64_t a2)
{
  return Channel::abandon_message(*(Channel **)(a1 + 16), a2 - 8);
}

uint64_t channel_get_readwrite_shared_memory(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  *a3 = *MEMORY[0x24BDB03C8] - 512;
  *a2 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 16) + 512;
  return 1;
}

uint64_t channel_get_readonly_shared_memory(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  *a3 = *MEMORY[0x24BDB03C8] - 512;
  *a2 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 40) + 512;
  return 1;
}

unint64_t channel_bytes_sent(uint64_t a1)
{
  uint64_t v2;

  v2 = **(_QWORD **)(*(_QWORD *)(a1 + 16) + 56);
  return AssertableValue::value((AssertableValue *)&v2);
}

uint64_t channel_bytes_received(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 16) + 256);
}

uint64_t channel_dispatch_create_from_request(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  _BYTE v19[8];
  __int128 *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  int v24;
  int v25;
  int v26;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (v5)
  {
    v8 = MEMORY[0x24BD2CDCC](v5);
    v9 = 0;
    if (v6)
    {
      v10 = MEMORY[0x24BDACFA0];
      if (v8 == MEMORY[0x24BDACFA0])
      {
        v11 = MEMORY[0x24BD2CDCC](v6);
        v9 = 0;
        if (v7)
        {
          if (v11 == v10)
          {
            Endpoint::Endpoint(v19, v5);
            if ((Endpoint::encode((uint64_t)v19, v6) & 1) != 0)
            {
              v9 = channel_dispatch_obj_alloc();
              v12 = *((_QWORD *)v20 + 2);
              v17 = *v20;
              v18 = v12;
              v13 = *(_QWORD *)(v21 + 16);
              v15 = *(_OWORD *)v21;
              v16 = v13;
              *(_QWORD *)(v9 + 16) = DispatchChannel::DispatchChannel(v9 + 24, 0, (uint64_t)&v17, &v15, v22, v23, v24, v26, v25, v7, v9);
              Endpoint::release((Endpoint *)v19);
            }
            else
            {
              v9 = 0;
            }
            Endpoint::~Endpoint((Endpoint *)v19);
          }
        }
      }
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void sub_24BA63EA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  void *v12;
  void *v13;
  void *v14;
  va_list va;

  va_start(va, a12);
  Endpoint::~Endpoint((Endpoint *)va);

  _Unwind_Resume(a1);
}

uint64_t channel_dispatch_create_from_reply(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  __int128 *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;

  v5 = a2;
  v6 = a3;
  v7 = 0;
  if (a1)
  {
    if (v5)
    {
      v8 = MEMORY[0x24BD2CDCC](v5);
      v7 = 0;
      if (v6)
      {
        if (v8 == MEMORY[0x24BDACFA0])
        {
          if (Endpoint::decode_reply(a1 + 16, v5))
          {
            v7 = channel_dispatch_obj_alloc();
            v9 = *(__int128 **)(a1 + 24);
            v10 = *(_QWORD *)(a1 + 32);
            v11 = *((_QWORD *)v9 + 2);
            v16 = *v9;
            v17 = v11;
            v12 = *(_QWORD *)(v10 + 16);
            v14 = *(_OWORD *)v10;
            v15 = v12;
            *(_QWORD *)(v7 + 16) = DispatchChannel::DispatchChannel(v7 + 24, 1, (uint64_t)&v16, &v14, *(_QWORD *)(a1 + 40), *(_DWORD *)(a1 + 48), *(_DWORD *)(a1 + 52), *(_DWORD *)(a1 + 64), *(_DWORD *)(a1 + 60), v6, v7);
            Endpoint::release((Endpoint *)(a1 + 16));
          }
          else
          {
            v7 = 0;
          }
        }
      }
    }
  }

  return v7;
}

void sub_24BA63FD4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void channel_dispatch_activate(uint64_t a1)
{
  DispatchChannel::activate_no_check((dispatch_object_t *)(a1 + 24));
}

void channel_dispatch_try_activate(uint64_t a1)
{
  DispatchChannel::try_activate((dispatch_object_t *)(a1 + 24));
}

uint64_t channel_dispatch_set_message_handler(uint64_t a1, uint64_t a2)
{
  return DispatchChannel::set_message_handler(a1 + 24, a2);
}

uint64_t channel_dispatch_set_cancel_handler(uint64_t a1, uint64_t a2)
{
  return DispatchChannel::set_close_handler(a1 + 24, a2);
}

void CASPage::allocate(mach_error_t a1)
{
  int v1;
  char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = mach_error_string(a1);
  _os_log_error_impl(&dword_24BA60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "CASPage::allocate failed: %s", (uint8_t *)&v1, 0xCu);
}

void MessageRingBufferSharedMemory::allocate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_24BA60000, MEMORY[0x24BDACB70], a3, "message_pages value of %u is too large - data_size overflowed. Not allocating ringbuffer", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0(&dword_24BA60000, MEMORY[0x24BDACB70], a3, "message_pages value of %u is too large - virtual_size overflowed. Not allocating ringbuffer", a5, a6, a7, a8, 0);
}

void MessageRingBufferSharedMemory::allocate(mach_error_t a1)
{
  int v1;
  char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = mach_error_string(a1);
  _os_log_error_impl(&dword_24BA60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "MessageRingBuffer ringbuffer mach_vm_remap failed: %s", (uint8_t *)&v1, 0xCu);
}

void MessageRingBufferSharedMemory::allocate(mach_error_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 134218242;
  v3 = a2;
  v4 = 2080;
  v5 = mach_error_string(a1);
  _os_log_error_impl(&dword_24BA60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "MessageRingBuffer mach_vm_allocate %llu bytes failed: %s", (uint8_t *)&v2, 0x16u);
}

void allocate_recv_right(mach_error_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  mach_error_string(a1);
  OUTLINED_FUNCTION_0_0(&dword_24BA60000, MEMORY[0x24BDACB70], v1, "Unable to allocate mach receive right %s", v2, v3, v4, v5, 2u);
}

void Endpoint::Endpoint(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_24BA60000, MEMORY[0x24BDACB70], a3, "Item at key (%s) was not a XPC_TYPE_SHMEM, not retrieving", a5, a6, a7, a8, 2u);
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
  return off_251CCD630();
}

uint64_t operator new()
{
  return off_251CCD638();
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x24BDACB58]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x24BDACBA8]();
}

uint64_t _os_object_alloc()
{
  return MEMORY[0x24BDACBD0]();
}

uint64_t _os_object_release()
{
  return MEMORY[0x24BDACBE0]();
}

uint64_t _os_object_release_internal()
{
  return MEMORY[0x24BDACBE8]();
}

uint64_t _os_object_retain_internal()
{
  return MEMORY[0x24BDACBF8]();
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

uint64_t dispatch_source_set_mandatory_cancel_handler()
{
  return MEMORY[0x24BDADFC0]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x24BDAEB58](*(_QWORD *)&error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x24BDAEB80](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x24BDAEBA0](*(_QWORD *)&task, *(_QWORD *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x24BDAEBB0](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x24BDAEBF8](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, *(_QWORD *)&delta);
}

kern_return_t mach_port_request_notification(ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_t notify, mach_msg_type_name_t notifyPoly, mach_port_t *previous)
{
  return MEMORY[0x24BDAEC08](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&msgid, *(_QWORD *)&sync, *(_QWORD *)&notify, *(_QWORD *)&notifyPoly, previous);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

kern_return_t mach_vm_allocate(vm_map_t target, mach_vm_address_t *address, mach_vm_size_t size, int flags)
{
  return MEMORY[0x24BDAEC70](*(_QWORD *)&target, address, size, *(_QWORD *)&flags);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x24BDAEC78](*(_QWORD *)&target, address, size);
}

kern_return_t mach_vm_remap(vm_map_t target_task, mach_vm_address_t *target_address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, vm_map_t src_task, mach_vm_address_t src_address, BOOLean_t copy, vm_prot_t *cur_protection, vm_prot_t *max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x24BDAECB8](*(_QWORD *)&target_task, target_address, size, mask, *(_QWORD *)&flags, *(_QWORD *)&src_task, src_address, *(_QWORD *)&copy);
}

int mlock(const void *a1, size_t a2)
{
  return MEMORY[0x24BDAEFA0](a1, a2);
}

int munlock(const void *a1, size_t a2)
{
  return MEMORY[0x24BDAEFE8](a1, a2);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_release(void *object)
{
  MEMORY[0x24BDAF3F0](object);
}

void *__cdecl os_retain(void *object)
{
  return (void *)MEMORY[0x24BDAF3F8](object);
}

uint64_t realtime_runtime_check_pop_authorization()
{
  return MEMORY[0x24BEDDC60]();
}

uint64_t realtime_runtime_check_push_authorization()
{
  return MEMORY[0x24BEDDC68]();
}

uint64_t xpc_dictionary_copy_mach_send()
{
  return MEMORY[0x24BDB08B8]();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0908](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0958](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

uint64_t xpc_mach_send_create_with_disposition()
{
  return MEMORY[0x24BDB0AA0]();
}

xpc_object_t xpc_shmem_create(void *region, size_t length)
{
  return (xpc_object_t)MEMORY[0x24BDB0B60](region, length);
}

uint64_t xpc_shmem_create_readonly()
{
  return MEMORY[0x24BDB0B68]();
}

